# D.E.A.R — Detaillierter Projektplan

> **VERITE = DIESES DOKUMENT.** Dies ist die absolute Wahrheitsquelle. Wenn hier etwas mit dem Code-Repository im Widerspruch steht, gilt dieses Dokument. Wenn etwas unklar oder mehrdeutig ist, **frage den Benutzer, bevor du weitermachst**.

---

## KI-Assistent-Regeln

1. **Fragen vor dem Handeln** — bei Zweifel, Unklarheit oder fehlenden Informationen den Benutzer fragen. Niemals raten.
2. **Sauberer, lesbarer Code** — gut strukturiert, korrekt eingerückt, aussagekräftige Namen, keine Abkürzungen. Code sollte auf einen Blick leicht zu lesen und zu verstehen sein.
3. **Nach jeder sinnvollen Änderung commiten** — jede logische Änderung bekommt eigenen Commit mit klarer `typ: beschreibung`-Nachricht. Dies erstellt eine lesbare Historie zum Debuggen und Verstehen, was warum geändert wurde.
4. **Dieses Dokument befolgen** — alle Entscheidungen, Konventionen und Pläne hier sind verbindlich.
5. **Bestehenden CSS-Stil befolgen** — denselben Stil wie das aktuelle CSS beibehalten. Verbesserungen für saubereren/besseren Code sind willkommen, aber die allgemeine Stilrichtung nicht ändern.

---

## Projektgeschichte

### Vorbereitung (vor der KI) — 10 Stunden

- Wireframes manuell erstellt (ohne KI)
- Docker-Boilerplate eingerichtet (minimale KI-Hilfe)
- Erkundung: Supabase-Recherche, kein-Framework/keine-SPA-Ansatz
- Gespräche mit der Lehrperson zur besten Lösung

### Grundlage

- Basisdateien vom Entwickler erstellt (Commit `ba5a9cd`)
- KI hat von dieser Grundlage weitergearbeitet

### Planung

- `objective-detailed.md` durch KI-Austausch erstellt
- Alle architektonischen Entscheidungen vom Entwickler

### Entwicklung

- KI generiert Code, Entwickler prüft jede Zeile
- Regelmässige Commits für Konsistenz
- Kein "Vibe Coding" — весь Code verstanden vor der Akzeptanz

### Tool-Auswahl

- opencode (Qwen) anstelle von Claude gewählt: lokales Hosting für Datenschutz und Ökologie

---

## Was ist D.E.A.R.?

**Drop Everything And Read** — ein schulweites Projekt, bei dem Schülerinnen und Schüler Buchvorstellungen als Podcasts in ABU- (Allgemeinbildung) Klassen produzieren. Diese Website veröffentlicht und präsentiert diese Podcasts.

**Schule:** Technische Berufsschule Zürich, IT-Abteilung > Informatik  
**Modul:** M293 PA04  
**Format:** Einzelarbeit, 20 Lektionen

---

## Kernanforderungen (aus dem Auftrag)

### Pflichtseiten (mindestens 3)

1. **Startseite** — neueste Podcasts, Kategorieübersicht, Einführung zu DEAR, Hero-Bereich
2. **Podcasts** — alle Podcasts im Raster, Kategoriefilter, Suche
3. **Podcast-Detail** — Cover (9:16), Buchinfo, Beschreibung, Transkription mit `[MM:SS]`, Audioplayer, Präsentator-Karte
4. **Über uns** — Projektinfo, Kontaktformular mit Betreff-Dropdown

### Pflichtinhalte

- **Mindestens 12 Podcasts** mit: Cover (9:16), Beschreibung, Kategorie, Audiodatei, Präsentator, Transkription
- **Wireframes** für Mobile/Tablet/Desktop (Markdown, in Git)
- **Styleguide** mit Typografie und Farben (Markdown, in Git)
- **KI-Nutzungsdokumentation** (Markdown, in Git)

### Technische Anforderungen

- **100 % eigenes HTML/CSS** — KI-Unterstützung erlaubt, Frameworks NICHT erlaubt
- **Seitenstruktur:** Header, Main, Footer
- **CSS-Grid** für Podcast-Übersicht und Inhalte
- **Formulare:** Newsletter und Kontakt
- **Responsive Design (Mobile-First):**
  - Mobile: bis 480px (Basis-Styles, designed für iPhone SE / iPhone 12 ~375px)
  - Tablet: 481px – 1024px (`min-width: 481px`)
  - Desktop: ab 1025px (`min-width: 1025px`)
