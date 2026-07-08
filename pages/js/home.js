import { fetchPodcasts, fetchCategories, subscribeNewsletter } from "./data.js";
import { getDominantColor } from "./colorExtract.js";

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

export async function renderLatestPodcasts(container, limit = 5) {
  try {
    const podcasts = await fetchPodcasts(limit);
    container.innerHTML = "";

    if (podcasts.length === 0) {
      container.innerHTML =
        '<p class="loading-text">Noch keine Podcasts vorhanden.</p>';
      return;
    }

    podcasts.forEach((podcast) => {
      const card = document.createElement("a");
      card.href = `podcast-detail.html?id=${podcast.id}`;
      card.className = "podcast-card";

      card.innerHTML = `
        <div class="cover-wrapper">
          <img class="podcast-cover" src="${podcast.cover_url || ""}" alt="${podcast.title}" />
        </div>
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${podcast.title}</h3>
          <p class="podcast-card-description">${podcast.description}</p>
        </div>
      `;

      if (podcast.cover_url) {
        const wrapper = card.querySelector(".cover-wrapper");
        getDominantColor(podcast.cover_url).then((color) => {
          if (color) wrapper.style.backgroundColor = color;
        });
      }

      container.appendChild(card);
    });

    const allPodcast = document.createElement("a");
    allPodcast.href = "podcasts.html";
    allPodcast.classList.add("detail-back");
    allPodcast.innerText = `-> Alle Podcasts`;
    container.appendChild(allPodcast);
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Fehler beim Laden der Podcasts: ${error.message}</p>`;
  }
}

export async function renderCategories(container) {
  try {
    const categories = await fetchCategories();
    container.innerHTML = "";

    if (categories.length === 0) {
      container.innerHTML =
        '<p class="loading-text">Noch keine Kategorien vorhanden.</p>';
      return;
    }

    categories.forEach((category) => {
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

      container.appendChild(card);
    });
  } catch (error) {
    container.innerHTML = `<p class="loading-text">Fehler beim Laden der Kategorien: ${error.message}</p>`;
  }
}
