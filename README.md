# D.E.A.R. — Podcast-Website

> **Drop Everything And Read** — Ein Schulprojekt, das Schüler-Buchvorstellungen als Podcasts präsentiert.

## Übersicht

D.E.A.R. ist eine Podcast-Website, die für die **Berufsfachschule Zürich** (IT-Abteilung > Informatik, Modul M293 PA04) erstellt wurde. Die Plattform veröffentlicht Buchvorstellungen, die als Podcasts von Schülerinnen und Schülern in ABU- (Allgemeinbildung) Klassen produziert wurden. Jeder Podcast zeigt eine Schülerin oder einen Schüler, der seine Gedanken zu einem gelesenen Buch teilt.

## Seiten

| Seite | Beschreibung |
|---|---|
| **Startseite** | Hero-Bereich, Einführung zu D.E.A.R., neueste Podcasts, Kategorieübersicht |
| **Podcasts** | Alle Podcasts im Raster, Kategoriefilter, Suche, Sortierumschalter |
| **Podcast-Detail** | Cover (9:16), Buchinfo, Beschreibung, Transkription mit `[MM:SS]`-Zeitstempeln, feststehender Audioplayer, Präsentator-Karte |
| **Über uns** | Projektinformationen, Kontaktformular mit Betreff-Dropdown |

## Tech-Stack

| Ebene | Technologie |
|---|---|
| Build | Vite 8 (mehrzeiliges Input) |
| Runtime | Node 25 (Dev), Nginx 1.30 (Prod) |
| Backend | Supabase (Datenbank, Speicher, Auth) |
| Infrastruktur | Docker Compose + Devcontainer |
| Sprachen | Vanilla HTML, CSS, JavaScript (ES-Module) |

**Keine Frameworks** — 100 % eigenes HTML/CSS/JS mit KI-gestützter Entwicklung.

## Funktionen

- Mobile-First-Responsive-Design (375px / 481px / 1025px Breakpoints)
- CSS-Grid-Layouts für Podcast- und Kategorieübersichten
- Kategoriefilter mit farbcodierten Buttons (Daten aus Supabase)
- Clientseitige Suche (Supabase `ilike`)
- Sortierumschalter (neueste / älteste)
- Transkription synchronisiert mit Audiowiedergabe (`[MM:SS]`-Zeitstempel)
- Feststehender Audioplayer, der beim Scrollen oben bleibt
- Feststehender Header, der beim Runterscrollen ausgeblendet und beim Hochscrollen eingeblendet wird
- Newsletter-Anmeldung mit E-Mail-Validierung
- Hover-Animationen auf Karten, Buttons und Links
- Kontaktformular mit Honeypot-Spamschutz (Edge-Function-Submit)

## Erste Schritte

### Voraussetzungen

- Node.js 25+
- Docker + Docker Compose
- Supabase-Konto

### Einrichtung

1. Repository klonen
2. `.env.example` nach `.env` kopieren und Supabase-Zugangsdaten eintragen:
   ```bash
   cp .env.example .env
   ```
3. Dev-Server starten:
   ```bash
   docker compose up
   ```

### Supabase-Einrichtung (einmalig)

