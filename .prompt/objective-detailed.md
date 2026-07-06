# D.E.A.R — Detailed Project Plan

> **VERITE = THIS DOCUMENT.** This is the absolute source of truth. If anything here conflicts with the codebase, this document wins. If anything is unclear or ambiguous, **ask the user before proceeding**.

---

## AI Assistant Rules

1. **Ask before acting** — if there's any doubt, ambiguity, or missing information, ask the user. Never guess.
2. **Clean, readable code** — well-structured, properly indented, meaningful names, no shortcuts. Code should be easy to read and understand at a glance.
3. **Commit after every meaningful change** — each logical change gets its own commit with a clear `type: description` message. This creates a readable history for debugging and understanding what changed and why.
4. **Follow this document** — all decisions, conventions, and plans here are binding.
5. **Follow existing CSS style** — maintain the same style line as the current CSS. Improvements for cleaner/better code are welcome, but do not change the overall style direction.

---

## Project History

### Preparation (Before AI) — 10 hours
- Wireframes created manually (no AI)
- Docker boilerplate set up (minor AI help)
- Discovery: Supabase research, no-framework/no-SPA approach
- Teacher discussions on best solution

### Foundation
- Basis files created by developer (commit `ba5a9cd`)
- AI continued from this foundation

### Planning
- `objective-detailed.md` created through AI exchange
- All architectural choices made by developer

### Development
- AI generates code, developer reviews every line
- Regular commits for consistency
- No "vibe coding" — all code understood before accepting

### Tool Choice
- opencode (Qwen) chosen over Claude: local hosting for data privacy and ecology

---

## What Is D.E.A.R?

**Drop Everything And Read** — a school-wide project where students produce book presentations as podcasts in ABU (General Education) classes. This website publishes and showcases those podcasts.

**School:** Technical Vocational School Zurich, IT Department > Computer Science  
**Module:** M293 PA04  
**Format:** Individual work, 20 lessons

---

## Core Requirements (from assignment)

### Mandatory Pages (minimum 3)
1. **Home** — latest podcasts, category overview, introduction to DEAR, hero section
2. **Podcasts** — all podcasts grid, category filter, search
3. **Podcast Detail** — cover (9:16), book info, description, transcription with `[MM:SS]`, audio player, presenter card
4. **About** — project info, contact form with subject dropdown

### Mandatory Content
- **At least 12 podcasts** with: cover (9:16), description, category, audio file, presenter, transcription
- **Wireframes** for mobile/tablet/desktop (Markdown, in Git)
- **Style guide** with typography and colors (Markdown, in Git)
- **AI usage documentation** (Markdown, in Git)

### Technical Requirements
- **100% custom HTML/CSS** — AI assistance allowed, frameworks NOT allowed
- **Page structure:** Header, Main, Footer
- **CSS Grid** for podcast overview and content
- **Forms:** newsletter and contact
- **Responsive design (mobile-first):**
  - Mobile: up to 480px (base styles, designed for iPhone SE / iPhone 12 ~375px)
  - Tablet: 481px – 1024px (`min-width: 481px`)
  - Desktop: from 1025px (`min-width: 1025px`)
- **Published** on a web server

### Optional Features
- [x] Search functionality (JavaScript) — **wanted**
- [ ] User account, registration, login/logout (Web Storage API)
- [ ] Bookmark list / favorites (Web Storage API) — **skipped**

---

## Stack

| Layer | Technology |
|---|---|
| Build | Vite 8 (multi-page input) |
| Runtime | Node 25 (dev), Nginx 1.30 (prod) |
| Backend | Supabase (DB, storage, auth) |
| Infra | Docker Compose + devcontainer |
| Languages | Vanilla HTML, CSS, JavaScript (ES modules) |

---

## Design Decisions

### Mobile-First CSS
- Base styles target **~375px viewport** (iPhone SE / iPhone 12)
- Touch targets: **min 44px** (Apple HIG)
- Grid: **1 column** on mobile, **2+ columns** at 481px+, **3-4 columns** at 1025px+
- Navigation: **hamburger menu** on mobile, full nav on desktop
- No `max-width` queries — only `min-width` (true mobile-first)

### Colors
- CSS variables in `main.css`: `--primary`, `--secondary`
- Current: `--primary: #000`, `--secondary: #fff` (placeholder, will change later)
- All colors referenced via variables, no hardcoded values

### Typography
- **Headings:** Lora (serif) — `var(--font-heading)` — Google Fonts
- **Body:** Inter (sans-serif) — `var(--font-body)` — Google Fonts
- `h1`: 30px, `h2`: 15px (base mobile sizes)

### Shared Components
- Header and Footer rendered via JS modules using `insertAdjacentHTML`
- No framework — plain functions, no templates, no virtual DOM
- Each page includes `<script type="module" src="/js/main.js">`

