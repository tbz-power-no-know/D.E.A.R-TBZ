-- D.E.A.R. Podcast Website — Contact Messages
-- Run this in Supabase Dashboard → SQL Editor (after supabase-schema.sql)
--
-- This table is written ONLY by the `contact` Edge Function, which uses the
-- service_role key (server-side). It is intentionally left with NO RLS policies,
-- so the public anon key can neither read nor write it.

-- =====================================================
-- TABLE
-- =====================================================

CREATE TABLE contact_messages (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name       TEXT NOT NULL,
  email      TEXT NOT NULL,
  subject    TEXT NOT NULL,
  message    TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- =====================================================
-- ROW LEVEL SECURITY (RLS)
-- =====================================================

ALTER TABLE contact_messages ENABLE ROW LEVEL SECURITY;

-- Intentionally NO policies.
-- The anon key has no access; only the service_role key (used by the
-- contact Edge Function) can insert, because service_role bypasses RLS.
