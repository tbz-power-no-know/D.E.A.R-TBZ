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

-- Crime
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Hound of the Baskervilles',
    'A classic Sherlock Holmes mystery set on the eerie Dartmoor. Anna explores the legend of the supernatural hound and Holmes'' brilliant deduction.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hello everyone, welcome to my book presentation for the D.E.A.R. project. Today I want to talk about The Hound of the Baskervilles by Arthur Conan Doyle.
[00:18] This is probably the most famous Sherlock Holmes novel, and for good reason. It was published in 1902 and it''s the fourth of the five novels featuring Holmes and his loyal friend Dr. Watson.
[00:38] The story begins with a letter that Dr. Watson receives from Sir Henry Baskerville, a young man who has just inherited the Baskerville estate in Devonshire. The letter warns him about a family curse involving a monstrous hound.
[00:58] Now, what makes this book so special is the setting. Dartmoor is not just a backdrop — it''s almost a character itself. The fog, the marshes, the isolated moorland houses, everything creates this incredible atmosphere of dread and mystery.
[01:20] The legend goes back generations. A man named Hugo Baskerville was said to have been killed by a giant hound after a night of debauchery. And now, Sir Charles Baskerville, the previous owner of the estate, has died under mysterious circumstances.
[01:40] Holmes is called in to investigate, but instead of going himself right away, he sends Watson to Baskerville Hall while he stays behind in London. This is a brilliant narrative choice by Doyle because it means we experience the mystery through Watson''s eyes first.
[02:00] As Watson explores the moor and talks to the locals, strange things keep happening. A ghostly figure is seen walking the moor at night. Someone is following Sir Henry. And there are these terrible howls echoing across the moorland.
[02:20] The genius of this novel is that Doyle gives us so many possible explanations. Is it really a supernatural hound? Is it a criminal plot? Or is it something else entirely? Each chapter adds new clues and new red herrings.
[02:40] When Holmes finally arrives on the moor, he reveals that he''s been investigating from London all along. His method of deduction is absolutely fascinating — he pieces together the truth from the smallest details.
[03:00] The climax takes place on the moor at night, and it''s one of the most thrilling scenes in all of literature. The fog is so thick you can barely see, and then the hound appears — a real hound, but covered in phosphorus to make it look supernatural.
[03:20] In the end, the villain is revealed to be Stapleton, a member of the Baskerville family who wanted to inherit the estate. He used the legend of the hound to frighten people and carry out his murders.
[03:40] What I loved most about this book is how Doyle balances the supernatural with the rational. The story makes you believe in the impossible, but then Holmes always brings reason back. It''s a perfect mystery.
[04:00] I would highly recommend this book to anyone who loves a good mystery. It''s not too long, the pacing is excellent, and the atmosphere is unforgettable. Thank you for listening to my presentation!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Crime')
  );

-- Fantasy
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Hobbit',
    'Lukas presents J.R.R. Tolkien''s beloved tale of Bilbo Baggins'' unexpected journey with a company of dwarves.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hi everyone, today I''m going to talk about The Hobbit by J.R.R. Tolkien. This is one of the most famous fantasy books ever written, and it completely changed the genre forever.
[00:18] The book was published in 1937, long before Lord of the Rings, and it was originally written as a children''s story. But honestly, it''s a book that people of every age can enjoy.
[00:36] The story starts in the most unexpected way. We meet Bilbo Baggins, a hobbit who lives in a comfortable hole in the ground in the Shire. He likes quiet evenings, good food, and no adventures. He is the last person you would expect to go on a quest.
[00:55] But one day, the wizard Gandalf shows up at his door with a company of thirteen dwarves led by Thorin Oakenshield. They need a burglar for their mission, and Gandalf thinks Bilbo is the perfect choice.
[01:13] The dwarves want to reclaim their homeland, the Lonely Mountain, from the dragon Smaug. It''s a huge task, and Bilbo is terrified at first. He doesn''t want to leave his comfortable home. But something inside him wants adventure, and so the journey begins.
[01:32] One of my favorite parts of the book is when Bilbo gets separated from the dwarves and has to save himself from three trolls. He learns to be resourceful and clever, and this is the beginning of his transformation from a timid hobbit to a brave adventurer.
[01:50] Then there''s the scene in the Misty Mountains with the goblins, and the escape through the caves. And of course, the encounter with Gollum in the dark underground tunnels. The riddle game between Bilbo and Gollum is one of the most famous scenes in fantasy literature.
[02:10] During this encounter, Bilbo finds a ring that makes him invisible. At this point, Tolkien probably didn''t plan for this ring to become the central object of Lord of the Rings, but it ends up being the most important discovery in all of Middle-earth.
[02:28] The journey continues through the forests of Mirkwood, where the dwarves get captured by elves, and Bilbo has to find a way to free them using the barrels. It''s funny and clever and shows how Bilbo has become much braver.
[02:46] When they finally reach the Lonely Mountain, Bilbo has to face the dragon Smaug. This is an incredible scene because Bilbo is just a small hobbit talking to the most powerful creature in the region. And he does it with wit and courage.
[03:05] Smaug is such a well-written villain. He''s intelligent, arrogant, and dangerous. The conversation between Bilbo and Smaug is like a psychological battle, and Bilbo manages to outsmart him.
[03:23] But the story doesn''t end there. Smaug''s defeat leads to a conflict between the dwarves, the elves, and the men of Lake-town. Greed takes over, and Thorin is affected by the curse of the Arkenstone.
[03:40] In the end, the Battle of Five Armies takes place, and Bilbo plays a crucial role in saving everyone. He returns to the Shire changed — wiser, braver, and richer. He''s no longer just a simple hobbit who likes quiet evenings.
[03:58] What I love most about The Hobbit is the sense of wonder. Tolkien creates a world that feels completely real, with its own history, languages, and cultures. Every place you visit on the journey feels unique and alive.
[04:15] The book also teaches us that even the smallest person can change the course of the future. Bilbo proves that courage isn''t about being big and strong — it''s about doing the right thing even when you''re scared.
[04:32] I think everyone should read The Hobbit at least once. It''s a beautiful story about friendship, courage, and finding out who you really are. Thank you for listening!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Fantasy')
  );

