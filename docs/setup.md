# Setup-Guide — D.E.A.R. Podcast-Website

> Detaillierte Anleitung für Devcontainer, Supabase-Einrichtung, Projektstruktur und Architektur. Kurzübersicht im [README](../README.md).

---

## Devcontainer-Einrichtung

Der Devcontainer bietet eine vorkonfigurierte Entwicklungsumgebung mit Node.js, PHP 8.5, opencode und Claude Code.

### Was du auf dem Host brauchst

| Werkzeug | Zweck |
|---|---|
| **Docker Desktop** | Container-Engine (muss laufen) |
| **VS Code** | Editor mit Dev Containers-Extension |
| **Dev Containers Extension** | `ms-vscode-remote.remote-containers` |

### Schritte

1. Repository klonen
2. In VS Code: `Ctrl+Shift+P` → **Dev Containers: Reopen in Container**
3. VS Code baut den Container und öffnet ihn
4. Innerhalb des Containers:
   ```bash
   cp .env.example .env
   docker compose up
   ```

### Was passiert im Hintergrund

- Dockerfile installiert Node.js 24, PHP 8.5, Git, Vim, und andere Tools
- opencode wird mit `opencode-local-provider` Plugin konfiguriert
- `post-start.sh` erstellt `~/.config/opencode/opencode.json` (nur wenn noch nicht vorhanden)
- Lokaler LLM-Provider wird auf `host.docker.internal:8080` (llamacpp) oder `host.docker.internal:9090` (llama-server) konfiguriert

### Lokaler LLM-Server (optional)

Der Devcontainer ist standardmässig auf einen lokalen LLM-Server konfiguriert. Falls du keinen betreibst, siehe unten unter **opencode deaktivieren**.

---

## opencode deaktivieren

Nicht jeder hat einen lokalen LLM-Server. So deaktivierst du opencode im Devcontainer:

### Option A — opencode komplett entfernen (empfohlen, wenn nicht benötigt)

Im Devcontainer-Terminal:

```bash
# opencode.json leeren (deaktiviert alle Provider)
echo '{}' > ~/.config/opencode/opencode.json

# Optional: opencode-Binary entfernen
rm -f ~/.local/bin/opencode
```

### Option B — opencode im Projekt deaktivieren

Erstelle eine `.opencode.json` im Projekt-Root:

```json
{
  "enabled_providers": []
}
```

### Option C — opencode-Feature im Devcontainer entfernen

Ändere `.devcontainer/devcontainer.json` und entferne den `opencode`-Eintrag aus der `features`-Sektion:

```json
"features": {
  "./features/claude-code": {
    "version": "latest"
  }
}
```

Dann den Container neu bauen: **Dev Containers: Rebuild Container**.

---

## Supabase-Einrichtung (einmalig)