- **Veröffentlicht** auf einem Webserver

### Optionale Funktionen

- [x] Suchfunktion (JavaScript) — **gewünscht**
- [ ] Benutzerkonto, Registrierung, Login/Logout (Web Storage API)
- [ ] Lesezeichenliste / Favoriten (Web Storage API) — **übersprungen**

---

## Stack

| Ebene         | Technologie                               |
| ------------- | ----------------------------------------- |
| Build         | Vite 8 (mehrzeiliges Input)               |
| Runtime       | Node 25 (Dev), Nginx 1.30 (Prod)          |
| Backend       | Supabase (Datenbank, Speicher, Auth)      |
| Infrastruktur | Docker Compose + Devcontainer             |
| Sprachen      | Vanilla HTML, CSS, JavaScript (ES-Module) |

---

## Design-Entscheidungen

### Mobile-First-CSS

- Basis-Styles zielen auf **~375px Viewport** (iPhone SE / iPhone 12)
- Touch-Ziele: **mindestens 44px** (Apple HIG)
- Grid: **1 Spalte** auf Mobile, **2 Spalten** ab 481px+, **5 Spalten** ab 1025px+
- Navigation: **Hamburger-Menü** auf Mobile, volle Navigation auf Desktop
- Keine `max-width`-Abfragen — nur `min-width` (echtes Mobile-First)

### Farben

- CSS-Variablen in `main.css`: `--primary`, `--secondary`
- Aktuell: `--primary: #000`, `--secondary: #fff` (Platzhalter, werden später geändert)
- Alle Farben über Variablen referenziert, keine hardcoded-Werte

### Typografie

- **Überschriften:** Lora (serif) — `var(--font-heading)` — Google Fonts
- **Fliesstext:** Inter (sans-serif) — `var(--font-body)` — Google Fonts
- `h1`: 30px, `h2`: 15px (Basis-Mobile-Grössen)

### Gemeinsam genutzte Komponenten

- Header und Footer über JS-Module mit `insertAdjacentHTML` gerendert
- Kein Framework — reine Funktionen, keine Templates, kein virtuelles DOM
- Jede Seite inkludiert `<script type="module" src="/js/main.js">`

### Daten

- Alle Podcast-Daten in **Supabase** gespeichert (nicht im HTML hardcoded)
- Audiodateien im Supabase Storage (`podcast-audio`-Bucket)
- Coverbilder im Supabase Storage (`podcast-covers`-Bucket)
- Präsentator-Fotos im Supabase Storage (`presenter-photos`-Bucket)
- Newsletter-E-Mails in `newsletter_subscribers` (direkt via anon key, INSERT-only RLS)

### Header-SVGs

- Logo (`logo.svg`), Sonne (`sun-icon.svg`) und Mond (`moon-icon.svg`) liegen in `public/`
- Werden zur Laufzeit via `fetch()` geladen und als HTML inline eingefügt (CSS-Variablen funktionieren)
- Logo verwendet `var(--logo-dark)` / `var(--logo-light)` für Dark-Mode-Unterstützung
- Logo hat animierte Seitenblätter (`page-left` / `page-right` Keyframe-Animation, 5s-Zyklus)

### Dominante Cover-Farbe

- `colorExtract.js`: `getDominantColor(imgSrc)` — zeichnet Bild auf 50×50 Canvas, bucketet RGB auf 32-Schritt-Intervalle, gibt häufigste Farbe als Hex zurück
- Wird auf Podcast-Karten (Home + Liste) und Detailseite angewendet
- `.cover-wrapper` umhüllt das Coverbild, zeigt extrahierte Farbe als Hintergrund (Fallback: `var(--primary)`)
- Auf Desktop (`object-fit: contain`) füllt die Farbe die Briefmarken-Lücken natürlich

### Dark-Mode

- Toggle-Button im Header (Sonne/Mond-Icon, SVG aus `public/`)
- `data-theme` Attribut auf `<html>` (`"light"` / `"dark"`)
- `localStorage`-Persistenz, `prefers-color-scheme`-Respektierung
- Alle Komponenten haben `[data-theme="dark"]`-Overrides in `main.css`
- Hintergrund-Kreise (`bg-circles`) reduzieren Opazität im Dark-Mode

### Backend-Zugriff / Schreibpfad

