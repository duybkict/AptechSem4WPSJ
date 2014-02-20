DROP DATABASE IF EXISTS AptechSem4WPSJ; 
CREATE DATABASE AptechSem4WPSJ;
USE AptechSem4WPSJ;

CREATE TABLE articles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(512) NOT NULL,
	short_description VARCHAR(1024) NOT NULL,
	content TEXT NOT NULL,
	image VARCHAR(512),
	category INT NOT NULL DEFAULT 1, -- 1: News & Events, 2: Courses
	status INT NOT NULL DEFAULT 1, -- 1: Available, 2: Starting soon, apply only for Courses
	price float, -- Apply only for Courses
	published BIT NOT NULL DEFAULT 1,
	published_date DATETIME,
	created_date DATETIME,
	modified_date DATETIME
);

CREATE TABLE contacts (
	id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(128),
	email VARCHAR(128) NOT NULL,
	message TEXT,
	created_date DATETIME,
	modified_date DATETIME
);

DROP TRIGGER IF EXISTS tgg_insert_ariticles;
delimiter //
CREATE TRIGGER tgg_insert_ariticles 
BEFORE INSERT ON articles
FOR EACH ROW 
BEGIN
	SET NEW.created_date = now();
	SET NEW.modified_date = now();
	IF NEW.published = 1 THEN
		SET NEW.published_date = now();
	END IF;
END;//
delimiter ;

DROP TRIGGER IF EXISTS tgg_update_ariticles;
delimiter //
CREATE TRIGGER tgg_update_ariticles 
BEFORE UPDATE ON articles
FOR EACH ROW 
BEGIN
	SET NEW.modified_date = now();
	IF NEW.published != OLD.published AND NEW.published = 1 THEN
		SET NEW.published_date = now();
	END IF;
END;//
delimiter ;

DROP TRIGGER IF EXISTS tgg_insert_contacts;
delimiter //
CREATE TRIGGER tgg_insert_contacts 
BEFORE INSERT ON contacts
FOR EACH ROW 
BEGIN
	SET NEW.created_date = now();
	SET NEW.modified_date = now();
END;//
delimiter ;

DROP TRIGGER IF EXISTS tgg_update_contacts;
delimiter //
CREATE TRIGGER tgg_update_contacts 
BEFORE UPDATE ON contacts
FOR EACH ROW 
BEGIN
	SET NEW.modified_date = now();
END;//
delimiter ;

-- 1
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('Sharp 100 years', 
		'<p>This entry is to celebrate the upcoming 100th Anniversary of Sharp, one of the Japanese Electronic Manufacturers that have shaped our lives and homes for as long as we can remember. It’s scary how even a technology company that is always “modern” and “futuristic” in our minds, could one day be a century old!</p>', 
		'<p>Our first color TV set is a Sharp TV. It was my Grandfather’s pride and joy. Even with the limited channels we could receive via antenna on the TV set, it was our family’s most precious asset. After being away from Vietnam for over 20 years, I was so glad to find the same TV set still standing in my Grandparents home. And believe or not, it’s still working!</p><p>Fast forward to today, Sharp is now part of our Kitchen Art workplace, with the Sharp Microwave that we religiously use everyday to heat up our lunchboxes from home. Yes, we might be conjuring up delicious and gorgeous dishes at Kitchen Art studio, but everyday, we still count on this little fellow here to feed us with the modest home meals packed by our family for us busy people at Kitchen Art.</p><p>So you probably expect a big party for Sharp’s 100th Anniversary. Trust me, you won’t be disappointed. Sharp launched an “Sharp 100 Years” campaign from now until 15 September 2012 to allow every person from Asia to Australia and Middle East to share your memorable Anniversary or other commemorative moments on the Sharp “Anniversary Share” website: http://share.sharp100years.com.</p><p>Logon now and start sharing photos or videos of your beautiful wedding day, graduation day, or the first time you sky-dived! Whatever it is, if it is memorable to you, Sharp will want it pinned on their anniversary photo collage to share with the rest of the world. And that’s not all: Sharp will create a memorable movie with all your images and video submissions, displayed on the website during the campaign period.</p><p>If that’s not enough, you can even stand a chance to win fabulous prizes just by submitting your memory!  Four people will be selected from all applicants to win a trip to the West Coast, USA, and submitters of the top five ranking pictures and videos will receive Sharp product prizes!</p><p>So if you want to keep something to remember, make your memory a part of Sharp 100 Years history today! </p>', 
		'images/page5-img1.jpg', 
		1);