Alle folgenden Schritte werden im [Supabase Dashboard](https://supabase.com/dashboard) durchgeführt.

#### 1. SQL-Dateien ausführen

Gehe zu **SQL-Editor** und führe diese Dateien in folgender Reihenfolge aus:

- `docs/supabase-schema.sql` — erstellt alle Tabellen, RLS-Richtlinien und Speicher-Richtlinien
- `docs/supabase-seed.sql` — fügt 8 Kategorien, 3 Präsentatoren und 12 Beispiel-Podcasts ein

> **Hinweis:** `docs/supabase-contact.sql` ist veraltet — die Tabelle `contact_messages` ist nun in `supabase-schema.sql` enthalten.

#### 2. Speicher-Buckets erstellen

Gehe zu **Storage** und erstelle diese 4 Buckets. Setze jeden auf **Public**:

| Bucket | Zweck |
|---|---|
| `podcast-audio` | MP3-Audiodateien |
| `podcast-cover` | 9:16-Coverbilder |
| `presenter-photos` | Präsentator-Porträts |
| `category-images` | Kategorie-Icons |

#### 3. Edge-Function bereitstellen

Das Kontaktformular sendet Absendungen durch die `contact` Edge-Function (serverseitige Validierung + Spamschutz). Du kannst sie über CLI oder Dashboard bereitstellen.

**Option A — CLI (empfohlen):**

```bash
npm install -g supabase
supabase login
supabase link --project-ref <dein-project-ref>
supabase functions deploy contact
```

**Option B — Dashboard:**

1. Gehe zu **Edge Functions** → **Neue Function**
2. Benenne sie `contact` → wähle **Blank** (Leer)
3. Ersetze den Template-Code mit dem Inhalt von `supabase/functions/contact/index.ts`
4. Wähle **Production** → klicke **Deploy**

> `SUPABASE_URL` und `SUPABASE_SERVICE_ROLE_KEY` werden automatisch von Supabase injiziert — keine zusätzlichen Umgebungsvariablen nötig.

#### 4. Verifizieren

Öffne das Kontaktformular auf der Über-uns-Seite und sende eine Testnachricht. Prüfe **Table Editor → contact_messages**, um zu bestätigen, dass der Datensatz eingefügt wurde.

### Skripte

```bash
npm run dev       # Vite Dev-Server (ohne Docker)
npm run build     # Produktions-Build
npm run preview   # Produktions-Build anschauen
```

## Projektstruktur

```
├── pages/                    # Vite-Root, alle HTML-Einstiegspunkte
│   ├── index.html            # Startseite
│   ├── podcasts.html         # Podcast-Liste
│   ├── podcast-detail.html   # Einzelner Podcast
│   ├── about.html            # Über uns + Kontakt
│   ├── js/                   # JavaScript-Module
│   └── style/                # CSS-Dateien
├── docs/                     # Dokumentation
│   ├── wireframes.md         # ASCII-Wireframes (3 Breakpoints × 4 Seiten)
│   ├── styleguide.md         # Typografie, Farben, Abstände, Komponenten
│   ├── ai-usage.md           # KI-Zusammenarbeitsdokumentation
│   ├── supabase-schema.sql   # Datenbank-Schema
│   ├── supabase-seed.sql     # Seed-Daten
│   └── supabase-contact.sql  # Kontakt-Nachrichten-Tabelle
├── supabase/functions/       # Supabase Edge Functions
├── docker/                   # Docker-Konfigurationen (Nginx)
├── docker-compose.yml        # Produktion
├── docker-compose.override.yml  # Entwicklung
└── vite.config.js            # Mehrseitige Build-Konfiguration
```

## Dokumentation

| Dokument | Beschreibung |
|---|---|
| [Wireframes](docs/wireframes.md) | ASCII-Wireframes für Mobile, Tablet, Desktop |
| [Styleguide](docs/styleguide.md) | Typografie, Farben, Abstände, Komponenten |
| [KI-Nutzung](docs/ai-usage.md) | Wie KI im Projekt eingesetzt wurde |
| [Supabase-Schema](docs/supabase-schema.sql) | Datenbanktabellen, RLS, Speicher-Richtlinien |
| [Supabase-Seed](docs/supabase-seed.sql) | 8 Kategorien, 3 Präsentatoren, 12 Podcasts |
| [Supabase-Kontakt](docs/supabase-contact.sql) | Kontakt-Nachrichten-Tabelle |

## Architektur

- **Lesezugriffe:** Browser → Supabase anon key (durch RLS-Richtlinien geschützt)
- **Schreibzugriffe:** Kontaktformular → Supabase Edge Function → `service_role` key (wird niemals an den Browser gesendet)
- **Header/Footer:** Über JS-Module mit `insertAdjacentHTML` gerendert
- **Daten:** Alle Podcast-Daten werden zur Laufzeit von Supabase abgerufen (nicht hardcoded)

## Konventionen

- ES-Module (`type="module"`)
- Keine CSS-Preprozessoren
- Keine Frameworks
- Mobile-First: Basis = Mobile, nur `min-width`-Abfragen
- Touch-Ziele: mindestens 44px
- Commits: `typ: kurze beschreibung` (feat, refactor, fix, docs, chore)

## Lizenz

Dies ist ein Schulprojekt. Siehe [LICENSE](LICENSE) für Details.

## Danksagungen

- **Schule:** Berufsfachschule Zürich, IT-Abteilung
- **Modul:** M293 PA04
- **Format:** Einzelarbeit, 20 Lektionen
- **KI-Tool:** opencode (Qwen) — verwendet für Code-Generierung, Problemlösung und Dokumentation
