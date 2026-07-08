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
  const loadingEl = container.previousElementSibling
  loadingEl.textContent = 'Wird durchsucht…'
  loadingEl.style.display = ''

  try {
    const results = await searchPodcasts(query)
    container.innerHTML = ''

    if (results.length === 0) {
      loadingEl.textContent = 'Keine Ergebnisse gefunden.'
      return
    }

    loadingEl.style.display = 'none'

    results.forEach((podcast) => {
      const li = document.createElement('li')
      const card = document.createElement('a')
      card.href = `podcast-detail.html?id=${podcast.id}`
      card.className = 'podcast-card'

      card.innerHTML = `
        <div class="cover-wrapper">
          <img class="podcast-cover" src="${podcast.cover_url || ''}" alt="${podcast.title}" />
        </div>
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${podcast.title}</h3>
          <p class="podcast-card-description expandable-text">${podcast.description}</p>
          <span class="expand-btn" role="button" tabindex="0" aria-expanded="false">Mehr anzeigen</span>
        </div>
      `

      li.appendChild(card)
      container.appendChild(li)
    })
  } catch (error) {
    loadingEl.textContent = `Fehler: ${error.message}`
  }
}
