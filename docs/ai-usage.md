# KI-Nutzungsdocumentation — D.E.A.R. Podcast-Website

> Persönliche Dokumentation darüber, wie KI in diesem Projekt eingesetzt wurde.

---

## Projekt-Kontext

D.E.A.R. (Drop Everything And Read) ist ein Schulprojekt der Berufsfachschule Zürich. Das Ziel ist es, eine Podcast-Website zu bauen, die Schüler-Buchvorstellungen präsentiert. Das Projekt erfordert eigenes HTML/CSS (ohne Frameworks), mobile-first Responsive Design und Supabase als Backend.

---

## Phase 1: Vorbereitung (vor der KI) — 10 Stunden

Bevor jegliche KI zum Einsatz kam, habe ich die Grundlagen komplett selbst erstellt:

- **Wireframes** — manuell entworfen, keine KI-Hilfe
- **Docker-Boilerplate** — mit minimaler KI-Hilfe für Docker-Compose-Syntax eingerichtet
- **Recherche & Erkundung** — habe untersucht, wie Supabase funktioniert, wie man ein Webprojekt ohne Framework und ohne SPA (Single Page Application) aufbaut
- **Gespräche mit der Lehrperson** — habe Ideen ausgetauscht, um den besten technischen Ansatz für dieses Projekt zu bestimmen

Diese Vorbereitungsphase dauerte **10 Stunden** und war essenziell, um den Problembereich zu verstehen, bevor KI involviert wurde.

---

## Phase 2: Grundlage

Nach der Vorbereitung habe ich die notwendigen Basisdateien erstellt, auf denen die KI aufbauen konnte. Der erste Commit (`ba5a9cd`) enthält die Boilerplate-Struktur — die KI musste nur von dieser Grundlage weiterarbeiten. Die Projektstruktur und Frontend-Grundlagen wurden vor jeder intensiven KI-Beteiligung festgelegt.

---

## Phase 3: Planung

Mit der fertigen Grundlage habe ich `objective-detailed.md` (die VERITE) durch einen iterativen Austausch mit der KI erstellt. **Alle architektonischen Entscheidungen lagen bei mir.** Die KI half bei der Strukturierung und Dokumentation des Plans, aber jede Entscheidung — Supabase-Schema, Dateistruktur, mobile-first-Ansatz, Responsive-Breakpoints — kam von mir.

---

## Phase 4: Entwicklung

Sobald der Plan feststand, generierte die KI Code, aber ich sorgte für Konsistenz:

- **Regelmässige Commits** — jede logische Änderung separat mit klaren Nachrichten committed
- **Sauberer Code** — gut strukturiert, lesbar, keine Abkürzungen
- **Code-Review** — obwohl das Backend generiert wurde, habe ich jede Zeile geprüft, um Neues zu lernen, nicht nur Copy-Paste
- **Kein "Vibe Coding"** — ich habe jedes generierte Stück verstanden, bevor ich es akzeptiert habe

### Zeiteinsparungsschätzung

| Aufgabe | Geschätzt ohne KI | Mit KI | Einsparung |
|---|---|---|---|
| Projektplanung | 2h | 0,5h | 1,5h |
| Code-Generierung | 8h | 3h | 5h |
| CSS-Styling | 6h | 2h | 4h |
| Dokumentation | 3h | 1h | 2h |
| Debugging | 2h | 0,5h | 1,5h |
| Transkriptions-Sync | 3h | 1h | 2h |
| Sortierumschalter (neueste/älteste) | 2h | 0,5h | 1,5h |
| Dominante Cover-Farbe (Canvas) | 2h | 0,5h | 1,5h |
| SVG-Refactoring (public/ + fetch) | 1,5h | 0,3h | 1,2h |
| Newsletter → Supabase-Integration | 1,5h | 0,3h | 1,2h |
| Dark-Mode + Logo-Animation | 2h | 0,5h | 1,5h |
| Grammatik + Dokumentation | 1h | 0,2h | 0,8h |
| **Total** | **36h** | **10,3h** | **25,7h** |

