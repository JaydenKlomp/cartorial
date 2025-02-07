# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.48-MariaDB-1~bionic)
# Database: fruitorialv2
# Generation Time: 2025-02-07 13:48:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cars`;

CREATE TABLE `cars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;

INSERT INTO `cars` (`id`, `brand`, `model`, `year`, `color`, `price`)
VALUES
	(1,'Porsche','Taycan Turbo GT',2020,'Blauw',250600.00),
	(2,'Porsche','911 Carrera GTS',2010,'Rood',239600.00),
	(3,'Porsche','Macan Turbo Electric',2019,'Zwart',121700.00),
	(4,'Porsche','Cayenne E-Hybrid',2024,'Grijs',120000.10),
	(5,'Porsche','Panamera GTS',2025,'Orangje',254100.00),
	(6,'Porsche','718 Boxter',2006,'Geel',110400.00),
	(7,'Porsche','718 Spyder RS',2023,'Wit',259000.00),
	(8,'Porsche','718 Cayman GT4 RS',2024,'Roze',264900.00),
	(11,'Tesla','Model S Plaid',2023,'Rood',114749.00),
	(12,'Tesla','Model X Plaid',2022,'Blauw',128657.00),
	(13,'Tesla','Model 3 Performance AWD',2024,'Wit',43743.00),
	(14,'Tesla','Model Y Performance AWD',2023,'Zwart',61190.00),
	(15,'Tesla','Cybertruck',2024,'Zilver',213544.00),
	(16,'Tesla','Model Y Long Range',2019,'Wit',56120.00),
	(17,'Tesla','Roadster',2025,'Rood',213980.00),
	(21,'BMW','M240i Coupe',2023,'Zwart',94032.00),
	(22,'BMW','M440i xDrive Gran Coupe',2022,'Grijs',107243.00),
	(23,'BMW','X5 M50',2024,'Zilver',237418.00),
	(24,'BMW','i7 M70 xDrive',2024,'Blauw',189880.00),
	(25,'BMW','Z4 M40i Roadster',2024,'Rood',98459.00),
	(26,'BMW','8 Serie Cabrio',2024,'Rood',149561.00),
	(27,'BMW','Vision M NEXT',2030,'Rood',123123.00),
	(28,'BMW','iX3 High Executive Edition',2024,'Wit',71000.00),
	(31,'Mercedes','AMG GT 4-Door Coupe',2023,'Wit',230533.00),
	(32,'Mercedes','S-Class Berline',2022,'Zwart',90124.00),
	(33,'Mercedes','S-Class Cabrio',2021,'Zilver',78523.00),
	(34,'Mercedes','S580e',2023,'Groen',123253.00),
	(35,'Mercedes','C205',2024,'Geel',173046.00),
	(41,'Toyota','Aygo X',2021,'Blauw',20395.00),
	(42,'Toyota','GR Yaris',2022,'Wit',85295.00),
	(43,'Toyota','Supra Mk3',1980,'Rood',120540.00),
	(44,'Toyota','Corolla Touring Sports',2024,'Zilver',34995.00),
	(45,'Toyota','BZ4X',2023,'Grijs',44140.00),
	(51,'Audi','A6 Sportback e-tron',2025,'Grijs',63990.00),
	(52,'Audi','S6 Avant e-tron',2025,'Zwart',101490.00),
	(53,'Audi','Q8 Sportback e-tron',2024,'Wit',213110.00),
	(54,'Audi','RS 3 Sportback',2024,'Zilver',111489.99),
	(55,'Audi','A6 Limousine TFSI e',2023,'Blauw',65990.00),
	(56,'Audi','RS Q8 Performance',2024,'Rood',260990.00),
	(61,'Volkswagen','Golf R',2024,'Blauw',85980.00),
	(62,'Volkswagen','Golf GTI',2025,'Rood',64990.00),
	(63,'Volkswagen','Jetta GLI',2020,'Grijs',32715.00),
	(64,'Volkswagen','ID.Buzz',2022,'Blauw',59995.00),
	(65,'Volkswagen','Arteon TDI',2017,'Wit',32540.00),
	(66,'Volkswagen','ID.7',2023,'Zwart',71540.00),
	(67,'Volkswagen','Touareg V10 TDI',2002,'Blauw',1920.00);

/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
