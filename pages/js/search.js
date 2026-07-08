import { searchPodcasts } from './data.js'

let debounceTimer = null

export function initSearch() {
  const searchInput = document.getElementById('search-input')
  const gridContainer = document.getElementById('podcasts-grid')

  if (!searchInput || !gridContainer) return

  searchInput.addEventListener('input', (e) => {
    clearTimeout(debounceTimer)
    debounceTimer = setTimeout(() => {
      const query = e.target.value.trim()
      if (query.length === 0) {
        window.location.hash = ''
        window.dispatchEvent(new CustomEvent('search-clear'))
        return
      }
      performSearch(query, gridContainer)
    }, 300)
  })
}

async function performSearch(query, container) {
  container.innerHTML = '<p class="loading-text">Wird durchsucht…</p>'

  try {
    const results = await searchPodcasts(query)
    container.innerHTML = ''

    if (results.length === 0) {
      container.innerHTML = '<p class="loading-text">Keine Ergebnisse gefunden.</p>'
      return
    }

    results.forEach((podcast) => {
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
    container.innerHTML = `<p class="loading-text">Fehler: ${error.message}</p>`
  }
}
