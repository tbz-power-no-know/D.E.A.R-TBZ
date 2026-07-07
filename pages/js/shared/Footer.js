export function renderFooter() {
  const html = `
    <footer>
      <ul class="footer-list">
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Startseite <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="index.html#intro">Was ist das?</a></li>
            <li><a href="index.html#latest">Neueste Podcasts</a></li>
            <li><a href="index.html#categories">Kategorien</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Podcasts <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="podcasts.html">Alle Podcasts</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Über uns <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="about.html">Über dieses Projekt</a></li>
            <li><a href="about.html#contact">Kontaktformular</a></li>
          </ul>
        </li>
      </ul>
    </footer>
  `;
  document.body.insertAdjacentHTML("beforeend", html);

  document.querySelectorAll(".footer-toggle").forEach((toggle) => {
    toggle.addEventListener("click", () => {
      const menu = toggle.nextElementSibling;
      const isOpen = toggle.getAttribute("aria-expanded") === "true";

      toggle.setAttribute("aria-expanded", !isOpen);
      menu.classList.toggle("open");
    });
  });
}
