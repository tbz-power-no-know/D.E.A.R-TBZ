# Supabase Edge Functions

Serverseitige Funktionen, die von Supabase gehostet werden. Dies sind die einzigen **Schreib**-Grenzen des Projekts — das Frontend liest Tabellen direkt (durch lese-only RLS geschützt), aber Schreibzugriffe laufen durch eine Function, sodass Eingaben serverseitig validiert werden und der privilegierte `service_role`-Key den Browser nie erreicht.

## Vollständige Setup-Anleitung

Siehe [docs/setup.md — Edge-Function bereitstellen](../../docs/setup.md#3-edge-function-bereitstellen) für detaillierte CLI/Dashboard-Anleitung, Troubleshooting und Verifikation.

## `contact`

Empfängt eine Kontaktformular-Absendung, validiert sie, filtert Spam (Honeypot) und fügt einen Datensatz in die private `contact_messages`-Tabelle ein, wobei `service_role` verwendet wird.

Das Frontend ruft sie mit `supabase.functions.invoke('contact', { body })` auf (siehe `pages/js/data.js` → `sendContactMessage`).

### Schnell-Referenz (CLI)

```bash
supabase login
supabase link --project-ref <dein-project-ref>
supabase functions deploy contact
```

### Lokal testen

```bash
supabase functions serve --no-verify-jwt
```

Funktioniert auf `http://127.0.0.1:54321/functions/v1/contact`.

### Umgebungsvariablen

`SUPABASE_URL` und `SUPABASE_SERVICE_ROLE_KEY` werden automatisch von Supabase injiziert — keine manuelle Konfiguration nötig.
