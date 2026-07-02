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

  const footer = document.querySelector("footer");
  if (!footer) return;

  const footerHeight = footer.offsetHeight;
  document.body.style.setProperty("--footer-height", `${footerHeight}px`);

  let lastScrollY = window.scrollY;
  const threshold = 20;

  window.addEventListener("scroll", () => {
    const currentScrollY = window.scrollY;
    const diff = currentScrollY - lastScrollY;
    const scrollBottom = window.innerHeight + currentScrollY >= document.body.offsetHeight - 10;

    if (scrollBottom) {
      footer.classList.remove("footer-hidden");
    } else if (diff > threshold && currentScrollY > footerHeight) {
      footer.classList.add("footer-hidden");
    } else if (diff < -threshold) {
      footer.classList.remove("footer-hidden");
    }

    lastScrollY = currentScrollY;
  });
}