-- Non-Fiction
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Sapiens: A Brief History of Humankind',
    'Sara summarizes Yuval Noah Harari''s exploration of human history from the Stone Age to the modern world.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hello, today I''m presenting Sapiens: A Brief History of Humankind by Yuval Noah Harari. This is not your typical history book, and it completely changed the way I think about our species.
[00:20] Harari is an Israeli historian, and this book was first published in 2011 in Hebrew. It became a massive bestseller worldwide and has been translated into more than sixty languages.
[00:38] The book is divided into four main parts, each covering a major revolution in human history. The Cognitive Revolution, the Agricultural Revolution, the Unification of Humankind, and the Scientific Revolution.
[00:56] The Cognitive Revolution happened about seventy thousand years ago, and Harari argues that this is when Homo sapiens developed the ability to create and believe in things that don''t physically exist.
[01:14] Things like gods, nations, money, and human rights — these are what Harari calls fictional realities. They only exist because we all agree they exist. And this ability to cooperate in large numbers based on shared beliefs is what made us the dominant species on Earth.
[01:33] The Agricultural Revolution, which began around twelve thousand years ago, is where Harari makes a really provocative argument. He calls it the biggest fraud in history.
[01:48] He argues that agriculture didn''t make life better for most people. Farmers worked harder, ate a less varied diet, and were more vulnerable to disease. But the population grew enormously, so from the species'' perspective, it was a success.
[02:06] This idea really made me think. We usually assume that progress always means improvement, but Harari challenges that assumption at every turn.
[02:18] The third part of the book deals with how the world became unified. Harari identifies three universal orders that never stop expanding: empires, religion, and money.
[02:33] Empires conquer and assimilate. Religions create shared belief systems across cultures. And money — money is the most successful system of mutual trust ever created between strangers.
[02:48] Harari explains how money works because everyone believes in it, not because it has intrinsic value. This is a fascinating way to think about economics and how societies function.
[03:03] The final part covers the Scientific Revolution starting around five hundred years ago. Harari argues that science succeeded because Europeans admitted their ignorance.
[03:18] Before this, most civilizations believed that all important knowledge already existed in ancient texts. But the scientific mindset says that we don''t know everything, and we can learn more through observation and experimentation.
[03:35] This led to an unprecedented increase in knowledge and power. Combined with empire and capitalism, it created the modern world we live in today.
[03:48] One of the most thought-provoking chapters is about happiness. Harari asks whether we are happier than our ancestors who lived as hunter-gatherers tens of thousands of years ago.
[04:03] He argues that happiness has more to do with our expectations than with our actual circumstances. As our expectations rise, we need more and more just to feel satisfied.
[04:18] The book ends with a discussion of where we might be heading. With biotechnology and artificial intelligence, Homo sapiens might be on the verge of evolving into a completely different species.
[04:35] Harari raises serious questions about what it means to be human and whether we should be afraid of our own technological power.
[04:48] I found this book absolutely mind-blowing. It''s not just a history book — it''s a philosophical exploration of what makes us who we are. I highly recommend it to anyone who wants to understand the big picture of human history. Thank you!',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Non-Fiction')
  );

-- Biography
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Steve Jobs',
    'Anna presents Walter Isaacson''s biography of the Apple co-founder, covering his life from adoption to revolutionizing technology.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hi everyone, today I''m presenting the biography of Steve Jobs by Walter Isaacson. This book was published in 2011, the year after Jobs died, and it''s based on more than forty interviews with Jobs himself.
