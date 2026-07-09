# D.E.A.R. — Podcast-Website

> **Drop Everything And Read** — Ein Schulprojekt, das Schüler-Buchvorstellungen als Podcasts präsentiert.

## Übersicht

D.E.A.R. ist eine Podcast-Website, die für die **Technische Berufsschule Zürich** (IT-Abteilung > Informatik, Modul M293 PA04) erstellt wurde. Die Plattform veröffentlicht Buchvorstellungen, die als Podcasts von Schülerinnen und Schülern in ABU- (Allgemeinbildung) Klassen produziert wurden. Jeder Podcast zeigt eine Schülerin oder einen Schüler, der seine Gedanken zu einem gelesenen Buch teilt.

## Dokumentation

| Dokument                                                | Beschreibung                                         |
| ------------------------------------------------------- | ---------------------------------------------------- |
| [Setup-Guide](docs/setup.md)                            | Devcontainer, Supabase, Architektur, Projektstruktur |
| [Wireframes](docs/wireframes.md)                        | ASCII-Wireframes für Mobile, Tablet, Desktop         |
| [Styleguide](docs/styleguide.md)                        | Typografie, Farben, Abstände, Komponenten            |
| [KI-Nutzung](docs/ai-usage.md)                          | Wie KI im Projekt eingesetzt wurde                   |
| [Supabase-Schema](docs/migration/supabase-schema.sql)   | Datenbanktabellen, RLS, Speicher-Richtlinien         |
| [Supabase-Seed](docs/migration/supabase-seed.sql)       | 8 Kategorien, 3 Präsentatoren, 12 Podcasts           |
| [Supabase-Kontakt](docs/migration/supabase-contact.sql) | Kontakt-Nachrichten-Tabelle                          |

## Seiten

| Seite              | Beschreibung                                                                                                                 |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| **Startseite**     | Hero-Bereich, Einführung zu D.E.A.R., neueste Podcasts, Kategorieübersicht                                                   |
| **Podcasts**       | Alle Podcasts im Raster, Kategoriefilter, Suche, Sortierumschalter                                                           |
| **Podcast-Detail** | Cover (9:16), Buchinfo, Beschreibung, Transkription mit `[MM:SS]`-Zeitstempeln, feststehender Audioplayer, Präsentator-Karte |
| **Über uns**       | Projektinformationen, Kontaktformular mit Betreff-Dropdown                                                                   |

## Tech-Stack

| Ebene         | Technologie                               |
| ------------- | ----------------------------------------- |
| Build         | Vite 8 (mehrzeiliges Input)               |
| Runtime       | Node 25 (Dev), Nginx 1.30 (Prod)          |
| Backend       | Supabase (Datenbank, Speicher, Auth)      |
| Infrastruktur | Docker Compose + Devcontainer             |
| Sprachen      | Vanilla HTML, CSS, JavaScript (ES-Module) |

**Keine Frameworks** — 100 % eigenes HTML/CSS/JS mit KI-gestützter Entwicklung.

## Funktionen

- Mobile-First-Responsive-Design (375px / 481px / 1025px Breakpoints)
- Startseite zeigt responsiv 3/4/5 Podcast-Karten (Phone/Tablet/Desktop) mit Resize-Re-Fetch
- CSS-Grid-Layouts für Podcast- und Kategorieübersichten
- Kategoriefilter mit farbcodierten Buttons (Daten aus Supabase)
- Clientseitige Suche (Supabase `ilike`)
- Sortierumschalter (neueste / älteste)
- Transkription synchronisiert mit Audiowiedergabe (`[MM:SS]`-Zeitstempel)
- Feststehender Audioplayer, der beim Scrollen oben bleibt
- Feststehender Header, der beim Runterscrollen ausgeblendet und beim Hochscrollen eingeblendet wird
- Newsletter-Anmeldung mit E-Mail-Validierung + Supabase-Insert
- Dominante Cover-Farbe via Canvas-Extraktion (Karten + Detailseite)
- Dark-Mode mit Sonne/Mond-Toggle (localStorage-Persistenz)
- Animierte Logo-Seitenblätter im Header
- Hover-Animationen auf Karten, Buttons und Links
- Kontaktformular mit Honeypot-Spamschutz (Edge-Function-Submit)

## Erste Schritte

### Voraussetzungen

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

Für detaillierte Anleitungen zu Devcontainer, Supabase-Einrichtung, Projektstruktur und Architektur siehe [Setup-Guide](docs/setup.md).

### Skripte

```bash
docker compose up --build
```

url: `http://localhost:5173/`

## Konventionen

- ES-Module (`type="module"`)
- Keine CSS-Preprozessoren
- Keine Frameworks
- Mobile-First: Basis = Mobile, nur `min-width`-Abfragen
- Touch-Ziele: mindestens 44px
- Commits: `typ: kurze beschreibung` (feat, refactor, fix, docs, chore)

## Lizenz

Dies ist ein Schulprojekt. Siehe [LICENSE](LICENSE) für Details.

## Infos

- **Modul:** M293
- **KI-Tool:** opencode (Qwen) — verwendet für Code-Generierung, Problemlösung und Dokumentation
