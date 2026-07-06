import { renderHeader } from './shared/Header.js'
import { renderFooter } from './shared/Footer.js'
import { initExpandable } from './expandable.js'
import { initDarkMode } from './darkmode.js'
import { renderLatestPodcasts, renderCategories, initNewsletter } from './home.js'
import { initFilter } from './filter.js'
import { initSearch } from './search.js'
import { initPodcastDetail } from './podcast-detail.js'
import { initContactForm } from './contact.js'

initDarkMode()
renderHeader()
renderFooter()
initExpandable()

document.body.insertAdjacentHTML('afterbegin', `
  <div class="bg-circles">
    <div class="bg-circle bg-circle-1"></div>
    <div class="bg-circle bg-circle-2"></div>
    <div class="bg-circle bg-circle-3"></div>
  </div>
`)

if (document.getElementById('latest-podcasts')) {
  renderLatestPodcasts(document.getElementById('latest-podcasts'))
}

if (document.getElementById('categories-list')) {
  renderCategories(document.getElementById('categories-list'))
}

if (document.querySelector('.newsletter-form')) {
  initNewsletter()
}

if (document.getElementById('podcasts-grid')) {
  initFilter()
  initSearch()
}

if (document.getElementById('podcast-detail')) {
  initPodcastDetail()
}

const contactForm = document.querySelector('.contact-form')
if (contactForm) {
  initContactForm(contactForm)
}