[00:22] Isaacson also spoke with more than one hundred family members, friends, competitors, and colleagues, so the portrait is incredibly detailed and honest.
[00:38] Steve Jobs was born in 1955 and adopted by Paul and Clara Jobs. His biological mother was a young unmarried graduate student who wanted him to go to college, but the adoptive parents were only high school graduates.
[00:55] From a young age, Steve was curious and intense. He loved taking things apart to see how they worked. His father taught him carpentry in their garage, and Steve learned the importance of making the back of a cabinet look as beautiful as the front, even though nobody would ever see it.
[01:15] This attention to detail would become a defining characteristic of everything he did at Apple.
[01:23] After dropping out of Reed College, Jobs audited classes for a year, including a calligraphy course that seemed completely useless at the time. But ten years later, when he was designing the Macintosh, that calligraphy knowledge inspired the beautiful typography that became a hallmark of Apple computers.
[01:43] Jobs traveled to India in search of spiritual enlightenment, where he explored Zen Buddhism. This influence showed up in his design philosophy — simplicity, minimalism, and the idea that technology should feel almost spiritual in its elegance.
[02:02] In 1976, at age twenty-one, Jobs and his friend Steve Wozniak started Apple in the Jobs family garage. The Apple I was a circuit board, but the Apple II became the first mass-produced personal computer and made them millionaires by their twenties.
[02:22] But success changed Jobs. He became more demanding, more intense, and sometimes impossible to work with. When Apple hired a professional CEO, John Sculley, Jobs eventually lost a power struggle and was forced out of the company he founded in 1985.
[02:40] This was a devastating moment for him, but he later said it was the best thing that could have happened. Being fired freed him to be creative again. He started NeXT, a computer company, and bought a small graphics division from Lucasfilm that became Pixar.
[03:00] Pixar went on to create Toy Story, the first fully computer-animated feature film, and became one of the most successful animation studios in history.
[03:12] Meanwhile, Apple was struggling, and in 1997 they acquired NeXT, bringing Jobs back to the company he founded. What happened next is almost like a fairy tale.
[03:25] Jobs streamlined Apple''s product line, focused on design and user experience, and launched a series of products that changed the world. The iMac in 1998, the iPod in 2001, the iPhone in 2007, and the iPad in 2010.
[03:43] Each of these products didn''t just improve on what existed — they created entirely new categories. The iPhone didn''t just make a better phone; it reinvented what a phone could be.
[03:58] Isaacson doesn''t shy away from Jobs'' flaws. He was known for his reality distortion field — his ability to convince people that the impossible was possible. But he could also be cruel, impatient, and emotionally unavailable.
[04:15] He initially refused to acknowledge his daughter Lisa, and his relationship with his children was complicated. The book shows that genius and emotional intelligence don''t always go hand in hand.
[04:30] When Jobs was diagnosed with pancreatic cancer in 2003, he delayed treatment for nine months, hoping alternative therapies would work. This decision cost him precious time, and he ultimately died in 2011 at age fifty-six.
[04:48] What I found most inspiring about this book is Jobs'' relentless pursuit of excellence. He had this belief that technology alone is not enough — it must be married with the liberal arts, with design, with an understanding of what makes people happy.
[05:05] His famous quote, Stay Hungry, Stay Foolish, really captures his spirit. He never stopped questioning, never stopped wanting to make things better, and that drive changed the world. Thank you for listening!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Biography')
  );

-- Classics
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Pride and Prejudice',
    'Sara discusses Jane Austen''s timeless novel about Elizabeth Bennet and Mr. Darcy, exploring themes of love, class, and reputation.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hello everyone, today I''m talking about Pride and Prejudice by Jane Austen. This novel was published in 1813, and it is widely considered one of the greatest works of English literature.
[00:20] The famous opening line — It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife — is one of the most recognizable sentences in all of literature.
[00:38] Austen uses irony from the very first line, because it''s not actually the wealthy bachelor who wants a wife — it''s the mothers of unmarried daughters who are desperate to find him one.
[00:55] The story follows five sisters — Jane, Elizabeth, Mary, Kitty, and Lydia Bennet — whose mother is determined to marry them off to wealthy men. In Regency England, women had very few options for financial independence, so marriage was essentially a necessity.
[01:15] Elizabeth Bennet, the second daughter, is the protagonist, and she is one of the most beloved characters in literature. She is intelligent, witty, independent, and she has strong opinions about everything.
[01:32] The central relationship is between Elizabeth and Mr. Darcy, a wealthy and proud gentleman who attends a local ball. At first, Darcy refuses to dance with Elizabeth because she doesn''t meet his standards of beauty, and Elizabeth is immediately offended by his arrogance.
[01:50] This sets up the title of the book perfectly — Darcy''s pride and Elizabeth''s prejudice against each other create a wall that both of them have to overcome.
[02:05] But then Darcy does something unexpected. Despite his dislike of Elizabeth''s family, he falls deeply in love with her and proposes. The problem is that he proposes in the worst possible way — reminding her that she is socially inferior to him.
[02:23] Elizabeth rejects him fiercely, and in her rejection, she lists all his faults. This confrontation is one of the most powerful scenes in the book because both characters are forced to see themselves honestly for the first time.
[02:40] As the story progresses, both Elizabeth and Darcy change. Darcy becomes more humble and generous, and Elizabeth realizes that her first impressions were wrong. She learns that prejudice can blind us to the truth about other people.
[02:58] There are also wonderful supporting characters. Mr. Bennet is witty but detached. Mrs. Bennet is a caricature of a nervous, matchmaking mother. And Mr. Collins, the ridiculous cousin who inherits the family estate, is one of the funniest characters Austen ever wrote.
[03:18] The character of George Wickham adds a major plot twist. He seems charming at first, but he turns out to be a manipulative villain who tries to elope with the youngest Bennet sister, Lydia, which would ruin the entire family''s reputation.
[03:35] It turns out that Darcy secretly intervenes to save the family, paying Wickham''s debts and arranging the marriage. Elizabeth discovers this act of kindness, and it completely transforms her feelings toward him.
[03:52] What makes Pride and Prejudice so timeless is that it''s not just a romance. It''s a sharp social commentary on class, money, gender, and marriage in early nineteenth-century England.
[04:10] Austen was writing at a time when women had almost no legal rights and their worth was measured by their marriageability. She creates a heroine who refuses to settle — Elizabeth turns down two marriage proposals before accepting the one she truly wants.
[04:28] The prose is beautiful, the dialogue is sparkling, and the humor is still funny after two hundred years. Every time I read it, I notice something new.
[04:42] I think this book is essential reading. It teaches us about the dangers of judging people too quickly and the importance of being willing to change our minds. Thank you for listening to my presentation!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Classics')
  );