-- 2
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('Junior Chef Promotion For Children\'s Day', 
		'<p>Cooking and baking is now not only a grown-up’s hobby, but a recreational and bonding activity for both parents and children as well.</p>', 
		'<p>While the latest season of Junior Masterchef just wrapped up, and with Children’s Day (1 June) just around the corner, Kitchen Art is proudly bringing to you the first ever “Junior Chef Promotion” program from 23 May until 1 June, with 10% discount on selected items. We have carefully chosen products that are safe and enjoyable to use, and also serve as a colorful addition to your Kitchen, making it a more exciting place for kids to get creative and involved in the art of cooking!</p>', 
		'images/page5-img2.jpg', 
		1);
-- 3
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('GoodCook Vietnam sponsored the Disciples d’Escoffier Gala Dinner ', 
		'<p>Etiam eget gravida neque. Aliquam commodo luctus orci, sed vestibulum elit vehicula vel. Nam arcu tellus, dictum non scelerisque sit amet.</p>', 
		'<p>Suspendisse sit amet sagittis quam. Cras fermentum, nisi at lobortis feugiat, odio tortor vehicula massa, vel pharetra sapien magna nec sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam in risus posuere, pulvinar metus a, commodo purus. Quisque libero velit, laoreet vel lectus nec, cursus interdum enim. Nunc neque nisi, blandit sed venenatis dapibus, tincidunt sit amet neque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla facilisi. Etiam pulvinar nisl vel diam pellentesque, vitae tincidunt mauris auctor. Nam auctor dui a eros sollicitudin, at cursus tortor hendrerit. Curabitur eget dolor vel purus interdum placerat. </p><p>Quisque ac commodo tellus, et pellentesque libero. Sed in nunc dictum ipsum rutrum lobortis. Nunc id interdum mauris, non condimentum diam. Ut faucibus eros eget nisi dictum sodales. Pellentesque scelerisque, elit congue consectetur lacinia, leo orci bibendum est, vitae faucibus erat ligula vel dui. Praesent rutrum odio vulputate arcu accumsan, et convallis magna rutrum. Aliquam erat volutpat. Maecenas a sagittis metus. Suspendisse dapibus bibendum ante vitae ultrices. Praesent porta turpis ultrices sapien pretium mollis. Donec ac magna dolor. Cras ut ultricies lorem. Donec sed urna non nisl blandit dapibus. Etiam ut sem tellus. Sed interdum est sit amet magna tristique, suscipit blandit massa aliquet. Pellentesque sollicitudin sodales porta.</p>', 
		'images/page5-img3.jpg', 
		1);
