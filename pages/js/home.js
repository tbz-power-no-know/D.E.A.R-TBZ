import { fetchPodcasts, fetchCategories, subscribeNewsletter } from "./data.js";
import { getDominantColor } from "./colorExtract.js";

const PODCAST_LIMITS = { phone: 3, tablet: 4, desktop: 5 };

function getPodcastLimit() {
  const w = window.innerWidth;
  if (w >= 1025) return PODCAST_LIMITS.desktop;
  if (w >= 481) return PODCAST_LIMITS.tablet;
  return PODCAST_LIMITS.phone;
}

export function initNewsletter() {
  const form = document.querySelector(".newsletter-form");
  if (!form) return;

  const input = document.getElementById("newsletter-email");
  const status = document.querySelector(".newsletter-status");
  const btn = form.querySelector(".newsletter-btn");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();
    status.textContent = "";
    status.className = "newsletter-status";

    const email = input.value.trim();

    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      status.textContent = "Bitte gib eine gültige E-Mail-Adresse ein.";
      status.className = "newsletter-status is-error";
      return;
    }

    btn.disabled = true;
    btn.textContent = "Wird gesendet…";

    try {
      const result = await subscribeNewsletter(email);
      if (result === "already-subscribed") {
        status.textContent = "Du bist bereits abonniert!";
      } else {
        status.textContent = "Danke! Du bist jetzt abonniert.";
      }
      status.className = "newsletter-status is-success";
      input.value = "";
    } catch (error) {
      status.textContent = error.message;
      status.className = "newsletter-status is-error";
    } finally {
      btn.disabled = false;
      btn.textContent = "Abonnieren";
    }
  });
}

export async function renderLatestPodcasts(container, limit) {
  try {
    const podcasts = await fetchPodcasts(limit ?? getPodcastLimit());
    container.innerHTML = "";

    const loadingEl = container.previousElementSibling;
    if (loadingEl && loadingEl.classList.contains("loading-text")) {
      loadingEl.style.display = "none";
    }

    if (podcasts.length === 0) {
      loadingEl.textContent = "Noch keine Podcasts vorhanden.";
      loadingEl.style.display = "";
      return;
    }

    podcasts.forEach((podcast) => {
      const li = document.createElement("li");
      const card = document.createElement("a");
      card.href = `podcast-detail.html?id=${podcast.id}`;
      card.className = "podcast-card";

      card.innerHTML = `
        <div class="cover-wrapper">
          <img class="podcast-cover" src="${podcast.cover_url || ""}" alt="${podcast.title}" />
        </div>
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${podcast.title}</h3>
          <p class="podcast-card-description expandable-text">${podcast.description}</p>
        </div>
      `;

      if (podcast.cover_url) {
        const wrapper = card.querySelector(".cover-wrapper");
        getDominantColor(podcast.cover_url).then((color) => {
          if (color) wrapper.style.backgroundColor = color;
        });
      }

      li.appendChild(card);

      const expandBtn = document.createElement("button");
      expandBtn.className = "expand-btn";
      expandBtn.setAttribute("aria-expanded", "false");
      expandBtn.textContent = "Mehr anzeigen";
      li.appendChild(expandBtn);

      container.appendChild(li);
    });

    const section = container.parentElement;
    if (!section.querySelector(".detail-back")) {
      const allPodcast = document.createElement("a");
      allPodcast.href = "podcasts.html";
      allPodcast.classList.add("detail-back");
      allPodcast.innerText = "-> Alle Podcasts";
      section.appendChild(allPodcast);
    }
  } catch (error) {
    const loadingEl = container.previousElementSibling;
    if (loadingEl && loadingEl.classList.contains("loading-text")) {
      loadingEl.textContent = `Fehler beim Laden der Podcasts: ${error.message}`;
      loadingEl.style.display = "";
    }
  }
}

export async function renderCategories(container) {
  try {
    const categories = await fetchCategories();
    container.innerHTML = "";

    const loadingEl = container.previousElementSibling;
    if (loadingEl && loadingEl.classList.contains("loading-text")) {
      loadingEl.style.display = "none";
    }

    if (categories.length === 0) {
      loadingEl.textContent = "Noch keine Kategorien vorhanden.";
      loadingEl.style.display = "";
      return;
    }

    categories.forEach((category) => {
      const li = document.createElement("li");
      const card = document.createElement("a");
      card.href = `podcasts.html?category=${category.id}`;
      card.className = "category-card";
      if (category.color) {
        card.style.backgroundColor = category.color;
      }

      card.innerHTML = `
        ${category.image_url ? `<img class="category-image" src="${category.image_url}" alt="${category.name}" />` : ""}
        <h3>${category.name}</h3>
        <span class="category-link">Podcasts ansehen →</span>
      `;

      li.appendChild(card);
      container.appendChild(li);
    });
  } catch (error) {
    const loadingEl = container.previousElementSibling;
    if (loadingEl && loadingEl.classList.contains("loading-text")) {
      loadingEl.textContent = `Fehler beim Laden der Kategorien: ${error.message}`;
      loadingEl.style.display = "";
    }
  }
}
