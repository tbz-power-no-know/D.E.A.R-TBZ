-- D.E.A.R. Podcast-Website — Seed-Daten
-- Nach supabase-schema.sql ausführen
-- Platzhalter-URLs durch echte Supabase Storage-URLs ersetzen

-- =====================================================
-- KATEGORIEN
-- =====================================================

INSERT INTO categories (name, color) VALUES
  ('Krimi', '#8b0000'),
  ('Fantasy', '#4b0082'),
  ('Sachbuch', '#00695c'),
  ('Biografie', '#1a237e'),
  ('Klassiker', '#4e342e'),
  ('Young Adult', '#e64a19'),
  ('Science Fiction', '#0d47a1'),
  ('Romantik', '#880e4f');

-- =====================================================
-- PRÄSENTATOREN
-- =====================================================

INSERT INTO presenters (name, photo_url, bio) VALUES
  ('Anna Müller', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Schülerin in der Klasse 3B, liebt Krimis und klassische Literatur.'),
  ('Lukas Schneider', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Schüler in der Klasse 3A, begeistert von Science Fiction und Fantasy.'),
  ('Sara Fischer', 'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/presenter-photos/lpp.png', 'Schülerin in der Klasse 3C, interessiert sich für Biografien und Sachbücher.');

-- =====================================================
-- PODCASTS
-- =====================================================

-- Krimi
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Die Hund von Baskerville',
    'Ein klassischer Sherlock-Holmes-Krimi im unheimlichen Dartmoor. Anna erforscht die Legende vom übernatürlichen Hund und Holmes'' brillante Deduktion.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, willkommen zu meiner Buchpräsentation für das D.E.A.R.-Projekt. Heute möchte ich über Die Hund von Baskerville von Arthur Conan Doyle sprechen.
[00:18] Dies ist wahrscheinlich der berühmteste Sherlock-Holmes-Roman, und das aus gutem Grund. Er erschien 1902 und ist der vierte von fünf Romanen mit Holmes und seinem treuen Freund Dr. Watson.
[00:38] Die Geschichte beginnt mit einem Brief, den Dr. Watson von Sir Henry Baskerville erhält, einem jungen Mann, der gerade das Anwesen der Baskervilles in Devonshire geerbt hat. Der Brief warnt ihn vor einem Familienfluch, der einen monströsen Hund beinhaltet.
[00:58] Was dieses Buch so besonders macht, ist die Kulisse. Dartmoor ist nicht nur ein Hintergrund — es ist fast ein Charakter für sich. Der Nebel, die Moore, die isolierten Häuser auf der Heide, alles erzeugt diese unglaubliche Atmosphäre der Angst und des Geheimnisvollen.
[01:20] Die Legende reicht Generationen zurück. Ein Mann namens Hugo Baskerville soll nach einer Nacht des Lasters von einem riesigen Hund getötet worden sein. Und jetzt ist Sir Charles Baskerville, der vorherige Besitzer des Anwesens, unter mysteriösen Umständen gestorben.
[01:40] Holmes wird zur Untersuchung gerufen, statt selbst hinzugehen, schickt er Watson nach Baskerville Hall, während er in London bleibt. Das ist eine brillante narrative Entscheidung von Doyle, denn so erleben wir das Geheimnis zuerst durch Watsons Augen.
[02:00] Während Watson die Heide erforscht und mit den Einwohnern spricht, passieren seltsame Dinge. Eine gespenstische Gestalt wird nachts auf der Heide gesehen. Jemand verfolgt Sir Henry. Und es gibt diese schrecklichen Geheulgeräusche, die über die Moore widerhallen.
[02:20] Das Geniale an diesem Roman ist, dass Doyle uns so viele mögliche Erklärungen gibt. Ist es wirklich ein übernatürlicher Hund? Ist es ein krimineller Plan? Oder ist es etwas ganz anderes? Jedes Kapitel fügt neue Hinweise und neue rote Fäden hinzu.
[02:40] Als Holmes endlich auf der Heide eintrifft, enthüllt er, dass er schon die ganze Zeit von London aus ermittelt hat. Seine Methode der Deduktion ist absolut faszinierend — er setzt die Wahrheit aus den kleinsten Details zusammen.
[03:00] Der Höhepunkt spielt nachts auf der Heide und ist eine der spannendsten Szenen in der gesamten Literatur. Der Nebel ist so dicht, dass man kaum etwas sieht, und dann erscheint der Hund — ein echter Hund, aber mit Phosphor bedeckt, um übernatürlich zu wirken.
[03:20] Am Ende stellt sich heraus, dass der Bösewicht Stapleton ist, ein Mitglied der Familie Baskerville, das das Anwesen erben wollte. Er nutzte die Legende vom Hund, um Menschen zu erschrecken und seine Morde zu begehen.
[03:40] Was mir am meisten an diesem Buch gefallen hat, ist, wie Doyle das Übernatürliche mit dem Rationalen ausbalanciert. Die Geschichte lässt einen an das Unmögliche glauben, aber dann bringt Holmes immer die Vernunft zurück. Es ist ein perfekter Krimi.
[04:00] Ich würde dieses Buch jedem wärmstens empfehlen, der einen guten Krimi liebt. Es ist nicht zu lang, das Tempo ist ausgezeichnet und die Atmosphäre ist unvergesslich. Danke fürs Zuhören!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Krimi')
  );

-- Fantasy
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Der Hobbit',
    'Lukas präsentiert J.R.R. Tolkiens geliebte Geschichte von Bilbo Beutlins unerwarteter Reise mit einer Gruppe von Zwergen. Diese Geschichte ist mehr als nur ein Abenteuer — sie ist eine der einflussreichsten Fantasy-Erzählungen, die je geschrieben wurden, und hat das Genre für immer definiert. Tolkien begann 1937 damit, seine Welt zu erschaffen, und Der Hobbit war der erste Schritt in das, was später zum Herr-der-Ringe-Zyklus werden sollte. Die Geschichte beginnt in der Graunschur, wo Bilbo Beutlin ein ruhiges, komfortables Leben führt, fernab von jedem Abenteuer. Doch als der Zauberer Gandalf mit dreizehn Zwergen erscheint, die ihre Heimat vom Drachen Smaug zurückerobern wollen, wird Bilbos Welt für immer verändert. Auf der Reise trifft Bilbo auf Trolle, Orks, Elben, Drachen und einen mysteriösen Ring, der sein Schicksal und das Schicksal von Mittelerde selbst für immer verändern wird. Tolkien erschafft eine Welt von beispielloser Tiefe, in der jeder Ort, jeder Charakter und jedes Ereignis miteinander verbunden ist. Die Landschaften — von den Nebelbergen über Mirkwood bis hin zum Einstenberg — sind so detailliert beschrieben, dass man sie fast berühren kann. Die Figuren sind ebenso lebendig: Thorin Eichenherz mit seinem Stolz und seiner Gier, Gandalf mit seiner Weisheit und seinen geheimen Plänen, und natürlich Bilbo selbst, der von einem ängstlichen Hausierer zu einem mutigen Abenteurer wird. Das Buch lehrt uns, dass Größe nicht von der körperlichen Größe abhängt, sondern vom Mut, dem man im Angesicht der Dunkelheit zeigt. Bilbo beweist, dass selbst der kleinste Hobbit den Lauf der Geschichte verändern kann. Tolkiens Sprache ist wunderschön, seine Dialoge sind charmant und seine Abenteuer sind mit einer Mischung aus Humor und Spannung erzählt, die das Buch zu einer Lektüre macht, die man nie vergessen wird. Der Hobbit ist nicht nur eine Geschichte für Kinder — es ist ein Meisterwerk der Weltliteratur, das Leser jeden Alters in seinen Bann zieht und sie dazu einlädt, die Wunder der Fantasie zu entdecken.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, heute spreche ich über Der Hobbit von J.R.R. Tolkien. Dies ist eines der berühmtesten Fantasy-Bücher, die je geschrieben wurden, und es hat das Genre für immer verändert.
[00:18] Das Buch erschien 1937, lange vor Der Herr der Ringe, und war ursprünglich als Kindergeschichte geschrieben. Ehrlich gesagt ist es aber ein Buch, das Menschen jeden Alters genießen können.
[00:36] Die Geschichte beginnt auf die unerwartetste Weise. Wir treffen Bilbo Beutlin, einen Hobbit, der in einem gemütlichen Loch im Boden in der Graunschur lebt. Er mag ruhige Abende, gutes Essen und keine Abenteuer. Er ist die letzte Person, von der man erwarten würde, dass sie sich auf eine Quest macht.
[00:55] Aber eines Tages erscheint der Zauberer Gandalf an seiner Tür mit einer Gruppe von dreizehn Zwergen unter der Führung von Thorin Eichenherz. Sie brauchen einen Einbrecher für ihre Mission, und Gandalf denkt, Bilbo ist die perfekte Wahl.
[01:13] Die Zwerge wollen ihre Heimat, den Einstenberg, vom Drachen Smaug zurückerobern. Es ist eine riesige Aufgabe und Bilbo ist anfangs erschrocken. Er will sein gemütliches Zuhause nicht verlassen. Aber etwas in ihm sehnt sich nach Abenteuer und so beginnt die Reise.
[01:32] Einer meiner Lieblingsteile des Buches ist, wenn Bilbo sich von den Zwergen trennt und sich selbst vor drei Trollen retten muss. Er lernt, resourceful und clever zu sein, und das ist der Beginn seiner Verwandlung von einem ängstlichen Hobbit zu einem tapferen Abenteurer.
[01:50] Dann gibt es die Szene in den Nebelbergen mit den Orks und die Flucht durch die Höhlen. Und natürlich die Begegnung mit dem Sméagol in den dunklen unterirdischen Tunneln. Das Ratespiel zwischen Bilbo und dem Sméagol ist eine der berühmtesten Szenen in der Fantasy-Literatur.
[02:10] Während dieser Begegnung findet Bilbo einen Ring, der ihn unsichtbar macht. Zu diesem Zeitpunkt plante Tolkien wahrscheinlich nicht, dass dieser Ring zum zentralen Objekt von Der Herr der Ringe wird, aber am Ende ist es die wichtigste Entdeckung in ganz Mittelerde.
[02:28] Die Reise geht durch die Wälder von Mirkwood weiter, wo die Zwerge von Elben gefangen werden und Bilbo einen Weg finden muss, sie mit Fässern zu befreien. Es ist lustig und clever und zeigt, wie viel tapferer Bilbo geworden ist.
[02:46] Als sie endlich den Einstenberg erreichen, muss Bilbo den Drachen Smaug gegenüberstehen. Das ist eine unglaubliche Szene, denn Bilbo ist nur ein kleiner Hobbit, der mit der mächtigsten Kreatur in der Region spricht. Und er tut es mit Witz und Mut.
[03:05] Smaug ist ein so gut geschriebener Bösewicht. Er ist intelligent, arrogant und gefährlich. Das Gespräch zwischen Bilbo und Smaug ist wie eine psychologische Schlacht und Bilbo schafft es, ihn auszutricksen.
[03:23] Aber die Geschichte endet damit noch nicht. Smaugs Niederlage führt zu einem Konflikt zwischen den Zwergen, den Elben und den Menschen von Esgaroth. Gier übernimmt die Kontrolle und Thorin wird von dem Fluch des Arkensteins betroffen.
[03:40] Am Ende findet die Fünf-Heere-Schlacht statt und Bilbo spielt eine entscheidende Rolle dabei, alle zu retten. Er kehrt in die Graunschur zurück — verändert, weiser, tapferer und reicher. Er ist nicht mehr nur ein einfacher Hobbit, der ruhige Abende mag.
[03:58] Was ich am meisten an Der Hobbit liebe, ist das Gefühl der Wunder. Tolkien erschafft eine Welt, die sich komplett real anfühlt, mit ihrer eigenen Geschichte, Sprachen und Kulturen. Jeder Ort, den man auf der Reise besucht, fühlt sich einzigartig und lebendig an.
[04:15] Das Buch lehrt uns auch, dass selbst der kleinste Mensch den Lauf der Zukunft verändern kann. Bilbo beweist, dass Mut nicht davon abhängt, groß und stark zu sein — es geht darum, das Richtige zu tun, auch wenn man Angst hat.
[04:32] Ich denke, jeder sollte Der Hobbit mindestens einmal lesen. Es ist eine schöne Geschichte über Freundschaft, Mut und die Erkenntnis, wer man wirklich ist. Danke fürs Zuhören!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Fantasy')
  );

