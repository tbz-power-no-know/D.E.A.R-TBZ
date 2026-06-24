import { renderHeader } from './shared/Header.js'
import { renderFooter } from './shared/Footer.js'
import { initExpandable } from './expandable.js'
import { renderLatestPodcasts, renderCategories } from './home.js'

renderHeader()
renderFooter()
initExpandable()

if (document.getElementById('latest-podcasts')) {
  renderLatestPodcasts(document.getElementById('latest-podcasts'))
}

if (document.getElementById('categories-list')) {
  renderCategories(document.getElementById('categories-list'))
}
