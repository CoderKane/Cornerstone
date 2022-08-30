-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dawgs
CREATE DATABASE IF NOT EXISTS `dawgs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dawgs`;

-- Dumping structure for table dawgs.breeds
CREATE TABLE IF NOT EXISTS `breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dawgs.breeds: ~3 rows (approximately)
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` (`id`, `name`) VALUES
	(1, 'Boxer'),
	(2, 'Labrador Retriever'),
	(3, 'Mixed');
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;

-- Dumping structure for table dawgs.dogs
CREATE TABLE IF NOT EXISTS `dogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `breed` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'UNKNOWN',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dawgs.dogs: ~6 rows (approximately)
/*!40000 ALTER TABLE `dogs` DISABLE KEYS */;
INSERT INTO `dogs` (`id`, `breed`, `name`) VALUES
	(1, 1, 'Fred'),
	(2, 2, 'Roxy'),
	(3, 2, 'Semper'),
	(4, 3, 'Bronchito'),
	(5, 3, 'Fonz'),
	(6, 3, 'Triton');
/*!40000 ALTER TABLE `dogs` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
