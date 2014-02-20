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

-- SELECT * FROM articles LIMIT 2 OFFSET 4
