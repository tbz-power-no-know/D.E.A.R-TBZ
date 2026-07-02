# Supabase Edge Functions

Server-side functions hosted by Supabase. These are the project's only **write**
boundary — the frontend reads tables directly (gated by read-only RLS), but
writes go through a function so input is validated server-side and the
privileged `service_role` key never reaches the browser.

## `contact`

Receives a contact-form submission, validates it, drops spam (honeypot), and
inserts a row into the private `contact_messages` table using `service_role`.

The frontend calls it with `supabase.functions.invoke('contact', { body })`
(see `pages/js/data.js` → `sendContactMessage`).

## Deploy (one-time setup, run by the developer)

These steps need your Supabase credentials, like the existing
"run the SQL in the Dashboard" step.

```bash
# 1. Create the private table — run docs/supabase-contact.sql
#    in Supabase Dashboard → SQL Editor

# 2. Install + log in to the Supabase CLI
npm install -g supabase   # or: brew install supabase/tap/supabase
supabase login

# 3. From the repo root, init (creates supabase/config.toml; keep the
#    existing functions/ directory) and link to your project
supabase init            # skip if config.toml already exists
supabase link --project-ref <your-project-ref>

# 4. Deploy the function
supabase functions deploy contact
```

`SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` are injected into the function
automatically — there are no secrets to set for the database insert.

## Verify

```bash
# Bad request (empty body) → 400
curl -i -X POST "https://<project-ref>.supabase.co/functions/v1/contact" \
  -H "Authorization: Bearer <anon-key>" \
  -H "Content-Type: application/json" \
  -d '{}'

# Valid request → 200 {"ok":true}; check the row in Dashboard → Table Editor
```
