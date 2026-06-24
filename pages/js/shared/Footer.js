export function renderFooter() {
  const html = `
    <footer>
      <ul class="footer-list">
        <li>
          <h2>Home</h2>
          <ul>
            <li><a href="index.html#intro">What is that?</a></li>
            <li><a href="index.html#latest">Latest Podcasts</a></li>
            <li><a href="index.html#categories">Categories</a></li>
          </ul>
        </li>
        <li>
          <h2>Podcasts</h2>
          <ul>
            <li><a href="podcasts.html">All Podcasts</a></li>
          </ul>
        </li>
        <li>
          <h2>About</h2>
          <ul>
            <li><a href="about.html">About this project</a></li>
            <li><a href="about.html#contact">Contact Form</a></li>
          </ul>
        </li>
      </ul>
    </footer>
  `;
  document.body.insertAdjacentHTML('beforeend', html);
}