-- Young Adult
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Fault in Our Stars',
    'Lukas presents John Green''s emotional story of two teenagers who fall in love while dealing with cancer.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hey everyone, today I want to talk about The Fault in Our Stars by John Green. This book was published in 2012 and it became one of the best-selling young adult novels of all time.
[00:20] I have to warn you — this book will make you cry. But it''s not just a sad book. It''s funny, it''s smart, and it''s one of the most honest portrayals of teenage life I''ve ever read.
[00:38] The protagonist is Hazel Grace Lancaster, a sixteen-year-old girl who has been surviving thyroid cancer for two and a half years. She''s on a drug called Murine that''s keeping the cancer in check, but it''s damaging her kidneys and lungs.
[00:56] Hazel attends a cancer support group, which she finds mostly pointless, until she meets Augustus Waters. Gus is charming, confident, and a cancer survivor too — he had his leg amputated below the knee.
[01:13] Their first conversation starts with Hazel reading Gus'' favorite book out loud at the support group, and he asks her to finish it because the author is stuck on the ending. This becomes the thread that connects their entire relationship.
[01:28] What I love about John Green''s writing is that Hazel and Gus feel like real teenagers, not stereotypes. They talk about books, they argue about movies, they have awkward moments, and they make each other laugh.
[01:45] When Hazel and Gus fall in love, their parents are worried. They know that loving someone means you have something to lose. But Hazel has this powerful idea that she doesn''t want to be a bomb, a bombshell, a bomb crater. She just wants to be a girl who falls in love.
[02:05] The book follows Hazel and Gus on a trip to Amsterdam to meet the author of Hazel''s favorite book, Peter van Houten. This journey is both funny and heartbreaking, and it forces both of them to confront questions about meaning and mortality.
[02:23] Van Houten turns out to be a bitter, drunken recluse who has lost faith in the power of stories. This creates an interesting contrast with Hazel, who believes deeply in the meaning that stories give our lives.
[02:38] One of the most powerful lines in the book is when Hazel says that her favorite part of a story is the first sentence of the last chapter — the moment when you know it''s over but you keep reading anyway.
[02:55] The book doesn''t give us easy answers about death and suffering. Hazel has to face the reality that Gus'' cancer has come back, and the ending is one of the most devastating in modern fiction.
[03:12] But here''s the thing — the book isn''t really about cancer. Cancer is just the backdrop. The real story is about two kids who find each other and make each other''s lives infinitely better, even if it''s only for a little while.
[03:30] Gus writes Hazel a letter that she reads at the end of the book, and it captures everything that makes their love so special. He says that he fell in love with her mind, her heart, and yes, her body, but mostly her mind.
[03:48] The title comes from a line from van Houten''s fictional book — It was not the fault of the stars that we suffered. Green is saying that suffering is random and unfair, but that doesn''t mean our lives don''t matter.
[04:05] I think this book is important because it shows that teenagers with cancer are still teenagers. They still fall in love, they still want to travel, they still care about books and movies and meaning.
[04:20] It also teaches us that the measure of a life isn''t how long it lasts, but how deeply you love and how much you love. Hazel and Gus have a small life, but it''s a wide one.
[04:35] If you haven''t read this book, I really encourage you to pick it up. Bring tissues, but read it anyway. Thank you for listening!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Young Adult')
  );

-- Science Fiction
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Dune',
    'Lukas explores Frank Herbert''s epic science fiction masterpiece about politics, religion, and survival on the desert planet Arrakis.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to my presentation of Dune by Frank Herbert. This book was published in 1965, and it remains the only science fiction novel to win the Hugo Award, the Nebula Award, and a special Edgar Award.
