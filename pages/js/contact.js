import { sendContactMessage } from './data.js'

const EMAIL_PATTERN = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

export function initContactForm(form) {
  const status = form.querySelector('.form-status')
  const submitBtn = form.querySelector('.submit-btn')

  form.addEventListener('submit', async (event) => {
    event.preventDefault()

    const data = new FormData(form)
    const name = (data.get('name') ?? '').toString().trim()
    const email = (data.get('email') ?? '').toString().trim()
    const subject = (data.get('subject') ?? '').toString()
    const message = (data.get('message') ?? '').toString().trim()
    const company = (data.get('company') ?? '').toString() // honeypot

    // Client-seitige Validierung (nur UX — die Edge-Function validiert endgültig)
    if (!name || !email || !subject || !message) {
      showStatus(status, 'Bitte fülle alle Felder aus.', 'is-error')
      return
    }
    if (!EMAIL_PATTERN.test(email)) {
      showStatus(status, 'Bitte gib eine gültige E-Mail-Adresse ein.', 'is-error')
      return
    }

    setLoading(submitBtn, true)
    showStatus(status, 'Wird gesendet…', '')

    try {
      await sendContactMessage({ name, email, subject, message, company })
      form.reset()
      showStatus(status, 'Danke! Deine Nachricht wurde gesendet.', 'is-success')
    } catch (error) {
      showStatus(status, 'Etwas ist schiefgelaufen. Bitte versuche es später erneut.', 'is-error')
    } finally {
      setLoading(submitBtn, false)
    }
  })
}

function showStatus(element, text, modifier) {
  element.textContent = text
  element.className = 'form-status'
  if (modifier) element.classList.add(modifier)
}

function setLoading(button, isLoading) {
  button.disabled = isLoading
  button.textContent = isLoading ? 'Wird gesendet…' : 'Senden'
}
