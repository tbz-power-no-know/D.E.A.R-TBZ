const logoSvg = `
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 300" class="header-logo">
  <g stroke="#000" stroke-width="3" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M150 65 Q140 50 125 35"/>
    <path d="M125 35 Q115 25 105 20"/>
    <path d="M132 42 Q120 35 112 30"/>
    <path d="M120 50 Q108 45 100 42"/>
    <path d="M150 65 Q160 50 175 35"/>
    <path d="M175 35 Q185 25 195 20"/>
    <path d="M168 42 Q180 35 188 30"/>
    <path d="M180 50 Q192 45 200 42"/>
  </g>
  <text x="150" y="110" text-anchor="middle" font-family="Georgia, serif" font-size="48" font-weight="bold" fill="#000" letter-spacing="6">D.E.A.R.</text>
  <line x1="80" y1="125" x2="220" y2="125" stroke="#000" stroke-width="1.5" stroke-linecap="round"/>
  <!-- Black cover (bigger than pages) -->
  <path d="M150 140 Q105 130 55 145 L55 245 Q105 230 150 240 Z" fill="#000"/>
  <path d="M150 140 Q195 130 245 145 L245 245 Q195 230 150 240 Z" fill="#000"/>
  <!-- Right page (static, underneath) -->
  <path d="M150 145 Q190 135 240 150 L240 240 Q190 225 150 235 Z" fill="#fff" stroke="#000" stroke-width="2" stroke-linejoin="round"/>
  <!-- Right page lines -->
  <g stroke="#000" stroke-width="1" fill="none" stroke-linecap="round">
    <path d="M155 160 Q192 150 232 162"/>
    <path d="M155 175 Q192 165 232 177"/>
    <path d="M155 190 Q192 180 232 192"/>
    <path d="M155 205 Q192 195 232 207"/>
    <path d="M155 220 Q192 210 232 222"/>
  </g>
  <!-- Left page (animated, flips to right) -->
  <g class="page-left">
    <path d="M150 145 Q110 135 60 150 L60 240 Q110 225 150 235 Z" fill="#fff" stroke="#000" stroke-width="2" stroke-linejoin="round"/>
    <g stroke="#000" stroke-width="1" fill="none" stroke-linecap="round">
      <path d="M145 160 Q108 150 68 162"/>
      <path d="M145 175 Q108 165 68 177"/>
      <path d="M145 190 Q108 180 68 192"/>
      <path d="M145 205 Q108 195 68 207"/>
      <path d="M145 220 Q108 210 68 222"/>
    </g>
  </g>
  <!-- Spine -->
  <line x1="150" y1="140" x2="150" y2="240" stroke="#000" stroke-width="2"/>
</svg>
`;

export function renderHeader() {
  const html = `
    <header class="header">
      <a href="index.html" class="header-title">${logoSvg}</a>
      <button class="more-nav-button" aria-label="Toggle navigation">☰</button>
      <nav class="navbar">
        <ul class="nav-list">
          <li class="nav-item"><a href="index.html">Home</a></li>
          <li class="nav-item"><a href="podcasts.html">Podcasts</a></li>
          <li class="nav-item"><a href="about.html">About</a></li>
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

  const header = document.querySelector("header");
  if (!header) return;

  const headerHeight = header.offsetHeight;
  document.body.style.setProperty("--header-height", `${headerHeight}px`);

  const threshold = 20;

  let lastScrollY = window.scrollY;

  window.addEventListener("scroll", () => {
    const currentScrollY = window.scrollY;
    const diff = currentScrollY - lastScrollY;

    if (diff > threshold && currentScrollY > headerHeight) {
      header.classList.add("header-hidden");
    } else if (diff < -threshold) {
      header.classList.remove("header-hidden");
    }

    if (currentScrollY <= 10) {
      header.classList.remove("header-hidden");
    }

    lastScrollY = currentScrollY;
  });
}
