import { fetchPodcasts, fetchCategories } from './data.js'

let allPodcasts = []
let sortOrder = 'newest'

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

    const sortBtn = document.getElementById('sort-toggle')
    if (sortBtn) {
      sortBtn.addEventListener('click', () => {
        sortOrder = sortOrder === 'newest' ? 'oldest' : 'newest'
        sortBtn.textContent = sortOrder === 'newest' ? 'Newest first' : 'Oldest first'
        sortBtn.classList.toggle('active', sortOrder === 'oldest')

        const activeFilter = document.querySelector('.filter-btn.active')
        const categoryId = activeFilter ? activeFilter.dataset.category : 'all'
        handleFilter(categoryId, activeFilter)
      })
    }

    window.addEventListener('search-clear', () => {
      const activeFilter = document.querySelector('.filter-btn.active')
      const categoryId = activeFilter ? activeFilter.dataset.category : 'all'
      handleFilter(categoryId, activeFilter)
    })
  } catch (error) {
    gridContainer.innerHTML = `<p class="loading-text">Error: ${error.message}</p>`
  }
}

function handleFilter(categoryId, clickedBtn) {
  const buttons = document.querySelectorAll('.filter-btn')
  buttons.forEach((btn) => btn.classList.remove('active'))
  if (clickedBtn) clickedBtn.classList.add('active')

  const gridContainer = document.getElementById('podcasts-grid')

  let filtered
  if (categoryId === 'all') {
    filtered = [...allPodcasts]
  } else {
    filtered = allPodcasts.filter((p) => p.category_id === categoryId)
  }

  filtered.sort((a, b) => {
    const dateA = new Date(a.published_at).getTime()
    const dateB = new Date(b.published_at).getTime()
    return sortOrder === 'newest' ? dateB - dateA : dateA - dateB
  })

  renderPodcasts(filtered, gridContainer)
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
