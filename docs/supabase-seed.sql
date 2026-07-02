-- D.E.A.R. Podcast Website — Seed Data
-- Run AFTER supabase-schema.sql
-- Replace placeholder URLs with real Supabase Storage URLs

-- =====================================================
-- CATEGORIES
-- =====================================================

INSERT INTO categories (name, color) VALUES
  ('Crime', '#8b0000'),
  ('Fantasy', '#4b0082'),
  ('Non-Fiction', '#00695c'),
  ('Biography', '#1a237e'),
  ('Classics', '#4e342e'),
  ('Young Adult', '#e64a19'),
  ('Science Fiction', '#0d47a1'),
  ('Romance', '#880e4f');

-- =====================================================
-- PRESENTERS
-- =====================================================

INSERT INTO presenters (name, photo_url, bio) VALUES
  ('Anna Müller', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Student in class 3B, loves mystery novels and classic literature.'),
  ('Lukas Schneider', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Student in class 3A, passionate about science fiction and fantasy.'),
  ('Sara Fischer', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Student in class 3C, enjoys biographies and non-fiction works.');

-- =====================================================
-- PODCASTS
-- =====================================================

-- Crime (category_id = 1)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Hound of the Baskervilles',
    'A classic Sherlock Holmes mystery set on the eerie Dartmoor. Anna explores the legend of the supernatural hound and Holmes'' brilliant deduction.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to this presentation of The Hound of the Baskervilles.
[00:15] This classic mystery by Arthur Conan Doyle follows Sherlock Holmes...
[01:00] The story is set on the wild and desolate Dartmoor...
[02:30] What makes this book special is the atmosphere of suspense...',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Crime')
  );

-- Fantasy (category_id = 2)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Hobbit',
    'Lukas presents J.R.R. Tolkien''s beloved tale of Bilbo Baggins'' unexpected journey with a company of dwarves.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I want to talk about The Hobbit by J.R.R. Tolkien.
[00:20] The story follows Bilbo Baggins, a comfortable hobbit...
[01:30] What I loved most was the world-building...
[03:00] This book is a perfect introduction to fantasy literature...',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Fantasy')
  );

-- Non-Fiction (category_id = 3)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Sapiens: A Brief History of Humankind',
    'Sara summarizes Yuval Noah Harari''s exploration of human history from the Stone Age to the modern world.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to my presentation of Sapiens.
[00:10] This book by Yuval Noah Harari covers the entire history of humankind...
[01:00] The cognitive revolution is one of the key concepts...
[02:45] Harari challenges us to rethink what it means to be human...',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Non-Fiction')
  );

-- Biography (category_id = 4)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Steve Jobs',
    'Anna presents Walter Isaacson''s biography of the Apple co-founder, covering his life from adoption to revolutionizing technology.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I''m presenting the biography of Steve Jobs.
[00:15] Written by Walter Isaacson, this book gives an intimate look...
[01:20] What struck me most was Jobs'' reality distortion field...
[03:10] His story teaches us about persistence and vision...',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Biography')
  );

-- Classics (category_id = 5)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Pride and Prejudice',
    'Sara discusses Jane Austen''s timeless novel about Elizabeth Bennet and Mr. Darcy, exploring themes of love, class, and reputation.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hello, today I''m talking about Pride and Prejudice.
[00:12] Jane Austen wrote this novel in 1813...
[01:15] Elizabeth Bennet is one of literature''s most beloved heroines...
[02:50] The social commentary on class and marriage is still relevant today...',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Classics')
  );

-- Young Adult (category_id = 6)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Fault in Our Stars',
    'Lukas presents John Green''s emotional story of two teenagers who fall in love while dealing with cancer.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I want to talk about The Fault in Our Stars.
[00:10] This book by John Green tells the story of Hazel Grace Lancaster...
[01:00] What makes this book powerful is its honesty about illness...
[02:30] It''s not just a sad story — it''s about finding meaning...',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Young Adult')
  );

-- Science Fiction (category_id = 7)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Dune',
    'Lukas explores Frank Herbert''s epic science fiction masterpiece about politics, religion, and survival on the desert planet Arrakis.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to my presentation of Dune by Frank Herbert.
[00:15] Published in 1965, Dune is often called the greatest sci-fi novel...
[01:30] The world-building on Arrakis is incredible...
[03:00] The themes of power, ecology, and messianism are profound...',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Science Fiction')
  );

-- Romance (category_id = 8)
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Outlander',
    'Sara presents Diana Gabaldon''s historical romance about Claire Randall, a WWII nurse transported back to 18th-century Scotland.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I''m presenting Outlander by Diana Gabaldon.
[00:12] The story follows Claire Randall, a nurse from 1945...
[01:10] The time travel element combined with historical detail is fascinating...
[02:40] The romance between Claire and Jamie is passionate and complex...',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Romance')
  );

-- More podcasts to reach 12

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Gone Girl',
    'Anna presents Gillian Flynn''s psychological thriller about a marriage gone terribly wrong.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I want to talk about Gone Girl.
[00:10] This thriller by Gillian Flynn keeps you guessing until the end...
[01:20] The unreliable narrators make this book unique...
[02:50] It explores the dark side of marriage and media manipulation...',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Crime')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Alchemist',
    'Sara discusses Paulo Coelho''s philosophical fable about Santiago''s journey to find his personal legend.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to my presentation of The Alchemist.
[00:10] This novel by Paulo Coelho is about a young shepherd named Santiago...
[01:00] The concept of the Personal Legend is the heart of the book...
[02:30] It''s a reminder to follow your dreams and listen to your heart...',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Classics')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Educated',
    'Anna presents Tara Westover''s memoir about growing up in a survivalist family and eventually earning a PhD from Cambridge.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I''m presenting Educated by Tara Westover.
[00:15] This memoir tells the incredible story of a girl who never went to school...
[01:20] Her journey from isolation to education is both inspiring and heartbreaking...
[03:00] It makes you think about the power of education and self-invention...',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Biography')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    '1984',
    'Lukas presents George Orwell''s dystopian masterpiece about totalitarianism, surveillance, and the power of language.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png', 
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I want to talk about 1984 by George Orwell.
[00:10] Written in 1949, this novel describes a totalitarian society...
[01:15] Big Brother, doublethink, and Newspeak are concepts that still resonate...
[02:45] Orwell''s warning about government control and truth manipulation is more relevant than ever...',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Science Fiction')
  );

-- =====================================================
-- PODCAST-PRESENTER LINKS
-- =====================================================

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('The Hound of the Baskervilles', 'Gone Girl', 'Educated')
  AND pr.name = 'Anna Müller';

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('The Hobbit', 'The Fault in Our Stars', 'Dune', '1984')
  AND pr.name = 'Lukas Schneider';

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('Sapiens: A Brief History of Humankind', 'Pride and Prejudice', 'Outlander', 'The Alchemist')
  AND pr.name = 'Sara Fischer';
