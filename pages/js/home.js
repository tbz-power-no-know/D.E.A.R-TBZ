import { fetchPodcasts, fetchCategories } from './data.js'

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
      const card = document.createElement('div')
      card.className = 'category-card'

      card.innerHTML = `
        <h3>${category.name}</h3>
        <a href="podcasts.html?category=${category.id}">View podcasts →</a>
      `

      container.appendChild(card)
    })
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Error loading categories: ${error.message}</p>`
  }
}