- **Lesezugriffe direkt:** der Browser fragt Supabase-Tabellen mit dem **anon key** ab, geschützt durch lese-only RLS-Richtlinien. Der anon key ist **von Design her öffentlich** — die Sicherheit kommt von **RLS, nicht vom Verstecken** der Architektur. Kein Server für Lesezugriffe nötig.
- **Schreibzugriffe — zwei Wege:**
  - **Kontaktformular:** wird an eine **Supabase Edge Function** (`supabase/functions/contact/`) gesendet, niemals direkt mit dem anon key eingefügt. Die Function **validiert serverseitig**, filtert Spam über einen Honeypot und fügt mit dem **`service_role` key** ein, der **niemals den Browser erreicht**.
  - **Newsletter:** schreibt direkt in `newsletter_subscribers` mit dem **anon key**, geschützt durch INSERT-only RLS-Richtlinie. Keine SELECT-Richtlinie — E-Mails sind für niemanden ohne `service_role` einsehbar.
  - Alle Supabase-Zugriffe bleiben zentralisiert in `pages/js/data.js`.
- **Regel:** niemals ein Geheimnis (z. B. `service_role`) in eine `VITE_`-präfixierte Variable setzen — Vite inline-t diese in das ausgelieferte Bundle. Nur der öffentliche anon key wird ausgeliefert.

### Transkription

- Als reiner Text mit `[MM:SS]`-Zeitstempeln pro Zeile gespeichert
- Beispiel: `[00:00] Willkommen zu dieser Buchvorstellung...\n[01:23] Die Autorin beschreibt...`
- Zukunft: Transkriptions-Hervorhebung mit Audiowiedergabe-Zeit synchronisieren

### Aufklappbarer Text

- Aus dem ursprünglichen Design beibehalten
- `.expandable-text` clampet bei `max-height: 5em`, `.expanded` zeigt vollen Inhalt
- Umschalten über `.expand-btn`-Button

### Footer-Akkordeon (Mobile)

- Auf Mobile (< 481px): Footer-Sektionstitel sind anklickbar, Links klappen mit Animation auf
- Unabhängige Umschalter — mehrere Sektionen können gleichzeitig offen sein
- Chevron (▼)-Indikator dreht sich, wenn offen
- Auf Tablet+ (≥ 481px): alle Links immer sichtbar, kein Toggle-Verhalten

### Feststehender Header

- Header ist `position: fixed` am oberen Rand des Viewports
- Standardmäßig beim Laden ausgeblendet
- Blendet sich beim Runterscrollen aus (Schwelle: 20px), blendet sich beim Hochscrollen ein
- Immer sichtbar, wenn Benutzer den Seitenanfang erreicht (scrollY <= 10)
- `--header-height` CSS-Variable wird dynamisch gesetzt, um Inhaltsüberlappung zu verhindern

### Footer

- Footer ist am Seitenende (normaler Dokumentenfluss, nicht feststehend)

### Feststehender Audioplayer

- Audioplayer (`detail-audio`) ist `position: sticky; top: 0` — haftet am oberen Rand des Viewports beim Scrollen
- Wird über der Transkription gerendert, nicht darunter
- Transkription hat keinen Overflow — voller Text sichtbar, Seite scrollt natürlich
- Aktiver Zeitstempel wird immer noch hervorgehoben und `scrollIntoView` scrollt die Seite, um ihn zu zentrieren

### Seitenorientierung

- Podcasts-Seite: `<h2 class="section-title">Alle Podcasts</h2>` oben
- Podcast-Detail: Zurück-Link (`&larr; Alle Podcasts`) über dem Coverbild

### Kategorie-Farben und -Bilder

- Kategorien haben `color` (Hex) und `image_url`-Spalten in Supabase
- Startseite: Kategorie-Karten verwenden Farbe als Hintergrund, zeigen Bild an, falls gesetzt
- Filter-Buttons: aktiver Zustand verwendet Kategorie-Farbe anstelle von generischem `--primary`
- Klick auf Kategorie auf Startseite navigiert zu `podcasts.html?category=<id>` mit automatisch aktiviertem Filter

### Hover-Animationen

- Podcast-/Kategorie-Karten: `translateY(-2px)` + Schatten beim Hover
- Filter-/Sortier-Buttons: `scale(0.97)` beim Hover
- Absenden-Button: `translateY(-1px)` beim Hover
- Präsentator-Karte: Randfarbwechsel beim Hover
- Zurück-Link: Opazität + Unterstreichung beim Hover