-- Sachbuch
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Sapiens: Eine kurze Geschichte der Menschheit',
    'Sara fasst Yuval Noah Hararis Erforschung der Menschheitsgeschichte von der Steinzeit bis in die moderne Welt zusammen.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo, heute präsentiere ich Sapiens: Eine kurze Geschichte der Menschheit von Yuval Noah Harari. Das ist nicht dein typisches Geschichtsbuch und es hat komplett verändert, wie ich über unsere Spezies denke.
[00:20] Harari ist ein israelischer Historiker und dieses Buch wurde zuerst 2011 auf Hebräisch veröffentlicht. Es wurde ein massiver Bestseller weltweit und ist in mehr als sechzig Sprachen übersetzt worden.
[00:38] Das Buch ist in vier Hauptteile unterteilt, die jeweils eine große Revolution in der Menschheitsgeschichte abdecken: Die kognitive Revolution, die landwirtschaftliche Revolution, die Vereinigung der Menschheit und die wissenschaftliche Revolution.
[00:56] Die kognitive Revolution geschah vor etwa siebzigtausend Jahren und Harari argumentiert, dass dies der Moment war, in dem Homo sapiens die Fähigkeit entwickelte, Dinge zu erschaffen und zu glauben, die nicht physisch existieren.
[01:14] Dinge wie Götter, Nationen, Geld und Menschenrechte — das sind das, was Harari fiktive Realitäten nennt. Sie existieren nur, weil wir alle übereinstimmen, dass sie existieren. Und diese Fähigkeit, in großen Gruppen auf der Basis geteilter Überzeugungen zusammenzuarbeiten, hat uns zur dominierenden Spezies auf der Erde gemacht.
[01:33] Die landwirtschaftliche Revolution, die vor etwa zwölftausend Jahren begann, ist der Ort, an dem Harari ein wirklich provokantes Argument macht. Er nennt es den größten Betrug in der Geschichte.
[01:48] Er argumentiert, dass die Landwirtschaft das Leben für die meisten Menschen nicht besser gemacht hat. Bauern arbeiteten härter, aßen eine weniger abwechslungsreiche Ernährung und waren anfälliger für Krankheiten. Aber die Bevölkerung wuchs enorm, also war es aus der Sicht der Spezies ein Erfolg.
[02:06] Diese Idee hat mich wirklich zum Nachdenken gebracht. Wir nehmen normalerweise an, dass Fortschritt immer Verbesserung bedeutet, aber Harari hinterfragt diese Annahme ständig.
[02:18] Der dritte Teil des Buches behandelt, wie die Welt vereint wurde. Harari identifiziert drei universale Ordnungen, die sich nie aufhören zu expandieren: Imperien, Religion und Geld.
[02:33] Imperien erobern und assimilieren. Religionen schaffen geteilte Glaubenssysteme über Kulturen hinweg. Und Geld — Geld ist das erfolgreichste System des gegenseitigen Vertrauens, das je zwischen Fremden geschaffen wurde.
[02:48] Harari erklärt, wie Geld funktioniert, weil alle daran glauben, nicht weil es intrinsischen Wert hat. Das ist eine faszinierende Art, über Wirtschaft und das Funktionieren von Gesellschaften nachzudenken.
[03:03] Der letzte Teil deckt die wissenschaftliche Revolution ab, die vor etwa fünfhundert Jahren begann. Harari argumentiert, dass die Wissenschaft erfolgreich war, weil die Europäer ihre Unwissenheit zugaben.
[03:18] Davor glaubten die meisten Zivilisationen, dass alle wichtigen Kenntnisse bereits in alten Texten existierten. Aber die wissenschaftliche Denkweise sagt, dass wir nicht alles wissen und wir mehr durch Beobachtung und Experiment lernen können.
[03:35] Das führte zu einem beispiellosen Anstieg an Wissen und Macht. Kombiniert mit Imperium und Kapitalismus schuf es die moderne Welt, in der wir heute leben.
[03:48] Eines der nachdenklichst stimmenden Kapitel handelt von Glück. Harari fragt, ob wir glücklicher sind als unsere Vorfahren, die vor zehntausenden von Jahren als Jäger und Sammler lebten.
[04:03] Er argumentiert, dass Glück mehr mit unseren Erwartungen zu tun hat als mit unseren tatsächlichen Umständen. Je höher unsere Erwartungen steigen, desto mehr brauchen wir, um uns zufrieden zu fühlen.
[04:18] Das Buch endet mit einer Diskussion darüber, wohin wir vielleicht unterwegs sind. Mit Biotechnologie und künstlicher Intelligenz könnte Homo sapiens kurz davor stehen, sich in eine völlig andere Spezies zu entwickeln.
[04:35] Harari stellt ernsthafte Fragen darüber, was es bedeutet, menschlich zu sein, und ob wir uns unserer eigenen technologischen Macht fürchten sollten.
[04:48] Ich fand dieses Buch absolut genial. Es ist nicht nur ein Geschichtsbuch — es ist eine philosophische Erforschung dessen, was uns zu dem macht, was wir sind. Ich empfehle es wärmstens jedem, der das große Ganze der Menschheitsgeschichte verstehen möchte. Danke!',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Sachbuch')
  );

