-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for travelagency
CREATE DATABASE IF NOT EXISTS `travelagency` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travelagency`;

-- Dumping structure for table travelagency.administration
CREATE TABLE IF NOT EXISTS `administration` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.administration: ~1 rows (approximately)
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` (`admin_id`, `admin_name`, `admin_password`) VALUES
	(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;

-- Dumping structure for table travelagency.arrangement
CREATE TABLE IF NOT EXISTS `arrangement` (
  `arrangement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arrangement_title` varchar(50) DEFAULT NULL,
  `arrangement_description` varchar(10000) NOT NULL,
  `accommodation_type` char(50) NOT NULL,
  `room_type` char(50) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `transport_type` char(50) NOT NULL,
  `accommodation_img` varchar(255) NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `guide_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`arrangement_id`) USING BTREE,
  KEY `FK_arrangement_destination` (`destination_id`),
  KEY `FK_arrangement_guides` (`guide_id`),
  CONSTRAINT `FK_arrangement_destination` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`destination_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_arrangement_guides` FOREIGN KEY (`guide_id`) REFERENCES `guides` (`guide_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.arrangement: ~3 rows (approximately)
/*!40000 ALTER TABLE `arrangement` DISABLE KEYS */;
INSERT INTO `arrangement` (`arrangement_id`, `arrangement_title`, `arrangement_description`, `accommodation_type`, `room_type`, `check_in`, `check_out`, `price`, `transport_type`, `accommodation_img`, `destination_id`, `guide_id`) VALUES
	(7, 'Vila "Ema"', 'description', 'apartment', '1/4', '2021-02-25 09:00:00', '2021-02-27 19:00:00', 3000, 'bus', 'room.jpg', 1, 1),
	(8, '"Holidays"', 'description description description description', 'hotel', '1/6', '2020-12-29 09:00:00', '2020-12-29 09:00:00', 4000, 'bus', 'hotel.jpg', 3, 1),
	(10, '"Sky"', 'description description description', 'hostel', '1/3', '2021-02-20 09:00:00', '2021-02-20 09:00:00', 15000, 'bus', 'hostel.jpg', 1, 4);
/*!40000 ALTER TABLE `arrangement` ENABLE KEYS */;

-- Dumping structure for table travelagency.blog_post
CREATE TABLE IF NOT EXISTS `blog_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_title` char(255) NOT NULL,
  `post_text` varchar(10000) NOT NULL DEFAULT '',
  `post_img` varchar(255) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.blog_post: ~3 rows (approximately)
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` (`post_id`, `post_title`, `post_text`, `post_img`) VALUES
	(3, 'New year s eve', 'Chinese New Year, also known as Lunar New Year or Spring Festival, is China is most important festival. It is time for families to be together and a week of an official public holiday. In popular Chinese astrology, Chinese New Year (Spring Festival) is important. Chinese New Year is celebrated for sixteen days (from Chinese New Years Eve \nto the Lantern Festival). The preparations start seven days before Chinese \nNew Years Eve. Many celebration activities for this period are traditional \ncustoms, but some are quite new.Chinese New Year, also known as Lunar New Year or Spring Festival, is China is most important festival. It is time for families to be together and a week of an official public holiday. In popular Chinese astrology, Chinese New Year (Spring Festival) is important. Chinese New Year is celebrated for sixteen days (from Chinese New Years Eve \nto the Lantern Festival). The preparations start seven days before Chinese \nNew Years Eve. Many celebration activities for this period are traditional \ncustoms, but some are quite new...', 'firework.jpg'),
	(5, 'Maldives - great destination', 'In 2020, the COVID-19 pandemic dominated the global conversation - and rightfully so. Travelers from all over the world had to press pause on their travel vacations as borders closed and flights stopped operations.Comprising a territory spanning roughly 298 square kilometres (115 sq mi), Maldives is one of the worlds most geographically \ndispersed sovereign states as well as the smallest Asian country by land area and population, with around 515,696 inhabitants. Malé is the capital and the most populated city, traditionally called the "Kings Island" where the ancient royal dynasties ruled for its central location. In 2020, the COVID-19 pandemic dominated the global conversation - and rightfully so. Travelers from all over the world had to press pause on their travel vacations as borders closed and flights stopped operations.Comprising a territory spanning roughly 298 square kilometres (115 sq mi), Maldives is one of the worlds most geographically dispersed sovereign states as well as the smallest Asian country by land area and population, with around 515,696 inhabitants. Malé is the capital and the most populated city, traditionally called the "Kings Island" where the ancient royal dynasties ruled for its central location.', 'maldives.jpg'),
	(6, 'OHRID ROAD TRIP', 'Ohrid (Macedonian: Охрид is a city in North Macedonia and the seat of the Ohrid Municipality. It is the largest city on Lake Ohrid and the eighth-largest city in the country, with over 42,000 inhabitants as of 2002. Ohrid once had 365 churches, one for each day of the year, and has been referred to as a "Jerusalem of the Balkans". The city is rich in picturesque houses and monuments, and tourism is predominant. Ohrid is a city in North Macedonia and the seat of the Ohrid Municipality. It is the largest city on Lake Ohrid and the eighth-largest city in the country, with over 42,000 inhabitants as of 2002. Ohrid once had 365 churches, one for each day of the year, and has been referred to as a "Jerusalem of the Balkans".', 'ohrid.jpg');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;

-- Dumping structure for table travelagency.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_title` char(50) NOT NULL,
  PRIMARY KEY (`category_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_title`) VALUES
	('spring'),
	('summer'),
	('winter');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table travelagency.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` char(50) NOT NULL,
  `last_name` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `phone` int(10) unsigned NOT NULL DEFAULT 0,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.contact: ~4 rows (approximately)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`contact_id`, `first_name`, `last_name`, `email`, `phone`, `message`) VALUES
	(2, 'Nikola', 'Naumoski', 'nikola@nikola', 255, 'Zdravo'),
	(3, 'Emilija', 'Aceska', 'ema@ema', 255, 'Hey'),
	(4, 'Petar', 'Dimoski', 'petar@petar', 255, 'Hello'),
	(9, 'Emilija', 'Aceska', 'ema@ema', 1234565, 'hi');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table travelagency.destination
CREATE TABLE IF NOT EXISTS `destination` (
  `destination_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination_name` char(50) NOT NULL,
  `destination_desc` varchar(10000) NOT NULL,
  `destination_img` varchar(255) NOT NULL,
  `subcategory_title` char(50) NOT NULL,
  `category_title` char(50) NOT NULL,
  PRIMARY KEY (`destination_id`),
  UNIQUE KEY `Index 4` (`destination_name`),
  KEY `FK_destination_category` (`category_title`),
  KEY `FK_destination_subcategory` (`subcategory_title`),
  CONSTRAINT `FK_destination_category` FOREIGN KEY (`category_title`) REFERENCES `category` (`category_title`) ON UPDATE CASCADE,
  CONSTRAINT `FK_destination_subcategory` FOREIGN KEY (`subcategory_title`) REFERENCES `subcategory` (`subcategory_title`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.destination: ~5 rows (approximately)
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` (`destination_id`, `destination_name`, `destination_desc`, `destination_img`, `subcategory_title`, `category_title`) VALUES
	(1, 'BEROVO', 'Berovo (Macedonian: Берово) is a small town near the Maleševo Mountains, 161 km (100 mi)  from Skopje, 47 km (29 mi) from Strumica and 52 km (32 mi) from Kočani, in North Macedonia.  It is the seat of Berovo Municipality. .', 'berovo.jpg', 'early summer', 'summer'),
	(3, 'BITOLA', 'Bitola (Macedonian: Битола) is a city in the southwestern part of North Macedonia.  It is located in the southern part of the Pelagonia valley, surrounded by the Baba,  Nidže and Kajmakčalan mountain ranges..', 'bitola.jpg', 'early summer', 'summer'),
	(4, 'PRILEP', 'Prilep (Macedonian: Прилеп) is the fourth-largest city in North Macedonia. It has a population of 66,246 and is known as "the city under Markos Towers"  because of its proximity to the towers of Prince Marko...', 'prilep.jpg', 'spring break', 'spring'),
	(5, 'OHRID', 'Ohrid (Macedonian: Охрид) is a city in North Macedonia and the seat of the Ohrid Municipality. It is the largest city on Lake Ohrid and the eighth-largest city in the country, with over 42,000 inhabitants as of 2002. Ohrid once had 365 churches..', 'ohrid.jpg', 'hot summer', 'summer'),
	(8, 'STRUGA', 'Struga (Macedonian: Струга) is a town and popular tourist destination situated in the south-western region of North Macedonia,  lying on the shore of Lake Ohrid. The town of Struga is the seat of Struga Municipality.', 'struga.jpg', 'snow advantures', 'winter');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;

-- Dumping structure for table travelagency.guides
CREATE TABLE IF NOT EXISTS `guides` (
  `guide_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `spoken_language` varchar(50) NOT NULL,
  `guide_img` varchar(255) NOT NULL,
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.guides: ~6 rows (approximately)
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` (`guide_id`, `first_name`, `last_name`, `spoken_language`, `guide_img`) VALUES
	(1, 'Nina', 'Smith', 'english', 'nina.jpg'),
	(3, 'Johs', 'Jones', 'italian', 'josh.jpg'),
	(4, 'Nick', 'Miller', 'french', 'nick.jpg'),
	(6, 'Lara', 'Johnson', 'spanish', 'lara.jpg'),
	(10, 'Petar', 'Dimoski', 'spanish', 'josh.jpg'),
	(11, 'Nikola', 'Dimoski', 'spanish', 'nina.jpg');
/*!40000 ALTER TABLE `guides` ENABLE KEYS */;

-- Dumping structure for table travelagency.subcategory
CREATE TABLE IF NOT EXISTS `subcategory` (
  `subcategory_title` char(50) NOT NULL,
  PRIMARY KEY (`subcategory_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travelagency.subcategory: ~4 rows (approximately)
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` (`subcategory_title`) VALUES
	('early summer'),
	('hot summer'),
	('snow advantures'),
	('spring break');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;

-- Dumping structure for procedure travelagency._deleteArrangement
DELIMITER //
CREATE PROCEDURE `_deleteArrangement`(
	IN `pk_value` INT(10)
)
BEGIN
DELETE FROM arrangement WHERE arrangement_id=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteBlogPost
DELIMITER //
CREATE PROCEDURE `_deleteBlogPost`(
	IN `pk_value` INT(10)
)
BEGIN
DELETE FROM blog_post WHERE post_id=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteCategory
DELIMITER //
CREATE PROCEDURE `_deleteCategory`(
	IN `pk_value` CHAR(50)
)
BEGIN
DELETE FROM category WHERE category_title=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteContact
DELIMITER //
CREATE PROCEDURE `_deleteContact`(
	IN `pk_value` INT(10)
)
BEGIN
DELETE FROM contact WHERE contact_id=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteDestination
DELIMITER //
CREATE PROCEDURE `_deleteDestination`(
	IN `pk_value` INT(10)
)
BEGIN
DELETE FROM destination WHERE destination_id=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteGuides
DELIMITER //
CREATE PROCEDURE `_deleteGuides`(
	IN `pk_value` INT(10)
)
BEGIN
DELETE FROM guides WHERE guide_id=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._deleteSubcategory
DELIMITER //
CREATE PROCEDURE `_deleteSubcategory`(
	IN `pk_value` CHAR(50)
)
BEGIN
DELETE FROM subcategory WHERE subcategory_title=pk_value;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertArrangement
DELIMITER //
CREATE PROCEDURE `_insertArrangement`(
	IN `arrangement_id_new` INT(10),
	IN `arrangement_title_new` VARCHAR(50),
	IN `arrangement_description_new` VARCHAR(10000),
	IN `accommodation_type_new` CHAR(50),
	IN `room_type_new` CHAR(50),
	IN `check_in_new` DATETIME,
	IN `check_out_new` DATETIME,
	IN `price_new` INT(10),
	IN `transport_type_new` CHAR(50),
	IN `accommodation_img_new` VARCHAR(255),
	IN `destination_id_new` INT(10),
	IN `guide_id_new` INT(10)
)
BEGIN
INSERT INTO arrangement(arrangement_id,arrangement_title,arrangement_description,accommodation_type,room_type,check_in,check_out,price,transport_type,accommodation_img,destination_id,guide_id)
VALUES(arrangement_id_new,arrangement_title_new,arrangement_description_new,accommodation_type_new,room_type_new,check_in_new,check_out_new,price_new,transport_type_new,accommodation_img_new,destination_id_new,guide_id_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertBlogPost
DELIMITER //
CREATE PROCEDURE `_insertBlogPost`(
	IN `post_id_new` INT(10),
	IN `post_title_new` CHAR(255),
	IN `post_text_new` VARCHAR(10000),
	IN `post_img_new` VARCHAR(255)
)
BEGIN
INSERT INTO blog_post(post_id,post_title,post_text,post_img)
VALUES(post_id_new,post_title_new,post_text_new,post_img_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertCategory
DELIMITER //
CREATE PROCEDURE `_insertCategory`(
	IN `category_title_new` CHAR(50)
)
BEGIN
INSERT INTO category(category_title)
VALUES(category_title_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertContact
DELIMITER //
CREATE PROCEDURE `_insertContact`(
	IN `contact_id_new` INT(10),
	IN `first_name_new` CHAR(50),
	IN `last_name_new` CHAR(50),
	IN `email_new` CHAR(50),
	IN `phone_new` INT(10),
	IN `message_new` VARCHAR(255)
)
BEGIN
INSERT INTO contact(contact_id,first_name,last_name,email,phone,message)
VALUES(contact_id_new,first_name_new,last_name_new,email_new,phone_new,message_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertDestination
DELIMITER //
CREATE PROCEDURE `_insertDestination`(
	IN `destination_id_new` INT(10),
	IN `destination_name_new` CHAR(50),
	IN `destination_desc_new` VARCHAR(10000),
	IN `destination_img_new` VARCHAR(255),
	IN `subcategory_title_new` CHAR(50),
	IN `category_title_new` CHAR(50)
)
BEGIN
INSERT INTO destination(destination_id,destination_name,destination_desc,destination_img,subcategory_title,category_title)
VALUES(destination_id_new,destination_name_new,destination_desc_new,destination_img_new,subcategory_title_new,category_title_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertGuides
DELIMITER //
CREATE PROCEDURE `_insertGuides`(
	IN `guide_id_new` INT(10),
	IN `first_name_new` VARCHAR(50),
	IN `last_name_new` VARCHAR(50),
	IN `spoken_language_new` VARCHAR(50)
)
BEGIN
INSERT INTO guides(guide_id,first_name,last_name,spoken_language)
VALUES(guide_id_new,first_name_new,last_name_new,spoken_language_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._insertSubcategory
DELIMITER //
CREATE PROCEDURE `_insertSubcategory`(
	IN `subcategory_title_new` CHAR(50)
)
BEGIN
INSERT INTO subcategory(subcategory_title)
VALUES(subcategory_title_new);
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectArrangement
DELIMITER //
CREATE PROCEDURE `_selectArrangement`()
BEGIN
SELECT * FROM arrangement INNER JOIN destination ON arrangement.destination_id=destination.destination_id
INNER JOIN guides ON arrangement.guide_id=guides.guide_id;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectBlogPost
DELIMITER //
CREATE PROCEDURE `_selectBlogPost`()
BEGIN
SELECT * FROM blog_post;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectCategory
DELIMITER //
CREATE PROCEDURE `_selectCategory`()
BEGIN
SELECT * FROM category;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectContact
DELIMITER //
CREATE PROCEDURE `_selectContact`()
BEGIN
SELECT * FROM contact;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectDestination
DELIMITER //
CREATE PROCEDURE `_selectDestination`()
BEGIN
SELECT * FROM destination INNER JOIN subcategory ON destination.subcategory_title=subcategory.subcategory_title
INNER JOIN category ON destination.category_title=category.category_title;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectGuides
DELIMITER //
CREATE PROCEDURE `_selectGuides`()
BEGIN
SELECT * FROM guides;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._selectSubcategory
DELIMITER //
CREATE PROCEDURE `_selectSubcategory`()
BEGIN
SELECT * FROM subcategory;
END//
DELIMITER ;

-- Dumping structure for procedure travelagency._updateGuides
DELIMITER //
CREATE PROCEDURE `_updateGuides`(
	IN `first_name_new` CHAR(50),
	IN `last_name_new` CHAR(50),
	IN `spoken_language_new` CHAR(50),
	IN `pk_value` INT(10)
)
BEGIN
UPDATE guides SET first_name=first_name_new,last_name=last_name_new,spoken_language=spoken_language_new WHERE guide_id=pk_value;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