### Header-Navigation (Mobile)

- Auf Mobile (< 481px): Hamburger-Button (☰) löst Dropdown-Menü aus, das unter der Header-Leiste aufklappt
- Dropdown: heller Hintergrund mit Schatten, Links vertikal gestapelt, weisser Text
- Verwendet `max-height`-Transition für sanftes Öffnen/Schliessen
- Auf Desktop (≥ 1025px): Navigation immer inline sichtbar, Hamburger ausgeblendet

---

## Supabase-Schema

Vollständige SQL-Dateien in `docs/`:

| Datei                       | Zweck                                                             |
| --------------------------- | ----------------------------------------------------------------- |
| `docs/supabase-schema.sql`  | Tabellen, RLS, Richtlinien, Speicher-Richtlinien                  |
| `docs/supabase-seed.sql`    | 8 Kategorien, 3 Präsentatoren, 12 Beispiel-Podcasts               |
| `docs/supabase-contact.sql` | `contact_messages`-Tabelle + RLS (keine öffentlichen Richtlinien) |

**Tabellen:** `categories` (mit `image_url`, `color`), `podcasts`, `presenters`, `podcast_presenters`, `contact_messages` (nur schreibbar über Edge Function), `newsletter_subscribers` (INSERT-only RLS, keine SELECT-Richtlinie)
**Storage-Buckets:** `podcast-audio`, `podcast-covers`, `presenter-photos`, `category-images`
**Ausführungsreihenfolge:** zuerst Schema, dann Seed (Kontakt-Tabelle ist nun im Schema)

---

## Seitenstruktur (final)

### Startseite (`index.html`)

```
┌─────────────────────────┐
│ Header (via JS gerendert)│
├─────────────────────────┤
│ Hero-Bereich            │  ← Schwarzer Hintergrund, weisser Text, D.E.A.R.-Titel + Untertitel
├─────────────────────────┤
│ Einführung zu DEAR      │  ← Worum es beim Projekt geht
├─────────────────────────┤
│ Neueste Podcasts        │  ← Von Supabase abgerufen, zuerst die neuesten
├─────────────────────────┤
│ Kategorieübersicht      │  ← Alle Kategorien (Name + Link, noch keine Beschreibungen)
├─────────────────────────┤
│ Newsletter              │  ← E-Mail-Input + Abonnieren-Button, clientseitige Validierung
├─────────────────────────┤
│ Footer (via JS gerendert)│
└─────────────────────────┘
```

### Podcast-Liste (`podcasts.html`)

```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ Suchleiste              │  ← Clientseitige Suche (Titel + Beschreibung)
├─────────────────────────┤
│ Sortierumschalter       │  ← Zuerst neueste / zuerst älteste (rechtsbündig)
├─────────────────────────┤
│ Kategorie-Filter-Buttons│  ← Alle, Krimi, Fantasy, Sachbuch usw.
├─────────────────────────┤
│ Podcast-Raster          │  ← Karten mit Cover, Titel, Abspielen-Button
│ (1 Spalte → 2 → 3–4)    │
├─────────────────────────┤
│ Footer                  │
└─────────────────────────┘
```

### Podcast-Detail (`podcast-detail.html`)

```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ ← Alle Podcasts         │  ← Zurück-Link
├─────────────────────────┤
│ 9:16-Coverbild          │  ← aspect-ratio: 9/16, object-fit: cover
├─────────────────────────┤
│ Buchtitel               │
│ Buchinfo                │  ← Kategorie, Dauer, Datum
├─────────────────────────┤
│ Beschreibung            │
├─────────────────────────┤
│ [Audioplayer]           │  ← Feststehend, bleibt oben beim Scrollen
├─────────────────────────┤
│ Transkription           │  ← Vollständiger Text, kein Overflow, Seite scrollt
│ (scrollt mit der Seite) │  ← [MM:SS]-Zeitstempel synchron mit Audio
├─────────────────────────┤
│ Präsentator-Karte       │  ← Foto + Name + Biografie
├─────────────────────────┤
│ Footer (feststehend)    │  ← Blendet sich beim Runterscrollen aus, zeigt sich beim Hochscrollen
└─────────────────────────┘
```

### Über uns (`about.html`)