-- 4
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('"Happy Baking Starter Kit" are now available for Baking Newbies! ', 
		'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut nisi enim. Ut placerat fermentum nulla eu imperdiet. Nam ante ante, molestie quis metus sit amet, pharetra consectetur magna. Donec a tortor ac nibh tincidunt rhoncus. Nullam at ante in ipsum luctus tempus.</p>', 
		'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut nisi enim. Ut placerat fermentum nulla eu imperdiet. Nam ante ante, molestie quis metus sit amet, pharetra consectetur magna. Donec a tortor ac nibh tincidunt rhoncus. Nullam at ante in ipsum luctus tempus. Vestibulum elit metus, malesuada non purus condimentum, ullamcorper pellentesque diam. Maecenas libero ligula, lacinia at dolor ut, interdum laoreet justo. Mauris tempor dictum nibh, ac egestas leo dapibus sed. Mauris arcu enim, pulvinar ac sollicitudin eu, fermentum sit amet nulla. Morbi quam dui, fringilla faucibus arcu sit amet, egestas consectetur dui. Ut at arcu elit. Sed non nulla sed purus pharetra mollis. </p><p>Maecenas semper aliquam mattis. Sed eget lobortis leo. Integer purus augue, ultrices ut varius commodo, accumsan vel felis. Donec sollicitudin iaculis dui, sit amet malesuada urna. Praesent felis velit, convallis semper libero vel, vulputate sodales ipsum. Nam bibendum tincidunt egestas. Nulla auctor pulvinar nunc id feugiat. Morbi posuere leo eget nibh porttitor ullamcorper. Etiam lorem massa, imperdiet vitae nisl id, dapibus dapibus orci. </p>', 
		'images/page5-img4.jpg', 
		1);
-- 5
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('Real Food, Real Cooking, Real Passion', 
		'<p>Cras tristique nisi at eros viverra egestas. Aenean a nisi nec diam blandit commodo. Aenean nec purus elit. Nulla eu justo vitae sapien lacinia condimentum. In convallis rutrum eros ut lobortis.</p>', 
		'<p>Praesent vel tristique mauris. Pellentesque dictum vestibulum erat, at vulputate eros commodo eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lobortis purus eget dui gravida porta. Cras tempor orci libero, sit amet lobortis nulla mollis sit amet. Quisque mollis non mauris nec vulputate. Nunc bibendum enim a turpis consectetur, sit amet iaculis eros suscipit. Cras blandit sagittis iaculis. Nullam felis felis, vulputate id mi non, sollicitudin placerat leo. Quisque in justo dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus iaculis tortor nec nisl posuere, convallis dignissim lorem scelerisque. Sed ultrices felis vehicula, dapibus nibh vel, tincidunt metus. Fusce laoreet dignissim suscipit. </p><p>Pellentesque feugiat, nisl id faucibus accumsan, sem mi congue enim, eget pellentesque tellus metus eget sem. Duis ultricies vel magna sit amet malesuada. Curabitur vitae convallis elit. Proin dignissim luctus felis. Aenean vulputate, nisl ac cursus viverra, purus augue fermentum nunc, et volutpat nulla elit quis sapien. Fusce justo libero, pellentesque a enim et, lobortis laoreet odio. Sed nec ante vitae nunc sollicitudin sodales eu id tortor. Cras mi justo, ultricies a ornare sed, suscipit vitae nibh. Integer ultricies sed elit a mattis. Aenean aliquet malesuada lorem, vel rhoncus purus hendrerit in. Donec egestas faucibus arcu ut accumsan. Proin et quam ultrices, pharetra odio et, commodo metus. Suspendisse porttitor mi quis est semper ultricies. Cras lobortis nibh ac felis fringilla, et feugiat libero tempor. Aenean nec diam rhoncus lectus vulputate dignissim. Pellentesque sit amet molestie libero, et tempor risus. </p>', 
		'images/page5-img4.jpg', 
		1);
