export function renderHeader() {
  const html = `
    <header class="header">
      <a href="index.html" class="header-title">D.E.A.R</a>
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
  document.body.insertAdjacentHTML('afterbegin', html);

  const moreBtn = document.querySelector('.more-nav-button');
  const navbar = document.querySelector('.navbar');
  moreBtn.addEventListener('click', () => {
    navbar.classList.toggle('open');
  });

  const header = document.querySelector('header');
  if (!header) return;

  const headerHeight = header.offsetHeight;
  document.body.style.setProperty('--header-height', `${headerHeight}px`);

  header.classList.add('header-hidden');

  const threshold = 20;

  let lastScrollY = window.scrollY;

  window.addEventListener('scroll', () => {
    const currentScrollY = window.scrollY;
    const diff = currentScrollY - lastScrollY;

    if (diff > threshold && currentScrollY > headerHeight) {
      header.classList.add('header-hidden');
    } else if (diff < -threshold) {
      header.classList.remove('header-hidden');
    }

    if (currentScrollY <= 10) {
      header.classList.remove('header-hidden');
    }

    lastScrollY = currentScrollY;
  });
}
