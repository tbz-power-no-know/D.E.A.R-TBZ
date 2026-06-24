export function renderHeader() {
  const html = `
    <header class="header">
      <h1 class="header-title">D.E.A.R</h1>
      <button class="more-nav-button">More</button>
      <nav class="navbar">
        <ul class="nav-list">
          <li class="nav-item">Home</li>
          <li class="nav-item">Categorie</li>
          <li class="nav-item">About Us</li>
        </ul>
      </nav>
    </header>
  `;
  document.body.insertAdjacentHTML('afterbegin', html);
}