-- 6
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('Integer luctus turpis ligula, ut eleifend neque sagittis a', 
		'<p>Vivamus nisl nunc, tincidunt ac est ut, sodales mattis arcu. Sed eleifend dignissim blandit. Nam non venenatis elit.</p>', 
		'<p>Integer luctus turpis ligula, ut eleifend neque sagittis a. Nulla viverra congue lacus, quis rutrum eros tempus dignissim. Nulla dictum sem sit amet nulla congue, quis faucibus purus accumsan. Vivamus nisl nunc, tincidunt ac est ut, sodales mattis arcu. Sed eleifend dignissim blandit. Nam non venenatis elit. Pellentesque viverra arcu et molestie tristique. Vivamus tristique, sapien vitae pretium ornare, erat orci tincidunt massa, vitae facilisis eros elit gravida turpis.</p><p>Nullam cursus massa at tincidunt interdum. Nulla accumsan velit sed quam suscipit condimentum. In pharetra, enim eu pharetra interdum, lacus eros ultricies magna, id tempus ante odio at augue. Nullam lacinia egestas tellus, sit amet fermentum mi. Donec malesuada metus non dui consectetur venenatis. Vestibulum ornare, libero sed eleifend consequat, diam ante tincidunt mauris, sed porta risus mauris in diam. Aliquam sit amet nisi quis risus consectetur elementum et at metus. In aliquam lacinia ullamcorper. Maecenas placerat bibendum ligula, venenatis adipiscing libero tempor ut. Aliquam auctor porttitor metus sagittis bibendum. Nulla magna lectus, fermentum ut pulvinar ac, sagittis eu enim. Pellentesque tempus sollicitudin nunc, eu accumsan quam mattis ut. Nulla libero mi, scelerisque sit amet ullamcorper ut, ultrices nec purus. Curabitur id orci consectetur, mollis tortor sed, aliquam quam. Nulla posuere egestas magna at tristique. Quisque egestas nunc in eros hendrerit, vel luctus massa facilisis. </p>', 
		'images/page5-img4.jpg', 
		1);
-- 7
INSERT INTO articles(title, short_description, content, image, category) 
VALUES ('Praesent feugiat ac sapien eu sodales', 
		'<p>Praesent feugiat ac sapien eu sodales. Cras quis tristique augue. Cras vehicula mauris at ante iaculis consectetur. Nullam suscipit eu augue non gravida.</p>', 
		'<p>Praesent feugiat ac sapien eu sodales. Cras quis tristique augue. Cras vehicula mauris at ante iaculis consectetur. Nullam suscipit eu augue non gravida. Nunc aliquet massa et pharetra viverra. Nullam nec lectus velit. Donec eget dolor quis leo aliquet dignissim auctor a ligula. Vivamus pharetra, nisl vitae volutpat aliquam, nunc tellus sodales libero, vitae luctus arcu sem sodales ligula. Duis non vehicula lacus, vel vehicula leo. Duis non ipsum volutpat, vehicula nisl ut, hendrerit nibh. Nullam eget sem lacinia, rhoncus metus ut, lobortis nisl. Mauris suscipit erat ac leo tempus, eget rhoncus tellus rhoncus. Fusce aliquam ante et dui rutrum, eu elementum turpis volutpat. In porttitor laoreet dui, ut varius nunc dapibus sed. </p><p>In commodo est varius iaculis posuere. Nam rutrum urna et purus fermentum fringilla. Sed quis mi ut elit ultrices mattis. Vivamus id lorem tortor. Donec ultricies semper varius. Sed sit amet mollis magna. Donec placerat rutrum ante ultricies tincidunt. Cras nec velit congue, aliquam est a, dapibus lorem. Nulla facilisi. Nullam vel magna enim. Integer sit amet felis justo. Suspendisse justo erat, lacinia a urna ut, adipiscing semper lorem. Sed venenatis scelerisque justo, vitae eleifend erat imperdiet et. Donec sit amet enim in mauris malesuada tincidunt. Quisque imperdiet nec nisi et lacinia. </p>', 
		'images/page5-img4.jpg', 
		1);

