import { fetchPodcasts, fetchCategories } from './data.js'

export function initNewsletter() {
  const form = document.querySelector('.newsletter-form')
  if (!form) return

  const input = document.getElementById('newsletter-email')
  const status = document.querySelector('.newsletter-status')
  const btn = form.querySelector('.newsletter-btn')

  form.addEventListener('submit', (e) => {
    e.preventDefault()
    status.textContent = ''
    status.className = 'newsletter-status'

    const email = input.value.trim()

    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      status.textContent = 'Please enter a valid email address.'
      status.className = 'newsletter-status is-error'
      return
    }

    btn.disabled = true
    btn.textContent = 'Sending...'

    setTimeout(() => {
      status.textContent = 'Thanks! You\'re subscribed.'
      status.className = 'newsletter-status is-success'
      input.value = ''
      btn.disabled = false
      btn.textContent = 'Subscribe'
    }, 800)
  })
}

export async function renderLatestPodcasts(container, limit = 3) {
  try {
    const podcasts = await fetchPodcasts(limit)
    container.innerHTML = ''

    if (podcasts.length === 0) {
      container.innerHTML = '<p class="loading-text">No podcasts yet.</p>'
      return
    }

    podcasts.forEach((podcast) => {
      const card = document.createElement('a')
      card.href = `podcast-detail.html?id=${podcast.id}`
      card.className = 'podcast-card'

      card.innerHTML = `
        <img class="podcast-cover" src="${podcast.cover_url || ''}" alt="${podcast.title}" />
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${podcast.title}</h3>
          <p class="podcast-card-description">${podcast.description}</p>
        </div>
      `

      container.appendChild(card)
    })
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Error loading podcasts: ${error.message}</p>`
  }
}

export async function renderCategories(container) {
  try {
    const categories = await fetchCategories()
    container.innerHTML = ''

    if (categories.length === 0) {
      container.innerHTML = '<p class="loading-text">No categories yet.</p>'
      return
    }

    categories.forEach((category) => {
      const card = document.createElement('a')
      card.href = `podcasts.html?category=${category.id}`
      card.className = 'category-card'
      if (category.color) {
        card.style.backgroundColor = category.color
      }

      card.innerHTML = `
        ${category.image_url ? `<img class="category-image" src="${category.image_url}" alt="${category.name}" />` : ''}
        <h3>${category.name}</h3>
        <span class="category-link">View podcasts →</span>
      `

      container.appendChild(card)
    })
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Error loading categories: ${error.message}</p>`
  }
}
