import { fetchPodcastById } from "./data.js";
import { getDominantColor } from "./colorExtract.js";

export async function initPodcastDetail() {
  const container = document.getElementById("podcast-detail");
  if (!container) return;

  const params = new URLSearchParams(window.location.search);
  const id = params.get("id");

  if (!id) {
    container.innerHTML =
      '<p class="loading-text">Kein Podcast ausgewählt.</p>';
    return;
  }

  try {
    const podcast = await fetchPodcastById(id);
    renderPodcast(podcast, container);
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Fehler: ${error.message}</p>`;
  }
}

function renderPodcast(podcast, container) {
  const presenters =
    podcast.podcast_presenters?.map((pp) => pp.presenters).filter(Boolean) ||
    [];

  container.innerHTML = `
    <a href="podcasts.html" class="detail-back">&larr; Alle Podcasts</a>
    <div class="detail-cover-wrapper">
      <img class="detail-cover" src="${podcast.cover_url || ""}" alt="${podcast.title}" />
    </div>

    <h1 class="detail-title">${podcast.title}</h1>
    <p class="detail-meta">
      ${podcast.categories?.name || ""}
      ${podcast.duration ? ` • ${formatDuration(podcast.duration)}` : ""}
    </p>

    <div class="detail-description">
      <p>${podcast.description}</p>
    </div>

    ${
      presenters.length > 0
        ? `
      <section class="detail-presenter">
        <h2>Präsentator${presenters.length > 1 ? "innen" : ""}</h2>
        ${presenters.map(renderPresenter).join("")}
      </section>
    `
        : ""
    }

    ${
      podcast.audio_url
        ? `
      <section class="detail-audio">
        <div class="detail-audio-inner">
          <audio controls src="${podcast.audio_url}"></audio>
        </div>
      </section>
    `
        : ""
    }

    ${
      podcast.transcription
        ? `
      <section class="detail-transcription">
        <h2>Transkription</h2>
        <div class="transcription-text">${formatTranscription(podcast.transcription)}</div>
      </section>
    `
        : ""
    }
    <a href="podcasts.html" class="detail-back">&larr; Alle Podcasts</a>
  `;

  const audioEl = container.querySelector("audio");
  const transcriptionEl = container.querySelector(".transcription-text");
  initTranscriptionSync(audioEl, transcriptionEl);

  if (podcast.cover_url) {
    const coverWrapper = container.querySelector(".detail-cover-wrapper");
    getDominantColor(podcast.cover_url).then((color) => {
      if (color) coverWrapper.style.backgroundColor = color;
    });
  }

  const audioSection = container.querySelector(".detail-audio");
  if (audioSection) {
    const updateAudioStickyTop = () => {
      const header = document.querySelector("header");
      const headerHeight =
        parseInt(
          getComputedStyle(document.documentElement).getPropertyValue(
            "--header-height",
          ),
        ) || 0;
      const headerVisible = header
        ? !header.classList.contains("header-hidden")
        : false;
      const offset = headerVisible ? headerHeight + 8 : 8;
      audioSection.style.setProperty("--audio-sticky-top", offset + "px");
    };

    updateAudioStickyTop();
    window.addEventListener("header-visibility-changed", updateAudioStickyTop);
    window.addEventListener("resize", updateAudioStickyTop);
  }
}

function renderPresenter(presenter) {
  return `
    <div class="presenter-card">
      ${presenter.photo_url ? `<img class="presenter-photo" src="${presenter.photo_url}" alt="${presenter.name}" />` : ""}
      <div>
        <p class="presenter-name">${presenter.name}</p>
        ${presenter.bio ? `<p class="presenter-bio">${presenter.bio}</p>` : ""}
      </div>
    </div>
  `;
}

function formatTranscription(text) {
  return text.replace(
    /\[([0-9]{2}:[0-9]{2})\]/g,
    '<span class="timestamp" data-time="$1">[$1]</span>',
  );
}

function initTranscriptionSync(audioEl, transcriptionEl) {
  if (!audioEl || !transcriptionEl) return;

  const timestamps = Array.from(transcriptionEl.querySelectorAll(".timestamp"))
    .map((el) => ({
      el,
      time: parseTime(el.dataset.time),
    }))
    .sort((a, b) => a.time - b.time);

  if (timestamps.length === 0) return;

  let activeIndex = -1;

  audioEl.addEventListener("timeupdate", () => {
    const current = audioEl.currentTime;

    let idx = -1;
    for (let i = timestamps.length - 1; i >= 0; i--) {
      if (current >= timestamps[i].time) {
        idx = i;
        break;
      }
    }

    if (idx !== activeIndex) {
      if (activeIndex >= 0) {
        timestamps[activeIndex].el.classList.remove("active");
        timestamps[activeIndex].el.classList.remove("pause");
      }
      activeIndex = idx;
      if (activeIndex >= 0) {
        audioEl.paused
          ? timestamps[activeIndex].el.classList.add("pause")
          : timestamps[activeIndex].el.classList.add("active");
        timestamps[activeIndex].el.scrollIntoView({
          behavior: "smooth",
          block: "center",
        });
      }
    }
  });

  audioEl.addEventListener("pause", () => {
    if (activeIndex >= 0) {
      timestamps[activeIndex].el.classList.remove("active");
      timestamps[activeIndex].el.classList.add("pause");
    }
  });

  audioEl.addEventListener("play", () => {
    if (activeIndex >= 0) {
      timestamps[activeIndex].el.classList.remove("pause");
      timestamps[activeIndex].el.classList.add("active");
    }
  });

  audioEl.addEventListener("ended", () => {
    if (activeIndex >= 0) {
      timestamps[activeIndex].el.classList.remove("active");
      activeIndex = -1;
    }
  });

  audioEl.addEventListener("seeking", () => {
    if (activeIndex >= 0) {
      timestamps[activeIndex].el.classList.remove("active");
      timestamps[activeIndex].el.classList.remove("pause");
      activeIndex = -1;
    }
  });

  timestamps.forEach((ts) => {
    ts.el.addEventListener("click", () => {
      audioEl.currentTime = ts.time;
      audioEl.play().catch(() => {});
    });
  });
}

function parseTime(timeStr) {
  const parts = timeStr.split(":");
  return parseInt(parts[0]) * 60 + parseInt(parts[1]);
}

function formatDuration(duration) {
  if (!duration) return "";
  const match = duration.match(/(\d+) days? (\d+):(\d+):(\d+)/);
  if (match) {
    const hours = parseInt(match[2]);
    const minutes = parseInt(match[3]);
    const seconds = parseInt(match[4]);
    if (hours > 0) {
      return `${hours} Std. ${minutes} Min.`;
    }
    return `${minutes} Min. ${seconds} Sek.`;
  }
  return duration;
}
