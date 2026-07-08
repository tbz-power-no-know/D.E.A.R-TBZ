export function initExpandable() {
  document.querySelectorAll('.expand-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      const content = btn.closest('.podcast-card-content');
      const target = content.querySelector('.expandable-text');
      if (target) {
        target.classList.toggle('expanded');
        const expanded = target.classList.contains('expanded');
        btn.setAttribute('aria-expanded', expanded);
        btn.textContent = expanded ? 'Weniger anzeigen' : 'Mehr anzeigen';
      }
    });
  });
}
