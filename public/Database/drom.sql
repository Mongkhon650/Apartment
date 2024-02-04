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


-- Dumping database structure for drom
CREATE DATABASE IF NOT EXISTS `drom` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `drom`;

-- Dumping structure for table drom.addmin
CREATE TABLE IF NOT EXISTS `addmin` (
  `addmin_ID` varchar(255) DEFAULT NULL,
  `add_pass` varchar(255) DEFAULT NULL,
  `addmin_name` varchar(255) DEFAULT NULL,
  `post_I` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.addmin: ~0 rows (approximately)

-- Dumping structure for table drom.drom
CREATE TABLE IF NOT EXISTS `drom` (
  `dromID` varchar(255) NOT NULL,
  `dromName` varchar(255) DEFAULT NULL,
  `dromAddress` varchar(255) DEFAULT NULL,
  `dromPhone` varchar(255) DEFAULT NULL,
  `dromDistan` varchar(255) DEFAULT NULL,
  `billElec` varchar(255) DEFAULT NULL,
  `billwater` varchar(255) DEFAULT NULL,
  `dromAddidtonal` varchar(255) DEFAULT NULL,
  `photoID` int(11) DEFAULT NULL,
  `reviewID` int(11) DEFAULT NULL,
  PRIMARY KEY (`dromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.drom: ~10 rows (approximately)
REPLACE INTO `drom` (`dromID`, `dromName`, `dromAddress`, `dromPhone`, `dromDistan`, `billElec`, `billwater`, `dromAddidtonal`, `photoID`, `reviewID`) VALUES
	('1', 'คอนโดมอล', NULL, '064-5967 928', '1 km.', '4.5/หน่วย', '0', NULL, 0, 0),
	('10', 'ทาเคดะ', NULL, '081 0276 247', '600 m.', '7/หน่วย', '100/คน/เดือน', NULL, 0, 0),
	('2', 'พี เอ็น เรสซิเด้นท์', NULL, '065-4728 855', '1 km.', '8/หน่วย', '150/เดือน', '-', 0, 0),
	('3', 'การ์เดน โฮม', NULL, '081 9804 436', '1.2 km.', '7/หน่วย', '50/คน/เดือน', NULL, 0, 0),
	('4', 'พูลสุข', NULL, '084 6229 515', '3.2 km.', '8/หน่วย', '60/คน/เดือน', NULL, 0, 0),
	('5', 'คุณราตรี', NULL, '084 6618 905', '1.3  km.', '7/หน่วย', '100/คน/เดือน', NULL, 0, 0),
	('6', 'เกษร 3', NULL, '082 9853 519', '1.2 km', '6/หน่วย', '0', NULL, 0, 0),
	('7', 'วชิรา', NULL, '0931805 227', '1.8 km.', '8/หน่วย', '100/เดือน', NULL, 0, 0),
	('8', 'พาณิภัค', NULL, '081 9513 309', '3.3 km.', '8/หน่วย', '50/เดือน', NULL, 0, 0),
	('9', 'วิโรจน์วิวสวย', NULL, '099 1846 358', '1.1 km.', '7/หน่วย', '80/คน/เดือน', NULL, 0, 0);

-- Dumping structure for table drom.landlond
CREATE TABLE IF NOT EXISTS `landlond` (
  `landlond_ID` varchar(255) DEFAULT NULL,
  `password_l` varchar(255) DEFAULT NULL,
  `landlod_name` varchar(255) DEFAULT NULL,
  `drom_I` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.landlond: ~0 rows (approximately)

-- Dumping structure for table drom.photo
CREATE TABLE IF NOT EXISTS `photo` (
  `photoID` int(11) DEFAULT NULL,
  `Pic` mediumtext DEFAULT NULL,
  `dromID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.photo: ~0 rows (approximately)

-- Dumping structure for table drom.post
CREATE TABLE IF NOT EXISTS `post` (
  `post_ID` varchar(255) DEFAULT NULL,
  `user_I` varchar(255) DEFAULT NULL,
  `landlond_I` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.post: ~0 rows (approximately)

-- Dumping structure for table drom.review
CREATE TABLE IF NOT EXISTS `review` (
  `reviewID` int(11) DEFAULT NULL,
  `star` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `dromID` int(11) DEFAULT NULL,
  `reviwePeple` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.review: ~2 rows (approximately)
REPLACE INTO `review` (`reviewID`, `star`, `comment`, `reviewDate`, `dromID`, `reviwePeple`) VALUES
	(0, NULL, NULL, NULL, 0, 0),
	(12, NULL, NULL, NULL, 0, 0);

-- Dumping structure for table drom.user
CREATE TABLE IF NOT EXISTS `user` (
  `User_ID` varchar(255) DEFAULT NULL,
  `User_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `review_I` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table drom.user: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