### Data
- All podcast data stored in **Supabase** (not hardcoded in HTML)
- Audio files in Supabase Storage (`podcast-audio` bucket)
- Cover images in Supabase Storage (`podcast-covers` bucket)
- Presenter photos in Supabase Storage (`presenter-photos` bucket)

### Backend Access / Write Path
- **Reads go direct:** the browser queries Supabase tables with the **anon key**, gated by read-only RLS policies. The anon key is **public by design** — security comes from **RLS, not from hiding** the architecture. No server is needed for reads.
- **Writes go through a server boundary:** the only write (the contact form) is sent to a **Supabase Edge Function** (`supabase/functions/contact/`), never inserted directly with the anon key.
  - The function **validates server-side**, drops spam via a honeypot, and inserts using the **`service_role` key**, which **never reaches the browser**.
  - All Supabase access (reads + the contact write) stays centralized in `pages/js/data.js` (`sendContactMessage` → `supabase.functions.invoke('contact')`).
- **Rule:** never put a secret (e.g. `service_role`) in a `VITE_`-prefixed variable — Vite inlines those into the shipped bundle. Only the public anon key is shipped.

### Transcription
- Stored as plain text with `[MM:SS]` timestamps per line
- Example: `[00:00] Welcome to this book presentation...\n[01:23] The author describes...`
- Future: sync transcription highlight with audio playback time

### Expandable Text
- Kept from original design
- `.expandable-text` clamps at `max-height: 5em`, `.expanded` reveals full content
- Toggle via `.expand-btn` button

### Footer Accordion (Mobile)
- On mobile (< 481px): footer section titles are clickable, links slide down with animation
- Independent toggles — multiple sections can be open at the same time
- Chevron (▼) indicator rotates when open
- On tablet+ (≥ 481px): all links always visible, no toggle behavior

### Sticky Header
- Header is `position: fixed` at top of viewport
- Hidden by default on page load
- Hides on scroll down (threshold: 20px), shows on scroll up
- Always visible when user reaches top of page (scrollY <= 10)
- `--header-height` CSS variable set dynamically to prevent content overlap

### Footer
- Footer is at the end of the page (normal document flow, not sticky)

### Sticky Audio Player
- Audio player (`detail-audio`) is `position: sticky; top: 0` — sticks at viewport top while scrolling
- Renders above transcription, not below
- Transcription has no overflow — full text visible, page scrolls naturally
- Active timestamp still highlights and `scrollIntoView` scrolls the page to keep it centered

### Page Orientation
- Podcasts page: `<h2 class="section-title">All Podcasts</h2>` at top
- Podcast detail: back link (`&larr; All Podcasts`) above cover image

### Category Colors & Images
- Categories have `color` (hex) and `image_url` columns in Supabase
- Home page: category cards use color as background, display image if set
- Filter buttons: active state uses category color instead of generic `--primary`
- Clicking a category on home navigates to `podcasts.html?category=<id>` with filter auto-applied

### Hover Animations
- Podcast/category cards: `translateY(-2px)` + shadow on hover
- Filter/sort buttons: `scale(0.97)` on hover
- Submit button: `translateY(-1px)` on hover
- Presenter card: border color change on hover
- Back link: opacity + underline on hover

### Header Navigation (Mobile)
- On mobile (< 481px): hamburger button (☰) triggers dropdown menu that slides down below header bar
- Dropdown: light background with shadow, links stacked vertically, white text
- Uses `max-height` transition for smooth open/close
- On desktop (≥ 1025px): nav always visible inline, hamburger hidden

---

## Supabase Schema

Full SQL files in `docs/`:

| File | Purpose |
|---|---|
| `docs/supabase-schema.sql` | Tables, RLS, policies, storage policies |
| `docs/supabase-seed.sql` | 8 categories, 3 presenters, 12 sample podcasts |
| `docs/supabase-contact.sql` | `contact_messages` table + RLS (no public policies) |

**Tables:** `categories` (with `image_url`, `color`), `podcasts`, `presenters`, `podcast_presenters`, `contact_messages` (write-only via Edge Function), `newsletter_subscribers`
**Storage buckets:** `podcast-audio`, `podcast-covers`, `presenter-photos`, `category-images`
**Run order:** schema first, then seed (contact table is now in schema)

---

## Page Structure (Final)

### Home (`index.html`)
```
┌─────────────────────────┐
│ Header (JS-rendered)    │
├─────────────────────────┤
│ Hero Section            │  ← Black bg, white text, D.E.A.R title + subtitle
├─────────────────────────┤
│ Introduction to DEAR    │  ← What the project is about
├─────────────────────────┤
│ Latest Podcasts         │  ← Fetched from Supabase, newest first
├─────────────────────────┤
│ Category Overview       │  ← All categories (name + link, no descriptions yet)
├─────────────────────────┤
│ Newsletter              │  ← Email input + subscribe button, frontend validation
├─────────────────────────┤
│ Footer (JS-rendered)    │
└─────────────────────────┘
```

