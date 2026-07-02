# D.E.A.R. — Podcast Website

> **Drop Everything And Read** — A school project showcasing student book presentations as podcasts.

## Overview

D.E.A.R. is a podcast website built for the **Technical Vocational School Zurich** (IT Department > Computer Science, Module M293 PA04). The platform publishes book presentations produced as podcasts by students in ABU (General Education) classes. Each podcast features a student sharing their thoughts on a book they've read.

## Pages

| Page | Description |
|---|---|
| **Home** | Hero section, intro to D.E.A.R., latest podcasts, category overview |
| **Podcasts** | All podcasts grid, category filter, search, sort toggle |
| **Podcast Detail** | Cover (9:16), book info, description, transcription with `[MM:SS]` timestamps, sticky audio player, presenter card |
| **About** | Project info, contact form with subject dropdown |

## Tech Stack

| Layer | Technology |
|---|---|
| Build | Vite 8 (multi-page input) |
| Runtime | Node 25 (dev), Nginx 1.30 (prod) |
| Backend | Supabase (DB, storage, auth) |
| Infra | Docker Compose + devcontainer |
| Languages | Vanilla HTML, CSS, JavaScript (ES modules) |

**No frameworks** — 100% custom HTML/CSS/JS with AI-assisted development.

## Features

- Mobile-first responsive design (375px / 481px / 1025px breakpoints)
- CSS Grid layouts for podcast and category overviews
- Category filter with color-coded buttons (data from Supabase)
- Client-side search (Supabase `ilike`)
- Sort toggle (newest / oldest)
- Transcription synced with audio playback (`[MM:SS]` timestamps)
- Sticky audio player that stays at top while scrolling
- Sticky header that hides on scroll down, shows on scroll up
- Newsletter subscription with email validation
- Hover animations on cards, buttons, and links
- Contact form with honeypot spam protection (Edge Function submit)

## Getting Started

### Prerequisites

- Node.js 25+
- Docker + Docker Compose
- Supabase account

### Setup

1. Clone the repository
2. Copy `.env.example` to `.env` and fill in your Supabase credentials:
   ```bash
   cp .env.example .env
   ```
3. Run the Supabase SQL files in order (Supabase Dashboard → SQL Editor):
   - `docs/supabase-schema.sql` — tables, RLS, storage policies
   - `docs/supabase-seed.sql` — 8 categories, 3 presenters, 12 sample podcasts
   - `docs/supabase-contact.sql` — contact_messages table
4. Create storage buckets in Supabase Dashboard → Storage:
   - `podcast-audio` (public)
   - `podcast-covers` (public)
   - `presenter-photos` (public)
   - `category-images` (public)
5. Deploy the Edge Function: `supabase/functions/contact/index.ts`
6. Start the dev server:
   ```bash
   docker compose up
   ```

### Scripts

```bash
npm run dev       # Vite dev server (no Docker)
npm run build     # Production build
npm run preview   # Preview production build
```

## Project Structure

```
├── pages/                    # Vite root, all HTML entry points
│   ├── index.html            # Home
│   ├── podcasts.html         # Podcast list
│   ├── podcast-detail.html   # Single podcast
│   ├── about.html            # About + contact
│   ├── js/                   # JavaScript modules
│   └── style/                # CSS files
├── docs/                     # Documentation
│   ├── wireframes.md         # ASCII wireframes (3 breakpoints × 4 pages)
│   ├── styleguide.md         # Typography, colors, spacing, components
│   ├── ai-usage.md           # AI collaboration documentation
│   ├── supabase-schema.sql   # Database schema
│   ├── supabase-seed.sql     # Seed data
│   └── supabase-contact.sql  # Contact messages table
├── supabase/functions/       # Supabase Edge Functions
├── docker/                   # Docker configs (Nginx)
├── docker-compose.yml        # Production
├── docker-compose.override.yml  # Development
└── vite.config.js            # Multi-page build config
```

## Documentation

| Document | Description |
|---|---|
| [Wireframes](docs/wireframes.md) | ASCII wireframes for mobile, tablet, desktop |
| [Style Guide](docs/styleguide.md) | Typography, colors, spacing, components |
| [AI Usage](docs/ai-usage.md) | How AI was used throughout the project |
| [Supabase Schema](docs/supabase-schema.sql) | Database tables, RLS, storage policies |
| [Supabase Seed](docs/supabase-seed.sql) | 8 categories, 3 presenters, 12 podcasts |
| [Supabase Contact](docs/supabase-contact.sql) | Contact messages table |

## Architecture

- **Reads:** Browser → Supabase anon key (gated by RLS policies)
- **Writes:** Contact form → Supabase Edge Function → `service_role` key (never exposed to browser)
- **Header/Footer:** Rendered via JS modules using `insertAdjacentHTML`
- **Data:** All podcast data fetched from Supabase at runtime (not hardcoded)

## Conventions

- ES modules (`type="module"`)
- No CSS preprocessors
- No frameworks
- Mobile-first: base = mobile, `min-width` queries only
- Touch targets: minimum 44px
- Commits: `type: short description` (feat, refactor, fix, docs, chore)

## License

This is a school project. See [LICENSE](LICENSE) for details.

## Acknowledgments

- **School:** Technical Vocational School Zurich, IT Department
- **Module:** M293 PA04
- **Format:** Individual work, 20 lessons
- **AI Tool:** opencode (Qwen) — used for code generation, problem solving, and documentation
