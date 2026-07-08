# Styleguide — D.E.A.R. Podcast-Website

---

## Farben

| Variable | Wert | Verwendung |
|---|---|---|
| `--primary` | `#000000` | Überschriften, Buttons, Hintergründe, aktive Zustände |
| `--secondary` | `#ffffff` | Text auf dunklen Hintergründen, Formularfelder |
| `--text-color` | `#1a1a1a` | Fliesstext |
| `--border-color` | `#e0e0e0` | Ränder, Trennlinien, Input-Umriss |
| `--bg-color` | `#ffffff` | Seitenhintergrund, Kartenhintergründe |

> **Hinweis:** Primary und Secondary sind Platzhalter. Werden später an die endgültige Farbpalette angepasst.

---

## Typografie

**Schriftfamilien (Google Fonts):**
- **Überschriften:** Lora (serif) — `--font-heading: 'Lora', Georgia, serif`
- **Fliesstext:** Inter (sans-serif) — `--font-body: 'Inter', system-ui, sans-serif`

| Element | Größe (Mobile) | Größe (Tablet) | Größe (Desktop) | Gewicht |
|---|---|---|---|---|
| `h1` | 30px | 30px | 30px | 900 |
| `h2` | 15px | 15px | 15px | 900 |
| `.hero-title` | 36px | 36px | 36px | 900 |
| `.section-title` | 28px | 28px | 28px | 900 |
| `.detail-title` | 28px | 32px | 32px | 900 |
| `.podcast-card-title` | 18px | 18px | 18px | 600 |
| Fliesstext | 16px | 16px | 16px | 400 |
| Kleiner Text | 14px | 14px | 14px | 400 |
| Beschriftungen | 14px | 14px | 14px | 600 |

**Zeilenhöhen:**
- Fliesstext: `1.6`
- Hero-Unterüberschrift: `1.6`
- Transkription: `1.8`
- Kartenbeschreibungen: `1.4`

---

## Abstände

| Kontext | Wert |
|---|---|
| Sektions-Padding (Mobile) | `20px 16px` |
| Sektions-Padding (Tablet) | `32px 24px` |
| Sektions-Padding (Desktop) | `48px 40px` |
| Grid-Abstand (Mobile) | `24px` |
| Grid-Abstand (Tablet) | `24px` |
| Grid-Abstand (Desktop) | `24px` |
| Karten-Padding | `16px` |
| Formular-Abstand | `16px` |

---

## Komponenten

### Karte (Podcast)
- Hintergrund: `--primary`
- Eckenradius: `16px`
- Farbe: `--secondary`
- Cover: `<div class="cover-wrapper">` umhüllt das `<img>`, `aspect-ratio: 9/16`, `display: grid`, `place-items: center`
- Cover-Hintergrund: extrahierte dominante Farbe via `getDominantColor()` (Fallback: `var(--primary)`)
- Padding: `16px`

### Karte (Kategorie)
- Hintergrund: Kategorie-`color` aus der DB (Fallback auf `--primary`)
- Eckenradius: `12px`
- Farbe: `--secondary`
- Padding: `20px`
- Bild: `64px` Kreis, falls `image_url` gesetzt
- Klickbar: verlinkt zu `podcasts.html?category=<id>`

### Buttons
- Filter-Button: `8px 16px` Padding, `20px` Eckenradius, `14px` Schrift
- Sortier-Button (`.sort-btn`): gleiches Design wie Filter-Button, linksbündig über der Filterleiste
- Absenden-Button: `12px` Padding, `8px` Eckenradius, `16px` Schrift, `min-height: 44px`
- Touch-Ziel: mindestens `44px`
- Filter aktiv: verwendet Kategorie-Farbe aus der DB als Hintergrund

### Hover-Animationen
- Podcast-/Kategorie-Karten: `translateY(-2px)` + Schatten `0 4px 12px rgba(0,0,0,0.15)`, `transition: 0.2s ease`
- Filter-/Sortier-Buttons: `scale(0.97)`, `transition: 0.2s`
- Absenden-Button: `translateY(-1px)`, `transition: 0.2s ease`
- Präsentator-Karte: Randfarbe ändert sich zu `--primary` beim Hover
- Zurück-Link: Opazität 0,7→1 + Unterstreichung beim Hover

