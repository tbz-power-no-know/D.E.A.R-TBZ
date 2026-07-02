export function initExpandable() {
  document.querySelectorAll('.expand-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      let el = btn.parentElement;
      while (el) {
        const target = el.querySelector('.expandable-text');
        if (target) {
          target.classList.toggle('expanded');
          break;
        }
        el = el.parentElement;
      }
    });
  });
}
