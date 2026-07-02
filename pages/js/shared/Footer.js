export function renderFooter() {
  const html = `
    <footer>
      <ul class="footer-list">
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Home <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="index.html#intro">What is that?</a></li>
            <li><a href="index.html#latest">Latest Podcasts</a></li>
            <li><a href="index.html#categories">Categories</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Podcasts <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="podcasts.html">All Podcasts</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">About <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="about.html">About this project</a></li>
            <li><a href="about.html#contact">Contact Form</a></li>
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
