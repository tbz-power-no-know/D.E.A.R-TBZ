import { renderHeader } from './shared/Header.js'
import { renderFooter } from './shared/Footer.js'
import { initExpandable } from './expandable.js'
import { renderLatestPodcasts, renderCategories } from './home.js'
import { initFilter } from './filter.js'
import { initSearch } from './search.js'
import { initContactForm } from './contact.js'

renderHeader()
renderFooter()
initExpandable()

if (document.getElementById('latest-podcasts')) {
  renderLatestPodcasts(document.getElementById('latest-podcasts'))
}

if (document.getElementById('categories-list')) {
  renderCategories(document.getElementById('categories-list'))
}

if (document.getElementById('podcasts-grid')) {
  initFilter()
  initSearch()
}

const contactForm = document.querySelector('.contact-form')
if (contactForm) {
  initContactForm(contactForm)
}