[00:20] It is often called the greatest science fiction novel ever written, and I think after reading it, you understand why.
[00:32] The story is set far in the future, in an interstellar empire where humanity has colonized many planets but has lost the ability to create thinking machines. All computation is done by human mentalists trained by the Mentat order.
[00:50] The central setting is Arrakis, also known as Dune, the only source of the most valuable substance in the universe — the spice melange. The spice extends life, enhances consciousness, and is essential for space travel.
[01:08] The noble House Atreides has been given control of Arrakis by the Emperor, replacing the treacherous House Harkonnen. Paul Atreides, the young heir, and his mother Lady Jessica, a Bene Gesserit sister, arrive on the desert planet.
[01:25] From the beginning, Herbert builds incredible tension. The Atreides are betrayed, Duke Leto is killed, and Paul and Jessica must flee into the desert to survive. This is where Paul''s real education begins.
[01:43] Paul is taken in by the Fremen, the indigenous people of Arrakis who have adapted to the harsh desert environment over generations. They wear stillsuits that recycle every drop of moisture, and they see themselves as the true masters of Dune.
[02:00] What makes Dune so unique is that it''s not just about space battles and laser guns. It''s about ecology, politics, religion, and the danger of charismatic leaders. Herbert was deeply concerned about how easily people can be manipulated by messianic figures.
[02:18] Paul has prescient visions — he can see possible futures — and he realizes that if he leads the Fremen in a jihad, it will spread across the entire universe. The terrifying thing is that he can see this future but he cannot stop it from happening.
[02:38] The Bene Gesserit sisterhood has been manipulating breeding programs across the galaxy for centuries, trying to create the Kwisatz Haderach — a being who can transcend the limits of time and space. Paul turns out to be exactly that being.
[02:55] Lady Jessica is a fascinating character. She broke the Bene Gesserit rules by having a son instead of a daughter with Duke Leto, and this single decision sets everything in motion. She''s powerful, intelligent, and deeply conflicted.
[03:12] The ecology of Arrakis is one of the most detailed world-building achievements in fiction. Herbert, who was an environmentalist, uses the desert planet to explore themes of resource scarcity, environmental adaptation, and the relationship between people and their environment.
[03:30] The water discipline of the Fremen — their ability to survive in the most hostile environment imaginable — is portrayed with incredible detail. Every drop of water is sacred, and this shapes their entire culture and religion.
[03:48] The political intrigue is equally complex. The Emperor, the Spacing Guild, the Landsraad, the Bene Gesserit — all these forces are playing a game of power, and Arrakis is the chessboard.
[04:05] What I find most impressive is how Herbert makes all of this accessible. The book is dense with information, but the story of Paul and his journey keeps you turning pages. It''s a page-turner disguised as a philosophical treatise.
[04:22] The ending of the first book is a cliffhanger of epic proportions, and Herbert followed it up with five more novels in the series. But the first book stands on its own as a complete and powerful story.
[04:38] Dune influenced everything that came after it — Star Wars, Game of Thrones, even Avatar. If you want to understand modern science fiction, you have to read Dune. Thank you for listening!',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Science Fiction')
  );

-- Romance
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Outlander',
    'Sara presents Diana Gabaldon''s historical romance about Claire Randall, a WWII nurse transported back to 18th-century Scotland.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hi everyone, today I''m presenting Outlander by Diana Gabaldon. This is the first book in a series of eight novels, and it was published in 1991. It has since become one of the most beloved historical fiction series ever written.
