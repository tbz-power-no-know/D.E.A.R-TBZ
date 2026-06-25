import { fetchPodcasts, fetchCategories } from './data.js'

let allPodcasts = []

export async function initFilter() {
  const filterContainer = document.getElementById('filter-buttons')
  const gridContainer = document.getElementById('podcasts-grid')

  if (!filterContainer || !gridContainer) return

  try {
    const [categories, podcasts] = await Promise.all([
      fetchCategories(),
      fetchPodcasts()
    ])

    allPodcasts = podcasts

    categories.forEach((category) => {
      const btn = document.createElement('button')
      btn.className = 'filter-btn'
      btn.dataset.category = category.id
      btn.textContent = category.name
      btn.addEventListener('click', () => handleFilter(category.id, btn))
      filterContainer.appendChild(btn)
    })

    const allBtn = filterContainer.querySelector('[data-category="all"]')
    if (allBtn) {
      allBtn.addEventListener('click', () => handleFilter('all', allBtn))
      renderPodcasts(podcasts, gridContainer)
    }
  } catch (error) {
    gridContainer.innerHTML = `<p class="loading-text">Error: ${error.message}</p>`
  }
}

function handleFilter(categoryId, clickedBtn) {
  const buttons = document.querySelectorAll('.filter-btn')
  buttons.forEach((btn) => btn.classList.remove('active'))
  clickedBtn.classList.add('active')

  const gridContainer = document.getElementById('podcasts-grid')

  if (categoryId === 'all') {
    renderPodcasts(allPodcasts, gridContainer)
  } else {
    const filtered = allPodcasts.filter((p) => p.category_id === categoryId)
    renderPodcasts(filtered, gridContainer)
  }
}

function renderPodcasts(podcasts, container) {
  container.innerHTML = ''

  if (podcasts.length === 0) {
    container.innerHTML = '<p class="loading-text">No podcasts found.</p>'
    return
  }

  podcasts.forEach((podcast) => {
    const card = document.createElement('a')
    card.href = `podcast-detail.html?id=${podcast.id}`
    card.className = 'podcast-card'
    card.dataset.category = podcast.category_id

    card.innerHTML = `
      <img class="podcast-cover" src="${podcast.cover_url || ''}" alt="${podcast.title}" />
      <div class="podcast-card-content">
        <h3 class="podcast-card-title">${podcast.title}</h3>
        <p class="podcast-card-description">${podcast.description}</p>
      </div>
    `

    container.appendChild(card)
  })
}
