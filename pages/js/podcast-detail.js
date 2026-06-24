import { fetchPodcastById } from './data.js'

export async function initPodcastDetail() {
  const container = document.getElementById('podcast-detail')
  if (!container) return

  const params = new URLSearchParams(window.location.search)
  const id = params.get('id')

  if (!id) {
    container.innerHTML = '<p class="loading-text">No podcast selected.</p>'
    return
  }

  try {
    const podcast = await fetchPodcastById(id)
    renderPodcast(podcast, container)
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Error: ${error.message}</p>`
  }
}

function renderPodcast(podcast, container) {
  const presenters = podcast.podcast_presenters?.map((pp) => pp.presenters).filter(Boolean) || []

  container.innerHTML = `
    <img class="detail-cover" src="${podcast.cover_url || ''}" alt="${podcast.title}" />

    <h1 class="detail-title">${podcast.title}</h1>
    <p class="detail-meta">
      ${podcast.categories?.name || ''}
      ${podcast.duration ? ` • ${formatDuration(podcast.duration)}` : ''}
    </p>

    <div class="detail-description">
      <p>${podcast.description}</p>
    </div>

    ${podcast.transcription ? `
      <section class="detail-transcription">
        <h2>Transcription</h2>
        <div class="transcription-text">${formatTranscription(podcast.transcription)}</div>
      </section>
    ` : ''}

    ${podcast.audio_url ? `
      <section class="detail-audio">
        <audio controls src="${podcast.audio_url}"></audio>
      </section>
    ` : ''}

    ${presenters.length > 0 ? `
      <section class="detail-presenter">
        <h2>Presenter${presenters.length > 1 ? 's' : ''}</h2>
        ${presenters.map(renderPresenter).join('')}
      </section>
    ` : ''}
  `
}

function renderPresenter(presenter) {
  return `
    <div class="presenter-card">
      ${presenter.photo_url ? `<img class="presenter-photo" src="${presenter.photo_url}" alt="${presenter.name}" />` : ''}
      <div>
        <p class="presenter-name">${presenter.name}</p>
        ${presenter.bio ? `<p class="presenter-bio">${presenter.bio}</p>` : ''}
      </div>
    </div>
  `
}

function formatTranscription(text) {
  return text.replace(/\[([0-9]{2}:[0-9]{2})\]/g, '<span class="timestamp" data-time="$1">[$1]</span>')
}

function formatDuration(duration) {
  if (!duration) return ''
  const match = duration.match(/(\d+) days? (\d+):(\d+):(\d+)/)
  if (match) {
    const hours = parseInt(match[2])
    const minutes = parseInt(match[3])
    const seconds = parseInt(match[4])
    if (hours > 0) {
      return `${hours}h ${minutes}m`
    }
    return `${minutes}m ${seconds}s`
  }
  return duration
}
