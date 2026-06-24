export function renderFooter() {
  const html = `
    <footer>
      <ul class="footer-list">
        <li>
          <h2>Home</h2>
          <ul>
            <li><a href="">What is that?</a></li>
            <li><a href="">New Podcast</a></li>
            <li><a href="">Categorie</a></li>
          </ul>
        </li>
        <li>
          <h2>Categorie</h2>
          <ul>
            <li><a href="">1</a></li>
            <li><a href="">1</a></li>
            <li><a href="">1</a></li>
            <li><a href="">1</a></li>
          </ul>
        </li>
        <li>
          <h2>About Us</h2>
          <ul>
            <li><a href="">About this project</a></li>
            <li><a href="">Contact Form</a></li>
          </ul>
        </li>
      </ul>
    </footer>
  `;
  document.body.insertAdjacentHTML('beforeend', html);
}
