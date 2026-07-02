-- D.E.A.R. Podcast Website — Supabase Schema
-- Run this in Supabase Dashboard → SQL Editor
-- Idempotent: safe to re-run (drops tables/policies before recreating)

-- =====================================================
-- STORAGE BUCKETS (create manually in Dashboard)
-- =====================================================
-- 1. Go to Supabase Dashboard → Storage
-- 2. Create these buckets and set them to PUBLIC:
--    - podcast-audio      (mp3 files)
--    - podcast-covers     (9:16 cover images)
--    - presenter-photos   (presenter headshots)
--    - category-images    (category icons)
-- =====================================================

-- =====================================================
-- DROP EXISTING (idempotent)
-- =====================================================

DROP POLICY IF EXISTS "Categories are viewable by everyone" ON categories;
DROP POLICY IF EXISTS "Podcasts are viewable by everyone" ON podcasts;
DROP POLICY IF EXISTS "Presenters are viewable by everyone" ON presenters;
DROP POLICY IF EXISTS "Podcast presenters are viewable by everyone" ON podcast_presenters;
DROP POLICY IF EXISTS "Newsletter subscribers can insert their own email" ON newsletter_subscribers;
DROP POLICY IF EXISTS "Newsletter subscribers are viewable by everyone" ON newsletter_subscribers;

DROP POLICY IF EXISTS "Podcast audio is publicly accessible" ON storage.objects;
DROP POLICY IF EXISTS "Podcast covers are publicly accessible" ON storage.objects;
DROP POLICY IF EXISTS "Presenter photos are publicly accessible" ON storage.objects;
DROP POLICY IF EXISTS "Category images are publicly accessible" ON storage.objects;

DROP TABLE IF EXISTS podcast_presenters;
DROP TABLE IF EXISTS contact_messages;
DROP TABLE IF EXISTS newsletter_subscribers;
DROP TABLE IF EXISTS podcasts;
DROP TABLE IF EXISTS presenters;
DROP TABLE IF EXISTS categories;

-- =====================================================
-- TABLES
-- =====================================================

-- Categories
CREATE TABLE categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  image_url TEXT,
  color TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Podcasts
CREATE TABLE podcasts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  cover_url TEXT,
  audio_url TEXT,
  transcription TEXT,
  duration INTERVAL,
  category_id UUID REFERENCES categories(id),
  published_at TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Presenters (students who recorded the podcast)
CREATE TABLE presenters (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  photo_url TEXT,
  bio TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Junction table: a podcast can have multiple presenters
CREATE TABLE podcast_presenters (
  podcast_id UUID REFERENCES podcasts(id) ON DELETE CASCADE,
  presenter_id UUID REFERENCES presenters(id) ON DELETE CASCADE,
  PRIMARY KEY (podcast_id, presenter_id)
);

-- Newsletter subscribers
CREATE TABLE newsletter_subscribers (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email      TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Contact messages (write-only via Edge Function)
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

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE podcasts ENABLE ROW LEVEL SECURITY;
ALTER TABLE presenters ENABLE ROW LEVEL SECURITY;
ALTER TABLE podcast_presenters ENABLE ROW LEVEL SECURITY;
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact_messages ENABLE ROW LEVEL SECURITY;

-- Public read policies
CREATE POLICY "Categories are viewable by everyone"
  ON categories FOR SELECT USING (true);

CREATE POLICY "Podcasts are viewable by everyone"
  ON podcasts FOR SELECT USING (true);

CREATE POLICY "Presenters are viewable by everyone"
  ON presenters FOR SELECT USING (true);

CREATE POLICY "Podcast presenters are viewable by everyone"
  ON podcast_presenters FOR SELECT USING (true);

CREATE POLICY "Newsletter subscribers can insert their own email"
  ON newsletter_subscribers FOR INSERT WITH CHECK (true);

CREATE POLICY "Newsletter subscribers are viewable by everyone"
  ON newsletter_subscribers FOR SELECT USING (true);

-- No public policies on contact_messages — write-only via Edge Function with service_role key

-- =====================================================
-- STORAGE POLICIES (public read)
-- =====================================================

CREATE POLICY "Podcast audio is publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'podcast-audio');

CREATE POLICY "Podcast covers are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'podcast-covers');

CREATE POLICY "Presenter photos are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'presenter-photos');

CREATE POLICY "Category images are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'category-images');
