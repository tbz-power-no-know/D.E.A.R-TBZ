# D.E.A.R — Podcast-Website

> **Schnellreferenz.** Vollständiger detaillierter Plan in `.prompt/objective-detailed.md` — **VERITE (absolute Wahrheitsquelle)**.

## KI-Regeln
1. **Fragen vor dem Handeln** — niemals raten, wenn unsicher
2. **Sauberer, lesbarer Code** — immer
3. **Nach jeder sinnvollen Änderung commiten** — `typ: beschreibung`

## Kurzinfos

- **Was:** Schul-Podcast-Website für Buchvorstellungen (D.E.A.R. = Drop Everything And Read)
- **Stack:** Vite 8, vanilla HTML/CSS/JS, Supabase-Backend, Docker/Nginx
- **Mobile-First:** Basis ~375px (iPhone SE/12), Tablet 481px+, Desktop 1025px+ (5-Spalten-Grid)
- **Farben:** `--primary: #000`, `--secondary: #fff` (Platzhalter, werden geändert)
- **Keine Frameworks** — nur eigenes HTML/CSS, KI-Unterstützung erlaubt
- **Status:** Phase 1–2, 4–5 erledigt. Phase 3 meist erledigt (Transkriptions-Sync, Newsletter-Supabase, Skeleton-Loader ausstehend). Supabase vollständig bereitgestellt (Schema, Seed, Buckets, Edge-Function). GitHub-Pages-Workflow erstellt, braucht Push.

## Neueste Funktionen
- Newsletter speichert E-Mail in Supabase (`newsletter_subscribers`, INSERT-only RLS)
- Dominante Cover-Farbe via Canvas (`colorExtract.js`) — Karten + Detailseite
- Dark-Mode mit Sonne/Mond-Toggle, `localStorage`-Persistenz
- Logo animiert (Seitenblätter, 5s-Zyklus), CSS-Variablen für Dark-Mode
- SVGs in `public/`, werden via `fetch()` zur Laufzeit geladen
- Feststehender Audioplayer über Transkription (voller Text, kein Overflow)
- Feststehender Header (blendet sich beim Runterscrollen aus, zeigt sich beim Hochscrollen)
- Kategorie-Farben + -Bilder in der DB, in der UI gerendert
- Hover-Animationen auf Karten, Buttons, Links

## Seiten

| Datei | Zweck |
|---|---|
| `index.html` | Startseite: Hero → Einführung zu DEAR → Features → neueste Podcasts → Kategorien |
| `podcasts.html` | Alle Podcasts: Suche → Sortierumschalter → Kategoriefilter → Raster |
| `podcast-detail.html` | Einzelner Podcast: Cover (9:16), Info, Beschreibung, Transkription `[MM:SS]`, Audioplayer, Präsentator |
| `about.html` | Über Projekt + Kontaktformular (Honeypot, Edge-Function-Absendung) |

## Wichtige Architektur

- **Vite-Root = `pages/`**, entdeckt automatisch `*.html` als Einstiegspunkte
- **Header/Footer** über JS-Module gerendert (`insertAdjacentHTML`)
- **Header-SVGs** (Logo, Sonne, Mond) via `fetch()` aus `public/` geladen und inline eingefügt
- **Alle Daten von Supabase** — Podcasts, Kategorien, Präsentatoren, Audio, Cover
- **Lesezugriffe:** direkter Browser → Supabase anon key (RLS-geschützt)
- **Schreibzugriffe:** Kontaktformular → Edge-Function → `service_role` key; Newsletter → direkt INSERT (anon key, INSERT-only RLS)
- **CSS-Strategie:** `reset.css` → `main.css` (gemeinsam + Variablen) → pro-Seite-CSS
- **Aufklappbarer Text** beibehalten (`.expandable-text` + `.expand-btn`)
- **Feststehender Header** blendet sich beim Runterscrollen aus, zeigt sich beim Hochscrollen
- **Feststehender Audioplayer** oben auf der Seite beim Scrollen der Transkription
- **Footer** am Seitenende (normaler Fluss)

## Supabase

- Tabellen: `categories`, `podcasts`, `presenters`, `podcast_presenters`, `contact_messages`, `newsletter_subscribers`
- `newsletter_subscribers`: INSERT-only RLS (keine SELECT — E-Mails sind privat)
- Buckets: `podcast-audio`, `podcast-cover`, `presenter-photos`
- Edge-Function: `contact` (serverseitige Validierung + Insert) — **bereitgestellt**

## Ausstehend

- Auf Webserver veröffentlichen (GitHub-Pages-Workflow existiert, braucht Push + Pages-Konfiguration)
- Skeleton-Loader (VERITE Phase 3 gibt sie vor; derzeit reiner Text)

## Konventionen

- ES-Module, keine CSS-Preprozessoren, keine Frameworks
- Mobile-First: Basis = Mobile, nur `min-width`-Abfragen
- Touch-Ziele: mindestens 44px
- Commits: `typ: kurze beschreibung` (feat, refactor, fix, docs, chore)

## Zukunft (nicht jetzt)

- NuxtJS + TypeScript (v2)
- Benutzerkonten, Lesezeichen