### Podcasts List (`podcasts.html`)
```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ Search Bar              │  ← Client-side search (title + description)
├─────────────────────────┤
│ Sort Toggle             │  ← Newest first / Oldest first (right-aligned)
├─────────────────────────┤
│ Category Filter Buttons │  ← All, Crime, Fantasy, Non-Fiction, etc.
├─────────────────────────┤
│ Podcast Grid            │  ← Cards with cover, title, play button
│ (1 col → 2 → 3-4)       │
├─────────────────────────┤
│ Footer                  │
└─────────────────────────┘
```

### Podcast Detail (`podcast-detail.html`)
```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ ← All Podcasts          │  ← Back link
├─────────────────────────┤
│ 9:16 Cover Image        │  ← aspect-ratio: 9/16, object-fit: cover
├─────────────────────────┤
│ Book Title              │
│ Book Info               │  ← Category, duration, date
├─────────────────────────┤
│ Description             │
├─────────────────────────┤
│ [Audio Player]          │  ← Sticky, stays at top while scrolling
├─────────────────────────┤
│ Transcription           │  ← Full text, no overflow, page scrolls
│ (scrolls with page)     │  ← [MM:SS] timestamps synced with audio
├─────────────────────────┤
│ Presenter Card          │  ← Photo + name + bio
├─────────────────────────┤
│ Footer (sticky)         │  ← Hides on scroll down, shows on scroll up
└─────────────────────────┘
```

### About (`about.html`)
```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ About DEAR Project      │  ← Project description
├─────────────────────────┤
│ Contact Form (#contact) │  ← Name, email, subject dropdown, message, honeypot
├─────────────────────────┤
│ Footer                  │
└─────────────────────────┘
```
**Note:** The contact section needs `id="contact"` so the footer anchor link (`about.html#contact`) works.

---

## File Structure (Actual)

```
├── pages/
│   ├── index.html              ← Home
│   ├── podcasts.html           ← Podcast list + filter + search
│   ├── podcast-detail.html     ← Single podcast detail
│   ├── about.html              ← About + contact form
│   ├── js/
│   │   ├── main.js             ← Entry: header, footer, per-page init dispatch
│   │   ├── expandable.js       ← Toggle expandable text
│   │   ├── supabase.js         ← Supabase client initialization
│   │   ├── data.js             ← Fetch functions + sendContactMessage
│   │   ├── filter.js           ← Category filter logic
│   │   ├── search.js           ← Client-side search (debounced)
│   │   ├── home.js             ← renderLatestPodcasts, renderCategories
│   │   ├── podcast-detail.js   ← initPodcastDetail, renderPodcast
│   │   ├── contact.js          ← Contact form validation + submit
│   │   └── shared/
│   │       ├── Header.js       ← renderHeader()
│   │       └── Footer.js       ← renderFooter()
│   └── style/
│       ├── reset.css            ← Meyerweb reset
│       ├── main.css             ← Variables, shared styles, header, footer, expandable
│       ├── home.css             ← Home page styles
│       ├── podcasts.css         ← Podcast list + filter + search styles
│       ├── podcast-detail.css   ← Detail page styles
│       └── about.css            ← About page styles
├── public/                     ← Static assets (currently empty)
├── docs/
│   ├── wireframes.md            ← ASCII wireframes (mobile/tablet/desktop)
│   ├── styleguide.md            ← Typography, colors, spacing
│   ├── ai-usage.md              ← AI collaboration documentation
│   ├── supabase-schema.sql      ← Tables, RLS, policies, storage policies
│   ├── supabase-seed.sql        ← 8 categories, 3 presenters, 12 sample podcasts
│   └── supabase-contact.sql     ← contact_messages table + RLS
├── supabase/
│   └── functions/
│       ├── README.md            ← Deploy instructions
│       └── contact/
│           └── index.ts         ← Edge function: validate + insert contact_messages
├── docker/
│   └── nginx/
│       ├── Dockerfile           ← Multi-stage: Vite build → Nginx
│       ├── nginx.conf           ← Dev: proxy to Vite dev server
│       └── nginx-prod.conf      ← Prod: serve static dist/
├── docker-compose.yml           ← Prod: build + serve via Nginx
├── docker-compose.override.yml  ← Dev: Node 25 + Nginx proxy
├── .devcontainer/               ← Dev container config (Claude + opencode)
├── vite.config.js               ← Multi-page build, auto-discovers *.html
├── package.json
├── .env / .env.example
└── .gitignore
```

