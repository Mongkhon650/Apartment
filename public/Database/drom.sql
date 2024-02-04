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
CREATE DATABASE IF NOT EXISTS `drom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `drom`;

-- Dumping structure for table drom.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `Booking_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `dormitory_ID` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `room_ID` int(11) NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `user_ID` (`user_ID`),
  KEY `dormitory_ID` (`dormitory_ID`),
  KEY `room_ID` (`room_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table drom.booking: ~0 rows (approximately)

-- Dumping structure for table drom.dromitory
CREATE TABLE IF NOT EXISTS `dromitory` (
  `dromitory_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dromitoryName` varchar(50) NOT NULL,
  `dromitoryAddress` varchar(255) NOT NULL,
  `Contact` varchar(150) NOT NULL,
  `distantUP` int(11) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `dromitoryType` varchar(100) NOT NULL,
  PRIMARY KEY (`dromitory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table drom.dromitory: ~0 rows (approximately)

-- Dumping structure for table drom.landlord
CREATE TABLE IF NOT EXISTS `landlord` (
  `landlord_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username_l` varchar(30) NOT NULL,
  `PASSWORD_l` varchar(30) NOT NULL,
  `nameuser_l` varchar(50) NOT NULL,
  `dromitory_ID` int(11) NOT NULL,
  `contact_l` varchar(255) NOT NULL,
  PRIMARY KEY (`landlord_ID`),
  KEY `dromitory_ID` (`dromitory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table drom.landlord: ~0 rows (approximately)

-- Dumping structure for table drom.room
CREATE TABLE IF NOT EXISTS `room` (
  `room_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dromitory_ID` int(11) NOT NULL,
  `roomNumber` varchar(400) NOT NULL,
  `roomPrice` int(11) NOT NULL,
  `roomStatus` varchar(50) NOT NULL,
  `roomType` varchar(255) NOT NULL,
  `roomDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_ID`),
  KEY `dromitory_ID` (`dromitory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table drom.room: ~0 rows (approximately)

-- Dumping structure for table drom.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  `nameuser` varchar(50) NOT NULL,
  `userContact` varchar(255) NOT NULL,
  `userBooking` varchar(255) NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table drom.user: ~1 rows (approximately)
REPLACE INTO `user` (`user_ID`, `username`, `PASSWORD`, `nameuser`, `userContact`, `userBooking`) VALUES
	(1, 'Johny123', '1234', 'John', '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