```
┌─────────────────────────┐
│ Header                  │
├─────────────────────────┤
│ Über das DEAR-Projekt   │  ← Projektbeschreibung
├─────────────────────────┤
│ Kontaktformular (#contact)│ ← Name, E-Mail, Betreff-Dropdown, Nachricht, Honeypot
├─────────────────────────┤
│ Footer                  │
└─────────────────────────┘
```

**Hinweis:** Die Kontakt-Sektion braucht `id="contact"`, damit der Footer-Anker-Link (`about.html#contact`) funktioniert.

---

## Dateistruktur (aktuell)

```
├── pages/
│   ├── index.html              ← Startseite
│   ├── podcasts.html           ← Podcast-Liste + Filter + Suche
│   ├── podcast-detail.html     ← Einzelner Podcast-Detail
│   ├── about.html              ← Über uns + Kontaktformular
│   ├── js/
│   │   ├── main.js             ← Einstieg: Header, Footer, pro-Seite Init-Dispatch
│   │   ├── expandable.js       ← Aufklappbaren Text umschalten (init via home.js, filter.js, search.js)
│   │   ├── darkmode.js         ← Dark-Mode-Initialisierung + Toggle
│   │   ├── supabase.js         ← Supabase-Client-Initialisierung
│   │   ├── data.js             ← Fetch-Funktionen, sendContactMessage, subscribeNewsletter
│   │   ├── colorExtract.js     ← getDominantColor() via Canvas
│   │   ├── filter.js           ← Kategoriefilter-Logik
│   │   ├── search.js           ← Clientseitige Suche (debounced)
│   │   ├── home.js             ← renderLatestPodcasts, renderCategories, initNewsletter
│   │   ├── podcast-detail.js   ← initPodcastDetail, renderPodcast
│   │   ├── contact.js          ← Kontaktformular-Validierung + -Absendung
│   │   └── shared/
│   │       ├── Header.js       ← renderHeader() (async, fetch SVGs from public/)
│   │       └── Footer.js       ← renderFooter()
│   └── style/
│       ├── reset.css            ← Meyerweb-Reset
│       ├── main.css             ← Variablen, gemeinsame Styles, Header, Footer, Dark-Mode, Animation
│       ├── components.css       ← Shared components: podcast-card, buttons, loading-text, detail-back
│       ├── home.css             ← Startseite-Styles
│       ├── podcasts.css         ← Podcast-Liste + Filter + Suche Styles
│       ├── podcast-detail.css   ← Detailseite-Styles
│       └── about.css            ← Über-uns-Seite-Styles
├── public/                     ← Statische Assets
│   ├── logo.svg                 ← Logo mit CSS-Variablen + animierte Seitenblätter
│   ├── sun-icon.svg             ← Dark-Mode-Toggle-Icon (Helligkeit)
│   └── moon-icon.svg            ← Dark-Mode-Toggle-Icon (Dunkelheit)
├── docs/
│   ├── wireframes.md            ← ASCII-Wireframes (Mobile/Tablet/Desktop)
│   ├── styleguide.md            ← Typografie, Farben, Abstände
│   ├── ai-usage.md              ← KI-Zusammenarbeitsdokumentation
│   └── migration
│       ├──  supabase-schema.sql     ← Tabellen, RLS, Richtlinien, Speicher-Richtlinien
│       ├── supabase-seed.sql        ← 8 Kategorien, 3 Präsentatoren, 12 Beispiel-Podcasts
│       └── supabase-contact.sql     ← contact_messages-Tabelle + RLS
├── supabase/
│   └── functions/
│       ├── README.md            ← Bereitstellungsanweisungen
│       └── contact/
│           └── index.ts         ← Edge-Function: validieren + contact_messages einfügen
├── docker/
│   └── nginx/
│       ├── Dockerfile           ← Multi-Stage: Vite-Build → Nginx
│       ├── nginx.conf           ← Dev: Proxy zum Vite-Dev-Server
│       └── nginx-prod.conf      ← Prod: statisches dist/ servieren
├── docker-compose.yml           ← Prod: bauen + via Nginx servieren
├── docker-compose.override.yml  ← Dev: Node 25 + Nginx-Proxy
├── .devcontainer/               ← Dev-Container-Konfiguration (Claude + opencode)
├── vite.config.js               ← Mehrseitiger Build, entdeckt automatisch *.html
├── package.json
├── .env / .env.example
└── .gitignore
```

---

## Implementierungsplan

### Phase 1: Grundlage — ERLEDIGT