-- Biografie
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Steve Jobs',
    'Anna präsentiert Walter Isaacsons Biografie des Apple-Mitgründers und begleitet sein Leben von der Adoption bis zur Revolutionierung der Technologie.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, heute präsentiere ich die Biografie von Steve Jobs von Walter Isaacson. Dieses Buch wurde 2011 veröffentlicht, ein Jahr nach Jobs'' Tod, und basiert auf mehr als vierzig Interviews mit Jobs selbst.
[00:22] Isaacson sprach auch mit mehr als hundert Familienmitgliedern, Freunden, Konkurrenten und Kollegen, so dass das Porträt unglaublich detailliert und ehrlich ist.
[00:38] Steve Jobs wurde 1955 geboren und von Paul und Clara Jobs adoptiert. Seine leibliche Mutter war eine junge unverheiratete Studentin, die wollte, dass er aufs College geht, aber die Adoptiveltern waren nur High-School-Absolventen.
[00:55] Von klein auf war Steve neugierig und intensiv. Er liebte es, Dinge auseinanderzunehmen, um zu sehen, wie sie funktionierten. Sein Vater lehrte ihn Tischlerei in ihrer Garage und Steve lernte die Wichtigkeit, die Rückseite eines Schrankes genauso schön zu gestalten wie die Vorderseite, auch wenn niemand sie jemals sehen würde.
[01:15] Diese Liebe zum Detail würde zu einem prägenden Merkmal von allem werden, was er bei Apple tat.
[01:23] Nach dem Abbruch am Reed College besuchte Jobs ein Jahr lang Kurse, darunter einen Kalligraphie-Kurs, der damals völlig nutzlos erschien. Aber zehn Jahre später, als er den Macintosh entwarf, inspirierte dieses Kalligraphie-Wissen die wunderschöne Typografie, die zu einem Markenzeichen von Apple-Computern wurde.
[01:43] Jobs reiste nach Indien auf der Suche nach spiritueller Erleuchtung, wo er den Zen-Buddhismus erforschte. Dieser Einfluss zeigte sich in seiner Designphilosophie — Einfachheit, Minimalismus und die Idee, dass Technologie sich fast spirituell in ihrer Eleganz anfühlen sollte.
[02:02] 1976, im Alter von einundzwanzig Jahren, gründeten Jobs und sein Freund Steve Wozniak Apple in der Garage der Familie Jobs. Der Apple I war eine Leiterplatte, aber der Apple II wurde der erste massenproduzierte Personalcomputer und machte sie in ihren Zwanzigern zu Millionären.
[02:22] Aber Erfolg veränderte Jobs. Er wurde fordernder, intensiver und manchmal unmöglich in der Zusammenarbeit. Als Apple einen professionellen CEO, John Sculley, anheuerte, verlor Jobs schließlich einen Machtkampf und wurde 1985 aus dem Unternehmen, das er gründete, geworfen.
[02:40] Das war ein verheerender Moment für ihn, aber später sagte er, es sei das Beste gewesen, was passieren konnte. Entlassen zu werden, befreite ihn, wieder kreativ zu sein. Er gründete NeXT, ein Computerunternehmen, und kaufte eine kleine Grafikabteilung von Lucasfilm, die zu Pixar wurde.
[03:00] Pixar schuf Toy Story, den ersten vollständig computergenerierten Animationsfilm, und wurde zu einem der erfolgreichsten Animationsstudios der Geschichte.
[03:12] Inzwischen kämpfte Apple und 1997 erwarb sie NeXT, was Jobs zurück in das Unternehmen brachte, das er gegründet hatte. Was als Nächstes passierte, ist fast wie ein Märchen.
[03:25] Jobs strich Apples Produktlinie ein, konzentrierte sich auf Design und Benutzererfahrung und startete eine Reihe von Produkten, die die Welt veränderten. Der iMac 1998, der iPod 2001, das iPhone 2007 und das iPad 2010.
[03:43] Jedes dieser Produkte verbesserte nicht nur das, was existierte — sie schufen völlig neue Kategorien. Das iPhone machte nicht nur ein besseres Telefon; es erfand das, was ein Telefon sein kann, neu.
[03:58] Isaacson geht nicht an Jobs'' Schwächen vorbei. Er war bekannt für sein Realitätsverzerrungsfeld — seine Fähigkeit, Menschen davon zu überzeugen, dass das Unmögliche möglich war. Aber er konnte auch grausam, ungeduldig und emotional nicht verfügbar sein.
[04:15] Er weigerte sich anfangs, seine Tochter Lisa anzuerkennen, und seine Beziehung zu seinen Kindern war kompliziert. Das Buch zeigt, dass Genie und emotionale Intelligenz nicht immer Hand in Hand gehen.
[04:30] Als Jobs 2003 mit Bauchspeicheldrüsenkrebs diagnostiziert wurde, verzögerte er die Behandlung um neun Monate in der Hoffnung, dass alternative Therapien funktionieren würden. Diese Entscheidung kostete ihn kostbare Zeit und er starb ultimately 2011 im Alter von sechsundfünfzig Jahren.
[04:48] Was ich an diesem Buch am meisten inspirierend fand, ist Jobs'' unerbittliche Suche nach Exzellenz. Er hatte diesen Glauben, dass Technologie allein nicht genug ist — sie muss mit den Geisteswissenschaften, mit Design und mit einem Verständnis dafür verbunden werden, was Menschen glücklich macht.
[05:05] Sein berühmtes Zitat Bleib hungrig, bleib naiv fängt seinen Geist wirklich ein. Er hörte nie auf zu hinterfragen, nie auf, Dinge besser machen zu wollen, und dieser Antrieb veränderte die Welt. Danke fürs Zuhören!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Biografie')
  );

-- Klassiker
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Stolz und Vorurteil',
    'Sara diskutiert Jane Austens zeitlosen Roman über Elizabeth Bennet und Mr. Darcy und erforscht Themen wie Liebe, Klasse und Ruf.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, heute spreche ich über Stolz und Vorurteil von Jane Austen. Dieser Roman wurde 1813 veröffentlicht und gilt weithin als eines der größten Werke der englischen Literatur.
