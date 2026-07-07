// Contact form Edge Function
//
// The server boundary for the site's only write path. The browser calls this
// function (via supabase.functions.invoke) instead of writing to the database
// directly. It validates the submission, drops spam, and inserts into
// `contact_messages` using the service_role key — which never leaves the server.

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const ALLOWED_SUBJECTS = ["feedback", "technical", "recommendation", "other"];
const EMAIL_PATTERN = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req) => {
  // CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ ok: false, error: "Methode nicht erlaubt" }, 405);
  }

  let payload: Record<string, unknown>;
  try {
    payload = await req.json();
  } catch {
    return jsonResponse({ ok: false, error: "Ungültiger JSON-Body" }, 400);
  }

  // Honeypot: humans leave this empty, bots fill it. Pretend success and drop.
  const company = typeof payload.company === "string" ? payload.company.trim() : "";
  if (company !== "") {
    return jsonResponse({ ok: true });
  }

  const name = typeof payload.name === "string" ? payload.name.trim() : "";
  const email = typeof payload.email === "string" ? payload.email.trim() : "";
  const subject = typeof payload.subject === "string" ? payload.subject.trim() : "";
  const message = typeof payload.message === "string" ? payload.message.trim() : "";

  // Server-side validation (the authoritative check)
  const invalidFields: string[] = [];
  if (!name || name.length > 120) invalidFields.push("name");
  if (!email || email.length > 254 || !EMAIL_PATTERN.test(email)) invalidFields.push("email");
  if (!ALLOWED_SUBJECTS.includes(subject)) invalidFields.push("subject");
  if (!message || message.length > 5000) invalidFields.push("message");

  if (invalidFields.length > 0) {
    return jsonResponse({ ok: false, error: `Ungültige Felder: ${invalidFields.join(", ")}` }, 400);
  }

  // service_role client — server-side only, bypasses RLS to write the private table.
  // SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are injected automatically.
  const admin = createClient(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  );

  const { error } = await admin
    .from("contact_messages")
    .insert({ name, email, subject, message });

  if (error) {
    console.error("contact_messages insert failed:", error);
    return jsonResponse(
      { ok: false, error: "Deine Nachricht konnte nicht gespeichert werden. Bitte versuche es später erneut." },
      500,
    );
  }

  return jsonResponse({ ok: true });
});