[00:22] The story begins in 1945, just after the end of World War II. Claire Randall Beauchamp is a former military nurse returning to Scotland with her husband Frank for their second honeymoon.
[00:38] They visit a circle of standing stones in the Scottish Highlands, and when Claire touches the stones, something impossible happens — she is transported back in time to the year 1743.
[00:53] She wakes up in a medieval Scottish village, speaking English that nobody understands, wearing clothes that mark her as strange, and facing a world that is brutal and unforgiving.
[01:08] Claire is soon captured and forced to marry Jamie Fraser, a young Highland chieftain, to protect her honor. Jamie is honorable, brave, and kind — everything Claire could admire. But her heart belongs to Frank, who is waiting for her two hundred years in the future.
[01:28] This creates an impossible love triangle across centuries, and Gabaldon handles it with incredible nuance. Claire is not a passive character — she makes difficult choices, and she lives with the consequences.
[01:43] What makes Outlander so special is the historical detail. Gabaldon, who has a background in nursing and journalism, researches everything meticulously. The medicine, the politics, the daily life of 18th-century Scotland — it all feels authentic.
[01:58] Claire uses her knowledge of medicine to become a healer in the Highland community, and this gives her a purpose and a way to earn the respect of the people around her. She saves lives using techniques that are centuries ahead of their time.
[02:15] The political backdrop is the Jacobite Rising, the attempt to restore the Stuart dynasty to the British throne. The Battle of Culloden, which is coming, will be one of the bloodiest battles fought on British soil, and it will destroy the Highland way of life forever.
[02:33] This looming catastrophe adds tremendous tension to the story. Claire knows from history books what is going to happen, and she desperately wants to change the course of events.
[02:48] Jamie Fraser is one of the best-written male characters I''ve ever encountered. He''s a warrior, a leader, and a romantic, but he''s also vulnerable and human. He makes mistakes, he feels guilt, and he loves Claire with a depth that is both beautiful and painful.
[03:05] The relationship between Claire and Jamie is complex because it begins under coercion, but it grows into something genuine. Gabaldon doesn''t rush this — the love develops slowly and feels earned.
[03:20] The supporting characters are equally well-developed. There''s Murron, Jamie''s first love; Fergus, his younger brother; and Brianna, Claire''s daughter, who becomes the protagonist of the later books in the series.
[03:35] One thing that sets Outlander apart from other historical fiction is how seriously it treats its female protagonist. Claire is a modern woman — independent, educated, and used to having agency — thrust into a world where women have almost no rights.
[03:52] She navigates this with intelligence, courage, and sometimes desperation. She refuses to be a victim of her circumstances, even when the circumstances are nearly unbearable.
[04:08] The book is long — nearly eight hundred pages — but it never feels slow. The prose is vivid, the dialogue crackles, and the emotional stakes are always high.
[04:22] Gabaldon also writes about the darker sides of history honestly. Violence, sexual assault, and the brutal realities of war are not romanticized. This makes the moments of tenderness and love even more powerful.
[04:38] The ending of the first book is emotionally devastating and sets up the rest of the series perfectly. I finished it and immediately started the second book, Voyager.
[04:52] If you love historical fiction, strong female characters, or epic love stories, Outlander is absolutely essential reading. Thank you for listening to my presentation!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Romance')
  );

-- More podcasts to reach 12

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Gone Girl',
    'Anna presents Gillian Flynn''s psychological thriller about a marriage gone terribly wrong.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hello everyone, today I want to talk about Gone Girl by Gillian Flynn. This novel was published in 2012 and it became an instant bestseller. It was adapted into a film by David Fincher in 2014, but honestly, the book is even better.
[00:22] The story opens on the morning of Nick and Amy Dunne''s fifth wedding anniversary. Amy has disappeared. The house is a crime scene — there''s blood, a kitchen knife, and signs of a struggle.
[00:38] Nick becomes the prime suspect, and as the media circus intensifies, he gives a TV interview that makes him look even worse. The public turns against him, and everyone seems to think he''s murdered his wife.
[00:53] But here''s the thing — Flynn plays a trick on the reader, and when you figure out what''s happening, you will not see it coming. The book switches between Nick''s perspective and Amy''s perspective, and Amy''s sections are written as diary entries.
[01:10] What makes these diary entries so disturbing is that you realize they are a carefully constructed performance. Amy has been writing them to create a narrative that makes her the perfect victim and Nick the perfect villain.
[01:28] Amy is one of the most terrifying characters in modern fiction. She is intelligent, calculating, and completely ruthless. She has planned her disappearance down to the smallest detail, and she is willing to destroy anyone who gets in her way.
[01:45] But Flynn also makes you understand Amy. She grew up watching her mother try to mold her into the perfect girl, and she learned early that performance and manipulation are survival tools.
[02:00] Nick is not innocent either. He''s having an affair, he''s resentful about his wife''s controlling behavior, and he''s deeply flawed. The book forces you to ask yourself — who is the real monster here?
[02:15] The setting of small-town Missouri adds another layer. The media turns Nick and Amy''s marriage into entertainment, and the townspeople play judge and jury. Flynn is criticizing how society consumes personal tragedy as entertainment.
[02:32] The detective, Rhonda Boney, is a great character. She sees through the performance and starts asking the right questions. She represents the voice of reason in a world gone crazy.
[02:48] The third act of the book is a masterclass in tension. When Amy reveals herself and what she''s done, the situation becomes almost impossible. Both Nick and Amy are trapped in a nightmare of their own making.
[03:05] The ending is one of the most chilling in modern fiction. It''s not a happy ending, it''s not a sad ending — it''s a dark ending that makes you sit in silence after you finish the last page.
[03:20] Flynn wrote this book after working as a journalist and a TV writer, and you can feel that skill in every page. The pacing is perfect, the twists are earned, and the prose is sharp and witty even in the darkest moments.
[03:38] What I found most disturbing is how realistic the book feels. The way the media manipulates the truth, the way people perform happiness on social media, the way marriages can become prisons — it''s all uncomfortably close to real life.
[03:55] I would recommend this book to anyone who loves a psychological thriller, but be prepared — it will stay with you long after you finish reading it. Thank you for listening!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Crime')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'The Alchemist',
    'Sara discusses Paulo Coelho''s philosophical fable about Santiago''s journey to find his personal legend.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Welcome to my presentation of The Alchemist by Paulo Coelho. This book was originally published in Portuguese in 1988, and it has since been translated into more than eighty languages, selling over sixty million copies worldwide.
