import { supabase } from './supabase.js'

export async function fetchPodcasts(limit = null) {
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
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('name')

  if (error) throw error
  return data
}

export async function fetchPodcastsByCategory(categoryId) {
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
  const { data, error } = await supabase
    .from('podcasts')
    .select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `)
    .or(`title.ilike.%${query}%,description.ilike.%${query}%`)
    .order('published_at', { ascending: false })

  if (error) throw error
  return data
}
