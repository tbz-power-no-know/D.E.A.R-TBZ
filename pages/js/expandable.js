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

        if (expanded) {
          if (!target.dataset.original) {
            target.dataset.original = target.textContent;
          }
          requestAnimationFrame(() => {
            if (target.scrollHeight > target.clientHeight) {
              const lines = target.dataset.original.split('\n');
              let truncated = '';
              for (let i = 0; i < lines.length; i++) {
                const test = truncated + (truncated ? '\n' : '') + lines[i];
                target.textContent = test;
                if (target.scrollHeight > target.clientHeight) {
                  const prev = truncated;
                  target.textContent = prev + '...';
                  break;
                }
                truncated = test;
              }
            }
          });
        } else {
          if (target.dataset.original) {
            target.textContent = target.dataset.original;
          }
        }
      }
    });
  });
}
