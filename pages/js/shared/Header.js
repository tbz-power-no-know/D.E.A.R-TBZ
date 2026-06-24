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
    const isVisible = navbar.style.display === 'flex';
    navbar.style.display = isVisible ? 'none' : 'flex';
  });
}