---

## Implementation Plan

### Phase 1: Foundation — DONE
- [x] Rename pages: `index-home.html` → `index.html`, `index.html` → `podcasts.html`, `podcast.html` → `podcast-detail.html`
- [x] Create `about.html`
- [x] CSS variables in `main.css` (`--primary: #000`, `--secondary: #fff`)
- [x] Refactor hardcoded colors to use variables
- [x] Create `pages/js/supabase.js` module
- [x] Create `pages/js/data.js` module
- [ ] Run Supabase SQL schema (user runs in Supabase dashboard)
- [ ] Clean up empty `src/` directory

### Phase 2: Pages — DONE
- [x] Home page (`index.html`) — hero, intro to DEAR, latest podcasts, categories
- [x] Podcasts list (`podcasts.html`) — grid, category filter, search
- [x] Podcast detail (`podcast-detail.html`) — cover, info, description, transcription, audio player, presenter
- [x] About page (`about.html`) — project info, contact form with honeypot

### Phase 3: JS Logic — MOSTLY DONE
- [x] Data fetching from Supabase
- [x] Category filter (JS with `data-category`)
- [x] Sort toggle (newest/oldest) on podcasts page
- [x] Search functionality (debounced, server-side via Supabase `ilike`)
- [x] Audio player (native HTML5 `<audio controls>`, sticky at top of page)
- [x] Transcription display with `[MM:SS]` timestamps (styled spans)
- [x] Transcription auto-scroll and highlight synced with audio playback (page scroll, no overflow)
- [x] Contact form: client-side validation + Edge Function submit
- [x] Category filter via URL parameter (`?category=uuid`)
- [x] Newsletter subscription: email validation + subscribe button
- [ ] Loading/error states (skeleton loaders) — currently plain text

### Phase 4: Responsive Design — DONE
- [x] Tablet breakpoints (`min-width: 481px`)
- [x] Desktop breakpoints (`min-width: 1025px`)
- [x] Navigation wired to actual pages
- [x] Mobile hamburger menu (max-height transition)
- [x] Footer accordion on mobile, flat on tablet+

### Phase 5: Documentation — DONE
- [x] `docs/wireframes.md` — ASCII wireframes for all 4 pages × 3 breakpoints
- [x] `docs/styleguide.md` — typography, colors, spacing, components
- [x] `docs/ai-usage.md` — AI tools, use cases, prompts, time savings

---

## Future (Not Now)

- [ ] NuxtJS + TypeScript migration (v2)
- [ ] User accounts / login
- [ ] Bookmark / favorites feature

---

## Conventions

- **No CSS preprocessors** — plain `.css` files
- **ES modules** — `type="module"` on all script tags
- **No frameworks** — vanilla HTML/CSS/JS only
- **Commit after every meaningful change** — `type: short description` (feat, refactor, fix, docs, chore). Each logical change gets its own commit for clear history and easy debugging.
- **Mobile-first** — base = mobile, `min-width` queries for tablet/desktop
- **Touch targets** — minimum 44px for interactive elements
- **CSS Grid** for layouts (podcast overview, content areas)
- **Clean, readable code** — proper indentation, meaningful names, no shortcuts
- **Follow existing CSS style** — maintain the same style line as the current CSS. Improvements for cleaner/better code are welcome, but do not change the overall style direction.

---

## Known Issues / Notes

### Bugs to Fix
- **`public/` directory is empty** — no favicon or static assets yet

### Missing (per original assignment)
- ~~Newsletter subscription~~ — **implemented** on homepage with email validation

### Remaining Tasks
- **Skeleton loaders** — VERITE Phase 3 specifies skeleton loaders; currently uses plain text placeholders
- **Publish on web server** — required by assignment, GitHub Actions workflow created but needs manual push + Pages config

### Resolved
- ~~Supabase SQL schema, seed data, Edge Function, storage buckets~~ — deployed
- ~~Page renaming (index-home → index, etc.)~~ — done
- ~~Footer nav links~~ — wired to actual pages
- ~~Responsive breakpoints~~ — all `@media` queries implemented
- ~~CSS variables~~ — all colors use variables
- ~~`#contact` anchor broken~~ — added `id="contact"` to about.html contact section
- ~~`.env.example` wrong URL~~ — replaced with proper Supabase placeholder
- ~~`loading-text` has `grid-column: 2`~~ — changed to `grid-column: 1 / -1` in home.css and podcasts.css
- ~~`src/` directory empty~~ — removed directory and docker-compose.override.yml reference
- ~~Search clear reload~~ — replaced `window.location.reload()` with custom event re-render
- ~~Search query injection~~ — escaped special chars in Supabase `ilike` query
- ~~Audio play error~~ — added `.catch(() => {})` for autoplay policy
