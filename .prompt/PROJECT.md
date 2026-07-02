# D.E.A.R — Podcast Website

> **Quick reference.** Full detailed plan is in `.prompt/objective-detailed.md` — **VERITE (absolute source of truth)**.

## AI Rules
1. **Ask before acting** — never guess if unsure
2. **Clean, readable code** — always
3. **Commit after every meaningful change** — `type: description`

## Quick Facts

- **What:** School podcast website for book presentations (D.E.A.R. = Drop Everything And Read)
- **Stack:** Vite 8, vanilla HTML/CSS/JS, Supabase backend, Docker/Nginx
- **Mobile-first:** base ~375px (iPhone SE/12), tablet 481px+, desktop 1025px+
- **Colors:** `--primary: #000`, `--secondary: #fff` (placeholders, will change)
- **No frameworks** — custom HTML/CSS only, AI assistance allowed
- **Status:** Phases 1-2, 4-5 done. Phase 3 mostly done (transcription sync done, skeleton loaders pending). GitHub Pages workflow created, needs push.

## Recent Features
- Sticky audio player above transcription (full text, no overflow)
- Sticky footer (hides on scroll down, shows on scroll up)
- Page orientation: back link on detail, section title on podcasts page
- Category colors + images in DB, rendered in UI
- Category filter via URL parameter (`?category=uuid`)
- Hover animations on cards, buttons, links

## Pages

| File | Purpose |
|---|---|
| `index.html` | Home: hero → intro to DEAR → latest podcasts → categories |
| `podcasts.html` | All podcasts: search → sort toggle → category filter → grid |
| `podcast-detail.html` | Single podcast: cover (9:16), info, description, transcription `[MM:SS]`, audio player, presenter |
| `about.html` | About project + contact form (honeypot, Edge Function submit) |

## Key Architecture

- **Vite root = `pages/`**, auto-discovers `*.html` as entry points
- **Header/Footer** rendered via JS modules (`insertAdjacentHTML`)
- **All data from Supabase** — podcasts, categories, presenters, audio, covers
- **Reads:** direct browser → Supabase anon key (RLS-gated)
- **Writes:** contact form → Edge Function → `service_role` key (never in browser)
- **CSS strategy:** `reset.css` → `main.css` (shared + variables) → per-page CSS
- **Expandable text** kept (`.expandable-text` + `.expand-btn`)
- **Sticky header** hides on scroll down, shows on scroll up
- **Sticky audio player** at top of page while scrolling transcription
- **Footer** at end of page (normal flow)

## Supabase

- Tables: `categories`, `podcasts`, `presenters`, `podcast_presenters`, `contact_messages`
- Buckets: `podcast-audio`, `podcast-covers`, `presenter-photos`
- Edge Function: `contact` (server-side validation + insert)

## Outstanding

- Add newsletter subscription (per original assignment)
- Deploy Supabase schema, seed data, Edge Function, storage buckets

## Conventions

- ES modules, no CSS preprocessors, no frameworks
- Mobile-first: base = mobile, `min-width` queries only
- Touch targets: min 44px
- Commits: `type: short description` (feat, refactor, fix, docs, chore)

## Future (not now)

- NuxtJS + TypeScript (v2)
- User accounts, bookmarks
