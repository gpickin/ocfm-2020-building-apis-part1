-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.12 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table soapbox.bumps
CREATE TABLE IF NOT EXISTS `bumps` (
  `userId` int(10) unsigned NOT NULL,
  `rantId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`rantId`),
  KEY `fk_bumps_rantId` (`rantId`),
  CONSTRAINT `fk_bumps_rantId` FOREIGN KEY (`rantId`) REFERENCES `rants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bumps_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table soapbox.bumps: ~3 rows (approximately)
/*!40000 ALTER TABLE `bumps` DISABLE KEYS */;
INSERT INTO `bumps` (`userId`, `rantId`) VALUES
	(4, 2),
	(4, 3);
/*!40000 ALTER TABLE `bumps` ENABLE KEYS */;

-- Dumping structure for table soapbox.cfmigrations
CREATE TABLE IF NOT EXISTS `cfmigrations` (
  `name` varchar(190) NOT NULL,
  `migration_ran` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table soapbox.cfmigrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `cfmigrations` DISABLE KEYS */;
INSERT INTO `cfmigrations` (`name`, `migration_ran`) VALUES
	('2020_10_08_094411_create_users_table', '2020-10-09 09:25:45'),
	('2020_10_09_083256_create_rants_table', '2020-10-09 09:25:45'),
	('2020_10_09_105409_create_bumps_table', '2020-10-09 10:56:02'),
	('2020_10_09_105524_create_poops_table', '2020-10-09 10:56:02');
/*!40000 ALTER TABLE `cfmigrations` ENABLE KEYS */;

-- Dumping structure for table soapbox.poops
CREATE TABLE IF NOT EXISTS `poops` (
  `userId` int(10) unsigned NOT NULL,
  `rantId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`rantId`),
  KEY `fk_poops_rantId` (`rantId`),
  CONSTRAINT `fk_poops_rantId` FOREIGN KEY (`rantId`) REFERENCES `rants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poops_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table soapbox.poops: ~0 rows (approximately)
/*!40000 ALTER TABLE `poops` DISABLE KEYS */;
/*!40000 ALTER TABLE `poops` ENABLE KEYS */;

-- Dumping structure for table soapbox.rants
CREATE TABLE IF NOT EXISTS `rants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rants_userId` (`userId`),
  CONSTRAINT `fk_rants_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table soapbox.rants: ~3 rows (approximately)
/*!40000 ALTER TABLE `rants` DISABLE KEYS */;
INSERT INTO `rants` (`id`, `body`, `createdDate`, `modifiedDate`, `userId`) VALUES
	(2, 'test test test', '2020-10-09 10:18:13', '2020-10-09 10:18:14', 4),
	(3, 'rant rant rave rave', '2020-10-09 10:18:23', '2020-10-09 10:18:24', 4),
	(4, 'Jeff likes to talk', '2020-10-09 10:33:23', '2020-10-09 10:33:24', 5),
	(5, 'wxsxwsxwxws', '2020-10-14 16:13:41', '2020-10-14 16:13:41', 4),
	(6, 'Testing testing', '2020-10-14 16:13:56', '2020-10-14 16:13:56', 4);
/*!40000 ALTER TABLE `rants` ENABLE KEYS */;

-- Dumping structure for table soapbox.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table soapbox.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdDate`, `modifiedDate`) VALUES
	(4, 'gavin', 'gpickin@gmail.com', '$2a$12$35lSZ8hJI9S/WPhIhYerSOEQ8HQTMJi/FbkFiWHQy/pDlI.WAipUi', '2020-10-09 10:18:06', '2020-10-09 10:18:06'),
	(5, 'jeff', 'jeff@jeff.com', '$2a$12$TCGWNuz2UtrHMm1mGL9RneRfxIeEw48ROSAy/d4P6evbE6wM.uvu6', '2020-10-09 10:33:12', '2020-10-09 10:33:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