[00:22] It''s a short book — you can read it in an afternoon — but it''s the kind of book that stays with you for years.
[00:35] The story follows Santiago, a young Andalusian shepherd who dreams of finding a treasure buried near the Egyptian pyramids. After having the same dream repeatedly, he visits a gypsy woman for interpretation and then meets an old man named Melchizedek, the King of Salem.
[00:53] Melchizedek tells Santiago about his Personal Legend — the thing he has always wanted to accomplish since he was young. He says that when you want something, all the universe conspires to help you achieve it.
[01:10] This sentence became one of the most famous lines in modern literature, and it captures the entire message of the book. Your dreams matter, and the universe wants you to follow them.
[01:23] Santiago sells his sheep and travels to Morocco, and from there across the Sahara Desert to Egypt. Along the way, he learns about the Language of the World, the Soul of the World, and the concept of Maktub — it is written.
[01:40] In Morocco, Santiago meets an Englishman who is traveling to study with an alchemist. The Englishman reads hundreds of books about alchemy but refuses to talk to the alchemist himself. Santiago, on the other hand, learns by experience, by watching, and by listening.
[01:58] This contrast between book knowledge and lived experience is one of the book''s central themes. Coelho is saying that wisdom comes from the journey itself, not from reading about it.
[02:12] Santiago eventually reaches the alchemist in the Egyptian desert, and the alchemist becomes his mentor. The alchemist teaches him to listen to his heart, to communicate with the wind, the sun, and the desert, and to understand that fear of suffering is worse than suffering itself.
[02:30] One of the most beautiful scenes is when Santiago learns to turn himself into the wind. It''s a metaphor for understanding that everything in the universe is connected, and that by understanding yourself, you understand everything.
[02:48] Santiago also falls in love with a desert woman named Fatima at an oasis. She tells him that she is like a flower — if he leaves, she will wither, but she wants him to follow his Personal Legend anyway. True love, she says, does not keep you from pursuing your dreams.
[03:05] The ending of the book contains a twist that is both surprising and deeply meaningful. After all this journey across the desert, Santiago discovers that the treasure was buried right where he started — back in Spain, at the abandoned church where he used to sleep as a shepherd.
[03:23] But the point is not the treasure. The point is the journey. Santiago would never have found the treasure if he hadn''t traveled to Egypt, met the alchemist, learned about the Soul of the World, and fallen in love.
[03:40] The book is simple, almost like a fable, and some critics say it''s too simple. But I think that''s exactly the point. The deepest truths are often the simplest ones.
[03:55] Coelho wrote The Alchemist after a period of depression and personal crisis, and you can feel that the book is his own Personal Legend given form. It''s a book about hope, about courage, and about the courage to be yourself.
[04:10] I recommend this book to anyone who has ever felt lost, or unsure about their path in life. It''s a gentle reminder that your dreams are worth following, even when the path is uncertain. Thank you for listening!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Classics')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Educated',
    'Anna presents Tara Westover''s memoir about growing up in a survivalist family and eventually earning a PhD from Cambridge.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I''m presenting Educated by Tara Westover. This memoir was published in 2018, and it won numerous awards including the LA Times Book Award and the Goodreads Choice Award for Memoir and Autobiography.
[00:20] It was also on Barack Obama''s reading list, and Bill Gates called it one of his favorite books. But awards aside, this is simply one of the most remarkable true stories I have ever read.
[00:38] Tara Westover was born in 1986 to a survivalist family in the mountains of Idaho. Her father was a paranoid Mormon who believed the government was evil and that hospitals, schools, and medicine were tools of a conspiracy to control people.
[00:55] Because of his beliefs, Tara never went to school. She never visited a doctor. She didn''t have a birth certificate. For the first seventeen years of her life, she didn''t know what the Holocaust was or what the Vietnam War was.
[01:13] Her days were spent working in her father''s junkyard, lifting heavy metal with her brothers, and helping her mother with herbal medicine. Her mother was a skilled herbalist but also an abusive parent, and the children were regularly injured at work.
[01:30] Tara''s oldest brother, Shawn, was physically and emotionally abusive, and when Tara tried to tell her parents, her father blamed her for provoking him. This pattern of gaslighting — making you doubt your own reality — is one of the most painful parts of the book.
[01:48] Everything changed when her older brother Tyler, who had left home to study at BYU, encouraged Tara to take the ACT exam. She had never been to school, but she taught herself everything from old textbooks she found in the junkyard.
[02:05] She passed the exam with high scores and got into Brigham Young University. This was the beginning of her education, but it was also the beginning of her distance from her family.
[02:18] At university, Tara is shocked by how different the world is from what she knew. She doesn''t know how to behave in a classroom. She doesn''t know basic historical facts. She burns her hand on a hot pan and doesn''t know to put it under cold water.
[02:35] But she is determined, and she works harder than anyone around her. Her professors recognize her talent, and she eventually gets a research position with historian Hugh Hedstrom, who becomes a mentor and father figure to her.
[02:50] Tara earns her bachelor''s degree, then goes to Cambridge as a Fulbright scholar, and eventually earns a PhD in history from Cambridge University. She also spends a year at Harvard studying under the historian Timothy Snyder.
[03:08] But every step toward education is a step away from her family. Her father declares her the enemy, and her brothers take sides. The central conflict of the book is not just about education — it''s about the impossible choice between family and self.
[03:25] Westover writes about this conflict with incredible honesty. She doesn''t paint her family as monsters, and she doesn''t paint herself as a hero. She shows how love and abuse can coexist in the same family, and how leaving is both liberation and loss.
[03:43] The title of the book is deeply meaningful. Educated is in the past participle — it suggests that education is something that happens to you, that transforms you fundamentally. But it also raises the question: can you be educated and still love the people who opposed your education?
[04:00] Westover doesn''t give us a simple answer. She shows that education gave her the tools to understand her own life, but it also cost her her relationship with her father and some of her siblings.
[04:15] The writing is beautiful — lyrical, precise, and deeply emotional. Westover has a gift for finding the exact metaphor that captures a feeling, and her descriptions of the Idaho wilderness are some of the most vivid I''ve ever read.
[04:32] This book changed my perspective on what education means. It''s not just about degrees and credentials — it''s about gaining the ability to see the world clearly, to question what you''ve been told, and to create your own identity.
[04:48] I cannot recommend this book enough. It''s one of those rare books that makes you want to call your family, talk to your teachers, and reconsider everything you think you know. Thank you for listening!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Biography')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    '1984',
    'Lukas presents George Orwell''s dystopian masterpiece about totalitarianism, surveillance, and the power of language.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-covers/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Today I want to talk about 1984 by George Orwell. This novel was published in 1949, just two years after the end of World War II, and it has become the defining work of dystopian fiction.
