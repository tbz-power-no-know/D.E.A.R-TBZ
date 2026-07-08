import { supabase } from './supabase.js'

function requireSupabase() {
  if (!supabase) {
    throw new Error('Supabase not configured. Add VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY to .env')
  }
}

export async function fetchPodcasts(limit = null) {
  requireSupabase()
  let query = supabase
    .from('podcasts')
    .select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `)
    .order('published_at', { ascending: false })

  if (limit) {
    query = query.limit(limit)
  }

  const { data, error } = await query
  if (error) throw error
  return data
}

export async function fetchPodcastById(id) {
  requireSupabase()
  const { data, error } = await supabase
    .from('podcasts')
    .select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `)
    .eq('id', id)
    .single()

  if (error) throw error
  return data
}

export async function fetchCategories() {
  requireSupabase()
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('name')

  if (error) throw error
  return data
}

export async function fetchPodcastsByCategory(categoryId) {
  requireSupabase()
  const { data, error } = await supabase
    .from('podcasts')
    .select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `)
    .eq('category_id', categoryId)
    .order('published_at', { ascending: false })

  if (error) throw error
  return data
}

export async function searchPodcasts(query) {
  requireSupabase()
  const { data, error } = await supabase
    .from('podcasts')
    .select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `)
    .or(`title.ilike.%${query.replace(/[\-\\%_]/g, '\\$&')}%,description.ilike.%${query.replace(/[\-\\%_]/g, '\\$&')}%`)
    .order('published_at', { ascending: false })

  if (error) throw error
  return data
}

// Send a contact message through the `contact` Edge Function (server-side write).
// The function validates the input and inserts with the service_role key, so the
// browser never writes to the database directly.
export async function sendContactMessage({ name, email, subject, message, company }) {
  requireSupabase()
  const { data, error } = await supabase.functions.invoke('contact', {
    body: { name, email, subject, message, company },
  })

  if (error) throw error
  return data
}

export async function subscribeNewsletter(email) {
  requireSupabase()
  const { error } = await supabase
    .from('newsletter_subscribers')
    .insert({ email: email.toLowerCase().trim() })

  if (error) {
    if (error.code === '23505') {
      return 'already-subscribed'
    }
    throw error
  }
  return 'subscribed'
}