[00:20] Die berühmte eröffnende Zeile — Es ist eine allgemein bekannte Wahrheit, dass ein einzelner Mann im Besitz eines guten Vermögens unbedingt eine Frau sucht — ist einer der am besten erkennbaren Sätze in der gesamten Literatur.
[00:38] Austen nutzt Ironie von der allerersten Zeile an, denn eigentlich ist es nicht der wohlhabende Junggeselle, der eine Frau will — es sind die Mütter unverheirateter Töchter, die verzweifelt versuchen, ihm eine zu finden.
[00:55] Die Geschichte folgt fünf Schwestern — Jane, Elizabeth, Mary, Kitty und Lydia Bennet — deren Mutter entschlossen ist, sie an wohlhabende Männer zu verheiraten. Im England der Regency-Zeit hatten Frauen sehr wenige Optionen für finanzielle Unabhängigkeit, also war Heirat im Wesentlichen eine Notwendigkeit.
[01:15] Elizabeth Bennet, die zweite Tochter, ist die Protagonistin und sie ist eine der am meisten geliebten Figuren in der Literatur. Sie ist intelligent, witzig, unabhängig und hat starke Meinungen über alles.
[01:32] Die zentrale Beziehung ist zwischen Elizabeth und Mr. Darcy, einem wohlhabenden und stolzen Gentleman, der einen lokalen Ball besucht. Zuerst weigert sich Darcy, mit Elizabeth zu tanzen, weil sie seinen Schönheitsstandards nicht entspricht, und Elizabeth ist sofort von seiner Arroganz beleidigt.
[01:50] Das setzt den Titel des Buches perfekt in Szene — Darcys Stolz und Elizabeths Vorurteil gegeneinander schaffen eine Mauer, die beide überwinden müssen.
[02:05] Aber dann tut Darcy etwas Unerwartetes. Trotz seiner Abneigung gegen Elizabeths Familie verliebt er sich tief in sie und macht ihr einen Heiratsantrag. Das Problem ist, dass er auf die schlimmstmögliche Weise anhält — indem er ihr erinnert, dass sie ihm sozial unterlegen ist.
[02:23] Elizabeth lehnt ihn heftig ab und listet in ihrer Absage all seine Fehler auf. Diese Konfrontation ist eine der kraftvollsten Szenen im Buch, denn beide Charaktere sind gezwungen, sich zum ersten Mal ehrlich zu sehen.
[02:40] Während die Geschichte fortschreitet, verändern sich sowohl Elizabeth als auch Darcy. Darcy wird bescheidener und großzügiger und Elizabeth erkennt, dass ihre ersten Eindrücke falsch waren. Sie lernt, dass Vorurteil uns die Wahrheit über andere Menschen verbergen kann.
[02:58] Es gibt auch wunderbare Nebencharaktere. Mr. Bennet ist witzig aber distanziert. Mrs. Bennet ist eine Karikatur einer nervösen, heiratsvermittelnden Mutter. Und Mr. Collins, der lächerliche Cousin, der das Familienanwesen erbt, ist eine der lustigsten Figuren, die Austen je geschrieben hat.
[03:18] Der Charakter von George Wickham fügt eine wichtige Wendung hinzu. Er scheint anfangs charmant, stellt sich aber als manipulativer Schurke heraus, der versucht, mit der jüngsten Bennet-Schwester, Lydia, zu elopieren, was den Ruf der gesamten Familie ruinieren würde.
[03:35] Es stellt sich heraus, dass Darcy heimlich eingreift, um die Familie zu retten, Wickehms Schulden bezahlt und die Heirat arrangiert. Elizabeth entdeckt diese Tat der Güte und es verwandelt ihre Gefühle gegenüber ihm komplett.
[03:52] Was Stolz und Vorurteil so zeitlos macht, ist, dass es nicht nur eine Romanze ist. Es ist ein scharfer sozialer Kommentar über Klasse, Geld, Geschlecht und Heirat im frühen neunzehnten Jahrhundert in England.
[04:10] Austen schrieb zu einer Zeit, als Frauen fast keine Rechtsrechte hatten und ihr Wert an ihrer Heiratsfähigkeit gemessen wurde. Sie erschafft eine Heldin, die sich nicht zufriedengeben will — Elizabeth lehnt zwei Heiratsanträge ab, bevor sie den annimmt, den sie wirklich will.
[04:28] Die Prosa ist wunderschön, der Dialog sprüht und der Humor ist nach zweihundert Jahren immer noch lustig. Jedes Mal, wenn ich es lese, merke ich etwas Neues.
[04:42] Ich denke, dieses Buch ist unverzichtbare Lektüre. Es lehrt uns über die Gefahren, Menschen zu schnell zu urteilen, und über die Wichtigkeit, bereit zu sein, seine Meinung zu ändern. Danke fürs Zuhören!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Klassiker')
  );

-- Young Adult
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Die Schuld liegt nicht an den Sternen',
    'Lukas präsentiert John Greens emotionale Geschichte von zwei Teenagern, die sich verlieben, während sie mit Krebs umgehen.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hey zusammen, heute möchte ich über Die Schuld liegt nicht an den Sternen von John Green sprechen. Dieses Buch wurde 2012 veröffentlicht und wurde zu einem der meistverkauften Young-Adult-Romane aller Zeiten.
[00:20] Ich muss euch warnen — dieses Buch wird euch zum Weinen bringen. Aber es ist nicht nur ein trauriges Buch. Es ist lustig, klug und eine der ehrlichsten Darstellungen des Teenagerlebens, die ich je gelesen habe.
[00:38] Die Protagonistin ist Hazel Grace Lancaster, ein sechzehnjähriges Mädchen, das seit zweieinhalb Jahren an Schilddrüsenkrebs überlebt. Sie nimmt ein Medikament namens Murine, das den Krebs in Schach hält, aber ihre Nieren und Lungen schädigt.
[00:56] Hazel besucht eine Krebs-Selbsthilfegruppe, die sie größtenteils sinnlos findet, bis sie Augustus Waters trifft. Gus ist charmant, selbstbewusst und auch Krebsüberlebender — er hatte sein Bein unter dem Knie amputiert.
[01:13] Ihr erstes Gespräch beginnt damit, dass Hazel im Selbsthilfegruppen Guss Lieblingsbuch vorliest und er bittet sie, es fertigzustellen, weil der Autor am Ende feststeckt. Das wird zum Faden, der ihre gesamte Beziehung verbindet.
[01:28] Was ich an John Greens Schreibweise liebe, ist, dass Hazel und Gus sich wie echte Teenager anfühlen, keine Stereotype. Sie sprechen über Bücher, streiten sich über Filme, haben peinliche Momente und bringen einander zum Lachen.
[01:45] Als Hazel und Gus sich verlieben, machen sich ihre Eltern Sorgen. Sie wissen, dass Liebe bedeutet, etwas zu verlieren zu haben. Aber Hazel hat diese kraftvolle Idee, dass sie keine Bombe, kein Bombardement, kein Bombenkrater sein will. Sie will einfach ein Mädchen sein, das sich verliebt.
[02:05] Das Buch begleitet Hazel und Gus auf einer Reise nach Amsterdam, um den Autor von Hazels Lieblingsbuch, Peter van Houten, zu treffen. Diese Reise ist sowohl lustig als auch herzerweichend und zwingt beide, sich mit Fragen nach Sinn und Sterblichkeit auseinanderzusetzen.
[02:23] Van Houten erweist sich als ein verbitterter, trunksüchtiger Einsiedler, der den Glauben an die Kraft von Geschichten verloren hat. Das schafft einen interessanten Kontrast zu Hazel, die tief an die Bedeutung glaubt, die Geschichten unserem Leben geben.
[02:38] Eine der kraftvollsten Zeilen im Buch ist, wenn Hazel sagt, ihr Lieblingsteil einer Geschichte ist der erste Satz des letzten Kapitels — der Moment, in dem man weiß, dass es vorbei ist, aber trotzdem weiterliest.
[02:55] Das Buch gibt uns keine einfachen Antworten über Tod und Leid. Hazel muss der Realität ins Auge sehen, dass Guss Krebs zurück ist, und das Ende ist eines der verheerendsten in der modernen Fiktion.
[03:12] Aber hier ist die Sache — das Buch geht eigentlich nicht um Krebs. Krebs ist nur der Hintergrund. Die eigentliche Geschichte handelt von zwei Kindern, die einander finden und einanders Leben unendlich besser machen, auch wenn es nur für eine kurze Zeit ist.
[03:30] Gus schreibt Hazel einen Brief, den sie am Ende des Buches liest, und er fängt alles ein, was ihre Liebe so besonders macht. Er sagt, dass er sich in ihren Verstand, ihr Herz und ja, ihren Körper verliebt hat, aber vor allem in ihren Verstand.
[03:48] Der Titel stammt von einer Zeile aus van Houtens fiktivem Buch — Es war nicht die Schuld der Sterne, dass wir litten. Green sagt damit, dass Leiden zufällig und unfair ist, aber das bedeutet nicht, dass unser Leben nichts bedeutet.
[04:05] Ich denke, dieses Buch ist wichtig, weil es zeigt, dass Teenager mit Krebs immer noch Teenager sind. Sie verlieben sich immer noch, sie wollen immer noch reisen, sie interessieren sich immer noch für Bücher, Filme und Bedeutung.
[04:20] Es lehrt uns auch, dass das Maß eines Lebens nicht davon abhängt, wie lange es dauert, sondern wie tief man liebt und wie viel man liebt. Hazel und Gus haben ein kleines Leben, aber es ist ein breites.
[04:35] Wenn du dieses Buch noch nicht gelesen hast, ermutige dich wirklich, es aufzuschlagen. Bring Taschentücher mit, aber lies es trotzdem. Danke fürs Zuhören!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Young Adult')
  );