- [x] Seiten umbenennen: `index-home.html` → `index.html`, `index.html` → `podcasts.html`, `podcast.html` → `podcast-detail.html`
- [x] `about.html` erstellen
- [x] CSS-Variablen in `main.css` (`--primary: #000`, `--secondary: #fff`)
- [x] Hardcoded-Farben auf Variablen umstellen
- [x] `pages/js/supabase.js`-Modul erstellen
- [x] `pages/js/data.js`-Modul erstellen
- [x] Supabase-SQL-Schema ausführen (Benutzer führt im Supabase-Dashboard aus)

### Phase 2: Seiten — ERLEDIGT

- [x] Startseite (`index.html`) — Hero, Einführung zu DEAR, neueste Podcasts, Kategorien
- [x] Podcast-Liste (`podcasts.html`) — Raster, Kategoriefilter, Suche
- [x] Podcast-Detail (`podcast-detail.html`) — Cover, Info, Beschreibung, Transkription, Audioplayer, Präsentator
- [x] Über-uns-Seite (`about.html`) — Projektinfo, Kontaktformular mit Honeypot

### Phase 3: JS-Logik — MEISTENS ERLEDIGT

- [x] Daten von Supabase abrufen
- [x] Kategoriefilter (JS mit `data-category`)
- [x] Sortierumschalter (neueste/älteste) auf Podcasts-Seite
- [x] Suchfunktion (debounced, serverseitig via Supabase `ilike`)
- [x] Audioplayer (natives HTML5 `<audio controls>`, feststehend oben auf der Seite)
- [x] Transkriptionsanzeige mit `[MM:SS]`-Zeitstempeln (gestylte Spans)
- [x] Transkriptions-Auto-Scroll und -Hervorhebung synchron mit Audiowiedergabe (Seiten-Scroll, kein Overflow)
- [x] Kontaktformular: clientseitige Validierung + Edge-Function-Absendung
- [x] Kategoriefilter via URL-Parameter (`?category=uuid`)
- [x] Newsletter-Anmeldung: E-Mail-Validierung + Supabase-Insert (`subscribeNewsletter`)
- [x] Lade-/Fehlerzustände (Skeleton-Loader) — derzeit reiner Text

### Phase 4: Responsive Design — ERLEDIGT

- [x] Tablet-Breakpoints (`min-width: 481px`)
- [x] Desktop-Breakpoints (`min-width: 1025px`)
- [x] Navigation mit echten Seiten verlinkt
- [x] Mobiles Hamburger-Menü (max-height-Transition)
- [x] Footer-Akkordeon auf Mobile, flach auf Tablet+

### Phase 5: Dokumentation — ERLEDIGT

- [x] `docs/wireframes.md` — ASCII-Wireframes für alle 4 Seiten × 3 Breakpoints
- [x] `docs/styleguide.md` — Typografie, Farben, Abstände, Komponenten
- [x] `docs/ai-usage.md` — KI-Tools, Einsatzfälle, Prompts, Zeiteinsparung

---

## Zukunft (nicht jetzt)

- [ ] NuxtJS + TypeScript-Migration (v2)
- [ ] Benutzerkonten / Login
- [ ] Lesezeichen-/Favoriten-Funktion

---

## Konventionen

- **Keine CSS-Preprozessoren** — reine `.css`-Dateien
- **ES-Module** — `type="module"` auf allen Script-Tags
- **Keine Frameworks** — nur vanilla HTML/CSS/JS
- **Nach jeder sinnvollen Änderung commiten** — `typ: kurze beschreibung` (feat, refactor, fix, docs, chore). Jede logische Änderung bekommt eigenen Commit für klare Historie und einfaches Debuggen.
- **Mobile-First** — Basis = Mobile, `min-width`-Abfragen für Tablet/Desktop
- **Touch-Ziele** — mindestens 44px für interaktive Elemente
- **CSS-Grid** für Layouts (Podcast-Übersicht, Inhaltsbereiche)
- **Sauberer, lesbarer Code** — korrektes Einrücken, aussagekräftige Namen, keine Abkürzungen
- **Bestehenden CSS-Stil befolgen** — denselben Stil wie das aktuelle CSS beibehalten. Verbesserungen für saubereren/besseren Code sind willkommen, aber die allgemeine Stilrichtung nicht ändern.

---

## Bekannte Probleme / Hinweise

### Bugs zu beheben

- (keine bekannten)
