-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: viecsinhvien3
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEFAULT_CATALOG` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32mubpubtaqu30n34bwl7xiis` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKranq0rweb0r6j31j565ak51g8` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_entry`
--

DROP TABLE IF EXISTS `catalog_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_entry` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `CATALOG_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5q8159i414r299kia2w9re90k` (`CATEGORY_ID`,`CATALOG_ID`),
  KEY `FKqp2j48hb3vodovb8gn2o4gox` (`CATALOG_ID`),
  CONSTRAINT `FK374wks7em54d0oghju0earttl` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKqp2j48hb3vodovb8gn2o4gox` FOREIGN KEY (`CATALOG_ID`) REFERENCES `catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_entry`
--

LOCK TABLES `catalog_entry` WRITE;
/*!40000 ALTER TABLE `catalog_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CATEGORY_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CATEGORY_IMAGE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CATEGORY_STATUS` bit(1) DEFAULT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEPTH` int DEFAULT NULL,
  `FEATURED` bit(1) DEFAULT NULL,
  `LINEAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `UK3mq9i6qmgquvoieslx39pej6x` (`MERCHANT_ID`,`CODE`),
  KEY `IDXlctdd0gcnad49kass3ntxv54n` (`LINEAGE`),
  KEY `FKn3kekntr7pm8g9v8ask698ato` (`PARENT_ID`),
  CONSTRAINT `FK8a09asq5fcx0a88i4m8nsixy` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKn3kekntr7pm8g9v8ask698ato` FOREIGN KEY (`PARENT_ID`) REFERENCES `category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (50,'2023-05-14 15:40:41','2023-05-14 15:40:41','ndlong2004@gmail.com',NULL,_binary '','parttime',0,_binary '','/50/',0,_binary '',2,NULL,''),(100,'2023-05-14 15:49:35','2023-05-14 15:49:37','ndlong2004@gmail.com',NULL,_binary '','remote',0,_binary '','/100/',0,_binary '',2,NULL,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CATEGORY_HIGHLIGHT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_TITLE` varchar(120) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEF_URL` varchar(120) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbuesqq6cyx7e5hy3mf30cfieq` (`CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FKl4j5boteutpu1p8f67kydpnmd` (`LANGUAGE_ID`),
  CONSTRAINT `FKa58u7d0ydfgref1iaux5efyov` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKl4j5boteutpu1p8f67kydpnmd` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LINK_REFERENCE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CV_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29y2yad2e110wxr9semu05vnv` (`CV_ID`),
  CONSTRAINT `FK29y2yad2e110wxr9semu05vnv` FOREIGN KEY (`CV_ID`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES ('5f403e4d-4e03-499e-b66f-a9d4310b40c0','www.404.com/1','Chá»©ng chá»‰ Ä‘a cáº¥p xuyÃªn lá»¥c Ä‘á»‹a','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `CONTENT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONTENT_POSITION` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTENT_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINK_TO_MENU` bit(1) DEFAULT NULL,
  `PRODUCT_GROUP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  UNIQUE KEY `UKt1v2ld0mrwviquqourql4uub0` (`MERCHANT_ID`,`CODE`),
  KEY `CODE_IDX` (`CODE`),
  CONSTRAINT `FKfmoi0fkjbtfty3o8fs94t11r1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_description`
--

DROP TABLE IF EXISTS `content_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEF_URL` varchar(120) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CONTENT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn0w5r7ctbp88r4rvk7ayklofm` (`CONTENT_ID`,`LANGUAGE_ID`),
  KEY `FK47yxf681u0rfw2kvarhqb0r3v` (`LANGUAGE_ID`),
  CONSTRAINT `FK47yxf681u0rfw2kvarhqb0r3v` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKk7fabfxn2flvcofwwpyg5sys` FOREIGN KEY (`CONTENT_ID`) REFERENCES `content` (`CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_description`
--

LOCK TABLES `content_description` WRITE;
/*!40000 ALTER TABLE `content_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `COUNTRY_ID` int NOT NULL,
  `COUNTRY_ISOCODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COUNTRY_SUPPORTED` bit(1) DEFAULT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `UK_dqb99v22pt27v0tgeqo958e6x` (`COUNTRY_ISOCODE`),
  KEY `FKd2q9e14kh1j6tm1gpbct2xwws` (`GEOZONE_ID`),
  CONSTRAINT `FKd2q9e14kh1j6tm1gpbct2xwws` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF',_binary '',NULL),(2,'AX',_binary '',NULL),(3,'AL',_binary '',NULL),(4,'DZ',_binary '',NULL),(5,'AS',_binary '',NULL),(6,'AD',_binary '',NULL),(7,'AO',_binary '',NULL),(8,'AI',_binary '',NULL),(9,'AG',_binary '',NULL),(10,'AR',_binary '',NULL),(11,'AM',_binary '',NULL),(12,'AW',_binary '',NULL),(13,'AU',_binary '',NULL),(14,'AT',_binary '',NULL),(15,'AZ',_binary '',NULL),(16,'BS',_binary '',NULL),(17,'BH',_binary '',NULL),(18,'BD',_binary '',NULL),(19,'BB',_binary '',NULL),(20,'BY',_binary '',NULL),(21,'BE',_binary '',NULL),(22,'BZ',_binary '',NULL),(23,'BJ',_binary '',NULL),(24,'BM',_binary '',NULL),(25,'BT',_binary '',NULL),(26,'BO',_binary '',NULL),(27,'BA',_binary '',NULL),(28,'BW',_binary '',NULL),(29,'BR',_binary '',NULL),(30,'IO',_binary '',NULL),(31,'BN',_binary '',NULL),(32,'BG',_binary '',NULL),(33,'BF',_binary '',NULL),(34,'BI',_binary '',NULL),(35,'KH',_binary '',NULL),(36,'CM',_binary '',NULL),(37,'CA',_binary '',NULL),(38,'CV',_binary '',NULL),(39,'KY',_binary '',NULL),(40,'CF',_binary '',NULL),(41,'TD',_binary '',NULL),(42,'CL',_binary '',NULL),(43,'CN',_binary '',NULL),(44,'CX',_binary '',NULL),(45,'CC',_binary '',NULL),(46,'CO',_binary '',NULL),(47,'KM',_binary '',NULL),(48,'CG',_binary '',NULL),(49,'CD',_binary '',NULL),(50,'CK',_binary '',NULL),(51,'CR',_binary '',NULL),(52,'CI',_binary '',NULL),(53,'HR',_binary '',NULL),(54,'CU',_binary '',NULL),(55,'CY',_binary '',NULL),(56,'CZ',_binary '',NULL),(57,'DK',_binary '',NULL),(58,'DJ',_binary '',NULL),(59,'DM',_binary '',NULL),(60,'DO',_binary '',NULL),(61,'EC',_binary '',NULL),(62,'EG',_binary '',NULL),(63,'SV',_binary '',NULL),(64,'GQ',_binary '',NULL),(65,'ER',_binary '',NULL),(66,'EE',_binary '',NULL),(67,'ET',_binary '',NULL),(68,'FK',_binary '',NULL),(69,'FO',_binary '',NULL),(70,'FJ',_binary '',NULL),(71,'FI',_binary '',NULL),(72,'FR',_binary '',NULL),(73,'GF',_binary '',NULL),(74,'PF',_binary '',NULL),(75,'GA',_binary '',NULL),(76,'GM',_binary '',NULL),(77,'GE',_binary '',NULL),(78,'DE',_binary '',NULL),(79,'GH',_binary '',NULL),(80,'GI',_binary '',NULL),(81,'GR',_binary '',NULL),(82,'GL',_binary '',NULL),(83,'GD',_binary '',NULL),(84,'GP',_binary '',NULL),(85,'GU',_binary '',NULL),(86,'GT',_binary '',NULL),(87,'GG',_binary '',NULL),(88,'GN',_binary '',NULL),(89,'GW',_binary '',NULL),(90,'GY',_binary '',NULL),(91,'HT',_binary '',NULL),(92,'VA',_binary '',NULL),(93,'HN',_binary '',NULL),(94,'HK',_binary '',NULL),(95,'HU',_binary '',NULL),(96,'IS',_binary '',NULL),(97,'IN',_binary '',NULL),(98,'ID',_binary '',NULL),(99,'IR',_binary '',NULL),(100,'IQ',_binary '',NULL),(101,'IE',_binary '',NULL),(102,'IM',_binary '',NULL),(103,'IL',_binary '',NULL),(104,'IT',_binary '',NULL),(105,'JM',_binary '',NULL),(106,'JP',_binary '',NULL),(107,'JE',_binary '',NULL),(108,'JO',_binary '',NULL),(109,'KZ',_binary '',NULL),(110,'KE',_binary '',NULL),(111,'KI',_binary '',NULL),(112,'KP',_binary '',NULL),(113,'KR',_binary '',NULL),(114,'KW',_binary '',NULL),(115,'KG',_binary '',NULL),(116,'LA',_binary '',NULL),(117,'LV',_binary '',NULL),(118,'LB',_binary '',NULL),(119,'LS',_binary '',NULL),(120,'LR',_binary '',NULL),(121,'LY',_binary '',NULL),(122,'LI',_binary '',NULL),(123,'LT',_binary '',NULL),(124,'LU',_binary '',NULL),(125,'MO',_binary '',NULL),(126,'MK',_binary '',NULL),(127,'MG',_binary '',NULL),(128,'MW',_binary '',NULL),(129,'MY',_binary '',NULL),(130,'ML',_binary '',NULL),(131,'MT',_binary '',NULL),(132,'MH',_binary '',NULL),(133,'MQ',_binary '',NULL),(134,'MR',_binary '',NULL),(135,'MU',_binary '',NULL),(136,'YT',_binary '',NULL),(137,'MX',_binary '',NULL),(138,'FM',_binary '',NULL),(139,'MD',_binary '',NULL),(140,'MC',_binary '',NULL),(141,'MN',_binary '',NULL),(142,'ME',_binary '',NULL),(143,'MS',_binary '',NULL),(144,'MA',_binary '',NULL),(145,'MZ',_binary '',NULL),(146,'MM',_binary '',NULL),(147,'NA',_binary '',NULL),(148,'NR',_binary '',NULL),(149,'NP',_binary '',NULL),(150,'NL',_binary '',NULL),(151,'NC',_binary '',NULL),(152,'NZ',_binary '',NULL),(153,'NI',_binary '',NULL),(154,'NE',_binary '',NULL),(155,'NG',_binary '',NULL),(156,'NU',_binary '',NULL),(157,'NF',_binary '',NULL),(158,'MP',_binary '',NULL),(159,'NO',_binary '',NULL),(160,'OM',_binary '',NULL),(161,'PK',_binary '',NULL),(162,'PW',_binary '',NULL),(163,'PS',_binary '',NULL),(164,'PA',_binary '',NULL),(165,'PG',_binary '',NULL),(166,'PY',_binary '',NULL),(167,'PE',_binary '',NULL),(168,'PH',_binary '',NULL),(169,'PN',_binary '',NULL),(170,'PL',_binary '',NULL),(171,'PT',_binary '',NULL),(172,'PR',_binary '',NULL),(173,'QA',_binary '',NULL),(174,'RE',_binary '',NULL),(175,'RO',_binary '',NULL),(176,'RU',_binary '',NULL),(177,'RW',_binary '',NULL),(178,'SH',_binary '',NULL),(179,'KN',_binary '',NULL),(180,'LC',_binary '',NULL),(181,'PM',_binary '',NULL),(182,'VC',_binary '',NULL),(183,'WS',_binary '',NULL),(184,'SM',_binary '',NULL),(185,'ST',_binary '',NULL),(186,'SA',_binary '',NULL),(187,'SN',_binary '',NULL),(188,'RS',_binary '',NULL),(189,'SC',_binary '',NULL),(190,'SL',_binary '',NULL),(191,'SG',_binary '',NULL),(192,'SK',_binary '',NULL),(193,'SI',_binary '',NULL),(194,'SB',_binary '',NULL),(195,'SO',_binary '',NULL),(196,'ZA',_binary '',NULL),(197,'ES',_binary '',NULL),(198,'LK',_binary '',NULL),(199,'SD',_binary '',NULL),(200,'SR',_binary '',NULL),(201,'SJ',_binary '',NULL),(202,'SZ',_binary '',NULL),(203,'SE',_binary '',NULL),(204,'CH',_binary '',NULL),(205,'SY',_binary '',NULL),(206,'TW',_binary '',NULL),(207,'TJ',_binary '',NULL),(208,'TZ',_binary '',NULL),(209,'TH',_binary '',NULL),(210,'TL',_binary '',NULL),(211,'TG',_binary '',NULL),(212,'TK',_binary '',NULL),(213,'TO',_binary '',NULL),(214,'TT',_binary '',NULL),(215,'TN',_binary '',NULL),(216,'TR',_binary '',NULL),(217,'TM',_binary '',NULL),(218,'TC',_binary '',NULL),(219,'TV',_binary '',NULL),(220,'UG',_binary '',NULL),(221,'UA',_binary '',NULL),(222,'AE',_binary '',NULL),(223,'GB',_binary '',NULL),(224,'US',_binary '',NULL),(225,'UM',_binary '',NULL),(226,'UY',_binary '',NULL),(227,'UZ',_binary '',NULL),(228,'VU',_binary '',NULL),(229,'VE',_binary '',NULL),(230,'VN',_binary '',NULL),(231,'VG',_binary '',NULL),(232,'VI',_binary '',NULL),(233,'WF',_binary '',NULL),(234,'EH',_binary '',NULL),(235,'YE',_binary '',NULL),(236,'ZM',_binary '',NULL),(237,'ZW',_binary '',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_description`
--

DROP TABLE IF EXISTS `country_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt7nshki1rbp6157ed0v6cx4y4` (`COUNTRY_ID`,`LANGUAGE_ID`),
  KEY `FKersrbjot9p9nfukxfd2l27c7t` (`LANGUAGE_ID`),
  CONSTRAINT `FKersrbjot9p9nfukxfd2l27c7t` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKkd2sy7q97wr2ahvyiiqc4txji` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_description`
--

LOCK TABLES `country_description` WRITE;
/*!40000 ALTER TABLE `country_description` DISABLE KEYS */;
INSERT INTO `country_description` VALUES (1,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,1,1),(2,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,2,1),(3,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'AfganistÃ¡n',NULL,3,1),(4,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Ã…land Islands',NULL,1,2),(5,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'ÃŽles Ã…land',NULL,2,2),(6,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Islas Aland',NULL,3,2),(7,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,1,3),(8,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albanie',NULL,2,3),(9,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,3,3),(10,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Algeria',NULL,1,4),(11,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'AlgÃ©rie',NULL,2,4),(12,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argelia',NULL,3,4),(13,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'American Samoa',NULL,1,5),(14,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa amÃ©ricaines',NULL,2,5),(15,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa Americana',NULL,3,5),(16,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,1,6),(17,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorre',NULL,2,6),(18,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,3,6),(19,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,1,7),(20,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,2,7),(21,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,3,7),(22,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,1,8),(23,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,2,8),(24,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguila',NULL,3,8),(25,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua & Barbuda',NULL,1,9),(26,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua-et-Barbuda',NULL,2,9),(27,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua y Barbuda',NULL,3,9),(28,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,1,10),(29,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentine',NULL,2,10),(30,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,3,10),(31,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,1,11),(32,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'ArmÃ©nie',NULL,2,11),(33,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,3,11),(34,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,1,12),(35,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,2,12),(36,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,3,12),(37,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australia',NULL,1,13),(38,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australie',NULL,2,13),(39,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Australia',NULL,3,13),(40,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,1,14),(41,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Autriche',NULL,2,14),(42,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,3,14),(43,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaijan',NULL,1,15),(44,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'AzerbaÃ¯djan',NULL,2,15),(45,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'AzerbaiyÃ¡n',NULL,3,15),(46,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,1,16),(47,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,2,16),(48,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,3,16),(49,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahrain',NULL,1,17),(50,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BahreÃ¯n',NULL,2,17),(51,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BarÃ©in',NULL,3,17),(52,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,1,18),(53,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,2,18),(54,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BangladÃ©s',NULL,3,18),(55,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,1,19),(56,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbade',NULL,2,19),(57,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,3,19),(58,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belarus',NULL,1,20),(59,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BiÃ©lorussie',NULL,2,20),(60,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bielorrusia',NULL,3,20),(61,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgium',NULL,1,21),(62,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgique',NULL,2,21),(63,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BÃ©lgica',NULL,3,21),(64,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,1,22),(65,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,2,22),(66,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belice',NULL,3,22),(67,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Benin',NULL,1,23),(68,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BÃ©nin',NULL,2,23),(69,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BenÃ­n',NULL,3,23),(70,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermuda',NULL,1,24),(71,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudes',NULL,2,24),(72,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudas',NULL,3,24),(73,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhutan',NULL,1,25),(74,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhoutan',NULL,2,25),(75,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'ButÃ¡n',NULL,3,25),(76,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,1,26),(77,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivie',NULL,2,26),(78,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,3,26),(79,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia & Herzegovina',NULL,1,27),(80,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnie-HerzÃ©govine',NULL,2,27),(81,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia y Herzegovina',NULL,3,27),(82,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,1,28),(83,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,2,28),(84,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botsuana',NULL,3,28),(85,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brazil',NULL,1,29),(86,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BrÃ©sil',NULL,2,29),(87,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brasil',NULL,3,29),(88,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'British Indian Ocean Territory',NULL,1,30),(89,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territoire britannique de lâ€™ocÃ©an Indien',NULL,2,30),(90,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territorio BritÃ¡nico del OcÃ©ano Ãndico',NULL,3,30),(91,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,1,31),(92,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,2,31),(93,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'BrunÃ©i',NULL,3,31),(94,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,1,32),(95,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgarie',NULL,2,32),(96,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,3,32),(97,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,1,33),(98,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,2,33),(99,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,3,33),(100,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,1,34),(101,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,2,34),(102,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,3,34),(103,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodia',NULL,1,35),(104,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodge',NULL,2,35),(105,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Camboya',NULL,3,35),(106,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroon',NULL,1,36),(107,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroun',NULL,2,36),(108,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'CamerÃºn',NULL,3,36),(109,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,1,37),(110,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,2,37),(111,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'CanadÃ¡',NULL,3,37),(112,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cape Verde',NULL,1,38),(113,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cap-Vert',NULL,2,38),(114,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cabo Verde',NULL,3,38),(115,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cayman Islands',NULL,1,39),(116,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'ÃŽles CaÃ¯mans',NULL,2,39),(117,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas CaimÃ¡n',NULL,3,39),(118,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Central African Republic',NULL,1,40),(119,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'RÃ©publique centrafricaine',NULL,2,40),(120,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'RepÃºblica Centroafricana',NULL,3,40),(121,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,1,41),(122,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Tchad',NULL,2,41),(123,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,3,41),(124,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,1,42),(125,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chili',NULL,2,42),(126,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,3,42),(127,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,1,43),(128,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chine',NULL,2,43),(129,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,3,43),(130,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Christmas Island',NULL,1,44),(131,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'ÃŽle Christmas',NULL,2,44),(132,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Isla de Navidad',NULL,3,44),(133,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cocos (Keeling) Islands',NULL,1,45),(134,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'ÃŽles Cocos',NULL,2,45),(135,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cocos',NULL,3,45),(136,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,1,46),(137,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombie',NULL,2,46),(138,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,3,46),(139,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoros',NULL,1,47),(140,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comores',NULL,2,47),(141,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoras',NULL,3,47),(142,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Brazzaville',NULL,1,48),(143,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Brazzaville',NULL,2,48),(144,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo',NULL,3,48),(145,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Kinshasa',NULL,1,49),(146,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Kinshasa',NULL,2,49),(147,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'RepÃºblica DemocrÃ¡tica del Congo',NULL,3,49),(148,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cook Islands',NULL,1,50),(149,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'ÃŽles Cook',NULL,2,50),(150,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cook',NULL,3,50),(151,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,1,51),(152,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,2,51),(153,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,3,51),(154,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'CÃ´te dâ€™Ivoire',NULL,1,52),(155,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'CÃ´te dâ€™Ivoire',NULL,2,52),(156,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'CÃ´te dâ€™Ivoire',NULL,3,52),(157,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatia',NULL,1,53),(158,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatie',NULL,2,53),(159,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croacia',NULL,3,53),(160,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,1,54),(161,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,2,54),(162,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,3,54),(163,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cyprus',NULL,1,55),(164,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chypre',NULL,2,55),(165,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chipre',NULL,3,55),(166,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Czechia',NULL,1,56),(167,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'TchÃ©quie',NULL,2,56),(168,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chequia',NULL,3,56),(169,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Denmark',NULL,1,57),(170,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Danemark',NULL,2,57),(171,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dinamarca',NULL,3,57),(172,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,1,58),(173,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,2,58),(174,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Yibuti',NULL,3,58),(175,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,1,59),(176,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominique',NULL,2,59),(177,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,3,59),(178,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominican Republic',NULL,1,60),(179,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'RÃ©publique dominicaine',NULL,2,60),(180,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'RepÃºblica Dominicana',NULL,3,60),(181,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,1,61),(182,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ã‰quateur',NULL,2,61),(183,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,3,61),(184,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egypt',NULL,1,62),(185,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ã‰gypte',NULL,2,62),(186,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egipto',NULL,3,62),(187,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,1,63),(188,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Salvador',NULL,2,63),(189,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,3,63),(190,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Equatorial Guinea',NULL,1,64),(191,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'GuinÃ©e Ã©quatoriale',NULL,2,64),(192,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guinea Ecuatorial',NULL,3,64),(193,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,1,65),(194,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ã‰rythrÃ©e',NULL,2,65),(195,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,3,65),(196,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,1,66),(197,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonie',NULL,2,66),(198,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,3,66),(199,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ethiopia',NULL,1,67),(200,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ã‰thiopie',NULL,2,67),(201,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'EtiopÃ­a',NULL,3,67),(202,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Falkland Islands',NULL,1,68),(203,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'ÃŽles Malouines',NULL,2,68),(204,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Malvinas',NULL,3,68),(205,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Faroe Islands',NULL,1,69),(206,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'ÃŽles FÃ©roÃ©',NULL,2,69),(207,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Feroe',NULL,3,69),(208,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiji',NULL,1,70),(209,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fidji',NULL,2,70),(210,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiyi',NULL,3,70),(211,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finland',NULL,1,71),(212,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlande',NULL,2,71),(213,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlandia',NULL,3,71),(214,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,1,72),(215,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,2,72),(216,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Francia',NULL,3,72),(217,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Guiana',NULL,1,73),(218,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guyane franÃ§aise',NULL,2,73),(219,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guayana Francesa',NULL,3,73),(220,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Polynesia',NULL,1,74),(221,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'PolynÃ©sie franÃ§aise',NULL,2,74),(222,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Polinesia Francesa',NULL,3,74),(223,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,1,75),(224,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,2,75),(225,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'GabÃ³n',NULL,3,75),(226,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,1,76),(227,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambie',NULL,2,76),(228,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,3,76),(229,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,1,77),(230,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'GÃ©orgie',NULL,2,77),(231,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,3,77),(232,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Germany',NULL,1,78),(233,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Allemagne',NULL,2,78),(234,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Alemania',NULL,3,78),(235,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,1,79),(236,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,2,79),(237,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,3,79),(238,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,1,80),(239,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,2,80),(240,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,3,80),(241,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Greece',NULL,1,81),(242,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'GrÃ¨ce',NULL,2,81),(243,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grecia',NULL,3,81),(244,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Greenland',NULL,1,82),(245,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenland',NULL,2,82),(246,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenlandia',NULL,3,82),(247,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenada',NULL,1,83),(248,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenade',NULL,2,83),(249,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Granada',NULL,3,83),(250,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,1,84),(251,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,2,84),(252,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadalupe',NULL,3,84),(253,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,1,85),(254,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,2,85),(255,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,3,85),(256,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,1,86),(257,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,2,86),(258,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,3,86),(259,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernsey',NULL,1,87),(260,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,2,87),(261,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,3,87),(262,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,1,88),(263,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'GuinÃ©e',NULL,2,88),(264,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,3,88),(265,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-Bissau',NULL,1,89),(266,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'GuinÃ©e-Bissau',NULL,2,89),(267,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-BisÃ¡u',NULL,3,89),(268,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,1,90),(269,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,2,90),(270,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,3,90),(271,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Haiti',NULL,1,91),(272,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'HaÃ¯ti',NULL,2,91),(273,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'HaitÃ­',NULL,3,91),(274,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Vatican City',NULL,1,92),(275,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ã‰tat de la CitÃ© du Vatican',NULL,2,92),(276,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ciudad del Vaticano',NULL,3,92),(277,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,1,93),(278,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,2,93),(279,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,3,93),(280,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hong Kong SAR China',NULL,1,94),(281,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'R.A.S. chinoise de Hong Kong',NULL,2,94),(282,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'RAE de Hong Kong (China)',NULL,3,94),(283,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hungary',NULL,1,95),(284,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hongrie',NULL,2,95),(285,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'HungrÃ­a',NULL,3,95),(286,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iceland',NULL,1,96),(287,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islande',NULL,2,96),(288,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islandia',NULL,3,96),(289,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,1,97),(290,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Inde',NULL,2,97),(291,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,3,97),(292,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,1,98),(293,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'IndonÃ©sie',NULL,2,98),(294,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,3,98),(295,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,1,99),(296,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,2,99),(297,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'IrÃ¡n',NULL,3,99),(298,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iraq',NULL,1,100),(299,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,2,100),(300,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,3,100),(301,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ireland',NULL,1,101),(302,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlande',NULL,2,101),(303,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlanda',NULL,3,101),(304,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isle of Man',NULL,1,102),(305,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'ÃŽle de Man',NULL,2,102),(306,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isla de Man',NULL,3,102),(307,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,1,103),(308,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'IsraÃ«l',NULL,2,103),(309,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,3,103),(310,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italy',NULL,1,104),(311,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italie',NULL,2,104),(312,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italia',NULL,3,104),(313,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,1,105),(314,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'JamaÃ¯que',NULL,2,105),(315,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,3,105),(316,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Japan',NULL,1,106),(317,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Japon',NULL,2,106),(318,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'JapÃ³n',NULL,3,106),(319,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,1,107),(320,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,2,107),(321,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,3,107),(322,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordan',NULL,1,108),(323,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordanie',NULL,2,108),(324,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordania',NULL,3,108),(325,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,1,109),(326,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,2,109),(327,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'KazajistÃ¡n',NULL,3,109),(328,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,1,110),(329,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,2,110),(330,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenia',NULL,3,110),(331,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,1,111),(332,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,2,111),(333,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,3,111),(334,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Korea',NULL,1,112),(335,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'CorÃ©e du Nord',NULL,2,112),(336,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Norte',NULL,3,112),(337,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'South Korea',NULL,1,113),(338,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'CorÃ©e du Sud',NULL,2,113),(339,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Sur',NULL,3,113),(340,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,1,114),(341,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'KoweÃ¯t',NULL,2,114),(342,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,3,114),(343,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kyrgyzstan',NULL,1,115),(344,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kirghizstan',NULL,2,115),(345,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'KirguistÃ¡n',NULL,3,115),(346,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,1,116),(347,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,2,116),(348,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,3,116),(349,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Latvia',NULL,1,117),(350,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lettonie',NULL,2,117),(351,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Letonia',NULL,3,117),(352,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lebanon',NULL,1,118),(353,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liban',NULL,2,118),(354,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'LÃ­bano',NULL,3,118),(355,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,1,119),(356,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,2,119),(357,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesoto',NULL,3,119),(358,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,1,120),(359,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,2,120),(360,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,3,120),(361,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libya',NULL,1,121),(362,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libye',NULL,2,121),(363,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libia',NULL,3,121),(364,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,1,122),(365,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,2,122),(366,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,3,122),(367,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lithuania',NULL,1,123),(368,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituanie',NULL,2,123),(369,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituania',NULL,3,123),(370,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,1,124),(371,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,2,124),(372,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxemburgo',NULL,3,124),(373,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macao SAR China',NULL,1,125),(374,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'R.A.S. chinoise de Macao',NULL,2,125),(375,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'RAE de Macao (China)',NULL,3,125),(376,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Macedonia',NULL,1,126),(377,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'MacÃ©doine du Nord',NULL,2,126),(378,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macedonia del Norte',NULL,3,126),(379,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,1,127),(380,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,2,127),(381,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,3,127),(382,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,1,128),(383,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,2,128),(384,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaui',NULL,3,128),(385,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaysia',NULL,1,129),(386,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaisie',NULL,2,129),(387,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malasia',NULL,3,129),(388,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,1,130),(389,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,2,130),(390,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,3,130),(391,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,1,131),(392,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malte',NULL,2,131),(393,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,3,131),(394,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Marshall Islands',NULL,1,132),(395,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'ÃŽles Marshall',NULL,2,132),(396,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Islas Marshall',NULL,3,132),(397,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,1,133),(398,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,2,133),(399,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinica',NULL,3,133),(400,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,1,134),(401,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritanie',NULL,2,134),(402,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,3,134),(403,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritius',NULL,1,135),(404,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Maurice',NULL,2,135),(405,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauricio',NULL,3,135),(406,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mayotte',NULL,1,136),(407,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,2,136),(408,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,3,136),(409,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexico',NULL,1,137),(410,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexique',NULL,2,137),(411,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'MÃ©xico',NULL,3,137),(412,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,1,138),(413,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'MicronÃ©sie',NULL,2,138),(414,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,3,138),(415,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldova',NULL,1,139),(416,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavie',NULL,2,139),(417,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavia',NULL,3,139),(418,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,1,140),(419,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,2,140),(420,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'MÃ³naco',NULL,3,140),(421,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,1,141),(422,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolie',NULL,2,141),(423,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,3,141),(424,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,1,142),(425,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'MontÃ©nÃ©gro',NULL,2,142),(426,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,3,142),(427,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,1,143),(428,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,2,143),(429,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,3,143),(430,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Morocco',NULL,1,144),(431,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Maroc',NULL,2,144),(432,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Marruecos',NULL,3,144),(433,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,1,145),(434,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,2,145),(435,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,3,145),(436,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Burma)',NULL,1,146),(437,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmanie)',NULL,2,146),(438,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmania)',NULL,3,146),(439,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,1,147),(440,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibie',NULL,2,147),(441,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,3,147),(442,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,1,148),(443,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,2,148),(444,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,3,148),(445,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,1,149),(446,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'NÃ©pal',NULL,2,149),(447,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,3,149),(448,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Netherlands',NULL,1,150),(449,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pays-Bas',NULL,2,150),(450,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'PaÃ­ses Bajos',NULL,3,150),(451,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Caledonia',NULL,1,151),(452,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-CalÃ©donie',NULL,2,151),(453,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Caledonia',NULL,3,151),(454,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Zealand',NULL,1,152),(455,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-ZÃ©lande',NULL,2,152),(456,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Zelanda',NULL,3,152),(457,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,1,153),(458,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,2,153),(459,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,3,153),(460,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,1,154),(461,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,2,154),(462,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'NÃ­ger',NULL,3,154),(463,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,1,155),(464,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,2,155),(465,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,3,155),(466,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,1,156),(467,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,2,156),(468,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,3,156),(469,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norfolk Island',NULL,1,157),(470,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'ÃŽle Norfolk',NULL,2,157),(471,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Isla Norfolk',NULL,3,157),(472,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Northern Mariana Islands',NULL,1,158),(473,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'ÃŽles Mariannes du Nord',NULL,2,158),(474,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Islas Marianas del Norte',NULL,3,158),(475,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norway',NULL,1,159),(476,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'NorvÃ¨ge',NULL,2,159),(477,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Noruega',NULL,3,159),(478,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,1,160),(479,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,2,160),(480,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'OmÃ¡n',NULL,3,160),(481,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,1,161),(482,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,2,161),(483,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'PakistÃ¡n',NULL,3,161),(484,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palau',NULL,1,162),(485,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,2,162),(486,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,3,162),(487,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palestinian Territories',NULL,1,163),(488,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Territoires palestiniens',NULL,2,163),(489,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Territorios Palestinos',NULL,3,163),(490,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,1,164),(491,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,2,164),(492,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'PanamÃ¡',NULL,3,164),(493,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papua New Guinea',NULL,1,165),(494,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papouasie-Nouvelle-GuinÃ©e',NULL,2,165),(495,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'PapÃºa Nueva Guinea',NULL,3,165),(496,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,1,166),(497,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,2,166),(498,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,3,166),(499,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Peru',NULL,1,167),(500,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'PÃ©rou',NULL,2,167),(501,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'PerÃº',NULL,3,167),(502,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,1,168),(503,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,2,168),(504,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Filipinas',NULL,3,168),(505,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pitcairn Islands',NULL,1,169),(506,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'ÃŽles Pitcairn',NULL,2,169),(507,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Islas Pitcairn',NULL,3,169),(508,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Poland',NULL,1,170),(509,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pologne',NULL,2,170),(510,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Polonia',NULL,3,170),(511,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,1,171),(512,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,2,171),(513,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,3,171),(514,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,1,172),(515,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Porto Rico',NULL,2,172),(516,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,3,172),(517,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,1,173),(518,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,2,173),(519,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Catar',NULL,3,173),(520,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'RÃ©union',NULL,1,174),(521,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'La RÃ©union',NULL,2,174),(522,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'ReuniÃ³n',NULL,3,174),(523,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Romania',NULL,1,175),(524,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Roumanie',NULL,2,175),(525,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'RumanÃ­a',NULL,3,175),(526,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russia',NULL,1,176),(527,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russie',NULL,2,176),(528,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rusia',NULL,3,176),(529,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,1,177),(530,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,2,177),(531,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Ruanda',NULL,3,177),(532,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Helena',NULL,1,178),(533,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-HÃ©lÃ¨ne',NULL,2,178),(534,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa Elena',NULL,3,178),(535,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Kitts & Nevis',NULL,1,179),(536,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Christophe-et-NiÃ©vÃ¨s',NULL,2,179),(537,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San CristÃ³bal y Nieves',NULL,3,179),(538,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Lucia',NULL,1,180),(539,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-Lucie',NULL,2,180),(540,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa LucÃ­a',NULL,3,180),(541,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Pierre & Miquelon',NULL,1,181),(542,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Pierre-et-Miquelon',NULL,2,181),(543,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Pedro y MiquelÃ³n',NULL,3,181),(544,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Vincent & Grenadines',NULL,1,182),(545,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Vincent-et-les Grenadines',NULL,2,182),(546,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Vicente y las Granadinas',NULL,3,182),(547,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,1,183),(548,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,2,183),(549,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,3,183),(550,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,1,184),(551,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Marin',NULL,2,184),(552,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,3,184),(553,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'SÃ£o TomÃ© & PrÃ­ncipe',NULL,1,185),(554,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sao TomÃ©-et-Principe',NULL,2,185),(555,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santo TomÃ© y PrÃ­ncipe',NULL,3,185),(556,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saudi Arabia',NULL,1,186),(557,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabie saoudite',NULL,2,186),(558,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabia SaudÃ­',NULL,3,186),(559,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,1,187),(560,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'SÃ©nÃ©gal',NULL,2,187),(561,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,3,187),(562,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Serbia',NULL,1,188),(563,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbie',NULL,2,188),(564,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbia',NULL,3,188),(565,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,1,189),(566,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,2,189),(567,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,3,189),(568,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,1,190),(569,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,2,190),(570,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leona',NULL,3,190),(571,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapore',NULL,1,191),(572,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapour',NULL,2,191),(573,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapur',NULL,3,191),(574,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovakia',NULL,1,192),(575,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovaquie',NULL,2,192),(576,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovaquia',NULL,3,192),(577,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovenia',NULL,1,193),(578,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'SlovÃ©nie',NULL,2,193),(579,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovenia',NULL,3,193),(580,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Solomon Islands',NULL,1,194),(581,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'ÃŽles Salomon',NULL,2,194),(582,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Islas SalomÃ³n',NULL,3,194),(583,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,1,195),(584,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalie',NULL,2,195),(585,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,3,195),(586,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'South Africa',NULL,1,196),(587,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Afrique du Sud',NULL,2,196),(588,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'SudÃ¡frica',NULL,3,196),(589,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Spain',NULL,1,197),(590,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Espagne',NULL,2,197),(591,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'EspaÃ±a',NULL,3,197),(592,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,1,198),(593,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,2,198),(594,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,3,198),(595,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sudan',NULL,1,199),(596,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Soudan',NULL,2,199),(597,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'SudÃ¡n',NULL,3,199),(598,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,1,200),(599,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,2,200),(600,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Surinam',NULL,3,200),(601,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard & Jan Mayen',NULL,1,201),(602,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard et Jan Mayen',NULL,2,201),(603,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard y Jan Mayen',NULL,3,201),(604,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,1,202),(605,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,2,202),(606,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Esuatini',NULL,3,202),(607,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sweden',NULL,1,203),(608,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'SuÃ¨de',NULL,2,203),(609,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suecia',NULL,3,203),(610,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Switzerland',NULL,1,204),(611,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suisse',NULL,2,204),(612,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suiza',NULL,3,204),(613,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syria',NULL,1,205),(614,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syrie',NULL,2,205),(615,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Siria',NULL,3,205),(616,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taiwan',NULL,1,206),(617,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'TaÃ¯wan',NULL,2,206),(618,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'TaiwÃ¡n',NULL,3,206),(619,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tajikistan',NULL,1,207),(620,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tadjikistan',NULL,2,207),(621,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'TayikistÃ¡n',NULL,3,207),(622,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,1,208),(623,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzanie',NULL,2,208),(624,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,3,208),(625,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Thailand',NULL,1,209),(626,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'ThaÃ¯lande',NULL,2,209),(627,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tailandia',NULL,3,209),(628,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,1,210),(629,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor oriental',NULL,2,210),(630,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,3,210),(631,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,1,211),(632,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,2,211),(633,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,3,211),(634,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,1,212),(635,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,2,212),(636,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,3,212),(637,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,1,213),(638,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,2,213),(639,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,3,213),(640,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad & Tobago',NULL,1,214),(641,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'TrinitÃ©-et-Tobago',NULL,2,214),(642,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad y Tobago',NULL,3,214),(643,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisia',NULL,1,215),(644,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisie',NULL,2,215),(645,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'TÃºnez',NULL,3,215),(646,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkey',NULL,1,216),(647,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turquie',NULL,2,216),(648,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'TurquÃ­a',NULL,3,216),(649,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkmenistan',NULL,1,217),(650,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'TurkmÃ©nistan',NULL,2,217),(651,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'TurkmenistÃ¡n',NULL,3,217),(652,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turks & Caicos Islands',NULL,1,218),(653,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'ÃŽles Turques-et-CaÃ¯ques',NULL,2,218),(654,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas Turcas y Caicos',NULL,3,218),(655,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,1,219),(656,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,2,219),(657,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,3,219),(658,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,1,220),(659,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ouganda',NULL,2,220),(660,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,3,220),(661,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,1,221),(662,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,2,221),(663,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ucrania',NULL,3,221),(664,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Arab Emirates',NULL,1,222),(665,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ã‰mirats arabes unis',NULL,2,222),(666,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Emiratos Ãrabes Unidos',NULL,3,222),(667,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Kingdom',NULL,1,223),(668,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Royaume-Uni',NULL,2,223),(669,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Reino Unido',NULL,3,223),(670,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United States',NULL,1,224),(671,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ã‰tats-Unis',NULL,2,224),(672,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Estados Unidos',NULL,3,224),(673,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Outlying Islands',NULL,1,225),(674,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'ÃŽles mineures Ã©loignÃ©es des Ã‰tats-Unis',NULL,2,225),(675,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas menores alejadas de EE. UU.',NULL,3,225),(676,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,1,226),(677,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,2,226),(678,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,3,226),(679,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uzbekistan',NULL,1,227),(680,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'OuzbÃ©kistan',NULL,2,227),(681,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'UzbekistÃ¡n',NULL,3,227),(682,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,1,228),(683,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,2,228),(684,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,3,228),(685,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,1,229),(686,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,2,229),(687,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,3,229),(688,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,1,230),(689,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'ViÃªt Nam',NULL,2,230),(690,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,3,230),(691,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'British Virgin Islands',NULL,1,231),(692,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'ÃŽles Vierges britanniques',NULL,2,231),(693,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas VÃ­rgenes BritÃ¡nicas',NULL,3,231),(694,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Virgin Islands',NULL,1,232),(695,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'ÃŽles Vierges des Ã‰tats-Unis',NULL,2,232),(696,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas VÃ­rgenes de EE. UU.',NULL,3,232),(697,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis & Futuna',NULL,1,233),(698,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis-et-Futuna',NULL,2,233),(699,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis y Futuna',NULL,3,233),(700,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Western Sahara',NULL,1,234),(701,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Sahara occidental',NULL,2,234),(702,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'SÃ¡hara Occidental',NULL,3,234),(703,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,1,235),(704,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'YÃ©men',NULL,2,235),(705,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,3,235),(706,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,1,236),(707,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambie',NULL,2,236),(708,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,3,236),(709,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,1,237),(710,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,2,237),(711,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabue',NULL,3,237);
/*!40000 ALTER TABLE `country_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `CURRENCY_ID` bigint NOT NULL,
  `CURRENCY_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CURRENCY_CURRENCY_CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CURRENCY_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CURRENCY_SUPPORTED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_ID`),
  UNIQUE KEY `UK_m7ku15ekud52vp67ry73a36te` (`CURRENCY_CURRENCY_CODE`),
  UNIQUE KEY `UK_1ubr7n96hjajamtggqp090a4x` (`CURRENCY_CODE`),
  UNIQUE KEY `UK_7r1k69cbk5giewqr5c9r4v6f` (`CURRENCY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'FJD','FJD','FJD',_binary ''),(2,'MXN','MXN','MXN',_binary ''),(3,'STD','STD','STD',_binary ''),(4,'LVL','LVL','LVL',_binary ''),(5,'SCR','SCR','SCR',_binary ''),(6,'CDF','CDF','CDF',_binary ''),(7,'BBD','BBD','BBD',_binary ''),(8,'GTQ','GTQ','GTQ',_binary ''),(9,'CLP','CLP','CLP',_binary ''),(10,'HNL','HNL','HNL',_binary ''),(11,'UGX','UGX','UGX',_binary ''),(12,'ZAR','ZAR','ZAR',_binary ''),(13,'MXV','MXV','MXV',_binary ''),(14,'TND','TND','TND',_binary ''),(15,'BSD','BSD','BSD',_binary ''),(16,'SLL','SLL','SLL',_binary ''),(17,'SDG','SDG','SDG',_binary ''),(18,'IQD','IQD','IQD',_binary ''),(19,'CUP','CUP','CUP',_binary ''),(20,'GMD','GMD','GMD',_binary ''),(21,'TWD','TWD','TWD',_binary ''),(22,'RSD','RSD','RSD',_binary ''),(23,'DOP','DOP','DOP',_binary ''),(24,'KMF','KMF','KMF',_binary ''),(25,'MYR','MYR','MYR',_binary ''),(26,'FKP','FKP','FKP',_binary ''),(27,'XOF','XOF','XOF',_binary ''),(28,'GEL','GEL','GEL',_binary ''),(29,'UYU','UYU','UYU',_binary ''),(30,'MAD','MAD','MAD',_binary ''),(31,'CVE','CVE','CVE',_binary ''),(32,'AZN','AZN','AZN',_binary ''),(33,'OMR','OMR','OMR',_binary ''),(34,'PGK','PGK','PGK',_binary ''),(35,'KES','KES','KES',_binary ''),(36,'SEK','SEK','SEK',_binary ''),(37,'BTN','BTN','BTN',_binary ''),(38,'UAH','UAH','UAH',_binary ''),(39,'GNF','GNF','GNF',_binary ''),(40,'ERN','ERN','ERN',_binary ''),(41,'MZN','MZN','MZN',_binary ''),(42,'SVC','SVC','SVC',_binary ''),(43,'ARS','ARS','ARS',_binary ''),(44,'QAR','QAR','QAR',_binary ''),(45,'IRR','IRR','IRR',_binary ''),(46,'MRO','MRO','MRO',_binary ''),(47,'CNY','CNY','CNY',_binary ''),(48,'XPF','XPF','XPF',_binary ''),(49,'THB','THB','THB',_binary ''),(50,'UZS','UZS','UZS',_binary ''),(51,'BDT','BDT','BDT',_binary ''),(52,'LYD','LYD','LYD',_binary ''),(53,'BMD','BMD','BMD',_binary ''),(54,'KWD','KWD','KWD',_binary ''),(55,'PHP','PHP','PHP',_binary ''),(56,'RUB','RUB','RUB',_binary ''),(57,'PYG','PYG','PYG',_binary ''),(58,'ISK','ISK','ISK',_binary ''),(59,'JMD','JMD','JMD',_binary ''),(60,'COP','COP','COP',_binary ''),(61,'USD','USD','USD',_binary ''),(62,'MKD','MKD','MKD',_binary ''),(63,'DZD','DZD','DZD',_binary ''),(64,'PAB','PAB','PAB',_binary ''),(65,'SGD','SGD','SGD',_binary ''),(66,'ETB','ETB','ETB',_binary ''),(67,'KGS','KGS','KGS',_binary ''),(68,'SOS','SOS','SOS',_binary ''),(69,'VUV','VUV','VUV',_binary ''),(70,'VEF','VEF','VEF',_binary ''),(71,'LAK','LAK','LAK',_binary ''),(72,'BND','BND','BND',_binary ''),(73,'ZMK','ZMK','ZMK',_binary ''),(74,'XAF','XAF','XAF',_binary ''),(75,'LRD','LRD','LRD',_binary ''),(76,'HRK','HRK','HRK',_binary ''),(77,'CHF','CHF','CHF',_binary ''),(78,'ALL','ALL','ALL',_binary ''),(79,'DJF','DJF','DJF',_binary ''),(80,'TZS','TZS','TZS',_binary ''),(81,'VND','VND','VND',_binary ''),(82,'AUD','AUD','AUD',_binary ''),(83,'ILS','ILS','ILS',_binary ''),(84,'GHS','GHS','GHS',_binary ''),(85,'GYD','GYD','GYD',_binary ''),(86,'KPW','KPW','KPW',_binary ''),(87,'BOB','BOB','BOB',_binary ''),(88,'KHR','KHR','KHR',_binary ''),(89,'MDL','MDL','MDL',_binary ''),(90,'IDR','IDR','IDR',_binary ''),(91,'KYD','KYD','KYD',_binary ''),(92,'AMD','AMD','AMD',_binary ''),(93,'BWP','BWP','BWP',_binary ''),(94,'SHP','SHP','SHP',_binary ''),(95,'TRY','TRY','TRY',_binary ''),(96,'LBP','LBP','LBP',_binary ''),(97,'TJS','TJS','TJS',_binary ''),(98,'JOD','JOD','JOD',_binary ''),(99,'HKD','HKD','HKD',_binary ''),(100,'RWF','RWF','RWF',_binary ''),(101,'AED','AED','AED',_binary ''),(102,'EUR','EUR','EUR',_binary ''),(103,'LSL','LSL','LSL',_binary ''),(104,'DKK','DKK','DKK',_binary ''),(105,'CAD','CAD','CAD',_binary ''),(106,'BOV','BOV','BOV',_binary ''),(107,'BGN','BGN','BGN',_binary ''),(108,'MMK','MMK','MMK',_binary ''),(109,'NOK','NOK','NOK',_binary ''),(110,'MUR','MUR','MUR',_binary ''),(111,'SYP','SYP','SYP',_binary ''),(112,'GIP','GIP','GIP',_binary ''),(113,'RON','RON','RON',_binary ''),(114,'LKR','LKR','LKR',_binary ''),(115,'NGN','NGN','NGN',_binary ''),(116,'CRC','CRC','CRC',_binary ''),(117,'CZK','CZK','CZK',_binary ''),(118,'PKR','PKR','PKR',_binary ''),(119,'XCD','XCD','XCD',_binary ''),(120,'ANG','ANG','ANG',_binary ''),(121,'HTG','HTG','HTG',_binary ''),(122,'BHD','BHD','BHD',_binary ''),(123,'KZT','KZT','KZT',_binary ''),(124,'SRD','SRD','SRD',_binary ''),(125,'SZL','SZL','SZL',_binary ''),(126,'LTL','LTL','LTL',_binary ''),(127,'SAR','SAR','SAR',_binary ''),(128,'TTD','TTD','TTD',_binary ''),(129,'YER','YER','YER',_binary ''),(130,'MVR','MVR','MVR',_binary ''),(131,'AFN','AFN','AFN',_binary ''),(132,'INR','INR','INR',_binary ''),(133,'AWG','AWG','AWG',_binary ''),(134,'KRW','KRW','KRW',_binary ''),(135,'NPR','NPR','NPR',_binary ''),(136,'JPY','JPY','JPY',_binary ''),(137,'MNT','MNT','MNT',_binary ''),(138,'AOA','AOA','AOA',_binary ''),(139,'PLN','PLN','PLN',_binary ''),(140,'GBP','GBP','GBP',_binary ''),(141,'SBD','SBD','SBD',_binary ''),(142,'HUF','HUF','HUF',_binary ''),(143,'BYR','BYR','BYR',_binary ''),(144,'BIF','BIF','BIF',_binary ''),(145,'MWK','MWK','MWK',_binary ''),(146,'MGA','MGA','MGA',_binary ''),(147,'XDR','XDR','XDR',_binary ''),(148,'BZD','BZD','BZD',_binary ''),(149,'BAM','BAM','BAM',_binary ''),(150,'EGP','EGP','EGP',_binary ''),(151,'MOP','MOP','MOP',_binary ''),(152,'NAD','NAD','NAD',_binary ''),(153,'NIO','NIO','NIO',_binary ''),(154,'PEN','PEN','PEN',_binary ''),(155,'NZD','NZD','NZD',_binary ''),(156,'WST','WST','WST',_binary ''),(157,'CLF','CLF','CLF',_binary ''),(158,'BRL','BRL','BRL',_binary '');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` bigint NOT NULL,
  `CUSTOMER_ANONYMOUS` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_COMPANY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_REQ` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_EXP` date DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `CUSTOMER_DOB` datetime DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(96) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_GENDER` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_NICK` varchar(96) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_PASSWORD` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROVIDER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UK1nbk11jltesa5kihmrcai0v7y` (`CUSTOMER_NICK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (150,_binary '\0',NULL,'2023-06-02 06:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nd1long@gmail.com','LONG','M','LONG','nd1long@gmail.com','$2a$10$PZkJvjw3MeS3yPCEpG0N1ev2.vHfV67sYi8UGiQ3NOAQAbnJDvt.u',NULL),(200,_binary '\0',NULL,'2023-06-04 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ndlong28@gmail.com','Long',NULL,'Nguyen Duy','ndlong28@gmail.com','$2a$10$vf19FUZolHFtX1V.81FPgOjXauxSDVeBRwH795gTjQ61INyPS4Kn.',NULL),(250,_binary '\0',NULL,'2023-06-04 21:56:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n@gmail.com','Long',NULL,'Nguyen Duy','n@gmail.com','$2a$10$8QxgxJwxlNlE/0KbqMMhhef6ftxg4ARMo7yBdoxFdo6ougBta.5wO',NULL),(300,_binary '\0',NULL,'2023-06-04 22:03:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADFADFDA','Long',NULL,'Nguyen Duy','FADFADFDA','$2a$10$hrfjwSWQtN8OL2FAKP/gBuOjmryT.BKByi7/qybNUWfr5vVds7jAm',NULL),(301,_binary '\0',NULL,'2023-06-04 22:04:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADCFADFDA','Long',NULL,'Nguyen Duy','FADCFADFDA','$2a$10$8dV/0/dOBfhl2ZvjvXX//.U7kUIz1CCTQjLz2U0zj5pgFwqrBrg1W',NULL),(350,_binary '\0',NULL,'2023-06-04 22:29:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','Long',NULL,'Nguyen Duy','11','$2a$10$mVznvJeKC7lbq69pDOuAsekhHbgJ40Wgg6Y9mWoLNAw6wKL.jA1ga',NULL),(400,_binary '\0',NULL,'2023-06-05 07:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','LONG','M','LONG','2','$2a$10$py5v/xirBlHZFbaD1xYAceFagWlIiTIJV.GIACMH0R1pgUbW1DKuO',NULL),(450,_binary '\0',NULL,'2023-06-05 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2h','LONG','M','LONG','2h','$2a$10$xzNuMCgmsigbIE5QNqFu3eFpzfcsEH1Ob79.60xXQH0jtIgP/qv9W',NULL),(451,_binary '\0',NULL,'2023-06-05 20:33:58',NULL,NULL,NULL,NULL,NULL,NULL,'2003-02-09 00:00:00','23h','Nguyá»…n DÅ©y f','M','Long f','23h','$2a$10$uvxF0aciYoSf/hN9JPqhCO2bn8ekEHbHArkg/yeV3R2TZy0kuwoSW',NULL),(500,_binary '\0',NULL,'2023-06-05 20:40:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'long','Long',NULL,'Nguyen Duy','long','$2a$10$gINxxwKvs7am5uA4dwdOtO33633u1n8Sj3FvLya3mSp.6fvNcrJly',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attribute`
--

DROP TABLE IF EXISTS `customer_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_attribute` (
  `CUSTOMER_ATTRIBUTE_ID` bigint NOT NULL,
  `CUSTOMER_ATTR_TXT_VAL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTRIBUTE_ID`),
  UNIQUE KEY `UK46kbpre88yh963gewm3kmdni1` (`OPTION_ID`,`CUSTOMER_ID`),
  KEY `FKc3318o13i2bpxkci1bh52we5a` (`CUSTOMER_ID`),
  KEY `FK9fl7iexvdeeeoch9fh35o5vw4` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK4xugs9yd9w4o3sw11fisb8tj5` FOREIGN KEY (`OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FK9fl7iexvdeeeoch9fh35o5vw4` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FKc3318o13i2bpxkci1bh52we5a` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attribute`
--

LOCK TABLES `customer_attribute` WRITE;
/*!40000 ALTER TABLE `customer_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group` (
  `CUSTOMER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FKgrr5v89l1m9sl2qol62bbctq4` (`GROUP_ID`),
  KEY `FK257h3e27f4ujw08doqtq46hho` (`CUSTOMER_ID`),
  CONSTRAINT `FK257h3e27f4ujw08doqtq46hho` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKgrr5v89l1m9sl2qol62bbctq4` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (1,4),(50,4),(100,4),(101,4),(150,4),(200,8),(250,8),(300,8),(301,8),(350,8),(400,8),(450,8),(451,8),(500,8);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_opt_val_description`
--

DROP TABLE IF EXISTS `customer_opt_val_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_opt_val_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPT_VAL_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKge7f2t1d31r87wnk09h9u1tnv` (`CUSTOMER_OPT_VAL_ID`,`LANGUAGE_ID`),
  KEY `FK6rfssi3qfx4pswicxrfb18c1` (`LANGUAGE_ID`),
  CONSTRAINT `FK6rfssi3qfx4pswicxrfb18c1` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhwrs6fyqk6vh11yvcflu42yef` FOREIGN KEY (`CUSTOMER_OPT_VAL_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_opt_val_description`
--

LOCK TABLES `customer_opt_val_description` WRITE;
/*!40000 ALTER TABLE `customer_opt_val_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_opt_val_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_optin`
--

DROP TABLE IF EXISTS `customer_optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_optin` (
  `CUSTOMER_OPTIN_ID` bigint NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FIRST` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OPTIN_DATE` datetime DEFAULT NULL,
  `VALUE` longtext COLLATE utf8mb3_unicode_ci,
  `MERCHANT_ID` int NOT NULL,
  `OPTIN_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIN_ID`),
  UNIQUE KEY `UKc4fnyu0pvxxtrbko10rm1jqyw` (`EMAIL`,`OPTIN_ID`),
  KEY `FKk5v94dvhsgibaw89hv4m8o5yw` (`MERCHANT_ID`),
  KEY `FK7qym878m07cwvs4foe68lvqjt` (`OPTIN_ID`),
  CONSTRAINT `FK7qym878m07cwvs4foe68lvqjt` FOREIGN KEY (`OPTIN_ID`) REFERENCES `optin` (`OPTIN_ID`),
  CONSTRAINT `FKk5v94dvhsgibaw89hv4m8o5yw` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_optin`
--

LOCK TABLES `customer_optin` WRITE;
/*!40000 ALTER TABLE `customer_optin` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option`
--

DROP TABLE IF EXISTS `customer_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option` (
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPT_ACTIVE` bit(1) DEFAULT NULL,
  `CUSTOMER_OPT_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_OPTION_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_OPT_PUBLIC` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_ID`),
  UNIQUE KEY `UKrov34a6g4dhhiqukvhp1ggm0u` (`MERCHANT_ID`,`CUSTOMER_OPT_CODE`),
  KEY `CUST_OPT_CODE_IDX` (`CUSTOMER_OPT_CODE`),
  CONSTRAINT `FKcmqnh0rn2hukdfowean5tdy8k` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option`
--

LOCK TABLES `customer_option` WRITE;
/*!40000 ALTER TABLE `customer_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_desc`
--

DROP TABLE IF EXISTS `customer_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_OPTION_COMMENT` varchar(4000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK6ovl4t1ciag1wubtcebaoo7vi` (`CUSTOMER_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FKm4iu7v9db17wk2a03xqbqdlfa` (`LANGUAGE_ID`),
  CONSTRAINT `FKc2yiucjbw0wjha8ww7a01qfeo` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKm4iu7v9db17wk2a03xqbqdlfa` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_desc`
--

LOCK TABLES `customer_option_desc` WRITE;
/*!40000 ALTER TABLE `customer_option_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_set`
--

DROP TABLE IF EXISTS `customer_option_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_set` (
  `CUSTOMER_OPTIONSET_ID` bigint NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIONSET_ID`),
  UNIQUE KEY `UK4peli2ritnnq2xqpyq188srm6` (`CUSTOMER_OPTION_ID`,`CUSTOMER_OPTION_VALUE_ID`),
  KEY `FKj9vnvyh6hhhftjbcsymgiodm9` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FK1y5qtsuabhpwft3dyhqrgmtb4` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKj9vnvyh6hhhftjbcsymgiodm9` FOREIGN KEY (`CUSTOMER_OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_set`
--

LOCK TABLES `customer_option_set` WRITE;
/*!40000 ALTER TABLE `customer_option_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_value`
--

DROP TABLE IF EXISTS `customer_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_value` (
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  `CUSTOMER_OPT_VAL_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_OPT_VAL_IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_VALUE_ID`),
  UNIQUE KEY `UKcb1fmv71nrx7m1rlx1ff5qvdt` (`MERCHANT_ID`,`CUSTOMER_OPT_VAL_CODE`),
  KEY `CUST_OPT_VAL_CODE_IDX` (`CUSTOMER_OPT_VAL_CODE`),
  CONSTRAINT `FKho87ssg5rnvwauj3y690a96g6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_value`
--

LOCK TABLES `customer_option_value` WRITE;
/*!40000 ALTER TABLE `customer_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review`
--

DROP TABLE IF EXISTS `customer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review` (
  `CUSTOMER_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `REVIEWED_CUSTOMER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_REVIEW_ID`),
  UNIQUE KEY `UK2momthbfrtgico2yyod8w18pk` (`CUSTOMERS_ID`,`REVIEWED_CUSTOMER_ID`),
  KEY `FK7pmqdk9od2af7cl6alx82fkek` (`REVIEWED_CUSTOMER_ID`),
  CONSTRAINT `FK7pmqdk9od2af7cl6alx82fkek` FOREIGN KEY (`REVIEWED_CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKayt6tbxp7d4g1qyg8crw2n73p` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review`
--

LOCK TABLES `customer_review` WRITE;
/*!40000 ALTER TABLE `customer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review_description`
--

DROP TABLE IF EXISTS `customer_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK1va9q0nhoe3wli25ktpmouvyh` (`CUSTOMER_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK5pkgrlk32uqaxkrbve5mws1hj` (`LANGUAGE_ID`),
  CONSTRAINT `FK5pkgrlk32uqaxkrbve5mws1hj` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhf88oagf6t62k28afn8uaijc7` FOREIGN KEY (`CUSTOMER_REVIEW_ID`) REFERENCES `customer_review` (`CUSTOMER_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review_description`
--

LOCK TABLES `customer_review_description` WRITE;
/*!40000 ALTER TABLE `customer_review_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ALUMNUS_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ynvwi3cgx6aax2facrfyu71o` (`ALUMNUS_ID`),
  CONSTRAINT `FK8ynvwi3cgx6aax2facrfyu71o` FOREIGN KEY (`ALUMNUS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES ('796aa7de-2d6b-4c00-b7d5-4c2637ba638c','ThÃ´n Ká»³ TÃ¢n, xÃ£ Äá»©c Lá»£i ','Senior Intern Java',451);
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district_description`
--

DROP TABLE IF EXISTS `district_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_description` (
  `ID_DISTRICT` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ID_PROVINCE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_DISTRICT`),
  KEY `FKbwijv76p0huposvgoy750cslq` (`ID_PROVINCE`),
  CONSTRAINT `FKbwijv76p0huposvgoy750cslq` FOREIGN KEY (`ID_PROVINCE`) REFERENCES `province_description` (`ID_PROVINCE`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_description`
--

LOCK TABLES `district_description` WRITE;
/*!40000 ALTER TABLE `district_description` DISABLE KEYS */;
INSERT INTO `district_description` VALUES (1,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 1',1),(2,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 2',1),(3,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 3',1),(4,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 4',1),(5,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 5',1),(6,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quáº­n 6',1),(7,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 7',1),(8,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 8',1),(9,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 9',1),(10,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 10',1),(11,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 11',1),(12,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quáº­n 12',1),(13,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'BÃ¬nh Tháº¡nh',1),(14,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'GÃ² Váº¥p',1),(15,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'PhÃº Nhuáº­n',1),(16,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'TÃ¢n BÃ¬nh',1),(17,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'TÃ¢n PhÃº',1),(18,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Thá»§ Äá»©c',1),(19,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'BÃ¬nh TÃ¢n',1),(20,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Cá»§ Chi',1),(21,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'HÃ³c MÃ´n',1),(22,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'NhÃ  BÃ¨',1),(23,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Cáº§n Giá»',1);
/*!40000 ALTER TABLE `district_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `IS_GRADUATED` bit(1) DEFAULT NULL,
  `MAJOR` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SCHO0L` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `START_DATE` datetime NOT NULL,
  `CV_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi84md14f70rlkawtqyqude516` (`CV_ID`),
  CONSTRAINT `FKi84md14f70rlkawtqyqude516` FOREIGN KEY (`CV_ID`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES ('399b5bee-5ab4-4e06-be5c-0675d0089535','2010-12-26 00:00:00',_binary '','Há»c sinh chá»© gÃ¬ ná»¯a','TrÆ°á»ng THPT Sá»‘ 2 Má»™ Äá»©c','2010-12-26 00:00:00','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `english_level`
--

DROP TABLE IF EXISTS `english_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `english_level` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `english_level`
--

LOCK TABLES `english_level` WRITE;
/*!40000 ALTER TABLE `english_level` DISABLE KEYS */;
INSERT INTO `english_level` VALUES (1,NULL,NULL,NULL,'LV0','KhÃ´ng biáº¿t'),(2,NULL,NULL,NULL,'LV1','Äá»c hiá»ƒu cÆ¡ báº£n'),(3,NULL,NULL,NULL,'LV2','Giao tiáº¿p tá»‘t'),(4,NULL,NULL,NULL,'LV3','ThÃ nh tháº¡o cÃ¡c ká»¹ nÄƒng');
/*!40000 ALTER TABLE `english_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_description`
--

DROP TABLE IF EXISTS `experience_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_description` (
  `ID_EXPERIENCE` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_EXPERIENCE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_description`
--

LOCK TABLES `experience_description` WRITE;
/*!40000 ALTER TABLE `experience_description` DISABLE KEYS */;
INSERT INTO `experience_description` VALUES (1,'none-ex','ChÆ°a cÃ³ kinh nghiá»‡m',NULL,NULL,NULL),(2,'less6','Ãt hÆ¡n 6 thÃ¡ng',NULL,NULL,NULL),(4,'m1y','HÆ¡n má»™t nÄƒm',NULL,NULL,NULL),(6,'kinhnghiemtest','Kinh nghiá»‡m test',NULL,NULL,NULL),(7,'kinhnghiemtest','Kinh nghiá»‡m test',NULL,NULL,NULL);
/*!40000 ALTER TABLE `experience_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_history`
--

DROP TABLE IF EXISTS `file_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_history` (
  `FILE_HISTORY_ID` bigint NOT NULL,
  `ACCOUNTED_DATE` datetime DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `DATE_DELETED` datetime DEFAULT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `FILE_ID` bigint DEFAULT NULL,
  `FILESIZE` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`FILE_HISTORY_ID`),
  UNIQUE KEY `UKav35sb3v4nxq8v1n1rkxufir` (`MERCHANT_ID`,`FILE_ID`),
  CONSTRAINT `FK2k8h4penkjlbtc23vamwyek2g` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_history`
--

LOCK TABLES `file_history` WRITE;
/*!40000 ALTER TABLE `file_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone`
--

DROP TABLE IF EXISTS `geozone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone` (
  `GEOZONE_ID` bigint NOT NULL,
  `GEOZONE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GEOZONE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone`
--

LOCK TABLES `geozone` WRITE;
/*!40000 ALTER TABLE `geozone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone_description`
--

DROP TABLE IF EXISTS `geozone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKsoq8o99w3c8ys3ntamt5i4mat` (`GEOZONE_ID`,`LANGUAGE_ID`),
  KEY `FK1t2hp628edebe5d6co2whbla9` (`LANGUAGE_ID`),
  CONSTRAINT `FK1t2hp628edebe5d6co2whbla9` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKn82te2yb2st4hk2qlhl8ileb9` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone_description`
--

LOCK TABLES `geozone_description` WRITE;
/*!40000 ALTER TABLE `geozone_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `LANGUAGE_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`),
  KEY `CODE_IDX2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'en',NULL),(2,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'fr',NULL),(3,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'es',NULL),(4,NULL,NULL,NULL,'vn',NULL);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_description`
--

DROP TABLE IF EXISTS `location_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_description` (
  `ID_LOCATION` bigint NOT NULL AUTO_INCREMENT,
  `DETAIL_ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ID_DISTRICT` bigint DEFAULT NULL,
  `ID_PROVINCE` bigint DEFAULT NULL,
  `ID_WARD` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_LOCATION`),
  KEY `FK8259g9qqoelwx7i6d1sdki3a2` (`ID_DISTRICT`),
  KEY `FKr6qit76duexqdqvhhwfo6og0x` (`ID_PROVINCE`),
  KEY `FKngv2fan385in6p6tid4o9n5lr` (`ID_WARD`),
  CONSTRAINT `FK8259g9qqoelwx7i6d1sdki3a2` FOREIGN KEY (`ID_DISTRICT`) REFERENCES `district_description` (`ID_DISTRICT`),
  CONSTRAINT `FKngv2fan385in6p6tid4o9n5lr` FOREIGN KEY (`ID_WARD`) REFERENCES `ward_description` (`ID_WARD`),
  CONSTRAINT `FKr6qit76duexqdqvhhwfo6og0x` FOREIGN KEY (`ID_PROVINCE`) REFERENCES `province_description` (`ID_PROVINCE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_description`
--

LOCK TABLES `location_description` WRITE;
/*!40000 ALTER TABLE `location_description` DISABLE KEYS */;
INSERT INTO `location_description` VALUES (1,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(2,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(3,NULL,NULL,NULL,NULL,1,1,1),(4,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(6,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(7,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(8,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1),(9,'thÃ´n ká»³ tÃ¢n',NULL,NULL,NULL,1,1,1);
/*!40000 ALTER TABLE `location_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_product_entry`
--

DROP TABLE IF EXISTS `location_product_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_product_entry` (
  `PRODUCT_ID` bigint NOT NULL,
  `ID_LOCATION` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`ID_LOCATION`),
  KEY `FK7hmpj379m2opg61rx1kq9o0kn` (`ID_LOCATION`),
  CONSTRAINT `FK7hmpj379m2opg61rx1kq9o0kn` FOREIGN KEY (`ID_LOCATION`) REFERENCES `location_description` (`ID_LOCATION`),
  CONSTRAINT `FKwb1v3psx4eqdalw8dhte0rhl` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_product_entry`
--

LOCK TABLES `location_product_entry` WRITE;
/*!40000 ALTER TABLE `location_product_entry` DISABLE KEYS */;
INSERT INTO `location_product_entry` VALUES (2,3),(100,8),(151,9);
/*!40000 ALTER TABLE `location_product_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `MANUFACTURER_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MANUFACTURER_IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  UNIQUE KEY `UK6brqfdkga7jc78n8dh3v595y3` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKhswph4nthrqwffjekccudsrt2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'DEFAULT',NULL,0,1);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_description`
--

DROP TABLE IF EXISTS `manufacturer_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_LAST_CLICK` datetime DEFAULT NULL,
  `MANUFACTURERS_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL_CLICKED` int DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `MANUFACTURER_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKlpv09p83sc887clxe04nroup6` (`MANUFACTURER_ID`,`LANGUAGE_ID`),
  KEY `FK20t33wr4tp1kt1uyw7s8a3afl` (`LANGUAGE_ID`),
  CONSTRAINT `FK20t33wr4tp1kt1uyw7s8a3afl` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKre4iys57n5cfbgpg3qqgewtrh` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_description`
--

LOCK TABLES `manufacturer_description` WRITE;
/*!40000 ALTER TABLE `manufacturer_description` DISABLE KEYS */;
INSERT INTO `manufacturer_description` VALUES (1,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'DEFAULT','DEFAULT',NULL,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `manufacturer_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_configuration`
--

DROP TABLE IF EXISTS `merchant_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_configuration` (
  `MERCHANT_CONFIG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFIG_KEY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8mb3_unicode_ci,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_CONFIG_ID`),
  UNIQUE KEY `UKj0c3h8onw3m6hjcr3yylst9fb` (`MERCHANT_ID`,`CONFIG_KEY`),
  CONSTRAINT `FKf9bkgf0ysbp5fo9j69shm0pri` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_configuration`
--

LOCK TABLES `merchant_configuration` WRITE;
/*!40000 ALTER TABLE `merchant_configuration` DISABLE KEYS */;
INSERT INTO `merchant_configuration` VALUES (1,_binary '\0','2023-05-17 03:35:40','2023-05-17 03:35:40',NULL,'CONFIG','CONFIG','{\"allowPurchaseItems\":true,\"displayContactUs\":false,\"displayCustomerAgreement\":false,\"defaultSearchConfigPath\":{},\"displayCustomerSection\":false,\"displayAddToCartOnFeaturedItems\":true,\"displayPagesMenu\":true,\"testMode\":false,\"displayStoreAddress\":false,\"displaySearchBox\":true,\"debugMode\":false,\"useDefaultSearchConfig\":{}}',1);
/*!40000 ALTER TABLE `merchant_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_language`
--

DROP TABLE IF EXISTS `merchant_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_language` (
  `stores_MERCHANT_ID` int NOT NULL,
  `languages_LANGUAGE_ID` int NOT NULL,
  KEY `FKjwy0pjijh1qmcoivq50o2jgec` (`languages_LANGUAGE_ID`),
  KEY `FKiisj0tmoujv6n3iqmytvo39kn` (`stores_MERCHANT_ID`),
  CONSTRAINT `FKiisj0tmoujv6n3iqmytvo39kn` FOREIGN KEY (`stores_MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKjwy0pjijh1qmcoivq50o2jgec` FOREIGN KEY (`languages_LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_language`
--

LOCK TABLES `merchant_language` WRITE;
/*!40000 ALTER TABLE `merchant_language` DISABLE KEYS */;
INSERT INTO `merchant_language` VALUES (1,1);
/*!40000 ALTER TABLE `merchant_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_log`
--

DROP TABLE IF EXISTS `merchant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_log` (
  `MERCHANT_LOG_ID` bigint NOT NULL,
  `LOG` longtext COLLATE utf8mb3_unicode_ci,
  `MODULE` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MERCHANT_LOG_ID`),
  KEY `FKto727b9r68qrtn2vvdqdvd4ic` (`MERCHANT_ID`),
  CONSTRAINT `FKto727b9r68qrtn2vvdqdvd4ic` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_log`
--

LOCK TABLES `merchant_log` WRITE;
/*!40000 ALTER TABLE `merchant_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store`
--

DROP TABLE IF EXISTS `merchant_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_store` (
  `MERCHANT_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONTINUESHOPPINGURL` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CURRENCY_FORMAT_NATIONAL` bit(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(80) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IN_BUSINESS_SINCE` date DEFAULT NULL,
  `INVOICE_TEMPLATE` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINEAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IS_RETAILER` bit(1) DEFAULT NULL,
  `SEIZEUNITCODE` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_EMAIL` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `STORE_LOGO` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_TEMPLATE` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_CITY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `STORE_PHONE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USE_CACHE` bit(1) DEFAULT NULL,
  `WEIGHTUNITCODE` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY_ID` bigint NOT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`),
  UNIQUE KEY `UK_4pvtsnqv4nlao8725n9ldpguf` (`STORE_CODE`),
  KEY `IDXrkmg1f192v53wcxln88wrwgrx` (`LINEAGE`),
  KEY `FK2gn7vpkd9x832urw7c6jlawnn` (`COUNTRY_ID`),
  KEY `FK63hlw9wp1k1x3f5tke7t2us7s` (`CURRENCY_ID`),
  KEY `FKdnemo9tl8tjhkxko83psvkv19` (`LANGUAGE_ID`),
  KEY `FKgkoele515h76u39b9defibkm9` (`PARENT_ID`),
  KEY `FK5o24aky9161jyofyxmg0g53vv` (`ZONE_ID`),
  CONSTRAINT `FK2gn7vpkd9x832urw7c6jlawnn` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK5o24aky9161jyofyxmg0g53vv` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FK63hlw9wp1k1x3f5tke7t2us7s` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKdnemo9tl8tjhkxko83psvkv19` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgkoele515h76u39b9defibkm9` FOREIGN KEY (`PARENT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store`
--

LOCK TABLES `merchant_store` WRITE;
/*!40000 ALTER TABLE `merchant_store` DISABLE KEYS */;
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2023-05-17',NULL,NULL,_binary '','IN','contact@shopizer.com',NULL,'december','1234 Street address','My city','Shopizer','888-888-8888','H2H-2H2',NULL,_binary '\0','LB',37,105,1,NULL,9),(2,NULL,'2023-05-17 03:38:05',NULL,'nhahangmoi',NULL,_binary '',NULL,'2023-05-03',NULL,NULL,_binary '','CM','ndlong@gmail.com','277349150_1032746354265447_2768265822102840642_n.jpg',NULL,'chÆ°a biáº¿t','Ho Chi Minh City','CÃ´ng ty váº­t liá»‡u xÃ¢y dá»±ng 1111','0379755079','84',NULL,_binary '','JOB',37,81,4,NULL,9);
/*!40000 ALTER TABLE `merchant_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_configuration`
--

DROP TABLE IF EXISTS `module_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_configuration` (
  `MODULE_CONF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DETAILS` longtext COLLATE utf8mb3_unicode_ci,
  `CONFIGURATION` varchar(4000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOM_IND` bit(1) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MODULE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REGIONS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_CONF_ID`),
  KEY `MODULE_CONFIGURATION_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_configuration`
--

LOCK TABLES `module_configuration` WRITE;
/*!40000 ALTER TABLE `module_configuration` DISABLE KEYS */;
INSERT INTO `module_configuration` VALUES (1,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'usps',NULL,'[{\"scheme\":\"http\",\"host\":\"testing.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"http\",\"host\":\"production.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','usps.jpg','SHIPPING','[\"US\"]',NULL),(2,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'canadapost',NULL,'[{\"scheme\":\"https\",\"host\":\"ct.soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','canadapost.jpg','SHIPPING','[\"CA\"]',NULL),(3,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'ups','{\"01\":\"UPS Next Day Air\",\"02\":\"UPS Second Day Air\",\"03\":\"UPS Ground\",\"07\":\"UPS Worldwide Express\",\"08\":\"UPS Worldwide Expedited\",\"11\":\"UPS Standard\",\"12\":\"UPS Three-Day Select\",\"13\":\"UPS Next Day Air Saver\",\"14\":\"UPS Next Day Air Early A.M.\",\"54\":\"UPS Worldwide Express Plus\",\"59\":\"UPS Second Day Air A.M.\",\"69\":\"UPS Saver\"}','[{\"scheme\":\"https\",\"host\":\"wwwcie.ups.com\",\"port\":\"443\",\"uri\":\"/ups.app/xml/Rate\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"onlinetools.ups.com\",\"port\":\"443\",\"uri\":\"/xml/Rate\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','ups.jpg','SHIPPING','[\"US\",\"CA\",\"FR\",\"GB\"]',NULL),(4,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'weightBased',NULL,NULL,_binary '',NULL,'SHIPPING','[\"*\"]',NULL),(5,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'customQuotesRules',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(6,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'priceByDistance',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(7,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'storePickUp',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(8,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'moneyorder',NULL,NULL,_binary '\0','moneyorder.gif','PAYMENT','[\"*\"]','moneyorder'),(9,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'paypal-express-checkout',NULL,'[{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"TEST\",\"config1\":\"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null},{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"PROD\",\"config1\":\"https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null}]',_binary '\0','icon-paypal.png','PAYMENT','[\"*\"]','paypal'),(10,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'beanstream',NULL,'[{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','beanstream.gif','PAYMENT','[\"US\",\"CA\",\"GB\"]','creditcard'),(11,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'stripe',NULL,'[{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(12,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'stripe3',NULL,'[{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(13,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'braintree',NULL,'[{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','braintree.jpg','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"AL\",\"AD\",\"AT\",\"BY\",\"BE\",\"BG\",\"HY\",\"CY\",\"CZ\",\"FR\",\"GR\",\"IS\",\"IE\",\"IM\",\"IT\",\"PL\",\"LU\",\"CH\",\"RS\",\"SG\",\"MY\",\"HK\",\"NZ\"]','creditcard');
/*!40000 ALTER TABLE `module_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optin`
--

DROP TABLE IF EXISTS `optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optin` (
  `OPTIN_ID` bigint NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`OPTIN_ID`),
  UNIQUE KEY `UKmanlx6siq6ddf14cud40k8gw6` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FK37xvfo4the20avv7f1e1771fh` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optin`
--

LOCK TABLES `optin` WRITE;
/*!40000 ALTER TABLE `optin` DISABLE KEYS */;
INSERT INTO `optin` VALUES (1,'NEWSLETTER',NULL,NULL,'NEWSLETTER',NULL,1);
/*!40000 ALTER TABLE `optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account`
--

DROP TABLE IF EXISTS `order_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_BILL_DAY` int NOT NULL,
  `ORDER_ACCOUNT_END_DATE` date DEFAULT NULL,
  `ORDER_ACCOUNT_START_DATE` date NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FKi6l5isodh81m5hy8ua06hx73n` (`ORDER_ID`),
  CONSTRAINT `FKi6l5isodh81m5hy8ua06hx73n` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account`
--

LOCK TABLES `order_account` WRITE;
/*!40000 ALTER TABLE `order_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account_product`
--

DROP TABLE IF EXISTS `order_account_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account_product` (
  `ORDER_ACCOUNT_PRODUCT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ACCNT_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_END_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_EOT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_ST_DT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_TRX_ST` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_PM_FR_TY` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ST_DT` date NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_STATUS` int NOT NULL,
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_PRODUCT_ID`),
  KEY `FK7oxc8ygov7vd2ajt185jhiwts` (`ORDER_ACCOUNT_ID`),
  KEY `FK5kiyyb8ekqi9bfowytww8atcx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK5kiyyb8ekqi9bfowytww8atcx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7oxc8ygov7vd2ajt185jhiwts` FOREIGN KEY (`ORDER_ACCOUNT_ID`) REFERENCES `order_account` (`ORDER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account_product`
--

LOCK TABLES `order_account_product` WRITE;
/*!40000 ALTER TABLE `order_account_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attribute`
--

DROP TABLE IF EXISTS `order_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint NOT NULL,
  `IDENTIFIER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FK4nw5yrtgb4in6leve76bmdnua` (`ORDER_ID`),
  CONSTRAINT `FK4nw5yrtgb4in6leve76bmdnua` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attribute`
--

LOCK TABLES `order_attribute` WRITE;
/*!40000 ALTER TABLE `order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  `ONETIME_CHARGE` decimal(19,2) NOT NULL,
  `PRODUCT_NAME` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PRODUCT_QUANTITY` int DEFAULT NULL,
  `PRODUCT_SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ID`),
  KEY `FKf0sghmn59s14cxrjtrvkvi5yk` (`ORDER_ID`),
  CONSTRAINT `FKf0sghmn59s14cxrjtrvkvi5yk` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_attribute`
--

DROP TABLE IF EXISTS `order_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_attribute` (
  `ORDER_PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_IS_FREE` bit(1) NOT NULL,
  `PRODUCT_ATTRIBUTE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_PRICE` decimal(15,4) NOT NULL,
  `PRODUCT_ATTRIBUTE_VAL_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(15,4) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ATTRIBUTE_ID`),
  KEY `FK7j86rvwaysbok1nuofrnmhmkx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7j86rvwaysbok1nuofrnmhmkx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_attribute`
--

LOCK TABLES `order_product_attribute` WRITE;
/*!40000 ALTER TABLE `order_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_download`
--

DROP TABLE IF EXISTS `order_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_download` (
  `ORDER_PRODUCT_DOWNLOAD_ID` bigint NOT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `DOWNLOAD_MAXDAYS` int NOT NULL,
  `ORDER_PRODUCT_FILENAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_DOWNLOAD_ID`),
  KEY `FKstrda0eweharld63j8pxa2o2r` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKstrda0eweharld63j8pxa2o2r` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_download`
--

LOCK TABLES `order_product_download` WRITE;
/*!40000 ALTER TABLE `order_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_price`
--

DROP TABLE IF EXISTS `order_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_price` (
  `ORDER_PRODUCT_PRICE_ID` bigint NOT NULL,
  `DEFAULT_PRICE` bit(1) NOT NULL,
  `PRODUCT_PRICE` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PRODUCT_PRICE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL` decimal(19,2) DEFAULT NULL,
  `PRD_PRICE_SPECIAL_END_DT` datetime DEFAULT NULL,
  `PRD_PRICE_SPECIAL_ST_DT` datetime DEFAULT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_PRICE_ID`),
  KEY `FKnkukiqxrieonyulercgnh857s` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKnkukiqxrieonyulercgnh857s` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_price`
--

LOCK TABLES `order_product_price` WRITE;
/*!40000 ALTER TABLE `order_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_history`
--

DROP TABLE IF EXISTS `order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_history` (
  `ORDER_STATUS_HISTORY_ID` bigint NOT NULL,
  `COMMENTS` longtext COLLATE utf8mb3_unicode_ci,
  `CUSTOMER_NOTIFIED` int DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_STATUS_HISTORY_ID`),
  KEY `FKmhghgf1xy3o0npsp8xkj6wyvq` (`ORDER_ID`),
  CONSTRAINT `FKmhghgf1xy3o0npsp8xkj6wyvq` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_history`
--

LOCK TABLES `order_status_history` WRITE;
/*!40000 ALTER TABLE `order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_total`
--

DROP TABLE IF EXISTS `order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_total` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `MODULE` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ORDER_TOTAL_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_VALUE_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int NOT NULL,
  `TEXT` longtext COLLATE utf8mb3_unicode_ci,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE` decimal(15,4) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FK1tfvgk5smm80efdcc8uop4he3` (`ORDER_ID`),
  CONSTRAINT `FK1tfvgk5smm80efdcc8uop4he3` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_total`
--

LOCK TABLES `order_total` WRITE;
/*!40000 ALTER TABLE `order_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` bigint NOT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_CITY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_LAST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LATITUDE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LONGITUDE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_STATE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CHANNEL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFIRMED_ADDRESS` bit(1) DEFAULT NULL,
  `CARD_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CC_CVV` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CC_EXPIRES` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CC_NUMBER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CC_OWNER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CURRENCY_VALUE` decimal(19,2) DEFAULT NULL,
  `CUSTOMER_AGREED` bit(1) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LOCALE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_DATE_FINISHED` datetime DEFAULT NULL,
  `ORDER_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PAYMENT_MODULE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHIPPING_MODULE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CART_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_STATUS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,2) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int DEFAULT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `CURRENCY_ID` bigint DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANTID` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FKipesu5tupnriahutgle6xu9ed` (`BILLING_COUNTRY_ID`),
  KEY `FKit6ti99mv5uvuxqskhurv3y59` (`BILLING_ZONE_ID`),
  KEY `FKfusivmw6q3gjxnmp47n9s74qi` (`CURRENCY_ID`),
  KEY `FKnlx97vjyorunxglhy5bird06c` (`DELIVERY_COUNTRY_ID`),
  KEY `FKn9uvjl8105fsly4doo8rqnv5b` (`DELIVERY_ZONE_ID`),
  KEY `FKaodv5ffayq8x50q311o2y8m1` (`MERCHANTID`),
  CONSTRAINT `FKaodv5ffayq8x50q311o2y8m1` FOREIGN KEY (`MERCHANTID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKfusivmw6q3gjxnmp47n9s74qi` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKipesu5tupnriahutgle6xu9ed` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKit6ti99mv5uvuxqskhurv3y59` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKn9uvjl8105fsly4doo8rqnv5b` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKnlx97vjyorunxglhy5bird06c` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_cycle_description`
--

DROP TABLE IF EXISTS `pay_cycle_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_cycle_description` (
  `ID_PAY_CIRCLE` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PAY_CIRCLE`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_cycle_description`
--

LOCK TABLES `pay_cycle_description` WRITE;
/*!40000 ALTER TABLE `pay_cycle_description` DISABLE KEYS */;
INSERT INTO `pay_cycle_description` VALUES (1,NULL,NULL,NULL,'day','NgÃ y'),(2,NULL,NULL,NULL,'week','Tuáº§n'),(3,NULL,NULL,NULL,'month','ThÃ¡ng'),(4,NULL,NULL,NULL,'hour','Giá»'),(11,NULL,NULL,NULL,'test3','Long chinh');
/*!40000 ALTER TABLE `pay_cycle_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `PERMISSION_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERMISSION_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`),
  UNIQUE KEY `UK_ss26hgwetkj8ms5y5jn2co4j3` (`PERMISSION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'AUTH'),(2,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'SUPERADMIN'),(3,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN'),(4,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'PRODUCTS'),(5,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ORDER'),(6,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'CONTENT'),(7,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'STORE'),(8,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'TAX'),(9,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'PAYMENT'),(10,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'CUSTOMER'),(11,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'SHIPPING'),(12,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'AUTH_CUSTOMER');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_group`
--

DROP TABLE IF EXISTS `permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_group` (
  `GROUP_ID` int NOT NULL,
  `PERMISSION_ID` int NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`PERMISSION_ID`),
  KEY `FK77ly3khyuu40odly02d351s84` (`PERMISSION_ID`),
  CONSTRAINT `FK77ly3khyuu40odly02d351s84` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`),
  CONSTRAINT `FKr7ylutdgqp1nrlbhjwit6y17g` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_group`
--

LOCK TABLES `permission_group` WRITE;
/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
INSERT INTO `permission_group` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(5,4),(1,5),(2,5),(3,5),(6,5),(1,6),(2,6),(3,6),(4,6),(7,6),(1,7),(2,7),(3,7),(4,7),(1,8),(2,8),(3,8),(4,8),(1,9),(2,9),(3,9),(4,9),(1,10),(2,10),(3,10),(4,10),(1,11),(2,11),(3,11),(4,11),(8,12);
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_description`
--

DROP TABLE IF EXISTS `position_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_description` (
  `ID_POSITION` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_POSITION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_description`
--

LOCK TABLES `position_description` WRITE;
/*!40000 ALTER TABLE `position_description` DISABLE KEYS */;
INSERT INTO `position_description` VALUES (1,NULL,NULL,NULL,'intern','Thá»±c táº­p sinh'),(2,NULL,NULL,NULL,'associate','NhÃ¢n viÃªn chÃ­nh thá»©c'),(3,NULL,NULL,NULL,'manager','Quáº£n lÃ½');
/*!40000 ALTER TABLE `position_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_product_entry`
--

DROP TABLE IF EXISTS `position_product_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_product_entry` (
  `PRODUCT_ID` bigint NOT NULL,
  `ID_POSITION` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`ID_POSITION`),
  KEY `FKfpunujjlpl9ov754r6kybwfqk` (`ID_POSITION`),
  CONSTRAINT `FK7uurt8rx3craoo3tmpnwu8a99` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKfpunujjlpl9ov754r6kybwfqk` FOREIGN KEY (`ID_POSITION`) REFERENCES `position_description` (`ID_POSITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_product_entry`
--

LOCK TABLES `position_product_entry` WRITE;
/*!40000 ALTER TABLE `position_product_entry` DISABLE KEYS */;
INSERT INTO `position_product_entry` VALUES (2,3),(100,3),(151,3);
/*!40000 ALTER TABLE `position_product_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `COND` int DEFAULT NULL,
  `DATE_AVAILABLE` datetime DEFAULT NULL,
  `DATE_EXPERIENCE` datetime DEFAULT NULL,
  `GENDER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ID_PAY_CIRCL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `QUANTITY_ORDERED` int DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `REF_SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `ID_EXPERIENCE` bigint NOT NULL,
  `MANUFACTURER_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `UKs8ofsn9pehdrstjg52j5qabxh` (`MERCHANT_ID`,`SKU`),
  KEY `FKaw7sv0umb1d7sb48ff7aosf16` (`ID_EXPERIENCE`),
  KEY `FKra5mmrdxn3ci86hod7q1u3vu9` (`MANUFACTURER_ID`),
  KEY `FKqtt5f0aht5h7ough5rbkkcb33` (`CUSTOMER_ID`),
  KEY `FKb8oqtc3j8sqo0t8xdrne7pg69` (`TAX_CLASS_ID`),
  KEY `FKeiirvj8eu40h103fth8es1mt0` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKaw7sv0umb1d7sb48ff7aosf16` FOREIGN KEY (`ID_EXPERIENCE`) REFERENCES `experience_description` (`ID_EXPERIENCE`),
  CONSTRAINT `FKb8oqtc3j8sqo0t8xdrne7pg69` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKeiirvj8eu40h103fth8es1mt0` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKhhoq1nd9e0i4m7rt8gkh7d67h` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKqtt5f0aht5h7ough5rbkkcb33` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKra5mmrdxn3ci86hod7q1u3vu9` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,_binary '',NULL,'2023-05-17 08:04:35','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job2','job2',0,2,NULL,2,NULL,NULL,NULL),(100,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,_binary '',NULL,'2023-05-17 09:13:36','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job5','job5',0,2,NULL,2,NULL,NULL,NULL),(151,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,_binary '',NULL,'2023-05-20 17:16:08','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job9','job9',0,2,NULL,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_DEFAULT` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_DISCOUNTED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_REQUIRED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_ATRIBUTE_PRICE` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  UNIQUE KEY `UKo0c6cfxcfejwfa2877gfgpuco` (`OPTION_ID`,`OPTION_VALUE_ID`,`PRODUCT_ID`),
  KEY `IDX6h8m6ocg2jhu3bfieqa0dupb1` (`PRODUCT_ID`),
  KEY `FK3rleultg9fn2dxruefbb18d5t` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK2st60u9twmvvaowwn88mt3lrx` FOREIGN KEY (`OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK3rleultg9fn2dxruefbb18d5t` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FKml3nvemdjya159a7669qt1gjd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_availability`
--

DROP TABLE IF EXISTS `product_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_availability` (
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `LENGTH` decimal(19,2) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_AVAILABLE` date DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `QUANTITY_ORD_MAX` int DEFAULT NULL,
  `QUANTITY_ORD_MIN` int DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL,
  `REGION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REGION_VARIANT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `PRODUCT_VARIANT` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_AVAIL_ID`),
  UNIQUE KEY `UKmiln9rmsc6ssih1v9vf23h1dc` (`MERCHANT_ID`,`PRODUCT_ID`,`REGION_VARIANT`),
  KEY `PRD_AVAIL_STORE_PRD_IDX` (`PRODUCT_ID`,`MERCHANT_ID`),
  KEY `PRD_AVAIL_PRD_IDX` (`PRODUCT_ID`),
  KEY `FKm9cb3uvgql005wcsqi906pjhg` (`PRODUCT_VARIANT`),
  CONSTRAINT `FK5sbh4dx25pmjcqx958hr9ys8h` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKm9cb3uvgql005wcsqi906pjhg` FOREIGN KEY (`PRODUCT_VARIANT`) REFERENCES `product_variant` (`PRODUCT_VARIANT_ID`),
  CONSTRAINT `FKmjs1xqdsgji88j5uduj83bntl` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_availability`
--

LOCK TABLES `product_availability` WRITE;
/*!40000 ALTER TABLE `product_availability` DISABLE KEYS */;
INSERT INTO `product_availability` VALUES (2,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,2,NULL),(100,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,100,NULL),(151,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,151,NULL);
/*!40000 ALTER TABLE `product_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `PRODUCT_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`CATEGORY_ID`),
  KEY `FK3xw1sbaa29r534jvedimdd7md` (`CATEGORY_ID`),
  CONSTRAINT `FK3xw1sbaa29r534jvedimdd7md` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKa7245ly271mb0crlhxwhhppsq` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (2,50),(100,50),(151,50);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `META_TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DOWNLOAD_LNK` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_HIGHLIGHT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEF_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKq4dnkx5b776ayqas2h4rr2d8q` (`PRODUCT_ID`,`LANGUAGE_ID`),
  KEY `PRODUCT_DESCRIPTION_SEF_URL` (`SEF_URL`),
  KEY `FK6esjdaa6vu2t5vjin788a8og6` (`LANGUAGE_ID`),
  CONSTRAINT `FK6esjdaa6vu2t5vjin788a8og6` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKm46yjcu59q79qrokgglwq2ove` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,'ÄÃ£ chá»‰nh ná»™i dung','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','string','string',NULL,NULL,'string','string',4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','string','string',NULL,NULL,'string','string',4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','ÄÃ¢y lÃ  sáº£n pháº©m má»›i 1','string','string',NULL,NULL,'string','string',4,151);
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_digital`
--

DROP TABLE IF EXISTS `product_digital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_digital` (
  `PRODUCT_DIGITAL_ID` bigint NOT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_DIGITAL_ID`),
  UNIQUE KEY `UKjuk1qgkh9v5w7ghvb18krwo8v` (`PRODUCT_ID`,`FILE_NAME`),
  CONSTRAINT `FK47fmb5cg68pws7k26txyl1il6` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_digital`
--

LOCK TABLES `product_digital` WRITE;
/*!40000 ALTER TABLE `product_digital` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_digital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  `DEFAULT_IMAGE` bit(1) DEFAULT NULL,
  `IMAGE_CROP` bit(1) DEFAULT NULL,
  `IMAGE_TYPE` int DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_IMAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FKgab836d8rxqg8vv55nm02r65i` (`PRODUCT_ID`),
  CONSTRAINT `FKgab836d8rxqg8vv55nm02r65i` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image_description`
--

DROP TABLE IF EXISTS `product_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ALT_TAG` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn7yhdj6ccydgf201gibb882cd` (`PRODUCT_IMAGE_ID`,`LANGUAGE_ID`),
  KEY `FKlhdnpki4sf98wev0pcj2bvnih` (`LANGUAGE_ID`),
  CONSTRAINT `FK1dhldo18nj9l2y6qympgucynq` FOREIGN KEY (`PRODUCT_IMAGE_ID`) REFERENCES `product_image` (`PRODUCT_IMAGE_ID`),
  CONSTRAINT `FKlhdnpki4sf98wev0pcj2bvnih` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image_description`
--

LOCK TABLES `product_image_description` WRITE;
/*!40000 ALTER TABLE `product_image_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_opt_set_opt_value`
--

DROP TABLE IF EXISTS `product_opt_set_opt_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_opt_set_opt_value` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `values_PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  KEY `FK9dwatblxwc64a5la3bb7qnwd8` (`values_PRODUCT_OPTION_VALUE_ID`),
  KEY `FK3u6iyag8x8w9tkt7sqcoibjq6` (`ProductOptionSet_PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK3u6iyag8x8w9tkt7sqcoibjq6` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `product_option_set` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK9dwatblxwc64a5la3bb7qnwd8` FOREIGN KEY (`values_PRODUCT_OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_opt_set_opt_value`
--

LOCK TABLES `product_opt_set_opt_value` WRITE;
/*!40000 ALTER TABLE `product_opt_set_opt_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_opt_set_opt_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_opt_set_prd_type`
--

DROP TABLE IF EXISTS `product_opt_set_prd_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_opt_set_prd_type` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `productTypes_PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`,`productTypes_PRODUCT_TYPE_ID`),
  KEY `FKiem30u1enm0p25i7t53jganf4` (`productTypes_PRODUCT_TYPE_ID`),
  CONSTRAINT `FK4655h91s0eiinonako9n4h9ha` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `product_option_set` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FKiem30u1enm0p25i7t53jganf4` FOREIGN KEY (`productTypes_PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_opt_set_prd_type`
--

LOCK TABLES `product_opt_set_prd_type` WRITE;
/*!40000 ALTER TABLE `product_opt_set_prd_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_opt_set_prd_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option` (
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPTION_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_OPTION_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPTION_READ` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  UNIQUE KEY `UKhfcw5oi9ulljlog1b7ns1r9tu` (`MERCHANT_ID`,`PRODUCT_OPTION_CODE`),
  KEY `PRD_OPTION_CODE_IDX` (`PRODUCT_OPTION_CODE`),
  CONSTRAINT `FKp8cski5t5f5m4et4fw0uilcgu` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_desc`
--

DROP TABLE IF EXISTS `product_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPTION_COMMENT` varchar(4000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKmkcm8isyyyqbjd1yyb8mrpkuw` (`PRODUCT_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FK8fiwk5o1gbn2r2u8529yaf9xt` (`LANGUAGE_ID`),
  CONSTRAINT `FK8fiwk5o1gbn2r2u8529yaf9xt` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgjqmfofile4hwv867irsnvuc0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_desc`
--

LOCK TABLES `product_option_desc` WRITE;
/*!40000 ALTER TABLE `product_option_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_set`
--

DROP TABLE IF EXISTS `product_option_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_set` (
  `PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `PRODUCT_OPTION_SET_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPTION_SET_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_SET_ID`),
  UNIQUE KEY `UKk1qq8j685uj17bylgnkra1n5f` (`MERCHANT_ID`,`PRODUCT_OPTION_SET_CODE`),
  KEY `FK4njy17416fn86muojmtbav1d0` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK4njy17416fn86muojmtbav1d0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK8d5vylmhvmckmframdehgwqau` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_set`
--

LOCK TABLES `product_option_set` WRITE;
/*!40000 ALTER TABLE `product_option_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VAL_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPT_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPT_VAL_IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_OPT_VAL_SORT_ORD` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  UNIQUE KEY `UKixbpi4hxrhljh935c3xfvnvsh` (`MERCHANT_ID`,`PRODUCT_OPTION_VAL_CODE`),
  KEY `PRD_OPTION_VAL_CODE_IDX` (`PRODUCT_OPTION_VAL_CODE`),
  CONSTRAINT `FKnd3nw0mamlk8bkxo8ad5m85pq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value`
--

LOCK TABLES `product_option_value` WRITE;
/*!40000 ALTER TABLE `product_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value_description`
--

DROP TABLE IF EXISTS `product_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKasgc60ot1wy0uho96n0j8429p` (`PRODUCT_OPTION_VALUE_ID`,`LANGUAGE_ID`),
  KEY `FK19mnby7atlt85exlypxdxhacx` (`LANGUAGE_ID`),
  CONSTRAINT `FK19mnby7atlt85exlypxdxhacx` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKqttc6b79yp2s1hyrhg4thag6s` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value_description`
--

LOCK TABLES `product_option_value_description` WRITE;
/*!40000 ALTER TABLE `product_option_value_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price` (
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEFAULT_PRICE` bit(1) DEFAULT NULL,
  `PRODUCT_IDENTIFIER_ID` bigint DEFAULT NULL,
  `PRODUCT_PRICE_AMOUNT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_AMOUNT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_END_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_ST_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_TYPE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_PRICE_ID`),
  KEY `FK1dic7jnnk1qikgvwcrf4dw12r` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FK1dic7jnnk1qikgvwcrf4dw12r` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `product_availability` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (2,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',2),(100,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',100),(151,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',151);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_description`
--

DROP TABLE IF EXISTS `product_price_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRICE_APPENDER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKfrsw8d41sxxogvxxoyd8nwaxu` (`PRODUCT_PRICE_ID`,`LANGUAGE_ID`),
  KEY `FK7bmbrjr8ar5icwdpt8myj6gei` (`LANGUAGE_ID`),
  CONSTRAINT `FK7bmbrjr8ar5icwdpt8myj6gei` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKbwxw861ipjsct606j3dagdjsf` FOREIGN KEY (`PRODUCT_PRICE_ID`) REFERENCES `product_price` (`PRODUCT_PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_description`
--

LOCK TABLES `product_price_description` WRITE;
/*!40000 ALTER TABLE `product_price_description` DISABLE KEYS */;
INSERT INTO `product_price_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:01:55',NULL,NULL,'DEFAULT',NULL,NULL,4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,NULL,'DEFAULT',NULL,NULL,4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,NULL,'DEFAULT',NULL,NULL,4,151);
/*!40000 ALTER TABLE `product_price_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relationship`
--

DROP TABLE IF EXISTS `product_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relationship` (
  `PRODUCT_RELATIONSHIP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `RELATED_PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_RELATIONSHIP_ID`),
  KEY `FKso3cvinykac5wdwu1tjgfotor` (`PRODUCT_ID`),
  KEY `FKfskwtawyt85g9h6761fa69ya5` (`RELATED_PRODUCT_ID`),
  CONSTRAINT `FKfskwtawyt85g9h6761fa69ya5` FOREIGN KEY (`RELATED_PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKso3cvinykac5wdwu1tjgfotor` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relationship`
--

LOCK TABLES `product_relationship` WRITE;
/*!40000 ALTER TABLE `product_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `PRODUCT_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_REVIEW_ID`),
  UNIQUE KEY `UK9ew5idgdbk8a77534hbnhd4yb` (`CUSTOMERS_ID`,`PRODUCT_ID`),
  KEY `FKbfi8de7kxultg1vevq6jc1hn7` (`PRODUCT_ID`),
  CONSTRAINT `FK7tm0jrt0hiugo3ep49t3subou` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKbfi8de7kxultg1vevq6jc1hn7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_description`
--

DROP TABLE IF EXISTS `product_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKqno5wjdtcj8pm3ykkkh7t4rxj` (`PRODUCT_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK7byc5jsf5bm4lk674ac44e50m` (`LANGUAGE_ID`),
  CONSTRAINT `FK7byc5jsf5bm4lk674ac44e50m` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKmjivhigdcxmytndlpjuhf4o25` FOREIGN KEY (`PRODUCT_REVIEW_ID`) REFERENCES `product_review` (`PRODUCT_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_description`
--

LOCK TABLES `product_review_description` WRITE;
/*!40000 ALTER TABLE `product_review_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `PRODUCT_TYPE_ID` bigint NOT NULL AUTO_INCREMENT,
  `PRD_TYPE_ADD_TO_CART` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRD_TYPE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRD_TYPE_VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_ID`),
  UNIQUE KEY `PRD_TYPE_CODE_UNIQUE` (`PRD_TYPE_CODE`),
  KEY `FKswkvtaq4om2di6x8cd4m22ofn` (`MERCHANT_ID`),
  CONSTRAINT `FKswkvtaq4om2di6x8cd4m22ofn` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,NULL,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'GENERAL',NULL,NULL,NULL),(200,NULL,'2023-05-25 22:03:05','2023-05-25 22:03:05',NULL,'buonban',NULL,NULL,'BuÃ´n bÃ¡n');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type_description`
--

DROP TABLE IF EXISTS `product_type_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbnra4lwqjkju4yh04824sw6be` (`PRODUCT_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK81q74whco5y9fd51aa330hlc0` (`LANGUAGE_ID`),
  CONSTRAINT `FK81q74whco5y9fd51aa330hlc0` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKpwc89ulk7c9asbp2nfy2t4x2j` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type_description`
--

LOCK TABLES `product_type_description` WRITE;
/*!40000 ALTER TABLE `product_type_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_var_image`
--

DROP TABLE IF EXISTS `product_var_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_var_image` (
  `PRODUCT_VAR_IMAGE_ID` bigint NOT NULL,
  `DEFAULT_IMAGE` bit(1) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_VARIANT_GROUP_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_VAR_IMAGE_ID`),
  KEY `FKa691h70ypyp8liquow7qrg81h` (`PRODUCT_VARIANT_GROUP_ID`),
  CONSTRAINT `FKa691h70ypyp8liquow7qrg81h` FOREIGN KEY (`PRODUCT_VARIANT_GROUP_ID`) REFERENCES `product_variant_group` (`PRODUCT_VARIANT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_var_image`
--

LOCK TABLES `product_var_image` WRITE;
/*!40000 ALTER TABLE `product_var_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_var_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_var_image_description`
--

DROP TABLE IF EXISTS `product_var_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_var_image_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ALT_TAG` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `PRODUCT_VAR_IMAGE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKimi0kpikvll5gf63n36x3yrwt` (`PRODUCT_VAR_IMAGE_ID`,`LANGUAGE_ID`),
  KEY `FKinpkcxbxyg8yni5ftcvjlt1sp` (`LANGUAGE_ID`),
  KEY `FKibpkivbdn6wqe92gb40l5hffl` (`PRODUCT_ID`),
  CONSTRAINT `FKibpkivbdn6wqe92gb40l5hffl` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKinpkcxbxyg8yni5ftcvjlt1sp` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKo6dx44u06sx0mlvq15oy2wlnj` FOREIGN KEY (`PRODUCT_VAR_IMAGE_ID`) REFERENCES `product_var_image` (`PRODUCT_VAR_IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_var_image_description`
--

LOCK TABLES `product_var_image_description` WRITE;
/*!40000 ALTER TABLE `product_var_image_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_var_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `PRODUCT_VARIANT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_AVAILABLE` datetime DEFAULT NULL,
  `DEFAULT_SELECTION` bit(1) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `PRODUCT_VARIANT_GROUP_ID` bigint DEFAULT NULL,
  `PRODUCT_VARIATION_ID` bigint DEFAULT NULL,
  `PRODUCT_VARIATION_VALUE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_VARIANT_ID`),
  UNIQUE KEY `UKlhuo20v01wa867oa7bjqagv72` (`PRODUCT_ID`,`SKU`),
  KEY `IDX9ngqm1gg8oivkujmhee4wt0ox` (`PRODUCT_ID`),
  KEY `FKs1gvb7qb19cuowmhrhuwo7lcv` (`PRODUCT_VARIANT_GROUP_ID`),
  KEY `FK8nqskhly5tfk07g0padic9am9` (`PRODUCT_VARIATION_ID`),
  KEY `FKsa5ijtdrt6dge0op121ox56a0` (`PRODUCT_VARIATION_VALUE_ID`),
  CONSTRAINT `FK88qb5xufd31481gt7epc8scau` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FK8nqskhly5tfk07g0padic9am9` FOREIGN KEY (`PRODUCT_VARIATION_ID`) REFERENCES `product_variation` (`PRODUCT_VARIATION_ID`),
  CONSTRAINT `FKs1gvb7qb19cuowmhrhuwo7lcv` FOREIGN KEY (`PRODUCT_VARIANT_GROUP_ID`) REFERENCES `product_variant_group` (`PRODUCT_VARIANT_GROUP_ID`),
  CONSTRAINT `FKsa5ijtdrt6dge0op121ox56a0` FOREIGN KEY (`PRODUCT_VARIATION_VALUE_ID`) REFERENCES `product_variation` (`PRODUCT_VARIATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_group`
--

DROP TABLE IF EXISTS `product_variant_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant_group` (
  `PRODUCT_VARIANT_GROUP_ID` bigint NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_VARIANT_GROUP_ID`),
  KEY `FKqkn1or09hw4s03b8n1kdwhcsr` (`MERCHANT_ID`),
  CONSTRAINT `FKqkn1or09hw4s03b8n1kdwhcsr` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_group`
--

LOCK TABLES `product_variant_group` WRITE;
/*!40000 ALTER TABLE `product_variant_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variation`
--

DROP TABLE IF EXISTS `product_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation` (
  `PRODUCT_VARIATION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VARIANT_DEFAULT` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_VARIATION_ID`),
  UNIQUE KEY `UKi8sa74fv4io0sigmgvqxypp0d` (`MERCHANT_ID`,`PRODUCT_OPTION_ID`,`OPTION_VALUE_ID`),
  KEY `FK5jr2rc6t2p27nwdo5eqwa7658` (`PRODUCT_OPTION_ID`),
  KEY `FKy6gamyvrpds502pdcqq4voyg` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK5jr2rc6t2p27nwdo5eqwa7658` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FKqlm3c2178neue84l5kx51ovoq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKy6gamyvrpds502pdcqq4voyg` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation`
--

LOCK TABLES `product_variation` WRITE;
/*!40000 ALTER TABLE `product_variation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `AVATAR` longblob,
  `goal` text COLLATE utf8mb3_unicode_ci,
  `introduce` text COLLATE utf8mb3_unicode_ci,
  `YEAR_OF_BIRTH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint DEFAULT NULL,
  `ID_FORM_WORK` bigint DEFAULT NULL,
  `CUSTOMER_ID` bigint NOT NULL,
  `ENGLISH_LEVEL_ID` bigint NOT NULL,
  `EXPERIENCE_ID` bigint DEFAULT NULL,
  `PAY_CYCLE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_s7lmtmwhag7mmonvrtf0u09jr` (`CUSTOMER_ID`),
  KEY `FKtnfmgixikk2kthg3cjb3qbrr7` (`PRODUCT_TYPE_ID`),
  KEY `FK77h1pcx2raxmhol2kctl9hl7q` (`ID_FORM_WORK`),
  KEY `FKgliiak8ymnujw4kfho0okk7yy` (`ENGLISH_LEVEL_ID`),
  KEY `FKjihm3u22rdmjfworlmov6o3v0` (`EXPERIENCE_ID`),
  KEY `FK27f2w23bw1ii9yuujrf3dvs4t` (`PAY_CYCLE_ID`),
  CONSTRAINT `FK27f2w23bw1ii9yuujrf3dvs4t` FOREIGN KEY (`PAY_CYCLE_ID`) REFERENCES `pay_cycle_description` (`ID_PAY_CIRCLE`),
  CONSTRAINT `FK77h1pcx2raxmhol2kctl9hl7q` FOREIGN KEY (`ID_FORM_WORK`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKcwb067710din9s7q7d7l8qm3t` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKgliiak8ymnujw4kfho0okk7yy` FOREIGN KEY (`ENGLISH_LEVEL_ID`) REFERENCES `english_level` (`ID`),
  CONSTRAINT `FKjihm3u22rdmjfworlmov6o3v0` FOREIGN KEY (`EXPERIENCE_ID`) REFERENCES `experience_description` (`ID_EXPERIENCE`),
  CONSTRAINT `FKtnfmgixikk2kthg3cjb3qbrr7` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (3,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\â\ØICC_PROFILE\0\0\0\Èlcms\0\0mntrRGB XYZ \â\0\0\0	\0\0acspMSFT\0\0\0\0sawsctrl\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-hand‘\0=@€°=@t,ž¥\"Ž\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	desc\0\0\0ð\0\0\0_cprt\0\0\0\0\0wtpt\0\0\0\0\0rXYZ\0\0,\0\0\0gXYZ\0\0@\0\0\0bXYZ\0\0T\0\0\0rTRC\0\0h\0\0\0`gTRC\0\0h\0\0\0`bTRC\0\0h\0\0\0`desc\0\0\0\0\0\0\0uRGB\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0CC0\0XYZ \0\0\0\0\0\0óT\0\0\0\0\ÉXYZ \0\0\0\0\0\0o \0\08ò\0\0XYZ \0\0\0\0\0\0b–\0\0·‰\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0…\0\0¶\Äcurv\0\0\0\0\0\0\0*\0\0\0|\0øœuƒ\ÉN\nbô\Ïöj. C$¬)j.~3\ë9³?\ÖFWM6Tv\\dl†uV~ˆ,’6œ«§Œ²Û¾™\Ê\Ç\×e\äwñùÿÿÿ\Û\0C\0		\Z\Z&\"\"&0-0>>Tÿ\Û\0C		\Z\Z&\"\"&0-0>>TÿÀ\0Á\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0\íp)qµ­&1žÆ…9lv¯tò†w \î\è\âœ6Œ}iG8\í@\Ñy\ë‚*k6\ÖÀ\êjRñ\Ó’T\É\ãÒ‘\çy&«I€ƒ\ê\ÉÁ9\\uªó6üŽ”™Hùó\ã4›á´¶\ÇI\ÇÓœ\×\á‹3¥ª8ÁÝ“\Î0}\Z\èþ-I¿T·ˆ‰½ˆcPøz\"\â\ÑA\Î“žk†zÉ^\é\íZL;UÁ\î+UŽ*¶œ§\ÈP\r]#sâº©u™ó×Œ¦ø’ôd°GÛŸ`+˜Û•\È=ñZš\Ì\Â\ãY¿“û\×~YÀ¬\Ðvu\é_]‡-(.\Éœb\ç\Ï^£\ï6H\ßØœô¦ªS°EB@ùzTJGÿ\0®ºQ\Å&9cô\ÅI\ÃsJˆO\ç‘O\rœ\Z³&)	»•c8\éÉ§€®F*\Ö\Ô¯Z!O\0qÆ¤XŽ9\íR¢285!iŽ\ÅmÞ£¶*LJbÊœ#9\æ\Â\Ã6-?\é\ëô8©Qqšw \àT„\rƒ\Æ:T¾^\Æ4¡z€=¨¸\Ò+ùy\Í<G\ÓoLU˜Ñ£\\1ŠBž³Àþ”®>Rƒ€ipÀñSl§Ý©“8\\·z–Æ‘U\"r##CR\ÃsÀ\ÉÏ¥X\ÚPÔ›y÷¥r\Ò(‚[?)\ÎqR¨ Õ›Z—°¤UŠ\ÇÔLX\Ê\ã<sS?\'Šz£\ç“\Æ()Dj\"¿z~Ð˜\'¿ ©n”\â¹\éžO\"•\ÊH…”c\0I\Í&\Ã\Î*\ÇRxæœ©œzb•\ÊQ ³8ZyP2¦1\àzTŒc¢\å(•Šô\È9\Æ\rI°*ñ\Ü\æ¤\nxŠpÞ‘\\¤%@OZM™#œVJ‘õ4m\Ú9\ÇJ”€&r)È„u©y9É§¨ö\Å+D@ Œ*B02:Ô `\Ò\íÉ¥r\Ò\Z w\âžœµ.\ÐR@Fh§\í#EKfˆÌ¾†G\äLúŽô–¶’¡Wû£\Ó\ÔV£| ~8V#Š’\Êø¥\ÚI\ã‘R\ì*(U\æ˜\ÙÉ§¯_\çOPsƒøS\Ôv\Ç>”Œw£ð1V`E8(\äŽ((ƒk~¥H©Büi\ÛOqš‘•v“K\ä’oiÀ\èiÊ½r*YE!\ãœPc99£³4y<`žâ¡¢“2\âŽ]ù\0‘š\×\0Rª\à\Ø\Óöš6D@\ëŠB0s“Sm Žj‰ ©\Þ$\ë,d\Z\ÑÙ‘ŠNqÓ¥DPù‚5\'­<`R\nxAÖ‘(\èGju<¯4¥\0\éR\ÊLÍ¾”\Å	Á\è8ªp],ÜœZÓž?0 œ\ÖP°h\æ<\rF©š¦š4cÁP\Õ¹\à\à÷©`ƒË\êjVŒ²\àžµ¢fló\ï°I\ã·QyšRªó—¯fñ…„ói’\ì\àt¯#K+\è\áòÂ±\\ô\ÅtÁ\ÝX]~g\"Ö»¦p9\â›ö)y\âºÃ¥\ê0Œ‘\Ó8¤þ\Ë\Ô;\ÆG\áÒ¨ôUC•6’`py\ëOû\ç#¥u#L¾Rv\Ø\Õµ»\ÎmùPW9Í½“óÁ¨~\Í\'<75\Öy¤\å\çÓŠO²\Þ0Ç—úP.tr¿ežœÒ­³ú\Z\é¾\Éxr|ª{Z\Ý\íÏ•úU+9\Ê}òx£\Èl¸Ôµ­Úõ<})>\ÉrúŸNÞ´Á\Ì\æ³œ\ZF·“oqŠ\ë\Ú\ã?\ê‡\åJmnzG^¸ 9\Ñ\È}™ñ\ÐñR,ºm9½úP-\æ\ÉGÚ©\æs©òFi|—\É9\Åu0\Äÿ\00òzô¦˜$>NsLŽc‘0¹9È¨\Þ)Xw®µ­›1\Z‰\í\\©ý\Îh:8ó\àÕ¤‚D ©\ÆEt\"Üœþ\â¥[f\ÈŠ\é…\É\É<\Ò<NOs]A·\Þ?\Õbš Áš©°E(…À\é]OÙ\àyG?J_²¨\êPs£™ýð\ã$Ž\Ü\ÐUl«c\Ü\Z\èÍ²)\æ#Iöt˜sž\Ä\à\îr)$Hr\çutmg»8Ï¥4\ÃM„SBº0üë’¡K\0¨³g\"º?³ÁÀ(i«mn¬2¦\Â\æ\"‰c!”\àŽA¢I\'·HKS[\Íoq´§jO²\Å\è\Õ#¹ZK\éMXw|Á°Ã¶S\ç„8~¢´´9\èEYKXˆ\Åg\'b\Ò1$i$#4\Ù\ï.|¡bcÐ›Hò2qŠ§=¤9\äæ³¹n\Ö0…ýØ€\Û\ï>Yþ\ZŽ\Æ\ÊÃ¨=k_ì“\ÃgÚ²\Æ:5&8´Tžþ{§C/%:T\Z…ü÷R\\¾Î™­!i9\rQ=œlO\Ì)Xw‰žº„þZ#þ_\Ý&¡–\î\âyw¿<V§ö|}KŠO± \ç4%(¦g­\Ì\ÊÁ”œ¯~õ®º‡\Ú\È.£~95\Ø\ãþð\éMKUŠ@wf³q4R‹4­\çž\Òf™Œfª¥\ä¶÷F\à/\Ï\Ï5uU\"œÖ‚Lt\Ô;¢ý\Öe®¡*\ß ¹s\Î}\Íf\êr\Éy3LFI\ë]+i¨NC/\ÐU9tñƒóšD\æ\Òá…¯‘·©\Îjq{+\ËI–c…i4ddŠS¥ž\Ø5i’\Ò*\ßjò_\\\Å;©Üžþ)ueµ˜g”s÷\Å#\Ø0\'5\ÓXóÀ¦gh¦Qž\ãÌŸ\Í^	}Õ¬uv—Q‚\í\ÆL \ïP\r5\"X8#Žôî–¯51y©-\á\ê\'ðª\Úö©ý«*KÐª\ã¦ý…n3Ht\ç9â¥‚\åLÁ\ç\éZÚ–¥&¡\rº18…1ŠqÓŸ¦\ÓQÿ\0g\É\Æ¤[³5t\rb.\Þ\és2\ã>•\Í\ÊD“1\ìXš¼¶l„\Ð,\\ò¨\r\rÛ½Z	ô«[0\Ã÷ V~§«\Ëh-PmŠ\ê{š¤lœ\ã \Ó\rœƒ¨\ïE„’.¼\ækˆV; {u«\Þ!¾‚ýa\n~t\\?¾+2\Ù&¶—x\ÂG>õ–¥Ü“žMKC±»qð\ìh\ß2rÀ{óYw+jš]®\ÆË»|\Ã\ÓH\ÛH(02úô©°Ö…½Oöœx<\á«CJ$xš\ß\Ï95ƒ\ÍI;¯šŸE9ñ=¸\çr*Z3¨ô~‡\ÐQ“\Çj—Sc\åsR€3P\Ï*\ãqùRjL\ÓöƒH.CŠŒŽsVþUZ\nDi8J—m!\Õ +“K€?óA\ãµ\æ˜y8¥`i¸\äœc5 DFhwš~	5Z\âT‰NN=\è]òs\Û4\åõ5ž.cg\àóZH2»½j)9\'.	À\åˆcœ\ÔÀc¥;\rlö¨ãŠ½‚EFTÓ“B@Ê„Ú—o¥XÛƒ‘Š`\ç½\r\\Šn\Þ3Ú¤~OZ‰\Ü\à\ÔG¦\ÜU£ŒT8 õš	dEW\ïŽy\â¢ùGn\æ¥c\Çœz\Zz6\äuô4zÔƒ\Ïzb®I\Í\"ˆöŒ\Òœš—\Î:Ó”ŸAŽô	\íš0>Â¥Tn\ä\äu Er§µ#—8©±»€:S;*ûÔ° ³NP8©@\àb—h\ÉÁ\íPÀ®TdTE	«Lú\Ó:“SqØƒÚŽMJPc>£µ&?:Ab\"3Š1Á©J8‘PZò\Òc\rœSúipx\Åf\ËDm\ÛsÁ<\Òò¦žpx\ÅK-óø“\ÍFsŠ“n‚{Rds\íÚ¢\n\Ø\àU–\ëœ\Ó9+@™_¨=Oj\0\ê:\çùT\ÅT‘ŒR6x=óA-¦²’:ý*`¤v\é\Í \Ú8\ã9§qX‹) ©a€¸riûCt\Í<†\Ï4\ÓD£©õÀ¦\á°njr\ÃK‚\n\ã\ì)“b \ÉÀ¦„Ï°§r\ÞÂž /<â€±\Ø‚Žœ‚1R1\ÎN)8<\Å+…†z8¡ó\Ôñ\Í?BH\Æ(\Ç˜\r\Éõ \09>ý¹\â¤ c˜À“Â“\í@šA<¯_S\Í0“\ÆG \Ô\Øe#“Š\n€rE8*:8ÁÛžr\0\íR0*¹\ã¥\rŒÀ=Gµ´Bû\0\àž\ãÚš¸$dõ\èLT€€H\éƒK‚\ÄÒ\ÉhA\Ô\Ù\ç8ö¦€	õ\Í?i\Æ¯_—±¤RT‚cšd\Øj\åIõ\Ï ŠM„“€\n\äv\ïR¶	}©¹Á\È\r\éI5•\0õzW\Ú\è¤sŽ)=@Ï¯O¥<goÓ­0#r·\Û\ÜSN\Éœµúv¦e•†9\'¥148œ!8À5\È\Ç\êx\Å+“´\ÊóQ¤ˆya»žq@\Ò\0¡\æš@ ©úŸ¥\È\Ãp\ÇNMFr`Reª[…\ëÎ¢<œn$rA=i$fUõ?Z§$ÿ\0&ü\Ärs\ØR@XpA\È\ç\0{Y’9lžÃ¥[YShÝ’¯J¡<ü®FñJ¡\r\n\Ø\à\ã¾GµL>P@\ät¥W†X¾ù\Ç-L’\æF“\Éc\Û\'µDµE\Åjv~•<\É\ãÀ\ç\×FJ·\0‘\ëÖ¼ûÂˆÉ¨6N\âb>\çÒ½½^6-{\ìú¼­Þ‚òlØƒßŸj¸;U(s’qøzb´0:\×=„š¤\âžTs‘H\È?…HÄ€‚€gv5¯±Q~1XñP¶l\ãÛŠÔ€Œgwòª-ñ;\ãµŽÄƒšv9\ëƒJvr)’{!\Èlb•‡¸4\ì>¢šP\ç®+\é\ÃA\Å;¨¤l\ç#¶iûHÇ¥c{\0i:óOe8\È\éQv\ëÿ\0\Ö5 D03ÓŠ­(,cŠ·€WÞ©\Ü\0ªH\ÎG4¤\\O–>\'\Üo\×\Ö>0+w\Ãhd»€\ØE¸ŸL5/]÷E“+\éô¯Hð\Òf~\Ç5\Âõ’õ;‘ù½gHB.q\Å>fX£’N>Tbs\ì*K|,j5­\Ê\"\Ò\ïOLÁ ü\Æ+®Š¼’\î\Ï?ùi\ÉöMŸ6L<Ë™_Õ&›´`qÖ¥iŸž3Šf ˆ\ëŠû\nzEš\Õw“\Âš¡‹FjUN\Ì\0õ©ÀeÁ\éÞµL\æÍ¤t\ëÞ“n@\ÍZ\ÚsœsL\Øv\ïU&f\"\ä€p1Þ¬\0\Ät\Å65+ÁÚ¬Œc\0w¦\Ø$4)\ÆZ±\Z)\'<õ\Í BMJc\ã\åÇ©4\\«¤$\×\Û­Fƒ·\ÔÒ¤x\Ç^¹©6u9>\Øö¢\ãHˆ¦	\ÆH\Ç\á\ÍI\åM\ÊGÔ¸\à\äS’<.Kg=(¸\ìAµˆzgšV\0’Ç­MÐ‚O…„\ã\'ŒQq\ØC*3\Æ\îý8¤)‚\0\èE;k©Z—#4\\|¤1“N@J\àƒRª7·4ôR\0¤R‰\ÐHrNsƒO\ÚÝ±Sh\'*nR‰ðóøÔŠ¹§=zS†\Ñ\ßñ\Å\"\ÔH\Ä`v\íF(#¾j|dsÚ¡\ÏøPR‰RNE(\\÷\ÍM°óÚœ#\ÊD#;°jU§LTƒ»Ñƒ•\ÅK)!qŒóš\nñR…\Ç\\\Ò\Ï‚\ì@\È\r8/(8\îM.Î¤\Ð =q\êiÁ;T¥iûFx9¢\ìv \ÍL©\Ç\áO\n\r8\Æ>´\Ä!:|£šx^´ÿ\0½“O*I\ç4®RD-ƒÖŸ·Ž*O,g­8\'\ãÚ“e$FŒR”\ßÒ§Tü(\Û\É\à\àT\Üv\"\0Ó®i@§5&ÌœT˜Lû\Z.2¹žsN(x8\íƒS9\îG­9”ZW¸Q‘\ÇQÖ¤Q•\É\É\È\äÔ…3\íŠpL\àñœ\ÑpCUp«N–>\ÜbŒ`R(ˆ=;T\Ì\rG0#¦E?o9©6\Zv\ÜcûÔ”ˆÀ `Ö\Û8©@\Æzb€	ô@¿/)J\Z/QFZ€\" tõ¥\n}*}™¦€zz”\îL™”\ã§Zœ¨f£m‡\ÜfŸ³·Z—¯L\Óøüi\"»0)¤{U‡OÎ›Š’ˆv\î¦\ìùpEXÁ¦`ú~®R ƒ\íNòóR\ìü\êM„sÚ‹W\ÈGJ‚Pj¡\Ò,c9Xg¯±À\Í5jjLi´a¶™m¸‘\Zƒ\Ó¤\Ze®1\å(ü+k\Ë-œõ¥gq<\Õs1ó3 \é–G!xö¨$Ñ¬˜\äB™úVð^:PÉŒqO˜\å\Ü\çG²G’¸\ëÀ\ïP¶‘bO0¯+£e\\±8ú\Õ)2\å\ÜÃ“I²aƒ)#Ñ¬²\Ã\É^µ¼c\î\n]½{S\æ}\Å\í%Ý˜M¡\é\ì¤y+\ëOþ\Ä\Ó\È\æ[EH§…\ëÀ§\Ì\Ç\ígÝœ÷ö€lùŠW\Ðô\âùòA\È\äWA´1 ¥\Ì=¬û³›mOÀ\Ä\"ž<?§}\ã\nž‡\Ð(,qRÁ8§\Î\Ã\ÚO»9¦ðÕ*\É0©G‡ô\Ü0-t Sv\â—4»‡µŸvs\ã\ÃZo_(T2økM\0\0\×OŠB™úS\çbugÝœ—ü#:o,#¥o\é›Øˆº\×Y\å\àQ·vA£žDûY÷9/øEô—ê¹¥\ÓpÀG|÷®¬\'\ëR‘\Î}h\ç\Ô\åÝœªøSJóˆ‡§Nµ¦<a\"\äB+m\0$qZ±]Ê‹…¨•I÷:iÍ½\Ù\É\',J\å¢ˆ¦\ÂcÑ\Z\ëÎ°•#&˜5õ\Ïð÷\Å.z¬\ÝT‚\êr\ßð®\ì\nñ\àð1U\Ã[2\ç¡\ãŠ\ï#ñ\ÂC ©Çˆ†ý\Ø\Î9£ž·™j¥.ç›Ÿ†¶™ÁAÓ¦*…\×\Ãvˆ zW­B\Ç;8ú\Ò>½ò\ÉÉ¨ukyšF¥\çŒ\é¿\Ö\îWV\\lœV\Éøcn1…\êkÔ¢\ÖmIŒ\ãµ0ø–\Ô¾[{T{\\A§¶\Ãõ‘\ä²|/Œ\ä(\Ç^E0|6òF0+\Ù`ñ\r‘b¬¥}jY5­=¸ñšN® µVIž\ß\Ð+6o‡ƒÚ½\â]GM\'<U_\í=)˜.)ªµ{\ç’<¾¸…\à\Ômðý—¢€{WÑ©&˜ËÂ°µ)l°C&­V“\ÝNn+Iþ@¸ ŽµYü\ß#§5\ì‘PmH5ª¨\Îg^¢\êy\'ü E†9ªÿ\0ð€M“\Ó\éÞ½&¥zSsdýf§s\Æÿ\0\á“Uvð$Û²¼Šö¦QŽ\Ø\Í£œkSº<døp ABø2\èuæ½‘‘v\Ó\nÂ¡»–±µc\È\Â7-\É\\ö5ø6\å\Û\î€s^\É\åö¦‰¨¹²\Æ\Íö<Tø:ðUN*\'ð•ðþ\Zö\Üb˜ñŠ9\Ú+\ëR}	\n^Ÿ\á<žÆ¡ÿ\0„GP%°½\ÈÀqŠo–{V/¬Hð£\ámLº})ƒ\Âú–pU{\à\0ö§S\ØQ\íG\í\Ù\à\ÃZˆþŠ‹þýK¯ \Ìhz¨ü©†½(ö·\Z\ÄHù\é´=HÊ·\Ë×Ž”\Øt›Ö‰\ßkzs_@½º²²…\ÕX4\èaœÔº…}gM:Eø«}1Ht\Ëðp\ÈsžE}¶±­0\Ù\Â1©?J^\Ð>³\ä|ö\Ö¿\ÜüqL:}ñÁ1\×ÐŸ`€\ç÷k\ÍÙ¶\äsõ\ÏJ= þµ\ä|\îl/Hùô\Å/\Ù.ù,€W\Ð\ÇK´ÿ\0žK\È\ÇJƒû*Ë“\å/\åK\rb|Ÿ\r¥\Ñ\Ç\îª6·˜˜ó_Dc\Ø\ç& *\Ñl\éG:¬£À\"Û¿˜±s‚\ãRøsM¸\Zýœ„`	I&½\ËûOc“#µM‘eªñ\ÆN‡œÐt\Ó,GVŸ³*b˜\Ç\ç‘Y6q¶BW¹¤<‚}*\É;g·4®X\Í!QÀ>•1P9¦`rh¹hŠiµ.1\Ôô¤\Æ{\Ò(¬@\Îi0MN\ê:\ÔdP,9¦0©\ÍF\Õ @r3Y—ö\rr„£\à\Ö\Ærj2¼mõ4€æ­´)†yy\Ïj\éR\0 ~´\äF®\àdQb· \Ç\é\ÃÖ¥š@:\Ó\ì1Ö’¥nµµ\0DG¯j„úš²Æ«3gŒv ‘€Q•\ã>µ9)56\È[Žj&\ã9\ÍHNG¯4ÑA,]\nƒ““Ú¡=ñ\ØñSeˆ\0úŠŒ õ\Ð&Ty~•`.SŒr¦5´F]ÿ\0\Ä8«sŽsR1˜R\âžŽÔ¤¦œ?\n\0\âŒdgŠ—h\ã£\0¡¥rŠ¬¤œzŠiQŠ²y<œ\nn\ÐG×µ +rG¨©XcÖ”©^œqP<\Ó6ñ“S`ž¢”¨ÛŒ\Ô1m#\0ŒÑ°ñŽµ!\í\Æi\ë\ÍKe$@FM.\ßÎ‚8â¥²¬Dj1“N ƒF¨cHi\0SH\È&¥Á4 x\ÍK)!˜\Æ3IRF9\ÏOZ’­¡78Â¥>ô\Ü\ÐPKC0\äR\ã{\Òò8\ïGQ\Í°\ÌƒÆšTcw\\Ô™\éK´ÓŠ\ÃB)­Œ.sO3\ÏcJ£\å\ÇZ\Ä%@4ú\â§*8=\Å0«N?\n	°\Ìç¹¦¶zT¸\É\çÒ™´\äòE»¹sN=½{SŽqÉ \'A\ë@ˆ¹ú\Z~8<g §`ƒƒ@\íN\àFA<“É¤Á\Ï)Ý°\ã\niœôª…r91LÁ\É\ÚGcS\r§¿9\éJ\äØƒS8ü\r+/­X!X±\0\çúS08ã ¢\â±eaŒv\ç=óI\Z\áp\Ü\Ó\Â.}M5ycÀ=º\Ó%¡\nÇ¶=\é\åõc\éSÁ;Sdg“SŽÇµ¸œûœô\éO`võ#&Á:q@]ù\ë\ÇOj.M†¬kF[Š\\ië§Þœ\Ü`\Øò\rzz\ÐMˆ\\cø±‚?>”\ÅBX0#\0õ#³ß¿­4¾\ÖA¯N1@š ù› ¤‘žj\Îpœt\è1š\Ð\Î\á\éŒ\ãñõª{w~On™ hÀdøTRl\É\r\ÔzS\Ù\Û\ÐPc\Ý\ß$ñŸ­±T\ÜO=ªœ°rÍ¸\àžI¢\ÊG;¹©ž@Ý’x5HE#‘[\Ï>\çU¦Ó¾ûüUºTÀ£jŒÿ\0\rD\ê$Ü¤Ÿ˜\æ˜\Ék\Z \Ý\×+“ž\Õ\" \íÀÀÿ\0\ë\n³49\0+)üy¨X\0¤}KZ\Êj‹\èÁ‡^Fk\Ñ\å`};b¼\ÏJ>Eý³tb‚z\ãq\Åz`\Î\àrq^N2>ò>›)\é\Év‘¯n\á¹\Åh©8\Æ:V5´’û¾Õ®ŒXxÀ5\ç4{h”c\'4§\0g?ýqH:f˜\ã\'¦*K<û\ZÓ¶~xÞ²¢ 3CšÐ¶«ô\à÷\Æh5	\Ï8\ÆG4Ï˜¨\ÝøŠ|ÇŠNT\08­RDž\Î3\ßò¡ð\ß1?\áJG\éIµ³ŸZúc\Är«\È\ëK´ƒ\Óð4\Ü\ãŠW\äžÆ¢\ÆriÀZ“£­Hž85BõöÀ\ì0©=}^brx<\n\Ã\Ö&û=…\Ë\Â\Äj&\ì`µG\ËÚ­Þ±u.rVw#žOò¯Uð\Ôem\Ø\0\ãtç¡¯5ð\Ô/=\Ý\ÌËŒ—\É#\Ü×²\èP(`A\à€xö\í\\+Y{‡iP9®{Å“¼?xÀ\ÇéŒš\é’1°\Z\âüxût]¼\0ó\Ç½,$oVû\Èñ³)raj¿\î3\Ã\àvñ\ëÒ®¨S\Ñpj¼!ˆ\íÔ‘V±\Ç\Þ\Å}L^‡\çSÜ‹o”{)\ÈW8çŽ•aWŒf“\ç¾+T\ÌZs\éÉ©û\rJ€Ž1œÓB’G^õh‹…#œ3V\Â\ãJT\0¨#ðª\ì`l\ç¨\ê=)”‘¢\ì\äv\àjD@7\ç52\"¯_\\ñJ8\ä\ÔÜ»\r\ÚXu==\é\à\é“\ÐS\Õ6\ã½Lqqø\ÓAb\ËuS¶€Jõ\0\Ð\ÊIf™V\"ù‰\Éü)vœ“\Ü\Óúq\Í=G4®\"\Æ	\é×½+¨e8©6‚\ÄóNžzWe¤0#\"ž«\ë\É\â½ó\Å8\à\Ñr’ƒJF\\\Ô\Ø\í\ï@BWÞ‘Icõ©8\Å;ò­<Ÿ\éJ\åXf\0?Êž\ÈA=ªL\n\Ç4\Çb´ƒ\Æj`$t\ÇJj€9#\Òc°Š½5:¨\ê\nU\\g·µ?`_CH´„*{ô¦€õ©\É84\å\\g¯j›—b<`æ“’HX\Ú²8\î()\ÉZWˆ\n`òhÁÀ\æ§XS•Xw\Ål$ûÔGB\rJ±\03ùT cƒ\Í+Ž\Å`¿1<s@_œœ\Zµ´\Ï\ëFÁ\Ôõ¢\ã±ü:R€N=ªQ\Ôð¿6p9\ïJ\ã\"E\ÆH§&¦E\ÇJq\0ž~µ7)\"¿\Êr\íNT\Ü|r*9£br\Ó\éS@G\Í\È\'ŠW‡mÒ—o ©\ØÀ#ó\ïN\â#\"‘\0TÀÞ¸¢\à \0w—nq“ÞŸ¢ŒsÒ‹€Þ§šv\Úw)\Ü\í©`F\0éŠ›8\Ò{\éOÁ\ÝJ\å!@\â\à\Óñ\ì3N\\w\æÆ…\Î3KŒ\Óù\'R\í \âš\à0KŠ#‘@`ñF	T»(\Û\ÜPB‘R\0E\n:\æžBi\0\ë\Î*N§\âµ-Ž\ÄC“ŠP½ºÓ‡ â”Œ\â•\ÑVTR\ãœR\äŽ¤÷\Í\0#gŠn>”óHM4! Ž}iýi\ÛsÈ¥\n3ÖÀhQQ²œòsS€y0{Qt]˜\Ð\ÊÒ¦\Å7^™ª¸š\"\n8\Í!Oj“iJZ™ƒe.*LPGb©1\Í=z\Ò\Í>5\Îi€˜\Ï9§\éSˆ\Ãu©•€=*nRE]‚£l 8\Í>\röG¥.\Þ3VJ\ÓJŒQ\Ì+±K¶¥)ƒC\ã\ÄB@À4œ\Ô\Å1L#4›\Z$A\È\æ§r@8ô¨\âOQÞ§|™\ÇlT_Sx\ìx_Š5\ëû=^hb“j~µ„<Q©ùiÖ™\â¦k—Y\ìÀW>g8¯­\Ã\áhû7ß•t>~®&§<­\'¿s¬O\êk˜\Zwü%z€\çp÷®[.k.öõb^MEzxjPrqŠH\×ñ\êFrnOD@4¾\É9§¯Žo7v<×—\Û\Éuw \0a[­v\Z_„§¸$’y¼/­\á*N\É#\èªdøú¹§s°\Æwy@\"¤>3¹%;Uð¥\ÔH>FÁ¬k\Ý2\îØc?—J\í¥õ9\Ù.[ž%hc`\î\Ô\í\èu_ð›\É\Þ3\Çzañ´ƒœu®zr§ƒL*x5\×&\Z_d\Ã\ë8˜=\ÏHÿ\0„\Î,\ÈGN3J|kPs^jy¨¥w§ýŸ‡þW÷š\ÇY­Ï¡ü?ª¦­n\Ó\';[³(P¤\ã+‰øx›t79\ë3Wi.v\æ¾{N¼\ã”bŒœ\è\ÆOvŒ÷\ä\æ„\\œÔ†6É©Q/¦+4Dš\"#ŠAŽ*lc¶iµFM•ðG8£\"§õ \0	 Hƒ´…sSs\Åü((‡’:SsVsÓ¥1“€1\ÅK)™2MWu=jñ\\š‰\ÇJ†h¤R  5cf@®i\nv‘¢‘\\¦zSpV¬\í9¤ÀãŠ›rµ-J\Ë\Ï4l€\Óqšœ/(R}\êXð:ŠM»K´t£\0”‡a:M¸©{t¦žhÂ¼rj<þ5.zæ™ŒT¶4†¦‘OÀ¤#\\J€\0\Ì~µco4`Qq”<u\Î)võ\È\â§Á\Ç^´\Â9\Å +m40\êm¦˜FNO€\"\ìidv©9¥›-\ÙF24Ý§¿5;võ£ç¸¥rŠ¼j\"3VJ•\ã¢l¯=h9ö¨ˆ\æ¤&‚9 iUG5#qF6\Ððµ cš\Z6`\æ£h\Û\0\â¦å’†\'ñ©5^0\ÙÀmzv\È\ïE\Øe\'uF\î\r\\uZŒŽx¹4\Ð4Uq‚3Ò“\0\ÇÖ§a¸J‰\É\0qL†W“<bª\í\ïWõ \0g­Œ€9¨™O¯z¶g>´\Ã\ï\é@™˜sž½ªcòÎšE D`dÒ¨$úT€cŸÊ“€qÞ¤cH÷\ëIƒ´Ó‡9\Æ=\éÃŽ½)\\ú{\æšrz\â¤\Ç<v¥\ÛóT”Bpw=³\ïM`OµX ¡\ã4\ÌuÁ¤À¯´†>\Ü\Ðq\ÇÓš!\È\îhÁ\Ï8Ï¥K21M#’jb½*2?ŸZ’‘1F\äR\ç ÑŽ\nÍšm\é\ßÖŽF*lñÖ“\ïRÊ±]³H8Ç®jVP{Ð«’zT\ÜvA\äóš`56Ü‘‘JF{T²ˆvŒƒÐŠ\nôô§™\Í \Æy\æ\r\É}õ)\ç©\Æ~”rF9¤$V\îôü*LzŸ¥¿<š.+ƒ‘@\äóÀ\ÅK\×ò\æ£9jd‡^\ÔmÀÀâ—ž\ÜP1\×Ú€\Ô~¤\Ú\0©4 dñÚ€! õ\Ürj~	\îi6\ã·4\n\År¥z›¯AMl–ô\Í\"\îø\ÇZqS‚\r\Îx<\r°d\Ç\Â0)ý=©6½U\Åa¸õ==i\nðsšq\Âò}i\Çu ±Í´|£#‚)˜\ÚX<\ÐWz09\ï\Å h¦2X“øHNO·sÒ§ ?\0”*“\Ëc\×5I“b-›]I\éqýk]cŽh°¡z\Êa\ÇŽH«v²„\Ï\ÌO\áL–Š“\Ã\å•ÁoPq\éQI zÓ»–\"ŽGóö¬\Çs&6Œ\á¹?\áA\r\rcœ\0@\çšP(þ^´\èÕ¶’AëŠ›’\ÑZY£\É$\ÔÁS‘´ã°«r c\Óÿ\0#NÀ##h#{\ÓL‚˜\'$°ö#\ï\É\Ç~õ>C‘»8ö\Å ¥&4RmÎ¤}\Üÿ\0:H\á@\ÏJ²@\'ùŒc¥ù~lu¡\ÊN;óÓ¡¥¶T\äg8=¸«7\0ƒŸZ„®\\\Ýz¢›vYF23Œ1Q”v\È\ÏŸj¹b¤`Ž;÷\ïP±\É\Èž˜\ïT2Œ™~ªG<\àTM\Îp\Ù\ëSò\Î\Ý\É\ëQ\ã¨ö\Ó8C-\Ì{H‘y\ëÞ½A³òœc^g•WR2ry\éŽs^²ù\ÐFÝŠ)¯3¶g\Ð\å\ã^†¤o\0Š\ÖUqšÆ¶=\rl\'b+\Ê{ŸD‰só`t\èi\äw\àÓ•;h\Ç\\š‚\Êñ©ó\ã 85¥n>`+86&^ù£\â\Ø\ÝÏ¯Òš4‚\ßñ¥g\0gõÉ¦ð{\Ò\åy\ÆIª$ö°C~=,1Ú“ÿ\0AAùŠúS\Ä\Z\Ïó1œ\Ójv\Ç¡Â¥€‡p\nˆ\î\np0q\Ð\Ô\Ä\\\Ô\ÞGš@D\Ù\ë\\‹\äò´[ÃŽˆ{v\Åv-ž?•y\×\Ä+§ƒ\Ã\×;Frœu¬j»A›\ÒW’<_Â¨L“«´0\Ã-{>“%ùTô®\Âúz\Û\ÛoA\ç#5\é:89bqŒ\×\ävTMD\è†\nœw¯/ø‹1H\ì\Ó$\ÎN;šõ\Äg‘^Cñü\ÍB\Ò#\Ñ!\Ýø±¯k/W¯™óy\Ôùp“ó²<ö%\Û\ÎHl(\n22>•Rq\Ü\â­``	\í\Í}\">\êÆ€§ \Ò\Æ1\ÔE!\0cÀ\"¦\00¿Y“µ²qÛµYÙ¹TŒô\ä\ÓQ7\Ï@{U„\Æ\ì\ãB±\Z\Ç aƒ‘Þ¬,l9<\ZH€Š´=ú\Õ\"’#\Æ0*@6ñ@\éR/\'{šL»! {ž\Ô\à8\ëÚž8\ã9\çœRÁ\éB:4½Ni\Ûriý\íN\åX·ÖŒ×¡©>÷n1GJ‘¤&ORãž´\î¯5 _o­$7\Ë\Ï>iû2\0§ª…\à\Ó\È‘>Rx÷4\ì\ÇZs(¤\ë‘I²¬7=)\Øý)Á:\â\Î8¤1‡¥4T\ÊwR½\r\ZÀŽzf—\n“k2*AÎ£‚h\Ziôö¤	ƒ’jQ\ÍJ*óŠ–\ËDEO`iUI9©”(dœS³\Ï`MCe‘*\Ø\Æ:\â”\ÆN=‡\\Ô€\à’}\éçœŒŠC‘œt\ïø\Ò¾\ãú\Ô\ÜPŽ´®!Švœu\ìi\åA\çü``--;ŒŒŽ~´ñ#”\à¥xñ·i÷ ¤ˆv‚1Rm\ÇN½©\Ø£?J–ÀMž¸\É\èE<F=i\Ø§\0õ¤\ÊEV÷™(^2\rIŽNh\Û\ÔÔŒ`Pi@\äœS¶R\àzU’\äR€i\ÜsŠ8 CWŠP3šwA\ïO\ZWÀ£‚iØ§‘’2h\ç=:\n\Z½G)\ØÁ\Í.)\'®4‡y¥\ÛÚ·¡§\Ô\\`\0$ƒKN\â‚)€ÞƒúP>´\ê1Ò€ž´ü\n½>“)\Å\'lÓ©væ¤±”Þ§ò0zRœu†1…@\É\î{\ÒóO;Hô¤\Æ\rIC6RR‘\Í!©1X`±\Å ŸI@¢Œ÷¦ƒ•\éRPP„`\Òšb—€+\ìô„px©çŠŒ\ä\Zh–Ds€i…@©ÊŽi…G\ÔU¢Za<\â¤*)˜Á«Di\Ññšn)À\ãŠ1Š”1XŽ”ýÃ¦jZ\Ë#•§ºsÒ«‚sR\îÀ5%\r ƒ\íIN\'4© ô\Ì`Ô€Š{\0\05D»\ÎhŠS\É4žžô˜\"\ÌH}{\Ñ7Ÿ§Ju¸9\"–\çä‰Ž2qYý£uðŸ3ø€‡Ö®ñ\È\ßÞ³\"„»c£ª’ú•\É<þõª}–ö%e\È\Îz\ã¥}¼Z…ùE#)^£ó‘›©§\Ø!þóƒ´{\×\r´÷R\æA\Æ\ê\ë|[!“Xò\Ôü‰À¨,¡ù‡\Zø\Ì\ëRu}’vŒwólýg‚²ŠUXÉ«\Îmòù$t~\ZÑ–YT½\ÛJ\ÒbŽ!•\í\\—„,À%@¯WD€\Õ\âA³\Þ\Î*\Â-S[\"‰´R1´V%þ¨r Š\êE#(#­j¥%³>sš\rÙ¤|\ß\ãIF\æ\×!ô\ÌøbA«4¶o\ÄÁN\Î\Ü\×\ÒZµ‚K£‘_<KjºŒ¢\Ø1\Ç=k\ÖË±Õ¡UE\Ê\éžfk€\Ã\Ô\Ã:‘‚Rb	 6ó4m\Ã.EU‘8\È\Þø\Ò\Ébž•\\r\ÕÄ\Åq_]J~Ò’—s\âdý•G\Ù>®41\èf|WjS\åc\é\\·‚ Û¢@T\ä\Ç\ØJv¡8\Å|®-\ßQÿ\0yŸGCøÿ\0\n3\Êõ>üÑ\ÍD\Î;Ô¡k$CŒ\äT}\êM¿Ê¢¨ÈˆL\ë\ï\ÅKÞšV€AÀ¦\ãš4\nð8	©©‡½Kƒ<\Ó[v4óM\àR(f4®G½<ô4Ý¤œþ•6-2>„SH©[<SJô#‚“\")À!§ª\ã\ï\n~Ú–Rer¼Rl«\0dšLT•r±š6\ÔØ Œô¤\Ð\îCŒM Š›©\äRb\ÈJâ¯~\Õ1\Ç\Ó\Í+\Ú1RL\Æx¬4ˆûóŠn)ô†\ì7\Ò)\ã)\0r)\\,ˆ[¡¦°$òiÇš1Cab,u\Ï¸CO8\Å7ƒH¤5”t\Æj,±8\Æ*s\Ð\ÓX¶¦\å¤C³¶\0\ÏZ‰”¡©\È\0šFü¨»Š›p)»v\â§`y5ñE\É!\0R¹§m\Å&\Ì\ZCE˜\Âl\äS•U”ŒgÖ«ŒóO2‡™B˜‚ž\çô¦yl8ö ÍžGqQy§Óµ­	À\×À¨¤óLiÏ¥2IdÀ\Æ{T\ržô\âI5–${\Ð&W9,q×µ;€i\ÞÔ„3M±nƒµ!\Î{šq <úši<còª$iqßµ9x\ìqI”F¦i@\àš^ƒ4\06\Ô0ñ\Í/\éš0*Jp1\ïM\Û\Ç4\í¼ûÑŠ\0n\Ñô\âŒqš\\Œw ð4˜\Ú9\éšNø\í\ÅMÀ\Ì\r\Ù\ÅK\Z{œu\Å569¦•b¾¸©(„óøR•ùsN\Ø q\Ó\"³e¡™ Œv¦\í%°O\\T¡AÉ¤n	\È\í\ÅC,a\rŽœT{3\íR€\nñƒH;Žø¨e’s‘MÉ§ž¹ô¦°\Ç&\ÒÛ§½&\Üó\ëO \àRS\ÔRc±\0<\Z0*Za‚\Ã@œsŸOj^{\ÐI\ã?JB¸Šƒ\ë\Å\Æ03\ÜS¸ŒriO8§c¡=©{\ÑpJ8\íI\Î8§†o\ÇÀoL\nC÷O~i\Ø\ç\ïÖ—}¨ˆ•÷\Å#dcŠ“O)Å®!Î‚03Rc8t¦²\àþ\\V#\Û\Ðc¸#ñ¥Á8\ë\Í!\ê=©\Ü9F¥Ž;Sp\Ü\ç?=‡Jc\0\Ø\Íh„õâŒ\äóùT¸\ê3õ\íA \ÄPKDC\éÏµ7“\Ç“Sq÷OCI’ûc­4I®{´\Ö8<qRùlr3œÐ«…¹\ÎEQ,¨\è;§j” \0“õ4\æ¤Q\Ü\Ó[\æa–\íAD\'Ž;\ÓÁ“>ƒô\ÅN­•\ÜA\àŠ–\"\'`q\Í!œ\ãŒg¯œ\äŒâŸ³,1\í\ÇqB&\Ä\àž:Sœ¨\äaŽ1O ŸÏ“AM£ô¡…Š›b\Ði‡9\Ýô&¦‘¶±\Ú¦	\ëLŸ»@š\È\'¯5‚À\É\ÛÁô©—#“õ\Ûi\n¶Aƒ\Ôõª$f0p\0\É\Æj´’$jN9À9\Çe™bAŽ\ÇÞ©-Œ“ó~8&©\Ñº¹°ÀšfQ\ç\é\íJÁ“Œ\ç\è3QF7F\êcC[pW¯\ãš\ï\ì½Œ-\ê€~UÀH=yÀ5\Û\é.³\ã\èqž7W-{Ÿ3\Ú\Êej­w‰½8\æµ\ÑØ®qøV,HA\èkj&\Ï\ÝºW-Ï¨[w`\Ó×­4y}\éH\ÅfZÁƒŒ=*\â©\Ý\ëŒtª2¶Wp\ä‚1V\ãlóŸ¦) 5\Ñz{ŽM)@3\êMG	lcŒÔ£®\ÑÚ¨“\ÛTS•s\È<w¤\ã¯4\'\×5ô§ˆ Pz\Ò\à-*ñ×œS¾i0N:S0\ÄñN\à)©AÁ©^q\ÆA\äWœx\ì«\Ú[\Æ[¤>»k\Ó$×•x\ÖE–ö\Ê2OË–>„\n\æ\Ä;AXuy£.\ÅB¡z—#¶+°\Ñ2S9\ãw\ÌGò[.\ïu®¿F„¬@®9\ÇGYUôFÌ‹Œû\nð¿\Z\Íös\0\å\rµ\î\Òg#\ÓÖ¾ñùº\åÓù\ê\Ø5ôy\\oU¾\Ñ>?ˆ\'j]\æcZœ¯©$\Ówªž™yd\ä©\í^úGÆ±\Ëg¨\Û\ß5)B\\TaH\Î}*\Ô`2þdU$\0FNsÁ©¼*1:g<Avdv4\0ˆ=—8©€ùñÀªjrðI5cC—w©\0Šh<\ã\ç‘JqÁ\à\Òfˆq\åN\ã ô¤Ç­e©À\0x9¦©#ò\Í8ŒPA\Ï#šs\Þ\Ô\Æ94\à3É©,Lr)ø\ÃÖ”\'¡§ƒÁ¤\ÙiQ\Í&ŽO­.x\äv¤P\Ã\È4{\n~KaJI# PŒ\ãÒ•X®@\êE(\0û\ZU\àw \ë\Æ;S±H‹“{SÀ{\Za\Æx§£­“\éø\Ò\à§m\Ç4›(\Ï\0\ã8§‚\àò0qMs\×(#<\Ô6Z˜÷<r;S— 89\ç4¸-\ß1Ò¤±@Ú”-*rjw;I¨¿\Ä)p\ÝE5[\'ž¸\â¦§¥&€bƒ\ë\íRP\ãžô\ì6(\Ø\0Œ{@sK\ìMÀŒt\Í&P\ìS€-ƒŠj\ã½<p”\\gE.FzsHO9¤Á°©:SWJPH\íI`@\Ç\ãIŽM?Q\Ø\Õ\0€r)A”œS€É¤ £4\â8\ã¥;u©{Pq@\âŸ\Îz\ÐX\Å\ÎqO\ïF1K‚y©\Ûxv£Ñ¸{\ÓÁ £gš3TÚŒS©\Ä()!˜\æ”Ó€”{\ÒcD@\ã¶jN(\èsN\\â¤¡¤\ng-\n\0a¤ õ¥Ç­4\Ð\0}\Í;¹¦âŸŽ\Ôf9£~´üsM#\èƒO\Ú1I\Æ \ãø\Æ*R\ß.1PrzRó@\î9¹\Å7\ëA9\í\Í0Ÿz¤ˆlni:\æ‚x¦\ç\é\ÍRD67Šn8d\n\\f­r>iÀS±œÓˆ\è)ˆg¢KI DœA\íMÁ¥¤P¹\0\â‚sH@=iF(°	Ò—$Š1I\ßV\ÄÀ£oj\\ÑŽ8#B\Ö?žâ£¼`\"v>‡Ú®[ª\ã¥RÔ† ð@þUœ~5\ênô¦ý˜õºþ\á½djŸL¸·C\ÑAª—G3\ÊN	\Þi\ÐBòœ($\×\Ú\ËJ_#\â¢Üª|\ÎKT½ûNªüVý¬\ÐG± 7¥sW–\ÆIò1Š»ao\æ\\#¼W\çÙ”¯Œ«\å#÷ŽN–I†\å\ëž\Ã\áŸ\Ù@Š¬ûH\ìkØ´ýB+\èƒ\ÇÏ¯5ó\ÚXhbP_\ë]_…õ”\ÒõX,·\îŠ\àb3œŠ\äM#<e\â¤·=Ÿµa\ê:´V8\ÜÀfµ®$B\ï\è3šò\ÝkS°–Tkƒ\ÆOµwG•<™Õ¦µ\r\Òs\Ø^%ñm†©¤\ê*8K€­\îµ\ê6\íc-H2¦¸_\é\Ò\Þ\è\Ñ`e\ÒU\í\ÓÞ¶¥$ªE¢ªQo5-¬Yñ|±L–{*\Ê[¯\\\×T‘].§\Ñiºo›\Õb\\ÿ\0S\Å}\î\n\ßW‰ùV5µ‹š\ÛS\è?\nE·Eµ©ž+f\èÁ\äU?\r¨]\Z\ÌcþY-hÜ¦\è«\ä\ë;×Ÿø™õtÕ¨Cü(À b§A…\ÍH\"\Û\×¥ÀÁ¤b\Ä\0bš{ž™§¥!«3#\â›\ÍHFE&8öõ hˆ÷¤æŽi1\éI”%0\ã5.\ÚiZ‘¢i©&šzq@\Æ˜=©:\ïN#4\Ó\×\éAHf\Þi:\n~r8\é\n\03\ß5#Jy\Í;þ¢Š–R#À»Q\É§ô£‡r3\Å!\Î;S\Â\çµ\0¥u4‡¯µ;e \Ò9\Í*Jn\r&†˜\Êk8©p)§¥\"“ #ñ¦‘RÔ˜\æ c¥2¥4\Îôš4˜§\éA^z\Ò*©0\Í&4Fz\0y¤ cŠP3\Å.*KL‰—Š\Ç5#TMœd\Ð2\\ó\Ü\Óq“Rº‚1Šb\09\ï\×Zkg¯J˜)\"™ \\T\ÜdLö\Í4’O\á\ÅH\Ë\ÅŒƒ\éŠ\0ƒh\Ç\áM\éV_ibEB\Ü\â€\"$\Z)\ÜSö€<\Ó@7*Blu©xj<ñLLi@£šŒ\çÓ¾HI\Ç4„€1M#67$\ãšM¸§\ÒñŠ !#¨\Å(\Ôòi¤sRÀa¥\àñÞ”ƒJŒT2†cŽzQŒÞŸ¶›\Ü\ã¥@Æ•Á5lT\Ô\äœSž\ÕB\" zgÚO§\"¤)»aI qF84i\n‘Hcwe…§õ§m\0y\éP\ÊCyÀ S§\àÂ¹\êN*i\Û\Øþ½\éUxŠS§?7£o\ÍÁ\Åf\ËD]±\ÆI\æšAëžµ6)\npG$ž•¢\r¼sM=*R•\Úx\Æ9¤\ÉLñH±›p;Q´\ã\îœ\Òõ÷Àæ•\Ü\Ò`3iú\â˜8o˜ûS²y\Í \å;sH8P=\r&9\ÆiÀq\È\Îx£&2.™¤R*a‚sšiB0($nN9\Åús\ïÚ”{Rñ@\r\Æs\ÍAõ\éK»\0€h\çŒ\Óléž´7#ŒŽjC†\ï\ÐqMÙœƒÖ\r\Ã`t\æõô\Å<’G\'š\nü€P;\r\Âö=ª3\Ï|ûÔ€\Ï?JN¹=E°\ÜqøsQŽFp*SÈ¤u\n\Ä;n\Î)ÿ\06F§\ì3KÏ§Ja¥vŽs\ÅG€•Áô÷©Yi\n\ÏËŠh–ˆHcô¤Ú½\êr½úS\n€9ªD40d7úþ4…C\0¿Ž:Óˆ\Ê\àzSpªG¡\ïT@Œ¡Hšs\Î>SŽ3R—\Ï=ª\"s’*I\"¨|\àõ\Ü~¦§+\ÏNh@\Åy\Å?Œg½!X­&0\0\ç\ç4€s\Øv©¹\'\0\çÒš\à©})Š\Ä98\ê}Zy<¼pp\Í3h9=¥9r«´®)ŠŒ„Ž}zt\æ˜$u8\ãÖ§Áb<Tc²ú\ç¥±Œr ô\çŠUg?\âi2d\Üq‚\Ñô\âªŸ”õ¦™\r\rU\'s¤ú\Ó$b0\nõ….xÁÀ\'¹\ì)žNý\Ç<c8\ëV™$nT¡e^¯µVòöWüûšþ@A¨\Ý\äXsC`V³‚H#ðùOj\ê|= {’žzv®l®c\0Œú\ÏJ\Þðò\ì\nG<\\˜•zlôò\ÙZ¼N–= cšØƒŽ¿\äVD<žµ­lI\ãƒ^4÷>º\Z	ü&¤8À\'šbŽœ\ÔüÂ²4Ev\0FÀ\0jx9\Æ¨\\>µ,$`P†iDø\ÆAŽy«\'kõü\ê¬°V\'œ\àÕ’\ÏoX\Çp}\éU0;&—rµ})\á6zõ\íNiXûb˜ÀŠ	±\ÅB8ô5/~Gjk\r\Ùúb ²b>^ü×’ø©Kkv\ê!#$ž¡I\ï^¸\Üq\êkÈµB\ßð\Ý.APp}\Îkð£·ñ`U\Ç®\ãKM¢\ä®\n!9¹®ÿ\0NR Rp+\nSlAji\0ROA\í_9_H&¿žO\ï\È\Ü}M}©\É\äY\ÜIœl†BO\á_;S#?bO&¾£)‡\Æý…\â)\ëJ>¬%ˆ©£ù\ÓÞ£Pp\n’2OQžG=\Í{–>X˜&G¾:Rý\Ìüª@‹¹HSÖ“8“\nO-\Í;6ô=†2jÀ\éQ\"\r\à\Ô\äÿ\0\nHcPq\Ï4¤\'<´¸\ÈÞµ!\'<ž)\Üv“ …;\0gŠ@9\ç\í¹¦X§98\ÉÈ¦\ì\0qž´ª¿1\äñR\í\äÒ¸\ì4i\äúô\ïHÓ‘UU\î–\ëiˆ˜}ñI²’/\0}©W#ŠÀ\é\Æ*P§H\Ñ \à\0{T€Œr)B\ätõi\ÆqI”\Ô)1I’=¨\Ú\Ä\çœñNjE1d|¢—nH\ïOU\É=) \î\Î2($6Œš“À8\Å.\Ò\ìô i\r\Ú@\Êõô§\íù­9@l\ã>ôñ´ð=qSq‘ð3\ß#­($À\íHFö§´döi\\„ñR\Æ\r ù”\ã=zÔ b¤´5M8‘\çK\éKŒŒcŠE$x¥´ó\ÔSñ@\ë\ØP;\rÀö¥\\€\çÖ¤\Æi9 V¸?Z“ƒA<\np5#Hi8<S¶\ä\Òó\ÜR\às@\È\Ûpj•A\ïN\ëK€I ÷\Í1\É\0œ\ã§\éÚ¢•3À¨)\à’S)G´Œ«\n¼F@\ì*µ²\ìNÿ\0Z\Çx ”{S¶Ó—§q\Í?­\n3Nû\Ç4‡d7œTŒ`R€x§„\Í+Ž\ÃqÒ—ž1Þži\Ûy‡b<u£iýy©@§ªŒšC²!¤\ÚsÒ”.1\ëJhÑšLT›sŠ1LÀ\Í(\ÏzPœR\í\È\Î(¸«“\éJ<S±Þ—ŠCCq\Í(ý)H zõ aŽ”‡þj´\å\ÕK…$Â€F1×šd2	6®*l¾´9§Ž<¯…r(:\Ó8ô§\ä\â\â€šJR	 +\ndˆ)sGz\rP\nM0Ó©1M\ÈúœSsR\â“\0\Õo­!À¤\î)ø\Íˆ(=E;ü)qN\áa¸&œ˜§N\à„ g§¥(žª((a\ëN\0b—n3@\0\ßZi¤=\Å4pqA\"\0qJ2q@ž“*&Õªo‘YZ\ÈU´›8ÀCžÕ¿b\Ì\Z\æ¼D\ÛtÛ£\Çú¦\Öt\Õ\ëEw’:*é‡›þ\ã>g‘F\æúš\è¼?3–\ÆGFÞ¹ò¹ã¨®“@!/£dW\ØbSú½K+>3\Ó\ÆR¾\Îh\Çñv›k:\0«4yüA«zo…\Úú<‚x\â´|il\ë¬˜?º€qÙ«©ðeôJªb¿6Ä·\í¤\Ùý”\Â+*¤¢¾\Ø\Ë\Óü_\ë•\É\ïM“\Ãö\Öz•™Gl$\à\é\Ízü\×«\â5\æ·‹{©£\Å÷c~<\Ö7l‹rm½4)sn\ÈÀ€\ãçº‡\í\înr\ìH\í\è+¼Ž\æ&Fqšz\ÝÀ\ä\rËœô5w<h\ÅÅ´Ž2\ÛÁð\Ú\0\Ñ3u\à\ÔZ…’\Ì&@@aÇ­zÈŠ…r\ì¢K¾H\ã\'5tß¾‚­\Õß±\ç~,Œ-Œ-Žw‘^m›šõo:X¢\ã;³Ÿjòý¹pr~ƒ–¶ðpo\Ìüo6if5Rî¤ô+¤ÙŒc÷)øqW®\ÇËSU4‚V\Êô‰j\í\È\È\à\×\ÊMÞ¬Ÿ÷™õ©ZŒWh£!°M3,Ÿ/Ö¢Ýž‚¬\æa\ìiŽ£9©i‡¯5fdG¸ Žy4´\ÑI€*JLz–X\Îh4\áÀ£ŠD8Œ*m§¿ZB1@\ÊûNE7õ«›ŒT²ˆqA)Za\n@G€£½6¤\ÅÁ\àRl¢<fŒ\Óð3IŒŠC\Zzšn6ô§• \ÐPQ\Ó\Í4Š‘€\Å3L\Ð4¸©\n\ã\ÔSOZ\0e7žz\ÓMAddf›Š˜Œ\Òi44\È\Í4Œô3(¦•¥IDt\Ò)\çŠi\0\ÆÃžjN†ŽH\ÑLóO4˜\çÞ¥”†r*\"L\ÔÞ½)Œ)GŠ‰\Èµ7Ö˜G#Ò€#\Ç4\Ç\Â~U.	\Å0Ú Ž9¦\äö<Tž£+ C	#½GŽi\äf”¯aÈ C\n\Ò`\âœFi\rRšC\ß¸\ÏZ0yªB\"<ÑŽ™\ïO#Ž)¦@\Þ\0¤\Ç4£¥)\\ŸÆ€)Ê¼Ó±H¡¹¦\àT‡¥4Š†R\ëL\Úz\ÓÈ£žjl\r¢2O@)\n–úÓˆö RªDŒ\\\éJy§/Rž(O½Ô¸5\é\Å&R\Ð:Pp=©\àq\ïM¾FjÆ“ÀÈ£\äð)\Í\È\È<\Ò\Æ};\ÔH\Ñ\"ô\çµ=—ŸN})ÁMpyô¬™H€ŒAKÓœúb¤À9Á\ê8¤8PZ\"\ÆI#ò¦\í\ê@\"¦\ÇÖ˜G@jnQ_\í£8\éŸz¦sÖ£a´\Ò\0§\çL\Ç4ò2{\äS	l\â€eš“h8\ã©>Â¤\Éæµ\ÇÒ°\íÞŒö\Æ\r8ü€÷JA×ž Sˆˆ-G=3ÒžpI?€¤œu\ÅzŽ˜4£Ÿ¥.\Þ9âŽh†\Üvõ©@\ç#ÛŸ­5T\ä\äþ4õ²((onq\Í3 džµ!Nzú\ÕPB\\Rø\à\äc5y§sŽ¸\àŽ¢„ÀiŒt8£\Ðs\ØQ‘‚3Š9Á&Fh\ê\r&¤*@ý)\Zy\"Šc9\Í*\ç«¯½±¿y‡½#\r\Ø\Æ0E›\Ø\Òr\ÇØž\ÜU#6EŽ\0ó\È\ÇsIFÞ™\ÎqŽ)¦CCv6\çJ\\sÓžþ\Ô\ìc=\Za;z}hÑ’.{‘ž84\Ó\Ç\Ðô¥†qÀ\É8´w\n@1‘€\Èõ£\Ä	=\éü‘Šö\Æ9<P\r‘\È\'¾)Jƒ¹\éÖž\ÊIÊœ‘\ïH\ÂB\éJ\â±Yò\ìsž¾¾”\Æ\ás\Ð\àŸ¥Y\Ç\Ê7rA\â¡+œ¡1Ÿjh†Bv\n’MÉ€\0\à\ZœŽzdñQ¨ózõ\Çlu ›\"&NG5F\ß.7t=…^d=s‘PÉœ>y\ã#\Ñ-¥‡ˆ?\ÍC3;—¦2´³DÄÙ©.€õ\'\ÓÒ¨’¨Ü€\ã€\ï\ë[Z›ndB\Ü2\äY\r…$s×®x\Çj\Ñ\ÑÇ¨F\0\ÜY\n‘õ\çŠÂ¾°‘Ù‚v­S²ŒllöÏ­k\Û9QŽ1Ú±\Ô\0ø\ÏsÖµ­\ØdqÏ·jð\ç¹öTö4£$\ä\Óõc<P¡P¹§\çÆ³f\È\\½\ÛRC€\ÐGj|\'#ŸÀö¤2ý±\0`òj\èSÁªùÝ\Õl†ñ\ÔÓ¹,÷a@\ïF#Ú…\\ž\ïN8¯§<&7i\Å0®MM•\é1ž”®8Áô Š‘ñ\Î2\rDA¥Œ«)\îqŠñ\È\Ö[fþu\'n\Zõ«™RC\ÙV¼\Ú\Æ6ýü¸<»˜W)\ìŽü*Ý’IkºX8®\î\Í@É¢ù—K÷}+³…v _aSAvaø–Bš=\Ùl\ç\Ë\Çy¯X‚¡\ë\í^\×\ãY\Ìz3€^Aùu5\ãi»?/zúÜ®6¢\ßyŸ\çó¾&+´•c¹zô«  P@9\Í8¶T7\0»M%—G×­z\ÇÏ“£HN21šc¢¬ƒp S\Ã|Ÿ/¡\ã<\nš?˜`õ<\ÐŸ7c\ÏQNý\îœ\n@\Ëbœ\0|\ZV-\ì{S‡ œ{f•GÒž\êe$7§´õ28¥\0Ž‚´Ô”À¼\æžƒß½<gO \Å\"’´c\èi\Ø\è=(\rR \rÖ‚Ð›@õ4¡=3ùÔ/8\ã¥¡1\î*/8” =9§(Á¡Œ“œŠŒ\à“O#o\áJs\ÅH2-»Ž9\ÅI¹±ƒù\âŸG—‘»½!$*¯#µ9<‘\Ó9¤Ï¡:bžzgZ’\Ò\ZÁ\Ç~8¥Á? §g\"˜\ß_N*F8\'¦8¥(=³š\ä¶0FqR¡üM!€\\qN\ÆªE\Ú{Ó†8Á\Å$D‡*3RŠx\0~ò8÷©e\0ŸÊ`9§‘\Ç&…\Ç\"€\Z)\Ûr/\éI\ÎhÁE8\08£’?¹\é@\í\Ï4¸ýjL\ZB1@\r\æ”“š=iÀ\Òc¥Öœ9\ÎE.jA€½iþýHÓ±\ÛÚ–\Å÷¥ô\âƒ\ß\ëOU=ÿ\0\nb°\0\nP´£ŠPy\ÇPhc¸¥\ni{õ§\ÏJ‚\Ä^œR\âŽÞ™§ª\äReÁ§<\Zv\Þx¨÷\áÂž†§`Š1E\0J£4\ìd\Z¤+\n\Ù¥†;Ô(Pm¸¥/cJi\ï@\Æl\ëÒ“mJy\ßZ\0a\0f™Œd\n˜\äRX\Ð€KŒT\Û3Ò†Œ@óž”‡¤\Æ9¦0\â€\"#4c4þ¼\Òw\Å\07¥\ç5!\íMÀ °£9©ˆ\âš\ÃÖ©\È\éH¥	NÁ\Ä\È\Ï@)¤f¥\Æ\ÞõD‘c¥IÒ—cÖ•\Â\ÃE;ü)h\Ï4\î0iÝ©\Ç$R\í¦zRŠpš`Þ€\Óý©=i‰‰IRm÷¥U\É õ Dc\Ó\Ôix\Î)Á@aIšEemv\Åq\Þ)rºE\Ù=|¬WhWmª\×\ãY\nhwC\Õ1F\Z<Øšk¼\Ñx\ÇË…¨ûAŸ?\ÍiZ\ÊC©S‚¤sš\Ë\ç5,o´ŠûiE5c\àc>YŽ¥?öžŸ,Oƒò\åO|\Õ\r6;›H•\ÆzTVR‡!XûWSg\ZJ›\ÇlW\Ægyz…HT§%£?_\àž \æ¡_ˆ\Ü-(_·R¤Úœ\Ò\ÂDŒBcÖ¹¸¥ž”‹€¼ð~µ›â‰¯³%¥²\åS\î+ˆŠMBpq`={×ˆ¨\Æ\Z6}MLl\ë\Ý\Â:\Ëc©jÓƒºA·6k\Ñ-\í\äž\ÕH<\Ô\È=k\ç]3O\Ô\Äs\Ë\àÌ¸<õ®óIŸ\ÄZ}Ö;–{vqŠG@{Ò”cÑœ\ë\ÚÁ\Ý\ÄõQs0]Ú³.õ`\ÂL}o\Þ\Â!—p\çxÈ¯6ñE\ß\ï`¤s]™^bqq‹øV¬òx‹2x,¶s…”\åh\ÇÕœæ·¨\É};;t\Ï\Ê+<“ý\áO•\Ë1$\Ò[\à\ÜÅžs\"óø\×\ß\Æ§K–*\É#ñ·RUksIÝ·«>˜³ŒýšùdŸÊ¥ºJûŠµh¤GÀ@)/T\r¾Â¾\í³ôI/Ý˜n2j%Sš°Hj\"À~©\È\Å+\Æj2	*ÃŠnÆ\Ì\Ú+\ÒTÌ´\Õ“\íE\Æ0ŠB:T¤qIŒqHñù\ÐG=iý\Å\ëAD@t&Š“n)¥r‘	Zi\èEY\ÛQ‘šEX„ŠLSóž)*[\Ò\î©)\r!Œ\Æ))\ã-øSph\ZC1“IŽ\ç\"¤*);Pe §ö”ˆñž)˜©qõ£´˜\Z1R‘\Å0®*F0Ša.\ÓM\Ç\'4›(Œòri¸\â¤À¤\"¤²3LÁ\æ¬\ã\"™\íC\r¦Œ{Ô…M7!„Sq\íR\ãÈ©*\ÄEEFÀ\n²q\éQ‘\Í+•b±\Í3iOZ±øqšo\\\Ò_€1\ÎEY#€j<\n–Æ‘XŠcƒ\Ó\'š´zf¢`y4®%>˜¦”brqÚ¦\0òE/gÚ\ÄU#Œ÷\Í3\êr™¥\Ó\"\Åb¥À©˜´\Üª\â!\ÇAž;\Ó¥O·¢ šb°\Ð1F\r<¦FzÒŠ†÷¤S±Ži8&ˆp)§Ò›$3\É\íNw4\0s\ÜR`\n“‚h\à{TÙ\ïI´ŒT„Ï¨¦€y\Í4b“Ò¥ c=I¦s“I #=)‡­HE3˜\Ü8\0iv\Óòk6Z# 3\íNÀ“\Í¦{T=M\ÞiGõ©1\Ðv¤\Ç#Žk&RU{\Ó@!z\íR\0i d\äVe¡§éšÔ’:T§¦4\Ò20jJ#9\í\Æ*=§?^qRž\çŠi\à\Îh2s\Ôu¨\ÏoòEJÁ#“MoºXƒ\ÏjM€‹\Î@\ÛLßŒ~˜\â”)\ãßŒ\Óò3ýqRx`Óµ(Š”¦¦ñ\ëÞÀ„ô\0š\0\ê	§8\è=¿*\\ch‹€‡¨\ÏaL\ã<f”gð\Í8\0H¸¢â¸£1\Æi\äQ«œö °\Æh¸\ÐÐ¹<pµ#?\áVL\ä\çŽ7j÷‹‘eBœŒ\äô Q\ÆH¦›“HCÛ¸\'#\Ö\0ž´„\ãŒ´\îq\Ó\Õ@&ph÷\Ç&ýH¤\'§4À3ô¦Ÿ¥<õ\íœSŒ(%ˆ1\ÏO\\PT`\Ç4qò\çœP\Ç#‹ÆAôâ‘†xù©\å·\0}\r4¯\Ê>¼j«’È‰\Æ\Ð=8© r=©\ã9=¡¤ …”B“\êO&ž(À4qœgµoC\é@XBƒ9\'&Œ/^¹\âœ8\ì)q•1 ,EÁ\ëÒ˜\Ù\à\Çò©q»‘Œ“Q…$ô\ÍH€H?ýzh#¡\àç“š•‘x\Û\Ð\ç­DƒœsŠh††’\ÊøAHBr\Ø\Ç5*“¸\Å3p\\ô\êF>¦™!´\ã–\çG\ëL\áG\É\É4ñ\'ËœwÇ¦MFø”ðL†Q’=\Çvzð°¤«Ï·P9©²¹\ç’2qU\Û{`œqTGQ’a‰\0 óRi`Á}	\é—\ÇãžµJ’7t\æ‘,LNq\Ôö\ÍcS\áføw\ËR/³GxÀ,€‘Zv\à1‘YlI`\ÇµhÀN\Õúô\Íxu7>Ò‹¼Q¯\Zò;ñRg#«þµ0\ÇqƒšÅ\\\n|C/Œ“œRO¥$yó}\Ê\Ð2úp\Ø\'œv­\0@‚€\re¢\æ@r:Vªg Æ‚Y\í\Ä\r$\àÓ±\é\Æi:\Í}S<1¼ñN RJš‘#ƒQœJœñ\Ïj\Æ2ÃŠ–R\Ü\Â\ÖU–\Ò\â@z!À¯9\ÓÝ„Ay\É9\"»ŸHSK›$Ž@üë²\'\Ë¨ùFy¸—y¯C\ÒÂ¯tÔ²Èº\ÉJ\ìÐ‚¦¸\Ý3i˜“Ž\rv{v¨ú\n\×´1\ÄuñSö;d\è¤\çð¯-EaŽ\ã\×\é^ñ\å\ÌöÐ¨;vn?S\\	R«žsÚ¾\Ã/°\Ðù³óŒ\æ|\ØÚžV_0_\\R£q)\Ê[nXO\ã\Í\"‘\ÈŠ\ï<†<!À8\ÅL˜\ÜÝˆ^<\åTœõý*\Ëœõ÷\ÅD‹Ê›¥XE.8\0TJÜz>L	ƒD…\ÚA\é\Æ:Ô€c<\ZT\çŠQœsRÙ¢Cö\0G©¤R6±\ä\ã4\îr\r.Ó¸zŠE\0õ(\ëB†\Ï\ÝúRŒc\Ð¶œ1\Å VÉ©$\ãòq´P+”ƒ c4\ì3w\ëK€ÀzdóF\ß/žý\Å+”˜Þ€riG\r×¨¦±a\ÓS²x8\ìh¸Ç¡\àpzw§¨ö\ç\Ð\ÓT9§€>„Hc€fÁôý½½©Š0ä¦“cHRŸ/\0\ni\É\ÇO¥HxšB¹=ªX\Æ`’zb”ù‹b¦*pA\Í4*…<pzÔŽ\Äj¼ô\æ¥\Ã*þ¤û§©\Çù½ñC(DR@\ëÀ\ëJœÓ€^sÓ·\ãR…ŽÙ©(`ö§\nv9µ.~”\0\ÎØ§Ž†ƒž(\ì(\0?Ò–œGœ4®TS\Õ3O\nS±“Jã°€÷\Å3ná‘š˜\ã€ôªs\Å<R\Æix C¸\'\å§P1¼cŒñKž\Ù\Å</=h\Çõ¤\Ê3’;u§\ZR)H\â¤vr)\ê´`ü\é\àb€H0{SúRŒc”)lúPP€t©pi¸#­Hh(i\äõ\Å3\0°©6±9¦°$ŠV1óRô¥Á\"ž¸>”\"E´¾¼Òš6“L.8\Ói\áOJx\\\nr5QO”.(Àq¤fŽaG8óN47¨¦y©08\0SvóA,hü©À\æ—o4Œ\Ø4\r\r TdS\ÏšH\ï@\Æ\Ò`Ô„g?Jo9€J1ŠR8Z1\Î(¤PW4\í§½5d‘r(©vqÒšTPg“M#mJTn \Ç\È?¥°ÁšQ\ÏZ\n\nRƒÖ€S6óšƒ\ëKŠS±\îqŠ]¹§cŸÆ¬‘JzçƒŠ—\ni¤Ó¥\0B3º‚½\Í<\àÆƒósTIU§=©B|§Úžz}(\Z€[©b¸Jn>aSBª%Q\î	©f‘:)Tˆž+\Ìþ!4)=7(\ê3ñ\ZŽ\Õ\å?\ßnŠ\Ëý\çò5xq”Æ‡˜é­þx(É§Ž¢š*TF\'¦q_os\à\Ze˜£‚+¯±\ÔR	p\ÊA®z\ÓK»™†\Ø\É9\éZ>%Ó®´\ÍJÀ©•‚l×™˜J‹¥(É«\ÛD{Y2\ÄCNpMG™)>–dZtj:u\Ç?¿\êÀõÁ5gNð+’%v>[ô\Å\'„|9q ó%m ŸÎ½¾\Ö\Î+{ør3_*^ö§\ê\Ì#\nQ)k\Ô\á´ÿ\0\ÛFøp0H=\ë±þÎ¶H\ÑW»\í\ë\\\íö£4z„QE\È\ÚÛ…b[xŠK«£A;	ô5•J6Ô¬.:uý\ÙI³¶¼´¶£\äž,·š\Îûcý\ÖS^Ó¡\é\î¶\á\å\É\Îqš\ç<{ µýšO\n$\ç,µ\èdÕ£C¹”ô¹\âñMb°v†®“\æ²<\ã­[Ó=ý²\ç\0Ìœ\Õy#hØ‚9¡¢\0úµõ™k\íj5\ì¥þ~iF-Ö‡ø‘õ\rª‰š‡R?:\éV¬ñ€N8¨õa‚ƒÚ¾|g\èóV¦sRš„)=\Z¸\Ã\'&—b‘[DH¸\0PGZ›9 †D}\é>•&)¸ cŒqO4‚¢2=GZ0;Šy\æšE!¼\Í4‚qRûSx\ÇNjH¥4Ž;S\Í7E\Å7\"¦\"£Àõ©™SX`SñHØ \ÊBH\í\Å<Ži0h(iô¤ €.3Ò—¯z	#ü:RO\ç4\Üæ¦4úS[Ú¤\ãžõ@Ä¦pqO\äš1@\rÀ&™·Ô g4œçš‚‘\ÕŸz˜`\Ó\ïŠ\nL‹¦“R\ãSzf¤dDsF:f–”\ZL\Ò$eyâ¦¦ALý\rC4H€\ÔdT\Ý(ç°©¹V+\í9¦\ÍY¦J\âh¬À\nL{T¥qIŠB \Úi¥A\ìzô©°@¦\ã\ç¥4.G.	$S:ô¦Œ\Ò={T¸\à\ÅHP+\ìt¨\Î88\â¬¦6s\È\Å%•öði›MZe\ë\Ï-Qm\0‘V™cŽ\Ô})ÀÔ§¯\rP\ržôÐƒ9§`Qš\0Œ¨ÝœS°M;ŸN©\Åy \nü\çšv)\åO§m\ï\Í\00å©£©§ƒHTP\ìi¤b¥ {\ÓHö\â¦\àE´\àý)˜\ÍLHý)œRÀ<\Óð9ƒó§\'\æ\í\ïPÙ¢ƒ\ê)­¸ƒ\Û\ÔÓ¿ˆ\àQ\È›-:`\Ópy§\ã8É¥\ÇšÍ”ˆÊƒ\Í&9\Î*LRƒY²ˆ±’M!\ÏÖžZCÇ·­ID-“œA¤\Ø9\àq\ÍHFA\ê)§9ö\í\ÍKe‘0bq\È\Ç4ò›ò	§¯\Í\Ïò©\0q\ßT¶I!ùO ¨Šb­?W/u©\Ê.\Ö\âa“÷»R¸\'¶2j#‚:sš‰*¤œdsR\äu¢\âbr\r\r\Ó8w¥\çü)\Çd\â¨D#ÿ\0\Õ\Æj@:·­(\Æp	ÿ\0Aži\\V…`1\Î(^O9\ï\è)\àg·Zplcy¥q¢-¸\Ï4\Î1Þ¬1Pzz\Ó1ŸÖ‹”Wbô©ü…9•s‘À\Æ1ø\Õw‘sŒ\ã\'ó\Í;Š\ÃøaK\è9¨–U\çT™_Jb\ç’:\Òp‚0iA$šB\0\è*®N¢\çŸð dc=ø\ã¥  Œ\Ò\î¦!\Û[c¶)rOOÖšô\Í7¨\Ð&…n¿ZF=¥?1ã¯½ycœ\àPH\ÌI4\áÌ¸8À\Å\0ú{RŸocN\âhŒ)zPPŒb•‘‘ƒO\Â21E\Â\ÄG¨&”aT\à}E;acŠM¤ŽI\éH,4œŒ\0$ƒ“Þ¤ô¦1\n­\Ñ\n\åLu\ÎpH! ¶23M\Ã\ä\nh–@©Á9\Ï^iŒx \èOµLAÀp;óQ•\Ú\\œžGN\r2Ã¹FŽ£i\îœóš”0\É\ï\Å3*0=\Ç\ãA\rf \0Tg\ß\ÅW;˜ž?wŠ´\Â%^?\Z®[\æ zu#8÷ª¹P8898\ÏZz\îi”°w=cõ\ì\0¹qÚ£ú\ä\àEg7¡¥/\È,\è°&´\íP7w¬«}Ÿe‡€Vµ³\Ç¼J»³\ìð\Îô\ã\èiD\ÛIôô««Ž1U\é\Î*ÒœsøW9\×9\äSI}\ê1\Æ*B?*aÀ#¯^()–Gf´Tôonƒ¦k0ð\05ª™!OJv!ž\ä«Á\0\Ò`ƒÞœ\ÇZi^ý\ë\êY\á0\nsG8Px©0Œõ¦ÉŒTµ¬@úqP\Í\"q~.%š§9w¥rÖ¤¬x¶¼Y1+\Îþ+Bù\n\Þ\Ã5\åWw¨\ÏR‚µ4khË™NGB1];Q‡¥rú\Zt\ÏOZ\ê\ã$\à\Z\ëÃ­Ç‰{ž3\ãi|\ÍXF9\nŠ:W0rz\í\íœ\æ¶üK‰u©\Øzó\îk, #`\à_e…V¡Mu™\ã\ß>*«þû#\Ç+\ê{\ÓV=¥°:÷©¶nˆ©•@?þº\éL\áh­X³øU´\r´õæž«žÃ¥L©·‘\ëN\å¤1UNO½OŒ\â\åŽO¯õ©R3ŸSJ\æ‰\í§5 \èqO\0f¦\Ø=\Æ~”!U\Èn;ÿ\0;9zSŠ.\Ç\\\äT\àÜ“J\ã±Ã³$tsN6\àž@úf§+=úSp¤\ÜuÔ®;\rÁ©§0þŒŽy\Ç\\Sð\Üh †aœ\ZLŽH9\æ¥\ÆTzc¥4!\ì1\Î(\Z#\á†‚¥+µz÷\Ï…\n\äN\ìA¤0Âžß…H¤nô›3õ«\0\Ï\'žõ,´†´jE\ïšx0\î)ì£\ëÚ¦\åXj€Iõ )\à\â¤UZ‘TsJ\åX‡§­\róTNy\äf•”œP!Rl\0\0})H©)0°(\ÇjA\Çš£¾\rJG\0Œu¤P…=\r w\ìgÚ€´\äRO\Û\Ð\â—\'¾(€ND\ç­=z\ZpRð©¸\Ðc&‚\r?“h\È9©l¢02zSº\çª@´e9!a¸\ãŠCƒRb‚;Š\Ä{GoJ~0(¤ “EÁ!€S€Á\éNÁ§>”6ZCÂ€¹§…&G®)]\Ãp3NÈ¥ J£&€œ\0\êjB9¥\0\n\0Ld\ZU\ÏzzƒŸcKô b\Î.=i\àq\ïNÛŽzP\r‘\à\à\Z6œT˜4ý¦¨\Çµ;\à=©G¥\03Ò\ÄÓ±Ç½-\04\Òc\ÔÔ˜\ìdŠˆ‚Ž£=)p\r%©\ÜP1¸\Î:\ÒSñŽZn1@XiûSsÒ§=j2D>n´Â­‚jÁ\0÷¤*9,d \Å<\n:f@\nF…\î\Ã4¸¿CTu\Å#Ó±I\Ðb™#:)\n¶=s\ÎjA\×=\ÇzVª\âƒ\ïO\Ï4cõ C\Ù2ªYF}juS\×9\Ïj\r\0Dy\ÏjpP9§¨\Éö£æ‘\ã§w8§cšh?7&˜‡R\ëRþ4\Ò?…Q#J\ÆijsF\ßn\ÕBd8\ã\×\05(§“FhrOl§\ÍSž¦˜8\Å\\³MÓ§–6¦®Ñ·t¹T·zói\Ò\Þ\ØGjIó+\Õ\î\Ç\Ý…xŠ\Ø•\ZÎH\ÔJ\î,\ê\Ä\ÐU©J›\ÚHð\Ý?À³9S´È®¶\ËÁö0°Ü»…wþR\"\0*0€sŒfºªæ˜ªŸm¥\Ù4²¼%+{ŠO»)\Ú\éVV£\äzzt¬¿išÎ–Ð¾7#LzŠ·«jöö\Ò R \äWšø{R×µ«\Ù\çŒ\î‚7\Î=½+‘T”\Ûw;\ãN1’I#«†K\n|¤\01ô\â¶.\î\Ò;M¥À,¿­C<\Z+(\Â1\É†¼\ã\Æ3^–µŽ&Ú²>:ô#½m¤Km´\Çûw‹fB\Ù\Ùl¶\êô\Â6\Ziy6gbÜŽ™¯%ðÐ’O\Ã2»o\åN;\nú&ò€+S³·‘Ûƒ\Ò7\ëqQ\0^A,\n\çf¯…¦”ÆŽ\é{Ç–øƒÀ^\î’\Ø*?$®09¯;\Ó<3a\â+–#…I\'¥}&S¶j»\Û\Ä\Ì	PqÓŒ×­C6\ÄS¤é¶¦¬Ò¾\èð±&¥eV+‘ó&\í³\"\n\ã5«Ì‚µV³õQ™9\Ï\Åy•¢\Õ3e9\â“©\Ød“L8<Îº5Œ\àg)Œ*]¼œ\Ó3Uaœ\Ó1ŒÔ¤uâ™Š\Z\Â\r%;‡ŠL\Þô›i\ÜÑŽjYH¦x¤<š~0i3ùT2\Ð\Ò8¨ñRF\r\ZC#=©¸©\nñ\ÅF@4f1IŠ\Ò`\æ€\"›À©ˆ\ïM\"€#À¤âŠ\\PX“§Jy\Æh hŒŒ\Óªb04Ý T´20	\âŒÔs\ØS{R½\é1\ÅI¶šy©c!<fšELE3žM\"ˆŽ	¥\Ç\ãJs\Å7o\Z–††m\ÏzŒœÔÁ\Ç˜^*Y´D\ÛKŒŠ\0zš…\ß\Ï8¬›7Š\ZW4Â¤UŽqžý©\ì57*\ÅP8\â¡8«!}4\Æ…´U`	¦ž•!4c9¦A_i*b1Þ£À\Í\0DEG‚*}½\éÁ¤ qGLTƒ­7µ<S\ng56i8Á\Å	‰•[¡¤ exÁ\ÍLA\\\æ£9$qVˆd$»Ê™‚ñ\ïFsš«’BE.:Ô˜\ä\æ‚r8§q!˜\0÷£M<¯ \ã4\0ñš.2\"¤.h\0\æ¥Áü1\Í3%Os\Å		9\É©HšqP˜x\Ï^:S\Ã$w¥5Ž1NÙžý©1ƒŠLŒ\ã\ë\Å0‚:Ô¸^ri¸\É\àô,c\0ö§Êœz‚3Ö”b³f‘!4Ý£aÒ¥*9\ç\"’¡–ˆö“×Š\\\Zw\Òµ¤0ŽI\ÏJN€RŽ(\Î_¥C(n;\ÔmÀ51^™5^còŸQ\×\éÒ²e”\Ú\çNß½Wl\Ü\í#\ß5 \n\í$€@‘&§b³l\0p:R³cm\"Ð½P22MDusŒ\à\ÕO\í]<±MZK:N›H\Ç^Ÿ\äT¸Ë°)\'Ô†MMr\Í\ÅfMrdm\åp1õ­&¼\ÑÁÀ\Ú®=*&¸\Ód\Â\î\æ¤eT\ÔdWùø*ÐŽñe\èOµ,pFV¦\Ùg€7\0äƒž½\Å‰E\Ê9vqNó\âU\à³\ËgŽ{SE•‹ü¡\Ç#\'ž´\\Veå¹‡|zfœ\'Œ“+?\ìBÉŒŠqÓ£#‰O#­+‡)¢³\Å÷·\Ñ\æ©ôô¬Á¦„\0y…²{ži\ß\Ù\íŒ,‡ó¥qÙ—Ä€’=E#L2yª-d\áNÙ°sŠcZ\\>?yEÆ“,\Ër«NkŠ½º¹YHŒ’ \ç=1š\ê~\Çs\ÞB\ÕL\è\å²NH4›4ŠFŽ¥q½ƒ†Qž\Ãó®\Â9	$õ\Î9ö¬±¥,[ˆ\È\ïŽ\Õ*Cuo ò3\ÍdN+¡¯»#4x¬n\Èo8\éS¡¸ÁfSÓ‘Þµ¹‹.`\Ó\Ï\Ê>‡YR\Ý\ÜG´\Ï#=8ª£PœÊ©³ž„tªLƒu3Ž¹4\î;c©¦Ç‚#šPp;õª¸Æ€Çµ•\äÓº0š\àv#Š˜\Ø\ÉÁ£ŒS¸R;š\\d\ãó§±#@ÒœGÊ½¹¦‘’¢‘\Î\0\'ùRÝŽ¹¤*¸Q\ÇÖ…`óM\Ï\Í\ÏÖ¦\áažŸ\'\çÚ›€[ \ã¡5)\ãÒ£\Ç\ã\Ç&K\r©‚Àcÿ\0­I€þ•\' œñQ\à’zó\ØU\ÈÊ…l€2N\0ö ñ\Ônô©1õ±Þ”Þ½:«’Bå¶œñU|€\0\'=ø«Ddd/;±ëŠˆ–ðÇ½4@\ê#Ëžœyª¬\ê\0\í\Ï~õjd\rôô­@bBI ƒL\Í\îD¥²só©\ïþ™|e\ê3\Ð\Zœªœp\0\ã?Js‚C\àz~g¥D¶.\Þ:=‹Y)\È\Ï#¯5«\Ðqž½k“°»Š\Þ\'“\Ô\ç<Š\é-\Øl÷ô>µ\äW¤Ï¬À\Í:IvGE \ã\Û\êu\àqÒªB{šº­r3\ÒDHö\æš~R§cJ¹\à\î)¬8üi\r–`t\äšÐ\ËcÀ<š\ÎC…\ÉQž\Ü\Õø\nŒa:ýj“=ã¨§|\Ä\Ô*¨=9¥\06M};<ˆA\à\â™ý:Ô„ñÓŠCÈ¤1™\æ«NTƒ\ë\ëVŽ	&©\Ì6†íš‰\Î|B¯\á@\áp§\ëš\Ï\ÈrŽjÆ°\ÂM]À$E>‡š®Wv¼zŽõ©\ìSÒšô:À¤Ny\é[²\È#CŽŸÊ¨\é‘l€~<U‹\Ò\Ëk)=£5\èP[#\Ë\Å;)3Àõ)LÚ„\î[w\Î\Ü\çÞ¢¬3\Üg‘Þ©\åƒHO=ýª`\Ûœc ¯µ¦­\Ì+7*÷e±ƒÀ\Ï=\ê@\åNFxõ5\çy\ÂÔ‹¿¯¯J³;‰	\\t÷«Q=2EU\nLš¸£·µ\ÅçŽ¼Óc‘\êi´\å\ä*\rR&\ã¡9½H\0RO\å\íQ§rAç¥</=jKHyŒ\Z‘\È$zŠ8Ûqjx+»§°âŽaœeºR®\0\ä{HÛºô#¢Šp\á¸<gšHž[ò\Î;Ð£ð9§FA\ÇZR¹#¼Ò¸Y(¦…`?qN7#&žW=\Å0WŸÂ•@\Í;i%y§ ¤\ÊB¯&¤^:\Ós†#ŸPiC\Ý\Æ0jYh›p\'Šq\é•\'\Ó4ÁŒ`g§â³¹hŒ£{\Z³þœ(\âÒ^(\Ú\Í8®qH2N(¸€‘ŠŠPO)p1\Í\ËÉ§? PŒ\084ÿ\0Q@©\Ý\Å\ä\ãµ(@\î3JG½74óRÀPZœ\Ç\ÜTCŸËŠxÿ\0­H¤‡m\Ï|P”ý¹ô .jv\Z«\Í<fœ8\â›\É\êsC;QŠR˜÷\ÏzS¸\Ô\ÜiJ’zÓˆ\Æ\r\ê9§q\ÆiÆ—R…jCH…˜ª“Ž€ûô¬y®$-û—Á\Æ\ÓÞ·Z<ŒcŠ\ÉM)\"œJ®N;f¥ÜµcBfŒ3*\Èn0{R t\ç\ëTˆd\ãSp(\\¯ñŒsMˆnEI‚1H0{Ô€R9³RÂ›U\'¸6®¥•Š±\åª‹˜\Å;‚8«‚3\×u;Ž~´e8b·&€h:žGZO›8§\çš_z\01\Í/^)v\ãšLÚ¡px¼\àÒŸZN½hñK€O½&QH\'\ÐœL\è*]§i¤`‚h3Ö“\ÅIHT\ä\Òc±\ãŠóRCH[‚\Â Q´þ4\ì\Ñ\ÆFj„3\ÞGZŸ\ê(+œ\æšDWŒŠ^8\æ¤P\rcŠ¡2½(\"Š\\pj\É#\0÷\éOÀ\È4m\ÎGl\Ð\0\Ô\0)p:Ó—z\Ò¾õqSŸz\ãh°¸ 7COÁ=\r &9\Í0\Z¸\æ——=\é¡1˜t§c”Ä…µ¥c\Ì\è­gÖ¦˜3p¼Vs:¨«\ÉwC,;ñX7¸F\\œV\í\Çú\Ã\\\î¤\à:ŽµÈŽú¦|÷»@«ñ\ä >¢°]]œ\rkÀ\ì	C\ØP\Îx7&qÚŸ…fÕµWó§\"Ô…^¾ù®«IÒ¬´ˆüˆh\'9õ© œµ\Ù_AM’G7ˆA\Å.ft\Â\ÆgŒ\ê\âKE;öñŠñ}F-Fy´ð\Ê\Û¿¾šò•\×c\äsš¥‹aŽj¡_‘X\Û\ê\Üúž1¥i:Ž­­ß”Ì²>%\äÞ½®\ÛpD\Ý\Ç/\Ø\â\\ \Z°c¬\ê\ÕöcjT=ŸQE)¥ÖX›Ø¥žG9¤š&HT05™ª’\'\ØV¼z±µL´\ÜúVô¾#½\Ã\ãƒL\njcƒ\ÇzgŒ\×b<©\"ž•jcšÜŒ\ÕFG	¬1\ëQ‘š\0f)œÔ¸\âÔ±‘\Æi¸\ë\ïR\ÓH©ešn\"¥\Åsš! €EKŽ3LÁ¬RDd\nCOl\ÒzRŠ6õ\Í<ñHsÚ¢RTß…0ƒ@È†qM<T˜¤\äPI \æHsš\nCy\Å4Šô¦šLRc\'ŠyŠÒšW4þ§\éHE&\\\âš3š“ \éM\ÅId,isO=)\0¤Æ†È£ŒŽ)@Á\Î)zq\ÆzVr6ˆ\å\ä\Õ3\Ä\Ä\ÕÑžy>Æªo8\Z\ÆGLG\á\Äl\ç­,d”\Üjf\0©¨T’:`T–)#mB\äu«\æ  fš!ši©ˆ¨Ú¨Í‘óM©\Z›@†šŒŽÙ§\Ò\Z\0a\"š@É©x\Å0Š@FF)½JÀ\ã“QI¤„\È\Ï$ñ\Å!À$Sñ\ÇZF\ÍQf3\ÅF@Tø9¤ \ÓL–W#ž„\Òczš˜)\Í4œf™$m•©x\ÜzÓ€#9\è\äPQ\åˆüiH\â§ÛŸ¥D\Ý\ÏSÖ•ñLÙ´3VŠ3ú\Ó6``uÁÉ V+…=zb”`\çó©™p¸¨\Ù;ô\â€!*;TX \ÔÌ¸Þš2íš–\ÍKŠQ\Î\ëŠNr\rC-\r\éÚŽý)[9â›’*CŠ“\ZŒRMAC1F\ÐsÞ—4Óš†R\ZI\Ç\éU\æct\äT\Ûs\É\"˜ø\Ý\ÍC-2¼$ŒqŽ=\ë\Ôµ´jœóÆ»x\Èb\Ý\È\äv\ÈÎŠu¸\È\È\Ç4GFÉšºE»_‰ey\ãƒÓ¥k\ÛxrF\ÖrA<j\è P}\Ç`\r¼\Ö«+4\è\Â\Ûõ¾‰g…ö9\ÎUÃ§\ÛcýRÖ£€\ã´\Ò¥`\æ\Í\Õ(®†OöeŸ\'\ÊZiÒ¬ƒb½kX\Òsß±\â—3³c$i6|’G4\Ï\ìk>F+`\Ôgê¹˜¹\"d\Ï*Alz_\ì›qÊ—\Ç\×5¨=A¥Ï¥\Ì9Št”ÁÌÉ£û4\ã‰¶yâ“Ž´s1r#û-öñ1ö¦:\æ2H˜‘\Æ:\Öÿ\0\ãM<\Z9…ÊŒgt \â\\œ\ÔB\×P$ü\êoj\èý\Å0ðâ‹‡)\Ï}–ý;I1œ}j´\Æö«»\×\×Sµ[>õÁ\È\Ç^\Ô\Ó\ÎZkÖ„)h\Éõ¬¯\í\Ùwq>•\Û\Ík˜g¥Q“H³\nq\ZŽõª’0œ\ÍC¬4\Ó*“‘Á<W˜ª²¾	ô5Bt[kÒ«\ÐVŒ\ØN:ÖŒÄµo—¯=\ê\Îs“QBK‚G\ÝÏ§z”·\'\ëM\0w\à\ÑÁ£ßŠMËžFi“\Ôr\Ó$\ÒzzPI\È\éŠNGnh„b{šSœõ\é\Ô\Ó8<N\'Ž:f“\ÝÀ\ç?#˜\ïÖž3“…\íQ\à“\É\èECx\ÈÇ½GŽsRaÕŽO¾=h\Ï\Í\×\"\Z\å\Î{ö¤b£Ÿn(ÀR2)¤\ç#\\U¢F?÷HÀõÃ‘\É\Ç\×5(Q°{þ4Œ@\'ŽØ¦K\"b\çQ}ýy§g#\åÏ·lR\ÇV<i¢\åi”`W$ñZ…FÞ£\æ\çT\ìdô­Vf+žGÒ™›\"p\0\'¹†iX)C\Ð`ðM+Àr:\äþ\ÌGb?ýzOb£¹¹¢¤3$¢E©\ÎHõ­øñ¼ÀþV†\È$’<\áˆ÷\í]yc?ýzò1_>«-·±F´-¹}X•|QT­ñŽ:\Õ\Å÷®#\ÔH”N)Ž4\ï\\T–?\Í\\´À\Ëš£Û¯Ö­\Ú\Çñ«D3\èpM.x4‡#ñ¦\È\Zú“Áz\ç\Âq\ÛÞŸ\ÓšI\ëJ\Ã\"lŒ\ã¦j	\ÎëŠ²s\ÍQ¹}¡aÖ³žÆ<¢ùÙµ‹”\'‘ƒ\Û>•a#\Ý\"n<Ž\rE\"ï¸™±‚e9~™×Ž3É¯yü\Ïcjgi`ª#^ ª\ÕL±i—M\Ó¶¡­[M‹_J\æ|^\æ-\"~\à\áO5\ë\á#z´×š<<\Æ|¸z¯´\ã\0òW«dö\ÅN¨ûŠd\\†o~O­]T \ïšûðŸ›\ËY\rTU\àƒÀ¥Q\éO\ÇQŠPxíŠ°°©\íÀ\ëV×“M\ä\n” l\ÐZA\Æ}\ÅH1\Ï<ô¦ùT\á2	\ÍPq\ÏJw8¤:gÒž9ö\äsRR\0§‚;ñŸJSŽ8sQ\áRž<¸þ´˜\Å=1É§r3K\È<qšL\î8¤‡`\0÷\éŠg\nr}iüóšPª@\'#HV\Z:ñ‘Rz‘£\Ú\Ç¨¦R(\è~l\æ¤A\× û\Z`\ÆAúÕ€M¡‚)\ão\áÚŒn#­;?…@\Å\ÏŸ€9¤\ÇCJ¼ŸzV.\èõ\â”u\'ð\Å(\Ï\\P°\èiX\êx\è\Æ\r.>´¸\Î(	\â”E.;Rž\Ô\0 €Fz\ÒòÚ—\Ñ\É#Ò€Ÿ›>ü\ÑÞœ\0\Ç4d\Ò`.\Þý\é3\×$SÀ\'9¥\n1š‘¡>\ï5\"œ\Ó^&\àö©A\Æ*KH•Tð)N)£v:‘N\à\äÔ²\ì7€hÀ¥€´®\0¹!QøS\0©\Ô\ç\ÃHô \Ï4\à1\í@\Ð`Q\Æi\å88\Å(Sœ\Ò6’)BŒ{ŠpR \ÐvóÒ”/ÿ\0®¤\ÚI\"”¼Ò€F§\ã‘OÇ·j`Gµ²§R(\àý)ûG¡¤2 8·ñ\æž6ö=ñR\0­0#Q\éGonõ1L\Zr­Q,ˆ!¥\Í?i\í@¦TcŽ)1š˜\æŒ\ZC±Z1Á§\ÉÈ§c ¤\ÙV#À¸Ï½?”\ÈHE<\Ò\Z¢Hú\Ðx§œQŽ1@XŽ`Šú\n`qABŒ\Óz\Ô\Ø\Ò(#sHFzÔ„b‚($j¯z8\Ï4R\ç5H–34u§`z\Ôx\ç5HÍ†0h9ŠZoS\ïW`¸\Îýsšo\"¥\éM8É¦H\Õçž• \ÜS\È\"€LRƒ\Å-\0i\r\n3‘N\íM¥\Íx¤\äÒš\0 MˆyqN\î\ÔZúXu\ã½d(=\ëgI\ÎZÎ¦\Ì\ë\ÃüHØœ!\â³g³I™I\ê+N^e5J\â=GÌ“§FX\Zq²U9óZdSq‘\Í+²•8\Ñ\é\á\'.r:b¥[5ó–Lr*ÿ\0’O!©Z2\ÉÁÁ©mšÆ”\ëO>‚ \Ãayu£žO™Ð¢Oò\Òc˜šx\ÐP]f”\n]§#Ž<ñ\Í´DE&*B) sM\ÈX@\Þ2\rcj\\\Î\ÜVô y™®vý÷\\\É\ìØ­\énq\âtœFFj3ƒ\ÅMž*&\Åv#Ê‘¨\È6\ÑQ‘\Ü\n¢?‹©N\"Ÿ\ÎiH 0i\ÄO£¥\"QƒR\ã)‘¥q\ÍHG#Òæ ´ˆHÈ¦\ÐTÆšz\Ð\Çb˜ãš’“ÔŒn\ÜóÚ™·AR€qKü56c+ƒHA \\i„\æ¨LˆŠ1øÔ„sH@\ÅØ„/\ÍAš¯=\é1z\nHn;‘QŸn•6:\ç4€\nLv 4\Z“o4\æÔ…ˆqI´\Óðh¤\Ø\íbZLT\ì=j,f¤H\'Ša\Õ1\Ã\ÐsI”†\äô¥QKŽ™¤,¸Ž\\Òž¤šf3Ò¤õ¬\Ú7‹\ZyšcmS€<õ¤=3Y´]\È\Â\ç­DÃ¾\0«€\r@N\î\Ý)\"HJŒ\í©Ž´\ÓÀ>\ÕD·µ6¤À4\Ã@ûR`\ZIŒ\Z\0a™Rp)¹ W}\é1Öœx\Í0\Ð&0‚ŸŽEg½!@\Æ3i\É\ÅHqši\Ç\æ˜*GÒ‚)ü\Óq’rh$Œ`ƒ“IÀ\"Ÿ\ÜóK@…”Ó†\Éÿ\0õR\àu¤\\ó\éAHcp|Tlzñ\ÎLr1ßšaû\Í@27\\®WŒ\ZaŒŠ{ü\Ù==\ÅF\Ä`t<U\"Hð	¦1<SØ‚O¯©¦6\é0#9<Qœ~\"•pNI£š†Xœ\niÁ8§0\Æ)ª¹\ÍC)4·Js~4€J–X\Â\0\Í\ZN€žø¬\ÙHB¯z…òºS\Ç8\Í5ñ´‚2:\Ô2\Ð\Ëq‘\È\ê:V#›w\Õª†#Õ½\àžJÈ±‰M\Û\ÌÀ—\Î+>\æ‡M\0ƒ8ö¨¯.¡´¤vÂ\\v»®^\Ù]ˆ\ã@Wo\0ðMS‡T¸\Ô,$’\ê3´b³ä¹¼edu¶7\âýw ÂŸºMi\î\ÏÀ&¼b\Ó\Ìñ\ÃÀ\È\ÓZ_}š\Ñ%)’\í€;sP\é6Zš\îzN\ì-&W8¹Qª\Ü%—Ú¤\È[h\Ö>/’i_1\Ú2=\êU)1ó#Ñ™\ãUbN03\\®·%\åóÄ˜Ø§¹«\ß‰¢t\Ù R>b;T\Z&³kRI\ZÉ´6K0Á9«T\ÚBr=Q\È2isŠ\â\Äñ>WùúqZ·z\Ì6™ˆ\'‘Q\È\ÇÌŽš¨.\âwØ§8\ë\\Õ®½§‚)ñÉ©t×´‰$ž`\êÏž3G#c§£<\×6<Eb÷3v\ÇsZj6Ö¨\Zi\0úš\\¬Mš¬\ã”uH<ó##ƒY\í®[ºº\Ã*4œ\ã\'jÁ\ÒcYï¤šwG“€§§½R€®w¨Å†O¥8õQ\î\á…HÀdw\â’\èg8V\Î})rŽ\è¸{qALq\Ó¦ù\ÈI\\óU\Úò\ãx\ÎzU$É‘\É_Ç»R\\†*On\Ø\ëW\æ…\È\ÅIy1óU\Ñ.@Ï¥6vópÛ¹=\ëTrIc \'\"¥a\ÅA\àŽ*\É\Æ©F>Q\Ï\çO\'¶iÄŽÃ­7<\nw@@ZfN9Gz\\ñŠ1Ž3EÀf\0~zÒœŽ\ÔüTm’\rKcHL\åI\ÏCQ\ãy9\è{t\Í;p#ŠpjFF1“\ÈAÔ¤¸=±Ö‘Àl\çšh† R\Ý)¬cÁðy8\àšF\'¿ò«DXg—À\äæ™¸‚=h\Î\n\çò“´Ž99¦C#\à·qQ8<@8\ïR¨ŸýzŠAóc“M\Êò—\ãÇ·ÖªXÇŠµ::‚qŸCU\ÙW‘¦d\Æ.\Ó\Ðp:û\Ð\êq“À\Ç õ¨Àùö\ãðvõ98\ç\ëŠLksSE½­\Î\àk¨Só\Z\ã´\ÂR\ê!\ïŽz\æ»\0a‘^^){\Ç\Ó\åR½6¼\Í;w\ÚÀ{Ö¨\çŒ\Ö,xe8ú{V¤dqúó^{G²Y\0Žy¦c9Á4¡¯\âjJ\è	ü\ÏJ³ªºc\'žõ:s\Æj„}rOsHA\Î)\Ù\ç>´1Á¯«g‚4qM\èÝ©\ä`\Ó9\äR\09\äƒYw­¶)I\ì5«\\öµ¹l\æ\Ú\Ø;\raU\Ú-ùR^ò<\â/˜\ä©ÁjÓ²\röÁÔŒô5V\×|j¥×±\Ç\ã[:[,’–#¯\"\nó=I»@\ë\àˆy`÷®\Ç²Š.?x\çÛ€+¾L@¯4ñ\ã{hú\Z÷røÞ¼œ\Î&ã„©\æ’<õc\Ï;ºæ­©\è\0¦€0½¸\ê8¥\äœ’}J\Øø&µdŒ‚\rH\Ð÷¦¯JPË»§nMXð\nþjA“Ò€C\ÆqÞœ94\Z\"B{ýE?,\ËøSFÇ½=8ô\íH¤=K÷1R¨\×$òzÔýz\Ò\ì1Iµ\0zPF>QJ1\Î*YCr\Ç9ü\êLp)¼žqÚžÄ‚<Œ\Ò˜?BjFBF=OÑ¸ò\r\nd\01õ\í@\n2	\Í(Š\â2\0\Å(8$tÀ\íÚ€€{R¯=\Æ)«\ÆF)\à h~\Þ\Ü\n”dqQ„\'œÒœ³b ¡\ç|\Ð@\ãšEcÞÀ÷\0»xÇ­(F\Å(\Æ)\ã\é@!1ŠN• ^h\à\Z’„ü) f¤\Úh¡O<R\ì&¥\ëM\Ï<\Ð\ëŠ~)¤zÓ¤Æƒ4½i$š’‰3\Û4\0O°¥\ÓÁ\ÇnAbŒô¥\ÛI@\ÎMK)ô¨\Ë’MB\n\ç®/\Ê;!<XN¢‰\ÑN“žˆè£™Y\"­\×#kp“ý\ÓÊŽµ\Ô\Ã&\å\\õ¥\nœ\Û¥M\É\Ê;\0SC`zŠy9ŽÕµ\Îv\0p3š~\ÑHb†q\ç3Cð• Š±\'\×l­X¬Ž‰Iˆô\×}žzd{\Ò.*\ç@#¯Ò€jXeI:À÷©G\'R¸\ìUò‹\Z<¾F;U\Øæ›¹OÂª\â±M…¸\ëHÍ±I\Ïj—<óÚ¢•7©¢“\Z\Ü\ç§\Ö\à‚`…—®t0²Ê\Ô\äkËµ\í\å/\Å\Ân‘X\ãüµ\Ùxp\ÜR²†\ã\î“XÓœù\Úh\ê«Jš¥FWgKJ=iƒNº“8˜£94˜õ¥üi{r)…„\äÐ¼ži¥À\çºˆ–š—\"\Ô* šB1\ÆsIœ\ÐÔ®>QÂ“\Ø\ÓTú\Óò\è¸XŒ­7¥HX‚j\"Àž)\Ü9E9 qH	\ãÈ¢\á\Ê5…A¸4\ìqN\á\Ê3JLƒJzqQ\ä\n.ðiO\0b¡‘ÂœgšP\ÇƒŠ.KD˜$Ò°À\éJ	\âœ\Ü\â­3;“Ž)™\íOe<*a\êjÑ›°¼\ã­ ¤l\çŠ\\\n¤N‚\ZJLâ–˜h4µN­?\'4\î+!iG½7¥À¤=rx§w¦Š}&\ÊŒ\Ð\ìqš\0§p²\ZH¢ƒœ\Ð8¢\å$I´q[ZB†rqÒ²	\â´4\ëÁk0,2\re;Ùt9T•\Í\Ùb“y\â£·|\Ó\ß\\µQ4Ó­\Ûùb}+—–}Ošó	\åŸJo”Â¤\Z\å‰<£ô©Ž­¦Ž\äf£–}‹S£ü\ÅAJ#>˜4ö\Öô\Å`¼ýqHºÞ’s\É\àó\Å“}\ÕJ+\í¢&sBÁÚ´\á½Ò§\\‰=ù¥–ûH€bI‘=2qP\âû©\çFX‡ŒÔ¢6«}¤\Æ2Ó¦½ªhýñŸÆ—,»1:”¯ñ¯¼§±\Å!SZ\â\ãNa‘*uõ£u‘?\ëPœú\Ñg\ØwƒûH\Ç*i6š\×qk\Ï\Ì*±HyÃŒ}hK¹^	®^øb\ê_­ukXÁ>jñ\ï^yu¨,—2¶\Î+JsQz³—4¹u,Œ\0i«ŒÐ§x\Èi\È\ÅvFJÇ•(4\Ä\Ó*`84\Â\æª\ärðh\n{Ô»­ZŽa¨\à\ïHG5i$f¢¦\å¨iÕ‚3\Î)›EM\ÊP!\Å0ƒžõgnM?J›– U\Å7«.1M(M+®@¦\àÕ‚¸¦J\á\ÊE\ÐSs“S\í¦æ‹‡)r*2LV£\Ç&‹‹”Œ­7óGjw(\ÎqFÑŠyRm¥p±	bži6š.\Z(<‘\Å?Ú`{Ô¶U†L+SM4©#³  ŠaqS04\Ìb‹…™]²¾ôÚ™—9\Ô\' ƒƒš‹…„ \Òb‚:\Ò\Ð4„\ä\nPp3\Î)qÏ­)À,´2šy\èMJ?ZkŠ‚\Èñ\ïP‘ŒŠ™¹È¨FNsJÀ1”f¢`{T§#8\æ˜i\Í7Þ¥lÞ£Ç¥\04t\Í5¹9§\Ñ@œ\Za\Æ)\Ä\ÒPKC=©\ÎiÔ‡Þ\r\Æ3ŒRc¥?µ\0T°ŠŒ\ÔüSXQp#\ë\Åy<Ô˜\ÏCA\éÒ˜bšR\Ñ\È\È´{R\à€E8Þ“§iŒö¦c¹i\ïøTD©\Í\È\Øn\èqš…À\\TÄœœ\Ó\ÈÒ¨‚&g ¦8À§\àÝºRz~y\ÍK(‰8Zz\ç\ÐÓ¸ô¦°$T²\Ñ>jwiv·µ!¡”†£ž))NOµ¯J†R\ZMFIÝŒ\æžz\Ós\Óð¨)g9¨\Ùp?\n\î==iX|¸ö\ëP\ÍP\Ø:ðzö¬\Ë›™\Þbµ­ÀZ¡l¨.\ç\Ç\\\ÖL\Õ#žñl\å%„šÂ‚\â94¶x\Û®¿\ÄBQ\âc\Ë\'Jó\ÈQ<¤†Fe\Ü\ç9ª†Å´If\í>ŸqŒ\àœW;vcn‰]\Ú\Ø\ÉqP1Œóžk\ne-póº¯Z\è-OL.NŽ\äãˆ¿<q\\\nÌ$,v>VÇ­w\Ð:6’\Ä<ž@â¸‡ž4°&9\ã\'žæ²SG°ªbkiþ·=95{M_%\Ë\"€©aÞ³7„Žuažy­{I\í\ì­\ä\ït<\ÃL‚\åŒK˜÷/\Ý$dÖ‡ˆ#F‚6~\Ýr+3N¸‰#@\Ê&¶u¯.KH\Õú‚=k7¹H\å4¹cÿ\0Hò@\ÛÒ ´¸xmnTg#ß±\íQ[™m\àÀ\ÞF\Ò;TQ\ÚM\\,¯¹ºñ\éT‰w:+Kƒ÷3…\Ëz\ç¯\ëðC,q\íÏ§$c‘I¤\ÞÁ¬E\Ü|\ÙÀ÷4ÿ\0 ¹¶$¦X\0G¥GQô8Ÿôh\æŸ\È1ò\ç¾5§¦[5•\Â\í\'/\É\ç9Ï¥dµ¬6û\Õ<\ç\'Œû\Öü$,\Ð`@ŽN*\ìJ4õ\È\Ôq\åry \Ö^š¦Áš0å¶Ÿ\Ä\Öþ¤2}q\\ôó$3¹\Æ{\ß5(¦È’\â\ê\äN…\Èe-ŒÒ©\ÛÚ¿Ú¢\æM\ìÁ‰\'¦)\Úc\ÜI¨HJ#õ÷­k8j’;þó\0z\Zn\ÈGFñ7“œ\äú\Ó>Lg9\ÇJÒ˜\éÞ¨L”\ØŠ\Ì\ÊHz*•ü*qÖ „‚9\ä\Î}j\Î95W3hi\0w\ëJ9`:R/ÒúLV\ZzqÖ›Óš\\–\æ˜À«g4Â\Ø4\ÓÓ‚i\Ýr?L\â¡c‚Ke$*.ö\Õ8\ã}y&¢Q…úŠx\Î\Þø¡	€\'AG(q¸c¸9ü\ê0N}±œU£6+rƒÉ¦‡\Ü\0§\à•¦…\ä\ã§Ò¨‘¥1\Ó\Üð)‡žŠqo \ëÁ=*0\Ú=¸ †5‰\'”\Æ,3R¯ŠŒò ŽI¦ˆeI²\êsQ1n\Ô\éV\ÙW;{w\ÍVsÁ `}})˜²<\ç;sŸji$¡\àQ\ÓqMC\Ã\ã$u§a›\'¿\\\ZLc¬\Î\Ù\áop:\ç5\Û1”Žx®\rd\é´tl\ë\ÇOÎ»‘Œ#{~µ\ç\â‘ôL´hÒ¶8#¿j\Ö]ª¼\nÇ·?2¨\'9­h\ÑIú\Zó™ô”óœŒc•%\'\éOa\Ï\á\Î*0ž\Ý\0«r\àt\ÍVþ,v«ŸÞ€>„\Æi\ã8\à\Ò(\rœR÷\"¾¬ùò69\à\Ð0À\è(8ZAŒRc@[#¥rþ$%„Œ£\r\ÐWPp8\ìkŠñT\Û-bUUmò`\×.!\Úê ¯8œšÉ½Kn<kF`\àŸÊ°\Õ3¸(\àš\ê4¸Spµy\ÔU\æw\Õ\Ò\'J£\0t\é^W\ãYõ(À\É\Ù\Íz±\\/ô\âþ\'¾«(\Ê\àq\ê+\ß\ËU\ëz&|¶w+a­\ÞI ƒ‚pNi\àó\nN¤w\\úÔ§nG\0zŠúE±ñŒa7\0SÀ\Üi\à\Ð¯<Š±^£\"ðrG…\"\ç&ž£=	4(\0’jQ\Æ8¦ªœ“Ž\0 \Í,zä‘ŽœSŠžÀsŒ\Ôc°c$ó\ïÒ h9\é\Æó§ðsÁüFF\á†úS\Éb{óR\Î\Üñ\ïA\0aJF\ÑHr1Þ‚…ùq‘)\äž\Ï#‘MQœ\ç©ú´ùG4);±È©6\ã\ë\Í;\0\'j—\ä\èsš‹©\ÆiFsœz\äP	9\î*@\Ô\Ô\'•N¦\rK)	\Ç\ép¤\àñNÀÁ `6O\áHb¢…\\šw­\ÏŠp\é@Ð¹\àô\Ð3KŒž:SÈ©Ð£58iˆTþ5 \çŠHf1ŒPsO\ëGµ<qOGJ\\u¥\æ“Œ§#½IÖŽsŠ”b\Ò#\'ð)p;R\à~T™C:H]T\ä‘On¼\Ö&®\\@vŒ\ÖSvL¸­R4\Í\Ä\Ü=\ë\æ\Íóœ†5›\n¶2Ä‚}ke0¹\Æq\ë\\s÷\Î\ÚO\Ù2-#•­ûIŒ¡\0c¥W‰Q†H^O­J<®TŠ)Ç”uj)£@?\Ô\á8›ºû½>´\Ã=¹b	Á\é])œr±¬&R>•BþñŸJ…g·\è\rU½Ž\Ö\ê&$q\ÏJm™\îx¿‰õ¸/®v/ð°-ƒŠ4Åµ¸EY$Šn¥\á;\Ãw!Hœý}«ªð¶‹-½\ÔbxŽ\Ã\×5”¯s³\rÊ“¹\ê>ýÞ\Z\È\éš\è<ð\0ô¬¸\à¶Q•8&ÈÁªDN\×/™ÐŒdTbevª\Þ\\7\ëM)q¿ª¹.¬ ¯c“\ÅI½qÈª¨uß‘Þ¬úž~´¹†\Ü!\àŠz”AÀ9§y0dó\É÷§ \ç“\Ç\'šwA`\áK¼ƒH`µ#—>\Ç4Á¸l+ž=\ê¹\Ä\àL—u<APÝ9\"„œgÒ“˜\Ô	sXhC\"±\ãº_&\"¸\ßP¥µ°`¬\Ø\ÍCf±Š*[i\Ï\Ë\ÇÖ­WV\Ö`1§-¬YÁcBr&P\ÇJw9\éZŸfµ?\Ä}\é\Â\Ú\Ü§ù¬\ÌÄ‘CqU‚•ùrk£6¶\Üòhû%«\ãœŠT\Ì,ó\ÎjAWnm­•~Wlö\ËhÑŽ\ãŠ\\\ì~Ì‡n)6ö#ð­³[÷¸ÿ\0²\Û\ç;W8½™†WŠ†D\Z\èþ\ÇnNwj²„67š\ÊTNi¢$\àŒf“\É\Ê@9ºgiŽIú\æ”iö¹\É&§\Ú\ì€Ò„=‡ºq§[ô\ÞzRe[ž|\ÃVª¢œ¹\ëÓ­D\Ëßžkª:E³\ËC\Å/öE¿¼5j²3x93’+Ž‚›¶»¤[dü\ä\Ð\ÚU¿MõJ¼Eõœn\Úh\\Weý‘jù\é\ÃIµ#!þ´ýº\'\êS8\àÖ•P‘ÓŠ\ì‘l§†84\á£@‹Š~\Þ\"ú”\Î@\'µ_lWaý‰	\é%)\ÐQ€\Ãò;\Ñ\í\âRÁT8\í½8\éO\Úq]gü#Ëœ	»R§‡\Æ\ï/m\Ö\n¯c“\\‘@ð+«ÿ\0„oD\â”xwþš\n~\Úõ*ÝŽS1HA\âºÃ }ñGö\0\Æ|Õ£\ÛD>¥S±Ê€i\ç¥uB\í¼qNþÀ\'Tº\Ñ4Ž¢\èr\Ä\ÓrÙ®¬øvL}ði‡\Ãrö‘j]hõZÝŽWšNF+¨ÿ\0„n~1\"ô¨%ðõÒ©!\Ô\âkL>«_ùLÛŠB½ñÖº\Ðn;²óV‡n\á—4\Õhw„«\Ø\åÁ\Ø8â¼³\ÆW‹&³e<‰\Z±R{ú×ºÉ \\ªz×…ø\Ú\Í\íõÝ¬¸\"ŸCš‰\Ô\\®ÃŽ|\ÑRZ:\í\Ùû,\ÊR\Z7ÃŒ’\nWo\á8^}\Z	gr_œc½y{D\êWž=+\è=\Ã\×v\Ú=¢0\0ˆ²}ó\ÍgJ«O]j\à£È¹c©¢Šz\ãvEl\rónBƒø\Ð4[\î¡m\í\"\Ì#B´_\ÂÌ¦v\ÏSŠ…ÛŽ§ƒ\ë[GF¾=cýj¤\Ú5\æ\Â{sY\Êq±¬iU¾\Ì\ã&\rqrJ»\å{Vb—.\Ã\Ð\×K.‹}\à!\Ëg8ª	§\Ê1…;\Ô\á«Ï©yM¶û:n\é2ý e·Pþ•qy\nµk¦\ÞO\Z·”@\Ç9Ò¯†Æ¯FD¢‘\äU¡9NM\"\Ï#¤qŽ•¡ýzú¦¦}Šðr`j\×\ÚG¹’¡>\ÅN:Sˆ\ãi,¯;\Â\Ô\ãir½bÊ¥\Í\ìeØ§¶›·Ö­›Yû\Æi<‰†~Fü©9¡ªR\ìPe\Æ8\"¤ŽZhd#\î·\åLò\æQ“ ¥\ÎR¤\ÈñIƒ\É\ÅX\Ù&~\ãg\éF\Ç\ç\å`*‹T\ÙWkzPT\ãU²6ŸjiS\èis\ì\Ù[e4ÇŠ³Œv4\ÓG0{2”\ÆCƒS\æ“¥\Ì.B¡SŠ`¥\\ Šgµ>r]2›Fqšn\ÃS³ši#ð§\ÌO![§JOZ™€\Ç¡\È\Í\Â\äczö¥ š~¥t¬f\Üp*2¦§\È\Æ1G¥\Ì>VCŒMj—Q¤ði\\9YSQž\rX\"¢`3I±ò²x\éœ\ÔL“ù\n±ša\é\ëSt\Øz\Ò`S\Çõ£Ž\Ô\\\Í%/Z3š›Ž\ÂS_ƒšRqšŒ¶I4™HNqQœúÔ›†*6aÛ ¤;1­\Çj…‰4òy\ÔÂ§<P+\rô¦\ãß‘Rœb£<œf•\Â\ÃNi¤ŠR9\"›J\á`4\Ê}&¥q4GÞŠw’‹Š\Â\ZE¥ ŠN1@X1\ëÓ½ £­\0\ZN1HHh ^h4qA4\î+j1ŒûPI5\íˆ\\\îÁ\nqMb\Ük¶pJñ™`÷8\Å-¶§\r\Û#Ú¼«Wd3HNI9 g½u>bm\È+‚I\Íi\Ð\Î\î\ç}\Ô{P\Ý¾)qŒqÖŸ¹p}{šE\Ë)#µÀþ5&\Å\Ó\É\Ëv\àT”„Áù\ÓN:œÔª¾ø¦3I”†¤Œã·½D\Ê@ªLð08ô |\ÙÁ8¬\ÙHŒg¯O¥4ŒûSŠæŽ®z\Ô2\Ð\Â=©§¨©\09É¦\ã\'ŠÍ–†\çMr0i\à\0iœñšÍšDe³q\Æj°\"úS\Ç®kF\Ü \n¥n3¨K^•“f\É$\Ò\ígœ\\:fL`\éU¦ð\î3+<$•\è3[\È\0sK\Î3\Ó=\ëQ¦vB	£ˆ¾ð¾/&FOcÞ³§\Ñty“0„Šôy_Q\í\ÅW0Ç‚v©\ÎzŽô{gÝ\ÒG$\"³K6¶G!p\0¬k}J³K¹œö$ú× xqþ©1ÛŠ\ìí›ƒÐ«1{3\ÏeðþŸ)r& “ž\r:\ÇA²µ˜\Êf20\×x4ûL\0!\\n\ÏNô>\Ð\äyKŽ´ý°½‘\ÂG @·bf“r\'*™\Ç>õ¡ªZBŽ9v\×Pt\ëB¸ò\ê6\Ól\Ø1‘\Å\×Q:ló¤ðÏ•È¹‹Äž:T‡@–I·´ ¡#žµÝ&ÌºG^F4«Dr\Çv{\à\Óö¤û6q–º\Ç\Û#.\Ê!Œ\ç\ç5««\Ù\Ü\ÜÁ\Z[òœòGõ®€\é‘m\ê\ç9\Í5´¨\Âü²Iœu&š¨Íœx~ý¤s)M‡=:ýEZ\Ót›¿¶4·yk÷š\ì?³6¨|„÷4«§63¹ö\éM\Ô…­Er\Ð ¶Œ3üw®atmTG$ó 2;	\ÜÙ¯Cû‹ÇžÀMûÛ²noÒ’¨Œ\à\ä³\Ôc¹S\Ç‘\Ð\n¹i¤oöù,ò\\{u\ë]´6lŒK¹#µ[	Ž01MÔ¸¹JF\Â\ß\æ¨Í(žsšÖ¸ˆ\à\nÌ“>Y\Ç\'¯Ö’fRCa\Î\Ð@gñƒš«BöÁÕ¥Á\Îx\â¬Å‰Ñ±Ž\0¨òGqS—9n\ÕÞ„úU&!³\Ç~)»FF	õ©3\ëMŽF(lv!y9Á\ç4\Å\ädt4­†#wú\nSt©L¿6{\ZU=\áM8ú\â”gÒš!a\é\Ï|Tc†\äT¿(nGzŒ¿~j\Ñ\å-“ÛŒSô9#Ž™ –\Ü9\ãŸÂ¨\Æj‰b±9\ìx›’p\0¥ÊŒ“\ØSIf\\\çz{PKŽª@\ÍUyQN\ÌñŠ°@~\á¸5\0\Zh\ÎD29hð±\äpEW\0ž¸Ùœ\éV¶¹\Î×©ª\êƒ$\ç\0pÃ &™“J|Þ€ýh\É\ÚOn)X\Ì;x<õ¤\ä\í<\ã<~2‘]‰{t\Åu³^-½¤N¹*¹l\0Ç²\çœúŸð®²\Ì$¶Q¸\åqù\â¸q+C\Ù\ËSiv4ìA\nTúÕ»\È\é†\ã5‡mòñ\î+n=\ÅyLúX\ì‹j9ô¤\Ç8\Î\ëJ«\Æ3\Å;Â¢\æ–DXù\Ç\åÉ«`ôÇ¡ª¹*W§¥N\â=E4ú5X9¨·\ä\ã<t©8o­Dxjú³\çE\êzRq\ÜRÜšC\È¥>@9>µ\çž,šR`‰T}\ã‘\ì+\ÐdS+\ËüK;¶±d´r\rq\â¥h˜Uy¢(\Ê\0\î+±Ò‚3\\š\"‡<Wi¦€sÁ®*;µöF¡%P•Áô¯Ö¦F\Õ\'nû\Í{”\î©“Ú¼r\êWbk\é2µ\ïMù$|n}?r\î\Ø\áŽ öžzz\Ô*1€\0\ÆzT\Ùb;c\Å{¨ùp\ÆLÓ°8>ƒš<g5hC±òô\âŸ\\}?7w\Ì\0b†=\ÏL\ZW6\ìœz\æœy\íM€\ß8\ç5hm\Ô\Ð4	€¼½iË€À÷8¥Á#žý\è\ØsŽ\rA¢©\Üü©q•\ëÒž™>žø\ïC\"ó\Ø\ÐÁ\ëÚ‚€\ã\'¸¤ð\ç*U@)\\v#\\ƒAR`tú\æ\â÷þ@T˜Ò¸\ì.^229£r)Ý±O\ã…c\"\0*ENœ Ó“Ò1“N\n]¹$cž\Ôò¤À\0¡FqŠxPy4\ÜsÒž÷\éJ\áaJ®i1“\É\Å?m\ãúR(^€R\ã\Å5[$®j@BœRÍ™\àS\ÔmšU\Ç\"—“e\0\éJhU9§\íýi\Ãzf“¨\Í?ozpOlP;\r\nx¥Ûš”¨9¥\í\ÏzF0W\'­)ÀQŒŠ]€Ž´c`>¢¤Ò£*3n“:«®AÀ\æ¬\0vÔ\0n\"\Ï÷ª&´4Ž\åmoF±†\ÂGPU‘:ƒ_7\ÞxŸR…\ÙRLlg\×ô\ç‹dÙ¢\Ýy(k\ã{\×\Ý1\ç\'9¬¢‘†*rSI6ø¼m¬\Äp³cð«\Ç\Z³\0LÀ}q…T+Þ \Ú\ÌŽ@ôG?4\ß\Úgn|g«9 Ïœô\àÒ·Šõg\0™Ž:t®1üj\ädÒª2D\ÉK»=\n\×]\Õ\Üq1<zQ\'ˆµ¨ˆFq\Ï#+YºR\Í*žOp>•¯¨\Çö»ÍŒ¿*\ä+k+ld\å5Õ‘¿Š5\ß\'†.9\ÅGŒµ… Œv\n\Ç\Ô\ï\Ñ#ò 8Q\Ô÷5†ŒÛ²{u¬%d\Í#Rvø™\èRx\ç]µ*†duÛ\ÛiW\â³…;“wÒ¸+ö;“qÈªA›\Ô\\n¥O\æg¨\ÇñV*w©\áaj\Î\Ô\í’k\Ë7µ s\Ü\Ó\æD9\ÕþvzƒøûUf8\çŠr|@\ÕÀ\Îôü«\Ì7¶ ‘±WtúJ¥eö\å÷ž­\Ä}Q1”¹\ëÒƒñ+R\í\Znõ¯,\Þj\"\ÄŠ­;#7^¿üü—\Þz\Çü,]Ið6 5f?kR•\"?JñðýÁ­­?X{!±—r¢š·a}b¿üü—\Þz$ÿ\0u{`Ÿj>\'j¹\ËE\á\Åy•\Ü\ây\ÚE\Î	ª\Ù\Ç‹®\ÈK_þ~\Ë\ï=}¾&\ß18ˆú\ZWø“~üùL’My’¼\ädÒº\ì‹XœGüü‘\ìüN½Œón¸ÿ\0xñV\Ï\Å9·[ñ\ß\æ¯2”¡‰¡röAõ¬Jÿ\0—²=Á~)\\ƒþ§¿6hoŠWL\Ãlc\æ¼Lt\Í&óŠ¤ ú	\ã1_óöG³7\Å+þÐ®½8üO¼+ò\Ä\ã\ÅxÀcR\ÛÚ«–Ê…õ\ÜWüý‘\ëò|H\Ô\'Da2:S#ø•}\na^=X×“)\ÓT\éÿ\0*Ž\Åÿ\0\Ï\Ù\Ë\ÅK\Ô <\0ŒzÔ‡\â½\Ð<Á•\ÏL×‹\ï9ÒƒT©\ÓþT^\Åÿ\0\Ï\Ù\Ô~,\\CÏ¡n”‹Dö~s\Ç5\ã=E0iû:_\Ê?\ígüýgµ\ÂØŸ\'6\Øüj#ñn\ç§\Ùø\ã½x\×^)¬){*ÊŠþ\Ñ\Å\Ûø¬ö\Ø~0\Þ\"\ìkS­N~1\\‚1jq\ÏñW…ƒƒÖ–Ÿ±§ü¢yŽ3þ~³Û\Æ+\î\Öø\ïTkñ†ñWþ=Ž}š¼H\ä\ÒUû\Z_\ÊCÌ±Ÿóõž\é\ÆIú5³Æ•~1\Üe±j¯\nw¢…BŸò¡ic?\ç\ìx?&\0f×·­ð¹\'\å´\'ñ¯	äž´½\ê•\n_Ê…ý¥ÿ\0Ÿ\Ì÷”ø\Ë!6dcV\Ó\ã@\rÿ\0Lk\çß¥(j=…/\åCþ\ÔÆ¯ùzÏ£“\ãE·{9ZOŒ\Ú{©\r§¡¯šwÒ‡\èsSõz]‹Y\Î=\Ë\ÏÀúa¾3Ø È‚Bi\éñ§N\ëöyqô¯™\Ð\î\ïV>\åV¥\Ø?·1\ëþ^/¸úM~4\é¬p`˜~ññ—I\'ýT\ÙÏ¥|\ÎdSœSA9\âš\ÃQ\ì\'ž\æ?óñ}\Ç\Ô\âþ›Ÿõr{\àRŒ:FG\î¤Áö¯›!—$=ªVc\ìhú½\å\Ï3ùø¾\ä}*¿ô<œ\Å0ôùjqñ‹C\Ê\Ë\Èô¯˜Á\ÇðÔªr0@\ÅK\Â\Ñ\ìZÏ³ÿ\0/þ¦cø\Ï\á\âp\ÂU«Kñƒ\Ãd\æ·>Šk\æ%…€j9#0\r/ªR5\\C˜-\åò>ª<0Ís¨5|Wð\ã‚\ç¯òyÙžx§G2\ï8\ïPðtü\ÍaÄ˜×¿\'\Ü}Wÿ\0GÃ \î30ô\ê\ÚüWð\Ãp.k\å‚:Ž*x\Ð>y¥õ:v\êWúÅn\Þ\ç\Ü}R~)xlÿ\0\Ë\Î+žÔ¼i\àMNPó¼m.\ÜoÁ\Î+\ç—U\ãVT\Ø7*–Ÿ™\âb\é¸öË‹¯I\"<wKq\Ø×¢Añ\Â\Â!Û¢hœWÈ¬á±”$~Q\ÎTPðt¼\Â<GŒ_f›>º´ø‡\á¸Ç–uRqóŠ¸Ÿ|7 $_Cžÿ\08¯˜\Ä\Çj¼„)ÀÚ©\Ó\î\Êÿ\0Y±kþ]\Ó>\Ñ>>ð\é\ç\íÐ\î\àR·|>Ç‹Ø\ã_)\ÜjDšH\ØÔ¾¥Iõaþ³\âÿ\0\ç\Õ3\ì?øL<:H&ö\ã“U?\á(ð¾\â\Æ\î\0z¸W\Ê-©9‰£’$bs–\Åg4¬\Ç8šÀQ\ï!ÿ\0¬Ø·ÿ\0.©Ÿb\Å\ã_€\0¾„`ô\Þ+F?\èREô\'\ßx¯‰Y\ËT«9OÃ§µQ¥ü\Ìk‰qkzP>\Ú>)\ÑNO\Û!ÿ\0¾\Å3þM¿°}W\Ä\"g© ûÓ¼\â\0\ëù\Òú”?™–¸—ÿ\0>a÷³\íñ\âM ð.\á9\éóŽi§\Ä\Ú?Oµ\Ãÿ\0}Šøp\Î\Ý{\ç­\æ@1¸\ç\ëK\êPþf?õ–»ÿ\0—0ûÏ¶\ß\Äú?{È‡\â*)<M£Ž>\×sŒnñ2\ÜÊ‡!©\rÄ¤\çqü\èX(3\â:\ïþ]@ûi|I¤±8º‹ó«­\éò,ñšø…/Ys‘žX\ÓÎ¡&N\×u÷hx(ÿ\03.<EW­ý\ç\Û\ßÚ¶8ÿ\0]\çšk\ê¶#Î8¯ˆWPºý|§\Ðo4\Ç\ÔoX‚nf\ã¦ñPðkù\Ëþ|¯¼ûh\ê¶\\þú.¾µj¶\'þZ\Åù\×Ä¿n¼\Î\ï>\\ú\î4}¾óþ~%þù©xXÿ\00ÿ\0\Ö	?ùsøŸlÿ\0iY\ãOÎöû#\Õ\ã\êp+\âu\Õ5÷n¦ÿ\0¾\Í<jú˜\éw8ÿ\0šŸ«/\æ*9ó{\ÑüO´…\å‘$\ržô¦\ê\Ôƒ5ñˆñ°³ýwS»«w½œw5?V\×\â/ûqÏŸ\Äû%\ï¬À?sŽµT\ß\Ú>85òü$: 9k¹²\ÍQ\r{P\Î\ãw.Þ¤\è%öŠþ\ÙOþ]~\'\×Fö\Ó8\Äg	\íXŒ$dû\Zùë—¤ô¹¿©\Ä:”k\Å\ìù­šNš\î5Oþ]~\'\×{\íºˆ\ÔÒ±ÿ\0\Ï4\æ¾J_\ëj­¶ö_Î‘<i­¤Mþ–û‰\ë×Š—\Ü\Õfpÿ\0Ÿlú\ÉÍ \àF•=¢\ç\äZùKþ­|.nÞ”\É|s¯\É &\ã\0{T[\Ì\Ú0þF}T\Ïjx3Š@-I\ås_)/µõ9Xü3Sÿ\0\Âu¯ƒ\Í\Î´­\æ?¯\ÃùõHK0e¦yDƒŸs_.§¼B¥H¸^=ª\ÒüE\×%}»Š-\æR\Ç\ÓþII¼V‹\ÔTF+b{\×\ÎC\âµŒ\ïBqÒŸÿ\0X\'‘½\'1ý~ŸòHú\á´\Ï~MGö{a‘“^\0>!j‹¥	\ÇR/\Ä}LõU5-yc©?³#ß½¿fjo\Ù\àþÿ\0zðñû<À¸\ì3Aø}õJ\0©ù–±t{?¸÷·B\ÝN)\r¬dd9¯u7T!\à’MJ¿.F7EÛœzR-b¨¾ç±µ§=5­\0Iøb¼‘¾%·hsQ¿\Ä\ÂqþŽ\Ùú\Ô\êW\Ö(ž¶m‡_0S\Z\Üc;\Åyøùbi£\â8\ï	#½\Z\ëOWhH8\r@c“<0â¼¼üF‡?\êXf˜\ß\ã\È&\'\Æh¯Hõ™ûÀQ\å¾8\Åyxø…l˜_šrüB¶\î¬ZL~Ö‘\éž[ŠaF&¼\ëþû2x\È\Çb8\ïøOl\Þ$s\éQqûJg|\Â\\`:\0“o#¥p‹\ã9€›ßŒ\Zsx\ãM\0~ð\äû)6\Òoóõ\Å!c\é\Íq2x\ÛL 0“U?\á5±\ä,‹“\ïBa\Ï¼i„çš„Ý3°š\à¤ñe»Ž&@jñ]¸#2®\ãšw!\Î\'ö¼Ÿ»\Æ(û^rq\\$¾+µ\r·\ÌL0=\é£\ÄQ‘Ÿ5@£˜.™\Ü5\ê\äñA\ÔSƒ\ï\\Wü$Q\ì2lõ¥\Zê‘\Êi©\ìuÿ\0\Ú	\Ï\rN\Z„l@\äs\Åq2\ë¡1\ÈÉ¡|E\îþbŽqYÁ»\\qùTÏ¾7V\êG\ÎG®Áœœ`ŸZÒŠþ	!\Õ~´ù˜Y§h‹+y°kWD\Ôt\Û0bF\Ü\æ²<Qr†\çsòòsÞ±4e\Íú‚\È\Æ+Tý\Ó¬\ÏdŠý$P3·&®F\ÅÀa’\Õ\ËG¢pBŒš\ê`@ª3×µJŸ1«…‰²H>\Ã	\'Ž}jRNI\Ï^E0/_|‘N\â\È\à~4\Æ\Ç—<\Ô)\ÏQI±¡¤MÀ\\Žy\Óý»Srpq’qP\ËDx¦Š—\0sÖ£â °\Ï¦ƒŠ\' ¦\Z†X‡•\Í4€A\ÇzSž\Ô-d\Í\"%¶*¥¾WQ“¥\\„õ=«9	]E\ÇrqXI›\ÇttªF\Úx\ÈZ¬$¯5\"\ÈB1\\rš;\à˜öŠa\Æ2x\æe\\–\ã]eŽRJž=j9‘¿#°»z£·šqÂ‘QI,q.\â@¨RBörN7¯JŠŠÔ­Œfš’¦\ÆóA\É\×dA¹Ž)ÃŒŠ9œ\Z›·\Ôu\ïN\0v\äRd\çšwF _¥7\åÁÁ\êz1šƒ\ìG\ËN)8¥,ª§ñúÒ¨\Î;‰Á¥°\Ö4„`Ž¢¥À#˜ô\ç\îKO±q“A\éš ô\ïM\'ûU&g%¡\ãtgš\És˜ø\íZ“ƒ\å6\ÜAY$mƒ´\ç«Xœ\ÒDp¶\áŒ\äf¬\0qUb<\ãúÕ \Ã\îœÆµG<„P1\îM)\0 ãžµe\ë\Ó\nq\Æ;c¾M1!0þµ»n\Ý*\ÆHäš#+ž”Œ=x\Å7o\'#~\Õ8û\ÜSX\á³\ëA\"ŽOsN\Ï@&\Ö#‘Á\Ç\"ƒ\×\Ð\Ó%ˆqžÆš\à:t¥Á<c¯5,3TCü§¨\ÍFI\r‘Ç¾i\ÛP\r\ØùF¥&3Ÿ¦E;’Á\Ô\×\0®j.0@\ëÒŸ\Ï<ã¸¦ñ\ïÞ™NJ\Ô%ø\é\ßÿ\0¯R\åŽy\âšùš!\äß•ô\Æ*¼™Á\ÜO_­X r\0\Ç@\ß(q\Ô|¸\ëTf\ÈX\îS÷zž\ç®)»x\ëŽ2:Ç½	‚[,p8\Ôg\Çr)1\Äcÿ\0x`Œ•\Ñi¥Eš…=	®uPNEn\è\è|—\0dN3\\¸…îž¦_+UF\ä,prkn\'\Ù\Åsðœ8\ÇLVÅ \ÚTc\0W‘-Ï©ƒºF²{‘Þ”d\Çzbg©\î{\ÛÖ²f¤l\Ø\ç§AR®O#‚:\n€Ž:t\éVA\ã°õÐ™ôQ\'\0â¸\ÎH\Å<Tdsƒ\Ô\×\Ö<)†Joj\"ð*X\Ñ¿t×\ëNŸð_›j`ÿ\0…z\Ôå‚žk\Å\î\Û\Í\×\îTŸ“‚5\ç\âßºC½\æh\êR<QÁ´XŠ\íô`\Â\Ý7rkœx\Ò\âQ““\Æ+³°\n¨¸\Î8¬(-M\ë½,G¬\Ê-ô\ë—û¤!¯VR\ÌFH&½§\Å\Ò.9\ÆW\âñ\ÉÀk\ê2\Èû’~g\Ãg’½X.\Ñ%\Îy©Œõ\éHŒ\ZS´ó^\Â<\0aòúŒâ’{Sr8\Ç=©\È>a“õ¦Š±‘ƒô§4[\Ï9\Ý@cŒ\â¥\\¶\r°\ä\08\ã5)JE\Ù\ÐS¾ó9\â•\ÊHp\éšsF0	\ãšUF@Njc\È\0Ž*iª\í;sœR…8§Uc\Ôg½H«\Ç-Dg89 u95\'#Š]«\Ó4®>R2sÀ\ë\í@<òi\åNp§>õ QŽ¢\Â\Â6Ü€M8.{Ñ´~t\áÓ©¢\à4e©\Ø94þqÉ£’hºu©@Î£Á§‚{šW‡r§­L¤b˜¥i\ç<\n; \Ó3“€~†ŸŸz6\ãÒ¦\à3‚\Ã#r\Ü‚”&y´c“ô¤R@£“\Í<fš\0\ëS`ñŠW)!žô\î½{Ô›z})\ÅA\\¢!Ö”\r\àÔ˜§\0\ã­+Ò—Œ\nv\ÚSž”\\\É„\î÷©9£#iõ¡€€zT¶œ\ÞE\ìj#\×U›n€\ãœ\ÔKcHngøö_/CŸœnR3_!\Ê7N\Øõ¯©¾%LÉ¢8ò©¹\\3ÝƒÞ²G%Þ·\È\Õ6Iq$K&@\Æ8ª\×z4öÓ˜Õ·#”ö4õ\×$¢`tãšª59¾ñ°\Îh\Ð\ËS:\æ\Êkg*\àp%˜>n\í»±Ú–y\ä—\ä\'!sŠ±`\Â7^\09\ëõ¡n\ÐôM=áµ€Î•#â¤–\ìO§O9„#t\È<“Ö°µ­¶qB½þl\Õ+\rXAL¥‘\ÇOC\ë]9\ä\Ì9Y²y9@>a\Ç\n¿y-´Å–(Ê¨<U ‹8ü+),/ñ\æ\Ðc¯­R#\0\nÒ¾\ß\Ü\n\ÏšÅ–˜Š)\ÛqR\Å.\ÐqŠBl•\' S±\Í9—?\áF\0«FaÞŒfœ)ÀVˆ\ÆL‹ojn9«8¦”¦EÈ€õ£4\í§4\ìb•‚\ä`\Zxæ¹§…\Å¡\Ì4Tø\éLRUr‡0+ Š·sŠ(©\"[\Z\Zt\Å 5 ­DW#Á\Í;¸õ½j\ì+\Æ(\Î)\äZ\\{sM ¸)¤-œ\âš:\ÑNÂ¸ðh\ëŠLS©\Ø\\\ÃH\Å78©v’\rFr¦&\ÄÉ£“KŒRŠ¤ˆ¸\Ú1N¤{\Õ!\\n\r(©<³Šj\ÆX\ÕXM\r“KVE·\Í5\à+N\ÄóŠL\nœD{Ô¢\Ü\ã§\ãJÁ\ÌWRG Õ&x\ÅH¶\Üd÷§0qH–Ta\è)\0“®\r]h—þTˆh\Ü\í\nGSÖ\ì3N1\Ã0@FM4€E”‘´Ô¾a\\TaO$7\ì†\çg5\Ì\ÏÒ‚œTqøR°	–¤\rƒ\Å46i\Ë\Í;.\Ç)\Û\ïSy¤®A\ÅT8\æžrE1’1“9\Í9¤giˆ=úŒR±D!˜g£Á\'¡«N¤hÚ¤9H]\Ï¤Ù•Á95#|¼T`\Z\ÄcŠ@\Ù&¥*KsL1‘\Í²[ª\ê	À©\Ï55-ò«\é\Û9ª\Îpjq\ÉÁ\éQ¼,qÁ¤h\Úd\àQ’p*É‹Œ\nF€‚2’66Ñ£$TUqH˜•=E@P­ \"’¥\Å3‹”FE\ãM\íSq¡\r%%-K-EG\ÆE?­&1Y–†\àŠLT†’ \Õ\"šG8§\ÐFj¢ uL\r¼úš‰€«$v¨\ÙTŠ\ÎF±*¶E0\çžy©\Ê\çƒÚ£+Š\ÆF\Ñ \'R1N cÞ“¥fÍ‡8\Å%;\ÜsP\ËCY…0“\ë\Å+©4`cÞ\Ä\ÉÀ\çŠ3œó\Åt¤q×ŠN\å\Ôe¸4¸¤\ÛR\Û-r7\ÍaÞ†Ï§5:ñP\Û-X˜9\Í/›ƒ“Ö¡\àPr*[f‰\"\á¸Ssš„;œ\ÔzP®1\Ï-²\â‘6\ìŠ~p9¨x\Æi\Ã,M.f]3R¨ß®\r!r=)ÝŽÃŠ\ã\é\Í<\r–;\ç\ælGýj\â›+<\ï\ZŸº\Å(´„ÿ\0psQ™j9N\ìT-×š\É\È\ÕEL‡sMó3P¥@Ö¡È®TLel\Ç9õ¨ü\Æ\å4\ÇùœóQ\æ¦\ã±#;3R\Éò&\àÄ’*OJGÀ\\dK˜\æ8=zU»&½‰Xdû¾§µg…\äÁ­\Ø_Bsšš–¥4¬[¾fYœ‘\íVÅ Ž\Å\'f\æQ=1Y÷¿\ë^µQ^m&IPÃ¥]\ÄgY\Çsvû\"\É gnjõ\èkvXaggÛ—a[6±Ï¦\Û@#|¸v\ã9\Ï@jt·{hA]˜\'t²1\äæ˜¬q©ý\Ä\Ë\Z—g`x\Î:S.\æ\ÕÂ³\Ý\êk›\â.\í€ÉªW\r;ÉºRKQ\ÌU£+\Å2N\ì\ä|Àñ¥D—7A	ó\Ødö5L°U`§$Ž}¨Œ¢Â¥½r+E#7ó\ÞJ¤»\Äû\çŠõ‡V6zÔ“I\í€b¼i\ÝÜšöß„\Ä~øú\Zno”ºPN¤t\êz†§e»!TÁúVHÊ°®‡X\'jlV\âIõô\Í]\âtWIK@$g©œ\éÞœ®8¥\Ç\Ñs•¡>ƒ¾qL\'†¼‚r)§®r&\ÂÂœ\ç¥7Š\\œpzw¨\Ï<\Ô6Z\Í3u:›ƒPPúŠi\Ï\èqQž1\ÍK,N¤\Ò\ÑI\×“-F@\îk5˜I»`c£€\ÄY\Ì@ÔŸ¯L{\×4º1\è&§,\â-\Ñ6\Ó\Üýx\Å-´ÎœºŠ¸µ\'ŒñM\Ó\âg`X\Ç~+È¨\å\íY\ì\ÑQöh£u©\\\"9Ný‰&‹I\îb\å\Þ_®:U«‹&\"\ìyeƒtÀª1b;Tò\â`‘\çƒ\É*\ç£MÁhmGs41o\çnkk­DB<À#}€\ï[\Zz;Z»•# õ\à\Õ;¸vD¯°\àqWvP\æ\Õ\"{{\É#µó–\ì*ˆÕ®•€~µf\Ú\r†]H\ÅbH\Û\äÝŒ(8\Î)7+\ZÓ§I·t_º\Õ&fA\ZG\Þ\'Ò•u[™n‹\äc‚Ù¬³”\ËöaÇ½[²˜Y±ó‘€EJ”›.¥\Z*\ÉT“ù1†c´VÖª\ï$ke÷™\Ål†Ï¸m\àW9qnbhˆm€+F\Ù\É\nP¾¦\Ìl\0Ls\Ó4^j+lYI\ÝYR:\Ç \É/À\Ï\'&¨X¯\ÌûWv†\ÚEFŒ’b¾ª†\à|…¸\ëW“U¶(rO\Ê2k”‰Jõ\Îw÷=ES¸†\æ3òœ\îü‡5\Òh\éú\Ô\î-uH¯”Ý…\Çlf£mb\ï\ã5•¦Î‘–hu9\ëT\åc\Ò3œ@«ö’±\Îð´Üš7†©k\å\Þp¿™\ÅZ‚\í\'P@ 5q°Ê®¡T|u®‡M`Ñ€0@~Õµ:ŽL\â\Åa\ãN:\Zós	”\ØÛŽ¹­9@·¥c\Æ\å‘ýºb»\"xµG \Ü\'§*ô89 ÷ªð\çqÀ\Ç9>õg\Ôò=«hœ²@\Æ\ÚLü¾”»p¸\î?!M\Ï#ž•¢ ]\Äû\Ó@^†´v9É qù\Ó0\0£ i\Ù\Ï^) \Ï=º\Òb’\ädQ´\æL\Òð9 þµ \Ä\ÝÀéŽ”Ó¾ô\ã•\Î2c\ï@v\Ü0*‘„õ\ê\r>¼{\Òý#<æš¼#“Šd1>\è?™õ¦\r¤€zdÒœ•\Æ:žh^>\ï\áA,ˆ—\èAQÚ‘†^\ÜæŒp8÷\Í1²8\Æj\ÈdYP\èy\Æj\"¹\é\É\ÆA\éÖ¬m\'ø\ã¥W\'ns\Ü\äµFm’ÇŽ\äd\Ó6¶þý»R\îÂŽO\'S’G|{\à\ÒcB2dó¯½li£¯LœŒsžµ“\Üò\ÊI\ë\ÇAZZ_ú\Ì6\×«\n\Êñ;°n\ÕFü|¸<ó\é\ÅlB§x\nFc®wrk^\ÜtÀ\É<JñªnÏ«¦\ïj®1Ðž}iÀ\äp}1s\Øw§¯®+n˜@9©S\æ]Û½¨˜ûþ«Œq\Æ)¡3\é.;ö¤\Ï#‘M\ç\'Û­)<ñ_X|øÂ¸\â™\Ó$\â¤Û‘Ö‘†AÁ¨cE™)\ÉÁ5\ã¶P‹½J\æ\à“!\n}‡zõMQ\ÂBïžŠkÊ´©\ÊLJt%™Ö¼\ÜS»Hô°«FÎ®\ÕS\Ì%A®\Ö\Ô2¨\È\í\\ŒylŽy\È\Ù@¸JtVˆU™\Êx\Î]ºrülyDHÀŽ\ã×½zOŽÐ¦y.qÇµy\ä*ô\ï\Æk\êrõjÍ³\ás‰sbŸ”P¸À$fv\ÅJ:I\æ”#œðøW¢$‹>ML 6}ý;Ð‹€zžõ Á5@‹·n1Rm9ÂžqúR\Éõ\Ç\ëO 7*Äˆ žj~„sP!À<Žjn \ç¶i‘ \Éö©\Ôq‘õ¨A\Ï¬\0p\èj-!8\Çsš“\0‘Šn9œ\Öl\Ñ!™\Å.	 \Zz¡<æ¤«!p\Øõ/\Ë\Î3HW8\ä{\Ð1LMßŽsF\åÞœ¹\Æ\r*®*‘,N0£žW)\ÛqKŒ{\Ó% <bœ9K)\ã¥ \ZTi£­IJ\ã°\ÜS»uüR€8\éH¤€4î§½H \ZW)!sœÕ¬£qL\n½)øâ¥²\Ò†JQ\ÏSN\Çc·jW„\âŸóE\"cô\ìdcµ\r\É\âƒÉ§c~šbE3Ž3Þ¥*{\Ðwd\åqÇ¥Šù\äÖ†–¤\Ü\î# 8ª¤c\'­])\0‘\Ï}µœ¥¡µ5©\ç?$\é`~fþ•òÌ‘3HN:šúo\âÌ…-\"Œœl\×\Î	/—0rÁ\ÍF\èó«\ë^E?³\á9Ž”\Ùm\äƒ\ïÒµ\ï•\Ö\â3”~£ºŸJ‚\ì%\ÄI:pTbEþ´X\Î\åKHLò*Žrk¤m‡\äƒÖ°´÷\Û*\àÿ\0Ò½\nö#qkº_</ w­©\Æ\æ5$\ÑÈª³0\È\È\ãæ«¢\Ò\ÒT*X‡\Ï©\Ç\È\Ù\É<Ö¿•ö;f•\Ç,>PE]Œ[0\Z0ŒÁ¹#½KýÝ¤\ÔRJ<rjKrw³PÁ1/”-Ã€x\ÍRx\éV®O\ïqÖ«‚kZgœ”\à\Zpô\Å<R°63·4„T¼\Ò\rZFdT\à)\Ø9\äSðZ1li¤÷¥$P1VE\Æ\âŒSð(À¡!\\ýž”\Ð*AZ(‹˜n\ÓO\íNuJG½>PR+\í9§€jq`õ\ÔC˜hZ\nA€i\Ä\Õ$M\Å>ü\ÔDsO\ïF*¬cHgµ9±Ò\çE‚\ã)1š—m\0hÁi\Ü\âŠP\r;\n\ã”\ZL\Õ:9…r)¤K‘_a4¢<\ç5) =j\Ò!²,Á )È« ŒR¨È¦‘<\Ä*Ö§\ãŒ\n˜\"b¥®*…rºô\æ¥5\'“ž;Ò˜\Ê6\rr0ƒ5\"\áG¤\Ú*\ÄH\Î(\Z*{TAŸq\à\â®ùNyŸ³3dŠ–\Çb™¿J`Z¼ö\î@\Ç4\Ñm\'¡¤>R™#N´\× gƒÞ¤û:\Ðr³(©jY\ä\ÖÀ´Sž\Ý1CÙ‘€½1\ÍA\È\Ì\å\Æ#5±\î\ÆÖ´\ÌG¥3\ÉÁ4FxµZB ‚1Ò¬œ€)¤~uD‘´y4¦Ž\â¤#\"ŸZM–¢A@\'?{5/•\'¿§\Z\\…#=*¢ˆ\ì.Ó‘S-º\àqOY	\ÍF’`â¥³ETxA=\é†Tö>•fY\0Éª¯9\Ú1J\àâ†ˆ\\‚OjLœóI\æ“\Îi”\Ã~t\îO)Gƒ\Í5¡\èi\æmý©3\Ç\Ý4\\\\ ‘+þi-W†\ÍVWLeý\ê\Ã;ˆ\"¦\ã\å\ä\r\Ù1\ã\àùR\Õ^K‚ \Z.6†È™\Î;\nª\ãjapz\àÒ¹\ÏCÚŸ0¹J\ÏqUÈ«È¨¶\äû\n9‚\ÅB55rB¸ª¬:Ô¹‘\'4\nLR€*\\‹HJw5\"y \îÈ§ù°‚„Ô¹¢W&“5lM?\ÕQ\æ\Û±‘íš–\ÍTJt¤qS\â\Ì\çW\ëK%¹”mÂ¡³DŠg=ù¨\ÙX©#8x©Xy HV)ûø\ÍC4Š)úš99úS»\æ˜\Ø=2+\Z¢1ô ÓŽ4œVl\ÕÀ¦·®)\ÍQž•¡8¤À4î¸¦ž)†ž”m¡…/\ÅKe!¤\Å0žy¥\êi\rK)\ÇÖ“µ.x\Å/JE¡œ\nQƒH\Ø\'4T3D!¤\ïŠq\Æ	Á¤Q–\æ¤\Ñ$Ó·\0g¨§ô\íL g\éPhˆú\Õ\Ì7T’úŽ*³\0O¾)\\´„\ÏNžô\ÆlqÖŒœsQ1ÿ\0\n—#D†\Í0šq?7\ÔS	&¡³D„\ÝRBq¹\È\è¼TŽ´ª\Ø\'¥M\ÊH3ŒñHyšBF:b™œT\Üv\Z~´\Â?Sºö\ÍFzpjn;c\'5=±\Ùu®ñUºw5\"’\'œ~¦˜4iê¨±\Ï\Çñf ƒT»¶UX¥*\Î>µkV¥S\Ó\å….emq$’\ÝgÉ„r«Z]ˆ¤Ú…\ë‚Ï‚sŒñO¿¹i#XÃœ*®y\ïW|»iY\æt\ÄJNÈ‡$‘\Ó5‘s7˜\ç\äò\ÇM¢“`\ÛYÅ¼«)\0\í\íR<ò\Í#;3\â¯\é@U\æ‘wqL÷­a\ä\Ì L˜\Î„úÐ‡cŸòr\Ç¤.…I«¼§wbjN)Á\æ\ÂÀT8£Œc&½¯\áK\Ý‡\Èúb¼x\îÙƒ\Ôÿ\0Jö…{ü\ë£\ÛCz2©/\Þ#Öµ¶*±žž•»+\îko\\û‘}køkJ/\Ý/Ÿ9&\ìph\Ý\Çc@\ÉÚ¶\æ9‡\Î\r8žb;T|sN\ì>”›\ZA\ÅœœóH?—Ji\æ¢\å¤(lgšg4§¥4óI²¬\'n´‚ŸL\'Ò¦\å\0šFzö¥\ï\×™\Ï^µœŠCa9>õŸ&\á©\ZÐ¶\ÉsYó€º‘Á\í\\òÙ[ÁT¯·½=h\0•u}¬\ÆI`wªöZ™¸]Ç¥yug+½\Zsqº\Ø\èq\Æ)…\"\Æ6ŒgÒ²$\Õ\â¾•R/[\Êd\ê¡:\äuúTs#¶j\Ú\é3£\Û\Æ)¥PŒ‘Xözº^FÎŠF\Üö¨›XIŒˆ&Áóš¥$W³šf\Þ\r¼UQe\0\Ýò:\í\Åeb\Ö»–\à*\Êjð4bw\Û®Šä¨‹†HPc\\/ b‘¡‰\ÎJ\Ø\ë\éYR\ë04a’L.~ö)U²„…/\Ë\n.‡\Ë3f8U¯cQ\Ïgop :§µ:9C&\ì\à`PfŒ!$ñU¡Ÿ½r¹³µfc…v÷<\Ä\r·Q\É}\0\Æ_§=jSq¨,@¨÷JJ¡\éö®\á\Ú1‘Òž\Ö6\Ïò°Ž˜\ÅG=ôhUA\\\×#5*\ÏŠ>n£ƒKK•û\ËÁ¦[[32+d\ã¯?•WþÆ´.\ÒÅ©«\Æ\åAÛ¼u¥ó\ÑHLŒ\ãi\Ú&m\Ô)¶™nT€A\ÇJ’\Ú\ÊUÚ¹õ\Î{Ð—%ó–\0/©–T\àšÒ®rVs¶¡\"üŒ?,V,h‹Ç®km\Ï\Èr:Ž•‹\ë]<ºˆ‚6\èjÀ\ë×¡¨\Æ\àr00iÞµ\ÑŽC¹\ïG\\úv¤\Ï$cŽâŽ™\Åhf;?Ê™’N\ášp\ÇCÖ“	ŠÁ\æ‚I\ÏZk4„ó\Û\ëRÀ]¸\Éõ\âŒœñK¼ŸNi‡rò\n@\Çn+\Å7p`=|âœcŠNwš¤C!Á=Gô©6ŽO¡¥?6õ~_\ç\ïMÀ\çŸPi\0¤½²zˆ\ÆOlÕˆ8Á\Ï\ÍÀ÷\î#§jh\Î}h BA#žqÒªJ®\Ç9\ÆN8«§\'§_¥U•\ÎñÀÏ½Q¬\Í\ÆH\É#|Srq€)ó&\å\È\É\Ü=i+€:¯\\{\ÐÄ…s‚x\è*ÖŸ.Û	0$\í\ëU]“;q\ØS\ì\ÎÛ”ôáµaWc³\íQzRv5³j\ä/¡¬r¸aÈ­[lÓšñ\ê\î}]ò#UHÿ\0ëš”9\ZŒŠW\0+t!ƒŽ\ÝjHp\Ù©\Þ}¸§Çµwf’)ŸE\ç‘N\ï“ÒŒ\n6\àWÖŸ<\Þ\Ý\é\Í9³\Çj2\Ø_|TH¤rž }–‘‘òœµÀiJ\nd¸qš\í|Q*­“\Ø\É\äz\×%h !<öZò±.õO­«\ÓT*v\Ï\×\ÇÐ\Ó\Ë\éhB #\'<\×T6¨­\è­\Ï]\îy‡Ž%\ß=²c¹®=K\Ôfº?0—T\È\Ï+›L\ç5õx8Ú„=‚\ÌeÍŠ©þ+}Ä¹\r\Î\ädS\Ô\áx8¦(\ç\×t\ÈQ]ˆ\á%\\{T›\0\èsQ\Æwd2«[wC(„œõa\Çõ\éRŽG?wÚœzq€h$qÁ\è)\0\à0I\äS\Ç$qß­&>cJ„<g¾EMÆ‰‚\ÇQS·Žç¸¨7aAÔ‘\çn•,\Ò%Œ\03N\\¶?0°õ š†j‡\è(Áô\ÆM\ÓÖ”’¾üR3øœS\Ã\ÎsL<óK,P&\Ç/·§û\nfO\0N\Çpj‡ž´»i‚ž\ÅU5 ^G\"‘zâR;\ÙO\Û\ëH¹\ÇÒŸ“ŒƒAh\\/˜¹9 T•,`i\ß\ÐSI\' ¥´™I\Æ\â\052®;\Z¯Ö¦F\0~5›e¤¤úrE;¾}\éF(\ìq“Hv#(28\"žô§¨-“RcŸzi…ˆ‘‘\Å&\Ó\Ôu©¶‘‚h#\0zwˆŠü ú\n•zt4¸»Ab}©64D\È+GL_•\É\ìxª\Ð\ät­M4œ÷¨‘µ3\Å>-\ÌBÄ™8¾|,C\äƒ\Å{¿\Å\Ãþ•\nŽ›rk\Çl¬ô°\\÷\é\ê)­&³ýôýL×\ÏT\ÏAP<ä‚ `zWK™±‘dLHÁô¬Û¸­²\àGµ”ðGzfM™q\Ö\Ì:¤ˆF\ÐC\ã\Íe\Çd€	­$³¼¸\èj\âÌ¦	y:\È\Å[Õ¨\\ò$ù\Ôõªy,’\0ÃŠÓ·n\Õw0{•¤es¸ö\ëO‡\å\"šñ”9¥LÞ¡°ÿ\03S{šZZÉ”&1OB8¥=1M¤Kd \çL©>µ¢2\ÞzšCRg4\Â+S&2Š\\RãŠ£6\'J(\ïNi.1N“§ŽjÐ®(T½…0\n~*¬+†(§ô£…r28\Í´ó’h=i…\Æb—O\Æh˜\î3Æœ¥\\sR\àP+‘`šZw…(X9ˆŠ\ZpSÖ¤\Ç€¦ˆr3ž¹8Á\ÔB\Õ* \Î*¬CdL¥y\ÅF_6‘š`ˆf‰l¯°Ò¬d63Š²<LœU\"\ZòjTlSq\ÍI·\å¦	–‘×¹#ª\îÀ<\Ö~\ÜóS‡læ¤²\ÎÀ«\Ü\Z”4Š»F¨U\ËmydqÈ¤\Ë@¹Aó¢•]·\ÃÚ”\r\è09«	\á‚jM®óS˜‘\Çzn\ÃœüØ©£`V“-!¢<sø\n\n\í#Žùüi\Ì9æ”ƒÇ½\"’(<\ÔN\Üð})\ìI8ö¨Ÿ=\rdE¹8^f\n¹\îz\ÔøRNj„ƒ‘œ\Z¢9YP\Ò\àñ‘V6©\ç˜F\ì\nw\Ñßµ8©@È§žµ-– U\ç\Ó\\\äU†Lýi|¼â¡³UB®UBö\Ò\ï3\íÚ¦1dô¦<{G\Ì*9$Å‰\ÇCH§*1Šºð\ä\n\ßgjžqû2º\ÆN3HrAõ«[±\Çz\\d9\æ—8{\"$cH#?]\ä’M&Z\\\ãöE&‡#¥Da\' «\Ç T œóŽ*y\Ç\ì†\à\äbª\á]Š\Ðš<ñš¬Q@ \ÄQ\í\Ùa©¦>Z±)\Â¦©S\ç%Ó°\Ò\Ø?F\ÎÒ‰“U[Š|\Är÷\Ï=\ê\r!\É÷¤cR\æ5\Òh&£\Ý\ÍK™jŠE1›¯\"šf‘±Œæ£˜\ÑD¾@\ÇJi?Gšiæ“‘¢ˆ\íù\Å*\Ê\ÊÄ© \Ô<÷õ£©©r4Q.‹€p%LQÖ–XJ\Êw/¨¬ýø©\"¸\Ø=»Šžb\ÔF½¹¦–\ÛN$g×¥BNqPÙ¤b)=(c“M\è{\ZnqÁ\éX¶h‘øS8°ª\å²j*Äƒ=zSEG¼šLŠ›•bb\Øj‰›´ŒÙ¦–“‘V$¡\Å!\Æ0=7>¾µ.E$IN\äðD²\0\Üô¥y<R\æ-!\Ûi‡\0\Òù¹\â£fù½4›-!ü‘\Í<\nh`\nw\\\ÔÜ´:¢z2ƒŠk\àãš–\Í\ão5].I\ëS–?‡­TvbI\â²l\Õ!:\ÔL9§–;M7Š–k9\Í4)\Í\É\Í38\ç¾j.j„\È\ê)¤cŠrœÆ›ž9¢\ã\Zzb’;R\ã\ß4\Ó\Ï¥H2M!=ˆ¤\ç<v¥\í@ô=)	Á?…)\Æ\ïQ°ú\Ó@t:Ÿ1Dø< ¬\ëK\ÃnH\Æ\äp-^¿,l­ýv/\áT,\îÝ²Ð‡ô¥UØ¬jI*\ÛJ#\0””ð¸þU“¨D`Žs\ÍHo§ûY¸#s• z/Ò©º\\I™[žw\Z\ZD\Öw\"\Ý\Ù\á_>•j\ê\â,[\ÛF:ž\ìkƒ\éJAV.·O½’ÃŽ”g|›\ÆqŠªG&”\\s\È4!t\É\ãW³|+bZ\ç£šñ$y\'q\È\éÒ½¯áƒ¬bqÞ†ôc¤¿yS\Õõ¼\ì‹ñ\ÅsÃ·\ë[zÃ¶È\ïš\Âô\ç®“÷Mq+\ßš9#Ž\Ô\ÞG4\á[\\å°¹Ç¥!Á=(1Hy4›\ZB\äcð¥\ë\Å7Š&¦\æ‰	\Æ\rqM\È\êN*n4€Ž¼\Ò¹§{\Ó3šW\Üú\Ñ\Å.\0 v©cC`Ü¬V³®À\Z˜\çøy­8rK}k>\ë#RN:XK[\è\î!‰˜€088¬\ë0ªnËœ’}ë ž\Ê;¸Š8\ë\Å>\ÓM‚\Ôa¶2y¯µ&\ê\\÷0\Õc\ZV8Kè®šF|\à`…õùH•U~b£Šô6°¶b	O»œ~5Ut›ewmŸ{ƒ\ëQ\ì\Ú=Jx¸¨¥bŽ˜\Ö\ê¡\rûF\ïZŽs\Z¤Å—¹µk§[\Ún(9<\äóN{(H<g\'8>µ¥Œ}¬y\Û<ý¤•\í\ÕaPÄ±P;WG¦\é\ÍYHÝƒº´\ÓM…]\r»Np;U\æJ\è¡D©\ÖR\Ñ•\Ìü€ ¦*½¼q³À©<œ\ãÒºk:9£Oo\åI\n\ÇAX=ª\åûE»õ5“¨:}„+>\ÐH­Q,N¤ý\î9\ç¬Ó£ùüO/˜p¦\Ì\â\â\Ù\Î³9\'¨\ÅjÞ4\æ2r;\Z²úm¡%Ú¼n\ëWn\ì^{uŽ)\n{\ãµM™»­M´q€‰œ‡\'÷aH<\Óe¹’6€{\âºyt}±ª£cv\Ü\nVÑ–d\ÃcŽ”œYª¯K±¤\ìóü\Â\Øv<QZ—6‘,\ÆA@\ÏZd:-\Ä(ÁÔ¢ú{\Ö\ÃZ±9\'+·qL\æ©8¹]3”0©ùAlŸz\Ö\Òm£†!9\'œ’\nr\é\Ó\ÎF\ÅB/\×5¡io\å\'=G§¬™Åˆ’q,0=\'­aŒ‡nsœ\Öñ\Ï# Œ\Z\ÂTùÛž•\ÙÆ¨ ¾9âŸ·p\ä¶SR\'\Z\é‰\Ç #\Í‰Ýž\r+\äþT¨GzÐ†\0\ã¸\Í($v>ÔœOAI“\Îzf|\Þô‡ŠAòŠR0y©` ý©#\Ó\ÐÒœE.\àQHLö\ê)ƒ©Ï  œ°\'ƒŠ†úUÆƒ\ÎI\ã4\ÒAt\ïšv=sIƒ\Ïö –!\èO\\ctÁ\ÆqF\0\îsM\ïøSD€\Énz\ç4œq\Ûv2ixž)¬yl\n¡2#œñœ:‰“n[#<~u3¨Á4\Çm\Ã\é\éTf\Ñ[\0±<{Z‹b\à–?ˆâš®\Ùã¨§¶F@’p)2V\â\Ê00:œ~µeã¹‹\çG\ãõ©Y9 \Üzž•\ÆG| v\Ï¬g±\ÑG\ãL\í¸\È\Åh[0x\Åeƒ¹‡ ­|qœŽ\Õ\ã\ÕÑ³\ëð\îðF\äxÀ\ÅN*ª1\ÇÊ¬\ç9¬Ð˜¸Â“Ži¨À\È\Êq\éÚ¤\Îz{\ÕeU±\0‚E$\ZŸL¹¦žy\ïœÒ»ŠN\ÝzW\Ö	rx4\Ö<bŸŒš‰\È\nzb¥\ì5¹\æ>6v1¤Jq¹\ÅR\Ó\áÅ²ž3\éžj÷ŒC½\å¯ðjEÜ€r3Šñ\ëkYž½jH\ìtôÃ¨\0fº0†±t\äÀ\'=ñÚ¶d\â?|WmpW{ž-¯¹“U˜u°=…e\ì¤Õ‹ù7\ßL}\\äšŒNA_]ErÓŠòGç¸™sV›\ï&\"ðOâ—§\ÈÓ9\ã#šô<\Ö\ÈÀ’%\ÎÜ’2j}‹‚£\È\ÔøÔ¡20:þ”\ÙHiýqSR½H\ÅF„.Ku§\í\\O5#T¤\ãŠUU\'¦\0¡zŸnô\á‘À\ï\ÍAH‘@ü\ê@F1Q©\ã\×Ö—·­&Z&\ë\ïS‚\0Ç½B„g\rRx¥Id†˜:R“\Û€ÀþÀP8\Ç‘²\Ø÷¥=x”\0\î@m<`\Ó\0f—½l• Š”\nˆôñž´˜.1O\0sL\Éö§t5#¸§dƒ¥0{S†rh\ZƒŒÔœ\àx¨‡Z“$­&Rd\Ô\àgb¥óP\ËDúA\r;•4¥Ž:c¬\ËB¯9\É\èi\à`ö¦¨ôö§\r´*Œ\ä~tü~>”\Þù§cŠ\0\È\âŒi`iý¨ PsO\æÚ€H®Ù­9O\Ù\\ûœVD„\ZÞ´Sö!\êA¨‘¤š>,M!\ÔÀÀû¼W”Z^]û\\‚Gc^•ñI\Ûûe\ä¯/‚®i \íT‘\â\ÔÖ¤ÿ\0\Ä\Í;}X,LY•I?¬ûÛˆf\'\ËM “Ö¢ûwo?wƒT·sJ\ä–\"­ˆ\0l	\0VT34yi®ý\îkH˜\Ër\ÔÒ«?\0b¤FB°\á\Æ2;U\æ˜¨\ãŠw3,J\ÆY	=M\'Dª\å\É#\ëS+A¨lh¦~)Àb›\ïN\ÅH18¥=)\Ø™BFlZ:Ñš\\U£6\Ç`šNi \âžFj™“Ú’–’­±q@ RÕ¤KbR¨\ÇSÞ˜*E­!±Ø©TSG4üUbn&\04¸Á\âŒR\â˜\\n9 ý1Š:ÒŽ¼\Ð1¹Š1šv§p¢\\o~M;©¤úŠp\ÒÂ”t£¥\Îj…p#šUâ”‚iTcœ\ni\Ù\"wúS¹¥1Œ}iŽ\ÄS&\äËœS™Hõ\æ¡BI »A-’c4\Þô\ÐÆ¤\Ç©gj(ü\Ìdœ~µ\0\0Öª\í\\‘@\ã¹\ÙdU<Rf<Vª±ÝŽ¼T\æ4\Ø={\ç­Cf\É‘À%¹\Çj/\Ì8\É\Õ}cÁ\'#‘R*(aJ\å¤VÓŠ˜¦\ßþµK·&œ šF©)\ËNHTœ\ã2(‚û2\0\Í¤3j¨\Æ#8=…435?\ëRY]°#5}\îœbžÑ’I`R*°9¤ 	Ö€¤/>¼Õ•PIö\ÇnzR¹JsN*F05&r§Š2¸&¥\È\Ò4\Ê\ï\Ç¦l\È\É#dr3\Í3;N;T¹\Z*d>”ñ\È\Å<€i P\æh©C†ç¹¥`[½(Ú£$sM,:\ÖNfª¸\ã4\à›“\'˜?§J\äsYº†ª’\ìFö\èy¦\íÁÀ©\Ã\í\éM\'ú\ÔûF?d»tÞ¢\rÀ8\ÍHü\çÚ `B\ã4s²]0-\Û=:\ÔeI\ÉR±QœU)oÜœž{R\çfY\ÜÉš\\–9\ÍL“}¤d)_*	\ÆzÐ¦\'LŽF\æ«ð*V\ÆP®s\ÍR™™ZTãŠªÀö«Nv\Ô8sG9‘]†9¦‘)Ò¬›†\r#~j\\\ÃÙ–À<uª¹\Ãc×©5#±G\ç‘Pœ9\ÍKš)@\í\íJx\é\ë\Å9WM dý)s\"”û\ÓI¡¸\Å34¹‹Pò)¥³HMFM\'\"ùGx¦“\Û4ƒ&šH©\æ)D~zsM$i)¥À5.FŠ M) \Ô%\ÎM3yç ¨l¤‰IÀ5	9\Í‰\ëL¬\Û-\"^1L\à\ç®)…©3\ÅE\Ça}³A…7¿Z)\\vZi¥\È\0Sr*nRBñ\Å/\\\nˆu žJ\æ‰{Q\Ô\ÔDÒ†\ê\\‹HŸ#¥ª†¥.\rM\ËHp\â‚\Ã4\Ýå‡½0ûRl´ˆ\ä;\Z…€h\Üdû\Õby\ç8©4H\Æqž•3Rô\îœz\Òe¡‡\Ôv\àŠa¥s“M\ÏRy\Åf\ÍP\Üõ¦“ƒG~23HÇ§o­% q\éJy4Ý´6H\0sÚŒPzbŒü\Ô\0cÚ˜rp=©\ì@4uri 6§]6\ìU†ûJýwz`U\èÂ¶“\Ób*ÏŸ¶!S\Î\îþôÀÆµ¶w—,¤\á…_¸¸‘\îDYŽ~^•£¥\Þy‰òE\Z\Äf±\î¾\Ïg3¿˜$˜‚ƒ\Âç¹£@[•c\ËyAd*9\Ü0kv14lòÆ‘\ìV$\çƒô®F9˜	Ny~µ¤÷‘y\n™“p\Çð\ÑtibŒ\Ò\å\ÛaÀ\Î0(LªÀõ\È±Md”Æœ\Ìø F)\\,\\Fõ\ì_p\Ó\\\ç©\Åx\Î\á¸ó\Çò\Å{\'\Âs™\îñÖ”¥h²\è«Õ©\ë:\Èù\"\Ïl\ÖZ\èu£û¸þ¸®wüŠªR÷Mq1´\Å\Å\0\ã<RsœRsJ\Ú\ç%‡\äRt¤§w›\ZAIšS\ß‚@\éÞ¦\å¤7$sÞ™°–ÝœgT¼\ÒT¶5¸ƒ\ÐR`u¥\0ãŽ¸\âŒâ‹”7¤÷4\æÁ¤g¡¤\Ø\Ò\Ã\Õ€N¢‡\ØW\ã\å\ÍP»\\_\Å\Û+œ\Ö{›Ellù\ëylTP\ß\Ã66¸9‘}‡…ƒd÷¬­6S\àzûW“^³Œ\ì{8j*P¹Ú›˜”\í\Ü21\ßÖ£7Q€À‘Ú¼þ\êo*\ìÊ¤‚¹\Éõ¦[f]Y³*ž¦²ö\Ìõa|·¹\è‹p¤d¶*`ñœa»s^h—r\Ãj„»6\×8 \ÖÍ•óIbò–\åA&­T¸K\á©\ÖK2¢–\ÎMVŽ\à¿\Ìøö\ï\\C_5Í»3;cx\É\Ï¯5’¼P4R\ÈO©84ù®\Ét§e¾6úUynUœVe\Ä\ÖaD®‡k\äI\æ°UÀ>¦«™‘\ZQ“:\åfa“RŽW­rC3Ý©ûCJö9­\Û\Éþ\Ïl][\n&…\"gI\'k—^B •¤_™zš\äÿ\0´\'	‹\ï\è\rn\Ç;‹Dnw0\Ï|\ÑreK”\Ô\'©¥G,\Ñ!óTežUXb±./\çE”(\É\ç?Z.8R¹Ò‰G$\ÐÍ• W4%\Â4l q\Ð\Zµv5\Ù<©F\Þ\ãµ4\Å*}\rGš%!A\ç\ÐT¡ð3\År†\êñ%a\Æ·¥[°›P‘È˜ŒƒZ\ÂWg5jN17?\Û\ÖC’³9\î	É­a\Æ\reº\â\å»š\ì\ã\Ô+¯c×œ\ÔÀq\Ç\0T\áHŽù©\Û$\ÔsJ\Þ\'$„\Ï\ïíž´˜8ô§®ß¯)@\È\"´ Aõ˜	¿—¥9—Œ\r²0W¨\ç½ho4™®MIùTM×§¤!w}iL\âŒ\ín¹¥l\ã89=¨\0*A\è8¨Ø…cÓƒƒÿ\0Ö§Œ`g5\éÀõ\ÍR3b¯\'#\éH\àô\ç´6sõ\Ç\Ð\â“<\àz\Ó!‰€0I4\Ò9\É\ÉS¸-Œ“\ß\è3Cc\å\è5HBe—·j`¹4o©<\ãz6\ç·\ãM	‘\ç‚Œ“õ¨XŒ\Ç\ÉÀ©Ï§L\çQ\Â\ä“Á5W!H#\'w=¹À¨@8=©\ï÷ºó\É\ÂGjL…¸\ì\0>ñ\Êô5X\Ç \\Œ\ã=Z\0\í\áHôü*-§Œç¸¬¤mOtu\Ö\ì\Æ\Ò\"G!jZû·\ÐV&œþeœlz\ã\ÇzÖµÁ#ƒžµ\äWV“>³+Ó¡½\Ì0j\×LUXx\êI\ïVA\Î;W+gr‚0A\Í;€*o2q\ÎM;•c\éV\Ç<Ruµ)+Á\à\ni¾­Ÿ<„æ “@85!Á\ÔN\Â1œ\æ¢OB£¹\åž%f“YE\Æ6&jk5Û´ÿ\0	Á—ª\È\×þ!™»F0kv\Ò1\nGq^<µªýO^>\í%\èu\ÖŒž¹Ö…\ÛùV²¸8\ÂU[]‡Ó­G®²¦—pOC^•yEwhòqR\å§\'\Ù3\Ä&o2\å\Øwcšœ\ßA\ÔUe([x©\ÎÐœuõ\ÐZž\Í\ÞL—ùc­/]¼÷ô\è*%\í»!EJœö\ÍY(zŒ)\èJ‘\È\ÔÀ\Îs@H$ƒšh•K\ÜJ•WŽ*%\ÎqŽ\0§\ä\äòqRR&:qNñ\ÛqQ“»ŒóÚ¤{\ÔIŒóHHVž†™ŸQš^v®8\ïI”‰I\Ç\íæ³¥™Ñ€\0•\î})ñ\\û­KešE\Ð\ÓÁ\É4ÁœŽ€’iû€\çßŠr\\\äûšr\ãw­3>¢— L(\æ¤\0S@\ãžE?¸S°…·zpuƒ>½\éz\Z,\"LðjAƒŠ‹‚*AR\ÇqÀšvM3<óNÒ¤iŽŠI9\ÅB¼‘OžqšL´\ÉWš˜TC¸©TŒT3DÇ®\à\09üœŽ8\ÅE¸¯Ný\Í.I\ÍKE\r\Üãš“³Rƒ‘\Ët¥a¦(\è)\ä\ãqQóK¿\Ü\Z,;’sN\ÅG’\\Ô‚\íJq\íG¦6sAH“<q[ñ|–cý\ÜW?ò\äûõ­¹IŽ\Ç \ãä¨‘¬vg\Ê_fÝ¬?\Ã^\\’4r\rw\Þ6”Ï«\\OAü+ƒ!	9\ìxW”Ÿ›4.\î\áž1\åŒ3}\áŠ\ËÇµZU\\œqÖ”*‘E‰ll;TóÞ­’½ªE{m :E\Û›±ŠµdŒ\Ù\ëFsÞ¬# \Õ#EhyVaL†ROPj\Ú-¨\ÆKg\×-\Â[ˆ\Ð\Ä\å|\Ô4)R¨\ÏZoCA\Í+	±M0švM \ä\Õ±9¥\éRœñC\0i¢\ätüw4lõ¥\0Ö‘2M&?‚+DdØ˜\Æ—m<\n\Õ\Ø	õÑŒŠrŠ´Cc\Æ)Ã­4c4Î¨‹’dc\"›š^\è W\Ñ\×Sºc4‡X«ˆ)h§Žj…q0i)\ßJ]´Ðƒ4\à¹\"œ¼€j“¨†\Èö\æ†\âŸÓ½0¦NE\ÜTž)ì¸§ª\r´ž•I\È\ÆzŠ	ù¹\ïK/R¼{Xgš,!V/—Þ¥P;Ð¥\à~j\Ús”­(˜\í\0þ5K 0<Š$\\Šq\ÜÐXúbšï°Œ¶\éQ\Êc5\Ùiöw©6Eå“1òÔªøª¨P\0«*\r\"L¤’M;õ\éPPõ\ÍI“šW6Š& g=©§¥#ƒFA¥³T…P3H\ÊÛ½\0 rs\éJ%9&¥²\ÔCo~7h8§\ç8\é@u*3P\äk¶\nñUúža€\êG\êl¨\æ4P–\àµ0¤\è\ÙSFnµ.Fª„mñ\ÍG¹:õ\â\ßJ…‰\éš\Í\Ì\Ú4\ÉDzgÚ“?.j5\é\éC>±•Ch\ÒSL\Î\Ö\Å8\È0*®ÿ\0š²u\r•\"\Æ\à~¦”9«\ï,2¹÷§\áÂ{š\Í\Ô4T‡yœ\ÓXƒP—U\'­2IsÀ¥\Î\'L“?JN5P\í\îy£œ^\ÌIŠž;šË’˜\àô«d’­1€Š9\Å\ì\È\áI!|±´¹“J\Ø\ny\æ¢\æŽq{0\ç\'¥FÛ—<Ò’9¨‰\Ô\ÈtÊ·%\Ù=*K‚ƒ$±æ­¾\ÖqTUy\çš9\Èt\É%`sP6\âzô¨\ç>”¬ûW\0)9‹ÙŽ”\î\ì=j \á¤vÀ\Îxª\"·­O0ù\r\rÁNOLqK»\å™¬\ä˜`g>\Ôù&\r\Ã\ä/†¹\'j³°\äâ©‡fŠMý‰\âŸ0r“3)=j#\'^\Õm<Š‹~)s”›q\Í3$“\ïQ†\"“qÁ©\æ-D›y˜[q>´\Âx¦\Z—2\ÔI2qž\Ô\ÓMg\Ï\éQÀ\â¡È®RÀl\Ó	95lóŠ3Ö¥È¤‰	¦“Ÿ¥DŽôˆ\ÍM\Ç\ÊXSÞ\éÞ \rA4®5F\'ŠŒdQœõ¦–4®W( \çÒ›¼Sw2ED}¿\Z†\ËH²­šzóš©¾¦‰³Ö¥²\Ò““\ëÖž­\ÏZ…\Ï\'•zTÜ´‹!—·\\b\Üýi˜ôô¦œ\ä{ô÷¢\å¤L\íÀ¨;~fœpZk¸?LQr\ÒTz\Ôd\åiH\Î­5¿\"’#+Ÿ\ÌS9R’8\Îi¹$p{Ô²‘\ç\Õ¿j˜þƒ­ 1¹\ÃR\ËD@\Òry=ªÐŠ>Šy\Çj®\éƒÓ¥\Ó\ÐS†Üœ\ÔT`U‘›i\às:ö¨ý1OÊ‚¦€Ùµ$\éÒŒr¬sø\Öd—71?v>=+fÀ–±ºP:O\åX\Ö\Ùó$ŒwZ`SóT(lž*7GÛ½»÷©\ÌÓ¬aps\ÅŽ¹©\á*Yhª3œu\'õ©6?RÚ¼\Ë0Œ¹\è1šÕº»\Âb,’HO\ÌW ö¨,\Æ\ny©ÈŽ\ä*Kri\ÝMiZ2¤2º/¶\êhL¨a•@\rÀ\ï^\Íð±-\Ò$†\ãŠò•m\í¸v¯ZøTK\\]œ¨3\Ò,\ÓühúžÍ¬¶R!õ®pZ\Ý\ÕH`œXÞ•)Y8•y¥9¤¥\Ío\Ìr8‰œQƒ‘Fy£<\ãÒ†É°üf‚rj<ú\Ñ\Ôt©»(~\îh\ìr1MÏ¨ ˜\ç¥ðq\×\Í{óI€)œœóN\å$\éãš‡%Ž1O\\xõ¤Æ†ÅŸ5»\Õ\æ\Ûv¸­]¸\ïT5†ö.2\àb±zš®„·P\Îñ˜$\Ö~¦J˜ó þ5\ÑDÀ úsÞ¥R„ö\ÍyµiE\Ê\ìõhU’ŠI´úó\Ü\å\ÙBsSU¿°n\ä,¬@Œ8\êEv§o\\\ÓXªr\Ç—$OJª\É$ŽR\ß\Ã\í2n.9\äóW-´¦¶³h—\Ío‡F\É†*§“Šjr\Ä\Õ{\Ü\ä\'\Ò\'Ž±G»v=j\Ú[\\\ËBH\Â09\Ú;WKßŠiª±.´\äµE\á-mµG¦b^Y\ÜeDI¸¶2s÷q]!!qžý¨Ü¤d\Z\Z&5\\u±oi$rT\ä(\æ¬\ÜG%Í¡BƒzfµSIŽôXF\Ý\Îb=,¬1¸8­Y!\"\Øž1À­ni¤–9‹	\Ôl\æçº’Hp±H6}\î:\Ö[Á}q©Tïž¼\Z\î1\Î*/-qÖ‹\ZF¯.\ÈÇ´·‘$\àœ\'\'¨\Í_¹\ÎSo?Z¼¡=3ÚŽ>\éªH\ÊU.qÒ£-\â&\ÂX’pElZ\ÆÁH\Ú2I\Íj•^°­!*\Ç=ˆ\ãŠ\Ò\n\Ì\æ­Q¸ØžO~õ(?inÕ¶ür1Ö±.3\ç’xô÷®¸MM[!ºbT\äóùzÕŒ\rÜœû\nr[©t©WžMnŽI\Å!\Î3\éJvûñA óZ\"½j2\Ùô\âžX\Å4\ä“M \0¦‘ºtö\Å(æzv$oP\0\éT÷\'ñú\ÒI\Î\Zv\ä\ãz÷¢Ä¶3\r•\æ˜\áˆ8¥9R3B\Ó!?^{\çµ)\ÐI\ç?Z7—V\ä¸\Í;3zg“Œš\Î\Õh -—|Z¾q’9\äõ¨þl~\Äc\éŸo 4\ØR©\Ín/\rõ\Å5f	\Ï\Ì~€\Òc‘ž{úô¦Hò7g\Û5^FAÔŒT\Í\É\ÅW|\êpLP&Vu;¹Ï¯\çQŠ³!Ê:v>µ_•`q\íAG‘°d¯>™¨œ‘\Ï\â\\c­J\ÅL…wg8#,¹L`zš‰GFŽ‡Hbm0\è\Äõ­»w\É\Ås\ÚI;=0s\×ü+v	ù³‘^N!{\Ìú|¯I#~,sVÔ€§ŠÍ…¾Q“W\×Óœ\×=H’“Aô\ÅF\â?2<ŽÁ\ïÈ©\ÔV¸<\Ç\Ýn½M\"Ï¥N8úÓ˜\íS>\é9Q\Û8¯­g\ÎŸ”\Z©3\rœŽj\ãýÚ¥pYcrºMe7¡p\Üñò\ÎÚ­\Ë\ã K´j\ètö\ß9zñ\ï\\\â!{\é¤Á\ä;p{z\×Q¤§\Î\ç+ÉŽµZN\Ô\Î\âÀ÷\Ådø®O+H›|\Ã‡zÜµ ;³\\—Ž%+a\Z\ç\ï½{8óU‚þò<\Æ|¸j¯û¬ò\Ø@š› €sõªñgfö©G\ï\Î\r}Tv>[’©SRd:ö¨¸<€)À€3Ï ª%!³ô\ÍK¶˜y\éŸJs“\Æj–h‡§@}\rH “õ¤R3õ¼¯QÇ­&Z€Nõ\'CLC\×;Ÿ\\žüb b‚qRrx¦g4 1\íƒC)\n\É\ÎHüj?!o\Û\È\ï\ÜT\Ø\È÷¥?g<\Ôq¾‚—ºšv3\ÜSÂ•bOCLC%³\íF6‘ƒH¿!8§õ=i¡z§\Ô*Fq\ëRñaL\ïš^Ni¼cÒœ3\ë\Å$\Å9@\Í3ŒO5#v\ìRžõ\ZæšLhw©\àcµ4šw5%¢eluéš•A\'\æ ¦¤V\Çð©h¤L¿/ûS\Ëddw¦§þ€TØ°\Î\íJ:\â£%S#¨©8\'8ô¥aÜ‘ˆ4.9\ïJi_Sžh(8§\ã¦*\Û½<L	\äÔ±¢^\r!#\ÓLŽ~”¥ú\n†Ñ²Œ†ªeº}+Z÷bÀóû³Yh\ãpŽzÖ–¤\0±$·\rCjæœ­AŸx•ÿ\0\âmqŽs!\ë\ßÞ²DH\Ã$j\æ¾Yõ	ÜŒ1s‘Xþo\0\ÝMm¡ó|¬´Êƒ¶j£œ71˜(¾ü\Õl\í\æ•Á!\Äó@¦\î¥ =@\ÏNµ7‰y\È\ÏJ˜\0@§Œz\Ó÷`Qr\Z%ô\Í8\Õ>ô¹¢\ä4N\\\nn{S7¶ZZ.\Èc©\r 4SD6(4ý\Õ$SƒU#6K¼\Z>R3Qc5 ²2d™\Îh\íM\Ç4\à\rkd\Ø\à;Ó°)-hf\Å\àÔ˜¦)i¢[Š:RG5D¶(ô§v\æ˜:Ó…P®4jJr\ã¿Jar<Rô4ò¼ðh\Û\ÓÒ…v&;\æ¤\Ç\Â)\àñL.\n*P„\ÖÕ¦…qwn&Œ©<f³¥ˆ\Å!\Î\nœP„\ÓE}œP¨MH\åp1L¬‹‰Ú”\Æ\çüiŠy Šv]¦¦/\ëP¶O\áJ«ó`œQaTŒ\ZBÞ”¸XñƒšTpAõ¥`.ý:Õ…\É\Ç5õ\ÇLU”,PE\"â‰•TÙ©\ÕAnS9š¾˜\Æ;\Ô3x¢UF:Sƒ\Ø€†ž\0¡³¢1$U\ëš\0Pr)y¥R\ÍCfñˆ\ì\Ó@\0qÒ\Ç\"—dgŠ\Í\È\Ý@^ÔœcŠh\éK¸“P\äl =FFðŠ£š„Kƒ’\0¨\Þ\\ð>¤VR‘¼i˜\í\àtª„ŒÓšGÛ\ÔqQœŽµ“™´iˆ\Í\Í38§Mý*\\\ÍU1\0\éLv\\\ç<Ô„\åp*Fk	T71q¸)\ÞZ*uæ”º\ÇzUS:c\Íc)1¤…d¹\àS]c\ÆA¥yö\àŽN;U7`\ç==«\'P\ÙR&ûHAµsÞ¢2¹\Î\âOÖ˜uFI\'Ú£œn™&\ážE4°ô¨ù\æd\ÜbŸ9˜ð\çh\ß\Å7(p9Á¤À\ìis‡³´T[”\Ó\ØHc§°£œ^\Í»ñÖ™\Ó\Ü\ÔreN[ ¨–lóÖŽr0‘¹õª\ìÛ²}Hòo¨[Œ\ÓSdºde¶¶qQK!\'\Ôu©:Š…²j¹\Ét\ÈI	\ï\É\ÍN!†üê¼‘¸\ÆM\'\"y<ˆ½U-‡©\Ù&äŠ¬\ê\Ã\Ò\æ \â\íHd\Ê\âš‘\ëIN\â\å 4\Í³\ÛŒ(¸r‰\Í\'#­(š\Üu¥pQsI“‚i™lf““\ëS\ÌZˆ\Ý\çñ§\Üz\Ó1ž¢Š›–¢\ÜqF\áŠv\ÐA\æ‚¯±¡±\Øh \nBz\ÓKq\ëOW¥p°Ì¶)‡\'5&i™œT•aW4¼óIœsŠ^+•`\Ï~Ô…ºwÀ¤~´ÜŒf•\Ça	\ãùTLi\Ì\Z`¤Æ•\"g=\r&*’AI\nsž8\ÍH¼\ZnSNZ“D‰3Ž´Œ£©\ã€\äóO#ŒT\Ü\Ñ üª\',0\rKœ÷\ëP¶N>”\î]†q\êi‡\ÔT™\à}j¾sžh¸\Åe¦`š=qM9\îz\Ô\Ü\0\ì\ÎsQ\àr})\ìzý) ðh(`lz\Ñ\æø\Zv\Í\Ç4ÝŒ\Ü\âš$ˆŒRzŒ\n“\ZB¸\Î)€\Úi\ÝN\Å.)\Ð\è5½\ê¯\\\Ã\ÔV<A’\í[n\ï§Z½¥\êÏ¥	¶Ä’ñT§XŒ’Z\Õ;0¸X\ì\áy™Ÿ„\0t\Ì{š\è\ÛT·~\Øz5U7\Ö$ôRy=\êYH¡i40,›·n\ã\ÓÒ½³+l\ÜNq\Íj\Í ±-j\Ù5`]xtò`•I©sŒ{*xnhéŒ©9\"´¦“D”-eNN23\Å6(´¢\ï\È9?+-\r”$™˜\Îv½{\áT»g¸ŒF\Ü\à\ï\Åy\âi6’È=·W¯|3‚\Ú\ÞY¢ŽA)^K‘Y\ÔøY®~ö§¤j\ã÷iž+ž@G÷®—Y»O¡®f*Î”´;11Ôœi¼ôSúŸÂŒcŠ\Ý3¡„Zn*z†G½;’ÕˆÀ®3\Ø\ÒÒ	¦’:ñTH\ì\çœRs¸\ÑÖs\Ô\æ\"Lâ“¯\Æ\'œcŠ^ AW+šp|šh\ç\ØS~cÛ¥!¦KoÌ‡·5SQ\í±ûŠ¹i“)©ê­¶\î,7$žÕ„Žˆ\r¹œ¤D\à ‘\ïYšeü\Îw3eI*ý\ÜO,gR+M†u!¿^V!\ÍTV=¼,`é»–\ïukópRS\'­U\Z\Ì\Î\ádŒr\Ç^•Rý¦³–E\Ü\íÀ\ny¬\ØÄ«‡u!r\Ù8\ëY)Hõ\éÒ¥È´[ÅŒ\Ûm¼\æ‰Àþ•”ú\Í\ã3ˆ\íSi\á\ßJ~\Ü28<\æ°gžb|¡’ \Ó}k[è‰…89I4·6bñ«2º(\Ãq\Íl=ûFã‚¤\×-Œ$re¾ø:]N¢%K$#\ïc’lU)\ÓMXeÞ¡q,‘\Ç\n\äŒò\ØÀ­ƒ9¶µ2°\Ëpûš\ä\ÞI¢2\Ëå£\ïfº‡X^Ð†8R84&Ùœ\ãk¿\Û48-Óš#×£™3´ó\É\ÏQ\\ü²\ÈYQ_z‚@oZ\Ï0\\$\ÌT’¬c5<\Ò7Ž“Go®.%\Ú‚\Ý\è»Ô¼¢!œœ\î¹M.\Ò\î2\í¿ \í\ÖÞ±Y 8\Ï$}kD\ÛF)\Â±j©´nG QNrñü\ÅÀ\\W=}\íp}¨²}\ÑI\ÊoS¶H\Ã>)]Ü¿c[¶´n®Œ+Œub85f\ëV†\ÚaG,}F\Ãw\ÚdoS\Ïz³~ \ÜD\ÅG*FZµ{²QæµŠo¬[´\Þ[\ïÛŠ|\Z\í´ÓˆUd\ß\ÇU¬Vù~n²u­+%\Å\Ñ\èq»®-\ÜÊ¼ ¡tthI_N¦²nm\ËsÚµ\0\È\ãñ¬»°\àŒõ\ÛÃªW\'6ö© {z¯…\ÞO>¸©B\çü\ã¼N9\ä÷ œ\ãƒ\Ó\"—<Z\"°x£\r(\è;Rdõ\ÇCT˜†\ä`žù¦’H>ô \à\Ò\äóŽ3Š¡1„•\è=\é…\ÏL´ÿ\0¼*2€\ËÏ  ÍŽÜ£©\çú\Ð\Ä\0:\0A¦‚3\ï\ëM\äý3\Ïzh†\'\nýxþ”\'#§µ¶õ4w>\rQ!cL\ã‘\éÞœA>ô\ÐH\í\Å°\à”\Æ\r\É\É¥³M\r”\ÉÁâ˜c\ä1ÚªJ[$‘\×\0ûž\Õg¨\Çy\"«Ëµ»Ÿ\\zS%•Ë±\ä©§4lŸlúJz«9‡­G\Î\ìNzŠ\ê(@\ê}¾µ…[nG\'<ö>´l\àþ@“D³+66œ\Ç?Ê¡š\ÇsWH“\æ(z\ã9õ®‚\"w\ã®gK“\r\Ý\×<ž\rt¨À¿\ã^^%j}]/v\ÆÅ«Á9ö­8³Ï¨\à\nÈ¶Á#\'\éZŠqÜš\âg²‹h«\ÜgnzóøÔƒ$q\éƒI )\È©,úEð)ƒŒ•\ãÞûW\Ö3\ç’Hò+T›e¬\ÄñˆÉ­S’{W%â™„\Zm\É\ÎÜ¡¬*»BF´•\äŽJ•\çLŸ»½«´\Ó•nwñ\ë\\N‚ì‘–\ïù\×y¦³‘\Æ\î•\æRø\ÏJ¯Àu\Ð.`c8®Ç¸1@£žy¯@‹8\Î;W—ø\ægkøb\Ç\n£&½\Ü½hŸ9›\Ê\ØYù\ÙTy\\}jQ¸}}i#\È+Ž¹\Å8}sÿ\0Ö¯¤G\Å=À	\ïƒ\ÅH\ÇQ\ëš`#\0SÂ‚\Üt«2\É\ÎFx÷&¦Á?/¸\Í@‹Œ@\Ïj›#-“þ©fˆÍœT Ž\ç\Óó¦/==O—“H´H¬½ô§òqLPq€>¹§dƒKA’\çOö¨‡=O\ì­H\nGÿ\0Z¤\Ë\ÇzgÖ¥A‘º¡\ès\Ïz^NV•jP£‚zÔ–ˆF\0\Æ(\ï\ÍLPõLu M\n3O\Óô§d\àñT!\àfž;Šg?­;žô-\'¥?…\Í&÷¥È¤\ïF\ì‚qHc80#×š€ŒŽE8dI¡¢~˜4ü‘Þ¡\ÍJ9©-£\ëOõj1Ž\r87\'\ê ÷úƒO\Þi\ä\nxÚ“cHš¹§c=ª&À¤P\n85\Ï\êú¨Ó¡2œ*\å\å\Ò@›‹b¼{Åšú\\ÀñE\Ïm\ÄW&.¯²£)\'ªGnƒ\Äb©SµÔ¤‘e~\'…©„”ïŽµ1ø ¨ÙŠ\"\àõ\Ý^\'¿p5bd3\×È¼\Ë\â3öð\ÎQÊ¿\Ù\×\ÞÏ¢4¿ÿ\0hü\Æ?,u\É\í\íVõ?\ÞK\Ç\r»L…pXv¯Ÿf¼HQ$†põMÜ­i\Ùøºú\ÍH‹c+uS\ÐQV³LEµ–½\Ìg\Ã{¿-%n\×cu6Šydb\ì’Pö5\Ê\Ê\Ä@ r*ìº“OtÓ¿V<\Õ{›ˆx\êz\×^2®\ë.y9Ežs\Âx›\Ã\ÒT\êÁ]4÷òe-\íÏ½I»+\Ï5W<ñR)ã¸¯¡\æ?&œ9[&À R¡¥L`šF\ã¢\ìÍ¡œƒR«šo^;úÓ”mâ‹™4J	§\îç¨¦‘O g¨Í¡\Ù\Î8§\äS\0\Æ9©Tq\Û4Ñ›ŠZŒ\Z@9ªFLn*dQ\Ç\"Œ\ÍH0EjŒØ9\"\Æ88`zSOµG\ß9­Q‹\"”u\Åö£õ­Q›N\Ð)\ã\×fbõ§JJwZh€§Ži¸§ƒV‰\nJ\\ñM\Î*•…qÀ\Ó\ê0iùªþi9£u)oZ0iØ§”Ð®‹q^\ÝD›RFQ\Ûª»´’Å‰=M&8¥\nE;	»†)sƒA\ê*Ã˜š%ù‡¦„@¬:yÉ¡j`8@W_½Œf•“­„V#“R=«6 e6F*0h\nÀ`š²\é°\Í7cžÙ¤\Ø\Ò¦L\ä.;\Ò2`)ëµ”øT6k’…‡¹«	p}j\0A\ÅYŒ?ó\Åf\Ù\Ñ–}=1RsŠh\Ç5d\äuB$¸Á\Îi?‹ùT€t\ät¨Û®+)H\ê„n1\Ï>”ÁŠbI4ó‘\Û&±r:0e/\r\Å1›\0gŠB\Ã\æ¢R71¹\éŽ\0 ñÉ¥<\n\ÊS:#LŒô\ëšc¸\Ç4œæ«¸9$\ÖNf\Ê†U\èj/1O$\ÔmN*¼®©“\Î@¬œ\ÍcOR÷œqù\Õ70\éU¡”Î¹*FjNÕ‹™Ò©V8å©¤œñL\Èd\Ö.Fñ‚A\É<sN1›‰ü1Q\îpx\âŸ\çpŠ‡#NT\"Œÿ\0Jc‘š€Jy\à\n\ZG5<\Ã\åD²!9Àª\å[Ò…’AÐš;æ§˜\\„eO®)\0¦±=3L\Í\Äò\Ë%FI\ç&”;®\r!}\Ç$w£˜\\¥W¾õ¦\Þr\0«2:–\Îje\Ëb\Èp!ós\ÇjC\"\ç\Ír§\rU\Ï\ØxR3š«\âL\Ï\Ï#ŒS\r×ŠšD*pGJFÈ§qr–`0) <W\0\ã¥V™pÛ…!¤C ¡\íU\ä—\03Ç½LrÃ·Â¬3Ö™\r…\nÂ£9\Ï&µ&@@ãš¬ö\Ò»W3h¦iS;…YhX\ÓXlÒ¸XVqœøTlŠy¡¸a\ÍH-H¤Š\ì¼`T^­·&Šb–\ÒOJ2®(4›*\Å|¯­<§\0\çŠiN)\äƒ\ÆiD\éžE3©IŽÂ\í¤X¥Á\Å8`)I8¡²\ÆS˜\nhÝŠ7dŸz’‡‘€*<p*C†\\SvT\Ücvpi›BòML\çZˆžGz.;	Œ\Óò0)¤@¦…À\â“)3šSš\\9\Æ(\ÅAhD#8\íRpOµ4uíŠ“HŽ=9¨O>üÔ˜\äô¦’0\r‘†‘QŸ½Cg9\ÏJi\ï\éŠ€Œó\íŒTe°x#4¦›óg¥\n0M0±œZi\ã§z\0i,)Nÿ\0\ÈPx\É¤œq@¬?\Èe\\\ç\r‘ø\Ô/œ\ç5&÷d	¸\àd…\íQdu\Å\0\Ð\ÐsN\Î=©ŒI9¦““V!H\Å©7g þt ‚}½jnRC{œ\Òñ’ht\çÞ‘i	´\nŒ\éO\'\ãJ\å$\'l\n:`Pw{ŠLñR\Ùv\0\Ïj÷o„›GŸž¡ˆ¯\Ï5\î?ñº\é}\Ç#\éS7\î3Z\nÕ¡\ê{²›\Ö.½\ë@1€1Š\èõ¬˜¢\Û\ï\\ü*@\Ãg\"²¦wWZ“¬y\Î)¥y­^:Tf ¹5ºg$¢g°Á¦7 ©\äÇ­AZ#\r9˜{bŸ‘ž)jŒ†Rcq\ïKG^ƒš‘À¥n\ãŠSŸLS³ŸC@\Æ\àŒóH)I¤\Ñ- o<úU-g‰\íù\Æ[«–ŒD\ì?\Z§¬&‡\â\â³v6[#I|X©V\Þ$û£ \ÅS7\"\Þ\ßy\Ï\Êj…ž´·„œq^mYAJÇ«B3qº\Ø\Ýkx¤\Æ\åŠa‚\"0Ñ©\ç#Š‚[\ëxð¥†j3©ZL€;\Öw‰\ÝV²µË¾X\0\01Ò 6¶ù\'\Ë>Þ•“ý³lóº‰C#>µiuKGp¢@M	\Ä\×\Ù\Ö]Ë¾LX\åE8¢”ô¬ù5;Q\'•\æ.þx¨\í\ï`rY¦G\áN\è9*æ³¶¸ÀtS^½jQ[\n}(Žh¥‘\ëUä¿´Wòü\Å\ßýß­=ýñ©ck*\"¿e¶( \Âôö¦\É{®VE<\ä\Ô\ÚFÁZT\Ý\Øg½\Zö¥´´H+\\p\rH\Ñ\ÆX¼ŽW{\Èb\Æ\éW\'\ëš\Ú#d%\\U ~ðì­N\ä“Q6Ÿ\åF\È>õj9\ÖE\È+ž™\íšC*©ù\Ü\nVA\ÍPlpG:šd¤Ž\ÆYG$\Ì\ì\ÃhzsÖŸ¿“M$K\ç(K¦ZKp\'#ô©–\Ö(\ä.£“Á©Ì£ ¦´„ž¿(ª“1©\Î\Ðü|¼q\Û²nÁ\åˆ\éZ&TLò­f\\\Ó1Žÿ\0…tÁžeh4@Ë‡ú\nz`z\à\â˜Ïµõ§ƒÓŽµ\Ó…’g-\×\éA\î24\Ì.M;$ö­\Z\Ûq\Í<Á\êi?\n1‘\Å118<ŽzPqŸ¥8‘\éM\rß½R%†\æ¢\ã\'Þ¤¯@q\Å3§CŠd1£ ¦)¤‚qÓµI„ž\Ô\Â\0lfƒ63œQK¸cž* ƒÛT‰q·Œu\æ£\0ŽaN.¯žE~\Ä\ÆWy8\éÒš\Øl1\ê;Š~8\áFO_þµ5F\Ìb•õ$Œ•V£\0\Ä\ã8\æ¦%Ž*)B°;³ô¦&T9%@}h}ùR­\éÚ¤v\È\Ï\çš` •9$ph#©21\Î?\ns)ÙŒg¹44Ož‡&—s\00sžÂ¢F‘%²ý\Ý\ÒÑÓ¤€°\Ú¹;m\âeÀñÖº¸¶ü¸\Ækƒ{.z\ØÙ·Bö\Íj¨Pk&\ß!‡¯­d$‘\È8\ï^t}Œ\âžy\ZhŠy\È5³\è·\ïL-\éCNqõ¦Œ\×\Ö3\çnœW\ãiGöcF:¹\n+º\éŠó_]*Gvipyô®\\C÷\ÓA{\è\Í\Ò!\Ûd‹\Æ\ä\È5\Û\é£\åN\ÜW5b»¢_—-ÛŽµ\×Y\í8\Ú8®*+S²³\Ð\ß@9\â¼oÅ®eÕA\àc¯cBJñ\r~A.³p{¯-_¼~Q>[:•¨Ew‘š28\ìF\ršzœq\ßšv\Ö\0W¾“bd9\ëN\Å\"Œ\åqÒ¤U5bH˜\Ç=H`~¦˜¼Zxæ¥”‡\Ôð9\ÅFAb	\ÍH8 1Ò‘hzœŒS°½?Zj)\ÝJ’‡dqŠp\êz\Ô`ö§d\Ê\Ò\Ø\æž$#€@š0\Ø\î\r\0t±4,¬ƒžñÞ«Š9\ç·JM‰÷\âóqš6®\r8b‘@€u\Ïz~\Þ(Ç¥.ph†*RsNA“Ö†\é\éE\Ä8S°\"õÇµ;8\ÇZ`\ÆiÁ@h\ëA ,)À¥\ã8¦ñN¤1\Ã\æ50Žj,dT 1\ÍK)ŒTªc\"¡UbµL½x³e¢Lš‘T\äži£qN\ÍC4C$dE\ÇAY7—±B¼õ•n\î@¨I\Åy½õô\Ò\Î\ãqÛ“\\˜¬J¡³»ƒ–.¢ŠØ«\â\rb6²3\È\éŠñ½[T9Ž?¸8\Í^ñ§›¹S¡f¸ƒ&\â\Ô\×\Ëc3\n˜Ÿwd~Ÿ‘d06¬\×4ÚººØº§ž:Ö…µ³\ÊO\ÊMeƒŒWU¡\ê)k:;¨`:©¯2\ç\Ø%\î˜š\\qÌ²I£v\'¡¨\Ò\n3^¯\âk\Èn4\Õ+br0H\Æ\Úå´«(\ß\n\àu\ÓD\êŽ5¢m\Ü\äi¶K,¦9½ª\é|55“CuqH\0Áö9¥\è–w\â_*A\æ\'!{š\é¤ù$3iFI«&;½²k9·q‘U”W£ø‚\ÄI¦‡eù­\ÛÚ¼\è\äW\Õak{Ziõ\ê~›\á>©Œ©¬w£&Á\çšL|£§µ0f”sÒºŽ\r<\Õ\ç­=O½l±\ÐSª )ø95fRšp\'½ \æž)£&;4¼Ru¥«FlróRŠ‰zÔ¹À­Q“ÚŽµF[¸4\Î{U¦Cˆ\ìSóQ\î\É\æŒñ\ÅZd8’dT€\Ô9\ÍH\Z´L\ÊI’qÞM\Îiã¹ª2aÉ§\nNôU¦M…\Í(4˜\Å\Åai\à\ÔY§f©1X•iÀô¨•±R\äU\Ñ 4™ `ÑƒM8\n\\œRO\íV€e9H¦‘šZ`Y\rZTS8\íY\êÀu«j\êI8¥q’¬jÜŠ´ªFwd\Ô T÷.\ÞFP1š–\ËHšDO\\ôæ€™©D$á›šœJS œT7cE7Áq‘\ÇJ”.N*½\ç#Ž¹¨$\Õ-…‘Xöœ§»:aF[¨³EpO­\Æ\ë\ßÚ°#¾M\å]q\Îk@Ku9ö¬œ\Ñ\Ó\Zo±¤¤6i\ã¦9ªðÈ­#/aS0eŠ\É\È\è„	2H\ä\Ò\n`a·œsNó•Fæ²”Ž¸@i!9=1ÛµP¶¿†\í\ÜFr±š²_q\í×Š«¼132 RO5„¤\Î\Úq‹ln\Ô\ÖP:Rµ5“™´i¨ž}sM>ý+7#xÀ,O›&\Übƒ…\Z„° î¬œ”K(5M\Ói\Ær{Ôžkc\0\â‚wN+)H\Ú0 `\àS=)\Ò¼gñ¨a§8\àšÉ³d‡‘\Øõ¦Õ8\r\ÈùŽ{\Z†Ë°\ÐÌ½*3–ú\Ó\Ï\Ê}iÀ\ËP\Ùj$!;šxñ\ÍX[f|e\Õs\Ø\Ô\Â\ØDO$ö¨r-@\Îm\àô§Ç´\ç94\íÌ½[Š›‹”¬Td‚*\ÂÕ¢3Q1µ	\Ñ\ÏQL/ócŠ‘—q\É\éP\Õ\"\É<ñQ\ÈÊ„Jx\áŽ{Ò˜\Ãjˆ#HÔÃ¯l\ÔYUq€3š¸«Ú dùø\àž¹§rZ\Ã\Ì8v\ÍDSªVA¨ŽóŽ@ªD2î¦‚\Ã<Š{\ÆpO5SŠ£&Cžx\Ñ\Ó&­*n\àqLt\0sß¹¦C*\È`©\çµ ý\rJcþ\ïj®ÎŒ1L‚	sU\Ìr“Á53ƒ\Ç&\Ç\ëŠ	*³Ž\Ø)@\0\Ç_J‘M\nh(aª\ÅX?V‰$ŠŒ\ÔØ«€8Á¨\É\êE<…\íLd9ñ@È±CGÁ©zŠnqÀ¤\"=3o&¥$Sz\à\Ò\Ød\'M9\ÍIŽi†	“š\\óG$\ZQÈ©¹CFO Rœyâ”ž)¼“H¤=@\ÈÁ\éL89\ÇL\ãp8¦“¸\Ð16ö¤©Iy¨ø­MÊ°˜\äTœ\â\ÉPR47_Zo#¥;÷©f±\"\Ý\É>ô\æa×¡¨\ä\ÏjaT\ã4Š#“!ñÖ›œ\ns>üð94\ÂGz\nCyŠC\ê;R\îM/ÛŠ7\'jRƒÚ›Š	;O\'\0™þt\Òý:\Ó:\ZQ\ê(\0\êNjN@\ëB±\Íq\æ€zñ×½4õ8ô\Í<®5†ó  qNÀ\à\Ò\ãwzB¤T¶P¼f—ž)»M.09 ´y¦cO\"£ `ýi2Ð˜÷üi„Ÿ\\T[\"˜zÔ”(\Îv÷¯pøJNù÷&\ÞExr®\r{‡\Âe>m\Ñ óŒ\Ï52øY¥/\âG\Ôö­Wc=¹®q6nöÉ­ýYˆD«6×Œ\ÔSVGmg\ï\Zƒ\n¼\Zkca¦\'\Ý\Ýiü„žElŽy_\Ô$óŒ\Ô\ç+DsHˆð)GLSð:ô sÈ«3°\Üb™N4\Ó@†óš8\Ï\ãN\âšy \îh\Å.qF\æh\0¶?½5WXÏ™ ‘\Ûry¦«k\0†„\í\È\'§¥d÷7[\î‘ä‰—‚X`Ò±¬%m\Å)u<\âºf¶76øl†# ƒPXh‹ls’s\Ù\îk\É\ÄR”ª&k	Z¦\Ó9û\Ó(¾»e\ç\Ø\â¨\Æ\×\r#‡L*\ãÖ»¹tØ¤,\Ù\ëP\">\ç­g\ì¤zô±´”Rh\å-VGY\ÃDª\nþ¹ª¶Èºœg\'\n1’+¯MË‘˜LJ“Âž•b=*”H;gŠjœŠž2•º£\"\ê\ÝU•Wq±n!uF\Ú\áƒ]\ÛY«A\Æ@–š.\Ò\Å\äÝ¸\ç§J§eO­JZ’\Ëo¹²0\Ü\Ô×–°£K\'–*\çßŠ½m§Y>F8=EYš\×\Ì/\Èùª\Ôt0•h:£Ï¤‘\æI\å\0lŠÖµ†\Úi!” \'ZÓ›D†AºVùaVm´Õf\Óò¨©Pw4ž&›…£¹Íœ2ÊŽ\É\Î\Þ+œûCy­£.\Ô\Æ\ãü\Åv\ÒÀÅ— \Æ\reK£\ï]»†ù³T\â\Ì\é×‚øŠš;\æ<=ñRj(—\'\Ðzf¥µ\Ó\ZÅ±ùI\É]X\Ý\Ï8\ÃY\Ø~\ÒwOC)šV‰Œg¿­e}¬\ÝŽWu\îI=\Åtq\é—J\Ì\rEV¹Ð›™)cü\'½&¤n«PZ;\ì\ìI\Z9 žÇµP¹\á– %8+\ëZP\é·1Z\'.H\Ï\0\Õ7\Ñ\ï.eM&\í\Ø\Zvv1S¤¤\îÕŒ)n.\æ4,ø/\Ít1“À\"˜úD\áÑŠ©\ÚG=\êy£h\ÊqÉ®Š’\Üó³\n”¤—%†?–5*\ã=ª‡!F*`\Ø³Ú»bxr’~µ ¨\ÆO\ëÒŸ‘ž\àV¨É±vF¤\Ï~´¢›\ÎM1§j\'ƒG†(Ü´\Ñ#ù\Î{\â¢\ëÁõÈ¤8\ÇZp\nNz~D±lvü±œ\ÓI\È\0~œÑ’zõ4/±1¡Bð3NÀR\Ùæ”ßž)£\Æ(\ÂyS\Üu¥>­\Í;Œw\ëGÉ–\Ý\éÖ€NGQÓƒQ”\Æ\0?…=€<q\È\ëH¬Œ1\Ï3A-aÊ‚x=*rG>ª\Ôù\ÆB ü{\Ó[sõ®FMU\ÉdnUH$\çƒM \å\ÈŽ\Ì)\Ä`sš€v@\0t2DqŸŸ··z“k¡4ÀüòI©¥\Â\0sÓ®}\rK*\"©+20‡Eu¨Kƒ€+‘f%³Œ\Ü\×SjÂ›±º¸qC\Ú\Ë\åiPc5±NG=\ë\Ó\é[1{W—#\è\âN4\â@\0\ãŠ\æ§mÏ¦*M¡Xf™\ÆzÓ›\0i¸È¯«>td;È¯%ñk¬Ú”M\Ü\ç®\rz´\ä\ì<×”\ë›\Äd±{~¹®,K÷¼:÷\ËEt…v€yWSc.Ü®01Yð$Hj\â·\í~\ï¿jÆ’±µG{–.\Ø†x\Íx5\ë	o¦8\Ç\Î\Z÷MK÷vR>z)\ë_?ƒ™Ø““Ÿ\æk\è2µñ¿C\äs\É>¬¶¬PŽ;SÂ–¿¯­E\É\ãÚœ œúv¯lù²e\Å(#ÓŠC&\Õö¥\r‘\ìMXq\È\ãÞ—\ç÷ç·°¦\ãœ\ç§ó§†\ÏÍœŽ9©eCòŽr6\ÓÑ\äô \ã bœ\0>\Õ,¤8sßŠ\\û\ã’)ñ‘\íKœb¤c°3\Åô\ã­!§J^O”\0ñÁüó\Å3y#žÂ“vXŒ8\Å\0H¤\0}ªLgŠ@ƒƒŠ‘S\r\ëI²\Ð\Õ=8\ë\ëO}i@ö§®\Õ\Îzc­\"€O\Ç\ãH?\íO\0\Ð\0Ç­8n\È\ä\Z0ÂŸŽ\0\0/ð1Þ\0iô€nq\Å8t\ÉÓ“Ö“q\ã8ö¦+\"¤\â¡¥ƒÖ¥Œ‘I\È2·#9¨Fq‘VFEK-\rƒ\ÅL©€GZ€=\ê\Â3×Œ\Ô2Çž1ùšŠgÚ¤úS›$öª’1\Úz‘P\ÑG!®jR\Â\Ëÿ\0ù\æ¸-[P¼§¦+¤×—ý=3\\_ˆle½òp£­|\Þk7\Ì\Ñö<=N–RÙ½O\'\Õ/\Zò\å\änæ³½\ë¤Ö´¨\ìš=‡9\Çz\Ã\í\É\ÇJù×¡ú–©A8\í`ŒóV\ÒV¨\â¨öp8§jlu#§MròKo³HùùU\Ë+Wž	\Z9B\ì\\œ\Z\äQ¸\Å[ŽV\Ç\Ê\Ädz\âš—gžI\×löü*{)\åŽ@\É#)5’C\ç5µ¤D^\áA\\óZGs\n\ÚÁžŸ§À\Ó\éR¼¹\Ëò+\Çõ’+©|\Äb½òXŒZP\Ú\Ü\é^zIº”pÆ½ü¶Nò^‡\ã\ÜSMs\ÂIn\ÙHTÈ›‡›ž•ax\ê{W²™ñn\Ì‘ž)\0\Çz—8*6\ã#¶jŒ\Øõ\à\æ¤\ç\'\" ]Ø©òZ¤b\Ã\Å<dRõ¥¦Œš\01N\Ç4bœ8«L†›=ø¤/·<ñQ\É J\çoµ™\0\ÔT­\Zj\í8lLD\ÔcÍ‡¼Ž2sÚ²%\Ö\Õó\Â÷õ\Ë\Ë}+¾\Ð\Ä\ç5+HZógý\Û#\ê°ü=C•{K¶vI¯[­õ«\Û6\Ød^z×Ÿy`\ßÞ›¶Pr3\Å%˜\Ö]e\Ãx9l\æ¾gª[\Þ\Ã8M_S\Ô×­\Ä\Ñ«•>Çš\ét\ßK	pK/@\Õ\ÙC3ƒv¨­\æxø\Þ­¹P—?÷^Œô A©…e[_Ct2„Uý\Þõ\ìBq’M4\Ó>Fµ\n´¦\á8¸\Én™g4•™\Å4\Ì=jù—s%NO¡c¥6«…S\É«>¡l752=\êhGva…­=¡\'\è\Ê;\Òn\Ås\Â{\ÝVco§®ùONx¬-F\ès•½·’!‘‚Ë€ErK3£Z\Íù£Ú£\ÃxÚ´\Ô\ï¿\å“\Ôô\0FjU5\Åi\Þ\"ó_l\ËÁþ1]”D:\äs]´14««Á\íº<¬v[‰À\É*°µökT\Ë©‘“Q<ukDÛ±ÛŽ\ÔQƒžô«L†IIŠ$\Ó\Æ:UpW,*\ÆÝ¤ƒQò´\Ð\ëžsš’\é\é\ëŠqSŽz\Z¯ª\Ù\Ü	À¤¹¹X\á,A\àqYNV6„‡K0ˆe\Ø¯=\Õ|aA£·]\ÄzW5\âMz\â\æ\å\ã†GX–¸\Ðe›§\'Šù\Üfg\'\'\nN\É=d}öO\ÃTù#[¹›WP\í\êo]ø‚ò\ë!\ä\ã=«(]8;ƒ¶}A©¢\Ò/$]\Â&e>ƒ5±e\á\ë×˜+Bv’\Õ\ãN¼¤\ï)6Ï²¥‚§J´\é(®\Évš\ÅÝ¬\Ë(±^~bMz¦ƒ\ã;+Â\Ê3ž¡¯8Ö´7\Ó\åQº{W0AÛšÖŽ6­\'¤®»˜Ü£\r‹^ü9f–’[£\ê\Ø\'ŽBdæ«žp ú\äWŽx7\Ä\êTX\\¾F\Äýúõ\ç\Üô¯n–\"5¡Ì‹\Ä\àj`\êºs^º44Þ‡“P£¯QO\r»>õR˜¡\0˜„RÇ 4È¤I2\Ó\È\Ý^Ø¨’1ÂŒ{\n\ÂR:aÀe4dõv\Òc½d\ÙÐ¤\äšap*r¦«³–?­fÙ¬Q)l\äµYßŒPÒŒf«y›«7#U@riZM§Þ˜N\0\Æ3Ú£šÉ³u\"Bü@9ªv\Â2\åTcš±\ÆE(n‚¢\à,¨\É\ÐfœŠôó\"\â«ý¡Á\àñP\ËEÀ\0S¹rM*H‘\ç±\Ç_\Ï-ŽhÜ§\ëPh‹K(\'=[4&O|\Õ0Ì½°h³Ú¡–˜öb\ÙÏ­#g\0c¥7¥\ç	Ž\ÃN*\Å+dñš…²OZh\ÎDn@õ¨‹\Z”ðj3VŒX\Ôb\ÔooºE(E74\Éyú\Õ;»†Bœ÷«@u÷¨¶n<rj‘,S÷y\êG5Rd.f¯3/q\ÅG&p8ö\ïTŒ\Ù[ª\ài§­M²Q’\0À¨¶\äü\Ë×­Q›#\íP3ôª\ä–ZšF\\\Õw\Ê\ä\ÕXÉ°-Œz\ÕPˆŽO<\Ô\ä’ù\Å$\ÈUNOl\ÐEÈ¤+\Ô\ZˆI\Ô\'\ÍÀ\ÇNj;OPh\í+?^i¼\ç¥*€rsÒ£!\Æ#\Ð\ÐO	©\í\ê\Ýi”\ãpsNÝŒ)™æ”®Ö•†˜\Öe\Îri¸\ïK\ëŠa÷4€8\Å.\ãMÁ¤\Å\"™™ÚžG9ô¦€*\Æ\ÌSÔšnÀ7P85%Fi½½\é\Ìi˜\à\Z\n@\Çu¶\Ð1\Ðõ\íAòý\r&1¡Ž)3¸JwË´H¼úR)dŠR¹\ï\íK\Ç\0RúsI³X¡½¾´„`b”\È\Ç\ãAaRhG\É5)©wÇ¸¦±\È\Ê÷\Å\0B\Ã¦\æž[Ó¥4ô\äj\nC)0S\Å\Æ?\Zv8\äp(\ZG>¼SH¸\Îµ3óAV\íCO\ëø\Óv\àz\Za:œQ×½(S\íA”i\0w¦d\Å)^8¦\ç4‚‚}¨£©\àR°\ÃŠw\"›\íž\ÜQœC)\"2h#&¤$TY\ÍI¢‰\íÒ™Œ\æ¤n)#\Z&½\ß\á4€¤\Ë\èI¯ÛŸÇµ{\ÏÂ„Úœd’jeð³J_Å‡©\êšÁoÝ‘\ïXˆ09­½]†#\È5ˆ§ÖŠ	\Ó_I–<\Î1šnþ1Q\Ðkds9\r\'RzsJ\0\Å”\ÌÀIÚ—\Ü\r4\Ä\Ð\Ò:{\ÓOJ\'»Ú¨–†uÏ¨¤#4â¦““A#N/ñP\Ã\Ò\íóHa3j®®\ÃtJI\äÕ„›½VÖ¡y­³\Ã/9ô\ÅGSKû¥\ëVùB‘Wqš\ÅÒ†\Ø@,I5·‘\Ås\ÕVg]¢\Ïj:q@À\äæŒXX\ëLe:›É ñE†Ø´™É¢Š˜JCÞšL{P+\íhÀ\ÏS\Ï_JB*¬O0\ÏzC\Í;zLp(°s\r#¿5g¿§\'!SsEƒ‘˜õ¤\'ž{ŸZ~\ç8¤aÐŠ,\îÀ8\0ð)ŒH\ïN\Î:SK\ÆqV‘o¹\Î­f_‘º*\Õnq\Ås\Z´·>z\"\ä(nÃµmrV›±#á°¹\Ç\ìñ\ÕX\Ï<sS€…A­‘\Æ\Øî™¥b:r½8#¥/NEZ$L&3\Çó§°=÷úšgÉ»õ<Rq\×Ú‘œšB\Î3Òš2=3œRl\ãÒœI\Ï^‡ŠvÞ\Å5¹,Œ\×½0/ ÷©H©\ç¥ *9#ŽE31¤?\\\nr÷Àö¥Û€\ã\ÍG £ŸÆ€±\î\æ£úó\ÍHFsÀ\ïMn§\æ\í\Å`0\ÎFv†©>ni\n\ä`ž½\Å+ž[ r3Q·\nÀr}\Ç\ãS\í`y#“À¤f\å{w÷ †Š2~nžµf\ç‚Ig	‚9\É\'\êj\0W8\ÅQD„¶9çŽ„\ÒdñžNOZ™T\ä\â¢ \0\Ï98\ÇJL¸ˆN\ÔŽø®¢\ÙÁ…€H\çœ\×0BñŽ	>‚ºø÷%\'šä¯³=\\“F\í»˜s[ñrs‘€;\×Ejy\é^L·>ž\"\êý)\Øœb\Îq\ÅA¡ôò×­0ezŽ*F9\ä~T£Çµ}[>|¥pË´÷¯)’E—\Ä\ÎW\æ*˜5\êm¶2;Ò¼Gcs\â[\Ù~ö\Ö#8\é\\lŽºvz\n&$Qƒ´t\Ítvcžµˆ£\Åt91ò)@&\Ê~ q•9\ï³¼F\×\Î2À¯hñ”\Â=!\Çœ^9|Ä‚:W\Ñe‘ý\Û}\ä|~w+ÖŠ\íPÜƒŒS„\n\ÔS\Ü{æžˆ¸ œr\rzÇ„ qŽ\r<¯¯5\Z\ã8\Î9©Á\àÿ\0‘T¯ù\ÅI³hùp2sQƒŒçž•*ÃŽÆ¤¡ù\è	…;-\É\é\Ï8¨ˆrI^JC`úšL±Ü†R\éQ`\äŒ\Ó\Ã`\íúÔ€\î\Å(9 u\ãšiÀ>¹¥_½@\çµKÀ<\ä\n\àö v\'\0†\êEH9\ãÚ¢œÓƒò3RR&r84 ŽôÀÿ\01§\Ï\\š\n&\áž\Õ\Z‚0{\nqÝŸLPó\Æ(\ÏAQ\ç&¤\Í¸ÿ\0Âœ1M)ÃŠ\Î)¼\Ó\É\Ì\äQpÒ§\0\ã­A’{Š‘x\æ€%S\Üöa@<\çXt©‡\r\ÍK,y\'Óš›8\ëUÔŽßJI\Èæ¥”1Øœ\â¨Ü¸\Úvõ5l·<sÞ²µ„P·\èj[²\ç:•Ð—Q	\Ý3Þ©_9\Þµd\È\æmBWŒ‘]V\Ì\ë¾AÛŒ\×\Éc\ç\ÏVG\ß\äÔ•*lòkû[\Ë\Ë\é@px\ãµVk»\'Sqž\ã‚+\×mot‹[\ã†1\'\\\ZÙ¹¸\Ó/a(Ñ«)W•*w>ÎŽ=ÓŒcË¥	ž\Ín1FT\ÕP\éwI‘€q^\ße¤iˆ\ä„v\Ïj\ÔkK\"Œ~•&nó(+>}·\Ó.g!U	$ö­¤ð¦ªS–Jú×ªG¤\Û%É™\0>•½Ã§HÁÀ\ÅZ¦g<Å·\î¤xõ·„õT9…ˆ\Ï&¬M\áýKJ—&+Œ\îQ\Åz×‰-ô…\î\"‘’\åsSA\â­ü¨IP\ä(\äD<}FµŠh\ËÓ®d¿Ò¶Iª\ÔWŽkv2Y\ÞÈ®¤eˆô„	\È\Ì1…C\×+ñg†>\Ûd\0k\ÒÁ\ÕöUö{³\â³ü\ÅÒ” ½è»¤x&\Ò*D?yH\âŸ5¼¶\Ó4r/\Ì0iœW\Ð\'sóiÁ¦\ÅÁ\'\Ó»:)@À\ï‘@lš»˜\ÉKŒdw¨s‘øÓ·œñLÉ¢n)Ã‘Qiý\êŒ\Ú©ú\ÓX\ì\äÓ³Ú ¶ƒ\Ï4¥;&]*\\óH\Æ\Ôn‚†Pzñõ®ZD–vô>µ¡r’O&X\àUû[Qø$ô¯½W6}\Þ[†š\Ó\Þ{˜?dòO\\“šcEv‘\Ù%Áþ÷¥u\Z_„\Ú\ìÿ\0Ç³\\Žµ\É)¨ž\å,<\ç±\ä˜òW¿§ZŒ\ÆHô•¿\Ã\åa‡@ªEY4¸@\r	j\Å×‰Ô°5;£\åyv³eEVgd#\ÛÒ¾–\Ôü¤º3rŽ ó^+\â/M¤\È^6/l\ÕB´f\ìaW:K]Q™¥_\í”<×£\ÚÍ½9lû×BJ>\ìr\ruj·[\ìóòžjõ°˜¿`šw±òù¾Qõ\ç	B\ÊKC²½\ÕaµBI«Œ¼ñÌˆNÀ\rUh\î®\ÉfrsÚ¥þÀ¾e\r\Zn\Ï\\R\Äcª\ÔvO•—ðþ\r\çV}\Ú\Ñ\Þ\ÝNIyŸ\\ÐŽO\\‚+sþ­MAcñ\ê85]ô»…^P\äu\â¸ù\ï­\ÏqQQVQ²ô±¥\ÜÖ’¤ð\ÈÑº0!‡b+\×ô¿ŠpN‘Á­[£\ÂF\Ç\Ìa\Ó\â\ï \ÍC\È\"Ÿ3%Ò‹\è{n«\à»=m\Íÿ\0…nl¥F\\½ªI†@kLk\ËM\í¼°J£!\\coZóg\Ã#209¤©×Š\è-uýE\ç·WÎˆp¥\Ûq×„\Ä:c+\é}O+4\Ë\Ö3	:ikk\Ç\Õ¢9©2j¤2\ïEa\ÎFEX\r_]	)$ûŸ“Ö¦\á7¬Ó³9\ëR€85#\àÀ\Z»\Ø\ç±!€d`S†[¥7yn;TÀª¯^´\îti»9½0?¥XŽnqô¤\ÙijV`-Áf$W\ã‰a[»(aF/•Is\Ê\Z\è|At °”–\ÆF+\Âdw7,{—\Íx9¦*tÚ§k«³\í¸c*£ŠS­Z<\Ê2J(Ý²\Ò/5Kƒ“ž9\Í{G‡>Ù¢«\Ý#HXg\Ã\Ý$c™\Ôy\ï6VÁW\ËVªÞ‰Ÿ¬`°pŒ¤®\Îj\×\ÂZe²€Ž©©gÐ Û“ô\Ý-¸ rh{n+™¶z~\Î+d*\Õ<#c}l\É,y$W„x—ÀO§«½®ã·œW\×1*Œ\×­\Ú,±6\åþ”£QÅœ¸Œ<\'\rµ>-_:7\ÖV\ãð¯oÐ¯žûOIwœ°Ç®+\Íü_¥\r+S\'\ÈK%[ðeÒ›¡n\îÜÈ¾\â½L%w\n‰_I\'š\à\Õj\r\ÛÞ§©\í\Ö\Þh@\ïqWÏµR…Ç–\0\ç\ÜT ’r+\Ø\ç¹ò–e \Ø\Å až½ù¨C\Í1œT6mX,:Tl\ëŒ{õªÅ·LTNYø\Ï³l\Þ(–C\ÏZ…‚x\ëQœ\Ömš¨;`\àö5Y.‘œ¨\ê:\Õ\âŠ~˜ª\ÏlƒŠ\ÊR6P$\Î\ãš*UN)p¤Vw4±\r@û½jþ.3U=)\\J úœ\n\\\ÄœÒ”¬{ûÏ²ñ\ß¤M\Ú6\â—<\ÖuŒ\â\â1 «E\ÆãŠ–Ze \å€ú\ÔÂ³\Ñù\ëOk…R9\ëR\Í/h\'r—Áö©ð:Ð€LƒU\ß\í“V1Þ˜Fyª3e~wv¨\ÎEY#“Š„ŠhÍ‘óFGžzTg\0\â™KÇ½7y^Ô§b˜@^y\ëTŒ\Ù|òiªr3O%Xb›´(<÷«3lq—øEBX\àú\Ò\ny<\Z„“Ï¦j’3la\0\æ«?\rR\ÉÓ­C‚LÉ‹œT2?˜)Xƒ\ÇÖ£\Å±›BÂ«sƒ\íV$u\\{b†ð8\ã&˜¬Èƒ\à·‘K$Û²1MŽi¤Þ‘DE†O4€´SXƒ\Æ(sK’\Ë\ë\éM>ôo\Çj&3IŽ”\î´sŽ£4\r\r%@\Î(.sÀÀ\î)Á¤\é\Ç%!\'8¤ š7S*Yhx9\íMq@£8=rjHF\0Žô\Ã÷)X^>´\ÂN9\ëHvsIŽx¤æžŒFpzÔ€\Üg·jQžj\0æžŒjYq$´¼’{\Ó}ûv¡½@¤n…pHÀ¨\ÙG~jA—9À\ëÒ‚\ì@\ÃJŒúÂ¬>9ô\ÅU<\ÐƒM~\ï~žÞ´‡§¯­&\Æ3$“ƒßš@={ÑŽFx¤9=\èEzcÖ¢\çšqy¦ò¢˜\Òli\à\âŽ1H~^¦˜ÏƒƒSr\Õ92\\`{RnÀÁ¨^P­÷»Q¸óù\Z\\\È~\ÊBšŒ±Ö‡l\Ó2(º+\\\äÓ‹c\è*>”£&\Éq$8\ÏJ:\Å.p%‡®i¥ªN8¥!¡(“I\×g¦GJ’\Éc}»±œ×»ü+ƒ\É{Œ>ü\ãšðnù¯vøMÕ¸ny?‘©—\Â\Í(ÿ\0>§§\ê\êw¡=1Y+È­`ÿ\0«Æ±\ÇJtþlG\Æ:“4sŠ8\Û[\Ìo\"”sG\"Œ\Z	šT\çžÂœ1Ö“\"€cI\é\Ð\Òô¥\'Žh\Ç#t\Å3¯­?4ÓŒñN\à0\Ð{fŸM\Í #^%÷5[Y\Ül\Î\ÌÕµ8“\Óåªš\Ò±p8È¤¾$7ð3Ã²¼‰\É\êq]˜À¯9\Ñ\î\Ò\Í\ØJ\à+r¼ö­MK\Æz˜™š\åX\à‰ó1\"¢º÷™¶WŠGf]*™ŽMx^¯ñX\Ê\Z;]3\ÒF\íøW/\Ä-R7v“g×Š\æ;”e\ØúpJ¸\íŠ]ùk\ç~(j‹8/\n±Ó¸®†/Š– \íxœ\ãø©4²G¶\ç&œ~5\Ã\é¾1\Óõ\0›&]\ÍÚº¸.VdA\éE‰¹)¨û©I—$\Â54ó‘J\Ç)¹\'5V\'˜oOaI\Í.\ïSHH\ÏZd¶0÷\â›\ïN<óQ†æ…\Ìš	\è-øT`’:\Ó\å\'˜^?)7pr)¸\É=M&á´œûš¥\\\ÅlžÂ¹]Bé£»TÁn\Ù=³]Ë·¯¡®V”\Øö0Àu\èMtS‹9+OCqòz\ç\'Šœ€}\rB°_z˜}Þ¢¨\Èz\äzñR“ÓŽµlN{Tý³\éÞš8 f£Ù…\Î{g0\ãÞš\Ê;ö¦\'õ¥ƒ\è:‚iø\Å\0\çši’\0c¯s\ÍŸ¨qœÏ½)\È#œc­–@G¿\ãŠp\0)\èI\Çjq ô\èirFsMˆ‹ :ô\ã\Æ@\äö¡W#®1N\Ûò±\ä\â¤Œñ\È÷5RH\Ûõ©›xãž”™\É\0S¸¬G\Æq\Ç…°¼\Ôõ¥$u÷\ÍGƒü#<\ÐHŒy\Îzcr\Æ{š‘·€y\ZiRAŽ´\Ñ¦\\\'·J\å$¹=I\ã\éÞ¥“ªö\à\ÔMÐ’8\"©±¥Ÿq]¸P3ø\Ò\ã\ÜS•wpqn\r\rœðq\É\É\ïJEÄ‰\Ã¼9\Ïz×°“0‘\ÓnMdM&@\ÜxØ­\r5”1÷9\'·#¶+š®Ç£…vš:(ZRü]»m\Æz‘\\\í¸9\0r+iVBF8æ¼‰\î}E\'x£]q\È9:ò0?\Z©r*\î~Zƒc\Þ\ÇsMb@\ã\'8§·\Å}[>z;˜\×ò†V8#s^_\á$2\Ý\Þ:±\Üd?¯C\×dh¬nOD=¹®Á\åb‰\åf\0\ÈÇ¨ô5\çb¼Ž\ê\Ýg¡@ÁŸúWGh¸^x\"¹\ëEKqŒ\×Iü§ª\Ñ3ŠñÜ¬–(v¯+‹‘“\í\ÅzŽ\äbñ\'>µÀ!*¿†s_K€V¡6\Ùñ´¯‹’\ì’,.Gy§n/\éL\Ï\Ì\0ùi:ýk\ÑG–\Ç–\é×­Mó~µ\ZòO¶\rJ½*\î$‡\'8©F\íþÀóŠˆ’0\0\ã¾j\Ì{”qÞ¡–+‡ž\r&S7g*J³%F<Œfœ	$R˜\ëÒ”g­\08”\ÏZnñŒzS¸\äþt®4NOŽ”\ÒsT^\áGª\Ò\êF\Þ3‚1J\à–¦\Òm=¹©Q°Er)\â;E“cºƒëžµ¥g¬Y\Ý\ÊV	\ãcý\Ý\Ù?Njy£\Ü\ÕEö:œT¡½*ª\Ì6{T\ÊÃ°¢\ã±8m\Ë\ÇÓš_Æ£\Üô§\è)’>ÔŸ7|\ÓI÷	’æ¿ðªr\Ê	=\0®KWñE¶™´­Ž:\n†\ÒWa·c¼yWƒœ\Ó·v\Æk\çÛŸ‹[I[3¯«V†—ñnul\àw Š\Ç\ë4ontu}Okû6{¨\'5b5^õ\å¶\ß49¥\n&\'‚x®\Ò\×[°¹lE:>@\èÀõªU!-¤ˆtjGx´uJ‹€Tv¤\Ç…GŠP\ç4e·g4s ±*œóOß‘ŠŽiwõ ,5œ\ç¯z\ã<Ex°ÀÊ¯‚F+«¸“*kÏµ%}F\åcQÂœ“\\ØšÑ¥M»xL4«ÖŠK©¤i¦IL¬I\É\ÎMt÷‘¬V\Ä`gr\Ú\Ù-\ãÓ½c\ë\ÑCR\Üw\æ¾J£s“g\èt!\ZPŠ\ì4m\Zk\íLÉ°õ\Íw0\é†\Õ¼¦8\ÓôgMT,v\äu\"®_x«J‚7\"Œúb±\åggµ·Dt)€@_Pj³\ÝF¯Äª¹¯\"\×üK}«N\Ñ\Ø3G¨\î+Ÿ¶ð¾³}(‘¥›\Ì\çù,®Ù‡·m\Ú*\ç\ÒVWq»`<lx\èEtÄŒ¸\ã5óu¿„5X|w²©\ãy®®\Ë\Ä>$\Ñc1^[µ\Ü@p\ê~`M\ÍTû¦Žÿ\0\Åvht\Ù}BŸ~q_>Yø•´\Ë\Ãö\ãj¿\Þ\î=\ëª\Õþ(Y<f3opO!ÔŒWŽjú´z¤¾j\Ç\åc?-\\#wª3©‰QVŒ­¼/\âK{˜‘ƒ‚„uô5\è¢\ÜÅŒ\ç=\r|I\áoË¥Ü¨v\Ìy¾´ðÖµý²l‚3Wg>x\ÕW<\ïÆž1\È\×1&¾+\ÍA+\Æ+\ê­GOK\ØX79+Á<Má©´¹Ì±©ò\É$\àt¯S‰M*rzôg\Çg™d¡\'ˆ¥\Åük·™Æ€MO”±V­&H\ëß¥zªGÉ¸6\0O5 C\Ð\ÕW¾·…79´­|C\á…O\ß\É+7u	Ž{sR\ëAnÑ½<z«Ýƒk½ˆÀ¤8\É«Rx\ËÃ¶eV-1\çË¶*´ž1ð\ÍÒ²I£¼Ž$‰ú~?Y¥üÆ¯&\ÅZ\êf}\ê…\ì…S­D\ÚÎž_³\àÿ\0xb™t\Ñ\Ü\ÂJ0\'k*•¡(»I†ÀW§Zô\ÚW2H-Œ`Ö½•¤·j9\'\æ5c\Z¹\Æy\Î+¾ðÕ°Šfv9\ÇSŽõ\äVŸ*v>ûITqOc½ð×†m¡XÌƒq¯^\Ót\È6a@Q\í\\v“whBü\ãv\0Ç¥z&š¨Tp\ÕÀ¤\Ûwg½\É+EX\ØF«\ÐU‹D\çŒWBw¬\Ë\Ä(Å±‘M’™\ÃjP*Ž¥x×Š\í\"xœcøOJö\íQ¾R\ë^3\â¾c“Š\Î\çFu\ÒpgÎ—(‚F\ëÖ¬\Ú&\ã°\×®pþ#š\é´M/\íù†kÔ½‘\â¨9»X}†$\Ò.\Ý\Ù5\êš&—*D	Vž‡ „	S÷k\Ñlt±Â¬S\\5k¹;#\Ù\Ã\à\Ô#w¹\Í\Û\Ù!f…H=±T¯4»4nyö\é^«Œ0>QU.ôD9%y\Åa\Ï$o*Pg…k~\Ó\æ\Ý#\Ï<qÇ¥y•\ç‡\ÂAÁ5ôõþ–‚\Âò+\Êï´‹ˆ®Üƒý+¦w³g\r|,wHðû›˜Î¦©\ÃrMvZ\Â\Ë\Í¤ûW\Ì<\Ây®ø½*Q\Ý¯¡Ý‹‹\ÏuMn\Íq~L›¹\ÎEvhA¯®ÀOŸ\r½•\Éóú\Ç1­ed\åuó$4\Îhlq\ïF+¶\ç…be`jBT:UP{S\Ç\î$‰ó\ØS\Ã\Õb\àT‘•l\äý*[4Š9_±m:oa\Åy\Zs0ã©¯\\ñ-\'\Õ\æ\ZdF\ãP†0>ó\nù\\\ÝÚº\Ý?N\á|—ý=’>ŸðR¬ \ï”½nÕ²«^S\á¸\åUŽ$t\n\ï>Ë©ª\îŽ\éT{Šù\É=O\Ó)®X¤wŒ¨©Šk°¼\Ô m—+ã¸­\ç¾\Ê*.mf\Ê\Z¤©|\Æ\0\n\â/¯­¤R7†\âû;tš\æ\ì³F€–“\í\\\æŸ\âø·†@8\Éhø\ç¥M\Ì\å\ØòŸˆ:x¹´i\Ôóf¼\Ã\Ãò<Zµ¹Kb¾ŒñFŸðHQr¬>ls^-\á]\åñ:Àñ\åQ›öô­\èÔ³^Lñqt\çŠ[¦z\ì2¯#¨«›ø\r\ëšd¶þK”\ãŠnX}E}g\Í\Ï\Ï\ê\Òt\ç(¾Œ°9\Â\Øô¨w6Ò˜d\Í‰€qQd\Ós¸óN5\r›E	’{\Ò\Ó©\Ç4\Õ\ç“Y9\Æ$ƒßŽ*<\à\æ¤qŠŠ²l\Þ\Ö_9¤\ÍG€	4½:T°$\Ü1Ò•ŽD9\'4­Ò„…†Oµd\\[A#‰$©«“>ÀI®;Vñ\n\é\à©\\œp;\Óm%vLc*’I+³ ›P²\Óm\ËH\â4\Ï¸‹ÿ\0@¤‹h\Ùý\Ï\0\×ª\ê\×:¤Û¥\'hû«Ú²+’u_CØ¡‚Šs\Õö;gñµ\Û\äù#?Z\Å÷\'c\Ø\×1\Å>³ö“\ît¬\ä=§IñVy±\ì“£ñÏµv©2°\ëž+\æ€À\âº=/\Å\Z–œQ4\Ñ)ûŒ\Ü\ã\ØÖ‘­\Üæ­\Ó\Ü&{úºš+G\Õ\íuh\Ð1+Ñ—ºŸC[—\0\×Ll\Ï&IÅ´Õš\â™ßž•\'\\qM>õFL€Œ\Zn©HšGLPC!`3Q	\äô«[Ga\Îj=‡\'\éTŒ\Ù]À\\\à\Ó*jb¥rOJŒ®\ÍY“*\Î6óšCÀ5.\å\ä€*œ\×€ü\à}MU\É\ålŽA\ÆqP@\'?Z†[žÓk:\ê\é—\ÛÐž{QÌ‘>\ÎOdh«)\ç=i7`\à\Z¦\Ó\ÛðD\é\×uJŽ\\ezg­\nI’\é\Én‹‘‘\ß9¨Žó\Ï\ËH\Ê\Å~÷Ö€ñšw\'•Š˜Ý“PÉŒð)	+‘šB†s@ˆ[\'“2´\Ó\Í\"Á¥\0\àÓ½i½¨\ÞùSE8óJ1þûSN2jSœuzT²\ÐÊ\ÔT‡µD\Ù¨f‰\\\\\ãð“¡\ÈöÒ…LŸÂ¹Y\ï§21\r­Ž:V¨¢z|«-Çœd\ÓA«)@eL‘ú\Ò>®\Ù\æ.þ½j=¬M^__¢7\Î6õ¡kŸ:\Ç\Ì3+^\Ú\å\'Œ@\'·¥5R,Ê¦­5yDº?‘¤\éL\æšO¡£5M˜¨Ø•}©Ó¯z„q\È\âžðjY¢>QßŽ\Ô\\\nG#Œg ª\äœã¸¥cD:l1UŽGJŸ’*\"A4DD•ÿ\0\Zp\'Z\ÞÝ©;õ i$þ\ÌÒ”š¤	œž”›5„™!õ¨\Ë/OjÇ“Qv%c\ê“\\\Í)99¬\ÜÎ¸a\ä\Í\ËðŠBý\ï_JÈ’\æF\Æ[ð\ÖÌƒ×š“\ì7xBß•f\æv\ÓÃ¤¶#37­yG;YM6\íñû¦\äúS\Z\Æ`>\ã{ñS\Ï\æ[¢¿”öQÄŸSW¡ºI0;ñY^[\çAúS:ƒV™„è££n•*r}\ë\Ö\ä«mn†µÐž=+T\Î9Á¢C\éšP3N2x§\×¨Á\èG\ßR“I½\éxüNi0CNH÷ô¤\ëÒœ@\ÇÖ„\äôõ¤P^\Õ\ï_	\Üy \Ç\Êþ¾\Õ\àüŒú\â½\ç\á2þ\æ\á¸$š™l\Íi\'¨\ê\Ç%>•‹[\Z\Ã|\Éô5\Å:	µ}f-%/ÑŒÖ¨\æciz\Z\0 õ¦H„\ÔRóIŽ\Ô\0„bŽ”¤{\Ò÷ óH@Ç½;ÜŒP\"¦Ž‡wcRw\â\çšb-\æ\Õ-q\Ýlƒ„\n2Ïž•4\Ò.ÀI5\à¾3ñ5\Íô\æ˜ˆ—ªŽæ³”¹\Í\é\ÒunŒ­wÄ’\Ì|¨+\Ýýkvgb\ÎwS\Í!~§A¦Ž\Ü\Öœ¦\î\ÏF•R¢„|Ó­0Où‰\ã­.Òµ&\Ö‚^qAÝŒ\ç­;§Ö˜G9\é@X–™m^\'*Ã¡»ý\Æ\×Ö²r\í*Ž‡€kÎœ‚1Mne:|\Ç\Ó\Ö~\'»ž5d¶bpA\Ö\ÄZ\Í\î6N\0\í\í\ë^\á\ß\ÞY·DV\0qô¯R³ñ«*‚-³×ŒWDTZ\Øò\æ§NM6uO«]!Á¶n	\ã\ÓY¸#‹Y>•ƒq\â\r]\È\àý\Þ2j(µ\ÝL.M‘\Ì\ÕYv\'™÷:_\í[ \0û4„u\'gÒ\ê³`“\å{m¬C¯jˆ\0ûr§úS_\Ä:Ž3Œu\nE«°\îû›\r¬\È›y9\È\àT\'Z`}žn:üµœ<Gx\äm³sÝ†*#¯\Ýµe€cYw\Ü\Ò\Z\ë\àþ\æB3\ÝqNþ\Þ\Î†M¦²¿s¼(²\Ï@1Bø‚ER²Yq’B\ÕYv\ßsB\ãZ¸p\r¼\ï¸UF»\Ö%„8PcŒsô’k\äœWx‰{B\à\Zµn\ÄJýÌ©\ÛVF*þo®1T±v]\\\Æ\Ç\'©¶GŠ\"$†‚CAO_\Û8;¢—’ªS·Db\é\ßv\Í0®È‚AŒcƒ\ÎqÚ­©`Ž½\ë#ûf\Ö\îDr^˜\Åj)\Þ1ŒqÖ¤v±8 Œƒþ4\å\Î\í\ßx©1\Å\07oÒƒœ§\æœy\"œqŽ;rj€‰”þ4\Üax.\Î=7¦\Üúÿ\0*a;u u\é\Îi\ä94›[8ö\ãð C0/Z^\Î\r\'\'##4‡’j€$ö”lu§a{žqHx?–*@c=³ÚšJóœbž*\'\0x –9ŽSƒ‘Ò«‘ƒ\ÇZ›n\Î9<\Zb€½2\Ò§ Œ@\ã¶(\'ª0HéŒŠ£6Vl\ï\'ø=©„!\Æ}1J\è\å°zKT{\à’H\çÓš¤f\Çòðrzži@aÔŒžÞ”\ÝÇ¯O\ÐRº©\Ý\×w¿Z™p9 w\ãµ]Ó‰Ë¨±Ç©ªŒCr8=:\Ô\Ö/‰ö§C‚\rs\ÕøYÝ‡\Òh\é`l6+~\ÝÏ¨®v\'Ac[\Ð`\à/`b¼Š«\Þ>£\ïlFÀýj\Ð\è2~†¨F\ì>•uNO§ô¬Î“\è:\Ò0\Å;Ÿ¥2B1øs_V\Ùó\Ñ\Ü\ã<S9‹L¹<c®7Gƒ}œ÷a¹,8É®Æ¥Nšc \äVm’,vÈŸ\ÝQÒ¼º\îõJ‚÷\ÇN\\*/¥u1%súz‚‰ô\ë]*!	\Ø\Ö\Ô\Ö\Ç=^§ø\âQö\Ø\ÔrUz}kŒm\à\×I\â\É|\íbN#‚+\0/\êk\ê0Š\Ô!\è|.=óbª?\ï¸ôÿ\0\ÕÚšÜš“c*\ãß½!\\g&º\Ó8l	\Æ*tRI\ÜzŠUA°þ„Ò¨\Ã\ç¨=ý1N\å$Lx¯¥L±¨Ï½5s´’9¥RÀŒ\Ô\Ü\ÑDrŒ\àú\Z\àF*y1<w§ð;ýh$‚jor\Ül.~\â‚ž*•\Ä\áŒ\Í36‡M&\Å9Gj\â5¯Zi\ÈK¹\ãÓŒ\æ³üWâ…±ƒj8-_=jš­Î£3´²3À5\ç\âñ±¡\î\ÇYø,ñ/™\é\ço«|I¿•\Ø[m\È\×u\âmn\é÷=Ô€ò­`7Ó“^%L]jY³\é(\à0ô’´«.6¡z\äo¸•»ŒµX´Ô¯\íX\î¥B95fÏµ<dXûY3:}Œ?•¥¤|N×¬]DÒ‰\ã\Ç!ù\Ízö…ñF\Ô¬’yÞ½+\å†\á´\è\'t}\ÊH\æ»(\ãkSk[®\Ìâ­—a\ê«òò¾\èû\Â\Þt¹Œ:2ºžCjÒŸ\Çóß€<e\ä8´¹²60Ol×¾\Ä\âD1\È\È\"½º5\ãZ<\Èù\ìN\Zxy¸¿“,—8\ÅSž\ácŒ±?J\äÂ’9ö¯<ñN²tød!ðH8\Ílä’»g+n\Ã5\ï¥ŒM¹Ál7S_9øƒ_—V¹9$®zgŠ¡¬k7z¥\Ão‘ö\ák \'ýk\Ã\ÅcW\Ë\"}.T­9\ë/È˜6A==\éŸ\×>•n\Ö\Ñ\æ_”\n\×:4Ž€\ç½yî­·g·=\Ö\Ç4$a\ëZ\Ö:Æ¡a ’	z5[}\å¹À\È=*\Ò.cÚš«g£‡\Ò\Í\Ý\àÿ\0Š\Ò![}LoBxq\ÔW¼Zj0^Â’À\á\ÑÀ*Â¾\\B\à„lô¯OðOŒ®t«‘ŽZ\'nc>Þž•ß‡\Æ8´¦î»ž^/.RNTÕŸc\ë M#¸\0\î\éTl/b¾¶Šxœqž*½ý\êF)ù›Š\ïxF\×[M,5I\ÔPKRË¢\í\ä\ÆI\'¸ªð\Û$9c÷ñ2’òr[©õª:Æ«•³38W\Ï\â1¯3\ëp˜ZxZi½ú³?[\×!\Óc\'p¯ñŠð§nzUmVŸQÀc·\'‘\ÐV\Zh\×w˜UVrÞ‚´¥„\Ò\ïVc[\Ûii½Õ®ü\Æ\ÜHœžU±š‚\Ý\Þ\ê@¯+;üdŸ\çS\ëºtšm×”ýz\â¯\è6¢[„v\è¬kG‘³§/h“\îzÇ„´eI%\é^¿o¦Äª6Œ\n\ä´­\Äj•X•è–°yˆ\n+Ì“mž\å8FV(ÿ\0gF5ŸscJ\×PöÏ‚zñX²ùj†SG’x·Â–ºŠ3*l•À\î+\Â\ïô\Ùô\éš)”ezz\ZúŽþöÙRÀšóH¶\Ôb.¸,3Ž+jS\è\Î*ôú­\Ï\\†\Î;×·|>ñ3\ÛK3¸ÁMy\r\í¯Ù¥*xe$éŠ›Lº{YÑƒt\"ºšR9£7}óct—©\ržªz¾™\rôG\"¼ûÀ:ú\ß\Ú\"–”\í5\ê(1š\ÇTÎ¦£R\Z«¦˜<G¢¾‘9eÉŒœj\à/5!\Z•“Ò½k\âN t2H\æ¼#\ì\ï$‡\'<\×tq54›\ÔùÇ•a•y5/±Z[™\äl»žµ€+v\r\æ\ç\âº+O\\ó\îa*\É=Y\ëRÂ¾_v:\ÏÁ9\çŠi%N\ÜWª?„7`\0qŽk:\ç\Â!¾b3K\Ú\Åõ4–\Zk\ìžr%lr*H®\åLfñ]$þx‰ŠÊ›L’&\'õÁ­TŽg\Õ\Z\Ú,\í< f½›D°F„‡Þ¼*Á\Þ\Öa\'\\žE}\á[È¯mS‘À¬+\ÞÇ£€QM£]/4‹,,ñ:‚p\\õ\Ø\é—1Å¶KWp‡¦x©\íô»ˆ‡›\n8>¢¬ý–¤kµW ®6\ÏQ¦uP\ê$\Ûo#+›\Ôu©H\Ü¤3•„\Æ+=ô\Èo•ƒõ¤¤\Éq\ìsw­q8m—Hx\éÖ¼\Ó^i\Ð:O·…8q^‹ÿ\0pÓ‹¼s»ƒ¹þ{W\r\âhP9l’£¯±§s£\n\×ölð›¸\í9^2q^‰\àø\í\Ã\0~b0}+•¶X%º+ É¯KÒ´ø­§ˆÆ˜\æº\ê\ÏÜ±É„§y¦z\æŸ²®Z\îô\ËnŒW¥]Z\ÛD¦Tu\ã5\èZeÍ›€ñ8\"¸’»=—±\Ð\Ãd…A\Ç\'¥6}>=‡\"­\Å:\ì¦Mu!Ø­t0\Ö\çœj\Ö]±÷I®QS\ä##±¯S\Ôf·9*T×k KóF\Ãr\Ö\rYƒWG‚x»NŠi˜®U±œšòi£Ãœ×¹x\Ò&X<\Â0\Ê5\â\ç>µ\éÐ—54xX˜rÕ‘\ÕxjMŒ}+»„‚¼W\èn\Ë\Ð+\Ðm~\í}VY\'\ìl~g\ÅKŸx—È©JñžØ¦†E¡Ž{×«s\ä\ì6›‘š@Àš~\è(lj$]Á\Í)CÀ\ãöFP=:Ó·£#\èj9™¬bY\ÓtˆõR\Ð\Ê8\ÇJó{oO¦ø±£\ØR$œ\ì\ÏF\ÝÃ­¶‘8˜tn®Ÿ\\û6¢lob\ÚH˜ÿ\0x\Zù<\é\Î5\×g\Ôø64gƒ’JÓOx\è45eV9\ç<Su}\\\Õ\émÊ¿*>\ëƒ\ëVtAò\ä•\Þ 8¯Ÿr?FŒ‰\ËCe%œ(˜\ì@	\'%©­¨¥\ÝhA¤½>Rnj\ÍGw–³l\ÙF\Ä\ri\Ç¨<cž\âª\ÛxoJ³G[¬a‰$-Y[¤YvKÇ£VÀª\ä6A<\Ì4õ8b\ÉV\"\0ù6\ã\Ìhv°Ào\'Ú¡•wg¹\Åw:\Ë(¹Çµy~§ª¦‘¤\\\ÜóË•Grxª…\ÛH\à\ÄòÁ9>ˆ¾/b¾|m•lâ—¿½s\ÚR[i6\Ë)%ñ¸ŸRkm¤}5\'jqô?3\Äû\Õ\æ÷÷˜ð\åI¨ó\Ï\Â\Ù\Ï4\Õa’*\îb‘58\n€14¥\ë6\Í\âM¸~4ŒT[³N\Ü1XÉC\Ë$\ÓiŠO\"Ph\Å\ëI\Ó<w¤¥\'ÚšD6\r\Í+™\Æ,	yX|\â­D\ÍÌ¥¨K¬\Ê\ç\nˆIü+Àµ;÷\Ôo$œž\î@+\Óüsz`Ó¼¥<\ÌÀ~¼ˆ\r£5\Ë]\ë\Êz\Ù}%\Ë\í-«Øˆñ\ÍE\ËU‚´\Â=+™ž²\á\Ïjx\ÅH##¯Ö‘h‡G4\Òj\\g\Þ¤\rž\ÕNªA1r rq\Ûi\îGµ}†9a”€TŽ„\â¾a\ã\íY$Ñ¢s<Ž:lc»Oj\é¡\'~S\É\Ìh¥Qo³;b}*	\Ð\ì\â\0Ï­OŽA5¼S\íó6\ÖÜ¹\ìGz\ê<VÇ‘€)ƒ#ŒŠ\Þ\Å&1A\r\Ù\ÇÖšW‘\Ç\ãRÞ‚y\ÅZD2\'<VV Óˆ\\D¡ˆV¤´zcš\á5M]˜y‚SC\å:\Éô§&¢‡JœªI$a¾£©\ÛDdy“¹N†¹û½Vi¥Ý¹\È>¦Ÿy+O>Pž\0<\×C¤øt\ÝGº\â3\ÏNkÌ¯ˆ\å[»QƒË•F­\Ìs1\\^Ì²,r?8Z§ök©Ÿø\Ø×³\Úh6Ñ U\0\Ç<sWWF…\Î}+\ãOn:ò_#ÃŸN\ÔŸ.J‚;\Ë\ëg\ÊM\"cŒf½ñ´\Í\Ê+Œ\×|3>b F\îÀQnªú\\ª\ÑÛ›É£ˆ:½õ\ÄaL¬·©aª^«ªJ\Û\Ã`\Ö\å¬ös\Ø:Qòn•\èB»\ÑÝž&\'I\ÂQ\äŠùXôAœdÓ€µ‰c~8†C\Î>Võ­D 1¯Jœ\Ô\ãt|Ž#:3q’­KÓ‘G&¤!@\ÎkC˜ƒ™\ÅL\Çw¡¨Šó@\ìT`òiO\\SFI 7Ja\äsOÈ¨òONµ¨a\à{÷ªs\Î#œ1V\ä\å@\ÍsZ›Àõ5…Yò£¿	C\Ú\Í#>{©\æf$\í°ª„u©ˆ\Ï9\ÍC›5\ç¹6õ>¢”#’V21A\'M?\ÅFrò76¶:ZrI$L\n\rF)?Æ¨‰AI– f\Â\È@z\ÙYž® F$WWl\æHÑ‡BkxM³\È\Åa”]\Ò4ñ¼\ÜÓ‘y\Æ£Sòô§£O~kcƒ–Ì›‚0OCP:•?c¶{\Ó7ô˜\ìC» É¨XŒqÖ¥\ã$\ÔDò3R7TL}Ï½I\Üýj6\\w\ÆA\ëÞ“4Š\"f\î*Ã½‘Ø—?Îµ¥¬[‰<\Ö\Î+93»£0S\ÇF»ß“À\ê})¼N2®YD\Ï,{FAzÅ³Ó„N‹L\ÑI•†ðzW}k¢\Î\Ä£\èElia‹€Mv\Ûp\0«È«^R‘ô˜l4!yÿ\0ö,­–t½)$Ò›k?“úu¯M\\œŠŽkL+5RH\éö<cP\Òbt\Üa\éÔŽµçºµª[>x=+\è{\Ë8\Â}ø\Åxÿ\0ŠlcF,u\á«7.V\Ï+0\ÂÁCš)|A\\VÍ´…\Ð\r\Üb²sV¬\ßi+^¤Yóu`n%~”¡º\ÔÚ¤\è=9­“8$‰2	Žô¨‰\ìiñœƒŠšM!\Î3Sd5C‘ƒH´8uÁ\ï¿	\ÔI\\¶Mx^ûð¤ÿ\0£H=\ê¥/\â£\Ó5ŽL}¾SYEk\ê¸.™þ\ïÚªŸ\Âk_\ãŒP\r(Áœ\n\Õ0=(\Å(=\è¢\ât¥\Å!\ëE\Åa(4´”\Ä\'zLS¨ v#>¸¨\Üüµ)Q\×5®:\Z\Ç/\â;‘k§O&H8 _2_\Ë\æ\\¹\Î~c_@x\êMºv=NM|\í.w·\ÍüU…S\Ð\ÂG\Ýd9\àzšLri\Í\×\éRG÷Qœd\ÖhØ•™€\çmYh··\"b	\ÆH\Åv\Þ\Ð\àò\ÖC‚\Ì5\è6–1\'\Ý\Â\ã\ÐWLM›QGe,\'2NLòx<s \ËÊˆ*\áðLJ7_½”i\à€\ÅI\"£k5^\Ø\â°xŠÎ¸\á)v>¼ð½\ÔRaT‘\ê+Ÿ–\Îkw\Úñž\Ü\×Ñ—6( ù®7V\Òbec€{zºx—}L\ê\à\ãf\â\Ï&´žK+…‘[¥k\è\Ï_\Û$aŽ{\Zùúþ\Ì[NSv~oÊ½\Ï\Â1\ì¢»W©F\\\Èù\Ütyd»ú€@lt\Çj\n°cò\äTñ®\å\æ¤~\çÛ§©­\Î$Š\Ø8Á›ÂŽ‚¤8\ÏÒ™´q\Óò \Û\è)¬ª\ÙÊŒú‘R:ðGj\nôÀÇµ2H\Ñb^¥\Ù\á~ojB£Ÿj\0\ãœ\â¨:E»¡ò\" Eüªby\ÏLR\ã*¦„\Èüf4\Ï8\â¡k[FQ³\Ûl\ä–\ÏAŽ©®3À\ë\Ø\ã¥1^\Ê\ß*VGP¸\â¤ŒŠ{)#»G@H\ç­&\Ã\0\\v\éJqƒN*R¤\Âñ\ë\Ó4\Ç°=(¸†|»‰\é•\íÖ\È$ö¥†\Ç\'\éK\È÷Ú˜¬Fs·¯·Jv9ÁjFŸzV\äŠw`÷=Za\ëN]À\ã\ëšp9\äsE\Ä@O8\Ï¡K`Ö—9#¹$g\r2lFI\Æö¡²GZ\nû\çÚ‚^O¡ ¿¯zfÓ»\ÎqK‡\È\íœR`\ã²q“@†•\n\Ýz\Ó\r;‚9\ïM\Î?A-3¸óŸz*öý\Õƒ\Ð\æ­4Tm\ï\Âñž1\Üú\Ów<1Ï§¡©ÀR@\È\Çzh\ç\ï1\ì>¢©´BFp\0\Î*RK\ãóôâ—‘\Îþ\áŠ@\í€\'9\ÏlŠ™6®\ìqßŠž\Í\Ö;•<€x¤eòH\Î3\×4\ÈT¥Âž~ð\Åa=™\ÛGI#¥³ß¹­\ËnqógúV$“[ýH<×•Yj}6\Þ\Ì}r{õ÷«†A\Ï•y gÓš™M`u£\è}\ÜšI\0ÒŒ\0ME#8õOc\ç\ã¹\ç4˜¬PDÜ—pEV\ÛÊŒ‘ƒ\r;Åˆ\Ó\ßY\Æ0\ÙÇ¹â¤†;oý+Êª\ïUž¥-)Æœ¬d~\"ºBq\ãµai\Ãgµn\æX-\Ùß€æº©­Ž*\ÏFx~¹)“S™ˆ\ÉÝŠ ½½»w§\Ï\'\Ú.ä“¨f&œ‘óŒ=+\êh®X%\Ù]óÕ”»¶\Ã*£®rx4\Î\ã=ñ\ÅL¨x\ã#<Ò„ù†p­“0±,\0>\È’*Ë¢ \0\ã9£·\07# µb|q“I³H¢«8\\žÔ™#‚>”\æ(±\éL\Ï5Iò£ª>i\ra»&¤@\Ø\äÒ°QŒ£švAÇ®k\ZU:+\ÓQCOÈ½q\\7ˆõo²[»ð28®\Æ\æ]¨\Ø8ùkÀü}ªº$\'æª¯YR¦\ärÒ \ëUŒ;³\Íõ­Z[û—r\Ç\0+°\ïÖ¥H‹¶z´t«\ç]\É8µó*9I¶õg\ØÑ ©\Â1Š\Ñ#Œ\ÓHÁ8¦m¤¬uªrFC\â³7±_’0qNš\Ê\Ø5:®\îÜœSD±\ÑÆ¤›©§\Ã`qSò\áR¬mžr*\ÑŸO\í\æW^1Þ¾¨ðN±.¡b#\å‘F\Ü÷ò\ÚE\Î@\ï^\Õðò\á\Ñ\Ù7d\æ½\Ügk\îy¹…5:-õGµ]Nc˜ö¯ž~ \êñ¾\èPžxÈ¯h\Õ\ïD6¤†í“šùC\Ä×u©\È‚‘]x\Ú\Î4­\Üò0=¦&\ïh\êb‘\Åi\Ø\Ù<\îóŠ~›f.˜\í\ç»½#I*ÃŽ•óó©d}}\Z.MhXÓ´RBap8®ž\r`zžÀWIa§ª¨\Æ+°±\Ó\Ã\à…ïŽ•\Â\æ\ä{§«XóA¡>s´ó\íQI¢\Ìp\nQ^\Ú4u*8\Æjœúh\äv¥\ÌÁ\Æ=	ŸD\ä\îˆW#©\é\Â\Ýü\Å<ñ_D^iˆ\Äñ\\6µ¤+DøQ“WN¬”‘\ÍZŒZ+ø;\Ä\Ó\Çn-2wÿ\0	=+\Ôô\äiq$§-Ö¼/\Ã\ÑmAWù«\Ý`‘m\àsÀ$\×Lª\ÎI+œÐ¡7++²\å\í\ê[\ÂÍž€ñ^#\âmbMB\á¢F$gð5\Ñx›Z <qœ’}kðö‰>±x‡nA9$\×n…\Ý\Ù\ç\ã1\Zr§¢Ü·\áŸ\nM©Ì™N8>Ø¯fM\ÇO²ò\ár–\Ålišu¾—n°\Ä\0#©\ÇZ·p7F\Ã«Ú…>D|\Õz\î£ò>Gñ¶–©’¹\æ­\è\Z$*ˆe\ás\Íu¾7·syÉ“žkR\ÃI[F\ÆW­xY‹Q›óg\Ó\äJU(«ôDö–zp\ádÇ­vº}Ï‘…÷#t®q|1¤®\Öx²\Ë\Ðæ´•R\Ø \àWŒ\Ùõ1‰\Ú=\ã˜NFx®bò\æ\Í2\×$…\è\ï$!W§›J¶\Ô÷‹G4®7—ž_\Ý²o=3\Ô\Z\æ5=1-ƒ´y \×r\ÞÒ|*ñ\ÍsZ¬Km(hMh\Îz‘v>~ñ4Qý±]N2k\ÎÑ§p½9¯C›C\Z¶¡†%T÷\íZ7~\Z·\Ómü\Øòv÷>\Õ\ßFQvG‰S„e4´E?j-¤_Dsòt9\à\×\Ð\ÃYI,„¹+_/LÎ§p\ê\ÅwZ¸ó\Ø5³‘½\éW^“N\æX<jšqo\Ð\ã¼Yªµ\î±> 1\Í#O7r(\Æ3XWhò\êRŒwšõ¯iÏ±—\é\\\Õ$\ã\Ð\ÃRö“»7´]=©•\èk¾¶\ÒP/\Ü\Ôý\"\Ø\0+¹±³G\0ø\×›g°”`¶8v\Ðm\ÜýÁžkRð\ìa>\\Š÷\ì\èJr£\'Ú¹}Z\Î00~j¬\âE\âô±ó^­¥I\àS!OZ\á/ m‡\×Ú¾„\Õl›ˆ\Ær=k\Æuûf³•U\'\"º(U»±\ç\â¨\ÛTy\ä™\å\ã¥zOƒ®~Aò\àŽs^gwp†o\\ž¥w¸Q8Sß¨®šº\Ä\Ç\íV\'\Ô\Ú‚\â\0O\\c5-\ÑýñD¬?]ˆ\"p\Ü)<{Vù¸¶™ó\ÆOq^{G»b¬¶\î#ÊI­1|\àr9ED\ÂÛª¹÷\ÍZ´–(6y=il&C¨¢Ä­\Îp½\ëÅ¼N¦\áš1ò³\nõ]{QŠœŒ`\nùûSñ0µ\Ôs$~j–\äg‘\ÍTbÛº8\ëÔ‚²“1!ð\Íý­ò\Ë,DÇ‘ƒŽ¯e\Ñ,\ã…RFLô\ÇkC¹²Õ´Vlóƒ]v‘b­\0F\0ý(”¥-\ÍhB1W‰˜þ/\Ót\Âh7¡8\àg¯j\é\ì.t\ë\Èü\ëHš<u\ÅIÿ\0Õ\Â\ì–0Q#kS\ìVze°Ž$\nª0\É;šò3Eœ\Z\È\Ô.\âKM½\êÝ½\ÎÈŽ*I-RþÝP\Þ\Ô&\rÕ¶±\á{\Å\Û\Äm!\áFEbj\Ö(À´GžŸôûk¹®`\Ü<\Æ$DF2z•«\çLû>[30\äšS&)ž#\ã\Ëi³\×i¯\nŽ\Îk€B¦;\×\Ôz®žº\Ê\Û\ÈsŠ\Èñ†¬t»_\ÊD\ê8\çµ\n¼–·g&‡5\å}‘\à\Zb˜§\nO|Wp1Ò¸EPXwWyn0Š¥}v[/u£ò\Þ(Šui¿\"\è|\àSõ\" \ç50\n{×¯\Ì|w(ô5>Lx#Š‡\n€óMi~L¤\äRˆù&f\È\è:b 3¸\àøŠ‹~I4„\æ³r6ŒJ\Ð}¦\Ý\Ó8$qW|¯%ÍœºUùEž\Ù\n£1\Æ\åÿ\0\ëS&|F}k\Î.\âKM[|‡jHI\Èþµ\à\çù\áo\ÂX·B¼\é\ßI+\ØúsÃ·A¢À \í8&»¸®\Æ\Êùû\á\î±\ç\Ç$f@Á\×\ì\ÑK¹AJùIû²hýk\rQT¥-™fù\Þ\áÓ¸¥5l|¼•¨j\Ð\Øm+\Ü\n¦º\äò(Ú s\Ågs±#Zh[$;µd>\Ä5\Æ\Ý__\ÊI—\'Ž+r\ÎY~\Ïû\Òc“I‰™~\"¹&	Fq…\Í|\å\â#q¨\Û[»±‰\Ø<hN@\ç·Ö½³\ÅZŠY\é\ÓJ\àLú×‘xj\Ùn\ä2‘&\ÓòŽx\Åva)ó³\æ3œG²ûE„yqF„tP1SUCúóR“^úvGÁ\É\ÞM,§\Î\ã\ÐGjhaI±\"`\Ø4ý\ÅTñUœdg¡§‚Àd\Öm›E+\ÓYúw\ïL4„\î5›\Ü\Ý;\"enK»5[½JM4…\ÌKEŽ¼\n\ÑD\ÎR8Ÿ5\Ó.2*ù\Êõ¬kþ\"bHMiË¡‹ž§˜ø\Ò\è\Ý\ÞA\áQIÇ¹®I\í\ß5núV¹\Ô$$ÿ\0­\î\ÞqŒ\Î?:ó*>i¶}NÎ„#\Ö\Ç4\"oCR›f^¹\É\Ó-\áF/½TÐ³X´+¹y\Íf\ÑÔ™kffR¯\ê6me¶3\Î2~•¿¦­ƒ¼¬¯‡Y:Š\Ëq;O+‚€ø€T3T´9æ„¬a\ÉÀn”\È\Ð\ÈÀU\ë‚\\Ž€\n\ÙÑ´™f\Ý9C\ÊñÞ¢ö)E³™™o¶½/\áõ\àT»³\É\ÜXJ‹\è1ƒ\\ú»u$	\É3]w1ý«1R\Ï&¶¢ýøœXè§‡©~ˆõ\ÐI¥&‘rA=©HÀ\Ízv>U±§ŠaaNÉ¦\â‹\ä.8¢“=…7ž1T‘\rœ÷ˆ.š(–\Ý¿xÿ\0³^o¨\Ì\×RTbb¾­]w‰®L2O(?8@ª=Û¸¯?W’dD÷\ê+‹&{+¢œ9\ìt\ÞÒ…\ÕÀ™\×!EzÅ\ÛÊ¨\Ý\Ís^µH­ñ\ÏJ\ï\ìš B\î^+\ç±3s›>óF4\é.\ïV[ŠÁp1R¦´ãˆ•\â¤ò›\Ð\×)ê¤ŒV²ô¬\Ë\Û(\Ý2\çŠ\ê\Z\'\î+*÷\ËP@¤‘\äz\î‡\æÀù=T×˜´Œ×¿^\Í†L‚s^C¯Ùµ¥\Ë0\ËF\ç?‰®ü5Gð³\Â\Ç\Ð_\Zù™Q\å\Ð\ãNEuv®eEp‘LQŸ¯J\í´\Ì}Š.äŒšöð²»>/7„T¼\Íði\ä®=\ê<€k½6\Ñ\"\íÁ¨\Þ\Ç8 ž?\Zn\êd´\rÖ™Þ\ß¤b&1„q‘Q±\â¦;{\n…\É\ã\"¡³X«²Ô¡=ó®NöFyHoJ\é.”,qŒq\\¬¥“’~j\á\ÄHú¶ž—E”\n·“²\ïH\ã\éIb‚iV<õ<W­hz\0tuú×V²¦£\Ã\á\åY\ÙPºlóU\Äð\íó\ÈWf\äWº\Å\á›VÁ#ñ[)¡Û…Pùk™\ã;#ÐŽX\Þ\ìùÝ¼+¨‚6 #†úm\Ìg\çR¤zŒWÓ¤\"“·ø®7\ÄZ@h\Øý\à†Ç¥\\1WvdUËœU\ãsÃ¶\ã\0ŽkWNœƒ¶¢¼¶kiHr:Ux$*‘žH\ÍwÁ\ìx•\é\Þ-x$©\î1N\0žVYv.;u\çÞ¬F\Ãa\ÅuEž5Jv\'=9 \ä`M\Ý\ÇN})\Ù\ã=©\ÜÅ¢±$Æ“¦y©[n:cÖ¡eÀ>Ô‰±<ñéŠ²1Rô95<\Òf°EyºÔš\æœ\á²s]$‡\å5\ÌÉŒ·±\íX\Ìô°\äYœ\Öþ•\Ë<[z\É?J\Â\ÙÈ®\ë\Ã3\Ü´ˆ\Ôg>þ•\ÍUòÁ³\Ô\ÃÇž¤Q\ì\Z\\D\"–\Ív‘n\í\Ïj\á\ìµ%Q°\ìû\×s¦]\Û;\0XŠñ\ä®Ï¥ƒ\Ð\ÞKxö\äUˆ¶òk«\ÆPª—2Û„%›ñ¥cKœ>©`\0+Í¼C¦ù³78\Éük\Òõ;ø·E\ÜA\ä\ãŠ\âµ¦r\È\ÈTc<U\Ón2LÂ²S‹‹\ê¹\\‚¸ \Ó-\Ç\ï+¢ñža™¤^„\æ¹\Ût\Ì\Õ\íÓ’”S>GIJ,\ÛQš“o‡ŠËÃ¥4¶y÷Ð*Až†‚i˜\æ‚s\íL\ÌROZ˜&õ\Î}B¢¤Œ\ìu¡â€8¯yøP¯\ä\\dñ¸Æ¼.EÃ €?:÷Ï…Û¾\Å/}¦¦[K\ãG£j\Ù,ƒk$V¾©\Ë&cY89ª†Æµ~!h\íE\ã5¢0b\æŒ\Ò\Å8\Í!ŠsG¤\ëÁ¥È¤š0£‚šB½I»©\Ü\Ó1Uq\\RÀ\Z@hÁÏµ\'J‘£\Í<z\ß\è\Ø\Î2OA’+\ç‰\Îen\ß5}C\â\ÛO´i\ï\Å|\ÕŠvP°©¹\è\á~<ýkB\ÃjÎ¹ª!wv5·£@&¾Œ\ß\ÏO¥s\ÎZ3º\nòG«\è˜…†=x\â»g†4azW=gkògŠÛ‡NI†$$÷\çŠò^­ž\Ô‘\Ð\Û\ßZ9\Û\æ/\çS:$€mÁ®Y4>\'89\Æ3\ï]\r»l‹\åŠ–kR™y&¸-[V´B\ãwÏŽA®\Öö`r>aŠ\çf\Ó,\æSy=¿*¨Z\á;µdx\æ±*M&\åúƒ^»\àk\Ï:ÁFI\Â`\ç’+ƒñ›D\ã#n+\Ð|`\Öök\é\Üc½{V|®cK\æz<E†:S\ï\ïP (=+®\ç˜F\ß{ 4\Þ:\ãý*A\0‚¸•À„\ä\ãL=pLM2¨M\á½›\Üö¦H\\pª?zU\àœqN\äŠ:R8\î3\ÔS€\Âý{Ò•\ÜG~)¦\'¨\ãÚ˜{ñœš“x]ÄžxÀ¦³d—©\í\Æ*®&  7CÒ†~\Ô§ ûb†${\ãŸjB\Û=8â¤ólThGs¸Œ\Z—\'\æ)br}EF@\Â\äg•/^i6\à“ž\ä\â\Ä\ÐÌ\Ü\Ô]¨=\ê~˜ù?M#\'¿\áE\Ä0mo^)¸À\È9úv©@\à€1ý(\Ú1øŒšwˆZi\Ëg¤\Ø7`žp;ijb³\ZTœ»šiC“ŸÊž\ê)U@\'§LP\"&\ç–<`g£a\Ç^\Ü\Ôÿ\0\ÂO#§­FÀ·n(†(\Ý~´\×\ï\ÇN¦¤\Âu\Æi6öý)\ÜM`€µD\È9À$Œ“S¹rip\çÚ\Èh\Ï}¹\éÀ\ÅE±@\'Ó¡#’j}\ß>Q\Ôú\Ó>`z\ÍU\ÌZ!£Ò„\ä†G¤\Èz`gq\ïM$È¤†\ìv\äPÆ‘,X\ÆC\ãõ_L˜\Î\Ö?€\Å:4`H!s×Ž úR³\èY@\ë\ÐV;)-Žš1€¥O­[sƒ×°\æ²a\Üñ©\Æ:V¾x¯2®\ç\Ñ\á_ºoÅ‚µ`qŽ:\Õh¶SŽ9 \Ör>ˆb\0\àtª\Ó| ŸjŸ\åü\Õ[‡¸¾¢[O5\Ö\æIõ\äLQZµ\íbWÙAþU…<k.¹s·<&2}\Ï5\Ò[F<\Ä™ñ\ë^[Ö«õ=¥4u¶ò2xô5gWýp÷\Z’\Ê</\ÐU¹‹I¸m\Ø;+ºŠ¼—ª<üKµ9¿&xdJ¾c\ã©\Æy\É\ë\íM‰s\ÝA\æ¬\î¯#=\ëé£±ñ\Ü@{g’(9ùAÏ·­.H\ÆxÁ\äŠžü“ùV— ‘$\Æ\ãŽü\Ó\Ûq\ëžOJ©¼ >¤\Õ6\Õ\"Y\nÄšÊ¥HÁ]›R¥*Ž\É\Z§ŒœŽ•Ê±b?.qDR¬Ê®Aö©®\n\Å\Ç\å\×\Ä)h™\íá°²‚»G=}¯Af[88\ãcO\Õ\"\ÔcŠT‘ßšó\Ý7›\å¯~=\ëªð¤M\r¨.zûcð¢5½š	\Ðue±\Ô]D%ŒŒ‘‘ø×‚ø\Ë\Ãr´\Ïp³g¾\ÓÚ½\ÞòU†Ä\ÅxGŠ<Bu	\ÌmÝŽµÃ‹Ä¹\Æ\ÇnÔ»8\í3M2L8\ã5\ëZ>™0¨\0d\×¦\'’ ú\×yc}\à¶@}+Æœ›g\ÒQ¦£\ì\Þ°½ˆ‰b<‚yÏ‰<qm%ª\0v<W¹é—–S¨Ã©\Ê\ã¸m\à*AsJ3qZQ’\Øø„\Ù8v\Ê\àƒ‚*EŒ/Uö5ô¿Šü¦j@Îˆ\"œgƒ¯\ÔW\Ïúæ¨\éR´s e‰¡®¸TRGRœ Ì<j\ØQœz÷«Kw2Œ\Ø\Ö\ì¶F\r81\ê=+DÌ¬tIp¢N®\ëÂ·\Â\Ô*x\Èú}+\ÉD¬½úžµ\×ør\í…\Ê@­\é\Õ\ä’f5i{H8÷G­x»Xh\ìHVÁe\ä\×\Ï\Î|\é\ã–=}k\è;\Ý*-B\ÝZF$0\â¼\çV\Ñm-nw\Ä1\Ï t¨\Åb•F,TS\ÓvC\á­:G8+Ø´ý;jdz\æ<1Œ}+\Òb·]È¯&¤\Ûg\ÑQ¦£I†.¤WIe¨Zn\n®8\Írn–hù•ú\ã©À«¶\í¢Ê˜ž˜4‘©\éPO©ò°<õ\ÍCrŠA#+™²·Ša•\Èô-[\Í&Ø€5LM—1†\Æx®[UXÏµuú†§ª\ÜûWšjþ °¸VDq¿\ÐñŠQ‹¹I$qösù\Z’žNNx¯A½\ÖV;vfx\Åyt2™/y\Ï9«—·,ÁP \×}*.G›V·*i¦ýFÿ\0‘»-ŒW¿ø_D‹K³S\åa\Ü\\O¼?»mÌ‹\Âô\È\ï^À‹Œb¾ƒ\rG’7#\æq\Õ\î\ÜÍS‘À\ëD£\å=†*v\àt\äTt\æº\Ï)žg\âkH\î\ßcòóœT:™i\Çi<G3½›À\ã\×\Ô\Ô\Z3´-ÔŽk\æs4\ÕV}·\É:(î¤¶‰a.Ý«Ÿ$’p=+Z\âô$X<ƒXfd’AòŸÀWŽõ>¡\Z¯ohvHA5z\ÈÊ„)Ë¨\ïY¾dB0D\\ý*ý•\ÉÀÀ$3^x!ks n}+È¼K1Vd=«\Ó&¹S‘Ž‡¥yˆ\îU$g&ªÚœµ‘…\r1iTü«+Åš”(\Æ\Þ2\Ø\Üg§ˆ,\í¬\ädš3 þó\\˜ºšúá¦“8=+¿E¹ó=‘\àf¸¨Æ$^²&dÝŽ\Ü\Õ%ylnÄ€œ1\Æ+\\tÏ¸©`²[©Q\rzuax5ƒ®\ãY/2+O´jP¹\r\Í{+µ:\Z\ält\ám6Í\Íupj1Z)h\Ò\0>b+Â­¬¾\Â.Ji÷=7L…Ð§#Ú»K8Pæ¼«D\Õ\ì®ðmY\Ôÿ\0uŽk½·»’D\ÏB:\â²J\Çk\Ôë°‚,gš\äµ`\äž8¤›R‘8Wºôªn÷7I»\ÌFô\0\Ñ=Q	Yœž£8×‹øª=\ë&~^+\Û5™s»¯4ñD	<\r‚}«:N\Ó&¼y\à\ÑóuÊ˜®R3Á\ÙøVA\ç¡Rrªg\Âú…\ÜÄ…8\'ƒŠ\è4­÷J¸ù\ÓwÎ¤m¹\çÑ¥5$\ì÷=÷JŒ]Þ£\"º\r=´‡fG85\Ïøn\í.\íV3\Ã\'WSýŒ\\\îI0O5\Ä{«b½üzbôw‘X9¬\äi\ÑKw\Ð÷­it\Ó\Í#gŠ\å5@Z\ÂUH46’l\ç<E«\"C(/¢¼X„\Õ.\Ù\å\È½€\é[$¹º¹—a\Ê\åúQeh-¢¦½ŒN7g\Ã\ç9›£=š\Øô\\¬,ölÁƒ©¯mÑ€ b¾P\Ói÷\Ñ\Ë	\Æ\Ï\é_GxSX\ÛÁ+—\â¹q´=•Gmw#\Æ<VsnW†<¨¬L–‘cS“Þ´\ê\0UE’B\è\Ø$\×=Ôˆ¼‰#‹8­m%Ã‚¨6N\âm†C&y\ëŠŒ\Z:	0pq\\^²\ÊI\Åo\Ý\ê\0\Ç\É\ÆyÎ½¨˜á‘\ÏAM\êe\'Ê®\Îy}ú¸}¥NA®\âGŠB\ÓD€\ÈH20=s:¯\Ä	¬\ç•c\Ø\áI\È\î~†¼‚\îö[«‰f‘\Ë4ŒO\'š\é£F\ÒR‘\å\âqJqp‡Í¹WŸ¹ñ]¬>P‰vô\Åy­…\Ãyƒ<\×jÙ‰k\ér\én~uÄ°|\Ôß©¡\rI§>\ÕH¶zTÏ­z\Ü\Ç\È(“—£\Í34o\ÅK‘jœS‹U³œ\nj¶&³r6Q\Ð&9R{\Z\æõˆ-¦ƒ2\çŒ\ÖÛ±$Œ\Ö>¤Y\ã1\íÊž¤rEqâ’•9zžZ\åE9/\æ0|1«>‹¬)\ä\Ä\ç}A§^	cIð\Ë_*=¬©<\ÌQ’1\Ô\×\Ñ\Úu¼öñ,å¨;+\ãqiFg\ì¹4\åR‹]Ž¦\áR|\åA„T	aŒ¢š©ül@\'k{\ÕÁ}ŽYx÷®;ž\éY\í\Ö6$¨\rLy(Ü’8\ëD÷ñ18lœv®ORº¸œD\Ï9\Ñs:Ž\Èò\ïkŸnºK˜\ál\ã8«³k{_0ð\Í\ÏZÃ“J’\ëÄ³ù[Á\ÞA¸\ë^‹„\\\Æ8¯g•®|uRM¸½\ä\î\Ç+OMC\ÐôÀ§zW>fÄ¬:\Òd\Ôe\Æ\"’ù\ÏZW)\"P[5&j\0s\ÐóN#=*ª\'V\àó\Å\"a\ÞqO\ÛÓ½$®\ÊoB`sO_Z‹R\n\Ö11”\ÉsÚœ¡*0}\êqƒŠ\ÙD\Å\Ìf\Æ\ï\\Çˆ¥Xl\'n2ªk©,“^y\ãivX¸\Éu\ê{´\äü‡‡ý\åzq\ï$y\"ƒ’I¨L­º¤v\ÈS»Šñ™öqZ\ÍÄ’RN\Õø\Â\ZŽ¾¯,e\"‰z3¼}…XðÏ‚/õ”¾\\?Ážzpð¤c³{\Ö\ÞXC$»\É!”÷\0®Zµ¢´OS\Ò\Ã\á*I)8>Sž\ÐþN­\'\Û%(À\áq\Üz\Ö\Å\ç\Ã%“—Tt÷¯R²\ÓE¬AwH\ÛTw<±õ­b‰öbÇ¨®9W÷=x`¨¨\ë\ÂÏ€c´PÁÌ§º\Åak\×cC¶Xd30\ÂÄ¼\í÷5\í÷¶}m,i#FX½y+ž„W“\ÉðòòX/\Zü‡¼}¢\"bTmþ&\Ï]\Ý\Å\\*]\ÞL\ç\Äaœt§\rúž3(,rÇ–9&º¿e5œöh]MOu\àû>\Þ[‹©0PpŠ3“QøM\ÔþS‚TŠ\î¡5*‘¶ºž>œ©\áªó+{Œö8\ÏËƒN\"£‰N2MNkÚ±ñM•ù¦\í\É\ëŠR\Ø\Í!bý)¨\ä#)¿_Z8æƒŠ«\Ìy×Œ\Ø– f¸\í*\Ù\ïn£¶SÃ°.}u5\Üø\Æ\Úgš0JðÇŽ˜®/Bkµ½Ô¨|`–ô>•\äct“ô>»%5\ßnf{$6ò$qEm„T-]%ŽŸc!U2°c\èk•\Ò°—H\×r¡¶‘J\àwö®\ê\r>uH·d0xSZŸuE>Udk‹1§ò%c‘üF´­n\â0v¿¸§¼Ò´\n²”—®1\\$ñ\Þ[k6\â\Âa/q3“\Û“V:b\Ù\ÖOq¾FU=k/P\Ól<’÷2 u\Î*‡w{ß·H’\Ï\ÙB;#r8®¶yÍ£\Ã,hþ„ŒŠI\rže{eg(\Ä+q\Íy·ˆaa,«’‡­z­ö…\Ý(!rs\Ç\â+\È<I.§,R™cJ¾÷eú\Ö\Ô>4pcU©;£…\â»m0\æ\Ù®)Af\0zñ]ý¤{!0\0¯ \Â#\à3™.X®\ìµØŠo^N\ÔdÂƒ\É\â»Ïš{\r á¸£­~*„&:\Òv9 š:\äT°Btjlg­F\Äâ¡›\ÄÁÔ‹\Æ05\Ì7+Ñ´\Ë[mCRŠ\ÚU\Ì\ÏúW¨\Ø\Å³-¥³A)Tjó12Jv>«+…è¦‘¹\àûq¨\îuÊ§N;\×\Ðq,j£nµq>\Ð\âÓ¢A\Ìybzôh—`W‡ˆ©\Ï#\í0T=5u«4\í¡V ‘Z¿enqŠ¥lJ°­lüµ\Ìz(Ã¹¶\ÇA\\Æ¥º’\Ã&»k£‘Š\æ.‡-\Å;ŠKC\ÃüI¡9gž. gðk\Î\Â\í<9\àW¿\ëvÛ­¤­xE\Ô~\\\å\0\èz\nõ°•£g\ÐùŒÊŒa;¯´iB	Û¼ð{Ö»’N@\Çl\Ö3üªkz\Øa\0\ä×¤™­b\Ö2ž\æ”gi8\Íú\Ó3°t\ïWs’Do\Âû\Ô%ŽH¥“;‰\Ï4\Þ0I\ëL¥@\\z\ÔdÞ¤\Î\Ì0y\"¢\Ç\0\Ðk¼«¹q\ØŠ\çd9<`u®‰\Ê\í<sŠ\Éu*ŒI\ï\ëX\É†¢‘>\Ç\Åz×‡,; \ê½NXWœ\é6¿n™£/\Ð­{\'†aÍº©=1^v.MF\Ç\Ðe°¼\î^]v\ÃL}­Žê¥˜*\ç\ëW´Ÿ\éz\ÜÌ¶\ÐK\'-½kz\Ò|\æ!–\'¾*[/\ni:<SX~k~I$Šó®o’wVjÆ¼_”\äU™Tdj5vI^\Ã›l\Ì\à÷©¹£G)u\ã-\"\Ê\ã\ì¦	ZL\àüœT&¾·\Ô~\ârA\ÆG5\×]øGJº½K\Ùcc2ò9\ÂýH¨e\Ò-\íòc\\5]\â¬e\Ë7{\ÚÇ”øƒNÔ…\\vë…‹D\Ô\íÁ¹x!—\"½s\\‡8U\êOC\Åz’&‘ok€C\È\ÓÖ»ð\Õ%u¯vxY59·gžh\Ìq\ÇG\á\Å&sjLŒu¯M1!\0÷£\å<KÀ\éøSzS¹ŸQ@§ò\0\ê1M\É\0\nx\êx4\Ä\ËdI<Ž\r{‡Â·s\rÂ’0cñ\á¨@ˆ¨õ\Í{oÂ™w%\ÒöR–\ÅRw¨P\Ô\Î>†³5{U?¼Œôª@ôá±­Oˆ\r-7õ¥fl\\R\n]Ô¹\æ\r£µ)Á4\Ó@šJ	\Å!\Åcº\ÓH\æœ\Åmé½¸4þ1LÁ E-B/>\ÎE\ã\î\æ¼B_\nC¨\\1‘ˆ;‰\Â×¼°VB¯7‘\Ò\ÛU‘7¹²Ps\â/\Ëtzœ\ìy¹¢6•3\"‚\Þý±V<3j¯t$/ÊŽ@\î+\Õ5\í.û=\å€#\æù\Åyö—\Ø\\º°\ï\Ç=þ•\ç:Å£Û.Y¦z•¢¢Ž3\Æ1‘\ÅVÔ´Fþ\åN\é‘\Ç`jæ—†\Øy\í]”q.Á\\-Ùž¤”NK\Ò^\ÂŽGg™˜žk©ˆª&\'##ŸZ\Ó6\Ñ\ä\àV-Ó¤M\å«s(5Q±z?x{n\ï\é\\\×ü#\×3O,¯+¸aòOs]×š„9S´Ö½¦J\ä÷Ó±Š‘\æÚŽ—pªBW£\è0,Vˆ08³5ˆ‹p‚	É®‡KC\ä§|£5\é\à\ås\ç³XZÞ¦ÀR@ óF	\ÏaR`\âšz†½xƒ[&˜\Çi\äÖ˜=i5²iœ\âžOQŒóH\Äv?P\É\È¨öô>\Ý*BÚšG\'““@¬7aÀÉ£\ç¡\èi\í–¦óÖ˜ˆZA\0±ª¬¤uõ0#\×M!#\Øú\Ô\î\"=˜^‡\0I\É\ïN\ç¦}:ö¤lc\'ƒ\ÏjW\rÁ\"¤t\Êõ§}\Ò(l÷\çŠ.M†•QŒdú\Ó{\ã²x\ç4\í\Ã‡LRœž£¯CŽ†\Ä0Œ“\ØzSy\ÜG\ã\ÍHB¯n)¤° ž1š.+Á\Ó\éHË‚H\ïOü8\àŠk«ŽÂ˜X—\í÷\rHùcò\ã¥H¤Œ\ägS\0;\È\Å\0ÈŠ€\àóü\é‡;3ƒ\ÍXl\0;û\Æ)6JŒž¸§rZ!*x9¥#Ž§ZR;¨>Ù¥#\ïqŽh¸X„+•9\ëMu\Ãc‘\ÏJ°\Ç˜¨\Ïr23N\â±&GŒñLe \áNj_\\ûSJ}µ2Z1¥Y‹\íR8 žjV\n\äq€p9«2 \0(\çÓŽ \Ô;x<=;zÓ¹“‰\Å%F\ÞsÚ³*\ë¸s\Ðc4\îq÷y©X\Æ084›\Z‰Œ@lñ\ÇQQIœ‚[Œc§^js¹¤\Úa\Æ?J¯ \n\r÷qŸsŸJ\ÊL\ê‚:{V\Ý}F½kA\Û#¡‰bù·RýG±\äóšó«þû¨Ü„üƒŠ¸=r+>#\Å[\È\Ø5\Ì\ÙÞ¡ØžzUI\Ûj1øsƒVÁƒ\ÔV]ñe‰\ØsòžOn+\ê&\ì\nS„·\Ëjwrœ\Ï\Ç<Œq]Vw\äý\ÐI®J*\É<»º\Ì\Ü\×s£»È¬ø=1šó#¬\ÏBZA…™8`f±¼c!M$\àà±­ûD\×\Éø\Ýñg\Z\êÆ½*½XzžN9Ú…Oðž[v¦¬\ìEbN3“P(fL`ò{÷\"W×šú4|s\ÜYX*úUÌ‹\È#§Z•\ÉC\É\îkRº’8°ƒ.ôªT8¹0¥MÕšŠ\ê\ÂóR·Œ²ù™a¥T±dx™\ÎIfÉ¬\Ë\r6F‘\Ún	<g½uvö±\ÃÀ\Î\êùŒ^:u¥m‘ö¹vW\n\æz¶hé–§`cÐššþ\ÊI\ã*=xú\Ô6÷_e;NJw®1¼yV¹!VW=*˜xržc„&–ð\Ëx\ÊFs\Ç<\n\ë<ˆm$kŠ½s6ªý*£[¯j\ï„eR\×<Š²§F\éÆ°þM»\É?\Ý\nN:×\Ë3\êÅ“[¸ü«\èmPAs\Æsò×’\Ý\è†ÿ\04.=»V»AX\×Ysy’Amª\ä\çŽkb-gKµÂ´- ö}I«ö‹<{\nu®‚\Ó\Ã6n\Ù1ðFz×”\Ùô‹E{ô\ë\Ï\Þ[FTõ\äWSi#.x£]\"\Ö\Æ\å&À;\n¬c’¹¥r\ìMx~R3Ø“^{©\ê6Ä‹‹_3q\êW5\Ýó+\àœ\æ’M	\ÎdYI\èy§XÂ¥\'$|\ï«\é:6¥#Im\Ù\ÈN@qpW6“\ÚI\åÊ¼\ã<t5õ¥Öd³¨\0dqÒ¼\ß\Ä\Ú=«À\ê\ëŽù¡®ˆV»±\ÉRƒŠ¹\à\ã®3Ò¶´©sFO÷†+.xü¹;qS\Ú\È#18®“XúOFIeóŸó\\¶±j\Ò\Þ\íTùqÓ·5\'‡¯~\Óf‘)!ºWJ¶&7ù²Ksƒ\\3m6ztâ¤•‹ZšÁ½G$ô\çµv–\Öû\Ô\0Mfé¶¿*­v–6\à\01X\îÎ´´8\Ý[\Ãkz˜vp3\\´[I÷$ò¼a·mnÆ½¾[@\ÉÀúVÙ£î£ƒNö]L]\Õ\Ð\ÙÀ{\Õ\íR\ëì°–\äú{U\ÇtŒpG\Ì\êD\Ü™<ñN\à\Ñ\Äj^\"¶±;¨\ïŽõ\Æ\êcK\Ô!iT`œü\Ýó]\ç†\à¹$\Éo|ò\rp\Zö‘%ƒ#¢ÒºiZM$yø•(Å·±‘aº=øló\Åv¾\Ñ_T»x<œó\\Žg4Î«Œ\äó_Gø[Cû\r ”€—ñ½¬<5Gƒˆš\åvgY§\ÙGin± Àµi\Z¡(ß¥^ž+ÔŒ\Ó<*\Ô\Ú\Ôq¨¤M\Ç¥\Æ}È£PkS‘žI\ãòx\Ú{pÅ—’<{W5 ^a9r’/f\ë^\íqt>¾µ\áþ(³š\ÇQY\áSó~U\æfT#R“•õ‰\ìd¸¹\áñ*	]L\ë\ç\ívÀ!ù‡ô¨¬/µ_\ÝSŽ:VF‹«	qðÀò¥w\ÑA\0p\í_,Õ\Ð\â\ÓW*SPdÿ\0S\0\ì0:\Ö³¬\r:Ô».\×n€z\×^\ÑB¼^E\ã)R]B(Fvõ\ÅR\"rh\é¡\ÕL\Úhg\Â\ç©µ\ã¾-½7En\à\×Iu+D\"ƒ¦+m\"\ïR»XÁbN21\ÅmIG6y\Ø\ÉT•6¢q°é’¹\ÞNs\ë],0\ìP ô\Öj>ŸL³I‹®?ˆ¹<\Öh\Ôw&½\Ú1‡*q>R¬j8Tº \0©­m1öÎ›ˆ\Æk4\í\Ç Š\",®<æµœora\ä\ÕX¿3\Ù4\Í?ÎH9Wy`2+Á¸\ß\\´±\'\Ðf½ap-‚;šùš\ÚM£õ\"N„\Z\êŒ8l,,“ÁG¾ÑŠ½h\Èb¨\Ý>ù>Ni\È5\É‘Ø¢Z¼Óš\é7 9\ïŠ\áeð¥ò\Þ4\Ñ\\²!\ä©\'‚=+Ô´É•Á\çÒ´\îaS#9\í¡›Hòy`¿Š=³>üt=ÿ\0\Z\âõ$-!P3“Šõ=]6+c\Ð\×BK’J\çÚ£—Q]\Ó\í`\Ó\àP£+‘‘\Ü\Öe¼\"ú\îv*0W\ÄúôF-¡\\\ÊÝaZI\0$\É\Ý\È&Ÿ#J\âŒÓ•‘,:t°Üƒn\ÛZº…»Õ­\Ó\ã\Õ\rJ®õaZ‹¸-+\Ü\ånu{ÛŒ¡…#¿jÉ“L,<\ÙN\âÇ\é]£À¹¬\ëø\ÂBq\Ô\Z:‘5\î\êx~³h†\ëy¦0Mgõ®·W¼F3“\ï\ÖU×‡µkkqt-\Ý\í\Ø¬Q3\Ø\×\Øeñ¶\Z\'\å9üjK6®\Ò8»\Ø\Ë1\Îzf½C\á\æ´\Z3e!ùú¥p2[¬½fªX=å®¥\ÂH!«‹1¢¤›=®\ÄÊœ£\ê÷G’£|ÕŽ—7\è\än\éLÐµI\'Ž5˜að?\Z\êÅŒ78=ó_<~‹¬e\rZò8ù\Å,:\Õ\ÌÏ´\ÄAõ­4¬–\'\Ø\ÕX\à\Î\0¥±»\Ïp\ÅK1\ã¯ñ÷‰N¶uR²d \ÏZ\îõ}MÂ”ˆd\×Íž=’Qz›ùr¹9÷«£iM\Ù5M¤pR»\Î\äõ&™\å²ðWñ¤†UŽLžW½h¼\Ð\Ì\êIùk\ÒG…³+\ÚŽtã©¯G´`aR8W\áhü¿ºy5\Ý\ÂQQpx\Åz¸kŸ%Ä‘º§ó.ÖÀ\Ó4’k\Ô\æ>E@•Hf‡ÛŒƒPdu\ÓI\n¿\Ï4œ‹Pµ9¥S\Æ*¶\ãÛƒL\É\Ï\'“Ú³”cL•\Ï85»¥hrj03¬ñ\Â\ï;ô\Å`E\Ë*‚8\îk¾\Óôx@¹\Õ\Ö0F@\â¼\\\Û©Q\ä‹÷¤}·	d\ï‹ö\Õ#ûªK¶\ìÏ¸ðýº§ï¢ºr\ã\ç\\qŠô2 ˆ«\ì+<\rc\"	´\ÍI„‹\Êôe>\Ç\Ò\Ù[\\@¡n6\ï\0GC_+9¹\î\Ï\Õ!†§GH+µŒý\è\Ô\ÓF™j?å˜«ý(-\ÅgsKWV¨ªv¨\Ì\ÞÅ€\ÜgŠ\ì®FG\Ì\\\ÆÜŒu¡3)\Æ\ç5wz›\ì\îw<LCÛ¿Oø	ª—v³\ÙHc•\n±æº‹{k\ãåªš\æ¥mÐ¶½¶yfc™:€z\×^\ì\'¯\Â\Ï#4Ê¾¿E($ªGT\Î:G`F3\Å°rÖºK};M\Õ1ö[°Ä®T5b\Çj\Ò\ÝOk\Z“,D\î^\ç\ê\ÇBN\Ü\ç\È\Õ\áüÊ’rtI]µ©W\Ì\ïŽ(I\0¦\É®zŒG¥5 ™£\Þ\ã\é]J¤Y\åû\n‰\ÙÅ—\Ý\Í³\Öi#p¦7<\ãZ@Œô\äÓ¹-ž\0§­W-Óžjdæ´‚1œ\ìN¿5!\Å1qŠ\ÇJ\è„Ny\Ìzu©\Õr2zT(^¾\Õ0÷fºg1N+\Êüq\"6°~q^2‚X†¯\"ñd!nI»V­(³·+´ñò»8©#B‹…9\ï]w„ô(¯5^\æ<\ÄT\ÃXI÷¯Dð¥ô/o¦\Æ\n›ˆ%t‘s\ÉR~S^\r{¨;yƒŒeZ)Ÿ@\è\Öp¢\"…\ÕÖ‹$=‡Nµ\Ïé”+¤KÍ‰ŒW’Ï«KCQbÂŽõœ[1\íW\ïQ¥¸\Üù\ØWŒz\Ô#\È2”m\ÃÚ¥¢\ÑN\Í1ÁÉ­Gµ—•™k-Ð‘z`\î¶ÙiGšø²\Î#a7\Ê¯ðÍ±W)@Gµ{¯Œ.Dvr\í È¯ð‡Í«O\Ýv¶§5\ée\Êõ©òüB\Ôpóÿ\0=13þ½…l\Òdd÷¦¹À\Í}*G\æ\îVdl\Ù4\Òù\ÂN\î)¹ù±Š¤Œœ\Å{#\'4§*	\ÆqL\\\ç=)\ÎÁP\ç¦:\Ó\å\Ð\\ú\Ý\Ùhh÷ñ¡-+Cò×­p1ø~\ï\Ã\ÒCs#\r\ßn:ö\Åi\êzýö‰}esù#|:\ãS÷†+¿ñ\0ƒVÑšX$‰f‡Ozù\Ü\Å\Êš\è\Ñú(TÁ\'´“e\Í!\"º´Doc]Lv×›\ÉWR§¢‘\\W†\å+onÇºŽ\Õ\è‰p=\Õ\âKs\í¨YÁ \Çü£5\ÌÂ‚[©$ysžk¡vYaec÷…U‰€\Z‹\Ü\Ú\Ö0¤·x5s(\åv¾9¾\âºMP\ÆF3PÈ’\ÌÜžõ*H0¢†¹—smy:0\Ä#a\Î\ÞI\æ>1ˆAf A\Æ6õ8¯]¹¸ý\ÛtW”\ëq5\Õ\ì;†W×Ò®“´\Ó91Šôš\îxå½»¥ú\Æù5wQü€/¥bx†H†°ñFU„$(\\Öµ¼›\â\\õ\Å}&	\Þ\æ\Ù\Ü-5g¢¹9\ä\Óx¥\Ï\éIŽk¼ù\áy”SU\á@‡cÒŠxG`NÃ´wô¨‰\Ç´ŠgRis\Æ3Mc\Ø\ÔEjSi\Ò\×P±›8)q$@\'­‹\ß?«–\r’—¹E£ò\É=r°3ŒW©\ê\Å%\å\Ð9@{\ä\nðó\Ô\â\×TÏ¶\È#Ñ’}\Zh×·Á\Ê\r¤ú\Ö\Ô7WÈ™|Uˆ¬\î\Ô)\ã#\"¹\Ûÿ\0\ê¥­/)\Ð\å2O–\ÃÐŠò›>\Â)¨\èuöº\Ò`,±4O\Üu¸.¼\Ä%H®LÐµ{5f\æ|“#v\É\ì¹\ì+¨\Ó\â”DA\íQ#e{§¸P¹f\Æ+•¼\×,T™\\vQš/\ÍÌ³˜•°;\×¬\ÙxŽ\Þx\ÓOHŠJW3d~\ìwÜ¦œRlÎ¤œVÅ­SSi!qögPGSÚ¼OSù5˜×³¥–©rÒ­\ËAÂ·÷«\Èõ\èkrFƒ;H\àñ^†\Ü\Í#À\Í[äŒŸr[x\ã®dÖŒc‘\Ó ‰0 tÀþUddg&½t©&\Û\'\'¹üE5¾aÁ\íÖ“o½;yúUXÈ§Õ²qšWÀ#Žù\ÏW<\ã=}z\n¬!9\î)‡žÔ††\Í\"D{úb³g\0CÓœš\Ñr6ó’k\äñŠ\ÊG}\\\Ðï­¬&šY‘\Êa\0<õ\Ízï…¯#›k( \Ç=x\"\ÈP–±\ê¾\n¹[(\Î zz\×.7ƒg¿—O–¢‰ô-›FX\Ôz…úGm$ŒVU­\ÃÇ¯ò\Å,¬“|µ\åF™\r²³©\ìI¨£œ\Û\Ýƒ‚zŠcU\ï\Å\'’„Œ¶GZu	4r&x\Î+P+óv\0P.B.c\êW.S\0‘ž3@ž\Ç­_E\áÝ°‹^k¬jP¾\Ýmª \0x®\Å3½®\ÉA]\âMÊ¤q\Åp‹3O!‘±“É¯_¢¤|žiYº’c<c¯Ö‚}/g&»	Ž\ÈÛKÀö¦zR\æš3·œ¼S9\ï\Ó4õõ<U]‹hF#ôõ¯eøR0·nG°+Æ F1±Á ñ^\Çð±ÀKµ4š\ÐtŸ\ï\ê\Z¦<\ÔúsTEY\Ô\ä]\è}ª 9á±µOˆ~h\Ï˜8¥\ÎjŒ›’ii)sL.)\à\Òu¤&›\ÔPû\ÑGµ&@4Ž\íÁ¤\Íh\êq@·‡Š\Ôm\"\ã§C@†Hö\Íy/‹ ’\Æ\ì]EŒ^«$N1\\w‹,Ý™u]\Å\'®=\Å)Çš&ô\'\ÉQ3‘²\Õ\í®¢h\å•þ3YŽ\Ñ=Â¬e[û\Z\áo`xÝƒq\ÔU\Zyb”&r§¯ó\Íy\Õp\Ê)´{ô1\\\Í&{N)\n‹]å´»\×$b¼\ÏNv»ƒŽk´³¹#$^T÷=º_\n7œ|­\\´ð\ÎŠ…žI\ç5ºn\ã“Ž3X×º­’Ÿ™\ÆA\íH\ÜÎ»[¦\nŒW=Ku­+-‰\Z\äö\é\\\íÖ³l:dž1Ko©dps\Çˆ‘¡©°;S‚XŠ\étô\"5ú}:×ž\Ü]½\Å\Ú \çc^‹`G”9-\Ç&½l-Ï˜\Íj©TQF7\ä\'¯­/ô¤8\ã\ë]ÇŽ4äž¼\Ó:õ§–#µ3<SqœÂ“\Î\0OC\Çj¢D\Û\Ó$S\0\ã#Ž\Øö©úô¤n3Ú€#\0yæœq\Ç418\ã\éI\É\äPH£zšŽ[\×\î3œu¡G=‰\Í~0qNá³œ÷\Å;ô \ã œ\ÐNð\í\é@TR¶1\Ç&•ÿ\0\n\Ä7 t\ïN\ÉUç ¥Û„\ìO;~¦šÁGN´\Ó#?¡{Ôš\0ò\æš8$\ç\Ø÷¦!Á\Îis·¸§cž”t\Æ9\ï\ëšh,0©\ëŒò(aŽ=)ù\ãša\Ý\Ý})\ÜVò‚zšFBsŠsƒŒ¨ç°¦œËŽ)\\V\Ê pi¡r\0P*]§y9\ÇŠ\éœ\æ—0Xc!`F2*6vÝ‚ wüªM\Ü÷zšF\Ø\Ã<g÷§p±ÚŽr§ÛŠvvŽª=Ü“\Ð\æ\Éh­ ;ù#Ÿ\ËÒ˜Ï°wùªi2½Á\nó\Ó4\îO)>r½‡­7\Ð\r c¿Q\íNb!A\'œÿ\0!@é“œ“šM”¢5w\à\çž)“\Æ ‘\ÎøÔó³úŽ¼TL…xq‘’sŽþ•”™\Ñj\Ø6 Ç¡5±jA\äŽ3\Ô\Ö&œxe-»\0vm@\ÅsŽ˜\àWfzø^†\ä$\ã‘Wq\íT ã©«\ãúW)\è£\è0€\ÖV§(Ž\Ò|ôMl\ãŒg½sþ\"q›3ã±¯¨ª\í\èxtµh\á´U\rl¡r71$c¾k\Ñ4«9-¢W\è¬Iâ¸­!@U\Ç\Ê\n\ç•\éöÀ‹X°\Ù\ÈÈ¯6ž\ç}M’/\Û\áb¼÷\Ç26\Î;×£B£`&¼¯\ÆÏ¿Q\Ûè¿€¯W¿{\Ä\ÌÝ°òùŒY\Ä\àó\Ø\ÓÏ¨\àc‘HˆÀg8\Í<\å³\Îx¯z\ç\É\ÛR®\åÁªÿ\0b3¦\î\r]#šž\Ôn—>«\Í\Ìj¸Qk¹\ìdôLJo\ì\êU›K¸ƒ\r.?»U~\É|AmþX\ë°\×b\ÛU\\ýü²\È\Í\Z\ä\æ¾aŸm²0¤\Ôb_“ºõ8©,µ•œqX·Q<e\Æs\Ï~\â¸-gQ¸²È°y_jº1¼\Ò9\ëÕ´=Š€\Ì\Òn\'Š\äõ\ï[\Ú#ÄŽ\ãŒpkÌ‡Šµ–ƒ\Êª\ì8\ë->\ëVœgs–<ûW½EZ(ùœCs“wÐ½k¬^\\\ÝvÀÉ®\Õ\æP«2D¾\ZMµ\Ü\àŠÄƒRŒLÑ¿³Š\â\ÇP“\\\Èôr\ÌD#.Fw:Lhq\ì+½‚%9\ç\Z\\Á>`x8\"ºø\î\Æ\Ì\Æk\Ãz3\ê\ág}B\â8\Æ\Ðy5.OZš\â0\ä6þiˆÎŒ0ý)\Ã\n4R\0A®†a•k²w8\Ï|Šz©•nž”\nÆ­öÁ	\Ç&¼{\ÅNDn\ã\ß\ØW¡]\Þ2\Ç\Éú×“xž÷z\È\\ö9­%y£Òƒ<ZøfgÀÀ\âªF§9\íZl\'œ•R¡»S•%-zIO1£§\ß\\[ò\åe\Ç\ì¼ž\í7K)“8\Æk\Ä \ÒsžM{7†£I\éŒr+“’G¥‚m¶{˜¿\'\ätö\ï°\ä\×7¥` ñÉ­\æ¹LÕ’\ìlÀ¬«‡ g8\É\ëXò\Ý\Ü\Å)@³M›ûBe!a\í@ˆ‚5\Ë\Íd]I¸\Ù\Íg]\ß]Z“\ÛÈ‚²©Ë”<ž\ÇÚ‹	´vA\íó\ï^M\ã>\×\è¿nDµ\Î\ìdW™j1\êZ¥ñ–\Ö/1\ç¸®Š–Wg*.p\åFÿ\0€ü?\æ\É®£É¯tUUP\0â¸¿\êPÊ‰i=¸·Ÿ\ÈÉ®é­™³“\Å}¤eMj|\Æ2„\áP‚-†B\ÔU\Ì``š\ä5%}.ú;•,`\é]tl\'‰\\t`\r?k\Ë2~¯\í(’m\Îp2(\èx¨X¼*\ÅA9\êa\Ýø‚Uf•Y\0öÈ®¥ˆ‚Z\Édðu[´bÙ±<›Exßˆ\îg¸\Ô\Ò;†z\n›Wñ\Ü\×£\Ó\áw¹}>mI¯\Å\ÔðÜ“qŠ\â\Æ\âa:N1g§•eÕ¡ˆI\Æ\É«¥;bE\âA[6šž©m„x·¨\ïNRJ‹\\ñŠÙµ¶2DAÉ¯›{Ÿnž€ú“µ±™\×\Ë8\ãð¯)…%\×5G/R!Ò½®\ãB[\ë#\Ý%p+Jð¿ö*##6s»Ö©#&õ0m¼8\Î9\\AW\']3\Ãñ³°R\ç£\Zˆ¼Qa [±iP¿!žZ¾~\Ö<Q¬Ý—›& ~U\ä\à\Öôa\Í%sƒYÂœ¹\å\Ð\ëuýuõ96¯Ž•Í‚¤ð¼g9ªow}8HÓŠõ3\á\æµ\n\ÍòF§¦\ê÷\è\ÙE%²>J½J²œ“m\îy\Ó3À§£\á\ÔW¦\\ü/×•	ŽXd g¸Ïµq÷^\Öt\æ?iµt\0ý\îÂª£J-¶gB…_i \Îÿ\0Áó~\èÙ…z,ºŽ\Õ\É¡¯\ÒoeÑ®#w\'aÀašö;{›[\ëa\"\à†Zùšú\Ôlý7ÿ\0\Ù\ášE\åœ1Ž3Z¢\âvŒ!Ò±´û}=ŸÊš6\È=A­Ù­tô‹‰d=«+\Ä	9÷ƒ¶µ“Uiij\å\rº³a&z˜G\ä_8\ëš:™Í‰­Ï¹žq^­jº²^e+©\0\ä­wþ\'ñ%½…»)` ¹\ï\é\ÇYº¹~O«³Ky4y˜šÍµ3\ÃúuÖ«|“_–c»’Ã“^\Îtµ²	´avŒV„¾önm¦q(\\«z\Z\Æ\Ðõ—™ôS\å™[\nÆª¼5\Ú\Å\á%x»;¾¦\Äq’=*\ÏÍ´ŒÖƒX\Ëj6\È1\è\ÕDA\ë\\n=µ#?Tf\Ô\Ü\r]r«ù\ÕYõlSsž\Ê:“DlUS±\Ïø“\Â\æk@°ŽUs€y\ÍA\á[«\í>5ƒ,\É\ÝXp{W xr\Æ\âþC}x…CF§°®½\ì\ìb]\ÞRw\Å}³…¬|n7\n§ˆ”¯«\Üò_\èþ»\æ¹Ó’&*s\"|¥;\îWŠ\Ù\Ûió\ê>M¾ö‰)\àšõÏˆ\Þ!¶·¶k(\n‰fc°õ\ãz\r„\Íuß¯8\î+‹‰R\\ˆõ2l®Q“®\ÒK¡\ìö–FKT\Ø\Û]G\r\î*hµ‹û)w01\ÇG^sWt¸Š@ ö\ê*üÐ£H\í^gÔ¤SmxÈœ$§ÓŠÃ¸žþð«\å)\îkª \08ª\Æ\Ï5\r…Ž^kµ‰˜|\í\ë\ë_9x\Ñ^\ãPŸ/zúwUuŠƒŠù\×]¼I/d\ß\çø±‘ZPv‘\ÏZ’©‘J3\Æ\r\"³gŠ\ÕÖ£DZ1\Ã±5‘k\ÓLðjC’M1°y\"A\Ô\Z\ï\à *\Ï¸]5’\å{¨\ä\×t¸Zõ°Z&ÏÏ¤¥8G²,†#šÏ½D²dcŒzS•€Â»ùÏšö`_iÀ8\ÍFÍ¸ó\Ðw©\Ò	®\äd’z\Ö\äz\Zˆ™¥›\ËÙŒñ\ßÒ¹k\â\èÐ·<\ís\Ó\Ëò|vc\Íõz.j;½‘\Ìÿ\0€«–\ÖfA\æË•‹#&»m#\ÂizK¹\Âp}\Å[F¹\Ð56·\Ô-\â–\Îº\áx5\å\âóxF£\ï7×±õy?b*\×\æÆ®HEü	\Ý\Ë\æ‹ún‡nºT—q\Ç\ã`+¶=+*\ßjhb¹³{9~\é#×§jÕ³VðÆ°?üK¯Ô¾r2yƒ¯i¶š_ˆRYc\rktÅŠö\ç­|\ÍZ³«\')6\Û?PÁ\á(a`©Ò‚„R÷R4O‚\ï-\Û\íZ¢\\Àß\ÔS ñv«§H¶úÕ£\ÂL`\×I†\Z\Ëý+D½xKr!sº7¦I\âv°\ëöknùûì»£pk3¡\Ùî¹«+\Û{ûtž\ÐÕ¢85“c¤\Ù\Ù¸Ó¦\Ìõ`\îOªž\Õ`Ý®*na(«‹(šÇ™pkQ¤Fª`’Gj.C‰LF» tªº\ì/ú„I\æ5³e“yOZ¸\Ü\ÔY·^k\0Q\'\'\ã\Ç4®Tb\Ó9‹ø´\é-Z\Ò1\Ä\á\åE\ã\ë‘P\ëN,µ\r?[‡ý\\\áw\ãÖ¬\ÜhÏ¥\ë1\Ékó\Ø_|®£»oCR\é\Ö\"÷K\Ô4y\Ím!Ùž\ÝÖ•Î”¢E\â|–¶Ö­@xœ:\ç\ï)©L\ínöWPm’\Æ\ìtoùf\æ«øbQyey¤\\ýôG\07oÿ\0Q©<-\Ô4ýGGœý\Æ`‡ºûŠµ9.¦R\Ã\Òw¼Q¼\ÚD³^I–\Ñ\Å®b¸C£\nä§¶–\Ö\âK{ˆ\Ìs\' /¨5«§êš–zšF¬K\Â\à,R÷Pz÷sU¸‘š[Ð­<`½¬ý‰\Ü}Ew\á±H{\Î\×J\Ìð3\\¯\r,5f¨\ÅIE\ÉJ*\ÏC‘b:ŠT*MB¥\Û\ëŒU¨\ã9É¯¨‚?)ª\ì\Ë qJ ‘‘Ú šc\ìµ^\Þõ\'$(\"º\áŽr4¢w®)³\Ï,G!½±šžÁúÕžHo˜Vñ‰\Í)hc5\É\ÆöS»®\Üs^?\â[\Ósª±\ÆCn+×®\ä\Ø%qü*Ns\é^}t..\å”tw5Áv„Wv{y7:õ\'ü±·Í–-#i\ÏPj\å\×ön³\È? u\'ý\ÓÖ±¢r‡¯J±\'Ì¸\îkÇ’º>Ê›q’ktÏ®ô‹Å’\Þ)£w\Íl½ø·\å\È¯ðN¬ö\Ú}œS\ç\Ëdù_·\Ð×«B\Ñ\Ü\áˆÎ¼i®Y4}mó\Â/\ÈÔX°•2²£œS\ßQ³rÀ\ÖlP}‹w“\Ø\í’\0«òMhÉ¹„[¶ÿ\0v•®gÍªY¢œ¸¡\Z€drA¬›˜–\âp\ï\ZmS‘\Æ+^\Ö\à\Ò-^YHrTw>Â…\'dcVª§Û²G-ñX\Ûp«ü\ÎI?A\\§ƒ-‹K-\Ï<ô®J\îþ\ã\\Ô¤žV?7;(ô¯SðýƒXé‘¡<·5\î\åôd¼…\Ïñœô¥gñ´—¡¼Lb«³«7Z˜&\ì‚1LDœ-{v>²¹nj=\Ù\'Ž\é\\\ã8<\Ó\ã]\ã\ÐÓ± •š8\É^£šY\Þ Xm\É\àUŒÁ4ò½2>”\ì	»œ/ŠI\Â}Áš\çt?\ê:q\Ç21ù7\ç\å\ÏaŽ\Õ\ê761\Êw|¸\Åy.³£\Ü\ÚO#,.bfùH+\Ê\Ç\ÐR÷­t}^GŒt\â\éß•­S=wÁz\Ìz½™Ý…™\\\ïAÀ=«\Ò\Ôn‹òÇ†u+/U‰“?6§°¯¤4\ÍR+˜A\Î¯š\Ä\ÑörºÙŸ¡eØ¯kN\Í\ê‹	¦F\ç#•±m¥F\ã\"w¾jœ\è&û¼ÆˆR\íz\ÈZ¹T¹u¤Û¦¥võ¹÷µ\Ý\ìŽg\ÚONµ¯2]:ü®V³\ãF·%Ý‹Ôš`Iuµ#9n\Ü×†ø¯\Ä7vš—“c/—±J»€wvæ»Ÿøž-.\ß\0†™ó±­xNó;¼—v$“\Ü\×f\Zý\æ´\èx™Ž*ÿ\0»‹×©+Ü“’Ns\îk§\Ó\åi \\’OBk‘\Ü\nûg\ÑiD\Ø\í^\Î\ÚV>C4‡=ö7ÀÈ¤lÇ¥#$\n‰\ÃgŽ+\Ð>Y¡x \0\Í\Í/–\Ûwv4@¬J%}¡CT$\äšBÃŒ\Ò)6R@x«\Í2\Æ	Á\ÍJ\Ý\rg\ÌI\'“Žõ›gL¨É¸,A\ç$ú\ÖÞ•\âI¤Š\ËOš0D–7\Ï8<\à\ÖW•\æ\ÏLVdC\ì\×q±;v0<úW‰¦¦µ>“,¬\éIYÛ¹õf…p%·\Õ\Ù%¼R \Ï5\å>¸8\Ø0\ÚG®k\Ó-§ùz\×\ÏOF}õ)A2[ˆ¡‰p*œ œt5.¢®\ÑnëŠ§„\Ã?A\ÅA¹œa\rp\Ç9É©\r¬||¼\ÓJÿ\0¦#«u\àŠ½9\ç\'ŒSJ\Æ=ù†\Ú\Ý\Û8\Â\çò¯š¦œ\ê\Z½\Í\È<4¬py¯eñÆ±öM6`†a´W‰\é…X>\"½L\Z¼»Ÿ+ž\Õ\æj\ì\êþf\Ìy \ä\ç\Ôl.0:Ò©ó^º\Øù¹>ƒLw\Ç$\Ór8\Î;\Ó1\Ï4\ÂÀy\\Žj©\è@\àT¤\à\Ô\äšXe#¢”°‘Mf\éP\\Qƒ÷^Mb]cž˜­k‡\Æs\\û¶Mg#Ò¡\'¦\rt~ÕŽ™¨&óû¹>Vö®pœ““\ë].kkvZ\\»\Íc8©E¦wÒ“„\â\Ö\èú+NºŠx/ ŒŠŠ\àK\Û÷1‚¼\ëB¿ŸE¼{)˜\É8zŠô\ëwK„ùH*{ŽkÆ©g+M‡«\í`žÏ©r\Ó\äL‘ ªwoj>XL…\ÏJ¸4\æ\ãi\ÅYù=k3 Î¶óPfR¿¥fj7Q %ˆA«—×¶öq€:k\Æ<E­\ÝÞ«CR<ŸœðH­\èQ•YX\â\Å\â\r\îú#\ÄZ—\Û\ïF\Ì2¡¬¨‚;\n­\Z>\âH\ÍZQ\ï^\ä)¨E%\ÐøüEGRr“Ý–!<ðiLÑMQ\Ä\Å\É\íJr\r4d\Òö¦Œ\Øü{\ÔÀ‚6ŸJ®\Ì*lòjˆ-)8jöO…\ÜEwž ŠñPÄ€+Ù¾n0Ý’†\r9l(|iž•©e¤^\0¨†~¦¤¿ J™\î8¨\Î(Ž\Æ\Óø‡\çÞŒŠk”\Ì\Øüâ“¾) ó\ÏM1\ãƒQ\Ù)sI\é@\0/ž¸þ3L\àRd“·Rn´¸šM\ÜPR\æ¢)\êri\äŽÇŠk\Ð\")#$z\â«C:‚n\Ü\Õþ´Ò šw\Í|C\à\ëY\"’\â\0C`+\ÇÍ¬–÷{y+\êy:”\ê¯&ñ„–—a\Õó¸\ç…yZ7=,\r\å.RŽ‘rÀ\"·Wem*²\0­\Îkš‚\Ä\\EHn \ÕØÅ£\ÊO©\îkÀ«nf}e¨£¤;ŸŽµžúl²9\Î*X/P…\É¤³G·#ûµš7½Ž:\êÀ.J\Æ3\ëŠ\Î-”ò1»\×[¨M\ÎG\'Œf¼\ÓU\ÔA¨qŒVôc\Î\ìrb«{8³¡\Ð\íº9/r:×«Û¦0~™¯5ð5œ\Â#+©±Ï·µzlcc§\îR$>;QÔª\Û.‡\' ‘L\ÝÀ þµ¡ñ¦;\âœ\Ä\09 €	DTfš\\pA\ÆA§\íÁ\æuõ\î‘Á\Î:T<\ÔÄ€]ƒo(\ÇsLL”ó\Ü\ÒsœR`“\ì\r;9\ëA i6\ç\àS\Çæ”ÀŠW%1\Î4¹\ä\Zq#4‡\ç§SJ\à)ˆnù¦ü úu\Ç :\çÓ­\'\Þ\'9\ç×¥KcC\\)nqšS‚\àgñ\Íp\'Žù¥\Î?CBb#(\äô\Å\"Ž:\â¥\ÆN={š6\î\Ï«¸¬\'*\Ù#Š	K·ŸnM7\ËÀl\n.PœA<I\Î?¥?#\È4¥sŽ(¸€F\ï\\ñ\íFOU\ã¥?w1üqÚ˜wsžpj[‡qc\Ç\çBûóŒ~´ò‡§¹\Ïz\ÊNÀ¥qØŒ¨;¸\Ï\ÐPñŒsR\à\í8¨‰\ç\îö\Ó)„\\ð}ò*\"Š pA\Ï\áS²ó\É\Å5\Û=;Á§qr™Î™\Ç\ËÁü1AB\äñÚ¤\'-´\ç\éQº’7)‰¥\Ì£I*\"Œ\ížÀT džrx\Çjz®zc©©r-Dªª\ÝD6Hâ•–YÂ˜\ç¿¦Š ds\Ç\é\éJÃ’¬¥#¢œ\n\Zs±g®zVÂ†.>µR+#de^÷•\Ë7sÒ£$l[2\ÈÀ>õ¦1ù\Ö5°\îkXaG5‰Þ¢\Û9\ÎEr~$¸+b\ÊNÏ˜EuŸC\\gˆ¦I1”ù™\Å}&!ûŒñ(/ym#1VÁ=z4ù°\Æ\nµq\\\Z fQ÷yûŽ\Õ\Û\Ø\ç\È\"¸©uY½\Ä…xßŠek2®FZöhò\äb¼+\\múÁ?9¯_ñü5w¤—y	\ÇNzóL8¨Á©\ÕF\Ð9-Aq,1&I\n\0¯VsQWg\nnODU¸\"Œ±\í\éSi	7Ì§\Ø\×79šùðŸp“[\Zm´–\Ãi\èqŠð1ø•Uò­‘õV\Ð\\\Ïvt³L6¥s\Ï: <\ä·\ëS\Ï&À@\í\Årš…\Æe¹ö\îk\ÌZ³ØœŠú\Õ\Ú&\ær«\ÇõY\Ú\â\à\ç8\'Œ\Z\Ü\Ö5G“r©\'\Õ\Í[\ÚM<œ)lþU\ßBµ<¬Ew-­¥iw2…V=2qÖ½\ßD\Ñ`\Ó\í\Æ#\Î	¬?\è­o\n\ÌÉ´\Ð\×aqyª\çøV½ZVJ\ç“Y¹;\"I­\ã•\nüW\ry\à\Ëg\Î³ž\Ý\ë±\Ó\î\æ»;\Ú‰\Û=ME©ÁnN÷PzŠ+¸\Ê\r1aù\áQ5¹\Æ\Å	·p˜À^•²$ep®yµˆ/¯X®0?ŠºX¶\Ë:\×\ÊÔ·;>\ëwN/È«Ä—`$žÕ´4[²€—L\Ý\ë	d{I‹‘ô­\ÈõEt8C\ÏNj\Ðg^i7Pr%UX^\í©;\ëWgžIˆ)°# %\ÎI\ìLŠ·Ï¶6>¸\ã\Þ,ºRqœ\×\âfdu\Ý^E(mBrH\È\Îwa0òo™ž.?ù\Ì\ç\áƒ-¸ŽyÀ­°–R6gµtP\è¢‡Ûp+©]:[?1\Ç\Í\èk\Õö\rGS\ÆX•)$\Î\Z=,)D8ûÜŠõ}*\Ì\Ãn‡$Wo¶\æð‡\æ½{Kƒt8\ÇA^&.I\Ê\Èúl9F\ØX\ß4´ñŽ•\ÚZ\Ë\æ¨$ƒ\ë\\u\îœ\Ê7 Á\ëŠfŸ¬)%ýk3½\Üö©2FsY%Æ› 1žœŒ\ÖÍ¥õ¼\é\Ã+qU¯V	#e8\éùU&M\Ì\ß‰„±#\Z\ã\äš\Úö]\Å\ín£µO­\"À	\Ü·\á^U©x¥-7ElÛŸ@\éZ¥s\n•:/ø‹\ìP‹h[\æ<q\ÔU?øÁ´·\í2’\Z\ã¬ mF\à\Ï3n\ç,=k©º\Óm\î-ö2Ò´F	É¶Ï 4]SE\Ör\ÛIq\Û<Š\î\ã™ÀT<Zøj+O@»\ßÍŽ+^\Ý\áOŠžb,Wƒp\è_¿\ÍvR¨\ârÖ¦ª3Ûµ;\Ôm^1Á#ƒU´\î!µ{y\Ô\æ&!s\ÜT\Ö:µŽ§\Éo*°5¤	\çTt¨%¡Ã¬1±®y…¬°2:M]\Õ\'a\Õ\ïXÁ\ßŽ+	Vl\é†)\ì\\\Ót+ª[ g9¦\ÝZDóp£ ±\Ï$N!õ\Í_µ\Ã\îfžÕœ§tt\Â	F\Î \n)©÷nˆzz\Õ\ëÖ´‚A$ƒñ¬y5f-\å±8¬¹Õ›ˆ\áBxú×–ø\×Å†\ÊHreeÂŠ¹w¯˜-d\ÆBœW;\áÿ\0\É\â«ñ<ùòŽ{VÔ©¹œ•\ê(§c\Ä\Þ\ÛS\Õ\î¼û1\Û8\ÞG\Ê=«°\Ót˜#\n¥yõ\Ç&¾§ƒÀ\Ú\"\Út·P\×=I®bo†šjL|›™{®øa¦\ìrG†³R9oø?J¼…n£nÁ¯k¶´\Û\n¢Ž€?\nÁÒ¼;“\Ô21=I\èk©Yü°V½\Zj\Ñ<lO$ª7‡:$“À¯ñ|\í5Àƒw,TW«_^+Àû-^¬¥üw·\Î0™\á³Ú¹ñMòÛ¹Ñ—ÒŒª¶ú#ò\Ò\Ý\Ók\àq\Åu\ÚfŠ5còŸ~•\È\Ûfý—#\å\Îs\Û\Ù[\Û\ìƒøW‰=Ï¨£‘\Ù\Û\é\êø`\Øj\Òm>}¼œ€k–²¼\Ô \\ló1\ï\Íib\è®<—\É•\Í\Û$¸	k“Œc½p:þ¼\Ñ#ˆ†H\Íu—0\\^e%W®\Úâµ«hŒ•ETuh\å¬\å\Ê\ìx&§¨\Ü_j%§‘œ\îùWÒ¾€øa™\0\ä 5\áÚžž`\Ôj\Ê\çw\Þô_\Ã&@¯·µz\Ô\Õ\â§&\Ï|·ˆ¹\î+“ñ?ƒ\à\Õ\ãAû«”û’ÐŽÆ»hWÒ ¼¼[X™\Ø\à[T„ež\ÆTjT§Q8\îy¿Š\ç\Ò1¥ø†Œ™	pAß¸¦\Ýkúdy\Ùw¯ð\á…s\Þ-ñ!\×Y\ì-¡ŽDŸj\ç4\ï	\ÞC{WQñ&68\æ¼i¹9Z>ò>Â\nJ”jUýÔš»Í›ýb\ãQ“È°V,ˆþU\è\Zð£\Ç\å\Ýj\É&2¨\Ü\í®“D\Ð,4ø\Ô[[ø¤5\×%²\"Œòk\Ð\Ã\à¹-)\êû?4SN\Ú=d÷f\\÷\ÛD[UúW‹ø·\â<Vû¢±o2L‘œp+\Ü\î\ícš6\\pE|÷â¯…šœ—s\\\éEd919\ï\ìk¢¿:‡¸?¨T®•whž+¨\Ý]_\Ý\çý\ë¿,CW¤x\n\Þ\Òkè‡–\èy\ï‘XGÀ¾%´ó\Z\æ\ÌF€ò\Ù\ÍiøcWµ\Ðõš\ãs 8%kÇ¨\Úvg\ÜQ¡\n”%*-N\ËK¿,F\ÞFL\çœ=è¸½´¾EºµK\î;}ibd\"¸\å¹Ì®·+Š«#\í«2c=x¬mGTÓ¬\"2O:¨ýjnŠP”šI6r¾+¹Ž\Þ\ÂFwÛ»\å\\úšð\"»0û\ç\'\"»\ÏkVº\ÝÊ•‰¼¨¸\0œg=ñ^}<À\åƒ<jXpÿ\0tþ5µtN²¦”\ã«:øsMñ\Ïoz‚@P£Ž}ERñ\'Á\Í_L&\ëIf¼ƒœ\Â\Ø¡\ï[>¾º\Óõ8$Š\ë’Àö¯§`\Ú\È2¸\È\nô¨«£\æ38òT\\»4|9¤\Ø<\Èch\äRC«.\ìkª·„1ù\× {ú\×\Ò ðV•®‚\å<™ûJœûšð\íkÁº\î†\ÒŒ\Ï\é2Q^\Ætùl™ð9ž\æ\æ\ãx¾¨å¦\Î\ÖP3\Ç5f\Ö\Ö+ž7¶{\áj™G\Î\Ü~\Ñ\é–R$*\áre`,^&8zR›ù”esÌ±¢´Žó}¢L\Ñt]3J\Ò^ñ‘™ö¥»S,4˜u;yÛ…4„Tž \Úi\Öqœ4›PU«»‘¤xy\Éê±…S_#^´«M\ÊN\ìý‡¥‚¡\ZT¢£±JÙ¼R™\áš\\˜\ÛÀ¬ý.\Þ?xgÉ¹c•%U\ÏU#¥L™ÁŽIå‘›žù5†PCá‰‹w7¾@®i3ÑŒlŸ©•£f\î;j-‡C›w÷5v\ê\ÒmkF¸\Ó\î8¼±l©\îÀtaõÌ–žM2\rI3\æ\ÙË‚\Ýö\Z\ío\î·\ÛYë¶£;@Õ“¿\â\rgsgtÕ»™~\Ô$\Õ4y¬†9\àFÃ‚¢©Á­\á.—®\Ûù\â\"W\Î•\ÇsŠÎ¾‘tMn\ßR´8·ºù‰9\ê+_\Ä1ý’\ê\ÛZµ\å\\(—\nö&‘¥•öÜ¤t]gIfº\Ñ.ŒðuTÝœLt5oMÖ¾\ÞÎ’!Št?<f£¼¼¹\ÑBjš\Íg8Hsò‚}=+b\ËQ\Ð<I¶@7Š:\éž\â“\"j\ê\í|\ÉD¼dš„\Ôs\Â\ÐH\ÊG\" –\â¤\ÂÅ·Á^{ŒWd\Ã\\ŸK»Q$7€õ\é\ÏJë¤ž+xšYN\ÔN¦±µAßˆt‡G\0”ÝŸaÈ©L\Ö?\Úh©y§H\æD‡kÛ³u\Ú{¥K5\Ò\Ø\ë–7\ë\Ä7±lrºƒF¥£i_j<¬³\ëŠÅ´«xn\âÛŸ>Ì’ž¸Eò¦®t\ÖcNñM\ìaDw„«\à`o\Çõ¨´1öO\Z_DF<\à\Ø­i\è\×	®\è¶\æL4°:g\ê\rgj\n,¼ke <N©Ÿ¯J´…»q}O\ÙE®YJ\Ðd\ÜY>q\ß\ÜV}ƒC\â\í.$.Q±#{\Ç\äj}nk\Ï\ë	ª \ßkqµ&\\t5­Y¶•sˆ4¢2‘¼€Ÿ_cZEÙ™ÊŸ<9{\ìe^\é÷S6ô ƒ\Ï\nMzõÍ®¥¥G¬D…”.\'\\r£¡\Èö®\ê%Ž}Ð¶\è\Ý)ö5õY~.5\×#\ÒI}\ç\åC‘\Ô\ËÛ¯\ri\Êvkù[&¤±\í<æ Š\Ê™\0Á\ê)ñ»«\r½M?{\Zö ¨\ÉSr¶;\nt°j ø*­\×5FyØ±Q\ë[Z\Ç3mœ÷‰/\Ä6²\r\Ø$`s^66\çš\ì|W¨G5\ê\Û\Ä\ß$g\æ>¤\×\à9\ÍxxÊŠ¥V–\Ñ\Ðûl—\èa¤­*žó$ ÀÀ5adóX)<\Õ0Â—¡\à\×G¹Ï¥¼¦\Åq¡Ú£\È\Èö®·eÖŠ\Ã	\æ\Ú\çœ™++\áò\çC²,\n\æ!{\Zôï³‡•\â\Ô^ûõg\ÕPþ}—eymr’E \Õ÷¶·<•SøW?w À\Ï\æ[»\Û\È	9C€~¢²n­õˆc!¯\É_÷9¨f÷°kÚžž0\é	ù#Z¾fñUö©}¨™oA’\"\\| Â½\åô\ã™3±’GS–c“ôª:æ—¥\Üxb\ÞY0@0#’ý\ë«z–<\\\ÖrmlžÇŒh\Úk•2/\îò0=G­z\Ì¬J8\è+\'È·ž(\Ìj|½£€:WKœòÄ†\"N@\Å})Ð¡$™ðx\Ê\Ülœ£JM.ˆª$\Ù\Ïª\É!þµ \Ö\0Á•”¯\\Š¡q^3Öº¡V•Gh\É3Æ¯‚\Åa\Õ\êÒœv¬S)ñŠ²üMfn*q€kb\Þ\ÚI\Ð„f·²µ\ÎH\ÆRc9\'š™\"‘°p@\ìMm\Ú\é`¡ór8­d·DWo\Åg)¤z0R–¬«i§\Äð¿¹¬\ÝOH·ÌŽä—‘\ì+¤‹(@\è)/\âYbt\ÏðkŽn\ìöiÐŒ\"/_\ãN‹T¶UVÝ»\ïm\Î3Z‰cq\Z¬¶§ŽCZš7‰´£l\Úl’3B\Ür¯\ØÚ´ô\ÅMF3´\î¯1¥(û\Éh}^K^\rr7©›g­</²\åJõ®¾\rFÍ£\Ü$VZÊž\Æ)2J)ü+\ZM×œO¡\Åxos\ê\â\ÚGe6¡jªC:/©\ÍpºÆ¹¤\Ãhw¹\êÝ…W›J‡$\Çj´–R»F\ÃN6¹5œ]/\×t]^\ä\rC\Ëi£v(6òF=«x\Ù‡VF`‚\r}¥\éZ}Þeª’#Xpwz\æ¹Ms\Â\ZUûftv*wF\à\àñ\ë^½\Ê\'\Ë\âw3\æýŒª\ÃøVÎš\â+¤¸9¯d›\Ã\Ze\ÔH\Z\0\Æq\Z\ç†^\ÅÌ¶Q\Ë\"¨\Üx\Î~•\×I5$y¸©)R’\îˆ\à`M\É\ÅG˜Å—\Ð\ãÀƒN+\ÑN\é\'8r¶;$S7zR°\ÍGœÒ›±\n!\É\ïA5¸\0ŽõœFGµC’FÑ¤\ßBf‘W\ïd\äò3Ž*›\Ë\ÅGqtªsŠ\Ë:‚ \î99¬%Q#º–\Zr[B?“+ŠÅœ‘À4«¨‚\Ø\ÎAq¤ŠDT\Är:û\×5Y\Ý¾(\É\\\ï<){ugk7Q¼k\"“\âP{W­Yß¨…Xjó[K»}e-\áA¶;X¶D{\ç¦kjÀ\Ím\'‘7\Ôz0ö¯\n²¼›>\Ë\nù!\Þ\èôXõ‹\\a\äU\Ç5\Þ\Ù8ÊEa’DÈŒ~\\\Ó%ò\È;¡\éXXôbÍh„W>™Á¬\íGTO,\í#¦±\Þ(\ËohÀ\ã\0šòÿ\0ø‰¢?cƒîœ‡`yÇµmJŸ<’9±U\Õ\ZnLÁñn¸ÚûB„ùQ63Ÿ¼Â°´\É\' 5”\É\Í\\¶¤\è{\î•zô\â¡d’\ÄsTRrwl\ìP!¥\'œŽ¥¹¤0\r(\Îk­‰&H\æšp¿^¢ƒ\ÔS‚GµRˆ¤nN:Tz\Ô\Òm#Š‚›„8ö8¦“­8d¶9\ë\ÆU¼‘\àF\"2OM\Ø\àVlÞœ.Ì›ù‹I´\àUQÖ‘Ø±É¨ò{\ÖM\Üõ)Ç•Á5\Øhv—®þd\0nH\Ã\n\ä\âP\Ò\0{šõ?\Ë”4ŒÈ¯‘\Çz9[‹5M)+÷4ü7j\Í\ç”³Hr\áù®´Ay§öƒ|Y\æ<ò>†¬X\ã˜\Í\0ùd9>¹­˜\Æø\ÇN•\â×¿;>	eM$Q‹\Äs¨¬\ç¾5^\ç\Ä7S±\Ù\É\èI\ãõ|\Æ\èH^™\ç5–\'“X-³’¼¶kƒ\çÝ¾XªòŠ\á®H	pò \n§\n¨¯I\ÔÔª\nÇ¾\Ñ4m\Å»‚\ábk¿	+I&y8õx;J\ï¹q\Í\'Q$l­\Ê`žOÖ¦F\Ø>\àa\èÆ¾Bñ>V¡´Œ9­Hma¼;b}’s„s\×\èhº\ÒuM¾u¼ƒ?\ÄEg(\Ø\ÂFm\'zR6ŸL\ng\'š‚lÇƒSj¸\ëOBsA<¬”0 t\çšö¿†\0ýž\äg\'~Mx§M{\Ã\Â+\Â}F=¨ai#\Ò\ï\Üy\é\î9¦©û\Ïõ\È}ª>qN;{Ž-@\çŸjnh\éL‘M\'#„ŒTE€\\óŒP+dSK\íüs\\¾µ\âm+FŒ}¦\ào#„NI¯#\Õ>\'jS–Q$(z\ÉzNI\ZS£9\ìxš\é\" ³¨ \'z¥¼±eV9\ìE|¡{­\ê7\Òž\âGcŽw\Z¯©¨@sÌ«ôcQ\íº\Â\Ëù‘ö:Ü¡b28ÿ\04\ÇJù‹Mø¬Y²,¬%ŒpA\ëŠõ+\ÆúU\â.e\ÚÇ±\âª2LÊ¥)\Ãu¡è¥zPÃ¥c\Új–\×q+£†^\Ç<V‚Ì¯Óš³$ZŒfŠ®7{Ô¡˜\n‹š$\ØÉ¦KxžG\è£5\á\ÚÖ³.¡©6h/ŒgŽ+Ñ¼_5\ÊX•S„jñMß¾/&H$\äûš\â\ÄN\îÝ¢\Ë0Ö‡;Ýž§£\è¼gÕ½Mt¦\Ù[,G5\æ\Þ\Ö\Z\'Xd#…n\ßJõy–D<\äv¯\"¢´y+#.]:\çnt5‹}ñqÌ¾œWY)85‹r†F\ëŸÂ³9‹k‰P´³´\ç¨S\Ã+t±<XÁë»¨®’\á6F@\ç²\ì¢¶W’‘«f3\ëÞº¨»3\Ï\ÅÃ™ö™e¥ºF coP88­u \Z¸¿\ëoóº‰®\ÅJ6õ\Í{Q\Ò>R¥9BRL±ßŠS\Ç4\Ð\Ý\ÈúPsŽ9«¹˜™\ä\ÐA\'šgJ@\Ç<v4\Ä\Å#8\í\Í4qß§·Z8\Í)\ç9 CN2=i¤a¹õ\âœy ÷\Ç¡1Œö\éM0Žž\Ô\ìŽ)z\àûô¦0 zŸJB°\á\Í™\Í=¨8\0s\Üs@X$\\÷£hÇ¨\ëN\àò}z\ÐT\0v\éJ\ã±\ÆqO({\ZR£\ã§5\n{\ãÞ¤|Ë’y\âš@ü\ÍI’3\×Ú‚CPKC9\n^Xÿ\0ži\ÄñIÒªã°Ž§\ïH<ÀA##¥;vž	 ª\à\ëœR¸\Æ`ž\çw ¡F\çÓˆÝŒTŠ\08\Æ	¢\ìv+³|\ÍÀ\Í<Œ®\Ó\ÐzÔ£#œb“\0b“ab6A?J\0\êO\×5&1\ÇZk\ÏZ›±ØÄ¾¼\nL\çž9=»S\Ø3ry¦\ÈUG¾x¢\áb»|¼c9\æ s”9«E‡ òzUR8N\áb©`r8W<œqÖ¤uÁ$´ˆ1R\Ø\ÔHÅ¸H8$bŸ\ÆA<‚:U¨P\È\Ç\ÐñSÈ¬£\È=Iô¬ÜTNsR—T‹\Ë¨…K|\ÇÒ®Û¬\Íó\Èp\Ç\ï\Ó5m\ÈR2zšx\Î:Vrf\ÔÖ¦|·\rorTx8V”móµT”¥Fq0Ö¯0PFs\Í`\Ù\èS4\íq\ë[ƒ[‰=sŽ™5´¤\ìj´}\r( ×žx‹c\ê¶J\Ù\06F+Ð¦$ô5\çZœK6½þ|¸\Ï~æ¾‡ý\Ó\ÇÃ¯xØ†\ØI29\å`k´µz\×3kÎ¤`zWOi*EsCDmSS^I \ç#i\çÓŠùú\êV–\îW$\ç\"½\ßP+N¹sÀXÚ¾o½¿†	\\\î\ÉÀOÖ½5HÓ»g¥*Ž)#M\î£BNx\ëÉ¬9mJB¸`…U‰nµ&A„\ÏA]•­²C\Z\à`\â°\Åc\\ô‰¾/P÷¤ˆ-¬£¶] sÞ¬1E\É\éR\È\ã¾+\îùUXä¥yªòg°\íG{x˜#\'\ËI§\Ý\ê\Ó\ãV95\Ñ\Øi7:´£‚©žZ½\ÇDŠÁ\0ˆv\ä‘Ö»h\Ñl\à\ÄVQ8}?ÁVvñf\â5•\Ï\\¨\âºih\á–\Ú$=° bºc/Lm«m¹r«Ñ„TQ\åNNLÌŠ\É` \í=x\â«]\è6÷“Ç…À\ÎXg­t‘Fž\Õ~\ÞØ¦	\0\â®\ä¨\â\éPÂ„\ÇW„xûH™/Ë¼¯\nú}\á\ç§ô5\ç¾(\Ò\Ò\ê&½k\nòýÔŽŠýô\Z\îx—bLdŒŠ\í,n^\Èr\rS´µkYŠ78l]\ÛEqu\ïŽk\æ\æ\ï&}}(òÁ#Z\Ö®>Wü+]t;\'\ÎyÁ®.o´³\Ó\ÌAÈ­\âýƒ\r!#ÒœYlßº³µ¶S…\ìy®+Z¿ò£e‹–Á\àR]ø’\âõŠF‡’~b1Vt!\ï\ï\å\Ã\Élô\ÍuP‚œ\ÑÇ‰¨\ãNM;YnxŽ°u!pE\ÔOî›¹\ëZ\Zœe–?”\àW\Ñ÷^\Ó\ï$exU\Æ:\reÁ\á\'&#9\'ž+\èiSQHù\n\Õ$Ü·\Ô\ç­t”1)Ž+‚ñ6¦dŸ\ìÐ¦\ÔC†÷¯jº³u€\\qƒõ¯žõh|«\ë„I\ÝÖ§RÔ´4\Ê\è)b—2½¶O\'\r<×¶\èAg€H½p3^	\n=O©¯Nðf§!À\ì¸8\Å|\Õ]O»P´4=<Æ¤@®P\Ò`1\Ç9\Îk¥¨\\\äw\í\\ö!žs2^i¤ˆ$#9¬»j0\0Y2\Õ\Ø\ÞÀ$\éŽ	\ä\Ö)\Ðõ˜°\'·¥\\Qœ‘\ËOk}\â+vi\çX‘»)\ç\Ã_øZ\â\Úl[Ÿ4g\'5\×\éò‹\rJ{YÜ®T{WG3@¬¯[+£šJ2W<\çM‰\íII¦~µ©uv‰\ÚGz·ª¥p\ë\"ö\ÝÞ¸Nh\Ò@7¡PsÁ\ê\rmcÎ’;?Áoytr»ƒHö¯GÖ¾XÜ´Ø³\Îc\ÛÐ‘\í^C\áŸ\é¶7QIs\"ª\'Z÷‰¾Ÿu…õ®ªI[S“9+ržyau¬øRõc¹«žgkûŠ÷\í\Äj6¡\Ë•\ÍqWz·†õ\Øv­\Ü¸`@Á¯67þ½1‡&\ÉC\Ôb¦¬-ª/\rˆ»´x¸ºK«\Ç\Ó5~Šx5\äº>¬.§\äòMzÅ\Ðh\Ô\çµq&\ï©ê¤¬š.y²U85VKˆ \Ü7Œš¹‡Ÿ~•\Ék@3d6LS\ZÐ½%Åµ\È;˜\Z\äuw–9G\Ù\ÈN\ÄV1Ô®m¤e-œ“Š\ë´\nó_‘\\‚Ž²7ô¥:nMhEJÑŠz˜>\Ôuû…o4\")Ë“^×¤\è\é¤Y$¨Ï¯­kiš-¶•n!ˆ’‰zÚŽpH¯^…Á+\îx8œK©&—\ÂV´…˜|ù­FpOJ™…L½\rtœ—l¨c°®C\Äz\Ø\Ñ\í%¸1\ä \Î\0®\Øõ¬=WHµ\Ô\í\ä†t\rƒk\nM‚Z«žsñ=®\"ùl1\'8\äW$Úö½.Ë“\ËQ…¯D¿øO§Z‚ñ]Hª	!M`i¿a°\ÕE¯–®\ãÞ¼\êó’vg\Ð\à©Qq½8úŒ—AA$g–·m¡Â€F+Rò3%\Ó\Å:Þ•\åTn\ç©X¶…=qW„«\Ä=;b¤žt…I\' ¬Ö¥2­ü©\ndœq^3\âKø.\ËÂ„žEt>$×„€Áƒ‚w=\ry\Øa<˜—’O\r\ÜWD ThJJ\íhf\Ãdeš=ÁŽ\Zú»À–k\rš0+Ê¼) ý²c¹U€^µ\î¾´’\Æ\ÛÊc‚zšõ¨\'k³\Ã\Ì9!7t\Îûšðÿ\0ˆž+h\ØÁ!\Þÿ\0{Bšô¯\ë1i¶R\È\ÄaV¾Vž[_Q’f\Éiò…s\ã*µh-\Þ\çvGUª:ó^\ì6ógs\àm7\í—\é#®Brs_A[YD\åY}ÜŽ•\Æø/Eû‚±PZA“\í^“\Zaq[\áhòSWZ³‹8\Æ:Ø©(¿v\Z\"HöŒt©x5§Ž•×±\â^\ìR¡tŠql\Zc1\ÍC)§µI‘\ÔG \×\Î?ü24Ë“yl›!ü\áG\nk\éRI\Ír¾(³[\Í:\â3pÑ‘‚8®eRºÙž\ÞM˜OŠ‹\Þv’>að\ïˆd\Ñn—~ZHeö5\ëZ\Óe¶ó\ín#+·%I\å~¢¾½†x\'’9\ÖV Š¤de\Ç\Ì\Ãñ¯³ôj¸*8–ª^\×\í\Ôô½c\Æ7\Æ;F\í\ËWq=\Í\ä›å”»\äæ©‡‘ð\0&»¿\nx^óT¹FxŠª\à°\Çµ¥E\ÔfU«a²\è_D—\Þ\ÇxWÁ÷:­\Ê3¡Xz¹=…{|>\Ð\à‡\Êû1ƒ¹sšØ±²·Ó X¡\\\ç\ÔÕ¢kÔ¥B4\Ññ9ŽiWV\é¸Á|(\ælü) \éóù¶\ÖQDþÝ«fh†Vª\'5­’<‰\Îsw“lª	<\Z‚x\Õó\rZ8\ëUÝ±©ž}®xCN¼\Ý\"F±¹þ%\ÉX\é«¯§Tƒ\æ&½~\ë•5\ÂClmnu¹2N3\é\\\Ù\ÎQI·kž\ÖKF*³œ`”œmsšÖ®\Ä\Ú\â¯T¶R\Ä{\Õÿ\0K¿\Ãi“\ír)#\Ü-\Í\Ã¾\â}£5½\ã&òô\Û;|ý\çQùW•}õ–IÀ~®\æ\ßÁªD£\ä\Ó\ì1„ò3\Õ\É\å\èV±`ü\æ:–\é¾\Ïà°¬pZü\ËT1­—ø‰¼5k¾–ðfe\çÞ³<39µ¹¼\Ñn°W\'h=\Å=dð\í‹D_>jŽùj§\âoô\rN¼|÷\ÅC5Ý´Rò{\Ý\ns\Èrö¬z@+K\ÃF\î\Ê\ãI¼tÜ¸>•K\Ä\ïö}r\ÂñN($j‡Ta¤ø–\Ú\í[\Ü`œjniº.h\ÄE5ç‡¯Nô$ùdû\Ö¶ö›Ë‹1‚\æLo“†µüV>\Ça©\Å\ÙÂ¹{ƒRk2-®£§j±·\É&CHŸ\Þe\\\ë>%\ÒÉ¼„Hƒ…˜À­m\èú”:„Š2\È>òöü+O÷ÿ\0Û¾Kb[kˆKa§\Ð\â’[8E0n\í>\Ô+5¶¥=cÌ—N”ÀúšÁ\Ô-\çµ\Öô…C’#Aø÷­]M\ç0KnŽ\Ð7°\è\0\ïN·\Ñô©n ”j-\Ê(u\ÞÀ\ä~4¬8\Ù\"”:„ö>+š+–\n—;UOojl‰ÿ\0ÿ\0‰Y\Ùqkz~§¨­¯\è2\êv¢d\Ç\Ú`]\ÈA\áÀ\íYº|\Ñx«D’\Îs‹«~„ðÁ—¡ÿ\0\ZcVµþñº[\Â;\âV¶vi{\Ê7¦î•¥\âø\ÌW\ÚM\ÇFm\Íb„“Y\Ñ\Þ\ÞLCM\É¡!*Ö¯~u\r\é·DfD™V_b*\Ð5\ï&u7\×6º•\ÜúøQ<A¢C\èk\Âr˜g¼ðþ °E=\î;V€\Å\åki“%¹Œ2\çª\Ô~)Œÿ\0 x†Ë¡Ù’¿¦jÄ’µ»þa¤H|/¯Ï¥]sgrp¹\éót?\Ð\Ò\ê\ZDšc‹WÈ‘‰µœôó\å?¡ô5½\â;¼I\á\è5ke-,Q—P½qüKTlu‹Ë(]Kl/\ìˆ¯mú\Éýb\âºðõ§F¢”^¨óñø*9†T\êF\é«Iy÷9\'‰\íÝ‘Ô«5|\×a}ajÖ‘\Ý[\Ü}«N“+¥ùžý\É}«“¼µ–a\Øtô>â¾¿Œ§ˆi-\Ñø\Öw‘\ârÚ»9\ÓoÝšü˜\è¤Z\ä<I®\r*7H°Ó¿\îW®¯®‹´60=\Å\Î3´pª{d\×+\âŸjºL0\Ëy$Sý dºd\í=\Ô\çÒº1\\`\Ôw\îqe¸V¬gW\áOH÷<òF\Ëd\å³Ôš‰º\Z˜Ž9¦ËŒñ\ÐW„÷>\Þ*È‡9n\Í\ç\È\ÆzTx«¶±¸BŠƒœcÒ‘ks\ë\ïÀ‰£Y\àq\åŒb»°NpEÄº<RÉ·lLb»\Öy+È¬­\'\ê}VÞœ_‘^U<\â±n¡ó2	­¦\É=z\Õi°h\è9k\èÀ\Ý1Š\å/ôû‰<1q˜„‰x\Ãú\Zô/²\É8\ÈsÏ°«~%C§\Ü\Â\"¬\è\×n~ù;õ<œ\Ö?¸i.‡\Ï:ˆb²Xm\î!%yn\ê+\Ú-#µ\ÔtøžÌ©F+Ö¸3\áfñº\ÙÈ”`Y\Èù[pEV¶\Ñ<o\á+\Ñ›#[Jr\åù;\î#·\á^\Þ\'\n‹š\Ìð0X\ÉR|“\âö;I\â’=ñ\Ê\å\È>õ\ç·Dšh\ä=)]¦«\Þ\ë:yº¿Ž%™]\Ð4Y\nê§†\0\×7\â\í^\ÚI÷§Výß£ŽõÁƒæ§„½fufô¡_-¨\Ú\Ú\È\Ï\Óntx\äcy }\Ðk¤O\è±\Â6\\´chS^S,\çvrzóS”òÈ¯´XH\Íj\Ùù\Ôf\émc\Ó\áñ^–\ì÷£=\Ê\Ö\Ôv·+º‘ù\ÅxÀ”\Æ3\Ôµ£es\ä4nU—¦*g—Á¯vM3¢ž6¤^©4{d–r|\Ô\åq\Íg™	^xÀ\É8®{Bñt„5½\Ù\äq\'cZw7CÝ™‡–9¯\"®­9ò\É½<E:ºgŠ\ë—-£xªè»%\ØÁS\Î\á\èÂ½gIŠýš;‰n<\äxð[³©\å\\WkO±wq3Œo”ŽÂ»\n\ëw:TR\ØÝ“\"\Ã–\Õ\Çñ ê‚°\ÇPq\ÃÉµ²\Ô\îË§Í‰‚‹\Õ\ÉXõ|d²ž¢«º\ät®\"\Ã\Æ&k¥q$q18u\ÎW\ë\í]\ìn’¢²C\èk\á\êZ\ìý*4\êB+jeI[;1Yw\ê]\n\â\à\×I.\Z\ÈxY\ß$qI-Š:E\í\í¥\Ì\Zs©–)r#q\Ö<\àûV\r\Ý\ÕüoÛ¢DrÌªû\Ã\ë^‰”Q\Â÷B•S´\çf¹\Í}l­4PÌ„,V\ìr}O¿­{xÏ•\Ío§CJÔžxmÁKg\'ó]c&á¸¯¯’ø§†´û@ØºŠ\á\åfô\ä\nô\ß\ÜÍª\é\Þk¶J’ŒlW©:2Œy5T¼‡\Ý\èö—H\Ì\Éó·ñf¸MOEšÁØ™sô¯N˜a²[\n3š\æµI\à•\n³œóE7$\ÎlMM^\Ög3uJi\Ö0y\ÅM¨¶%Jã“Š\ã\ï.Ù¤e\êTQ9p\ØGR^E‹«ö\È\Çnµž÷²‘Œš¦\Ì[­7$\n\á•F\Ù\îS\ÃS‚JÅ—\È\0“Uù\î(È¤ \Öm¶n¡²¼÷úŠ”N\Èq“ŒTC§4\ÓH¸\è\Î\ëÃ¾\"‡Oùf;@<g5\êö:•¦¹B?…º}k\çö5¯¦\êwVR\r“Ê‰\ßi®Z\Øu-Vç£‡Å¸4ž±>‰µ»½\Ó,ˆgŒôuû\Ã\ê+EüMlSz°\×;\á\Íf\ÛR€l]ûƒ\ÃWTrs^l—+³=ºsRŠiœÎ¥=\ÝürA\Ó\Ôrk\Ì<y§CftÇŒ`\Ëk—úƒ^\ÃÅ´¤`g5\ç¿c.t°TZ“[\áŸ\ïËŽW¥/‘\ã@ü\Üv\ïR¡Á^qŠn2ø^•,|2“ØŽÝ³^ª>zi³­µq\"õ\àWGÝ¯A½ðŽŸ$–—°3YDw\ç\Æ\nMG\áÖ³\0w²t»N¡sµ±]\nHòjPŸ3ihy\ï®)\íÖ¦º·¹²\Å</ŠyFüª\"qÛ­hŒ,U\r\Û9ü+±\Ñ|!u©…–|\Ã\ÄÕ\èQ¹R\Æ(\ØQÙ«\Þ\ì´È¢„\0dc¥gR¢\ÑC\êjö8\Ë/\r\éZd¤\Ðnb2N+\Ãü{}qyu…€[ZF\ÅaL/\ê\ÕõsZ \ê8\Å|\ëñ+E¿½×“\ìñA`W:©vwª\n	)œqGZ–xLS26F\ÓQ\àœÓ¹µ‹iºaõ\é^«k¡\Ëu\áh\ïFQ¢r\È{²f¹ÿ\0	ø3U\×a[¨U\\3\ç\ë\é»]*\Ö;dƒbùh›JzŒbµŒ\ÒFrM³Ì¼5<7p‚žsnPXž™\ï]šC\åŒYz~™©›`H…\É(¸\çÿ\0J\é®b\Å*r<‘^^)\'&\Ïc)r¤\Ê-\ÎDð\à\Ô\áñJÁpY\Üõ\ß\Â`Mb.fHñ6+¬¼°‚$M«„LÓ´\Ý1VQ4ÜžÂ¢ñTò[Ø–‹o\0““\ÛÝ††§ô]ó—ˆ`\Ù{!X\ÕP1	·¦s\ß*Šö\íÃkz%\Òy¶G\\ƒ[úg\Ã\Ý\Z\Ç\Ðy­\ë\'Íšú%ˆ§¤|ç²œÏœ„b\n,„Ÿ@súW¹øRû­(-\äNp7Ž 	¯G‡G°ƒ”‰\Ü(«r \ÙU@\Éf\à\nÂ¦!OdW\î\Ï#\×<gr®ñ§—)n\áMy.¥¢\ßinD\É\Çb:W©x“\âVŸ²C¦\Ä.™8.F#ü=k\É5ok:©\ÍÃ¨8D]ª+.b-t(qœ\Z•X`V]K¾]L\Þühº²:\"FGZöO…\ç0\Þm\Ç\ß¯Ÿ\ÒõÁù†kØ¾øL¶2Á=\Â\Ä\îrªü§\ÌC¤\ÓLö\Ë\Ãû\å\íPŒ\Ö}\Ý\ê=\Òa‡=·­]pp\ØÆ¦\ä:\Ò\ÆMF\Ç\Íø‡\Ä0hvo+ò\Ä|«TJW.\êšÞ¥B\Ò\\Î‘…ò~‚¼S^ø•¨\Þy\Ø³\Æx\ßüf¸mcW¼\Ö.ZY¤Ý“À\íø\n\ÉÁ\éX\Êlî§‡Œu–¬š{™®\\¼\Ò4­\ê\Ç5©R2m÷¬Î¤’\"\Å2¥>”\ÜP1£§\\\nš7x\ÎA+\èE3\å$fšNsÀ nŽ‡L\ÕZ\Ñ}®Xy\È•5\è~\Zñ±¥µ\Ã\äN™¯©=\Æ*ù\Ù\Ï,<d}•e:\ÜF¬½\Ç&µ\ã‹y\Æ=\ëÁþø®IXÜ±Ü¸\Äö5ô%Þ¹\ë9\ÏK…:6vg;\â-=\ç\Ó\Ø\å2}x¯Ÿµyb’NR>‡\Õõ\\\ë½Y1Áó\ï‰l½ä»IÇ¦	®9¶\Ùô8”Z\'P3°=0k\Ñü=®—o1ùóò“Þ¸!v«\Ôñõ®¢=;S\Ó Žv¶t~¡ˆùO¶Ea8¦Eoc\ÔŒg8¦< ©<V&“¯Ayˆn@†nÇ¢µl\Í.ÜŽ3Œýk™\Ä%Œ£i%Ã„^¬k[V¶N\Ñ\Äh8ÀÉ­M\ZÌ“\æ¿Z›\ÄVj6MX\Ü\àWE(\és‚¼\×2G…øvö;=\\‡ÿ\0W)\Ç<`×º\ÚbTø¯\î-.\ì®vÈŒ\nqŒt\éŠöO	\ëQ\ê«—ÁÁÁ\Û	[C\Ì\Å\ÑMsX\ëŒg&£\Æ\\Öƒ\"¸÷ªmò’\æºc#Èœ¹8¦e†qŽiY³ßŠ	sZ¦b\Ð\Óò‘\èN)ã¸§d9÷¦\ç\Ð\ç5D\É\îh$Òœ\àI4»†=M\07 \æ\Îsšvs\Í\0zô\r!F\r/ip!©`bšF0iq‚t\Í!\î9¨»¸\É\î	£=s\×4sÏ­!`~ö?,S¸0õÀ?\Ï4ÜŽ¼žzÓ‹ŠŒôÀSŠdŽcžø\äA\Ï uõ¦\\\â•\\1\ÚwG8 	N6€O\'Š0§8Ü¡úw¥<i\\¡ø!\0Ô§¸£S\ê)sœc½\"’žÃ·5A‘\Î§­8qÇ¡\à\Óv\ã¿\çI±‹ÊœŒsL\Æ\â:\Ó\ÎrsŽ”\Ó\Æ0y¥q\Øgõ¨\Æ\ìò01\ÅL$0\Æ=©Ž~S\Ïj`\ÑYþR\0\ÇSPž;b¤&FÁýiÊŽ™h&\Ä,\Ø\ÎzS£l{\ZfM>2{¥)‹\ÐN}qK!s\×5\\rÝ¹\ÅJ\Ã*2G¸=\ëjˆ@°<óü¨\"¦ŽO8\ïOV\r\Ä\ão½]\ê»y\Æ3ïš‰Cs&\ä\\«\Ç ÁÁù«QF@b	ª÷A³¹r}j\ÎN\ÕúŠ\ÂGm3BN\Þ{\Ö\Âch9<\nÅƒ;ºó“Zñ‘·§n=©q>‡˜\àŽ•\æÁ¦—_¹#PŸ­z5Ó¸¸+]¦\îõÁ\Îd\0“\íÚ½\ÜK½+µ:\Ë¸¯|\Z\êm\ß\Ê\é\á™\Î\ÐHu\Ö`qX£I#Æ·c\áÛ·¸°\ï_7YX\Ëw?™9%\\ú\×\Ñ~:\ÚtFL\í- ¯!µc^j*Tk@(½\Ë\Ö\éÀ_zžY\ÕW9Àõ¨¤—»W?yv\Ëò\ä\ç\n\Å&Í´‰%\íùù€=EX\Ðôg\Õ\äJ®#\r\Ô÷£B\Ð\å\Õ\'óeÈ„~µ\ìv0[DˆˆT`\0+º…\êö8\ë\×\åM-\ÆZi\Ñ[@‘\Æ m¡ÂœÕ°ª:\Ðx\è-*n\ì\ËxA,Qe3\ØÕ¶D+ŒcŠ!E\Ç<œ\Õ\\‹èŒ“p	­QQJŠœ‘MVf\çzP\ÊD\Z„þL.øÝ¶¼KQñ\Û\rA 0«F¼zó^\á4,[H\ä×„x\ã\Â\Ò@ÿ\0n¶F ˜\n\á\Æ:Š•\é\Ôõò¸PVª-_\ÂM%¬w‘-\Ü(Ç§§µ>%8ô¯<\Ò5‹›	«‡‡jõ+Y »¶I¢ Œv¯\ZQ>ŠT\Ý?B£D¤œ\à\ÖmÕ¢8%k x·Ž:Õ»M%\ï$Â®s\éNsi$s\ÎJ\n\í\èyúY¼…S“\Åzg‡t»‹[q¾3½ûzWe¥xv\Ö\Ü±wc\ï\Íu\ÛF\nö0\ØgJ\Ò{ž&+ª\Å\Æ+C‹‹L•œ¬3Zi¥ª‚ºaô£\ÉÁÁ¯C™žW\"9;\Í5 c#¥|ß«x2\î\ãV¸’#”\É,q\Å}pðv\Æ{W?¨i!•Šas\ÛÖ±ª¹Õ™\ÑBnŒù£¹ñ3\Ä\â\å¡Q\Ê9úbµtùd±HYþ\Z\ë¼e¢\Ú\Ù\êLÁ\Ú¼Ÿ\Â\Õ\ÇG²,\ã×‡VÐ›‰öø8¼EÏº>€\Ó/â¾³ŽDlœsP\\H7°®;\ÃZ´& ­ž=ë¦—;³\Ís3*´94\ÑRE½lh‰óJp8\\V[!z±ü\ZE¬÷°\niE{\Çv\ÔY\ã_.£\Ó5a*D2\ëŽ+\Ë\î¼U¨Ý ŒŠO\'\ëZ7ñ~!\ÔY\ârcBvž™®20+µAYhyn¬›z\èY3O&wH\Ù<žj¹\ÏùÔ 1Ï±\ÍH‘y…\É\ÍZH›²£2\ä€\à\Ô\ì¾_\ç#µ^\ÒÂ¯8\Ã\Zi±˜d\í\ã¹ô¦+2¬S\ÉùWKk\âK´O&F2D:+sƒ\í\\\áGP2y464¬z¦‡©®ôx\Û\0õ•\îz “Ä 8l\×\ÊZ]\Ï\Ù\æL“Œó^\áá›° \ã8\"¹ª+ŽM«Ø›¹\"¹½^\Þñ†cŒ±#\ÑX2\ËšÖ‰Jƒ\Í³hÒ¥\Ò<\ß@ð…þ£~\Æ\ê\"ˆŸxúšúN\Óá°#E\0Š–\ÉÄŒt«\åq^½\Zj*\ç‰^¬¤\í²\"\Ù\ÏJ”(£=©WºQ\Æ(\íHr\r)<ô¥\çÀi\Â3RœS)1œÞ¶\Ûm\äÿ\0w5ó5­Á\Zü\×“\ëÞ¾’ñ\Ëo!ŒJù`KM\Üwšòq’´\ÑõY>zuOy»‡\ÌXfA÷”f§Š<%fXj!´\ë1¹	XZŸŠì¬ƒ.ð\Ì;“^tµg£\nm¤™\Ô;\'\ç5\çž*\×\Ú46Ö¥]\Éù\ÏeZ\Ã\Ô|ou0)j¾XaËžI®h\Ë-\Â1\0’N[tÑºÁ½\ä\Ì\í…Ø”\È=JzÕ½:Ñ¯n \Ï<ûVž•\á\Û\Í^\á#¶HOR+\Ø<-ðöö\Æø=\àI\å¢ñ»\ê+¶\'R\Ç6#KK[^\Ça\àYX#HŸ3( š\ìn\"tB;\Õø£(UQŒSe\Æ9¯Z0QŠG\ÆW®\ëU”\ßVx7\ÄHµY¬‡”F­™1ÔŠó_\r[\æõ7€rI¯¨µ;®a*@`r1õ¯›B“I\×\0ˆ\Ì0=+\Î\ÄPjªž\é³\éòlÊš\ÃK$”’m>\ç·\èñm¶„Ž2‚·…gX.-\Ó\Óh¤w\ÇD˜¯.j’~lQÀ¤4\áE6d‘ø\ÔmSš‰ªDX¬Vt†\Õ\É\ì\rk\ÉÓšóO\ë#N\Òg(Fö\\\n\ä\ÄMB~G~Œ«\âiÓŽò’>qñ5Ø¼Õ®dU\ã\Ì;kd,½z–gw-!\0\ä\æ«Á\Ï\á^]OÖ¡\Ë\Æ¢Hô¯hö:…\Þ% {w5ô5¥­µŒ(\"JùC\ÃZ¤–\Z„R‚\r}Imx—V\È\èrA\èa%uG\Çñ$*Â´%v\á%§“E·•3·#5	aŠ\å¯\äW¹l1£W·h\0=k´ùCªg5?¯&°†£8=Ó’öWp\0Þ“rY„u\0˜žIªS\Ê\ç\'\å\ç·þ8°²¹xUzsY±\Üô‰\çŒ.K\nó\ë¶\Ö\Úk¢J7\ÈvŠò\ïüO´H¶²e\à(¯¾\ÖõÉ·I+’\0\ÉÀúWxó«&z*\îŒÔœv>…Žx\0\Ò\àV\Î\çF}\êÇ‹o\à“QÓ¢0Z¾c}B\îC\Ì\Òdc\ÅA5\Å\Ì\Ø2K#‘\Ós\\V\Ò\×=—›kgøŸMø\ÃU³¹’\Ò\Â–GS–Lô\âµ<O\"\Ûø~~s\Å|¡kw-\ÂN‡.¤I\ä\ã\Ô×­\Ï\ã\èu¨m¡”™\ÜVU0òŽÚ\\ÆGi\Ú\Z\è{\Û\áÒ´­8\È\ÐT6}êŸ.´\Èn£Ãˆ\ÝX0s>&Õ­¯4» l\å†\0ö§¢^%ö=œ\Ç\æ…q\ê;W+=hô’}Jž!“\íº\æ>eÂŸÊ¯\ëv¿\Ú^\ZµºŒ|ð¢¶{ñ\ÔT\ZdcRð­Å¸9x·\ìEhøUþ\Ù\á\é-Ÿ ¦\ä=úŠƒK\Ùz2´-ý·\áfV\ÃHˆW\ß+Ò³t\Óý±\á©\íN|\ë^W=jÏƒ$1M{b\ã\è1\èqUtu:Š®¬ÿ\0‚M\Ü}y ®\ë\æl\é:’\Ík§\Ì\ãç¼—9\çÚ¨²É¥¾¥wk%\Ìsg3”n¦©O²\êºnJ{\Þ\Ón\ÛU²xu}„\ÆP,\é\ì89ö4\r–•«\Ùk–e€PJ\âT=«‘\Ùbý\íõ7B ƒo8;F=¸ª÷b\âÕ´\ÉG$gAÀR\ÝñV-4»I\ç¹\Óõ\æA\'¯¡ µ¨ËfóAºhíŒ“\Ú6—\äpÔ³¤–¯o\â;ðŽ\ß\é\á\Ï\\û\ZÜÁ×¶j\Æ\×RQä¤©‘ƒ]f¥Eo§›9¤¬À\ïÀÀ9ô«Š\"s„v9köT{oXa£`\å:\åz}Ö³µd\ÝEnw[^¢\ÜÛ°\Æ7/P*Íœ2xWV}6\èù–œ#Ù¿¨«ð\Ùý‚\î}1¾x“÷ög\ÑOU«J\äs$÷L_´Lö7\r˜5+\\\ÇþË¨\äTþ„´:—‡/ùd©\îA\î?`\ê:v£§\Õ-¦Þ\ÊTg\ä­b\í\äK\Ø\0\n“/§±«µ†\Õö{þcü\'¨\Ë\áýZ}ÿ\0ˆ\Ùñ\0\'§^\ÍV\ïa¹ðN½öûx‹\é—|Lƒ¢\ã\ë\ÜU\ÝgJµñv—¡§‘ö”\\®^\å¸\íI\áÿ\0\Ù\ê6Í¢ë¨«&\ß,™Ù½U\Å]\Û\î2œ´sJý*@ž\çL{D“]ðÌ°µ¬\Ê\Íud\Äyo\ê@\ì}Es6«‹I§E%¿Irw}+2\ËAm{\\\Ô4ý2ö\ä\è±Lª\ås\Ý@\îk\è\Ãv\Úm¬P\Çª¢€\0½¬\r	§\Ìô>K8\ÅR©M%$\Î+Kð”qª„\0)\É\ã©õ5\â\ß¯¡µ›ì°Œô†+\ë‰\Ñ\"˜\0\0þUð\Ä+×½ñ5Ó—b™%\ì	¯R¤­|¬)¯m´H\àÊ\çj`v¨\ÙF@«u\ã\"˜\ç¸\ä\×G¦†yy\Íu^²I5E’X\ÞD…Œˆ3¸?\\\äJ\\\ãk\Þ>\é+q¨LXy\0üj\\[M#jN*i\É]&2MZ\æXbŠA9Äœ\×\èž1–A¨1t\è%þ!õõ\ê:Ÿ\Ã\íSFEˆ\Û\Ü:\å&Œ`~#¡¯&Ô¼«Z\ÊÕ’\ï\åbÁ~V{`õ¯*¶\ÛNKº>\ë˜\å8ªQ¢\ÜiIh”´û™\é1\ÜG2¬‘¸eaÃ¡©‘\ÅxÆ›¬_è’å’„üñ?þ£]¡\ã¦±t¶I#–N2„W)´°\íJ/©w\Ä&\Zh0\éï›“ò‘ôÖ¸½=_Y\Õ\Òg”´‡31%†\Î\å…a³6s’3Ö½÷\áÆ5‘ºž=²N\Ï}½…ta\éJ¥Dµóa˜:9vm\Æ2“\Ñ_«e\Û¦“0J\Ñ\ÆpLxs\ê+\Éu;x‚y¬\ÝM¬lUÛ»€k\ék¸ˆŒŠ\æ®<?ö­\é#lV\æM{\î¤\ã#ó\ÈB”ªóOkžQuh–pZÁ#ŒoÀ\ê+›ñ-¼ri\Í,Œò¡½~\ëÃ«ki\"\ÄQDiŸ1\Ï@9&¾\Õ\î\î\í›\Ïóx•Y^­lZ©²¦Ô›2\Ïs,=©F\ÎUW*]—s\rSg\0Ž\Õýìš™\ÔçƒœUrH\ë\Ø\×\Û(\Ùžó6\ÈdVŒdr¬*±.¤\Äj\ÑRr¤d\Z„,\\†\'â‘¬K	v|²Žz‘\Ð\Ónu	þ\Æ-Ë–]\Ù^øŸ?– œ\àzž+mb|À:zWŸŠ\ÄR£¬\Ú=,.u_º™ª \àb´4÷vº´@\å|¡s\È\0žG\â+‚“U¹b\ØÂƒTEý\â\È$Y\ä¤ ô#½xXŒÂ”\á(r·t\Ñ\îaðui\Î3æ³‹Lö[EŸL\r(ù\âg!¯\á}žE³±Ý±9\Ú}>†¼ž_xŠ\â!³!]»[}þµ¹p³µ|\\#»qg\Þ\áó˜T¤¡Z.ý\Ñõ‰u?Z«s=µ…³\Þ\Þ9H…f>€¦¼gNñ½ØŒF³«…À‡5kP¼’\í~\Ñ-ú\Ì]Â¢n\èOEµrªrR³Gröu#u5c®ºñ¥¦¯hµºµdS\È\Þ\ãÔÒ¹\ïj\Î\æ\ÂRDr”ö;qò‚+±ð\ïƒ~\Î\Éy¨¨iTnXAùG|µxö«©\Ü\êÚ•\Í\ÔøR\Ò2ªö\n§_A•Sr“miä³¹P‹Q¦\ÛovUv\Ë1\0]&…¯Ï¤Á,p¨\Ü\í¸“\\‰“š’2ð\í\'¸¯ qŒ•š>kUª;ÿ\0j÷yC\" =BŽµ\Ì\Èv\ä–!—œƒP›’sŸ\ÌU{™\Õcn:ŽsXMFvI”\æ®fêš¬—/Ë“·Š\Â\É,qøT†=)\0\â¼Z’r‘\ìÒ§E$†u\ÓÚžT\ZnA\Í`l&{Sy\'¦i\Ø\ç¥\Ðs@\ì*þŠ^@\Þ\Ôý¢€\Ï£ ði8\ÍH>\ï£gE¿{ød/…\Ý\É\éŠúJ\Ê\î9í”ž\ê\æ¾T\Æpy\ç¥z¯‚u+›øL’Q¹Ž#c\×i+‡J\ë™t=<\r~Yr>»¹²;¥%\îæ‘»`W—x\ÛP³ñ\Òm\ë\ä@U\\ð\×g\âR=3OF¶l6\Ñ\ç0ô=¿\ZóKm©A.\à\Ù\é\ÉVT!i\\ô«\ÅJ–½O:\Ç\ÌF:´þ;T÷ˆVy=Cj®yu¯Ml|ì•›>‘ð=\ÔZÏ†¢$_6\Øyr)9ã±¯S´‘\Ú%\\\Zù\Â%—\Ãz\Ê\\ò\Öò\Òz3\Ü{¯Q_]\é\ÏmuSÁ\"ÈŒ¡‘\ÇF^Æ“l\ÍDf¥\á3V²h.¢H\á\Ç§\Ô\Zù\ç\Ä>¾Ð¯\Ò&C,2¾!	=z\Zú¿NÂ³¯¬ ¹Q\æF­´\ädgœj¸‘S	ù3‘ðæŠšf‘g9EËŸRy5Ó¿È¨Gðšl\r˜\Ê\ã8¨jº®Ÿ¤YIsy2\ÅjIv?¬¥\'&k(#U\äÜ‡@®[W›LŠ9<ùcW)ÜŒŠð\ï|Z\ÔnÌi‘!9Q+}ó\ïŽ\Õ\ä³\ß]N\ìòO+³œ±,Nj”X¹®mki¥‹™Œr\î•\å\'\n>@+›Oó ±\Í3<Õˆô\â-\ç‡ô˜,-¬\â\",\åº\æº\í?\ãv}§\ì7\Ä\Ùý\rxG\ÌzR€q\ïÒ‹\\V\Ôú<] \ë\Ð4–S!¸K\"°*\ßL\Zó[½Rò\â\ì\Ü\É3™AÀ}Ü¥y,rIŠ\èì¬‡! \×Ai¬\Ê\Ìb1ý\ìW-jM\êo)\ÅQ£\'\Z‹Yu=§LñDrÆ‰xv\È07õ\r]\î’ñÜŸ1\\:(\í\Í|ø“+.Cg5\ÓøwZ—L¼\n\Ì|™ˆWH÷Ä£\Ë#Þ¯‡ZNTž½D\×üW{¦‚¶‘! ýö\ì+›±\ÕuLö“°h\Øg!@ƒY~(¿I¯\"•]\0#\Ô\×m\à=)¢µ79‚>•´º±\æÕ¡J–Sœ3;]+M[;tŒ(Â€3Zr\0«Ž¼U…P\è*œ\í‘\Ó\Û\ÙóRŽ¬©u{\r¥«\Í3„Ž1–\'Ò¾cñ·\ÄvV´µvŠ\Ñ\\ƒŽ²b´þ(x¶[›£¥\Ú\ÈV¿\Ö?y«\Ç7\ã5´Ng©8˜\ç\ÇCJeœqô¨21NR½Ö\Åb)v“QSI\×	4Á@=\Å!¥)\ÛøwÅ·\ÖWq­\Ü\ÆhpwWñ¯ ¬58n\á\ÞP:ùu\à\à×³xZƒ\É\Ë:o@rŽ=kZr¶Œ\à\ÄÑ·¼‘\ì®~QJù\ï\Ç\×o>­,a¸Œ€+\Ý ¾†\åq‹ \0žk\çONf\Õn<o8ö5SØŒ2½ODr{iA\Å5\ÛSG^I¬H“švA\'$\Ó\éN\0Ÿ|\Ðm‘Šc0\ì*s\'¦kJ\Û\ÃÚ½ê††\Ù\ÙH\Èc\ÅK”V\í\ZF[&\ÌL\çÞ“\×A?†5«a™`\ÇÑ¬y-\Þ#‡R))Á\ì\Ó„\ã¼Z!\0g­.FN(‚¤\ë\ÍY\ßð\ÍÄ–šÅ¼±õÝ‚=}£9–\Ú\"zÚ¾+Ò›n¥lA ùŠ8¯³<<\Ì\Ö0\î ñXT*š\Ô\é™A\Î+‚ñ?„§\×&S\É\'ük¿ô\Í?‰\×8;¦p\Zt\Í(#É›‰€\å\Ü¾Ã°®¾[;y\ã1\É+Š\Ð\Ú=¤(\ë\Í+\ZûI·v\Ù\æZ¯€\í\çf{F\Øy!}\rr7Pk:	\Å\ÌfDQÁ\ÎIükÝœšò\ê\ê\Ñ¢˜{\Ö3‚;ðõ§Q¨½Q‹«x‡W™½ ?;¹Ž;{W¤E\0-¸úšð=\'S¼\Ñ\ÜO\Ý6zÂ½o\ÙÁm¹\Î\îÒ®–‡>6w[N¥ iºšfHþpxj\ä-|}£\Ýyú|Ñ²&D \äý\rbŠ–h\ÅLF1ß½Pºø±lù’Ã‘–®¥yNn\Í\\ö˜¤\Ùót\æ£y\íØ…2&H$sü\ë\äýG\Æúö \ÌMÓ \'¼}\0¬Õµ\Ã5Ä…\ë¸\æµI£–P¹õ\ì’Æ¤a“\êN¡úñ_%G«jQH.¥R3\Î\î+~\ËÆš\Ü,<\ÉÌ£+÷½´‹04}0%\Ï8\é\íÚ¥ c°¯5\Ñ<kk{\Z	0ŽN\n’+½†ò)€(\Êsœ\0y5º8\â\ìÑ¡\ìHæ›¹A\ï‘M\È\é\É\'<S€\Éô\ç9ñCBL\\õö§ŒŠ¡\ÏCO\Î\î3\ÍIHP{úv£ ¨¼æ—§9£>½ªKHN)‰(n\ãŒ\Z«5\ÄP)2«Ü“À5%$<±\ç –\â%ùžU\ÇV\Ç\æúÿ\0¬\í3¨ó\Þ\ÚòMO_¹Ô¥yŸ$’\0$¤i\Z.G\Ñ\Ó\ëúm²–{˜°N>V‹t‰eØ·KŸ®9=…|\Ñ\ç3?T{ñ\×ð\ç¥2¾­\æ}e\rôrŽŒ§¡Š\ÑYPŽ£9À¯“ \Ö5¬wÖ„~(\ÖW•¹lŸ\Ë\îG\Õäº£\ê]ÁòñR\ï\n;W„\è\ß%B#¹\ÇÍŸ\ç^›¥øŠ\ÏR@RPN‡c7E\êuE‚‚ô„\äw¨c‘~c“\ï\éM3\Ä\nÁ¶{÷©\Ø\àd‘\Å0\ï\'€2*%}\Ì\\O/\Î=\Í&\Ë`Žxúu¨¤û‡™ŸO\ëšM\Øc…\0ñH´46OpsRg©9¦«¦r¼Ò†\Ïó®;\Éöõ¨_¡8\ÅY\Ú\Äs\Çz®ü˜ð\Ïj´C*’\Ì\àñ×š¹o„B\ÎFzsT\'¨\0ñœÔ½ù\È4X‹—6†\'¿\\PH\ÆN+6V`roNi\ä2\á\êJSPÓ \ÔP+;®1\Ð\Ôö°ý™06={\Óð6?x£#&¬\Å4eˆ\rŸQQ(š\Âz¸\Î}wP¹XS\'Ö¡¹¹P¤u=\0\ÏJH$c\0,1Á\è+žQ;\éLÔ‰ŸŒc“ùV\Üm€2@\ã‘ÛšÀ¶9\Çlt¯‚9;\"ô>»8‰˜Ÿº¦¸\r-÷¤\Ìù\æbk¸¿yg F®GJ‰bµñn8>æ½ªû£††‰f—•\É\ã½u–‹Þ¹‹%ùq]e ù+4[8\ÏÈ©a\núÉšò\È\äP¹$+¿ø‰:£[DqÐšò©®¦1“XOY\ZC\áwwz]G—V¹\r.DC=VÓ¬\ç\Õ.‚*’€üÇ \ìVP\Û@ˆt®¬=}^\Ç.&¿³V[²åœP\"ª ù@¦™Ú¸\æ«\"2•¸=EZ\\×¤•‘\ä\Êwd¥ñÚ€8¦»F;Ó¸\Î3Þ™¾Zt`iª8&—q\r\Ó?J²&\áô¨R>*\Ð`zŒqL_\\PRC\ç‚:wª\Z…²\Éer+X\Çš\Ø\Æ*&“6„œZg\Ë>9\ÒN¾\ÅA!\ËcŠ\Ìðþ©-­ÀŒµº­}#¬\èv\Z¼/\é¹Hüs\ê+ÁüI\á<>\Â{y\ã/ß¨\ãÖ¡*mµ±õ¸,m<E%NzL\ïl\ãi\Ù\0\Î\ézeœ1 U\Îk\Ã|%-ý\å\ÔhÒ±P\Ý+\è5ùGqš\ëÁ\ÓVlósIrµš\Ñ(\"ŸQ®<w9¯@ð\Û‚E?©¤f•i¢X¸\â«J€Œ{UªB›ºPÐñ\ç…SU´wA¶U£W\Í7Ki+G \ÃA¯¹/\í·\Æ\à÷ó\Ä]!4\ëƒp\nZ¼¼f\í\Ç\æ}>G™ªmP¨ô<ú\Ò\å\á™1MzÞ•¨\Ã}œEx©l×š\Û\Ñ\ïÍµÒ‘À\È\Íyvg\ÓÖ§\Z\Ñ\Ótz^«wö+y$+\çŸø–ÿ\0S\")%‘Ur6\ê}MzŒuOôq8.õ\á\Z‘\Ý19\Èõ­¨-OŸ\ÇC’2qŒU¥„¸\àc4\ÔPO5¯m\nœqš\í¹\ã(•á²™Oòk£´\Ñn\ÈùAÁ\Æ=N{W_\á\í\ÊIW¯c^©¦è±¡£Â¹§^\Î\È\í¥„¼o#\Ã{ñn\ì	\ËqNxnH\Ã\Â@ô\ê\èñ*ñ\Ç~*´ú\r¬ƒ\æ‰O§Ÿ¶—c_ª\Åu>g:U¬«ó“\Ü\ZÅ»\ÒZ%õ\Ïïš§ƒ­\Ø3A¾&<ñÈ¯8\Ôtû\Ë&+(\Æ7cƒùUÂ­ÙŒ\èržl±K}\Ó\Åzg…µv®H\ØkŽ¼Iy%@\"®h²<W@\ëžkIkQ÷j#\ê\Ý\èKó\Ïz\ìS¦ExÇ…5 \Öa^\Ãk.ô\ÖPvguEs¯\Ñ.†\Ós\Åtc¥y\Ü2´2‡\åMw¶ó¬ñ+¯q^¾\Z¥\ãgº<<]\'ó-™?Zx\ÅF)7‘]g&}\è&˜\r)§p\04ÓŽ\Õ÷1À™sÚ¼ÿ\0\\ñ\í­–\è­\í\áTñŸzÆ¥XÁjÎªjµ\åhF\æþ¾ˆÖ²`85ò&ª\Æ=Jt…ò¢C†\éº\åÇŽµˆ¤‘³O\Ë\Âq×©\æ¼Y\ÙüÓ“»ŒŠñqUI-\Z>\Ó%\Â\Ç\r^¤e\'º]ÿ\0J´\×u`-Vl(íž‚¶u\Úiv-q{¨.WªŽ§¾½yÕŽ£so\'\É;\Ä}Ž+¡\Òl\'\Ö\îH\Ï3;pI-QN]\\\ï\Äó6\Ü*($s6ö7W’1[\Ê/€\Ï\Ûð\îk\Ù|)ð\æ\î\ä,²nŠ3\Év\à·”W«x{\Â\Z\\q»Ä¯6\Ü\äŒ\à\×pˆª\0¯^–*Í«#Š\Î+kK\æa\é¾\Òô\åQ<÷cÕ¾µÐ¬J£h\0Rzš\ìIEY+\ê\Ênòm° J…“u?$iýjô2)›d T\Ø\Û9¡Bz†\Ç\"´ê»¶x5\r\r6Šh‹*µ0\ã­G\Ñ\è\'¡”(ŒÓƒdd\Z§3æ¥ŒñÖ¦\åØž˜\Î›À^F\È\ï\ÍKeE]Í¶6>\ÕóGÄl\Ü\Þ%¨•9\"½\ã]¾Ž\Î\ÒW‘°Iü«\ä]võ\ïn\î.–v\Èþ•\äcª]¨#\ëøk	z“®Ö‘V^¬ËšU8\Úwm½\ëB\Æ\ÚÕ´û™\åE2‘òš\æ»e†:ñ\Ím[N\íj±° ±\æ¸^\Ç\ØA^c }’©\é\î+\é\Ï\\\Z\ç m5ó…Õ§\Ù\ÌG¦\á^ñðös.”\ÈºV¸Wi¿4yœC,—X\Í-Öœ³JÎ¯´žµ@\é\×\nNuu)\0W¤¤|Š9O±]Œ– Š„\ïƒ/#`µ\Ó\Ìñ¨$œW†üHñ˜\ÑmŒá§p3\Ó4œŒ\ÙŠþ\"\é\ÚZ\Ë¸y\0jù£[×¤\Ö.¤•\Ð!$\ãµe^\Ý\Ïw;\Ë3fl\Õ,sž\Ø5\Ï)¹Ó¥m^\â‡\ÜÜ“@~@#84\Ñò‘Ša\'&³¹ºDÄŒž´\Â~½sM\ê1œf™œTŒn^¾\Õ8\ïO\'?\áLÊ²÷ Ñµ¥\ê\ÒZN…\Ý\ÙAF{…u;9u°\îKˆÊŽ\Õó›\0\ÃWK\á­Mô\íB\Éù\\Ã½rW ¤®´g«€\ÇJ‹P“¼[û£<=‹]WQ±fùH¨ü\'\'\Ùu=FÅŽ>sUE\Ò\'ˆ,n\ãÁ[˜ðÆ¬\Üÿ\0 x\Â	\î\Üš¼Ö¥‹º+Y±Ó¼c,L0³1Ç¾\ê~¼Mñ5\Ù?$¡s\íŽ1NñD~^¿a2õm£?F«<\\\Û\Ù\Ë\ÜIú\ZE­\ã\æƒ_O/^\ÓnNv±š\èR¡©\Ï“£Z<Yò›ß­aøw\é3w¹[Å‘´‰¦:\ÈQ¤	óL¨\ëb”ºlSÃ«G¦Ç˜ŽÀ¡y‡pk¦­|±\Ùyn÷‡\îžŠõ«+{\éj­ó(+“Ü³W;\â˜.l5K-B\Ä\íys8\àž\Ù÷\"‹]lsúN›vºŒÚ“O—”M\ÜjÙº¹\Ôô¸®tö$˜›lüò™\éUüWq,6ºE\Ã“\ï\É=Áš\Ìñot“\r«ý¡^òe’Á‡ š\Ú\å-‘Íˆ\ÄÓ¤”¦\ÒGi\ã6Šó\ÃV×€\à\Æ\êOlŽk#P\×C6‰:A$²,d;tÊ‘Œ^A\âˆ7:¦ŸkŠÁb\Äù{\náŽ«~ÁGÚ§\Âý\Ñ\æ>•\Û4·zL\Ö|°NV{žý¡øöÀ\Þ\ÝióÀ\Â€\à\í\ìE_ðö½¤\Ú\\\Þ\è·3\ÄÖ“1Ù¼\ã“Ûšù 9,9\Î\Z™ß–\Ïs\Íkõh÷0ŽoU\'\î§v}7k{¨x3Qgƒ÷öß†Ñ…løº}\Ä\ÚLW\ZaC©\ÜM)\Æn?0”zÞ¼Bñþ©¢@–¯W6\è\Ù\Ù\'\'ou½[\Ã^\'ð\ÝÖ²\×V(ð¯• ŒÞžµTð\î3W³W5«šS­FOXUQ\Ýu=ÿ\0À\Ú¦—b±[¢…AåƒŒdŽ¦½	€G5‰¡…K(6· þ|\Öñc\Ï&¾‚œŠHøúµ%96ú³”ñM\Ë\Ú\édoùü\n¿><C\'\Úu»ù#\Æ\Ã;*sü+ò\×Ýž:˜›O$±À{_ŸóG‡b\Ü\îv$þ5},E\rf\Ù_a\årO­=c\0‘š@¡Ž:šz*sÚ¹·;K°F\×\æù=+ë‚\ÚNt\Én\äS—|)\èp+\äx€äƒ£µ}ûðòÀXøSJŒ¿\ì\È\Ì}ÛšÒš÷‚N\Ñ:B~\Ì\á9u”ô\äW—\êò]J`Ô¢>_“(2)\Ú\Ë\ß\èk\Ù&+\å•c^s\â94\Ëa+^O0²aÌ´\n\èiX\çR|\Ç\ãÃ¥\Â>·q¢ºd)õ<œW…‚x\É=+s\Å\'\Ò\îa³³†\æ7Ž\ÏxR­œƒ\\•Ÿˆ´˜¦-)\Þ\n0QŽ	\"¾oNN´œb\ì~•”bðô°\ÕZ\ÐRm\Ý9\ß\à¯\n\é\Z•¼LLû¿Ö–\è„º{¼\Çaa@\àW\Í\ß	|Cl5›»E¹M“E¿\Ë\'`z_H,\è\Ø«\ÒÁ\Å*kÝ³\ê|¾{ZU1²ýï´†ñ³ºW\Ç99¨‘ƒV†\0RW\n+¹F\ç€\çfyÿ\0\Ä;\ãc\á\ÙÂ¶Ö–%ük\æ\ã^^C\Ù\éŠõŠz‚\Ësef\"0d`=O¼„\í\é»¾§,£\ìð±v\ÖN\ç\Æf\Õý¶2V\Ú)D‚\\çŠþl‚3\ÅLù^ù¨˜‚9®öpD¬\È@RO«\Þ\Þ\ÚYÅ–±û¢¦¹»[Xdv\Ã(=ë€¹¹k©ƒ±\Î8Â¼œ\Ã°±´u›\Øöòü\Ä\Êò\Ò\Üuö¡=\Ù=;(¬cÁ\â¶|”Ûy=ª„‘„\ÏW\ÉW­:²r”›g\ÕÒ¥\nQQ„RH¤\Ù\ã\"šÀg8<½*¹\År³{‘G8\Í0Ó”\Ô2‘4R´G*H\"·l¯\à–x…\Ù\"1\"na\ÉP:‘\\÷jPÇ¹¥Êž\è\Ö5g\r™ô‰¼Õ‹Xin\Îòq$ªÚž€úšóŒ\Ä\ï!=»š\æ`ºš\0by\Ò@€z–æ½Œ*J1G‘rošCþ^ˆ?ô\åV±5iqŽG4ðÐŽ\ë\Ôq\Ðóy\ÓdK/¡À\íYš™ý\Þ095°P•j\Å\ÕC“\ÏS\\¸”\Õ6tá¤œ\ÌqH\Î)f­xXö\ïOŒH5\á\É\Ì^\Æ’y\ëQ\Êô®˜Zn\ÇzxÒ„\Ò\Ã\Zƒ–a\ÇÖ¹\å4ŽˆÒ”º\ãA +•9`\rDÑ°\ê1^†ºIþÑ™\Äd¬ü£¨\Ük6ó\Ãó®\Ç*y\ì;{V~\Ú=Í¾­S±Éµ¼‚!!¥0)8¯Y\Õü:-ôØ£†Ú¤ö\Ç\Æ6Œ\ÑO…8azŠh±\ËR=_g\Ï\È\Ç\à•\Ü\\\è@\Æ\æ\Z\Â6.€n\ÍR©g*R†\è\Å+’+WE•\â½VVteÁ§\"šÖ¬x# \æŸf9Cd\0:Sž¨tª\'Ùžiqd©%\í\éûD\ÊqGø›Õ©4›a\â-{2 Ž\á£i€¤t V€-ŠF|\Çn²\áúV§…\\\éþ#°¸–V,\ìasØ¬œ\n\åŠIž\åg9\ÓV]GZ\Ò/¬µ«{ˆñ:7<p\Ù\î+š+´œõôoÄ­I\ã‡R·C\æB†9±\éØšð­B\Ü\Ö\î%ùI	2ú?ÿ\0^º\ã+£ÂœwfTm´ó^“\à??‡gK+·&Á›\ïuò÷ÿ\0sÖ¼Ø®FiÁXld1Â^jŒ\ÐI£žpCeA\È\ç Œ\çñ©Ž\Ú\à¼c{¥\è\ÐZ\É3\É\Z¦T?T¿A]\à\åy¬^†‹Ts\ZÞ©o¢\Ú]^Lv\Ç\nonÙ¯¼Q\âmOÄ—\æ{—;þ\ê\àA\ì=k\×þ3\ë,°\ÚiÃ‚òXƒ\Øq_=¾I\' U\Å\Ñ\'\"˜z\àŠR4\Ìô«…\ÉQƒHy<Ó P+\r8\ç\' z\Ò´»q\ÅU\ÅaGz@âœ»³I\Ó\ê)4	Ùš–7\ïn\è¯÷s\Ï\ã]¤#¢º6GozóŒŒ\×Y£\\&NA\Ír×§¥\Ñ\ï\å8\Ù)û)»§±\ÒBcó‘\ä\Ô8.=E}/¡˜f°…\âP£\ã\ÙVW\×Z}­¼!]•L\Å}:š÷]>\Ö;[H¡ŒacLô¬)\'s«9©Eo{–\ä\áx®\'Åº\ÊhºE\Í\É<„!;’ÆºùŽ·jù¯â§Š%º™4ø8‰	%»“\Ð\×d#s\åªI#\Æ.\î$¸™\ÞF$³š«š^9§¤RH\áW©­ŒlNª6d\ã*\Âdñ\è*\ËY­¹T2,²·ð(\Ï?…vZg„õ\íF4-\nE\í|f¢U#v\Í!JsvŠ<õ\ã eAª\Åxš÷…ð\ÂF7<{½…f\Þ|7º—,.zü¹5—\Öi÷7ú•~Ç‹‘M¯B¾ð£k¸‰#p=\rrWzM\å™Äˆ@\çž\ÜUÂ¤%³2\nø¢Ñ™œR«²œ«}4ŒpE±„‘\î^½ÿ\0‰^Y”g!•O·Zó/üº„¼\än8ú\ZŸ\Ãw~K:«\Æ>õ¬–\å˜ô&´½\Ò8©Ã–´»3?0\Å(ú\Ò\r\nœ(¬ŽÄ‰T¨<Ö–Ÿg-ô¡#cP\Úi·7s\Ô`\ädúW±øwF‚\Þ5E@\ä±\Ï^º¦´Õ˜|,«K²%ð\ïƒm\íñ,©\æù®üX\íŠÑ±ˆ$*1’G&¯\Íy3©9\Ê\íž\å*0¦¬‘\É\ÝXo*0ÀŽ•Àj~\ÌfD>¼×±N™B+–¼·n3òÒ„\å£\éBKTx£¢OYž+›’‡žµ\î—ö\Ù^™«\Éuk&\é\×\â½:\ÜÕ™\ãb°Êž¨§¤§™¨[ÿ\0=W‘_gx~\"–PŒtQšù\Ã)Ö­w ·S_d\é\n«l˜\àV•\ÎX#dR\01\íL\ÛNr9¬M‡\ß9¦Jq\é*2ý}sL«•.Ë\ÏL_4x¦v{\ÙXžœúŠú;Qb-e>ŠM|¹â‹ƒ\ìÃ†,xõ\Í¹Û‡š„d\Ìw\Ö\Þ\Ê	-ðb\n\àð¦¹)n\çs‘!Á<óÞ£‘Ÿ-Ç·½@pMtÂšC‡^U^¯@\Ë\É\ç9\Í)šh\'<\n\Ôã°™®h\ë\íI\Îr:\ÐE°£8\î\Ý):p(µ\rÁ‰\Ãšõ/ø„~\íLŽ&¼›å©­\îe·l¡\ï’µi	\Ø\æ­EMyŸZZÜ¬\Ãsu­*}¹\Íywƒµñ{\0F?09\ë^•€®xlŽ+[ž}œ[L¹\Î:\â“%qžIŠO¡úR°/&‘H•\Z€C\ZaÁŽ\Õo—A\Ô2\Ñ\Õ\Ê[Bò;ª¢Ž\\ö¯	ñ_‹./\á…\ÙS$m®£\Ç\Z\ë\"5´GŽðI¯•·±$½*ºT\ï«+y#e\É÷¡\Âò\Å\í\ëQ\Õ7:¡\í\Ê3\ÆA¦cš~\Üw\Çi¡ˆ3:Qž¸¤^\éqÀ\éLç¯­j\Ø\ê·Z|\ë$gk#žE(<\ãÒ•\Ì\Ü=\×KñZj–¡U\Ê\Ì+N¤Ö¶•\âBÅ±Ÿ\ÔW\ÏV\×2[J²F\ÅXsœâ½“\Ã\Zù¼A€÷\ÍQ\ËRˆõˆA\Ø9\Ð÷È©\È$=x¬£¨\ì\Âm\É\"­Cs¼g¯š0Ls¸f\'€¾•wžNA5Röñ-”³2Ž\ç\'µs7>\'³BBN¤1\ê	õ&ñGf:\íŠ{H3\Èyú×\É\ãk]“-€[ 5^OX2HlñŽ”¬W+\ìzNñ““Š‰¤Nkƒ\ÅvW„\î[ŽxúWI\ÌR`«g#8ô©I4Ya×Ž´Àã¯¯4Ç“p!0I\Ç^”œ9ÿ\0\ëÖ†c¤!øGS\ïP\íý\Ö\àÿ\08+g“À?…0\çvO^(±Ÿ1\Ç •\é\Ï\â)žL.7`©<nJG\ãI\Ë`t5%\ÆF|\ÖÛœŸ1‰\Ç\æMjXù¾F3N3\ÏŒ€8#5z\Ço–ÿ\0\\Ž;V3Ž‡m	j^· ž•±	\ÇjÆˆa€+Z<0\É\àW;G«M\è}¬K\ZYÍ¸\ã\"±l“	ÿ\0°2j¯‹u³C=ZY`vn\ÚB˜^Á@\Íz\Õ]\æs\ÓV‰\×\Øý\ÎNEu\ÛDb¹\Ëˆ—\Û\èk¥…~JKs\Ãþ#]•Õ‚n\Î\Õç¶¶÷:Œ\é\\–>•¯\ãû\ï´xŽ\åN*ç„§KI¿x\ï1ƒ\ÜVi\'R\Ì\×UIµ½ŽóJÒ Ó­\Ò$o\â>¦¶IÁ\æƒ,E>P¡gNX^\Å8¥‘\àÖ›\çw\'iŠNyæ¥Ž\åKØ¬&.{óSDB #¯­iccy¹\'¶8hdc³mf@cÉ­9~¤¤L °\Å/9\éBûsO483ŠfH£4\éŠ\nD[@\è(\ÆF3\ÍOL$\n†Z*H\0y§\Ù\Â]üqÇ½z¡:\Ãg·5óÿ\0‹<BuþÈ¼\íl9\ìqÚ¸ñIXör\Ú5\'UIm\Í\ÏCº0g<×¹À\0A\éŠòÿ\0‡ö›m·\ã†õ\ï^ª:Š\ß­Mfr½v»hN¹\ÅžG¯4(%y¥AŠ\è<¶KÈ©F1Q©0\Æj‘\"Œú\Óð9¦ñJ0)’\Æ:©\"¼\Ó\Ç>XÓ¤0\ÉS\ï^Š­s\nÈ¤6\rL•\Ð&\Ó\Ðø\î\Ò\â\Ê\îK[”\Úñc§µn\Ê\Â+±!ó–?,gš÷¿ˆ¾\r·¿„\ÝD6O$8\î+\æ\É •r¹=+\Ã\Ä\Ñös\Óg±÷9^=× “ø ¬\ÊW\å¤‹c<š\á&Éó\Æ:š\ï_K¼\Ô8ˆü£©\Æk–¿²û†9H.WµE+#Á¹²¬[ø\n©¯@\Ð41\Þ\Ù<ô®SI³–\âUU#&½\ÏE³[x\Ð1>´\ëTiY˜z)¾fM.\Ë\Ë*vp;W}¥À‚Ã©\ëYV–Ñ²¯\Î3]v›h7žJ\äG Þ†·‘1P\ÉnŒ¼~u Ñ¨j´¤€@ª3g5¨B«\0\ä\nórŸ+ŒŠô[\çÝ»=ºW›kr\áOÖ¥nŒ\ç±\ã\Ú\ËG›\0E.j²\\oaŒ\Z\Ìñ\Öù°WwZ—G\ÔZ+Ž\ÕÜ¾Š:\Ô=I¸j#Á8&½\ïH¸F·<W\Ìp^ \ÃqÁû×¬\èž\"·H\Ô3\ÇL\Ö6\Ôô.”7=ˆ\ÆkgG\Ôr˜ü­\Ó\ë^d|Gi³ýj}sY­\ã8¥9•T/$“\ØWU\â\î?\É8´}\ZÞ yB÷¯´ø·¢Ip˜þð9®\ÏOñF—©\Æd¶¸G^kÓŒ\ÓG84\Î\í%\ÝOgÀ\Î{V=µ\ÜN «=ªy\æT“Û¥7+\n»<\ïÇºœð\ÚùP\ÊU¤lq\×\ÄøB\Ä\\_†q»w\"›\â­A¯µWUl¤\"¯xcX²\Òm¦ž\âE_@OZóy½¥{½²…«åœ©{òŽ¶ó4þ!\êm§\éN¨ù~_¥|\æ’:f»ÿ\0x±5ÉŠFŸº\\\\4Hd|°¯QNi-‘Û•`å‡¢\å=%.†ž™óÉ‚‘˜ýÉ¯§<\áØ­m#¹x\\”c¥x÷‚ô‡¸»‹q3g\Û¾–·Y­‘Bc\0c1Šô°T®¹š<<÷\éµJ}\ÍÍ€QŽjº\Ý)0À©¼\È\È\Èa^–rM \n­5\ÚÅƒ´œ8«>˜¤Ð®(\à\Z\\óL\Å<œb¤b³bª³Sœõª\Î\Ø\äÔ¶3LrEf\Ïy\"J<6O5ovqY²\âD\ì9¨’\åO*Iâ©’zVW6H½¿©\ëQJûS5]_\ÐU;\ë‘x\nMD¥¡µ(sI$xÿ\0\Ä?37Ø£\Î[\ï×†j®€m\Ï;k\ÐüQ+Ox[\åÉ¯3\Õ\Ø5\Ç\\f¼:²æ›—v~Ÿ€¡6œ\"­¥ß›2@F8­+fm\è™\Î+5\Ô0\Ù\æ®[’³®+3ªþ¥i\æi¨\å@\Ú¯Cøt\ì-\å¹Z\æ\"+>–™ä”®·ÀQ„¶™‡sZ\áÿ\0ˆ7:wÀ\Ô^qü\ÏN\ÍFý)\â™#\0+\ÑOC\á%\Ô\çõ›¡\r¬\è\r|9\ãmZ}W]™¤b\Â6*¸\è0k\ì?\Üù\Ze\Ëg\0%|7¨’\æV\ï¼\Ô\Í\èez…Xý3Ö£$‘ŽÀ\Õ\Ø`yX\'\Ý÷­8´‡óQ@\È5\Í)$vF\r˜Xm£+Pt5\êølM§0\\	\í\\\î‰qoK³\å\Î\rd«A»\\\ÞT*Els}ð4\ÒEh9ÀûœVœ\Z\\\ÙI0C¸p9\ïT\êE\ì\äöG3\ÇŒakHXO\èS\ë\íI%›¨Ž1\ÔS\æDò¾\ÆQ\Î\áš|glƒ\Ø\ç5lÁ;qP”e\ëCw\Z½\ÏkÒµ¼Ó´\éKå¡/¸Á®ó]Á\×4·\ÇR¿Î¼w\Ân¶x‰83.+\Ù5a¿[Ò”v\Ù^Me\Ë6¯Á\ÉÎ„$÷\å#ñvN­¦\ëù|\Õ?Ž	6Ö‹ž|\Îj¿‰G™®\é\éœ\àÿ\0S¼nrúzú¹¬Ž¸\ï×‰~M\Ðg\Ñb¢ñ*\â-gPiþ/%4\ë(óÇ˜œ}\'Šx—I¬*‡·«â‹›™’\î\É(\ÍZ0¸ñ„X1hWƒ\è\éÒº5Ó­\Zk¤-—¸„\Õóþ·®\ê‹P\Ò\";$•ö—\Ï!}G¹­:nrH\æ\Ä\â!F‹“v\å9ÿ\0ø\Æ\ï\\K[qòý˜2–\ïû\×\0Å&§uüicœu½ˆS4’>:½j•\æ\ç7vÆ…g8\Ïj8©}…+E³µ­Œ\Zx\éÖ—q8\Éü)W*=\Í0ó\ËS$Cž3Þ­\Û\\\Ë¡ÕŠ•\Æ\ã‘Òª\í<1©—\0­4\×¾&G5®™}*¬\ã\åU\'\ïû­}(¬­\È=E~`#ù3	 •þG\Ìrck±¯¶þ|@o\èþM\ÙQ³]·\íŽ\Î>µ\ßF¥\ì™\ÅZ“h·ñ0¼:u\ÕÀ81ZJ±cø¯Œ\ï´æ·Š?8\0\Üs\ë_büSv:,8(’\è\Ïq_1k!gü\Ù|g\é\éWY]#ž‹jr<úX\Â*0pMD¥“ \Îx­›¨–6Ž*œ’®s´ð+œ\îE1Œ\Í·‘d™@p¿>_ŒgÒ¾Ù»ñv›\à\ï\Û\É6\\\Ãª 8\'h¯‰ti\Zµ”’¶;…vc\Û¯ø£\ÄºÞ¥#\É3´A±À÷œe\È)\Å\Ê\Èô\Ýs\ã\ï‰u¥œ\Ù\Ä\Ün^d\Ç\Ô×Žjš½\æ©3Mu<ó–lò¬\á‡Q»ŽiZ5?Ç\î+9NRÝ—%²\Z¼ö9óAAŒgò¦m88`~\èTlô\à\Ô]–D%\É 6\ÐÀ\ä£\ì}«\Ðü3ñ;\Å\Þx\Ñn¾\ÙÀònFñ\Ù\\r+\Î!ž{YVP\Ê\Ü{Žø\Îj9s3€Ošv&K˜ûWÁ\ß­<U?\Ù^!ops&\ìÂº½_Qv˜[ \ãc_\è~ ¼ð\æ§ý¨W’ \ØF\èA+Ý¼ñ\çX¿˜j\Å\æˆZU6ª…\ê9\ï]\Øi\ÆSI\îy˜\ÈTŒ$\×\ÃÕ™\'œI­\\\Ï\Èû:\×2Á~l\nµ{r/o.& ƒ,®\ßL\ÕV0\îE}¥=!ä‡ž³oÌ\ãÁÀm\Ã\ÔTe°>`jWŒ¯z…\Î\Õ91\Çsœ\×%T‡jC\Z\ä~^Õ·­>\éø\åv\n\Ã|v9\â¾+4¨ç‰—–‡\Üetùp\ÐóÔ•_\n3‘WŒ Á™\Ê+gA\Ñ\ä^cœe°£\Ô\n\éÁ“\Ü#ž<`W‡<M8»6{Ô°ujEJ1<\ä\é\Í*“\Éd¼N‚µô‘\àKkTWšG8«7^±%‡\ÙÁ\íX<e;\évt,²«Wm#\æ\í¸¤Á½gPð¥v\ìm\í\â;n5“7€5Ðñæ…‰¤úð5\Ö\Ñló\Þiy\Ç«u£\Þ\ÚI†Œ·¸¬\ÖR­[\ÆI«£’P”]š°\Þx=+¨\Ñ\ä/õW0l\è\Ì\ßh\n;×¡ª¤pc\")R\î\Ç\"À§\Ê9\ÍH© t\Å}ž\æ*ùH\ä\à\ã¸\Ísú°pÑªö\É\Ít¸‰\Ëm\Ísz’\í¹\0‘Ò¸±\ÚR;0.õL\Ôg§=\êõ¼Œ\Ü~TŽ±EÉ­\Ý\Å>\Í\ç2\ä³q_7V§,Yô\ØzN¤’F¬¯ö`\åYŽ\ÞÂ¶´&\å®!¸’6]ƒ<Ö†–—L2‘`È®ò\Âu,¢d*N3‘^Lê»ŸCK\r#–\ÐlZ\í\å™\Ô\ãyn˜ÝŽ\0«\Óif]B\Ú„.ð\ä\ã²ó\Íz5¤6¡x\0zW\r¥¶ý\ä\rÞµ\Î\æ\ÙÔ©¤Ž[²SjÅ†!Eq÷\Úr!\ì\Û0+\Õõ?²²¨$ry\Õüd\ê»Â“\Æ)\ÆD\ÎÎ¾µe\è\Ú\à/<¿´l\Îqƒ^“wr²D\È\ÊT½pZ­œ©(“f\ÍtÑž§*•\ãtŽeð“K\äd\ãñªr8m£¸4Ë‰\Z9\äj(}©3žMw½2š´þgd-¡B\Ì\0À\æž\Ð\Ê\ëÂ±A©\"‘\ßi­}n+%\Óô‰WiX\ÛÏøY„ŸqY\")cg…\åó®ô\ÍÚ¹¼\Ïy9YE­,}#£mpŠ]$±1r+\Ì<C\áG¸kA ‡PR®¸\ÈF\Î\áSø#\Ä\Ât»‡\æ˜[<²w…zS/ŸlùS‚3\Ïzé‹ºLðkBTjJ,ø\Î\â\ÞKi^)\0\Ê1ŸJô?	i±\Ýÿ\0c\ÝI\Zyix\ÊÀ½\×n?\Z\ç<Oc5®½uˆK1=\Ãs^\Ó\à\ÍK\é\é4[\\y¤“\É%²*\îb\Ñ\í–\Ñ*D\0\àU‰XF„šK~Qjž«\'—m\'8ùX\ç\Ó²¶¥ô>;ø…©¶©\â{\Ç‘yJ;\0µÃ“µx5rþGkË–qóÜŸ©&£·„\ÜÎ©\Ï=+M‘6»)òM(V,T\à}k¶´ð§œ™YúŠ\ë\"ðM¬\Ö\æ2Nã¯\Ü\Z\ÂX˜E\îuCVJö<\Î}(‹¸BNµŒ¨\Î@¯Jõùt‰ô\ËS£TlªL‹¹vÏ¥q­¦}“R*[ƒ\ìj©\ÖR¹°\î\Ð\äü·W*G5 ‹\0ö®¯V³†\Òel\Í\È\Ï\Ì\ê\ì\0\\g°­“º9¥™Tcf…MÜ’3RM¢©\Æ7\n«L†…Û“‚+KKŸÉ¼KmÉ¬\Å\ä÷\ç¥\nÌ®¤qó}i5t\ÇJ£§5%ºg\Õ^±’v’þa’p‹ô\ë*\0Q\\×†\í\Ö\ÛM¶Ev$\Ï\×\Ñ®h\ÅD\ì\Ä\â\"£“ùš´­\rœ®½¯’¼tö¨X¡P\èH¯®5\rÍ¬¨:°85ó4\ÝUdƒ\í\åÁBzg‚kªJ,ójBni\Ù\Øò»{o´J«\Ðw®\ÇNðÄ·\çHbl¼kOCÐ¢–0\Ò/\Ê\Ù\ë]\ìR\è\Új,w?\Äæ¹ª\×\Ö\Ñ;há®¯#c\Ã^\ZÒ¬¢Œ“Áp>cø× Á§B¨6\0+ˆ\Ò\ï´\é\ØIröS\ÐWio3ž®	¶Þ§«JœTREƒeT\ç·¼\ã½X¹y\'8â¹›«Ø²RYˆ\æ \ßDŠ÷Fù\áq\\~¹¦EuUN}ë§’($ ›·³^	ò\Ê\Ä7¥4\ÚfsJI«<\êšt\ÖSºº\ã@¬Œs^\Ï\â›–Éœ\Æ!\ä×H0\ÇW«B¯´‰\à\âhû)4tŒ\Ë~\Éò\ä¯®†\çBûD³NG#ŒT~µ_3c¶3ô¯L»°x®>`¿|ñš\Úrj\Z4\Òu\ìÏŸ\ïl¥³™‘\×§¡Ù´’3\È#¯Nñ\'‡\Íå€š 3\ë\ê+˜\Ñm\ÖösœW,«^\'§Oi®\ÇCao£\Ú°\É$]õ´x\í\Ï\Ãg\\\ã·Ò›s­YZðö®s’\Æ1^|›“=h%zýœŠ\nJ¤V¨hŽ1^Y§Oot‹,Q4`ô\È\âºûY\Ød\ZÉ›\ÃSn\á\â\ÚKrZ–¡cÁqœ*\Ý\í\ÉrTgü+†\Öo†œÛ…˜r\Ø\Ã?µW\ß*»¯1N\Ô<\ç\çú\ÔM*³\çy5\Ý%\ÝÜ¡L°ª£ŽŠ\ÆÔ¬ˆ…ˆ\É\ë\Ç\\\æºiK•œ5—<L_\ni’Kp²•À_Vii\åÛ \ÝÀ\â^·\Û[!Xžõ\î\Ö)²!ôÐ›“8e‘ ¤ð:ñO\0šb®I÷§ýÞµF`NF*.€{Ôœž´ÓŒ\ã“ª\ç\ìr`g\å9¯‘üY!7Ž˜\îsù\×\×÷C÷M\Çb+\äŸ\ÄbÕ§\0\Íkœ­Ž	²z)˜&œ{\ãµ4\rÂ·¹\ÊÄ \ã§¨\r\ëV…“\ìßŒŒv¡\ÈVe<z\Òr@&®\Ç\0,¿lÕ¤\Ó\ÚC„Á>óJ\â³2HÁ\ç\nmmÿ\0g6\Ö\Ë\0Wª\Ö|”b¸À§q4V¥8\Å\0cŠLô\ãœñTI½£\ê\Ó\Ø^,Š\ÙˆôN¨«T`\Ç^\r|¿Á_¯¥}\ác¾\Ê&\ì\0­b\Ï?Ì™\è\nI\è:\nŸ¢«\ÄX.M9Ù€\ÈÁ?Ê¬Áf û\â¢yIô9¥<œ\ã>\Ý*\Ä\Ñ\Û\Æò0Pyü*Yks\Ã<b\ëö\×\ÚAù»W¿ <ó]—Š®^\âòF<ÿ\0:\â‚\Ø8\Æk&zPøPõŸÎ˜\Ä\ÔûFÜŽ\çŠr¢‚¼“H»¾”…‡Óš²T?#M1ñœñ\Î(fƒ\ëRm+Œ÷qÞ˜ °˜-J\Ó Ñž\ã4¥‰9\Îh¸XB;\ãŠ\Û\Ð\îd·½¨\È%k˜NsR\Å ŠU~j“±”\áÌš>±¶\âR\ØTP+;Xñd\Z~\è\á ¸\ÎBšó¡\âY#±\Ä\ÅF0Ø®Jk™%}ùW¹\ÍO\Ó÷\ÝK\ÄÚûe\ß\0ô\0ž+u@ù°\Ü\ç=\êž\â\ß\ÐTM‘Ö¥£²1H±<\æS“\Ôûö¨QoJŒ\ZnI4‡\Êl\Åp”†\ç#·\àñ\røPð\Ç\"Œcñ«\è6\'V\Î(½‰”\Ý“e\â\Ç\Þ#vÀ\È<“]ÖªCy¾rN8¯ã·œŽGa\é]n‹¬f\nÛŽ3‚8\àqŠ\ÑH\á­BÉ´{L{_ \æ¡#\ÎpJ£¦\Ý•\äap\0\æ´d$õ=;šgÜ¨É€@\ã\ï@’j\Î\Ð@ƒŒt\Î\Úv*#q‚pqøU›g 0${\Z®\àH\ïÈ¥³\Èsœ¯­c3º‹\Õ\ZH\Ì[›Œ\ZÔŒ¬ub$>\çzÔ‰² þkšHõi½Pñ{¤Úž—	@ÀK’}+Y\ã•B‚A|\Z\å5\Û\Çÿ\0„¦\Ú9\n”E$€:Wc§*Í±\àkÑž³dC\à;\ë$!S8\ÇÑ¨3\Ïð÷¬K@Q\ï[H[H\ç²1\Ç\áM\">K\×\Ô\Ë\â\éœÿ\0\Ër\0ô§Az‘`“’03\\ö¥$ú¤¢4’Fi‚zžõ©e \êmº\àý\ä´¡JR–ˆs­\ÃVzþ—¨‹«%l†À\äŠ{\ßr~SÇ­`\éöö\Ú=¾Õ°#<ö®{Zñe•¬O—Qƒ…_S^\Å5h+Ÿ=ZW¨\ìvfú\×xE^GS[1„‘>F0E|¥w¯]_\\3	™<\0q^\×\à-B\ì\Û\rÍ¸g84ôbIžµmÌ’3\èkA\Ü0~µF…˜‚§Ò¯Ä•%\"Òž*NqQ®	©x\0RZa´`bœ	¢ŒsAh\05‡j’j\ÏªÜ¬NÖ²“²6§&‘\æ^<ñ\Ø-Y\"žN:×†Z9š|žíœ“Zž.\Õ[Q\Õ%PÛ’3YºT{\çPGq^,\ê:•o\æ}þ	\ZH«j\Õ\ÙôŸ‚#1\éªOs]\Ù5\ÆxQ\éð\í\ç\å®\È×µG\à^‡\Å\æ\rýf§ø™\"·8j¨\ÏÒ­\Ä>Z\Ý{$\'¥L*!H4\åpiŠä” ŒSsšuû\Ó	\Îj9$\n\rs—ú\Ôp>f\Ï\à+9\Î1Z•\nr›\ÑkpÁ4ƒ_5\ê¾Asq*Ê©bF+\Ó5ÿ\0ˆ\ãyng¨\Î\à\Þ!ñ\ÅÆ¤\æ\Þ\Ç1\Äržø¯+56{ùtgFö{\î]¶Y\ÛÌ¤Ë‘ò÷¯,\Ô\ã{û÷p0 €µ\ßhRù$c´žz\Öî¡¡Z\à˜*?\\\\\Ög}E\Î\ì\Îw\ÃZZE‘\Ç?\á^‘mn8bÀqY\ÚU– »¨´1s$Ž\Õ\í—”D°‚Ñÿ\0IP\Ø\ÏšÖŠòkiÊ”2ú\Z\æ.<š²¤“F\ë\ÝOZÝ¶°H\ÑUAu>´lJš‹2ü\ÜU\ç\Ô~Z‹bˆAŠÄº–DRTp!2+\ÝN¼×ŸkwV\æ6!»u­S\â¦ûIµ“N!²FJ\à}k™ñ¶óD\åc\í\éN?9\ê=\ãúË«\\–\à\àT6C18Q\×=)/P\ÉpÁI\É#Þ±\îfx™£\Ü;©\â»\ÔN;3NóT+#lÛœc5Pj÷ƒ§s\Ü\0k³œ\Ów‘U\ÊL\ê93f]J\êRwJüö\É\Å3\íw2|Œ\ìWº\ä\ÖR±ü\ÏJ²Žz\ÍR#rø\Ü0Tw«¶ú®¡fAu*ôV\"³VR gÚ®\ÇœÃž=j®CÎ¿Jøƒ\â<Œj‘\ÆW9¯eÑ¾/µÝ±·¼¤Ù ¯œ[N¸V /¿j¬Û­œ\ä•aŽA¡\ÊMZæ´¹!4\ÜSI\ì}	wr\ÞL“K\ÌI¦¹›‰\Ø-¼¥ˆóý\Ú\æt­~\åö¬‡w`Çµo\È\ÌÜ“š\â›p>\Ó\n\éâ ¤¶BŒZ6ðoÁ\ìk5z\×W¤Ø¤ò\Æ\ßww©„\\™\ÙRq¤¬{\'\Ã\Í!\Îf\0(À¯a_2%;\Ô\â±|§\r2.û\Æx®\Ð\"ã ¯£\ÃC’’G\æù­oŒ¨\Ö\É\Ù~z(\Ã;V¬–°\É\Õ0}ERû\ÂJ·Z\è<¢h”ŠŸ<TH›½E$\è™\ÍC)2}ÀµÍžõ\Ï\Þ\ëVV\Ù2Nˆ:eŽ9®n\ï\Ç>°ÈŸT·Bp\\V2’E­Nõ¦\ä\Õ;‰F\Òz×•MñƒÀ\Ð9F\Ô\Ã\ÝFEF~,ø2\å1¢8\È\"³\çE5.\Æô\Ú\ÂZ\êXl\às]Tð\\\Æ$…\Ò@N2§8ö5ó\Ý\ïÄ¯K+¤—Q(9\ë\Ï\âñE\Ô²M¥\êŠ\\•(\Üô®z\Õ\Ô-\Ô\ïÀ`g‰\æ×–\ÝÏ±¥›\å8¬±#5\àvõØˆŠ\â8.\0\ãqc^µ¢\ë\Ú\Ö\Ë9\Ë\'ªæ³h\Ïc¦¶¶\ÎiYõL\êCeEs\Þ!¹Xl‰¸®ƒ^u\â{\æ3\Ç<(É¨­;Ami‰‡d\îq\ÓÄ³M’3^A¬m]FTNˆ\äW«\Ý]ˆI3\ÑI¯\ZšAq;\È[—bMySG\ÝÓ«b4Ì•V´\ã…\ã~F	ªV¤}§*s[·»¾\ÓómQY´mB|\íöšÛ´´\èN\Ó^‘\àûq˜¬.I¯$\Ñe2\Ù½{~¶°·N\á~¦¶\Ã\ÇÞ¹\ägµ9h(_YH\Ý\'Š¯+\åx ¹\Í@\Ç*Nq]·>9œ/ŒRG\Ò\î1“\Æk\â¹ae¸p\Ýwœ\×\Ûþ!KY\0Töö¯Œ¯b)}r9óŸñ¨›&š|\ã-!gpŠ¤×¤ZYBÊ¹P\Ñ\\Ï‡­²\í#É®\ÅfxrQô¯+6Ý‘\ïa)¥³b\Ú\ÔÁô«cD‚t\Ø\Ê\nš\æSÕ£ÁK	%öòEtz_ˆP\æ\ÖHI\é\\Ž\çr\åeð¤l$VPFS\íY0xo\ì3>\Æ%ªŸZõ(vÎ›Õ\â™-º.X\â—<‡\ì£\Øò»\ßy€0\àŠ\á5M.KùT˜ó\Í{5þ§§Z’¯2q\\¥Î³£\\¡tgpæµ…I£\n”i3\ÏNŸ¶Ge\Æ¯¥r“ÇŒñ^ƒª´P[‘|…H\\{\×\à;\0k²”›N\çx(\É$v¾\Z´?gW9x¯ZŒ¾&°N¥s\\·„ôö[=><`\Ï&óôÒ¡\r\ã1\ÂŠ\à«.i¿Sé°±\ä¡ý\Ò}k\çñU‚ñòªgó\Í?\Åä¶¥¦¨\Ç-ýjßŸ\ÆV¹?uG57‰Â¿ˆ4\Ä\íòþ­Rt/Š>„\Þ4\Èþ\ÎA‰3I\â\Æ{¤Cš_úŽ˜\Ë\çGŠÔ¾³¦FžO¦i•\r9E›\Ä-o\âh&te‰\âòù8t\Íx‡¯\Òû\Å\×\î˜\nž\\c\Ü(\ë^\Ý\ã+f‹ms7[œ\ì\Õó\ì-\Ô\Ìü»9,k»½\çs\Â\Î\\]8(÷\Ô1×šž4‹ À\ëY\ê~Zµ¼“Ì‘ \ÉcÀ\è\Ý#\çRl\Ð1‡P\0	\Ï\ÙaXÓ¡f&»K?y>_šK¹`;V•®‰ý\Æ\È\"#\êzõ©U`Í–¥¶<\ÄÀ\Ì3°\äu¨UH¾0E{²xJ\'a¡Ýž{U\ëo‡½À. Œ\çâ“­Eƒ¨xŒ\Z%õ\Ö|¥\Þ\íUnmE«´M¸H1\Çæ¾°\Ãv\Zm¹‘#DùNH«\ÂüG¡4·v\ÍgÌÙ•\è)Ó«\Í+\n¶Ó\ïs„‡\æRjô…:³\è¾:\Ó7ùWŽ\ÖòŒñ‡g\èk’Á­d*\Ä|­ƒ\íõ­¶\ê–2FNcº…ò§ž\Z\î\æ\ÔGÑ¿/¦¦*±¯¹Á\ìx–™\n\\iÿ\01ù\Õ\ËÞ½c\ã\Èce¢²\ãk]~\Åy<rˆ5MF=†1vô\Ç\âº%v\Î\Zk\Ý9\ëØŒw I\à\n\ÌÀL\ÉÀ\Øs\Ív³i¯p¶Ç\Ø\É=\ÍswöžL– \ã€+9E£¦39,e\Û*\Ø\'ŒS¶½´\ã·5\ZBC¨\ã“]†—-\Ë \ìz+&osÇŽB‘ß­:H@@ÁŸ\'¨\Û]’hG(+\ØÖ„i)6Nk;£UN]6ò\Ç4ÝŒr\çŠö‹‡\×Z“ª¾Rû\Ì~ó}=«Nó\á\å„r$Q,²¹À$\ÖR¯uGRJö<WO&£‘6\à‚H¯x	‚+I}pÁH\â\à\'\Ô\ÖUÿ\0Ã¨b‹0N\Ýø<\Ô}b\Äðu’\ØñŒ’kOI¾}:õf^…J0ö4\ÍF\Æ[\Ý%B¼\àf²\ËZ\è¥Q\Âqœ^©\ÝU©©\ÆP’Ñ«3Õ ‘4`IT\Î\"þ®sC¹ó\í°NH\'\èo•\àŠû\Ü%_mB\îÏ±”}…yÃ³©\ã\â¡%\ç½<¯8šˆù«\ïƒ[=Œ!º8­E”\\L«\×5’‘\Ãw¶µ¡þ–Ž\Ý\ÉQ[G5ó,QŒôLc¦OZø<\Ë\Ý\ÄÕ¿v~–®|=/ð£¼ð\Ç\Ím@\Â\ç\é\Ö¡ ¯>µ\ç\Øß‰á³µ}‘ó=w6Z.«o±\â¼\0\Èa_/_Þ“g\Ø\á¯%m‘\ÚÁu\áj\ß\Ù\09ªZ}\Å\ì*EÀF ý\á[k:º\É%fv­Qsl1È®Zþ0¡‡\Ój7\Òa\0ºs\\]ÝŽ©q–’\à\ØŠ‘\Æj\Ñ)À\Æ\rx½â˜®]qÑzÞ¯ke&U¼Ø\ÞÏ­y\æ¿lcx¥ò¿¯G+i\Üñ±ñrJV\Ø\çs\í[Z$yuBEbš\ìt›D[DH7%}+\ßÀAÎ²}µ>g0š…»šê²™§,¥ò))±•\ãŠ:ý\áùŠúN\ÇÍŒ$<\r½\ÅsZ·\Ëp \ãhô®•LdžÕ™uk\êÄžGJ\æ\Å\Óu)4Ž¼EN­Ù¨Cž@¯E\Ñ-\ÃZ¨\ÚF@®?G\Ó\ä\Ôa¼@À=²†)Ž[&½IL\Îv…\Å|^1ò·¨ûœº<ÖŸF´7lµ³\É´Q&aŸEõ5cIñeŽ±x\Ö\ÞH®P¸e\êÃ‚O¥n\Ø\Ø*\Ç÷UŽy­H¬aFfñ)n¬?ynH÷\ãif$3”;r@\Í_šW	»±¬yœ	\0§z·u6R1\ê+#tŠòHœ»ô\ë\Íc\Ç\â\r\æC3,²lÝ´\áõÏ¥tmnU\ÔgŒõ®V\Ç\Â:v›u<ö\Þhy”©ó\08I£9)_A.\Ò¤, {Æ¹mM1o*\ã)®­tµ±\Êf\Ù\èk\Õ+*Ž	C\ÍkMêŒª\Ç\Ýg‡\\«³>½*õ…Œ¦h\ç `0S[vš5Þ¡s\å\ÇaŸ˜\ãZ¦\Ê	58, ˜¢•\ïW\Ï5\è:ª\Ö<¬>N|\Íu¸E’AóƒÈ¬Õžib„\Ä2÷g¨nEv~+„[jw1`?*\äc°]Šs<e¶Œð\à\ÔCSÕ®š\å,ýª]6þ\Îò64RƒvA\í_S\é7\Öú¦™\r\Ü\å•7\ÜzÂ¾Rm’Cô\ê¿üOn³\"W\æA˜ó\ÚE\ä\ÄVÑ—C\Î\ÆPæŠŸU¹rûÁ\çUñ[j.s\Z²\äc\ï`t¯N¸±Qd#AŽT\ã\Ó¯Q…\Î2p\n…>¢¬óYf\Ý‰s\ÏŸ«\Æ^\Ò`;\rk¦Fj\Æ^98þAI\\øQ‡Ê¾¸SŸõÏŒýkGC^\íXŽ\ëÆº@³¼’\ê<4ï‘Ž•[Bµ-	e3¾•œ\ê\'›Ò \Õ[3¾°E*£\Åv:|~\Õ\Â\Û\éú\Ã\Ã\"/¡5\Ô\éò\ê–n¢\â$u\à3)\Åy“\Þ\ç±\rV;¡h“Ã±\Ð:ž ò+•Ö¼¦\êe¶-k>8+÷\ÔWUk¨«Füjû\êw\Æ*c7£*t£5f®|¿\âköc÷™‘Oœñ\\V\ä+\ë=j÷MÁR\à\ç¼\ÃS±Ò¯\\¹‰X\ä`\ã5\ÝOö’<º\Ø%{Áü™\ç{oue±ÀWŽ9®q¸\àò+\Òntm?Š%Q\Ç#­pÅ²WNN+ªE;\Øó\ëÒ•;\\ª¬T\Z’2£À\ä¸Žj€H#½vðôúÞ£ŒQH¥\Ûv­Ž6}s ¦l Á?\êÓƒÛŠ\Ü\Z©c‚\Ùv*ú\r¦°f\Ñ2\îc˜Ë¹I•\âÿ\0¢ymeiFZ&\í\Å{Û…$ù¯6ñ^‘\Í\Ö\æ)“•ÿ\0hTM»tZmÇº<\ãCˆ½ŒkŒ¹QZ?ð‹}©e\"±“’{¥[\Ò\í\ÉþÎ¼„$W{nhô®I\Üô©Ó-š8]\Â\ÃCgp\Å\Ë’ÇµuQ\Ü?À>\Õzô\àbGjË²ŠI>b§\' 5\r¶tF**\ÈÐ’fs\\^µ¡\Ü\ß@ñ¦B\ÙF\Ï\Ô\Ê^\'³Œ÷­ˆ]\êI\Ønxö™\á\ÍSN`^W/œSð®\Æ4>_\Î\â+¹h\Æ~QŠÀ»ENƒ\0Sl•‘\ç~#€)}†kÄ¬t¹µ]DZ\Ã\É9$ö\0W»\ë\ì\r¬ ’¼z\Ô	\ÐMœos$+™z7z\è¥W’,\á\Ä\Ðö³D^ð\×ö/S¹‰\Îj§Œ5{\Û)@Fšõ$¾\Úó¯\é\Îö«(BpH®ú2u\"\îx¸šq¥Urö*iZ\Üz¥°ÁŒH¤~•–ö\ßg¸#!=G+\Ït«‹›+\Å1‚\Çw#<\Z\î\Í\ì—l7\Ä# W5j\\’v\Øôpµ½¤Ö¨\ëì­„ñ\í\Å]“Bµš0“GæªEG¢è°+·Wo\ÍÚ¼ù6™\ê\Â)£\Þ\Ì ‰„N\ÔòÁ&\ì=«¤š4AøW0\ì<þ1ŠƒT’\"¸lK:ö§5¤Wq\á‘]x\ÆGJmÚŽz\Õ\Û½÷¦…$™š\Ú^\Üü¼Š\Ã\Ô-\ÂmÀ®ý\Åqº\Äs\È|¸0dbVÕ£žªI1\Ú8’[¤ \n€^¹c\ìRüq\\/ƒô:/2\á÷±\'ð¯H‹\08\ÏJî‚²<z²¼\Év\à\ã\Å\"ŸÀ\Å4“Tf0y…&8\ëOþ”\Ò\r\0RœC_/üE³’=Ff\Æs\Êöõ,Àv¯ø§m”\Âó\Ï5¤˜¥±ó\á\Ècþ\ï4\è\âi*Œ–<R1Á9®Ÿ@\Ó\Òw2HE\'\æx­e%s(E\ÎI\"Æ—\á9¯—&A½vzoŒo‹‹ñ€£Š½mr\årÃ·Ò¶mµ\É€Ö²\0z\àW«MžŒ(A-…49\à\ÚbtgsÒ¹ëŸ‡Z„3)´vŽ„õ¯S²Ô­\æªžŸ5jo‰—=y¬\Õi\Å\î\Í>¯N_dðG\ÂÚ’wŒu\ÎW¡\Éj\Z\\¶£{#\ÐdW\ÔP\Ç$m\ëŠ\á5o\ì\è\áx¦†\0ûÖ°\Ä\Ê\ê\æS\ÂF\Î\Ìð	„H8^™\ä\Õw\ÛòÖ»mB\ÇO%¼· ‘‘|Wsn!v‘ž+ºRG:n\ÌKE\ß:/P[ô_‡ Hl\âŸ»Þ¾s°É»ˆ‚Xb¾”\ÐÁ©\Ç8\É5¼/º:Db­žµ60A¨\îý=_¦*\Ö\ç2$\ÛÔ‘Yú¤a¬\æ\ïòœŠ\Ñ?{#\ßN\íY\íT|\Äu©l\ÒŸ7kñ\í¸|{Š\å›\åb½QðÙºy\0;ó\ë\\¥\á\ë­=\È`# žµ\Ì\êFö\ê{£>T\ì`!\'=qO\È¯±«1BÛ¶Ž=ë¬·ð\Ä†‘\É\æ¦UTwf‘£)lŽ$79ù@«¶–÷7.8\Ë\ç#§\ç^g¢\èñH¡\áV\àrz\Õ\ßi\Úuˆÿ\0W`z(\íXK–\È\Þ8F÷hñXü3¨2–hŽœ{UY|5©!ÿ\0w>˜W\Ò\Â›€\0\0v\ëN{X‚ý\ÅÁ¬~·>\È\Ù`¡ÝŸ3\'‡uûñm\0òMWº\Ñ\ç´##ñ¯¡®-Q•Q\\Ž§\'!”g\ÜvªŽ*M\ê…<R\Ñ\êx|‘22‚?\Z„ \Üs]¦§¦*å±ƒ\Ï\Õ\Ì4?>Á\ëù\×l%Ì>¤9YUõ94ý«zµöv\0ŒZ‘#p1Z\\\Î\Å\"6\ç4\ÑÖ¯¼Jª’G±v}\ÐrhQ\Çõ\Í*© ©˜óAR9\ëJ\åÁ\êpOn\ÝkS\Ë\Ê\ï;IÈª\Ð0XÁÉ«”\0@\äpi\\v 9?!\È\ÎNM³£†RI‚zu\Å5\ÎIR\ÍIŒ§]¹\n¤Ì§Lð¾¢\íò9zó\Ðb½I`‚k\Ä<;u²\ä)>ƒ5\ìpK#Eœ÷9\Ï´v<Z\éF£.ô8Á\è;æ“¨\íQ«\Ï\0û\ã\åg42\"&\Ð\ÉÀ<j[A‰°{®iŸ6Þ¼*–\ÞrqŒVS;in‹\ÌT1pkJÀ\ßñ¬\Ù1‘5~.G\äW4V‘\Þ\\›kN\Ç,\Ã\nó]Ö“\Ê(Á\çšó_\Îfñ6¦\ÒªNÀw\àW¬\é1tJŒ\É»Þ²øN\â\Ñ\0<ôŠn\ÏÃºŒ¹\Æ\Ûg\"¯Y.O?…s.E·‚uV\îb\n=\É5´Q\Ï7c\ã­3\ÆúT\Í\å\ÇŒ’CŽÿ\0Q[Oñ+P~FŸ$rrEy¦\Ý\Ì\ÌNI§Žkx»»:Kÿ\0ë—¬ùœ\ÆU\n\æžyefwflŽô\ì{ñJ‘–üÿ\0*\Õ3‹6‹¾Q\Ç9¯¡ü¾Mº³Œn¯&ð\ï‡&¿tð€õW·iv\Ëi\ZF €8®ˆ#	\Í-ú\Ð\î\è8²‡šÄ³pºV\ÏAâ†2e~EZS\Ø\Öx5_Z†PüóƒN\0\Ó@õ5 \ÏLc™q\ì\0\ÇJóO\Z\ê«ic;õ!8ú\×}y)T>µó\Ä]U¥¹[er@\æ¸qs\ä¦ü\Ïo\'\Âýc\ìµg˜\Í)–gbyc[\Z@o48\æ²\à‡{`\Ö\æŸ—>;^U5\ï#\ï\æ­\è}\á9Ù§¨…vŒ	\Ç\é^\à\Â\ëj	\Æ\æ½© b½ú_?7Ì•±5-ü\Â\'VÄŠ€d\ÕU\Î:UK‰\Ä*O+K\Øó¬\Ùvö\í-\ãb\Ä2rk„—\Ç\ÚtR˜\Ð<˜8ÜœŠ§­Mqª‰X¬cƒŽõ\ÌÅ¥Áü\äq\\•q6v‰\èa°|\Ú\È\ì¿\á(º”¬‘õ\ÚÜ“]§‰!š˜0qÖ¼ýcRB\ÇAŠßµ€CP9\ïŸZ\Åb\'\Ü\ì–•¶._\ëL\Ùù¶.:Wšj¾\'¶Wh¡\r,™\ÆJ\êõ}\nMN ¢s¾*M+F\Ñôt]–\Ë, `\È\àg4œÜ·bT£\r‘\æ\à\ÍS\Äqý§R–Kx:ˆñ’Ey6³§[é·“ÁvFø\ïŠú\ê\êòWRQA\ë^a¨x\'K½¹yf‘²Ä–Žkš¢W\Ð\ë¡;_˜ñ\ß\êd•TžI\éÒ½:\ç7$€ßŠ\É\Õü#\áý6	H\È\ás¸½q\Z£+\ß$Fwh”\0<\ZÁ\Ä\è\çMžÅ¥B¦DÈ¯M\Óm\×`\ãµyö–:~\Û\Úß¬IŒv\ëY›t5®bO8â°®pE>k™.9ª!3’À\Ð	²…CE¬	s‘M¹krŸ( â›¦H`—SR1÷ZD*ž¹\ãŠó\ØÁ.\Ê\nk\Ù\ïdÜ„Œr+\Ã<k¨¤A\×ƒž‚®*òV9k´ \Ï¼kkx$”©.\Ù\0WÀ±#¶k[S¾7\Ó\î\nQÀ\\\ÔPÀaEz1ZC‘Ÿ\åT/Î¼s[&žj”ˆ	d\Õ\Ø\\\Å5À²\0§gŸj• $^••´\éRP,˜8\'½_Š\æHÛƒ\ÅUò€;—\'úR Á\Å±\ÐE©\Ëf<dq\ËU™^S¸\ÔPœ\×Ö­M*.H\É\ç€°XJD-÷wW¢A2M\ÏNõÁiÖžt\ë~ñ¯c±ðµ\Ý\Ì‹dßµ2Fp+\Z”\ÜÚ²>‡*\Ä*1›m$R±DyW8¯Bð¦˜/µ·\ë\Ï\ã¶\Ü\É‘\ËFpWƒ^ûð\ëFM\ÂpI£·­oBƒ\æŠ6\Åf0TªI=–‡¶XÄ°Àˆ£Tb¯ñÒ Œ`}*SÒ½¸\è|FÜ›’*p)¯&:\×9¬\êB\ÒmÃ¡§s	hG¬ø‚\ÓMBX\å¹\àW\Ë\Þ4øÅ©\Ã4±X\ì@8,\ê\ç¾#xò\ê\ê\æ[X$ Î§“^	s4÷K1#Ò¹«V¶‘\ÜÖ…RÒ–‹±»¬x¿\\\×$&\êúfQ\ÛwÎ‰Ÿ¡b@\ç\Ôb&žô¤ž€WŸ)6zP„b¬\ï3\'Šz\ÍW’ÃŠs¸\'Žx\ÅfÙ²D¬\ìOQŠ\æh\\LU@pA<ƒR–\çzsRõ5ŒœN³Iñ\ÐN‚f\Êz‘_ZøZ±¿Ó¢H¹\Ê\×\Ãìª€F}«½ð_Š\'Ñ¯\âpH€¢6‰¬\ëNªP“mn\\1H˜Ûµy=ô\æ\â\îV\Ïñšô-;RW°I\â8¸9\ìMq\Þ\Ôb¿2«)>Ô¦œ¬veõ)\Ðs\æi;hy\ç‰\æX­vä–›*ª=«““O6ºoœ\ÊC\Ê\Ão­u:\Ü/¨x†dlC\0}{\Òx\Þ(¡†\Ö\Ü6-rÔ\êQ\Æ7+®l¯s\êK\å³Z\Z +|\àtj_[™oS\0\È\ã¦*mUjW\Ñù®i#\ÝÁI6jxnMó˜±‚\Åq_B\ÂÀ\"\Ø\nð\ï\Ûo\Õc|\ïÖ½½QBšè£¤O>•\ëB=£¼qbjaŠq\ÏCPI\Ó5µÏœ±‡«6\ÖO÷M|\í\â\Ý\0¬k¶E$¬\ë\êk\è\ëÀ¾S\ã¦+\Ï.$RTu5Åˆ›‹MxJqŸ2ghLg\åÚºxÂ‘\Èüj£Y\Çk{/•€¬s€+¡¶¶YSik‚¤\ï©\ìQ§d‘‰7‰-4\çM\à· qšÐ²\Õm50LG8\à\ä`Š}Ç†¢¸ •w\Âí’¿\àkB\ÇGµÓ­E¼1\0«\ÎO$ŸsY6¬m\Êæ•”\ÛP~”—\×dpEET–©O‰&ú\Z‹šµ¡\Ï\Íke)-(8\Æk*}Eh\ÛÊ¶E<ý\ÞÆ«\ëþ½¼»Ar\"\0u$\åRËŠ\Ä\ÛÜi\ælÛ‡\Þx5ªv¶¦­·xœ~¡la\×q\Æx\Ïj\ça¶–\êuTBF@\'+¿½±–\ê\æ8#\É.À:Vý¦¥\í¦ò8y\ØV\ê·,L–\ÚN\ïDŽ‡BPº½¥¶\Ô\Ûâ¦Ž <dOp3øb’\Ïd01Ž\ÜzÒŠ-\Þ1r\çŽkž\Ôt_\"‚\í›Æ‹«\Éú\n›\\;üY`\é\åÿ\0:e†\Æ\ÓpT·™—\Æö\ëýÝœP\Å\é\å¼C¥©9\Çø\æ ñs´zÅ©X¤,vŽM[\ÖS‹4\ä#9\0Îº°\Ç}\â‰w\0U,ðÖ´°””y[\ìR\Ò\Þ=o\ÂwM’QùŠùBxLœ\ä>â­ž:W\Ó^X\Þ\ê\Ú\\„‚U€®[\\ðl*±\Â4‹?0\ë«5©\â\æt\'6ùvZ\Û\Ôð«[).$H\ÆI\ä+Ô¼5¡%¬kpT?‡#‘U|7a½e‘1,DËƒ^·a`¥—Ž˜­\ëT{#ƒ‡·½#û:ö\í<¸#\å\ÎKú\n\í4oKm\Z)Œl^[ýªÚƒÉ·\\±UU“€8«úö™; »‚FôGJ\Î;¶I—mô\Ø›H\êkV\r9¢¡µ˜7#§j\Õ3`dñT3&ûO‰\ã(@\äs^_©i6®„-\Ìûºú\ç^£spŽH±Ž‹j÷R\Ý2\å\Ý6’¥4\ìaR<\Èù\Ó\Å6p\Û\Ær$gS\êyÈ®7I»?\ÚvQ‚µ\ÌAXö%±^µ\ãKKd\Ø\Ê>rk\Å\à·Y®\Ö\'dÁp¤ž€“ŠôðžúHð±‘\ä›\ÐúŸ\ã]³M\àû[ ¹wP¹>\Í\Æk\æ\Ë\íRS©M>\ì™UIü«Õ¯¯<U¢\é_Ùš {:h™\å;8\éŠñ{\Ûg†R¹B\0á³ž+\Ø\Ä\áVx\ØjŠ|Ë³\ÐômnÓ ™GÎ­´­W\Ö\ÂË£\Í8Àf‘x\éŒ\×¯4!G<qŽÞ¢¥¹¾i6\æ*z£8®#¶0\Ø\ÔðÞ˜úž !\ÆBáž½¾\Û\Ãp´\ë\"`l@ v®7À\Ö\ÑCnò.79\Î}«\×lW<W™ˆ«%;&{˜:t\Ójíœ¼^\rº.$YU¦tb€ôÉ­=\Ã×¶±Æ—\n\ZWo‡ A]‚J\ìA=o\ØKm)\Ù÷\\u0kŸ\ÚJÛñ£M=\0¶cEÀT\Ð[Ám¹•\ã\Ô÷­3\0ÞªÜ¬p®\æaY¶t\ØÈ½ò_<rk—»·M¹\Ô\Ö\ì²+1\ØqY2.v\ã+6\rK\ã\Ãm\ç\ÅòKI\ïšð)\ãòŸit\×\Öú„hñº°ùH¯—|A·\Õ.bùd?­uafßºx\Ø\êiK›¹«á ¢	/Á®§Š\çü?\Z¥‡ ò\ä\×Cû²c\é_£e\Ê\Ø*_\á?1\Ì\Ýñµ¿\Ä3“Þ˜\Å\Å<¦G\r×µE‡Lgð®\Æq-\ÎOX†i¥2ª!.@\è3\ÔÕ¯o{ö^\ØûW¢xv(f¶\Öc‘f…wd	\â¹\ÈtI|?\âm!\ÂO’#\ê•ù\îuR\Ø\ÚðôüU\Ï\Òò\Z<\Ø,=N÷üŽúk{¨\"/i\0’b0gjPx¶g-œ·3FY\ãL\rü$gµwšLbTS]t0 Q_4\çf}j¥u»G\'¦\ÅyŸ\Z\ÞLe˜DŒ\r\Ý\Å[†\àý™³\É5£«„†Ù›8É¬…¢$t\Ås\Ës¦*È´]¥‰˜|¼\à×—\Ü\Ýx©uñf\ÒH-¼\Ãû\ï/÷~V2\ïZô\Í5Ä²8Žõ³%²4ahŒ¹H7>­A\æ\Ý\Î\Ò\Û\\\ÇÊ±\Ù(¿NÆ¹OÙ¬6F\È5\ì÷ö¨\à`s\é^O\â\í\ÏlQz—U\0w\ÍoF^üYÉˆ¥û¹.\èòH­n.C˜£g\n9\0Wqi$1¨\ã\ä¯@\Ò|7oÈ§\Ì6Å¦oV5Å¼qrŒ6\ä\íõy-EU\Ôvøl|^{EÐ$\ß\Å}=U€ã§µ\r$§““ßš`F;T›\ÝG$œgôGÍ¢¹\Æ=\rù}NM!`wS\Ã0£;¦uºN†útºv¢§b\ß)YûŸ–º»›dµ½^\0\Ü‚ö÷þ(ðL\Ð\ÃòOj\à!\'\Äg#š\æü:š­† ö÷¥ö\Ëø\Ã6\à\í_\ršA¬L\Ûg\ßdµ\Ã\Â*:w=\ßOQ\åƒ\ê*ô\à$DƒÒ±t\éóžj\í\ÃùˆW?xb¼9SŒ4a-ÁïƒŠÑ»\0 \ç¦*+X\Ä\r÷8ýjôòG:\í\n:sRYoOe‘t¤`^O§J\çtõò\È-³\0ûV™½8#ŽhZ¦\Ð¸‡´k\É\n!å¸®§T¸ÜŒtâ¸—ñ]Ž…xc¸‚I\ÐcoAš\Ú	ô9\ê5Ôžþ\Þ\ér[@Aš~7\ã×©¬¿\nXyúÕ¤J¤\á÷’G§5Ÿ©\ë£[¸‘”Ž1\Æ{“^‹ð\Ú\Ô<÷—-\Õc_Ç“[\Æ\é8ªty\Îk\âòµ\×\ã\ïB\ry\Ü\×\í-Df7s\Éô5\ë_U£\Õ\áq€\Ü\ãÞ¼±mn^\Òf]¾t€ûæ·¦\Ò9«)Nh¯A3!m\áÀuÇ½Y¶y\ío\á–\Ýv\"\Þ\ês^‡\ái:ý›½Á•%·“\0\Æ\Ø\È5½uðªB¥­u¯˜Ÿ\áZ«·tsUœ#xI\êzÕ”\ëug£ø\Ð7\çL2\'ž™<\Õ-\"\Öò\ÃI··ºhÌ±Fû§\Åp_o5+-$MepaW—Ë‘\Ô|ÿ\07Mµ¥\ì’ò²;mk\Å\Ú6ˆ6\Ü\\£NFV\æFü+\ÆüO\ã\ÍnñD\Â\Æßœ¢\ÈõÀYµ\È-2>\ìI4‡|\ï“W$Œ8,\ä»{\Ö3™\ê\á°k’\íjk_¤z÷…Z\éw3F77®TóU4Bm#]¸ùsV¼;\Ñ[^\Å&\'=úsÚµt˜\Õee\ÇC\\““GJ¤”ˆe\Ò\î\ç\rþ\éò qƒ\Ø\Òøn\Ã\Äa\Ùu!v¨/¿sz\æ»\ÛkE‘¸ãŠ»4q\Ú\ÂYF+\Ïtk\ì\Õ\Ó2\ãùeXóŒT’³Úœ‘Yû§g\Ïzt3˜\îA\Ü:þ5\Ø\Ï\Õ/­´\Äó®\ãgB\Ø\àt¬cªh:¡\"\ßtl1\Ãg\é]\íöˆš„,¬‹,rr\Ê\Õ\ÌK\á«[X<˜\àTPI­T•Œ%	_¥Ž^K(¢·8 ñ^u\âVÌŽ‘^¿q†-¤Šó=J\Â]G\\Š\Üd+`p;\×Vv‘Á‹¥\Í%­\ÎEmg‘Ø®zâ¾¢øg¢}ƒD\ål’\ä½\\Õ†‹o‘Z$yrŒ÷\"½\Ê\Â\Õ-­\Ñ`(\ÅuF£™\åÕ ©[[¶\\PT\n°¹\Å0Švj®d!®O\Å²óWþY¶kª,Fk+V¶ûuŒöÅ¶y‘•$u©’ºhÒœ¹f™\ä‘H\Â\à—#\æ\é]µ›\î\nkÍ®<;7‡¯u\ÛN’r»»b»>\èµqT™\ìPšš6¯¤V@3š¡jÓ®p\Ãiü*¤³’O8j¢\ß*¿ß¬lv#ZAtò\Û\æ+f\ÈZÂ†\é¸5¯ r¤3FV\Â0\Ís—\Ì’N+bY7ó\é\\Ö Ä†\Çj	g©·*Â£$·A]“­´`Šò\Ï\ê\éØš$Áô5”~\"K5«E-¯\ï\Æð\Ü}k¢e5tyõ±4\é6¤\Ïr‚\ê\'r@£R³örDÃ’01^U\à©nn\äy$g$œŒ·­z…õ\ê\ØXI6NB>§Šõ©AS§¯c\ækV•|G»\ßC\Â\î4o°_\É\Ð\0N;\â´\ã²ù7–þ•qU\ç¸29òsŠÔŽ4\Ú±^}Z³\ß\Ã\ÐQB\è÷B1\0\ZôKK•t W–\Ü\Ü`ž7|§5\Ó\Ú]0@TŠâš¹\è\ÃDvÓ¹1°·j\ç#…\Õ\É9<ó\Å\"j\É\ã½YþÒ·lýsQcU¨\éZ	#\Ú\0\Üjµ·\îº\í\íš&¾´\ØyZ\Í}E>\êSH–t_\"‚®{\í+6£(<ŸJ¤8;ZÑ¦2c€\Ø\Ãc8ö­¡NZ®\ç°\Ú\\Àb\08À­(¤£^\'su¨[!\Ä\Ä)=qU\íu\ÝV2\ån\Ü\0Oµt©žkÃ¶\Ï|\r?#=kÆ­¼a©Ú•V\Û8÷\àŠ\ê4Ã¨La–?)À\'\ëMN,‰QœNôšMÙ¨¢“\Ì\\Ô½EY‘Zc\È\Âø\ËH]GLu$\ìqš\î\å\ä\Ö«÷c=*‘QWhø\ßP´û%\Ã#ºNx8®ó\Ãñ\Ç%ª¹gò®—\Å~[”70.\'#“\\Ï‡A”s®sž+:• tS¢\á?#²·¶‚\ß\æ#¡<š›ûsNü·h\Ã\n³ö$½„/b\re\Ë\à›{™Ë°ÛŒÞ¹.Ž¾V¶GIg<7*sÈ®C`U\r/EM>28\àV°a#?Ii36_0¦2µswd¥¼×ô\'\×UÃœ~U\Äkž\Z„\æq+™Jh$Œ\Ë\ë=2ò\'Ø 2¯7\Ôt\á\Z1Œ\çœ÷¯D]\æ\ÊVò\É\ÄpNkŸñ·”„€01š\é¥R\Î\ÇjWWh\ä|7§}¯WDc\Â\Í}%gd …TŒs\îk\Êü¡\ÜCþ–\à\r\ç¡\à×³\à*}\à+¾D\Ï‡z\r\nvñ\Ï4‡¿dóJx#oA\ê)Û³\Çz\è¹\ç8Ù‰ƒƒ\Û#š@2\ÍHA#œ\çU{™V·ž\Ý*eª.ž’G=<e.Y‰-ƒÓ·>•\Íxš\ÞFƒ;H{<df§ Ž\æ\åÔ¡\î*vªò\ÏgÛ^mOŠ\ç\Ñ\á\åzv<\Ò\Ò\ÍReÜ½Á_c\í]Ý–\èÔ“ò\à\à\nÅµP$ cŽ5\ÜXCœ\é\×ú\Ö&ÎªPFl‘Y\ïMÿ\0/sAy bö·\0€2Vº¹¼=kyI†\Ï\ÔVl^K¤jH\';&¹ÜŽŽBkJ\èL£#9#¿Ö·\r\Ø\Ç=úV\"ZlnüñE\ÞV=¼sQr\íaº†©h€lš\ä/uK9¸G\Ý\×8\ëRê®±dŒž£¯zÍ­¦›|t\ê:gÒ¶ŒÞ§9¨K­¹N~CÏ¹®~ƒJ’O&ºF\Ôù€¨Àbª}ª\ä>D®Ä† b½\nS²<º\ÑnLá¥)Á\ÓñªrM\Ï\ëWW±{IN\áŠ\Â+!=:{WJ’±\Í\Ê\ÉD¿0\'ñú\n°$F<s\ØQ›y1ŒŽ8&¯‹\nAf8\0žýi9¡¨39\Ô\çv­I¤\Ó8œ€O\ã]¶‰\á\ë‹\ïž_\Ý.295\évš=¬_º„A\Ç?L\×<ñŽ‹S¦–\ZS\ßDxý·‡õŒ?’Tm\È\àq\Û\ëN›F¾ˆ1Ø£\å$~µ\ës@ô\0Ø¬\É\á]­œ{\æ²X‰6týV6\êxü–Ò…ù\×‰4Â®PI;°s\ÆkÐ¯,\Ãd\ì\Ç?1<\ãÿ\0¯\\e\ê\"’s÷x\éžý«®œÔ>½7Yðô{\ïÀÝ^\Ñk\Â\09\0^K\á¥5HP~c\É¥{J(\Ú@\ÅwG\á>w­BU\èrF1À¨\Ð\ÏËŽø4\ç\É\ë\ÜRcZL\Î#ø*zfŽÁ¦|\àsëŽ•Ï˜Š:‚Ö²‘\ÛI\ìk³a…\\„e±‘ÈªO´\0z‚:š½oŽ0=Nq\Ç\Ë#Õ¤z½®e§\Þ\Þ\ÊY‰cÀ%‰®\ãH\r$\Ê\Û0u5\Ã_Ý¼7j\Â=û¥`wšIÔ³Ž¼W¡»øNö\Éy¯:ø\È$ÿ\0„I‘/:.+\Ó-r˜È¯9ø© þÊµ‹\'\r)$V©\Ù•ž’~G\Ç)\á\ÝFP\Ü(ž¼V|\Ú£ò‹\ã°\ïšödŒpp2i\Â:kD\Ï9\Ô\Ôò_\rjSP®3\É\ï]†“\á)\Ã^8q\ÙGó5\Û9\á@\î=…J‹\ß<V±3•Cr\Ò\Ò{dX\Õv\0F1\Íj[&\Þ\î½;\Ö5¼²nXÕ¸®±-˜\Æ\nŽvŽµ\Û\rQ\ÊÖ¦ÝŽ\äQ»ø@­\ã®~\Ô\È99\'\ëDJq€9¢H\Ò,Ñ†\às\Åh€k6\Ò6“Žµ¨½+6o\ËÁ\Ï4+\Í\éôª³ÉŽqPÍ µ9\ívÿ\0\ìðL\ä\à\"šùKXº7\×ó\ÊI\å¸úW¸øûTû-Œ9\Ý&F}«À	\Þyõ¯>yÛ±÷™B„ª5¬™,	†^\Õ\Þ\èšj\Í\"+s\\¹’E\Í{›§½…¡¹‘~b¼/ ©£\rnzüJ£J\É\ê\Î÷D–\Õ\"T„¨1\àÞº\ÔrW9\ãµ|¬¾/¸±\Öfda\Î@¡õ\ì\Z7Ž\ì\ïb\Ä\ÊÑ¸üTý\rzp«¬\Ùñšœœ’½\ÏDš\áb\É$t®+SÔ’\æO*#ß“Yz†«> JÅ•Œñž\æ³!ý\Ð\Ï$gñ¬kb:Dš8[4\äh]Üˆ<uª^zIð\Ç³¤\íŒ\ç\0\ïY7×‹n€D0Z\á”\îztâ‘¾—\ÉŠ\09\'º/\í¢@\Í\ÜW“\\xž\Ú2»A\ÏºT\Ð}·\Å-½´›\à[\ã3ID\ëõO\ÙY„—b2ó\\›ø\Ë\\½\â\ÃL•\Ïbx\É5\é\Ú\'Ã­N)$ùº”òKr¹ö\ß\Ãg	¶(\ÕTvº\ãJOV\ìpN´bôW>b¼Ô¾!HŒ\Ñ\é{0+\ÉõwÆ·H—m«*•öÎ±‹w÷SúW\Ç)5Œñû\ÓÒ°­FŽ¬/ï¹ºsro\î¤\Å\ÅÔ²0\ç\çbG\á[\Ú¦\ÄÏ¨¬\éT‰y\ÏLÖ®Ÿ‘Ê¯\ÐN\Õ6¼Jk–g\ÑZL‰$(Àuµ\çyW£^¼\"¾v•\×vŒ&PA\ÄôgtZ±7w\Ò\Å\áœc½Z7³¨&H?\n Lö³Œ‘[ñjÒ´@JˆÀ\âšƒ.¯n8e\Æy¦¦£	\'a\ê{U}Zú	Ù•mÂœõ\Åc@	sòújV!\Ê\ÇA}«m\Ï<b¾~ñM\ÕÞ©r\ép§µuþ)ñ\ÈÑ£e˜ö¯>†\é$\å\Ï\Ì­va\é;s4xø\ÜB”¹bö\Üà®‘¢—ni`”\'¡¨\Ûo\Ý/9\É\Æ+%TŽ¤\n\ìH\âZ£¨f’!–Rq÷j²SÑ€¬ÿ\0Þ€\ï\éJ²Ëœõ\â˜$\Ëf\Þ,œ¶EQxðÇ§\çÒ´\íÎ“iÁ=É­f\Ð.®\Û&[¥g&’\Ô\Ú“\Ù†0@\ä\â¬Áe,\ÆH=\Åv¶¾\rºV\ê2¨=9\Ý]…†\Ô \Ð\ã±gsÊ¼c\æu\Ã\r6•ô<ò\ÛH’0‹Ó±¨u[`¥HSŸJõ\Æ\ÑV\Ö&\ßó6+Ïµ\à\ë0\Â\àgŒUSª¦MJ.ž\Ó%¹¼Cƒ\ÉÀ5öŸƒô\ìô\Ðd\Í ð¯–>Ú¼—\à+\ì·™e2@5Ý‡I\ÈÎ¼¥\n	wz˜š×ôý\\\n#™9W\Ç\èk¡\Ð4U\Ñ\í÷\"º¥Q\í]\ê	;žl«Tq\åo@\\\ãÒ”œ\n:š‚fÀ5g+!™\Ð)5ó\ß\Åo:É¡¿}.T`\àŠö½F\çln	\Çñ\Ç\Ä{¡}­LFD¸\0õ2\Ò-˜IÞ¤c\Ý\êx\Å\Û<Œ\î\ç9<“Y\È V\Å\ìlƒ6sÞ±^3“^l\ïs×¥nT\r!sŒð)>@´\Ö\\\0\0¨›ql\0k&n…Ý—§+Œ}ÑšhÀ\Îiw*Œð+6Z\Z[=\0úznZ2~”*úô¦.qš$\Ë`\n³ž[8ô¨‘	ïŠ»\r©“®pOZ\0ú3\áŠ‹F-%nXp=\Å{¡}´v=“_&ø9\Ú\ßV¶À,}>¬Ð˜\å\ÉGcN\åË¹\Ãx^\ÂK\íV\êÿ\0\ËeŒ¹Á>¢µ5O[W‹\í\Â$µz¥­½”	(Tp\0«[WƒŠ\ÊVfÐ¯(j»°iV:}±Kh1ŽÃ“\îMx^º€k c—¯¢n\01µxN¥je\×n:\ãxÉ®J\êÖ±ôyW*•yŸ\ÙFÿ\0„£hdŽN\í\Åz¤m\ÇZóý\Zö¨ñÛµw\Ê8\éÚ7îœ™Ì”±!û·z¯#õ\íM-·\Z…œj\îx¬¡w½¢|u\Åx\Ü\×\Ï¡-¤\ão\'nk\Û$\Çzó¯øM5\Ërð·•:}\×Ê°­dk‡¨\é\Ì\â.ŒF\ç\åe c v­ý<ò•\ÅZ\é7:<\íË£»a_\ëš\ë,[\é^eEc\Ý\ÃÏ™„*¦ ½\Åš-f¬J\Çj®H\êq\\ýN\Ý,g+\ÜS\È7F¬X\Ën\èK+/ª·QUc]oBx<ŒU\Ù0†@OZÌ¹…&\ãw­’B \æ°5I\Ö8NM4\r+ú[®\æð\0\È÷©tw7&YX˜a~‚° ¿‡S¸ƒNƒp•\Ü\ïnØ®©!M?\ÅÐ¨ù@QœV…\ÒE©\ÐC\ã([o\nkj\ÅD\Þ(¼a\Ö8ñUuCx¢\È\ã&[ð5oÃ’}£X\Ô\å\ã±šgO\Ùùz.\ÆW„v2Rà¿Ž†{1øS¼2‹\'‰õ\äÿ\0¬\í\ÇZ–\Åwx\î\\\ã‚\ÃòZ¤¶+iK\ÊÚŠÿ\0\Åggžx\\V\Ê\\ýŸ\ÇÀš\0¾‚²\îÐ¿\í‡½GµM\ã{=^\ÃQA€„#ŸB9æ´±;¸®ð3üM»GñTWqŒ	”1þF»­\ío! ó¼gŽù¬Ïˆ–B\ëK³½Ÿ(Œžû\\qY\Þ¿Kû$˜‰bÀ8-\î)¥faV<\Ôc%ºÑœgöY\ÓüI;…;eL\çÞ½+H‹¡\Ç8ƒ¬\ÆRþ\"\Ø%\×ó®¿J@#ø­/{\n)»\ÑWR]r¤·±Ï­r^øy/‡ucvóGp‰¤¢lÛ¼ó¸÷\Å{¤ ¨R9\Åh@¸ qZ\Å\èD£©mf–\Ð\r\Ä\äöô©®ž5‡\0\ÒÜ¾n>ƒ—yû”A\Çrhl,s^)¹\Ô4\Ý\æòÀnž=¥F\Ý\ÝO\'®+“ð\ç‰üMw¤\Ï{s@—5Ú¾TŒ§«\îz\íª,°«j›ûƒ\ÜVž†Nš÷{lx÷\Ø\\\éÑ·Í‡`w$ô‰ÿ\0>‘¥xnöþóýb¦\ç‘þ]¬G\nƒÖ»\ÝkOk\ë\Û+`\0A:»t\Ù\Íyw|F\Þ#½].Ù€°²m\Îsþ¶~\äû/jõ2\Ê±ˆBžÉ¦\Ù\äfU(Ñ¥)OVÕ’:\ÏüB6ZtZ~µ\0»²\ãl…²ã™OZÀø¥£øil­5\Í¡håœ¬\Ñ\ÄFG\Þ\Û\Û\Æ@\å)\\\Zu\Ô^u´±ªòÀÆ¿G\Ååª¾\ZI/z\×^§\ÂQ®\éWR¾—\Ô\á$vf\ç\'Š\êü3\à\ÍC\ÄbiCˆ-¡t„g­c\\\éwP(b€ñ^\áð’H\'\Ð5[$9˜^D\Ç#+ó\ìu:\Øne(¸\É5£G\Ø\à=ž\"q\Öñi™\Z‰y j\é·\'=9Ý‘Ou¯_²µ)fõ\ëGˆ\ì<™m&òð«ò«zfµ\í m\íŒW‹)9;³\è©RPVF<¾-\Ðô“²yX¶õLª\änn™­ý?T\Óu˜LöÁ™\Ùc©\ä~¾\Óolå³ž\ÐLs\"Ž	>¹\êÍ¾e \é\Ëmg•`ˆ\ã\Îzõ<Ô·¡´S¹¡\r\Ê\É°8\Ú\ÕBi1\Æ\ìt\ïY«+d\0žjõ§\ï¡\06k+š\Ø\Â.ðüÎ¥\Ôl\îbŽ\áz\ÓnBN¡“\Ó\Û_\0\èvW\×7\ÐF\ÂK€Û‘¹E\Þr\ÅlÖ€\Ó\"Ó¡X\Ó\î(À\Òl›3’¿@±±lŒ_9^\é\Z–½®\Þ%¥³\Í\"¿ÏŽG©=«\è\Ý`üŽaYþ\Ó~\Ëk;lÏ;;¾:öª]6\Ú9«PU¬™\æsh\è\Öq!\\ª Ã¦{\Öp\ÚA5\êþ%¹‚\ÃIºYÂ“-ÀŠ$õ\Ï5\åm³° W\è2¦+û\Ë^\åMuI™ñ\n–jw´\ã\Î\Ó\è\Û!(¹\á©6ŸZ›\ÊF >´Æ‚O\á ó\Ø×µsÂŠ#±\Ô$\Óu‹Y\å$Á.a›\Ù_€O\Ð\×s\â\ÛI®\Î\é86}[\Õ[Wœ^\ÆgG…ø˜\"º\ÄV—\Z\Ú~¥v±^Dj$\ãz¸A=kâ¸‹	\'V5\â›\Ò\Ò>ÿ\0†1‘a¦\í¯4OIÐ¤ý\Ú{Š\í£5\çúos+¬[‚#88¯Œš´™÷”õŠ+\ë£\íI\0™\Ë\ã¾;VT`-©_³‘Œ\Zši‰\äg5¼p¥5“6H¥§\Ãök\ã\"‚«\"\á\Ðö>µÓ¹\0dt®q$ù²M^K‚GsP2†§ \ç\ÒÁÎ¥\n°Ü±°r¾\ë]û‚	>õ\ÎZE™¦uûª‡sg\ÅmIÕš*ø¯W6v9÷’¯“An§\ÕÀ¬Q¨\nŽp\0\Ón\ï›W\Ô\å™ù·€\á ñõ®“EðÞ¡®J‹N°óNzW\ÚeT£„Ã¹MÙ½Yùösˆ–;”j:DÉ‡N\Ô.\ÄI6Þ¾Z–Çµ¿€6ûi‘Fs¹¯©t]\ÛK³Ž\ÞŠ¸À\î}O©­–´ºªŸ¨­%šYµi\êe¡´¹§g\è|[¾=\Ë\Ï=pjO3¸_T\ê¾\ÐõU\"{I?\Æk~b¼\Å~“\Â\×gzy¶S1\Ø\ã¨ÿ\0\ëŠ\ÊY«_`ì¥’\Æz{B/\r\ëió\Î<\ÏÂ½·f­9a¹¸û5Á˜\Ýs\È5›\áÛ—Igt¨\×|3>a]·ªGkm*ùÒžXóø\êò¯Y\ÎÖ¹õn8jJ	\ßS¯µu‘w!\á€\"ƒ8\ä\íç¹®oF¾h\ÐB\ç ”\×Fö\Â\å2Bšò\äi\"\ÌWQ\'\Þ Õ†¹·^®Mf-‚§\Þ²\Ø@Gª,v1Á\É\Î?\n ,òù9«¨\É\ëÚ‹&djR$1³;m’MyfŒ¶º¯Š#–ñ|\Û)œ¦qŸ\á\Íz.¦©©4–øb¡~lw®]ô\è\í~H†\Ð¶„’F‡<\ßCgm«\\\Çi\Å0\n«\Ó W¬ü7ƒ:,¯Ý®Z¼bty\\œ1\ã$\×\Ð^ƒ\ì\Þ´R:\å³õ­\à®o’†+\Íg\Å+r§O‘T°Ã©¯[\Ì\ÙD…$\ÊÝ~_Ê½÷\ât.tx%RFË…û0\Å|ø¶\×\Åv\ÆwùeG\0qŠ\Ò*\Ì\å¥\'*±\ìÿ\0\r.\n\\_[¸#z¤‹\ïŽ+\ÙXœgšù·Á—\ïi¯[39(hÏ¾kè¨²\ã$+j[ve\Zª_\Í#«¸#<\\\çˆt$\Õt‹›OT%Ñ—k¬\ÆB¸\É\É\â­\ìpBMI>\Ìùf\Æ\Îö\âso‹ü®qÀ#¹®\ïKðdQm’ùü\×}\Ú\ì¥Ó£\Óõ	ö¶F\0\Æj\Ø#¥pÍ´{ñ¬\åm™\å%Õ­ô\rA!x\Ñ¢>s\ØTZ4±\Í(’2J¸\ÈúWe\âM\Z\ÏVµq:d…ùXuS^\á\à‰ÌŒ\Ä\Åx\íŠ\Åê‡¯1\ê6\Ó*€+?Q–K­±£mA\Ôú\Õ%¸ÂŽ(ûL§‘Š\Â\Æ\èš\Ö\ÊÞ³\ï-\ä‰÷\ÆAÛš\ÒCl\ëócð4¥!#*(°•r—6H\äa±‚*Ž¤ª{õªv÷?fSªóÝ—$“š=ŽgV`¹R\Ï\èF8®d¸dÁ\ÏZ›Ç¦2I®j\rCŽÕ‚\\1º£úƒ]t\á&´Ló\ëÕ„e«H\ï4\é.uB¶«˜­¾ißŸ”ž‚½\Æ?¸¼v®#Áš\\z~•8i%ý\ã°\î_š\îx\ãÞ»aTx\Õ\ês\Íù\nM\ÃmF\ì0j\'Ž¸­¹d7õJ\êU\Ç\\cž{W9®ø\ÇG\Ð\Ð	\ç\r&8‰9jñ­_\Å\Þ\"ñ|ÿ\0bÒ¢1DI\ÎÞ¸\èw\Z\è	=Z2sÔ·\ãÿ\0X¸`´&g„üì¼š\Û\Ño\Ö\î\Ý`AQ\\\\\Ð\ØxcO–‹Ï»•J\ä—=–£\ÐU\Ó\"Yf·t¶‚’7P¦k“r\èzI\Î3\\×³;\ëù\ÔC‘“\ÔRÁ‘_\êEIŽù#=\ëE,\'L…p=\ry§¹s\Zx\Ñ3\ä3¡•oi·<k¿\ïõödŒÙ‘ò]Žp´›)²i%Ú§µs÷÷!#lö«—S\0¤\î\Æ\êw\ÆS²<\í\îhFszU\â½A§½x\×\î¯?r‘†w	\×\'¥n\ê¶2Kt\Ïd%\È;EmxK\Ã—š‚I-¼‰‘\ËW­AÁ$š\ÆF£”™\êþ±6–	½N[9À\è*ÿ\0Š$rB¹\Û\Ë\Z\êltö‚0ˆ½«Ž×›Í½\ëœ`\ZºõW%‘†\ÝkË¡\ÏC\Ñ\ÛÚ¦%bMÍ€\0\ç4\ÒÁI<\â³n¥•˜\"ucŒ7¥y¯\ÞgÐ¯v%y ›P&HÙ‚ƒ€ÀzÖ¥³\ÍoòH\Ù^Æ»M9!Ó‚d/\Ê:Šb\Ø\Ç<{dŸN\ßJ‰¡Óš‘NŽ85pZH0\Ëx¬×Š\ãOo™K\Æ[‚qZvúõ˜\0\ï‘ß­doBöò\ìÀ€s\ÅT6…-Žkmõ\Ë\">YPú\×-¨kpcÅ˜(`3N$\ÎZmm%\Ô.’û¹ù\Ï¥w\Ò\èñAjG\Ý\Ëip›oµ\Å\ÉÁgwW{§jj–\È\Èr}+ªV<ÚµdŸ‘À\êzl“)^þµ\Ï\Ü\é\"\Ú-\é\Ô\æ½^}1ˆf\Ük™–\ÝK„<‚8È©”liN¢g›\ÏB»Â·\å\Å:\Þ\Ö\ïÏ·¹¨s\éš\îf·‰¢)·\"©¤! \Ù\ØPk+4z>“r^\Ù7°\Î\Ñõ­°À÷\ëÖ¼;M\Ôg±Ô’!pÁ‚™\ëô¯b¶›ÌŒdõº \î6¤9Y;õ\"²uUÍ£¾>\à\Í\\ºº†\Ö\'–iFI5Á\ê8·\Ë\Ãml\Ò\Æó\ÜzU)E-YT©\ÎRM+–\"ž9‘ÃŒ^y¨\ÚCiz\Ï\Z¡K\Ýj;‡Ø£l™!\Î3V\æ’ò\â3Ãµó\É¸e-OUCC¤Ò™^%þU\ØC\Ú8\çúTÌ»w1]\å¤\à 9\ÍC\ZE©ñdúV\éec\Ç?N•¹s‡ˆŽ§Ú³•*1\Åiû\Þ)€=8­ŠÀ~‡\ëY’\ïòr\ÝEjB\ÊT\çm6+·‰ò\0\Æ:ýk¼ÒŸT½X¶\àpKv\ã¥wz›„‰¹ýzÅ‚x­\ãi$b€òOÒ®&S-y	§Z’X.“þ\íy\åÖ¹qi~’™Y”’=©¾\"ñX”ýž\"v\çŠç´°ºÄžT\Ò\ì\\¯\Ê9\Ï9®\ÊP–ç›ˆ«N)¦{á»…$\ÉÁ\Ç~•ª»±×Ÿz\Ê\Ò\íb´‚5C•QÁ­¬&\rz	\è|\ì£y6¶J7®Mf\ë\È\Ö\ÏC\ßzic·F‘ºçŸ­q÷\Z¤\Û\äYòð@#§4\\¨\Æ\Ìò\ÛË–²¿ó0IVl \çut\r\â«	-¶}\Ø\0\ät«R\Ù\éw„\î*¯Ÿ^~j«q\áüƒ4‚\Ã?Ö¹\êB-]ž\Z“‹Ð‚\Ñ\Òg¯>\Õ\Ýi¬vŒô+\Îx\ë\\=°„\"7oN\äWae N½Nyutg¹GTw\Ð8x\×ù\Ø\ÜV]”\ß.søzT÷Ž\Í\År³±#Wù\0g5—tÙ›\Æ·\r¼\ç\ÓNö\×s\æ6\Í;…†‹8.c‚±\ï\Æk:\ê\ÅP°\Âô\Ín\Û#$c\0qT¯¯+H¶eQ+3’{s,\áI\Î	\ÖÁ\0Š\ÕTpp\0\ã‚kŒ\Èd$m?A]H>\ÊD\çoLóŠï¦¼Ò‘\Æ\ëš\\W08#\æ\ëšóû\r,›¡\ç©æ½ˆ]Y\Ë\ÖU ƒÓ“\\¢Z\"]0Q\Ï=*œ\ÚCŠR-<&6\ç¿n†§ûÇ½ü Í»¦;V\å¼Lñ€¹¨\îQ·†=ýˆ®yM°¦¬-…\è†B—0bxc[\âU‘AXö\íq:\æx‚7¦kV8ö/°l\é„GKlp02+ðC\Î\ïp+Fv23)\àX7šs‡Y\'Ë“\Ø\à\Õ@SÐ¡;\Æ\Ñ0\Éb ú\Zó\í_¶\ãÕ‰\ÅwwV1\ÆÀ£\ï `c®=3\Ü\×©Z\È\Óm\Ú\ãù5ß‡\Üòq¯\Ý:¯\n\Å\Z ß´\ç<\×\"½8¨\'$òkŒðí—ƒ¨\È\'Ò»1Ê‚A€\ê\Ãc\å*»Í’0\Éu\Í?¼óëŠsŽ´=\Ç\áI“m\Ý}Oz¯0!\0\ÜmPqŠ›oŠõ5U\ÝöŒgòõ¬¤u\Óf\âò ‘\Ôw«vøt\Ý\Æ~•‡·B3\Ój#€µ\Ë#Õ¤ôG­f‰U•\×\à×¥øZ¡\ÍyåŠ¤‘9$wlW«\é+¶\ÙEv§©MYM±G\Zò/Š	¼\ÛF	n­Šöd\Û¯øŠûõX“=\"¥ö8\ë|2<¦(\È^ø«azS\ä‹kŽN3K\Ûñ­\àyÑ‘lµ=8>´\â¤Ò¢Œô\é]F-—m\ä\ç5\Û\ØO6ñ\Ó\ÃÛ“\æ§ÖºPxuãžž™®¸-\æ:<¨\ÎM—w¬\È%\'Ü\ÅnZ\ÕH\Ö.\í\Z±¦\Ð5h\Z®µ.\êÅ›\ÄREPºa´â­·°uIü˜Ï¡¬jIF-t\"\ç4ñý\éŸSò³÷9®*\Ò\Õ\çz¿«\\5\î¥q!\É\Ü\äW[\á}\ír\r\Ü\'«\Äø\æ\Ùú:Á\á\"žÑŠ:/\nxP\á.§_´z\×E\âMI\ì,Ø­³J1\ÈZÑŸU´±‡È„\îp0{b°eš“\æC…-ÊJèºŒl¯^¥z\Ü\Ó<’\n\çZ½y\ä‹b»\ä×¥\è\Þ‡N€(®†(\à\\\n’I’5\ÆqŠ‡&\\\ÄEŠÍº8\ã®*¥ö¬‘d\ÍyÞ­\â–\r\å\'\ÌI\àYJ@‘±u},¶0F+\æþiˆ\ÝóÕ‰\n\êòî™Š\È\ë­Ó­`s³\'¦MdÙ´be\Ú\é’\Ý0wL-t\ÑGöt<®=8«QHÓ \â§;q\ë\éKšÆ¶¹v\ÃÄšÆ›Áe\ÂÜŠô-Æ¶šƒn±o.p	?+W’\ÈÀðQ1I2kjx‰\Å\îcSNkU©ô.¨\âHX‚ \â¾1ñ’2j÷@wc^\Íg¬\êö\ì§„Œ\'§\Ð×žk:þ¹©<ð\ÄÑ‡\å‰\è\rk9ûV…B{½\Ñ\å¾T„\ä/jê´ˆ¤;7Æ¹€\Ç­\ë_\Ë\r\Ê\Äò‡\'–À\é]»øn\Î(\×dVªQ\Õõ+\ÂS÷]\Â\Ê\Ýf€¸8­+Wž\ÂB’Ñ“\Ãz\nf–v\Z\èŒ	*`Ž+Íš´\ÏBœ¹ ‹°$7)Â¡ŸOLe_¬§³ž/š\Þbœô=+:\âóS„œ\0\Ç574¸\ëø\áµ,[Ÿzó\íkS\Ô$ã°\å\ÆI*:\nÞ¼{ÛŒ™\ÙUaK¢KW$’*1ž™®œ4Tæ¯©\çcjIA\Ù\Øùöð\\I;™‰>¼ô­{eÈ‡]£z\Z\ï¼K¥\ÙK­lC\Ù-þ\çŸm(­RUx\é^»§c\çaWœ\ç\î\ç¤©œ–<sš\ÅIš\è¯4»™!i\È\ÂgX+¥\ÈT9¬\Ñ\×OT==\ëSO°–öU¶\ç’M[Ò¼7«_Hm\Î¯½ÿ\0Âº$šB {xËœ|\ÜV*r£º…Q«\èŽWÃ¿nnJ4ˆcN\åº×¸ižÒ¬\àX\Õ3\êMh\ÛHgn	©n\Ñ	^=\ëŽU÷g§\n0¦´EK­N…7Aõ5•,šsq¹	q\ÓÒ±õ\ëfi/®©<ŒœR\éú¿‡¤%`…†\Üd\ãŽj,Uõ\"»´ŠP\ÛG­yî­ ,’dd‚{\nöY#†Xó\Zð}+\æ\Ý7ŽôB\é\èL’{x7Ã†\Î?31\Æk\è[˜mqž+\ÌôW\ÙU\àc‘\ë^½¦)q™+\ØÁ#\Ì\Ç4¢’4vqF\ãÀ\ç\"œÆ˜\ìzô®xŒRN{\Õi)l\ÍS”\ä\Z.K9\r~o\"<\'ñ\æ»?\Ú/\î\'#\r$§A_]x¥wYM\ÏñMô\Î\×\ÒD\\ñ+sJn\Ð9T[®Pº¶.:š\ço ?L‘\Û\Ó5ô$\ä¯oz\Âó…\ìûœ|¼\â¸ecÔ§tŽ~DbO\ËÇ¥9!\r\Æ2k¨M Mò	\éZ?\Ø.7¨#Ò²qgBš8_²²òÀUYt\íŠô\áö\ÎLŠ\05N\çF1`	7‡³q5SL\á\Z&V\çŠiD\â?úõ\ÔÉ¦|\"\äcµe^\äaŽ•›-;•m\àU\è$\îI\Íe¡t>ù\æ¯FÁ¹\ì{R¹¢G¢ø\\yš•´½\Ã\nú–\Ìh}‡jùg\Âr?\ÚbÚ§!€\éÚ¾ª°É‚?÷Fis\ãh–\Ø(Ýž1VÑ³\Í0¨?‡\"šŸ/z›:lymô¯1¸¶S¨\\7R\Í^¤\ë¸c\Æjv±Ap\\\àn\ï\\õ•\Ïg+¬©\Ôkù•†\è\Ñblã¢š\ê\Ïj\Â\ÒLL”ƒ\Û\"·	\Z!¤Lñ\Õ9\ë2³s\ÍFûjG5ZFÀ4›8J\Ó75“u4¤aF85¢ÿ\00¬ù`yj\ÎN\à‘\åZã±ºi$p\ïŽqMµ˜c­i\êö\é<÷{söÀ\ÂBq^mMn{x}:˜n\nŽµ1™XsƒXA³Ltrx”j\Æ\Ç|Y®þFy\ä\Õ}èµ‹2_¨c½HÈ\Ã\ä>)³}\îP¯\'5\ÇkwF\áãµ™\'‘T{d\ÖË¹\0w=1\ëUÿ\0\á¼MR\Æý\Èa¼÷}\ëH\Ä\Í\Í\Z]ž‹\â=aT²\ç\ÔÖ¶¾†ió(•üÁ©<L‚=gN”t?\\ñ$^n£¥\ë\æñª±\ÕN\Úy¢õ\Òyúð~\ÐZ’\Z§\à’_ûBL}\é*Ý™ób\Ön\Ïe(¹ôQQøq¦^\ÈxÌŸ\ÈU(\êjß¸þH©\à\Åóµ½Iö÷Õª]<ov\Üp\Ò\çð©¼›§¿g;¿­/†T\É\â»÷\ï™j\Ò\Ørjõ| ‹\æñòŒr¨9ú-S\×-®5Í§\Å!2¦s\È\È\\ô«öÿ\0?œóò‚?ñÊ³·cÿ\0uTªµþðR\å·uJ\æö›º·†nô»°\æ\ÙLN\æ­^4E\Ì63µœ¾N©i/\î‡÷\Î\ì2kÖµ\rJ\ãLñµºÂ»–\æ$IA\é\ÏCøW5\ã­+a.\í\äPn	i#\î¬?Š®\Æ\nJ\Í7nusš¶o\Ïz¶\Ñc|)D\Èø¯R\Òó°W™\Åw/\ÚVY	bNz.™*º\Zª\Ç\Ð\ï\ì\ä\ÚT÷©%ÀT8\ë\\\í¬˜U\Í^ó7qÞ\ÉfL­4P\â\ÊYÄ¬\Þd ŒGõµO¨Kdb•b\\\ã£¹ª	ö\Ç\0\ç9 6A¥\Ä!ƒ\Ê\ÎB·<ý)oUj8\çX¸\îzóY\Z­\æðxš\Ò*\æsvG•x\Û\Ä\ÃGi#·\î\çFH@þ\Ãx\ì)%¬k¸óž¹,y&ºÑ¦^kº•æª¤.R2\ÝB§@*Í…\ÜR\'šN\×\Ýðü(QK\Þ\\\î\×>9j²o•òô+…\Ü9\àŽ½ª\ÂyKÓŸzˆÀ\ã$œH\è\ÄpNk\ï)\Ê;£\ä\å\\.cûDx_”œ\à\Ö\Ç\Ã{Ó¡kž]\É\Ù\Ë™û\'*Md*°“’GA]¾…§\0­$¨þ„ŠùŽ\'£„ŽUj|oÝ·g\Ððô±\ÅFøV²ò=ƒ\Ä¼\Úxßµ–)Rz\æ®\è²+B„Œk\Ï^kÈ¡1¦%ŒŒaù+ô®\ÛGb!ˆ‘\Æ\ÜW\åò?EŽ\çqù}«™×žVx\á‰K–=»Þ·£‘U2Md\\Î†R\Þ\Ø?JÍ›\"¤Zsµ¹\'Ó¥S\ÒD‘\ÞK©\\¦\èÏ­k¡O$þ÷\n\ÝFy¨\â‰÷S…ú\ZÌ£CEb\ê6cŒŠ×šUÛ‘Š\åo¦\Î\ã\Í@4pš\Ü\Ã\Î\Øµt\Ö}š\Î(6‘¿5yŠµ\ã¤O\ë\0‹œFx¹\Ïx§Z‰\â‰\Æ\ÞL\ç\æ\Ú}ó]x|lKŠ‚\Üó1XúH\É\Í\í\Ð\Ññ.ªu­y¶¶û[\é9S÷Èª¡\ïV õ\Ç\Û+1i¼M Q\Î\Õ\'\êi\Ë\íA“\Ó\é_ a!G-Á%)(¨«ÉŸ™b\å‰Í±\îQƒ”¦\í»°A“º .•\Î:šÜ¶³‰q¸nj×Ž\ÌÈ˜T\ã½x¸Ž$÷Ú¥Mr÷‘ô8^÷¯Uóv‰Â´©#\äž{T¤®¥&\à\ä\èq]¡¥\ì\ÜÁJ\ã‘õ¬x^Wµ.†!³j\Û˜\Ç0„\ã(%$®cŠ\Ê\å•\Î„Û‹i\\ô¯Þ™\íB0\Ã\Ä²\×j0\äö¯-ðÅµ\Åñ–KT\"\êCyLp&ñ\èk·\Óõ\ï ¤ŽÌ§ªž\à\×\ÅbiòÔ‘ú\Z§58z’9¤ö¿³Q=¤Áó¿ŠÙ†5v\Ï\ëWÍ \ÚOlq\\OCº28\æŠQ‚½^\ÜV03\Æj\Í\äA¬\â\Üb¦\×™\Ñ\Ê×–k:=þ¹qp\Ë3­¼XP€	s\ë^“tùB3‚\ÜVÞƒ§‹¨v´k\åF\Üdu5\ÓB\êJ\Ç)Fp|\ÏC…ðƒÄ‹\ÝÛ‘ý\Å=\Ü×»XÙ¬Š\0U\0À§\Ú\Úð¸:V\Ìqt¯qÔœâ”ž\Ç\ÍF„!6\â·sSªÒ„—5›f\é\r8®sÄš<z¾—q\æBP\ã8aÒºL\Õ„.§\rŠ‰lmMò\É3\å\í3Áº¾®!˜¢·˜\â\åú©\îª;\Ô÷¾¿\Ó/d7\rÐ\Ó\Zú²\×k\â\ê:^¡.ŸkHª¿\ëO$\ç\ÐWš›Û¿µ5Ñ•Œ\Ä\ä¿zó\êM\ì}6	:‰M¤••Ž\Þ\Î\Ø\Íj²F9­mi·{—\'Z³a5½\å´¨0Ã®>ëŽ¢£¿±ób\á»û\×¤k(´ÍÂ¹AX+=\ÈP	\ÇqAºr<·\äTk\\H‰ v®fIä˜¼\æ¯Gowv\ã?*U\Ù-V$ÚƒƒÖ™Ã²EYI\rõ¨*\Ü+*\\\Ø|¦%C{Ž\Õb\é7)À\æŸQdk²\äÛ‘þ½„kž~f\à\Zú;L²[{aÏ•¯\ä1_:j°H˜\Î\ÇVÜ¯Ž\ëÈ¯yð¾²5­\ÖôŸ™\Ó\ìÃƒ]˜}Nt\å\ÉÉ™þ9´’\ãÃ—Š£v\Ðú\Zù“m\Î\ë¥\Ûþ²õ\êA¯°5\í”ðž’FËŸ¨¯”\íü5¨j\Z\Ò\Ù\Û\Ç&Ž“I\ÑQG“[\Ú\ÒFt+ZŒ•ödš5ž¡ywj–¨\Zm\Ê\Ã‚òI¯ª!\È^kšð¿…t\ï\rYù\êY\Ï/+œ»Ÿz\ê1·š\Ö±ÇŠ\Äû~U\Ò#Ž0;\Ô8‰g\"œ’y•\â;5-.\ê\Ù”¼-´©Á\ÏZl\æŽ\ç$|Ie«k3Cj\âO%@f+ Sšð·\ÖeGW\ÈAÏ¨5\îö\Òd\näª­#Ò¡>h/\";\ÄÜ¤{\Zñ5K½?Ä· C!\Ûq!N\Õ\Ïz÷	Ô@ª—‘ZiºTòNFÇŒ\ï&°Qj\çK¨´\×S‚Q \ÚzP›EŠ\àº\'\äU\r:\ãw\çi9V®¦Y9\ã`VRVgT\Ñ\0Š\ÒB[]\ÇP\íª’\".\ëut#û\Çp>•¸\ÚsžTðy¨^\ÄEËœ\ÔÜ³\ß\í¥CNg°äŠ’Yrx©\î§Uô®j\æ\âi[\ìð|\Ò\Èp€ú\ÕB\ÌÂ¬ù\"sþ!\Ô`‰¢·gÁ•Â¹\ÇE=Mk\Ëð£N¼´[½/RfÞ›\Õ\\†F?Q^s}c©Z\ê2\rN\'Ž~»ß¸\ìEoh>$\Ô<;.ûs¾\"G™}\Ö÷†¾††S¤šg\Ëbq­U\Ý[]Ÿ\Ã^&\×|\'zºN¥o#\Â8E9Ü§\Ø÷ZõQ\â\Û\ä\"Ch9PpÀW™=ýß‹®¢¿\ÂÁ\\Eù¾Zº%•¢Œ\ÎqÉ¯?ZÓ²\ÒÛž†\n¥\É^\çw\'Œtai&d$r…NEyg‰¼{x\æ\ÓIÜ±´€‚\Ç<pjô\ÑAr	cƒUcŽ ¡$„<]s\ßñ©¥Š\åwj\å\ÔÀE\ì\Ú)\é~óG\Û5«¢±\í%\Ów8>¬jÆ£\â­G¶6Z,(1\Æ\à¿-i\Ü\ÚÃ®Ú­–ùB&Irzm¯(¾‚+ù!€oŽ<œž¤W£J«N„öS¿Bh\îMþ¯j“\r\Í$\Ã~yâ½§Q\Õ4\ë]1­F$2\0ª£œWxN\Õ\ï¼M¶A\\ûò+¾Ô´£ou·© û\Z\â\Ä?x\í¢®7Nž{Fñ:v®²\rN	@(À\ÖV›	´ý*\ëi3ƒ\ê+Ï–\ç¡@\ß\ÇÝºVuÖ«^´õÒ¢#<ÔƒL…Nvæ ³œ•\î.Ž¤T\Ú$1`®I8®\ÈZªtk9\íšk¥Lqœµ4\îL´GŽ\ßo\Ó\îÄ‘«!óŒc<ô\Í{·†õM?V±ŽX\È\Ü0xÊšò/Û\í	yó\Årúe\íö•}\ç\ÚLc|ò§\î¶;\Zìƒ²G-j*¢>§¸ºŽ\Þ\'b;W™\\Bngyñw­¹u…½°€\ì\Ú\Ì\éš\ÏIC\0)N§1•\Z\Ï}\Êa\Æ1\Îk“\Õ\\ZÝ®á“\ëÞ»\æn3\\‰&S€\Æ¡VC\ÐÒ¦¯$Uv\ãNGo¤\Ý\\][D\É÷v\á³\Åh¦ˆ;q\í\\…e–ò;c\êx\ÇZô),F®>e\"®¬L=UR³ q†²g\Óm²O”™\Ç<V“¾Ÿj©#\ïSõ<\×Vg©\\ä®¬-÷G\Ð\ÖkB•QBö\âº{•U]\Äý1X\Ð\ÂZWÀ ’\Ð\êü9u„û4§?\Üc\ß«j\Ò\Þ}7Ssg—‡ø[Ú¸ôF·h\Ü•`k½3U\ç`€}kª“\æùn\"<ŽýÎ©Hd®Fö\r²\äñµ«£´›\ÍA¹pi\ÒXG;n9÷­g˜SŸ)\Ã\Ü|ŒEV’pø\ÍuWšhB~R\ÊFG*Å¾“º5\')\Ç V\\Œ\éö\Ê\Ç+k\á\ËIgŠ\á¡H\Î\à{g\æº\é.…¤,Jôµ¢´¨\0`\ÕF\È\Í\"õ\Åh´G3|óG’\ê“\Þ\êÒ“,Œ\"….=\ê¬bŒ&\Ï\á\ïW¤ˆ¡(sy¦(8\ÆI\É9;žµ(¥ƒ¯ \ç­5^6Á–^úõQw€\ëŽA\â³6²,\Ú–º{I\0=Ey\ì\ÒKo0;p¯\Ç5\ÒX\\\ï\ï\ìO½k]Æ€\ï`0j¸¾·$yª\Í\ZÊœŒŸZ¢¶\ê˜:gñ\Í4“\ÞCPh \á>„VU\Ä;\ÏÉ‘ƒ\Èú\Ô+…3ƒžõBcõ;­Ñ’IùrMy\Ý\Ý\Å\äå¢’wš\ì¦?j\È\'\ë\ïU\å\Òm\Ý~l\ÕE¨˜M6y}\æž\ß}0\0#½?A‚ùo\Ñ\Ò)HS\Ë\ÅzLš\\\Ûüq]O‡­­‰SiQJ\ë§_¡\å\âp­¦\Í;v†2\ÊAÀ­\Èl\àZÙ‚\Ú$\0m«Oir\0®¥Vç˜¨Xó/<\æH¡_–.»‰\ëQEs\nÂ…†\íÜ‘Š\é<Oj\éi¹c¯ ×—Y\Þ\É,­n\ä‡¥k)#9BÇ©Aa£jp\Æ\Ík?‘ðªZž“iic!O=ûU´ýZ(þ\Ñm.	RY\ãš\à5J{\ß.Y\ß\n0A\ë\Z\ÏC§\rµ¨\àUd|g\ïÖ¶mXg?5gý8(\08§\Û\àt\Î\á\Æ\Ò1^]M\Ù\ïÒ·*:\Ë{‚¤gžx«\Ír[=ø¬8þnÿ\0L\Ó%Û\ì\ÏJ\çh\ê‹7ü\ì/8\Æ*´÷0§oÖ±Í½\ì|\ä¿pEQ–k”|8\Ï\ÔF\Ù\Ó¨\Ä\\tƒ©^\á\æ£\Ö{\\º\Ï^Õ’–÷w\Í ·¶ƒ¸Š\è§M\Ü\á\Ä×´Yn\Âö\æ{À#ÀBpx\ç\é]N±nÿ\0d\Ê\ç\ÈþU\ÏxoN.?})\r\Îx¯E»µ\ÚqÀ W¥{§\ÎUª\ÝDy®‘r<LFA\È*\ã…2\ç9\î\n\æu8\r½Ã•\Ý\É\0\â¦\Óe>i\ËH²œ4¹\ÕF¯½\Ê\ÏJ\Ò\Ç\Ý²?\Z\êœp+˜\ÓZ\ë\åFz×ŸSsÝ¢¯1ì‚®x\ãš\Ëgl°×­m_J\ËÑ\î9¬……\È/Û¿\ãY›X£\×nN9\à\Z†}*\Þi<ÅTõh£,\ã9Àaù\ÖðÀ\\m\Ï_Æ­\Í&Ž\"\ëOû:\êx5Ê›:\ë?6¥z&®p„cøpS\\D,Z\í±óaø\ÇA\ë]\ØWvxÙ»©³¶ò\ÑG\Ý\à}\Þ+IAU\ç9¨\â -Á\"¥\É\çŽ\Ã¯]3\ä\Ú\ÔB2\á¿!M-ŽÀƒ\Û5\"c5	1=»\Ð4äƒŸlõ¨]\\`‚H\ã\"¥ cw¦0*.p\ÇŒ~5”ŽŠf±\Çaú\ÔñNbL•9\ç$sQYyonBŒž‡ð«P`7\î+šg©Gd{£\Ã;\0\"\Æp>\Õ\éZRk\ëòŠó«[‰%•Ñ¡e\0\á_±¯CÒ·#\Ý\ÜVðz5‡c\0\Ê¦+\Ã|n\æMvnr\Õ…{´\\G\Ç\à M¬^7_\Þ[\\à­¬NFè²º\áN3HŽH\äÖ…\äL‚3œô«°\ì(¼p\n\ï¡dxµ\ÚR1pE\äVñŽ#\Ôgðª­i\'i#‘\ÅvÆ‘\Å*ˆ\ÍV*Û‡Q]„\í\êHù€\í\\\è´U!‹\Èâº‹*Þ¶Q°FW\ZŠRA\í]f‚¹#µa˜};V•‘\äž{T\Ìé†‡A\Ôq@\ä˜¤R1A\Åa#¦#eo—úWœø\Æü\Ú\é“‡>µ\Þ\\\ÊH¯ñl\ß\Úr‹x¤Ê©\çÃŒšŒ-}\ÏS-\ë©=‘\åC5\Ä\ÙU\'ŒšõM.;¤µ§\î\Ôý\â:š­¦iÀ‹]d ÀÀ\åÅŸI‰\Ä{T—DGmbŠI\Ç$c=\ëD‰E)!zVe\ÍÒ #vqZny\Ïr[‹±\Zž\\n¯®%¼L\Äðó\ëZ+½Nc¸\Ï\\ú\n\ê\ì|a´5\ì+p\ç³ri\Z2ž\ÆS¯nÏž.µ\ÝNb±+ªsó‘Wôý%#m\Î7·ry¯§†‰`\ìKh”\ÛEV‡\ÂZX7\ÈVjo7\Õ|FxÅ­8\çw`l&“r\à\Îy\àb½²\ÛI´@XPcÚ¯}’ \n>µKú\Èdº@ð4û»2°”˜\Î+\Ö<C¤‰¬ø¯Jó¸-œž«\\µ\è:R±Ù…ÄªÑ¾Ì¯\r‘q’0*è±ˆ¡\ÊóVW\å\äRJ\×:;.>ª6Ú™G…r¯ÛµF\ìÑ¶\àp\rS\ÔwˆKFH8âº¨\Ê\ÒG=ux36-m/.d\'ø½ic\×c¸¸XN:W \âY\\IŸS\ëRC¨\Û\é—(p»”‚G ¯J­X{3\È\ÃakN­\ÒoSÑšÑ’rÕ§ãšŠ\Úþ\×R·Ia`~Q¸È«J€ð+Ä©«g\ÐB<ª\Ä2E\Ç—4º\Ö\ÓF\ÄûU	\Ðô÷¬K9[ø©\0d\×+ÿ\0õ\íË´€d!8µ\ê\Öúz\Ï dÖº­•¦ Y\í+\ÔÀBò<|\ÎV…µ>i\Õ ¹´£\Æ\È\Ù\ìx®yS/\Ê»g‘^\å\â6;©÷\"«\à\ç#½v:…¬®ô¸šX#b;2×·(+9O›S\Ä.tG¿\Óc[{r\n\Ç\É<p+B\ÑRK¯œ)òW\Ó\Zžƒ,–’@«°\0B+Ì´\ïj:Mó´›^2\Ä\îSÚ¸ñJ\Ðm–Z\ÉKk•—E½v$ *qZZ.‡ª[JZ\êpc\í\ç“]Ý­šÀýjÑ²D\É\'5\ãJLúxÒŽ\è¥n\ÞLŠ¹?CZ71ù€(\î+9c-/\Ë[Ev•\'8\Åf\Ílq·Z†Šx\Ã#pr*\î“\á\í6\Ê!¼GŒ75\ÛGör£ \ïVD€B€(%\ÅµÅ¸¶S\År7\îúb»½AWŽœ×œ\êÅ”9^¸8®Š1»±\É^\\ˆ\é¼3qö\Ù\ÒÐ•S—j÷+RDH	\àWÌ¾\Ö\ï4{\Ñ\èd<\×Ðšv«my\n´g8×³‡‡³M.&§´³7‹z\Õy&QN;\Óvå³ŽEt\Ü\à+3³\ÔD•mò8#Œ\ÕiF­\r“cñ\"µ“œü†¾ ñIo©\ÜÁ\r\Ï\ç½}ß©Â«Œƒ\ë\ï_7x\ç\ÂQ\Þ,ò\Ä>|\çŠ\æ¯UF6e\ÐÃ¹\Ô\æ]™ešW$üÔ¶—m£\'<V\ÇöK½Ç“±Á\Î\ruv¾‚X·o%»v\Åq:Ñ‹Õžœ(Jj\É\âj£a\rÕŸý¯tXfC\Ð\n\ìnü–\Ø\Û$’\Û\Öe‡„f¿¼kd\Êp\Ù\Ï\ÔTºñj÷-a¤¤£\Ê\îb>¯rù\Üù\"–-NUC¸“^¥\Â\Ûl5\Ë\ä¡\Æk~‡š%¤c\å27«W<±p\î\Ù\×¾«\è‘\â‹y<\È\ÎFVl–\Í(2d¹\'…ó^Õ­x&	,\ÌVq\áó•ªž“\à\Ù,Ô¼ñ*¹=¡\âa\Ë{•\rE;[\æy4\ZLòaš\Å/\Ù6\Ü\Ù6‘^ù.Q ÝŽµ\Ç\Ëa\Ú\ãf@FzV?Y¿C§\ê|½M\ï\é0Á‘——\äf½\Ú\ÙF€tÀ¯/°\ÍŽ	JõHFG ­)É´ÙŽ)(\Ù\"sL\âœ\ä\æ¡;º\æ´9\\\â²5:\ÚülI€‘Z\nX\n:Š–k	\Ê\r4\ì\Ìû{H-\"\ÃD¥JÅˆÁ\íS¶@Ç½K-\É\ËV\îVrqÉª’?<¸\ÅUf\â²lD|š†õgžjr1U¥,W‘\ÅC…s›\ÙË¯\ÊAõ®btu7û\Äq^¢S©¯7¸V‹S¸R\"¸ªÇ”ôð³s\Ñô)#¼LUút´R$Fj9bW°\ÍU\Í\ÌS\ìy\éÄ½$\n«\Ù\ÅgK*\Ä1ßµý·\îù«øjÍ½¨ˆnc½ñ\Ô\Ð~k%Î­	u$(\Î;\nôó\nc‘È¬\Øe¤¹o÷TWd\È6œ\nô(S¼om\Ï\'[–¥“\Øó\Ïi—wóY\Ëec|l\Óõ´?ižV\ÚOû\Í\ÅzE½º\Ç\0š‚\ëK¶¸£’ \Ê\ÜW,+j\èÚŽe\ËÊ¤´Gž\Ø\'—\àù¦=]%bjo\0¾»#»9?‚\×Wy¡«hóX\Ú\áB5—§iw\ZG‡.\"Ÿö\Ê\Ç#‘P\éJ=:<]*k™^U—‘™\à\Ô[Þ¿S\æ\åLðXóu\íI³œŽ\êµ\à+§^6??J‡À*§©ryýZ¦\ß\×9¼ú\"M1Dž?¼ô]ÿ\0\È\n—üFtQú%3AÄ¾7¿yy£ÏŽ/ˆ2\È\ç	\Z\Þ\ØLÐ¶_\â	J\Òkþœø\Î\ç\ì^+¶œ.\ãHBŽø®^i\îõk\é.nt’žOe€ö«\Z­óxƒYšð&\ØÀò¢\ì©\ëøÖµ•’D¹#\ëV•ÝŽY\Õå‚¾\ê%h#Œ»«f\Ù\å°»£nW§\Ð\æ––@\èJ\åUkSL¶ól<‰“•H5\Ó:„SksÌ†2Y¸Å¦\Ñ~\Â\èMßµY¼µ7Ä’)ö=k™xgÑ®\Ïn\Ç¿»õ®\Î\Âh\î\0!£½sZ\Ì\ìOC%t\éQ2³¸=²j¥\Ê\ê`¬ûý\Ív\ç\ÖE\ì1\Äxãš¤S‘—Ò˜ƒJF}«›\×\î™\íZ\Úd˜Ï #“M\Ôõ‘\çý†Õ•\îU\Ï\n=Mtvz¶\è]Ì²Ió<§©õÚº¨Ò“œtÝžv#	Y\ìyªI>§\Åpaˆ\âP>ñcÖ·<!\á\ÝcÅ··p\Í\å$ÿ\0,\×!Œÿ\0/õ®©!±mJI²¥«É’¹PH\Å{, ƒ\Ãö\ïV3H\\n,k\éh\Òt ŸS\å*\â}µF–\Èóë¯ƒ^1=\Óùi\\N»ð®\Öž{I\äeNªzŒW\ÔóBXlVw\Øc .\Ñ\ÓÓ­vC‰¥ðÕ’ùœÒ¡J[Á]øZò\ÒX¦x¦û;#ƒ]U­²GDZúÆ–q\Å\áÛ•dR\Ð:ö¯Ž\Ù+\Æ\Î1ØŒL¡\Z²\æQZC“a\éR„\åÙ¹Y•¡ß°ô\æ·4§Ø†6\ëÁ¨U}…V¼–K]·3·†\Õó\ïS\è\"v›·\Ä0k\îiÃ•Ž?\Ç5&ŸÂÁ=+pA\Ä‚}j\r¢\Îd\É}Œùc4\ëk\Ù<\Ó‘Ÿ¨®¡´\Ø9¬Û›U÷\íPÑ§1^IN\Â®~ýÀ«FgÀonµ\Êj7L\ê\â2pZžQ7s\Ë5VmGR¸)\Þ$Š\Ö\'\êNÀf½óJðaqI\n\ÌQ<’–=\Íx®—^Ü³õW\\\ã\ÔFÜšú\ÎH\Û1\Ów\æ3^\î\nn|·Z;™á”š\æIÝž-­_\\‹©t\Í(­cHó,Á@E\Æi>ŽX\îW,dv\Ï\Ô¦»yaò\Ý.\Æ\âQ¿:‚$6ò4=Ž\åú\Zò±8ªÕ›\ç“jú#\ÖÁ\àpøx®H$\í«1m4[\ÜÌ™$ñ\íR=„q“\åŒVš³:ö\Ï²:	‰nT“\\z\ÖI\Z•’°\ço&¼\Æ\ÛLšI`9gòÕ±‘¸ö\â½v\ête9\Æ1]t«C¡,¦0D·RÈ¹ú\ã\"½,¾´¨Uº\ìxù®\Z8Š<­\ÛS\Äty%\Ñ<Gù÷\ÄÌ»z+ù®¹-á¹º¹’Ù¼²Ò³)>nØ®s\Än±êš«F6›{ƒ·\éV|1-\Å\æ©ƒ%\Ì-&ÁüŸÞ¬q)Í¹\Øu\Zt ¯\Ñd’Zü·(T\ç\Ç*jù\Õ\ís8â•‘ÑŒr©R:‚*/²\Û0\æ5ü«Ê–Œîƒº3./âœŸ/\ç9\ì*¨G<ŸÀV›¤(\ß\"…\è*¼Ìª¤š”SW-\èºR\êR]‡PT Q\ì\ÕcB\Ô\à‡Z“@h&Q!’GÀòñ]w‡\ì\Ö\Ö\Â& n“\ç«U\ëm\"\Ê=R}E\"<È¨\í\ê«Ò½J4¬¢úž\"³”\å†”q>)E+¬\â°\ÒM0)\ç½DOjˆ\ÙûVe\íÁ†3±\ZG<*\Ô\ÕÓ½™‡aSF£Ò³f‘>}ñÆ†\ÖOô²3\Ív\í\æËŽÂ¸•ôO4‡Ô´G’5Ì–\Í\æ(õ\ëç§ð5\çV\\²g\Ú\å5U\\\"\Ö\î-¦u>\Õ\r­\ËZ\ÈG“pF9\é\'c^\ÃÒ¼ #Žk\Û<=zº¾”’\ä¡\ÂN;\ç³~5\ËR=M1t¬ù\×]\Ë\"=§Ž)\æ \Ãš¸bÀ¦\ì \ÖI…P\"ô\ÅW—&­7~iV\ÖYðI÷«I³)´Ic\ZhLA\Ë+÷\Ís\Ù\Ü¯A¾´òt™”²À0+\Ëln\ÖhóœŒÖ³…¬aFnj^¤wñü¹\ÇÒµ>]4jza\'\n\â\á\Ð?«HU\Ç4\ï\Åö»\'m¾	õÁ\ÍiE\ÚH\ËÓ—¡\í ð*¹‚\ÜB(\Ý\ÉÀ\ÆMJŽ’.3\Í&NkÑ±\á¹Œú\nŽC€3\Ü\ÓežUŽY\æ$ûS$¶óEVª\ïu¡\n\r>U•\Î•N\ÖÀ/“)ø2Pj\Æ2œ/|\×IýŸmguj´²ª\àEø\Õ\'3HH ñPâ™¬g%±ž\ê¬À(\ïTüGd—ž½…G\Í\ånwš5]F=8¦¹\Ê\È\á¾µ¸\Û%„”!’TüaYIF\Í0S÷dÓµ\Ï\ZÓ­âº²P\ØÁªF¹¹\Ó_d\Ñ<‘q¶D#\ê+F³O2 5¢S\"¸%¹\ì\Ãc*/Yp<õ\ìsU®õû\'\ÈYw±\è9­),-[ƒg\êµL\éö\Êÿ\0$J¾¸˜\Ù\ÏJ÷We˜‰š±\á\ØO@\Ú7 ã©­[ƒ\Z#(ô®]n&³\Ô\"¼‡ýdd÷\êc[R•š9+Å¸´z§‰<9i­\é¨<\Ä\Ên\êÀW\ÌwP¦h\á’B¤ûƒ_N\è:ú\ë\È\àBñ¼g ûŠò¯øjþ\És³\Ëk+†£;w{W³\n\î0vÙž°¼\í-Ñ¥£\Û\ÅieC\Õ9¢ó\ÆÀ†\èjœ#E\Ðq\íRn!WvEy»m³Ý§e–\ÈsAa“ƒ\í\Å>2\èñ¹{š!‹vJ±ô©s°„”px\ÏcR[\"v»Š\Þtµ#\ç^A\ä7+yló4\ë–v\ÇÒ½¢=\È\ÙN}«\ÅV\Ze\í¬S¡hn#n˜\ë]TjrnsU¥Ï±\Æø:\à\Ù\ëv<M#§\âFE{Þ»e\æ\Û\Ç8\ÆkÁ4K[Z° ³¹$út\Í}?öQ=¯–s\ÐVµ\ZžÝŽT¥JJý\Ï=³]‡ð­§µ#\Ø=¤¿0\Ê\çƒS¨\0\×V=´\Ò\\b€1N\"—¦j\n |R\éö\ÅÝ¥\ÇN•Ç\íPMtðˆ!Á\ÏJ\ÒÆ£>yñXO\íK•Rwo9\ËÁžH\Ôry&»Ÿ\ZX…½š\â7WV=T\ã \èww6‹|T*OQž\rt\íH\è•Î‚\ÊiH¯Ž\0\Ç­\0‘\ÛúV|6\Ò9^¼}+vgAŒb±{‰\êF\ã\å¬Ø¬¬nõ$ûL{ÁB¢µ¤Lv&©\ìÃ«¨û®:UEÙ˜T\ÓDú}œ\ZN¢\Ð\Û\ÅÀ9\\Œq\í^ƒ)R°$\n¥\Í\ÈÝ‘\Ãwžÿ\0\Ú6±;<yHó´ŽN+©Jñ<·A5HB \àŽÂ°\ãEs[vPjñÈ¡\ÎwaÔ™MV¸±’\Ò\\ƒ”õ®J‘OTz”[^\ë3n­D\Ë\îdù{nÓœ\à\0+p¼®@E\Ü}=\ëwJðð\'œnò=ª!&]i\Æ»2,ô)neŸ\äEÁ\éYšµ\á·\ÜÀŽG\á]þ¦@bS\É<×“xŽm\Ôg£)\Íz4i%dx˜Š\îZž•¡\ßGk\èr\ÛF\á]Td8«\Æþ\ê%¡0ž§jö\'\0ÆªJÍ£Ë™&‹{0j@\Z@©0½:ZÉ£QxÏ¾:\Ò4{…8Ò”r:c\ÔR\Zg›ø‚\Å\áº2\"\0¤þf¹%\Ü\äqšö{û8\î\á1¸È¯0\Ôô{\Ë6>\\eÁ<`W5Jn÷G¥‡®šQoTa.D¸\à59‘‚x¨·œ0$ûÒ³)ˆ\äñÎ²±Ø˜\ë˜#œÊ¨\Å\r\Âñ¦\0$°Ï¥hE¹`§­l[¤R>U0iX \Ó\ïP€’q\ë]rFW#o§Ö³^\Æ\'!Šóùb«Kfcl\ì¸\ìiˆÒ»’\'BŒó\Ó5\ÈjwžRþ\èƒŒÕ‹‡\ïS!lwô­ý+DIôð0»\ÙI­\"Œ\'>S•€ˆ8\ëÔš¸>t\Æ>”Mg%«ŸÀ¦F	c\Z\å‰-KBR\'(LkÒ¯\é²yiŽŽ9ú\ÕDC+  \Ô\Ö9–\î$7\0tÀ§¦E[8³\ÓmùOlUµ\ÆjUÚ U’˜®´\Ï.\È\Í\Ôm¼ûw\0g+^\"\ÚSY\êžoQžŸS_@;{×’ø¢Ymo6¬[›q#’s[Ò‘\ÍVQc</\Æ8\Ç™®SY´¶»¸¸Àu«i··—d±´i\Ônõô­f·ó‘Z%Ì¨:ž•SJHT¤\á$c\Ú[r«c¡¢\ïMm¥ÓŠ\è¬\Ú\í\ÎSl‹\Ã¥K,\0u\Íyµcf{”\'ÌŽR zÝ«U`µwu6k1÷\Ð\Ý~µH_ùù‡o½s\ÛS­§¶œ)Ul\Ía]e\\–b§$p\ÜV›\êl$>~\ê§öN©ª©h\"y\ï\éZAjEI¤Ž7P»qò\Ä\Çëž™=þµ\é\Þ	µ‘l’G@¬W?sX¶þžyó p¡Ác\ëŠõ3J‹O·H‘pq\ÅvÁXñqro[™óZC¡¶m#œŽ*ª\Ù\ÆMo^Û‡RzÀ\Ù\ä¶\ß\Ä5t\ÂG›:g”ø‹L’92#“»\ÌY\Î\"º@ÏŒ¾+\Úu©!Ž\ÂGòñž=«\ÆR\ÄjWLR2[vG8QžÔ¥³4…\îŸS\Ò4\É\Æ\Õ`ð+ªŠel\î<ƒ\Ípºr5¢ˆ°zg\ÖÓ´¦\"c>ù¯6¤}\ã\èpò÷\ÐJ±ºõ\ë\ÍPetF\ØÀw#$\Ö	\Ô/¶ºd*u\Ô]T\åH5•Ž«—Q$Œ\àúš\ÖV, ŽI\í\\‰\Ô\Ó ““’+J-D¬yûÅŽF}*’3muW\Èu®~\Å\ìbs\ç>>f\ãw\â®jbM\ã ž2=CW<Q\àžIôõ®ªRpg™‹§\íSGðIdpF;t«\ä‘^m\ÜYJ®¤\ì9\È\ÇJ\í4\ëÅ»\0úW¥J²™ó˜œ¥ª\Õ\ZlYy7|R“\éõ\ÏzAµð@\Í*\ä¦3[\Üáµ™\'$ó\éP8$ò\ßÀõ«@\0I\ïQº,™Q\×5œ X\ÓÕ™\ÞÃ¨­‰Ý‘ÐœƒYú(\Î\à@?J\ÐA±€ÛŒ+šG©Cd}&¶ûPq·$W_§B\Êk\Ï!\Öm~\Ñ\nœ€z†˜\É#ƒ\Ð`v­©­Nº¯C¢ ˆX“\ÑM|\Ýt\æK\ë†ÀÁ•ôu\ë\Ó\çl\ã·ò¯šs›‡9\äš\Øóê†¢HŠ>;Õ¸0cLŒU=Kp·\rV-·#\Ï\'\ë\à•\ì|þ5ò¶XùI¤Ú¾”¡‰ö¥\àûó^§*<·-‰ €; #\è+v[2‘\ïS½+.\Ìüø\ê­u°…’\Åg=\ÙE]16\áƒÚ¬\í108¦Mna}\Ê	r\"³GƒÁõ¬YÔ‹ð\Ý+\Í6\â\í Ffa€2MaÜ‡¶S =MqZ…\åÞ¤\ì \íˆvõ®,EeIyøj¬\íÐ“U\×fÔ¥0[\äF	\Ë\Öu­^XdÕ«{d…FÖ®ªó\é^%ZŽr»w>‚(Ó’²\0qVmžõáŽ¸¬Ë«¢€ŠˆšÉŽ¾\ÔRå¸®\\j‰s0]ügð5‹«\ê8IcŒU	óp\ê\Ð^k¾mY\çÖ¯\Ê\ìn\Ð%¶‰£Š%\êF\Zô¤DnÂ¼\ÓEY\Ìp•‰P\ät¯P…x®øB\Ñ8*O™‰\äóOñ€*Q\Í8|µv3\"úTE<c4p3\ÅRh½k\Ïõ½#\ÈvžpzŠôž™ª¶«qS\ÜV5©*‘išÑ«*3\æ_3\ÈYF¨¤\Æ8\ëWµ#V·•…¼XØžW“\\ï—¨[~\î\â6F=y£(»X÷©\â!(«3FRdƒŠŽ˜£#œ¯j·\ä:C2•Ï¨\ÅO»£m\\3D`\Ó5çŒ‘B\ËI\Ó\Ú\à´\Ê	\Çzó/\Zh¦j\r<`˜¥?€&½§I‰fºL¦sK\ã\rý6U+Œ! ýj\éN¤Q\Ä\Ó\ÃV‹{=\Ï\Ðuy´\éÁG€Ã±ì¶·°\Í\ZºH­»\Ð×ƒý’e=:ñNK»ý:L\rñ°\é\ÍpN3ƒ³M3\è•<>.*T\ç‘\ï\ÒLW8²\îu}:\×?i¸Hýº“øWš\Â[­OˆlŒn\Û\Íf\Ûèº®§9+\ÎXå˜©\ã>¤\Ô%)=d¬ ›«8\Å#¸»ñ\í½±u\Ó\à,\Ø JüÀV\"xŸQ¼‘ŒÏ–\'°\Å\\²ð-Ë²,­ó·`3^\Ë\áß‡švŸ\n\É<bYzó^¦u4\íÊ3­•ÆŒ£N[&4\Ò58nfòn~VSÑ†	¯h\ÑZ‚0:\Z\ÇÕ¾\Z\é\Z¤\â}\ÒC0\ÏÎ•¡¡x1ôg·ó\Èû¤ñŠö\ï¡ñ\éYYµW÷\â¹\ÝSH…c.¼`W^ÀS¸¶©\ÅaR<ñhÚ”9)#\Íc*ƒ¨Èª³;?\0\ÕýOM’\ÖF`\ÃXÅ9\ì:×‡Z2g\Ôa«F¤L±j¾T ±\Ï5¯p\é2ð½}++\Í\Ç9kD]¼`\rbu‰“,\Îq\éLûKŽT\î¯\'“\å\0dž”Ä\Ë˜’{\Ò$’\âVpI8\Åp÷\×,Ó°øy&µu\\\Æ\Z8¹$t\Çiº~«up\ï¼\r\ß{\"»ðq¼•\Ï\'0¢\ì_¹\Ô\íš\â\0\Ç\ê\Þº@\Ñ\ì‘]\\p=+\Âu\Ø/-\î]~RŒ\n³\á¯\Üi¦#\Æù\é^\ÅF©Y³\Ê\ÂSž)\Ê	ÝŸZ\Æ\í`Ÿ•ª\áj\äü=\â+]v+òH\0Ü™\Ít\Ù¡â’’j\èÎ­Ò›„•š[žj=\Å+5@\ìqš2±›{†F?\Zòma6\\H„¼c5\ë\ÒaÁ\ÍyÏŠ\í\ÚÌ±®vrk“h8Y(TW\êxž«¥\Û& 3÷”V­„8`1Žjþ-õ\ägùS­cŒË•`Â¼ZŸKC“M75’\ÂpT\Ëb‘©\Â*aÉ«–ß©\îBˆÉ®G&z\n\Æl)\â˜\Ìp)¬\ÆG\Â(’)‚g\"³m–¢‹\í<œ\Ðð¢\çµT·¹*Á]I­¸ˆŒô¥vU‘\ÍÞ¯&¹Ëˆ¡ƒ\æ8\ë]&¢\Ýp+…Ÿ\Ã×º¦¢Ž.|¸\Ãdf¶‚8\êÏ•\èŽóÃ®²Lf<€01^‰\èÃµcize¶f\"ƒ\Éõ5|Àªr£mwAr\Äò«KžW4]†sL\ÍU\ÜÀsR‡\æ®\æ$ÁŽ(\Ï=ºý(f8\â¤hP»Ò³œc5›sv±ü£“Y¶Z+\àb¨\î\Ë\â\Ì\ã,;Õˆc\ã8\ä\Ô61\ÅN\ÜT\î°8\ì+GgRj…\Ò\àu¨cH£Ž+’\×\ì|—\0s¬k§¸S˜q¸3Ò¼\Äx‡Qµ½{}`|¬q¸1\ê+–³\èz8:r”®šÓ¡iw0Ç¥!Š´ee¼‹\"{\Z’ö\ä\Ç\Ìz©ž^:\Õý>\ÎMB\äF¹À\Æ\ã\ØUöM/Nˆ\Ë}:ƒü1ƒ’\n\ã5oMrV\ßOˆ\ÛEœdp\ïW>I\É5ó=\Ö\Î\ÊX\ÂÆ¡q\×ev®ÁWzý\Ä[o¢&%Fo½^‚\Ã«Ø ¹¢¬|\æ*I&\Ó}\ËvÈ¥{\Z½\åªª\ç®*\âs€+¶08œŠ\Æ\ÑOÖ£k-\Ãk¨ ö5¸‘\ãµL\"\ÏZ\×\Ù&¶­(½\ÎB-&\Þ\Âcµ·H\Ã\î%W“\\O‚ôË­:ûTY\â*Û†ÓŽ$ò+\Ø^*¤Ñ¤a\Ø»i®z˜H¶¤´±\è\áó*‘„\é\És{Kjxß„\Ó\Íñ^¤þóõ\Írþ!\æñN ¨NÀb8\í[\Þ¿‡Mº\Öõ	:F\\Œ÷%¸‡hf¹šK™†v\Þ\ßS^U½\Å\ê}ªZ»}94l­cE^+¸ðýœW7>–…Žz\Z\åUB\0£Š\Û\Ð\ç\"\æx–@¬b8®ŒS\ÄA>ç›˜M\ÇQ­ùN\ë]òvD\Âc(ð£Š\ål.\áx\ätf\ÊË´\î÷£Qš\î[;óEÁenzñ^Kš•´\Ú\ê-\ìm\"ªLâ¾ANºŸƒ\ÄJž&ýu–$š2Ž ‚9¹ñ§]Z±k)¶s÷ekCB\Ô§¦[\\67²(|üÀsZN„ô¯›œyd\Ó[g	^)­š9\×\Öõ\Ë\\¬–9\ìblf³n\'×µ™a…PY$Œ¸;Ÿo|{\×O$-#òjÞ‘k\æjE>T,Àª¥j‘^dWš)?#\Ì.|\r¦¯dño(²|\Î[†õ=\ëºÓ§+¥y¥1Ih\Ò.\î¼gŠgˆ/,\í\ì\íä¸Œ1W]ÜžÕ‡msgq&¬ðH)Dv†A¯ª§‡§h´‡©Š¬¥$ÞŒ\çE\æ«¯L®.´qBa½8#Ú¾¹ðå±¶\Ñ\ì `Kd\Ýõ\Ç5ò^›\áÖ”\è6–®\ãûCYK‰\nñû´ }¸\æ¾Ì¶@¬\Ø­ª™áº²`3šj¢óžjq“šn3Ú°:\Î\Çh%\Ñ%\\\ËD9¯+‚kÜ¼c“D¹˜oÊ¼I\Æ\rxÙ—ñSþ\éôKýÔ—i•\É\ÅQ¹\rrñ[¡9–E_Î®\\¨NqYúc,ú½¦÷\âóz…\è+ÍŒy™\ëJ\\©³ZM[ieKy6O\ç=\Zˆu™­Ž\êÓ©\0•?J\éú\Æúþ9\á•OË¶ECœ«\Ã¸`3Šu)ò»J¢šL\Âþßƒ°\çð5Z\ãWi€òb‘ÜŒ\n\ß\è½tôª3\Ç\Ñ@\0V-\Ü\åŒw·Móª=+3UŒAm\"¡\Ç\×g$k®?Ux£‘\Zu\Ý\á\ç{\'søT\Øw³<¼yP\êò$²»­d\"ðJŒšú\×@º]C@\ÓnÈš\Î#\Ï–¾|ñ?†n4¤‡Tµ>eº6\á°nÚ„u>Æ½g\áÖ­má˜‘[\ìò4g \ê+\Ô\Ã;#\Ì\ÌTg8´õ9«õ1\rN9†r@ô\ä\ZË‘·y\íŠ\í<Ciök¹\'\Çî®†\Ön\ÊÃŸ­q,…`\nz\Æ\Ü×™^›…I#\Ð\Â\ÔU)E®\Äq7qZvð\Å.™$‹–ž\ãŠÍŒþü\ã¾+­\Ñl–\î\ÛP·\Î<Ã€q\íSJÒ±u§\Ég\Ýg~¨?rAS#Cëº½¿O±K{hÀ	\Z\Ç\ØhR\Ëoý¡f¶”I¿ø	¯E‘v­w\áh¸Ý´yx\ÚÑ—,bü\Ùòf¾Ðvû*.¤ós’µ\ÙxRÀxs\Ãú‡ˆn#\Í\Õ\æ\r¿u¾Ã¹«¶_u=CT¸»\Õvð=\ëÊ°£ni\é’:W°µ”B$Æ†2»Jc#1Š%JRL\Ó\ëT\×&—µ®x›\â\åºm«üÀœ\Ç8¦}q[¤€2®²!,Šr«zÿ\0Ãˆgy&\Ò\ä9\ÉòŸ•ü\ry|¶>!Ð¥ò\ÌÅƒŽd5\ãÖ¥8½Qô>«Š\\\Ôf“\ëv³Kš T\Ü\\\Û\Â:4‹»\ÝG&¸™µ½U&`\íµ‡Ue\Æ*›\ê·\Î>y¹V*-?R›\êzŸ\Å66÷0\Ø[<\Ò:¢¢r<s]¬Üœs^SðûB-F¢\å^Y³°Žv/ø×­ ½ZN7g\Ìc\éÒ¥Y\Ân:I¾\ãûqAQ\ëA5\Ðpn*\r\Ã9ô©_‘UûO\ãIK\ZpIþ*UR&¦¤Ô²\Ñ‘¤‘”nA\ZùƒÄšC\éz\ÍÕ²)Â¶\äÿ\0q¹¯¨«€ñ^“\æ]\Ûj(™ò\ÃG/s´÷®LDn¯\Øöò|O±®\ã\'\î\Í~\'\Ï8\Åu\Þ\ÕM\ÖQdlCr<©\é“÷MP\Öô¦²”È‹û—?)úV\Z’§=ó\\V¹õ’Q«M®GÎ‚\'e¦\Ú\Û\Ëx\åPqÜž‚ªxvHüG¦ZN\ÎU£&\ÇRV»È¢Š\Ú%H\×jÀ§\n\\\Î\ïc\æ\ë\Õt[‡\ÚFl:E¤\\¸óß¥]\"u*ƒ·j\á|a\âÛD¶´D32\îv~ˆ+\Ç5jú„\çºv\Ç@8ð­­ì‚Ž¾&*r—,^\Ç\Ñ\Zž¥a¼\Þe\ÄC\nAËŠðm\Z\å\Í\nŸ¸\ìW\ÝI®NB\Ò\ÌÅ‰9\É9®¿M\Ñ\î,­¡½”ó\Î\Õ_Eõ5»:Jnó»“6Kü¼Ó´\Ù\Þ\rZ\Í\Ã`4›	ÿ\0~¢ ­A*»®PeÐ‡^{¯\"¡h\ÑÁU¦š=\ÐB»F\rD\å“Þ¨\éM¨X\Û\Ì $z\âµüœšô“º<	E¦\Ñ\ï\ïÞ§\âcSÔN\à*ŒR©œE\"\Ò#\Û\Å0ª\ç8üjZk\n\nG?\â\r-5m.\â\Û?3.SÙ‡Jñ]+\ÄÚŽ3ZN<\Ø#fFŽY1\é_B4dr+É¼uá§œN\Õ2ê¿¿@:\ãø«š¬^\èö2Ú”d\Ý\n©r\Ïo&l±\ë–B\êÔ‚À~?CXûH$\ÍyÆ“¬\Þh—‚{s\Æy\è\ã\Ð×¢¾©e¨ º¶nþò?\âF®9\ìzs\ÂNƒ\ïŒqBA8ªs.\Å8\Õø®c#‘‘\íP\\JŒr\rbfÑƒ$\ç\æõ\Î*”\Öq\Ù\ïZ\ÒNŠ	\é\×®—EÑ£‘{…\Î\îUO@+jprzu\ç\Zq¼‹\ÒE…Ž\\a¤\ËEo¼	ö†\ç†+N•UBœÚ«\\…-zp\\±Hð*Kžmœ®«\á¨\î\Ô\ÉnV)À;Oc\\²i:™asl\Çý¸þa^º\Ð€Ž¸âªžwÁ3£S\ÅNž›£Ê¤d*\èþS/b1ù\Ô\Ð\ÛM8P\Ñ\ç=\äW£\Émo>‘#zdU¸,m\í\Ï\î\ÕTc¥cõw\Ü\èú\ê¶Úžo(;\â~Aû§ŠÝ›@}N\ÓdÐ¢uô®\Ñì¡“/\å¨oP*@›N˜¦©(‘,TžÇ˜\Í\à\Èt&G·fûDgx“¹ \ÔzwtõDŠý^	q\ÊW©¼h\êA\ä5\à\Þ2\Ð%\ÓgyR2-\å|©€hj\ÇV\Ã\'\n›ô=^½?W€´7Ì½Šž†²%ŠX$*ß¯°¿¿\Ñ\î–kgea\Õ{7\ÔW²h~(²\×\áò%+¤\\‘\ØûŠ\ÆJ\çT°Ò£ªw‰§»š1\Æ)ò&+œ\ÔüCg¥§-1X\Øj.[#µŒEg\É!Á$ž8\çz¿Ž\'¹f´Ó¢`Í•\ÝÔŸ¥p—š¦§«\\…2\È\á\Î<×¨ø?\Â\ÙE\Õ\È\Ý3ŒôQZ\Å1N:ç©«èŒ›O\ß\ß\é“\ä	q/\Ìr«\íSiz.©¤i‹my\Z.\ÙNF	\â½}bX\Ó\0V>³ú0n \Z\Þ\ÖG\Ö\\\çc‚H€\Íh€žX5]Pyd\âžÿ\0pz\ÂKS­l-\ÄJ\éÛÒ«\Ãn‚À\É5i³*CI·dD@\éM\Ëc \Ó\Ó} cZ¡qÒ“M_ôT UçˆŒ\Z\é[dþ6yæ¯£\ÜiW?\Ú:yùW\ïÅž* ñ¾—q“wo$OŒ–\ê+£ñF¢¶¶o\n\Ê\ã\â—zN¬\È\×ZH\"\r\×ùf²–Œõð°Ui§=\Ö\Ìô+/i«qþo=\È\ã\æU\æ½\n\ÇP[˜÷,RG\ì\ã¼ÿ\0Àº•¯”m\n*J„ŸMÂ½I	o=E:j\Ç:Ñ›žL©\í\Ù\ÎòpEyÿ\0ŠíŒ©UR\Ø\éšõ\Ñ\ã¬»ý\"\Þ\î2Ž+®3³G8ó!\á4‡KÔ¤\áC}\î+\Û-n Àã±®V?\Ø$\ë!’C°Œv®\Ê\Ö\Æ;8•œzšª’ŒµFt\ã(\îL	S\íÞ¥j¸<ô¦nÁö¬M‹A\ê]Ã¹\ëT÷~5hcJVq»ªœ°¬‰Z¦*\Ò*\çªøj\ÛS\Ãùr‘ŒŽ•\Â\Þx~\î\Ì\0X1Óœû\æ½~\ã{£?7¯½sWV7“€¾Zž8$óIÓ‹7†\"q²¾‡›\Û\Ý-˜òXƒ–À>™ö®\Ê\ÂK{ˆw®Ìƒ\È\ïWlü)mó:f\ÎOqŸJ\å5}Q\Ñ\'7v,\Íøz\Ö3…‘\ÛBª¨\ì\Ù\Óf0\Ç\Øp=Ed_IF\çkž_«\r“ÀÑ¸$r*…Ö±\Æv“À\êk\Þ\ÎL\Ñ2D³\È\Ë:\æ½7IGKU\Ü\n9Zòmw«	)\ãšôMSWK…\"†F\Çžµ¬>¼$\åd‹š\Ô¯wQ¼t\Ç¸\Ø\Ú\Ö)w\í$Ž•·\0–\êÅ‹3ŒóÖ¹«\È\äŽ^˜\ÃsŠ§©Œ´¸·nr{\ëZþµi§ó[µ€Q§*Š@bs^Ÿ£\Ø}š\ÝF9#‘J1\ÔU\'h›p®0{sS0\'=i`SóÒ´8\Ù6\Õ	\ì`žA!A¼g´™U€\Í4*’Àq\ÅR‘-\\\åõ\rNC Ã©\Ï	÷¨!¶[e(;\æº\í¤sU\æ·I\ã1\É\á\ÜUó°Œö8;\ÝgI³™ei\ÑNv–QZsn\â2BA\ê:V¿\à±0i,\É9\ØkŠ·»\Õô	J:1Ns\Ü\Z\ç©w{ž½\nPqN2×±\Ú\\\Í+=Er÷²¬\Ù\ÆÌƒ\ÐõÁ¨ou\Ûk´f•ˆ9B9®fk¶” \ZÃ”\ìTŽ»F°K»µ}£buÉ¯N²¼±W[x\ä×µx\ÌZù³´\Ö\ë\å\ä\0XòN+§ð•\í\Å\Ó]JÍµ°\â®:3š½\ÈÜ´±\ì1r:¸«z\Ô0†\ÂñVd{]	ž4¢Tº\àp8\íøW6\ì€\ÈùOLv®‚\í¾Lf¹Yf\Ø[±\ë\Åm	£Ï¼i0Þ°€H\ï\éX¾ó-#šic#*zNj—ˆusª.J†À\0ô\Åi\ÙL¢Ø£\08Ï®E\\¯\ÊL\çE‰.\ÅÄ»\Ãœ®¯Q[vwJ+žµ\n“|\çßtkm\æ.\ä|7\êEqT\Üö0÷±xÄ¬K«gÓšC· À\Èôª‰4°\ä0=?\nW½\à‚Ã‘\ÐrqXh£, 6\ì\î3PKr¡Dy\0ó\Ç^jv\Ì\çhÝŽƒ=ª­\Ü&Ü‡9\Î\Ç¤QF\Îd™\Þf2m\ÈbzzÕ¢¶\å\Ð\àq\×\ç\Ð\â–\Ø	¦\Ê7ñ9ú\Öýµ Û´ôf	s\ä\ÖÌ‰•ñ\ÆER´\ìnÊ®pø\ÎOž	®\É\ì\ÃFk\ïNg\åX\îƒW	Ù˜Ö¢¥t¶\æ£1b\ÌG<c­[\ã‘\ØW!£K$R\ì`x\Ç\'ƒ×Š\ì\ì\0út¯JNt|\Î&ƒ§6¹ d`â‘±¸“Þ&¦x\ÍvFp9æ­™Cr[!²\å¸Á#Žy­ \Ûd<žœu¬‹rV\ê5ùpH\Åj«!\É\à‘\\ò=\Z;\Ç\á› \×1\É(\åX\í¯o\Òöûžyf“nù\"UPg½k\Öô\Å$1$Âº)£ª©?ˆ¤ò´;§ ÿ\0« b¾y’I\îk\Ý<k)ƒÃ³`K(\ÍxU¹ƒW-\Î9Ž\ÖKUn0N)Ö¬\r¼`‚—[Á\Ó\ÓI’i,¤SnŸ/jõòý‘ó¹Žì±€M9¸™\ÍHU;™v¤w\Æz×®y\Ø\Ù\Ó\È5\ÕF\"\ã=+•\Ó_z‚z‘ÞºØ†\á\É\é\\µ7=:\Ý-˜Ä‰†=\ë>H$ˆù‘ô\'¥i§Ú–U\È#ŒV-)~­z1à°®~4D@*ÏŠ\"¹·XBòx\ì+›¶Ô’d\ëó¢¼ŒmÜ™\îeüª&\ïjˆ\ÉT¾Ö¼\Ôm6ðv×˜z÷ÐžIÀS\Ï\áY¦9®›\å\Î;J·ºH\ÙvÈ­5Š1\è*ž\Ç)¡FQJ¨g\Ï\çV4­3\ì÷±³˜0\0\Ï5­},B\â¹\×Ô­c1:¯\Ý<\äõ¯c¯\Ä\Ä\ÉFg´XCo\Zp\ÙŠ\ê\âpUH¯.Ò¼Eo²?™‘ŒzWq¦_\Åvœ>H®\ëhq¦o\îÁ¤,\rA¼c¨¤\ç(¸¸\0Rš„¦”H3\Í!¦I\Ó\Ö\\ñŽô¢Šv\È\ÌkŒc5Q\í 9&0\í\Ø\ã5 0i\ÛsšN(.\Î+]\Òfº…L+óMR\Ñ4I‰c(#‚k\ÑBÒ…Á¬]9\\\é†&¤a\Ês:³› ‚3‘\Åh\\\éð\Í\Æ\0ƒœ‚+X\â¨^\\$1–$qE£\çFx×‰<%²;Ú¯RN\Î\Õ\æÍ¡\Ý\ê\çb³¦o\âº_\Zx\Ò\æ\æ\é\íl¥\Â#aœw5\ÆYÿ\0o\Þ]+¦Q\í\Æk›÷8–\à{–3-¦«mu³7\í<¨Z2J\Ò\Æps]@\Ôõ\ÝapDaFvð\r%®‹y*?u GsÖº}#\ÃMq•™öœœšì£…£A{¨ó±yž+\Z×´–‹d´;?i\Ñ-º\Ï\'.ÂºµP½*8\í\ãEUQ€*M¤V§mŽ\Î\r`ÑƒŠbŠi§\0;Ôy©hi™—–+p¼¨5\çZž—-©vPJg¸¯[ž+.þ\×z>T+šµUy8|L¨I>Q\âŸgt“(qWR+§\è‡\íQ\î4‡y¤‡t;ð1\Ôf©Zò\Ç#g ­x•\"\éÉ¦}5\ZÊ¬L\Òû\Ä’cŠÆ¾\Ô\ÜÁ\0\ÜOS\éQM¨j:¡ )†<ý\ã\×\èO1\Â09=\Øõ¬¹®\Í”¶äŒ±<š\í´M1aƒ\Ì;2{ø¬b¥x,XðOy­\Ïm\ä9X\ã\ãÞ½¬¶Œ¤ùžÍ±P„y;˜~(€LÒ±‚3—\à©\Åqw:d)lUT¬€w^û_k›¤Ñ£,üŽk\Ð|=d5¢\ê$\ÈÀ\É# ¯G\Â\È\áÉ«*Uœ\ÛÐ‹Àú~±\ë:‚‰Ÿ˜š÷8\ï€†\ïYú~›¥ºÆƒ\0T\ÒF™5\ÍJ<‘µ\Î\Ü~!bk9%e²47\\Žjl‚+5\ÚXyS\ÆrE^	Jš»œ6.`b²u;D»…Š\Ô\Þªs¾\0\Ô6>{\×|«5\ä¯a(ò\ÝòT’1QXY]i€A;#0=W¥{m\Ü\ÑEd^\r«xŠ\ÊmbH#!¶¶”ð\ryøªq\åv=L\ryûDž\Çk¿(Á©¤s 5\Ï[\Ü\åTƒR\Ëq0\Î\Üþ5\âIYŸO	]\Z\Â$\å8\ÍFñ \Éøf«[\Ø\Éz2÷\Â2HùE[>±\Æf»vü@¨h\Õ2“Iœ‚*œ³\ÄIÁ\æ«^\Ûi\Ð3Ef~™ÝœU ‚4\êjA™Ì„g­N/ã±€’›\ÊçŠ­\Zƒ’k\'\ÞjKÌFr\Í\ëŠÖ›»9+Y#¯\Ð<M5\Ý\ÇÙ® ò\É\æ2kµ\ç\'¯\"¼x\íµ’7\Ã61ž3ô®÷G\Õ\í\ïSfý\Î3^‚\Øñ\ç«7Ø¿<fª<ò¯Ýˆ\ÕÌ¶i¬7\ãŠ.E†Esó!Ÿ\æ¡\Æ\rFW®\ê†Ê°Ë©Ž\Ò³\Ò\å\ê\æÑšxP*\ZDa\ãasŠ\\\nU\ÅE\ËH*´ª\rZª\ì*X\Èö¦¯5ñ›h\Ñ\ÛbðŸ/\Þâ»«û\Ø\ìm\äšB¢“ùWÍºÎ§.«-ÌŒp\Ç\n§²ö¬\'®‡±–Ð•Ió\ê£kÛ›yCC+©\rÀ\ÍtR¿ˆ¯\åY¡µ¸BË‚cS\Íd\èV?\Ú\ZŒ–\nº\×\Ó\Ö0\ÛÀˆƒT-(QöŒô±˜˜ay}\Ô\Û<OMðµ©{\Ù|Oñ\Í^£øIÒ˜HP\Í/w~!]\ÊDAÀ©‘?:î¥…„w\Ôðqz·W\åd6\Ú\Ý\0\0\0\0©ü\ÎMx«=k¾1<™\Î\ì\àUØ¢\Ç\"„M½*\ÒŒWL\"a&H€rju\\\ÓqS¨5ºFm‘”\ÍeÜ®Ì· ­¦¹\êi¥\Ø\É+³|±¯«\Z™\ÙE·¥‡)I%»gˆø’\ÑþxPü³\Ì%u^>‚’¶.sJ#–i¤žO™\ä9cS%•Td“€r{\nùù«\É\ÙYNR\å3»²IlRÇ°$šì´¬ŠKxŸ0û˜ûŠGJ\éü9\á„Ó‘\'ž ÷Ž½:ˆ\íõ¯@\Óôµ€™_\ïÔ‘^®\áj“ZôG˜c•KÒ†\Ý_sÉµN‹MC<©Á&w±ÀÁõ¯-{\Ú\ÝÞ¼“ó\áÙ½9ôõ†­£\ÛjVS\Ú\Ë2\Í!\È\é‘_$\ê¾\×t‰\åI\ì\å\Û6$E,¬;EkŽ\ÄW¥nUî¾§G\åy~2söóqœvÒº;_M¥”û7I\06$Ÿ(oÆ»™mæ„”a\Í|\ä®ñ70ý+z\Û\ÄúÕ¹Aö©S¢¹\Ü+\Åuœ\ÛmjÏ°©‘r¥\ìjh–\Ò= E”\'_&£\ßjX»°H€\ëŸ^kDñ5¦ª‰¤A1<\î )÷\Òx\ãY\Òo\ì-t:aspg^#\åF8Á>æ´„œuOS\ËúŒ\Þ\"4ª\ÂVº\æ\íc;\Â\×W¾#Ö­¬™e–\Å\ç.\à€ƒ\Øõ\êw_´\æ\Ô\Öú\Ö$¶FS0}Öµ¼\à\Ø|5§bL=\Ü\à4\ïü”{\n\ïš>G¾\n”\è\ÞmóHùLö®Šj„\"©\ÃDÒµ\ßs\Ét\íXx†\ÄH„Kw‹	òõ!«\×!@sŠAq9*Ž3]’\Ôñ©\ÅEhMÚ…ƒš¬\ìhs~\'\0h\×\Ä\çü+ÀJúÄ§:-ðL,x’\és4HN\ã¥xùŽµ#þ\Þ\Ê‡7ý\ã\n\ç\Í\Åp\×wO\Û[D\ì†b»\ØvE\ä×¥Me\")Ü¼T¾ðž—®jW2\ÝC\æ5±B£<s\È&¹púTWGv)7I\ëbm#G½hü\Ï*\Þ\Ú\Û\n\ÑG÷_\ê\Ä÷5\Ð24Gc‚¬¯‰~\Õ\Ä1\ÞY<²\Ú\Å\'x*¾\0\ê+‡\Ðüq-­¼V—\ÐýªùVRxƒ\Ó\ßž&_½jJÇ¥€\Ë\êWÁÆ­Æ¦®ð\êG‘\Æ\rRs\Ü\Ò\Åö]B´\é·ksñ¨û\è}S60§5\Ì\Ð8¸\Ý4\Ó[¦g]º…$œTmü3y­\î\Ï\îm\Øda\Ëa]½Ž‡€M|\ÏU·\Ô\×FJð½\0\à]hsk-?‹\ä÷a¿s‘—F];D6qt‚Ø¨\Ý\Î\å¡¯Ÿ¼-­K\ámeæ·ˆ\r6½6—<0\Ïñ-}Zè¬¤ ×ƒ\ëuY\Ôù¦;\í®\ïœD9=+Ñ§£Å«V¤¾ó\×\Ùkšo\Ê\âHfNq\ÜW›j:}ÎŸ3\æ*y#\ëX¾½\×t\r@Ç©6\ÎlEùçƒšö¹!·¹\n\åCñ\Ç\Ð\ÖXŒ<j¯>\çV*/k§º<Q‰E´¾\\W øl…žxó÷‚¶=*¦£ ¥Œ¦hbgW|ªvš»£\Ú\Ý5ð¸xŒ`5\ÇJ„\é\ÕWG«_N®V}\È(¡“<b—¤\ï\é^\n\å20@5\ãV¥Áª²Œf³‘qeQX\Z\ÝÝ¥…„\×7	\Z\æº^Gñ:óe­°nd±\Ê+\Ï\Å5³\Ø\Ë)<F&;½^¾ˆò+\ÉZ\ÖŽÁòªƒ\×h\'®j\Þ¿\Ñ\íšy\Ù…\Êû÷¬«5/wnA3GÎ½\ë\ÄV¨hwp6\î\Ý9¯-F\ç\×\âk¼5ZVå–Œ\âþ^H&»³,vmªžÇ¡\Å{R‘Šùÿ\0\á\Ûm\×öž7@ù?J÷\å\é]˜w\îŸ9AG\ßx¦<œŠa\Å®\Åþ%¿\Ó\Ùt\Óu7L\Ãw\É\ÝF;\×Qã¨¹;#¼4Í˜|\Ó ™\'…$C•uÖ§\ïI™\ÛQiF1IKR\Ê˜Ñ†\\cƒ\ÔRŽ¢ŸÀ¬Ù¤]ŽGXðÍž§m<@‹¯P8±¯Ÿ5M*\ïI½’\Ú\æ=¬„\í=œv\"¾¯ W3\âXë¶¦)\×kc}\ä5\ÉRŸT{¹~c:/’¥\åø\Â\éÈ–úNß•”W²3ðq_8\Ï©\àb7ŽTsŒŒttôa]ÿ\0Ä‰dŒ­¥¶\ÂW¹\Î\rDeh˜¼\\MuV•œf–§9\â\ë\Ñu­]¿Q»jýq’\Z·‹­B\ãj+I,\ÐrI5\ì~ð,6!.¯@’\àr«\Õcÿ\0M\'#¾¶&–\nŒyž©$¢·gœG¦\Ûxz\Äk\Z\Ê0 AñHÝ³\\¾½\ãýO\Ä	5²†&Ü¾Y;Ž:d\×\Ðþ1\Ð4mWHxõ\\ˆQƒ\îV\Ú\Ê\Ã\Ð\×\ÎøD‹ò\"yE™?»•°…oeŒù,^#ŒŸ2\Ûk.„px«WeO2p\äu\ÊU£\âýRØ‚#\Ç9\ÜJ\ê­<¤×‰w÷ª\Þ¶ƒ\ÔËž\Çi†}?\ÑÆ¯µø\ç\Ã\ZZ\êSË¦\ÍAsÌˆ½U€\ëŠöœJù—À¾\Ñ|d­r7B°JRlðsŽ¡¯¦E•rŒv\"´N?gc§}4\Ä5\';i\'\î”\ÉC€¥\ëL½\è-0¤§f‘zš ¨f„7Qš±HO5,¸³\Ãü_\à\É\"’K\í9!$\Ë¯ºûWš¬³[Iº6ea×µ}a,Jk\Öü£ê¹—\Êò&\ï$|g\ê+’tõ\Ðúih*u“ke#\Î4‹ô¿n@‘:¯õ®Š-*\ê\ì`ýN+\Íu}6\ï@\ÔZ!ÜŸ28\à[öž?\Õm`Hü¨™\å½kM\\\í­‡œÒ•5#\Ñ`ð…·\Ê÷M\æ`\ç`ûµ\Ó\É\åZÀ	\Û\Z¨\îp\0\ã‡\â¿v\â+x\"\ß\'÷±ümXx{\ÄZ\Ë\Å6±tþVra\r\Ï\Ð\âº \Ò\Ò1<lN¤W5z‘Š=\Ò\å.#lw«±úU—ƒw-÷ªkhc¶…cEÚª0 v\ÅH\à5u­\ni&\ì\":UiS\0°©\ê9G\È\ßJ²\naKrZ…ˆ\â«DILš³\Î­H”‚3G^Ø¤N)\Õ,¤Æ•\Õ;«[{\ÈZ\ãŒ9¯`TMÀ\ëY\È\Òi\è\Î;Tð~¨A± \Ø\Ø\ÂÈœ^CªxcUð\Õ\Â]\Ã\"Hˆ\ÙGQ^\ç«j–\Úl\r,\Ò*\àZð[\ëýSÄ—\Æ4w+Ÿ}ª+	\Ø÷0¯4ùŸ¹\ælK\ãÁ,!>\ÆD\Ûy;¸\ÍrI¡®Þ¸†&wf\É\ÇAš¡=«Z\Ì\Ñ>)\æ½\áÖŸ\"Z´ò/1\Ú1\Øw¨Q»;jºxj2œQ\Â\Þ‹NDšuY\'=[=«\Ñ\ãUAÛµ=\"\Ù\Æj\\s]ŠHùºø‰Ö“rd`U{\Èöîž¢®bQUc\Î\Í3Ë^-Ãž534x5\Ñ\ë¦\Úa&2\í\\\ëm \à\Ö™\ê\Â|\ÑLT”}Xjš\é\n«€¤œôªˆ@Ž\Í\Åt\çN{˜\ÖHXn\Û\È=\r8\Æ\æuj(›\ZN>Î™\í~Uªö¼qaÒ¬ÉŒpk{hyÒ•\ær\Z½ˆûu­\Î]\Ø5µ4\ÍfñžŒ„\Zž\î\Ø\\Z²úr=ˆ¤´8‰wzTX\éV\ÔWc\çk\Ó6‘ªùÑ’­\åO\Ð÷¯pðÖ±§c±·8\ÃC^i\ã\Ë\á}\Æ\æ ð%Ìj$£®q\Û\"¡h\ÏWN8Œ2¨·J\ç¾)\Ü8\è)Hnµ*½XlV\Èù\ÙnBW8¨\ß8w©›¥F\ã+Tf\ÈF[\0Ñ´ž£Q$¯¸ŽN*Qów4\ÅE\É\'5az`\Ôh\0=jD?þº<s\Ø\Ò\ãš8¤\Ï4 {\Ó6?ZN¢•À„…À\Ç¢tV¡1VO=j6\ï‘\Ð\Òzš\'c…\Õü¥\ß#º ‰ñ\Õk\Çõ­m.cŒpA\ë_DÝ¿–Œvœ×„k÷is~À“³Z\ÆQH÷0*Né»£\rq.FOL\Åu:™u¨\Ì$–Rè‡“\ÔVñð–™ýžfI¥\Þ9\'Š\Ìð\í\Óiú‘€¿\ÈÀ\â¡Y5­*S\ä\Ý#\Ô\ím\0\È\íN“MŠ\ãxÀlÖ»‰#ñš¶¡y\ÇÖ¶Hù¹¶™\Í\Ú\è‰\à²ñ\ëš\ë¢\\.\Ñ\éT\\óŽµj+Ü‘N\Ä99n^\rž¼\Óò*1ót\í\éR\íÿ\0\ë\nDŒÀ\äú\Óvš\â€89\ë@\Ø	\Æ{ŠiS“\Óª^ø£\0m\ïŠw\Z*ºž\â¨]\ØZ].\'…X{Š\Ú\Æ\îF=ª¹P½y4ŽŠri£\ÉüG¢\èVp3$e]‡!zq\Ï5\ä÷\Z¾ &½W\ÆR¬“²`u¬\ïxZ;\äónSr‘\ïY\Ø÷iMBŠrgšù#O·­{¯„o,d´A€°Q¸R]øJ’\"`\Ëq¸<W›\\X_h7y@\Ê\Ês‘\ÆE\"£§‰ƒŠv>ˆ\\R³m\Íp~ñL:ŒKŒe2÷ü+²2£!#ÓŠ\Ñ=Z2„šh\ã<K\âk}$|\ïô\ç5\â\ZßŽ/.w\ÇlB§8­o]†½;›, \à˜5\ä’n,OŽ½+®œU>²iØ¹ö‰g™I<“\Ï5\Ûèº„\Ñ\\Ä²\ä\Æ\çœœúŠó¥!\àpEt\Ö3\È\Æ7¡µqº9®\ÓLö™t\Òd‰r¬:úSÚ°\\ó\Ç\0\æº-\rCKY\ÊqÞ²\îôùmˆS‚I\æÔo4\Ð\ÒQ±\ÆsPº&u\ëOR\ÄòG\è`\Ø\È\È\é\\\ì\î!DÀ#h8*\rb–Y+¸c-[p[yŒ8\ïž\Ô\Íb{tO%¹ùx\é\ÔV±1¨.\Ó\æt—;[®F{‚y­k\Ýz=?;”“ž£µ\Ö;œ\Éc©5\Ìx\âPSøº`÷5¥Ž}bý\ÄGZšU1U\'5»+®\n©\çÒ¸ŸD\ël$¨\ïÝ«´·˜Ÿ§\ÇA\ÓF5\ï#\ï\ìd\Úw\Û\Ðõ­½?UµŸ”‘K÷r21To”<Rn\ÎHÚ¼‚ù\Þ\ÂÑ–F#]T$\Ï7F-D	Ô¯oP=}\é’\â\0v\â¼Kñå¹Ž;‘½3÷‡^;W¤Xê–º„jñ¾\åc\íÞ»otxÒ§\ÈÍˆ¶o›¥m6ø\èpA\ïõ®p02/$\å€þ5Ñ¸ÛŽ\0$Š\Îh\ê¢}!¢\Ä\Ís)\Ç\Ë\êEzNš1÷\Åq\Z**¬Ž¯Š\ïlT\ÕI\Özžeñ—\ÄC\Ðl\Â\0^k‚0}\0\ÎkÁ´\Ïiò\ånA‰±\ÃEw_´D\ÞhÑ \ì®W×°¯—#\å\ÉžkNT\Î)\ËS\èC^\Ó\î\ì\Ñ\"º‰òx¹­\Û¿eAÁùk\å\ØÜ®\ng\'§¦O½vš?Œµ\r4ª»ù±ô(k³\rQRg™‹ \ê§f{\ïB*•õ¼’\í+Œ÷\ã5\Í\Ã\ãM[q+N#`P\Ñ,.\'H¢Y“\Ôpµ\ë*\Ðktx¯S›\áz\îŸ€¹\ã¡\ÇZ\ê­Ü†\ÚÙ¬}6/6/ðŒV’¹Wù€¬¤\î\Î\ÚQqH\ÛOn)\Ç \ÕKy•¸\Íh(0k3¡–‰q+(;†9¯&Ö¼!wm+]iÄ‚yh\ÏCô¯jaP´(zŒ\çŒV)Æ¢³7¥Vt¥t|\Û,¾(‡!´[‚ñ*\ä¦)¬j–\Ëû\Ý.\è\Î|³_M$*½±Jmccó ob+\à\ás½c\ê6Á\â;ÉƒmÓ®”\ï\ÆV¥\Z¶¿?iw,}vñ_D5„l2jª\Å\åp\å&®8:dKRÛ³ç—³ñ^¢J\'„ww\àb¸\ë\Ë{›)\Þ\Þ\êM²s¼\×\ÔÚŽ\Ô­y/Œô˜\Ìñ^y|1»\×u*j*\Èó«Wswg9\áÛˆ™QB;²žM{v€ò,ƒ\ä\nŒ8\ë\Êô[;k{ ¶W^Å§Ov¦1ZKB©\Ê\éB“RœcŽ•(\ëœõ §5Í‹*\àŸZ\ç&ª–\Ú}ªÒ•+Ö€»$RqÖ¤RMEØšrcôÆ™84\ï|R/&)\0§ô¥£g\Æy©e­J·„BI\é^!ñ\Åom²¶“÷®\æS÷Ez‹5”\Ó,%™˜\r£­|£}}>¡tóLÅšF\'&¼¬mv½\Èõ\Üú¼ƒ-U§\í\ê/vEÝ‹\É\É\ÎI\Îk\Ø|=koˆO\ÙË’¼“Ò¼\ÃH³Î€Œþ5ô&—§Á²|\äNý+L¶\ÞfœK8\ÅS‚{Ý›©\ÄD,¨À5{I”\\\\¸Úƒ\Ë\Ã\ÐW\'xd±\Ç/Q\Ï5\ÓøZÍ¡I$#–89¯UŸ-®FÎ»µ.\Ó\éÒœ\"ž(±ƒcvÑ·Š“¥\Ú3E2,S€§b—8¤0\àgœ\ÓX9 P\ç¥Œ\â<Mi\Ö3.Á÷kÇ µ\n~\\W»ê´ð:ûW’=ª\Â\ì£=Mx™‚|ñ~G¹•KÝ’ód),sAe\Î&™—l-k\ØYn\Ê\äc5\ÇJòHô\ëK–\r™\Ööww‡Sµ\0\ÎkZ·\Õ\"µ“l…‹±ü+\Ö4\ëx\ÖØ–„—\Ïx†+eE\rû¼`t¯¬Á\ÅB)\r˜¹T”¥\æ|\ë¾\æmAšX·\ã\ÔWºü;¶ý\ÑRyj\â#Ó¬Hœ¤¬¹p0y\ÆM{7…\íãµ²\Â6\à@\çx›X0M\Ø\éˆl`b™\åªûú\Ô\ÊF)„\î®žƒ*\Ë9À¬+”\Ør;WD\ÇJÎ¸P\á\Å+’r÷\"´°¾\Õ0ˆ(ûÇ¦yf½ñ‹C³%,ƒ\Ý>8=»\é°\Ü\ÚKònÊx\ë_\ZköòZ\êS@\Ùù[Q&*z\Ê\Ì\ì|Gñ7\Ä:\àx„\â\Ú$m‹‚GÖ²´Z\îF\ÆFWÖ¹@p¥zO\ì\Ú\æ\çj!%q\ÖÙž¦%$o\éz\á´³\Ý¸\èI\ê:z\×o<s(Á\"–óF\Ò4\È\Ò{¥¤\ïž\ßJ)W}³ßŽ•\åVžÇ»†©u½\Ç3\'*M/Ø§u\ÃgSLW´¶b“Jˆ}\Í>iPœ5\ÌY8\ã<\×)Ü¤ˆ’Ã’Y®¦i6­<\ëVúŒ¥`,A\êÝª\Ò\"¢q\×7\ä\í@9\â–öD¶·\àelrMX…0|\Æäš¯þ¾rOE§c)«£ƒ×“Qû,S(\Û\"sYúN³ue<3\É:\Æ€\Êp\Õ\Úk)ö¡\äU¯¸\É\Ç\áV¶˜J±f9\Ìz×©B¬eI£\Â\ÄQœj\Þ)ž\ë¥j‘jv«\"7?\Ä+Wš\àü5£]\Ûáœ˜\ã<]\Ùíš™4\ZˆÔ†£¬›*\ÄN8¦!©˜\äT)\ç½!\ZQÁ4‚€~jE\ê*	H¥\ÏJ\Ë\Õnã´´–W8\n¤\ÔIš\ÂM%«g”|AÕ˜”²°nzò¦Û‘\Çoz\Ô\Õ/žþöiœ“¹\Éü;VS\Äq\\÷>\ÇAP£uKS_G”\Ãw©\Ã+WÕ–,$·‰û².k\ä»L¬Š}\ë\êm™ô\ÛV$ó\Z\×VY3\Ì\Î\ãjt\å\çc£E;*eN\æˆ\ÃÉ«x\êE)&	Ú­¢\Ó#Z¶©[ÁIU\àTñŒR©€®ˆ£1@\Ï8\Å\"ŒqOb1Z¤f\Ù\Ò,<Žp¨¥\á^+}}.»|ó;~\éˆS°µ\é^+¸{m|6„\'\ç^ka¢Œb¸1\Õ\Z´«=l²Š—5G½\ì‡„$\ãœu­/i\Þj2\ÝH2¶ø\Ù\è\\Ò²\åEnx&Eµ¹¸±”ŒN\ÆHO¸\ê+¢\ëFý\ÏO\Ï<ùw±\ê6ÀFWšÓŒ©<UÁ^;U´\0‘Š÷\á±ò\ÒÜµ…#ƒLkua\È \æ¤Vªi1©4yï‰¾hž _([Ü,Cô\Ü+Äµ_†(\ÓÝŒ1\Çu\'ŽÇ¸5õŽAW\ã­~?hòJ\ï¦>\\C\Ü÷ú\nòñxJ”\í\Ê\×c\éò|\ã2…JxzröŠM%kc\äé š\Ò\å\à™v¼G3\Ð\×oðûNŠ÷\Å\Ï\Ë™¹Aš\ä¢\Û-\Ú4’—g•Y\É\çw9\æ»\ÞXi\ÚüSi$D€\È\èp7õÈ¯&£(É«¤\Ñ÷¸˜Ô«Jt£¤§	%.‰ŸZBÉŒU\Ì^y\àG\â],K\'0\á&Q\ëýï¡®þ\"1_]F¤jB2Ž\Íc0õpµ\çJª´\à\ì\Év\0i®¸9\ç0Á¤l\nÙœh®ÄÀ£#µ<‚J§ó\Ç#v^\Õ&bø‰7XMƒ\ÓJó\ÉS…\í\ÇJ\ì|Ky”KP>g;˜û\n\ä_ž3^&:IÕ·ec\ér¸8Ð»[¶\ÑJHøÁ«\ÞSm¬]$av\É\0b;\åMCq\Êb—\ÂÒªø˜¦y{g\ê+’‹ý\ì}N\ìDq?ðž¢ÀH§¨¯\"ñg\Ã;NI.ôÂ–·MÉ¤N¡¯dÀ# \Åz5¨Â¬m%s\ÊÁc±8\Z\Üôf\âú®Œø¾\â\ro\ÂÚŽeI¬\î\à0?+¯B+·ð÷lD\Ò]v¶8• Ÿq^\Ó\âC§\Ûi·_\ÅF™*\Ê?L\×\Ê7¶ÿ\0m¹¼š\Ò\×dþð\Æv)\â¼Z\Ðt\'¤®}\Þ\n½,îŒj’ŽŽq{ž«¬|P³®šlLfc$£G®=j/\rkþ0\Ö\Ì1\Åkˆ0ó.¥\r¾Þ¦¥øa£\éw\Z}\Í\ä±$³y\Æ3¼n\n#½}bXÀ@ º(Â­KM\ÎË²<<Ê¶*¸jXe)\'¬\æ\Êml®ÿ\0›šy@MZ=j<d× ™h\Ì{8Xœª\ã\ÜTi\n\Ä6¨À\ì=+EñŠª\Ô\ÉTt\íLPÀ©3“L<5»$\è)9\íF9\ëIš\r“¦*¡\ä`Õ–\ÅT\îk9\ZD£p˜\ànŒš´1vŽk\èž\é_3ø\é\Ëøš\ï\'%U¼œk\ÑzŸOÃ°O\ßh3#\Ã\Ö\æ\ë[²·šýšõ?\êmm¦‹db$¸p\Ý\ï\\\Ãû_7Wšb8Š?«þ1—\Ì\Õ\Ö\Ñ ýk‰|½Y*Ù…8½¡˜¹‡MñRL\á«¦\ã\Ó-^\Þuý\"\ï\"\éÙ³_4_€\ÌTŒõ$Wcá•±–\Øy¨¢X\Éö­\èJ\Úy¾\rTj­ÞŠ\Ö=B\ã\ÄF\î-–CúHkŒÕ­ô÷Š ^ydR˜\êÍžhk\ëk\"W\Í@QÜ“\ØWO è·³Îš…\îc\ã1C\è=Mv#\ç%\Ò\Ô\é4)ô\í.\Þ\Úw\Üñ¯_j\Öj“\0b¡—¨¡œrwd”½i£¥9EC\Z- £ ©fˆ+\Î<i\â\ß\ì•û-£ƒrA\Éë²»»û¸\ìm&¸sòÆ…\à+\å\ë¹\çÕ¯e™ƒfF\ÜMsU•o)\ÂF¼\å9«\ÆÓ»#ži/\Ó\ÏpZSŒ\ä¶k»ð¿‡4sHN¬²¬¬¥”\àšó6 ½8­[MR\æ›8]“\í¤¸8+Ž }kn}\"©>Wt}£øoJ\ÒX@b0\\òÆºv\à:5­:h­\äoµDÍµUºŠõ³­\Û\Ü\ÚH®\ÞK²\ã\' ük¢6±ò˜\Êu\ãU{G\Ì\å³0¼[¨iº‹Ù¥\Ç\ïQÃ¯]¬\É\Ø\×kqý¾\å žŒcTEÁ,ðË°²;\ï\î=EC\r©µ˜\Ëo…\ÜrW±®i\Ê\ì\è§IAXÛŠG¶8#+Ve+Û¦E±\ä\ät¬‰\Ò[f$¯qYÜ¶´/\Ä\æF$Á9®\ëÁ÷\à\Ã5‹·\ïar@=\Ðô\"¼\â\Þe\\95±¡\Ý*x†\ÎNž`x\È=÷\åZR“SG%zjT\Ù\ì\àdÒŽ¼\Óc5*\ãšô e¯L\Î(ú\\\Óh ¤\Å\Í5›&”\ÓjnR#,@=\ëñOŒSEqmBK‚2A\è£\ß\ÜO ð‚sô¯™5Ë¶½\Õn§cel}+\n’²=œ«EF\æ¯-»±5Zÿ\0Y™nn×€\n®\ÕÀ\Åb–\Æ+\ß<;£Y\Ýxr\Þ\Þ\æ%‘$ˆ‘\Ï5\åZ•‚\èºû¢\0ñÁ:\ã<ü¦°=úšss§Û“dc\éz„úUüWQòõSÚ¾’\Òï ¿´Šx2H2\ryŒô\Ëxmn­\ãT2\çq\r/õ{›”´f-\ìqŸ\ájÒžŒ\á\Ìp\ß[\ÃûX+J?Š=\Ï4\Ð\ÃŠdl®&u£\ã\ä0“ÔŠ­3§ž\Õ`ò9\ëUfû£\Ì\ÙV,cšµ\àÆ«(;ª\Ì\'\r×¥¹u8\ëRŒ\Óž3I”¨\ß\\¥­¼“9\á&®s\\Ÿ‹w\r\èƒ\ÈZ\ÊGE©ÔŠ\î\Ñ\ä,×¾.\×L\Î\"_½\Ï}zÞ›¡\Ùi¶\Â8cQ\ê}O©¯0ð‘©Ü¯ª\ç^\Òp¿¹Ò¹\ëb\ä\é\Ê4\ã¤RGÎš\Ün²ê«–/€~kÞ¼7o$6¬‘„a\àt¯ùþ)ˆ÷9?¯ l¬*	\ì1U\r\Øó	¿eJW-ŒRŽ(4™\Ç·Hð…\âšI9¥&“’*˜‘^\æšŒ3ŸZ\âoô™3[®Oñ-w„žõVh\Ãò¼\Z†“6…GÉ•.˜°ÃŽs\Ø×£\ée¤{¸bµv8#\É0\Z¬ª*Ž\0F6c«[XT\\´:\ÓÒ‘\Æj\Îk\êT\Þ\09<U(\æVgLò;{\ZžqŒ\â«$\n&W>œš,\\§	\ã\è\Û#•íŽ½q\\ÿ\0€\í\ÜI/8\Î\Ú\ì¼p\0\Ó\×5\ÏøE1Î½Äµƒø\Ïrk/‘\ëP®\0ö\íVxª#\0´W8¥l‘\à\ÏrÁ5Ÿ2\Ô\ÔFB¦x\éT¥¹`0JŽz\Õ$Ì¤ÀŒýj\ÊH¤ñ\ÜW3!\Õ?´iCnA\É\ïš\ÚN4\Ú%;šj\Ü\ãÒ¥qžý*01Ï­J0j4Bö§P1J\0¤QŒõ££ŒPP\ÃÀ¦6Ò¸\ÍKŽ\Õq’i·9\ï]‹;	›8\È\Å|ñ¨O¾gs\Ü×±ø\âp-\Ò.ü¶+\Än2$#¾*&}&[M*7\î\ÏXð\Î/tqž\n\í\'\é\\>±¦\Ýé—¥Ø·\ÊÛ”Žø®·À\î~\Ë\"œ€Š\ÚñFž.lK`\åGZŽ[£9Uöx‰E\ì\Ù7†µ3{f‡# \r\Þ\Ç+«\rò\Ç5\â\Z©ý—¨˜\Ü7•!Á>‡±¯`Ša&Â¯\ØV‘<¬mgR\ëfh \ÝÞ¦_”\ÓP÷\é‘VF•g\0\äb˜<œÕ \Ýj\ÈQ\È\æ¤À¬½½©À\ãŠf\â(\É4¬1\ìÊ¿…†EDXm\É\ïJ®zR\ZD¹Oj‚VÀ$óN\'š«{\'—m3g¢‘A¬7G–]\Û.¡¬\Ã*’\rzEªA(\Ç\0c¸\Í\Z\Õç¾–\ä÷$B¯BpT¤v×¨ý\ØôHpJ\ã|U¦‰\à\Þ\'¿«¶?Ÿª\Ü š2\Ð\Õ$eN¯$\Ó>džl\îXÙ«pÀWMg\ã[¨­\ä†\ã\çlŒ\'=\Ím\ëº@ŠI~\\pk\Ì\î\âò\ÙÀlá¸¢\Ö=W\ì\ë\Å;\î¿=\åÔ²HHg\Ç \Ï\Ì9l‘œ\í\È=óOj\í®lN 6.žœâ±®¼9©[!rŠPsš\ë§5±\á\âðòRm-UU\'\Æ\r[´žKiT†â©¶ ŒH3\È\ã¾+}\Ï6Q±õ‚õhn\í¶dg±é•®\îx#¹\08¯•|%«\Éiv°yÌ…\Ï\ÈG÷ºâ½†/\Z\ÞZÈ¢\ê%<€8üq\\Ub\Ñß‡\Ö\Í\r\æöv —¨¢HööŸ­k[\êvz½¾ø¤\ã§q\ÅP6Ì³®2qÿ\0×®GÓ…\ìKw2Y\Û,F~•\ã\Zþ©s;»‡`\Åz\ç¯Pñ,\Í\rº§\0s\Î+Ãµ\Éz\åS~;\Öô¢4ƒeH¼K©Û©D—*\ä€k*&¹Ô¯K6\\\àó’sU°\ÇLóžù®\ç\Âh\ÆIp	\çúVò•\Ï/\Êv;HV\Þ\Þ8×®\ÅüMi\Ù\âFz\Ô’+lœó\éW2g>Š8\É=k•¦u\Æ\ÆM\ëlµc’;ŒJò=E™§”‘ŒšõmNh÷;\ÕC’¯±¯;Õ…±\á[ž2@ûWEqbš96F¥jiº¥Î:²7\×*–\ÔcÁú{š6þY\ê:\æ»\å\Î)ž\ã¦\ê†ò4( ’=\ë¾b4$\ã\ä\É>\â¼K\Ã\"Ž[oË·ñ¯gÄ–°¹\î€úT\Ì(+6­´¤Nr9z\í­S\ä\\zt®SNM¶\ÈHÁ<\×g\á08\â»i\"\ë³\ä/\Ú\íŸ\Ä6v\ã8Š\Ð~§5\à\É\Û\×½‡\ãd\Þ\ïˆ¢ßŠò„ Á\Ç|\ëZ\Øó§?y‘¥¿ c$\âšãŒž:Õ¼0\Ç\'j­,y\ïp8\Îi£.k\ã\0wæº¿Z\Ý\\^Ä©Ÿ½šç €»F\\\â½\ÓÀš:\Å	¹t\Ë7\n}«zZ³»#\×ôKsmc“–\Ú9­Š7 â¡µ;cU$ôÈ«}\Ï\×m\Î{\"ª\ÄP’¸­¥<)¨‹\ÝH§n¸©)1žÂ˜cÁ<Ò£Œu&F}jKDcŒ}i\á¹4¼\Ô\Óõ\ÅKCž:\ÕY@qR{\Z‡!3\Zö\ëô\Î+Ì¼M¨\Ú[\Û\ÉmtBŠ\Äð3^¯q,!O™Š\àu{\r3S¸Qs‘Pœ\ÖÑ•Œ$_\Ãm,,™8\ê \î+°²ø™£E2C\ßVµ}_ÀþSÁm\æ*Œª s^+\â¯Å©«A§Ú¤\æB£q•œ\ê¥\Ô\è¥NM«&})¦üTð£Å¶[ÐŒ89S[Pxÿ\0Â·RmQŒŸJø4\Ì\ê\n\ä\Ã4-Ô©Ê»px®oj\ï±\Û\ì¼\Ï\ÑXuK;œ\æV\ÏpjüRüØ¯‚t\ê–WEÌ€/«M}Q\à\ÏÇ¬À±J\ã\ÍQ×³VšdJ›Zž¶c\'šUbzT È§Nx­L\Í\0\Ù\â¦Z§\î¬\î\â“(°H¬\ËÛ•†6bGÕ§pªX×‹|Cñ9†#el\ä<ƒ\æ#°®ZõU(6zY~\nx\Úñ§»¾\È\à<u\âc«Þ›x‰ò¢c\È\îEp‘ v©„.ùcš–KHª8É¯\'Rw}YúLiSÁ\á” ­D\í¼9P\Ë»œšö›kØš\ÛS“Æ¼[G´V¹É—aŒaEzI#\Ø`B®I¯£\ÃQT\é¤~gš\ãe‰\Ä\ÊMù#N\âO>\ïœŒŠô>³\ÚÆž\Ã5\äZ(ž\çSM\í•g\ìy¯d</V\î\'j{¥\Å\ëJ+Kt¿0lûU¡{&Ñ¹jlM\Í1\Å³‘š\Ïûzq¹H©>\×ŒÁ¤2\Ñ# ¦gšvqOZ’\Ç\0qšc’*|U¢DoY½‹Z´f\\\êztd·ŒxZáµ¨¢r³BC+w\çþ=»huH\'­}U:1Vcò¥x˜šþ\Ñ\Ê--õ8L¹Ó¥N´[|\ËT9\Ù\"9j†óÅºU§ä‘ˆÝ³°®]ÖŒ\Ò46“¸Žõ\Ï\Ú\Ú\Ë<€.X“\\”\ê8KC\è!•Ó©M:\Íúl{‡m®#XÑXšf»}¯\Z\æ;W•\ãjó\Ïr*\ïƒü¶Ñ¥\Í\êeø*‡·¹¯Qò\"	‚£¯ \ÂÖ«§#\á³l6\r\Öp Ý–\ïs\å\ØuûŸ\Ý\Ã%£¬¬ÿ\02´d\é^\Û\á\Én\æ·\r,&%\ìü+§{[]\àˆ\àðJÓ•kzµ¹\Ö\Ö<º4=—[’dŠi\é‘ÞÒš\Ì1\\\Ì\é±HëŠ£?\0ãšº\æ¨Np*A£\Öt\rü\Å|‘ñ\Ó\Z²\Ê\Ë\Î=«\ë\íE7DGZò›\ï®·u’‘¡>\äŠW\"\ÍM4x\'‡<-©x‚\ä$1€ò\Ø\à}k\é_x^\Ã\Ã\Öê°¨’b2ò÷>¸®†\ÃH¶\Ò\í\Ò\Þ\ÖŠ5À\ã¾=jÄ¹Tc\Ç²vl\ê\çiXòO\ZjrLD\0aw\äõ5•\áË‰\Ö4Y—f\î•{]š9.\\|„9\ÆIª\ÚZ4ò·–‡bðt®\\]8¸Y}i*º³oP\Ð\íõ¿j\ïŒ\ÖB\èV\Ñ­lƒ¢º\Ër]{\ä\Z­:ø¼V¬}$d™Ÿkk@P¢´ˆ\ïŠDZ˜‘ŒY³tSm\Äaj%Zœb­Wr4¢‚\Û\Æ\Î\\ŽO$\×O¡²I+¨A„œ\\\î]\Ù\"Œ|\Ìp+»Ó¬’\Æ\Ýc=\Øúš\é¥{œ‡uf€ùM1)4\Æ&·¹\ç8¨É¥¦ži\\\æ«\Ë×š±šc¶„+òÓ˜ñUQN“#¯0ø©´V\Éh„†”óô\è\ÅÀf¼+Å²I¨\ëo@°@ã ¬*=[*¤§‰M\íN@H\Å«{`lR0\Î¿$Â³À’>­\"\åª1k\êo\r\ÄSK´Sž\"^½«\æM.#-\ä(Nñ_XipùpD˜\åT\n\îÁ\Æòlð3\é¥Jœ|\Û4\Ô}*t\\Ð±œ\n™qšõ\ã\ä©Š°ŠÔˆ»ºVâ·Š1“¢¥QÚˆÁ\ÅYU\Ån‘‹dG\å\Å7\Z{ðiI–\0äƒŠd\\ó\ïˆWB;kKaüs\îÇ¦\Ú\ä\ìÛ\êjÿ\0Ž.<\Ým#\ê!‹õ5‘bNG~µ\äc\ê³\é2\ÈÚ‚ó\Ô\Ý\ê´Á4–²\Ãs \Å\"¶Gny§ny¡€e \ã¹c{žœ’h÷Tep¬§!€#ñ«h¸¬\\\Z\Í\É\ËöŸªœWBµôT¥x§\ÝZ•%Í¢Uà ž\Ô\Ð8\ÅH9¡š\"t\'€y¯”¾#\ë-ª\ëò\Å\æŠ\Ô\ìE\ìs_Gø«X\Z&‹uwœ2¡	\îÇ¥|uq)žy$nK¹$ú“\Íy9KòÁz³\íøKyU\ÅIiv½J‰’rG|\nÔ»w–m\ì,Av\Þ\ÓI–RƒsH½iš¤\rgw\å\ä\á¢GÇ±\å\Ú\Ç\Ýis³øu©Í¤\ëQ¾È¹a¾Û¾é¯ª|E§\Êþ\\Ã¡\Úu\äWØ¾¿þ\Ô\Ñ,/Y R\ß^õ\íe•t•?š>Œ0iN–)/Šð—æŽ„7­;u0`c4\Ù\nö‘ð„…»Uy\ÇË¸ñ·­FeÚ¥‰ÂŽ¤ö¬mR[m\"VS“2\ìBv¬\ç.H9vW.œJ‘ŠÝ´Ž\nþ\ì\Þ^\Í>~R\Ä\'û¢ª©\â«\ïBŒ`Sþ¯™©7)6÷lûj4\Ô!­’C\ä\Æ1šÁ³¬üE§\Ê\åU‰=wñ[2\î\Û\År:Š”e}\Ä•?Cš\Î.\ÒE\ÔW‹]\Ñô:\ç4®\Ä\n‚.cV\Ê­=\Ï\í^ñ>bÖ™\ãŸ5S•¦œ\rÄ…\ØûG^I§2\Úhš\Í\Û\à¼\ê¶Éžü\å±]ŸÅ‹¸d×­ `·ù±\Ó\ç\æ¼\ê\îDþËµ€HO\Îò2ž9<\nðñõ¤~’PP\Ê\èinoyü\Ù\êŸ	v\rA\ç\ÏBG¶1^¼ÇŠñÏ„ör¢\êWE†\Ç\Ù\ãœ×®M,P¦\é(õ5ß†_¹‰ñ™óK3¯g}W\ä+ž)ŒqUMõ®2&þúQµN|œ{\Öö<^d[v\ëU\Ëd\ÕVÔ¬ñ\Ä\Êj(/ ¸‘\Ö7S­¹x¾´\Ç\â‘\Zsò¤Lu ô¦©\àPi±¢8lT-\ëS\ÉUßŒ\Ö-š¢…\É5ò\çŠeYüA¨2œ8ËŠúvöO.\'rqµþB¾L¾˜\ÜO4\Ù\å\äf\Ï\ãšò1š\É#\ì8r\ZÖŸd‘\ê¿lü»‹£ÿ\0-¥\Ú>‹X^+-¿v0~uFü¯Bðm·‘\áû5þü{óþ÷5\Äø\î#³‡¤¶\Ø?U5„• Ž¬5n|Ò­\Þü\É|Ž*\ÇK—Y\Õcµ‰¶\ï\ê\ÝvÞ½NøjÖ®K\ê’\ì\'$\"\'\Ó&´|¢ùÍ¨J€=À_²õ\ë\Ò\0â¶£OD\ÙÁ›fu¥N”½\È\èü\Ù\Ë\éþÒ¬%óRóÌŽw5u@ \0iÙ®£\ç¥&Øœfª\Üg)õ«˜\ïUnAÀö4™#\Å¦¯AN\ÅK\Zc\é3IÔšµg#XžyñP\éeFm\Ã`s\Øu¯/»¶O³¶d²’\ç\Ô\Ö\×\Ä³q\â Q\Ä(\âÆ©4?m`+\Äp³¹®\ZŽòg\Ûe”•>ò÷Ÿ\Ì\áœ\ÍKmóÎ±@7Hü \ÍUó2G\Ðxt\ãZ\Óñœyëš•¹\ß7jr}¢Ù¡ YK²±\ÝB\Ñ< ¾\×\àþµ\Úx˜³Šd\\üÿ\0>:~5\ê2i¶wh±+\ã¡\Ç\"¸F4\ëq‘µùÀ®—X3\ãªb\åŠ\Ä\ÆV³J\Ö<ñ­\Ò|H§\rý\ê\Ø\Ó\ãùJÉ‚ã¸®b\Þ+«+°…Ì;¾\Ü\×m@\Ú\â‘\Ýu\\*	\àßj\âóO)¸T£‘–)ø\çð§,¦\'†e\á’U`\ZÚ¸·\r\ÔV\Ô,‘¸^¸8§\Ìf´=öóû\Ê\r\\\è+Ÿðü¦}.\Í\Ï_%søWEÁ\é\Å\Ý#Áš´š+\ÈNx4\Ü\ã½:\\)¨÷\nddâœµ&ž1Ipz\Ô-\Çœ\\\ÔDðI¨fˆ\çüEwöM*\îOHˆS_51.}Ku¯_ø‰«ˆ ŠÁO2ü\ï\ìA^Gn»®b\Ï\ïù\×=Gv}vOE\ÓÂ¹µñ»ŸK\èv\Æ\ßNµû 8¯)ø…n-õ\ëÁž!»·\"½®\ÍÀ¿\îŠ\ã<C£C«j\Ð\Ë& ˆ\ï_~\ÕN7‰\æ\á+¨b\å)=5\Ï,¾Ô›R°²´•H’w1\ïU¬	·»µ\Ë`¤\Éü\è1‰/.;v\Û\ì\é[^²û~±²nH¾v¥}YB	\É\è”[=ªce5`9ç¸¬ Š£€1šD9W\âº\Ò?;žŒ\Ö\'uF\ÌdU\î\æ2ª2§¸\íW\0\æ¨É²jš\Ü|Æ…NM¶\ã-I…\ÍiÝ…E»¥V\â‘HF\ã\ë\\·Š\0}\ïý\ßJ\éÝ€\Çø¾S68,@õ•M™Ù„W­ñ#\Èüt,µ\Õ.À}\Ç5\í·2ùv’¾x±¯²³’\â\æ\Ù#ó†þ\î9\Íz\î¨|\Z\ä³s\åb°G­Šui÷g›øZ\×\ízü²žD|“\îM{¤*Šò\ß\Ú6\Ù\ç\Çú\Ç#ŸjõU\àS¦Ž,|ùª\ÛùU„=)¬\Ü\nF\'õ¯ñ—ˆ\ït\ÍA\Ò9fr9\æº<ø¥\'kžÀ$\ÆsMó+\çKOˆ:ø5\Ðnµ«ÄP¾``:\Òi?T®š=Ñ¤>¢¡/ž¯\â\\\ìF\ëD\é\Ó5	øŸp‹D\É8\Ò!\áªyÐ¦@yÁ«\0\× x©õ§th{0rG5\Ô\É~‘¤\Z´®sÔŒ©»3]qƒŠ\àU{w%y\ÏJ‘Ú‹¤#b›\0\Üyü9‡\Êj|«O¡Qzœ¯ŽM\É\ÃWà©¦ \È\Çbqõ\è6\ÃiÈ¾¯Þ¸-{\ÈUy\Ú\Ù\â¹\ä½ó\è0\é<¯\æ{\'˜ r\àS\r\Äø\×Þ¹¸OLðr9\Î1Y¶3£[ƒ¦Eu\Æ7G\ÎUšŒŽ’óUv\Ä2}ëŸ¼™\ï¶\ï=ci\ÅG5Âª\ä÷ô¨3r!i,Œò+T’9\\›:»U($\ã¦žk\Çtm_P¾\×ð\èA\ï\é^\ÅH\'#œVsV4‹/\Ç\ÊS(n;{T°éŠ²¬ªc³ÞÞ˜\Î)G•\"‡QIš\r¸‡TqS\äcÞ¢e‚‘\ä¾;wó€\Û\Æ;ûW‘\È\Ùcõ¯}ñ†š×¶†H\×\çŒ\Zðˆ\Ù%\är­Q$}>_R2Ã¤ž¨\ë|/¬®œû7,\Æ+\Ô$Ô­n\áe\ç¤m\ÇZòo°ŽVm\é€~\ës\Çc^•\æ A”^{Ž\ÕPW<\Ì\Æ\\µ\'\Õ#0]¸1Á¯Gð¥ó]\Û*7T\Â\ç\ÜW7\â;…À\È\ÜC\àû\Ï&õ£9\0ƒJÜ¬ª“Ž#\ßTl‰²£­®B\î³\íd¸­(½\rQ\ã\"\î\ëR•Á&£\ÆÎƒ&sÖ€È¤\nF9£8äŽ´\íÛ€\'µ!‰ŒZUR¿7J@¾?­*Ô”:³µ\Ïj\ê:¿´°y& ¸L…‡š‹±—§Zx\Ô\çÒ¶†\îü\n‰\0c\Ç4ö^„ŒP9N\å›È­ó»<\Ö|ººm\àþuWT¶¹’LÆ…‡z\Ïû-\Îm\íÈ­F\\\Íš\ì¯w…8\ã×Ž\ß`Jù\Ç¨5\íWšy†\ÖW™±…ükÁõ´ûc\åK`ñ¡«\å;°\Õ\ÜU˜©¹pA9V\Ä7r]\Äm\ä#´Õ…®\ä$Œô&€zœu©J\Çl¥£[\ÓZ\ÚQ†R½\ë\rc\ÉùFMn\ê<±\íòû\Z©k‡$dŒWT‡…ˆ‚Rv(l’,6±\éÒ½;N¹“YÓƒ€¦X\Èq\Ðú\ã\é\\9…_–\Æ:7­ŸÝ;R‰ËŽ60\Î?S8\ÝB§³ž»3§µºž\Â\ã|lw{ýk¤>,¼¹	ˆ\ÕJô \Ö\äþ±Ô \Äûd\ÚGLÆ¸K‹g9\\0W#½r¸«ž\Ý)\ÆH½<·º¬ûKI>•\Ã\ëö†\Õöc &º«\retÀÒº•\é\ÜW%«\ß&¡#Lžp;[SŽ¦©¥‰Þ­\È$Ö¾©I¦Ü¡,\ÞW9ª‡ùºœ\ëÒ¡dM¸WC\Ñ\ãsµ+ž\Ëgª\Øj£Jp0\î\rG©\ê\ÐY®\×=\Îy\æZW’®¢W\Û\È\É\éŠ\Ö\Ôb³•~I\Æv\àÞ°öJ\æ¿Z—)n\ê\äH†BA\ß÷X6s\Øý+”ºen\Üœgð # \ÈñŒ\Ñ9B7œ/\æÂµŒR9§QÌ ‹˜Ù²£\äR`n\ìXñ\íH\n„\É\é›\É\É^‡ ü+TŒŽƒB¹h®¼°\Ø1Ó’k\èM9\Ã\ØB@8\Ûß½|\Ãa/‘v„œšú?@™$\Ò\Ók\0ú\æ¢b§ñü·¬~h\á,;+²„\r v8®N\ÅO\È3\ØWZ ,{&»\è¢qC\àÿ\0‰h¾ñž¨\ãý¡€\íÀ®Gû>\à\á|³»\Þk\î³\ëwó÷r{óYÁ·0<’\ÜJö¡ƒŒ¢›g\ÇV\ÌjBm%Õœ“X]\Éú\ÕV†s»+Ò»¹0H\Ê0\05[´«…ŒGe\ÍLð)lÈ†i\'º8ˆ˜\Ç/LW\Ð~¾Šm=x\Êú\æ¼oQ\Ò^\Üº`gžÂ²\íµ­ON[Í°w\Çj\ã¹•™\êRš¯\Ñö%´Ñ9ü3Z‰\"u¯”´‰:µ‹º:\É<\Z\ï!ø¿¤*\ÛÍ¿ÓŠµZ=Í½”û\ìdQ\éH]}|ñqñ©ˆ´òx\Ï/X·uv9†\Òny9j~\Ò/¨ýŒûL<ˆzpOAUf\Ô\ß9|\ë\Å|¹/\Ä\Ï\Þó±¦H\Î\Ô\Ær:¦½\âK•?i¼¸~£\ænýi{DR¥+Ÿa7‰ ‹ýc(÷\Ü1Q\è@ó}>„\×\Ä\"ö\än\Ìò‘\ß\æ4¢\à¿%\Ï\'£Úšª¹öF£ñA°B\ßjŽV•Cš\ã\î~-\é\å\Ø\äÇ²\×\Í\ÑN#\Ïðóš¼·«œ\'\ÍÞ—µÃ\æ·ñY½v\ZtLž\ZómKÄº\Å\Ø\Ù%ä£ƒ•W UiT“—ŸƒŒ\â²\îJ/\Ü\æ¢Sl\ÖbºK+H„–-\îMS\Ìl\Ôø%H\rô¨\n€x\'²¹Ð‘òÍ‚=°;\Ñ,z\Ò3\ì\rJ†š§n…]08ô\í^\Å\à9¤‹P…Tñ¸f¼nÙ›#osšö?þÒ‡Ž+h >¿³$\Ä	\ëV&A¶ª\Ø\Â3Z\ró\n\è8^\åH$\Ú\ÛqZ ŒVOI3œf¬y›TóRö.\nò)kº‚\ØX\É)<…8¯\0ûÔ®¥»»bC’z\×e\âýfk«Ád ùhrþõ\Ç\\\ß! \Zò1Rç—’?C\Èp_WÃª{õ5ù\æª\Ñ#2FªñI¤Z<\Ò\ä\Öe\Ì\Þl¤ž¹\æº\ïnˆ&HS\'š0”ùª££9\Äû$õÕ«#¬Ñ´b\ÙvÝ– \àŽÕ¿y¦ùBC–cÖºM*\"¦\nT·Bo œ/-_CùmV\å6\Ì_	\é\é¢W!°¹é²£˜ø\êsþˆ€\Ò»ßŠ\ê©6TWºay’¯§ŠwñŠ\×1«uZ­-¤ly™šó#\ã\røS\ã\Çó©N‹9\äS\Å\nÂ¸÷¤4N§Š°‡¥@ Õ¤\Æ1RR0Eg^œ#V†JÌ¾;PŽ8Vs\Ñ\Z\Ãt|\ãñ\Òw»Že\\…CžØ®\Ë[º²†xc\ç\Ì\\\éŸJô\Z\Ü\Þ\ê\Z£Y£lŒcñ®&ó\Ã÷\ÚryÒ„1† \æ¾j²n¤š\Ú\ç\é\Ù\\c(ÔµùUi\Ôuy•#©c\Çzú\Âþ³\ÒR9¦E’\ã\É\èµÀx\î\ÝnU%“pc^õŠÀWv7k]ž6{Ž\ÄÆ££\Ët\êXh\éL|cƒM’eU<\å9\ç­z(ù6\Éh\É	¹‹4	ƒ\à`\Ò$‘›’j}ie¹\'ŒËŠ’ˆÂƒXúœPŒ¸\Óõ+Ö…N\É\àW$ %Œ³>?ˆžôÙ¤n\Ö\èaTŒ\â®C\0U\r6Ky\Ãy`Œ¦¶ƒ+;\ZF$F{W3©iš…òùq\Ü,Q“\È\Ç5\Ø75.\ÚË˜\ÙA3‚´ð&•¾}\Æû‰½[§\å]ZU•¼!…P\ØV\ÎF*)œŸ6æŠŽ\Úc¨£\é÷¤cçŠ¡$¥›\"»YýªÝ»2\ä­p\n\ç\Ë\Úÿ\0}x5\ä\â#\Ë&{˜Jœ\ÐE\èY‹U£À\ÍQ·$µ^/\\‡¤ˆX\â¨O!\ÍZ‘\Ñ5Ÿo¨]$)üG“\è(Jâ”’Fß‡¬Œ\Ò5Ó•I\îk³\Æ*µ¼\ÚÂ‘F0¨0*mÙ®¸«#É«>y¶¦¤\ÍFO4\\\È	\Æ(\Ï	lv¨·óE\År\Æ{S˜d\Z®\æ¬•hE ¸&•[?J‘Á\rŸ~µ1W¦W9#Ž•\åZt\Ö:”\ì\ì¬%%†:×¤\ëWrZ\Ø\Ë,C+\ÊV\îI¥’Yd,\Í\Îk\n§½“\ÆM\ÊKm™\Ék[£·¢qY€{\ÔÓ±y\\ž\îj0¿8\ëY#\é\ÕøN\Ø\Üj¶\ãÃƒ_TY·5ó\çÃ«#6¤\Òc„Sœ\×\Ñ6K¶?JõpQ÷[\îÏ“Ïª\'ZþX—zŠ.qJ¢œV\Åz±GÌ¶N‹\ÅX\0šbU•^õ¼Q„™$I\ëS\ÒF*VÂŠ\Õ#&Tuf=)–\Ðya†9\ÍX‹\æbj\ÐLh²$ð…þÞ»vðÃ·j=1Có]×Žô\'‘R·B\ÒD?z£ºWœ\Ø\ÝGžrr¬+\È\Å\Ój£o©ô¹uhÎŠKu¡\Ó\Ï}·Ž*+vI­”©\ÝVD¹®\æ¢\Ý¬Dn\Â\×$V§ªÚ±\ê¾Pº5¸¯ü\ë­\0W\à¢dÐ¡r0Gd÷\\ðk²\\w¯ ¡ü(…#‹ÿ\0x©þ6H\0§œcŠoAT¯¯¤³·DRÂ´“²3¥9\Æ1Wm¤ø««\Û\È4¸O\Ë\0\ß/=Û ¯\"´³û]\ëDÈ –÷\Åt\Ú\Ý\Ä\Ó^\Ïq1Ì‡%¹\ïU´T\Ùkq;œ¼‡ÊŒW\ÏU~Ö£“\ê\Ï×²ü<pX*Tcöc«\î\Þ\ä7ö\ä%¼yÂœ\03[¿´Æ²\Ô,_\Ù\'OU\à\Õ\àY5Kaó$JG¹jõ¿ŠZ3\\h0\Þ*œ\ÙJÿ\0º\Ãi§\Z|ô\æ\×Kb1‹Ž\ÂSnÊ«’gÏšx\çkps_Hø/\\¶\Ò|kutN\ÅyW\è\ÕóBgBa\Å}\á\Ë_ø¡!\ÉYJ\È\ä+t?6k³*W¯ò<ž2•²¤úûTt\ãÇšcEùn·r*\Ïü%k‡}œŽùYø¸F(\Öhmw	\î\Ça]®*[\é\áDa\ç¾™\Â1?&Y\Ïvsz´\ÚÖ©%\ÌþM»˜b\ã#§\Ìzš‚\ê\ëÎ²²€eV%\éÛŽnM\×Cd’J“\Ï\Ì:e.\Øðµ\å\ã\ä\ãN\Ý\Ïo)‚ng¼Hø$‘J¤…ªq°\åÓ¡\Éa÷JG \×Ï»\Üú\èµaÅŽ\Ó\\\å\ìmv\ì‡@9¸®x\Øk2\Ù3\ë‘\Ñp*z”z¾4“hz{¿\Þkt\Ï\áZr`.Mdxl©\ÐtüsûúUR\äZ\Ø\ÜÏœyp»~B½e+RO\É:\à\åˆq[¹\Øù?\Å÷£Pñ.¥p	*g*¹ôN+˜v$u\ÍZ\Ë\ÝÍž­+ò}K\Z\ã\Ù+\êHü«Ã“\æ“g\ë´)ª4!Mm¥÷#\Ý>‚4[¼÷¹\ëøVÏŒ\Ìmgl’À\ÓºA„8<sš£ð\Â=¾sŽZ\æL\×m{§ý¯\Ë#\ç‘^\Æ\ZÊœ=Ë³\ë\Ë1\Å[ù\Ï ²Š\ÈIx\Â\Úe;ú’yªSÚ™\'wŽY2z´š\n\ã+\Ëg¥b\É\á\ë€ä‰“Úº\\‘\àû9œf•¦‹4¤šFÁ9v\Ítúƒyxª£(V’\è\åSæ—ŸaSi\Út62\Êñ\î-1Ì„÷¨m3X¦ÁA«‘P‰*|dR[\ZŒŒñNj…\ï#Þ¦$TŒºj³\â¬5UqÁ¬¥\Ô\Ö&´@°º$\ã÷/ü«\åK_Ox¶q…¨H8Å»\×\Ì(	~;‘Ö¼ŒWÆ½¸\á\Õl5W\ÞhúO\Ã\Åe³ø-q~7²ûv±£[òL\ÎTý3“]§‡\"ij?t§ó—©¡›ÅšJ\ãý\\3;~<\nM^+\äy”\êû<eY.žÑ£­¶… ‚8\Ô\0\0\0\ìY4ÁÒ†\'85\Óxó“c\Ç\Ì\ä\Òh\ÍQˆþ1U§bH\ïS/SPMÖ“\ÄN\0©ª¿52óPÆ˜\êd¬@8ô§\âªÝ¿—Ž…þC5œö6§«Hù»Z¸k\ß\Ý6\åäªŸ§z\ìü?k$šf©¨8?4n‘û„\ç±=ñ`	ie%q\ê\æ½ö\ßN[]ÙŽ6\Û2Ÿ©Ä•Ï´\ÅWXz4 ·m/’>jqŒq[žVmvÀzÎµŠýÇ¹âºŸG¿\ÄV=Àf\'ò¡-Q\Û^V\Ã\Õ\Ü‘ô\Ôc\nµsž$\Ðmõ\ËTG%$·E \ê„\×K\ÈJIrš\î\å¼lÏ€\ç”\'Ìšgi\ì\ï\Þ\Öñe¡\ìÃ³\n\Ñq]×‰´\ä¼\ÓËˆ“FFÒ£\æ¼\×Ìº³¸6÷hQŠ\îB{­pU§\Ê\Ï_ˆUcw£\ìk\Æùö«€n”¤\Ç\ãW\àl\äzV]\Ç\É9¬{ˆ‡\Ì1Ú·\Ç\Í\Ç5vŸ)¡	«£²ðl»ô˜“¼”þ|We\Æ+Ë¼za\Ô.\ì\Ü\ãxY\ß\ZôÀ\Õ\è\Òw‚<,T9kHI†EU&¬\Èr=jŠ¶sæ—š0)7`R1MUžEŽ6b\Ø\n	?AVMq>2\ÕM†“(R\Íûµüzš†Îœ=)V«\nk\í4×µ\ÔuK‰û\ÂýT³…\ÅÍ¹Ûœ\Í\ÏF´\ÜÊ±F†Gc\Ðu5\ìžðl¼w—\Ã\ç\\²\Ö*.LûJøŠ*\n\í++F=Y\é6ªD*N9A\í!Ži¥Aƒ/Þ­uPÀª³€[ž\Õ\Óc\â]V¥{Ÿ:\\\Åtš•Å¼p¼’	Yv^•\á?\ÜÙ¤\ÓÜ¯—,˜\Îpwb\Ê\Ø9D›\ÏVÀ\ÍLª€)Bgv77©ˆ£\ì£T\Ò\æó2¦°¯\É\'5\\\Ã4yó=\Æ+v¡s[žf\r›4³¾	\Âô\Íj±ù\é\á@æŠb;)±žEkŸ,\Z\'\ÉRilPª\09¤À°\Ù$S\Õû´¬„\Ó@\'Þ¤±ù×Ÿx\æ\åbŠ\Þ;U›9\íšô*å•­ôm\ÄH\è\Ã0È¬æ¹‘Õ…ª©TŒÚ½Ž3\Â\Ö\á­üò£\ç<P)|c9ƒLØ½]±]tPZD\"ˆP8µp>+óg\Ôì­—œ¸9ô\ç5‹VG}:¾\ß\Ï\Ós©ð½³\Ó\ãŒª\çÞºª¡gŽ\ìE_\Å\\QÁZnr“\î\È\Ü\Ç5\ä\Þ.ð–µªM<\ÖR\Ãó(\n\Ç úû×­u¦c5ª9y¬|\Ð\Þñlw\épK‚Q—š\æotm^	Í Ý¡\Æ>E$~b¾¸( \Ô-\Zej¾±;Xù$|\Ö¨\Ã \åj£³\Ë2”³¼—¸E}‰\ä \ÉÚ¿•EöxAû‹@þ³+a\à}/\ì‘\É1ŽT2\Ãõ\Þ6\Za‘\ÐV”\È6p1Y©ƒ/ñBF*9»³r\×;u§\ÊG«\Ût©da\Ó9 ¯\Ó8¨b§n)\Î@‚“\Ô\â¼`I°ˆH\rY>³%\äŽYˆ®\Öü\Ûy\'\0¡À\Ã{\Ó4ø Ž0cM£Ò£“Þ¹Þ±n8ob–\ïr=_DƒZ¶òfwAþ\ÍEm\á\ËKh\îÀNMt+R\ßÖ´»G›;6eÅ¤\Ù\Ã\ÈAœõ\Ådkó\Ågd\ç\r\Ç5\Ô;akÈ¾#k>M²ÛŒ†95IÝ™´‘\ÇhÚ¬#\ÄB0\à\ïR ^ýo‚¼`Œ\nù#Ã·<Ek#a÷61õ\é_YX:›d\ã\æˆR¼`¸&§ÛžžØª\á_ÃŠ°Œkt;\Û4˜\0þ4A6£›\ÐFx\Í! w9Zfp¾ô¸\Í4ƒ¶‚‘FtnSÐƒÁ¯ñf˜l\ïœ\í8\'#>ºWÐ†1†\æ¼÷\Æ\ÖK= “ô©’=,wNª]%¡\Éx7O¶»ü\Äku®\î\ãBŠhŠ$s\È\ë\\‚IG•9\Èjõ!Â“Žh„¯]œø^\â$•\è:0\àc\Åp¶V\æ\Ë\\01“\ÓÛŠ÷	ƒ:½¯!ñ\r›\é÷\ât\ÏPsU#<,\ï\Í÷GªX>I\íÀ­¥\ã \í\\^‡¨-\ÒG \È¹ük³V\Èü)£’~\ìš,)\Îr)Ü‚*cŸZ›s\éHI’“ø\æ˜B\ã©‡µ<t\ëI€\Þ@\ÇZQÖ˜_ižÿ\0\ãRf¤¤\ÉP\Øa†šœ\n“\0\Ð@ÁÀ\éŠk`p=J0æ«¹\Ï\Æ9	±@\îj	Gö©‚€*\Ñ\É\ÍZ&\ç!\â¹zksƒ\Å|\Çr\Ï%\Ãs¸ŸN˜¯¢<m9Ž\Ão\Ôó\ì+æ·»’\Î\í$\ÆJŒ÷®ˆ+’\æâ‹±ýª-\ä¹\äm?h)ó@88\Æ:cŠ\ê,<o¥º¯Ÿh\ê\Ã\0•šMCW\Ðõ\Ín\Z6þ\éN\'UC¾º]ôe`:Â²‘Š\ã‚k­¸X¤Bª\à’1\×Ú°\Ú\Ò\Ø\ä	B\àž\ÙüiÄŠ\í6\ÊÁ”rOù\ïS˜£)vž\ÄVŒzm¬H»\08Á=D\Ö\é*»Œu5G\í~¾:Z\êœ\ç9ü}\ë\Ôfcq&vžHÁ•\á×‚+¨³q\Ïÿ\0…\\“s±~y8\ç½`\ã©\ìa]\Òg7©Ÿ‘\È88\ä\ãµql\Ù=\ÛjiÁlŒð\0\ÇZ\ãNÀü.{\íýqZ\ÓF8×©‘\æ¸\n{œu×±»Bw¡aŽ¹÷\ì*À##Œy\ç\×Ò‰\î§6Fô\ë\Çj\ÔòX\Øô\ÛÀ0>\Ì\í,z\Ò{´Cº	†Jõ&ºM3Å“\ÛG\åIe?\Ä\ZµfñT3\ÂÊ¶ù#õ\Å3»<ý£¹\ç¸\Ç@T\ãµVa°œƒ†\ä\×p|GŠ(ö0Ú¿0\Ær=\ëR\Ô-n•ˆ«zOñ4$3x\Ã‘Ž:\n‰²¥H\çrž@\ÇsýWm\ÈGcùñTU‡\ã•\Æ8\Å{/\Ã\Û\à-®`ò68sž„\â¼d\ç\0zô&½\á\Å\àM^xNJ=¹\ã\Î\ÓY\ÏfTV§\ê5ŽŽº\Æ	a3gbs\ì8\ïX\Öqƒ(óPø\Ò\ä\ÚxOUp\Ø\Ûg&\Ó\îF+Ñ§¢9+j|™z\Þ\ZK‰Œš–ý\ÎIŒòMB5Ÿ\n\Ûp‘\ÜJ3\×¯.´¹œ\ãÛ°«AŠ›8\ÇO¯j\îú\ì\Ò\Ò\Ç\ÎK/¦\åvz$¾1\Òb?¹\ÓF7<\Ö\\¾=¾PD–\È\0#’s\\l˜a»§ªv\È\ã#5”±u_\Ú*\nû&\Íÿ\0Š5«\ä\ÄÎ9\à-r\ìù,\Ù>ù,¬6ó‘\ê*§\Ìr[§\é\\ò›“»w;©R…5h¤„r¯œŸ›T†\ç<T².3Þ£ŽvŽ©&uDn:^Ô™ `\ÇJsŽ3\ÛÚ¢?t“Æš¹©m/\'…G#6K©\îIód\Î¨¹1œâ©«±ÓœŠ°²\Ë|\Ø4¹\rÛ­4–Œ\ã\0\ÓF@\È\â¦\å\"\æ\ån8õ&˜ÛË¸œ\Ô\\+qùQ‚piÁ°¿SÁ==\è\ØG,\0ü\èO=)¬Í‚A\èG_zb<tªÄ’¦¥‘FOz\Ô\\Œæ€±/\Æ3N\Ø\Ý8\ÂÑœóSŒ…‰<fš%¾r8õ\ë‘^\Ñð\é7jp\ç\ç\í^7\nŽ6÷5\í¿\r\â-¨Áò÷­ Ö¶jK\Ïj¼˜\ê{Vu£ƒƒõ«¡¹\ëô®ƒ\îAs\á\Ç5Ÿ\Ý\çÚ¯L2‡<\â³\Æ6ºûTKb\é|hó-b7sH¯:\ÖT þB½+]\";\Ç\'¡\æZ\íÀg\n¸Ö¼z«\ßg\êt¿\Ùi?\î#\n\Ò\×Ï¸‚A5\ÐMr,¯ †2YF;U]¼ó½>´ø“\Ýý¡Ê¬{\Î\Ä#¯­z˜\nICšÛŸÄ¸\ÙTÄªJZE~,õM+VS	\Ï\0-iF)v\'Z\çí™’ÜŸ(\Äc§M²^D¦F\0\â½+Y+¼]Ñ¢a\â\ÖÀ\âª\Ú(Ž\Þ4\0\rª*\ÏjÁ³ 	¨\Øûfži§¦jnqP“Œ\â¥\'4 \çš5`H‹\È\ÅM‘\ÍE¹Pd\Ö£¯[\ÚeW\ç~\Ê(\å%\ÍD\èwVmôŠ#<\×7ˆµŒ2m…3\Î}(–ò72\Ì\ÒqƒzÎªj&\Øy©\ÉK\â	¢M}Ë¶T	\ÍP×µK+‹smnw’:v\0V\'Œ\Z³m\ÝÒ°¬\í\î&¸\ÎN\Üb¾z×”—™ú]*4$\ßÙ‰­¥Ü˜.)#‘Ï½}\áýUu<e¾t\Æk\æVV†b§‚\rzg…u9-\îŸ•ø?m…Ÿ$\ìödf\ØEŠ\ÃsE\'(\êh\ä\0Kn=…(!G½g\ÅÃ€}}ûU‘­Õ¸5\éŸ%fY´	78\ç¥F¶\ê$ŸZ~\ÄS*[\"Ä¥Éª\Ò?\Zºš¥;¤Æ¦\ã±\Êk7œ‹‚y\éYR\ÜK<\ËÇˆ‡\ëM\Õ\î\î`»R”\'¨üôž,n\n\Ø\äRlˆ«³¤„F…Djª1Ž*\à\ÍsšDaI>an8\É\é]	<t¬&õ:b‡«sÖ¥\'5lP\Z±l\Õ!À\0\ÜR4\Î\r/l\Ò)š„Jñ6k\È\ïbòµ	‘z\nõ»\ç\Äg¼’\ê@Ú„\ç9ù«\Ï\Æ=Kw)\íWƒVN{UxG\ÍI,¡F}«\Æ\Æ]Ïš\ÇËIf8»-I\Z|œfw_œú{\n© X™®¤\ÇpŸ\ã]S€µ\ÓN\Z\\óñµqDGQ\Zs5DM[G\Ç\ZŒ‘Uå½¶ˆe¦P>µ“q®Z\Ç\Âns\ì(QlNhÐžM½\rVIò\ÛCGP+”\Ô5»„,;ú\Óô£†9\\nfvù˜÷ª\å²3S»;(\Î\ãWPƒY\Ðt\Í_ZwBKŒsTfBF\î\â´Ê†ª¾#\Â\æ&¥û\Û\ç\ä5\ãR¸ˆ³zõ½N\äCm>2~F¯&°„\ê7+jI9\ÎEeQ\\ú,šJ4\ê6ì®Ž]—–>üSn­-N²\Þ\Ï\Ãp=ª‚d}k}I4š=»áµ²­­Ä\Éí–ªEx\ïÃ¶S§\Èg¯b´e\Â×³ƒ_»‰ñ9Ì›\Å\Ô/„\Å8š”e©ÀW¦‘\à¶N‚®\"\ç­U‰N*\Ò+dd\Ë\n)“sÚ¤§°\È&µ±“©\Ø\Zl}*qÀ\äSH‘<…t9\ä Šñoxp\è—-ymm$b]Tgaÿ\0\n÷hÊ•TW\é222†R0TŽ¹©«F5agòf\Ô+N„ù£óG\Í0J\";£;¢<ðzWW¥\Åa¢L1\n@®¶ûÀº]\Ý\Æñ\æ[Ž\ë¯E\á6\ÖÝ¢¶F¾ü\å³^zÁMN\î\Ö=\íH:vWR7tˆ\Ê\ÒS…XÀÒ·\Ç5\ÉX­\ì1ùrO¿g\Ê	5¹³F£\Ì+ÓŠ²·dxòŸ4›\î\ÍL9®\Ç\×\ßcÒd\ròda]¸•r\rx÷Žg7zò[¶LpD¬>­\\¸©Z“ó\Ð÷2\n\Û1¤\ÞÐ¼\ß\Èò]G\å·HI–w\Î=J\Û\Ó\í™=\ë•E\Ï\âj;\ë6\Ô5+htË¹ö¯>l-.ee&¼k¥¹\è‘S\Â\ÇUñ¼œ¦R=’¾š¼²‡P°š\Þe\ßÑ”q\ìÂ¼\á’òþý\Ôü¨\"S\î\Ç&¾ŠŒb<W§ƒ¦½‹m|Lø^$\Å7˜F1vöPß¹ðÞ¥§Ë¤\êWr\Þ[L\Ñÿ\0\ß\'ƒùW\Ôþ	·K¿\é\ë\"ðñ\Ã\×&¼{â®öO}£[˜þ¥x5\ìÿ\0X·…´\Üñû£ü\ÍF>\Ï5\Ú\çg\â~·‘aj¿·(·\ëc¤·ðö“nþlpÆ­Œgi&¯p0}ªð\Å;Œr+\ÞM\Øü\ï‘\'¢1\îcŽ\Þ)M¨Mx6§i>§g%¤s˜Œ\Ç,\à9#ñ¯ uö³ \ê\È@5óó\Ü\Ék#A+2R‚¼\ì|[P=œ¦QŒªwÐ²\ë½ Aü*R¸Xm¹l)¹I1¼ð£8«\Åö›\Û(s\Ó)?E\æ¼w³è½¢H­s	\Þn\à\ÔvÒ¢Y^»´dÖž¨\Ã\íW\Å{;V|\êº~™Ì«›Kˆó$ƒ\'c\ï{RtÝºkÇ•6\ís¿ðx#Ã–\çWp\\;+?\âÑ´ðµóp‘}\æº\rTŸG²’3ò4#g\àWñb@ž„ü\×iüvT\\¸wþ‹\0•lÖŠ{:\Ëðg‡h,ú¢—X¡–CT\\ŠÀ-¹‰n\äŸÎº]<[\ë3\àf;ô.Àu®kc†\Ú;(\Íy6G\éñ•\å-v>ˆøh1\á”>³\Èk\Ð3^wð\Ñÿ\0â—#\éW \æ½ZÃ¡ù†tÿ\0\áKÿ\0_¤\0j‹U¹\ã“T\Üâ­žIô\é\ÅD\0È§3c\"£o¤‡qy\Þ*\\d\Ô-€Âž¦­\n\ä‰zsS\ä\ÍWœ±pZ¤\É\Å&4\Äc\ÅU“&§“¥@â²žÆ°zžw\ãùL>º\ÇÊ¯\æk\ç\ØÐ±rI¯sø“&\Í4\ì\×šò=\"\Ø\Ýjv°s\":ñ\ë\ëUŸ}’5O-s\Í\'÷Ci\Ñy6P \è± ý*²Û†Ö¤¹+’°\êsZ±§– ‚š,ŒÞ V\Ê\'\ÊJ«\æ“\ïrQCi;æ“¾+TŽi1sL¥4sLWƒP\Ê9©‡¢“ŸÎ¥ #\Í<\0¨…<\ZÍ L”\Z\ÊÖ›f—xzþ\á\ëDVŠehW®\ç“Î³Ÿ\ÂÎœ3½h‰I\à=-oõ7º‘I[`·ž•\î;NG^µ\Åø\nÀZhP».b\\\×w€°Œ}\Ó\Ô\Çb]LLµ\Ò:#\åMZ\ßìš•\Ü8û“¸ýs]O€#k\ÊÝ’¬¯Æ±ø‡P\0ðf\Ï\æ+¥øq	{»\É@\åj\"½\å\ê{øŠ¿ð)w¤¿\Þ` \Æ3\ÅNØªp“°~µcv@\Åw-‰lªÿ\0$œ\nò¯¬rjr/©\'Ò½fdÜ‡Ö¼k_³¼\Ôui ^$•\ÕO=k\Z\êñ^¦øI%Q¶úð:®•\å}¦=ñI‚’/<ZÝµ¹I”<M¸V‡Šm¤‘D\nó\Ý7PŽ;¹Bð\ä¡\ê+†piž¥:\ÊI3\ÑÀSTn\îF:ñŠ¤÷‘\Ã¨Mv®œ°\Æ{VvgG:\'°¿6š\îœ\Çø¤1¶g¯qG>\Õó-Ä’<ñ8ncue#±S[Z·Žõ{¹#K?ôtB‘\Éj\ê¥.Tp×¡*òM÷suhH “\ÍD¬s\Å|\ß4\×\ë>\é\î$•Á¬\Ìx\ï^ÿ\0auö‹H%\ÎCÆ§?…l\ÎJøWB“w¹¬¤Ò–\ÍF”¶3‘n2i4$¶ŽMx7Šµv\Öu±gÉ‹\å\\ûw®\ß\Ç:¬ÖE\ç\æa\è;WšlhÀ=‡Ö±¨úO“\á”c\íå»º‰\Þ|<Ò“l·n2Å‚¡=…{(P\Èøf\ÌYiðG´)\Æ\æÞº\à@µ8\Ú(ñóC­Šœ¯t—\ÈwcT\É\Î>µi\Û\åâ©Œ\çÖµ±\æ¹\çÒ™š7Ru4\Èlk7sOcQ’h!ˆsHG¥6GU4\Ð\Ä\ãšLDA©cH\Ç\éU‹\ç½?\ÍT\\–©-žj&\àŸz¥,òHN‡\Éæ¢\îî”‡\é\Í\"Òž\rAIŒa•úWœ>\ë\ß¾zD\0>\Õ\è\ì\ÛT“Ú¸\r\0}«R»»\Ç\ä\n‡¹\ÛB\\°œ»Dô8ASz\Ó\0JwST‘\Ç){Œ\ÓsJO\äõªFlkŠˆ)\ÍI\ÉñT\">@=\ÅG‚\rOHTP\"ŒÅºW.u[X®\Ú\0\ã\ÌS\Ìd\àýG­u¦\ã\Í|\Ã\ãË†\Öd¹\ä†E`/m\éM\ÇÓ–“\Äñ\åO2‘18\ëžMy/µ\ÝT…£¾\"‚·(ÏŸU¯X‡ \0ph¸ùYo…\ã*\\(¨š\î(÷np?\Z\ã5ýmð°\Ú?,\Ãu¨rŠ49I\ìts\éq\êJ<ü\áN@­(m’ÀG¦¼’\Û&\ìdW€zU¶\ïa\Üf\ã\×4SA¯;|¸<WŽ|L´Ylá”ŒÁ5\ëóa5\å¿Š®’	\'vü®kH-L¦ô>{\Ón\Z«—l\Ë×Žõö–\âK4e=W<W\ÅbGIƒ\î<8\äöÁ¯°¼3)’\ÂNwF¹>¼U\Ô\Ø\Â\Þ:¸‡\ÈZOb¨Ç±:gƒVÁ\0‚z\×1Ö‰\Å\'·z01Gû\Ò,oN”t\è:u§T[±@\ì) ý#dw g˜\ã¶h\rÎ¹_Á\çi’sÈ®˜±\Î\rg\ê^\Î}\ê\ØjdoF\\³‹\ì\Ï=ðm³G¹\Ë×¡œ\ÎzW3\áð<‚\Ã-‘]/$RŠ/.j‚¨ù³\éš\åµ\Ý(jQªŒ’°\í\ï]Xn*³ƒ¼ô5M\\\åSp³F5†˜,¡T¥tP0e¦”FNl\ÑF)’\äÛ».E=N;úsQ^)Q—8È©hi–~¿Ó ¦ƒ\È\Å\æ\'§ZL ¤$\ã\ÃÞŸ\Ç\áL,Á±Ž\æ¤©ò)ãš4ðsÈ Ÿ…Wnz3\ÍK“Ž)Œx\Î>´	‘ŒŒg©Œi\ìp1\ÎWf\Þp=jÐ:ñÂ‘l‡8\È95ó® ža\r\Ôó“ž¼÷¯£<|vX)Œ\çô¯œ%uŽVRN\ØW]-Œd\Ê1\Êa%[F=5lË¼nûcJŽh\ãvXa°O·½PY€|œ\àúœ\nÔ•+$[}ü€Xb³LŸ3ñ´\Ó#IÜ§À¦Y¾uÀ\ì=jlS›e¨¡sƒ\ÐV\ê*\äy|+Ÿ\rl\î<\äý*ô1\å±òò(±7,®\Ö\ãÓ€[‚MzŸ\n\Ïy\ät\Æ9\ë^b&o86w€}øú×ª\éR\ÄÖˆ\Ã\0m\ÉŽj$K4Ž_Ta2e†I\íÀ<\×	#\á@Á<tü1]ÿ\0ˆ%òó‘\ÓÒ¸o›%¹\ÜiÁŒw\ÜT%}†j¤Ž\Û\È\àü¾•9.\Üäƒ5U†0O\Ì\Z\ÕkP´›x\äq\åR±u]€c=y\èGopj™UF¢\ß!ñŽ1L\Ò3/ \àÿ\0#TŸ,GR\Øâ­»€S©\àg©,~\é\Ç\ç\ë\ïAIª3\Ô\ãŠR0~÷`¤òSœ•\'4(	aõ\Úh)³p\Ý\0\Åu¾v\Ä\ÖÍœ\0®\Üm®`\ÄFpzNG\Åkxd´> ²%Aý\î?CQ%£.;Ÿ¯\Zz“&qß­r_nš\ÛÀú–\Ò	p©bk°Ó€\ÚOzó/Ž7b	¤¬\×)\ß]\ëDyõžŒø\Ê\Èp\ÊIÀ\Íi’›JŽ8\Æ*¼q’Íœ€q\ÏøU°BžÆ‹žseIP§<U`”’:½\',C\n„\"÷a×¥MÄ™$|¶\à3Àª\æ.¸\àVœ«\æ7`0zúUw\ä`\àÿ\0…4‹3)F\ã\ß5’\ä\â¬\Ë\ÇB>¦«„\Æð*‘¼\ÈaÁüj\"=±N\çõ¦Ÿ¯¹þ¦¨\Ù\r\ÜO\à\Ô\æw\Û5),˜\Êñ’q\îi£y\Í;”DwtÀü\è±;qŠ~\0\Ï#€Ò”\Ú\Ëü©‰°§h\í\Ð\np\rŒm\Î) g®y¦fNŒ\Ù\Æ?ZM”J¡º\àb‘—¾1\Å\"ƒœf†\Ü\æ•À©)sÁ\0RÇ­H¬äœ’I\ÈÉ¦?\ÎvŽz\Õ	Œùr \n°\Îqœúv\ÅBcR1©\ÅL0:œÇ¯Òš$Ð´m\î\0úW\ÐmC^$˜\0\Ç\á_?\éñ\âP¹\Çó¯¨¾ÛªD\îA\'€+x n\Ñg½\ÂŒc©\"\í\rQAœT¯“[½Ž>¤­‚2p8¬Ë³Vª\á—Þ³¯7¨–Æ´—¾ñ´¬.”C÷‚\ç¼\Þ\â	\'¤\ìkÐµóFbqòœ\ÖN‹iý¡ªÄ eC\à×‘%\ÍV\Ý\Ùú6jŽ\rýšw9\rgB\Õt»X]4n78³Sh\í4—pDË¹c\Æ{Œ\×\Ò:†\í“\Â\ë•+\Ðþ•\æšW‡.t‹ó\0‹|lÿ\0\'¯z•£»›c\'*Ø™\Í\ë\Ì\Î\ËG\Ócº\n;‚k[MÒ¶_)t\0‚Zº{Eµ·DP\0\0t­\0€v¦\æÌ”RcüÖ“\ËB\Zc6”ŸZ›­\0Ñ…¬\ß\Ëkn\Í`\â¸\í3Åº„ÒªI\Zg8-žtž!ÿ\0IŽ2v\\\×\Ë\Òkó\Ùj70\å;d\É\Æj\ãkIËš\ÈúŠmR&‡t³r:ª\×¯k‘\Û)1m‡#\ï·&¸7VÕ¯\ã\Äq\ÃnÂ¦›\Ã\Ó\Ý\Çþ›;\Ê\Ù\è:b—·¥\r\ä\rˆ­ð\ÄÁŸ\Å\É#ºog`N9\ëAZVZ\Íõõ¨)ˆt\Ü\íÀ\ÅV>\Z–K\ÇQd\àœd× \Úx;L±²ó\îZY¤)¸\ä\à}\0®jØˆJ\Ç~Z‹”Z<__\æýX\Ê$%G\"¶4”„Û£¬%\Ý[ô5\Îj­\Ô\'(6¦\ï”{UûWÉ‚X÷…\Ü>µ\â\Ñw¨\ÏÐ±1tðP[Y\"Ïˆ\ÐGt€7/A\ëSø~v2„\Ö%\Í\ìwö\È\ÊIdbw«ºd˜\â‹Z£;p\ïŸC\éM.aqg\ëòýEhW\á{­†HXõ\äW\\OjïŒ®…\Çaý…y\Ç\ÏAù\ÅWŽÇ“O.H5Q\Ø\î¢\ç\ã\ß5Šœ\ÕVlñR\ä;nl ¸e\Ë\Üø}Ù²’`f»\\\æ«\È@\ÍC“\Z‰‰¥\é\íd§q\É=kX\Ó7šb\Örw5Š,†ƒM\'\ïz3Y3BL\Ó7Œ‘Aj‰Ž:TÜ£Z¸òm\Üú)5\ä±9,Xœ’s]\ïŠ\î¶\ÚŸ˜œb¼þ+\Ì\ÆNó·c\×ÀB\Ð\æ\î\Ëû\ÍØ¨‡aWtø|û¸“\Ä	®hj\Îù¾Us\Ñ4ø|‹H\Ó\Ð\Ô\Ó8\"p*)zW£²±\ãMÝ³–\Õ.¯*@Bó\É5’\ÉxÎ«4ùt´õAÑ¶;ôM-neh\Ê\Û\à`õ4\Ñ\Í+\ÜË‘\"ˆ¶òzóQ4¨§\0Žõ¬ú,²»3I³\ØsV\àÑ­#!Ÿ.}úf›šŒŽxZMtB\Ç\Îz±\n\è\í¬R\Ò\rŠK¤úš\ÔDDL*€aPÏœqY¹\\¸\ÆÄ&\0«À‘T\á\0\ì*\Öy¦Š%\Ï5‚¤ZB3T€É¹9\\ó\Í6\Þ\Æ\Ðt‰»¸&´™sÖ«¢˜\ÉA¤\Ò4„\å¹\á~2µ6ú\Ã\0ub¹U\í^“ñ\Ð¶Ÿ¾J×˜‚{cŠç¶¬û,\rOi…¦ü¬{§Ã†e}Á¯h´<\nðï†‡6÷\'“^\Ýhp>•\ëa¸”\Î?\Þ\ê\ZëƒŠx#5\nšxe\'\è¦xl¸˜À«ßŠ¤\ÍY\é[E™H´­VµMO2œ\ÖÉ™2È“*PÄƒ‘U³S\â©]·\'‘V\rT€\ÕÚ´&@p9ªsN#tš¾\ëÁ\"³\åe\Î\Çü\è`™œ\Ð\ÊÏ‚	«\ÊHm§ð¬›[1mzò%Yx­“†\Ç4®hˆ$Œ§Ìµâš­\ãjZ\Å\Äý~\Ñô^{tÏ¶		\ÏMxCZ\"Hù·É¯?þ}‡Ó=yµªQŠù“\é&\Ò[Ë³\ÆõUZ©\ãT\Òt\r*g¥\î7·N8ð¤w«^\"¸y­\ím:\É4\Êñ\â¸7V>\Çi¦z\ç\Ã]<\ÙxrÛ´\Ü#^\Õ\é\ëò¯Z\È\Ñ\í\r–›io\Æc…þµ`W­J<”â¼\Ìqõ\Þ#Z§óM´x/\Æ‰¯t¼6$œ{f½#À[…4À©<þ&¼w\â½Û¿‰\Ö\"NÔ³Lze‰¯jðŠH<+¤¦\í¤Z¯NÕ†ý\ê«=¬\Érðö=\çÁšÔ„m5L\î\ã’9«È¯Y=c\Û\î×›ø›B\Óm\íõMN4ûc\ÂÌ£\çe ¯B2v5F\ãGƒJiJ-wMÓš’\èÏž­\ï\çg•\ÊI\ä\×Q\á»o3\\’v\'\'»+2\r6Š·\ÓG1”²Ñ£õj\ß\Â=«£ðtn\æö\á\ÇÌ¬‰ýk\ÉTk$}\Ö\ãS\r&ŸKöµ¶9¯‡£¸\â½/K³H´›8]UÀC85\å:´—þ\é\Z<©ºÚ­ë–¯j…\nD‰º fª”=ù‘Š©ûšI0TUMˆ \Ð\Õ\å¿ÔŸ\Ã\Ôb\é‘¯R$b¼¿\âŽO†wr]Eœz\ZX”½Œý\rriÂ–\ßþ^#Ç´|\'„õò3½\ç¶B\Ù\Í`´¤»|´cA[–7<7*€›ª\Æ	¨D&¨Æ…¢»ôws\Åx\Ö?NƒjSó‘\ëÿ\0\rÁ_\n\Ã\ïq1w\Û\È\Åx\n?/\Âzwûa\Ûój\ì€\Ízt´§CóL\Ú\\Ù†%ÿ\0\Ó\ÙHxªnr1S±â«µS<\â\ïP\'úÁJ\Í\×)«Á¤\ÝÁ©EBÝªN˜­®A1#4\èÜ‘M—EEc\"†	–$#M\Û\0\Ô\íÉª³t&±–Æ°\ÜòO‰2„°L¬\ä}s²:Ô·~[tý[¥Yø‰q¿YŠ x†Ç»WS\à/³h\Æf]¯q!sŸAÀ¯&\Ü\Õ\Ùöž\Ñ\ár8.³Vÿ\0ÀŽ÷§\Ó\Å(¤?Z\éHùy0&\ã4{Szš¢\Îh¤4¢˜›ð:TLz\ÓóL#Š†+‘\ZNô\ìqM\Æ\r@“\rfk6gQ\Ò\îmTeB \Z\Ð\È4õ\ÅD•\Ía7š\Ýtû_±\ÙÁ\0ò\ãU\ã\ØU\ÓÒ”\0(a\ëPÕ‘¯;”®ÏŸ~ \ÛùZ\é<bE·~.SS\ã£\Çü«#\â/:\èô1+¤øe	7’@iÀú\í\Ï\âMZ_ð\Þ1GªE\ÆEKœTc¥<\Z\ì[+&.\î9¬«›tv/Œ\Z\Ò=)„0i\Û8msD—Rž7„\nüg+Y¾%\ÐlŸEi\"ˆ,\Ö\Øeeã¡®þD\\Vu\Ü\"kyc\ä‡B+)Ak¦æ­4ã®ˆðWGûÃEW\ç©\Ï&µ¼›‘%]—ò5BT ñ\\-j{0“h¨rj¥\Ö†NN\ÔÕ³\×ÚšY•IG#\ëT”\ÜN£Nð¾©ªE\\²Û…-zõ½:\Ñl­¢·BJÄTž¸¬\í\"E–\Ú);\Ñ[óºµ\Õ¤Š«Y\Ú[\'¢&¯4­\ÓÞ›Ó¸¦\ÎE6s\Å\êyHi¬c<}\ãY^ÓŽ¥ªaû›|\îÝ…\\ñ±3k\ÐEó\È_v®ó\ÃúR\év1\Äyc—c\ê\ÍX¤\Ü\Ùôoõl²œbýùÅ¥ó:;u\0Ž+K<{U(Gl\ÕÁ](ù¹;±÷xª„\à“W\åj‰4\ÌØ¡ù£9¤#ž)¹ –Çž•y¤g\ëUØ±\Í&\ÄR\Ô\ï!T\È\Ç\ÕXµK>ÿ\0:¡¯‚!­r¡ÂŸcÞ¹\çU\Å\Øï¡‡H\\\éõ?Gm¾J\ï+\ëÒñõ+C,§\çf9\àW} ¶Oc]ƒnˆµXß£rÙ…›”‚½Ó†›üCcc’;U±\Ï\åLQ*U­Ž\É2)sÀ¦dŽ´\ãœ\Òc)j2y6S¿¢\Z\ÅðíŸ‘f€Ž¼ž+[R]öŽ­÷I=š*D¡\0u¨kSu;A®\ìº3Jh\Ý\éG\ãUc$d\ÔmO$Qv B\ÓN>\í!\"˜Í“œö¦„<`šV\"¡2/¯j®÷º\Ó$d\Ã/\Ïc\Årš\ç‡4\ëØ¤¸0 ²¾;Z\êr\r(\ÚsºƒH»3\Î4\Û\ë«u•ùF3Š\Ö}B\æA†‘€ö¬i\âû-\Ü\È:85:¿ \×$¤\Ñ\ëS¥	$\Ú\'•\Øõc\ÓÖ¹}C*…\ÆAS‘ÚºV—¯^lV=\Ô”\Ö|\Î\æÜ‰#Ó´þ\Óa¥EkÉŒƒŒ\×\áC÷_gqó!\ã\é]Ô\Ðô\Ùt\Z´9j4F(\Í3<ð(ó3V`2L`\ç¥y¯\Ä=6\âóGi!\ç\Ë\Éq\í^˜¿;zT7\Ë,l…rŒ0A\î\rZ•™W>’6\ã8l\ãšú“\á\åÿ\0\Û4;S•]§ô¯,ñ¯/,\'š\î\Î#,,ÁzÂºÿ\0…“ÿ\0ÄºX_‡Žf\Íi-`s-&{h9“8\ëÖ¬T\Z«ƒ…9\ç:As3­lLR\Ô ö5&{w©Ô´8\Ôev‘ž{\ÓÁ\âƒ\Ð\æš\Í4œÊƒø¦¸8ô •V.®Ìš|Ã“•\ãµlŒYºœM5¤Š€\î\Åv’f.ˆ¥,\ÓwQ\ê=k`1\ÎúU{(\Ý!X\Ü€*\î8\Å+IsI±À‚*)— Ô¸&\ÒWi˜²w¸©0*²\á_Ö¯l$}(&x\ã8¤mÃ‘Hƒ¥H{ÿ\0<\ÐR!‡¡§`‚qŒœT •äš—=jGq\ã÷ žµ94\ä#r\\©\íA8R¯ô4˜\É\ë@]\Ï<\Ó²y©\ã5U\Ï8¦„G#†úô\é@¨\ÎiR1’wu©ŽhLòÿ\0ˆDEF\ë\Ï\ã_8\Þ\ÄÝ¹\ëŸS^ññ\"\è*ùa¹¯ž_\Þ€+ªž\Æ3Üª’–\'éŽ•\Ä&<\àg€}óN‘V&Êƒ\íOF\Þ0rG¦:ûÖ¤‘À<~f¬ÇürI­Vt`rI \Ò)À$“ž\Ü\Ð\èâˆ7€@\ås\Øõ\Å[ˆl\ç¦GAœú\Õh%N\å\Ï}Â¯/\ãñ\Í{		•q\×9ú×¤\è\×Lñ´EŽ1½Á=1\\Ÿj³6CŽ9®Œ3ÃŒðO¿J|¦Ôªr4\Äñ	˜?e\Î\rq»\Û;ºo<úC]&¡,\Z>zž=sŽµ\ËH@\È\rž´’.­NmD ’¸\ï\Æj#\É\èy\ç4ªÍ¸ô÷\"\çp \ã-©ª9[)¿ÿ\0¬fƒøi\\ªá¾¦\"‘\Êü§Œ\Ð$\'úRëŒ‘‘\Óð¡$ûzñH¸\Û\ÑDd±\Î#\Ðcüš7\à6\ìñ÷¦|©+ž}1Ru\ÉÀ\î\Å64\Å.G#\'\å\Æ\0Õ­)\Ì:•«\îÀœ\ç \ÏSŠ¤T’F T\È\íŠ\ê	pA \ÏQPÆ™û+b¡TŽ:\æ¼7\ã\Ý\Î,4»pÜ™]\Ïû¢½\Ú\Ôe1\Í|\Õñ\æñN¥¦@¤–[v!G½w=:¿\ÂÏŸ gÁ\É\'<tp\ãn8ªhT\î\È\çù\Ó\ÃüÄ“\Ð\àñÈ¬\îpH•ƒc\'\æ8ÀZP¿(n3‘‘\ÏUi“s·\ã®NqH’\áH\ÉùgË•$Œ½½\Ç5xò§9\äuª®ªp=zóš‰F^A\È\0`ûU#•\ç’EhJŸ(\Î\ážy¬ý\ÛXœrJ¤tÁ\Æ\å\n0;Ÿþµ;`P[#¾)À\ãŒv3NR\Ä\0{š´lŠ\Ì\0\0\\ŒSŸb\rNB1\ã§qL\Û_\È\Ó\Z’\Ç9<{RN0G¥<0x\àS6\'ƒ\Å#D&	\ÆWŒ~\"£*pNp}*]¬piT\ÊjK+¶ô^ýxª\ÂV\Ç8«3¾\Âsó€tAcœ\çµL{ð1\èsP\î\ï\ÏÒ­r\ã;Žy\ÇÖ¡)óŽ1É«%‘Ä¡\\zÕ°>eQ“ž2i‘B\ì\Ùa…ÿ\0\ÕqUO\0ãš¤$ii±(2+\êß‡(¿ccÁ\É¯˜4¸CÌŠƒ\É\ã5õÇ¬\Ö\ÛLBG-\×<WE2*hN€ax§Jº\Ôv\Þ\ÄTò\0A­YÊ…‰‡J¥|8\ê=\ê\Ä\rƒŒw¨¯p#\"²ž\ÆÔ¾$x»1}Bn¿z»‡ú`\Ø÷L:¢¸\Íf!.®Ñ¯V`q^\ç Y¥–j½\\4!z­¾‡\Ö\æXŸe—Ó¦·šKä…@LÒˆÐ\Ø.)\Ã\0W¤™ñ\ÒÕ‚€1O\éÖƒŽ1JM;0òz\ÒR’z\Ó2E!­\ÅBXE<‘Q\ç$Ò¸Ì½B5x™O¥yTš˜\Ôd—\Êœ×­\\9®\n\à\æw>õÃŠ©(¥c»F“m\\ŠH\"\Æ\ÕQSJ‹³¥22I4€Šó¹\Û=¸ÓŠ\èR·Ž).b27ŒŠ\Ôñ=ôVšk\Ø/ò ¬\ëE\ê0;5eø\Î\Ý\æ9< \àv\ÍW3PgEBu\àž\×<CURnñX\ê\ÉÑ™U™wpt·ag|7\ZÛŸAO\ì\ëybsWƒ§\ÍPô3¼J¡„÷”’9Urž|k\Z„-Àõ½¥\Â\È\Îj\ÍÖ™Q	\ßÛ«Ut\É\ÆJ1\ëÚ•xòUgNQ]WÁÁ£\Òt+Í“\Âÿ\0Q^†$=\Ç5â¶·e•@þð\Åzõ¬\ÂX³œ¨5¥9\Ý6wG–qŸt\Ñy‰=\ê84^Y6Š¶Ïžz;\ã85X9®QÕ¦\ÂFœ\ã\Ó5\Ä\Ük:üò\ìÜ¨‡§4\Ô.`ê¨ž¢Ò¢u`*´“ÀÌƒó¯6³{‰&&\â÷w¶km\Ò\ß`o9ª&¬m	s#¦Žd¬\Ô\ä\â¹}1\ãóÜ£–+sX³d‰I=qŠp¨÷6zS¹\ÅC,—p¨%•UH4§8¬-^\ï\ì\Ð;€þ?J\ÎR²e\Å6\Ò8?^%\Õ\êBú¾O\Ô\Ö:.\ÑURVži%l\ÍWkÅ«796}rB1\Ít^‹3´Ÿ\Ý\ÍŽMt^¹S$\ÈN‡Ä‡_øl\î\Ô\ÔNx¤W4Š\ï¹\ä4T+µ‰¨\Ø\â¥|\ä\çÖ¡9©l‹!„\Ó3œS\Í0ÔŒ*1RTE²@÷¦ˆ-Æ™\æ§\"’<m©3š\Ñ\0\Üw ¢œMD\Ýx4\Ð\r,	<Tr(#4œƒO\Ü:\Z`p8³k½ÊŒ´M¾¼EŽaÚ¾œ\Ô I\á’&û®¤\Zù\Æþ\Õì¯§€\ç\ärÒ±’´¦\É\ëóR•>±w_3\Ø>¨Ÿü5\í§ŽOJñ†®Ù;m\Í{d …\Ï5\è\á¾xÙ¿û\ÜþF\Ädb¤ö^!Þ¦RwÅžD\ÈqVPã¸ª`\â¥Š\Ú,\ÊH¾1\ÅXF¥PV=\ÅZSŠ\Þ,Å¢\Þ\à\Õ \"ª†£yw&Æ„LwŠ\Òc­qÚŽ¨\Úlk Mù`1Ò©§Š\\ôƒÿ\0©–\"œ›\Ôè§„­V<Ñ\Ñ\Û\ÜË²6 g\È^xŠ;D\ßqg1\\ñ·±µ-~\ê\\\Û?0Ms\ZÆ£g½u¼	¢8šS{…Lji6P\Óõ;køC@HõFaõ¬’eq^WcªDol4ø\åY¦¸\É]‡•U\ä–\Åzda€ñš¾e-Œœ\\wD·o¶\Òvÿ\0¦m^	rvÂ¨$õ5\ï§…[9¾k\ÔC\Ãusl™\ÇÓš\à\Æ}“\ì¸ZIºñÿ\0-Z*Àw_Î´´xN³\ãM>2™Š\Û÷­Ÿö9`\î\Ò\îb»PW¤ü;µŽ}KQ½*7DLöMsQ‡=H¯3\èsJÿ\0WÀ×¨·Piz½eŒ\äRœBp)	µ\ë\ÛCòöÏ›~,*§‰•ðkD<û+\Þ|7&ýMl`}–3ŒzŠñŸŠvM?ˆô¤Œ\r\ÓÅ·“\ßu{µœ\Þ\Þ(\â4\n1ÓŠ\ä\Ã+b+3\ès:\ÊY6_O®¯\îÐ¿†#&Œ*-\ÔœW¦•`[&¡bsÒ¤ú\ÔlF0*‰\êsw:u¶¥=\í¤\Ä\íž5aŽ#ŒŠ·¤\è\Öú%™´‰žNr\Îü³zl‡\Ê\Öm›?\ë#u\ÇÓšÜ”\à-CJ÷¶¥\ÂRJ\Ý9›\Âr\Ýx‚+\É/Z#ok]¿}\ÇB[\ÐzWx\ÙiMcÊ“7ç”’»\ØGÁu¯7ø‡›\Â÷ñ–ùdd\ã\Õ\è\ÄW–üQ\'…\æ¬“Ä£ð9®LOð¥\èz\Ù:o0\Ã%ÿ\0?bx\ä²xz+\Ï\Û\Ï|\çjTpö\\|\ß1o¡ª×‚X4-v\ã\Ìy\ä?žÚµj?q’I\Ê×\ÔýAlß™\í¾Áð¾š0\îs\ÇÖº	+Â«ÿ\0æ€q\åqø\Z\Þ9\ë^”>ú™fNø\Úÿ\0õö_™QBõeñÉª\ä\Óg	Y\ÇZˆ©\\\Ö]Ô»^,~3MJ‘I#š€jU$ŽkD!’\äUP0õfSžµYŽ9¤Á\äd\Õi\Ï#6\rT¹}ˆÏƒò‚!X\ÏczZ\É\â(\ÛYñ„¶±³È‘Ÿ`+\Ú\í [kx\áN4\n?\nó?\Ø5\î¡y«\Ì3™c=y\'šõQÒ¸)E\Ù\Éõg¿™\×O\Ø\ÐOJPIú€¤\ëKœSk[HSiM4\Ó¹¢\Òf•\É\ã\Ó\Ð\Ðh\'Š–+‘¡\Ï\"‚8¨bnH©CDr\r<Px£µK)Ž\Ô\ãÉ¨A©©f‘<\â\Â_^<¨UO\ã\Íwm\ÌZM\Ï\ï%‘ÿ\0\\W\r\âh–ð\ê@a\Ò\á¹\ÝW¬xV\ÜA \é\è3þ¤Ïšç‚¼\Û>ýž[Fq:@8\Å\ì\Ò•Ô›bL5%FÝ2Z\\œU)¤\Çæ¯·\ÍXZ‹-¼3;`BrjXQvA¼ºÀy§™*d\å\ëS£ù¬d\ê	$cLnö®n{tÝ¢d²iÁÁ\ÅX”t¨”I\Zshz„56b,ß£(}«Ñ”Q^7\áDw\Öv©\å\"cùW¯Fû€\ÈÁ\Õ„òq\n*«±6j¥\í\ÔVV“\\Hp#\\Õ°3Ú¼\ë\ÆZ‹\Ý\\A£Á\ÖG_3ñ\íD¶+IÖª—Mß¢+ø^\Ê][S—W¹;”1ƒ\Üÿ\0€¯U@ô\ç›¥\Ú\ÇimH0\0À\é\ÅiÚˆ\Æ\Ã\ÅWuªy-ò,E\×kŠ­Þ«²8\î5ó¶¨ž8|ŒŠ¤\Ã42¦f¤#Ö£j–Y²*>)N@\ëQÔnr~\'”¢Âž¹5É³µ½\â–\Í\Ô\ê\×2\Ì=kŽ«¼\Ù\í\ácj13µ)†C\ìEu	q\á\ëV\Î6?Qƒ\\µ\Ò\ïG\È\ÎA­\Ïö&+\ÚV*¨\îeŒ¸\Ù\ëv\ä´c>•7Z‚ùiþ\íY\Öy\ÇzAš“‡rµÝ²\Ý[Iƒ\È\íE”\ro\n¡r\Ø\0g\éV©\ßOÆ¤|\ÚJdTù\0\'ô©1Q¸`\ãšZ¦i¢D`* zy\Ï4\ÒM0!`GZ\ÑX““R·Ò›Ž§½\0@PUv„\î\ã½[#Šˆž:š*me529§œQ\0UwrE[œV¿\Ë\â\ãø€5›#·üB¹š\"1µ™k\é\\ut“=\Ì6´£\è=T•\è:\Õ`ž\ëP\0³\ç#‘ºØ‡@-®Ww\Ê\ÉóW¨ù  ¼»BO?R ^Ÿ[G5\ÕKc\È\Å\Û\ÚUb9\àdqRm\Í8s\ÇJ*ä“[\\\ãdˆ qL*\Ø4\åuaòœûÓ°	\à\ÓsnŽÀ\íÚ¸{2\ßKÖ®„…Y@a\è\êz,©”5Ák7-i¬Ù†\ÈY>\\Š¸™\É#²E\Ês\Æ9\ÍL\Ç\ãUm$=sVW‚G|\Öl´NOjq=© Žô½z\Ô2\Ñ\'LP	\'Œô¦n=\0\íN\Î) ¸\ÏZ\ÔùÈ¤aòæ€¹TQ¤sSš\×=(6\Ö50\àœŠWP\çLPŒr”jc)A\Æiw†8 ‘’\ãv\à9©¢l®OZc\0ëŒƒD@\í €\03N\á»ô¦«q\Î;ü\æ\Ük\'¥0zÔ cƒHpNA\ÍHÐ€“\Ï4ðSM˜vœ~¾Ô˜É‡^¿; \n„>F3õ¤2\î\ÐKi8\î*¸\â— ñšr\ã=\èô\ë\É\æ’WÚ™©ÀG¥ck3´6®Ë‚@\ã\êj£¸	ñô\ÍzÉ‘Žþ¦¼¨ü\Ù9\Èþ¾\Õ\Öø¢\îk«–nqŸNõÇ§9\Ç#§» ¬‘„\Ý\Û\"²\å\Ü\r3\r\0žrj\Óõ\Þ\n\ç ƒýE1öH€ªƒŽõd¡Yh8\ïøU2¸öã·¥K†Û‘\ÉÇ§¶jY“vXcðþ´X.E¸ŽsÖ´`e·.*Vô«q1a\Ç^\'¯ÒšgK¦ùL›±\ÜrsÐœ\ÖÜ²\Äw·]¼J\ÅÓ£%H\07\ZÕºØ–Œ@\\c\æ\é\ÏV\Ì\É\Ú\ÒkU<‚ ^}q\ë\\\Ã\Â\à–Wœþ\0U\Ç.X…uÏ½Dð;>§Žµ»eûX\Ç\ÎH\î(rH=úq\ì\r6H\æBü`ÿ\0…$c\\‘ú`õ\è{P!(G\àú©\r¸8 gÚ¥|ò¯\Ô\çŠjœ7=CŠe\"EU »žO>•	+Ž\Ñ\Î=ý\r^H÷F\Üsžj(T.T\àÓ°\Æ\0Ï\É\ïžþµdZ\Û\åK\ã=‡PsÚª¿\ËÕ‡\Ý¥N ,w#\æ\á³Þ†!­jˆpŒy\Ï^R¹ušC·§ñ·ZB\Ù÷\ãy\ÜA9…Tž!¨\á[9\È\ë}*\ZŸ±ð\Æ6t\Å|…ñ¦o7\Æ2¢˜`EúW\×ð(ò€úW\Ä_nÇu6€²„ý\Ðw3Ï­±Ã¢A\Ï žÂ¢Ž\ÐóÒ­°Ú˜1Ú£cÁ\Ý\ëZ\Ì\âct$2¥F\ì½\ã\è1S:Ûš‹j3\Çõ¤I\\gž§®Ú†M¤†\ÆZ`N\â\0Ž}ª«’I$2p()\æ\È<w\í\É\Åg•>fH\éZ3\È#>\ÕA³‘œõ\ïTŽˆ\rQÀ\àZf@$R!\n\Ù9¦Fy\Ï\\Õ£t0¨\è09\éQg¸=_¥HP¯\é\Å L\ï\ÔS-\ç=\éx\Ú­Lc\\lÀô\àúS¼¢«·±\ê)2\Ñ\Z£¯~)¼Xõ#÷X\à“Œ\n­¸Œ¶:Œâ¤¢9e\Ú@žƒžj£.\ç$‡Š²\ê\ÅKž¤\Ðç²ž¢€±\Ö\rŽÍž½)~iq\Æy§º.3\Ü\ZH\\\rX†ù­‚ \é\ïS[\îÛ»$\ç½D\É\Æ\çžU»D*‘\É\àöAc·ð«\\]\Æ;\Å}‹¤D ´1÷@\Ïò¿‚v.¡nza¿}_\0(€ŽTŠ\é¦c_DûV \éV\ßs\ÍfX·P+S«g*eU\ÎúKÂ¦3JxqPj¶5\ØÞÄ\"[oµx•€\â\\f½º\ÑB\"Œ^i\á‹›P¹¸=3Ö½6\Ü0Qô¬hBÉ¾\ìô³*\Üó„:B6-\ç<Ò‘J§j3]\0u\Ðx¹8¤\É\Ý@ƒÁ¨O\\cŠ“ýª3AC1Qž†¤\'&˜\Ì)6R3®À‘\í\\Ë<ŸZôŽS+¹\\\Ï\'¹¯7\Zö=<¿vE\Ý\ÍI9!icUA\ÅW¸|-p\'¡\ìu%\Ó\0{ º)\Þ&{o°9“Œ\ÔZ3f\á½1È¬?JV(Pw~Eiö£®\"óX!\ê,3ò–\Û\Þ\\[¥˜‡lgMVðÞŠn\å{—?\"\çý\ãYú…²\Æ.¡\Ûòx\ì+\ÒÀC\Ýlóx—\Í:tÓºW¿©“w« ¶™P„þdW2“‘(d\é\Ø\Õ!	q ž]\åŠ±n\é5¿\É	Sø¬±´\Ýù‘\Ý\Ã8\Èòº-ù£¢¶™¤n\ê+\Úô)<\Í6zŠñK%\Ãeq^Ó /üK¢=3\\”G=iÑ‡”Í³ƒU¥\Î:\n˜œu¨¤\èkc\ä\Þ\Ç©™\Ü6\Ú\á/f³I\Ô<’9\ÏAÒ»=u\'}\Â	q^i%Œó¾&m­Ð‘D\ëÆš\Ô\ÊYÖ“\å6,õ(\"ºuH£\\÷c“Z·š„’[\íHc\Ï\ÎE¢Ú£‰2\ÌÞ»ªK§H <WlR“\Ðõpø\'\ï/‡\î”\Ül$\ã»\å Œ×ør@úªNp+\Ö±\Ç\ãWJNP&¼\'b}\ËH]qQ—QÔŠ§q{\'<U³\Ì\×\n \às^k\â½LÉ¶\ÙXeˆ-Š\ÞÔµ\è!\Ø\ãŒgšó\'¸kÛ§–Lü\ÍÇ°®UK.U»;ðty\ç\ÎöE˜Tb¬* zbœp+\Ëzž\äU‘\Ã\ìZ\Øð«–w\í\Æ+˜¾ô\ÕxM\\Ú»\àeš¶£ñ\"kÿ\0Gx­òñA\'5^\"\Ý\ÍX®Ëž3\Z\Ýj©\\â«¹\ÏzD\r4”„±¦a\Í$…q¥²p+/Qœ\ÛD_v6Œ“[\å^r~\'œÁ§\Îù\Æ®;‘\'dq¶ÿ\0aûQ·{WfW+¹{\×ye\â¨n£ u=Á5òÎ•‰oñž³\ï^ã¥’q\ÐVu¦\àÕC	B£vCþ\Ý\\\ã\ÉlT\ëŽA\Û>¦°ƒdgŒ\ÐÍšÁV›g[ÁÒŠ\Ø\èt¹¯o¥’IX\×@Ñ˜U\ÐV~™\Ãk\ÇUÉ­\Û»\á~Tym\Î\ìŒÉ’D\Îs\Åx òµƒ óS<úŠú‚¸¯)ø‡§«Co\"€Iù‚)Mhw\å•11_Ìš† \îŸ=W·[I•Ò¼_\áÒ˜…À`7dW¯\ÄH\nÃµu\áÝ¢ešë‰Ÿ\ÈÛˆ\â¬g½g\Æù^µeXb»##\Æh°‘š˜5PW*y«*\Ãmm4\\\rS¡\'LJ™[Ö·ŒŒ\ÜKŠ\Ãô\âj°n†·5jDr˜~#“eˆÿ\0®‚¹\Ûy+k\ÄÀ¶Ÿ‘œ‡Z\åâ“^^2_¼ù#è²¸þ\áÿ\0‰–.\ßp9\"¸t¶µ—W1VS°‘»µv\ËÖ¹›t#X|Ž¨kTi£¾T\â\Ñ\ßøR\Zº¼h«¶\"[½9‰^Myÿ\0„‚}½\É\"¯D|08¯s\ïK\æÏš\Ì\"£^Ë²\æ¾}ñdRÁ\âK\è\äl„I¸5\ï;™¼ó\â6Ÿ\ç\Ø[ß§A \ãø\Z–&Ð¿c\Ò\á\ì\\pø\è\Æ[U\\§—\Ãm#®\ä85\ì_\à1\Ù\Ý\ÎÄŸ2m£\ß`¯\"·³ºžk{X‡¹•c\È\í»½}3¤\éði¶0ZB $(}ñ\Ôþ5–\rÏ›¢=\Î$\ÆBUAk*Žþ‰a“\çŠbÓ‰\é	}O!ø† OønVf\Ü$À\ãŽ\\W¯ \ë\É\Æk\Éþ#B\r÷‡§ •‚0žz×ª£‚\ØÀ\ëXQV«W\ÕŽ2|\Ø»Fkñ&#Ži	\âœNj\"\Ø\ìk±;žõ8œö¦UŽc_›\ì×º3ú\Þ÷q]9rR¼\ï\Æ3µ\Ú\'xy]\ä%‰\îE?˜¬UD\ç%\Ø\ê•\'\ZPŸ{‹)Ü Ž¸¦+–\\Š”cUe;	JL˜l\â¼O\â\ä\ÄXiðô\Ýp\î\à½°Ž+\Ãþ/o[]9”w\Ê\0ü+‡ü)\îCÿ\0#:¯ò<\ë\\V‡D\Ð\Ð	‚OÕ³PB$û#c©\\/\Ô\×M\ãˆ<;\Ã\é·[®H¬\ÙË¨\ê6‘Û¦W“\ÑQ9$×—kJ\Ç\èp¯ªº­«.g÷3\ß4ûe²\Ó\ím×¤P\"þ8\æ§ Õ’£¡nk½+#ó*\Óu*JOy6\ÙUû\Õg\ïV\\\ÔFhf%9¸¬\×‚}jü\ärsTˆ5)”Oœb¬§\'Š¦:\nž>NZbd²\ãð\ÍWaò\Ô\Òj.¦\"<\n£¨{i\Ì\ãhü{\Õ\Õà¸¦0R+)›Svf™§C¥X\Ãiùc™=M^ëšƒQ“X4‘\Ñ\Î\ä\Ûn\íˆ\Ô\Ú3G,.4\ÒS‰\â£\Î*D8š@j>”\ì\æ‚GTn\ß-;#˜\Ø5,\n¡°A«*Aª\Ò) qR\Äz\æ 	¨\Ç4½¨¤R#¨¤”ÆŽ\Ù\Æ\Å-ù\nœ\ÖF¹ ‡J»oúbÀ~\"¢Z&tQ\\\Õ\"»´(\\O¥Ü–\Ægwú|Æ½–\ÂmgCˆ¢¼7Lgqmf¹2<¨Ó­{\ê®b°£»=\Ì\æIFŒ=XúZm.x®¤|\ëaHii\r2Jr€‡#½gj±_\Ú\Íƒ+,NŒ=CV\Ä\Êz}*€ë¶¥’¶µ}=\rœ™\ßl\Æ>z\àt?•N\Ø<×¤xŸ\Ãÿ\0l_¶[(\Æ0\èú\Å\ÔWšgœ~®9Å¦z´*©Ä­(íŠ„ô5iÇ®j¹À\ÉëŠ„µ:\Ð\î¼l\Zk‹§N\Äú\nô9“ÊŸp=r¾\ØtH$\Úyg\Ã\ã5\Ú]Ç¾5#øMu\Å{¨òj\Êõ\Å\ç¼\Â\Æ\Ø\Þø\ÎwlŸ)‰W¨E€\ÅeXiX\Ü\\Ì \ïšB\ÌOò¤Ñ¾¨Â¯yF\ÈÕ…pOj²¢ PÁ\Æ:w`œÕ£‘²d\ê\rN*ºr\Õd\n´J\Õ65\\ \Õ6\êi11Œ)„\Z˜ŠŒÔ±¸#¥BF:Õ†\àT>Æ¤ks‚ñB´Ã“–\ns\\»\0ko_’V\Ô\ä>\è\Âý\rdÀ\ÅpTø\Ù\ï\á\ãj0ô*H”Ô¾œÁwwjÇ†a\"\çNxò+&Ø›-n\Òu$v7\Ð\ÑN\\²Aˆ‡<\Zò=\æ\Ý\ÆÁô«@ƒY\ÖÄ˜\Ô\ç·\çV”“\×5\Þx-XžŽ¤šuŠ:\Ó\Æ)‚œ:P$Ã¥\'j0\r ¡¦˜y\ëN$ñL9=\è&ð(ô¥\ãñ¤\Î\07$TN£\Ó\ëSŽjš¤&g>ýÁy5¢‰„F2œ\Õ\àøJLG¯¨n‚©D\0üjßˆX¥\Ç<\n¥	ùq\\5¾&{˜o\áGÐ†;v¬›œ\íú\æµ€½y¬‹¶\0VL\ÝlYð¢ïº\×0\ê\0p3\é^m\àõ\Ìr¸&Jôu\äWe?„ñqO÷£4cŠ\\\ÒsZ£”j…À\Å<°Sr*\à)‰’–R:ñ^w\ã°öö\Ö÷J8†U\'\Û\'\ßƒ\Çøu¬\Ù\rCG¹“$©#\ê9«‹\Õ-˜h—Kul‡¦@8­ÓŒûW™ø#Qó­\Ä2g|?!\ÏRWŒšô°C-)-BÐ—>ÝªDlŽ@¨ó”\Î{R\'AYš$\îÁ\â¤\àŠ¯&s“È©‰\Ï\áHƒ´\Ó\Û¸õ¨ó‘Lƒ\ØPŠdƒž”\Öd±4\Òs@\rd_z„|¸«$v\îj&ù’\r0\0\â¡h\ÊÒ’T\âž\\0\ÇXLƒv\ÝÇ±\Çz•”1Úš\"n\Ýi\ØA¤ðzõ«¢A§5@\ÄQ²\rN¾¼d\n‘¢\Ð óšv*\0üR‚)2\Ð\Å&CŒÔ£Ž{\ÓyúÔ±l^þ\çsÓŠ˜¨\ÉÈ§w4žñH„‘\Í5	\Ï\ãWOZk(\ï\íN\ä\0\ÎjµÕºÎ…Xƒ‘\Éö©ø^Þ™#\0¤\çq>wñþ–S«\Æsž™\ä2\æ6\È9\æ½\ß\â\Ë\ÊHa•\èExt\Ø\ï\\•\ÙOda >wcšªKDø\ÅJpÀ`ŒŽ”2$ŠpON\éV@Ë…\È8ð8\"£Šb±»¢¤¹\Ãd`\Ód‹a\ÜFqŽ}¨\Þ\0Rÿ\0\\Š’\ÝJ°\Ê\äñU\àŸ…VP¸8\'\ëZÀ•K/\ãüsT6ž£jœ|¹\å}©Ú‘›CQnI‹ŸC…\ÎI\ÅS½žGp27qžA<c\ëUÐƒ8©P¤Œ\ç\ÇJû@8\0tû\ÃúR\Ê\ÜŒœ~ ~ðä“»\0qŽqŠ‡¹e^]²È ’;šÌ’6Œ°\Ç\â¿Bk­MÞ†[€r*µýŒhˆ:·s\Ç4Xg0¬Y#ß®)\Ä\Ù\Ó=pjf¶}\Ê;/@9¨\Ù\n\Ü\ã `qJ\n%ŽeH\Ú?½œóŽµ\â9#?J¹¬±ò:œ„\n©\"	\0gÐŠ@ZH¢\Ü\Ê0H\ÈÇ¯½YF8%.y#¯¯¡¬\éf“h\ÆB\àgŸJTB\è\ì¨a\Í²w»(\ÅN0A\ã\æ ûD\ãrqŽ„÷úÕ¡{B³;wö§–Uxw¡`¬g¸x\ïA\rŸ°\èÆ1Œšø\'Å¬\×>$¿“;šK©\ïAº¾ò»q”òg…‰\É?E5ùñ|þ}ô­ýùŸ›Þ»¤p\Ö\è7n\Ì\0{\çð¦88\ÍI)U\çnxþTÁ\"\ÐgÇ¥EŽFC·\n{qQÀ\ïS‘Ñ”û‘P”VRœTA3Œ`\Z \îOlsŠ¾êª¤ö\ÅRt,;ô\îx ¨•\ÝK.\îý\0\ÏJ \\žÖ´%G\Ø@ù¸\Î+=‚‡-žOoj¤t@ÀÇ©5\è9>æ¬€:óÀEFÀdt\Çz³¡‰\Ûõ\é\íN\ì¨\ç\ê~˜7~€ALh…p\Ù\Îi\ìXÚŸ\Ï<ŒSr>ƒ°¤Z#À=¹\çªœ„)`*y\Å]*}¹\äY\Ò\ç,N9ö\ë\íRZVœ\àü\Ù\ïQ¹\0‘ÜŽµ\0I$\îþtÓ‚OqJZM¾^q\ÔzóMmª2zvqMDÝ“\Ðÿ\0^ô¬0\äsT\êTòüµb6ó\Æ}j‘o˜z\n{ŠcG§øJDûT eÀ\Í}wj7\Ù&Xò‚¾!\ÑoÅ”\èG;pz\ç¥}K\áiú´pJ\â9ãž•µ9Ö…\âz\r³²¥mC.ô\é\ÏJ\Å@Án\â®#lq\ï[\Ü\â\å.H0zw¬\í]\Â\ÙHI\0ŽkI\Æ\å\ÍSº\Ó\á¼hš^Dg!s\Æ}M&®iI¨\É3;\Âö¯“3&\Ý\ï‘\î+©Œ\Z#\0-H\Î(J\Ê\ÅU¨\êMË¹%(˜4\áÖ™`S{ÒšgJ\0sTlrx¥9¨‰ö¤\ØÐ‡\ÏZ£‘€\ç5\r”‘Rå‚£ý+€r\ë¸\×i|ûav>•Á\äŸ^k\Ì\Æ\Ëc\Õ\Ë\àõeŽÕ™x\Çô«¥±YWO“\\\'ª·.h\ç÷®\ÞÕ\âõûL\Ð\0+FVÝ›©cT5\ê6¿&püû\×DWºŒ\áS–µû\Zf,,#OÏ‚Iú\×+­h\ÒL%Ø¹.§“^[5‹v\Ñ\äœ\ãojõ(>MžÇ¿lÛ—{ž	q \î€\Ý\êMm\éºds²³¨W\n+g^X„¯¹ú‹\\\ìZ¥¸t(Š»	\É=kj\éJ6¬©UM=™·&\Z\Ý\Å\n&aŠõ{xR\Ö4\à(\0W)¦\é±\Ý\ÏmvÜª¦G5\×0*==+\ÉQ\å¹ôX¬[¯&öC³T%¹s\ïV>cQ¸x¢\ç	\Ìj‡(I\È\àóŠó\áÁb{š\íuû±(’z\â¹xaSÈ¯3;\ÊÇ«¤\Ôn\Ö\äÁWð®~ô–ë¤¹*ªk›»,CcZ\âÝž–\Ä\Þf‚\æY°\Ð®µ¼Fe˜ a·þ&¸ý=„0Ü’qº:\ã¢}^I÷¤Rƒ1Þ½\\?Àx˜¶ý¡\í2\ë D¿uy\îrk\Ïu\ßÀ%}÷-‘\Æ\Õ=ê©²\Õ\ÌI#\Ú2¨’\ç¬\É\r«¡&òz\ägšº³Q‰\Zr©1–ú’_©DƒÞ¶!ÂXÖˆ£ s[*qŒWZ|\Ò>‹O’(¼§Œ\Ð\ÜT»\Ò;\Z\çGQ“|ùlzWu\á„e\ÓÐž\ä+\Î\î\Ø\ï\ä\çšõ%6\Ù\Ãts]4~#cµ\æÎ‚6\æ¬â¢Š €sÒ¥®«(\Ç\Î8¨MLý*\r¤\Ò%¥¥Á¥j0šó_\ß\Çšñƒó\ÌB/¹5\èŽÀ^#\ã‰\ê6±\ã9~¸«¦¯#*²²9+f,78,øÀ\èú`8¬]A\nÁh¤d\î\éž3\é[\Zx`•Í‰\Üö²\×x‹\Å^±ƒ\í1©\è95DnhÀƒ\ÇE¬(\ë4v\â}\ÚR~GS\Çn\Õ\"cŠ®K)*Ûšô\Ñó\Ïr\ÆF+\Ï|i2¼–\Ðy\Ý]\ë×’ø’\é¥Õ0¨0}3JOC\Ð\Ëa|J}“gK\à¸ÕÛŒ¯DŒ²j\âü‡L\ÞF\ZV\ÝøvÃ¥oKDŒs	s\âjz—¡p\ÃÞ­†¬¥ùpEZ(5Ò¤y\Íœ“\Ð\ÔñJ©\ï8Á\ç#Š\Ú31q5ƒb¥\rY‰1<VÕ³Š\ÙH\ÍÄ¿»4ô¨C\nx­‰h\ÆñüƒŸ\Þ\Ç\' b»6QŽÃŠ\á\ã“\0}+\Ì\Æ\Ë÷‹\Ð÷²¿\á?ñ\ÌÀ)¬+I3«\à\"µ§l.s\\\í‘g\Ôdlt^¿Z\ã\æ=&Xð›©ºŸ¿\È1^ŠÒ¼\ëÁ«´9 ÀW¡qŠ÷ðo÷1>_1³\ÄK\äG&Nx®o\Äq¥Æƒ\ã3¨®«9¹½M—R°š\Ö9\Ìp\n\Î:…\ît\Í^-wG6\Z¢§^”›²ŒÓ¹\ç¿mF¥©I¨˜™`µM‘\çœ\ÈG&½\Þ&ÛŠ\æ´k-*\Ê;H\ÄqD€þdûš\ÞV\àQFŸ³…ó<w×±R«´R´W’.—¤&¡uI[#Í¹‡\â-5½4ÁÀ•$IaoGŒ\äV\í·˜\ÑFò I\n\Ë\è})\ÈqŠyœ\Õ(¤\Û\î[«\'Á\í\ÚÞšÀõ4……Dò äµhÁ±\Ù<â–\ÅB.w¦™sy\ÒL\Êp€ž\rvA\Ì\Ò[žs\âGóu98\Î\Õ]o‡®DöuMŸŠñ^}<\Ð\È\ï\'\ï³ƒƒÖºŸ\n\Ïh#•R\à±Is´®1¸W™F¯6!ù\Ü÷ñ490pV\Ö;n€j¬ü`Ž \Ô\î@*E6A•\Ý]¬ò<WŒ|TQ¢¡\Ýtß€È¯`Y_¯ øŽ~Ó­x~\ÑF]¥fP?\ÞÅŠþó±\í\äzc\é¾\ÊOð#ø™l\ÇN´™@\Û›Kz)?Ã­\ì\Ú{j3G‰nþ\è#‘\ZœÎºŸé««i¢ÉŽÔšx\Õÿ\0\Ý$~5\ÐC\ZD‚4P¨ª@\ìa\ì¿y\ÌwTÌ¥ýœ°\Ëw7wå¸Œ*«\0I\Çq‡z¥!9<V–<9=J\ÎETs\ÅYzªæ¥IÀ\ÅES\ÉU\Û Ž}jd<Š¯Ò„|8«@\\sPÔQšbpû\Ô-øŠšNj\"k9\ZÄ¬Ù¨Õ†Á\éU\Îk!´”‡ŠLšÍ–8¨Jj=¼R%\íKÒ’š\Ä\Îh%Ž\ÍD9\äW9\âmn-E¾½~<ˆ€õlp?:\á~xõ|Kdmn\ÝWRƒ&D\í*Ã§õ¨{\\JJö=s­0W\ë\Å17\åR‚\éPYazR\Ô*OJ”Pq\\w‰ü?®Gv÷\Æ\ÙG\ßLd5v\'ž)È¿74¤®¨Õ•)©\Çu±\Äxk\ÂO¤\Ì÷72,²\ã	\Ç\n+º\Çþ*)\â”b¢i_R¼ù\êJ\ì¦Žj-ø85)8ª9®;¥!$\Óx¬û\ÙN\Ñ\ZžZ‚J÷—²	0€\ïOŽE”nS\È\à\Óc€\æ‰\"\ÚUÓ‚q\ëR\É-¡\rÁ\æ\Þ+Ñ…±{Ø¸BG˜==\ë¾“¼t\î>•ü1\Ý\ÙO€QÐ†SÐŠ‰+£jSpšyóý\Õ\ì6±™$‘B¨\äõªþšjw…+mjœ\ç—\Ý\ÐU=cL²µ‚M©ò\"‘‚s÷j\ï\Â°5‰†9–%#ð5à¥¯™Ùˆ«(Y.\ÇÐº]ª[ZG\Z(UA€\0\àV£Œ¥V³\æ!W?†¶µŽÊ±\ç¦\Û\Ø\ÔqŽH©\Æh•\ÆwTÂ¢–¤^™ \àš´>èª±Už{U\r\rq\ÅT#®‘\ÅU ôóC!n¢˜jR4\Ô2lD\Ø\Å@\àS·^•y¨e#‰ñ=£mK9Sµ‡µrª8\éÞ½V\æ<2F@9R0k\Ë\Ä~TŽ˜\èH®JÑ³¹\ì\àj¹S\ådcmÀ‘v˜!¸e?‘­\ÃY7J\n6E`´gd¶=v\Å÷Aº\n\Ó^Oj\çt)–d\ç(+¡PkÑÂŸª­9/6<T‚šµ Èª2\08c¥  h¸…\Í0“\Í:FØŒ\Ûr@\éM‰üÈ·m\Æ{\Z\0C\ï\ÍG\ë\ïRž´\ÂB.sH¦p óMiÕ±·‘\ëP[šar9nŸ”jŒ†\êR\0ÂŠ\Ñò—°¤d\Û\ÎiÜ’„6g~Y\É5p£D¤òÔ¨~lSvP5¹Ák|\ÞŽp*ñŠ¹¯§ú`Ç ª0\à\às\\5~#\Ý\ÃkIzJ\Äƒz\çõ9p±\'¹3`‚¹=a\ÆÝ›ˆ.Â³Ýš\ËH³ºð¬]‚;c\'\r]ŒS(\Å`\èkVPªœ\áFk¢\Æü\ã­wAZ(ðk¾jŒ\èÆ”\Ê¤Ø£‡h\ÏSWc!­!\éžô(¦Ÿ—¨\ïF\ïJ%“\îS¹\Úb óòž¼Tù¨_]AoK+€ˆsT\ìx%žµâ¹­\å`!¸—\æ# $\àf½\â\Î\èH\ê|•\ã\È.µI¦·)9ú×²x+Å¶Ö°\Å\æpª“\Ô\ÖÒ…\Õ\Ìb\Úg²¤œ\â•~ñ\ÍgÁ*·~*ðlµ`j˜÷<\Z€\Ê\ÛN\ßZ{‚\ëÁ\ëUÀ8ÛŽi\É\á\Ëò3\ÎO¹[{\äTQ¡\ãœÒ¼g §¥\ØiŽV\ÃT½y ?\ÞzqšW{SH\É\Îi\Ý:\nn\Æ;ŽE¾™ª\ÅYx«l\0\"¢r:\Ó$‡\Ù\'Ø½^qÚ«\\\ÝCk\É#P2k\ßY‚\í²Ž¯ý\Ö\ìKgY¡ÀQ÷\å\éX\Ð\ÌÀ9\Ç|Ö´S^y\â“\Ze¬+\àŽ€\ÐISœô¨£lqù\ÔÀ\É\æ³e¦2\ç­NNzU\Å ™‘ˆ9\Å\"‹þ¹ rj¸“9$\âš\Óñ\ïE‚\ä\íP’Nj7›\ÇlTnMRD\\°\Ä\03Y7·\Ñ[¨.@\ÉÀµ3¾W$+\É|q¬*\Ü\Åm·kH\Æ\ì\Îr²3¼i2\È[®\Ï\Ë\ë^331.@÷\Åzž¼wÙ‚A\Ã=8¯(Á8\É*\rtÁXÁJ\ã”\ïU^\ÇòühL«ñ‚£v\"›\Ç@9õ©\Ðž \Z±‘¼»ÊŽx8õ\Ï<\ÓÑ¼\ä*ÄŽyü~•b\"„\É\ç#\ß\ß\éQ<(Œq>˜€*\0|\Ì(>zV¥¬ˆA~RsJ¨\Ê\Z>zñŒv¨#˜ÀI=\ÆúsM×¥òAd²\á{`ûV|c\Í\Ø_¹‡½g\ÆD³c<wn¸\Î	­½ùS–lv_Jw\×\æ¯\'×©©#R¤³aß­W\Ú\Ê\Ù\\\àšµm˜Ž3\ï÷Bt6\ÛD(¥@\È\ãõ—­\Æñ„9þ!\ë\ëŸJ×‰HAÜ¨\ã\Û5GSWšÔŽ»G«¶„_S‘–ò@Œªz¯>\ÕQ¥eŒ\\\ÓeVF$ŽIÇ®) óƒŒý*¢e’û<²wzR\Ì\í «‘ýGcUpŠ·‘-¾Á\É#×žjJ(±=8>¹«É·h#  q\Î3éš¦SS‚T“\Ç¬YH\ê=©¢Z6 \0ª1\ÚB¡$ŽÆ£Ÿ<gkgú\ÔÐ°#®\í£#\× ”:9\nG\\•õ÷ª1šg\ëwˆ¦[_j’–\Æ\ËIN}È¯€N\áœ„\î\ã¯zû‡\âmÈ²ð6¨rFSn$\çŠønÏ—\r“\È\ãÒº\Ù\ÅU—¤]«\îÃ­U\Ú9cÖ­±Ýœ\ÔR\'\07TÌ¯•\Ãj\"8\Ü853	#¡¦\r\Î\Ò ’¼\ß;Î«¸\Æ1S»\à\00\Ã“À\Í\"\'\Ú\È9\èÙª¬‘…€\Ät#µZ(He\Ç\0US¼!ù½‡j‘¼\nŒvŒ`T;X¯L•\ÆqS†ù\'`GŽ{qVt\"³9\Éÿ\0\Zž¼ñ“S8?\Ây\ÅD:óL´…$œ\îŽµb\rLq\ÆA\ãÞ£l\ãv>£µƒY”I\ã\éTeÄ¹$\0£i‹éš®Pp\ÝN8¬\0Ê©\ÐÁüsÞ ´®F­‰<\0\ë\ë\Ï4\àû˜1\äb‹\rsÀ\ã==i$#F1\èiÁ\É\Î \Ò8.Aô8¤\Ùi—frIõ*°lŠP€‚F?*µ\n ¶2h¸\ì[´½q\ß\Òi÷S\Ä\Ë\å¿C\Î8®r6\Ï \ã# ®—J)ª\î8Sš%.TÙµ\nnsHö¿x§P·H\â¸r\Ê\ÝWµ\Ãp—PD\êzÊ¾M‡Tk¦2\'\ê¨¯Sð×‹ü€±M\Ê™\í\\ôqª3\å›\Ðõ1Y3©ENŠ¼–\ë¹\î\Ñ7˜ŸN*Êz\ÅÓµK\È\Ã\Å(9\íZ¦E\ã‘^¤f¤®˜©JPm4\ÓEØŽT\nxõ5^\Æ*\Î\ìÕ™XRÆ£2®}\é\Ç&™\ÐP{\Ðx¨·ŽÆ¢ipyü\ên­“Á¨^k:mR\Þ#‚Õ¨x»J±S\ç\\\"p	©“I]²\á&’M¶ueÀ5N\â\î(Ð’\Ã\ë^A¬|KŒ+.Àp\ì0ƒÞ¼\ÇPñfµ‘-\Ó\àžvð+Ï­„]£«=\Ü&Mˆ­)Úœ|÷=—[ñ…º\Ü}’\æ»E¨b‘ŠŒ1^)¢\\´ú€{œ“šöX*½¸¯6¥IM\ÞG§õjxt£û6E`_\\\éZ\Ï \Î_¸cŒÔ§±›F×‡¯\ä¹I¢tÀCòµoý$¹ŽN›y&±ôX\ÄV]²\Ç&º¨YJŽ\Ä\n\ï§f‘\æW›ŒÝ…¸r¨q\ÇkÊ¯\îoî§¸aV\ã5\ë7~‡}¡Y^’{uWe*ŠS\Ê\ÅR•U£<ZŽq.\Z\éþaü=\é|1\á\éuI¥Fb£þþµéº‡„V^#lax\Ï5¡\á}\ãKyŒ¨€60Vµ«^.-§©Ï‡¡8Is-‹J²:}Œ06F¸$Uö\Å)\"˜\Ý\ry­žªØ„*…\í\Ôv\ÐH\ì\Ø2jÄ¯°“^{\âMI¤uµVÿ\0z°«S\ÙÅ³z4Y¤dKp÷wO#tcÇµ[P\0ªV\Ñ`uö5nC^D¤\Û=\è\ÅEY#>\í¸\"¹û€	\àfµnG9¨4»g¿¼6FrÇ·ÒœU\ìL\åÊ›4\É\ãÓ¤i©½Àª¾\r‹u,\àªµ½s]\Õ\Ô\è1“\0c\é\Åxf£\ã\ß\ìNE³\Û\"ƒ\Éµ\èAY=G\Ï3\ÞoQ^F\äb¼&þ9 ¼š\Æ=W4\Ù~/\ÞK	U´@H\ïšÄ·ñÎ³;M:\Æð`TÖ¼¢m…‹„ýN–\Ø£Š\Ö@\Ø\ëYöƒ€Ml¨µ\ä\ËsÞŽ\È`\ÅW˜‘\È\ëV\Ø{U™G=*V¥#G-p¯5\ìZcFzk\Çt\åûV£û\â½\Ú\ÝpƒŽ+ª’±Í~\ì¦IFNj?>|à¡­§ñ]<ƒ9¥ŸºR¬’‡­[c\ÍD\ÎqC%‘\äõ5É“Šs«\Ë\Ô\í\Ýi(˜\ÎI¤\"¤\Ì\åHQ×½yî½§¤òÅ¼}\àjô‰¸^µ\ç\×l³\ë(›ŽP­kLÂ±¬\Æ#X1\Î\ÓSØ’b¦\×!O\Z¯br+—ñ\ÎTÿ\0vÍ”$\×E¢\æ¿Ò¹ðp+CL¹X.F\îÁ¬(\é$wb®\á$Ž\á0¨Ê”lŠ0¡ˆ\ÆzW¢\î4¹\Û^A\â-©ª¾Œp}k\ÖÊ§š\àõTÔµ\ë8\Æc\ä>\Ùéš™t;°UU*ŽO¤Y\Öø}\r2\Ù_þyƒ\ï\ÍtˆãŠ¡\0\0©Tñ[Eœ•e\Ï9K»l\Ñßžô\ÉFñ€jù©A5¢‘‹B¦øûÕ¨®3jf˜Wª™&¦TŒ\Ó\ÒRµ“\Å\rLn\ãU\äþU¬fd\âoG6üsS£\æ¹Ô»\\ðH­n7Z©\âA¯J>\Ã.8®7ÊŠ\êõ\é\Ø\Ëß\\\\2nU$ó\\8¹^hö²\Õjo\Ô}\Ë!SŸJÁ\Ódl¹>Š+Bù¶®sXºL™7/\Ó\rŽk=OJOC\Ñ|-¬\Å¦ö e=\Øv¯[ŠaŒg$W\Ç%Õš\ÖxvdS¹H\ãt®\Ï\Ãÿ\0\Z\Z\0\êÖ¸@\0ó£\çq_E‚„ýŠmi\Ðù||¡*\î\Ï^§\Ó[¨l6+\Ñüe¡k«[\Þ\Är\Ã¦ºdº…ðU¸®Ô5\èXÁB1V¢qU·-9dP<U\Í\'zo\Úc9\É\à\n e\Ê¦”\"3T‘\r—…\ì@ý\ìf­‰–E\\zrk-\ê«\ÅMq:ª >•dÜž{”ŒŒõ& ‘dô\éT-‰.\ÒHIa\ë\ÐW=\âÿ\0i¾·I¯eTN\Ëül}w¦ˆl\é\îo#·™\äUQ\Ôö\ãv8—Ä·º•¬#60Kµ_»\ãúWŽø\Ó\â\ÅÎ½\ÚY¤¶°;²~g\Ï@}+W\á_\Zt²†\ÉyNF1Ò¹q²q¢\ì\ÏK+‡>!6®^›\ï\r\Éö}RD#ýrp}\Ô\ÒJIA\\N©ª¶‰«i—N\ì\í!d\ÇpkÈ¡\'\íbû3\è±):Oª>™ˆ,\Ö\ê\ÙÇ¥9\0ç•¬\Í:\ïÍ6¸(\à}i\Ãq/(2\r{{¤Ï˜i¦\ÑI«×™\Þ\"\ê_\ír„\Çcb\Ç\è\Í\ë^±s—A”ú\Z\â´xP\êZ¶¡Á7Sª¡Ý„m\ÅsU5—™ßƒ­\ìUYut\ÜW\ÏCZ\ê\Î;\ÛY!rÊ²eN÷¦Š?*$Œ1mª\æ\êq\Ü\Ô\Ù\ëQ31È¨hÏ™‘°\'5JAW·™\ÅR\äÔ±6Tz© «\ÍWp\ÍfÁ\\pj±û\Õj\\\à\ÕÀ\ÍfQò*F\ìx\n¬!š\å<-\â{/\é©yný$t’3ÁFF+ƒZZ\Å\Ükgt\0‹³\ç\Ð\nø\ßFñ«\á­K\í:dÀ¶\æ’ažZÁhe)\ÚHû¨É¸\n\\ñ^EáŸŠZ«‚òQet1”ü§>^¡\ÔR\"²:º2‚H \Óh¸´\ËnrµY›¦hóqÁôª¹\È<ô5”b\É_¥CžH¦–´\Ü\Ö\Õ1\Ø\Í&0)7TlÇŒõ¬\ÙwFH\Å2G\n	5]¤\è(&\åØªwSª®3\Íf\êzÅ–•i-\Í\Ô\Ëq¯,\Ç¾mñ\ÅK­V	lô°ñDù9\áŠú-4®g)\Ø_Š\Þ4W¼:E”Û­\í\Û3:ôw¾‚¼Š\ÇPº\Ò\ïa¼´•¢ž&Ž½Aªd\äó\ÐS•	«QFg\×>\nø‹§x–Î–ú‚\à<-À“ý´5\ê0\Ê‹ñ¯€­•¾ð\àŽAb½;\Ãu\Í%µøö«À,q*cÞ¢T^\è\Ö»Ÿ\\’¤nž¬À5\äzg\Åo	]/7O¤\ÈG\äFA®\ËM\×ô\íN=•\ÔW>ö\Æ\ìk>FT\âÎ´\ZqX£RP~pTõm.“–¥cD\Ëù\ã\Æ9[\Ì\rüT\Æn»M+	²c‚9\ÅBðœ\å]¨CJ2w\Ð.eO¼¹¤! \Ü\ÆHsž{SX«J\\°\àt©a \çZ\ïŒ4}1\äI¯:uD;ššNDNj\' 5\Ô{¶†\Ö>³\â=3B·3\Þ\Ì{¬\ßA^«ü[X\âÛ¥Z¸r0dŸ·\Ð\nñ\íKX\Ô5[™./\'y¤cœ±\ÈAU\ìdg\íQõ„|aâ‹«›`†\Þx\Éd‰\È;\ãõ_R;Šì¯¯#´´’flÕ«\ãŸÝ¥§Štû‰eh£ŽB]\ÇÐŽkß®µŸ\í]yQ\ç\ïXV~\ÏC³\rY§\ÒúœOŠ¥Qcp\ÌÝŽ\Z\ë~iN\Ð\"•\Æ\è	¤^‚¸_D÷‚\Þ\Éî¸Þ½óM²Ž\Ê\Æb\\E\èE±šO\äu¸-N¤’i«\\õ¨\åfÁ\Ï·8‰MOP\ÆÀ÷©\Ç4X\nò­\ÊÓ¦£ˆ–\éJ\Å\"\â§\ç¡ƒ8©ûb™HB Š®j\Ï\ï@™)‡\ëO=i¦¤–WlSM<Œš‰þõK\Z\Ø;³^[0Qu(^\Îk\Õp@\ï^Q1w:\äŒH\ÕËˆ\Ùž_ñO\Ñ6ŠÆ»\Î\Z¶\Ü\è+\ìŽx®S\Õ{\á‰i¹Öºµ\\„Ì†\Æ6S\ê\nzs]¤R’9\È5\Ý…=ˆÒ¬½K\Ü`S…A¼Ô “Ž;t«1$\È\ÍÉ¤\ÆM <ö\â€$\Å!8\íM\Í5©¨ÁÉ§3°$\n‰Ÿh°›@¢«µ\Â) r}*/9Ÿ¶*É¹k!zš­,€TRHGrj3ncÚ‹a$ñ[ƒ4®}I\â®\Ã{\ê\nHŒA¯#ø‰ª±6\Ñ\Ç\ß+\ÂôýKV†@-¯fŒƒ• ž\Ô\ËI]Okò)¼\07ð\ä\Õ8\Î@nF}«\Ït\rST½D²´\Íý\ãŒñ]ü\0…Nk‚·\Ä{¸o\á¡g$«Ý«’‘\Z\çVµ« fWIt\ác\'=«C\Ù>±$®`pE(!\Övƒ=n\Í\"1®@\n¸\Îal\ç\"²>\Ûh‘†2¢ýX\nÆ¿\×tøÁñŽ@ \×|mcÁ¨Ù½=ù\ÎwLûj¸·ÀM\â\ß\r\Ã\Ë\È\\‘€{V5\ï\ÄM;\Ê\Õ~b¼UY™“{\â:Àsp©Ÿº\rsW?¼?lN\Ù$E¯Õµ‹Bff,Çž§§5?˜\Ýÿ\0ú\Õq…Áž\ß}ñQ\\•³€õ#-^}¯ø÷YÔ€\ÙQUQ€s\\43<Œ¡\ëz†r¥Ž\ê\Ö0I™¶C3—l“’i!šX$º0?yN¦\íq\Ç&™\Èv3=O\Ãÿ\05]-\Ò+\Õp‚z8\Å{‹ñ\'Ãº Pgû4¤sµòb\ç”yçš‡M1Ý£\ï\î\á™Õ\î¤\ZÁÀ?N+\â{-sXÓ˜=¥\ìñŒ\r\Ù‘®ö\Ãâž¹k·\Ï\Ù8÷\à\ÖN‹+˜ú‘\Þô\å|‘\Ï5\âº_\ÅM*\èª\Ýn\çœý+¼°ñ\r†£Í­\Ô.9†k7º¤v[CóP;`õ¬\ß\íD\È+€99ªj™²U\Ã*lU\ÍÅ“+\Î§‡pke‘F\â{Ò­\ì8\Ü]@\0\ç4\ì\Â\æ\Ã\Íg\Þ^CmI#\ÎkUñf™¥\ÂY\î3€A¯ñOŽoµYZ$|Gƒ„\äUF-ƒ’7üe\ãV¹gµ€NüóŠó;~ÿ\0N»ó­\æ|;“9}CXóNÓ–$ý*¸nGs[(™6}+\á\éú\Ê,\"¸_½ñ“^Œ*GcŠø\Ã 2œ\íe9\Z\ëôŸ\Z\ë\Ú;lˆÁõ#=3S*}J\Ç\Ö\é6\îØ©\Õó\ß9¯\Ñ>%\éwûwkyz2¾1ŸcÞ½+\Ø\îc’©Vr\ra(´j¦Ž‹zQœÀ¬•ys÷óŠµ\Î>ñ/˜%©\ã9\Æ}\rI½1Lg\ê1NÄ¹XJ½dÀ«Kt}üŸJu\ÌñD¥\ämª=}+Ê¼E\ã8-D‘[¯\Ìr7u­#\Ù\Ö\ë\Þ\'ƒMµ+¹UÏ¯\"¾w\Õõ†¾¸flžI\ÇSUuZ{¶ggcž ô&±\Ã§kx\ÅD\ÊN\ç«\Ý\Înt¨¤*wÀ\Þz¶yŒ ´„\É\ÝZ\Ýyú**\àŒm+Ö¸›…ýóc«Fq\êG	\ç®+Mc1 \É‡\Î=\ë1ÊœV¤R®\Ò\ÌJ\ì\àó‘ThG2˜\Ôm+Œr\0ô«*wª¯\ëÞ†V‘\Ç\Ì\rþ5s\0A;t4\0»B’\àóƒŽEE=¯\ÈYF2NkNRl1áºƒŒ\àö\ÅO%ªÁ3¶Nq@\ì‚¼\nŸþµkÀ)\03øý*¤±‚N¼w4\è\å	ógÞ…r\ØO3o#?\\s\íZzzŒr\n\çô²dA\Æ\áƒ\èH­­,oc‘\Ûh¦\Ü1\Ü{úž•\ë¨ñdn(p\ÍY*|²\ÅVfT\Æp1×SVAÀ\\(ŽR¬AÀ¦<\0Œ¯^„w\ëZ·¢\'™#>\Ý;f«y;\à¼*L\Ç+†|g€~µ:‘»¨éššuø>\ä\\b«g `\Éõ4¬Zb°\\ƒ8÷­[*\êú=\Ñ \Õ¡.¼±\ç\ã¾k{Cºû\Ò\ÄBa\Æÿ\0Ò¥\èŠ5?°/£PÀ)\' õ\ï\ÍgÏ¦_)VtQ×¡\è\nô˜\Û\ÌL*“•üx\íY—\ÄeC™1ƒŒœô#J…6¦’>\íø\Ûr°x4£õ·)\ìx¯\ì\ÕBƒŒg>•õÇ¹•t}:\Æ^à²‚=|¿h¬#<c·\×½\'¹\äTz–\n‚I=*X’q“V\08=¹ª™ùñY˜d#©õ=\ê\Ü’\ê*Û•)ƒŽq\ÍTw+\Ç~¸Ê¤‚›I—\r\ß#\È\æ¦B	Ž8]†\ã\Ø\ç¶1Š\\\071Ï¿Ò\Ñ;\Ê\Ã<\ãŠÏ—2’ñŒTï¼·C\Ï^2}\ê-\Ã\Ìl’I<~Ñ´LÍ†<„ug+Ï®>PC8n™\æ£\ÈLžcWsª\"7\ÊXŸJ•A8#¯\Îœ‚­Oœ¼Ó¹²DAº\É\Í2Tö\Î\0\'Ò›,‡{ÜŠj”$o\îry\äR¹V 	ÁlgÓŠ£(‚pNkNf€Ê¼µO\ä\È÷\ÏqE\Â\Å6\' \0}\èE|ƒž}j\ÙQ\ØR;l\ÉƒCe$\n»V£l±\àô9õ¤3—#r\íÇ­À#ŒœT\Ý\ZXT@\í\éù\Z¿÷}»\Öxu\ì2{v§¸\ç¼š.3EI<ñù\Öþ˜\áƒ\Ü\×,²1<}*ýÇ•(nžµ5‹±Õ†š…X¶u\âÝ™\"lü5£\î\0\ÎAõô¬\È/\í\å \Íj,3ƒ^=E$õG\Ù\áªR”,‘\Ò\é\Þ$¿\Ó\Èd“µ\Ø\éÿ\0§2l–\×zg’¾\Õ\ä7—I\'¶x&ž†8\ç\'œ\Öô±(­91X>2^ô}\Ñô\æñCºQ¾)³¯\Ç_z\ê \×tùFV\æ&þq_&\íYs½Aö(\Ó!|<\Ñ@\Õ\×\Ïù‘\â\×\á\É&\Ü$ýõ\ÑÔ­\ÏI\ã?Fº•º¼Ñ\êXW\Ê\çK)Žò\ìzüüsO6‘o+]Kÿ\0mH²\Ìi¾‡Ÿ<è›¯è–šKø§}pÚ—\Å]\ÝY-]\îŸ?(‰sšñ\Ö\Ñ-g8<„y$\â­8Kk\ÝÄ‘…\àRž6V÷PQ\Ê`\çj’e­_\Æþ\'¿Fh\ã[HI\ÎŒ\æ¹\ÛY\â‘\Ó\Ï9f\Íej:‚ùm\æ\Ê=†{\×*š\Ôñ\ÄQ:ó\è+*•£©\éÓ†5d¾Gmy\Z!iTv®FmUç¨R©Þ²MÌ·Mû\Ç%…E¸´¡=\éF‚J\ïQ\Õ\Ìg?v:#\Ôü\0¹?\Ç5\í°ðƒ·\âPnS\Æ:W¶\Ã\Äb¹+{³h\Ò2s‚l|Ï…cÒ¹«©	‘@9õ5¯y6#\Ås…\ËK\ÇjÇ›T+h\Îÿ\0LÁ²M¸\é[Ð°P+š\Ò4\Ïz\ßSÀÈ¯J›÷Q\â\×^û/n\Í&þØ¨A£ œv­9Ž{\n\Ü\ÓÁ ÷\Å4“šM¶	–¨\è\ÏQUebªk6\Ë3µ‘o»\05\å&G¼¹y[«š\ê<M|Ï¶\Ô¼¸®v\Ñ0FMy˜™\ÞV\ì{\Z|°\æ{³M\ÓZ\âa\ZúU‚\áA\Í`\\\Í\Éùºt®C½”®%\Üx\æ»M*\Ó\ìvh¤\r\Î75rz]°¹¿V •O™«S\Ä^)\ÒôXO(/Ž#NXûWM©Ç‰zY\ïŽu„¶°“Àð£8\Ë‚¾o%¤\Ée žIÇ­t\Þ\"ñ%×ˆ.t	\n\çdy\ã\êMsY;½»b»¢9-F\00\Ít\Ú-\â\Ú8w\â¹\Í\ÜóÚ´\í2=**+£¦–’Lõý4‰	\ç=\ëwnyÆ“­¬\r¶bBñŠ\í\"\Ô#œ~\íƒdõ×“R‹=˜N2Z2\Ü\Äc\Îß¼’n:u\Ål\É2\ìÁ\Ç5hi¿ñ-–biW ûRŒMI™\Þ¶Î¥~qÈ¯g…@Zò\ï€—±®Óœ\Zõ\Éø\×L68q\Îó^…‘AqŠq\ëQ\å³Z\\óDozBE!\ã4\\\ärqŠa \Òg4\ÒqL–g\ß\Ì\"…›\'^-¥\ÞM{\â‡\ä¦p+\ÕuË‘¬¬\Ü\0\ry7„dY/n›¦K0­`c5sªÖ†a<\äbªØž„j»¬mòp?U,W-}dz¹n6†°5}DØ£É…RN:\×F„¯8ñ”Œ¶’Án?:Ê”o4Ž\ÌD\Ü`\Ù\Øø\â-µ\Ì*—Co`õ\é¶Ú…½\ÔBH¤WS\Ü\Zø\ê\ÛÀ\Ç \Öö‰\âCI™S1QÁ¡\è¨[c\ÇrR\ßs\ë¡µ6–\ÐgËW\'\'\Êxw\ÅVšÍ¸ù•eW5×‡S\Ü\n\Z#Ru8©«\éUÌ‰ƒ\Í `\r0-q\ÔS\ÖB*©˜`óÒœHÏµ4\"ø”z\ç\"\'­RW\Ç\ëI%\ÊF2\ÌZdÈšG°*4ažjš\ßB_¯>´’]BŸ1uü\ëD\È5‡Õ¨¦ k•“Äš5³,r\ÞD¬\Ú­Ç«\ØO“\r\Än=˜\Znvb\ÙgÄ—\á4©3\Ã1ù\×-o)\Ù\É\"®k’ùöw¦³-\Ô\à\ã\ë\\u\äÜcH|\Æ\ßM”\'®b\ØJ\ÖV\'¾jÞ¥.\È_š\åo¯~É¢\Æ\rM(¹\Î1]]k\ÔP„¥\Ù3„Öµ3w¨LùùT\à{Š\ÉY\Ë÷?Z§½Ì9\ê\r0¸’Àc\×\ÙÑŠ„#\Ñ#\âª\É\ÎnOv\ÍCt\ç`ŽW\\u ô®¯Oñ~¿¦F>Ïª\Üs´ò§Ã§“Œ;±ú\n¹\ì\î|œ3ò1]Q³0m£\Üô\ï:•Œo,\Ò\âC\Ü>:Ô“üañ^ \Ø,`·U9\É«\ÂÆ¡uS\"¼\íP½0\Ï3\îý\á{4ýœ{\ÌÏ 4ÿ\0‰^)ŠU“S{1\"FËŸ\Ë8¯LÑ¾&xZýü¹.¥·”ccŸc_ [\ê3\'\É\Ítvs+;•~8¤\è¢\ÙõÜ¾1\Ñ[w’²K³¦8É®WSñÞ¯j<\Ë{\Þ%\êd\â¼\Â\Ó\Ä’\Z2@nWŽEi¿‰\íD3\Äñ’\Å6ô9¬ý”Œ\ÝFeø·\âÇˆ\â“\ì–¶ª\ê2\Ç>\çÒ¼j\ï\\½Ô®D\×sMu1?3H\å=½…]\×\ä?\Ú\×•LQ“\É\ë›D’MÝ€!‹\ã©ôÏ½W-\áªEûø#š0¬\nóÊ¶qÀs^\Ýð¶M(;®Æ¼b+iœ	\n\ç§\0ú\×\Ñ~·Xôh\Ø\ïù³Œu®\ÅZ¬‘\ìe_\Çô‹;YX„8<Šò\Îûa\0\r.\rzû…(á³Ÿjò\Ëjd60q“Þ¼¼y«\Äõ±\î\Ô$Î›\á÷\Äxl€ÓµIq\nq\Ãûjú\ßR¶º‰g‚\á%Bxt \×Â…!.¤‡Á\0\ç\"·t\Ï]h\ÉýŸ©\\\Û+ž€«W¿\ìmšuo-O¶þnvÉ9N\ÕV8\Êt\ÃÇ¹\Íyo„<mi®\é÷7G{	)4e¶\çÑ€=w–º’H™WV\\v5\É8´õFÐÖ‡B§<âžx5M/Qð1ŒŠ{\\ÇŽ\re$h¤+\rRv\Å$³.sš¥-\Òõ›L|Ä¬AVYõ5Z[\è£sõ5\Ëj:­œhó\\\Þ\Åh3\Ë\à\0+>F\ÇÌ{­B‹\rÛµr÷º´\Ð\Ç,\Òl‚\å¥v\Æ+\Êuï‹š]“˜ô‹gºsœ\Í Ú•\â~$ñ¶½\â&\"òå¼±À†?•1OÙ´f\ê_c·ñ\ÇÄ¹µ\æ\Ótþ-e Ip\Í —\Ð\Zòa2—\È\ä{ž¸¬\×bç‘Š@û;\n¢\rVHÄ²z\Ü\ÒüM®h¬M†£<@\ã)¿(q\ìk—ˆ\å\ÆO9©I\ã;i\Ø{ß¤ühÕ­ö&©i\Òw’/‘\ëÒ´ÏŠ\ÕTµ›gî³®\ÏÖ¾D\r\ÉÁ\âü\à\ÔN	šÆ£>\ê‡VÓ®WtpH?Ø‘M\\I’C\Ãýk\àÔ¸’\Ì,ñÀ\ÚØ¯TðgŠ§\Ñô[›©’k°.B\Éó/³\\²ƒFÑ¨¨]\ÂõaMiua\Å|»ñR\ÂmM.\Ò\Ò\ì4*Ñ…ó9>•\"|`•KôüŒÿ\0•Ÿ+)\ÔG¹\ë^/\ÐtX]\î®s·ª \Üß¯(\Ö>3[\"0\Ò\ìžV\í$\Çj~C“\\—ü,ù¯n\Ýt\Ûtó\Ûc1\Ë}\ãŽk\Îõ÷Xu;˜UV\'#T£\'RW%\×<E«xŠ\à\Ïr\ÒÑŽ>‚¹¶$S·síŠ‰°I\Í1\r\'=j\ÌY\0\n®\íVmiKd\Ê\ÛG5\\š™ Q·µ]‰¹\éÒ­\Û]\ÜZH%¶–H_û\È\ÅMW\Ú\Z·š\Îö\Ã\âg‹¬bò\Í\Ò\\ vh\ÃÎ·t\ßx\ÆôK:_\Å\'˜\Ì@¨Ç§LW’€ø\íZ±-\ã\è\Ò<YdK€¤(\ä\Ü\ãµ.E\Ùœ»³\×Ï‰5›¦·%š)]~TŠ5Uâ¨øþ9O—¨\Å8BxÂŒ\ì+\Ë 6q²o=\\0#8¥\Ñ\î®\Zô¶÷fÁ8\É\í\ëC„{\"\åÝÜŸ|_#eg‚4W\Êõ5‘uñ\Å÷D\Ä\ÖTÁ\ÏÉ…®NBŒN9<U&P¼ŠžHöE©Ë¹\Ó\ßø\Ë\Äúž\ãSŸ\Ç\Ê\Û3ŽüW2\\ù„“¼·rrjô\È>ô„•¡¦’C½\Ë\ão©ª¤\çŒR“¹H\Å3\Ë\ã=©\ØW54\ÉR)c\è2ÀW¶iRnX6×„B|¦\íZ \ÚBA\êƒ\ß9¯7$\Ïg+•Ü£\år\í´i?Šô\Ä#£Ç¸¯lxeD\ß\Ì:\â¼S\Ô\ã\Ðõ};R‘IŽ7a v°#?…{O‡|S£k\é‹+”¸©\á€ú\ZÂ‡\ÂV;Zžˆ\é\ì\î„\à/Fj\äˆ$Lj—–…·¯*Ú¸uWJ8\å˜Ae9\\ô«(\Ê\ê\æ£{ñU\Ý\Ìvr§\ï{{\ÐQjnTñU£|t«D‡¨ÁMF3õ ¥ TÙªqIƒS\îrF5	4\æ9\ã@›\Ó[\ëA\'­D\Ù\"¤Bb¢—…Ò¤9\ç<SCŒT‹?/¼·W„\Û\ë3Œ\ä?\ÌÖ½)IŒ\íéŽ¾õ\ÏxŠ\Ù&…nB~ò/\ÔV£xø*œ•,ö–‡1ü>Õ—w\Ð\æ´Ñƒ)\Â\æ³\ïPùDž•\ÇmOjú7„&ac·\n\ì:\ç½v\âE#5Áø\æ\ÚP{JÂ½¢V\Æ+¶ŸÀ¿} 0)\âJ‹iRq)\ã=À5ª9™0f\Í\0ú\ÓG\Å=Ni\0¹ óQ™0z\Ôs¡\Ã6ü\0)ŠŸ/:S°®+7µ@r\ÝzÕ’0\Ôj¡\Æ2H¦!8\Ç\ÌW\æ\Í@Ì¹\Â\âž\Ì\î}¸  S\Ï5H‚dsÀ\ïD¤ª€)\îÀMsº®¹m¦Û¼³uÀõ4Æø‚\Ò\ê\ÝT^œú×š\éLC¹^;Z\Óñv¸Ú¥\Ñ~\Ä\ç\ÌX\Þ-¶ü\ç\æþ•j/”¥4¦]ð\Ðw^F	=;ŒW¤Ç¸\'ÍŒ\ãž\Õ\æ\Þd¸ˆJ½1ŒûŠô³þ¯\Ø×™U{\ç\Ða\é&Œ-VmIô¯)º¹¸I\ÚX•\ËAÁ®û\Ä7‹.±šó)obt8e\ÜA fµ£\Ý\ìcŠ©­q§R»»y<\É\ÞA\ß\r€)EÌˆU“;†}úV´è’¶H5u\å7Àp:\Z\îQ<‡4\Èu\rJk¹›\Í\'=Cl%vù÷\ç\ãY\ï*¼\é“\ÅG¼€U[¿•h¢`Þ¦´÷$mn™ª\à\ãQ¥õ\æš\ÝV¢C\çrI8\à\Ó3\ÓÑºÒœp¯Zo\\ñžõd–=:Rƒõ£=)WŠv\à\à\ãÞ—§OJp>\ã‘\éA\éN\ÈW\ZÆ—ŒSŽ0;SM@„ÝƒSAs$.\Z\"\ÊÃ¡jqMÇ¶}ECC:µñ­${Z\í\Ôm\ÚjÝ§‰µ»Y†\åò=ø#=+‘Œ©^IQô\ÍZ„(—‰qŠ‡Y\èüBñ°1ú²Žk¼a|\Òg\'\Üý\êÎž\æ‹ƒ¹ˆ\ÈÎ»gš•5/¯\Ìò\ïPA\ï–\Íffœ\ÅFxÒ’x\äU¨\ØWv•(\Æ<ã¨¨Êy\Ç…\á{{Ó°·,\Ør:g¯­1¶ƒ€qšü£iÇ¶i¬\Ä\Òx•sœf¶ô\ÝSÒˆ[{–TR\0F9Z\ÂL…!ó\ïLu(FN{t¤\Òb=§Gø…­2a£µŸŒ°\ÉSZ\ç\â¥¿¦ Á\Ç‘^l	‡zD\ÙB7H§\×Ö—\í.:H\Ù\'¦sŒVN/#\Ý\â<»[þ%Œ¼ÿ\0¥cj\Þ>\ÕY<\È#Ž5ô\Ü5\ä/4\Íó	A¯½@7&ü\àœ\ÓT\Ð\î\Î\ÂóÆºÎ¡”’@ ö\È\ÜN]™\Ë|Ç¹¨\ä221U†\îqž+E€qù>´ *úŸCL^;õ\äfž8\'ÿ\0\ÕE†\Ñ\Ðiw\n¶\í<“À\ä\nË¸\ëø\àö\Æ)‘\È\ÈÅ€<\Ð\ï~l\äå©¢yD\\3[ùU\Ð\Ò .6\àˆªˆT7B¡9\Çj\ÒUAB}zuª°™$e^0	\Û÷±\Û©óme‘\Ç^¢ª\Ý0¨l9h\Ï\0r1\Í&„6‡\êy `þ5¡wu\æF‘† \àú\nÄœõ\Ü8#\ßibŸ\0+“€OÒ„À|L\êH~§9>\Õc\ì¯),¤cß§=sU˜m;²2}zŠÒ¶‘°»½±ƒŽOÒ¨\nÎ£‚zdŠ\ßÒ£\Î\n\åNI$\ä\ã™:mÀ’O\"¶ô”>@\'\å\Èð\ëÒš%³qrQ¶\à†N}û\Î{*h~u\0r¼õö§OONCÖ´\çz‹”ºu*8=	\ïV\í˜8$–\Û\Ó=8ªº¢0¹eg\ãc {\ZÎ¶œ\ÄãŸ>•›.\ÅË 0\Ùô?Ld\È:`~#¼\Õ\ë¹<\ÔR<‡ ª‘¯<g¯ù\ÆjnQ „1À\ÉÁ\ç\Ü\Ó\È\Ø\Ûó“\Ï\ÌxÁT`AnO_^µi—ÌŒ\à›…Á\à\ã¯\áQ\"\Ñ\èºE\Ï\ÚlÑˆ‚@\ÇLEÜ…\î0…Ÿ=ºc5Š\Ò,}Où4\ïšM@/\ï9\éšç¾¥\Ï\á>¯øût\'¿Ò­C•Q¹üx¯	¶‹d8=\ã^±ñ\Ê;\Å\Ñ@[\'\ç-^e\n\íO¥z\ìð\ç»!*B\rTL\ÈúVŒÑ€„rsž+)\Ü\Ä\Ã¯ö¨fe„Šr;t\ÅT–“€•g\Î\ÇL÷\Ï=…( òyŽH¬g4•,\Ø\ãð\Å0\ÄËŒ	«²®\â\0$c“Š’+)Ê–H¤Á\ä})\ÆYF+€0N}\ê«!/ƒ÷³Ò´š\Î\Ö±Ò¨<r“ý\ãž1\Ï\áJ\æE{\ØWp# cõ=ª‚«8\Ç+P¶[¦ó\Ø\çµ`\É\ÙÀ\ÆERgdŠGLœõ§1\ä’\ÓÖž ¼Þ“~xF\éŒJi>XÁƒS¸Ž7gV\à\í8\Æq@\Ê\Ò2ù‡n;\n„lÁõ\Í4Œ\ãh\í\Ï\'™b8#ŸÖ‚¬]¤…9\ê2*\Í#\àŽ;÷§¡\çqŽx\âž !Kƒ\É\Æq\ÅM\ÊHBWn\0é‘œT,\0\ÏlpENbcŒžx\çGrA\àž¤ŠC\'<œ\ëK\äòNr	\ã2\ÄR0\ßx\âš7Ž\\u 	\à \'ó\íøT™a\êG\íM\n\Èq\ì)\à°#ƒ\Ð\ÐU\ÉRR‡\' Ž•©§$I\Ô\ÖV\àù g\'\éŠzª¡$Ž¹\ÇÖ¥\Â2\Ý\Ó\ÄT§ðÉ£J\ãRy\Ð¤e«v\ÛT¶òo\Ú\Üf¸§U3ŸC\Î)<\Æñž1\ïX\Ï	+\Ôs:Ô¥vùHŽú#‚’‚+^ø#slt\Íy/˜\êrûóHg˜‚¡\Ø\ßÒ¹ž³=\çšk\ÖF®Ûˆ¹ô\Í!Ô¤?yÀ×Šòa4¤á›Ž;óRy²7,\äŽI\Î)\ÇgñS9M;S=‚\ß\Åÿ\0\ÙøVòYGn„\×¯ø¢\ãRS²c\ÎI\ë‘S¸\î\Üi&\ãS¡8\é]‘¥¤­yNnKK\Ï,²p\Üu=\ê¶a½Ò¬®d\Æï»ž\0¢L’\0\Ïoj«XË™	¬I&¤‰þa\èÆ“\å\Ï\ëRF¿8=1Cz\Ï]ð<K¸‘\éÁúW®‡8\é^i\à¸Dv\Ù*FW¯@2ex«Æ­+Ô‘\í\Ó_»¡Nñò3œ\Õ8 /–÷¥º”\îÀ={U\ÛgØ€u¬“Ô¦¬Ž«O£¶@yô­ˆ\Øµ‘mr@Ê§óˆ=kÓ§/uh¾vk²dpj³nB1Ú©}¬ ù¤\êj´š¾›%\Ü`ún¯˜\ÅÁ³U\æa\Û4‹<yÁ8#9\Í`I\â=*6Á¹>Íš­7ˆt™¢\ÊË¼t©s]\ÊT\åÙI¹‡¦\ê\ÈÔ¯8X“Ž+MJ\Ñ\ÛtdžüñY\ZÖ fQ\nuq“\ì+\n•’‹7¥A\ÊK±’\Ò5\Ý\Ã\È\Ç\ïšÑŽ-\ÅR³ˆ©\É~g™\Åyrmž\ÜH­w2\"\Zä¯®‚©#<w©µ+‰¾\ê~©Zh÷:˜*\Ò2FY‡s\éN1¸\ä\ÒW9»\ÝwT†&H%0	G,½k‚ºó%\Ü\îY‰9\Ü\Ç$×¬j^x3Hy\àŠ\ânt(A9.@\é]”\ì>£\ægŸÈ£$çŽ§µFI<\ÍuiP.\íÇœ\Z\æg_Þ•\äÒº\âsµfE•\èkNÔ³g#mSH²\Ï~54{¢~£\ëÚ”£r \ì\Í0¤Ž¹§$“ÀÙ\Êñ\Ø\ÔQÈ¿(š‘ö„l÷\à\Ö.B™b\ÛW¾Y—|\ÌÀv5\éi\ãXZ\Ð\Ã4D\\\ry=˜\Ëu\à\Ñu6JŸR;ñP\é§\Ð\Ö¥\Û<1«Xy\ï$†#^‘¥l\è\n\È0}\ë\å8$¸€aK.\n\Ôþ\Þ\ÖcEU˜\íF*9	«?j\î}CÁúNi1ùf¾\\ \×#ÀK§SÇµkE\â½v(U#¼lñG!+>Šó*6zù\æOxž/›=€¿cX·#ñ6õj3cœ\Å>FO#>šy\ÑfuP;“ŠÂ¾ñn‹`\Ët„¨9Tù|\ç-ý\í\Ç3\\\Ì\ßW&¨»ñÀ\ëœæ«\\‡c\âŸ]\ê\Ê\Öö± n7\ßoðª~	’F\ÕSgB5qÒ†uÁö®\ÛÀ\Æ4¾$8#ñ5OH‹‘]#\Ñõ–\Ä8’k6Ä•sƒ\ÐóZ\Z\É]±¯©¬«bU\Ï^+Ž£w;ð‹•!•–:ò¿\Î¬g þU\éŽ\Ã\ÉÇ§5\ã~*Ÿ}ðL\0\ÉÞž^¢++Aœ\ëIÂ|\Ô.»\í\çùUw<\äg4ø\æ,:\àžµ\ê(žKe»]F\æ\ÝöA+¡\ÎIS]~)Ö”7òŒZ\ãRLI´{ŸZ\\\Ô\ÜD¤u§Æ¾#_»}\'\çS¯Ž<S\Ú\íë‹v:d\n¼\àc¡©\å*\çug\ã_0%&ß·»ŠÕƒ\Çþ.™¬Ý”u}‡¼¢[™…‰˜m9\â»M?\ÄúºØˆ\Â	)	\ßÞ‘l\ë\âø\â\0‹u9\Æ\Ö5çµ—vù#LrA\É#=«Ž“\ÄzÀ$ý¸\Æ+:R\Ï#Hï¹Ÿ’h²M³£Ÿ\Ç\"‘UR\ë\ËP1òŽk\Z}gWºÿ\0]{;ý^³ö\ã\Üv5KóSH¾RmÍ¸±\'>¹«v÷÷0’Ryp®ETlð\íQò \ãñ ¤w\Ú_Œ5y\'†\Ò;†Žo\ÞmûÏŸV<â½’s9\í_6h@V\â•}+\0t®E”‘\ê\àõƒ)j·`z\á<Ura\Óm\ãÝý½k«\ÔÙ¼³šóo\Ü4\Ó\ÛD¤Ÿ©®Œ½_#›2—.~vG5\æw?…&ñŒ\ÕR@ VV=\Ø=O9¾ª>ZHr\Í\ËwÎž_{«\Ç\0šŒF\n\î,1\è)Nk¢,Å¢Ú±+Œ\ç&~\\òqÞ¢‹\Êôþu\Ç5*((\ÍùVé™´Z„±lòz9­XY6H\å\Ìe\0*˜%¤c\Øzb±’VC9^˜#­l^\Üh{‚\ÚZ]°U]\Í=\Æ\âI\à P+TbÑ£l\Ær—\Ñ\Â1÷œ±\ï\ì	«U€œ*\Ý\É1||\áJ(üO5Ïµ\Ìoþ¦\Ý ž¾\äÕˆ®¼¤ÈŽ7 w\'‚}*´Eö™m‘\Øù‹’ßÖ˜JG\n\Ä1„5XÝ—qûˆ\ãD^Tr{“šŽ\îX\Ü\Ç\äŒŽ0NO,\Ì~†¡¤m\ìSJ\î¨Àa›ƒßž1_N\è-¶k0Dk‘\ïŠù\×\Ã\Ó\ê:¥µº|±\É\ç*+\é›xLPªŸLŠðójŠð‚õ>‹(§¤\çòD|Œ:{×‰x\ÖQý¤ˆÙŸjö«ÀB1ö¯ñ‹\ãV#\ï\r•Ë–Çš¿¢fù´¹pÿ\04s&uHs‘œôªL\'*Ì›Ÿ{I8 \Ô>$Àú\Ô$‘\Ãc_F\ã¡ò®Z—¥°\Ô-]4±HJo\È\ç‘Á\Í]\Ó|M­iÅ¾\Í}4 I\Æ:t5Ê°>a>Æ‰1J9ÁR	¬§{F¶=£Jø™p¶›»\É\ãic.\à2}«¤´ñþ£s.\Ûy­.\ÑAû¯±\ÛÓƒ^/o.˜°.ðr\Ëó\ès\\\\\Ö\â\Þr\"g\éó\ä\\®±4\ëT›j\íXúWRø—\âôI„Šv\àœ¯\Æx\ë\ÄW/k\Ãn\0\Þ\0qž\Ü×’Z\ëZ­„Á­¯\æB¤e7exö55Ö­y/Ú¥„\ÍÔ¨\Û\Ó\éS\ËÆ®U˜\èu\éõø.G\Û5	dùr+‹º¹yXùÒ¼£=	­[\Ä7š¥š¹nÓ‚«ó\äqÉ®Ri\É\ÈcIŽ\r\ÛS^µ’7^	Á\Ú\á‡\ÓÖ¹[\ÆÄ†>Ã‘\Ç<ÕÅŸ;»\Ô¹¾c¡\î?\Z\ÎJ\è\Þ:\î\'>´…2\Ã\'Ž\rY\å2\Z@ŠÀgzÏ”\Ò\ä \Üf¥ù”\ã4\ï(\É!HÁf=\0¨°Ù¥aÜŒ9‚iTøT·ªƒP\Æ\'˜\ruvž\Ô\Ô¿\íK·=2Eqõ­eª\Ãib\Ör\Ú,ñ<\ÞcŒI\Æ1‘X\É\\»˜ö±¤’vŒ*J¹û\Ã<].°4/³\'ö_–…Ž_$–Ò²%›I\'1X”¨ó3Š¨\Æ\Ï,$\\\Öv\rIôDWÖ¬C“\í\çó©<Eÿ\0!\ÝG\ÄNy–ºŒ6R$‘[)t ò{Š§}ro¯&¹u\nÒ¶\âIH£\Ð\â“4\ìfŠv¿\ÃS\'\0TC?­J*\Ò“@¤tö­,H\â\0¤Ýžô™§c¥l:·QW­o®\ì†\Ûy™°þµCŠp;M6¢\Öu”H³\r\Ã?\Â9ú\ÓÆµ\"\í\Ì0¹ŸÊ°Á\ç9¤/Ö„u:<\Z\Ìo¨P\ÆU“cpCu\ãÖªk\ÖúOi’´ˆ\ë’	?/\×=\ë$°X€\r’ýjÖ—(\È\ÙA£h§\Òd\Ñaˆ3N\ë\Åc4\å#?‰ŒúW¬øR`ú|#<®\á\Ï5\ä\í\Åz‚\åf‚hñ²f¸qñý\Ë}š=,²v\Ä%\Ý4_ñœ&M;!I\Ù&¼\ÓL¾»\Ó\î’\â\ÒSñÑ¸þG\Ø×·\êv¿k±–»ÐŒb¼•£™‘¬A¨\"¸ð’Rƒ]™Õ˜EÆ¬e\ÝEx{\ãe\ã·\ÖmLmÑ§‹•\'Ô­{M†¯§\ßÆ³\Ú\\\Ç<ÞŒ\ìká¨®$\æ´\ìn®¬\å/eu$-žŠ\Ø—J\éöh\à\æ>\æ`\È=iÄ‡C‘×µ|Á¢üRñ&™û«\è\Öö…†ÐŠô3â¯†\îñ\æ\É-±+’$CIÁ˜ôu•­n3=}*\ÐunA¬5k+ôkq\r\Äl8*\àÕ¨e¹¯jM\æ\Ò0©Ãƒ\Ð\ãš\Ï8§‡*¿\ãQq\Ü\Ð\'\'’+&Y\îS\îŸlö5Ÿ-ä¯…,GÓŠ{‰\È\èZh”º\Ô\"xØŒ05—ql\ä\äÓ’\Ä›s¡¥as\Z\ç‘M`jˆ‚T?,¼f§\Ý |T´Z	W#‚*…\ìa\í¥B3”5<—1 \ÜÎ W®x\ÃOã´¶^yNÜŽBgú\Ör\Øè¤›’õ0¡”UCƒKqóF\Õ\Ì\é÷®\×2‰G!\È#ñ®›)š\à’³=\èKš&‡‚¦Xf»…\È¼£\Ø×¥«\Ü\×Ë¾#¸¾²’)\í®¤‚Tcµ\Ô\â’\Ï\â×ˆ`¶Ê\Î\Ê9“oÆ»hÁ\Ê(ñ1®*«>¦ó(2_0Œšö\ì}ž\ß\Û \Õ\È~4jŠ¬&²…ðxaš\ß\ÙË±\Ã\Ï\éUqŠpl×…Xüa·~þ\Ä\Æ1÷”\î\ÍoZüWð\ìÀ\ï/|¬´¹%Ø¥8´z•\Â	P\Ç\Ï$QnQ\ÏAŠ\ä\ÛÆº…ek\Ä\ÚFG­`\ÜüOð\Ô\'lwC\ì)rË°s.\ç£\Í\'QU¾Nœ×‰_|[‡{%­¸v5\É\ê?õÛ•>N!—\n\0\éV¡\"\\\Ñô”ú…¥š‘,Èœde€\â¸\íGÇ¾²}¨6;¯9¯—¯u\íRø—–yžI\'“X\ÒJ\ïÄš\ÑSD93\Ýu?ŠŠr¶«—3\Ð×–\ëž+Ôµ¦Ì’£°5\Ìn<‘ø\Ò\Û´QH›¶)•›¯\"”qÖš8\Ïõ©¢¦‘QA,\Ü~t\Ø$\Ïkð-·“`‡nbq^‹3\í\nÁ\Ðm~\Ékx\0ªŽ•¡{1\Ø\è+Æ¨\ï6Ï§\Ãû”Rò<»\Æ7˜&\"\Ü8õ¯/\æÝžs\Ó5\×xªa-\Ñ t®<\Óñ\ÍzxxÚš<\\d\ïV^£šV.p\Ù#«T{\È õ\ÇZ0\ÓÒ—\0ž\Õ\ÑcŽ\âg\'ž¸\â€O41Ú´X›9É¤ü¹\íN\Ç_Zi\Æ?´\ÉÇ¹\ÅÁÏ§zrõÀ¦qŠ¤Ž©\Üõ£\ÎqJF9\à\Ó&\âö±K’G&“ØŠcž\r\0z’)8£>´œŠA\Ïlò7§jx\ï\Ï4†¡šH\ÇB:Óˆ\ë“\ïM\îFrsR0\ÏJz.y\Ü5y\â¤\äR²<s\Ôv§¨\Ë7?^\Ç4Ó“\ìqK“€G~´Á+\×\×8>Ø¨\Ê\ãÔŠO~ô\Þù<ŠM”À\'·zVS\È\Í)\àœb†©:œ})Á\Øf™\Éþö;\ä\Ð\ÄzwbüŒŒ3´‘ÓœT,ˆ²©\Ï5_+q\Å!|\à€qJÁbv\Ôri„‚ {g˜X\ç¦E&2(@÷#h\ÚA\ÇZhgŽ´\í¼t\èh9 \Ê¼NâŸ•\',;S\0\äQƒ‘ŸJ\0”6ONzV,})ª¬¤u\éG!°9$õ\ÏZ\0	$¨\'¿#5:Ï´ƒŽŸ\\\Ô\0nô¥+òò:ž¦\Éh\ÖYp\n\ä\ãŸNjH—¨l}s\éX\Ñ\Ì\ÐÉž‡¡œÖ¬.’®ô\Èlô4÷!–2rqÁ\Ï\Ð÷¨«°‡\Ý\Õy?…Ä¼¶\ÇCŽq\è)¬¬»1Ô‘\È\Æ8© £ñ€qÁ\ÇÓ­$[<Í¥\çŒ\ZW`\ß€ö¦	šH<\ÅA\æ\0f\ìk¤·‰¢MˆvažO¥s6¨\Í\"ý\åS\Î@\é\ï]J•8Ul“\Û\ÐûV‘%–#wE\èO^€qP\Êþ\\l\Ù8pü)À˜Ô‡+•\è;ûVf§>\ÛIIÀ\ä‚}bG%©NÓ¶x9$Ÿz\Ç\ås\Æ0~_Â§}\Ï\Îrqõ\Æ=)x,¹\ë‘\êO¥b\Í\Ò\Ú0;dü¹§@Í\Ç$¨öü*»o\ÏN¾§\"¯\Ì@n³\ëRQy_\Ì!™ðƒŽ:ŠÕ²8ž±ò\îR9\È#Ú°À0@n¸\ë]Vˆ†pÀžI\Êq\Ü\n‰èŠŽ\ç [ª,+\Ðu=j›ç‡‘Á9\ÏZm´¢œ½»Ó°\Í{\\€Gj\æ\ê:›\ÝñZVºñÎ¡ \'\åp§Z\ä¢\\¯\Î?^\Õ\ì\Þ1\Ò\í\ïu[÷û:3±.&¼¼èš’\Ã$¢\ÝÊ£`.;W¤ª#Åœ]\ÌyxnFAš\È\ç=1\ÏÒ´nÄ¥_v\ìs\ÍSe\'\ÓÎ®\æVd%x\Ã3\Ó\Å\r\'\à@©r@Á¨\Z%•ð@ñŸ\ëC\å·\0zÀãš½¥yýý™ô=sV-m-F\rË•Ž;\Ô×šV˜¨¦\Ý\Î8\È\ç\Ü\ÖmšF-˜—7\ÜI\Ï\Í!\ï\ë]“£”\Ä\Òý\ãÀt§\é:D81\ÎN@ý9®£•SŽ•„\êtG]:Z]œ®³bò\Ä\Ç\Ë\rôÀ¯;xŽü0Á\Ók\Ú\Ö»ù02\Ã\Ê\Þør\Ö)I7;rI\ÇT\ê(X\á„xCŠÕˆ<bº\Û{p6M‘\Û\ß#5—,rlm¹#\Ô\Z\Úè´Š0„vò\Ãg\0ª—\Ñ:žA\Î\ìŠ &L·c“]~]Ú…ó@b8Ï­P\Î)•¶3\È\'µF\"\Ãe˜\à\ä\ã·5\Ö\Ýh·%\Ýl†XMŠp\ÉÀ\Âi\Üh¬˜\êOøP@\Î{dŒô\ÍX`Bªà§­U±bª8´H¦,±\ÏZL«²\àŽœ\ÒùO€WƒøS–\É\ÜN\çHcGM»\ÉþU4³¸:qÚ…Ñ‰`\Ã<qZ6,<Ð»07R¸š\"½·’™\Ç\Ì3\ÍT \"\ç+“È®¿\Ä6lB\ê¹\0`ö®@“´’¼õ¦¤\"-\Ås•\É89\ëH÷ry\ïŽ\Ô\àU²y†•3»\0r9\æª\ã\Z¹\ã‘œ\Ó	e\ÏNHÏ¹«\åBs\Ç¨M¿b:\n.‚\ä\ÇN¾Ô¨X\ç€\0þb” Á\ç¾)`…\ä`€‘ô¡Ž\ã\ÜÚš\ÊO\Çs[2i\ìª9Q\Î)‘\ÙI¿o\\sšWŽ¹N«Ú¢;óß­j\Þ\Ùy1\ïc¹š±A\Ç#Z.+3\ä¶ŠkH¬S&@Ts\êiùÀ\Ç^E!Ž\Æõüj\å¤~s¨=N\â*¢Jb\Ãm\ëÒµ´¨\Ú\â\ê5=Ig9YSW’=\Ã\ÃqyvQöãŸ­tÒ±\ÏŸ¥ÀR\Þ5T<\0MY¸g\0\åkÅ›»l÷\"­¼Œ\×\r,ƒŒóSOr\Ö\è[Ú«‰eó\0P\Þ$²\ÆB€I¨Ž\ä\Í\Ú\'}\ã\Ý^\Þ\âX tNå¬™¼m\â¬†¼!zü£®{U\Ò/þ\ß!dØŠ¤\ÖWQå™±\Ó#p\Íz‘‚\åGŒ\æÜµ7\ßV\Ô&û÷s0÷\Z†	\ç.Y¥\ê:{\×?\Ò\È\ÊI\Ï`=kIm®†e19Lt¢\Ì\Ö2/¤\Í\ær\ÇÚ»]&FxT–Ò¼²+\åŠ\\ø\èA­\Ø|@ŒFH\éÛŠ‰Eš)Åž•ö—ŽAó\í=j\Ü®\\»sž+\Ó—Ñ‡ðZº\Ëh|¼\Z\àªõ±\ÙJ*\×4j&Q¼œm\ÅO4\ÛÒ¹=Z\îQ4Cs‹Y\Æ“².SQDR\É“kJ©»»68®†-oC²·›\ÈWny\Ý\Îk\Ä\ît\íR\âå¥¼q\Zœ’wðAq‹j„´\å\Ø\n\î†\Z\ÝN	\â[\èzv©\â\ÏŒºWû œ×›j>\'…\åu„dH\ã¹Y»7È\Ï>\ÕKj©\ÃdžG=kuF(\Ã\ÚÈ½>«q>\î\Ù§Z\Î<\à“ŽI©þUÀ\È\ãóÏ¥FBòJVŠ6\'šå¸¦FA\é\Í1\ØHI.;\n®‡}\Ï<S·\äqE†˜Œ\Ä\'¤iXŒdÐ±»¡y8\àsVFŸ|pL.=8\Æj\\KR&‚\í1Žj\ÌR«;8PJ®y¬ÇŒ\ÇÁ$6p@¦\Â\Û-øû\Ô8–¦m™Ì¿1\äÓ²6Ž\êl&\ÍÁó¢=€\ëMócN7œVmFh“##“\Ç^´ò\àG\Ó\Åt\Æs\Æ)®A@\Ù\Ï=zR±|\Ñ%°Ï©¬«Ùœ•\Üy«kóðgŽþµZH\Èù>\Ô\Ò3”\è¿\Õò9\íHS\ÔqŠÓŠ\Â\á£Š\'²’f\Ê{Œæ…\Îsòu\È\ìN+£ð?\Ú\0Œ•G½s³;dƒŒvõ®\ËÁ\ê>\Ù<—\È8\çèš´	óMzž‡z\å‰?º3š£\Ä\Ì®k¼.Ó»°8²c\Ç\ÚŽA¯:Z³Ô£Th\É\Ä\'=\ë\Åõ©]Rns´¨úb½š\çp€ý+\Ãu5ö|Iry®œ$}\ærc§¢E\Ñ0J±5†lT¤’E=\"’^]€†kÒ±\å\Ü\ÍU\ÆOJrƒ´r=©\Ò\Æ\ÙÁR3\ëÁ¤H\È\ã\n;Ó°\\·\n¹\ã§†0F*C‘Œ\â­\ì  ô\ãÞ—)I”ñ¹ø\ÜrzUõ¸*…|Â€¯AÁ§E$ˆ1·’*Ž^¸\àõ\Í.V+•™·0\Æ¥Zn qQùR’\ØC9\ã¦;Ó„r6\ãÔš9YJVHÁ9\ÍV\å‡,¨S5_“ŒsO”9\Ë&a\×Ú¡iY°=:\ÔY”r‡9\Òx]<\Íj\Ødpy÷¯z-ˆkÅ¼o¿Ty—\êk\Ø%f¼\Ì[ý\å»#\ÙÀ¯\Üß»2u	3¯ \×n\ÚmNR9	€8\é^¯ª¾\Ëgs\Î\"¼J\æEš\âF\Éù˜Ÿ­w\å‹Þ”»+vm-#;“BÐ’K\ä±\èZûQÜŒqÞ³\Ð7<TŠ\ã\"¾‚2<Xg\Ævñ\Ï¨R’jä“Œœ\Z‘N\â\\Ž>µ\Ñ4^‰ö–\àõ«@Ä£h~\Ùc\êk$ò:Ô±\î\Æ9Á8\'´dfÑ¤YX#½4e‰\0\ã=sP+3\ç¿\"¤Pw·\Í\Çj\ÙH\ÍÄ¾§h\Ú\Ç;yö©•_™G^´ø š\â\'tŠD»Ÿ…\ÆOµKin\×1Á¹{*ns…R\Ç‰ôM_0”HŠ–o¼Hd\ÎUqò\á‡\é\Å0”BÉ¸?$ds“Ò§\Ó\í\Þ\ê\ê8#\0´¤€\'Žõ2šI¶i6\Ò=á¾—\Å%\îõó$;{~\à\ì§`„\å²q\ÇkðÖ™™g)ŸV\'®Mum_-Š«\í«NWÑ½±Á\Ñö!µK_R¤Ä¬Oœñ\È\Íx¯‰¥\ê3\Û\Í\09‘€\Ã>\àW°\ê\à$œ|Â¼S\Õf}Né•¹\Ê+·*\ï[\ì39©Ewf¶v¨…„œ\ç£FOò©mmle‹lÙ€±všHœ\í\í•\É\éH\ìf1\ì›i\çvXÖ¦\Â\Æ<¹]8\ËG&k\éyQò­²\Ôkj¢\ÙQB$€K	\n~5Ÿª\ØÀÓ»C$\nýCTmHKC–AŒŽ„\ZfÆ¸\æ%Á9\ë\íS(¦ˆ3M—\Ú-³(ýðùC+uQY\ÒX\Ã *žÙ­™£•\Ó!ÀÁªƒs‚¡òW\'Žþ¹®iREÁ\Ø\æ.-e\Æ9\èjÊ¤\ÛBr¤u­Fc#Ž­B\å\â%\ÏN\äV.‘·=\ÌùU\Äp(\çbœUIbÃ¯5¢Ò‘\È\ïÖª3qYºv*,\Í1?ð€3I\ä\È\È\'8«§\ïsøP$e dó\Ø\Ô8£T\Ì÷M¨r^i›8À\àc­^¹\ÃÇž\çŒV{&\Ñ\ÔŒðk&\"!X1\ãŠ²I\'½=	^y¢F@\0Ï¯­f\ËD\ê	¨›o§zS\Î\ã\ÏJ…\\ó\Æk&ZŽEW`{žµ!=j<œ\Öl\0ƒŠi\ëN¢ ±ph$S±À¤+\Û56(e—š_Â‹\Æ\âž9£Œ\0iA\â©!1ÀGj\0&œ\ÃŠ\Ñr<rjLSGJr\î úÓ°)(\ìsšw¢\Èm\Å4ÿ\0@?\ZS\Ïja\Å#w \Ï4sKIŒ\â€jAô¨\Ç&ž1@\n\Ã ý+°ðL¥o\æ~<þUÇ’=¹®§Á\ê?µCwX\Ø\×&7ø=\ìû\Í?ñ¾õ¯7ñ_†2\Ïl0\ÍÌ‹\ë\ï^Ž‡Š–D\Ä\È\Ã ‚\r|\å*®”î§¯B©ÙŸ6\äG\Çpjffê ‚ÃœU\ÝFa5³tF8ú\Z\Ý\ÉÌ…	P\r{\Ñ÷’g\ÌMr¶»2Xn.>L°\Î{T“Ý‰a\Ë³\Ôw¦­¤\É÷NðOQPOŽ<2\à\æª\Ä6k\éŒoŠ\îH%\r\ÎÓj\ì,üS\â\ë0_¤\é\ãx\Ýù×š\ã§\Í\ëW`ó¨ƒ\ë\Ûñö¨’Ï£ü=\ã¹n\âÿ\0M…!ppY~\íz¥ú]0–+¨dŒÀašùŸDK¶°¼t\ÝÑžFkšMX\Ä\Í\Ã\Ç*’¤©\Ç\é\\­6Ù²hûÿ\0[±°O\ßÈ‹ß¨®Rñÿ\0‡\áRT\ï~JªôojðDº±¹\r\æ]HŒÄš¦ñi‘}\ÙY›°ªŠb•]?m\×\å]=ñœ}ê¾.\Â#\Âi\î¶Z¼’K6G:\ÍÁ\Õ{\Ñ®Òƒ~F\ì\çÚµI2Nÿ\0…¿ª¼¢4³‹$\ã¯J¡}ñ/\Ä–\Û\å •Zò#83	þFµZ\éž0\Ìu›‚ecWQñn»~¤K;\á‰‡µs–“Hš¬\Ì[\ä˜1¨$º•[’\ì\æ«\å\à\ä“\ØÔ¸\Z*š­v=¡®-´\Öî®“*±Á\ï\ï\ï]Drˆc=+À4‹\Ùm¯!;ˆG˜gÞ½\Î\Í\Ã\Æ=Ey¸Š~Í£\Ü\ÂWö±zlp\Þ5‰\Úe\Íy|d‡\Ý\Ð÷¯hñB–µvž23^M4k5³H7Á÷®¬+¼,yÙŒy~\è¬Ju\ê)ñ\Ç¿.@<òj–\â:)\Â\\Wi\æ=Sncc€s\Èçš¡\"\â^üt\ÅJ\Êü \â™\æŽ7¦\ìõ\È\æö\évÝ¸\nˆÈ¤t«f\Ú+\Ç7QUšzŒŒ\Ð’Ñ”\ÝF8\ä\ãÚ®\ÈZºÿ\0\ÓC\î+1\0Fd\à÷\ëVžL)þ\îiX¢ž\ÕõJf\Þ*FÃŽ}\é™=\é’\Ø\Ì\Çð\ÊC@°\ÍqýZº\ï\éÏ¨jŠN6FAcü…r `þ•\ïžÑž\Ê\Ê2\ë\ËòN=k\Zõ9!\æÎ¬-?kUvZ³·¶Œ$*1ÛŠ\ÃÕ¤eF¸Ç¥t\îƒa€5\Çë„ˆŸ\Ð\ãñ\í^R\ÖG\Ð|1<C[œ\Ë{#H÷\Íb\Z»}$’Ü³0\0–\çLó^\Ý5h/C\æ\ê\Êóo\ÌNhóHA\Ç4\Ìõ«1c²8¤¤\ÏcM\Ï\\@…\ç\rIŽ1œ\Ð?\r(À\Ï>”\0dœÐ§o\àh£œz«¡;Ža\ïFp§\n`n@\í@…?J2vŒÓ&œu¦d\àâšNÀ\Ò…\"ƒ9\ëMGãŒš8#Ÿ^h¸}\Å ™œ¡N{ÆŒq\Çj7PsN\Î\ïj`$T˜§\â(*\Â\àŸ\Ã4˜$S¹ \âœs€qÇ¨\ï@\È\ÆXœö§g\ZRI“ \"¥€˜\É9\ëŠw9\n@\ç½\'9\éH0õ¤óŒñŒsL<\Z{qƒŸNi‡’F>¦€€PzŠP¹\È=ø\âš?i“`÷8À d\ZMÜ¨>”\r\ÌGpy¤\×\ïu<{P¤\Ò˜£©<\Õ…ÂŽJž´ o\'žýi3žœÑƒŽ\Ç\êhy\ÝÁ\Í\0‡?-9S¹\ÎsR\ìB\ã \Í0’¼u\ê5f<l\éÞ«üÀt\à‘‘O\\‘½_jvVA“Œƒ‘Q\Æ\ï†\ç8\î*c†\'õ§¬Nd\Î\àdg®?\nd\í\ä36Xù÷>•x¦\ç$ž»³\Ç\ä+w©#H~\Þ\ë\ä;±\èO¶sšV3d2§—ƒ´£\×\Çº•;X\á,žõ}\Ùa˜pluª‘\Æ]Ê«qœS­¦	@\Þ~\è&¶wªv±L§8\èqô\Ïj¶¤•hùøcð5¢\ì\äƒ\ÆpwW;®\\I±c+Ôœ\Ö\ëH_\ë\Î}\ë‰\Ô.\Í\ÍÃ±\Ï9¢[\Ì÷ \àp@\íQB¶A\äÿ\0*P@9\äP£<sÛ­c¹°í…±ž˜äš³„G8‚¢«sŒô#­?{1\êjh	\×\çDHÀ#úWK£HÑ”\Â\ã.\êsŠ\åw px\00®\ïI‚)~~ô\"³¨Tw;kb­\n°Ár?Â YŒWJ3ƒ3\é\î}©Ð³¢*\'\×\ÔJ¬ñ¼×¹\ÚprI>¿ÓŠ\çASc\í¹´\Øæ¿™\ÝóºV8üj\ì¶\ÚxŒ£\'\0V`–Y.ee\Ý÷\Ï?EyÇ”A\r\Ðõ\ïVÞ§$¢¬pz¥ž›%\ä›Q	RGNEsWº\Z\Ê	·Uõ\ëV$\Ýiw#HFYò\Ø\è+Dj–\ã\îr1]1l\æqL\âe\Ñ/\Õðcª’h7\è¬T<ðOz\îZ³…Êº1\è;gÖªO®\ØÈ»1\Î9\"´\æbT\Ñ\æÒ‹˜rŽA ö­Wºœ~½ªÞ¥g-\Å\Þa…œ¿!qžEt\Ú^‹\Zm0Í‚2x¬ªN\ÈÖ•+±\È5F\0\Ç\'·?³¥@ô51¿±Xv$* r3\\m\êw(\èr“<ª‡i?…yþ¢òù\ìY\Ç=«\Ð\ïe,\Îp{\\°…¦d+jORZ(I4O€N[\ëÚ–œ†‚28¢\r\é\Óx\0)\àš¤ö·6\Î\Îw¸\ë])\"\Ë›rÛ­2f#p\ã\Ú+«Ó­,\Z2\êt\ï…#š‡Q³\ëŸ-ù\ã\ïU\Ü,`o™,džÜšÎ¤l\î?6y\Ç\Üi±hó\0²D\ÊT¯Z\Éi¡§\"$U\ç“ÔÆ“\Ò<À$\Îpª]¸99¨¼©rr½0sŠõs§F»m\äXÇ¥cMa5\Þ\æ†5*zv\ÍM\Çc†bqŽs\éS‹–\ç¦\àGÍš\èÇ‡–V?i`0y\ÜjøðÖ—Œ}¯-Á\à\Í\Æ8žp¡ŽOoj\ë4my¦WfPds\íZpxRß¢\Êÿ\0\ï{W¡h´I¶±\ÜxÀ\Íg)h3•ñvš\ÉmJ\ã±ÀÉ®.\×\Ã7·#s?S^\ã\âM\Z$ò\ÜXqj\à5\ÍR\Â<\Ã{x\ç\Ó4¢Ø·9\ÕðT­!>v=>ZÒ·ðpXð\ÌXõª3kþ # (O÷pIú\Ñ‰uXÿ\0\Ö>~NŸ\×5¥À±?‡E™\Þ”d\à\Z¦÷(v\Æ\Ö\ë7u\\sWS\Ä\Ó\Ê1*¤\ãw ª·w\Ð¼œúœzQ\Ì —MyŽV!–1Éªsxv\ê:º‚OÌ«\éV’òþ\íÀ\è¸\ã9\Æ}ª1o¬\Âs>öV\ã\0æ‹…ŒB.\Î>Fl!\ëZº‘\Ù\å\ËÜžN0k\\\Ã~\ê»-Û¦=2+\n\çVkirÙ¨ \àçŽƒ9\Í;Œmê¤£\åoz\ÉKg!–Ï§S[·|\äCò+OÍ»²•7\ÆgŒ\ßZMŽ\Æ>¿g\ËDB\ç¡\r\í”\Ö\Ø-o\Ð;×¦Yjö÷‘€øRX•¬‡\éŸN\rC™j<S\å:\à\àö\Åw>€MtŒ@\æ¥\Ô49o%2#pyÂŠ\î<1á›‹(¼\Æ^Ms×ª¹×‡¦ù\Ñ\Û\Ø\Ý-²€Wp«WZ¼«•V;N‚M\Ê1J\Ú|`n\Ü¯-³\Ô1žtixP	¬û\Ù\åT!I\é[\â\Ò\Ý\ÙÇ˜µw§[\Éó[84\âõFu>xe\ïÛžþL\ÈUKó–§(\ä’\à\ÊO9\è+S^_&Gò”’½ù\ä\×\r%\Í\ÚT2s\Ó¯ZñG%i3µ‚;K\"$\0ûº\äU¡¯Z—\Úø\îp^\ÕÁRöd1\äm\ÎAúv¨ ¼òe9N NÀ™\Ù_\Íau\Ñq\ØS4\Í6+\ë¤Ú˜@\ÃéŠ¹¤\ê:mÔ«‘®[=º‘\ÔW«ivZbÆ¡!\0÷®j\Õy¬uÐ§\Î\Ó+X\Ú\Ç(\Ú+W\äL\çV\ÊX\Â\\U;ä¶…3Ÿ¯\ç\ë&z\É¦±ªX\ÙÀLŒ@¼_Uñ5Ô—m\ÈŒ\ík¹\Ö :œ\åLxOR{\×?„\Ô1\Ì3\É\é\á\é(+½\Ï*½YM\ÙlŽB\ãU¾¼Ï)cž+8—<“\Æ{÷®¾\ÛÂ—7À¾\Õ©£ð\ÂD\Ã\Îs\í´æºŽcˆ\0þ™\ë]]–‡ô «³1=¿\\\Ò^i§6É…÷5–³\ÝZ±9\È=Ó¾\Ðll\Ó\ç¼ðN\Ü\çŸCŠ\ÃM5\ÞO–ts\É\ïÈ­¸¬\äo$¹G=ñ\Íg\\\ÙIlw¥\ÚH \äóú}hÙ©c Û¯72©8\Îæ¯¯‡t¶“\äw¸Ý’k[¹ n\È=qZk¯\\„Ûœzw¢Á©\ÑK.“£.Ô·\r&ÝŒ\âˆ\ï\íµEh\Û÷|W$\Ó\Ü6\á\Îy>•\Z\Ï5¯\Ìgž((\én¼4ò6øfvSÖ²\ÛA»\0‚À0\ã\ëU—V¾B\Øvzþ5t_\êWØŒ6\ì‘À\ãõ¨h¥&g­ †@³p@5¨\Ñ\Ù*‚‡ž\äûÕ•\Ñ\Ü.\ë†#\èF*\ÑÒ‘c%T‚zc‘SbùŒ9\ÑÀP¹\Åe\È\ÎHF$ÀœV”²\Ëi3Œô<Œ\Õ)\ïd¸»(\ÏaŒŠ›˜¨c•H-À=)žlƒg\'\ÔÕ•™¥a¼ s‘\ØV›\Çe?\0€H\çŽæƒ˜\Íû]ÀLy­\ÇAœb¡i\åaÙ>µfkcps\ÏZ„cœæ„„\äFsW{\áM>\î;…˜¦\Ø\Ç~™5\É[ ó+žxÇ¨¯hÑš\Ê1°(`V‰8\Ç\Ô\è\ÃEN~†°œ$|¯õ¨\íbµws\å\0I\ã=\êI$*„\ìF+\ï™|Á\ÇJóOUhm]\éªð1ü\ë\Âu1\ÓP™U3óŸZ÷Iu-\Ð#\ç÷WQ}²MË–\'®+³	¤™ÁŠqG™¾—´¸…ˆqVt\íLiä£Ž£ž+\ÐZ[RJùˆ¤_\çY’hºk1‘\Âs\Ébp+\ÓZžSF?\Ú\í5\"G0zsX\Ó\é³	\Å!I\é\éš\é&\Õô{\"#…|\Ï,‘•Z\"\×,Ü‚\Ñ`úVM\ÎFm6\î,½3š–\Êuóf@A¨®\È\ßY\È¢~þ\Ô\Ãy§\å¯\'žM+\Êiid\Îœzt«\"\Þ\Ø>YC\æ¨Ï¨\ØB720\äÞ mzÔŒ,,¦Ó¸0y_\"\Êú\æ³üŸ6Þ #ŽøúVd—s\\.a,JõãŠ†û´À|\Ð\"¥õ¡†E\0v¬²¬>µ±<³H\áˆ;ª„ì‘†\æ~¬;”O\çÚš§9\ÍFzsWô»95\è\á@Ov#°¤\ÔSl¨§)$·{Ÿ\à»&·°iˆ\æf®\Ö\\\ì95R\Æ\Ý-m\â‰@<\ì|³^Ió\Í\Èúz4\Õ:Qda\ë,¦\ÆN\å†1^\ÌU\ÙNzõ¯o\Ùö»,®FZò½J¸\Ó/$%s„”oOc^ž[R)\Ê\Õ\ê5§6\ã5²Ñ˜ª\Ù\æœŒ÷¨U±O\0õ¯v,ðš\'@<r\r<·j`kxÌ†‹öSžµq®\æ‘Y†\Õè¾™¬\àO¯~EL€ÒµS#”Ñ‰•ƒonÆš¯€þl€Hf\ÖC…““Z©\âh[\\It2W8\ÏP}kRµ#™\\\àt¬¸´û\É70F=\Å\\û\Ê(b8©5|\á\È$\âœý\ë\Ð|	d“o»À\'~\Ï\Ä&™yrG\rÀ\Ç9\ÏAø×¾øgF66vÐ”*\n1\\\êü´¹S\ÖG§–\áù\ës5¤N\Ú\ÕB\ë\ëZ,b\Ûó5WŽ €`õ¤B\ã“\ß\âHŒ}QC°A\È^I¯¿³‘5K\Ä\ÜI37n€×¿H\á%f\Ù×Œšò=~qk¯»L3\0\È\0þu\êerµY.ñ<,\æ§v‘Á\\#\Å&zZ[y$h*ª\Ø\ë\ßÚºFóG¸·@\ÊO\î†\Ö¶A®A_lƒh\é_Hž‡Ë´\ÍhõKT\Ê=¢0BH˜®V’mN\ÎpJB b\0l1<úóXó\Üª[Y½A\æ³¶ñ\Ü\Õs\Êo\Éyc\äbs\ÕO#5–$M\Ã\'ó\ïQŒ¢\ä’2)ž\\¬x¹\ç¦r+7©ImdÛœ€z\Õk 7`\Ô%ˆ‡µA3\ä`g5‹±I\Ç\Õ\àSzd\àý)…ù\î\re#Dü¹¡©™\àŽ3LÞ¢±‘ª&vŽ¿{š¨\ç$þ8nY‚…À\Îj»N|¦‚	»Š\ÂL\Þ(ˆœŠf0i›Q“‚:\ÖL¢»¥@ø5fD+\Æ9\Í@õŒŠDY\Ï8¦\ã\ïP	\âœN¬\ËGj{\0>´Î¢¤s\ëL\Å.:\Ò@ï ”\ì\í4®:P!Í–§.03L\'=\éÃ¡¦€“\Ð\n_Æ™“\Æ\r«Bbõ4c\Í£9\"™!Œš\\ßšC\Ï\ÑÒ€”ž)F6\Ór	À aŽ>¦šx©|óLos@…jZgNr)A\Ç \Ð\Æ	¥À¤6E\Z\Í\ë]wƒ†.¦tU®<\àŸ­w^\\µ\Æ¸®,sÿ\0g™ß—«\âiúž©üœ’;ý($\àÕ»hó÷UQšù«j}m½\Ó\Ç<kMXœ`º‚OÓŠ\ä0A¯Añòf\êÙˆ\Ø\Ý+€+\è0šÐ‡¡ò˜\ÕË‰¨¿¼=%u8ÃZšk¹&@®r1UÀ4˜5\Ó\Êr\\Ð³’\×k$\ê\Ù\'†¢\ÚM\à`gcpkžù‡9¥\Ëp*—©©¡_<:F¡oÃˆ·ý\êó™ZV‘š`wú\×I¡x’\Ö\Î#oyõ#—®+²µ—\á\Å\Äc\ÍÞ¤õ\ÞOþ\Z\åi\ÂO\Ý4N\ç”((Ù¦3¬œ\08\æ½TŸ\Âa™m@‘rx\í\\Ü—úZ“\åZ¦}j\ãwÑƒõ3\Þ\é’\ÙQ#5Y\å‘\ãA–;EEw<s?\î\ÆµG\í\Z°õ\Æh¢MÁw\n9&·#³¸B˜£ûw¬1·†\ç5 uCŒ\ÌN:v¦\Ó\ë:\åSqú\ÕµA\ã¿8æ§›R¼™~yI5ZI¤ òrjZ)4:\Ùe…ŽHó¥{®˜Ä¢’\Ù5‘c\áM\"\çFŠñ\ã\"F‰;»•\ë[\Z2šòqU\Úò=\Ü)SM¾¶#\Öb@\êFr¼Šñ;©¼¶x“8\ßÏ½{¶§1ŸLb¼\'S\0]¸\Æ0{V˜7vÑžd´‹3}\Å 8È¢“šôO•%to”ô\ä~q5I×†Dq\×3Yæ““ùPIz[Á&q\\œ:U2Í“M\É\Z^T\ã?\0¶\àÓ™²¾\Ü\æ™\Æ9¤\ÏLÓ°\î\Æó§jp÷cNŠv\Þ2h\0R‚¢“ƒ\ê)0/i±y\×\ÐF\Ì8\ìqÚ¾ŸÒ¢T€9À{\nùz\Â\å\ì\î\áFJ88\éšú“J•%¶†@s¹LWŸŒ½\âz¹nó5%Q³¥qZ\ÊecµwISŽµ\Ç\êË~‡žõ\Å©\ìI{§\Ï7\ê\æ\\daŽ8ª\'‚x­\Íu\n\ßIž†°ÊŽ¹¯r›¼ó•§%\æ4ðri¼ð3Šq\è)¬÷«1‚M%8N\ÔFx \0œqÞš)\Ø\ïIŒg sÖ‘@\ÇOÒŽù \Ïc­)b[ŸNM7ƒJ2q\íM\nÂ¯NrMW\ë@9£Š¡\Í <Ò‚@\"”uö¤Æ†c-\Ïz~2h\'‚( \ÍH\ì/M´\Ñ\ÆqŽ:\ZSMÉ bƒ\ê:g\ì`rM^¹§p=1õ\æ•À\0\Ç<âŽ œu£\ÛŽi«€sC`*÷\ÎqJÄ‚Bð3\Åó\Æ8½G\È\â¤\ã<uüiy^û… $ž” “š\0B>žô»pqô¥h9\è{\ÒOZ\0pP03ø\ÐO¡÷¦(ù¹\äJx\"•€h;I#\å¥Š\0\èz\ÓÂ“É§`÷ g\îô\Å*œzRçŽ=\é2\Å\nH¥@:\çŠnIZ2}Fs\Ó\Ñ,²rI<šV)ç‘’}…@$a´\ÝjP\Ù\Ç_ÿ\0]R%‰òô\Éõ¥\Ã\"Œ}sÒ¤ùXƒÇ¿½|ŠFO®i€ñ!\nÀ?•O\ÊKnè£‚A÷x\àö\â¥\Øvœt\àw4®&O\çFI#\n=qÒ†?‘ª\Í\n®3\ÏjxW2z\Æi’\Ñl9\Î2N\î½ZµµÀ¦(æ²„ \Ê\ä\rÀóý+ªÓ \Ä}N\ã\ÏH†[Á\à¡O¯¿µJ¤Œd´ç© m¯ÍŒÏ½9”d’Fs\Ôó\Ô\â¬FV§;$ \àóÀþµ\Æ\Ê2I\å\Ï\×·u9Á‚\Êp+Ÿ8Vm¹\àg=³\Ü\Örzš\Å¨8À\îqƒC+§$’ÜŒƒŸÂž2ShnjQc°AÁ=‡\Ø9p¯‘AƒÁ©QpF\Üc¹õ\ÍJÖ¥_u\É\ÎsŒ\ÓØ¬Û—=\È#‚+¾ðÂ™-”¼7s÷k‹–$Fb\äg­z†X}˜ª“¹Ç½eSb\á¹\Ò\Æ$c·v¬ûvÎ ¹’Ek¶ý¯\ÏÛ¹\Î\Ñ\Ý\ÅÁ\n\ÙÁ\'“ý+UO…Ÿm\ÚNSN{\â±|Iª\Ëkhï¸\çŠ\èl%Ý¿\'Ò¹Eet¢\ãw-ƒB\Üã¨½\Ó\Æg½¹¹û\ç53ù,·(ŸÖº\ïøGâ„©V${Õ¦\Ó\íŽ	r2:W\\]Žud\ÛZ\Ø]\ìy-ÐoZ´<%ólbÜ°5­e¦=ü«+–=p1S^ŠºM€Ž?˜\îù˜ŽI¡±\èq6š,zbª\Åø±&­N\×{G˜\ãš\ßuù”b£9RH\éÒ¹*;³¶ž\Ç4¶×²&%|wõ\ÍWÿ\0„v7f/)\ÐWO½s‡ªº‚[0\Ûð+›¤d\Â7lNw1õ¬½SA³ò\Â4cyó],Wmt™c·µgj(G™#~x­`\Ý\Ä\âŽV=8ˆ!›ßš\Ä\Õt(&%–\à\Æ:\à\n\èÐ³\íKg“V™>AÂ’{\×Jb\åGˆ\ê:eÍ¼Á`\Î	\ì\Å^·I\\™¥Œ\éŠô[\Ñ8;!‰y±\Ås7º¶\ì…\rŒŽ+E\"yJ\é¢+\0\é0\ã\ïÚ¬K¤C,`ov|÷8\Íki\ÖómÄ‰[i¡\â?\Ãô\ê*\\‹Q8x´Ì¬^@™û\Ø\ïZ72Ã¦B›[z|£#šº\Ö\Ä[\0=i\ÇM•A\'×ŠW[GkªFZL\0kZ\ÛM³·L„\éÐ·j\ÊM+\ì\ç*û[=3\ÅL¶~a\Ù%\Þ\ãK˜,Z½—j\íY2e©ü;-\Â\Ý2qœu\Ï\âjœ:0‚BZr\àžV½+KÒ¢·³\\¨\Üy5›š8\Ír\çR½\'nN8\â³ Ñ§Bw\ÌÏ»³UŸË¨\Û\Ê\Z\Æ0X“ŽH®\nM{\ÅNY2m\Î\ÞI¦˜$wÍ¥CŸ›ò\íƒU$Ò¬mšmª‹üDb¸¬øš–‚}\ÝKª·\Ë\â-]K\È$\n¸ùO\0U\\«ÿ\0\ÛtyÈŠ4R}qÖ¯›KWR\íx«\Ûjñ6^T\ç\åõ\Ò\é\Ç\Äƒ³¢A,zQq\Ø\éu5\Zzy°À{+™5•gBs€Oµm&“ry·Œ\àñ‚)Ë¡\én›&[<\ç€y£˜9Yˆ¾ \Ôõ/’8—œ ÁªW:&£zA•\È8À\ÏAÿ\0Ö¯A´\Òô\Ûf\Ì$\ÝóW¤\ÓRtû\ã£˜|§¥Y=UZD|0º3«\é{B–\ä®1PO§\Ø\Ú(\'ˆÇ¸\0±²l³\Â	=õ¥{+_M³»\Ö<g¯`sOM\ÙpJý9¢+\ëTEm|`+f·-\ævE<±>«96‘¬\Ú.\èšD[”‘\Âzª¡8¹\Û\ã‚.@ZÔ“SX\ã;0My\Õey(òÄ»u\åÆ„œ\n\âõ#Àt[§`ð)š…\åË–\'\'¾+¿žUG cƒ\Ðgð¬‘l\ÕÒ–\Ê\Ñ\ä2]ù»\î\×C>£§º5\å\Z2\\J[–$µwPXý \È\ê\í¨·‰‰xm\à\ìsž1Y7Ë¦ù½Q“œ]\éðõ´ƒ—9ª·z¬gb«uj\ê§UU(KVy;i¶\êÁãŒ·\0ð2\áSÏ£‹\Å\ÃA“\È\ëŠ\ìV\Û\É\ì}p8\Ím\ÛZ‘Ja\Û\Ç[J­‘\Ï\ZM³‡Ð¼0 q)‰ò	\Ûõ¯KÓ¼\Ø81dûÕ­2x\ä]…pE_–h\Ôˆ\Ä\×\rI9Hô)F0Ž…[›ù¡B\Ä\æ¼\Ï_ñ¹³@!\r¼rGWm«ÝŸ)†NH\àb¾~\Ö4v\ê\êI\Ú2\á\0vµ\ni\ê\Î|EW²,\ê&¹¹“÷?\'°§Zk·Pn7	ž:·&©\Ùx{Y$lEF\Æ9\é]%¯‡5)‡úL‘„\áFk½Y\Z³\"_L\Ä(]‹ŽF*KY\Þvf\Âö\ï])ðí¿-\Z\ï53Ï°´]\â<\Ð9\ç\ßWÚ‰\â\Èf…a\ß\è\ßtë“ƒ“Cx¶\ê6P‹N‹\ÄW¯\å\Ço\æn $\Z.<Z\Ú\ÅŒÀ§P¼º}Ì§jm\Ï^+«¶\ÓRú\ã3\Ú†9\Ï_¡÷«—PD¡–aÀ\à\àfÁ²µ…Ï™ #=½+J$Ñ€UXƒd»°j§¨i³+–—\n\ÙÀ÷¬ø¼\è_*9 Ž\ÔÎŽö\Î\ØÀ8™u¬TÑ®]±€ sWlõk\Ùg#2v$/5\Ø[\ÙK0\í³ñ¤Æ™Ã®špcXY˜¾z~f´m¡ºŠEŒEó7C]\ÊØ˜\Æ\à7`U9šTƒÇ ±\Í!œõÞ•,ˆ\å®\núgµaMb6o-×¦zf»Õ±i‘]\Æ8\àT’5¶u’H4ÁÅ¢4\êcµ™³ƒ\×5¯aY`…Ç¯\Ð,7\ï9\éYº«Ê„\Î\ÎÇŒ\Ò¸³–fd‚\Ór\ã¥Y·ðüŠ º¨c\×oo¡¨\Ú\îö\Ép±mQœwÉ­-iR#=\ì\Øë…¦€Ð‡Ã–lŠ%R\ç±\'¥$ž³V\Â\Æ8ô5\Í\Ü\ë:¥\ëf( \à*òq\ïQ{Qƒ\ä$‚x!ºŠ\Ñ\Ó++NB¤g=k°ÐŒS«\"È¼œ\çµy0¾¾¿p¡w‘ù\0+Ô¼!¥²133+——!Ù„—¿¡¿sn€m<ûŠÀ˜®ò\ê;tPœ~ˆ ‰\åû aº×c\Õ)\Û\Â\\—<W/\âhâ³\í\nœ‚C`W¥ H½ª‹8n *ê¼Œ+ZR\äšfŠ~\Ò\r9ùMr\Ìñ±P\Ø\ä\Õca}p\Ø3e{m5\ès\è‹k}*\Æp¤ôõ©\r¼\ã	´°\é^¼dš\Ðð\å©\çI\á½A˜ý\Ñ\ë\ÎMZ\Z4V(\Ò\ÜÉ¹t\ÜO7\Ù\È+’\0U#r–<3qJ»‘c‹»Ö­\Ä~\\qƒŽb°\á¹l\çwZ\î&ðü{\Øã‘“×Šª|;\'º‡=¨¸$qhŽ\0,O\Íh\Ãˆ7Ì¡Tœr?:\ê?³­\ì•\äÀ\ãÖ³¼ƒ¨6!e‹©\Ïšbdiz¨ñ¢¯\ÜJŸT·D\n\àa˜g¥`ž•Ü§x\à{œ\Ô\×÷±¾eqN3\éM0![€\\)cò\ãšÍ¼K9*\"ùa\ØR\ÈñŸ¹L–W+“ƒ^³\à\Í%m¬\Ìî˜’SŸ \í^g¦Úµ\í\ì0¨\Î\æ±\é^ÿ\0iCH@¯?R\ÐP]OW-¥\Í7Q\ì¶.\"{\Õ{¶\nWGŠÊ¾o•½\ÅyG¸R\Ò\0k©XóVõ}\"\ßS¶tdÏ·½V\Ñ:\ÌG®\rnoV\é\×5Q“Œ“N\ÍÔ‚œZj\éŸ9_\ÙÉ§Ý¼oÒ ­zŽ´ð²Ev d¯^tsÉ¯§\ÃVö´a?-O‘\Ä\Òö5§\ÏBL ÿ\0\ZC‚*0Æ…l=Mu©\Äù\ÇJš)	\Í@Yy\ç“R\Ûynëž™Á­€¸Ò „c©=~•©¤\Ï\ZH\\…µBM RXt\íSZ=”’\Ã\ÎYˆ\àU©Š\ÇV\Ú\í¯TŒ\àpFzŠ£5\Ó\êŸ$c`ê¢«±¶—Â½9b*e+	*xZ|\èi3s@\Ò\ïÆ¥m™@A*\å}kÜ®\Þ\î\Ñ!‘8 `W•ø;P3\ßH\åc~5\Üøƒ]Hþ\Éj2\ZY7z\nòñr”\ê¥\Ù\î^£Jƒ“{³½µ‘\äˆ1‘V’›;˜û\ã­c\Û_Ì‘ˆ@\Û\Æ{U\è5\Ä\Î\ËÚ¸\ÏLŽ\æ!\ÌGNMy\'‹­|û\Ä\Æˆ\É\Ý\ÅzŒ—­Áqç¡®3\Ä\æ\ÆK\ÈÃ¸Œl\à*\î¯G%\Z\Éù3\È\Ì\â\åA¯4yP„À	\\r\å“8Ç¥eº…Á\'wËŠ\è¯t\É$óNO@1Xalu\çž	¯£Œ\ÓG\ËJ-2£,+—\Úg\îäŽ¾•Ÿ1^HR¹­8ü¨¥g˜\r\ã<\î*;\èb,§A¨=ÒŸ12—,Xe°x©ü¬„cž\Üâ •\äC°®8\äRV=\Æ$\Ôó`fÀ(yG±\â«3\ãÞ:\È	û®£œ©ªEÀž•”¤4‹aEO\\€²\0Â˜ž\äõ¥i\0]¤dvö¬\Û)\"7\É9‰ªlq×žzÕ†\Ç5Y\É\Åc&i,§Œ‘Ö«Ž2i\Ò¨\íH„\Öf\ÈP½ý©¥T\È\ÇnÔÀ<Vc+Ë¹ª¹öüjy¨Vr)0¥*i\\{\æ¢\â±e$fši3\Ô\n	\Í+¢¬;œRqœö¤\É	 g]\0½\é4ü†>œ\Ó\n.ML¹5	:®\0\ï\ÅR$\\qGCR{S\rh‰cNzqMÝ“O\ã4\Þ\ç\0£<Š;°M(À£µÃš\\c­E»aÇ½I»\0­“LÁ§\ç4\Ó\ÏÒ	J­/r=\éF)\ØÀÀÔ„dS€&\àRh1]\ç‚J<’F\Ç9_\çŠ\á\äz‘^\à«E¹³¹nŽ’‚1ô®u½„K-W\ÄÀõ\ëtS\î+†\Ð\ï.\'šù\'pLs•\Ívšs—µ\'Ž†¼\ß\Â\ï»VÔ¬\Ü ·O|\Zñ!\Æ^G\ÒUŸ,©®\ì\Ïñ\Ú[Iœ®\á“\èk\Î|W°xò\È&ž0QS\ë^E\Ï~•\ìà¿‚¼›>{1V\Ä7\Ý&GHp)\ä`ñHN+²Çr=§\0J;¶\rFE;Aõ\Æicg\ß4\ìb‚>œ\n›!\Üo\Ý4g©6\àŠON\Ø9¥Ê‡\ÌE·<\Ðsœ“ŒÓ°:\ÓU²£”W`úûRu§\éÚn†††˜œq\Å\'=úbŽœFÜ°ª\ZÐ¤{‡†\ï\ÍÏ…`‰9p¾Y\Æ\Ú\é,­„1¯=\0®_ÁzW\Øôõ‘²_˜ƒ]³p8\ä_;‰k\Ú\Ê\ÝÏªÁ¦\èÁµ­ŒmP~\æNÿ\0)5\àÚ©\Ý{&A…{Ö¤rù\àWƒj›ô ö\çš\éÀüR9s5\îG\Ô\Ë\ÚGR)\ËÛšq\É4\Æ\ê+\Ó<&’y£ß®)s\È\ëM\Ï4\Ñ\"ñ\Å&?*C\Û\'4j€Q\èy\Í!=(\'‚y\Îh\0ƒÁ§\ç\0SrF1\Ó9\Å9#?\0¼\ç4Ÿz—œ\Ñ\Ûn\n–‚N€q^\Û\à\ÏE-œJØ–1´ƒ\Æpx\"¼K%kªð¥±¼½x\Ç89\éŠ\ç\ÄAJý\Ü%ISª­\×C\éh¤F9Î¹ýX.WÞ¥\Ñdah¡ú÷5GY¹T\Î\ã\Ô}rk\ËK\Þ=\éKÜ¹\â¾(DûP#\0\È\Åru\Òx†\én/\\ƒ•(#¾+œnq\îq^\Í!Cæ«»Õ“óŒšnx4\áÁ\éM\ã¨\ïZ˜€#õ¢ŽÇŽ¦”\Z\0P§ži8\ëÚÁ\Ï4‡®E\0\'n(\ÇBqKŒyâ“ŒPƒ\îiãƒ‘\Å0zži\àúû\Ó@;ŒšNF8\ì\\\àò)F\Ý\Ø9\éC†ñÐŠh\àv©=\é‹\ÎI8þ´†‡c>ø\0šnsK(À\Å£EFN\Ó\×õ¥bv\Ñß§\0R`/\×4y \0zûšP\Í\Î1Æ¤\0\ã®;QŒñÖ•x9\Å\0ûŠ\0	!p(h\à“I´Š\0@q\ß\éNXz\ã`ˆö¤\Æ\âp¹,x vOøu¦œd\äóÒ“ð=ñAc4i\'ŒS³»\ä\ãš^=ù¦ð4›\0\è3ži@<æ“’1ò\âŽø\'Š.žqÓ°§=#\éN\Øø=iÁ	Ry8\ïC£z\ÓŽs\nÿ\0?Lr§­H\ê§\Éÿ\0\n\"\ÜGn\Õe`cE7b/CœqR\È#=J¤\Ä\Äé¹³‚sšR2\àC\Å._\n1ýjX¢Žy\íš9I\ÜpsVQ‘’95\ZF@SEL±À<ŽO?‡¸4†È\áò;Žô\ÖrY~_Ëš’E`0	\Ï<\Z–šfÁ^˜üjh‘4ûO3ÿ\0>\0\Éü\ëªÂ¨jœqÇ±¨­bH\Ð`ã¯­M¹~ñ`˜\é“Þµ‰“%%Ib\Ø­W¼¸ò¡-N6©)C»§¸ö\æ¹\ÝVr\î‰ÀýlšoaE²;9mÄ‘¹¿¥B\Èœ\ç\ßÖ“z³sœãŽ¹\ÏJ%²W\0tô¬Yº\Ð/8¡YH\'<v4\áµxùN}{óAeÓž½4P¨Û›sÀ®+·–Á³‘´Š®‰¼Ž\0#\Ôw§1Wb0Cqø\Ó%–£\"þð\ç¾qÚ½Ã°F–\ä©\ÎN	\ÍyÍ¼\ì®@U9\ç·cÒ»?\Þmf‡<›÷õ¬¦®Šƒ³;Á³<X÷ñdnN2¤ž<Š˜\\Â²\ì<\ï\äô\Õz\á#pFwúŠ\Â\Æò³‰÷†4…‰^€šò\íAž[—<pq^²ñ³Bv¯Q^Q­G4Ôš˜=NZˆ\É\Ú\ÊOõ©mlg¹˜*s¸\Ò\ÚCqw\"ÆŠY˜t¯O\Òt˜ôô\rµZB9o­n¦f\âA¤\Ù\Ù\éj±3(•ŽI8\É4j·&\"«g\ë\ÅnýŽ’Žñ‚\ÊrqX\Ú\Ü\Ø~ÃƒVž‡4¾4a™Nª3Šƒc3|ù\éÒ§!€ ¹8\ê:\×,Þ§}/…˜B¸Á\ÅV’4=T\Z°\ë(š„žk3¥S[¬d\ì@7zW\â-7R¼T\"\á#Áû¹¯E“b¹;\Ù÷³\08Ö´Ø™\ÆA¥›D2\\N\ço¥\\´¼·•\Øy§_Z¹,^p`\ËÁ¡,#Q[‰\"X\Ä2õ=)Z%A\ížs\éD6\ì2WñÀ©>ycŸJe¤\"¢\Ï5h…d\ëÖªŸ–•d/,*nP\É9\ÏZÆºi\áŒ¨¡<\ÖÛ¹#Q¢W\É \ã<\ÒÉ¶}på¥¹“,2pj\í®Š°\É,\Ù$’H­”,\Ëo‘úU\äö\Å&\Â\ÂYØ©‘:–\é“^\î Uaœ\n\â,ÙžU^œðk´D‡\æ#¥C&H\åµeI\'À\ê&±Œ;÷”\rk\\3¶[95™ö¦†‘œðª\ç\0sT\r¹Ý‘À­#\çoZ¬@þÉ§r¬gýŽ)$\è3\ëL{X‡A\Í_O3q\È©6Rlv0…ºo;ŽI\ÏöU¼Ž®H÷­v·o3v1Ö¤Ñ‚\0\ÌÒ¸XÁ–\ÄvœŒ\Z¤mµ&ùWG÷zŠ\éeŒ³F{ƒ@Ic\É(M4\Â\Ç4úL¬Á¥™\Üñº´R\Åü£\ÔñZ\á³/LVF0H\Zwc±Œw0‹–®–\Ê\È&S\Û\ÈÁÝ’+ \Ó!ó$-‘…\ã\ëXÔ–‡M\êg\\XI<Ê¾k{\nÐ‡Oû:\áÜŸz\Üò•_‡Œƒ\ÍqI\ÈÀš8Jaz\ãk&[(\å•¿yÜµa\È\åI\0û\â”UÈ›±‰¤P\\0P:æº„\íŽ\Õ\É4“Xœž1ZVS´¥ý\ëg!3{\Ë\'ž}ù«P\Û,‹ƒžO­yr¯$óÚ¤fòˆù€†²\Ø\ÞÉ¢ª\éy¥ñZf‹aRÒ¥GVPr3R}\áIÉ“\É\Ç;-Œ\ÈZ\î*¯*c-Á\í]NÕªW\Ã–aŸj¨\ê\Ìæ¬?\Ô%¸¸l²£ \ÅeQ€:óZú½ì—’²\ÇÀ1\\Áµ¸šII=ë¾šv<úŽ\ìµq{§\Ú\'™,Ñ…\íóg§Ò°\çñ–›\0)K#~ž<5hH,\Î\Z˜h6£\0F¼+S\"”^$µ¸p\êrsT\"\Öai™cM£¦BgŠ\ÖZ\Êp\éÓ v-*\Ú!…\0LSD™²Á§\\\í2mq×žE]·}>\Ù6D\éô\n–[HW¨ª½¬[\Ý]ü\åB\ãœ\Õµ%Ý¸lo\\­šœ”–2\"#$}\á\Ír_ð\ÜD™»zn?–~•rÁ\æ\Èl\à`f€!¼\Ð^iƒõÈ¤‡Bµ\\\rŒx\ç½u;\ä‘2«UO¸p99 V)\Çomb¸Ž09&–\çT²´Uó·\ÝZ¼\ã\ål¨\ë\î\Ê\ÚFé¸‚h\ã\â;WQµ]@\êI\ÅX³x\ï”©\\·\0ŽqTO´WW’W·U«’$\Ø\Ú0‚€5YceÂŸaYY.\í»²x4øZò\'\Ë\Ê9\íW‰¸ù1h@XŠ\"‘ž\í\çU$}‡¦ü€b²¤Ô®¢—`óø`Tð_4\Ät\êh\ËYn\Ð#\"õ\Ý\\]Ï‡n\ä”|\àö¯PYá‘‚#Œ\ã<\Zk\Ôr s\Í4	a¤\ê6Ž0\é[2iñ\Ý|\Ó\"\ïr\Ø\í]\n\Ë€rAª²cŸjCFi\Ë\0ýÒ•ƒ\Åw~·¸ùðI\Î}+*-ÍŽ+\Ðô›D‚\Ð1,3\\¸‡¥Ž\Ì\"÷®c]5\È\ç\ï\ã¨`3—\"Eñ®œÛ©\Ý\'|kÿ\0®Ìƒ5\ÅcÒ¹³^0@\Ï×\Ç$Š³6t¦\Ì~SI¶8-i¶Ü®;Ol\Ö+H®§‚+­Ö­\×\Ë\É9\â¹eR«œ|\Õ\êPw‚<j\ê\ÕE\ß\0\îÏ±\'­0\Êh\ã8üj\Õ\ÈV\ÉnZ\æ§{ñ.cE\Úza\ëš\Þ\Ç1\Ð­‘¸{\ÕfŒ*µ»\Ü\à‰q\ÅZóp£Ûµ\0f]Xý­¶³£®1S“œB8ÀX\Å:\â\é`\äcò¨Ï½y¶©«Iv\ÅT°Nù=M4&3W»I5ñ°;@ZËšb\Ã%²O95CgT’y\ã\È`_vrO½*šaaŒ\Ôñ8‰³\í\Å:\Ï@d\ÕA;½›…–1žµ\æ¾‡\çžc\ì+¼gUŠ\0@2Ø¯#ùª¿$}^¹hGÍ¶k³`~~3œ\ãŠÑ°¼z\nÎ¿Ú¶\Ï$\\‡s¡¡òelŽ½ª7\Ôm\í®\Ì/*‡c\Âçš¹£!Š\Ý\Ð\çq\æ¼{\ÄM%§ˆ%p\å°\ÊÇŸ\ÄÖ´©{I5~‡&\"¿±Šv¾§¡x¦\Ü\Ý\é€2v\î^ü©\Íx¶NÓŸÆ½\Ê\Â\á5$oQÒ¼—]Ó›N¾–1\Ìe‰R:sÚ½\\¾vR¦÷½\Ï2¦ÛU³V1&¤\0\ã4Š¬HÀ\äÖ¬\ÖQ\Ú\Ä²†f\n½«\ÕG’ÑŽI\æ¥¼8*=\é#{¯@7`Ÿ­wš~‰§I\ÈFþ2{\Õ\\i:\Î\îÜƒ].—cj\à™_i\È\Û]\Úeª\È<¸ô\íŒR6$s•\ÇsŠjEr—-’\Ö\Ù8 ŒZ‰c.@Q·$š‘,\Ü\0¬ƒjð¢¬[mˆmN\ÙÉ«¸¬z/†tx4{»šU/.I\è;\nË¿5\rL\\„R9\ížkOz\áw9!py\íY²\êsCq\å\Èb9õúV–®MÝ³¶5ý\Ø\Å+$}n\á\í\ÓøK,  c\Û$\Íy¬(ž+4föP\0­ÉµM8<\Òwž•\ç:rN\Ö=x×ƒ\ï²:›ø.#…N:’?–\ryF¯+\Ýj^o\Ø\ä’Ž\Þþ•VI<Ác¹eP0£5½\ÊmuÓr¤‚q^–“§+½\ìxø\ÌJ¬¹VÉ•¿¶lâ¹•e†h69„œ®C¸\n¡|Ö·@Kˆÿ\0)\Æ[|\Z\Ü>&\Öw³µì²¿r\çy\ã§\\\Ô\Z§‹u]GNò/-,f\É\0Ÿ²\Ä\ã\ÑÂ‚+ÖŒ\ZiSªÀÈ±p\ç\Åf;0lX\à\äúšê§¿µx=Œ\rÜž‡\0t\Ís\ÛK¸¶’r6±\â´\æ1±E\î€aó}	õV[Œœ\ÔÒ›r\ìYI?^\â¤/j\È\ÆHó‘\Ý1Y¹2\Ò*y˜\ÜCr*—8\Å#I91±Àn	¦\åJ\äT9b0h{R\ä\ãžsQœdÒ¢\áa\Çß§j‰‡\Ý\'Šy$0\Ç\áAlŽCe¢”£+Ö‘IÀ\î3RJ2¤\n„cŠÁ³DXV;hf\ãG\Æ)»°¤{\Ô\Üdn&¢.\Ì÷©›f>Z€Œvük9Š\Ï\Ó5\ã=*Ã“¶«gš\ÆFˆh\å©\ÔÜ\Ü\Zq\ÍE\Æ7>” \ãŒRu8©9¦{ƒN\ÏÔ›i@ü©€\ÓS!À\0ñ‘Qc>õ2\Çª“%Ž\Í;ƒŠnA\áZ\"\"¢n½*\ÇjŒŽ:PÀnI¦ƒšv2¥0Î\Ð\Ù2©T\ç’j)\åŸ¡§!;p\r\Îi\Ø\ã­ \âž«D	\Å8š2(À\éú\Õ\ÅÁ `\nNEBŠ–41\É\Ï\0dô¯Oøz\ÜÜ†\à¦¼µ\ßÒ»\ï^\î\Þ6ÀpcU\è\Èô²\æ–&¬i„–x	\ÈW5äš¶£6ƒ\ã)\ïbNCd§b­zU\ãø§S¶)ˆWú\×#ñMS®¤˜\ã\È}Gð×—†·´³\ÚZ\Þ;›\ÙsGx4\Ê^+ñ¶»dACŸ›=\ë\ÎsïŠˆœæž\09\Å{©Æœmž¯VUe\Í-\Ç\îõ ÿ\0JhlžMº9\Ä\Ç~ôjS¸µ7­0ŸAM#€\Þx¥\É#ô®°M/8ühS\Ç\'¿J=H¥ i3\íŠSõ¤\îx\Ç€LM\'==:Q–\Æ\ìqšL°<{\Ò`†öŠ¹ažú\Þ#\Ñ\äˆª¹$ú\×E\á{u¸\ÖmÁ–±­.Zr~Fôc\ÏR1\î\Ñ\îVH°[¢wQS‚¸\ä\Ô@lqSC“\'b¾jz³\ì)¥\Ø\Ä\Ô\Ûz×„\êg}\ì¬\0û\Õ\îú°\Ä§¸<W‚_m7sÜŠ\ïÀ\ï#\Ê\Í‘^l¦\Ø\Îy¦\Ç\ãO\ç½3©ÇµzGŠ\Äc\Í\'=iWŸÂ‚y8\ïL€#Ö€9\éÖ€­´\Ð½²ix›\ëNš`\'\É4df—? ¤\0PƒNQLÀ\ÏÖž028\ç½K\Zs\Æ8®\ÛÁÖ·\âY/m\Ê\í\0\Æ\à÷\Å\0v\î\íœ\Ç¯Fðt\Ð-œ‡xGF\É^zV5¯\ì\Ù\ÑCø±=n\Î?ôpCš\àü]3El]±!\Ú\0\â·n|CaxÖ¼«Äº\×ö„\Û#?\"®®*›šmhzXŒDU&“Õœ´¬\Ìùc\Î{v¨Ž09\àNsžH\Å4õ\ì+\ÔGŠ\ÝÆ·^ùô¥\È\È$\ÓH\Ò÷¦ \ä\çœR\çœRub¼ðhrQœÓ¹<S}hÁ Á\ã<ñ§0\È\É\Îh\ãœg¥&N0G~h)!WßŽ)\Ç\Ü\Òg®(\ÚF	\î\Å&A8¥\Î³š\0S·h¦g\È<\nq\ìE4\ÐÞ€3Ò˜—ŽF{ó@zÒ•\È=O½0\àõ©0§ \È÷ #<\ÓA\ÇQ\Ð~ó÷‡z0Tc\ä\Ô\0»Ó€Q\êIô\Ã\È\È\Ï£p\ã\ë@qƒ\ëŠi g#$R\îö¤\àPŒž¤P@\Ú8ö¦•\ã<\ëKª8\ÐIœúqNSœsI\Î3\Ï&€}½(Á0jL.	íŽµ§£Y6¡s\åv\Ú\Üö¦¾\Ó&³“cƒ¸ûcÚ¤W19P£<\çšx¶1š™S\r’3Na\Ï\ï\éBˆ(d\Z{1S\Ü^”­’3žô\Ü\Ç=\Ç_z¢“MÌ­\Ûþ4¥v\ã¹Á\äTˆ¬ªZ‚Cc#$­K@Ç¦\â#¯zžXq+ŒuúqU¼Â„\È\'$\Ó\ÃH\ä \ä\Z	#ÁV%O¾¢¦\n\Ü\0‡€1R@¨Ç¨\'ñæœ‹Ô—À\ÏLsŒãŠ¡XU+Á$ó\Ï^G®*\É \ç¡\ã¿PEFA(\0£€H\àœù¦\ì$òsœn\çúSÄ7pr\ÄF9¯gý\æ\é’\Ø\Çn\ÕN\Ò¼²c$©\äVÅ¾c+Ÿ›š´Œ\Û/£¾ý#¹\ÍDÅ›•$ž§Žƒ¦(F —OSšP\ä!e\Îr>\í^\Ä\ï\'1B\Ø\Ç>ø\Z\ã¦r\ÌN\âO\é‘[z\Ð-³¸\"°›\ÊsŽ¸\ëP\ÙqCy|\ã-¦{Ÿ\éMu\ïÀ©$ò°bXw¨Êžr3PP\î€ƒžiÀ\0\ç\0sŒûZh?6&¥\nÀ{ði¤1Ð09\Ï~ü})®\Ì\ÝX\ç>ý¸§BÍ¿ˆõýjk€0~¦†\"g˜úrs»µh\ÚL\Ð(7`ó\Û9¬¸ÕŠ°\Æó\ë“V£g\à·$ar\ÝO4­p½Žó\Ïª³Hr<ŒóŸnõ\ÚBUl\Ën\Ëc•\ëŠó­\"\â\"\ÞD§n\Üd\ã\0\àzŠôX$TAm\çù÷¬¤´>ðòúV&£¦E~1»¦ksª\ã8>µX0\É\ÃW“LÑ£#I\Ñ!°Là´‡«Vð]Š\Ô\Ñ\Ç#¦™yÀô­c&\Ì&’)gPw×Š\Æ\Õˆ†q[¨~^H\Îx¬=]²€\ßÒº“÷N9/|Àó¡,QXqL\Æ\Ü`\à\n‰\Ñ³Ry™\ã\Í=\Î\Ú_3\àcZV\àŽž´I³®úÆŽ\ÉR\æI™\ÎNrp	ô\ÍfuD»,lTðzk™»„,ÞœsÞ¶\ÂJX–s´.+\ë/\'\\\áº\Ö\ÐI\ÊÄ¥›ž:\n€ÞƒÂ‚£>”\émM§vN•_\ìG’\ç¸­\Ð~\Ø\0#\" ’s.=9\â˜lÙ“®\rB-ž3Šh¤NK²ó\Üc\Ø\ãlœ‘\Ïj•6y\ÅO,\ËÞ¤e$bd \ç5 ¨\ÃzT€\02>™\Å,Žô\æ•Ê±VH”±\ÆqJQPÂžqœûô¨žP¯ ©lN\Åû6.+z\ë{\ÅËœm\í\\Å‹±”m \î#¶k¦¸?ºôjHg\Z?w!9n½*s) ô\ÆS¼±\ÏZ8\ÓH„€¹\ÍHH )P¶qQ<ˆ\nsšeŽ–AÉª\ßk.pœT7_ht!K~+>\Ö\rH3\áW8[8 nd99\êP¸\Õ]\ä›~µ4sg¿42…\ä•)®\Ü\0iK\ä\à\æª\ÜH©Z,˜&\ÓòÕ¨\È*Èª±»2ŒóŠ³¼*õ\ÐR\"n\è­\Ý)+n\"\àg\ëZo¬E$@ñQ4\Ú6„’få¬¯4¯–Êƒ…\â¯r0+3NlFX\ç&¯o\ë“\Çj\å”u;ô\"ž5n8\æ¹ûÿ\0*8›`5¡u¨,0·ó5\Ê\\\ÞyÍ—\Ï9\È\Í]:m³\nµU\'ˆ1=óW­e\Øcž}«1Á	È­h°¬Q´Š\ÞPV0„õ;[4‰‚ž”·V¨¸u¬«¡¿ñ®…fP‡­q\ÉYž„\Zh¥nU»b´Bg,\rlù_Z’k\É\Ìglg8¤Yp\í®[]»\ÙG\Ì{úUõk£Ï‘\ÏJ\åõ(	S#¿Í’\0\'Öµ§x\æ¯+DÀb\Ä\ä\ä\Ó2[·\ãM\à’½=¨\\ 8»‘\ç2axÀ¥,OµE\æò0sO\ÈlUAXó\Í_Z•y\à/8ªLf\ÞwaTM\Ça<ÀARj\Éd½…TDs–$ó\Ðb¬Ä¿6\rPˆCŒ0zw¨Z(\È\åjãªõ>õ\É#8©\êY°q…\Î:b©³Æ¹\Î29­gd\ä`Xó\Ã\æ®\Ó÷rM0)#7»øf »µ\Û\Êg“\È$\Ò@†Álw«’q7}i“1›~½ªç˜‹Œœ¶\á\Ðtú\ÕsdRV‘˜\áªxÊ Û€1\×Þ€,£ \É<\ç¯(–uD\'`ñD*§$ñƒNšlŸ»@õ\È\Ø\äýjšY™¶œ{t\ÞVÑ¿Ö©M\Z\0v\ç<P\\¦#÷\Üs[Ñ¨\Ø2MURòTŒ/cW£^	\"¨\n\ì€)\n¸÷¦D<µ9uÉ«²<Q\ÎØ¨”\å\0\ç€j‘£CM\î\îP(=r+¸º˜\ÛD¢³´‹%±·óÜ€]sœtœ\×Rêš‚\"ð€ð>•\ÇSÞ“\ìŽú^\â]\ÙÖ†\Ì õqT¦µQ\"’8\Û\Î}jûµGr\ÌIb\Ü Á®k‰•\âb¿tqŠ¡¨ß¬!NFwt«±+o\ç\îŸ\çY:ü%¡VQ—Á¥8«´LÝ£tKzshI,¹®dy#µv¶2µÕ–8pk•½‹É¸aø\×mk\Äóñ\Z\ÚFsFÙ™ˆ\0t\íUe@O°Õ§c\È=êœ¬pB\×Rg)\È\É%ˆ”Ú”Ê¦\ç\Æw0\éZw\á\×iª`lj6MŽ/Z\×%º\Ú4Ø¡¾r:\ävª¶\Zl×»™ÊªŒ`¦ºˆô[8Y\î$ \äòIõ\éXZž¤A¡¨¤\"•ýˆŠ ÿ\0+qŸJ\Â`»q\ïÒ¤¸¸‘ð…²\n©\×U\Åm¢›\Éâ™©\0\Æ{\Ð#\Ø|\rk›Ãœ·5µ§©Ÿ]½•[\å…Bzó\ßÁ\éž2þ\Ç\Ñ\Þ\Ö\Ú\0f €\ç¦Oz\ì¼3o5†˜dº`%¼\Ç\Ï^k\É\ÄBJR“\êô>ƒ	V.‚\éN’@%Ÿ\ÙFMS*%™r¤€\ß(©Ø€‘\Ë\Ê\ØJ\Å\Õ|A§\è\Ò~ù\Ã:/\Ë\îÆ¹\ãI\Ù+“©«É¤\ë)P\Þ\Ï@1\\\'Š|/5õÜ·\Çt˜\Î\rO kr^\\=Ä¸qÀ\í]E\ÛÊŒf7qs£?3–¢§ˆ§\äy\ç…õ%±¸û\Öc\Ã\r\Ùþ*o\Þ\éS½¬v’+É\ÎW ²k“Õ¾\ØÚ”òÎ†7‘\Î01Ú‹Kä…\Ü\Ïµ\ìÑ ¹\ãWgm¶!û7F\Ú&d\ín«HûÝ²\çµ\\s\å\îTLs\ÅC,3¬bB0­\Ð\×z8J‘ i:œ]ÝŽ«c¦Úˆ\'™Ï­r6²\\\Ü,iŽzæ·—EógU-ò\à\å…)]ø”»„„|¤]´Ò˜Õ˜€\Åy¬¨4;dWò”²Ž;ó[b‘\Óð¥r\É	lö8\ëS\"/\0u¦¨\çŽõ7¸õ\íZ\"Y1Fq\Ï6ª¬ŽH<\æ¥L\ÍNÍ*…v™z\Ûl÷\Æ\ÃvN+{\\¹´[o FI dÂ¹\Ène·\'\Zm\å\Û\Þ9•ñ8³¼\Ó\ìn«5\æ¶\Ð)\ÈP9«?hc„9\Å6Xü\Å\Ã\ÕSmµ~Cô®ˆ»\ÍHc@F}qX77¿:\"¬9x&¤%‰“\ÆqX+q–-\"gÛ¸®¨»£škSU­\ØZ&±\'<t\ã©& ­o¶>žk#s\ï\ÏLÀ\Õ\Ü\Ê\ÅGÁ\É8ª	¿w\r[Ç¼6€j£€éƒ‚J†\ÊEEÀQN\0—\çi¹ºŒ\0j\Òa$Vw.\Ã$O6F:\èjBS»©@¸\êsšªA\ç=hlBf“8\â›\Å<Œ€sÖ¡±¤Bÿ\05E>C’{T\0\îâ²“4D\êø\é\éM<š/\áù`\Ñ\"\ì\nG ÷¨¹Vœ\Ôg©§f˜I\ÍC\Z\"5Lt©N;zS_Z\ÊFˆ…½©T\îiÞŸŠÍŒAŒSö\æš8\ç4\àH\Å4ô¤\ãp9¤÷£¡\éLW\n‘\rGÞž¹©	’€O^;óO\àŠh£õ­Q¸\Û\ïšo>”µ!\Í\nüS_¶:úÓ™py§ŸNµ,¢¹±c’{S°1ÞˆŽ(ˆ™6\Ú~­0Š“©ª3bw¤ÝqN\ÏN(*OQÿ\0×¦òœâž\\R¦0sH\Ý1Ò¡\ä«Z^¥&™|“)\Âg\ç¢ª’2qÞª²\ã©…D¤¬ÎŠrpi§f£uFMO\Ã\Ò\É\ÞP•\nðx\ä\Z\ÇÑ®\áñ_‡®l¥?½\nA\Ü;öÏµcü>Õ¾\×Î—)É‰7Gž¥\r\\¥\Ô÷\×n>\É!\\3;{W™\n\rJQ\ê\Ó=Š˜»\Æ\ÝI5$s²\Â`–Hœá‘Š‘ô¦az€jY\çk›—•°Yùj`U\Åz‹dx\Òj\ìo‡¯½)9£’EZ h\äsHO§<Ó±ŒúRd)\æ†ÀiúqJf¢,h\ÍE\Çblú\ZbqQŒû\Ó\Ç\Ë\Ôc4\Ä.\Ï4….9\ÈJM\00“I×š~;\ÓXö95,g\Ó8®\çÁo¿yñˆBŸs\\0^ \ç5\ëž°-¦<»FL„n\Ça\\x\Éò\Ñ~zøsb#\å©\Õ_ÜˆcÚ¯‚\ä\0Obk_F{‰ŠM¡“Ž:\\æ¡¤\\jŒ#2l;•ˆ\èk¢\ÐV\â\ÙL3œ¼yýExL™›\âC§°\Éú\×Ï—_\ëI^æ½¿\Æ\Z¢[@\è,ùÒ¼:w\ß#sÖ½Z‹g™M9\Æ)\ìµ ôÏ¥3\éÒ•ýi;u®ó\Êl@i1œš\\\nCÒš$qi8µ/øñ\ëGCøu¦œf¤b\Ìg\"•rq\Î=(¤sŠ\éJS\ëIŽhù1ŸSFYO\ÞM$RhbsS#H‡)!S\ßŠ]\Üýh°\\»•\Îz\Ó3\Ç=	¤$\ç4‡·Ò€¸¹\Éâ—\Ó“898<S¯¯4\Ä)\æ”(\ÛÞ“‚)À\ÇJ\0zS…8\ëGi\Ç\Ó\0\Ð3F\Üþt\à¼œúŠð \0œ8\Í\'<ùú\Ò\ç\Ô~t¼p~´†ò?\Z9÷\ëJ$w\Ç4g\èOj\è\à÷4\0$u\Ï\åJW\Ð\Z\09ûRc¦}ñO ò#µF{ž\Þô\0g&ñF2Gzq\â€\Zp8\Å8\0s\ÔI\ÆÒŒT€œ`šq\È\è);ƒ\Ï‰\Æ9\íŠ@/\rù\Ó;óÖƒ’F1H¼ö\éÚ€\î\Ç4\Ö;x§¾™SF3@\0<{zS‡84\Å\'­L\îôÁ€\Zwr1\èN(T\'œJ°¸r¹©S‚\0\ãœRbge\à»,\ÜÀ\'\'hô­\ïY¢}˜#ƒš·\à¨\Ù\ãn29À\î}k_Å\ï¶\Ü00:û\nË›R¬ñU\É\ã\0\Óc‰\Ï8\ã§™÷ùp\ãó¡RQ\×V‰šªnlt\ÜñO`«Á\ä\ç4œ8\Ç+òõ<\Ò;ü½\É\Ç\éTP€‚\ä\ç¨ö¤#\ãÈ¥R\0Qƒœw¦\È>~O^;IŒq\êp})Ê§#Œ1\çÓ¥G\Êò\Ã×­M6?QÒ•‰e”R\Ã ŸNx¤e~C‘üC=j”KM¥6’1‘Ð‘Ûš€8lõ\Èô\ïôª%±sÁ\àƒžjõ´lË¹\Ç\0\ä÷ªJJ¸^œžõ\ÓØ€‘)\àðp*‘\r‹ŒN[Ž\Õp\áG<\ä\Z¤ðIy\È\ä\æ˜dˆ*†`­ŽEj¬f0®NÌŒãŠ¥q&\Øx\'#9Z¼=ý3Ÿ~\Õ\è\n\ÃeIöÉ¦4Ž\ZYKJFsœ\çæª®\'“œ\ÕË…e˜–^s\Ô•Pý\ã\é\ë\ëY\Z¤;KŠa‘\Ðúc­ -’28\Æ)ø?t†éœŠ’¯ ¶v‘\Üq\Ó\ÍX\\ÈŽ½“\ÔóŠ¯&@gŸ «Àaózž=…(y¿¼\Þ\Ù\È\É\ZB|\Ölg\æ\ÃÓ“Þ£\Þ7~GŒ\Ô\ìw\0\\‚EL\0@lcüŠ¶„’Ã»2:š\Æ\Ú\ß1Sò{\ãúÕ3¡\å¹\Ü:Ÿ\å@™\ÐC••F@\Ç\\uúW¡Á%»Æ°£r}O¿\ã^N’¤\ÛH\É\í\ÆHû\×S¡\Èÿ\0l‰‹³›\ÆX~2W2œ¹O\Òö qL\n€“·ž\æ©%ô.H\äzxœ»\"¼s\ÐeŸCD¦0§=ª´Ž¬¼1I\åµ#æ—¿¯j\Þ4\ËñL¥r¤ó\ëXºµ\Î9\ëƒ\ØÕ¨-\í% «ó}\Ð\Õ[R‰Žr2k©=7ñ¤ó\Î\ÇE“»’O§.õQž~ù«r/-¶¢d\È w\ëXOs¶“¼Q_\ì‹\æ‰7\à\Ój\ÃŽ££\Û\ÓH\Ù\íƒ\ÇJ\ÏvtÄ¥},pDÇ°É—\Þ\ç“\ÏPk£\ÔbVF\'ŠÁ0\í-Öº €>h‡8\Í5\Ü\Îp}*©\îm\ÏÒ•SsprÀV\É\r0%žŒI£l±‚6\î\ïœ\Õ7žP	a·žZL£Hl\ëR)]£ *\Ä2+oa„\î*Ø¸F)¤\ç˜0ûÜšc)\Èü;\Õh¤¹S\å¸Xó\Î=\Z‘\ÜW CP²yrsžõ\Ì\ê!ŠÍˆ\n]‰\è08¨-<Q\îBW=3ýi4Kg¥\éÈ ©88­‰\Û1\×7¤\Ü\Ä\è\\H°«zšaÉŽcŽ­A\r‘¸W-Û®j¬‚!\×³¤\ÔòŒU¸#®Nó]Ö„\àA`]3Œ\ã<S)3´h‘Á\æ³Åœ»¿\Ö\è5SO\Ô5‘\rÅŸ–ý\ê\Þ\\€CmõXFS«X·ºöi\'•$Ê§5µs\ÍE“i=\ÇaX‘xkNYi‚\Í#Yù¦Y\ëV·[°OÒ­\Ä+¹9ZeÎ‘\n§\îÂ¨\é€6\×u3¥^ù!u=8Ç­4+7ö­\ìS\r¶¬\è{‡\äU;\í~dP\ÉjÅ½:š¶ºöˆ#\Þ&\\“\Ç5ñNŽ2U[\æl&1Uaó\r²Õ¯g9–\ÎX\ÅiOY\Ç>™¬\Ó\ãM	—\ç\å\éP}§A¾ý\é(\Ëq\ïŠVcP\Þ\ÂN7‚{s\ÍY´¼´ûL`Ê½s\Ç?sÖº6‘x[d\Íò\ç¡\Æs]ÅŽ™¤Z\Ú*\åxõ‰©q.2,O\â7NV2K¼+<o\ró˜ ‚\å˜ó£\ëU§ð¶“q6ù‘œÊ®òãŽµnx¾\Ì!A´ö(À¨T\âTª\Ìm\ÍÚ²ò;dò\æ²àµ†iü\ÅgôMa\\\ëwkx\ÒØŸ/‡`wg\ÓZ\\Û„Œ\\ŒUj\ÕF\Æ.w-Å§:.ù\ÏjÑ†1Ü±jÌ½ûli˜_#ñÆ¢[×…]\î3\Ï=±C\Ð\ã+¼°\Æ@<V\Ìn\0œ\Íy°Ö­©ó‚ŸF8«‡\ÄJÑ”‰\Ãb¹§E³®„ŽúMN$9\Ï\áL:–ô\"8\ÏÔŽp\Ñk,¹h\Ð;öxjsJ\0SŒŽEB¢\Í~°+›ùl±\ç\Ø\nÁ”½Ä»\Ûõ5Ü®€I$‡€*¢\\\Êù\ãVð‡)\ÏR£‘,¨ù\è:sUœnö\ã7ž\ã\ëÖ¥VF6+D`b¼7©òƒØž•j\ÓN¸y\ç\'“òŽ•z[˜r\ÕV[¸Ê‚„\ÓªÃŒTqUHbp\Ù\ÛÖ Wie\ïW60olP]‰Šdl\ïÔ¸*sŠ…\ÉÁ8\éN\ìM±\È\à\Õ\'D7ÀQ\Ý\Î=\r0¨V\Þ\Ì\Ç)\ÊF{©Á\Ê\í ý\Ñ\Û¦¥…drC³`¥]ó>L\í953p\ÆqM1ûƒø\n®\Òˆ8û\Ü\nš=Æ†P¾þ\ÕAr¹=3Ûœ\æ¡Mž`Œ€y\é[c{g\0zÒ‡&S+‘\Ücz_E\\t¦º\äö\íUbºY\É\nW#¨•\Ýù\Û\Ï^hbB®:d\âª5¬RO¯@i\å2O$\Ötúµµ«m•±×Š\Z¡U€1R¹8¬?\í›\"\à, s\ÍZ[¡1\"œz -H‰!PT\ÔV¾—mž+{ö¬hRu¹Ý“É©¥ŸÊ‰p0)5t8»3 \Öõ5g\ÄùQ\éÞŸ \Ä#I.­r0^[\\¶\ÐAÁæº‹›\ëH\ì06d=ºâ°œ,¬Žšu/.fo\Û\ß†–`~D¬3¯2\"÷³š©ò\ÛY<ù\Üc=9®hˆ*ƒÇš\ÍQ\Þæ²®\ì¬z]µÈšhùùEI$ð\ÜW×š\ä4\í[\ì‡i#pz\è-õ¨w.X\0zš\ÍÓ”Yª­\ÇVW³†\ê\Å\î6ç“€8¬][Q‚ò\\ª`É®¾[‹K„\'paŽ•\æ:¼ö\ÐM&^r5­y3ž»²C^A\É9öÀ¨°§\Ç\Ðq\\\Õþ­2ŒZÄ¼=k‘¹¾\Ö$\åiH<Š\ì8\îtšžµÝ¬QH\ÞGò«7\ZÕ¹\\/\n0[Ö¸K5\ß?™.H\â´&¿µˆ(	8\àP\Ù†­ª¡…#UOAÜð®2\æ\ë\ÌoÏš±ur÷r—q\Ð\n\Î\'¡==i	±ŽK\Z\'¸­X-\Z[	¦\n—Œc­e’ªD6š21š@0H©}úU=\Ã^‚(\ÓS¿e\Û\Ö(\ÏO÷u:Í‘\Ë<À \ä{×“\Ý\ê÷\×p$)G\ÑG³¤“=Ò¹g‡u%yHî§ŒTchD\ï5/\Z8%m6\Þ\0W5\Ä\×24³\È]\Ï9ja>´\Æ^Õµ:0¦´G=\\EJ¯\Þ#_N\Õ%°pÀ\äg‘^½¢\ë0\ß\Âð°ù»\à×„\í/[6\ZÆŸ.bn…E\\:©ª\ÜÖ†.T´z\Äô\ßµ’i\îd\n[¤>¹¯5K¹(\Çj\Ø\Ôõ\Øõ%ˆ\Çû\æ<·j£§X5\ÌÑ«8\ï]Zn;3›8Ô«Ì‚\Þ#*‚pY\éL\Ô§b7\n¹À5\Ñ\Ë\Z`”Ä£…\êk.\Î\Ån\ä\Ü\áˆ-\Ï=«¬\ç4ü?gp™H%Ž@\â·\ÙGL´\Ømd¹W\nœÄ®B\ì\àf¤´$NŽJ¨\'MYÛµq\ëO!B€.Uˆ9\í@\Å±\ïR®B\àÐ¥=i³ùÖˆ–X^\Äþ50#ƒŠ®¥}i\ÌûF}+BY9l\0\É5œ.&g\æ</­OG\'8\çŠU¹½·V\å°3Ž)\ÑË¼S\ÅLR\ÕX\r\Ü\äñC2g@ýi\\¦W»uxHqŽ•\Å\ÜùfB@\ç z\×Qu+\r\Ã<0\àW&K0$“[\ÂG=AsŒ\Ô,\ç·a\Í8¤ñ€r?:\Ø\î\çis+IrWi\'½E(Ú¾”ò\ÞXÈ§\É\"\ì€a·§z†\ÊH ¸$\n½¬²m0¸\È\É\ã\ÛÖ¨®\Ý\ß+Á\ëS\Å9ˆ‚¤Œc¡\ÅH\Èz\ZfrÃž­þ\Ïw\Èùd\'\ïvo¨¬\×9ò=©2P\Ê7\àŸ¥1‡\Ó<\Òv8¨e “\0dU\\çŠ•›‚B­óq\Ï5”™¢%ŠQÁ*G\âb*¶x\éÇŽ3\ëQp¿xTLÄ\íO9+Œ\ÓT¶R\"bsõ¦nž\Õ!\äöÁ¨\Û<\Öl¤\È\ØS‡§½!\æ•OÒ¡Œ\\\Óh\0~4\àzRi c@\É¸Á \ÑKœ\ÓJh\àš46L=\éýG­B8aRö\ãkTfÁº\nQÒŽ:Sù5B\"q\Ï4\àS°¯5\ÊŠ†R8\Í \ã9§Á¦\Æ9=hC\'P8÷\á@ðqô¢\"\Âb—4žh\ÏSÞ›„=±L\'+À\'l=\nù$qPÆ‘	\É#Žk¡Ô´\È!\Ñl\îWI\É=ó\é\í\\\é\É u\ì+\ÐüKl\Ö\Ú\r˜ôÛŽ\ÝEa\'ª,\àô\ëÛ6\äOm!G\0Œúy>\î\ê[Ë‡žf\Ë1\É5K°À\ëN\Û\ï\Å	+—wk\\wLSûÖš0;*N9« i\0û\Òu\äu õ :Ó¸\nx5­\ÅJ\ÇÁ\Çª\Ì\Ç$u\0Ô¶4„Ÿ¯z“\ZŽÃ©50\ÊñÚ¤¡\0À©	\ã\Ó&˜1ƒšx<\ã?Ò©/B)0J7v\ëJ=z\Ó \ãßškƒ\ÇÖ¥<`\Ôo\×>¢¥\Zz&–ú¥üP\0vó°þ\ë^÷¡­ž‡hl\ÝJa~CŽµ\àšF¯}¢]­Í±\è\ÊFCô¯uÑµƒ®Ù‹ƒi\åóß‘šòñ\Êz)\íeŽšºû¡¥÷%ÀaWmWË´2I‘P3DŠK\áV¹W\ÅZm¼\Å6\çÁ\0À¯>0”Ý’lõ\êT…8\ÞM#\Íü[|nu\'\çrFHÀ®5>µ%\Ô\ÆiÝ²If5[úWµJ\nK±óUª{I\Ê]\Øõ¦\ãŠv\ìgŠN‡\ÔÖ‡8\ÓÖ¥H¾]\ÜwÀ¦‘\Çj“$`PL\ÓŒzœR9<\Zv:rsŠ\0LsÓ½\"’)p\Ì3\ëHÞ¹ 8\\`qFJ3\Í;± À¤¥\Å%\0!\'\ÐRõúzb“ƒ\Î1@\è(üð\r0žiùi­¸÷q\Í\0\'zL|\Ø\ïšL\æ—\Ó¤€wz•\"ŒœœRŽ\ãµ0§\ß4¸lÃŠn\Õ8=y\â¤\ä—Žq@¯9\ë\é\êi\ÙÀ>‡šv\Õ\Ç=\é0[\éŸÊ“†“ø\ã­!\ã§r\Î?H\È\ê\àu\æ™D<c¶)G=iX0<\Ògƒ@	“‚})ýsÀ¦\ã#ð\æŽy¡ ¼\áj,Ž3\íObH\É#§>ôÃœõ »QÀ\ísÖžH¦cŸ\æOµ+€¹¯\0Ñ»\0\ãÿ\0\×M8¥\ë\ëHs»#hƒRm&œ±\í\Ë¸\Ña\ÜfÌ‚S®=i¡sùrj\Ð;\0\Â}M;c~\è#‘Š\0¨#8Á8ü)\Ûpûú\Õ\álTx\æ `ŒŸ\ëH¢]\ß(^sœT©o¦E8{Ž\Ô+þ\èi\\‚S\0\0A\ã\'\0ût¦G¹\É\ç=i¹ /¹\é\ëõ©lsð¤Qý†&å­­q#k\'\ä€98¬_¶\Ûs»‚˜\Ã+zýD¶Ì¹\ÎP\äW#n\ãQGƒ^\ïI\\p0z\åŠ\Ëf\ä•\àcŠ\Õ\Õ#\ÛpF7ŸZ\Ê!r}GWL^ƒ°À\ìqnis¸Ž?.8¦9\ÏQ†À\æŒ\ãŒ}j\Æ&rr\ïzBŽ:z\ÓI\Û\Ð\æ¬*ù„68Ï¦1NÂ¹\ãsdŸZr‚zg¬vn bšFô2GŒ‡9÷\ã4\ì\áx¨Ÿ§§‘Kó\ã4„\Éz\ã \Îk¢\Ó\ïlqüªs€[Ÿ\ÔW3‚Hñ©U_i\ëž}ª\Ñ-E÷žaù>\î9Á\Ï\á\Ås\Ì\ÎYbONµnND;]I\àdz\â´#¼±œ Á\ÇaÂ­2lQ‚yÁC8\'ük£V}ª]F\æ\0cÙª¸µ‡–ùW¦G­*\ã#$U\\OUƒl\Ì\á\ÏA\Í`†À\\ò1Žk¨\×\Ñv\às\Ç÷\Ård®O,¸²e\áS?LT™Ü£\'£TE½F}\Çõ¡\n«tg>ô†\ÉT\ã‘\Ãs\È\àû\Õ\èfwO\Í\Åga÷\É\änÓš»nð…cœmõ E\'pA\ÏNiCœa\ÅHÇœ‘žFFÀn R\"\ÔR|¸!z’=	\ïšsð»·r<u=3U6°nnõ>_pö\ÎI\íN\à\É\Ô?P+\Ö<!¤‘!NMyDQ‰\n0N}+»ð\Ä\Ñ\Ê\È:n\ã\Û=¡œµ¶g\èÐ¶„ž‚œö¨Gõ5QgH|\ÜqL\ÓvPG@zWˆM²e·Á\Ú4’\éðÀñïŠ¬uUvSŸj¬ú©(Ky­ s\Ôi#Q!#!>Q\ë\\\æ§q+ûÜ…þt’j\ÒIQ\×&¸\rrC\Z˜òx9®\èF\èò\ê\Õ\å’:§™†\ç\ë\ÍE4ñÂ™f¿5\å\\\É ‡l\ç\'š¥w¨\\Í·s»Ž‡-X\Íjzex¦zyÖ´õ\á§_\Ï&¥MF\ÒU8™0:ó^.¬Û<Š!º\r¨Oø\ÔX\ëR=3S¾‚Rª³cœj„“(@KgŒcük\Ï\ÛF¾º‘\Ò0¼\çŠv¦º¦k\ä\Ãtd-Ô·\\\Z\è‚cZó\ÄÖ°‰e%e\Ï°sYQ\ëú´¹fµ…Tð£$\ß5\Å[Y]\Åv&!m\Ù œ\Ç\ÍwpMr\Û\ÛG\Ç\Ã5µ6a\Üø\â\ïM}“Z\Æ99l²‚\r>\Û\âÄ†&³m\ÙP\ÛNî½«¯}6\Æ\äf\â“<œóY·:N›i0[\Ã\ë€\0©Ù«\rõ´\ÑoE;ºÃ+û\Äö–s¤¶™”ñ:\ZÀƒ\ÄB\Ò\ëÊš&ÛÈƒ],²Z\Ü\ÂÒ¢FF\Ó\Ødg¬>aöš“9ÀW€;O\\Š·tÓ•9=ûW—\Ü\ê\Z\Ô3³‚\È0A<÷Á\àöwK\Õ5;«—Ò²)9Á¤\Ðs\ZWº|Úò\å’8‰\é\Ï\\\Ö4ž?<wO#dw¯A›A°ž>¤8\'4°\èq@\×w\Çq©bl\Ã*öp¨.I¿z\êuÛ‘!@Àú\Ôé¤¤ªw+Ú¹]SQ»±÷u\ÜqŠ\Ì\É\È\ä_X\Ô\"»-,{¡.TœWii©ZN ™_¸®=\í\Û\à\ÅÝŸz†M\Ï-4zšd`\íw\à¹¢‰Q™\ê\âd=\ây©Lª<W…M\âË›0ñF\Ùª°=‡¹¬¹üS©J\ê|\×8\'=û\n|¥óžÑ­j–V\å\í¢T9ô\ÃEñ\r²X¶¿]§Œú\ÖM•î·®¹¦‘ü¬ü\àg\ÓÞµ\á\ÜG–¿`’\n†\É\ëÞ•…\ÌtšWˆbÕˆ\äö\Ítiz|\ê±‡\ã½p°øY¬¼n¥Nw°Á­\Û]u-Š\Û\ÝJ\Ó0\0\0rE	\r2\ãøoDlÿ\0¢ªþ”6›ko\ËT†1\Ôc’=\êù{K´\È7c\éš\ÉOG\Þb\\\Ès³<{Š´Q\Î_x\Z\ÓSg•‰ŠS\Þ>Ÿ\\W#\á­_C‘\n–¸‡”=ˆW·DR\Õ\0-\Æ0Nk._hü\Å,¨„\ç†\ëL–p\Ú½oir|²p3Žõ¿y\â«x\Ðf26~P+.\æ÷\Ã\×7lY¾n­\Îs\ê*µ\î\á{\åX\Ñ\å†C”ùQ}Ï­¢\æe«ŸLÁ#¶…]\È\Î[8±Z/m\â-b(\Ò[oý\àƒ\r\È\îk\n\ÔhúmóLœý\ìuÇµvV^ ‚L­hÁ<1\Æ(°^\äú?‡c±‹\ÊVy±.Xò}†;V¯\á}R\î\îY£ºò\ÈûŠF\á\ÅlXø\Â\ÚyŽ\ÈW\å\'l\Ô~,[\Ù\ä/#”€sõ4te\é¾×¬Ê»\ê\n\Çû›N*ôñ_2\"‡9\ëŒYW¿-bgX-Ù°\Ø\ËW7/Ž\ï¦\\yQ/¨Á {\ÓI…Ë·\Z]\Í\Ô\ÃcÁ\êG\êhš)l\ØF%,{m=\ë]~þ\è3d\çœw>¸­=>ne\Ì\×A;i\ØIšk6µ\0W	,ƒ‚\0\ä\0+«\Ò\îõ‹–\r-†<u\'ðûYm cK‘\'<r;V°¹\é\×\Ý*¼}K\nÊ¥nC\ì1«nC´‘Ž:T\ë{\Zú\Ó\æaÀ\Ç|\ÔY”\ÙN\îH˜\í.„g\Ö-­Àº+…taÁ$µ\Ô&X\à\àÓ‹¤D±L¸÷¦Kf7Ù‹mg\àž\Õ9‚\Ü`uª—ÚŒ“¶¶S\Îes€~‚¬\ÚÁ+\ã\Í ·CM\n\åÂ£·Šq\'½H\Æ\05¸\ìqCE\\”\äŒ\â¡\Ã‚\'˜x©!E ¹Žx³\Ý\ÑA8o9¢ûG>•–DfBx÷\Ìio\æžM–±+·9f8\\V=\Ìú±¸V#žqƒØš\í\âH\0¤b1²œŽ‚ªÄ³&\Òk£þ°(\íÖ¯\ï,µ]Àec´f\\½Ô¬Ñ®U²1\ëƒLFº$e·¹\ÏÖ™t\Ñ2\ä\Ü\nÌ·²¼$ov7•$÷V–¬\ÆY3\é@fÓŠx—\0qR\Û[\ê	¹¥œ•_\ïS†­©û”ó›o=…s—\×\Z\ÍÌ‘ÆŠv\î\á3€;s@\ÄH¯Û˜{\Ö\Ú\\7·H$MÁNI=±P\éºn£¶^MÜ‘Á\íÖŸ:Km´´›zI¡xø{NÝ…€y«\é«	3´Àt¬»MjaÄ°¸ô\'ƒø\Õé®Žw«pWš»	³D™‰!€\ëž*\'H¥%Y3ŸÒ³SPÂ»\Ü{T’\ê0Dq\æ/¾(°&Z[X#p¹©Ž\È\Ô\Ã\\\Ö\rßˆ\ì,\Éùƒ¹ôôõ5“c©K¨M¹sÁ¢ÁÎ‘\Ó\Éw’UO\'¹¬‰õK{wÁ•s\Ôóš’ky¥Nš\å\áh’\ÌsýÐ¦ŽR¹\Ïí”•°¹ ð+v\ÎY.Ë…íž¦¸Hg¹o‘\";W*8\Åt\ê7\ì\ë\02¼ŠN#S±\Ô\Çz\",#lŸÂ¸Mz)\ï.N$ù›95\ÕES´õQœ\ÖH–´œ\ã;I_cIE!¹\\\åR	4\æH™‰\çwcš\ÑQ$Ñ±+Ž˜\ê*\ã5\íÄ¥‚¦ð1À¨u©\Ú\Ò\ÑP¹\à‘Lƒ$Ä‰h\Ä›¾k\";i©;Û·5,r\Üly¤8\ÇnÕ÷\ÙKËŸ^”\Ñ,žþ[[fQ‚\ç þ5\Ìð\ãV\î¦iAvxóTˆÀ\Æhh–vš¿\Ú,.\Ó=TW ñ”‘Õ¸*H5\Þø)K\Ç:œchñ®k]„\Û\êR¯4\'­Œú˜§\0RÞ öô›Ô‘Z!\ÆN1œS3O+ŸjhIf\ÜóLx©N1LÀ\Í\ß(~¼\åRmù²;\Ô@sZ²ch\Øp0yI	€`\rv:;\â2c\Ð\ÕÉ¤,\î\0\æºk)DX¢ŒdŠ\Ñ\"MK\È\Ù\î#·nŽsÀô\íM\Ý-†R8ÁQÑ±Sý²\Öi\Ñù?_z\×Ym®\á(Ž=\ÅP\ã]H¹d\ËcšE¿¾‘‘CÞµ¡\Ò\ì¢;– X÷nqVdc\ß5-”Žqu\×°\Æsœn\éƒ[¶n®Û°0\0\èx\ÍV}\'\í›#ù³eŠŽõ£}¦øf“,3I0e¬ýj2\Øb:VP\Õm\Ë»U\îµ%xÈˆO¬I¹¸ò8BÑ€\Ü\ZÍŠús>Ý‡$údQi\r\Ú\"³~\ï ƒ·Ö¶UTƒòƒ‘V„\nŒÀ0hó“y\\Œ\â™(&2Â°%²½YCDû\é¶;\î±<cM|\Ñr\Ü\â=£\êi°‰—!òp856\â\Ø\é\Åf\ÙHkÀ\Ãò=+B#žO8A\ãš\í&»X–À¸k¹TM#«g,H#§\à+HHÆ¢3§!™±\Ç=*4uß–1\Ëƒ½WÉ­yŒKNc\ÜHÈª\×ˆ=GJqa€¼g½Ww\äûŠ\\\ÃHH\Ç\Ì*V9½j¸\ê\0§‚hL6\àzñL\É9\ÏLÔªKM!h¹$Drj.\êpqš®x\ÍCe\"7 \Ô\n@“ú\Z•\Ï\Í\ÍB~÷µa&k|Œ\äf”ž*\ÜÔ™\ïŒÔ”)¨\ÛssR2\àŽx¡\É“»\naú~5!\ï‘L\0\ã¡€‡¥4\nSÀ¦ŽE&‡¨ñCv\â”p;Rõÿ\0\n\Æ(§…\ÆG½4\à\n  -\Æ@&—8\æš\àc©©\"¡†@©FkDHºE\"”\àŠnxªlH\\r=i®0\ÌsÇ¨§\äbƒƒR2>v\ã4 =\è\È\íB‘@`\0w4Î¸§\äõ«ŽJA’(\Æz\ndŽ¨N7\Ô\æ\àýj\'\ÉQQ!¢[xŒ\×0\Æ0J }I®¿\Åú’°‹O‰\áwŸz\â£.D \à‚>˜¢\æ\á\î&i\å˜òz\çƒ4#Oš¤ô˜€x&¥û§>¾\ÕHcðL`\Òô\íH8È§t\Æj\Ñ<ŸÊ“šŠ‰ù\'œ\ÐÀˆ\Ýø®jVU\ÐC({\ã4\ïa\ÜÑžx\ZUÁÁ\ï\×‹ƒœcµ\á“\ÓÒŒ`\ãR$vÏ° q‘\íÒ“\'¯¥)\äc4ÀN{\ÓN~)\à…`v\ä\ç\î‘\Å@ÀÔ±¡¼µ\Òiþ(\Õô\ëa3a #8®o¹\Å&qíš\ÆqŒ–©3hNP\Ö-£¤ºñ©{•–c\×\'¨¬‘‹±¦deKg\ç™Ç§*Ž\Ê\ÅN¤\ç»o\Ô\\œg=\é9 Œ\ë\ïG&¨¼HÀdûÒž´ƒ‡Š.\0\Í&@?Jv\0\ê)6€zu\é@\È“J{\ä™¡\Å4-&†E3ž\0úRv\0ÒŒÐ€\\\ZS\Ï8\ØÑœ­\'S\×\é\éL\ïFM+m\â“\'94\0\È\ÏJ0\Ø\Å\Ï&¤ÀÈ 8ã©¨\È\Î3\ÆjL\Ê\ç¡\ÅFx\â€ª)ÀsœS;ò)F\ì\ç=Fs\ÐP¯\0g‘RawjòFvâŽ„}¹ =€>\Ôüg­ü¤ša\äPRC¸F21Á£œÿ\01J[<(\ÎH­^\Øæ‘žþ«N@@ 5_°\íC»”Ûž†€\ÙÏ¶(\ÎAÇµ {94Ÿ/¨\çŠ\0U\É&Žÿ\0J\ã\ÛÒ”\ì\Ç\'=\èÆ“\Æsõ¨»N8¤õ\Í&0\ã“\ÅöŸ\ÈÖ…„—Q¼Š8@1\Û$ô\"l¦Œ`\éšp$\éSHŒT\ç\Õp1Á\Í41Àr9£ g$\ãÛ·þ\Û@ \àR¨x\çŠl\0Ë±pUrzž¼P¾b\0u›¸d·9\0\ã¦)…‹pF=ñ ©Pp\Çp\ç¨> S\Ìy8¤5Waþ4\r2G¶p\æ˜[2`\nDÀ\ã“N\Ïž:š‘\0\ä`\ç†ÿ\0õS¹\éÙ¸À¤`Ž¤j‰3½W¦[‚zR`{¨Ä–Ñ€£!qÁ\í]š†ö†$Œ)\ÅrºD1Gmôˆ~µº\Ãj‚1Œc§J\çi\\JG–ë³Ÿ´\ÆsØŽ\ä\ÖRW=«§ñEnó´|ùúW1¸“Ó¿<ÿ\0k®©Ž¹`^´õ\Ê \Æ:\Õp\ÙlŸÆž»Š‚\0¨5 ‹P<j\Ç#9\ëW>\Û@¾{\ä‘Ö³\0\Ç<úz\n\Ì0{N\àM<¾~Iãšˆt÷\'\×\0\Ôcnq\é\Ð;U¨¢Þ¸<1œ{\Ò3\Æ\0ÀÀ¥\n\n\å»þ5#ax\ëžyô§“Ôœ“B‘0\É Ú—w§|ÿ\0‘Hœ1ùx$Ž\Ø>ô\ây|Ã…8À9\è{sTŽ1À÷§0H¢š·$`æ•†<\åN\ÏL\ÓL–\Í:óx1°\äŒwS[(\Ã\Ënp=«·šh]1•a88\ï]„R—¢\çŸ\Ë5I\ÌýN1%£•\Ù\Ï\Ó5\Äc†þw÷(¬OAYz\×2þõ°O^xç©¡±\ÄG\á†=7c·Ji\'€Ý¹\Ü\Ð2‡8Á\çŒóŽ½)\ß:\îwú~UE±¹]øe\0dr?¥X´dõ#“\éŠ`o\á\ã®G·54m´òqšWB\"\É\Ýóc\éŒÒ›ƒº?ZšQ+;7\ÞÁ±Àü…7•û\Ø\ÚO\ëK™\ÍÇœó\Î>¿Zw\Í\æp=y\íSW\ä°\0\ã5uI3’p¾Nh\æB-\Û%<<‘]·†]¾\Ø\äªaJ\ç¾@úõ¯>\r‡ùO#§\\\â½Á°™$3–\ÚU”|¼bœ¦¬aUh}\Þ\èžF*e3!\É=zÓ¿µ\ãû¾]Uº\Ô\ÖL€•\ã#¹–\îc‡f\â\ã$põ¬Y™öõ¦–\rU\îbn\Ï¼J¢«¶\ÞA\×-\â !k¡‚Cö`ONk˜\×\æ#\éŒó\ßð®ø=.¢¼\Ñ\Ë\Ü$o \\\âµô\èt‚\Ò&L¯s\\\ÌÒ©”\à\ÆsT¦›bŸ˜ñX\ÍÝž…¤nt(ÀÇ”@B\æ©I{Wª6{Ž?•y«\\\0Û²c“O{ûˆÔˆ÷õ¨[W\Ð\Êñ=ö¥,»-Á@ne<\è*ž„.\åN¥;,Oœ‰N\ë\Ø\×?ªj³%Ú¼rü\Øô\ëùV%Þ­y¨:½Ëƒ\ì\0®¸\'b/©\îf\ï\Â\Öe·Kl3\èÛ«\ïÆšLn\Ì	\îFxÕ´_i”\r\ä{‘ùsWg\ÓBI±d1\Ï9\Èµib”a²ñ=Œ\ä#JªI\éš\Ô\Ôfºò7DˆÀŒ‚Nk\çö2\ÂI`U—±\íŠ\é4\ï\ÞD\É\Ì\Å±µ\Ï¿-™£7‰\Z\Òo&\â\Û Ž:qW,õ{IÜ–b£’¥t\Ö\Ú7‡õ[›¸ \É\åƒqT\îlüjUD¡ž6\î|š\ÎwWñ ‹0Ä£<\à\Ð\×Ú­Ô„3\Êû·d“ÿ\0Ö¯Y\Ó\áðû§\Ín…û;Xþ5\Íøš\r\Ë[C\å1\Æ\0\Ð^…¨jó>Ï´ó–nµ\ëú<÷2Èˆò_:¦¡v‹t<·\0’¹\äf½+\Â÷\Z&iû:\Æbr=ŸU€¼;\Ònƒ;k\ÍuE»¹Š@	\'ØŽ}y­¤\Ôe‹žF+3T¼•\á+må‡­f·0lñ+˜\î\Òs\Ëd1i\Ï0+)\'¹f*I@8\ëŒ\Ö\î\Û\Óu\"${Ü·\0÷Ò®[øcR¼|\È\Ê.rOµt¡Åœ\ê$\×rE,\Ìx\0WEo ›X¼Û‡V<p9Eu\é™\áe\ËB²3¸ž?\n¡u\â>øº„H¸\Ëÿ\0:f—4¬|Ig¦\ÂHÔ”ô\â¢?vˆœñƒÒ¸­›R™–\Ø\å#\'oÿ\0JÐƒÁº¤‘™<\È6– l1¥`¹\Ó\\ø\Êµ\Û0+\æ•Š½§jš\Ã\Ê\çøˆ\È\ÂÍ¡Å§¦ù›¯¡\È\é\ÅQK»X ƒÁÀ¤\Ó=\Êµž,¤œsÉ¨¥\Õ\â\Ó\ã\'{\äzŒŠò)<DpDÀ(\ä1ª\Z\Ô\ÒÆ«œñ\éN\Ås‰\ã6”´Å¹°qTô\Ét\ËÙ·_Ú‡;³œƒ\ëž1\\<\Z\Ò\Ú\0U¸$\n]C\ÄÝ²ª€£=²=\é“vvZ®w“MuAœ\r\ï\È\ÍIc\ài\ætº½¸FYSq$W››»—!Œ¬px9\éšÒ_ºµ\Â$¸\Ç\\P#\Ó%±Ž\Þ1\Æ\Ý\Ø\Îß¡¬Å´ñ\ì†Ù¬€@0\Îpi\î+\×\Æ÷V .õ9™ü\ÅH¾7»” e†8\ê{Rlmž‘a¤\èšuœ\Ë<+–\Ç\æ ã¨®\'Q“N¶´h\â—k1l’O¿=*…þ©w&•\ænm\Òúž‚¹\í:\Ö+\Ù@¸™€#õ84\Ñ!³\Ó/µIü­>\Ý\æ 1l¬OJµ.q§8Y\Ùôm§J\è®\Þ=\"\É\ÓN¾?7$\Ë\ÔWò<\å\Ø\äòj\Â\æ\Ì6·7(\Z0¹À\ÍS¸µÔ­Ü«†R¼©\ÎA?…l\ÚjV0û½Ï»€N…tÏ«[On\Ð\Ü\Ç\Z6:\ãœ{PZ<ño.`\Ãu\çz÷®Ž\ËÅš„k³?/@¦-Žòs”lqô«±j:Sh¹\í\ïI2\Ì~)?z^9úr#\Ñ\Ã\â«wˆ¬pœz³b¹–\Ô4IŸ\Ñ†?ZÛ‡Dµ¹Qs¨ŠG1‘\ÇpjlR“ø£V\\ˆ\ì7n8)#ZÐ¶º\Ö/^TG›xÁ5h\ëV‘ªºøÂŽƒŠ\äõo\Ü	YLkÃœÒ°ùIŠ\Ôl\Ã Ž1\ÏJÆ¼–hr\Ñ+“Ÿ”õ\æPx\Êñfmò·–¿us]}Ÿ,\å\0L‡sc\æ\àh°¹‘}­x¡›zÁ:\'²ƒXñx£Q„™™‰\ä.1^•ý»§L§aqÀªŒ’\ésyŒ\é$rYi\Ø/\æf\éÚ”\×\ïû¹<±\Ôu®‰\Ý\â\Ë‘Ž•’·\Ú\\v\É8£ðª‘jÖ—3r2sŽF*ZE\\Åºñ]\ì’ÀÈ€#c§$cÖ¥µÖ„À–˜Ž7V\íÏ‡¬/ö4\èX/!‡‘\\Î£¡\éz~“\ä\îsHLÜ·½•Ž\â\à.Fpj\Í~\Ú\Ý\ÂRÀrEp†\èÅ›c0e1^\ãÖ´\"»\ÒS\çdUzžõI\Ìtð’\Æ\èB§#‘“Vb\Ö ‘PË”rA\ï\\F¡y`<Asœ\\\Ö5Î±<‰´\'Lt©‹˜\îµOWm³ƒ’yŸknºƒnžf%±š\âó/S\ß\ëGö\Å\Û)\åT\Z\ç¬\Ù\évö¸>vG$ö©®ö¾\è\ãu\Üq‚C\í^@u›Ø—;\ÈÀ8\'¨\ÍV]V\è\ì\år}M-\Ì{t\Åm\È\ä\Ëcœvª7š­‚™Yw¸ük\È\×Tœ¶ð\í¸™­h5,\í\Ü:tS\ÎM9[¯»–1©Ž9\ïXPº.\Îd\êOjf‚w,±¦\æ\àóRÿ\0g\Ø\r¥\æ,\Ø\É•¢!‘\Ân\î›	!g\Æsž\Õn[=I\"b\Ì»H=jŒ­¹\'<õã¨¦¥\ä\ì2úb¨–\É\"v™=0+enÅŠ ‘A\ï´•™\îaGOJ‰\íR|\ÎA\'©§a\\\ê“\ÄÊ¨\0eF:V\äWvÓ \Þr\Ù\Ç5\ÄÃ§)ÁóB®qƒ\èkrÙ¬\âK©\Âõõ\Çr”¤tb+fù£\Ç‚³µ]R+\0¦A\ÐzW)wq¨]Î±\Ú6@$ðp¢/\\\È\ï\îDyc9\ã\ëJ\Ã\æ3n¼Cwp»þ)\Ö2J\Í\æ<\Øj[\Ý.\ÊÁAIY\Î9\ÏN=ýi–<\Ç§QŽ¤Q`\æ:\Ûaq3/\ÎpÃŽ\Õ©§f?5¤bý}¸¬µ\ÖaµÀE\Ç5‹¨\ëWù]\ÛW\Ðw¥\Ê>dU¾º;\n+\ä\\ó95h«:“\ïõ¨LDœ\Z,+ŒbHPN@\æ£9üª\äë·€\0ÂŠ€&\ÜqÛŠ,ž‘\àH›ÊŸ®*—Œt²¸z\îù«gÀ\Ê\r¤ w š\Ú\×\í\Z\æ\ÂEÀ\ÎÃŸÂ°n\Õ¥¹\á\Ø\n\0T²D\ÈûHû§­&;v®˜¡\Üh\çŠo \ä•  \ãŠP£¿CV;‘“€)¥1\Ï8\íVv(§Zi;¹\ì)\ØL\r\Í]C®zP\09\ïR*\ï\êq\ëT‘&¯\ÛPD\" wa\ÔÓ­±+\æL…56ž-•ö„s÷m=¶%Wr6q\×ªD–¢Ò­\îb6\ÚAõ\Í7û\æ;Ž‡œ\Ô\émrcÚ˜\éFù\àÊ²vôâ††‹¶öOVyÙºðOh2ÿ\0u\ÏZ\Ã{™,\áW\Ú*ºj©I\Ç\'­f\Ñi¦•–úO²\ë[&S£6\0#š\Äð½\ì3_v¡5¯â«•û8‘\Ô0²»\çHR<\ê\çG\È\Ý\Ü1\áOcQ&—s9\Î:b¶l_q$žó[Tu\ë]1 À¶{–;‚p3\íZÑ‡|ã ©L‚WŽW–òVù‡ª\ÑH¥4WQË¾)‚ÀrkB7•ˆÚ‹JØŒ€½°y¨\Î\íƒ/\n\ÚMŒØž\ê”£8½cI~°\Êv¹m£zç¯˜$¤‰ú\ÒZ\Énd\Ý.H\ÏZ\Æú”i]\ÞI·\ågž\Õ\ÏH6\×Dò\ÄSŽ¸®fW\r#dóWe\"6=Àâ™’F3Ö‰¦\î­.e`fÚ£Þ£wR:sH\Ç?)õ¨X\ã\éEÀ™Xš\\c5YÕ¥š`Xf\Ï\Ô\Ñ\É\'°rE(\à`Ž=*®Mƒw#šWJÇŠ…\Ø\íú~œ†ˆ[ƒ\íPsüªSœ×Šˆ¶x¬$Í’\ß\'€*q\Ð\Z­»9\Í<Š›“Q“\Î)Qýiˆ\\~c¦‡9¤˜\Ð\Æ4\Ì\ÓðsL÷\r”?¿\åOÁ5p\r8Ö˜˜\îÆŒsÖ‚£\â€BcŠ>SŽ\Ô\ìq\Çjh ¦\Ô\ä\ÓÁ¦©\Í<ð*\Ó$Lc9¦Ž)\â£nœ÷ª\êy\Ò1¦•\ãñ84¢€\Z\àÁ¢3’E\Zc=:R¸\ìZ\r\Û¥³Q\ã¦x4\àU¦K¤þb‚y¦ƒ\Å\r÷A\â†H¥‡\\\ÕsÒ¤9\êj<\ãŠ\ÊE¢2O\çIŠ½fm\ãœWw·Z†x\Þˆ(Ê§•\È\ÆA\æ²e!$\Ô\ã8\ÅD¹5*ò3š¸ˆQ†Ï §­4cn)ÀdgÖ´D‹Žµ\àð:šÀ¨Ê’8†{\"“+\Å)\'“I÷š³`/}óN*<ö/SÒ„6;Œþ”ó\È\0L\'<Ó¶œ`U^üP\Ì;sL8Á4`\Ð\0[$gµD\Ì\0œø\ÔGŽ€\ÔH¤ ;‰\çi9\àâ“ƒ\ëO\\\î\Íf\Ë¾qô¥\ÏÁ\ÇøS°i1À\ëÉ¤f“v;fœy\ÓÉ ž94\Þ~‚”‘øSO\\û\Ð-E\àgŽj·<AR/u\ÕBN\ìþ•§~TGGH×ŸSŠ\0\Î\Ýß¿cM\èM(d\ç v$\Ð19\ëG_®(4 Œ“ƒŒcÓš\0C\Û<S»gÓ¨¤nOƒLl±oJ\0^\ägµ ûÔ¼Œû\çM\ä;P\Æ:Ÿzsõ\éÏ­4Ž@\Æ\r;œ~4\Ð\Äv\è:\Ô{x\\þU#¢£=y¤üT\ì\ã#ô¨ÿ\0\ny\ã\íR€\\q\Ïõ\ÅK¹H\ärqŠfOr	\î)\Ä``‚\r2’œi\í¹—ÓŠœ\ÄS¸$q\Î\ÎiŒ9%˜¥\ï\Ó4mf#\0{\Ò\ã¯\'ô\n\â·4\ÂO$\nv3“\×Ú\0PE+¡Œ\ç)qß¯­;ŽG\é\n\àf‹ Œ\0G\ÂÙ§«cƒ\ëH~^A9\Å\'¨Ò˜;S’}ª]\äpx\éL\Ï·­I@GQZº}ñ²Þ¼7˜¸nMe\r¹\Ëf­\"©9”\çRº%’\Ì\âA=ø\éŒTD©\0\r\Ù\ÈÀö¥u\É#¯½\'F\Ï ó‘E\ÑBrs\Ôw§nt9\æœ\ÅBNQŽrEG¸\ã8\ç<w¢\è¶óŒö\ÈüóA\î2Ÿ&ž¤ô\Ï\ã\éAG\äó’{\ÑÌ€nrIv£\ä\çq\í×šx@_\rƒ\î(Q<ƒ\Ç\â—0C–\r\Ø\Ô\Ø}¼’M\0lðy\ç4§(2{\Ô\Ü”c¨\ïÈ©TÊ¼pH¦\áˆ\È\É\Ç#5z\Æ	Zh\ÔG\Î~\áö¥Ì„\ÏT\Ó\Ô5¼c\àqZX 9\ÏJ£a\ç#Ê±;W9qÓ­k§—¹\ãô¬‘	3ˆñ-³mÛ‘^}&Uºc\'<~U\ìú¶“yuk\"*yÿ\0õ\Zó™<-­\ä“9\èp?*qš4I˜¨#×¥€3\ÎF\rk/‡5‡`¿fa\ÎÓž£ðö«QxKX|`(\ã9c–¯\Ú.\èvg:¬‚xñAMÀ§R®¾?jl\Ã\æP7s\Ç5q<\rtp\Z_\â\'¡½´{‡+8\"$2?.\Õ\Ñ\è¶\Ë.\à\0<rO\í]L~@\Êm\ß/#Þ¶\ì|)oe(uf8\'–.¼G\Ê\Ï.½†X®\n“\ÊöO\å)\êG\éŽ+Ü¦ð¾Ÿt¥\ä‰YŽ7P¾\ÒÁ¹\\>ƒ¥õˆù‘ž	Q\ß\ÐýiJ„\ãsœŠ÷‘\á}1G\ë\ï\ß$U\Ä\Ð\ìbC¶\Ý1œ\ãn@£\ë³#<\0\Å2˜Ü«\îœf¦[+\ÉJÊHlu\Çq\í\ï_Bÿ\0fÀÕ¢®2R¾—h—¯#¯J_Xòf\Ùó\Âéº|ýžF\çŽZ\ì´ý+P–\Ò3öv,n\ãÒ½Xiñ¡/\éÚµ­a\n\0õ_Y\ì…ì»žH\Ú-óŒ¼x7cš\ånü¬M+\ÉH¹985ôcÃ´o >ñ\ÆyU2‰ó\ã9=½qRñ)S>|O\êá‚¿–½O©5pxý4y\Ç\ã^\æñ*ü\ÄƒŠQ\Z`Œû\Ö/!ò+€.ƒ2€1ƒœ\n‘|wûO\0\ås“ŠöfH\È\'¿\\TXV\Ï8\Í/o>\âpG”\Ã\àx\Öb…³ÊŒ\àµ\\_ZòTŸºNsšô’»\08\ã¥7hB~µ.´û‡\"<ù<§pvù\á·ö©?\á\ÒT\Üô\ã¯\é^‚¯oñ¦HŠT\äB­>\âpGž\Ó3\Ä\n\ãŒJÐ±\Ó ³ùa…h\è{fº\0R=±Ló6–VÂ¯9=I\Çz~\Ö]\Ì\Ü\ï\à\çÞ›œž¿7Zƒ\ÍÀÔš{2¯=\ël\ÉØ¨\ç\éù\Õ[·=¨\É<óJ©x\Ù^k¢\å¨[¶+\år9\Ç\åYš¦›ox„ÃœrGLU˜l@·©\ç\Ô\×3¯\Ì\ê\à) IŠ\í‹\Ðó\ê/|\æol\Ö\ÞvG9o\æ+*TG|7AÀJ»=ñ—vWqÁËžI¬\Õ\Ý+’>S\Ý;j\ÆOS¾–‘f€~¾\Ý\êœò“¿ \ã\'½:\á\Õ;(Á¿Ò²¦f‘±‚2OLóInn¶9\rQ“\íD¿?&vŽ†²\ç(\ãz’N	üjÎ¨ÿ\0\é°¼\ëXŒfŒ²\Î}«º\n3{š0™~nA=zd\×a¤i\Ö?6\ê\ça\ç\n½\Åp_i£¹cßƒŽ\ÜS\Ò\â|)\ÉF=ES)3\Ó\Ì^\r|}©@!”6sù\Ô\Ò\Úx\Í\ÚU¸Wa\Ð#Œ{zŠòWœ€òI5Md‘W©\0ƒ•\Î*J=Nû\\\Ð…O1ó\É9*?úæ³£¾ð\ÔbC$N\Ì22Iº×ˆ\å›z\ç“Î™‰¡\æ\Ü\ëò6IQš8Ol\ç<\ã\é]®—«\él˜”y Ž3€H\ÅxóK!\Ã0\'Œõa.\å„(’A^=½}*X\ÏT¿ñ¢O\åiö‘+s™9\à\à\â»\Z\ì]Z,²²N\Ñ\ÇZùü^1l°ö\Êýk\Øü1<¦¦Wœœ{sXL‰°KG]\ç\0\ãMWž\î\Ö›l@–\È\ÍBd\ZmÇ–\Èx\É&³LÅžQ¨Þ›Küª\íR\Ýs\Ó\×5oþVhD*`¸…\âˆ\Ö;ÀN\à¸\'®]\Z5PW†\ï“øWLuED\íjn®K(.qXZ†m\ä\"®@c¶²\r\Ób9\'4«{:‚ªr+B‹fµ\ã;=H\ëZK\â;\Øc\Äd\î<«7&¹\Éf2\ÇI\'¯>¾™ eÛ‹\Û\Ë\Æ.\î_Ž²*«\Ø\Þ*\ïh%@F\àJšÐ´\Ô\Z\Îb\èŠYz63Á­‰<Uw\"\ìpžrI\ÐÔ“F\Ù9\ÏsM\ÞO€=\ê\Ý\Í\ã\ÜJ_h\ëN\Ã\éT\Î2r f\Æ½²}ù§«ü§¼j³m\åyú\Zz\îc\Ó#¹\éŒu¦M\Ë*r‡t\â•mÙƒyUZMŒ‡­=&f\0’q\íA@QžÞ¢ˆ$ý\ê\ã•\Îj6%óœcŠ\ÒÓ¬\ÍÂŽv\ç“\íR&t\Z¼\Ø\Ó-•OZÁI$PJ\0\ã5µ¯ª\Äm\àOº£9>\ç¥a\0À¶A\Ï\ëM…Ì„íš™~_Lžƒ¾i™UA\Î3Ÿzcb\0\Ï\ÍhR.£¤0l\Ý\ÇÒ«\É!<\Ø$¥$Pn#Œ‘ž¼f¯¥½ ;\äl‚3\éš\n)&£<#\äqš‰¦yw–\ç¿_^µ5ôö\î@TUô©’W‘\ëR\Ø\í\å‘vO<’;Z\ßð‘\\¨°01\Ø\Öz\ÜO:ù6\ë\ÎI\íŠ\Ë!Õ›,`\ZB¹\Ñ\Ýk7S•\ç3\Ô\ç5Ÿqq=\ÐA ,W\0{gšÏ…X¶Xö?Ÿ¹­X\ïŽ0¸\r·¢ˆ\ÊqÁ<ñ·ŸÎ­A{–¹¦ý±|\æwŒ<Œ09\à^)\Ó\êML\ã\ÐhU¯!·e\Ù€Aª·:Óº\íRq\Û=Maüžü\æ…Fv\Ê\Æ\Î\Ù\è£<Ò¸\Í;yY\ÉÌô­´Õ ²M°‚Xñ’+”k{£À‚`3Ÿ¸s\Å1­oN\Öò%%°TòMC’\îQ\Ó]ø»Sx\Ú8\æ ÛŒW7.¡u3\îyŸ“\ÔÔ¶Z£}+/”ñ§vt#ŠÛÁ÷³\ÎvœÆ£«.?*žx÷A©\Êg>ô\ï9²I\ä\ã·zß½\Ðî¬‘	Ÿ#’ žf\Ëø‚Aø1T¦Œ\ÙL\ÈN3’O\ÊG°zU³¡rbgv\ÒSb¿6F†«™>„¶…þ¢´–\â\r…cD#\'©¬¬?6H=ª\Ì0‚3&Fzpxõ¢å“¼1¸ù¸\ïÖ¢‹M¸»”¬1\î\Æ\Å5BÛ»+“»\ØW¤xVÔ±®v=z\Ô9¤›= ‚gY6\ï^H}*tYT–Á=\ësÄº[\Ú_¾Y~A÷=k›ù±\ËUFI &Bñci\Í8JXd\ç­B\Í97—> Ö‰€¥·7\'¶µL¹—#¥X·µ3ô\æY-\è?*´\Ì\Ù$V\Ó8œg$T˜hÊƒ\Ã¼Pnev\'\0ðpx¦d·9\ëœf´D\\œ4¸ ù~U4P7\0¹,\Ù^7o\0óŒUØ¸)†\ÉÁ-\è=©\Ø.nZhò[(¸šf\n2\Ê\ÕAµ\Ú\ã{1~N7sLº\Õ\'\ÆH‰>\è\Ïó¬ wÉ¸\àóšv1\Ó\Í}fc }\rf]kJ\ËxQA$s\Åf=¼\×R†\ìNô\0\n¾–\Â\És\"\r\ÅO6CLÂ”4…™—\Ó\ÅE\äû\nÒ”ù§¦\ÅBÐ–¸\Í;Êƒ€q\×8\ÍBG?1=½jð@8#E=#*\Ëòõ<RÌ¹\"l\ãfšT…\Î5l¡›ž¿™ªøî““R\Ð\Ó=sÀv\ä\ØH]Œ\âº\Ë\È£Áö¬Á\"\è\Èù$;p}Ev\n¸\Æ85\É?ŒR>o\×-MµôŠ:1\Ü=Oj\Ëh\Ê\äúW¥x\ßN\Í¨8\'À\Þs“\ÅvS\Ö(\Í2¡P1\í\ØP±)÷*Àƒ<Œ\Õ9‹ŒqÁ\"µH«¢Ÿ•\ÇJC9ãšº±¹$Rý’MÄ“Þ©DW2Jmš˜#v©¥·™Y‹.)«¸Ò„\Øød)ÊŒW“Q™H9<­R¸zz\Ó\ãë—­$ÝƒVeùX\íRA\Æ+Vkä¹f\äSÒ¹,\Ý{õ¨d•Ñ‹\çPÆ™¥6Ÿ{‚C‚ŸZ¡-±DfwùEDo\'ò\Êo \Z…RWrGqYH´\ÏKð.\Ë<\í\Ð \×_\â¸\Ó\\³•\Û\Î:\çx[M\Zvep\Î7±õ-Z÷ñ	l¦QÕ•…qsÞ§Ì¶´<R\âY\"9Bp½þ•Û®Kƒ½#Ö ”¹gˆœ„b=ªO³9Œ1\É\ã\î×£Œn\ru+X·\ç@-(9z®Wœ\Zõ\èj¬2Ä¨\èARv\ã­Py¤\Ý\ÅX8\ã&›ˆð{Vr*&[\îfÁ“Þ”1\ÈõsdRH~l-2\"º\Ù\Ç5õ,²t\È\ÅTu)’z\Õø.<¿˜íš‚R^Fr{\ÕÄ‰œýE9¹\ÅK QÀ;\ÔO\Êô\Åis\"À\ÍF\Ü\n™†j®\Äö\ã4®1ü``r)\ÃÜŠˆcš˜&=ñT™,x\çšvM4i@Wb#n{\ÔL:T§­F\Ãj$Á7#Ž\â É«£\æ¡*xæ°‘²pqOÑ‘N=\ê.6(ÑŒsO\ç<\Ò\à“UrHŽyö d\n€3\éLR(Ú¢<°\ç5)\à•=é£­IV¿Nõ&	\éÞ“R¨\äpi¡´\ëNE;o9\Óô\è)€„.j\í„/1˜(\Î\ØX“TŽ:\n\î<¥=\ã\ê-… A³ŸSR\Ù,\áÕ¸§\äR2yn\éŒaˆ£\Óð­€`\Ð\Ý)Ø¦¸\é\ß5W\0{4†™œšw9¤\Ùdg88¨Á\ÇzRÛ¥H¥p$Ÿ\ÐT]³Rr§“\ÍRd\äÑ\ËIü\Í/j \Z\Ùª1ß¾*G<gµC“ù\ÔHZøu¤[\ÝÁs4ð«\íb¹\è*\×Ä?O]:\0T¹Sˆð1‘\ÜV\ï\Ãx•|>§»\È\Äñ\\‡\Å+­Ú¤ù\ÎÈ²O»W-Û¨3\Ë*E¨\ÔûTŠy#5\Ñc—¥<q\éŒP1…É¥û¸\Çj\ÑN”\Èl÷<SÀ{\Ò÷\"†$WŽ \æ”TQ…\0óš3Š†Ruô\Í<pr;Tg\ïRÓšbP1\Ï\çNÇ¿\æ–4\'Ÿ@y¤Á\Èú\ä\Z\0B1\Æ8\Í1²zT\ØëšÉ hŒž3Þš{Â¤+€y=9¨Ÿ‚1\ÇjÍ”3‚\Ü\n’6ò\Ûp\ê:T]Fi\ã8v¬\Ê&+\Ïs\ÍGŽ)O<ƒÞŽ}(\0<¨\â£\ã\'½H=O\éIŒ\Z\0@q\Ð\Ó\n^µ)G\éM\'\'Œ\ÐmÀ®¯\Ä±C·–qû±ùŠ\åI8\Î+´ñ Wµ²™O\ç·¨%\îq¹8³@\Ï\0R)Á\'§ñœ\n\n\Z\Å[ \äŠnz\àñõ£½8ûz\âz\ç¥!8$t\âƒ\Í)\ç¯SHCšƒ¹MH£<c\ëM\0‹…\ëúóHz‘Ž†œsÞ€x\ä\Õ-„\Ø\Ü\áH¤\'ž™¥8n1ŒŠk\'\\Ô±¡8=\é\ã;†x\Ïzo £&•qI\0\ì7\ç58 +p\rB04\ìð úäŠ¢“$,ÜŒRñ\ÇcQ\î\ïÀ½/Lg¦q@\Ç \ã¨\çŠ]\Ç;NzV†`šž£\r³³~_\Õ\ìö?tW@J»±õb@•…JÑ†\á¹3Á˜()a\Èb¾Œÿ\0…¡\Ä7]ø;UÈ¼¢F6³‰±\ÆJ‚kŠ™§³‘ó0`;ú\äzT«Ž*\Øù~õ}L¾\Ó|¶ð\às÷iñh6+ÿ\0.\Ñ\Û+Sõ¥\Ø=”—•\î\ã‹iK’6\0«ñxk\\›\çK7Ç¯Læ¾£þÌ\ÊA\È\ã½J,#\ãK\ëO°{&|¼žñ±Å®;3ô§ø‹i&\Ùx\ê7`\àW\Ó\Íe$Á9§ý™0”¾³ ögÊ’øk]±%¤‹Àùq[:_„õI\Øª‡â¾’\Æ\ÞXš7A³­gZi1Yh\Ø\ã¿|\Ñ\íØ¹\á’xY[tQš³\Ã\ÝI\×&uS\é\Ô\ç½{\à„wu¨FÁ\ÏLRö\ÒTx¢ü9™\×\\Žù U¨~”}\Æ\ä“\Ó\å+\×\ÄL\Îü(1ÁŽ?•O¶Ÿqò£\Ë`øqh¼´\Òö\ÏOz¶>i \r\Ì\Ç\"½#k28#\Ño*±9\'ð\Å\'V}\Ç\ÈyúøH@2$b;\í\éVÁZBp°€§µw‚&}¥°¨)‚>\Ø>\Ö]\ÇÈŽxGˆO\Ó=M^_\n\é(û:gŽÀó]”h²‡5c\ìù(Hú\Òö’\î\Ê\åG)¦)%-\ÑA\ï\ÇZ¹‘l¹RœûVÿ\0\ÙvŠ•a=6ô\Ï<\ì9—š©ûŠ;T¦\×h;¸\Îy\íZB&¿Z”&\í«ž æ§™•’Z\È\é×š¨\ÖX\'w\Íõ\æº]‘…ùˆ÷5–\Ð)ô=ûS»#Ÿû4x\ãñ\ëS­ªòŽ‡8b¶\Ö\Þ5\0Œñœsžµ\ì\ròðøý)6Á\"€¶	\Øõ\Å%^I\é\ÜsWL‹\Z‚}¨]\àr\r	±\èP•mb‡\ã4\Ô6\Ä| ’EYÛ¸ŒŽÔ†õdP\Z\0PÊ£¯QÚ¥Þœ\àP	Œ~T\Ø\çbI{\æhXb\áª\ç\ØzÓBv\ã-\nã’¼‘\Øû\Ó\'’¯‚G\0\Òw\rA\Zƒ·ŠL‚\Ø$dÔ‘\Åòmn¢“n\Â¥vPŠ^*ku*@¿§µ1B®rOc‘õIˆ²cbO9^PBŒœý8«k’})®J¯¸¦ö$\Í`Kt\Æ;œóP²®\ÎùÁ\Ï\Z» W\Ã}@¦4LNA¯o\Ç&¡•r«ŸLr;\æ«;`¯5u\ÏÊŠÝ‰ª£¨\îÔˆdfOœ!þ¹÷¤#,sœ“Ÿz‘×¡¿\ê7%@À\'¯oJi8•õ\Ï\Í4ŒóÜœš‚9[hÀJgŒnx\ïLLM\Ü\î*9yô\ãqFN2A\Î\r(’ù™\É\Ü:ƒÛ½0•n˜#ŒJg»Œ‘ƒßŠq9\ê*ø8\Î=M#«z„i\"mÀ\í<ñÒ©^¹òþ3¶;V]\áb½	=k¢\å¨iDqpNr ”\åF}N+¨ˆ“np\0?…rº¸o4oL\×d6<úŸ\Z8\æyœI¿\ËW~0j\Ô\È¦k6\ãv\ÕEj%¹\ÛI\Ú(Í•\Ý\ß\æ\ã#\n­:”\\Çž{\àUÇˆ„u=j¥\Ú?øƒ\É\ÏzQZ›s$3½ieº™œq¸g~5Qsg·Ö¬\\fp p\Çv\ãƒQ‚>¢½±\Â2.FG ¨J¤’\09\ï·ó©|\Ä\Æ}±ƒÚ‚\ç¶Ü“€3œ\ne\"«™\ßp\å\é\Æ5\n|\Ê\Ü\àpA©d ®sÚž«\Ü,T²‘\Å<¶;t\ïJUz\"‘œc<õ8!ðyÁù¿/\éO{„\ÆV1\ÆN1œû\Ò(…I\Êô\É8üEW\'$Ž¸úÔŒv\á²0N3\éFÎ¸9õö¨`I@¤°\ã\'½\Ã‹·žr}ó^6°’z‡9\ázt¯jð\ê2X\"}r{‘XTv\Ø\ê³A§\Èƒ\éP«/\Þ\Î;UiÜ¨P;u¬S1gžø\Ê(ž\"\Û>\é\ä×˜qœsÓŠõo¢›Rv\çM¹\ï^Rpý\ã‚3Öº©½8nþô\Ç\Ê8\íH®1œÿ\0…8;0,9ü\ëcdW„¿\áDnT|ùf\ÇPdy——ä—Ò£\Øü\Îrh60ƒž3\Ç4‡‚OO¥1YFpIÚ¢ó\\2G)0$û¹…N‹\Ü\çoU]\íœ94ÿ\01\ÜGJBhŸ`\r»h9\ï\ÜS$w\ç¯ Tù\0±8SÇ­H®s\Ó\rRlV\'±©ƒ\ïOˆüÀ\Ó\"–I9À\0bŒA¸Œ.O\é[—\íf\n\ÆY•9¥\nI\ÚÄ’sRœ·r\Ýñ?n\Îjc\Ú7u=±UŒ‡\åÀ›•ÁÈ¦‰d\ìû#O]­†\Îy\È\íU÷ž\Ý\é™\æ˜\Ñh\ÜœŽF(;·\Ù\à\Ô*Á\ì[JÉ´~‡\ß\èžQG\äô\ãŽE+¯<\äö\È5L\äwnô\åÌ¤m<|¾µ-\Ûhzn,g›\íù{W\'\'”’>ðÀ$Žœ\Zõ\Å“\ì\Ü×—x†\Ì\Û^¶D„²Žø©R»3¾¥\'¹ˆ±!0:õªNû›LT#€½_z«–‰Ä˜•$HòJ0yfÇ¹¨I`½\ÉÀ¯Tð7†š\âd½™‘ùA\ÜÕ•Zªœ[f´\é¹\É$K ø.\âYõŽDk‘Ç¹¯K³Ð´\Û\Õ-­£pÀ\çŠ\ÞHUF8©0kÆ«ˆ©7¹\éÂ„ ¶1O„€6~(]>01´õâ·„\\Ô‚.øŠœû”\á\È\É[\0Ã‘šœYG\ÆTf´\Â\ãœTs“\Z£$\nµ)w!\Æ&{\éö\îÜªþTÃ¥Úž±\'\×B\ÝõÙ§RÑ¢Ç“É®Œ#\ã$Us>\ärG±‹.‰e Á‰:zT#\ÃZH#ý\Zvùtap(\0zS\çŸv/e\È\çÇ‡´\Â\ßñ\í\\ýÁM“@\Ò[\Öñ·§\Ê:úñ]L\Z\à\Óö“\î\Å\ì\ã\Ù”ž\Ñ\æ?=¬\\\àc`­;m\Â\ÕpÛ¢(b·¶Ó‘NÀ¦§.\ì—NŽRû\Ãv7jD£eq’+<¢o-%ª?\ë^‡·8\Ï&—\ËñÞ®5fº²](T^ðøÁ6qŽAjY<\áò?\ã\Ê!\ïŠ\ìBSð\rlªÏ»!Ó‰Åh‚<e\ÅD\Þ\0\Ð\äošÜ’{\æ»õNsOÁŠ\Ú5\'Ý˜\ÊóGøi¢8\Ú#n¹\'q¤ÿ\0…g£)ù¹<\Õ\ê®8Ï­Jª\ÒWLg>\æN(ò‹‡šD[2]H\îNh_†\Zkd†›-\ÎKW©IbT\ä®\æ\ÏsV\\¬¥Rj§.\æ|ˆñ‰~\Û>H•÷v$\Ôc\á:É½\äp+\ÚRTg\Ú\ÆO°©·F5jr!\â\Ñü-Š «ö\ÉNp8>\Ô\Ù~\Äù\Í\Ü\Ì+\Ú\0\çqELe…q\Ç\Ìz\njL|¨ði~IÇ•vqŽ\àT-ð¦\í#}·•<.\Êú)Q&—\ÊÁö«M‰\Äùü1\Ô\Ëd\Ü($\ä¿\ÌS\ÃmXVX\Ø\í ZúpZ‚}\ê&P\àbEc\å\Øþ\ëlròC“\Æ9ùjÕ‡\ÃK\È.„’ˆ®JÁòÇ»­ŠúH\Âsš…•T\àu#Š—rŽ\"\ÏAh Xº\í^\Ü~Ukû-\Ør¸®\Ò87.}i\ßgö\à\Ön#µ\ÏñG„\ï5+Pª\ï+º¼\é¾\ë\à¶Ô‹°6s_R¼*ƒ-€:fš!\ÇAUJ*\È$|°>x+\â(‹\Øöª\ç\áÿ\0‰Ñ°-—\è¯\âk\êÿ\0\'¾)\ÂÑœðµ~Ù¢½úŸ.\Â\âHb\Ý-œk“Ž&R~¤\n¬\Þ\×c_–¹5õl–H™_•ª£\Ú\Ä\ç”Ž´<L»\Õ\ßs\äfð‡ˆ\Ï[&ù\"›ÿ\0wˆ‚–6˜\ç¦\êú\èiñ0\'`¦µ”°¨úÔ»!¬7™ò	ð¾º ²s“Ú‡ðæ¶ˆ¬eÇ æ¾µ{\ÈJ¯ö±÷Z>»%öGõo3ä£¢jÉô)†G\\Tm k\ÛE”\ç\Ôc&¾¹[Ç¥\Ê<’¥\ã¥ü£XW\Üù¼3«BFûIppx\Æ}jÆ \ê­5œ¥‹¼\í\ãæ¾­6P–¨\ÏÒ²D  VrÆ·öKXW\Ü\ãR©À\0¥2KyY\å\í]t!d,6ci©Lk“òŽ}«™Uf®…\Ñó§¢\ê–÷\Ój\äÜ¤£­Tû®\Ö®\Ã\Å}Bm¡\'%™ö821\Z\×\\q\í+8˜¼¿\Ä|\Æ4K‡kIˆ8\çmV’\Ö\à1\ÞPzca¯ª\rœ-ÁAL:u«ùkùUhp>©.\çÊ¢\Ê\èœy‰>ˆqøS\ÓG\Ô\Û;l§<ÿ\0t\×\Õb\Æ\ÙyX×ŽœP-!\Æ\n-fñ\íý‚–÷>K“H\Õ#‘³eqŸ]•[û7P\ÏüyOœt1šúø\ÙÀs•\Ãg1\åŠ\Ï\ë\ÏùJú³\î|”º}ú\ãu¤ù<°\Ò=†¡€>\É8¯\î\Í}fl\à\'ýZûñC[@\0mRÇµöEõFþ\Ñò+iÚ‹>\Ç>\ïB„~4Ÿ\Ù\Z«.~\Å9¯\Èk\ëß²CŒm:R-¤*>\àªþÐ—òõ\'ü\Ç\ÇGJ\Ô\Ûþ\\®0:\á\r@tM¹SŸO\×\Ùb\Öx\ÛI #8o¦(x÷ü¢ú£]O‘¿±µ\\ŒXÜœôSSÆ™©p>\Ãsÿ\0~\Í}aöbpH_¦*D·-À¥5Ž—ò¢^\Ìù1t\ÝHøñ¸ôÇ–\Ôÿ\0\ì½Lƒ‹Ž;\ì5õªÚ€ƒ\Ì\ÚI9\éLx\ícVfÀ«úô¿”«yŸ$\'S#?a¸\äð|³Mþ\Å\Ö\Ù÷\'=–pk\ê­>t½•±Ø¹­¯\"\r \í\Ô<t¿•°¾g\ÇM¡kYñ.¸\Ïl5š°¹?`¸\àg\î_fxS£$sÇ­4[B\ß\Â8¬åŒ—ò¢–\Ìø\Æ=XuÞ¶3ŽÕ\á\ílŸù\\Ž?¹_a\ÏoH\Î\"÷\0S¢Š6\\\àÚ£\ërþTWó>::¶8:u\Ï\Óa©Ç‡u\Ð7€\ç\îW\Ø+\ÉÜ¸ö§\ÇgRûU}r_Êƒ\êþg\ÆK¢\ê¯\'–¶7%±\È\ØjS\á\Ýs‘ýŸ88\ç_c>ûŠ\ãÒ“\ìð¦Á\Í\\—ò\êþg\Æm \ë[±ýq»·\Èz\Ó?°53ö£¾\Úû?\ìð>Q‘G\Ù  \áEC\Å\ËùQ_Wó>0ƒB\Õ\æ$Gar\Þ\Û«ÿ\0ðŒk\á\ä5}|,­ñ\Â.>”¢”\ç\0\Z_\\Ÿò¡¬/™òð§ˆ\Ø4\Éø\ëMŸ\Â~&€&›>g?•}„‘B\ßwç´ŒòT\Z:k\ì£EƒO«>>\Â>$‘K\r:`®+Ò¼\á­Z\Â\Úù®m\ÌF\\\0­ßŠ÷u³@¼(©>\Ê1ü\ë)c\êvE}B/«>9\Ôü5®Á{tM„\å<\ÂÛ‚\äsX£\r}\ÆöŠ\ã•W1ªxb\Âÿ\0+%º2ûŠÖžc­¥\Z˜E{²¹ò(^œzTn·Z÷\ÍO\á}‰5«¼2g(½V¼[[\Òo´k\Óot›Œ©\ìÂ½\nxŠu~qÊœ\àý\äc\Å S°qÉ¦Wq…“ÄŸ\ßp8«\Z„K\rÜ±ƒ¹P\àQSè–­{«\Ù@½Zeü”\äÕ¿Z›Mrö\Ãþ¨¸™‡\×S\Æsš„qR†Š´\"E9Áó“Œ‘Ó¥3š\\^q\ÅUÀŒÀS\n\ç·\àvƒ\Çnô\×`\Ã&¢CG\Ò¶x|;f\04{\í\ÍyÄ \Ã_\Ët1®+\Ø|/MMN\Â\Ù1\íšóÏŠv\0=\ß9ý0k–\ß)£\Ç\Ô`õ§g=\é½\ëÞž sô®¨‰’\'NŸ-ŒS³V‰O=\êF\åw`õþUNù 1³“C¼šk»#×šwNç‘ƒLÀF3\éP\ÊCpbž\0ûqL#€i\ë’=­4\ÄÉ²;u¥ÂŠjžƒúR\ä”\'˜ƒ;I\í\Å1‡\âœFp\ãš	À\àqI·|ž•\Ò\Ýr0\rHT³…Nb\ã\×ó\Åd\ÙH¨F	\àŒô\Å\'<\nšC\Ï 8=A“žœÔ”8aOó§ò¶) JA\Æ(@0)0;TŠ\"’ªp¼“Pœc>ô\0¤~9¦žý¨À\ìi}h‘‚\ro]²É£\Ú\à°\á†z\ZÁ\Ç{b¦vpŠ	<t\0§\ã=\Ç^i‹Á\Æ4\Ü\à\ä\æ•Àv@\'4;RŽ t¥\\×¦M\00\0¹\ÇCN ‘øÒª?\ZBG<q@\r\àš~9š$\n^ý\Å0b”€M.\ï\ï\Í!=EWAXc“Ú¥†\ÞY\Ëqrj6®‹A“\ì¶\×sc,\Ãn=³š†9\ØST\æ­\Ü1–V8\ÆI5X(\r‘LhiÀ\æ€A šG\ÇZS@ž\Ù\Å8\îŽõ²(\È%©2‘¿\á\Ù\ãƒQ„–s€\Çùc_Bhš‚\ï1L¡NW±ò\Þ\î+\Ö<­­ú}‚åš‹û²O$W\"\r«š\Óvg\Ð[ƒ\0ó\ÍW\Øzcžõ\Ë\éú•Æž\É\Ë\îC\Â9We\Är`ö8Á\ë\Ý#·jšq‹±\ä\çƒV0ªF)\çœ‘Ò’¶À~84\Ó\ÎFpjf*W¥\'˜\"û\Ý\0\Î\ïJ`@bnÝ¹¨¥·\\^j\Û7\ê\rC»šd•‚e@Éª\Ç\äbzqÀ\ëV^P§p\ÝÞ«œ\ä“\Ðæ¨‚c\Ç^EFI<\ç‘\Å[1œó\Ø\Õi-¤„ŠHõ ‚FMA\æ‡%~\ë*Æ¬\0~lš«qnò\éü4!s\ÉÁù\Ô\È\ïŽ\á\ïU·>Ñ‘\ìhFg`C4®\ê@\Ú}j:8v|ŒOµH¨9Ü¹À\ç#½BLdŒóô©\àe‘AO—½\\F\È\äU\åò‘Ö­F i•ž\âM\Ç\å\ï\Ç	pI\ßÛ¦{ô§\\0\È\é\Ç5™>IQ\È=©\ØW/=Äª\Ä=û\æ¦{±\å\ÏBk9 \äó\ïU¥¼Ž?–L\çž)¨‰\ÈÞŽñ.FTg‘À\íN3\ä\à›$û\×(º„\ì\èH\ï\Ç|VŸ\Ú\r\ÌA²9\É=\éò‹˜\ØB\ß\ÞÝžý(‘”§b\ÜdúW4“\Þ\Û9\ró)\ç\é\íQ´ó¼»‘ŠúúQ\ÊÆ¹,I’Fj¶\â	Q\é\Ô\Z\È{\É\Ñ\ÛxÁŽ”ô¼GÁa\É\0dR\åšKqƒ°·@Zt÷ÅŒ–ª24\Ð\ï\0ôÈ¨fù\Â\î9\íh°\Ö\æWnN:ò}*\È\É\0ž•ŒŒ	\0\ÕÈ®QH\ÚÁã¸¢ÁsQc\Ükdµu%W•$qŠ\Èp \ã\êPsŸœn\ç¥KCL\×\ìs\Æ3\ëL”Â¡NqŠ¦Œƒ>¹¨^E,r¿6)2Ïš¹À<\ã˜\'\Ú\à†³§Þ­´c§Z†C(R\Ê	Ç¿_l\ÓÎŽ\Ú\ìe”sŸCV|\Å+¸0ÿ\0ëž•\É\Û\Þv·\\õ».ß›¡9\äq\éŒÕ\Øòü²ƒ“\Ï#ëŒŠ‰¤+•?/&¢‘™%BL\ã<Š›ƒ\åIú\Ô4.aw£±UçŠ‰œ¢+,§¾\ZF\0t4¦D (#ž*B\ä2L\Ò`§\Ê}jT\ã®p1øŠ%‡xV…0¦\ï—8)¡ª–\rÛœƒ\Ó5NKt— €}EN\Í\å\ì$¼ƒ\×=)±®r:Ž\ÕBe\í\íW\î	•4j }ÄŽO_aR´©\ç<ü\ÓVX\äÁnýC~´\ÏjgÏ¾)\â˜\Í\Ï`h\ÈÁŒ~G\Ô\Ön¡1oNM^\Ï>•©°ùz±$[Csš¡§\Ç\É\ÎMs\ZÌ˜r ô\Éü+z„\0‘À\â¹}vm\ÓmW\Ðq]8*/y\ë“\Û\ØóU\ß~	õSˆÂ±fc‚:EE\Èôªj\æñvŠ Ž Í¸¨+\Û>£Ú³µ6Å±À;Jü\Ø\éÜšÓšh#BÅ•\08\É\àc½p:Ž£u«1¶µ$B£2K\Ð~¢œ!¨s6p²;\Ç4˜õ=»\Ôm\ÜF3Ç±4Lv\ÈCŒm\Æs\Û\Æl…\Çf\É\ÇŸz\êF±$I2¥BŒ1Ÿ\×4\âX>¯*6÷ú\Õe\0“‘”RS’\ãš4&^vüÀrsž”¬ýYŽI\\q\Çj®3#±ˆ\'œóR¡\×\æ\È\çj‘’€SŒ“Ó¥6¾5HƒÀéŠ—z¼v=\Í&\Ê\"D\Ârs\ê3G\Î\ÎF[œŽ¥8ð\Ìø\äS[€Ò…\íŽGN:â¡:–u\È÷d\"¾\\ž¤z\n÷#†8\Õ@Û­ch\Úl\Ú\Ç\"¯¹\0qŠ\éQG÷Gøb¹\'+²dG³p\Î:Q4Yûò*\à\\ \äŒ\Zn\Ì\ã\'Š\Í3&q\Úõ«Kd\Ë\Ç\ã\ë^!7\Ë t\'pa\Óô}ý¶mYO|ŠùûS‹Ê½•1\Æy\Åt\Òd\Çs78\é\Ðg$~\\SKm\É$õrÄ”\î£>¦•˜°\Î3‘Þºº\ÐFs\Å9òÛ°Ç·~j%#=Hÿ\0\ns\Êp9\ÏOqMŒ¶\ê=G|ö¦\ãv9©°001ÒšÈ®\Ã\nÇ§Ö„>£ƒž«ýi\àI\'§j‘\Ðm¬HS\ÏÒ˜\ç’ÄšEú\nky=I\éÒ–<u=1\ÆhS\ß\æ<\Z…‡\Îi\çˆíŽ”áŒ\ÝNh!•8\ç\ê+¨\Ñ\Ö\ÕP™\r\á\\ç—žƒq\'¹À®¦\Ú\Í\Ö%\Ì|·^23R&\ìT\×L\ZßžN\05„½{ñŠ\Ó\ÔWË‘Cv\ëŠ\Ï\ç‚G_j{ŠF03MF8ëš‘@=ð3I\å\à|Ç¯§½;\0\Ã1nƒ4	\Ï<sŒ\Ñòª¶\ã\Æ7xnH\ãúR¸\Æ1	\Û Wôø–i\Ó\0ü§Žq\íù\Õ\\œö\ë]¯ƒ´“wx²2±D\äŠ\Îr²\êv\Ë\ä\ÚBœaPq\ØW–x\Ö\Ý\Ö\í\ÐrG½{(x\È8\\\Z\æu-Yv(I\ë×ŠÁM&gf\Ù\à\áT÷\ï\éNÀ=»W¶\Å\à\r/\ïÉž™lt¡¼	¥HÀ\ê9\àPñF°§&yß…ôI5‹ñCµ0\Î\ÝŠúR\Æ\Î;h\á…\"\0\0¬\íÃ¶Z%¨Š\Ër\ÌO$š\èö\â¼\ÜEgUù#Ó¡O’:\î\Æ*\ÓÀ\Î1NÞžñš\æ:P’rx©‚qŠœýÞ´ð´\Ø\ÅNrO»zT„´…3\Ç|U™¶G…^\r1}ù©\Ú0i»vd\\®M/^jL\0NO¥?ÇŠnNi_;©hQš~\î\rB”ÿ\0]	AÁ<ÓšNG Ç©4¦­	“dæž‡,* S\Ï<Ó:÷5´L¤i®\çS\Æ2+6&Ÿ“\íW\ÐÉ· \Ít@\ÆE€ŠEYBªF\Ñ\ÇsU\â\ÎzV„Q¸\Û]01d&Xj¡<f\ÎK`|¢¶\ÌD“Þ¥X[p­\Ò3fM¦žð®ƒŸ™\ÏôuaŒ\0%\Ä3>BœœñÞ›¼ª›Š\Õ\"nG*)LG¤iógs\Z¶¶$\ÎÄ¨\íW£±ñ\ÅRˆ\\\Ëq \0{ö©•x\Æ¤-QTŒžOZqµJ­Zˆ›1\Ð\Ì\å™FG8¨¿|x\Ç^Mn´h‘yi\ÆF	¨ü…^W)G0\Ép\çÖ„VI±[òZ\î\Æ\á\ëR¥¢¢c$\Ò\ä9‡¾u\åPAV¡i\å\ÈÙŽ\ç5¢Solžœ\nz¥Ï”\Òð¢—!je)-£)~qOhÀ\n±xw\'ži\Å`™LŠ3\ÆqœTû3E#F¹\éO\Û\Îxµ.\ì\á†FXg3 \Ç\ÎSa?†MQ6¬\ä\Ðu5›##9K:Tm\ì\rn˜…T\ÅFm¾\ï¬\ÜM”ŒP®™È¨™A\Ín‹bÄ“\Æ*³@9ô\ìjR1™EG³Úµ^\\UöEd\âZeu:Š¶À\Zƒa¨h²€ŠŒ\"\àf¬0\ÇZ…ƒ“P\Ð\Ñ‰W8\ØQ\ÅXu\ç a»#¸¨±D+œ\nDl·¥9”úšn\n\ÒNô(\ä\Óy©\Í.H\æ“(\ÑI“øRŒœS²\0\ÍC=;S[ Hª’\\\Âž˜\æ\r\Í(*§o=i ´T¹\É>\æ¥Y\Ó\"¦\r0\Çn*\';y=©]\Æ\åòzU{²LgœdŽiƒ´F\ç<RI**\äUUŽ{\Z ‘d Ÿ—9Á¦A1V˜ñU§’XS Žx­S°ã¸ªok\æFŠ\Ù85HÍ™—WÓ´aN{\æ±g¿žO—ŸJ\ì\Î7Lc \ÅdU²_Žr1\×5W3³LƒGia\Ý\'š\êC\ç½e\Å—‘·ƒÒ¶R\06œR*\ã71#Š™Pƒž\Ý\é\n`ri­0F\n\Ün©c&8\ïM\ÜJN¢«€\âBA\È=i¶®\ã¾iP€3UA\ë\ÍDd’.ƒ>´\Í7\é×šÌºk¦1¤@d·\ÌOaMûT‡øIü*º\Í4— Œtª@\ØL—p“°\îb2¹\èjÅ´·\Ï\"+À 0\äŽÆ¢’\êA$yC\×\íZð\\\ÊH\ì{P-K&\ÝB\à““\éYz‹OD£g¨­Ä—x\éŽ;Ò€¼\ç\íI”›87¶¬bXØ•þ.Õµ§‹\ÙS2¸5·%¬n\ç±>\ÔØ­V&\'w¶+9Á´,q°\äµHËƒœqR\ëJ@\ãšÁ£~ažYô*7;Š³\ëM*	\éS°=Js[G€qÚ¼«\âG††­¢<Ð®gµ&Q\Ç,«\Õk\×\ÙAOÆ².\ãWŽE\ãqZÒ©(MI=™…Zjpj\Ç\Â\Åòs‚*3Ï¿5\Ðø›L}#]¾´e\ádÞž\èüŠ\ç•x\à\çÚ½õ+¤\Ñ\ãZ\Ì\ìüf.<E•ÈŠ7cV¾!¢/ˆYÐž$-\ê1X¾¸\Ó\ïšH\ÈËŸJƒXž[‹ò–.Àd“É¦„ÑNF=ú\Ð\r4\ZR +DI:\ã¿\á\Í${\ÔjF3R\ço$U’FÄ“À\ëúR¤cŠw©©âˆ¼ˆ¡A\Ü\È1SQ\"‘õg†\í¼OF9x\à@On•ÀüQ°\Ø\Â?Õ»?n2+\Ótÿ\0\Ü\ÚÄ›xT¹Ÿ¤m LJƒ¶E9\ãŽkJÓ¹¯)ót¶ž\\aËŽ1Ç­AY«¡\Ô\áE³Y“Ž¸È®e v\ë]•Ñœ•‰°G9\èh8\rN\Æ23K·$VÈ€8\ÎGzŒûTž¸\ïQ°\Ø\ã\æ\éL<‚š¼œ\Z†X sž}\é\Ë\Ç\Ð\Ó_j\àf¸\åHEž¼9\íR\Ä7–\Ï\0ñš¬¼œd\ãh\')\Ï?¯W+Fy\ÈÏ­(ª&? #Š†4Ž\×Ãº4ö²¼\È8Sœ}j¶«\á\éôõ\ßÞ¤œƒÚº\ï¤i¤¡WBIù±Œ¯½[Ö\Úf9\èkÏ•Yª\Ô\ï…(:W\ëc\È|¶•\Ü/;W\'Ú©\È\âºe³x¬.oÚ®ÁPc¨\ï\\\Ûc$\Åt§tr0\0\àò(\ÆF)x\Ï\Ðv£ª\çÒšf\Ú\ß!j\äžÃšo\rG\ç\ÇOj ·¦(q\ÍeI¦–\0\à	`sŠô+\í\Ó>\Ðfr\â=\Ì8õÀÀ†YUw\ç®}+Ö¬õðº|–—llÚ’zñYÉŒò&\ê@ÀÁ\éL\êò©\'$|.ãŠn\rR½\r\Ò`ö\îOzw$\Øúf¨ƒøŒÒœdÑŽHœFO_Æ“£†\È<c¥H¤õ¦dzqJ9º\ÓI\ç¦œŠs\Äú\ç4Óž3\ÜPO\á[G4v!°<·?Žk ô\íZ–’\Èñy²‚p:õ \Z*0s’ÁŽj°<\ãÒºYm÷[3\ãn@\ëŒ\×<À\ê?”\ä:zžhe9\çð¤\Æ(\Ïw\ÆM)<œ\ãå¦\ÏLt§m\ç‚h<œdñšš^YQ\ÙdS•n\àŠM \ç¡\àS	\0`+)+”™\ï>ñ-¾³m\äN\Ê$TBŠ\ì\í.[NU-nJW\Ë×“YÌ²\Æ\ÅYHæ½¯\Ã0·Ô¡[{–\Û?9C\Ðý\rpV¢Ö«c¦ÑžÔ²-\Ì!¢lŒ\ëAp\ËÁ(\àW)e?\Ùd\Ê?\Èy+žt\Ê\Ñ\ÝF\Z3×­rÙ¦hK¿\n_‚;\í@#`¡¬6K»9²¯•$`‘RG<ˆÀ†\ÇR\Êx=\é’\ÍI\ÊSž§õœfIƒ\ÅH\àƒÖ¬J7+aÇ«\Íe?’\ä€Üƒ‚;Ó°ýT‚w¯@MN—;ñXpr85L\ÜA÷òOf\ä\Z¹üx ¯\äFiˆ´$—+ŸqPI)A\È5|I	]åŽ\Æ7J\Ä	PU³‘œ\nD2U\é\ß4Œ˜mÀ\àwZJ\Èp8\ãŸoj	\"R‡ ý*sdÀ=i\ÌÁ\ì@\Æ*¸\Ê~\è W,G,2d‡\ä0ZªJ\ß>¬©ì¾7(üœv9(C(\ÊH\Ãp\n\åý\àÉ‘Ž¢®&¥\n\Çj\Äfu †\ätª9\É\î9¦\ÇA, ôn#œ\â [ \æ |¼Œr+\í\î\àŽüT.d”\ÄóT‘-žS\ÈA¡\ïY—M¨Q\ÆH<f²Çš¡vœ­N¬¥T\àŒâ…p·¶¶…ˆ<\äU\äQG!‡<\Ö{#B\äžþÔ¦I \ãnhcF”—a˜)OÆ³ZLœ\ç\0uY\îûÀ)‚UbÀ¶	÷\â\ÅyY›\æ\Î8\Ç\ã\ÜT[~\ïn™¨\ç—k\ä}\Ð\Ã=\Å!ó€»p:Š\0xŸsŸ˜tú\n±»\Ì\ã\Ì\Ïb³Y‹ƒ\ÂÓ‘ˆœâ£T·—\Ë|\Þÿ\0Zlwh=N8ªšLU\È+”\äz¥;¿Ì§i#À\Í±»Ã’\Ä\ã#\æ\ç­N÷¶¨¤e±Œñ\\¨WVX\ã¦3\éS¤²œn=½ª\Æ\éº,Ÿº;ºg¥@\á\É\É\ÆŸ©ªqÝ¼_uzqRAw©Võ\Îyüi43Rhd0©VÏ¯<Ÿjg’gžý3žŸJŠ+ \ê9N{ñaOw‚X˜ù«¼½\Ü\ÜRx\Þ,\0äŒjØÄ±ªš¸\Ù«.³!\Ï;s\Æ9\ç½j\Ø,‰¼\Æ\ÌÁŽqž\ÞÂ­\ÍÙ¦T\ÂñŸ\\\Õf™cÁn€ò3œTr*\Èòðy8ªrB¬r®\à\äõ\éŠ\Z$\ÕÜ¬IV_ 4\ÂŒÿ\08\â¹\å6\ì\ì]„±gñ\â­\Çq\ä\íó·nzš‹fŠ™S(I 3LvÁ‚3\éÈ§‰\â3Œ\æ«3F\è\Ýwñœô\çž(1^\êp6a€~p;Þª4ò6z\ê=\êy\×{‘…œñŽ=}Stxò1‚8\îi¤&\ÞùŒ§$`øT€—#½Â²L\Ò7D$€Cd|\Ô\è\çlˆvœþ\ÏBº>„\ÎM\ã\Ø\n„Žp=¨$zƒYò³AX\Ý+\nü(\îx\ëý+nG\ã‘Ó¾k–¾—|¿)\ï\Ç\á[Aõ\rhf-O¡®gXó<\ä$pq\ÇažÕ¿AœW1ª–7$·œž\ã\'°®¨#Ï«ñ˜)Ÿcƒ\ïXú†©Œ^l\Ò\0 œUS[Kl\Å2LA\n##Ö±­´©\î\Ýn/\Æò9H\È\á~¸­\Ó!\ÞxŠe–p\ÑÚŸ•@\çw¶=}ë ’[=?È‚Œt\äñV¢À!N2\ÇqÀ¨®I’&\à­4\Í\ãw\ÞX¾\ï±8ªjgz\à\ç\0\Ï5¡¨®/ž2ÜœUA‚˜\êp;š\Ù3¢Arœ\çôÀ÷\ÍqWŠ%\0»Ÿ¡\àû\Õq¼±<\ã<ú\Z.j‘d\ïPœc¾j#¼\ç¸\êiF\\\ä{c\ØP¡œœÇŠ‘‚‰£\0u\ÏoÎ¦URFp:\nŒn©\ÇQ\ÏaR‘ŽG¨þt€kùm\É\ÈÁ8\ÅtZ>‹wypž]¼Ì½K„;WrMQÒ¯c\Óo#¸0,\Æ>q Ê©\í\Å{^…\âmCU…\Ý\âŠeÁ\ØVU$\ÑHÔ¶ˆÁ\Z¢Œ„\\UðJdGvHõÀ\ç­HT²\ã\ë\\m’\Å$Žô\ìw\âšpsÒœBŽi&f\ÑN\áY£ ¨n1Šð\ßX´[\Êý\ìƒ\îE{¼\ÎO\â^9»Š[Õ…N\ìuõ\ÅtQz™ý£‡ƒžH\ã´\áºf“\'\'\ë\×4\ÂWcúek¬\ÝO\ËÏµL_g\\* \å\É8Á\çÖ¤PrÀ(,R\àda/­#J\nœc=}ð*Œ…¥\'\Ì\ã\Å\0?<ñ\Üô\èE5°I\'°¡”³|¿Z\0œqE\Ø\nx ƒœ¶rGAM\'<÷ö¤¸\ã§…!ûˆ=ˆ \ÓBw=sMUb1\ë\ØTÛ†\Þhf\Ð8\rzò}Œi\É*¢\ä¨\å{WŽFs\"ýî½«\×ô\Å?Ø¬N\ç¦j[2’<ŸRº{«\éœ`eó´t\ãUÁÀ«@™HÀUcÏ­P ÝXý)y\àzp)F\ÐH\ÆZ;úƒI”)l-F¿\ç4ü\r¼0÷úS\Óv23ŒR¸\Ò$Š\Ù\æ‘p>ñ¯xÐ´\ÔÓ¬H\Ü\èµ\äþ¶[½JrpÃ€\Ý\ë\ÜUG@\rrÕ—A´4–\È\æ¨kið\\°–PÌ‡:­3U¿O´’i/Ö¼™/\Ò[†•\Ç\àz\æ¹Ù¥8Ýž«7Œ-¶\ØI\ÆOzé´¹&¾A1€Æ§¼\×\Â\Ú3\ë\Þt€yŸ¯¥{½½¸P ‚\0+š¤Ž\êpH†(\Ø\È\éRl$\Õ\á iÁ \×9±Qb$g<\Z±…*R3\Ç¥=¸\Ü.zSweö©—p\Ïò¦\ÉâŒ\ÛÂ‚1MYU\ß9=y=©Ø†\Çi‡4\É&QÒªIu\'Ö­\nåŒƒy¤f÷\éÞ³Rò2F*_<tª–K5\n±<‘U%œ—^*S8\Î?ZV¢\Ñn)#˜6qÒª³Þ˜]p¾ž”X9 \á\Å&\îj¡\ãŠjM*›/+\rY³’b2)\âF\Åm$l+8\ìj\Ê\n\ÅI(\æ´ø˜®˜\È\ÖV\ÏCZ	:\Öo(\éÀ«ñ¹\àg\'­uA\È\Ðù»\Z¸\09ª±\É-VK•\í]1FLs\ç4\ÂIùº\â¤ów\àcš¯4\ëD¨\î¿5²Fmš0\ïT†MXˆ`dõ=}«\r.\äa˜V½®öB\ÌqZ(Š\è²q\Ó4ÃŒœb˜\×*8_š™om-\ì\ë\Ë;°\n£\ÔÖŠ9	‰\É÷\îi¿h„¹U!ˆ\ê:ú?.W[\åSŒŠ[khQ	·u_)Ÿ0\Ð\ÊXpsV€\ÏQ\êj5\0Jp:pMtšlvvÑ›û\è–d\r¶gû³?3þ™¯qß¥\Ìd­°UI[\ä\Æ\år>ðõ__­\È$;J <\êjmB\î\ëX»3\Ï)‘Ý²\ì8\àt°\0tœžW\Ýœ“G)I”\ËÀ©9·4\æ„”S6lp:’qR\àZß•2OZ£\r»´†Gn;\n\è‚\Å (c\\Ž2’Z(*3X\ÌÅ’\"­\× S\Ä|g8­\'µ|dŠ‰¢\ã8\È“¦j¦eÈ™À÷ª\Ï\Ç¦Àöx¨\ßO™³Ç½c(3U$dvæ«”\ÃÚ´š\ÎUaÁÁT-¯w¬\\ªš2\Ý°\æ `\Åh\Í\ïj©\ä\0qž3Y¸3D\ÊU	­9-\Â\î qTÊŠ‡U\Ñ^¢eÁ\Í[\Ù\íQ2·&³q+˜¤\Ë\Æp*\"¢®0RR@¨q\ZdL)\ÇZ@F\0¥eA\Ü\rKE\\m!<Tr©Q£c\Åf\Æ%\ÄqFIÁ¨¢´†UQÀ38#†\àô¡±¶¤\ì\\Ž#|ªO¥D³ñ8i\è\ë =H¦•\î)d\nA}ª\ã aƒ\Îj=‰\Æ}(–Aõ¦MÉ‚ª€\0\Ó\Z1\É=*°Ÿp\ã&‘¤\Üx4\Ä\ËÊ‘· Ôœ\n®‡\n\rUº¿0pª[=1Näš‚­H#Œuk~“Ë³\Ø\èkL¾z\Ó —Ë…zµ.qTÄ ©ö§\ï\è	¦\ÕOzÏž\ØL\È\Äý\ÓZ\r“§*rF\îhQÞ´À\îA5ZÜ\ìw*\Þwô©±HC“ž\â—\Ë\ÇzwJtc©<\ä\æš@\ÐÁ\àf¡\0`F	pƒ&§kd$·zd™XGˆ*ö\ÕD\0zS~Éµx#>•0Œ…É¤ÀtRp…OOT`þ*¸\' T¶RC™¾^HÁªMx‰ªX\Õù$^Ed„s>\0ùEAjE\ëy\Úq’…j\×O­GÁ\ÚË¥\\ùA\ÍCE©2¸\Îiý©\Ì(\ã\r\Z©•\È sTg‹\Û#¢\ëL#\ã­MŠ\Üù§\âö$R\ÚjI\Ê\à\Ä\ãÓ¸¯Û“\ÇCÒ¾\Äø¤[\Ã\×P¨$…Þ£\é_–\à\0:ŒW±„Ÿ5$»F\"µ_™± Ú½\í\èŽ,o\ÚHú´ºÝŒ¶7`JA\Ý\ÎkSÁ\âc¨Né’,9öz\ÑñovÁ\î\ÞHsúŠßŸ÷‰\Éû¾c\ãw­/\"\äõ§\'^•ÒŽv\Æ\084ãž½…+f‘J\îÁªapN¤óZš,F}Z\Î02Ze?LœV{)SÀ­Ÿ3\Ç\â\r8¯$\Ìëš‰l\Æ}EŸ%F\îŽEbxª»ðý\êŽYc\Ü?\nßƒîœž;\n\ç<S©.›¦\Ê\Ç9™J\ÓÃ“^wSd\Ï\ÔLi¥¸$\ã5É®\í\ÝFk \ÔË±N\ì8#¾Glû\×9\Îk²‘.§\'µ<uçŠ†<m\æ¥q\ëƒ[£&!<d\Ôg;ºsJNA8Ï½!#­P\"1Œ\ã·jh\'ŠRz\np\Ú\"\ëÂ©\ä\Ô\æ\çÚ™\èqœÔ«\È$~T\âo8\æ€#Cc\rMÁ?\È\ÔKœó\Çzÿ\0J\0Œ’1\Ø\nˆúó\ÐS\'¦I¤^>öq\í\Î*d·kq=©\rº\Ï¼\Þ\"¹ºDŽã‘€¨Á«7š\\W6°\Íb…–7/÷‰ô®MƒTŒ0ÿ\0<\×;Q‘§4’\Üõo\Ùo\ÄbBÑ®\Ò1\È\Ãw5\ä$sƒ\Ï=k\ßnxð´žw\Ì>Ê™\èv×¸\ãñœø\íD6\"à¦M=Á\Çzw\'8\Åj0Ï  3žƒùR0ùMŽ:õ\Å\0&zœw¦0\È\ê;S³š;`gÞ¥\0\ÏQ\ÅI\ç¸!ŽI\çž+BÐ¿´Ž%-e:\äq]d^±†I\"Ÿ$\ã\åb{\ÖRœS4P“\Øó`\Ø\ç‚Y€=\Æks]\Óc°¹ò\ÕJã±¬ ¹öæ´‹½™\rXQ¸ñŠoAžpM6r8¥T“\ß«$RN}8 €\éB‚}9#“qI€)À“ÜŽ)¤dñÈ¡†1×¦)+€¸\é\Ïˆ\ÇÓšÀ\êi	\àz\Õ\0öµl	SÁ\î\0Á\çš\Ê=Tc¶\í\Ô2cg8Á÷>”f\â\áŒn­Œ6zu\Ís„üý±ZW9u\Æ\Ó\Üû\Öa\é\ÎqÒ€@\çŠ1…\Îy\'A\0ö\Í7øI=8Ç½\0/e\ê}©A\é„w\Í9\ì?úô\"Œ‘)q\Èu\ìzñÞ§Œy‡jý\ây\â“@TÁ\ÏjrJ\ÑJ®ŒC)\È#‚­K­.\æ\Ú1#`£¹¸\ç#Ú²Gj\ÎQ¸Ô^ðß‹\ã˜%½\Ù%À\Æ\ãüY¯KKÆ³\"x²÷A\ßð¯–ƒ\ã>˜9\Åzo†<XÊ·¼f,[\n\ç¡&¸ªÑ¶¨\é§>Œ÷\ë{¸5K\\©\çŒr¦²\'´q(ŠSƒƒ‡\ë\rD‹ ¸¶“köj\ê,µK}E\n0\Û(2ž¼W#6Ü¦¶÷°H32ö8ý\rB®û‡¸­¤óŠ°$\0k2öO³:¹_•ºœfÉ±[†‹”\Ç\æš,Ç”\Ü\Ë\ëŽA$N“\å£sƒ\ÛÒ§I<§!†\å\ïŠ.QHGb<÷§B„\Ù\Ëg‚Mi¤Q\Ì	n2H¨~\Â\"$ƒÁçž¢\rò\ä^ \ÕfYùa\ß\Óò\íZg\Ì*0I\ç¦9¬\Ùy\ê7z~D1¤¸žy\Ðg•\å!¸\çŒ7.@Š¦_dŠ½\0ß¥2	dœ#\äû{\ÕI.¢1œy5o Ž1\Ó5\ÞX?2ž\ZB‘¹\ÞòFzR4¼\Ú2À\Å8[\ÊH`w.F½sNq7\Ê\Ù\ïLEWbp8ö\ÇNI¦N>¼p@­)Fv}G©©S\×\È\Éô«@R:’,ƒz–=EX‚\ã\Í\È,	nª«FŒ\Ø\Æ9\ÆjxmÀ(ÄŽ\Ð\Â\ÅÁ$\ÊHhö©\Î1VŒ‚TÃœ\çž*\ÏBw8\è*7ÊT§\×\éRZD-@\Ø\ë\Øc«\ËjTw\ç­I\"\ËŠfÝ\Üf‚¬B°m\Ç$\àŠ~\Å\'\0\àq\ïNFT†FÓš”\0\ã\ê=(/\Ý\áXu=\Çz€žÿ\0Y`‹€\ãŽ}Á¦r~N\àü§\ëTö39=ïŸ½P±\Ï8^M¾D$Tzw\Í3x0\\\×Þ¡€ñr\è»O$žôÅ½H\È{žqŠnL\r\É\É\ÅLö1\0(ROlÔ€õs´€\ÃZÁ\Ü\Å\\uô\çµf\Å\n[’:Œ\â¯	++\ï\ë\Í\0YkKiS©Âœ÷\é\èj«\é\ì†#\'ƒ\ïSG«©\Ý\ÆrM<\Ò&wùxæ•€r\n€\\°\É\Ï\ê•hAq\Zhö›„W>&!\n“Ç§¦{TJò+®\Ô=x\É\ëT‰h\íVT ž2¼j \ãlŽ¼1AÓ‘Á¨¡º/;# õ\éU\Þ\ê&”©\Ü\n±ö \ÕQ¸Š\Êý€“\åp0Xq\Çq\î*)¦_%\0 “\Í^›Ë™NËŽHª%gx9 ö©bf\Ì*ç»×€F@¨&‹\ÌT(I*’Ì±›¸ú\ä}0*ô7±\Ü\0„d€GLR±€\ÊA\n\Ê]H\å‡QO”?\Ì\Þb\å†	\ïV6\ÄYr¤:®	\"¢‘\0\Øð¾X…÷¦…rGH!\\ŽFI\Îzk5 \nùQ†b\à^\Ô\Ãy&\ìL\à:‚\\\Ïj™\ÙeŒ\ï`£iù÷dó’i…\Î\å¼ChAýð\'À=½i^´\"\åFFqŸj 4›4va \ÓN‘§¯<\î\'Œ\×k¥l\ÍG\Ö  \â_\Ä\Z \×öÛ”ù±‚\ÇûÝ½+>]\"ÑŽHe$\ã¶~´\Ï\ì;A\"[\nws\×Ú—\"Dº—;‹yr˜¨®SWvir¤ð§\Ø\×Qnm\Õvtö\çš\åµx\Û\Î]\Åm4\âsTm³Ÿ\Ót\ëh\çu\r+1 ·l÷­$]\Ü.6Œ{T°†_q÷js`œg¯8\ÛQ$]r\0÷\ÎqUgŠ3†8}¸úúš\Ö(\è1\Î:\Ö}À‚v\'\çÁÁýG\à)&h(ñ´p\\ô\Æñùÿ\0…s¾bƒ¸LŽµ§¬^¼×ŽC|ºƒ\Ç¹¬€\ëÁ\í9\É\ã5²:©­«¤»‘Á\ëÖ‘\Æ\Ùm\È\'Ã·½&qœ—\æ¦;\înŒsß¦úô\Z¤:3¸±äžµ2¬dü}\ÎAã·¥@)cÁ\'\é€>•~#‡\çd\ç a\Ç×Š–Uˆ6\ÊJ¨\\Õ²•Œ\árz\Æ\n¿\r¥\å\ào\ÈÇ¯\ÝÇ¾+pxfB]\ÚO—¯C“P\æ‘J\rœ²\å˜mÀ\ì\r{…e…t\Ô\Ô0\ë\Íy@·‚&u‘\Ù8d\äU›yß¬;ö)\êœ\ß2S\è(»ÓšN\ãÀ$W?¢\Ü4\Ö3œ\àrMm4¹\Î8$W+\"Q,¨<\0}z\ÐO#8½VÀ§4_+¯JDXmË†NA\È=\ëÀüQScµ°\Ä\Z÷I\äA\' Ž\Z¼·Æ’[¢¨\nÁ\Û \0©5\ÑIÙ™\ÛS\Î\Ë*@\ÇS›»Ž0Æž[$\às]w4D\ÈJii0[\ß\å3†\É\\ŽG>\Ô\ÒÁ‡=Lv\âƒAœ.\Ïb1\Ó\ßð\Å( ã€´9l\ã¦N:l\Ô@q’\Ø<f&÷~I qü…K%¼±|®«\ì½G\çVt\æ%;ó\Ð\äS.\ä2\ÌÏœ€÷§p(\à\ã)À0\ËqN`\Ç\0u\ÇoÊ†!;r:b‹°\ç…\È\àqFðOòˆ£\0m9\íF\åÀŒQ¨@ÿ\08\È\äzWo¨\ê\Â\ËGŠ\Þ\Ã\È9¯?W]ÄŒ\çŽO¿¥j\êqJn?\êò3\Í\"Yž\îxbrOZ7uùzô¨±×Žùô a¾˜\ãÚ¨D\È\áúœ\×=û\Ð_$\àr´\Ï^øýi½ž=ý(cE˜\É\ÆTœÐ¥\Î0qžŸ_N*=£†>Ø«6\Ð\Éqr‘¢å€\ë92\Ò=SÁ\Z“·N0Ç„\éÀ\Ç&»\É&F]ˆÀ³4m9´ûCõ8¬\Ír–[#m¨\Ç\æ5Á)§&h\àq:\æ°ú\ÍË¶\â\"NvlTz&•6£{\ZF¬K‚:T ·y\n¬h\\±{\n÷ÿ\0ø~;Df\\H\ã\'5I¤©B\ì\è´\r4\Û4‰T’=k§U\ÇJdH@=ªR1\\M¶vZ\Èh´­*Šv\Ì\ÓD²Žj	3\åðOÒ¬²8¦1L†Qv•wsÖ¨\ÈóH¥‰úT÷\ãƒB\à¯#\Ñ\r˜°Iu\ç_\å\ì+P&Ìž¤\ÔN€0#Šy }\ãTH\Éwº}íƒ¹‡y¨À¢\ä\í&¯\Ý\ÝG‚£\æ®t@Vv\èsŠ¢Y’LÀ&\às[\Ö\æU\\Ë»>‚ ±Š\Ü\Èp:w­—x\Ôö§a†9Ë’µ>Dš4!I«yWaN}¤\Ñ`2cŠr	\É\É\ïW¢€‚Øš°z)¬\Ûø§`$\'¢ž¸Ç½VI1Á\íOn\ÇL\Z`XCƒ“V#u<ö\ëUU52º\çš\Ö\"e€òœv«öò¬™=\Çj ¬G=Gq\Ío9ˆ\Ùû\ÜU¨ö\ç#š\ÎI\ã+œŽ;U„ž2N\á]g<x\åb\Ø\ÛWñ“YQ\ÝO©«\éYyõ®¸HÕŠ\Ã-À\êM0\Ã“\ÅA\ÔE4ÅºiŠS[\Å¶[’5E\Ü\0\È\éYÑ´\ÎÄ»\åTð6\â\ìHþJžZ¬ù/*H­¢Œ›-ÄŽpz\ÚÓ’KtyvVX\Øv=ÿ\0!X\nóù¡vm\0rMh\ÏxÎ±œ…1\Ç\å¦;(9?™\ëZ$Ce“{CN\'\Û\Ø\n\Çk\Æ¡_9=\rmBbÚ¥\ß\'½U‚è¯†.9\ã5©w\ÒPÀ´cbô>\ØúÔ±\äu\Ø8sS—³’–~¤U(\Ü.P¤@œã°¦|£*§Þ’+“rÁ\nœ\0*\ÌjŽeò\×F)ò0\ÄP>bÃ¯Y¸Ýœv YK9\áð œš¸,¤F#ó\ÇrœdLòr«Œ\Zœ\Â\êw“Š½1¤Y*NF;ñMó!\É\Ï#œy5.±™X“\åþ÷$PÊ‰¿7 ÖŸÊ‡z¦2j‹a¹c\Åg(š©\Z6\ã¸©Ÿi\\\çž\Õ­`cž*\ç1&\ìf³qE¦\Ês39\î\0<T/<k\nzP÷±8\Ãz\Z®\ÝÁ;½s\Ê&ñfs¢\ÊxwªR…@A<\çŠÔ˜py³¦µ’F\Ü2y¬\\MÔŠ\í\Ü\æ¡f\ÍX{INj\"ŒŒd\Ön%óÝŠ¡&«K*¸+SrÛ·d\â¡0\"¾\ê\Í\Äw(¼\ì\\`q\ÓJr:U\éb\È\ãŒâ³¥…ƒþ”‘iŒv<ž•f7\éScûÃœT^g·²q\ZeK­\áC5H™]0\Ç\åôõ­$/ÑºT8DI¬\ÜF™”\Þh,}ªý¼’\í\Ã\0z\Ó_r¢¡–\æb¡[§j‡“-£ù{‹œ\åH÷>O\ÜV|Sl´÷}\ÌŠV0\Ô$\æ—~I9¬‹™dòOØ§†v¦ºm\n5*ÈŠw\Ådq‚jC+2(®\Ò\ç•4i¼f°RwOµ\í&RAÖ‚I’\Ö\ä.=\êÒ\ËQó\Ïz|2Á\Èln¦…ac\Ë30©LH­ƒŒ\Ôkp*£vjm\èú\â¨VAõ§\Â!em\Ø\ê{U¹Š\"K\0#4’\Ü ûC@ˆÁDvQøS\í\åŽe,§¡\äT`\ïLúf¡Ü¹*£¤\ØÑ¦pyZƒ\Í`§#œñMWeNµ\ÈïœŽ3J\å£|±\Å\\]¬™\Î+!\Û8\ã5#>J\Ý(¸š-\ÌI\\\ãu<+\ì\éøU).H\0sQ\Ùd”®r1I°±¤¾™\â”`œVHŸ÷\ØÓ¨­%`A\àTŒ[vjEUªA\Ò9=\ÅM\Èýi{b€ ‚\Ì*¬wQ\È\ìŠ\Ã+S\î\ÚzÔ–XÙœLd\ã\å“p\Å7zL´È°s\ÏJc¿v¤\Ý\ï\Í!\nF*\Z-33PC%¼„§ñ—Œt¿\ìŸ\Þ ]©#ù¨¾\Í\×}´\ë•aŽ+\ç/Œ\Z\È\Ô#Cò°Y8\ê\×N|³k¹ËŠÒ—c‰ð\ã=\ê(\å¡Aùf¯x\Î]2\Ï1\í\Û3sõ\'\ÃBu.IO·9\ÐüFŽ5\Ñcb½&\0q]\Ëø\È\ärýÕ)^¾´«À\Å/\Þüñ]\è\äc\0rA\ÒuÀ={Ti0?\Z°	\Æ+Â‘‡ñ\r˜f\ãwu\Ç5„=«_@ºzÖŸ3‘µg@\ÄûñQ?…P\Âv1\Ç\Âø\Þ9\çK4ˆn\Ë1#\í]ò\áwô¬\rb\ÒI6È™8\êµ\æ\\\Õnx6¯mökI	\ÆÒ¸\ÐOLñŠö¿\é\è·R¸\ÏÉ•oLW‰®9>\Ýk¦‹º	“\Æ@\ëŸlT \ä\ãjº\àt(\Ï\0+¥1\çhK\×\Ø\ÓŽ\0çƒŠbB31®ª=ÿ\0\Â2÷ˆ\å‹\È	\è\È»ž€W«¨0ø\00v©\Â÷\É\É5\rŒó(¾cŽ„ŒR’qƒœS7|\ÜO\âž\\¶rrx«@(\È\ÛMg?LsŠqV\í\Ï\Ò6	\Æ;p:P’MI\È#\éCH¥ \ã$ð\n™\r­\á«X¤ðüS\Æ@u8ø5\Ãøƒ\ì\æýŒ@`œ;žõcM¹1Yˆ\Õ\Øg¨\ç\æ\Å$¶ñ‡.\Ýz‚k›–\Òe¹§±¼7\ßüdo¨8¯ g\ÜÛ›Ö½>ÕŒ~\nH\È\Ü\Ì;f¼¹±¸N§®)À\Í	ž}\Å8~{\Ó>aO\Ça\Ôþµ©h^\r3¨ö4ü(\Æô®yS× þ”\è\Ô3(=\r&Õ›uB\Ä0\È\ãðõ©lg³iú}¸‚#\0;00A\éZWlTŽF#q\à\ç\æz~«w§\0\Êvu¤\Õ5»»\å\"Y1òòlW#¦ÜŽ¨Ö‚¬3\ÆV¯\r\ê³6C\Æ6\äd\àWOzÑ¿½ž\åÀ–BûW“’g¦N23\×Öº ¬’0“Rmˆá”G# Ž\à\Ò\0zž¹\Å)\î	\ïNr+C1\Î6¨_Rx¦\\Óœ\ï?N\Õ\Ô\n\0S\ÇÓ±£¨“HF\áJ	 \Ð\0G\æÔƒ,q\ÆiHn$õ¦·¦q@\äœf½BÓ¡¸°ŽfQ»®ñ^y\Ûk¤\Ð5Yt\æ<Œœ´yëš–\Ækx“N[X\ã—h ð1œ\n\â\ÐrIJ\î<Iª\Û_$1·\È9÷®#€y#\Üw \n\çi˜8 Žsžx\Ç\áH9ª¹Á\Í<ž1‚)ƒ+þu\0t\Ï>\Ô\0¹?\Ô\×E\á»1s~ŒªýkÀ\ÏQŸñ¯Hðuª¤A\È\ëÓ“\É\ïùT·c*\Ý6u\ËH—K‘€\ÆÁ\Ø`WÈ¨\Ðô\ãÞ½\Û]x\×J˜c\0)\Ïlšð\Ù\ÜÃ \íR‚–\ÅuP¸ù¸úpj\Äls•Žr* \\\Ó\Êu\ä\äš\Z¹ºg¤øwÄ²\Ù\ì‚\éÁŒcO#=«\Òü\Ûwò\çG\ÆH \ä\æ¾u&0\á\Ít\Ú¾ð0†g>YÊ¸\ê\Ñ\ê\áR\Ú3\è{-P\\f\' 0\ê=j\ëÊ·#\ny\rqz•:£Œ7F\r\ßÚº$‘gØ²\r¯œ+\àŒâ¸ž†\ëTFð5Œ…”py\ØkN\Ò\æ	\ã\'$;ºj\ã\Ãöˆ™~|0#<\ÖBi\á‰VÂ²œ†g¥\"Y©	t\'ó\Ç<ô«ucžvõ+1E\ÌXK‘üX¨&¹¹\Þ\Ì=\ê‘,\ÑYLm\Élwµ(x¥mùœUºi~÷\ÊýóUœ\ÜZJfŒˆx(9Ç©¦K4^=‰œ:÷¬\ëˆ|\è\Øc·h\Ç:N€•\È\È\ïI\"\"G§\ãL–`\Å\Ä.A\Æ8ùjc‡q\ë\Ç#\ÔÖ›¸8$t\È\ëV$™—h8\Ó$\É_3h\ÜwµS \ã\éZY\0œ\np’0W+ÿ\0\ë¦1~¢\äA¬79¸g¡\ë\Ívw°E.wóž˜®^\æ\Ä#¸§4\îRE ¡ˆ\Ëö\â¬l.8\ÔsM¯““ž}€§ˆ™_\å\Ï4®RCC²9\Øc¥\rq6{õU¨\àr2ý`Xœ–\í\É4®UŠ^x#dv\æŸ\æ\0\Ã`ƒlÕ©lBŒŽ{wÿ\09ª†¾S\éÒ•\Êˆ,=ƒøS<Ü\Ù\ä{z\ÐÖ³$Góüª»ù™Á÷\'·zw.}¢9qJ’7]ÀŒ®¬\Ð\åpPp5\"3\ç\0g¦=ûQrMž|\îQ\ëÖ˜±!ROÍ…t\Ü}*¹‘”\0¹\'\'\Ûùt ¼\Ò@È¥qØ¢U!—;A§™\n&\Æ*\ØÈª‹\ÛQ‚¯8\ÜsO1NƒsÄžøRy‘0\Þ1×ŸÂ«¡\Än¨	D\È\Úrz\éž*E\ë‰1Ÿ\\\ãt\ØF”ó\Ðc9ª\Ó\Ý\0¦9F\áÛŽ¸ª¿iˆ\Ý\Ôþ¸úTmv¬›8 òs\Æ3\Æ(m\ÈI^\Éÿ\0­!“¯\ÎvgŒ\ÖlÀ)$ƒó)*¿\ç½9•®\Ì`†\Îqƒþ7\ì/$±‹n95¥1ŽDm¸\Æyn¸®^\Ü>YÁ\Ú2\ã\Ø\ä\Ö\Â9\' \Èö\êµhÍ¢¼Œ‘\ä¹\ÛÁÊŽ¼qšˆ\ÍÁ†<\àÃµV\Ô\0Y\0`Í»¡\r\Æ»þ†Y\ÒV\É<œ\é\Í;\Íe˜<¤ž\ã\Ôõ\ëø\Õ\ÑqU8*;óš\ç²wcsr9\Îi\Ï!YNH?w gø\â‹lµ÷\ÍòsŽ\ç¥XƒSÀlœ6#\0ú\×2~h€98\åºcÞœ\ÎÁH\éžž¸Ï¥ GA4ðN¥qÐ•¡#·\Ð\Õt¸H‘\r\Îqš\Ë@\îŒù\È\äži¯m6wƒ\Ê\àœuÇ¯rr\ã\'\ØTJ0ü\ÙÀþõN\Ê\åX¹ƒMò\Æ\ì\ç©\"½y·«d0PI\Î}3F3‚Ÿ~2i\àŒ\áGl\n_˜pI\êjF\Äiˆò¤p\Ùõ\çÞ¹]J73dg\æ\ÉþC\ÐWM‘\ä/r+\Ô\Þ}ú•7Dª`–ŒŸza\n\0bsøb§C\îñ\Ïo\ÏÀ\ì˜\Ûõ\É7)\"&Œ*’Kzs\\Ö¶\é¼‡n\å]+oRNy\Ýkñ&ù-p7z\ã¯b)¦RZž<\Ä>\æ-Á=:dçš„®\â}ñƒŒñœ\0qV¤\r¤q\É\Û\Ü\àT[\Ùrr\0\àœÚµL\ì‚!U-»v\ç Š_0=€qøTœp¤T8\ëóv§sT‰ÁùA\Â\çµM\n²È¬\Ø,­\ÓÒ¡x\Ýúmm½sÞ®[&p\ä\0ÿ\0wÓ½Ce­\ÏA³‰a0¹m Ÿ|õ­aðNx{VVœ\â\â1Œ`¯S\ì+iH)µlý}kŠRw;#\Ñ\Ä\êñ\çŽP‰(F2x\Å1ôû¥‘L¸.\ãxU\ä\0ksU‰f°X2¨Á\"²´–2¤ˆ§\æ\r–\Éü€\ïœSR\Ð\Í\ÃS¦\Ò5‡·be>Y\ã=q]­­\Ä3Æ¯$œ‘\\v\äI\Ðü£=A\í\Åt\Ö0ˆ‡aüyâ²“©›ù\âh.Fr5Z9T‚zó\ïS>A\Ëc­	œÓŠWòA¸ œ~•\á:Ö¡6¥v\ÌF\ÅO”§q^ùqI8\Åxn»£\Ïgtò\ã(\Ìy\íºº)5s\îs7ŽyÈ©v\áN\Õ$·j“c9\àŽÂœ¡\Ý¿¥u#D5¡8îž¼Z…‘‘€>\ÔöºD€Ä‘M1®ˆ±={ñŠe¤2`bmŒ¤:œ\é@9R3»ÒœfÛ‚\Ê3\Îj{\çžÂ€h»\Z\Ë\"–7÷ºu\ëQ4y<.y§Gu<ÁTŽ™³²\Üèª­\Åa€\03Þ˜\íŠ`8›\"\îû`\Ñ!a…˜Xk\Ì[€,O^½ûRsÁ\Ï\0v¦¤œó“\Î;\Ñq#Bò/<n\âº?3\íA\å\àôÏ‡+ò¢\çœñ\ØTò\Í-\ÎÀ\Ç$u¤\"\\žrO\ëù\ZV8\Î\0\ê=*bœ\Æ3M#ö\Ï\0õ§q\Øh*¤÷\ÔÃŽ€bž\ÊWviY@“c°ñ»vó^‡\à-!\ïu1pA\Ù	\ë\ï\\,ct õ\Æ\r{§€l\å‚Í¥~„m‚¸ñ59)³¢>i#¾[u\Ç8<b¹¯i\Þv™*B¹;s\ï]Pb\Ù\ÅU¸ùð‡¿k\Èö­3±\ÑMk\à½§u¹•p«Ž\Üq^\Ï	¨\0`\n¡gk¥ºG\Z…\ÇP*þ)MÉ—\n|ˆÕ‹\n°­\Åe¤’)\Ç>õilœ¯Ò’`\Ë@ŸJ~\æçŠ¬%\Å)pps\ÅZfl{?\'\'\ÐUi\\.sž”…\ã\ëUnœ!y=ªˆdN\ê\Ì:óQ½\Ìlp¤\0;V>û®w!\ÇlP‚P£¥2óHª\Äób³\î\ç•X(\îqJI‹\æÁ\æ©g“xC×Š´\Éh‰b 1\ÜX“V\ÖŒf¥11\0‘L;QpH\çi\ÜV;Cqšl\Ö\í3¢ö\ržµ1.\Ê6Æ ûG”l–\îj“}\Ú8°3\ÐVj^\Å4ŒªÀ…8?ZkOŠW\ärEQU\\\í\\zö\ÍP™´g{\Ó<øÿ\0‡š\ÏEV$aÞœUcú\ä\Ð#Gœõ5œp\ä\Z‘\åò˜÷\Ï|\ÐR-,»À9¥K™3š­³r*ÀBg¥Z_Ž\è1\Æ*\Ð|ž*‹€ƒŽ´\í\Ù\0t&¶‹3h\Ò–\ÚU€\Æ+6,2OSZQ\Ûp75uA˜I\Z1³žµj\0IùFXÀTp\ÄB\í\r“Šœ,±\0¨WrMwAœ\Òcý\Æ\äm\Ø<Š%3´jB\àt5h\à\ç§z_˜ B™O5\Óa\";Y\Ç\ï¤$WKÙ‰·Œ\í\nÉ\ï§fP€&9äŠ•ašÚ­¸óÁ­\âd\ÇLò\Ò7\0b¢\0ˆ‹’8§O<‘\"\ÆW,\Ýj\åž\Ä $QZ&C3t\ë9\î\\\Ü0(¹;9<\Öð	\'=ýjÛ²’J\äŒ\n…\ã©\ÆkD„‰­.<’\\ñ»õª÷\Çq)ùwcÞ®\Ë*(DD,\ÛpIõ5›¥\\\ê:Œp\ÄDaC\ÊO\Ë\Z\ç\\P6I\ÞZC%\Ü`\æ!±+®FI\ãp^qRE0‡OÂ¤¶\Ñ\Ï|ž¹®\Ï_—O\Ûg¦\é\ê~\Å`²$eº\Í$™flwl\ìbˆ£hÕ¤MÊ±A)Š1Œ*©-\îj\Ô1L\Ì§ —žµaU\0”r´\ï5·`¨£‘O”.VºŽi.“‘Ž\0«ÖšifV!0{“ZVöHÉ½œ\ç°\Å_û,Iú\Î@úóG!iœõõ›eŠA€y5V=\âX‘X6Y\È\âº\È4Ë¹÷2¯¶¡³¹Š=«\Ú\Ý[w ú\ÒöIšs\Ø\á¢ð\ÍÇ“+¨\0)õcÒ²n´k†ù\n\än==«Ò®\îæ³Œ8\Ú\Åd,ðÜ¾nA)ƒ\Ó\ÜTJŒJFy\ßöA\ÊS;G\ÖÕ«¸FÞ™\Õ\ë\Íe¦”\ß\Î6¶>1XŽ\Öü/”GOþ½bðæª©\æ\Ênvªˆó\Å?tw\"½X¡f‘¦\\30\è;\nÊž8§vX”F¾õ”°\í\Z*\Ç) }i®\\Gj\é.´Öµ+\Ð\ç°\æ³\0z\Ö¥cxÔ¹\ÌM§ó”<`ñšÊ¸³1u~q\ÍuRFfM ô5M\í¢9\ÞySš\ÆT\Í9\ÎBXfHû½0A1|’\0·.P€3Tˆ\'#\Ï(¤fKŒv<\Ó%…v|\Õi£11#$\âž1•e\è+\Ó0J¢’\0À\Ç\äsZSÂ¡sŠ\ÌtÙ¬œJ¹\Ü\'\Ê+:V}\Øj»—W\Îxª¬›Ø“P\âReG|:ŠC\'!\äR\È71L`F›E&5J\Ç5eX*ŒvªË»5(tU%\×<T•s9µ&(…<\Õ\è.ü\ÝA5ˆ$…7\äò}\êk;‘ª8\ëÖ€¹\ÓDu\0\Õv\0¬õ•eI¦ö&òx\é@™¹\ç\çNsT\Û+9lõ]§,’&:\ã\Ð!\æv‰sžzc_\ì‰Øž\Ü\Z¥\æ	nsOq•\0­\0ß³o2 *F3[6Ó¨ƒ\r\\\ìq€| :Ö´ª\n.+\Z‹w±m\'\"¡ó#e\Î\ÎsQ|TY\Ú\ÝF)\\e‚ç°¥\ÜI¨\Ëx¨\åb2A¥vî¥Š‘ü&š\Ê@&š­˜\ÇsI(fA\ïÖ˜®E#¾ßf¢³ŽQ+1¬’sT\æ\É=\éHW-°))sWceÀ*~¢¹\ß:\áÃ—b«’IY\Þ,,\Ãyl“€hcNYfûL„s•\Å%Š\Ü\ÇrG8¨-®¢i’G9ú\Ö\ìs\Æz0\Î)2“\áuK\Z€[\ïv«C\ÎpwœcÒª\Ë;«&9$úÕˆ¦\ä“ù\Ô\Z\"H|\Ø	.r¼\Ô\Ñ\\¬\Ç\0L†L¸ª–ò2ž\Ýh¸\ËóJb±ßšT•vQøT&D•}$(s\íR\ÊE¤r\Ã;qš\â<q¦kh7p’Tü+¶S\Û5V\î\"ù\\dÁ¥r\É1\Î*Qhù3\á\Ðd×¥L›w\r\ê6\Z\ê~&i\Êü·\ÍI¤i_\Ù_o­”mY wA\Û\rG\Ä\èŠ\èö¬Ÿ8ñ^¤&¥V>g•85\äx_z~3ÓQ&ê—µzq9E\Ç\'4p2\Ù R=sMõÀª«ÂšpÝ”a‘‡ò4ÁR\Ûl70‰	\ØeL\ç°,*&\íHú£N¼i\ì c“˜×“V\ä“z0nr\rh\Ù\Å…~QÂÂ®4q‘£5áºº³¹S\Ð\àõ[E“J¼\nIý\Ë\ã#\â¾[^8\Í}¡~‘+…\0\Â\Ãø¯&]’¸\Æ0\æ»p²\æL\æ«1Sø\ëQœ{õ¥®\Ó1\Ù\ã>¢¢lS\É3Þ™\Ô\äv ®F{«ù¾\ß(\Î  ô\ç¼‰A¯Pi–‡\ÖË»\æi\n•\íÁ8\ãÞ Ló>Ô›YH\ÅHF\ãÓ©¥•¢$@\Ä`ô\Í8ž{I´ô¥\äs\Û4Æ€N9¢5ógDu\\\ç¹4\Ö=;ç¡­\ß\riÿ\0\Ú\Z\í¬J8Fózæ³©$¢\ÙI\\ô›O[IlY\Ê:tc\×5j?\Ú\07³¹\à\Zõ\Û+8„6€1\íW\r•¾:kÆ–*w\Ü\ìXk£\Ä<W\Ø<?4)\Æv\í^H\äŽ=+\é‰I:ªü¿¼:\×\Î®p®\Ü4\Ü\ás	Ã’V\Î\r\ìGj>R¹\'œñJqßŽ•Ôˆ?–~¤\Ò\àc¯\Þ{=\èÁ\ÏQI€\ê;c\ê~\nð\ä:Žš\ÒM\ä™\È9=‡q^ZI\çšú\'áŒ–\í \Ç`²\Èø\'\Ø\×>\"n¹p‡3±‘?Ãˆ2\Í\î„ö<ŠÅ“\áô©\Ç\Ú†\Ýô˜¶c¨\ÇLúšd‘D\È~Qõ®­³e‡g\È\Ú\æ–ú]ûÀrÀ`\î‹ü9\Æ=þµ\èT&³/L60k\Ïv–9ÀŸjô©Oš\nFMr¶†Œô\à\ZŽ=M.\Þ:~4Ò£1\É\ïÚ¶!ˆ1·ù\Zv9\ãzNø\íN9\ãŸ\Ä\Ð \ç¶(ƒw­9x a°c4Ï—&x\à\ãšg9\É\ë\ë@„þW\é]—†ôÅ¿‚SÔ‡úb¸óüù¯Að,NM\Ã/\ÝdVRv@ax‡O¸Ó¦Œ>He\Èüû\×.HúŠõ\Û?—m#€Ws^VN\0ƒÞˆJ\èPî¦™Û¥\'#ñ žy9õ­JFy\Îy\àQ\Ôg4\Ì\å©wõ¤\Ø÷\È\\\ã-Ž}\ë\ßô=5!\ÓaR2T\ï^!£\Ú\Éª[ÀŸy\Û?•}+§i‚\Õ!p2Fzb°©#)+™:ºFt«°\ê0#8¹ó\Õ\ÆRBd\×\Ò\Z\åŒ\Ñ\éW2¯a’k\æùÕ¼\Ç\Ïv&7{•b¯¦y4Ò¤-?-M+\ÏsZ–G\Î+¤ð\æ™ªóBÏµ€\Ês\\û§S]Ÿ‚\áw¸–E\nv“ÔŽ+*¿šZn£¨øZóÈ½S\ä8w±\è\ÃúŠõ[[¸o\âóÕ·Œ¦\ÓÖ´/<7e¯\è\é\é¶S\Øý=«\ÆÙµOj/o>Z>\áØ®{×›4™\Ñ	»\éav\Ã)<q\ï\Íi²É•Àüq\\f“©C¨BŒŽ¤~¢º”d)\Ï\ÊF3\Ô\Ö[«3hª\àg©\ã\êœ.G§JbÌ…w3ô\íM7Ê·\à3E\Ä\ÑZxO”\ÆO\äjf\ã>‡5c\ÏI7\Ç #9*}MGh¥\èzóƒUqr‘\ÙXepz_ny¨^ô£ˆ\ß$vnÕ²$FP¼÷\Ö%ú[K”\Çzw%Ä²¸‹bœu§½\Ô(½\È\"¹ùež\Þ?)H\àsT\ä¼%\ÛüÏµ36KX\ÆG–„Œ\âªj\\M’£<§Q\Íd¬²#gÕ³VPüÀ&˜\Ò-\ïipI\ãµJP”\äô\ìG©ª\Ë!‰†\Ð2*e“<zô¥rÐ„Â§q\ß)<ƒ\Üôó\íHI?/^¤võ¡fÝ–PFr0jnZE2RŒó\×?\\t«pHø9ùyÀôÈ¨ü†”m9\È\ÏOOzO±Œ‡`3J\åX\Ð£)$\ÇJ¨ò\à™\'\'9\ïOË€sŒ{‚j†S\Ï¶(Lv*;\á\Î9^bÁ\0ñ\Ó\äU™,¦Û“\Æ:f˜ln7œ7\Êc¿^½i\ÜV(©Ü¸\Û\ß\ÝNF\'†\å¸\ÇÒ®‹&vô5(\ÓY±†º\\\Z..R’ù\\n1CSµ¡UÊ\Ý6“W–„; $v\Å8¡V$O§j.UŒ\ÞSp!øŸ¥ Y%\ÈRÃ±\0V¸\Æ@e>^1Qgt‡\åùcžh¸š1$·o0\îPGg§½Vû>?wµö\ç©9Á5Ô‹@ùüù\ëQ<f.¸û\Ø\ÉdQrY\ÎI§2€‹ó¸¦=³]ªs»\'žOÖº\Ø\Ì\0zý\rI!‹\á²q\îE	‡)Êª}\ÒP”^qž|Z\î\Æ:Žƒ?Ïµnù1«p>PqŒuöª3+\Ç+&8\ãm0±V;v\Ë!*}jEû\è¶\åw/XA–\ÎñÁ\ÇNjÍ¼sFÀ\r¥H\äò*‘-\r¼¶Ž`Fx\\Ï½`Ï§³ 9%wp1¶»9-\Äùù@ô\éY\Â\Ñ÷|\ä©\çŽ\àU\\‡‘K\'\Æ	{óÏµV6.0¼ó\É#Ú»O³!q¿\'Œ~G¥H,\áÞ­\Ä}\ì8\ìqSqr¶Ç¸<1\í\ë\éSÛ‰\"@\ê\á\Ï\ß$ûu®¾m%@À\àg$T¦\ÂPXÛŽ\Üöôü©\\9NQm\"wFÄ¶r\Ýx©^&@|±\ÇG\Ø3\Ó\ÐWLl¬\Ð.]Xs»\'Ÿ ü\ê»ZÚ«¶\Ç_»Ž¿–=\ên;’S×ŒT|¤Ú¤’\à.\0\ÏOj„99=ó\é^¤™\ä¤\"¦0=\r\r³i\ç¿#4¤–*1Ó ¨€\\a¹þg5‹e¤YQ…óž\0ns\ÅQšh\îÜˆ\ÆHœuö\ÍZHaPKOù6…ˆlS\×•\Ø\ìPeÙ…\è\Ä\ãŽ\Ôˆ[q\Æq‚E[/C–úrj \Ü\\¹<ûö©l´†\Ë0;¸÷¬\ém\Ò\\’@\ëZE#\n0{\çÚ¨\Íp 3v¨r5Œ)ñFœ\ÐK§t†Ç¥q®G,#Šôÿ\0ˆ\åWp@QŒc¾:Wl–G\ç•Y¸\ä`c®8­#3®0\Ð\ç\"Y¸\Ï¹\Ô\Ê\0l¯C\Æs\Ô\n\éI\Ó`\ÜÇ¹\çúSh\æ‘Y¢EP1À«\æ+”\ç\Ð31\Ê\îÁ\ë\ïšô\í#@€X¡š!#É’I? ®nKh]¢X\Ô”p+Ó´\ëc¤k\Æ\äQYNcZ\ëi\ßeo”ü˜\0Š\Öˆ€|¡»Tº™†\Ò\Ù\æ\Æ\ÜsšÌµ»Š\â$ò\ß~>÷==\ëtS•Ä¼’5VÊ’\0\çñ®ODW‹Q’1‚p½½k·1‰Àˆ‚}@¦G¢[\éò™À°â‘§)f\Þ4rK¸Œ3Wâ·\É\"‘òð}jª§\0Ç€0qƒR\Ý\ßE\r¹–Y•J§\ÔT\nd±y­>\ÒI\ÇO§^kL®9sþ»þ×ŽIY\ÈUlWX¶\ÇvCA\ÉPª¨\Ü\ç5Q\Ô4ô¹ƒt €Š\Þ*‘»J©3£q’r9>µqg,\×t\È\ì.q78\ÍrM\'<vÿ\0^•\âø±8\Âõ\'œvô®¨\'œŒ¯¤÷®\Êrm\"¢f\íl?\\d\0(1… ’r;žõ¤Ar£\ÇC\Øv¡cU\é\È\à\Ý\ë[š¤f„,T{ÿ\0]Y¹BYw\Ä÷\ÅO\ä„V\É\Î2n=\êl²€=9õÏ§|Ò¹J%Œ†\É\\çŠG#<võ©|\Ø*0O\\šŽ\"\ä©\'ž½i\\|¢:ªyü\ê<ú/QÞ­I\ãq=yÁ &\Ä\àg\Ôf‹‹”®b*2ô÷ôª\æL\É \âV!vŒÎ©\çw\0Ž¦Ÿ16)¢“\é\ÏubEF1ÛŸCHƒpOøT¦@[>is”\Ñ\n0\ê)®ƒƒÆž\n\î\ç¸\Î)H]„sŽ\Þ\Ô\\,Wu,£¢õ\ÅA°³ûs\ÍZp\0#¯LR¦Œ\09\ç›)!ö\Ð3ºœ‚20I\Æk\è\ß#Ç¥\Æ ü«ÀmW2)\à\çœJú3CFM6~A^f5\è‘Ý†Ž\æ£‹ŸÆ¦³€ŸÞ¸\É= ¨\"lø\çÖ¶£â¼³²\Ã6\ÃôF\'Ò§\n§ŸÀTˆd¨sN8U\È^Ù¨¤f}\ØR=\êÑ››;ª³3–\É\àf­3\Z¡24ƒ\0sTŒ\Ë\nblw©Jq…\Î\rUŠ\Øœ\äb´F\0á¾¸ªEw·F\ê+:x¤¹Áþu®Æ¢Ü \ä\ã\"‹‘c$YH\ã\ç8\'¨§¥šÄ£5¥\æ3œ\ä\ÔÈ¨¤õþf\Å\ÊfJIÊ„ô\æ²f	\rÇ¿J\è”P\Äc#¥f\\\éªÄ¿%‰üUÉ°õux—/\ánª\ëR[\Ú\í@\\˜«ÊŠT˜¹J‚\Ö5\n8öªo`K\Ï\Índf ‘\×n	\î§?%³\ä”\ã*§\Ë)]\í[k5°,C)\ÛÁ©F\É\å\éM1rF&¶\0\Ç0·I=3\Íj4N{\ÔOfÀ8\Å;‡+Fl±„\Î­>(™öœ–÷«†\r\ÜS\Æ55IŠ\Å&G\'=¦\Åm;K–<b®ƒ\'pj\r‘€zóZÅ’\Ñ2Z8Qƒõü+@N¢\ã®G\åU’r\Ç›Ž8¦LgÃN?t\ÂF‰¨®ÉŒ\ç&­-ÀNOI\ÊI\È5jf$\ÄúŠ\ì„\ÎyD¸\×Q„\n§5f\'2•b8\Ã”VÈ·X\Ø\r¸ g™®¸H\ÆP0äº»…GÁ>\ÜÔ‘M!B¥ˆcÁj\Ù{dv\É\\‘S¥ª\Ä>d\Æy®ˆ³2„³’Xð03Ò¥-p³âŒ±\î}«um\ÕP•^„Tö‘H\Ýú¹f<zÖ©\âWŽ1€G\Ì}\êH\í\çi6žµªˆš™\æ\ß\ÓmkKEVƒ\Ë9+\ÐUxše“.û\Õ\ÖrKdZ·kl%ùÀ\ï[DÍ£:%\äGn1\ÐVü6…0øäŽ˜«Z†\ãŒ)?€«¤P»²{\n\Ñ”¥\r’$œu#&·m4\È\Í,€2)\ÏsÞ¨\Å	\Æy5¸°NH\n8\ÝV‚\Å[\Ù-\ß)=x\ÇL\Õh,˜#–\rŒz\×KŒ\å\â.œúWEkoš¢`6Ò™V9h\Ã\nd²¨\Ï\'®}i¾¨LEU\É\ãó\ï]ôV—QoPˆAU\n;qÉ®mô¹T†\ÞCc9\ì\rRacž\"º˜,€”1ô«˜ªY‚@\nñ»¿•\é>ðæŸ«\\y\0T‰3…\à\È\Þ\æ»+Ÿ‡>¸RÏ‡®0ù>\ÄWle*59%{šÂœ¤®œ\ç<€F»‚’¼\Æ\áeo\ÞF<Ò­÷—cÒ¾†·øo\á\Ûw\r›‡*x\Ü\ã\ä\Þ$Ó®4«\Ùm\É,‘’ªû~m§¡4\èb)W“Q½\×qN2†\ç6\'Ý†V=lX·\ZSA\"º‚É’=y…vŸ\Ú~ZŽ	\Æ\Ôb9_Z\ÏÔµ\'\ÏE%@;F8QŽ+¥Ò‹D)³–\Ð\åˆ,2¹Ç¹þU…q®F@~^ÆºÅºŽveC„<m#õüj´š\"H´\ÛTús\\Ó¥}Ž˜T±Â¼„\èEU’Å¥„²…,z/r+¸m%#³¹$*m\ížMb$K€9¾?Æ¹\Ý\Zª§=²£™\nm\\\ÖkùG 5\ëú–\ÜÀ]\Ì€n£·5\Ä8,¸\Ù\îx\èzç©‡išÂ©Åº!\Î\0É¬ö2`ª\×Uwa\n«$õ¬\Ãa)1ƒ\\“¦Í”\Îza!ˆF+\"iV%\ë]D\Ö_!c‘\éX7\Zs¼\×4¡ck™ü\ÎJŸj­3)U(\ßZ\Þû3\ìGÒ¨¾–«\Æ\â­f\Ð\Õ\Ì\ä\ÚA\É\Í=ö¨\æ¤O^A¨¤‡\ä>Õ”‘i‘HÁ\íéŠ®ñ‚Ú*\È\ÓÒšŠH&±e˜g&\\:|¹«Î°¥\èd\àcZF\Éù«&\ê\'ið§\è})¬ uö§Ix‚ö&£ð¨ðjr³9\àv©s9U)ŽÂ v\íM*\ÌjŒ\×q\Äûi¡6K\ÊK\æ\ÅkGp¤òs²\\9P6²\ç8È©m²\Ä\r‚q»Òs0\00<b‡`3Ú¥‚\Ø7ñLh›~6\æ\î8¸\'ŠÙ·§½Y0˜\ëƒM– ˜ \Ò\"\Ê>^\æªGp\É)V\ÉP)r.\ä\ÓÔ¢F]q¿<\Õ\"[4BÀQù\ä\Õgu{@dùs\Å>;\ÛtŠ0y u4É¹^\æBA	’ |Æ¢ÚŽ<Á\È´\Ì1¤fH†ð\êvŠŽ\Êd\n\"€ VYShÄ°{\nªšd‰(\ÜylôqV\çŠ`\Ñ\Æ\Õ\è*Ñ•W%\Î\ÚL\ä…^! |ÇŸ¥IHT0óžj“\\3)P¼sÒ£D•6®BþB¤³Z+\ì78=kU%€d9®_h\Ê\Ò*gÖ´\ì\×\È@s¸w\Çj–\"\Í\æbÃ¯8ªËX\ç½_Hòª@\È\"¢1aˆ¯\á&dn›sš¿|\Õ7ˆ«\à¯SO\ØÊ¼\íšM”Y“zü\ê~\í[WYc÷]C<C<TVñ´.\ß1 \Ô2\ÎWPÓ O[\Ým¤€®ÿ\0\\™¯2øµp\é/3æ½“\ÄJÖ‚\æy\Ö\ÄH ÷¨5\â\ßn\Ú\ãG°™FIC]8I^´™Ë‰ŠT\ä\ÏRõ\Í?´\Ü`\çµ;8<Žõôc\È\0g¥9x#¨\ã“\Ô÷¤\ç>•W‡ŒµoK\Î\Õ,£9ù®b\røš¦wd\ç’\èk ð…°¹ñ.š¸	\Õ\Ïü°¯+S“\ì™t\×4\Ò\îÏ¬­ö¤j»q´ceˆ=ª8T\í\äÕ«Ž\æ¾U\Ôw=\è\ÒMZ$›r‘´ƒ_\ê\Öÿ\0c\Ô\î\íÀ\â)\ÝG=³_i(û»u¯ŽüP7xƒR\È¾\Òý¯W.›“’ò<\ìm5aS†hÀÁÀ\ïŠ:õ\Î+\×8,4dƒ’rM(\çŠ\\ô\íJ˜„>ñ\Ívº‹ªxSIˆcs\å\àMqº\Ý\\/ö&ƒ\æ\Ù8?1$\n—¸\Ê\Ü1ƒN\'AQŒbœ@nÞ•¢\ã\É\ë\Ûô4\ÓKƒŒóÖŒs\Å\0G\Ðõ\ê_\nl\ëZ¸Á+AGÕyq$0<c=M}ð‚3‘s&e˜ôñ\\\êžÎ„Ÿ}œ49\ê\Äö¡F:\Zil“Ö1#\é§5óŽnç´ ¬y_\Å%V\Ñcf\í/=ûzW\Î$€\Õô\×Ä¨Œ¾™ñ“)Ç·\"¾hq\È\ã\î`%z?3\É\ÅF\Õ_¡\\\ç4ªGR1“AÇ­\0|\ÄW ŽP\àžzC“NùÒ›†\ç\'\Ó\é_F|\'‚)|=’§+4‹Ÿ^k\ç>jú\áSM…6\Õk—d®sµš:0\Êõ\ì‘[&3žzTwª© \Å$;&\ìŽ}º\Ófv œz×…\Îzœ–G\Í]rEc\Ðc\è:þY5\ç¿.q‘^›ñ>‹ZIdÈ€Â¼\Ëv¾‡\n\ïB‡“[J’õÆ˜Ù§Û†\r5†\nƒŠ\ë1\ï\éJF)	ÊšA\Î7P\0=1Oþ\éM\ÆM;\'m\0 Žƒ=i8\ä{q@`;óH¸õ<P\Ó8\é\é^\ßð\ëOQ¦\ïa‚\ä±\í^ 2\Üõôß…m\ã¶\Òm#‘€k“\íH$\Ù\ÏüC…›Jˆ¢\Â^\â¼°Ä€\ßLñ\Å}!\ãˆ\Òmq´\îR¤b¾n“;\É\àÑ‡w‹\nŠ\Ìh#4ƒ žõ!ù‡>§Ã‚Aµu‘‘óq\éN\ãw\â9§\ä\r\Î\0’µ,Cø{`\Ó^½\ÉÃ…ôdoª‰´žØ¯>ðˆtý-¨\Þ\Øv`{ž\Õ\èÏµPö®*’¼„‘\Êøž\å¢\Ñg!;W\Ë\×\r™\\g¹¯¨<N\å4k¡´#šùvõ¬qŒ±â·£³]°;\Ô]ñù\Ô\ÜdŠŒc¦3[€¼{×¢ø0\×.9lŒ\Zó£ÐÚ½+À(11\ÇW_~qX\ÕøY,÷ý>\å\n˜\Ï\Îø›Fµ\×\ì\Þ,‹þª\\r©\ìn|¼/E=}@­w“rž1‘\ÇZ\àe\ÆG\ÌðÏªxKPtpT ÃŒp\Õ\ìú·k«Ã”`sÁù\Å\'‰<?o­[•8Y€;\Z¼i?µ¼%©Ò½s÷X\n†®tBGÐ³C(ºq–±¤’òÊ’øPXwú\Ó|=\ã7S…RFò¥ÀStÉ®\Í!µ›•pAô\Ç\áY5cd\îs‘jH»Yv¾~\íj,¨\Ç\æ\Ç®¶N0S¸?CR¾™\0ƒ´ûJEX\çÌ±K¼#Ž§¥f\\ a’½œóšÚ—KD}Á¸\ÏAR\Åh‘’zæ‹…Ž>[RO!€\à\ëP­‹9?7Jô7Xx*8ƒP¼0\Ä~\\t\Í>b\\N4Û­¨Áx\' «©¤K³\",§a]Hxc;\Ôô§µ\ìŽy2)ó0\å9D\Ó\Ý\ÉY\È\ç¥JmZ\ß\æ\Úp1†ö«÷\Z¥´R´žgÇ­WŸ\\±Ù”™\\“´®Æ‘	\á‚3ž\æ£kFm«£9\éU\Û]Ó°\ÛµBþ#±…z—\'Ž£½eXÓv\íV\ã9\Îy\ïK”wÛ¸Š\çÿ\0\á(¶\ÊÈ¡ˆ\îs\Ô\Õ)¼Wo†\Â.CgÞ¼j[ŽH ‘±»rv\äz\n\áŒgQ\Zò1’@ª“xª\é\0Â©\äg±\ëMô\n²³\ï\áy\Ñg;n•\ä\×%\Õv˜\0ƒ§~kø£[R\Ç\íªO­D§¹M^Y\ànÏ¯<UC>cl2œl×Šo\ê²ôðFx&†¿\Õ60\È7u\èsW\Èh©\Ü÷?´¢p\Ò\ÄI\ëƒÓ±¤7\Ö\àa¥‹§7¯jðC&¢s½\äõüñH–÷l\Å|\Ö$Žy\Ïz\nTOv—T\Ó_\å3\ÄF1\ÕDkš\"7\Íy\âý{W®Ÿ4¥·\È~QÙ°XÔ¿\Ù\nüo*c¶\Ò\å-P=„øƒFŒ†k¥9Œ\Õ[Ÿh\\‡ŸpªŒõ¯,þÍ<†Á¨Æ™\Z¯\Ç=pE5‚G¡ÿ\0\Â[ ‚T3{dqM·ñV\ÂHI\ß\Ç|g§Jó\ãgüÀg±\Ûñb\ÏOµ¸\Þ°qÓ¡\çƒUÈŒ¥J\Çz\Þ5Ó”°\ÛoSšÌ›\ÆX,dñ’‚=«*	\Åp¬|\ç\á°¥‚ óIù°½{úÔ´‘“I?Œ€1\é\Óõôª\â\ë…v\ÊU\Æ;\äU¡\á;d—yf>¢­\Â+§\Ê3\ÎB\è:õ\áE\Ò2‘f?\Ís\è£w¦*çˆ®K£/ô=W­ô¤\Ú\ÊÍƒ\Üô\Ú:ý+]t[\Ú±“\ÍDjy\Ä\Þ-\Ô‰\Â)+·žµAüS©\ä&TðÜŸ\é^‡\'‡tñ(g\Ã\å\ê\ÇÖ˜t;\0¤<s\Î{š.€ó÷ñ&®À+F3*ý–£«_NŸ½`¾f±œ“\Üÿ\01]L:5¥»oTÊ·b;žG>\Õv\Ò†R¡:»œcp¤g&Cc£\É&D²H¦ry­jŸDÿ\0y*³\à±9#§5­§!ó€z`‘\ßmoŠƒ\0H\É\'¦}=jZ3Sf—’¤\î\'<÷¤p‘¨ùzÆ§\ïœRlñ\é\ÇÒ½\Î+\Ê\î\çµ=J*FO½Zò\Ð/\çPm°\Î*H\ÆþNqAÀS¶—q\Ýò\ZŽC\Z“\Î\'Þ³l´ˆJn<1\ë\×Û½1\Ê\Å\Îxþt¦N¤7ÒªLt9\0w®iw›ýEs\Z¶±oQ2\ç¸\Î\ãÒ­%\ì6\ï¶b¡\É\éŽ\ry\ÑF}»GcÐ‘Àõ¨gU*w\Ô}\Ì\ï¨L\ÙrX\å†olš’#&2O#€:ñ\ëV­\í£¹X­l[(\\žNp?—\ãš\\\Ö;c\æ\Ú{r\ä`±*	÷>õZKKu•w>fG\ï\0Õ»r»eU0™Q\Ï\îy4–‘ I%¬{œ\í_A\éT¤Kb¬·q«‚py÷¯^THö”^\Ù&¼\×N´[»\å\ÚI\0\ç\Íz@I%‘Q~T\Ç_\Ó“f\Ð\åüG\ÝE„\Ü\àžŸÁ\é³\Ø\\ù\ß|w\0g\Í{—“\Z\'–§\çŠ\æoü7gs–+†ÛŒõ\'·¥tD$\ÓL«k¬\ØZ\0\ÆA2y\íXzÏ‹v1Á»-Çš\0\ÅH\Þ¸\Ã(pG©<\àzšqðl‹\ËH¿?\Þ\Ï5:J©Z\ÇÄ‰ol±\Ëñ€NyÀ\É=Mb^5\î»1Às\åÊŽƒÞ»+_Z\ÃÌ˜Fx\ãÞ·­\ì\Äj UdT\è)T+h\ÐC§X‘q\Ý\ÛÔš\Û7û…<\ç\ÓÞ³š~‡¿JœC1À\ØÜŽô\\\æIsr\îj‚O9ù\'ù\Õø¡*û¤R\Ô\çD/\ÈŠf,ó	¥ò²rs€3ü\ëˆs0=3\Ó\Ø×¨øbe6IE\ã}\ë\ÎSžT÷=\ÇJ\ê¦ô.€ 9l9\Í \è\ä\Âò*Â¹Q\ÑO<P\ÌË»,23ƒž¾õ¥\Í\Ò+\äºdrOSøÔ……ÂœžsJ™\'‘ŒŽ\0ö\çŸ÷W†\'¿®ZD&	&“Ž\Ýþ”’\ÛImp+¢\Ð\Ö¶G¿i;ù\rÚ›\â‰¯\ÎÁÀýMM\Çc›X\äV\ê:\äœ\ã\Ë\0H¬©\ÆÓƒPÀ“´4\î+Z\ç?:yV\Éä‘‘œ·*\×+õ5<Q®0NsšM…‹šn•sª\Ê#9I©õ›°¸òb\è€nlŽX\×\á-<\Ã\Î\Ã\ær2+“ñd{5G|ó‘Y*—†\ãdq\è¬%`Ó€m\Ùœúô¤Pp«ŒsÓ¡¦¼¼€0\Ã\ÏL\Ö\èÌ€g<\Îz{T\ØÀ±LB7Ÿ—¶jLô*H\éC.&­„;\æ^@\Ãs“Þ¾ŽÒ¦Ÿ\0\èvµóžŒK^F…Ke½9¯¥­£\"\Þ\×\ä\å\ã7GvfU±¡’Wu\áÍŽk}. \î\Ø8É§\ÙDŒ6•«\ÏcnNvsÜŠóŽ¢º\ÍÈ©\Zx÷cxQô”e!§Ò©\Ù~y[=R3f¡hÛ£Œ}i\ê\êÁ‘ý…(l¬ÇŽE;û6\è+ŸÆ­3[>†£n\Åbÿ\0ej9ùnOzž¦$\Û\çnH\Ì\Ö.ð)<\×8m5@ûƒ..55B\ÎU€\Å06ü\î\0¨™š\ÆF½c¼FpN)µ4\'¦=3@´7¨~uP\ÎXóY\çTÀÍ²Šh¾¿L\îµÀ\ìsL46\Øgšcž	ŽuÉ‡\ÕÔ¦\Ï1žüc¥;Š\Æ\ÌL\î¤Š©2\Ýº¿AÀªI©°^PóR@\Å0±\r\Äú˜ˆ\í`\ÖYU\ÆKƒ‘Þ¶dÔ 2\ãM]J\Ñ\Êõ§qVÖ—ß¼~7¦¶%„{T¿sRý²Ôž‡§¥!–	8§q4Q7e\Ï\ß\Î9\Í:;–fÁ8\È\ëJ¶ö€’Ò‹{|‡\Ýô\çŠb-!•Kg\Ðb™3ž)»¢\ß÷€>õðy¬	—\0ú\Z¤\Éd\Â@\ÃjœóÉ«0ÇžœU Šòª\à0*F·N©.×Š¸±ö\Ò[\Äp\ëÖ¶™U\Ñ\\°\Î\0Ç¥q°Y\ïcº^ù<\âº5lP\Ù\Ú+¦2”Qª±F@\ÅhÛ  f²!%ºžÕ©@\×	\Ê&\Ô\"–8«{\Ù\Ûsu<“YÑ¶>\àUØœm\ç\×	¸—#À õ«`‡eª;ºU””‚k¦,\ÆQ.©,@\è{Š\Ñb¯#Â¢(A\ïŠÈ‰²\Ãq­Ÿ)]f2E”róLhƒ¡æ©‡\ëW\Ñü§ŽG\é[DÍ¡¶X§\nÐ†Š\"q÷›ùVZjfŸ1lA÷OREk½ôl#òúyc¯©\ä\ÖÈ›Eþ\\’ ùP¢’{\ï=\å\Í1w¤ž¬i\rû}• ‘\\û•c\é\Í2\Ý\Â\Ê¸ëž•¢d´vžðÞ¥¯\\ùV\Ñc2H\ç\n‹þ>\Õ\é\ZÕ†“\á­i\èþmüÎ†Iù€Sž=¼¿NÕ®	º÷;Nt\Zf™©k\×\î\Ï TQ™g•¾UÔš‰Å¹)Jv„u±Kµµ=Ãž›R°s6Å“&/SŽ™ö©¿\á¼œ¿z±‚¿(Qœ·¿µe&¯&˜¥¾¢\ïa¶²ûV\î‡\â‰\ç¼X¥´8\Ã3òF­sTú\Ú\æ”gn•¢ \ítr:ƒ¼C§	^5À‹»\ÍS\Ç\Ýk‹k»¸w¤Á\ïÓµ}{\âm\Í7‘\Èý<¸\Î\æ\æ³!¸ðô	j`·W\åW@3\ëÏ­M,eeÎ“~iX%J/fx=·Œo\ì9v~P=\ë\Ð\"ø§E¸°‰·†¦qù\×O¨xDx\Ö\Ã\ÍR1ó\îwük\Îu\Í2\áfxÝ‘cb	#Ž}\rl¥†\Å\ê\ãv»\è\Ì\íR™½qñV\ç\ÌQ¬¾›‹¬\ío\Ç\â²û)\æL›²W•›kð\ï^¸E¹[t\0¦P3…\'\Ó´bð¦­*Ihcm™c\Ã`\ç¶)Ó†\rMrò^>d\ÍÔ¶·8¬WVÙ‘ƒƒ÷¾•n?\rXOlˆUƒ0$¹Mvš„\î\í”N3•/\äƒ\ÈQü@W3-•\Ìhûw`)\Ï<W¡	Â¢¼Zh\çwF[\è6Q”/\ß\áXŸCÇµb^\Ù=“4.{\äþ=ë¥š	‚ƒ“€8ù»\æªKes1u|n\ì1õ«q@¤\ÎJh]-Ô\ÙV>\àW)s;«ž\Î\ë^&˜ñ\ÄC2F~†²nô˜$S&1±€#¡Á\î+žt›7Dr«!\Úy-\ÅVm¡™À\Î0k¡J@Yö²±\ØÃ¡\æ…\Ò‘—F\Ë°À\Î1Xºrfªh\ã\ÍHf8\ä\ä\Z\Æ6Š¬ÁXô\ë\í]|ö7(In‡ ö\ïYR\ØK/¦?\n\â©M0‘\ÊO§\ãc\î­`\Íj«#€\Ü\×qn#—‡;sžµ“w`2:Žù\ÆEpÕ¦uBGÈ˜\'*£Ã»“É­³j·“ŒŽõ\Ç$t#[Da“\Ðj,F`öÒ´;0j„©¸\Çz\ÂE¤sN\á¹8¦­ƒ‚MtF(\ëU+h‘\Ê]Û²1À\àYmi8e|	\Íw›¾ð¨ü”\ãÇµd\Ù\\·9³m#\0=\ê\ì9R\Ì8\æµ\Ú%<b´ÓŠ‹‡!\r²<\é¸|•+\èý©\'À$’O•j\ã®jPI¦¦K¦d\Ýé°²&z{Ô°À±Ûˆöð+HŒŽy¦mù‰öe<\È\n8ôõ¬»««…‘v)Êš\Üò°zžiž@äž¦Ža¸3ž7—q‡f\\)\í\éF\ëþRA\æ¶\æ‘‚\Ê\Z§`\æEÁ#½;’\â\Ì6·Y\æ‹{Vvc\"ŸA[2c8\ÉU´\Ý$ Ž4É°·\r \0g~ZÏ‹JŸqó·\àóË¹Œ•bA\Ç\Ó\æC*\Þ	¡\nŠpŠ~¹™™dlõ~Mi\Éâ³§‰‹œ7ó¥\Î†«¬v¡²\å‡\Î\È Ô–ªÇ–\r“\ÔUø\Æ\ÓÓ­O1jE•’Z\ÆVNrrsWv\Æc+½X–%|†¦¤+mU\ã4¹‡\Êp·\Út\Ð^4\Ò+\ÜCƒ„^\ÕkÃ±\êu#H…-\Ø\r¨k°d\ãG#­,h\àðW3FP\0\ÅMœ‘PÄ¸\ÅL\0Ö¡›!\ÅC\äSq†\ìiy\ë“L`NI5´†\ä|SwI\Í0\ä\Ô3Dˆ\å?)r1Šùó\â‚,:e¼\çe\ËÏ¡¯‘Ž+\Â~+Ž\àY\\m\Åt\àÿ\0\Þ!\êsbÿ\0ƒ#ÂŽ3õ ñ×Š3Ÿ©\ëA\ä`÷9¯£[#\Ä©\\\çŽ\ÔÝ¬@\Ïpi\ØâƒœžiN3^ƒð\Æ\ÜM\âü\r»6\×®\0ã¸¯SøQ:­\ì›~\ì\n¹úš\ãÆ»a\ç\èt\á\ëC\ÔúF\Þ/0Mu*\ÛOaš[iŠ \éŠt­¹\Ëf¾UŸD‘FCž+\ä_¡!\ÔF8ó\Ûõ\Ã6H&¾OñœB?j`žÅ‡\ã^®Výù/#\Ì\ÌW»S–<Ÿj:Ž¦Ú•I9\ÆsÖ½\Ó\Ç`:sA<(<Žô™\ãƒÒ˜\">œ\â·5wm\â<ùp 5™e\\\Þ[\Â:\É2Ž¸\Íj\ëê©©L«Œ#\08ö¥\Ôm8÷ë“ŸÆžq\×<b˜\0\Ç~ô\âs\ÉãŠ¤ /~	\æ‚0r;\ÒŸN(8\ê\Øõ¡°\r\Ùã¯¥}ð¹ð\Üd\ç\æ•\Í|\å\Ï<\à\×\Ô_”/‡¬ˆ˜\çñ¯+3¸K¼Žüý\ï¢=ƒÞ—Ê‘€ ðz\æŽ\0þ•0( ŒWÏ£\Ø\èpþ+nt]F9p\0„ŸNGJù1d¯9W\Ô\Þ5½û>xxñ·Ö¾\\•Ã»6\0\É5\î\å\ß\Ã~§“Ž·:ô\"ÀQŠjòx=\è\àc\'9¥\Æ\Ð@Á\ëÒ½$px\îq@\'<úÑƒ‚r8¥ž)°Œšú#\á¾\Æð\ä\î+\ç~W\Ð_\íœ\í3?\èk\Ï\Ì?óG^ø§ªÂ¸L`\ÒÊŒAÁ?N\Õ$`\ã‘J\àQ\è3\Ô\nùû\êzö\Ðð\ïŠvL¢\Ò\äƒòŸls^+Ÿ_cŠú\Ç\Ö-}á»…s\Ä\ÛÁ\î+\æ,8\ë_A—Ïš‚]#U~c@&†\äŒö§`)¦rMz\' ¹\ë\Å9¦†Á\Å)%±ž”\0”£“\È\ïÒ“p\ÛÒŽ˜ \0ãŽ‚q\ÔSsÖœ®)0/ip­Ö¥i	\èó+\êý~ÄŽx\n¸Ï¿C_ \ÈC)Á ûŠöh|e%Ç…\Î\Ù\nÎ¤G/?­aRV*.ÌŸ\Çúú>l\á`Ts\Æ}«\Å\ßI\ç5f\î\â[—y$o›$\Õ\"\Ã>¹\âª\äV	>b@\Þ\áI\æšq@\ä\Ç4„.kbEÛ´\äúWA\á‹Xnõ¨\\aøW:O?Ë½tž\Ûý½g¸u^\àVsÙ’Ï©ô\È\äg>\Õv|l\ÛYºt’\ÑpOQWn²³¿\ç½\ËH\ä|ZTh“Œl\ÇP+\æ)dvw\Î:ó\é_Jø\Îi\"Ñœºœ\0\ï_5OÌ¬8\'\èkªŽÀW\'=ú\Óy \éO$\Îh\Ï\Ïð>•¸†\×=…z‡w,L7cs\äc§<W™rsÉ¯Sð*¡¶S\×2\ê1YTØ‰¦°µ¹ Ž\0\Í]Š\à\Çßƒœ\ä\àV²\Û-Å¨F\Âðp{ó\\Ä¬l¦û<¬7u\à\×M–*\Ø=y‡«h\Ö:´%.\"†0\Ý\Ær*üs®0Áüj\Æw #¦85\Ú,ñ-SÁú…ƒ3\Ûsn0N\á\éT­u\ÝgNL³(\0a<{ó^\ã³c\ÑsÒ™5…¥\Òñ©lc\î‚zö¬Ù¼dy…¿\Ä=F žh§\å,\á[Q|@¼»!#‘¾Q\ÜqZ—ž\Ó\îÚ€;v¬\È|#ghùòûú\çð56+š¶ú§‰.¤(\ÞZƒŒ\Ð\Z\Þ\Ú\ê w—rñ»Œq\ëR\évÀ\Ì\0çœŠ\í\ÄC\Ë\nGb‹\Î\Î.¥/’\äñ\Í[gVöœu5SZ\Ò/b›\í:~?};q\\®¥uªZ¨–\â/N‡Žiò˜³¬-\ÙÈ‹\'\å\Ç5\Íý“W”–T“Ð\×\Ø\èw¦ò\"Yv\äš\è61Ž:Ô·cEvysiZ\Ô\îF\Üm\ïžE,~\Z\Ôv«\ÆGA\ÉÚ½LD¸\é¥9\è?Q\ÌU:_\Ï1\ß9\'?(ð‹•¦=; ×£\å@\çð¦1÷—µ.`85ð|N 3•\n{Ô«\àû9\È_^µÙ‰pNzc\Ñ\å@h\æ™ð•†pŒrJ˜xgM\ßqÐ“ÒºQ€>ðÀ\çÞ‚Ãƒ\×-Ò… ±\Ë\É\á\í;É‘<¡‚ (ôÇ¥pW>¹Š\å\Äv€!<ôü\ë\×H\Ù<ÿ\0*†^¾LûŸ_jµ6‹‰\äŸ\Ù76ÿ\03@\Ë\Ç<;VAEq…lŒŸ\Ã+\Ü6D\Ø\È\'\0žO\Ék¾óž\×hqœŒp}ø«UªrG\0»–3ÜŒ\îÁ\ïNU\à\ÈÁ­\ÈŽA\È\Ç4 t\ã®{uúÖªGBD¡ðXœ\ä€•8l\à\ç\'8÷ªJ\Û\ÉÀ\ägŸaOWONƒ<äš¡“\à;`ðd1š`\Ü\Äð¦–\ã>´\É\'còª’ý‡©•È”¬F\ÊU°0‘þ©=\Ì1•l\ìù\ç<qZ\Ð\èZ…\â1-\å“\È\\zöõ\È\ê6wvW\r\á÷õ\ç>\àÕ§sŽ¥C«´\Ö|‡YK»c\Ü\Ø\ã¿Ö½#K\× ¼L\ÄÀ88u8ùOZù\è\î@pNO½]²¾¸±ºYcb<žsD\é\Ý®w>ˆ’8\Ö<¡\0÷ö\ã5·CúžVv‹ª-ýšÉ™³¸tö\"¯Ê¸`Pü¹Ï·Z\åwL›–\Ã\åI\Éqœ8\æ¬F\à\0$+\Óž\0fwgõ\ìE\"\Ë$dgœÐ˜™§.N\ì\àc\0œ÷=¾‚³\ÊFONýù\ëF9–\äeOÍŸº=½\rS¸‹‘\"’\\zd6T%vžB\ëT¦ˆù¨\Ê\ßt\0\ÇûÂ¦i‚\ÆN6‚qž¿Ò˜2\'p\Ï#Ò„c#f\ÒyÁ}Àc\é\Ð\ÖðlŒ\ç=”“ù\Z\ç\à!œ¡\ç¾{`tüy­HQö\Æ3Ta}N°7\ÍH\ÒN§OJ\Îß½þ_ºx\É5+J¿1\Æ{W_0r|\å\È%s‘\Ô\Õiüb¡k€\Ä\ã\"³ÀAüs\Æ95A\Êhy\Ûx?þ¡\éY\Ò\Ü,¹*}\rT’w‘°2\nŒ\È@\é\Ç\Þ\"¥\"\Ã\Ì\ÌÁW\0õ>Ô¿i‰x$gúš¦²*ù#\'\ïÏ·ó5/š\ägp*: ®V\Ö\îm…¬»Û’>¾\Þ\Õ\ÄZ\ÛL\Ï\æm>£·\ã]¥Ý¬s\r\ÑJµI¡„€A\à\0GJ–\Î\ÚP²3bˆƒŒ c\ßð5z/—\0q\Ó9\éPº]\à\ã‚F;Uk›¤Dn{|¾„Š‹(­5\ÝÌ·\Þ\"0\Í\Ë\Ù\à\äö«rÀQ>F<•œD¢W*»²y<ô\ê\ã†!˜¼\ËUq4]ðÍ–\çbp\0À\0\×f\äž+Ÿ\ÑUcµ\ÈÖ¶1\äsJ\çE©\"£!9>ÿ\0©>RÞ¦‡cËœ\nª.œ’ \'#>R\ÖYwŽA\ã\éRÀ’LwÂœ\æ¨\Îw\ç\é\ê=jCxcù•±×\ä*ŠQ4\Þ2\é·`o#\Ó\Ø\Ò\áaLƒŽk%o$\0œß¿5/\Úfyz–4s\r¢\ÞÃû@9\íÔŠR\àzT’:mù›\ÛTä‘›\0þ4s\Ê<ËŒò†â¢šX•F\Þ~•»H>sð1Pc	…\0ž€g½\â\ä8\ï4†\ì0\ä=x¯:,G\Ë\Ûñ\í^‡â¤º{]\ïò‚p\\WŸ\r@$\äœ\è+ª”®ŠŒlG#Á?þªkò\ÊXö\È8\ëR\0\ÝB\à7OÊšv\äð;÷­R>€\çžØ¦\í\È!H4\å\Ü*òpx4\Äù#(\îsÞ‚\Ëö\ì±Íœzf£º•¥™\Ï1<‘‘Q\Ú\Ù\Élœ}=)[v2\Üô¤÷X``2y\Í0\Ä69\Î;\à{R.Fœ\àei]¶\çœS\ZHdySøõ«v\êÂ¶1‘œU` ƒ \00jý‘‰%BÜ€Ã§J\ÎOA¤{N—Ecùs\Íy¯Œþ]O\r\Ô\Æzõ«	#k80yÛ‚yGa“\í‰1\áv\×%\'û\Â\êlp »9Q‚1‘Žsšt±†\ÉÁ\ÏcÒ68€\É9$\ãµG+—\'o¸qõõ\Íz+dsŽUùzP$]\Ø¿ÿ\0Z•\\£r=³Lƒ`v=i7¡h\ë|5l\ï©[ar‹\Ó\Ôr+\è\á˜ö)\ÏWx\0n\ÕÊŸ•7s\Ü\nõù$A^6.w»ôU¢H.š…©ø\î-)\Â2=x4º\ÓÁ¿e¯\Öuš\íË¸c»×­gBŸ´aR§!\î|J´`\ìÑ\0\Í]4@	w)Œó\×\æ¾_’\ìŽ\åj5›®ÑŒõÚ°‘9\åˆgÔ¿ð±´\"q½±\Ó;x5\"xÿ\0@bC]+ØŠùS\í\\|\ÇvI\ÅC%\É\Î9\ç\ÍW\Õ\"fñû\×\Å:M\Ú\æ9\0j\Ô:µ´“\à’8Ï­x‚¦o*]ò0Olu¯L]B@ 8\ÇqÞ²•V/nzº¥”+“(÷ þ\Ñ\Ó\Û#Ï‹\'Õ…y\Õ\Ô#Q’(wŸžN0y­S\à\Ý7`RŒI\Æ\æ\è}z\Ô:i\íŽ\Ô\Þ\Ùl$M1œ\î¦‹yG\Ë\"¡®&\ã\Â\Zr¡ K\Êw\ZñVÿ\0S°¾x-\æ—\årG ª=‰x•©ôð•qž8 ˜ñ“Šù)üE\âF$žd²0)¿ð•kŒ¥~\Ö\ã<OÖ¿T›\êŠX˜vgÖ¤\ÆGQH\"ˆƒ+\åK\ë1iq\Èz?\ZkË’/d9\ë\íO\êu;¢¾³3\é£o	q*ŒY[Ÿ\áóKx\Û_, \ÝÈ«“3W\àñþ¹\n\í\0Œ\ä\åsC\ÂT¬\Ó>„m2Õ¹e=E/öm¢’BŠðTø‘®r\ZT\ã¶ÁVG\Ä\íP8\å\ã•?V«\Ø=µ>\ç¹gÛ¯}hþÎƒ\Ó\×Ò¼Y>*^œ…	5e>)J·\r“GÕªÿ\0(ý­?\æ=y´\Û~œ\Ô-§\'\01Ç½yŠüR„.M¾\0\ä\ÔqüSLüö¿€4ý…O\å´§üÇ§!	Ý“Ÿ\\æ•´„p2\ç>µÀ\'\Å-8¨-	\ØÕ±ñ3I$|R\éTþF>xwGgý”¤‡&‡²}ÁCu\îzWÿ\0H\Èe\'€:PŸtye\ÆöP¤’iªsþVð\îŽ\é4\ÙsÄ„Sà²¹W HÝ¹&¹ƒñAN|\æúcœ\Ô\Ñø\×D—­\Æ\Ü\àZ\Æ2]-\ÅõGh¶7\Ì\á„çŠÒŠ\Ê\ë¼\ìI\0õ\àW?o\ã\r‚>Ð½9­<]¢¾\ÒPbº`¥Ù\ìoý†\é•v\Î\ÃÞœ–z‚¶E\É>•HxŸIÚ¸»¯õ5ji\îø1ŸÆº¡Ìº3)$[ú3zg¥H#\ÕNpù÷§oi~fÏ´Åž˜\ÍLúµŽ\'‹¨\ï]00’$µƒVß——…¯zÒ…u}¤\ÏZ[MF\ÊP\Å\'\Î±®‰o\ì\Ð}}ù®\ÈòE0/\É,Ê«\È\ÇRjD\ZÁ>irFzqS‹\ëfÀ”ƒÖµ\Òò!\ÕeÀ\àó[Å˜´sw[…v¡EH“\êË’\êa…®¡V&Ù™q)\ë\Ï\ÌjPb\ë€\Û\ãž@­S!£\ZŠF *I\ä\âˆ\î¯\Ù\Ô`t\ê}Mk\Ït³œ“ª«ùú\éÐ„\Ü9R{\Z\Ñ¶[µ\Ôn`O’1¸\ã\è \×_¦Å«j\à[A®\ìX”c9\à)¾°]CPµµ†-.\0=	=Ï°¯¦ô=\ÏC…ü¡ºiq\çKŽ[¾•–\'¨Eiy=‘t\à\æ÷\Ðó{k\ÚÈ¯FN\Ã\Íµ-¯|Fc}\ï7V|d{×°Oq\r´4\ÌrM6\Ò\æ;¸T#9\0\çÓŠó7k\é\ëc©R\å6ÿ\05O7t÷l\à°V%ºòo\ê¾°Ó¬å»´óÂ™\ØNþI\ÆEz\ädV[¯Ì›{t+\Ù\ÆÇ‡Ç¬kZDŒ¢BŠËŒ:\æ¯Xø’mNú½P°†›H\ç\èzþ…·j 7•:g\Ë|qôj\áWÀZ©pd¸x9!‹d“]\Ð\ÄaªE¹r\ÂF§4ô\ÕÆ­¯iúU§\ÚÄ¤Ÿ‘P‚Z¸\'ñ¼ú¥\Ã%²X¿\É¹ö­[o\ÍA-\Ê<jFPdt\íZ\çÂD<\Ë`‘\ÈA\Ìg%9¬\éKI«¾wÝ“R5¤¶±\É\É¯¨-Ä¡Ù¿vNÿ\0º%Q€@öô¢\×\Ã:\ÅôeÀ‚(\Ù©\ç9‚ö®ò\Ò\Âòf˜0\0€ V6¯{©­“µ¥\ÒD3µ0s\ë[¬]Y>J\\‹mL½’Ž²¹\r§\ìb‚E½›\Ï,T†Uò\Â\ã\ëš\â<G{c§\Êö–Íº(·6W\ão÷SÞ«\Ço®\Ì\Æ\ê\îy[<\îùA\ès\éTM„W­\å#I,\ç\ål³\È}Ië²„*)óT¬\ç\ä¶DM¦¬£c˜šøO¡—…ý	÷ªS\\\"•w&pF+²ºðŒ6\Ã*]\Ç+:Ê€ü‡\Ð\×*ö°¬gƒ»=¦kµN3WFvhd–¶“ \ÉÙ»9a\Æ`\Çö‹GdU%”A\à¯¥t.b‘\ä9\Æp=\ë5v\Å8<\ì8\êi4Zl\ç.®šsþ«kn\ÉÀ\ÇoÎ³\Ù\âš&q\Ð9 ž‡ ü+´’/µ\ÂUU1Ž}ù¬Ã§\ÂD,¨ci\êkšt\îo	s0Š\á·(\Î:â²\è|\åy#œ\nô›Nó\"‚3×­b\Ïgo»y@6ö\éšóª\Ói°•\Ñ\æ—Ó»±‚	&ªBò¨E%CŠ\ïÍ”3H>A»>3U^\Ú1 %G=\ë†t·gLfpÿ\0i,¿20À\èj„—£\æ9®\Þ\æ\Î,“…Á5–öp²°\Ú3\\u\"tÅœ«^‚>\éÀª¢ó~IŒŠ\ëž\Â\0\\*´–pŒ‚¹&‘\É=\ìg³xP\ê0Œ¬y\ê+¬V\àrƒJ ö–\âB6š\ÂF©øÔ™™±\ã¥KöÌ¦vœÖ”\Ð\ÅU5À© ÀÁ¬\ìe\âN\05:^v+\î+`[\Â@\àcqNÐ‚\Êc@®sü(þ\ÐIò\Ï5¸-\á\ÇAŸ^õ\Ö\Ð\ì89ªŽwûNW_»°\Õ6¹º‘\Æd#\ØWB\Öq	Q\ïU\å\Ó\ãnGr™\æ\ßj\ëOK™b‹\åùl\Õ\ãn\á@`R­«£˜N&oö\Ë$ñ)™\Ôy˜âµ¡¶M‡#©«o`)óÙ˜#SudÁ«nf\\ùMŠ\Ûò\"\à`pi<¨øâ§˜j<š¡p?r\Ø&¢—Q‘	glœš\éü¨û \à\ÔLˆx#4\\|‡4úœè€¤\ë‚j\ÄZ…\ë:‹MnŠQ\åT\Ü\\¦D·ò¬¸H÷\'LÓž\î`Ë±A3Z\Â(y\È\ê*AY\Æ\Ñ\Çj\Æ\Ûn8‹8©\Zöe\nUO?xc¥nˆ¡RivÅ·\îŠw)\Íÿ\0i\Ý+0\Ú8>§x…A\È\êG5¾\É#()¡`…)#j·Às \Õo¿\çŽO¶ks\ã+žx¤C\Z°#5©˜S\Ôxƒ¡ëŽ¢¤ûV¥*]G9®^6óÖš—VËŸ	\ç56as™x5‰‡2mV\à×•üK±6š8~w	\'9¯l¹\×ô¸q\ìý\Ðs^Mñ\â-C@»•3ˆ\Ù\è:k§\nš­û˜b\éHù\Ì`M#¼\äP§À§ðy¯¢‰\â1wŽ8&›Ó¦1Ž´½\Î=qŠE\'œñÁ¦`Ny\ï^\Ãðž›ùH\0E\ã™\0ô&½\Ó\áRcKºr\Ór@=9¼ü\Å\Û/‘Ù‚_¿‰\ì\Ñ>WÒ¦\'±\ïT\ÑþQžµ:œŒ\×\Ì@4B\Ò+\åÿ\0ˆ¶RXx¢\ëpÚ³¢H™=õ\\\rò’sŒ×…ü`´c5\Ú\'@\ê\ä×£–Ï–º]\ÓG><Ô¯Ùž@ažZóŒ\08¦v\àâ¾lxL^wr:i\Æ1\ÇA\Å;€¼ñHp\ÔÆ…†W†x\åŒ\íx\Ü2ŸB*\Õ\Õ\Ë^\Èó?\Þ~[·5DŽüÔƒž´˜ÀpGqžô\æ \ãó¦œŒJp9)’\Äõâ”…\'¸”¤ó•üi1Àòhz.FO¶kê¯‡ñ<^\Óó‚¾VF8œ\×Ê¼žŸAü\ë\ì²\Ú\è6q`V?˜¯\'3»Šó=ý\ãô:.:\Ó\ÕF¹À\ï\ÏJŒÜ¾8_Æ¼#\×<\Ã\â”\Ëý›·Fw\Ü}ñ_;\ä~g\ì\ß\çy®mðgŒ×ŽA\Ç\Ô+\è0\n\Ô#\æx˜\Çz¬C\Ðd:\Ò	 õ\ÏLRŸOnk½ƒW84\à8\Îiy9¥@\ÍøPÆƒœrGoJú\'á…³/‡„ƒ8iœ\ãŽ9¯žúq_I|9žXü31\ç”6qœ×˜\æu\á?ŠzlQ6\ÏÂ£*;ŽEN’;D¤v\Õ=\ìx#¯£\ØZ¢ü~m¼±°<l1Ú¾B\Ôaò.\ç\\‘¶V?Zúögb¤·N\ÜW\Ì~1´6º\å\æSag,\0\é†\ç5\êe“÷§\Î\ÇGH³ \îõ4\ä~<\Ó\Ôe‰8¦Àâ½´\Ï41\Æq\×Ú`p1AfÂŽ9¥$\ç·Zcb™4¼¶\É”\Ñ\ß\'4g±,($pV\ÏOe¦ñGCžô¼Œ\Z\0oA×œÔ‘\Ìñ\ï£\à\ë\Í3\0ž*Qž_™°\íé»±©°\r!·õ\ïQŽpH\ÏAO\Ãd\î?5†	ÁÈ§`\É\Ç ÷\ëÞ‚r”¹Py\çoþµ7\'Ö˜\r\ä\\Ö¦‰\"ÃªY»\0™sYÃÉ®\ÂöMw­[€2Áj‰½/s\é\í.h¤(\ã#ŽŸZÛ–Höƒ¸V>™n°¹\\\çkVt‡+\Ó\Ð\ãµy\ÏsX£Ï¼ynº>\Ò\År\Õó\\£,\ØÁÓ§\á^óñ< \Â\Ù\Î\Z¼¹9$­u\Ñ\ØM\rÝ·1ŠLŒõ »“\Í(P\0­…aN7)¯Yð*‚.\ä·jòP3\Óñ\ì^E6Q\î\ç$ñŽz*Ê¦\ÄHöûAû\àW\ã\ÍÉ¥ù‘K\Ýa]µ±&nû{WñMºbŽyô5\Ç\ÔqG øª+´H.œ$Û¶ƒ\Ó?J\ï­î”¶3_Â¾cœ‘!d\È;³\ÅzW†üV\Û{·Äƒˆ\Ü\ãn;\nr†…\ì{Ë•\Ý\ÓuªÎ®¯•\äŽ1T\àºgù÷…\0Zdù€”\ÏCòŽ\äV\r˜\ï8²“‘\\½Þ§1ºH\nlò8\âº9\ç\Í6H¡›g\nJz¨ÿ\08¨/˜·¤±’u>\ÕÙ§\á\\f‚9úŒ\0®\Ê>TU{\\“Xº\ÔPýÄ±\ä‚\0­³’Fz\Öˆ£y,\ÈR\Ã\æ\ê;b¦F´÷G˜\Û\È\Úu\éøhÙ°Â»›y¼\Å\Ý\È\È\Ï=«…K\Ýñ\è\Ù\'®NŽH²w{\ç­b\Î\Ér£ $\Òç··­A\æGÓ·dŠƒ>`$•ŒÖ†cœ\ã\ëL$dþ})›ðt\Ó&\ã]qŽœeh\Ü\0\0\Ò\ç‘ùâ™œNI\Î	4\ì+b7„òH5;œ\á½\Ï9¥2&\â98#p\ÏZ„¨Ø¸cžA=h°\\~ò™\íž\ãüóLfÀÀ8\Ü~jƒx“†ÿ\0”Ö—,ú\àÿ\0ú\éØ¤\Ë¸Sr=sA?&	P{©\ïU‹\Â\ÞMˆ$1/\Ïq\éAJf©¡\Ç|\ÞdxŽ\\}~µ\Å\ÜZ\Ëh\Å$F\ßC\ÏPk\ÒZ@˜€HÈ¨®aŠe\Úê®¤g~+H¶m\nü§š;…\îôô¨e\ÚXc\Ø\Ç^õ\Ö^hQ|\Å%1a€\Éþ\Z¯‰ïœ–\î\0«k–ñQ9\Ëx\'¹”¢‚0pÀš\éì´¨\í±\Æ]Žr–iCo1£„ÀÒ­a‡9 ©\ç\0ñÖƒ’®!\È\"Bõ\ãŒú\Ö~±¦A©\Ú4nFs•>¤U\ÉX‚p@\ç<ÓšL«\Ø\'#Òšm®gŒ\ê:eÍŒ¤88øÀ\ÇÒ³/\Æy\à×¶:«#,Á$C\È\àrGaš\ÇþÀ\ÒÀó8Ü Ÿ›‚t\É\éŠ\Ó\Úh.aþI\ÍC\ã\æ\\Ž}?­v¾nH\În‘iP\0ªv\Æ«!þ\è\Éc†\è*\ç’m‡9i\âùIVëœƒ\Ï^\ÕHO\Þ\è3´\ã¦)‚vÀ\Ãd\à–)[\Ê|¸$p1ÿ\0×¨°srùeX–a“ü²*ú^E*˜\ä\r\Æ[w®+1¦1ÓŽ˜õ¥Ym\Ïp0~f¨—\"\Û\íD\0\ã#\í\ï\ïUQ]T\ÈPN)\å\Ö$\É%»`úûU	!Ye£\ëòƒúN\Ærf\å¹Er¬\Ç\à\äf¶z\áŠ\î\Ç ô÷¬KG+‚¾:ýkW\ÌX\à\ÞU~P3ž3Šf\'R\æT`xûµCamãž‚¡ò.w‘µ³\Ï’Á9\àð¤P\êÊ˜®€†\ÃõGÒ¡0¦0`c9ô•_È”>T\çkdLv©w\"€G~\Þ\Çô¹\Ä\é’%„†MÄ¨A\Æ3\Éÿ\0úÓž\ÕP\í_œ\à\ä{ö\ÍdÈ·®øge\0ÿ\0c\ì)³Iv¬TwF?Z®b_bó¸\ç\ÔJ¨\áC°Nƒ©þ¢«‰J¦7±\Ý\Æ*•\ÍñŠ.Ê®<>\ç½—ad\ÔcI„{À \äƒS&¡n\Î>m\Ý	\ä×M<’·˜\ìI\Ç9\â–Ë‹l\É9\à‚q\Ð\Òh\ïƒHôG¶K¦A+œœ{ô¬û«(f¹U<Œa‡5Ï¦³x­ò\ä\Ã=*/¦´Ž\Üõ\á½\êlÍ®G‚\Â\Ê;tQò…L\Ð¬KØ„{Š·\áÒ³d\×\ÜFÁ°=s\Ó\Ø\Öj\ê·O>\ç\á3’0ŸOÂ6Ž\æÍžeM§p{ÖšH\ã9À ŸaTm$2Ä„§UñùÖ‡\Ý#v\0?\ËÖ¡\È\æ’\"–Ve‰ñ\é\Í$i\" ;Iü\êanÿ\00\Èš×Ž\âÜ®\ÖN\0\íSs;)€^½}j%·»,FsžÙ­‡¼\0Pš©ö\ÙY˜ñ\È\'\ã¥KcHž\Ú\Ë\nZNœeºT­<+•‰Gó\èj‘k™\ä\0ƒŒ£~\ßN\r\ç\n9\àVnv4PlÎ’qÁg\r\Çj|{†_)~\\u\ì+`\éö€YrrH=\Å(*£jp8\éY:¥ª%Sel2nf\ÏJ\Ö\Ú˜F\Î}j\ã•E+ž½\êŒ\ê%\\dS\íì•Ž7ÅŸ¼\Ó3»bú\ç>µ\å\Ì\Ëõß’k\Õ|IjJ™\Ë·§CŠò¢\Ø 7»\ë\í\í^–\Þ?31N8\ç\'1\Í9Óž\nô\Í;¯\Ý\ä(\àQò:|ž1]¡a¹b\Û\0\É\'Ÿ¥<\î\\¨\çó4\Ì\í\Î? ¡\ÈAŸ^´#‘\ÔdúƒK´\í$¯Q\Ï \Òqœ‚O­\ÛXy<t\ÍMÀgqPFi…v`õ\É\Æi©œñŒ\ç\ÜÓ‹‡¸bÒ˜NG¾:cŠ±\ß\È?(õâ«Ž9\ÇLd\ã*¶3\è§SÖ¢{\r\Õ\á‰\ã“N\ìJg95\Ìøð&6\Æx\ä\â¥ðÄ²ý”³7†z÷\æ®x¢1sb\Ø]ø\É\ÇCšäŽ•>eOXž$\È†vý\Ü\àÔ‰\çvsJ\îª\ÃD$²ƒŒûT\Æþ8¥zc—©3m\Çb[·lšX²]6·5;\àc õÉ«0JÕ¶ô!€\çž\Å\Å\ê{ÿ\0„4ói`®Ëµ\å\0\×X\ßZó\ë­qþ!\ä.WÛ·\èFP\Êzzð±\nJn\ç§	\'c›\×\\‹Yd\äÀ¯žnË‰™Šõb9\Î:\×\Ó1«m:+Æ¼O¡ù7\r,m€\Çk…š‹·s–ºoS\Ï\Êe‰\ÞO\ãJ0ÿ\0Z­5\Ì@ƒ#¨5\\«m\ÉR	\îEz‘š9\Zd2Œ}\rWnJ´\ÂL|Á¾˜ª\Ò\îÁ=ÿ\0˜­“¹›-Ã¨\\\Ú\ç\Ém¤\æºÿ\0\ncTŠ\ÞI¤\Ý@=\ë‚\0\ãœ\nô¯‡›Nµ=óS4¬A\ïZ/†\ì´Éšu\ÞòÁfbF=\0\í]<‹€\r,y)\ëI1!z\×Z‰\Ê\Å{´\Ì&¼M\ÄV\Ú\Õü’•»\"½ª\èŸ\'Žk\å\ï_H5;»u~\ZCž1€;VÔ£­Œ&\îÑ•\â-E¯\ïPþ\æ&À>§¡®o~\Ò1\îri\ë¸&\n€sùŠ\íŒlRc÷–\'‘\ÅLœ\×ª\ÙÜ9©\0\n±9|òiûŸiÉ¨—\ny<\Z›8\\\02M\03/\é\ÔqI™Ô§’zS	<Ž1Š\0fNy\â€sž\ÜT€“\éAt\0\à3\ÅRHW#mÞ½zS3\Ç“S¶3\é\Î0j,ž™ÿ\0\n,‚\âd—S\É\ÅXóH<d\ãÖ…\ÎÓ‘Òž#S\Ï¥d+²Av\ë»À?NjºJPn_˜žô\Ö*\Z„¾Ó…’H¢Ð¸q\È<úÿ\01R‹\É3Á8\Çz\Î/I|\Ø\íÚµŠBl\é`¹–!ò¶7`œ{Ö­¥Ì†P¬\ç¨É®j\Û\ä9>™\'¿©\ê0N	<WM8£IŽ\ç–1û\Å\Ü•\ç¥g¨H›H‘ŽN¹®>	•£bs÷«N\ÞB\ë‘\Û\'ŸZ\íŒb`\ç#¨7S™C+óZ‚;\ë\ÄrGÏ©5N\ß?6©©ðp€.Óž¾¹âµŒ#Ø‡9Wú˜Yd`ªwÔš\í´Ã¬]\Åy6qšóø˜B“\0\Ì\ÌHÚ¾˜¯xð­ªÅ \Ù\îå¤‘œ“\îT¹`¶\å#”c®,\Æ/\ß.\Ôo˜¸\É#?…i\é«\â¢¤y¨\Ôd°\àq]\Ð(9`0®3Q\Õ=A\àÿ\0Õ¢t\ã5¥T•’1«\'us\Þ\ê	i¨\í˜,·:œ0\Æ\ÌÜˆ£V$ŒzñTbmvqik\ê¬w789s÷O\Ðs\\£9K0„°gi	y\ãý+z).#’±±Z&d\ç\å\Ï\Ü\çßŠô#B\'3­&n<>#‰\Û?Ö«JŒ/³~\"½\ÃZ.§\ç)“PóŽ\Æ1\ÂõÁ˜ö\æºU\Å\ÅÞ­h¬7$ñ\ï;°]\ÜW\èG\ê~½··\"\í\ÎÀ$Ùœ¹,1Ž¸Z\Ýa\ác\'ZG«iZ”\Ú-öŸt$FÚ¢Vu`ù!\Ï:t¯ªü=\â;-~\ÄO®õ½Lý\ß¡¯ƒõmzó^¸°´Ž;{t‰Q-¼•	ò?cŽ¸\ÎI<\×o\à\ë=GWºHõ¡´¸“?<C \ÇR\ì;W7/§^—3|²U©¥T¡>éž·ño\ÄÑ«Y\Ãmp]8	\ÈyIÀ9qY¿u\rm\Úó\\•€\çp\'$f“\Å¶³û\è%Kh›l0·\ÌÁPHô¯]\Òô[%:\\úth±\Ã\Ä\ÛNx>ü×QÐ¡„ŒR\æROS²Z­\Þ\Ûhw[>”™Á£\"›×Šù\ã\ÕBô£“ÒŒ\ÓDv`­’‡\r\ìEc\0U+\ë™m iRÝ§\Çð\'\Þ\'¶\\¥\ì)§fKW<\êûUñz\Ü*­¤qG+…O”1É¬ö\ÑüO\âO*2Y¾x·)\é—\Üz{\nõB \Ðz\×\\1nŸÁN¹ƒ žòlË´\Òmm\í’9JÁ@faš°\Úu‹F±›xŠ]£ŒsW\0öª·\ÓOok$E\æ\ÊÈ™\êkÔ©\'~g{÷5\äŠ[»\á\áxnt™¬ ù‘1\äÉž>c\Ñ+…\Ô|\âš\Ù^L	8Vf\ëŸ@:×¸é‹©bÚƒ¡™\Û;¢t­\ë²Ž\"’Qº•º³†„µ\Õ/\Ã?4¸ŽkE@¬.y\Ï…e]øU²•„\ÓD\Ãh1\àü™=³Þ½³[\Õõ\ÄV¶-*€ŒÒ²’§q?(\ÇqŠó}_Åº”\ï5´–\è»eÂºö9À<×£„­Œ\ÄI7\É\ÊrWTé¦£{žA$\ÖSÂ³e	\ÜJppW¨5¨Iö’\íj\ì¾Z±b\Ýûñ^‹yž¥k²*¤Œ\ã;2\Ðp7\Ó¬-J\ÆÀD¢8\r·ø\É\Ý\ì+\Øöi­Œ#Qžo5\Åüq)e\ßò\'>ŸÃŠ\änµ{\Ù-\å¹ \âa¸õ\Æ{Wª]\é¡QÃ\ë°\'„ŸÂ¸Û3bT‘·s\\5é£²•CÏ¿\á\"º„º†U8\r\È\äz\Ê\Öü]r’Pƒz,€^ú\×y>‘k3+p5‡u¢YN\æ%\Â3g#û\Õ\æUŠKcºg˜\Üø\âû\Ë$\íÁr3Š­ÿ\0	…ó |§=«¼ºð½€%cüe>ƒbhŒ.;^]D¯±\ßq²ø\Îô`	nÀ\'sTfñ¦¡c~0H#mw- Y3œzŠ§/‡¬\n°0¡\Î\â+’v7‹<ýüszÀ ú\â³_\Æ×žj¸nô\ÅzøsN\'rÛ§¿Yô\r4d}9\Çjå‘À¿Ž¯\ÜJ\ã8xòøG÷ÓA]Ìž\Ó\ØÂ’:Š§\'†´\Ä\Ïú4yö‹k±Zœyñ\íÿ\09™x\éCxòüà¬œt\é]_öž§\"\Ý) Xnl@˜ö\Ñ\ì=NXø÷PpáŸ \äS_\Ç\Z†y¸-\í]bh Ð©8\à‘GöLp08¦¥ZG$þ5\Ô¦&9&›/oÑ–37-]š\è:zr-\âú\ãšwö&Ÿ·ˆ\ØsDV‘Ã·Œõ&_\Ý\Ê,\Õ9|oªG\"î†Np\è\Ø\Ö`ñ\nc\Ó¢\éÀso~¥\ÍÂ´;—Çš’cl\Ì1\Ø\ê\Çü&º‘\Îøÿ\0w\Þ\rO*1~Tõ\ÑlP¨ò‘š|ñ\ì‘\æ3øóTƒ8˜:“M>\Õ–@¹\í^ª\Ú“€\r¼\\qÒ¢\Z‚\Â²=TS\çaZG5Y:J\äjŽ\ã\ÆZŸ”\n\ÎùféŽ½«\ÐÆ‹f½!þù§:Ó´(>Š(\ç`jgŒ7Žµ¢8žLþ#j„x\ç^%ˆ¸“Ž+\ÚWD°cŸ³E\ßøXþÁ\Ó\Ùp`A•#…\0Ð§\å3’Ÿsžðå¶­¯h¶÷\ï}:ù\áˆ\0ô\0\àVÌº¦Žƒ\íó‘‚qš\ì<?g–™* F=­7\0LœsŽ*÷0”š\êpq^OTy]°1¸žâ¤žüŒ2J\Ç=óUµ/\rjmup\Ö÷dC#ªÃ…\Íp%‹Xð¾šo\Åßš¾n\Üõ­¡J¶§$±SÙ˜^1ñf©a«µ¼W¨¨…@÷®Lx\ë[\èn¤Á\Îrrµ\Ìj·÷\Z•\Û\\Jû\äldú\Öy®\èÐ¦’÷Q>Ú£ûL\ì5\ÅÝ‹¹°}ù\á\ãMl\Å\Ë\ä\Z\ãS\ÏzãŠ¯cOùP*³þfv2ø\ËW`G\Ú$oCš |M«• \Ü>\'®pþ8=©3Üš=•?\åE{I¾§Go®]ý®)\Ø|\ÝsÒ½V\î\àj½þ,À[ñ×„ŽG5\ë:“\áë¡»\nb|ú+*ŠqilË„\äÔ“\ìyh8ÁoµI\ÍD6ƒ\È\ïRG®+º,\åb“ž\Ø\à\Ó\\œsž9\"Ÿ’~÷¶\rWq†ô\î$;–\ç\×\ï\ßÁ\Z’\Z\á\ëÀW%…}\à\Û?\ë	v\í^^g+Põ‘\è\à#û\ßDz\Z±\ãžj\ÊÀ\àUhÁ+œqÖ¥ÝŽ\ë\ç.{…˜%TR	\Åp¾<Ó“[\Ñ\î¡Q—<\Ä÷+]qeŸZ¤\èK“õ\ëÒ¶£QÓœdº3\Z°Sƒ‹êŽs\Ð÷4o5\Öø\ÓFþ\Æ\×&T]°NZH×¨®DƒÚ¾²•ER’Ù£\æ\ç	4÷Bõ\'\Ó=h(G8\Çƒ#9\ÎW¡¥\àq\íÏ­jJ\ï3Œ\ç¥!\èsÁ ƒ\Ï¥\\\ç©â†2=y§€@\ã¸À8\ÔRý\ãA\"\àvõ\àŠpÂ¯¯N”\Ð2UE9\Ç$ñŠO`F¦dú†§kn€ò€\ÄÃšú\î\Þ$Š\Ù#\ë…\äð\Ë\Ú¿¹A\æ¿*UZöAÀ\ë\Çò¯œ\Ì1\n¥E\í\ÚÁQp3ÝˆÉ\è*Ê®*~ŽE-\Âlvß–¼\ë\çŠ|S³gŠ\Î\ì/\nJ\é^$y#8\ëÚ¾™ñ¥ ¿\Ðn\rÌ€Hƒ\ÝAþuó9;ˆ\ÎE{ùtù¨\ÛùY\ãccj\×î†=9\çšn\ÞM;\×Þ¾õ\é#ˆRI\àS”‘\Í4ô~ZNCd\ç\0\ÐÁž¿Ò¾–ð›<-d…x\Ã<šù ÇŒ.ù8¯¦| 4 Àª­yy‹ý\Òõ;pk÷\ÐôEºBƒƒ’µ\0d \ã·=ªŠ1\Ï4\é	x\Åx{žº\Ñ\r¸8{×‚üK…þ@\å×’=ºW«øZ\Z.ž\'a–c…¾y\×u©µ™\ÊÍx«\Ó\Ë\éOŸŸ¡ÁœyyzœøÀ¾i§‚3ƒý)\0=(ùyÀ5\í£\Ì[\0Ž¾¸\íL\ã8\äR‚xÉ¥wSš±1¹sK\Î8\Ï\'ƒM\èi\Ç‰ ‘NGøSH\\fžW±õ¤\0{ûP\0zƒWd¾y-\"€µ\0wªDP:þt\Ü\äöÀ \å²M !W\Ýi9#$d´{g\êh\ãŽO\\ñ\éJAz\rÀs\Û\Ì~¼Ó°BŸ\×Ú“\0\è~½\nõ‡pZºHû@•\\‡a\×¥q:\'‡o5¶s\ÕP\ÛI<\àúb½¯Ã¾C‰QBž>f\îO|\×-j‰+_PI\Ü\ì\â0=3M•Ÿv[ß­\nTc¡\'œS<1\Î¿Jã¹¢G\r\ã\ÄIô‘ž\\H\nó_?²\áúŽ¼~\íL‹k¯_\ï8¯rW†\'’y®\Ú;!Á¿¶E\0dziOô \ZE\ÜI·5¸BG+\Ù|»\ì¶\ÌO \'Ú¼l8\ä7N¾•\í>;k\\!‡8\ìeWc)\ËnN\ÄÁ;+„ñ\í¤·\Zc¼df\"	‚»X¥¹±õi7\Â\Êÿ\0\ná½™q>Sš7W*TƒQƒ Á\ç\"½\Ä^y\í—jÿ\0òNMyü¨Wx\È8\'šè„”‘v;\ß\rx¡\á\"\Ç-»Ÿn\0¯Uµ»R7q\Æ=+\æVpW°÷«¸ð\ï‰Í¹K{·;|²á©;\ê‰z\æ“+¡#9\éŒS€\ÈbjÈµ¾»‘\ã¯Z¸\×\"D°\çms8‹˜\Õ\Ñ$‚VfB–ÿ\0&º\å“k\Íy—‡Õµ\ì»cýÓ¸Á\í^ŽŽ®2)™`¾2k\'P¸\\lp	«žÃ§9®\\·3¬{p5F‘•™HÄ­“œ\æ˜T\í½	!_òqLó\Æ@À\äñ\éP\âjª‡\Ø\Ø\Üzôža\È=y\íÒ y\Ó%P\äõÀ\ì*£\Þ\Â7flô\Èî¢…9š{Ü‚AQ¼c\æ\ë\Îs\è*€¸,\Ê\åöœZ•<\Ùr\Z\"½øÁ\ïÒŽR\\\ÉY×€0s\ß5\Z\È>ù$‘€\Ë\Ó_Ê˜¦\ÑòpAú\Ò:^FT}¹\Æq\ÜUr‹œ™™Ž\å\È\à\ã\êO5’Iõ\íUnä½‰\î$f\é8#\ëUQõYµ\Æp3»¸\çùCœ\ÑF\è¹\ÆFI\Æy¤v*F\Ö\Ê\ÖJÅ¯<Œ¾TcŽ¼\çð¥’\Ó_“\ê\Ç\'<e}1O=¡¤\ÎÀ.J\ã š<\ÃÁ\î8À¬\ï\ì­mþüŠ\0GCR&‹©´\Ì\ÍsŽ\ÛH\Æ{š9\Ú\ÚP\Ê\ÙP@\Î¤3¦7d:gò¨\Û@ºY²n\Ë\î1ùT&ð\Ã6\æóe]Ç„nª”E\íò}«¹s˜Žõ_\åÛ°œ\ç¯ZÊ¸ðÎ£\æ07Rcò¯§®1U„uøk\Ç*Gü\n©!9›I\Z’›\ÆO/½1§ƒ€\à\í\Æ\îk5ü&¯\"<¤€6ò1\éŠÔ‡BT\Ú[\éòòzû\Zv!È¨·V„0W\\¯8=€ú\Ó^ò@\ìN\Ò#§žµy|9de#¼ú\ã5±Ÿ>Uš,C‘\Ç>¯d b{·s\ÏJT\Õm‰BI\0r	=8\ï\ï]<šE³HÛ¨\É#wÓœ‘MM2\Þ\Ý²)–z÷4Y‹™™Q\Í8•PD\ä\äR[½Ü˜\ÌD\ÉP}­tq´b\ë\ÜÕ¸d\r\æÀ9À\ÇAŽ‚•…\Ì\Î^\ëûF‘\îZ®.u»–À?tžk¯šXdN\\	\ï\ëÚ©“;vƒ…8c\Æ;\Ò\åÙ“n.=v·__ ¤’\Úü³\Ê‰\é\Û=‡¥l9UqórA\ãµSy“¡uq»=py\Æ})r…\Û\"‚Ýœ~ðc\ã\Ô`Z¼¶j¸<c;ºœb©›¸”\á¥\ç=[ž(šöiýõ“MDE\è\nF\ÙS\Ñ~lŽ9õ§™dCª€­\Ç\×ô¬o\í\\‰ \î\éœü\Ät#ê¶Œ2\'Fa\È=‰ª\äd´z\Í\Ë(“\Ø6\Ñ\íŠË•ö8\È\ÇLþcaS¹™›8ü*!\0Wž\æ{|…™ˆÁü5#\\\ã;©\íµ}zU	\ågF “\É9\è))	ÁHŠ\"ß€x\ïX7p<\ÎB*“ž‡Sý¦\à\\\ã\ØsQ\îe$p2;œ\ä{úVªf2”\Ös§1–\éT/4ù\î®\Íù\ìkfI\ÌË‚F8\È\ëS¤Àû¶G\Ój¡*Ë¡\Þ\ÆÏ°sô\ãT\èw½\âÀ\äœ•\êA$\ã¨ù¿¥8¢¯!N2hu¢\ÐókO\rjr¯\î¢]¸*yý}\êôž¿¢ýÚ–r\0\É\ès^¡g‘&\í ex_OÊš\ìþz·\éB›;Gš\É\áM^/˜º`ð¹>\Õ-‡…\çó\îfTgj£ó¯Lœ¼‹ŒŒcÿ\0¯Yþ_U98ýje6\\eq©1€\0\ÇJ‘bSž\ÃÃž\Ü\æ¬G\Ø\ç\ëXÜ§b\í¦[ \ê\î)\×6–±.B€FqI\Æ\Ìmô<\Ó$Ÿ\Í!Jœš«\â`5¤\ÒM–c×ÛµZ¶„Œ÷\äžG¤\ëµ	QË­T‹\åÁõ¨”!øw\n*\Æy7c“š\Ï\Üexô­µ` ³c=r\ÎGLbG+³GaQ€\ÊFI px<ŠnH\È\Æk&i\Ê6lg5U\Ç}½»Õ¦8N~µQ\Ëô\íM\Ñ\ÈxšI\ÛO™0	8¯\'v“wÍž\Ø> W´ë±™4éº·\Ë\Ð{w>Â¼i‘\Ãð\ÝI÷\Îz×±„~\ç\Ìäš³#|\ãù\Æy\ç4¥\äP¤±a’@»S··{zóŽ‡5\ï@. †ýx¯@\ÌxcŽp)Áy\é€@\'Þ›\æm#œ\ã×¯52®ö\ã;²{~T˜®\\\Ò\ì¾\Ýp\Ô »z\à\Òj~T—l°&\áFz{WiiiŸ¥0³&\\\×ÀIs799\Ï>µQc d|\Ç==X‚r:\Ô1B¹\à\02>´Wv~½¿È­\ã\\®â¤žµ=Œ/}y#\n¹Á\íU^@\' \í\Ï|\Ôv\Ó\Ïòùy†8=j&3Ú Š+u‰W\å^s\ëŽ\â¹o\ëon°B~i3“\Ýq[q\È^\Î6có2Žzö\â¸+½\Ò0Œ\ã€:Žk’\nó4¨ý\ÝS%—¯\'µC:|£>½sVM\ZpHÝ„ŒŸLš\ïŽ\Ç!\È\Û\È§\ÈŒ\ã\'Ú„l«1\àdP:\î\ç#4\å°\Ö\çi\à\Ù\å\Z´Qá¶’\Üu\"½\Ë\æQ§‘^eð\ÛN\r3]\È@JÇ“^·tñ²`‘úW‘Š\\\Ó;iJ\Ñ3$\Éf\Îk6{{ƒ—@{Vœ‹\î3Ò™\å‚Gz\æI¡¶™\ÊO¢\Ù\àxÀ\ÍSoY9S·J\í<¡“œV\ÄVP\ì\\6kh\ÊK©›±\æòøb\Ð|\Å9>ßy§Š4\ë+	\ÓÊ˜\ÞP2G¡5\íž.ÔŸI\Ñ\ç–\Ýð¸ý\Üñ_4\Éq,\Î\Ò9\Ë3’k\Ð\Ãó=[9*44(\Ý\Ðf»ÿ\0¾\Ýr\Üg7z\àB©$‚{\×q\à‚\Ã]¶ÿ\0­t\Ïc4}Yej9\ÛÖ›|€\ç‘\ØU{\É?vk“©”™\Íø³\ÄV\Úž\Ó\Êr\çˆ\Ôs“Ú¾T½¼ž\î\âk‰	/3–$ó\Íz‡\Ä	\Þ}^\Ú7|ÆŠN\ÞÀ×˜^q;±<gÆ»¨\Å$a{²™\äNN=)›‰<\ãµI‚ÇŒz~\"˜ªyô\Î~•¹h8\Ï<ûb—v\ì\ç4¥F¦áˆª(”œ\ç§AJ?.;T-ƒh¹\íŠV\É9\Âûú\â“<“š#n:Œ÷§½qLLaV ÿ\0ŸJ~(\É\çI\ë@†\ím\áyÁ\Æ*d@ƒjEÇ \çJ\Ä(Ï½0ý\Èv¨˜£ð\ïM’^xõª†F#\Î¤49Þ¡-\êq\íL<\äš@G\"’nASÇUs\ÄqJ¤¨\Î8«ˆ™¨%\áGµYÝ³\ÍgFGRzVŒj•=\ÇÕ¼do\Û`\ÂvðqŸqW`*„ =±œpk\"Ýž5À#$Vžö+ž\äÿ\0:\ëƒ0‘µ¥#!W9Àâ®´Œ^<t—j\á‡{Ž•y\n´\Ë\é[©\Ñ\Ôiv­,S´j$-4#wp±ùz×»i\é%µŒ0¹û‘€x¯5ðE”s$\ÒôR@R?¼\rzª¡\\¨\ä\ÔTÝ‹Žƒ\ä›1q^i(¨\ßÿ\0t·>€×­\ß\é¿\Ù÷òÚ©\Î\È`mÇ¦e‰$ý7W˜\Þ\'‘6®:<‹\")\ï“\Íu`\ì\Û91,Í–)&6\ápª‘!\Ç^~¹«ú\Û\Ékil§\çH‘s\í’øü\ÍeZÐ·$°tŸÖ¤	oö÷ySxŠ\rª2@\ÉÀ\Ýï´ž•\ë\Ä\â:\"E·¹»p€\îO*<€Ÿ\Ç\Ø\rF\Î\ÌÊ³«3M»·]Ÿ h\Z4lvûÆ¸\Ûp\0[“ó¶ºª\áv\î\ã§z¯s-\Õ\ÔfGB§r“‘Œ\ç§\Ó5²Ø‰±§j¶]“0Ï•§°¶À\ÈYZ-I\Çe\Í{Ï¥Æ­Ã—Ž\"«öX\á\Ú	Ñ¾oQ_\'G5Ý·š\îˆ$û»—#5\Ø\Ùêš”VÊ—.0#`pvžjjÇžW·2µÉ‹\åhúk\â>µ¬]k\Öz5¤»—\Èi\Ç\ÌùR…Gu½÷\Ã\Za\Ñô;+Vvy%23u.\Ã&¼ƒá…‡\Ùþ\Ñ.\Ë{»§ŒJ\Ç\ÎÅº°cœ\nõs/‰.n¡|‹8ñºBœ\Øô\ÉÀ\Í|¦`ù9pñ²PÕ½®\Ïg	­\ê=\ätõò\ÉU‰7\Êù\Ú\n1ÝN£\ï¥yô\Ì2hÚ»·`džM-¤XsFI¤\Í( \n\×Ì††=\å¤P\Ìz*\ç“VyÉ£·J3@hã©¢›@Á\"Še-\08\ZãµX\ê—tšKV~\\F\ç9ú\×ašZÒ•j”e\Í	8³9ÓŒÕ¤®|û¬x+[\Ò\îQ!CsBÌ7–\èWµqWZ^¡h\Ìò\ÆH8\Ãt\ÆOLWÖ¤qŠów‚4WˆKq\"Æ­\Ø*Àó\Ød÷¯{™U­R4\ç\ïö‘\æ\â(F’\æ‹ù%k\ä•f,£¡^ ó\ÓÚ°g³š9\ÒTV`Œ¼÷õ¶o­®ô\â†8bvùI,\ÈA\Æ\Z˜&f\ãn/\Ï=z¥zóŠ’0§;¦³fn\ì\0I\æ-Œ}F+ˆºApTœŽý«Ò¯W\Ï·3L“\\>§hð\ÄyWÀ÷À¯\'O[ž¦g9pb@s\ÝN\\Û±-š\Õ\ÔRE$ž˜\Åe\ì`?…x•Q\é\ÓØ„š­p¸Ž\r]Uù—¿5R\\3{\×\Ñ\Ógº\àzsUfP\Ê\ì¸5z\à8õª~Bµ\É4l™šÂ pTñ\éV óU™±“œb¹¤‹L§‡-C\Zd—(7qÒ˜%\Þ+‹L›wLžM85V9\Ï\0\Ð\ÎQKTŒ¶\\f†#·¥TK•`25`’¥;€™\à\Ó\ÜÔ¥Ø¯LTa‰8\Í ,\0p)À®y\ïU\Ðy5`p(„¤Ñ‘ŒIž34A\Ä*®6\ÍXvÀ\Î*¹qšYQ´}EY*’\Ë\ÕzT\ÑËž\rZ3‘¿a\Ä\É5+®fLŽÆ¡°#\È36\'Eö\ÍtGc†¦\ä¤b¼ƒ\â\èDðÃª<`×¯±\â¼\âø\Ýá \ãu\Äb·§ñ#–g\ËX4`~Æ¶m´[»“•RF3V_Ã·\à\áG¥z\ÒY*,\æ\ÉzzR`V…Ö{g“,/·8ÝŽ*‘Lcß½Ri\ì\Â\Äts‘Rm\àúS¼œ`\Î)‚p\Ï×­zŽœi\á¹Û ‚;\\6‘¦Kw¨[\Æ\ÊUZE\'#<zW­x†ƒB¾T_“\Ë\çð÷®j\ÓJQ^fô\â\Ü[<@\ëÏ­?\ÇCÖ•÷˜\Î\ÐI\äÿ\03M8®È½g«\ßdw8ª\ìj|z\Ø\ç\éM°~\é&¾žð”-‡\ìTñû”`Q¸f¾n±µ{Û¸-@\'\Ì|q\Øu5õ›˜-¢ûŠª°\ãf“÷a;žžk&v\È\Ñy\0\î^\re\äu\ÅV¦™;³\Åx‡«r\Ï|\Ôòh8ª\É(‘\ä\ÇP“wG—üN²y¬\í®Ux¶c¸÷\ÃW‰cþE}A¯\ÅÕ”\Ð’¡R1žµòûFbvŒŒ%Hô\Å}]6\èò¿²x˜\È%RýÀô>\ÜÒ ó\Ü\Ó[ƒOÙ^šg0¸Sa³œñK’-I\Èô\ÍP’\Ç>¿\çt\ïÏ¥ û\Ç\"–‚@`òcS\Û8Š\â#v\Ù\ãñ¨y\É\ç‘Ò•€ƒB*%µŠG×–{\nD\ËÐ =;Ö°8®c@»7\Z]„¬~cn¥²0s]\nÉ´W\ÈU§%\æ}\r){ˆ³\Æ\à3žj\Å\Ý\Ä>K¨#§¬\Ó!ž¿\áU¤f~µ4¹\Ïë››Lº#¯’\ÜW\Ëòñ+\ç×Šú®\íBó12ã¯­|\ç\âûP1©&9†øó\Ô×±–M.h½\Ù\æ\ãb\ÛL\æÀ\ã®=H£#ð>\Ýh\Ü?7\ë^Á\çˆB\ç=)\Ó¨\ï@ûg½&Ä‘$qù’\"Œr\êÔœWÖš\\\Ú\Ê—$*(\ç\éÖ¼/Á¾Kö†öL¶\×\Ê/aŽ\æ½Í§6\é\n>I$\íŸJñ±óSj+¡\èa¯&i;m9^Y&W$ãŠL&\æŽ)§žKc\æYüÇˆxÿ\0U77ŸgŠ \Æ	þb¼É±\ë]·Ž\áòµ\É@9V\nÙ®«Jú*JŒ-\Øñ«6\êK\ÔV\É$ŽOzi\"š¹\Çzp ½\ë¬Á†\0\í\Í4t\ïš\\\ãÒŽ|œÓ¸$7ŸNx§/s\ë\é]7†ôs©\Ý\î‘7B\Èõ\í\ÅQ\Õô\ç\Ó/e€6\å\ÆCcTó+\Øv2óƒž„ö§ÿ\0,÷¦*¿`s\ì:\Õø¬®fll+*®IP\ã?¥_°·Ž\ä\ÜF\àga\Û\Çp*À\Òn~€úw§\Åi-œ\àƒ–\ÆÞ˜\ëÖ‹‰˜-\rŽy&”)\ÜAƒ[W6lÒ–Q€\àdT\r¦\\\çI\Ïq\ïN\âFn\Ó¥ÛŽ„ñýkF=.\í\Ø`’\0Ç­<\éÌ n|\ç¥Ce‡.V\'„H±•\ì\Ê\Û?¯žô™…†¥¹!2C×³ZjQ·\"ua×ƒšá¬Ÿ5Í “G\\Ž…s’y\ÏÒ‚\á$TZZ	QOyu«ù\ï\Æ\çÇ­`†\ÎO\Äöo\Ó\'·\ã8;G½|\í\"˜\å(NJ¶\n\×\Ôz˜ˆ®~\"¾}ñ%¡·\Ô$u\åYŽH9\ØWUm	±Î²0ù‚\àž\áÚ£8\\ò\Þ\Ý\ÅHªs•\Î	<b¤0\Ê\Ø\Â1ö\ÅtÜ’.\äõ5\íž\Ã\ÚÀ}\0\Î\Ó\í^2\Ð:0!s\Ü}kÚ¼,˜Š\ß9?/_ZÆ«\Ð\ÊZXõð±®+6ø†!Ÿò9«¡Á\'#¥cjslló\Íq=\Í\"e\ÜZ­\æ\æ6=\ëÊ¼S\á™ô§‚ð±<Ÿ^µ\êb\äDTª€\Ýjž¹poté¢’0ü\Èâ®›i–\Ùó\ËH\çžÔƒ \Úz`Ö¥ýœ‘JÄ¦^œ\0Oj\Ê9\\õÚµD‡‡|E%‹ù±k~1¸ý\ßSšõ\ËkˆnSxe!À g#šù\ÐŸÎ»\nj\ÓE0¶™	\àzjÆ¤’=\ïF^¬[µtaJó•Á¸®WA¸_(©OR=«ziy\áˆ\År=\ÇÈœ‚y\ë\Ó\ß&¢¸†9¸90;Y)ªX\ÆÎ²NˆTäŽ”6¿¥C‚\×qüÞ)ò”Ym:!\ë‘\É¤Ò›(ÁG\ÅbM\ã/”\Ý!\ÂúU&ñö‚¨Iœgœ`g4\Õ7\Ø˜i\Öa‹*œUi4[\'fs%¹sÐš\æ%ø¤\Æ\æªOñ#Nþì’¬Gjjœ»1Ý\ìz}¼xÀ`\n¾\"‹;‡dW’7\Ä\èúÁsÀ\ÍR“\â\\\ÅÔ¤K\ÙÀ#¡«T¥\ØG²•½ùþ]\év©Pr;\çŠñ	>%_ÿ\0X=«>_ˆº\É£p\êO\\\Z¥F]„{\ï—*\éÁ¦\"\"\îÿ\0w<ß½|\ç7Žµ©@\"r¬£hÀ“\'Šõ–m\ßj|òI\Ïoj~Éô\ã:`\à\03’Gš‹\íV\åX†RIþ÷Oþ°¯—_\Ô\ä\Ã}¦cœï¨›W½lfIF\0\É\Ü{zST˜Ï¨Ž¡`ª\ä@3\É\ÏJ­6»¦FSu\Ô9?s\çšù€_\Ü\ï•\Æwg“ü]\êq)\'q,qÁ\'·z¯bÓ’øDF \Þ!c\ï\ß\ÐUñv‡@¹F#®z\Ü\×Í¦G\à+zj\ÈÊ›sŽsG±&\Ç\ÑC\Æ\Ú\Æ\\ƒ–ªSx\ÃLENOpx\ç\ß\"¼L\ÌwzÕŸ›j¯8âŸ±C±\ì¯\ã½0G†ŽQž\ã¹\ì;Uñý¬a¼¸Øp	‰\Íy;ƒ‘ s\Û\Ø\ÔG‘œû•§\ìXõ7ø…D\ë\éýj1ñ\rÝ\001\È\î;\ç\Ð×–“•Q¸\ãœôëŽ‚Ÿ²ˆr£\Òeøu(Rb@Û¸`}±š­\'Žõ\Çn6Cs\Íyðlt\äw¦\à–\ÇNH\ëÀ*K°r£µŸÆº”¥°ÊŒNF;c¥C/‹õR\ìUñ\Ç\Ðd\× @\Û\ß©FH?\Ãü±U\ì\ã\ØQ\Ôje]²\î\ïU]¿pJ\än\Éù«3ž@\çA\ÍFB‘\Ù\àbfŠ\å6›[½““3(\àŒTª\Ý\È$/)Ë‚ž0}«8’™<„SH$ý2:\ÑÈ‚\Å\Ã{qŸõ§8­Z\Z…Ë®<\Ç\Î1“Ö²¾v\ì~^\ßJXm\0£Óž8§\È+\ZBúb0$bH\Ëœv¥û\\Å<ò8\ÅQ\ßÐŸp¼wõ¥\ÈbCG*%Ÿ\\3t\Ï\Ð~A7´Ÿ)\ÆA>¼\nžK…`w\Î=*œWq#¦‘Žs\Û\Û5óG¸Oq‘\Æ\Û_9\ìj5P«€0G%»\ZŠ\æùlPx\á³Ú¡2n\Ï¦=h$œþ\áùŽ1Œ\ÔNUp?/~ø¨Ý¹\Æ=y\Ç\\\ÓX£ \ä>oj´CDŒÁñ\Î­7iH\ã\×>\ÞÝªoŸ%‡\0v«G˜2j\Ñ\ÔKK’„\àtö«PA·ˆ\È#¢\í„CN\äsNµ ®2Ö©¶^\Æ{þ·½Waû\Å#øº\Ô\á1Ÿ¡5W,.ˆ\ä\Õ²\É c5‘¦\Ò\ë×‘“\ÎjbX&1\Ð\Òp9=:œf†®4\ÌöG!ˆLÁÀªÁ\Ü>1]*\ÉG‚pq\Î{•\Í\Ü\ÈL¬TÃœuÏ¦+&S¹\"™6n{\n‚Y\Ìl7†\Ç=)\"m\ä•\ë\ÎGÒŸ\"®y\\óRl‹\ÒH¦1ŽrI\ëT’9\àúf¬\\q\Z\î#…>Â²\ã—t„`\çŒzVRf±5 bKA\ã\ÜVœ—-*\ìX)#;exÒ®\î œœ\×;7D\Ù+Ÿ\ëJ­¸\î“Ú¡\Þ1š¶’¢EŽ1\ÛÖ¦\Ã#Š\à\ä\à\Öl¯;²ÀW\×a0	¬&5‘\ÚM\ÎsÁ5h‰]þùxé“œô8¯0\Öti\ì\åi\Ç1’}ñœc5\êÓ²…yGjó\ß\ß:(‰8ß\Þ\àW~¾k#–ª\Ð\âY\å\È\r»¦y0#*}ø\éM2+’\Ãq²Nq\É\ãú\ÔJ\Ò0!†:w\ã\'šroL– ÷÷?•z\Èå¸žgvo˜‘\Øx§¡*\ØR\Ý=q\ïMù\Ô\ã±\í·(òõ¦3»Ši\îô—¶\ÐF\ê\á\Û\Ì d\í\Ük«Ñ¥/o,kœc}}ë›ºG[’£œõ¥!6WÁm¡>ÇŒžph\Ç\Í\Ï\0{õ=+Vý‹·’T“š²|=4‹¹\äT\Â\çaõ«Ds\Ã6\ÓÇ¾p;Ô‚l\ì)\ÜõÁ÷´P\åÁ<ý;}i`GG	^x#®\rCLöM\Ñ%³…¤`_b’:pj]{N‚[7Ý‚$q‘š\æt»–Kdmÿ\0uñ€q]\äª-‰°¥Kz\ã\Õ\É\Ëf\\¥tx…Ø’)\Ú7þF€¨†J€ð«×Š÷wrÊ‹\Ã6Wª¸°º#w–ø\ïc<õ\ë©=Jd±\Ï\ÌI=GÖ§µ\r+m\ÆK78\ë\ï|RiPŸ€Z\Ò\Ò \Û}\0c€\Î1\Í6ô\ëº$?e³€Ûš\ÞYI<Y\Ðˆ	\àt\é\Ïqr#o\ÔWQ]›)³°sù\æ ó£ƒ\ìhs’rO¸¨\ã\Ë¯LV\\‚\ç&±8\É8ö\çÖö¹‡\n\ìª„Hx\Úp:œ\â£wqüpsT¡©fŠ¼Û»	lm<\àQ^Œ§\ÏjöJ\çO¸`y(O5\âûðr8\É\æ½\n\n\Ñ9\ä\îÁA\È\É»¶5[r¼Ÿ5KW\n‡¨öô®\Ï\Â[“W´\ÆFd\0“\éZ\ÏaÅŸXD~Nj¥\èÜ„‘Ò§€\çns\ÅEs\Ê\Z\ä\êg3Â¼c8ºK\Æ \\v¯(¹s$»³\ÃW\Ó\Þ#°†úÁ\ÖS´m<\×Ë“¤bg\0ôr#®\rwQw‰…¬Æ¨=}J~x•\É;J“q\\…\Ç@q]Š÷ƒL#4ö\æ<\æ¢ÝOE÷ ¤7=\ëI¹rsHÜ“\ÇS\Ðv¨I \ä€A#4`>2Xˆ\äð\Ü\ç\êj¦\å\0‘Œšz1<n9E\áÁ \àâ€2@\éÒ¡ó\ã\ß4oºŽ($°0[ƒŽpj—oN¤ò*pG§8\ëUO^{\Ð	–A»ñh “š((`\Ý\ÇŸ¯ý£IŒñš\0_^\rIó”Šh\ÎT\ê„NEZI\ZcŒõ\"µ!O\Îys\íYk.\Ã\Æ=\é\é#;ž}«H»´t‘;!gGOJÕ·+`•\î:V\r»\å\æ\ïZ‘K·`\è@\é]P‘„‘v¾vù€98­x‡U©s\Üó\Ís© fùTš\í|/gý¡ª[Å³pR	°­\È\ÑÕ C\r•„0Bz.sÜŸz\în\ÛËºFŒa^wÜ \rúƒ\\ûÛˆn¤\n¡y\ß\Â+^m\Â\ÞÌŒœ#}\Z³WbrE\Ù\Úk\ÙY\Î]UI>\Ã¼\ÓÄ–ò\Ø\\I\"¾\ã\æ\Ø\é\Åv\âYü\Õld©â¤H· Ì…\Ù\ÈÀ\Ç]Æ»0ó\ä‘\ËY)YoxŽ\Â›‰q»ó®‚\ÆA%\ì\ÛlŒ¹\Øõ×¯†¬¤¹b\Ùór*\Ò\éP[\Ù4A93F\å±\È(\Åzp¬ŽFŒKS(¶‘#\0ªÕº\æŸ,\Ú)(\Ì\ë*—À;FÑ´~5\Ù\éºT0€cˆw\'®OC[Ü\ä÷|`wõ5¯¶&\Ç\ÃPHf•\â$¢BCwù\\(­=:=N\èÁõ\0cžx\éš\ê¥Ó™`\È\n¡³\Î7\×A i\ém0’] `cÖ…U’\âløY¨\\\é»w,\ÓG?y¶¯<z^\Ýµu¯\å_\ÃöxfR $÷\\kÀ¼+ªK\á\íD¨\n6‡9_j\ìµ?f\à\Êðg\ËBb\Î\Õ‚k\Í\Åaz\íò®We\Ö\æôkºqß®Ç¾++\0A\âŸ\Åq\Ô&fû<Ï»ývÂ¾z½Q¨\à\Ïn…eV	¡´Rš+œ\è[‰KIEŠJ(i(¢€\n\rP\Ð)( \×\â\í.\ã\Ëy\í-’Q\"0”p6ž0õ\ßw¤*Œv­°õ¥Bªšù£\nô•X8³À£ó\ç‚\ã/!3O°®³\à³õ\ÛÚ¸\Ëû;H.dTˆ€rS\'Œ7#\ëÖ¾‘\Ô<;a{o2\Ã8ùXòWŒ`{W‡x—Ã·\Úe\ÍÄ² pDe‘wzls_K„\Æ\Ò\Äh½\Ù)\åÔ¡::½9¾µ™n@V“ù\ï\\\í\ä>I\ØA+¼¾I\Ï\Þ\âº\ÝN;©J;\ÎÁ \'\ÐqX—dˆ†@ §9#Ÿ\äsZÖ…\îmF¥¬y\í\í¯›#¡þMdJª%E\ØG½tº”RA6\çrpr×³©a´ò3\Íx5\éÙ³Ö£WDf:s+`\áS$\Ù\â³d9\Æ}+u\r&yú	nR}J\r\çùŠ\Âr:\×\àuBi•¤Àª.¡T‚y5v\æE]£\Û5U›\å$\ã§O­rJ\êe&\0©\ç‘T]8\"¯g\äqU	\"¹¥\ÔÌ·ˆH~PsQ²yC#‘\éZ’!ÁCks–¬JS!1\0$\Õg”™\ÂøÕ‰\ÅV\Æù—<š‡¹\Ë\éX\n;T¥8\ÍC•R¼\ç5&\ìœ\Ò\åcSB8\Ç\Õ\n&3\Ç5g\ÐÀg½.V>t\0­IøUi#r¿!Á\ëDm\"p\Ôr‹œ³Œcžù\ÍFF\ÜQ¼ñI¸\äQas‰ %\ÍDT\äTÀ´ƒnÿ\0Â‹:\'\ÉeŠ\Õ7\È\áW±5i;\ã5\Ãx\Ê]F\Ú\Õ\æ‚?5Œ¨\ê¨ªŒYœ¦Q\Ó\Ê}™0sš”¹ûRŽ\ÛMR\Ò¶ŸjJ\à˜#\Ó=ª\Î\áö¢¸\à\n\ÝRz—p\\Šó/ˆöS_h{r’+šô¦#Áx\ÎI\Þ\0§¥÷®.\ÄZ\æF¡[\Ãcò†~\\šŽ[–i¶(\0\r]‚þX\á\ì*¹%\Ë`\0{š\ÆJMi#’ñ-Šc_€í…ˆö\ÅyV™mûD‰ò×«ø«Pi³*Yþ\\g =k\Ë!”Gnvõ9®\Ì:š¦ýLª8ó\Z\Ñh:d®Å‰RF\ï 5±o\á\í2\"®=\Æy\Ås‚hZr\á\Î	47ŽŠFJúã¡­_?q\'\ÇQ§\Û[¯ˆ\ì\"#€\è8\ê+º»´Ime‚Ed¬¥y<’¥õ­Ï™»c\à\ãÒ½s\Î2 9\ä®y\ç“\\\ÕT“Fô\åV\Ãÿ\0jYM³r¥€\Ð\ZÊ›J\Ômó¾\0z×¥\è\à$·@¶zk w\æ\0`w®˜×”t\ÜÁÑ‹<0C8 ,lÇ¡\éJ–\Ës;p\Ó8T\'¦kÖ¤–\Ë2,j7\ê:‘\\\\\ã:¥¤‘)ù%B;m\Ãf´ö²fnšS\Ö<9\àˆ48\ÒfK‡?4žž f»(£	µZ\Â\Ñ)\Üm\ÇÒ¤Iýó\Íxuù\ç&\ä\î\ÏR,\"’-\í>˜\âšPI‘db3Þƒ3g t5\Ï\È\ÍùÑ»my\00ROZóý_\ÅZ~…},3&\æ\Ýü\"¶¯\ïoâ°¸û1ý\î\Ì #<\×\Ì\ÚÞ¡}w~\Ït$\è\Êz­v\áp±¨ý\í‘\Ë_\é­ÿ\0]ñÏŸt\Z\É\n \\×›^/\Ûn$•\0‰$\Ó&¨#\Äd¶H¯*0oNGW¯J”)$¢6¥ITweY\ãnF\r7GsŠ\Ð2\ÆÄ®\Ñ\î¤úRIkˆ\ÙZ\éLÈ O|ôuÉ§7@\ç?Îšp3Þª\à4€sNf\r\Ç^zPI\0ó\é@\0¥\rŒ~\Ð:\×e\á\Þx“÷ƒ\å·lf\Ï<u\År1+\Ë\"ªŒ³|æ¾‰ðŠÉ¤\é±@Fh\'Ÿ^H®lEGi¹¥8§-O@\ÒôX 1Dœ\"\Æ\0÷\Åk\ÞX\âRpx\ÇzÇµ\Ô\Ä­! t&¶n5\Þ5m\ç±\ã“^\ávz•’1¤ŠTt*=MSc\×=\ê\å\åÌ—sò\â«ya 2£Š\Ï\Ù\Z{C3QmŠ…\Î\î:‘^Eñ2<]Z\áTb \Íz\ÕÌ‚§\î}+\Çþ!G#\Ën\åOŸ|‚{\×n\n<•0\ÄËš—g§ZròsMÁ9\â”\é\Ç5\ì¦y¬Lf€Bµ\'e\Ï\×5<\î#Œq¹ÀúR“ô/\ÃK³\éc\Î\á¦ñ^Ÿr–\í\åd®U+\Îô8^‘UøU\Ó92\Ä0N\à+Ç«i¶uÓ©\Ëjñmþ\ÏÁœ|V#·ƒÓŽµÿ\06=¹\Î85\Ç@0+FÆž\Üó/ˆ\Új\Í7±€\Æ3µñ\é^9Çµ}3}oôr[2nR¸zù\çX°}6þhOE\ã\Ü{×§†v‚c’£¼®eg£®sß¨4)\ãœ\Z01Ï¥v&fŠi\ÈÀ§`O\Ë3u ô\Í,z®¦\Úiv\ìNG\Ès\\Æ­\'\Únd”.\à\Ï\Üc#µs»\r¡‰z(©ZVÀ›\å	j6ô5mæ··<a²A\íWU†-‘\ÏR£®=+—/ž«H~U\ç=óZ\":Y5¹\n\0ƒœ{Vp\Ô\är2Ãœ\æ²Á%€íž¾õ#gŒ¯C\Í³j\Þ\ínFÍ˜`=qœ\×IÑ¢sŒ\ÈÒ¸™‘\Ã! Õ³!…W‘\É\ã¹\ÍGGs¬¤.Q6\à˜•\ÎM}+»\ä€Ns\êj›1c–$Ó’7º™ý\êlP3—\ÆI\éøTðMpŽ\Çf\Æ)EŒŠ2\Ø\0ñOk7E\'Ôš—”™\ê~ñ#\\ƒo,˜–1œnû\ÃÚº\é/.~ùsŒ}0+\çx¥š\ÖP\ÈH#œ÷¯U‡Ä>™\æ1ö+}1š\ÂT•ôËž#\Õ\å†\Øs—<×–\Ëpd‘Ë¾ü6q\ÏN\æ´\ã\Õb¸‘\Ö\àÕ”÷\éš\Ït@ûP\áI\È\í\ÇZq)i–!1)PTpy\'©«±ÊŠP2>\é\"¨\ÆŒœsZ0[—R3ógœ\Ð\ÙI/\ÜO°(\Ú>^xús^©¡¾J\Ñg¿+Ë¯\àEš±\Zõ­+¤`\'\"³›\ÐÆ¢³;\\}òMszŒªgq¾œ\Öù9\n\Ü\ãÖ¹-saŸ!¾t#¯\çX¦\Ò0K‡œç§­Gt\Êö²ü\ÝZ\Î\"W\ç…8A¦F²*.\áÜš\Ñ!6eˆ¢º…£~q\ÆryÈ®GU\Ñ\Þ\Ý\äx—pž~µ\Ôjp\ÔÌŽ#”sÁûÝ¹¬ª¹\ÌR\r\Ûr2¸\é[À´\ÎD¦\Î1žy>õ\Ñøe<\ËÏ”t_\å\ëU¯c‰˜•L1\ì>\é÷¥\á¥\ÝsÓ¼œ\àÓž\Ä\È÷M+A\Ê‚\nýOQZ\ÓFû‡#­e\ècm¨÷¢òñ\ÓrŽA\Î@®>£†ÇŠx\Ây\ÓU”!wðErj”±\å¾cÈ­ÿ\0¸mNbO\ÌX\çó®\\·\\}+®šV4°æ•°n\â€\Î@\ç\éŸw4\í¿.Ö¶\åBw9¥ð›‡<§P*òzvwqƒÒ‘-’Œñ\É\ïŽ=©…\Ûn0j]®N\0\É\È\æ¢h\Û,¸$÷¢Èža\êü†#?N\Ô\×Ý–\ÆO\âs@‚RG\Ê\ØöSøô§ù–#i\ÏS\íF\ÌU\Ï\ÊiN9Àô­¬§”\á#\'Ž8\é\×]\nŽM\Z1œN\ÑÚœ=›ªó×ŽjÙ°º\ÇžœŒgž•µ“{W#i\ë\Å+ ¹ld†™\×\'°\ê*\êZL\ì\Óøž\ÕhiòúôšwC¹ŒTƒ\ß9\ìq[Ä™<õ\Í9tð$†^~„\n.22rI¡©*2G5\ìXÂ’4¯m´g9\0žœõ¢\ã(‡T#Ž1Ó§Zk—\0GZ°HU\É÷\É\Ï\\\Ô2I¹\ê}iXŽcÿ\0­Š\Ëdõ÷©[÷„óÁå¸©B˜˜²((¯‡\ç¿8¥\ä$V¦\Ø\Ï%s\ØcŽ>ž\Õ3Z!\ÈU¾½h‹€¬¹#$tö¤ÀS´ç§§­O*<e•º±÷\à\Ôy=”\äc6¯\èg£b»‰\É\ÎH\Çj“ \ã\nE0·EcŒœ\Ð+‘\á{þ©\Ä7%W´\åÀ\ïJ¡˜zgŠ–=\Ç\"\ï\Èù†FAçŸ¦)Á‚HŠÒ†ShÀcŽFjW·;p\á³Áö\éE\Â\Ær\àŸœc\åõýkElK\à¥HnÍš¤ñ•”Ž 78=:cõ-½\ä¶\í‘À#8=©\ÑôœÄ»Û·\×ù© ‰0À®pNI\ç­:Ic•˜#ž0	Ï¨£|Q\ÄHqž™ÿ\0\nù¶{ƒ.™	…\È\\\äcš [k\çhýø©PI\Ç\ÌG\ç\ZÉÛ¾l7\n@<?÷TŸsÀ\æžù`¦\Æ?\nÔc±qø~fŸFr	·\'œÖ‘1“1\Ö\'±\ç8³kh#\n\Òr\Ä|R\É$K\"\à‚I\Å\\F\ä6\áƒZ$d\Ù61ž8\Ç‡Œ}i\èQTó\Ðu\ëN%rÃœš¢R\è\0{*/µþ÷§¯[\ÅlCú{\ZaHMÀp	\É\Ûú\Ð+œ¸]Ä†\ïÚ•A™\'\åÏ¯Z–\á\"Nq\Î8Á\ÎiF9 E‘\Zt\Æ\ïsÞ³¯m[o\É\Øs\ê>• ¥¸\æ™6\æ^O\Ôz\n–TN^ VB¸9<\Õ%Ã\Ê03œÖ„P©”»Ž\Ü/\ÐUk\Ø\Õ .\î0k6\Ó+;Œ®I\ç\Õ.c’»~\'f	c\'\Ç?J.\'b¡Qx\'\éXH\ÞÀ°\0\Z™¤Pq\Ä\Õ]²…\äð}*a…\\\çX=\Í\Ñ),\ë€G\áWcŽ4sc¡ š\Êg`01\ï\Å\r32NÑŒŠC4M\Ê\ì\ê	\çVdó®I`H8<vúÑ‘°\àr;UÛª¶s‚}¹«Bc¤ž»šL`\ã9\ãš\à|H!º]Á\Ð\ÎÚ¿¬\Ë\Z[2\î\n~bOpGC^z\îXnvsŽs×’k\Ò\ÃC\í5¥Ð…Qx\r\Ü\ãŽqO_9S\æŒŽ1\í[\ZmýµŸ/\n¹sŸoJ\Ù]WKyK}Ÿ\çr‰zf½\ÎVq\Û\Ý\Èð\ë\ë\îhû\Ï\Ï\Þ\î{t\Ít\Z´öS¤f\Ú\"00\ß.\0+›\\UO\Ê°\ïT¥½ÙŠ\ÚT²\Î\Ã4Ø§ò‡Ý—R\rV\n\ã¢dm\Î\äTX …;A$™ôüh¸ú\æ¤\ìR7Ú‡°\0\â²g¹¹,Ä»d\ãüEo\éñb\"\Çb¨œ\ç¦MAs÷\Ï^9 \\§7\æ¹$¿SŽ£¥+;)+À\'©\â­:ùo\ÐdóŒžüUi+«\ã\ëŸ~y÷ª\Ýuº\ÞÌ¦5l.wC[#¹6¶kp\Òñ‚\Ù\ÏÖ¹\'Qò%E+÷ˆÿ\0w°¦_\Ü\É{©¤\ÑA…CŠ¸\îMal†@\Çp\0®ˆB F!IÀ\'k!d¸Fq°u>‡\n‚\ç\ÄE€˜—¯4¬\Ë\ÒÃµD¶C\àdþuapF¥	~V\é»Ú›6®\'WV\\3œeyúš¥dù¹\\p­UŒ›=²+¬\Ærõâ¯¤¿! ƒŒ‘Ï¥s°	>\ÏòŽB\ãŽ+R² ¨Q‘\\²‰\å°ò1q“ƒŠT•‘{r})\Ë&ür2N=s@`ÀG½G(œ‰\ÎÜœg\ÔsŠ«s|~*\îó\Ó¨¨Ì±\à®Þ¼q\ïM\"yŽ3\Ä\ÑH4\é=JñvS“ŸZöÿ\0\Ý\Æ-Kþ²^8\çò®94¨Ÿ\Ð1\n8®šnÈ¥#€NX\àš\ë|/Æ¯i\Ç\×w\áW.|;L@£\ÃöRÁ©Ú·\'÷ÀV\åtW#G\Ôp5Ä¢5\ÏQŠE`£¯j\È\Ö\ç1XN\à„n•‚Wf\rœ÷Šu[X4ù\Û\ÎB\Â&UP\ÃvH¯˜\ÎXœ\â´/\îežw\ÜNKA<\ÖiQq]\Ô\ãÊˆ\ÜU˜„\Ô\Êz2{ƒÚª€K{g4\ì\à\0­Á­Š,oV\éŸnj\"	-ŸÀ\Ó	£\Ì(8œõ\Å\æ\Ø\Ù0¹Ï©ª/sÞ¤Q¾a÷‡LÔ¤\0Ž}¨°ë“ƒ\Å8s\Æ\ìz\ÐWi¨·\Ô6\âzß˜§·N”\Ì\áMD[¨š\0q“w³“Ò™G¾zŸjM­œ\Ä\Ô\ë#§¥\0GŽ3Ú´\çŽ\ÕdG€¸JM©À cŒö©D#\å<{çŽ”¬qž1¥lý\ß×­\0LDQ©-\Õ]¦.0w¦œ·=¨\Ø6Œv\ëT˜ö\î\ëS¢•ïŠ‡h\rŽ\â§Q´‚\Üv5hM\ZvŽr¹\ç=«M#’\rf[”n	ŒzZ0±+´¿\0žkx³\"üªo\äsÀÀ¯Vð%­\ï–÷6\è1\Â=\ë\Ç\âÇ™À$W\Ô^\0š\Ïûc\Ú6sŽƒ5¼L&´7\Z\ÓXsY6‡\Ó*+B%¾*m\Æ+b{¸<\Â\Ï\"Œ¶I\ÍOg{jX1	úúÖ‰\Î\æ[YkPÀ%\èHÿ\0z´´ùo\Å\Ì9£›\éZ\í<[\Ö0\ã%G‡5»\ÆH\ÃÉ®ˆ«\Ê\ì­¹V‘–%\Îý\Ã\'±¨™\ïG\îKd\àv\ë[\á£\Â\Çe<úU\ÓGi‘]1\ÐÁ¦r\Öw—r\\¼In\ÆP	\Û]L·\ÏoºH‚\ÈBü£ ©,bŠ+T\Äñ]4\r`yô\é[¢\ÊpYb\Þ@\Øcò\åóÓšžy\ã÷x\Û\Æ=À««ò\Â\ê:6)\Ê<³´\ã9>Õ¤Q.\çB«4\ÞTË’LD\î;\×K§+µ\Ó\Ç(l2\ã\0\ã¦:\×!­q>\ìð@C]÷‚¥Ž\ç]·y0Ê­\Îy\0úš¹¾Zr•¶M’“rH\ïtë§´¸µ`žcHûQqŒöÈ¯UNPz\×\âE¶“£beb¼6\Ð3\Ítž¸ž\æ\Ët\Ç-»·@+\æqŸ¾§\nÖ·F[ù&\á{›\ÝE%)\Å6¼³\ÖL)qINüi&(\Å( ž\r! ¢Š(\0 \ÑE\0v¢Š\0x\éE ¤ L6ÓŽ¸â¼¯Ä–šš™nn\ã}‘\Â3*\á£Ú¿7\Ì;Wª\ÐG\ÕÑ†\Ä<<ù’LÂµV6n\ÇÈº”‘\îŠŽ°\ì\'ô\çÚ¸I¯-‡\Û$\à+\ì_xKL\Ö4\é#†(m\ç\r½%žû¾µó>±¡§\nˆñÃ”H\Élœ“_G‡\Å\Ãef·Ló*S“w<k]»U¸•$,2Czq\\±»´žL«I\ÎEzˆ4\Ø\îR\âFE;À\È>õ\Î[h1Z’\ÈEãŒœw\ÍaZ4\é\Öj&V¥,1\èú|œ³\\\\ŽÄ„\Ïþ;\\S\ê–\Ç;w|ˆY†\ÞH•\êšÍ´l¶±cº§\áÖ¸É´\ëug*Š7u®\Z\ÔQ\ÓN´»œ½\Ýýƒ¥´›‰D\n·b	\ÅgI©Z‚H|Œ\ÅuWº-¤¶\Ñ\ÄcÂ¬x\ã\ÖL:”\â=™\æ¸\'N=Ž•V}\ÌO\í+VGmø\Úy\É. f\n9.»†+]¼9da”Ÿ¼\ì\îô°\é\Ð*½\0š\å4i\Z²9\Ñy\ÎUY‰^£Š¨Ú¢ž\\u\æº\ÅÓ †Gp \ëX—^²žS!Lrpx5\Í(\ZûFe¾¥l\Ð<©–E‘\ÏJ‚\Úú´ó\"IúbºX4\Û{XŒHƒ“R‹h¢\0rk>AûIw9³r%£qŸÂ›oª\ÛN\ÄE¹ˆ\' ®™\áG;b«GgC\åP>‚¥\Ä|\Ò3\Zð§.¬8ô§­\â4n\á[\n¤œŠ\×h£oÆaH\ÇZ\\£ç‘Œ—ð¸W\n\Øc´U“2™5\Éb3WLq\à\0:cñ\Z»$h\åvSa&Tš÷™P§<p{\Õüƒž”ñ·4¹\Î\ÊT\ßÝ§,/Ö´2	<f€TŽzS\ä“)$o\îy¦KŒ0\ÊMi©\í\Çz”2\àŠ9I\æód(\Ñ}>”FIºbG©±Œ*%pOjd²\ë0\éš\á<c(_³)<n&»f*qõ®Åª’Ol¾Bö\äSHM\ØÀ2\á3Ž0	®[\×\É,k3*!À+]µ\ã<V¼k—–ô¯½»–wnÛŽ0;\ZÞ•;\ê\Å\íwZ¡Ÿ!\ÙØŽ3ß­W‚;™˜\ìÊ§\Õ\r›»#`Ýº\×gah‘y qŒ\n\ÞRPEÂŸ;1²\î11\ã\Ûy4\ë¤‰\É\î3\Ó5¿AH\ãÀS^H°@p\0ùOÿ\0X\ÖÕ¶oõt•\Î\'\ÌÌ†0\Äõ\Ï»¿øš)\íä³¹pù÷¼\Æ\ævŽ\ë(xÿ\0\Z£\ÒE7˜¼÷­\\TÖ§/7#=\n\ÂüÀó1Uù¤cž½úŠ‚\ïVi6•Ëžõ\Ê\Ås,û¸\0I½«f\Î\Ì\ÜDJœŒ\Ñh NR\Ñ\rRšgI\0\0‚=j©¹fžIY\ÆXV¯ÿ\0`6ÀYúúV}ÆŒ\È\Ö-õõ£š%{9õG h\'VE‚\é€ù‡–\Ù\ÆAõ®þ)P¦ô9\rÒ¾kŽyl\çQ\"¶A\é\Ðýk\Ó<+­›‰\r³¾7N;W5j	û\ÈÞ•[h\Ï[·¸UQœŠIf\à¸\Æk\Éuÿ\0½Œ\ÆF¯‡c\\øñÞ¦«¾KŽ¥d°\ÓeºñG°\ß\ëVÖ;HÀ\Ó×‡\ëòVñ\î6ª“Ž\0ãŠ£s¯\Ü\\\ÈYóœœçŠ„j±\É\Î\Üò1]thû#ž¥Nr›X\Ü)\ÈúQ™£Ïš§\'<ÿ\0Z\ê-\Þ\Ú^Õ‡ùa\í\í§ƒ<¶\î9ü}+£˜Ë’\ç\r1F\0/\\T[\È\ã5½{¤*1xŸ†\0ŒŽ\0\ÏÊkD\îfÕ…\åý\êÐ´‘†W\ÐqUT¡rzô\Î*\é¸UB‹T}\ïZ«…Š\Æ\Øa\Í0w9\Î}ýi]\Üõl\ë\ÏÖšYq\Û\î3¡ð\ÚÛ¶­žP›FW°\ÝÚ¾‚´xö.1Ž\0>¦¾^# €9s[Ö¾ Ô­c\n“¾zô\ÍVŸ´.\å>“+½0Ü‚1R[Ë´´d\ä§O¥xž‰\ã=U®\ÄH0ü/×µzö•p—Ð¬\í0d7\æ¸\'I\Çsx\Õ5|\Õš¯=\ï\Ù-žf(«²™s\É\ÉôW—x¯P¼YÍ¬G1l \à\ç¾jaO™–\ê\Ø\çõ¯\Ü\ÏrLOµOi<\ãŠ\Ëi¦\ÔP,Œ[j\äd\ÖcA r$÷==\ëF\ÓÎ´\Ë2\åŠ\ìŒvF\\Í½K\Ðhó ƒqõúõâ•¼!m+œ^~@¦µ,µHd!S¿Ò¶\ÒtnãŽ•.sL\ÕB\rc\áK‹l˜\äO5‡ôË“«.\å#\Ê$œô\Î:W \ß\Ì“¸|¼Tôp­s1.>\Ãô½¬¬È•8£½°•#NO^ƒ¿\ëY\'Y	ƒš\ça€\\ƒÀÿ\0õÕ«vòJ\ÈrH\â±\Ü\Å\èk\Ê|‡rœ\éR°,œsJ¬“\Å\ÆÓ»!…(Œyg½\éò‘\Ìb\Ë7–K¨\éÁ¯+\×m \Ô\Z\ã\ç£<7\ÜWªjÐ\É\Î1óm8¯»º™/$o\ïI\ï[\ÓC¹ž\Úl\êÌ«LÔ±hš•Àùcldbº+Y\Ò\à\ïn\à®\Æ\Ê@S8À\ã±Z¹´\\ ¤yü^¿~_\0ù­X¼)*\æV$¨\ã\èI\"±P s\Ôö¦Î»”G\á\Åg\í&t*±\ãúŽöR\nd®9õÉ¬\å·fŒ¸9\í]Î«n#v	\rq’£g\nF\ÓÖº`\î‘\É5f\Ñ@\'¿|\Ð\íÞ¦’L±^™\éQÀ\ãžJ\Ð\È_-¯\"“cf¥Ã‘‚H5ùÁ\é\ë\×\Ù#[-…\îxæ–8<\É4¬¿7rz\æ§\n\Ôzuõ¥` VÀñÜ‘W ¹’$`;gsQµ³@q\"w\Ç\Ô_&\Îx\È\éH«šk¨.W$õ\ê\çö•»&œg\ëX*¸%}»Ó•Tô\ìh°®’3!1·Ëœš¬ \Ç#¶sJ¤‘×šfx=H\Í@\Ñ2£¹,qV`aÕ½\ÇZ¯:0t\È\"¥ß¹A²§ô©h´h‡X\Ï\rßƒÝ«Z\Î\æ-ÁF\Ô$Ž\Ü\Ð\â¹\Ó!QŽ‡\0{ñR‘I\ç?\çŒ\Ô4j™\Ð\Þ,\r-»#g-\Ï\çŒW¥\è±\áòx\Ï\âpËºò$\ÜF[òÁ\í^Ñ£&\Ô^™7¦k£\nŽ\ç\\I‘C¸\Ç\×5\Ë\ê…›x8þµ\Ò\n2\0®FúTûD„†lt\àVIs,‚¤\îë¸“Ò£0«c†\Æ*\Ã*\îÀ=;w\\Šh\Ãp¹\ë×·iÙ‹}i\ç[¾\Ýûò1žõ\ç70\Ë²Á\éƒÞ½¤ª*‚##ž2k\"ûI¶¿R²FUù`õ´DªXò†—ª6\Âú\é[þ\Û\æ\Í\×\åNy¥\Ôü=5ˆ.‹½8\íÛ§¾m‹1\Æ?N­9½\ås\Û4Y\ì‘\ï8$r=éºœ\r½¥šf‘0[8	 ƒ¯Y¿a\åv*\Ùù½Er=Í©\ìxî³¥‹‰Š\0z\ç·J\ç%\Òn¶pHW¨8F\È\Ë{\Öu\ä8]\ã\n\Ý3øVð‘\ÓË¡\æj\Ã\ã‘\ÇsM€ }®ƒü« ™7\ãŒp1ß¿5Fx“p\Ær:œ\ç=«tÌ¤jE¥i·Qï‰Ÿ!O^¾Ù§\Úhq	\Ê\ÈIz­c\ÙÝ›I•¾R1óÀ;½+\Ð\ì.´\Û\Ç>À\äÀ­;³žwDñh–±Å”„6\ÇŸJx\Ó,·dÄ¾¸VªM„ŽA8\Æ\ÑP¼j\Ìdd\Ðv5“‘†¦q\Ólñ€ˆ\êzSN‘cs¾\â3Ž‚´\Ö6Û´¦OlÀ¦dG\É\ë\éš\\\Ì\Ì·†\ÖQ\æ÷ð1\ÆA\ã®¶–ó¸ƒW$„N˜aô\ãßš\É_6\ÂO-‰‰\Ù\Ç‹”™Zx\n;®Ñƒü>¢¨\ÜiÖ· \à*\í9\È\ê+§\Ù\Ú.I\çq\ÍgM˜KnlmÁ$N5.E\âK	Á`F9lJÕ„C<}F\Ìõ?Ž}\ëjò\Ê\Û}¡HÜÐ“\ï\ÅqQM6›7’\å¶\ä‚+E+”™\Ð4(üg\æ\ÉP1\Ð\Öt¤GžC Œt«ö×²•’rN	¬\ÍBxf!c7Uùº`÷´\ÊES4*ŒA$—Ó­W’\åfÀqž>¿H¶²HO— ú\ãó©~Ç·\ÕO\Þ?\áT˜Ì§ò¹Àl\ã\ë\éP\íM ‚W$`«»¿sTv’p3€IÁ«º)1\Ñ)\Û\Êõ<}Ot&“€x<\ç\'¨5ó*\á²=OÓ½L³±-–\ÎME£Dcbq\Æ9\éVC¤€0÷\0\à\ã•Š’;\àP\ï\ÆiÌ£\å¾¥t2\ì\è½	\È\Êú\äŸÆ¨¤eH!Xã““OY\åþ3\ÇM½±Öœ$C\"\í\Î{zô]\Ù<ºlœ°\ã8\Ç>¼f«5…\Ä\\I+ªµMËŒœó\×whÆ˜\nHÂ¨#\é\È\ænG\n\"#$2õÇ¦}\èÀœz\äó]\Ä\ÖSE€¤°\Îy\ãð.“r„\äuõ£ž\ãR+Z\ìò\×i=·Õ¯”œ—ùc\è3Á\É\Îj€³ºˆ¨\Ùn€q\ß5pAt1‡ŒŽÆ—1¢d!RH\Êý;ñ\Íf\\\nz`ö\Åt2\Ø\Ü<@,l}>aÓ¾+–	P\ëŽF\ïPI«‹¸JHˆ·8\Æ<q´ãŠŠP®«…ü;\ÕW‘‰Vs»\'\æ\ãÓ¦i\Ý\0 [©\æ¾užÕ‡•ë›µFc%\×,sœ±\'­5N’I\ëÇ©¥óyTnþé©°Ù³ž\Æ=\ÆVd“š±\r§™ò±ùy\Éçš¤5)U~\à\ãŒÒ­ûƒÁ\0cŸÆ®&2‰ Ö‘\ÄTü\Ù\Î?üUòƒ<qY\ÚeÀ-Œ¯^;æ·¢‘dB\Ãª1qhD„/<b‘ap[¯N{S÷ã¿¥$’\ÇBO \ês\Å2lKonûX\î8\ëÿ\0Ö¨\ãGû@\Ã¹§¤ò`òMF’8Ÿœu\'#-\\\Æ\ár¬\Ý3žü\ÔI\àó@\ïS<\Ò0€2i\Ê\èy\ä\àò\rDA&\è%ç·¥5ž|]<“\íW7¡Á T4e0FAæ‹‰#2$žWwóÁ\éU\î\á¹³‚3\ÐC\ÜÔ«{{¶)<œc¡>”\Ùõ™vƒ\Ð\ÇLŠ†m\ÇA†\àû‚\0©ndŽ€\Ú0\0\'Û¥PñLùd“,¼cÖ±š:`\0üò0iFYGZ\Í\Û\'x\îhù>T9‘‹±SX4nˆ~rweG8¦q·ò\Í1\Ü\ì\Æ{\Ô7\\u<ñ¤Á˜}ª»ð €s\ëN¼–\ÆsÒª\Ë(ot$“É«Š!˜7ú\\W4®ø\\3\Æõ®\n\ç\ËIh?úõ\éR|Œ°H\Õ\çòD\ßiÁS\Ãq\ÉÁ\ï^¦¾SŽ¬u)L61…\íÁâ¯­£\Ì7\Ôt\äÕˆ¢\Ã|«·ÀŸa\îz\ÒHvœw\Ýø\Ø\æº\îbÑ†\Ö-³\æp\0%~^3ƒ\ê+>HŒo½Júúš\è¯T\à\àŒ€O\×?!Á9ô\"´Z\É\ì¤S&Ò£n\núžj[»Eµ–6_˜7$ÏŠ¥n\ß8©bs\Ó=\ënþöÄ d \Ã;ŸC\éA%\ëlE\n–†^s\íÞ«\\\È\î8\Ó\æ³\â\Ô\åßµ@\Û\Âûzb™p\×E\Ü3F½rsü±JÀVò˜¿Aô\Èý=iZ6TÝ´e†\Æxõ¨…\ÉHÁ÷ÿ\0w°\ÏqR,\ÙnO!–©Åµ\"m\ß)+ý\îœtªkq3•\Éwo¼NHÏ­^»a\Ìy\Û\Ô~5ŒÍ´\ç¥U„^¥\Ë/`÷&ªK “ŒAL\'!P\ã~sM\Ï$·<Ó±-ˆYzt-ZšC*]¡U\Ëo\ç\Çœ«\È a»š\Û\Ð\Â}¾§\Ývñ\î)2=®\Ú,ªüÀ‚£#·¦š%~\n¯Ë‚*´sA\n RX•Mk§\Úp…Iõ÷W#2c±ö”gõ4ðd$\0¸\É\ã\Ð}j¯™+\í$\ã¯^•~9UŽ\Ò0qŠV\Åd“h|ƒ\éUf\"É…g­[È£’0A5\Âø³VKkc9\r Ç¿Öœcq\ÇV`\Ízu\rE\Û9‰N\Ô8\àõ\æ¶\âP\0\Ê\à‡×Š\á¬5Kkx\Õ“\ëœcšÞ‹\ÄvÒ’\nl¡­y\ÛM\Å#b\á›`ðrk+Lf]J™\nþu`\ß\Û\Ì	G^™ wVÍ•u(3Ðº\äþ4¬Ê¬}\n_\ä\Êóò\äWšM¨ß½ö¡opF>OB\rzB\á£S\êµ\Êj\Úx\×\n\àƒ\ïN\'™Q\Øù¾ûh|y<t5A\Ï…]¿È¹u\é†9õª\î\Ù\Äg\Íü‡\à*BÀ\08¨\ËdŸj78NA\ïTPü€9\â˜	\êpÂ˜wq\ÇCRð:dP\0	\èA\'µJŽ3\ß5_zp\à\Äq\ÇaMe¶\ß=1U°s\Ï\ä)Lœc<Ò’}i\È)=n\âžv\îÁü­8?\'šOq]Š=}A§o^9\È\éP\ï+\ÔQ\Øö\éŠ`X2Œô\ÅDe\çQ62iq‘@XV|¨#\ÅGŸpy£•\ëL\ä\Ð˜\Ïü3Ú¥/•ÁÇ­V\r\Çò\Å8¸\Èâ€±<x/Ö§—\äŽªAðqV7ðƒ&­1Õ¶F\0ƒ\È5d\0\'>µŸc$ž}=jc/>½«h²\Z7lÙŸ®<‘^“± ´Cc!_-TÏ§¼š	·cZ\è-.\å³u(\à6:\×M6s\Í×¯å¹¹F\Ê8€\Z–\rn\éd,“\ÈTg§Z\â\ÍÃ—fa’\Ì\Ì[\Ü\Õ\ë?8[\Êé’ª¥ºHNNk¦M‡‰.Ä±8—\ãk¦Ÿ\ÄsRIQ\Ï\Ù\Û÷ª€öq¹¾ƒ9¯¶i¥•_\ÜdûW_\éö`\Ä\à\"dú0\â»)¤\Ì&Žö\Ç\ÄúŽfe˜“Ó®+j\×\Åú\É&$•›¹$ö\ÃGs–¡Nñ\É<ô©¼\å†\ë|mÁP¤ô\ïš\éŒQ\Ï#\ÕW\Ölnc™\ÞFR\'0P‘ø‚+ \ÒüY¨4¡$—\æ\È 0\ã\æ®OÔ“`V>g›\ÖlòsÇ§&­Z\"™÷…Bø¦º¡\Ûda#\Ö\ÅWV¶\ÂB\Ê\ÛJ…\ÎrNK{qXðj\rt]I##ŒŠ\ÃûBµ”P£+|’\Ü\nHÇ¿Z¤\Ö\"\Þ\åZ.§\Îq\Îz\àVŠ‹žš|a©8‚>›2F9>•\Úøg\Å×¶—ŠN7þ\í€u=\ë\Ëôm=Œ&V!1\ì=ù\Ïò\"º½\n\Ñc\Ô;—XŠ€\î1¿h\ç\ÐVŠkc6\Ïu“\ÇOx]\n¡ÙžI\Î~µ\êþ\nñ„\Ïm§\ËIfB\é´\åGÁ¯–\ä\Ó\Ìö\ÍuK$¡W»\ÃsÇ¸\Åuž\Z¾º²¿°2°V‰”;ƒŒ\rÛ¿.k—€£Z„£\Ëgg\Ë\êiB¼©UŒ¯\×S\ì£É£r$ª2°\È#¡ ¯ƒj\Ç\Ô)&7¥8t£ÞŽ´‹¸\n)xY¢™¦È—j\ã š\åŠCF1A ¢Š(QE\0QE\0¢\Û4\ÑL•ˆT3/¸ –$¬\ë˜\Ô;\0J©8\Éô\Í|±ñ9\×KÕ¦ò\í^\Ý$´Y<²>T+\×n:æ¾‹š}r\Ö\é Ž+k\È\ÉS¹¦ò¥U9‘‚¯ø©y.±§A=—ú\"\Ä\ë‘¹\ß\r&ûÀb½lª\ë––”]õ<ücNŸ£>^\Ô|H\Æ\ÒõŒ[|«w’%\'Šš\å—\Å\È\Åb1\à°\àó\ÔV·‹-c_µD€\Ì.`¹¶\Î6üŒ¼‘\\¶“¡	\ï\ì	^Y7ù\0Û’Äº`W\ÑÊŒY\çÆ¦†—‰<io«rˆ€$ gý\Ú\â.|{m²7“†$†À\èjŸ‹­ ›Yv\ÃG-Ë²©9\ÈS€W\Û×“\ê#/–Û±‰\Çk†µuÒ\ÏO¼ø‰q¤†\à\îõ\æ°\åø™\n>F\àjò\írcpc\ÚBª®€\0®]Äˆ‘Ê‰{šó§F\ØéŒyºø›n±\ámÁù¿#Ò³?\áe\ÂX¯‘×©Ýž}«Å®f?{w\'Üœþu–fx\\7FGNAâ°•v5Sg­\Ü|Oœ‡\Äc9%s\Ï\Û_‰\ï\Z¨žø=A¯gp]\Ï\ÕYw!PªŠ\ç–ŸcE6{³üSµ@3o\ï\ÕTüU€H\ÄÁò\à`g\àò³3û\Õvl‚y¬žŸb¹\Ùô|T´\Ïü{\àœ\Õgø¯oŽ-ò~¼W€1n¦£;\à\æ²xxv/ŸA\ÂÕn~\Ê\âj˜ø¯1¹m\Ö\Ñù}‡C^—\r\é\ïJY³\ÍO°‡`\çg¼Ÿ‹j	Å¢—#-N?\Î\Ò~\Ë\È\é»\nð\r\ÄŠ]\ìhö\ì\ï¹\ï\ÍñiQ\ã\Ôs\Ð\çù\Ñÿ\0dÅ²Àjð=ø\ÐóL,ý:\Òö\ì>f{\ßü-§\Ùÿ\0\ËÏ¿LP\ßÜ®D(¾ÇšðBùh9\É\ç>´ý„;ž÷ÿ\0f\ã[§^Þ”óñbLqŒŸZðhw<Èƒ’î£¯­{\å¯Ã-‘yòŒó\×5”¡ô›!ÿ\0…±v\å\Ýõ¯Aðoˆeñ”—.ª¥\æš\ç€ô\Ý?M½˜n\Ý\Z\îR?•tAþÂ¹9Ê›–\çŒÒµ\Ð)¶{?B¯*øy$:ž†«’%‡^+\ÔóòcŠñ¯ˆ kh\áŽ7\Ë}3œÒ‡\ÄT™‰§ž\ÛD”¦s!\nq\ï\Åxfq7\'?S^‹\ãMJBö\Öù\ÞJo ð§<\nóÿ\04ÀPùG\ÆG\"ºc¢%#^\ÏQXoo^œc5¹¥m\"?Í€;w®=®\ÖEg\ÐúÓ­\î0s‚@\ëC\Í\áQ\ÄôUº·tR® ž‡¡ô\ï\ëUµ¶bOc\Îpk“†Ty‹K–¸À\ä\ÔÓ’2¨\í·õÖ³öJ\æ\ÏÚµ‰t\n]m®_—´ar3œ\äþÛŸê¶¶óLvb\ÜTX\n\ê|*oº„²>?½Ú½[wx™Ü»H\éj®\Ñ\Ç&®|\én\ÃhE\Ï\Î~cþ\ÚiAcU\nsº–—.¨¼S)œ´GžTúWAbÀ \ç¸\Í)»\ÄÞ…®tx\Æ8\â²%Cò\0­$¸&\\c~+*\ëPŽO–šB	\ÇCYEJ\çd\åŽkU²2~ónð\n\ÌÓ¦š\Þ\ê5F\Ì\Ûwc’Š\é\ä¾GV}€8u\ÆMs7Q$$r t\Ñ†¦ú‰´»6\É9ie\ç$þ$\×	`lðk^ö\ê[¨\Ð;Ù…ù¹À«úuª\\BN\Ì(\'Ö©{¨•«9°sóv¦\î\É\"º©lm\çc\å¨U)Œwª‰¥Û…}\í’3\ÓÚš’+1¡žHXz\Õ\Øõ”\Î[q#žjƒ\Å$-µ³\ß\î*>ô«Ñ\ÛG@ú›jsŒÿ\0<z}+:ki·\Ú]Vs‚G¦\Ø[µ\Õ\ä6\Ä\à;\íÏ¥{¥\á!s¥¥¢T„ö\"•\ÔL\å#\ÄÔŠRO@¸\Ç\ëV/\ì.4Û“\Äl®3Œð\rñù§\çÖ®\å!‘Áq9\Â.y«2i\×0€Ì¸rs\ï]Fš±G¦\í#\'ü*\Í\É„˜u#¿“©©Ð©^786‰Õ‚’0q\éLV\ÚO\ÝœgÞº\Ô3Lü¤z\Æx1¸ŸR?óU{£)FÅ½:\ÏR{¨\Þ$\'­{÷†mn-\í\Ø\\\0…Ÿv2Mr>»·½€\Û1+4:|\ÃÚ½9!\Ú\Ä\ï=\Æx®jº»	;2\Û \Û\É\Åx§ŒCÅ­\Ë\å\ÈAl©ìŒ¬@\Ëo¡¯\Zñ\Ä)¬9+ó(\Æ}Gbj`µ+š\ç4^\ãb‘\Ë~&…¾•˜u\éZ¶·ÖžYGR\ÍÐ“Ž•Ÿ¨^,’l‰@N+pö\è0¡\ïj•.eP<¶\Ü3\Âç¯¹¬\ê«÷I\ç<\à\ÕûD~BCc©\àSi\rI¢i\ï\å\ÉÝ’\ßÅŸJ\é|5 –)1Ø‘Ÿ|\×+4AºHö\Çù\×x>\Òib‹üaOøŠ\ÊiX™\ÚÛ¤„\\ž\áWe³p¸\Î|RAi4R†~0x­A!`29÷5…Œ¥!‘f4À\'CMyv®\ï|\àu¤g#¡ü*3½\É+Þ•hÉ²‰Z{W\èIÛµx-ôA§trw+\ç¯\ã^\ê\Ð\Ëc#k	\Årúÿ\0…M\æù\í\Ô	@\'ø°yüqZ\Ä#3\É`žh&\rŽF@Ï¥n¶³+©	ÀŽxÉªOi+\Ë\åyE\\pGqQýŠ\â<\ä1qZò\Ü\ÕThß³ñaQÀ\Î0\r^>#$\à\0\Ã?…r‘\Ø;6\Õ`	\Ö\Êhˆ\Ã?\0§Ž*•$jªÉ•õ\rP\Ý(Q\ÇSõö¬‘¼Ì¤†^\ÃoÒºlL¥”~\ëV™\Ëa\Z%Û·°\ÎkHÄ†\î\Î8Î	‹h+\ëY\r‰÷‰\Û\×X\Ú\\¢~\"÷Vd±\Ø\Û\Ú=\ê\Ã\r\ê*\ìfqQC3878Uß²N@+ƒ™º8¯A¶³1[n–#‚qD\Ö÷Jža!°s\Æ0µ,,p¤\Ý\";¾\0aq\ÏZ¯j!QIÙ¼Þ•\èiiö\Û\Üpk‡\Õ-\rœÎªK¯zBj\Çqy£\Û\ê»PaÀùqšó[«Imfh\ä6	\ï]ß†µ/6!\É\ÌjB‚*ö¹¥ø±®d~\\’j¹¬\Î\nx,\áòzcúVkœ1g½J\ÂHX©H#4\åS\ÇlŠL\Õ1\"‚Y\ß`Àçš¾öK\×#\rŒõ­‹9l\í-wg\êq\Èúg©§[^\ÛO6Ë¡·\æ\á8¨l´PM\Ò)%,\n\à\äs‘Ò²²9N{WO©]*\Ä\Ñ\Å\Â`\çiÿ\0µ\Ë1ù™°FM=\Ð\Ë\r\ß+GON:æ¬„2\à\àuö\ÍR)\0n÷úTð;\Å)+À\ï“Á¨c¹n\Z+õr[\0ò\'\×5\ì:P¹\Îq€=:×\ÚJ³jP·\Ý\Þ\Ùc\ì+×´¢X*‚9\ë\n†SgFò²)d\ÆqÀö®\Z+¨¥¾š\' °c€N3ž£\Ú;nP9 \ç€1‘^©\Ý\Ê5F•|‚:ý}ª\"‰=N$‰0X\ç\'Ö¤kt)”U\Î3ŠÆ±¾À,|•\È=«I.ò£rQ\ïZXÉ~)\'\é\ëH—#¹\íõ\ìj6¸¼g®y\íJ%V\àqLƒ?Q\æ\È Œþ5\Êh 0v¿P9<\×a}’\ÒGœñøqùó\\\æ—…°y<„v\Å)AÓ‘%U\ØIP@\é\È\Çl}jNsok1vùvœvü)4\ÄO-\äNG°&ªk2m*?$\ä@Mek³¦Ç›Ç¬¼3\È†V<\í\ßò«·\Z’\ÜÅ…#Žx#\"¹\Û\ë)-%`@ ©\ë»Ú³\ã‘ÀÊ¤\ã‚q\ÓÚ¶ŠF\êföUJœ—\ÆxšÏ•J¨8ÔŽ\ØúSb”ô,ynx\ä\Z”\ä\äóž½kT„\ÚfL¨U\Ë&\0\Ïn U\Ý.\ìY\Þ#¹;_ÇŒâ¤¹–\0U\âOSÑ±YE>*d4{ô7Pù‹\Ê\àŽýþ•`O³\î\ÇÓ ¯1\ÑuI\ì\'r1œg½zÝ±E*£9\äzû\n\ÆJ\Ì\æjÆ‚3®	Á9<\éOv’U=A~\\\Õ&¸€À\0uo_¥8\É9RO\0ŽØ©$‘Z\îw•%2ÇŽ•#®B\áñ½ïŽµO.›xÁ9ö#Ò.\ä\ï\Ø\î\È\ç®\r&Æˆ\"óm\Ël\ãq\Ë\é\éW\Ù\ã¸^I\à\Ã8Ç­Q\É1\n\Ø\Üx\Îzzæœ–\ÄH¤žŠx\'¦zþ\r–…˜*·n6‘\Çµcjº`\ÔT€@˜p\ÌGS\ï]½¦˜÷\ê\Æ8\Ýõ­KG´’H§$`j‡S”\Ö4\Û<b¸µ‘¡ebpp6ö\é\Ïj|6\×^wü{H@\ã\ÓÐš÷÷·\Ò6“\"\Æ[¨üóUC\é\ê@1rsÐ­?¬y\Z{&yµ\Ô.6\â\Üç§¡üýªcª1Pb$d…\êk\ÙMÅ“’v€FfÀö÷ªFh‰$(px\ÉaG\Ö<ƒÙžJ<?ª\ÈÍ¶\Æq“Vm´\èŽ\áb8\Úx\É\ÅzoŸ\ãŽ{ö¦¤§«\Æ(ú\Ë!\æóx>òC½Ž2GQš€ø7REfÞ u^8õ¯TŽyU~\à?\\{\0i\Â\êA÷”úm#\éK\ë)@ò”ð~¦­µŠCzûWÇ€\ça\çŽwW¢¶÷`d\ä}\ã\È=Á\Çjp–\ço\Ê\Ä¼ðN{\Ðñ+óøü\\órz5X_\Æ\0\Þ\åŸ\Ð¥v¡¯xe\È#Œ•¦\ì»\ÎNqÓ¦*]y÷!‡iá˜­02Hô\ì=\Íi\Éö6\Ñòõ\ì1S¤s¦\ÐN\à½žŸ\ãS}Šo›ý\ì’8<\Ön«}CÙ¢ \Òm#‘‡Qœ°ÿ\0=)^\Æ\Ü\0@]­†Á\ëóUß°\\¾òN\ï®~•\\\ÙJÌ 8\Î\ìÐª!G\ì\Ñ&ß“8\é¸/J¾Î»¼\ÆA\Ç=¸©e\ÓNfm Œuú\\†·,v\ËåŒ³œä’ry­ Üš%«úÕ¬1\á6±\ÈPqŒW™^\\™œœ`óóƒ–õº\Ógº–S\à\î\ÏL\ÕB¹\Ï\Þõ÷÷5\Ûa\\ú(Á\È\Ï\Ìzs\ïô¨)•\Ú5\ç\àö4ep$\0@\"Ÿo*¥Àé¸ƒŽz`ñ^pI’H\ßrI8÷4øÀP¸\Îi÷w\È|\Ýqƒ\Ø\ÓFHõ\ãŠVÁ\È|û\nŠ\æAŽ2=Gjrô=AïŠ«&òGC†\èO zŠ¤„\É\àÏ˜¯µkEs$K¶3»¾µõ<\äõ©Rt‰\Ô\ç\è1Þ®Ä´™\Ô#\ÍAœgŒ’M>\ßq]\í\Ë`œU{Fzc\"§·Lc$;Òƒ\'T7\ÎGAƒø\Ôj\0›¾:~tÔ‘Y1Œqõ¨\ÖPf\n3“ß ¤M\Ç|Ur¬;1\nTž•JAŒ\î\0c©y\ï@¬XY\ÞD\0\ã=«*òñŸ…;FpkM$„¦C(8\É â¹™¥¤ r9 ÔšF#K®A,z÷¥26Fw~\"ª»\Î§¥$NDˆx\'\Z?1Á\Ú	\Å1_rNi8\Ø	\0J¤€BŸñ¬¤bH\Ç\r\ÆI\ÎG½=®n$UBŒt¦Gó2–=:À\Ô^kwlÿ\0ZŽSDÇ«:\0	œf½ùE$\íP³>:n\É\Çõ¬„E>^‡4(‰³2+,\âGcÁ\ÅR•3“À\çðy§ØƒŽƒ<wú\×©\êÏ½\Õwdt\í€{\×E:Wf2©bö¡yCœõ\ãð\ë\\¡*\Ò.9\Ï^ u\Ï\ãT<\Çm\Ä1f\åª\ÌC†\Ã\í|{:š\ï§MEò•\Í$9@IÀ\Ï<ñ\ëZQŒ\ÄÁ²X~ž+šr-ƒm“so\Æ0\ß\\\"’Ž\Íõö9Á­R!²þ¥\ÈÛ\ê	\Æk@e\'¨-€?>x«73J\Ø.w\Øõ«¾²K›\ßd¢\ç·_»ZÉ—lôy’w6õ@zb°§t;\Ës\Ï\á\Åw~#½6öH‰ß¸\Ç\0u®\Ø,²Æý\í\Äu\Å-H\"ŠW%\Ç\ê7v¢dy[8\èsÁ…toN<aHwÇ­GorÅ“q\Ç®Q\ÎÏ·8\éNBK0\ÆÞ¼ñS]<V#1m‰ž Ž½ø¬[¹¡rR\nŽš¤\'¡EØ˜ðXt!qÞªnR	\Æ\ãß¶kJ(\ÞGp~`¸=j¯s	‚VV\ìy=*\Ó!²‹\íx\ÎI\Í4\È$*O—-¸†¦L¿;·q\Æ`)\ØÃ“\Ü÷®¯Â±´·\ê@\àþU\Ë\Ç“8EFc\íÉ¯GðÖžt\È\Ý\äÇš\ë\Øôö¬\ç$‘7;\È\â\Ç¾Qƒ\éHcf~Nj²1 t\ÎOÞ•g\ç\ÎA\É\Ü	5\ËrZc“ŽÀ\Ò2J¨O\î\æ”O“µ[\å>ýiD\Î‘·’G>´\\M®nnbˆŸºv\äµx†³¨É¨j3;’0J…\Ï\0WªkÚ‹Ác3 \ça\0\ä÷¯}\ÌÅƒs\Ô÷\æº).¡[\Ö $\É\Üq\ïR½×+9Ú¤õ\æ³\Ôm\Ç f–R†\Ìk~Sd\Ú&3¸ûŽ*\Ú\Ñn™o\á\îù×Sš\çp00\rji,c¹Œ2u©’f}eo|ñ·­dk$›7\çSW\ì\\5¬D÷Eâ³µvÿ\0D—$©œ`\ÖsŽ¡òö¤\ìn\å\ä‰\Z¤\Ù\æ´õw3ƒ‘–\É\Åd|\Ù#5\Õ¡P`\0$/5\ÑM\áQcŽT]\âE\Üpk\"\Ú/\Þ\09\É\ÇN‚¾˜±µ\ìmŽ\0>X8þb“•‡&|\É5¼ö¯²d*O¨¨7}sŽ=\ë\èhÖ’Z\È\Æ%\'k3‘^p<¹ˆ\Õ\ÆW\"2¸\ÂÃ·\çŠN•9nG›¸úV†¥‚A\à\ni#+€Aõú\Ô`ñK¼œô\ÏjIž1šP0y\ÇÖ£3JH\íø\Ð\ÄHXã ¥=}½*5|žsRpª<TÝ–\ÓJoQšw\àóÚ˜_ô W—\'\æ\íI\ÓŽ½i\êpß½4qž({ö”sžx­\',zK9ªÁG\'Š‘6õïŠ­’sNV)¦KE¶#v\ßNsB\å›i9ö\î*¾sœ\Ô\È\Ä0ùx­%—­Ûœ/nI=\ër\ÎDóP_a®~†«M\Ìn_\'##Š\éƒ1ž† /2:\ÕÑ¦wqO2n‰_3\Æ\Ö\àÊ©\Ù|\áÁ\Ï)\Å]`»!HI\îH®¨=Žw¨\ÛC!c\Ùóa±ü5Ô½¸ý\É9ô\"¹kI%L¾\Ó\íš\ë\ÓQVŠ)H\0•A\äez\Z\ì¢û˜\Í2\Ì$\Ç\ã¶Ž}*ý¦\é%\ÆC\r§ñ¬Ö¾A1•ýjÖŸpªO9f\Ç\'°®¨HÅ£¢‚9UR\äªý*\Ìr\\.\ÅVfP\àž=85§ [} Ì®FH­v\Ð\è\Ö\ÑÂŒ€C“]©drOFs‘I,R\ÆûJ¤€²\0;WC\rÄ—÷\â«´B[Œ„\Å\\¸\Ò\ãx\×\Û=Á9­-+K·i\Ñ\Ü—Š\ÕTLÉ³GH»X\Ì19Ü›X~<VÝ¬ \Ë)`d$°\ì3\Û\ÛÒaóoö\È\Ï5«²E…€8^3õõ­£36oZÜ™D¯·	’¦3Šµò;$PœýOqšÉ´U\\ôSŒL‘Š\ÒDŽ\Þ\äaò¡AkNdI\ë¾\ZñG‰m‘,\íœLˆ2wŒ„\íZ¯>£\'‰„\Èq\'\ï^yð÷Q\Ñm\ì\Ú\Ý\Ìk<¬X»ÿ\0¶MzöÞƒg!„\\ÂŒ[,\Ô÷8¯”\Ì\×=i\Âk;ß™-\Ïc>H):º+:0Ôµ\ÍÁ®\Ú]\Ý$0>Q‹(}{\nÐ¼\Õ,\ìµ\Ì\É\Z±Ÿzñ\Ý\nªJ<Ž\ï[Xô–\"›W\æF›n#Žµdšš\0·r@ø\æ@A\'Þ¬¥\ÄRF6Ü§¦+2mv\Æ(ŒªZQ¼§\È3È¨P–\Ö)Ô†÷7¦‘Š¥c{\ì{\ÕY}^\Î©qiØµ%-„\Å4´•%‰ƒIN4`b€¸\Ú)\Ø`\n\ì@qNÒƒŒR­1÷z{}\ì© ž4Ø®’2|¹\Îk€ø¹~º…£…2\\\Þ\" $Ë±œW«ž†¼O\Æ^ñ‡‰õH\â0À–‰³	xNpH\î\rw`\\\"œªMF0w\Õö91)û9(\Æ\îZxŽapŠ\Þ[–_8\")Û·xÀ\Ï\â+3E\Öo ¿…\í\íñ=¤r¹o¼\ÊN\ç\'°\Å})ñ;\áüZ>©YD§Oš\0\è6`¤Ð€³\ïõ¯\Òt1mi«Ojd‡9 6ò}m*°¯J5#ð\É,”©\ÍÁ\î™óF­ªIø_—DõUNÿ\0‰¯7¹IM\ÈÝƒo,Ã¾{s^¨i\ä[\Èg·\Æ$o\É<v®u“s©=Kcÿ\0­\\µõ:\è\ÉŽ¡—º!p\nª¾ÀrjKI¯/#Ž2]\"F•=V!¸\æ·\ÒK‘,‹\r\ç¦7­]>\Â;^¼hÙ¤š8¬mIm2°–cŸPª\0ú\×\ìt©¤y´\ï\æ\î œ\ç zœ\Ö<©‰˜«c\é\ï])\Ó.³\è:*ÀðÖ¥%«\ÈPŽø<\\²h\ÕMdª\Ê\Üô$.EE)“\éÖ¶.ô\á\Æ1(p˜±Œš¬ˆù\Æ+i&r\ïÔœ\ÔxÊ“ž•\ÕI¤*i¥\Î\Âd¹\ÚFÿ\0^²NœÀcx\Îk&ZšfGñ\È\ÍFF\â0:[Øˆ\È\nÛªÞ \\\ê²•d¹\éô“c\æG7†¦·5\ê#À\ÄðH\ç½rZ¶•\á·Fc°\r\ìEgÌ›)I3˜„\ã­U´E”n9ô¨®-\Â\\\ìŒðOZ.YC\r\éG¯ªm£z\Çôª\íkµ2ý©\\\n Ž´rj¹-·”¨\Ýw\Öö‡\áö\Ö.¶†+\Zr\í\×\éŠMˆÁ°}õª÷3Gƒø\×\Ù6¡D	\Ç\á_<¿ƒ\Ú\Ò\ê\ÒXœƒ\ç\'ð\ç½}Ú€c\Õ\ÍQÝ¡\\\Âñ`¡j{@Ý«øL®<:û‰®]‡\ã\Çô­\ï\ÔI ~\äò{VO\Â\è\Êxi<\Í)úóX=†·=5«\Ä~,J#{,g%½¥\Ø\0+À~,JÍ©YÇ“´D\ç\é“E?ˆ³\Ï$¿{›«9%\å¢\n½88­\é\ìü¾h{t Wxaótý+¦\Óu™-mZ&ÁCŽ\Ý	\í]M;\Z\ÓkfFlá \0§œ\Õq¦-Œü\ÍuQgOh<·M\î{ðy4ù4\Ãm—\ÌÏ¯±ô¨m\Î,ÄµÒ Š\Õå‘‰!ðªxŸ=¬±|ñ¶G\\\å]\r¹šþN\Ô-\Ý~cÖ¢¾\Ó\'µV21–9£˜‰SV*xfE:õž\Æ\0\ä\îÔŽ•\î\è¹ÝŒzúWƒø6\Ï\ÎÕ¥ŸÏ¹\'\î±4daqÛ¿|b¢L\ä’9¿hP\ë6©ù^3”~…My%\Äsiw\Æ\Ò\åùLÃxÈ¯{fLý\å\Î=k\Å|{—¬\Ä\È0r:fˆ\ë \à\Ú3¾×–lx\àç±¦ÿ\0h\Ï@\èq\Ü}=ª­–$\äò\á\0\ç$ûV”V·wF\'ãž½³Zh’”Œ½G‘\ÜYûö50\Ô¾\âõµ..d\àõ\Æz\Óâ³Š\Ç`XØŒûG:±™Êœ¹,br;ñ\Åu\Zd\Þu‘„\äG¿F8&¬½ª\Â\èë‚„tô>µ=\Ëh÷Œ\î¸\Éšw\æA\É\ÈkÞ­­”`B\Ã~>‡±¨!\ÓÁ„\Êòpü“ŠÊ¸»·»Ï˜1òñ\É\ãÿ\0\×ZQ\\ ˆ\ìa÷p=(°¹‘N\ê\ÜKj\åñ¸g\Ð\æ¹^P\Ö\å\Ý\Ì\î\nº3‘\ïš\Ë0Iü#½h´FRišþŒ¾¿e÷r‘žqÖ¾†gýÏ©\Î\rxß€\ì¯eº”cf=9¯kS¯8\ãŸz\Ær\Ô\ÆH\á¼M¡ZÁÊ¦g‹-\Ç$\æ¼Z/\Ü\ÈTƒpGL\ZúrF‡nwšñ\é¶ö·©qn@YPnQ\Ç#Öœ%\Ðp0­\ï•=~£5|ê· cu¹7$ó\È\ç\'©À£ð{ö­yS:UFù¯!\Ïs\Ø~L\É	\äõ\ÉÁ\ë-Yay\íƒÚ\Ä\à)\ØM\ÜØ±¿—M»Š\æÓ¦zžsZô\É>!Bm‡•,§\ï\é\ìEx\á?6?ŸL\Ð\0u=*eg#\Øl<a%\Ô[\Þ`²\Â\ß18\Ø\Ë\í\\Î·0\Õ.e¼ù@|qÒ\Â÷\æ[¼¤ExN\ä\Õ9¢}ò*¿øü8\ïP’%m\ã1T±bHÀ\ÏåŠµ\"\"Ÿ<p1¶­\éVÁ¦ß»k‚o]\é*n*¿3sNö5I´q¡–)2QH<cñ\Æk¢±¹±ž f28\è?Ò£›G“\Ë\0);›¡\íõªqA%¼Œ…\ä\Í*\Ö-\êú|1lž\"0A;z{\×}\à³i’e\Þrq\Ãf¸YRS\'9ÂŽ•·\á{ö¾Q\á£88=*%±œ\ÏHbŽG\êS!•z±o\ïc¯½gù\Ø\É\ÎqŠ.d\0sœ`\ÌM\r€»ó¨\Þ6A‘œñ*te™I\í\ïDŠB\ÈÕ’\Íl£½µ\Î{c¯5XBmß¼~U¡bH…†pŽ*¤–\Åw\É\È \äþª%˜7z\ró–#\Æ\ã\Ü\\=\îŽö÷rFFô<®?<W¥yOt–\ÅI\î;\Ô:ºˆ\ØÞ„úWE29š<\él\ÐJ¤¦]\ã‘\×\ë[pC\åDs\É\íø\Ñ%¯’^0\ç)·B\ÜùL€žFH®•h¤\ÉÜº“\å\ç9=85û;(p\Ì\Ûy\É÷\ë]{OÀ0qŠÂ–#\îP3\ß<õ\ëŠ,‹L„€\íÀ\ï\È=\0§´`\ÂôÀ\æ§H\Ýñ\Æ\ÞF\nÚµ†9\0W\ãŽx¡\Øw9vA2¦\0]¹À\ÛR\ÌD¶\íÀÀ\í\ïR\Í•<ˆ[„l.;gù\Ô\çO¸\ÆS5\r5Ž8X\Ý\Ã)\Ø\ä) ‘\Øb¦{TÍ¹q·$Œð+©K£|mœž\ÝM:kN\\\0ö\íôæ•Œ\å3•ˆ\ÚÁs¸8,GJ\î´\Ùô\ë¨ÁP2	n•\Í\Íá™¦\Ë<‚x<}1[:6“ý›À\'\åëœŸ½ÛšLÅ³?Ä¾±º\Ä\Ñ‡¾=\ë\Ë/´\Ñk6\Õf8\È\ÃW¿\Ü\ïq…N£œñ\\^¥¥\Ã#ñöú÷\éY2\á+L¬¼«ž\nô\ÎsWR$<¨\Î;gƒŽ1\Ít\ï¢F‡;zt5=¶–e8tm\Ù,s“žMI§9\Ç\ÌFŠ£\0\çy\Î;UT‚\âc„RqŒž˜Ï¯µzŒ:L1»2\ÂIúó\ëO{HW\r°$™<qJ\âö‡#‡H¶\ä’\ßN	#¡¬{&úÙ‚²d78^r+Ò’\"„‘\Ç×¥8ª\å…û½8\Â\çgši¡~Ü¥‘Â¨#\Ü}+\Øt“òA\à|\Ç&¸²Š=\\‘\Þ‰ãžµ\èz`>K\0F1Š\ÎZ‰\Ê\ìÓžR#ol\àô¯\Õbn§*Cc\ã>õ\í\Ó3\Ê[Œ_Æ¸\çðý´“<˜\r–\à÷\Å(¡©X\Ã\ÒX¥¶\Æ\0À$u\0r+¨†% 3p œ\ä\ã5Z[ÀÀ\ìù±…5}þQµ÷<óZØ†\Æ\Ë\np¸$\Ïû\Z¦n£V#,À{u­h\ì9\çžSžôÄ²e\\(Ï¯©¥bnd\ê3˜dÀnŽ Ž‚²ôv|º–ù».=85­ªº\ÛÙ¾\ÅùBñ·\'¬•\â.¼œñ\Å&R;k\Ù]\ÙN;W=\â/ž pa[ºbA?^9¬Ma\É1†*\n¾}8\â¢Úš_BŒVq\\C\åÊƒ’K{ô\Æ+\Õ<7,L^ÊŒþ»¨\"\ßnó\ï\Î	\ÇJ“h$Û‰9<Õ¦G;Lñ³\rÅ¼˜lñÙ¸¦4ŒÜ¦w\Ï\à+\Ôot\Øf„…MÝ‡\×)>•\ìWhÁ«L\ÑUG(°+\ä;;RyhŠ¸nÝ²t?ÙŒ¸\ã†\'\îúŠª\Ö 0J\ïÁ<Œ\àU\\¾tÑœ¿\ëFÁ’NGÖ½§ñ1\ÆVVÖ©’Œ22¿<V½»FcÀrO#=\áš\ÊN\æRw4þ\Ñ#‡pž)žd¯€Ü¨\ìxTD#Û€…\ç9\í€)Á€U( ó\Ï5$–ŒòÆ¿ \ê§hõ4Æ’F\Øy##œÒ I¹q“‚{~$\Ô\ê\çv\ÂJ–2¸w<ö?\\T±‰bF<\äõ«p\ÜFO\\Nß¢ûV³Dó!m¥3YIšÁ]U•ch ¶Ý‹Ž\Ø\æ°5JyŽù\È\Ç=\ê•\ä\ä¶úr zƒN´±,Au ‘\ë“\ÆkšGtH¢·–b§q ž+U4õ\É\ä­_XvƒÊ©À§™)»\Ó5-\"¨²A\Ôt\ì};\æ¥ml¼ƒxúb¦ U\ËnÙ \Î\nPŒŸPOôÉ¥v!þÌ€\ãpÁ\0ö\ê*A§\Ãlt8\"¤ûTG‚\ã+\ÔzóOK\ÈÀnO;q×µ&\Ä+¦¨R¹\Ï\ÆO½bˆu8¦N*Ù¾‰H eZc\ßFrF\Ü\r+°#6ñ\020\0\ç\Ûß³\"œ2OL;\æ™-\ê*‘€zñŽ¢ ]@ –\\\íç·¯½=l¥…U ƒ‘·\ØóK±Fn<\ç\Ðû\Õ}–l’@þ.yïš‡\í„*qŒ\à\ê)]Œ\Ó|dv\È\àŸZszŒúö/ø\È\È\0Ù±\Í3\í9s×“\Ôñ\Ï>õH\r½\Üe~SŸ~õ]\ÝBŽ˜-\ë‘×¿µd´ù.W<dôú\Ôotï´®w\ß5I\Ç\êw1Y[•\èB£>¹¯\Õ/å¹•\É*z\î#ŒŒûWi\âK–q–\Ï\n=«\Îel\ï \ê}\ëÐ¡\r.e-È\Þ8¸ü=\éNK.A\Ú8\èi[Î“o\'¸=A8\ã­u£3\ß\áÿ\0Qÿ\0l…d[ÿ\0ªÿ\0¶\íÿ\0£W\Ï=\Ïl¹ÿ\0/pÿ\0½/ò5v?õQÀh¢‘D’}\Óþñ¬¡Ñ¾‘ÿ\0Z(ªD–\Ýo\Ãÿ\0BY\ãóþûÿ\0Ð…U£úôÿ\0\×Akþ¥¿\ÞZ(©dH¿\ÜõÒª¯ü„›ý\Ú(¤A¤¿\ëdÿ\0®²\åû¯øQE1˜·y~‹ÿ\0¡\Ô3uý\ÓE§\ï¿\Ðÿ\0:­ú\Óþùþ´QR\Ê7OJ€ÿ\0©ð¢Š‰\Z@rtOÆˆÿ\0\ã\á>§ù\ÑEA \ë_\áÿ\0z§›\î¯û\âŠ*\ãº3e!þ¡þ‹\\µþ¹\Ýj(®ª;œ\Õqúú\êi\Ñ\Ç\ãý\rW\\L™d}ôüiƒýl¿õ\Ð3Eh–g\Ëþ¹\å]®üY(¢›2¾!ÿ\0R>‘Z\ä4\ïõô¢Šd\Ä\î?Žo÷?öZ¥ú\Ôü?­T\Zv3õ?øø?Fþb±\Ü÷\Çó¢Š\Õ\È}Ÿú\Åÿ\0¯¸\ëO]ÿ\0\ÙŠ(\êŒ^\ç+\'X¿\Ý\æµ4sñ?úP&tžÿ\0\çÿ\0tÿ\0:\ì›þ?\'ÿ\0yÿ\0¥V>!\Z‘\Ç\Êÿ\0¹%j\Üý\Åÿ\0xQEbYš\ßñð\Ü?\ÈU»¯øøZ(¦K8_ÿ\0\È>óý\Ñü\ëÊ“ýL¿\ï­WU-„‡E\Ö/\ÃùÔ·?\ë\Û\è•V\ë‘e7û§þºV–Ÿÿ\0‘ÿ\0\×xè¢¦B>­\Óÿ\0\ã\Î/÷Gò¬\íkþA—_õ\ÈQEsu9%¹ó\å\Çüx7\Ô\×4zŸ­WB\Øp4mÖ§\ÒO\å_K\éÿ\0ñ\éýs¢Š™\r™º\×ü{]\×	?•|\Ås÷¤úÿ\0SEtÈHt_«P>\ë\ÑEt¡G\ÜO ¡þýPÀÝŽ¥wð¢Š–¯ú\Åÿ\0v\Øÿ\0¼´QAbºÿ\0Jwü²ü(¢‚G{\ê)\ã\î·ûŸÒŠ((‡»S\å\ë\'ÒŠ*€‰jFûÿ\0P¯÷MJŸ{ñ¢Šµ²$´_\ê\Õ\ÐX©üGò¢Š\è\ÍPß³\ëÿ\0?Î¯O÷\ÏýsQ]‘9É¬¿\ÔOôO\ëWSþA¿öð(¢º©\ìD‹‘}Áþ\ê\Ôúoß\éE\Ó&zÏƒ¿\ä+ÿ\0n\ëü\Íz4\'ÿ\0:(­{U7\'“þ=‡Òµ4¯õ\Ãý\æþTQZCst\íÿ\02}kwKÿ\0]mõ¢Šè‰‘]>úþ?Î®K\Õ?\Ý\Ì\ÑEj¶²\ÑþôõÒ¶\'ÿ\0\×ÿ\0|\ÑEJ\ÜhôO}û/ú\ïV|gÿ\0?ð¢Šò_üŒ\éÿ\0…ký\Ú~§w¡\È2\n§¡\È$¾ÿ\0ÎŠ+Â©üJ¿õðôcð\Óô7\íþ\ï\à?•\\zŠ+’[”züT«÷\ZŠ+#¡\ØP½ð¢Š\0oñšJ(¤úQEh–-\'qExÿ\0\Å\ïù\0/û\Ãù\×\ÌZgüƒõúöoýQE}fYþ\çVx8¯÷‰|×¿\äŸõðÿ\0\ÈW‘_ÿ\0¯?\î­UV*‘J/øò½ÿ\0¯˜ÿ\0“Võ\ïü‰0\Ø\Ãyÿ\0¤ðQEp\Õ:\ç/\Þ_ú\î•n§I~EÁ?ˆ\Ñ#q\Ö_ú\íý*\êÿ\0D¢Š\r\"[»ÿ\0d_õðÿ\0\ÈV)\è\ÔQY3H•gûñÿ\0¼k\Ô|/ÿ\0¸?•W4ö,\êŸ\î\Û5¯Ö¿\ä%¨ÿ\0»ý(¢³E\Ãs”sþ\Ú7ò«r\ÇÀÿ\0t\è4QTnŠ\ÒýñþúÕ™¿Õ§ýt¢Š•›ªÿ\0»^\à?õW\ï\'ò¢Š\É\ìD¶;Ë¿¹oÿ\0]¿­z]Š+n‰9È©©×¹þu\Ãù­þ²ÿ\0\èTQYý’–\çp\ß\ã_?|Qÿ\0¾ÿ\0^\íü\ÍQO\ã4<ª?¼\ßõ\Ñ*^\Íÿ\0]h¢ººÎ¢\Ëþ]ÿ\0\ë©þu\Ö_ÿ\0Ç€ÿ\0rŠ+7¹\ÕO\áfg†¿öZ\Ý×¿\ã\ÚO÷VŠ*\å=¾G;\à¯øü¿ÿ\0€ÿ\0*õ(;}ùš(©‘\Å\"Y{ÿ\0¸+\É<{ÿ\0\Öõ\îÿ\0úUCtB9\Í/ýT¿Uÿ\0\Ðk^oõ·õ\Õè¢›;)lŽ…ÿ\0\ã\Ñß¬™?\ã\×ðo\éEIaÿ\0\Õ¥qºÿ\0ü|7û´QZ@Â¾\Æx\è?Ü«¬ÿ\0¶r!E¡\È\Åoõƒþ¹šX\Õ\ÛOý–Š*Ÿ\ÂC=\Â\ßñ\á7û\ÃúW£¸?\ë­W,þ6K)\'\Þÿ\0ÿ\0S^m\ãÿ\0øøƒ\è(¢´§¸Gs\Î\ÇÜ—ý\êý[ýÿ\0B¢Š\é4B\'ñýi\É\Óþ\Ú\åE\Ë$Ÿýoüÿ\0*d?~/÷\Çó¢Š™#è˜¿\ã\Ê÷«\Êeÿ\0]uþüŸ\Ì\ÑEdˆE­#ý\àµ\Þ_ý\äÿ\0rŠ(gT6F{ÿ\0®Oú\èô*§¨ÿ\0\Ç\ïýµ?\ÈQEH\äW‡\î\\}E/†ÿ\0\ä%©ýRŠ({L\ì\âûƒ\éÿ\0³SSýo\à(¢±f&§ñýOó­>\ãñþtQM	›š_ü{¿û\ÕOPû\íôÎŠ+h™È¥cþ²O÷\ëu¾\áÿ\0x\ÑEo&y\î§ÿ\0WVþb²gû\éõÿ\0\n(®\È\íò4B\Çi?\ë•}è¾­EQb¸¿\ïÿ\0Z²?\ÖKþ÷õ4QIŒÉŸþ?Wþº\æ+~ß©ÿ\0u?™¢ŠDObøÿ\0\\\Þ\åRO÷O\áE1\É\Ôý)òÿ\0¬÷V}‰Eù}·úKU&û‡\ê\ÔQY¾¥#	?\ã\â/÷)\çýZ\ÑEf\Æ]\ê\Ï\×úV\\Ÿ\ëSý×¢Š–2/ùg\ÔUUÿ\0[sôJ(¬\Ø\×?ò¸ÿ\0¯Xÿ\0v\Úüzþ\rü¨¢O\×ð^¾>´QM\ršs}ø¾P½?ýtþ”QZ\Êp}\ïÁ?™©Oú\é\ë¥P#ÿ\0þA·Ÿ\î?ó®gÃ½dÿ\0u™¢Š“Dw–\êû\ïü«\×ÿ\0\Õ\Éÿ\0]þƒE=\Ë?øñ‡þ\ÙÔ‡ýbº\ßÊŠ)£&HŸ\ê\Çû§ù\×?qÿ\0Cý\Ù(¢¨\Äÿ\0Qoø\Õg\ê\ëœ_úU¶!¶ûò\×O\ê+R>§þ»7þ\ËE›N¿wüú\ÔPõ—\é/òQHf¼ÿ\0\ê‡û’ÿ\0Z…¿\å\Û\è\ßÊŠ)1„?\ë\ãü?ô*\Ñ\Ñúúøj(®y\ì\Í\é\î<\Ç\Ó~?ÖºKõcþº5W<Ž\È\Ç£ÿ\0:‰ÿ\0ÕŸ\Çù\n(¬\Í\nÿ\0ò\É~•\0ÿ\0X\ë¯ôQ@uúê”©\ÒO÷\ÛùQEd+þ¢ú\è\Ô\ã\ßþºÿ\0J( BK÷\Ûý\ïñ¤¹\êÿ\0ð:(ª aÿ\0Tÿ\0_\ëVú»÷h¢¥–d\Çþµ¾•/ÿ\0ôQTòwúýUwû¿þ”QZCtA\Ãøƒ¨ÿ\0|ÿ\0:\à_\ï¿ûÆŠ+Ò£ð£)\î\È\î·ýr?Òÿ\0,n~‰ü¨¢º?ÿ\Ù','TÃ´i sáº½ Ä‘i Äƒn cÆ°á»›pf','TÃ´i muá»‘n kiáº¿m 30 triá»‡u má»—i ngÃ yf',NULL,200,100,451,2,1,1);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_area_work_entry`
--

DROP TABLE IF EXISTS `profile_area_work_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_area_work_entry` (
  `profiles_ID` bigint NOT NULL,
  `districts_ID_DISTRICT` bigint NOT NULL,
  PRIMARY KEY (`profiles_ID`,`districts_ID_DISTRICT`),
  KEY `FK3v6ldsl08xijn96emt5tnc7yc` (`districts_ID_DISTRICT`),
  CONSTRAINT `FK3v6ldsl08xijn96emt5tnc7yc` FOREIGN KEY (`districts_ID_DISTRICT`) REFERENCES `district_description` (`ID_DISTRICT`),
  CONSTRAINT `FK7w183yqv73nf0tb7jvuj6eqjq` FOREIGN KEY (`profiles_ID`) REFERENCES `profile` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_area_work_entry`
--

LOCK TABLES `profile_area_work_entry` WRITE;
/*!40000 ALTER TABLE `profile_area_work_entry` DISABLE KEYS */;
INSERT INTO `profile_area_work_entry` VALUES (3,1);
/*!40000 ALTER TABLE `profile_area_work_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_skill_entry`
--

DROP TABLE IF EXISTS `profile_skill_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_skill_entry` (
  `profiles_ID` bigint NOT NULL,
  `skills_ID_SKILL` bigint NOT NULL,
  PRIMARY KEY (`profiles_ID`,`skills_ID_SKILL`),
  KEY `FKplgulw29se8agljll3tf5y1rh` (`skills_ID_SKILL`),
  CONSTRAINT `FK2fpalsbj1i0ki6l0g5leeabev` FOREIGN KEY (`profiles_ID`) REFERENCES `profile` (`ID`),
  CONSTRAINT `FKplgulw29se8agljll3tf5y1rh` FOREIGN KEY (`skills_ID_SKILL`) REFERENCES `skill_description` (`ID_SKILL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_skill_entry`
--

LOCK TABLES `profile_skill_entry` WRITE;
/*!40000 ALTER TABLE `profile_skill_entry` DISABLE KEYS */;
INSERT INTO `profile_skill_entry` VALUES (3,1),(3,2);
/*!40000 ALTER TABLE `profile_skill_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_description`
--

DROP TABLE IF EXISTS `province_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province_description` (
  `ID_PROVINCE` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PROVINCE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_description`
--

LOCK TABLES `province_description` WRITE;
/*!40000 ALTER TABLE `province_description` DISABLE KEYS */;
INSERT INTO `province_description` VALUES (1,'2023-05-15 22:06:30','2023-05-15 22:06:30',NULL,'TP. Há»“ ChÃ­ Minh');
/*!40000 ALTER TABLE `province_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiping_origin`
--

DROP TABLE IF EXISTS `shiping_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiping_origin` (
  `SHIP_ORIGIN_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `STREET_ADDRESS` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CITY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POSTCODE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STATE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COUNTRY_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIP_ORIGIN_ID`),
  KEY `FKpqig59usqvs9h0dw4lm8rv7yy` (`COUNTRY_ID`),
  KEY `FKp0dbwsv3sdsp57ex7j5k9b0oq` (`MERCHANT_ID`),
  KEY `FK6k73f1n18kr7mqp708aiwq047` (`ZONE_ID`),
  CONSTRAINT `FK6k73f1n18kr7mqp708aiwq047` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKp0dbwsv3sdsp57ex7j5k9b0oq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKpqig59usqvs9h0dw4lm8rv7yy` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiping_origin`
--

LOCK TABLES `shiping_origin` WRITE;
/*!40000 ALTER TABLE `shiping_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `shiping_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_quote`
--

DROP TABLE IF EXISTS `shipping_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_quote` (
  `SHIPPING_QUOTE_ID` bigint NOT NULL,
  `CART_ID` bigint DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHIPPING_NUMBER_DAYS` int DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUOTE_HANDLING` decimal(19,2) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MODULE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OPTION_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OPTION_DELIVERY_DATE` datetime DEFAULT NULL,
  `OPTION_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OPTION_SHIPPING_DATE` datetime DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `QUOTE_PRICE` decimal(19,2) DEFAULT NULL,
  `QUOTE_DATE` datetime DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIPPING_QUOTE_ID`),
  KEY `FK9vb7tbjl8ivygdiqw883fewx7` (`DELIVERY_COUNTRY_ID`),
  KEY `FKiioesp0vl6x4om1jeajj4uy1t` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK9vb7tbjl8ivygdiqw883fewx7` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKiioesp0vl6x4om1jeajj4uy1t` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_quote`
--

LOCK TABLES `shipping_quote` WRITE;
/*!40000 ALTER TABLE `shipping_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `SHP_CART_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `PROMO_ADDED` datetime DEFAULT NULL,
  `PROMO_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHP_CART_CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`SHP_CART_ID`),
  UNIQUE KEY `UK_8ld8p40fwrjobi7t3n95pna35` (`SHP_CART_CODE`),
  KEY `SHP_CART_CODE_IDX` (`SHP_CART_CODE`),
  KEY `SHP_CART_CUSTOMER_IDX` (`CUSTOMER_ID`),
  KEY `FKqvghr5rmjefe3lw9mcolk30a0` (`MERCHANT_ID`),
  CONSTRAINT `FKqvghr5rmjefe3lw9mcolk30a0` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_attr_item`
--

DROP TABLE IF EXISTS `shopping_cart_attr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_attr_item` (
  `SHP_CART_ATTR_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_ATTR_ID` bigint NOT NULL,
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ATTR_ITEM_ID`),
  KEY `FKp42tpa623hyo9ww69v0ohb3er` (`SHP_CART_ITEM_ID`),
  CONSTRAINT `FKp42tpa623hyo9ww69v0ohb3er` FOREIGN KEY (`SHP_CART_ITEM_ID`) REFERENCES `shopping_cart_item` (`SHP_CART_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_attr_item`
--

LOCK TABLES `shopping_cart_attr_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_attr_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart_attr_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_item` (
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRODUCT_VARIANT` bigint DEFAULT NULL,
  `SHP_CART_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ITEM_ID`),
  KEY `FK2gbimdwe9uysd5xadnfl0xq83` (`SHP_CART_ID`),
  CONSTRAINT `FK2gbimdwe9uysd5xadnfl0xq83` FOREIGN KEY (`SHP_CART_ID`) REFERENCES `shopping_cart` (`SHP_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_description`
--

DROP TABLE IF EXISTS `skill_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_description` (
  `ID_SKILL` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SKILL`),
  UNIQUE KEY `UK_i94csmwi59928m39lgoos5odf` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_description`
--

LOCK TABLES `skill_description` WRITE;
/*!40000 ALTER TABLE `skill_description` DISABLE KEYS */;
INSERT INTO `skill_description` VALUES (1,NULL,NULL,NULL,'java','Java'),(2,NULL,NULL,NULL,'dev','Developer');
/*!40000 ALTER TABLE `skill_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_product_entry`
--

DROP TABLE IF EXISTS `skill_product_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_product_entry` (
  `PRODUCT_ID` bigint NOT NULL,
  `ID_SKILL` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`ID_SKILL`),
  KEY `FK8uktye5cf566dtqqe8h94lec8` (`ID_SKILL`),
  CONSTRAINT `FK1p3ij2xpyrlqvvhqgrxt01ncv` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FK8uktye5cf566dtqqe8h94lec8` FOREIGN KEY (`ID_SKILL`) REFERENCES `skill_description` (`ID_SKILL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_product_entry`
--

LOCK TABLES `skill_product_entry` WRITE;
/*!40000 ALTER TABLE `skill_product_entry` DISABLE KEYS */;
INSERT INTO `skill_product_entry` VALUES (2,1),(100,1),(151,1),(100,2),(151,2);
/*!40000 ALTER TABLE `skill_product_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_group`
--

DROP TABLE IF EXISTS `sm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_group` (
  `GROUP_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GROUP_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `UK_t83rjsoml3o785oj37lpqpyko` (`GROUP_NAME`),
  KEY `SM_GROUP_GROUP_TYPE` (`GROUP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_group`
--

LOCK TABLES `sm_group` WRITE;
/*!40000 ALTER TABLE `sm_group` DISABLE KEYS */;
INSERT INTO `sm_group` VALUES (1,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'SUPERADMIN','ADMIN'),(2,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN','ADMIN'),(3,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN_RETAILER','ADMIN'),(4,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN_STORE','ADMIN'),(5,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN_CATALOGUE','ADMIN'),(6,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN_ORDER','ADMIN'),(7,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'ADMIN_CONTENT','ADMIN'),(8,'2023-05-17 03:35:17','2023-05-17 03:35:17',NULL,'CUSTOMER','CUSTOMER');
/*!40000 ALTER TABLE `sm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_sequencer`
--

DROP TABLE IF EXISTS `sm_sequencer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_sequencer` (
  `SEQ_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SEQ_COUNT` bigint DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_sequencer`
--

LOCK TABLES `sm_sequencer` WRITE;
/*!40000 ALTER TABLE `sm_sequencer` DISABLE KEYS */;
INSERT INTO `sm_sequencer` VALUES ('CATEGORY_SEQ_NEXT_VAL',1),('country_description_seq',712),('COUNTRY_SEQ_NEXT_VAL',5),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',11),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('MANUFACT_SEQ_NEXT_VAL',1),('manufacturer_description_seq',2),('MERCH_CONF_SEQ_NEXT_VAL',1),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',5),('PRODUCT_AVAIL_SEQ_NEXT_VAL',4),('product_description_seq',7),('product_price_description_seq',7),('PRODUCT_PRICE_SEQ_NEXT_VAL',4),('PRODUCT_SEQ_NEXT_VAL',4),('product_type_description_seq',3),('STORE_SEQ_NEXT_VAL',1),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',1),('zone_description_seq',652),('ZONE_SEQ_NEXT_VAL',5);
/*!40000 ALTER TABLE `sm_sequencer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_transaction`
--

DROP TABLE IF EXISTS `sm_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_transaction` (
  `TRANSACTION_ID` bigint NOT NULL,
  `AMOUNT` decimal(19,2) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DETAILS` longtext COLLATE utf8mb3_unicode_ci,
  `PAYMENT_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK7j0s1gqh2tue1fyh5nyj5kwkp` (`ORDER_ID`),
  CONSTRAINT `FK7j0s1gqh2tue1fyh5nyj5kwkp` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_transaction`
--

LOCK TABLES `sm_transaction` WRITE;
/*!40000 ALTER TABLE `sm_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sm_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configuration` (
  `SYSTEM_CONFIG_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFIG_KEY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification` (
  `SYSTEM_NOTIF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CONFIG_KEY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_NOTIF_ID`),
  UNIQUE KEY `UKnpdnlc390vgr2mhepib1mtrmr` (`MERCHANT_ID`,`CONFIG_KEY`),
  KEY `FK3dykr9pm9ln1uektuw18blb6m` (`USER_ID`),
  CONSTRAINT `FK3dykr9pm9ln1uektuw18blb6m` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FKs6qk7l06e0s6m9n04momedgt7` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class` (
  `TAX_CLASS_ID` bigint NOT NULL,
  `TAX_CLASS_CODE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TAX_CLASS_TITLE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`TAX_CLASS_ID`),
  UNIQUE KEY `UKa4q5q57a8oeh2ojeo8dhr935k` (`MERCHANT_ID`,`TAX_CLASS_CODE`),
  KEY `TAX_CLASS_CODE_IDX` (`TAX_CLASS_CODE`),
  CONSTRAINT `FK82i8puujghcv7fc82qwsgjg8w` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'DEFAULT','DEFAULT',1);
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate` (
  `TAX_RATE_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAX_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PIGGYBACK` bit(1) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAX_PRIORITY` int DEFAULT NULL,
  `TAX_RATE` decimal(7,4) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TAX_RATE_ID`),
  UNIQUE KEY `UK8gh6l9n0xq03b91sglp62oelu` (`TAX_CODE`,`MERCHANT_ID`),
  KEY `FK6wm34jcwoembe1qsmle2wtwnv` (`COUNTRY_ID`),
  KEY `FKfwp6yka2qps9jna473e6c6yc1` (`MERCHANT_ID`),
  KEY `FKt8isen27i3ioa0tw3bl8qlvdh` (`PARENT_ID`),
  KEY `FK7bpa9pbl1gnj5y3xbgs3wc0eg` (`TAX_CLASS_ID`),
  KEY `FKm9snpf6o1nb4j1t80nas8d1ix` (`ZONE_ID`),
  CONSTRAINT `FK6wm34jcwoembe1qsmle2wtwnv` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK7bpa9pbl1gnj5y3xbgs3wc0eg` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKfwp6yka2qps9jna473e6c6yc1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKm9snpf6o1nb4j1t80nas8d1ix` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKt8isen27i3ioa0tw3bl8qlvdh` FOREIGN KEY (`PARENT_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate`
--

LOCK TABLES `tax_rate` WRITE;
/*!40000 ALTER TABLE `tax_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate_description`
--

DROP TABLE IF EXISTS `tax_rate_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `TAX_RATE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt3xg8pl88yacdxg49nb46effg` (`TAX_RATE_ID`,`LANGUAGE_ID`),
  KEY `FKsicb2ydx42o04pvlnxw2mlx0w` (`LANGUAGE_ID`),
  CONSTRAINT `FK65c2lqslk5kx25dpkem2r0vxq` FOREIGN KEY (`TAX_RATE_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`),
  CONSTRAINT `FKsicb2ydx42o04pvlnxw2mlx0w` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate_description`
--

LOCK TABLES `tax_rate_description` WRITE;
/*!40000 ALTER TABLE `tax_rate_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `USER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FK75kainrhn4kh8j3sw2xbe7v61` (`GROUP_ID`),
  KEY `FK9op4wv63nonsby8y9myjhtho` (`USER_ID`),
  CONSTRAINT `FK75kainrhn4kh8j3sw2xbe7v61` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`),
  CONSTRAINT `FK9op4wv63nonsby8y9myjhtho` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1),(1,2),(2,2);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userconnection` (
  `providerId` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `providerUserId` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `displayName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expireTime` bigint DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profileUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `refreshToken` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `userRank` int NOT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconnection`
--

LOCK TABLES `userconnection` WRITE;
/*!40000 ALTER TABLE `userconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_A1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_A2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_A3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_REQ` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_EXP` date DEFAULT NULL,
  `ADMIN_FIRST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_ACCESS` datetime DEFAULT NULL,
  `ADMIN_LAST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LOGIN_ACCESS` datetime DEFAULT NULL,
  `ADMIN_Q1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_Q2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADMIN_Q3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UK7cwrowcnjlfxpxpdd1op9ymab` (`MERCHANT_ID`,`ADMIN_NAME`),
  KEY `USR_NAME_IDX` (`ADMIN_NAME`),
  KEY `FK4yb3ho4yxvcjniqg09opbm7ja` (`LANGUAGE_ID`),
  CONSTRAINT `FK4yb3ho4yxvcjniqg09opbm7ja` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKtpio656e5t0cja7kx7p79rkh6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','admin@shopizer.com','admin@shopizer.com','$2a$10$1FaAgh0FzYgE4ki59tmnuOZeFHRQK6JYYBOtYDDAhGya2WXJakG76',NULL,NULL,NULL,'2023-05-17 03:35:40','2023-05-17 03:35:40',NULL,NULL,NULL,'Administrator',NULL,'User',NULL,NULL,NULL,NULL,NULL,1),(2,_binary '','ndlong@gmail.com','ndlong@gmail.com','$2a$10$u4fUZQIuS4hT8HdFbvFd9.cr7SgvhHGgQ/VY1HMKXu8WdhfkeK5CW',NULL,NULL,NULL,'2023-05-17 03:38:05','2023-05-17 03:38:05',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_description`
--

DROP TABLE IF EXISTS `ward_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward_description` (
  `ID_WARD` bigint NOT NULL AUTO_INCREMENT,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ID_DISTRICT` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_WARD`),
  KEY `FKe5umb9jby0vp8cdsyqvdbl8ae` (`ID_DISTRICT`),
  CONSTRAINT `FKe5umb9jby0vp8cdsyqvdbl8ae` FOREIGN KEY (`ID_DISTRICT`) REFERENCES `district_description` (`ID_DISTRICT`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_description`
--

LOCK TABLES `ward_description` WRITE;
/*!40000 ALTER TABLE `ward_description` DISABLE KEYS */;
INSERT INTO `ward_description` VALUES (1,'2023-05-15 22:15:56','2023-05-15 22:15:56',NULL,'Báº¿n NghÃ©',1),(2,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Báº¿n NghÃ©',1),(3,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Báº¿n ThÃ nh',1),(4,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Cáº§u Kho',1),(5,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Cáº§u Ã”ng LÃ£nh',1),(6,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'CÃ´ Giang',1),(7,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Äa Kao',1),(8,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguyá»…n CÆ° Trinh',1),(9,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguyá»…n ThÃ¡i BÃ¬nh',1),(10,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Pháº¡m NgÅ© LÃ£o',1),(11,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'TÃ¢n Äá»‹nh',1),(12,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Äakao',1),(13,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An KhÃ¡nh',2),(14,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Lá»£i ÄÃ´ng',2),(15,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An PhÃº',2),(16,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'BÃ¬nh An',2),(17,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'BÃ¬nh KhÃ¡nh',2),(18,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'BÃ¬nh TrÆ°ng ÄÃ´ng',2),(19,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'BÃ¬nh TrÆ°ng TÃ¢y',2),(20,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'CÃ¡t LÃ¡i',2),(21,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Tháº¡nh Má»¹ Lá»£i',2),(22,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Tháº£o Äiá»n',2),(23,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'1',3),(24,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'2',3),(25,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'3',3),(26,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'4',3),(27,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'5',3),(28,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'6',3),(29,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'7',3),(30,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'8',3),(31,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'9',3),(32,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'10',3),(33,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'11',3),(34,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'12',3),(35,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'13',3),(36,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'14',3),(37,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'15',3),(38,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'1',4),(39,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'2',4),(40,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'3',4),(41,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'4',4),(42,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'5',4),(43,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'6',4),(44,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'7',4),(45,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'8',4),(46,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'9',4),(47,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'10',4),(48,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'11',4),(49,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'12',4),(50,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'13',4),(51,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'14',4),(52,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'15',4),(53,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'16',4),(54,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'1',5),(55,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'2',5),(56,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'3',5),(57,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'4',5),(58,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'5',5),(59,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'6',5),(60,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'7',5),(61,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'8',5),(62,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'9',5),(63,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'10',5),(64,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'11',5),(65,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'12',5),(66,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'13',5),(67,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'14',5),(68,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'15',5),(69,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'16',5),(70,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'1',6),(71,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'2',6),(72,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'3',6),(73,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'4',6),(74,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'5',6),(75,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'6',6),(76,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'7',6),(77,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'8',6),(78,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'9',6),(79,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'10',6),(80,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'11',6),(81,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'12',6),(82,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'13',6),(83,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'14',6),(84,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'15',6),(85,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'16',6),(86,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'BÃ¬nh Thuáº­n',7),(87,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'PhÃº Má»¹',7),(88,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'PhÃº Thuáº­n',7),(89,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n HÆ°ng',7),(90,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n Kiá»ƒng',7),(91,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n Phong',7),(92,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n PhÃº',7),(93,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n Quy',7),(94,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n Thuáº­n ÄÃ´ng',7),(95,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'TÃ¢n Thuáº­n TÃ¢y',7),(96,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'1',8),(97,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'2',8),(98,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'3',8),(99,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'4',8),(100,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'5',8),(101,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'6',8),(102,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'7',8),(103,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'8',8),(104,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'9',8),(105,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'10',8),(106,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'11',8),(107,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'12',8),(108,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'13',8),(109,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'14',8),(110,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'15',8),(111,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'16',8),(112,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'BÃ¬nh Äá»©c',8),(113,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'BÃ¬nh HÆ°ng HÃ²a',8),(114,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'BÃ¬nh HÆ°ng HÃ²a A',8),(115,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'BÃ¬nh HÆ°ng HÃ²a B',8),(116,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Hiá»‡p PhÃº',9),(117,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long BÃ¬nh',9),(118,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long PhÆ°á»›c',9),(119,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Tháº¡nh Má»¹',9),(120,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long TrÆ°á»ng',9),(121,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'PhÃº Há»¯u',9),(122,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'PhÆ°á»›c BÃ¬nh',9),(123,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'PhÆ°á»›c Long A',9),(124,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'PhÆ°á»›c Long B',9),(125,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'TÄƒng NhÆ¡n PhÃº A',9),(126,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'TÄƒng NhÆ¡n PhÃº B',9),(127,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'TrÆ°á»ng Tháº¡nh',9),(128,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'1',10),(129,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'2',10),(130,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'3',10),(131,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'4',10),(132,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'5',10),(133,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'6',10),(134,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'7',10),(135,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'8',10),(136,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'9',10),(137,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'10',10),(138,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'11',10),(139,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'12',10),(140,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'13',10),(141,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'14',10),(142,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'15',10),(143,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'1',11),(144,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'2',11),(145,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'3',11),(146,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'4',11),(147,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'5',11),(148,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'6',11),(149,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'7',11),(150,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'8',11),(151,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'9',11),(152,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'10',11),(153,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'11',11),(154,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'12',11),(155,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'13',11),(156,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'14',11),(157,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'15',11),(158,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'16',11),(159,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tháº¡nh XuÃ¢n',12),(160,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tháº¡nh Lá»™c',12),(161,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Hiá»‡p ThÃ nh',12),(162,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Thá»›i An',12),(163,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'TÃ¢n ChÃ¡nh Hiá»‡p',12),(164,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'An PhÃº ÄÃ´ng',12),(165,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'TÃ¢n Thá»›i Hiá»‡p',12),(166,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Trung Má»¹ TÃ¢y',12),(167,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'TÃ¢n HÆ°ng Thuáº­n',12),(168,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'ÄÃ´ng HÆ°ng Thuáº­n',12),(169,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'TÃ¢n Thá»›i Nháº¥t',11),(170,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'1',13),(171,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'2',13),(172,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'3',13),(173,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'4',13),(174,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'5',13),(175,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'6',13),(176,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'7',13),(177,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'8',13),(178,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'9',13),(179,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'10',13),(180,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'11',13),(181,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'12',13),(182,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'13',13),(183,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'14',13),(184,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'15',13),(185,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'16',13),(186,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'17',13),(187,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'18',13),(188,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'19',13),(189,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'20',13),(190,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'21',13),(191,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'22',13),(192,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'23',13),(193,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'24',13),(194,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'25',13),(195,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'26',13),(196,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'27',13),(197,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'28',13),(198,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'29',13),(199,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'30',13),(200,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'31',13),(201,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'32',13),(202,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'1',14),(203,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'2',14),(204,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'3',14),(205,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'4',14),(206,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'5',14),(207,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'6',14),(208,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'7',14),(209,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'8',14),(210,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'9',14),(211,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'10',14),(212,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'11',14),(213,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'12',14),(214,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'13',14),(215,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'14',14),(216,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'15',14),(217,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'16',14),(218,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'17',14),(219,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'18',14),(220,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'19',14),(221,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'20',14),(222,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'1',15),(223,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'2',15),(224,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'3',15),(225,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'4',15),(226,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'5',15),(227,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'6',15),(228,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'7',15),(229,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'8',15),(230,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'9',15),(231,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'10',15),(232,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'11',15),(233,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'12',15),(234,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'13',15),(235,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'14',15),(236,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'15',15),(237,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'Tháº¡nh Má»¹ Lá»£i',15),(238,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'17',15),(239,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'1',16),(240,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'2',16),(241,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'3',16),(242,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'4',16),(243,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'5',16),(244,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'6',16),(245,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'7',16),(246,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'8',16),(247,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'9',16),(248,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'10',16),(249,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'11',16),(250,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'12',16),(251,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'13',16),(252,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'14',16),(253,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'15',16),(254,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'TÃ¢n ThÃ nh',16),(255,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'TÃ¢n SÆ¡n NhÃ¬',16),(256,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'TÃ¢n QuÃ½',16),(257,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'TÃ¢n Thá»›i HoÃ ',16),(258,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'TÃ¢n SÆ¡n NhÃ¬',17),(259,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'TÃ¢y Tháº¡nh',17),(260,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'SÆ¡n Ká»³',17),(261,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'TÃ¢n QÃºy',17),(262,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'TÃ¢n ThÃ nh',17),(263,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'PhÃº Thá» HÃ²a',17),(264,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'PhÃº Tháº¡nh',17),(265,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'PhÃº Trung',17),(266,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'HoÃ  Tháº¡nh',17),(267,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Hiá»‡p TÃ¢n',17),(268,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'TÃ¢n Thá»›i HoÃ ',17),(269,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'BÃ¬nh HÆ°ng HÃ²a',17),(270,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'BÃ¬nh HÆ°ng HoÃ  A',17),(271,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'BÃ¬nh HÆ°ng HoÃ  B',17),(272,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh XuÃ¢n',18),(273,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'BÃ¬nh Chiá»ƒu',18),(274,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Trung',18),(275,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam BÃ¬nh',18),(276,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam PhÃº',18),(277,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hiá»‡p BÃ¬nh PhÆ°á»›c',18),(278,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hiá»‡p BÃ¬nh ChÃ¡nh',18),(279,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Chiá»ƒu',18),(280,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh TÃ¢y',18),(281,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh ÄÃ´ng',18),(282,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'BÃ¬nh Thá»',18),(283,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'TrÆ°á»ng Thá»',18),(284,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long BÃ¬nh',18),(285,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long Tháº¡nh Má»¹',18),(286,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh HÆ°ng HÃ²a',19),(287,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh HÆ°ng HoÃ  A',19),(288,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh HÆ°ng HoÃ  B',19),(289,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh Trá»‹ ÄÃ´ng',19),(290,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh Trá»‹ ÄÃ´ng A',19),(291,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'BÃ¬nh Trá»‹ ÄÃ´ng B',19),(292,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'TÃ¢n Táº¡o',19),(293,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'TÃ¢n Táº¡o A',19),(294,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An Láº¡c',19),(295,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An Láº¡c A',19),(296,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'TÃ¢n Thuáº­n ÄÃ´ng',19),(297,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Thá»‹ tráº¥n Cá»§ Chi',20),(298,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An NhÆ¡n TÃ¢y',20),(299,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An PhÃº',20),(300,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'BÃ¬nh Má»¹',20),(301,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'HÃ²a PhÃº',20),(302,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Nhuáº­n Äá»©c',20),(303,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Pháº¡m VÄƒn Cá»™i',20),(304,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'PhÃº HÃ²a ÄÃ´ng',20),(305,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'PhÃº Má»¹ HÆ°ng',20),(306,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'PhÆ°á»›c Hiá»‡p',20),(307,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'PhÆ°á»›c Tháº¡nh',20),(308,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'TÃ¢n An Há»™i',20),(309,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'TÃ¢n PhÃº Trung',20),(310,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'TÃ¢n Tháº¡nh ÄÃ´ng',20),(311,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'TÃ¢n Tháº¡nh TÃ¢y',20),(312,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'TÃ¢n ThÃ´ng Há»™i',20),(313,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung An',20),(314,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung Láº­p Háº¡',20),(315,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung Láº­p ThÆ°á»£ng',20),(316,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'TrÆ°á»ng Tháº¡nh',20),(317,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'XÃ¡ XuÃ¢n 1',20),(318,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'XÃ¡ XuÃ¢n 2',20),(319,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Thá»‹ tráº¥n HÃ³c MÃ´n',21),(320,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'BÃ  Äiá»ƒm',21),(321,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'ÄÃ´ng Tháº¡nh',21),(322,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'TÃ¢n Hiá»‡p',21),(323,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'TÃ¢n Thá»›i NhÃ¬',21),(324,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'TÃ¢n XuÃ¢n',21),(325,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Thá»›i Tam ThÃ´n',21),(326,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Trung ChÃ¡nh',21),(327,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'XuÃ¢n Thá»›i ÄÃ´ng',21),(328,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'XuÃ¢n Thá»›i SÆ¡n',21),(329,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Thá»‹ tráº¥n NhÃ  BÃ¨',22),(330,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'PhÆ°á»›c Kiá»ƒn',22),(331,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'PhÆ°á»›c Lá»™c',22),(332,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'NhÆ¡n Äá»©c',22),(333,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'PhÃº XuÃ¢n',22),(334,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Long Thá»›i',22),(335,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Hiá»‡p PhÆ°á»›c',22),(336,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thá»‹ tráº¥n Cáº§n Tháº¡nh',23),(337,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Thá»›i ÄÃ´ng',23),(338,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'BÃ¬nh KhÃ¡nh',23),(339,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Long HÃ²a',23),(340,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'LÃ½ NhÆ¡n',23),(341,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam ThÃ´n Hiá»‡p',23),(342,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tháº¡nh An',23),(343,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tháº¡nh Lá»™c',23),(344,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tháº¡nh Má»¹',23),(345,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thá»›i ÄÃ´ng',23),(346,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Thá»›i TÃ¢y',23),(347,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Cáº§n Tháº¡nh',23),(348,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Lá»™c An',23),(349,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam ThÃ´n Há»™i',23),(350,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tháº¡nh PhÃº',23),(351,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thá»›i Háº£i',23),(352,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thá»›i Thuáº­n',23),(353,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'VÄ©nh BÃ¬nh',23);
/*!40000 ALTER TABLE `ward_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_experience`
--

DROP TABLE IF EXISTS `work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_experience` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `TITILE_POSITION` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CV_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoiik09uxujmq3oo9ipj401328` (`CV_ID`),
  CONSTRAINT `FKoiik09uxujmq3oo9ipj401328` FOREIGN KEY (`CV_ID`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--

LOCK TABLES `work_experience` WRITE;
/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;
INSERT INTO `work_experience` VALUES ('96504318-14c7-4006-94d4-37096e999c4e','CÃ´ng ty TNHH Má»˜T MÃŒNH TAO','LÃ m má»™t ngÃ y thÃ¬ bá»‹ Ä‘uá»•i',NULL,'2023-01-01 00:00:00','Giam Ä‘á»‘c cÃ´ng nghá»‡','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `ZONE_ID` bigint NOT NULL,
  `ZONE_CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`ZONE_ID`),
  UNIQUE KEY `UK_4tq3p5w8k4h4easyf5t3n1jdr` (`ZONE_CODE`),
  KEY `FKhn2c1w3e1twhjg7tiwv7vuk67` (`COUNTRY_ID`),
  CONSTRAINT `FKhn2c1w3e1twhjg7tiwv7vuk67` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Guipuzcoa',197),(2,'HI',224),(3,'PR',224),(4,'Zamora',197),(5,'Vizcaya',197),(6,'OTR',166),(7,'Albacete',197),(8,'Lleida',197),(9,'QC',37),(10,'NRW',78),(11,'IA',224),(12,'ID',224),(13,'YT',37),(14,'Leon',197),(15,'ACorua',197),(16,'Castellon',197),(17,'LasPalmas',197),(18,'Pontevedra',197),(19,'AA',224),(20,'Teruel',197),(21,'AB',37),(22,'AC',224),(23,'IL',224),(24,'AE',224),(25,'AF',224),(26,'IN',224),(27,'AG',204),(28,'A Corua',197),(29,'AI',204),(30,'AK',224),(31,'Caceres',197),(32,'Segovia',197),(33,'AL',224),(34,'AM',224),(35,'ZG',204),(36,'Malaga',197),(37,'CEN',166),(38,'ZH',204),(39,'LaRioja',197),(40,'AP',224),(41,'Melilla',197),(42,'AR',224),(43,'AS',224),(44,'NSW',13),(45,'Madrid',197),(46,'RI',224),(47,'AZ',224),(48,'Ceuta',197),(49,'BC',37),(50,'Huelva',197),(51,'BE',204),(52,'Huesca',197),(53,'ARCH',204),(54,'BL',204),(55,'JU',204),(56,'Asturias',197),(57,'SA',13),(58,'SB',14),(59,'TIAT',14),(60,'SC',224),(61,'THE',78),(62,'SD',224),(63,'BS',204),(64,'Cordoba',197),(65,'Tarragona',197),(66,'Valladolid',197),(67,'SG',204),(68,'SH',204),(69,'WAAU',13),(70,'SK',37),(71,'NDS',78),(72,'SO',204),(73,'CA',224),(74,'NTAU',13),(75,'ST',14),(76,'KN',14),(77,'Jaen',197),(78,'ASU',166),(79,'CiudadReal',197),(80,'SZ',204),(81,'Alava',197),(82,'KS',224),(83,'CO',224),(84,'KY',224),(85,'BER',78),(86,'CT',224),(87,'ACT',13),(88,'TG',204),(89,'LA',224),(90,'HAM',78),(91,'TI',204),(92,'Lugo',197),(93,'NECH',204),(94,'TN',224),(95,'Toledo',197),(96,'DC',224),(97,'Palencia',197),(98,'DE',224),(99,'TX',224),(100,'TAS',13),(101,'QLD',13),(102,'LU',204),(103,'Burgos',197),(104,'Cadiz',197),(105,'SantaCruzdeTenerife',197),(106,'MA',224),(107,'MB',37),(108,'MD',224),(109,'Girona',197),(110,'ME',224),(111,'Alicante',197),(112,'Guadalajara',197),(113,'Cantabria',197),(114,'MH',224),(115,'MI',224),(116,'UR',204),(117,'UT',224),(118,'MN',224),(119,'MO',224),(120,'MP',224),(121,'Barcelona',197),(122,'MS',224),(123,'MT',224),(124,'Badajoz',197),(125,'MEC',78),(126,'VA',224),(127,'VB',14),(128,'Cuenca',197),(129,'WIAT',14),(130,'VD',204),(131,'Sevilla',197),(132,'VI',224),(133,'Zaragoza',197),(134,'NB',37),(135,'SAC',78),(136,'NC',224),(137,'ND',224),(138,'NE',224),(139,'NF',37),(140,'NH',224),(141,'NJ',224),(142,'VS',204),(143,'VT',224),(144,'NM',224),(145,'NO',14),(146,'SAS',78),(147,'NS',37),(148,'SAR',78),(149,'FL',224),(150,'NT',37),(151,'FM',224),(152,'NU',37),(153,'NV',224),(154,'NW',204),(155,'WA',224),(156,'NY',224),(157,'Granada',197),(158,'Soria',197),(159,'FR',204),(160,'RHE',78),(161,'Ourense',197),(162,'WI',224),(163,'OH',224),(164,'GA',224),(165,'Murcia',197),(166,'OK',224),(167,'GE',204),(168,'WV',224),(169,'ON',37),(170,'OO',14),(171,'WY',224),(172,'BLAT',14),(173,'Avila',197),(174,'OR',224),(175,'Salamanca',197),(176,'GL',204),(177,'Baleares',197),(178,'OW',204),(179,'GR',204),(180,'GU',224),(181,'PA',224),(182,'VIC',13),(183,'BRE',78),(184,'PE',37),(185,'BRG',78),(186,'HES',78),(187,'Almeria',197),(188,'BAW',78),(189,'BAY',78),(190,'Navarra',197),(191,'Valencia',197),(192,'SCN',78),(193,'AndhraPradesh',97),(194,'ArunachalPradesh',97),(195,'Assam',97),(196,'Bihar',97),(197,'Chhattisgarh',97),(198,'Goa',97),(199,'Gujarat',97),(200,'Haryana',97),(201,'HimachalPradesh',97),(202,'Jharkhand',97),(203,'Karnataka',97),(204,'Kerala',97),(205,'MadhyaPradesh',97),(206,'Maharashtra',97),(207,'Manipur',97),(208,'Meghalaya',97),(209,'Mizoram',97),(210,'Nagaland',97),(211,'Odisha',97),(212,'Punjab',97),(213,'Rajasthan',97),(214,'Sikkim',97),(215,'TamilNadu',97),(216,'Telangana',97),(217,'Tripura',97),(218,'Uttarakhand',97),(219,'WestBengal',97);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_description`
--

DROP TABLE IF EXISTS `zone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `ZONE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKm64laxgrv9fxm6io232ap4su9` (`ZONE_ID`,`LANGUAGE_ID`),
  KEY `FK69ybu7r3bgpcq65c77ji1udh3` (`LANGUAGE_ID`),
  CONSTRAINT `FK69ybu7r3bgpcq65c77ji1udh3` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKpv4elin6w3b03756obqvk447f` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_description`
--

LOCK TABLES `zone_description` WRITE;
/*!40000 ALTER TABLE `zone_description` DISABLE KEYS */;
INSERT INTO `zone_description` VALUES (1,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,1,1),(2,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,2,1),(3,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,3,1),(4,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,1,2),(5,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,2,2),(6,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,3,2),(7,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,1,3),(8,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,2,3),(9,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,3,3),(10,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,1,4),(11,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,2,4),(12,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,3,4),(13,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,1,5),(14,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,2,5),(15,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,3,5),(16,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Other',NULL,1,6),(17,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Otro',NULL,3,6),(18,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,1,7),(19,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,2,7),(20,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,3,7),(21,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,1,8),(22,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,2,8),(23,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,3,8),(24,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,1,9),(25,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'QuÃ©bec',NULL,2,9),(26,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,3,9),(27,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,1,10),(28,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,2,10),(29,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,3,10),(30,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,1,11),(31,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,2,11),(32,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,3,11),(33,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,1,12),(34,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,2,12),(35,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,3,12),(36,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,1,13),(37,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon',NULL,2,13),(38,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,3,13),(39,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,1,14),(40,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,2,14),(41,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,3,14),(42,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,1,15),(43,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,3,15),(44,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,1,16),(45,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,2,16),(46,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,3,16),(47,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,1,17),(48,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,2,17),(49,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,3,17),(50,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,1,18),(51,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,2,18),(52,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,3,18),(53,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,1,19),(54,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,2,19),(55,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,3,19),(56,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,1,20),(57,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,2,20),(58,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,3,20),(59,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,1,21),(60,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,2,21),(61,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,3,21),(62,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,1,22),(63,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,2,22),(64,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,3,22),(65,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,1,23),(66,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,2,23),(67,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,3,23),(68,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,1,24),(69,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,2,24),(70,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,3,24),(71,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,1,25),(72,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,2,25),(73,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,3,25),(74,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,1,26),(75,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,2,26),(76,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,3,26),(77,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,1,27),(78,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,2,27),(79,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,3,27),(80,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'A Corua',NULL,2,28),(81,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,1,29),(82,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,2,29),(83,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,3,29),(84,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,1,30),(85,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,2,30),(86,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,3,30),(87,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,1,31),(88,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,2,31),(89,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,3,31),(90,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,1,32),(91,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,2,32),(92,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,3,32),(93,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,1,33),(94,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,2,33),(95,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,3,33),(96,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,1,34),(97,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,2,34),(98,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,3,34),(99,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,1,35),(100,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,2,35),(101,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,3,35),(102,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,1,36),(103,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,2,36),(104,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,3,36),(105,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,1,37),(106,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,3,37),(107,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,1,38),(108,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,2,38),(109,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,3,38),(110,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,1,39),(111,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,2,39),(112,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,3,39),(113,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,1,40),(114,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,2,40),(115,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,3,40),(116,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,1,41),(117,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,2,41),(118,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,3,41),(119,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,1,42),(120,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,2,42),(121,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,3,42),(122,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,1,43),(123,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,2,43),(124,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,3,43),(125,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,1,44),(126,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Nouvelle-Galles du Sud',NULL,2,44),(127,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,3,44),(128,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,1,45),(129,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,2,45),(130,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,3,45),(131,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,1,46),(132,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,2,46),(133,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,3,46),(134,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,1,47),(135,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,2,47),(136,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,3,47),(137,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,1,48),(138,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,2,48),(139,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,3,48),(140,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,1,49),(141,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Colombie Britanique',NULL,2,49),(142,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,3,49),(143,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,1,50),(144,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,2,50),(145,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,3,50),(146,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,1,51),(147,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,2,51),(148,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,3,51),(149,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,1,52),(150,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,2,52),(151,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,3,52),(152,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,1,53),(153,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,2,53),(154,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,3,53),(155,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,1,54),(156,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,2,54),(157,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,3,54),(158,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,1,55),(159,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,2,55),(160,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,3,55),(161,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,1,56),(162,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,2,56),(163,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,3,56),(164,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,1,57),(165,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Australie-Mridionale',NULL,2,57),(166,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,3,57),(167,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,1,58),(168,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,2,58),(169,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,3,58),(170,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,1,59),(171,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,2,59),(172,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,3,59),(173,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,1,60),(174,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Caroline du Sud',NULL,2,60),(175,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,3,60),(176,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,1,61),(177,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,2,61),(178,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,3,61),(179,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,1,62),(180,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Dakota du Sud',NULL,2,62),(181,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,3,62),(182,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,1,63),(183,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,2,63),(184,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,3,63),(185,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,1,64),(186,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,2,64),(187,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,3,64),(188,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,1,65),(189,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,2,65),(190,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,3,65),(191,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,1,66),(192,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,2,66),(193,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Valladolid',NULL,3,66),(194,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,1,67),(195,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,2,67),(196,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,3,67),(197,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,1,68),(198,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,2,68),(199,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,3,68),(200,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,1,69),(201,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australie-Occidentale',NULL,2,69),(202,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,3,69),(203,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,1,70),(204,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,2,70),(205,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,3,70),(206,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,1,71),(207,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,2,71),(208,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,3,71),(209,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,1,72),(210,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,2,72),(211,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,3,72),(212,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,1,73),(213,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Californie',NULL,2,73),(214,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,3,73),(215,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,1,74),(216,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire du Nord',NULL,2,74),(217,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,3,74),(218,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,1,75),(219,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,2,75),(220,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,3,75),(221,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,1,76),(222,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Karten',NULL,2,76),(223,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,3,76),(224,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,1,77),(225,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,2,77),(226,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,3,77),(227,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Asuncion',NULL,1,78),(228,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'AsunciÃ³n',NULL,3,78),(229,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,1,79),(230,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,2,79),(231,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,3,79),(232,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,1,80),(233,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,2,80),(234,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,3,80),(235,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,1,81),(236,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,2,81),(237,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,3,81),(238,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,1,82),(239,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,2,82),(240,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,3,82),(241,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,1,83),(242,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,2,83),(243,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,3,83),(244,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,1,84),(245,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,2,84),(246,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,3,84),(247,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,1,85),(248,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,2,85),(249,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,3,85),(250,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,1,86),(251,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,2,86),(252,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,3,86),(253,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australian Capital Territory',NULL,1,87),(254,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire de la capitale australienne',NULL,2,87),(255,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Australian Capital Territory',NULL,3,87),(256,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,1,88),(257,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,2,88),(258,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,3,88),(259,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,1,89),(260,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiane',NULL,2,89),(261,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,3,89),(262,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,1,90),(263,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,2,90),(264,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,3,90),(265,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,1,91),(266,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,2,91),(267,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,3,91),(268,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,1,92),(269,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,2,92),(270,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,3,92),(271,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,1,93),(272,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,2,93),(273,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,3,93),(274,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,1,94),(275,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,2,94),(276,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,3,94),(277,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,1,95),(278,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,2,95),(279,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,3,95),(280,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,1,96),(281,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District de Columbia',NULL,2,96),(282,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,3,96),(283,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,1,97),(284,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,2,97),(285,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,3,97),(286,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,1,98),(287,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,2,98),(288,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,3,98),(289,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,1,99),(290,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,2,99),(291,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,3,99),(292,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,1,100),(293,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmanie',NULL,2,100),(294,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,3,100),(295,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,1,101),(296,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,2,101),(297,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,3,101),(298,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,1,102),(299,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,2,102),(300,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,3,102),(301,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,1,103),(302,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,2,103),(303,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,3,103),(304,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,1,104),(305,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,2,104),(306,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,3,104),(307,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,1,105),(308,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,2,105),(309,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,3,105),(310,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,1,106),(311,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,2,106),(312,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,3,106),(313,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,1,107),(314,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,2,107),(315,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,3,107),(316,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,1,108),(317,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,2,108),(318,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,3,108),(319,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,1,109),(320,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,2,109),(321,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Girona',NULL,3,109),(322,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,1,110),(323,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,2,110),(324,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,3,110),(325,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,1,111),(326,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,2,111),(327,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,3,111),(328,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,1,112),(329,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,2,112),(330,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,3,112),(331,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,1,113),(332,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,2,113),(333,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,3,113),(334,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,1,114),(335,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,2,114),(336,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,3,114),(337,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,1,115),(338,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,2,115),(339,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,3,115),(340,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,1,116),(341,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,2,116),(342,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,3,116),(343,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,1,117),(344,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,2,117),(345,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,3,117),(346,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,1,118),(347,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,2,118),(348,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,3,118),(349,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,1,119),(350,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,2,119),(351,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,3,119),(352,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,1,120),(353,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,2,120),(354,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,3,120),(355,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,1,121),(356,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,2,121),(357,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,3,121),(358,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,1,122),(359,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,2,122),(360,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,3,122),(361,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,1,123),(362,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,2,123),(363,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,3,123),(364,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,1,124),(365,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,2,124),(366,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,3,124),(367,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,1,125),(368,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,2,125),(369,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,3,125),(370,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,1,126),(371,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginie',NULL,2,126),(372,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,3,126),(373,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,1,127),(374,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,2,127),(375,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,3,127),(376,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,1,128),(377,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,2,128),(378,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,3,128),(379,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,1,129),(380,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,2,129),(381,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,3,129),(382,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,1,130),(383,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,2,130),(384,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,3,130),(385,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,1,131),(386,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,2,131),(387,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,3,131),(388,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,1,132),(389,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,2,132),(390,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,3,132),(391,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,1,133),(392,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,2,133),(393,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,3,133),(394,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,1,134),(395,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Nouveau Brunswick',NULL,2,134),(396,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,3,134),(397,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,1,135),(398,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,2,135),(399,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen-Anhalt',NULL,3,135),(400,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,1,136),(401,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Caroline du Nord',NULL,2,136),(402,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,3,136),(403,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,1,137),(404,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Dakota du Nord',NULL,2,137),(405,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,3,137),(406,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,1,138),(407,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,2,138),(408,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,3,138),(409,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,1,139),(410,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Terre-Neuve - Labrador',NULL,2,139),(411,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,3,139),(412,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,1,140),(413,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Hampshire',NULL,2,140),(414,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,3,140),(415,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,1,141),(416,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,2,141),(417,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,3,141),(418,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,1,142),(419,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,2,142),(420,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,3,142),(421,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,1,143),(422,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,2,143),(423,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,3,143),(424,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,1,144),(425,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Mexique',NULL,2,144),(426,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,3,144),(427,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,1,145),(428,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,2,145),(429,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,3,145),(430,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,1,146),(431,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,2,146),(432,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,3,146),(433,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,1,147),(434,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouvelle Ã‰cosse',NULL,2,147),(435,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,3,147),(436,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,1,148),(437,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,2,148),(438,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,3,148),(439,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,1,149),(440,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Floride',NULL,2,149),(441,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,3,149),(442,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,1,150),(443,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Territores du Nord-Ouest',NULL,2,150),(444,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,3,150),(445,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,1,151),(446,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,2,151),(447,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,3,151),(448,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,1,152),(449,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,2,152),(450,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,3,152),(451,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,1,153),(452,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,2,153),(453,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,3,153),(454,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,1,154),(455,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,2,154),(456,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,3,154),(457,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,1,155),(458,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,2,155),(459,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,3,155),(460,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,1,156),(461,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,2,156),(462,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,3,156),(463,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,1,157),(464,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,2,157),(465,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,3,157),(466,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,1,158),(467,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,2,158),(468,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,3,158),(469,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,1,159),(470,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,2,159),(471,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,3,159),(472,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,1,160),(473,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,2,160),(474,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,3,160),(475,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,1,161),(476,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,2,161),(477,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,3,161),(478,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,1,162),(479,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,2,162),(480,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,3,162),(481,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,1,163),(482,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,2,163),(483,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,3,163),(484,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,1,164),(485,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgie',NULL,2,164),(486,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,3,164),(487,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,1,165),(488,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,2,165),(489,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,3,165),(490,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,1,166),(491,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,2,166),(492,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,3,166),(493,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,1,167),(494,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,2,167),(495,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,3,167),(496,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,1,168),(497,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,2,168),(498,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,3,168),(499,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,1,169),(500,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,2,169),(501,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,3,169),(502,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,1,170),(503,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,2,170),(504,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,3,170),(505,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,1,171),(506,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,2,171),(507,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,3,171),(508,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,1,172),(509,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,2,172),(510,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,3,172),(511,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,1,173),(512,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,2,173),(513,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,3,173),(514,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,1,174),(515,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,2,174),(516,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,3,174),(517,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,1,175),(518,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,2,175),(519,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,3,175),(520,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,1,176),(521,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,2,176),(522,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,3,176),(523,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,1,177),(524,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,2,177),(525,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,3,177),(526,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,1,178),(527,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,2,178),(528,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,3,178),(529,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,1,179),(530,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,2,179),(531,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,3,179),(532,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,1,180),(533,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,2,180),(534,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,3,180),(535,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,1,181),(536,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvanie',NULL,2,181),(537,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,3,181),(538,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,1,182),(539,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,2,182),(540,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,3,182),(541,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,1,183),(542,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,2,183),(543,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,3,183),(544,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,1,184),(545,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'ÃŽle-du-Prince-Ã‰douard',NULL,2,184),(546,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,3,184),(547,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,1,185),(548,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,2,185),(549,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,3,185),(550,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,1,186),(551,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,2,186),(552,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,3,186),(553,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Almeria',NULL,1,187),(554,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,2,187),(555,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,3,187),(556,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,1,188),(557,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,2,188),(558,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,3,188),(559,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,1,189),(560,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,2,189),(561,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,3,189),(562,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,1,190),(563,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,2,190),(564,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,3,190),(565,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,1,191),(566,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,2,191),(567,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,3,191),(568,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,1,192),(569,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,2,192),(570,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,3,192),(571,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,1,193),(572,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,2,193),(573,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,3,193),(574,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,1,194),(575,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,2,194),(576,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,3,194),(577,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,1,195),(578,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,2,195),(579,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,3,195),(580,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,1,196),(581,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,2,196),(582,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,3,196),(583,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,1,197),(584,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,2,197),(585,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,3,197),(586,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,1,198),(587,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,2,198),(588,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,3,198),(589,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,1,199),(590,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,2,199),(591,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,3,199),(592,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,1,200),(593,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,2,200),(594,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,3,200),(595,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,1,201),(596,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,2,201),(597,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,3,201),(598,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,1,202),(599,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,2,202),(600,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,3,202),(601,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,1,203),(602,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,2,203),(603,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,3,203),(604,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,1,204),(605,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,2,204),(606,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,3,204),(607,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,1,205),(608,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,2,205),(609,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,3,205),(610,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,1,206),(611,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,2,206),(612,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,3,206),(613,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,1,207),(614,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,2,207),(615,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,3,207),(616,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,1,208),(617,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,2,208),(618,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,3,208),(619,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,1,209),(620,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,2,209),(621,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,3,209),(622,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,1,210),(623,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,2,210),(624,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,3,210),(625,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,1,211),(626,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,2,211),(627,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,3,211),(628,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,1,212),(629,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,2,212),(630,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,3,212),(631,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,1,213),(632,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,2,213),(633,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,3,213),(634,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,1,214),(635,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,2,214),(636,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,3,214),(637,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,1,215),(638,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,2,215),(639,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,3,215),(640,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,1,216),(641,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,2,216),(642,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,3,216),(643,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,1,217),(644,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,2,217),(645,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,3,217),(646,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,1,218),(647,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,2,218),(648,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,3,218),(649,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,1,219),(650,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,2,219),(651,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,3,219);
/*!40000 ALTER TABLE `zone_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 22:34:32
