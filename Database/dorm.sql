-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dorm
CREATE DATABASE IF NOT EXISTS `dorm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `dorm`;

-- Dumping structure for table dorm.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_pass` varchar(30) DEFAULT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `post_I` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.admin: ~0 rows (approximately)

-- Dumping structure for table dorm.dorm
CREATE TABLE IF NOT EXISTS `dorm` (
  `dorm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dormName` varchar(50) DEFAULT NULL,
  `dormAddress` varchar(255) DEFAULT NULL,
  `dormPhone` varchar(20) DEFAULT NULL,
  `dormDistan` float NOT NULL,
  `billElec` float DEFAULT NULL,
  `billwater` float DEFAULT NULL,
  `dormAdditional` varchar(255) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `dormPriceAir` varchar(200) DEFAULT NULL,
  `dormPriceFan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dorm_id`) USING BTREE,
  KEY `photo_id` (`photo_id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.dorm: ~10 rows (approximately)
REPLACE INTO `dorm` (`dorm_id`, `dormName`, `dormAddress`, `dormPhone`, `dormDistan`, `billElec`, `billwater`, `dormAdditional`, `photo_id`, `review_id`, `dormPriceAir`, `dormPriceFan`) VALUES
	(1, 'คอนโดมอล', NULL, '064-5967 928', 1000, 4.5, 0, NULL, 0, 0, '5500', '-'),
	(2, 'พี เอ็น เรสซิเด้นท์', NULL, '065-4728 855', 1000, 8, 150, '-', 0, 0, '3600', '2600'),
	(3, 'การ์เดน โฮม', NULL, '081 9804 436', 1200, 7, 50, NULL, 0, 0, '3500', '2500'),
	(4, 'พูลสุข', NULL, '084 6229 515', 3200, 8, 60, NULL, 0, 0, '2800', '2300'),
	(5, 'คุณราตรี', NULL, '084 6618 905', 1300, 7, 100, NULL, 0, 0, '2900', '-'),
	(6, 'เกษร 3', NULL, '082 9853 519', 1200, 6, 0, NULL, 0, 0, '-', '2800'),
	(7, 'วชิรา', NULL, '0931805 227', 1800, 8, 100, NULL, 0, 0, '-', '2500'),
	(8, 'พาณิภัค', NULL, '081 9513 309', 3300, 8, 50, NULL, 0, 0, '-', '2000'),
	(9, 'วิโรจน์วิวสวย', NULL, '099 1846 358', 1100, 7, 80, NULL, 0, 0, '-', '-'),
	(10, 'ทาเคดะ', NULL, '081 0276 247', 600, 7, 100, NULL, 0, 0, '-', '-');

-- Dumping structure for table dorm.landlord
CREATE TABLE IF NOT EXISTS `landlord` (
  `landlord_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `drom_I` varchar(255) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`landlord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.landlord: ~1 rows (approximately)
REPLACE INTO `landlord` (`landlord_id`, `password`, `username`, `drom_I`, `email`, `firstname`, `lastname`) VALUES
	(3, 'admon', 'admon', NULL, 'dfa@gmail.com', 'ฟ', 'ฟ');

-- Dumping structure for table dorm.photo
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` mediumtext DEFAULT NULL,
  `dorm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `dorm_id` (`dorm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.photo: ~0 rows (approximately)

-- Dumping structure for table dorm.post
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_I` varchar(255) DEFAULT NULL,
  `landlond_I` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.post: ~0 rows (approximately)

-- Dumping structure for table dorm.review
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `star` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `drom_id` int(11) DEFAULT NULL,
  `reviwePeople` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `drom_id` (`drom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.review: ~2 rows (approximately)
REPLACE INTO `review` (`review_id`, `star`, `comment`, `reviewDate`, `drom_id`, `reviwePeople`) VALUES
	(1, NULL, NULL, NULL, 0, 0),
	(2, NULL, NULL, NULL, 0, 0);

-- Dumping structure for table dorm.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `review_I` varchar(255) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dorm.user: ~3 rows (approximately)
REPLACE INTO `user` (`user_id`, `username`, `password`, `review_I`, `email`, `firstname`, `lastname`) VALUES
	(6, 'Digimon', 'MM1', NULL, 'Digimon@gmail.com', 'Di', 'gi'),
	(7, 'adwad', '123', NULL, 'swd@gmail.com', 'da', 'da'),
	(8, 'admin', 'admin', NULL, 'swd@gmail.com', 'a', 'a');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