[00:20] Orwell wrote it as a warning about totalitarianism, and seventy-five years later, it feels more relevant than ever.
[00:33] The story is set in Airstrip One, formerly Great Britain, which is now part of the superstate Oceania. The government is ruled by a party led by Big Brother, whose face is everywhere — on posters, on screens, on currency.
[00:50] The famous slogan reads: Big Brother Is Watching You. And he is. Telescreens in every home and public space broadcast party propaganda and monitor citizens simultaneously. Privacy does not exist.
[01:05] Our protagonist is Winston Smith, a thirty-nine-year-old who works at the Ministry of Truth. His job is to rewrite historical documents to match the party''s current version of the truth. If the party says it rained on a certain day, Winston changes the weather records to say it rained.
[01:23] Winston is one of the rare people who still thinks for himself. He secretly hates the party, and he starts keeping a diary, which is a criminal act. Thinking independent thoughts — what the party calls thoughtcrime — is punishable by death.
[01:40] Winston begins a forbidden love affair with Julia, a young woman who works in the Fiction Department. Their relationship is an act of rebellion because the party controls sexuality and channels all passion into hatred of enemies and love of Big Brother.
[01:58] They meet in secret in an apartment above Mr. Charrington''s shop, and for a while, Winston believes he has found a space where the party cannot reach him. He believes that as long as two people love each other, they have something the party cannot take away.
[02:15] But he is wrong. Mr. Charrington turns out to be a member of the Thought Police, and the telescreen hidden behind the picture of Big Brother has been watching them the whole time.
[02:30] Winston and Julia are arrested and taken to the Ministry of Love, where they are tortured and brainwashed separately. Winston''s torturer is O''Brien, a high-ranking party member whom Winston mistakenly believed was a fellow rebel.
[02:48] The most terrifying part of the book is Room 101, where each prisoner faces their worst fear. For Winston, it''s rats. And in that moment of absolute terror, he betrays Julia — he screams, Do it to her, not me.
[03:05] This betrayal is the final destruction of his inner self. After that, there is nothing left to break. Winston is released back into society, completely rewritten, and the final line of the book is one of the saddest in literature: He loved Big Brother.
[03:22] Orwell invents concepts in this book that have entered our everyday language. Newspeak — a language designed to reduce the range of thought by eliminating words. Doublethink — the ability to hold two contradictory beliefs at once.
[03:38] The concept of the memory hole, where documents are destroyed and then forgotten, is incredibly prescient. And the idea that whoever controls the past controls the future, and whoever controls the present controls the past — this is the core of Orwell''s warning.
[03:55] Orwell was a democratic socialist who had seen totalitarianism firsthand in Spain during the Civil War and in the Soviet Union. He understood that the greatest threat to freedom is not just physical oppression, but the manipulation of truth itself.
[04:12] When he wrote 1984, surveillance technology was primitive. Today, we carry tracking devices in our pockets, our conversations are recorded by corporations, and deepfakes make it impossible to trust what we see.
[04:28] The book is a call to vigilance. Orwell wants us to value truth, to protect independent thought, and to recognize the signs of authoritarianism before it''s too late.
[04:42] I think every adult should read 1984. It''s not just a novel — it''s a manual for understanding how power corrupts language, how language corrupts thought, and how thought corrupts reality. Thank you for listening!',
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
