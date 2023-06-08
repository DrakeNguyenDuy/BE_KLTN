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
INSERT INTO `certificate` VALUES ('5f403e4d-4e03-499e-b66f-a9d4310b40c0','www.404.com/1','Chứng chỉ đa cấp xuyên lục địa','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
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
INSERT INTO `country_description` VALUES (1,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,1,1),(2,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,2,1),(3,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afganistán',NULL,3,1),(4,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Åland Islands',NULL,1,2),(5,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Îles Åland',NULL,2,2),(6,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Islas Aland',NULL,3,2),(7,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,1,3),(8,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albanie',NULL,2,3),(9,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,3,3),(10,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Algeria',NULL,1,4),(11,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Algérie',NULL,2,4),(12,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argelia',NULL,3,4),(13,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'American Samoa',NULL,1,5),(14,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa américaines',NULL,2,5),(15,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa Americana',NULL,3,5),(16,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,1,6),(17,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorre',NULL,2,6),(18,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,3,6),(19,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,1,7),(20,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,2,7),(21,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,3,7),(22,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,1,8),(23,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,2,8),(24,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguila',NULL,3,8),(25,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua & Barbuda',NULL,1,9),(26,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua-et-Barbuda',NULL,2,9),(27,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua y Barbuda',NULL,3,9),(28,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,1,10),(29,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentine',NULL,2,10),(30,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,3,10),(31,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,1,11),(32,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Arménie',NULL,2,11),(33,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,3,11),(34,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,1,12),(35,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,2,12),(36,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,3,12),(37,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australia',NULL,1,13),(38,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australie',NULL,2,13),(39,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Australia',NULL,3,13),(40,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,1,14),(41,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Autriche',NULL,2,14),(42,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,3,14),(43,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaijan',NULL,1,15),(44,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaïdjan',NULL,2,15),(45,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaiyán',NULL,3,15),(46,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,1,16),(47,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,2,16),(48,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,3,16),(49,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahrain',NULL,1,17),(50,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahreïn',NULL,2,17),(51,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Baréin',NULL,3,17),(52,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,1,18),(53,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,2,18),(54,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladés',NULL,3,18),(55,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,1,19),(56,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbade',NULL,2,19),(57,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,3,19),(58,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belarus',NULL,1,20),(59,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Biélorussie',NULL,2,20),(60,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bielorrusia',NULL,3,20),(61,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgium',NULL,1,21),(62,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgique',NULL,2,21),(63,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bélgica',NULL,3,21),(64,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,1,22),(65,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,2,22),(66,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belice',NULL,3,22),(67,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Benin',NULL,1,23),(68,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bénin',NULL,2,23),(69,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Benín',NULL,3,23),(70,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermuda',NULL,1,24),(71,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudes',NULL,2,24),(72,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudas',NULL,3,24),(73,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhutan',NULL,1,25),(74,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhoutan',NULL,2,25),(75,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bután',NULL,3,25),(76,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,1,26),(77,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivie',NULL,2,26),(78,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,3,26),(79,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia & Herzegovina',NULL,1,27),(80,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnie-Herzégovine',NULL,2,27),(81,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia y Herzegovina',NULL,3,27),(82,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,1,28),(83,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,2,28),(84,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botsuana',NULL,3,28),(85,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brazil',NULL,1,29),(86,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brésil',NULL,2,29),(87,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brasil',NULL,3,29),(88,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'British Indian Ocean Territory',NULL,1,30),(89,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territoire britannique de l’océan Indien',NULL,2,30),(90,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territorio Británico del Océano Índico',NULL,3,30),(91,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,1,31),(92,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,2,31),(93,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunéi',NULL,3,31),(94,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,1,32),(95,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgarie',NULL,2,32),(96,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,3,32),(97,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,1,33),(98,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,2,33),(99,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,3,33),(100,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,1,34),(101,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,2,34),(102,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,3,34),(103,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodia',NULL,1,35),(104,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodge',NULL,2,35),(105,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Camboya',NULL,3,35),(106,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroon',NULL,1,36),(107,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroun',NULL,2,36),(108,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Camerún',NULL,3,36),(109,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,1,37),(110,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,2,37),(111,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canadá',NULL,3,37),(112,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cape Verde',NULL,1,38),(113,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cap-Vert',NULL,2,38),(114,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cabo Verde',NULL,3,38),(115,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cayman Islands',NULL,1,39),(116,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Îles Caïmans',NULL,2,39),(117,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Caimán',NULL,3,39),(118,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Central African Republic',NULL,1,40),(119,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'République centrafricaine',NULL,2,40),(120,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'República Centroafricana',NULL,3,40),(121,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,1,41),(122,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Tchad',NULL,2,41),(123,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,3,41),(124,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,1,42),(125,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chili',NULL,2,42),(126,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,3,42),(127,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,1,43),(128,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chine',NULL,2,43),(129,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,3,43),(130,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Christmas Island',NULL,1,44),(131,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Île Christmas',NULL,2,44),(132,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Isla de Navidad',NULL,3,44),(133,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cocos (Keeling) Islands',NULL,1,45),(134,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Îles Cocos',NULL,2,45),(135,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cocos',NULL,3,45),(136,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,1,46),(137,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombie',NULL,2,46),(138,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,3,46),(139,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoros',NULL,1,47),(140,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comores',NULL,2,47),(141,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoras',NULL,3,47),(142,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Brazzaville',NULL,1,48),(143,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Brazzaville',NULL,2,48),(144,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo',NULL,3,48),(145,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Kinshasa',NULL,1,49),(146,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Kinshasa',NULL,2,49),(147,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'República Democrática del Congo',NULL,3,49),(148,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cook Islands',NULL,1,50),(149,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Îles Cook',NULL,2,50),(150,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cook',NULL,3,50),(151,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,1,51),(152,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,2,51),(153,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,3,51),(154,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Côte d’Ivoire',NULL,1,52),(155,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Côte d’Ivoire',NULL,2,52),(156,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Côte d’Ivoire',NULL,3,52),(157,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatia',NULL,1,53),(158,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatie',NULL,2,53),(159,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croacia',NULL,3,53),(160,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,1,54),(161,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,2,54),(162,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,3,54),(163,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cyprus',NULL,1,55),(164,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chypre',NULL,2,55),(165,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chipre',NULL,3,55),(166,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Czechia',NULL,1,56),(167,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Tchéquie',NULL,2,56),(168,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chequia',NULL,3,56),(169,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Denmark',NULL,1,57),(170,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Danemark',NULL,2,57),(171,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dinamarca',NULL,3,57),(172,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,1,58),(173,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,2,58),(174,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Yibuti',NULL,3,58),(175,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,1,59),(176,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominique',NULL,2,59),(177,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,3,59),(178,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominican Republic',NULL,1,60),(179,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'République dominicaine',NULL,2,60),(180,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'República Dominicana',NULL,3,60),(181,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,1,61),(182,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Équateur',NULL,2,61),(183,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,3,61),(184,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egypt',NULL,1,62),(185,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Égypte',NULL,2,62),(186,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egipto',NULL,3,62),(187,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,1,63),(188,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Salvador',NULL,2,63),(189,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,3,63),(190,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Equatorial Guinea',NULL,1,64),(191,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guinée équatoriale',NULL,2,64),(192,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guinea Ecuatorial',NULL,3,64),(193,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,1,65),(194,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Érythrée',NULL,2,65),(195,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,3,65),(196,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,1,66),(197,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonie',NULL,2,66),(198,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,3,66),(199,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ethiopia',NULL,1,67),(200,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Éthiopie',NULL,2,67),(201,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Etiopía',NULL,3,67),(202,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Falkland Islands',NULL,1,68),(203,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Îles Malouines',NULL,2,68),(204,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Malvinas',NULL,3,68),(205,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Faroe Islands',NULL,1,69),(206,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Îles Féroé',NULL,2,69),(207,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Feroe',NULL,3,69),(208,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiji',NULL,1,70),(209,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fidji',NULL,2,70),(210,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiyi',NULL,3,70),(211,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finland',NULL,1,71),(212,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlande',NULL,2,71),(213,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlandia',NULL,3,71),(214,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,1,72),(215,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,2,72),(216,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Francia',NULL,3,72),(217,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Guiana',NULL,1,73),(218,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guyane française',NULL,2,73),(219,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guayana Francesa',NULL,3,73),(220,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Polynesia',NULL,1,74),(221,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Polynésie française',NULL,2,74),(222,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Polinesia Francesa',NULL,3,74),(223,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,1,75),(224,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,2,75),(225,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabón',NULL,3,75),(226,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,1,76),(227,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambie',NULL,2,76),(228,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,3,76),(229,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,1,77),(230,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Géorgie',NULL,2,77),(231,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,3,77),(232,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Germany',NULL,1,78),(233,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Allemagne',NULL,2,78),(234,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Alemania',NULL,3,78),(235,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,1,79),(236,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,2,79),(237,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,3,79),(238,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,1,80),(239,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,2,80),(240,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,3,80),(241,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Greece',NULL,1,81),(242,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Grèce',NULL,2,81),(243,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grecia',NULL,3,81),(244,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Greenland',NULL,1,82),(245,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenland',NULL,2,82),(246,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenlandia',NULL,3,82),(247,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenada',NULL,1,83),(248,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenade',NULL,2,83),(249,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Granada',NULL,3,83),(250,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,1,84),(251,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,2,84),(252,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadalupe',NULL,3,84),(253,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,1,85),(254,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,2,85),(255,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,3,85),(256,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,1,86),(257,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,2,86),(258,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,3,86),(259,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernsey',NULL,1,87),(260,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,2,87),(261,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,3,87),(262,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,1,88),(263,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinée',NULL,2,88),(264,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,3,88),(265,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-Bissau',NULL,1,89),(266,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinée-Bissau',NULL,2,89),(267,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-Bisáu',NULL,3,89),(268,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,1,90),(269,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,2,90),(270,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,3,90),(271,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Haiti',NULL,1,91),(272,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Haïti',NULL,2,91),(273,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Haití',NULL,3,91),(274,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Vatican City',NULL,1,92),(275,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'État de la Cité du Vatican',NULL,2,92),(276,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ciudad del Vaticano',NULL,3,92),(277,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,1,93),(278,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,2,93),(279,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,3,93),(280,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hong Kong SAR China',NULL,1,94),(281,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'R.A.S. chinoise de Hong Kong',NULL,2,94),(282,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'RAE de Hong Kong (China)',NULL,3,94),(283,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hungary',NULL,1,95),(284,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hongrie',NULL,2,95),(285,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hungría',NULL,3,95),(286,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iceland',NULL,1,96),(287,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islande',NULL,2,96),(288,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islandia',NULL,3,96),(289,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,1,97),(290,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Inde',NULL,2,97),(291,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,3,97),(292,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,1,98),(293,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonésie',NULL,2,98),(294,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,3,98),(295,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,1,99),(296,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,2,99),(297,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irán',NULL,3,99),(298,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iraq',NULL,1,100),(299,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,2,100),(300,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,3,100),(301,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ireland',NULL,1,101),(302,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlande',NULL,2,101),(303,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlanda',NULL,3,101),(304,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isle of Man',NULL,1,102),(305,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Île de Man',NULL,2,102),(306,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isla de Man',NULL,3,102),(307,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,1,103),(308,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israël',NULL,2,103),(309,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,3,103),(310,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italy',NULL,1,104),(311,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italie',NULL,2,104),(312,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italia',NULL,3,104),(313,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,1,105),(314,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaïque',NULL,2,105),(315,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,3,105),(316,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Japan',NULL,1,106),(317,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Japon',NULL,2,106),(318,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Japón',NULL,3,106),(319,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,1,107),(320,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,2,107),(321,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,3,107),(322,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordan',NULL,1,108),(323,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordanie',NULL,2,108),(324,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordania',NULL,3,108),(325,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,1,109),(326,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,2,109),(327,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazajistán',NULL,3,109),(328,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,1,110),(329,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,2,110),(330,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenia',NULL,3,110),(331,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,1,111),(332,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,2,111),(333,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,3,111),(334,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Korea',NULL,1,112),(335,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corée du Nord',NULL,2,112),(336,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Norte',NULL,3,112),(337,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'South Korea',NULL,1,113),(338,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corée du Sud',NULL,2,113),(339,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Sur',NULL,3,113),(340,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,1,114),(341,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Koweït',NULL,2,114),(342,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,3,114),(343,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kyrgyzstan',NULL,1,115),(344,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kirghizstan',NULL,2,115),(345,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kirguistán',NULL,3,115),(346,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,1,116),(347,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,2,116),(348,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,3,116),(349,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Latvia',NULL,1,117),(350,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lettonie',NULL,2,117),(351,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Letonia',NULL,3,117),(352,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lebanon',NULL,1,118),(353,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liban',NULL,2,118),(354,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Líbano',NULL,3,118),(355,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,1,119),(356,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,2,119),(357,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesoto',NULL,3,119),(358,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,1,120),(359,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,2,120),(360,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,3,120),(361,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libya',NULL,1,121),(362,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libye',NULL,2,121),(363,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libia',NULL,3,121),(364,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,1,122),(365,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,2,122),(366,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,3,122),(367,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lithuania',NULL,1,123),(368,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituanie',NULL,2,123),(369,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituania',NULL,3,123),(370,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,1,124),(371,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,2,124),(372,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxemburgo',NULL,3,124),(373,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macao SAR China',NULL,1,125),(374,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'R.A.S. chinoise de Macao',NULL,2,125),(375,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'RAE de Macao (China)',NULL,3,125),(376,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Macedonia',NULL,1,126),(377,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macédoine du Nord',NULL,2,126),(378,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macedonia del Norte',NULL,3,126),(379,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,1,127),(380,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,2,127),(381,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,3,127),(382,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,1,128),(383,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,2,128),(384,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaui',NULL,3,128),(385,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaysia',NULL,1,129),(386,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaisie',NULL,2,129),(387,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malasia',NULL,3,129),(388,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,1,130),(389,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,2,130),(390,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,3,130),(391,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,1,131),(392,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malte',NULL,2,131),(393,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,3,131),(394,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Marshall Islands',NULL,1,132),(395,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Îles Marshall',NULL,2,132),(396,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Islas Marshall',NULL,3,132),(397,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,1,133),(398,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,2,133),(399,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinica',NULL,3,133),(400,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,1,134),(401,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritanie',NULL,2,134),(402,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,3,134),(403,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritius',NULL,1,135),(404,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Maurice',NULL,2,135),(405,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauricio',NULL,3,135),(406,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mayotte',NULL,1,136),(407,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,2,136),(408,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,3,136),(409,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexico',NULL,1,137),(410,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexique',NULL,2,137),(411,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'México',NULL,3,137),(412,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,1,138),(413,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronésie',NULL,2,138),(414,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,3,138),(415,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldova',NULL,1,139),(416,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavie',NULL,2,139),(417,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavia',NULL,3,139),(418,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,1,140),(419,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,2,140),(420,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mónaco',NULL,3,140),(421,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,1,141),(422,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolie',NULL,2,141),(423,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,3,141),(424,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,1,142),(425,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monténégro',NULL,2,142),(426,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,3,142),(427,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,1,143),(428,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,2,143),(429,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,3,143),(430,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Morocco',NULL,1,144),(431,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Maroc',NULL,2,144),(432,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Marruecos',NULL,3,144),(433,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,1,145),(434,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,2,145),(435,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,3,145),(436,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Burma)',NULL,1,146),(437,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmanie)',NULL,2,146),(438,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmania)',NULL,3,146),(439,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,1,147),(440,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibie',NULL,2,147),(441,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,3,147),(442,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,1,148),(443,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,2,148),(444,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,3,148),(445,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,1,149),(446,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Népal',NULL,2,149),(447,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,3,149),(448,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Netherlands',NULL,1,150),(449,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pays-Bas',NULL,2,150),(450,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Países Bajos',NULL,3,150),(451,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Caledonia',NULL,1,151),(452,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-Calédonie',NULL,2,151),(453,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Caledonia',NULL,3,151),(454,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Zealand',NULL,1,152),(455,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-Zélande',NULL,2,152),(456,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Zelanda',NULL,3,152),(457,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,1,153),(458,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,2,153),(459,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,3,153),(460,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,1,154),(461,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,2,154),(462,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Níger',NULL,3,154),(463,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,1,155),(464,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,2,155),(465,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,3,155),(466,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,1,156),(467,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,2,156),(468,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,3,156),(469,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norfolk Island',NULL,1,157),(470,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Île Norfolk',NULL,2,157),(471,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Isla Norfolk',NULL,3,157),(472,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Northern Mariana Islands',NULL,1,158),(473,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Îles Mariannes du Nord',NULL,2,158),(474,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Islas Marianas del Norte',NULL,3,158),(475,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norway',NULL,1,159),(476,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norvège',NULL,2,159),(477,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Noruega',NULL,3,159),(478,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,1,160),(479,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,2,160),(480,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Omán',NULL,3,160),(481,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,1,161),(482,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,2,161),(483,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistán',NULL,3,161),(484,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palau',NULL,1,162),(485,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,2,162),(486,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,3,162),(487,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palestinian Territories',NULL,1,163),(488,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Territoires palestiniens',NULL,2,163),(489,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Territorios Palestinos',NULL,3,163),(490,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,1,164),(491,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,2,164),(492,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panamá',NULL,3,164),(493,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papua New Guinea',NULL,1,165),(494,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papouasie-Nouvelle-Guinée',NULL,2,165),(495,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papúa Nueva Guinea',NULL,3,165),(496,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,1,166),(497,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,2,166),(498,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,3,166),(499,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Peru',NULL,1,167),(500,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pérou',NULL,2,167),(501,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Perú',NULL,3,167),(502,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,1,168),(503,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,2,168),(504,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Filipinas',NULL,3,168),(505,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pitcairn Islands',NULL,1,169),(506,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Îles Pitcairn',NULL,2,169),(507,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Islas Pitcairn',NULL,3,169),(508,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Poland',NULL,1,170),(509,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pologne',NULL,2,170),(510,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Polonia',NULL,3,170),(511,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,1,171),(512,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,2,171),(513,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,3,171),(514,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,1,172),(515,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Porto Rico',NULL,2,172),(516,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,3,172),(517,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,1,173),(518,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,2,173),(519,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Catar',NULL,3,173),(520,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Réunion',NULL,1,174),(521,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'La Réunion',NULL,2,174),(522,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Reunión',NULL,3,174),(523,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Romania',NULL,1,175),(524,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Roumanie',NULL,2,175),(525,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rumanía',NULL,3,175),(526,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russia',NULL,1,176),(527,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russie',NULL,2,176),(528,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rusia',NULL,3,176),(529,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,1,177),(530,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,2,177),(531,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Ruanda',NULL,3,177),(532,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Helena',NULL,1,178),(533,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-Hélène',NULL,2,178),(534,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa Elena',NULL,3,178),(535,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Kitts & Nevis',NULL,1,179),(536,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Christophe-et-Niévès',NULL,2,179),(537,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Cristóbal y Nieves',NULL,3,179),(538,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Lucia',NULL,1,180),(539,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-Lucie',NULL,2,180),(540,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa Lucía',NULL,3,180),(541,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Pierre & Miquelon',NULL,1,181),(542,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Pierre-et-Miquelon',NULL,2,181),(543,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Pedro y Miquelón',NULL,3,181),(544,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Vincent & Grenadines',NULL,1,182),(545,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Vincent-et-les Grenadines',NULL,2,182),(546,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Vicente y las Granadinas',NULL,3,182),(547,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,1,183),(548,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,2,183),(549,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,3,183),(550,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,1,184),(551,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Marin',NULL,2,184),(552,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,3,184),(553,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'São Tomé & Príncipe',NULL,1,185),(554,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sao Tomé-et-Principe',NULL,2,185),(555,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santo Tomé y Príncipe',NULL,3,185),(556,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saudi Arabia',NULL,1,186),(557,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabie saoudite',NULL,2,186),(558,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabia Saudí',NULL,3,186),(559,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,1,187),(560,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sénégal',NULL,2,187),(561,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,3,187),(562,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Serbia',NULL,1,188),(563,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbie',NULL,2,188),(564,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbia',NULL,3,188),(565,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,1,189),(566,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,2,189),(567,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,3,189),(568,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,1,190),(569,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,2,190),(570,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leona',NULL,3,190),(571,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapore',NULL,1,191),(572,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapour',NULL,2,191),(573,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapur',NULL,3,191),(574,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovakia',NULL,1,192),(575,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovaquie',NULL,2,192),(576,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovaquia',NULL,3,192),(577,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovenia',NULL,1,193),(578,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovénie',NULL,2,193),(579,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovenia',NULL,3,193),(580,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Solomon Islands',NULL,1,194),(581,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Îles Salomon',NULL,2,194),(582,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Islas Salomón',NULL,3,194),(583,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,1,195),(584,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalie',NULL,2,195),(585,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,3,195),(586,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'South Africa',NULL,1,196),(587,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Afrique du Sud',NULL,2,196),(588,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sudáfrica',NULL,3,196),(589,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Spain',NULL,1,197),(590,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Espagne',NULL,2,197),(591,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'España',NULL,3,197),(592,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,1,198),(593,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,2,198),(594,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,3,198),(595,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sudan',NULL,1,199),(596,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Soudan',NULL,2,199),(597,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sudán',NULL,3,199),(598,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,1,200),(599,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,2,200),(600,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Surinam',NULL,3,200),(601,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard & Jan Mayen',NULL,1,201),(602,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard et Jan Mayen',NULL,2,201),(603,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard y Jan Mayen',NULL,3,201),(604,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,1,202),(605,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,2,202),(606,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Esuatini',NULL,3,202),(607,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sweden',NULL,1,203),(608,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suède',NULL,2,203),(609,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suecia',NULL,3,203),(610,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Switzerland',NULL,1,204),(611,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suisse',NULL,2,204),(612,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suiza',NULL,3,204),(613,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syria',NULL,1,205),(614,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syrie',NULL,2,205),(615,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Siria',NULL,3,205),(616,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taiwan',NULL,1,206),(617,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taïwan',NULL,2,206),(618,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taiwán',NULL,3,206),(619,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tajikistan',NULL,1,207),(620,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tadjikistan',NULL,2,207),(621,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tayikistán',NULL,3,207),(622,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,1,208),(623,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzanie',NULL,2,208),(624,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,3,208),(625,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Thailand',NULL,1,209),(626,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Thaïlande',NULL,2,209),(627,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tailandia',NULL,3,209),(628,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,1,210),(629,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor oriental',NULL,2,210),(630,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,3,210),(631,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,1,211),(632,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,2,211),(633,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,3,211),(634,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,1,212),(635,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,2,212),(636,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,3,212),(637,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,1,213),(638,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,2,213),(639,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,3,213),(640,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad & Tobago',NULL,1,214),(641,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinité-et-Tobago',NULL,2,214),(642,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad y Tobago',NULL,3,214),(643,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisia',NULL,1,215),(644,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisie',NULL,2,215),(645,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Túnez',NULL,3,215),(646,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkey',NULL,1,216),(647,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turquie',NULL,2,216),(648,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turquía',NULL,3,216),(649,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkmenistan',NULL,1,217),(650,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkménistan',NULL,2,217),(651,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkmenistán',NULL,3,217),(652,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turks & Caicos Islands',NULL,1,218),(653,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Îles Turques-et-Caïques',NULL,2,218),(654,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas Turcas y Caicos',NULL,3,218),(655,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,1,219),(656,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,2,219),(657,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,3,219),(658,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,1,220),(659,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ouganda',NULL,2,220),(660,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,3,220),(661,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,1,221),(662,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,2,221),(663,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ucrania',NULL,3,221),(664,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Arab Emirates',NULL,1,222),(665,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Émirats arabes unis',NULL,2,222),(666,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Emiratos Árabes Unidos',NULL,3,222),(667,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Kingdom',NULL,1,223),(668,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Royaume-Uni',NULL,2,223),(669,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Reino Unido',NULL,3,223),(670,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United States',NULL,1,224),(671,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'États-Unis',NULL,2,224),(672,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Estados Unidos',NULL,3,224),(673,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Outlying Islands',NULL,1,225),(674,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Îles mineures éloignées des États-Unis',NULL,2,225),(675,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas menores alejadas de EE. UU.',NULL,3,225),(676,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,1,226),(677,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,2,226),(678,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,3,226),(679,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uzbekistan',NULL,1,227),(680,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ouzbékistan',NULL,2,227),(681,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uzbekistán',NULL,3,227),(682,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,1,228),(683,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,2,228),(684,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,3,228),(685,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,1,229),(686,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,2,229),(687,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,3,229),(688,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,1,230),(689,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Viêt Nam',NULL,2,230),(690,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,3,230),(691,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'British Virgin Islands',NULL,1,231),(692,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Îles Vierges britanniques',NULL,2,231),(693,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas Vírgenes Británicas',NULL,3,231),(694,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Virgin Islands',NULL,1,232),(695,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Îles Vierges des États-Unis',NULL,2,232),(696,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas Vírgenes de EE. UU.',NULL,3,232),(697,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis & Futuna',NULL,1,233),(698,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis-et-Futuna',NULL,2,233),(699,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis y Futuna',NULL,3,233),(700,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Western Sahara',NULL,1,234),(701,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Sahara occidental',NULL,2,234),(702,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Sáhara Occidental',NULL,3,234),(703,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,1,235),(704,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yémen',NULL,2,235),(705,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,3,235),(706,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,1,236),(707,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambie',NULL,2,236),(708,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,3,236),(709,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,1,237),(710,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,2,237),(711,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabue',NULL,3,237);
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
INSERT INTO `customer` VALUES (150,_binary '\0',NULL,'2023-06-02 06:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nd1long@gmail.com','LONG','M','LONG','nd1long@gmail.com','$2a$10$PZkJvjw3MeS3yPCEpG0N1ev2.vHfV67sYi8UGiQ3NOAQAbnJDvt.u',NULL),(200,_binary '\0',NULL,'2023-06-04 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ndlong28@gmail.com','Long',NULL,'Nguyen Duy','ndlong28@gmail.com','$2a$10$vf19FUZolHFtX1V.81FPgOjXauxSDVeBRwH795gTjQ61INyPS4Kn.',NULL),(250,_binary '\0',NULL,'2023-06-04 21:56:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n@gmail.com','Long',NULL,'Nguyen Duy','n@gmail.com','$2a$10$8QxgxJwxlNlE/0KbqMMhhef6ftxg4ARMo7yBdoxFdo6ougBta.5wO',NULL),(300,_binary '\0',NULL,'2023-06-04 22:03:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADFADFDA','Long',NULL,'Nguyen Duy','FADFADFDA','$2a$10$hrfjwSWQtN8OL2FAKP/gBuOjmryT.BKByi7/qybNUWfr5vVds7jAm',NULL),(301,_binary '\0',NULL,'2023-06-04 22:04:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADCFADFDA','Long',NULL,'Nguyen Duy','FADCFADFDA','$2a$10$8dV/0/dOBfhl2ZvjvXX//.U7kUIz1CCTQjLz2U0zj5pgFwqrBrg1W',NULL),(350,_binary '\0',NULL,'2023-06-04 22:29:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','Long',NULL,'Nguyen Duy','11','$2a$10$mVznvJeKC7lbq69pDOuAsekhHbgJ40Wgg6Y9mWoLNAw6wKL.jA1ga',NULL),(400,_binary '\0',NULL,'2023-06-05 07:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','LONG','M','LONG','2','$2a$10$py5v/xirBlHZFbaD1xYAceFagWlIiTIJV.GIACMH0R1pgUbW1DKuO',NULL),(450,_binary '\0',NULL,'2023-06-05 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2h','LONG','M','LONG','2h','$2a$10$xzNuMCgmsigbIE5QNqFu3eFpzfcsEH1Ob79.60xXQH0jtIgP/qv9W',NULL),(451,_binary '\0',NULL,'2023-06-05 20:33:58',NULL,NULL,NULL,NULL,NULL,NULL,'2003-02-09 00:00:00','23h','Nguyễn Dũy f','M','Long f','23h','$2a$10$uvxF0aciYoSf/hN9JPqhCO2bn8ekEHbHArkg/yeV3R2TZy0kuwoSW',NULL),(500,_binary '\0',NULL,'2023-06-05 20:40:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'long','Long',NULL,'Nguyen Duy','long','$2a$10$gINxxwKvs7am5uA4dwdOtO33633u1n8Sj3FvLya3mSp.6fvNcrJly',NULL);
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
INSERT INTO `cv` VALUES ('796aa7de-2d6b-4c00-b7d5-4c2637ba638c','Thôn Kỳ Tân, xã Đức Lợi ','Senior Intern Java',451);
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
INSERT INTO `district_description` VALUES (1,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 1',1),(2,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 2',1),(3,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 3',1),(4,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 4',1),(5,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 5',1),(6,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Quận 6',1),(7,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 7',1),(8,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 8',1),(9,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 9',1),(10,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 10',1),(11,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 11',1),(12,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Quận 12',1),(13,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Bình Thạnh',1),(14,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Gò Vấp',1),(15,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Phú Nhuận',1),(16,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Tân Bình',1),(17,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Tân Phú',1),(18,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Thủ Đức',1),(19,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Bình Tân',1),(20,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Củ Chi',1),(21,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Hóc Môn',1),(22,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Nhà Bè',1),(23,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Cần Giờ',1);
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
INSERT INTO `education` VALUES ('399b5bee-5ab4-4e06-be5c-0675d0089535','2010-12-26 00:00:00',_binary '','Học sinh chứ gì nữa','Trường THPT Số 2 Mộ Đức','2010-12-26 00:00:00','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
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
INSERT INTO `english_level` VALUES (1,NULL,NULL,NULL,'LV0','Không biết'),(2,NULL,NULL,NULL,'LV1','Đọc hiểu cơ bản'),(3,NULL,NULL,NULL,'LV2','Giao tiếp tốt'),(4,NULL,NULL,NULL,'LV3','Thành thạo các kỹ năng');
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
INSERT INTO `experience_description` VALUES (1,'none-ex','Chưa có kinh nghiệm',NULL,NULL,NULL),(2,'less6','Ít hơn 6 tháng',NULL,NULL,NULL),(4,'m1y','Hơn một năm',NULL,NULL,NULL),(6,'kinhnghiemtest','Kinh nghiệm test',NULL,NULL,NULL),(7,'kinhnghiemtest','Kinh nghiệm test',NULL,NULL,NULL);
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
INSERT INTO `location_description` VALUES (1,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(2,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(3,NULL,NULL,NULL,NULL,1,1,1),(4,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(6,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(7,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(8,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(9,'thôn kỳ tân',NULL,NULL,NULL,1,1,1);
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
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2023-05-17',NULL,NULL,_binary '','IN','contact@shopizer.com',NULL,'december','1234 Street address','My city','Shopizer','888-888-8888','H2H-2H2',NULL,_binary '\0','LB',37,105,1,NULL,9),(2,NULL,'2023-05-17 03:38:05',NULL,'nhahangmoi',NULL,_binary '',NULL,'2023-05-03',NULL,NULL,_binary '','CM','ndlong@gmail.com','277349150_1032746354265447_2768265822102840642_n.jpg',NULL,'chưa biết','Ho Chi Minh City','Công ty vật liệu xây dựng 1111','0379755079','84',NULL,_binary '','JOB',37,81,4,NULL,9);
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
INSERT INTO `pay_cycle_description` VALUES (1,NULL,NULL,NULL,'day','Ngày'),(2,NULL,NULL,NULL,'week','Tuần'),(3,NULL,NULL,NULL,'month','Tháng'),(4,NULL,NULL,NULL,'hour','Giờ'),(11,NULL,NULL,NULL,'test3','Long chinh');
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
INSERT INTO `position_description` VALUES (1,NULL,NULL,NULL,'intern','Thực tập sinh'),(2,NULL,NULL,NULL,'associate','Nhân viên chính thức'),(3,NULL,NULL,NULL,'manager','Quản lý');
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
INSERT INTO `product_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,'Đã chỉnh nội dung','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,151);
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
INSERT INTO `product_type` VALUES (1,NULL,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'GENERAL',NULL,NULL,NULL),(200,NULL,'2023-05-25 22:03:05','2023-05-25 22:03:05',NULL,'buonban',NULL,NULL,'Buôn bán');
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
INSERT INTO `profile` VALUES (3,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\�ICC_PROFILE\0\0\0\�lcms\0\0mntrRGB XYZ \�\0\0\0	\0\0acspMSFT\0\0\0\0sawsctrl\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-hand��\0=@��=@t,���\"�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	desc\0\0\0�\0\0\0_cprt\0\0\0\0\0wtpt\0\0\0\0\0rXYZ\0\0,\0\0\0gXYZ\0\0@\0\0\0bXYZ\0\0T\0\0\0rTRC\0\0h\0\0\0`gTRC\0\0h\0\0\0`bTRC\0\0h\0\0\0`desc\0\0\0\0\0\0\0uRGB\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0CC0\0XYZ \0\0\0\0\0\0�T\0\0\0\0\�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0*\0\0\0|\0��u�\�N\nb�\��j. C$�)j.~3\�9�?\�FWM6Tv\\dl�uV~��,�6�����۾�\�\�\�e\�w�����\�\0C\0		\Z\Z&\"\"&0-0>>T�\�\0C		\Z\Z&\"\"&0-0>>T��\0�\0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0\�p)q��&1�ƅ9lv�t�w�\�\�\�6�}iG8\�@\�y\�*k6\��\�jR�\��T\�\�ҁ�\�y&�I��\�\��9\\u��6����H��\�4�ᴶ\�I\�Ӝ\�\�3��8�ݓ\�0}\Z\��-I�T�����cP�z\"\�\�A\���k�zɝ�^\�\�ZL;U�\�+U�*���\�P\r]#s⺩u��׌����d�G۟`+�ە\�=�Z�\�\�\�Y���\�~Y��\�vu\�_]��-(.\��b\�\�^�\�6H\�؜���S�EB@�zTJG�\0��Q\�&9c�\�I\�sJ�O\�O\r�\Z�&)	��c8\�ɧ��F*\�\��Z!O\0q�ƤX�9\�R�285!i�\�mޣ�*LJbʜ#9\�\�\�6-?\�\��8�Qq�w \�T�\r�\�:T�^\�4�z�=��\�+�y\�<G\�oLU�ѣ\\1�B�������>R��ip��Sl�ݩ�8\\�z�ƑU\"r##CR\�s�\�ϥX\�Pԛy��r\�(�[?)\�qR� Ր�Z���U�\�ԁLX\�\�<sS?\'�z�\�\�()Dj\"�z~И\'�����n�\�\�O\"�\�H��c\0I\�&\�\�*\�Rx朩�zb�\�Q �8ZyP2�1\�zT�c�\�(���\�9\�\rI�*�\�\�\nx�pޑ\\�%@OZM�#�VJ��4m\�9\�J��&r)Ȅu�y9ɧ��\�+�D@��*B02:Ԡ`\�\�ɥr\�\Z�w\���.\�R@Fh�\�#EKf�̾�G�\�L�������W��\�\�V�|�~8V#��\���\�I\�R\�*(U\�\�ɧ�_\�OPs��S\�v\�>���w��1V`E8(\�((�k~�H�B�i\�Oq���v�K\�oi�\�iʽr*YE!\�Pc99��4y<`�⡢�2\�]�\0��\�\0R�\�\�\���6D@\�B0s�Sm��j� �\�$\�,d\Z\�ّ�NqӥDP��5\'�<`R\nxAց�(\�Gju<�4�\0\�R\�L;�\�	�\�8�p],ܜ�ZӞ?0 �\�P�h\�<\rF����4c�P\��\�\���`�ˏ\�jV��\����fl�\��I\�Qy�R��f��i�\�\�t�#K+\�\��±\\�\�t�\�X]~g\"֏��p9\��)y\�å\�0��\�8��\�\�;\�G\�Ҩ�UC�6�`py\�O�\�#�u#L�Rv\�\���\�m�PW9ͽ����~\�\'<75\�y�\�\�ӊO�\�0Ǘ�P.tr�e���ҭ��\Z\�\�xr|�{Z\�\�ϕ�U+9\�}��x�\�l�Ե�ڏ�<})>\�r��N޴�\�\���\ZF��oq�\�\�\�?\�\�JmnzG^��9\�\�}��\��R,��m9��P-\�\�Gک\�s��Fi|�\�9\�u0\��\00�z���$>NsL�c�0�9Ȩ\�)Xw����1\Z�\�\\��\�h:8�\�դ�D �\�Et\"ܜ�\�[f\���\�\�\�<\�<NOs]A�\�?\�b� �������E(��\�]Oِ\�yG?J_��\�Ps����\�$�\�\�Ul�c\�\Z\�Ͳ)\�#I�t��s�\�\�\�r)$Hr\�utmg�8ϥ4\�M�SB�0�뒡K\0��g\"�?���(i�mn�2�\�\�\"�c!�\��A�I\'��HKS[\�oq���jO�\�\�\�#�ZK\�MXw|��öS�\�8~����9\�EYKX�\�g\'b\�1$i$#4\�\�.|�bcЛH�2q��=�9\�泹n\�0��؀\�\�>Y�\Z�\�\�è=k_쐓\�gڏ�\�:5&8�T��{�C/%:T\Z����R\\�Ι�!i9\rQ=�lO\�)Xw�����Z#��_\�&��\�\�yw�<V��|}K�O� \�4%(�g�\�\�����~����\�\�.�~95\�\���\�MKU�@wf�q4R�4�\�\�f��f��\��F\�/\�\�5uU\"�ւLt\�;��\�e��*\���s\�}\�f\�r\�y3LFI\�]+i�NC/\�U9t���D\�\�ᅯ���\�jq{+\�I�c�i�4dd�S��\�5i�\�*\�j�_\\\�;�ܞ��)ue��g�s�\�#\�0\'5\�X���gh�Q�\�̟\�^	}լuv�Q�\�\�L \�P\r5�\"�X8#��51y�-\�\�\'�\�����*KЪ\�����n3Ht\�9⥂\�L�\�\�Zږ�&�\r�18�1�qӟ�\�Q�\0g\�\��[�5t\rb.\�\�s2\�>�\�\�D�1\�X���l�\�,\\��\r\r۽Z	��[0\�� V~��\�h-Pm�\�{��l�\� \�\r���\�E��.�\�k�V;�{u�\�!���a\n~t\\?�+2\�&��x\�G>���ܓ�MKC��q�\�h\�2r�{�Yw+j�]�\�˻|\�\�H\�H(02����օ�O��x<\�CJ$x�\�\�95�\�I;���E9�=�\�r*Z3��~�\�Q��\�j�Sc\�sR�3P\�*\�q�RjL\���H.C���sV�UZ\nDi8J�m!\� +�K�?�A\�\�y8�`i�\�c5 DFhw�~	5Z\�T�NN=\�]�s\�4\��5�.cg\��ZH2��j)9\'.	�\�c�\��c�;\rl��㊽�EFT�ӓB@ʄڗo�Xۃ��`\�\r\\�n\�3ڤ~OZ��\�\�\�G�\�U��T8 ��	dEW\�y\��Gn\�c\��z\Zz�6\�u�4zԃ�\�zb�I\�\"���\����\�:Ӕ�A��	�\�0>¥Tn\�\�u�Er��#�8����:S;*�԰ �NP8�@\�b�h\��\�P��TdTE	�L��\�:�Sq؃ڎMJPc>��&?:Ab\"3�1��J8�PZ�\�c\r�S�ipx\�f\�Dm\�s�<\��px\�K-���\�Fs��n�{Rds\�ڢ\n\�\�U�\�\�9+@�_�=Oj\0\�:\��T\�T��R6x=�A-���:�*`�v\�\� \�8\�9�qX�)��a��ri�Ct\�<�\�4\�D�����\��njr\�K�\n\�\�)�b \����ϰ�r\��/<‱\�����1R1\�N)8<�\�+��z8��\��\�?BH\�(\��\r\���\09>��\� c���\�@�A<�_S\�0�\�G \�\�e#��\n�rE��8*:8�۞r\0\�R0*�\�\r��=G��B�\0\��\�ښ�$d�\�LT��H\�K�\�ҝ\�hA\�\�\�8���	�\�?i\��_���RT�c�d\�j\�I�\� �M���\n\�v\�R�	}���\�\r\�I5�\0��zW\�\�s�)=@ϯO�<goӭ0#r�\�\�SN\����v�e��9\'�148�!8�5\�\�\�x\�+��\��Q��ya��q@\�\0�\�@ ����\�\�p\�NMFr`Re�[�\�΢<�n$rA=i$fU�?Z�$�\0&�\�rs\�R@XpA\�\�\0{Y�9l�å[YShݒ�J�<��F�J�\r\n\�\�\�G�L>P@\�t��W�X��\�-L�\�F�\�c\�\'�D�E\�jv~�<\�\��\�\�FJ�\0�\�ּ�ɨ6N\�b>\�ҽ�^6-{\����ނ�l؃ߟj�;U(s�q�zb�0:\�=���\�Ts�H\�?�HĀ��gv5��Q�~1X�P�l\�ۊԀ�gw�-�;\��ă�v9\�Jv�r)�{!\�lb���4\�>��P\�+\�\�A\�;��l\�#�i�Hǥc{\0i:�Oe8\�\�Qv\��\0\�5 D03ӊ�(,c���Wީ\�\0�H\�G4�\\O�>\'\�o\�\�>0+w\�hd��\�E��L5/]�E�+\���H�\�f~\�5\����;���gHB.q\�>fX��N>Tbs\�*K|,j5��\�\"\�\�OL� �\�+����\�\�?�i\��M�6L<˙_Տ&��`q֥i��3�f��\��\nzE�\�w�\����FjUN\�\0���e�\�޵L\�ͤt\�ޓn@\�Z\�s�sL\�v�\�U&f\"\�p1ެ\0\�t\�65+�ڬ�c\0w�\�$4)\�Z�\Z)\'<�\� BMJc\�\�ǩ4\\��$\�\��F��\�Ҥx\�^��6u9>\���\�H��	\�H\�\�\�I\�M\�GԸ\�\�S�<.Kg=(�\�A��zg�V\0�ǭMЂO��\�\'�Qq\�C*3\�\��8�)�\0\�E;k��Z�#4\\|�1�N@J\��R�7�4�R\0�R�\�HrNs�O\�ݱSh\'*nR����Ԋ��=zS�\�\��\�\"\�H\�`v\�F(#�j|dsڐ�\��PR�RNE(\\�\�M��ڜ#\�D#;�jU�LT��у�\�K)!q��\n�R�\�\\\�\��\�@\�\r8/(8\�M.Τ\� =q\�i�;T�i�Fx9�\�v \�L�\�\�O\n\r8\�>�\�!:|��x^��\0��O*I\�4�RD-�֟��*O,g�8\'\�ړe$F�R�\�ҧT�(\�\�\�\�T\�v\"\0Ӯi@�5&̜T�L�\Z.2��sN(x8\�S9\�G�9��ZW�Q�\�Q֤Q�\�\�\�\�ԅ3\�pL\��\�pCUp�N��>\�b��`R(�=;T\�\rG0#�E?o9�6\Zv\�c�Ԕ�� `֝\�8�@\�zb�	�@�/)J\Z�/QFZ�\" t��\n}*}���zz�\�L��\�Z��f�m�\�f���Z��L\���i�\"�0)�{U�OΛ����v\�\��pEX��`�~�R �\�N��R\��\�M�sڋ�W\�GJ�Pj�\�,c9Xg���\�5�jjLi�a��m��\Z�\��\Ze�1\�(�+k\�-���gq<\�s1�3 \�G�!x��$Ѭ�\�B��V�^:PɌqO�\�\�\�G�G��\��\�P��bO0�+�e\\�8�\�)2\�\�ÓI�a�)#Ѭ�\�\�^��c\�\n]�{S\�}\�\�%ݘM�\�\�y+\�O�\�\�\�\�[EH��\���\�\�\�gݜ���l��W\��\���A\�\�WA�1��\�=����mO�\�\"�<?�}\�\n��\�(,qR�8�\�\�\�O�9��Ձ*\�0�G��\�0-t�Sv\�4����vs\�\�Zo_(T2�kM\0\0\�O��B��S\�bugݜ��#:o,#�o\�؈�\�Y\�\�Q�vA��D�Y�9/�E��깥\�p�G|���\'\�R�\�}h\�\�\�ݜ��SJ����N��<a\"\�B+m\0$qZ�]ʋ���I�:iͽ\�\�\'�,J\���\�cѐ\Z\�ΰ�#&�5�\���\�.z�\�T�\�r\��\�\n�\��1U\�[2\��\�\�#�\�C �ǈ���\�\�9����j�.盟����AӦ*�\�\�v�� zW�B\�;8�\�>��\�ɨuky�F�\�\�\�\�WV\\l�V\��cn1�\�kԢ\�mI�\�0��\��[{T{\\A��\���\�|/�\�(\�^E0|6�F0+\�`�\r�b��}jY5�=��N� �V�I�\�\�+6o��ڽ\�]GM\'<U_\�=)�.)��{\��<���\�\�m�����{Wѩ&�ˍ°�)l�C&�V�\�Nn+I�@� ��Y�\�#�5\��PmH5��\�g^�\�y\'� E�9��\0��M�\�\�޽�&�zSsd�f�s\��\0\��Uv�$۲����Q�\�\���kS�<d�p��AB�2\�u潑�v\�\n¡����c\�\�7-\�\\�5�6\�\�\��s^\�\�������\�\��<T�:�UN*\'���\Z�\�b��9\�+\�R}�	\n^�\�<�ơ�\0�GP%��\��q�o�{V/�H�\�mL�})�\���pU�{\�\0��S\�Q\�G\�\�\�\�Z������K��\�hz�����(��\Z\�H�\�=Hʷ\�׎�\�t�։\�kzs_@�����\�X4\�a�Ժ�}gM�:E��}1Ht\��p\�s�E}����0\�\�1�?J^\�>�\�|�\��\��qL:}��1\�П`�\��k\�ٶ\�s�\�J=���\�|\�l/H��\�/\�.�,�W\�\�K��\0�K\�\�J��*˓\�/\�K�\rb|��\r�\�\�\�6����_Dc\�\�& *\�l\�G:���\"ۿ��s�\�R�sM�\Z���`	I&�\��Oc�#�M�e��\�N��Нt\�,GV��*b�\�\�Y6q�BW��<�}*\�;g�4�X\�!Q�>�1P9�`rh�h��i�.1\���\�{\�(�@\�i0MN\�:\�dP,9�0�\�F\� @r3Y��\rr��\�\�\�rj2�m�4�歴)�yy\�j\�R\0�~�\�F�\�dQb� \�\�\�֥�@:\�\�1֒�n��\0DG�j����ƫ3g�v���Q�\�>�9)56\�[�j&\�9\�HNG�4сA,]�\n���ڡ=�\��Se�\0�����\�&Ty~�`.S�r�5�F]�\0\�8�s�sR1�R\��Ԥ��?\n\0��\�dg��h\��\0���r����z�iQ��y<�\nn\�G׵ +rG��Xc֔�^�qP<\�6�S`����ی\�1�m#\0�Ѱ�!\�\�i\�\�Ke$@FM.\�΂8⥲�Dj1�N ��F�cHi\0SH\�&��4�x\�K)!�\�3IRF9\�OZ���78�¥>�\�\�PKC0\�R\�{\��8\�GQ\��\���ƚTcw\\ԙ\�K�ӊ\�B)��.sO3\�cJ�\�\�Z\�%@�4�\�*8=\�0�N?\n	�\�繦�zT�\�\�ҙ�\��E��sN=�{S�qɠ\'A\�@���\Z~8<g��`��@\�N\�FA<�ɤ�\�)ݰ\�\ni����r91L�\�\�GcS\r��9\�J\�؃S8�\r+/�X!X�\0\��S08㠢\�ea�v\�=�I\Z\�p\�\�\�.}M5yc�=�\�%�\nǶ=\�\��c\�S�;Sdg�S�ǵ������\�O`v�#&��:q@]�\�\�Oj.M��k�F[�\\�i덧ޜ\�`\��\rzz\�M�\\c���?>�\�BX0#\0�#�߿�4�\�A�N1@� �� �����j\�p�t\�1�\�\�\�\�\����{w~On��h��d�TRl\�\r\�zS\�\�\�Pc\�\�$��T\�O=���r͸\��I�\�G;���@ݒx5HE#�[\�>\�U�Ӿ��U�T��j��\0\rD\�$ܤ��\�\�k\Z�\�\�+��\�\"�\����\0\�\n�49\0+)�y�X\0�}KZ��\�j�\���^Fk\�\�`};b�\�J>E��tb�z\�q\�z`\�\�rq^N2>�>�)�\�\�v��n\�\�h�8\�:V5����ծ�Xx�5\�4{h�c\'4�\0g?�qH:f�\�\'�*K<�\ZӶ~x޲� 3C�ж���\��\�h5	\�8\�G4Ϙ�\����|ǊNT\08�RD�\�3\���\�1?\�JG\�I���Z�c\�r�\�\�K��\��4\�\�W\�Ƣ\�ri�Z���H�85B���\�0�=}^brx<\n\�\�&�=�\�\�\�j&\�`�G\�ڭޱu.rVw#�O�U�\�em\�\0\�t硯5�\�/=\�\�ˌ�\�#\�ײ\�P(`A\��x�\�\\+Y�{�iP9�{œ�?x��\�錚\�1�\Z\��x�t]�\0�\��,$oV�\��)raj�\�3\�\�v�\�Ү�S\�pj�!�\�ԑV�\�\�\�}L^�\�S܋o�{)\�W8玕aW�f�\�+T\�Zs\�ɩ�\rJ��1�ӝB�G^�h��#�3V\�\�JT\0�#��\�`l\�\�=)���\�\�v\�jD@7\�52\"�_\\�J8\�\�ܻ\r\�Xu==\�\�\�\�S\�6\�Lq�q�\�Ab\�uS��J�\0\�\�If�V\"��\��)v��\�\��q\�=G4�\"\�	\�׽+�e8�6�\��N�zWe�0#\"��\�\�\��\�8\�\�r���JF\\\�\�\�\�@BWޑIc��8\�;��<�\�J\�Xf\0?ʞ\�A=�L\n\�4\�b��\�j`$t\�Jj�9#\�c���5:�\�\nU\\g��?`_CH��*{�����\�84\�\\g��j��b<`擒H�X\��8\�()\�ZW�\n`�h��\�XS�Xw\�l$�ԁGB\rJ�\03�T�c��\�+�\�`�1<s@_��\Z��\�\�F�\���\��:R�N=�Q�\��6p9\�J\�\"E\�H�&�E\�Jq\0�~�7)\"�\�r\�NT\�|r*9�br\�\�S@G\�\�\'�W�mҗo �\��#�\�N\�#\"�\0T�ލ��\� \0w�nq�ޟ���sҋ�ާ�v\�w)\�\�`F\0銛8\�{�\�O�\�J\�!@\�\�\��\�3N\\w\�ƅ\�3K�\��\'R\�\�\�0K�#�@`�F	T�(\�\�PB�R\0E\n:\�Bi\0\�\�*N�\�-�\�C��P��Ӈ ┌\�\�VTR\�R\���\�\0#g�n>��HM4!��}i�i\�sȥ\n3֝�hQQ���sS�y0{Qt]�\�\�Ҧ\�7^����\"\n8\�!Oj�i�JZ��e.*LPGb�1\�=z\�\�>5\�i��\�9��\�S�\�u���=*nRE]���l�8\�>\r��G�.\�3VJ\�J�Q\�+�K��)�C\��\�B@�4�\�\�1L#4�\Z$A\�\�r@8��\�OQާ�|�\�lT_Sx\�x_�5\��=^hb�j~��<Q��i֙\�k�Y\��W>g8��\�\�h�7ߕt>~�&�<�\'�s�O\�k��\Zw�%z�\�p��[.k.��b^MEzxjPrq�H\��\�FrnOD�@4�\�9���o7v<ח\�\�uw \0a[�v\Z_���$�y�/�\�*N\�#\�d����s��\�wy@\"�>3�%;U�\�H>F��k\�2\�ؐc?�J\��9\�.[�%hc`\�\�\�\�u_�\�\�3\�za񴃍�u�zr��L*x5\�&\Z_d\�\�8�=\�H�\0�\�,\�GN3J|kPs^jy��w�����W��\�Y�ϡ�?���n\�\';[�(P�\�+��x�t79\�3Wi.v\�{N�\���b��\�\�Ov��\�\�\\�Ԇ6ɩQ/�+4D�\"#�A�*lc�i�FM��G8�\"���\0	�H���sSs\��((��:SsVsӥ1��1\�K)�2MWu=j�\\���\�J�h�R��5cf@�i\nv���\\�zSpV�\�9��㊛r�-J\�\�4l�\�q��/�(R}\�X�:�M��K�t�\0��a:M��{t��h¼rj<�5.z晌T�4����O��#\\J�\0\�~�co4`Qq�<u\�)v�\�\��\�^�\�9\� +m40\�m��FNO�\"\�idv�9��-\�F24ݧ�5;v��縥r��j\"3VJ�\��l�=h9���\�&�9�iUG5#qF6\�� c�\Z6`\�h\�\0\�咆\'�5^0\��mzv\�\�E\�e\'uF\�\r\\uZ��x�4\�4Uq�3ғ\0\�֧a�J�\�\0qL�W�<b�\�\�W��\0g����9��O�z�g>�\�\�\�@��s���c�ΚE D`dҨ$�T�c�ʓ�qޤcH�\�I��Ӈ9\�=\�Î�)\\�{\�rz\�\�<v�\��T�Bpw=�\�M`O�X �\�4\�u������>\�\�q\�Ӛ�!\�\�h�\�8ϥK21M#�jb�*2?�Z��1F\�R\� ю\n͚m\�\�֎F*l�֓�\�Rʱ]��H8ǮjVP{Ы�zT\�vA\��`56ܑ�JF{T��v��Њ\n����\� \�y\�\r\�}�)\�\�~�rF9�$V�\���*Lz���<�.+��@\���\�K\��\�9jd�^\�m��◞\�P1\�ڀ\�~�\�\0�4�d�ڀ! �\�rj~	\�i6\�4\n\�r��z��AMl��\�\"\��\�ZqS�\r\�x<\r�d\�\�0)�=�6�U\�a��==i\n�s�q\��}i\�u �ʹ|�#�)�\�X<\�Wz09\�\� h�2X��HNO�sҧ ?\0�*�\�c\�5I�b-�]I\�q�k]c�h��z\�a\��H�v��\�\�O\�L���\�\��oPq\�QI zӻ�\"�G���\�s&6�\�?\�A\r\rc�\0@\�P(�^�\�ն�A늛�\�ZY��\�$\��S��㰫r c\��\0#N�##h#�{\�L��\'$��#\�\�\�~�>C��8�\� �&4RmΤ}\��\0:H\�@\�J�@\'��c��~lu�\�N;�ӡ��T\�g8=��7\0��Z��\\\�z��vYF23�1Q�v\�\��j�b�`�;�\�P�\�\���\�T�2��~�G<\�TM\�p\�\�S�\�\�\�\�Q\��\�8C-\�{H�y\�޽A��c�^g�WR2ry\�s^���\�F݊)�3�g\�\�\�^��o\0�\�Uq�ƶ=\rl\'b+\�{�D�s�`t\�i\�w\�ӕ�;h\�\\��\���\�85�n>`+86&^��\�\�\�ϯҚ4��\��g\0g�ɦ�{\�\�y\�I�$��C~=,1ړ�\0AA����S\�\Z\��1�\�jv\��¥��p\n�\�\np0q\�\�\�\\\�\�G�@D\�\�\\��\��[Î�{v\�v-�?�y\�\�+��\�\�;Fr�u�j�A�\�W�<_¨L���0\�-{>�%�T��\��z\�\�oA�\�#5\�:89bq�\�\�vTMD\�\n�w�/��1H\�\�$\�N;��\�g�^C��\�B\�#\�!\����k/W���y\��p��<�%\�\�Hl(\n22>�R�q\�\�``	\�\�}\">\�ƀ� \�\�1\�E!\0c�\"�\00��Y���q۵YٹT��\�\�Q7\�@{U�\�\�\�B�\Z\� a��ެ,l9<\ZH���=�\�\"�#\�0*@6�@\�R/\'{�L�! {�\�\�8\�ڞ8\�9\�R�\�B:4�Ni\�ri��\�N\�X��֌ס�>�n1GJ��&OR㞴\��5 _o�$7\�\�>�i�2\0���\�\�\��>Rx�4\�\�Zs(�\�I��7=)\��)�:\�\�8�1��4T\�wR�\r\Z��zf�\n�k2*AΣ�h\Zi���	��jQ\�J*�\�DEO`iUI9��(d�S�\�`MCe�*\�\�:\�\�N=�\\Ԁ\��}\�県�C��t\��\��\��\�\�P���!�v�u\�i\�A\��``--;���~��#�\�x�i����v�1Rm\�N��\��?J��M��\�\�E<F=i\��\0��\�EV���(^2\rI�Nh\�\�Ԍ`Pi@\�S�R\�zU�\�R�i\�s�8�CW�P3�wA\�O\ZW���iا��2h\�=:\n�\Z�G)\��\�.)\'�4��y�\�ځ���\�\\`\0$�KN\�)�ރ�P>�\�1Ҁ���\n�>�)\�\'lөv椱�ާ�0zR�u�1�@\�\�{\��O;H��\�\rIC6RR�\�!�1X`�\� �I@��������\�RPP�`\���b��+\���px��犌\�\Zh�Ds�i�@�ʎi�G\�U�Za<\�*)���Di\��n)�\�1��1X���æjZ\�#���sҫ�sR\��5%\r �\�I�N\'4����\�`Ԁ�{\0\05D�\�h�S\�4����\"\�H}{\�7��Ju�9\"�\�䉎2qY��u�3���֮�\�\�޳\"��c�����\�<���}��%e\�\�z\�}�Z��E#)^�󑛩�\�!��{\�\r��R\�A\�\�\�|[!�X�\�����,���\Z�\�\�Ru}�v�w�l�g���UXɫ\�m��$t~\ZіYT�\�J\�b�!�\�\\��,�%@�WD�\�\�A�\�\�*\�-S[\"��R1�V%���r��\�E#(#�j�%�>s�\r٤|\�\�IF\�\�!��\��bA�4�o\��N\�\�\�\�Z��K���_<Kj���\�1\�=k\�˱աUE\�\�fk�\�\�\�:��R�b	�6�4m\�.EU�8\�\��\�\�b��\\r\�ĝ\�q_]J~Ғ�s\�d��G\�>�41\�f|WjS\�c\�\\�� ۢ@T\�\�\�Jv�8\�|�-\�Q�\0y�GC��\0\n3\��>�с\�D\�;ԡ�k$C�\�T}\�M�ʍ��Ȉ�L\�\�\�K�ޚV�A��\�4\n�8	����K�<\�[v4�M\�R(f4�G�<�4ݤ���6-2>�SH�[<SJ�#��\")��!��\�\�\n~ږRer�Rl�\0d�LT�r���6\�ؠ���\�\�C�M ���\�Rb�\�J␯~\�1\�\�\�+\�1R�L\�x�4���n)�\�7\�)\�)\0r)\\,�[���$�iǚ1Cab,u\��CO8\�7�H�5�t\�j,�8\�*s\�\�X��\�C��\0\�Z�����\�\0�F�����p)�v\�`y�5�E\�!\0R���m\�&\�\ZCE�\�l\�S�U��g֫��O2��B���\���yl8��͞GqQy�ӵ�	�\�����Liϥ2Id�\�{T\r��\�I5�${\�&W9,q׵;�i\�Ԅ3M�n��!\�{�q�<��i<c�$�iqߵ9x\�qI�F�i@\���^�4\06\�0�\�/�\�0*Jp1\�M\�\�4\��ъ\0n\��\�q�\\�w��4�\�9\�N�\�\�M�\�\r\�\�K\Z{�u\�569��b���(���R��sN\��q�\�\"�e�� �v�\�%�O\\T�Aɤn	\�\�\�C,a\r��T{3\�R�\n�H;���e�s�Mɧ�����\�&�\�ۧ�&\��\�O \�RS\�Rc�\0<\Z0*Za�\�@�s�Oj^{\�I\�?JB����\�\�\�03\�S��riO8�c�=�{\�pJ8\�I\�8��o\��oL\nC�O~i\�\�\�֗}����\�#dc���O)Ł�!΂03Rc8t��\��\\V#\�\�c�#��8\�\�!\�=�\�9F���;Sp\�\�?=�Jc\0\�\�h��␌\���T�\�3�\�A \�PKDC\�ϵ7�\��Sq�OCI��c�4I�{�\�8<qR�lr3�Ы��\�EQ,�\�;��j��\0��4\��Q\�\�[\�a�\�AD\'��;\���>��\�N��\�A\���\"\'`q\�!�\�g��\�⟳,1\�\�qB&\�\��:S��\�a�1O �ϓAM������b\�i�9\��&����\��	\�L��@�\�\'�5��\�\�����#��\�i\n�A�\���$f0p\0\�\�j��$jN9�9\�e�bA�\�ީ-���~8&�\������fQ\�\�\�J���\�\�3QF7�F\�cC[pW�\�\�\���-\�~U�H=y�5\�\�.�\�\�q�7W-{�3\�\�ej�w��8\�\�خq�V,HA\�kj&\�\��W�-Ϩ[w`\�׭4y}\�H\�fZ���=*\�\�\�t�2�Wp\�1V\�l�)�5\�z{�M)@3\�MG	lc�ԣ�\�ڨ�\�TS�s\�<w�\�4\'\�5��� Pz\�\�-*�לS�i0N:S0\��N\�)�A��^q\�A\�W�x\�\�[\�[�>�k\�$וx\�E��\�2O˖>�\n\�\�;A�Xuy�.\�B�z�#�+�\�2S9\�w\�G�[.\�u��F��@�9\�GYU�F̋��\n�\Z\���s\0\�\r�\�\�g#\�־���\�ӏ�\�\�5�y\\oU�\�>?�\'j]\�cZ���$\�w���yd\�\�^�GƱ\�g�\�\�5)B\\TaH\�}*\�`2�dU$\0FNs���*1�:g<Avdv4\0�=�8������jr�I5cC�w�\0�h<\�\�Jq�\�\�f�q�\�N\� ��ǭe��\0x9��#�\�8�PA\�#�s\�\�\�94\�3ɩ,Lr)�\�֔\'�����\�iQ\�&�O�.x\�v�P\�\�4{\n~KaJI# P��\�ҕX�@\�E(\0�\ZU\�w�\�\�;S�H���{S�{\Za\�x����\��\�\��m\�4�(\�\0\�8��\��0qMs\�(#<\�6Z��<r;S� 89\�4�-\�1Ҥ�@ڔ-*rjw;I��\�)p\�E5[\'��\���&�b�\�\�RP\��\�6(\�\0�{@sK\�M��t\�&P\�S�-��j\�<p�\\g�E.FzsHO9����:SW�JPH\�I`@\�\�I�M?Q\�\�\0�r)A��S�ɤ �4\�8\�;u�{Pq@\�\�z\�X\�\�qO\�F1K�y�\�xv�Ѹ{\����g�3TڌS�\�()!�\�Ӏ�{\�cD@\�jN(\�sN\\⤡�\ng-\n\0a� ��ǭ4\�\0}\�;��⟎\�f9��~��sM#\���O\�1I\� \��\�*R\�.1PrzR�@\�9�\�7\�A9\�\�0�z��lni:\�x�\�\�\�RD67�n8d\n\\f�r>i�S��ӈ\�)�g��KI�D�A\�M���P�\0\�sH@=iF(�	җ$�1�I\�V\���oj\\ю8#B\�?��⣼`\"v>�ڮ[�\�RԆ ��@�U�~5\�n�������\�dj�L��C\�A��G3\�N	\�i\�B�($\�\�\�J_#\�ܪ|\�KT��N��V��\�G� 7�sW�\�I�1��ao\�\\�#��W\�ٔ���\�#��N�I�\�\��\�\�\�@���H\�kش�B+\�\�ϯ5�\�XhbP_\�]_���\��X,�\�\�b3��\�M#<e\���=��a\�:�V8\��f��$B\�\�3��\�kS��Tk�\�O�wG�<�զ�\r\�s\�^%�m���\�*8K��\�\�6\�c-�H2��_\�\�\�\�\�`e\�U\�\�޶�$�E��Qo5-�Y�|�L�{*\�[�\\\�T�].�\�i�o�\�b\\�\0S\�}\�\n\�W��V5���\�S\�?\nE�E���+f\��\�U?\r�]\Z\�c�Y-hܦ\�\�\�;ן���tըC�(� b�A�\�H\"\�\�����b\�\0b�{����!�3#\�\�HFE&8���h���李i1\�I�%0\�5.\�iZ��i�&�zq@\��=�:\�N#4\�\�\�AHf\�i:\n~r8\�\n\03\�5#�Jy\�;�����R#��Q\�����r3\�!\�;S\�\�\0�u4���;e \�9\�*Jn\r&��\�k8�p)��\"� #�RԘ\�c�2�4\���4��\�A^z\�*��0�\�&4Fz\0y� c�P3\�.*KL���\�5#TM�d\�2\\�\�\�q�R��1�b\09\�\�Zkg�J�)\"� \\T\�dL�\�4�O\�\�H\�\���\�\0�h\�\�M\�V_ibEB\�\�\"$\Z)\�S��<\�@7*Blu�xj<�LLi@���\�ӾHI\�4��1M#67$\�M��\��!#�\�(\��i�sR�a�\��ޔ�J�T2�c�zQ�ޟ��\�\�@ƕ�5lT\�\�S�\�B\" zgڏO�\"�)�aI��qF84i\n�Hcwe����m\0y\�P\�Cy� S�\���\�N*i\�\���\�Ux�S��?7�o\��\�f\�D]�\�I\�A략6)\npG$���\r�sM=*R�\�x\�9�\�L�H��p;Q�\�\�\����敐\�\�`3i�\�8o��S�y\� \�;sH8P=\r&9\�i�q\�\�x�&�2.��R*a�s�iB0($nN9\��s\�ڔ{R�@\r\�s\�A�\�K�\0�h\�\�l鞴7#��jC�\�\�qMٜ�֐\r\�`t\���\�<�G\'�\n��P;\r\��=�3\�|�Ԁ\�?JN�=E�\�q�sQ�Fp*SȤu\n\�;n\�)�\06F�\�3KϧJa�v�s\�G������Yi\n\�ˊh��Hc��ڽ\�r��S\n�9�D40d7��4�C\0��:ӈ\�\�zSp�G�\�T@��H�s\�>S�3R�\�=�\"s�*I\"�|\��\�~��+\�Nh@\�y\�?�g�!X�&0\0\�\�4�s\�v��\'��\0\�Қ\�})�\�98\�}Zy<�pp\�3h9=�9r����)����}zt\�$u8\�֧��b<Tc��\���r��\�Ug?\�i2d\�q�\��\������\r\rU\'s��\�$b0\n��.x��\'�\�)�N�\�<c8\�V�$nT�e^��V���W�����@�A��\�\�XsC`V���H#��Oj\�|= {��zv�l�c\0��\�J\���\�\nG<\\��zl��\�Z�N�=�c�؃��\�VD<���lI\�^4�>�\Z	��&�8�\'�b��\��²4Ev\0F�\0jx9\��\\>�,$`P�iD�\�A�y�\'k��\��V\'�\�Ւ\�oX\�p}\�U0;&�r�})\�6z�\�NiX�b���	�\�B8�5/~Gjk\r\��b��b>^�ג��Kkv\�!#$��I\�^�\�q\�kȵB\��\�.A�Pp}\�k���`U\��\�KM��\��\n!9���\0NR Rp+\nSlAji\0ROA\�_9_H&��O\�\�\�}M}�\�\�Y\�I�l�BO\�_;S#?bO&��)�\���\�)\�J>�%����\�ޣPp\n�2OQ�G=\�{�>X�&G�:R�\���@��HS֓8�\nO-\�;�6�=�2j�\�Q\"\r\�\�\��\0\nHcPq\�4�\'<��\�޵!\'<�)\�v���;\0g�@9\�\�X�98\�Ȧ\�\0q����1\��R\�\�Ҹ\�4i\���\�HӑUU\�\�i��}�I��/\0}�W#��\�\�*P��H\� \�\0{T��r)B\�t�i\�qI��\�)1I�=�\�\�\��NjE1d|��nH\�OU\�=)�\�\�2($6����8\�.\�\���i\r\�@\����\����9@l\�>���=qSq��3\�#�($��\�HF���d�i\\��R\�\r ��\�=zԠb��5M8��\�K�\�K��c�E$x���\�S�@\�\�P;\r���\\�\�֤\�i9�V�?Z��A<\np5#Hi8<S�\�\��\�R\�s@\�\�pj�A\�N\�K�I��\�1\�\0�\��\�ڢ�3��)\��S)G���\n�F@\�*��\�N�\0�Z\�x��{S�ӗ�q\�?�\n3N�\�4�d7�T�`R�x��\�+�\�qҗ�1ޞi\�y�b<u�i�y�@����C�!�\�sҔ.1\�JhњLT�s�1L�\�(\�zP�R\�\�\�(���\�J<S�ޗ�CCq\�(�)H�z��a����j�\�\�K�$F1ךd2	6�*l��9��<��r(:\�8��\�\�\��JR	�+\nd�)sGz\rP\nM0ө1M\���SsR\�\0\�o�!��\�)�\��(=E;�)qN\�a�&����N\���g��(��((a\�N\0b�n3@\0\�Zi�=\�4pqA\"\0qJ2q�@��*&ժo�YZ\�U��8�C�տb\�\Z\�D\�tۣ\���\�t\�\�Ew�:*釛�\�>g�F\���\�?3�\�GF޹�㨮�@!/�dW\�bS��K+>3\�\�R�\�h\��v�k:\0�4y�A�zo�\��<�x\�|il\���?���q٫��e�J�b�6ķ\�\���\�+*���\�\�\��_\�\�\�M�\��\�z��Gl$\��\�\�z�\��\�5\���{��\��c�~<\�7l�rm�4)sn\���\�纇�\�\�nr\�H\�\�+��\�&�Fq�z\��\�\r˜�5w<h\�Ŵ�2\���\�\0\�3u\�\�Z��\�&@@aǭzȊ��r\�K�H\�\'5t߾��\�߱\�~,�-�-�w�^m����o:X�\�;��j���pr~����po\��o6if5R�+�ٌc�)�qW�\�ˏSU4�V\��j\�\�\�\�\�\�Mެ�����Z�Wh�!�M3,�/֢ݞ��\�a\�i��9�i��5fdG���y4�\�I�*JLz�X\�h4\����D8�*m��ZB1@\��NE7����T��qA)Za\n@G���6�\��\�Rl�<f�\��3I��C\Zz�n6����\�PQ\�\�4���\�3L\�4���\n\�\�SOZ\0e7�z\�MAddf����\�i44\�\�4��3(���IDt\�)\�i\0\�ÞjN���H\�L�O4�\�ޥ��r*\"L\�޽)�)G���\��7֘G#Ҁ#\�4\�\�~U.	\�0�ڠ�9�\��<T���+�C	#�G�i\�f��aȠC\n\�`\�Fi\rR�C\��\�Z0y�B\"<ю�\�O#�)�@\�\0�\�4��)\\�ƀ)ʼӱH���\�T��4��R\�L\�z\�ȣ�jl\r�2O@)\n��ӈ���R�D�\\\�Jy�/R�(O�Ը5\�\�&R\�:Pp=�\�q\�M�FjƓ�ȣ�\��)\�\�\�<\�\�};\�H\�\"�\�=��N})�Mpy���H���AKӜ�b��9�\�8�8PZ\"\�I#�\�\�@\"�\�֘G@jnQ_\�8\�z��s֣a�\�\0��\�L\�4�2{\�S	l\�e��h8\�>¤\�恵�\�Ґ�\�ތ�\�\r8���JAמ�S��-G=3ҞpI?���u\�z��4���.\�9⁎h��\�v��@\�#۟�5T\�\��4��((onq\�3 d��!Nz�\�PB\\R�\�\�c5y�s���\�����i�t8�\�s\�Q��3�9�&Fh\�\r&�*@�)�\Z�y\"��c9\�*\�����y��#\r\�\�0E�\�\�r\�؞\�U#6E�\0�\�\�sIFޙ\�q�)�CCv6\�J\\sӞ�\�\�c=\Za;z}hђ.{��84\�\�\����q�\�8��w\n@1��\���\�	=\�����\�9<P\r�\�\'�)J���\�֞\�Iʜ�\�H\�B\�J\�Y�\�s����\�\�s\�\���Y\�\�7rA\�+��1�jh�Bv\n�Mɀ\0\�\Z��zd�Q��z�\�lu��\"&NG5F\�.7t=�^d=s�Pɜ>y\�#\�-���?�\�C3;��2��Dĝ٩.��\'\�Ҩ��܀\�\�\�[Z�ndB\�2\�Y\r�$s׮x\�j\�\�ǨF\0\�Y\n��\�¾��قv�S��ll�ϭk\�9Q�1ڱ\�\0�\�sֵ�\�dqϷj�\��T�4�$\�\��c<P�P��\�Ƴf\�\\��\�RC��\�Gj|\'#����2��\0`�j\�S���ݐ\�l��\�ӹ,�a@\�F#څ\\��\�N8��<&7i\�0�MM�\�1���8������\�2\rDA���)\�q��\�\�[�f�u\'n\Z���RC\�V�\�\�6���<��W)\��*ݒIk�X8�\�\�@ɢ��K��}+��v�_aSAva��B�=\�l\�\�\�y�X��\�\�^\�\�Y\�z3�^A�u5\�i�?/z�ܮ6�\�y�\��&+��c�z��  P@9\�8�T7\0�M%��G׭z\�ϓ�HN21�c���p S\�|�/�\�<\n�?�`�<\��7c\�QN�\�\n@\�b�\0|\ZV-\�{S� �{f�GҞ\�e$7���28�\0����Ԕ���\���߽<gO \�\"��c\�i\�\�=(\rR�\rւЛ@�4�=3�ԝ/8\��1�\�*/8� =9�(�������\��O#o\�Js\�H2-���9\�I����\�G����!$*�#�9<�\�9�ϡ:b�zgZ�\�\Z�\�~8��?��g\"�\�_N*F8\'�8�(=��\�0FqR��M!�\\qN\��E\�{ӆ8�\�$D�*3R�x\0~�8��e\0�ʏ`9��\�&�\�\"�\Z)\�r/\�I\�h�E8\08��?�\�@\�\�4��jL\ZB1@\r\���=i�\�c�֜9\�E.jA��i��Hӱ\�ږ\����\�\�\�OU=�\0\nb�\0\nP���Py\�Phc��\ni{���\�J�\�^�R\�ޙ��\�Re��<\Zv\�x��\����`�1E\0�J�4\�d\Z�+\n\���;ԝ(Pm��/cJi\�@\�l\�ғmJy\�Z\0a\0f��d\n�\�RX\��K�T\�3҆�@󞔇�\�9�0\�\"#4c4��\�w\�\07�\�5!\�M����9��\�\�֩\�\�H�	N�\�\�\�@)�f�\�\��D�c�Iҗc֕\�\�E;�)h\�4\�0iݩ\�$R\�zR�p�`ހ\���=i��I�Rm��U\� ��Dc\�\�ix\�)�@aI�Eemv\�q\�)r�E\�=|�WhWm�\�\�Y\nhwC\�1F\Z<ؚk�\�x\�˅��A�?\�iZ\�C�S��s�\�\�5,o���iE5c\�c>Y��?���,O��\�O|\�\r6;�H�\�zTVR�!X�WSg\ZJ�\�lW\�gyz�HT�%�?_\�� \�_��\�-(_�R�ڜ\�\�D�Bcֹ��������~��≯�%��\�S\�+��MBpq`={׈�\�\Z6}MLl\�\�\�:\�c�jӃ�A�6k\�-\�\�\�H<\�\�=k\�]3O\�\�s\�\�̸<���I�\�Z}֝;�{vq�G@{Ҕcќ\�\��\�\��Qs0]�ڳ.�`\�L}o\�\�!�p\�xȯ6�E\�\�`��s]�^bqq��V��x�2x,�s��\�h\�՜淨\�};;t\�\�+<��\�O�\�1$\�[\�\�Şs\"��\�\�\��K�*\�#�RUksIݷ�>������d�ʥ�J���h�G�@)/T\r�¾\��I/ݘn2j%S��Hj\"�~�\�\�+\�j2	*�ÊnƝ\�\�+\�T̴\��\�E\�0�B:T�qI�qH��\�G=i�\��\�AD@t&���n)�r�	Zi\�EY\�Q��EX��LS�)*[\�\�)\r!�\�))\�-�Sph\ZC1�I�\�\"�*);Pe �����)��q����\Z1R�\�0�*F0�a.\�M\�\'4�(��ri�\���\"��3L�\�\�\"�\�C\r��{ԅM7!�Sq\�R\�ȩ*\�EEF�\n�q\�Q�\�+�b�\�3iOZ��q�o\\\�_��1\�EY#�j<\n�ƑX�c�\�\'��zf�`y4�%>���brqڦ\0�E/gڝ\�U#��\�3\�r��\�\"�\�b������\��\�!\�A�;\��O�� �b�\�1F\r<�Fzҁ�����S��i8&��p)�қ$�3\�\�Nw4\0s\�R`\n��h\�{Tف\�I��T��Ϩ��y\�4b�ҥ c=I�s�I�#=)���HE3�\�8\0iv\��k6Z#�3\�N��\��{T=M\�iG��1\�v�\�#�k&RU{\�@!z\�R\0i�d\�Ve��隍Ԓ:T��4\�20jJ#9\�\�*=�?^qR�\�i\�\�h2s\�u�\�o�EJ��#�Mo�X�\�jM��\�@\�Lߌ~�\�)\�ߌ\��3�qRx`ӵ(�����\�ޝ���\0�\0\�	�8\�=�*\\ch����\�aL\�<f�g�\�8\0H��⸣1\�i\�Q������\�h�\�й<p�#?\�VL\�\�7j����eB��\���Q\�H����HC۸\'#\�\0���\��\�q\�\�@&ph�\�&���H�\'�4�3����<�\�S�(%�1\�O\\PT`\�4q�\�P\�#��ƐA�⑆x��\��\0}\r4�\�>�j��ȉ\�\�=8� r=�\�9=��� ��B�\�O&�(�4q�g�oC\�@XB�9\'&�/^�\�8\�)q�1�,E�\�Ҙ\�\�\��q����Q�$�\�H�H?�zh#�\�瓚��x\�\�\�D��s�h���\��AHBr\�\�5*��\�3p\\�\�F>��!�\�\�G\�L\�G\�\�4�\'˜wǦMF���L�Q�=\�vz����ϷP9���\�2qU\�{`�qTGQ�a�\0 �Ri`�}	\�\�㞵J�7t\��,LNq\��\�cS\�f�w\�R/�Gx�,��Zv\�1�YlI`\��h�N\���\�xu7>ҋ�Q�\Z�;�Rg#����0\�q��ŝ\\\n|C/����RO�$y�}\�\�2�p\�\'�v�\0@��\re�\�@r:V�g �ƂY\�\�\r$\�ӱ\�\�i:\�}S<1��N RJ��#�Q��J��\�j�\�2Ê�R\�\�\�U�\�\�@z!��9\�݄Ay\�9\"��HSK�$�@�덲\'\���Fy��y�C\�¯tԲȺ\�J\�Ђ��\�3i���\rv{v��\n\��1\�u�S�;d\��\��-Ea�\�\�\�^��\�\��Ш;vn?S\\	R��sھ\�/��\����\�|\�ڞV_�0_\\R�q�)\�[nXO\�\�\"�\��\�<�<!�8\�L�\�݈^<\�T���*\����\�D�ʏ��XE.8\0TJ܏z�>L	�D�\�A\�\�:Ԁc<\ZT\�Q��sR٢C�\0G��R6�\�\�4\�r\r.Ӹz�E�\0�(\�B�\�\��R�c\���1\� Vɩ$\��q�P+�� c4\�3w\�K��zd�F\�/��\�+��ހriG\rר��a\�S�x8\�h�ǡ\�pzw���\�\�\�T�9��>��Hc�f�������0䐦�cHR�/\0\ni\�\�O�Hx�B�=�X\�`�zb���b�*pA\�4*�<pzԎ\�j��\�\�*�����\����C(DR@\��\�J�Ӏ^sӷ\�R��٩(`��\nv9�.~�\0\�ا����(\�(\0?Җ�G�4�TS\�3O\nS���J㰀�\�3nᑚ�\��􁐪s\�<R\�ix�C�\'\�P1�c��K�\�\�</=h\���\�3�;u�\ZR)H\�vr)\��`�\�\�b�H0{S�R�c�)l�PP�t�pi�#�Hh(i\��\�3\0��6�9��$�V1�R���\"��>�\"E���ҁ�6�L.8\�i\�OJx\\\nr5QO�.(�q�f�aG8�N47��y�08\0Sv�A,h���\�o4�\�4\r\r TdS\��H\�@\�\�`Ԅg?Jo9�J1�R8Z1\�(�PW4\�5d�r(�vqҚTPg�M#mJTn�\�\�?����Q\�Z\n\nR�րS6��\�K��S�\�q�]��c�Ƭ�Jz烊�\ni�ӥ\0B3���\�<\�ƃ�sTIU���=�B|�ڞz}(\Z�[�b�Jn>aSB�%Q\�	�f�:)T��+\��!4)=7(\�3�\Z�\�\�?\�n�\��\��5xq�Ƈ�遭�x(ɧ���*TF\'�q_os\�\Ze���+��\�R	p\�A�z\�K���\�\�9\�Z>%Ӯ�\�J�����lי�J��(ɫ\�D{Y2\�CNpMG�)>�dZt�j:u\�?�\����5gN�+�%v>[�\�\'�|9q �%m��ν�\�\�+{�r3_*^��\�\�#\nQ�)k\�\��\0\�F�p0H=\��ζH\�W�\�\�\\\���4z�QE\�\�ۅb[x�K��A;	�5�J6Ԭ.:u�\�I�������\�,��\��c�\�S^ӡ\�\�\�\�\�\�q�\�<{����O\n$\�,�\�dգC�����\��Mb�v���\�<\�[Ӑ=��\�\0̜\�y#h؂9��\0�����k\�j5\��~iF-և���\r�����R?:�\�V��N8��a��ھ|g\��V�sR��)=\Z�\�\'&�b�[DH�\0PGZ�9��D}\�>�&)��c�qO4���2=GZ0;�y\�E!�\�4�qR�Sx\�NjH��4�;S\�7E\�7\"�\"�����SX`S�Hؠ\�BH\�\�<�i0h(i�� �.3җ�z	#�:RO\�4\�恦4�S[ڤ\��@ĦpqO\�1@\r�&��Ԡg4�皂�\��z�`\�\�\nL����R\�Szf�dDsF:f��\ZL\�$ey⍦�AL�\rC4H�\�dT\�(簩�V+\�9�\�Y�J\�h��\nL{T�qI�B \�i�A\�z���@�\��\�4.G.	$S:���\�={T�\�\�HP+\�t�\�88\��6s\�\�%���i�MZe\�\�-Qm\0�V�c�\�})�ԧ�\rP\r��Ѓ9�`Q��\0��ݜS�M;�N��\�y�\n�\�v)\�O�m\�\�\00婣����HTP\�i�b� {\�H�\�\�E�\��)�\�LH�)�R��<\��9��\'\�\�\�P٢�\�)���\�\�ӿ�\�Q\��-:`\�py�\�8ɥ\��͔�ʃ\�&9\�*LR�Y����M!\�֞ZCǷ�ID-��A�\�9\�q\�HFA\�)�9�\�\�Ke�0bq\�\�4��	��\�\��\0q\�T�I!�O���b�?W/u�\�.\�\�a���R�\'�2j#�:s��*��dsR\�u�\�br\r\r\�8w�\��)\�d\�D#�\0\�\�j@:��(\�p	�\0A�i\\V�`1\�(^O9\�\�)\�g�Zplcy�q�-�\�4\�1ެ1Pzz\�1�֋�Wb����9�s��\�1�\�w�s�\�\'�\�;�\��aK\�9��U\�T�_Jb\�:\�p�0iA$�B\0\�*�N�\��dc=�\�  �\�\�!\�[c�)rOO֚�\�7�\�&�n�ZF=�?1㯽yc�\�PH\�I4\�̸8�\�\0�{R�ocN\�h�)zPP�b�����O\�21E\�\�G�&�aT\�}E;ac�M��I\�H,4��\0$��ޤ��1\n�\�\n�\�Lu\�pH! �23M\�\�\nh�@��9\�^i�x \�O�LA�p;�Q�\�\\��GN\r2ùF��i\�󚝔0\�\�\�3*0=\�\�A\rf \0Tg\�\�W;��?w��\�%^�?\Z�[\� zu#8���P8898\�Zz\�i��w=�c�\�\0�qڣ�\�\�Eg7��/�\�,\��&�\�P7w��}�e��V��\��J��\��\��\�\�iD\�I�����1U\�\�*Ҝs�W9\�9\�SI}\�1\�*B?*a�#�^()�Gf�T�on��k0�\05��!OJv!�\��\0\�`�ޜ\�Zi^�\�\�Y\�0\nsG8Px�0���ɌT��@�qP\�\"q~.�%��9w�r֤�x��Y1+\��+B�\n\�\�5\�Ww�\�R��4kh˙NGB1]�;Q��r�\Zt\�OZ\�\�$\�\Z\�íǉ{�3\�i|\�XF9\n�:W0rz\�\�\��K�u�\�z�\�k, #`\��_e�V�Mu�\�\�>*���#\�+\�{\�V=��:���n���@?��\�L\�h�X��U�\r��枫�åL���\�N\�1UNO�O�\�\�O���R3�SJ\�\��5 \�qO\0f�\�=\�~��!U\�n;�\0�;9zS�.\�\\\�T\�ܓJ\�ó$tsN6\��@�f�+�=�Sp�\�uԮ;\r���0���y\�\\S�\�h��a�\ZL�H9\�\�Tzc�4!\�1\�(\Z#\���+�z�\��\n\�N\�A�0߅H�n��3��\0\�\'��,���jE\��x0\�)죁\�ڦ\�Xj�I��)\�\�U�Z�TsJ\�X���\r�T�Ny\�f���P!�Rl\0\0})H�)0�(\�jA\����\rJG\0�u�P�=\r�w\�gڀ�\�R�O\�\�\�\'�(�ND\�=z\ZpR�\�c&�\r?�h\�9�l�02zS�\��@�e9!a�\�C�Rb�;�\�{GoJ~0(� �E�!�S��\�N��>�6ZC���&G�)]\�p3Nȥ J�&��\0\�jB9�\0\n\0Ld\ZU\�zz��cK��b\�.=i\�q\�NێzP\r�\�\�\Z6�T�4����\��;\�=�G�\03ҏ\�ӱǽ-\04\�c\�Ԙ\�d�����=)p\r%�\�P1�\�:\�S�Zn1@Xi�Ssҧ=j2D>n�­�j�\0��*9,d \�<\n:f��@\nF�\�\�4��CTu\�#ӱI\�b�#:)\n�=s\�jA\�=\�zV�\�\�O\�4c��C\�2�YF}juS\�9\�j\r\0Dy\�jpP9��\���恑\��w8�c�h?7&��R\�R�4\�?�Q#J�\�i�jsF\�n\�Bd8\�\�\05(��FhrOl�\�S���8\�\\�Mӧ�6��ѷt�T�z�i\�\�\�GjI�+\�\�\�\��x�\��\Z΍H\�J\�,\�\�\�U�J�\�H�\�?��9S�Ȯ�\���0�ܻ�w�R\"\0*0�s�f��昪�m�\�4��%+{�O�)\�\�VV�\�zzt��i�Ζо7#Lz���j��\� R�\�W��{R׵�\�\�\�7\�=�+�T��\�w;\�N1��I#��K\n|�\01�\�.\�\�;M��,��C<\Z+(\�1\���\�\�3^���&ڲ>:�#�m�Km�\��w�fB\�\�l�\��\�6\Ziy6gb܎��%�ВO\�2�o\�N;\n�&�+S���ۃ\�7\�qQ\0^A,\n\�f����Ɲ�\�{ǖ����^\�\�*?$�09�;\�<3a\�+�#��I\'�}&S�j�\�\�\�	Pqӌ׭C6\�S�鶦�Ҿ\��&�eV+��&\�\"�\n\�5�̂�V��Q�9\�\�y��\�3�e9\��\�d�L8<κ5�\�g)�*]��\�3Ua�\�1�Ԥu♊\Z\�\r%;��L\���i\�юjYH��x�<�~0i3�T2\�\�8��RF\r\ZC#=���\n�\�F@4f1I��\�`\�\"����\�M\"�#��❁�\\PX��Jy\�h�h��\��b04ݠT�20	\�ԝs\�S{R�\�1\�I��y�c!<f�ELE3�M\"��	�\�\�Js\�7o\Z���m\�z��ԍ�\��^*Y�D\�K���\0z��\�\�8��7�\ZW4¤U�q���\�57*\�P8\�8�!}4\���U`	���!4c9�A_i*b1ޣ�\�\0DEG�*}�\��� qGLT��7�<S\ng56i8�\�	��[�� ex�\�LA\\\�9$qV�d$�ʙ��\�Fs���BE.:Ԙ\�\�r8�q!�\0��M<� \�4\0�.2\"�.h\0\���1�\�3%Os\�	�	9\��H�qP�x\�^:S\�$w�5�1Nٞ��1���L�\�\�\�0�:Ը^ri�\�\��,c\0��ʜz�3֔b�f�!4ݣ�aҥ*9\�\"������׊\\\Zw\���0�I\�JN�R�(\�_�C(n;\�m�51^�5^c�Q\�\�Ҳe�\�\�N߽Wl\�\�#\�5�\n\�$�@�&�b�l\0p:R�cm\"нP22MDus�\�\�O\�]<�MZK�:N�H\�^�\�T�˰)\'ԆMMr\�\�fMrdm\�p1��&�\���\��=*&�\�d\�\�\�eT\�dW��*Ў�e\�O�,pFV�\�g�7\0䃞�\��E\�9vqN�\�U\�\�g�{SE����\�#\'��\\Ve幇|zf�\'���+?\�BɌ�qӣ#�O#�+�)��\���\�\�������\0y��{�i\�\�\�,��qٗĀ�=E#L2y�-d\�Nٰs�cZ\\>?yEƓ,\�r�Nk����YH���\�=1�\�~\�s\�B\�L\�\�NH4�4�F��q���Q�\��\�9	$�\�9����,[�\�\�\�*Cuo���3\�dN+���#4x��n\�o8\�S���fSӑ޵��.`\�\�\�>��YR\�\�G�\�#=8��P�ʩ���t�L�u3��4\�;c��ǂ#�Pp;���ƀǵ�\�Ӻ0�\�v#��\�\����S�R;�\\d\��#@�ҜGʽ������\�\0\'�R݁���*�Q\�֝�`�M\�\�\�֦\�a��\'\�ڛ�[�\�5)\�ң\�\�\�&K\r���c�\0�I���\' ��Q\��z�\�U\�ʅl�2N\0���\�n��1��ޔ޽:��B嶜�U�|�\0\'=��Ddd/;�늈��ǽ4@\�#˞�y��\�\0\�\�~�jd\r���@bBI �L\�\�D��s�\���|e�\�3\�\Z���p\0\�?Js�C\�z~g�D�.\�:�=�Y)\�\�#�5�\�q��k����\�\'�\�\�<�\�-\�l��>�\�W��Ϭ�\�:IvGE \�\�\�u\�qҪB{���r3\�D�H�\�~R�cJ�\�\�)�8�i\r�`t\�Ё\�c�<�\�C�\�Q�\�\��\n�a:�j�=㨧|\�\�*�=9�\06M};<�A\�\��:Ԅ�ӊCȤ1�\�NT�\�\�V�	&�\�6�횉\�|B�\�@\�p�\�\�\�r�jư\�M]�$E>���Wv�z���\�SҚ�:���Ny\�[�\�#C��ʨ\�l�~<U�\�\�k)=�5\�P[#\�\�;)3��)Lڄ\�[w\�\�\�ޢ�3\�g�ީ\�HO=��`\��c������\�+7*��e���\�=\�@\�NFx�5\�y\�ԋ���J�;�	\\t��Q�=2EU\nL�����\�玼Ӂc��\�i�\�\�*\rR&\�9�H\0RO\�\�Q�rA珥</=jKHy�\Z�\�$z�8ۏq�jx+���⁎a�e�R�\0\�{Hۺ�#��p\�<g�H�[�\�;У�9�FA\�ZR�#�ҸY(��`?qN7#&�W=\�0W�@\�;i%y� �\�B�&�^:\�s�#�PiC\�\�0jYh�p\'�q\�\'\�4��`g�⳹h��{\Z���(\�ҁ�^(\�\�8�qH2N(�����PO)p1\�\�ɧ? P�\084�\0Q@�\�\�\�\�(@\�3JG�74�R�PZ�\�\�TC�ˊx�\0�H��m\�|P�����.jv\Z�\�<f�8\�\�\�sC;Q�R��\�zS�\�\�iJ�zӈ\�\r\�9�q�\�iƗR�jCH���������y�$-���\�\�޷Z<�c�\�M)\"�J�N;f�ܵcBf�3*\�n0{R t\�\�T�d\�Sp(\\��sM�nEI�1H0{ԀR9�R�U\'�6�����\����\�;�8��3\�u;�~�e8b��&�h:�GZO�8�\�_z\01\�/^)v\�Lځ�px��\�ҟZN�h�K�O�&QH\'\��L\�*]�i�`�h3֓\�IHT\�\�c�\��RCH[�\� Q��4\�\�\�Fj�3\�GZ�\�(+�\�D�W��^8\�P\rc��2�(\"��\\pj\�#\0�\�O�\�4m\�Gl\�\0\�\0)p:ӗz\����qS�z\�h�� 7CO�=\r &9\�0\Z�\��=\�1�t�c�ą��c\�\��g֦�3p�Vs:��\�wC,;�X7�F\\�V\�\��\�\\\�\�:��Ȏ��|��@��\�>��]]�\rk�\�	C\�P\�x7&qڟ�fյW�\"ԁ�^����IҬ����h\'9�����\�_AM�G7��A\�.ft\�\�g�\�\�KE;���}F-Fy��\�\�����\�c\�s���a�j�_�X\�\�\���1�i:����ߔ̲>%\�޽�\�pD\�\�/\�\�\\�\Z�c�\�\���cjT=�QE)�ցX�؏��G9��&HT05���\'\�V�z��L�\��V��#��\�\�L\njc�\�zg�\�b<�\"��jc��܌\�FG	�1\�Q��\0f)�Ը\�Ա�\�i�\�\�R\�H�e�n\"�\�s��!��EK�3L��RDd\nCOl\�zR�6�\�<�Hsځ�RT߅0�@ȆqM<T��\�PI�\�Hs�\nCy\�4�����LRc\'�y���ҚW4��\�HE&\\\�3���\�M\�Id,isO=)\0�Ɔ�ȣ��)@�\�)zq\�zVr6�\�\�\�3\�\�\�ўy>ƪo8\Z\�GLG\�\�l\�,d�\�jf\0��T�:`T�)#mB\�u�\� f�!��i���ڨ͑�M�\Z�@����٧\�\Z\0a\"�@ɩx\�0�@FF)�J�\�Q�I��\�\�$�\�!�$S�\�ZF\�Qf3\�F@T�9� \�L�W#��\�cz��)\�4�f�$m��x\�zӀ#9\�\�PQ\��iH\�۟�D\�\�Sց��Lٴ3V�3�\�6``u�ɠV+�=zb�`\��p��\�;�\�!*;TX \�̸ޚ2횖\�K�Q\�\�Nr\rC-\r\�ڎ�)[9⛒*C��\Z��RMAC1F\�sޗ4Ӛ�R\ZI\�\�U\�ct\�T\�s\�\"��\�\�C-2�$�q�=\�\���j��ƻx\�b\�\�\�v\�Ίu��\�\�\�4GFɚ�E�_�ey\�ӥk\�xrF\�rA<�j\�P}\�`\r�\��+�4\�\�\����g��9\�Uç\�c�R֣�\��\��`\�\�\�(��O�e�\'\�ZiҬ�b�kX\�s߱\�3��c$i6|��G4\�\�k>F+`\�g깘�\"d�\�*Al�z_\�qʗ\�\�5�=A�ϥ\�9�t��̍ɣ�4\��yⓎ�s1r#�-��1���:\�2H���\�:\��\0\�M<\Z9�ʌgt�\�\\�\�B\�P$�\�oj\��\�0�⋇)\�}��;I1�}j�\����\�\�S�[>��\�\�^\�\��\�Zkք)h\����\�\�wq>�\�\�k�g�Q�H�\nq\Z����0�\�C�4\�*���<W����	�5Bt[kҫ\�V�\�N:֌ĵo��=\�\�s�QBK�G\�ϧz��\'\�M\0w\�\���ߊM˞Fi�\�r�\�$\�zzPI\�\�NGnh�b{�S��\�\�\�8<��N\'�:f�\��\�?�#�\�֞3��\�Q\��\�\�ECx\�ǽG�sRaՎO�=h\�\�\�\"\Z\�\�{��b��n(�R2)�\�#\\U�F?�H��Ñ\�\�\�5(Q�{�4�@\'�ئK\"b\�Q}�y�g#\�ϷlR�\�V<�i�\�i�`W$�Z�Fޣ\�\�T\��d��Vf+�Gҙ�\"p\0\'��iX)C\�`�M+��r:\��\�Gb?�zOb�����3$�E�\�H������V�\�$�<\��\�]yc?�z�1_>�-��F�-�}X�|QT��:\�\���#\�H�N)�4\�\\T�?\�\\��\���ۯ֭\��\��D3\�pM.x4�#�\�\Z���z\�\�q\�ޟ\��I\�J\�\"l�\�j	\��늲s\�Q�}��aֳ�Ɛ<��ٵ��\'��\�>�a#\�\"n<�\rE\"︙��e9~�׎3ɯy�\�cjgi`�#^��\�L�i�M\����[M��_J\�|^\�-\"~\�\�O5\�\�#z�ך<<\�|�z��\�\0�W�d�\�N���d\\�o~O�]T�\���\�Y\rTU\����Q\�O\�Q�Px튰��\��\�VדM\�\n� l\�ZA\�}\�H1\�<�����T\�2	\��Pq\�Jw8�:gҞ9�\�sRR\0��;�J�S�8sQ\�R�<����\�=1ɧr3K\�<q�L\�8��`\0�\�g\nr}i��P�@\'#HV\Z:�Rz��\�\����R(\�~l\�A\� �\Z`\�A�ՀM��)\�o\�ڌn#�;?�@\�\���9�\�CJ��zV.\��\�u\'�\�(\�\\P�\�iX\�x\�\�\r.>��\�(	\�E.;R��\�\0��Fz\��ڗ\�\�#Ҁ��>�\�ޜ\0\�4d\�`.\��\�3\�$S�\'9�\n1���>\�5\"�\�^&\���A\�*KH�T�)N)�v:�N\�\�Բ\�7�h�����\0�!Q�S\0��\�\�\�H��\�4\�1\�@\�`Q�\�i\�88\�(S�\�6�)B�{�pR�\�v�Ҕ/�\0��\�I\"���ҀF�\�OǷj`G����R(\��)�G��2 8���\�6�=�R\0�0#Q\�Gon�1L\Zr�Q,�!�\�?i\�@�Tc�)1��\�\ZC�Z1���\�ȧc��\�V#��Ͻ?��\�HE<\�\Z�H�\�x��Q�1@X��`���\n`qAB�\�z\�\�\�(#sHFzԄb�($j�z8\�4R\�5H�34u�`z\�x\�5H͆0h9�ZoS\�W`�\��s�o\"�\�M8ɦH\�瞕 \�S\�\"��LR��\�-\0i\r\n3�N\�M�\�x�\�Қ\0�M�y�qN\�\�Z�Xu\�d(=\�gI\�ZΦ\�\�\��H؜!\�g�I�I\�+N^e5J\�=G̓�FX\Zq�U9�ZdSq�\�+��8\�\�\�\'.r:b�[5�Lr*�\0�O!�Z2\����m�Ɣ\�O>��\�ayu��O�ТO�\�c��x\�P]�f�\n]�#�<�\��DE&*B)�sM\�X@\�2\rcj\\\�\�V� y��v��\\\�\�ح\�nq\�t��FFj3�\�M��*&\�v#ʑ�\�6\�Q�\�\n�?��N\"�\�iH�0i\�O���\"Q�R\��)��q\�HG#Ґ栴�HȦ\�Tƚz\�\�b�㚒�Ԍn\��ڙ��AR�qK�56c+�HA \\i�\�L��1�ԄsH@\�؄/\�A���=\�1�z\nHn;�Q�n�6:\�4�\nLv 4\Z�o4\�ԅ�qI�\��h�\�\�bZLT\�=j,f�H\'�a\�1\�\�sI��\���QK���,��\\ҁ����f3Ҥ��\�7�\Zy�cmS�<��=3Y�]\�\�\�Dþ\0��\r@N\�\�)\"H�J�\���\��>\�D���6��4\�@�R`\Z��I�\Z\0a�Rp)��W}\�1֜x\�0\�&0���Eg�!@\�3i\�\�Hq�i\�\�*G҂)�\�q�rh$�`��I�\"�\��K�@��ӆ\��\0�R\�u�\\�\�AHcp|Tlz�\�Lr1ߚa�\�@27\\�W�\Za��{�\�==\�F\�`t<U\"H�	�1<S؂O���6\�0#9<Q�~\"�pNI���X�\ni�8�0\�)��\�C)4�Js~4�J�X\�\0\�\ZN����\�HB�z���S\�8\�5�2:\�2\�\�q�\�\�:V#�w\���#ս\��Jȱ�M\�\���\�+>\�M\0�8���.����v\\v��^\�]�\�@Wo\0�MS�T�\�,$�\�3�b�乼edu�7\��w��Mi\�\��&�b\�\��\��\�\�Z_}�\�%)�\�;sP\�6Z�\�zN\�-&W8�Q�\�%�ڤ��\�[h\�>/�i_1\�2=\�U)1�#љ\�UbN03\\���%\��Ęا��\���t\� R>b;T\Z&�kRI\Zɴ6K0�9�T\�Br=Q\�2is�\�\��>W��qZ�z\�6��\'�Q\�\�̎���.\�wا8\�\\ծ���)�ɩt״�$�`\�Ϟ3G#c��<\�6<Eb��3v\�sZj6֨\Zi\0��\\�M��\��uH<�##�Y\�[��\�*4�\�\'�j�\�cY駱wG������R��w�ņO�8�Q\�\�H�dw\�\�g8V\�})r�\�{q�ALq�\���\�I\\�U\��\�x\�zU$ɑ\�_ǻR\\�*On\�\�W\��\�\�Iy1�U\�.@ϥ6v�p۹=\�TrIc \'\"�a\�A\���*\�\��F>Q\�\�O\'�iĎí7<\nw@@ZfN9Gz\\�1�3E�f\0~zҜ�\��Tm�\rKcHL\�I\�CQ\�y9\�{t\�;p#��pjFF1�\�AԤ�=�֑�l\�h� R\�)�c��y8\��F\'��DXg��\�晁��=h\�\n\�����99�C#\�qQ8<@8\�R���z�A�c�M\��\�Ƿ֪�X�Ǌ�::�q�CU\�W��d\�.\�\�p:�\�\�q��\� �����\��v�98\�\�LksSE���\�\�k�S�\Z\�\�R\�!\�z\�\0a�^^){\�\�\�R�6�\�;w\��{֨\�\�,xe8�{V�dq��^{G�Y\0�y�c9�4���\�jJ\�	�\�J���c\'��:s\�j�}rOsHA\�)\�\�>�1���g�4qM\�ݩ\�`\�9\�R\09\�Yw��)I\�5�\\���l\�\�\�;\raU\�-�R^�<\�/�\��jӲ\r��Ԍ�5V\�|j�ױ\�\�[:[,��#�\"\n�=I�@\�\��y`��\���.?x\�ۀ+�L@�4�\�{h�\Z�r�޼�\�&ㄩ\�<�c\�;�歩\�\0��0��\�8�\���}J\��&�d��\rH\����JP˻�nMX��\n�jA�ҀC\�qޜ94\Z\"B{�E?,\��SFǽ=8�\�H�=K�1R�\�$�zԝ�z\�\��1I�\0zPF>QJ1\�*YCr\�9�\�Lp)��qڞĂ<�\��?BjFBF=OѸ�\r\nd\01�\�@\n2	\�(��\�2\0\�(8$t�\�ڀ�{R�=\�)�\�F)\��h~\�\�\n�dqQ�\'�Ҝ�b��\�|\�@\�Ecޝ��\0�xǭ(F\�(\�)\�\�@!1�N� ^h\�\Z���)�f�\�h�O<R\�&�\�M\�<\�\�~)�zӁ�ƃ4�i$���3\�4\0O��\��\�nAb���\�I@\�MK)��\��MB\n\�/\�;!<XN��\�N���裙Y�\"�\�#kp��\�ʎ�\�\�&\�\\��\n�\��M\�\�;\0SC`z�y9�յ\�v\0p3�~\�Hb�q\�3C� ��\'\�l�X���I��\�}�zd{\�.*\�@#�Ҁ�jXeI:���G\'R�\�U�\Z<�F;U�\�曹Oª\�M��\�HͱI\�j�<�ڢ�7���\Z\�\�\�\��`���t0�ʁ\�\�k˵\�\�/\�\�n�X\���\�xp\�R��\�\�XӜ�\�h\�J��FWgKJ=i�N��8��94����i{r)��\�м�i��\������\"\�*��B1\�sI�\�Ԯ>Q\�\�T�\��\�X��7�HX�j\"��)\�9E9�qH	\�Ȣ\�\�5�A�4\�qN\�\�3�JL�JzqQ\�\n.�iO\0b��g�P\���.KD�$Ұ�\�J	\�\�\�3;��)�\�Oe<*a\�jћ��\� �l\�\\\n�N�\ZJL▘h4�N�?\'4\�+!iG�7���=rx�w��}&\��\�\�q�\0�p�\ZH���\�8�\�$I�q[ZB�rqҲ	\�4\��k0,2\re;ٝt9T�\�\�b�y\��|\�\�\\�Q4ӭ\��b}+��}�O���	\�Jo�¤\Z\�<�������\�f��}�S��\�A�J#>�4�\��\�`��qH�ޒs\�\��\��}\�J+\�&�sB�ڴ\�ҧ\\�=����H�bI�=2qP\���\�FX��Ԣ6��}�\�2Ӧ��h��Ɨ,�1:��񯼧�\�!SZ\�\�Na�*u��u�?\�P��\�g\�w��H\�*i6�\�qk\�\�*�HyÌ}hK�^	�^�b\�_�ukX�>j�\�^yu�,�2�\�+JsQz��4�u,�\0i��Чx\�i\�\�vFJǕ(4\�\�*`84\�\�\�r�h\n{Ի�Z�a��\�\�HG5i$f���\�iՂ3\�)�EM\�P!\�0���gnM?J���U\�7�.1M(M+���@�\�Ղ��J\�\�E\�Ss�S\�拇)r*2LV�\�&�����7�Gjw(\�qFъyRm�p�	b�i6�.\Z(<�\�?ڐ`{ԶU�L+SM4�#�  �aqS04\�b���]���ڙ�9\�\' ������ \�b��:\�\�4�\�\nPp3\�)qϭ)�,�2�y\�MJ?Zk��\��\�P�����ȨFNsJ�1�f�`{T�#8\�i\�7ޥlޣǥ\04t\�5�9�\�@�\Za\�)\�\�PKC=�\�iԇށ\r\�3�Rc�?�\0T���\��SXQp#\�\�y<Ԙ\�CA\�Ҙb��R\�\�\��{R\��E8ޓ�i���c�i\��TD�\�\�\�n\�q���\\TĜ�\�\�Ҩ�&g���8��\�ݺRz~y\�K(��8Zz\�\�Ӹ���$T�\�>jwiv��!�����))NO��J�R\ZMFI݌\�z\�s\��)g9�\�p?\n�\�==iX|��\�P\�P\�:�z��\���\�b���Z�l�.\�\�\\\�L\�#��l\�%��\�94��x\���\�BQ\�c\�\'J�\�Q<��Fe\�\�9��ŴIf\�>�q�\��W;vcn��]\�\�\�qP1��k\ne-p���Z\�-OL.N�\�㈿<q\\\n̍$,v>Vǭw\�:6�\�<��@⸇�4�&9\�\'�沏SG��bki���=95{M_%\�\"��a޳7��ua�y�{I\�\�\�\�t<\�L�\�K��/\�$dև�#F�6~\�r+3N��#@\�&�u�.KH\���=k7�H\�4�c�\0H�@\�Ҡ��xmnTg#߱\�Q[�m\��\�F\�;TQ\�M\\,����\�T�w:�+K��3�\�z\��\��C,q\�ϧ$c�I�\���E\�|\���4�\0 ���$�X\0G�GQ�8��h\�\�1�\�5��[5�\�\�\'/\�\�9ϥd��6�\�<\�\'��\��$,\�`@�N*\�J4�\�\�q\�ry \�^����0嶟\�\���2�}q\\��$3�\�{\�5(�Ȓ\�\�\�N�\�e-�ҩ\�ڿڢ\�M\���\'�)\�c\�I�HJ#���k8j�;��\0z\Zn\�GF�7��\��\�>Lg9\�JҘ\�ިL�\��\�\�Hz*��*q�֠��9\�\�}j\�95W3hi\0w\�J9`:R/Ґ�LV\Zzq֛Ӛ\\�\���g4\�4\�ӂi\�r?L\�c�Ke$*.�\�8\�}y&�Q���x\�\���	�\'�AG(q�c�9�\�0N}��U�6+r�ɦ�\�\0�\����\�\�Ҩ��1\�\��)���qo�\��=*0\�=���5�\'�\�,3R����I��eI�\�sQ1n\�\�V\�W;{w\�Vs� `}})��<\�;s�ji$�\�Q\�qMC\�\�$u�a�\'�\\\ZLc�\�\�\�op:\�5\�1��x�\rd\�tl�\�\�Oλ��#{~�\�\��L�hҶ8#�j\�]��\nǷ?2�\'9�h\�I�\Z����c�%\'\�Oa\�\�\�*0�\�\0�r\�t\�V�,v���ހ>�\�i\�8\�\�(\r�R�\"����69\�\�0�\�(8ZA�Rc@[#�r�$�%���\r\�WPp8\�k��T\�-bUUm�`\�.!\�꠯8��ɽKn<kF`\��ʰ\�3�(\��\�4�Sp�y\�U\�w\�\�\'J�\0t\�^W\�Y�(�\�\�\�z�\\/�\��\'���(\�\�q\�+\�\�U\�z&|�w+a�\�I����pNi\��\nN�w\\�ԧnG\0z��E��a7\0S�\�i\�\��<��^�\"�rG�\"\�&��=	4(\0�jQ\�8�����\0 \�,z䑎�S���s�\�c�c$�\�Ҡh9\�\���s��FF\��S\�b{�R\�\��\�A\0�aJF\�Hr1ނ��q��)\�\�#�MQ�\�����G4);�ȩ6\�\�\�;\0\'j�\�\�s���\�iFs�z\�P�	9\�*@\�\�\'�N�\rK)	\�\�p�\��N���`6O\�Hb��\\��w�\��p\�@й\��\�3K��:SȩУ58i�T�5 \��Hf1�PsO\�G�<qO�GJ\\u�\���#�I֎s��b�\�#\'�)p;R\�~T�C:H]T\�On�\�&�\\@v�\�SvL��R4\�\�\�=\�\�\��5�\n�2Ă}ke0�\�q\�\\s�\�\�O\�2-#���I��\0c�W�Q�H^O�J<�T�)ǔuj)�@?\�\�8����>�\�=�b	�\�])�r��&R>�B���J�g�\�\rU��\�\�&�$q\�Jm�\�x����/�v/�-��4ŵ�EY$�n�\�;\�w!H���}���-�\�bx�\�\�5��s�\rʓ�\�>�ޝ\Z\�\�\�<�\0���\�Q�8&ȁ��DN\�/�ЌdTbev�\�\\7\�M)q���.���c�\�I�qȪ��u߁�ެ���~����\�!\��z�A�9�y0d�\��� \�\�\'�wA`\�K��H`�#�>\�4��l+�=\�\�\�L�u<APݍ9\"��gғ�\�	sX�hC\"�\��_&\"�\�P���`�\�\�Cf��*[i\�\�\�֭WV\�`1�-�Y�cB�r&P\�Jw9\�Z�f�?\�}\�\�\�\����\�đCqU���rk�6�\��h�%�\���T\�,�\�jAWnm��~Wl�\�hю\�\\\�~̇n)6�#𭏳[����\0�\�\�;�W8���W��D\Z\��\�nNwj��67�\�TNi�$\��f�\�\�@9��gi�I�\�i��\�&�\�\��҄=��q�[�\�zRe[�|\�V����\�ӭD\�ߞk�:E�\�C\�/�E��5j�3x93�+������[d�\�\�\�U�M�J�E��n\�h\\We��j�\�\�I�#!����\'\�S8\��֕P�ӊ\��l��84\�@��~\�\"��\�@\'�_lWa��	\�%)\�Q�\��;\�\�\�R�T8\�8\�O\�q]g�#˜	�R��\�\�/m\�\n�c�\\�@�+��\0�o�D\�xw��\n~\��*ݎS�1HA\�à}�G�\0\�|գ\�D>�S�ʀi\�uB\�qN��\'�T�\�4��\�r\�\�rٮ��vL}�i�\�r��j]h�ZݎW�NF+��\0�n~1\"��%��ҩ!\�\�kL>�_�LۊB��ֺ\�n;��V�n\�4\�hw��\�\��\�8⼳\�W�&�e<�\Z�R{�׺ɠ\\�zׅ�\�\�\��ݬ�\"�C��\�\\�Î|\�RZ:\�\��,\�R\Z7Ì�\nWo\�8^}\Z	gr_�c�y{D\�W�=+\�=\�\�v\�=�0\0��}�\�gJ�O]�j\�ȹc���z\�vEl\r�nB��\�4[\�m\�\"\�#B�_\�̦v\�S��ێ��\�[GF�=c�j�\�5\�\�{sY\�q��iU�\�\�&\rqrJ�\�{Vb�.\�\�\�K.�}\�!\�g8�	�\�1�;\�\�ϩyM��:n\�2��e�P��qy\n�k�\�O\Z��@\�9ү�ƯF�D��\�U�9NM\"�\�#�q�����z���}��r`j\�\�G���>\�N:S�\�i,�;\�\�\�ir�bʥ\�\�eا���֭�Y�\�i<��~F��9��R\�Pe\�8\"���Zhd#\�\�L�\�Q����\�R�\��I�\�\�X\�&~\�g\�F\�\�\�`*�T\�WkzPT\�U��6�jiS\�is\�\�[e4Ǌ��v4\�G0{2�\�C�S\��\�.B�S�`��\\ �g�>r]2�Fq�n\�S���i#�\�O![�JOZ��\��\�\�\�\�cz�� �~�t�f\�p*2��\�\�1G�\�>VC�Mj�Q���i\\9YSQ�\rX\"�`3I��x\�\�L��\n���a\�\�St\�z\�`S\����\�\\\�%/Z3���\�S_��Rq���I4�HNqQ��ԛ�*6a۠�;1�\�j��4�y\�§<P+\r��\�ߑR�b�<�f�\�\�Ni��R9\"�J\�`4\�}&�q4Gފw���\�\ZE� �N1@X1\�ӽ ��\0\ZN1HHh��^h4qA4\�+j1��PI5\�\\\��\nqMb\�k�pJ�`�8\�-��\r\�#ڼ�Wd3HNI9 g�u>bm\�+�I\�i\�\�\�\�}\�{P\��)�q�q֟�p}{�E\�)#���5&\�\�\�\�v\�T����\�N:�Ԫ����3I�����㷽D\�@�L�08��|\��8�\�H�g�O�4��S�搎�z\�2\�\�=����\09ɦ\�\'�͖�\�Mr0i\�\0i��͚De�q\�j��\"�S\��kF\��\n�n3�K�^��f\�$\�\�g�\\:fL`\�U��\�3+<$�\�3[\�\0sK\�3\�=\�Q�vB	����/&FOc޳�\�ty�0���y_Q\�\�W0ǂv�\�z��{gݍ\�G$\"�K6�G!p\0�k}J��K���$�נxq��1ۊ�\�훃Ы1{3\�e���)r& ��\r:\�A���\�f20\�x4�L\0!\\n\�N�>\�\�yK������\�G�@�bf�r\'*�\�>���ZB�9v\�Pt\�B��\�6\�l\�1�\�\�Q:l��ϕȹ�Ğ:T�@�I����#��ݝ&̏�G^F4�Dr\�v{\�\����6q��\�\�#.\�!�\�\�5��\�\�\��\Z[��G���\�m\�\�9\�5��\���I�u&��͜x~��s)M�=:�EZ\�t���4�yk��\�?�6�|��4��63��\�M\����Er\� ��3�w�atmTG$� 2;	\�ٯC��Ǟ��M�۲noҒ��\�\�\�c�S\��\�\n�i�o��,�\\{u\�]�6l�K�#�[	�01MԸ�JF\�\�\�͏(�s�ָ�\�\n̓>Y\�\'�֒fRCa\�\�@g񃚫B��ե�\�x\�ŉѱ�\0��GqS�9n\�ބ�U&!��\�~)��FF	���3\�M�F(lv!y9�\�4\�\�dt4��#w�\nSt�L�6{\ZU=�\�M8�\�gҚ!�a\�\�|Tc�\�T�(nGz��~j\�\�-�یS�9#����\�9\��\�j�b�9\�x��p\0�ʌ�\�SIf\\\�z{PK��@\�UyQN\��@~\�5\0\Zh\�D29h�\�pEW\0��ٜ\�V��\�׏��\�$\�\0pà&��J|ހ�h\�\�On�)X\�;x<��\�\�<\�<~2�]�{t\�u�^-��N�*�l\0ǲ\����\�$�Q�\�q�\�q+C\�\�Siv4읝A\nT�ջ\�\�\�5�m��\�+n=\�yL�X\�j9��\�8\�\�J�\�3\�;�¢\�DX�\�\�ɫ`�ǡ��*W��N\�=E4�5X�9��\�\�<t�8o�Dxj��\�E\�zRq\�R�ܚC\���>@9>�\�,�R`�T}\�\�+\�dS�+\��K;��d�r\rq\�h�Uy�(�\�\0\�+�Ґ�3\\�\"��<Wi��s��*;���F�%P����֦F\�\'n�\�{�\��ڼr\�Wbk\�2�\�M�$|n}?r\�\�\� ��zz\�*1�\0\�zT\�b;c\�{��p\�LӰ8>��<g5hC���\�\\}?�7w\�\0b�=�\�L\ZW6\��z\�y\�M�\�8\�5hm\�\�4	���iˀ��8��#��\�\�s�\rA��\���q�\�Ҟ�>��\�C\"�\�\��\�ڂ�\�\'���\��*U@)\\v#\\��AR`t�\�\���@T�Ҹ\�.^229�r)ݱO\��c\"\0*EN��ӓҐ1�N\n]�$c�\���\0�Fq�xPy4\�sҞ�\�J\�aJ�i1�\�\�?m\��R(^�R\�\�5[$�j@B�R͙\�S\�m�U\�\"��e\0\�JhU9�\��i\�zf��\�?ozpOlP;\r\nx�ۚ��9�\�\�zF0W\'�)�Q��]���c`>��ң*3n�:��A�\�\0vԐ\0n\"\���&�4�\�moF��\�GPU�:�_7\�x�R�\�RLlg\��\�d٢\�y(k\�{\�\�1\�\'9����*rSI6���m�\�p�c�\�\Z�\0L�}q�T+ޠ\�\��@�G?4\�\�gn|g�9 ρ��\�ҷ��g\0��:t�1�j\�d�Ҫ2D\�K�=\n\�]\�\�q1<zQ\'����Fq\�#+Y�R\�*�Op>���\���͌�*\�+k+ld\�5Ց��5\�\'�.9\�G��� �v\n\�\�\�\�#� 8Q\��5��۲{u�%d\�#Rv��\�Rx\�]�*�duې\�iW\���;�wҸ+�;�qȪA�\�\\n�O\�g�\��V*w�\�aj\�\�\�k\�7� s\�\�\�D9\��vz���Uf8\�r|@\��\����\�7� ��Wt�J�e�\����\�}Q1���\�҃�+R\�\Zn��,\�j\"\���;#7^����\�z\��,]I�6�5f?kR�\"?J������?X{!��r���a}b����\�z$�\0u{`�j�>\'j�\�E\�\�y�\�\�y\�E\�	�\�\���\�K_�~\�\�=}�&\�18��\ZW��~���L�My���\�dҺ\�X�G���\��N���n��\0x�V\�\�9�[�\�\�2����r�A��J�\0��=�~)\\����6ho�WL\�lc\�Lt\�&󊤠�	\�1_��G�7\�+�Ю�8�O�+�\�\�\�x�cR\�ګ�ʅ�\�W���\��|H\�\'Da2:S#��}\na^=Xד)\�T\��\0*�\��\0\�\�\�\�K\� <\0�zԇ\�\�<��\�L׋\�9҃T�\��T^\��\0\�\�\�~,\\Cϡn��D�~s\�5\�=E0i�:_\�?\�g��g�\�؟\'6\��j#�n\�\��\�x\�^)�){*ʊ�\�\�\����\�~0\�\"\�kS��N~1\\�1jq\��W���֖�����y�3�~�ۏ\�+\�\��\�Tk��W�=�}��H\�\�U�\Z_\�C̱����\�\�I�5�ƕ~1\�e�j�\nw��B��ic?\�\�x?&\0f׷��\'\�\'�	䞴�\�\n_ʅ����\0�\����\�!6dcV\�\�@\r�\0Lk\�ߥ(j=�/\�C�\�Ư�zϣ�\�E�{9ZO�\�{�\r����w҇\�sS�z]�Y\�=\�\���a�3ؠȂBi\��N\��yq���\�\�\�V>\�V�\�?�1\��^/��M~4\�p`�~��I\'�T\�ϥ|\�dS�SA9\�\�Q\�\'�\�?��}\�\�\�����r{\�R�:FG\�����!�$=�Vc\�h��\�\�3���\�}*��<�\�0��jq�C\�\�\�����\��Ԫr0@\�K\�\�\�Zϳ�\0/���c�\�\�\�p\�U�K�\�d�\�>�k\�%��j9#0\r/�R5\\C�-\��>�<0́s��5|W�\�\���yٞx�G2\�8\�P�t�\�aĘ׿\'\�}W�\0Gà\�30�\�\��W�\�p.k\��:�*x\�>y��:v\�W�ōn\�\�\�}R~)xl�\0\�\�+�Լi\�MNP�m.\�o�\�+\�U\�VT\�7*���\�b\���ˋ�I\"<wK�q\�עA�\�\�!ۢh�WȬ᱔$~Q\�TP�t�\�<G�_f�>����\�ǖuRq󊸟|7 $_C��\08���\�\�j��)�ڏ�\�\�\��\0Y�k�]\�>\�>>�\�\�\�Ё\�\�R��|>ǋ؏\�_)\�jD�H\�Ծ�I�a��\��\0\�\�3\�?�L<:H&�\�U?\�(�\�\�\�\0z�W\�-�9���$bs�\�g4�\�8��Q\�!�\0�ط�\0.��b\�\�_�\0��`�\�+F?\�RE�\'\�x��Y\�T�9Oç�Q��\�k�qkzP>\�>)\�NO\�!�\0�\�3�M���}W\�\"g� �Ӽ\�\0\��\���?�����\0>a��\��\�M �.\�9\��i�\�\�?O�\��\0}��p\�\�{\�\�@1�\�\�K\�P�f?����\0�0�϶\�\��?{ȇ\�*)<M��>\�s�n�2\�ʇ!�\rĤ\�q�\�X(3\�:\��]@�i|I��8����\��,���/Ys���X\�Ρ&N\�u�hx(�\03.<EW��\�\�\�ڶ8�\0]\�k\�#Ώ8��WP��|�\�o4\�\�oX�nf\��P�k��\��|���h\�\\��.��j�\'�Z\��\�Ŀn�\�\�>\\�\�4}���~%���xX�\00�\0\�	?�s��l�\0iY\�OΝ��#\�\�\�p+\�u\�5�n��\0�\�<j��\�w8�\0����/\�*9�{\��O��\�$\r���\�\���5�����wS��w���w5?V\�\�/�qϟ\��%\��?s��T\�\�>8�5��$:�9k��\�Q\r{P\�\�w.ޤ\�%���\�O�]~\'\�F�\�8\�g	\�X�$d�\Z�뗤����\�:�k\�\����N�\�5O�]~\'\�{\�\�ҏ��\0\�4\�J_\�j���_Α<i��M����\�׊�\�\�fp�\0�l�\�͠\�F�=�\�\�Z�K��|.�nޔ\�|s�\� &\�\0{T[\�\�0�F}T\�jx3�@-I\�s_)/���9X�3S�\0\�u��\�\���\�?�\���HK0e�yD��s_.���B�H�^=�\��E\�%�}��-\�R\�\��II�V�\�TF+b{\�\�C\���\�Bqҟ�\0X\'��\'1�~��H�\�\�~MG�{a��^\0>!j���	\�R/\�}L�U5-y�c�?�#ߍ��fjo\�\���\0z����<��\�3A��}��J\0����t{?���B\�N)\r�dd9�u7T!\��MJ�.F7EۜzR-b��籵�=5�\0I�b���%�hsQ�\�\�q��\��\�\�W\�(��m�_0S\Z\�c;\�y����bi�\�8\�	#�\Z�\�OWhH8\r@c�<0⼼�F�?\�Xf�\�\�\�&\'\�h�H����Q\�8\�yx��l�_�r�B�\�ZL~֑\�[�aF&�\���2x\�\�b8\��Ol\�$s\�Qq�Jg|\�\\`:\0�o#�p�\�9��ߌ\Zsx\�M\0~�\��)6\�o��\�!c\�\�q2x\�L 0�U?\�5�\�,��\�Ba\��i�的ݐ3��\��e��&@j�]�#2�\��w!\�\'����\�(�^rq\\$�+�\r�\�L0=\�\�Q��5@��.�\�5\�\��A\�S��\�\\W�$Q\�2l��\Zꑐ\�i�\�u�\0\�	\�\rN\Z�l@\�s\�q2\�1\�ɡ|E\��b�qY��\\q�TϾ7V\�G\�G����`�ZҊ�	!\�~���Y�h�+y��kWD\�t\�0bF\�\�<Qr�\�s��sޱ4e\���\�\�+T�\��\�d��$P3�&�F\��a�\�\�G�pB��\�`@�3׵J�1����H>\�	\'�}jRNI\�^E0/_|�N\�\�\�~4\�\��<\�)\�QI���M�\\�y\���Srpq�qP\�Dx���\0s֣⠰\����\'��\Z�X��\�4�A\�zS�\�-d\�\"%�*��WQ��\\��=�9	]E\�rqXI�\�tt�F\�x\�Z�$�5\"\�B1\\r�;\����a\�2x\�e\\�\�]e�RJ�=j9��#��z���q�QI,q.\�@�RB�rN7�J��ԭ�f���\��A\�\�dA��)Ì�9��\Z��\�u\�N\0v\�Rd\�wF _�7\���\�z1��\�G\�N)8�,����Ҩ\��;����\�4�`����#��\�\�KO�q�A\� �\�M\'�U&g%�\�tg�\�s��\�Z��\�6\�AY$m��\��X�\�Dp�\�\�f�\0qUb<\��ՠ\�\�ƵG<�P1\�M)\0 㞵e\�\�\nq\�;c�M1!0����n\�*\�H䚏#+���=x\�7o\'#�~\�8�\�SX\�\�A\"��OsN\�@&\�#��\�\"�\�\�\�%�q�ƚ\�:t��<c�5,3TC���\�FI\r�Ǿi\�P\r\��F�&3��E;��\�\�\0��j.0@\�ҟ\�<㸦�\�ޙNJ\�%�\�\��\0�R\�y\���!�\�ߕ�\�*���\�O_�X r\0\�@\�(q\�|�\�Tf\�X\�S�z�\�)�x\�2:ǽ	�[,p8\�g\�r)1\�c�\0x`��\�i�E��=	�u�PNEn\�\�|�\0d�N3\\��_+UF\�,prkn\'\�\�s�8\�LVŠ\�Tc\0W�-ϩ��F�{�ޔd\�zbg�\�{\�ֲf�l\�\�AR�O#�:\n��:t\�VA\��Й�Q\'\0␸\�H\�<Tds��\�\�\�<)�Joj\"��*X\��tא\�N��_�j`�\0�z\�傞k\�\�\�\�\�\�T���5\�\�ߺ�C�\�h\�R<Q��X�\��`\�\�7rk�x\�\�Q���\�+��\n��\�8�(-M\�,G�\�-�\���!�VR\�FH&��\�\�.9\�W\��\��k\�2\���~g\�g��X.\�%\�y���\�H�\ZS��^\�<\0a���❒{Sr8\�=�\�>a����������4[\�9\�@c��\�\\�\r�\�\08\�5)JE\�\�S��9\�\�Hp\�sF0	\�UF@Njc\�\0�*i�\�;s�R�8�Uc\�g�H�\�-Dg89�u95\'#�]�\�4�>R2s�\�\�@<�i\�Np�>� Q���\�\�6܀M8.{Ѵ~t\�ө�\�4e�\�94�qɣ�h�u�@Σ���{�W�r��L�b��i\�<\n; \�3��~���z6\�Ҧ\�3�\�#r\���&y�c���R@��\�<f�\0\�S`�W)!��\�{ԛz})\�A\\�!֔\r\�Ԙ�\0\�+җ�\nv\�S��\\\��\���9�#i����zT��\�E\�j#\�U�n�\�\�KcHng��_/C��nR3_!\�7N\�����%Lɢ8�\\3݃޲G%޷\�\�6Iq$K&@\�8�\�z4�Әշ#��4�\�$�`t㚪59����\�h\�\�S:\�\�kg*\�p%�>n\�ږy\�\�\'!s��`\�7^\09\���n\��M=ᵀΐ�#⤖\�O�O9�#t\�<�ְ���qB��l\�+\rXA�L��\�OC\�]9\�\�9Y�y9@>a\�\n�y-�Ŗ(ʨ<U��8�+),/�\�\�c��R#\0\nҾ\�\�\n\��Ŗ��)\�qR�\�.\�q�Bl��\' S�\�9�?\�F\0�Faތf�)�V�\�L�ojn9�8���EȀ��4\�4\�b��\�`\Zx捹��\��\�4T�\�LRUr�0+ ��s�(�\"[\Z\Z�t\� 5 �DW#�\�;���j\�+�\�(\�)\�Z\\{sM �)�-�\�:\�N¸�h\�LS�\�\\\�H\�78�v�\rFr�&\�ɣ�K�R����\�1N�{\�!\\n\r(�<��j\�X\�XM�\r�KVE�\�5\�+N\���L\n�D{Ԣ\�\�\�J�\�WRG Ձ&x\�H�\�d��0qH�Ta\�)\0��\r]h��T�h\�\�\nGS֍\�3N1�\�0@FM4�E���Ծa\\TaO$7\��\�g5\�\�҂�Tq�R�	��\r�\�46i\�\�;.\�)\�\�Sy��A\�T8\�rE1�1�9\�9�gi�=��R�D!�g��\'��N�hڤ9H]\��ٕ�95#|�T`\Z\�c�@\�&�*KsL1�\��[�\�	��\�55-�\�\�9�\�pjq\��\�Q�,q��h\�d\�Q�p*ɋ�\nF��2�6�6ѝ�$TUqH��=E@P� \"��\�3��FE\�M\�Sq�\r%%-K-EG\�E?�&1Y��\��LT���\�\"�G8�\�Fj� uL\r������$v�\�T�\�F�*�E0\�y�\�\�ڣ+�\�F\� \'R1N cޓ�f͐�8\�%;\�sP\�CY�0�\�\�+�4`cސ\�\��\�3��\�t�q׊N\�\�e�4��\�R\�-r7\�aކϧ5:�P\�-X�9\�/���֡\�Pr*[f�\"\�Ss��;�\�zP�1\�-�\�6\�~p9�x\�i\�,M.f]�3R�߮\r!r=)ݎÝ�\�\�\�<\r��;\�\�lG�j\�+<\�\Z���\�(����\0psQ�j9N\�T-ך\�\�\�EL�sM�3P�@֡ȮTLel�\�9���\�\�4\����Q\�\�#;3R\��&\�Ē*OJG�\\dK�\�8=zU�&��Xd����g�\���\�_Bs�����4�[�fY��\�VŠ�\�\'f\�Q�=1Y��\�^�Q^m&IPå]\�gY\�sv�\"\� gnj�\�kvXaggۗa[6�Ϧ\�@#�|�v\�9\�@jt�{hA]�\'t�1\�昬q��\�\�\Z�g`x\�:S.\�\�³�\�\�k�\�.�\���ɪW\r;ɺRKQ\�U��+\�2N\�\�|��D�7A	�\�d�5L�U`�$�}���¥�r+E#7�\�J���\��\���V6z�ԓI\�b�i\�ܚ�߄\�~��\Zno��PN�t\�z��e�!T��VHʰ��X\'jlV\�I��\�]\�tWIK@$g��\�ސ��8�\�\�s��>��qL\'���r)��r&\�\�7�\\�pzw�\�<\�6Z�\�3u:��PP��i\��\�qQ�1\�K,N�\�\�I\��-F@\�k5��I�`c��\�Y\�@ԟ�L{\�4��1\�&�,\�-\�6\�\��x\�-�Μ����\'��M\�\�g`X\�~+Ȩ\�\�Y\�\�Q�h�u�\\\"9N��&�I\�b�\�\�_�:U��&\"\�ye�t��1b;T�\�`�\�\�*\�M�hmGs4�1o\�nkk�DB<��#}�\�[\Zz;Z��# �\�\�;�vD��\�qWvP\�\�\"{{\�#���\�*�ծ��~�f\�\r�]H\�bH\�\�݌(8\�)7+\ZӧI�t_�\�&fA\ZG\�\'ҕu[�n�\�c�٬��\��aǽ[��Y��EJ��.�\Z*\�T��1�c�V֪\�$ke��\�l�ρ�m\�W9qnbh�m�+F\�\�\nP��\�l\0Ls\�4^j+lYI\�YR:\� \�/�\�\'&�X�\��Wv�\�EF��b���\�|��\�W�U�(rO\�2k��J�\�w�=ES��\�3�\���5\�h\���\�\�-uH��݅\�lf�mb\�\�5��Α��hu9\�T\�c\�3�@����\��ܚ7��k\�\�p��\�Z�\�\'P@ 5q�ʮ�T|��u��M`р0@~յ:�L\�\�a\�N:\Z�s	�\�ێ��9@��c\�\���b�\"x�G \�\'�*�89 ���\�q�\�9>�g\��=�h��@\�\�L����p�\�?!M\�#��� ]\��\�@^���v9ɠq�\�0\0� i\�\�^)�\�=�\�b�\�dQ�\�L\���9��� \�\��鎔ӝ��\�\�2c\�@v\�0*���\�\r>�{\��#<暼#��d1>\�?���\r��zdҜ�\�:�h^>\�\�A,��\�AQڑ�^\�杌p8�\�1�8\�j\�dYP\�y\�j\"�\�\�\�A\�֬m\'�\�W\'ns\�\��Fm�ǎ\�d\�6����R\�O\'S�G|{\�\�cB2d󏯽li��L��s����\��\�I\�\�AZZ_�\�6\��\n\��;�n\�F�|�<�\�\�lB�x\nFc�wrk^\�t�\�<J�nϫ�\�j�1�О}i�\�p}�1s\�w���+n�@9�S\�]۽������q\�)�3\�.;��\�#�M\�\'ۭ)<�_X|�¸\�\�$\�ۑ�֑�A��cE�)\��5\�P��J\�\��!\n}�z�MQ\�Bkʴ�\�LJt%��ּ\�S�H���Fή\�S\�%A�\�\�2�\�\�\\��yl�y\�\�@�JtV�U�\�x\�]�r��lyDH��\�׽zO�Цy.qǵy\�*�\�\�k\�r�jͳ\�s�sb��P��$f�v\�J:I\�#���W��$�>�ML�6}�;Ћ�z�� �5@����n1Rm9q�R\��\�\�O�7*Ĉ��j~�sP!�<�jn�\�i� \���\�q���A\��\0p\�j-!8\�s��\0���n9��\�l\�!�\�.	�\Zz�<椫!�p\��/\�\�3HW8\�{\�1LMߎsF\�ޜ�\�\r*�*�,N0��W)\�qK�{\�%�<b�9K)\� \ZT�i��I�J\�\�S�u�R�8\�H��4H�\ZW)!�s�լ�qL\n�)�⥲\��JQ\�SN\�c�jW�\��E\"c�\�dc�\r\�\�ɧc~�b�E3�3ޥ*{\�wd\�qǥ��\�ֆ��\�\�#�8��c\'�])\0�\�}�����5�\�?$\�`~f���̑3HN:��o\�̅-\"��l\�\�	/�0r�\�F\��\�^E?��\�9��\�m\�\�ҵ\�\�\�3�~���J�\�%\�I:pTbE��X\�\�KHL�*�rk�m�\��ְ��\�*\��\0ҽ\n�#qk�_</ w��\�\�5$\�Ȫ�0�\�\�\�櫢\�\�T*X�\��\�\�\�\�<ֿ��;f�\�,>PE]�[0\Z0���#�K�ݤ\�RJ<rjKrw��P�1/�-Àx\�Rx\�V�O\�q֫�kZ�g��\�\Zp�\�<R�63�4�T�\�\rZFdT\�)\�9\�S�Z1li���$P1VE\�\�S�(��!\\���\�*AZ(��n\�O\�NuJG�>PR+\�9��jq`�\�C�hZ�\nA�i\�\�$M\�>�\�DsO\�F*�cHg�9�ҏ\�E�\�)1��m\0h��i\�\�P\r;\n\�\ZL\�:9�r)�K�_a4�<\�5)�=j\�!�,��)ȫ �R�Ȧ�<\�*֧\�\n�\"b��*�r��\�5\'��;Ҙ\�6\rr0�5\"\�G�\�*\�H\�(\Z*�{TA�q\�\��Ny��3d��\�b��J`Z��\�@\�4\�m\'��>R�#�N�\� g�ޤ�:\�r�(�jY\�\���S�\�1Cّ��1\�A\�\�\�\�#5�\�\�ִ\�G�3\��4Fx�Z�B��1Ҭ��)�~uD��y4��\�#\"�ZM��A@\'?{5/�\'��\Z\\�#=*��\�.ӑS-�\�qOY	\�F�`⥳ETxA=\�T�>�fY\0ɪ�9\�1J\�ↈ\\�OjL��I\�\�i�\�~t\�O)G�\�5�\�i\�m��3\�\�4\\\\��+�i-W�\�VWLe��\�\�;�\"�\�\�\�\r\��1\�\��R\�^K� \Z.6�ș\�;\n�\�japz\�ҹ\�Cڟ0�J\�qUȫ�Ȩ�\��\n9�\�B55rB���:Թ�\'4\nLR�*\\�HJw5\"y \�ȧ����Թ�W&�5lM?\�Q\�\���횖\�TJt�qS\�\�\�W\�K%��m¡�D�g=��\�X�#8x�Xy�HV)��\�C4�)��99�S�\�\�=2+\Z�1��ӎ4�Vl\�����)\�Q���8��4�)���m��/\�Ke!��\�0�y�\�i\rK)\�֓�.x\�/JE��\nQ�H\�\'4T3D!�\�q\�	��Q�\�\�$ӷ\0g���\�L g\�Ph��\�\�7T���*�\0O�)\\��\�N��\�lq֌�sQ1�\0\n�#D�\�0�q?7\�S	&��D�\�RBq�\�\�T���\�\'��M\�H3��Hy�BF:b��T\�v\Z~�\�?S��\�Fzpjn;c\'5=�\�u��U�w5\"�\'�~��4iꨱ\�\��f��T��UX�*\�>�kV�S\�\��.�emq$�\�gɄr�Z]��څ\�ςs��O��i#XÜ*�y\�W|�iY\�t\�JNȇ$�\�5�s7�\�\��\�M��`�\�Yż�)\0\�\�R<�\�#;3\�\�@U\�wq�L���a\�\� L�\���Їc��r\��.�I���wbjN)�\�\��T8��c&��\�K\��\��b�x\�ك\��\0J��{�\�\�Cz2�/\�#ֵ�*������+\�ko\\��}k�kJ/\�/�9&\�ph\�\�c@\�ڶ\�9�\�\r8�b;T|sN\�>��\ZA\����H?�Ji\�\�(lg�g4��4�I��\'n���L\'Ҧ\�\0�Fz��\�\��\�^���Ca9>��&\�\Zж\�sY󀺑�\�\\�ٝ[�T���=h\0�u}�\�I`w��Z��]ǥyug+�\Zsq�\�\�q\�)�\"\�6�gҲ$\�\���R/[\�d\�:\�u�Ts#�j\�\�3�\�\�)�P��X�z�^FΊF\����XI��&��$W��f\�\r�UQe\0\��:\�\�eb\���\��*\�j�4bw\���䨋�HPc\\/ b���\�J\�\�\�YR\�04a�L.~�)U���/\�\n.�\�3f8U�cQ\�gop�:��:9C&\�\�`Pf�!$�U���r���fc�v�<\�\r��Q\�}\0\�_�=jSq�,@��JJ�\���\�\�1�Ҟ\�6\����\�G=�hUA\\\�#5*\��>n��KK��\���[[32+d\�?�W�ƴ.\�ŏ��\�\�Aۼu��\�HL�\�i\�&m\�)��nT��A\�J�\�\�Uڹ�\�{З%�\0/��T\��ҝ�rVs��\"��?,V,h�Ǯkm\�\�r:���\�]�<���6\�j�\�ס�\�\�r00i޵\��C�\�G\\�v�\�$c�⎙\�hf;?ʙ�N\�p\�C֓	���\�I\�Zk4��\�\�R�]�\��\���K��Ni�r�\n@\�n+\�7p`=|❜c�Nw��C!�=G��6��O��?6�~_\�\�M�\�Pi\0����z��\�OlՈ8�\�\���\�#�jh\�}h BA#�qҪJ�\�9\�N8��\'�_�U�\���ϽQ�\�\�H\�#�|Srq�)�&\�\�\�\�=i+�:�\\{\�ąs�x\�*֟.ې	0$\�\�U]�;q\�S\�\�۔�ᏵaWc�\�Qz�Rv5�j\�/��r�aȭ[lӚ�\�\�}]�#UH�\0뚔9\Z����W\0+t!��\�jHp\��\�}��ǵwf�)�E\�N\�Ҍ\n6\�W֟<�\�\�\�\�9�\�j2\�_|TH�r� }������iJ\nd�q�\�|Q*��\�\�\�z\�%h�!<�Z�.�O��\�T*v\�\�\�Ё\�\�\�hB #\'<\�T6��\�\�]\�y��%\�=�c���=K\�f�?0�T\�\�+�L\�5�x8ڄ=�\�e͊��+}Ĺ\r\�\�dS\�\�x8�(\�\�t\�Q]�\�%\\{T�\0\�sQ\�wd2�[wC(���a\��\�R�G?wڜzq�h$q�\�)\0\�0I\�S\�$q߭&>cJ�<g�EMƉ�\�QS���縨7aAԑ\�n�,\�%�\03N\\�?�0�� ��j�\�(��\�M\�֔���R3��S\�\�sL<�K�,P&\�/���\nfO\0N\�pj�����i��\��U5 ^G\"�z❁R;\�O\�\�H�\�ҟ���Ah\\/��9�T�,`i\�\�SI\'����I\�\�\052�;\Z��֦F\0~5�e���rE;�}\�F(\�q�Hv#(28\"����-�Rc�zi����\�&\�\�u����h#\0�zw�����\n�zt4��Ab}�64D\�+GL_�\�\�x�\�\�t�M4�����3\�>-\�Bę8�|,C\�\�{�\�\���\n��rk\�l���\\�\�\�)��&����Lם\�T\�AP<䂠`zWK���dLH���۸��\�G���GzfM�q\�\�:��F\�C\�\�e\�d�	�$���\�j\�̦	y:\�\�[Ձ�\\�$�\���y,�\0Ê�ӷn\�w0{��es���\�O�\�\"��9�Lޡ��\03S{�ZZɔ&1OB8�=1M�Kd�\�L�>��2�\�z�CRg4\�+S&2�\\R㊣6\'J(\�Ni.1N���jЮ(T��0\n~*�+�(�����r28\���h=i�\�b��O\�h�\�3�Ɯ�\\sR\�P+�`�Zw�(X9��\ZpS֤\�����r3��8�\�B\�* \�*�CdL�y\�F_6��`�f��l��Ҭd63��<L�U\"\Z�jTlSq\�I�\�	��׹#�\��<\�~\��S�l椲\���\�\Z�4��F�U\�mydqȤ\�@�A���]��\�ڔ\r\�09�	\�jM��S��\�zn\���ة�`V�-!�<s�\n\n\�#���i\�9攃ǽ\"�(<\�N\��})\�I8���=\rdE�8^f\n�\�z\��RNj����\Z�9YP\�\��V6�\��F\�\nw�\�ߵ8�@ȧ���-��U\�\�\\\�U�L�i|�⡳UB�UB�\�\�3\�ڦ1d��<{G\�*�9�$ŉ\�CH�*1���\�\n\�gj�q�2�\�N3HrA��[�\�z\\d9\�8{\"$c�H#?�]\�M&Z\\\��E&�#�Da\'��\� T ��*y\�\�\�\�b�\�]�\��<�Q@ \�Q\�\�a���>Z�)\���S\�%Ӱ\�\�?�F\�҉�U[�|\�r��\�=\�\r!\���cR\�5\�h&�\�\�K�j�E1��\"�f���棘\�D��@\�Ji?�G�i擑��\��\�*\�\�ĩ \�<�����r4Q.��p%L�Q֖XJ�\�w/�����\"�\�=���b\�F����\�N$g�ץBNqP٤b)=(c�M\�{\Znq�\�X�h���S�8��\�j*ă=zSEG��L���bb\�j����٦���V$�\�!\�0=7>��.E$IN\��D�\0\���y<R\�-!\�i�\0\���\�f���4�-!��\�<\nh`\nw\\\�ܴ:�z�2��k\�㚖\�\�o5]�.I\�S�?��TvbI\�l\�!:\�L9��;M7��k9\�4�)\�\�\�38\�j.j�\�\�)�c�r�ƛ�9�\�\Zzb��;R\�\�4\�\��H2M!=��\�<v�\�@�=)	�?�)\�\�Q��\�@t:�1D�<��\�K\�nH\�\�p-^�,l��v/\�T,\�ݲЇ��UجjI*\�J#\0����U��D`���s\�Ho��Y�#s� z/ҩ�\\I�[�w\Z\ZD\�w\"\�\�\�_>�j\�\�,[\�F:�\�k�\�J�AV.�O��Î�g|�\�q��G&�\\s\�4�!t\�\�W�|+bZ\����$y\'q\�\�ҽ�წbqކ�c��yS\���\��\�s÷\�[zöȁ\�\��\����Mq+\��9#�\�\�G4\�[\\尹ǥ!�=(1Hy4�\ZB\�c�\�\�7�&�\�	\�\rqM\�\�N*n4���\���{\�3�W\��\�\�.\0�v�cC`ܬV���\Z�\��y�8rK}k>\�#RN:XK[�\�\�!���088�\�0�n˜�}렞\�;��8\�\�>\�M�\�a�2y��&\�\\�0\�c\ZV8K讚F|\�`���H�U~b���6��b	O��~5Ut�ewm�{�\�Q\�\�=Jx���b��\�\�\r�F\�Z�s\Z�ŗ��k�[\�n(9<\��N{(H<g\'8>���}�y\�<���\�\�aPıP;WG�\�\��YH݃��\�M�]\r�Np;U\�J\��D�\�R\��\��� ��*��q���<�\�Һk�:9�Oo\�I�\n\�AX=�\��E��5��:}�+>\�H�Q,N��\�9\��ӣ��O/�p�\�\�\�\�\��9\'�\�jށ4\�2r;\Z��m�%ڼn\�Wn\�^{u�)\n{\�M���M�q����\'�aH<\�e��6�{\�yt}���cv\�\nVіd\�c���Y��K���\���\�\�v<�QZ�6�,\�A�@\�Zd:-\�(�Ԣ�{\�\�Z�9\'+�qL\�8�]3�0��Al�z\�\�m��!9\'��\nr\�\��\�F\�B/\�5�io\�\'=G���ň�q,0=\'�a��ns�\��\�# �\Z\�T�۞�\�ƨ �9⟷p\�SR\'\Z\�\� #\��ݞ\r+\��T�GzІ\0\�\�($v>ԜOAI�\�zf�|\��A�R0y�` ��#\�\�ҜE.\�QHL�\�)��Ϡ���\'����U�ƃ\�I\�4\�At\�v=sI�\����!\�O\\ct�\�qF\0\�sM\��SD�\�nz\�4�q\�v2ix�)�yl\n�2#��:��n[#<~u3��4\�m\�\�\�Tf\�[\0�<�{Z�b\��?�⚮\�㨧�F@�p)2V\�\�00:�~�e㹋\�G\���Y9 \�z��\�G�|�v\��g�\�G\�L\�\�\�h[0x\�e�����|q��\�\�\�ѳ\��\��F\�x�\�N*�1\�ʬ\�9�И��i��\�\�q\�ڤ\�z{\�eU�\0�E$\Z�L���y\�ҏ��N\�zW\�	rx4\�<b����\�\nzb�\�5�\�>6v1�Jq�\�R\�\�Ų�3\�j��C�\��jE܀r3��\�kY��jH\�t�è\0f�0��t\��\'=�ڶd\�?|WmpW{�-���U�u�=�e\�Ջ�7\�L}\\䚌NA_]Erӊ�G縙sV�\�&\"�O◧\�Ӑ9\�#��<\�\���%\�ܒ2j}���\�\��ԡ20:��\�Hi��qSR�H\�F�.Ku�\�\\O5#T�\�UU\'�\0�z�n�\��\�\�AH�@�\�@F1Q�\�\�֗��&Z&\�\�S�\0ǽB�g\rRx�Id��:R�\�����P8\���\���=x�\0\�@m<`\�\0f��l� ��\n��񞴘.1O\0sL\���t5#��d��0{S�rh\Z��Ԝ\�x��Z�$�&Rd\�\�gb��P\�D��A\r;�4��:c�\�B�9\�\�i\�`������\r�*�\�~t�~>�\���c�\0\�\�i`i���PsO\�ڀH�٭�9O\�\\��VD�\Z޴S�!\�A����>,M!\�����W�Z^]�\\�Gc^��I\��e�\��/��i \�T��\�\�֤�\0\�\�;}X�,LY�I?���ۈf\'\�M��֢�wo?w�T�sJ\�\"��\0l	\0VT34yi��\�kH�\�r\�ҫ?\0b�FB�\�\�2;U\��\�w3,J\�Y	=M\'D�\�\�#\�S+A�lh�~)�b�\�N�\�H18�=)\��BFlZ:њ\\U�6\�`�Ni�\�Fj��ڒ����q@�RդKb�R�\�Sޘ*E�!�ةTSG4�Ubn&\04��\�R\�\\n9��1�:Ҏ�\�1��1�v�p��\\o~M;����p\�t��\�j�p#�U│iTc�\ni\�\"w�S��1�}i�\�S&\�˜S�H�\�BI��A-�c4\��\�Ƥ\��gj(�\�d�~�\0\0֍�\�\\�@\�\�dU<Rf<V��ݎ�T\�4\�={\�Cf\���%�\�j�/\�8\�\�}c�\'#�R*(aJ\�Vӊ��\���K�&���F�)\�NHT�\�2(��2\0\��3j�\�#8=�435?\�RY]�#5}\�b�ђI`R*�9� 	ր�/>�ՕPI�\�nzR�JsN*F�05&r��2�&�\�\�4\�\�\��l\�\�#dr3\�3;N;T�\Z*d>��\�\�<�i�P\�h��C�繥`[�(ڣ$sM,:\�Nf���\�4\���\'�?�J\�sY����\�F�\�y�\����\�\�\�M\'�\��F?d�tޢ\r�8\�H�\�ڠ`B\�4s�]0-\�=:\�eI\�R�Q�U)oܜ�{R\�fY\�ɚ�\\�9\�L�}�d)_*	\�zЦ\'L�F\��*V\�P�s\�R��ZT㊪���Nv\�8sG9�]�9���)Ҭ��\r#~j\\\�ِ��<u��\�cש5#�G\�P�9\�K�)@�\�\�Jx\�\�\�9WM d�)s\"��\�I��\�34��P�)��HMFM\'\"�Gx��\�4�&�H�\�)D~zsM$i)��5.F� M) \�%\�M3y砨l��I�5	9\��\�L�\�-\"^1L\�\�)��3\�E\�a}�A�7�Z)\\vZi�\�\0Sr*nRB�\�/\\\n�u��J\�{Q\�\�D҆\�\\�H�#����.\rM\�Hp\�\�4\�函0�Rl��\�;\Z��h�\�d�\�by\�8�4H�\�q��3R�\��z\�e��\�v\��a�s�M\�Ry\�f\�P\�����G~23Hǧo�%��q�\�Jy4ݴ6H\0sڌPzb��\�\0cژrp=�\�@4uri�6�]6\�U��J�wz`U\�¶�\�b*ϟ��!S�\�\����Ƶ�w�,�\�_���\�DY�~^���\�y��E\Z\�f�\�\�g3��$���\�繣@[�c��\�yAd*9\�0kv14l�Ƒ\�V$\���F9�	Ny~����y\n��p\��\�tib�\�\�\�a�\�0(L���\��Md�Ɯ\�� F)\\,\\F�\�_p\�\\\�\�x\�\��\��\�{\'\�s�\��֔�h�\�Տ�\�:\��\"\�l\�Z\�u������w���R�Mq1�\�\�\0\�<Rs�Rs�J\�\�%�\�Rt��w�\ZAI�S\��@\�ަ\�7$sޙ��ݜgT�\�T�5��\�R`u�\0㎸\�⋔7��4\���g��\�\�\�\��N��\�W\�\�\�P�\\_\�\�+�\�{�Ell�\�ylTP\�\�66�9�}���d���6S\�z�W�^��\�{8j*P�ڛ��\�\�21\�֣7Q���ڼ�\�o*\�ʤ��\���[f]Y�*����\��a�|��\�p�d�*`�a�s^h�r\�j��6\�8 \�͕�Ib�\�A&�T�K\�\�K2��\�MV�\�\���\�\\C_5ͻ3;cx\�\��5��P4R\�O�84��\�t�e�6�UynU�Ve\�\�aD����k\�I\�U�>����\ZQ�:\�fa�R�W�rC3ݩ�C�J�9�\�\��\�l][\n&�\"gI\'k�^B���_�z�\��\0�\'	�\��\�\rn\�;�Dnw0\�|\�reK�\�\'��G,\�!�Te�U�Xb�./\�E��(\�\�?Z.8R�҉G$\�͕ W4�%\�4l q\�\Z�v5\�<�F\�\�4\�*}\rG�%!A\�\�T��3\�r�\��%a\���[��P�Ș���Z\�Wg5jN17?�\�\�C��9\�	ɭa\�\re�\�\��\�\�\�+�cל\��q\�\0T\�H���\�$\�s�J\�\'$�\�\�ힴ�8���߯)@\�\"� A��	���9��\r�0W�\�ho4��MI�TMק�!w}iL\�\�n��l\�89=�\0*A\�8�؅cӃ��\0֧�`g5\���\�R3b�\'#\�H\��\��6s�\�\�\�<\�z\�!��0I4\�9\�\�S�-��\�\�3Cc\�\�5HBe��j`�4o�<\�z6\�\�M	�\�����X��\�\���ϧL\�Q\�\��5W!�H#\'w=����@8=�\����\�\�GjL��\�\0>�\��5X\� \\�\�=Z\0\�\�H��*-��縬�mOtu\�\�\�\�\"G!jZ��\�V&��e�lz\�\�zֵ�#���\�WV�>�+ӏ��\�0j\�LUXx\�I\�VA\�;W+gr�0A\�;�*o�2q\�M;�c\�V\�<Ru�)+�\�\ni���<�栓�@85!�\�N\�1�\�OB��\�%f�YE\�6&jk5۴�\0	���\�\��!��F0kv\�1\nGq^<���O^>\�%\�u\����օ\��V��8\�U[]�ӭG����pOC^�yEwh�qR\�\'\�3\�&o2\�\�wc��\�A\�Ue([x�\�Мu�\�Z�\�\�L��c�/]���\�*%\�!EJ��\�Y(z��)\�J�\�\��\�s@H$��h�K\�J�W�*%\�q�\0�\�\��qRR&:qN�\�qQ����ڤ{\�I��HHV����Q�^v�8\�I��I\�\�泥�р\0�\�})�\\���Ke�E\�\��\�4�����i��\�ߊr\\\���r\�w�3>�� L(\�\0S@\�E?��S���zpu�>�\�z\Z,\"L�jA����*AR\�q��vM3<�NҤi���I9\�B��O�q�L�\�W��TC��T�T3DǮ\�\09���8\�E��N�\�.I\�KE\r\�㚓�R��\�t�a�(\�)\�\�qQ�K��\�\Z,;�sN\�G�\\Ԃ�\�Jq\�G�6sAH��<q[�|�c�\�W?�\�����I�\� \�䨑�vg\�_fݬ?\�^\\�4r\rw\�6�ϫ\\�OA�+�!	9\�xW���4.\�\�1\�3}\�\�ǵZU\\�q֔*�E�ll;T�ޭ���E{m�:E\�����d�\�\�Fsެ# \�#EhyVaL�ROPj\�-�\�Kg\�-\�[�\�\�\�|\�4)R�\�ZoCA\�+	�M0�vM \�\��9�\�R��C\0i�\�t�w4l��\0֑2��M&?�+Ddؘ\��m<\n\�\�	�ь�r��Cc\�)í4c4Ψ��dc\"��^�\�W\�\�S�c4�X��)h��j�q0i)\�J]�Ѓ4\�\"���j���\��\�\�ӽ0�NE\�T�)츧�\r����I\�\�z�	��\�K/R�{Xg�,!V/�ޥP;Х�\�~j\�s��(�\�\0�5K 0<��$\\�q\�ЍX�b�ﰌ�\�Q\�c5\�i�w�6E哐1�Ԫ����P\0��*\r\"L��M;�\�PP�\�I��W6�& g=���#�FA��T�P3H\�۽\0�rs\�J%9&��\�Co~7h8�\�8\�@u*3P\�k�\n�U��a�\�G\�l�\�4P�\��0�\�\�SFn�.F��m�\�G�:�\�\�J��\�\�\�\�4\�D�zgړ?.j5\�\�C>��Ch\��SL\�\�\�8\�0*��\0��u\r�\"\�\�~��9�\�,2���\�{�\�\�4T�y�\�X�P�U\'�2Is��\�\'L�?JN5P\�\�y��^\�I��;�˒�\���d��1��9\�\�\�\�I!|����J\�\ny\�\�q{0\�\'�Fۗ<Ғ9��\�\�tʷ%\�=*K��$�歾\�qT�Uy\�9\�t\�%`sP6\�z��\�>���W\0)9�َ�\�\�=j \��v�\�x��\"��O0�\r\r�NOLqK�\���\�`g>\��&�\r\�\�/���\'j��\�⩇f�M��\�0r�3)=j#\'^\�m<��~)s��q\�3$�\�Q�\"�q��\�-D�y�[q>�\�x�\Z�2\�I2q�\�\�Mg\�\�Q�\�ȮR�l\�	95l�3֥Ȥ�	����D��\�M\�\�XSލ\�ޠ\rA4�5F\'��dQ����4�W( \�қ�Sw2ED}�\Z�\�H���z󚩾���֥�\���\�֞�\�Z�\�\'�zTܴ�!��\\b�\��i�����\�{���\�L\���;~f�pZk�?LQr\�Tz\�d\�iH\��5��\"�#+��\�S9R�8\�i�$p{Բ�\�\��j���� 1�\�R\�D@\�ry=�Њ>�y\�j�\�ӥ\�\�S�ܜ\�T`U��i\�s�:���1Oʂ��ٵ$\�Ҍr�s�\�d�71?v>=+f����P:�O\�X\�\��$�wZ`S�T(l�*7G۽���\�Ӭaps\����\�*Yh�3�u\'��6?Rڼ\�0��\�1�պ�\�b,�HO\�W���,\�\ny�Ȏ\�*Kri\�MiZ2�2�/�\�hL�a�@\r�\�^\��-\�$�\��m\�v�Z�TK\\]��3\�,\��h��ͬ�R!��pZ\�\�H`�Xޕ)Y8�y�9��\�o\�r8��Q��Fy�<\�҆ɰ�f�rj<�\�\�t��(~\�h\�r1MϨ��\��q\�\�{�I�)���N\�$\�㚇%�1O\\x��Ɔş5�\�\�\�v���]�\�T5��.2\�b�z����P\���$\�~��J�� �5\�D���sޥR��\�y�iE\�\��hU��I���\�\�\�Bs�SU��n\�,�@�8\�Ev�o\\\�X�r\��$OJ�\�$�R\�\�\�2n.9\��W-����h�\�o�F\��*���jr\�\�{\�\�\'\�\'��G�v=j\�[\\\�BH\�09\�;WKߊi��.�\�E\�-m�G�b^Y\�eDI��2s�q]!!q���ܤd\Z\Z&5\\u��oi$rT\�(\�\�G%͡B�zf�SI���XF\�\�b=,�1�8�Y!\"\��1��ni��9�	\�l\�纒Hp�H6}\�:\�[�}q�T\Z\�1\�*/-q֋\ZF�.\�Ǵ��$\��\'\'�\�_�\�So?Z��=3ڎ>\�H\�U.qң-\�&\�X�pElZ\��H\�2I\�j�^��!*\�=�\�\�\n\�\�Q�؏�O~��(?inն�r1ֱ.3\�x����MM[!�bT\���zՌ\rܜ�\n�r[�t�W�Mn�I\�!\�3\�Jv��A �Z\"�j2��\��\�X�\�4\��M \0���t�\�(搏zv$oP\0\�T�\'��\�I\�\Zv\�\�z��Ķ3\r�\�\�8��9R3B\�!�?^{\�)\�I\�?Z7�V\��\�;3zg���\�\�h�-�|Z�q�9\����l~\�c\�o 4\�R�\�n/\r�\�5f	\�\�~�\�c��{���H�7g\�5^FAԌT\�\�\�W�|\�pLP&Vu;�ϯ\�Q��!ʐ:v>�_�`q\�AG��d�>����\�\�\\c�J\�L�wg8#,�L`z��GF��Hbm0\�\����w\�\�s\�I;=0s\��+v	���^N!{\��|�I#~,sVԀ��ͅ�Q�W\�Ӝ\�=H���A�\�F\�?2<���\�ȩ\�V�<\�\�n�M\"ϥN8�Ә\�S>\�9Q\�8��g\���\Z�3\r��j\��ڥpYcr�Me7�p\���\�ڭ\�\� K�j\�t�\�9z�\�\\\�!{\��\�;p{z\�Q��\�\�+Ɏ�ZN\�\�\���\�d��O+H�|\��zܵ ;�\\��%+a\Z\�\�{8�U���<\�|�j����\�@�� �s���gf��G\�\�\r}Tv>[��SRd:���<�)��3Ϡ�%!��\�K��y\�J�s�\�j�h��@}\rH����R3���Qǭ&Z�N�\'CLC\��;�\\��b�b�qRrx�g4�1\�C)\n\�\�H�j?!o\�\�\�\�T\�\���?g<\�q������v3�\�SbOCLC�%�\�F6��H�!8��=i�z�\�*Fq\�R�aL\�^Ni�cҜ3\�\�$\�9@\�3�O5#v\�R��\Z杚Lhw�\�c�4�w5%�elu隕A\'\���V\��h�L�/�S\�ddw����Tذ\�\�J:\�%S#��8\'8��aܑ�4.9\�Ji_S�h(8�\�*\��<L	\�Ա�^\r!#\�L�~���\n�Ѳ���e�}+Z�b����Yh\�p�z֖�\0�$�\rCj札A�x��\0\�mq�s!\�\�޲DH\�$j\�Y�	܌1s�X�o\0\�Mm��|��ʃ�j��71�(��\�l\�\��!\��@�\�� =@\�N�7�y\�\�J�\0@��z\��`Qr\Z%�\�8\�>���\�4N\\\nn{S7�ZZ.\�c�\r 4SD6(4�\�$S�U#6K�\Z>R3Qc5 �2d�\�h\�M\�4\�\rkd\�\�;Ӱ)-hf\�\�Ԙ�)i�[�:R�G5D�(��v\�:ӅP�4�jJr\�Jar<R�4��h\�\�ҝ�v&;\�\�\�)\��L.\n*P�\�զ�qwn&��<f���\�!�\�\n�P�\�E}�P�MH\�p1L���ڔ\�\��i�y �v]��/\�P�O\�J��`�QaT�\ZBޔ�X�TpA��`.�:Յ\�\�5�\�LU�,PE\"≕T٩\�AnS9���\�;\�3x�UF:S�\����\0���1$U\�\0Pr)y�R\�Cf�\�\�@\0qҐ\�\"�dg�\�\�\�@^Ԝc�h\�K��P\�l�=FF�����K��\0�\�\\�>�VR��i��\�\�t���ӚGہ\�qQ������i�\�\�38��M�*\\\�U1\0\�Lv\\\�<Ԅ\�p*Fk	T7�1q�)\�Z*u攺\�zUS:c\�c)�1��d�\�S]c\�A�y�\��N;U7`\�==�\'P\�R&�HA�sޢ2�\�\�O֘uFI\'ڣ�n�&\�E4����\�d\�b�9��\�h\�\�7(p9���\�is���T[�\�\�Hc����^\���֙\�\�\�reN[���l�֎r0����\�۲}H�o�[�\�Sd�de��qQK!\'�\�u�:���j�\�t\�I	\�\�\�N!���꼑�\�M\'\"y<��U-��\�&䊬\�\�\�\� \�\�Hd\�\��\�IN\�\��4\��\��(�r�\�\'#�(�\�u�pQsI��i�lf��\�S\�Z�\�\��\�z\�1������\�qF\�v\�A\�����\�h \nBz\�Kq\�OW�p�̶)�\'5&i��T�aW4��I�s�^+�`\�~ԅ�w��~�܌f�\�a	\��TLi\�\Z`�Ɛ�\"g=\r&*�AI\ns�8\�H�\ZnSNZ�D�3�����\��\��O#�T\�\� ��\',0\rK��\�P�N>�\�]�q�\�i�\�T�\�}j�s�h�\�e�`�=qM9\�z\�\�\0\�\�sQ\�r})\�z�)��h(`lz\�\���\Zv\�\�4݌\�\�$��Rz�\n�\ZB�\�)�\�i\�N\�.)�\�\�5�\�\\\�\�V<A�\�[n\�Z��\�ϥ	�Ē�T�X��Z\��;�0�X\�\�y���\0t\�{�\�\�T�~\�z5U7\�$��Ry=\�YH�i40,��n\�\�Ґ��+l\�Nq\�j\� �-j\�5`]xt�`�I�s�{*xnh錩9\"���D��-eNN23\�6(��\�\�9?+-\r�$��\�v�{\�T�g��F\�\�\�\�y\�i6�ȁ=�W�|3�\�\�Y��A)^K�Y\��Y�~���j\��i�+�@G���Y�O��f*Δ�;11Ԝi��S��c�\�3���Zn*z��G�;�Ո��3\�\�Ґ	��:�TH\�\�Rs�\�֐s\�\�\"L⓯\�\'�c�^�AW+�p|�h\�\�S~cۥ!�Kȯ�5SQ\����i�)�ꭶ\�,7$�Մ��\r���D\����\�Y�e�\�w3eI*�\�O,gR+M�u!�^V!\�TV=�,`黖\�uk�pRS\'�U\Z\�\�\�d�r\�^�R����E\�\��\ny�\�ī�u!r\�8\�Y)H�\�ҥȴ[Ō\�m�\�������\�\�3��\�Si\�\�J~\�28<\�g�b|���\�}k[艅89I4�6b��2�(\�q\�l=�Fイ\�-��$re��:]N�%K$#\�c�lU)\�MXeޡq,�\�\n\��\����9��2�\�p��\�\�I�2\�卣�\�f��X^І8R84&ٜ\�k�\�48-Ӛ#ף�3��\�\�Q\\��\�YQ_z�@oZ\�0\\$\�T��c5<\�7��Go�.%\��\�\�ԍ��!��\��M.\�\�2\� \�\�ޱY 8\�$}kD\�F)\��j��nG Q�Nr��\��\\W=}\�p}��}\�I\�oS�H\�>)]ܿc[���n��+�ub85f\�V�\�aG,}F\�w\�doS\�z�~�\�D\�G*FZ�{�Q浊o�[�\�[\�ۊ|\Z\�ӈUd\�\�U�V�~n�u�+%\�\�\�q��-\�ʼ �tthI_N��nm\�sڵ\0\�\�񬻰\���\�êW\'6��� {z��\�O>��B\��\��N9\����\��\�\"�<�Z\"�x�\r(\�;Rd�\�CT��\�`����H>��\�\�\��3��1��\�=\�\�L��\0�*2�\�Ϡ�͎ܣ�\��\�\�\0:\0A��3\�\�M\��3\�zh�\'\n�x��\'#����4w>�\rQ!�cL\�\�ޜA>�\�H\�\��\��\�\r\�\���M\r�\��␘c\�1ڪJ[$�\�\0��\�g�\�y\"�˵��\\zS%�˱�\���4l�l�Jz�9��G\�\�Nz�\�(@\�}���[nG\'<�>�l\��@�D�+66��\�?ʡ�\�sWH�\�(z\�9���\"w\��gK�\r\�\�<�\rt���\�^^%j}]/v\�ū�9��8�Ϩ\�\nȶ�#\'\�Z�qܚ\�g��h�\�gnz��ԃ$q\�I )\��,�E�)���\�ސ�W\�3\��H�+T�e�\��ɭS�{W%♄\Zm\�\�ܡ�*�BF��\�J�\�L�����\��nw�\�\\N�쑖\��\�y���\�\�\�R�\�J��u\�.`c8�Ǹ1@��y�@�8\�;W��\�gk�b\�\n�&�\��h�9�\�\�Y�\�Ty\\}jQ��}}i#\�+��\�8}s�\0֯�G\�=�	\�\�H\�Q\�`#\0S\�t�2\�\�Fx�&��?/�\�@��@\�j�#-���f�͜T��\�\��/==O��H�H�����qLPq�>��d�KA�\�O���=O\��H\nG�\0Z�\�\�zg֥A����\�s\�z^NV�jP��zԖ�F\0\�(\�\�LP�Lu�M\n3O\���d\��T!\�f�;�g?�;��-\'�?�\�&��Ȥ\�F\�qHc�80#ך���E8dI��~�4��ޡ\�J9�-��\�O�j1�\r87\'\�����O\�i\�\nxړcH���c=�&��P\n85\�\���ӡ2�*\�\�\�@��b�{Ś�\\��E\�m\�W&.���)\'�Gn�\�b�S�Ԥ�e~\'�����1���ي\"\��\�^\'�p5bd3\�ȼ\�\�3��\�Qʿ\�\�\�Ϣ4��\0h�\�?,u\�\�\�V�?\�K\�\r�L�pXv��f�HQ$�p�Mܭi\����\�H�c+uS\�QV�LE���\�g\�{�-%n\�cu6�ydb\�P�5\�\�\�@ r*캓OtӿV<\�{���x\�z\�^2�\�.y9E�s\�x��\�\�T\��]4��e-\�ϽI�+\�5W<�R)㸯�\�?&�9[&� R���L`�F\��\�͡��R��o^;�Ӕm⋙4J	�\�稦�O g�͡\�\�8�\�S\0\�9�Tq\�4ћ�Z��\Z@9�FLn*dQ\�\"�\�H0Ej�؁9\"\�88`zSO�G\�9�Q�\"�u\�����Q�N\�)\�\�fb��JJwZh���i���V�\nJ\\�M\�*��q�\�\�0i���i9�u)oZ0iا�Ю�q^\�D�RFQ\������ŉ=M&8�\nE;	��)s�A\�*Ø�%����@�:yɡj`8@W_��f����V#�R=�6�e6F*0h\n�`��\�\�7c�٤\�\��L\�.;\�2`)뵔�T6k�����	�p}j\0A\�Y�?�\�f\�\��}=1Rs�h\�5d\�uB$��\�i?��T�t\�t�ۮ+)H\�n1\�>���bI4�\�&�r:0e/\r\�1�\0g�B\�\�R7�1�\�\0��ɥ<\n\�S:#L��\�c�\�4�櫸9$\�Nf\��U\�j/1O$\�m�N*����\�@��\�cOR���q�\�7�0\�U��ι*FjNՋ�ҩ�V8婤��L\�d\�.F�A\�<sN1����1Q\�px\�\�p��#NT\"��\0Jc���Jy\�\n\ZG5<\�\�D�!9��\�[҅�AК;様\\�eO�)\0��=3L\�\��\�%FI\�&�;�\r!}\�$w��\\�W���\�r\0�2:�\�je\�b�\�p!�s\�jC\"\�\�r�\rU�\�\�xR3���\�L\�\�#�S\r׊�D*pGJ�Fȧqr��`0)� <W\0\�V�pۅ!�C �\�U\��\03ǽLr÷¬3֙\r�\n£9\�&�&@@㚬�\��W3h�iS;�YhX\�XlҸXVq��Tl�y��a\�H-H��\�`T^��&��b�\�OJ2�(4�*\�|��<�\0\�iN)\�\�iD\�E3�I�\�X��\�8`)I8��\�S�\nh݊7d�z�����*<p*C�\\SvT\�cvpi�B�ML\�Z��Gz.;	�\��0)�@���\�)3�S�\\9\�(\�AhD#8\�RpO�4u튓H�=9�O>�Ԙ\����0\r����Q��Cg9\�Ji\�\����\�Te�x#4���g�\n0M0��Zi\�z\0i,)N�\0\�Px\���q@�?\�e�\\\�\r��\�/�\�5&�d	�\�d�\�Qdu\�\0\�\�sN\�=��I9���V!H\��7g �t��}�jnRC{�\��ht\�ޑi	�\n��\�O\'\�J\�$\'l\n:`Pw{�L�R\�v\0\�j�o��G�����\�5\�?�\�}\�#\�S7\�3Z\nա\�{��\�.�\�@1�1�\�����\�\�\\�*@\�g\"��wWZ��y\�)�y�^:Tf �5�g$�g���7��\�ǭAZ#\r9�{b���)j��Rcq\�KG^�����n\�S�LS��C@\�\���H)I��\�-�o<�U-g�\��\�[���D\�?\Z��&��\�\�v6[#I|X�V\�$���\�S7\"\�\�y\�\�j�������q^mYAJǫB3q�\�\�kx�\�\��a�\"0ѩ\�#��[\�x�j3�ZL�;\�w�\�V��˾X\0\01Ҡ6��\'\�>ޕ���l�C#>�iuKGp�@M	\�\�\�\�]˾LX\�E8�����5;Q\'�\�.�x�\�\�`rY�G\�N\�9*泶��tS�^�jQ[\n}(�h���\�U俴W��\�\��߭=��ck*\"�e�( \����\�{�VE<\�\�\�F�ZT\�\�g�\Z�����H+\\p\rH\�\�X��W{\�b\�\�W\'\�\�#d%\\U�~��쭝N\��Q6�\�F\�>�j9\�E\�+��\�C*��\�\nVA\�PlpG:�d���\�YG$\�\�\�hzs֟��M$K\�(K�ZKp\'#���\�(\�.����̣������(���1�\�\��|�q\��n�\�\�Z&TL��f\\�\�1��\0�t��eh4@ˇ�\nz`z\�\�ϵ����ӎ�\���g-\�\�A\�24\�.M;$��\Z\�q\�<�\�i?\n1��\�118<�zPq��8�\�M\r߽R%�\�\�\'ޤ�@q\�3�C�d1���)��qӵI��\�\�\0lf�63�QK�c�*��ہT�q��u\�\0�aN.��E~\�\�Wy8\�Қ\�l1\�;�~8\�FO_��5F\�b��$��V��\0\�\�8\�%�*)B�;���&T9%@}h}�R�\�ڤv\�\�\�` �9$ph#�21\�?\ns)ٌg�44�O��&�s\00s�¢F�%��\�\�яӤ��\��;m\�e��ֺ����\�k��{.z\�ٷB�\�j�Pk&\�!���d$�\�8\�^t�}�\�y\Zh�y\�5�\�\�L-\�CNq���\�\�3\�n�W\�iG�cF:�\n+�\��_]*Gvipy��\\C�\�A{\�\�\�!\�d�\�\�\�5\�\�\�N\�W5b��_�-ێ�\�Y\�8\�8�*+S��\�\�@9\�oŮe՝A\�c�cBJ�\r~A.�p{�-_�~Q>[:��Ew��28\�F\r�z�q\��v\�\0W���bd9\�N\�\"�\�qҤU5bH�\�=H`~���Zx楔�\��9\�FAb	\�H8 �1ґhz��S��?Zj)\�J��dq�p\�z\�`��d\�\�\�\�$#�@�0\�\�\r\0t�4,����ޫ�9\�JM��\��q�6��\r8b�@�u\�z~\�(ǥ.ph�*RsNA�ֆ\�\�E\�8S�\"�ǵ;8\�Z`\�i�@h\�A�,)��\�8��N�1\�\�50�j,dT�1\�K)�T�c\"�Ub�L�x�e�L��T\�i��qN\�C4C$dE\�AY7��B���n\�@�I\�y���\�\�\�qۓ�\\��J�����.��ث\�\rb6�3\�\��[T9�?�8\�^����S�f��&\�\�\�\�c3\n��wd~��d06�\�4ں�غ��:օ��\�O\�Me��WU�\�)k:;�`:��2\�\�%\��\\q̲I�v\'��\�\n3^�\�k\�n4\�+br0H\�\�崫(\�\n\�u\�D\�5�m\�\�i��K,�9��\�|55�CuqH\0��9��\�w\�_*A\�\'!{�\��$�3iFI�&�;��k9�q�U�W���\�I��e��\��ڼ\�\�W\�ak{Zi�\�~�\�>����w��&�\�L|���0f�sҺ��\r<\�\�=O�l�\�S� )�95fR�p\'� \�)�&;4�Ru��Flr�R���zԹ��Q�ڎ�F[�4\�{U�C�\�S�Q\�\�\��\�Zd8�dT�\�9\�H\Z�L\�I�qށM\�i㹪2aɧ\nN�U�M�\�(4�\��\�ai\�\�Y�f�1X�i�����R\�U\� 4��`уM8\n\\�RO\�V�e9H���Z`Y\rZTS8\�Y\��u�j\�I8�q��j܊��Fwd\� T�.\�FP1��\�H�DO\\�怙�D$ᛚ�JS �T7cE7�q�\�J��.N*��\�#���$\�-��X����:aF[��EpO�\�\�\�ڰ#�M\�]q\�k@Ku9���\�\�\Zo���6i\��9��ȭ#/aS0e�\�\�\�	2H\�\�\n`a��sN�F沔��@i!9=1۵P���\�\�Fr���_q\�׊��132 RO5��\�\�q��ln\�\�P:R�5���i����}sM>�+7#x��,O�&\�b��\Z�� ��K(5M\�i\�r{Ԟkc\0\�wN+)H\�0 `\�S=)\��g�a��8\��ɳd��\���Ձ8\r\���{\Z�˰\�̽*3��\�\�\�}i�\�P\�j$!;�x�\�X[f|e\�s\�\�\�\�DO$��r-@\�m\���Ǎ�\�94\�̽[�����Td�*\�բ3Q1�	�\�\�QL/�c���q\�\�P\�\"\�<�Q\�ʄJx\�{Ҙ\�j�#HԐïl\�YUq�3����ڠd��\����rZ\�\�8v\�DS�VA���@�D2\�<�{\�pO5S��&C�x\�\�&�*n\�qLt\0s߹�C*\�`�\���\rJc�\�j�Ό1L�	sU\�r��53�\�&\�\�	*��\�)@\0\�_J�M\nh(a�\�X?V�$��\�ث�8��\�\�E<�\�Ld9�@ȱCG��z�nq��\"=�3o&�$Sz\�\�\�d\'�M9\�I�i��	��\\�G$\ZQȩ�CFO R�y┞)��H�=@\��\�L89\�L\�p8���\�16���Iy���Mʰ�\�T�\�\�PR47_Zo#�;��f�\"\�\�>�\�aס�\�\�jaT\�4�#�!�֛�\ns>��94\�Gz\nCy�C\�;R\�M/ۊ7\'�jR�ڛ�	;O\'\0��t\��:\�:\ZQ\�(\0\�NjN@\�B�\�q\�z�׽4�8�\�<�5�� qN�\�\�\�wzB�T�P�f��)�M.09��y�c�O\"� `�i2И��i��\\T�[\"�zԔ(\�v��p�JN��&\�Exr�\r{�\�e>m\� �\�52�Y�/\�G\���Wc=��q6n�ɭ�Y�D�6�׌\�SVGmg\�\Z�\n�\Zkca�\'\�\�i���El�y_\�$�\�\�+DsH��)GLS�:��sȫ3�\�b�N4\�@��8\�\�N\�y�\�h\�.qF\�h\0�?�5WXϙ �\�ry��k\0��\�\�\'��d�7[\�䉗�X`ұ�%m\�)u<\�f�76�l�# �PXh�ls�s�\�\�k\�\�R��&�k	Z�\�9�\�(��e\�\�\�\�\�\r#�L*\�ֻ�tؤ,\�\�P�\">\�g\�z����Rh\�-VGY\�D�\n����Ⱥ�g\'\n1�+�Mˑ�LJ��b=*�H;g�j���2����\"\�\�U��Wq�n!uF\�\�]\�Y�A\�@��.\�\�\�ݸ\�J�eO�JZ�\�o��0\�\�ז��K\'�*\�ߊ�m�Y>F8=EY�\�\�/\���\�t0�h:��Ϥ�\�I\�\0l�ֵ�\�i!��\'ZӛD�A�V�aVm�Տf\��Pw4�&����͜2ʎ\�\�\�+��Cy��.\�\�\��\�v\��ŗ�\�\reK�\�]����T\�\�\�ׂ���;\�<=�Rj(�\'\�zf��\�\Zű�I\�]X\�\�8\��Y\�~\�wOC)�V��g���e}�\��Wu\�I=\�tq\�J\�\r�EV�Л�)c�\'�&�n�PZ;\�\�I\Z9 �ǵP��\� %8+\�ZP\�1Z\'.H\�\0\�7\�\�.eM&\�\�\Zvv1S��\�Ռ)n.\�4,�/\�t1��\"��D\�ъ�\�G=\�y�h\�qɮ��\��\n���%�?�5*\�=��!F*`\��ڻbxr�~� �\�O\�ҟ��\�V�ɱvF�\�~���\�M1�j\'�G�(ܴ\�#�\�{\�\���Ȥ8\�Zp\nNz~D�lv���\�I\�\0~�ђz�4/�1�B�3N�R\�攁ߞ)�\�(\�yS\�u�>�\�;�w\�Gɖ\�\�րNGQӃQ�\�\0?�=�<q\�\�H��1\�3A-aʂx=*rG>�\��\�B��{\�[s��FMU\�dnUH$\�M \�\��\�)\�`s��v@\0t2Dq����z�k�4���I���\�\0sӮ}\rK*\"�+20�Eu�K���+�f%��\�\�Sj���qC\�\�\�iPc5�NG=\�\�\�[1{W�#\�\�N4\�@\0\�\�mϦ*M�Xf�\�zӛ\0i�ȯ�>td�;�ȯ%�k�ڍ�M\�\�\rz�\�\�<ה\��\�d�{~��,K��:��\�Et�v�yWSc.ܮ01Y�$Hj\�\�~\�jƒ��G{�.\��x\�x5\�	o�8\�\�\Z�MK�vR>z)\�_?��ؓ��\�k\�2��C\�s\�>���P�;S���E\�\�ڜ���v�l��e\�(#ӊC&\���\r�\�MXq\�\�ޗ\��緰�\�\��\�͜�9�e�C�r6\�я\���\�b�\0>\�,�8sߊ\\�\�)�\�K�b�c�3\��\�!�J^O�\0����\�3y#�vX�8\�\0H�\0}�Lg�@����S\r\�I�\�\�=8\�\�O}i@���\�\�zc�\"�O\�\�H?\�O\0\�\0ǭ8n\�\�\Z0�\0\0/�1ސ\0i�nq\�8t\�ӓ֓q\�8��+�\"�\���֥��I\�2�#9�Fq�VFEK-\r�\�L��GZ�=\�\�3׌\�2Ǟ1���gڤ�S�$���1\�z�P\�G!�jR\�\��\0�\�-[P���+�ח�=3\\_�le��p��|\�k7\�\��<=N�RٽO\'\�/\Z�\�\�n泽\�ִ�\�=�9\�z\�\�\�\�J�ס���A8\�`��V\�V�\��p8�jlu#�Mr�Ko�H���U\�+W�	\Z9B\�\\�\Z\�Q�\�[�V\�\�\�dz\��g�I\�l��*{)\�@\�#)5�C\�5��D^\�A\\�ZGs\n\������\�\�R��\��+\���+�|\�b��X�ZP\�\�\�^zI��pƽ��N�^�\�\�SMs\�In\�HTț�����ax\�{W���n\���)\0\�z�8*6\�#�j�\��\�\�\�\'\"�]ة�Z�b\�\�<dR�����\01N\�4b�8�L��=��/�<�Q\� J\�o��\0\�T�\Zj\�8lLD\�c͇��2sڲ%\�\��\���\�\�}+�\�\�\�5+HZ�g���\�#\��=C�{K�vI�[���\�6\�d^zןy`�\�ޛ�Pr3\�%�\�]�e\�x9l\�g�[\�\�8M_S\�׍�\�\���>ǚ\�t\�K	pK/@\�\�C3�v��\�x�\���P�?�^�� A��e[_Ct2�U�\��\�Bq�M4\�>F�\n��\�8�\�n�g4��\�4\�=j��s%NO�c�6��S\��>�l752=\�hGv�a��=�\'\�\�;\�n\�s\�{\�Vco���ONx�-F\�s����!��ˀErK3�Z\���ڣ\�xڴ\�\��\�\��\0FjU5\�i\�\"�_l\���1]�D:\�s]�14���\�<�v[��\�*���kT\����Q<ukD۱ێ\�Q����L�II�$\�\�:UpW,*\�ݤ�Q�\�\�s���\�\�\�qS�z\Z��\�\�	����X\�,A\�qYNV6��K0�e\��=\�|aA��]\�zW5\�Mz\�\�\�\�GX��\�e��\'��\�fg\'\'\nN\�=d}�O\�T�#[��WP\�\�o]���\�!\�\�=�(]8;��}A��\�/$]\�&e>�5�e\�\�ט+Bv�\�\�N��\�)6ϲ���J�\�(�\�v�\�ݬ\�(��^~bMz��\�;+\�3���8ִ7\�\�Q�{W0Aۚ֎6�\'����ܣ\r�^�9f��[�\�\�\'�Bd櫞p �\�W�x7\�\�TX\\�F\����\�\���n�\"5�̏�\�\�j`\�s^��44އ�P��QO\r�>�R��\0��RǠ4ȤI2\�\�\�^ب�1{\n\�R:a�e4d�v\�c�d\�А�\�ap*r����?�f٬Q)l\��YߌPҌf�y��7#U@riZM�ޘN\0\�3ڣ�ɳu\"B�@9�v\�2\�Tc��\�E(n��\�,�\�\�f����\"\����\��P\�E�\0S�rM*H�\�\�_\�-�hܧ\�Ph�K(\'=[4�&O|\�0̽�h�ڡ���b\�ϭ#g\0c�7�\�	�\�N*\�+d񚅲OZh\�Dn@���\Z��j3V�X\�b\�oo�E(E7�4\�y�\�;��B����@u���n<�rj�,S�y\�G5Rd.f�3/q\�G&p8�\�T�\�[��\�i��M�Q�\0���\��\�׭Q�#�\�P3��\�Z�F\\\�w\�\�\�Xɰ-�z\�P��O<\�\��\�$\�UNOl\�EȤ+\�\Z�I�\�\'\��\�Nj;OPh\�+?^i�\�*�rsң!\�#\�\�O	�\�\�\�i�\�psN݌)�攮֕��\�e\�ri�\�K\�a�4�8\�.\�M��\�\"���ڞG9���*\�\�SԚn�7P85%Fi��\�\�i�\�\Z\n@\�u�\�1\��\�A��\r&1��)3��Jw˴H��R)d�R�\�\�K\�\0R�sI�X�����`b�\�\�\�AaRhG�\�5)�w�Ǹ��\�\��\�\0B\��\�[ӥ4�\�j\nC)0S\�\�?\Zv8\�p(\ZG>�SH�\��3�AV\�CO\��\�v\�z\Za:�Q׽(S\�A�i\0w�d\�)^8�\�4���}���\�R�\��w\"�\�\�Q�C)\"2h#&�$TY\�I��\�ҙ�\�n)#\Z&�\�\�4��\�\�I�۟ǵ{\�ڏ�d�je�J_Ň�\��oݑ\�X�09��]�#\�5��֊	\�_I�<\�1�n�1Q\�kds9\r\'RzsJ\0\��\���Iڗ\�\r4\�\�\�:{\�OJ\'��ڨ��uϨ�#4⦓�A#N/�P\�\�\��Ha3j��\�tJI\�Մ��V֡y��\�/9�\�GSK��\�V�B�Wq�\�҆\�@,I5��\�s\�Vg]�\�j:q@�\�持XX\�Le:�ɠ�E�ش�ɢ��JCޝ�L{P+�\�h�\�S\�_JB*�O0\�zC\�;�zLp(�s\r#�5g��\'!SsE������\'�{�Z~\�8�aЊ,\��8\0�)�H\�N\�:SK\�qV�o�\��f_��*\�nq\�s\Z��>z\"\�(nõmrV��#᰹\�\��\�X\�<sS��A��\�\�b:r�8#�/NEZ$L�&3\��=���gɻ�<Rq\�ڝ���B\�3Қ2=3�Rl\�ҜI\�^��vޝ\�5�,��\��0/ ��H�\� *9#�E31�?\\\nr����ۀ\�\�G ��ƀ�\�\���\�HFs�\�Mn�\�\�\�`0\�Fv���>ni\n\�`��\�+�[ r3Q�\n�r}\�\�S\�`y#���f\�{w����2~n��f\�Ig	�9\�\'\�j\0�W8\�QD��9玄\�d�NOZ�T\�\� \0\�98\�JL��N\�����\����H\�\�0B�	>����%�\'�䯳=\\�F\��s[�rs��;\�Ejy\�^L�>�\"\��)\��b�\�q\�A���׭0ez�*F9\�~T�ǵ}[>|�p˴��)�E�\�\�W\�*�5\�m�2;Ҽ�Gcs\�[\�~�\�#8\�\\�l��vz\n&$Q��t\�tvc����\�t91�)@&\�~ q�9\��F\�\�2��h�\�=!\��^9|Ă:W\�e��\�}\�|~w+֊\�P܃�S�\n\�S\�{枈� �r\rzǄ q�\r<��5\Z\�8\�9��\��\0�T����\�I�h�p2sQ��瞕*�ÎƤ��\�	�;-\�\�\�8��rI^JC`��L�܆R\�Q`\�\�\�`\��Ԁ\�\�(9 u\�i�>��_�@\�K�<\�\n\���v\'\0�\�EH9\�ڢ��Ӄ�3RR&r84�����\01�\�\\�\n&\�\�\Z�0{\nqݟLP�\�(\�AQ\�&�\���\01M)Ê��\�)�\�\�\�\�Qpҧ\0\�A�{��x\�%S\��a@<\�Xt��\r\�K,�y\'Ӛ�8\�UԎߍJI\�楔1؜\�ܸ\�v�5l�<s޲��P�\�j[�\�:�ЗQ	\�3ީ_9\��d\�\�mBW��]V\�\�Aی\�\�c\�\�VG\�\�ԕ*l�k�[\�\�\�@px\�Vk�\'Sq�\�+\�mot�[\��1\'\\\Zٹ�\�/a(ѫ)W�*w>Ύ=ӌc˥�	�\�n1FT\�P\�wI��q^\�e�i�\�v\�j\�kK\"�~�&n�(+>}�\�.g!U	$����S�J�תG�\�%ə\0>��çH��\�Z�g<ŷ\�x����T9��\�&�M\��KJ�&+�\�Q\�z�׉-�\�\"��\�sSA\���IP\�(\�D<}F��h\�Ӯd�ҶI�\�W�kv2Y\�Ȯ�e��	\�\�1�C\�+��g�>\�d\0�k\��\��U�{�\��\�Ҕ��軤x&\�*D?yH\�5��\�4r/\�0i�W\�\'s�i��\��\'\��:)@�\�@l���\��K�dw�s��ӷ��Lɢn)ÑQi�\�\���\�X\�\�ӳڠ���\�4�;&]*\\�H\�\�n��Pz���ZD�v�>��r�O&X\�U�[Q�$���W6}\�[���\�\�{�?d�O\\��cEv�\�%����u\Z_�\�\��\0ǳ\\��\�)��\�,<\�\���W��Z�\�H���\�\�a�@�EY4�@\r	j\�׉԰5;�\�yv�eEVgd#\�Ҿ�\����3r���^+\�/M�\�^6/l\�B�f\�aW:K]Q��_\�<ף\�ͽ9l�׏BJ>\�r\ruj�[\���j����`�w����Q�\�	B\�KC��\�a�BI����̏�N�\rUh\�\�frsڥ���e\r\Zn\�\\R\�c�\�vO����\r\�V}\�\�\�\�NIy�\\ЎO\\�+s��MAc�\�85]���^P\�u\��\�\�qQQVQ����\�֒��\�Ѻ0!�b+\����pN���[�\�F\�\�a\�\�\� \�C\�\"�3%ҋ\�{n�\�=m\��\0�nl�F\\��I�@kLk\�M�\�J�!\\c�oZ�g�\�#209��׊\�-u�E\�WΈp�\�qׄ\�:c+\�}O+4\�\�3	:ikk\�\��9�2j�2\�Ea\�FEX\r_]	)$���֦\�7�ӳ9\�R�85#\��\Z�\�\�!�d`S�[�7yn;T���^�\�ti�9��0?�X�nq��\�ijV`-�f$W\�a[�(aF/�Is\�\Z\�|At ���\�F+\�dw7,{�\�x9�*tڧk��\�c*��S�Z<\�2J(ݲ\�/5K����9\�{G�>٢�\�#HXg\�\�$c�\�y\�6V�W\�V�މ��`�p���\�j\�\�Ze������gРۓ�\�-� rh{n+��z~\�+d�*\�<#c}l\�,y$W�x��O����㷜W\�1*�\��\�,�6\����QŜ��<\'\r�>-_:7\�V\��oЯ��OIw��Ǯ+\��_�\r+S�\'\�K%[�eқ�n\�ܝȾ\�L%w\n�_I\'�\�\�j\r\�ާ�\�\�\�h@\�qWϵR�ǖ\0\�\�T��r+\�\���e�\�\� a����C\�1�T6mX,:Tl\�{��ŷLTNY�\��l\�(�C\�Z���x\�Q�\�m���;`\��5Y.���\�:\�\�~��\�l��\�R6P$\�\�*UN)p�Vw4�\r@��j�.3U�=)\\J���\n\\�\��Ҕ�{�ϲ�\��M\�6\�<\�u�\�\�1 �E\�㊖Ze�\��\�³\��\�Ok�R9\�R\�/h\'r�����:ЀL�U\�\�V1ޘFy�3e~wv�\�EY#����h͑�FG�zTg\0\�Kǽ7y^ԧb�@^y\�T�\�|�i�r3O%Xb��(<��3lq��EBX\��\�\ny<\Z��Ϧj�3la\0\�?\r�R\�ӭC�Lɋ�T2?�)X�\�֣\���B«s�\�V$u\\{b��8\�&��ȃ\���K$۲1M�i�ޑDE�O4���SX�\�(sK�\�\�\�M>�o\�j&3I���\�s��4\r\r%@\�(.s��\�)���\�\�%!\'8� �7S*Yhx9\�Mq@�8=rjHF\0��\��)X^>�\�N9\�HvsI�x�枌FpzԀ\�g�jQ�j\0枌jYq$���{\�}�v��@�n�pH��\�G~jA�9�\�҂\�@\��J��¬>9�\�U<\��M~\�~�޴����&\�3$��ߚ@={юFx�9=\�Ezc֢\��qy��\�li\�\�1H~^��σ�Sr\�92\\`{Rn���^P���Q���\Z\\\�~\�B���ևl\�2(�+�\\\�Ӌc\�*>��&�\�q$8\�J:\�.p%��i��N8�!�(�I\�g�GJ�\�c}���׻�+�\�{�>�\��n��v�Mոny?���\�\�(�\0>��\�\�w�=1Y+ȭ�`�\0�Ʊ\�Jt�lG\�:�4s�8\�[\�o\"�sG\"�\Z	�T\�1֓\"�cI\�\�\���\'�h\�#t\�3��?4ӌ�N\�0\�{f�M\� #^%�5[Y\�l\�\�յ8�\�媚\��p8Ȥ�$7�3ò��\�\�q]���9\�\�\�\�\�J\�+r���MK\�z���\�X\����1\"�����W�Gf]*��Mx^��X\�\Z;]3\�F\��W/\�-R7v�g׊\�;�e\��pJ�\�]�k\�~(j�8/\n�Ӹ��/���\�x�\���4�G�\�&��~5\�\�1\��\0�&]\�ں�.VdA\�E��)���I�$\�54�J\�)�\'5V\'�oOaI\�.\�SHH\�Zd�0�\�\�N<�Q�杅\��	\�-��T`�:\�\�\'�^?)7pr)�\�=M&ᴜ���\\\�l�¹]B飻T�n\�=�]˷���V�\��0�u\�MtS�9+OCq�z\�\'����}\rB�_z�}ޢ�\�z\�z�R�ӎ�lN{T��\�ޚ8 f�م\�{g0\�ޚ\�;��\'���\�:�i�\�\0\�i�\0c�s\���q�Ͻ)\�#�c��@G�\�p\0)\�I\�jq �\�irFsM�� :�\�\�@\���W#�1N\��\�\���\��5RH\����x㞔�\�\0S��G\�q�\����\���$u�\�G��#<\�H�y\�zcr\�{����y\ZiRA��\��\\\'�J�\�$�=I\�\�ޥ���\�\�MВ8\"����q]�P3�\�\���\�S�wpq�n\r\r��q\�\�\�JEĉ\��9\�zװ�0�\�nMdM&@\�xح\r5�1�9\'�#�+��ǣ�v�:(ZR�]�m\�z�\\\�9\0r+iVBF8漉\�}E\'x�]q\�9:�0?\Z�r*\�~Z�c\�\�sMb@\�\'8���\�}[>z;�\���V8#s^_\�$2\�\�:�\�d?��C\�dh�nOD=���\�b�\�f\0\�Ǩ�5\�b��\�\�g�@���WGh�^x\"�\�EKq�\�I����\�3��ܬ�(v�+���\�\�z�\�b�\'>��!*��s_K�V�6\������\�,.Gy�n/\�L\�\�\0�i:�k\�G�\��\�׭M�~�\Z�O�\rJ�*\�$�\'8�F\���󊈒0\0\�j\�{�qޡ��+��\r&S7g*J�%F<�f�	$R�\�Ҕg�\08�\�Zn�zS�\��t�4NO��\�sT^\�G�\�\�F\�3�1J\���\�m=��Q�Er)\�;E�c��략�g�Y\�\�V	\�c�\�\�?Njy�\�\�E�:��T��*�\�6{T\�ð�\�8m\�\�Ӛ_ƣ\���\�)�>�ԟ7|\�I�	�板�r\�	=\0�KW�E�����:\n�\�Wa�c�yW��\��v\�k\�۟�[I[3��V���n�ul\�w �\�\�4ontu}Ok�6{�\'5b5^�\�\�49�\n&\'�x�\�\�[��lE:>@\����U!-��tjGx�uJ��Tv�\��G�P\�4e�g4s �*��Oߑ���iw��,5�\�z\�<Ex��ʯ�F+���*kϵ%}F\�cQ�\\ؚѥM��xL4�֊K���i�IL�I\�\�Mt���V\�`gr\�\�-\�ӽc\�\�CR\�w\�J�s�g\�t!\ZP�\�4m\Zk\�Lɰ�\�w0\�\���8\���gMT,v\�u\"�_x�J�7\"��b�\�gg���Dt)�@_Pj�\�F�Ī��\"\��K}�N\�\�3G�\�+���}(�����\�\��,�ه�m\�*\�\�VWq�`<lx\�Et�Č�\�5�u��5X|w��\�y��\�\�>$\�c1^[�\�@p\�~`M\�T����\0\�vht\�}B�~q_>Y���\�\��\�j�\�\�=\�\��(Y<f3opO!ԌW�j��z��j\�\�c?-\\#w�3��QV����/\�K{�����u�5\��\�Ō\�=\r|I\�o˥ܨv\�y���ֵ��l�3Wg>x\�W<\�ƞ1\�\�1&�+\�A+\�+\�GOK\�X79+�<Mᩴ�̱��\�$\�t�S�M*rz�g\�g�d�\'��\��k��ƀMO��V�&H\�ߥz�Gɸ6\0O5 C\�\�W���79��|C\�O\�\�+7u	�{sR\�Anѽ<z�݃k����8\��Rx\�öeV-1\�˶*��1�\�ҲI���$��~?Y��Ư&\�Z\�f}\�\�S�D\�Ξ_�\��\0xb�t\�\�\�J0\'k*��(�I��W�Z�\�W2H-�`ֽ����j9\'\�5�c\Z�\�y\�+��հ�fv9\�S��\�V�*v>�ITqOc��׆m�X̃q�^\�t\�6a@Q\�\\v�whB�\�v\0ǥz&��Tp\���\�wg�\�+EX�\�F�\�U�D\�WBw�\�\�(ű�M��\�jP*��x׊\�\"x�c�OJ�\�Q�R\�^3\�c��\�\�Fu\�pgΗ(�F\�֬\�&\��\��p�#�\�M/\���kԽ�\�9�X}��$\�.\�\�5\�&�*D	�V�����	S�k\�lt�¬S\\5k�;#\�\�\�\�#w�\�\�\�!f�H=�T�4�4n�y�\�^��0>QU.�D9%y\�a\�$o*Pg�k~\�\�\�#\�<qǥy�\�\�A�5�����\��+\�ﴋ���܃�+��w�g\r|,wH����Φ�\�rMvZ\�\�\���W\�<\�y����*Q\���݋�\�uMn�\�q~�L��\�EvhA���O�\r���\���\�1�ed\�u�$4\�hlq\�F+�\�be`jBT:UP{S�\�\�$��\�S\�\�b\�T��l\��*[4�9_�m:oa\�y\Zs0㩯\\�-\'\�\�\ZdF\�P�0>�\n�\\\�ں\�?N\�|��=�>��R� \��nղ�^S\�\�U�$t\n\�>˩�\�\�T{��\�=O\�)�X�w�����k���\� m�+㸭\�\�*.mf\�\Z��|\�\0\n\�/���R7��\��;t�\�\�F����\�\\\�\����@8\�h�\�M\�\�\��:x��i\��f�\�\��<Z��Kb���F��HQr�>ls^-\�]\��:��\�Q����\�Գ^L�qt\�[�z\�2�#����\r\�d��K�\�nX}E}g\�\�\�\�\�t\�(���9\�\���w6Ҙd\���qQd\�s��N5\r�E	�{\�\��\�4\�\�Y9\�$�ߎ*<\�\�q����l\�\�_9�\�G�	4�:T�$\�1ҕ�D9\'4�҄��O�d\\[A#�$���>�I�;V�\n\�\�\\�p;\�m%vLc*�I+���P�\�m\�H\�4\����\0@��h\��\�\0\��\�\�:�ۥ\'h��ڲ+�u_Cء���s\��;g�\�\��#?Z\��\'�c\�\�1\�>���\�t�\�=�I�V�y�\���ϵv�2�\�+\���\�=/\�\Z��Q4\�)��\�\�\�֑�\�歁\�\�&{���+G\�\�uh\�1+ї��C[��\0\�Ll\�&IŴ՚\�ߞ�\'\\qM>�FL��\Zn�H�GLPC!`3Q	\���[Ga\�j=�\'\�T�\�]�\\\�\�*jb�rOJ��\�Y�*\�6�C�5.\�\�*�\���\�}MU\�\�l�A\�qP@\'?Z�[�Ӑk:\�\��\�О{Q̑>\�Odh�)\�=i7`\�\Z�\�\��D\�\�uJ�\\ezg�\nI�\�\�n���\�9����\�\�H\�\�~�֍��w\'���ݓPɌ�)	+��B��s@�[\'�2��\�\�\"��\0\�ӽi��\��SE8�J1��SN2jS�uzT�\�ʏ\�T��D\��f�\\\\\����\��҅L�¹Y\�21\r���:V��z|�-ǜd\�A��)@eL��\�>�\�\�.��j=�M^__�7\�6��k�:\�\�3+^\�\�\'�@\'��5R,ʦ�5yD�?��\�L\�O��5M��ؕ}��ӯz�q\�\��jY�>Qߎ\�\\\nG#�g��\�㸥cD:l1U�GJ��*\"A4DD��\0\Zp\'Z\�ݩ;��i$�\�Ҕ���	����5��!��\�/OjǓQv%c\�\\\�)99�\�θa\�\�\���B�\�_JȒ\�F\�[�\�̃ך�\�7xBߕf\�v\�ä�#37�yG;�YM6\����\��S\Z\�`>\�{�S\�\�[����Q�ğSW��I0;�Y^[\�A�S:�V��裣n�*r}\�\�\�mn��О=+T\�9��C\�P3N2x��\���\�G\�R�I��\�x�Ni0CNH���\�Ҝ@\�ք\����P^\�\�_	\�y�\�\���\�\����\�\�\�2�\�\�$��l\�i\'�\�\�%>��[\Z\�|\��5�\�:	�}f-%/ь֨\�ciz\Z\0���H�\�R�I�\�\0�b���{\����H@ǽ;܌P\"���wcRw\�\�b-\�\�-q\�l��\n2Ϟ�4\�.�I5\�3�5\��\������泔�\�\�\�un��wĒ\�|�+\��k�vgb\�wS\�!~�A��\�\���\�\�F�R���|ӭ0O��\�.ҵ&\��^qA݌\�;�֘G9\�@X��m�^\'*á��\�\�ֲr\�*���kΏ��1Mne:|\�\�\�~\'��5d�bpA\�\�Z\�\�6N\0\�\�\�^\�\�\�Y�DV\0q��R���*�-�׌WDTZ\��\�NM6uO�]!��n	\�\�Y�#�Y>��q\�\r]\�\��\�2j(�\�L.M�\�\�Yv\'��:_\�[�\0�4�u\'gҐ\�`�\�{m�C�j�\0�r��S_\�:�3�u\nE��\���\r�\��y9\�\�T\'Z�`}�n:���<Gx\�m�s݆*#�\��e�cYw\�\�\Z\�\��\�B3\�qN�\�\��M���s�(�\�@1B��ER�Y�q�B\�Yv\�sB\�Z�p\r�\�UF�\�%�8Pc�s��k\�W�x�{B\�\Z�n\�J�̩\�VF*�o�1T�v]\\\�\�\'��G�\"$��C�AO_\�8;�����S�Db\�\�v\�0�ȂA�c�\�qڭ�`��\�#�f\�\�D�r^�\�j)\�1�q֤v�8 ����4\�\�\�\��x�1\�\07o҃��\�y\"�q�;rj����4\�ax.\�=�7�\���\0*a�;u�u\�\�i\�94�[8�\��C0/Z^�\�\r\'\'##4��j�$���lu�a{�qHx?�*@c=�ښJ�b�*\'\0x��9�S���ҫ��\�Z�n\�9<\Zb���2\����@\�(\'�0H錊�6Vl\�\'�=��!\�}1J\�\�zKT{�\��H\�Ӛ�f\���rz�i@aԌ�ޔ\�ǯO\�R��\�\�w�Z�p9 w\�]Ӊ˨�ǩ��Cr�8=:\�\�/���C�\rs\��Y݇\�h\�`l6+~\�Ϩ�v\'Ac[\�`\�/`b���\�>�\�lF��j\�\�2~��F\�>�uNO���Γ\�:\�0\�;��2B1�s_V\��\�\�\�<S9�L�<c�7G�}��a�,8ɮ�ƥN�c \�Vm�,vȟ\�QҼ�\��J��\�N\\*/�u1%s�z���\�]*!	\�\�\�\�\�=^���\�Q�\�\�rUz}k��m\�\�I\�\�|\�bN#�+\0/\�k\�0�\�!\�|.=�b�?\����\0\�ښܚ�c*\�߽!\\g&�\�8l	\�*tRI\�z�UA���Ҩ\�\�=�1N\�$Lx��L��Ͻ5s��9�R��\�\�\�Dr�\��\Z�\�F*y1<w��;�h$�jor\�l.~\���*�\�\��\�36�M&\�9Gj\�5�Zi\�K�\�ӌ\��Wⅱ�j8-_=j��Σ3��3�5\�\��\�\�Y�,�/�\�\�o�|I��\�[m\�\�u\�mn\��=Ԁ��`7ӓ^%L]j�Y�\�(\�0����.6�z\�o�����X�ԯ\�X\�B95fϵ<dX�Y3:}�?���|N׬]D҉\�\�!�\�z���F\���y޽+\�\��\�\'t}\�H\�(\�kSk[�\�⭗a\���\��\�\�t��:2��C�jҟ\��߀<e\�8����60Ol׾\�\�D1\�\�\"��5\�Z<\��\�N\Zxy���,�8\�S�\�c��?J�\�9��<�N�t�d!�H8\�l䒻g+n\�5\���M��l7S�_9��_�V�9$�zg���k7z�\�o��\�k \'�k\�\�cW\�\"}.T�9\�/Ș6A==\��\�>�n\�\�\�_�\n\�:4��\�yg�=\�\�4$a\�Z\�:ơa �	�z5[}\��\�=*\�.cښ�g��\�\�\�\��\0�\�![}LoBxq\�W�Zj0^�\�\��*¾\\B\��l��O�O��t���Z\'nc>ޞ�߇\�8��^/.RNT՟c\� M#�\0\�\�Tl/b���x�q�*��\�F)���\�xF\�[M,5I\�PKRˢ\�\�\�I\'���\�$9c���2��r[���:ƫ��38W\�\�1�3\�p�ZxZi���?[\�!\�c\'p�����nzUmV�Q��c�\'�\�V\Zh\�w�UVrނ���\�\�Vc[\�ii��ծ�\�\�H��U���\�\�\�@�+;�d�\�S\�t�mה�z\�\�6�[�v\��kG���/h�\�zǄ�eI%\�^�o�Ī6�\n\��\�j��X�薰y�\n+̓m�\�8FV(�\0gF5�scJ\�P�ςz�X��j�SG�x���3*l���\�+\�\��\��\�)�ezz\Z����فR���H�\�b.�,3�+jS\�\�*���\�\\�\�;׷|>�3\�K3��My\r\�٥*xe$銛L�{Yуt\"��R9�7}�ct��\r��z��\r�G\"���:�\�\�\"��\�5\�(1�\�TΦ�R\Z����<G���9eɌ�j\�/5!\Z��ҽk\�N�t2H\�#\�\�$�\'<\�tq54�\��Ǖa�y5/�Z[�\�l����+v\r\�\�\�+O\\��\�a*\�=Y\�R¾_v:\��9\�i%N\�W�?�7`\0q�k:\�\�!�b3K\�\��4�\Zk\�r%lr*H�\�Lf�]$�x��ʛL�&\'���T�g\�\Z\�,\�<�f��D�F��޼*�\�\�a\'\\�E}\�[ȯmS���+\�ǣ�QM�]/4�,,�:�p\\�\�\�1ŶKWp��x�\������\n8>�����k�W��6\�Q�uP\�$\�o#�+�\�u�H\��3��\�+=�\�o�����\�q\�sw�q8m�Hx\�ּ\�^i\�:O��8q^��\0pӋ�s�����{W\r\�hP9l�����s�\n\��l�\�9^2q^�\��\�\�\0~b0}+��X%�+ ɯKҴ����Ƙ\�\�\�ܱɄ�y�z\���Z\��\�n�W�]Z\�D�Tu\�5\�Ze͛��8\"���=��\�\�d�A\�\'�6}>=�\"�\�:\�Mu!حt0\�\�j\�]��I�Q�S\�##��S\�f�9*Tםk K�F\�r\�\rY�WG�x�N�i��U����i�Ü׹x\�&X<\�0\�5\��\�>�\�З54xX�rՑ\�xjM��}+����W�\�n\�\�+\�m~\�}VY\'\�l~g\�K�x�ȩJ�ئ�E��{׫s\�\�6���@��~\�(lj$]�\�)C��\��FP=:ӷ��#\�j9��bY\�t��R\�\�8\�J�{oO����\�R$�\�\�F\�í��8�tn��\\�6�lob\�H��\0x\Z�<\�\�5\�g\��64g��JӍOx\�45eV9\�<Su}\\\�\�mʿ*>\�\�VtA�\��\� 8��r?F��\�Ce%�(��\�@	\'%�����\�hA��>Rnj\�Gw��l\�F\�\ri\��<c�\�\�xoJ�G[�a�$-Y[�YvKǣV��\�6A<\�4�8�b\�V\"\0�6\�\�hv��o\'ڡ�wg�\�w:\�(��ǵy~�����\\\��˕�Grx��\�H\�\���9>��/b�|m�l◿�s\�R[i6\�)%�Rkm��}5\'jq�?3\��\�\�����\�I��\�\�\�\�4\�a�*\�b�58\n�14�\�6\�\�M�~4�T[�N\�1XɝC\�$\�i�O\"�Ph\�\�I\�<w��\'ښD6\r\�+�\�,	yX|\�D\�̥�K�\�\�\n�I�+��;�\�o$��\�@+\��sz`Ӽ�<\��~��\r�5\�]\�\�z\�}%\�\�-�؈�\�E\�U��\�=+���\�\�jx\�H##�֑h�G4\�j\\g\��\r�\�N��A1r rq\�i\�G�}�9a��T��\�a\�\�Y$Ѣs<�:lc��Oj\�\'~S\�\�h�Qo�;b}*	�\�\�\�\0ϭO�A5�S\��6\�ܹ\�Gz\�<VǑ�)�#��\�\�&1A\r�\�\�֚W�\�\�Rނy\�ZD2\'<VV�ӈ\\D��V���zc�\�5M]�y�SC\�:\���&��J��I$a���\�Ddy��N����Vi�ݹ\�>��y+O>P�\0<\�C��t\�G�\�3\�Nk̯�\�[�Q�˕F�\�s1\\^̲,r?8Z��k���\�׳\�h6ѠU�\0\�<sWWF��\�}+�\�On:�_#ßN\��.J�;\�\�g\�M\"c�f��\�\�+�\�|3>b�F\��Qn��\\�\�ۛɣ�:��\�aL���a�^��J\�\�`\�\��s\�:Q�n�\�B�\�ݞ&\'I\�Q\��X�A�dӀ��c~8�C\�>V��D 1�J�\�\�t|�#:3q��KӑG&�!@\�kC���\�L\�w����@\�T`�iO\\SFI�7Ja\�sOȨ�ON��a\�{��s\�#���1V\�\�@\�sZ���5�Y�	C\�\�#>{�\�f$\����u��\�9\�C��5\�6�>��#�V21A\'M?�\�Fr�76�:�ZrI$L\n\rF)?ƨ�AI��f\�\�@z\�Y�� F$WWl\�HчBkxM�\�\�a�]\�4�\�ӑy\��S����O~kc��̛�0OCP:�?�c�{\�7��\�C� �ɨX�q֥\�$\�D�3R7TL}ϽI\��j6\\w\�A\�ޓ4�\"f\�*ý�؁��?ε��[�<\�\�+93��0S\�F�ߓ�\�})��N2�YD\�,{FAzųӄN�L\�I���zW}k�\�\��\�Elia��Mv\�p\0�ȫ^R���l4!y�\0�,��t�)$қk?��u�M\\���kL+5RH\��<cP\�bt\�a\�ԁ��纵�[>x=+\�{\�8\�}�\�x�\0�lcF,u\�7.V\�+0\��C�)|A\\Vʹ�\�\r\�b�sV�\�i+^�Y�u`n%~���\�ڤ\�=9��8$�2	����\�i�����M!\�3Sd5C��H�8u�\�	\�I�\\�Mx^���\0�H=\��/\�\�5�L}�SYEk\�.��\��ڪ�\�k_\��P\r(��\n\�0=(\�(=\�\�t�\�!\�E\�a(4��\�\'zLS��v#>��\���)Q\�5�:\Z\�/\�;�k�O&H8 _2_\�\�\\�\�~c_@x\�M�v=NM|\�.w�\��U�S\�\�G\�d9\�z�Lri\�\�\�RG�Q�d\�hؕ��\�mYh���\"b	\�H\�v\�\�\��\�C�\�5\�6�1\'\�\�\�\�WLM�QGe,\'2NL�x<s \�ʈ*\��LJ7_��i\��\�I\"�k5^\�\�x��θ\�)v>��\�RaT�\�+��\�kw\��\�\�ї6( ��7V\�bec�{z�x�}L\�\�\�f\�\�&��K+��[�k\�\�_\�$a�{\Z���\�[NSv~oʽ\�\�1\��W�F\\\��\�tyd����@lt\�j\n�c�\�T�\�\�~\�ۧ��\�$�\�8����8\�ҙ�q\��\�\�)��\�ʌ��R:�Gj\n��ǵ2H\�b^�\�\�~ojB��j\0\�\�:E����\" E��by\�LR\�*��\��f4\�8\�k[FQ�\�l\�\�A����3�\�\�\�1^\�\�*VGP�\����{)#�G@H\�&\�\0\\v\�Jq��N*R�\��\�\�4\��=(��|��\�\�ց\�$���\�\'\�K\��ژ�Fs���Jv9�jF�zV\��w`�=Za\�N]�\�\�p9\�sE\�@O8\��K`֗9#�$g�\r2lFI\����GZ\n�\�ڂ^O����zfӻ�\�qK�\�\�R`\��q�@��\n\�z\�\r;�9\�M\�?A-�3��z*��\��\�\�4Tm\�\��1\��\�w<1ϧ���R@\�\�zh\�\�1\�>���B�Fp\0\�*RK\���◑\��\�@\�\'9\�l��6�\�qߊ�\�\�;�<�x�e�H\�3\�4\�T�~�\�a=�\�GI#���߹�\�nq�g�V$�[�H<וYj}6\�\�}r{����A\��y gӚ�M`u�\�}\��I\0Ҍ\0ME#8�Oc\�\�\�4��PDܗpEV�\�ʌ���\r;ň\�\�Y\�0\�ǹ⤆;o�+ʪ\�U��-)�Ɯ�d~\"�Bq\�ai\�g�n\�X-\�߀溩��*\�Fx~�)�S��\�݊����w�\�\'\�.䓨f&���=+\�h�X%\�]�Ք��\�*��rx4\�\�=�\�L�x\�#<҄��p��0�,\0>\��*ˢ \0\�9��\07# �b|q�I�H��8\\�ԙ#�>�\�(�\�L\�5�I򣪍>i\ra�&�@\�\�ҰQ���vAǮk\ZU:+\�QCOȽq\\7��o�[��28�\�\�]�\�8�k��}��$\'檯YR�\�rҠ\�U�;�\���Z[��r\�\0�+�\�֥H��z�t�\�]\�8���*9I��g\�Ѡ�\�1�\�#�\�H�8�m��u�rFC\�7�_�0qN�\�\�5:�\�ܜSD�\�Ƥ���\�`qS�\�R�m�r*\��O�\�\�W^1޾��N�.�b#�\�F\���\�E\�@\�^\���\�\�\�7d\�\�gk\�y��5:-�G�]Nc�����~ \��\�P�xȯh\�\�D6��퓚�C\�׍u�\���]x\�\�4�\��0=�&\�h\�b�\�i\�\�<\��~�f.�\�\���#I*Î���d}}\Z.MhXӴRBap8��\r`z��WIa���\�+��\�\�\��\�\�\�{��X�A�>s��\�QI�\�p\n�Q^\�4u*8\�j��h\�v�\��\�=�	�D\�\�W#�\�\�\��\�<�_D^i�\��\\6��+D�Q�WN���\�Z�Z+�;\�\�\�n-2w�\0	=+\��\�iq$�-ּ/\�\�mAW��\�`�m\�s�$\�L�\�I+�С7++�\�\�\�[\�͞��^#\�mbMB\�F$g�5\�x�Z <q��}k����>�x�nA9$\�n�\�\�\�\�1\Zr��ܷ\�\nM�̙N8>دfM\�O��\�r�\�li�u��n�\�\0#�\�Z�p7F\��څ>D|\�z\��>G����\�\�\Z$*�e\�s\�u�7�syɓ�kR\�I[F\�W�xY�Q��g\�\�JU(��D��zp\�dǭv�}ϑ���#t�q|1��\�x�\�\�洕R\���\�W�\��1�\�=\�NFx�b�\�\�2\�$�\�\�$!W��J�\����G4�7��_\���o=3\�\Z\�5=1-��y \�r\�Ґ|�*�\�sZ�Km(hMh\�z�v>~�4Q��]N2k\�ѧp�9�C�C\Z���%T�\�Z7~\Z�\�m�\��v�>\�\�FQvG��S�e4�E?j-�_Ds�t9\�\�\�\�YI,���+_/LΧp\�\�wZ��\�5���\�W^�N\�X<j�qo\�\�Y��\�> 1\�#O7r(\�3XWh�\�R�w���iϱ�\�\\\�$\�\�\�R���7�]=��\�k��\�P/\�\��\"\�\0+���G\0�\��g��`�8v\�m\����kR�\�a>\\��\�\�Jr�\'ڹ}Z\�00~j�\�E\����^��I\�S!OZ\�/�m�\�ھ�\�l��\�r=k\�u�f���U\'\"�(U��\�\�\�Ty\�\�\��zO���~A�\��s^gwp�o\\��w�Q8Sߨ���\�\�\�V\'\�\��\�\0O\\c5-\���D�?]�\"p\�)<{V�����\�Oq^{G�b��\�#ʐI�1|\�r9ED\�۪��\�Z��(6y=il&C��ĭ\�p�\�żN�\�1�\n�]{Q���`\n��S�0�\�s$~j�\�g�\�Tbۺ8\�Ԃ��1!�\����\�,DǑ���e\�,\�RFL�\�kC��մV�l�]v�b�\0F\0�(��-\�hB1W���/\�t\�h7�8\�g�j\�\�.t\�\��\�H�<u\�I�\0Ս\�\�0Q�#kS\�Vze��$\n�0\�;��3E�\Z\�\�.\�KM��\�ݽ\�Ȏ*I-R�݁P\�\�&\rն�\�{\�\�\�m!\�FEbj\�(��G����k��`\�<\�$DF2z��\�L�>[30\��S&)�#\�\�i�\�i�\n�\�k�B�;\�\�z����\�\�\�s�\����t�_\�D\�8\��\n����g&�5\�}�\�\Zb��\nO|Wp1ҸEPXwWyn0��}v[/u��\�(�ui�\"\�|\�S��\"�\�50\n{ׯ\�|w(�5>Lx#��\n��Mi~L�\�R��&f\�\�:b�3�\�����~I4�\�r6�J\�}�\�\�8$qW|�%͜�U�E�\�\n�1\�\��\0\�S&|F}k\�.\�KM[|�jHI\���\�\��\�o\�X�B�\�\�I+\��s÷A�� \�8&���\�\���\�\�\�\�$f@�\�\�\�K�A�J�I��h�k\rQT�-�f�\�\�Ӹ�5l|����j\�\�m+\�\n��\��(ڠs\�gs�#Zh[$;�d>\�5\�\�__\�I�\'��+r\�Y~\��\�c�I��~\"�&	Fq�\�|\�\�#q�\�[���\�<hN@\�ֽ�\�Z�Y\�\�J\�L�בxj\�n\�2�&\��x\�va)�\�3�G���E�yqF�tP1SUC��R�^�vG�\�\�M�,�\�\�\�GjhaI�\"`\�4�\�T�U�dg����d\�m�E+\�Y�w\�L4�\�5�\�\�;\"enK�5[�J�M4�\�KE��\n\�D\�R8�5\�.2*�\���k�\"bHMiˡ�����\�\�\�\�A\�QIǹ�I\�\�5n�V�\�$$�\0�\�\�q�\�?:�*>i�}N΄#\�\�4\"oCR�f^�\�\�-\�F/��TгX�+�y\�f\�ԙ�kff�R�\�6me�3�\�2~����������Y:�\�q;O+����T3T�9愬a\��n�\�\�\��U\�\\��\n\�Ѵ�f\�9C�\��ޢ�)E���o��/\��\�T��\�\�XJ�\�1�\\��u$	\�3]w�1��1R\�&�����X觇�~��\�I�&�rA=�H�\�zv>U���aaNɦ\�\�.8��=�7�1T�\r���.�(�\��x�\0�^o�\�\�RTbb��]w��L2O(?8@�=۸�?W�dD�\�+�&��{+��9\�t\�҅\���\�!Ezō�\�ʨ\�\�s^�H��\�J\�\� B\�^+\�3s�>�F4\�.\�V[��p1R��㈕\��\�\�)ꤌV���\�\�(\�2\�\�\Z\'\�+*�\�P@��\�z\�\���=Tט��׿^\��L�s^C�ٵ�\�0\�F\�?���5G�\�\�\�_\Z��Q\�\�\�NEuv�e�Ep�LQ��J\�\�}�.䌚��>/7�T�\���i\�=\�<�k�6\�\"\����\�\�8��?\Zn\�d�\r֙ޝ\��b&1�q�Q�\�;{\n�\�\�\"��X���ԡ=�N�FyHoJ\�.�,q�q\\����~j\�\�H����E�\n���\�H\�\�Ib�iV<�<W�hz\0tu�םV����\�\�\�Y\�P�l�U\��\��\�Wf\�W�\�\�V�#�[)�ۅP�k�\�;#ЎX\�\��ݼ+��6 #��m\�g\�R�z�Wӏ�\"����7\�Z@h\��\��ǥ\\1WvdU˜U\�sö\�\0�kWN������kiH�r:Ux$*��H\�w�\�x�\�\�-x$�\�1N\0�VYv.;u\�ެF\�a\�uE�5Jv\'=9�\�`M\�\�N})\�\�=�\�Ţ�$Ɠ�y�[n:c֡e�>ԉ�<�銁��1R�95<\�f�Ey�Ԛ\�\�s]$�\�5\�Ɍ��\�X\���\�Y�\���\�<[z\�?J\�\�Ȯ\�\�3\���\�g>��\�U���\�\�Ǟ�Q\�\Z\\D\"�\�v�n\�\�j\�\�%Q�\��\�s�]\�;\0X��\�ϥ�\�\�Kx�\�U���k�\�P��2ۄ%��cK�>�`\0+ͼC����78\��k\��;��E\�A\�\�\��r\�\�Tc<U\�n2L²S��\��\\�� \�-\�\�+���a��^�\�\�t\�\�\�Ӓ�S>GIJ,\�Q��o��˝å4�y�Џ*A���i�\�s\�L\�ROZ�&�\�}�B���\�u�⁀8�y�P�\�\\d�Ƽ.EÐ��?:�υ۾\�/}��[K\�G�j\�,�k$V��\�&cY89��Ƶ~!h\�E\�5�0b\�\�\�8\�!�sG�\���Ȥ�0���B�I��\�\�1Uq\\R�\Z@h�ϵ\'J��\�<z\�\�\�\�2OA�+\�\�en\�5}C\�\�O�i\�\�|\��vP���\�\�~<�kB\�jι�!wv5��@&��\�\�O�s\�Z3�\n�G�\���=x\�g�4a�zW=gk�g��ۇNI�$$�\��^��\��\�\�\�Z9\�\�/\�S:$�m��Y4�>\'89\�3\�]\r�l�\���kR�y&�-[V�B\�wώA�\��`r>a�\�f\�,\�Sy=�*�Z\�;�dx\�*M&\���^�\�k\�:�FI\�`\�+���D\�#n+\�|`\��k\�\�c�{V|�cK\�z<E�:S\�\�P�(=+�\�F\�{�4\�:\��*A�\0�����\�\�L=pLM2�M\��\���H\\p�?zU\��qN\�:R8\�3\�S�\��{ҕ\�G~)�\'�\�ژ{񜚓x]Ğx���d��\�\�*�&  7C҆~\�� �b�${\�jB\�=8⍤�lThGs��\Z�\'\�)br}EF@\�\�g�/^i6\���\�\�\�\�̐\�\�]�=\�~��?M#\'�\�E\�0mo^)��\�9�v�@\��1�(\�1���w�Zi\�g�\�7`�p;i�jb�\ZT���iC��ʞ\�)U@\'�LP\"&\�<`g�a\�^\�\��\0\�O#��F��n(�(\�~�\�\�\�N��\�u\�i6��)\�M`��D\�9�$��S�rip\�ڝ\�h\�}�\��\�E�@\'ӡ#�j}\�>Q\��\�>`z\�U\�Z!�҄\�G�\�z`gq\�M$Ȥ�\�v\�PƑ,X\�C\��_L�\�\�?�\�:4`H!s׎��R��\�Y@\�\�V;)-��1��O�[s�װ\�a\��\�:V��x�2�\�\�\�_�oł�`q�:\�h���S�9 \�r>�b\0\�t�\�|��j�\��\�[����[O5\�\�I�\�LQZ�\�bWِA�U�<k.�s�<&2}\�5\�[F<\���\�^[֫�=�4u��2x�5gW��p�\Z�\�</\�U��I�m\�;+�����<�K�9�&xdJ�c\��\�y\�\�\�M�s�\�A\�\��#=\�飱�\�@{g�(9�AϷ�.H\�x�\�����V� �$\�\��\�\�q\�OJ���>�\�6\�\"Y\n�ĚʥH�]�R�*�\�\Z�����ʱb?.qDR�ʮA���\n\�\�\�\�\�)h�\�ᰲ��G=}�Af[88\�cO\�\"\�c�T�ߚ�\�7�\�~=\��M\r�.z�c�5��	\�ue�\�]D%�����ׂ�\�\�r�\�p�g�\�ڽ\��U�ā\�xG�<Bu	\�mݎ�ËĹ\�\�nԻ8\�3M2L8\�5\�Z>�0�\0d\��\'���\�yc}\�@}+Ɯ�g\�Q��\�\�����b<�yω<qm%�\0v<W�闖S�é\�\��m\�*AsJ3qZQ�\���\�8v\�\���*E�/U�5�����j@Έ\"�g��\�W\��杨\�R�s�e����TRG�R��́<j\�Q�z��Kw2�\�\�\�F\r81\�=+D̬tIp�N�\�·\�\�*x\��}+\�D�����\��r\�\�@�\�\�\�f5i{H8�G�x�Xh\�HV�e\�\�\�\�|\�\�=}k\�;\�*-B\�ZF$0\�\�V\�m-nw\�1\� t�\�b�F,TS\�vC\�:G�8+ش�;jd�z\�<1�}+\�b�]�ȯ&�\�g\�Q��I�.�WIe�Zn\n�8\�rn�h���\����\�ʘ��4��\�PO��<�\�Cr�A#+����a�\��-[\�&؀5LM�1�\�x�[UXϵu����\��W�j� ��VDq�\��Q���I$q�s�\Z��NNx�A�\�V;vfx\�yt2�/y\�9���,�P��\�}*.G�V�*i��F�\0��-�W��_D�K�S\�a\�\\O��?�m̋\��\�\�^���b��\rG�7#\�q\�\�\�́S��\�D�\�=�*v\�t\�Tt\�\�)�g\�kH\�\�c���T:�i\�i<G3���\�\�\�\�\Z3�-Ԏk\�s4\�V}�\�:(�a.ݫ�$��p=+Z\��$X<�Xfd�A��W��>�\Z�ohvHA5z\�ʄ)˨\�Y�dB0D\\�*��\���$3^x!ks n}+ȼK1Vd=�\�&�S����y�\�U$g&�ڜ����\r1iT��+Ś�(\�\�2\�\�g��,\�\�d�3 ��\\����ᦓ8=+�E��=�\�f��Ə$^�&dݎ\�\�%ylnĀ�1\�+\\tϸ�`�[�Q\rzuax5��\�Y/2+O�jP�\r\�{�+�:\Z\�lt\�m6́\�upj1Z)h\�\0>b+­���\�.Ji�=7L�Ч#ڻK8P漫D\�\��mY\��\0u�k����D\�B:\�J\�k\�밂,g�\�`\�8��R�8W���n�7I�\�F�\0\�=Q	Y���8׋��=\�&~^+\�5�s��4�D	<\r��}�:N\�&�y\�\��uʘ�R3�\��VA\�Rr�g\���\�ą8\'��\�4��J��\�wΤm�\�ѥ5$\��=�J�]ޣ\"�\r=��fG85\��n\�.\�V3\�\'WS��\\\�I0O5\�{�b��zb�w�X9�\�i\�Kw\���it\�\�#g�\�5�@Z\�UH46�l\�<E�\"C(/���X�\�.\�\�\���\�[$����a\�\��Qeh-����N7g\�\�9��=�\��\\�,�l����mр b�P\�i�\�\�	\�\�\�_GxSX\��+�\�q�=�Gm�w#\�<Vsn�W�<��L��cS�޴\�\0UE�B\�\�$\�=Ԉ��#�8�m%Â�6N\�m�C&y\��\Z:	0pq\\^�\�I\�o\�\�\0\�\�\�yν��ᑁ\�AM\�e\'ʮ\�y}��}�NA�\�G�B\�D�\�H20=s:�\�	�\�c\�\�I\�\�~���\��[��f�\�4�O\'�\�F\�R�\�\�qJqp�͝�W���]�>P�v�\�y��\�y�<\�jىk\�r\�n~uİ|\�ߩ��\rI��>\�H�zT�ϭz\�\�\�(���\�34o\�K�j�S��U���\nj�&�r6Q\�&9R{\Z\���-��2\�\�۱$�\�>�Y\�1\�ʞ�rEq⒕9z�Z\�E9/\�0|1�>��)\�\�\�}A�^	cI�\�_*=��<\�Q�1\�\�\�\�u���,�吨;+\�qiFg\�4\�R�]��\�R|\�A�T	a������l@\'k{\��}�Yx��;�\�Y\�\�6$�\rLy(ܒ8\�D��18l�v�OR���D\�9\�s:�\��\�k�n�K�\�l\�8��k{_0�\�\�ZÓJ�\�ĳ�[�\�A�\�^��\\\�8�g��|uRM��\�\�\�+OMC\����zW>fĬ:\�d\�e\�\"��\�ZW)\"P[5&j\0s\��N#=*�\'V\��\�\"a�\�qO\�ӽ$�\�oB`sO_Z��R\n\�11�\�sڜ�*0}\�q��\�D\�\�f\�\�\\ǈ�Xl\'n2�k�,�^y\�ivX�\�u\�{�\�����\�zq\�$y\"��I�L���v\�S����qZ\�ĒRN\��\�\Z���,e\"�z3�}�X�ς/���\\?���zp��c�{\�\�XC$�\�!��\0�Z���OS\�\�\�*I)8>S�\��N�\'\�%(�\�q\�z\�\�\�\�%��Tt��R�\�E�AwH\�Tw<���b��bǨ�9W��=x`��\�\�πc�P�̧�\�ak\�cC�Xd30\�ļ\��5\���}m,i#FX�y+��W�\����X/\Z���}�\"bTm�&\�]\�\�\\*]\�L\�\�a�t�\r��3(,rǖ9&��e5��h]MOu\���>\�[��0Pp�3�Q�M\��S�T�\�5*����>��\��+{��8\�˃N\"��N2MNkڱ�M���\�\�\�R\�\�!b�)��\�#)�_Z8惊�\�y׌\�� f�\�*\�\�n��Sð.}u5\��\�\�g��0J�ǎ��/Bk��Ԩ|`��>�\�ct��>�%�5\�nf{$6�$qEm�T-]%��c!U2�c\�k�\���H\�r���J\�w��\�\r>uH�d0xSZ�uE>Udk�1��%c��F��n\�0v����Ҵ\n����1\\$�\�[k6\�\�a/q3�\��V:b\�\�Oq�FU=k/P\�l<��2 u\�*��w{߷H�\�\�B;#r8��y�ͣ\�,h����I\r�e{eg(\�+q\�y��aa,����z���\�(!rs�\�\�+\�<I.�,R�cJ��e�\�\�>4pcU�;���\�m0\�\��)Af\0z�]��{!�0\0��\�#\�3�.X�\�؊o^N\�d\�\�Ϛ{\r�ḣ�~*�&:\�v9��:\�T�Btjlg�F\�⡛\��ԋ\�05\�7+Ѵ\�[mCR�\�U\�\��W�\�\��-��A)Tj�12Jv>�+�覑�\��q�\�uʧN;\�\�q,j�n�q>\�\�ӢA�\�ybz�h�`W���\�#\�0T=�5u�4\�V �Z�e�nq��lJ��l��\�z(ù�\�A\\ƥ��\�&�k���\�.�-\�;�KC\��I�9g�.�g�k\�\�\�<9\�W�\�vۭ��xE\�~\\\�\0\�z\n����g\���ʌa;��iB	ۼ�{֝��N@\�l\�3��kz\�a\0\�פ���b\�2�\�gi8\��\�3�t\�Ws�Do\��\�%�H��;�\�4\�0I\�L��@\\z\�d�ޤ\�\�0y\"�\�\0\�k���q\��\�d�9<`u��\�\�<s�\�u*�I\�\�X\����>\�\�zׇ,; \�NXW�\�6�n��/\��{\'�aͺ�=1^v.MF\�\�e��\�^]v\�L}��꥘*\�\�W��\�z\�̶\�K\'-�kz\�|\�!�\'�*[/\ni:<SX~k~I$��o�wVjƼ_�\�U�Tdj5vI^\��l\�\�����G)u\�-\"\�\�\�	ZL\���T&��\�~\�rA\�G5\�]�GJ��K\�cc2�9\��H�e\�-\��c\\5]\�e\�7{\�ǔ��Nԅ\\v녋D\�\���x!�\"�s\\�8U\�OC\�z�&�ok�C\�\�ֻ�\�%u�vxY�59�g�h\�q\�G\�\�&s�jL�u�M1!\0��\�<K�\��SzS��Q@��\0\�1M\�\0\nx\�x4\�\�d�I<�\r{�·s\r0c�\�@���\�{ow%\��R�\�Rw��P\�\�>��5{U?����@�ᱭO�\r-7��fl\\R\n]Թ\�\r��)�4\�@�J	\�!\�c�\�H\�\�m齸4�1L��E-B/>\�E\�\�\�B_\nC�\\1��;�\�׼�VB�7�\�\�U�7���Ps\�/\�tz�\�y��6�3\"�\���V<3j�t$/ʎ@\�+\�5\�.�=\�#\��\�y��\�\\��\�\�=��\�:�ţۍ.Y�z����3\�1�\�VԴ�F�\�N\�\�`j旆\�y\�]�q.�\\-ٞ��NK\�^\��Gg����k���&\'##�Z\�6\�\�\�V-ӤM\�s�(5Q��z?x{n\�\�\\\��#\�3O,�+�a�Os]ך�9S�ֽ�J\��ӱ��\�ڎ�p�BW�\�0,V�08�5��p�	ɮ�KC\�|�5\�\�\�s\�XZަ�R@ �F	\�aR`\�z��x�[&�\�i\�֘=i�5�i�\�OQ��H\�v?�P\�\����>\�*BښG\'��@�7a�ɣ\��\�i\���֘�ZA\0����u�0#\�M!#\��\�\�\"=�^�\0I\�\�N\�}:��lc\'�\�jW\r�\"�t\���}\�(l�\�.M��Q�d�\�{\��x\�4\�\��LR����C���\�0��\�zSy\�G\�\�HB�n)�� �1�.+�\�\�H˂H\�O�8\��k��X��\��\rH�c�\�H��\�gS\0;\�\�\0Ȋ�\���\�;3�\�Xl\0;��\�)6J����rZ!*x9�#��ZR;�>٥#\�q�h�X�+�9\�Mu\�c�\�J�\���\�r23N\�&G��Le \�Nj_\\�SJ}�2Z1�Y�\�R8 �jV\n\�q�p9�2 \0(\�ӎ�\�;x<=;zӹ��\�%F\�sڝ�*\�s\�c4\�q�y�X\�084�\Z���@l�\�QQI��[�c�^js��\�a\�?J� \n\r�q�s�J\�L\�:{V\�}F�kA\�#��b��R�G�\������܄����=r+>#\�[\�\�5\�\�ޏ�؞zUI\�j1�s�V��\�V]�e�\�s�On+\�&\�\nS��\�jwr�\�\�<�q]V�w\��\�I�J*\�<��\�\�\�s��Ȭ�=1��#�\�BZA��8`f��c!M$\�౭�D\�\��\��g\Z\�ƽ*�Xz�N9څO�[v��\�EbN3�P(fL`�{�\"Wך�4|s\�YX*�Ű\�#�Z�\�C\�\�kR��8��.��T�8�0�M՚�\�\��R�����a��T�dx�\�Ifɬ\�\r6F�\�n	<g�uv��\��\�\���^:u�m���vW\n\�z�h閧`cК��\�I\�*=x�\�6�_e;NJw��1�yV�!VW=*�xr�c�&��\�x\�Fs\�<\n\�<�m�$k��s6��*�[�j\�eR\�<���F\�ư�M�\�?\�\nN:ׁ\�3\�œ�[���\�mPAs\�s�ג\�\��\04.=�V�AX\��Ysy�Am�\�\�kb-gK�´- �}I���<{\nu��\�\�6n\�1�Fzה\���E{�\�\�\�[FT�\�WSi#.x�]\"\�\�\�&�;\n�c���r\�Mx~R3ؓ^{�\�6ċ�_3q\�W5\��+\��\�M	\�d�YI\�y�X¥\'$|\�\�:6�#Im\�\�N@q�pW6�\�I\�ʼ\�<t5��ցd���\0dqҼ\�\�\�=��\�\�����V��\�R���\�\�3Ҷ��sFO��+.x��;qS\�\�#�18���X�OF�Ie��\\��j\�\�\�T�qӷ5\'��~\�f�)!�WJ�&7��Ks�\\3m6zt⤕�Z����G$�\�v�\��\�\0Mf鶿*�v�6\�\01X\�δ�8\�[\�kz�vp3\\�[I�$�a�mnƽ�[@\���V٣N�]L]\�\�\��{\�\�R\�찖\��{U\�t�pG\�\�D\��<�N\�\�\�j^\"���;�\��\�\�cK\�!iT`��\��]�\�\�$\�o|�\rp\Z��%�#���ҺiZM$y��(ŷ��a�=�l�\�v�\�_T��x<��\\��g4Ϋ�\��_G�[C�\r�������<5G���\�vgY�\�Gin����i\Z�(ߥ^�+Ԍ\�<*\�\�\�q��M\��\�}ȣPkS��I\��x\�{pŗ�<{W5�^a9r�/f\�^\�qt>��\��(��\�QY\�S�~U\�fT#R����\�d��\��*	]L\�\�\�v�!�����/�_\�S�:VF��	q����w\�A\0p\�_,՝�\�\�\�W*�SPd�\0S\0\�0:\���\r:Ի.\�n�z\�^\�B�^E\�)R]B(Fv�\�R\"rh\�\�L\�hg\�\��\�-�7En\�\�Iu+D\"��+�m\"\�R�X�bN21\�mIG�6y\�\�T�6�q�钹\�Ns\�],0\�P��\�j>�L�I��?��<\�h\�w&�\�1�*q>R�j8T� \0��m1�Λ�\�k4\�\� �\",�<浜ora\�\�X�3\�4\�?ΝH9Wy�`2+��\�\\���\'\�f�ap-�;���\�M��\"N�\Z\�8l,,��G�ъ�h\�b�\�>�>Ni\�5\��آZ�Ӛ\�7 9\�\�e��\�4\�\\�!\�\'�=+Դɕ�\�Ҵ\�aS#9\�H�y`��=�>�t=�\0\Z\��$-!P3���=]6+c\�\�BK�J\�ڣ�Q]\�\�`\�\�P�+��\�\�e�\"�\�v*0W\���F-�\\\�ݏaZI\0$\�\�\�&�#J\�ӕ�,:t�܃n\�Z���խ\�\�\�\rJ���aZ��-+\�\�nu{ی���#�jɓL,<\�N\�ǁ\�]����\��\�Bq\�\Z:�5\�\�x~�h�\�y�0Mg���W�F3�\�\�Uׇ�kkqt-\�\�\��Q�3\�\�\�e�\Z\'\�9�jK6�\�8�\�\�1\�zf�C\�\�\Z3e!���p2[��f�X=宥\�H!��1���=�\�ʜ�\��G��|Վ�7\�\�n\�LеI\'�5�a�?\Z\�Ō78=�_<~��e\rZ�8�\�,:\�\�ϴ\�A��4��\'\�\�X\�\�\0���\�p\�K1\�����N�uR�d \�Z\��}M�d\�͞=�Qz��r�9���iM\�5M�pR�\�\��&�\��W�U�L�W�h�\�\�\�I�k\�G��+\��t㩯G�`aR8W\�h���y5\�\�QQpx\�z�k�%đ���.֍�\�4�k\�\�>E@�Hf�ی�Pdu\�I\n�\�4��P�9�S\�*�\�ۃL\�\�\'�ڳ��cL�\�85��hrj03��\�\�;�\�`E\�*�8\�k�\��x@�\�\�0F@\�\\\��Q\���}�	d\���\�#��K�\�ϸ�����r\�\�\\q��2 ��\�+<\rc\"	�\�I��\��e>\�\�\�[\\@�n6\�\0GC_+9�\�\�\�!��GH+���\�\�\�F�j?嘫�(-\�gsKWV��v�\�\�ŀ\�g�\�FG\�\\\�܌u�3)\�\�5�wz�\�\�w<LCۿO�	��v�\�Hc�\n�溋{k�\�媚\�mж��yfc�:�z\�^\�\'�\�\�#4ʾ�E($�GT\�:G`F3\��rֺK};M\�1�[�ĮT5b\�j\�\�Ok\Z�,D\�^\�\�\�BN\�\�\�\�\��ʒrtI]��W\�\�(I\0�\��z�G�5 ��\�\�\�]J�Y\��\n�\�ŗ\�\��\�i#p�7<\�Z@��\�ӹ-�\0��W-Ӟjd洂1�\�N�5!\�1q�\�J\�Ny\�zu�\�r2zT(^�\�0�f�g1N+\��q\"6�~q^�2�X��\"�d!nI�V�(��+���8�#B��9\�]w��(�5^\�<\�T\�XI��D��/o�\�\n��%t�s\�R~S^\r{�;y��eZ)�@\�\�p�\"�\�֋$=�N�\�鏔+�K͉�W�ϫKCQ�b��[1\�W\�Q��\��\�W�z\�#\�2�m\�ڥ�\�N\�1�ɭG�����k-Бz`\��فiG���\�#a7\���ͱ�W�)@G�{��.Dvr\� ȯ��ͫO\�v��5\�e\�����B\�p��\0=13����l\�dd����\�}*G\�\�Vdl\�4\��\�N\�)�������\�{#\'4�*	\�qL\\\�=)\��P\�:\�\�\�\\��\�\�hh��-+C�׭p1�~\�\�\�Cs#\r\�n:�\�i\�z���}es�#|:�\�S��+��\0�VњX$�f�Oz�\�\�\��\�\��(T�\'��e\�!\"��Doc]Lvכ\�WR���\\W�\�+onǺ�\�\�p=\�\�Ks\�Y� \���5\�[�$�ys�k�vYaec��U��\Z�\�\�\�0��x5s(\�v�9�\�MP\�F3Pȍ�\�ܞ�*H0����smy:0\�#a\�\�I\�>1�Af A\�6�8�]���\�tW�\�q5\�\�;�WׁҮ��\�91���\�x彻��\��5wQ��/�bx�H���FU�$(\\ֵ��\�\\�\�}&	\�\�\�\�-5g��9\�\�x�\�\�I�k��\�y�SU�\�@�cҊxG`Nôw���\���gRis\�3Mc\�\�EjSi\�\�P��8)q$@\'��\�?��\r����E��\�=r�3�W�\�\�%\�\�9@�{\�\n��\�\�\�T϶\�#ђ}\Zh׷�\�\r��\�\�7Wș��|U��\�\�)\�#\"�\��\0\���/)\�\�2O�\�Њ��>\�)�\�u��\�`,�4O\�u�.�\�%H�Lе{5f\�|�#v\�\�\�+�\�\�DA\�Q#e{��P�f\�+��\�,�T�\\vQ�/\�̳���;\��\�x�\�x\�OH�JW3d~\�wܦ�RlΤ�VŭSSi!q�gPGSڼOS�5�׳���rҭ\�A·��\��\�krF�;H\��^�\�\�#�\�[䌟r[x\��d֌c�\���0�t��Uddg&�t���&\�\'\'��E5�a�\�֓o�;y�UXȧղq�W�#��\�W<\�=}z\n�!9\�)��Ԇ�\�\"D{�b�g\0CӜ�\�r6�k\��\�G}\\\�ﭬ&�Y��\�a\0<�\�z#�k( \�=�x\"\�P��\�\n�[(\� zz\�.7�g��O����-�FX\�z��Gm$�VU�\�ǯ�\�,��|�\�F�\r���\�I���\�\���z��cU\�\�\'����GZu	4r&x\�+P+�v\0P.B.c\�W.S\0��3@�\��_E\�ݰ�^k�jP�\�m��\0x��\�3��\�A]\�Mʤq\�p�3O!���ɯ_��|�iY���c<c�ւ}/g&��	�\�ہK���zR\�3���S9\�\�4��<U]�hF#���e�R0�nG�+ƠF1�� �^\���K�4�\�t�\�\�\Z�<\��sTEY\�\�]\�}��9ᱵO�~h\��8�\�j���ii)sL.)\�\�u�&�\�P�\�G�&@4��\���\�h\�q@���\�m\"\�C@�H�\�y/���\�\�]E�^�$�N1\\w�,�ݙu]\�\'�=\�)ǚ&�\'\�Q3��\�\�h\��3Y�\�=¬e[�\Z\�o`x݃q\�U�\Zyb�&r���\�y\�p\�)�{�1\\\�&{N�)\n�]崻\�$b�\�N�v���k���#$^T�=�_\n7�|�\\��\����I\�5�n\���3X׺����\�A\�H\�λ[�\n�W=Ku�+-�\Z\��\�\\\�ֳl:d�1Ko�dps\�������;S�X�\�t�\"5�}:מ\�]�\�\� \��c^�`G�9-\�&�l-Ϙ\�j�TQF�7\�\'��/��8\�\�]ǎ4䞼\�:���#�3<Sq�\�\0OC\�j�D\�\�$S\0\�#�\������n3ڀ#\0y恜q\�418\�\�I\�\�PH�z���[\�\�3�u�G=�\�~0qN᳜�\�;��\� �\�N�\�\�@�TR�1\�&���\0\n�\�7 t\�N\�U砥ۄ\�O;~���GN�\�#?��{�Ԛ\0�\�8$\�\���!�\�is���c��t\�9\�\�h,0�\��(a�=)�\�a\�\�})\�V�z�FBs��s���簦��ˎ)\\V\� pi�r\0P*]�y9\��\�\�0Xc!`F2*6v݂�w��M\��z�F\�\�<g��p�ڎr�ۊvv����=ܓ\�\�\�h� ;�#�\�Ҙϰw��i2��\n�\�4\�O)>r���7\�\r�c�Q\�Nb!A\'��\0!@铜��M��5�w\�\�)�\� �\��ԍ����TL�xq��s�����\�j\�6 ǡ5�jA\�3\�\�&�xe-�\0v�m@\�s��\�Wfz�^�\�$\�Wq\�T 㩫\��W)\�\�0�\�V�(�\�|�Ml\�g�s�\"q�3㱯��\�\�xt�h\�U\rl�r71$c�k\�4�9-�W\�I⸭!@U\�\�\n\��\����X�\�\�ȯ6�\�}M�/\�\�b��\�2�6\�;ףB�`&��\�ϿQ\�迀�W�{\�\�ݰ���Y\�\��\�\�Ϩ\�c�H��g8\�<\�\�x�z\�\�\�R�\����\0b3�\�\r]#��\�n�>��\�\�j�Qk�\�d�LJo\�\�U�K��\r.?�U~\�|Am�X\�\�b\�U\\���\�\�\Z\�\�a�m�0�\�b_���8�,�����qX�Q<e\�s\�~\�-gQ��ȍ�y_j�1�\�9\�մ=��\�\�n\'�\��\�[\�#Ď\�pk̇����\��\�8\�->\�V�gs�<�W�EZ(��Cs�wнk�^\\\�v�ɮ\�\�P�2D�\Z�M�\�\��ăR�Lѿ��\�\�P�\\\��r\�D#.Fw:Lhq\�+��%9\�\Z\\�>`x8\"��\�\�\�\�k\�z3\�\�g}B\�8\�\�y5�.OZ�\�0\�6�i�Ό0�)\�\n4R\0A��a�k��w8\�|�z���n��\nƭ��	\�&�{\�NDn\�\�\�W�]\�2\�\��דx��z\�\\�9�%y��҃<Z�fg��\�F�9\�Zl\'��R��S�%-zIO1��\�\\[�\�e\�\���\�7K)�8\�k\� \�s�M{7���I\�r+��G��m�{��\'\�t�\�\�\�7�`��ɭ\��LՒ\�l���� g8\�\�X�\�\�\�)@�M��Be!a\�@��5\�\�d]I�\�\�g]\�]Z��\�Ȃ��˔<�\�ڋ	�vA\��\�^M\�>\�\�nD�\�\�dW�j1\�Z��\�/1\�����Wg*.p\�F�\0��?\�\���ɯtUUP\0⸿\�Pʉi=���\�ɮ魙��\�}�eMj|\�2�\�P�-�B\�U\�``�\�5%}.�;�,`\�]tl\'�\\t`\r?k\�2~�\�(�m\�p2(\�x�X�*\�A9\�a\���Uf�Y\0�Ȯ���Z\�d�u[�bٱ<�Ex߈\�g�\�\�;�z\n�W�\�\��\�\�w���}>mI�\�\��ܓ�q�\�\�\�a:N1g��eա��I\�\���;bE\�A[6���m�x��\�NRJ�\\�ٵ�2DAɯ�{�n�������\�\�8\��)�%\�5G�/R!ҽ�\�B[\�#\�%p+J��*##6s�֩#&�0m�8\�9\\AW\']3\��R\�\Z��Qa�[�iP�!�Z�~\�<Q�ݗ�& ~U\�\�\��a\�%s�Y�\�\�\�u�u�96���͂��g9�ow}8Hӊ�3\�\�\n\��F��\��\�\�E%�>J�J���m\�y\�3���\�\�W�\\�/ו	�Xd g�ϵq�^\�t\�?i�t\0�\�ª�J-�gB�_i�\��\0��~\�مz,��\�\���\�oeѮ#w\'a�a��;{�[\�a\"\��Z���\�l�7�\0\�\��E\�1�3Z�\�v�!ұ��}=�ʚ6\�=A�٭t�d=�+\�	9������Uiij\�\r��a&z�G\�_8\�:�͉�Ϲ�q^�j��^e+�\0\�w�\'�%���)`��\�\�\�Y���~O��Ky4y��͵3\��u֫|�_�c��Ó^\�t��	�av�V���nm�q(\\�z\Z\�\������S\�[\nƪ�5\�\�\�%x�;��\�q�=*\�ʹ�փX\�j6\�1\�\�DA\�\\n=�#?Tf\�\�\r]r��\�Y�lSs�\�:�DlUS�\���\�\�k@��Us�y\�A\�[�\�>5�,\�\�Xp{W�xr\�\��C}x�CF����\�\�b]\�Rw\�}���|n7\n�����\��_\����\�Ӓ&*s\"|�;\�W�\�\�i�\�>M���)\���ψ\�!���k(\n�fc��\�z\r�\�u�߯8\�+��R\\��2l�Q��\�K�\���FKT\�\�]G\r\�*h���)w01\�G^sWt��@��\�*�УH\�^gԤSmxȜ$�ӊø���\�)\�k� \08�\�\�5\r��^k���|\�\�\�_9x\�^\�P�/z�wUu����\�]�I/d\�\����ZPv�\�Z����J3\�\r\"�g�\�֣D�Z1\��5�k\�L�jC�M1�y\"A\�\Z\�\� *\��]5�\�{�\�\�t�Z��Z&ϏϤ�8G�,�#�ϽD�dc�zS���»�Ϛ�`_i�8\�F͸�\�w�\�	�\�d�z\�\�z\Z����\�ٌ�\�ҹk\�\�з<\�s\�\��|vc\��z.j;��\��\0���\�fA\�˕�#&�m#\�izK�\�p}\�[F�\�56�\�-\�\��\�x5\�\��xF�\�7ױ�y?b*\�\�ƮHE�	\�\�\��n�n�T�q\�\�`+�=+*\�jhb��{9~\�#קjճV�ư?�K�Ծr2y��i��_�RYc\rktŊ�\�|\�Z��\')6\�?P�\�(a`�҂�R�R4O�\�-\�\�Z�\\�ߏ\�S �v��H��գ\�L`\�I�\Z\��+D�xKr!s�7�I\�v�\��kn��컣pk3�\��+\�{�t��\�բ85�c�\�\��Ӧ\���`\�O��\�`ݮ*na(��(�ǙpkQ�F�`�Gj.C�LF�� t��\�/��I\�5�e�yOZ�\�\�Y�^k\0Q\'\'\�\�4�Tb\�9���\�-Z\�1\�\�\�E\�\�P\�N,�\r?[��\\\�w\�֬\�hϥ\�1\�k�\�_|�����oCR\�\�\"�K\�4y\�m!ٞ\�֕Δ�E\�|��֭@x�:\�\�)�L\�n�WPm�\�\�to�f\��bQyey�\\��G\07o�\0Q�<-\�4�GG��\�`�����9.�R\�\�w�Q�\�D�^I�\�\��b�C��\n䧶�\�\�K{�\�s\' /�5��Ꚗ�z�F�K\�\�,R�Pz�sU���[Э<`����\�}Ew\�H{\�\�J\��3\\�\r,5f�\�IE\�J*\�C�b:�T*MB��\�\�U�\�9ɯ��?)�\�\� qJ���ڠ�c\�^\��\'$(\"�\��r4�w�)�\�,G!������՞Ho�V�\�)hc5\�\��S��\�s^?\�[\�s��\�Cn+׮\�\�%q�*Ns\�^}t..\�tw5��v�Wv{y7:�\'���͖-#i\�Pj\�\��n�\�? u\'�\�ֱ�r��J�\'̸\�kǒ�>ʛq�ktϮ�Œ\�)��w\�l���\�\���N��\�}�S\�\�d�_�\�׫B\�\�\��μi�Y4}m�\�/\�ԏX��2���S\�Q�r�\�lP}�w�\�\�\0��Mhɹ�[��\0v���gͪY����\Z�drA����\�p\�\ZmS�\�+^\�\�\�-^YHrTw>\'dcV��۲G-�X\�p��\�I?A\\��-�K-\�<��J\��\�\\Ԥ�V?7;(��S���X鑡<�5\�\��d���\����g񴗡�Lb���7Z�&\�1L�D�-{v>��nj=\�\'��\�\\\�8<\�\�]\�\�ӱ ��8\�^���Y\� Xm\�\�U��4�2>�\�	��/��I\�}��\�t?\�:q\�21�7\�\�\�a�\�\�761\��w|�\�y.��\�\�O#,.bf�H+\�\�\�R��t}^G�t\�\�ߕ�S=w�z\�z��݅�\\\�A�=�\�\�n��ǆu+�/U��?6����4\�R+�A\���\�\��r�ٟ�eدkN\�\�	�F�\�#��m�F\�\"w�j�\�&��ƈR\�z\�Z�T�u�ۦ�v����\�\�g\�ON��2]:��V�\�F�%݋Ԛ`Iu�#9n\�׆��\�7v���c/��J��wv滟��-.\�\0����xN�;���v$�\�\�f\Z��\�\�x��*�\0��ש+ܓ�Ns\�k�\�\�i \\�OBk�\�\n�g\�iD\�\�^\�\�V>C4�=�7�Ȥlǥ#$\n�\�g�+\�>Y�x�\0\�\�/�\�wv4@�J%}�CT$\�BÌ\�)6R@x�\�2\�	�\�J\�\rg\�I\'����gL�ɸ,A\�$�\�ޕ\�I��\�O�0D�7\�8<\�\�W�\�\�LVdC\�\�q�;v0<�W�����>�,�\�IY۹�f�p%��\�\�%�R \�5\�>�8\�0\�G�k\�-��z\�\�OF}�)A2[���p*���t5.��\�n늧��\�?A\�A��a\rp\�9ɩ\r�||�\�J�\0�#�u\���9\�\'�SJ\�=��\�\�\�8\�\�򯚦�\�\Z�\�\�<4�py�e�Ʊ�M6`��a�W�\�X>\"�L\Z���+�\�\�j\�\��f\�y \�\�\�l.0:ҩ�^�\���>�Lw\�$\�r8\�;\�1\�4\��y\\�j�\�@\�T�\�\�\�Xe#����Mf\�P\\Q��^Mb]c���k�\�s�\\��Mg#ҡ�\'�\rt~Վ��&���>V��p���\�].�kkvZ\\��\�c8�E�wғ�\�\�\��+N��x/ ���\�K\��1��\�B��E�{)�\�8z��\�wK��H*{�kƩg+M��\�`�ϩr\�\�L� �woj>XL�\�J�4\�\�i\�Y�=k3�ζ�PfR��fj7Q�%�A��׶�q��:k\�<E�\�ޫCR<���H�\�Q�YX\�\�\�\r\��#\�Z�\�\�F\�2�����;\n�\Z>\�H\�ZQ\�^\�)�E%\���EGRr�ݖ!<�iLѐMQ\�\�\�\�Jr\r4d\����\��{\���6�J�\�*l�j�-)8j�O�\�Ew����PĀ+پn0ݒ�\r9l(|i���e�^\0��~��� J�\�8��\�(�\�\���\��ތ�k�\�\��⓾)��\�M1\�Q�\�)sI\�@\0/���3L\�Rd��Rn���M\�PR\�)\�ri\�Ǌk\�\")#$z\�C:�n\�\���Ҡ�w\�|C\�\�Y\"�\�\0C`�+\�ͬ��{y+\�y:�\��&����a\��\��yZ7=,\r\�.R��r�\"�Wem*�\0�\�k��\�\\E�Hn�\�؍ţ\�O�\�k��nf}e���;�����l�9\�*X/P�\����G�#���7��:\��.J\�3\�\�-��1�\�[�M\�G\'�f�\�U\�A�q�V�c\�\�rb�{8��\�\�9/r:׫ۦ0~��5�5�\�#+��Ϸ�zlcc�\�R�$>;QԪ\�.�\'��L\��������;\�\�\09��	DTf�\\pA\�A�\��\�u�\���\�:T<\�Ā]�o(\�sLL��\�\�s�R`�\�\r;9\�A i6\�\�S\�攐��W%1\�4�\�\Zq#4�\�SJ\�)�n�����u\��:\�ӭ\'\�\'9\�ץKcC\\)nq�S�\�g�\�p\'���\�?CBb#(\��\�\"�:\�\�N={�6\�\����\'*\�#�	K��nM7\��l\n.P�A<I\�?�?#�\�4�s�(��F\�\\�\�FOU\��?w1�qژws�pj[�qc\�\�B��~���\�z\�N��q،�;�\�\�P�sR\�\�8��\�\��\�)�\\�}�*\"��pA\�\�S��\�\�5\�=;��qr�Ι\�\���1AB\��ڤ\'-�\�\�Q��7)��\��I*\"�\���T�d��rx\�jz�zc��r-D��\�D6H╖Y\����ds\�\�\�JÒ��#��\n\Zs�g�zV.>�R+#de�^��\�7sң$l[2\��>��1�\�5�\�kXaG5�ޏ�\�9\�Er~$�+b\�NϘEu��C\\g��I1���\�}&!���(/ym#1V�=�z4��\�\n��q�\\\Z fQ�y��\�\�\�\�\�\"��uY�\��xߊek2�FZ�h�\�b�+\\m���?9�_���5w��y	\�Nz�L8���\�F\�9-Aq,1&I\n\0�VsQWg�\nnODU��\"��\�\�Si	7̧\�\�79���p�[\Zm��\�i\�q��1��U��V\�\\\�vt�L6�s\�: <\�\�S\�&�@\�\�r��\�e��\�k\�Z�؜��\�\�&\�r�\��Y\�\�\�\�8\'�\Z\�\�5G�r�\'\�\�[\�M<�)l�U\�B��<�Ew-��iw2�V=2qֽ\�D\�`\�\�\�#\�	�?\�o\n\�ɴ\�\�aqy�\��V�ZVJ\�Y�;\"I�\�\n�W\ry\�\�g�\���\�\�\�\�\�;\��\�=ME��nN�Pz�+�\�\r1a�\�Q5�\�\�	�p��^��$e�p�y��/�X�0?��X�\�:\�\�Է;>\�wN/ȫė`$�մ4[���L\�\�	d{I����\��Et8C\�Nj\�g^i7Pr%UX^\��;�\�Wg�I�)�#�%\�I\�L���϶6>�\�\�,�Rq�\�\�fdu\�^E(mBrH\�\�wa0�o��.?�\�\�\�-��y����R6g�tP\���ېp+�]:[?1\�\�\�k\��\rGS\�X�)$�\�\Z=,)D8�܊�}*\�\�n�$Wo�\���\�{K�t8\�A^&.I\�\��l9F�\�X\�4��\�Z\�\�$�\�\\u\�\�7��\�f��)%�k�3��\���2�FsY%ƛ 1���\�ͥ��\�\�+qU�V	#e8\��U&M\�\����#\Z\�\�\��]\�\�n��O�\"�	\��\�^U�x�-7El۟@\�Z�s\n�:/��\�P�h[\�<q\�U?����\�2�\Z\� mF\�\�3n\�,=k��\�m\�-�2ҴF	ɶϠ4]SE\�r\�Iq\�<�\�\��T<�Z�j+�O@�\�͎+^\�\�O��b,W�p\�_�\�vR�\�r֦�3۵;\�m^1�#�U�\�!�{y\�\�&!s\�T\�:���\�o*�5�	\�Tt�%�ì1��y���2:M]\�\'a\�\�X�\��+	Vl\�)\�\\\�t�+�[��g9�\�ZD�p���\�$N!�\�_�\�\�f�՜�tt\�	F\� \n)��n�zz\�\�ִ�A$��y5f-\�8��՛�\�Bx�ז�\�ņ\�Hree�w��-�d\�B�W;\��\0\�\��<���{Vԩ���\�(�c\�\�\�S\�\���1\�8\�G\�=��\�t�#\n�y�\�&����\�\"\�t�P�\�=I�bo��jL|��{��a��\�rG��R9o�?J��n�n��k��\�\n���?\n�Ҽ;�\�21=I\�k�Y��V�\Zj\�<lO$�7�:$�����|\�5��w,TW�_^+��-^���w�\�0�\�ڹ�M�۹їҌ���#�\�\�\�k\�q\�u\�f�5c�~�\�\�f��#\�\�s\�\�[\�\��W�=Ϩ��\�\�\�\��`\�j\�m>}���k���\� \\l�1\�\�i�b\�<�\��\�\�$�	k��c�p:��\�#��H\�u�0\\^e%W�\�⵫h��ETuh\�\�\�\�x&��\�_j%���\��WҾ��a��\0\�5\�ڞ�`\�j\�\�w\��_\�&@���z\�\�\��&\�|���\�+��?�\�\�\�A�����ЎƻhWҠ��[X�\�\�[T�e�\�TjT�Q8\�y��\�\�1�����	pA߸�\�k�dy\�w��\�s\�-�!\�Y\�-��D�j\�4\�	\�C{WQ�&68\�i�9Z>�>\nJ�jU�Ԛ��͛�b\�Q�ȰV,��U\�\Z�\�\�\�j\�&2�\�\�D\�,4�\�[[���5\�%�\"��k\�\�\�-)\��?4SN�\�=d�f\\�\�D[U�W���\�<V���o2L��p+\�\�\�c�6\\pE|�⯅���s\\\�Ed919\�\�k��:���?�T��wh�+�\�]_\�\��\�,CW�x\n\�\�k臖\�y\�XG��%��\Z\�\�F��\�\�i�cW�\���\�s 8%kǨ\�vg\�Q�\n�%*-N\�K�,F\�FL\��=踽��E���K\�;}ibd\"�\�̮�+��#\��2c=x�mGTӬ\"2O:��jn�P��I6r�+��\�\�Fwۻ\�\\���\"��0��\�\'\"�\�kV�\�ʕ����\0�g=�^}<�\�<jXp�\0t�5�tN����\�:�sM�\�oz�@P���}ER�\'�\�_L&\�If���\�\���\�[>��\��8$�\������`\�\�2�\�\n����\�38�T\\�4|9�\�<\�ch\�RC�.\�k���1�\� {�\�\� �V���\�<��J����\�k��\�\��\�\�2Q^\�t�l���9�\�\�\�x��妁\�\�P3\�5f\�\�+�7�{\�j�G\�\�~\�\�R$*\�re`,^&8zR���es̱�����}��L\�t]3J\�^����S,4�u;yۅ4�T� �\�i\�q�4�PU����xy\�걅S_#^��M\�N\�������\ZT���Jټ�R�\�\\�\����.\�?xgɹc�%U\�U#�L����I呛��5�PCቋw7�@�i3ьl����f\�;�j-�C�w�5v\�\�mkF�\�\�8��l�\��ta�̖�M2\rI3\�\�˂\��\Z\�o\�\�Y붣;@Փ�\�\rgsgtջ�~\�$\�4y��9\�FÂ����\�.��\��\�\"W\��\�s�ξ�tMn\�R�8����9\�+_\�1��\�\�Z�\�\\(�\n�&����ܤt]gIf�\�.��uTݜ�Lt5oM־\�Β!�t?<f����\�Bj�\�g8Hs�}=+b\�Q\�<I�@7�:\�\�\"j\�\�|\�D�d��\�s\�\�H\�G\"��\�\�ŷ�^{�Wd\�\\�K�Q$7��\�\�J뤞+x�YN\�N���A߈t�G\0�ݟaȩL\�?\�h�y�H\�D�k۳u\�{�K5\�\�\�7\�\�7�lr��F��i_j<��\�Ŵ�xn\�۟>̒��E�t\�cN�M�\�aDw��\�`o\����1�O\Z_DF<\�\��i\�\�	�\�\�L4�:g\�\rgj\n,�ke <N���J���q}�O\�E�YJ\�d\�Y>q\�\�V}�C\�\�.$.Q�#{�\�\�j}nk\�\�	��\�kq�&\\t5��Y��s�4�2����_cZEٙʟ<9{\�e^\��S6� �\�\nMz�ͮ��G�D��.\'\\r��\���\�%�}ж\�\�)�5�Y~.5\�#\�I}\�\�C�\�\�ۯ\ri\�vk�[&��\�<栊\��\0�\�)�\r�M?{\Z�����\�Sr�;\nt��j �*�\�5FyرQ\�[Z\�3m���/\�6�\r\�$`s^66\�\�|W�G5\�\�\�\�$g\�>�\�\�9\�xxʊ�V�\�\��l�\�a��*��$���5ad�X)<\�0�\�\�G�ϥ��\�q�ڣ�\�\����e֊\�	\�\�\��++\��\�C�,\n\�!�{\Z�ﳇ��\�\�^��g\�P�}�eymr��E \����<�S�W?w��\�\�[�\�\�	9C�~��n���c!�\�_�9�f��kڝ��0\�	�#Z�f�U��}��oA�\"\\|�½\��\��3��GS�c���:日\�xb\�Y0@0#��\�z�<\\\�r�ml�ǌh\�k�2/\��0=G�z\��J8\�+\'ȷ�(\�j|���:WK��Ć\"N@\�})С$��x\�\�l��JM.��$\�\��\�!���\�\0����\\��q^3ֺ�V�Gh\�3Ư�\�a\�\�Ҝv�S)��Mfn*q��kb\�\�I\��f���\�H\�Rc9\'��\"��p@\�Mm\�\�`��r8�d�D�Wo\�g)�z0R���i�\������\�OH�̎䏗�\�+��(@\�)/\�Ybt\��k�n\��iЌ\"�/_\�N�T��UVݻ\�m\�3Z�cq\Z����CZ�7���l\�l�3B\�r�\�ڴ�\�M�F3�\�1�(�\�h}^K^\rr7��g�</�\�J���\rFͣ\�$VZʞ\�)2J)�+\ZMלO�\�xos\�\�\�Ge6�j�C:/�\�p�ƹ�\�hw�\�݅W�J�$\�j��R�F\�N6�5�]�/\�t]^\�\rC\�i�v(6�F=��x\��VF`�\r}�\�Z}ލe��#Xpwz\�Ms\�\ZU�ftv*wF\�\��\�^�\�\'\�\�w3\����\��VΚ\�+��9�d�\�\Ze\�H\Z\0\�q\Z\�^\�̶Q\�\"�\�x\�~�\�I5$y��)R�\�\�`M\�\�G�ŗ�\�\���N+\�N\�\'8r�;$S7zR�\�G�қ�\n!\�\�A5�\0���FG�C�FѤ\�Bf�W\�d\��3�*��\�\�Gqt��s�\�:��\�99�%Q#��\Zr[B?�+�ŝ���4���\�\�Aq��DT�\�r:�\�5Y\��(\�\\\�<){ugk7Q�k\"�\�P{W�Yߨ�Xj�[K�}e-\�A�;X�D{\�kj�\�m\'�7\�z0��\n���>\�\n�!\�\��X��\\a\�U\�5\�\�8ʐEa�DȌ~\\\�%�\�;��\�XX�b́h��W>���\�GTO,\�#��\�(\�oh�\�\0���\0���?c�`yǵmJ�<�9�U\�\ZnL��n�ڝ�B��Q63��°�\�\' 5�\�\�\\���\�{\��z�\�d��\�sTRrwl\�P!�\'�����0\r(\�k��&H\�p�^��\�S�G�R��nN:Tz\�\�m#����8�8����8d�9\�\�U��\�F\"2OM\�\�Vlޜ.̛��I�\�UQ֑رɨ�{\�M\��)Ǖ�5\�hv���d\0nH\�\n\�\�P\�\0{��?\���4�ȯ�\�z9[�5M)+�4�7j\�\���Hr\����Ay����|Y\�<�>��X\�\�\0�d9>���\��\�N�\�׿;>�	eM$Q�\�s��\��5^\�\�7S�\�\�\�I\��|\�\�H^�\�5��\'�X-����k�\�ݾX��\�H	p� \n�\n��I\�Ԫ\nǾ\�4m\���\�bk�	+I&y8�x;J\���q\�\'Q$l�\�`�O֦F\�>\�a\�ƾ�B�>V���9�Hma�;b}�s�s\�\�h�\�uM�u��?\�Eg(\�\�Fm\'zR6�L\ng\'��lǃSj�\�OBsA<��0 t\����\0��\�g\'~Mx�M{\�\�+\�}F=�ai#\�\�\�y\�\�9���\��\�}�>qN;{�-@\�jnh\�L�M\'#��TE�\\�P+dSK\��s\\��\�m+F�}�\�o#�NI�#\�>\'jS�Q$(z\�zNI\ZS�9\�x�\�\" ���\'z����eV9\�E|�{�\�7\��\�Gc�w\Z���@s̫�cQ\��\�\����:ܡb28�\04\�J��M���Y�,�%�pA\���+\��U\�.e\�Ǳ\�2Lʥ)\�u�襏zPåc\�j�\�q+��^\�<V�̯Ӛ�$Z�f��7�{ԡ�\n��$\�ɦKx�G\�5\�\�ֳ.��6h/�g�+Ѽ_5\�X�S�j�M߾/&H$\���\�\�N\�ݏ�\�0և;ݞ��\�gսMt�\�[,G5\�\�\�\Z\'Xd#�n\�J�y�D<\�v�\"���y+#.]:\�nt5�}�q̾�WY)85�r�F\�³9�k�P���\��S\�+t�<X�뻨��\�6F@\��\���W����f3\�޺��3\�\�Ù��e��F�coP88�u \Z��\�o��\�J6�\�{Q�\�>R�9BRL�ߊS\�4\�\�\��Ps�9����\�\�A\'�g�J@\�<v4\�\�#8\�\�4qߧ�Z8\�)\�9�CN2=i�a��\�y �\��1��\�M0��\�\�)z\����0 z�JB�\�\��\�=�8\0s\�s@X$\\��hǨ\�N\��}z\�T\0v\�J\�\�qO({\ZR�\�5\n{\�ޤ|˒y\�@�\�I�3\�ڂCPKC9\n^X�\0�i\��IҪ㰎�\�H<�A##�;v�	��\�\�R�\�`�\�w��F\�ӈ݌T�\08\�	�\�v+�|\��\�<��\�\�zԣ#�b�\0b�ab6�A?J\0\�O\�5&1\�Zk\�Z��؏ľ�\nL\�9=�S\�3ry�\�UG�x�\�b�|�c9\�s�9�E� �zUR8N\�b�`r8W<�q֤u�$��1�R\�\�HŸH8$b�\�A<�:U�P\�\�\��SȬ�\�=I��܍TNsR�T�\���K|\�Ү۬\��\�p\�\�\�5m\�R2z�x\�:Vrf\�֦|�\ror�Tx8V�m��T��Fq�0֯0PFs\�`\�\�S4\�q\�[��[�=s��5��\�j�}\r( מx�c\�J\�\06F+Ц$�5\�Z�K6��|�\�~澇�\�\�ïx؆\�I29\�`k��z\�3kΤ`zWOi*EsCDmSS^I �\�#i\�ӊ��\�V�\�W$\�\"�\�P+N�s�Xھo���	\\\�\��Oֽ5Hӻg���*�)#M\�BNx\�ɬ9mJB�`��U�n�&A�\�A]���C\Z\�`\�\�c\\�/P���-���]�sެ1E\�\�R\�\�+\��UX䏥y��g�\�G{x�#\'\�I�\�\�\�\�V95\�\�i7:�����Z�\�D��\0�v\�ֻh\�l\�\�VQ8}?�Vv�f\�5�\�\\�\�ih\�\�$=��b�c/Lm�m�r�фTQ\�NNL̊\�` \�=x\�]\�6��ǅ�\�Xg�t�F�\�~\�ئ	\0\�\�\�\�P\�W�x�H�/˼�\n�}\�\���5\�(\�\�\�&�k\n��Ԏ���\Z\�x�bLd��\�,n^\�r\rS��kY�78l]\�Equ\�k\�\�\�&}}(��#Z\��>W�+]t;\'�\�y��.o��\�\�Aȭ\���\r!#ҜYlߺ���S�\�y�+Z��e���\�R]��\���F��~b1Vt!\�\�\�\�\�l�\�uP��\�ǉ�\�NM;Ynx��u!pE\�O\�Z\Z�e�?�\�W\��^\�\�$exU\�:�\re�\�\'&#9\'�+\�iSQH�\n\�$ܷ\�\�t�1)��+��6�d�\�Ц\�C���j��u�\\q�����h|�\�I\�֧RԴ4\�\�)b�2��O\'\r�<׶\�Ag�H�p3^	\n=O��N�f�!��\�8\�|\�]O�P�4=<Ƥ@�P\�`�1\�9\�k��\\\�w\�\\�!�s2^i��$#9���j0\0Y2\�\�\��$\�	\�\�)\����\'��\\Q���\�Ok}\�+vi\�X��)\�\�_�Z\�\�l[�4g\'5\�\��\rJ{Y܍�T{WG3@��[+��J2W<\�M�\�II�~��uv�\�Gz����p\�\"�\�޸�Nh\�@7�Ps�\�\rmcΒ;?�oyt�r���H��G־X܏�؏�\�c\�Б\�^C\�\�7QIs\"�\'Z�����u����I[S�9+r�yau��R�c���gk���\�\�j6�\��\�qWz���\�v�\��`@��67��1�&\�C\�b��-�/\r����x��K���\�\�5~��x5\�>�.�\��Mzŝ\�h\�\�q&\�꤬�.y�U85VK��\�7�����~�\�k@3d6LS\Zн%ŵ\�;�\Z\�uw�9G\�\�N\�V1Ԯm�e-���\�\n�_�\\����7��:nMhEJъz�>\�u��o4\")˓^פ\�\�Y$�ϯ�ki�-��n!����zڎpH�^��+\�x8�K�&�\�V���|���FpOJ��L�\rt��l�c��C\�z\�\�\�%�1\� \�\0�\���=WH�\�\�\�t\r�k\nM�Z��s�=�\"�l1\'8\�W$ڝ��.˓\�Q��D��O�Z��]H�	!M`i�a�\�E���\�޼\��vg\�\�Qq�8���AA$g��m�F+R�3%\�\�:ޕ\�Tn\�X��=qW��\�=;b��t�I\'��֥2���\nd�q^3\�K�.\��Et>$ׄ����w=\ry\�a<���O\r\�WD ThJJ\�hf\�de�=��\Z����k\r�0+ʼ)���c�U�^�\���\�\�ʐc�z���\'k�\�\�9!7t\�����\0��+h�\��!\��\0{B���\�1i�R\�\�aV�V�[�_Q�f\�i��s\�*�h-\�\�vG�U�:�^\�6�gs\�m7\�\�#�Brs_A[YD\�Y�}܎�\��/E���PZA�\�^�\Zaq[\�h�SWZ��8\�:ة(�v\Z\"H���t�x5���ױ\�^\�R�t�ql\Zc1\�C)��I�\�G \�\�?�24˓yl�!��\�G\nk\�RI\�r�(�[\�:\�3pё�8�eR�ٞ\�M�O��\�v�>a�\�d\�n�~ZHe�5\�Z\�e��\�n#+�%I\�~����x\'�9\�V ��de\�\�\����j�*8��^\�\�\���c\�7\�;F\�\�Wq=\�\�唻\�橇��\0&��\nx^�T�Fx��\�\���E\�fU�a�\�_D�\�\�xW��:�\�3�Xz�=�{|>\�\��\��1��s�ر��ӠX�\\\�\�բkԥB4\��9�iWV\��|(\�l�)�\����\�QD�ݫfh�V�\'5��<�\�sw�l�	<\Z�x\��\rZ8\�Uݍ���}�xCN�\�\"F���%\�X\���T�\�&�~\�5\�Clmnu�2N3\�\\\�\�QI�k�\�KF�*��`��ms�֮\�\�\�T�R\�{\��\0K�\�i��\��r)#\�-\�\��\�}�5�\�&��\�;|�\�Q�W�}��I�~�\�\����D�\�\�\�1��3\�\�\�\�V�`�\�:�\�\�బpZ�\�T1�����5k���fe\�޳<39���\�n�W\'h=\�=d�\�D_>j��j�\�o�\rN�|�\�C5ݴR�{\�\ns\�r��z�@+K\�F\�\�\�I�tܸ>�K\�\��}r\��N($�j�Ta���\�\�[\�`�jni�.h\�E5燯N�$�d�\�����ˋ1�\�Lo����V>\�a�\�\�¹{�Rk2-���j��\�&CH�\�e\\\�>%\�ɼ�H�������m\���:��2\�>���+O��\0۾Kb[k�Ka��\�\�[8E0n\�>\�+5��=c̗N�����\�-\�\��C�#A���]M\�0Kn�\�7�\�\0\�N�\���n �j-\�(u\��\�~4�8\�\"�:��>+�+�\n�;UOojl��\0�\0�Y\�qkz~����\�2\�v�d\�\�`]\�A\��\�Y�|\�x�D�\�s��~������\0\ZcV���[\�;\�V�vi{\�7�\��\�W\�M\�Fm\�b��Y\�\�\�L�CM\��!*֯~u\r\�DfD�V_b*\�5\�&u7\�6��\���Q<A�C�\�k\�r�g�����E=\�;V�\�\�ki�%��2\�\�~)��\0�x�ˡْ��jĒ���a�H|/�ϥ]sgrp�\��t?\�\�\�\ZD�c�Wȑ�����\�?��5�\�;�I\�\�5ke-,Q�P�q�KTlu�ˍ(]Kl/\���m�\��b\����F��^����*9�T\�F\�Iy�9\'�\�ݑԫ5|\�a}aj֑\�[\�}�N�+����\�}�����a\�t�>⾿����i-\��\�w�\�rڻ9\�oݚ��\��Z\�<I�\r*7H�ӿ\�W�����60=\�\�3�p�{d\�+\�j�L0\�y$S��d�d\�=\�\�Һ1\\`\�w\�qe�V�gW\�OH�<�F\�d\�Ԛ��\Z��9�ˌ�\�W��>\�*ȇ9n\�\�\�\�zTx����B���cґks\�\����Y\�q\�b��NpEĺ<Rɷl�Lb�\�y+Ȭ�\'\�}Vޜ_�^U<\�n��2	��\�=z\�i�h\�9k\��\�1�\�/���<1q����x\��\Z�/�\�8\�sϰ�~%C�\�\�\"�\�\�n~�;�<�\�?�i.�\�:�b�Xm\�!%yn\�+\�-#�\�t��̩F+ָ3\�f���\�Ȑ�`Y\��[pEV�\�<o\�+\��#[Jr\���;\�#�\�^\�\'\n��\��0X\�R|��\��;I\�=�\�\�\�>�\�D�h\�=)]���\�\�:y���%�]\�4Y\n꧆\0\�7\�\�^\�I��V�ߣ����槍��fuf��_-�\�\�\�\�\�ntx\�cy }\�k�O\�\�6\\�chS^S,\�vrz�S��ȯ�XH\�j\��\�f\�mc\�\��^�\���=\�\�\�v�+���\�x��\�3\���es\�4nU��*g���vM3��6�^�4{d�r|\�\�q\�g�	^x�\�8�{B�t�5�\�\�q\'cZw7Cݙ��9�\"��9�\��<E:��g�\�-�x�荻%\���S\�\�\�½gI���;�n<\�x�[��\�\\W�kO�wq3�o��»\n\�w:TR\�ݓ\"\��\�\�� ꂰ\�Pq\�ɵ�\�\�˧͉��\�\�X�|d�����\�t�\"\�\�&k�q$q18u\�W\�\�]\�n����C\�k\�\�Z\��*4\�B+�jeI[;1Yw\�]\n\�\�\�I.\Z\�xY\�$qI-�:E\�\�\�\Zs��)r#q\�<\��V\r\�\��oۢDr̪�\�\�^��Q\��B�S�\�f�\�}l�4P̄,V\�r}O��{xϕ\�o�CJԞxm��Kg\'�]c&ḯ�������@غ�\�\�f�\�\n�\�\�ͪ\�\�k�J��lW�:2�y�5T���\�\���H\�\���f�MOE��؏�s��N�a�[\n3�\�I\��\n���E7$\�lMM^\�g�3uJi\�0y\�M��%J㓊\�\�.٤e\�TQ9p\�GR^E���\�\�n��������\�[�7$\n\�F\�\�S\�S�Jŗ�\�\0�U�\�(Ȥ \�m�n�������N\�q��TC�4\�H�\�\�\�þ\"�O�f;@<g5\��:���B�?��}k\��5��\�wVR\r�ʉ\�i�Z\�u-V磇Ÿ4��>����\�,�g��u�\�\�+E�MlSz�\�;\�\�f\�R�l�]��\�WTrs^l�+�=�sR�i�Υ=\��rA\�\�rk\�<y�Cftǌ`\�k���^\�Ŵ�`g5\�c.t�TZ�[\�\�ˎW�/�\�@�\�v\�R��^q�n2�^�,|2�؎ݳ^�>zi���q\"�\�WGݯA����$���3YDw\�\�\nMG\�ֳ\0w�t�N�s��]\nH�jP�3ihy\�)�\�֦�����\�</�yF��\"qۭh�,U\r\�9�+�\�|!u���|\�\�Տ\�Q�R\�(\�Q٫\�\�Ȣ�\0dc�gR��\�C\�j�8\�/\r\�Zd�\�nb2N+\��{}qyu��[ZF\�aL/\�\��sZ�\�8\�|\��+E��ד\��A`W:�vw�\n	)�qGZ�xLS26F\�Q\��ӹ��i�a�\�^�k�\�u\�h\�FQ�r\�{�f��\0	�3U\�a[�U\\3\�\�\�]*\�;d�b�h�Jz�b��\�FrM�̼5<7p��snPX��\�]�C\�Yz~����`H�\�(�\��\0J\�b�\�*r<�^^)\'&\�c)r�\�-\�D�\�\�\��J��pY\��\�\�`Mb.fH��6+����$M��LӴ\�1VQ4ܞ¢�T�[ؖ�o\0��\�݆������]�`\�{!X\�P1	��s\�*��\�Ðkz%\�y�G\\�[�g\�\�\Z\�\�y�\�\'͚�%���|粜�Ϝ�b\n,��@s�W��R��(-\�Np7��	�G�G����\�(�r ��\�U@\�f\�\n¦!OdW\�\�#\�<gr��)n\�My.��\�inD\�\�b:W�x�\�V��C�\�.�8.F#�=k\�5ok:�\�è8D]�+.b-t(q�\Z�X`V]K��]L\��h��:\"FGZ�O�\�0\�m\�\���\�����kؾ��L�2�=\�\�\�r���\�C�\�L�\�\��\�\�P�\�}\�\�=\�a�=��]pp\�Ʀ\�:\�\�MF\�\���\�0hvo+�\�|�TJW.\�ޝ�B\�\\Α��~��S^���\�y�\��\�x\��f�mcW�\�.ZY�ݓ�\��\n\��\�X\�l�u���{��\\�\�4�\�\�5�R2m��Τ�\"\�2�>�\�P1��\\\n�7x\�A+\�E3\�$f�Ns��n��L\�Z\�}�Xy\��5\�~\Z���\�\�N���=\�*�\�\�,<d}�e:\�F��\�&�\�y\�=\�����IXܱܸ\��5�%�޹\�9\�K�:6vg;\�-=\�\�\�\�2}x���yb�NR>�\��\\\�Y1��\�l��仁IǦ	�9�\��8�Z\'P3�=0k\��=��o1���޸!v�\�����=;S\� �v�t~���O�Ea8��Eoc\��g8�< �<V&��Ay�n@�nǢ�l\�.܎3��k�\�%��i%Ä^�k[V��N\�\�h8�ɭM\Z̓\�Z�\�Vj6MX\�\�WE(\�s��\�2G��v�;=\\��\0W)\�<`׺\�bT���\�-.\�vȌ\n�q�t\��O	\�Q\������\�	[C\�\�\�MsX\�g&�\�\\փ\"���m�\�c#Ȝ�8�e�q�iY�ߊ	sZ�b\�\��\�N)㸧d�9��\�\�\�5D\�\�h$Ҝ\�I4��=M\07�\�\�s�vs\�\0z�\r!F\r/ip!��`b�F0iq�t\�!\�9���\�\�	�=s\�4sϭ!`~�?,S�0��?\�4܎��zӋ����S�d�c��\�A\� u��\\\�\\1\�wG8�	N6�O\'�0�8ܡ�w�<i\\��!�\0ԧ��S\�)s�c�\"��÷5A�\���8qǡ\�\�v\�\�I��ʜ�sL\�\�:\�\�rs��\�\�0y�q\�g��\�\��01\�L$0\�=��~S\�j`\�Y�R\0\�SP�;b�&F��i�ʎ�h&\�,\�\�zS�l{\ZfM>2{�)�\�N}qK!s\�5\\rݹ\�J\�*2G�=\�j�@�<���\"��O8\�OV\r\�\�o�]\�y\�3Cs&\�\\�\� ����QF@b	��A��r}j\�N\���\�Gm3BN\�{\�\�ch9<\nŃ;��Z񑷧n=�q>��\���\����_�#P��z5Ӑ��+]�\���\�d\0�\�ڽ\�K��+�:\���|\Z\�m\�\�\�\�\�\�Hu\�`qX�I#Ʒ�c\�۷���\�_7YX\�w?�9%�\\�\�\�~:\�tFL\�- �!��c^�j*Tk@�(�\�\�\��_z�Y\�W9������W?yv\��\�\�\n\�&ʹ�%\����=EX\��g\�\�J�#\r\���B\�\�\�\'�eȄ~�\�v0[D��T`\0+��\��8\�\�\�M-\�Zi\�[@�\��m�հ�:\�x\�-*n\�\�xA,Qe3\�նD+�c�!E\�<�\�\\�茓p	�QQJ���MVf\�zP\�D\Z��L.�ݶ�KQ�\�\rA�0�F�z�^\�4,[H\�ׄx\�\�\�@�\0n�F �\n\�\�:��\�\���P�V�-_\�M%�w�-\�(ǧ��>%8��<\�5��	����j�+Y ��I� �v�\ZQ>�T\�?B�D��\�\�mբ8%k�x��:ջM%\�$®s\�Nsi$s\�J\n\�\�y�Y���S�\�zg�t��[q�3��zWe�xv\�\��wc\�\�u\�F�\n�0\�gJ\�{�&+�\�\�+C��L���3Zi����a��\����C��W\"9;\�5�c#�|߫x2\�\�V��#�\�,q\�}p�v\�{W?�i!��as\�ֱ��ՙ\�Bn�����3\�\�\�Q\�9�b�t�d��HY��\Z\�e�\�\�\�L�\���\�\�\�G�,\�ׇVЛ���8�EϺ>�\�/⾳�Dl�sP\\H7��;\�Z�& ���=릐�;�\�s3*��94\�RE��lh��Jp8\\V[!z��\ZE���\niE{\�v\�Y\�_.�\�5a*D2\�+\�\�U�ݠ��O\'\�Z7�~!\�Y\�rcBv���20+�AYhyn��z\�Y3O&wH\�<�j�\��Ԡ1ϱ\�H�y��\�\�ZH���2\���\�\�\�_\�#�^\�¯8\�\Zi��d\�\���+2�S\��WKk\�K�O&F2D:+s�\�\\\�GP2y464�z�����x\�\0��\�z��Ġ8l\�\�Z]\�\�\�L���^\�ᛰ \�8\"��+�M�؛�\"��^\��c��#\�X2\��։J�\��hҥ\�<\�@����~\�\�\"��x���N\�ᰁ#E\0��\�Čt�\�q^�\Zj*\�^��\�\"\�\�J�(�=�W�Q\�(\�Hr\r)<��\��i\�3R�S)1�޶\�m\��\0w5�5��\Z��\��\�޾��\�o!��J�`K�M\�w���q��\��Y>zuOy��\�XfA��f��<%fXj!�\�1�	XZ��쬃.�\�;�^t�g�\nm��\�;\'\�5\�*\�\�46֥]\��\�eZ\�\�|ou0)j�Xa˞I�h\�-\�1\0�N[tѺ��\�\�\�ؔ\�=Jzս:ѯn \�<�V��\�\�\�^\�#��HOR+\�<-���\��=\�I\��\�+��\'R\�6#KK[^\�a\��YX#H�3( �\�n\"tB;\���(UQ�Se\�9�Z0Q�G\�W�\�U�\�Vx7\�H�Y���F��1Ԋ�_\r[\��7�rI���;�a*@`r1���B�I\�\0�\�0=+\�\�Pj��\�\��lʚ\�K$��m>\�\��m���2���gX.-\�\�h�w\�D���.j�~lQ��4\�E6d��\�mS���DX��Vt�\�\�\�\rk\�Ӛ�O\�#N\�g(F�\\\n\�\�MB~G~��\�iӎ�>q�5ؼծdU\�\�;kd,�z�gw-!\0\�\��\�\�^]O֡\�\��H��h�:�\�% {w5�5����(\"J�C\�Z��\Z�R�\r}Imx�V\�\�rA\�a%uG\��$*´%v\�%��E��3�#5	a�\�\�W�l1�W�h\0�=k��C�g5?�&���8=Ӓ�Wp\0ޓrY�u\0��I�S\�\�\'\�\��8���xUzsY�\��\�.K\n�\�\�\�k�J7\�v��\��O�H��e\�(��\��ɷI+�\0\���Wx�&z*\�Ԝv>��x\0\�\�V\�\�F}\�ǋo\��QӢ0Z�c}B\�C\�\�dc\�A5\�\�\�2K#�\�s\\V\�\�=��kg��M�\�U���\�\��GS�L�\�<O\"\��~~s\�|�kw-�\�N�.�I\�\�\�׭\�\�\�u�m���\�VU0�ڝ\\ƝGi\�\Z\�{\�\�Ҵ�8\�\�T6}ꟍ.�\�n�È\�X0�s>&խ�4��l\�\0���^%��=�\�\�q\�;W+=h��}J�!�\��\�>eʯ\�v�\�^\Z���|�{�\�T\ZdcR�Ÿ9x�\�Eh�U�\�\�\�-� �\�=���K\�z2�-��\�fV\�H�W\�+ҳt\���\�\�N|\�^W=jσ$1M{b\�\�1\�qUtu:����\0�M\�}y��\�\�l\�:�\�k�\�\�獼�9\�ڨ�ɥ��wk%\�sg3�n��O�\��nJ{\�\�n\�U�xu}�\�P,\�\�89�4\r���\�k�e�PJ\�T=��\�b�\��7B��o8;F=���b�\�մ\�G$�gA�R\��V-4�I\�\���\�A\'�����˝f�A�h팓\�6�\�pԳ���o\�;��\�\�\�\�\\�\Z܏�׶j\�\�RQ䤩��]f��Eo��9���\���9���\"s�v9k�T{oXa�`\�:\�z}ֳ�d\�Enw[^�\�۰\�7/P*͜2xWV}6\����#ٿ���\���\�}1�x���g\�OU�J\�s$�L_�L�7\r�5+\\\��˨\�T���:��/�d�\�A\�?�`\�:v��\�-�ސ\�Tg\���b\�\�K\�\0\n��/�����\��{�c�\'�\�\��Z}�\0�\��\0\'�^\�V\�a��N���x�\�|L��\�\�\�U\�gJ��v������\\�^\��\�I\��\0\�\�6͢먫&\�,��ٽU\�]\�\�2��sJ�*@�\�L{D�]�̰��\�\�ud\�yo\�@\�}Es6��I�E%��Irw}+2\�Am{\\\�4�2�\�\�L�\�s\�@\�k\�\�v\�m�P\����\0��\r	�\��>K8\�R�M%$\�+K�q��\0)\�\��5\�\�����찌�+\�\�\"��\0\0�U�\�+׽�5ӗb�%\�	�R��|�)�m�H\�ʝ\�j`v�\�F@�u\�\"�\�\�\�G��yy\�u^�I5E�X\�D���3�?\\\�J\\\�k\�>\�+q�LXy\0�j\\[M#jN*i\�]&2MZ\�Xb�A9Ĝ\�\�1�A�1t\�%�!��\�:�\�\�SFE�\�\�:\�&�`~#��&Լ�Z\�Ւ\�\�b�~V{`��*�\�NK�>\��\�8�Q�\�iIh����\�1\�G2���ea�á��\�xƛ�_蒁咄��?��]�\���t�I#�N2�W)��\�J/�w\�&\Zh0\����ָ�=_Y\�\�g���31%�\�\�a�6s�3ֽ�\�Ɓ5����=�N\�}��ta\�J�D��a�:9vm\�2�\�_�e\���0J\�\�pLxs\�+\�u;�x�y�\�M��lUۻ�k\�k����\�<?��\�#lV\�M{\�\�#�\�B���Ok�Quh�pZ�#�o�\�+��-�ri\�,���~\�ëki\"\�QDi�1\�@9&�\�\�\�\�\��x�Y^�lZ���ԛ2\�s,=�F\�UW*]�s\rSg\0�\��욙\�烜UrH\�\�\�\�(\���6\�dV�dr�*�.�\�j\�Rr�d\Z�,\\�\'⑬K	v|���z�\�\�nu	�\�-˖]\�^��?���\�z�+mb|�:zW��\�R��\�=,.u_��� \�b�4�v��@\�|�s\�\0�G\�+��U�b\�TE�\�\�$Y\�� �#�xX�\�(r�t\�\�a�ui\�3泋L��[E�L\r(�\�g!�\�}�E���ݱ9\�}>���_x�\�!�!]�[}����p���|�\\#�qg\�\��T��Z.�\���u?Z�s=���\�\�9H�f>���gN�،F�����5kP��\�~\�-�\�]¢n\�OE�r�rR�Gr�u#u5c��񥦯h����dS\�\�\�ԁҹ\�j\�\�\�RDr��;q�+��\�~\�\�y��iTnXA�G|�x���\�\�ڕ\�\��R\�2��\n��_A�Sr�mi䳹P�Q�\�ovUv\�1\0]&��Ϥ�,p�\�\�\\����2�\�\'���q���>kU�;�\0j�yC\"�=B��\�\�v\�!���P��s�\�U{�\�cn:�sXMFvI�\�fꚬ�/˓��\�\�,q�T��=)\0\�Z�r�\�ҧE$�u\�ڞT\ZnA\�`l&{Sy\'�i\�\�\�s@\�*��^@\�\����\�� �i�8\�H>\���gE�{�d/�\�\�\��J\�\�9픞\�\�T\�py\�z��u+��L�Q��#c\�i+�J\�t=<\r~Yr>���;�%�\�摻`W�x\�P��\�m\�\�@U\\�\�g\�R=3O�F�l6\�\�0�=�\Z�Km��A.\�\�\�\�VT!i\\��\�J��O:\�\�F:��;T��Vy=Cj�yu�Ml|앛>��=\�Zφ��$_6\�yr)9㱯S��\��%\\\Z�\�%�\�z\�\\�\��\�z3\�{�Q_]\�\�muS�\"Ȍ��\�F^Ɠl\�Df�\�3V�h.�H\�\��\�\Z�\�\�>�Я\�&C,2�!�	=z\Z��N³����Q\�F��\�dg�j��S	�3��抚f�g9E˟Ry5ӿȨG�l\r�\�\�8�j����YIsy2\�jIv?���\'&k(#U\�܇@�[W�L�9<�cW)܌��\�|Z\�n̐i�!9Q+}�\�\�\�\�]N\��O+���,Nj�X��mki����r\�\�\'\n>@+�O�\�3<Ո��\�-\���,-�\�\",�\�\�\�?\�v}�\�7\�\��\rxG\�zR�q\�ҋ\\V\���<]�\�\�4�S!��K\"�*\�L\Z�[�R�\�\�\�\�3�A�}܏�y,rI�\�쬇!� \�Ai�\�\�b1�\�W-jM\�o)\�Q�\'\Z�Yu=�L�DrƉxv\�07�\r]\��ܟ1\\:(\�\�|��+.Cg5\��wZ�L�\n\�|��WH�ģ\�#ޯ��ZNT���D\��W{����! ��\�+��\�u�L���h\�g!@�Y~(�I�\"�]\0#\�\�m\�=)��79��>����\�աJ�S�3;]+M[;t�(3Zr\0���U�P\�*�\�\�\�\��R���u{\r��\�3��1�\'Ҿc�\��vV��v�\�\\���b��(x�[���\�\�V�\�?y�\�7\�5�Ng�8�\�\�CJe��q��21NR�֝\�b)v�QSI\�	4�@=\�!�)\��wŷ\�Wq�\�\�hpwW񯠬58n\�\�P:�u\�\�׳xZ�\�\�:o@r�=kZr��\�\�ѷ��\�~Q�J�\�\�\�o>�,a���+\� ��\�q� \0�k\�ONf\�n<o8�5S،2�ODr{iA\�5\�SG^I�H��vA\'$\�\�N\0�|\�m���c0\�*s\'�kJ\�\�ڽꆆ\�\�H\�c\�K�V\�\ZF[&\�L\�ޓ\�A?�5�a�`\�с�y-\�#�R))�\�\��\�Z!\0g�.FN(��\�\�Y\��\�Ė�ż��݂=�}��9�\�\"zھ+қn�lA ��8��<<\�\�0\� �XT*�\�\�A\�+��?��\�&S\�\'�k��\�?�\�8;�p\Z�t\�(#ɛ��\�\��ð��[;y\�1\�+�\�\�=��(\�\�+\Z�I�v\�\�Z��\�\�f{F\�y!}\rr7Pk:	\�\�fDQ�\�I�kݜ��\�\�\����{\�3�;���Q��Q��x�W���?;���;{W�E�\0-����=\'S�\�\�O\�6z�½o\��m�\�\�Ү��>6w[N��i��fH�pxj\�-|}�\�y�|Ѳ&D \��\rb��h\�LF1߽P���l��Ñ���yNn\�\\���\��t\�y\�؅2&H$s�\�\��G\����\�MӠ\'��}\0�յ\�5ą�\�\�I��P��\�Ƥa�\�N���_%G�jQH.�R3\�\�+~\�ƚ\�,<\�̣+����0�4}0%\�8\�\�ڥ c��5\�<kk{\Z	0�N\n�+���)�(\�s�\0y5�8�\�\�ѡ\�H曹A\�M\�\�\�\'<S�\��\�9�CBL\\�������\�CO\�\�3\�IHP{�v� ��旧9�>��KHN)�(n\�\Z�5\�P)2�ܓ�5%$<�\���\�%��U\�V\�\���\0��\�3��\�\��MO_�ԥy�$�\0$��i\Z.G\�\�\��m��{��N>V��t�eطK��9=�|\�\�3?T{�\��\�2��\�}e\r�r�����\�YP��9����\�5�wք~(\�W��l�\�\�G\�亣\�]���R\�\n;W�\�\�%B#��\�͟\�^����\�R@RPN�c7E\�uE���\�w�c�~c�\�\�M3\�\n��{��\�\�d�\�0\�\'�2*%}\�\\O/\�=\�&\�`�x�u�������O\�M\�c�\0�H�46OpsRg�9���r�҆\���;\����_�8\�Y\�\�s\�z������\�j�C*�\�\��ך�o�B\�FzsT�\'�\0�Խ�\�4X��6�\'�\\PH\�N+6V`roNi\�2\�\�JSPӠ\�P+;�1\�\�����06={\��6?x�#&�\�4e�\r�QQ(�\�z��\�}wP�XS\'֡��P�u=\0\�JH$c\0,1�\�+�Q;\�Lԉ��c��V\�m�2@\�ۚ��9\�lt��9;\"�>��8������\r-��\��\�bk���yg�F�GJ�b���n8>潪������f��\�\�u���޹�%�q]e��+4[8\�ȩa\n�ɚ�\�\�P�$+���:�[DqК��1�XOY\ZC\�ww�z]G�V�\r.DC=�VӬ\�\�.�*���Ǡ\�VP\�@�t��=}^\�.&��V[�坜P\"� �@��ڸ\�\"2��=EZ\\פ��\�\�wd��ڀ8��F;Ӹ\�3ޙ�Zt`i�8&�q\r\�?J��&\���R>*\�`z�qL_\\PRC\�:w�\Z��\�er+X\��\�\�*&�6��Zg\�>9\�N�\�A!\�c�\����-������}#�\�v\Z�/\�H�s\�+��I\�<>\�{y\�/ߨ\�֡*m����,m<E%NzL\�l\�i\�\0\�\�ze�1 U\�k\�|%-�\�\�hұP\�+\�5�Gq�\��\�Vl�sIr��\�(\"�Q�<w9�@�\��E?��f�i�X�\�J��{U�B��PЏ�\�SU�wA�U�W\�7Ki+G \�A��/\�\�\���\�]!4\�p\nZ��f\�\�\�}>G��mP��<�\�\�\�1Mzޕ�\�}�Ex�lך\�\�\�͵ґ�\�\�yvg\�֧\Z\�\�tz^�w�+y$�+\����\0S\")%�Ur6\�}Mz�uO�q8.�\�\Z�\�19\����-O�\�C�2q�U���\�c4\�PO5�m\n�q�\�\�(�Კ�O�k��\�n\��A�\�=N{W_\�\�\�IW�c^��豐��¹�^\�\�\��o#\��{�n\�	\�qNxnH\�\�@�\�\��*�\�~*��\r��\�O����c_�\�u>g:U����\�\ZŻ\�Z%�\���\�3A�&<�ȯ8\�t�\�&+(\�7c��U­ٌ\�r�l�K}\�\�zg��v�H\�k��Iy%@\"�h�<W@\�kIkQ�j#\�\�\�K�\�z\�S�Exǅ5 \�a^\�k.�\�PvguEs�\�.�\�s\�tc�y\�2�2�\�Mw���+�q^�\Z�\�g�<<]\'�-�?Zx\�F)7�]g&}\�&�\r)�p\04ӎ\��1��sڼ�\0\\�\�\�\�\�T�zƥX�jΪj�\�hF\����ֲ`85�&�\�=Jt��C�\�\�ǎ�����O\�\�qש\�Y\��ӓ����qUI-\Z>\�%\�\�\r^�e\'�]�\0J�\�u`-Vl(힂�u\�iv-q{�.W�����yՎ�so\'\�;\�}�+�\�l\'\�\�H\�3;pI-QN]\\\�\��6\�*($s6�7W�1�[\�/�\�\��\�k\�|)�\�\�\�,�n�3\�v\��W�x{\�\Z\\q�į6\�\�\�\�p��\0�^�*ͫ#�\�+kK\�a\�\��\�Q<�cվ�ЬJ�h\0R�z�\�IEY+\�\�n�m� J��u?$�i�j�2)�d T\�\�9�Bz�\�\"�껶x5\r\r6�h�*�0\�G\�\�\'��(�Ӄdd\Z�3楌�֦\�؞�\���^F\�\�\�KeE]Ͷ6>\��Gčl\�\�%��9\"�\�]��\�\�W��I��\�]v�\�n\�.�v\���\�c�]�#\��k	z��֑V^�˚U8\�wm�\�B\�\�մ��\�E2��\��e�:�\�m[N\�j�� �\�^\�\�A^c }��\�\�+\�\�\\�\Z\� m5�է\�\�G�\�^���s.�\���V�Wi�4y�C,�X\�-֜�Jί���@\�\�\nNuu)\0W��|�9O�]�� ��\�/#`�\�\��$�W��H�\�m�᧐p3\�4��\���\"\�\�Z\��y\0j��[פ\�.��\�!$\��e^\�\�w;\�3fl\�,s�\�5\�)�ӥm^\�\�ܓ@~@#84\��a\'&���DČ��\�~�sM\�1�f��T�n^�\�8\�O\'?\�Lʲ��ѵ�\�\�ZN�\�\�AF{��u;9u�\�K�ʎ\��\0\�WK\�M�\�B\��\\ýrW����g��\�J�P��[���<=�]WQ�f�H��\'\'\�u=FŎ>s�UE\�\'�,n\��[��Ƭ\��\0�x\�	\�\���֏���+Y�Ӽc,L0�1Ǿ\�~�M�5�\�?$�s\�1N�D~^�a2�m�?F�<\\\�\�\�\�I�\ZE�\�\�_O/^\�nNv��\�R��\���Z<Y�߭a��w\�3w�[ő���:\�Q�	�L�\�b��lSëG�ǘ���y�pk��|�\�yn��\����+{\�j��(+�ܳW;\�.l5K-B\�\�ys8\��\��\"���]ls�N�v��ړO��M\�jٺ�\����t�$���l��\�U�Wq,6�E\��\�\�=��\��o�t�\r���^�e��� �\�\�-�͈\�Ӥ��\�Gi\�6��\�V׍�\�\�\�Ol�k#P\�C6�:A$�,d;tʑ�^A\��7:���k��b\��{\nᎫ~�Gڧ\��\�\�>�\�4�zL\�|�NV{������\�\�i��\���\�\�\�E_����\�\\\�\�3\�֓1ټ\�ۚ��9,9\�\Z��ߖ\�s\�k�h�0�oU\'\�v}7k{�x3Qg���߆хl��}\�\�LW\ZaC�\�M)\�n?0�z޼B����@��W6\�\�\�\'\'ou�[\�^\'�\�ֲ\�V(𯕁��ޞ�T�\�3W�W5��S�FOXUQ\�u=�\0�\���b�[��A僌d���	�G5���K(6���|\��c\�&����H���%96����M\�\�\�do��\n�><C\'\�u��#\�\�;*s�+�\�ݞ:��O$��{�_��G�b\�\�v$�5�},E\rf\�_a\�rO�=c\0��@��:�z*sڹ�;K�F�\�\���=+돂\�Nt\�n\�S�|)\�p+\�x�䃝��}����X�SJ���\�\�\�}ۚҚ��N\�:�B~\�\�9u��\�W�\��]J`Ԣ>_�(2)\�\�\�\�k\�&+\�c^s\�94\�a+^O0�a̍�\n\�iX\�R|\�\�å\�>�q��d)�<�W��x\�=+s\�\'\�\�a���\�7�\�xR���\\������-)\�\n0Q�	\"�oNN��b\�~��b���\�Z\�Rm\�9\�\�\n\�\Z��LL��֖\��{�\�aa@\�W\�\�	|Cl5��E�M�E�\�\'`z�_H,\�\��\��\�*kݳ\�|�{ZU1��ﴆ�W\�99���V�\0RW\n+�F\�\�fy�\0\�;\�c\�\�¶֝�%�k\�\�^^C�\�\����z�\�sef\"0d`=O��\�\���,�\��v\�N\�\�f\���2V\�)D�\\犁�l�3\�L�^����9��pD�\�@RO�\�\�\�YŖ������[Xdv\�(=뀹�k���\�8¼�\����u�\����\�\��\�\�u��=\�=;(�c�\�|�ېy=����\�W\�W�:�r��g\�ҥ\nQQ�RH�\�\�\"��g8<�*�\�r�{�G8\�0Ӕ\�2�4R�G*H\"�l�\��x�\�\"1\"na\�P:�\\�jPǹ�ʞ\�\�5g\r����ՋXin\��q$�ڞ�����\�\�!=��\�`��\0by\�@�z�潌*J1G��ro�C�^�?�\�V��5iq�G4�Ў�\�\�q\��y\�dK/��\�Y���\�095�P��j\�\�C�\�S\\��\�6tᤜ\�qH\�)�f�xX�\�O�H5\�\�\�^\��y\�Q\����Zn\�zx҄\�\�\Z��a\�ֹ\�4��Ҕ�\�A +�9`\rDѰ\�1^��I�љ\�d����\�k6�\��\�*y\�;{V~\�=;�S�ɵ��!!�0)8�Y\��:-�أ�ڤ�\�\�6�\�O�8a�z�h�\�R=_g\�\�\�\��\�\\\�@\�\�\Z\�6.�n\�R�g*R�\�\�+�+WE�\�VVte��\"�֬x#�\�f9Cd\0:S��t�\'ٞ�iqd�%\�\��D\�qG��թ4�a\�-{2 �\�i��t V�-�F|\�n�\��V��\\\��#���V,\�asج�\n\�I�\�g9\�V]GZ\�/���{��:7<p\�\�+�+����oĭI\�R�C\�B�9�\�ؚ�B\�\�\�%�I	2�?�\0^�\�+�wfTm��^�\�??�gK+�&��\�u���\0sּخFi�Xld1^j��\�I��pCeA\�\� �\��\�\�c{�\�\�Z\�3\�\Z�T?T��A]\�\�y�^��Ts\Zީo�\�]^Lv\�\nonٯ��Q\�mOė\�{�;�\�\�A\�=k\��3\�,�\�iÂ�X�\�q_=�I\' U\�\�\'\"�z\��R4\����\�Q�Hy<Ӂ P+\r8\�\'�z\���q\�U\�aGz@✻�I\�\�)4	ٚ�7\�n\��s\�\�]�#��6Goz�\�Y�\\&NA\�rק�\�\�\�8\�)�)���\�Bc�\�\�8.=E}/��f��\�P�\�\�VW\�Z}��!]�L\�}:��]>\�;[H��acL��)\'s�9�Eo{�\�\�x�\'ź\�h�E\�\�<�!;�ƺ���j��⧊%��4�8�	%��\�\�d#s\�I#\�.\�$��\�F$����^9��RH\�W���lN�6d\�*\�d�\�*\�Y��T2,���(\�?�vZg��\�F4-\nE\�|f�U#v\�!Jsv�<�\� eA�\�x����\�F7<{��f\�|7��,.z��5�\�i�7��~ǋ�M�B���k��#p=\rrWzM\�Ĉ@\�\�U¤%�2�\n���љ�R����}�4�pE���\�^��\0�^Y�g!�O�Z�/����\�n8�\Z�\�w~K:�\�>����\��&��\�8�Ö��3?0\�(�\�\r\n�(��ĉT�<֖�g-��#cP\�i�7s\�`\�d�W��wF�\�5E@\�\�^���՝�|,�K�%�\�m\��,�\����X\��ѱ�$*1�G&�\�y3�9\�\�\�*0���\�\�Xo*0����j~�\�fD>�ױN�B+���n3�҄\��\�BKTx��OY��+�����\��\�^��\�uk&\�\�\�:\�ՙ\�b�ʞ������[�\0=W�_gx~\"�P�tQ��\�)֭w���S_d\�\n�l�\�V�\�X#dR\01\�L\�Nr9�M�\�9�Jq\�*2�}sL��.ˍ\�L_4x�v{\�X������;Qb-e>�M|�⋃\�Æ,x�\��ۇ��d\�w\�\�\�	-�b\n\��)n\�s�!�<�ޣ���-Ƿ�@pMt�C�^U^�@\�\�\�9\�)�h\'<\n\�㰙�h\�\�I\�r:\�E��8\�\�):p(�\r��\���/��~\�L�&��婭\�e�l�\��i	\�\�EMy�ZZܬ\�su�*}�\�yw���{\0F?09\�^���xl�+[�}�[L�\�:\�%q�I�O��R�/&�H�\Z�C\Za��\�o�A\�2\�\�\�[B�;���\\��	�_�./�\�\�S$m��\�\Z\�\"5�G��I����$�*�T\�+y�#e\���\��\�\�\�Q\�7:�\�\�3\�A�c�~\�w\�i��3�:Q���^�\�q�\�L篭j\�\�Z|\�$gk#�E(<\�ҕ\�\�=\�K�Zj��U\�\�+�N�ֶ�\�Bű�\�W\�V\�2[J�F\�Xs�⽓\�\Z��A��\�Q\�R���A\�9\��ȩ\�$=x���\�\�m\�\"�Cs�g��0Ls�f\'���w�NA5R��-��2�\�\'�s7>\'�BBN�1\�	�&�Gf:�\�{H3\�y�ם\�\�k]�-�[�5^OX2Hl񎔬W+\�zN񓓊��Nk��\�vW�\�[�x�WI\�R`�g#8��I4Ya׎��㯯4Ǔp!0I\�^��9�\0\�ֆc�!�GS\�P\��\�\��\0�8+g��?�0\�vO^(��1\� �\�\�\�)�L.7`�<n�JG\�I\�`t5%\�F|\�ۜ�1�\�\�MjX��F3N3\���8#5z\�o��\0\\�;V3��m	j^� ���	\�jƈa�+Z<0\�\�W;G�M\�}�K\ZY͸\�\"�l�	�\0�2j��u�C=ZY`vn\�B�^�@\�z\�]\�s\�V�\�\��\�NEu\�Db�\���\�\�k��~J�Ks\��#]�Ղn\�\�綶�:�\�\\�>��\��\�x�\�N*焧KI�x\�1�\�Vi\'R\�\�UI����JҠӭ\�$o\�>��I�\�,E>P�gNX^\�8��\�֛\�w\'i�Ny楎\�Kج&.{�SDB�#��iccy�\'�8hdc�mf@cɭ9~��L��\�/9\�B�sO483�fH�4\�\nD[@\�(\�F3\�OL$\n�Z*H\0y��\�\�]�qǽz�:\�g�5��\0�<Bu�ȼ\�l9\�qڸ�IX�r\�5\'UIm\�\�C�0g<׹�\0A\���\0���m�\��\�^�:�\��Mfr�v�hN�\��G�4(%y�A�\�<�KȩF1Q�0\�j�\"��\��9��J0)�\�:�\"�\�\�>�XӤ�0\�S\�^���s\nȤ6\rL�\�&\�\��\�\�\�\�\�K[�\��c��n\�\�+�!�?,g�����\r���\�D6O$8\�+\�\� �r�=+\�\�\��s\�g��9^=נ����\�W\��c<�\�&ɐ�\�:�\�_K�\�8����\�k�����9H.W�E+#�����[�\n��@\�41\�\�<��SI��\�UU#&�\�E�[x\�1>�\�TiY�z)�f�M.\�\�*vp;W}���é\�YV�Ѳ�\�3]v�h7�J\�G�ކ��1P\�n��~u�Ѩj���@�3g5�B��\0\�\n�r�+���[\�ݻ=�W�kr\�O֥n�\�\�\�\�G�\0E.�j�\\oa�\Z\��\���WwZ�G\�Z+�\�ܾ�:\�=I�j#�8&�\�H�F�<W\�p^ \�q��׬\�\"�H\�3\�L\�6\��.�7=��\�kgG\�r���\�\�^d|Gi��j}sY�\�8�9�T/$�\�WU\�\�?\�8�}\ZޠyB������Ip���9�\�O�F��\�d��G^kӌ\�G�84\�\�%\�Og�\�{V=�\�N��=�y\�T��ۥ7+\n�<\�Ǻ��\��P\�U�lq\�\��B\�\\_�q�w\"�\�A��WUl�\"�xcX�\�m��\�E_@OZ�y��{�����圩{��4�!\�m�\�N��~_�|\��:f��\0x�5ɊF��\\�\\4Hd|��QNi-�ە`凢\�=%.����ɂ���ɯ�<\�حm#�x\\��c�x��􇸻�q3g\����Y��Bc\0c1���T���<<�\�J}\�̀Q�j�\�)0���\�\�\�a^���rM \n�5\�Ń���8�>��Ю(\�\Z\\�L\�<�b�b�b��S���\�\�\�Զ3LrEf\�y\"J<6O5ovqY�\�D\�9��\�O*I⩒zVW6H���\�QJ�S5]_\�U;\�x\nMD���(sI$x�\0\�?37أ\�[\�׆j��m\�;k\��Q+Ox[\�ɯ3\�\�5\�\\f�:�曗v~���6�\"��ߛ2@F8�+fm\�\�+5\�0\�\�[���+3����i\�i�\�@\��C�t\�-\��Z\�\"+>��䔮��Q����s�Z\��\0��7:w�\�^q�\�N\�F�)\�#\0+\�OC\�%\�\����\r��\�\r|9\�mZ}W]��b\�6*�\�0k\�?\��\Ze\�g\0%|7��\�V\�\�\�\�ez�X�3֣$���\�\�`yX\'\���8���Q@\�5\�)$vF\r�Xm�+Pt5\��lM�0\\	\�\\�\�qoK�\�\�\rd�A�\\\�T*Els}�4\�Eh9���V�\Z\\\�I0C�p9\�T\�E\�\��G3�\��akHXO�\�S\�\�I%���1\�S\�D�\�Q\�\�|gl�\�\�5l��;qP�e\�Cw\Z�\�kҵ�Ӵ\�K塐/����]�\�4�\�R�μw\�n�x�83.+\�5a�[Ҕv\�^Me\�6���\�΄$�\�#�vN���\��|\�?�	6֋�|\�j��G��\�\�\��\0�S�nr�z�����\�׉~M\�g�\�b��*\�-gPi�/%4\�(�ǘ�}\'�x�I�*���⋛��\��\�(\�Z0���X1hW�\�\�Һ5ӭ\Zk�-���\�����\��P\�\";$���\�!}G��:nrH\�\�\�!F��v\�9�\0�\�\�\\K[q���2�\��\�\0ŏ&�u�ic�u��S�4�>:�j�\�\�7vƅg8\�j8�}�+E����\Zx\�֗q8\��)W*=\�0�\�S$C�3ޭ\�\\\��Պ�\�\�Ҫ\�<1��\0��4\��&G5��}*�\�\�U\'\���}(��\�=E~`#�3	 ��G\�rck����|@o\��M\�Q�]�\�\�>�\�F�\�\�Z��h��0�:u\��81ZJ�c�����\�淊?8\0\�s\�_b�Sv:,8�(�\�\�q_1k!g��\�|g\�\�WY]#��jr<�X\�*0pMD���\�x����6�*���s��+�\�E�1�\���d�@p�>_�gҾٻ�v�\�\�\�\�6\\\���8\'h��ti\Z����;�vc\����\��ޥ#\�3�A����e\�)\�\�\��\�s\�\�u��\�\�\�n^d\�\�׎j��\�3Mu<�l���\�Q��iZ5?ǁ\�+9NRݗ%�\Z��9�AA�g�m88`~�\�Tl�\�\�]�D%\��6\��\�\�}�\��3�;\�\�x\�n�\���nF�\�\\r+\�!�{YVP\�\�{��\�j9s3�O�v&K��W�\��<U?\�^!ops&\�º�_Qv�[ \�c_\�~ ��\���W� \�F\�A+ݼ�\�X��j\�\�ZU6��\�9\�]\�i\�SI\�y�\�T�$\�\�ՙ\'�I�\\\�\��:\�2�~l\n�{r/o.& �,�\�L\�V�0\�E}�=!䏇��ó\���m\�\�Te�>`jW��z�\�\�91\�s�\�%T�j�C\Z\�~^շ�>\��\�v\n\�|v9\�+4�牗��\�et�p\��ԕ_\n3�W� ��\�+gA\�\�^c�e��\�\n\���\�#�<`W�<M8�6{԰ujEJ1<\�\�\�*�\�d�N����\�KkTW��G8�7^�%�\��\�X<e;\�vt,��Wm#\�\���gP��v\�m\�\�;n5�7�5Н�慉����5\�\�l�\�iy\��u�\�\�I�����\�R�[\�I���P�]��\�x=+�\�\�/�W0l\�\�\�h\n;ס����pc\"�)R\�\�\"����\�9\�H� t\�}��\�*�H\�\�\�\�s��pѪ�\�\�t���\�m\�sz�\�\0�Ҹ�\�R;0.�L\�g�=\����\�~T��Eɭ\�\�>\�\�2\�q_7V�,Y�\�zN��F���`\�Y�\�¶��&\�!��6]�<ֆ��L2�`Ȯ�\�u,�d*N3�^L껟CK\r#�\�lZ\�\�\�\�yn�ݎ\0�\�if]B\��.�\�\��\�z5�6�x\0zW\r���\�\r޵\�\�\�ԩ��[�Sjņ!Eq�\�r!\�\�0+\��?���$ry\��d\�\�)\�D\�ξ�e\�\�\�/<��l\�q�^�wr�D\�\�T�pZ���(�f\�tў�*�\�t�e�K\�d\��r8m��4ˉ\Z9�\�j(}�3�Mw��2���gd-�B\�\0�\�\�\�\�±A�\"�\�i�}n+%\��WiX\�Ϗ�Y��qY\")cg�\����\�ڹ�\�y9YE�,}#�mp�]$�1�r+\�<C\�G�kA �PR��\�F\�\�S�#\�\�t��\��[<�w�zS/�l�S�3\�z鋺L�kBTjJ,�\�\�\�Ki^)\0\�1�J�?	i�\��\0c\�I\Zyix\����\�n?\Z\�<Oc5��u�K1=\�s^\�\�\�K\�\�4[\\y��\�%�*\�b\�\�\�*D\0\�U�XF��K~Qj��\'�m\'8�X\�\�����>;�����\�{\��yJ;\0�Ó�x5r�Gk˖q�ܟ�&���\�Ω\�=+M�6�)�M(V,T\�}k����Y��\�\"�M�\�\�2N㍯\�\Z\�X�E\�uCVJ�<\�}(��BN���\�@�J��t��\�S�Tl�L��vϥq��}�R*[�\�j�\�R��\�\�\���W*G5 �\0���V��\�el�\�\�\�\�\�\�\0\\g����9��Tcf�Mܒ3RM��\�7\n�L��ۓ�+KK�ɼ�Kmɬ\�\��\�\n̮�q�}i5t\�J��5%�g\�^��v��a�p��\�*\0Q\\׆\�\�\�M�Ev$\�\�\��h\�D\�\�\�\"������\r�������t���X�P\�H��5\rͬ�:�85��4\�Ud�\�\��Bzg�k�J,�jBni\�\��{o�J�\�w�\�N�ķ\�Hbl�kOCТ�0\�/\�\�\�]\�R\�\�j,w?\�湪\�\�\�;hᮯ#c\�^\ZҬ����p>c�נ��B�6\0+�\�\�\�\�Ir�S\�Wio3��	�ާ�J�TRE�eT\��\�X�y\'8⹛�زRY�\�\�D��F�\�q\\~��EuUN}맒($����^	�\�\�7�4\�fsJI�<\�t\�S��\�@��s^\�\��ɜ\�!\�׏H0\�W�B���\�\�h�)4t�\�~\��\���\�B�D�NG#�T~�_3c�3��L��x�>`�|�\�rj\Z4\�u\�ϟ\�l����\���ٴ�3\�#�N�\'�\�倚 3\�\�+�\�m\��s�W,�^\'�Oi�\�Cao�\��\�$]����x\�\�\�g\\\�қs�YZ���s�\�1^|��=h%z�����\nJ�V�h�1^Y�Oot�,Q4`�\�\��Y\�d\Zɛ\�Sn\�\�\�KrZ��c�q��*\�\�\�rTg�+�\�o��ۅ�r\�\�?�W\�*��1N\�<\�\��\�M*�\�y5\�%\�ܡL�����\�Ԭ���\�\�\�\\\�iK��5�<L_\ni�Kp���_Vii\�۠\��\�^�\�[!X��\�\�)�!�Л�8e����:�O\0�b�I���޵F`NF*.�{Ԝ��ӌ\���\�\�r`g\�9���Y!7��\�s�\�\��C�M\�b+\�\�bէ\0\�k���	�z�)�&�{\�4\r·�\�Ġ\���\r�\�V��\�ߌ�v�\�Ve<z\�r@&�\�\0,�lդ\�\�C��>��J\�2H�\�\nmm�\0g6\�\�\0W�\�|��b���q4V�8\�\0c�L�\��TI��\�\�\�^,�\���N���T�`\�^\r|��_��}\�c�\�&\�\0�b\�?̙\�\nI\�:\n����\�X.M9ـ\��?ʬ�f �\�yI�9�<�\�>\�*�\�\�\�\��0Py�*Yks\�<b\��\�\�A��W���<�]���^\��F<�\0:\�\�8\�k&zP�P��Θ\�\��F܎\��r����H�����Ӛ�T?#M1��\�(f�\�Rm+��qޘ ��-J\� ў\�4��9\�h�XB;\��\�\�\�d���\�%k�NsR\� �U~j���\�̚>���\�R\�TP+;X�d\Z~\�\� �\�B��\�Y#�\�\�F0خJk�%}�W�\�O\���\�K\�ڍ�e\�\0�\0�+u@��\�\�=\�\�\�\�TM��֥��1H�<\�S�\����Q�oJ�\ZnI4�\�l\�p��\�#�\��\r�P�\�\"�c�\�6\'V\�(���\��e\�\�\�#v�\�<�]֝�Cy�rN8�㷜�Ga\�]n��f\nێ3�8\�q�\�H\�Bɴ{L{_ \�#�\�pJ��\��\�ap\0\�d$�=;�gܨɀ@\�\�@�j\�\�@��t\�\�v*#q�pq�U�g 0${\Z�\�H\�ȥ�\�s����c3��\�\ZH\�[���\ZԌ��ub$>\�zԉ����k�H�i�P�{�ڞ�	@�K�}+Y\�B�A|\Z\�5\�\��\0��\�9\n�E$�:Wc�*ͱ�\��kў�dC\�;\�$!S8\�Ѩ3\����K@Q\�[H�[H\�1\�\�M\">K\�\�\�\�\��\0\�r\0��Az�`��03\\��$���4�Fi�z���e�\�m�\���\���JR��s�\�Vz�����%l��\�{\�r~Sǭ`\���\�=�Ր�#<��{Z�e��O�Q��_S^\�5h+�=ZW�\�vf�\�xE^GS[1��>F0E|�w�]_\\3	�<\0q^\�\�-B\�\�\r͸g84�bI��m̒3\�kA\�0~�F����үĕ%\"Ҟ*NqQ�	�x\0RZa�`b�	��sAh\05�j�j\���ܬNֲ��6�&�\�^<�\�-Y\"�N:׆Z9�|�휓Z�.\�[Q\�%Pے3�Y�T{\�PGq^,\�:�o\�}�	\ZH�j\�\����#1\�Os]\�5\�xQ\��\�\�\�\�׵G\�^�\�\�\r�f���\"�8j�\�ҭ\�>Z\�{$\'�L*!H4\�pi�䔠�Ss�u�\�	\�j9$\n\rs��\�p�>f\�\�+9\�1Z�\nr�\�kp�4�_5\�Asq*ʩbF+\�5�\0�\�yng�\�\�\�!�\�Ƥ\�\�\�1\�r���+56{�tgF�{\�]�Y\�̤�ˑ���,\�\�{��p0���\�hR�$c��z\�Z\��*?\\\\\�g}E\�\�\�w\�ZZE�\�?\�^�mn8b�qY\�U� ���1s$��\�\��D��с�\0IP\�\��֊�kiʔ2�\Z\�.<����F\�\�OZݶ�H\�UAu>�lJ��2�\�U\�\�~Z�b��A�ĺ�DRTp!2+\�N�ןkwV\�6!�u�S\��I��N!�FJ\�}k����D\�c\�\�N?9\�=\��˫\\�\�\�T6C18Q\�=)/P\�p�I\�#ޱ\�fx��\�;�\�\�N;3N�T+#lۜc5Pj���s\�\0k��\�w�U\�L\�93f]J\�RwJ��\�\�3\�w2|�\�W�\�\�R��\�J��z\�R#r�\�0Tw�����fAu*�V\"�VR�gڮ\��Þ=j�C�οJ��\�<�j�\�W9�eѾ/�ݱ���ف ��[N�V /�j�ۭ�\�a�A�\�MZ洹!4\�SI\�}	wr\�L�K\�I����\�-�����\�\�t�~\����w`ǵo\�\�ܓ�\�p>\�\n\�⠤�B�Z6�o�\�k5z\�W�ؤ�\�\�ww��\\�\�Rq��{\'\�\�!\�f\0(��a_2%;\�\�|�\r2.�\�x�\�\"㠯�\�C��G\���o��\�\�\�~z(\�;V���\�\�0}ER�\�J�Z\�<�h���<TH��E$\�\�C)2}��͞�\�\�\�VV\�2N�:e�9�n\�\�>�ȟT�Bp\\V2�E�N��\�\�;�F\�zוM��\�9F\�\�\�FEF~,�2\�1��8\�\"�\�E5.\��\�\�Z\�Xl\�s]T�\\\�$�\�@N2�8�5�\�\�įK+��Q(9\�\�\��E\��M�\��\\�(\���z\�\�-\�\��`g�\�ז\�ϱ��\�8��#5\�v�؈�\�8.\0\�qc^��\�\�\�\�9�\�\'�泍h\�c���\�iY�L\�CeEs\�!�Xl�����^u\�{\�3\�<(ɨ�;A�mi��d\�q\�ĳM�3^A�m]FTN�\�W�\�]�I3\�I�\Z�Aq;\�[�bMySG\�ӫb4�̕V�\�\�~F	�V�}�*s[���\��mQY�mB|\���۴�\�N\�^�\��q��.I�$\�e2\��{~����N\�~��\�\�޹\�g�9h(_YH\�\'��+\�x��\�@\�*Nq]�>9�/�RG\�\�1�\�k\�ae�p\�w�\�\��!KY\0T�����b)}r9��&�|\�-!gp��פZYBʹP\�\\χ��\�#ɮ\�fxrQ��+6ݑ\�a)��b\�\����cD�t\�\�\n�\�Sգ�K	%��Etz_�P\�\�HI\�\\�\�r\�e�l$VPFS\�Y0xo\�3>\�%��Z�(vΛՁ\�-�.X\�<�\�\��\�y�0\��\�5M.K�T��\�{5���Z��2q\\�γ�\\�tgp浅I�\n�i3\�N��Ge\���r�ǌ�^���P[�|�H\\{\�\�;\0k���N\�x(\�$v�\Z�?gW�9x�Z���&�N�s\\����[=><`\�&��ҡ\r\�1\��\�.i�S鰱\��\�}k\��U���g�\�?\�䶥��\�-�jߟ\�V�?uG57�¿�4\�\����Rt/�>�\�4\��\�A��3I\�\�{�C�_�����\�\�G�Ծ��F�O�i�\r9E�\�-o\�h&te�\���8t\�x���\��\�\�\�\n�\\c\�(\�^\�\�+f�ms7[�\�\��\�-\�\���9,k��\�s\�\�\\]8(�\�1ך�4� �\�Y\�~Z���̑�\�c�\�\�#\�Rl\�1�P\0	\�\�aXӡf&�K?y>_�K�`;V����\�\�\"#\�z��U`͖��<\��\�3�\�u�UH�0E{�xJ\'a�ݞ{U\�o����.��\�⓭E��x�\Z%�\�|�\�\�UnmE��M�H1\�澰�\�v\Zm��#D�NH�\��G�4�v\�gُ̝�\�)ӫ\�+\n�Ӎ\�s��\�Rj��:�\�:\�7�W�\���g\�k����d*\�|��\����\�2FNc���\Z\�\�\�Gѿ/����*����\�x��\n\\i�\01�\�\�޽c\�\�ce��\�k]~\�y<r�5MF=�1�v�\�\�%v\�\Zk\�9\�،w I\�\n\��L\��\�s\�v�i�p�ǝ\�\�=\�sw��L� \�+9E��39�,e\�*\�\'�S����\�5\ZBC�\�]��-\� \�z+&osǎB�߭:H@@��\'�\�]�hG(+\�քi�)6Nk;�UN]�6�\�4݌r\����\�Z���R�\�~�}=�N�\�\�r$Q,����$\�R�uGRJ�<WO&��6\��H�x	�+I}p��H\�\�\'\�\�U�\0èb�0N\��<\�}b�\��u�\���kOI�}:�f^�J0�4\�F\�[\�%B�\�f�\�Z\�Q\�q�^�\�U��\�P�ѫ3ՠ�4`IT\�\"��sC��\�NH\'\�o�\���\�%_mB\�ϱ�}�yó�\�\�%�\�<�8����\�[=�!�8�E�\\L�\�5��\�w������\�\�Q[G5�,Q��Lc�OZ�<\�\�\�տv~���|=/��\�\�m@\�\�\�\�� �>�\�\�߉ᳵ}���=w6Z.�o�\�\0\�a_/_ޓg\�\�%m�\��u\�j\�\�\09�Z}\�\�*E�F �\�[k:�\�%fv�Q�sl1ȮZ�0��\�j7\�a\0�s\\]ݎ�q��\�\����\�j\�)��\�\rx�☮]qэzޯke&U�؏\�ϭy\�lcx���G+i\���rJV\�\�s\�[Z$y��uBEb�\�t�D[D�H7%}+\��Aβ}�>g0����겁���,��))��\�:�\����N\�͌$<\r�\�sZ�\�p�\�h���Ld�ՙuk\�ĞGJ\�\�\�u)4��EN�ِ�C�@�E\�-\�Z�\�F@�?G\�\�\�a�@�=��)�[&�IL�\�v�\�|^1�����<֟F�7l��\��Q&a�E�5cI�e��x\�\�H�P�e\�ÂO�n\�\�*\��U�y�H�aFf�)n�?�ynH�\�if$3�;r@\�_�W	���y�	\0�z�u6R1\�+#t��H���\�\�c\�\�\r\�C3,�lݴ\��ϥtmnU\�g���V\�\�:v�u<�\�hy���\08I�9)_A.\��,�{ƹmM1o*\�)��t��\�f\�\�k�\�+*�	C\�kMꌪ\�\�g�\\��>�*����h\� `0S[v�5ޡs\�\�a��\�Z�\�	58,�����\�W\�5\�:�\�<�>N|\�u�E�A�Ȭ՞ib��\�2�g�nEv~+�[jw1`?*\�c�]�s�<e���\�\�CSծ�\�,��]6�\��64R�vA\�_S\�7\����\r\�\�7\�z�¾Rm�C�\��On��\"W\�A��\�E\�\�VїC\�\�P抟U�r��\�U�[j.s\Z�\�c\�`t�N��Qd#A�T\�\��Q�\�2p\n�>���Yf\��s\���\�^\�`;\rk�Fj�\�^98�AI\\�Q�ʾ�S��ό�kGC�^\�X��\�ƺ@���\�<�4�[B�-	e3���\�\'�Ҡ\�[3��E*�\�v:|~\�\�\�\��\�\�\"/�5\�\��\�n�\�$u\�3)\�y�\�\�\rV;�h�ñ\�:���+�ּ�\�e�-k>8+�\�WUk��F�j�\�w\�*c7�*t�5f�|�\�k�c����O��\\V\�+\�=j�M�R\�\��\�S�ү\\��X\�`\�5\�O��<�\�%{���\�{oue��W�9�q�\��+\�ntm?�%Q\�#�pŲWN�N+��E;\��\�ҕ;\\��T\Z�2��\��j�H#�v���ޣ�QH�\�v��6}s��l �?\�Ӄۊ\�\Z�c�\�v*�\r��f\�2\�c�˹I�\��\0�ymeiFZ&\�\�{ۅ$��6�^�\�\�\�)���\0hTM�tZmǺ<\�C���k��QZ?��}�e\"���{��[\�\�\��μ�$W{nh��I\���ӏ-�8]\�\�Cgp\�\��ǵuQ\�?��>\�z�\�bGj˲�I>b�\'�5\r�tF**\�Вfs\\^��\�\�@�B\�F\�\�\�^\'�����]\�I\�nx��\�\�SN`^W/��S�\�4>_\�\�+�h\�~Q���EN�\0Sl��\�~#�)}�kĬt��]DZ\�\�9$�\0W�\�\�\r����z\�	\�M�os$+�z7z\�W�,\�\�\���D^�\��/S��\�j��5{\�)@�F��$��\��\�\���(BpH��2u\"\�x��q�Ur�*iZ\�z����H�~���\�g�#!�=G+\�t���+\�1�\�w#<\Z\�\�\�l7\�# W5j\\�v\��p���֨\�쭄�\�\�]�B��0�G檐EG��蝰+��Wo\�ڼ�6�\�\�)�\�\� ��N\���&\�=���4A�W0\�<�1��T�\"�lK�:��5�Wq\�]x\�GJmڎz\�\������$��\�^\����\�\�-\�m���\�q�\�s\�|�0dbV�գ��I1\�8�[��\n�^�c\�R�q\\/���:/2\���\'�H�\08\�J<z��\�v\�\�\�\"��\�4�Tf0y�&8\�O��\�\r\0R�C�_/�E��=Ff\�s\���,�v���m��\��\�5�����\�\�c�\�4\�\�i*��<R1�9��@\�\�w2HE\'\�x�e%s(E\�I\"Ɨ\�9��&A�vzo��o���񁀣��mr�\�r÷Ҷm�\��ֲ\0z\�W�M��(A-�49\�\�btgsҹ럇Z�3)��v����S�ԭ\����5jo��=y�\�i\�\�\�>�N_d�G\�ڒw�u\�W�\�j\Z\\��{#\�dW\�P\�$m\�\�5o\�\�\�x��\0�ְ\�\�\�\�S\�F\�\��	�H8^�\�\�w\��ֻmB\�O%�� ���|Wsn!v��+�RG�:n\�KE\�:/P[�_��Hl\���޾s�ɻ��Xb��\���\�8\�5�/�:Db���60A�\��=_�*\�\�2$\�ԑY��a�\�\��\�?{#�\�N\�Y\�T|\�u�l\��7k�\�|{�\�\�b�Q�ٺy\0;�\�\\�\�\�=\�`# ��\�\�F�\�{�>T\�`!\'=qO\����1B۶�=묷�\���\�\�UTwf��)l�$79�@����7.8\�\�#�\�^�g�\��H�\�V\�rz\�\�i\�u��\0W`z(\�XK�\�\�8F�h�X�3�2�h��{UY|5�!�\0�w>�W\�\���\0\0v\�N{X��\���~�>\�\�`�ݟ3\'�u��m\0�MW�\�\�##񯡮-Q�Q\\��\'!�g\�v��*M\�<R\�\�x|�22�?\Z��\�s�]���*屃\�\�\�4?>�\��\�l%̏>�9YU�94���z��v�\0�Z�#p1Z\\\�\�\"6\�4\�֯�J��G�v}\�rhQ\��\�*�����AR9\�J\��\�pOn\�kS\�\�\�;IȪ\�0X�ɫ�\0@\�pi\\v 9?!\�\�NM���RI�zu\�5\�IR\�I��]�\n�̧L�\��9z�\�b�I`�k\�<;u�\�)>�5\�pK#E���9\��v<Z\�F�.�8�\�;擨\�Q�\�\0�\�\�g42\"&\�\��<j[A��{��i�6޼*�\�r�q�VS;in�\�T1pkJ�\��\�1��5~.G\�W4�V�\�\\�k�N\�,\�\n��]֓\�(�\��_\�f�6�\��N�w\�W�\�1�tJ�\��޲�N\�\�\0<��n\�ú��\�\�g\"�Y.O?�s.E��uV\�b\n=\�5�Q\�7c\�3\��T\�\�\���C��\0Q[O�+P~F�$rrEy�\�\�\�NI��kx��:K�\0뗬��\�U\n\�yefwfl��\�{�J����\0*\�3�6��Q\�9����M���n�&�\�&�t����W�iv\�i\ZF �8��#	\�-�\�\�\�8���ĳp�V\�Aↁ2e~EZS\�\�x5_Z��P��N\0\�@�5 \�Lc�q\�\0\�J�O\Z\�ic;�!8�\�}y)T>��\�]U��[er@\�qs\��\�o\'\��c\�g�\�)�gbyc[\Z@o48\�\��{`\�\��>;^U5\�#\�\�\�}\�9٧��v�	\�\�^\�\�\�j	\�\�� b��_?7̕�5-�\�\'�VĊ�d\�U\�:UK�\�*O+K\��\�v�\�-\�b\�2rk��\�\�tR�\�<�8ܜ���Mq��X�c���\�ť��\�q\\�q6v�\�a�|\�\�\�\�(�������\�ܓ]��!��0qּ�cRB\�A�ߵ�CP9\�Z\�b\'\�\���._\�L\���.:W�j�\'�Wh�\r,�\�J\��}\nMN �s�*M+F\��t]�\�,�`\�\�g4�ܷbT�\r�\�\�\�S\�q��R�Kx:��Ey6��[鷓�vF�\��\�\��WRQA\�^a�x\'K��yf��Ė�k��W\�\�;_��\�\�d�T�I\�ҽ:\�7$�ߊ\�\��#\��6	H\�\�s��q\Z�+\�$Fwh��\0<\Z�\�\�\�M�ťB�DȯM\�m\�`\�y��:~\�\�߬I�v\�Y�t5�b�O8Ⱞ�pE>k�.9�!3��\�	��CE�	s�M�kr�( ⛦H`��SR1�ZD*��\��\��.\�\nk\�\�d܄�r+\�<k��A\�����*�V9k��\��kkx$��.\�\0W��#�k[S�7\�\�\nQ�\\\�P�aEz1ZC��\�T/μs[&�j��	d\�\�\\\�5��\0�g�j��$^����\�RP,�8\'�_�\�Hۃ\�U�;�\'�R��\��\�E�\�f<dq\�U�^S�\�P�\�֭M*.H\�\���XJD-�wW�A2M\�N��i֞t\�~�c��\�\��dߵ2Fp+\Z�\�ڲ>�*\�*1�m$R�DyW8�B�/��\�\�\�\�\��\�FpW�^��\�FM\�pI���oB�\�6\�f0T�I=���Xİ���Tb��Ҡ�`}*Sҽ�\�|Fܛ�*p)�&:\�9�\�B\�má�s	hG���\�MBX\�\�W\�\�4�ũ\�4�X\�@8,\�\�#x�\�\�\�[X$��Χ�^	s4�K1#ҹ�V��\�օRҖ����x�\\\�$&\��fQ\�wΉ��b@\�\�b&�����W�)6zP�b��\�3\'�z\�W�Ês�\'�x\�fٲD�\�OQ�\�h\\��LU@pA<�R�\�zsR�5��N�I�\�N�f\�z�_Z�Z��ӢH�\�\�\�쪀F}���_�\'ѯ\�pH��6��\�N�P�mn\\1H��۵y=�\�\�\�V\����-;R�W�I\�8�9\�Mq\�\�b�2��)�>Ԧ��ve�)\�s\�i;hy\�\�X�v䖛*�=���O6�o�\�C\�\�o�u:\�/�x�dlC\0}{\�x\�(��\�\�6-rԁ\�Q\�7+��l�s\�K\�Z\Z�+|\�tj_[�oS\0\�\�*mUjW\���i#\��I6jxnM󘱂\�q_B\��\"�\�\n�\�\�o\�c|\�ֽ�QB�裤O>�\�B=��qbja�q\�CPI\�5�Ϝ���6\�O�M|\�\�\�\0�k�E$�\�\�k\�\���S\�+\�.$RTu5ň��MxJq�2g�hLg\�ںx\��j�Y\�k{/���s�+���YSik��\�\�Q�d��7�-4\�M\�� q�в\�m50LG8\�\�`�}ǆ�����w\�풿\�kB\�G�ӭE�1\0�\�O$�sY6�m\�敔\�P~��\�dpEET��O�&�\Z����\�\�ke)-(8\�k*}Eh\�ʶE<�\�ƫ\�����Ar\"\0u$\�Rˊ\�\�܁i\�lۇ\�x5�v����x�~�la�\�q\�x\�j\�a��\�uTBF@\'+����\�\�8#\�.�:V����\���8y\�V\�,L�\�N\�D��BP����\�\�⦎ <dOp3�b�\�d01�\�zҊ-\�1r\�k��\�t_\"�\�Ƌ���\��\n�\\;�Y`\�\��\0:e�\�\�pT���\��\��ݜP�\�\�\�C��9\��\��s�zũX�,v�M[\�S�4\�#9\0κ�\�}\�w\0U,�ִ���y[\�R\�\�=o\�wM�Q���BxL��\�>⭞:W\�^X\�\�\�\\��U��[\\�l*�\�4�?0\�5�\�\�t\'6�vZ\�\��[).$H\�I\�+Լ5�%�kpT?�#�U|7a�e�1,D�˃^�a`�����\�T{#����#�:�\�<�#\�\�K�\n\�4oKm\Z)�l^[��ڃɷ\\�UU��8����;���F�GJ\�;�I�m�\���H\�kV\r9�����7#�j\�3`d�T3&�O�\�(@\�s^_�i6���-\����\�^�sp�H���j�R\�2\�\�6��4\�aR<\��\�\�6p\�\�r$gS\�yȮ7I�?\�vQ��\�AX�%�^�\�KKd\�\�>rk\�\�Y�\�\'d�p��������H�\�\���\�]�M\��[��wP�>\�\�k\�\�\�RS�M>\�UI��կ�<U�\�_ٚ�{�:h�\��;8\��{\�g�R�B\0᳞+\�\�\�Vx\�j�|˳\��mnӠ�Gέ��W\�\�ˣ\�8�f�x\�\��4!G<�q�ޢ���i6\�*z�8�#�0\�\��ޘ���!\�Bួ�\�\�p�\�\"`l@�v�7�\�\�Cn�.79\�}�\�l�W<W���%;&{�:t\�j휼^\r��.$YU�tb��ɭ=\�׶�Ɨ\n\ZWo�� A]�J\�A=o\�Km)\��\\u0k�\�J۝�M=\0��cE�T\�[�m��\�\���3\0ުܬp�\�aY�t\�Ƚ�_<rk���M�\�\�\�+1\��qY2.v\�+6\rK\�\�m\�\��KI\��)\��it\�\���h��H��|A�\�.b�d?�uafߺx\�\�iK���ᠢ	/����\��?\Z�� �\�\�C��c\�_�e\�\�*_\�?1\�\��\�3�ޘ\�\�<�G\r׵E�Lg�\�q-\�OX�i�2�!�.@\�3\�կo{�^\��W�xv(f�\�c�f�wd	\�\�tI|?\�m!\�O�#\��\�uR\�\����U\�\��\Z<\�,=N����k{�\"/i\0�b0gjPx�g-��3FY\�L\r��$g�w�LbTS]t0 Q_4\�f}j�u�G\'�\�y�\Z\�Le�D��\r\�\�[�\����\�5����ٛ8ɬ��$t\�s\�s�*ȴ]���|�\�ח\�\�x�u�f\�H-�\��\�/�~V2\�Z�\�5Ĳ8���%�4ah��H�7>�A\�\�\�\�\�\\\�ʱ\�(�NƹO٬6F\�5\����\�`s\�^O\�\�\�lQz�U\0w\�oF^�YɈ���.\��H�n.C��g\n9\0Wqi$1�\�\��@\�|7�oȧ\�6ŦoV5żqr�6\�\��y-EU\�v�l|^{EЍ$\�\�}=U�㧵\r$���ߚ`F;T�\�G$�g�G͢�\�=\r�}NM!`wS\�0�;�u�N��t�v��b\�)Y�������d��^\0\�����(�L\�\��Oj\�!\'\�g#�\��:��������\��\�6\�\�_\r�A�L\�g\�d�\�\�*:w=\�OQ\�\�*�\�$D�ұt\���j\�\���W?xb�9S�4a-�ѻ\0 \�*+X\�\r�8�j��G:\�\n:sRYoOe�t�`^O�J\�t��\�-�\0�V��8#�hZ�\����k\�\n!帮�T�܍�t⸗�]��xc��I\�coA�\�	�9\�5Ԟ�\�\�r[@A�~7\�ש��\nXy�դJ�\���G�5��\�[����1\�{�^��\�\�<��-\�c_Ǔ[\�\�8�ty\�k\��\�\�\�B\ry\�\�\�-Df7s\��5\�_U�\�\�q�\�\�޼�mn^\�f]�t��淦\�9�)Nh�A3!m\��uǽY�y\�o\�\�v\"\�\�s^�\�i:�����%��\0\�\�\�5�u�B��u���\�Z��tsU�#xI\�zՔ\�ug��\�7\�L2\'��<\�-\"\��\�I���ẖF��\�p_o5+-$MepaW�ˑ\�|�\07M��\���;mk\�\�6�6\�\\�NFV\�F�+\��O\�\�n�D\�\�ߜ�\���Y�\�-2>\�I4�|�\�W$�8,\�{\�3�\�\�k�\�jk_�z��Z\�w3F77�T�U4Bm#]��sV�;\�[^\�&\'=�sڵt�\�ee\�C\\���GJ���e\�\�\�\r��\���q�\�\��n\�\�a\�u!v�/�sz\�\�kE��㊻4q\�\�YF+�\�tk\�\�\�2\��eX�T��ڜ�Y��g\�zt3�\�A\�:�5\�\�\�/��\��\�gB\�\�t�c�h:�\"\�tl1\�g\�]\�����,��,rr\�\�\�K\�[X<�\�TPI�T��%	_��^K(���8 �^u\�V̎�^�q�-���=J\�]G\\�\�d+`p;\�Vv����\�%�\�Emg�خz⾢�g�}�D�\�l�\��\\Ն�o�Z$y�r��\"�\�\�\�-�\�`(\�uF��\�ՠ�[[�\\PT\n��\�0��vj�d!�O\���W�Y�k�,Fk+V��u��Ŷy��$u���hҜ�f�\�H\�\��#\�\�]��\�\nkͮ<;7��u\�N�r��b�>\��qT��\�P��6��V@3��jӮp\�i�*���O8j�\�*�߬lv#ZAt�\�\�+f\�Z\��5��r�3FV\�0\�s�\��N+bY7�\�\\֠Ć\�j	g���*£$�A]����`��\�\�\�ؚ$��5�~\"K5�E-�\�\��\�}k�e5ty��4\�6�\�r�\�\'r@�R��rDÒ01^U\�nn\�y$g$����z��\�\�XI6NB�>����AS��c\�kV�|G�\�C\�\�4o�_\�\�\0N;\�\��7���qU\�29�s�Ԏ4\��^}Z��\�\�\�QB\��B1\0\Z�KK�t W�\�\�`�7|�5\�\�]0@T�⚹\�\�Dvӹ1��j\�#�\�\�9<�\�\"j\�\�Y�ҷl�sQcU�\�Z	#\�\0\�j��\��\�\�&��\�yZ\�}E>\�SH�t_\"��{\�+6�(<�J��8;�ZѦ2c�\�\�c8���NZ�\�\�\\�b\08��(��^\'su�[!\�\�)=qU\�u\�V2\�n\�\0O�t��kö\�|\r?#=kƭ�a�ڕV\�8�\��\�4�èLa�?)�\'\�MN,�Q�N��M٨��\�\\ԽEY�Zc\�\��\�H]GLu$\�q�\�\�\�\���c=*�QWh�\�P��%\�#��Nx8��\��\�%��g�\�~[�70.\'#�\\χA�s��s�+:��tS�\�?#����\�\�#�<���sN���h\�\n��$��/b\re\�\��{�˰ی�޹.��V�GIg<7*sȮ�C`U\r/EM>28\�V�a#?�Ii36_0�2�swd��׏�\'\�UÜ~U\�k�\Z�\�q+�Jh$��\�\�=2�\'ؠ2�7\�t\�\Z1�\���D]\�\�V�\�\�pNk������01�\�R\�\�jWWh\�|7�}�WDc\�\�}%gd �T�s\�k\���\�C��\�\r\�\�׳\�*}\�+��D\��z\r\nv�\�4��d�Jx#oA\�)۳\�z\�\�8ى��\�#�@2\�HA#�\�U{�V��\�*e�.��G=<e.Y�-�ӷ>�\�x�\�F�;H{<df� �\�\�ԡ\�*v��\�gہ^mO�\�\�\�\�zv<\�\�\�Reܽ�_c\�]ݝ�\�ԓ�\�\�\nŵP$�c�5\�XC�\�\��\�&ΪPFl�Y\�M�\0/s��Ay�b��\0�2V���=kyI�\�\�Vl^K�jH\';�&�܎�BkJ\�L�#9#�ַ\r\�\�=�V\"Zl�n��E\�V=�sQr\�a���h�l�\�/uK9�G\�\�8\�Rꮱd����z͍���|t\�:gҶ��ާ9�K��N~CϹ�~�J�O&��F\�����b�}�\�>�D�Ć b�\nS�<�\�nLᥐ)�\��rM\�\�WW�{IN\�\�+!=:{WJ��\�\�\�D�0\'��\n�$F<s\�Q�y1��8&��\nAf8\0��i9��39\�\�v�I�\�8���O\�]��\�\�\�_\�.295\�v�=��_��A\�?L\�<���S��\ZS\�Dx�����?�Tm\�\�q\�\�N�F��1أ\�$~�\�s@�\0ج\�\�]���{\�X�6t�V6\�x��҅�\��4®PI;�s\�kЯ,\�d\�\�?1<\��\0�\\e\�\"�s�x\�����ԏ>�7Y��{\��݁�^\�k\�\09\0^K\�5HP~c\��{J(\�@\�wG\�>w�BU\�rF1��\�\�ˎ�4\�\�\�\�Rc�ZL\�#�*zf���|\�s뎕Ϙ�:�ֲ�\�I\�k�a�\\�e��ȪO�\0z�:��o�0=Nq\�\�#դz���e�\�\�\�Y�c�%��\�H\r$\�\�0u5\�_ݼ7j\�=��`w�IԳ��W���N�\�y�:�\�$�\0�I�/:.+\�-r�ȯ9�� �ʵ�\'\r)$V�\����~G\�)\�\�FP\�(��V|\���\�\��d�pp2i\�:kD\�9\�\��_\rjSP�3\�\�]��\�)\�^8q\�G�5\�9\�@\�=�J�\�<V�3�Cr\�\�{dX\�v\0F1\�j[&\�\�;\�5��nXո��-�\�\n�v��\�\rQ\�֦ݎ\�Q��@��\��~\�\�99\'�\�DJq�9�H\�,с�\�s\�h�k6\�6�����+6o\��\�4+\�\����Ɂ�qP͠�9\�v�\0\��L\�\�\"��KX�7\��\�I\��W���T�-��9\�&F}��	\�y��>y۱��B��5��,	�^\�\�\�j\�\"+s\\����E\�{�������~b�/���\rnz�J�J\�\�\��D�\�\"T��1\�޺\�rW9\�|��/��\�fda\�@��\�\Z7�\�\�b\�\�Ѹ�T�\rzp��\�������\�D�\�b\�$t�+SԒ\�O*#ߓYz��>�Jŕ��\�!�\�\�$g�kb:D�8[4\�h]܈<u�^zI�\���\�\�\0\�Y7׋n�D0Z\�\�zt⑾�\��\09\'�/\��@\�\�W�\\x�\�2�A\��T\�}�\�-���\�[\�3ID\��O\�Y��b2�\\��\�\\�\�\�L�\�bx\�5\�\�\'íN)$����Kr��\�\�g	�(\�Tv�\�JOV\�pN�b�W>b�Ծ!H�\�\�{0+\���wƷH�m�*��α�w�S�W\�)5���\�Ұ�F��/ﹺsro\�\�\�Բ0\�\�bG\�[\��\�Ϩ�\�T�y\�L֮��ʯ\�N\�6�Jk�g\�ZL�$(�u�\�yW�^�\"�v�\�v�&PA\��gtZ�7w\�\�\�c�Z7��&H?\n�L����[�jҴ@J��\��.�n8e\�y���	\'a\�{U}Z�	ٕm�\�c@	s��jV!\�\�A}�m\�<b�~�M\�ީr\�p��u�)�\�ѣe���>�\�$�\�\�\��va\�;s4x�\�B��b�\�஑��ni`�\'��\�o\�/9\�\�+%T��\n\�H\�Z��f�!�Rq�j��Sр��\0ހ\�\�J�˜�\�$\�f\�,��EQx�ǧ\�Ҵ\�Γi�=ɭf\�.�\�&[��g&�\�\��\��0@\�\��e,�\�H=\�v��\r�V\�2�=9\�]���\� \�\�gsʼc\�u\�\r6��<�\�H�0�ӱ�u[`�HS�J�\�\�V\�&\��6+ϵ\�\�0\�\�g�US��MJ.�\�%��C�\��5����\��\�d\� �>ڼ���\�+\���e2@5݇I\�μ�\n	wz��ׁ��\\\n#�9W\�\�k�\�4U\�\��\"��Q\�]\�	;�l�Tq\�o@\\\�Ҕ�\n:��f�5g+!�\�)5�\�\�o�:ɡ��}.T`\����F\�ln	\��\�\�{�}�LFD�\0�2\�-�Iޤc\�\�x\�\�<�\�\�9<�Y\� V\�\�l�6sޱ^3�^l\�sץnT\r!s��)>@�\�\\\0\0��ql\0k&n�ݗ�+�}њh�\�iw*��+6Z\Z[=\0�znZ2~��*���.q�$\�`\n��[8���	\r���pOZ\0�3\���F-%nXp=\�{�}�v=��_&�9\�\�V��,}>��И\�\�G�cN\�˹\�x^\�K\�V\��\0\�e���>��5O�[W�\�\�$�z����	(Tp\0�[W��\�VfЯ(j��iV:}�Kh1�Ó\�Mx^��k c���n\01�xN�je\�n:\�xɮJ\�ֱ�yW*�y�\�F�\0��hd�N\�\�z�m\�Z��\Z���۵w\�8\�ڝ7̔�!���z�#�\�M-�\Z��j\�x��w��|u\�x\�\�\��-�\�o\'nk\�$\�z��M5\�r�:}\�ʰ�dk��\�\�\�.�F\�\�e c v��<�\�Z\�7:<\�ˣ�a�_\�\�,[�\�^eEc\�\�ϙ�*���\��-f��J\�j�H\�q\\�N\�,g+�\�S\�7F�X\�n\�K+/��QUc]oBx<�U\�0�@OZ̹�&\�w��B�\�5I\�8NM4\r+�[�\��\0\���tw7&YX�a~�� ��S��N�p�\�\�nخ�!M?\�Ш�@Q�V�\�E�\�C\�([o\nkj\�D\�(�a\�8�UuCx�\�\�&[�5oÒ}�X\�\�\���gO\��z.\�W�v2R࿎�{1�S�2�\'��\��\0�\�\�Z�\�wx\�\\\�\��Z��+iK\�ڊ�\0\�gg�x\\V\�\\��\����\0���\�п�\��G�M\�{=^\�QA��#�B9洱;���3�M�G�TWq�	�1�F��\�o! �g���ψ�B\�K����(���\\qY\��K�$���b�8-\�)�faV<\�c%�ќg�Y\��I;�;eL\�޽+H��\�8��\�R�\"\�%\��J@#��/{\n)�\�WR]r���ϭr^�y/�ucv�Gp���lۼ��\�{� �R9\�h@� qZ\�\�D���mf�\�\r\�\������5�\0\�ܾn>��y��A\�rhl,s^)�\�4\�\���n�=�F\�\�O\'�+��\��Mw�\�{s@�5ھT���\�z\�,��j���\�V��N��{lx��\�\\\�ѷ͇`w$���\0>��xn����b�\��]�G\n�ֻ\�kOk\�\�+`\0A:�t\�\�yw�|F\�#�].ـ��m\�s��~\��/j�2\���B�ɦ\�\�fU(ѥ)OVՒ:\��B6ZtZ~�\0��\�l��㏙OZ�����il�5\��h圬\�\�FG\�\�\�\�@\�)\\\Zu\�^u������ƿG\�媾\ZI/z\�^�\�Q�\�WR��\�\�$vf\�\'�\��3\�\�C\�biC�-�t�g�c\\\�wP(b��^\��H\'\�5[$9�^D\�#+�\�u:\�ne(�\�5�G\�\�=�\"q\��i�\Z�y�j\�\'=9ݑOu�_��)f�\�G�\�<�m&���zf�\� m\�W�)9;�\�RPVF<�-\����yX��L�\�nn���?T\�u�L���\�c�\�~�\�ol峞\�Ls\"�	>�\�;�e�\�\�mg�`�\�\�z�<Է��S��\r\�\��8\�\�Bi1\�\�t\�Y�+d\0�j��\�\06k+�\�\�.��ΐ�\�l\�b�\�z\�nBN��\�\�_\0\�vW\�7\�F\�K�ۑ�E\�r\�lր\�\"ӡX\�\�(�\�l�3��@��l�_9^\�\Z���\�%��\�\"�ώG�=�\�\�`��aY�\�~\�k;lϝ;;�:��]6\�9�PU��\�sh\�\�q!\\��æ{\�p\�A5\��%��\�I�Y-��$�\�5\�m�� W\�2�+�\�^\�MuI��\n�jw�\�\�\�\�\�!(�\�6�Z�\�F >�ƂO\� �\�׵s#�\�$\�u�Y\�$�.a�\�_�O\�\�s\�\�I�\�\�86}[\�[W�^\�gG���\"��\�V�\Z\�~�v�^Dj$\�z��A=k⸋	\'V5\�\�\�>�\0�1��a�\�4OIФ�\�{�\�5\��os�+�[�#88���������+\�\�I\0��\�\�;VT`-�_����\Z�i�\�g5�p�5�6H��\��k\�\"��\"\�\��>�ӹ\0dt�q$��M^K�GsP2�� \�\��Υ\n�ܱ�r�\�]���	>�\�ZE��u���sg\�mI՚*��W6v9����An�\���Q�\n�p\0\�n\�W\�\����\� ����E�ޡ�J�N��NzW\�eT��ùMٽY��s��;�j:DɇN\�.\�I6޾Z�ǵ��6�i�Fs���t]\�K��\����\�}O����������%�Y�i\�e����g\�|[�=\�\�=pjO3�_T\�\��U\"{I?\�k~b�\�~�\�\�gzy�S1\�\��\0\�\�Y�_`쥒\�z{B/\r\�i�\�<�\�½�f�9a���5��\�s\�5�\�ۍ�Igt�\�|3>a]��Gkm*�ҞX��\��Y\�ֹ�n8jJ	\�S��u�w!\�\"�8\�\�繮oF�h\�B\� �\�F�\�\�2B��\�i\"\�WQ\'\� Ն��^�Mf-��\��\�@G�,��v1��\�\�?\n�,��9��\�\�ڋ&djR$1�;m�Myf�����#��|\�)��q�\�\�z.���4��b�~lw�]�\�\�~H�\����F�<�\�Cgm�\\\�i\�0\n�\� W��7�:,�ݮZ�bty\\�1\�$\�\�^�\�\��R:\���\�o���+\�g\�+r�O�T�é�[\�\�D�$\�ݐ~_ʽ�\�t.tx%RF˅�0\�|��\�\�v\�w�eG\0q�\�*\�\�\'*�\��\0\r.\n\\_[�#z��\�+\�X��g�����\�i�[39(hϾk訲\�$�+j[ve\Z�_\�#��#<\\\�t$\�t��OT%ї�k�\�B�\�\�\�\�pBMI>\��f\�\��\�so���q�#��\�K�dQm���\�}\�\�ӣ\��	��F\0\�j\�#�pʹ{�\�m�\�%խ�\rA!x�\��>s\�TZ4�\�(�2J�\��We\�M\Z\�V�q:d��XuS^\�\��̌\�\�x\�\�ꇯ1\�6\�*�+?Q�K���mA\��\�%�(�L���\�\�\�\�\�޳\�-\��\�Aۚ\�Cl\��c�4�!#*(��r�6H\�a��*���{��v�?fS��ݗ$��=�gV`�R\�\�F8�d�d�\�Z�Ǧ2I�j\rC�Ղ\\1����]t\�&�L�\�Մe�H\�4\�.uB�����iߟ����\�?��v�#��\\z~�8i%�\�\�_�\�x\�޻aTx\�\�s\��\nM\�mF\�0j�\'�����d7�J\�U\�\\c�{W9��\�G\�\�	\�\r&8�9j�_\�\�\"�|�\0bҢ1DI\�޸\�w\Z\�	=Z2sԷ\��\0X�`�&g��켁�\�\�o\�\�\�`AQ\\\\\�\�xcO��ϻ�J\��=��\�U\�\"Yf�t����7P�k�r\�zI\�3\\׳;\��\�C��\�R��_�\�EI��#=\�E,\'L�p=\ry��s\Zx\�3\�3��oi�<k�\���d�ّ�]��p��)�i%ڧ�s��!#l���S\0�\�\�\�w\�S�<\�\�hFszU\�A��x\�\�?�r��w	\�\'�n\�2Kt\�d%\�;EmxK\����I-���\�W�A�$��\�F����\���6�	�N[9�\�*�\0�$r�B�\�\�\Z\�lt��0����כͽ\�`\Z��W%��\�kˡ\�C\�\�ڦ%bM̀\0\�4\��I<\�n���\"uc�7�y�\�gЯv%y �P&Hق���z֥�\�o�H\�^ƻM9!ӂd/\�:�b\�\�<{d�N\�J��Ӛ�N�85pZH0\�x�׊\�Oo�K\�[�qZv���\0\��߭doB��\���s\�T6�-��km�\�\">YP�\�-�kpcŘ(`3N$\�Zmm%\�.����\��w\�\��Aj�G\�\�ip�o�\�\��gwW{�jj�\�\�r}+�V<ڵd���\�zl�)^��\�\�\�\"\�-\�\�\�^}1�f\�k��\�K�<�8ȩ�liN�g�\�B�·\�\�:\�\�\�Ϸ����s\�\�f���)�\"��! \�\�Pk+4z>�r^\�7�\�\������\�ּ;M\�g�Ԓ!p���\���b��̌d���\�6�9Y;�\"�uUͣ�>\�\�\\���\�\'�iFI5�\�8�\�\�ml\�\��\�z�U)E-YT�\�RM+�\"�9�Ì^y�\�Ciz\�\Z�K\�j;�أl�!\�3V\��\�3õ�\��e-OUCC�ҙ^%�U\�C\�8\��T̻w1]\�\�9\�C\ZE��d�V\�ec\�?N��s����ڳ�*1\�i�\�)�=8����~�\�Y�\��r\�EjB\�T\�m6+���\0\�:�k��ҟT�X�\�pKv\�wz�����złx�\�i$b��OҮ&S-y	�Z�X.��\�y\�ֹqi~��Y��=��\"�X���\"v\��細�ĞT\�\�\\�\�9\�9�\�P�盈�N)�{��ễ$\��\�~����ןz\�\�\�b��5C�Q���&\rz	\�|\�y6�J7�Mf\�\�\�\�C\�zic�F��短q�\Z�\�\�Y���@#�4\\�\�\��\�˖���0IVl�\�ut\r\�	-�}\�\0\�t�R\�\�w�\�*��^~j�q\���4�\�?ֹ\�B-]��\Z��Ђ\�\�g��>\�\�i�v��+\�x\�\\=���\"7oN\�Wae N�Nyutg�GTw\�8x\��\�\�V]�\�.s�zT��\�\�r��#W�\0g5�tٛ\��\r�\�\�N�\�s\�6\�;���8.c��\�\�k:\�\�P�\��\�n\�#$c\0�qT��+H�eQ+3�{s,\�I\�	\��\0�\�Tpp\0\�k��\�d$m?A]H�>\�D\�oL�劣��ґ\�\�\\W08#\�\���\r,��\��潈]Y\�\�U �ӓ\\�Z\"]0Q�\�=*�\�C�R-<&6\�n���ǽ��ͻ�;V\�L񀹨\�Q��=���yM����-�\�B�0bxc[\�U�AX�\�q:\�x�7�kV8�/�l\�GKlp02+�C\�\�p+Fv23)\�X7�s�Y\'˓\�\�\�@SС;\�\�0\�b��\Z�\�_�\�Չ\�wwV1\���\� `c�=3\�\��Z\�\�m\�\��5߇\��q�\�:�\n\�\Z�ߴ\�<\�\"�8�\'$�k��헐��\�\'һ1ʂA�\�\�c\�*�͒0\�u\�?���늏s��=\�\�I�m\�}Oz�0!\0\�mPq���o��5U\���g����u\�f\��\�w�v�t\�\�~����B3\�j#��\�#դ�G�f�U�\�\�ץ�Z�\�y坊��9$wlW�\�+�\�Ev��MYM�G\Z�/�	�\�F	n���d\������X�=\"��8\�|2<�(\�^��azS\�k�N3K\��\�yёl�=8>�\�Ң��\�]F-�m�\�\�5\�\�O6�\�\�ۓ\�ֺPxu㞞���-\�:<�\�M��w�\�%\'܁\�nZ\�H\�.\�\Z��\�5h\Z��.\�ś\�REP�a�⭷�uI��ϡ�jIF-�t\"\�4���\�S��9�*\�\�\�z��\\5\�q!\�\�\�W[\�}\�r\r\�\'�\��\�\��:��\�\"�ъ:/\nxP\�.�_��z\�E\�MI\�,ح�J1\�ZџU���Ȅ\�p0{b�e��\�C�-ʏJ躌l���^�z\�\�<�\n\�Z�y\�b�\�ץ\�\��N�(���(\�\\\n�I�5\�q��&\\\�E�ͺ�8\�*����d\�yޭ\�\r\�\'\�I\�YJ@��u},�0F+\��i�\��Չ\n\���\�\�ӭ`�s�\'�Mdٴbe\�\�\�0wL-t\�G�t<�=8�QH�Ӡ\�;q\�\�K�ƶ�v\�Ěƛ��e\�܊�-ƶ��n�o.p	?+W�\���Q1I�2kjx�\�\�cSNkU��.�\�HX� \�1�2j�@wc^\�g�\��\����\'�\�מk:���<�\�ч\�\�\rk9�V��B{�\�\�T�\�/j괈�;7ƹ�\��\�_\�\r\�\��\'��\�]��n\�(\�dV�Q\��+\�S�]\�\�\�f��8�+W�\�B�ѓ\�z\nf��v\Z\�	*`�+͚�\�B�����$7)�¡�OLe_����/�\�b��=+:\��S��\0\�574�\��\�,[�z�\�kS\�$�㰁\�\�I*:\n޼{ی�\�UaK�KW$�*1����4T毩\�cjIA\�\����\\I;��>���{eȇ]�z\Z\�K�\�K�lC�\�-�\�m(�RUx\�^��c\�aW�\�\�\�����<s�\�I�\�4��!i\�\�g�X+�\�T9��\�\�OT==\�SO���U��\�M[Ҽ7�_H�m\����\0º$�B {x˜|\�V*r���Q�\�WÿnnJ4�cN\�׸i�Ҭ\�X\�3\�Mh\�Hgn	�n�\�	^=\�U�g�\n0��EK�N�7A�5�,�sq�	q\�ұ�\�fi/��<��R\�����%`��\�d\�j,U�\"���P\�G�y,�dd�{\n�Y#�X�\Z�}+\�\�7��B\�\�L�{�x7Æ\�?31\�k\�[�mq�+\��W\�U\�c�\�^��)q�+\��#\�\�4��4vqF\��\�\"�Ƙ\�z��x�RN{\�i�)l\�S�\�\Z.K9\r~o\"<\'�\�?\�/\�\'#\r$��A_]x�wYM\��M�\�\�\�D\\�+sJn\�9T[�P��.:�\�o ?L�\�\�5�$\�oz\��\���|�\�ecԧt�~DbO\�ǥ9!\r\�2k�M M�	\�Z?\�.7�#ҲqgB�8_����UYt\��\��\�L�\05N\�F1`	7��q5SL\�\Z&V\��iD\�?��\�ɦ|\"\�c�e^\�a���-;�m\�U\�$\�I\�e�t>�\�F��\�{R��G��\\y����\�\n��\�h}�j�g\�r?\�bڧ!�\�ھ��ɂ?�Fis\�h�\�(ݞ1Vѳ\�0�?�\"��/z��:lym��1��S�\\7R\�^�\�c\�jv�Ap\\\�n\�\\��\�g+��\�k���\�\�bl㢚\�\�j\�\�LL��\�\"�	\Z!�L�\�9\�2�s\�F�jG5ZF�4�8J\�75�u4�aF85��\00��`yj\�N\��\�Z㱺i$p\�qM��c�i\��\�<�{s��\�Bq^mMn{x}:�n\n��1�Xs�XA�Ltrx��j\�\�|Y��Fy\�\�}赋2_�c�Hȍ\�\�>)�}\�P�\'5\�kwF\�㵏�\'�T{d\�˹\0w=1\�U�\0\��MR\��\�a��}\�H\�\�\�\Z]��\�=a�T��\�\�ֶ��i�(����<L�=gN�t?�\\�$^n��\�\��\�N\�y��\�y��~\�Z�\Z�\��_�BL}\�*ݙ�b\�n\�e(��QQ�q�^\�x̟\�U(\�j߸�H�\�\��I��ժ]<ov\�p\�\��������g;��/�T\�\��\�j\�\�rj�|��\���r�9�-S\�-�5ͧ\�!2�s\�\�\\����\0?����?�ʳ�c�\0uT����R\�uJ\������n���\�\�LN\�^4E\�63���N�i/\��\�\�2kֵ\rJ\�L�»�\�$IA\�\�C�W5\�+a.\�\�Pn	i#\�?��\�\nJ\�7nus��o\�z�\�c|)D\���R\��W�\�w/\�VY	bN�z.�*�\Z�\�\�\�\�\�\�T��%�T8\�\\\�U\�^�7qޝ\�fL�4P\�\�YĬ\�d��G��O�Kdb�b\\\����	�\�\0\�9�6A�\�!�\�\�B�<�)oUj8\�X�\�z�Y\Z�\��x�\�*\�svG�x\�\�\�Gi#�\�\�FH@�\��x\�)%�k��,y&�Ѧ^k��檤.R2\�B�@*�ͅ\�R\'���N\�\���(QK\�\\\�\�>9�j�o���+�\�9\����\�yKӟz��\�$�H\�\�pNk\�)\�;�\�\�\\.c�Dx_��\�\�\�\�{ӡk�]\�\�\���\'*Md*���GA]���\0�$������\'���Uj|oݍ�g\����\�F�V��=�\��\�xߵ�)Rz\�\�+B��k\�^kȡ1�%��a�+��\�Gb!��\�\�W\��?E�\�q�}��מVx\�K�=�޷��U2Md\\ΆR\�\�?J͛\"�Zs��\'ӥS\�D�\�K�\\�\�ϭk�O$��\n\�Fy�\���S��\ẒCEb\�6c��ךUۑ�\�o�\�\�\�@4p�\�\�\�\��t\�}�\�(6��5y��\�O\�\0���Fx�\�x�Z�\�\�\�L\�\�\�}�]x|lK��\��1X�H\�\�\�\�\��.�u�y���[\�9S�Ȫ�\�V �\�\�+1i�M Q\�\�\'\�i\�\�A�\�\�_�a!G-�%)(��ɟ�b\�ͱ\�Q���\���A���.�\�:�ܶ��q�nj׎\�ȘT\�x��$�ڥMr���8^��U�v�´�#\�{T���&\�\�\�q]��\�\��J\���x^W�.��!��j\��\�0�\�(%$�c�\�\�\��ۋi\\��ޙ\�B0\�\��\�j0\���-�ŵ\��KT\"\�CyLp&�\�k�\��\� ��̧��\�\�\�bi�ԑ�\Z�58z�9�����Q=���ن5v\�\�W͠\�Olq\\OC�28\�Q��^\�V03\�j\�\�A�\�\�b�\��\�\�זk:=��qp\�3��XP��	s\�^�t�B3�\�Vރ���v�k\�F\�du5\�B\�J\�)Fp|\�C����ċ\�ې��\�=\�׻X٬�\0U\0��\�\��:V\�qt�qԜ┞\�\�F�!6\�sS�҄�5�f\�\r8�sĚ<z��q\�BP\�8aҺL\��.�\r��lmM�\�3\�\�3����!����\�\���\�;\����\�/d7\rЍ\�\Z��\�k\�\�:^�.�kH��\�O$\�\�W��ۿ�5ѕ�\�\�z�\�M\�}6	:�M����\�\�\�\�j�F9�mi�{�\'Z�a5�\���0î>뎢����b\��\��k(�͐�AX+=\�P	\�qA��r<�\�Tk\\H� v�fI䘐�\�Gowv\�?*U\�-V$ڃ�֙òEYI\r��*\�+*\\\�|�%C{�\�b\�7)�\�Qdk�\�ۑ���k�~f\�\Z�;L�[{aϕ�\�1_:j�H�\�\�Vܯ�\�ȯy�5�\����\�\�Ã]�}Nt\�\�ə�9��\�×��v\��\Z��m\�\�\����\�A��5\��F˟���\��5�j\Z\�\�\�\�&��I\�QG�[\�\�Ft+Z���d�5��ywj��\Zm\�\���I��!\�^k��t\�\rY�\�Y\�/+���z\�1��\��Ǌ\��~U\�#�0;\�8�g\"��y��\�;5-.\�\���-���\�Zl\�\�$|Ie�k3Cj\�O%@f+�S���\�eGW\�AϨ5\��\�d\n䪭#ҡ>h/\";\�ܤ{\Z�5K�?ķ�C!�\�q!N\�\�z�	Ԑ@���Zi�T�NFǌ\�&�Qj\�K��\�S��Q \�zP�E�\�\'�\�U\r:\�w\�i9V��Y9\�`VRVgT\�\0�\�B[]\�P\��\".\�ut#�\�p>��\�s�T�y�^\�E˜\�ܳ\�\�CNg�䊒Yrx�\�U��j\�\�i[\��|\�\�p��\�B\�¬�\"s�!\�`���g��¹\�E=Mk\��N��[�/Rfޛ\�\\�F?Q^s}c�Z\�2\rN\'�~�߸\�Eoh>$\�<;.�s�\"G�}\������S��g\�bq�U\�[]�\�^&\�|\'z�N�o#\�8E9ܧ\��Z�Q\�\�\�\"Ch�9Pp�W�=�ߋ���\��\\E���Z�%���\�qɯ?ZӲ\�۞�\n�\�^\�w\'�tai&d$r�NEyg��{x\�\�Iܱ����\�<pj�\�Ar	c�Uc� �$�<]s\�񩥊\�wj\�\��E\�\�)\�~�G\�5���\�%\�w8>�jƣ\�G�6Z,(1\�\�-i\�\�îڭ��B&Irzm�(��+�!�o�<���W�J�N��S�Bh\�M��j�\r\�$\�~y⽧Q\�4\�]1�F$2\0���W�xN\�\�M�A\\��+�Դ�ou�� �\Z\�\�?x\�7N�{F��:v��\rN	@(�\�V�	��*\�i�3�\�+ϖ\�@\�\�ݺVu֫^��Ң#<ԃL�Nv栳��\�.���T\�$1`�I8�\�Z�tk9\�k�Lq��4\�L�G�\�o\�\�đ�!��c<�\�{���M?V��X\�\�0xʚ�/ۏ\�	y�\�r�e\���}\�\�Lc|�\�;\Z샲G-j*�>����\�\'b;W�\\Bngy�w��u����\�\�\�\�\�IC\0)N�1�\Z\�}\�a\�1\�k�\�\\Zݮᓏ\�޻\�n3\\�&S�\��VC\�Ҧ�$Uv\�NGo�\�\\][D\��v\�\�h��;q\�\\�e��;c�\�x\�Z�),F�>e\"��L=UR� q��g\�m�O��\�<V���j�#\�S�<\�Vg�\\䮬-�G\�\�kB��QB�\�{�U]\��1X\�\�ZW� �\�\��9u��4�?\�c\��j\�\�}7Ssg����[ڸ�F�h\��`k�3U\�`�}k��\��n\"<��ΩHd�F�\r�\�񵫣��\�A�pi\�XG;n9��g�S�)\�\�|�EV�p�\�uW�hB~R\�FG*ž��5\')\� V\\�\��\�\�+k\�\�Ig�\�H\�\�{g\�\�.��,J�����\0`\�F\�\�\"�\�h�G3|�G�\�\�\�ғ,�\"�.=\��b�&\�\�\�W���(s�y�(8\�I\�9;��(��� \�5�^6��^��Qw�\�A\�6�,\����{I\0=Ey\�\�Ko0;p�\�5\�X\\\�\�\�O��k]ƀ\�`0j���$y�\�\Zʜ��Z��\�:g�\�4�\�CPh \�>�VU\�;\�ɑ�\��\�+�3���Bc�;�ђI�rMy\�\�\�\�墒w�\�?j\�\'\�\�U\�\�m\�~l\�E��M6y}\�\�}0\0#�?A��o\�\�)HS\�\�zL�\\\��q]O����SiQ��J\�_�\�\�p��\�;v�2\�A��\�l\�Zق\�$\0m�Oir\0��V瘨X�/<\�H�_�.��\�QEs\n�\�ܑ�\�<Oj\�i�c� חY\�\�,�n\��k)#9BǩAa�jp\�\�k?��Z��iic!O=�U��Z(�\�m.	RY\�\�5�J{\�.Y\�\n0A\�\Z\�C�\r��\�Ud|g\�ֶmXg?5g��8(\08�\�\�t\�\�\�\�1^]M\�\�ҷ*:\�{��g�x�\�r[=��8�n�\0L\�%�ۍ\�\�J\�h\�7�\�/8\�*��0�oֱͽ\�|\�pEQ�k�|8\�\�F\�\��\�\\t��^\�\��\�{\\�\�^Ւ��w\� �����\�M\�\�\�״Yn\��\�{�#�Bpx\�\�]N�n�\0d\�\�\��U\�xoN�.?})\r\�x�E��\�q� W�{�\�U�\�Dy��r<LFA\�*\�2\�9\�\n\�u8\r�Õ\�\�\0\�\�e>i\�H��4�\�F��\�\�J\�\�\��?\Z\��p+�\�Z\�\�FzןSsݢ�1삮x\�\�gl�׭m_J\�с\�9���\�/ۿ\�Y�X�\�nN9\�\Z�}*\�i<ōT�h�,\�9�a�\���\\m\�_ƭ\�&�\"\�O�:\�x5ʛ:\�?6�z&�p�c�pS\\D,Z\��a�\�A\�]\�Wvxُ�����\�G\�\�}\�+IAU\�9�\� -�\"�\�\�\��]3\�\�\�B2\�!M-���\�5\"c5	1=�\�4䃟l��]\\`�H\�\"� cw�0*.p\��~5���f��\�a�\��NbL�9\�$sQYyonB����P`7\�+�g�Gd{�\�;\0\"\�p>\�\�ZR�k\���[�%�ѡe\0\�_��Cҷ#\�\�V�z�5�c\0\��+\�|n\�Mvnr\��{�\\G�\�\� �M�^7_\�[\\୬NF貺\�N3H�H\�օ\�L�3����\�(�p\n\�dx�\�R1pE\�V�#\�g�i\'i#�\�vƑ\�*�\�V*ۇQ]�\�\�H��\�\\\�U!�\�⺋*޶Q�FW\Z�RA\�]f���#�a�};V��\��{T\�醇A\�q@\���R1A\�a#�#eo��W��\��\�\��>�\�\\\�H��l\�\�r�x�ʩ\�Ì��-}\�S-�\�=�\�C5\�\�U\'���M.;���\�\��\�:���i���]d ��\�şI�\�{T�DGmb�I\�$c=\�D�E)!zVe\�Ҡ#vqZny\�r[��\Z�\\n��%�L\���\�Z+�Nc�\�\\�\n\�\�|a�5\�+p\�ri\Z2�\�S�nϞ.�\�Nb�+�s�W��%#m\�7�ry����`�\�Kh�\�EV�\�ZX7\�Vjo7\�|Fxŭ�8\�w`l&�r\��\�y\�b��\�I��@XPcگ}� \n>�K�\�d�@�4��2���\�+\�<C�����J�-���\\�\�:R�مĪѾ̯\r�q�0*豈�\��VW\�\�RJ\�:;.>�6�ڙG�r�۵F\�Ѷ\�p\rS\�w�KFH8⺨\�\�G=ux36-m/.d\'��ic\�c��X�N:W \�Y\\I�S\�RC�\�\�(p���G��J�X{3\�\�akN�\�oSњђrէ㚊\��\�R�Ia`~Q�ȫJ��+ĩ�g\�B<�\�2E\��4�\�\�F\��U	\����K9[��\0d\�+�\0�\�˴�d!8�\�\��z\� dֺ��� Y\��+\��B�<|\�V��>i\� ����\�\�\�\�x�yS/\��g�^\�\�6;��\"�\�\�#�v:������X#b;2׷(+9O�S\�.tG�\�c[{r\n\�\�<p+B\�RK��)�W\�\Z��,��@��\0B�+̴\�j:M�^2\�\�Sڸ�J\�m�Z\�Kk��E�v$ *qZZ.��[JZ\�pc\�\�]ݭ���jѲD\�\'5\�JL�xҎ\�n\�L��?CZ71��(\�+9c-/\�[Ev�\'8\�f\�lq�Z��x\�#pr*\�\�\�6\�!�G�75\�G�r� \�VD��B�(%\��Ÿ�S�\�r7\��b��AW��ל\�Ŕ9^�8��1��\�^\\�\�3q�\�\�ЕS�j�+RDH	\�W̾\�\�4{\�\�d<\�Кv�my\n�g8׳���M.&���7�z\�y&QN;\�v峎Et\�\�+3�\�D�m�8#�\�iF�\r�c��\"������ �Io�\��\r\�\�}ߩ���\�\�_7x\�\�Q\�,�\�>|\�\�UF6e\�ù\�\�]��e�W$�Զ�m�\'<V\��K�Ǔ��\�\ruv��X�o%�v\�q:ы՞�(Jj\�\�j�a\r�՟��tXfC�\�\n\�n��\�\�$�\�\�e��f��kd\�p\�\�\�T��j�-a���\�\�b>�r�\��\"�-NUC��^�\�\�l5\�\�\�k~��%�c\�27�W<�p\�\�\���\�\�y<\�\�FVl�\�(2d�\'��^խx&	,\�Vq\�����\�\�,Լ�*�=��\�a\�{�\rE;[\�y4\ZL�a�\�/\�6\�\�6�^�.�Q�ݎ�\�\�a\�\�f@FzV?Y�C�\�|�M\�\�0����\�f�\�\�F�t��/�\��	J�HFG��)ɴَ)(\�\"sL\�\�\�;�\�9\\\�5:\��l�I��Z\nX\n:��k	\�\r4\�\��{H-\"\�D�Jň�\�S�@ǽK-\�\�V\�Vrqɪ�?<�\�Uf\�lD|���g�jr1U�,W�\�C�s�\�˯\�A��btu7�\�q^�S��7�V�S�R�\"��ǔ��s\��)#�LU�t�R$�Fj9bW�\�U\�\�S\�y�\�Ľ$\n��\�\�gK*\�1ߵ��\����jͽ��nc��\�\�~�k%έ	u$(\�;\n��\nc�Ȭ\�e��o�TWd\�6�\n�(S�om\�\'[���\��\�i�w�Y\�ec|l\���?i�V\�O�\�\�zE��\�\0��\�K����� \�\�W,+j\�ڎe\�ʤ�G�\�\'�\���=]%bjo\0��#�9?�\�Wy��h�X\�\�B5��iw\ZG�.\"��\�\�#�P\�J=:�<]*�k�^U���\�\�[޿S\�\�L�X�u\�I���\�\�+�^6?�?J��*��ry�Z�\�\�9��\"M1D�?��]�\0\�\n��FtQ�%3Aľ7�yy�ώ/�2\�\�	\Z\�\�Lж_\�	J\�k���\�\�\�^+��.\�HB���^i\��k\�.nt��Oe���\Z��x�Y��&\���\�\��ֵ��D�#\�V�ݎY\�傾\�%h#���f\�\����n�W�\�\��@\�J\�UkSL��l<���H5\�:�Sks̆2�Y�Ŧ\�~\�\�MߵY��7Ē)�=k�xgѮ�\�n\�����\�\�h\�\0!���sZ\�\�OC%t\�Q2��=�j�\�\�`���\�v�\�\�E\�1\�x㚤S���Ҙ�JF}��\�\�\�Z\�d�Ϡ#�M\���\���Օ\�U\�\n=Mtvz�\�]̲I�<���ں�ғ�tݞv#	Y\�y�I>��\�pa�\�P>�cַ<!\�\�cŷ�p\�\�$�\0,\�!��\0/���!�mJI����ɒ�PH\�{�, �\��\�V3H\\n,k\�h\�t��S\�*\�}�F�\��믃^1=\���i\\N��\��{I\�eN�z�W\��BXlVw\�c .\�\�ӭvC���Ւ��ҡJ[�]�Z�\�X�x��;#�]U��GDZ�Ɩq\�\�ەdR\�:���\�+\�\�1،L�\Z�\�QZC�a\�R�\�ٹY���߰�\�4�؆6\���U}�V��K]�3��\��\�S\�\"v��\�0k\�iÕ�?\�5&���=+pA\��}j\r�\�d\�}��c4\�k\�<\�������\�9�ۛU��\�Pѧ1^IN\��~����Fg�on�\�j7L\�\�2pZ�Q7s\�5VmGR�)\�$�\�\'\�N�f��J��aqI\n\�Q<��=\�x��^ܳ��W\\\�\�Fܚ�\�H�\�1\�w\�3^\�\nn|�Z;�ᔚ\�Iݞ-�_\\��t\�(�cH�,�@E\�i>�X\�W,dv\�\���ya�\�.\�\�Q�:�$6�4=�\��\Z�8�՛\�j�#\��\�p�x�H$\�1m4[\�̙$�\�R=�q�\�V��:�\��:	�nT�\\z�\�I\Z���\�o&�\�\�L�I`9g�ձ���\�v\�te9\�1]�t�C�,�0D�Rȹ�\�\"�,���U�\�x��\Z8�<�\�S\�ty%\�<G��\�̻z+���-Ṻ��ټ�ҳ)>nخs\�n�ꚫF6�{��\�V|1-\�\��%\�-&���ެq)͹\�u\Zt��\�d�Z��(T\�\�*j�\�\�s8║ьr�R:�*/�\�0\�5��ʖ�3./✟/\�9\�*�G<��V��(\�\"�\�*�̪���SW-\�R\�R]�PT Q\�\�cB\�\��Z�@h&Q!�G���]w�\�\�\�\�& n�\��U\�m\"\�=R}E\"<Ȩ\�\�ҽJ4����\"��\���q>)E+�\�\�M0�)\�DOj�\��Ve\���3�\ZG<*�\�\�ӽ��aSF�ҳf�>}�Ɔ\�O��3\�v\�\�ˎ¸��O�4�ԴG�5̖\�\�(�\�睧�5\�V\\�g\�\�5U\\\"\�\�-�u>\�\r�\�Z\�G�pF9\�\'c^��\�Ҽ #�k\�<=z����\��\�N;\�~5\�R=M1t��\�]\�\"=��)\� \���b��\� \�I�P\"�\�W�&�7~iV\�Y�I��I�)��Ic\ZhLA\�+�\�s\�\��A���t����0+\�ln\�h�ֳ��aFnj^�w���\�ҵ>]4jza\'\n\�\�\�?�HU\�4\�\���\'m�	��\�iE\�H\�ӗ�\� �*��\�B(\�\��\�MJ��.3\�&Nkѱ\���\n�C�3\�\�e��U�Y\�$�S$��EV�\�u�\n\r>U�\��N\��/�)�2�Pj\�2�/|\�I��mguj���\�E�\�\'3HH �P♬g%��\��(\�T�Gd����G\�\�nw�5]F=8���\�\�\����\�%��!�T�aYIF\�0S�dӵ\�\Zӭ⺲P\���F��\�_d\�<�q�D#\�+F�O2 5�S\"�%�\�\�c*/Yp<�\�sU���\'\�Yw�\�9�),-[�g\�L\��\��\0$J���\�\�J�We����\�\�O@�\�7 㩭[�\Z#(��]n&�\�\"���dd�\�c[R��9+Ÿ�z��<9i�\��<\�\�n\��W\�wP�h\�B���_N\�:�\�\�\�B�g ����j�\�s�\�k+��;w{W�\n\�0vٞ��\�-ѥ�\�\�ieC\�9��\���\�j�#E�\�q\�Rn!WvEy�m�ݧe�\�sAa��\�\�>2\��{�!�vJ���s���px\�cR[\"v��\�t�#\�^A\�7+yl�4\�v\�ҽ�=\�\�N}�\�V\Ze\�S�hn#n�\�]TjrnsU�ϱ\��:\�\�\�v<M#�\�FE{޻e\�\�\�8\�k�4K[Z� ��$�t\�}?�Q=��s\�V�\Z�ݎT�JJ�\�=�]�𭐧�#\�=��0\�\�S�\0\�V=�\�\\b��1N\"��j\n |R\��\�ݥ\�N�ǐ\�PMt��!�\�J\�ƣ>y�XO\�K�Rwo9\���H\�ry&��\ZX���\�7WV=T\���\�ww6�|T*OQ�\rt\�H\�΂\�iH��\0\��\0�\��V|6\�9^�}+vgA�b�{�\�F\�\�ج�n�$�L{�B���Lv&�\�ë���:UE٘T�\�D�}�\ZN�\�\�\��9\\�q\�^�)R�$\n�\�\�ݑ\�w��\0\�6�;<yH�N+�J�<�A5HB�\��°\�Es[vPj�ȡ\�waԏ�MV���\�\\����J�OTz�[^\�3n�D\�\�d�{nӜ\�\0+p��@E\�}=\�wJ��\'�n��=�!&]i\��2,�)ne�\�E�\�Y��\�\���G\�]��@bS\�<דx�m\�g�)\�z4i%dx��\�Z���\�Gk\�r\�F\�]Td8�\��\�%�0���j�\'\0�ƪJͣ˙&�{0j@\Z�@�0�:ZɣQxϾ:\�4{�8Ҕr:c\�R\Zg���\�\�2\"\0��f�%\�\�q��{�8\�\�1�ȯ0\��{\�6>\\e�<`W5Jn�G����QoTa.D��\�59��x���0$�ҳ)�\��β�ؘ\�#��ʨ\�\r\��\0$�ϥhE��`��l[�R>U0iX \�\�P��q\�]rFW#o�ֳ^\�\'!���b�Kfcl\�\�i�һ�\'B��\�5\�jw�R�\���Ջ��\�S!lw���+DI��0�\�I�\"�\'>S����8\�Ԛ�>t\�>�Mg%������F	c\Z\�-KBR\'(Lkү\�yi��9�\�DC+  \�\�9�\�$7\0t���E[8�\�m�OlU�\�jUڠU����\�.\�\�\�m��w\0g+^\"\�SY\�oQ��S_@;{ג��Ymo6�[�q#�s[ґ\�VQc</\�8\���SY������u�i���d��i\�n���f��Z%̨:��SJHT�\�$c\�[r�c��\�Mm�ӊ\�\�\�\�Sl�\��K,\0u\�y�cf{�\'̎R zݫU`�wu�6k1�\�\�~�H_���o�s\�S����)Ul\�a]e\\�b�$p\�V�\�l$>~�\��N���h\"y\�\�ZAjEI��7P�q�\�\�랙=��\�\�	��l�G@�W?�sX���y� p��c\���3J�O�H�pq\�v�X�qro[��ZC��m#��*�\�\�Mo^ۇRz�\�\�\�\�5t\�G�:g���L�92#��\�Y\�\"�@ό��+\�u�!�\�G���=�\�R\�jWLR2[vG8Q�ԥ�4�\�S\�4\�\�\�`�+��el\�<�\�p�r5����zg\�Ӵ�\"c>��6�}\�\�p��\�J���\�\�PetF\��w#$\�	\�/��d*u\�]T\�H5����Q$�\���\�V,��I\�\\�\�\� ���+J-D�y�ŎF}*�3muW\�u�~\�\�bs\�>>f\�w\�jbM\� �2=CW<Q\��I����Rpg���\�SG�IdpF;t��\��^m\�YJ��\�9\�\�J\�4\�Ż�\0�W�J�����\�\ZlYy7|R�\��\�zA��@\�*\�3[\�ᵙ\'$�\�P8$�\����@\0I\�Q�,�Q\�5���X\�ՙ\�è��ݑМ�Y�(\�\�@?J\�A��ی+�G�Cd}&��Pq�$W_�B\�k\�!\�m~\�\n��z��\�#�\�`v���N��C� �X�\�M|\�t\�K\������u\�\�\�l\���s��9\�\��ꆢH�>;ո0cL�U=Kp�\rV-�#\�\'\�\��\�|�5�X�I�ھ�����\���^�*<�-���;�#\�+v[2�\�S��+.\���\��u���\�g=\�E]16\�ڬ\�108�Mna}\�	r\"�G����Yԋ�\�+�\�6\�\� Ffa�2Ma܇�S =MqZ�\�ޤ\�\�v��,EeIy��j�\�ГU\�fԥ0[\�F	\�\�u��^Xdի{d�F֮��\�^%Z�r�w>��(Ӎ��\0qVm��Ꮈ�˫�����Ɏ�\�R帮\\j�s0]�g�5��\�8Ic�U	�p\�\�^k��mY\�֯\�\�n\�%����%\�F\Z��Dn¼\�EY\�p��P\�t�P�x��B\�8*O��\��O�*Q\�8|�v3\"�T�E<c4p3\�Rh�k\���#\�v�pz�������qS\�V5�*�i�ѫ*3\�_3\�YF��\�8\�W��#V����X؞W�\\[~\�\�6F=y�(�X��\�!(�3FRd������#��j�\�:C2�Ϩ\�O��m\\�3D`\�5猑B\�I\�\�\�\�	\�z�/\Zh��j\r<`��?�&��I�f�L�sK\�\r�6U+�! �j\�N�Q\�\�\�V�{=\�\�uy�\��G�ñ춷�\�\Z�H��\�׃��e=:�NK��:L\r�\�\�pN3��M3\�<>.*T\��\�\�LW8�\�u}:\�?i�H����W�\�[�O�l�n\�\�f\�躮�9+\�X嘩\�>�\�%)=d� ��8\�#���\�u\�\�,\� J��V\"x�Q���ϖ\'�\�\\��-˲,��`3^\�\�߇�v�\n\�<bYz�^��u4\�ʏ3��ƌ�N[&�4\�58nf�n~VSц	�h\�Z�0:\Z\�վ\Z\�\Z�\�}\�C0\�Ε��x1�g��\�����\��\�Y�Y�W�\�\�SH�c.�`W^�S���\�aR<�hڔ�9)#\�c*��Ȫ�;?\0\��OM�\�F`\�Xŝ9\�:ׇZ2g\�a�F�L�j�T��\�5�p\�2�}++\�\�9kD]�`\rbu���,\�q\�L�K��T\�\'�\�\0d��ď\���{\�$�\�VpI8\�p�\�,Ӱ��y&�u�\\\�\Z8�$t\�i�~�up\�\r\�{\"��q��\�\'0��\�_�\�\�\�\0\�\�\��@\�\�]\\p=+\�u\�/-\�]~R�\n�\�\�i�#\���\�^\�F�Y�\�\�S�)\�	ݟZ\�\�`���\�j\��=\�+]v+�H\0ܙ\�t\��⒒j\�έқ���[�j=\�+5@\�q�2��{�F?\Z�ma6\\H��c5\�\�a�\�yϊ\�\�̱�vrk�h8Y(TW\�x���\�&�3��V��8`1�j�-�\�g�S�c�˕`¼Z��KC�M75�\�pT\�b��\�*�aɫ�߁�\�B�ɮG&z\n\�l)\�\�p)�\�G\�(�)�g\"�m���\�<�\��\��T��*�]I������vU�\�ޯ&�ˈ��\�8\�]&�\�p+��\�׺���.|��\�df��8\�ϕ\��î�Lf<�01^�\�õcize��f�\"��\��5|��r�mwAr\��K�W4]�sL\�U\��sR�\�\�$��(\�=��(f8\�h�P�ҳ�c5�sv����Y�Z+\�b�\�\�\�\�\�,;Ոc\�8\�\�61\�N\�T\�8\�+GgRj�\�\�u�cH��+�\�\�|�\0s��k��S�q�3Ҽ\�x�Q��{}`|�q�1\�+��\�z8:r���ӡiw0ǥ!��ee��\"{\Z��\�\�\�z��^:\��>\�MB\�F��\�\�\�U�M/N�\�}:��1��\n\�5oMrV\�O�\�E�dp\�W>I\�5�=\�\�\�X\�ơq\�e�v��Wz�\�[o�&%Fo�^�\��ؠ����|\�*�I&\�}\�vȥ{\Z�\���\�*\�s�+�08��\�\�O֣k-\�k� �5��\�L\"\�Z\�\�&��(�\�B-&\�\�c��H\�\�%W��\\O��˭:�TY\�*ۆӎ$�+\�^*�Ѥa\��i�z�H����\�\��*��\�\�s{Kjx߄\�\��^�����\�r�!�\��N��N�b8\�[\���M�\��	:F\\��%��hf��K��v\�\�S^U�\�\�}�Z�}94l�cE^+����W7>���z\Z\�UB\0��\�\�\�\"\�x�@�b8��S\�A>盘M\�Q��N\�]�vD\�c�(��\�l.\�x\�tf\�˴\���Q�\�[;�E�enz�^K���\�\�-\�m\"�L⾏AN����\�J�&�u�$�2���9��]Z�k)�s�ekCB\���[\\67�(|��sZN�����yd\�[g	^)��9\�\��\�\\��9\�blf�n\'׵�a�PY$��;�o|{\�O$-#�jޑk\�jE�>T,���j�^dW��)?#\�.|\r��d�o(�|\�[��=\�ӧ+�y�1Ih\�.\�g�g�/,\�\�\�丌1W]ܞՇmsgq&��H)Dv�A�����h�������$ތ\�E\���L�.�qBa�8#ھ��屶\�\� `Kd\��\�5�^�\�֔\�6��\��CYK�\n��� �}�\�̶@�\����Ẳ`3�j��jq��n3ڰ:\�\�h%\�%\\\�D9�+�kܼc�D��oʼI\�\rxٗ�S�\��K�ԗi�\�\�Q�\rr�[�9�E_ή\\��NqY�c,����\��z�\�+͌y�\�J\\��ZM[ieKy6O\�=\Z�u����\��ө\0�?J\��\���9\�O˶EC��\��`3�u)�J��L\��߃�\��5Z\�Wi��b��܌\n\�\�t��3\�\�@\0V-\�\�w�M�=+3U�Am\"�\�\�g$k�?Ux��\Zu\�\�\�{\'s�T\�w�<�yP\��$���d\"�J����\�@�]C@\�nȚ\�#\���|�?�n4��T�>e�6\�nڄu>ƽg\�֭mᘑ[\��4g�\�+\�\�;#\�\�Tg8��9��1\rN9�r@�\�\Zˑ�y\�\�<Ci�k�\'\�\�n\�Á��q,�`\nz\�\�י^��I#\�\�\�U)E�\�q7qZv�\�.�$���\�͌��\�+�\�l�\�\�P�\�<Àq\�SJұu�\�g\�g~�?rAS#C뺽�O�K{h�	\Z\�\�hR\�o��f��I��	�E�v�w\�h�ݴyx\�ї,b�\��f�Нv�*.��s��\�xR�xs\����n#\�\�\�\r�u�ù��_u=CT��\�v�=\�ʰ�ni\�:W���B$Ɔ2�Jc#1�%JRL\�\�T\�&���x�\�\�m����\�8�}q[��2��!,�r�z�\0Ègy&\�\�9\���\ry|�>!Х�\�Ń�d5\�֥8�Q�>��\\\�f�\�v�K��T\�\\\�\�:4��\�G&����U&`\�Ue\�*�\�\�>y�V*-?R�\�z�\�66�0\�[<\�:��r<s]��ܜs^S��B�-F�\�^Y���v/�׭ �ZN7g\�c\�ҥY\�n:I�\��qAQ�\�A5\�pn*\r\�9��_�U�O\�I�K\ZpI�*UR&��Բ\�����nA\Z��ĚC\�z\�ղ)¶\��\0q������^�\�]\�j(��\�G/s���LDn�\���|O��\�\'\�\�~\'\�8\�u\�\�M\�QdlCr<�\��MP\�����ȋ��?)�V\Z��=�\\V���Q�M��G΂\'e�\�\�\�x\�Pqܞ��xvH�G�ZN\�U�&\�RV�Ȣ�\�%H\�j���\n\\\�\�c\�\�\�t[�\�Fl:E�\\��ߥ]\"u*��j\�|a\�ۍD��D32\�v~�+\�5j���\�v\�@8�삎�&*r�,^\�\�\Z��a�\�e\�C\nAˊ�m\Z\�\�\n��\�W\�I�NB\�\�ŉ9\�9��M\�\�,�����\�\�_E�5�:Jn�6K��Ӵ\�\�\rZ\�\�`4�	�\0~� �A*��PeЇ^{�\"�h\��U��=\�B�F\rD\�ި\�M�X\�\��$z\�������<	E�\�\�\�ާ\�cSԁN\��*�R��E\"\�#\�\�0�\�8�jZk\n\nG?\�\r-5m.\�\�?3.SهJ�]+\�ڎ�3ZN<\�#fF��Y1\�_B4dr+ɼu᧜�N\�2꿿@:\�����^\��2ڔd\�\n�r\�o&l�\�B\�Ԃ�~?CX�H$\�yƓ�\�h��{s\�y\�\�\�ע��e����n��?\�F�9\�zs\�N�\��qBA8�s.\�8\���c#��\�P\\J�r\rbfу$\�\��\�*�\�q�\�\�Z\�N�	\�\���Eѣ�{�\�\�UO@+jprzu\�\Zq��\�E��\\a�\�Eo�	��\�+N�UB�ګ\\�-zp\\�H�*K�m���\�\�\�\�nV)�;Oc\\�i:��asl\����a^�\����⪞w�3�S\�N���ʤ�d*\��S/b1�\�\�\�M8P\�\�=\�W�\�mo>�#zdU�,m\�\�\�\�Tc�c�w\�\��\�ڞo�(;\�~A���ݛ@}N\�dТu��\�졓/\�oP*@��N���(�,T�ǘ\�\�\�t�&G�f�Dgx�� \�zw�t�D��^	q\�W��h\�A\�5\�\�2\�%\�gyR2-\�|��hj\�V\�\'\n��=^�?W��7̽����%�X$*߁����\�\�kgea\�{7\�W�h~(�\�\��%+�\\�\���\�J\�T�ң�w����1\�)�&+�\��Cg��-1X\�j.[#��Eg\�!�$�8\�z��\'�f�Ӣ`͕\�ԟ�p�����\\�2\�\�\�<ר�?\�\�E\�\�\�3��QZ\�1N�:穫茛O\�\�\�\�	q/\�r�\�Siz.��i�my\Z.\�NF	\�}bX\�\0V>��0n�\Z\�\�G\�\\\�c�H�\�h��X5]Pyd\��\0pz\�KS�l-\�J\�ہҫ\�n��\�5i�*CI�dD@\�M\�c�\�\�}�cZ�qғM_�T�U爌\Z\�[d�6y毣\�iW?\�:y�W\�Ş*��q�wo$O��\�+��F���o\n\�\�\�zN�\�\�ZH\"\r\��f�����Ui�=\�\��+/i�q��o=\�\�\�U\�\n\�P[��,RG\�\���\0�����m\n*J��M½I	o=E:j\�:ћ���L�\�\�\��pEy�\0�팩UR\�\��\�\����\"\�\�2�+�3�G�8�!\�4�KԤ\�C}\�+\�-n��㱮V?\�$\�!�C��v�\�\�\�;8��z�����Ft\�(\�L	S\�ޥj��<��n���M�A\�]ù\�T�~5hc�JVq������Z�*\�*\���j\�S\��r����\�\�x~\�\�\0X1Ӝ�\�~\�{�?7��sWV7���Z�8$�IӋ7�\"q����\�\�-��X���>���\�\�K{�w�̃\�\�Wl�)m�:f\�Oq�J\�5}Q\�\'7v,\��z\�3��\�B��\�\�\�f0\�\�p=Ed_IF\�k�_�\r��Ѹ$r*�ֱ\�v��\�k\�\�L\�2D�\�\�:\�7IGKU\�\n�9Z�mw�	)\��MSW�K�\"�F\����>�$\�d��\��wQ�t\��\�\�\�)w\�$���\0�\�ŋ3��ֹ�\�\�^�\�s�������nr{\�Z��i��[���Q�*�@bs^��\�}�\�F9#�J1\�U\'h�p�0{sS0\'=i`S�Ҵ8\�6\�	\�`�A!A�g��U�\�4*��q\�R�-\\\��\rNC é\�	��!�[e(;\�\�sU\�I\�1\�\�\�U��8;\�gI��ei\�Nv�QZsn\�2BA\�:V�\�0i,\�9\�k���\��	J:1Ns\�\Z\�w{��\nPqN2ױ\�\\\�+=Er���\�\�̃\����ou\�k�f��9B9�fk�� \ZÔ\�T���F�K��}�buɯN���W[x\�׵x\�Z���\�\�\�\�\0X�N+����\�\�\�]J͵�\�:3��\�ܴ�\�1r:��z\�0�\��Vd{]	�4�T�\�p8\��W6\��\��OLv��\�Lf�Yf\�[�\�\�m	�ϼi0ް�H\�\�X��-#�ic#*zNj��us�.J��\0�\�i\�L�أ\08ϮE\\�\�L\�E�.\�Ļ\����Q[vwJ+��\n�|\�ߝtkm\�.\�|7\�EqT\��0��xĬK�gӚC� �\����4�\�0=?\nW�\��Ñ\�rqXh�, 6\���\�3PKr�Dy\0�\�^jv\�\�hݎ�=��\�&܇9\�\��Q�F\�d�\�f2m\�bzzբ�\�\�\�q\�\�\�\�\�	�\�7�9�\����۴�f	s\�\�̉��\�ER��\�nʮp�\�O�	�\�\�\�Fk\�Ng\�X\��W	֢٘�t��\�1b\�G<c�[\��\�W!�K$R\�`x\�\'�׊\��\�\0�t�J�Nt|\�&��6� d`⑱��ސ&�x\�vFp9歙Cr[!�\��#�y� \�d<��u��rV\�5�pH\�j��!\�\��\\�=\Z;\�\� \�1\�(\�X\�o\����yf�n�\"UPg�k\��\�$1$º)���?���;� �\0� b�y��I\�k\�<k)�ó`�K(\�xU��W-\�9�\�KUn0N)֬\r�`��[�\�\�I�i,�Sn�/j�����챀M9��\�HU;�v��w\�z׮y\�\�\�\�5\�F\"\�=+�\�_z�z�޺؆\�\�\�\\�7=:\�-�ĉ�=\�>H$����\'�i�ږU\�#�V-�)~�z1మ~4D@*ϊ\"��XB�x\�+��Ԓd\�����mܙ\�e��&\�j�\�T�ּ\�m6�vטz�ОI�S\�\�Y�9��\�\�;J��H\�vȭ5�1�\�*��\�)�FQJ�g\�\�V4�3\������0\0�\�5�},B\�\�ԭc1:�\�<\���c�\�\�\�Fg�XCo\Zp\��\�\�pUH�.ҼEo�?���zWq�_\�v�>H�\�hq�o\���,\rA�c��\�(��\0R����H3\�!�I\�\�\\����v\�\�k�c5Q\� 9&0\�\�\�5�0i\�s�N(.\�+]\�f��L+�MR\�4I�c(#�k\�B҅��]9\\\�&�a\�s:�� �3�\�h\\\��\�\�\0���+X\�^\\$1�$qE�\�Fx׉<%�;گRN\�\�\�͡\�\�\�b���o\�_\Zx\�\�\�\�\�l�\�#a�w5\�Y�\0o\�]+�Q\�\�k��8�\�{�3-��mu�7\�<�Z2J\�\�ps�]@\��\�apDaFv�\r%��y*?�u Gsֺ}#\�Mq������죅�A{��y�+\Z״��d�;?i\�-�\�\'.º�P�*8\�\�EUQ�*M�V�m�\�\r`у�b�i�\0;ԁy�hi���+p��5\�Z��-�vPJg��[�+.�\�z>T+��Uy�8|L�I>�Q\�gt�(qWR+�\�\�Q\�4�y��t;�1\�f�Z�\�#g��x�\"\�ɦ}5\ZʬL\��\��c�ƾ\�\��\0\�OS\�QM�j:� )�<�\�\�\�O1\�09=\�����\���䌱<�\�M1a�\�;2{��b�x,X�Oy�\�m�\�9X\�\�޽�������ͱP�y;�~(�Lұ�3�\�\�qw:d)lUT��w^�_k���ѣ,��k\�|=d5�\�$\��\�#��G\�\�\�ɫ*U�\�Ћ��~�\�:������8\���\�Y�~���ƃ\0T\�F�5\�J<��\�\�~!bk9%e�47\\�jl�+5\�XyS\�rE^	J���6.`b�u;D����\�\��s�\0\�6>{\�|�5\�a(�\��T�1QXY]i�A;#0=W�{m\�\�Ed�^\r�x�\�mbH#!����\ry��q\�v=L\ry�D�\�k�(���s 5\�[\�\�T�R\�q0\�\��5\�IY�O	]\Z\�$\�8\�F�\��f�[\�\�z2�\�2H�E[>�\�f�v�@�h\�2�I��*��\�I�\�^\�i\�3Ef~�ݜU �4\�jA��̄g�N/㱀��\�犭\Z��k\'\�jK̐Fr\�\�֛�9+Y#�\�<M5\�\�ٮ �\�\�2k�\�\'�\"�x\��7\�61�3���G\�\�\�Sf�\�3^�\��\�7ؿ<f�<�݈\�̶i�7\�.E�Es��!�\�\�\rFW�\�ʰ˩�\��\��\�\�\�њxP*\ZDa\�as�\\\nU\�E\�H*��\rZ�\�*X\����5�h\�\�b����/\�⻫�\�\�m\�B���WͺΧ.�-̌p\�\n����\'����ЕI�\�kۛyCC+�\r�\�tR���\�Y���B˂cS\�d\�V?\�\Z��\n�\�\�\�0\����T-(Q������ay}\�\�<OM���{\�|�O�\�^���IҘHP\�/w~!]\�DA���?:�w\��q�z�W\�d6\�\�\0\0\0\0���\�Mx�=k�1<�\�\�\�Uآ\�\"�M�*\��WL\"a&H�rju\\\�qS�5�Fm��\�eܮ̷����\�i�\�\�+�|���\Z�\�E���)I%�g���\��xP��\�%u^>���.sJ#�i��O�\�9cS%�Td��r{\n���\�\�YNR\�3��IlRǰ$�촍��Kx�0����GJ\��9\�ӑ\'� ���:��\���@\�����_\�ԑ^�\�j�Z�G��c�K҆\�_sɵN�MC<��&w�����-{\�\�޼��\�ٽ9�����\�jVS\�\�2\�!\�\�_$\�\�t�\�I\�\�\�6$E,�;Ek�\�W�nUG\�y~2s��q�v�Һ;_M���7I\06$�(oƻ�m愔a\�|\��70�+z\�\��չA��S��\�+\�u�\�mjϰ��r�\�jh�\�=�E�\'_&��\�jX��H�\�^kD�5����A1<\� )�\�x\�Y\�o\�-t�:aspg^#\�F8�>洄�uOS\���\�\"4�\�V�\�\�c;\�\�W�#֭��e�\�\�.\���\��\�w_�\�\�\��\�$��FS0}ֵ�\�\�|5�bL=\�\�4\���{\n\�>G��\n�\�\�m�H�L���j�\"�\�Dҵ\�s\�t\�Xx�\�H�Kw�	��!�\�!@s�Aq�9*�3]�\��\�EhMڅ���\�hs~\'\0h\�\�\��+�J�ħ:-�L,x�\�s4HN\�x���#�\�\��7�\�\n\�\�\�p\�wO\�[D\�b�\�vE\�ץMe\")ܼT�𞗮jW2\�C\�5�B�<s\�&�p�TWGv)7I\�bm#G�h�\�*\�\�\�\n\�G�_\�\��5\�24Gc����~\�\�1\�Y<�\�\�\'�x*�\0\�+�\��q-��V�\����VRx�\�\��&_�jJǥ�\�\�W�ƭƦ��\�G�\�\rRs\�\�\��]B�\�ks��\�}S60�5\�\�8�\�4\�[�g]��$�Tm�3y�\�\�\�m\�da\�a]����M|�\�U��\�\�FJ�\0\�]hsk-�?�\��a�s��F];D6qt�ب\�\�\�����-�K\�me淈\r6�6��<0\��-}Z謤 ׃\�uY\���;\�\��D9=+ѧ�ūV���\�\�k�o\�\�HfNq\�W�j:}Ν�3\�*y#�\�X��\�t\r@ǩ6\�lE�烚��!��\n\�C�\�\�\�X�<j�>\�V*/k��<Q�E��\\W��l��x����=*������hbgW|�v���\�\�5�x�`5\�J�\�\�WG�_N�V}\�(��<b��\�\�^��\n\�20@5\�V�����f��qeQX\Z\�ݥ��\�7	\Z\��^G�:�e���nd��\�+\�\�5�\�\�)<F&�;�^���+\�Z\����\�h\'�j\��\�\�y\��\�����5/wnA3G�ν\�\�V�hwp6\�\�9�-F\�\�\�k�5ZV喌\��^H&��,vm��ǡ\�{R����\0\�\�m\���7@�?J�\�\�]�w\�9�AG\�x�<��a\��\��%�\�\�t\�u7L\�w\�\�F;\�Q㨹;#�4͘|\� �\'�$C�u֧\�I�\�QiF1IKR\��ц\\c�\�R�����٤]�GX�͞�m<@��P8���5M*\�I��\�\�=��\�=�v\"�� W3\�X붦)\�kc�}\�5\�R�T{�~c:/��\��\�\�Ȗ�Nߕ�W�3�q_8\��\��b7�Ts��tt�a]�\0ĉd����\�W�\�\rDeh���\\MuV��f��9\�\�\�u�]�Q�j�q��\Z���B\�j+I,�\�rI5\�~�,6!.�@�\�r�\�c�\0M\'#��&�\n�y��$��g�G�\�xz\�k\Z\�0� A�Hݳ\\��\��O\�	5��&ܾY;�:d\�\��1\�4mWHx�\\�Q�\�V\�\�\�\�\�\��D��\"yE�?����oe��,^#��2\�k.�px�WeO2p\�u\�U�\��R؂#�\�9\�J\�<�׉�w��\����\�˞\��i�}?�\�Ư���\�\�\ZZ\�S˦\�As̈�U�\���J����\�|d�r7B�JRl�s����E�r�v\"�N?gc�}4\�5\';i\'\�\�C��\�L�\�-0��f�z� �f�7Q��HO5,��\��_\�\�\"�K\�9!$\����W���[I�6ea׵}a,Jk�\���깗\��&\�$|g\�+�t�\��ih*u�ke#\�4����n@�:����-*\�\�`�N+\�u}6\�@\�Z!ܟ28\�[��?\�m`H����\�kM\\\��ҕ5#\�`���\��M\�`\�`��\�\�\�Z�	\�\Z�\�p\0\�\��v\�+x\"\�\'���mXx{\�Z\�\�6�t�Vra\r\�\�\� \�\�1<lN�W5z��=\�\�.#lw���U��w-��khc��cEڪ0�v\�H\�5u��\ni&\�\":UiS\0��\�9G\�\�J�\naKrZ��\�DIL��\��H��3G^ؤN)\�,�ƕ\�;�[{\�Z\��9�`TM�\�Y\�\�i\�\�;T�~��A��\�\�\�Ȝ^C�xcU�\�\�]\�\"H�\�G�Q^\�j�\�l\r,\�*\�Z�[\��Sė\�4w+�}�+	\��0�4���\�lK\��,!>\�D\�y;�\�rI��޸�&wf\�\�A��=�Z\�\�>)\�\�֟\"Z��/1\�1\�w�Q�;j�xj2�Q\�\��ND�uY\'=[=�\�\�UA۵=\"\�\�j\\s]�H����֓rd`U{\���b��QUc\�\�3˝^-Þ534x5\�\��\�a&2�\�\\\�m \�\���\�\�|\�LT��}Xj�\�\n�������@�\�\�t\�N{�\�HXn\�\�=\r8\�\�uj(�\ZN>Ι\�~U���qaҬɌpk{hyҕ\�r\Z���u�\�]\�5�4\�f񞌄\Z�\�\�\\Z��r=���8�wzTX\�V\�Wc\�k\�6���ђ�\�O\���p�ֱ�c��8\�C^i\�\�\�}\�\��%̐j$��q\�\"�h\�WN8�2��J\�)\�8\�)Hn�*�XlV\��\�nBW8�\�8w���F\�+Tf\�F[\0Ѵ���Q$���N*Q�w4\�E\�\'5az`\�h\0=jD?��<s\�\�\�8�\�4 {\�6?ZN������\��tV�1VO=j6\�\�\�z�\'c�\���\�#����\�k\���m.c�pA\�_Dݿ��v�ׄk�is~���Z\�QH�0*N黣�\rq.FOL\�u:�u�\�$�R臁�\�V����fI�\�9\'�\��\�\�i����\��\�Y5�*S\�\�#\�\�m�\0\�\�N�M�\�x�l֍��#񚶡y\�ֶH����\�\�\�\��\�\�\\.\�\�T\\�j+ܑN\�99n^\r��\��*1�t\�\�R\��\0\�\nD��\��\�v��\�89\�@\�	\�{�iS�\��^��\0m\�w\Z*��\�]\�Z].\'�X{�\�\�\�F=��P�y4��ri�\��G�\�Vp3$e]�!zq\�5\��\Z��&�W\�R���`u�\�xZ;\��nSr�\�Y\��iMB�rg���#O��{��o,d�A��Q�R]�J�\"`�\�q��<W�\\X_h7y@\�\�s�\�E\"�����v>�\\R�m\�p~�L:�K�e2��+�2�!#ӊ\�=Z2��h\�<K\�k}$|\��\�5\�\Zߎ/.w\�lB�8�o]��;�,�\��5\�n,O��+��U�>�iع��g�I<�\�5\�躄\�\\Ĳ\�\�\�����!\�pEt\�3\�\�7��q�9�\�L��t\�d�r�:�Sڰ\\�\�\0\�-\rCK�Y�\�q޲\���m�S�I\�ԍ�o4\�\�Q�\�sP�&u\�OR\��G\�`\�\�\�\�\\\�\�!D�#h8*\rb�Y+�c-[p[y�8\�\�\�b{tO%��x\�\�V�1��.\�\�t�;[�F{�y�k\�z=?;�����\�;�\�c�5\�x�\�PS��`�5��}b��\�GZ�U1U\'5�+�\n�\�Ҹ�D\�l$�\�ݫ�����\�A\�F5\�#\�\�d\�w\�\����?U����K��r21To�<Rn\�Hڼ��\�\�іF#�]T$\�7F-D	ԯoP=}\�\�\0v\�K�幎;��3��^;W�Xꖺ�j�\�c\�޻otxҧ\�͈�o��m6�\�pA\���p02/$\��5Ѹێ\0$�\�h\�}!�\�\�s)\�\�\�EzN�1�\�q\Z**�����\�lT\�I\�z�e�\�C\�l\�\0^k�0}\0\�k��\�i�\�nA��\�Ew_�D\�hѠ\��Wװ��#\�\��kNT\�)\�S\�C^\�\�\�\�\"���x��\��eA��k\�\�ܮ\ng\'��O�v�?��\r4�����(k�\rQRg���\�f{\�B*����\�+��\�5\�\�\�M[q+N#`P\��,.\'H�Y�\�p�\�*\�ktx�S�\�z\���\�\�Z\�܆\�٬}6/6�/��V��W����\�\�\�QqH\�On)\� \�Ky��\�h(0k3���q+(;�9�&ּ!wm+]iĂyh\�C��jaP�(z�\�V)Ƣ�7�Vt�t|\�,�(�!�[��*\��)��j�\��\�.\�\�|�_M$*��Jmcc� ob+�\�\�s�c\�6�\�;ɃmӮ��\�\�V�\Z��?iw,}v�_D5�l2j�\�\�p\�&�8:dKR۳痳�^�J\'�ww\�b�\�\�{�)\�\�\�M�s��\�\�ڎ\���y/���\��^y|1�\�u*j*\��Wswg9\�ۈ�QB;��M{v��,�\�\n�8\�\��[;k{���W�^ŧO�v�1ZKB�\�\�B�R�c��(\����5�͋*\���Z\�&��\�}�ҕ+ր�$Rq֤RMEؚrc�ƙ84\�|R/&)\0����g\�y�e�J��BI\�^!�\�om�����\�S�Ez�5�\�,%��\r���|�}}>�t�LŚF\'&��mv�\��\����-U�\�\�/vEݍ��\�\�\�I\�k\�|=ko�O\�˒��Ҽ\�H�΀��5�&����|\�N�+L�\�f�K8\�S�{ݛ�\�D,��5{I�\\\\�ڃ\�\�\�W\'xd�\�/Q\�5\��Z͡I$#�89�U�-�Fλ�.\�\�Ҝ\"�(��cvѷ���\�3E�2,S��b��8�0\�g�\�X9�P\���\�<Mi\�3.��kǠ�\n~\\W�ꐴ�:�W�=�\�\�=Mx��|�~G��Kݒ�d),sAe\�&��l-k\�Yn\�\�c5\�J�H�\�K�\r�\��ww�S�\0\�kZ�\�\"��l����+\�4\�x\�ؖ��\�x�+eE\r��`t���\�B)\r��T��\�|\�\�mA�X�\�\�W��;��\�Ryj\�#ӬH����p0y\�M{7�\�㵲\�6\�@\�x�X0M\�\�l`b�\���\�\�F)�\���*\�9��+�\�r;WD\�JθP\�\�+�r�\"����\�0�(�Ǧyf��C�%,�\�>8=�\�\�\�K�nʐx\�_\Zk��Z\�S@\��[�Q&*z\�\�\�|G�7\�:\�x�\�\�$m��Gֲ�Z\�F\�FWֹ@p���zO�\�\�\�\�j!%�q\�ٞ�%$o\�z\��\��\�I\�:z\�o<s(�\"��F\�4\�\�{���\�\�J)W}�ߎ�\�V��ǻ��u�\�3\'*M/اu\�gSL�W��b�J�}\�>iP�5\�Y8\�<\�)ܤ���ÒY��i6�<\�V���`,A\�ݪ\�\"�q\�7\�\�@9\��D��\�e�lrMX�0|\�䚯��rOE�c)���דQ�,S(\�\"sY�N�ue<3\�:\��\�p\�\�k)��\�U��\�\�\�V��J�f9\�zשB�eI�\�\�Q�j\�)�\�j�jv�\"7?\�+W�\��5�]\�ᜐ�\�<]\�횙4\Z�Ԇ���*\�N8�!��\�T)\�!\ZQ�4��~jE\�*	H�\�J\�\�n㴴�W8\n�\�I�\�M%�g�|A՘����nz�ہ�\�oz\�\�/���i���\��;VS\�q\\�>\�AP�uKS_G�\�w�\�+WՖ,$����.k\�L��}\�\�m��\�V$�\Z\�VY3\�\�\�jt\�\�c�E;*eN\�\�ɫx\�E)&	ڭ�\�#Z��[�I�U\�T�R�����1@\�8\�\"�qOb1�Z�f\�\�,<�p���\�^+}}.�|�;~\��S��\�^+�{m|6�\'\�^ka��b�1\�\Z��=l���5G�\��$\�u�/i\�j2\�H2��\�\�\\Ҳ\�Enx&E������N\�HO�\�+��\�F�\�O\�<�w�\�6�FW�ӌ�<U�^;U�\0���\��\�ܵ�#�Lkua\�� \�V�i1�4yh� _([܁�,C�\�+ĵ_�(\�݌1\�u\'�Ǹ5��AW\�~?h�J\�>\\C\���\n��xJ�\�\�\�c\��|\�2�Jxzr��M%kc\�頚\�\�\��v�G3\�\�o��N��\�\�\���A�\�\�-\�4��g�Y\�\�w9\�\�Xi\��Si$D�\�\�p7�ȯ&��(ɫ�\����ԫJt���	%.��ZBɌU\�^y\��G\�],K\'0\�&Q\���\"1_]F�jB2�\��c0�p�\�J��\�\�\�v\0i��9\�0��l\nٜh�ā��#�<�J��\�#v^\�&b��7XM�\�J�\�S�\�\�J\�|Ky�KP>g;��\n\�_�3^&:Iշec\�r�8л[�\�JH���\�Sm�]$av\�\0b;\�MCq\�b�\�Ҫ���y{g\�+���\�}N\�Dq?��H���\"�g\�;NI.��Mɏ�N��d�#�\�z5�¬m%s\��c�8\Z\��f\������\�\ro\�ڎeI�\�\�0?+�B+����lD\�]v�8� �q^\�\�C�\�i�_\��F�*\�?L\�\�7��\0m���\�\�d��\�v)\�Z\�t\'��}\�\n�,j���q{���|P���lLfc�$�G�=j/\rk�0\�\�1\�k�0�.�\r�ަ��a�\�w\Z}\�\�$�y\�3�n\n#�}bX�@��(­KM\�˲<<ʶ*�jXe)\'�\�\�ml��\0��y@MZ=j<dנ��h\�{8X��\�\�Ti\n\�6��\�=+E�\�\�Tt\�LP��3�L<5�$\�)9\�F9\�I�\r��*�\�`Ֆ\�T\�k9\ZD�p�\�n���1v�k\��\�_3�\�\���\�\'%U��k\�z�OðO\�h3#\�\�\�\�[�������?\�mm��db$�p\�\�\\\��_7W�b8�?��1�\�\�\�\� �k�|�Y*م8�����M�RL\���\�\�-^\�u�\"\�\"\�ٳ_4_�\�T��$Wcᕱ�\�y��X\���\�J\�y�\rTj�ފ\�=B\�\�F\�-�C�Hk�խ���� ^ydR�\�͞hk\�k\"W\�@Qܓ\�WO�跳Κ�\�c\�1C\�=Mv#\�%\�\�\�4)�\�.\�\�w\��_j\�j�\0b�����rwd��i��9EC\Z- ���f�+\�<i\�\�\��-��rA\�벻���\�m&�s�ƅ�\�+\�\�\�կe��fF\�MsU��o)\�F�\�9�\�ӻ#�i/\�\�pZS�\�k��4�sHN������\���6 �8�[MR\��8]�\���8+��}k�n}\"�>Wt}��oJ\�X@b0\\�ƺv\�:�5�:h�\�o�D͵U�����\�\�\�H�\�K�\�\'��k�6��\�u\�U{G\�\�0�[�i���٥\�\�Qï]�\�\�\�kq��\� ��cTE�,�˰�;\�\�=EC\r���\�o�\�rW��i\�\�\�IAXۊG�8#+Ve+ۦE�\�\�t��\�[f$�qYܶ�/\�\�F$�9�\���\�\�5��\�ar@=\��\"�\�\�e\\95��\�*x�\�N�`x\�=��\�ZR�SG%zjT\�\�\�dҎ�\�c5*\�� e�L\�(�\\\�h��\�\�5�&�\�jnR#,@=\��O�SEqmBK�2A\�\�\�O ����s���5˶�\�n�c�el}+\n��=��EF\�-��5�Z�\0Y�nn׀\n�\��\�b�\�+\�<;�Y\�xr\�\�\�%�$��\�5\�Z��\���\0��:\�<���=��ss�ۓdc\�z��U�WQ��Sھ�\���x2H2\ry��\�xmn�\�T2\�q\r/��{���f-\�q�\�jҞ�\�\�p\�[\��X+J?�=\�4\�\��dl�&u�\�\�0�Ԋ�3���\�`�9\�Uf��\�\�V,c��\�ƫ(;�\�\'\rץ�u8\�R�\��3I��\�\\����9\�&�s\\��w\r\�\�Z\�GE�Ԋ\�\�\�,׾.\�L\�\"_�\�}zޛ�\�i�\�8cQ\�}O��0���ܯ�\�^\�p��ҹ\�b\�\�\�4\�RGΚ\�n�꫖/�~k޼7o$6���a\�t���)��9?���l��*	\�1U\r\��	�eJW-��R��(4�\��H��\�I9�&��*��^\���3�Z\�o��3[�O�-w���Vh\��\Z��6�Gɕ.��Îs\�ף\�e��{�b�v8#\�0\Z��*�\0F6c�[�XT\\�:\�ґ\�j\�k\�T\�\09<U(\�VgL�;{\Z�q�\�$\n&W>��,\\�	\�\�\�#�펽q\\�\0�\�\�I/8\�\�\�p\0\�\�5\��E1νĵ��\�rk/�\�P�\0�\�Vx�#\0�W8�l�\�\�r�5�2\�\�FB�x\�T��`0J�z\�$̤�����j\�H��\�W3!\�?�iCnA\�\�\�N4\�%;�j\�\�ҥq��*01ϭJ0j4B��P1J\0�Q�����PP\���6Ҹ\�K�\�q�i�9\�]�;	�8\�\�|�O�gs\�ױ�\�p-\�.��+\�n2$#�*&}&[M*7\�\�X�\�/tq�\n\�\'\�\\>��\�闥ط\�۔�����\�~\�\"���\��F�.lK`\�GZ�[�9U�x�E\�\�7��3{f�# \r\�\�+�\r�\�5\�\Z�����\�7�!�>���`�a&¯\�V�<�mgR\�fh \�ަ_�\�P�\�VF�g\0\�b�<�ՠ\�j\�Q\�\�������\�f\�(\�4�1\�ʿ��EDXm\�\�J�zR\ZD�Oj�V�$�N\'��{\'�m3g��A�7G�]\�.���\�*�\rzE��A(\�\0c�\�\Z\�羖\��$B�B�pT�vר�\��HpJ\�|U��\�\�\'���?��\� �2�\�\�$eN�$\�>d�l\�Xِ�p�WMg\�[��\�\�\�l�\'=\�m\�@�I~\\pk\�\�\��\��lḢ\�=W\�\�\�;\�=\�ԲHHg\��\�\�9l��\�\�=�Oj\�lN�6.��Ɱ�9�[!r�Ps�\�5�\�\���Rm-UU\'\�\r[��KiT�⩶ �H3\�\�+}\�6Q����hn\�dg�镮\�x#�\08��|%�\�iv�y̅\�\�G��⽆/\Z\�ZȢ\�%<�8�q\\Ub\�߇\�\�\r\��v ����H�����k[\�vz����\�q\�P6̳�2q�\0׮GӅ\�Kw2Y\�,F~�\�\Z��s;��`\�z\��P�,\�\r��\0�s\�+õ\�z\�S�~;\���4�eH�K�۩D�*\�k*&�ԯK6\\\��sU�\�L���\�\�h\�Ip	\��V�\�/�\�v;HV\�\�8׮\��Mi\�\�Fz\��+l���\�W2g>�8\�=k��u\�\�M\�l�c�;�J�=E�������mNh�;\�C����;Յ�\�[�2@�WEqb�96F�ji��Ν:�7\�*�\�c��{�6�Y\�:\�\�\�)�\�\��4( �=\�b4$\�\�\�>\�K\�\"�[o˷�g�Ė��\��T\�(+6����Nr9z\�S\�\\zt�SNM�\�H�<\�g\�08\�i\"\�\�/\�\�\�6v\�8�\�~�5\�\�\�\���\�d\��\����ߊ� �\�|\�Z\��?y��� c$\�㌞:ռ0\�\'�j�,y\�p8\�i�.k�\�\0w溿Z\�\\^ĩ���砀�F\\\�\���:\�	�t\�7\n}�zZ��#\��Ksmc��\�9��7 ⡵;cU$�ȫ}\�\�m\�{\"�\�P����<)��\�H�n����)1�c�<ң�u&F}jKDc�}i\�4�\�\��\�KC�:\�Y@qR{\Z��!3\Z�\��\�+̼M�\�[\�\�mtB�\��3^�q,!O��\�u{\r3S�Qs�P�\�ѕ�$�_\�m,,�8\��\�+�����E2C\�V�}_��S�m\�*���s^+\�ũ�A�ڤ\�B�q��\�\�\�NM�&})��T�Ŷ[Ќ89S[Px�\0·Rm�Q��J�4\�\�\n\�\�4-ԩʻpx�oj\�\�\�\�\�XuK;�\�V\�pj�R�د�t\�WÈ/�M}Q\�\�Ǭ��J\�\�Q׳V��dJ�Z��c\'�UbzT�ȧNx�L\�\0\�\�Z�\��\�\�(�H�\�ە�6bGէp�X׋|C�9�#el\�<�\�#��Z�U(6zY~\nx\����\�\�<u\�c�ޛx��c\�\�Ep� v��.�c��KH�8ɯ\'Rw}Y�LiS�\� �D\�9P\������kؚ\�S��Ƽ[G�V�ɗa�aEzI#\�`B�I��\�QT\�~g�\�e�\�\�M�#N\�O>\�����>�\�ƞ\�5\�Z(�\�SM\�g\�y�d</V\�\'j{�\�\�J+Kt�0l�U�{&ѹjlM\�1\����\��zq�H�>\����2\�#��g��vqOZ�\�\0q�c�*|U�DoY��Z�f\\\�ztd��x�Zᵨ�r�BC+w\��=�huH�\'�}U:1Vc���x���\�\�--�8L�ӥN�[|\�T9\�\"9j��źU���䑈ݳ��]֌\�46����\�\�\�\�<�.X��\\�\�8KC\�!�өM:\��l{���m�#XѝX�f�}�\Z\�;W�\�j�\�r*\���ѥ\�\�e�*����Q�\"	����\�֫�#\�l6\r\�p�ݖ\�s\�\�u��\�\�%����\02�d\�^\�\�\�n\�\r,&%\��+�{[]\���\��Jӕkz��\�\�<�4=�[�d�i\�ޝҚ\�1\\\�\�H늣?\0㚺\�Np*A��\�t\r�\�|��\�\Z�\��\�\�=�\�\�E7DGZ�\���u����>\�W\"\�M4x\'�<-�x�\�$1���\�\�}k\�_x^\�\�\�갨�b2��>���\�H�\�\�\�\�\��5�\�=jĹTc\��vl\�\�iX�O\ZjrLD\0aw\��5�\�ˉ\�4Y�f\�{]�9.\\|�9\�I�\�Z4򷖇b�t�\\]8�Y}i*��oP\�\���j\��\�B\�V\��l���\�r]{\�\Z�:��V�}$d��kk@P���\�DZ���Y�tSm\�aj%Z�b��Wr4���\�\�\�\\�O$\�O��I+�A��\\\�]\�\"�|\�p+�Ӭ�\�\�c=\���\�{��uf��M1�)4\�&��\�8�ɥ��i\\\�\�ך��c���+�Ә�UQ�N�#�0����V\�h�����\�\��f�+ŲI�\�o@��@㠬*=[*���M\�N@H\��{`lR0\��$³��>�\"\�1k\�o\r\�SK�S�\"^��\�M.#-\�(N�_Xip�pD�\�T\n\��\��l�3\�J�|\�4\�}*t\\б�\n�q��\�\�����Ԉ���Vⷊ1���Qڈ�\�YU\�n��dG\�\�7\Z{�i�I�\0䃊d\\�\�WB;kKa�s\�Ǧ\�\�\�ہ\�j�\0�.<\�m#\�!��5�bNG~�\�c\�\�2\�ڂ�\�\�\��4��\�s \�\"�Gny�ny��e \��c{���h�Tep��!�#�h��\\�\Z\�\�\�����WB��T�x�\�Z�%͢Uࠞ\�\�8\�H9��\"t\'��y���#\�-�\��\�\��\�\�E\�s_G��X\Z&�uw�2�	\�ǥ|uq)�y$nK�$��\�y9�K��z�\��KyU\�Iiv�J��rG|\nԻw�m\�,Av\�\�I�R�sH�i��\rgw\�\�\�GǱ\�\�\�\�is��u�ͤ\�Q�ȹa�۾鯪�|E�\��\\á\�u\�Wؾ��\�\�,/Y�R\�^�\�e�t�?�>�0iN�)/��掄7�;u0`c4\�\n������Uy\�˸�Feڥ����mR[m\"VS�2\�Bv�\�.H9vW.�J��ݴ�\n�\�\�^\�>~R\�\'����\�\�B�`S�����7)6�l�j4\�!��C\�\�1������E�\�\�U�=w�[2\�\�\�r:��e}\��?C�\�.\�E\�W�]\��:\�4�\�\n�.cV�\��=\�\�^�>b֙\�5S���\rą\��G^I�2\�h�\�\�\�\�ɞ�\�]�ŋ�d׭�`���\�\�\�\�\�D�˵�HO\��2�9<\n����~��PP\�\�inoy�\�\�	v\rA\�\�BG�1^�Ǌ�τ�r�\�WE�\�\�\�׮M,P�\�(�5߆_����K3�g}W\�+�)�qUM��2&���Q�N|�{\��<^d[v\�U\�d\�VԬ�\�\�j(/���\�7S��x��\�\�\Zs�Lu����\�Pi��8lT-\�S\�Uߌ\�-���\�5�\�eY�A�2��8�ˊ�v�O.\'rq��B�L��\�O4\�\�\�f\�\��1�\�#\�8r\Z֟d�\�l�����\0-�\�>�X^+-�v0~uF��B�m��\��5��{���5\��\�#����\�?U5�����5n|ҭ\��\�|�*\�K�Y\�c���\�\�\�v�޽N�j֮K\�\�\'$\"\'\�&�|��ͨJ�=�_��\�\�\0ⶣOD\���fu�N��\�\��\�\�\��Ҭ%�R�̎w5u@�\0iٮ�\�&؜f�\�g)���\�UnA��4�#\���AN\�K\Zc\�3�IԚ�g#X�y�P\�eFm\�`s\�u�/���O��d��\�\�\�\�\��q\� Q\�(\�Ʃ4?m�`+\�p���\Z��g\�e��>���\�\�\�Km�α@7H� \�U�2G\�xt\�Z\��y뚕�\�7jr}�١�YK��\�B\�< �\�\���\�x���d\\��\0>:~5\�2i�wh�+\�\�\"�F4��\�q������X3\�b\�\�\�V�J\�<�\�|H�\r�\�\�\�\��Jɂ㸮b\�+�+��̐;�\�\�m@\�\�\�u\\*	\�ߐj\��O)�T����)�\��,�\'�e\�U`\Zڸ�\r\�V\�,��^�8�\�f�=���\�\r\\\�+����}.\�\�_%s�WE�\�\�\�#����+\�Nx4\�\�:\\)��\ndd✵&�1I�pz\�-\��\\\�D�I�f�\��Ew�M*\�OH�S_51.}Ku�_�������O2�\�\�A^Gn��b\�\��\�=Gv}vOE\�¹��K\�v\�\�N�����8�)��n-��\���!��\"��\���\�\�<C�C�j\�\�& �\�_~\�N7�\�\�+�b\�)=5\�,�ԛR����H�w1\�U�	���\�`�\��\�1�/.;v\�\�\�[^��~��nH�v�}YB�	\�\�[=�ce5`9縬����1�D9W\�\�?;��\�\'uF\�dU\�\�2�2��\�W\0\�ɲj�\�|ƅNM�\�-I�\�i݅E��V\�HF\�\�\\��\0}\��\�J\�݀\���S�68,@��M�لW��#\��t,�\�.�}\�5\�2�v��x�����\�\�\�#�����\�9\�z\�|�\Z\�s\�b�G���ui�g��Z\�\�z���D|�\�M{�*��\�\�6\�\�\��\�#�j�U\�S��,|��\��U�=)�\�\nF\'���\�t\�A\�9fr9\�<��\'k��$\�sM�+\�KO�:�5\�n��čP�``:\�i�?T���=Ѥ>��/���\�\\\�F\�D\�\�5	��p�D\�8\�!\�yЦ@y��\0\��x���th{0rG5\�\�~���\Z��sԌ��3]q��\�U{w%y\�J�ڋ�#b�\0\�y�9�\�j|�O�Qz���M\�\�W੍��\�\�bq�\�6\�iȾ�޸-{\�Uy\�\�\�\��\�0\�<�\�{\'��r\�S\r\��\�޹��OL�r9\�1Y�3�[���Eu\�7G\�U�����Uv\�2}럼�\�\�=ci\�G5ª\����3r!i,��+T�9\\�:�U($\���k\�tm_P�\��\�A\�\�^\�H\'#�VsV4�/\�\�S(n;{T�銲��c�ޝޘ\�)G�\"�QI�\r��TqS\�cޢe��\�;w�\�\�;�W�\�\�c��}�׶�H\�\�\Z��\�%\�r�Q$}>_R2ä��\�|/����7,�\�+\�$ԭn\�e\��m\�Z�o��Vm\�~\�s\�c^�\� A�^{�\�PW<\�\�\\��\'\�#0]�1��G��]\�*7T\�\�\�W7\�;���\�\�C\��\�&��9\0�Jܬ���#\�T�l�����B\��\�d��(�\rQ\�\"\�\�R��&�\�΃&sրȤ\nF9�8䎴\�ۀ\'�!��ZUR�7J@�?�*Ԕ:��\�j\�:���y&��L�������Zx\�\�Ҷ�\��\n�\0c\�4�^��P9N\��ȭ�<\�|��m\��uWT���Lƅ�z\��-\�m\�ȭF\\\��\�w�8\�׎\�`J�\��5\�W�y�\�W����k����c\�K`񏡫\�;�\�\�U���pA9V\�7r]\�m\�#�Յ�\�$��&�z�u�J\�l��[\�Z\�Q�R�\�\rc\��FMn\�<�\���\Z�k�$d��WT����Rv(l�,6�\�ҽ;N��YӃ��X\�q\��\�\�\\9�_�\�:7��ݍ;R�ˍ�60\�?S8\�B����3����\�\�|lw{�k�>,��	�\�J� \�\���Ԡ\��d\�GLƸK�g9\\0W#�r���\�)\�H�<����KI>�\�\���\��c�&��\ret�Һ�\�\�W%�\�&�#L��p;[S�����ޭ\�$־��I�ܡ,\�W9������\�ҡdM�WC�\�\�s�+�\�g�\�j�Jp0\�\rG�\�\�Y�\�=\�y\�ZW���W\�\�\�\�\�\�b��~I\�v\�ް�J\�Z�)n\�\�H�BA\��X6s\��+��en\��g�#�\���\�9B7�/\�µ�R9�Q̠��ٲ�\�R`n\�X�\�H\n�\�\�\�\�^���+T���B�h���\�1Ӓk\�M9\�\�B@8\�߽|\�a/�v�����?@�$\�\�k\0�\�b������~h\�,;+��\r�v8�N\�O\�3\�WZ�,{&�\�qC\��\0�h��\����\���G�>\�\�|��\�k\�\�w��r{�Y��0<�\�J������g\�V\�jBm%՜�X]\��\�V�s�+һ�0H\�0\05[�����Ge\�L�)lȆi\'�8��\�/LW\�~��m=x\��\�oQ\�^\��`g�²\�ON[Ͱw\�j\����\�R��\��%�ѐ9�3Z�\"u����:���:\�<\Z\�!���*\�Ϳӊ�Z=ͽ��\�dQ\�H]}�|�q����x\�/X�uv9�\�ny9j~\�/����L<�zpOAUf\�\�9|\�\�|�/\�\�\����H\�\�\�r:��\�K�?i��~�\�n�i{DR�+�a7� ��c(�\�1Q�\�@�}>�\�\�\"�\�n\��\�\�4�\�%\�\'�ښ���F��A�B\�j�V�C�\�\�~-\�\�\�\�ǲ\�\�\�N#\��󚼷��\'\�ޗ�Ý\��Y�v\ZtL�\Z�mKĺ\�\�\�%䣃�W UiT�����\�\�J�/\�\�Sl\�b�K+H��-\�MS\�l\��%H\r���\n�x\'��Б�͂=�;\�,z\�3\�\rJ���n�]08�\�^\�\�9��P�T�f�nٛ#os��?�҇�+h >��$\�	\�V&A��\�\�3Z\r�\n\�8^\�H$\�\�qZ �VOI3�f�y�T�R�.\n�)k��\�X\�)<�8�\0�Ԯ���bC�z\�e\��fk��d��hr��\�\\\�! \Z�1R痒?C\�p_Wê�{�5�\�\�#2F��I�Z<\�\�\�e\�\�l���\�\�n�&HS\'�0�����9\��$�ի#�Ѵb\�vݖ \��տy��BC�cֺM*\"��\nT�Bo �/-_C�mV\�6\�_	\�\�W!��鲣��\�s���\��ߊ\�6TW�ay����w��\�1�uZ�-�ly���#\�\r�S\�\��N�9\�S\�\n¸��4N�����@�դ\�1RR0Eg^�#V�J̾;P�8Vs\�\Z\�t|\��\�w��e\\�C�خ\�[���xc\�\�\\\�J�\Z\�\�\�\Z�Y�l�c�&�\��\�ry҄1� \�j�n��\�\�\�\�\\c(Ե�U�i\�uy��#�c\�z�\���\�R9�E�\�\�\��x\�\�nU%�pc^���Wv�7k]�6{�\�ƣ�\�t\�Xh\�L|c�M�eU<\�9\�z(�6\�h\�	��4	�\�`\�$���j}ie�\'�ˊ���X��P��\��+օN\�\�W$ %��>?���٤n\�\�aT�\�C\0U\r6Ky\�y`����+;\ZF$F{W3�i����q\�,Q�\�\�5\�75.\�˘\�A3���&��}\����[�\�]ZU��!�P\�V\�F*)��6搊�\�c��\���c犡$��\"�Y��ݻ2\�p\n\�\�\��\0}x5\�\�#\�&{�J�\�E\�Y�U��\�Q�$�^/�\\���X\�O!\�Z�\�5�o�]$)�G�\�(J┒F߇��\�5ӏ�I\�k�\�*��\�F0�0*mٮ��#ɫ>y���\�FO4\\\�	\�(\�	lv���E\�r\�{S�d\Z�\��hE �&�[?J��\r�~�1W�W9#��\�Zt\�:�\�\�%%�:פ\�WrZ\�\�,C�+\�V\�I��Yd,\�\�k\n���\�M\�Km�\�k[���qY�{\�ӱy\\�\�j0�8\�Y#\�\��N\�\�j�\�Ã_TY�5�\�ë#6�\�c�S�\�\�6K�?J�pQ�[\�ϓϪ\'Z�X�z��.qJ��V\�z�G̶N�\�X\0�bU�^��Q��$I\�S\�F*V\�#&Tuf=)�\�ya�9\�X�\�bj\�Lh�$���޻v�÷j=1C�]׎�\'�R�B\�D?z��W�\�\�G�rr�+\�\�\�j�o���uhΊKu�\�\�}���*+vI���\�VD���\�\��Dn\�\�$V��ڱ\�P�5���\�\0W\�dСr0Gd�\\�k�\\w����(�#��\0x��6H\0��c�oAT������DR´��3�9\�1Wm�����\�\�4�O\�\0\�/=۠�\"���]\�DȠ��\�t\�\�\�\�^\�q1̇%�\�U�T\�kq;���ʌW\�U~֣�\�\�ײ�<pX*Tc�c�\�\�\�7�\�%�y\03[��Ʋ\�,_\�\'OU\�\�\�Y5Ka�$JG�j���Z3\\h0\�*�\�J�\0�\�i�\Z|�\�\�Kb1��\�Snʫ�gϚx\�kps_H�/\\�\�|kutN\�yW�\�\��BgBa\�}\�\�_��!�\�YJ\�\�+t?6k�*W��<�2�����Tt\�ǚcE�n�r*\��%k�}����Y��F�(\�hmw	\�\�a]��*[\�\�Da\���\�1?&�Y\�vsz�\�֩%\��M��b\�#�\�z��\�\�β��eV%\�ێnM\�Cd�J�\�\�:e.\���\�\�\�\�N\�\�o)��ng�H�$�J���q�\�ӡ\�a�JG \�ϻ\��\�aŎ\�\\\�\�mv\�@9���x\�k2\�3\�\�p*z�z��4�hz{�\�kt\�\�Zr`.Mdxl�\�t�s���U�R\�Z\�\�Ϝyp�~B�e+RO\�:\�\�q[�\��?\���P�.�p	*g*��N+�v$u\�Z\�\�͞�+�}K\Z�\�\�+\�H��Ó\�g\�)�4!Mm��#\�>�4[���\��Vό\�mgl��\��A�8<s���\�=�s�Z\�L\�m{���\�#\�^\�\Zʜ=˳\�\�1\�[�\� ��\�Ix\�\�e;��y�Sڙ\'w�Y�2�z��\n\�+\�g�b\�\�\�䉓ں\\�\��9�f���4��F�9v\�t��yx��(V�\�\�S旟aSi\�t62\��\�-1̄��m3X���A��P�*|dR[\Z���Nj�\�#ަ$T���j�\�5Uq���\�\�&�@��$\��/��\�K_Ox�q��H8Ż\�\�(	~;�ּ�Wƽ�\�\�l5W\�h�O\�\��e���-q~7��v��[�L\�T�3�]��\"ij?t������ŚJ\��\\3;~<\nM^+\�y�\��<eY.�ѣ��� �8\�\0\0\0\�Y4�҆\'85\�x�c�\�\�\�\�h\�Q��1U�bH\�S/SPM֓\�N\0���52�PƘ\�d�@8��\�ݿ����C5��6��H��Z�k\�\�6\�䪟�z\��?k$�f��8?4n���\�=�`	ie%q\�\��\�N[]َ6\�2��ĕϴ\�WXz4��m/�>jq�q[�Vmv�zε��ǹ⺟G�\�V=�f\'�-Q\�^V\�\�\���\�c\n�s�$\�m�\�TG%$��E \�\�K\�JIr�\�\�lπ\�\'̝�g�i\�\�\�\��e��\�ó\n\�q]׉�\�\�ˈ�FFң\��\�̺��6�hQ�\�B{�pU�\�\�_�Ucw�\�k\�����n��\�\�W\�l\�zV]\�\�9�{��\�1ڷ\�\�\�5�v�)�	����l�������|We\�+˼za\�.\�\�\�xY\�\Z��\�\�\�w�<,T9kHI�EU&�\�r=j��s旚0)7`�R1MU�E�6b\�\n	?AVMq>2\�M��(R\����z��Μ=)V�\nk\�4�׵\�uK��\��T��\�͹ۜ\�\�F�\�ʱF�Gc\�u5\��l��w�\�\�\\��\�*.L�J��*\n\�++F=Y\�6�D*N9A\�!�i�A�/ޭuP����[�\�\�c\�]V�{�:\\\�t��żp��	Yv�^�\�?\�٤\�ܯ�,�\�pwb\�\�9�D�\�V�\�L��)Bgv77���\�T\�\��2����\�\'5\\\�4y�=\�+v�s[�f\r�4��	\��\�j��\�\�@恊b;)��Ek�,\Z\'\�RilP�\09���\�$S\�����\�@\'ޤ��ןx\�\�b�\�;U�9\��*�啭�m\�H\�\�0Ȭ湑Յ��T�ڽ�3\�\�\���\�<P)|c9�Lؽ]�]tPZD\"�P8�p>+�g\�쭗��9�\�5�VG}:�\�\�\�s�𽐳\�\��\�޺��g�\�E_\�\\Q�Znr�\�\�\�\�5\�\�.𖵪M<\�R\��(\n�\� ��׭u�c5�9y�|\�\��lw\�pK��Q��\�otm^	͠ݡ\�>E$~b��(�\�-\Zej���;X�$|\��\� \�j��\�2������E}�\�\�ڿ�E�xA��@��+a\�}/\�\�1�T2\��\�6\Za�\�V�\�6p1Y��/�BF*9��r\�;u�\�G�\�t�da\�9���\�8�b�n)\�@��\�\�`I��H\rY>�%\�Y��\��\�y\'\0��\�{\�4���0cM�ң�޹ޱn8ob�\�r=_D�Z��fwA�\�Em\�\�Kh\��NMt+R\�ִ�G�;6eŤ\�\�\�A��\�dk�\�gd\�\r\�5\�;akȾ#k>M�ی�95Iݙ��\�hڬ#\�B0\�\�R��^�o��`�\n�#÷<Ek#a�61�\�_YX:�d\�\�R��`�&�۞�ت\�_Ê��kt;\�4�\0�4A6��\�Fx\�!�w9Zfp���\�4����FtnSЃ���f�l\�\�8\'#>��WІ1�\��\�\�K=�����=,wN�]%�\�x7O����\�ku�\�\�B�h�$�s\�\�\\��IG�9\�j�!�h���]��^\�$�\�:0\�c\�p�V\�\�\\�01�\�ۊ�	�:��!�\r�\��\�t\�PsU#<,\�\��G�X>I\����\�\�\\^��-\�G \���k�V\��)��~\�,)\�r)܂*c�Z�s\�HI���\�B\����<t\�I�\�@\�ZQ֘_i��\0\�Rf��\�P\�a���\n�\0\�@��\�k`p=J0櫹\�\�9	�@\�j	G����*\�\�\�Z&\�!\�zks��\�|\�r\�%\�s��N���<m9�\�o\��\�+添�\�\�$\�J����+�\�⋱��-\�\�m?�h)�@88\�:c�\�,<o����h\�\�\0��MCW\��\�n\Z6�\�N\'UC��]�e�`:²��\��k��X�B�\��1\�ڰ\�\�\�\�	B\��\��iĊ\�6\���rO�\�S��)�v�\�V�zm��H�\08�=D\�\�*��u5G\�~�:Z\�\�9�}\�\�fcq&v�H��\�ׂ+����q\��\0�\\�s�~y8\�`\�\�a]\�g7���\�88\�\�q�l\�=�\�ji�l��\0\�Z\�N��.{\��qZ\�F8ש�\�\n{�uױ�Bw�a���\�*�##�y\�\�҉\�6F�\�\�j\��X\��\��0>\�\�,z\�{�C�	�J�&�M3œ\�G\�Ie?\�\Z�f�T3\�ʶ�#�\�3�<���\��\�@T\��Va����\�\�p|G�(�0ڿ0\�r=\�R\�-n���z�O�4$3x\���:\n���H\�r�@\�s�Wm\�Gc��TU�\�\�8\�{/\�\�\�-�`��68s��\�d\�\0z�&�\�\�\�M^xNJ=�\�\�\�Y\�fTV�\�5���\�	a3gbs\�8\�X\�q�(�P�\�\�\�xOUp\�\�g&\�\�F+ѧ�9+j|�z\�\ZK�����\�I��MB5�\n\�p�\�J3\��.���\�۰�A���8\�O�j\��\�\�\�\�\�K/�\�vz$�1\�b?�\�F7<\�\\�=�PD�\�\0#��s\\l�a���v\�\�#5��u_\�*\n�&\��\0�5�\�\�΁9\�-r\��,\�>�,�6�\�*�\�r[�\�\\򛓻w;�R�5h��r����T�\�<T�.3ޣ�v���&uDn:^ԙ `�\�Js�3\�ڢ?t��ƚ��m/\'�G#�6K�\�I�d\���1�⩫�Ӝ���\�|\�4�\rۭ4���\�\0\�F@\�\�\�\"\�\�n8�&�ۏ˸�\�\\+q�Q�pi���S�==\�\�G,\0�\��O=)�͂A\�G_zb<t�Ē���FOz\�\\�怱�/\�3N\�\�8\�с��S���<f�%�r8�\�^\��\�7jp\�\�\�^7\n�6�5\�\r\�-������ֶjK\�j��\�{Vu��������\�����\�As\�\�5�\�\�گL2�<\�\�6��TKb\�|h�-b7sH�:\�T��B�+]\";\�\'�\�Z\��g\n�ּz�\�g\�t�\�i?\�#\n\�\�ϸ�A5\�Mr,���2YF;U]����>���\���ʬ{\�\�#��z�\nIC�۟ĸ\�TĪJZE~,�M+VS	\�\0-iF)v\'Z\�홒ܟ(\�c�M�^D�F\0\�+Y+��]Ѣa\�\��\�\�(�\�4\0\r�*\�j���	�\��f�i��jnqP��\�\'4 \�5`H�\�\�M�\�E�Pd\���[\�eW\�~\�(\�%\�D\�wVm�#<\�7���2m�3\�}(��7�2\�\�q��zΪj&\�y�\�K\�	�M}˶T�	\�P׵K+�smnw�:v\0V\'�\Z�m\�Ұ�\�\�&�\�N\�b�zה���]*4$\�ى��ܘ.)#�Ͻ}\��Uu<e�t\�k\�VV�b��\rzg�u9-\����?�m��$\��df\�E�\�sE\'(\�h\�\0Kn=�(!G�g\�À}}�U��ո5\�%fY�	78\�F�\�$�Z~\�S�*[\"ĥɪ\�?\Z����;��Ʀ\�\�k7���y\�YR\�K<\�ǈ�\�M\�\�\�`�R�\'����,n\n\�\�Rl�����F�Dj�1�*\�\�s�DaI>an8\�\�]	<t�&�:b��s֥\'5lP\Z�l\�!�\0\�R�4\�\r/l\�)��J�6k\�\�b�	�z\n��\�\�g��\�@ڄ\�9��\�\�=�Kw)\�W�VN{UxG\�I,�F}��\�\�]Ϛ\�ˍIf8�-I\Z|�fw_��{\n��X���\�p�\�]S��\�N\Z\\���qDG�Q\Zs5DM[G\�\Z��U彶�e�P>��q�Z\�\�ns\�(QlNhОM�\rVI�\�CGP+�\�5��,�;�\����9\\nfv����\�3S�;(\�\�WP�Y\�t\�_ZwBK�sTfBF\�\�ʆ��#\�\�&��\��\�\�5\�R���z��N\�Cm>2~F�&��\�7+jI9\�EeQ\\�,�J4\�6쮎]��>�Sn�-N�\�\�\�p=��d}k�}I4�=�ᵲ��ĝ\�햪Ex\�öS�\�g�b�e\�׳�_���9̛\�\�/�\�8��e��W��\�N��\"\�U�N*\�+dd\�\n)�s�ڤ��\�&����\�\Zl}*q�\�SH�<�t9\����oxp\�-ymm$b]Tga�\0\n�hʕTW\�222�R0T����F5ag�f\�+N����G\�0J\";�;�<�zWW�\�a�L1\n@�����]\�\��\�[�\��E\�6\�ݢ�F���\�^z�MN\�\�=�\�H:vWR7t�\�\�S�X�ҷ\�5\�X�\�1�rO�g\�	5��F�\�+ӊ��dx�4�\�\�L9�\�\�\�cҐd\r�d�a]��r\rx��g7z�[�LpD�>�\\��Z��\��2\n\�1�\�м\�\��]G\�HI�w\�=�J\�\�\�=\�E\�\�j;\�6\�5+ht˹��>l-.ee&�k��\�S\�\�U񍼜�R=������P��\�e\�єq\�¼\������\���\"S\�\�&���b<W�����m|L�^$\�7�F1v�P�߹�ޥ�ˤ\�Wr\�[L\��\0\�\'��W\��	�K�\�\�\"��\�\�&�{⮝�O}�[���x5\��\0X���\�����\�F>\�5\�\�g\�~��aj��(�\�c�����n�lpƭ�gi&�p0}��\�;�r+\�M\��\�\'�1\�c�\�)M�Mx6�i>�g%�s��\�,\�9#�u�� \�\�@5��\�\�k#A+2R��\�|[P=��Q��wв\���A�*R�Xm�l)�I1��8�\���\�(s�\�)?E\�w�轢H�s	\�n\�\�vҢY^��d֞�\�\�W\�{;V|\�~�̫�K��$�\'c\�{Rt�ݺkǕ6\�s��x#Ö\�Wp\\;+?\�Ѵ��p��}\�\rT�G��3�4#g\�W�b@���\�i��vT\\�w��\0�l֊{:\��g�h,���X��C�T\\��-��n\�κ]<[\�3\�f;�.�u�kc�\�;(\�y6G\��\�-v>��h1\�>�\�k\�3^w�\��\0●#\�W�\�ZÏ���t�\0\�K�\0_�\0j�U�\�T\�⭞I�\�\�D\0ȧ3c\"�o��qy\�*\\d\�-���\n\��zsS\�\�W��pZ�\�\�&4\�c\�U�&���@Ⲟưz�w\��L>�\�ʯ\�k\�\�бrI�s��&\�4\�\���=\"\�\�jv�s\":�\�\�U�}�5O-s\�\'�Ci\�y6P \� �*�ۆ֤�+��\�sZ������,�ޠV\�\'\�J�\�\�rQCi;擾+T�i1sL�4sL�W�P\�9�����Υ�#\�<\0��<\Z͠L�\Z\�֛f�xz�\�\�DV�ehW�\�γ�\�Μ3�h�I\�=-o�7��I[`���\�;NG^�\��\n�ZhP�.b\\\�w���}\�\�\�b]LL�\�:#\�MZ\�욕\�8����s]O�#k\�ݒ��Ʊ��P\0�f\�\�+��q	{�\�@\�j\"�\�\�{����)w��\�` \�3\�Nتp��~�cv@\�w-��l��\0$�\n��rjr/�\'ҽfd܇ּk_��\�ui ^$�\�O=k\Z\��^��I%Q���:��\�}�=�I��/<Zݵ�I�<M�V��m��D\n�\�7P�;�B�\�\�+�pi��:\�I3\��STn\�F:���\��Mv���\�{VvgG:\'��6�\�\���1�g�qG>\��-Ē<�8ncue#�S[Z���{�#K?�tB�\�j\�.Tpס*�M�suhH���\�D�s\�|\�4\�\�>\�\�$���\�x\�^�\0au��H%\�CƧ?�l�\�J�WB�w���Җ\�F��3�n2i4$��Mx7��v\�u�gɋ\�\\�w�\�\�:�֐E\�\�a\�;W�lh�=�ֱ��O�\�c\�建�\�|<ғl�n2ł�=�{(P\��f\�Yi�G�)\�\�޺\�@�8\�(��C����t��\�wcT\�\�>�i\�\�⩌\�ֵ�\�\�ҙ�7Ru4\�lk7sOcQ�h!�sHG�6GU4\�\�\�LD�A�cH\�\�U�\�?\�T\\��-�j&\��z�,�HN�\�恢\�\�\�\"Ҟ\rAI�a��W�>\�\��zD\0>\�\�\�\�T�ڸ\r\0}�R��\�\�\n��\�B\\���D�8ASz\�\0JwST�\�){�\�sJO\���Flk��)\�I\���T\">@=\�G�\rOHTP\"�źW.u[X�\�\0\�\�S\�d\��G�u�\�\�|\�\�ˆ\�d��\�E`/m\�M\�Ӗ�\��\�O2�18\�My/��\�T����\"��(ϟU�X��\0ph��Yo�\�*\\(��\�(�np?\Z\�5�m�\�?,\�u�r�4�9I\�ts\�q\�J<�\�N@�(m��G���\�&\�d�W�zU�\�a\�f�\�\�4SA�;|�<W�|L�Ylᔌ�5\��a�5\����	\'v��kH-L��>{\�n\Z����l\�׎���\�K4e=W<W\�bGI�\�<8\������3)�\�NwF�>�U\�\�\�\�:��\�ZO�b�Ǳ:g�V�\0�z\�1։\�\'�z01G�\�,oN�t\�:u�T[�@\�) �#dw�g�\�h\r�ι_�\�i�sȮ��\�\rg\�^\�}\�\�jdoF\\��\�\�=�m�G�\�ס�\�zW3\��<�\�-�]/$R�/.j�����\�\�\�(jQ����\�\�]Xn*����5M\\\�Sp�F5��,�T�tP0e��FNl\�F)�\�ۻ.E=N;�sQ^)Q�8ȩhi�~�Ӡ��\�\�\�\'�ZL��$\�\�ޟ\�\�L,����\���)㚏4�sȠ��Wnz�3\�K��)�x\�>�	���g��i\�p1\�Wf\�p=jЏ:�l�8\�95󮠞a\r\�󓞼���<|vX)�\����%u�VRN�\�W]-�d\�1\�a%[�F=5l˼n�cJ�h\�vXa�O��PY�|�\���\nԕ+$[}��Xb�L�3�\�#�Iܧ��Y�u�\�=jlS�e��s�\�V\�*\�y|�+�\rl\�<\��*�1\���(�7,�\�\�Ӏ[�Mz�\n\�y\�t\�9\�^b&o86w�}��ת\�R\�ֈ\�\0m\��j$�K4��_T�a2e�I\��<\�	#�\�@�<t�1]�\0�%��\�Ҹo�%�\�i��w�\�T%}�j��\�\�\����9.\�䃐5U�0O\�\Z\�kP��x\�q�\�R�u]�c=y\�Gopj�UF�\�!�1L�\�3/ \��\0#T�,GR\�⭻�S�\�g�,~\�\�\�\�\�AI�3\�\�R0~�`��S��\'4(�	a�\�h)�p\�\0\�u�v�\�\�͜\0�\�m�`\�Fpz�NG\�kxd�> �%A�\�?CQ%�.;��\Zz�&q߭r_n�\����\�	p��bk�Ӏ\�Oz�/�7b	��\�)\�]\�Dy����\�\�p\�I�\�i��J�8\�*�q�͜�q\��U�B�Ƌ�seIP���<U`���:�\',C\n�\"�aץMę�$|�\�3��\�.�\�V��\�7`0z�Uw\�`\��\0�4�3)F\�\�5�\�\�\�\�B>���\��*��\�a��j\"=�N\���������\�\r\�O\�\�\�w\�5),�\��q\�i�y\�;�Dwt��\���;q�~\0\�#�Ҕ\�\������h\�\�\np\r�m\�) g�y�fN�\�\�?ZM�J��\�b���1\�\"��f�\�\���)s��\0RǭH�䜒I\�ɦ?\�v�z\�	��r \n��\�q��v\�BcR1��\�L0:��ǯҚ$дm\�\0�W\�mC^$�\0�\�\�_?\��\�P�\�󯨾۪D\�A\'�+x n\�g�\��c�\"\�\rQA��T��[��>���2p8�ˁ�V�\�޳�7��ƴ����.�C��\��\�\�	\'�\�kе�Fbq�\�N�i���ĠeC\�ב%\�V\�\��6j�\r��w9\rgB\�t�X]4n78�Sh\�4�pD˹c\�{�\�\�:��\�\�\�+\���\�W�.t��\0�|l�\0\'�z����c\'*ؙ\�\�\�\�\�G\�c���\n�;�k[MҶ_)t\0�Z�{E��DP\0\0t�\0�v�\�̔Rc�֓�\�B\Zc6��Z���\0х�\�\�kn\�`\�\�3ź�ҪI\Zg8-�t�!�\0�I�2v�\\\�\�\�k�\�j70\�;d\�\�j\�kI˚\���mR&�t�r:�\��k�\�)1m�#\�&��7Vկ\�\�q\�n¦�\�\�\�\���;\�\�\�:b���\r\�\r���\���\�\�#�og`N9\�AZVZ\����)�t\�\��\�V>\Z�K\�Qd\��dנ\�x;L���\�ZY�)�\�\�}\0�j؈J\�~Z��Z<__\��X\�$%G\"�4��ۣ�%\�[�5\�j�\�\'(6�\�{U�WɂX��\�>�\�\�w�\�б1t�P[Y\"ψ\�Gt��7/A\�S�~v2�\�%\�\�w�\�\�Idbw��d�\�Z�;p\�C\�M.aqg\���EhW\�{��HX�\�W\\Oj��\�a��y\�\�A�\�W��ǓO.H5Q\�\�\�\�\�5���\�Vl�R\�;nl��e\�\��}ٲ�`f�\\\�\�@\�C�\Z���\�\�d�q\�=kX\�7�b�\�rw5�,��M\'\�z3Y3BL\�7��Aj��:TܣZ��m\��)5\�9,X��s]\�\�\����b���+\�\�N�c\��B\�\�\�\��\�ؐ��aWt�|���\�	�hj\���Us\�4�|�H\�\�\�\�8\"p*)zW���\�Mݳ�\�.�*@B�\�5�\�xΫ4�t��AѶ;�M-neh\�\�\�`�4\�\�+\�ˑ\"���z�Q4��\0����,��3I�\�sV\�ѭ#!�.}�f����xZMtB\�\�z�\n\�\�R\�\r�K���\�DDL*�aPϜqY�\\�\�Đ&\0���T\�\0�\�*\�y��%\�5��ZB3T�ɹ�9\\�\�6\�\�\�t����&��s֫��\�A�\�4�\��\�~2�6�\�\0ub�U\�^��\����Jט�{c�綬�,\rOi����{�Æe�}��h�<\n�6�\'�^\�hp>�\�a���\�?\�\�\Z냊x#5\n�xe\'\�xl����ߊ��\�Y\�[E�H��V�MO2�\�ə2ȓ*Pă�U�S\�]�\'�V\rT�\�ڴ&@p9�sN#t��\��\"�\�e\�\��\�`��\�\�ς	�\�Hm��[1mz�%Yx���\�4�h�$��̵⚭\�jZ\�\��~\��^{t϶		\�MxCZ\"H��ɯ?�}�ӏ=y��Q���\�&\�[˳\��UZ�\�T\�t\r*g��\�7�N8�w�^\"�y�\�m:\�4\��\�7V>\�i�z\�\�]<\�xr۴\�#^\�\�\��Z\�\�\�\r��io\�c���`W�J<�⼏\�q�\�#Z��M�x/\���t�6$�{f�#�[��4���<�&�w\�ۿ�\�\"NԳLze��j��H<+��\�Z�NՆ�\�=�\�r��=\����Ԅm5L\�\�9�ȯY=�c\�\�כ��B\�m\��MN4�c\�̣\�e���B2v5F\�G�JiJ-wMӚ�\�Ϟ�\�\�g�\�I\�\�Q\�o3\\��v\'\'�+2\r6��\�G1��ѣ�j\�\�=���tn\��\�\�̬��k\�Tk$}\�\�S\r&�K���9����\�/K�H��8]U��C85\�:���\�\Z<��ڭ떯j�\nD����f��=������I0TUM��\�\�\�ԟ\�\�b\���R$b��\�O�wr]E�z\ZX����\rri\��^#Ǵ|\'���3�\�B\�\�`���|�cA[�7<7*���\�	�D&�ƅ����ws\�x\�?N�jS�\��\0\r�_\n\�\�q1�w\�\�\�x\n?/\�zw�a\��j\��\�zt��C�L\�\\ن%�\0\�\�Hx�nr1S�⫵S<\�\�P\'��J\�\�)���\���EBݪN���A1#4\�ܑM��EEc\"�	�$#M\�\0\�\�ɪ�t&��ư\��O�2��L�\�}s�:Է~[t�[�Y��q�Y� x�ǻWS\�/�h\�f]�q!s�A��&\�\�\���\�\�r8.�V�\0����\�\�(�?Z\�H�y0&�\�4{Sz��\�h�4����:TLz\��L#��+�\ZN�\�qM\�\r@�\rfk6gQ\�\�mTeB�\Z\�\�4�\�D�\�a7�\�t�_�\��\0�\�U\�\�U\�Ҕ\0(a\�PՑ�;��ϟ~ \��Z\�<bE�~.SS\�\���#\�/:\��1+��e	7��@i��\�\�\�MZ_��\�1G�E\�EK�Tc�<\Z\�[+&.\�9���tv/�\Z\�=)�0i�\�8msD�R�7�\n�g+Y�%\�l�Ei\"�,\�\�ee㡮�D\\Vu\�\"kyc\�B+)Ak�搭4㮈�WG�ÐEW\�\�&������%]��5BT �\\-j{0�h�rj�\��NN\�ճ\�ښY�IG#\�T��\�N�N𾩪E\\�ۅ-�z��:\�l���BJāT���\�\"E�\�);\�[���\�����Y\�[\'�&�4�\�ޛӸ�\�E6s\�\�y��Hi�c<}\�Y^ӎ��a��|\�݅\\�3k\�E�\�_v��\��R\�v1\�yc�c\�\�X�\�\��o�l��b��ť�:;u\0�+K<{U(Gl\��](��;���x��\��W\�j�4\�ء��9�#�)���Ǟ�y�g\�Uر\�&\�R\�\�!�T\�\�\�X�K>��\0:���!���r�c޹\�U\�\��H\\\��?Gm�J\�+\�ҍ��+C,�\�f9\�W} �Oc]�n��Xߣr�م����ӆ���Ccc�;U�\�\�LQ�*U��\�2)s��d��\�\�c)j2y6S��\Z\��ퟑf����+[R]����I=�*D�\0u�kSu;A�\�3Jh\�\�G\�Uc��$d\�m�O$Qv�B\�N>\�!\"�͓����<`�V\"�2/�j���\�$d\�/\�c\�r�\�4\�ؤ�0����;�Z\�r\r(\�s��H�3\�4\�\�u��F3�\�}B\�A�����i\��-\�\�:85:� \�$�\�\�S�	$\�\'�\��c\�ֹ}C*�\�AS�ںV��^lV=\��\�|\�\�܉#Ӵ�\�a�EkɌ��\�\�C�_gq�!\�\�]ԍ\��\�t�\Z�9j4F(\�3<�(�3V`2L`\�y�\�=6\��Gi!\�\�\�q\�^��;zT7\�,l�r�0A\�\rZ��W>�6\�8l\���\�\��\0\�4;S��]���,�/,\'�\�\�#,,�z�º�\0���\0ĺX_��f\�i-`s-&{h9�8\�֬T\Z���9\�:A�s3�lL�R\� �5&{w�Դ8\�ev��{\��\�\�\�\�4�ʃ����8���V.�̚|Ó�\�l��Y��M5���\�\��v�f.��,\�wQ\�=k`1\��U{(\�!X\��*\�8\�+IsI���*)� Ը&\�Wi��w��0*�\�_֯l$}(&x\�8�mÑH���H{�\0<\�R!���`�q��T �䚗=jGq\�����94\�#r\\�\�A8R��4�\�\�@]�\�<\��y�\�5U\�8��G#���\�@��\�iR1�wu��hL��\0�DEF\�\�\�_8\�\�ݹ\�S^��\"\�*�a���_\��+��\�3ܪ��\'過�\�&<\�g�}�N�V&ʃ\�OF\�0rG�:�֤��<~f�ǝ�rI�Vt`rI \�)�$��\�\�\�∐7�@\�s\��\�[�l\��GA��\�h%N\�\�}¯/\��\�{		�q\�9�פ\�\�L�E�1���=1\\�j�6C�9��3Ì�O�J|�Ԫr4\��	�?e\�\rq�\�;�o<�C]&�,�\Z>z�=s��\�H@\�\r���.�NmD ��\�\�j#\�\�y\�4�͸��\"�\�p \�-���9[)��\0�f���i\\�ᾦ�\"�\����\�$\'�R댑�\��$�z�H�\�\�Dd�\�#\�c��7\�6\����|�+�}1Ru\��\�\�64\�.G#\'\�\�\0խ)\�:��\���\�\�S��T�F T\�\��\�	pA \�QPƙ�+b�T�:\�7\�\�\�,4�pܙ]\����\�\�e1\�|\��\��N��@��[v!G�w=�:�\�ϟ�g�\�\'<tp\�n8�hT\�\�\��\�\��ē\�\��Ȭ\�pH��c\'\�8�ZP�(n3��\�Ui�s�\�NqH�\�H\���g˕$����\�5x�9\�u���p=z��F^A\�\0`�U#�\�EhJ�(\�\�y��\�X�rJ�t��\�\�\n0;���;`P[#�)�\�v3NR\�\0{��l�\�\0\0\\�S�b\rNB1\�qL\�_\�\�\Z�\�9<{RN0G�<�0x\�S6�\'�\�#D&	\�W�~\"�*pNp}*]�piT\�jK+��^�x�\�V\�8�3�\�s��tAc�\�L{�1\�sP\�\�\�ҭr\�;�y\�֡)��1ɫ%�ġ�\\zհ>eQ��2i�B\�\�a��\0\�qUO\0㚤$ii�(2+\�߇(�cc�\���4�C̊�\�\�5�ǁ�\�\�LBG-\�<WE2*h�N�ax�J�\�v\�\�T�\0A�Yʅ��J�|8\�=\�\�\r��w��p#\"��\�Ծ$x�1}Bn�z���`\��L:���\�f!.�ѯV`q^\�Y���j�\\4!z���\�\�X�e�Ӧ��K䍅@L҈Н\�.)\�\0W���\�Ղ�1O\�փ�1JM;�0�z\�R�z\�2E!�\�BX�E<�Q\�$Ҹ̽B5x�O�yT��\�d�\��׭\\9�\n\�\�w>�Ê�(�c�F�m\\�H\"\�\�QSJ���22I4���\�=�ӊ\�R��).b27��\��=�V�k�\�/�\�E\�0;5e�\�\�\�9< \�v\�W3PgEBu\��\�<CURn�X\�\�љU�wpt�ag|7\Z۟AO\�\�ybsW��\�P�3�J������9Ur�|k\Z�-����\�\�\�j\�֙Q	\�ۍ�Ut\�\�J1\�ڕx�UgNQ]W���\�t+͓\��\0Q^�$=\�5⶷e�@��\�z��\�X���5�9\�6wG�q�t\�y�=\�84^Y6��Ϟz;\�85X�9�Qզ�\�F�\�\�5\�\�k:��\�ܨ��4\�.`ꨞ�Ңu`*���̃�6�{�&&\��w�km\�\�`o9�&�m	s#��d���\�\�\�}1\��ܣ�+sX�d�I=q�p��6zS�\�C,�p�%�UH4�8�-^\�\�\�;��?J\�R�e\�6\�8?^%\�\�B��O\�\�:.\�URV�i%l�\�Wkū796}rB1\�t^�3��\�\��Mt^�S$\�N�ć_�l\�\�\�Nx�W4�\�\�4T+���\�\�|\�\�֡9�l�!�\�3�S\�0Ԍ*1RTE�@���-ƙ\�\"�<m�3�\�\0\�w����MD\�x4\�\r,	<Tr(#4��O\�:\Z`p8�k�ʌ�M��E�aھ�\� I\�&���\Z�\��\�쯧�\�\�rұ����\�\��R�>�w_3\�>����5\���OJ���ٝ;m\�{d �\�5\�\�xٿ�\��F\�db��^!ަRwŞD\�qVP㸪`\��\�,\�H�1\�XF�PV=\�ZS�\�,Ţ\�\�\� \"���yw&ƄLw�\�c�qڎ�\�lk M�`1ҩ��\\��\0��\"��\�规�V<э\�\�\�˲6 g\�^x�;D\�qg1\\���-~\�\\\�?0Ms\Zƣg�u�	�8�S{�Lji6�P\��;k�C@H�Fa���eq^Wc�Dol4�\�Y��\�]��U\�\�zda�񁚾e-��\\wD�o�\�v�\0�m^	rv¨$�5\��[9�k\�C\�usl�\�Ӛ\�\�}�\�ZI���\0-Z*�w_δ�xN�\�M>2��\�����9�`\�\�\�b�PW��;��}KQ�*7DL�MsQ�=H�3\�sJ�\0W�ר�Piz�e�\�R�Bp)	�\�\�C��ϛ~,*����kD<�+\�|7&�Ml`}�3�z��vM?����\r\�ŷ�\�u{��\�\�(�\�4\n1ӊ\�\�+b+3\�s:\�Y6_O��\�п�#&��*-\��W���`[&�bsҤ�\�lF0*�\�sw:u��=\�\�\�5a�#����\�\��%����Nr\���zl�\�\�m�?\�#u\�Ӛܔ\�-CJ���\�RJ\�9�\�r\�x�+\�/Z#ok]�}\�B[\�zWx\�iMcʓ7甒�\�G�u�7���\����dd\�\�\�\�W��Q�\'�\���ģ�9�LO�\�z\�:o0\�%�\0?bx\��xz+\�\�\�|\�jTp�\\|\�1o��ׂX4-v\�\�y\�?�ڵj?q�I\�׍\��Alߙ\���0\�s\�ֺ	+«�\0杀q\�q�\Z\�9\�^�>��fN�\��\0��_�Q�B�e�ɪ\�\�g	Y\�Z���\\\�]Ի^,~�3M�J�I#���jU$�kD!�\�UP0�fS��Y�9��\�d\�i\�#6\rT�}�σ�!X\�czZ\�\�(\�Y񄶱�ȑ�`+\�\� [kx\�N4\n?\n�?\�5\�y�\�3�c=y\'��QҸ)E\�\��g��\�O\�\�OJPI���\�K�Sk[HSiM4\����\�f�\�\�\�\�\�h\'��+��\�\"�8�bnH��CDr\r<Px��K)�\�\�ɨA��f�<\�\�_^<�UO\�\�wm\�ZM\�\�%��\0\\W\r\�h��\�@a\�\�\�W�xV\�A�\�\�3��Ϛ炼\�>���[Fq:@8\�\�\��ԏ�bL5%Fݍ2Z\\�U)�\�毷\�XZ�-�3;`BrjXQvA���y��*d\�\�S���d\�	$cL�n��n{tݢd��i��\�X�t��I\Zshz�56b,ߝ�(}�є�Q^7\�Dw\�v�\�\"c�W�F��\��\���q\n*��6j�\�\�VV�\\Hp#\\հ3ڼ\�\�Z�\�\\A��\�G_3�\�D�+I֪�Mߢ+�^\�][S�W�;�1�\��\0��U@�\���\�\�imH0\0�\�\�i�ڈ\�\�\�Wu�y-�,E\�k��ޫ�8\�5󶨞8|���\�42�f�#֣j�Y�*>)N@\�Qԍnr~\'���5ɳ���\�\�\�\�\�2\�=k���\�\�\�cj13�)�C\�Eu	q\�\�V\�6?Q�\\�\�\�G\�\�A�\��&+\�V*�\�e���\�\�v\�c>�7Z��i�\�Y\�y\�zA���r�ݲ\�[I�\�\�E�\ro\n�r\�\0g\�V�\�OƤ|\�JdT�\0\'��1Q�`\�Z�i�D`*��zy\�4\�M0!`GZ�\�X��R�қ���\0@PUv�\�\�[#���:�*me529��Q\0UwrE[�V�\�\�\���5�#��B��\"1���k\�\\ut�=\�6��\�=T�\�:\��`��\�P\0�\�#��؇@-�Ww\�\��W������BO?R �^�[G5\�Kc\�\�\�\�Ub9\�dqRm\�8s\�J*䓁[\\\�d��qL*\�4\�ua��Ӱ	\�\��sn��\�ڸ{2\�K֮��Y@a\�\�z,��5�k7-i�ن\�Y>\\���\�#�E\�s\�9\�L�\�\�Um$=sVW�G|\�l�NOjq=�����z\�2\�\'LP	\'���n=\0\�N\�)��\�Z�\��Ȥa�怹T�Q�sS��\�=(�6\�50\���WP\�LP�r�jc)A\�iw�8���\�v\�9��l�OZc\0댃D@\��\03N\����q\�;�\�\�k\'�0zԠc�HpNA\�HЀ�\�4�SM�v�~�Ԙɇ^��; \n�>F3��2\�\�Ki8\�*�\� �r\�=\��\�\�\�Wڙ��G�ck3�6�˂@\�\�j��	��\�zɑ������\�9\���\�\���\�k��nq�N�ǧ9\�#������\�\�\"�\�\�\r3\r\0�rj\��\�\n\� ��E1�H�����d�Yh8\��U2��㷥K�ۑ\�ǧ�jY�vXc���X.E��s�ִ`e�.*�V��q1a\�^\'�ҚgK��L��\�rsМ\�ܲ\�w�]�J\�ӣ%H\07\Zպؖ�@\\c\�\�\�V\�\�\�\�kU<���^}q\�\\\�\�\��W��\0U\�.X�uϽD�;>����e�X�\�\�H\�(rH=�q\�\r6H\�B�`�\0�$c\\��`�\�{P!(G\����\r�8 gڥ|��\�\�j�7=C�e\"EU ��O>�	+�\�\�=�\r^H�F\�s��j(T.T\�Ӱ\�\0ρ\�\���dZ\�\�K\�=�Psڪ�\�Շ\��N ,w#\�\�ކ!�j�p�y\�^R�u�C����ZB\��\�y\�A9�T�!�\�[9\�\�}*\Z���\�6t\�|��o7\�2��`E�W\��(��W\�_n�Ǎu6����\�w3ϭ�âA�\� �¢��\��ҭ�ژ1ڣc�\�\�Z\�\�ct$2�F\�\�\�1S:ۚ�j3�\���I\\g���چM��\�Z`N\�\0�}���I$2p()\�\�<w\�\�\�g�>fH\�Z3\�#>\�A����\�T��\rQ�\��Zf@$R!\n\�9�Fy\�\\գt0�\�09\�Qg�=_�HP�\�\� L�\�\�S-\�=\�x\��Lc\\l��\��S�����\�)2\�\Z���~)�X�#�X\���\n����:�⤢9e\�@���j�.\�$���\�\�K��\�粞���\�\r�͞�)~iq\�y��.3\�\ZH�\\\rX������\�\�S[\�ۻ$\�D\�\�\�U�D*�\�\��Ac��\\]\�;\�}��D ��1�@\��v.�nza��}_\0(��T�\�c_D��V�\�V\�s\�fX�P+S�g*eU\��K¦3JxqPj�5\�ޏď\"[o�x��\�\\f��\�B\"���^i\��P��=3ֽ6\�0Q��hBɾ\���*\��:B6-\�<ґJ�j3]�\0u\�x�8�\�\�@���O\\c����3AC1Q���\'&�\�)6R3���\�\\ˁ<�Z��S�+��\\\�\'��7\Z�=<�vE\�\�I9!icUA\�W�|-p\'�\�u%\�\0{��)\�&{o�9��\�Z3f\�1Ȭ?JV(Pw~Ei���\"�X!\�,3�\�\�\\[���lgMV�ފn\�{�?\"\��\�Y���\�.�\��x\�+\��C\�l�x�\�:tӺW���w� ��P��dW2��(d\�\�\�!	q �]\���n\�5�\�	S����\���\�\�8\��-�������n\�+\��)<\�6z��K%\�e�q^Ӡ/�K�=3\\��G=iч�ͳ�U�\�:\n��u��\�kc\�\�\���\�6\�\�/f�I\�<�9\�Aһ=u\'}\�	q^i%��&m�БD\�ƚ\�\�Y֓\�6,�(\"�uH�\\�c�Z����[\�Hc\�\�E�ڣ�2\�޻�K�H�<WlR�\��p�\'\�/�\�\�l$\��\� �א�r@��Np+\��\�\�WJNP&�\'b}\�H]qQ�QԊ�q{\'<U�\�\�\n�\�s^k\�Lɶ\�Xe�-�\�Ե\�!�\�\�g��\'�kۧ�L�\�ǰ�UK.U�;�ty\�\��E�Tb�* zb�p+\�z�\�U�\�\�Z\���w\�\�+�����\�xM\\ڻ\�e����\"k�\0Gx���A\'5^\"\�\�X�˞3\Z\�j�\\⫹\�zD\r4����a\�$�q��p+/Q�\�D_v6��[\�^r~\'���\��\��;�\'dq��\0a�Q�{WfW+�{\�ye\�n� u=�5�Ε�o��\�^㥒q\�Vu�\�ՏC	B�v�C�\�\\\�\�lT\�A\�>���dg�\�͚�V�g[�Ҋ\�\�t��o��IX\�@јU\�V~�\�k\�Uɭ\��\�~Tym\�\�ɒD\�s\�x�� � �S<������)����Co\"�I��)Mhw\�11_̚��\�=W�[I�Ҽ_\�Ҙ��`7dW�\�H\nõu\�ݢe�뉟\�ۈ\�g�g\��^�eXb�##\�h�����5PW*y�*\�mm4\\\rS�\'LJ�[ַ��\�K�\��\�j�n���5jDr�~#�e��\0���\�y+k\�������Z\�Ⓛ^^2_��#貸�\��\0��.\�p9\"�t���W1VS����v�\�ֹ�t#X|��k�Ti��T\�\�\��R\Z��h��\"[�9�^My�\0��}�\�\"�D|08�s\�K\�Ϛ\�\"�^˲\�}�dR�\�K\�\�l�I�5\�;���\�6�\�\�[ߧA \��\Z�&пc\�\�\�\\p�\�\�[U\\��\�m#�\�85\�_\�1\�\�\�ğ2m�\�`�\"����k{X���c\�\�}3�\��i�0ZB�$(}�\��5�\rϛ�=\�$\�BUAk*���a��\�bӉ\�	}O!�� O�nVf\�$�\�\\W��\�\�\�k\��#B\r��� ��0�zת��\��\�XQV�W\��2|\��Fk�&#�i	\�Nj\"\�\�k�;��8���U�c_�\�׺3�\��q]9rR�\�\�3�\�\'xy]\�%�\�E?��UD\�%\�\�\'\ZP�{�)ܠ���+�\\��cUe;	JL��l\�O\�\�\�Xi��\�p\�\����+\��/o[]9�w\�\0�+��)\�C�\0#:��<\�\\V�D\�\�	�OճPB$�#c�\\/\�\�M\�<�;\�\�[�H�\�˨\�6��ۦW�\�Q9$חkJ\�\�p�����.g�3\�4�e�\�\�mפP\"�8\� Ւ��nk�+#�*\�u*JOy6\�U�\�g\�V\\\�Fhf%9��\��}j�\�rsT�5)�O�b��\'��:\n�>NZbd�\��\�Wa�\�\�j.�\"<\n��{i\�\�h�{\�\�ฦ0R+)�Svf��C�X\�i�c�=M^뚐�Q�X4�\�\�\�\�n\�\�\�3G,.4\�S�\�\�*D8�@j>�\�\�GTn\�-;#�\�5,\n��A�*A�\�) qR\�z\�	�\�4���R#���Ǝ\�\�\�-�\n�\�F� �J�o�b�~\"�Z&tQ\\\�\"���(\\O�ܖ\�gw�|ƽ�\�mgC����7Lgqmf�2<�ӭ{\�b���=\�\�IF�=X�Zm.x��|\�aHii\r2Jr��#�gj�_\�\��+,N�=CV\�\�z}*�붥�����}=\r��\�l\�>z\�t?�N\�<פx�\��\0l_�[(\�0\��\�\�W�g�~�9Ŧz�*�ĭ(튄�5iǮj��\�늄�:\�\�l\Zk��N\��\n�9�ʟp=r�\�tH$\�yg\�\�5\�]Ǿ5#�Mu\�{��j\��\�\��\�\�\�\��\�wl�)�W�E�\�eXiX\�\\̠\�B\�O�Ѿ�¯yF\�ՅpOj���P�\�:w`�գ��d\�\rN*�r\�d\n�J\�65\\ \�6\�i11�)�\Z���Ա�#�BF:Ն\�T>Ƥks��B��Ó�\ns\\�\0ko_�V\�\�>\�\��\rd��\�pT�\�\�\�\�j0�*H��Ծ��wwjǆa\"�\�Nx�+&؛-n\�u$v7\�\�N\\�A��<\Z�=\�\�\����@�Y\�Ę\�\�\�V��\�5\�x-X����u�:\�\�)��:P$å\'j0\r����y\�N$�L9=\�&�(��\��\�\07$TN�\�\�S�j��&g>��y5���F2�\�\��JLG��n��D\0�j߈X�\�<\n�	�q\\5�&{�o\�GН�;v���\��\���y���\0VL\�lY�ﺝ\�0\�\0p3\�^m\��\�r�&J�u\�We?��qO���4c�\\\�sZ��j��\�<�Sr*\�)���R:�^w\���\��J8�U\'\�\'\��\��u�\�\rCG���$�#\�9��\�-�h�Kul��@8�ӌ�W��#Q�\�2g|?!\�RW����C-)-BЗ>ݪDl�@��\�{R\'AY�$\��\�\���&s�ȩ�\�\�H��\�\�����L�\�P�d���\�d�4\�s@\rd_z�|��$v\�j&���\r0\0\�h\�ҒT\�\\0\�XL�v\�Ǳ\�z��1ښ\"n\�i\�A��z���A��5@\�Q�\rN��d\n��\� �v*\0�R�)2\�\�&C�ԣ�{\�y�Ա�l^�\�sӊ��\�ȧw4��H��\�5	\�\�WOZk(\�\�N\�\0\�j�պ΅X��\����^�ޙ#\0�\�q>w����S�\�s��\�2\�6\�9\�\�\�\�\�Ha�\�Ext\�\�\\�\�Oda >wc��KD�\�Jp�`���2$�pON\�V@˅\�8�8\"��b�������\�d`\�d�a\�Fq�}�\�\0R�\0\\��\�J�\�\��U\���VP�8\'\�Z��K/\��sT��6��j�|�\�}�ڑ�CQnI��C�\�I\�S��Gp27q�A<c\�UЃ8�P��\�\��J�@8\0t�\���R\�\���~�~�䓻\0q�q���e^]�Ƞ�;�̒6��\�\��Bk��Mށ�[�r*���h�:�s\�4Xg0�Y#߮)\�\�\�=pjf�}\�;/@9�\�\n\�\� `q�J\n%�eH\�?���\�9#?J����:��\n�\"	\0gЊ@ZH�\�\�0H\�ǯ�YF8%.y#����\�f�h\�B\�g�JTB\�\�a\��w�(\�N0A\�\��D�\�rq����ա{B�;w���Uxw�`�g�x\�A\r��\�Ɲ1���\'Ŭ\�>$��;�K�\�A���q��g��\�?E5��|�}������޻�p\�\�7n\�\0{\��88\�I)U\�nx�T�\"\�gǥE�FC�\n{qQ�\�S�є��P�VR�TA3�`\Z�\�Ols��ꪤ�\�Rt,;�\�x���\�K.\��\0\�J�\\�ִ%G\�@��\�+=��-�Ooj�t@�ǩ5\�9>欀:��EF�dt\�z���\��\�\�N\��\�\�~�7~�ALh�p\�\�i\�Xڟ\�<�Sr>���Z#�=�\����)`*y\�]*}�\�Y\�\�,N9�\�\�RZV�\��\�\�Q�\0�܎�\0I$\��tӂOq�JZM�^q\�z�Mm�2zvqMDݓ\��\0^��0\�sT\�T���b6�\�}j�o�z\n��{�cG��JD�T e�\�}wj7\�&X�!\�oŔ\�G;pz\�}K\�i���pJ\�9㞕�9օ\�z\r���mC.�\�\�J\�@�n\�#lq\�[\�\�\�.H0zw�\�]\�\�HI\0�kI\�\�\�S�\�\�h�^Dg!s\�}M&�iI�\�3;\����3&\�\�\�+��\Z#\0-H\�(J\�\�U�\�M˹%(�4\�֙�`S{ҚgJ\0sTlrx�9����\�Ї\�Z���\�5\r��R傣�+�r�\�\�i|�av>��\�^k\�\�\�c\�\�\��e�ՙx\�����YWO�\\\'��.h\���\�Տ\���L\�\0+F�Vݛ�cT5\�6�&p��\�DW��\�S���\Zf�,,#�OςI�\�+�h\�L%ع.��^�[5�v\�\�\�oj�(>M��ǿlۗ{�	q�\��\�\�Mm\�ds���W\n+g^X�����\\\�Z��t(��	\�=kj\�J6��UM=��&�\Z\�\�\n&a��{xR\�4\�(\0W)�\�\�\�mvܪ�G5\�0*==+\�Q\��X�[�&�C�T%��s\�V>cQ�x�\�	\�j�(I\�\���\��b{�\�u���(�z\�xaSȯ3;\�ǫ��\�n\�\��W�~��뤹*�k��,Cc�Z\�ݞ�\�\�f�\�Y�\����Fe� a���&��=�0ܒq�:\�}^I��R�1޽\\?�x����\�2\�D�uy\�rk\�u\��%}�-�\�\�=ꩲ\�\�I#\�2��\���\�\r��&�z\�g���Q��\Zr�1���_�D�޶!Xֈ���s[*q�W�Z|\�>�O�(���\�\�T�\�;\Z\�GQ�|�lzWu\�e\�О\�+\�\�\�\�\�\��%6\�\�ts]4~#c�\�΂6\�⢊ �sҥ��(\�\�8�ML�*\r�\�%�����j0��_\�\����\�B/�5\��^#\�\�6�\�9~����#*��9+f,78,��\��`8�]A\n�h�d\�\�3\�[\Zx`�͉\���\�x�\�^��\�1�\�95Dnh��\�E�(\�4v\�}\�R~GS\�n\�\"c��K)*ۚ�\��\�r\�F+\�|i2��\�y\�]\�ג��\�՝0�0}3JOC\�\�a|J}�gK\�Սی�D���j\���L\�F\ZV\��våoKD�s	s\�jz��p\�ޭ����pEZ(5Ҥy\���\�\��J�\�8�\�#�\�31q5�b�\rY�1<Vճ�\�H\�Ŀ�4��C\nx��h\�����\�\�\' b��6Q�Ê\�\�\0}+\�\�\���\����\�?�\��)�+I3��\�\"��l.s\\\�g\�dlt^�Z\�\�=&�X𛩺��\�1^���Ҽ\�����9 �W�q���o�1>_1�\�K\�G&Nx�o\�q�ƃ\�3���9��M�R��\�9\�p\n\�:�\�t\�^-wG6\Z��^����ӹ\�mF��I���`�M�\�\�G&�\�&ۊ\�k-*\�;H\�qD��d��\�V\�QF�����<wױR��R�W�.��&�uI[#͹�\�-5�4���$IaoG�\�V\�\�F� I\n�\�\�})\�q�y�\�(�\�\�[�\'�\�\�ޚ��4��D�䝵h��\�<␖\�B.w��sy\�L\�p��\rvA\�\�[�s\�G�u98\�\�]o��D�uM���^}<\�\�\�\'\����ֺ�\n\�h#�R\�Is��1�W�F�6!�\���490pV\�;n��j��`��\�\�@*E6A�\�]��<W�|TQ��\�t߀ȯ`Y_� ��~ӭx~\�F]�fP?\�Ŋ��\�\�zc\�\�O�#��l\�N��@\��Kz)?í\�\�{j3G�n�\�#�\Z�κ�髫i�ɎԚx\��\0\�$~5\�C\ZD�4P��@\�a\�y\�wT̥���\�w7w希*�\0I\�q�z�!9<V�<9=J\�ETs\�Yz�楁I�\�ES\�U\���}jd<��҄|8�@\\sPԏQ�bp�\�-���Nj\"k9\ZĬ٨Ն�\�U\�k!����L�͖8��Jj=�R%�\�KҒ�\�\�h%�\�D9\�W9\�mn-E��~<���lp?:\�~x�|Kdmn\�WR�&D\�*ç��{\\JJ�=s�0W\�\�17\�R�\�PYazR\�*OJ�Pq\\w��?�Gv�\�\�G\�Ld5v\'�)ȿ74����Օ)�\�u�\�xk\�O�\��72,�\�	\�\n+�\��*)\�b�i_R��\�J\���j-�85)8�9�;�!$\�x��\�N\�\Z�Z�J���	0�\�O�E�nS\�\�\�c�\�\"\�Uӂq\�R\�-�\r�\�\�+х�{ظBG�==\���t\�>��1\�\�O�QІSЊ�+�jSp�y��\�\�6��$�B�\�����jw�+mj�\�\�\�U=cL���M��\"��s�j\�\��5��9�%#�5९�و�(Y.\�к]�[ZG\Z(UA�\0\�V���V�\�!W?����ʱ\��\�\�\�q�H�\�h�\�wT¢��^��\���>誱U�{U\r\rq\�T#��\�U ��C!n��jR4\�2lD\�\�@\�S�^�y�e#��=�mK�9S���r�8\�޽V\�<2F@9R0k\�\�~T��\�H�Jѳ�\�\�j�S\�dcm��v�!�e?��\�Y7J\n6E`�gd�=v\��A�\n\�^Oj\�t)�d\�(+�Pkя���9/6<T��� Ȫ2\08c� �h��\�0�\�:F،\�r@\�M��ȷm\�{\Z\0C\�\�G\�\�R��\�B.sH�p��Miձ��\�P�[�ar9n��j��\�R\0\�򗰤d\�\�iܒ�6g~Y\�5p�D��Ԩ~lS�vP5��k|\��p*񊹯��`Ǡ�0\�\�s\\5~#\�\�kIzJ\���z\��9p�\'�3`��=a\�ݛ�.³ݚ\�H���]�;c\'\r]�S(\�`\�kVP��\�Fk�\��\�wAZ(�k�j�\�Ɣ\��أ�h\�SWc!�!\��(����\�F\�J%�\�S�\�b ��T��_]AoK+��sT�\�x%���⹭\�`!��\�#�$\�f�\�\�\�H��\�|�\�\�.�I���)9�ײx+Ŷְ\�\�p��\�\�҅\�\�b\�g���\�~�\�g�*�~*�l�`j��<\Z�\�\�N\�Z{�\��\�U�8ێi\�\�\��3\�O�[�{\�TQ�\�Ҽg ��\�i�V\�T�y�?\�z�q�W{SH\�\�i\�:\nn\�;�E���\�Yx�l\0\"�r:\�$�\�\'ؽ^qګ\\\�Ck\�#P2k\�Y�\���\�\�KgY��Q�\�\�X\�\��9\�|ִS^y\�\Ze�+\���\�IS����lq�\��\�\�e�2\�NNzU�\� ���9\�\"����rj��9$\�\��\�E�\�\�P�Nj7��\�lTnMRD\\�\�\03Y7�\�[�.@\���3�W$�+\�|q�*\�\�m�kH\�\�\�r�3�i2\�[�\�\�\�^331.@�\�z��wقA\�=8�(��8\�*\rt�X�J\�\�U^\���hL��v\"�\�@9��\����\Z����ʎx8�\�<\�Ѽ\�*Ď�y�~�b\"�\�\�#�\�\�\�Q<(�q�>��*\0|\�(>�zV���A~Rs�J�\�\Z>z�v�#��I=\��sMץ�Ad�\�{`�V|c\�\�_���g\�D�c<wn�\�	���S�lv_Jw\�\��\'ש�#R��a߭W\�\�\�\\\���m��3\��Bt6\�D(�@\�\����\��9�!�\�\�J׉HAܨ\�\�5GSW�Ԏ�G����_S���@��z�>\�Q�e�\\\�eVF$�IǮ)���*�e��<�wzR\�\� ���GcU�p���-��\�#מjJ(�=8>��ɷh#� q\�3隦SS�T�\��YH\�=��Z6 \0�1\�B�$�ƣ�<gkg�\�а#�\�#\���:9\nG\\����1�g\�w��[_j��\�\�IN}ȯ�N\��\�\�z��\�mȲ�6�rFSn$\��nϗ\r�\�\�Һ\�\�U��]�\�íU\�9c֭�ݜ\�R\'\07T̯�\�j\"8\�853	#��\r\�\����\�;Ϋ��\�1S�\�\00\���\�\"\'\�\�9\�٪����\�t#�Z(He\�\0US�!���j��\n�v�`T;X�L�\�qS��\'`G�{qVt\"��9\��\0\Z����S8?\�y\�D:�L��$�\���b\rLq\�A\�ޣl\�v>���Y�I\�\�TeĹ$\0�i�隮Pp\�N8�\0ʩ\���sޠ��F��<\0\�\�\�4\���1\�b�\rs�\�==i$#�F1\�i�\�\��\�8.A�8�\�i�frI�*�l�P��F?*�\n��2h�\�[���q\�\�i�S\�\�\�C\�8�r6\� \�#���J)�\�8S�%.Tٵ\nnsH��x�P�H\�r\�\�W�\�p�PD\�z�ʾM�Tk�2\'\���S�׋���M\��\�\\�q�3\�\��1Y3�EN���\�\�\�7��N*ʁ�z\�ӵK\�\�\�(9\�Z�E\�^�f�����JPm4\�E؎T\nx�5^\�*\�\�ՙXRƣ2�}\�\�&�\�P�{\�x���Ƣipy�\�n�����^k:mR\�#�Ձ�x�J�S\�\\\"p	��I]�\�&�M�ue�5N\�\�(В\�\�^A�|K�+.�p\�0�޼\�P�f��-\�\��v�+ϭ��]��=\�&M��)ڜ|�=�[�\�}�\�E�b���1^)�\\���{����X*���6�IM\�G��jxt��6E`_\\\�Z\� \�_�c�ԧ��Fׇ�\�I�t�C�o��$��N�y&��X\�V]�\�&��YJ�\�\n\�f�\�W��݅�r�q\�kʯ\�oaV\�5\�7~�}�Y^�{uWe*�S\�\�R�U�<Z�q.\Z\��a�=\�|1\�\�uI�Fb�����麇�V^#lax\�5�\�}\�Ky���60V��^.-��χ�8Is-�J�:}�06F�$U�\�)\"�\�\ry���؄�*�\�\�v\�H\�\�2jį��^{\�MI�u�V�\0z��S\�ųz4�Y�dKp�wO#tcǵ[P\0�V\�`u�5nC�^D�\�=\�\�EY#>\�\"���	\�f�n�G9�4�g��6FrǷҜU\�L\�ʛ4\�\�Ӥi������\r�u,\���s]\�\�\�1�\0c\�\�xf�\�\�\�NE�\�\"�\��\�AY=G\�3\�oQ^F\�b�&�9���\��=W4\�~/\�K	U�@H\�ķ�γ;M:\��`Tּ�m����N�\���\�@\�\�Y���Ml��\�\�sގ\�`\�W��\�\�V\�{U�G=*V�#G-p�5\�Zc�Fzk\�t\��V��\�\�\�p��+���͏~\��IFNj?>|࡭��]<�9���R�����[c\�D\�qC%�\��5ɓ�s�\�\�\�\�i(�\�I�\"�\�\�HQ׽y��ż}\��j�^�\�\�l�\�(��P��kL±��\�#X1\�\�Sؒb�\�!O\Z�br+��\�T�\0v͔$\�E�\�ҹ�p+CL�X.F\���(\�$wb�\�$�\�0�ʔl��0��\�zW��\�4�\�^A\�-����p}k\�ʝ��\��TԵ\�8\�c\�>\�隙t;�UU*�O�Y\��}\r2\�_�y�\�\�t�㊡\0\0�T�[E��e\�9K�l\�ߞ�\�F�j��A5���B���ը�3�jf�W��&�T�\�\�R��\�\rLn\�U\��U�fd\�oG6�sS�\�Ի\\�H�n7Z��\�A�J>\�.8�7ʊ\��\�\�\�߁\\\\2nU$�\\8�^h��\�jo\�}\�!S�J�\�dl�>�+B���sX�L�7/\�\r�k�=OJOC\�|-�\���� e=\�v�[�a�g$W\�%՚\�xvdS�H\�t�\�\��\0\Z\Z\0�\�ָ@\0�\�q_E����mi\��||�*\�\�^�\�[�l6+�\��e�k�[\�\�r\���d���U���ԏ5\�X�B1V�qU�-9dP<U\�\'zo\�c9\�\�\n�e\���\"�3T�\r��\�@�\�f���E\\zrk-\�\�Mq:� �>�dܞ{����&���d�\�T-�.\�HIa\�\�W=\��\0i��I�eTN\��l}w��l\�\�o#���\�UQ\��\�v8�ķ���#60K�_�\��W��\�\�\�ν\�Y���;�~g\�@}+W\�_\Zt��\�yNF1ҹq�q�\�\�K+�>!6��^�\�\r\��}RD#�rp}\�\�JIA\\N�����i�N\�\�!d\�pkȡ\'\�b�3\�):O�>��,\�\�\�ǥ9\0畬\�:\�́6�(\�}�i\�q/(2\r{{�Ϙi�\�I��י\�\"\�_\�r�\�cb\�\�\�\�^�s�A��\Z\�xP\�Z���7S��݄m\�sU�5��߃�\�UYut\�W\�CZ\�\�;\�Y!rʲeN���?*$�1m�\�\�q\�\�\�\�Q31Ȩhϙ��\'5JAW��\�R�\�Ա6Tz� ��\�Wp\�f�\\pj��\�j\\\�\��\�fQ�*F\�x\n�!�\�<-\�{/\�yn�$t�3�FF+�ZZ\�\�kgt\0��\�\�\n�\�F��\�K\�:d��\��a��Z�he)\�H��ɸ\n\\�^E៊Z���Qet1����>�^�\�R\"�:�2�H \�h��\�nr�Y��h�q����\�<�5��b\�_�C�H���\�\�\�1\�\�&0)7Tlǌ��\�w�FH\�2G\n	5]�\�(&\�تwS��3\�f\�zŖ�i-\�\�\�q�,\��m�\�K�V	l���D�9\��-4�g)\�_�\�4�W�:E�ۭ\�\�3:�w����\�P�\�\�a�����&��A�d\��\�S�	�QFg\�>\n���x�Ζ��\�<-����5\�0\��񯀭���\��Ab�;\�u\�%�����,q*�cޢT^\�\���\\��n���5\�zg\�o	]/7O�\�G\�FA�\�M\��\�N=�\�W>�\�\�k>F�T\�δ\Z�qX�RP~pT�m.���cD\��\�\�9[\�\r�T\�n�M+	�c�9\�B�\�]��CJ2w\�.eO���!�\�\�Hs�{SX�J\\�\�t�a \�Z\�4}1\�I��:uD;��NDNj\'�5\�{��\�>�\�=3B�3\�\�{�\�A^��[X\�ۥZ�r0d��\�\n�\�KX\�5[�./\'y�c��\�AU\�dg\�Q��|a⋫�`�\�x\�d�\�;\��_R;�쯯#���flի\�ݥ��t��eh��B]\�Ўk߮��\�]�yQ\�\�XV~\�C�\rY�\���O��Qcp\�ݎ\Z\�~iN\�\"�\�\�	�^��_D��\�\�޽�M��\�\�b\\E\�E���O\�u�-N��i��\\��\�f��\��8��MO�P\����\�4X\n�\�Ӧ���\�J\�\"\�\���8��b�HB���j\�\�@�)�\�O=i���WlSM<�����K\Z\�;�^[0Qu(^\�k\�p@\�^Q1w:\�H\�ˈ\��_�O\�6��ƻ\�\Z�\�\�+\���x�S\�{�\�i��ֺ�\\�̆\�6S\�\nzs]�R�9\�5\��=�Ҭ�K\�`S�A�Ԡ��;t�1$\�\�ɤ\�M <�\�$\�!8\�M\�5����ɧ3�$\n��h���@���\�) r}*/9��*ɹk!z��,�TRHGrj3ncڋa$�[�4�}I\�\�{\�\nH��A�#����6\�\�\�+\���KV�@-�f��� �\�\�I]Ok�)�\07�\�\�8\�@nF}�\�t\rST�D��\��\��]�\0�Nk��\�{�o\�g$�ݫ��\Z\�V���� fWIt\�c\'=�C\�>�$�`pE(!\�v�=n\�\"1�@\n�\�al\�\"�>\�h��2��X\nƿ\�t����@ \�|mc���ٽ=�\�wL�j���M\�\�\r\�\�\�\\���{V5\�\�M;\�\�~b�UY��{\�:�sp���\rsW?�?lN\�$��E�յ��Bff,Ǟ��5�?�\��\0�\�q���\�}�Q\\����#-^}���YԀ�\�QUQ�s\\43<��\�z�r��\�\�0I��C3�l��i!�X$�0?yN�\�q\�&�\�v3=O\��\05]-\�+\�p�z8\�{��\'ú�Pg�4�s��b\��y皇M1ݣ\�\�\��Ձ\�\Z��?N+\�{-sXӘ=�\���\r\����\�➹k�\�\�8�\�\�N�+���\��\�|�\�5\�_\�M*\�\�n\���+���\r��ͭ\�.9�k7��v[C�P;`��\�\�D\�+�99�j��U\�*lU\�œ+\���pke�F\�{ҭ\�8\�]@\0\�4\�\�\�\��\�g\�^CmI#\�kU�f��\�Y\��3�A��O�o�YZ$|G��\�UF-��7�e\�V�g���N���;~�\0N��\�|;�9}CX�NӖ$�*�nGs[(�6}+\�\��\�,\"�_��^��*Gc��\� 2�\�e9\Z\���\Z\�\�;l���#=3S*}�J\�\�\�6\�ة\��\�9�\�>%\�w�wkyz2�1�c޽+\�\�c��Vr\ra(�j���zQ����ys��\�>�/�%��\�9\�}\rI�1Lg\�1NĹXJ�d��Kt}��Ju\��D�\�m�=}+ʼE\�8-D�[�\�r7u�#�\�\�\�\�\'�M�+�Uϯ\"�w\�����fl�I\�SUuZ{�ggc���&�\��kx\�D\�N\�\�\�nt��*w�\�z�y����\�\�Z\�y�**\��m+ָ����c�Fq\�G	\�+Mc1�\��\�=\�1ʜ�V�R�\�\�J\�\��ThG2�\�m+�r\0��*w��\�ކV�\�\�\r�5s\0A;t4\0�B�\��EE=�\�YF2NkNRl1ẃ�\��\�O%��3�Nq@\���\n���k��)\03��*���N�w4\�\�	�gޝ�r\�O3o#?\\s\�Zzz�r\n\���dA\�\�\�H��,oc�\�h���\�1\�{���\���dn(p\�Y*|�\�VfT\�p1׏SVA�\\(�R�A��<\0��^�w\�Z��\'��#>\�;f�y;\��*L\�+��|g�~�:���隚u�>\�\\b�g `\��4�Zb�\\���8��[*\��=\� \��.��\�\�k{C��\�\�Ba\��\0�ҥ\�5?�/�P�)\' �\�\�gϦ_)VtQס\�\n��\�\�L*���x\�Y�\�eC�1����#J�6��>\��\�r�x4���)\�x��\�\�B��g>��ǹ�t}:\�^ಂ=|�h�#<c�\��\'�\�Tz�\n�I=*X�q�V\08=�����Y��d#��=\�\��\�*ە)���q\�Tw+\�~�ʤ��I�\r\�#�\�\�B	�8]�\�\�\�1�\\\071ϿҐ\�;�\�\�<\�ϗ2��TＷC\�^2}\�-\�\�l�I<~ѴL͆<�ug+Ϯ>PC8n�\�\�L��cWs�\"7\�X�J�A8#�\����O��ӹ�DA��\�\�2T�\�\0\'қ,�{܊j�$o\�ry\�R�V 	�lgӊ�(�pNkNf�ʼ�O\�\��\�qE\�\�6\' \0}\�E|��}j\�Q\�R;l\��Ce$\n�V�l�\��9��3�#r\�ǭ�#��T\�\ZXT@\�\��\Z��}�\�xu\�2{v��\���.3EI<��\���\�\�\�,�1<}*��Ǖ(n��5��Ն��X�u\�ݐ�\"l�5�\�\0\�A���\�/\�\� \�j,�3�^=E$�G\�\�R�,�\�\�\�$�\�\�d��\�\��\0�2l�\�zg��\�\�7�I\'�x&��8�\�\'�\���(�91X>2^�}\��\��C�Q�)���\�_z\�\�t�FV\�&�q_&\�Ys�A�(\�!|<\�@\�\�\���\�\�\�\�&\�$��\�ԭ\�I\�?F����с\�XW\�\�K)��\�z��sO6�o+]K�\0mH�\�i���<�蛯薁�K��}pڗ\�]\�Y-]\�?(�s��\�\�-g8<�y$\�8Kk\�đ�\�R�6V�PQ\�`\�j�e�_\��\'�Fh\�[HI\��\�\�Y\�\��\�9f\�ej:��m\�\�=�{\�*�\��\�Q:�\�+*���\�ӆ5d�Gmy\Z!iTv�FmU琨R�޲M̷M�\�%�E���=\�F�J\�Q\�\�g?v:#\��\0�?\�5\����\�PnS\�:W�\�\�b�+{�h\�2s�l|υcҹ��	�@9�5�y6#\�s�\�K\�jǛT+h\��\0L��M�\�[аP+�\�4\�z\�S�ȯJ��Q\�\�^�/n\�&�بA� �v�9�{\n\�\����\�4��M�	���\�\�QUeb�k6\�3��o�\05\�&G��y[��\�<M|϶\����v\�0FMy��\�V\�{\Z|�\�{�M\�Z\�a\Z�U�\�A\�`\\\�\���t�C���%\�x\�M*\�\�vh�\r\�75rz]���V �O��S\�^)\��XO(/�#NX�WM�ǉzY\�u�������8\���o%�\�e �Iǭt\�\"�%׈.t	\n\�dy\�\�MsY;��b����9-F\00\�t\�-\�\�8w\�\�\��ڴ\�2=**+����L��4�	\�=\�wnyƓ��\r�bB�\�\"\�#�~\�d�דR�=�N2Z2\�\�c\�߼�n:u\�l\�2\��\�5hi��-�biW �R�MI�\��Υ~qȯg�@Z�\�����Ӝ\Z�\��\�L68q\��^��Aq��q\�Q\�Z\\�DozBE!\�4\\\�rq�a \�g4\�qL�g\�\�\"��\'�^-�\�M{\��\�p+\�uˑ��\�\0\ry7�dY/n��K0�`c5s�ֆa<\�b�؞�j��m�p?U,W-}dz�n�6��5}DأɁ�RN:\�F��8񔌶��n?:ʔo4�\�D\�`\�\��\�-�\�*�Co`�\�څ�\�BH�WS\�\Z�\�\��\� \���\�CI�S1Q��\�[c\�rR\�s\���6�\�gˍW\'\'\�xw\�V�͸��eW5ׇS\�\n\Z#Ru8��\�Ủ�\� `\r0-q\�S\�B*��`�ҜHϵ4\"��z\�\"�\'�RW\�\�I%\�F2\�ZdȚG�*4a�j�\�B_�>��]B�1u�\�D\�5�ը� k��Ě5�,r\�D�\��ǫ\�O�\r\�n=�\Znvb\�gė\�4�3\�1�\�-o)\�\�\"�k����w��-\�\�\�\�\\u\�܏cH|\�\�M�\'�b\�J\�V\'�jޥ.\�_�\�o�~ɢ\�\rM(�\�1]]�k\�P��\�3�ֵ3w�L��T\�{�\�Y\��?Z��̝9\�\r0���c\�\�ъ�#\�#\�\�\�nOv\�Ct\�`�W\\u ���O�~��F>Ϫ\�s��ç��;��\n�\�\�|�3�1]Q�0m�\��\�:��o,\�\�C\�>:ԓ�a�^�\�,`�U9\��\�ơuS\"�\�P�0\�3\��\�{4��{\�Ϡ4�\0�^)�U�S{1\"F˟\�8�LѾ&xZ���.���c�c�c_ [\�3\'\�\�tvs+�;�~8�\�\��ܾ1\�[w��K��8ɮWS�ޯj<\�{\�%\�d\�\�\�\��\Z2@nW�Ei��\�D3\��\�6�9����\�Fe��\�ǈ\�\���\�2\�>\�Ҽj\�\\�ԮD\�sMu1?3H\�=��]\�\�?\�\��LQ�\�\�D�M݀!�\��ϽW-�\�E��#�0�\n�ʶq��s^\��M(;�Ƽb+i�	\n\�\0�\�\�~�X�h\�\����u�\�Z���\�e_\��;YX�8<��\��a\0\r.\rz��(᳟j�\�jd�60q�޼�y�\���\�\�$Λ\��\�xl�ӵIq\nq\��j�\�R���g�\�%Bxt \�!.���\0\�\"�t\�]h\����\\\�+���W�\�m�uo-O��nvɐ9N\�V8\�t\�ǹ\�yo�<mi�\��7�G{	)4e�\�р=�w���H�WV\\v5\�8��FНևB�<␞x5M/Q�1��{\\ǎ\re$h�+�\rRv\�$�.s��-\���L|ĬAVY�5Z[\�s�5\�j:��h�\\\�\�h3\�\�\0+>F\�̍{�B�\rۏ�r���\�\�,\�l�\�v\�+\�u]���g�s�\� ڕ\�~$�\�&\"�弱��?�1Oٴf\�_c��\�Ĺ�\�\�t�-e Ip\� �\�\Z�a2�\�\�{���\�b瑊@�;\n�\rV�HĲ�z\�\��M�h�M��<@\�)�(q\�k��\�\�O9�I\�;i\�{ߤ�hխ�&�i\�w�/�\�Ҵϊ\�T���g\�־D\r\��\��\�\�N	�ƣ>\�VӮWtpH?ؑM\\I�C\��k\�Ը�\�,��\�دT�g��\��[���k�.B\��/�\\��FѨ��]\��aMiua\�|��R\�mM.\�\�\�4*х�9>�\"|`�K����\0��+)\�G�\�^/\�tX]\�s���\�ߐ�(\�>3[\"0\�\�V\�$\�j~C�\\��,��n\�t\�t�\�c1\�}\�k\���Xu;�UV\'#�T�\'RW%\�<E�x�\�\�r\�ю>���$S�s튉�I\�1\r\'=j\�Y\0\n�\�VmiKd\�\�G5\\��� Q��]��\�ҭ\�]\�ZH%��H_�\�\�MW\�\Z���\��\�\�g��b�\�\�\\�vh\�ηt\�x\��K:_\�\'�\�@�ǧLW���\�Z�-\�\�\�<YdK��(\�\�\�.E\����\�ω5���%�)]~T�5U⨏��9O��\�8Bx�\�+\� ��6q�o=\\0#8�\�\�\Z���f�8\�\�\�C�{\"\�ݝܟ|_#eg�4W\��5�u�\��D\�\�T�\�Ʌ�NB�N9<U&P���H�E�˹\�\��\�\���\�S�\�\�\�3��W2\\�����rrj�\�>����C�\�\�o���\�R��H\�3\�\�=�\�W54\�R)c\�2�W�iRn�X6ׄB|�\�Z�\�BA\�\�9�7$\�g+�ܣ\�r\�i?��\�#�Ǹ�lxeD\�\�:\�S\�\�\��};R�I�7a v�#?�{O�|S�k\�+�����\��\Z\�V;Z��\�\�\�\�/F�j\�$Lj�����*ڸuWJ8\�Ae9\\��(\�\�\�{�U\�\�vr�\�{{\�QjnT�U�|t�D����MF3��� T٪qI��S\�rF5	4\�9\�@�\�[\�A\'�D\�\"�Bb���Ҥ9\�<SC�T�?/��W�\�\�3�\�?\�ֽ)I�\�鎾�\�x�\�&�nB~�/\�V�x��*��,���1�>՗w\�\�у)\�\�\�P�D��\�mOj�7�&ac�\n\�:\�v\�E#5��\�\�P{J½�V\�+�����} 0)\�J�iRq�)\�=�5�9�0f\�\0�\�G\�=Ni\0� �Q�0z\�s�\�6�\0)��/:S��+7�@r\�zՒ0\�j�\�2H�!8\�\�W\�\�@̹\�\�\�\�}�� S\�5H�ds�\�D���)\��Ms���m�ۼ�u��4Ə���\�\�\�T^��ך\�LC�^;�Z\��v�ڥ\�~\�\�\�X\�-��\�\���j/��4��]�\�w^F	=;�W�Ǹ\'͌\�\�\�\�d��J�1�������\�יU{\�\�a�\�&�-Vm�I��)���I\�X�\�A���\�7�.���)obt8e\�A f��\�\�c���q�R��y<\�\�A\�\r�)ËU�;�}�V�蒶H5u\�7�p:\Z\�Q<�4\�u\rJk��\�\'=�Cl%v��\�\�Y\�*��\�\�G��U[��h�`ަ��$mn��\�\�Q��\�\�V�C�\�rI8\�\�3\�ѺҜp�Zo\\��d�=:R���=)W�v\�\�\�ޗ�OJp>\�\�A\�N\�W\Z�Ɨ�S�0;SM@�݁�SAs$.\Z\"\�á�jqMǶ}ECC:���${Z\�\�m\�jݧ���Y��\��=�#=+���^IQ�\�Z�(��q��Y\��B���1���k�a|\�g\'�\��\�Ξ\�����\�λg��5/�\��\�PA\�\�ff�\�FxҒx\�U�\�Wv�(\�<㨨ʐy\��\�{{Ӱ�,\�r:g��1���q���iǶi�\�\�x�s�f��\�S҈[{�TR\0F9Z\�L�!�\�Lu(FN{t�\�b=�G���2a�����\�SZ\�\������\��^l	�zD\�B7H�\�֗\�.:H\�\'�s�VN/#\�\�<�[�%���\0�cj\�>\�Y<\�#�5�\�5\�/4\��	A��@7&�\��\�T\�\�\�\��ƺΡ��@��\�\�N]�\�|ǹ�\�221U�\�q�+E�q��>��*��CL^;�\�f�8\'�\0\�E�\�\�iw\n�\�<��\�\n˸\��\��\�)�\�\�ŀ<\�\�~l\�婢yD\\3[�U\�\� .6\�����T7B�9\�j\�UAB}zu���$e^0	\���\���me�\�^���\�0�l9h\�\0r1\�&�6�\�y `�5�wu\�F�� \��\nĐ��\�8#\�ib�\0+��O҄�|L\�H~�9>\�c\�),�cߧ=sU�m;�2}z�Ҷ�������OҨ\nΣ�zd�\�ң\�\n\�NI$\�\��:m��O\"���>@\'\�\��\�Қ%�qrQ�\��N}�\�{*h~u\0r����OONCִ\�z���u*8=	\�V\�8$�\�\�=8���0�eg\�c {\Zζ�\�㟐�>��.\�ˠ0\��?�Ld\�:`~#�\�\�<\�R<������<g��\�jnQ��1�\��\�\�\�\�\�\��\�\�x�T`AnO_^�i�̌\�����\�\�\�Q\"\�\�E\�\�lш�@\�LE܅\�0��=�c5��\�,}O�4\�M@/\�9\�羥\�\�>���t\'�ҭC�Q��x�	��d8=�\�^��\�;\�\�@[\'\�-^e\n\�O�z\��\�!*B\rTL\��V�р�rs�+)\�\�\����fe���r;t\�T����g\�\�L�\�=�( �y�H�g4�,\�\��\�0\�ˌ	���\�\0$c���+)ʖH��\�})\�YF+�0N}\�!/���Ҵ�\�\��Ҩ<r��\�1\�\�J\�E{\�Wp# c�=���8\�+P�[��\�\�`\�\��\�ERgd�GL���1\�\�֞��ޓ~xF\��Ji>X��S��7gV\�\�8\�q@\�\�2��n;\n�l��\�4�\�h\�\�\'�b8#�ւ�]��9\�2*\�#\��;���\�q�x\� !K�\�\�q\�M\�HBWn\0鑜T,\0\�lpENbc��x\�GrA\����C\'<�\�K\��Nr	\�2\�R0\�x\�7�\\u�	\�\'�\��T�a\�G\�M\n\�q\�)\�#��\�\�U\�RR�\' ����$I\�\�V\�� g\'\�z��$��\�֥\�2\�\�\�T��ɣJ\�Ry\��e�v\�T��o\�\�f��U3�C\�)<\��1\�X\�	+\�s:ԥv��H��#���+^�#slt\�y/�\�r��Hg���\�\�ҹ��=\�k\�F�ۈ��\�!Ԥ?y�׊�a4�ᛎ;�Ry�7,\��I\�)\�g�S9M;S=�\�\��\0\��V�YGn�\����\�RS�c\�I\�S�\�\�i&�\�S�8\�]�����yNnKK�\�,�p\�u=\�a�Ҭ�d\�ﻞ\0�L�\0\�oj�X˙�	��I&���a\�Ɠ\�\�\�RF�8=1Cz\�]�<K��\���W��8\�^i\�Dv\�*FW�@2ex�ƭ+ԑ\�\�_���N��3�\�8 /�����\��={U\�g؀u��Ԧ���O���@y���\���mr@ʧ�=kӧ/uh�vk�dpj�nB1ک}� ��\�j�����%\�`�n��\���U\�a\�4�<y�8#9\�`I\�=*6���>͚�7�t��\�˼t�s]\�T\�ٝI���\�\�ԯ8X��+�MJ\�\�td���Y\Z֠fQ\nuq�\�+\n���7�A\�K��\�5\�\�\�\�\�ю-�\�R���\�~g�\�yrm�\�H�w2\"\Z䯮��#<w��+��\�~�Zh�:�*\�2FY�s\�N1�\�\�W9�\�wT�&H%0	G,�k���%\�\�Y�9\�\�$׬j^�x3Hy\��\�nt(A9.@\�]�\�>�\�g�ȣ$玧�FI<\�uiP.\�ǁ�\Z\�g_ޕ\�Һ\�s�fE�\�kNԳg#mSH�\�~54{�~�\�ڔ�r�\�\�0����$��ٍ\��\�\�Qȿ(����l�\�\�.B�b\�W�Y�|\��v5\�i\�XZ\�\�4D\\\ry=�\�u\�\�u6J��R;�P\�\�\��\�<1�Xy\�$��#^��l\�\n\�0}\�\�8$��aK.\n\��\�\�cEU�\�F*9	�?j\�}C��Ni1�f�\\ \�#�K�SǵkE\�v(U#�l�G!�+>��*6z�\�Ox��/�=��cX�#�6�j3c�\�>FO#>�y\�fuP;��¾�n�`\�t��9T��|\�-�\�\�3\\\�\�W&����\�櫐\\�c\�]\�\�\��� n7\�o�~	�F\�SgB5q҆u���\��\�4�$�8#�5OH��]#\���\�8�k6ĕs�\��Z\Z\�]�����bU\�^+��w;���!��:�\��g �U\�\�\�ǧ5\�~*�}�L�\0\�ޞ^�++A�\�I�|\�.�\�\��Uw<\�g4�\�,:\���\�(�Ke�]F\�\��A+�\�IS]~)֔7�Z\�RLI�{�Z��\\�\�\�D�u�ƾ#_�}\'\�S��<S\�\�닏v:d\n�\�c��\�*\�ug\�_0%&߷��Ճ\��.��ݔu}���[����m9\�M?\���؈\�	)	�\�ޝ�l\�\���\�\0�u9\�\�5珵�v�#LrA\�#=���\�z�$��\�+:R\�#H﹟�h�M���\�\"�UR\�\�P1�k\Z}gW��\0]{;�^��\�\�v5K�SH�Rm͸�\'>��v��0�Ryp�ETl�\�Q�\��w\�_�5y\'�\�;��o\�m�ϟV<⽒s9\�_6h@V�\��}+\0t�E��\�\���)j�`z\�<Ura\�m\�ݍ��k�\�ټ���o\�4\�\�D������_#�2�.~vG5\�w?�&�\�R@ VV=\�=O9��>ZHr\�\�wΞ_{�\�\0��F\n\�,1\�)Nk�,Ţڱ+�\�&~\\�qޢ�\���u\�5*((\��V陴Z��l�z9�XY6H\�\�e\0*�%�c\�zb��VC9^�#�l^\�h{�\�Z]�U]\�=\�\�I\� P+Tbѣl\�r�\�\�1���\�\�	�U��*\�\�1||\�J(�O5ϵ\�o��\����\�Ո���Ȏ7 w\'�}*�E��m�\����ߏ֘JG\n\�1�5Xݗq��\�D^Tr{���\�X\�\�\��0NO,\�~���m\�SJ\��a��ߞ1_N\�-��k0Dk�\��\�\�\�\�:���|���\�\�*+\�xLP��L���j����>�(��\��D|�:{׉x\�Q���ٟj���B1���\�V#\�\r�˖ǚ��f���p�\04s&uHs����L\'*̛�{I8 \�>$��\�$�\�c_F\��Z���\�-]4�HJo\�\���\�]\�|M�iž\�}4 �I\�:t5�ʰ>a>Ɖ1J9�R	��{F�=�J��p���\�\�ic.\�2}������s.\�y�.\�A���\�Ӄ^/o.��.�r\��\�s\\\\\�\�\�r\"g\��\�\\��4\�T�j\�X�WR��\��I��v\����\�x\�\�W/k\�n\0\�\0q�\�גZ\�Z�����\�B�e7ex�55֭y/ڥ��\�Ԩ\�\�\�S\�ƮU�\�u\���.G\�5	d�r��+���yX�Ҽ�=	��[\�7������nӂ��\�qɮRi\�\�cI�\r\�S^��7^	�\�\�\�ֹ[\�Ć>Ñ\�<Րş;�\���c�\�?\Z\�J\�\�:\�\'>��2\�\'�\rY\�2\Z@��g�zϔ\�\� \�f���\�4\�(\�!H�f=\0��٥a܌9�iT�T����P\�\'�\ruv�\�\��\�K�=2Eq��e�\�ib\�r\�,�<\�c��I\�1�X\�\\������v�*J��\�<�].�4/�\'�_���_$�Ҳ%�I\'1X���3��\�\�,$\\\�v\rI�DW֬C�\�\��<E�\0!\�G�\�Ny���6R$�[)t �{��}ro�&�u\nҶ\�IH�\�\�4\�f�v�\�S\'\0TC?�J*\��@�t��,H\�\0�ݞ���c�l:�QW�o�\�\�y����C�p;M6�\�u�H�\r\�?\�9�\�Ƶ\"\�\�0���ʰ�\�9�/֝�u:<\Z\�o�P\�U�cpCu\�֪k\��Oi���\�	?/\�=\�$�X�\r��j֗(\�\�A�h�\�d\�a�3N\�\�c4\�#?����W��R`�|#<�\�\�5\�\�\�z�\�f�h�f�q��\�}�=,�v\�%\�4_�&M;!I\�&�\�L��\�\�\�\�S�Ѹ�G\�׷\�v�k���Ќb�������A�\"��R�]�՘EƬe\�Ex{\�e\�\�mLmѧ��\'ԭ{M���\�Ƴ\�\\\�<ތ\�kᨮ$\�\�n��\�/eu$-��\��J\��h\�\�>\�`\�=ićC�׵|���R�&���\�\�����Њ�3⯆\��\�\�-�+�$CI����u��n3=}*\�unA�5k+�kq\r\�l8*\�ըe���jM\�\�0�Ã\�\�\�8��*�\�Qq\�\�\'\'�+&Y\�S\�l�5�-䯅,Gӊ{�\�\�Zh��\�\"x،05�ql\�\�Ӓ\��s��as\Z\�M`j��T?,�f�\� |T�Z	W#�*�\�a\�B3�5<�1�\�ΠW�x\�O�㴶�^yN܎Bg�\�r\�褛��0��U�C�Kq�F\�\�\���\�2�G!\�#񮍛)�\���=\�K�&���Xf��\���\�ץ��\�\�˾#����)\��Tc�\�\�\�\�׈`�ʐ\�\�9�oƻh�\�(�1�*�>��(2_0���\�}�\�\� \�\�~4j��&���xa�\�\�˱\�\�\�Uq�plׅX�a��~�\�\�1��\�\�oZ�W�\��\�/|���%إ8�z�\�	P\�\�$QnQ\�A�\�\�ƺ�ek\�\�FG�`\��O�\�\'lwC\�)r˰s.\�\�\'QU�N�׉_|[�{%��v5\�\�?�ە>N!��\n\0\�V�\"\\\��������,Ȝde�\�\�GǾ�}�6;�9���u\�R���y�I\'�X\�J\�Ě\�SD93\�u?��r���3\�ז\�+Ե�̒��5\�n<��\�\��QH��)���\"�q֚8\�������QA,\�~t\�$\�k�-��`�nbq^�3\�\n�\�m~\�kx\0����{1\�\�+ƨ\�6ϧ\���R�<�\�7�&\"\�8��/\�ݞs\�5\�x�a-\� t�<�\��\�zxxښ<\\d\�V^��V.p\�#�T{\� �\�Z0\�җ\0�\�\�c�\�g\'��\�O41ڐ�X��9ɤ��\�N\�_Zi\�?�\�ǹ\��ϧzr����q����\����\�qJF9\�\�&\���K�G&�؊c�\r\0z�)8�>����A\�l�7�jx\�\�4���H\�B:ӈ\�\�M\�FrsR0\�Jz.y\�5y\�\�R�<s\�v��\�7?^\�4ӓ\�qK��G~��+\�\�8>ب\�\�ԊO~�\��<�M��\'�zVS\�\�)\��b��:�})�\�f�\���;\�\�\�zwb���3��ӜT,���\�5_+�q\�!|\��qJ�bv\�ri�� {g�X\�E&2(@��#h\�A\�Zhg��\�t\�h9 \��N⟕\',;S\0\�Q���J\0�6ONzV,})���u\�G!�9$�\�Z\0	$�\'�#5:ϴ���\\\�\0n��+��:���\�h\�Yp\n\�\�NjH��l}s\�X\�\�\�ɞ���֬.���\�l�4�!�2rq�\�\�������\�\�y?�ļ�\�C�q\�)���1ԑ\�\�8� ���q�\�ӭ$[<ͥ�\�\ZW`�\����	�H<\�A\�\0f\�k����M�v�a�O�s6�\�\"�\�S\�@\�\�]J�8Ul�\�\��V�%�#wE\�O^�qP\��\\l\�8p�)��ԇ+�\�;�Vf�>\�II�\��}bG%�NӶx9$�z\�\�s\�0~_§}\�\�rq�\�=)�x,�\�\�O�b\�\�\�0;d���@͝\�$���*�o\�N��\"�\�@n��\�RQy_\�!����:�ղ8���\��R9\�#ڰ�0@n�\�]V��p��I\�q\�\n�芎\�[�,+\�u=j�燑�9\�Zm�����Ӱ\�{\\�Gj\�\�:�\��ZV��Ρ \'\�p���Z\�\\�\�?^\�\�\�1\�\�\�u[��:3�.&��蚒\�$�\�ʣ`.;W��#Ŝ]\�yxnFA�\�\�=1\�Ҵnĥ_v\�s\�Se\'\�ή\�Vd%x\�3\�\�\r\'\�@�r@��\Z%��@�\�C\�\0z�㚽�y����=sV-m-F\r˕�;\�ךV���\�\�8\�\�\�\�m�F-��7\�I\�\�!\�\�]���\�\��\��t�\�:D81\�N@�9���S���\�tG]:Z]���b�\�\�\�\r���;x��0�\�k\�\���02\�\�\��r\�)I7;rI\�T\�(X\�xC��Ո<b�\�{p6M�\�\�#5�,rlm�#\�\Z\�贊0�v�\�g\0��\�:�A\�\�� &L�c�]~]څ�@b8ϭP\�)��3\�\'�F\"\�e�\�\�\�5\�\�h�%\�l��XM�p\��\�i\�h��\�O�P@\�{d��\�X`B�৭U��b�8�H�,�\�ZL��\���\��O�W��S�\�\�N\�HcGM�\��U4��:qڅ�щ`\�<qZ6,<л07R��\"����\�\�3\�T \"\�+�Ȯ�\�6l�B\�\0`��@�������\"-\�s�\�89\�H�ry\�\�\�U�y��3�\0r9\�\�\Z�\���\�	e\�NHϹ�\�Bs�\��M�b:\n.�\�\�N�ԨX\�\0�b���\�)`�\�`�����\�\�ښ\�O\�s[2i\�9Q�\�)�\�I�o\\s�W��N�ڢ;�߭j\�\�y1\�c���A\�#Z.+3\��kH�S&@Ts\�i��\�^E!�\���j\�~s�=N\�*�Jb\�m\�ҵ��\�\�\�5=Ig9YSW�=\�\�qyvQ�㟭tұ\����R\�5T<\0MY�g\0\�kś�l�\"���\�\r,���SOr\�\�[ګ�e�\0P\�$�\�B�I��\�\�\�\'}\�\�^\�\�X�tN嬙�m\����!z���{U\�/�\�!d؊�\�WQ噱\�#p\�z��\�G�\�ܵ7\�V\�&��s0�\Z�	\�.Y�\�:{\�?\�\�\�I\�`=kIm��e19Lt�\�\�2/�\�\�r\�ڻ]&FxT�Ҽ�+\�\\��\�A�\�|@��FH\�ۊ�E�)Ş����A�\�=j\��\\�s�+�\��ч��Z�\�h|�\Z\���\�J*\�4j&Q��m\�O4\�ҹ=Z\�Q4Cs�Y\���.SQDR\��kJ���68��-oC���\�Wny\�\�k\�\�t\�R\�奼q\Z��w�Aq�j��\�\�\n\�\Z\�N	\�[\�zv�\�\���W���כj>\'�\�u�dH\��Y��7ȝ\�>\�Kj�\�d�G=kuF(\�\�Ƚ>�q>\�\��Z\�<\���I��U�\�\��ϥFB�JV�6\'�带�FA\�\�1\�HI.;\n��}\�<S�\�qE���\�\'�iX�dб��y8\�sVF�|pL.=8\�j\\KR&�\�1�j\�R�;8PJ�y�ǌ\��$6p@�\�\�-��\�8��m�̿1\�Ӳ6�\�l&\����=�\�M�cN7�VmFh�##�\�^��\�G\�\�t\�s\�)�A@\�\�=zR�|\�%�ϩ��ٜ�\�y�k��g���ZH\��>\�\�3��\�\��9\�HS\�q�ӊ\�\���\'��f\�{�杅\�s�u\�\�N+��?\�\0��G�s�;d��v��\��\�>\�<�\�8\�蚴	�Mz��z\�?�3��\�\��k�.ӻ�8�c\�\��A�:Z�ԣTh\�\�\'=\�\���]Rns���b��\�p��+\�u5�|Iry��$}\�rc��E\�0J�5��lT��E=\"�^]��kұ\�\�\�U\�OJr��r=�\�\�\��R3\���H�\�\�\n;Ӱ\\�\n�\���0F*C��\�\�  �\�ޗ)I���\�rzU��*�|�A��E$�1��*�^�\��\�.V+���0\��Zn�qQ�R�\�C�9\�;ӄr6\�Ԛ9YJVH�9\�V\�,�S5_��sO�9\�&a\�ڡiY�=:\�Y�r�9\�x]<\�j\�dpy��z-�kżo�Ty�\�k\�%�f�\�[�\�#\���\�߻2u	3� \�n\�mNR9	�8\�^���\�gs\�\"�J\�E�\�F\�����w\�ޔ�+vm-#;�BВK\�\�Z�Q�܌q޳\�7<T�\�\"��2<Xg\�v�\��R�j䓌�\Z�N\�\\�>�\�4^���\���@ģh~\�c\�k$�:Ա\�\�9�8\'�dfѤYX#�4e�\0\�=sP+3\�\"�Pw�\�\�j\�H\�ľ�h\�\�;y����_�G^�� �\�\'t��D���\�O�Kin\�1��{*ns�R\���M_0�H��o�Hd�\�Uq�\�\�\�0�Bɸ?$ds�ҧ\�\�\�\�\�8#\0���\'��2�I�i6\�=�ᾗ\�%\���$;{~\�\�`�\�q\�k��֙�g)�V\'�Mum_-��\�NWѽ��\��!�K_R�ĬO���\�\�x���\�3\�\�\09��\�>\�W�\�\�$�|¼S\�f}N镹\�+�*�\�[\�39��Ewf�v����\�FO�mmle�l�ٝ��v�H�\�\��\�\�H\�f1\�i\�vX�֦\�\�<�]8\�G&k\�yQ�\�kj�\�QB$�K	\n�~5��\��ӻC$\n�CTmHKC�A���\ZfƸ\�%�9\�\�S(��3M�\�-�(���C+uQY\�X\� *�٭���\�!����s���W\'����iRE�\�\�.-e\�9\�jʤ\�Br�u�Fc#��B\�\�%\�N\�V.��=\��U\�p(\�b�UIbï5�ґ\�\�֪3qY�v*,\�1?��3I\�\�\�\'8��\�s�P$e d�\�\�8�T\��M�r^i��8�\�c�^�\�Ǟ\�V{&\�\���k&�\"!X1\����I\'�=	^y�F@\0ϯ�f\�D\�	��o�zS\�\�\�J�\\�\�k&Z�EW`{��!=j<�\�l\0��i\�N����ph$S���+\�56(e��_\�\�9��\0iA\�!1�Gj\0&�\��\�r<rjLSGJr\� �Ӱ)(\�s�w�\�m\�4�\0@?\ZS\�ja\��#w��\�4sKI�\��jA��\�&��1@\n\� �+��L�o\�~<�Uǒ=����\�?�CwX\�\�&7�=\��\�?����7�_�2\�l0\�̋\�\�^����D\�\�\� �\r|\�*���B�ٟ6\�G\�pjffꠂÜU\�Fa5�tF8�\Z�\�\�̅	P\r{\���g\�Mr��2Xn.>L�\�{T�݉a\��\�w���\��N�OQPO�<2\�\�\�6k\�o�\�H%\r\�ӏj\�,�S\�\�0_�\�\�x\��ך\�\�\�W`���\�\�����ϣ�=\�n\��\0M�!ppY~\�z��]0�+�d���a���DK���t\�ўFk�MX\�\�\�\�*���\�\�\\�6ٲh��\0[��O\�ȋߨ�R��\0�\�RT\�~J��oj�D���\r\�]H�Ě��i�}\�Y����b��]?m\�\�]=�}Ꝿ.\�#\�i\��Z��K6G:\��\�{\��҃~F\�\�ڵI2N�\0�����4��$\�J�}�/\��\�\��Z�#83	�F�Z\�0\�u��ecWQ�n�~�K;\���s��H���\�[\�1�$��[�\�\�\�\�\�\�Ը\Z*��v=��-�\�*��\�\�\�]Dr�c=+�4�\�m�!;�G�g޽\�\�\�\�=Ey��~ͣ\�\�W��zlp\�5�\�e\�y|d�\�\���h�B��v�23^M4k5�H7����+�,yٌy~\�J�u\�)�\��.@<�j�\�:)\�\\Wi\�=�Sncc�s\�皡\"\�^�t\�J\���\�\�7�\��\�\��\�vݸ\n�Ȥt�f\��+\�7QU�z��\��є\�F8\�\�ڮ\�Z��\0\�C\�+1\0Fd\��\�V�L)�\�iX��\��Jf\�*FÎ}\�=\�\�\�\��\�C@�\�q�Z�\�\�Ϩj�N6FAc��r `��\�ў\�\�2\�\��N=k\Z�9!\�ά-?kUvZ����$*1ۊ\�դeF�ǥt\�a�5\�너�\�\��\�^R\�G\�|1<C[�\�{#H�\�b\Z�}$�ܳ0\0�\�L�^\�5h/C\�\�\��o\�Nh�HA\�4\���1c�8��\�cM\�\\@�\�\rI�1�\�?\r(�\�>�\0d�Чo\�h���z��;�a\�Fp�\n`n@\�@�?J2v�ӏ&��u�d\�❚N�\��\"�9\�MG㌚8#�^h�}\� ���N{ƌq\�j�7PsN\�\�j`$T��\�(*\�\��\�4�$S� \�s�qǨ\�@\�\�X���g\ZRI��\"���\�9\�w9\n@\�\'9\�H0����sL<\Z{q��Ni��F>���Pz�P�\�=�\�?i�`�8��d\ZMܨ>�\r\�Gpy�\�\�u<{P�\����<\��J���o\'��i3��у��\�\�hy\��\�\0�?-9S�\�sR\�B\��\�0��u\�5f<l\�ޫ��t\���O\\���_jvVA����Q\�\��\�8\�*c�\'���Nd\�\�dg�?\nd\�\�36X��>�x�\�$���\�\�+w�#H~\�\�\�;�\�O�s�V3d2������\�\����;X\�,��}\�a�plu��\�]ʫq�S��	@\�~\�&�w�v�L�8\�q�\�j���h���c�5�\�\�\�pwW;�\\I�c+Ԝ\�\�H_\�\�}\�\�.\�\�ñ\�9�[\�� \�p@\�QB�A\��\0*P@9\�P�<sۭc��텱��䚳�G8���s��#�?{1\�jh	\�\�DH�#�WK�Hє\�\�.\�s�\�w�px\00�\�I�)~~�\"��Tw;kb�\n��r? Y�WJ3��3\�\�}�г�*\'\�\�J��א�\�prI>�ӊ\�ASc\�\�濙\��V8�j\�\�x��\'\0V`�Y.ee\��\�?�EyǔA\r\��\�Vާ$��pz���%\�Q	RGNEsW�\Z\�	�U�\�V$\�iw#HFY�\�\�+Dj�\�\�r1]1l\�qL\�e\�/\��c��h7\�T<�Oz\�Z��ʺ1\�;g֪O�\�Ȼ1\�9\"�\�bT\�\�ҋ�r�A ��W����~��ޥg-\�\�a���!q�Et\�^�\Zm0�͂2x��N\�֕+�\�5F\0\�\'�?���@�51��Xv$*�r3\\m\�w(\�r�<��i?�y����\�Y�\�=�\�\�e,\�p{\\���d+jORZ(I4O�N[\�ږ����28�\r\�\�x\0)\�����6\�\�w�\�])�\"\��rۭ2f#p\�\�+�ӭ,\Z2\�t\�#��Q�\�-�\�\�U\�,`o�,d�ܚΝ�l\�?6y\�\�i�h�\0�D\�T�Z\�i��\"$U\�ԏƓ�\�<�$\�p�]�99���rr�0s��s�F�m\�XǥcMa5\�\�5*zv\�M\�c�b��q�s\�S��\�\�G͚\�Ǉ�V?i`0y\�j��֗�}�-�\�\�\�8�p��Ooj\�4my�WfPd�s\�ZpxRߢ\��\0\�{W�h�I��\�x�\�g)h3��v�\�mJ\��ɮ.\�\�7�#s?S^\�\�M\Z$�\�Xq�j\�5\�R\�<\�{x\�\�4�ط9\��T�!>v=>Zҷ�pX�\�X��3k� # (O�pI�\��uX�\0\�>~N�\�5���?�E�\��d\�\Z��(v\�\�\�7u\\sWS\�\�\�1*�\�w���w\�����zQ\� �My�V!�1ɪsxv\�:��O̫\�V���\��\�\�9\�}�1o�\�s>�V\�\0担�B.\�>Fl!\�Z��\�\�\�ܞN0k\\\�~\�-ۦ=2+\n\�Vkir٨ \�玃9\�;�mꤣ\�oz\�Kg!�ϧS[��|\�C�+Oͻ��7\�g�\�ZM�\�>�g\�DB\�\r\�\�\�-o�\�;צYj�����RX���\�N\rC�j<S�\�:\�\��\�w>�Mt�@\�\�49o%2#py\�<1ᛋ(�\�^Msת�ׇ��\�\�\�\�-��Wp�WZ�����V;N�M\�1J\�|`n\��-�\�1�tixP	��\�\�T!I\�[\�\�\�\�ǘ��w�[\��[84\��Fu>xe\�۞�L\�UK�(\��\�\�O9\�+S^_&G򔒽�\�\�\r%\�\�T2s\��Z�G�%i3��;K\"$\0��\�U��Z�\��\�p^\���R�d1\�m\�A�v� ��e9N N��\�_\�au\�q\�S4\�6+\�ژ@\�銹�\�:mԫ��[=��\�W�ivZbơ!\0��j\�y�uЧ\�\�+X\�\�(\�+W\�L\�V\�X\�\\U;䶅3��\�\�&z\����X\��L�@�_U�5ԗm\��\�k�\� :�\�Lx�OR{\�?�\�1\�3\�\�\�\�(+�\�*�YM\�l�B\�U��ϝ)c�+8�<�\�{���\�7��\����\�D\�\�s\�溎c��\0��\�]]��� ��1=�\\\�^i�6Ʌ�5��\�Z��9\�=Ӿ\�ll\�\��N\�\�C�\�M5\�O�ts\�\�ȭ���\�o$�G=�\�g\\\�Ilw�\�H�\���}h٩c�ۯ72�8\�毯�t��\�w�ݒk�[� n\�=qZk�\\�ۜzw���\�K.��.Է\r&݌\�\�\�Eh\��|W$\�\�6\�\�y>�\Z\�5�\�g�((\�n�4�6�fvSֲ\�A�\0��0\�\�U�V�B\�vz�5t_\�W،6\��\���h�&g���@��p@5�\�\�*���\��Օ\�\�.\�#\�F*\�ґc%T�zc�Sb��9\��P�\�e\�\�HF$��V��\�i3��<�\�)\�d���(\�a�����c�H-�=)�l��g\'\�Օ��a���s�\�V�\�e?\0�H\�权�\��]�Ly�\�A�b�i\�aُ>�fkcps\�Z�c�愄\�FsW{\�M>\�;���\�\�~�5\�[ �+�xǨ�hѝ�\�1�(`V�8\�\�\�\�EN~���$|���\�b�ws\�\0I\�=\�I$*�\�F+\�|�\�J�OUhm]\��1�\�\�u�1\�P�U3��Z�Iu-\�#\��WQ}�M˖\'�+�	�����qG�������qVt\�Li䣎��+\�Z[RJ����_\�Y�h�k1�\�s\�bp+\�Z�SF?\�\�5\"G�0zsX\�\�	\�!I\�\�\�&\��{\"#�|\�,��Z\"\�,܂\�`�VM\�Fm6\�,�3��\�u�f@A��\�\�Y\���~�\�\�y�\�\'�M+\�iid\��zt�\"\�\�>YC\�Ϩ\�B720\�ޠmzԌ,,�Ӹ0y_\"\��\���6ޠ#���Vd�s\\.a,J�㊆���|\�\"����E\0v���>��<�H\�;��쑆\�~�;�O\�ښ�9\�FzsW��95\�\�@Ov#��\�Sl��)$�{�\�&��i�\�f�\�\\\�95R\�\�-m\�@<\�|�^I�\�\��z4\�:Q�da\�,�\�N\�1^\�U\�Nz��o\����,�FZ�J�\�/$%s��oOc^�[R)\�\�\�5�6\�5�ј�\�\����U�O\0��v,�\'@<r\r<�j`kx̆��S��q�\�Y�\�辙�\�O�~EL�ҵS#�щ��onƚ���l�Hf\�C���Z��\�h[\\It2W8\�P}kR�#�\\\�t����\�70F=\�\\�\�(b8�5|\�\�$\����\�\�|	d�o��\'~�\�\�&�yrG\r�\�9\�A�׾�gF66vД*\n1\\\����S\�G��\��\�s5�N\�\�B�\�\�Z,b\��5W� �`����B\��\�\�H�}QC�A\�^I����5K\�\�I37n�׿H\�%f\�׌��=~qk��L3\0\�\0�u\�er�Y.�<,\��v��\\#\�&zZ[y$h*�\�\�\�ں�F�G��@\�O\�\��A�A_l�h\�_H��˴\�h�KT\�=�0BH��V�mN\�pJB b\0l1<��X�\���[Y�A\���\�\�s\�o\�yc\�bs\�O#5�$M\�\'�\�Q��\��2)�\\�x��\�r+7�Im�dۜ�z\�k�7`\�%���A3\�`g5��I\�\�\�Szd\��)��\�\re#D�����\��3Lޢ���&v��{��\�$�8nY���\�j�N|���	��\�L\�(���f0i��Q��:\�L���@�5fD+\�9\�@���DY\�8�\�\�P	\�N�\�Gj{\0>�΢�s\�L\�.:\��@\�\�4��:P!͖�.03L\'=\�á���\�\n_ƙ�\�\r�Bb�4c\��9\"�!��\\ߚC\�\�Ҁ��)F6\�r	��a�>��x�|�Los@��jZgNr)A\� \�\�	���6E\Z\�\�]w��.��tU�<\���w^\\�\���,s�\0g�ߗ�\�i������;�($\�ջh��UQ���j}m�\�\�<kMX�`��Oӊ\�0A�A��f\�و\�\�+�+\�0�Ї��\�ˉ���=%u8ÏZ�k�&@�r1U�4�5\�\�r\\г�\�k$\�\�\'���\�M�\�`gcpk���9�\�p*����_<:F�oÈ��\��ZV��`w�\�I�x�\�\�#oy�#��+���\�\�\�c\�ޤ�\�O�\Z\�i\�O\�4N\�((٦3��\08\�T�\�a�m@�rx\�\\ܗ�Z�\�Z�}j\�wу�3\�\�\�Q�#5Y\�\�A�;EEw<s?\�\��G\�\Z��\�h�M�w\n9&�#���B���w�1��\�5�u�C�\�N:v�\��\�:\�Sq�\���A\�8槛R��~yI5ZI� �rjZ)4:\�e��H��{��Ģ�\�5�c\�M\"\�F��\�\"F�;��\�[\Z2���qU\��=\�)SM��#\�b@\�Fr���;���x�8\�Ͻ{��1�Lb�\'S\0]�\�0{V�7vўd��3}\� 8Ȣ���O�%to��\�~q5I׆Dq\�3Y擓�PIz[�&q\\��:U2͓M\�\Z^T\�?�\0�\�ә��\�\�\�9�\�LӰ\�\��jp�c�N�v\�2h\0R����\�)0/i�y\�\�F\�8\�qھ�ҢT�9�{\n�z\�\�\�\�\�FJ88\���J�%��@s�LW���\�z�n�5%Q��qZ\�ec�wIS��\�\�ː~���\��\�I{�\�7\�\�\\da�8�\'�x�\�u\n\�I���ʎ��r�����%\�4�ri��3�q\�)���1�M%8N\�Fx�\0�qޚ)\�\�I�g�sց�@\�OҎ��\�c�)b[�NM7�J2q\�M\n¯NrMW\�@9����\� <҂@\"�u��Ɔc-\�z~2h\'�(�\�H\�/M�\�\�q�:\ZSMɠb�\�:g\�`rM^��p=1�\��\0\�<⎠�u�\��i��sC`*�\�qJĂB�3\��\�8�G\�\�\�<u�iy^�� $�����\0B>���pq��h9\�{\�OZ\0pP03�\�O���(��\�Jx\"��h;I#\��\0\�z\�ɧ`��g\��\�*�zR灎=\�2\�\nH�@:\�nIZ2}Fs\�\�,�rI<�V)瑒}�@$a�\�jP\��\�_�\0]R%���\���\�\"�}sҤ�X�ǿ�|�FO�i��!\n�?�O\�Kn裂A�x\��\�\�v��t\�w4�&O\�FI#\n=q҆?��\�\n�3\�jxW�2z\�i�\�l9\�2N\��Z����(沄� \�\�\r���+�Ӡ\�}N\�\�H�[�\��O���J��d�穠m�͌Ͻ9�d�Fs\��\�\�FV�;$ \�����\�\�2I\�\�\��u9���\�p+�8Vm�\�g=�\�\�rz�\��8�\�q�C+�$�܌��2ShnjQc�A�=�\�9p���A���QpF\�c��\�J֥_u\�\�s�\�جۗ=\�#�+��-��7s�k��$Fb\�g�z�X}�����ǽeSb\�\�\�$c�v��vΠ��Ek���\�۹�\�\�\�\��\n\��\'��+UO��m\�NSN{\�|I�\�kh️\�\�l%ݿ\'ҹ�Eet�\�w-�B\�㨽\�\�g����\�53�,�(�ֺ\��G℩V${զ\�\�	�r2:W\\]�ud\�Z\�]�\�y-ЏoZ�<%�lbܰ5�e�=��+�=p1�S^���M��?�\����I��\�q6�,zb�\���&�N\�{G��\�\�u��b�9RH\�ҹ*;���\�4�ײ&%|w�\�W�\0�v7f/)\�WO�s����[0\��+��d\�7lNw1���SA��\�4c�y�],Wmt�c��gj(�G�#~x�`\�\�\�V=8�!�ߚ\�\�t(&%�\�\�:\�\n\�г\�Kg�V�>A{\�Jb\�G�\�:eͼ�`�\�	\�\�^�I\\���\��[\�8;!�y�\�s7��\�\r��+E\"yJ\�+\0\�0\�\�ڬK�C,`ov|�8\�ki\��mĉ[i�\�?\��\�*\\�Q8x�̬^@��\�\�Z72æB�[z|�#��\�\�[\0�=i\�M�A\'׊W[Gk�FZL\0kZ\�M��L�\�зj\�M+\�\�*�[=3\�L�~a\�%\�\�K�,Z��j\�Y2e��;-\�\�2q�u\�\�j�:0�BZr\��V�+KҢ��\\�\�y5���8\�r\�R��\'nN8\� ѧBw\�ϻ�U�˨\�\�\Z\�0X��H�\nM{\�NY2m\�\�I��$wͥC���\�U$Ҭm�m���Db������}\�K��\�\�-]K\�$\n��O\0U\\��\0\�tyȊ4R}q֯�KW�R\�x�\�j�6^T\�\��\�\�\�\�����A,zQq\�\�u5\Zzy��{+�5�gBs�O�m&�ry��\��)ˡ\�n�&[<\�y��9Y�� \��/�8�� ��W:&�zA�\�8�\�A�\0֯A�\��\�f\�$\��W�\�Rt�\���|��Y=UZD|0�3�\�{B�\�1PO�\�\�(\'�Ǹ\0��l�\�	=��{�+_M��\�<g�`sOM\�pJ�9�+\�TEm|`+f�-\�vE<�>��96��\�.\�D[��\�z���8�\�\�.@ZԓSX\�;0My\�ey�(�Ļu\�Ƅ�\n\��#�t[��`�)��\�˖\'\'�+���UG c�\�g�l\�Җ\�\�\�2]���\�\�C>���5\�\Z2\\J[�$�wPX���\�\�\���xm\�\�s�1Y7˦��Q��]\������9��z�gb�uj\�UU(KVy;i�\��㌷\0�2\�Sϣ�\�\�A��\�\�\�V\�\�\�}p8\�m\�Z�Ja\�\�[J��\�\ZM��м0 q)��	\���KӼ\�81d�խ2x\�]�pE_�h\��\�\�\rI9H�)F0��[���B\�\�\�_񹳐@!\r�rGWm�ݟ)�NH\�b�~\�4�v\�\�I\�2\�\0v�\ni\�\�|EW�,\�&����?\'��Zk�Pn7	�:�&�\�x{Y$lEF\�9\�]%��5)��L��\�Fk�Y\Z�\"_L\�(]��F*KY\�vf\��\�])�퍿-\Z�\�53ϰ�]\�<�\�9\�\�W�ډ\�\�f�a\�\�\�t듃�Cx�\�6P�N�\�W�\�\�o\�n�$\Z.<Z\�\�����P��}̧jm\�^+��\�R�\�3\��9\�_����PD��a�\�\�f�����ϙ #=�+J$рUX�d���j��i�+��\n\������\�_*9 �\�Ύ�\�\��8�u�TѮ]���sWl�k\�g#2v$/5\�[\�K0\��ƙî�pcXY��z~f�m���E�E�7C]\�ؘ\�\�7`U9�T��Ǡ�\�!��ޕ,�\�\n�g�aMb6o-�צzf�ձi�]\�8\�T�5��u�H4�Ţ4\�c����\�5��aY`�ǯ\�,7\�9\�Y���ʄ\�\�ǌ\�����fd�\�r\�Y�������c\�oo��\�\��\�p�mQ�wɭ-iR#=\�\�녦�ЇÖl�%R\�\'�$��V\�\�8�5\�\�\�:�\�f(�\�*�q\�Q�{Q�\�$�x!��\�\�++NB�g=k�ЌS�\"ȼ�\�y0���p�w��\0+Լ!��133+��!ل����sn�m<������\�;tP�~� �\���a�םc\�)\�\�\\�<W/\�hⳏ\�\n��C`W��H���8n�*꼌+ZR\�f�~\�\r9�Mr\��P\�\�\�ca}p\�3e{m5\�s\�k}*\�p����\r�\�	��\�^�d�\��\��\�I\�A��\�\�\�MZ\Z4V(\�\�ɹ�t\�O7\�\�+�\0U#r�<3q�J��c��֭\�~\\q��b�\�l\�wZ\�&��{\�㑓׊�|;\'��=��$qh�\0,O\�h\��7̡T�r?:\�?��\�\��\�ֳ���6!e��\��bdiz��\�J�T�D\n\�a�g�`��ܧx\�{�\�\����eqN3\�M0![�\\)c�\�ͼ�K9�*\"�a\�R\��L�W+��^�\�\�%m�\�S��\�^g�ڵ\�\�0�\�\��\�^�\0iCH�@�?R\�P]OW-�\�7Q\�.\"{\�{�\n�WG�ʾo��\�yG�R\�\0k�X�V�}\"\�S�t�dϷ�V\�:\�G�\rnoV\�\�5Q���N\�Ԃ�Zj\�9_\�ɧݼoҠ�z���Ev�d��^tsɯ�\�V��a?-O�\�\��5�\�BL �\0\ZC�*0ƅl=Mu�\��\�J�)	\�@Yy\�R\�yn랙����Ҡ�c�=~���\�\ZH\\��BM�RXt\�SZ=��\�\�Y�\�U��\�V\�\�T�\�pFz��5\�\�$c`ꢫ���½9b*e+	*xZ|\�i3s@\�\�ƥm�@A*\�}kܮ\�\�\�!�8 `W��;P3\�H\�c~5\���]H�\�j2\ZY7z\n��r�\�\�\�^�J��{����\�1�V��;��\�c\�_̑�@\�\�{U\�5\�\�\�ڸ\�L�\�!��\�GNMy\'��|�\�\��\�\�\�z����q�确3\�\�\�K\�ø�l\�*\�G%\Z\��3\�\�\�\�A�4yP��	�\\r\�8ǥe���\'wˊ\�t\�$�NO@1Xalu\�	���\�G\�J-2�,+�\�g\�䎾��1^HR��8���g�\r\�<\�*;\�b,�A�=�ҟ12�,Xe�x����c�\�⠕\�C��8\�RV=\�$\��`f�(yG�\�3\�ޝ:\�	������E�����4�aEO\\��\0�\���i\0]�dv��\�)\"7\�9��lqמzՆ\�5Y\�\�c&i,���֫�2i\��\�H�\�f\�P����T\�\�nԍ�<Vc+˹����jy�Vr)0�*i\\{\�\�e�$f�i3\�\n	\�+��;�Rq���\�	�g]\0�\�4��>�\�\n.ML�5	:�\0\�\�R$\\qGCR{S\rh�cNzqMݓO\�4\�\�\0�<�;�M(���Ú\\c�E�aǽI�\0��L��\�4\�\�ҁ	J�/r=\�F)\���ԄdS�&�\�Rh1]\�J<�F\�9_\�\�\�z�^�\�E���n���1��u���K-W\���\�tS\�+�\�\�.\'��\'pLs�\�v�s��\'���\�\�\�VԬ\� ��O|\Z�!\�^G\�U�,��\�\��\�[I��\�\�k\�|W�x�\�&�0Q�S\�^E\�~�\�࿂��>{1V\�7\�&GHp)\�`�HN+�ǝr=�\0J;�\rFE;A�\�icg\�4\�b�>�\n�!\�o\�4g�6\��ON\�9�ʇ\�E�<\�s���Ӱ:\�U���W`��Ru�\�ڏn�����q\�\'=�b��Fܰ�\ZФ{��\�\�υ`�9p�Y\�\�\�,��1�=\0�_�zW\�����_��]�p8\�_;�k\�\�\�Ϫ��\�����mP~\�N�\0)5\�ک\�{&A�{֤r�\�W�j�����\�\���R9s5\�G\�\�\�GR)\�ۚq\�4\�\�+\�<&�y�߮)s\�\�M\�4\�\"�\�&?*C\�\'4j�Q\�y\�!=(\'�y\�h\0���\�\0SrF1\�9\�9#?�\0�\�4�z��\�\�n\n��N�q^\�\�\�E-�Jؖ1��\�px\"�K%k�𥱼�x\�89\�\�\�AJ�\�%IS��\�C\�h�F9�ι�X.Wޥ\�dah���5GY�T\�\�\�}rk\�K\�=\�Kܹ\�(D�P#\0\�\�ru\�x�\�n/\\��(#�+�nq\�q^\�!C櫻Փ���nx4\��\�M\�\�Z��#���ǎ��\Z\0P��i8\�ځ�\�4��E\0\'n(\�BqK�yⓌP�\�iパ\�0z�i\���\�@;��NF8\�\\\��)F\�\�9\�C��Њh\�v�=\�\�I8����c>�\0�nsK�(�\��EFN\�\���bv\�ߧ\0R`/�\�4�y�\0z��P\�\�1�Ƥ\0\�;Q��֕x9\�\0��\0	!p(h\��I��\0@q\�\�NXz\�`���\�\�p�,x�vO�u��d\��ғ�=�Ac4i\'�S��\�\�^=���4�\0\�3�i@<杓�1�\��\'�.�qӰ�=�#\�N\��=i�	Ry8\�C�z�\��s�\n��\0?Lr��H\�\��\0\n\"\�Gn\�e`cE7b/C�qR\�#=J�\�\�鹳�s�R2\�C\�._\n1�jX��y\�9I\�psVQ��95\ZF@S�EL��<�O?��4�Ȑ\��;��\�rY~_˚�E`0	\�<\Z��f�^��jh�4�O3��\0>\0\��\�¨j�qǱ��bH\�`㯭M�~�`�\�޵��%%Ib\���W���-�N6��)C����\�\�Vr\���l�oaE�;9mđ���B�\��\�\�֓z�s�㎹\�J%�W\0t��Y�\�/8�YH\'<v4\�x�N}{�AeӞ�4P�ۛ�s��+�����������\0#\�w�1Wb0Cq�\�%��\"��\�qڽðF�\�\�N	\�yͼ\��@U9\�cһ?\�mf�<���������;��<X��dnN2��<��\\²\�<\�\��\�z\�#�pFw��\�\����4��^���\�A�[�<pq^��Bv�Q^Q�G4Ԛ�=NZ�\�\�\�O��mlg��*s�\�\�Cqw\"ƊY�t�O\�t���\r�ZB9o�n�f\�A�\�\�\�j�3(��I8\�4j�&\"�g\�\�n�����\�rqX\�\�\�~ÃV��4�4a�N�3��c3|�\�ҧ!���8\�:\�,ާ}/��B���\�V�4=T\Z�\�(���k3�S[�d\�@7zW\�-7R�T\"\�#����E�b�;\���\08ִؙ\�A��D2\\N\�o�\\����\�y��_Z�,^p`\���,#Q[�\"X\�2�=)Z%A\�s\�D6\�2W���>yc�Je�\"��\�5h�d\�֪���d�/,*nP\�9\�Zƺi\����<\�۹#Q�W\� \�<\�ɶ�}p她�,2pj\��\�,\�$�H��,�\�o���U�\��\�&\�\�Yة�:�\�^�\�Ua�\n\�,ٞU^��k�D�\�#�C&H\�eI\'�\�&��;��\rk\\3�[95�������\�\0sT\r�ݑ��#\�oZ�@�ɧr�g��)$\�3\�L{X�A\�_O3q\��6Rlv0��o;�I\��U���H��v�o3v1֤т\0\�ҸX��\�v��\Z�m�&��WG�z�\�e��F{�@Ic\�(M4\�\�4�L����\��R\���\��Z\�/L�VF0H\Zwc����w0����\�\�&S\�\��ݒ+�\�!�$-��\�\�XԖ�M\�g\\XI<ʾk{\nЇO�:\�ܟz\��_���\�qI�\���8Jaz\�k&[(\���yܵa\�\�I\0�\�Uț���P\\0P:溄\�\�\�4�X���1ZVS����\�g!3{\�\'�}��P\�,���O�yr�$�ڤf�����\�\�ɢ�\�y��Zf�aRҥGVPr3R}\�Iɓ\�\�;-��\�Z\�*�*c-�\�]NժW\��a�j�\�\�欏?\�%��l���\�eQ�:�Z��엒�\��1\\����II=뾚v<��\�q{�\�\'�,х\��g�Ұ\��\0)K#~�<5hH,\�\Z�h6�\0F�+S\"�^$��p\�rsT\"\�ai�cM��Bg�\�Z\�p\�Ӡv-*\�!�\0LSD����\\\�2mqמE]�}>\�6D\��\n�[HW����[\�]��\�B\�\��%ݸlo\\�����2\"#$}\�\�r_��\�D��zn?�~�r�\�\�l\�`f�!�\�^i��Ȥ�B�\\\r�x\�u;\�2�UO�p99�V)\�omb��09&�\�T��U��\�Z�\�\�l�\�\�\�\�F鸂h\�\�;WQ�]@\�I\�X�x\���\\�\0�qTO�WW�W�U��$\�\�0��5YceaYY.\�x4�Z�\'\�\�9\�W���1�h@X�\"��\�\�U$}����b��Ԯ��`��`T�_4\�t\�h\�Yn\�#\"�\�\\]χn\�|\���PYᑂ#�\�<\Zk\�r�s\�4	a�\�6�0\�[2i�\�|\�\"\�r\�\�]\n\���rA��c�jCFi\�\0�ҕ�\�w~����I\�}+*-͎+\���D�\�1,3\\����\�\"��c]5\�\�\�\��`3�\"E�۩\�\'|k�\0�̃5\�cҹ�^0@\�׍\�$��6t�\�~SI�8-i�ܮ;Ol\�+H���+�֭\�\�\�9\�eR��|\�\�Pw�<j\�\�E\�\0\�ϱ\'�0\�h\�8�j\�\�V\�nZ\�{�.cE\�za\�\�\�1\����{\�f�*��\�\��q\�Z�p�۵\0f]X������1S��B8�X\�:\�\�`�\�c�Ͻy���Iv\�T�N�=M4&3W�I5�;@Z˚b\�%�O95CgT�y\�\�`_vrO�*�aa�\��8��\�\�:\�@d\�A;����1��\��\�c\�+�gU�\0@2د#���$}^�hGͶk�`~�~3�\�ѝ��z\nοڶ�\�$\\�s���el���7\�m\�\�/*�c\�皹�!�\�\�\�q\�{\�M%��%p\�\�ǟ\�ִ�{I5~�&\"���v���x�\�\�\��2v\�^��\�x�Nӟƽ\�\�\�5$oQҼ�]ӛN��1\�e�R:sڽ\\�vR���\�2�ۍU�V1&�\0\�4��H�\�֬\�Q\�\���f\n��\�G�юI\��8*=\�#�{�@7`��w�~��I\�F�2{\�\\i:\�\�܃].�cj\��_i\�\�]\�e�\�<��\�R6�$s�\�s�jEr�-�\�\�8 �Z�c.@Q�$��,\�\0��j�[m�mN\�ɫ��z/�tx4{��U/.I\�;\n˿�5\rL\\�R9\�kOz\�w9!py\�Y�\�sCq\�\�b9��V��Mݳ�5�\�\�+$}n\�\�\��K,  c\�$\�y�(�+4�f�P\0�ɵM8<\�w��\�:rN\�=x׃�\�:��.#�N:�?�\ryF�+\�j^o\�\��\���VI<�c�eP0�5�\�mu�Ӑr��q^���+�\�x�\�J��Vɕ��l⹕e�h69���C�\n�|ַ@K��\0)\�[�|\Z\�>&\�w��첿r\�y\�\\\�\Z��u]GN�/-,f\�\0��\�\�\�+֌�\ZiS���ȱ�p\�\�f;0lX\�\���꧿�x=�\rܞ�\0t\�s\�K���r6�\�\�1�E\�a�}	�V[��\�қr\�YI?^\�/j\�\�H�\�1Y�2\�*y�\�Cr*�8\�#I91��n	�\�J\�T9b0h{R\�\�sQ�dҢ\�a\�ߧj��\�\'�y$0\�\�Al�Ce���+֑I�\�3RJ2�\n�c���DXV;hf\�G\�)���{\�\�dn&��.\����f>Z��v�k9�\�\�5\�=*Ó��g�\�F�h\�\�܍\�\Zq\�E\�7>��\�Ru8�9�{�N\�ԛi@���\�S!�\0�Qc>�2\���%�\�;��nA\�Z\"\"�n�*\�j��:P�nI���v2�0�ΐ\�\�2�T\�j)\����!;p\r\�i\�\� \��D	\�8�2(�\��\�\���`\nNEB��41\�\�\0d��O�z\�܆\����\�һ\�^\�\�6�pcU\�\���\�&�i��x	\�W5䚶�6�\�)\�bNCd�b�zU\���S�)�W�\�#�MS���\�\�}G�ח����\�Z\�;�\�sGx4\�^+񝶻d�AC��=\�\�s�杞\09\�{�Ɯm���VUe\�-\�\����\0Jhl�M�9\�\�~��jS��7�0�AM#�\�x�\�#���M/8�hS\�\'�J=H��i3\�S��\�x\��LM\'==:Q�\�\�q�L�<{\�`����a��\�#\�\����$�\�E\�{u�\�m����.Zr~F�c\�R1\�\�\�VH�[�wQS��\�\�@lqSC�\'b�jz�\�)�\�\�\�\�zׄ\�g}\�\0�\�\���\���<W�_m7s܊\��\�#\�\��^l�\�\�y�\�\�O\�3�ǵzG�\�c\�\'=iW�y8\�L�#ր9\�ր��\����ix�\�N��`\'\�4df�?��\0P�NQL�\�֞028\�K\Zs\�8�\��ַ\�Y/m\�\�\0\�\��\�\0v\�\�\��F�t\�-��xGF\�^zV5�\�\�\�C��=n\�?�pC�\��]3El]��!\�\0\�n|Caxּ�ĺ\���\�#?\"��*��mhzX�DU&�՜��\��c\�{v��09\�Ns�H\�4�\�+\�G�\�Ʒ^���\�\�$\�H\��� \�\�R\�Rub���hrQ�ӹ<S}h���\�<�0\�\�\�h\��g�&N0G~h)!Wߎ)\�\�\�g�(\�F	\�\�&A8�\���\0S�h�g\�<\nq\�E4\�ހ3Ҙ��F{�@zҕ\�=O�0\���0��\���#<\�A\�Q\�~���z0Tc\�\�\0��ӀQ\�I�\�\�\�\��p\�\�@q�\�i g#$R\���\�P���P@\�8���\�<�\�K��8\�I��qNS�sI\�3\�&�}�(�0jL.	펵��Y6�s\�v\�\����\�&��c���cڤW19P�<\�x��1��S\r�3Na�\�\�\�B�(d\Z{1S�\�^���3��\�\�=\�_z��M̭\��4�v\��\�T���Z�Cc#$�K@Ǧ\�#�z�Xq+�u�qU�\�\'$\�\�H\� \�\Z	#�V%O���\n\�\0��1R@�Ǩ\'�朋ԗ�\�Ls�㊡XU+�$�\�^G�*\� \�\�PEFA(\0��H\����\�$�s�n\��Sč7pr\�F9�g�\�\�\�\�n\�N\���c$�\�Vžc+�����\�/���#�\�Dś�$�����(F �OS�P\�!e\�r>\�^\�\�\'1B\�\�>�\Z\�r\�N\�O\�[z�\�-��\"��\�s��\�P\�qCy|\�-��{�\�Mu�\���$�bXw�ʞr3PP\���i�\0\�\0s���Zh?6&�\n�{�i�1Џ�09\�~�})�\�\�X\�>���BͿ���jk�0~��\"g��rs��h\�L\�(7`�\�9��Պ�\��\�V�g\�$ar\�O4�p���\���Hr<��n�\�BUl\�n\�c�\��\"\�\"\�D�n\�d\�\0\�z��X$T�Am\�������>���V&��E~1���ks�\�8>�X0\�\�W�Lѣ#I\�!�Lഇ�V�]�\�\�\�#��y���c&\�&�)gPw׊\�\���q[�~^H\�x�=]��\�Һ��N9/|��,QXqL\�\�`\�\n�\��Ry�\�\�=\�\�_3\�cZV\����I���Ǝ\�R\�I�\�Nrp	�\�fuD�,lT�zk���,ޜ�s޶\�JX�s�.+\�/\'\\\�\�\�I\�ĥ��:\n�ރ�>�\�mM�vN�_\�G�\���\�~\�\0#\"��s.=9\�lٓ�\rB-�3�h�NK��\�c\�\�l��\�j�6y\�O,\�ޤe$bd \�5��\�zT�\02>�\�,��\�ʱVH��\�qJQPq�����P���lN\��6.+z\�{\�˜m\�\\ŋ��m \�#�k��?��jHg\Z?w!9n�*s) �\�S��\�Z8\�H���\�HH �)�P�qQ<�\ns�e��Aɪ\�k.p�T7_ht!K~+>\�\rH3\�W8[8 nd�99\�P�\�]\��~�4sg�42�\�)�\�\0iK\�\�\�\�H��Z,�&\��ը\�*Ȫ��2�󊳼*�\�R\"n\��\�)+n\"\�g\�Zo�E$@�Q4\�6��f嬯4��ʃ�\�r0+3NlFX\�&�o\�\�j\�u;�\"�5n8\���\0*8�`5�u�,0��5\�\\\�y͗\�9\�\�]:m�\n�U\'�1=�W�e�\�c��}�1�	ȭh��Q��\�PV0��;[4�����V��u�����fP��q\�Y��\Zh�nU�b�Bg�,\rl�_Z�k\�\�glg8�Yp\�[]�\��G\�{�U�k�ϑ\�J\��(	S#�͒\0\'ֵ�x\�+D�b\�\�\�\�2[�\�M\���=�\\�8��\�2ax��,O�E\��0sO\�lUAX�\�_Z�y\�/8�Lf\�waTM\�a<�ARj\�d��TDs�$�\�b�Ŀ6\rP��C�0zw�Z(\�\�j㪁��>�\�#8�\�Y�q�\�:b��ƹ\�29�gd\�`X�\�\�\��rM0)#�7��f���\�\�g�\�$\�@��lw��q�7}i��1�~��瘋���\�\�t�\�sdRV��\�xʠۀ1\�ހ,��\�<\�(�uD\'`�D*�$�N�l��@�\��\�\��j�Y����{t\�Vѐ�֩M\Z\0v\�<P\\�#�\�s[Ѩ\�2MUR�T�/cW�^	\"�\n\�)\n���D<�9uɫ�<Q�\�ب�\�\0\�j��CM�\�\�P(=r+���\�D����%���܀]s�t�\�RꚂ\"���>�\�Sޓ\��^\�]\�ֆ\���qT��Q\"�8\�\�}j��Gr\�Ib\� ��k��\�b�tq���߬!NFwt��+o\�\�\�Y:�%�VQ���8��LݣtKz�shI,��dy#�v�2�Ֆ8pk���ɸa�\�mk\���\Z\�FsFٙ�\0t\�Ue@O�էc\�=ꜬpB\�Rg)\�\�%��ڔʦ\�\�w0\�Zw\�\�i�`�lj6M�/Z\�%�\�4ء�r:\�v��\Zl׻�ʪ�`����[8Y\�$ \��I�\�XZ��A���\"���� �\0+q�J\�`�q\�Ҥ������\n�\�U\�m��\�⍙�\0\�{\�#\�|\rk�Ü�5����]��[\�Bz�\��\�2�\�\�\�\�\�\0f �\�Oz\�3o5��d�`%��\�\�^k\�\�BJR�\��>�	V.�\�N�@%�\�FMS*%�r��\�(�؀�\�\�\�J\�\�|A�\�\�~�\�:/\�\�ƹ\�I\�+����ɤ�\�)P\�\�@1\\\'�|/5�ܷ\�t�\�\rO�kr^\\=ĸq�\�]E\�ʌf7qs�?3�����\�y\��%���\�c\�\r\��*o\�\�S��v�+ɍ\�W��k�վ\�ڔ�Ά7�\�01ڋK䅝\�\��\�Ѡ�\�Wgm��!�7F\�&d\�n�H�ݲ\�\\s\�\�TLs\�C,3�bB0�\�\�z8J� i:�]ݎ�c�ڈ\'�ϭr6�\\\�,i�z淗E�gU-�\�\�)]�����|�]��Ҙ՘�\�y��4;dW򔲎;�[b�\��r\�	l�8\�S\"/\0u��\��7��\�Z\"Y1Fq\�6���H<\�L\�N͐*�v�z\�l�\�\�vN+{\\��[o FI d¹\�ne��\'\Zm\�\�\�9��8���\�\�n�5\��\�)\�P9�?hc�9\�6X�\�\�\�Sm�~C����\�Hc@F}qX77�:\"�9x&�%��\�qX+q�-\"g۸�����kSU�\�Z&�\'<t\��&��o�>�k#s\�\�L�\�\�\�\�G�\�8�	�w\r[�Ǽ6�j��郂J�\�EE�QN\0�\�i���\0j\�a�$Vw.\�$O�6F:\�jBS��@�\�s��A\�=hlBf�8\�\�<��s֡��B�\0�5E>C�{T\0\�ⲓ4D\��\�\�M<�/\��`\�\"\�\nG ���V�\�g��f�I\�C\Z\"5�Lt�N;zS_Z\�F����T\�iޟ�͌A�S�\�8\�4\�H\�4��\�p9����\�LW\n�\rGޞ��	��O^;�O\��h���Q�\�\�o>��!\�\n�S_�:�әpy��N�,���c�{S�1�ވ�(��6\�~�0����3bw�ݏqN\�N(*OQ�\0צ�␞\\R�0sH\�1ҡ�\�Z^�&�|�)\�g\����2qު�\��D��Ίrpi�f��uFMO\�\�\�\�P�\n�x\�\Z\�Ѯ\��_��l�?�\nA\�;�ϵc�>վ\�Η)ɉ7G��\r\\�\��\�n>\�!\\3;{W�\n\rJQ\�\�=���\�\�I5$s�\�`�H�ᑊ���az�jY\�k����Y�j`U\�z�dx\�j\�o���)9��EZ h\�sHO�<ӱ��Rd)\��i�qJf�,h\�E\�bl�\ZbqQ��\�\�\�\�c4\�.\�4��.9\�JM\00�Iך~;\�X�95,g\�8�\��o�y�B�s\\0^�\�5\��-�<�FL�n\�a\\x\��\�~z�sb#\�\�_܈cگ�\�\0Obk_F{��M���:\\桤\\j��#2l;��\�k�\�V\�\�L3��y�Ex�L��\�C��\��\�ϗ_\�I^潿\�\Z�[@\�,�Ҽ:w\�#sֽZ�g��M9\�)\� �ϥ3\�ҕ�i;u��\�l@i1��\\\nCҚ$qi8�/��\�GC�u��f�b\�g\"�rq\�=(��s�\�JS\�I�h�1�SFYO\�M$RhbsS#H�)!S\��]\��h�\\���\�z\�3\�=	�$\�4��Ҁ��\�⏗\��898<S��4\�)\�(\�ޓ�)�\�J\0zS�8\�Gi\�\�\0\�3�F\��t\�����\0�8\�\'<��\�\�\�~t�p~���?\Z9�\�J$w\�4g\�Oj�\�\��4\0$u\�\�JW\�\Z\09�Rc�}�O �#�F{�\��\0g&��F2Gzq\�\Zp8\�8\0s\�I\�ҌT��`�q\�\�);�\��\�9\�@/\r�\�;�֝��F1H��\�ڀ\�\�4\�;x���SF3@\0<{zS�84\�\'�L\����\Zwr1\�N(T\'��J��r��S�\0\�Rbge\�,\��\'\'h��\�Y�}�#���\�\�\�n29�\�}k_Ő\�\�00:�\n˛R��U\�\�\0\�c�\�8\�����p\��RQ\�V���nlt\��O`��\�\�4�8\�+��<\�;��\�\�\�TP��\�\���#\�ȥR\0Q��w�\�>~O^;�I�q\�p})ʧ#�1\�ӥG\��\�׭M6?Qҕ�e�R\� �Nx�e~C��C=j�KM�6�1�Бۚ�8l�\��\���%�s�\���j��l˹\�\0\���JJ�^���\�؀�)\��p*�\r��N[�\�p\�G<\�\Z���Iy\�\�\�d�*�`��Ej�f0�Ň㊥q&\�x\'#9Z�=�3�~\�\�\n\�eI�ɦ4�\ZYKJFs�\�檮\'��\�˅e��^s\��P�\�\�\�\�Y\Z�;K�a�\��c� -�28\�)�?t�霊�� �v�\�q\�\�X\\Ȏ��\��&@g����a�z�=�(y��\�\�\�\�\ZB|\�lg\�\�ӓޣ\�7~G�\�\�w�\0\\�EL\0@lc�����û2:�\�\�\�1S�{\��Ձ3�\�\�:�\�@�\�C��F@\�\\u�W��%�ư�r}O�\�^N��\�H\�\�\�H�\�S�\��\0l����\�X~2W2��O\�� qL\n����\�%�.H\�zx��\"�s\�e�CD�0�=�����1I\�#旿�j\�4\��L�r��\�X��\�9\�\�ը-\�% ��}\�\�[R��r2k�=7���\�\�E���O�.�Q�~��r/-��d\� w\�XOs���Q_\�\�7\�\�j\����\�\��H\�\�\�J\�vtĥ},pDǰɗ\�\�\�Pk�\�bVF\'��0\�-�ֺ �>h�8\�5\�\�p}*�\�m\�ҕSspr�V\�\r0%��I�l��6\�\�\�7�P	a��ZL�Hl\�R)]� *\�2+oa�\�*ظF)�\�0�ܚc)\��;\�h��S\�X�\�=\Z�\�W CP�yrs��\�\�!�͈\n]�\�08�-<Q\�BW=3�i4Kg�\�Ƞ�88��\�1\�7�\�\�\�\\H��z�aɎc���A\r��W-ۮj��!\���\��U�#�N�]ք\�A`]3�\�<S)3�h��\�Ŝ��\�\�5SO\�5�\rş��\�\�\\�Cm�XFS�X����i\'�$ʧ5�s\�E�i=\�aX�xkNYi�\�#Y���Y\�V�[�Oҭ\�+�9ZeΑ\n�\�¨\�6\�u3�^�!u=8ǭ4+�7��\�S\r��\�{�\�U;\�~dP\�jŽ:�����#\�&\\�\�5�N�2U[\�l&1Ua�\r�կg9�\�X\�iOY\�>��\�\�M	��\�\�\�P}�A��\�(\�q\�VcP\�\�N7�{s\�Y����L`ʽs\�?�sֺ6�x[d\��\�\�s]Ŏ��Z\�*\�x���q.2,O\�7NV2K��+<o\r󘠂\��\�U��q6���ʮ�㎵nx�\�!A��(��T\�T�\�m\�ڲ�;d�\�െi�\�g�Ma\\\�wkx\�؟/�`wg\�Z\\ۄ�\\�Uj\�F\�.w-ŧ:.�\�jц1ܱj̽�li�_#�Ƣ[ׅ]\�3�\�=�C�\�\�+���\�@<V\�n\0�\�y�֭��F8��\�Jє�\�b��E�����MN$9\�\�L:��\"8\�Ԏp\�k,�h\�;�xjsJ\0S��EB�\�~��+��l�\�\�\n���Ļ\��5ܮ�I$��*�\\\��\�V��)\�R��,��\�:sU�n�\�7��\�\�֥VF6+D`b�7��؞�j\�N�y\�\'��z[��r\�V[�ʂ�\��Ð�TqUHbp\�\�֠Wie\�W60olP]��dl\�Ը*s��\��8\�N\�M�\�\�\�\'�D7�Q\�\�=\r0�V\�\�\�)\�F{��\�\� �\�\����drC�`�]�>L\�953p\�qM1���\n�\��8�\�\n�=ƆP��\�Ar�=3ۜ\�M�`��y\�[c{g\0z҇�&S+�\�c�z_E\\t��\��\�Ub�Y\�\nW#��\��\�\�^hbB�:d\�5�RO�@i\�2O$\�t����m��׊\Z�U�1R��8�?\�\"\�,�s\�Z[�1\"�z�-H�!PT\�V��m��+{��hRu�ݓɩ��ʍ�p0)5t8�3�\��5g\��Q\�ޟ�\�#I.��r0^[\\�\�A�溋�\�H\�06d=�Ⱌ,���u/.fo\�\���`~D�3�2\"������\�Y<�\�c=9�h�*��ǚ\�Q\�沮\�z]�Țh��EI$�\�W�ך\�4\�[\�i#�pz\�-��w.X\0z�\�ӔY��\�VW��\�\�\�6瓀8�][Q��\\�`�ɮ�[�K�\'pa��\�:��\�M&^r5�y3���C^A\�9�����\�\�q\\\���2�Z�ď�=k���\�$\�iH<�\�8\�t���ݬQH\�G�7\Zչ\\/\n0[ָK5\�?�.H\�&����(	8\�P\������#UOA܏�2\�\�\�oϚ�ur�r�q\�\n\�\'�==i	��K\Z\'��X-\Z[	�\n��c�e��D6�21�@0H�}�U=\�^�(\�S�e\�\�(\�O��u:͑\�<� \�{ד\�\��\�p$)G\�G���=ҹg�u%yHTchD\�5/\Z8%m6\��\0W5\�\�24�\�]\�9ja>�\�^յ:0��G=\\EJ�\�#_N\�%�p�\�g�^��\�0\�\����\�ׄ\�/�[6\Z�Ɵ.bn��E\\:��\�ֆ.T�z\��\���i\�d\n[�>��5K�(\�j\�\��\��%�\��\�<�j��X5\�ѫ8\�]Zn�;3�8ԫ̂\�#*�pY�\�L\��b7\n��5\�\�\Z`�ģ�\�k.\�\�n\�\�\�-\�=��\�4�?gp�H%�@\�\�GL�\�md�W\n�ĮB\�\�f��$N�J�\'MY۵q\�O!B�.U�9\�@\��\�R�B\�Х=i��ֈ�X^\��50#����}i\��F}+BY9l\0�\�5�.&g\�</�OG\'8\�U���V\�3�)\�˼S\�LR\�X\r\�\��C2g�@�i\\�W�uxH�q��\�\��fB@\� z\�Qu+\r\�<0\�W&K0$�[\�G=A�s�\�,\�a\�8��r?:�\�\�\��is+IrWi\'�E(ھ��\�Xȧ\�\"\��a��z�\�H��$\n���m�0�\�\�\�\�֨�\�\�+�\�S\�9����c�\�H\�z\ZfrÞ��\�w\��d\'\�vo��\�9�=�2P\�7\���1�\�<\�v8�e��\0dU\\犕��B��q\�5���%��Q�*G\�b*�x\�ǎ3\�Qp�xTLā\�O9+�\�T�R\"bs��n�\�!\����\�<\�l�\�\�S���!\�Oҡ�\\\�h\0~4\�zRi�c@\��� \�K�\�J�h\��46L=\��G�B8aR�\�kTf��\nQ�Ґ�:S�5B\"q\�4\�S��5\���R8\� \�9���\�9=hC\'P8�\�@�q��\"\�b�4��h\�Sޛ�=�L\'+�\'l=\n��$qPƑ	\�#�k�Դ\�!\�l\�WI\�=�\�\�\\\�\� u\�+\��Kl\�\�\r���ێ\�Ea\'�,\��\�۝6\�Om!G\0��y�>\�\�[ˇ�f\�1\�5K��\�N\�\�\�	+�wk\\wLS�֚0;*N9� i\0�\�u\�u���:Ӹ\nx5�\�J\��\��\�\�$u\0Զ4���z�\Z�é50\��ڤ�\0��	\�\�&�1��x<\�?ҩ/B)0J7v\�J=z\��\�ߚk�\�֥<`\�o\�>���\Zz&����P\0v��\�^�����hl\�Ja~C��\��F�}�]�ͱ\�\�FC��uѵ��ً�i\��ߑ���\�z)\�e��������%�aWmW˴2I�P3D�K\�V��W\�Zm���\�6\��\0��>0�ݒl�\�T�8\�M#\��[|nu\'\�rFH��5�>�%\�\�iݲIf5[�W�J\nK��U�{I\�]\���\�v\�g�N�\�և8\�֥H�]\�w���\�j�$`PL\��z�R9<\Zv:rs�\0Lsӽ\"�)p\�3\�H޹�8\\`qFJ3\�;�����\�%\0!\'\�R��zb��\�1@\�(��\r0�i�i���q\�\0\'zL|\�\�L\�\���wz�\"���R�\�0�\�4�l�Ên\�8=y\�\���q@�9\�\�\�i\��>��v\�\�=\�0[\�ʓ���\�!\��r\�?�H\�\�\�u\�D<c�)G=iX0<\�g�@	��})�s��\�#�\�y���\�j,�3\�ObH\�#�>�Ü���Q�\�s֞H�c�\�O�+���\0ѻ\0\��\0\�M8�\�\�Hs�#h�Rm&��\�\��\�a\�f̂S�=i�s�rj\�;\0\�}M;c~\�#��\0�#8�8�)\�p��\�\�lTx\�`��\�H�]\�(^s�T�o�E8{�\�+�\�i\\�S\0\0A\�\'\0�t�G�\�\�=i� /�\�\���ls�Q��&孭q#k\'\�98�_�\�s���\�+z�D�̹\�P\�W#n\�QG�^\�I\\p0z\�\�f\�\�c�\�\�#\�pF7�Z\�!r}GWL^���\�q�nis��?.8�9\�Q��\��\�}j\�&rr\�z�B�:z\�I\�\�\�*��68Ϧ1N¹\�sd�Zr�zg�vn�b�F�2G��9�\�4\�\�x�����K�\�4�\�z\�\�k�\�\�lq��s�[�\�W3�H�U�_i\�}�\�-E��a�>\�9�\�\�\�s\�\�Y�bON�nND;]I\�dz\�#���� �\�a�­2lQ�y�C�8\'�k�V}�]F\�\0c٪�����W�G�*\�#$U\\OU�l\�\�\�A\�`��\\�1�k�\�\�v\�s\��\�rd�O,��e\�S?LT�ܣ\'�TE�F}\���\n�tg>�\�T\�\�s\�\��\�\�fwO\�\�ga�\�\�nӚ�n��c�m��E\'pA\�NiC�a\�Hǜ��FF�n R\"\�R|�!z�=	\�s�r<u=3U6�nn�>_p�\�I\�N\�\�\�?P+\�<!��!NMyDQ���\n0N}+��\�\�\�\�:n\�\�=����g\�ж������G�5QgH�|\�qL\�vPG@zW��M�e��\�4�\����uU�vS�j���(Ky��s\�i#Q!�#!>Q\�\\\�q+�܅�t�j\�IQ�\�&�\rrC\Z���x9�\�F\��\�\�\�:���\�\�\�E4�f�5\�\\\���l\�\'��w�\\ͷs���-X\�jzex�zyִ�\�_\�&�MF\�U8�0:�^.�ۏ<��!��\r�O�\�X\�R=3S��R��c�j��(@Kg�c�k\�\�F���\�0�\�v����k\�\�td-Է\\\Z\�cZ�\�ְ�e%e\��sYQ\����f��T�$\�5\�[Y]\�v&!m\� �\�\�wpMr\�\�G\�\�5��6a\��\�\�M}�Z\�99l��\r>\�\��Ć&�m\�P\�N�}6\�\�f\��<��Y�:N�i0[\�\�\0�٫\r��\�oE;�Ð+�\���s�����:\Z��\�B\�\�ʚ&ۏȃ],�Z\�\�ҢFF\�\�dg�>a���9�W�;O\\��tӕ9=�W�\�\�\Z\�3��\�0A<��\��wK\�5;���Ҳ)9��\�s\ZW�|ځ�\�8�\�\�\\\�4�?<wO#dw�A�A��>�8\'4�\�q@\�w\�q�bl�\�*�p�.I�z\�uۑ!@��\�餤�w+ڹ]SQ����u\�q�\�\�\�\�_X\�\"�-,{�.T�Wii�ZN��_��=\�\�\��\�݁�z�M\�-4z�d`\�w\����Q�\�\�d=\�y�L�<W�M\�˛0�F\���=�����S�J\�|\�8\'=�\n|��ѭj�V\�\�T9�\�E�\r�X��]���\�M��������\�g\�޵\�\�G��`�\n�\�\�ޕ�\�t�W�bՈ\��\�tiz|\���\�p��Y���n�Nw���\�]u-�\�\�J\�0\0\0rE	\r2\��oDl�\0����6�ko\�T�1\�c�=\��{K��\�7c�\�\�OG\�b\\\�s�<{��Q\�_x\Z\�Sg���S\�>�\\W#\�_C�\n����=�W�DR\�\0-\�0Nk._h�\�,��\�\�L�p\��oi�r|�p3���y\�x\�f26~P+.\��\�\�7lY�n�\�s\�*�\�\�{\�X\�\�C���Q}ϭ�\�e��L�#��]\�\�[8�Z/m\�-b(\�[�o�\��\r\�\�k\n\�h�m�L��\�uǵvV^ �L�h�<1\�(�^\��?�c��\�Vy�.X�}�;V�\�}R\�\�Y���\���F\�\�lX�\�\�y�\�W\�\'l\�~,[\�\�/#���s�4te\�׬ʻ\�\n\���N*��_2\"�9\�YW�-bgX-ٰ\�\�W7/�\�\\yQ/�� {\�I�˷\Z]\�\�\�c�\�G\�h�)l\�F%,{m=\�]~�\�3d\�w>��=>ne\�\�A;i\�I�k6�\0W	,��\0\�\0+�\�\����\r-��<u\'��Ym �cK�\'<r;V��\�\�\�*�}K\nʥnC\�1�nC���:T\�{\Z�\�\�a�\�|\�Y�\�N\�H�\�.�g\�-���+�ta�$�\�&X�\�\�Ӌ�D�L���Kf7ًmg\��\�9�\�`u��ڌ���S\�es�~��\��+\�\� �CM\n\�£��q\'�H\�\05�\�qCE\\�\�\�\��\'��x�!E ��x�\�\�A8o9��G>��DfBx�\�io\�M��+�9f8\\V=\����V#�q�ؚ\�\�H\0��b1�����ĳ&\�k���(\�֯\�,�]�ec�f\\�ԬѮU�1\�LF�$e��\�֙t\�2�\�\�\n̷��$ov7�$�V��\�Y3\�@fӊx�\0qR\�[\�	����_\�S������o=�s�\�\Z\�̑Ɗv\�\�3�;s@\�H��ۘ{\�\�\\7�H$M�NI=�P\�n��^Mܑ�\�֟:Km���zI�x�{N݅��y��\�	3��t��Mjaİ��\'��\�鮎w�pW���	�D��!�\�*\'H�%Y3�ҳSP»\�{T�\�0Dq\�/�(�&Z[X#p���\�\�\�\\\�\r߈\�,\�������5�c�K�M���s���Α\�\�w�UO\'����K{w��s\��ky�N�\�\�h�\�s�Ц�R��\�픕�� �+v\�Y.˅힦�Hg�o�\";W*8\�t\�7\�\��\02��N#S�\�\�z\",#l�¸Mz)\�.N$��95\�ES��Q�\�H���\�;I_cIE!�\\\�R	4\�H��\�wc�\�Q$ѱ+���\�*\�5\�ĥ���1��u�\�\�\�P�\��L�$ĉh\���k\";i�;۷5,r\�ly�8\��n՝�\�K˟^�\�,��[[fQ�\� �5\��\�V\�iAvx�T��\�hh�v��\�,.\�=TW �ո*H5\��)K\�:�ch�k]�\�\�R�4\'�����\0Rޠ���ԑZ!�\�N1�S3O+�jhIf\��Lx�N1L�\�\�(~�\�Rm��;\�@s�Z�ch\�p0yI	�`\rv:;\�2c\�\�ɤ,\�\0\�k)DX��d�\�\"MK\�\�\�#�n�s��\�M\�-�R8�QѱS��\�i\��?_z\�Ym�\�(�=\�P\�]H�d\�c�E����C�޵�\�\�;� X�nqVdc\�5-��qu\��\�s�n\�[�n�۰0\0\�x\�V}\'\�#��e����}���f�,3I0e��j2\�b:VP\�m\��U\�%xȈO�I���8Bр\�\Z͊�s>݇$�dQi\r\�\"�~\� ��ֶUT��V�\n��0h�y\\�\�(&2°%��YCD�\�;\��<cM|\�r\�\�=�\�i���!�p856\�\�\�\�f\�Hk�\��=+�B#�O8A\�\�&�X���k�TM#�g,H#�\�+HHƢ3�!��\�=*4uߖ1\���Wɭy�KNc\�HȪ\��=GJqa��g�Ww\���\\\�HH\�\�*V9�j�\�\0��hL6\�z�L\�9\�LԪKM!h�$Drj.�\�pq��x\�Ce\"7 \�\n@��\Z�\�\�\�B~��a&k|�\�f��*\�ԙ\�Ԕ)�\�ssR2\��x�\���\na�~5!\�L\0\�����4\nS���E&���Cv\�p;R��\0\n\�(��\�G�4\�\n �-\�@&�8\�\�c��\"��@�FkDH�E\"�\��nx�lH\\r=i�0\�sǨ�\�b���R2>v\�4 =\�\�\�B�@`\0w4θ�\����JA�(\�z\nd��N7\�\�\��j\'\�QQ!�[x�\�0\�0J�}I��\�����O��\�w�z\�.D \��>��\�\�\�&i\��z\��4#O�����x&���>�\�Hc�L`\��\�H8ȧt\�j\�<�ʓ������\'�\����\���jVU\�C({\�4\�a\�ўx\ZU��\�\�����c�\�\�Ҍ`\�R$vϰ�q�\�ғ\'��)\�c4�N{\�N~)\��`v\�\�\�\�@�Ա���\�i�(\��\�a3a�#8�o�\�&q큚\�q���3hNP\�-�����{��c\�\'������deKg\��ǧ*�\�\�N�\�o\�\\�g=\�9���\�\�G&���H�d�Ҟ����.\0\�&@?Jv\0\�)6�zu\�@\��J{\����\�4-&�E3�\0�Rv\0ҌЀ\\\ZS\�8\�ќ�\'S\�\�\�L�\�FM+m\�\'94\0\�\�J0\�\�\�&��Ƞ8㏩�\�\�3\�jL\�\�\�Fx\��)��s�S;�)F\�\�=Fs\�P�\0g��Rawj�Fv⎄}���=�>\��g����a\�PRC�F21����\01J[<(\�H��^\�恑�����N@@�5_�\�C��۞��\�϶(\�Aǵ {94�/�\�\0U\�&��\0J\�\�Ҕ\�\�\'=\�Ɠ\�s���N8��\�&0\�\���\�օ���Q��8@1\�$�\"l��`\�p$\�SH�T\�\�p1�\�41�r9� g$\�۷�\�@ \�R��x\�l\0˱pUrz��P�b\0u��d�9\0\�)��pF=񏠩Pp\�p\�>�S\�y8��5Wa�4\r2G�p\�[2`\nD�\�N\���:��\0\�`\��\0�S�\�ٸ��`��j�3�W�[�zR`{��Ėр�!q�\�]����$�)\�r�D1Gm�~��\�j�1�c�J\�i\\JG�볟�\�s؎\�\�RW=���En�|��W1��ӿ<�\0�k����`^��\� \�:\�p\�l�ƞ���\0�5��P<j\�#9\�W>\�@���{\�ֳ\0\�<�z\n�\�0{N\�M<�~I㚈t�\'\�\0\�cnq\�\�;U��޸<�1�{\�3\�\0���\n\n\��5#ax\�y���Ԝ�B�0\��ڗw�|�\0�H�1�x$�\�>�\�y|Å8�9\�{sT�1���0H���$`敆<\�N\�L\�L��\�:�x1�\��wS[(\�\�np=����h]1�a�88\�]�R��\��\�5I�\��N1%��\�\�\�5\�c��w�(�OAYz\�2���O^x穡�\�G\�=7c�Ji\'�ݹ\�\�2�8�\��)\�:\�w�~UE��]�e\0dr?�X�d�#�\�`o\�\�G�54m��q�WB\"\�\��c\�ҝ���?Z�Q+;7\������7��\�\�O\�K�\�ǜ�\�>�Zw\�\�p=y\�SW\�\0\�5uI3�p�Nh\�B-\�%�<<�]��]�\�\�aJ\�@���>\r��O#�\\\����$3�\�U�|�b���aUh}\�\�F*e3!\�=zӿ�\���]U�\�\�L��\�#��\�c�f\�\�$p��Y�����\rU\�bn\��J���\�A\�-\��!k��C�`ONk�\�\�#\��\���=.��\�\�\�$o \\\��\�t�\�&L�s\\\�ҩ�\�\�sT��b���X\�ݞ���nt(�ǔ@B\�I{W�6{�?�y�\\\0۲c�O{��Ԉ����[�W\�\��=��,�-�@ne<�\�*��.\�N�;,O��N\�\�\�?�j�%ڼr�\��\��V%ޭy�:�˃\�\0��\'b/�\�f\�\�\�e�Kl3\�۫\�ƚLn\�	\�Fxմ_i�\r\�{��sWg\�BI�d1\�9\��ib��a��=�\�#J�I\�\�\�f��7D����Nk\��2\�I`U��\�\�4\�\�D\�\�\���\��-��7�\Z\�o&\�\� �:qW,�{Iܖb���t\�\�7��[���\�\�qT\�l�jUD��6\�|�\�wW� �0ģ<\��\�\�ڭԄ3\���d��\0֯Y\�\����\�n��;X�5\���\r\�[C\�1\�\0\�^��j�>ϴ�n�\��<�2Ȉ�_:��v��t<�\0��\�f�+\��\Z�&i�:\�br=�U��;\�n�;k\�uE���@	\'؎}y��\�e��F+3T��\�+m凭f�0l�+�\�\�s\�d1i\�0+)\'�f*I@8\�\�\�\�\�u\"${ܷ\0�Ү[�cR��|\�\�.rO�t�Ŝ\�$\�rE,\�x\0WEo��X�ۇV<p9Eu\��\�e\�B�3��?\n�u\�>���H�\��\0:f�4�|Ig�\�HԔ�\�?v���Ҹ��R��\�\�#\'o�\0JЃ�����<\�6� l1�`�\�\\�\��\�0+\�����j�\�\�\���\�\�͡ŧ�����\�\�\�QK�X� �����\�=\���,��sɨ�\�\�\�\�\'{\�z���)<Dp�D�(\�1�\Z\�\�ƫ��\�N\�s�\�6��Ź�qT�\�t\�ٷ_ڇ;���\�1\\<\Z\�\�\0U�$\n]C\�ݲ���=�=\�vvZ��w�MuA�\r\�\�\�Ic\�i\�t����FYSq$W����!��px9\�ҏ_��\�$�\�\\P#\�%��\�1\�\�\�\�ߡ�Ŵ�\�٬�@0\�pi\�+\�\��V�.�9��\�H�7��� e�8\�{Rlm��a�\�u�\�<+��\�\� 㨮\'Q�N��h\�k1l��O�=*���w&�\�nm\�����\�:\�+\�@���#�84\�!�\�/�I��>\�\� 1l��OJ�.�q�8Y\��m�J\�\�=\"\�\�N�?7$\�\�W�<\�\�\��j\�\�\�6�7(\Z0��\�S��ԭܫ�R��\�A?�l\�jV0��ϻ�N�tϫ[On\�\�\�\Z6:\�{PZ<�o.`\�u\�z���\�Ś�k�?/@��-��s�lq���j:Sh�\�\�I�2\�~)?z^9�r#\�\�\�w��p�z�b��\�4I�\��?ZۇD��Qs��G1��\�pjlR���V\\�\�7n8)#Zж�\�/^TG��x�5h\�V������\��o\�	YLkÁ�Ұ��I�\�l\� �1\�JƼ�hr\�+����\�Px\��fm򷖿us]}��,\�\0L�sc\�\�h����}�x��z�:\'��X�x�Q����\�.1^����L�aq����\�sy�\�$rYi\�/\�f\�ڔ\�\���<��\�u��\�\�\������\�\\v\�8��j֗3�r2s�F*ZE\\ź�]\���Ȁ#c�$c֥�ք����7V\�χ�/�4\�X/!��\\Σ�\�z~�\�\�sHLܷ���\�\�.Fpj\�~\�\�\�R�rEp�\�śc0e1^\�ִ\"�\�S\�dUz��I\�t�\�\�B�#��Vb\� �P˔rA\�\\F�y`<As�\\\�5α<��\'Lt���\�OWm���y�kn��n�f%��\��/S\�\�G�\�\�)\�T\Z\�\�\�v��>vG$�����\�\�u\�q�C\�^@u�ؗ;\��8\'�\�V]V\�\�\�r}M-\�{t\�m\�\�\�c�v�7�����Yw��k\�\�T���\���h5,\�\�:tS\�M9�[���1��9\�XP�.\�d\�Ojf�w,��\�\��R�\0g\�\r�\�,\�\���!�\�n\�	!g\�s�\�n[=I\"b\��H=j���\'<�㨦�\�\�2�b��\�\"v�=0+enŊ �A\���\�a�GOJ�\�R|\�A\'��a\\\�\�ʨ\0eF:V\�WvӠ\�r\�\�5\�ç)��B�q�\�kr٬\�K�\���\�r��tb+f��\����]R+\0�A\�zW)wq�]α\�6@$�p�/\\\�\�\�Dyc9\�\�J\�\�3n�Cwp��)\�2J\�\�<\�j[\�.\��AIY\�9\�N=�i���<\��Q��Q`\�:\�aq3/\�pÎ\���f?5�b�}���\�a��E\�5��\�W�]\�W\�w�\�>dU��;\n+\��\\�95h�:�\���LD�\Z,+�bHPN@\�9��\�뷀\0�&\�qۊ,��\�H�ʟ�*��t���z\���g�\�\r��w �\�\�\�\Z\�\�E�\�ß°n\���\�\�\n\0T�D\��H���&;v���\�h\�o \��  \�P��CV;����)�1\�8\�Vv(�Zi;�\�)\�L�\r\�]C�zP\09\�R*\�\�q\�T�&�\�PD\"�wa\�ӭ�+\�L�56�-���s��m=�%Wr6q�\��D��ҭ\�b6\�A�\�7��\�;���\�\�mrcژ\�F�\�ʲv�ↆ���OVyٺ�Oh2�\0u\�Z\�{��,\�W\�*�j�I\�\'�f\�i�����O�\�[&S�6\0#�\��\�3_v�5�⫕�8�\�0��\�HR<\�\�G\�\�\�1\�OcQ&�s9\�:b�l_q$��[�Tu\�]1 ��{�;�p3\�Zч|㠩L��W�W��V���\�H�4WQ˾)��rkB�7��ڋJ،���y�\�\�/\n\�M�؞\���8�cI~�\�v�m��z篘$���\�Z\�nd\�.H\�Z\���i]\�I�\�g�\�\�H6\�D�\�S���fW\r#d�We\"6=�♒F3։�\�.e`fڣޣwR:sH\�?)��X\�\�E��X��\\c5Yե�`Xf\�\�\�\�\'�rE(\�`�=*�M�w#�W�JǊ�\�\��~���[�\�Ps��S�׊��x�$͒\�\'�*q\�\Z��9\�<����Q�\�)Q�i�\\~c��9��\�\�4\�\��sL�\r�?�\�O�5p\r8֘�\�ƌsւ�\�Bc�>S�\�\�q\�jh���\�\�\����\�<�*\�$Lc9��)\�n���\�y\�1��\��84��\Z\���3�E\Zc=:R�\�Z\r\���Q\�x4\�U�K��b�y��\�\r�A\�H��\\\�sҤ9\�j<\�\�E�2O\�I��fm\�Ww�Z�x\��(ʧ�\�\�A\�e�!$\�\�8\�D�5*�3���Q�Ϡ��4cn)�dgִD���\��:����ʒ8�{�\"�+\�)\'�I���`/}�N*<�/S҄6;����\�\0L\'<Ӷ�`U^�P\�;sL8�4`\�\0[$g�D\�\0��\�G��\�H� ;�\�i9\�Ⓝ\�O\\\�\�f\��q��\��\��S�i1�\�ɤf�v;f�y\�ɠ�94\�~����SO\\�\�-E\�g�j�<AR/u\�BN\����~TGGHןS�\0\�\�߿cM\�M(d\��v$\�19\�G_�(4�����cӚ\0C\�<S�gӨ�nO�Ll�oJ\0^\�g� �Լ��\�M\�;P\�:�zs�\�ϭ4�@\�\r;�~4\�\�v\�:\�{x\\�U#��=y��T\�\�#���\0\ny\�\�R�\\q\��\�K�H\�rq�fOr	\�)\�``�\r2��i\�ӊ���\�S�$q\�\�i�9%��\�\�4mf#\0{\�\�\'�\n\��4\�O$\nv3�\�ڐ\0PE+��\�)q߯�;�G\�\n\�f���\0G\�٧�c�\�H~^A9\�\'�Ҙ;S�}�]\�px\�L\���I@GQZ�}�޼7��nMe\r�\�f�\"�9�\�R�%�\�\�A=�\�TD�\0\r\�\����u\�#��\'F\� �E\�Brs\�w�nt9\�\�B�NQ�rEG�\�8\�<w�\����\���A\�2�&���\�\�\�AG\��{\�̀nrIv�\�\�q\�ךx@_\r�\�(Q<�\�\�0C�\r\�\�\�}��M\0l�y\�4�(2{\�\��c�\�ȩTʼpH�\�\�\�\�#5z\�	Zh\�G\�~\���̄\�T\�\�5�c\�qZX 9\�J�a\�#ʱ;W9qӭk����\����	3��-�mۑ^}&U�c\'<~U\����yuk\"*y�\0�\Z�<-�\�9\�p?*q�4I��#ץ�3\�F\rk/�5�`�fa\�Ӟ����QxKX|`(\�9c���\�.\�vg:��x�AM��R��?jl\�\�P7s\�5q<\rtp\Z_\�\'���{�+8\"$2?.\�\�\�\�.\�\0<rO\�]L~@\�m\�/#޶\�|)oe(uf8\'�.�G\�\�.��X�\n�\��O\�)\�G\�+ܦ�t�\�Y�7P�\���\\�>��������	Q\�\��iJ�\�s�����\�}1G\�\�\�$U\�\�\�bC�\�1�\�n@�\��#<\0\�2�ܫ\�f�[+\�J�ʐHlu\�q\�\�_B�\0f�բ�2R��h��#�J_X�f\��\�麁|��F\�Z\��+P�\�3�v,n\�ҽXi�/\�ڵ�a\n\0�_Y\�컞H\�-�x7c�\�n��M+\�H�985�côo >�\�yU2��\�9=�qR�)S>|O\�Ⴟ��O�5px��4y\�\�^\��*�\���Q\Z`��\�/!�+�.�2�1��\n�|w�O\0\�s���fH\�\'�\\TXV\�8\�/o>\�pG�\�\�x\�b��ʌ\�\\_Z�T��Ns����\08\�7hB~�.���\"<�<�pv�\���?\�\�T�\��\�\�^��o�H�T\�B�>\�pG�\�3\�\n\�Jб\� ��a�h\�{f�\0R=�L�6�V¯9=I\�z~\�]\�\�\�\�\�ޛ���7Z�\��Ԛ{2�=\�l\�ب\�\��\�[�=�\�<�J�x\�^k�\�[�+\�r9\�\�Y���ox�ÜrGLU�l@��\�\�\�3�\�\�\�) I�\�\��\�/|\�ol\�\�vG9o\�+*TG|7A���J�=�vWq�˞I�\�\�+�>S�\�;j\�OS���f��~�\�\�����\�\'�:\�\�;(��Ҳ�f���2OL�Inn�9\rQ�\�D�?&v���\�(\�z�N	�jΨ�\0\���\�X�f��\�}��\n3{�0��~nA=zd\�a�i\�?6\�\�a\�\n�\�p_i����c߃�\�S\�\�|)\�F=ES)3\�\�^\r|}�@!�6s�\�\�\�x\�\�U�Wa\�#�{z��W���I5Md�W�\0��\�*J=N�\\\��O1�\�9*?�泣��\�bC$N\�22I�ם�\�z\��Ι��\�\�\��6IQ�8Ol\�<\�\�]���\�l��y��3�H\�x�K!\�0\'��a.\�(�A^=�}*X\�T��O\�i��+s�9\�\�\�\Z\�]Z,��N\�\�Z��^1l��\��k\��1<���W��{sXL��KG]\�\0\�MW�\�\��l@�\�\�Bd\Zmǖ\�x\�&�LŞQ�ޛK��\�R\�s\�\�5o�VhD*`��\�\�;�N\�\'�]\Z5PW�\��WLuED\�j�n�K(.qXZ��m\�\"�@c��\r\�b9\'4�{:��r+B�f�\�;=H\�ZK\�;\�c\�d\�<�7&�\�f2�\��I\'�>���eۋ\�\�\�.\�_����*�\�\�*\�h%@F\�J�д\�\Z\�b\�Yz63���<Uw\"\�p�rI\�ԍ�F\�9\�sM\�O�=\�\�\�\�\�J_h\�N\�\�T\�2r�f�\���}������j�m\�y�\Zz\�c\�#�\�u�M\�*r�t\�mكy�UZM���=&f\0�q\�A@Q��ޢ�$�\�\�\�j6%�c�\�Ӭ�\�v\�\�R&t\Z�\�\�-�OZ�I$PJ�\0\�5���\�m\�O��9>\�a\0��A\�\�M�̄�횙~_L���i�UA\�3�zcb\0\�\�hR.��0l\�\�ҫ\�!<�\�$��$Pn#����f����;\�l�3�\�\n)&�<#\�q���yw�\�_^�5��\�@TU���W�\�R\�\�\�vO<�;�Z\��\\��01\�\�z\�O:�6\�\�I\�\�!՛,`\ZB�\�\�k7S�\�3\�\�5�qq=\�A ,W\0{g�υX�X�?���X\�0�\r���\�q�<�έA{�����|\�w�<�09\�^)\�\�ML\�\�hU�!�e\��A��:Ӻ\�Rq\�=Ma���\�Fv\�\�\�\�\�<Ҹ\�;yY\�́���ՠ�M��X�+�k{���`3��s\�1�oN\��%%�T�MC�\�Q\�]��Sx\�8\� �یW7.�u3\�y��\�ԶZ�}+/��vt#�ۏ���\�v�ƣ�.?*�x�A�\�g>�\�9�I\�\�z߽\�	��#���f\���A�1T��\�L\�N3�O\�G�zU��rb�gv\�Sb�6F���>�������\�\r�cD#\'����?6H=�\�0�3&Fzpx��哼1���\�֢�M����1\�\�\�5Bۻ+��\�W�xVԱ��v=z\�9��=��gY6\�^H}*t�YT��=\�sĺ[\�_�Y~A�=k���\�UFI�&B�ci\�8JXd\�B\�97�>�։���7\'��L��#�X��3�\�Y-\�?*�\�\�$V\�8�g$T�hʃ\��Pne�v\'\0�px�d�9\�f�D\\�4� �~U4P7\0�,\�^7o\0�Uظ)�\��-\�=�\�.nZh�[(��f\n2\�\�A�\�\�{1~N7sL�\�\'�\�H�>\�\�� wɸ\��v1\�\�}fc }\rf]kJ\�xQA$s\�f=�\�R�\�N�\0\n��\�\�s\"\r\�O6CL4���\�\�E\��\nҔ���\�BЖ�\�;ʃ�q\�8\�BG?1=�j�@8#E=#*\���<R̹\"l\�f�T�\�5l�������R\�\�=s�v\�\�H]�\�\�\������\"\�\��$;p}Ev\n�\�85\�?�R>o\�-M��:1\�=Oj\�h\�\��W�x\�N\��8\'�\�s�\�vS\�(\�2�P1\�\�P�)�*��<��\�9��q��\"�H����\�JC9㚺��$R��Mā��ީDW2Jm��#v����Y�.)���ҝ�\��d)ʌW�Q�H9<�R�zz\�\�뗭$݃Ve�X\�RA\�+Vk乏f\�Sҹ,�\�{��d�ы\�Pƙ�6�{�C��Z�-�Dfw�EDo\'�\�o \Z�RWrGqYH�\�K�.\�<\�\��\�_\��\�\\��\�\�:\�x[M\Zv�ep\�7��-Z��	l�QՕ�qsާ̶�<R\�Y\"9Bp���ۮK���#֠��g���b=�O�9�1\�\�\�ף�n\ru+X�\�@-(9z�W�\Z�\�j�2Ĩ\�ARv\�Py�\�\�X8\�&���{Vr*&[\�f��ޔ1\��sdRH~l-2\"�\�\�5��,�t\�\�Tu)�z\��.<���횂R^Fr{\�ĉ��E9�\�K Q�;\�O\��\�is\"�\�F\�\n��j�\��\�4�1�``r)\�܊�c��&=�T�,x\�vM4i@Wb#n{\�L:T��F\�j$�7#�\�ɫ�\�*x民�pqOёN=\�.6(ьsO\�<\�\��UrH�y��d\n��3\�LR(�ڢ<�\�5)\��=飭IV�N�&	\�ޓR�\�pi���\�NE;o9\��\�)��.j\�/1�(\�\�X�T�:\n\�<�=\�\�-� A��SR\�,\�ո�\�R2yn\�a��\���`\�\�)ئ�\�\�5W\0{4����w9�\�dg88��\�zRۏ�H�p$�\�T]�Rr��\�Rd\�э\�I�\�/j�\Z\��1߾*G<g�C��\�HZ�u�[\��s4�\�b�\�*\�č?O]:\0T�S��1�\�V\�\�x�|>��\�\��\\�\�+�ڤ�\�ȲO�W-ۨ3\�*E�\��T�y#5\�c��<q\�P1�ɥ��\�j\�N��\�l�<S�{\��\"�$W��\�TQ�\0�3��Ru�\�<pr;Tg\�RӚb�P1\�\�Nǿ\�4\'�@y��\��\�\Z\0B1\�8\�1�zT\�뚁ɠh��3ޚ{¤+�y=9���1\�j͔3�\�\n�6�\�p\�:T]Fi\�8v�\�&+\�s\�G�)O<�ގ}(\0<�\�\�\'�H=O\�I�\Z\0@q\�\�\n�^�)G\�M\'\'�\�m���\��C��q����\�I8\�+�� W���O\��%\�q�8�@\�\0R)�\'��\n\n\Z\�[�\�nz\�����8�z\�z\�!8$t\�\�)\�SHC���MH�<c\�M\0��\���Hz����sހx\�\�-�\�\�\�H�\'���8n1��k\'\\Ա�8=\�\�;�x\�zo �&�qI\0\�7\�58 +p\rB04\���䊢�$,܌R�\�cQ\�\���/Lg�q@\� \�\�]\�;NzV��`���\r��~_\�\��?tW@J���b@��Jц\��3��()a�\�b���\0��\�7]�;Uȼ�F6���\�J�k�������0`;�\�zT��*\��~�}L�\�|��\�s�i�h6+�\0.\�\�+S��\�=����\�\�iK�6\0��xk\\�\�K7ǯL澣�́�\�A\�\�J,#\�K\�O�{&|����Ů;�3�����i&\�x\�7`\�W\�\�e$��9���0��� �gʒ�k]��%�����q[:_��I\���⾍�\�\�X�7A��gZi1Yh\�\�|\�\�ع\�xY[tQ��\�\�I\�&uS\�\�\�{\��wu�F�\�LR�\�Tx��9�\�\\�� U�~�}\�\�\�\�+\�\�L\��(1��?�O��q�\�`�qh��\��\�Oz�>i�\r\�\�\"�#k2�8#\�o*�9\'�\�\'V}\�\�y��H@2$b;\�\�V�ZBp����w�&}���)�>\�>\�]\�ȎxG�O\�=M^_\n\�(�:g���]�h��5c\��(H�\���\�\�\�G)��)%-\�A\�\�Z��l�R��V�\0\�v���a=6�\�<\�9�����;T�\�h;�\�y\�ZB&�Z�&\��槙���Z\�\�ך�\�X\'w\��\�]�����5�\�)�=�S�#��4x\��\�S���8b�\�\�5\0��s��\�\r����)6�\"��	\��\�%^I\�\�sWL�\Z�}�]\�r\r	�\�P�mb�\�4\�6\�|��EY۸��Ԇ�dP\Z\0Pʣ�Qڥޜ\�P	�~T\�\�bI{\�hXb\��\�\�zӁBv\�-\n㒼�\��\�\'���G\0\�w\rA\Z����L�\�$dԑ\��mn��n\��vP�^*ku*@���1B�rOc��I��cbO9^PB���8�k�})�J����$\�`Kt\�;��P��\���\�\Z� W\�}@�4LNA�o\�&��r��Lr;\�;`�5u\�ʊ݉���\�ԈdfO�!����#,s���z�ס�\�7%@�\'�oJi8��\��\�4��ܜ��9[h�Jg�nx\�LLM\�\�*9y�\�qFN2A\�\r(���\�\�:�۽0�n�#�Jg����ߊq9\�*�8\�=M#��z�i\"m�\�<�ҩ^���3�;V]\�b�	=k�\�iDqpNr �\�F}N+���np\0?�r��o4�oL\�d6<��\Z8\�y�I�\�W~0j\�\��k6\�v\�Ej%�\�I\�(͕\�\�\�\�#\n�:���\\Ǟ{\�Uǈ��u=j�\�?���\�\�zQZ�s$�3�ie���q�g~5Qs��g��֬\\fp�p\�v\�Q��>����\�2.FG��J��\09\��|\�\�}��ڂ\�ܓ�3�\ne\"��\�p\�\�\�5\n|\�\�\�pA�d �sڞ�\�,T��\�<�;t\�JUz\"��c<�8!�y���/\�O{�\�V1\�N1��\�(�I\��\�8�EW\'$���Ԍv\�0N3\�Fθ9���`I@��\�\'��\����r}�^6��z�9\�zt�j�\�2X\"�}r{�XTv\�\��A�\��\�P�/\�\�;UiܨP;u�S1g��\�(�\"\�>\�\�טq�sӊ�o��Rv\�M�\�^Rp�\�3ֺ��8n��\�\�8\�H�1��\0�8;0,9�\�cdW��\�DnT|�f\�Pdy��䏗ң\��\�rh60��3\�4��OO�1YFpI�ڢ�\\2�G)0$���N�\�\�oU]\�94�\01�\�GJBh�`\r�h9\�\�S$�w\� T�\0�8SǭH�s\�\rRlV\'���\�O����\�\"�I9�\0b��A��.O\�[�\�f\n\�Y�9�\nI\�ĒsR��r\��?n�\�jc\�7u=�U��\�����Ȧ�d\���#�O]��\�y\�\�U��\�\�\�\�h\���F(;�\�\�\�*�\�[�J�ɴ~�\�\��QG\��\�E+�<\��\�5L\�wn�\�̤m<|��-�\�hzn,g�\��{W\'\'��>��$��\Z��\��\�\�חx�\�\�^�D�����R�3��\'���!0:��N���LT#��_z���Ę�$H�J0yfǹ�I`�\���T�7��\�d����A\�ՕZ��[f�\�\�$K��.\�Y��Dk�ǹ�K�д\�\�-���p�\�\�HUF8�0kƫ��7�\� �1O��6�~(]>01��ⷄ\\Ԃ.�����\�\�\�[\0Ñ��YG\�Tf�\�\�Ts�\Z�$\n�)w!\�&{\��\�ܪ�Tåڞ�\'\�B\��٧RѢǓɮ�#\�$Us>\�rG��.�e ��:zT#\�ZH#�\Zv�tap(\0zS\�v/e\�\�Ǉ�\�\��\�\\��M�@\�[\��\�:��]L\Z\�\���\�\�\�\�\���\�\�?=�\\\�c`�;m\�\�pۢ(b���ӑN���.\�N�R�\�v7jD��eq�+<�o-%�?\�^��8\�&�\��ޮ5f��](T^���6q�AjY<\��?\�\�!\�\�BS�\rl�ϻ!Ӊŏh�<e\�D\�\0\�\�o�ܒ{\��NsO��\�5\'ݘ\��G�i�8\�#n�\'q��\0�g�)��<�\�\��8ϭJ�\�WLg>\�N(򋏇�D[2]H\�Nh_�\Zkd��-\�KW�IbT\�\�\�sV\\���Rj�.\�|��~\�>H��v$\�c\�:ɽ�\�p+\�RTg\�\�O���F��5jr!\�\��-� ��\�Np8>\�\�~\��\�\�\�+\�\0\�qELe�q\�\�z\njL|��i~IǕvq�\�T-�\�#}��<.\��)Q&�\����M�\����1\�\�d\�($\��\�S\�mXVX\�\� Z�pZ�}\�&�P\�b�Ec\�\��\�lr�C�\�9�jՇ\�K\�.����J��ǻ���H\�s���T\�u#��r�\"\�Ah X�\�^\�~Uk�-\�r��\�87.}i\�g�\�\�n#�\��G�\�5+P��\�+��\�\�\�ԋ�6s_R�*�-�:f�!\�AUJ*\�$|�>x�+\�(�\���\�\��\0�Ѱ-�\��\�k\��\0\'�)\�ќ�~٢����.\�\�Hb\�-�k��&R~�\n�\�\�c_��5�l�H�_���\�\�\���<L�\�\�s\�f���\�[&�\"��\0w���6�\�\��\�i�0\'`������Ի!�7��	𾺠�s�ڇ�消�eǠ澵{\�J����Z>�%�G�o3䣢jɏ�)�G\\Tm�k\�E�\�\�c&��[�ǥ\�<��\���XW\���3�BF�Ippx\�}jƝ�\�5����\�\�澭6P��\�ҏ�D���VrƷ�KXW\�\�R��\0�2KyY\�\�]t!d,6ci�Lk��}��Uf��\����\��\�j\�ܤ��T��\��\�\�}Bm�\'%��821\Z\�\\q\�+8���\�|\�4�K�kI�8\�mV�\�\�1\�Pzca��\r�-�AL:u��k�Uhp>�.\�ʢ\�\�y�>�q�S\�G\�\�;l�<�\0t\�\�b\�\�yX׎�P-!\�\n-f�\�����>K�H\�#��eq�]�[�7P\��yO�t1���\��s�\�g1\�\�\�\��J��\�|��}�\�u��<��\�=���>\�8�\�\�}fl\�\'�Z��C[@\0mRǵ�E�F�\��+iڋ>\�>\�B�~4�\�\Z�.~\�9�\�k\�߲C�m:R-�*>\��З��\'�\�\�GJ\�\��\\�0:\�\r@t�M�S�O�\�\�b\�x\�I�#8o�(x�����]O����\\�Xܜ�SSƙ�p>\�s�\0~\�}a�bpH_�*D�-���5���^\��1t\�H����ǖ\��\0\�L���;\�5��ڀ�\�\�I9\�Lx\�cVf��������y�$�\'S#?a�\��|�M�\�\�\��\'=�pk\�>t���ع��\"\r�\�\�<t����g\�M�kY�.�\�l5���?`�\�g\�_fxS��$sǭ4[B\�\�8�北�\��\�=Xu޶3�Ձ\�\�l��\\�?�_a\�oH\�\"�\0S��6\\\��ڣ\�r�TW�>::�8:u\�\�a�Ǉu\�7�\�\�W\�+\�ܸ��\�gR�U}r_ʃ\��g\�K�\�\'��7%�\�\�jS\�\�s���88\�_c>��\�ғ\���\�\\��\��g\�m�\�[���q��\�z\�?�5�3����\��?\��>Q�G\�  \�EC\�\��Q_W�>0�B\�\�$Gar\�\���\0��k\�\�5}|,��\�.>���\�\0\Z_\\��/���\�4\��\�M�\�~&�&�>�g?�}��B\�w紌�T\Z:k\�E�O�>>�\�>$�K\r:`�+Ҽ\�Z\�\���m\�F\\\0�ߊ�u�@�(�>\�1�\�)c\�vE}B/�>9\��5��{tM�\�<\�ۂ\�sX�\r}\���\�W1�xb\��\0+%�2��֞c��\Z�E{���(^�zTn�Z�\�O\�}�5��2g(�V�[[\�o�k\�ot���\�½\nx�u~qʜ\��\�c\� S�qɦ�Wq��ğ\�p8�\Z�K\rܱ��P\�QS薭{�\�@�Ze��\�տZ�Mr�\�������\�S\�s��qR���\"E9�󓌑ӥ3�\\�^q\�U����S\n\�\�v�\�n�\�`\�&�CG\��x|;f\04{�\�\�yĠ\�_\�t1�+\�|/MMN\�\�1\��ϊv\0=�\�9��0k�\�)�\�\�`��g=\�\�ޞ�s�����\'N��-�S�V�O=\�F\�w`��UN��1��C��k�#ךwN瑃L�F3\�P\�Cpb�\0�qL#�i\�=�4\�ɲ;u�j���R\�\'��;I\�\�1�\�Fp\�	�\�qI��|��\�\�r0\rHT���Nb\�\��\�d\�H�F	\���\�\'<\n�C\� 8=�A���Ԕ8aO���)�JA\�(@0)0;T��\"��p��P�c>�\0�~9�����\�i}h��\ro]�ɣ\�\�\�z\Z�\�{b�vp�	<t\0�\�=\�^i��\�4\�\�\�\��v@\'4;R��t�\\צM\00\0�\�CN ��ҍ�?\ZBG<q@\r\��~9�$\n^�\�0b��M.\�\�\�!=EWAXc�ڥ�\�Y\�qrj6��A�\�\�sc,\�n=���9\�ST\�\�1�V8\�I5X(\r�Lhi�\�A �G\�ZS@��\�\�8\����(\�%�2��\�\�\�Q��s�\��c_Bh��\�1L�NW��\�\�+\�<���}�叚���O$W\"\r��\�vg\�[�\0�\�W\�zc��\�\���ƞ\�\�\�C\�9We\�r`�8�\�\�#�j�q��\�\�V0�F)\���Ғ��~84\�\�Fpjf*W�\'�\"�\�\0\�\�J`@bnݹ���\\�^j\�7\�\rC��d��e@ɪ\�\�bzq�\�V^P�p\�ޫ�\�\�樂c\�^EFI<\�\�[1��\�\�i-����H���FMA\�%~\�*�Ƭ\0~l��qn�\��4!s\���\�\�\�\�\�U�>ё\�hFg`C4�\�@\�}j:8v|�O�H�9ܹ�\�#�BLd����\�e�AO��\\F\�\�U\��֭F�i��\�M\�\�\�\�	pI\�ۦ{��\\0\�\�\�5�>IQ\�=�\�W/=Ī\�=�\�{�\�\�Bk9 \��\�U���?�L\�)��\�ގ�.FTg��\�N3\�\��$�\�(��\�\�H\�\�|V�\�\r\�A�9\�=\��\�B\�\�ݞ�(���b\�d�W4�\�\�9\r�)\�\�\�Q�󼻑���Q\�ƹ,I�Fj�\�	Q\�\�\Z\�{\�\�\�x�����G�a\�\0dR\��Kq���@Zt�Ō��24\�\�\0�Ȩf�\�\�9\�h�\�\�WnN:�}*\�\�\0����	\0\�ȮQH\��㸢�sQc\�kd�u%W�$q�\�p�\�\�Ps��n\�KCL\�\�s\�3\�L�¡Nq����>��^E,r��6)2Ϛ��<\��\'\�\����ޭ�c�Z�C(R\�	ǿ_l\�Ύ\�\�e�s�CV|\�+�0�\0랕\�\�\�v�\\��.ߛ�9\�q\�Ր\������\�#댊��+�?/�&���%BL\�<���\�I�\�4.aw��U犉��+,��\ZF\0t4�D (#�*B\�2L\�`�\�}jT\�p1��%�xV�0�\�8)���\rۜ�\�5NKt� �}EN\�\�\�$��\�=)��r:�\�Be\�\�W\�	�4j }ĎO_aR��\�<�\�VX\��n�C~�\�jgϾ)\�\�\�`h\���~G\�\�n�1�oNM^\�>�����z�$[Cs���\�\�\�Ms\Z̘r��\��+z�\0��\�}vm\�mW\�q]�8*/y\�\�\��U\�~	�S�±fc�:EE\���j\��v� � ͸�+\�>�ڳ�6ű�;J�\�\�ܚӚh#Bŕ\08\�\�c�p:��u�1��$B�2K\�~��!�s6p�;\�4��=�\�m\�F3Ǳ4Lv\�C�m\�s\�\�l�\�f\�\��z\�F�$I2�B�1�\�4\�X>�*6��\�e\0����R�S�\�4&^v��rs����Y�I\\q\�j�3#��\'��R�\�\�\�\�j���S��ӥ6�5H��銗z�v=\�&\�\"D\�rs\�3G\�\�F[���8�\��\�S[�҅\�GN:⡍:�u\��d\"�\\��z\n�#�8\�@ۭch\�l\�\�\"��\0q�\�QG�G�b�\'+�dG�p\�:Q4Y��*\�\\ \�\Zn\�\�\'�\�3&q\���Kd\�\�\�\�^!7\� t\'pa\��}��mYO|���S�ʽ�1\�y\�t\�d\�s78\�\�g$~\\SKm\�$�rĔ\�>����\�3�޺�\�Fs\�9�۰Ƿ~j%#=H�\0\ns\�p9\�OqM��\�=G|��\�v9��001�ҚȮ\�\nǏ�ք>�����i\�I\'�j�\�m�HS\�Ҙ\�ĚE�\nky=I\�Җ<u=1\�hS\�\�<\Z��\�i\��펔ግ\�Nh!�8\�\�+�\�\�\�P�\r�\�\\痞�q\'����\�\�\�%\�|�^23R&\�T\�L\ZߞN\05��{�\�\�WˑCv\�\�\�G_j{�F03MF8뚑@=�3I\�\�|ǯ��;�\0\�1n�4�	\�<s�\��\�\�7xnH\��R�\�1	\� W���i\�\0���q\��\�\\��\�]����wx�2�D\�\�r�\�v\�\�\�B�aPq\�W�x\�\�\�\�\�rG�{(�x\�8\\\Z\�u�-Yv(I\�׊�M&gf\�\�\�T�\�\�N�=�W�\�\�\r/\�ɞ�lt��	�H�\�9\�P�F��&y߅�I5��C�0\�\���R\�\�;h\�\"\0\0�\�öZ%��\�r\�O$�\��\�\�EgU�#ӡO�:\�\�*\��\�1Nޞ�\�:P�rx��q���޴�\�\�NrO�zT���3\�|U��G�^\r1�}��\�0i�vd\\�M/^jL\0NO�?ǊnNi_;��hQ�~\�\rB��\0]	A�<ӚNG�ǩ4��	�d枇,*�S\�<Ӑ:�5�L�i�\�S\�2+6&��\�W\�ɷ�\�t@\�E��EYB�F\�\�sU\�\�zV�Q�\�]01d&Xj�<f\�K`|��\�D�ޥX[p�\�3fM������\��ua��\0%\�3>B���ޛ����\�\"nG*)LG�i�gs\Z��$�\�Ĩ\�W����\�R�\\\�q \0{���x\��-QT��OZq�J�Z��1\�\�\�FG8��|x\�^Mn�h�yi\�F	���^W)G0\�p\�քVI�[�Z\�\�\�\�R���c$\�\�9��u\�P�AV�i\�\�َ\�5�Sol��\nz�ϔ\��!je)-��)~qOh�\n�xw\'�i\�`�L�3\�q�T�3E#F�\�O\�\�x�.\�\�FXg3 \�\�Sa?�MQ6�\�\�u5���##9�K�:Tm\�\rn��T\�Fm�\��\�M��P��Ȩ�A\�n�bē\�*�@9�\�jR1�EG�ڵ^\\U�Ed\�Zeu:���\Z�a�h����\"\�f�0\�Z���P\�\��W8\�Q\�Xu�\��a�#���D+�\nDl��9���n\n\�N�(\�\�y�\�.H\�(\�I��R��S�\0\�C=;S[� H��\\\���\�\r�\�(*�o=i �T��\�>\�Y\�\"�\r0\�n*\';y=�]\�\��zU{�Lg�d�i��F\�<RI**\�UU��{\Z� �d ��9��A1V��U��XS �x�S�㸪ok\�F�\�85H͙�WӴaN{\�g��O��J\�\�7Lc�\�d�U�_�r1\�5W3�L�Gia\�\'�\�C\�e\�����ҶR\06�R*\�71#��P��\�\�\n`ri�0F\n\�n�c&8\�M\�JN���\�BA\�=i��\�iP�3UA\�\�Dd�.�>�\�7\�ך̺k�1�@d�\�OaM�T��I�*�\�4� �t�@\�L�p��\�b2�\�jŴ�\�\"+��0\�Ƣ�\�A$yC\�\�Z�\\�\�H\�{P-K&\�B\���\�Yz��OD��g��ėx\�;Ҁ�\�\�I��87��bXؕ�.յ��\�S2�5�%�n\�>\�حV&\'w�+9��,q�\�H˃�qR\�J@\���~a�Y�*7�;��\�M*	\�S�=Js[G�qڼ�\�G����<Юg�&Q\�,�\�k\�\�AOƲ.\�W�E\�qZҩ(MI=��Zjpj\�\�\��s�*3Ͽ5\���L}#]��e\�dޞ\���\�x\�\�ڽ�+�\�\�Z\�\��f.<E�Ȋ7cV�!�/�YЏ�$-\�1X��\�\�H\�˟J�X�[���.�d�ɦ�ѐNF=�\�\r4\ZR�+DI:\�\�\�${\�jF3R\�o$U�Fē�\��R�c�w��∼��A\�\�1�SQ\"��g�\�OF9x\�@On���Q�\�\�?ջ?n2+\�t�\0\�\�ěxT���m�LJ��E9\�k�Jӹ�)�t��\\aˎ1ǭAY��\�\�E�Y���Ȯe v\�]��ќ���G9\�h8\rN\�23K�$VȀ8\�Gz��T��\�Q�\�\�\�\�L<����\Z�X�s�}\�\�\�\�\�_j\�f��\�HE��9\�R\�7�\�\0񚬼�d\�h\')\�?�W+Fy\�ϭ(�&? #��4�\�ú4���\�8S�}j��\�\���\�ޤ��ں\��i��WBI������[֝\�f9\�kϕY��\�\�(:W\�c\�|��\�/;W\'ک\�\�e�x�.oڮ�Pc�\�\\\�c$\�t�tr0\0\��(\�F)x\�\�v��\��Қf\�\�!j\�Úo\rG\�\�Oj���(q\�eI��\0\�	`s��+�\�\�>\�fr\�=\�8����YUw\�}+֬��|��llڒz�YɌ�&\�@��\�L\��\'$|.㊏n\rR�\r\�`�\�Ozw$\��f����ҜdюH�FO_Ɠ��\�<c�H���dzqJ9�\�I\����s\��\�4Ӟ3\�PO\�[G4v!�<�?�k �\�Z��\��y��p:��\Z*0s���j�<\�ҺYm�[3\�n@\�\�<�\�?�\�:z�he9\��\�(\�w\�M)<�\�妁\�Lt�m\�h<�d�^YQ\�dS�n\��M�\��\�S	\0`+)+��\�>�-��m\�N\�$TB�\�\�.[NU-n�JW\�דY̲\�\�YH潯\�0�ԡ[{�\�?9C\��\rpV�֫c�ўԲ-\�!�l�\�Ap\��(\�W)e?\�d\�?\�y+�t\�\�\�F\Z3׭r٦hK�\n_�;�\�@#`��6K�9���$`�RG<���\�R\�x=\�\�I\�S����fI�\�H\��֬J7+aǫ\�e?�\�܃�;Ӱ�T�w�@MN�;�Xpr85L\�A��Of\�\Z��x �\�Fi��$�+�qPI)A\�5|I	�]华\�7J\�	PU���\nD2U�\�\�4��m�\�wZ�J\�p8\�oj	\"R� �*sd�=i\��\�@\�*��\�~\�W,G,2d�\�0Z�J\�>���쏝�7(��v9(C(\�H\�p\n\��\��ɑ���&�\n\�j\�fu �\�t��9�\�\�9�\�A,��n#�\�[�\� |��r+\�\�\���T.d�\��T�-��S�\�A�\�Y�M�Q\�H<f�ǚ�v��N��T\��❅p�����<\�U\�QG!�<\�{#B\��ԦI�\�nhcF��a�)OƳZL�\�\0uY\���)�Ub��	�\�\�yY�\�\�8\�\�\�T[�~\�n��\�k\�}\�\�=\�!��p:�\0x�s��t�\n��\�\�\�\�b�Y��\�ӑ��⁣T��\�|\��\0Zlwh=N8��LU\�+�\�z�;�̧i#��\���Ò\�\�#\�\�N����e���\\�WVX\�3\�S���n=��\�\�,��;�g�@\�\�\�\����qݼ_uzqRAw�V�\�y�i43Rhd0�Vϯ<�j�g��g��3��J�+�\�9N{�aOw�X�����\�\�Rx\�,\0䁌�j؍ı����\��.�!\�;s\�9\�j\�,��\�\���q�\�­\�٦T\��\\\�f�c�n��3�Tr*\���y8�rB�r�\�\��\�\Z$\�ܬIV_�4\���\08\�\�6\�\�]��g�\�\�q\�\���nz��f��S(I 3Lv��3\�ȧ�\�3�\�3F\�\�w��\�(1^\�p6a�~p;ު4�6z\�=\�y\�{����=}Stx�1�8\�i�&\�����$`�T���#��²L\�7D$�Cd|\�\�\�l�v��\�B�>�\�M\�\�\n��p=�$z�Y�AX�\�+\n��(\�x\��+nG\�Ӿk���|�)\�\�\�[A�\rhf-O��gX�<\�$pq\�a�տA�W1��7$���\�\'���#ϫ��)�c�\�X����^l\�\0��US[Kl\�2LA\n##ֱ���\�\�n/\��9H\�\�~��\�!\�x�e�p\�ڟ�@\�w�=}렒[=?Ȃ�t\��V��!N2\�q���I�&\���4\�\�w\�X��\��8�jgz\�\�\0\�5���/�2ܜUA��\�p;�\�3�Ar�\����\�q�W�%\0���\��\�q��<\�<�\Z.j�d\�P�c�j#�\�\�iF\\\�{c\�P���Ǌ����\0u\�oΦURFp:\n�n�\�Q\�aR��G���t�k�m\�\��8\�tZ>�wyp�]�̽K�;WrMQүc\�o#�0,\�>q ʩ\�\�{^�\�mCU�\�\�e�\�VU$\�HԶ��\Z���\\U�JdGvH��\�HT�\�\�\\m�\�$��\�w\�psҜB�i&f\�N\�Y� �n1��\�X�[\��\�\�E{�\�O\�^9��[ՅN\�u�\�tQz������H\��\�f�\'\'\�\�4\�Wc�ek�\�O\�ϵL_g\\* \�\�8�\�֤P�r�(,R\�da/�#J\n�c=}�*���\'\�\�\�\0?<�\��\�E5�I\'����|�Z\0�qE\�\nx����rGAM\'<�����\���!��=� \�Bw=sMUb1\�\�Tۆ\�hf\�8\rz�}�i\�*�\�\�{W�Fs\"�\��\�?جN\��j[2�<�R�{�\�`e�t\�U���@�H��UcϭP ݐX�)y\�zp)F\�H\�Z;��I�)l-F�\�4�\r�0��S\�v23�R�\�$�\�\�p>�xд\�ӬH\�\�\���[�JrpÀ\�\�\�UG@\rr՗A�4�\�\�ki�\\��Ṗ�:��3U��O��i/ּ�/\�[��\�\�z\�٥8ݞ�7�-�\�I\�Oz鴹&�A1�Ƨ�\�\�\�3\�\�t�y���{���P��\0+���\�pH�(\�\�\�Rl$\�\� i��\�9�Qb$g<\Z��*R3\��=��\�.zSwe���p\��\�❌\�1MYU�\�9=y=�؆\�i�4\�&QҪIu�\'֭\n匃�y�f�\�޳R�2F*_<t��K5\n�<�U%��^*S8\�?ZV�\�n)#�6qҪ�ޘ]p���X9� \�\�&\�j��\�jM�*��/+\rY���b2)\�F\�m$l+8\�j\�\n\�I(\�����\�\�V\�CZ	�:\�o(\����\�g\'�uA\�\���\Z�\09��\�-VK�\�]1FLs\�4\�I��\��w\�c���4\�D�\��5�Fm�0\�T�MX�`d�=}�\r.\�a��V���B\�qZ(�\�q\�4Ì�b�\�*8_��om-\�\�\�;�\n�\�֊9	�\��\�i�h��U!�\�:�?.W�[\�S��[khQ	�u_)�0\�\�XpsV�\�Q�\�j5\0Jp:pMt�lvvћ�\�d\r�g��?3���qߥ�\�d��UI[\�\�\�r>��__�\�$;J�<\�jmB\�\�X�3\�)�ݲ\�8\�t�\0t��W\���G)I�\���9�4\��S6lp:�qR\�Z�ߕ2OZ�\r���Gn;\n\�\� (c\\�2�Z�(*3X\�Œ\"�\� S\�|g8�\'�|d���\�8\���j�eș���\�\����x�\�O��ǽc(3U$dv櫔\�ڴ�\�Ua��T-�w�\\��2\��\�`\�h\�\�j�\�\0q�3Y�3D\�U	�9-\�\� qTʊ�U\�^�e�\�[\�\�Q2�&�q+��\�\�p*\"��0RR@�q\ZdL)\�Z@F\0�eA\�\rKE\\m!<Tr�Q��c\�f\�%\�qFI�����UQ�38#�\������\�\\�#|�O�D��8i\�\� =H���\�)d\nA}�\� a�\�j=�\�}(�A��Mɂ��\0\�\Z1\�=*��p\�&��\�x4\�\�ʑ��Ԝ\n��\n\rU��0p�[=1N䚂�H#�u�k~�˳�\�\�kL�z\� �˅z�.qTĠ���\�\�	�\�OzϞ\�L\�\��\�Z\r��*rF\�hQ޴�\�A5Z܍\�w*\�w���HC��\�\�\�zwJtc�<\�\�@\��\�f�\0`F	p�&�kd$�zd�XG�*�\�D\0zS~ɵx#>�0��ɤ�tRp�O�OT`�*�\' T�RC��^H��Mx���X\��$^Ed�s>\0�EAjE\�y\�q��j\�O�G�\�ˏ�\\�A\�CE�2�\�i��\�(\�\r\Z��\� sTg�\�#�\�L#\�M�\���\���$R\�jI\�\�\�\�Ӹ�ۓ\�CҾ\����[\�\�P�$�ޣ\�_�\�\0:�W���5$�F\"�_���ڽ\�\�,o\�H���݌�7`JA\�\�kS�\�c�N鏒,9�z\��ov��\�\�Hs��ߟ��\���c�\�w�/\"�\���\'^�Ҏv\�\084㞽�+f�J\���apN��Z�,F}Z\�02Ze?L�V{)S���3\�\�\r8�$\�뚉l\�}E�%F\��Ebx����\�Yc\�?\n߃;\n\�<S�.��\�\�9�J\�Ó^wSd\�\�Li��$\�5ɮ\�\�Fk�\�˱N\�8#�Gl�\�9\�k��.�\'�<u灊�<m\�q\�[�&!<d\�g;�sJNA8Ͻ!#�P\"1�\�jh\'�Rz\np�\�\"\�©\�\�\�\�ڙ\�q�ԫ\�$~T\�o8\�#Cc�\rM�?\�\�K��\�z��\0J\0��1\�\n���\�S�\'�I�^>�q\�\�*d�kq=�\r�\��\�\"��D�㑀���7�\\W6�\�b��7/����M�T�0�\0<\�;Q��4�\��o\�o\�bBѮ\�1\�\�w5\�$s�\�=k\�nx�w\�>ʙ\�vׁ�\���\�D6\"ঝM=�\�zw\'8\�j0Ϡ�3���R0�M��:�\�\0&z�w�0\�\�;S��;`gޥ�\0\�Q\�I\�!�I\��+Bп��%-e:\�q]d^��I\"�$\�\�b{\�R�S4P�\��`\�\��Y�=\�ks]\�c���\�J㱬 ��洋��\rXQ��oA�pM6r8�T�\��$RN}8��\�B�}9#�qI�)��܎)�d�ȡ�1צ)+��\�\���\�Ӛ�\�i	\�z\�\0��l	S�\�\0�\�\�=Tc�\�\�2cg8��>�f\�\�n��6zu\�s����ZW9u\�\�\��\�a\�\�qҀ@\�1�\�y\'�A\0�\�7�I=8ǽ\0/e\�}�A\�w\�9\�?��\"���)q\�u\�z�ާ�y�j�\�y\�@T�\�jrJ\�J��C)\�#��K�.\�\�1#`���\�#ڲGj\�Q�ԏ^�ߋ\�%�\�%�\�\��Y�KKƳ\"x��A\�𯖃\�>�9\�zo�<Xʷ�f,[\n\�&��Ѷ�\�>��\�{�5K\\�\��r��\'�q(�S���\�\rD� ���k�j\�,�K}E\n0\�(2��W#6ܦ���H32�8�\rB���������$\0k2�O�:�_���f�ɱ[���\�\�,ǔ\�\�\�A$N�\�s�\�ҧI<�!�\�\�.Q�HGb<��B��\�\�g�Mi�Q\�	n2H�~\�\"$��瞢�\r�\�^�\�fY�a\�\��\�Zg\�*0I\�9�\�y\�7z~D1���y\�g�\�!�\��7.@��_d��\0ߥ2	d�#\��{\�I.�1��y5o �1\�5\�X?2�\ZB��\��FzR4�\�2�\�8[\�H`w.F�sNq7\�\�\�LEWbp8�\�NI�N>�p@�)Fv}G��S\�\�\���@R:�,�z�=EX�\�\�\�,	n���F�\�\�9\�jxm�(Ď\�\�\��$\�Hh��\�1V��TÜ\�*\�Bw8\�*7ʐT��\�\�RZD-@�\�\�\�c�\�jTw\��I\"\��f݁\�f��B�m\�$\��~\�\'\0\�q\�NFT�FӁ��\0\�\�=(/\�\�Xu=\�z���\0�Y`��\�}��r~N\���\�T�39=P�\�8^M�D$Tzw\�3x0\\�\�ޡ��r\�O$��ŽH\�{�q�nL\r\�\�\�L�1\0(ROlԀ�s��\�Z�\�\�\\u�\�f\�\n[�:�\�	++\�\�\�\0YkKiS��\�\�j�\�\��#\'�\�SG��\�\�rM<\�&w�x敀r\n�\\�\�\�\��hAq\Zh���W>&!\n��ǧ�{TJ�+�\�=x\�\�T�h\�VT �2�j�\�l��1Aӑ����/;#��\�U\�\�&��\�\n�� \�Q��\����\�p0Xq\�q\�*)�_%\0 �\�^�˙NˎH�%gx9 ��bf\�*獻׀F@�&�\�T(I*�̱����\�}0*�7�\�\0�d�GLR��\�A\n\�]H\�QO��?\�\�b\�	\�V6\�Yr��:�	\"��\0\��X����rGH!\\�FI\�zk5�\n�Q�b\�^\�\�y&\�L\�:�\\\�j�\�e�\�`�i��d�i�\�\�ChA��\'�=�i^�\"\�FFq�j�4�4va \�N���<\�\'�\�k�l\�G\�  \�_\�\Z�\��۔���\��ݽ+>]\"юHe$\�~�\�\�;A\"�[\nws\�ڗ\"D��;�yr���SWvir��\�\�Qn�m\�vt�\�\�x\�\�]\�m4\�sTm��\�t\�h\�u\r+1 �l��$]\�.6��{T��_q�js`�g�8\�Q�$]r\0�\�qUg�3�8}����\�(\�1\�:\�}��v\'\����G\�)&h�(��p\\�\����\0�s�b��L����^�׎C|���\����\��\�9\�\�5�:��������\�֑\�\�m\�\'�÷�&q��\�;\�n�sߦ��\Z�:3��䞵2�d��}\�A㷥@)c�\'\�>�~#�\�d\�a\�׊�U�6\�J�\\�Տ���\�rz\�\n�\r�\�\�o\�ǯ\�Ǿ+pxfB]\�O��C�P\�J\r��\�m�\�\r{�e�t\�\�0\�\�y@��&u�\�8d\�U�y߬;�)\��\�2S\�(�Ӛ�N\��$W?�\�4\�3�\�rMm4�\�8$W+\"Q,�<\0}z\�O#8�V��4_+���JDXmˆN�A\�=\���Q�Sc��\�\Z�I\�A\' �\Z��ƒ[��\n�\� \0�5\�Iٙ\�S\�\�*@\�S����0ƞ[$\�s�]w4D\�Jii0[\�\�3�\�\\�G>\�\���=Lv\�A�.\�b1\�\��\�( 〴9l\�N:l\�@q�\�<f�&�~I q��K%��|��\�G\�Vt\�%;�\�\�S.\�2\�Ϝ���p(\�\�)�0\�qN`\�\0u\�oʆ!;r:b��\�\�\�qF��O���\0m9\�F\���Q�@�\08\�\�zWo�\�\�\�G�\�\�\�9�?W]Č\�O��j\�qJ�n?\��3\�\"Y�\�xbrOZ7u�z���׎���a��\�ڨD\�\���\�=�\�_$\�r�\�^��i��=�(cE�\�\�T�Х\�0q��_N*=��>ث6\�\�qr��址\�92\�=S�\Z��N0Ǆ\��\�&�\�&F]���4m9��C�8�\�r�[#m�\�\�5�)�&h\�q:\��\�˶\�\"NvlTz&�6�{\ZF�K�:T��y\n�h\\�{\n��\0�~;Df\\H\�\'5�I���B\�\�\r4\�4�T�=k�U\�JdH@=�R1\\M�vZ\�h���*�v\�\�D��j	3\��OҬ��8�1L�Qv�ws֨\��H���T�\��B\�#\�\r��Iu\�_\�\�+P&̞�\�N�0#�y }\�TH\�w�}탹�y���\�\�&�\�\�G��\�t@Vv\�s��Y�L�&\�s[\�\�U\\˻>����\�\�p:w��x\���a�9˒�>D�4!I�yWa�N}�\�`2c�r	\�\�\�W���ؚ�z)�\���`$\'����ǽVI1�\�On\�L\Z`XC��V#u<�\�UU�52�\�\�\"e���v���=\�j��G=Gq\�o9�\��\�U��\�#�\�I\�+��;U��2N\�]�g<�x\�b\�\�W�YQ\�O��\�Yy���HՊ\�-�\�M0\��\�A\�E4źi�S[\��[�5E\�\0\�\�YѴ\�Ļ\�T�6\�\�H�J�Z��/*H����-Ďpz\�ӒKtyvVX\�v=�\0!X\n���vm\0rMh\�xα��1\�\�;(9?�\�Z$Ce�{�CN\'\�\�\n\�k\��_9=\rmBbڥ\�\'�U�识.9\�5�w\�P��cb�>\��Ա\�u\�8sS�����~�U(\�.P�@�㰦|�*�ޒ+�r�\n�\0*\�j�e�\�F)�0\�P>bï�Y�݁�v�YK9\�𠜚�,�F�#�\�r�dL�r��\Z�\�\�w���1�Y*NF;�M�!\�\�#�y5.��X�\���$Pʉ��7 ֟ʇz�2j�a�c\�g(��\Z6\����i\\\�\��`c�*\�1&\�f�qE�\�s39\�\0<T/<k\nzP��8\�z\Z�\��;��s\�&�fs�\�xw�R�@A<\�Ԙpy����F\�2y�\\MԊ\�\�\�f\�X{INj\"��d\�n%�݊�&�K*�+Sr۷d\�0\"�\�\�\�w(�\�\\`q\�Jr:U\�b\�\�⳥�����i�v<��f7\�Sc�ÜT^g��q\ZeK�\�C5H�]0\�\����$/ѺT8DI�\�F��\�h,}����\�\�\0z\�_r���\�b�[�j��-��{���\�H�>O\�V|Sl��}\��V0\�$\�~I9���d�Oا�v��m\n5*Ȋw\�dq�jC+2(�\�\��4i�f�RwO�\�&RAւI�\�\�.=\�ҍ\�Q�\�z|2�\�ln��ac�\�30�LH���\�kp*�vjm\��\�VA��\�!em\�\�{U��\"K�\0#4�\� ��C@��DvQ�S\�\�e,��\�T`\�L�f�ܹ*��\�ѦpyZ�\�`�#��MWeN�\�3J\��|�\�\\]��\�+!\�8\�5#>J�\�(��-\�I\\\�u<+\�\��U).H\0sQ\�d��r1I�����\�`�VH��\�Ө�%`A\�T��[vjEU�A\�9=\�M\��i{b���\�*�wQ\�\�\�+S\�\�zԖXٜLd\�\�p\�7zL�Ȱs\�Jc�v�\�\�\�!\nF*\Z-33PC%�����t�\�\� ]�#���\�\��}�\�a�+\�/�\Z�\�\�#C�Y8\�\�N|�k�ˊ�җc��\�=\�(\�A�f�x\�]2\�1\�\�3s�\'\�B�u.I�O�9\��F�5\�cb�&\0q]\��\�\�r�Տ�)^����\�/\���]\�\�c\0rA\�u�={T�i0?\Z�	\�+��\r�f\�wu\�5�=�_@�z֟3��g@\���Q?��P\�v1\�\��\�9\�K4�n\�1#\�]�\�w��\rb\�I6ș8\�\�\\\�nx6�m�kI	\�Ҹ\�OL���\�\�R�\�ɕoLW��9>\�k���	�\�@\�lT�\�\�j�\�t(\�\0+�1\�hK\�\�\��\0烊bB31��=�\0\�2��\�\�	\�\����W��0�\00v�\��\�\�5\r��(�c���R�q��S7|\�O\�\\�rrx�@(\�\�Mg?Ls�qV\�\�\�6	\�;p:P�MI\�#\�CH� \�$�\n�\r�\�X���S\�@u8��5\���\�\���@`�;��cM�1Y�\�\�g�\�\�\�$��.\�z�k��\�e����7\��do�8� g\�ֽۛ>Ռ~\n�H\�\�\�;f�����N��)�\�	�}\�8~{\�>aO\�a\����h^\r3��4�(\���ySנ��\�\�3(=\r&՛uB\�0\�\����lg�i�}��#\0;00A\�ZWlT�F#q\�\�\�z~�w�\0�\�vu�\�5��\�\"Y1��lW#�܎�ւ��3\�V�\r\�6C\�6\�d\�WOzѿ��\���B�W��g�N23\�ֺ���0�Rm�ᔐG# �\�\�\0z��\�)\�	\�Nr+C1\�6�_Rx�\\Ӝ\�?N\�\�\n\0S\�ӱ���HF\�J	 \�\0G\�ԃ,q\�iHn$����q@\�f�Bӡ���fQ���^y\�k�\�5Yt\�<���y뚖\�kx�N[X\�h �1�\n\�\�rIJ\�<I�\�_$1�\�9���#�y#\�w \n\�i�8��s�x\�\�H9���\�<�1�)�+�u\0t\�>\�\0�?\�\�E\�1s~���k��\�Q��H�u��A\�\�ӓ\�\��T�c*�\�6u\�H�K��\��\�`W�Ȩ�\��\�޽\�]x\�J�c\0)\�l��\�\�à\�R��\�uP����pj\�ls��r*�\\\�\�u\�\�\Z��g��wĲ\�\�\���cO#=�\��\�w�\�G\�H \�\�u&0\�\�t\���0�g>Yʸ\�\�\�\�R\�3\�{-P\\f\' 0\�=j\�ʷ#\ny\rqz�:��7F\r\�ں$�gز\r��+\��⸞�\�TF�5���py\�kN\�\�	\�\'$;�j\�\����~|0#<\�Bi\�V²��g�\"Y�	t\'�\�<��uc�v�+1E\�XK��X�&��\�\�=\�,\�YLm\�lw�(x�m��U�i~�\���U�\�ZJf���x(9ǩ�K4^=��:��\�|\�\�c��h\�:N��\�\�\�I\"\"�G�\�L�`\�\�.A\�8�jc�q\�\�#\�֛�8$t\�\�V$��h8\�$\�_3h\�w��S�\�\�ZY\0�\np�0W+�\0\�1~�\�A�79�g�\�\�vw�E.w󞘮^\�\�#����4\�RE ��\��\�l.8�\�sM����}����_\�\�4�RCC�9\�c�\rq6{�U�\�r2�`X��\�\�4�U�^x#dv\�\�\0\�`��lթlB��{w�\09���S\�ҕ\��,=��S<ܝ\�\�{z\�ֳ$G��������\'�zw.}�9�qJ�7]����\�\�pPp5\"3\�\0g�=�QrM�|\�Q\�֘�!ROͅt\�}*���\0�\'\'\��t��\�@ȥq؝�U!�;A��\n&\�*\�Ȫ�\�Q��8\�sO1N�sĞ�Ry�0\�1ן«���\�n�	D\�\�rz�\�*E\�1�\\\�t\�F����\�c9�\�\�\0�9F\�ێ���i��\�\����Tmv��8 �s\�3\�(m\�I^\��\0�!��\�vg�\�l�)$��)*�\�9���\�`�\�q��7\�/$��n95�1�Dm�\�yn��^\�>Y�\�2\�\�\�\�\�9\'�\��\�h͢���\�\��ʎ�q��\���<\��õV\�\0Y\0`ͻ�\r\����Y\�V\�<�\�\�;\�e�<��\�\��\��\�\�qU8*;�\��wcsr9\�i\�!YNH?w g�\�l��\��s�\�X�S�l�6#\0�\�2~h�98\�cޜ\��H\���ϥ GA4�N�qЕ�#�\�\�t�H�\r\�q�\�@\���\�\��i�m6w�\�\��uǯ�rr\�\'\�TJ0�\����N\�\�X��M�\�\�\�\"�y��d0PI\�}3F3��~2i\��\�Gl\n_�pI\�jF\�i��p\��\�޹]J73dg\�\��C\�WM�\�/r+�\�\�}��7D�`���za\n\0bs�b�C�\��\�o\��\�\��\�7)\"&�*�Kzs\\ֶ\���n\�]+oRNy\�k��&�-p7z\�b)�RZ�<\�>\�-�=:d的�\�}��\0qV�\r��q\�\�\�\�T[\�rr\0\��ڵL\�!U-�v\� �_0=�q�T�p�T8\��v�sT���A\�\�M\n�Ȭ\�,�\�ҡx\��mm�sޮ[&p\�\0�\0wӽCe�\�A��a�0�m��|��a�Nx{VV�\�\�1�`�S\�+iH)�l�}k�Rw;#\�\�\��\�P�(F2x\�1����L�.\�xU\�\0ksU�f��X2��\"���2���\�\r�\���\�SR\�\�\�S�\�5���be>Y\�=q]��\�3Ư$��\\v\�I\���=A\�\�t\�0��a�yⲓ���\�h.Fr5Z9�T�z�\�S>A\�c�	�Ӎ�W�A����~�\�:֡6�v\�F\�O��q^�qI8\�xn��\�gt�\�(\�y\�)5s�\�s�7�yȩv\�N\�$�j�c9\���\���u#D5�8�Z����>\���D�đ�M1���={�e�2`bm��:�\�@9R3�Ҝfۂ\�3\�j{\��h�\Z\�\"��7��u\�Q4�y<.y�Gu<�T����\�読\�a�\03�ޘ\�`8��\"\��`\�!a��Xk\�[�,O^��Rs�\�\0v�����\�;\�q#B�/<n\�?3\�A\�\��χ+�\��\�T�\�-\��\�$u�\"�\\�rO\��\ZV8\�\0\�=*b�\�3M#�\�\0��q\�h*��\�Î�b�\�Wvi�Y@�c��v�^�\�-!\�u1pA\�	\�\�\\,ct��\�\r{��l\�ͥ~�m���59)���>i#�[u\�8<b��i\�v�*B�;s\�]Pb\�\�U�����k\���3�\�Mk\��u��p��\�q^\�	�\0`\n�gk��G\Z�\�P*�)Mɗ\n|�Ս�\n��\�e��)\�>�il��Ғ`\�@�J~\�犬%\�)pps\�Zfl{?\'\'\�Ui\\.s���\�\�Un�!y=��dN\�\�:�Q�\�lp�\0;V>��w!\�lP�P��2�H�\��b�\�\�X(\�qJI�\��\�g�xC׊�\�h�b 1\�X�V\��f�11\0�L;QpH\�i\�V;Cq��l\�\�3��\r��1.\�6Ơ�G�l�\�j�}\�8�3\�Vj^\�4����8?ZkO�W\�rEQ�U\\\�\\z�\�P��g�{\�<��\0��\�EV$�aޜUc�\�\�#G��5��p\�\Z�\���\�|\�R-,��9�K�3���r*�Bg�Z_�\�1\�*\�|�*�����\�\�\0t&��3h\��\�U�\�+6,2OSZQ\�p75uA�I\Z1���j\0I�FX��Tp\�B\�\r���,�\0�WrMwA�\�c�\�\�m\�<�%3�jB\�t5h\�\�z_� B�O5\�a\";Y\�\�$WKى��\�\nɍ\�fP�&9䊕a�ڭ����\�d\�L�\�7\0b�\0���8�O<�\"\�W,\�j\�\� $�QZ&C3t\�9\�\\\�0(�;9<\��	\'=�j۲�J\��\n�\��\�kD���.<�\\����\�q)�wcޮ\�*(DD,\�pI�5��\\\�:�p\�Da�C\�O\�\Z\��\\P6I\�ZC%\�`\�!�+�FI\�p^qRE0�O¤�\�\�|���\�_�O\�g�\�\�~\�`�$e�\�$��flwl\�b��hդMʱA)�1�*�-\�j\�1L\�� ���aU�\0��r�\�5�`���O�.V��i.���\0�֚ifV!0{�ZV�Hɽ�\�\�_�,I�\�@��G!i����e�A�y5V=\�X�X6Y\�\�\�4˹�2������=�\�\�[w �\��I�s\�\��\�Ǔ+�\0)�cҲn�k��\n\�n==�Ү\�泌8\�\�d,�ܾnA)�\�\�TJ�J�Fy\��A\�S;G\�ի��Fޙ\�\�\�e��\�\�6�>1X�\��/��GO��b�檩\�\�nv���\�?t�w\"�X�f��\\30\�;\nʞ8�vX�F����\�\Z*\�) }i��\\Gj\�.�ֵ+\�\�\�\0z\��cxԹ\�M��<`�ʸ�1u~q\�uRFfM��5M\�9\�yS�\�T\�9\�BXfH��0A1|�\0�.P�3T�\'#\�(�fK��v<\�%�v|\�i�11#$\�1�e\�+\�0J��\0�\�\�sZS¡s�\�t٬�J�\�\'\�+:V}\�j��W\�x���ؓP\�ReG|:�C\'!�\�R\�71L`F�E&5�J\�5eX*�v�˻5(tU%\�<T�s9�&(�<\�\�.�\�A5�$�7\��}\�k;���8\�ր�\�Du\0\�v\0���eI��&�x\�@��\�\�NsT\�+9l�]��,�&:\�\�!\�v�s�zc_\�؞\�\Z�\�	nsOq�\0�\0߳o2 *F3[6Ө�\r\\\�q�|�:ִ�\n.+\Z�w�m\'\"��#e\�\�sQ�|TY\�\�F)\\e�簥\�I�\�x�\�b2A�v��&�\�@&���\�sI(fA\�֘�E#�ߐf���Q+1��sT�\�\�=\�HW-�))sWce�*~��\�:\�×b��IY\�,,\�yl��hcNYf�L�s�\�%�\�\�rG8�-��i�G9�\�\�s\�z0\�)2�\�u�K\Z�[\�v�C\�pw�cҪ\�;�&9$�Ո�\���\�\Z\"H|\�	.r�\�\�\\�\�\0L��L����2�\�h�\��Jb�ߚT�vQ�T&D�}$(s\�R\�E�r\�;q�\�<q�kh7p�T�+�S\�5V\�\"�\\d��r\�1\�*Qh�3\�\�dץL�w\r\�6\Z\�~&i\���\�I�i_\�_o��mY wA\�\rG\�\�\����8�^�&�V>g�85\�x_z~3ӁQ&ꗵzq9E\�\'4p2\� R=sM�����pݔa���4�R\�l70�	\�eL\�,*&\�H��N�i\� c��דV\�z0nr\rh\�\��~Q®4q���5Ẻ��S\�\��[E�J�\nI�\�\�#\�[^8\�}�~�+�\0\�\����&]��\�0\�p�\�L\�1S�\�Q�{���\�1\�\�>��lS\�3ޙ\�\�v��F{���\�(\�  �\���A�Pi��\�˻\�i\n�\��8\�ޠL�>ԛYH\�HF\�ө���$@\�`�\�8�{I���\�s\�4ƀ�N9�5�gDu\\\�4\�=;珡�\�\ri�\0\�\Z\�J8F�z泩$�\�I\\��O[IlY�\�:tc\�5j?\�\07��\�\Z�\�+8�6��1\�W\r��:kƖ*w\�\�Xk�\�<W\�<?4)\�v�\�^H\�=+\��I:����:\�\��p�\�4\�\�s	ÒV\�\r\�Gj>R�\'��Jqߎ�Ԉ?�~�\�\�c�\�{�=\��\�QI��\�;c\�~\n�\�:��\�M\�\�9=�q^ZI\��\'጖\�\�`�\��\'\�\�>\"n�p�3��?È2\�\��<�œ\���\�\��\����c�\�L��d�D\�~Q����e�g\�\�\��]��r�`\���9\�=��\�T&�/L60k\�v�9��j��O�\nFMr����\�\Z�=M.\�:~4ң1\�\�ڶ!�1��\Zv9\�zN�\�N9\�\�\� \�(�w�9x�a�c4ϗ&x\�\�g9\�\�\�@��W\�]���ſ�Sԇ�b�����A�,NM\�/\�dVRv@ax�O�Ӧ�>He\���\�.H���\�?�m#�Ws^VN\0�ވJ\�Pۥ\'#�y9��JFy\�y\�Q\�g4\�\�w��\��\�\\\�-�}\�\��=5!\�aR2T\�^!�\�\��[��y\�?�}+�i�\�!p2Fzb��#)+�:�Ft��\�0#8��\�\�RBd\�\�\Z\�\�\�W2�a�k\��ռ\�\�v&�7{�b��y4Ҥ-?-M+\�sZ�G\�+��\���Bϵ�\�s\\��S]��\�w��E\nv�Ԏ+*��Zn���Z�ȽS\�8w�\�\����[[�o\��շ��\�ִ/<7e�\�\�\�S\��=�\�ٵOj/o>Z>\�خ{כ4�\�	�\�av\�)<q\�\�i�ɕ��q\\f��C�B���~���d)\�\�F3\�\�[�3h�\�g�\�\���.G�Jb̅w3�\�M7ʷ\�3E\�\�ZxO�\�O\�jf\�>�5c\�I7\� #9*}MGh�\�z�Uqr�\�Xepz_ny�^���\�$vnղ$FP��\�%�[K��\�zw%Ĳ��b�u��\�(�\�\"��e�\�?)H\�sT\�%\��ϵ36�K�X\�G���\�j\\M��<�Q\�d��#gճVP��&�\�-\�ipI\�JP�\��\�G��\�!��\�2*e�<z��rЄ§q\�)<�\���\�HI?/^�v��fݖPFr0jnZE2R��\�?\\t�pH�9�y��Ȩ���m9\�\�OOzO����`3J\�X\��)$\�J��\���\'\'9\�Oˀs��{�j�S\��(Lv*;\�\�9^b�\0�\�\�U�,�ۓ\�:f�ln7�7\�c�^�i\�V(�ܸ\�\�\�NF\'�\�\�Ү�&v�5(\�Y���\\\Z..R��\\n1�CS��Uʐ\�6�W��; $v\�8�V$O�j.U�\�Sp!��� Y%\�Rñ\0V�\�@e>^1Qgt�\���c�h��1$�o0\�PGg���V�>?w��\�9�5ԋ@���\�Q<f.��\�\�dQrY\�I�2�����=�]�s�\'�Oֺ\�\�\0z�\rI!�\�q\�E	�)ʪ}\�P�^q�|Z\�\�:��?ϵn�1�p>Pq�u��3+\�+&8\�m0�V;v\�!�*}jE�\�\�w/XA�\���\�NjͼsF�\r�H\��*�-\r���`Fx\\Ͻ`ϧ� 9%wp1��9-\���@�\�Y\�\��|\�\�\�U\\��K\'\�	{�ϵV6.0��\�#ڻO�!q�\'�~G�H,\�ޭ�\�}\�8\�qSqr�ǝ�<1\�\�\�Sۉ\"@\�\�\�\�$�u��m%@�\�g$T�\�PXێ\�����\\9NQm\"�wFĶr\�x�^&@|�\�G\�3\�\�WLl�\�.]Xs�\'���\�Zګ�\�_����=\�n;�S׌T|�ڤ�\�.\0\�Oj�99=�\�^��\�\"�0=\r\r�i\�#4����*1Ӡ��\\a��g5�e�Y�Q��\0ns\�Q�h\�܈\�H�u�\�ZHaPKO�6��lS\��\�\�Peم\�\�\�\��[q\�q�E[/C���rj�\�\\�<���l��\�0;���\�m\�\\�@\�ZE#\n0{\�ڨ\�p�3v�r5�)�F�\�K�t�ǥq�G,#���\0�\�Wp@Q�c�:Wl�G\�Y�\�`c�8�#3�0\�\�\"Y�\��\�\�\0l�C\�s\�\n\�I\�`\�ǹ\��Sh\�Y�EP1��\�+�\�\�31\�\��\�\��\�#@�X��!#ɒI?��nKh]�X\��p+Ӵ\�c�k\�\�QYNcZ\�i\�eo���\0�\���|��T���\�\�\�\�\�s�̵��\�$�\�~>�==\�tS�ļ�5Vʒ\0\��ODW�Q�1�p��k�1����}@�G�[\����⑧)f\�4rK��3W␷\�\"���}j��\0ǀ0q�R\�\�E\r��Y�J�\�T\nd�y�>\�I\�O�^kL�9�s���׎IY\�UlWX�\�vCA\�P��\�\�5Q\�4����t ��\�*����J�3�q�r9>�qg,�\�t\�\�.q78\�rM\'<v�\0^�\���8\��\'�v���\'������\�rm\"�f\�l?\\d\0(1� �r;���Ar�\�C\�v�cU\�\�\�\�\�[��f�,T{��\0]Y�BYw\��\�O\�V\�\�2n=\�l��=9�ϧ|ҹJ%��\�\\灊�G#<v��|\�*0O\\��\"\�\'��i\\|�:�y�\�<�/QޭI\�q=y��&\�\�g\�f����b*2����\�L\��\�V!v�ΐ�\�w\0���16)��\�\�ubE�F1۟CH�pO�T�@[>�is��\�\n0\�)����ƞ\n\�\�\�)H]�s�\�\�\\,Wu,���\�A���s\�Zp\0#�LR��\09\��)!�\�3���20I\�k\�\�#ǥ\� ���mW2)\�\�J�3CFM6�~A^f5\�݆�\���Ʀ���޸\�=��\"l�\�ֶ�⼳�\�6\��F\'ҧ\n���T�d�sN8U\�^٨�f}\�R=\�ћ�;��3�\�\�f�3\Z�24�\0�sT�\�\nblw�Jq�\�\rU�\��\�b�F\0Ᾰ�Ew�F\�+:x����u�Ƣܠ\�\�\"��c$YH\�\�8\'����ģ5�\�3�\�\�Ȩ���f�\�\�fJIʄ�\�f	\rǿJ\�P\�c#�f\\\�Ŀ%��Uɰ�ux�/\�n�\�R[\�\�@\\��ʊT��J�\�5\n8��o`K\�\�ndf��\�n	\��?%�\�\�*�\�)]\�[k5�,C)\���F\�\�\�M1rF&�\0\�0�I=3\�j4N{\�Of�8\�;�+Fl��\��>(�������\r\�S\�55I�\�&G\'=�\�m;K�<b���\'pj\r��z�ZŒ\�2Z8Q���+@N�\�G\�U�r\���8�LgÐN?�t\�F���Ɍ\�&�-�NOI\�I�\�5jf$\���\�\�yD�\�Q�\n�5f\'2�b8\��VȷX\�\r� g���H\�P0亻�G�>\�ԑM!B��c�j\�{dv\�\\�S��\�>d\�y���2���X�03ҥ-p�⌱\�}�um\�P�^�T��H\���f<z֩�\�W�1�G\�}\�H\�\�i6������\�\�\�mkKEV�\�9+\�Ux�e�.�\�\�rKdZ�kl%���\�[Dͣ:%�\�Gn1\�V�6�0�䎘�Z��\�)?���P��{\n\���\r�$�u#&�m4\�\�,�2)\�sި\�	\�y5��NH\n8\�V�\�[\�-\�)=x\�L\�h,�#�\r�z\�K�\�\�.��WEko��`6ҙV9h\�\nd��\�\'�}i��LEU\�\��\�]�V�QoP�AU\n;qɮm��T�\�Cc9\�\rRac��\"��,��1�����Y��@\n��\�>�柫\\y\0T�3�\�\�\�\�+��>�Rχ�0�>\�Wle*59%{�����\�<�F�����\�\�eo�\�F<ҭ��cҾ���o\�\�w\r��*x\�\�\�\�$Ӯ4�\�m\�,����~m��4\�b)W�Q�\�qN2�\�6�\'݆V=lX�\ZSA\"��ɒ=y�v�\�~Z�	\�\�b9_Z\�Ե\'\�E%@;F8Q�+�ҋD)���\�\�,2�ǹ�U�q�F@~^ƺź�veC�<m#��j��\"H�\�T�s\\ӥ}��T�¼�\�EU�ť���,z/r+�m%#��$*m\�Mb$K�9�?ƹ\�\Z��=���\nm\\\�k�G�5\����\��]\��n��5\�8,�\�\�x\�z穇i�©ź!\�\0ɬ�2`�\�Uwa\n�$��\�a)1�\\��͔\�za!�F+\"iV%\�]D\�_!c�\�X7\Zs�\�4�ck��\�J�j�3)U(\�Z\��3\�GҨ���\�\��f\�\�\�\�\�A\�\�=��\�O^A���\�>Ք�i�H�\�銮�ڝ*\�\�Қ�H&�e�g&\\:|��ΰ�\�d\�c�ZF\���&\�\'i�\�})��u��Ix��&���jr��9\�v�s9U)� v\�M*\�j�\�q\��i�6K\�K\�\�kGp��s�\\9P6�\�8ȩm�\�\r�q�ҁs0\00<b�`3ڥ�\�7�Lh�~6\�\�8�\'��ٷ��Y0��\�M� � \�\"\�>^\�Gp\�)V\�P)r.\�\�ԢF]q�<\�\"[4B�Q���\�\�gu{@d�s\�>;\�t�0y u4ɹ^\�BA	��|Ƣڎ<�\��\�1�fH��\�v���\�d\n\"� VYShā�{\n��d�(\�yl�qV\�`\�\�\�\�*ѕW%\�\�L\�^! |ǟ�IHT0��j�\\3)P�sңD��6�B�B��Z+\�78=kU%��d9�_h\�\�*gִ\�\�\�@s�w\�j��\"\�\�bï8�ːX\�_H�@\�\"�1a���\�&dn�s��|\�7��\�SO\�ʼ\�M�Y�z�\�~\�[WYc�]C<C<TV�.\�1 \�2\�WPӠO[\�m����\0\\��2��p\�/3潓\�Jւ\�y\�\�H���5\�\�n\�\�G��FIC]8I^��ˉ�T\�\�R�\�?��\�`\�;8<���c\�\0g�9x#�\�\���\�>�W���oK�\�\�,�9��b\r���wd\�\�k������.��	\�\����+S�\�t\�4\�\�Ϭ���j�q�ce�=�8T\�\�Ս��\�U\�w=\�\�MZ$�r���_\�\��\0c\�\�\��\�)\�G=�_i(��u���P7x�R\��\���W.����<\�m5aS�h���\�:�\�+\�8,4d��rM(\�\\�\�J��>��\�v���xSI�cs\�\�Mq�\�\\/�&��\�\�8?1$\n��\�\�1�N\'AQ�b�@nޕ�\�\�\�\��4\�K���֌s\�\0G\��\�_\nl\�Z���+AGՍyq$0<c=M}��3�s&e���\\\�΄�}�49\�\���F:\Zil�֐1#\�5�n素�y_\�%V\�cf\�/=�zW\�$�\��\�Ĩ����)Ƿ\"�hq\�\�\�`%z?3\�\�F\�_�\\\�4�GR1�Aǭ\0|\�W��P\��zC�N��қ�\��\'�\�\�_F|\'�)|=��+4��^k\�>j�\�SM�6\�k�d�s��:0\��\�[&3�zTw���\�$;&\�}�\�fv �zׅ\�z��G\��]rEc\�c\�:�Y5\�.q�^��>�ZIdȀ�¼\�v��\n\�B��[J��Ƙ٧�ۆ\r5�\n��\�1\�\�JF)	ʚA\�7P\0=1O�\�M\�M;\'m\0 ��=i8\�{q@`;�H��<P\�8\�\�^\��\�OQ�\�a�\�\�^ 2\���߅m\�\�m#��k�\�H$\�\��C��J���\�^\��Ā\�L�\�}!\�\�mq�\�R�b�n�;\�\�чw�\n�\�h#4� ��!��>�ÂA�u���q\�N\�w\�9�\�\r\�\0��,C�{`\�^�\�Å�do�����د>��t�-�\�\�v`{�\�\�ϵP��*����\���\�\�g!;W\�\�\r�\\g���<N\�4k��#��v��q��ⷣ�]�;\�]��\�\�d��c�3[��{ע�0\�.9l�\Z�Ёڽ+�(11\�W_~qX\��Y,��>\�\n�\�\���F�\�\�\�,���\\r�\�n|�/E=}@�w�r�1�\�Z\�e\�G\��ϪxKPtpT Ìp\�\���k�Ô`s���\�\'�<?o�[�8Y�;\Z�i?��%��ҽs�X\n��tBGгC(��q�����ʒ�PXw�\�|=\�7S�RF��Stɮ\�!���pA�\�\�Y5cd\�s�jH�Yv�~\�j,�\�\�\���N0S�?CR��\0���JEX\�̱K�#���f\\ a�����ڗKD}��\�AR\�h��z担�>[RO!�\�\�P��9?7J�7Xx*8�P�0\�~\\t\�>b\\N4ۭ��x\'����K�\",�a]Hxc;�\����\��y2)�0\�9D\�\�\�Y\�\�JmZ\�\�\�p1����\Z��R��gǭW�\\�ٔ�\\����Ƒ	\���3�\�kFm���9\�U\�]Ӱ\��B�#��z�\'���eXӍv\�V\�9\�y\�K�w۸�\��\0\�(�\�ȡ�\�s\�\�)�Wo�\�.Cgސ�j[�H����rv\�z\n\��gQ�\Z�1�@��x�\�\0©\�g�\�M�\n��\�\�y\�g;�n�\�\�%\�v�\0���~k��[R\�\��O�D��M^Y\�nϯ<UC>cl2�l׊o\����Fx&��\�60\�7u\�sW\�h�\��?��p\�\�I\�ӱ�7\�\�a���7�j�C&�s�\����H��l\�|\�$�y\�z\nTOv�T\�_\�3\�F1�\�Dk�\"7\�y\��{W���4��\�~QٰXԿ\�\n�o*c�\�\�-P=���F��k�9�\�[�h\\��p����,�͏<���ƙ\Z�\�=pE5�G��\0\�[��T3{dqM��V�\�HI\�\�|g�J�\�g��g�\��b\�O��\��qӡ\�UȌ�J\�z\�5Ӕ�\�oS�̛\�X,d��=�*	\�p�|\�\������I���{�Դ��I?���1\�\�����\�\�v�\�U\�;\�U�\�;d�yf>��\�+�\�3\�B\�:�\�E\�2�f?\�s\�w�*�爮K�/�=W���\�\�̓\��\�:�+]t[\���\�Djy\�\�-\��\�)+���A�S�\�&T�ܟ\�^�\'�t�(g��\�\�\�\�֘t;\0�<s\�{�.����&��+��F3�*����_N��`�f���\��\01]L:5��oTʷb;�G>\�v\��R�:��cp�g&Cc�\�&D�H�ry�j�D�\0y*�\�9#�5��!��z`�\�mo��\0H\�\'�}=jZ3Sf���\�\'<��p���zƧ\�Rl�\�\�ҽ\�+\�\�\�=J*FO�Z�\�/\�Pm�\�*H�\��NqA�S��q\��\Z�C\Z�\�\'޳l��Jn<1\�\�۽1\�\�\�x�t�N�7ҪLt9\0w�i�w��Es\Z��oQ2\�\�\�ҝ�%\�6\�b�\�\�\ry\�F}�GcБ���gU*w\�}\�\�L\�rX\�ol��#&2O#�:�\�V�\��X�l[(\\�Np?�\�\\\�;c\�\�{r\�`�*	�>�ZKKu�w>fG\�\0ջr�eU0�Q\�\�y4���I%�{�\�_A\�T�K��b��q��py��^TH��^\�&�\�N�[�\�\�I\0\��\�z@I%�Q~T\�_\��f\�\��G\�E�\�\�����\��\�\\�\�|w\0g\�{��\Z\'��\�\�o�7gs�+�ی�\'��tD$\�L�k�\�Z\0\�A�2y\�Xzϋv1��-ǚ\0\�H\��\�(pG�<\�z�q�l�\�H�?\�\�5:J�Z\�ĉol�\��Ny�\�=Mb^5\�1�s\�ʎ�޻+_Z\�́�Fx\�޷�\�\�j UdT\�)T+h\�C�X�q\�\�Ԛ\�7��<\�\�޳�~��J�C1�\�܎�\\\�Isr\�j�O9�\'�\���*��R\�\�D/\��f,�	��rs�3�\�s0=3\�\�ר��be6IE\�}\�\�S�T�=\�J\��.� 9l9\� \�\�\��*¹Q\�O<P\�˻,23������\�\�+\�drOS�ԅ��sJ�\'���\0�\���W�\'��ZD&	&��\����\�Imp+�\�\��G�i;�\rڛ\���\����MM\�c�X\�V\�:\�\��\�\0H��\�ӃP���4\�+Z\�?:yV\�䑑��*�\�+�5<Q�0Ns�M���n�s�\�#�9I������b\�nl�X\�\�-<\�\�\�\�r2+��d{5G|�Y*���\�dq\�%`Ӏm\�����Pp��sӡ����0\�\�L\�\�̀g<\�z{T\���LB7���jL�*H\�C.&��;\�^@\�s�޾�Ґ��\0\�v��K^F�Ke�9����\"\�\�\�\�\�7GvfU����Wu\�͎k}.�\�\�8ɧ\�D�6��\�cnNvs܊󎢺\�ȩ\Zx�cxQ��e!�ҩ�\�~y[=R3f�hۣ�}i\�\�����(l�ǎE;�6\�+�ƭ3[>��n\�b�\0ej9�nOz��$\�\�nH\�\�.�)<\�8�m5@��..55B\�U�\�06�\�\0����\�F�c�FpN)�4\'�=3@�7�~uP\�X�Y\�T�Ͳ�h��L\��\�sL46\�g�c�	�u�ɇ\�Ԧ\�1��c�;�\�\�L\���2\���A��I��^P�R�@\�0�\r\����\�`\�Y�U\�K��޶dԠ�2\�M]J\�\���qV֗߼~7��%��{T�sR��Ԟ���!�	8�q4Q7e\�\�\�9\�:;�f�8\�\�J����ҋ{|�\��\�b-!�Kg\�b�3�)��\���>��y�	�\0�\Z�\�d\�@\�j��ɫ0Ǟ�U���\�0*F�N�.׊���\�[\�p\�ֶ�U\�\\�\�\0ǥq�Y\�c�^�<\�5lP\�\�+�2�Q��F@\�h۠ f�!%��թ�@\�	\�&\�\"�8�{\�\�su<�YѶ>\�U؜m\�\�	��#� ��`�e�;�U���k�,\�Q.�,@\�{�\�b�#¢(A\�ȉ�\�q��)�]f2E�r�Lh��橇�\�W\�����G\�[D͡�X�\nІ�\"q���VZjf�1lA�OREk��l#��yc��\�\�țE�\\���P��{\�=\�\�1w���i\r�}���\\��c\�\�2\�\�\��랕�d�v��ޥ�\\�V\�c2H\�\n��>\�\�\ZՆ�\�i\��m�ΆI��S�=��Nծ	��;Nt\Zf��k\�\�\� TQ�g��UԚ�Ź)Jv�u�K��=Þ�R�s6œ&/S�����\�����z���(Q����e&�&����\�a���V\�\�\�X���8\�3�F�sT�\�\�gn����\�tr:���C�	^5���\�S\�\�k�k��w��\�ӵ}{\�m\�7�\��<�\�\�\�!����	j`�W\�W@3\�ϭM,eeΓ~iX%J/fx=��o\�9v~P=\�\�\"��E������q�\�O�xDx\�\�\�R1�\�w�k\�u\�2\�fxݑcb	#�}\rl��\�\�\�v�\�\�\�R��q�V\�\�Q�����\�o\�\���)\�L��W��k�\�^�E�[t\0�P3�\'\��b�*Ihcm�c\�`\�)ӆ\rMr�^>d\�Զ�8�WVّ�����n?\rXOl�U�0$�Mv���\�\�N3�/\�\�Q�@W3-�\�h�w`)\�<W�	¢�Zh\�wF[\�6Q�/\�\�X�C�ǵb^\�=�4.{\��=륚	�����8��\�Kes1u|n\�1��q@�\�Jh]-�ԝ\�V>\�W)s;��\�\�^�&��\�C2F~��n��$S&1��#��\�+�t�7�Dr�!\�y-\�Vm���\�0k��J@Y���\�á\�\���F\���\�1X�rf�h\�\�Hf8\�\�\Z\�6���X�\�\�]|�7(In� �\�YR\�K/�?\n\�M�0�\�O�\�c\��`\�j�#�\�\�qn#��;s���w`2:��\�EpզuBGȘ\'*�û�ɭ�j�����\�$t#[Da�\�j,�F`�Ҵ;0j���\�z\�E�sN\�8�����MtF(\�U+h�\�]۲1�\�Ymi8e|	\�w�����\�ǵd\�\\�9�m#\0=\�\�9R\�8\�\�%<b��ӊ��!�\r�<\�|�+\���\'�$�O�j\�jPI��K�d\�鰲&z{԰��ۈ��+H��y�m���e<\�\n8��������v)ʚ\��z�i�@䞦�a�3�7�q�f\\)\�\�F\��RA\�\���\�\Z�`\�E�#�;�\�\�6�Y\�{Vvc\"�A[2c8\�U�\�$��4ɰ�\r \0g~ZϋJ�q��\��˹���bA\�\�\�C*\�	�\n�p�~���dl�~Mi�\�⳧���7�\����v��\�\�\� Ԗ�ǖ\r�\�U�\�\�ӭO1jE��Z\�VNrrsWv\�c+�X�%|���+mU\�4��\�p�\�t\�^4\�+\�C��^\�kñ\�u#H�-\�\r�k�d\�G#�,h\��W3FP\0\�M��Pĸ\�L\0֡�!\�C\�Sq�\�iy\�L`NI5��\�|SwI\�0\�\�3D�\�?)r1���\�,:e�\�e\�ϡ���+\�~+�\�Y\\m\�t\��\0\�!\�sb�\0�#3���׊3��\�A\�`�9��[#\��\\\�\�ݬ@\�pi\�⃜�i�N3^��\�\�M\��\r�6\��\0㸯S�Q:�\�~\�\n���\�ƻa\�\�t\�\�C\��F\�/0Mu*\�Oa�[i��\�t��\�f�U�D�FC�+\�_�!\�F8�\��\�6H&�O�B?j`�Ň\�^�V��/#\�\�W�S�<�j:���ڕI9\�sֽ\�\�`:sA<(<����\�Ҙ\">�\�5wm\�<�p�5�e\\\�[\�:\�2��\�j\�ꩩL��#\08��\�m8�듟ƞq\�<b�\0\�~�\�s\�㊤ /~	\�0r;\��N(8\�\����\r\�㯥}��\�d\�\�\�|\�\�<\�\�\�_�/����\��+3�K����\�=�ޗʑ� �z\�\0��0�( �Wϣ\�\�p�+�nt]F9p\0��NGJ�1�d�9W\�\�5��>�xx�־\\�û6\0\�5\�\�\�\�~����:�\"�Q�j�x=\�\�c\'9�\�\�@�\�ҽ$px\�q@\'<�у�r8��)����#\�\��\��\�+\�~W\�_\��\�3?\�k\�\�?��G^���¸L`\�ʌA�?N\�$`\�J\�Q\�3\�\n��\�z�\��\�vL�\�\���ls^+�_c��\�\�-}ễs\�\��\�+\�,8\�_A�Ϛ�]��#U~c@&�\���`)�rMz\' �\�\�9���\�)%���\0���\�\�ғp\�Ҏ��\0㎂�q\�Ss֜�)0/ip�֥i	\��+\��~Ďx\n�ϿC_ \�C)� ���h|e%ǅ\�\�\nΤG/?�aRV*.̟\���>l\�`Ts\�}�\�\�I\�5f\�\�[�y$o�$\�\"\�>�\�\�V	>b@\�\�I\�q@\�\�4�.kbE۴\��WA\�Xn��\\a�W:O?˽t�\���g�u^\�Vsْϩ�\�\�g>\�v|l\�Y�t�\�pOQWn����\�\�H\�|ZTh��l\�P+\�)dvw\�:�\�_J�\�i\"ќ��\0\�_5O̬8\'\�k���W\'=�\�y \�O$\�h\�\��>���\�=�z��w,L7cs\�c�<W�rsɯS�*��S\�2\�1YT؉���� �\0\�]�\�\�߃�\�\�V�\�-ŨF\��p{�\\Ĭl��<�7u\�\�M�*\�=y��h\�:�%.\"�0\�\�r*�s�0��j\�w #�85\�,�-S����3\�sn0N\�\�T�u\�gNL�(\0a<{�^\�c\�sҙ5��\��lc\�z��ټdy��\�=F �h�\�,\�[Q|@��!#��Q\�qZ��\�\�ڀ;v�\�|#gh����\��56+������.�(\�Z��\�\Z\�\�\�w�r�q\�R\�v�\�\0灜�\�\�C\�\nGb�\�\�.�/�\��\�[gV���u5SZ\�/b�\�:~?};q\\��u�Z��\�/N��i򏘳�-\�ȋ\'\�\�5\���W��T�Ё\�\�\�w��\"Yv\�\�61�:ԷcEvysiZ\�\�F\�m\�E,~\Z\�v�\�GA\�ڽLD�\�9\�?Q\�U�:_\�1\�9\'?�(����=;�ף\�@\��1���.`85�|N�3�\n{ԫ\��9\�_^�ىpNzc\�\�@h\���p�rJ�xgM\�qГҺQ�>��\�ނÃ\�-҅ �\�\�\�\�;ɑ<���(�ǥpW>��\�\�v�!<��\�\�H\�<�\0*�^�L��_j�6��\�\�76�\03@\�\�<;VAEq�l��\�+\�6D\�\�\'\0�O\�k��\�hq��p}��U�rG\0��3܌\��\�NU\�\����\��A\�\�4�t\�{u�֪GBD��X�\���8l\�\�\'8��J\�\��\�g�aOWON�<䚡�\�;`�d�1�`\�\�����\�>�\�\'c�����Ȕ�F\�U�0���=\�1�l\��\�<qZ\�\�Z�\�1-\�\�\\z��\�\�6wvW\r\���\�>\�էs��C��\�|�YK�c\�\�\�ֽ#K\� �L\��88u8�OZ�\�\�@pNO�]�����Ycb<�sD\�\��w>��8\�<�\0��\�5�C��Vv��-��ɏ���t�\"�ʸ`P��ϷZ\�wL��\�\�I\�q�8\�F\�\0$+\��\0fwg�\�E\"\�$dg�И��.N\�\�c\0��=���\�FON��\�F9�\�eO͟�=�\rS���\"�\\zd6T%v�B\�T����\�\�t\0\��¦i�\�N6�q���Ҙ2\'p\�#҄c#f\�y�}�c\�\�\��l�\�=���\Z\�\�!��\�{`t�y�H�Q��\�3Ta}N�7\�H\�N�OJ\�߽�_�x\�5+J�1\�{W_0r|\�\�%s�\�\�i�b�k��\�\�\"���A�s\�95A\�hy\�x?��\�Y\�\�,�*}\rT�w��2\n�\�@\�\�\�\"��\"\�\�\��W\0�>Կi�x$g����*��#\'\�Ϸ�5/�\�gp*: �V\�\�m���ے>�\�\�\�Z\�L\�\�m>��\�]�ݬs\r\�J��I���A\�\0GJ�\�\�P�3b�����c\��5z/�\0q\�9\�P�]\�\�F;Uk��Dn{|�����(�5\�̷\�\"0\�\�\�\�\���r�Q>F<��D�W*��y<�\�\�!��\�Uq4]�͖\�bp\0�\0\�f\�+�\�Uc�\�ֶ�1\�sJ\�E�\"�!9>�\0��>Rަ�c˜\n�.���\'#>R\�Yw�A\�\�R��Lw\�\�w\�\�\�=jCxc���׏\�*�Q4\�2\�`o#\�\�\�\�aL��k%o$\0�߿5/\�fyz�4s\r�\�Í�@9\�ԊR\�zT�:m��\�T䑛\0�4s\�<ˌ�⢚X�F\�~��H>s�1Pc	�\0��g�\�\�8\�4�\�0\�=x�:,G\�\��\�^�⤺{]\��p\\W�\r�@$\�\�+�����lG#��?��k�\�X�\�8\�R\0\�B\�7Oʚv\��;���R>�\�ئ\�\�!H4\�\�*�px4\��#(\�sނ\��\�͜�zf�����\�1<��Q\�\�\�l�}=)[v2\����X``��2y\�0\�69\�;\�{R.F�\�ei]�\�S\ZHdyS���v\�¶1��U`�� \00j���%B܀çJ\�OA�{N�Ec�s\�y���]O\r\�\��z��	#k80yۂyG�a�\�1\�v\�%\'�\�\�lp �9Q�1��s�t��\��\�cҏ68�\�9$\�G+�\'o�q��\�z+ds�U�zP$]\���\0Z�\\��r=�L�`v=i7�h\�|5l\�[ar�\�\�r+\�\��)\�W�x\0n\�ʟ�7s\�\n��$A^6.w���U�H.����\�-)\�2=x4��\���e�\�u�\�˸c�׭gB��aR�!\�|J�`\�ѐ\0�\�]4@	w)��\�\�_�\�\�j5��ь�ڰ�9\�gԿ�\"q��\�;x5\"x�\0@bC]+؊�S\�\\|\�vI\�C%\�\�9\�\�W\�\"f��\�\�:M\�\�9\0j\�:���\��8ϭx��o*]��0Olu�L]B@�8\�q޲�V/nz���+�(���\�\�\�#ϋ\'Յy\�\�#Q�(w��N0y�S\�\�7`R�I\�\�\�}z\�:i\�\�\�\�l$M1�\���yG\�\"��&\�\�\Zr� K\�w\Z�V�\0S��x-\�\�rG���=�x����q�8����)�E\�F$�d�0)��k��~\�\�<OֿT�\�X�vg֤\�GQH\"���+\�K\�1iq\�z?\Zk˒/d9\�\�O\�u;���3\�o	q*�Y[�\��Kx\�_,�\�ȫ��3W\����\n\�\0�\�\�sC\�T�\�>�m2չe=E/�m��B��T���r\ZT\��VG\�\�P8\�\��?V�\�=�>\�gۯ}h�΃\�\�ҼY>*^��	5e>)J�\r�Gժ�\0(��?\�=y�\�~�\�-�\'\01ǽy��R�.M�\0\�\�q�SL����4��O\����ǧ!	ݓ�\\整�p2\�>��\'\�-8�-	\�ձ�3I$|�R\�T�F>xwGg����&��}�Cu\�zW�\0H\�e\'�:P�tye\��P��i�s�V�\�\�4\�sĄSಹW Hݹ&���AN|\��c�\�\��\�D��\�\�\�Z\�2]-\��Gh�7\�\�灊Ҋ\�\�\�I\0�\�W?o\�\r�>н9�<]��\�Pb�`�ِ\�o��\�v\�\�ޜ�z��E\�>�Hx�Iڸ����5ji\��1�ƺ�̺3)$[��3zg�H#\�Np���oi~fϴŞ�\�L���\'��\�]00�$��Vߗ���z҅u}�\�Z[MF\�P\�\'��\����o\�\�}}��\��E0/\�,ʫ\�\�RjD\Z�>irFzqS�\�f����ֵ\��!\�e�\��[Ř�sw[�v��EH�\�˒\�a���V&�ٙq)\�\�\�jPb\�\�\�@�S!�\Z�F� *I\�\�\�\�\�`t\�}Mk\�t��������\�Є\�9R{\Z\��[�\�n`O�1�\�\�\�_�ūj\�[A�\�X�c9\�)��]CP���-.\0=	=ϰ���=\�C����iq\�K�[���\'�Eiy=�t\�\��\��{k�\�ȯFN\�\��-��|Fc}\�7V|d{װOq\r�4\�rM6\�\�;�T#9\0\�ӊ�7k\�\�c�R�\�6�\05O7t�l\�V%��o\��Ӭ廴�\�N�I\�Ez\�dV[�̛{t+\�\�ǇǬkZD��B�ˌ:\�X��mN��P���H\�\�z���j�7�:g\�|q�j\�W�Z�pd��x9!�d�]\�\�a�E�r\�F�4�\�ƭ�i�U�\�Ĥ��P�Z�\'���\�%�X��\����[o\�A-\�<jFPdt\�Z\�D<\�`�\�A\�g%9�\�KI��wݓR5���\�\���-ġٿvN�\0�%Q�@���\�\�:\��e��(\���\�9����\�\��f�0\0��V6�{�����\�D3�0s\�[�]Y>J\\�mL�����\r��\�b�E��\�,T�U�\�\�\�\�<G{c�\���ͺ(�6W�\�o�Sޫ\�o�\�\�\�\�y[<\��A\�s\�TM�W�\�#I,\�\�l�\�}I버*)�T�\�\�DM���c���O����	��S\\\"�w&pF+����6�\�*]\�+:�ʀ��\�\�*���g��=�k�N3WFvhd��� \�ٻ9a\�`\���GdU%�A\����t.b�\�9\�p=\�5v\�8<\�8\�i4Zl\�.��s��kn\��\�oγ\�\�&q\�9 ����+��/�\�UU1�}��ç\�D,�ci\�k�t\�o	s0�\�(\�:ⲍ\�|\�y#�\n��N�\"�3׭b\�go�y@6�\��\�i���\�\�ӻ���	&�B�E%�C�\�͔3H>A�>�3U^\�1 %G=\�t�gLfp�\0i,�20�\�j���\�9�\�\�\�,���5��p��\�3\\u\"tŜ�^�>\�����~I��\�\�\0\\*��p����&��\�=\�g�xP\�0���y\�+�V\�r�J���\�B6��\�F��ԙ��\�K�̦v�֔\�\�U5������\�e\�N\05:^v+\�+`[\�@\�cqNЂ\�c@�s�(�\�I�\�5�-\�\�A�^�\�\�\�89��w�NW_��\�6���\�d#\�WB\�q	Q\�U\�\�\�nG�r�\�\�j\�OK�b�\���l\�\�n\�@`R����N&o��\�$��)�\�y�ⵡ�M�#��o`)�٘#Sud��nf\\�M�\��\"\�`pi<��⧘j<��p?r\�&��Q�	gl��\���� \�\�L�x#4\\|�4��耤\�j\�Z�\�:�Mn��Q\�T\�\\�D��H�\'LӞ\�`˱A3Z\�(y\�\�*AY\�\�\�j\�\�n8�8�\Z�e\nUO?xc�n��Rivŷ\�w)\��\0i\�+0\�8>�x�A\�\�G5�\�#()�`�)#j��s \�o�\�O�ks\�+��x�C\Z�#5��S\�x��뎢��V�*]G9��^6�֚�V˟�	\�56as�x5��2mV\�ו�K�6�8~w	\'9�l�\���q\��\�s^M�\�-C@��3�\�\�:k�\n����b\�H�\�`M#�\�P�����y���\�1w�8&�Ӧ1���\�=q�E\'����`Ny\�^\����H\0E\�\0�&�\�\�RcK�r\�r@=9��\�\�/�ق_��\�\�>WҦ\'�\�T\��Q��:��\�\�@4B\�+\��\0��RXx�\�pڳ�H�=��\\\r�s�ׅ�`�c5�\�\'@\�\�ף�ϖ�]\�G><ԯٞ@a�Z��\08�v\�⾍lxL^wr:i\�1\�A\�;���Hp\�ƅ�W�x\�\�x\�2�B*\�\�\�^\��?\�~[�5D��ԃ����pGq��\� \����Jp9)�\��┅\'�����i1��hz.FO�kꯇ�<^\��VF8�\�ʼ��A�\�\��\�\�6q`V?��\'3���=�\��:.:\�\�F��\�\�J�ܾ8_Ƽ#\�<\�\�\����Fw\�}�_;\�~g\�\�\�y�m��g�׎A\�\�+\�0\n\�#\�x�\�z�C\�d:\�	��\�LR�Onk��W84\�8\�iy9�@\��Pƃ�rGoJ�\'ᅳ/���8i�\�9���q_I|9�X�31\��6q�ם�\�u\�?�zlQ6\�£*;�EN�;D�v\�=\�x#��\�Z���~m���<l1ھB\�a�.\�\\��V?Z��gb��N\�W\�~1�6�\�\�Sag,\0\�\�5\�e���\�\�GH�� \��4\�~<\�\�e�8��⽴\�41\�q\�ڐ`p1Af9�$\�Zcb�4��\��\�\�\'4g�,($pV\�Oe��GC����\Z\0oAלԑ\��\��\�\�\�3\0�*Q�_��\�黱��\r!��\�Q��pH\�AO\�d\�?�5�	�ȧ`\�\� �\�ނr��Py\�o��7\'֘\r\�\\֦�\"êY�\0�sYÁɮ�\��Mw�[�2��j��/s\�\�.h�(\�#��ZۖH���V>�n��\\\�kVt�+\�\�\�y\�sX�ϼyn�>\�\�r\��\\�,\��ӧ\�^��<�\�\�\�\Z��9$�u\�\�M\rݷ�1�L�����\�(P\0��aN7)�Y�*�.\�j�P3\��\�^E6Q\�\�$�z*ʦ\�H��A��\�W\�\�ɥ��K\�a]��&n�{W�M�b�y�5\�\�qG���+�H.�$۶�\�?J\�3�_¾c��!d\�;�\�zW��V\�{�ă�\�\�n;\nr��\�{˕\�\�u�ή��\�1T\�g���\0�Zd���\�C�\�V\r�\�8���\\�ާ1�H�\nl�8\�9\�\�6H��g\nJz��\08�/�����u>\�٧\�\\f��9��\0�\�>TU{�\\�X�\�P��ı\��\0���Fz\���y,\�R\�\�\�;b�F��G�\�\�\�u\��hٰ»�y�\�\�\�\�\�=��K\��\�\�\'��N�H�w{\�b\�\�r��$\�緷�A\�Gӷd��>`$���ֆc�\�\�L$d�})��t\�&\�]q��eh\�\0\0\�\��♜NI\�	4\�+�b7��H5;�\�\�9�2&\�98#p\�Z��ظc�A=h�\\~�\�\���Lf��8\�~j�x���\0�֗,�\��\0�\�ؤ\��S�r=sA?&	P{�\�U�\�\�M�$1/\�q\�AJf��\�|\�dx�\\}~�\�\�Z\�h\�$F\�C\�Pk\�Z@��HȨ�a�e\�ꮤg~+H�m\n���;�\����e\�Xc\�\�^�\�^hQ|\�%1a�\��\Z��\�\0�k��Q9\�x\'����0p��\�촨\�\�]�r�iCo1����ҭa�9 �\�\0�փ��!\�\"B�\��\�~��A�\�4nFs�>�U\�X�p@\�<ӚL�\�\'#Қm�g�\�:e͌�88���\�ҳ/\�y\�׶:�#,�$C\�\�rGa�\���\���8ܠ���t\�\�\�\�h.a�I\�C\�\�\\�}?�v�nH\�n�iP\0�v\��!�\�\�c�\�*\�m�9i\��IV뜃\�^\�HO\�\�3�\�)�v�\�d\��)[\�|��$p1�\0ר�sr�eX�a���*�^E*�\�\r\�[w�+1��1ӎ���Ym\�p0~f��\"\�\�D\0\�#\�\�\�U�Q]T\�PN)\�\�$\�%�`��U	!Ye�\���N\�rf\�Er�\�\�\�f�z\�\�\� ���KG�+��:�kW\�X\�\�U~P3�3�f\'R\�T`x��Cam㞂��.w���\���9\��P\�ʘ���\��Gҡ0�0`c9��_Ȕ>T\�kdLv�w\"�G~\�\���\�\�%��MĨA\�3\��\0�Ӟ\�P\�_�\�\�{�\�dȷ��ge\0�\0c\�)�Iv�TwF?Z�b_b�\�\�J�\�C�N������J�7�\�\�*�\��.ʮ<>\��ad\�cI�{� \�S&�n\�>m\�	\�םM<���\�I\�9\�ˋl\�9\��q\�\�h\�H�G�K�A+��{����(f�U<�a�5Ϧ�x��\��\�=*/���\��\�\�lͮ�G�\�\�;tQ�L\��K؄{��\�ҳd\�\�F��=s\�\�\�j\�O>\�\�3�0�O6�\�͞eM�p{֚H\�9� �aTm$2Ą�U��և\�#v\0?\�֡\�\�\"�Ve��\�\�$i\"�;I�\�an�\00\���׎\�ܮ\�N\0\�Ss;)�^�}j%��,Fs�٭��\0P���\�Y��\�\'\�KcH�\�\�\nZN�e�T�<+��G�\�j�k�\�\0���~\�N\r�\�\n9\�Vnv4PlΒq�g\r\�j|{�_)~\\u\�+`\����YrrH=\�(*�jp8\�Y:��%Sel2nf\�J�\�\��F\�}j\�E+��\�\�%\\dS\�앎7ş�\�3�b�\�>�\�\�\��ߒk\�|IjJ�\���C��\� 7�\�\�\�^�\�?31N8\�\'1\�9Ӟ\n�\�;�\�\�(\�Q�:|�1]�a�b\�\0\�\'��<\�\\�\��4\�\�\�?��\�A�^�#�\�d��K�\�$�Q\� \�q��O�\�Xy<t\�M��gqPFi�v`�\�\�i���\�\�Ӌ��bҘNG�:c��\�\�?(�⫎9\�Ld\�*�3\��S֢{\r\�\�\�N\�Jg95\���&6\�x\�\��Ĳ���7�z�\�x�1sb\�]�\�\�C�䎕>eOX�$\��v�\�\�ԉ\�vsJ\�\�D$����T\��8�zc��3m\�b[�l�X�]6�5;\�c �ɫ0Jն�!�\��\�\�\�{�\0�4�i`�˵\�\0\�X\�Z�\�q��!\�.W۷\�FP\�zz�\nJn\�	\'c�\�\\�Yd\����nˉ���b9\�:\�\�1�m:+ƼO��7\r,m�\��k����s��oS\�\�e�\�O\�J0�\0Z�5�\�@�#�5\\�m\�R	\�Ez��9\Zd2��}\rWnJ�\�L|����\�\��=�\0�����-è\\\�\�\�m�\��\0\n�cT�\�I�\�@=\��\0\�\n����N�=�S4�A\�Z/�\�ɚu\���fbF=\0\�]<��\r,y)\�I1!z\�Z�\�\�{�\�&�M\�V\�\�����\"��\�\'�k\�\�_H5;�u~\ZC�1�;Vԣ��&\�ѕ\�-E�\�P�\�&�>���o~\�1\�ri\�&\n�s��\�lRc��\'�\�L�\��\�ܝ9�\0\n��9|�i��iɨ�\ny<\Z�8\\\02M\03/\�\�qI��ԧ�zS	<�1�\0fNy\�s�\�T��\�At\0\�3\�RHW#m޽zS3\��S�3\�\�0j,���\0\n,�\�d�S\�\�X�H<d\�օ\�ӑҞ#S\��d+�Av\��?Nj�JPn_���\�*\Z��Ӆ�H�иq\�<��\01R�\�3�8\�z\�/I|\�\�ڵ�Bl\�`��!�7`�{֭�̆P�\�ɮj\�\�9>�\'��\�0N	<WM8�I��\�1�\�\��\��g�H�H��N��>	��bs��N\�B\�\�\'�Z\�b`\�#�7S�C+�Z�;\�\�rGϩ5N\�?6���p�.Ӟ��ⵌ#؇9W��Yd`�wԚ\�ì]\��y6q����B�\0\�\�Hھ��x�Š\�\�夑��\�T�`�\�#�c�,\�/\�.\�o��\�#?�i\�\���y�\�d�\�q]\�(9`0�3Q\�=A\���\0բt\�5�T��1�\'us\�\�	i�\�,�:�0\�\�܈�V$�z�Tbmvqik\�w789s�O\�s\\�9K0��gi	y\��+z).#���Z&d\�\�\�\�\�ߊ�#B\'3�&n<>#�\�?֫J��/�~\"�\�Z.�\�)�P�\�1\�����\�U\�\�ޭh�7$�\�;�]\�W\�G\�~���\"\�\��$ٜ�,1��Z\�a\�c\'ZG�iZ�\�-��t$FڢVu`�!\�:t���=\�;-~\�O���L�\�����mz�^����;{t�Q-��	�?c��\�I<\�o\�\�=GW�H�����?<C�\�R\�;W7/�^�3|��U��T�>鞷�o\�ѫY\�mp]8	\�yI�9qY�u\rm\��\\��\�p\'$f�\����\�%Kh�l0�\��PH��]\��[%:\\�th�\�\�\�Nx>�םQС��R\�ROS��Z�\�\�hw[�>����\"�׊�\�\�B���Ґ�\�Dv`���\r\�Ec\0U+\�m iRݧ\��\'\�\'�\\�\�)�fKW<\��U�z\�*��qG+�O�1ɬ�\��O\�O*2Y�x�)\�\�z{\n�B�\�z\�\\1n��N�����l˴\�mm\�9J�@fa��\�u�F��x�]��sW\0���\�Ook$�E\�\�ș\�k�ԩ\'~g{�5\�[�\�\�xnt�����1\�ɞ>c\�+�\�|\��\�^L	8Vf\�@:׸鋩bڃ��\�;�t��\��\"�Q�������\�/\�?4��kE@�.y\��e]�U���\�D\�h1\���=��޽�[\��\�V�-*��Ҳ��q?(\�q��}_ź�\�5��\�eº�9�<ף���\�I7\�\�rWT馣{�A$\�S³e	\�JppW�5��I��\�j\�Z�b\���^�y��k�*��\�;2\�p7\��-J\��D�8\r��\�\�\�+\��i��#Q�o5\��q)e\��\'>�Ê\�n�{\�-\� \�a��\�{W�]\�QÍ\�\'��¸ۍ3bT��s\\5飲�CϿ\�\"����U8\r\�\�z\�\��]r�P�z,�^��\�y>�k3+p5�u�YN�\�%\�3g#�\�\�U�Kc�g�\��\��\�$\��r3���\0	�� |��=����%c�e>�bh�.;�^]D��\�q��\��`	n�\'sTf�c~0H#mw-�Y3�z��/��\n�0�\�\�+�v7�<��sz�� �\�_\�מj�n�\�z�sN\'rۧ�Y�\r4d}�9\�j坍������\�J\�8x��G�ӏA]̞\�\��:��\'��\�\��4y��k�Z�y�\��\09�x\�Cx��ଜt\�]_���\"\�)��Xnl@��\�\�=NX��Pp០\�S_\�\Z�y�-\�]bh Щ8\��G���Lp08��ZG$�5\��&9&�/�oі37-]�\�:zr-\��\�w�&���\�sDV�÷��&_\�\�,\�9|o�G\"Np\�\�\�`�\nc\���\��so~�\�´�;�ǚ�cl\�1�\�\�\��&��\���\0w\�\rO*1~T�\�lP�����|�\��\�3��T�8��:�M>\��@�\�^�\���\r�\\qҢ\Z��\��=TS\�aZG�5Y:J\�j�\�\�Z��\n\��f鎽�\�Ƌf�!����:Ӵ(>�(\�`jg�7���8�L�#�j�x\�^%����+\�WD�c��E\��X��\�\�p`A�#�\0Ч\�3��s��嶭�h��\�}:�\�\0�\0\�V̺���\��q�\�<?g��*�F=�7\0L�s�*�0��\�pq^OTy]�1��⤞��2J\�=�U�/\rjmup\��dC#�Å\�p%�X�o\�ߚ�n\����J��$�S٘^1�f�a���W���@��Lx\�[\�n��\�rr�\�j��\Z�\�\\J�\�ld�\�y�\�Ц��Q>ڣ�L\��5\�݋��}�\�\�Ml\�\�\�\Z\�S\�z㊯cO�P*��fv2�\�W`G\�$oC��|M�� \�>\'�p�8=�3ܚ=�?\�E{I��Go�]��)\�|\�sҽV\�\�j��,�[�ׄ�G5\�:�\�롻\nb|��+*��qil˄\�ԓ\�yh8�o�I��\�D6�\�\�RG�+�,\�b��\�\�\�\\�s�9\"��~��\rWq��\�$;�\�\�\�\��\Z�\Z\�\��W%�}\�\�?\�	v\�^^g+P��\�\�#�\�Dz\Z�\�j\��\�Uh�+�q֥ݎ�\�\�.{��%TR	\�p�<ӓ[\�\�Q��<\��+]qe�Z�\�K���\�Ҷ�QӜd�3\Z�S��ꏎs\��4o5\��\�F�\�\�&T]�NZH�ר�D�ھ��ER�٣\�\�	4�B�\'\�=h(G8\��#9\�W��\�q\�ϭjJ\�3�\�!\�s���\��\\\�⁆2=y��@\��8\�R�\�A\"\�v�\��p¯�N�\�2UE9\�$�O`F��d���kn���\�Ú�\�\�$�\�#\�\��\�\���A\�*UZ�A�\�\��\�1\n�E\�\��Qp�3݈Ɂ\�*ʮ*~�E-\�l�vߖ�\�\�|S�g�\�\�/\nJ\�^$y#8\�ھ�񥠿\�n�\r̀H�\�A�u�9;�\�E{�t��\��Y\�ccj\�=9\�n\�M;\�޾�\�#�RI\�S��\�4�~ZNCd\�\0\����Ҿ���<-d�x\�<���ǌ.�8��| 4 ���yy��\��;pk��\��E�B����\0d \��=��1\�4\�	x\�x{��\�\r�8{ׂ�K��@\�ג=�W���Z\Z.�\'a�c��y\�u���\�͐x�\�\�\�O������yyz����i��3��)\0=(�y�5\�\�[\0���\�L\�8\�R�xɥw�S��1�sK\�8\�\'�M\�i\����NG�SH\\f�W���\0{�P\0z�Wd�y-\"���\0w�DP:�t\�\����\�M !W\�i9#$d�{g\�h\�O\\�\�JAz\r�s\�\�~�ӰB�\�ړ\0\�~�\n���pZ�H�@�\\�a\��q:\'�o5�s\�P\�I<\��b��þ�C�QB�>f\�O|\�-j�+_PI\�\�\�0=3M��v[߭\nTc�\'�S<1\��J㹢G\r\�\�I���\\H\n�_?�\����~\�L�k�_\�8�rW�\'�y�\�;!���E\0dziO� \ZE\�I�5�BG+\�|�\�\�O�\'ڼl8\�7N��\�>;k\\!�8\�eWc)\�nN\��;+��\�\Zc�df\"	��X����i7\�\���\0\nὙq>S�7W*T�Q� �\�\"�\�^y\�j�\0�NMy��Wx\�8\'�脔�v;\�\rx�\�\"\�-��n\0�U��R7q\�=+\�VpW�����\�͹K{�;|�ᩝ;\�z\�+�#9\�S�\�bjȵ����\�Z�\�\"D�\�ms8��\�\�$�VfB��\0&�\�k\�y���յ\�c�Ӹ�\�^���2)�`�2k\'P�\\lp	��ç9�\\�3�{p5F���Hĭ���\�T\��	!_��qL�\�@�\��\�P\�j��\�\�\�z��a\�=y\�Ҡy\�%P\���\�*�\�\�7fl�\�9�{܂AQ�c\�\�\�s\�*��,\�\���Z�<\�r\Z\"���\�ҎR\\\�Y׀0s\�5\Z\�>�$��\�\�_ʝ��\��pA�\�:^FT}�\�q\�Ur�����\�\�\�\�\�O5�I�\�Un佉\�$f\�8#\�UQ�Y�\�p3��\��C�\�F\�\�FI\�y�v*F\�\�\�Jů<��Tc��\��\�_�\�\�\'<e}1O�=��\��.J\� �<\��\�8��\�\�m���\0GCR&���\�\�s�\�H\�{�9\�\�P\�\�P@\��3�7d:g�\�@�Y�n\�\�1�T&�\�6\��e]Ǎ�n��E\��}��s����_\�۰�\�Zʸ�Σ\�07Rc򯧮1U�u�k\�*G�\n�!9�I\Z��\�O/�1����\�\�\�\�k5�&�\"<��6�1\�ԇBT\�[\���z�\Zv!Ȩ�V�0W\\�8=��\�^�@\�N\�#���y|9de#��\�5��>U�,C�\�>�d�b{�s\�JT\�m�BI\0r	=8\�\�]<�E�Hۨ\�#wӜ�MM2\�\��)�z�4Y���Q\�8�PD\�\�R[�ܘ\�D\�P}�tq�b\�\�ոd\r\��9�\�A����\�\�^\��F�\�Z�.u���?t�k��XdN\\	\�\�ک�;v��8c\�;\�\�ٓn.�=v�__���\����\��\�\�=��l9Uq�rA\�Sy��uq�=py\�})r�\�\"�ݜ~�c\�\�`Z��j�<c;��b����\�\�=[�(��i���MDE\�\nF\�S\�~l�9���dC����\�\���o\�\\��\�\��\�t#권2\'Fa\�=��\�d�z\�\�(�\�6\�\�˕�8\�\�L�caS���8�*!�\0W�\�{|������5#\\\�;�\�}zU	\�g�F��\�9\�))	�H�\"߀x\�X7p<\�B*����S��\�\\\�\�sQ\�e$p2;�\�{�V�f2��\�s�1�\�T/4�\��\��\�kfI\�˂F8\�\�S����G\�j�*�ˡ\�\�ϰs�\�T\�w�\��\��\�A$\����8��!N2hu�\��kO\rjr�\�]�*y�}\�������ږr\0\�\�s^�g�&\�ex_Oʚ\��z�\�B�;G�\�\�M^/��`��>\�-��\��\�fTgj���L�����c�\0�Y�_U98�je6\\eq�1�\0\�J�bS�\�Þ\�\�G\�\�\�Xܧb\�[�\�\�)\�6��.B�FqI\�\�m�<\�$�\�!J����\�`5�\�M�cׁ۵Z�����\�G�\�	Q˭T�\������!�w\n*\�y7c��\�\�ex���`��c=r\�GLbG+��GaQ�\�FI�px<�nH\�\�k&i\�6lg5U\�}��զ8N~�Q\��\�M\�\�x�I\�O�0	8�\'v�w͞\�>�W�뱙4麷\�\�{w>¼i�\��\�I�\�zױ�~\�\�䚳#|\��\�y\�4�\�P��a�@�S��{z�5\�@.���x�@\�xc�p)�y\�@\'ޛ\�m#�\�ׯ52��\�;�{~T��\\\�\�\�p\� �z\�\�j~T�l�&\�Fz{Wiii��0�&\\\��Is799\�>�Q�c d|\�=�=X�r:\�1B�\�\02>�Wv~��ȭ\�\\�⤞�=�/}y#\n��\�U^@\' \�\�|\�v\�\���y�8=j&��3ڠ�+u�W\�^s\�\�o\�on�B~i3�\�q[q\�^\�6c�2�z�\�+�\�0�\�:�k�\n�4��\�S%��\'�C�:|�>�sVM\ZpH݄��L�\�\�!\�\�\��\��\�\'ڄl�1\�dP:\�\�#4\�\�\�i\�\�\�\Z�Qᶒ\�u\"�\�\�Q���^e�\�N\r3]\�@JǓ^�t�`��W��\\\�;iJ\�3$\�f\�k6{{��@{V��\�3ҙ\�Gz\�I���\�O�\�\��x�\�SoY9S�J\�<���V\�VP\�\\6kh\�K���\���b\�|\�9>ߝy��4\�+	\�ʘ\�P2G�5\�.ԟI\�\�\���\��_4\�q,\�\�9\�3�k\�\��=[9*44(\�\�f��\0�\�r\�g7z\�B�$�{\�q\��\�]��\0�t\�c4}Yej9\�֛|�\�\�U{\�?vk����\���\�V\��\�\�r\�\�s�ھT���\�\�k�	/3�$�\�z�\�	\�}^\�7|ƊN\��ט^q;�<g�ƻ�\�$a{��\�NN=)��<\�I�ǌz~\"��y�\�~��h8\�<�b�v\�\�4�F�ሪ(��\�AJ?.;T-��h�\�V\�9\���\�<��#n:�����qLLaV��\0�J~(\�\�I\�@�\�m\�y�\�*d@��jEǠ\�J\�(Ͻ0�\�v�����\�M�^x���F#\��49ޡ-\�q\�L<\�@G\"��nASǁUs�\�qJ��\�8����%\�G�Y�ݳ\�gFGRzV�j�=\�ռdo\�`\�v�q�qW`*� =��pk\"ݞ5�#$V��+�\��\0:\�0���#!W9�⮴�^<t�j\�{��y\n�\�\�[�\�\�iv�,S�j$-4#wp��z׻i\�%��0����x�5�E�s$\��R@R?�\rz��\\�\�\�T�݋��\�1q^i(�\��\0t�>�׭\�\�\���ک\�\�`mǦe�$�7W�\�\'�6�:<�\")\�\�u`\�\�91,͖)&6\�p��!\�^~����\�\�kil�\�H�s\���\�eZз$�t�֤	o��ySx�\r�2@\��\�ﴞ�\�\�\�:�\"E���p�\�O*<��\�\�\rF\�\�ʳ�3M��]� h\Z4lv�Ƹ\�p\0[����\�v\�\�z�s-\�\�fGB�r���\�\�5�؉��j��]�0ϕ����\�YZ-I\�e\�{ρ��ƭ×�\"��X\�\�	ѾoQ_\'G5ݷ�\�$���#5\�\�ꚔVʗ.0#`pv�jjǞW�2�ɋ\�h�k\�>��]k\�z5���\�i\�\��R�Gu��\�\Za\��;+Vvy%23u.\�&��ᅇ\��\�.\�{���J\�\�ź�c�\n�s/�.n��|�8�B�\��\��\�|�`�9p�Pս�\�g	�\�=\�t��\�U�7\��\�\n1ݍN�\�y��\�2hڻ�`d�M-�XsFI�\�(�\n\�̆�=\�P\�z*\�Vyɣ�J3@h㩢�@�\"�e-\08\Z㵏X\�t�KV~\\F\�9�\�a�Zҕj�e\�	8�9ӌդ�|��x+[\�\�Q!Cs�B̝7�\�W�qWZ^�h\��\�H8\�t\�OLW֤q��w�4W�Kq\"ƭ�\�*��\�d��{�U�R4\�\���\�\�(F�\��%k\��f,��^��\�ڰg��9\�TV`�����o���\�8bv�I,\�A\�\Z�&f�\�n/\�=z�z�0�;��fn�\�\0I\�-�}F+��ApT����үW\��3L�\\>�h�\�yW����\'O[��g9pb@s\�N\\۱-�\�\�RE$��\�e\�`?�x�Q\�\�؄��p���\r]U���5R\\3{\�\�\�g�\�zsUfP\�\�5z\�8��~B�\�4l�� pT�\�V �U����b���L��-C\Zd�(7qҘ%\�+�L�wL�M85V9\�\0\�\�QKT��\\f�#��TK�`25`��;��\�\�\�ԥدLTa�8\� ,\0p)��y\�U\�y5`p(��ё�I�34A\�*�6�\�Xv�\�*�q�YQ�}EY*�\�\�zT\�˞\rZ3��a\�\�5+�fL�ơ�#\�36\'E�\�tGc��\�b��\�\�D�ê<`ׯ�\�\��\�፠\�u\�b���#�g\�X4`~ƶm�[���RF3V_÷\�\�G�z\�Y*,\�\�zzR`V�֝{g�,/�8ݎ*�Lc߽Ri\�\�\�ts�Rm\��S��`\�)�p\�׭z���i\�۠�;\\6��Kw�[\�\�UZE\'#<zW�x��B�T_�\�\����j\�JQ^f�\�\�[<@\�ϭ?\�C֕��\�\�I\��\03M8�Ƚg�\�dw8�\�j|�z�\�\�\�M�~\�&���-�\�T���`Q�f�n��{۸-@\'\�|q\�u5���-������\�f��a;��k&v\�\�y\0\�^�\re\�u\�V��;�\�x��r\�|\��h8�\�(�\�\�P�wG��N�y�\�Ux�c��\�W�c�E}A�\�Ք\���R1����Fbv��%H�\�}]6\��x�\�%R���>\�ҍ��\�\�[�Oف^�g0�Sa���K�-I\��\�P�\�>�\�t\�ϥ �\�\"��@`�cS\�8�\�#v\�\��y\�\�ҕ���B*%��Gז{\nD\�Р=;ְ8�c@�7\Z]��~cn��0s]\nɴW\�U��%\�}\r){��\�\�3��j\�\�\�>K�#��\�!��\�U�f~�4�\�뛛L�#��\�W\���+\�׊��\�B�12㯭|\�\��P1�&9���\�ױ�M.h�\�\�\�b\�L\��\�=H�#�>\�h\�?7\�^�\�B\�=)\��\�@�g�&đ$q��\"�r\�ԜW֚\\\�\��$*(\�\�ּ/��K���L�\�\�/a�\�ͧ6\�\n>I$\�J��Sj+�\�a�&i;m9^Y&W$おL&\��)��Kc\�Y��ǈx�\0U77�g� \�	�b�ɱ\�]��\��\�@9V\nٮ�J�*J�-\��6\�K\�V\�$�Ozi\"��\�zp �\���\0\�\�4t\�\\\�Ҏ|�Ӹ$7�Nx�/s\�\�]7��s�\�\�7B\��\�\�Q\��\�\�/e�6\�\�CcT�+\�v2󃞄���\0,��*�`s\�:\����fll+�*�IP\�?�_���\�\�F\�ga\�\�p*�\�n~��w�\�i-�\���\�ޘ\�֋��-\r�y&�)\�A�[W6lҖQ�\�dT\r�\\\�I\�q\�N\�Fn\��ێ���kF=.\�\�`�\0ǭ<\�̠n|\�Ce��.V\'�H��\�\�\�?���������!2C׳ZjQ�\"ua׃�ᬟ5͠�G\\��s�y\�҂\�$TZZ	QOyu��\�\�\�ǭ`�\�O\��o\�\'�\�8;G�|\�\"�\�(NJ�\n\�\�z���~\"�}�%��\�$u\�Y�H9\�WUm	�β0��\��\�ڣ8\\�\�\�\�H�s�\�	<b�0\�\�\�1�\�tܒ.\��5\�\�\��}\0\�\�\�^2\�:0!s\�}kڼ,��\�9?/_Zƫ\�\�ZX��+6��!��9����\'#�cjsll�\�q=\�\"e\�Z�\�\�6=\�ʼS\�����<�^�\�b\�DT��\�j��pot颒0�\�⮛i�\��\�H\�ԃ�\�z`֥���JĦ^�\0Oj\�9\\�ڵD���|E%���k~1��\�S��\�k�nSxe!� g#��\��λ\nj\�E0��	\�zjƤ�=\�F^�[�taJ����WA�_(�OR=�ziy\�\�r=\�Ȝ�y\�\�\�&���9�90;Y)�X\�βN�T䎔6��C�\�q�ޏ�)�Ym:!\�\��қ(�G\�bM\�/�\�!\��U&����I�g�`g4\�7\��i\�a�*�Ui4[\'fs%�sК\�%���\�\�O�#N�쒬G�jj��1ݝ\�z}�x�`\n�\"�;�dW�7\�\���s�\�R�\�\\\�ԤK�\��#��T�\�G������]\�v�Pr;\��	>%_�\0X=�>_��\��p\�O\\\Z�F]�{\�*\���\"\"\��\0w<߽|\�7���@\"r��h��\'���m\�j|�I\�oj~Ɂ�\�:`\�\03�G��\�V\�X�RI��O����_\�\�\�}�c��福W�lfIF\0\�\�{zST�Ϩ��`�\�@3\�\�J�6��FSu\�9?s\����_\�\�\�wg��]\�q)\'q,q�\'�z�bӒ��DF \�!c\�\�\�U�v�@�F#�z\�\�ͦG\�+zj\�ʛs�sG�&\�\�C\�\�\�\\���Sx\�LENOpx\�\�\"�L\�wz՟�j�8⟱C�\�\�0G��Q�\�\�;U���a��؏p	�\�y;�����s\�\�\�G�����\�X�7��D\�\��j1�\r݁\001\�\�;\�\�ז��Q�\����뎂���r�\�e��u(Rb@۸`}���\'��\�n6�Cs\�y�lt\�w�\��\�NH\��*K�r���ƺ���ʌNF;c�C/��R\�U�\�\�d\� @\�\��FH?\���U\�\�\�Q\�je]�\�\�U]�pJ\�n\���3�@\�A\�FB��\�\�b�f�\�6�[���3(\��T�\�\�$/)˂�0}�8���<�SH$�2:\�Ȃ\�\�{q���8�Z\Z�ˮ<\�\�1�ֲ�v\�~^\�J�Xm\0�Ӟ8�\�+\ZB�b0$bH\��v��\\Ł<�8\�Q\�Пp�w��\�bCG*%�\\3t\�\�~A7��)\�A>�\n�K�`w\�=*�Wq#���s\�\�5�G�Oq�\�\�_9\�j5P��0G%�\Z�\��lPx\�ڡ2n\��=h$��\���1�\�NUp?/~��ݹ\�=y\�\\\�X� \�>oj�CD���\��7iH\�\�>\�ݪo�%�\0v�G�2j\�\�KK��\�t��PA��\�#�\�CN\�sN� �2֩�^\�{����Wa�\�#��\�\�1���5W,.�\�\��\� c5��\�\�ב�\�jbX&1\�\�p9=:�f��4\��G!�L�����\�>1]*\�G�pq\�{�\�\�\�L�TÜuϦ+&�S�\"�6n{\n�Y\�l7�\�=)\"m\�\�\�Gҟ\"�y\\�Rl�\�H�1�rI\�T��9\��f�\\q\Z\�#�>²\�t�`\�zVRf�5 bKA\�\�V��-*\�X)#;exҮ\� ��\�;7D\�+�\�J��\��ڡ\�1����E�1\�֦\�#�\�\�\�\�l�;��W\�a0	��&5�\�M\�s�5h�]��x铜�8�0\�ti\�\�i\�1�}�c5\�Ӳ�yGj�\�\�:(�8ߐ\�\�W~�k#��\�\�Y\�\�\r��y0#*}�\�M2+�\�q�Nq\�\��\�J\�0!�:w\�\'�roL����?�z\�帞gvo��\�x��*\�R\�=q\�M�\�\�\�(���3��i\����\�F\�\�\�\� d\�\�k�ѥ/o,k�c}}뛺G[�����!6W�m��>ǌ�ph\�\�\�\0{�=+V����T���|=4��\�T\�\�a��Ds\�6\�Ǿp;Ԃl\�)�\�����P\��<�;}i`GG	^x#�\rCL�M\�%���`_b�:pj]{N�[7݂$q��\�t��Kdm�\0u�q]\�-����Kz\�\�\�\�f\\�tx�ؒ)\�7�F���J��׊�wrʋ\�6W����#w��\�c<�\�=Jd�\�\�I=G֧�\r+m\�K78\�\�|RiP���Z\�\� \�}\0c�\�1\�6�\�$?e���ۚ\�YI<Y\��	\�t\�\�qr#o\�W�Q]�)��s�\����\�hs�rO��\�\��LV\\�\�&�8\�8�\�֝���\n\���Hx\�p:�\�wq�psT��f��ۻ	lm<\�Q^��\�j��J\�O�`y(O5\���r8\�\�\n\n\�9\�\��A\�\���5[r��5KW\n�����\�\�[�W�\�Fd\0�\�Z\�aşXD~Nj�\�܄�ҧ�\�ns\�Es\�\Z\�\�g3¼c8�K\� \\v�(�s$��\�W\�\�#����\�S�m<\�˓�bg\0�r#�\rwQw���ƨ=}J~x�\�;�J�q\\�\�@q]���L#4�\�<\�ݏOE���7=\�I�rsHܓ\�S\�v�I \�A#4`>2X�\��\�\�\�j�\�\0���z1<n9E\�� \�❀2@\�ҡ�\�\�4o��($�0[��pj�oN��*pG�8\�UO^{\�	�A��h ��((`\�\������I��\0_^\rI���h\�T\�NEZI\Zc��\"�!O\�ys\�Yk.\�\�=\�\�#;�}�H��t�;!gGOJՁ�+`�\�:V\r�\�\�\�Z�K�`\�@\�]P���v�v��98�x�U�s\��\�s� f�T�\�|/g���[ųpR	��\�\�ՠC\r��0Bz.sܟz\�n\�˺F�a^wܠ\r��\\�ۈn�\n�y\�\�+^m\�\�̌�#}\Z�WbrE\�\�k\�Y�\�]UI>\��\�Ė�\�\\I\"�\�\�\�\�\�v\�Y�\�ld�⤏H� ̅\�\��\�]ƻ0�\�\�Y)Yox�\���q��\�A%\�\�l��\��ׯ����b\��r*\�\�P[\�4A93F\�\�(\�zp��F�KS(��#\0�պ\�,\�)(\�\�*��;FѴ~5\�\�T0�c�w\'�OC[܍\��|`w�5��&\�\�PHf�\�$�BCw�\\(�=:=N\���\0c�x\�\�ә`�\�\n��\�7\�A�i\�m0�]�`cօU�\�l�Y�\\\�w,\�G?y��<z^\��u�\�_\��xfR $�\\k��+�K\�\�D��\n6�9_j\�?f\�\��g\�Bb\�\��k\�\�az\��We\�\��k�q߮Ǿ++\0A\�\�q\�&f�<ϻ���v¾z�Q�\�\�n�eV	��R�+�\�[�KIE�J(i(��\n\rP\�)(�\�\�\�.\�\�y\�-�Q\"0�p6�0�\�w�*�v����B����\n��X8����\�\�/!3O���\��\�ڸ\��;H.dT��rS\'�7#\�־�\�<;a{o2\�8�X�W�`{W�x�÷\�e\�Ĳ�pDe�wzls_K�\�\�\�h�\�)\�ԡ::��9���n@V��\�\\\�\�>I\�A+��I\�\�\�\�N;�J;\�� \'\�qX�d��@ �9#�\�sZօ\�mF��y\�\�#��MdJ�%E\�G�t��RA6\�rpr׳�a��3\�x5\�ٳ֣WDf:s+`\�S$\�\�d9\�}+u�\r&y�	nR}J\r\���\�r:\�\�uBi����.�T�y5v\�E]�\�5U�\�$\�O�rJ\�e&\0�\�T]8\"�g\�qU	\"��\�̷�H~PsQ�yC#�\�Z�!�Cks��JS!1\0$\�g��\��Չ\�V\���<���\�\�X\n;T�8\�C�R�\�5&\�\�\�cSB8\�\�\n&3\�5g\��g�.V>t\0�I��Ui#r�!�\�Dm\"p\�r����c��\�FF\�Q��I�\�Qas� %\�DT\�T����n�\0:\'\�e�\�7\�\�W�5i;\�5\�x\�]F\�\�\�?5��\����Y���Q\�\�}�0s����R�\�MR\���jJ\���#\�=�\�\����\�\n\�Rz�p\\��/��S_h{r�+���#�x\�I\�\0����.\�Z\�F��[\�c�~\\��[�i�(\0\r]��X\�\�*�%\�`\0{�\�JM�i#��-�c_�텈�\�yV�m�D��׫��Pi�*Y�\\g�=k\�!�Gnv�9�\�:���L�8�\Z\�h:d�ŉRF\�5�o\�\�2\"�=\�y\�s�hZr\�\�	47��FJ�㡭_?q\'\�Q�\�[��\�\"#�\�8\�+���Ime�Ed��y<����ϙ�c\�\�ҽs\�2 9\�y\�\\\�T�F�\�V��\��\0jYM�r��\�\ZʛJ\�m�\0zץ\�\�$�@�zk�w�\�\0`w��הt\��ы<0C8 ,lǡ\�J�\�s;p\�8T\'�k֤�\�2,j7\�:�\\\\\�:���)�%B;m\�f���fn��S\�<9\��48\�fK�?4���f�(�	��Z\�\�)\�m\�ҤI��\�xu�\�&\�\�\�R�,\"�-\�>�\�P�I�db3ރ3g t5\�\�\��ѻmy\00ROZ��_\�Z~�},3&\�\��\"��\�oⰸ�1�\�\� #<\�\�\�ޡ}w~\�t$\�\�z�v\�p���\�\�_\��\0]�ϟt\Z\�\n�\\כ^/\�n$�\0�$\�&�#\�d�H�*0oNGW�J�)$��6�ITweY\�nF\r7�Gs�\�2\�Į\�\��RIk�\�Z\�LȠO|�uɧ7@\�?Κp3ު\�4�sNf\r\�^zPI\0�\�@\0�\r�~\�:\�e\�\�x���\�lf\�<u\�r1+\�\"���|澉��ɤ\�@Fh\'�^H�lEGi��8�-O@\��X�1D�\"\�\0�\�k\�X\�Rpx\�zǵ\�\��! t&�n5\�5m\�\�^\�vz���1��Tt*=MSc\�=\�\�\�̗s�\�ya�2��\�\�\Z{C3Qm��\�\�:�^E�2<]Z\�Tb \�z\�̍��\�}+\��!G#\�n\�O�|�{\�n\n<�0\�˚�g�Zr�sM�9\�\�\�5\�y�Lf�B�\'e\�\�5<\�#�q���R��/\�K�\�c\�\��^�r�\�\�d�U�+\��8^�U�U\�92\�0N\�+ǫi�uө\�j�m�\����|V#��ӎ��\06=�\�85\�@0+Fƞ\��/�\�j\�7��\�3��\�^9ǵ}3}o�r[2nR�z�\�X�}6�hOE�\�\�{ק�v��c����eg��sߨ4)\�\Z01ϥv&f�i\���`O\�3u �\�,z���\�iv\�NG\�s\\ƭ\'\�nd�.\�\�\�c#�s�\r��z(�ZV��\�	j6�5m混<a�A\�WU�-�\�R��=+�/��H~U\�=�Z\":Y5�\n\0��{Vp\�\�r2Ü\��%�ힾ�#g��C\��j\�\�nF͘`=q�\�IѢs�\�Ҹ��\�! ճ!�W�\�\�\�GGs��.Q6\���\�M}+�\�Ns\�j�1c�$Ӓ7���\�lP3�\�I\��T�Mp��\�f\�)E��2\�\0�Ok7E\'Ԛ���\�~�#\\�o,��1�n�\�ں\�/.~�s�}0+\�x��\�P\�H#���U�Đ>�\�1�+}1�\�T��˞#\�\�\�s�<ז\�pd�˾�6q\�N\�\�\�b��\�\�Ք�\�\�t@�P\�I\�\�\�Zq�)i�!1)PTpy\'���ʊP2>\�\"�\���sZ0[�R3�g�\�\�I/\�O�(\�>^x�s^����J�\�g�+˯\�E���\Z��+�`\'\"��\�Ƣ�;\\��}�Msz��gq���\��9\n\�\�ֹ-sa�!�t#�\�X�\�0K��秭Gt\����\�Z\�\"W\�8A�F�*.\�ܚ\�!6e�����~q\�ryȮGU\�\�\�\�x�p�~�\�jp\�̎#�s��ݹ���\�R\r\�r2�\�[��\�D�\�1�y>�\��e<\�ϔt_\�\�U�c���L1\�>\���\�\�sӍ��\�Ӟ\�\��M+A\��\n�OQZ\�F��#�e\�cm�����\�r�A\�@�>��Ǌx\�y\�U�!w�Erj��\�cȭ�\0�mNbO\�X\��\\�\\}+��V4�数n\�\�@\�\�w4\�.ֶ\�Bw9��<�P*�zvwq�ҝ�-���\�\�=��\�n0j]�N\0\�\�\�h\�,�$��Ȟa\���#?N\�\�ݖ\�O\�s@�RG\�\��S�����#i\�S\�F�\�U\�\�iN9������\�#\'�8\�\�]\n�M\Z1�N\�ڜ=���׎jٰ�\����g����{W#i\�\�+��ld��\�\'�\�*\�ZL\�\���\�hi�����wC��T�\�9\�q[ď��<�\�9t�$�^~�\n.22rI���*2G5\�X�4�m�g9\0����\�(�T#�1ӧZk�\0GZ�HU\��\�\�\\\�2I�\�}i�X�c�\0��\�d���[����帩B���((��\�8�\�$V�\�\�%s\�c�>�\�3Z!\�U��h����#$t���S�秧�O*<e����\�\�y=�\�c6�\�g�b��\�\�H\�j� \�\nE0�Ec��\�+�\�{���\�7%W�\��\�J��zg��=\�\"\�\���FA矦)��H�҆Sh�c�FjW�;p\���\�E\�\�r\���c\���kElK\���Hn͚�񕔎�78=:c�-�\�\��#8=�\���Ļ۷\��� �0��pNI\�:Ic��#�0	Ϩ�|Q\�Hq���\0\n��{�.�	�\�\\\�c��[k\�h���PI\�\�G\�\Zɝ۾l7\n@<?�T�s�\��`�\�?\nԍc�q�~f�Fr	�\'�֑1�1\�\'�\�8�kh#\n\�r\�|R\�$K\"\��I\�\\F\�6\�Z$d\�61�8\���}i\�QT�\�u\�N%rÁ���R\�\0{�*/�����[\�lC�{\ZaHM�p	\�\��\�+��]Ć\�ڕA��\'\�ϯZ�\�\"Nq\�8�\�iF9�E�\Zt\�\�s޳�m[o\�\�s\�>����\�6\�^O\�z\n�TN^ VB�9<\�%Í\�03�քP����\�/\�Uk\�\� .\�0k6�\�+;��I\�\�.c��~\'f	c\'\�?J.\'b�Qx\'\�XH\���\0\Z��Pq�\�\�]��\��}*a�\\\�X=\�\�),\�G\�Wc�4�sc� �\�g`01\�\�\r32Nь�C4M\�\�\�	\�Vd�I`H8<v�ё�\�r;U۪�s�}��Bc����L`\�9\�\�|H!�]�\�\�ڿ�\�\Z[2\�\n~bOpGC^z\�Xnvs�sגk\�\�C\�5�ЅQ�x\r\�\�qO_9S\���1\�[\Zm���/\n�s��oJ\�]WKyK}�\�r�zf�\�Vq\�\�\��\�\�\�h�\�\�\�\�{t\�t\Z��S�f\�\"00\�.\0+�\\UO\��\�T��ي\�T��\�\�4ا�ݗR\rV\n\�dm\�\�TX �;A$���h��\�\�R7ڇ�\0\�g��,Ļd\��Eo\��b\"\�b��\�MAs�\�^9�\\�7\�$�S���+;)+�\'�\�:�o\�d��Ui+�\�\�~y��\�u�\�̦5l.wC[#�6�kp\��\�\�ֹ�\'Q�%E+���\0w��_\�\�{��\�A�C��\�Mal�@\�p\0��B�F!I�\'k!d�Fq�u>�\n�\�\�E����4�\�\�õD�C\�d�u�apF�	~V\�ڛ6�\'WV\\3�ey���d��\\p�U��=�+�\�r�⯤�! ���ϥs�	>\��B\�+R�� �Q��\\��\��1q���T��{r})\�&��r2N=s@`�G�G(��\�ܜg\�s��s|~*\��\���̱\�޼q\�M\"y�3\�\�H4\�=J�vS��Z��\0\�\�-K��^8\��94��\�1\n8��nȥ#�NX\��\�|/Ưi\�\�w\�W.|;L@�\��R��ڷ\'��V\�tW#G\�p5Ģ5\�Q�E`��j\�\�\�1XN\��n��Wf\r���u[X4�\�\�B\�&UP\�vH��\�X�\�/\�e�w\�NKA<\�iQ�q]\�\�ʈ\�U��\�\�z�2{�ڪ�K{g4\�\�\0����,oV\�nj\"	-��\�	�\�(8��\�\�\�\�0�ϩ�/sޤQ�a��LԤ\0�}��듃\�8s\�\�z\�Wi��\�6\�zߘ��N�\�\�MD[��\0q�w��ҙ�G�z�jM��\�\�\�#��\0G�3ڝ�\�\�dG��JM���c���D#\�<{玔�q�1�l�\�׭\0LDQ�-�\�]�.0w���=�\�6�v\�T��\�\�S��h\r�\�Q��\�v5hM\Zv�r�\�=�M#�\rf[�n	�zZ0�+��\0�kx�\"��o\�s���V�%�\��6\�1\�=\�\�\�Ǚ�$W\�^\0�\��c\�6s��5�L&�7\Z\�XsY6��\�*+B%��*m\�+b{�<\�\�\"��I\�Og{jX�1	��։\�\�[YkP�%\�H�\0z���o\�\�9����\�Z\�<[\�0\�%G�5�\�H\�ɮ��\�\��V��%\��\�\'���\�G\�Kd\�v\�[\�\�\�e<�U\�Gi�]1\���r\�w�r\\�In\�P	\�]L�\�o�H�\�B����,b�+�T\��]4\r`�y�\�[�\�pYb\�@\�c�\��Ӛ�y\��x\�\�=����\�\�:6)\�<��\�9>դQ.\�B�4\�T˒LD\�;\�K�+�\�\�(l2\�\0\�:\�!�q>\��@C]����\�]�y0ʭ\�y\0����Zr��M��rH\�t맴��`�cH�Qq��ȯUNPz\�\�E���beb�6\�3\�t���\�\�t\�-��@+\�q���\nַF�[�&\�{�\�E%)\�6��\�L)qIN�i&(\�( �\r!���(\0�\�E\0v��\0x\�E ��L6ӎ�⼯Ė���nn\�}�\�3*\�ڿ7\�;W�\�G\�ц\�<<��LµV6n\�Ⱥ��\���\�\'�\�ڸI�-�\�$\�+\�_xKL\�4\�#�(m\�\r�%������>���\n��ÔH\�l��_G�\�\�ef�L�*S��w<k]�U��$,2Czq\\����L�I\�Ez�4\�\�R\�FE;�\�>�\�[h1Z�\�E㌜w\�aZ�4�\�\�j&V�,1\��|��\\\\�Ą\��;\\S\�\�;w|�Y�\�H�\�ʹl��c��\�ָɴ\�ug*�7u�\Z\�Q\�N����\�������D\n�b	\�gI�Z�H|��\�uW�-��\�\�c¬x\�\�L:�\�=�\�\'N=��V}\�O\�+VGm�\�y\�.�f\n9.��+]�9da���\�\���\�\�*�\0�\�4i\Z�9\�y\�UY�^���ڍ��\\u\�\�Ӡ�Gp�\�X�^��S!Lrpx5\�(\Z�Fe��l\�<��E�\�J�\����\"I�b�X4\�{X�H��R�h�\0rk>A�Iw9�r%�q��o�\�N\�E��\'���\�G;b�GgC\�P>��\�|\�3\Z�.�8���\�4n\�[\n���\�h�oƁaH\�Z\\�瑌��W\n\�c�U�2�5\�b3WLq\�\0:c�\Z�$h\�vSa&T���P�<p{\������4�\�\�T\�ݧ,/ִ2	<f�T�zS\��)$o\�y�K�0\�Mi�\�\�z�2\��9I\��d(\�}>�FI�bG����*%�pOjd�\�0\�\�<c(_�)<n&�f*q��Ū�Ol�B�\�SHM\��2\�3�0	�[\�\�,k3*!�+]�\�<V�k�������wnێ0;\Zޕ;\�\�\�wZ��!\�؎3ߏ�W�;��\�ʧ\�\r���#`�ݺ\�gah��y q�\n\�RPE;1�\�1�1�\�\�y4\��\�\�3\�5�AH\��S^H�@p\0�O�\0X\�նo�t�\�\'\�̆0\��\�����)\�䳹p����\�\�v�\�(x�\0\Z�\�E7����\\T֧/7#=\n\����1U��c�����\�Vi6�˞�\�\�s,��\0I��f\�\�\�DJ��\�h�NR\�\r�R�gI\0\0�=j��f�IY\�XV��\0`6�Y��V}ƌ\�\�-����%{9�G�h\'VE�\����\�\�A���)P��9\rҾk�yl\�Q\"�A\�\��k\�<+���\r��7�N;W5j	�\�ޕ[h\�[��UQ��If\�\�k\�u�\0��\�F��c\\��ަ��K���d�\�e��G�\�\�V֐;H�\�ׇ\��V�\�6���\0㊣s�\�\\\�Y�犄j�\�\�\��1]th�#��Nr�X\�)\��Q��Ϛ�\'<�\0Z\�-\�\�^�Շ�a\�\��<�\�9�}+��˒\�\r1F\0/\\T[\�\�5�{�*1x��\0��\0\�ʁkD\�fՅ\��\�д��W\�qUT��rz�\�*\�UB��T}\�Z����\�\�a\�0w9\�}�i]\��l�\�\�֚Yq\�\�3��\�۶��P�FW�\�ھ��x�.1�\0>��^# �9s[־ ԭc\n��z�\�V��.\�>�+�0܂1R[˴�d\�O�x��\�=U�\�H0�/׵z��p�Ь\�0d7\�\'I\�sx\�5|\���=\�\�-�f(���s\�\��W�x�P�YͬG1l \�\�jaO��\�\�\���\�\�rLO�Oi<\�\�i�\�P,�[j\�d\�cA r$�==\�F\�δ\�2\�\�vF\\ͽK\�h� �q���╼!m+�^~@��,�Hd!S�Ҷ\�tn㎕.sL\�B\rc\�K�l�\�O5��˓�.\�#\�$��\�:W�\�\���|�T�p�s1.>\�����ȕ8����#NO^��\�Y\'Y	��\�a�\\���\0�իv�J\�rH\�\�\�\�k\�|�r�\�R�,�sJ��\�\�ӻ!�(�yg��\��\�b\�7�K�\���+\�m�\�\Z\�\��<7\�W�jЁ\�\�1�m8����/$o\�I\�[\�C��\�l\�̫�LԱh����cldb�+Y\�\�\�n\��\�\�@S8�\��Z��\\ �y�^�~_\0��X�)*\�V$�\�\�I\"�P�s\���λ�G\�\�g\�&t*�\�����R\nd�9�ɬ\�f��9\�]Ϋn#v	\rq��g\nF\�ֺ`\�\�5f\�@\'�|\�\�ަ�L�^�\�Q�\�J\�\�_-��\"�cf�Ñ�H5��\�\�\�\�#[-�\�x搖8<\�4��7rz\�\n\�zu��` V��ܑW ��$`;gsQ��@q\"w\�\�_&\�x\�\�H��k�.W$�\�\����&�g\�X*�%}�ӕT�\�h���3!1�˜��� \�#�sJ��ךfx=H\�@\�2��,qV`aս\�Z�:0t\�\"�߹A����h�h�X\�\r߃ݫZ\�\�-�F\�$�\�\�\�\�!Q��\0{�R��I\�?\�\�4j�\�\�,\r-�#g-\�\�W�\�\��x\�\�p˺�$\�F[��\�^ѣ&\�^�7�k�\n�\�\\I�C�\�\�5\�\���x8��\�\n2\0�F�T�D��lt\�VIs,��\�븓ң0�c�\�*\�*\��=;w\\�h\�p�\�׷iً}i\�[�\���1��\�70\���\�޽��*�##��2k\"�I��R�FU�`��D�X��6\��\�[�\�\�\�\�\�Ny�\��=5�.��8\�ۧ�m�1\�?N�9�\�s\�4Y\�\�8$r=麜\r���f�0[8	 ���Y�a\�v*\���Er=ͩ\�x���\0z\�J\�%\�n�pHW�8F\�\�{\�u\�8]\�\n\�3�V�\�ˡ\�j\�\�\�sM��}������7\�p1߿5Fx�p\�r:�\�=�t̤jE�i�Q!O^�٧\�hq	\�\�I�z�c\�ݛI��R1��;�+\�\�.�\�\�>�\���;��wD�h��Ŕ�6\��Jx\�,�dľ�V�M��A8\�\�P�j\�dd�\�v5����q\�l񀁈\�zSN�cs�\�3���\�6۴�Ol���dG\�\�\�\\\�\���\�Q\���1\�A\�������W$�N�a�\�ߚ\�_6\�O-��\�\����Zx\n;�у�>��\�iַ \�*\�9\�\�+�\�\�.I\�q\�gM�Knlm�$N5.E\�K	�`F9lJՄC<}F\��?�}\�j�\�\�}�H܍Г\�\�qQM6�7�\�\�+E+��\�4(�g\�\�P1\�\�t�G�C �t��א����rN	�\�Bxf!c7U��`��\�ES4*�A$��ӭW�\�f�q�>��H���HO� �\��~Ƿ\�O\�?\�T�̧��l\�\�\�P\�M��W$`����sTv�p3�I���)1\�)\�\��<}Ot&��x<\�\'�5��*\�=OӽL��-�\�ME�Dcbq\�9\�VC��0�\0\�\����;\�P\�\�i̣\���t2\�\�	\�\��\�ƨ�eH!X㓓OY\��3\�M��֜$C\"\�\�{z�]\�<�l��\�8\�>�f�5�\�\\I+��Mˌ��\�whƘ\nH¨#\�\�\�nG\n\"#$2�Ǧ}\����z\��]\�\�SE���\�y\���.�r�\�u���\�R+Z\��\�i=�կ����c\�3�\�\�j�����\�n�q\�5pAt1����Ɨ1�d!RH\��;�\�f\\\n�z`�\�t2\�\�<@,l}>aӾ+��	P�\�F\�PI���JH��8\�<q�㊊P����;\�W��Vs�\'\�\�Ӧi\�\0 [�\�u�Շ�돛�Fc%\�,s��\'�5N�I\�ǩ��yTn�驰ٳ�\�=\�Vd���\r����y\�皤5)U~\�\�ҭ���\0c�Ʈ&2��֑\�T�\�\�?�U��<qY\�e�-��^;淢�dB\��1qhD�/<b�ap[�N{S�㿥$�\�BO�\�s\�2lKon�X\�8\��\0֨\�G�@\�����`�MF�8��u\'#-\\\�\�r�\�3��\�I\��@\�S<\�0��2i\�\�y\�\��\rDA&\�%緥5�|]�<�\�W7�� T4e0FA拉#2$�Ww��\�U\�\���3\�C\�ԫ{{�)<�c�>�\���v�\�\�L��m\�A�\���\0�nd��\�0\0\'ۥP��L�d�,�cֱ�:`�\0��0iFYG�Z\�\�\'x\�h�>T9���SX4n�~rweG8�q��\�1\�\�\�{\�7\\u<���}���s\�N��\�sҪ\�(o�t$�ɫ�!�7�\\W4��\\3\���\n\�\�Ih?��\�R|��H\�\��D\�i�S\�q\��\�^��S��u)L61�\��⯭�\�7\�t\�Ո�\�|����a\�z\�Hv�w\��\�\�\�bц\�-�\�p\0%~^3�\�+>H�o�J���\�T\�\���O\�?!�9�\"�Z�\�\�S&ңn\n��j[�E��6_�7$ϊ�n\�8�bs\�=\�n��Ġd�\�;�C\�A%\�lE\n��^s\�ޫ\\\�\�8\�\�\�\�\�ߵ@\�\��zb�p\�E\�3F�rs��J�V�A�\��=iZ6Tݴe�\�x���\�H���\0w�\�qR,\�nO!��ŵ\"m\�)+�\�t�kq3�\�wo�NHϭ^�a\�y\�\�~5�ʹ\�U�^�\�/`�&�K ���A�L\'!P\�~sM\�$�<ӱ-�Yzt-Z�C*]�U\�o\�\���\� a��\�\�\�}���\�v�\�)2=�\�,�����#���%~\n�˂*�sA\n RX�Mk�\�p�I��W#2c���g�4�d$\0�\�\�\�}j��+\�$\��^�~9U�\�0q�V\�d�h|�\�Uf�\"Ʌg�[�ȣ�0A5\���VKkc9\r ǿ֜cq\�V`\�zu\rE\�9�N\�8\��\�\�P\0\�\��׊\�5Kkx\��\�c�ދ\�vҒ\nl��y\�M\�#b\�`�rk+Lf]J�\n�u`\�\�\�	G^� wV͕u(3к\��4�ʝ�}\n_\�\���\�W�M�߽��opF>OB\rzB\�S\�\�j\�x\�\n\��\�N\'�Q\����h|�y<t5A\��]�ȹu\�9��\�\�\�g\���\�*B�\08�\�d�j78NA\�TP��9\�	\�pwq\�CR�:dP\0	\�A\'�J��3\�5_zp\�\�q\�aMe�\�=1U�s\�\�)L�c<Ғ}i�\��)=n\�v\����8?\'�Oq�]�=}A�o^9\�\�P\�+\�Q\��\�`X2��\�De\�Q62iq�@XV|�#\�G�py��\�L\�\��\��3ڥ/��ǭV\r\��\�8�\�‱<x/֧�\���A�qV7��&�1նF\0�\�5d\0\'>��c$�}=jc/>��h�\Z7lٟ�<�^�� �Cc!_-Tϧ��	�cZ\�-.\�u(\�6:\�M6s\��ׯ幹F�\�8�\Z�\rn\�d,�\�Tg�Z\�\�×fa�\�\�[\�\�\�?8[\�钪��HNNk�M��.ı8�\�k��\�s�RIQ\�\�\�����q���9��i��_\�d�W_\��`\�\��\"d�0\�)�\�&��\�\���fe��Ӯ+j\�\��\�&$���$�\�Gs��N�\�<���\�\�|m�P��\�\�Q\�#\�W\�lnc�\�FR\'0P���+�\��Y�4�$�\�\� 0\�\�Oԓ`V>g�\�l�sǧ&�Z\"���B����\�da#\�\�WV�\�B\�\�J�\�rNK{qX�j\rt]I##��\��B��P�+|�\�\nHǿZ�\�\"\�\�Z.�\�q\�z\�V����|a�8�>�2F9>�\��g\�׶��N7�\�u=\�\��m=�&V!1\�=�\��\"��\n\�c\�;�X��\�1�h\�\�V�kc6\�u�\�Ox]\n�ٞI\�~�\��\n�\�m�\�IfB\�\�G���\�\�\��\�uK$�W��\�sǸ\�u�\Z�����2�V��;��\rۿ.k���Z��\�gg\�\�iB��U��\�S\�ɣr$�2�\�#� ��j\�\�)&7�8t�ގ���\n)xY���ȗj\��\�CF1A���(QE\0QE\0��\�4\�L��T3/���$�\��\�;\0J�8\��\�|��9\�Kզ�\�^\�$�Y<�>T+\�n:澋�}r\�\� �+k\�\�S���U9�����y.��A=��\"\�\���\�\r&��b�l�\����]�<�cN��>^\�|H\�\���[|�w�%\'��\�\�\�\�b1\�\��\�V��-c_�D�\�.`��\�6����\\���	\�\�	^Y7�\0ےĺ`W\�ʌY\�Ʀ���<io�r��$�g�\�\�.|{m�7��$��\�j�����Yv�\�G-˲�9\�S�W\�ד\�#/�۱�\�k��uҝ\�O���q��\�\��\�\���\n>F\��j�\�rcpc\�B���\0�]Ĉ�ʉ{��F\�錝�y���n�\�m���#ҳ?\�e\�X��שݞ}�Ůf?{w\'ܜ�u�fx\\7FGNAⰕv5Sg�\�|O��\�c9%s\�\�_�\�\Z���=A�gp]\�\�Yw!P��\��cE6{��S�@3o\�\�T�U�H\���\�`g\��3�\�vl�y���b�\��|T�\��{\��\�g��o�-�~�W�1n��;�\�\�xxv/��A\�Տn~\�\�j���1�m\�\��}�C^�\r\�\�JY�\�O��`\�g���j	Ţ�#-N?\�\�~\�\�\�\n�\r\��]\�h�\�\�\�\��iQ\�\�s\�\��\��\0dŲ��j�=�\��L,�:\��\�>f{\��-�\��\0\�ϿLP\�ܮD(�ǚ�B�h9\�\�>���;����\0f\�[�^ޔ��bLq��Z�hw<ȃ��{\�Ý-�y���\�5����!�\0��v\�\���A�o�e���.��\�\��\�?M��n\�\Z\�R?�tA�¹9ʛ�\��ҵ\�)�{?B�*��y$:����%��^+\���c�񯈠kh\�7\�}3�҇\�T����\�D��s!\nq\�\�xfq7\'?S^�\�MJB�\��\�Jo �<\n��\04�P�G�\�G\"�c�%#^\�QXo�o^�c5��m\"?̀;w�=�\�Eg\��ӭ\�0s�@\�C�\�\�Q\��U��tR������\�\�U��bOc\�pk��Ty�K����\�\�Ӓ2�\��ֳ�J\�\�ڵ�t�\n]m�_��ar3�\��۟궶�Lvb\�TX\n\�|*o����>?�ڽ[wx�ܻH\�j�\�\�&�|\�n\�hE\�\�~c�\�iAcU\ns���.���S)��G�T�WAb� \�\�)�\�ޅ�t�x\�8\�%�C�\0�$��&\\c�~+*\�P�O��B	\�CYEJ\�d\��kU�2~�n�\n\�Ӧ�\�\�5F\�\�wc��\�\�GV}�8u\�Ms7Q$$r t\�������6\�9ie\�$�$\�	`l�k^�\�[�\�;م�����u�\\BN\�(\'֩{���9�s�v�\�\�\"��lm\�c\�U)�w���ۅ}\�3\�ښ�+1��HX�z\�\���\�[q#�j�\�$-��\�\�*>��ѐ\�G@���js��\0<z}+:ki��\�]Vs�G�\�[�\�\�6\�\�;\�ϥ{�\�!s���T��\"�\�L\�#\�ԊRO@�\�\�V/\�.4ۓ\�l�3��\r���\�֮\�!��q9\�.y�2i\�0�̸rs\�]F��G�\�#\'�*\�\���u#����Щ^786�Ղ��0q\�LV\�O\��g޺\�3L���z\�x1��R?�U{�)FŽ:\�R{�\�$\'�{��mn-\�\�\\\0��v2Mr>����\�1+4:|\�ڽ9!\�\�\�=\�x�j��	;2\� \�\�\�x��Cŭ\�\�\�Al�쌬@\�o��\Z�\�)�9+�(\�}Gbj`�+�\�4^\�b�\�~&����u\�Z��֞YGR\�Г����^,�l�@N+p�\�0��\�j�.eP<�\�3\�篹�\��I\�<\�\��D~BCc�\�Si\rI�i\�\�\�ݒ\�şJ\�|5 �)1ؑ�|\�+4A�H�\��\�x>\�ib��aO��\�iX�\�ۤ��\\�\�We�p�\�|RAi4R�~0x�A!`29�5���!�f4�\'�CMyv�\�|\�u�g#��*3�\�+�ޕhɲ�Z{W\�I۵x-�A�trw+\�\�^\�\�\�c#k	\�r��\0�M\��\�\�	@\'��y�qZ\�#3\�`�h&\r�F@ϥn��+�	��xɪOi+\�\�yE\\pGqQ��\�<\�1qZ�\�\�Th߳�aQ�\�0\r^>#$\�\0\�?�r�\�;6\�`	\�\�h�\�?\0���*�$j�ɕ�\rP\�(Q\�S������̤�^\�oҺlL��~\�V�\�a\Z%۷�\�kHĆ\�\�8Ώ	�h+\�Y\r����\�\�X\�\\�~\"�Vd�\�\�\�=\�\�\r\�*\�fqQC3878U߲N@+����8�A��1[n��#�qD\��J�a!�s\�0�,,p��\�\";�\0aq\�Z�j!QIټޕ\�ii��\�\�pk�\�-\r�ΪK�zBj\�qy�\�\��Pa��q��[�Imfh\�6	\�]߆�/6!\�\�jB�*������d�~\\�j��\�\nx,\��zc�Vk�1g�J\�HX�H#4\�S\�l�L\�1\"�Y\�`�皾�K\�#\r����9l\�-wg\�q\��g��[^\�O6ˡ�\�\�8�l�PM\�)%,\n\�\�s�Ҳ�9N{WO�]*\�\�\�\�`\�i�\0�\�1���FM=\�\�\r\�+�GON:欄2\�\�u�\�R)\0n��T�;\�)+�\���c�n\Z+�r[\0�\'\�5\�:P�\�q�=:׏\�J�jP�\�\�\�c\�+״�X*��9\�\n�SgF�)d\�q���\Z+����\' �c�N3��\�;nP9 \�1�^�\�\�5F�|�:�}�\"�=N$�0X\�\'֤kt)�U\�3�Ʊ���,|�\�=�I.�rQ\�ZXɍ~)\'\�\�H�#�\��\�j6���g�y\�J%V\�qL�?Q\�\� ��5\�h�0v�P9<\�a}�\�G���q��\\\���y<�v\�)�Aӑ%U\�IP@\�\�\�l}jNsok1v�v�v�)4\�O-\�NG�&�k2m*?$\�@Mek��ǛǬ�3\��V<\�\��\Z�\�Ņ#�x#\"�\�\�)-%`@ �\�ڳ\��ʍ�\�q\�ڶ�F\�f�UJ��\�x�ϕJ�8Ԏ\��Sb��,ynx\�\Z�\�\��kT�\�fL�U\�&\0\�n�U\�.\�Y\�#�;_ǌ⤹�\0U\�OSѱYE>*d4{��7P��\�\������`O�\�\�Ӡ�1\�uI\�\'r1�g�zݱE*�9\�z�\n\�J\�\�jƂ3�	�9<�\�Ov�U=A~\\\�&����\0uo_�8\�9RO\0�ة$�Z\�w�%2ǎ�#�B\��O.�x�9�#ҏ.\�\�\�\�\�\�\r&ƈ\"�m\�l\�q\�\�\�W\�\�^I\�\�8ǭQ\�1\n\�\�x\�zz朖\�H���x\'�z�\r���*�n6�\��cj�`\�T�@�p\�GS\�]����\�\�8\���KG��H�$`j�S�\�4\�<b����ebpp6�\�\�j|6\�^w�{H@\�\�К���\�6�\"\�[���UC\�\�@1rsА�?�y\Z{&y�\�.6\�\�秡���c�1Pb$d��\�k\�Mœ�v�Ff����Fh�$(px\�aG\�<�ٞJ<?�\�Ͷ\�q�Vm�\�\�b8\�x\�\�zo��\�{�����\�(�\�!\��x>�C��2GQ���7REfޠu^8��T�yU~\�?\\{\0i\�\�A���m#�\�K\�)@��~�����Cz�Wǀ\�a�\�wW���`d\�}\�\�=�\�jp�\�o\�\���N{\��+����\\��rz5X_\�\0\�\�\��v��xe\�#���\�\�NqӦ*]y�!�iᘭ02H�\�=\�i�\��6\���\�1S�s�\�N\����\�S}�o��\�8<\�n�}C٢�\�m#��Q���\0=)^\�\�\0@]���\��U߰\\��N\�~�\\\�J̠8\�\�Ъ!G\�\�&ߓ8\�/J��λ�\�A\�=��e\�Nfm���u�\\��,v\�匳�䁒ry��ܚ%��լ1\�6�\�Pq�W�^\\���`������\�g��S�\�\�\�L\�B�\�\����5\�a\\�(�\�\�\�zs\���)�\�5\�\��4ep$\0@\"�o*��鸃�z`�^�pI�H\�rI8�4��P�\�i�w�\�|\�q�\�\�FH�\�V�\�|�\n�\�A�2=Gjr�=A&�GC�\�O z���\�\�Ϙ��kEs$K�3�����<\���Rt�\�\�\�1ޮĴ�\�#\�A�g��M>\�q]\�\�`�U{Fzc\"���Lc$;҃\'T7\�GA��\�j\0��:~tԑY1�q��\�Pf\n3�ߠ�M�\�|Ur�;1\nT��JA�\�\0c�y\�@�XY\�D\0\�=�*��;FpkM$��C(8\� ⹙��� r9 ԚF#K�A,z��26Fw~\"��\���$ND�x\'\Z?1�\�	\�1_rNi8\�	\0J��B�񬤍bH\�\r\�I\�G�=�n$UB�t�G�2�=:�\�^kwl�\0Z�SDǫ:\0	�f���E$�\�P�>:n\�\����E>^�4(��2+,\�Gc�\�R�3��\��y�؃��<w�\��\�Ͻ\�wdt\�{\�E:Wf2�b��yC��\��\�\\�*\�.9\�^�u\�\�T<\�m\�1f\�\�C�\�\�|{:�\�ME�\�$9@I�\�<�\�ZQ�\���X~�+�r-�m�so\�0\�\\\"��\���9��R!�����\�ہ\�	\�k�@e\'�-�?>x�73J\�.w\�����K��\�d�\�_�Zɗl�y�w6�@zb��t;\�s\�\�\�w~#�6�H�߸\�\0u�\�,�ƍ�\�\�u\�-H\"�W%\�\�7v�dy[8\�s��toN<aHwǭGorœq\��Q\�Ϸ8\�NBK0\�޼�S]<V#1m�������[��rR\n���\'�Eؘ�Xt!qުnR	\�\�߶kJ(\�Gp~`�=�j�s	�VV\�y=*\�!��\�x\�I\�4\�$*O�-���L��;�q\�`)�\�Ó\����±��\�@\��U\�\��8EFc\�ɯG�֞t\�\�\�ǚ\�\����\�$�7;\�\�\��Q�\�Hcf~Nj�1 t\�Oޕg\�\�A\�\�	5\�rZc���\�2J�O\�\�O��[\�>�iD\����G>�\\M�nnb���v\�x���ɨj3;�0J�\�\0W�kڋ�c3 \�a\0\���}\�Ńs\��\�).�[�\� $\�\�q\�R�ם+9ڤ�\�\�m\� f�R�\�k~Sd\�&3����*\�\�n�o\�\��׏S�\�p00\rji,c���2u��f}eo�|�dk$�7\�SW\�\\5�D�E⳵v�\0D�$��`\�s�����\�n\�\�\Z�\�\��w3���\�\�d|\�#5\��P`\0$/5\�M\�Qc�T]\�E\�pk\"\�/\�\09\�\�N������\�m�\0>X8�b���&|\�5����d*O��7}s�=\�\�h֒Z\�\�%\'k�3�^p<��\�\�W\"2�\�÷\�N�9nG���V���A\�\ni#+�A��\�`�K���\�jI�1�P0y\�֣3JH\��\�\�HX㠥=}�*5|�sRp�<Tݖ\�JoQ�w\��ژ_��W�\'\�\�I\���i\�p߽4q�({��s�x�\',zK�9��G\'���6��sNV)�KE�#v\�NsB\�i9�\�*�s�\�\�\�0�x�%��ۜ/nI=\�r\�D�P_a�~��M\�n_\'##�\�1���/2:\�ѦwqO2n�_3\�\�\��ʩ\�|\��\�)\�]`�!HI\�H��=�w�\�C!�c\��a��5Խ��\�9�\"�kI%L��\�\�\�\�QV�)H\0�A\�ez\Z\���\�2\�$\�\���}*��\�%\�C\r��־A1��j֟p�O9f\�\'���Hţ��9UR\��*\�r\\.\�VfP\��=85��[}�̮FH�v\�\�\�\��C�]�drOFs�I,R\��J���\0;WC\rė�\���B[��\�\\�\�\�x\�\�=�9�-+K�i\�\���\�TLɳGH�X\�19ܛX~<Vݬ�\�)`d$�\�3\�\�ҝ�a�o�\�\�5��E��8^3����36oZܙD��	��3���;$P��Oq�ɴU\\�S�L��\�D�\�\�a�AkNdI\�\Z�G�m�,\�L�2w��\�Z�>�\'��\�q\'\�^y��Q\�m\�\�\�\�k<�X��\0�Mz�ރg!�\\[,\��8��\�\�=i\�k;ߙ-\�c>H):�+:0Ե\���\�]\�$0>Q�(�}{\nм\�,\��\�\�\Z��z�\�\n�J<�\�[X��\"�W\�F�n#���d��\0�r@�\�@A\'ެ�\�RF6ܧ�+2mv\�(��ZQ��\�3ȨP�\�)Ԇ�7����c{\�{\�Y}�^\��qiص%-�\�4��%��IN4`b��\�)\�`\n\�@qN҃�R�1�z�{}\� �4خ�2|�\�k���~����2\\\�\"�$˱�W����O\�^��H\�0�����	xNpH\�\rw`\\\"��MF0w\��91)�9(\�\�Zx�ap�\�[�_8\")۷x�\�\�+3E\�o ��\�\��=�r�o�\�N\�\'�\�})�;\��Z>�YD�O�\0\�6`�Ѐ�\���\�t1mi�Ojd�9 6�}m*��J5#�\�,��\��\��F��I�_��D�UN�\0��7�IM\�݃o,þ{s^��i\�[\�g�\�$o\�<v�u�s�=Kc�\0�\\��:\�\�����!p\n���rjKI�/#�2]\"F��=V!�\�\�K�,�\r\�7�]>\�;^�h٤�8�mIm2��c�P�\0�\�\�t��y�\�\�\� �\� z�\�<����c\�\�])\�.�\�:*��֥%�\�P��<\\�h\�Md�\�\��$.EE)�\�ֶ.�\�\�1(p��������\�+i&r\�Ԝ\�xʓ��\�I�*i�\�\�d�\�F�\0^�N��cx\�k&Z�fG�\�\�FF\�0:�[؈\�\n۪ޏ�\\\���d�\���c\�G7���5\�#�\��H\�rZ���\�Fc�\r\�Eg̛)I3��\��U�E�n9���-\�\\\��OZ.YC\r\�G��m��z�\���\�k�2��\\\n ��rj�-���\�w\���\��\�.��+\Zr\�\�\�M����}���3G��\�\�6�D	\�\�_<��\�\�\�\�X��\�\'�\�}ڀc\�\�Qݡ\\\��`�j{@ݫ��L�<:���]�\�\���\�\�I ~\��{VO\�\�\�xi<\�)��X=��=5�\�~,J#{,g%��\�\0+�~,JͩYǓ�D\�\�E?��\�$�{��9%\�\n�88�\�\���h{t Wxa�t�+�\�u�-mZ&�C�\�	\�]M;\Z\�kfFlᐐ�\0��\�q�-���\�uQgOh<�M\�{�y4�4\�m�\�ϯ���m�\�,ĵҠ�\�呉!�x�=��|�G\\\�]\r����N\�-�\�~c֢�\�\'�V21�9���SV*xfE:��\�\0\�\�Ԏ�\�\�݌z�W��6\�\�ե��Ϲ\'\�4daqۿ|b�L\�9�hP\�6��^3�~�My%\�siw\�\�\��LÐxȯ{fL�\�\�=k\�|{��\�\�0r:f�\�\�\�3�זlx\�籦�\0h\�@\�q\�}=���$\��\�\0\�$�V�V�wF\'㞽�Zh�����G�\�Y��50\��\���.�.�d\��\�z\�Ⳋ\�`X،�G:��ʜ�,br;�\�u\Zd\�u��\�G�F8&���\�\�낄t�>��=\�h��\�\��w\�A\�\�kޭ��`B\�~>���!\���\��p���ʸ���Ϙ1��\�\��\0\�ZQ\\ �\�a�p=(���N\�\�Kj\��g\�\�^P\�\�\�\�\�\n�3�\�\�0I�#�h�FRi�����e�r��q�־�g�ϩ\�\rx߀\��e��cf=9�kS�8\�z\�r\�\�H\�M��Z�ʦg�-\�$\�Z/\�\�T��pGL\Z�rF�nw��\����qn@YPnQ\�#֜%\�p0�\�=~�5|ꐷ cu�7$�\�\�\'�����{��yS:UF���!\�s\�~L\�	\��\��\�-Y�ay\�ڍ\�\��)\�M\�ر��M��\�Ӧz�s�Z�\�>!Bm��,�\�\�\�Ex\�?6?�L\�\0u=*eg#\�l<a%\�[\�`�\�\�18\�\�\�\\η0\�.e��@|q�ҍ\��\�[��ExN\�\�9�}�*���8\�P�%m\�1�T�bH�\�劵\"\"�<p1��\�V��߻k�o]\�*n*�3sN�5I�q��)2QH<c�\�k����� f28\�?ң�G�\�\0);��\���qA%���\�\�*\�-\��|1l�\"0A;z{\�}\�i�e\�rq\�f�YRS\'9��\�{���Q\�88=*%��\�Hb�G\�S!�z�o\�c��g�\�\�\�q��.d\0s�`\�M\r���\�6A���*te�I\�\�D�B�\�Ւ\�l���\�{c�5XBmߝ�~U�bH��p�*��\�w\�\� \���%�7z\r��#\�\�\�\\=\���rFF�<�?<W�yOt�\�I\�;\�:��\�ބ�WE29�<\�l\�J��]\�\�\�[pC\�Ds\�\��\�%��^0\�)��B\��L��FH��h�\�ܺ�\�\�9=85��;(p\�\�y\��\�]{O�0q�#\�P3\�<�\�,�L��\��\�\�=\0��`\���\�H\��\�\�F\nڵ�9\0W\�x�\�w9vA2�\0]��\�R\�D�\���\�\�R\��<�[�l.;g�\�\�O�\�S�5\r5�8X\�\�)\�\�) �\�b�{T͹q�$��+�K��|m��\�M:kN\\\0�\��敌\�3��\��s�8,GJ\�\��\��P2	�n�\�\�ᙦ\�<�x<}1[:6����\'\�뜟�ۚLų?ľ��\�\���=\�\�/�\�k6\�f8\�\�W�\�\�q�N���\\^��\�#����\�Y2\�+L����\n�\�sWR$<�\�;g��1\�t\�F�;zt5=��e8tm\�,s��MI�9\�\�F��\0\�y\�;UT�\�c�Rq���ϯ�z�:L1�2\�I��\�O{HW\r�$�<qJ\���#�H�\�\�N	#��{�&�ق�d78^r+Ғ\"��\�ץ8�\����8\�\�g�i�~ܥ�¨#\�}+\�t��A\�|\�&���=\\�\��㞵\�z`>K\0F1�\�Z�\�\�ӞR#ol\���\�b�n�*Cc\�>�\�\�3\�[�_Ƹ\�����<�\r�\��\�(��X\�\�X��\�\0�$u\0r+��% 3p��\�\�5Z[��\����5}�Q��<�Z؆\�\�\np�$\��\Z�n�V#,�{u�h\�9\�S��Ĳe\\(ϯ��bnd\�3�d�n������v|����.=85���\�پ\��B�\'���\�.���\�&R;k\�]\�N;W=\�/� pa[�b�A?^9�Ma\�1�*\n�}8\�ښ_B�Vq\\C\�ʃ�K{�\�+�\�<7,L^ʌ���\"\�n�\�\�	\�J�h$ۉ9<զG;L�\rż�l�ٸ�4�ܦw\�\�+\�ot\�f��M݇\�)>�\�Wh��L\�UG(�+\�;;Ryh��nݲt?ٌ�\�\'\����\� �0J\��<�\�U\\�tќ�\�F��NGֽ��1\�VV֩��22��<V��Fc�rO#=�\�\�N\�Rw4�\�#�p�)�d��ܨ\�xTD#ۀ�\�9\�)��U(��\�5$���ƿ \�h�4ƒF\�y##��ҠI�q��{~$\�\�\�v\�J�2�w<�?\\T��bF<\���p\�FO\\Nߢ�V��D�!m�3YI��]�U��ch��݋�\�\�5Jy��\�\�=\�\�\��r�z��N��,A�u �\�\�k�GtH���b�q �+U4�\�\��_Xv�ʩ����)��\�5-\"��A\�t\�};\�ml���x�b��U\�n٠\�\nP��PO�ɥv!�̀\�p�\0�\�*A�\�lt8\"��TG�\�+\�z�OK\��nO;q׵&\�+��R�\�\�O�b�u8�N*پ�H e�Zc\�FrF\�\r+�#6�\020\0\�\�߳\"�2OL;\�-\�*��z񎢠]@��\\\�緯�=l��U� ���\��K�Fn<\�\��\�}�l�@�.y\�*q�\�\�)]�\�|dv\�\��Zsz����/�\�\�\0ٱ\�3\�9sד\��\�>�H\r�\�e~S�~�]\�B��-\�׿�d��.W<d��\�otﴮw\�5I\�\�w1Y[�\�B��>���\�/幕\�*z\�#���Wi\�K�q�\�\n=�\�el\� \�}\�С\r.e-ȏ\�8��=\�NK.A\�8\�i[�Γo\'�=A8\�u�3\�\��\0Q�\0l�d[�\0��\0�\��\0�W\�=\�l��\0/p�\0�/�5v?�Q�h��D�}\���Ѿ��\0Z(�D�\�o\��\0BY\�����\0ЅU�����\0�\�Ak���\�Z(�dH�\��Ҫ�����\�(�A��\�d�\0��\����QE1��y~��\0�\�3u��\�E�\�\��\0:��\�����QR\�7OJ��\0��𢊉\Z@rtOƈ�\0\�\�>��\�EA�\�_\��\0z��\��\�*\�3e!����\\���\�j(��;�\�q���\�i\�\�\��\rW\\L�d}��i��l��\�3Eh�g\���\�]���Y(��2��!�\0R>�Z\�4\������d\�\�?�o�?�Z��\��?�T\Zv3�?��?F�b�\��\��\�\�}��\��\0��\�O]�\0\��(\�^\�+\'X�\�\�4s�?�P&t��\0�\��\0t�\0:\��?\'�\0y�\0�V>!\Z�\�\��\0�%j\��\��\0xQEbY�\���\�?\�U����Z(�K8_�\0\�>��\��\�ʓ�L�\�WU-��E\�/\��Է?\�\�\��V\��e7����V���\0��\0\�x袦B>�\��\0\�\�/�G�\�k�A�_�\�QEsu9%��\�\��x7\�\�4z��WB\�p4m֧\�O\�_K\��\0�\��s���\r��\��{]\�	?�|\�s����\0SEtȁHt_�P>\�\�Et�G\�O����P�ݎ�w𢊖��\��\0v�\��\0��QAb��\0Jw���(��G{\�)\�\���Ҋ((��S\�\�\'Ҋ*��jF��\0�P��MJ�{񢊵�$��_\�\�\�X��G�\�\�P߳\��\0?ίO�\��sQ]�9ɬ�\�O�O\�WS�A���(���\�D��}��\�\��oߏ\�E\�&zσ�\�+�\0n\��\�z4�\'�\0�:(�{U7\'��=�ҵ4��\��\��TQZCst\��\02}kwK�\0]m���艑]>��?ήK\�?\�\�\�Ej��\����Ҷ\'�\0�\��\0|\�EJ\�h�O}�/�\�V|g�\0?����_��\��\0��k�\�~�w�\�2\n��\�$��\0Ί+©�J����c�\��7\��\�\�?�\\z�+�[��z�T��\Z�+#�\�P��\0o�J(��QEh�-\'qEx�\0\�\��\0/�\��\�\�Zg������o�QE}fY�\�Vx8���|�׿\�����\0\�W�_�\0�?\�UV*�J/���\0���\0�V�\���0\�\�y�\0��QEp\�:\�/\�_�\��n�I~�E�?�\�#q\�_�\��*\��\0D��\r\"[��\0�d_���\0\�V)\�\�QY3H�g���\0�k\�|/�\0�?�W4�,\�\�\�5�ֿ\�%��\0��(��E\�s�s�\�7�r\���\0t\�4QTn�\�����ՙ�է�t������\0�^�\�?�W\�\'�\�\�D�;˿�o�\0]��z]�+n�9ȩ�׹�u\������\0\�TQY���\�p\�\�_?|Q�\0����\0^\��\�QO\�4<�?�\��\�*^\��\0]h���΢\��]�\0\��u\�_�\0ǀ�\0r�+7�\�O\�fg���Z\�׿\�\�O�V�*\�=�G;\�����\0��\0*�(;}��(��\�\"Y{�\0�+\�<{�\0\��\��\0�UCtB9\�/�T�U�\0\�k^o���\�袛;)l���\0\�\�߬�?\�\��o\�EIa�\0\��q��\0�|7��QZ@¾\�x\�?ܫ��\0�r!E�\�\�o�����X\�\�O���*�\�C=\�\��\�7�\��W���?\�W,�6K)\'\��\0��\0S^m\��\0���\�(����Gs\�\�ܗ�\��[��\0B��\�4B\'��i\�\��\�\�E\�$��o��\0*d?~/�\�󢊙#蘿\�\���\�e�\0]u���\�\�Ed�E�#�\�\�_�\��\0r�(gT6F{�\0�O�\��*���\0\�\���?\�QEH\�W�\�\\}E/��\0\�%��R�({L\�\���\��\0�SS�o\�(��f&����O�>\���tQM	��_�{��\�OP�\��Ί+h�ȥc��O�\�u�\��\0x\�Eo&y\��\0WV�b�g�\���\0\n(�\�\��4�B\�i?\�}辭E�Qb��\��\0Z�?\�K���4QI�ɟ�?W��\�+~ߩ�\0u?���DOb��\0\\\�\�RO�O\�E1\�\��)��\0���V}�E�}��KU&��\�\�QY��#	?\�\�/�)\��Z\�Ef\�]\�\�\��V\\�\�S�ע��2/�g\�UU�\0[s�J(�\�\�?���\0�X�\0�v\��z�\r����O\��^�>�QM\r�s}���P�?�t��QZ\�p}\��?��O�\�\�P#�\0�A��\�?�gýd�\0u����Dw�\��\����\��\0\�\��\0]��E=�\�?���\�ԇ�b�\�ʊ)�&H�\�\����\�?q�\0C�\�(��\��\0Qo�\�g\�\�_�U�!���\�O\�+R>���7�\�E�N�w��\�P��\�/�QHf��\0\����\0Z��\�\�\�\�ʊ)1�?\�\��?�*\�\�����j(�y\�\�\�\�<\�\�~?ֺK�c��5W<�\�\���\0:��\0՟\��\n(�\�\n�\0�\�~�\0�\0X\��Q@u�ꔩ\�O�\��QEd+���\�\�\�\����\0J(�BK�\��\��\��\0�:(� a�\0T�\0_\�V����h���d\�����/�\0�QT�w��Uw�����QZCtA\�����\0|�\0:\�_\��Ɗ+ң�)\�\�\��r?ҝ�\0,n~�����?�\�','Tôi sẽ đi ăn cướpf','Tôi muốn kiếm 30 triệu mỗi ngàyf',NULL,200,100,451,2,1,1);
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
INSERT INTO `province_description` VALUES (1,'2023-05-15 22:06:30','2023-05-15 22:06:30',NULL,'TP. Hồ Chí Minh');
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
INSERT INTO `ward_description` VALUES (1,'2023-05-15 22:15:56','2023-05-15 22:15:56',NULL,'Bến Nghé',1),(2,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Bến Nghé',1),(3,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Bến Thành',1),(4,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Cầu Kho',1),(5,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Cầu Ông Lãnh',1),(6,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Cô Giang',1),(7,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Đa Kao',1),(8,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguyễn Cư Trinh',1),(9,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguyễn Thái Bình',1),(10,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Phạm Ngũ Lão',1),(11,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Tân Định',1),(12,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Đakao',1),(13,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Khánh',2),(14,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Lợi Đông',2),(15,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Phú',2),(16,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Bình An',2),(17,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Bình Khánh',2),(18,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Bình Trưng Đông',2),(19,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Bình Trưng Tây',2),(20,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Cát Lái',2),(21,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Thạnh Mỹ Lợi',2),(22,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Thảo Điền',2),(23,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'1',3),(24,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'2',3),(25,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'3',3),(26,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'4',3),(27,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'5',3),(28,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'6',3),(29,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'7',3),(30,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'8',3),(31,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'9',3),(32,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'10',3),(33,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'11',3),(34,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'12',3),(35,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'13',3),(36,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'14',3),(37,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'15',3),(38,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'1',4),(39,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'2',4),(40,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'3',4),(41,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'4',4),(42,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'5',4),(43,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'6',4),(44,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'7',4),(45,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'8',4),(46,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'9',4),(47,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'10',4),(48,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'11',4),(49,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'12',4),(50,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'13',4),(51,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'14',4),(52,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'15',4),(53,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'16',4),(54,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'1',5),(55,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'2',5),(56,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'3',5),(57,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'4',5),(58,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'5',5),(59,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'6',5),(60,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'7',5),(61,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'8',5),(62,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'9',5),(63,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'10',5),(64,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'11',5),(65,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'12',5),(66,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'13',5),(67,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'14',5),(68,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'15',5),(69,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'16',5),(70,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'1',6),(71,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'2',6),(72,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'3',6),(73,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'4',6),(74,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'5',6),(75,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'6',6),(76,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'7',6),(77,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'8',6),(78,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'9',6),(79,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'10',6),(80,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'11',6),(81,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'12',6),(82,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'13',6),(83,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'14',6),(84,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'15',6),(85,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'16',6),(86,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Bình Thuận',7),(87,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Phú Mỹ',7),(88,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Phú Thuận',7),(89,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Hưng',7),(90,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Kiểng',7),(91,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Phong',7),(92,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Phú',7),(93,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Quy',7),(94,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Thuận Đông',7),(95,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Tân Thuận Tây',7),(96,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'1',8),(97,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'2',8),(98,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'3',8),(99,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'4',8),(100,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'5',8),(101,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'6',8),(102,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'7',8),(103,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'8',8),(104,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'9',8),(105,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'10',8),(106,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'11',8),(107,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'12',8),(108,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'13',8),(109,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'14',8),(110,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'15',8),(111,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'16',8),(112,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'Bình Đức',8),(113,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'Bình Hưng Hòa',8),(114,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'Bình Hưng Hòa A',8),(115,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'Bình Hưng Hòa B',8),(116,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Hiệp Phú',9),(117,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Bình',9),(118,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Phước',9),(119,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Thạnh Mỹ',9),(120,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Trường',9),(121,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Phú Hữu',9),(122,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Phước Bình',9),(123,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Phước Long A',9),(124,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Phước Long B',9),(125,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Tăng Nhơn Phú A',9),(126,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Tăng Nhơn Phú B',9),(127,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Trường Thạnh',9),(128,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'1',10),(129,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'2',10),(130,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'3',10),(131,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'4',10),(132,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'5',10),(133,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'6',10),(134,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'7',10),(135,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'8',10),(136,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'9',10),(137,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'10',10),(138,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'11',10),(139,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'12',10),(140,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'13',10),(141,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'14',10),(142,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'15',10),(143,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'1',11),(144,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'2',11),(145,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'3',11),(146,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'4',11),(147,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'5',11),(148,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'6',11),(149,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'7',11),(150,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'8',11),(151,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'9',11),(152,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'10',11),(153,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'11',11),(154,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'12',11),(155,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'13',11),(156,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'14',11),(157,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'15',11),(158,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'16',11),(159,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Thạnh Xuân',12),(160,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Thạnh Lộc',12),(161,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Hiệp Thành',12),(162,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Thới An',12),(163,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tân Chánh Hiệp',12),(164,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'An Phú Đông',12),(165,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tân Thới Hiệp',12),(166,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Trung Mỹ Tây',12),(167,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tân Hưng Thuận',12),(168,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Đông Hưng Thuận',12),(169,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Tân Thới Nhất',11),(170,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'1',13),(171,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'2',13),(172,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'3',13),(173,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'4',13),(174,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'5',13),(175,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'6',13),(176,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'7',13),(177,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'8',13),(178,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'9',13),(179,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'10',13),(180,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'11',13),(181,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'12',13),(182,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'13',13),(183,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'14',13),(184,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'15',13),(185,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'16',13),(186,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'17',13),(187,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'18',13),(188,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'19',13),(189,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'20',13),(190,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'21',13),(191,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'22',13),(192,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'23',13),(193,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'24',13),(194,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'25',13),(195,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'26',13),(196,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'27',13),(197,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'28',13),(198,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'29',13),(199,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'30',13),(200,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'31',13),(201,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'32',13),(202,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'1',14),(203,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'2',14),(204,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'3',14),(205,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'4',14),(206,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'5',14),(207,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'6',14),(208,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'7',14),(209,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'8',14),(210,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'9',14),(211,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'10',14),(212,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'11',14),(213,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'12',14),(214,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'13',14),(215,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'14',14),(216,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'15',14),(217,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'16',14),(218,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'17',14),(219,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'18',14),(220,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'19',14),(221,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'20',14),(222,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'1',15),(223,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'2',15),(224,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'3',15),(225,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'4',15),(226,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'5',15),(227,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'6',15),(228,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'7',15),(229,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'8',15),(230,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'9',15),(231,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'10',15),(232,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'11',15),(233,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'12',15),(234,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'13',15),(235,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'14',15),(236,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'15',15),(237,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'Thạnh Mỹ Lợi',15),(238,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'17',15),(239,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'1',16),(240,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'2',16),(241,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'3',16),(242,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'4',16),(243,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'5',16),(244,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'6',16),(245,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'7',16),(246,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'8',16),(247,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'9',16),(248,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'10',16),(249,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'11',16),(250,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'12',16),(251,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'13',16),(252,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'14',16),(253,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'15',16),(254,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'Tân Thành',16),(255,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'Tân Sơn Nhì',16),(256,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'Tân Quý',16),(257,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'Tân Thới Hoà',16),(258,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Tân Sơn Nhì',17),(259,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Tây Thạnh',17),(260,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Sơn Kỳ',17),(261,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Tân Qúy',17),(262,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Tân Thành',17),(263,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Phú Thọ Hòa',17),(264,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Phú Thạnh',17),(265,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Phú Trung',17),(266,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Hoà Thạnh',17),(267,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Hiệp Tân',17),(268,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Tân Thới Hoà',17),(269,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Bình Hưng Hòa',17),(270,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Bình Hưng Hoà A',17),(271,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Bình Hưng Hoà B',17),(272,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Xuân',18),(273,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Bình Chiểu',18),(274,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Trung',18),(275,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam Bình',18),(276,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam Phú',18),(277,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hiệp Bình Phước',18),(278,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hiệp Bình Chánh',18),(279,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Chiểu',18),(280,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Tây',18),(281,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Đông',18),(282,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Bình Thọ',18),(283,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Trường Thọ',18),(284,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long Bình',18),(285,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long Thạnh Mỹ',18),(286,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Hưng Hòa',19),(287,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Hưng Hoà A',19),(288,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Hưng Hoà B',19),(289,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Trị Đông',19),(290,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Trị Đông A',19),(291,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Bình Trị Đông B',19),(292,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Tân Tạo',19),(293,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Tân Tạo A',19),(294,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An Lạc',19),(295,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An Lạc A',19),(296,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'Tân Thuận Đông',19),(297,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Thị trấn Củ Chi',20),(298,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An Nhơn Tây',20),(299,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An Phú',20),(300,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Bình Mỹ',20),(301,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Hòa Phú',20),(302,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Nhuận Đức',20),(303,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Phạm Văn Cội',20),(304,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Phú Hòa Đông',20),(305,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Phú Mỹ Hưng',20),(306,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Phước Hiệp',20),(307,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Phước Thạnh',20),(308,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Tân An Hội',20),(309,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Tân Phú Trung',20),(310,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Tân Thạnh Đông',20),(311,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Tân Thạnh Tây',20),(312,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Tân Thông Hội',20),(313,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung An',20),(314,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung Lập Hạ',20),(315,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung Lập Thượng',20),(316,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trường Thạnh',20),(317,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Xá Xuân 1',20),(318,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Xá Xuân 2',20),(319,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Thị trấn Hóc Môn',21),(320,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Bà Điểm',21),(321,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Đông Thạnh',21),(322,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Tân Hiệp',21),(323,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Tân Thới Nhì',21),(324,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Tân Xuân',21),(325,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Thới Tam Thôn',21),(326,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Trung Chánh',21),(327,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Xuân Thới Đông',21),(328,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Xuân Thới Sơn',21),(329,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Thị trấn Nhà Bè',22),(330,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Phước Kiển',22),(331,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Phước Lộc',22),(332,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Nhơn Đức',22),(333,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Phú Xuân',22),(334,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Long Thới',22),(335,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Hiệp Phước',22),(336,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thị trấn Cần Thạnh',23),(337,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Thới Đông',23),(338,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Bình Khánh',23),(339,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Long Hòa',23),(340,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Lý Nhơn',23),(341,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam Thôn Hiệp',23),(342,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thạnh An',23),(343,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thạnh Lộc',23),(344,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thạnh Mỹ',23),(345,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thới Đông',23),(346,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Thới Tây',23),(347,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Cần Thạnh',23),(348,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Lộc An',23),(349,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam Thôn Hội',23),(350,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thạnh Phú',23),(351,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thới Hải',23),(352,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Thới Thuận',23),(353,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Vĩnh Bình',23);
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
INSERT INTO `work_experience` VALUES ('96504318-14c7-4006-94d4-37096e999c4e','Công ty TNHH MỘT MÌNH TAO','Làm một ngày thì bị đuổi',NULL,'2023-01-01 00:00:00','Giam đốc công nghệ','796aa7de-2d6b-4c00-b7d5-4c2637ba638c');
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
INSERT INTO `zone_description` VALUES (1,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,1,1),(2,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,2,1),(3,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,3,1),(4,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,1,2),(5,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,2,2),(6,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,3,2),(7,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,1,3),(8,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,2,3),(9,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,3,3),(10,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,1,4),(11,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,2,4),(12,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,3,4),(13,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,1,5),(14,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,2,5),(15,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,3,5),(16,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Other',NULL,1,6),(17,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Otro',NULL,3,6),(18,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,1,7),(19,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,2,7),(20,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,3,7),(21,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,1,8),(22,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,2,8),(23,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,3,8),(24,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,1,9),(25,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Québec',NULL,2,9),(26,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,3,9),(27,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,1,10),(28,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,2,10),(29,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,3,10),(30,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,1,11),(31,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,2,11),(32,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,3,11),(33,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,1,12),(34,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,2,12),(35,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,3,12),(36,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,1,13),(37,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon',NULL,2,13),(38,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,3,13),(39,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,1,14),(40,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,2,14),(41,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,3,14),(42,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,1,15),(43,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,3,15),(44,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,1,16),(45,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,2,16),(46,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,3,16),(47,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,1,17),(48,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,2,17),(49,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,3,17),(50,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,1,18),(51,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,2,18),(52,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,3,18),(53,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,1,19),(54,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,2,19),(55,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,3,19),(56,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,1,20),(57,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,2,20),(58,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,3,20),(59,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,1,21),(60,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,2,21),(61,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,3,21),(62,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,1,22),(63,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,2,22),(64,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,3,22),(65,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,1,23),(66,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,2,23),(67,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,3,23),(68,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,1,24),(69,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,2,24),(70,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,3,24),(71,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,1,25),(72,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,2,25),(73,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,3,25),(74,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,1,26),(75,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,2,26),(76,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,3,26),(77,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,1,27),(78,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,2,27),(79,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,3,27),(80,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'A Corua',NULL,2,28),(81,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,1,29),(82,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,2,29),(83,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,3,29),(84,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,1,30),(85,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,2,30),(86,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,3,30),(87,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,1,31),(88,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,2,31),(89,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,3,31),(90,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,1,32),(91,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,2,32),(92,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,3,32),(93,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,1,33),(94,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,2,33),(95,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,3,33),(96,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,1,34),(97,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,2,34),(98,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,3,34),(99,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,1,35),(100,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,2,35),(101,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,3,35),(102,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,1,36),(103,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,2,36),(104,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,3,36),(105,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,1,37),(106,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,3,37),(107,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,1,38),(108,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,2,38),(109,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,3,38),(110,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,1,39),(111,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,2,39),(112,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,3,39),(113,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,1,40),(114,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,2,40),(115,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,3,40),(116,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,1,41),(117,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,2,41),(118,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,3,41),(119,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,1,42),(120,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,2,42),(121,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,3,42),(122,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,1,43),(123,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,2,43),(124,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,3,43),(125,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,1,44),(126,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Nouvelle-Galles du Sud',NULL,2,44),(127,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,3,44),(128,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,1,45),(129,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,2,45),(130,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,3,45),(131,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,1,46),(132,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,2,46),(133,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,3,46),(134,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,1,47),(135,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,2,47),(136,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,3,47),(137,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,1,48),(138,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,2,48),(139,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,3,48),(140,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,1,49),(141,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Colombie Britanique',NULL,2,49),(142,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,3,49),(143,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,1,50),(144,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,2,50),(145,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,3,50),(146,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,1,51),(147,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,2,51),(148,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,3,51),(149,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,1,52),(150,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,2,52),(151,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,3,52),(152,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,1,53),(153,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,2,53),(154,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,3,53),(155,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,1,54),(156,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,2,54),(157,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,3,54),(158,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,1,55),(159,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,2,55),(160,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,3,55),(161,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,1,56),(162,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,2,56),(163,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,3,56),(164,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,1,57),(165,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Australie-Mridionale',NULL,2,57),(166,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,3,57),(167,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,1,58),(168,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,2,58),(169,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,3,58),(170,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,1,59),(171,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,2,59),(172,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,3,59),(173,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,1,60),(174,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Caroline du Sud',NULL,2,60),(175,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,3,60),(176,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,1,61),(177,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,2,61),(178,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,3,61),(179,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,1,62),(180,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Dakota du Sud',NULL,2,62),(181,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,3,62),(182,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,1,63),(183,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,2,63),(184,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,3,63),(185,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,1,64),(186,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,2,64),(187,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,3,64),(188,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,1,65),(189,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,2,65),(190,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,3,65),(191,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,1,66),(192,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,2,66),(193,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Valladolid',NULL,3,66),(194,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,1,67),(195,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,2,67),(196,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,3,67),(197,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,1,68),(198,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,2,68),(199,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,3,68),(200,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,1,69),(201,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australie-Occidentale',NULL,2,69),(202,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,3,69),(203,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,1,70),(204,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,2,70),(205,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,3,70),(206,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,1,71),(207,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,2,71),(208,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,3,71),(209,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,1,72),(210,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,2,72),(211,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,3,72),(212,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,1,73),(213,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Californie',NULL,2,73),(214,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,3,73),(215,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,1,74),(216,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire du Nord',NULL,2,74),(217,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,3,74),(218,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,1,75),(219,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,2,75),(220,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,3,75),(221,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,1,76),(222,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Karten',NULL,2,76),(223,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,3,76),(224,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,1,77),(225,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,2,77),(226,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,3,77),(227,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Asuncion',NULL,1,78),(228,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Asunción',NULL,3,78),(229,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,1,79),(230,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,2,79),(231,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,3,79),(232,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,1,80),(233,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,2,80),(234,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,3,80),(235,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,1,81),(236,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,2,81),(237,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,3,81),(238,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,1,82),(239,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,2,82),(240,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,3,82),(241,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,1,83),(242,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,2,83),(243,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,3,83),(244,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,1,84),(245,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,2,84),(246,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,3,84),(247,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,1,85),(248,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,2,85),(249,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,3,85),(250,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,1,86),(251,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,2,86),(252,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,3,86),(253,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australian Capital Territory',NULL,1,87),(254,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire de la capitale australienne',NULL,2,87),(255,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Australian Capital Territory',NULL,3,87),(256,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,1,88),(257,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,2,88),(258,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,3,88),(259,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,1,89),(260,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiane',NULL,2,89),(261,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,3,89),(262,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,1,90),(263,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,2,90),(264,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,3,90),(265,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,1,91),(266,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,2,91),(267,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,3,91),(268,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,1,92),(269,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,2,92),(270,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,3,92),(271,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,1,93),(272,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,2,93),(273,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,3,93),(274,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,1,94),(275,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,2,94),(276,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,3,94),(277,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,1,95),(278,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,2,95),(279,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,3,95),(280,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,1,96),(281,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District de Columbia',NULL,2,96),(282,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,3,96),(283,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,1,97),(284,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,2,97),(285,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,3,97),(286,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,1,98),(287,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,2,98),(288,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,3,98),(289,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,1,99),(290,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,2,99),(291,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,3,99),(292,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,1,100),(293,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmanie',NULL,2,100),(294,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,3,100),(295,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,1,101),(296,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,2,101),(297,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,3,101),(298,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,1,102),(299,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,2,102),(300,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,3,102),(301,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,1,103),(302,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,2,103),(303,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,3,103),(304,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,1,104),(305,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,2,104),(306,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,3,104),(307,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,1,105),(308,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,2,105),(309,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,3,105),(310,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,1,106),(311,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,2,106),(312,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,3,106),(313,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,1,107),(314,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,2,107),(315,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,3,107),(316,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,1,108),(317,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,2,108),(318,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,3,108),(319,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,1,109),(320,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,2,109),(321,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Girona',NULL,3,109),(322,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,1,110),(323,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,2,110),(324,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,3,110),(325,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,1,111),(326,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,2,111),(327,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,3,111),(328,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,1,112),(329,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,2,112),(330,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,3,112),(331,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,1,113),(332,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,2,113),(333,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,3,113),(334,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,1,114),(335,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,2,114),(336,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,3,114),(337,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,1,115),(338,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,2,115),(339,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,3,115),(340,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,1,116),(341,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,2,116),(342,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,3,116),(343,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,1,117),(344,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,2,117),(345,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,3,117),(346,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,1,118),(347,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,2,118),(348,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,3,118),(349,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,1,119),(350,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,2,119),(351,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,3,119),(352,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,1,120),(353,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,2,120),(354,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,3,120),(355,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,1,121),(356,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,2,121),(357,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,3,121),(358,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,1,122),(359,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,2,122),(360,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,3,122),(361,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,1,123),(362,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,2,123),(363,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,3,123),(364,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,1,124),(365,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,2,124),(366,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,3,124),(367,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,1,125),(368,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,2,125),(369,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,3,125),(370,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,1,126),(371,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginie',NULL,2,126),(372,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,3,126),(373,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,1,127),(374,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,2,127),(375,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,3,127),(376,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,1,128),(377,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,2,128),(378,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,3,128),(379,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,1,129),(380,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,2,129),(381,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,3,129),(382,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,1,130),(383,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,2,130),(384,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,3,130),(385,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,1,131),(386,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,2,131),(387,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,3,131),(388,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,1,132),(389,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,2,132),(390,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,3,132),(391,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,1,133),(392,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,2,133),(393,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,3,133),(394,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,1,134),(395,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Nouveau Brunswick',NULL,2,134),(396,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,3,134),(397,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,1,135),(398,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,2,135),(399,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen-Anhalt',NULL,3,135),(400,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,1,136),(401,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Caroline du Nord',NULL,2,136),(402,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,3,136),(403,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,1,137),(404,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Dakota du Nord',NULL,2,137),(405,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,3,137),(406,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,1,138),(407,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,2,138),(408,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,3,138),(409,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,1,139),(410,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Terre-Neuve - Labrador',NULL,2,139),(411,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,3,139),(412,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,1,140),(413,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Hampshire',NULL,2,140),(414,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,3,140),(415,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,1,141),(416,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,2,141),(417,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,3,141),(418,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,1,142),(419,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,2,142),(420,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,3,142),(421,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,1,143),(422,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,2,143),(423,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,3,143),(424,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,1,144),(425,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Mexique',NULL,2,144),(426,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,3,144),(427,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,1,145),(428,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,2,145),(429,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,3,145),(430,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,1,146),(431,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,2,146),(432,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,3,146),(433,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,1,147),(434,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouvelle Écosse',NULL,2,147),(435,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,3,147),(436,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,1,148),(437,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,2,148),(438,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,3,148),(439,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,1,149),(440,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Floride',NULL,2,149),(441,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,3,149),(442,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,1,150),(443,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Territores du Nord-Ouest',NULL,2,150),(444,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,3,150),(445,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,1,151),(446,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,2,151),(447,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,3,151),(448,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,1,152),(449,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,2,152),(450,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,3,152),(451,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,1,153),(452,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,2,153),(453,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,3,153),(454,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,1,154),(455,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,2,154),(456,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,3,154),(457,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,1,155),(458,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,2,155),(459,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,3,155),(460,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,1,156),(461,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,2,156),(462,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,3,156),(463,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,1,157),(464,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,2,157),(465,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,3,157),(466,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,1,158),(467,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,2,158),(468,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,3,158),(469,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,1,159),(470,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,2,159),(471,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,3,159),(472,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,1,160),(473,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,2,160),(474,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,3,160),(475,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,1,161),(476,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,2,161),(477,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,3,161),(478,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,1,162),(479,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,2,162),(480,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,3,162),(481,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,1,163),(482,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,2,163),(483,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,3,163),(484,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,1,164),(485,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgie',NULL,2,164),(486,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,3,164),(487,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,1,165),(488,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,2,165),(489,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,3,165),(490,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,1,166),(491,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,2,166),(492,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,3,166),(493,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,1,167),(494,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,2,167),(495,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,3,167),(496,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,1,168),(497,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,2,168),(498,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,3,168),(499,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,1,169),(500,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,2,169),(501,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,3,169),(502,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,1,170),(503,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,2,170),(504,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,3,170),(505,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,1,171),(506,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,2,171),(507,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,3,171),(508,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,1,172),(509,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,2,172),(510,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,3,172),(511,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,1,173),(512,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,2,173),(513,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,3,173),(514,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,1,174),(515,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,2,174),(516,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,3,174),(517,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,1,175),(518,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,2,175),(519,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,3,175),(520,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,1,176),(521,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,2,176),(522,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,3,176),(523,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,1,177),(524,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,2,177),(525,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,3,177),(526,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,1,178),(527,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,2,178),(528,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,3,178),(529,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,1,179),(530,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,2,179),(531,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,3,179),(532,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,1,180),(533,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,2,180),(534,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,3,180),(535,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,1,181),(536,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvanie',NULL,2,181),(537,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,3,181),(538,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,1,182),(539,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,2,182),(540,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,3,182),(541,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,1,183),(542,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,2,183),(543,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,3,183),(544,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,1,184),(545,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Île-du-Prince-Édouard',NULL,2,184),(546,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,3,184),(547,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,1,185),(548,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,2,185),(549,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,3,185),(550,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,1,186),(551,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,2,186),(552,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,3,186),(553,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Almeria',NULL,1,187),(554,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,2,187),(555,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,3,187),(556,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,1,188),(557,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,2,188),(558,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,3,188),(559,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,1,189),(560,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,2,189),(561,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,3,189),(562,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,1,190),(563,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,2,190),(564,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,3,190),(565,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,1,191),(566,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,2,191),(567,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,3,191),(568,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,1,192),(569,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,2,192),(570,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,3,192),(571,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,1,193),(572,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,2,193),(573,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,3,193),(574,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,1,194),(575,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,2,194),(576,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,3,194),(577,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,1,195),(578,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,2,195),(579,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,3,195),(580,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,1,196),(581,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,2,196),(582,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,3,196),(583,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,1,197),(584,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,2,197),(585,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,3,197),(586,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,1,198),(587,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,2,198),(588,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,3,198),(589,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,1,199),(590,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,2,199),(591,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,3,199),(592,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,1,200),(593,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,2,200),(594,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,3,200),(595,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,1,201),(596,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,2,201),(597,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,3,201),(598,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,1,202),(599,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,2,202),(600,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,3,202),(601,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,1,203),(602,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,2,203),(603,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,3,203),(604,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,1,204),(605,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,2,204),(606,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,3,204),(607,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,1,205),(608,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,2,205),(609,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,3,205),(610,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,1,206),(611,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,2,206),(612,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,3,206),(613,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,1,207),(614,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,2,207),(615,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,3,207),(616,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,1,208),(617,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,2,208),(618,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,3,208),(619,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,1,209),(620,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,2,209),(621,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,3,209),(622,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,1,210),(623,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,2,210),(624,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,3,210),(625,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,1,211),(626,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,2,211),(627,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,3,211),(628,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,1,212),(629,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,2,212),(630,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,3,212),(631,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,1,213),(632,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,2,213),(633,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,3,213),(634,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,1,214),(635,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,2,214),(636,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,3,214),(637,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,1,215),(638,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,2,215),(639,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,3,215),(640,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,1,216),(641,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,2,216),(642,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,3,216),(643,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,1,217),(644,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,2,217),(645,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,3,217),(646,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,1,218),(647,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,2,218),(648,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,3,218),(649,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,1,219),(650,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,2,219),(651,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,3,219);
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