-- Courses
-- 1
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Crispy tofu with salted egg', 
		'<p>Phasellus a justo lorem. Nullam commodo nunc nunc, eu facilisis augue porttitor at. Proin eu dignissim quam. In vitae accumsan neque. Nullam sit amet luctus urna, euismod pulvinar massa.</p>', 
		'<p>Sed convallis vestibulum nisl eu vehicula. Quisque vulputate mi sed libero interdum, et dictum justo fermentum. Donec sollicitudin aliquam aliquet. Nunc id pellentesque risus. Suspendisse est sapien, consectetur vel turpis nec, ultrices sodales erat. Aliquam erat volutpat. Pellentesque laoreet metus sed sodales laoreet. Nullam sed diam quis mi sollicitudin tristique in sit amet mauris. Vivamus vitae est tempor, ultricies nunc ut, ullamcorper dolor. Nulla vitae lacus vitae metus ullamcorper aliquet non id purus. Aenean dictum blandit felis, eget ultricies felis hendrerit sed. Integer egestas, dolor in malesuada pretium, nisl dui sollicitudin risus, in blandit lectus nulla a turpis. Cras tempor augue eu sem auctor convallis. </p>', 
		'images/page5-img2.jpg', 
		2, 1, 200.0);
-- 2
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Butter mochi - Cupcake bouquet', 
		'<p>Vestibulum rutrum libero non faucibus tincidunt. Etiam velit eros, lacinia vel nisl id, interdum scelerisque elit. Vivamus faucibus, sapien at faucibus tristique.</p>', 
		'<p>Vestibulum rutrum libero non faucibus tincidunt. Etiam velit eros, lacinia vel nisl id, interdum scelerisque elit. Vivamus faucibus, sapien at faucibus tristique, diam nulla posuere sem, id sollicitudin erat metus a purus. Morbi vitae magna non libero ornare rutrum id vitae lorem. Sed nec posuere nibh. Nunc sollicitudin convallis nisi non condimentum. Donec mi ante, fermentum a accumsan sit amet, euismod vitae sapien. In vehicula eu lacus id placerat. Integer a risus id erat consectetur imperdiet ac nec ante. Vestibulum et neque vehicula, consectetur massa et, adipiscing nisl. Suspendisse sed pulvinar est. Etiam aliquet felis dui, nec rhoncus mi placerat et. Aliquam ac fringilla nunc. In vel ornare velit. Duis mollis elit sit amet velit dignissim facilisis. </p>', 
		'images/page5-img2.jpg', 
		2, 1, 150.0);
-- 3
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Tempura - Eel rice - Japanese tofu with seaweed', 
		'<p>Aliquam id erat elementum nibh tristique vulputate. Nullam vitae varius nisi. Nunc sed rutrum quam. Nullam vitae velit sit amet neque mollis euismod in eu nulla.</p>', 
		'<p>Pellentesque turpis lacus, hendrerit non ullamcorper sit amet, mollis a nibh. Etiam nec dui ac quam elementum iaculis id eget quam. Proin quam ante, ultrices eu mollis vel, pharetra quis velit. Cras id enim semper, lobortis arcu non, tincidunt augue. Donec non velit at libero aliquet viverra. Nunc pellentesque diam eu tortor pharetra, vel ornare massa commodo. Vestibulum tincidunt et nunc eget ullamcorper. Morbi et posuere metus. Morbi porttitor augue non dui congue, et vulputate massa vulputate. </p>', 
		'images/page5-img2.jpg', 
		2, 1, 100.0);
