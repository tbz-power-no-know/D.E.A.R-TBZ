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

    // Client-side validation (UX only — the Edge Function validates authoritatively)
    if (!name || !email || !subject || !message) {
      showStatus(status, 'Please fill in all fields.', 'is-error')
      return
    }
    if (!EMAIL_PATTERN.test(email)) {
      showStatus(status, 'Please enter a valid email address.', 'is-error')
      return
    }

    setLoading(submitBtn, true)
    showStatus(status, 'Sending…', '')

    try {
      await sendContactMessage({ name, email, subject, message, company })
      form.reset()
      showStatus(status, 'Thanks! Your message has been sent.', 'is-success')
    } catch (error) {
      showStatus(status, 'Something went wrong. Please try again later.', 'is-error')
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
  button.textContent = isLoading ? 'Sending…' : 'Send'
}
