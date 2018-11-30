-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: HeadBeatDB
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `text` varchar(300) COLLATE utf8_polish_ci NOT NULL,
  `tweet_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2occdyecvmxwqjm9eu28a9x3n` (`tweet_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  CONSTRAINT `FK2occdyecvmxwqjm9eu28a9x3n` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2018-11-30 10:08:18.217000','Nice review, hoping to test them soon.',2,4),(2,'2018-11-30 11:03:16.018000','I agree completely, great review!',8,4),(3,'2018-11-30 11:54:50.496000','Thanks, we can make some sort of a deal if you want :)',2,2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headphones`
--

DROP TABLE IF EXISTS `headphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headphones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headphones`
--

LOCK TABLES `headphones` WRITE;
/*!40000 ALTER TABLE `headphones` DISABLE KEYS */;
INSERT INTO `headphones` VALUES (1,'Audeze','LCD-2','https://images-na.ssl-images-amazon.com/images/I/81o0PAuncdL._SX425_.jpg'),(2,'Sennheiser','HD600','https://image.ceneostatic.pl/data/products/217670/i-sennheiser-hd600-czarny.jpg'),(3,'Sennheiser','Momentum 2','https://4.allegroimg.com/s512/03525e/5e0da12f48688b68d6a51b55a4c4'),(4,'Sennheiser','HD700','https://ecsmedia.pl/c/sluchawki-sennheiser-hd700-w-iext48579336.jpg'),(5,'Phillips','Fidelio X2','https://images-na.ssl-images-amazon.com/images/I/71fSPqwwVKL._SX425_.jpg'),(6,'MrSpeakers','Ether',' https://www.analogueseduction.net/user/products/large/mrspeakers-ether-headphones.jpg'),(7,'Focal','Elear',' https://www.soundandvision.com/images/styles/600_wide/public/117focal.promo_.jpg'),(8,'AKG','k812',' https://image.ceneostatic.pl/data/products/33268584/i-akg-k-812-k812.jpg'),(9,'Audioquest','Nighthawk',' https://images-na.ssl-images-amazon.com/images/I/71VMANPnOQL._SX355_.jpg'),(10,'Audioquest','Nightowl',' https://cdn.shopify.com/s/files/1/0875/3864/products/aq-nightowl_02.jpg?v=1517293211'),(11,'Audeze','Mobius','https://tse4.mm.bing.net/th?id=OIP.4QZsOGirR277_rQCeTDe0gHaHa&pid=Api'),(12,'Stax','L700','https://tse3.mm.bing.net/th?id=OIP.6bAFinKo437HggLGrXwbwwHaHa&pid=Api'),(13,'Sennheiser','Orpheus','https://tse1.mm.bing.net/th?id=OIP.MXKDKGbfyse9ArYAMVh29QHaEr&pid=Api'),(14,'Sonus Faber','Pryma','https://tse1.mm.bing.net/th?id=OIP.rCE5ioTT_QDq5DVr0likTQHaHa&pid=Api'),(15,'Denon','AH-MM400','https://tse1.mm.bing.net/th?id=OIP.kPHYzsPEJjc_ju_MGgzLBgHaHa&pid=Api'),(16,'Focal','Utopia','https://tse2.mm.bing.net/th?id=OIP.eVdwuAOnKoyEuJZh9KTXDAHaHa&pid=Api'),(17,'Focal','Elegia','https://tse3.mm.bing.net/th?id=OIP.UWnDjultFP4rF9AnxKjo6wHaE8&pid=Api'),(18,'Audeze','LCD-4','https://tse2.mm.bing.net/th?id=OIP.SylGNFT4ddijhnwjAMjEHQHaHa&pid=Api'),(19,'Audeze','LCD-XC','https://tse2.mm.bing.net/th?id=OIP.ld6gk1hYW72wmM5x_t8lowHaHa&pid=Api'),(20,'Oppo','PM-1','https://tse3.mm.bing.net/th?id=OIP.xwDNLKsajejGMhclB8TR9QHaFi&pid=Api'),(21,'Bowers & Wilkins','PX','https://tse1.mm.bing.net/th?id=OIP.bwjN-MEt5ytJ0_yG5ye72wHaHa&pid=Api'),(22,'Sennheiser','HD650','https://tse2.mm.bing.net/th?id=OIP.c_wU_0LPebcirO_H_sMi6wHaIZ&pid=Api'),(23,'Stax','SR-009','https://tse3.mm.bing.net/th?id=OIP.9oE4RFsTJ_2_7GKyXaTY3wHaF_&pid=Api'),(24,'Final Audio Design','Sonorous X','https://tse3.mm.bing.net/th?id=OIP.gW-5Gon8LU-cbeZ1Paka7wHaHa&pid=Api'),(25,'Kennerton','Odin','https://tse4.mm.bing.net/th?id=OIP.SKvbz37tOAtDso7wCXsudAHaJn&pid=Api'),(26,'Beyerdynamic','T1','https://tse4.mm.bing.net/th?id=OIP.3or_WVp5ezTneQWjj6N4lwHaJX&pid=Api'),(27,'Meze','99 Classics','https://tse1.mm.bing.net/th?id=OIP.TuVk6CFVNiH47reiT7FO4AHaHa&pid=Api'),(28,'AKG','Q701','https://tse4.mm.bing.net/th?id=OIP.-H2RE09HA2s6K76sB4CCJQHaHa&pid=Api'),(29,'Sennheiser','HD599','https://tse1.mm.bing.net/th?id=OIP.nFHG00tuXcysW7heFkXzFgHaHa&pid=Api');
/*!40000 ALTER TABLE `headphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `offered_id` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `requested_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlbd1wrwm0ncrwy2lq10howu5j` (`offered_id`),
  KEY `FKiqfesiqqt5yamg0qnppfko7xu` (`receiver_id`),
  KEY `FK61f28kubvvu9bopnq4okbeo0o` (`requested_id`),
  KEY `FKh2s1kqiwj122oc2p23cpiasjj` (`sender_id`),
  KEY `FKr8chjyae27m163aqqth5i6ywd` (`status_id`),
  CONSTRAINT `FK61f28kubvvu9bopnq4okbeo0o` FOREIGN KEY (`requested_id`) REFERENCES `headphones` (`id`),
  CONSTRAINT `FKh2s1kqiwj122oc2p23cpiasjj` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKiqfesiqqt5yamg0qnppfko7xu` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlbd1wrwm0ncrwy2lq10howu5j` FOREIGN KEY (`offered_id`) REFERENCES `headphones` (`id`),
  CONSTRAINT `FKr8chjyae27m163aqqth5i6ywd` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'2018-11-30 11:06:57.029000',5,4,9,2,4),(2,'2018-11-30 10:48:00.902000',3,7,27,2,1),(3,'2018-11-30 11:04:35.476000',20,5,10,4,2);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ownerships`
--

DROP TABLE IF EXISTS `ownerships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ownerships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owned` bit(1) NOT NULL,
  `headphone_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8i9vo14r8sxymtiocvjpt7mb3` (`headphone_id`),
  KEY `FKjj03jmosyj1ymg88r43jx0t02` (`user_id`),
  CONSTRAINT `FK8i9vo14r8sxymtiocvjpt7mb3` FOREIGN KEY (`headphone_id`) REFERENCES `headphones` (`id`),
  CONSTRAINT `FKjj03jmosyj1ymg88r43jx0t02` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ownerships`
--

LOCK TABLES `ownerships` WRITE;
/*!40000 ALTER TABLE `ownerships` DISABLE KEYS */;
INSERT INTO `ownerships` VALUES (1,_binary '',14,1),(2,_binary '',15,1),(3,_binary '',16,1),(4,_binary '',17,1),(5,_binary '',18,1),(6,_binary '',19,1),(7,_binary '',20,1),(8,_binary '',21,1),(9,_binary '',22,1),(10,_binary '',23,1),(11,_binary '',24,1),(12,_binary '',25,1),(13,_binary '',26,1),(14,_binary '',27,1),(15,_binary '',28,1),(16,_binary '',29,1),(17,_binary '',5,2),(18,_binary '',3,2),(19,_binary '',1,2),(20,_binary '',2,4),(21,_binary '',9,4),(22,_binary '',20,4),(23,_binary '',10,5),(24,_binary '',28,5),(25,_binary '',21,5),(26,_binary '',29,6),(27,_binary '',2,6),(28,_binary '',3,6),(29,_binary '',1,7),(30,_binary '',4,7),(31,_binary '',27,7),(32,_binary '',26,8),(33,_binary '',28,8),(34,_binary '',14,8),(35,_binary '\0',9,2),(36,_binary '\0',5,4);
/*!40000 ALTER TABLE `ownerships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  `headphone_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ba211iv71qsnfipjfu4o4prd` (`headphone_id`),
  CONSTRAINT `FK6ba211iv71qsnfipjfu4o4prd` FOREIGN KEY (`headphone_id`) REFERENCES `headphones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,8,3),(2,9,5),(3,9,9),(4,7,20),(5,7,28),(6,6,10),(7,7,3),(8,8,2),(9,3,27),(10,10,1),(11,9,4),(12,6,28),(13,3,14),(14,7,26);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Waiting for approval'),(2,'Approved'),(3,'Declined'),(4,'Finished loan');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `rating` float NOT NULL,
  `review` varchar(500) COLLATE utf8_polish_ci NOT NULL,
  `headphone_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5osagm5g95qb4viw42csrs5jr` (`headphone_id`),
  KEY `FK9odscmo3fq7rii8oa7vqgk54r` (`offer_id`),
  KEY `FKgclwpsnjft4s6umfjopgcp051` (`user_id`),
  CONSTRAINT `FK5osagm5g95qb4viw42csrs5jr` FOREIGN KEY (`headphone_id`) REFERENCES `headphones` (`id`),
  CONSTRAINT `FK9odscmo3fq7rii8oa7vqgk54r` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `FKgclwpsnjft4s6umfjopgcp051` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'2018-11-30 10:02:14.743000',8,'Good instrument separation, lacks soundstage (since it\'s a closed design). Very musical with a lot of bass.',3,NULL,2),(2,'2018-11-30 10:02:59.045000',9,'Very good soundstage, with a lot of deep and powerful bass. Recessed mids. Easy to drive.',5,NULL,2),(3,'2018-11-30 10:06:57.836000',9,'Needs a LOT of burning in (~300hr). Sounds very unusual, on the dark side, with a bit of reverb sound.',9,NULL,4),(4,'2018-11-30 10:07:48.471000',7,'Didn\'t like them much given their price. These sound very balanced and clear overall.',20,NULL,4),(5,'2018-11-30 10:11:49.217000',7,'Nice soundstage, very balanced headphone. Lacks a bit of subbase thump.',28,NULL,5),(6,'2018-11-30 10:12:47.325000',6,'Was expecting something spectacular (like the Nighthawks), however with its closed design, the NightOwls have a lot of competition to surpass.',10,NULL,5),(7,'2018-11-30 10:19:32.620000',7,'Fun and fashion headphone in general. Rolled off highs, strong bass thump. Not my style.',3,NULL,6),(8,'2018-11-30 10:21:13.025000',8,'Intimate soundstage, beautiful mids and bass, rolled off highs. Tube-like sound signature. Quite difficult to drive.',2,NULL,6),(9,'2018-11-30 10:23:42.961000',3,'Didn\'t like them at all. Price seems to justify only the design of the headphones, not their sound quality.',27,NULL,7),(10,'2018-11-30 10:24:30.009000',10,'Beautiful bass and mids, tube-like, rolled off highs. Nice soundstage and clarity. These seem to excell with a nice tube-amp.',1,NULL,7),(11,'2018-11-30 10:25:04.348000',9,'Very big soundstage, with a lot of clarity and detail. Hard to drive.',4,NULL,7),(12,'2018-11-30 10:27:22.429000',6,'Wide soundstage with a lot of detail and separation. Not much to praise in terms of bass.',28,NULL,8),(13,'2018-11-30 10:28:18.080000',3,'Mainly a fashion headphone. Sound-wise not much to talk about. Barely an average sounding headphone.',14,NULL,8),(14,'2018-11-30 10:28:59.348000',7,'Very V-shaped sound signature with recessed mids. Not much of a audiophile headphone.',26,NULL,8);
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_2p58gbqhxvue2igoderm0gh2c` (`telephone`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.pl','admin','admin','$2a$10$tA3sb2DsnRde2sALn/Ej.eBu7Lc1JiNTrV32RERdV0zpm/GoJDVMS','111111111','admin'),(2,'Some address','tomekL@mail.pl','Tom','L','$2a$10$SQEQXtiWQFfS1EfFDAoaOuDwxZr1OPei6IPBpmOiKowTKcCVnA.iW','987654321','TomL'),(3,'Elvis Street','Elvis@mail.pl','Elvis','Presley','$2a$10$EcEifUw9l9QhPNjT7lpQs.x3PvZrZaToJPbR9thz6GSX8lfIuEFOC','123123123','ElvisPresley'),(4,'Joke Street','ChuckNorris@mail.pl','Chuck','Norris','$2a$10$yjPtLKsfAN5BVw2jzQume.Yfep4Q/SkHKpfZJSCbDdaPXvPy76sPK','456456456','ChuckNorris'),(5,'Test Street','test@mail.pl','Test','Test','$2a$10$Y/7A9RSr8/7f6eQMd6GTmudQrxBrzcjfkRlhbyY8BrkdKkytWLpzK','789789789','Tester'),(6,'Best Street','BestReviewer@mail.pl','Best','Reviewer','$2a$10$4XEFhjSwmi.h8gcYPe0LXOuR.FEq.Z1DF20Wv0/doSFEHXr.veXHy','321321321','BestReviewer'),(7,'Guru Street','Guru@mail.pl','Headphone','Guru','$2a$10$eymQ4XsA/xrW5P5zFoS3TuAIMbtBLsdqb7R3d.vhek1vX4mGzdNdC','654654654','HeadphoneGuru'),(8,'Audio Street','Audio@mail.pl','Audio','Master','$2a$10$aDEoWdDziLxqvF4XWSgBH.0yxJtWpU1F/8CbkQj6mOtcIkableDWi','321456789','AudioMaster');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_users`
--

DROP TABLE IF EXISTS `users_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_users` (
  `User_id` bigint(20) NOT NULL,
  `observedUsers_id` bigint(20) NOT NULL,
  KEY `FKqhytcau1xw9kutlh6orjvg054` (`observedUsers_id`),
  KEY `FKptmgc6xtyvepmgqqse94fif1g` (`User_id`),
  CONSTRAINT `FKptmgc6xtyvepmgqqse94fif1g` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqhytcau1xw9kutlh6orjvg054` FOREIGN KEY (`observedUsers_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_users`
--

LOCK TABLES `users_users` WRITE;
/*!40000 ALTER TABLE `users_users` DISABLE KEYS */;
INSERT INTO `users_users` VALUES (8,2),(8,7),(8,3),(8,5),(2,8),(2,4),(2,3),(2,5),(2,7),(4,2),(4,3),(4,6),(4,5);
/*!40000 ALTER TABLE `users_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30 12:14:12