-- Science Fiction
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Dune',
    'Lukas erforscht Frank Herberts episches Science-Fiction-Meisterwerk über Politik, Religion und Überleben auf dem Wüstenplaneten Arrakis.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Willkommen zu meiner Präsentation von Dune von Frank Herbert. Dieses Buch wurde 1965 veröffentlicht und bleibt der einzige Science-Fiction-Roman, der den Hugo Award, den Nebula Award und einen speziellen Edgar Award gewonnen hat.
[00:20] Es wird oft als der größte Science-Fiction-Roman aller Zeiten bezeichnet und ich denke, nach dem Lesen versteht man, warum.
[00:32] Die Geschichte spielt weit in der Zukunft, in einem interstellarischen Imperium, in dem die Menschheit viele Planeten kolonisiert hat, aber die Fähigkeit verloren hat, denkende Maschinen zu erschaffen. Alle Berechnungen werden von menschlichen Mentalisten durchgeführt, die von der Mentat-Ordnung ausgebildet werden.
[00:50] Die zentrale Kulisse ist Arrakis, auch bekannt als Dune, die einzige Quelle für die wertvollste Substanz im Universum — das Gewürz Melange. Das Gewürz verlängert das Leben, verbessert das Bewusstsein und ist für den Weltraumflug unerlässlich.
[01:08] Das adelige Haus Atreides hat vom Kaiser die Kontrolle über Arrakis erhalten und ersetzt das verräterische Haus Harkonnen. Paul Atreides, der junge Erbe, und seine Mutter Lady Jessica, eine Bene-Gesserit-Schwester, kommen auf dem Wüstenplaneten an.
[01:25] Von Anfang an baut Herbert unglaubliche Spannung auf. Die Atreides werden verraten, Herzog Leto wird getötet und Paul und Jessica müssen in die Wüste fliehen, um zu überleben. Hier beginnt Pauls echte Ausbildung.
[01:43] Paul wird von den Fremen aufgenommen, den einheimischen Menschen von Arrakis, die sich über Generationen an die harsche Wüstenwelt angepasst haben. Sie tragen Stillsuits, die jeden Tropfen Feuchtigkeit recyceln, und sehen sich als die wahren Herren von Dune.
[02:00] Was Dune so einzigartig macht, ist, dass es nicht nur um Weltraumschlachten und Laserpistolen geht. Es geht um Ökologie, Politik, Religion und die Gefahr charismatischer Führer. Herbert machte sich große Sorgen darüber, wie leicht Menschen von messianischen Figuren manipuliert werden können.
[02:18] Paul hat vorsichtige Visionen — er kann mögliche Zukünfte sehen — und er erkennt, dass, wenn er die Fremen in einem Dschihad anführt, sich dieser über das ganze Universum ausbreiten wird. Das Beunruhigende ist, dass er diese Zukunft sehen kann, aber sie nicht aufhalten kann.
[02:38] Die Bene-Gesserit-Schwesterorden manipuliert seit Jahrhunderten Zuchtprogramme im gesamten Galaxie, um den Kwisatz Haderach zu erschaffen — ein Wesen, das die Grenzen von Zeit und Raum überwinden kann. Paul stellt sich als genau dieses Wesen heraus.
[02:55] Lady Jessica ist eine faszinierende Figur. Sie brach die Regeln der Bene Gesserit, indem sie einen Sohn statt einer Tochter mit Herzog Leto bekam, und diese einzelne Entscheidung setzt alles in Bewegung. Sie ist mächtig, intelligent und tief zerissen.
[03:12] Die Ökologie von Arrakis ist eine der detailliertesten Weltbauleistungen in der Fiktion. Herbert, der ein Umweltschützer war, nutzt den Wüstenplaneten, um Themen wie Ressourcenknappheit, Umweltanpassung und die Beziehung zwischen Menschen und ihrer Umwelt zu erforschen.
[03:30] Die Wasserdisziplin der Fremen — ihre Fähigkeit, in der unwirtlichsten Umgebung zu überleben — wird mit unglaublichen Details dargestellt. Jeder Tropfen Wasser ist heilig und das prägt ihre gesamte Kultur und Religion.
[03:48] Die politische Intrige ist ebenso komplex. Der Kaiser, die Raumfahrtgilde, der Landsraad, die Bene Gesserit — all diese Kräfte spielen ein Machtspiel und Arrakis ist das Schachbrett.
[04:05] Was ich am beeindruckendsten finde, ist, wie Herbert all das zugänglich macht. Das Buch ist dicht mit Informationen, aber die Geschichte von Paul und seiner Reise hält einen am Lesen. Es ist ein Pageturner, der sich als philosophische Abhandlung tarnt.
[04:22] Das Ende des ersten Buches ist ein Cliffhanger epischen Ausmaßes und Herbert folgte mit fünf weiteren Romanen in der Reihe. Aber das erste Buch steht für sich als eine komplette und kraftvolle Geschichte.
[04:38] Dune hat alles beeinflusst, was danach kam — Star Wars, Game of Thrones, sogar Avatar. Wenn du moderne Science Fiction verstehen willst, musst du Dune lesen. Danke fürs Zuhören!',
    INTERVAL '7 minutes',
    (SELECT id FROM categories WHERE name = 'Science Fiction')
  );

-- Romantik
INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Outlander',
    'Sara präsentiert Diana Gabaldons historische Romanze über Claire Randall, eine Krankenschwester des Zweiten Weltkriegs, die ins Schottland des 18. Jahrhunderts zurückversetzt wird.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, heute präsentiere ich Outlander von Diana Gabaldon. Das ist das erste Buch einer Serie von acht Romanen und es wurde 1991 veröffentlicht. Es ist seither zu einer der am meisten geliebten historischen Fiktionsserien aller Zeiten geworden.
