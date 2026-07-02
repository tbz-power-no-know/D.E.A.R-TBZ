-- D.E.A.R. Podcast Website — Supabase Schema
-- Run this in Supabase Dashboard → SQL Editor

-- =====================================================
-- STORAGE BUCKETS (create manually in Dashboard)
-- =====================================================
-- 1. Go to Supabase Dashboard → Storage
-- 2. Create these buckets and set them to PUBLIC:
--    - podcast-audio      (mp3 files)
--    - podcast-covers     (9:16 cover images)
--    - presenter-photos   (presenter headshots)
-- =====================================================

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

-- =====================================================
-- ROW LEVEL SECURITY (RLS)
-- =====================================================

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE podcasts ENABLE ROW LEVEL SECURITY;
ALTER TABLE presenters ENABLE ROW LEVEL SECURITY;
ALTER TABLE podcast_presenters ENABLE ROW LEVEL SECURITY;

-- Public read policies
CREATE POLICY "Categories are viewable by everyone"
  ON categories FOR SELECT USING (true);

CREATE POLICY "Podcasts are viewable by everyone"
  ON podcasts FOR SELECT USING (true);

CREATE POLICY "Presenters are viewable by everyone"
  ON presenters FOR SELECT USING (true);

CREATE POLICY "Podcast presenters are viewable by everyone"
  ON podcast_presenters FOR SELECT USING (true);

-- =====================================================
-- STORAGE POLICIES (public read)
-- =====================================================

DROP POLICY IF EXISTS "Podcast audio is publicly accessible" ON storage.objects;
CREATE POLICY "Podcast audio is publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'podcast-audio');

DROP POLICY IF EXISTS "Podcast covers are publicly accessible" ON storage.objects;
CREATE POLICY "Podcast covers are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'podcast-covers');

DROP POLICY IF EXISTS "Presenter photos are publicly accessible" ON storage.objects;
CREATE POLICY "Presenter photos are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'presenter-photos');

DROP POLICY IF EXISTS "Category images are publicly accessible" ON storage.objects;
CREATE POLICY "Category images are publicly accessible"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'category-images');