-- 4
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Tuscan Pork Ragu with handmade olive pasta', 
		'<p>Tuscan Pork Ragu with milk, wine, celery and carrots tossed with handmade olive pasta. Hot Chocolate fondant with white chocolate rumball centers</p>', 
		'<p>In at dictum lectus. Sed scelerisque odio in pharetra egestas. Pellentesque laoreet imperdiet fringilla. Fusce in vehicula sapien, ut facilisis nisi. Integer at porttitor neque, eu posuere nisl. Mauris ullamcorper mi non arcu pretium pulvinar. Ut egestas, odio nec faucibus lacinia, enim ante suscipit augue, ac varius justo massa vitae est. In vel sapien sed sapien porta convallis. Nulla ac metus in nunc elementum ullamcorper. Praesent ut ultrices magna. Praesent volutpat eleifend erat, nec feugiat turpis imperdiet nec. Aliquam eu sem massa. Ut feugiat ac tortor in volutpat. Nam accumsan ultricies nisl congue consectetur. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 5
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Chicken red pepper and parmesan roulade - Pumpkin pie', 
		'<p>Food photography 101: Basic ideas, basic knowledge to use your camera in food photograpy (ISO, shutter speed, aperture)</p>', 
		'<p>Integer tempor ligula vel eros cursus, sit amet vehicula risus eleifend. Vivamus rhoncus massa non dolor molestie aliquet. Vivamus tincidunt turpis orci, id tempus felis adipiscing quis. Vestibulum sem ipsum, semper et suscipit vitae, imperdiet ut massa. Vivamus euismod neque magna, sed commodo elit eleifend a. Ut sodales mauris porta, posuere nisi sit amet, dictum dui. Donec semper elit dolor, eget laoreet libero fringilla ut. Aenean a sagittis odio. In magna justo, rhoncus hendrerit leo eget, imperdiet gravida enim. Donec dictum tellus vitae mi commodo, sollicitudin ultricies erat lobortis. Praesent non arcu urna. Maecenas nec felis feugiat, egestas ipsum faucibus, aliquam mauris. Ut eget blandit magna. Fusce vitae lectus adipiscing, iaculis tortor a, tristique mauris. In hac habitasse platea dictumst. Donec vestibulum lectus dolor, in condimentum lacus ultrices ut. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 6
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Cake decoration with Fondant', 
		'<p>Fusce varius eros in aliquet elementum. Praesent bibendum sollicitudin felis a sodales.</p>', 
		'<p>Fusce varius eros in aliquet elementum. Praesent bibendum sollicitudin felis a sodales. Etiam tempor est eu massa blandit egestas. Curabitur porttitor justo non arcu placerat, in tincidunt tortor aliquet. Etiam ut libero auctor, tincidunt ante ac, lobortis arcu. Sed vel convallis purus. Sed adipiscing, lacus in sagittis hendrerit, felis massa volutpat est, ut egestas leo erat imperdiet erat. Nulla commodo ante a nibh viverra tempus. Praesent eu congue est. Sed vulputate tellus non metus vehicula tempus. Donec vitae tortor placerat, malesuada risus eget, venenatis nibh. Ut et porttitor lorem. Vestibulum at pretium lectus. Suspendisse id bibendum leo, id viverra neque. Duis vel ante tortor. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 7
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Chocolate cream pie - Almond cake', 
		'<p>Nam sit amet molestie ante. Morbi congue enim sed libero porta mattis. In sed porttitor risus. Mauris posuere ullamcorper venenatis.</p>', 
		'<p>Nullam nec diam ligula. Maecenas bibendum, lacus et posuere egestas, enim urna gravida tortor, eu egestas lectus metus vel enim. Nunc sodales purus elit, a porttitor elit pretium a. Duis feugiat nisl neque, ac porta nisl accumsan ac. Proin adipiscing sapien eget sollicitudin vehicula. Morbi quis lacus sodales, facilisis velit ut, pretium metus. Praesent scelerisque risus non nunc iaculis, a sagittis lorem consectetur. Pellentesque tincidunt nec lorem ornare venenatis. Maecenas varius orci ut magna dictum mattis. Vestibulum rhoncus lorem ac vehicula blandit. Etiam sed tincidunt odio, pulvinar commodo dui. Nulla facilisi. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 8
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Zebra cake - Strawberry tart', 
		'<p>Donec interdum metus id leo malesuada posuere. Quisque eu ultricies nisi. Fusce accumsan leo tristique, tempus eros vitae, ultricies dolor.</p>', 
		'<p>Nunc malesuada consectetur dui et ultrices. Proin id nisl venenatis, congue turpis non, semper ligula. Nullam a urna erat. Mauris porttitor rutrum interdum. Donec interdum metus id leo malesuada posuere. Quisque eu ultricies nisi. Fusce accumsan leo tristique, tempus eros vitae, ultricies dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque enim est, fringilla et eros in, sagittis porta elit. Nullam scelerisque ac felis a varius. Nam rhoncus urna est, eu lacinia erat aliquet ut. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 9
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Black forest cheesecake - Egg tart', 
		'<p>Praesent fermentum, tortor nec adipiscing feugiat, justo odio faucibus sem, vitae viverra tellus lorem ac lacus. Aenean eleifend semper ornare. </p>', 
		'<p>Praesent fermentum, tortor nec adipiscing feugiat, justo odio faucibus sem, vitae viverra tellus lorem ac lacus. Aenean eleifend semper ornare. Cras luctus lacus diam, quis eleifend purus rhoncus at. Sed purus turpis, laoreet in neque sed, malesuada tristique arcu. Quisque pulvinar odio tortor, ac viverra ipsum malesuada non. Mauris ornare faucibus eros sit amet luctus. Suspendisse potenti. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mattis, elit sed vestibulum pretium, leo nibh consectetur nulla, non vestibulum leo mi at nibh. Vestibulum vitae iaculis odio, ut rhoncus lorem. Praesent mattis quis orci ut aliquet. Nunc blandit, turpis sed aliquam adipiscing, sapien felis facilisis nisl, vel accumsan eros orci ac dui. Nulla convallis commodo tellus, at cursus neque posuere vel. Quisque pulvinar lorem sit amet vestibulum vestibulum. Sed mollis suscipit ante, ac egestas tortor rhoncus vel. Vivamus varius, ante et vulputate mollis, dui nisi porttitor nisl, quis molestie eros augue a nisi. </p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 10
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('King prawn bisque soup - Cinnamon and chili Churros ', 
		'<p>King prawn bisque soup with curry spiced tail. Cinnamon and chili Churros (spanish dougnuts) with chocolate sauce.</p>', 
		'<p>Maecenas semper diam quis vehicula sollicitudin. Aenean accumsan dui et turpis mattis iaculis non condimentum dui. Vivamus at facilisis enim. Vestibulum vel nibh et dolor fermentum consectetur. Aliquam erat volutpat. Phasellus id leo purus. Pellentesque id nisi ac tellus pulvinar volutpat. Cras lacinia dolor nec ullamcorper vestibulum. Proin ultricies suscipit tempus. Sed sollicitudin porta egestas. Nulla vel ipsum vitae nibh vehicula lobortis et id felis. Vivamus sit amet dapibus felis, non egestas elit. Nullam sed lorem augue. Nunc et nisl metus. .</p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);
-- 11
INSERT INTO articles(title, short_description, content, image, category, status, price) 
VALUES ('Chocolate cookies - Love candle cake - Chocolate leaf', 
		'<p>Vivamus varius condimentum sagittis. Nullam suscipit leo id adipiscing egestas. Duis quis nisl cursus, vehicula sapien sed, placerat augue. Sed sit amet egestas odio.</p>', 
		'<p>Integer nec elit at odio suscipit congue at vel mauris. Sed nec tellus vel dui imperdiet aliquam. Sed feugiat blandit tortor. Suspendisse metus lectus, fringilla a posuere ornare, fringilla et ligula. Cras nec pretium leo, eu semper tellus. Quisque quis nibh sed lacus vulputate dictum. Cras rutrum, turpis in consectetur placerat, magna purus sagittis mauris, non posuere nulla ipsum non lectus. Ut leo neque, pellentesque et pulvinar non, rutrum a risus. Nullam ultricies quam non cursus congue. Sed ullamcorper lacus vitae enim scelerisque ultricies. Aenean molestie quis lacus at mattis. Vivamus molestie facilisis velit, ut imperdiet nibh.</p>', 
		'images/page5-img2.jpg', 
		2, 2, 100.0);

-- SELECT * FROM articles LIMIT 2 OFFSET 4
