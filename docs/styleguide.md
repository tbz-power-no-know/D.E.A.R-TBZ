# Style Guide — D.E.A.R. Podcast Website

---

## Colors

| Variable | Value | Usage |
|---|---|---|
| `--primary` | `#000000` | Headings, buttons, backgrounds, active states |
| `--secondary` | `#ffffff` | Text on dark backgrounds, form inputs |
| `--text-color` | `#1a1a1a` | Body text |
| `--border-color` | `#e0e0e0` | Borders, dividers, input outlines |
| `--bg-color` | `#ffffff` | Page background, card backgrounds |

> **Note:** Primary and secondary are placeholders. Will be updated to final palette later.

---

## Typography

**Font families (Google Fonts):**
- **Headings:** Lora (serif) — `--font-heading: 'Lora', Georgia, serif`
- **Body:** Inter (sans-serif) — `--font-body: 'Inter', system-ui, sans-serif`

| Element | Size (mobile) | Size (tablet) | Size (desktop) | Weight |
|---|---|---|---|---|
| `h1` | 30px | 30px | 30px | 900 |
| `h2` | 15px | 15px | 15px | 900 |
| `.hero-title` | 36px | 36px | 36px | 900 |
| `.section-title` | 28px | 28px | 28px | 900 |
| `.detail-title` | 28px | 32px | 32px | 900 |
| `.podcast-card-title` | 18px | 18px | 18px | 600 |
| Body text | 16px | 16px | 16px | 400 |
| Small text | 14px | 14px | 14px | 400 |
| Labels | 14px | 14px | 14px | 600 |

**Line heights:**
- Body: `1.6`
- Hero subhead: `1.6`
- Transcription: `1.8`
- Card descriptions: `1.4`

---

## Spacing

| Context | Value |
|---|---|
| Section padding (mobile) | `20px 16px` |
| Section padding (tablet) | `32px 24px` |
| Section padding (desktop) | `48px 40px` |
| Grid gap (mobile) | `24px` |
| Grid gap (tablet) | `24px` |
| Grid gap (desktop) | `24px` |
| Card padding | `16px` |
| Form gap | `16px` |

---

## Components

### Card (Podcast)
- Background: `--primary`
- Border radius: `16px`
- Color: `--secondary`
- Cover: `aspect-ratio: 9/16`, `object-fit: cover`
- Padding: `16px`

### Card (Category)
- Background: `--primary`
- Border radius: `12px`
- Color: `--secondary`
- Padding: `20px`

### Buttons
- Filter button: `8px 16px` padding, `20px` border-radius, `14px` font
- Sort button (`.sort-btn`): same style as filter button, left-aligned above filter bar
- Submit button: `12px` padding, `8px` border-radius, `16px` font, `min-height: 44px`
- Touch target: minimum `44px`

### Inputs
- Padding: `10px`
- Border: `1px solid --border-color`
- Border radius: `8px`
- Font size: `16px`
- Focus: `border-color: --primary`

### Audio Player
- Native HTML5 `<audio controls>`
- Width: `100%`
- Max-width: none (fills container)

### Transcription Sync
- Container: `.transcription-text` — `max-height: 400px`, `overflow-y: auto`
- Timestamps: `.timestamp` — clickable, seeks audio to that time
- Active state: `.timestamp.active` — `background: --primary`, `color: --secondary`, `padding: 2px 4px`, `border-radius: 4px`
- Behavior: auto-scrolls to active timestamp on `timeupdate`, clears on `pause`/`ended`/`seeking`

### Navigation
- Mobile: hamburger toggle (`☰`), nav hidden by default
- Desktop: full nav always visible, hamburger hidden

---

## Breakpoints

| Breakpoint | Range | Query |
|---|---|---|
| Mobile | < 480px | Base styles (no query) |
| Tablet | 481-1024px | `@media (min-width: 481px)` |
| Desktop | 1025px+ | `@media (min-width: 1025px)` |

---

## Grid Layouts

| Page | Mobile | Tablet | Desktop |
|---|---|---|---|
| Home - Podcasts | 1 col | 2 col | 3 col |
| Home - Categories | 1 col | 2 col | 3 col |
| Podcasts list | 1 col | 2 col | 3 col |

---

## Conventions
- Mobile-first CSS (base = mobile, `min-width` queries)
- CSS variables for all colors
- CSS Grid for layouts
- Touch targets minimum 44px
- No CSS preprocessors