### Feststehender Header
- `position: fixed; top: 0`, `z-index: 100`
- Standardmäßig beim Laden ausgeblendet, blendet sich beim Runterscrollen aus (20px-Schwelle), blendet sich beim Hochscrollen ein
- Immer sichtbar am Seitenanfang (scrollY <= 10)
- `--header-height` CSS-Variable verhindert Inhaltsüberlappung

### Footer
- Normaler Dokumentenfluss, am Seitenende (nicht feststehend)

### Newsletter-Formular
- Input: `12px 16px` Padding, `8px` Eckenradius, `16px` Schrift, `min-height: 44px`
- Button: `12px 24px` Padding, `8px` Eckenradius, `16px` Schrift, `min-height: 44px`
- Validierung: clientseitige E-Mail-Regex-Prüfung
- Speichert in Supabase (`newsletter_subscribers`, INSERT-only RLS)
- Duplikate: "Du bist bereits abonniert!" (als Erfolg)
- Statusmeldungen: Erfolg (grün), Fehler (rot)

### Eingabefelder
- Padding: `10px`
- Rand: `1px solid --border-color`
- Eckenradius: `8px`
- Schriftgröße: `16px`
- Fokus: `border-color: --primary`

### Audioplayer
- Natives HTML5 `<audio controls>`
- Breite: `100%`
- Maximale Breite: keine (füllt Container aus)
- **Feststehend:** `position: sticky; top: 0` — bleibt am oberen Rand des Viewports beim Scrollen
- Wird über der Transkription gerendert, nicht darunter

### Transkriptions-Sync
- Container: `.transcription-text` — keine max-height, kein Overflow (vollständiger Text sichtbar)
- Zeitstempel: `.timestamp` — anklickbar, sucht Audio zu dieser Zeit
- Aktiver Zustand: `.timestamp.active` — `background: --primary`, `color: --secondary`, `padding: 2px 4px`, `border-radius: 4px`
- Verhalten: `scrollIntoView` scrollt die **Seite** (nicht den Container), um aktiven Zeitstempel zu zentrieren
- Audioplayer ist feststehend über der Transkription, bleibt beim Scrollen sichtbar

### Navigation
- Mobile: Hamburger-Menü (`☰`), Navigation standardmäßig ausgeblendet
- Desktop: volle Navigation immer sichtbar, Hamburger ausgeblendet

### Cover-Wrapper (`.cover-wrapper`)
- Umhüllt `.podcast-cover` in Podcast-Karten und Detailseite
- `aspect-ratio: 9/16`, `display: grid`, `place-items: center`
- `background-color`: extrahierte dominante Farbe (Fallback: `var(--primary)`)
- Bild: `width: 100%`, `object-fit: cover` (Desktop: `contain`)
- Farbe füllt Briefmarken-Lücken bei `object-fit: contain`

### Dark-Mode
- Toggle im Header: Sonne (Dark → Light) / Mond (Light → Dark)
- `data-theme="dark"` auf `<html>`
- Alle Komponenten haben `[data-theme="dark"]`-Overrides
- `localStorage`-Persistenz, `prefers-color-scheme`-Respektierung

---

## Breakpoints

| Breakpoint | Bereich | Query |
|---|---|---|
| Mobile | < 480px | Basis-Styles (keine Query) |
| Tablet | 481–1024px | `@media (min-width: 481px)` |
| Desktop | 1025px+ | `@media (min-width: 1025px)` |

---

## Grid-Layouts

| Seite | Mobile | Tablet | Desktop |
|---|---|---|---|
| Startseite – Podcasts | 1 Spalte, max. 3 | 2 Spalten, max. 4 | 5 Spalten, max. 5 |
| Startseite – Kategorien | 1 Spalte | 2 Spalten | 3 Spalten |
| Podcast-Liste | 1 Spalte | 2 Spalten | 5 Spalten |

---

## Konventionen
- Mobile-First-CSS (Basis = Mobile, `min-width`-Abfragen)
- CSS-Variablen für alle Farben
- CSS-Grid für Layouts
- Touch-Ziele mindestens 44px
- Keine CSS-Preprozessoren