[00:22] Die Geschichte beginnt 1945, kurz nach dem Ende des Zweiten Weltkriegs. Claire Randall Beauchamp ist eine ehemalige Militärkrankenschwester, die mit ihrem Mann Frank nach Schottland zurückkehrt, für ihren zweiten Hochzeitsmonat.
[00:38] Sie besuchen einen Kreis von Steinen in den schottischen Highlands und als Claire die Steine berührt, passiert etwas Unmögliches — sie wird zurück in die Zeit ins Jahr 1743 transportiert.
[00:53] Sie wacht in einem mittelalterlichen schottischen Dorf auf, spricht Englisch, das niemand versteht, trägt Kleidung, die sie als seltsam markiert, und steht einer Welt gegenüber, die brutal und unbarmherzig ist.
[01:08] Claire wird bald gefangen genommen und gezwungen, sich mit Jamie Fraser, einem jungen schottischen Clanchef, zu verheiraten, um ihre Ehre zu schützen. Jamie ist ehrenhaft, tapfer und freundlich — alles, was Claire bewundern könnte. Aber ihr Herz gehört Frank, der zweihundert Jahre in der Zukunft auf sie wartet.
[01:28] Das schafft ein unmögliches Liebesdreieck über Jahrhunderte hinweg und Gabaldon bewältigt es mit unglaublicher Nuance. Claire ist keine passive Figur — sie trifft schwierige Entscheidungen und lebt mit den Konsequenzen.
[01:43] Was Outlander so besonders macht, ist das historische Detail. Gabaldon, die einen Hintergrund in Pflege und Journalismus hat, recherchiert alles sorgfältig. Die Medizin, die Politik, das tägliche Leben im Schottland des 18. Jahrhunderts — alles fühlt sich authentisch an.
[01:58] Claire nutzt ihr medizinisches Wissen, um zur Heilerin in der Highland-Gemeinschaft zu werden, und das gibt ihr einen Zweck und eine Möglichkeit, den Respekt der Menschen um sie herum zu verdienen. Sie rettet Leben mit Techniken, die Jahrhunderte ihrer Zeit voraus sind.
[02:15] Der politische Hintergrund ist der Jakobitenaufstand, der Versuch, die Stuart-Dynastie auf den britischen Thron zurückzubringen. Die Schlacht von Culloden, die bevorsteht, wird eine der blutigsten Schlachten auf britischem Boden sein und die Highland-Lifestyle für immer zerstören.
[02:33] Diese drohende Katastrophe fügt der Geschichte enorme Spannung hinzu. Claire weiß aus Geschichtsbüchern, was passieren wird, und sie will verzweifelt den Lauf der Ereignisse verändern.
[02:48] Jamie Fraser ist eine der am besten geschriebenen männlichen Figuren, die ich je getroffen habe. Er ist ein Krieger, ein Anführer und ein Romantiker, aber er ist auch verletzlich und menschlich. Er macht Fehler, fühlt Schuld und liebt Claire mit einer Tiefe, die sowohl wunderschön als auch schmerzhaft ist.
[03:05] Die Beziehung zwischen Claire und Jamie ist komplex, weil sie unter Zwang beginnt, aber sie wächst zu etwas Echtem heran. Gabaldon eilt nicht — die Liebe entwickelt sich langsam und fühlt sich verdient an.
[03:20] Die Nebencharaktere sind ebenso gut ausgearbeitet. Da ist Murron, Jamies erste Liebe; Fergus, sein jüngerer Bruder; und Brianna, Claires Tochter, die zur Protagonistin der späteren Bücher der Serie wird.
[03:35] Eines, das Outlander von anderer historischer Fiktion unterscheidet, ist, wie ernst es seine weibliche Protagonistin nimmt. Claire ist eine moderne Frau — unabhängig, gebildet und daran gewöhnt, Eigenständigkeit zu haben — geworfen in eine Welt, in der Frauen fast keine Rechte haben.
[03:52] Sie navigiert damit mit Intelligenz, Mut und manchmal Verzweiflung. Sie weigert sich, ein Opfer ihrer Umstände zu sein, auch wenn die Umstände nahezu unerträglich sind.
[04:08] Das Buch ist lang — fast achthundert Seiten — aber es fühlt sich nie langsam an. Die Prosa ist lebendig, der Dialog knistert und die emotionalen Einsätze sind immer hoch.
[04:22] Gabaldon schreibt auch ehrlich über die dunkleren Seiten der Geschichte. Gewalt, sexuelle Übergriffe und die brutalen Realitäten des Krieges werden nicht romantisiert. Das macht die Momente der Zärtlichkeit und Liebe noch kraftvoller.
[04:38] Das Ende des ersten Buches ist emotional verheerend und richtet den Rest der Serie perfekt ein. Ich beendete es und fing sofort das zweite Buch, Voyager, an.
[04:52] Wenn du historische Fiktion, starke weibliche Figuren oder epische Liebesgeschichten liebst, ist Outlander absolut unverzichtbare Lektüre. Danke fürs Zuhören!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Romantik')
  );

-- Weitere Podcasts, um auf 12 zu kommen

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Das perfekte Opfer',
    'Anna präsentiert Gillian Flynn''s psychologischer Thriller über eine Ehe, die schrecklich schiefgeht.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Hallo zusammen, heute möchte ich über Das perfekte Opfer von Gillian Flynn sprechen. Dieser Roman wurde 2012 veröffentlicht und wurde sofort ein Bestseller. Er wurde 2014 von David Fincher verfilmt, aber ehrlich gesagt ist das Buch noch besser.
[00:22] Die Geschichte beginnt am Morgen des fünften Hochzeitstags von Nick und Amy Dunne. Amy ist verschwunden. Das Haus ist ein Tatort — es gibt Blut, ein Küchenmesser und Anzeichen eines Kampfes.
[00:38] Nick wird zum Hauptverdächtigen und als der Medienzirkus sich intensiviert, gibt er ein Fernsehinterview, das ihn noch schlechter aussehen lässt. Die Öffentlichkeit wendet sich gegen ihn und alle scheinen zu denken, er habe seine Frau ermordet.
[00:53] Aber hier ist die Sache — Flynn spielt einen Trick mit dem Leser und wenn du herausfindest, was passiert, wirst du es nicht kommen sehen. Das Buch wechselt zwischen Nicks Perspektive und Amys Perspektive und Amys Abschnitte sind als Tagebucheinträge geschrieben.
[01:10] Was diese Tagebucheinträge so beunruhigend macht, ist, dass du erkennst, dass sie eine sorgfältig konstruierte Performance sind. Amy hat sie geschrieben, um eine Erzählung zu schaffen, die sie zur perfekten Opfer und Nick zum perfekten Bösewicht macht.
[01:28] Amy ist eine der beängstigendsten Figuren in der modernen Fiktion. Sie ist intelligent, berechnend und völlig rücksichtslos. Sie hat ihr Verschwinden bis ins kleinste Detail geplant und ist bereit, jeden zu zerstören, der ihr in den Weg kommt.
[01:45] Aber Flynn lässt dich auch Amy verstehen. Sie wuchs auf, wie ihre Mutter versuchte, sie zur perfekten Tochter zu formen, und sie lernte früh, dass Performance und Manipulation Überlebenswerkzeuge sind.
[02:00] Nick ist auch nicht unschuldig. Er hat eine Affäre, ist verbittert über das kontrollierende Verhalten seiner Frau und ist tief fehlerhaft. Das Buch zwingt dich zu fragen — wer ist hier das echte Monster?
[02:15] Die Kulisse in der kleinen Stadt Missouri fügt eine weitere Schicht hinzu. Die Medien verwandeln Nicks und Amys Ehe zu Unterhaltung und die Stadtbewohner spielen Richter und Jury. Flynn kritisiert, wie die Gesellschaft persönliche Tragödie als Unterhaltung konsumiert.
[02:32] Die Detektivin Rhonda Boney ist eine großartige Figur. Sie sieht durch die Performance und fängt an, die richtigen Fragen zu stellen. Sie repräsentiert die Stimme der Vernunft in einer verrückten Welt.
[02:48] Der dritte Akt des Buches ist ein Meisterkurs in Spannung. Als Amy sich selbst und das, was sie getan hat, offenbart, wird die Situation fast unmöglich. Sowohl Nick als auch Amy sind in einem Albtraum gefangen, den sie selbst erschaffen haben.
[03:05] Das Ende ist eines der unheimlichsten in der modernen Fiktion. Es ist kein glückliches Ende, es ist kein trauriges Ende — es ist ein dunkles Ende, das dich in Schweigen versetzt, nachdem du die letzte Seite gelesen hast.
[03:20] Flynn schrieb dieses Buch nach ihrer Arbeit als Journalistin und TV-Autorin und man spürt diese Fähigkeit auf jeder Seite. Das Tempo ist perfekt, die Wendungen sind verdient und die Prosa ist scharf und witzig, selbst in den dunkelsten Momenten.
[03:38] Was ich am beunruhigendsten fand, ist, wie realistisch das Buch sich anfühlt. Die Art, wie die Medien die Wahrheit manipulieren, wie Menschen Glück in den sozialen Medien vorspielen, wie Ehen zu Gefängnissen werden können — das ist alles unangenehm nah am echten Leben.
[03:55] Ich würde dieses Buch jedem empfehlen, der einen psychologischen Thriller liebt, aber mach dich bereit — es wird dich lange begleiten, nachdem du fertig gelesen hast. Danke fürs Zuhören!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Krimi')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Der Alchimist',
    'Sara diskutiert Paulo Coelho''s philosophische Fabel über Santiagos Reise, um seine persönliche Legende zu finden.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Willkommen zu meiner Präsentation von Der Alchimist von Paulo Coelho. Dieses Buch wurde ursprünglich 1988 auf Portugiesisch veröffentlicht und ist seither in mehr als achtzig Sprachen übersetzt worden, mit über sechzig Millionen verkauften Exemplaren weltweit.
