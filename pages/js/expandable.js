export function initExpandable() {
  document.querySelectorAll('.expand-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      let el = btn.parentElement;
      while (el) {
        const target = el.querySelector('.expandable-text');
        if (target) {
          target.classList.toggle('expanded');
          const expanded = target.classList.contains('expanded');
          btn.setAttribute('aria-expanded', expanded);
          btn.textContent = expanded ? 'Weniger anzeigen' : 'Mehr anzeigen';
          break;
        }
        el = el.parentElement;
      }
    });
  });
}
