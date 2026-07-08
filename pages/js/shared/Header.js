import { toggleDarkMode } from "../darkmode.js";

const base = import.meta.env.BASE_URL;

let sunSvgCache = null;
let moonSvgCache = null;

async function loadSvg(filename) {
  const res = await fetch(base + filename);
  return res.text();
}

async function updateToggleIcon() {
  const btn = document.querySelector(".dark-toggle");
  if (!btn) return;
  const theme = document.documentElement.getAttribute("data-theme");
  const filename = theme === "dark" ? "sun-icon.svg" : "moon-icon.svg";
  const cache = theme === "dark" ? "sun" : "moon";
  if (!window[`svgCache_${cache}`]) {
    window[`svgCache_${cache}`] = await loadSvg(filename);
  }
  btn.innerHTML = window[`svgCache_${cache}`];
  btn.setAttribute(
    "aria-label",
    theme === "dark"
      ? "Zum hellen Modus wechseln"
      : "Zum dunklen Modus wechseln",
  );
}

export async function renderHeader() {
  const logoSvg = await loadSvg("logo.svg");

  const html = `
    <header class="header">
      <a href="index.html" class="header-title">${logoSvg}</a>
      <button class="dark-toggle" aria-label="Dunklen Modus umschalten"></button>
      <button class="more-nav-button" aria-label="Navigation umschalten">☰</button>
      <nav class="navbar">
        <ul class="nav-list">
          <li class="nav-item"><a href="index.html">Startseite</a></li>
          <li class="nav-item"><a href="podcasts.html">Podcasts</a></li>
          <li class="nav-item"><a href="about.html">Über uns</a></li>
        </ul>
      </nav>
    </header>
  `;
  document.body.insertAdjacentHTML("afterbegin", html);

  const moreBtn = document.querySelector(".more-nav-button");
  const navbar = document.querySelector(".navbar");
  moreBtn.addEventListener("click", () => {
    navbar.classList.toggle("open");
  });

  const darkBtn = document.querySelector(".dark-toggle");
  updateToggleIcon();
  darkBtn.addEventListener("click", () => {
    toggleDarkMode();
    updateToggleIcon();
  });

  const header = document.querySelector("header");
  if (!header) return;

  const updateHeaderHeight = () => {
    const headerHeight = header.offsetHeight;
    document.documentElement.style.setProperty(
      "--header-height",
      `${headerHeight}px`,
    );
  };

  requestAnimationFrame(updateHeaderHeight);
  window.addEventListener("resize", updateHeaderHeight);

  const threshold = 20;
  let lastScrollY = window.scrollY;
  let lastVisible = true;

  window.addEventListener("scroll", () => {
    const currentScrollY = window.scrollY;
    const diff = currentScrollY - lastScrollY;

    if (diff > threshold && currentScrollY > threshold) {
      header.classList.add("header-hidden");
    } else if (diff < -threshold) {
      header.classList.remove("header-hidden");
    }

    if (currentScrollY <= 10) {
      header.classList.remove("header-hidden");
    }

    const isVisible = !header.classList.contains("header-hidden");
    if (isVisible !== lastVisible) {
      lastVisible = isVisible;
      window.dispatchEvent(
        new CustomEvent("header-visibility-changed", {
          detail: { visible: isVisible },
        }),
      );
    }

    lastScrollY = currentScrollY;
  });
}