[00:22] Es ist ein kurzes Buch — man kann es an einem Nachmittag lesen — aber es ist die Art von Buch, die einem Jahre lang bleibt.
[00:35] Die Geschichte folgt Santiago, einem jungen andalusischen Hirten, der träumt, einen Schatz zu finden, der bei den ägyptischen Pyramiden begraben ist. Nachdem er denselben Traum immer wieder hat, besucht er eine Zigeunerin zur Deutung und trifft dann einen alten Mann namens Melchizedek, den König von Salem.
[00:53] Melchizedek erzählt Santiago von seiner persönlichen Legende — das, was er immer schon erreichen wollte, seit er jung war. Er sagt, dass, wenn du etwas willst, das gesamte Universum zusammenarbeitet, um dir zu helfen, es zu erreichen.
[01:10] Dieser Satz wurde zu einem der berühmtesten Sätze in der modernen Literatur und er fängt die gesamte Botschaft des Buches ein. Deine Träume sind wichtig und das Universum will, dass du ihnen folgst.
[01:23] Santiago verkauft seine Schafe und reist nach Marokko und von dort über die Sahara nach Ägypten. Auf dem Weg lernt er die Sprache der Welt, die Seele der Welt und das Konzept von Maktub — es ist geschrieben.
[01:40] In Marokko trifft Santiago einen Engländer, der reist, um bei einem Alchimisten zu studieren. Der Engländer liest hunderte Bücher über Alchemie, weigert sich aber, mit dem Alchimisten selbst zu sprechen. Santiago hingegen lernt durch Erfahrung, durch Beobachtung und durch Zuhören.
[01:58] Dieser Kontrast zwischen Buchwissen und gelebter Erfahrung ist eines der zentralen Themen des Buches. Coelho sagt damit, dass Weisheit von der Reise selbst kommt, nicht vom Lesen darüber.
[02:12] Santiago erreicht schließlich den Alchimisten in der ägyptischen Wüste und der Alchimist wird zu seinem Mentor. Der Alchimist lehrt ihn, seinem Herzen zuzuhören, mit dem Wind, der Sonne und der Wüste zu kommunizieren und zu verstehen, dass die Furcht vor Leid schlimmer ist als das Leid selbst.
[02:30] Eine der schönsten Szenen ist, wenn Santiago lernt, sich selbst in den Wind zu verwandeln. Es ist eine Metapher dafür zu verstehen, dass alles im Universum verbunden ist und dass man, indem man sich selbst versteht, alles versteht.
[02:48] Santiago verliebt sich auch in eine Wüstenfrau namens Fatima an einer Oase. Sie sagt ihm, dass sie wie eine Blume ist — wenn er geht, wird sie welken, aber sie will, dass er seiner persönlichen Legende folgt anyway. Wahre Liebe, sagt sie, hält dich nicht davon ab, deinen Träumen zu folgen.
[03:05] Das Ende des Buches enthält eine Wendung, die sowohl überraschend als auch tief bedeutungsvoll ist. Nach all dieser Reise durch die Wüste entdeckt Santiago, dass der Schatz genau dort begraben war, wo er angefangen hat — zurück in Spanien, bei der verlassenen Kirche, in der er als Hirte schlief.
[03:23] Aber der Punkt ist nicht der Schatz. Der Punkt ist die Reise. Santiago hätte den Schatz nie gefunden, wenn er nicht nach Ägypten gereist wäre, den Alchimisten getroffen hätte, über die Seele der Welt gelernt hätte und sich verliebt hätte.
[03:40] Das Buch ist einfach, fast wie eine Fabel, und einige Kritiker sagen, es sei zu einfach. Aber ich denke, das ist genau der Punkt. Die tiefsten Wahrheiten sind oft die einfachsten.
[03:55] Coelho schrieb Der Alchimist nach einer Phase der Depression und persönlichen Krise und man spürt, dass das Buch seine eigene persönliche Legende in Form ist. Es ist ein Buch über Hoffnung, über Mut und über den Mut, sich selbst zu sein.
[04:10] Ich empfehle dieses Buch jedem, der sich jemals verloren gefühlt hat oder unsicher über seinen Lebensweg war. Es ist eine sanfte Erinnerung, dass deine Träume es wert sind, gefolgt zu werden, auch wenn der Weg unsicher ist. Danke fürs Zuhören!',
    INTERVAL '5 minutes',
    (SELECT id FROM categories WHERE name = 'Klassiker')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    'Gebildet',
    'Anna präsentiert Tara Westovers autobiografisches Werk über das Aufwachsen in einer survivalistischen Familie und den eventualen PhD von Cambridge.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Heute präsentiere ich Gebildet von Tara Westover. Diese Autobiografie wurde 2018 veröffentlicht und gewann zahlreiche Auszeichnungen, einschließlich des LA Times Book Award und des Goodreads Choice Award für Memoir und Autobiografie.
[00:20] Sie war auch auf Barack Obamas Leseliste und Bill Gates nannte sie eines seiner Lieblingsbücher. Aber abgesehen von Auszeichnungen ist dies einfach eine der bemerkenswertesten wahren Geschichten, die ich je gelesen habe.
[00:38] Tara Westover wurde 1986 in einer survivalistischen Familie in den Bergen von Idaho geboren. Ihr Vater war ein paranoider Mormone, der glaubte, die Regierung sei böse und dass Krankenhäuser, Schulen und Medizin Werkzeuge einer Verschwörung seien, um Menschen zu kontrollieren.
[00:55] Wegen seiner Überzeugungen ging Tara nie zur Schule. Sie besuchte nie einen Arzt. Sie hatte keine Geburtsurkunde. In den ersten siebzehn Jahren ihres Lebens wusste sie nicht, was der Holocaust oder der Vietnamkrieg war.
[01:13] Ihre Tage verbrachte sie mit der Arbeit in ihrem Vaters Schrottplatz, schwerem Metall mit ihren Brüdern heben und ihrer Mutter bei Kräutermedizin helfen. Ihre Mutter war eine talentierte Kräuterexpertin, aber auch eine missbräuchliche Elternteil, und die Kinder wurden regelmäßig bei der Arbeit verletzt.
[01:30] Taras ältester Bruder Shawn war physisch und emotional missbräuchlich und als Tara versuchte, ihren Eltern zu erzählen, beschuldigte ihr Vater sie, ihn provoziert zu haben. Dieses Muster von Gaslighting — dich dazu bringen, deine eigene Realität zu bezweifeln — ist einer der schmerzhaftesten Teile des Buches.
[01:48] Alles änderte sich, als ihr älterer Bruder Tyler, der das Haus verlassen hatte, um an der BYU zu studieren, Tara ermutigte, die ACT-Prüfung zu machen. Sie war nie zur Schule gegangen, aber sie lehrte sich alles aus alten Lehrbüchern, die sie auf der Schrottplatz fand.
[02:05] Sie bestand die Prüfung mit hohen Punkten und kam an die Brigham Young University. Das war der Beginn ihrer Bildung, aber es war auch der Beginn ihrer Distanz zu ihrer Familie.
[02:18] An der Universität ist Tara schockiert, wie unterschiedlich die Welt von dem ist, was sie kannte. Sie weiß nicht, wie man sich in einem Klassenzimmer benimmt. Sie kennt keine grundlegenden historischen Fakten. Sie verbrennt ihre Hand auf einer heißen Pfanne und weiß nicht, dass man sie unter kaltes Wasser halten soll.
[02:35] Aber sie ist entschlossen und arbeitet härter als jeder um sie herum. Ihre Professoren erkennen ihr Talent und sie bekommt eventually eine Forschungsposition bei Historiker Hugh Hedstrom, der zu ihrem Mentor und Vaterfigur wird.
[02:50] Tara erlangt ihren Bachelor-Abschluss, geht dann als Fulbright-Stipendiatin nach Cambridge und erlangt eventually einen PhD in Geschichte von der Cambridge University. Sie verbringt auch ein Jahr an Harvard unter Historiker Timothy Snyder.
[03:08] Aber jeder Schritt hin zur Bildung ist ein Schritt weg von ihrer Familie. Ihr Vater erklärt sie zur Feindin und ihre Brüder nehmen Partei. Der zentrale Konflikt des Buches ist nicht nur über Bildung — es ist die unmögliche Wahl zwischen Familie und Selbst.
[03:25] Westover schreibt über diesen Konflikt mit unglaublicher Ehrlichkeit. Sie malt ihre Familie nicht als Monster und malt sich nicht als Heldin. Sie zeigt, wie Liebe und Missbrauch in derselben Familie koexistieren können und wie das Weggehen sowohl Befreiung als auch Verlust ist.
[03:43] Der Titel des Buches ist tief bedeutungsvoll. Gebildet ist im Partizip Perfekt — es suggeriert, dass Bildung etwas ist, das einem passiert, das einen fundamental transformiert. Aber es stellt auch die Frage: Kann man gebildet sein und immer noch die Menschen lieben, die deiner Bildung widersprochen haben?
[04:00] Westover gibt uns keine einfache Antwort. Sie zeigt, dass Bildung ihr die Werkzeuge gab, ihr eigenes Leben zu verstehen, aber es kostete sie auch ihre Beziehung zu ihrem Vater und einigen ihrer Geschwister.
[04:15] Das Schreiben ist wunderschön — lyrisch, präzise und tief emotional. Westover hat das Geschenk, die genaue Metapher zu finden, die ein Gefühl einfängt, und ihre Beschreibungen der Idaho-Wildnis sind einige der lebendigsten, die ich je gelesen habe.
[04:32] Dieses Buch hat meine Perspektive darüber verändert, was Bildung bedeutet. Es geht nicht nur um Abschlüsse und Qualifikationen — es geht darum, die Fähigkeit zu gewinnen, die Welt klar zu sehen, das zu hinterfragen, was einem beigebracht wurde, und seine eigene Identität zu erschaffen.
[04:48] Ich kann dieses Buch nicht genug empfehlen. Es ist eines jener seltenen Bücher, die dich zum Anrufen deiner Familie, zum Sprechen mit deinen Lehrern und zum Überdenken von allem bringen, was du denkst, dass du weißt. Danke fürs Zuhören!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Biografie')
  );