Alle folgenden Schritte werden im [Supabase Dashboard](https://supabase.com/dashboard) durchgeführt.

### 1. SQL-Dateien ausführen

Gehe zu **SQL-Editor** und führe diese Dateien in folgender Reihenfolge aus:

- `docs/migration/supabase-schema.sql` — erstellt alle Tabellen, RLS-Richtlinien und Speicher-Richtlinien
- `docs/migration/supabase-seed.sql` — fügt 8 Kategorien, 3 Präsentatoren und 12 Beispiel-Podcasts ein

> **Hinweis:** `docs/migration/supabase-contact.sql` ist veraltet — die Tabelle `contact_messages` ist nun in `supabase-schema.sql` enthalten.

### 2. Speicher-Buckets erstellen

Gehe zu **Storage** und erstelle diese 4 Buckets. Setze jeden auf **Public**:

| Bucket | Zweck |
|---|---|
| `podcast-audio` | MP3-Audiodateien |
| `podcast-cover` | 9:16-Coverbilder |
| `presenter-photos` | Präsentator-Porträts |
| `category-images` | Kategorie-Icons |

### 3. Edge-Function bereitstellen

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

### 4. Verifizieren

Öffne das Kontaktformular auf der Über-uns-Seite und sende eine Testnachricht. Prüfe **Table Editor → contact_messages**, um zu bestätigen, dass der Datensatz eingefügt wurde.

---

## Projektstruktur

```
├── pages/                    # Vite-Root, alle HTML-Einstiegspunkte
│   ├── index.html            # Startseite
│   ├── podcasts.html         # Podcast-Liste
│   ├── podcast-detail.html   # Einzelner Podcast
│   ├── about.html            # Über uns + Kontakt
│   ├── js/                   # JavaScript-Module
│   │   ├── main.js           # Einstieg: Header, Footer, pro-Seite Init-Dispatch
│   │   ├── expandable.js     # Aufklappbaren Text umschalten
│   │   ├── darkmode.js       # Dark-Mode-Initialisierung + Toggle
│   │   ├── supabase.js       # Supabase-Client-Initialisierung
│   │   ├── data.js           # Fetch-Funktionen, sendContactMessage, subscribeNewsletter
│   │   ├── colorExtract.js   # getDominantColor() via Canvas
│   │   ├── filter.js         # Kategoriefilter-Logik
│   │   ├── search.js         # Clientseitige Suche (debounced)
│   │   ├── home.js           # renderLatestPodcasts, renderCategories, initNewsletter
│   │   ├── podcast-detail.js # initPodcastDetail, renderPodcast
│   │   ├── contact.js        # Kontaktformular-Validierung + -Absendung
│   │   └── shared/
│   │       ├── Header.js     # renderHeader() (async, fetch SVGs from public/)
│   │       └── Footer.js     # renderFooter()
│   └── style/
│       ├── reset.css          # Meyerweb-Reset
│       ├── main.css           # Variablen, gemeinsame Styles, Header, Footer, Dark-Mode, Animation
│       ├── components.css     # Shared components: podcast-card, buttons, loading-text, detail-back
│       ├── home.css           # Startseite-Styles
│       ├── podcasts.css       # Podcast-Liste + Filter + Suche Styles
│       ├── podcast-detail.css # Detailseite-Styles
│       └── about.css          # Über-uns-Seite-Styles
├── public/                   # Statische Assets
│   ├── logo.svg              # Logo mit CSS-Variablen + animierte Seitenblätter
│   ├── sun-icon.svg          # Dark-Mode-Toggle-Icon (Helligkeit)
│   └── moon-icon.svg         # Dark-Mode-Toggle-Icon (Dunkelheit)
├── docs/                     # Dokumentation
│   ├── setup.md              # Dieses Dokument
│   ├── wireframes.md         # ASCII-Wireframes (Mobile/Tablet/Desktop)
│   ├── styleguide.md         # Typografie, Farben, Abstände
│   ├── ai-usage.md           # KI-Zusammenarbeitsdokumentation
│   └── migration/            # Supabase-SQL-Dateien
├── supabase/
│   └── functions/
│       ├── README.md         # Bereitstellungsanweisungen
│       └── contact/
│           └── index.ts      # Edge-Function: validieren + contact_messages einfügen
├── docker/
│   └── nginx/
│       ├── Dockerfile        # Multi-Stage: Vite-Build → Nginx
│       ├── nginx.conf        # Dev: Proxy zum Vite-Dev-Server
│       └── nginx-prod.conf   # Prod: statisches dist/ servieren
├── docker-compose.yml        # Prod: bauen + via Nginx servieren
├── docker-compose.override.yml # Dev: Node 25 + Nginx-Proxy
├── .devcontainer/            # Dev-Container-Konfiguration
├── vite.config.js            # Mehrseitiger Build, entdeckt automatisch *.html
├── package.json
├── .env / .env.example
└── .gitignore
```

---

## Architektur

### Datenfluss

- **Lesezugriffe:** Browser → Supabase anon key (durch RLS-Richtlinien geschützt)
- **Schreibzugriffe — Kontaktformular:** Supabase Edge Function → `service_role` key (wird niemals an den Browser gesendet)
- **Schreibzugriffe — Newsletter:** Direkt in `newsletter_subscribers` via anon key (INSERT-only RLS, keine SELECT-Richtlinie)

### Komponenten

- **Vite-Root = `pages/`**, entdeckt automatisch `*.html` als Einstiegspunkte
- **Header/Footer:** Über JS-Module mit `insertAdjacentHTML` gerendert
- **Header-SVGs:** Logo, Sonne, Mond liegen in `public/`, werden via `fetch()` geladen und inline eingefügt
- **Alle Daten von Supabase** — Podcasts, Kategorien, Präsentatoren, Audio, Cover
- **CSS-Strategie:** `reset.css` → `main.css` (gemeinsam + Variablen) → `components.css` (shared components) → pro-Seite-CSS
- **Aufklappbarer Text** beibehalten (`.expandable-text` + `.expand-btn`)
- **Feststehender Header** blendet sich beim Runterscrollen aus, zeigt sich beim Hochscrollen
- **Feststehender Audioplayer** oben auf der Seite beim Scrollen der Transkription
- **Footer** am Seitenende (normaler Fluss)

### Supabase

- **Tabellen:** `categories`, `podcasts`, `presenters`, `podcast_presenters`, `contact_messages`, `newsletter_subscribers`
- **`newsletter_subscribers`:** INSERT-only RLS (keine SELECT — E-Mails sind privat)
- **Buckets:** `podcast-audio`, `podcast-cover`, `presenter-photos`, `category-images`
- **Edge-Function:** `contact` (serverseitige Validierung + Insert) — bereitgestellt

### Regel

Niemals ein Geheimnis (z. B. `service_role`) in eine `VITE_`-präfixierte Variable setzen — Vite inline-t diese in das ausgelieferte Bundle. Nur der öffentliche anon key wird ausgeliefert.
