# Supabase Edge Functions

Serverseitige Funktionen, die von Supabase gehostet werden. Dies sind die einzigen **Schreib**-Grenzen des Projekts — das Frontend liest Tabellen direkt (durch lese-only RLS geschützt), aber Schreibzugriffe laufen durch eine Function, sodass Eingaben serverseitig validiert werden und der privilegierte `service_role`-Key den Browser nie erreicht.

## `contact`

Empfängt eine Kontaktformular-Absendung, validiert sie, filtert Spam (Honeypot) und fügt einen Datensatz in die private `contact_messages`-Tabelle ein, wobei `service_role` verwendet wird.

Das Frontend ruft sie mit `supabase.functions.invoke('contact', { body })` auf (siehe `pages/js/data.js` → `sendContactMessage`).

## Bereitstellen (einmaliges Setup, vom Entwickler ausführen)

Diese Schritte benötigen deine Supabase-Zugangsdaten, ähnlich wie der bestehende
"SQL im Dashboard ausführen"-Schritt.

```bash
# 1. Die private Tabelle erstellen — docs/supabase-contact.sql
#    im Supabase Dashboard → SQL-Editor ausführen

# 2. Supabase CLI installieren + einloggen
npm install -g supabase   # oder: brew install supabase/tap/supabase
supabase login

# 3. Vom Repository-Root aus init (erstellt supabase/config.toml; bestehendes
#    functions/-Verzeichnis beibehalten) und mit deinem Projekt verlinken
supabase init            # überspringen, falls config.toml bereits existiert
supabase link --project-ref <dein-project-ref>

# 4. Function bereitstellen
supabase functions deploy contact
```

`SUPABASE_URL` und `SUPABASE_SERVICE_ROLE_KEY` werden automatisch in die Function injiziert — es müssen keine Geheimnisse für den Datenbank-Insert gesetzt werden.

## Verifizieren

```bash
# Schlechte Anfrage (leerer Body) → 400
curl -i -X POST "https://<project-ref>.supabase.co/functions/v1/contact" \
  -H "Authorization: Bearer <anon-key>" \
  -H "Content-Type: application/json" \
  -d '{}'

# Gültige Anfrage → 200 {"ok":true}; Datensatz im Dashboard → Table Editor prüfen
```