Die KI hat ungefähr **26 Stunden** Entwicklungszeit gespart.

---

## Phase 5: Dokumentation

Die KI unterstützte bei der Dokumentation (Wireframes, Styleguide, diese Datei), aber unter meiner Aufsicht. Ich habe die inhaltliche Richtung vorgegeben und alles geprüft, bevor ich es committed habe.

---

## Tool-Auswahl: opencode (Qwen) vs. Claude

Ich habe mich für **opencode mit Qwen** anstelle von Claude aus zwei Hauptgründen entschieden:

1. **Datenschutz** — opencode wird lokal auf einem Server gehostet, d.h. kein Code oder keine Daten verlassen die lokale Infrastruktur
2. **Ökologie** — lokales Hosting reduziert den Energie-Fussabdruck im Vergleich zu Cloud-basierten KI-Diensten

### Vergleich

| Kriterium | opencode (Qwen) | Claude | Gewicht |
|---|---|---|---|
| Datenschutz | Lokales Hosting | Cloud-basiert | Hoch |
| Ökologie | Geringerer Energieverbrauch | Cloud-Server | Hoch |
| Kosten | Kostenlos | Bezahlt | Hoch |
| Antwortqualität | Ausgezeichnet | Ausgezeichnet | Hoch |
| Git-Integration | Native | Über IDE | Mittel |
| **Fazit** | **Für dieses Projekt gewählt** | — | — |

---

## Was ich gelernt habe

Durch dieses Projekt und die KI-Zusammenarbeit habe ich gelernt:

1. **Supabase** — wie man ein Supabase-Projekt einrichtet, ein Schema mit Beziehungen entwirft, RLS-Richtlinien konfiguriert, Storage-Buckets nutzt, INSERT-only-Policies setzt
2. **Docker Compose** — Multi-Container-Setups, Volume-Mounts, Multi-Stage-Builds, Dev/Prod-Overrides
3. **HTML** — semantische HTML-Struktur, korrekte Verwendung von `<main>`, `<section>`, `aria-*`-Attributen
4. **CSS** — CSS-Custom-Properties (Variablen), mobile-first-Methodik, `max-height`-Transitionen, `aspect-ratio`, `object-fit`, Keyframe-Animationen, `z-index`-Management
5. **JavaScript** — Canvas-API (Pixel-Extraktion), `fetch()` für SVG-Assets, async/await-Patterns, DOM-Manipulation mit `insertAdjacentHTML`
6. **Vite** — mehrseitige Builds, Auto-Discovery von HTML-Einstiegspunkten, Umgebungsvariablen, `import.meta.env.BASE_URL`
7. **SVG** — CSS-Variablen in inline-SVGs, Datei-basierte SVGs zur Laufzeit laden
8. **KI-Zusammenarbeit** — wie man klare Anweisungen gibt, KI-Output kritisch prüft, Konsistenz über Sitzungen hinweg aufrechterhält

---

## Transparenz-Erklärung

Dieses Projekt wurde mit KI-Unterstützung unter Verwendung von opencode (Qwen) entwickelt. Der Arbeitsablauf war:

1. **Vorbereitung** — Wireframes, Recherche, Gespräche mit der Lehrperson (10 Stunden, mostly ohne KI)
2. **Grundlage** — Boilerplate und Basisdateien vom Entwickler erstellt
3. **Planung** — alle architektonischen Entscheidungen vom Entwickler getroffen, KI hat bei der Dokumentation geholfen
4. **Entwicklung** — KI hat Code generiert, Entwickler hat jede Zeile geprüft zum Verständnis
5. **Dokumentation** — KI hat unterstützt, Entwickler hat beaufsichtigt

**Alle architektonischen Entscheidungen, Design-Entscheidungen und finalen Genehmigungen lagen beim Entwickler.** Die KI war ein Werkzeug für Effizienz, kein Ersatz für Verständnis.