INSERT INTO podcasts (title, description, cover_url, audio_url, transcription, duration, category_id) VALUES
  (
    '1984',
    'Lukas präsentiert George Orwells dystopisches Meisterwerk über Totalitarismus, Überwachung und die Macht der Sprache.',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-cover/lpp.png',
    'https://ohksnpnmcuoxbyrswjyz.supabase.co/storage/v1/object/public/podcast-audio/rain.mp3',
    '[00:00] Heute möchte ich über 1984 von George Orwell sprechen. Dieser Roman wurde 1949 veröffentlicht, nur zwei Jahre nach dem Ende des Zweiten Weltkriegs, und wurde zum definierenden Werk der dystopischen Fiktion.
[00:20] Orwell schrieb es als Warnung vor Totalitarismus und fünfundsechzig Jahre später fühlt es sich relevanter an als je zuvor.
[00:33] Die Geschichte spielt in Streifenposten Eins, vormals Großbritannien, das jetzt Teil des Superstaates Ozeania ist. Die Regierung wird von einer Partei geführt, die von Großbruder geleitet wird, dessen Gesicht überall ist — auf Plakaten, auf Bildschirmen, auf Geld.
[00:50] Der berühmte Slogan lautet: Großbruder beobachtet dich. Und er tut es. Teleschirme in jedem Zuhause und öffentlichen Raum übertragen Parteipropaganda und überwachen Bürger gleichzeitig. Privatsphäre existiert nicht.
[01:05] Unser Protagonist ist Winston Smith, ein neununddreißigjähriger Mann, der im Ministerium der Wahrheit arbeitet. Sein Job ist es, historische Dokumente umzuschreiben, um der aktuellen Version der Wahrheit der Partei zu entsprechen. Wenn die Partei sagt, es hat an einem bestimmten Tag geregnet, ändert Winston die Wetteraufzeichnungen, so dass es geregnet hat.
[01:23] Winston ist einer der seltenen Menschen, die immer noch für sich selbst denken. Er hasst die Partei heimlich und fängt an, ein Tagebuch zu führen, was eine Straftat ist. Unabhängiges Denken — was die Partei Gedankenkriminalität nennt — wird mit dem Tod bestraft.
[01:40] Winston beginnt eine verbotene Liebesaffäre mit Julia, einer jungen Frau, die in der Fiktionsabteilung arbeitet. Ihre Beziehung ist ein Akt des Widerstands, weil die Partei die Sexualität kontrolliert und alle Leidenschaft in Hass auf Feinde und Liebe zu Großbruder kanalisiert.
[01:58] Sie treffen sich heimlich in einer Wohnung über Mr. Charringtons Laden und für eine Weile glaubt Winston, einen Raum gefunden zu haben, den die Partei nicht erreichen kann. Er glaubt, dass, solange zwei Menschen einander lieben, sie etwas haben, das die Partei nicht wegnnehmen kann.
[02:15] Aber er irrt sich. Mr. Charrington erweist sich als Mitglied der Gedankenpolizei und der Teleschirm, der hinter dem Bild von Großbruder versteckt ist, hat die ganze Zeit überwacht.
[02:30] Winston und Julia werden verhaftet und ins Ministerium der Liebe gebracht, wo sie getrennt gefoltert und umgedreht werden. Winstons Folterer ist O''Brien, ein ranghoher Parteimitglied, für den Winston fälschlicherweise glaubte, ein mitstreiter zu sein.
[02:48] Der beängstigendste Teil des Buches ist Raum 101, wo jeder Gefangene seiner schlimmsten Angst gegenübersteht. Für Winston sind es Ratten. Und in diesem Moment absoluten Terrors verrät er Julia — er schreit, Mach es ihr an, nicht mir.
[03:05] Dieser Verrat ist die endgültige Zerstörung seines inneren Selbst. Danach gibt es nichts mehr zu brechen. Winston wird in die Gesellschaft entlassen, komplett umgeschrieben, und die letzte Zeile des Buches ist eine der traurigsten in der Literatur: Er liebte Großbruder.
[03:22] Orwell erfindet Konzepte in diesem Buch, die in unsere Alltagssprache eingegangen sind. Neusprech — eine Sprache, die entwickelt wurde, um den Bereich des Denkens durch das Eliminieren von Wörtern zu reduzieren. Doppeldenken — die Fähigkeit, zwei widersprüchliche Überzeugungen gleichzeitig zu halten.
[03:38] Das Konzept des Gedächtnislochs, wo Dokumente zerstört und dann vergessen werden, ist unglaublich prophetisch. Und die Idee, dass, wer die Vergangenheit kontrolliert, die Zukunft kontrolliert, und wer die Gegenwart kontrolliert, die Vergangenheit kontrolliert — das ist der Kern von Orwells Warnung.
[03:55] Orwell war ein demokratischer Sozialist, der Totalitarismus aus erster Hand in Spanien während des Bürgerkriegs und in der Sowjetunion gesehen hatte. Er verstand, dass die größte Bedrohung für die Freiheit nicht nur physische Unterdrückung ist, sondern die Manipulation der Wahrheit selbst.
[04:12] Als er 1984 schrieb, war Überwachungstechnologie primitiv. Heute tragen wir Tracking-Geräte in unseren Taschen, unsere Gespräche werden von Konzernen aufgezeichnet und Deepfakes machen es unmöglich, dem zu vertrauen, was wir sehen.
[04:28] Das Buch ist ein Aufruf zur Wachsamkeit. Orwell will, dass wir Wahrheit wertschätzen, unabhängiges Denken schützen und die Anzeichen von Autoritarismus erkennen, bevor es zu spät ist.
[04:42] Ich denke, jeder Erwachsene sollte 1984 lesen. Es ist nicht nur ein Roman — es ist ein Handbuch dafür zu verstehen, wie Macht Sprache korrupt macht, wie Sprache Denken korrupt macht und wie Denken Realität korrupt macht. Danke fürs Zuhören!',
    INTERVAL '6 minutes',
    (SELECT id FROM categories WHERE name = 'Science Fiction')
  );

-- =====================================================
-- PODCAST-PRÄSENTATOR-VERBINDUNGEN
-- =====================================================

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('Die Hund von Baskerville', 'Das perfekte Opfer', 'Gebildet')
  AND pr.name = 'Anna Müller';

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('Der Hobbit', 'Die Schuld liegt nicht an den Sternen', 'Dune', '1984')
  AND pr.name = 'Lukas Schneider';

INSERT INTO podcast_presenters (podcast_id, presenter_id)
SELECT p.id, pr.id FROM podcasts p, presenters pr
WHERE p.title IN ('Sapiens: Eine kurze Geschichte der Menschheit', 'Stolz und Vorurteil', 'Outlander', 'Der Alchimist')
  AND pr.name = 'Sara Fischer';
