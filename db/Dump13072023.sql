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
INSERT INTO `category` VALUES (50,'2023-05-14 15:40:41','2023-05-14 15:40:41','ndlong2004@gmail.com',NULL,_binary '','parttime',0,_binary '','/50/',0,_binary '',2,NULL,'Bán thời gian'),(51,'2023-06-17 17:55:13','2023-06-17 17:55:13','ndlong@gmail.com',NULL,_binary '','fulltime',NULL,_binary '\0',NULL,0,_binary '\0',NULL,NULL,'Toàn thời gian'),(100,'2023-05-14 15:49:35','2023-05-14 15:49:37','ndlong2004@gmail.com',NULL,_binary '','remote',0,_binary '','/100/',0,_binary '',2,NULL,'Làm việc từ xa');
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
INSERT INTO `certificate` VALUES ('f8f46e06-15ed-4834-8569-1260d6c1c3b9','www.404.com/1f','Chứng chỉ đa cấp xuyên lục địaf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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
  `PHONE_NUMBER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UK1nbk11jltesa5kihmrcai0v7y` (`CUSTOMER_NICK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (150,_binary '\0',NULL,'2023-06-02 06:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nd1long@gmail.com','LONG','M','LONG','nd1long@gmail.com','$2a$10$PZkJvjw3MeS3yPCEpG0N1ev2.vHfV67sYi8UGiQ3NOAQAbnJDvt.u',NULL,NULL),(200,_binary '\0',NULL,'2023-06-04 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ndlong28@gmail.com','Long',NULL,'Nguyen Duy','ndlong28@gmail.com','$2a$10$vf19FUZolHFtX1V.81FPgOjXauxSDVeBRwH795gTjQ61INyPS4Kn.',NULL,NULL),(250,_binary '\0',NULL,'2023-06-04 21:56:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n@gmail.com','Long',NULL,'Nguyen Duy','n@gmail.com','$2a$10$8QxgxJwxlNlE/0KbqMMhhef6ftxg4ARMo7yBdoxFdo6ougBta.5wO',NULL,NULL),(300,_binary '\0',NULL,'2023-06-04 22:03:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADFADFDA','Long',NULL,'Nguyen Duy','FADFADFDA','$2a$10$hrfjwSWQtN8OL2FAKP/gBuOjmryT.BKByi7/qybNUWfr5vVds7jAm',NULL,NULL),(301,_binary '\0',NULL,'2023-06-04 22:04:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADCFADFDA','Long',NULL,'Nguyen Duy','FADCFADFDA','$2a$10$8dV/0/dOBfhl2ZvjvXX//.U7kUIz1CCTQjLz2U0zj5pgFwqrBrg1W',NULL,NULL),(350,_binary '\0',NULL,'2023-06-04 22:29:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','Long',NULL,'Nguyen Duy','11','$2a$10$mVznvJeKC7lbq69pDOuAsekhHbgJ40Wgg6Y9mWoLNAw6wKL.jA1ga',NULL,NULL),(400,_binary '\0',NULL,'2023-06-05 07:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','LONG','M','LONG','2','$2a$10$py5v/xirBlHZFbaD1xYAceFagWlIiTIJV.GIACMH0R1pgUbW1DKuO',NULL,NULL),(450,_binary '\0',NULL,'2023-06-05 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2h','LONG','M','LONG','2h','$2a$10$xzNuMCgmsigbIE5QNqFu3eFpzfcsEH1Ob79.60xXQH0jtIgP/qv9W',NULL,NULL),(451,_binary '\0',NULL,'2023-06-05 20:33:58',NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-13 00:00:00','23h','Nguyễn Dũy f','M','Long f','23h','$2a$10$uvxF0aciYoSf/hN9JPqhCO2bn8ekEHbHArkg/yeV3R2TZy0kuwoSW',NULL,'0379755079'),(500,_binary '\0',NULL,'2023-06-05 20:40:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'long','Long',NULL,'Nguyen Duy','long','$2a$10$gINxxwKvs7am5uA4dwdOtO33633u1n8Sj3FvLya3mSp.6fvNcrJly',NULL,NULL);
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
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
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
INSERT INTO `cv` VALUES ('92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Thôn Kỳ Tân, xã Đức Lợi f','Senior Intern Javaf',451,'nnn');
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_skill`
--

DROP TABLE IF EXISTS `cv_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_skill` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `RATE` double DEFAULT NULL,
  `SKILL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CV_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROFILE_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn8blm0j58g2sbv4ujwi0eke59` (`CV_ID`),
  KEY `FK3c03v196xwxsadftd7agp7x3m` (`PROFILE_ID`),
  CONSTRAINT `FK3c03v196xwxsadftd7agp7x3m` FOREIGN KEY (`PROFILE_ID`) REFERENCES `profile` (`ID`),
  CONSTRAINT `FKn8blm0j58g2sbv4ujwi0eke59` FOREIGN KEY (`CV_ID`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_skill`
--

LOCK TABLES `cv_skill` WRITE;
/*!40000 ALTER TABLE `cv_skill` DISABLE KEYS */;
INSERT INTO `cv_skill` VALUES ('dc87cb8c-0ebe-4a9c-808f-0dce35e54bf3','Khong dcó',999,'Skill test da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e',12);
/*!40000 ALTER TABLE `cv_skill` ENABLE KEYS */;
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
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
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
INSERT INTO `education` VALUES ('f4eba01f-f819-4152-8b95-a1aae1ae4377',NULL,_binary '\0','Học sinh chứ gì nữaf','Trường THPT Số 2 Mộ Đứcf da update','2023-11-02 00:00:00','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Tao là trùm trường m có ý kiến gì ko');
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
-- Table structure for table `job_rate`
--

DROP TABLE IF EXISTS `job_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_rate` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMMENT` text COLLATE utf8mb3_unicode_ci,
  `DATE_MODIFIED` datetime NOT NULL,
  `DATE_RATING` datetime NOT NULL,
  `jobRateStatus` int DEFAULT NULL,
  `ALUMNUS_ID` bigint NOT NULL,
  `JOB_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaannichnepayeg148s34t3e9e` (`ALUMNUS_ID`),
  KEY `FKa5ruq7eus2pv2rq9r9x5ktx56` (`JOB_ID`),
  CONSTRAINT `FKa5ruq7eus2pv2rq9r9x5ktx56` FOREIGN KEY (`JOB_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKaannichnepayeg148s34t3e9e` FOREIGN KEY (`ALUMNUS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_rate`
--

LOCK TABLES `job_rate` WRITE;
/*!40000 ALTER TABLE `job_rate` DISABLE KEYS */;
INSERT INTO `job_rate` VALUES ('2f6269af-0b9d-4604-bbcc-bda2374de8c0',NULL,'2023-06-12 22:18:49','2023-06-12 22:18:49',0,451,2),('c2c0cc03-e43f-4713-a7ba-1520592f5070',NULL,'2023-06-12 22:30:13','2023-06-12 22:19:00',1,451,151),('c4b34203-78a7-4a64-8290-dc5dab47d85c',NULL,'2023-06-12 22:18:54','2023-06-12 22:18:54',0,451,100);
/*!40000 ALTER TABLE `job_rate` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_description`
--

LOCK TABLES `location_description` WRITE;
/*!40000 ALTER TABLE `location_description` DISABLE KEYS */;
INSERT INTO `location_description` VALUES (1,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(2,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(3,NULL,NULL,NULL,NULL,1,1,1),(4,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(6,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(7,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(8,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(9,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(10,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(11,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(12,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(13,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(14,'thôn kỳ tân',NULL,NULL,NULL,1,1,1);
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
INSERT INTO `location_product_entry` VALUES (2,3),(100,8),(151,9),(200,10),(201,11),(251,12),(252,13),(253,14);
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
  `STORE_LOGO` longblob,
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
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2023-05-17',NULL,NULL,_binary '','IN','contact@shopizer.com','december','1234 Street address','My city','Shopizer','888-888-8888','H2H-2H2',NULL,_binary '\0','LB',37,105,1,NULL,9,NULL),(2,NULL,'2023-06-18 22:23:54','ndlong@gmail.com','nhahangmoi',NULL,_binary '\0',NULL,'2023-06-18',NULL,NULL,_binary '\0','IN','luanluong@gmail.com',NULL,'Đường Tô Vĩnh Lợi, phường Hoàng Hoa Thám, quận 11','Thành Phố Quảng Ngãi','Công ty trách nhiệm hữu hạn ăn không nói có','0379777722','84',NULL,_binary '\0','LB',37,81,NULL,NULL,9,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0 \0\0r\0\0\0��6\�\0\0\0sRGB\0�\�\�\0\0SutEXtmxfile\03cU2FsdtGVkX129xZeeesbFzHh5QKlBLKznlYWtoHdeROk9Rd6p5A%3DZ8nPJLP5xvaLIVoa9eaaD2WysOIsLv1DcK5VYvPyBKMjeE2LPNGlSAGkNbQGCkC96wS6X0a78qlhk%2B6G4%2FbYvauSPrVR%2F8VcxXeq6z4KRDQODIYXbpT1P7NMh2Mp6%2BLu7juHVCUOZVh7BZZcmgnZnUXvMD2p%2FtG5UjF7USKoknSRLe6gkgE8QFrv65Y5DNZw6wn7iHKdB%2FWVsDC7%2BnnSlHpMu96RvYUwvSEseU3n60i1qecw%2FtaYa%2Bk%2BNQ%2FVPZLjOWXAPcpQfwAIG5aJCx%2BTM8WxMmLuK2QyXQgTz7n6ZRfbOYsR4NAJPh50xWdcL1I%2Bn5devAaABCnp4l8pG8xsefkBeQr9ev5XMqs1bLR5GFzBtRQzrpzyTAXXOazI%2Fk%2FavQ5r9wTK3pyNlndZFDHtLiKxZAy%2FF8xwilcCtGS5D%2FWAqxoFXX%2BeLZGgOTwq8Z6ezP6PiVGScKiO3N6V5KgG%2FZLOvJR4zGM8V7vQiOf%2FaKkICUiCQ50Y7DKTVqsu1j7NJ80RRR47eLiwc3wGsVOp20sZoJ2uRETgGVuC38BqDv1MiVPWJIZd9iB%2FE6nDT24MVS%2BLcbHHFgoWhKCHv%2BvbzTji9x7fI9Ad%2BiDQ66az1OGnKZtUWNS5nspfKye2wi7%2BulgffgzGtyP8ilYbVUTsaq9SOGrf6U4rOy19xX6LLaJ8tsdbmZUBbZnnM2ewpF%2BsgSFIQwY0JuiZvD6imHthk4lGmTSfSg9ReVhFaeZQzHFY4lvQ7Zgbza%2BTQ%2BJti8EQaxGonuOZ7d8PdqdKsKhMm5VD3DeKN2Zqyzjv%2FKDLVE6o8D3HPn0T5n5JOvBuCzOTDPzIFhbTO%2FU590gOqgzZhrIGzOT0gtBlNAup5tFFdcfSAKyH%2BOnpkjkxzKxxGrQgjgMj8nnLAQGvOcmMG4U6WwDRsWE6mbs7ZyDTu%2F%2FTtoR1jxU0Uju6O05YKxeFfjV1x%2BtN7153MN5QVpOP2Bm8CYgZcytkCLXXCH5Q22hiCIXhnnX%2FgXPG9JMVdFGR%2Fwls4klbSpUEWfgO%2FaHzDhhA3Eit92%2B1vIfGrneuziQzqjSzIh8FDIj%2FfLQ5gBr5xhL8xjiHEU8Otx4w%2FHC7AHCeGRfr4x2D1z58K7wtqxLJAUw%2FxNALwByraNMk1vChvXZ3kT8qZc4INFPpLkjzqCLp6CTh8P%2BQDRk9m4suXQ%2FQRYbfLnfby7qrSIQs1b2m4jDK7Uu%2FGU6biFitVT1boW5MerHRYWoyW6TZCqEhLuJFxI7aJeWdiQLZKjdvR5viawyNPuIvCFGiQQP9HXsc9xdGHKDenVZcjeU3fB6hVwygi50RotWgxtyQgm6QcrwbuDcDIWVZhxSuYKLtXQaYZ5RhefWGZFhaTm0b4IAvmhah6EWnkSn0LeWbvGG358IQC9%2B%2FiI7kbcrgq1i793IcnjsIlncb2yxMSdOs26%2B03s155yM2Hr68FzV45wXMERW2YdZWLVa2Ivacpecz292HZWdkkuYha0tNJxxEyvUKlWiavwPOXg5B1lcBrQc4XPP6Qw1nsR5tjc9YwScRqnNBYX%2Ffw0lVcnKwLAp3l4891egcuZqk4OI3z9yIwLNcNeoIAkGCOCYAfkXPXhWQ%2BpakRFKg3tinaW6%2FHZzXXM2%2BKADE8g42u5MoeP11PLsHVR6zVNDZx82tVRYQP4Ak5%2F9n%2BW9xy9N2jzAC8pc%2FGSBF0UhmcR8%2BhVRMpGayc%2FiPs4fKo1fIKRs8CRlMi9JqaDzOm3ghR8Ypo%2BSh6qf2XSOaDTbbIUBF74Gtvj%2B0fTQTSBe%2BfprbzdXYt6hZQPr5SgNrC1CR4RLjd%2F4hJZcvfPYMCh3oGudm8HD8zm%2FydBg5a9t7Kq3Qad9qvsYtuLmJfV%2FoN3fH3%2F2OBwlPOsPg28V4L1u9C7FfX4emY2b3LJzlyavpcVtycAfFAcdbSxswA9elFSzzOTJ7VWF%2BOZ9XkAgk4TAoR2uXgAqUoTzgmewwrccdDA7cLq7hTabG67sM54DZvHQF8d7om1QGWPK4Z%2Fx%2FfKgq5hoZeDLPk6e%2B2%2BuawgCvmKgheiiHHkwSzX4BKVIwa8u1vhWFYz7pIsde7FyrXMMz7kvG5tDQ99TEUrv2K1qUtIb1n3JRM4i0D3oBzTsjlC1neEvCvTl%2FtMrzzJpPGRQrlucxlIXkkQftDgnCvd%2Fb1aMZHo5Y3vaGEzhUgefu2DCCtsgvV49j8oVF736GSksc1%2BmBkwdQ578UGQERN9T2bdCW3pLrspMu6O5kYqDmQW6t7PYXCWPvolFyYtmqED47bWKB%2BbbuGkIrbn2qE6r%2F33YqUUBBoyAF8GJbw5%2FH2DUDgFMwyEbVY4gLd1dZwZZikUJeu5T%2FfO2qHzLStD%2B7bmVv%2BJJsVFHfRWN86OTWRqslfSZpeS34sXwg3GP6qC4t0m0S4ZAue4dhviSfjeWj8YDuoI%2BsRMdgkqWPr89P8ffDa9JnszetFGpdIHkfGSw%2FlEdAzeq2TyShD8DoyfF0FD6IxcN9tMwKzNFFo9cCDFQUE4FG8xx%2Bz9R3rN0WFtPDgID%2BxRn2m2LaDvSwOsavCBc1f6d5pIkiCEk3FlIOLmZxmcJ5zC3EJZ%2Firr3G7NmG68bUCFFPktk0sftXpsPoxcrk6YRpLhBu6KYrSHosWilmkpvMLBLIv6KwSSRfOiAJGKzyMpEDPaxzW20XrLdQljrJKaeRMtlS0ASif%2BEkC0agj%2FDjiYwUblzGKkkCGAx2kaxWbfuDZLRPHRcsvrd%2FRs2LwLggnDu0oXnI7Je7oFDbsgJ1kHSikkTPBPM16mDnn%2B29O68HlnaQg6LvFQjbNVEDWgehnkJDb4yiFEnVbbMhlNpmwKAmMbyS3kKEI0gHTfeDpWVVq6lebYTzrFQrXaPvr8%2BCySjCivgD6L%2FJmCTC1om0ujjuNhwv6EwBzFPSgiH8hRDOCehp8fzgfCRTKwC%2BMcSES0r%2BRlkZaKA0vw9LNEvekcLzzOSjF5aYEbkvekMR65fpmj%2B1rQKqFdymwBVQdqz%2BFf%2FUoSF4%2BQpxbA%2FW7C15kd8Rub473R5O%2F43ah9HxU1VTVKaV7hvWCwVgNv%2B%2Fi7YvqSqjIO33WHoBYsdZSGmnNAxd7vJN22sMAnHMtDmnG335hliIxOnq02lnFqVTBBlwpS9i5yibBb%2BAMQs6mSOn28LwHcGXXBVIWkShRcBdrBnNu7QmbCheiAyHELxwSyMoD0n1L5u5TqIf3tvQEoTWCB%2F7Iz65L%2FjP%2BIn254QpCiRc%2BpZB3rwnf6QldEKeEHwQx1rsYHyrxx5sZqyf6hf7NtplkJc1%2BClOUhnrKMhGr15ZkwUKHqp7FCvzjlLten5tZpOzOZwouNrs%2FAdZfxkVYtWZr9Tb5jUgFRlCTwRyNAJt5irFRTzBjjskoytXpMP5V6ABdv23QFLXYgE425QAqmhBn1k2t4MGzPp4FIDtV4CF41ySif6whKX%2Bm9nj1A0eOJUzXsG0QsGysswWLdK5d48ixexvQWG5eGTsmeN%2BXAAdsyLlW5%2Fj7pE%2FCvKuIKlrNSX6s%2FHhmm9H7d8ttIuwetFbKrGtxsEOmk0WtRbmhairaJW1Eev14ppLp2UD1VdEYCepP6UJu8SsKz6q6IE5ECC2Ln4gFi8f0eeS0r9oUF%2BBWiLyQJc1VmBYCNq32PvpEoTslNxpyzkWsl2hZqzjCMT2gJGK6TaDKJEj3YK%2BbL3q%2Bii6idyBGOej789qDfc0jlXFBmkogRC03jJJVT2WpltvlJ6jTlRY%2B3qV%2Fg6fHPHHtF4flBgl79P2d%2BJy%2BmgZwoODKItmnK%2FmHHWs%2BKIP9D6Fhc63MID3b6rE51IClselDn0EsqmbMqiMZFVYTjN6r3voEtIllsCJyetZ0ZJMW0ChpQXzf%2FZN8GZnW2O1Krzi9ipcy2DoPjbYyKEG0auGSGS9MVguVHaCVdptCkH8jThdE9TmzYfMwU7QOobcb0eoSxIMettB2BN9Cillnc0VF7mqkGCIaqrNF95u23XjfiB9hngGXwQXHgA9ZJUIj44kr15AJWqvOWRkhfRyzaBCD5U%2Baot%2BJ9btPvUbXRgRyzZX%2BBwzR6%2BwDPWehxxgINbEld0jp6VYSqq%2BmVOdAEbQvo3aT5XkEzMiaeUs2210olMDyTd6U%2FCh1eA%2BlCHngH9qNKovc8ShM8S78j%2FPSeA2N%2F9TeGM5xRCRkjSAr09iKGTMV0hX3boihY4nYKfoIF7TwnB1l8kXAlSTsy1OosXNl38S3DoW19W%2FWsx6SsQEptMNlCbnkVmRmPx7EEyxmNUZQZVBphts23xQBZ9n8nkxdGLVS%2BMHsOihGmegvRK%2Bc6I1h%2FRHNEMrLa0wKFymMh0x1oDuxlApkNdG8oQTmDyWQJyYJ9M11dbC7R%2F7Ac80rmofOJ97m4yxCFTh4nXIyVX5%2BeCmGSxh6qw4OHclTA7WPQG3QBPZjkutvSsa2ZgR8jqh%2BBUg%2B2YK6JTw79dObrqzWoQejISevtLXTVeDOMLo3NgXJ9e6XG8axMpSoYo%2BUiw3NGU9KKEFMdG64LtnLMK6NilIkCQOuNqgBEbkHhBvPdMGXforIKgg4l3TdB%2FLUo9azSBoJD695Nybm%2BLfDqCK1LTHoplr5lwcQZqkEuB%2BLQmXYzH4q%2BjLh%2B4Q%2BSwhCivCmqbEzQ%2B3jHqvbMwBRnrWbSaGwtuqbzsnfB6dei0WgDLCQ2sA7Z%2BrKDMNPzacxI6NN7CKcVhBaZHWlSa%2BUnT%2F82VC2UAFkVlRg49TW1sUr%2BbdI%2BKa14ZEWzbKlzaGuJlwWzisEhzX3pAe8wcZEtZQ9HV9EqtvZyfPGltv7knyL3NIqESeCc%2FyUmHVzhtkMWcP1dg0Lc2XfTLXBqwKqxfczj%2FdIMT6Be5OeRvKvIW8un%2FlpHs3x1Jxd7%2BiAukX6J7xrKWYOIRZjTvarIgNLjx1RsUahjpGu6jC%2B0rbnXpkxKOnl9%2Fbjjv9uDXrxogurEn5xi6qSfapFwbvgZSSnr9QUne2uen8sQSYiW2v6MXRQeTSmrRkPeiqVL1UtETOuHDDIH2Z%2BicHPmLNDFNUnZDyCwvRRKzecsOIukY2Yrn0vsc9nvjv51EV%2B3WGkyMfcKFrcPlra%2F8GFFbwEhppuPa7DE%2FsyGrRPDYVALOnBWa%2B%2BCWQPF3nVTqz56QxESmGrp7aRqhpuRdCioXDb3HnwWHRfL8pXLAS8mLXCixnMHY76XKKeZx7zlC5WzhdX0l0MTSe6zBxkAQHI5bZHFmO%2Fw0PVNz1yRCtWXiDhEgUgvWH%2FBNo1BK%2BTL2HMHPIXEBGClPZsXNUJnYN6O1emjPIXoGe021vvLoq5Lg%2BLvlLSqBkfSJ13qRnpL5ISWyE8bvxUT8Sp8PrEkznbW1Y%2FA8DJ4bYKmEsJCwO35eH1%2F17Rb55YrL%2FfjM1%2BQrdWu0qbWFMtUavy2AxKWLbhgc78ZxysSbZpijTpPSiWQ6%2BfW424wltS7LkIj%2FLLEQvudE9NeVFasytMHzyuEgLPQW6fNVS3fWiUpXtTQVxOXscagqz3zg5nAcWhDvF5DEekeBmj0PJ1Ru2AiCzKkoFV8cudych19uHUzUWQv0uAWOsI9wSrZiBbr6%2ByTP9ciJ%2FGtegElfnX5po%2BcbaturTxLCV1hXMT6UETYLJ2GT6%2BGZN%2B%2B6Pc%2F%2BoDGUd5s5fxT5D2cOhu89tYQjIv%2BaeP8KEVC0q6ErGkivrSfRXqz54DDgM3DvOIlNZDVLznG9WWyiphvTRLyTrhoVpjizEDdaL0XUjO%2BYKkxJv8Q%2FhrHtgz943l9fK4fZ5ZqsQT2HcYlTrhlpgYxTDeJxgSLBCwlZsfZpTqcbQ9zotD8mnz18jumVGxeXNxIhYlhA4XNk8POC0rd9bPwgV8ap3pJhGJ0Oh8taJQa%2BbBil46k4iem3xuZhhyK8ZEr99Bjk96OUnbpuqeZ7Rr2SgkJn3zpMvg1KwiJTzn%2BDOLIKATxx8BnuGfztVp0%2B%2BU4TW3tWgy%2Bk90%2F%2Bn2p9e2c9tNVkmD7pn9nLhgsw7pXNMoaRepx5ZOKxWHj4NQZcWcUcwoRHl5I8CCEjiYPubOR98pMEGtXw%2Fen4B%2FvZmdK0%2B8b8rA%2FIIydGfmUHxePtzk0RXg6nXUb86gfkUq6z0x36%2FRnJVglkFfDDhnQb9lke0LXltuAcZEwgGCMsMqkOzB1Kx9Faog0GlFHz2fzMO8XZTXwslHon%2F8ryk5Mr3TX2V3wQMerocL7Evp5r9N7oV7W631m5NVGe9JN15sJ9pRraTDU7%2FpVDn1QuMQM%2B%2B6FRIAPTvqjot8XLzi46DI0GFRueqvW60QFfX%2FAxBdCQr1VkNY%2Bbx4cL%2FX1ZGv%2BxJK78LzA60qS%2BbUcLsvQ%2FPYL7%2BU%2F1UwSmOspPKLEARfE1s6xbmHSJ7AyPRDSNRHPeF3%2FmQn6WZur%2Fx74GTZpdcPFoNjInl4GA3CYaDAM0vvcsosURR4NR2%2FrmdpKGUgnxMbda2h6peUu%2F6ooi03b4xPbB8YnY%2FVkg5jZmFpX9Ugj8UulFXX%2Bd8sqfmIh05HwayvPHgAFnozK9MwWHCwJmrXpJ9h0YePpRdac5fz59Iuoi19lIdl4ablYZrkvicYB0ob0a9Lpnj6y4NsiGgSB%2BHOoeWNWfn4WQnoBctJfkIhB6QXw3e0%2Fn%2B4X1VaYi90dztx92Frn10Mv%2FiAFYzpXS28%2BcYFGzwfxVDQMvuE62T4tUuwFu%2FR511qmE5XiHIZODvsG180JimHOYps%2FPufBTpzAsbZG2lNfzCYm6SwVTE%2BaRWPDV8bfHaLpbY6eY5ug0nVjCl7ziqXwS0tYgDkKOOFK9IIlH5zIid3ydyzL5pVcJeXBiwF3yLFDnxsh9GDIHKII9LvDRMLvr0%2Fi6V2WBf9SKFc0as9qF58wFz5IHXHnFkjbmwGbWoSbIg3vQKQa%2BUCfrORNnySEajPUkVNObuBICvZZKmnvuoDk2WKkstI43QPkwyUVEGfgP73XytAx%2FFmhQhJFhsuFFYxUKNIBV8Qp6fwrBYeoo15OWHeSo9IIkoxRvOn3fsCFaiQm50TZIJTnJyK3Y7U0ZE%2BHq%2FS750sYsDwv1jWYv%2Fj1zOIiQ5nI85T9QyD6%2BMBUuzPmCcLPOSmnrkMVKPiWSCQAtSbeNRLRrPWd%2FbIdTpBUNvSATU4SqtNg0U%2BbTO1AP0%2Fz1EBYe0%2BgDXom5I2yLx0LTwBuvEGfSGTabe%2F8QTXj9cL1flAXT5%2FIWA7GkEAJSNaGtkO1WsDmnRfnMEbvqr7y%2FVvflfNiDVz8xRyZbAejd%2FyAbdSMf637sOgbXHB6GmvjkiwkND91XHh11RD273lNXifoos4qgAlioPPb6TnC4pg7bVY%2FLCaaIq4MWI9XZ3Kr1qRU5bhy0iIDYpg30yeuw89WbkFTkRL%2B2Xy3JI10AiGK1MUxZhxSmGfboAUEIq44aY8ZGHooCX14g301DASAUEpHDiEH%2Bc47t4zmOrFJoMuz2deUqlLERrxy%2BSIQejeHCSgQQmACrl2uTCMrqng1fXho1NSkn6pBnZoNO5C3eVF8d6gQDeIXsa2okl8M8I2jgPr8H5XvqUYEYQCEkW0xj%2B%2BUzB40lyDT0qNS08yDBquuGPCSS3Zulxuo5j9Oen1F9dupbcGv7ZeN0BLUkxUYiMU35x6Fs5C2Sz%2FaHiE57Vtbusw2AY9aRU%2Ba9DEbieV%2BkzL%2B7KzExzQCqjSB9d5H4vxSmVpx2OLSGWtzo9CPtqPuWic7S0nTBgJ5Nw3oto5jqJzGNbX2cUGic3oKEhB6goOLSUpXg7Y16YUMa2aTCCbXmeZIdk%2FgrCv6wvsWf6U7gI4g0b9ZGaeGkNuVnB04klekKrUIfv%2FDMIcQQNp6%2BMPeOD3NVNibBf%2F7y91RLhluRYeBghMwhxgtAo4UZilUO1pQib7IO%2FhBRBX8r2NMWIChQgqXyhFWcHL4PP%2FJkDAVu%2BZ68ysGXTOFzDIAQAKjzK3mtTqEWy9MQQCwKmr8aBtVtF1i23C2D2CuMjVeD650%2Bh0ehuN%2Byd%2B%2FsANScUAByxDll0XniP4Q9sFnaavWIQLtMAUoHHe77xV3%2B1QOcCl4F0wOKjZtqmTLgDmKEE8944cs6FFbDZzGHfWAcWyjk%2FX1zew5fYjELa6zSl5uhUv4N9kLMDmXcwfwt1BON0iu2MUCdONUy9CyQDxor5SRtPulfrQDvKpTz4UIf%2FTN%2BdT%2F%2FtZcEpFD3Y3WOiNUMnfnFjYCQAC%2Ffljnqplg%2FqlUKoFzm9Tk1LM2vscBr1Y5X5qv6SaRtDjs0so%2BsfKJT6CHdtxtCkBfrXWRXVwi0ii26zvKy6ADFzZG47O%2F9HUqt15r6K5rk7bpwboJLYMfMrF3tbLrpEU1oNGHmgTLILq4IZ0vzEtCjwAN3fvbh%2FRyN50wEsdD7C7mljLlqsxQl6CO3zkVx0sR2yTeWYxkUSK6pQZ2fTSpdEd8uPqGBk7W9amHVnGPQzWA%2B06fwQORwOZVcdv8ygE%2Bwy2im6YU3RMIBBB%2FYrPmcd8YPuLLvQGUHPt0RDYbTfI4fhIVrlhrZEvgYeHtOYFJsk0ynym0N%2BYU1q8KB05yt3XM4P%2BHzDeNfc04vaT8aJ40HbSwrEJZ1eAb7%2Bhq4386akU4jRdfuLak%2FojpQP5f4yyfWLb8cAX5aUkafWagw3TxGDaOA37KiitaEZgS%2FqsTVLlnTZi4bTd4sKIAK0mEy6efnEs2KCF1TRSFM4vMhZtgbMkLNAkPfRxg1eRJfFE%2BnESX9aFgwPJhafhwLPA9MRWVf62M41apd3WHpgnvuSnB7H2LE1DXuXWYwYRfUn3ALYPDmf6IXW6UDCG4YVUzp1dQoCu3SynJZFp0geEOFbY9mCQJN03JKdMDthKxzIu8RFvQjotdOi51%2FnulVgQW0VVnacM3n0rQ9%2BPJuh6In2xD99mFyJiDQ7e2nACgMF5uCcqwgDO3c60DRAgLptWlRdmQDfTydMjlxWC8U4fubMmZIx8HhOUia8oCu37cjkqhpazPPsWPekyNcN2hTDCcxJ72e8E63coZ6jWtHe3DGrHjwOw7xdsSEFbcA4XakV4emmHc1cDjH6MB4Yb%2Bs%2F0LFy0C1VgkqvfZhksnPMoh%2FiUDJvH9wF6xfCz20f9dLDBe4FwJfDTHEdRc5ZxCVMEUnSMhFiQyeiNbLDIhgguS1vJ9WbD0hyBeB4g54T7hK2Ql4cBMCcS%2F0ggUXIDH%2Bxixa2Kkwi12rsHh%2B%2BKoMe5FFpkMk8MkP8XDzD46nq4c%2B2QUi5zmBE9ocI%2Ftp7jOBZZC7wwgQDkFaETjfU7t%2FJQnjPoXZTZgDvYS7eMz3SOgfcG7Q1akz1kbU9QYMgNnXrY5jenhUQNQqFHTZoMfZFeG1C%2Fp8o7388ZOMsiBggUyQ%2FZSCKzPP5aUhHfinl9K0PixQqoFNkNFmS1U8kqixNKq80QxgfkgrogUbuLMzWKaePrDnGAumQ%2BQnTH7S9T2Hv%2FgbxbXwMFbyzZ3GTdus9dWoKz3BzQFSxOzmBq%2FIXOX3GcIeQogibLidhAtVmQMvH8FRN4ZRhwEctVRxF6L6Odr63cgQQQWln9lz3FhXeTGfh%2B0Zt3JWr4DrUW%2BSOpzi1aV4wi1qH%2BxS9uwrf7sErwa4EKOhgy%2F05rbHyiJlmitrZIqe04Wd4mNTa3T0merN9Z%2FXFe%2BPSZvfO%2FvVL4%2Bm9VMVU8EMkvjd2aXPZBeTnj76iarOrzFnsli%2FLQbERlnr94QBk9Vacmnrg57WnDWriGYe8A4SrQ%2BkDoSkT5Osdf0XY%2Byb1tHkdN5BCnDJO6Mcerq3Fgtp%2F17pHNa%2BLSibqKqbkinY52yyEevF70Uz5tfUD7JGEEAJSkXUHf3yExClaJLiuuza4ky5RgwhiFoum0C%2BeaozJ3xG2wJn2c2qD6PJCABPvw1HPKidl%2FZI64u3qez%2Fzqx4Qm47LQzwFM4zxywXWMfVRMUwISOp7OD7JjZlaw%2FddvX3%2B8DDRGX2X0suDR81aQJr4EVULxUirYNmQ97o6CpoIiTUT6oP%2BB9gXgRggTzU8lBjJDYg31QXzsITFo64r445c5p9emeOP47dPvgskO14Lo7hDDi0wg55wOvkzZOgEeHM8MwThLBdbe7B%2BkmI9aAWoYEIvishhDr28JlGmDO7hB913AJYw0oU98TDKk%2BoBraza%2Fo0P6UO8GZkPf77sOZCY4ju0ySm3rP7ah4AAF7CCFj94g%2F7OrD66I8dkMjw%2FYJKvhpilPVn6Ukyl6U%2F9CzUX59O1eZVSzcvfv22CsuyS%2BOuyViPWiCoydZZG70lHkMi3i6hbp8MopEoSc7E2DgxNMVrUcJnBC9ujNc1pLQQXvsoAgdPelDnq7AfVJ9Dh2Dwl5rDuBO%2BUWunotEpBZ0IQzVMXQxZQDahZS0690ibzvYH4yJh9KYL60J2Bn9qGtUBo0TfzQwL29sFi9jz131i8b6PBuNP70wlgxNPJGyt0iaXkAO6k%2BHHsa108oUqGUgFBh%2BCWxtw4bTIgD%2F%2FbGFT1vtzpQ51ND0R1H0ys5RR5eOzDWLOyzPP2MfDUz9G4GAekkCU4pCv4cZEZ6k1nUoYzxJoD2vfkir4flNt7Yc2Zfs3NBNytFfS%2B1erFnYekhZG6JSdiuWFspcEsxHAFafAu6AIwYVKXUzAnP9DfqBpTYp1z3ibtzJ%2F%2Fx2UjQDlrF3yc4VYHYeWXOa2lJDchSeDVI6alE5rJtaykHyC%2Bj3vettzs9Wi0JKKYf6gfumpIi6lf0h8qW39WaMLXVvQWcJxWUXf7gvkoGmeJmYv6biR7E8TdhnnOtbH5uGyzGH%2F7XyLLF6sCDuwTiEdkuORlaMgBFBErCnH3oRPlCVqvYaiuCjTsos0ZcwtQVt5B94WaJBwsr5lmkOhIeNnARIIw1pJ%2B6BPhB2wj8zVFjPnHAI5aZrWMijjCTYn%2BNfes7%2Bls%2B%2Fhc9PZkv2%2FRAG6u48AeadNe0rAhxJEtS8WrafYuTOVddfSAaqejkHq%2FaO4c25NTZSdssuiS%2Fdo%2FQxlGucg5vkw6wkL40j%2FPJ%2B279JGEVju1wuz9gDKKnOhuAUFBGkOPM%2FbAcRGr1CU%2FY2Y7%2BTLublrmQ9ki1MtxZnqF3o8Y8Ps8pDN5ipu62w4L7vWvn3h7Lgvi8i3x6KbMe%2FOsO6lGmp0gK3r%2BJDzWnDFJ1Dvt8o%2FqpC5pEmcstH3eyow8ZEiO2Lsm2B%2B7ZwX1XjTvA1CH47hYDxX3%2FIo2YsZ6qhZOXdIUWYtmP3jMzoXd6NB%2BYFRUD4Lyda994BheSaUoEBSAM170k3E4IKs01CarnGi12gf6pewx8TJVPvboKRYYn26OLYrxstG2su635nLYjE%2FqMS%2FENgCLG8xWgjNbrbhsxEfe2bfB9vFrtqTRoUV3fm22ECFRRuC0V%2BbYpQ36Wq8G%2BNna7Qyd6Xaxx2kYr3faj2VG86YZvp7I1LP%2BwxU1S4ymnnMuVngInwNOgxq36KneKDEBKBv8GHH8fiEG6OlZR47T0BhS%2Bh49fKg1Opt%2FrT1l1peoSJ79cw5I9jhVNVoKSNzNcGsysou3yXIs0YWzjUz%2ByVL%2BEsfXtH44P6zbKKyvoOmIjPp3d%2FbUojRXd7hVAI%2FwaI0sHktZeeDX4pJnffUc2pf4W9t0IlP9ismuwEekJzlnN82%2FVFYtCoXFE582q6%2F3jHajwHWZeQqkMoO4EmxCNsObZe8oeyj6bdSa3qKooZ4pMHgHtzCuzSqsQVVv8W%2B9baUdPWFoGba%2BmmV%2FRYE3EWJlHWTrPzKhbOAMFhH%2FQ%2FXTq%2Bco1WKoS66BSb3mqAXwFHQftZjH7ynZoxR0dADwrHhzic8o4OVP2BVXlzkxGt6XWkDbKQZPPdsfV8nJhJo2zrwxIfKfGem6%2FkpWx9kUmJPUsuB9gIGliNWr7DJPIyi85depH6xbZ%2B%2FXpzsIFTq8Ft8WOpgcXbVtYUmI82cwixY6RG76eKZ8R2b2J5%2BLrt6Rq9iu%2FcPGQQEKRdKxUsXKdHwamGZoc6oOKS4awowNfRzrCdkvPnfxqgEUFtmq%2B%2BE8mgkXhvRVZxZ4431WRyoftya%2FpASWg%2FILyUeOumej5nKs06c6lNABwpjJvyLr5bIJse1vA4xlDTMsELNxebChWzvE%2Fdjpl45YQa3WJS98WayRXPY0qNfh2eKWDFr%2FKZscvE3%2Fj6FE29LX2iJylF2A7yadBDWVljLnoAj6ogSqf%2FHSw6mEWGxbadIubgWT70KrEqdFWqe%2FP6hc%2FR%2B7Nqdc8cBYl%2BSL3VMN%2Fyzcz%2BnFFpmORn4gHK0n3ru800v0Kg5t8YsdxBZhdLrVY3XcSEA6AVkBU%2FsPEQtUkACqcvjDuv4bEgrovq4uH0kRfLOpz%2F1VY8BzKbB97063LomenN1Zk0nY5ywOqjKqnsQn7Gd1cEYOm0%2B863%2FCbXKrK2yGu1mYtwaNBNUzS0kUKFfR2BgsCTu8%2F79LTnbSzeZgY86Jp%2FzNc%2FDmhvy%2BI%2Bl2sacZjZPDyLgXhFj66VtFg%2F7tjCpnlfQpAksuxlMwkeb2mzLXmIMB6XoUxQOOUXgN%2F6Ged8QdjCrKx8eBTWJdqMdSlpSjA2p9A1GLHhQ%2BOYdbPQOcF%2FSOpSL31SXzydZv8dXRytWBZCVyzhsPdzL5g8vKLqTfTnBekadOe6xP7e4zZfcSUsT2BGu4q754ggqrF3G8iVs27wQffknwUOW%2BYM9KwOxh3RQ21yjbQ%2FWS3LQaVqp0z5EcOp6fVt33nZjRk8Q84ZpJ5Rp9UH7vvS5zigBzTbFKB7qluH8uwGvVOPO4hfjbCducLBg8yaWOWAWrLj4wWPjMZhZMu7U01gISmXSFPf3DXmPAPvyGPkBvEtxvoSkmZQm397p%2BBVZiqnwJrQ4e2KY%2BhulHCXZuBVe0%2BQI6T%2FKlVihZSoNYAMdBWalV5VR7mJaMvtySdcynres%2FFNMIKytlwp7zF4Z87mlNZhW8Ld5QxER%2BRD1AGJF8ty6UQ8Mv3tzev9fuP0GW2wF4xrNu4%2Bz%2B8soZzEvAnAM0TohhwZ9o%2F7u7yg99d4jJzBgZrw42irgFnGG1XZcsmQ9m1vi74BnRA8Zixo62L2Q7QwLeEuwwqsLqOxMGYAEPzE2gQW0%2BMxG8QNbjMD5XKBQb5qgq9OQXEeR9yXGZ%2F2%2F7ZTNZNTJ%2BnrLiQsqO0FlQ6vDP%2FnzhNMV0pzRJfK0uYHp2NxWe%2ByT3P8FblGq0OoLPE3Ms%2Frz3XN3Z7LE2jxgOjVGp6PMlb4N6JFL1oRUl%2BCBuEC69lgBf9fU4BwYU4VPzM4mwU%2FiBYvg1b2Jln%2FnNgc2xQLKLRDi7aeKJe%2FrMQyKVF5%2BTlx7QIYfsHhyflRODRe24ZY2bNfsYinCEBCI48muMlFQg51TBx2SnEAA3SOrrAWxlq0z6duQwTaX8iOJRkUnORdozu9MtJwh0%2BbHKxHII0yZXNpMHe5wqER0fOu7FnRe2v1ZFL7EtXmWHzSEl%2BYCE0itsJyEdCdGty%2BDQG%2BXIwX4odyF2GS12h9WRYuIi9O7%2BLbuJH9aUMXxO5B648yOsSntjZdkD3bSC5haZbU25Wp8CNrM4McZsXG%2FweK%2BaKG4pydV9bh%2Bv696ggqAQ2F%2B9PE66PfD%2Fv5UJSWgkEXYoOhn3OK1tOgGIj75vPn1eXjx4a9O%2FzFeNDia2UQriP%2BEyvJbWQ590mwF5vTAIcVOyvwSqjk3Q9eXUlNKIdrEuKADqoPZ2yG3W9STUuEBPBMQIAYUpY8OcW6HUIso8cFnsOzOa%2Bc%2F8b19ycJ8hWEt535M0hwQryxarzK0uifWTx3Q187dGNzZIfmcpSlsctaHHFvYp7o5vcqM10MAhuftsJhj28pij%2BzfKt89AZmPe3SUEgBhZ8KMfrl%2BTZ5E27nCPnZReA6ghSyW%2FpaOyT3ZIowR%2F8K1xVCCuHKkUwnpPNLwMQrbrHAwu34su6LLvAc36Z7093SWW43wiq1Xst7pTMQ1UsW0nSB5AILjXILSHcP2FRX8hLm9ZScxQ3Inxss5PvcvwBWwQWRuMLp92ph1%2BqaiZedKlYhMbWl1DlajKMmnzkXZJFm1QXoSXZXTa5B5UXo2N0od9g5CmQ%2BPy50h0Sgptsq%2BfYWfrJMTQufWMhhMNI3pAVnD0lAMp6y96cmE8SeFTr2xLLw975iDaCvckYXYnDcp7WFCUTM4vnwDWwNXtrWws7AZIygE5uSf67VKSjnsZ40pXEHSActLktzq%2BasPjIbmvVdrnzMaKckIfzV%2FFKYmnf931q27y%2BOBJiKhujvbUxWfwUVUS8OBeG5AYEdmX%2BkgizbFtT1cNrRt01XXutDKtnY0ry5IKe2sRftoGGSSwnToHMzMHcnlL2XLafOyutmfL7A73MXkz4IyRFBy373QTCdHg6x0XXXmdGJvkHs7vxy6qHdmdGw%2FyAI44uHTqxBC1Keoc1cVESIKWhVmg%2F2vHkiof2AyDPu2vwXIuIcIjg6X6aHoZekR0%2Bn7ZUwZsVf7BjhN2UW0kNeAdtfl4iR3Rar3n5s3Gkp3g7pnqT3VJR%2FW7ZeOBOzwtno3nioayS4zP3YrQd4UpsgwCNHSoaG8sRsV4fDolvh3zwaxLp8WGRhobnl1b7DCqNaGJw7LViTnGs%2FoHscfinnllk8HDRuWcpj5Q9I55aQ6Grli9UUGzB4UlzsvFi%2BcV5nq345xiPRegGsdpQ3r%2BEXKeyt1eTQYmhKlaqqy64X9kiSBg%2Fl89GvdFFEr3QyH%2Fvf7gryU5D3frocEq2RT76GB6tBGXLhlGY6KG5WYkcgv9%2FnwQetGkDxJL%2BFMDhPvgHWPAiizsZyKc8f5mG7Bq8YtshcgozkDr2xwPMROhr8VEd6hH8BqtOlb4OY0%2B6H16%2BYl6esEvsDlTaoPUFJ4xEJTNFtxtRfxDXyihyBO39yDcWTuAVms1yXLrt9IzMz5LQEnKLZWaQtZuE1HZml3DCAe7S95QFrnIGu7P3ffDaiMAmLFAVkjOAR0QF9dw7sT0TfkoVLusXpCy0bmUD67kXajbC3JPc0Hb9V%2FqVj4HDZhxX2jwDj7WI4UOb%2FWyPmUAq8v%2FXE%2BeHpNiiU6vnyZnsnOTFbVdwZo0vF6ziIKpGAE5GuwN8aODQ38VLuC9G%2FfQm8d1uXYbAIw74SBTjuhtg3V7Lc9TJRFCc81RFzZug39%2FFzC0r0Ccg%2F1nqGQmZjho84jEdV0Gd7RLAaVVos6OMNghjOj86uVEqp6946z0tMdkNv93iboouAxY2IWTqRUzOmA0F0B1qY4avLnLdvcVV%2FFOJLIZCZL4zk%2B2q%2BxTR6F%2Bqq71rdJm9U6uk%2BHWJFvKmscCzmtnDokPdmKPYx2Mm4BCp00REsizye0geOu2FAtU8B3RzjAiljGgei1zske350BKcWfbFEtKJ21TBDkAxTdr64ZHWN5yvIs%2FVFhyD3mT7i2w2%2Fq7rVDn7SZdsdjbMvw4yRM1TX4ZrkkUh%2F4QQl0si%2BOXsKT0zhHuPMkTHO9gh3u2Y%2BBqUov9E8omxZVhb9Gq7it5aw3lTySmPjt%2Blw5By8pF%2BAZJOOq79Sruq9IR9Pia2OLr%2BXT64%2B2hjYIkn702EBPJ6V5Hyay1wp0N7hz8fOAIz7aurqSSgQ56%2BlfGgnEo0VQ4f8olocs3bKZT7T6BStbo73x9Pdqr7w7N7hPz4SlOhysvFF9PWBaq%2FeRCNoZvFC74lNmUwnaEJhyxMshb39MsUbAHO06gJ2OmSBrUkhPfU5S%2BrKIX3MJ0SVvjU3V7dgbovhRM0YINLjOP0LMNNY4G5e3y4IFq6Rxzy%2Bm%2BJJKOL%2Boc3cZ7PWEZO3FnAZjIscz045WsTRwwfHByETuFubflvUdAkDzfmV2fLahRtvGUjGXnmCnObob5do4jtKuYtsAxLFOqQj6e%2FOTCnVNj6ABU0oPHtuqUaC1TBhDHYq8Bz9aV6%2BBVDDKKxYVCCS9lDAAU3b8ibUQ9E9Mdhp7cZGcYzb40RU2Q%2FyCsHYzMUU6GZbIx3fFEB4WBG2aQ5mjhbPVi5XRJjfdT9erpKRULvpiUqGTVuXgay9VlFR5U0GMtp7ysOcX%2FsemccGt83TCQS%2FkOlGmyowxTkd3vzYfgCnN81cngtZisHsxt1slwnXB%2BeyqlgFgvaG34YnVhKy8SA9usOm8HCPw%2BGmsXqyoSDmzO%2FnCQAnYupVOR2wMk7DxN3E3rJGLhlpcKtuqcbRNBBJyliBfPtMEKr3GEqpYeSpP5wItAPk8wSxRkyDnlWUqLHzdesAIR32nevkMcirt2tAU2YiuNqnSiukMLtCH1g23LwzM9yaYt6Me%2B3be7ulpvdx5iJpWnBDY4xYeVnFUSjR8TeBDYqnr8t259BK0UsF%2BPkMPcZCWnRCLohnqT6OQD12nhDKvpOSGKifPKt9jFUpT%2BgGw21zYs6i29H8f2%2BGvKmk6F7qUVJt1dPWujGuwIma7WyWwah2d%2BFDy6Chn9lb%2FsB8hTq9XffSrr5nHVFOpG8D%2B%2B4Te5li3UBi8NBgWWx3ug%2F8ewlSzLhLqiuE%2BBtnFZ%2BQoILFWxrFYFftpZboS4eWyGQfTXjLRibr%2F9wVayzZ791ZIUcxxAEL3m5YKTLBaoah3xCc7g1O6G0BZMuOX5PJrmcY6WCl%2FzmtLS2ssxbpfsmO7VY4a2YaLhTQXIU%2BKYQsq1T2jK5kfk9j273zTeLmO4ftXxCpB3nWGoq%2BPWbG%2ByGsfpHKY6XulF7HpIa%2BxS5xcNVUnPgNzThpLjJh0Ky0jWHR2692MHsYFmRKv6BGBPXYTC1neU8NqIYNSRE1zCd0jkopRWdgeisHlTM0yXVrD7BIBCFoxgBV17EwX%2FnWtrDLZ1evoxrCL2cBlR5q%2Fh7uzXSGHNOutbLZCXmHiI%2F%2BEqwS7NX5QLgaqmJ13WJ7Fy44t77fg4loHLowvgWvmpc%2FiRC0E1MLkw4KcH2rsSAL1kpSIOT4R39qZ%2FFVTNLe5BCEtLDu0o%2BH0J0F6ibw4QQU7uBIxeKrhHdWMNNNNn%2BIkZhBQZBNRUhHx3TqPP98pP6fMLKevO%2FD2NPko%2BuUJeKmF5bVaFUxkce1wOp8cV5%2BADAvvimKa5qKNPqOTyOrHGE9cEa2fGWPE36fpxB3%2FUazmSJ1GSYhY0FdaMPwKdwXVoyTvgts6QMDybdGJTb9UnSmQ1aanyu3mGSqX9LlCfbBb4pKQ7FjK5Sid9sUsijF%2BbvJCZTJUD%2BrfljQidSsGT4JlsXA8Fhz1U58xZr4eXogLQo%2BjYgO6FjLvgYEiQ9W5o7nB28k9RNmMYq65gfdzrl7fWpTTHbU5PzF%2Fwi2VsvWo%2B4X1T6eSozGPG64EL8kugblHAhx%2FVuFhrPlmMrm6NJ7NAlQL9ZTW81MURy5gluj4EoKvIVgFb298EVOe10drww5DXskHKregCQ7Ak%2FRbgHIiPn6RwCjlEiNjQrwIPqNPfDysnhJN9vRixYdWq2rWmnxnfRjRNwGo%2FDpygpzPGAdERMW9ystFe6TAVUpXfX2tPbuwgXhM74zZLnL74Xn%2BvzordFLfP2PVa4uNYZKWASxPKsBcLnCFUG86wJlzamJ10Ut8xW4SHxWW6TCYxRBaJSIYatcOBLr77U6JN03g28bBnMFiBqenoc3AgghOv5Uy7%2B8Ssb9%2FMW42R06FTOn%2BWNjgQA4OBQPdlc9Illk%2B3PGOlylg3zvicqK9%2FMZ3HVEeNsO1WOcbOQU4r1yVcn19dZQgllquO7iXjp9AHPVOE5ToiqSD66kHkrhIoe%2BjMCPGYKDRWFb7%2FFrCvTllhEMr%2BhrOQa61xhkhdfBvAe2UKHNxQHH9bF4Qb9XWWJZLarOgAew4%2FPvZVUVHnvN0D4EaU5HVG4HLTY7XvFfQ9B38sebPLnV4uuyl7YzcRPiohqDA8ILvBCQIB3%2Fh8buZgIeaWhz6b16MXSWgFhCaQ3Gii%2FgmsplaNvFQWCgR9XvVBIId0z1v%2FcF8NNTlzNTEJyND2g%2FSVzi3uw8GRn%2BT4JE2FU8YKL9wvT791XZt3mGDGQur9B57UrVgLr2eDzRHmmxUhSfeiO7hXEfrmXaq1vgyKpJhaLJrUGWlVxmfIUbip4HrHafa9Gh%2BZpf3EaOTMCQ6gqdwW1IHGzMnR9nQNCH9TwY7lSTPYuVs2R2lMhXXb9tKX%2BdqrzIa3wbj9nvL4GQgV5YWkJtPc1m9dhjSJHKw%2FJprMc3RaVhsZXtn4aHhGASfkir9aObwi3TSDmk04ctTKgHSJKxRHucHNsOPqpnEpeyLydsU%2F0ujUkPnN5ME2UF7C6ky%2B7GRLM69X2Tm95aX8y5N7DZD9pr8Z3uzZ%2BbQ8JlzKBys5bekyghfM1WM5Nr44shX%2BgsX9vIWT6GbiMw0JmeM9NB8DaHPBm9midwPzPsqr4oV4vIEP36KHQWFLNvOzLNjQeOi08fTSwY7auXsluns5RjcrV3CxuEsS1Gq2RDptNrxU4xIs0eqbzLqvyM%2FgN0WsiUCBQtxO%2B%2BWKlJ4kQF33ugAdnzD7QA%2Bm98zuo0bJlTs9CyajMJhWZbpXbXyT8FbOxcm7DWQLLxBJcUm9xqNTarR0cS1Wr4lNGa2ROBvstq7tfRFzvyCUY7td1wx%2FB%2FhYEeWFPW0pr%2F6PMwgAz2RQJjExirCLFIKkU%2FtqQpwV4alzN%2BNfF3JA9zl48WN3peluXuMp1rRYxfAoviW7EgHrKoYiJwhC4rLmCo8YgxXDGUQBZDUJU9q3ga74pZ8nGyL4PrivimduygMrGbjP%2BAoj8YiSpQiUegkxhs6VpwsoW4kDL2U48zQdVFQy9fbv%2BAEB2cWAzVIrphI41BraaGHCpKuWArfW%2B8WfZzWZOyJsM%2BHxJoj4jrDBfjtE82e7Vyge%2FABsz%2F3afD9E1xSOoVWYdjlZctTQnedui%2BQsGuFhcFIy7SbBYTXk9Pwmr%2BfgpBgq18EVyecqjMz7jXypxcgwKJaMS1SmZd0tkCg7hObsar6zkmloRAGFB5fUytO%2FbFxoz0QofNFBGbz1N29axE1iiKL81Xh6zRaQyD%2BPkoYqoL1ICdX024DgzhMuUckFMsiicGSiZE484R5wEQgkTKILSsNGJ5IwakLCkIvEmFOi5ArBy5e5g2zrKCzvujGfpZBiZw46ET%2FWD9rzj3v%2FRnSKj%2FrGJHiqkuacE8ur0Sk8YtLZ%2BuNV71eyHW3dBGkoGylSB8Lx5QcIct5cboCYkUxZwUADk%2BlPR9qBLrDR75NWMcT7YfAckDAUeCgaqtaTf8IlxTOsr0f69%2BT%2FuZ0cda1TLQCJB2VxmSgmn7LKDyxpFTG8Q5Z6YqUDxx6P9wF0mGfDiCmMeNEOcP%2F%2B2Kb4a3EGl%2Bce0DoC%2FI39PYEhL4eGmFBeyddPeefdTewxuzDBPdRZEskOOa3jJer6LeV%2B5gYdmJeCnfI1k6AsOw6txIkivojeF2kPOu4XFY6VkdvLv1llzgUWbwvxKtjvOod5TUkm5TmzwhquO%2Fnpqmpjk%2FEzTiM71C5hFq48Jiuo7JW6PtOpnghZPwlFH6ddwK8cRgsfVlHCx3A6lVzC%2FOasfliggDZYC6tkjcie7ITI4NGfxM2t%2FXCaS0z5Hc9mKf%2FYjw6y%2Fatm%2BOZ5zXppIyhm8%2B6omYsJW5b7K0Jrr2Nj7Hf%2FQWcgZ3dWk1Q87j6vXf%2BqmZya5rkBDM%2BBVdVMukKyJkOopOTbUfYWKIKXm3Mg50J3K8sUWmc4ddbyo%2BKuVnm0lEDKoRtjcdN1BjwsLxZ339acKNlntLxMyJXJ3X2%2FXKc2effhGXulWN%2BnDjPsrBVcu1LKkBDUIpTFiNcA1eZcmp57Pn5Z2bnfOLAtgoGBZ%2BTXGDRo1tWFsgnyOGWsF9Qzj8zEcHg0UnGSTii2105qfajKfHEw%2FxT7gs4fnpXuyYAvk%2FobbDjFi0t%2BTqe385UWuDThgmiys0NMBn5MssZzI6M0QNwJ4DmblIZ%2Fh3eqWASwaAMQIX69zG2sZS%2B3ftIkScT4k262zG%2FIV9uEIqGX7GMla1SEbFrEX2pi6F5OwjFhRRBQU241cr%2BeTXQ7WQj84kitP8wolLzGucRQl8D7HUsGXcsp3i17vxmf7ZaN3hOpukWudhyB5PjJsDy95xL9RAf7bSGFLZdsiVU8zNfrHIWQJa%2BNrLEM9%2FU%2FsSqVRRXjz%2Fn7vfU5X4OxaKbmomix%2Fg0n%2BbUc%2FyBvxwwNF2Lpa32%2F14XMZ3e9) ;\�\0\0 \0IDATx^\�t\�\�\�_��\"M)�\n���T�\n�&\�M�Ф%��$�@ � -��\" E)bA���(\"6@Ai�\�<w�n&\�n�\�\�&�\�g\�\�ݝ�\�7wfg\�\�-9D\�p#           7\�\�\�-jndʦH�#^{\�5)[����\�i���\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	���\�ȑC(@��&\�!�\0\�a�l�H�H�H�H�H�H�H�H�H�m(@�\r%\"\��\0\�y\�\�H�H�H�H�H�H�H�H�H�=(@��#[!�L!@\"S0�         7�\0\��l�2�\0�\�\"\�~H�H�H�H�H�H�H�H�H�2J�DF	�x\�D 26�\"        \��T��/ʼy�iӦ�裏Z;\�\�7l\�P>�\�#y�\�gS|���ȵk\�dɒ%r\�\�9r�<��òv\�Z�T��$$$ȱc\�Rtq\�=�H�>}�@��^�r�t\�\�Iƍ\'cƌqj�Ǐ��\�\�K�*U䩧��Ν;K||�.\\Xڶm�jO?��ԬYS�w\�.+V�vf;}��,^�X�^��v��\�%888\�Cq\���\�\�W^��~�I>�\�\�ڵ�\�ʕK\�\��q�>\���W�1�*U*E�i\r�ԩS�e\�\�֭�\�ɓGΝ;\';v�;v�84��\Z\Zz۹ĚX�z��\�\�;\���\�/d\�֭\���睘�(E��\�{N��\�3gN��\�e͚5�m\�6ٷo�\�jժR�vm\�С�ԨQC\�㎴�\�\�o޼)�w\�˗/K�-\�l�D���	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	���H3lf#�\�蛚\�\�\�9\�\���\�0_�rE\"\"\"dРA�jժ\�\��\�{\�\�\�����\���\0ѣGe\�OJJR��3\��\�\�WcKK�\0W-\"�,YR5���w�\�~�\0a2�\�H�rf\�z��\'O*\�>D�3f8%@\����\�f+ 9Z�\�\�\���\�eڴi+�.]�(=�� J\�� \�L�2E\��\��Lӥ}!��͊+� �\�F\"-B��H�H�H�H�H�H�H�H�H�[�)@\�3�jQ\"((HE*\�st<��x\�	\�ի��+WNy�/]�T������·��\�w\�U<r\�έ<�a8�����ޒ^xA{\�wʲe\�d\�޽j_[AD{�C�@Ԇ�\�\��-�#G�H��\�?\�1ü\�`\0֑\����\�\�;Q���(]��:�h�\�ĉ�g\��\�_�\�\0�8t萊lx��\�g�y\�Q�\�$\��a,o�_G�\��ً�		Q\���\���O&L���6G[8�\"IM�\�cÜ~�\�7e@\�c�A޻뮻T$	\�\�\�?�D/ Bb\�ܹx۵b7\�\�sD�2el`]�hQ�\Z\�\�ƍ՚��\�\�9\�x�\n\�,_�|\�6m\�ȓO>\�\�kUC <����\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	d�4[4^#EP\�֭�P��]�\0�b��ѣG; ���[k�x\�ka)�&N�(;w3g\n�\�\�ǏW\�0^c3���\�0�\�P\r�N��\�W_�\�>��0�h�� m�)0\�g�yF��B*��\�˧  � \"Fj-\��\rǣ��F�7n(o�aÆ)c�Nd�TH-��v~\�~t\�޳M��|�7o^\�c����9���Hg��χ9bFGt\�\\2D\�֭���r\�_Z��)\�.ڱ p\�)��=�\"g j�\�\�_�FH���d\�s�\�#�ȬY��P��L#F�����\��I\�T\�&	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	��7HS�\�b��|��̞\0�\� �MZf:��\r`��y�\�\�r�V��\�ѠA��`\�t=\��Gd\0ț6mRFw��i׮�|�\�g*�Oq���\�$A@�E�\�\�U� !��\Z�\�7G@@XA\r�\�_]�+��΀YX����w\�x\�O�4It_�\�\�o�-\�|�L�<Yy����}�\n�[�n�\���\�wߩ�\"�Q�fͤZ�j��Y\�jO \�Q	\�	�?Dq@x0`����h\r�\��5\�9s\�\r+ZA\�\�/�,e˖Ui��\����0N�F��F�\Z�y\�<A,B\�$��A0X�|�\ZOTT��|1��}�\0a�FJ�c�C\�֭S<a����ϥV�ZJ�@\�\'\�L��G\�\�\'�|�\�\'Ƈ���\n��0.�_X�H��4Z\�P�5O f�v�N\�aBDsĆ�s�c!�\�\�Ĩc!r�\�\rT?\�-�\Z%L�\�\r�M��H�H�H�H�H�H�H�H�H�N	�����\��i�\�锐�\���\�OU��\0!`\�t=x��:������\�Pt�S�Q�\���2j\�(	��\��0�O�>]^|�E\�ܑ�	�\�E;<���;V}n[\�\Z\��\�?��\�/ Vl߾]�\�V��A���\r�4R0��\"��b��^zI�+T��\���B�\n�}}�Z0nð�6�\�\�_�\"\n\Z7n��A����7�CDB����Q\����}\�)s�)�\�)�t�	�\0ѤIe�ǆ�P�\0\�y�\�3gΨ4K .؊D#�y�\�\�K+�	\�\�\nG�-�U�\��\�P\�\�\�/�T\�\�\� \�\�T[�V�\�h\�g.\\\rA\r�����\�z\���AºĆ�\�%H��M����\�c\�X�\�\�\�>��S%�ἢ\�\��\�\�F\�\Z�!        �)��Aڨ\n\�(�\�\���6�ȵ׺ `�ݲe�2�\�/\�T�^]*W�����k@���S������\�g|\�|\�a\�mѢ�\��9�VF�J�*	\��\��\�\�Pe$�0��!d �\0\�\��� ``F?0\n\�=f\��\���Ё\Z�7oV5(u�\��\'s�0\0�\0\�H\�4|�pm�\�\Z��`4\�,aPG�ŋWE��\Z\"\�EQ\��\�j�\���u\0#9\�N�\"�\�9p�#0�CP�b\�	`��At�Z�\���\�S�>���D\n�p�}`x\�Zr��&@@@�\n�1\'�\��\\ \�`��;\��?�#�s�h�\Z�ΆmDjƅ(,���\�\��\�\�O�G�\�6-@ Z\�48\�吒\�\�L\�p\�H�H�H�H�H�H�H�H�H�<A�*@\�۷Oz�\�iM+c\�\�\0R\��C[=\�\�0\�\"\����G\�|�\����5\0\�0�\�0\�\�iw`�ǆ<�fB�Ʊ(�ܥKe@\�E�\��޶m[e\�\�?\��\�����\��\rC7�\�0v\�h�>pڄ��Y���Fa�\�AZ#�1.=�\�A�\���\ZHI�{�n�:\n\�`���?\�a 0?+:�D��\��h&�\�;�ŭ1_D9 ��0W�&k-gϞU�``G�e�i\�ԩ*\�  �>ƈ�B\��\�T�L:�!\� m\�Ἓgà�����,8_�:1׀����a\��KM��\Z@�#�\'�b8\�\�\ZXk\00/\���TZT\�v�X�m\rG\�1\�\�\�[h\�vC\�\�R�S(�GE�)@x\�\�6I�H�H�H�H�H�H�H�H����U�@Nzx�#jFn�|||�*\�\�\��0D\�l��\0��S���\�\��\�߯�\�\�\���cP��F�\Z*5�\�\�\�yx\�c�m۶)�C�*�s�*�\0�8#]\�x\�\�\�*\�\�\�}\�{��>�\�`\�ڃ�\Zu�1/st\�\0����0nԓ\0-�+\"0F��;\"֮]���1F���\n\�c\��o\�?��\"Νwީ޶|pn\�/\�k\�\�z\�F\�!�\��v�\0�	0\��0GD)@x�1ut�%�m/\�$h�è�~\���*\�i�t*.Ev\�\�6ݓf\�>\�\�\�Z3\�b8\��`L8׈\\��y�!\�\�	�C�9\�\n�c�\��M��\�Ū�{\�F!\���\�(@�E���\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�*�\0�Fts�L\�\��UF_�\�`\�i��HG\"�QH\��\��<\�Q�ڷ�\�\���p\�\��ҥK�\��OhF�Z	ؐ&	\�\0�\�0\�\�\��|m ��\Z�bcc��j\�M\�u�\�.�\�\�\�Ei>Hu�TH�qA�0o>`\�+^��\�\�\�\����\�w\�\�U�w�h\�\\��Q\n&\�Q\�@�(�	V��娏�\�ќ�1z��J�m?5n�x\�T@q�OD�@\\Bz$��2�݌\\�\�p�\�#�,�p�y\� \��l��\0��3�cI�H�H�H�H�H�H�H�H����U�@Zxjc\�E�!4 �^cG�f6\�\��I�&�\����vF�0\Z�A��Æ\r*�\0�3Fqm\�\�b\�	@\Z#�\�q$@h=�0\�\�\���8�\�Q_\�\�2*@؎\�KZ��\��1\�\�(@خ�Ԁ���\�;�lH5�\ZD�@\�@����\'���\�=.@ ��>\�͛\�\�4x	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	d\Z�\0�h�\�\�h�#��\�\�\�?o޼js~{�F\r�:u\�8^�Y��\0�#-���J�*ֺ�BT#G\�\�W_U�a�\���@�$�m7[�Y@�7v��\0�{^�Μ��\n:\\Q3�-����\�\�\�Cߞ@\�\�c\� +\" ��	�  \�(�ԢJ\�c\�x�\�	\��҃a��.	��Rk�L�2*\�\�6\�I�dR�am�hxѢE�Yj܇H�H�H�H�H�H�H�H�H����U�@}x�/^�\�\�``xE�j\�\n��\���%@ eS˖-�P�t9�귷\��`F��J�*�t8HI�\r�`��\�\�f1�\�\�\�3\�u\�\��%@hc=\��m7��\n\�\\����:��\0qH�`B�lD~�\�(��J���/ ��K�\�B\��8\�h\�HG\� �eʔ)���.`�}P�\�\��\�\�#\���Px�M�6\�ol\�c\��V�&\�6\"\�\��J�/\�MO\n&q\�\\PÂ	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	x;�\0\�+��\�f\�\Z\�ѭ\�7�\'�#._��\n?oݺU}�\"�/��B��\�\�\�\�OM�@!\�\�\�HeTF�Ƕ^ݰ�&�\��AL\�Q�\�_�xQ%��\�,@h1�	\�5%О\�m\�Z�gNxj\��٫a��\�GAgW\�s�\0B\�;\�s[�S\�\�\�ņ\�ׯ[S\Z-X�@\�\�\�J�޵k�lܸQ\�\�p�\0���\n�\��y6�\��B�\�ȑ#�O�>2u\�Tao��\�U\�\�W_}��0D�\��c����d\�#�<�R�\�\"�ά5\�C$@$@$@$@$@$@$@$@$@YE �\0a\�H7�\�\'��T6[�lQkc<R1\�\"\�x̘1\�R\r��g\�J\�Ν�w�6Z�D׊@��\nŊ�o��V	\"H\'4}�tU�\Z�a\�\�k\�\�b\�R@݊9s\�(�:\�0L�\�0�(^A&3�Q��\0��q\�\�j.RT\r:T\�\��x�+�\�9�8q�:w=z�P����:�D�P�\�>�0�\rkC�\�ڵkQbԨQ*rB�\�|�r�\"K�\�\�ĝ���O�1\�A!rD@�v\�\�%�>\�\�`�7�\��\�\�T�\�oh֬�j\�\'�P\\��\�ݻw���H��}�*\�\��\�?�Tkk��\�j~(\��Nu\�nLL�\Z�\��JOƃ��7�<y��NKV\�0\�/	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	8K�*@\�^~�ee�׵�6\n\�o���`��*j\0�\�`���\�i\�\�\�\\|�Z�N�cn;�	\�D0�\� �v\�y�!\Z MTɒ%�0!Ŵ�\�ݛB��1f\�4\�q��\�_�\�\"#``�X�b��``G�\"0�W�ZU\�1/�1N�Qx\�l�ve�Z�\0K\�~衇Tz-\�Rs�8q\"�\�?\nD\�s��_Æ\r\�\ZB[\�\�|\�H�B�W\� �\�\�\0���\��E�1\0���Ϡӄٮ!�Sp,6=_DH\�\�\�&�B H\�k\0�MHHPuPp>��p,\".<�^#U\�5A��h��g\�6\�\�\�g�^\n\�\�nݺ9{ms?         \�RV\�\r6(�.��`���g͚e� �9s�*\0�aЅ\0�\�0�6G��2	\�0\�:c`��^���LN�:%o��J!��s\�=��\�(V�\"\�\�=^DI �b\�ҥ\�\�e�\�\���Y5 ��`�>v옪Ɂ\�0��m\�*F(|lose��\�\0Ab�3\�_���\�6�Ƈ\Z.�����B̨��bxhc�\�\��\�{\�)aų\�\�bHK�@���ضm�\���\�jN�\�3[Fwp��fl���Jh���7m\�T�{N���>�����>!Dԭ[W	r\�cBm�g��t\�\�N	D��=\"-t�l=v��H�/�\"$��.\�\�I�H�H�H�H�H�H�H�H�H��\0c2\�0\0;\�\�ii�>~��2VÃ\�v�1\Z�Y�N�5\�	��}ÇW j�	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\n�5 	�j\�*\�!^\�H5S�F\r���~��*��v;}���\�6G���e˖*��(@�ʒ\�8��\0\"M�~\�#\"`��\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	���pX�\�W&�q�@v&��L(@�\�\�\�H�H�H�H�H�H�H�H�H�H��P��ű�\�~@\r�\�͛�\�\�9a         \�&@·\�G��	�Hv�^�䫯�\�Ƴ\�\�H�H�H�H�H�H�H�H�H��+\n\��\�r^>O\0uW}�Q	���p$@$@$@$@$@$@$@$@$@�G����s\�\����\�R�xq�\�?�P�B>0b�H�H�H�H�H�H�H�H�H�R�\nmڴ! /!�\�7\�\�3\�<#,�q$@$@$@$@$@$@$@$@$@$�>Vb\�ڵ\�;�{�\0	x�@͚5U7         �EL�\�g�c&          /\'@\�\�O�G$@$@$@$@$@$@$@$@$@$@�H��/�5��H�H�H�H�H�H�H�H�H�H���\0/?A	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\0	�\"\n�x\�8f          �r ��qx$@$@$@$@$@$@$@$@$@$@$\��(@�\�Y\�I�H�H�H�H�H�H�H�H�H�H�\�	��\0\"\�\�\�#\���0�W�<__\�\�\�;�G$\0\�LO �ph�[g\�!\�t\�&9�\�\�4�cS!0�nU	�^\�\��s���0{�\�\�\�W\'|\�9$)��W�e\�f�\�\�^=F.c\��l!\�\�\�X#<\�o�\�\�{N5��\�\\p$$@\�A�\�Q�=�\��Y�D\�rrg�}R�\�)�D-E��\�$IZ8E�;����\�gɳu ��\���4�g���.H��~Axb\\l\� \0�mݧ�\\��D\�f�7~�o�Fs7\�\�\�\�\�L�͹��7nȨ%k}B�x�\�s��jw�ohoڪ\�2�\�s �\�d�\��\�\�\'�\��\�q8\n \�\"�\�(ϝw|\���\0�H\�rgɇ���Ev\�=���w�k�\�\�\�\�g\�$@&�/�i=\���CDn�7r��D���\0Ѧ\�\�R�x\�!9\�\�\��n\�0w\�.? eJ7�ו�\�:Zw�\��>�$��nܔ\�o��\0�r��?�]��\�\�}��\�7\�\�\'j�\� <�]��Ƴ�\�p\�s{V�~\�\��\�xyqN$@$@��\�\�j\�/��\0�s\�Ni\�*H\�9-w\�\�ewy�w��̬_R\�ސ(\r6\�\�\�\�$@�\"��#\�S=�o��a\�\�\�DkD@g��\�\�\�M����n\�L\0c|F�`�7����-j5# 2\�\��\�\�\��R~\�s�?^}�3	�@Z�w�\��C\�\�-\����]\�\�Dpp�|y\�i>aa�kQ�փH\�\n\�\�$���1�{7��\�K� �hS0e\�\�N�kAujH\�, �M/K&��a��[.V�$��䑒\�*X��\�GI2�qm\�뮯GJ�Cd\�\�\��B�Pɕ;OZ\�̒\�c7~��)Q&�B\"K_::�\0�\�:I\Z\��5 �4n ���)g\�wv�^�\�1�\�0/�~v�����^\�s�_�N�H�>|GM\�\�!k\�l�ЏX�q��\�E@ԫWOn>��\�\�52\�kn\�$�\�\�d\�޽�6I�����GL-E�C�\�8�\��\�\��!@<-e� \�{k\�e\�\�\�2z�J\� x�j�t	_�Z\�/W^�\nY6}�(��\�K�M�!9s\�/?: \Z?�\�\�;)Fr\�\�+SGͣ\0a <�\���\�z\�j\�\�A�ُ\0\0 \0IDAT\�I�a�k�\ny�}\'ɕ�n�\�\��\��J{�jWcM\�Ȯ5+�N�VR ��O�A\n�𥾑��� �Y8\�3�\�_|�G�~V�\��\�\�}Rw��\�\�m�\�����=\�:����j\����H k	X\\aO��\n�u\���\�ז�.�\���\�	!!!�\�EqX�A/��G��J�oJBBB\�^\�H�!|ALd�G\"@F\�3ʫ�<-Q�h�{h,�\Z/��E��r\�Q�\'m\�$��(%\�V�/>N�\�\Zזf\Z&ƨ\��\��\�s�iq��\�?$\��ޔ\nz>�G��u��\�\�>\�\�Uznd˧���&�k̲\��֬�I�C�Z�F2r�\n)P(PNw\\ƿ\�A�\�\'#\�VH��@w\�!�\�뿛7$\�\" ^�\�,�_l �\n\�Mi/�M{{��ǯ\�猵���\�/�\�\'t�\�\�-/\�\��!�~3㞨n$ �,&`�\����\�ip�}\�\�ր�\�Rb�$�5�\0\�L\�\�])�z��]\�>ZY\�,^�\"]\�G\�N�6\���h�Z��]xd\�r)e\'\�LZc�v��Ď,[ފS�Z\rg6ih\�}Y�f��\���,WƵT�Kk|����\0�^d��� \�+j�h�Y\0\��\�+�\�/\�\�\�q+�``����W�ȼQ\�:ǵҠMG�\�w�\��7r�|}蠺6\�/W��Gg\�|l�\�Q���Lz]\�\�\�\r���ܧq\�\"i�Sy�}��l~3V\�\r\"���S�\�`�?\��\�~�fv��\�\�W\n�\�\�0?�{gx#���f»k2]HJ��\�MB��L\n��ݟ:\�D6\�0ፗ�\�\��\�p5q$@\�&�,@��\�\�Z�9��\�U\�Β;��@���N-_=\�\��\��H�\�H\0_\�U�T\� ��^W\�qT��)���I�zcE\�Y:9\\�R�\�\�*5��w׬H�z͜(�f��,W1ݩ;\�ޔކ2s\�~�T��u�ϟ�ɽ:ʡ\�;\�\�\�<a�\0�\�\�/�1�r\�JuS ^�]CJ+b��Z,�CD\����\�\�3S\�\��\�R ���}\�O��\�ޡ\��#\�k:5�kW.\��\�a�ա��\�%˕Wׅu>n�\�ZS�\�~\�\�# \"��s��\�\��\��]�zY\�\nS׈�\�并!ǩ\�\�ƽ~�\��\�\�\�ޟ\�1~wݟ\�R0�_\��5 ѱQ})T ��e\�*�o�\�\�\Z\���\�\�-\�\�}\�+\�zgW\�\�K�/�w\�\�լ����4N�H�iE\�1�\�	\0\�!|��\0��X�t9�3\�>�\�c��|��Z��\'I\�\�)�\��_\�\�\']Y�<�H 	��!r�O�G	�߀���\Z�x��|�%Qf\�e �\�`\�?w�\�T2O\�\�l��U�-���w����elMA�#�����k��9Ӷ;��\0\�N�\�oD�\�5�L�ƌVF�W��2�VV\�6-�\�P���\�Kۂͻ����`�@\n&/\�p��ҫ��R[_�p�?j�l�\r\�vtz6z]{��E\� B\Z5��y\�U��\�ԓ[8\�^\�LN\�\\��\"�g�\�W�\�NI�����<\�3/I �%p�\0���nK�\�\�\Z\�Al{w�\\��w�\�\n.\"M��/���I�|���#\�l(K�\�\�\'\�\�s\�{kV\�֥$f��@9��]�vDh+y�AC>Daed]6Qxo�0�I\�ߵ�W%n\� ��ӏdԢ�\�\Z!�\�!��\�R�\�\��D�\��\�\�\�%\�yL�\�yD�t�Dh\�^/S-Q0�\ZmW��~o\�Ƶֱ>Y��č	S�a�z�\\����CQ$��7�\0\��\�\�R�xQ\'\�<\�5��f��\�G����x�Z\��ۄd�����J\�\�\�w�^�޷�|�L\���\�b��\�P\��P1մ�A�D�\� @L\\�^��8/\�gD@�4�/�\�ϛݳO�\�\�~\�\�\�=\�\�\��\�3\'|\"����..ΈH \�T�^���\����\�\�k7�p���\�F@�Wfdd�znxrr#�\r\�^T��P��\�q�v\���͗ʠ\��\�^\�kB�:�������Mj�%@\n�\�\Z��j?\�g\�n\�ߵkW$y\�?=(��p�CnS�!2<P�a���([�\�)#-�\���\�Ϫ�+�$C\�\�\�\�\�\�\�A�m$u[���\�:\�\�O>-�&ƨ�\��!\�T�w0\�-���j>V1#\n>=���\Z0�\ZR�x�e���\�w\��\�W/��dϷ��*\"\�\\�zU\�\Z$�����!��06�w�4\�\�KzO����\�z:\�x�B+�h\�\0\�;>\����8�?�D��v3\�#3-�؋\��T�\�Ow\�a\�ީS0�<�\�-ۖƩ�_�s�y\�|22���F\n�`%@\�Kw\�BZ(�\�B;��w?,x\�\���%Ţ\� ��rQ�^4�\�\�F�H��d�^	�@V0\�v\�\�jF��?\�\r)�)@�J�Ǒ\0	d���cN\�\�\�\�\��\�W�H\�<ydr�`e�}a�\�\��\���\�%�iy�AC6\� ��JD\�\'\��)\�\�fp�=���G��i�\�{ޕr��ʧ\�\�i}`�\�D hoݜh\�O�2�����Z\�\���m\�\�1J�5X�9����(A\�\��֫��\���\�o\�|T[a�{Z�Ƨ\�OϨ/O�6\0�)\" ��h?��c.=X�\�sB�!�v�t��\�f\�#\�k�\�kk/kOD��bj�4\����\�1o��\���L����7��+A~��it�v^���\�މ5�\�x\�\�\�gN�ҏV��?N2\�\��\�\��+T�i�9�?\\��\�\�3-\�7n\�\�\�Ѿa})�?/���D���\�\�:O� @?\'\�2\�%���|�_<��\�\�\�T\�ɸ0�k>��ƫg�M\��,,���\\>\�����t�mS�~C6�\�\��^	h\�~�i}\�8=ݸE�ۇ�>�w�޳�y4\�\�Sz���\\y\�vy�i\�o�F:�ڵ\��\0	x��\�6<ߧ��\�� �e�p�$\���1�k{�����%���2\�?c��(�XA\���\�[.>���([A�;v\�*@��B�\�I\�%\�\��`\�m�[j\�\�\����\0����	���*as��\�\�2�C\�\�a�ӈY1%B*>UCqFʧo>�HF,LP\�\�\�C\\X\�\�V#��V�\��\��S��\�o\ZR�y��ٳ\�\��b���	�\�v�Y!埨&3��\"\�yT�j\�<\�\�l\���k\\oe*U�\�P��\�m.��p�`�\�\"��(W!\�Ë)@o\�\�#p%X�c�Z0ü�~\�\���`f�\�c���o�so\��)>$@���髏�dh\�:)�w2�������{\�\�K�\����\��9���\�Ǥ��\���\'\�:\�\�\�X��ӽ`�R�pvUq?M\0\�\�\�<\�  \�\��s2�w\'e�\�uW\�r\�� +��[\�ۻ6^����2\�O��k�/[���k�Z-�J,8ۿ�up\��=�L�*j|��\'Ȋ)\�\�ix�t2Z9uL\�n�@\�3�\�a\�\�|(@�$ �\�\�;*B��N\�\�}��#�md\�(�\�~H�=2E\np��\�]\�n���\0���H \�h/*g`}\����\rڰ�\�\�F�\\w߭��\r\�u���1��\�X��ճ\�\���ߑ�\�J�ǫ*\�,��t�\�V�o��6�h\��Z̓��Km��� \�Ƣ�\�V����\��\�o��\�l�qv��r�T\�\�\�W43��\���\�\�\�,\�\����ۥ\"\�\�\n�Y�z\��d3�B\�G�/L��UHQ\\�\�On7bÓ\�S\n\�\�<V\��ew�V\�k9ܸyC���\0Ѷa=�\'�k)�.]8/Qc$\��V\�7��?> Úձ��x)a���CE�`{�z\�t��<s�L\��2|a\�v3zC*��c\�\�\�z�G$Y\�T\�w\�\�72��[2|\�*)Q�����(+��KG-\�F�{~\��☿~�,`D\�<�h�xv�\��\�O1�:z���\Z!�c�I�6o�\��\�zﺕӷ��إ�t�\\G�oVG�6�\�/T8ݩߜ\�ߕ�\0\�gѽ;I��\�\���\�\��i�t��d\��\�j�[\�T���k\�z��# |�\�I�<H��a#\��\�AVg\�@\�\�\��\����	r\�\n\�v����!�g�g?�~\�\nḯ��\����?�&H����\��Ro�9���\�\��L\�\'\�/���\��oO��M7s\�♤\�͘���F\�v<��Y\�\�Ѥ�����ε ��8I�YDx\�BP\���\"@8\�@E»�>-@�2	:\�E;l�aPN/��(@\�H/���\�+3�F��i>\"@�A\n�|��`�\�\�9�\01u��bk��1��c�H|���W\��\�]��-\\����\���>R.ډ\�ʬ\n\rxv�fD�\�\�*�3\\2c|q\�P�ȼ\�>[��{\�ם^\�CӸ\�e	#}#��(F\�ʝ\�z]ٳS�ع_ྰp\�`9q\�#�׾+�k\\��g�͌\�-ܳ�\�\�#nI�\�c&ɲ�#\�K\�w\�\�h��\Z.!JL�\�W�ơ\�k۟y�\r1�,\�\'R�\'Q�\��\'A$\�f\�6r�.>m�Md)F\�\��Q\�M��Ǩ�U\�YKmŞ�%W\�E\�7\�RK�\�s�����u��U\� �7�\���O*��6,4n$@\�C\0_�^6�\nq\\e7\�辝\�\�\�e��|x����ʳz`\�\�\�z�w\�/ߟ��OT���\�_S�)�,]�4���b��as�\�A剛\�iDN�\�q�%g-<9\���2�\�o\�Ij6k�\�s��\�Sސ�#^U�\������S\�o��\�\�F�|vO\�\"*�[�\��\�uJ\�Q=CǼ&��F>j_�y�kU\�+Κ\�\�\n�:#<�m{\�\�k@�\�\�\��=G��\0����4Ļ\��YZ���dBO\�A��\�>��\�\�!@ ��\����zѼ�4\�Ohx\�Q)�]�*I�ן>&^ǃ�:5\��\��i=��o\�|�\'��3����o�W^\��\�u�vY3A\�M9\���Æ��Ȱp�\�G=_�2.J\���_���U�\����j|\�,c1��\�p�\�9���\�}\�َ\�\�~z·�\�\�\�DF@�֔>xvѥ�]a\�\�\�\�\�kcм\�R�P\�\�=f�����2�ogu\�w�o�	�\�Ƞ\�eR�u\�Ԑ��\��!n�\��ɚ͂�f��\�3X*<��uk-\�>����UD�9�u�l��\�ea �\�\'�FH�\�^�\��=}-c\����z\�\�\��\�\����\��)K�����˽I���@z3l����#*\�\�\�0𷮓��\�Y<t�N�S�y\\\�Rk\��>!@��(\"##\�.\�\�F�Yn$@�A 9�\��cs:?O/zFy�5\0\�\�ZH�T������\�ޓ\�~^�z8R0)�\�-\�!�\��W��(B�\�7�PC�(\�0��\�\��սdc��M����>~�U�.0R}�\�=)�x�`���\�o�9R0M\�i�;�\0Q�T.H�#d�~C䙦A�\��jC?ܺQf�\rUF\�r���\�=C��A��c\�҅?�q\�\�y\�\��\�ʐ\n�k����f\�D9�\�G2tR?U�F\n&=?�w\���&l�l��R\�8.i�:\�U\r\�%<\���O�\rs��\�\�\�Ӫ_�2Ц|B�=��\n\���\���ó�pQv\�[D-@h1\�\�<�� ^��0�,6	u�\�\�9\�\�-��3�cM\�Ѣ�D�\���\0��\�\�{\ZD-�B\\p\�\��ǎ�{\�5�����{��J¹E��H����9\�FfD����l%H[�v���*U�eM\�m>1�f���i]kQ�\�ΪZ� ,g��_\�S8\�lD\0_��\�P�0\\8m\�.��\�&^}�(�f5y ��Pg��XV����e�W\�\0D1+}#�\���E�]I�v\�/\��ٞ�2i��R�FM�=g�bn\�\�\�70v�<ݤ���\�	y�R\�t�`Ӟ�|w\\y5cӞ\�6)\�������:�q=\\����� nMT�ؼV�g\�\�\�+af\�P���d�a~}\����s�\�\�\�Z)\�O�v�\0m\ZK��\��u�\r�x�<j�\�|t@F�0R���2�U�%c\�\�ӧR�o\�\r\�m�<��t6�ߛ\�\��\no�݇v6G/\'����Zԑ+=�\�q\�v��\�>�_g��\�:Έ|�\�\�\�q�0EL9\�!=�c߅����C#d��)�\�\�\�q bմ�\�\�`\�}�^�a\�\�\"V\��c�\���Q��\0�\�\�&\�׎\�=}# �Y܇H��$g\�Ȅ�6���,5��lFM {�\��~FV���_�����V��j}����n�=\���9[�*:�[�rV�\�LUE�\�uS\��\�U�%�\rD��եT�\"\�Q�T+T��G\"Q����D>$[\\\r\��\�\�IV�q\�Ĭ��\�M�\��G\n���\��+@X>�����\�j\�7���\�\�H��\r\�>��p��C�\�$\��}��G)��\�*X\����\�J8�i�$L��\n#k�\'�\�~_~?}Jf�\�����Tm�@	��5K\��D��EDtH\�\�6l�\\�rE�\r��b\�\�\�f\��?�QG�\�O`JNN�Q�\��\0�\�.2a:Z��\�/�IXû�-P�ږ�tr�\�\�\�Q�\��\�\���1\�H�t\�\"`\�>�Zlr:4Gf$=]����_������n\Z$5_j+1=�\�!\\ߖq��,\"�n_�q��E\�\�i�\�o�ĕsg~�\�>C\�\�un t\�\�;3\n��\�\�	��\�0��\�\�\�ğǺ�YGKM \�\�w\�ejw\�!F��~����2j��\�5j�\�?�G�\�#\"��)�Λ~\�S��,+F@�\�}�&E@�qË*�jǆ��p\�����\�\����f �-\�n��\�\�\�\�\��[�r\�ni]\�	���+���s��4��(C:1\�\�\�<\" f\��F\�K\�Օ���U\�\�L39\�~~\��2{wʄ\���b�ZV\�bK\�Ly\��\�R�Ly1\��B\�\�u\\�\�̕;9TB��;\�?\"(`T\�68\�(\��_�vU6\�FK��}\�\�\�eV�.\�q��xpk��xn\�_�R}�\rFҮ�Q�3\�\�*\�,Ԥ�%�ڼ\�\�v^��Tj4\r�%c˷�~d\��\�czYƢ\�.�<\�l����8l!\�<VE���?~:��C\�\��\��KI\��v8\�\�I\��,ٸ�E���f\�e\�ó{Xh[��\�\�N\�\�^�r\�\�c2~�>�Pͨ���w\�/�vC\�%W\�<�~b�\�\�\�E^\�!/��\�B�ݷ��W��3?�C`xkl�|{�#� %ʖ�m\���\�\�GdL��\�~X�<�l}�����3&\�\�i��C�?f\�;j�\�_l!\�,���6�F�yb�7\�=\�ʖ�\�p؟�7\r�� \��]�j\r�\�\�kY\�\�ˮ\r�H \�	X3lX\�+\�F�j{TF�_m\�S��\�F�\�D\�;�A��.=���hɕ\'�������6Z��r\�\�Y46Lv@��\�s\�x\�Egd~�\�Pc�Y�p$\��1\�AY��⦉Oc\n&7��L3Z����_\�H�\���\��@�?zX�\�G�\�O{�V\�\�ݺ�\�#\�/\�wG�z>�(<�ʙo����K�[�\�=i\�\�D\�\\�nl\�, Z \"_^�f��*oXR��7�TA:�7_\�/�LiZp��\�\�U�紣Nq��u���\�S\�r\0R�̰\�>\������j\�r�t�O�O��C�F\�Vʰ�\r\�PD9\�X2OZ�\rS�a̛�\�C;�\�\�!o�\�ƭ\���Ӄֹ\����?r\�+\�\��߬%�sY��\"\�\�0\�ͱQ�Mlz\�\�\�ܥ�#\"o1��\���8<�E\n&\�!PX\�K\��]\�Z9��\�e\\�z�Q\�\�ưr��\�2jG\�\����Wձ\'�AU�\'\���\���ש�p_:�w�~?���{�\�eR�\�\�ނ\�\�2\�_��\�\�\���\�s\�<Y3=Rg��\�S������ﶦ\�H��\��\�\n���\�ǤT�\�-s+o�l5?!�\�,g\n&��9q ��\�}ӑ��\�F_��o ƈ�5\�\�Rl�Q\���z�)���^K��(IF47�w\�{\�j�p��~\�(N:(C\�N\��YRCr�2lP�\�\�K$�eR\�#�e�\�&34ۻOd\�y��\�#\�$1b�\�i\�I��o�	Ua���ӯ\r#\�2\�P\��@\���o>IR\�z�B�X\�\�\�\�<}�r\�Nyu\�R�\�Q� \�^�\�\�|{Rx\'��A\0Ɔ���Ŀ�\�\���\�(�Hi�=\�n��돍�7C_\�&�֮��m;\�]�r�z|Z\�gu\�ry\�\0^�^C\�6�\ry��WպEj\r�\�\�^j��w�\�#DsD@\� �\�\�\�\�i�ƚ֗\�~\�\�=Ey	/z}�\���Z�f�\�փF�hz�ų\�ѸC���\�\�39��1P쵡ǻ��j�`kҽ�|�\���\r��뾠\",�=\�Cz��\�\�\�\�PƩ��Q��\�Hݎ����ƾ�V��Jg\�IZ\��/c�w?,x\�\��\�>u�\�\�`J_\r�\�\�9�c�\�[������«�C\"\�j*\�F�v~>2\�H\��\n�)1}B\�Ȟ\�\�F�:_Z�v�j\'\r�\��}~\�\�\�7Ǆ\��O�}՛��5~g?�\�W\nY}���c��⠐�cq\�ԣX�\�-=\��\�\�d\�\��\�}�#EA��\�\�\�\�\�6\�s�\�?�S):���\�\�\�R  0���Eb�\�n\�G\�\�H�j~6($\�\��b�\'`\�����\��B�͠ѪX%���w1ȉ큍\�2��ƃ��*7�\�\�5����\�\�>o=ܓ�\�N�\�{WJ?^\�\�=��N\0\0 \0IDAT���\�z�#:\'5/����|\" f��\0\�L	�L�\�zN�p���\�\"\�\�\�Z�m�6�gxH��X�\�]�S�\�\�U\�\�\ZD;K\�6\�2\�5ے�n]Ì�{�\�LF@�\�\�Y�\0	�J@\��\�\�\�\�L]�:é�(@�&\�2F7��z�$���\�$\�}}�J*�,r�z�_w��\�\���6˖�SC�x�X��\�_~�\����Tk4G��x+�!c{�K/�\�\�Z�@^`]t\��v|\�\�2\�}�\�*E��\�J͗ګ\�W+o\�Α\�r\�\�2�g�\�y\�09�o��\�0w�\�j\"g�?a�\�*���V/\�\�\�\�Υ�R\��҃\�\�o\�J\��{�Ko�}����.H�be\�;L!���\���\�#�[�?q(ً:r\�>�2i�|�%QBFO��	#\�<�\��m\�{@\�T*\�\�5 ^CD*�\�\�f�7���\�\�\���-��3�\�H}&?��\�P\�\����\�\����\���\�w�3�\�\�5�v���\�\r�[/�����s6HҐmʣǷ�\�,\�\Zԕ.�`�\�\�<\�x⌉R�Ti�\� �Ab�\�1Y��\�\02�\��X\"�Pg�n�\��j��FD�\�[bD\��u\��xck@d���!p�\��n\�inh�\\��\0Q�vm\�e���\�FI�<C@�jݧ\��Hg��Z#\�s�B�?1�ȡl\��>\\o\��w\�ܰ�Y�\�j\�s\�T��\�Ma����\�\�!jYA��ӷ�\�\�nh�T�]_\�-\�Р��\�\�OȬ��Ҽ_�To\�J���\�;���?>-�zER$ȥs*�\�\r%Xe�-[bcd\����)��\�z<�1\�\�\�?h\�H�\�K���\��� 8\�\�\�Y\�-YJ�/x��\��pb{\��r�\Zo�&A��Kmռz��Lr\�\�#���`��J�h;,B>ޚ(o\�F[ǍvWog\n&C��/a\Z9�+�\n�ӳ��X��ǹE1MT\���(\�C�Z��\"�0\���6W>޶ɚ\�W\�BI�1����_�,K\��w-��u\�?IJ��ϓ�o%�`��+�\�\'\�3�_g�O�\�Ųk\��\��)�\\~9���=��W��*.�,@$\�g�\����\�k�(��\���%�k\�|�\��1\�\�n\���7en����\0Ѵ���)���\�\��\�w\'\�\r�}���u\��砐l\�\�\�\�\�xA\�j|�\�;�\��<�@�]f^��\�ɦ\�M\�w.\Z��H \�ܖ\�[\����N�qG�o� �L�\"۷oW�^|�E1bD�-nvD$�1*��S[k\�S�r�\'��w\��ę\��\�3F�\�\\yT?�l\�,%�h�\�v�]w�\�\�\�`n،-N\r��\�\�\��������\�\�i5h��o\�~�7�2��<./\��yRb�\�\�\�E\"6\��\�jʆ�A�\�8�H)�g\�,F|T�0`g�\�g{v�c�A\r\�\�m\�����sx����*Q�B�q5�U�I+Y&\'?�H�\����T;�#rc\�2\�[(0\�ȣkW��\�\�[�P�\�!��\�*bI���c|ڞ`\�X\��5\�ߓ�~1 \�q\�?�uul\�Nu>�\�ކH�Z0�����ę��\�x\��*_?\�\���+P�#G�;dѰ>ֵ\�l\�\'\�\�Z9cY\�z��\\����#%.\���\�_~���#���\nTuA0~�\�\�M��\�EUz��C\�\����\r�\�ML\�]d��ț�\�\�c\�\�N_Č�\�V��s\�\�n_�c��ݸqCbW�FD��u�@�L\�Ԣ\�Օ�ߡ\0\�\�\��\�\�<�\��u�\0�\�K�f�k�s�2\�g\�JF@d�k��!\�8#\�w[��XL\�亢\�\�>-@�[�N(IIIj�֪UKfΜ)mڤ�z \�˚-�\0	��� R\�d�5\0�s\�\�3]��9Vk�E${_�\�51f��\�\�/\�f}\�2�\��=\��\�=e\��W�F\� 	\Z4Zy�&��\\�\����\�vN�.\�\����)\\�d�v�\�ϯ<�\rOp#\"C}f`~�\�ܰ\�X��kD���I\���X;\�Bހ�>@�U4�\'@@pТ� �k�\���0�jm�E�ZA!��=q>7��\�W\�\�\�\�/\�\�cFJ%\�	�\�mÒ\�H��\�nz�O0v����n\�\�� E�\�\�f�K�m�\�|��\��ϣY����s��G\�_cz\�\�\�϶}�7=-�9�\�0\�r\�sm�`\�\��f�\�,@@\�2{��&ܙ�9[B}7X[�\��ǪZ�3\�\�Z|�/	�\�\�I�d\�Af{a��f^\�\'~3# <�M�=[\�����.o�\' ;ܞ(@d\�닳\"\�|G�u6�P\�]ƽr�_G�Q�Ö-[�A�j�\�޽[�5k���U�fl\��h �\�yduG\�-x�bӆ2\�\nCԖ\�he=�y��!\�\n\��\n�=,e�V��~?+y�\�Wmhs\��\�3\�@�ɶ\rVOt\�kn)�Ǭ�*�Q\�\��5�\�ܰ_�\�\0D\�\�\"�ܣ��-���$I\�\Z���/b�\���s�\n\��kYW\�[%I�	2o@�q�jc\�\�Ij}\�Xl�{�(#~��(%@\�Zj4���{v�c�̆���q-\�\�ֶ�|\�̉J@_ \�m\�z\�\�\�\�}\�+TX�RgE\�ٽ|���dp9\��ٟ\�\�k��U\�޴�\�h\�6\�\�!@��7�\�8s�u\\\�\�R��\�v\����~��z��s\�\�\�\�Yp_\�\�?\n\�\�D�\�\�\�V�qK9�\���-�!$=$\'>�P\"\�z��V}`܁�.ct��,\��w��o\�\�F\�-�\�sg~N�z\���nz��o\�\'\�˕W\�\�\�o\�2կ�u�B�TS+\"\�,c��be+��6̜dm�|�gR��m��\"-\�\�]�X��/~�\��Ǫ�un\�\�#��7e�j߈�hT�\�\�)�,��\����?W�\�\�g\�ی�\�З��g�>!mh\�\�b�\�y�\�2\\\��/�L$�\�	$��\�\�͂\�Ÿ!ÆOF@\\�tI������={�@�`��3g�!�\�7�\�H�����\0\�Qj\�Y��=x��+�m���\�\�\�^\�H#�s\�k\�\�E�7��}�=�!8\�z�k�B{{j�h��\'\�f�m-@\�{���ݸO�VS�o7̜(~=##�\�W.+�\'\�\�3g��=y\�\"@D\�KGɯߝ�ٽ��i�0y�I+YaԀ\�ax�\�\�,�ܧ�Hg3�e]i��\�/\�\0�_�\��\�#d\�F#%��\� BԸ�\��>7�+W��e\��Up\�^�%=Ο�:fmv9��7a��.?|~\�:�J�\�y6\�8 �\����\\�?<\�%�<Ѩ��\��L}�S�\�\���^\�E����@\��`����\�=*N6\�2R0\rPDy�\�d\��f�v�3��_	n�K�Rc:w\�Z߈�@����C\�\�I�ZG@`�\�1�ǂv\�\�H]�y\�{�\�.�{\�/B���xض�6�\�\�g�\�����!�@�|\�{\�5w�΋Dƿ\���<��N%͟��Ȫ�Χ\0�U\�\�/	���wԠж�\�qKn�x��ƨO\nAAAR�\\9�6m�ݥ?l\�09y�$&&z����\0	\����X*�(��=G\��\Z\�0`��T�y\�e}O���\�\�\�P_L\���0|��cD�\�\�}���\�\�FT�=�\�\�\�mZ���\Z���\�<\�ܫ<x���m�g��*w��\�\�\�anX��� @�\�uK�����\���H5\�\�\�6�>*z P6�\�oy�~�\���>c��ٰW�\�~r@Ʒ�w۱0 \�\�\"\�-*��M�[�a�\�<r`C�\�\�Ej�h+m^��\�={�\�l��\�8\�`�7\�;T\�����\�k��Ԫo��\�\�7^\�F\�%hWF���\�\��7�5?�\\1�{\�/ew�hC�\��\�\�\�-\���D��Su��~劬�4\"SZ#�\�Qj��=N\�v\�*�%�_�~\�q3d\�\�A��\�J���ΉCd|\�z)�\�\�kKG\�\�;�<V\�y`�V\�ʕ��3&ʉC�\�	Ԕ@�c\��TM\�8\"X�z�����ݾs����떃FJ�<y\�\"\'$��˕W�����\�\�bw�[�q\����Qr��\�\���\�q���\�[\Z%,QG����(>>ZU�qB�I+��\�\��`�FI\Z\���\�U(Bݰ^ɟ\�N�b�u\�h�<�����,\�f# ���\��\�ٽg\Z\"�;\�\riA# �\�I\�H�2L 9\�w�r0]�vE��\r�w��q͛�B{�\�\'0�\0\�t}�\�]H\�j�O��Z}\�kzM.���ᬸ��H�\�\�H�2L� P$\����[)϶\�h�\�\�^����\��V�����գW�FM�p`x\�@j��\�i�R�|�m\�io��\�sϱuG\� \�Ԩ&%�ޛ\�oS��TKR�t|�h�\�>!R��\Z�\�pnU�D\��01^	0�?\�ʒ�\'\�=>����K!.��+Z����Ƕ\�|F\�g\�ߖO\"\�\�q\�e\�5\r���%\�\�)lz�<V���Lس|�\�\�\"p\�\�)�[�WD\�@\�f�I�\�g\���YZ�BU�\��łB��e]��y,z�a<�m��3��mPk�~OGzض�#�\�g�	Լ�09�\�g)\�X걪)Ƈ5n\�\�^_�\���X\�#/\�C\�L��\�)W<�\�x-S0�\�+ݯ\�\�k@8>\�Qc��_]v�,	���\�\�����\�\�T\�\�\�<.J�]�\"s��\�ѽ;%r32Ժ�����~���r�{�R�4��`�J�ӿ��G���\�?N��\�=��ߗ\nO=c��\�O\�阏ݚ�.\�\Z�>���J��irr\�r7 �D_�qk�kLA{}ko\�.\�P\�2\�aoV�\�x[��C�pQ\�0\�\�c�Ƹ�H���\���c�*C�n\�-l�\n�h\�\�;�F_x�{r�eh�\'�f�\�Ʊ��v���x\�\"Ɏ\�ZЏx��\�\�\"@�G\�]��$\��aސ ^\�\"=\�0��a\�\��nH�\��^]C\�yFD�\��\��i�\�(�\�/��n�\0�h)	�^1\�\�\�\�\Z�\�\�ui47Qzvh��>?O�c�\�yݼqC���\�\�Ֆ�y�A��\'�\0\�<\�o\�.���\�\�D��\�\r�\�\�xv\�ޡ5\�,$�Z\�\Z��\�\�		��/H+\�wZ1\�Ƣ�\�s�=�i��6⥺��耹\�T\�aGڿdI\�4h��֣q���u�m�B�%׮^�\�\�a�\��b��;��{�sw���\��\nU�\�\�ñ�@v\'�\�\�\�A\�#\�j\�x���9�\�&���2U�����YS\'if�\�\�׮\�\��d\�m|�d\�oJ����\�߿\�˼~��ip\��`�\�ի�W�5-M�4\�=H�\�О�M��\��vY\�ڨt1\�*(wW\��T�\�Ư\�/�� @<[\�))Q�H�B5��ŏ҄�!�ײ\�u\�!�\�Q�3O�l~�����8mI\'\�\�e�\�\��\�s׿�|aI쭆�K\���ˮ\�\�^� ��w@ě>\"@<�Lyi��\�\�\�\�\�3�k\���(<�w\�:CY�\�v)8�\n/\�\�\�UL�\�Ǘ!�N$\��@ZDZ\�\�	�(Rn�\�\'j\�隡?Z~Ok���}-d\�Z�\�_\�$թ�\�D�A��#�<PcQڎ�C{�x�mN\�Ǹ��\�?���*:=s\�Li\�&��jݺu2p\�@U��T�Ri�7~N$��T!;�\n��\�lsF�K|X�.�]�h ��7Y��\� �\nR|m��֞\�\���i\�i\�\�\�\�\'G@\�\�i\�\�׆�,�� b�Z߈��_��\�k�`\�*^\\��Y��2�p�>\�\�]\�S\�\�\�E�d5# ��� \�#�k��\Z�����\����\�\�R�\�\�˪�!\"P�\�&-\�\�?N�(=�\�dìI�ܫ�\�%@a\�<w�l�-\�cW���k�Z�՛�����S5BQkT��Ab�J\�m\�P��\�@#��\�\�Qo�zUZ��K��\0ٵ4N��$\�\�����\�4\�Z��\�7\�x\\�\��\�\Z�>Q�^=y�\�eĈ.��)S�\��\�\�e\�޽.σH�<C\0_�B\�P���B\�3k\�]�&E\�\�$۱شs7\Z���z@\�� t=\\���F\�\�G\�\�o^7@<�s��l:W\�%GA$@\���\�h:=X�6\�˼�]�� �U�^&��/�>s�J-�M\�\�����7\0u�ʕ��3&ʺ\�2v\�>)��H����s�\�\��C\�A�T-H�E\�\�SF�={�\��\�~�\�g}Q\�. Py� *m\��\�e+�Z��\�@��z��ƨ\�G��ٳgˢE��_uv�\�޽�0@*W���vx0	����\�\�E\�!\�\�\Z�\�\�t\�[��h	D\�\�O�\Z\�\�K\�\�]~1\'Q^i\�^�l\�\� @,]�I��tp{\�\�l�E\�f�[5 ��ɝ\\����۶\�\"ր�\��qd����>�`� \�D���C�Q\�K��\�=���\���?��\">߻S\� �ᩚ�ı��H�&-\�\�\�G\�\�Ꮴ�J�m\�\"ĕ�V\�ġ�t\�4$\\�\"�ܓ5�\�H4�\�T\�A�ʼ�q\�DY?=\�:�w\�\�ٓ\'dN��\�[�\�*\�z�=\�Z�\�]��\�^/@d\�ZeW$@�L\0_=��f�u�{\�.?\n���\�ٝ!@<%Ř�\�\�)��P�P\�1����1�\�/|m�8\�zH��t�o�`�\�\�\�\�qw_\"��g�lU����~��K�JΜ9e��\�;/^�-[�ȶm\�d֬Y\�(�\�͛7嫯����8�Y��Ӄ\�c\'(��)@du�I$@�\'��{_%@�,L��ڙV�S*�!\�\�E\�C���`��\�$ߪ�<V�����Lr\�Σj}�y�G\�\'�fN�\�$�\�\�K��dӌ	�\0�q�<T���=y\\\��	�jM[I�\�\�dn\�`)\�\���\�xէ�=\Z\"r\�l�5I\�O�P\�h;|���:\�a\��\�4s�|�u��\�\�\�>Mn�j=:7�\��XoH�t\�\�9\�ر�\�رC��^�zɌ3$�]�s[�r�t\�\�\�z\�|�j?���?^ʔ)�\�ǍH��\��{�b�錑��\��\�x���[���a�o\�\'�\�3՞�b��p�i\��\�\�\�\�5 \�$\�\�\�ܫhR!v;\�7o\�r��p�\�\�\r>�y��\�\�E/e\�\����#G�HBB�-ZԣF��\��ҥK&�V���C�ʘ1c\�ۄ\��\�\�\�\�o�!+V��uF��\�\�o߾�s\�NY�b�:M۽;R�p/O�F$@\�B\0��> \\\�>\�` :����(�~\�\�\�\�E>߷SFo��PSP�\Z\�a\�4~��3H��\�W\���\�e\�̉*\�ah�6��)@�LhUOE?<R������}��Oϴ\nV�c-\rx��\��{K\�K\�ރ\�X��~MZ�Ɔ6\n\�{����T�>�\�F�\�\�E2\"�\�8B����\�(<�\�߿?\�\"�[�|��N��GWE\n.�-H�B\0_\�:�\" �\��i�6hx,Z��/�LY~\�	����짳���ԭ*!\�+z�#/\�៫ץќD\�\�>\�\�%,��\�	A���o޸)\�\�m�^��\�˖�Ǉsg\���WW��\�\��]�Vbcc\�رc2p\�@�\Z�]\�t\�\�4h��(Q\�\�c���\�\�x\��~N\�.\�\�͛�K��E*\�:��\�\'@�+�H��\'\�\�{�\Z�\�{n�\�ի&{V,�\r\�cuJ\�9\�$o�\0k��gN�Ĩ�g�K�R\��B��;�2�\��߼\� q� r�F�����\�\���A�B\n\'K\�hG��8J>~{�$�]�R0\r��G�q\�/q�\�\�g�9K%�\�.����6\�\�3��ɞؠ� J\�\n�GbCRR�%Qe�f�\��=�\�j�4j\�H�(:��)��	�;\�P��{��\'�xB=L�\�>���\�վ�=x�\�}6�MGh��q\�\�\�o��&O?�t�ŗ\�y\�sV$�6|A�b.�\�\0��)\�&~�W3\"\�\�=�!p�\�?d\���2?�ygv\�>YH\0\��\�g\�\�uz\�!�Dz�y~_\n\�1\�L#�s#J\�+3ǖY\��\�/����믧��C��	�\0	dO���\nv=\"{RqϬ\�2\�\�\�\0�\�j׮�\��Q<PAH-|\�,^����\�\�_\"\"\"�B�\n�\rlH�d>\����\�J��\�e\�ܹ\�^2\� t>|X�!���\�gz�h�20\�~��\�\�ի\�\�1n$@\��r�����`,a\n&\�!�J�\0�4q�}��\�\�u��\�x\�\�=�y\'�Lέ�\�4�;7�\�2sl�!@��\r)��|�I�Gt����\�O\�W\�\�M$@������\�(3j��QCe\�5��\n\�^�Cz/\ns���\�\�\n\�\�\�\�F_h1aȐ!)D�\�Ǐ+1cΜ9*��>\�\�_T��N	eA\�gZJz�p���\�\�9eqC\�\����)@�Ϲ�֙R��\�3\�q�+��\Z�Q�yĈ�l\�2�R�\�m\�t�ʕ++\�.8t\�\�u�ރ>({�\�Q�\'^}�Uy�\�e�\�\�R�R%�ۭ~��\�:Gc;u\�L�4I֯_/��\�W�����\05�p\�B�߃\�=��L�0AE�\�\��\�\�.\�֭�W^yE\�ظqc�Nt����\���\�\�e\�ĉ�s\n\�\�>�L}�~��k׮�ߨ���0@�c@\�=~�::&o޼��,��7�QqG �)���nmJ\ra*���\"�w:y,d��\�	��h@�$sl-\�F2\�\n.\�,iB)i	�ض�\n)�b�*ʕ\�\�>uEs����\0\0 \0IDAT$\�%}�f޽֣~J�\��W ��\�{ϼ)@xϹ\�HH@\�\�Sg!-m��\�;*Ő nݺ%K�.��3g���\rQ\�����\nM�k\�Nr\�έ\"\��{���q�\�\�_��R�\Z5J�W��\�\��\��nAj\�B�\n)\���;\�S\��\�?dѢER�`A���ߙ?\����\�>Ο?\�P��P��\�/�T\�C�|�d͚5j�ӧOW\�m?���t\�\�Y��q\�Ʋw\�^%n\�-Z؝OZ\�p��N\0\��|�\�*! �\�G� ��\�g6KmķWp\Z��\r\Z8]<\�Q\r�o���DFF���Z�j-,�3$=\�\�TO\�\�L�\'\0\�$\�< 2�5{�. �\�|�\�h(@�\�YϚ93�s\�\�\�L�\���:�-~\��P�E	\�B�\0�_�ݳg\�*~�&M��`;�7n�ߒ�D�oC\�\�V���\0g5���￫\�cN�t\�=�ȴi\�T\��s��bÆ\r��\�ӧ�5R\���\�/Jx\�޽�U�@�\" \�a[�\�k�\�o\�C$@$@ٍ\0�nal,1\���R|�\\\'\��	﹒\�\�q�m\��̙3)\�4�t\�S�Lr�DZ��)��B\�\�Q��\��\�v\�\�|H %\n\\�J����y\�7\�9\�}$,B\�\�\�*H��FH\�t\�\�5���D��3�oJD\�\�7�\�\�\"u\�Ա��\�M�ꫯT4�*�b	�-\�\��2)888E\�ô~�B(Y�dI\n�\�\�\�g�\�\�ŋ�H��e\�\�?~�\�\�\�1ΝE\�E$@$@ً@�\0�TK��Zrtܛ����^��!J�&jԨ�C/\�:�K]\��\�\�\�/�؁~��.-\Z��3�`\�\�\�vt.Q�g�P\�\0�\0\�\�bn�\�\�\�ِ�= �.��\0=�\�3o\n\�s.��H(@8w��I�@����9s�脫W�\� P\��\��\��۲nݺ*%\�;�;V�I\�ٳ�>|X՛0;��\�6���{�\�\n�\�X�v�,^�X\�~�V���n\�}\�c�\�1ΝE�݋)���\�s\�$@ٛ\0��\�[�\�ɎJܺeW\�\��Kb8\�8�# ��\�\�\�H�H �\0�%�\�\�\�Џ�I�\�\��+\�;�	P�\�\�\�G\�3�s\'\�S\��F\"��ߜ�	N_0ң�3\�=`�p\�t\�\�M�F*%۱\��\�?�\\�.V��:��p\�B�\�\�bD\�޽�Ha n�\�\�OՊ@*�\\�rY\��\�[oI||�\�{ｷ�۵k�t\�\�E�F\�	���\���ںu�J5�h��\�ߩLi\�\�Y�߽X�\�\�=gN$��	h\"�\�`kQ\�\�\n��<�xCD�^��	�\0	(@p%�\0	�@\��\�\�_%\��\'�K\�n\�˚�W�o�.]��J@@�L�0�j�wDeϞ=�\�k�)�J�*vw;y�\�\0\�P�\Z��a��\�H��B͈�<x�*���\�۷Kll����o%@h\�c;v\�2��l\�R\�=zT	\n)qP�F\r6l�*,#�R\�!<|�\�gJ�@��DT�H��\�?��衇R\�\r� :��\�˪�2e\�ȦM�T\�(�ٷo_)U��L�<Y	?���RH�\�3\�<#�K�V��\��S\Z(R���S�:<54�H\�\�+\��\�)@pU�\0	�@�$��;7\��php�\Z\�P\r��̃I�H��P��š�\0	�\0	�\0	x�\0��}�Ykە+WNQ\�^��m\0�{j�\�:����P5�~��WA�]�.>��C%.�8\�\�/�TC���\�\�\Z=�S�S�B@@�g�ŋWšQ:o޼�n���	\�\�\�-\�w�=T\��\�\�o�U�����o\�>%j<�\�#j\�\rs@lDvT�ZU�={�l%��j\�Jծ\0�a�\03r\�HU�!�@\�@�l��c1e\�\�EZ\�x\�\�g�F)@d�\�i�\0	���G�^�:	�@\�8|�w\�\�%�d^�\���\0S0y�I\�H�2�\0S0e\nf�;�W�\�\�\�x�\��\0ᷧ�\' �!@\�kNB$@$@$\�\rX�\�΂��)����g\�\�Y�:3i��/\n\�g\�#n\'@���H�H �	P�\�\�3��I�H�H���\0�:~9��\�Ӟ%��\0�%؝\���Vi�\�\�*�7p�\0W��  w�\0\�N�l�~���\0Wj[�z�T/n$@$\�L�\��l\�	P��ų��\�L\"{�Oo�\rS0y\�\�A}\�\�|�j\"p#���\0�^bܟH�H�\�(@����ڃ\0q�b-�\�k�\��\�M���&�����Y�G��\�\�s��\0���&@\"�\�\0�\' �\�C\0\��\�k=�}&ę�\0	�\0	��/�dj\n>wmq�$\��}A�={V�ؼy�\�ϑ {(@p]d5\nY}\�?	�\0	�\0	�\0	�\0	���P�pI�C\�À\�<	��ml�  <\���վ�n\�\"5Ȗ(@d\�\�\�S��\0\�S�˧\�L>}�8x   �	��\�>�49H ��&��&��u\�\�V\�\�jժ�$&&f�\�?	x�\0�`e�\� @\"��k��u���`�	L�\����$ \�f(@d�\�\�\0	x�@Ԧ�g\�L���\���Df��d\�\�5&2�G�\'�9dH���\�Bd�\�y*c�\�S�Y\�E���%4�\��_�\�z\��ΰ\�9�<g\�}����\�y�^�^�{\�\�\��w��m7�z�}���z7`�?~yn�VE �Ϟc�̰�;���52�\Z	H��F�W�\� *\�]w��$�\"\�\rI[���	H�\�H�H�6f̘�l�6mj����;/����\�\�F�����\Z?K\� �\'�\�B�\�\����B�U\�;P����D�I1\�s\�O\��v}�\���o\�b�#}\�\�\�\�J4~���\�����\�\�:�k�7攔$@$œ\��@�\�k\���\�4{��\��\�;oԻ�v@��]����������@\�hD\�Ъa��T�: �J��\"ԕ��\�/\�\'�m�A�xh`o��\��	����P\�=T\n�j���.\" \" \�\" \"Y�ToD@D �$@\�\�k b\�(�)1&�o�y\�\���\�c�\�\�ٳ]/kkkc\�[�.\�	��FG�	��2ݚ6il۶��)�\�	l3\�i{���	梁\'\�M@Du�_��(�\0/�!_`�X\�\�c\��hR����@=A\�\�Ç[���mĈ\"(�$ \"�n�U�T�:V�*Bk�\�xD@D L:ID@D��$@�n�M\r�\�8a\�[m��T\�3\�\�g�2?	�\���\0Q^�j�$@h4�@�	H�H��\�C�:	Q�\�?�)0G\�L�1\�31v�L���Pq��\"H�(�.)��R0�M�@��\�W�n�l��\" \" \�\" \"&�T`0&���\"c�g�s\�ԩS\�C���>\�v\�q\�\�\Z)ᪿ��\�z\�!�\��\�o��\�;\�h͛7/�\�\�/�6Ȕ)S\�\�;\�ƍ۩��Z|c�RD��\�u$@h0����������$����xR���8Jf�@�	�g޽\�z�駟\\`�I�&ִiS[d�E�Y�f\�\�K,\��,��\�\�A�-Z�?�Z�r~��g\�a�l��*�\�?�`W\\q�\�}�ݮ\�=�\�\�N?�tk׮]\�\���\�ov\�q\�\�СC\��=�\�wߌ\�VR� \�\�����\�\�\�^�u;�\�\�.�.]�͡�g͚eGq��9\�قO\�vH���ǒg��\��T=�j%�\�ԙ�\�ڵ�\Z�\Z5�FfVK\�&.G����P\�ś�S�I \�<\�\�W\�[n�\�ӧی3l\�̙���߻?���G�={����\�/F@�?������\�\�j�y�\�1;�b�UV�=z\�y\�Wڼ�\�m�]v�\�V[;�\��Q�`�\�/����?�\�\���m�����,�����\�\��\�{oǠ�\���\������v�\�\�Ԕ\�T�\�z!�m۶�\na�\�\�a	�5V	E@\�%EP\n���\�\"��[ǽg}7W\n�X9MƊ���Ğ��ػ09�ꫯ\�;\�p�\�\r\Z�����\'�YQ=j\�(��\�݊z\�\"@�%tΝ;\�{\�1����\�\�_t����\�@���\�\�΋�\�\�ם��\�o[Ϟ=\�\�.�\�ݻj\'\�I*\�x ��m\�C�7�裏\�\�[o��\�>�d��\���\�__D�\�r�o�\�96a\�۹\��\�W��\�u\"P	\�P\�5\�P\�b�\�\Z�����d����@2H�H�C\���	^xᅮ݃:\�N8\�[|�\�C�Ojc��9ꨣ\\6�iJ\�\'Cäڹ\�kl\�5״{\�GD\�7�\0�n��\�k\��u\�\�ѥ*\��\�/A�R�r	s\�̱�N:\�\���\�+K \�|�M�\��L�\06�RƇ��r?e�5m\�\�:�mY\�[��*\' �\���_$@T��\�I�4�`��{�g\\%�1AT��O>����\�J�\�:\�=��\��\�۷�v�]\\�4%�\�\�\�#<\�u\�]�\�<�K�\�\Zk\�M(vWz�!�\�\�k�m뭷��3�\�>}�\�v�ᇻb\�<˙\�@��\r\�]w�-�\�R\�*@̟?\�	&C�q;86\�l3\�\�k��\�~�x�\�[o�\Zg�q�;\����\�*D|�\�wn�O�\Z\�jU��\��:�fG\�Yg�e\�?��\�瞎53\�ϡp4\�\�%�\\\�v��K��/���u\�\�َ=�Xw=)�8H�5z�h\���\�ﮃm#\���\Z������\�Y³�\�\01xĈn\'\�+��b�ﾻ]|�\�ֺuk\'\�fb7iҤXx\��%�;@] \" 1$�L1t�L�	H�(�N���P���<\rV:0X�^E�U�\���׶\�\�\�jl�\�p#=R�	��-�\0�\�<�L\'6I��6o\�\Z\�\�pFǼ2�+S6Ͽ�\�;����B�9��&�\�\�\�ׇ-@L�8\�=�P?~��\�?s|\��Ç�����N��\��\�7\�|�s�B(A��v\�\�#�|��$8Ǝk[l�Eݽ3���s\�q�2G�9\�\�\�\�\ZjfP(�\�K/ui�\��\�v۹\����\r6\�	 ���NG˖-\��r�!*\�\�\n�qW��\�3\��\�뮮\�L\��\�w~P\'!c\�v?[t\�E�\�IMw\�)�8��\�\Z\�z,�\��\�Ǻ��z�R0KN׉�����D����yD����@��\0�K�(��X�˟�Z\�݄\\�\'�|�m�\�V.xV\�CDat\� �;+\�	Ӷ�\��\�\'XGzP#� 6�E���g\���^�\�\�O?uzvl�\�&��\�\�\�vU ^z\�%�_r\�%�8��	�\� ��q\�Nv���}BT@x{�ᇝ\0�0B\r\�M��cڴi\��u�\�v[�3\�G�\�с\�Tu�0�y�m�q\� . d���\�uE�Ӆ?�q>vam\\~�\�u\�\�q\�\�n�k��\��5��|������T��Xr�.,J�I�#\" \" Bc@D@D�\�$@T\�\�/\" �N#HG�V\nSg�T%\�VQs�Gy�K1\�J\�l;%�Qh��n�/��\��\�g�랕ĩD�>}\\;�6\�o���U˾�\�#�<\�V� \�\���\�Jf���ΡIC����H-7\�|���\�ѩ\�Yұr/ҭ|d�O<\����!\�]�4O=�Z�}��\�;]P�\�!�I��>�ڹy�\�u�#MLz\�!;�\���ݴ�X��\�O�k�@!c\����/�g4�\�\�ޏ>��[9[\�%l\�?����g�u%�X^\Z�y��C\���\�\�\�e\�\�z\�.�\�Zk���� \'�\"@�,�\�\�Y\��-}\�ȷ\"=0�h�A\�\"v04nܸNH\"@d�\'�]\�޽\�3�\�ɮl\���˶\�[��\�\�\\�*\�eW�	��:\�\�\\;mڴ\�\�Lm\�b\�יΑ\0Q,9]���\�\�G@)��\�\�E �$@\�߇\���ĝ���x0*���\�*\�L�^�9X�K�ąlG�@=�V�Z��\�5��@:\"�\�Y\�<s\�L$�ʇ~\�\��\�ݻww�KX\��\r\Z\�ҕ���@\�M7\�\�\�A\��\�/\\;؃���cV2�;ɇO1[\���KzR� ���`!\�H\�q\�����\�{��)��m�\�w�}�\�g.\r\�;J6\�xc����&K>w��\���\�\�b�եZA� p�\�\�޵�\��5v��\��,}Y1\�FM����\�4�yQc��6r+\�Y�\�\�/j�$\�(\�3\��G�cL\�:�9�\�v\�\Z�\'�	\�Xm�\�l\�W^`F�L�9҉�\�20`�\�5��T�\��\�z�\�\�\��\�+E�@h$\��#`�K�`7F*_\�\�;س\�>\�\��g�Xb���r�G6_f�1\�b��b\�麰H���\�\�G@E��\�\�E �$@\�߇\���ĝ���x0J��� +\�L�f�\�\'(�\���.^Tcf�\�o�U�\�F_n�\�\\*��\�%I\�\'\�m۶�KS����+\�MؙAq\�\�@$\�\�R$\�;��-\Z٩@\��k\�A\�^���[I=0n�\� `4\�@j\�ާk\�q\�]�RPd\�B�J\�@4!�H0���8#� ��\�\�g�\� �����\�~GN{\�b����7�Vr\�\�<W �\�\�(\�3\�\�!x�\�\�yb<�k�\��\�\"\�xc\�\"{\� �;��D8ā�L\\�8Ƙ\�F\�jpMMMM^�^8���+�\�\�\Z\�WR\'q\"@|�\�\'�R:1?�|�j\�UW\�h�\�%�N�;�,>�\�s\�e\�;���ӣG�zs\�\n+�\�\�7<\�\�w�J�N~\�N�W\\\���y�\���4]�\�ǺX�K�(�������H��|$@\�#�ߋ@�	�\�W�Wq�{�����D����z&ͮ(c��$3Iw\�J}\��/�A�\�cM\�\�\�N�U\�>�I1X����\�\Z��]@�}	uA�l\��eG+�	𓏾s\�\�N�\r\�%�\�\�\�\�L�{R\��� 0+�6\�WF���E\��AL\�����.�@z�\�U\'p^z\r�|�A`vi���\���\0�?\"Q�g��\�\�D��?�8\�Pd�+\�\�Sh�\�\�\�2����ص\�RKel�`=c��t��|�3\�\�o\��\�n�s�g�#��]\�I�\�\�IS�m�\rQ��\��n\��@x\�A9��\�`������\�/Z�n\�\�\��/\�A\��\�\����H\�xB��\�aH\�u�=n�\�6��\�뮅\�9�\�(\�=m���\�G\�vz\�\�\�(�Gz9v �1\�.��B�뮻��K�9\�<y��`B\��h߾��O��\�I�\�q�1��u�y,\�\�%@KNׅE@DX$\�N>J����~/\" \" \" \"P*	�l�\�l�.W�6�h&�y\�5ה,@�\���\n\� |���!��x��n�?\'G�Z�\�a5�9s܊e�|\�\�\' Jp�\�Çw�����>��0fR@6�\0�jf�2��ya�\�\�\�\�@8 \0\�w.pN�m�\�ۯ\�N\���ш\�<CП:\�r���\�\'�Ϯ��cȐ!u�M\�G���>�E2	��\�y\�u�3Q\�\�@�\�\" (0�y\�\��\�2\�\�\�F!\�\��B��Bψ��\0�lD8H��B�S\�Ǥڙ��	\�\�\���]<_>m!T\",0G�h\�\�N\�X\�_��`뭷v&~@L6l�u\�1j\�(\'��# �F��f��vr)\�g\�%�\�B\�-��Z���6Kz:t\�\�\�\�{s�2�e:GD�\�t]X$@�ER툀��������T��[Sg::�kUiS\Z\��\��\�[\�\�θQ\nƅY)v��\�;nGA\�b�\'�\�B=	�qXELXi����`��O�D\0ѧ]�\r���2&�\�\nbR(\�:\�믿v��\�Y���	��\�/\�z���R�t,<(乧��:uZ\0}#h��K��\�\�H-\rR�\�\�%�\0�♰\�\�|]�\�M \�\�E��^����O\n�Tq&uǈ\�K�jV���\�⤮\"8\�\��L\"I����uQ�gX=\�%��t�\�N�~�d� \"Y��co$@\�\�k�YD@�I@)��\�Y%\" \"�l �\�߂{GtVز2�\0,��X�LNsV\�g;X\�\�u\�Y\�Ϫ��sXy\�\r7\���B\�\�\�\�.s�K��\'�O�}ƌnU�f�m\�DV\'<$�+�}\�f�\�}=�\\\�r�\��&E\n\�\�P��\�؉��zP��#�\�\��I��>��	�\�&\\H\�Ċ\��\�<�\�m�\�ܵ��\�ѓ&M�+ԋH\�N� L n��z\Z��\�<̈;�`\�D\r\�B+\�\Z\�e\���iV��\�	�&\���3\�V)x`\��	1tZ@�%@�\�i\�gϱ	Sf\�\�\�v�\���H�	��\�K@)��\"\�	\"{*B{�\" \" 1$ \"�N+�ɤ%!�O1[҅�&(�/={�lW��]�vY\�&\��IHCQgv P���7�)�H;C�t��g�\"\� -Awv\n�\�(l�A]nzR�\�:���o���Ko®�3\�8\�\�_}\�>\�N\��=�\�=�\�\�\�d�����\�?Zw�\0\0 \0IDAT�e�#��Ta\'�\0\�S2U�1q\�D\'� X�i\�\�\�d \�υ��B1av@�����԰�?k���g�\���\�aS��\��\�\�(fKz�X�\�ݝh�HD\�؁ �(\����s\�E�\�r	�I�\�)\�\��Bh\�>�\�g\�/�p)��_�CD \�\�O�nM�4��m[F\�PY{*B{�\"������t����@�	(S��\�|��a٧v���j\'$\�\�a\�3\�s��~��G�\�\"\�A	AI\�>/��+���\�\�]Ԋ���@\\	H���\�d�\' \"8+�)\" \"P*B]���\Zv`0t\�`\��\0�<��1ϐ��W>��K\rF�v��\�$=\�W.� �7�\�\�#�`���d��@)���z�V\�A@D<�$+E@D \�$@\�Ļac\�U��5\"m��I�#�J�g^}�U�~\��\�_w�?�j��#\"\�q\�Ǻ�h�vG\�\�t��A@E�à�6J!�L�\�ӵ\" \" �$@h<����T���J{ \��K	��N��R\�;p�皚��\�\�\�h(f���\�k]-jod; (~�\�G\�8\�֗Xb	{�\�_�E , \�\"�v�%�\"\�Œ\�u\" \" \�$@hL����T���J{ \���	lZ�����#P\�<C\��aÆ\�\��^o�C&��V�z�\nD��GqEП|�I\�q\�]��D L ¤���! �j��J�T5]#�\" \"^���\" \"�D b\�\�B�1\�\�����\�\�o�m�g\�\�+<�v﨣�r�dVXa��m۶n�C\�1i\�$���\�K={��{\�7b�dN��\0Q-��n?%@D\�7I�LE��\�Q�G$@Ч_ͺB#\" \" # �b\��q\�� y�u���@1�\�3\�z8\�C\\ڥ\�Z�\�\�0o\�<��\�?\�\��:vG,�\�B6�|��\�+�\�jI�\�B�T���J�\�}=	\Z\rE@DC�\�}D@D@D@D�z	H���\�%@\�ġ2S\"@�{�\�6t\�Pkݺ���\�y\��\�/�\�O?\�\�Ν�W��5k�-�\�2�z�\�?ڈ#�M�6ֲeK\�رc�\�0�\0�QPi *\�깿R0U��\�S����\�t�\�ԮU�Lh���එ�\��y�7,40X\�}t��@�`2\�\�t\�M���{��yk\�X���3Bxe\�\�x�XK:��\�\�\�A0�f�W\�4\�V\�PO��\0��Qi *\�\�_D@�C\�\�q\�Y\�͕�)9UOD@D@\�@@D�$E@\�N�G��ނ?�Zj)[w���Ցg$@p2i��u\�fcƌ\�x����S7���\�sl�s��!���D 8	�Y\�L�\�T�Z#DD@D@\Z����g�;��D�\0uRŁ�\Z7�\�k5}O���/Y\�\�l; ROz�\�W\�N��S�\���{ P\�F`��\�ִIc\�ضe�t�I@)���\�D F$@\�\�Y2UD@J@)�b\�\�\\)�.\�`��BfF�\0��\���\���|�\�\�+O`�&\�\�[\�h{\\6��1A��\�^k\'�|���믮���\��U�����@:�֘�\��\0�|��\" \"u*Bu�c�j@\�\�Q2SbF \�\�\�\�~�\�m\��\'�x\"fddn5P\n�j���.\�E@Du�[��N �\�\�\���D���(y#�- b\�(�)1\"f\r�u[��@^*B��N(3�`*3`5_G@)�4D �$@$\�\�\���D����{\��$@\�\�Q2SbD��8�n��=�\�#�vü5k�K��{QH\n�a��\"�\0	\Z�&�\"ԕ��\�/\" \�! \"9�TOD@D �$@\�\�s b\�(�)1\"н{w:t��n\�\�Y�y&FΓ�e% ��x\�x\0 @\�)\" \" �H��I\'��������2\�\r�iä��D@2\�<�q!�\0��Pi *\�깿R0U��\�\�\�%p˸��\�\�\�V/\0�\\D@D�\�$@T\��P`0\'�%\"P<\�3ųӕ\�\" \"Y��co$@\�\�k�YE�\�\�7Y-\" \" \" q\" \"&\�R`0&���\"c�gb\�<�*	�\�TcE�\0Q4]R	Ea\�E\" \" \" \" xk\�Lwv�v�\n�*ާRw�ʫ�����\���q��\�:ϴj\�ʖYfk޼��h\�\�Z�li\�/���C=�VX!�d�@@�\�A�	H����\��J�T=�VO��\0�N�\�(S��\0�\\D@D�$@T��\�)\"yA�?��\�f̘a����͝;\���?��\�\�͛g�\�\�G\�5&څZȚ4ib/��-�\�\"֬Y3�g�\��9s\�Xǎm�\r6�}�\�\�ڷoy>2�zL�=\�&L�a;wи��G�� �\�Y#\" q&�\"\�q��l�+	q��\�(+��\�\�ѣs\��\�_\�7\�|cӧOw��\�;�\��￷Y�f�?���,���k��\�\�.���\�\�.����Q����@��2ݚ6il۶����QD@D \�$@D\�92MD@���R0\�\�\�ac\�]�)\"P��g,�;\�8�\�;\��#FX\�Ν+@@��\�\"�L\�\�o��:	H��N��\�\" \"%*B%o䰥R���\���\" !�\�<���\�ƌc�F��nݺ�\�+5!�P\n�\�\n�xP\�x�MV�@!$@BK犀������rP-C�Q��[jRD B�2\�\�\�N��駟\"DG�T��&oG��J�M�$\�*	I���$�	H�Ј�4	��@��G%0\�\\�&\"CQ�gڶmk�l��=�\�1$)�\�N@D\�=�U�:�>�K��).���\"P<	ųӕ\" \" \��\0ǲ���`\�;���T�@�晡C�\�\�Gm���{EX\�\�M@Du�?\n��\0/\�H	\��z!\" q& \"&ދR`0&\�d��@��6\�,�\�6d\�\�ӧO�=\�\�\"P\Z	��\�ե�\0Q:C� \" \"�7�>�j\��	C_؍�,\�z�-\"Q�g\�Yg\�\�<|�1A$@$ș1\���:.�f+S�&�E@D@D@D f$@\�\�aQ\��\�(�@\�\�=z\�_|ao��v�Щ\"P:	�3T��\0Q\Z?]���Pg�3E@D@D@D@�#�\�ԙ\�\�N\�Z\�@�jԨ�52�\�\�\�\�ؘ��`l�\�P���6\�P\�\'�p\"�hH \Z������\" ��H\�>\"P9��}\��\�t��������T!	U\�tuYD ?��	�;w�I�&\�ܹs��3D D\�gϱ	Sf\�\�ڇت��\�$@g�3K#�L��\�\�\"*B/\�F���\0�4���端��;\�Ú6mj�\rJLO��\�;�\�]\�<�L׿8I�K>ĭ\�Q N8\�����m\�ԩ�P\����\�Ϸ>���j�o���\�ի���={��9\�F�\ZeW_}��hѢ,�d�\�\��̔�\Z3?e�5m\�\�:�m)\" \" \"P	%\�\�\�\" \" !P\n� 6DQ\��9s\�\�#��aÆ�ӗ\\rI{�\�Gm�m�	ry�\���\�Ov\�QG\�c�=f\'�x��~�\��\�\�,@���\�6p\�@�\��\�\\\�%���\�<S�\0�\�_9qn\�E�ݳ�\�g�ـ\�\�g���\�\��\�wߊNEW\\q�]s\�5�\�k\�=�\�\�`\�\��^�sEE���������$���ĻX�\�P\�Ȼ\�o��\�^�\�w\�\�\�rt\�\�\�\��Nkݺu�ˋ:\�\�~�\�;\�ڶm� dQ�\�E\�ꗸ��\\�\�\�?n�~�j\�瞁Gm!�{ڎ�����\�;\�a���U��5k��1\�<���\�9\�ᮻ\�*H�x\�gl�UV�5\�X��{���gF)��v�.��`��\�d�A@D\�t����@�$@���|��+0X.�Y\�J\� j묳N�n�@�Q	^5X�cr�j�K\���<s\�9\�\�UW]e�9v\�ygWT:\�T��\�o\�SN�	&��Eq\��T.\�\�_��c\�:>��\n�uv��\�\�7��P2Ztn9(S9��\�LT�Z\�B�O@D�}����@\�	H������/\��`���\�;\�\�~�\�g��׿���n\�\"�,R\�\�Z\��e�T�_\�\�\�0\�҅�\�\�\�z\�!#-Rmm��\�9��\�\�\�.<* \�|�M=zt\�k�m\�\�\�\��\�\���\0�7�3f��w\�\r7,�I!>��\�{�\�M\\�� ?�:�LT��L`\�\�$@hP�@�	H�H��\�C�:	Q�P�y�\�\�\�{n]Ҋ\\~�\�ֲe�b�>�fD�v\�rZ&�K�\�n�����K\�g�}\\\���S�AY��\�O:1�\�؋/����\Z�<�+���믻��vB	�\� \�t#�\�g�\�r�s=m�\����o�\�\��\�ߺ�0p���\��\�N=�TW���\�\�/l뭷�\�e*\�\n_\�~�\�\�\�n�\�&[j��l\�ĉv�\�\�O?\�R�`#v4i\�$\�\�Om�cǎ�0�`�g\�\���y�\�]�~O��y�\�u,RScej\�\�Ϸ���	l�t\�I�\�\�{�\�T>����ݘ\Z2d�m�\�v�\�\�ꫯ^ׯR�\�\���\�%\�\�\�u\�]\�\�H���\�溎�\��}�\�G��&\�?��K_�ڿ�,\�RVړ�\�7\�p|��\�\�\�g<���\�g\�[o�e~�a\�\�<�\�s����\�ۺq�O�2Ϥ>o�-\�\��\�o�v��Q��N?_\�\�^n\�#�\�_8��1�h\�\�\�\�\�\�\�#�cA壏>2�\�I�&\��\�\�3�\�\�?��\�\�\����2��\�7�%6|��nNc\�ր\��Lq��\�\\\��^i��\�\�@\�g�=\��l\�M7u\�e�\�2�v�\�\�\"�y�K$@¤�\�H@D\�\�z��IB�O@D�}����@\�	H���������`���\�/��\08x�\�\��e\�	$0Hp���βV�Z�` iK��`mϟ?\�Հ�9s�\�b�-\\���\�ݻ�\� �k\�7h\� \��\�i��\������\�_�v�a\�\�+�4\���\�y\�u\�\�.�\�\�ƿ���;C�]@�!X\������\�\�N.؉X�5+���\�=�\����\�\�z뭶\�v\�ي+�肽0Ɩ\�Ç\�Fm\�\�Ѱ��40\'py\�!��\�m�\�aG��k׮u��o�U\�-Z�p|	<#�l�\�&��\�;,�\�b��\�.�lƝ)O=��F{a�>H%e?��ƍ���\�n��6a��\�_[\�޽�G��\�G\�\�\0T\��לּG!`�\�Zk�1\���-�\���3f��B\�\�\'�lo��c\�����A\�V�9\�\�3�뢋.r�\�s�\�`\�c�\�w~\�L��n�\�6ǋq@оT�b��y#ec!�g�\�CuA�c�=֎9\�\'\"z\��\�H\��\�\�\�_\�<S�ɼ�\�K\�<\���K/�\��;׈~~G�����g�̇�j\� �!�2g\"~P�v�\0�\�\"\���\�1�7ή��z\'z2\�\"&\�r\�-Ν�\�t\"\�\�X\�N�|cPD>B�}�	H�(7a�/\" \�C��O��u��\�\����@\�H���K2TL`0*]#OjS���b\�cu5+�	`-�\�r.�Ί]���\\r�-�\�B�Nϭ\��7\�x�,r��\��}v,l\�u+z\�\�@�\�k|�]�׈ӦM�\�M�\�\��\n`�˹s\� ;+�)�`@\��@7A�|�|^z\�%\�%h�\��\�gֈ\Z\�ǀ���N�|�\�Ͳ�\�+�\�\�s\�\�q�һt\�\� \��\'�\��jxD���\�\���\�`�8\�vNzq\\\�M0��bC�}g̲\�A��/�S��G�)�\�Ay\�oVӳ\Z\�(d�\�{\�]qcV\�\�v\�d/;I���Ǐ\���\�A|\��S�s�O�ro\�V�sbn@�@\�CEh\�Ye\��\�j���y��\�\��F�c�_�~\�\�L\�Lz��\��Ϙ\�~_\��?È>��gҋa�\�\�L}�\�`zZ�L}L�Y��1�?�9GD1\�tM�$@�ISm����������T���J\�/\�ޅh��N%E���.\�bX�%aE-A��#WЎ\�Ӄܾ\rR\�x��վ���L理�U\��	�ҿΝ;;�\0:it\�5k\�,Pw\�\�>\'z���\�nU5B;8r	��?蠃l�\�ww\"+�)�\�\�VT�{��\�.@9l\�0kݺ�[\�]g�}	ֳC�@=܆ X�\�w\�/x�\�\'�(�\�A�\�$�\ZD%�T\�<�\0H\n9H��\�2˸C��\'M\�\�K/m|��\�\�N\�a\��u\�9C\�l�>�˷\�j+gB�D�\� �{\�a<����i\�<� �;�n���z\�҅\� D1�a���\\�|\�\�6\�I�\��=S\�\�,�\��/\�\�E\�N%��\"�\0�-�\�\�B\�_!\�J�(��\�-	堪63P\n&��rxk\�Lw�N\�Z��V�i���$��\r�j7*V��ͩvh\"��r�\�;��|[A�v\� \�	��\��!��.j9\�;�]\�@�`�\�WHEC\�\Z�Ĭ�&ER���H���\�)I��- J�a\0��׸��L�RT��A\�H?�\0%�EHE�������aG���}�\�I�Ґ�O\�SJ\�S\�G4�\�=�b���8�`\'\r�O���\������\�\�Ά��\�H\�F-\0�	Rl�ۆ�K\�\�\�v��-5Sj}�b\�|�\�瓴`�j\�\�lD����%}O�D&�4\�|�\�#���󡷑�!N\�z�2�Y\�JP��	q��S��+T�\�57\�\� \�H�BI甓��r\�U۩T�Z\�A�O@)��\�c�PD@D z$@T�\'�)�J���;2�I���Ҥ�!�wR!&�*?=(��2ڧG\"m�O+D3_{\�5�6h�\�\�.�R�s�C@\�tvV��\�!��U��\�\�\�Xu\�U]p�U۬\�\�ԩ\�ݣ�5*�=\��\��\�v�:���KIE���4D�\��p\'\��r�XӦM�Rϰ���\�\���A|A��� ���H��M� \rM�f\n�R�\�\�e>irs\�,a\'ϨQ�\�\���B��W\\?�\�\�\"H\r�\0z\���rb9v@�\�)5�c�U�<�0\�$@�_��@��\�[\�~v�|�1\�s\�Ž�>3��E\"u�Nj*)�E\�2DTv�\�OH������\�ҋ�Ť`\�\�\\sc1c%\�5\�gϱ	Sf\�\�\�9]\�@\�$@��T\rf! BCC�O@E��\�c�PD@D z$@�\�\'\�(0L`��+\�A �D��\\EC\�M@@�k�e\n�s+\�)l\�v�C\�\�.s�\�	�\'�\�*}_�u�\�6s�)A*P���/�L![\�O�\�\�4\�u5 \�\�@�j\nx��\��m�\�\�NČԃ���0s���\�\�\��06\�}C$�iI}D�6�\�4\�6s ��:� &\"\n���L�Rw+\�V����4VC�q���\�4<(�����k/4p.�\�	��j\�a��I�\�wex�S��駟:!	Q��	\�\��e\�ߟb�\�\�G\�\�`�\r\\p�\�\�]��:�A���\�\��L5`ԧO�V���\�$!�AbϏ`4�g�\n��\�w�\�H\�E�\�w\��\�u\�Ѽ5k�K��o�\�\���\�.�X�c뭷\��;\��K�\�> �\�3>��\�{\�1I�u�|¸b\���u�v\�\�\��	2w Ȳs�\�:\�j߾�Q	�3���������̘G `\����y�\�\�\�\�C_ᇝ\�ʡfF��\�X��ɳ�}\���ݺus\�#�\�z����=528�ØoIKG_(hͳCz;�L�\'����\�ܑi�\�57;^t�D���)ӭi�\�ֱm˨�*�bN@)�b\�@�/H�\0I��������R0�ox��\Zϒ�-$ L��M�6.�Ka!\���Yқ��^���H�BP��:5�ҷ\0C4\� �\�\�[\�O0\��\�R%pO`�\��\�o���\��i�B\�:��iEh�]\r�|\�z�\�\��7�\�_���K��o�I�\n��B��\"�UϞ=\��Mr��\'\�	�^��9\�	�\�瞮�Y\�\�\�~\n{\�ڙ\�W\�N\n�\�S:�Ӟ6\�1�\�	��*�@��\�/���&\�\�\�\nhO�>\���@/y\�\�?^}�U{�\�c\�Vh3|*�\�D,\�\��L+�?�\�\'��e\�b�r\�\�\�.vrF��m\�o8\��	st\�\���\r{\Z\�c��\��\���UJ=3�\�:�\nA\�/@0~�c|�hv%���\0��k|\�(\��\�;`�X\'@�\�ļ\�\��<\"\�R�\���\�?\�\�21\�?�#�\�l�g(\�<®%R\�e����1y��\�I��r=S;\\\�\0�>�\rv\n1��1��|3oӟ\�y���+\�\�\n\�\�47����\\\�P튀�����@\�H���Gd���T���\�\�Ƥ�2�	d1b�\�q@J�j?��g��Q�G��\��s4\���\�\��#W\��8\�/K\'�L�3T\" \" \" \�  \"\Z~�\" \"P\�$@\�}��v\0\0 \0IDAT\��ac\�e�\�\0>��c���\"\�\�~�:�\�a�.gey5\�gH�\�N V\�K��\�Q\�>�u<��$���)Iތv_��)\���u\"	aPT\" \" ��\0Q\n�����4_���\�&\�\�\�o�@J���[vs��\�s\�َ;\�\�\�7U\�y\�o\���\�-��KaV�\�\�\�:\�\�\�o	q�R�mT\�d�7J�S\�(yC��@yH�(W�*\" \"���\�*z��ů��@U\�<cYk��\�@U<u��\0Q]��bo%@D\�+ɴID2��^�@*	\Z\" \" �& �\�x�\�i\" E\�<S4:]�0 \�\�vGD�S���)���\�\"P\0�>�j\�-\�\n�*\" \" \��\0.ϲ���`\�Ъa�h�\�P��	H�\�H�4	���\�/\" \" \" \" \"	a�,s;\n���0\�3\Z\" Bc \Z$@D\��BD@D@D@D@D�toM�\�\Z\�ԮU\�Ť�F�\ZY#3������ɦ�`l<%CE �$@\�\�w�<\\\�.O�V8	�3\�\�P\n�\�\�*��`���d����@RH�H�\'\��P	H��\Z�1�\�\�؄)3l\�\�c\��g \�\�xٮ\"\����b�u1\�t������F@Di�tu�	L�8ю8\����\�m��\�/�\�\�\��\�ٳm\�ȑ6j\�(��ꫭE�彡Z/�����\�b���)ӭi�\�ֱm\�\�\�TC\"����H>	\���z(\" Q\'�LQ�\�?�)0G�`f��+��®�\�\Z[s\�5\�{\�\0\��(g�g\�IWm�����@�(S�|\"�D l \�&��D@D@\n%�\"ԅ�\��\nV|�o;k\�,1b�x\��9\���2�[T�w\�uW\�\�3\�<c������\�\ZE٥�$�yF�B�&�L\Z	\" \" \" I! \")�T?D@D �$@\�\�w\n\�\�Q���\�/\�رc\�SN\�ye\��\n�}��^\�\�~�3\�<\���\�+\"D/j�	���5����a�R0%\���D���H�AF���@U�\0�+0G`\�3����\�\�駟��ʠ\�p\�=5l���\�\��^#�mkDx\�\�<K�o \�\�$X�\"\�I�b<��L���RH�(������0(6@\n�y����\�O��\�o��[E�\�v\�\�ܹs�K�.�\��\Z\�}\�9\�\'|�\�GֳgO�4iR\�ϰ�Z\r\\p�=��\�ּys;蠃\�N�\�_ܾ�\�+�\�;�iӦֻwo�Z�{\�\�~���~�Ɏ:\�({\�G\�:\�\�O:\�$=z��<ؖ\\r\�\�;�\�\�^r�px;����:\�6���Jk֬Y]����{]۴�\�Oص\�^k묳��u\�Y\��\�?\��\�c�\��\�?ow\�y����\��\�_�>?��\�\�6�s��ǻ��c\�ԩ��=��|����\� ��k:v\�h�\��\�=�\\;\�3\����\�}�]�\�\�\�\�Gu��\�箻\�\�l\�?����ej[ፒ\�lI�Lu�]�^����J�\0QiT\��U��z|��V/	\�\�{�\\D@�B@DT<�\�\�qԼy����@\�}�嗷�#G\�a�f�^z�\�#q\�.8\�w&��\�m�\�\�gp��x≶\�;ؘ1c\\���˜C����\�\�޵USSc\���_t\�Eֽ{w#�\�q\�gm۶��\�SO=eGy�\��\0}��>��sCD �\�\�\�/\�\0��iܸq�\�EY�4\�v\�ƍm\�����\�{ۢ�.ꄊ�\�\�\�\�>�\�Ϝ�\��O>�d\�x\�\�\�SOu�M{���\�d�M�\�b�-fC��e�]\�	�\�F\�iΈ�5v�r\���\r�5W]uU\�\�\�|�M\'L�w\�y�\�Zk9����\�F��Up�m�3:Ԋ\�������J�\0QiT\��%@T��\�\�\�%@Ч_ͺ\�@=�8	wA0\�)\�Y\���~�\�v\�7���~\����\�\�D�LB� \���n\0\�)�\rvD ^d���׳��\�/8�\�\����\�>\����-�\�@j\�~ڴiΞw\�ѵ\���\�k/�k��ᆶ��\�/\' bp\�\�>�\�c\�]w�۝p\�%��~!�s\'\�\�\��L\��C\0\�.v;��{\��\��Ή:�<< ��\�~�y�8n�*y$@$ϧq\���y,��*S|}\'\�E@D@D@D .$@\�\�S\n�\�(ܷ\�~{]0�X\�[3{�l5j�k���\�*b�*@poD��W^\��\'O�\�\�\�\�w?x{3\�I�\��\�/�\�\�}��� ]��\�! �t\�\�\�\�\�@\�\�իW�p�y\�5 �	\�-����]\Z\�n�mF\�K�\�yHoE�Ly��\���\0?�%\�b	I��#\" \" \" \" \�K୩3]\�;�kU5\Z5jd�̬�\�/q9\�S�\n\"�{�\�`\'\0)�n�\�6W��TE��\�(U��ȳ\�>\�R&�\�\�W_�֭[��NَL�{v7���z��p\�&@l�\�\�\"ώ�S�z�<oC�m�\�\�H\��p�	\�\�V\�O@D�}�H���e���D���\�޳��+St<\"KD@D@����j�r�>>�\�sv\�1\�8� _\n�VX�.؞���\�H�뮻l\�W,(�1\� �.ă&M��bΈ�\nD��\�z\�Y�f�B\�ԧ\�ѣG\��F~���)\�\��\�ߺ\�|]�jA��\�\�\�@�6l�\r>\�Z�l\�\�\'\r\�<\�jXp��`Zi��\\*(\nVS$�\Z�m\�̙n�Ɂ�Q$�\�aZ\�%t��R\rŜ��\�sl�s��1\�̏+	q�\\�\�V\n���L�@�T��Pb:_D@D@J\' �t��laʔ)֧O\�ر������\�/`\')�(��\�K��\r���\�]m�ԥ��3��!C���:�sj�\'\�ޮ];WL\Z�\"ɣG�vAsvAl�\�f�xA\�\�\�辐5���H}�\�:\�B\�\0\�j@�5|�?�<�3\��\�w�(��\r~wB&\'\�\'��\�>\�\"m��n��	��&U �-�hS+b�\�vs\�\"0P<zҤINp�7���\�\��옸\�[�[�n\�\�G\�Xq��ik�\�s���K�ЀO9�7on����]q\�.\�i�\�m��-Z��\�v<]��Χ\�A;\���?�~���c�\�RK\�|\�\�<���\�H>\0!%\"�jBD@B 0~\�tkڤ�ul\�2�\�Ԅd\'�\"\�\Z\"�| �\�c�PD@�N@)��\�\�S`0��>�\� \'P\�\�y���ڤ�yꩧl\�=�tE�RS�s��y;\�\�\\0���@����5\� �>x�`��裏\�y�4z\�g\�\�<h��6�z��+��\�Ə\��\�@\�@| (\�\�*�;�=���P\�vg �r\�)Y�O�s}\�\"���)\�͎\�8!���߿C�F\�T�\'Nt\�\r�E�6m\�N�~��Չ=�\�\�w\�	��`g\��K/�\�D��\�^\�8\�ת`���\�ӧ;^�c��\�w\"B�{\�Wl�m�q\�M\�̙\�\�\�\�\"D�\\\��GH@���\�[�C?\�9\�\�A�\0�\�0��^�H?\'�h�\��g\�\�7Y-\" \" \��\0Q,9]\'�! \">���\" \"�T*B\�*0\�Q�\0s\�\�u;!�\�5 �\\�s��N (Ɲo\�@���-\�1b�\�m�袋�\�t\�\�\�<{�!P\n��@��\�P\n�ȻH�@\�$@��P\r�����H@D�\0\�r���84;ة@:� G�vb�s\�9��\�[�]�o6�r\�~0\nj\�O@�F��M@E�5*M@)�*\�\�_D@�C@Dr|�����@\\	H���\�\�\�(j,Pd��9\�z|��\�ֻwo\�ի�K��/�O\�v\�y\�H�\�Aj\"_�!\�=IkDJ(v@l���NO\�\�I��\�/�tQ�o�y,�\�\�\�<\�\�\�u���\0U\�T�]*B]=�VOE@D�\�$@���\�\�G@D>B���\�q\�z�\�YW��\�\�o��A\�	\�%PÂ:	A�\���\�ח�z_e_\�\�<\�p�u�h�\0m�T�u ��\�\�\�R0E\��B\�I@D9\�m� $@��s��d�$��晄;X\�L@D`T:�L$@�	��]���PkP�@�	\�2�]\�W\�!�UE@D@\"K@Dd]S\�0c\�(�)1&�y&\�Γ\��\0*N5V	E@\�%E�\0Q6]$\" \" \" \"P\0	��\�\nV��\�-\�A@�Lu�Y�\�O@D~F:��$@���Z��`\�h(7���\�t�\�ԮU�o���1\�\�\�jkkk#cT>C\�GH�(��\�R	\����\0�OƷ \�\�;Y.\" Q#��\�~5\�F\�,\�#\" \" �& \"\�\�U\�D@�% �Xr�.i�Ϟc�̰�;�OZ\�ԟ��\0G\�L�����d����@\�H�H�K\�!�0H���\��\�	��2ݚ6il۶,�1� 9(���$���\��X=��P\n��{\�����d�Ę�\�;O������@T��h�DbF@D\�&sE@D �T�:&NU`0&���\"c�gb\�<�*�`\n�\Z�0	v�L��H�	��(����\�5\�\n6,o\�M���\�j�������Pk\\T��R0U\�\�s�`�_��\�K@D��^=���\0O\�C���8Jf�@�	h����dz�$@��S�A@E����KD@D@2�\0��!\" \"Pi *큀�W`0 (�&\"PG`ڴiֺu\��D4\�F�N@D\��\�I����d���Ą���8Jf���@�	H���s���d�D���q\�k׮֥K>|x !B�LD�\'3*N@D\�]P�H���!\�`\0����P\�F\"P1}�լ[��\�\�\" \" \" \"&c@���8Jf�@D @\�\�\�\�Y�\�V[\�\"4\�D\�y2�\�$@T\�Uo���\r@E��n$\" \" \" UK@DL\\��`L%3E \" �\�b����gQ.!B�LD�\'3*N@D\�]P�H���!\�`\0$@4j\�HD@D@D@���[Sg��wjתj4j\�\�\Z�����2�\�\�&\�#�M��\"D\�s\�=֦M�:\�5\�DϏ��2$@T��\��? 4\Z\Z��R05i\�G*G\���\�Z���3@w�*$ �\n��.�@�\�\'@d\"$@T\�(Q��>{�M�2\�v\�\�^�D�\"$@T�n*\" �$�\"ԉt�:%\" \"q \"\� �\'\"P:��D��\�X\����u\�?8����\ZOk�G�.\�@� \" \"����)ӭi�\�ֱmKQ��H�(	�.��R0�\0�!�ȵ2�\�C���&�\�f\�\" 	&иqc\����%@$\�\�\������P\n&�H>	\���z(\" Q\'�\"\�Q�\�?�)5JL%3E \"�\"\"���$�L�t��(���PM��@\�H���\�d���$����8UDL%3E \"�\n�Ũ5\�D\�y2�\�T��\�.�z���\�@��\0\�`�u#�	C������C@DL���1q�\���\�\'@�\n\�d\�3q�̨8	wA\��\"\�U?\Z�R05j\�H*F@D\�\�\�\�\" \"  ����66A��ظJ��@$d �n�[�^�N\�3�p���\0	pB�� �\���/\" !�\0\"L5%\" \"P\�(\n[\�_��`\�3\�E \� jjj꺐Kx�\'i���\�e{�$@�ISmC@D1\�t����@&}�լ+8\" \" \"P1 *���+0X/�-\�N\0�k׮֥K��;\�i���Q��{ 4*M@D�=P=�W\n�\��z*\" \" \" �\" �R\����\�\�\" 6mڴ�����\�<�A#�\0��Pi *\�깿�PW��\�S����\�t�\�ԮU�Lh��6j\�\�\Z��D��\�\rE@\"M@D�\�#\�\Z�����[e$ B��H�h(Һ�T��R0U��\�,\" \"P�$@T�\�\�s�$@hx��\��Ϟc�̰�;��	�^�7U\n��t�:]eT��\����D���H�AF��D����yD���T+��S�[\�&��cۖՊ@�����@���	(S\�\�\Z�B��\�&\�H@�L5z]}H2	I���&\" � �\"\���)0G\�L�1\�31v�L��R0��S���D��R0E\�92MB\" \"$�jFD@D�h �Fװ*0ذ�u7�F�g�\�\�\�s&*B�qQiJ�Ti$��;\�S�\�=\�}O\�n\�C�~6h\� \�ڵkr!�g\"Pe$@T�\�\�]� 	tJ&����d�Ę�\�;O��J@D�8\�XT��h�$�fK.m{Tw\�\�;\�F\�&\���{#�ۨG�\0��N�x�\0?\�JH2	1��1q�\��\�<c\�\��P	H��\Z+���\"�\�@ �￶L\�U\���~��m�\�:u\�^�\�* �\�I\" \�\�+Y*\" I% \"&�U`0&���\"c�gb\�<�*	�\�TcE�\0Q4]�@�\0�~��@u�Ċ\0A�~5\�\�\�f+\" \"�, b\�Oc\�(�)1&�y&\�Γ\��\0*N5V	E@\�%�H��I\'���������H@D�0\�ٔ�夫�E@ �yF\�@�& B#�\�$@T\�ɽ�R0%׷\�������D��[Sg:\�:�kUC��Q�F\�\�\�jkkkCo�\\\r*0X.�jWD�\�<��  4�A@D4��D+\���_�\�u\�Y\�U�`J�\�էj\'p\�\�w�_M�jǠ������@��\0Ѡ�u3���\0O\�\�r�>{�M�2\�v\�оܷR�\"���\r�r�\0Q.�jW�K@E��\�Y&\" \"�\\ �\�[�LD� J��KE@D D\�L��M\Z[Ƕ-ClUM���R0i�@��\0Q}>W�E@D j��)j\�b��1q�\��\�<c\�\�t@@E�@\�)\"�0 \�PuGD@bH@E�c\�4c\�(�)1&�y&\�Γ\�P\n�Pq�1��\0!g\�h  \Z�n#\" \"�����c\�(�)1&�y&\�Γ\����wv\�+�lH�n���\�D (�`\nJJ\�J@)�\n%��E �$@\�߇\���ĝ���xP��\���\�\�\�ѣ\�\�{\���\�\Zk�\�\Z�8q�q\�v��\�\��믟�&_}��\�q\�ִiS4hP\��\�q\�o��fcƌ�;\�\�\�:묺��\�+\�9\�-jmf�{\�쌊=�g�\�	\�Qi *\�\�_E�5\�E@E�\�EV\�@t	H���od���T	1�t\�����6y�d�\�[\�\�\'����\�ʮ��Jk֬YY<�\�/\�Ad͛7��￿(\�\�v�\�\�w\�m\'�x��~�\�mE\�\���n�\�f̘a}���aÆ=\�o�裏\�	\'�`K.�d����\��\�G\�DD���:\�.�\�\�\0���v\�iK�z\�);�\�#s��X�*jN\�晊\�\�\�cM@D�ݗ\�%@$�\��H�EF�@Y	H�(+^5.\" \"���\0��pJ�����\�s\�=v�\�\�!�b{챇��\�\n�\�B��رc\�n�T�\���\�㎳�m\�$@p\�N:Ɇn_��m�\��ꫯZMMM�&���%\�9\��\��l\��.��STS.z\�7��s\�\�\�}����\�:[b�%�gϞN\�w\�}3\�*��6>�\�3�\�*�\�\�u�\�gAۋ\�yI�g�\�V�ċ��x�+�\�J�H�W�\�\'�`��d�4$�>�j\�m\�[\�^\" \" \"P������\�\���\�/�\0�\�+�\�`#]�\0�n��\�;Ϯ��Z�:u�z\�n7\�z\�WT���%\�9�o��V;�\�#)@̛7\�.�\�\�ڵk�X�\�w\�\�\�Gm\�{�-�\�bNx �ֶ\�n[Vߟy\�ַo\�:\"\�ϊrhD.J\�<�2#\�$@\�\�y	1]DB�n�u�\"�D@D@D@D \�$@\�\��I	\'�\�\�7\�lk��V�\��\�gP�Ĕ)S\\��SO=\�~�\��7���-[\�e\�A�|��3g�ەA���鯊\�\�?��\�Kv\���3~�\�O?�\�\�D�&M��� �\�k\�*��\���~\�W\\\�l��H��\�k\'\�O\�<uβ/�$@D\�GI�PD\�=\\��I��{\�YD@D@D@���[Sg��wjתj4j\�\�\Z�?��M��$\�M>��VZɖYf��\��SN9ŭ*\'��\�={���]�vn:�3���\�\�\�/��}�\�\�\�?��� z@>[�\�\\\�\���[�O\Z\�CdJ\�y�<�K9�믿� ���\�o�.���+䡇����\�^�u�j\�\�O�]w\�\�����\Z2d�m�\�6�\�^{�����\nr�\��\�/���E�\����;!b�E�_|ш&�\�\0\0 \0IDAT.�\�\"�v�{챶\�{f�m��\�\�.Ws!կ��\�sH���q���ﻱ1`�\0\�Kvi���U�:ur���v�m\�e�\�8.�\�i�z#\�g�u\�q�\�l�\�\\Z���\�\�:v\�XǓ\�g�qF\�\�^{\�5;��\�88�W�^NDJ���\�\Z?��cA�\\O\r�\�q�\0�\�\�s9(�ޥK��\�KI�g*O7N	�rg,;#\"�n��\�J�7\�H���\�޳��+S�P՘����\�! �BC�@2�y�R�>�\�/�p\��<\�D� �{\�YgY�V�\�\�3��ͪx�\�\��L��3��z5 81��\�m�]Vq$r�\�]v�+JM-Vُ9ұ!EլY�\��\�w)�d�&�=z�躀y�s2\�@���o��\�\�W�#<�ˀ~���\�Ծ`��ER\�c�\�1\�\�Ρ���\�\�\��!%WgΜ\��\�\�֭�\�\�;\�j��\�j<�/�^F�\�\�\�\�\'a���^j<���A\Z,��`\�8 f!\n��e\�Q�\�g~��\�\�r\�d�M\��\�?w\\\�C�5\��ƍ�1���0A\Z�O>�\�\�Yz\�+�J��v\�4��Ϟc�̰�;���u2�\ZH��/W��*B]T���PW��\�-\" \"P�$@T\�󙂵�Y�\�ߖx�P1�\�	\�.�\�r.=�\nƌ\���/�x\�\�\�\�6\�k�Bپ5+\�	d\�\�.�\�M�\�<�#��暌v\"p<���f�\�x\�\�\\�\�ǃ�D��6m�p�\�\'����\���㏻4D���j��`\�\�	vvt\�c�\�9\�ck���K�����S\r\�:\�ѣG]��\�\n\�\�\�l=6\�xc\'<d\Z�0ſ��BH`\�\�\"5O\��!�\�v?D(��bSs=��PD�u����C`��\�ִIc\�ض�T�\�X�V�H@D��>�@n 4BD@D@*M@)�*큀�OB`0[M��\�\�\�-Z$R�4�%\r�jR\�d:��`\�׎O�\�T�F�\\\�|\�-�,\�\�ԋⳋ�U��qB\� �\�������~z\�%�}	r52\�; h��:J\�q@\0�~���6=�\r6\��H\�\�\�\�Gl\�&4�K�@(�\'�$H�\�oZ�HQ�\0\�Sr�.\�_\�\�ݻ�+�\�σ%�\"\ZH\�<SD�u�����T\r�`�\ZW��\"PG@�����@�	�u�=��I�z\�\���K{\��\0��Z�\"W;>\�\�N�\�&L�[o�\�%.��)�H�D\0�\�?�t�, ��\�w\\d ��S�\0A�g�\�� `NJ�g�}\�6\�t\�z]�L�a�bֹ�X	\�?�pu6�Zj)��iܸq�\n0�]��\��8Aw\\;�J�.	�L)�׵\"\�	(�Ƃ�@R	�uR=�~�@v 4:D@D@*M@D�=��I��7��\���\�\�\'�N�֧�	�e�\09inH�Ӻuk�;\�Q� w�>О��\�`?)�HU�\��a�\�/\�l#\�jUP�;\�Nj ��ɓ\';�\�Z\�\�B�cb�\�W\�{2\�; ؅�J}\n]����O����\�;\�\���\�ـ\���\�ԩh֬�\��\�v��\"˙�X	�TS}��q5-v\�i\'\�\�����\�\�\r\�Y��\"\�\\HQ[\�(�Q\�\"РT��Aq\�f(��E�H�(Y�+\�% \"���e\" \"P-$@\�\�\�I @M � ,+\�7\�l3����4��g:�\'�.\0�\�oڴ\��qb�\r7\�P���\�Z\�\�FAc\�\Z�P29�7\�h#w?��c�=\�\n\�k�\��\�{��3�ݬl\'E)����\�ܹ\�z\��&�O!f\r\�P��@��{\�\�\�7�)Mo�\�6\'\\\�;\'}\��\��W��\�]P�B\�켸�\�]��\�-@\���ə�PSx����\�_\�q%\r\�*��b�\r�=�\�#o\�7\�5Rw^xA\�뮻���\�n\�rL�8\��\�{oW�����F[��\�,�~���\�@�m�\nPS�\Z&\�\���\�]uxs�.\�_~Y\�g\�5��\�n�\�\��Etڙ4iR]=?aM\�*_��1�����8�2\�T��\�, �\�\�8�FE�\�\�xجL���0	H���\�(���b�U\���	��=\�\�:\�,#0��\�\�i���U|\0�\�ٳ\�\�#��v\�\�e 8�4?͇\�\��E�\�:V�X�����\�~F\��l\�,�\�b.\�L�	\�%a;�9R�-\rQ�aCj*V\�Ϝ9\�\�\�zk\�v�.]\\\�������u�)�}\�!�\���\'R\�?�\�\�w\"E�A�vV�FBd��7x�\��.��l������>j�;wv�	�r�q����nݺ�fT\�\'b\0���?\��\���\�DP@�\�6\nc#D1>�}#\\\�ra|N�>\���s\�_}\'!�=��\�v\�:��\�N�\r,\���\�۴i\�\�	bG���\�/�~��\�\�\Z��\�\�2τ\�C\�T/	\�\����\\DT<�<;T�:y>U�D 	�\��\" \" \�& �܄Cj_���@���4\�hp��\�$@h$T���J{ ���\0�\\ߪg\"��\0A�~5�\�a-������\0$@\�d(0G\�L�1\�31v�L���Pq��\"H�(�.	D@)�a\�I\" \" \" \" !�\0\"\�r6��`9\�mh�\�8��	H�\�H�4	��@r\�\"\�\���z&\" \" \" Q!�\�\�\�3\�\�\�~t��Z\�e\����I=H\�\�Ȍ����\���q��\�\�<[\�\��	H���+�����邀$@�\�D A��)A\�TWD@D &�/���\�9�\�p\��:�I=$@$ճ\��@I$@��O\'���\�sl�s��	ꕺ\' \�\�x٪L���0�uՆ���@!_2�\0QȈѹ\" UC@�@T��\�Q��?e�5m\�\�:�mqKe^\��u\�<&{E�t Jg�D@D@\n#����\�F�\��\Z��j\\������T)	U\�xu��	H��j���\" \"P�/I��\��\�ME@\Z���iӬu\�ցo� �҉	\'$\�ԩS\��\���}�Z�f\�ND\���\�ٳm\�ȑ6j\�(��\�m֬Y.�\�~�\��6l�W��R0i@�@��\0Q}>Oj���\�/{��\�\����m�\�I\��U&�\�Ϸ>���j�o���\�\�\�n�\�6\�ԩ�����e�k�6����\��\�T�q\�\�Y׮]�K�.6|��@B���h��\�#�\�{\��\r;v\�h�\����\�\Z\rgL�wz\�\�K.�aÆ\Z_Eަ\"�\�+B�\�oڵ\�^kg�q��o�:qR\�oz\�W\�5\�\\ck���\�s\�=��\�K��\'L�`\\p�M�a�R0\�\�\�Q5_E��\�\�%\�#P-�C\�=�\\{�\�m\�%��\�\�\���ڏ\��\�-|�\�[l\�ر��\�ۮ�\�j�r�u\�\�\�Zh�\�#�\�\�\�\�.�6mڸ�,�H\�m��\�\"�\�g��y\�\�g���\�\��\�w_�2e��|�\�\�Y B\�~\�P|ID8#I���D�\0DMMM��[m�U^!B�@4�K�\08餓\\�1�\�ӧ�]w\�u��\�7�1Y\�\�j\�#F؁��߇\�o�\�}�Q\�f�m*jo7O\�s.\�\�/���\�;\��Ya�¸�ڨRw\�u�Z�ha���v\����Y+l\�Ö^lQۿ�\�UJG\�.	\�\"�vE ��A��\�\����\�F\�q\�\�q\�Wڜ9s\�\�϶&M�D\�AX�\�3\�\�*��R\�b�o��\�1Yv\�e\�SN��W^\����O{�\�m�\��֣G8p`�w`�ķ\�K�$.`\�\�\�z���{7��\��7ǌ3\�N�O<\�\�[o=��\�K B\ZJjFD \� �\�b\�J=r	��a<J\0{̘1ֳg\�z/��\�z�3��>�>^~�e�:���L\�o�a\�_�}�\�����q_��\�\�l۾\�<�L�囏5\"P\n�t���X��׊k\�&[t�\0Q\n`]���R0i`�@����\�#�8�\�N\�w\�yǉ7\�t�\\\��`\0\�|+\�-M\�ǣ�:ʽ�#Ȥ/rb\�\�{\�\����>:��}|y�\�\�UW]\�\"P,�Lm�}\�\\�.奖Z�\�\�u]\nŗ$@\��\�\�u��_la����h����\�?[ӦM\�\�Y�E:�#�<\�V]uՆ1$\�]X\�\n2�짟~�g͛7ϥ��\��\�D\n�r��u�u֩�ݥ\�<�\�\���\�߭��\�\�=;�\�[\�V/�L4�{\�9;\�\�\�\�IgX���߸zGHyz�\"\�\�\�VE \�n����Y7\�&�l\�1IoJ\0�wT\�S{\�1�k5\�e�.I���? |\�WR\�l�\�p���_�u��\�\�!�\�Im۶u\�(:D�\��\��?\�����Fa]�����ƒ\��0�|�7=U�\�?�s(�z�\��\�u�$V0�RԮ];��	#\��ꨛo�\�n�\��;w�\r\Z4\�>�\�z\��\�ߺ�Oܻq\�\�n�+�8\�s\�	\�z M?g7\�^{\�\�mgڹ�}\�\�g\�\�\�>v��\�[˖-]��~\�G�P��#R=!\00V�\��m��\�\�Ə>�\�\�,�4iR\�Ͼ�\�+g�z�\�\�\�=�\�.w,\���\�O��\��.�\�گoCzu����e~֢�.\�~\�G m�\�\� �0�R\�\�H\rpꩧ���\�%�.[|�\�ĉ����\�O������\�Eqb>\nY�Ƈ��\�?\�r�sRz��\�\�zv�P�\�3�\�>0\�C|\�M7u�\�}۩m\�7��S\��\�fC��-�\�\�.��b[}�\�\�d�9H��\�{ӯ\'�x\�\�\�@\�:묳\�r���\�t�1$\�l�c�>\�\�C������\�\�_�c>O,\�\�>�4\���ּy�z<S}u\�w:n����\�C�g���ӧ`�`?��S\�i\�\�v\���6x\�\�*71\�Ή$ \"�nU�D�\�	���\">\�-����{�dW�\�lǨQ�\�\�C��\�U�6\�;�\��;�\�{\��\�\�)���\�]��\rҗ�\�{(u�\��.�\�k���\r\�9R\�1�\�\�\�]\�\�y��\���L}\'\�*\�pM>[�}w�\�\��\���wi~�ꫯ\�K#\�\��V�&޿x\��A\�|\�7�?���\�]�_\�\�پ��\�J��\�=�w;�{x?ǯپ-�.�T��x\�A�4?�>\��ɡ�\�\����\�\��0\�#�\�,�~�\�\� Az����;\�07^��#����f�\������r\�-W�\�\�?&�\�n;���\�Kd�&$W6_�\�`\�ތ�?��\�}��m���\�s��\�\r!�o9��u�F@�%	�� ]-\"A\���An�\���.�g\�\�+C/�ƓǺ���p	\0�׿�eݻw\�\�p�`5+�>��c��UV\�s���\�;;a�]vqAQ���y\�$�\�۰�X˴������\�\�\rD����J\�M��\�V�Z�Z>���^�8r���>\�\��=/���v�[\�\���/�|y[\�\��˭�P\�œ\Z\�o��;�\�(�|\�\\t\�E�9/�}δ1��r\�>�syꩧ\�ǁ/ ΋.�\�\���||̇\�N;\�\�^��\0�\�N@�z�\�\�\"\n��\���7�@\�x㍝�����\�W�\�/I�|�((l���%�x 0\�\��9��\r��\�n�\�b�-\�>p���k\'ؐj�1;|G\0��sٌД\�Y\��\�{oC��~\�#�&��l�\�\�5s~Gu��\�\�s����\�t�\�\�\�a�$�\�y�\�\�.7,�7\�d���\�ݸ�\��\�2�\n�-�\�2\�c��W\�\"E��\���.;v�����\�N��~/P\n��p\�d�\�\�T�\�e�\0�!.��R�.�\�\"@\�z\�a\�\�S�\'���$�����NЩS\'W\��\Z5Y�\�Zk�w�(���\�%y_̔f*�m\�x�9\�\�\�5R�\�.�{	\��>Ėb\�]y�D�aAh\�m\�\�SK\�С\�\�B|\�1}\�G�\�\0\�\�Y8\��6\�\\�yo\�{�\��\����f`�\�\�o�\�\��\�\��m�`%=\�;찃{Gd�	|�F�\�\'|�\�7X��\�K֯_?w\�߼�\"Va�\�m�\�f\�E�\"�lcf�\�|��|� ~�P���\�\�~l\�\�5\�\�\�s\��A~��g\�g0&#<_|\��&\�ڵ�{�\�}\�X\�\���\�O�s\�\����cܗ\ZmJ�U�\�/\"�\�݇lo_Mx��ѡD@��\0A�\�9YD�^by�$ ���32m)僇\0>gV[���ӦM�w\�l\�fEU6[yY\�eտ��C�\�\�|��>\'�ˇ�eu�_}\�8\�/��~\�Js^�O|�\�3g\�t�\�t[=l�k��@��9\�y�\"@�\�\�GA���\�L���\�\n�b�a\�\n3^��=�lu\�c���`8/\���W��\'�\�l�6l�[M\�\�=V��/�\�i���Z���@C\�d�\�g�\�!�kSw���n8�q�Ov\�qG\�\�\\��!��k.\�|\�{n��\�u\�*�p\�\�\�{���N� ��d�L]E\\���Ex���]Ƽ���+��P\�\�2=(�\�m\��m��n�\\uQ1S����T�Z�C���-cߵ~5v�F�go�\�6\�\�=��1\�\�\�u\n\�7����<\��\�_���˻[�\0+\�p��\� b	J�\��.�I�\�g&h�#�\0\�w糥�wW�x\�\�\�杈ov2\�L�\�G�\�v���!\�;��@�\���]�,\"�Ύ�\�?<�7\�\��\�|[ @0��\�aQK�7Z�6RW\��\�\�,$�O��\���\\c��\�c�9\�VZi�z����\��\�\�aWA.�sq\��;\�<܇�u�b�\�P��wr�;��8\�0\�W�\�\�~�5�g���M\�{=ℷ���B\�.H@Dܬ�\�z\�E@R	hD|\�C��\�Bz⃪ݺu�\�Z��\�J��],��5k�@�^��I���R\�\��`�r�>&xaF\�H?��\��{�O\�sˊuV�\�^�K ��\�gϱ	Sf\�\�\�י�-_(\'\��P\�~V�#����\�n%;(���S^vS�T^�\�z_\�#���8Xq\�N�W�\0�n�|6��\�\�?��XG|A\�\�e6�\�?\�\��=�Og\�n\nذ{\��\�sD��!]\���#���\�\�+��L}�>\�\�:\�j@��g�l�Z\�CC�	�R\�@` �҉\"�\�P���6w�K�w\�c�=֥�a�B����\�=�\�|�v��\�1� .����Lu��ӥ�c\�Ϳ\�N]\�\�O~ǻ\�M�8\��^\�\�\�|\�\�\�]�7�fv�l杔 =�vR٤ژ\�})\�w\0\�i\�@E b�4;�\�\�ʮ�b���\�~vr�ˆ>�Bߧ\�*V�\�gs�I+۷���\�8�BF6�sq\��;\��\0��)X�\�b6\��a\�宻\�N�H]\�U\�7!����SūB�\�0\�9�	H��\0�gCD�\n T������ϔ-�al\��\�X]\��煗��xeeǊ+���-���f+��i\�\n�f{Y�7�{VǰM���\�\�Ox9&MT�� 	�D_/\�{���G�5^��?{\�6Eu�\�Cc�.6�XP#A\�(��Q6�\�\�bD1�؍\�F�5�b�{\�+6TDQ��(\Z\�g,1�ؕ��x�̷ߖ\�ݙ\�)\�<O�\�~3�����;3\�w\�9�\�,I<\�C��=\�%NAi�\�տ�Vj?\�˪\�(\�V�K\0y�\�g\�_=���P\�\�0s�7�-^yu%h)T9�KqUz�r�}�|��^��(߮|%h\�iŤV\�)\�Y\��\�**h;�D�bc*��S\�z��ì\�\n+ؙ\'�/�-\�@�R017 �?y �ZQ����:t�(�Ea�6\���̣�Ze���J��\�o=\��m\�\�ʷ_l��g\�\�s\�ئ�k��R)�[x�\�x�i�i~*٢�͵>�����^�e	\�]�\�T�\�eiż\��ݽ~a��u�\�a�.��\������\�(L��\���,�1�\�\r�\n�\�\�\����z\�\�s�\�A\�X�E\�\�_��ľR\��7���s\�{��\�.VJQ�\�$\�H�\�ky\'���+	���\"\�L�|D\�Y\��@\�	T �,7�ƻ]\�f����Q\�\�Ü\�T\�MyJ��T[�}a=�uWs@�\�F�`�^\�d��\�R0�۩��)5Q0��^^��T�\���\�b�9�\�E!A\�\�?.��/��¥�R��`�k�(h%�R\�h��lU]�&S�4M���\\\r�U+v�bI���Q��c���9W�K[��\�J�P�\�L\�˙\�S�\\�q\�6-\\�V\�Q\�%:\�׋Q�`*gs�\"\�A��_/ez\��i���O�\�.\�\�d)�ڍP\�o�\�I/Z\�7�UV���4hz�P]Պм�\��\���\�%\�\�g_Q��\�|�C�\�	n\�/�\�<?�\�F+9 %�PGI�� �y �\�Su?\�s���sF����r\�<�S��1:\�\�b=\�j����}��\�{\�u�t=+��\n�j��\�\�*=K>c��Mu1$@�zU�\�S�Lq�r%((%�đJϵ>S-Ϯ��\��:��|\�/�Q�\Z�k��\0\�\�s�vXhw���%D\��˿kT�NF�\�\n~	b\n~k�W\�)�J٬�#�o�j\�ӊʟ�$Zi>���W�_���ީF*J��*P��}_��G�\�\�3�\�5\�;aa\rC�\��+�ƶ0o\�\�[\0\0 \0IDAT�5 *͞\��N|	��\�\��@*	� ��\"E\�ς�\�\�xW\�\�K�M�E�\�\���ElW^�H�jŷRiI��z\�T�U�ࡼ�\n\�kշ\�\�}��{0\�J.��kdg�4A��\�]�[�z�\��Z%�k��\�z	\�<\��\�\���^\����U1*\�\��j˶8�Ue��v�{QR�1�Ti~K\�K���ZY� �HU|L/|�Pu���[��\�<�����/V��~�|F\�#�\�@������Z��I�s�e�\�zx\�V|��hŏ^\�46\�\�C/\\�_/~---��)m�^Z�\�N)����p7��*\�s���꫻�\�S/�\�1k������^B�7	S\�E\"^J\�T؆Xj��\�%�U\\\n�+�\�V���YB�\�S;�\�;�H%1F\\\���\�]\�\�ߕ\�P��\�O��y{���9�`�/�\�_VT�\\�\0�\��;&$J\�^�\�o�t���\�N)_)��*�L�#Z�=V�	-\Z��O:Ws�րI\�\�\�1- \�\�)\�@t� @(�����\�D=k\�9F�d��\�bD�}[\�~�N\�y\�y�XF��vF\�\�Z��z&\�b=�\�\�\�\�\�P \�?\�)��@��\���\�YR\�\�yQ+\�uh���(����\�3�\�����|�\�Jz\�\�s���}��0�h��<�z�zRj$\�J�y�K\�x�\�\�\�\Z�W\�=@�ѻ�Ʃ]b�k�ܥ w�w\"=�\�\�\�׫�σ��u�w\�P?z�\��\�\�\�\�?$�\�Y2؆v�*��!�pH���E�z	W�\�㴀I��Tw.\�\� 3/@(娞5U\0[\"�\�\�S�\�\�ݢ��b!��W٠&\��\�c�\�8�\��v47��\��C���V\�P\��gz/ջ��z&\�{�\�UoOs�\Z�\�\n\n3\��\�%\�K����9$ \"(.\'<x<\� \Z;Q�\�i\�Ճ_�Cs\n���\�b�\��U7�C/9\n�\��WAS=Xi����\�Zu���\�֡\\\n�jiՔ��\n�\��\�|�~�\n�\�\�Q�[�z�Pת0\�\����w= _z\�\�N�|h7�l�/z�Ӄ�r�\�a]/wN$P\�A]�y\����\��܏G�\�ԯ�јw;�/v��-v�N�\�\"h\�M\"v��\�z0֊�U�B;Z�M�\��\�ü^h���tK\�4H\� \�\�\� \�\�\�\'�t/\n\�+�@\�Z\r�\0�uh��D���?�����ȇzȍ\�\�ƍs/\�z�\�|�]Z��]�K/�\�\�\�6��b��\�!AE}kN��Y�\�����\�y�z#~%�^\�\�_	zQ\���h\�R)�%.\�q\�%�*\�U)\�~\�\�S�[>U�@z)\�\�B�\��\�w\�H�9�k�ˠO��R�\�4	\n�H\�Q\�@	��\�\�KA@ο\�r;z\�\�\�o��+�4�wTE�LU\�\�dd�@9*x�\�s���t�\��:�Aϖ\��r\�izZw\�u]�z�\�s����\�1}�\�:\� ��\��|�]�\n~��\�a�%�\\�\�=�(P�:J=�\�^\�yP�f=\�\��[��7�<�\�s��#�-z֫�ٵ\�ZX� x��\\1?�4Q\n\�\�=x�{P0]\�t\�i�go=\�k��|\�ŦR\�D\�1�\��,�TQb-\�>\ri�w�I�����\���K;Կ޻ʵ�w�\r7ܰuni̾~D��8=c\�9_ɴ�F\��� �\��3_�Y\�[l��{\�|\�����z\�\�sm)�\Zc9\�\��T���\��NVX��\�;�\�s1_�w��i7�\�\�!}Qr��l�\�:p:\�U\�\�\�Uj\�L\�@\��%�:��B\0i! B�iT��Ԏ�±p�H�wK۩�9=�*�[X(Z�\�\�\\jgD�G\�&���]4nR;B/dzH�`T,�ntd�%��+o�D�.<\�(\��\�G��\0z\��~�^�ֺm׵W����@�fz@ �\"@\�ϳՏ��W^q���\�EAq�\�\�|���گ��\���\�w KD�*mm\�\�\'�J�\0J�\�D�G�\�w\�a�j��\�_H`�D��\�E\�K���9&�\�R-�B\�\r\"��Ei��\�[�9�/Z���\�ZU�m�\�	� t�\�7iU��ò<\���\�n�])\��=?\�b\��\�6l�w\�\0��U\� \"GJ�H<�Ļ��*\0�\�\�Zѿ\�2˸]ڡQ�t\�iG�RI�K�\�W�Z��Ii�|\�\�8\�\�B�Z0�4�\�\r^,��\0\�\�\�z�\� \�WJ2�h_B��f&\�\n �9\� \�\�Rm\�U�P�f\�vam����\�\�\�~�ܧ�\�\�\�q<#(\'@�G\�S^S	a��\�cer[ժ6\�7��\�R�M��@[\�}\r�\�(~\��=\�ˢ\�4)\�\�\�S>��\�\"~��\�L�s9��]6�E:�7$ І�\�J�4�O<�[\\�T6q����6Z���\��5\�\�����V�+w�l-�\�3L;Y>G���E)~K���Zh�\��xYfRilJ7��W��h_����\�\�\��#@|	�\� \0���A�b\�J�3��IB�<��Y9f�9\�\�?\�xGPI�P\�\���{aSi^���G�\Z\�\n�W\�r:�P�G	2\�W��4�\�I\�te⭦u\�]���\02I@\�)J��\�/ۙg�i��\�o��J�P]�W\\1T\r�L��cP���|-�<�\�h\'���*B_\�\�_J|	\"�_\0@\0\�	p�`f@`6�0� \'�8\�\�m�|��\�C\0�\0 \0�F ��\0шyF�@\n	p�H�\�09�`�\�* @T�S�\"@\n��pq22A\��m\�U31@\0\� @|	\"3+!\0��\�\�p\�t�P\�f̴�-\�mP\�	���N\0\"\�n\��(B\�<���f�u�\�\�/ \0�� ��\0�\�\�\�\�!\0���A0A \0$��\�-ӬK\�N֧G�d��!�\0�W2�&�\0\Z\'B\0�@D�/!@D4�h\�\ZnY�(\�\0 \0�%@\n&f�G\0\">g\��\0�M��D�\� �C\0	%�\r\"����� SÑ\�! ���\�\�F�\Ze�-��\�\"\�1��Y$�\0D���i�\02J��DF�6Â\0\�%�\r�^�\\��Ί\'\�;R0�\�wI��C�Τ~��\�m�\�f=W\\\��x\�6_�e\�\�?y�����f��\�2v�\�\����6\�\0j$�\0Q#8.�\0 \0��	_B��y�p! �m\� �\�_F�\0DxV��P\�\�5��<\�n���֡w���\�q\�c���p�=�\�K�\���[Dg	c\�:��{��A\0H\�Kɛ�X$�\07�D�#@\0\"Nȹ	9�\0�cǎ6k֬6\"\�Z�`�<ܺt��Moç9$�\0D��	�\0rF��DΦ<Å\0\�\� ƍ\Za\�.>5쥜�P\�o>�\��[�ܨϫ\�!\'@\0\����\�\�\�܆�\�:����\�\��e\�\'\�\��\�o\���\0�F\0�i���!\0�d\��l�`]\���q�\�8v@03�$Pn\�S��C\n�(a\� \0@\0��_B�\�k\0@�(nL\�&�\0�Lh6�f{ ;�ր\��S\r�\�?Հ�uv|\�H \0@\0�@R_B�H\�\\\�@ a�A$\�!�\�4MCO\�?@�`*DE�C���~��\�m�\�f=W\\\��x\�6_�e\�\�Q��$��e\�_��z\'\�@,�\0 \0�\�\�j��\�;Z\�V\�n��7l�ۭ�\�d�>4\�VX\��ܛLi�;�2\�Ǝ���D\�\�z�,Ɩ�\�L���\�\'�\�L�}\��!0m\�L�\�2\��\�M���*	 @T	�\�K\�K\�Q�l�\�s\�\�5��m�\�\�{�M\n�3�-h��\�^\Z�yxᤙ64�\�<��\��\nO\��W߱�z-\�\��gX\�LXV\"T�\�Y\�\��eyl��Y_m\�ضW�?\�Ю����\�n��\�\�\�\��\�\\��7_+\�>;�7�[�E �pBm��*mB\0A�\�0 \0$��\�-ӬK\�N֧G�d��!P(@L\�2K.a]�v\�̘kH��\�2�,\\��\�{��k\�u��\�pϱܙp��cܭ৸	7�}|\�x�S�Nm]\�R\��\�o�m\"\n��\\\�v�r��v@4\�g�z$0\n\'A\0u\�w�x\\\n@\0H�J\�y-cw\�~�\r80��D@ ��g^oO�S�S9�\0 P7��/�x�v�\�u\�\�}��\\��1\�\�\0��x�\�* �?�\�0 0�\0)��	�@V	TJ��\0�U\�3�<@�ȳ�; \0�\��w\�ymƌ��/\�{-�\�U����\0\��T\��`ED�\0\�I�ߙ:ryfP�:3�L\�@H��Z\�%\��B�\"ԉwB�nu#�@\0���\�C<��\�Ww?\�C�*�6\�t��\"M?\�/~g�\�{Fޖ\03�\�(B\�ld��\����A�\� \04��\�K\�Ny\�fL߂����H\���\�i�@\����f�\0D\��\�\� @�\�i)1�L)qfB B¤)@\0E@񥯖\�c/\�{�\�qͣ�� B\�k\�I�Ǟ�!��\�\�\�ӌ��J��{\� \�&�\��)B�_\�3���l�d:`\��`\��\0 \�pė\�:t\�`\�l֬Y�\Z\�Z;\�q��\�:@ ,~g⼬@�Ⱥ��?>�\��(�\"@�\�s\�\r@\0�\0\�C��Dzf+�B\0\r%�\r���\�,� 윜��\0�G7a��`jt��\0 \0@\09#@|	\"gS�\�B\0a	p�K��N\0\"\�N�� �ZH\�z�!P;R0\�Ύ+!\0@�6ė j�9\\d�\07�̻��$0m\�L�\�2\��\��\nN�@� �\�Ik�#�\0�l�@�P�:>g\��\0�M��D�\� �C\0	%�\r\"���,@ w�n�f]:w�>=�\�n\�8^�`��/�C � �\�l�\0 �mė �=\� P3n5�\�B@\0�@*P�:n\�HDJ\0\"R�4@\0!_B�1M8\�#ny�:c.F�L\�@ � �\�Y\��\� ��\0 \�hė \Z=\�\�H	n)qf\�N�\"Ա#��\nH�\���\0)�\�\"K�H.�\��\� \0d�\0�%��\�m\�\�I�D�\0�<3 2\�\�\��\"ԩu]\�\r�u\�]����\0D\�Hi�\0* ��\0���@Q\� ��M\0��\�l\��@v�G�ȮoJ@�`n@\0�@�	_B�h���?@ %�A�\�Q�;�\�\�AL����).���\��l�d:`\�\�\Z�e�\0 �9ė 27� \rn\�p���@�H�\�>��{0��S�:���2@\0�\0 �ė �2� 1n��\�@�H�\�2c8Df\\��� @$\�%@\0�\02G��D\�&5�\0�!�\r\"\Z���~\��a\�G�\0�v&\�~R0%\�7X����).��@\0�_B�\�\�@�(nL\�&0m\�L�\�2\��\�	�x\�w\�\�+��.]�ؑG�\�\"@$\�-�0�\"ԙp#��@U(B].N�@��\�5Q�0&1�/!@$f2b �,\� �\��I�?�\�ƌcw\�y��t\�I֫W�v\�?���\�o�<�\�\�>v衇\�,��Af\�\�\�?�ܱ�\�\��\��c�=6�#{�e�u\�\�\���\�H�0*� \�\�;,�@� j%�\�\���{�\�[lĈ���\�ې!C\��ҒK.�O MuZ�[����L��D��\'�A\0\�$�\r���\�;�>�\�;�\��m�\�\��\�?ڍ7\�\�N��2e�u\�Qv�\�G[߾}\��믷	&\�駟n]�vm\�\�?��S=z�\��\�M鿙�~�\�W\�g=z�h#@HDZf�e�\nHʹ��!%R0EI�� �\��S��5k�{NՂ�SN9źu\�f\�s�=�\�S6j\�([d�E�b&ϭ<�6e\�\�i]�/!@\�5��\�.n\��-#��@-)�Əo�\�_;\�~�O<\�\�o>�\�С�͜9\�<�@\�j��l뭷�θ�\�~�\�GM6K\�\�QL�\�g\��\�\�y�9/E�s\�p�3C�`\Z�%0u\�T\�w\�}ݳ\�/�Kw���z>\�p\�\rm���\�T�\��\�\�V�\�5\�\�Ec1 ��\0\�ԢY@ \��A�݃\��Z�P� ZZZ\������q\�6`��V��\�\�wߵ�����A#�\�ӧ۰a\�l�5\�Hl\n�8y\n~�\�\�g�m\�^{m\"R0\�9�\�6D��\�\��I\0\"�~�eԥ�g�\��\�s\�م^hs\�=w-M\�|\rϭmw\�&�f\�ra�	_B�\��gp�@\��A\�Ύ+�E JB���Z�0��_}�\�\��\\��3f�\�oW+���t믿�\�U���\�\�!�b\�~��]z\�6r\�H�\��l�\�s�\�:u\�dp�\�v\�m�}�\�/q/�JA�:\���ꫯڎ;\�h�&Mj��Tj��k�q6Jl��w\�u�\�\�.\�\�bi���\�;v�\�\�/���\�\�<`W]u���\�\n��\�=|\����HÇwc\�ܹ�}�\�G.��jn�\�o�9\�íқ8q�\�O�>�;QN>�d;\�\�\�|V(@� ���\�?�qL�\�7kfS��Y\�\�/)��\�cF�B̉�J	<��\�\Zvq<\�K| \0%�\r���\�� \�z�\�vx�|R^Aw�\n^|�E��\�Kl\�-�t��/��\�\�:\�,\�W�^\��-���\�g���T@\�f֊��w\�\�$nH)֟���\�\�[o�M7\�ԝ��/����K;<�j����\�\�\�s�\�$��\�W�r���[\�u�N;\�ds\�9�A�\�k/w�D�\�[~�\�m�-���^zɍW\�\��\�s�K+\�kqh���s\�=���b)�J��Y\�	�f�\�~��ξ�! ��x\�g\��\�\�_n�m�Yk3Z r\�u\�ռp�\�\�l?�\�:߸.\��/!@d{�3:@�f\� jFǅ#�\"RHW�^)���:�ˣ���\�\�>�¿P�(�W�m	$J�\�ܵ\��\�n����ڱ�\�k���;G;7$BHd(<���\�SOuB�Ơ\�\Z�V孹\�N�(&$\�\�g�y&D�I\�9�\'�\0�y3@�#p\��\�6t����@Eځ�E-ӦM��\�;\�V\\qE{\�7\�b��^\�-��\�\�~V��b\'�ܚ\�\�֚&e�\0�%�\�Or\�F�Dmܸ*{\Z%@(��\�0\�?��5A,�WCZ���F\n\�\�5\�\\\�\�.U��P�(%@�\�ѣM\�0\�E��Bn\�]wu��53�\�\�p\�\r��\�{\�*��\�vYh��Oc�\0Q\�T\� S��\�P!\0\�@@\�\�W\�yKD�\�Rfj\�\�\���khq�%<�f���\�I���&@|	\"\���A\0�\�Q;;�\��(�\�.\�*\�ׯ_+�\�N;\�\�2��u�9��W�%m�_b�%R%@x\�c뭷�}�\�\�:t\�\�\�~�UR�&�V*\'	W\\q����\�\�\�\�W�\�\�@�\"\�1@�I@\0&�ݳ��\�?좋.�y\�L9�\�\��Zw\�S\Zw\�fx�3�:_B��c�p) �e\� �\�]\�V\r�([Vʠ\�_ܥ=R@��\�?w5��L��Z�R�O���\�)��b\�.��\���t/�\nԗJ��袋�\"\�:�; |\n&ɖ\�C�q�8�ছnr霴\nOu%4��\�~\�?�pW�Zi��\�O��;w��Vrh\��\"G\r�Z�\\W�\0D%B�\�#p�\�m\�uH��=\�\�?�ɓ\'\�1\�cZ8�\�\�z�[��\�Zϼ\�\�\� ��\0�\�\�\�\� \0��p��g���3mb\�tԻg\�Q)\�Ѱa\�ܮ\�#S�Lq)�PWQ\�k��\��>��ӭk׮E��9s�	�w\�\��.]��;OB\�AdK.�d�h���w\�G\�\\\�\�\Z\�[\�\���:\�}��\�b��\�;1Du$���\�]p_cQ\��*.��ɦ\��|k�fR��Ν;�/`ݿ;�\��cǎ\�\��?��\�m\��$�kD�G���JW%�\�\�O�~��9\��c�9��\�=�\�\�^�u�\�\�~\��+=��r�\0�\nQo�\�&v��\�\�\"�,\�Ƴ\�b�9����D��~:�\�I5%�u @4�|��%S�}\�!PH���\�\��\��\"�\�?�\ZZ�q�\�w��}��-{-ϭ�~n\r5�8)w�/!@\�n\�3`@ n\�8q��j.��q\�I\'����\�\'L�\�D��^zɥ:�\�Cm�(	S+��K\���;a̘1��\�K\�6\�l\�V���\'�U~\�ȑnǅv(P��t<�裮��\�,(\r���e\�<\�lT�_	믿�m�\�f\�\�����K�\�\�:$R\�?�\�6iҤ\�\�\n\�Q\�V��޽{;aDb��Xz�\�\'��q\�w\�\�k�턖\�\�ΉJ�\�!>�\�N\�X4�\��޽0K�Yj��\�Np/ѲOb�Ư\ZA{e�^��S\�\�{\�uųX��F\���[�Y�Ν�O�\�\�~rB�\"\�9q4Ä@�\0\�!,�W_}\�v\�qG�o��\��k\�i�\�2�6yn\��sk\��\�y�\"@|	\"_3�\�B\0�	p���!\0@\0�$�\0�J�a4\�\"�\0Q>.�\0 \0�\Z_B��a\�p	 �\� �\�e\��@-)�´\�9�\0�M�L\��\0�C�� \ZϜ!\0\�\0�%��? P�\07�f��5\� %R0EIuz\0\0\0 \0IDAT���(B\�|�@� @\�\�\��@�	_B�h��@ ��A$\�1�\�p\rGN�(B͔��\0D\\di\�%�\0�\\\�` \0�� ��\0�չ͸ \0�:	p�� �g�\0Df\\�ځ @�\�u�7�L�wB r�#�A@\0�@��_@\0E	p�`b@`6fB�	 @4\�\�\�\"\�\��-#�@)��ц\�\r @\0�@\�_B�h\�d�#@ ]�A�\�_X��\�\�r8\�8qV� �g\��\0 \0@\0\� ��\0Q݌\�l@ 7�A\�\�\���H�	 @4\�\�\�L\��-#�\0 \0@\0I!@|	\")s; \0��\��0�`N\� @4\r=�D\0���P\�E�v!�\\���lC��\\��\02G��D\�&5�\0�!�\r\"\Z���~\�f̴�-\�mP\�\�#H%�T�-F#@�\�M	�H	P�:R�4@\0!_B�1M8\�#�J7�\�no\�}�}�\�Gy\�Ø!\04��\�-ӬK\�N֧G���IG� PO\n��S�ڰa\�l�\�\���\�(!�q$À\0 �\"�\�K\�F��N����cǦhTՙڡC\�`f�f͚UݕM<\�5>]C \'J�\�|�\�T���\�\��/<\�H�\�3\'�c��\0 \0�Pj)B-\�a�\��6a\��BQ\�$$�\0D���5�\0�@�86; �0\�# P�\�D��&Zh!v@\���K\�E�L\��\�B\0\�	T#@|��6dȐV\�A�l�\�v\�m��\�3!\0��@�h�0\0�@\� @ @\�n\�3`@ �X}�mv<�^ݡ�m����\�\"�ge�\0E��\�\�䏏L\��QZ-��\�\�\�F\�g�\�Fx\�x���\�L\�б�%�\0�[\�3p@\0M#�\0�\0Ѵ\�G\��@�	�\��]a��AQc;w\�l\�}����\��\�\�o���\��\�\�a��rX��\0[\�\�\�6Ə?\�\�d>7~>�\��W6\�٩\�\�\�x�Y��u\�\�\���\�6_�e�\�\�\�\�h��\�,��\�\��}�\��W\\�{?\�I��R�\���\�{\��\�Ľ�g\Z\�\�J��>���\�j�����\�7_?�g\�\�=+\�\'o~�3q��~��\�Ѷް\�ϗԀHh|\�(���,d�\0; 2\�L�Rv@ԅ��# 0�\�I6��sخk�Ak4��(\�Q\�F; �1\�v@d˟��@\Z\�fD\Z\�)6B\0M P�\�-��\�>xq�\n\\Ԁh�c\�\� \Z�� @0%\�\"&\�ݷ\�b4j@\�\�څ@c	\\6~�\r�jc;�7@\0\�5�\\< P�@�Da1\�Y�f��&�\0�i��bp�pS*����\�ԩSm�\���5!xH�\�1\Z�\0 \04�\0D\�&A\0\�\"P\��\�9\�\����)�:]#\�Z�\'�\0�i6�f{ ��\�\"@��aÆ\�\�ѣ���A\0�\0 \0\�M�R|�\Zu#��WZ�\0�G�\�ff@�`&4�\0D�=�\���I��]\n��\"p�\�m\�uH��/�3Z@\0\�%@|�͝��$�\07�ĺ\�\ZL`ڌ�6�e�\r\�ݳ�=\�f@�`&\�E Lj_\".hh,�P7�7�A\0���%��\0�\��Ā\0 �O�L�.�;Y�ݓaVd�\0Df\\\�@ �\0DhT�@\0 ��\0\�T�@ k�Adͣ��\0 Ж\0)��\�����C\0h6\�K͞��$�\07��:�\ZN�L\rGN��@�\�S��A&\�\r 1���\� \0T$@|	�\�$\�@ ��A\�\�=�P3+�M�L\��@v�G�ȮoJ@�`n@\0�@�	_B�h���?@ %�A�\�Q�;�\�\�A�f�\�E�Lq��]$�\0Dr}�e�\0�J��DV\�6\�\0\�$�\r�N�\\��qej�\0�Z\�%\�p�P\'\�E�\�	 @D��!\0@�\�K|I \0%�\r���\� �	\�&�\0\�ld��\����A��\�ƿhC� \0@�a�/!@4l�\� �.\� \�\�/���\0D|li9�p�8�z�`��W@\0�\0 \0TG��Du3��!\0�\�\��W3\�\n �\"\�&�\0\�ld��Pg׷��\0 \0$�\0�%��\�E\�\0F�D\��9M#�\0\�4�t��B\\ \�\"K�H.�\�\�O��VM��X@\0�#@|	\"s��A\0\�\�\rGZI?�i3f\�Ė\�6�w\�����\0D*ݖ\n�I��\n7a$\"%@\�Hq\� \0� @|	\"\�4\�@ ��A\�\�\�H\"��[�Y�Ν�O�\�I4�RL�\"\�)v�C�F5�\�2@\0��\0�%��\'B\0\�&�\r\"\��et�\0 \0\�\0�G\0\">g\��\0�M��D�\� �C\0	%�\r\"����� SÑ\�! \� �`jh��@� @$\��@ \'�/!@\�d�3L@�Z\� �%\��Y%@\�z6=\�\"Sz|�6K)B�6�a/\�\'�\0Q?CZ�\0 \0�\�(��\�\��\\4\��\�\��\�\Z��hcǎ��\��ݡC\�hg͚\��|\�	&\�GX���3�6ܪ\�P^}h�uze|�oi�!�GC\0\"\Z��R;�P\�Ύ+\��\0�\�?\�o=\���d{,��\�_�\� ���[l\�����\02B\0\"#�d�\0RD\��\�kc\�=/�\���\�/�i��o�\���:S �\�\�\��@NH��8ir\�hg\�l�v�f;�X�Ϫ9�y&D�����#@$\�Y�b\�\�6�v���˃�\�]��\"�\�gL�%�\0�[\�3p@\0�!p\��ٱ��VM�Mq�\07aڇ\02A �7�L8�A\�M\0�n�4P\'�:r9 \0�\�3}�>��\0�G ��%�\�\�C,�\0H �7����@\0�	\�\�\r& \0@\0�\0 �y�/!@de�2@ Vy�A\�\n�\�SC\0\"5�ʬ��um\��\�\�{\���6M�]@\0�\0 �Ͼ��L\�%\�Π*�\"7�f��@= \�ǵi&�\0�f\�e\�v�l�1\r�\�<\�\n�~\�i0!\0�\Z	���Fp\\@\0��\0D�\�������%0m\�L�\�2\��\�	\Z4�\0DS�\�S�\\��A\�\0E�s\�p�@\0� �\0�7` �tI��A\0Y%�t\�4\�ҹ��\�\�=�Cd\\	!@\n��83 #�\�\�4 \0�\"@\n�P��ү�k�a��ް\�E�7j�uze��;��\�b �	�p#��\0 \0@\0\�1�;��C\0H�<Ɨ\���ɇ�@�	\�Q�N�G��QH�\�(\��@\0�@\� \�&L��\0 P�\0D%B	�;; \�̀\0 \0�\��u\�]����)�.ʌ��`ʌ+J@�`r@\0�@�	 @4\�!�G�	�\� \0@\0u@�� �\�M�\"\�u#���(B�A \� R\�<L�\0 �)q$DJ��\�R0eș�*U\�\�\� @\�\0�&�@�`b@ � �\�cF@ \� �\�K�\0��\0 \0@\0�@�	t<\���\�3�o(B\0�\0 \0@��f͚UWo��_���^\�h^j���\�\�\�/��\�+56ch�\�Q�ΞQ-\�Q5���\0; ��I[�\0 \0@\0�@3	�-�E|\"\���b4/5M#@�\�U�64m7�L;��5�\0DCq\�YL@\0�\0 \0@ +Җ\�;��6D���Z}�\�\'��\�;ۀ\�\�c�-k\�\�\'�l\����s\�96\�\\s�s_}�U;\�\�.��?����\\p�Gi&��\�\�\�RK-e|�\�\�nQQP��z	 @\�K�\�\�J\0\"��ˎ\�\��e\�G�\�\�{\���6M��\�\�A@\��C�ZG\\\n@\0\��j\�\�\�\� @\�8g�uPXBB��\n��\�\�+1��%J�QҤ�Z	 @\�J�\�\�N`ڌ�6�e�\r\�\�3\�C���@�H�\�Rh6E�S\�4L�@�(B]%0N�\0 \0�\��6��\0\�\�)t�v,w\�q΂aÆ�\�\\���\�;ڤI�\�\�o��v\�\�^{m\�H\�|�\�\�\�~\�I\'�dp��3\�6\�d\��\�\���ig\���\�M\�O�>\���\�g;찃]z饮�n����\�c7\�x�9�@�vu\�\�;̉ �F�r\�^y\�v\�E�=���\�\�\�\�\�\�!;���q\�)\�\"�O\\�+J\0��@�9�n�f]:w�>=�7\�\0z\�\r�ܸ��\�\0D��\�\�!\0$�\0)�\�Jf��׿�V\Z`\�\r^�\�q�FX�W\�\�رc+5\�߽\0� ��\�k�=��-�\�BN8��\�m�\��.x/\�A��W^yŝ��~�L_}����\�{���>�h;�\�SMbB�L\Z�D\0���H��M\�>��\�\�~�\"C\�־}�:�z�\�\�*4��\�z�-�u\��\��\�\�\�(��I�^}�\�mvkH�Xi��J\�\�\�I�\0\�4�� B�\�4@\0�@J	��)��\�lTA\0�\nX�\n@\0�H[|�) 4k%B�\�~�\��ä`\�5�_~��x≮��Ą\r7\�еYJ�����$r\n��\0<7�k!��\�}(%@\�s/R\�Z_���=\�\�U @\��{G�UH�B]\��8%	���\�@\0�@V @dœ��@z	 @�\�wi\��]>M�G\\�\"�\0!A`�]vi\�)�c��\0���çVRj&�KA���࿃�\�\�\��m� �\n\�z\�.�~���L�T8\r R�\�\�L@ �(B�I��jP�`J��0�@�	 @$\�=@  R\�\�	A�^@P\�\�bP݇!C���H�v@���TJj7�A���$,wE��=��C)b\�}�m�6)\�\�\�����;5\n��4\��\�{o�1c��I�@\0�%�\0\�X\��֞\0E���\"@\n�F��4�\0D�\�\�3 \0\�&�\0����6BA�3\�<\�\�YXj��\�n#F��\�Ç��Q�Im�\��Ͱ\�k t^��\� \�\�N�\�Q(@\�Tj�O���.�hk\n�B!%hOa\n��\�߶\�n;{�\�\']\�4�\0)��E�~�M\0�\��\�@�P��Q�\�\�#�\0\�<��@\0�f͚��y�6B`UW\�\�s��\�|0~̘1n7�R)p_��\�\�Q�7�׎�s\�=\�.�\�w�D��vDH�4iR��\�\�P���O�F�2�Vz%�ji	v\�W\�E]\�>\�8�@�B\�A�}��B{��p\�ԩ��\�k�\"\�\�%\��fH�B\�LV��-\��g\ZG�\0�F��\�f�t�\r�!P\r=\��j5�p. \0@ Ri�/Q�:%E�#��9jl�\�7w\��\���Q3ԤH\�\r\"��+} \�糬Y�\0�5�&w<�`J�o��\0 \0d�@\�\�KY�\�\�Gao���\�|�͙#K��\� \�Ek�L\0\"\�\�ɇm��3��\0 \0@\0�@�-\�7D&��W]u��v\�i�\�\�<�̓\�12��@�H�ϰ8\Z\�p��\�	 @\�Ύ+!\0@�-R01# \0@\0\�@�@��nƤ\�\�g�y\���\�g�<򈭳\�:)��B\0\"/�f���͘i[�۠\�=���@�h\nv:�\0 �I�Τ[ \0\�H\0\")�\����{W���\����\�;���	�	������￿l�묻��7.\�^i\n�\0Jx�e�u\�\�\���\�$@\0�@] \�\�\�\��\0 R0E\0�M��׿�V\Z`\�@�\�n�\�\Z�$3},�\�v\�gdf<$}$@\�\\j5\�`��\Z?��3\�\�D�H�k��\0 \0@ \� r>> \0�H[�\rv@�@��5kV�6&@\0a	 @�%\�yy!@\n��x�qB\0�\0�O\0\"�>f��\0�N\0\"\��ɾ4\�@�Hɤ\�L�D\0��\0��(B͌h6R05\��@ ; �\�KF@ � R\�9��8\n3!�B)t\Z&\�J\0\"V�4�\0E�C@\�@\0E\0\"&N�\0 \0�	 @\�7ʦ ��I[�@�\0�m	 @0#�M\0�\��@\0\�!�\0�_2@\0i%�\0�\�!@�\�Q�	�@�H�\�09V�\�� B@\�@\0E@A��V\ru.\'A\0�\0\� �\0\�\�D��*MB\0�\0m	 @0#�M\0�\��@\0�\0 \0@ *Q�����\�<rL\0\"\�\�g\�E	 @01�M\0�\��@\0�\0 \0@ *Ͼ��k�\�G\�d�\�t\�\��f͚UWj���ک������b�*�q: �\0DhT��9qt���\0�`\�`\Z \0�����ɶ\�:�`J�\�0�\0�H\0b\���Ǎ\Za�^ocǎm�{̢pPS@\�\�!��3f̰;\�\�\��n;\��l�l7ӈ��;\Z1\�F����Ǯ��j\�m�\�l��緋.�\�&L�`Ǟv���\�LԻg3��\�+{�\�\���N8�z�\�\�3\���;�2����\�^{فh�o�y�+��2z�h\�֭�i��o\Zy @4�6}A\0\�6�Pgۿ��\0�\'E|�\����\�(�y4\r!�\0�`���W\\q�q\�ֿ�6�����\�s\�\��\�_o�,��y\�M�\�\�g�m\����\�Jv\�\� \nϹ�\�{m�]vig\�ꫯn;찃\�\�ֽ{�\�\�\�\�(:�\�Ol\�w�1cƔmN�c�=6t�}��]~�\�v\�M79߯��ڶ�\�\�6\�lc�\�z�\�6\�\\s�n��[ZZ\��㏷��\�\�\�\\sM`�\�\���w�g�y\�5�\�\�a�fs\�=�\�x\���\�ۺ\�\�\�<	[l��p��\�2\�\�cf\�k\�h���\"j0*B\�q\�g����\����ֱcǈ,l\�̃>\�\�\���u\�\�\�z.4o�\�7\�h�\�l�a@\0\�&�l��QA\0HR0�\�[�`J��0)$�\0�\�\n\�7έ(\�\�l��m\�\�|�\�6r\�H{\�젃�*�5f	Z	_J�P�\�h�V���k�s�K�.�\�C�\�t5j�V�>\�\�ZK�d��\� $.z衶\�RK�K�\�u\�]\����\�v\�=�\�\�ɓC	GJy�\�#�\���\�o�\rr��\�_ܾ�\�;\'Rs\�1N\0��\�]p�\�\�o��n���@儌O?�\��\�C��W^��\�Ə\�D	b%�\�\�\���\�뮻\�	X\�>��}�\��\�g�9�\�>\�ThG�k�\�SO�\\��\�p��y\��\n\�<s\�L7Ƿ\�j+\�oe\\G�u\�K��Y��u\�\\\�}\�8 \0@\0\�@���\�B\0�@(B\�\�D��*MB\0�@�G�ꫯڎ;\�\�˅�\�Q�\���=z�N���\'�|�����v\�9縀��_|�\�\�v\�5׸`}\�G���AA�>��	C�n��3�P��S��\�\�\�:u\�Tv�S�L��v\�\��O�F\�Νۜ���1\�\�=�ܢ;P\�2\�|\��O<��\0!]v\�e��矻�W,�δ3mb\��v)�dG��1�(P��?�##�N\��\0�\�?\�g�a,�}\r\�F�\�\�\'\�y\�l뭷l��\�Nh\�oU����jS\�ǡE�\�cl�iS \�O��\02N\0\"\�fx�\0R@\0\"N��)qfB � \�\�n(\�\�bA\�B\�����\��Da�N\���J���Nj�X:�bDX{��\\x\�Q?\�.�l�Ke��\�l�\�j �R]�\ZD��P1�N�\�\"���\�/��\\\��ߔ���=a9��\0�]*J�%_k�5�\�\��<\�y�\�ԜR��\�[Υ	�\�@���*mB\0�� @0 \0@�\� �큐�#@�\�i�@\�\�$@�P�_��Wx�\�V+:V�\��\�K]z\'��3��SNqy\����Ju\�-�\���G��\���g�La\�)&@(x��\�	�?��Ǝ\�\�*��>x\�g�\n+�`o���[���J=�\�h�e��EѧO�֔@�Iy냟��_|ѭ\�V�\0�Z�@��\�[;[ԧ�\�\�(�N�� ��H����׿��\�+u�Rjig�v:�ւ�篲\�*.U\�\���sT\�5qѡ�J�Wu5d�x�]�����U\�\nkg�?�\rV4�TI�C)�Tx\��v�\�\�\����^��w\�\�q9묳�?5��\�~{;�\�S[y\��b��	*J;%�c\�ĉ�\r�_z\�%g�vk(Я\���v\�hgƐ!C\\�{\�%�l����Z>ݙ��j �Ml5�_s�r6I|Pj)}g�Q,u��&�\�\�\'��\�O?\��\\\�\�\�k��\�|��%JA\�}�\�_�\�	�%����\�?��\�\'���k׮v�ᇻς>\�ߴ{G�\�\�>ֻw\�v\�Id\�\�%}ux��\�\��M6٤\�\�Rn\�u\�]u�	+5� *�,p \0\�H\0�Fp\\@\0�@��e�\r!@\�˗\�!�gY .�\�{��\�]�Pp\�oW�W�\�y\�\��p� �Co��p\�	.\�\�k@�9GsFAr��\�A\n�r7\�\0\0 \0IDAT*��\�\�W�dZ�E�%��\�W�rs���s\�\����Zk�eo���~*@�ୂ\�a\�P��}M����Jg��\�g�q�J�Q=\�\�`�����\0\�wO(��%\�\�x\�X\�X�j\�1�5L�j/\�{\�]qg\�Tx�\�m\�С.�ן��\'\'�(p�\0�\�#����������Xžק�v�/�����[\'p(\�-�Ꮗ\��\�6]\����\��ƉC�#JQ$QɳU�7����_x\�\��\�_w\�W��\\\�\0�D �co���L�R�.�\�\\�o4n�Ib�jVT�CsM�d�߽ ;7\�p\�VB\�V0_����.�\�&1�R\�4\�S�[4\�3\�<\�\�\nx�\�\�w\�\'*0\�k`x\�V�ݘc�9{����\�W\�񑐠\�\�H\�\�r\�-\��w0\��\�޵+��J�X��d�\�Ċ�\�ϵ\'�\\r��M\�#\�wD\�Tcd�嗏���\09R\Z�\0 \0�� @0 \0@�\� �큐�#@�\�i�@\�\�$@���?�\�qU� �:]AF�}\�_�@\�йa\�Q�a��\�;\\Ae\�֡ ��\�+p�C�K���AB��\�תxj�v<�\���\��\�4�+\�*;J�RpXAr١\�D\�\�פP�U���C��Z�3\�m�\�\\�\n\���\�\��\�_n��\�IT��Ja��׎�buB\�Lw	�]\�v�猄�?���\��\�z?Nw�\�\�	L:��BbJ�\0�]w$�H�P�\\}���\���\�K@<xp�Y\Z�vp�s\�V�v��dG1�@~{\�\�Yg�\�n_�B��\�\�\�\�\n#@\�\�\�s�GG)��\��D?kc\�Eu\�oq-\��b\�(v�v��.�\�\�X$I�Sj.?6\�W^yō[~Zc�5\��UuDU�8�\0� ��\�\��Vq�B\0�\0�%�\0-\�\�ZC��\r-\rC ��&@ȡJ�\�Z��U\�J�$q�cǎ.E����\�A�\"\�9A�Ҋ�b�}��@+Ճ�p	JW�\"�J\�S\�\�0\�B-\�ƪ\�\�^$(���\n�\0w�f����\�_\��e�R(��\�z.u\�\�~��P\�9�%\�hwÝw\�\�fE)���\0Q�\�yP��|\�\�\�����\�A��Q8\�bA� �\n�\�H�\����c\�c��hG%�o߾N̐ �\�\nŎ0Ą	\�\�\��E��c�\�\�\�x\�#@H\0��!�L\"�\�/�\��%Va؄�\�%NB���\�B\0�\0 \0@\0I&�\0�d\�lC�H��0)$�5By\�ʼ[�n.˳\�>\�V\�+`�C�x�K	aΉJ�P]\n��[�zaB�{\�^\�\�j��U\�~�Ep�\�+@h�D���\�w�\�����\�I\�\�-R\�\�*t�R\�]���HAa\�C�B@��\�1\�<�\�\�\�	\n�Mx\�:��\�՗�[�Ў�`}h���\�J)�*\�V�\�XK\�d/6Wj $DU\�\��P��\�	�J�\�\�;\�\�h��\nv@��F�\��\0 \0@\0�@\�<�\�K.\�4�\�X�\���\�Pf\�P���z���Z�j�q> �@�_?@�v�w\�~pwC�.]\\\�\0�nV� \�aСs�\�^�n�t�j訴\�^\�\��@�j��b�-\�\�\�JlC}]�0v�}\��馛\�N?��i���rU���\��\�\��F�\�T���R\�f��\n�\nΟR5 |�i���)�t�\������ָ�C��DW�_\�Ȑ]�K�Z	Z�&�\�\�\n\�b5 \n�w)���bLkJ�L�T���:�\Z\"ž{���\n|k�����_�\�]�z	�求\�@*\�\�\�W-/�`R�(�E;Q4ϴA|e�D�w\�y\�ՑP��\���\�x�W�0ͥJ)�ԞV\n\�\�[��\� �.���\�n��\�qx?\�M\r��w΃\0 \0�� S\�<�=�\0 �tÆ�ѸQ#�\�+\�\�j\�fQ8���\�7�H NB���RHA\�\�7\�\�	�\��]`�\�Jo/��~㔚F�\�\�V[�\�i*֫@\�\�k�\�V�+�\�g�m\'Nt+�%<�\"�\�OAX]�๊T�8�ȑ#]�&\�@(w\�K,\��Pp^\�-\�8osP \�\�\�U��m�\�\�\�c\�\�U<zҤI.H����P\�1U@X�S�G���ث-jV@Zy�%4H0\�!\�\�.��c�`�\�h�\�?���wb{�\�\�\�W׉�R)�0�\�T鐐�kN?�tԖ�!��}�\�R]\�>ye�jch\�L|�\�P\0\\�jG�R�h<�\�w\�z�p�U\�K\�	�\�ӦMk�k@�\�\�J��b\�\n���\�\�#qDAq���/��\�k�\�i\�]`���k[���8\�D\"�|��\�7���Ʈ\�\Z�Gi�\�\�\�K/]t��\�V\�w�Ht\�c�=\�u��\�\"����:LA~�[��Wp\�{>b�](�s��&\�K��u�Ȳ��B\���T,z\�UW�������\�;1D\�8��\�_�y���\�V\��A\�\�UK\�\����ｘ��\�N`\����\�#\�\�\"����\���g�~������\�㲿�\�e�l\���\�F��\����+\�~�4�!X�#\��)���I[�\0 $@j\� \0@�:Qķ\�Q�Ύ\�AUu\�\��@\�\� �\Z]�������\�/~u��{�>}J���\�hž�ۥ\�U\�Y)k�\�A�\�%(\�-\�b���r�s�����\�\nn+\�4B\n2+���\�91\�\r\n\�:\�oZ/Q@��\�߿�2�3b\��;A���תp4WJ�J�\��#E�4f�ǌ\�\�,�F�\�B�7\�U�8 !A)��Aň\�Av(h,QċE�~,����\�r�+���\�\r7ܰU�Ѐ\��.\�M0z�h\�V\�\\|����d�\�	$iվvPh�\�աtZ\n�KDQ_|J,��W�j	WVXa�v\��1\Z���*6�ï�W�:$��?��\�O�y�\�SO���\�\�Ӯ�I����:�\�u\�՞D(m�8\�z\�.�.&�\�i�~\�١9�tM\�\�:$�hg�\�	\n�S�֜��*�.�N\"�\�)톐/�\��4�W�\�\�Xs\�5�8\'\��4��kH>���\�d0M�?G�{�\r9�WM\r� J�\�\�\�\�<�@7��>�@��vШ�?���\�ܐ�\"n���ŧՎRd�\�r\�-\���\�@���*mB\0�� @0 \0@�\�H�\�l�\�L!Aq\Z P5����\r\�4����Zu�\��\nw\�4��Tv!qC)��\���T\�;\��(U���l뭷��#1G\"KDTi�\0 ��\0 ��N�B؀\0�@\05@��	���vYhE�R\�\�`а�͘i[�۠\�=S<\�\�L׮s\�ΐb�M�\� R\r\�)��A�B�[Ju!4_\�: \�\"K��\0 �\�\0 \04�\0D�=����8\r��\0D\�ȸ �O�\�\nb+\�Qa`}\�{\�E\�&\�\�;m���\�7���裏�\�\�\�\�\�>�\�Չ\�\�\0�\�*u^}�D{�\�9�F�v\�HXPZ-\�\���\�Ai�T\�>\�q!@D\�_Z�\0 \0��@�`6@\0�@�	 @4\�!�G�	�\� \0��	 @T��2B@u\nT$Y5B��� \�;XE\�U�\�\�f(����ƞ��\��&\�\�P�x�j�t\�\�\�C�;UDc�Oo�\0�D\0\"O\�f��\0�I\0\"�~igDJ��H!�:\r�c%�\0+^\Z/B\0�i@\0q@���,\�B\0�@XaI5�<�&;�\�!�av.C��\0DMظ�u�\�R@\0hC\��k�i�\�_{\�6Xa�6�)% \0@�Q \ZE�\�~ \�\�\��@IL�%�\0��h4�F�?@\0\�%���.�B\�~\��͚5+�\0 \0$�\0D\�\\R\� ��8\n3!�B)t\Z&\�J\0\"V��h|\�ԩ�\�b��+DhT�@\0H��\�̒g�X�+��\0\ZJ\�\�w?t��]r\��[kg��\�+֫�fj\'=�?D�S�\� \0�J *\�\�y#�\0�7�G;\�\�\�h뭷�]w\�u���h}@k�\0�L\0\"\�\�g\��\0 �aËr7j�uze��;6\n\�5���j\�!\0�� @Ԅ��2L`ڌ�6�e�\r\�\�3ãdhq�\01`��\�\�7\�`��BD\\ޠ]@\0�#�\0�?�3b@\0I#���?�pY���\�\�8v)��o�\"\�Y��b4��!\0�\" ��\0�# b\�u\�m�e���\0�4��\�\'�\��\�_o---v\�I\'\�\\s\�\�0~��G{�\�\'\�\�/�}�\�\���\�[_\�nX�\�\������N�:\�\�G\��ԯ^���\�\�j��\�\�wߵ��\�\�<�@\�|�\�\�\�\�,;\ri��G��nݺ��z䈖\0D�<i\r��~\����ٞ{\�\�\�+\'�x��\��\�o]�tijƌv\�w\�\�w\�m\�w�-�\��M�\�(;^�uw�S��8�e��N�&��L>�E|�\�i��(�7΄\0� �\0Eڀ\0 0�@)\��q\�\�\�\�/ފ\"�G/\�Z�u\�W\�G\�.8����\�\�>�l�\�k\��\�?�!C�ر\�kK.�d\���\�o�\�p\�E\��\�oo\�sN�/\�\'O�?����\�O\�c�=\�f�N̓�p\�W_}e|��\Z5�͙s\�=�\�\�С6h\� �s\�9#5\�\�O?���\�\�?�p竸�\��ޮ��J{\��\�\���]�V \n\�\�uY\�\�\�q\�g����\����ֱcǸ]��� �w��~hcƌq�\'�\�\�իW�N�ݿ��\�\�\�Ns�\�\���\�[��\�~�m��\��nw\�u���꫶�\�k� �N;\�Դ�|��y\�7�v�\�\�\�t��$@\�\���Ϸ�VZ\�=�\�{\�n܅\�ꫯn;찃6�w\�^�i\�/�#.!D\��s\�ĉ6b\�\�}�#� \�-��DL\����\�,b$�\0#\\�N%R0�\�m�1��\0\�\r\r\n\�w��\�Z�8n\�8�0aB�\��.�`\�-��\�_\�\�z\�-���s\�\�.��\�\"�\�5��O>\�\���\��\�ώ;\�h^xaC\�\�^�]w\�\��\�w_\�m�\�L�\�%�\\\�yڝp衇:�Q^�\�ѣG�\�7\�|c7\�p�Wyje\�K/�\��j\�R\�ά�9s�y\�n���E9�#�\0K��]j%\�jٍ7\�\�N�P`}����_�\��@�\�v>)���Cb�v/\��$^���\�_�j\'�p�m�\�f����\�>�\�;�\�s\�\'�p��}��n�\'J@9\�S\��]tѪLP@�ꫯv�y��{�{\�\�_\�vEh\�\�C=\�>[f�e\"y�(f`�U\r�\�\�\�d�崛N�:_~�e\��j\�Q\�D;\� �\0�\0\�LD��/�C �`�\��u���\0\�\�\n\�T	�}��\�7`+\�ǡEG�\�y\�\�|Ӧ\�=�ܓ�fۄR��)S���Z�\�\�{\������� j=G�v\�yg\'B\��u|�\�gn��{łz�0յq	�\'Z\�կ^����\�Z��\�\�Vez1;�\�K�$\�\r>\�}�$qDC\0\"\Z����?\��^�VM�>\�\�zZc�5Z/\�o��\n�K\�����裏�u\�Q�;�\��l\����\��\���NB�\�g��\�Y� v�\�\��w�\��U�X,�_x\�W\�^�%Ћ��GV\�Y�\� �\�\r	m�]A�\�_��\'8!0G\�\�t��\0�\0\�E��/�C \��w��G��\0 Ж@\�N�l���G�H�Ĩfw�+Ն��z��\nb��+�E)�\� �r_+U�\�6;V$H��\�n<\�\r^\�V�\�/�E�\Zk�\�\�\�J�j|ǹqP5|/&@(x���Tb>��[o�u<\�4�U�,Æ\rsA��\�\�$�(0�z/\�qW,\�SO=e\�l��o�\�$�5a��MB�vA\�g�uABmi~���v�e\���\0\�w:(��\�.LKv���\�u\�]g\\p�KGȑ?�\�z�X�\�8b!��X�\�h�	�\"\�\�K�\�\�H�\�0�\ZB)$���?�\�J�Q\��9�U�R/\��\�3O\��\0�\�DZ\r��\�\�~�;��\��\�Bi\Z����t9�:\� \�n�\�ZS�9�\��\��[nq)1T�z\�m�u��j��\�\����\�[ou�V\�!٦\\\��\"\���]�F+9���\�jMOUlE��k\\\�_�\�}An\�\�\�X��=\�3\��J\�����AA#]��NG���i���\�_���J!\�?ӎ�P��PZ.�8��\�m�\�s�$4>\�:�P�[l�E1�T\�\�rv��S�yk�h5�\�ה\nP\��u\�\�񸾔\0\�{�\������\r+�~Fi\��\���T���\�\�\�䥗^j#G�t�����\�W?��\�[�t�~��\�,A|ҤI�\�&��I���4jC\�t9�\�S�h\�}\�\�\�#Ԇ>����R�\�v[+Xn)\�4&\�l\�{�vL�\�5�\�G�:0�}W:\"	<�=.e��},\�\�;\�\�j�h\�\��\�\�\�%JR�/����o\��\�\��3Hiu�\�gJ\�`?J\'\�\�/\�O\�\�TsIs\���g�/t^�E\n\�>�\�/�\�\\1g\�e��\�s�UW]e+����=tO���\�9\�[`�B\�\�kQ�\�ӧuG�_�L���\�\�\��\�ow�c���&[ԧj�\�(�N���E�\�_���|)i5\�  b���\�q\�B\0\"�4�b)v^L+@P\"\�*bB5�D\0�\�\���F�PV\�\rtP�h�T�A���\�\n�+%��BZ5�suT:G\�\�cT\�L\�1VYe\'j(���Ϡ�ժo� �Vf*=��:�p��\\\n�\"\�k���\�\�>�馛��J\n��f�\�\�\�=\n|)���_�\�~P�\n,) ��\n��\�\��\��\���\��ħ\��56\�`�\�\�\��\�Ǯ��A\n��}�M��R?� �\n�Kșc�9\�g\n0)�\���f\n *Ȣk����\��hѸԯ\nk�\��\�wc+,�]\�ά�\n~�ԕp�<�\�Q?��k��\0\�ȺVb�~��/u� ��B\�~Kx�h�@�~[�{�\�+\�7�o\�Zk�\�W\��\�#\�[mH�]x\�\�o�~���\n�\�7W�\���\�\nv\�׎	\n\�\�b��*٦�K\n��K)\�\�U\�b�\�\�Vɖr�J(\�o����o\�#�.QAtݓt�ѸU,\\��:�ZJ\�n�WI	b�k� �+A�\�n��f\'J��\�\�-QZ�d\��+N\���5 Ծ��:W�y\�\�N݇t�/\�,Q[�~�2�կ~\�\�]�o٨>�o��\�7\�t�K����0v\�B�8�RL\�nd��L�Ld�\��\�+�\�l�\�\��\�Q\��\�M�q@�@��u�!@Ċ�\�!�X�\�h�	 @�\�y	0��\0���N�\�~2!�\0����\�\n\�\�[�\�#\n�P+ �լ\n\�,��\�.�%�\�7����V\�khR\�IQ�\�Qm�\�1����������\�N�S�`7\�h����\�՜>�����zG��X��\�{\�G\\�K�H$h�\rjK�	\n�\�:ujű\�z\�p��:$.(������U\�˧ӦMsm(\�\�SJ���2�\�\�\�6�\�Jf�%�i(\ny�ᇡ\�\�2�\�<{\�W\\`P�O0�~r~\�g	D<>�$@�W��i��~oV\\q\�րp�\�E\�~��\�\n��\�\�\�|Z8���\��yD}:#\�K$RH�]h��\\�(�\��\�\�=D� �\��\�XTK	�lS�=�\0�\�\nzK8�dK�~�ߋ	~��g\'[\�=S�$fh7�Ėb;%4\���4Q�u\nEO�u|*>�\�=P(@\�q\�.��v\�\�2d�K�\�kah�m���n���ߗ�Ӄ\��$�\�\��$�kܕ\�(6�e\�g�\�|!;�̡��ص�@vv(�\\\�;!�L\�7���~�.�  b���\�q\�B\0\"�4�b)v^L/%@HxP.\\�p)< ฟL#@\�\�_\�0\�S��\�(��A�6�ү\��K,\�v \�IP\�A+T���J\�(�T8F~\�\�\�F\�(u(��@��\�Z]\Z\\�Y)���F\�R\n\���\��\�\�E]l\�n%[�}�Y;\�c\\;��}�Q.S�w;�\�+\��0߹(�cyj\"o� |\�JW�\�\�\n�ד~F�`�\�	�-+6:_�A+���-�ۥ\�2\�+�\�\\\r�rD%\�\�\�4P���ҡw\�+	��-W�G�$0Kԗ8.T|�߅�dS�\�\�\�~�Xv\�i�6bE\�\Z�~-6߼=\�/�\Z�\�j\���\�>(��\�$@H�\�3�v���al�\�\�Q�)�o6�\�E\0\"��\�\�E��/�C �`�\�@�H��`��`\n�r7\"��ɄJ�P�rT�\���\�Q,\�\�w&(U��\��k دڡ���Z}Y\���-�\�P!muV_}�vC��\nd\�V[m\�\���R��\�U�\0Qi��bk �\�T�?J��\��-qF\�=�G1\�a\�B�H*�B>\����쀈\�\"\Z�\�[\�\��^�x\�?������^$D�:�L�\�V\�+E��A�\�\�*�j/ܡ��j *\�\�w�i�FpG[p�գ\�[յ������J�V\n|\�~��F\�!Q[Cto+v�څ������R�\�q���݅�\���	\�	(\�@\"Dp\�F�a���~GG�A9Q\��ќcD<�IIo\"\�9�\0+^\Z�@, b�J�)&0m\�L�\�2\��\�\�Q`z�H�P\�r��\�+�\�\�6�fy�}�\�\�FAE�B�\�^�oPz��\�\0\0 \0IDAT���֣�\0�T\�ϭ���V�$�R\��\��~hR1Hn*��@K�Lݺus��\�\�ץ\�P\�M�#R\�p��Ю	��\� �Sn�Z� �đ��;WK%֪\�z\rʙ\�\�\��Ze������}��\�\�\�\����\��u��JՀP���\�5���I\�U��D��ůC����o����+���J��|�!-fP~�ѓuP���\�\�	VP]����\�v\�m\�\�u���B�R�h��߉��}L}ڣb)�¤`*e�\�\nz�v�v7(5P�\�nB�^kG���Ty\�\��y[*1\�\�\�B#د\��:\�s\�q\�ݝ�kJՀ\�_|\�*��O~	�~\�\�%\"�ƅ�b��\��Ql�\�>��5�i�����vL*ݕ�!���j_)o�\�V\�<(V�y��\�J?�\�\�4�w\�}��\�g\�BAݏ�\Z�|\�u\rD�3\Z\"V�4�X @Ă�F!\0�Ъ�b��J!A�H\�d�<y�\�k��\�oޚC�\�t+╺A\�$��V��J��]	\n\�+@�\�*Z\�\�ߔ�[+\�U@Ry�0R0\\�\�j���j(�t\nD\�|�Zs��\�U_Am\�f�Qc;�\�\�\n\�\�`�\�2I���O/��^A�V+_DR\r���w\�y]\�\�ԡ\�	Z�\�k���\n�( %���-Xԧt�/�]n�\n\�\�.�hU�*ک�R\n\���\��vu�=z��^\�Ѯ\�\�b�T\�k�]]t�c돞={��\�Od\�N\�t�O3��T\�\��\����0\"\�*��\��^fy�8�_���7�A��0\��uH�%��J���{�@�\n��C5�V�a�FJP\�	��K�ݠ\��\�\�ⅇ��m\�oO�Ю\�\�\�~[�{\�k(\�\�^{\�\�\�\�\��jc\�ȑ�M(H/[%\\H \�o�~\�.��b�\�u?\�\�\�*���\�\�}��ث~�\�C���mjG�+\�W�\�_\�9P\nb\�;뭷:���\�*\�\"{�<�Ȓ�*H.ڥ\�%\�\'�E�#�L>��2��J�%(\�>�Q�\�\�٢ԅ^pP�ځ����\�ӲA�O\�\�\�X%n\�\nЋA)�J�M\�lP P߲E�1T�B\�	J�\�ѓ&Mj\��\��Y�v=\�\�V�\Z�w��M6\�ĉgz��\� Q[�`H\�3�|&1H�,�|�C,�.=���ڬ\'\rY<\�fZm�X\�D�xi�@��+�B\0M\0\"4�XOԊDV�<Q @��\�C�[\�P�F+N\�}�ݲ�D\n�\�E��\�7h\0\�\nR\�9\�\'�s�|�I\'<\�\r7ܰ5�_\�,��J`P�@A,�|T\�?Կ�a��\�j���\\@���~��\�X(@�\�-�RL���H���?T$T�\�`:��Um)ȡ�)�\�\�RT\Z�ږ$\�jS�=\n\ni��v�(\�$�@��N\�_��Y\ni��RQI<�-�\\r�\ZԦV\�*Hջwo7\�jPQn��\�\�]�Q\�\�`a\�R�\�٩�������\�\"/�K��\�[\��䈆\0D4}+�\�&�\�I\'�Ԛ�\�\�7\�tB�v\�\�F��\nKw�L+�\�ʋ	�wM��\n^\�CA|}o��_�K����+��K�h�s�A���_I\�.1]��u(����\nh�κJ@\�=B��]P�8�{��\�S\�6߮ږ��\�C����\���/,�\�ل��T�\�\�&{u��/���!\�#x(��{��bŧ�\�*M�\�\Z���\�W����\�,1@�\"u\�\�.�Y�0�\�Ӝ\��\�׼(��\��U��\�w\�\�������vt�\�\�٤�\��\�]1/g�\nC\�_�B�t_���1��\���-���\�w�/k�RVI\�\��\�(;\�Y��3�vhJȒ@\�\���IkI\'�\0�\0\�E��/�C �`�\� S���R\� R\�8̆@��v�(���V�rT&�\�[o���VaK�∆\0D4i%Z��@\n�A�h{+ߚD�rŧ�WK�\�.\��\��\Zik\Z����@B�dk\�\�\'�Xg>D�xi�@��+���\0E�S켔��\0�R\�a6\nh��R_h+>\�O��JX��s\�3�\�#�\0Q?����v�I�U\���׎\�VЊ�F\n�k7�vjE�Cu6�\�_u5����<\�x\�\�Ю�|@�@��u\�Q���\�\n�)nӋ\\�ƃ[\�t�\�&\�[\�3� �\�[FV�ڸqU\� jgǕHժPJ*\�T�KiF8\�P\�\�zPj�{iT\�1/�@�ȋ�\�;N�V*Ւ\������4}>\�^#S* \�;С4B@���L�b\�s�\"T���=�u�\�{�_%2��۰\�\'�Xg~�\�~U>C�9�JA\�~���G��B�Q@���&me�\0D���1 @�\�_X�rHS\�\�/��\�\�\�\�hO@�N�u\�\�\��+�\n�\� @\�ƍ��M\�\�ov;.T\\+�k�U\�I�\�T�&	V�\�1�\��O�+\��4\�4\��Xg]��\�b��<��Wv\'O�\�\n\�\�} @\�M8\�\�#@\�\����=fE�	 @4�8�A\0\�.�\����A\0H�X\�jV�>��^x\�\�t\�M�b�W_}eZ�#�S�N�rE��o\�G�\��\0@�D�	 @4�8�A\0\�.�\����A\0H�X\�jV�BH\�\0�\����ƛN\0�\�.���@�H�Cr`D�\�!\04�\0D�@\�\r \0�$�\0�\0\�\�#�\�;\�\�\n&u\�\�\�\�_};��m�-�p\�\�\�\�>W�\�\�c��`�\�`\�\��\�Km\�ȑ��\�Qq\�\'ڒK.\�\�+�X�m\�G�\��\0@�D�	 @4�8�A\0\�.�\����A\0H�X\�j\��O?�\��\�o?��\�;]��8��{\�9{�\�\�C��>\�z�\�\�ӧOwE�%T\�o��\�.�\�\�r\�-m�V�/��\�\�:\�,{��\�mԨQֽ{wwD�\�6��#@\�~\n\0����3mb\�tԻ\'l \�\r�L\'�\0rA\0\"nf��\0M\0\"\�	�7B0��ABÜs\�ig�q���\�\�=z�h ��0`�\0�\�3\�<\�ć�S���\�\�s\�\�vO�\�\�\"\�K\�\"�\0�<�\0 \�\\\�\�O\��\0�D\0\"K\�d,�\0\�I\0\"֙�g\"(4� n��F;v��s\�96\�\\s��\r; b���o\"�S\0\0�@�	 @4\�t@ C 2\�L�@ �  b���S-� ���Z�j\�뮳%�X\"\�\�I\� @07 Ж\0)���&�\0\�h\��@ � �\�[F@ -  b��\��E]Ԏ?�x�R)�6\�`;\�Sl\�e�u\�=�\��6���[߾}��\�\�\�}\���\0( @j�D�	 @4�8�A\0\�.�\����A\0H�X\�jV���\�u\�]m�v�}�\�\�:v\�\�\���\�?��:Ȗ\\r\�V����\�N��\�\�\�\�_\�\�t8�\�3\�\�o�uū��#�<\��\�o��\��k b��4N\r\�\0\�@�`R4�\0D��\� \0�\�@�Ȯo \0�fx\�\�\�\�SO�[n�%t��\'K-\'fQ�8�\�\�\�k\�ѧOS\�^�z�\�L3f�-��Ҷ\�6ۘD_\�A\�\�Ga<��\�\�>���\�_}\�y\�m�y\�1	]t��9\����!C\\�j	\Z�`D-��k\�`DXR��y�trƉ\0�_`	 \0��Xf�e\���߷�N:Ɏ:ꨒf\"@$Ճ\�@ �\�w^�1c�u\�\�\��\�sO�Ⱥҁ\0�\0Qi�\���,\nu�\�b��@\�LQL�%�\0��h4�F�?@\0\�#�j\���K\�۵kW>|xQ!\"}�\�b@\0I&\�\�?�Q��N�:U\"  b�\��\�E���+�\�&�\0�L�\0s�� �˟\�!\0��@0\0\�@ń�4x!\0��@\��\'��\0�\0\�G��/D<\\i�9\0�b\���h4�F�?@\0\�#P,\0TL�@�H�o��@�	����\"  b�\�i &M�\�\�6\�\�9\�\�:��\���\�^k�\�K\�Y\�\\s����(	�\"J���Y�b�ƀ\0�.a- \0�f(\0\n\n_|�\rnfIG�\�\�f͚Ռ!\�\' \0��@��O1!\"֩�F\"V 4�@�H��0���͘i[�۠\�=\�/�\�\0D~}\�\�!\0�%&\0\�\�\�б�\�5\����l\��\�o�j+��r\�n9�\0rN\��\�_�\��.Ņu��\�j\�m\�\�m�aË^7n\�\��\�x;vl�v}R�m�!\Z�Ҥ��E9�\�A��T���@�\��`��@�	�\�\�\�&L�\�\�n\��\0rF`\�-~\�nēﺡ\�.��!a��\0 P%�\�n�;��\�\�W\�=�\�&\�|��\�\"@ @��7U��\0Q.N�@\" @$\�\r\�\0; r\�|�@ $�jv@t�yW[g\�\�m�?ޮuR0�\�i�\0 \����,��\�.��;\�`iYH_\�\�Qķ\�\�(\n\�hMC\0E @0- Ж\0)���&�\0\�h\��@ }*��.޵kW�D�|�\��\0�L�\��\'(<�q @P\"\�9�\0+^\Z�@, b�J�)&@\�;/��#@�\�q�\r@��J���0|�p��\�n��\��+\�\Z�2�$C��\�!��!��D\�A*�j(B�\�\"����F%�(L�\�k����\�$c��\�P�����z\���\�>\��~�\��\�\��ݟO\��ֵ�\�\����\�\�u͘1#��-B]�cJ��8\'\�\��\�\�\�N{\�\�  \n}, \n\�k\�(��D!X\�\� j켚��\0QS\�i�$ �	4����d�D�Nq(	H@C@����p(@(@�h(@�\�\�%P�B�\�i�	(@\�\�y55]���\�l	H@%H�vD�\�p(	H@CD��Ҥ�\�\"<(@�\�°D��D�p\�ZP�(�\�֖�Dm]W[\� j\�:\r��$P\Z��\�a\�ܹ\��㏏��\�]��(\�%$	H`h\\z\�-S-�\�	O@�p(@�\�\�%P�B�\�i�	(@\�\�y55]���\�l	H@$�\0QA�h�$ �!#�\0�\0Q\�W�(��K�\n�`�\�\ZP����jj�DM�\���*H@��N\�$	H@CF@B�\�%�\0Q(^;�@! \n�j�5&�\0Qc\�\�\�t��:N�% 	T��D��I������D�K^�P�v.�B(@�\�NkL`�\�Ea�\�\��)�k<M��:yK[% 	T��D���u������D�\�\\�P�v.�B$b\�wݲ��~\�\�_?�>\�|\�M��o������İ�\0\�/	H ?\n���\'	H@菀�D+\'\�]\nA\�L\"�\0q\��\�w�h���V���\�4E_ Ɨ?��$ �AP�$}ǖ�$ (@(@�$(@�\�\�%P*�9�\��NZ�\�qL�&`\n�A{`�\�W�>�;c	H@EP�(���J@�@V\n\nY\�J_\� �\�\�M��$P!���3�\��!q�Ӕ�$P� ;�$ 	t$�\0�\0Q\�#�\0Q(^;��$ �(@�\0\�!FP�pAH@�@^ �\"i?��$\�/�~\�N�� 2a��jA�L�p�F@@�\0�vّ��D���\"�\0�I���$ �~	(@(@��v2ݧ\0�	��$P_���\�\��mT{5RyP�ȋ��d%�\0���\�$ 	H��n���$ 	M@B�\�5�\0Q(^;�@� J\�\�`\"�\0Q!g�)\nC\�h�)	H�\n%@v	H@\�H@B�\�GD�P�v.�R	(@��\��*D@�B\�S �\�\�NS�@	 J�\���$�\0\�e\r�y��\�\�ŋ\�f�\�E9R��͒\�P	t%�\0\��\r\�)�q\�\�\nOK�\�\�\�4	H@5#�\0Q3�i�$ �qH�.q\�v\��o+@���pP�\�ٵ$\��`\�t\\��pQ�=��0}\�\�q5/\'S]\n\����I@���yL{% 	�?\n�`*tU+@�\�\�%P*�Rq;�$0\� �\��N]M\��\��}-,�\�\�#��|$\�3���y��\"\���/l\�4$  \n]\�\n�\�s	�J@�T\�&	1�!v~	S_�`A��\�k\�UW]�?����h�Q-Z9\�p��\�\�߭�\�J\�[\��Vxի^U�����\��~x�\�KG>��G=P�\�Yen\��N\���\��\�{lx�ӟ\�b\0�}=\0\�Y+\n\n�.X�B�ڹJ%0gނ8\�\�Ik�:��I`\�L�4h\��\n\�\��f�\�C�}\�Cᗿ�exꩧ¥�^\�R����\�\�n�\��p��կ\\pAXs\�5\�2u\�8�<�H��\�+\�;\�񎁌?\�A��賵\�ZkTP\�y\�{^K�\r\�^Ǯ�\��$�EY\�ש�\���\�Moz\��\�J\�׾���o\��BW�D�x\�\\��J `\� ;\�(\n.��	\�|�\�\�}\�{_K\���g8\�\�\�\�\���𒗼�hS2����(`�32�O�Z	���\�p�\�xrvAsQ�(lI\�vz_\'\�\��~�={vx\�[\�:\���G��KzP��  \n]�\n�\�s	H@(��D	�B\�5P*�N�_�\�a�}�	\���\����q�\�+վ\��x\��h\�f�m6Рڠ\04�/\��\�7\�i��.�\�\"�A9�F\�*@\�\�Y-L\�&@�z\�SN	ӦM��ԧ\���\���\�k��\��\�i}�  �]QM�)@�\�\�%P*S0��\��*D@�B\�S<1$�\�4\���|�\�x�\�N�n\�}�\r��zjX}�\�\�Z�p\�\�X3bҤIqg>���\�\�\�m�]8�\�CÞ{\�;\��\�O�s\�=7�u\�Y\�/�KL#�&L\���\�W\\1\�\�G?�\�p�\�\�:԰ \���\��&\�\�^\�;\��Y��\��\�/�6\��\�\�\�\�}\�{Qt��W\\q	\�92k֬�\�\�o�\�\�뮋i�\�_����<̜93\\s\�51-\�QG\��\�K�|0}�ѱ\�A\�e�Y&l��\�q�2cn�\�&#\'Q\�~\�1ǌ�Y�\0AAj�=��\�\�\�\�����\� *\��u ~�������\�5�yM|�t |_��ΰ\�l\"�\�	(@(@侨\Z;T�(��K�T�.��U��D��1$�(@��8\�n�G}4\��S���\�NBth���O\�	�!* \"\�y\�1X��/})\��\�1��\�c�E���\�9\���g<c�\Z�\�\�b\�N;}\�yK\�(\�\rĐV\��ǖ\�/�<\�㎱\r��t\�\�ӟ�t\�e�]����8\�X�\�e/{Y�7�����\'�A9蠃b{D�\�~��\�/xA\�i��¯~��8_\�\�W_}uL��jq�[�\��\�O�Y�L\��7��\�\�$�\0QA��`R�\�\�K\�w^|\��\�\�8V\���\�\���M%����D\�\�\�OC�~�y��I@��~Ѫ\�	(@\�\�FP�pEM k\0�����!@ޮ`uV[S � �g>�1\�\�n�\�\���\�?�+��Ue�s\�VAy\n�6\�ڍ\�\�^ND��\�oo9%�qb�\�[l�El\�\�\rDD�\�\�\�}om*���;i�6\�|�(@���?�\� �.,\�u%�\0\�Q��{_#~~���\�{<y\��ˤ|_��\���^	�\"�\0�\0Q蓡\0Q(^;�@� J\�\�`\"�\0Q!g�)\nC\�\�N3�\0��,�;�?�\�ǝ��^���Az#��\�/��ݷ+\�\�,J� \�Zk�Q�г��\�؊;�IQ\�)�vl.�\��w�+l�\���\'%&N��P�\�w5y_/ z�U��\�\�\�\�_}LS���\�G�� �ߟ��\�7J�W0�\��E\�%�\0�\0Q\�\�T�(��K�T\n�\�v�\nP���3�\��!q�\0�ً\0A���A�\��]\�\�\�N� �C���/�8���ڵ R�\�o|cx��\��ۧ�\"�)�8IB*\'���~��\�\�/~�D��\��z\"�\0\��\�5n��N\�Sޝ���ֆ�}\���r�՞��D��X�P�v.�R	(@��\��*D`�\�Ea�\�\��)�+d���g\n\�ٻ՘[/��)M݆V\'�Ψ]@+�`b\�\'?�ɰ\�z\�\�@>�{W]u\��o��\�9\�yN,\"M�A��H)�(��\�{\�GdDM�\�.�,�s��u%�˟���p\�GF!�\��\�=\�yOl��D�\�ͺ�l���DVR\�l��}]\�	\�׾����hU(@(@�N \n\�k\�(��D��Lb\nC\����Nʣ�>8�:�A�`Q�u�{]X}�\�c]�\"\�\�n�fA�kѢEQ$\��e�]v����\�\�?��0iҤрF�w:�\�3G\�C�v���⊱\�¿���p\�1Ǆ���1\�9u$̝}�\�1�\�\\���(@qi\�M\�\�֤�F\�\�K/R뭶\�*w\�qa���Z\�~�}\�%\��=1w\�ܑ{�_���=p2\�NO>�d8\�\�\�2\�,�D�8 ����oy\�[��Cz&�rS�\Z\����\�\�~��\�|\�\\s\�(rPG�  cR|���N��SҲr��P���c2�\�\�}\�|{V\���\�\�K\�fȕ���te\0\0 \0IDATD���3�B�ڹJ%�\0Q*n�����\�;�੷J\�q��Ǐ\�H �E\�d��\�}\�s\�~�\�\��.v�r\�!#��f\"Ʈ��ڰ\�\�]w\�5�x\�#\'*\'��\�/��\�:+�oN�G<\��я~\�(Pg\�ӟ�t���?\�\�u\�]\�Q\��b�\���\�\�Ϛ\�{\�\�b\���s!RЎy\�q\�#?k�G���)S�Da���K�\�rK3��ꪰ\�[F�\�MozS7H��\�\Zk�SO=5̙3\'�\"̅���oD�u\�Y\'|\���\�Ϗ�!v0jL4ڋmO=�T�\�5\�\\9³U�����\�ׄ�DM\�df��u�\n��}_\��\�\�P�P�(t\r+@�\�\�%P*�9�\��NZ�\�qL�&`\n�A{`�\�W�>�;c	H@EP�(���J@�@V\n\nY\�J_\� �\�\�M��$P!���3�\��!q�Ӕ�$P� ;�$ 	t$�\0�\0Q\�#�\0Q(^;��$ �(@�\0\�!FP�pAH@�@^ �\"i?��$\�/�~\�N�� 2a��jA�L�p�F@@�\0�vّ�X�\��\�w1G>��[�$ 	�~\�PW��\��ӟ�����$ �\\	(@(@亠�;S�(��K�T�.��U��D��1$��#@ <��\�o?�\�\�\"�;\�3l�\�FCB\�iJ@�@;�\n3g\��-�E\�\�^{\�0o\�<K@���&�\0�\0\��\�\�r�DJ��@=(@\�\�OZ�?���\�cg�\�\�C\�Y\�U&	H@\�*@4���\�H��\�J@Bb�k�\��\n�\�s	�J@�T\�V!\nrƐ��E�X������\�[niIEbH�Ӕ�$Ѕ@\�\�x\�ȉ�\�\� \\b��$0V\n\nc]C\n��s	T��Du|�%\�P�(����\�I�xd\�\�\�x]x���;�R�p%I@�\0\�	?9\��|&<�آ�� \\G��$0V\n\nc]C\n��s	T��Du|�%\���pQ�=��0}\�\�rv��%\�J�@x��\�\�}wޚ��D&L6��$0\�	4?9\�\�𓯜�x��/\�:���l 	H@](@(@�����P�v.�R	(@��\��$ �!&\�,@��˔��?�Dd�\�6+��BX~�\�õ\�^\�}�\�î�\�\Z�\�\�\�\�z��=0�\��>(�����\�\�\�IjLA\�tѧ?�O0Ir�@\����:�\���v�y�\�a���j�t\�93Ä�o�f\�\�\�3�\��o\��\Z�m�X���r���\�\�\��% �|(@\�\�\�^$ 	t#\�,@|i��\����\�m�~�\�[rz`�\�w��\�#��=�\�3�۟\���\�s\�{`��Z}Px���OK@�@\�\�n7�<\�\�\n,�\�e*\�<���z 0gނ\�z\�5z�˦�?S0\�߇u�A�L\��\�\�\�Ǚ�c\n�L�l$	H`\�h_\���b�ĸ_NP���	(@���\�5�\0Q(^;��$ �X��\�1�@�\"\�_\�o��p��;RS�pQI@�\0\�	�)�81�hѢQi3\�\�\�:��$ ��P�P�\�\Z\�x�D�x\�\\��J �\0Qd�\�,@\���\�},<�O�\�@э7\�ؒ���J���\n|��x\�a\�̙K\n�#	H@+���!�B	ڹ�C�L\�񅖔K@�\\ގB�I�Xe�]\�ꫯ��\�>�쳄�\0\�J��$ �^�D�Y�P�pI@��X	(@(@�u\r)@J\�\�%P���/��\\\n\��v�\��\�k޼ya\�}�\" \\I��$Џ\0\�(Ds\�1a�u\�	�\��)	H@蛀�Dߋ\'ˍ�`\�B\�6��z�I+�\'�\0�?S{\�L��\�=!D�t\�I\�\�3\��$ 	H S\rR0yI@���\"�\0�\0Q\�ڊ�*@�\�\�%P*�Rq;X�(@T\�Cb\�X�!A\�4% 	H #�,E� 2´�$ 	�E@B�����&���l\'�\�P������\n\�p�\�� \\��$���Hڏ$ 	�K@B�ߵ�\�>�L�l$�ZP����4�\0�.\n�\�>�O�\\@\�v)�%	(@�*$ 	H /\ny��	H@藀�D�k\'\�}\n�0\�H� �\0Q7i�$0(@�\':	H@!�\0QGh�$ �!&�\0�\0Q\��W�(��K�T\n�\�v0	H`�	(@��$ ��	(@\�\�\�$ 	H�g\n\n=/�^nP�腖m%Pms\�-�N��F�\r\�:	\�L�L9��� �\"��$ 	d$�\0��\�$ 	H�0\n\n�-.:V�(��K@�@	,B]d�E@\�!	H@yP�ȋ��H@�@�  �];�\�S�Ȅ\�F��$Pa\nv\�85Mb�:\�iI@\0�@wH	H@E\0\�\�o\�He�\��fͪ$�<\�\���\�\�ŋWr�����r���j\�\r��8\'`\n�q\�`�ז����l\new<	H@㗀\����3��$PO<�\�(S\��\�\��\�V����\�.[\�)\�\�V�(еy8�@�\�Z聀E�{�e\�qE@b\\���Q����4R�@-(@\�\�M\Z)	H`�\�-��G|[��%���\n4Ϯ% �\�\����\�T	(@�@\�&�\0Q6qǓ�$0~	�7�j�7h;����n\�A�_\0\�L��*G�n�<\�\�\n.\�<T�yv-	�@�n=LͦP�p\rT��D�ܡ1��jM\���\�\�j�~�\�׵�\r$ 	H@y�[�\�<\�\�\ny���\�\�ͳk	H�\n=��\�\"\�	�q\�\�ZLF�n\�H	H@�$�w��mTK\�5Z��$0yķ \n�\\*\�<���z �\0\�,��+�.\n�\�>�O�<�\�\�d�K@���\�2	H@u\'�\�\�\�?=�u���K@��J#�G|[�@w\�\�ͳk	H�\n=���$ �1P�<o��$ �� \\ ��$0h�`\Z�2��\�W�2<����\��G��\�sf�	w\�f͚��\�b�)@\�\�^%0\n��\���0P�F�;g	H@\�P�(���H@�@{u�/\�\��D�OD*\�<���z P7����\�T	��\�R6���;�$ �\�!�\01<�v����J@���i�\�5q�fJ@�@\�	X���.�\� j\�2\r��$P\n�q��J@� j\�Z��8J3% 	H�� j\�\�\�M@�v.\�`	H@�!�\0QWi�$ �qK@�&�U����4S㈀)�Ƒ3�JO z\�e\�(@\�\0\�.$ 	H�%�$ 	��Ġ=�q|���l&	\�F�n�M܎���\�\�/�\�(@��\�% 	\r�\�8m������$ �\��[|)�\Z\��.p\�\�ͳk	H�u��\�aj6�@G\n.��	(@�M\��$ 	H@��$ ��\�-��G|[��Օ��\n4Ϯ% �\�\����\�T\n��JP���;4F��$ 	H@ȑ@\�R|\�\�V�\�q5w���\n4Ϯ% �(@�\0˦㊀\' ƕ;k1�Z�I#% 	Ԓ�)�j\�6���$ �\�#��\0Q��pP�\�ٵ$\��`\�t\\��pQ�=��0}\�\�q5/\'S]\n\����I@�;�P\�݃\�/	H@e\�#��\0Q�\��pP�\�ٵ$\��`\�T��(@���J@�@G\n.	H@4S0\r\�\�\�+_�\�`Z\�\�\�Z\�q\�93Ä�o�f\�\�\�c1\� �\�j��APwL	H`	(@�ם�$ �r(@�\�\�Q$ 	H�=��ŗ�o{��\'\"h�]K@=��B\�\�\�l*��L�\�)�\0į~�ǎþb󗆫���l\�O��jN@�\�\�|	H@　DM�\�	��8J3% 	H��,B]{\�n\�_�(��\����RK�ɫ�<\�\�zիj77\r��$ ��P�,G��$ � j�\n j\�(͔�$ �\�P���k?��~tGXi�e¾[nX��8	H@,���wt	H@P��\�\ZP����4Tㆀ)�ƍ+�H� zf�\�	(@\�\�% 	-��u���$P����+:�\0QGi�\���}@�#�Ne� \�\0�\n.	H@ȋ\0\�\���Q^\�ُ$ 	H�gu�/\�Q\�\�\"\�=/�\�7\�\�\�\�R(�@\�> �da\�\�E�nĊ+�����\n�\�RK-�[n��z\�\�\�z*6���$ 	H@��$ �:\�\�7�>�h\�\��o+@���y8��(���\� �\0QeǨ\"��	\�,�L\�y\�\�F��q,\�\�\�\'���\�g¹\�;�nr���\�\���\�\�a\�\�\�ͥ?;��$ 	H@��$0(sZ�^w\�3K1a����/\�{�<\�\�\n}\�\�~c\�>�-$ �2(@�A\�1�H�nĲ\�.\��\�w��\�>��8kc�HV]u\���\�\�fS0\r\�\Z 	H`\�0Ӹq���$ ��\�\Z�\����\0�\�Y�4\�\�A��\�=�@� �gj�� 0\�0{\�a��ɵ0�H\�\�o\�{\��¥�^\Z^��E\�?���}�\�7l��\�C	��\�\'F~_$�N8!L�<9�\�mo��\�cL�<(ڇ$ 	T��E��\�푀$ ��	�5>=\�� \n�p*\�D���2P�\�\�f0�^�$ `�g?�ٰ��˷�\�=�\���M6\�$���\"@䍽Jĭs\�e��6Yk���i��$0d �\�\�NW�@	̙� Z5u\�\Z�X7\���X\�g���(\�\�y8�@�\�Z聀D�l*�(J��\�o~�򕯄��\�;�t\�I\�\�3\�\'N \��\�7�\�.�,�s\�9Q�\��\�:\�OG�3���\�aڴi��=�\��3�+w\�q\��\�O+���m����8�\���Pr\�W�}�\�\'�q\��?���4\�������}DLa,Nd`\�\n+�\�ҞV\01�\�\�\���$0\�(@�3�:	H@5$Pv|i��\�ޯ\0Q�\"\�\�A�h��@Fe+\�Ͳ�\n\'P\�L]t\�H��u�{]\��#\Z<�\�C�õ\�^\��D��;��\�^��\�h�v�bB��E\���\�?\Z\�7��\�+|\�_$��Gy\�H��\�w_�\�SN\�#\�M�\�*ӎ;\�8*\rv#NpO;{R:�\�Ť\0Q��\�\0��$0\0\n�\���$0��DM\�+_�\��\�\�\�6\�\�\�Ι&\�}s�5k\�@g�\01P�.	H@9�kjN��>Ay���)�\�\�S\nIx�\�_\�V�H\�8\��X\�1\�n�}� V[m�8f\Z\��;N@|����\��\�\�)�\�\�\�>\�	�\�{<\�\�6ۄ�\�T���=�\�|UI�0S�]H@�@$�\0\�B��$ �AP��2��\0��\�$ 	H@c$Pw\�;\�)�R͆t� �Yj@  f\�W�҉��֨�u 8e\�xa\�\�o>���i����Ľ�޻\�\�)�S�\"\�\�\�i�R�%lH�>�\�Il\Z^%\�\�VZn��\��q5{�$ 	;�a_\�_��\�	(@\��,P�Ȅ\�F�@�L��#L����\ng�}vL9t\�1ǌ�&�\�|\Z\"�\0ј�(u���ͧ9\��G�H�nNq\�,8� fΜ�:\�x�� \�	ڥ�H/��_�\"�\�@xigO���?�)\�\�\�\�n�zU��4@���!�\01n\\\�D$ 	Ԗ�DM\\�\0QGi�\���? \�:�Rsu zN�\���š)\�|\�\�\�b\�\�X\�\"eW�\Z\�uR��2�馛B	�O@ :4\n\�u\'\�ɄN\' ��4�n\' \ZW��\�\�ΞV)�^��ׇ��\�j��3���\01(�+	H`�\�;��\�6\ZsF��$PeǗ\�Z\"`��\��xZa�\�ŋk\�(�ڸJC%0n��1n�9�\���\0� �\�\��\'��pp\�Yg��5 ���}*`���\�N;-\\v\�e��N�\ZŌ��\�g��\�:\��?�WJ���Ȝ9s\�<��?���\�ɓ\'\��\�6�Rh:��6��:�v7\n��4/R�aϝ;7Ϋ\n�D��\r��$ 	H@�@ʎ/�U@\��0S�\�c\�\�#h�]K@=(��\�l*�B	\�U� S\n\�\'@I�hē��k\�Wn[��P�\��k_�Z8餓\�-�\�VZi�JX�\0Q	7h�$ 	H@��$���S|�5>=\�� rX4��\�\�A�h��@F\nA\�l\���\01\�Q�����\�[\�S#�_�ʥ\0QOh�$ ��0S�}\�$ 	H�7c�O��~�\��\�s\�<\��\� 	B@��vZ�.\n�\�>�O�\\kCXv\�e\�;\��\��	�\����-�\�2���\�x`�Kh�\0Qd���$0$,B=$�v���$0B`��\�ޯ\0Q�b\�\�A�h��@F\nA\�L&�\0џ�)��꫇\�O?��\n�\�ֹ�òKO���z��ص$ 	�a�s��$Pm�`��F��uM��G Ƒ3�ʸ&�\�2\�\�:�x\�\�z�yN\�\�3\��g\�\�]w]�\�ڗ$ 	H�r *\�\r��$0tʎ/�u��X\�\���.p�\�\�ͳk	H�e+\�=�fS	J�n)�VXa��\�RK�UW]�P.\��M7\�4�q\�a\�u\�O\�r.��$ �%(@�($ 	H`\� 큌\�{\"#(�I@��\�H�nE�\'N�f̘�8\�1\�\�۫B�LU�vH@�?���\�H@�;��xP�&�\�L	H@�=�ڻ���u\�]\�$ 	T��De\\�!�����DM\\�\0QGi�\�S0�#g:��(@�\�\�P�(\0�]J@R\nC\�x�-	H�B *\�N�(@\�\�Q�)�qD�\��q�ΩԜ�D\�8\�W�Nt\n��*B�\��Nۨ\"\�h�$ 	#��\�Kc�Q<\���E�\\\�y8�@�\�Z\�@\�=�fS	J@�P�v���DH6��$ 	H@��jA�\��\�X\�\�c�_�\�e���\n6\�\�% ��\���\�h�\�$P8�\�;@��o=-�#?��SO���&,�\�\�϶x\�p�\�W\�N��$Б�\�5\�\�J\���ܵ�\r$ 	H@y(;\��X\�\�c�_\"��Ӧ�<T��v/	d$�\0��\�\��q\�\�\�Ob��\�֚�EK[�a��w)@Tޓ\Z(	H`���|�s�ikȅ\�/^<xC�@��\�-�8 \�ܾ�dj\�k��Ƨ\�z�D�\�}\�qH�K@P�(�\�V�����\�\��\�S&W\�V�8qb�1cF8\�#ja�F.I 	[\�xK<7|\�c\n.	H@\�D��ɏ�}Q۶37]Q\"II@�@��e�\��kt�}�\��Y�f�;D\��\�\Z�\��g\r�B\\��N�pP�\�ٵ$\��`\�T$�\01@�9\r�\0�H���$ ��7��A��I\0\�\�\r��m>��7�33L��f�A:�\�؃v\\V\nYI\�N\�\'�\0Q}i� �\0Q�u�\0Q:	H@U!�\0QOh�$ �\�%0\�8�X\�\�c�\�{������\n4Ϯ% ��]$�\�l*�B	���P�vނ��\�B���\"�\0�I���$ �~	(@(@��v2ݧ\0�	��$ 	H�\�,B]a\�S\� Ʃc��$ �P�\0t���$ �Q  \n}$ \n\�k\���$P� ;\�(\n.	H@ȋ�D^$\�G���%�\0�\0\�\�\�\�t�D&L6�@-���n\�\�(@\0\�.;P�p�H@�@^ �\"i?��$\�/�~\�N�� 2a��jA�\"Եp�F@@�\0�v�\0\�\Z��$ �R(@��\�A$ 	H��B�B�ڹJ%�\0Q*n��\n9cHL�Đ8\�iJ@(��D	�B��:P�P�(�Q�(��K�T\n�\�v�\nP���3�\���;z\�᪫�\n��\��>��υ�\'.\�i�6c��z=<��\�\�\�_�zx�\�\�V]u\��\�/~1�\�g?g�qFx\�3�����?�x�\�.�\����O|\"�\�E/�ޤ*j\�O<�;\�hݱ\��]v\�ʮ\�a}�.����\�\�}\�{_�\��^�җf�m�v\�w^�:u\��\�up�^�\�^���&�\0�\0���\Z՟D�x\�\\�P�(��U��D��1$�TU�����n�����o|#<�\�\��\�G\�zdѢE\�;\��Nt\�|�\�\�ꫯӦM+̓��vZ��\�?6\�`�p\�E� �\�`\�\�\���p\�\�v���\���\�3\�\��_�\�W\�e�]�m�\�\�\�xG\�u\�]\�\�_8\�����\�g\�o,\r\�Ν\�R7\�|��w�nķ���p\�G��VZ)\\z饣���z*\�x㍱�믿>��\�7�1|\��\�Xy\�\�V[m5�k}o�y^s\�5a�}�Ybޛn�ix�\�\�\�ꫯ�;�,\�L\�֨ü���~��᠃\n`l��\0\0 \0IDATcx�� �&l���$Ѝ��D�52�\�+@�	�7K�R *\��)�����\�\��\�S&�8j�C�\�{ƌ1`\�UOU �\��+�u\�Y\���E�\�?\�6O�\�C�Px�ӟ\��\���\�6۬�\0{�\�@\�	�ml\��G\\8��\�\�:\�z\�(H\�\��\�R~�\�_v_�\r�/���C9$L�>=���\�\�}\�sÿ���x�\�c�XH\�QMp�\�\���g�\�Kbp����\�#���\�\�\�/~�{\Z	ѢQ���\���>�\�xzⓟ�d\�~�\�\�2\�,��\�\���׼\�5=�ծ���\���\"\����y�r\�_�\���\'x89q\�\r7ğ=\�y\�\�sN�<3�����\�u9=ór\�WF��ӕ�]s<�@��>�\�#\�\�o\�Ҟ\�Q�\�	��% 	H�\0\n\n,��\�R�P�v.�R	(@��\��$\�7��\�U\�ƪ\n\0\"0���\�Zk� ~�\�ĝ�\��\�\�K/=0�Y���m\�#�\�\�\�\�f\"͟�\�\���0a�s�뮻\�[\��\��?D�f�~\�̙\��\�OoyB#+8�sT?\��_����\�u\�u�\0�i�O�\�1\�\�W��\�%\r~ꩧ��\�^;�7c��|�\��\�|&l�\����\�Y\�o�VO8\�p\�}��\�~��ѯ��\�ώ�ޅ^�\�f��<3Y\�\��\�\�\�\r\'7\�\"@�\�G?�\'��;]Y۵\�A\�K_�R\�\�I�\�g�r\�\�^\"O��%	H@�P�P�\�g\�d�G\"3*J�� *\�\"\r�@$�\0Q��PW\"\�\�fg6)F)>�\n�S;�i%@d]]����SV��\�zK\�J@��_��\��-@�\�]�\�S�����C\"p�H\�ώ\�fb�\�\�Q�9�\�C\�\n\Z�\�sO<-��\�;g\�ֶ\'I�\�Uf*�1���,]\�W�\��N/i�2��\�\�\�\�X\��\�̱�>�\�xr�\�\�\��B\�t�X^��W���\�\n=#�	H@ș��D\�Kjtw\n�\�s	�J`μq���\�(u\\���	��i�\"5\�\'\�s\'.)nn�喸\��\�\�~��sǧ`]�AQA��\�h]j\0tg�=�z��\�n���N:)����m1Q(\Z��\"\�튻\"n�{\�1�;�	ؑ�\�\�/�H��\�͋;���\�o�w��1�ѷ��\�Q)���Iv X��\�\�\0�&-i�\�#���j\��n�aL��\�\n+t]&\�Ʈw\�q�R�5K�l!�K����3�P8ِ.�����\�\�RRQx�q��_\�J\'((T\�	�EX\�\�\�S��\�H\n&\� �\�\0�:]�\�!�B\�{$�1\�\�O��\�aI\������O�=]\�\�k0/\�Ct�\�c�4�4iRL��\�\'\�z׻�E�,XN<�\��׽.�)\�B\�-NX4��\�Rd��\�g�\�\�]���կ�\r�BiG\��\��}-�Pj���e6��`\�~\�o��¬Y�\�@b�_w\�u�9\�y�ӟ�Oذ����6>{ֳ��\�I�(6\�d��c\�1\�\ZFgw\�yg8\�S\�3O�%\��@��1YO\\\��5����\�}/�\�t\0l��\�f�mF곤�8\�a���\nw\�q\�(A�Z\r\���\���\�\���⊡\�<��/6�����-�J�\�+FL\�\�|��QGy6�\�<\�Õ\�L\�\�P5?��C\�-\\���\��\�\�@b,��W��� �\0�\0�\�:jۇD�x\�\\��J `\�ѐ[\�*\'0GN�vA�Ny�\�}\�&p|뭷Ɲ\�y\�t\�6��e\�\�u \�\�L����n���:uj����K-�T\\\�\n\�f \�<�\���$\�K �O0�\�3�w\nl%�\�x�P�\���\�>\�\�\�Ҧ\�Q\����\��yQ��$\�6�~\�k_s�g٩�p\�\�\�fw;\'~�\�_�<0X\���Ġ/n�%��ԑ8���c�m���zZ-6���\��	�R@\Z�!�����I\��0$8O\0ai\�u׍)���R�[\�\�f.�kJ\�5�\�\�#\�:A_\�G >�_8�)،�\��\�@�9)�v\�i��(\�A\���#S\�\'E��\�kƹt&��`�g<#�\'��3լ\�������\�v\�E��4c\�0^�\�W\�\�;\'Y�#]�	�S;�qd]��iK�.l\"(�0\��g~0M\���^���Ea�#�0&��-��\�\�\�D\�\�YD�\�b\�4D\�Ϭ}lJ?�\�\�b\0�g�\�\"ؖ�@\n���ҼN\�X\���\�ST��b- J\�cx��9E��)\�\0�\�/���\�Pk�\��\�$���/\�i\�X笑]v٥e�98pZ��{�\�8�n?y樉\�E�&\�_�\0ߤ�wR�0\�\�F�\�\n \�D��\n%�\0�\0Q\�S�(��K@�@	 FCn����)RR@0\�E`�\�;HI\�\�jh\�vO�\�+@t#���\�X��9A\�]w\�5\�\'�\�\�E`��\�6\�)ܸWYe�TN�\�\�Nb�\�Ȧm�6\�볝\0A:#���\�T`9\�(�\�w��\�{I��\0A��]ߜ8hœ /Ag��\�S�v\�7rFh (\�=�Đ\��\�\�N���/NP\�%\�\�i��\�*@�z�\�Ɉ$6�}�\�G;\�	�3&�v\�q\�X\�;�����m\Z��V�\��Z:\�Ѽ^�\�ah�\�wo�����\�I���\�!~�\�w��#\�q!���S\\\��\�\r\\�A�-\�p4\�\'����%��\�	ݞ\�h\�\nQ\0\�c\�c�ZA�	�l\�\"@p�\�1\�%/yI�G��\�\�HmX#I�\�3��\�K��`ݴ{�5ϣ];�I\�\�l\�\�\r��O�[Z0��\�\�/�\�^Q�DQd\�W���P�P�ȺV�j�\0\�6o�@%	����nѨ(@��\�N�蔮��,;B�\��V���\' \�\�\�RG���&E�\�/�䒸˚5\�z\�i�(�\�X�q�fi�U�h�7\�eM@��H�D\�R=�\�O\����#�fN7��q\�|;���\0\�M�k��\�\�nx\�s�3J�h����/�U����\����\�$����`Ŏt���\\\���9�\�S�=�X��>E*~Ύ�^\�l��\�m=g}O5�\�tI��\�(@t;\�\�*�\��O>A \�\�	v�g���\0�\�j�EF�Jb\\�\Z\�\"@ fp:��\\/\�A \�\�z���?���*0��1V��AL\��\�h�n<���Y\�dzqti�\0�E���$ ��P�P�\��\�z�DWD6�@mX��6�\�М	(@�/@�����\�^v�g\r\��\�\�n\�^�*�m��$R\�\�r\�ۜt9�ՙ3gN\�aL`�� (\�vD�6�\n\��&������)Sb��47\�\�.�N�mHI\�)\0�vړ�Z\�\�B�D:�\�g>3A�~\�x5�\�\�ٽM}�\�\�́RvyS߃��\�ve \�#�\�\�nH���\�N�H�{R����#@ ��v�W��`�Z&�X�b\�Y\�S\�\�v\�C\�\"\�͜;	Գh�w\Z�<Cݞ�,\' �\0A���hU\� K��\��� 8�Aʫ�\�;/\�~ -b@z7�!@\�#\��\�\�� I\�V�����\' ��A��$ 	ԝ��D�kX�P�v.�R	(@��\��*D@�?��*E@\�\�\�\��tu*�K�V�=R��a<��	>���(:LNr�\�%P\�X\�X\"��Kr\�ޅ\�1l.R�Z%�D\�ǒT� \'i��~\����/�\�I1DZ��˘6�$ �Ǯ�nm�kT��ӤJJ)��)��»	BR��<��3́l\�.���҇z\���r�L�v\�w;�m�j@$_4\�K�vm7�z\"P�/�\�x�$\��\�ye\�:���/8�_��\�#��Hǖ�V7�$!\�\�Fm\�[o�Xρ5�v\'�9�8�\�6\�q�Ϭ\�Y�>hӘ>�U\n&|˻�`=\�\r�b=��h���K�\�v��}�\�jZ�Y�\�*��\'jT����EN���Y��f�\��R\n����w�g�8\�9\����}\�̻�\�\'W\Z}\�N�\�tNV�O{�<Q��w\�\�k�\�S\n�t�b�\' �[z>x�\��:\�\�|Y��O$ �:P�P�(t\�*@�\�\�%P*�Rq;X�(@�vF�L\�^{\�R\��iWh�\�\\\�CR�0c7)�.�\�?�\�O�AP���n�a\�r\�-c�����/\�\0\��\��T�\�\�\"�J!\�g=\�Y�\�lcJ�n\�~\'�J�z\��$�\r?o�;\Z\�\��O�`i�p��Nik�1BE���\�ٳcp�`\�\���(\�&��\�C��\"\�	>묳\�i�nmҚal\�\�&����\�\Z\�N��\�	�2u%\��\�zd?,H\'D\0?\�\�g�?k��\�\�TGd#??��\Z�X��m�YL�\�I��)֛v�c\�%O�|\�؅y\�E�����\�b#\��\�w�\��pB�f�\�\\VR�a\�\��!��jsl���q\�E�\�\��\�?k�a��sZ�z�\�T	\�XC\�\rI}S\��=D\n�MRܰ˝�rO*\\\�;�`8�?�f\�����¬7\��\�X\�V\��B\�\Z�Q��B\�\�05��-	*��\�&�lON0\�T8�\�I#%]�u�\r�u\�ԯh��\�hOzv�0�~��Ú��\n>\�9e-\�q\�\�l\�b�g]r��\�\nQ�\�\�EP�&\nB�\�\�݀�\�3\n�Tsڂu�~O���\\\����4�pBxB��~u$x�\�\�&�4\�8�\��Ata-�pr�u�(>[������\�\�A�\�tK*d\�\�S\��e\n�#���󁠈��\�m$���]z\���5DQmlh>y\�\�;��\�X~o\��\�\�LEP�O	H@腀�D/\�\�\n=#�	T��De]�aP�\r��\0�R]pZ�@A\�t\"K�\�f�4N�\�P\�\"�\�>蠃bp�  ;l�/\��z�K\"��$\�XO�hm.B�8@P�\0!A>\��s�7Z\�Ni~\�\��(\�ʎb\�Z��Y��!�J�:A_\�����I\"A��\�\�\�|�\�9\�\�#B�b;�`N\\y\�1HK-��WSj&��N	�#�%\��v�\'HOp��R\�(��d	�6�(\�~�\�r	�n��ƣ��\�\"�\�x��\�\��)\"\�׾��q|�j\�i\�\�Y\�>\�2�6	�8�\�S;80jZp!ʰ#Q�5�n�!Ή�;;\�89�=�F�\��\��&�n<Q\�\�peM `4�W�	.ڤ��8��|ݸ�YG�.2\�O�c\\N`Q`�� 7���=k��4�2X�I�%���<�\�!b\Z\�\�ƫQ\�M?\�Wi.I\��7\����\�~0N\�$q�wt�\�6�~0\�\�s�3�!\�\�\�w\�/�\�\"\�>b��<b��w\�9r\��@\�FN��l ��\0�\�\�3՘Z-�A�`�!|���k\n>s\')�	\���g�v��F\��\�W�ѭ�\�\ZE\"NE�\\�v�\�\r�C�kl\�x�\n�F����O3\�kfE^\nEҵ\�^�t�|�\��;��*\��\���%��=\�=\��x�xe\'�\�\0\�,���6x�\�Z|�S���\�r�Q\�޲*v�}&\��\�\��7.6\��]�������\��\�ݲ/�BלD�x\�\\�P�(��U�����\�\��\�S&WȪ���#\����\"��c�~�\�+;��N�v[\�z\'(Ŏ[�4��K�]\�|!\'8ל��y�Vy\�\��G�U��\��\�|q8]Aг\�n\��\Z�#��&\nb�W{�ID9��VE\��3(pJ�]�ilB\�\��!)����\"@�i\0�\�\�\�|c/\��\�\�K�h%vɫ�}srq�Tc�g8H ��q�\�@U�O:ȉ6��\"�v 8=G\0�5��\�X��yqz\n1�S`�x�	\�$��.���(\�\"\�Z\�\��?�\�Q0Fd\�4\�\���4���!�7m\�\�k�\�v4\��\�k�:���\0�3\�\�\']�ٸQ\�\0�\0Q\�zS�(��K�T\n�\�v0	�M�JD�$�\�m���]���\�\�pv\��\�;\��Ê]\�)�J;h��\�{9y\�8\"�Nt�7o|\�c\0�+�q\�~�T\�\��r{$\�\'�H\�\�ꪳ\0�gvND�:\���\�I\r��o�y\�\� @\�O\�OR��۹��\�\�l@Z�\�S*�diN-W8� ����\�^�\��q8i\�\�!D;6y��kp�:uj\�.Ҏ�ds���&R\'�Z}�\��$\'9ED�!N\�rҋh�M�\�\�>\���?� +\���q�	\Z�޵�,\�$\Zs&M�(K9)�	הj2υT\�;��g.\�y�\�B-);�E\�澲�k��g�S��%\�}\�˳\�\�\\\Z\�Q�P�\�\Z\�x�D�x\�\\�P�(��I�oU �\�m �������\�L\�\rR�P|�4<�`\"o8)k�\�]Y�� Mic� �^N\�8\��F\�e\�y���\�lʥM�\�\� ��E�Zx�\�\'c�.�ɤ�h�S\�]��|ՙ$\'ʕ��\�9;�\'\�\�\�n�<�U �\�ZN\�w\�\�\'pL\�\�\�\0/�۹\�\�>.\�v����Y/v��\�:*�Z��q\�q\"�\�\�P־\�jw\�}�\�S캦FL/W�\�pw\�uW��?>Ӛ�����h�8\�wS\�\"�n�A�h�(��y�Qgg�\�V\�ō]\�%@��\�u5���w\�,�\�\�$@dm\�\�Ԕ�13��T\��F�V�P�(t�)@�\�\�%P*�9�\��NZ�\�qL�&`\n�\�h��)m%�/�Z\�\�Vh�b�\�\'%\0A�py\�\�K8�\���\��j��\�m\�\�b7]\�En\�\�?\� �9~��L< �|�\�\�U�W[��@\n~�\�\�S�T�\n�\'�|b\�0;K[	Q�\�[\�c/jNu HG^�\�zA��v�\�{\rZ\�r,�\"R�Fr�\�6˼�ٽ\��6Z�\�\�O:/R\�j�=���\�\�\�z�w�$�PÇ�ܭ\�V��\��Ʊ\n�C�g\"��\�tX�\��\�7�`\Z\�s�\�-B�\�\�\�c.���N\'�\r뷝\0��]\';\�0q�\��z�LB�\�g#\�}\n�0\�H��*L�\"ԝ��I*dK\�v��;\�%}\0ܥ\����\�r�{\�Ͷ\�*�\��_b����|Ig�;(\�_K\�\�\�\��D�0M��$ �B	\�A�h�ӌ\�\�u\�(L4�]�pa(&M�Ա8+\�89y\�Yg\�\�E�D��\�\n+�\�y�\�E�6B �qR�\��\�zT���\r\n�s��\r)o~\�\ZE4~���\�\�\\�+�mgs\"\�\�eNL�;5��\ZN�T�\�L 5K;[��\�nܵ\�Z+\�r\�-1\�v�6�~aB�\�B\0`\�\':\�w7��5\�\�G\\¦�v\�)��.RK�q8\�\�V[\�_�t�|\�clRn\�\�NQj\�\�F��a���;j*2�\�c���+�Q\�\r\�E\0xΜ9�&	\",ҕ\��\r7\�7\�p����\�emq\"��:	�\"L~�_�� q�B\�I*)\�5.҉)\��}�ߌ\�m�;����ﶍ�\�\��\'_\�\�(�����\�\���\�\�N}�\��a�\r�J�ku\��klC�#�	\�\�\�l\�k�`?�\�!}w�e\';\ZkQdYǭ�K\�q�{\�Z�NN�z\�!���A4\�\�\�5\�\\�\���\rb\Z>i�Y\�3C\��\�O~2�\Zl�\�\�\�;\�cp!.n�\�6��r\�a�\�\�W�O\�W~�H���|�e;R?�v�6\�+l\�J\�,�f\�\'�Xco�q��A�s�B�D�x\�\\��J �\01\Zr�%��\�! �F\���$Psu \�m��\�??\�\�.m=�E� �Gz��w\�9�����\04�F\�B�y�z\n�Q�\�/9l�\�1�K��\0�H�  �\�\ZkĔ`��/\'1	\��%\�N�7�\�}M@�� ?k�]��m�_\"x\�*����~),K\��\�W_��-�\�e^�� @J`�կ~u8\�S\�\��6<�\�\�\0�\�\\�Ӫ\�D�!�`�.�\��\�[oM~��:\�\�R\�P��I�iU��\�B!\�M��o�\�\�	DĂe�Y&��цy3&\��5\"�lF0H\' \�t�\�0\'](oN���{V\�X� X�`�\�\�\�d��9)�����������\�.� ��B\�\�\�?��|n�=�=�K\r�tb��i��ú\�d\r��N>�\�%\�KИ\��v������v�\�!Xc\�.s��Y\��_ݞ�n\�%b�@T\�t��P`�\�C��f8y�H@\�$@\�N�,\��~\�{\"( B1B�\�\��Ǆ	\�� }�\�`\�)rڬ��\�Q\�cީO8 J �4��\�v���I\'��!NZq�TM��)S��<\"\�\�	�\���\"?\�  �\\_�Ç���$P�`���A  �[9�\��򭧅^�c\�j�\�[vr\�\�>V�W�c\�K��$Љ@�\�5Mq\�\\�\�v[�Ll�\�\�gwrJ�C[\�/y\�Kb\�<\�Is�HA��\��\�8ءN\�\n\�\nv|7:S���{;��miv\"�\�!�\�͖n㒞��$;�w\�}�l�\rL\�͛7��\�{\��f�z�B\�E\�� ysJ�\��,��m���{:A�x\�t⢗\�l\�Bm�Av\�\�DdB�z�\�G\�W��\�@Z\�Vk�4��_�\�D>�a- ��\�P\�\�m�7�J\'<X7_L��~o���(\0tJ�\���7�v\�\�8\'�ʨ\�\�|g,\�Nr�҉�Vv n\�Cė��>�ƿ\�\��\�\�J�k~��y.���5\�\�U��7\\��_C��F���~�����腐]V�E\0\0 \0IDAT\�j�V,Z�\�=\�x\"����wi��C�ş]�/ʸ  \n]g\n�\�s	�J�\"ԥ\�v�\nP�\�O@�8 �g\���\�H��\�k�ٓ\�u \�\�z���oLp�T4\����|�\�gz���w�x\�\�0d	��j\�Ͷ,�v\�\Zv7sQ߇\��n\�J��ؓ\Z�S�D$HA�F��\�O\�\n�ӦyD���\�}�\���\0)k8\�\�|�]\�\�GL`G;s\"\��\�\�@{\�	�\�Ɣ6�A�cN:���#@�\0�ѩ]��\�~\�Ϳ�=~GXI����U\�N�o��\�A�Ԟ����N�t�#\�3\�\�s\�\�*=?�HhL�U<h \�S����\�i$|\�)�\�;��1��U9Ƀ\�\����AXk�q:\\B�ۻzL�W�>o�@�(@T\�\ZS\"�Ѱs��N��JtSˡ\Z�Ӡ�\�r��]b��[�@5	�#z\�m���Wv\�f\"\�&@p���\'\�.��x�\�-�Z�\�\�k�ݶ��\�+\�,\'xȩv���킪��,�\�Vm�ٖv\�sZ�\�nwv�\�瞱�\0;�\�\�\�M�\�6n�\04)�����	N�3Zw\�u[�\�)e\�\�M@��j\'K�5\���\�rB��\0�)R\�\\u\�U1U\�M7\�\��\�����\��\��K\�7�L����\�\'��\�G��\�\��\�t\�M[2\�W�h����4@�vj�7c#Z��.bY\'!$\�3\�\�s\��]�\�~Nqj�\�V���B@���8\�\��\�	�O҄�ީ�J|9\�\�	�l�0yķ\�\�i��uS�TA�V���\�?\�N��f��\�$0� �\�\�\�\n���	(@�M\��$ 	T�\0Dc�\�\�>�Q7��;EzI�\�)�LV��tC�\"�\�z\�\�8��\�\�ԩ�\�\�9`\�09\�IGC\�\�\�?<\�rO�e\�2�;=�?�\�!Ț\�=\�9ω�y�\�%S;\�@�$N�����b\0���{\���b\'[�1Ax!\�\'>\Z\�\\\Z;���je4�wi��]\r\�4�҉�V�!�O;\�6$5s�\���^���E������\�;R��9\�hHk\�x\�W\�]w]U�e����)MYcڞ�\�1\�\�n\�H?D\� 6u\ZX����\r��)Jޯ\0�}\�x\�;·��\��i�R؛�R��\�\�YkeGZ[��\"\�\�B\�tG��\�͎,\�8\�s٩DJ�E!\�n)�H\�(�4\n �с0\�x\�Џ��E��i��E\�\��\�\�c�F?$X\"\�\'\���\�#��\0\�;�\�w\�\�̃\�P(��D�x\�\� *\�qj�\�8u�Ӓ�$0�m\�\�\�M���\0A*$\�\�p\Za�\�7oIa�`+\�\�\�\�7��ݻ\�N\'xH0��\"�Iz������7\��\�\"\���\�tC�\�㬳\�\Z\�\�\�/~qLӃp��O<1\�>�\�(l0Gҳp\"�\0���-E�\�%M�v\��v�\��\�&e\r\�{\�\�#\�<�\�_\�j܉\�\�\�@n�qI7D@�\�7��&3��̱1�\�ʡ)��\�N;-Q\�\�IpH��\���~�\�߆��\�/2��1\�>�N�\�dbig8E\�\�i������q��M�sz\�;\�s\���@->A�\�g\�E�v\�^�����铝���\n����vH\�Cm�?�=V& �����\�?�9�\�פ�!U\��B\�\�1b\�1�\�\Z+��B|\'0k�q- �0�\�#\�\r��!�0�ɓ\'ǚ\�\�:E\�b\\\�5<0ox\�Z>�\�\�l�� >�\�CR����>\�Y%@�Վn\����\�=�\�<`n�\�řa�\�&�D �q*�g����E{\�\r\�\\s\�\�\�$�q��wEڙ\������\�ʀ\�\�?�HqxX�,s��u�N�\�7\�\�\�Fmp\�H\�E\Z.\�D�Y�ͻ�\�`�ڥ\Z+�/\�8\�#i~6��	sH�:\���\�\�Ao�k|z��I\"\�R\�Q\�od�&�\0�7Q�����\�sӧL��\�|9\�Y�\�{Փ�D=��\����$\�N�Hc\"D�JIS\"\�f&���Vi	ڒև�\'�\�n\�F\Z��� \� 8�c��� >�)(MP�\�($hGP��;\�ç�3�\�yI�D��{\'M�۱s��#�\�	$�Û�&W�\�|\�3c���d�\�\'\�lK�\�7�\�n�!��$=׳���8��)��xe��ݸ\�����9p��B -\�Vŧ\�ӎ�\��S!\�\�4�)�\'v���M0#\��\���\�1��.\�Xc�\�5�[�*���\�+#��\ZS3&8L\�!��5{��;b\��|!h��VYe�؞�)\�\'5ZD&X\�I\�\"g��Bx ؽ\�;DQ+�+l%@��\�>�P\�Ӻb� �����	\�\�Y�o�w\�1�9�\�a�\�\�d]c/v�1�9\\q\��E�R]\n�N񰓟6���\�ܗv\�\'�퍩��Y\��\�hG�Y�\�/x\�HՅ��a�$*v��\�G�>\�:Ʒ��\�\�g\����h�\����\�j�\�K戠¸�\��\�\Z\� �>��4X��\r\�z\���|c,~\�3\�;�\�<\�<_�?{\�K_\Z�+\�R\�\�\�\�u\�{�wBc�]w\�u�P��\�_�:\�\��Lr\Z\���\��\�\�=���\n\nY\�J_\� �\�\�M�$�J�E�$���/\n���\�H@ț@7\"�\�,DTA�țŰ�GP�\�_�rZ\"P|&�:��[�\�F�8�\�\���*�\0�Ap�,Ź����\"*Qp\�\�ժ^F=f\�\�vŧ�\�!D\'Rz�u)@(@�\� \n\�k\�(��D��L}P�\�]enT���+4D�@ed ��I� \�\�Q�/j;����h\�\�\�x9�!O	0R��\�՜�\��\0)}ʸ8%�oR\�d-�N�f\��p\n��\�e��\���\�D@J=U%۪d�HOŉN<��\�,@P��N�k��q�<äs*\�R�P�(t�)@�\�\�%P*�9�\��N�ϱW/	S0\r���3\�F\�sf��\��Tu�\�	H@�\rR�\�F�6.\�l(�\�IQC~\�f�|�)\rN\�26$\�\�Hcĺ\"u�\�\�H\�c)m\�H5D\��|�\�5@�y뭷\�\�|F�W/�\'�N��vk��\��f����TJU�I��ЇIm	�Ƌ�M/�30IW\�\0�\0Q\�zS�(��K@�@	,B]d�E�.	H@h&\�	\�\� 	�ן\��\��ַb\�\0N]�z\��.�\�}�Ѱ\�.�r:�-��8��j3��	\�-x�*�|0P �B\�\'�|rL�\�,Rx�珚�/�R�P�(t\�)@�\�\�% 	H�\n%@v׀$ 	t$�U���I���F@B�\�5�\0Q(^;�@�L�T*n��\n9cHL�Đ8\�iJ@\�@7�YxH][��\�6��$ �B(@(@��\Z�\�p\�\�K�?�P\�߇Π?\n�q��	(@�\�\�;% 	�W\���+�\01^W��$P\n\n��VO@�\�\�%P*�Rq;X�(@T\�Cb�Đ8\�iJ@\�\0Ĵi\�F\�\�&<��\n=@��$ 	d\"p�����[u�\0�\0�ia�\�H�_r\�\'�\�P���O��\n\�pv��#�\0\�j��$ �f\�n�m\�f�m:�xh�Oµ$	H@y\�\��HB\"\�5�D_\n�\�s	�J@�T\�V!\nrƐ��\01$�v���z$\�\�S�W�\��\�% 	H�#�~N\�)@(@�X)@�\�\�%P*�Rq;X�\�_�(̞�@�>er��jo\�ĉÌ3\�GQ{5rI\n�\n	H@ȋ�D^$\�G�� \�OM\"�B��B�ڹJ%�\0Q*n�@\� �FW� *\�\n\r��$P{\n�w���$P)\��d$5�.�\��\�\�>w\�n�B�D�x\�\\�P�(��I�o\n}��̍\n�q��H@�=�ڻ\�	H@��nD+!BB�\�E�\0Q(^;�@�\�\�[Ǜ:i�R\�u0	��)�\�\�_b�|\�% 	E@�(��+	H`8	d \Z��\'�x\"L\���a���j	\�sf�	w\�f͚UԱƧ\�z?�����/^���I\�頕��s\�\�AYǲ�$ 	H��.��}v\"�\0\����$ ��� �\�t���\Z\�~$ 	H@m	L�0!l}\�G  �yJ �\�j���$P��X;\�(@�$ 	H /��ȋ��H@�\0<\�\�:�D\�2ݥ\0�	��$P�`���4�\0\n@�ˎ \\ ��$���Hڏ$ 	�\"@4�t&��Ƨ\�z?\� \n|~�pP�\�ٵ$\��P�\0˦㊀ĸrg-&�\0Q7i�$ �ZP����4R�@mt;\�(<�I)@(@�� \n\�k\�(��D���B *\�!1EbH\�4% 	�@@�\�!	H`�� .��\�\�k.ACB�\�GD�P�v.�R	(@��\��*D@�B\�S �\�\�NS�@	 J�\�����\0Ĵi\�Ff\�IxH�  \n}D \n\�k\�(��D���B *\�!1EbH\�4% 	�@@�\�!	H`� @l�\�a�m�i{\���D���D�x\�\\�P�(��U�����\�\��\�S&WȪ��L�81̘1#q\���W#�$�\0᪐�$ ��(@\�E\�~$ 	H ����[�ZjGHB�ЧG�P�v.�R	(@��\��$\�7��\�U\�F�ʸBC$ 	Ԟ�D\�]\�$ 	Ԟ��D��X�P�v.�R	(@��\��$\�7��\�U\�F�ʸBC$ 	Ԟ�D\�]\�$ 	Ԟ��D��X�P�v.�R	̙� �7u\�\Z��\�`4S0\r\�\�7�\���\�K@(��DQd\�W���P�P�ȺV�j�\0\�6o��$ �\n�u��1$�(@����$ �(@�\0\�!$ 	H�#�B�B�ڹ$ 	�@@�\�1���B���\"�\0�I���$ �~	(@(@��v2ݧ\0�	��$P�`���4�\0\n@�ˎ \\ ��$���Hڏ$ 	�K@B�ߵ�\�>�L�l$�Z�u-ܤ�P�(\0�]*@�$ 	H�\n�`v	H@\�@@B�\�D�P�v.�R	(@��\��*D@�B\�S<1$�v���J �\0Qd���$ ��  \n}D \n\�k\�(��D���B\�&@,�\�2\�\���w$���ۇY�f\��\�?��?���Z.�\���n�w�9���\�Ιn:�S��~�\�s\�;\�\�o,}�Tmܢ\�i׿\��睖�^9Wmܼ\�\�2�u6\�&\�s\�5���\�\�}S�7?\�ߋ/�{�ߗ2}o̲ފ���׸y��\��\�\���g\�\�\�k�\�\�Uw\�\�с;�{o�\�\�\�\�\�]\'l�\�\��o\�^\�l��a>\����o\�\�\��cG���;�~\��r�\�\�<�u,\�I@\�P�(���W�@\���\'�3f�#�8��P��#O@�@$ 	H /��ȋ��H@�@�\�k|z��\�M�\�Փ\�<�a�H@%P�(�CT�����\�\��\�S&WҾf� j\�&���\�H@��Z�I#% 	�k\n\n�.p�B�ڹJ%�\0Q*n�@\� �FW�=QWh�$ �\�P�����$ �\�P�P�(t+@�\�\�%P*�Rq;��&�\0\�7�\�ܨ\0QWh�$ �\�P�����$ �\�P�P�(t+@�\�\�%P*�9�\��NZ�\�qL�&`\n�A{`�\�W�>�;c	H@EP�(���J@�@V\n\nY\�J_\� �\�\�M��$P!���3�\��!q�Ӕ�$P� ;�$ 	t$�\0�\0Q\�#�\0Q(^;��$ �(@�\0\�!FP�pAH@�@^ �\"i?��$\�/�~\�N�� 2a��jA�L�p�F@@�\0�vّ��D���\"�\0�I���$ �~	(@(@��v2ݧ\0�	��$P����4�\0\n@�K׀$ 	�B@�\�\"	H@(@(@��(@�\�\�%P*�Rq;X�(@T\�Cb�\' �\�\�NS�@	 J�\���$Б��D���D�x\�\\�P�(��U��D��1$�(@����$ �(@�\0\�!$ 	H@�\�\Z\���i!�ŋ/�\�r�r��DVR��@�	(@T\�GZX�b�\�k{\n�	H@ȋ�D^$\�G���%0\�8�X\�\�c�n\n����\�\�\�\�D(��D	���\�/\\f\�} L�2���55q\�\�0cƌp\�G\�\�^�\\����B���\"�\0�I���$ �~	(@(@��v2ݧ\0�	��$P\n�p�FJ (@\�(@\�߇\�@�@U(@T\�\�!	H`x	(@(@�� \n\�k\�(��D��L}P�\�]enT���+4D�@\�	(@\�ޅN@�@\�	(@(@�� \n\�k\�(���y\�xS\'�Q\�&�A0Ӡ=0|\�+@�ϝ�$ ��(@E\�~% 	H +��k��v\n}a�&	H@��PW\�Cb�Đ8\�iJ@(��D	�B��:P�P�(�Q�(��K@�@	 J�\��(@� $ 	H /\ny��	H@藀�D�k\'\�}\n�0\�H� `\n�Z�I# �\0Q\0T�\�H@\�\"	H@yP�ȋ��H@�@�  �];�\�S�Ȅ\�F��P\�\�M\ZY\0��ڥ�k@��J!�\0Q\nf��$ �  \n}@ \n\�k\�(��D���B *\�!1\�C\�h�)	H�\n%@v	H@\�H@B�\�GD�P�v.�R	(@��\��*D@�B\�S �\�\�NS�@	 J�\���$�\0\�e\r�y��\�\�ŋ\�f�Z9\�\nJ\"+)\�I�� �\�#-,��D1\\\�=W�$ 	\�E@\"/��#	H@�t{��\�\�7�~WO���pP�al\"	�@@�\�QI�.\n�\�>�O�\\I����8qb�1cF8\�#\n����.\n�\�\�H\�g�}v�ַ����ڎ\�]x\�\�mo{[!6�\��7��M\�k��\�w\��|��᳟�lX~�\�K��\�� z%6~ڳ!j\�ܹ\�.&LG}���\\�\���\����\�\�\�o{Xu\�U\���\���,�q\�\�\�|\�\����\��0�\���Dxы^4�TŎ�L>à�\�\�tP8�\�C\�\���w�nr\�W�g<\��`	\�\��R����_�@�	(@(@�� \n\�k\�(��D��L}(C����\�\�	\'�����\� \�\�w\���D������O}\�Sa\�w\�o��\�<\�[o��\�\��=�~n����\�yꩧ\�i��z\�!�~@V���\���W��\��\�8l�\�V��%\�=k֬0s\�\���\�f�mGv\�i��\�RKUnf�<�Hx\��\���\�h\�\�?��\�m$���}(�s\�9��^i��´i\��O��[n�\\\�.cnYF\�9�\�c#\�\�7\�<��	����0��\�K\�_��\���W�b�\�&X[\���\����,\��ԦَA	!=]b\��c�9&��\�/{\�w%\��`U�腖m% 	H�\n\nE���> \n\�k\�(��D��L}(C��馛\��	�s\�a\�}�-�\�C\'h&�\�w�D\�+�z7H\'�\�zd����\�@o�n��\�h>\�S\�;\���\�?�~��\�\�\�~wx\�k_[�I��@�\�Zke ��\��K.�$��\�o\�|\�\�w��]|N\��\��Ɠ\0�9_�җ\��\�O^~�\�a饗ΕQ?s\�b@\��#� Tv\�a\�\�/~q��Gڤ��\0A\�a�u��� \\|�Łw\�9s\"���\�oQ\�u�,5ۑ\�,m�\����\�a\�-�\�\�|\�m��<k�\�	-Z�(|\�#	�\�Ke\�Y��\0���\�$ 	H�(\n\nE��دD�x\�\\��3oAo\�5J\��$0h�`\Z\�R0�E�@\�\"(|ꩧR8\�\�Q�\�+Z�\�N\�`�*\��\�??�n\�U�zU8ꨣZ�\�P���T\��)\�\����%�V~g\���2����u\��\�a�|%w\�q��V\��s�\�_��q�\�;\���[�Y\�Op�\�_�r<\�	�^S\�\n��>$��E�\��\�c�\�bD�\�t�oēO>>�τm�\�v�g��=��}�c[\�v�\�q\�=�\�\��&��^\nu��vK@?  \n]\�\n�\�s	H@(��E�� H_B�%\�X\'p7eʔ�����\�*P�\��ƚ���zLw\����\�O�\�\�\�Oo|\�G�\0Q\�\�2�!:	[\��\�wc��\0\"Ah\�1m�\�FK����İ�\�٩ͮ~�Ƚ\�8i\'\��~�Չ��2\�unY\�\�:��\�?��@�\�x㍳t=�MV\"�G\���⏬!@\�x\�\�\�xGR�Oe��\�vY}��];\�y�H���\�??p�eN1ױ r\�ig��$\��>�M�[ ����$ 	T��D�\'\��ַ�\�\�\�tE�@)��)|\�nv�\�r\\&\��ӟ�4\�t^y\�G�W��\��U���fh�u։u@~��߇\�o�=�\�\�8x\�\'b�{x!\0\0 \0IDAT�|�g�y\�E�k(�\�\�=�XL9ƚl�\�7��XT�TG/�\�\�\���\���I�F\�-u*���~�����[n��O5 ��5|�\�\�{H�D�$\n�S+�\�)]i�e�Y&|�\���~z\�o�\�v�\�\�K_�\�ش\�s�\�v\�\r7\�{m\Z\���~�Cl�\����A\�\�[1���)\�\�h57j*�Z�82G\�P�� R2��N:)��\�m\�\�\\l�TI��\�\��\��C�cb\�\�9a�Niq���ZԷi<\�\��\�_��p\�!�D?Ϟ=;��\06�\�\�_�R��^xae�\�c�\��6�\�\�X�\"	Fش\�>�D7�H�!\�\���e1cƌh\��^x�\�\�N|�%\�\�s\�\�Gzβ��\�zFHf]&|\���9\�S\�_q\�[��\��\���mI���\��l ����\�+�;��l\�\�^7\�D�F\�\�\�\�x)@\�\�k\�,	H`|P�P�(tE+@�\�\�%P*S0��\��*D@b�3�H�����$�V[m�Q�g R�t\�\�\�y\�{F�A-\0\�p�\�/x�\�\� *�P\�lJ\'��n�\�`�\�_�\�\���\�߱�l7�>	��\\�i�;d��	\�\"�<�06�T��C=4�cg�qF7��\�D��@4B	\"vr��`4�\���wŢ\�\'����c�\��\�+M��\�7�\��\�;/l�\�Q�^�ܤ,\�\�[��G���\�-q�;�\�iC\�\�cl\�\�	\�\��_��WLy��e	B򓟌\'�H=\�i$lb��\�mn\�8b�\��\�4Gܠ�颒\0�\��>�\��\�x*_#:৔\n\�Z�[^�\�\�`>b�BQ�\0A�\�]k��F��?)�p��;\�3�{\�\�կ~uL\�C0�\��B��p5b~ǿ��\'�j�\�H����\'IH`ެAlc�{\�~d�u{�\�#�_��_q��mN\�z\�1����,�d\r�[Ϭ�\�� $\�㎑\�~�\�v\�y\�k�\�?�y\��\Z�\�A_<�<W����J�x>\�\Z�%\�5�\��\Z+�;�B�ڹ$ 	d �\0�\0�a��\�D�v\�)���u\�<�=eP�\�_�hW:�\0�vn�mum�\�&K\�\��,kMu\�\�[O+�lǰ\����lz\�\�>V�W�z�\'pH\0�U\r�|%O�`���`�Xs�7��$�1f\n��~�����\�\�	Js���\�M	D�˞!�@,\"A \�rmZ�1j��9\��\����\"�\n��\��\�G\�Nxj>x\'8\�Ns.�&ȍ�N�Έ\�դ~\"Hϕ\� :�����\�-�\��Nh\�?��\�=դ`^��@\�y�����\0\�<g���~��\��t���M3?\�E\�\�L\��	\nv\�7�4�F\�B� `\�X�n�i\\ci}r�d�\�w�0o\�Y�\�\���\�\�\�\�h��	�#4�\�z\�\��\�N�IAj\"�T�Oݞ!�\�\�\0�<�\�,k�ٟ��\�\�\�s��(\���\�;�\�<Z�\�$\n\'�\�\�\\�XO�\�JsK���\�\��\�f�mV\�W�D-ݦ\���\��B�D�x\�\\�P�(��U��\�hg\�q\"/�\0+��,�DJ�l\�)xz\�]w\�\�ڤ	bW3A\�.� \�F\�n�\�\�4\�n;\�[��$pJ`\�u׍�zx�Rp�]�~N�!N \\u\�U1��\�\�\�p���8r�d\�Հhn\�j�\�ƚ?�я\"W\�&L\�4�n�>���EF\�}\�s[��\��ݭ�D\����\�)�ݍbE\�\Z\��Z�\�A��.\n��\���\�\��\�fG7b\�ԩQ\�@\�B�+�\0��ʲV��3͵��܊\�XNj dp\"	��\��#8�И�VY،\�ER\�\�\n%@v	H@\�H@B�\�GD�P�v.�R	(@��\��*D@�\\�S\r͹�	���]\��7\�H�B�`]��[��\��e�\��\�n dG>AxR\"�@2�GD�{\�g\���Z[�������\�i�\�]�\���TG��49�I\�C���FD�8\�I5E��[]y\�\�\�v\�mG�O����\�\�\�\�ƍ\�8\"@����c5Ω\��N@��*\�ow??\'`O����i�V�\�$߳.HmEʩnvd \�]Q\�,A�VL?\' H�E\n�^\�s\�,�Az-�<�\�S1mVJiָ6`\�	�\nO@��n��$ 	H P�P�(�iP�(��K�T\n�\�v�\nP�\�\"O@,%\'w�Ng���%O;\�KH�B�ҟt��(�\�_\�\� z�\�.x\�*m=H�v�X�ʲ��K��\�;h)��mAŜ0!�bVPY\�1\�3@Q��T̊*�� ��bq�\�\r���\�=�\�NݦCUwWuU\�Sk�\�\�U\'<�Tw\�~\�\�\�9�s9IU�\�\�\�|`\�\�(g�\�-imKPp\�y2\�=i\�$+�)jCb�����Xc�5l킯S��u�*�\�~�헵u6���8��F}\'*M�j%(\�D��\�ͥ\�\�\�Q�)e�j�\�Y�\�.�N\� �v\�m��)�4�l5 \�|�s\\y啭�\�;޴SZ7JO�\�3Ϙm�\�\�^��u&\�\\\�Ss�MUWa�\����[�\"�\�\�\�8\\�}���h2S0i\r\�.\�\�tW�֑ꁨ@�c�+��Ʀ��z!�\�-��)�=5ޠ\�9\�EA�\�?��QBJ�\�\�\�!5 �}s6 \0@ �P\��P�\�8\"%�\0)n:�����	Sf���5�ѨrE�\�\�ڵk(\�\rS��\�\�s�e˖�خR\�\��#\'�\n\�*� \�ܔ\�\�o���U�sEF(�\�i�q\��\�\0\�r�E�ڹ�t\\r0�\���U\�A�\�{��{\�Ey���\�Fi��>[\�J�\�V��\�Y�\�\�ԧ\�\�V[me�2\��+ǵ֟\"���g�oVԁ�𫾃\n)���JY���첋Q�ݿr�\�	��\�\�W�j����\�\�nl\�[i���\�I�\�=��Y$tx\�\�8�0\"\�\�9\�o(2\��� \�»S\��V�m77LV\�9�\�VQ\Zg��i��\�/������\�vG�&M\��e�3\�;\�ap�\�5G4\�˛f\�\�@<�\�0a\�+���\�u\"�\�+�S5E�=��\�J��6e�l�[�\Z�7�C�0�R\�uZ+�e��dW\�\�\�8��KvT�q\�\�\�JL�5kfׁ\n-��q\�\�\�!\�UE��u\�f�S�`�\"\�M�65�����\�m�\�-HE\�վ֥\�\�AkU�$\\�H��B<\�k=+\�C��R�IQ�vW\�]c\�}��g��Ʀ�z�|k\��U!nͳ^�z˙P�ѽ]�`Y\�/KR0U�>}C\0�� @ @�z\' @���\�!)�Hq\��&�dB��裏L�^�\�o�a\�[o=�+\\N0W\0\�	:W�T�\���G��5�/\�gǎk\n\�:�E/�X_(�J`p�r\�{\�\�ȹ�\�s\�Y��ֈ��r�ʹ�\�\�\�9\�\��:uj^B��3^J9U\�\�\�:U\�~9{4h`w\�K$\�\�j\'f��c\�\�sUN|\�v�\�!G\�k��f\�r,ˑ.���\��쳏G$aC�\��]\�\�\�XW�m	�-�\�h\��\�\�޽��5�T3rL�#[\�v�\�\\\�{KB��)�\�V��D	=N\�(47�~8j,��U�rkr�\�\�6�L۪���\�Vņux\��o߾�e������kK+�NQԈX�_	0�5DT\�9����DP\�rث=E�CkLkD\�\�T��\ZJ/�C�\�\�\�\�n�O�TD�l��\'qDkM\�\�Z\�w�\�8d\�{H���h\�Rl��\��꾑���\�;[Ovw�\�Z\�Z���\�`o��B�\�\Zϵ�U�EQmnm\�Z㪗��|^I ��ٳg\�\�\���,\�ڐ�\"n�v\�rŧՎ\�H�\�|�\�m_I= �j9\�\r@�z @ @��� B\�K\���\0D��\�E��\0Q��C�\"d�4��@�\�]��P\�|\��!![�K�3(f~7��Y�Ym*\�]LQ^#Q*W�i�C�b$\�H̑Ȓ\�\"��c\��\0��\0D��\"T�4�H	L�:\��עц��Kg�4R0ն�v���\�v׮���x�v\�\��Ю^9�FF��&W\�8��\Zq�FicA�(�_��VԔv�+�\"3��\�}UC{�*PpE\"dl�,@\�wA58�-�A��FR��\�K��$[��C\0���d�P�\�8 \0D@�\"\�\�J\��\�\"S\�\�gU_�\�y7\���W?A��].����yf͚e�t\�b\�\�r��h�\�OQ\�)\�\��\\\�\�TSE)��\�`�΋,\�sP��\�K\�T\�{H�Rԃ\"\n\�9\�D\�+c�8�@\�@ �  B]��\�q@\0��\0D�\��\�/�\\�\\��\�\�0\�3P��>\�S��J�\��\"\�Tc�\�fH�����xP\�E8d+�\�\�k���-�Y\r�� ��\'\��\0r@�@���@�/�C R�`�7�ň\0D����� @�\�\�L�@ \"�L�\0 ��\0D��D�xi��u��\�,F bd��\"%�f��\0\" �\0d��\0 \0�k@�\�+c�-[�,1˥\�ʑ_P~Iq\�O\0\"�6b�\�@��+�\�&�\0�\�\0 \0�r@�(Iځ\0 \0�b	Tڏ]��\�\�\�\r�\�\�\�\�r\�G7�D@\0\"\�tK�4KU\n��\�\�\� \0DJ\0\"R\�t@\0Y @ @�zc @���\�!)�Hq\�Y� @\�\�)\nDJ\�4!\0D@\0\"\�t@\0y	 @ @�z� @���\�!)�Hq\�Y�̜��L�2\�ԬI�F�{(�\�\�7W\\q�\�ڵk\"\�\� �\'�\0���\0 \0�r@�(Iځ\0 \0�b	 @ @�v|]�\0\�\'A  a&	�\0��E�\0�|2@\0q!�\0K0�$P�\�#F�_�\�r\�!f\�ԩ�cǎ�s\�\�\���\�rS\��S�L1�>���[����\�++2ݸ��\"��\�\��\�k\��}ӯ_?�\�Zk����is\�̱�>�\�\�z\�WTi�\"\�5�\0*^\Z�@� \"\�Mg(�\0D\�\�bs!DlL�@ \0$�\0D0.]�\�|�\�\��\�7?���\�ի�Yu\�Uk5��\�?�\�o�\�\�w\�}f�\r60\�w�uNg��\�\�8[�\�}�]#\'\�\�o�m/^l�\�{os�\�g9 \�ի����\�\�G1��\�mD�ꫯ^P��C���\�7������\�K\�u_|�0`@����暦u\�\�\�\�3\�4tP\�yd�\�ꫯ�=\�XBBϰa\�\�\�?nn�\�Ӱaè����  B]��\�qDJ`\�\�ٶ��6��_:�@�	���\�H_�\�93�\0 Przʹ6h\� s\�\�\�& ��\�\�h����\�o\���\�o\��\�Z\�L�n\�L�\�\�\�I\'�df͚ew\�\��\�K�.f\�W\�aL\��\������\�Ο?\�\���\��\�k�5M�65$>��Cs\�UW�-�\�\�\\���\�1�\�K/�\�>�\�\\v\�e�\���\�[\�A\�h\����\�/\�.y�T��r��7o�8p��\�\�,�0\�L�q�6b�-Zdl�9\�Ĉm~ױ\��2�Hl{\�\'L\�޽���(�m�\�D�\�\"T�4@\0�u�\� \0C@��]\�M6\�\�:\�%Dt�pA\�\�z5_\�:�9j��|ڴi\�	\�կ\�+���7\�ͮC\�\�3\�8\�\�\�q\��rɒ%\�\�[o5{ݭ\�\�P\�@�=̤I�\�<`6\�x\�Z�}�\�wV�\�m�\�̍7\�X���~\�\�\�\�\\B�\�\�6\�\�\�%5\�ds�+�\�\�O�\"���c\�ܹ6Z\�\�O?5O?��\�z\��S\�\�E=�\���gϞ� ��c�\�e\�\�N}\�\�@Q-�rd\'�\0�\0꽁\0*^\Z�\0 \0� @D\0�.j@�`A@\0�@���\\iX�G��\�7m\�,k�\�I\� ��]e9�\�g�j(\�vu�z\�vg�_B\"\�a�fE�l��V;\�_|�EӲe\�Xb���믿��\Z�\�\��+@�M�\�5ט�\�{\�7c�c	C�P\�\"B\�ό\n�;��\�����k���]��\�s�iРA\�\�LL�.V�P�\�8\"%@\n�Hq\�Y� @\�\�)�W����A\�\����_2���i׮]J�0M\�& \�\�\�[K�\�+\�!\'@ >��s���\�HV\\y�Ѷ;����YN�@�\�n� ��\�G}dS�\�|�\�Y��Q�ر�V\r\n\�VJ��\�:\�L�8ѴiӦf�r\\���Q)}\\\���\Z�=��mC)�:t\�`ƍWӆs|KdPd��m\�vw�v��Ý�kl�}q\�M7\�\�|�M\�\�5j�\�k��lt��+\�|r�ŉ��U=	\�I�84?�M\�ӧ����\��3��OE���w�RHi\�x`M\n3}�4R��s\�9Ǧ\�\�\�\nU+ݔ�VԈ\�kԨQ�-�E@���\�;\�\�{ΦlzꩧlkEJ(�i\�M7�\�i�:O\�F\�7J�u\�E���:�&=T�qxkQH�x�\�o�ٹ�����l�(��_~\�\�u\�]f�\�\�\��\���\r\�TW]qv���L[��K��$[��l>{�l_v\�X\�FcS\���\�/7�z�\�\�\�{C��d�\��\�2;�\�-�l\�x�m��a�q�;v��$Y?z֐\�.��B�\��\�\�W �C@�@�ue\"@���\�!)�PG��\�bD\0\"F\�H\�P�Ĉ�ט�sk\�d��\�x�\��o\�.\�H@�UVY�\�\�\�}^�91  \�r�{�U\�\\ǬP��9\�\�1f\�M\Z\��\"�\�r	r\�2\�<�\�\���\��\�\�r\�\��ظq\�\Z\�sf�~	\n/������p��\�ԩ�u\�_r\�%F�ԏ�\\��\�kw�\��,aC�TBNl�#\�B�#F\��䘗�V�\�衇jv\�\�]\�\0�:\�\�\�9\'\�\�\�=�\\;\�\�ȗRȵ+aA�ĲBc\�ׯ\�*��\�\'���\�\�F�(\�B�;䋒�_�~\�\���\�p���&K��3\�\�|�\�W\�㎳�����\�\�Ǐ���ZJ7��e{9��^��\�����.I�P\����J�\�۷�c���\��\�:\�\n7\�p�-x��\�\�5!����\�Phr\�K\�P���^\������VZ\��M����������\�t�\niK�\�uOx\��?�`ǥ�$aK\�\'\�í\r?kP\�˖\�t^w\�q�-��Ng�V?J�%[(=�\��\�\��fE4\�:�\�?�� qD\"�c�y�\�,\�~׏�ԧ\�qd\'�\0�\0꽁\0*^\Z�@� \"\�Mg1\"�\0#c�d(�`J���& \0�\��\�:\���!7<`�x|\�\� �	J�\"g��\�ݻw�١.g�����w1��CT\�dڑ�h9�\�?��\�m\�\0��v�o�\���\�H��β�R\�\�\�\�v\�Yx6q�E\� �M\�\��+@(BB\�\�ٝ)td��\�Wڵ~\�GԠ�ؠ1\�^P��\�W_\�\����?�P\�\�\\`�ޙu2��_9�%H\�\�\�\"(�\�r\�\�9���W�t?j[���!79�嘗\�\"�f̘a\�%�>r;\�]����\��~Ƒ)8��\�-\�3gδs�0\�\�\�\0E H\�\�h��|	\Z�֑c��eS9�\0\�g\rJ��\'�Ms�ۆ�>�\�3F�\��\�x2Yd;/\��\�}���\�TYy啋����\Z�P9D�xi�@��7�ň\0D����� @�\�\�L�@�	\�)�<�z�\�S���{�\"\��A\�\�\�-g\�?��O�Fiw�<�HӶm[3p\�@U�p��v\�kW|�V��K\r�9z��^B��\�Z�s*7o\�<g-\n?\�\�\�s��\�OM	�\�\�%�\n�e��v*\�$��Y<$iw�\�	�s\�+Tx\�f:���e���H�P\n+\�R\"Ӧ\�\�[�\�q��\�\�W�\n?\�($@(\�\�UW]e\��َBn�(b�E�+@\�:\�k�葠���:u\�1J ���Bl�U\���j�P�\�8\"%�\0)n:��#%CA�H���& \0�2P�t��юh��]\�\��A�u(*��\"6\�pÚ�8�{��x��\�k۔<NT\�lKN\���\�\�\�rD˹~��\�[\�)sW���g���J=�y�k7\�ؔ&H5��_\�2\�i\0��RXI(4�-Z\�����O�p��>}�M��\0J;�T9\�E@h��\" ��\�{d��M�K��\�tS\�P\�p������\�\���m~�%\�\���\�eP\�\�U\�o�R��(���\�\�kڴiVLSZ*�� Q�\nA֏\�(5���  ��m�}\r�oT��\�@����`Hf\�[`&L�ej\�$�\�\�l���\�2\�\�\�H&�dڍQC\0�#�\�R\�٪V�+^�\�^\�z���	һ\��J\'$i��ֲ��\��sX�x9��[]Ng\�W:!�@R��/\�U*\���!ǰR8�P�K{�\�6\�\�\�7S��I0���\����ݭ�\"\�\�C)~�rH\"\Z�\�\�\��\�R��\�\�L\�\�\�\�EA(e�R\�(m����j@\�\�Lg�\�U!h9�]D�s�+@�t\�e+B��\�l\�M��O8\�+֨=7\�\�Ç[��w��~ơ�e{ՕXm�Ֆ�ܺP]1\�b�-\��U�Zu\"�6�\�=!1D�J\�\'S.�\�\�.5N�+F\�(U�����j@���C�@��R�<�Hp\\�@���Q�@�H��@�H�\r� \0��@�n		r�~��׶0�\�\�\�ZR1\�ɓ\'[\'�\Zk�a�*�\�c��\�N���\�?���\"\�	ƍ`\�\0\0 \0IDATW\�s\�\�W~~�~z\�7l��z�\�\�]\�\�[;ᕧ\�w�\�Rj&׆�YK\�֭�M\�]\�\�C\�2�- ��\�r:7k\�̦\�R\n9�-дiS�\�/���\�_?\�\�\\1d9\�]e9���\�\�O?��H\�\�	\�\�~\�R�_��\�X\��ζsѢE6M���_|Ѵl\�2��\\\r\�\�Ȭ\�\�\n\';��������\���\�?�����\nG� �xK:\��l\Z�\�í7g	:$(\r\Z4Ȋ[Zk�z3���(�\��Eͯ\�8^~�es\�M7Y!j����E�զ֋R�I8Pqf�\�&M���[E�h�(\�F\�I�(�u�18�\�\�ZZ\�$^(5�֩�^(dw�%qM\���8Hd\�ڔ\'!N�\�FZ�\�\�S\�w��\�N��c\�I�t���\\\�\�\�}�\�m�~֏�����Z��u��\n�PW9D�xi�@��7�A�hE��ͅ�1�\0 �x�L\�vMO�4�\�B�FP�|9\�\�\0V�[Eds*g��\�Gق\�r`\� t��r\\+M��\09�;v\�X��q)\�@b�\�\"Ƕ;\�\�՗\"#Ԇ�9\�U�ZQr\�J���\�K\�e�hР�\�ݻ�4r6\�9�տă\\c�zR\�k\�ÐcX�]ي.\�\�~ƒ�_E�(m�\�V\�\n�g\�l�PP(JE\�Ix�\�\�E��L\�,\�ėS\\\�*�Jx\�\�l�\'E�(퓜\�\�\�a�j��\�on��Γ��u%��\�u(\�瞳c���\�%�k׮f\�\��\��Ji$H\"�	\��!�@k@c�\�dw���E�H�ҡ{�C�V��0�\�:\�\��H����\"�^��(��\�~�\�\�\�N��c�	&\��Lž5V\�W}\�\��\�\�>�\�Sk\�\�2\�	\�u�ϵ\�Mڷoo\�!	\Z\�ֻ\�\��Q��\�{\�\�r\�\�N\0\"\�{\"T�4�H	L�:\��עц��Kg�4R0U\�\�\�\"}6g\��\0\�\"�\0Y\�\�G@���\�\\;�\���~�\r6��Bŧ��R\�9\�%[P�\"��`�J%\'�đlG�\�\��\���)/i�c\�j��\�\�OD�@�u�#@���\�!\0@ ��\02]\�\"�\0���\0 \0�r@�(I\�	J@��U�@�\�u(\�B�ε\�?*G�v\�k\�RB�ݝ�:.mP����L�\�|9\�\�z\�-��+\�$�\�\�\�n�A�����\�l]\�|  J]Cy�G�/�C\0�@ \"�L�@\0�\0D(Xi4\0	J��\�ӯTJ\�֡\�?�?��?ڙ~\�}�\�z	~E9՟z\�)3v\�X�ʪP}��\��v\�Νk^y\��Iūs����Q}٣y�\�q���~�F�&J�\�$�m�喱�W��\0�\0\�\ZD�/�C R\�&|l�h\�\�|��/l>R��\0DZ,�y[0@\0I\'�\0�t2��T\�@�-T�gϞ�^�jI9\�`�X�믿�C9$ȥ�\�!�Y�\�[O%�����~�\�Gmz�4T]��\'���\���\�qDJ`�-\���;�0\���@�H��\�3O��؂�@\0H:��[��C\0�\'\'@ht��9ꨣr\n��b�P�\�8\"#0}�tӰaÚ�T��(�\��\�Q�	 @T\�\0)\�\"�Fg\��\0B\"�\0X��\0 �rN�PĐ!r	�\�.�\�qDF@?#G��\�(�\�\�\�Q @\��)D\�\�t!\0�H\0\"D�4\r@ \�2�B�;�BD��\nD�xi��1cF\�hEE4h\� �1\�	*I\0���\�\�7D:\�ά!\0�A\0\"��	@\0��lB\�\�ٳ͒mZ�=\�\�\�\��L\�\�cBK�]��\�\�5i+\�c����$,�J+G~�\�@~�\�<@ �\��� \�\�M��#0s\�3a\�,sP�&�\\�կ_\�\\q\��k׮�/�\\�\0��\0\�E\0�\\$i�\0�\n	^!B>��7\�֜�\���\�H\�gJ���@�\�7� ��}A��\�|D��\�\� \0$��W�x�\��\��	��5F@\0�%\�\�\�`�\�\�O�Yn>D@\�\�\�D@\�\�0UF\�\�N3�<�\r�\�4����z�y�ᇫl\�L\�&�\0�l�i�ɷ!3�\0 D@\�\���@u��\�o�\r�`\n\�&���3\nZ�\0J!0v\�X{��\�\�o�\�5͵jժ���� @\n�D����\0QU\�d2�\0*J\0���\��@\�($@x�QS�\Z�\��\�qDN@y\�o�\�\���CT�\0E�+I?�}#@�\�\�\�\Z�@  J��\0 �K��\nO?��U\�L>���K�^(B\�=S�8<��\0\���ӫ�\0DU�1Q�@�H��, \0�X@���y \0�\�\� �	nr�.t���\�qDJ`\�\�\�f�\�\�Ԃ��s:�@	 @T~J�F�H�\�6 \0� @�\0�&!\0@�8B(�[s\�QG�\"\�[\"T�4�H	<0\�S\��\�v\�gG\�/�A�\� *m����\0�>�3c@\0a@��,\�B\0H7\'@}�\�9�G\"Ի\"T�4�H	H�\�qf릑�Kg�4�J[ }�#@�\�\�\��@X \�\"K��\0 \��\0�ߵR\�yEa\�\"Ē\0D,\� \" �\0d��E\0�@\0\�\"�\0Q.��@\0\�@�@�(v\���\�&N�@\"H�2���\���/��@� @��$\��%�\0\�\�A\0�@!��9 \0�M\0\"\�5�\0*^\Z�@�$@tlӌ\"ԑR��8�9o��0e�9�Y�8�\�\�ׯo��\�\nӵkׂ\�rB<	 @\�\�.�\n�@	 @$\�j��@u@�@�uE#@���\�!)�Hq\��&�\0Q4�\�\\�\0S0@\0�\'�\0�x2@\0�\'�\0�\0\�\"F�/�C R �\�\���\�\�H��3@ �`�\�x6D� \0$�\0D2\�ƨ!\0T�P\�3D�xi��8�/\�E�\r#\�\� Pi�`��\�\�?D�lΌ!\0�E\0\",��@\0~	 @ @�]+E��\0Q6.�\0 \0��u����� @�\�\�L�@ \"�L�\0 ��\0D��D�xi�Paۛn�)�~\��$�\0QI�\�\�\"�vg\��\0\� �\0Uڄ\0 \0�   ����\�\"@F\��-�`ک�Ffٲe�#�@  J�� @�> \0@�\\ \�E�v \0@�XŮ_\�!@�\�\�IH�\�ئD\"�\� \�I\0��4i\�?�8�\0�@��C�s \0@ La�/�\0*^\Z�@�$@t=���\�ǿ�Qs@ - \�b\��\�SĿ��\�3 y�B\�\�Z���y��\�\�3hF@\0�$�\0K�0(@\0�\"�\0�\0\�G�/�C R t�ٺi��\�*M �\�ܹs+���\�H�e�[\��C[�)@\0�fK�,1+ԩ�s�˖.5u\�֭f\�\r�\0*L`\�ҥ� \�\�\����N�߫R��\�\�R҉�ÿ�6�:�������k+��s9\�/΃\0\�%�\0._Z�/��	\�Ǐ�/LFV�\�>�Ҭ��\�\�oV\��\\@\0\�%p\�Gך��%KM������6���9 \0�N\�\�s\�5K6\��4?���}}8\�aS��I\�\�{\�\rm,�\�K\�m�ÿ�\0Q4�\��\�@�{\�@ \n �\�c�>z\�\�bC`\�fY\�fMb3&�.���d֬��9y\�\�\�5qf@\0e\'��mO�^z|\�ۥA@\0�@.I\�H�k�\��o#@�x�\�@!��!\0�\0(B\0�B\0(#��Sf��W�kvh�A[�)@\0H#�4Z�9C\0�,j@�� B\�K\���\0D��\��\0 \0@\0e\'�\0Qv�4@\0 @ @�z� @���\�!)��Sg��;�\��0kf��\�*M�L��\0�C\0�\0 P.\�\"I;�\0 \��\0�ߵR\�yEa\�\"@\0�����:�R&�`*H��\0 \0�\0�\"�\0 \0��	 @ @��\� B\�K\��\0 � \�E^�f�@\0�@� @��$\�@\0��_~\�JQ\�!@��� KJ�\���͠�}b9>�� @�E�v�@��K�� \0@��B���\0\�M\0�\�k�V{�\�qDJ�\"ԑ⦳@���1R:��\Z�iC\0���\�\�l\�4��i�\0 ��\0D��D�xi�@��7�ň\0D���ҡ @�\��L�\0 \0@\0U@\0\"\�e�\0*^\Z�@�$@t=���\�\�ّ�Kg�4�J[�� X�\0 \0@\0�@R	 @ @��v B\�K\�����lG��\�b@\0\"FH� R�\0�> \0�2 Sa\� \0�\"�\0�\0\�k�{D�\��#�\0?�0�h̜��L�2\�ԬI4\�2 @�$ \0@�\\(B].��@\0~	 @ @�]+E��\0Q6.�@,	H�2���\�����\0 P�\�O�iV^��١\�\�:E\�@\0@��4\�@ �~�\�\'�\�SO�)S��뮻ά�\�1%C�F��k�P�\�8\"%@\�Hq\� \0@\0�\0\�N\0�\�HS\�\�\�?�l\�\���㏛��\�#�<\�\\}�զQ�F��L�:\��\�\�\�:\�x\���gϞ˝�Z�N|ɒ%Vt\�߿�9�\�͝wމ\0!��w�\0�\0\�=�\0*^\Z�@�&N�mvj��Y�lY��\�*M�L��\0�C\0�\0 P,��:x�/D�\�3	���\�\�\�{\�5|�\�b�-̷\�~k:w\�lV\\qE3`�\0�\�F\�Kf͚e.��Bs�\�\'���\�߼�\�f\����O�>5\�DMwѢEf�\��\�c�I���\�7ӦM�%@|���=\�]w�\����.u�P�\�8\"\'�\�&��\�ӧG\�/B��(B]I��-�`b@\0�@��N\��\�9/\�\�|u67\�\�}��\�^�z�I��\�H��\�ͱ\�kz�\�m9\�K\��4����\�[\��څ����\�[�@Vn\�_|��Ƒ\�D��l\"�\�瞦u\�\�\�\�M{�  B� B\�K\��\0 � \�E^�f�@\0�@� �%\�uA	����\'�hN?�t+D̝;לy\�\�\��w\�\�/�l{\�1����\�^;h7%��`�s\�e�Y!$�)�2E��z\�\�\'�@�(iuqq>�\�!�\�qDJ@)�t�h�a��\�*M\0�\��\�\0 \0K\0�Xr\\��\"\�\�=�\\ӫW/���ۛ���\�w\�q6ݒwg��1c\��\�o�~�i��\�[/\�\��a�T;B�\n\�Zk�\�\��SVz�+��\�l�\�v\'�J+�d�{\�9s\�]w�q\�ƙ\�?\�\\s\�56Uԥ�^j\�ﾚ�:t\�`�[g�}�%~�\�7+�6�\�\�\\�fo�_~�2d�-\�TSJK��8\�\0s�\�gM3�t\�R;.���?�\�3\�Hc\'\�[\"��\�?o\�\\sMs�\���\�:\�FkH@�\�\�l\Z��.�\�4o\�ܬ�\�jvmڴ��~\��l;N:\�Z\��x��c\�Z[(*\�\����\�|\�#�\0�\0\��\0*^\Z�@�T�zȀ>f\��G\�/�A�\� *m�G�`\r@\0�@� �%\�uA	���\�ֱ�Ղ�S[�w\�}wY��ZAA��\�\�[�\�ŋ\�\�?l��\�n;[\�\�\�?��E�\�W\�Ŗ[nY\�/��Α���\r��\�r�K̸馛\�?��\r\Z4\�\n��\�;\�l\�9\�[\�\�~0��v���!� �?~�>�\�s����}�\�Ǧ��h!\�\�^��#��\�;өS\'�\�^{�K.�ļ�\�K6%��ҿ�\�J���롇�\�=b\�Ӯ]�\ZQ\"S�\��s\�)��9�׀~�U�iY�\n/%E9B�\�\�C@D\�6\�\�[=&e&>	 @�\�i�@�\r-\rC\0�zUo\�XLp޼y\�y/Ǹ+@]�\0\�wB\�\�/����u\�]\�^�H�N8�hg\�\�\�D�a\����l;���\��\�\�\�w\�n��ƦG�Y\�\\86R�8√��/	\r�ǁhEM��믦{�\�f�\�W7Ç� ��V��\"#�Q\r�sE��\�8�I�c\�c9�\����ז\�@!��!\0�\0 �\�Ԫ\"�\0QU\�L\�d i6\r@  ba���\"���m۶f\�m���k>B\�$(-R�G6!\���߷\���B\�َR�iӦ-W;x�9�ll\�ѥKӪU�Z53�\�JPPz�UVYŦW:\�SL\�ƍ\�)Ů$���\0)�B]g�\�qDJ@D\�Cۙ_~��\�B\0\"-��\�< \�kF@ \� \�n�d�O�D��HQ{\�g�ɸ\"\�Gu��<p�j?\�R�Pg\�Wl���َ�\n.rB��o��F�\�*ۡ�L�o���iz\�Gl�&�d\�K\�>z�P\�8D�xi��\0�\�\�\�M#\�\� Pi3\�-0�\�25kR\�\�J	 @�\��L�@ @�\"Md% �A�\�[o=\�\0\�Z[�h�y�\�\�n�\�fw\��\�\�\�|�\�7�8t�z�̒%K\�\�W_m\�/\�5\�ل��i�5ְN�-Z�:u꘏?�\�̜9\�\�\�~9S0}������R\Z\�J�f�8(�\�6)5�\nO�\0�\"LT\�\�裏6�F�2M�65�m���5��\�\Z��\��%��H�T\�\�\�r@�@�(���\�D�xi�@��7�A\0�!0~\�L��u\�\r7�\n \0@ �@�8\�\'��K�\�J*���\�?׺\�\�ϮIS4k\�,�tKr�K�x\�7\�\�}9�]��\�.%RH<�ꫯL����>�P�r\�KTp��\�ѵw\�q�-�\�=T#Ai�6\�tS;69�\��^#�\nG��꫶дƶ\�V[��C��\�o�\�L�<ٜq\���[n�e��\\k	*��\�W�Z�+RAQ\n�ǧ�~jkUh~\�ȑ/��Ҝ|�ɶ���P;l�|�I�\�\�\�4Sl���	1{�l;>\�\�е*���;6�o�f\�̀\�.�\�bnO�:ՎW�3�h��\�7~�\���\��\\	�  ���\"\�B�(�A �$@\�\�}����!A\0�\0 \0@\0� Xax衇�� g{\�!��Dwȩޭ[7�\�[o�c��Q�F9��\�\�s\�$\�&@�\�9\�}��\�{[1�\�|P\�O<a��JW$�AE�w\�qGۧRu\�\��:\�%Vl�\�VD��\�km\�&|\�x\�W!\�\�?ފ��)RB���w\�۷�\�\n�\rV�7�\�[�\�E%\�\�\�P�\�q\�W�\�\r7\�`�K6\�ds\�y癎;�UW]ռ�曶-�Mb�\�M�n�8(\"E�_z饶-͹A��w\�\�F\�B˖-\�g\��jlM$R\�E���\\\�\�XK����t�P�\�8\"%0q\�l�S\�\�\r\�D�Li�6s�\0 \0T�\�\'��\0 �D��[�P�\�8\"\'�=9r:��P\��))�R�\0�> \0� @�\0�K!\0@�,  ʲ�r5��2T�4�\�	(t��\��K��$�Jҧo�5\�\0�\0�%P�\01c\���\0 P\n�R\�O�k \n\"\�$��R0\�h\�h\�Č��B� \�A�6J!�\0Q\n=��\0 �n\�T w�\�ѶXo�V�\�\r�\�C\0�@I  JZ@�.F�(D�\�!�*B�\�\�\�M�3hF\n�2@�(D�(�\0DI���@�	 ��0r\�\�\Zf*��\0�\�%\�\�!\0�L\0�\�E���P�\�8\"% bȀ>f\��G\�/�A�\� *m�G�`\r@\0�@��J������t\�{ｇ\0Q,|��\0 \0K\0\"\�[\"T�4�H	H�\�ئ�Y�lY��\�*M\0�\��\�\0 \0K �\0�ǂ��w��s6�\0Q,u��\0 \0/�P\��P�\�8\"%�\0)n:��#�CA�H�\�6 \0�2\�&@Hx�x?�\�A�͟,B�(g��\0 \0�\�  B�? B\�K\��������3���W1j���\�y̄)�\�A͚�e\�\�3f bf�@ A��WxX�n]���\��΄���B\0�1�P�\'D�xi��u��\��@\r��Sf��W�kvh�T \0@\0�x�GNmgf��_f\�jC\'�i\�ƌ=\�^\'G��Ѷm[3b\���Xp���\\�wa\�M\Z��~���g�^�\�\�15�\'��B���m���1Jk���\�IQ�\�a��\�\�C\0>	 @�\�i�\0 \0@\0�	\" bb�@ \��\�\�\�e�r�� B�\�a��G\��@\0�\�6�o�\�\�\�\'�U�\n�\� S�m\� \0@\0i%@\r��Z�yC\0�R0��\Z B\�K\���\0�t\�\�\�0(B#�|�`J�`��\0J �M�pͩ&D\�6\�l�\Z%�\�R@\0�!�\0�\0\�퀳2T�4�\�	pOG��c@\0\"FH�(B����!\0��\�\�C\0\0 \0IDAT@ �\0�f{5_\�L�>ݜp\�	5u\\w%�\�R@\0@��R0�xC\�.MC bJ�\�~翛f͌�g��@e	 @T�?��\0�*�\0 \0�b	� \\=\�3f,\'D�3ƴjժ\�\��\0 `�� \"\�\�\0\"T�4�H	P�:R\�t#12FJ��\0�R\�3m@\0e D�p\�9!b�\�\�fԨQe�M@\0H3�P\�?D�xi�@��7�ň\0D���ҡ @�\��L�@#@x��\r\Z�a4@\0i&�\0�\0\��G�/�C R �\�c�>z��\�*M\0�\��\�\0 \0K��\�>��\0 \�%�\0�\0\��\0*^\Z�@�$@tl\�̸��vNg� �\n§kK\0��\0@\0\�@�(�\�A\0�@� @ @�k-em\"T�4�H	 @D��\�bD`\�fY\�fMb4*��&i�6s�\0 P^\�\�Ik�\0 �\0D�U\�\n�\0�81\' �\�\�\�/?Ύ�H \0�\�\"0~\�L��u\�\r7���1@\0�\0D\�\�\0�\0\n@�@��&A�/�C R��7�A\0�\0 \0@�d%#�@\0(�\0D�K(�\��\�qDB@?:\�/Zl��f���\�wĈ���N P	�`�u��\0 \0@� \�A�6 \0@�����\�\"@D\�	�=\�\�{�s�\�w�0���K�p\�\��n�0u\�\�\0K!@\�R\�qm9���i�@:	 @�\�\�\�\Z�@� @ @�� B\�K\�������W�\�M�\�\�W[�lY$c�T�\0D%�ӧ�\0E�Y�\0 P,�b\�q \0��\0D�\�R\�v B\�K\���\0D$�\�$\� bl��\r\"%�f��\0B �\0T��\0 \0�@  -��\'#@%\���\�KK\�}77��]k�D@\�\�f��� \�˓ւ@�Ό+ \0@\�/�@\0�4�P\�`⮻\�2}��	u<ij|\�M7M\�t�k�F�i\Z\�G\���0ڴm\�6\�\�4*K\�\�E�ʹ_曭7Z����T�裏\����V�n��\�XmU�\�;����\0 \0����Y~Ĉ��\0B\0\"ԥ\ZD��\��̽�\�k\Z7n\�\�\���9sL���a�cG0\�j}i�\0]T	�*1dB�!b\�jk�zk��u�~�kV�mDB\�˰!\0�M�\Z�\�5\'jЅ�rh�@� @ @�o5ei)�\01`�\0�x�\�Pǔ�Ư�\�\n��\�k�\�/�<\r\�e�!��m�\�\�ô\�ԳV��`\n\�\04_q�`��	R=��?��\�xL�@Tc\n� ~���!@\0H=���Ӕ\�wGm(�}Y���.���\0Q�\�$��p���P����v3\�-0�\�25k�v̿��\�W4t	@\0> @��\�)�\0 *���\��o\��\0\�b�b�1cƘ6mژ�\�{ϴn\�:\�L~��ws�\���\r�����\�<]�\�c��;\�Ӽ�\�\�o���yXh��\�s\�ך������濕6�D9(҆#�\0�Z�\0 P9IX�9z�\0 \0@�`@\0�@�	$��&���-��\� �\� 7\�x����#D�D�y *�ث�K\�KK\�}77��]k��`�b\�35@�\����^q�\0�@\�	 @�|0}@\01 ��w� �m�\n,� �\n?���9�\�Ͱa\�\��q��:�x\�	s\�I\'\���\�\�\�5\�\\S0\��\�7\�ڵ3\��iҤIM[N�8\�c\�\�{\�]Ӧ�$\\t��x�\�g\�(�UW]ը�\�>�\�<��\�v\\���?�y�\�7ͤI�j�\�mC\�(Rc�m���[��\�MϞ=\�]w\�ez�\�m\�>�\�k�9��n��ƓͬX\�U\�e5��T���ZH�T��M \�\�\'ʉ�\0 \n�j|�\�g*�B\0�@ I�)\�\�)�-�`\'1�W��\�]w�\ro��\�۬\�_Ǳ\�k�<�H�*I\� $f\\y\�6�A\�|�A\�����+B)�:w\�l��\�k\Z7n\\+}���6mZ-AU\�k|w\�}�Y��k\�\�z\�\�\\F�m����ﳦ`\�\\]\Z(�[L��IG�� @[���@5����i&@\�4[��sO�\�z\�	2@\0\�&P�\��A�\�>��\0 I�)\�\�D�k1��2	��\�ޥ)\�;1BN}?5 t�\"$X�D�=L���>[\r�X�)T(RA��%!A\����5\�bpx�bG.b�\�\�VTQ��o\�؜x�9�\�AD��:�M{_ZF�\�a\�v\�Y�)�R�(R6e��<f\�M�\�z\�p2@\0�#�\0�:�3a@\0�#��w� �\�\\� B\\�A\� ��H�4\�\�o4�_\�EIx�\�R:劀�yr׹1\�s\�=�\�8y\�$e\n�}�TN��\��y晚~�\'[\r�#�8´l\�\�\\~�\�!Z��\�B�\"\�i�4�\�E\0��QIIX�$;��\0 \0�P� \0@����NĿ�\0Q��\�@يP;���l�\�CP�\�Rhݺu�o*%	:�7�5\�߿�rQ.���\�3�y}�K�p��?\�\�Fmd��꫚H�|\�\�\����뮻ڔU�\�_�N�\�F\0�\�,\�|�@�J��\�I \�\�\�dA[�\0 �\0��q \0��@\�\�i��� ʻv|�\�@N��7o����\�\�KP4ĥ�^jv\�y\�@5 2S)�MW\�ڥPʖ�)S��\�}P\n&o!k?\�j���ܜ���\�%@��R\�\�\��Ɠ���M�6F�\\r�/q\n��\�ws\�y�׵.!S!�|�tI�`�ǟ��d\�g��\0�O\0\"�6d�\0�N \�\�4A�\�X�A䍀p\"��a\�쨽\�x\�\�\������\�c�=̉\'�Xk�NP8\�c�RI\�8q���^mJ���\�E\�7�E�VtP�\�;\�`_<\�F^\�pc\�\�\�\�.�w	n\�#\�w��x\'v\�9\�ŋ\�B\�(�j|i)\�I�t\�9��L�\�z\\�2.@\0i!P�\��A�i�3�\0 gI�)\�\�5 B\\�A�-S�C���%`(�cܸqU77&TY\��\�RY���4I�Xu�7\�\�\�e\rf@ y��Y>��!yc\��\0��@\�\�i\��\0\�b �\�\r1r\�Hs\��Z�iӦ\�7ĕ\�B��\�2�_ӶS\�Zg���eS\�f\�[`&L�ej֤ڧ\��bH \�\�1Dʐ \0��\0D�\�\�d!\0Ē@\�\�i���s\0\"ĥ\�@\�B5$Tt�\�o4\�w\\q�p��5\��@\�$�a�r\�\��\0D\0�u\0@\0�&��w� �m�\n�� B�(\�@�r��1�\��\0DTi��?IX�7K΂\0 \0�� @�E�v!\0@�/���\��o#@�]e</��$@\�s\�=f�\�/\�����s皝v\�\�2��\'\�\�*J��\�\�w\�\�M\�\�_\�\Z)�*j:��\0)�\"�L9	$�a\�B\0�@e	 @T�?�C\0��1I�	\�\�F����b��\�\�\\s\�5f\�رir�\�d�M\�z뭗\�	0�\��Ɨ�\�Cg��\"@\�X�#u�I�\�z\�Ƅ!\0Č@5>\��3\�\��@*	$����;Ԁq\�1���={�9s\�8\"��\0��Ɨ��8?\� \�m�J\�>\�\�\�G��\0\�N�\Z�\��\�n\�@ ��NS�\��Wb!@�h��@	�/-#��0m;��\�\Z)�J�˥� �\0�3U\� ���^��ab�\0B\0\"!�b��\0��@\�\�i���s�\"\�\�@!\Z��!P�P�\0�K��\0DU�1��H�\�zb�3p@\0UB\0�J\�4 \0$�@\�\�i��� *�P���K� �\0\��T5��6o\�\'���\�f��\0��\0D��\�A\0H\0���\��o#@T`A1DD��A��\�\�w\�\�M\�\�_׺�L> rJ�	 @$\�|�|\�\�o\0&��G}d\�?�|s�\�w�wܱ\���\�\�3C�1�~��\�k�;\'p�Uv�\��nh\��N;��/�؜u\�Yf\�UW\�9\�\��\�<�\�#f\�W6ݺu�2\"L�T�\�z@\0(�@\�\�i��� J]-E\\\�@E\0\�D@�\Z_Z\"�FUD\0������$�a=�\�#�ԩS\��\�_o��y�\�k��N:\�\\r\�%f��֫\��\�ٳͰa\�̫��j�[o�u$\�+��\\\�\�n\�\�>ӳgO�p\�Bs\�W�&M��+��\�ԩS��.�\�\�?��\�\�q\��Y�ff����B\�=�\�c�\�f�m�\�s����K�.f�\��\�\�K/5W_}u\��`\"\�!P�\��A�\�H+�\0 P\n���Ӕ\�w�\Z���\�1D���i�@�\Z_ZJ���) �]�ӧO��\�E�͌�\��Sk�7\�xc\nh0\�JH�\�z��ű�~��\�V?�\�\�\�ol&L�`:u\�dv\�i\'s뭷�\�W_\����~��\�?��S�t\�R��\�O\�N��3g�y�\�ͩ�����eˌ�3�o\�Q}�\��s\�Φo߾�l��	���\r\�7�7}�\�T�\��A�\�O��\0 `�I�;M9~w B��(�\0��2��iW���\�ۛ\'�x\�ԯ_?\�U�i��1`�\0;�v\�!�/��\'\�\�E��\�2�_ӶS\�ZM���\\�i\'.$@\�\��~�\�:�O~�v��y洸�qT1��?�W�i��\���\�\�\���7�\�ִ��믛:�W^y\�\n\�c̘16�Q�Q�F�OQ�\���K����?�i=\"��g\��\0\�C \�\�4A�۹�#@����X\�\�O�B����\�\�\�\�nü7\�`s\�皣�>\�\�%\�\�q\�\�6]\�KJ������u\�-\���p\�O�\�z\�\�ǚW�8\"(X\�/�@\�֋�t\n/\�\�w=\��\�\�\�\�\�n� f͚e\�>�l+��j�;w�9�\�3\�\�����\�\��5SV4�\�b� Ҽj\n\��0#΀\0 \0�p	$��&�\"ܵ��� *�\01o\�<ƾ\�f�\�<��\�\�3~���ꪫL�6m�\���:�]\"@�\�\�)�2D\�@̦����\�\�p>��cӣG�\�A�Ez�\��L�F�l{*J�yx�p\�	���C�\�:�3\�R@-Z�ȼ�\��O�>fܸqf\��6ݻw�!�3f̰\�\��\����\�.3#F�0O=��=W5+�����\���\�fҤI�ϺV\"�7\�Y\�\n1g_V\n+ՏP]�޽{��VZ\�\nJe�~�\����!�~f\��\'�|b�U��M7\�\��衇\Z=�\�(��\�\\�\�\�˼�\��z\�����2+���\�5>�\��\��\�_+�[cИ5�\��Dlo\�X\"f`�\0RM��Ӵ8\�̬&>���;y�}��\�Ŀ�k�D@�h\� *�\0���\�\�/�\�x�\�\�\�\�7\�4]�v\rq\�\�6�\0-\��\�}i\�\�\���k� SZWF�\��zm�ę!@$\�j�\��\��\�M3��pNp\�J�\�B�\"T\��\�g�5�￿M\�Ժuk�\�d9�o��fs\�!�CV4�\�\�֭�u�?��\�vC\�����>�\�[����\�\�\�]�NXP_.Z\�o���T\\���n�}\�P\��رcmM1��!!Qb�-�0x��\�Ϭ�_c\�s��W:(׷\�W�\r�g���\�_���o�\��\�\�\�yI�y\�\�\�\�;\�l\n}.�C��?�x;>�(;v�\�\�{l\��m�\�VyǮy\��\�\�n�\�\�Ϝ �\�si�\"M\�f��\0\�I@\�4c\�}�wp�wm�\07�%\�e��^\�8\�\0�~I/\�%n���\�\�^�/\�ry!��93�\�	T\�KK�\�1I �d�\�kR���\�\�\�pڴifРAVp\�\�\�\����\�Y\�ED�r\�)ֱ\�Yg�{\�\�F\�p\�͞=\�H0Ye�U�>\�6\�l�\�|�\�m��\�~�퍢.z�\�i��\�p\�BӥK�\�\�\0䴗p \"[\�^����Ѳe˚��J�3\�8ôj\�*\�\�P.��r+$d\�w�-��\�l\�Sݏ|c\�%@��\�\0\��Y\r-W\�|?C5ؐ9@\0�6��\�N\�\�\�M1�r�\�����\\z�P\��[o�e�\"�}Ձ\�|�S:&\���\��\�\rw\�\�S�N���{\�1��K��T$P!\�~?\�.�\�\�^��,�\�)�|��v��v�]t\�E�y�\�f�\�V�\�\����K�_HC\\\n4�`\��Ғ`s0� @D\0�.|@���*�\'\�yOi�\��\�h���Ρ\�\�{���m\'��裏�;\�\�\�\�oܸq\��K�*缢&O�l�\��ߙ\�\�\���\��v\�mg�6�\�~���\�B\�z�\�H\��\�\�r��P�\��9s\�՟\���Xe;�/\�gj+�BsB�H\�頫�Y>��!R\�t@\0� @�\�T����2\Z\���\\���\�_ڝL\�\r�\�z\�ٝJ\�\�\�^Nt�\�B(\Z⡇�y�P��v\�\�ՈS�L1^x�}��`�\�U@O�pz^\��\��\�\�\�\�5��ʗ�\�^{\���\�Kf��\�\�sα�V��\�F\�\��̭�r��V~e3�8𾴌\�\�ô\�Գ\�0I�G�1�R @�B�k\�M )\�|\�w\Z\�S���\�ߴm\�֦\�u��yϯ\0q\�-��g�yƦHr�\�\��/GzÆ\rK ԮK��(mR\r��\�u(��R IQ\r	z�\�B\�z\'@\�Y\\�u\�֭Ս \n}��\0=�g�\�Rc�Ɨ\�3]�\0��;?�9\"@DϜ!\0@ ?�������VJ��]\�<\�U!9�B+�|�\�w�V�\�/�\0!G�\����	\rz�Q�^�~�\�7J��h���\�\�EG;\��}��p}.�!�P\�ZET(Mԯ��js\�*\�~��\�5\Zw�\�\\{\�~!M\��g��u\��\�\� *n\�!��g>���\��1\�s�K5�\�L9�U\�x\�׮i�\�\�{~\�A8�\��m�E��c��F�\���\�o\�ԩS\�EA�`�\"�U4:����j:H�Xw\�u\�\�m\�Q�(Ֆ�s\�=��p\�u껨\r�\�ׯ�M۪>�VJ�Z�9\��\�\�sE[(�A�TC\�\�#��Q͚�\�\Z�HH\�5�|c\�\'@\��\�4��\0�F�3g@\0�&�\0o�Ԍ.)/�� ,�\�)L\\\����\��\�Bs\��ZH�hѢ�}�RZ$�t\�<\�\�[�\�]�Z	\�c�\�\�K�>S]��\�E/F:�}\�\�*�iB�?Ì�\0D\��\�\� *n\�!��g>�柀6\�(�Vl\�(�r���/\�\��ճ\�O>ik\�;�ܫ\�W�U\Z#9�3�V�iE0�f��fͲϤڨ�\ZK�.�\�ða\�lg\�LP\�hZV���\�?l��\�ŋ�h0r\�Hs\�G؈�/����N��z��\�ڗx\�=�\�F\�^{�m?[d�;_\�Z�d�\nT�Z�\�\�W_}e�;\�8q�gkmB\��\��o߾�\�۷��1c���Hf��\�l�\�lDŞ{\�i\�}�ݼ��gtw�\�P��6)2\"\���}&\�\�\�ڐ��6�+\'��9)}�l*\�F\�*W�*���3��\0D5Y��@\0��ζi\�h\�DL(�;ׄ�����\\)��R���̼�\��}Qԁv%� �G�\�\�\�=�\0Q\�s\�`s/w\�Pk\�\�\�jL\�I/u:�}�\� B\\�4]C��\�\�w\�\�M\�\�_עC\n&K�@��6�&{>ɶ_\�\�崿�\�[�\�<\�!\�{�uϚ�:p�6\�\�V\�h\'�\\`\Z5j�U�p)�$,萰�TB��v��4iR\�\�\\�e��R�\n	�￿��\�	�F���M|�\�7[�A\�\�\�PT��g�\�g\�\�ݠ�q)\�����Rڥ\r7\�\�\�h�8qb��j�,q5$��G�\�̙3����w\�qG;v�:�l�\�\�f\���u\��~ 1Fi�\n}>n\�8�|�t���\�\�]�o|�>ӻ�x8�h�L4�K䛓l-�\�k\�l\�.\�u\'1�  �\�\�\\@\0������s�C�qe1P9�Pk��+�)\�\�I/?\�y��$\'@h\'�v;\�\�L���$\�G\�J�\�ˠ\���vJ\��\\/;��L�\��r�\�Zk�=��\�\�裏6zi\�\�&\�R�\�^�z\���Ҡ\"ڹ>sbD����kT\�K\�@>��8@���5KX>�쳂ŧ\�\�v!P\���Y>���\�\�\�� \0@ |\��\�A�\�NATNB�\\��|�\nIVx�Ăo��\�\�{�0g\��[H��T�N���,\��f͌v���\�:\��\�O7\�\�C\�\�J\�ԭ[7�K\��\�?\����a�w�C���\�«\�-�D��,��V��r\0\��\�\�C�q�\�4k � Rk�XN\"�faPe$��T�\�h׮��F\��\0\�K\0��<i\r�\0J\'@\n�\�F\�BR^F+%@(\�@\�Ȋnp����\\�\��C\�\�\nW\�:*����{��a\�J����>�Ⱦ)dZb�Bԕ7\�E!�\\\"�r�\��M6\�Ćxw\�\�\�^��\�ׯoa�؝Ď.]�\�1\��\�-2�Hn�\�w\�}iٯ�i۩g-&�`J��:\0Ug\�DO()\�|��\�\�+B@��U�A���U��\�Wd,t\n�j&�\0Q\�\�en�\0�I�\"\�	�[R^F+!@$Ąe&DY0\�H�f���\0D\�,\���̧\"�\�T��8x�\�gm]\�NP=�I(\�cf\��\0\0 \0IDATlH\"�$Z�1C\0�n	�o1/���\ZD�\� \�\�K\�@�`%��\0D\�,\��y\��p\�	\'\�º�3ժU�xO�\�A\0�@\� BGL�\0 �\0D@`�:=\�\�h�\�\��Ju\�\�(W\r?}U\�9\�b\�x\�\��\�\�w\�\�M\�\�_\�\Z0)�\�m?F�\0Dpf\\?\�|K>aV^ye3r\�Ț�\�\"<�\�2 \0��@�H��\' \0��@�H�����֝<ƌ1��3�\"bذav�\�۷7O<񄭩P\�\�\��nl�H��v\��<��\�f뭷�\�i3�\n�Ɨ�\n\�\�@�H��R4\�|\�|,�o��\�3e¨ZD���\�{\�!@�h�0U@\0�T\�|?+�\0\�G\0\"~6\�:\"���aB�\nT\�KK��)�H\0\"D�4�@�g>	\�\�g�9��Y�t�Y�\�b��d�\0�@:T\�<D:\�.��\0��\0DBl�\0�C1LT\�K\�\�~=L\�N=k͊LU`d�P�\0\"N�\�|^\�a��u\�\�\�\�:T\" \�dA\�@�� *˟\�!\0@`y	Y	1Ä@�u�)\"�\0\'�L@\�|l����\�\�6\�!��\���\0�Qh�@� @$\�X�@JL�:\�δE�\r1\�rDީ��1\��K��8X�1@  \�agf�?��8\�3߿>�\�,�i�Y�矁�֦M3z�h{�\�r��۶m[S+���U3\rp\����=����\��8\�J3���}�\�{�ݽ\��$�\�\�\�p�A\�@\0H-�r�\� @��|�讻\�2={�4s\�\�	qD4\r%\� �\�<�\�ZM$�%(\�O�t\�;\�%\"\�b|�\0\�M��xۇ\�A\0�@�	�o\�\rD�vb �\rA\�(�@5�����KS@\0\"FN\��� c1T@\01$P�\��A�14	C�\0 �z�`J\� SB\�0!P��\n\�\�B$�\0\"\\�L \�3�����K͒?\�j�\Z�1s \0��%P�\��U�\\� ��N�� b(�	�* \�}iٯ�i۩g�Y���\n�\�j@�`Aĉ@�g>	\�^t��2aD��\�X \0Ĉ\0D���P \0@�@�H\�B@�H��&��\0E����L!�@�89d~���|<¬��\�5�5�1cƘV�Z�<:��\0 \0��@���� \0��@�H�\����֝<ƌ1��3\n\ZI\r����\�!��\0�#m \�f�x\�7\�3ߌ3\�	\'�`F�mF�\Z�\0o\�2:@\0�@��3�@\0�@\0`U�\� /��\'D%\�\�7\�C��\�\�w\�\�M\�\�_\�j�L\�\�L+�!�\0[0c�y\�ѠA�A\0�\0�\0�\0\�F\0\"n\�1�b^F+15�JP�O��@5�����U�j�h�瓔g�dSf��\0��@5>\��3T�e� \0�\�@�H�\��2\Z\���L	Y|3u��%J#~�\�G\���\�7rj\�㎵�\�g\�]w�2d�9��\�\�5\�\\�\�9Q�5�}���\�f\���\�\�;\�û�\�\�Yg�eV]u՜\����\�\�#�<bs\�w\�\�-�\�*@,Z�Ȧn|ꩧL�\�\�\�\�[o�]�/X�t�����m`S��NR��b�A@\0��r��Y>���%@\0�#�\0?�dQR^F�< @$d�1\�\�𾴌\�\�ô\�Գ�r�`�:u����\�\��\�?o\�\\sMs\�I\'�K.�Ĭ�\�z5}��\�\��47\�t��\�駟n�v\�jV_}�X\�$�\0��矛�\�\��\�\�\�,\\�\�\\y啦I�&\�+�0u\�ԉ���\Z�l~\�w�f͚���\�\�\n5�\�s��g�m�\�:���\�.]�����K/�\�\\}�Ձ��\0�y=�\�sF�{\�ƍ3{ｷu�\�]��?\��X�^}�Us\�y\�\��\�駟N�\0��\�_\����\�\��\�7\'�xb�\�^R����A\0�@\� BGL�\0 ��ĩ�\�-\Zm�\�ʜĿ�k�jCo�˖-[V�Y\�kR^F�����%��@\�E��\��[]ξ�7\�\�L�0�t\�\�\�\�\�N\�\�[o��j\Z7nl�\�~{��˞ӱcGӡC�(�\�bΜ9\�\�_6��zj\��{s\�7ꇧ(��\�$��/��\�t\�\�\��\�\�7�3\\Q��hذaQ|\� ^|�E�\�J+��\�\�E\�v\�m\�\����^{\�e\r\�\�0,<f\���FB<�\�\'�]t�\�\'�U���ݐͦIy\�c=\�& \0�N\0�t��\0@\0\�&Ŀ�\0Q��\�@0]B�����\�Ǜ��\�of\�\r��|���\�VXx\�W�1k\�,�\���\���;1!�\�\�7\�lS\�\�\�5j��WQ��R\�q�kc(\�^*\�0��s皏?�\�\�\�5�79�uh=k��\�	k\�\�<��Ea	~� ��2}@\0H�tٛ\�B\0�@�	�o#@����� NN�@Ex_Z�\�<�\�Z\�(G\n�̉i\�v!�\�\�\�\�\�n6R@��\�D\�5~�嗛�mۚC=�\"\\2;�Hr�\�g[��P\�9�\�<�L�����๱�\\��h\�\��?\�D.�\�fΜin��v�\�*�d=\�\�9��\n��A� J]�\\@\0� X�\0 7�`��Er�\')\��	YPyT\�E��{�\�as�7hРft!�L�b\��^[@iRV\\qŜ��7o��\��L�F�l{\�v�{�p\�	�<�{R\n�v5&$z��\��O�>\�\�\�1c�M	�\�ݡk/�\�\��>�\��m\�4C\����4i������\�vc6̊*ĜY|Y)�T?B��{�\�mS�H\�P*+��\�;\�8�\���C\��7��\�\'�\�kUca\�M7��K\�q�\n}�:�z�2o��^��:\�(k�\\\�S�\�\\�����V�Ҽݡ1k>�\�PhNI �,Yb\��\�\�L)\�\��z\�׬8�裏\�,h�\�&N�\�:�\�eW�\n�Fm|�\�w��lu[�kܭ[�/�=\�o���[���\�\\�ޛJM��\�\�>3\�s���Z�\�\�^:�\�m\r\�\�\�u\�f\�\�\�\\��\��\Z\���\�\�-�\�\��\�=)q�\�c������\�5�Z�\��\�;ζ�x�\�\�\r�DJ\��CR���!�\0 \0�x�ĳ|\�$��\�\�C\0�@p�ά\"W$\�e4ȃYJt\n��*�Ңb\��\�ճ\�?\�(\�@��\�SN9\�\�p\�\rV\\\�u � G\�\�>k��J�Ӻuk��F\�n�\�9\�C�#S;\�\�^�nݬ�_ӫ��\�8\�:\�9��JJ�\nk{w�;aA}9G\�7\�|c\�HXQ�m��C�[Ǝkk\Z���� #Qb�-�0x�u\�\����\�����\����\�$\�����\�iH�\�m�\�\�\�K\"��$\��ζ\�F�\�%t�\��\�o\�\'Ǭjs�@���Ʒ\�V[\����\�#x\���S\�	Xrf��\�d;���\�\n	�֌xW����r��l����\�^ۨ��� 	_-[�4Z�Z�����0`�Yg�u\�\�o�m׀�	b:>�\�[\�YkP�\\t���u\�]wݵֽ\�7:\� ۟\�\�\Z?묳l\�\�.�\�\\x\�V|\��*�\�?�\�~��\�g\�B�EԦĂ5\�X\�<�\�3��Ѻ\���K���\�ݫ�h\�gE�7��\�^{�M�%qD����{Y\�.]����$Iy\�+�c\�	�\0 P�x�{�A�a���!\0@ 8�\�\�*rER^F�< @�[J\�i,\'�v�\�㎵.\�grbi�\�nw�f�㯗\�=K�I9�\�\�!���Y��ʽ�;l\�|N\�\�}iٯ�i۩g-\�N�4m\�43h\� +�\�o��\�[o�erb\�\�\�\�m�l\�j\'(\"BB�sz*�\�9S\�u�g\�6L�6\'[\�\�l)m�	����j㩧��Z96{�\�i��\�a\�\�\�NpE��\0�4\�0\�ַ>wN}E+hW��\�\�C�vǋ�g�aZ�j��s	(\�m\�\�\'\�\�\�h��UN\�l\�Sݏ|cW[ޱj>:\n\�I\�%I��\\Nz\�\��\�\\\�~\��{�f{\�1k�Z�\�$LI<\�!�L���6\�#���{�ZCZ\�:t):A\�\�䘗q\�GZa#�P����F\�~\�wēO>i��N��P\�D:?��\�\�s\�=\�\n\���>}��4F�;\���%�(�B��wd/	x#G��\�RǕR=)\�|~\� \�A\0�@� �\�Mo�\0 P�\0DaF�8#)/�� �N�j#\�RCd3�)\�y*b���X�\�H�\���cH&9��4ibwr����o����\�\�ӬY3�\�~�Y�F\�2�v�f;\�ϟo����;p\�>\�\�vj\�,X`\�!��Fm�w:J�\"\�}N(f�~�\�\�\�K�c�)\�З��TB\�\�-缾�&O�l���\�\�\�7W�M�h\�m��\��H���\�ۏ9\�]�#��}�\�w9|N(\�����k���g\�\�v\�_�\�\�V\Z9^)��\�>^�~\�	���Y3�/\��W���\�\��-\�J�ݞ{\�Y�=)qPb��k�������\�/ͧ�~jE;��\�\�.���$E\�H�\�<$ne�\��ܳ�=}衇\�:s�Lfj�\�J���v\�<JĒ�\�d\rr. \0DG\0\":\��@\0� @�\�T��2Z	BN\��D�,�D=�\�N\�l;�\�|�M\�����Y\�=a\�\�\�|�v[j����F�\�R���\�F)7\�nj?ז\�<�\�G�ωJ��@�\�\�*,�T@�\�S�\�e\�(�[n�Ŧg�Ur\\j���\r6,Y�М�}�\�5��x\��l\r��\�u\�Wz	!\�$Dȩ*�~�_\�\�fw}9gl�ϕ�J)g�9\��/\�g\ZC���K^)�r\�2�sN�{%��r���0\�l\�]+�th]JLTԙR��?\�~�\��Y��~��\�v\�e��S\��ݫv�\�L\�J�\�%@�gǍg\\dG�Df�0\�J�\rI\�3_\�u\���\0 \r�h8\� \0�\'�\0\�UE\�L\�\�h%98\�PZw(gx�\�+��b�\�t/r�H�\�\�\�89�\�UD\�\�ɵ\�JunTt1G\�y6g��\�\�\�\��\�\�w\�\�M\�\�_\�\�V�L�#�M�65�P\r!Ǿ\��l\�Y䄔\�ODX)�\�.o\�>�\��md��Kܡ\�\���M;�+\�J�Lj\�EA�`��\�J�\�-ĝ�f%�J��u���]���b\�+�x��.jCţ��\��}*5�j	s\�16S�\����\�\'E����v�+��\�>\�|���k|�Ʈy\� �\�)))�$�I|8\�\�lt�D��Q\�\�>�\�c\�\�\�?\�aA׌\��y\�nx\�\�f�\�\�#\�YP�[�J]�Eߩ>�\�\�\nuִiS�\�[�M6\�Ħ�R��P;\�\�r޿\�Wu(�鞴\�M�/���{V�U$��\�6\r��\��kn\�\�\��\�j�\�t\�(�CQ��\�K/�d\�\\\�Q~m��g>��\�<@\0��\0D��\�\r�\0\n@�(\�(g$\�e�D6ɉ��rjצ;\��\�ݻ�M%��̔�4�Rrhw��B��˵�]\��έ\�*ݷ�I\�\��:\���	b\��\�9Q�*@�\�A�>}�[\�W\�!����\�Y�^���H\'\�\\�8�+o�s�\�\r6\��:\�\�\�<\\�YE0\�{@xWdv�\�w�E\�\�X�fE�j\\\�]E*�}�\�?���\�ŋ\�u&\�r\�+�A��\�\�)g����\�4ir\\*��\��s�\�\�\\4.���P�\�\��P���ꫯ�STQ`r\�i��\��߾}{+ި����S�L�h\�앓YJ��\�\�\��\\\�W}��\�Ն\�\�hg�\"#�/\�gb�H�\r���[��9)}��\�rk]\�J_�kQ+�\�\r�\�7g<56\�)S?k^�\�T��\�i~�B�;G�	��.v\�C\�\����s�u>b\�[7A\�@�\Z@��K�\��b�Z\"�p�փ���l�x�u\'�ZS*@�i(�@\�\n[K�P\�\��\�\�\�Rw�I�ַ�\�U\�&�[�~�\�v|ZsZ\��\�P1jEXx#2\\��|���e՚P$�\�\�\�\�}��YuL$��(�l�4��\�A\�\�\�:\�THi�ܡ{P\�Uz\�М�}7dF\�ZLIy\�+\�f\�\"@\0�\0D\�\�\0�\0@��R�\'\�e4.��%rL\�9\�\�I,\'ȏ?�hs�\�9WH�Ю^9P��#�3\�[�X��\�\�СCm�*\�R@\�\�]�r�)\r�v�v\�\�\�:,\��\�P��C\�\�\"\�v\�\\\��\�\�T�\�=�fHNC9�t\�Z9%ݮM9d\�t�\�%����r���\�\�q\"���\rE����LN,9Z�Srr\�Z��QaU�/G�s2�\\y�\�\\֮k]��\�\�,\�p��E�\�\\�{\�\�\Z�\�\�\�\�\0�\0!����39\�u~�\�76-�֔\"�\�<�\�P*�B����\�\�\�}�TBڕ\�\�w�\�s��\������\�\�:�7o^����z�.��曭�\�?�RIQ\n���vs�\"\�\�G㒓U\�يO{\�w1Q\�\�\�\�n&N�X��������vaKИ9s�RԾԺ/���\�F�m��\�xUԂ\�99�}�\�0�7�\�\�u\�]�C\�ݳ�Ɨ\�39�\�\�{\�\�暋�a�\�I\�\�oܵ��\���~�)@HX\�\�\���C\�V\��)tN�ZjK�+Z���\\\�����^\�y\��=\��a�o\����\Z\�W\�\�\�4���>Sw����{L\�\���\�w�\�\�|]�h}ox\��F�[\'�^� \"����\��B��\����\�ѽ��v\�@�~��]!qM���W�\��\'\Z��G��s~��g{J�\�X%>J<\�zԑ�\� Q\�g>��\�<@\0��\0D��\�\r�\0\n�8u�=�E��e�)|U\�\�\�\�\�5J���1�,�\�L����\� \�\�F��ˡP\�C;0�CS�\�W\�A�Y��sv�*@h\'���\�>��uNjg�ڔ\0\"���r\�\�)(G���\�5)\'��\�\r��\�r\�gszkg�97���3\�A���\"��A�\� J;!\�H\�`\�%�\�b\�ܑ\�H\��U�^�/��\�\�팕\�\�ߔ�Bvk�\�%F�����\�\�:\�K�]4>9\�]v:�\�cs�O�<�]sϖ\�\�Ϝ �\'@�\�\�ô\�Գ\�-ZjD�\��jhO�^�\�\�\�0ϸ\�!L\"�s�\�\��\�\�l��g�8�!\�@\0ƾ��\�\\	\�A��}B\0�@u(\�\�D�k\"��\� �\� a�\�̔\0�\�#ڡ��\��\�b\�\�0\�\�)-\�vIkG�+�\�S\��|y��\��\�Р�	\�<UԅD	1\�vU/\\�\�t\�\�\�Fh��\09A%H�(T\�V,�KT\�i\�nnE%��g�aZ�j��s�5ڹ+!!�Ўl\�VtF��i�k��\� \nͩ�\�]Kq�.�\"\�q�o�ǡ�TQC\�ڵ�ɥ_\�1���xX\�/; @\�c=2\n@\0I%�\0�T\�1n@\0�� �\�\\cF�њA�\0��J��\\\�\�	\�9\�{�m۶�OQ	.\�\"\�N|�C)3�g[\���V \\1[9\��0y�䂻�U�W\�\�v\�mg�6�P�~}˩��ޥ:���9��\�\�sE�(��,r�\�\�7�|�i,�\n\�\�+��\0Q{ה�2wPQ�/QըQ\�5\�2s闧Z�C\0\���\�q��\�\�계\�k�z@���M \0�$@�H��+ \0�t SB윔�\�J\n�rP\�g�J\���r��Y��Y\� \�\�\� n�\��sZ)�\�!�v�ˑ����^п���jW9蕾HQ\�ݭ\ZJ�\�PZ%�@��<\�\"TV�\nʋ�H�\��N�(��RP)\�v�¤�Ɨ\�3\�\"\�j�\�|\�KK\�}77��]�!��\�ޙ�KQ\\m���\�PTL~4B4q�\�}���.ŸD�[~.�h\�NԈ\��D\�\rj4���\�b��(�������2}3w��wz�{���\�\�\��\�Uu\�{jf�\�:�<�����MuT;A�T��6 j\�=w\�B�Y\n\�-����[\�˚/~�\0@\0\�@�(�\Zm \0@ N���n�}��0Z+B\�\��\�ݻ>ՐNChc_�{*bZh���\Z���Bu�\�o?W+\�\�c��\�V�\�/�`�%t�\�\�# �S*����*��[�;ߧ;\�\�	뮻�+��b�J%D���\�\n\'�����\r��xjL��Ra\�C9ĥc*�w��\�\�BU\r��:\��\ZS\'Y$���1\�\�g1�1�8�μ�����\'� ��$z\�˚/�\�	�\0ҹ��\���\0 \0�\�@�H^L\nZ\�\�\�h��AT)��?�\�k�u\�Jߐ{i\�_5�Y_j\n&�:�жm[�\�H����\nQ+��N.)#\�̙\�j\"\�\��Ê+����㏛�V\��\�I��K�,q��.]\�D���~\�լЉ�=��k�\�\�?v��A�/r��~إ6ү�\������k��\�N(P\�j	:��1\�{\�=;\�\�\\��gz��ם�\��\�s\�=]]�O>�\�Տ�1c�\�R�\�\�l�\�܉��v\�ɞy\�F�.�C���\�CE�\�\�.W��1�\Z���\�$�\�Ɵ��g\�ڵ������K1�p�y�_�ۓ���\�L㯦ʆA\�L#@(u�>� _\�|q�O��\0 P�4�\�\�\�3TF�\��\0 �8�\�Ч/�aQڴW\��ܔE���y\�Xm��N@\��\'�|�u\�ر�\0Q(e�R	}�\�6u\�Tg\�\���\�,+E�jTH@\�k���\�УG�z�\�\�g�u�d\�e�]\�\�m��R*\�B\�k�ۨQ�\�@\�e�R�\�tA�\�ӹ���l��\0\0 \0IDATv�]�vv\�Wڔ)S�`!tA\'Kt�@\�N;HИ={�R\��\�[o\�l7n��\���\�]]\�ש��P�����\�/:�\�G�\�\�\�N;\�4wrE\���\�\�-Z\�x\�\�\��`\"_t\Z�1�k�7A\� ~⑕+��\�\�\�M�\�k���]]]�`\�\�LȎ���q���Jw\�K��ƌ�@xZU����\n�� \0@�d%�\�F@\0��*��t_F�-@T\�5�\�\�|�\�&�O�\�w���@\�C\�eۮm���m�������hL��\�)��ߟi���Y]��\����K�\��8��\�\�w��\0 \0�\�	 @Tΐ \0@ Z\��7_F b�%w��TÆ\r�]v\�ŝF\��@X�-W�\�h��x\';�� \�~o $<��q�͘�-�vQ_ �	�����\��.FC\0\�\0�!\0xF\0���0�\0Q�	�B֪ՠK)���j�\�W��A�\�-�܇���r�}��;�\' ��(�7E _�xs\�h�\�y�mŲ��*m\�\�_\���Z7cǎu�V]�\�^{�&�+\�޻���y]\�\�\�ѣkb��%q\�o��\�:�xg;\�\�G\nο�#�[�i]zC.@\0�@>\� \0$�\0D\�\"RĞJ���z\�9\�\�۷�\����z�\0+\�F;�\��\\]\�NP=�\�@9\��\�R\�d�@�\0�`�G�ܭ�۔1�X�-W\"v\�yg4hP=��.�\��\�^\�|��o�q�{t\�\��x�TC\'��i��%q\�\�Ç[\�\�`{��߄\��l\�S@\0\�H\�Z>\�>C9\�h@\0��2s��g\�v�Q\�Q|﨏f�L\��\�\��m�vS�\0!\�A���\�w�mGy�\�q\��\�&@Q��\�:�@F	��%��\�\�	��q�M���\�L%�嶲��\�+k \ZA\0�@*	�q-f�!�A\�)@\0�*�(�wR/@\��P�V�L�\�\�\"\�h\�?\�#P\�e�\�آ\�\�\�1�h\�{�.��\�i�h��̝�\�\���s�����q\�p��\�\\��\0DT\��@v @d\'\�x\n@\0���]̂\�\n_��w�\��l���+�ޥK�.\�\�3\�tS��\�\��{\�=�l����\�\�6&K\�_c?�\�#\�\�R\�\�\�ܴ��K?\�\�x&��>$�\�{��|\�\�\�\�u�\�\�\�\�G.8�\�j\��>��_�|\�\�k�4%@\�|\�9{\�����?\�\�\�]z\��ߛ52�aSL\0\"\��\�5@\0U �\0Q\�@\0���)�\�\�\\\�\�h\�\�\�s\�=\�6�����\����\�;�C���q\�A\�E]\�\�_|����;v\�h/��� J�?J;��~̈\�wuU\�\�A-\�۬��\�n\�\�\'u��p\�D{z\�y�\�\�\����+��O>�\�\�Y{\�\�\�Ov�\�2~\�t��\�K,^�`�m�\�FO.7}�\�\�\r�a�=\�\��$sHJ�$@�\�\����&m�e��\�\�g\�n!�ș!Pʚ�\"ԙ�8\n@ 4�\�\�h\0@\01�ù�\�>\�\�\�9\�c#F�p)�!b\�u׵\�?�<*s��\�\n)�b@�,�>�(\rͳ\�>k\�~��u\�\�\�\�~�m7�6s\�>�l�\�UVYž�\�^\�\�\�h-Z�p\��\�f�\�n���y��\�Z��\�w�ux\�? \���Q�¬�*���\0 �>��\�}�<\�>�O~a+ \0��@��$\�\�<�\�\nr��\�/�3\�8#V�\�, b\r�C�li|h)\r3A�\�L��\�\�t���\��jn4@\0�@b�q-f�!1��@\0�\'�\0\�\�d�\�aTBĕW^i�m��M�>=V�\�, b\r�C�li|h)\r3A\0\"a�\�\�J\�|\�8���\0 �4�\�\�\�3\���!\0@�le��nC_F\�, �;�\r�H\�CK��s_6	 @d3\�I�ڗ5_R�a \0��H\�Z>\�>C\�\���\0�H\0\"�Q)`�/�a�L>\�\��4>�d.�8�\0D(\\\�3_\�|1c�{@\0(�@\Z\��a�\�\�F3@\0��\0D�p�\�ڗ�\�0�(g}A :i|h��=��\0D\Z�\�O����%�\��\0\�M �k�0�\�.\�A\0�\0�\'q�\�a4\�\�\0ɇ��#�Ƈ�\��C@����c&\�˚/ft@\0eH\�Z>\�>C�\�h@\01�2s�\�g\�v1�]\�Q|﨏ffVWWW�e1�\�\�\�h�\0!@\�<i\�eH\�CK�(h�	�\'n��\��\'fB\0\��4�\�\�\�3d.\�8@\0��\�{\"���\�0B��1t\r�\n��4\�\0�\�# <\n�B\0H �4�\�\�\�3$0$�@\0��\�{\"Ơ�	D���kT@ �-\�i @d \���\0\�Q�0�@	�q-f�!�!�$@\0�\'@\n&O��/�a�L>\�\��4>�d.�8�\0D(\\\�3_\�|1c�{@\0(�@\Z\��a�\�\�F3@\0��\0E�c�e׾<��Y @D9C\�\�H\�CKtt\�)� \�U}�e\�\�/a,�\0 �ni\\ˇ\�gHwt���� <��/�a�L>\�\��4>�d.�8�\0D(\\\�3_\�|1c�{@\0(�@\Z\��a�\�\�F3@\0��\0D�p�\�ڗ�\�0�(g}A :i|h��=��@ @��o��\��\�m��\�Yit�F��5_°a \0��@\Z\��a���\0 �<ɋIA�|y\r�0(&@\�ק�~\�q\�۷��7\���\�\��|�\��B\�!�,t\�Q\�\�eN\��\�i\�>6\�\�\�lx�\�\�{3K\�S��\�3\�$�s)*;�\�\�\�vT�G\�\���\��\��\�\�]|\�Yg���[٬/��Eϰ/�������\��}�����\�\�,�\�ި���\�\�?�7\�v\'k1m��[�>��w\�9\�Y\��\�_\�Q}�F\�O\�\�w�\��\��絶���s\��(ַQ�S�gǎ\�>��7\�\�fΜ\�\�fB\0�@.O\�C�OB��H-�4�j*��±XL�\�S�\���v\�\�\�\�?�B�1����\" \0$�@\Z\��a~\�̨` \0�l@��$��<��Y��ɓɇ��#�Ƈ�\��+\"�\0Q>\ZWH��5_�n\��\0b\"�Ƶ|�}���\�- \0T@\0�x\�l\�\�\�h��D5gcA�ti|h)\�{���|Y�ՒcC\0�@qi\\ˇ\�g`n@\0�@�L�9\�ճc�\�W��(�w\�G33�=��\�i\�\�\�h�\0!@x3�04c\��В�\�n� *H���\�\�I\ZC\0�@lҸ��\�X:�\0 \0�\��\�{\"\�\�&@1��!P�4>�T���$0{�B�<c��\�\�9�\�\�r�	 @\�:�@�oi\\ˇ\�g�;zX@\0I \��D�� �A\���@\ZZ*�AS@\0U%�\0QU\�@ uҸ��ϐ��\� \0� �\'A�\�a4\�\�\0ɇ��#�Ƈ�\��!\0o	��\��0�C\0H9�4�\�\�\�3�<��@�K��$l�<��Y @x2�03s\��В� \�pEH�T>\ZWH��5_�n\��\0b\"�Ƶ|�}���\�- \0T@\0�x\�l\�\�\�h��D5gcA�ti|h)\�{E���$\�˚����\0�H\�Z>\�>s�\0�G\0\"y1)h�/�a�L>\�\��4>�d.�8\\���ѸB���*t�\�X�d�]x\�΋�\�?\�Z�jU\�\�7\�|c7\�t�]}�\�\�\�O?ݎ?�xkӦ�\�^c>� �Ƶ|�}?����\0�E\0x��0\Zfa�\0\�\�\�\�\�\�H\�CK悈\�@���+$\�˚�B73\�|\�̙v\�E\���\�ok���\r0�~�\�_\�z\�׀\�\�\�O�\�o�ݽ�{|�A\�u\�]���\0�l\�2�ꪫ�[�n�\�{8�o�\���-�\�\"�c\�N �k�0�i�/�A\0�\0�\'Q�\�a4\�\�\0ɇ��#�Ƈ�\��+\"�\0Q>\ZWH��5_�nf����~jw\�q��\�\�\�6\�`�<y��r\�)�\�6\�\�\��{[}�\�\�<�\�Sv�\�W_}\�^\�m�\�\�\�;\�\r7ܰ&\��q\�t\�M�K�.���\�;\�د~�+1bD��\�\��@�q-f�!!\�E@\0\�@��$d�<��Y @x2�03s\��В� \�pE *\�G\�\n	��\�\�\�L6�4i�m�\�&֮]�z�ǎk\�{��\�osB��ŋ��F*�\�j���RJ%�Y��M	\'N��N:\�F�\�\�5w �Ri\\ˇ\�gHiXq��\� <	�/�a�L>\�\��4>�d.�8\\���ѸB���*t�\��!�\Z��\�:\�~�\�ݫ����Kʹ�\�\�\���Msb\�UW�	���:�\�{\\Z��ﾻIQ\����w\�y5��B\�;i\\ˇ\�g`@\0�@�L�9\�ճ\���<+�kQ\�;꣙�\�iA\�\�\�\�\�h�\0!@�2��3k\��В�\�oe *\�G\�\���\�\�KZ$6\�t�j$(�\��\�\�\�\�Չ��ڕW^im۶�\�\����\�7�qi��\�z땀\�Ÿq\�xp�\�g\�믿nÇw�]��֧O��6|���[��J�\Z�����{�\�N\\PAi�Mŧ\�9\��7o�R��)�t\�\�;\�\�\�1\�\�)\n�YtM�0�z�굒:yq�\�7;6��|���Mǎ\�\�?�_c(\�\�\��swϨQ��]��\�էx\��\�\�k��_|\�\�\�2d�x��)֧ڶhтIo�q-f���@a( \0$�@\�;1�7L� b]C�i|h�\0M3H`���6y\�\�׭s�\�\�Z@��u�;�-�\�\�N7h�^߿���\�_۫��\�6\�%\"�q\�v\�%�ԟ�hJ�Pj\'�\�\��	\'�`�~�+t�\r�\�ӧ۟��\'[{\�\�\�߶�\�:\�\�=�\\�\�O~b\����~�\�\�j�\�ȑ#m\�u׵��J_~��%\�\�>\�v\�С�vKX���\�\�O@H� �\��\����\n\�:I\\Q�\��K\�t*d�����\��h\�\"\'���h�\�#�8Cu4^y\�S��O>�\�\�&�u�/����-X��	&�����뷿��\�t\�M�\�N;�\�Q�}���I\�\���/Ҹ��\�\�K���\0�K �\��\�&@1��!P�4>�T����\0�J\0���k:جY�\�\�[ou����s�\�F�\�\�\�Aغ\n�\�1H ���\�\�\��s� ��:q�\��\�g��\�;\�	\0x\�J�쓀 ��C��\n�w\�N\�\�	\Z祗^r�%t�\�邗_~ىr�5\�\\Ӟx\�	wC\�K�Q\� EU`W�\�o������\�?�\�~���.�{\�Νk�Z�n]�ϚN�@Ҹ��\�P2�@\0�@\�H�3਺�\�a4\�\�\0\"�\�A?��@\ZZ�%Do�\0\�#\�˚/>\�\�Y��:\�p\�GZ��\�uZ\�\�w�K�T(UQ�\�\��\��\����=w�B}\�b��\�O\�#�p��z�~\��O���g�\�NAl�\�.\�Ӟ{\�\�N]�$�(�\�\�W_\�\�=\�_\�\�k�RXO�N�\n�*٘�x�&i\\ˇ\�gHS,��@ZP�ړH��0\Zfa�\0\�\�\�\�\�\�H\�CK悈\� SE�h\\!_\�|��\�\�:q�\�}���-�ܲI\�T\�I�c�9��\��M62+(\�H\n�\�Ʉ TP\�A5�\���/B���*i�M6qb�N-\\|�\�.\rT�Kv*�Njl��ƑJ\�����\�	 ��q$r\�{\�\�4G�S��\�$�@\Z\��a��l�\0 \0�\� @x2|y\r�0@��d�af\���%sA\�\�P��\"|4��@9k>��Qc�\����t?�{����\�\��\�\�\0W\�B��\�\�w��6��(\�uS\' 6\�l3W\�Zut �C*��\Z\n��B\�Q�����)�~��\�\�on\�{lр)�$\�H���Z�<�\�S�.���BbA�AJ5�;�D�^x���j޼9D�\�BXX�4�\�\�\�3���[ \0@�\� ��\�\�\�y-w�JڅY @TB���*ԧ�z\�_�m��\�\r\Z\�oÆ\r�|\�8\�\0;\��V���Q�+m\��В\�͜9\���W���\�\�>\r\�\�\��\�1cƸ�\�\\`�.\�-R�T�|�\���m�5���\�?~�)o��;\�\��)�^����Z���\�W_5�V\�\�����\�M����m۶�\�w\�\�\�j]�t�o��D��z��\�x�M\�G�(�Q�=���\����C:YеkW{\�\�\\\Z���\�g��j\'螩S��S\n�M�\�{�jR�\n]믿�m��n��5V�Xa�\�v��1\�?\�I	)��?�Хb��P쒐��Sr����\�\�dD˖-\�\�N��+|7�k�׃:�;�g��\�\�BI\�\�i�bmS>-q/�Ҹ��ϐ\� \0\�	 @x\�0��t)\�\� ��P�\�\'�^|�E�\�/{\�\��\��~=�\���K���ytk�b\�\�o�m7\�x�]x\��\�ߺ\�Ν;�c���W�	$��E(\�xQ�h�r�\�s�\r�\�6$�/m�\�~m�\��#F���$\\\��9s\�8��s\�q���\�\�L�;\�\�]�Pi�I�\ri���~��\�[�\�8kժ�=��\��N\�W\�ɍ��%K\�F}�5�N\��\��GZ�i��6���>ڭ9%F\�^��\�\�\�b�R\�CpM�0���\���侦�Z/\�;��\�sc�򗿴A�\�\�脆l\�\�/��R\�ӧ�\�[���$*\�/\���\�%�\����Ho��F}1\�\�\"&A@E�U+C�>蠃\�8�����\�XJ\�$�Dv-Z��\�\����\Z:I��t\�c���r%\�H�)\�g�\'ɝ}X�5I_˗�0�\��O@\0��\0D�|#뽔�\�\�&�M�Z^aI z\�![e�U\�C�6.�\�w�\�_�\�\�Q�^z\�%���_�\�^k���%$ZT�\�\�\�_��W;ꨣ\ZZ���\\r��\\R��j�b�\�	$��\��矷�\�{\�	\�F�\Z\�DB\�p>��\��І�\�����/�+Pm\�\�7��\�\�Rlr\�!M�\�І�~\�\\��fܶf���π\��\�ؚo\�¯\�\����m`�>����\0Q\�\�1z\��/_\�d�iB\0�H�Z�\�\�3�\�?m \0@ ^��w�\�P6\�ї_~鎢\�]��\�tļ]�v\�W\�\'�9سgO�68�-1B�:B_�<\�J��_?\�CcW�ܸ\�!\�(>H�C�~A���\�\�-Z8�:��_f������?��^`\�)\�\�V�m�q���\�y\���[\'���E�#�f\�B��\��F\�\�(�\���\�?\��^au+V\��eK\�B�`��@`ʔ)\�4��As�χ�a�����/�)D�\�h@  ��&�@�hQ�7h3p�\�\�v\�W:b��.-J\�\�./�\n�\�9ڵѪ\�\�\�l�M��\Z$�\�X��~��&\�*�\'���-�O���\�r\�M�\�R9��O�\�6�k�ѡ�AdWS�\Z$�(%�RI4uob\'�\�!@x@\�\�\�]�\�\n\�Z���\�,*\��\�AO�����\Z\�<�K��{�8\�n\�\ZjJ�ǵ|S� �\"\�\�!\0$����s��=;�K����.�\��\�\�Lh\�pZF\"@\�.T\�0\�Ɇ\�7\�\�\�-t\����_�~���.�\'�|r}q<\�jο�P�1�ME$Up�\�Guyu��=\�4U\�x��˯K������\\j�\�N�\�Ҧ�\�Өpa~>`ݯ\�z(T�A]A\r\� r\�J\�(���7x\�M7uc)5��\�k��z�\�\'\�/ԕ�^v微\�?��\�>p\��\��~SJ+�PQ\��\�[ϥ\�*\�gжv�$]#��Т��:1���NF��\�.�\�\�]P\�Y���\�~{0m�\�}���\"�k��\�J�\��@suƌ.��rQ�~\�\�{\�\�\��\�ۻ6*��\�\�:%�_�BuV\�:\�,\�.���R{��z��N�v\���b\�ݻw;\�|��������P�\��\'5xO�\��\�\�\n�\��D\�\�M\����ت����No(W���~\�\�S\�ܜ\�;vt\n���坂\0\�K�\�i�\�|K6���X��;�И�@�H\�\\H�W�\�\�:���\�riM�\�c���P\'\r�a���oʿ(6��\Z��C\0�\0r��*\�\r b�OaI���G�ڔ\�\�\�lP��6\'����\� tA���\�w�+��4O\�\�ӆ�6\�\�\�O�S�^F�\�OiuC��\�o\�n���\�\�\n�U\Z;v�@��?z�h\'@\�\n��ԀP\�\Z�[l��+\�1t)\�\�s\�=\�69�Y�M�<\�٫����D�\�;\�\�<�L�\����_s��\�?vir$\�\\��+��{\�F��}�Kc�ؠ6YUl�P�j��\�[\�8��յo-:] \�K��J��Kb�6:$8\�\�.n�\\�J\�tJBbWS�����D�m�\�\�����6STt���s�S_J)$<\\|�ŮP�\�\�p\�\��\�\���J\�$L�4\�\�n\�{RW�~ֿ\�Oc\�~}HXg�uܽJ\�ρ.�����/	z\'u\�I\�\�.ճ\�i��\����\�_w�\�n�\�fW\\q�}��\�w)2�_�\�\"j/qr\�}�u,�٨�%}.\�%fj��}�f/Xh�g̱~ �\�<\0\0 \0IDAT\�:�b2v�����ߞn\�ͱ˖��L\"�j\�\�R_A�\�}�\�\�\n\��\�j���/�+d�tqк�\�	\�\��/q�տ�R�}2�\�\�n�\�\�f��\'���\0�I �\��c&@>Z�\�\���eP��>m�i\�M�Ls�@\'\"td]�J\�&�6A�6IW\�n\�ܹ.�|\�֭\�Fg�\Z�Uү�%l4%@�Om��m�*g�N\�\�\�\�h\�\�_A�m�\�_\'�x�M^~�e��\�\�N?\'Ct�\�\�=8E\"�E�A~� �v�����X�m\�\�\�4\���\��\�g��y�?+TC\�\����\�=�P7\�K���\n\�$����lz�\�\�\�\�\�\�\�|����\���\�f�m��\0��$ \��r�	�W��_\�9�\�\�>G��P��\�ЙI��\��\�y\��Wpv忮\���\nD\�\\\�@\\\�}�݂}�ʛ� �u��\���@\0��m-_��a�J\�{ \0@��H�T]\�e�F\n��\�U\�P�ߪ���B\�\�:4�Qߘ�	�	�\��ܹ\"���0��z�S�N�e�~٬��\�T�6m����]\��\����m\����\�u�q�\�k!D��F$\�H�ѯ�ub�X��\�\r��\���\�o�_�\��J\\��r� 4�6�u�B�8\�=Š�\��C\�e�z!�\�\��~��㏝ ���NJ\��C~M\Z��\�Og�q�\�\�NH,t\Z_���K�*��J��x(�\\��\�[(�\05 Jgŝ�\0 �2�\��\��TR\�@ �(B�̸�dD�Ulc3\�m\�\�p\�\r�nA\�B��\n��\�\�\�/��K�\\�\�w\�������P�O<�Kq�_lk\�t\�\r7ti�\n]�I\r��Rj�BM9���k�5\�/G�; \�/��\�\"qPB�N\�\���JL\�\�\�_\�\�-@\�d���\�\�\\U\�\"��4�+ \�o��M\�}\�[x\�7��\��UZ�K.���@\�X�\0�\���\�h��q$@\�\�R\��.@��)�\�F(N�К/�u݊�|\�\�P�@\0_\��a\"�\0��B\0H�\�Ť�E\�\r�6\���j\�yׯ��\�䥗^ry\�\'=�RJ��87}I�֖\"@(��r\�k�2��j\"��\�\�\�͛7�D�NA�(�~M��+!\n]A\n&��R\���:\�ڴi\�~�-�D\�X�\�>?��*$\"�)w�6��q�ko\�\�P�{��A�(uv��-$\�\�\�CP�\��\�ssNi��~�0�ZA\�2�UEs�XʢBԚ:�4F:��>�\"\�\�G����)�\�Q�)�9Z��ݩ�B)\�?$T\�&���\�M��\�\�\�\�\�Ҡ)}T!���0��T/B�k�q\�U\�s����*ֶ�Y����>sF�/�\�\�|\"\�;\��1�\�\� �A�\0 �a-6Za�q? \0�d@�HV<�Z�\0Q�@)Ϻj9h�;�\�޽{�Z\n���\�jcO��\��{\�o:����\�\0Ԧ~��B\�ڸ\�	�\�\�\�XU��v\��\�`Я��q��㏻|瘟�\�\�:����\�l\�/]�\�\�#�D��~y�\r�\�\Z\�\�\�lпċ\�K9\�ZIi]\��\�Sj#F�U�x.m+��NF�7Υf\�?�Q\�u��[��\�g?sy\�%�\�q\����6r�+�bm�7C\�?R\�Zf͚\�\�6�s/\�=VJ����\�>h\�H$T�d\�%�(�X�_�\�}\'\�BB�6\��/�#�Kc\�4�Nh\���\�Ns�\�=�\�\Zk8�C�\��N=(E���K�� \"�ڼWZ&\�s\�{G��z	J����\\\�{\�?�����+-�\�c�P����\�ӧ���/�\��5��\�\����x\"�sOo\�dE�\���q\�1ǸTm�|j߾�=�\�#�\����\�\�\���\�A��)Z鳵�5\��\�ƹuEP`:�NV\�5.@\0\�6���\�ˉD9\�h@ 9 ��F-)\�a�Ŵ�ns��W��A�Pk3N\�ڤ̿����\�E\��JW�M�|�A\'$Lt\�ر�\0����K��R\�\�E0�^�<\�W\�J��\r@m\\js�G���66�gm�j3S\�N�R*}��\r^\�ߴq��^vI4P��\�~Y��:��Mm\�jr�\�s�\�Um�`�nݺ�NlH�Я\��\��ꫯ�tV�=��m�\�F�\�_�\�\r\Z\�ć�\�\�r\�i\�$?�h�\�}����\�\�\�\�\�]:at\�M7տ�t\"B�)\�Зp�M��3g �J����\�sO1b�۸޷zMcJ�3f�$�����\�.�\�\�N(\�\�\�\0	�CT�E\'\'T;\"��^T��\�\���aÆ5(.�\�g�u�\�J9\�!B��|�A\�Ftr$�]�1�\�rK�9�B\�Gr_\�/���\��c���>3$�6\�֗�	�/�J��a\�|�|�Ǐ\�N�t\�	��\0 �@�\��a�Ƚ7\�>C�c\��\0\�#�\0\�H{�0\Z\��!;�0H�\0\�\�T\�.Q��\�өt\Z�\ZH\�CK�B�\r\�ƊO�\�\�Z��\0Q+�+\����P,e\"T!\0@ [Ҹ��ϐ�h\�- \0? @���Fk\�Z��D-\"\����/v��֯�K�eu�<��(��%\n.I\�C)\�t\ZJ5Zrk\�$��4ـ\0��h�\�K9�^b1 \0\�E �k�0�qq�_@\0(�\0D�\�\�җ�\�0��N�FS�w�ե�,A��\�X�%\�$P\�C���/J�>���%������P����x�\�ki|Y�\�\rwA\0�@�	������a\��\��_\�\0 \0�\��2s��g\�v\��\�Q��\�Q;K__W�9\�k�\�\�/�`\�o�}\��	D\��\�\�P\�|�\�]�T|z��\�+�/\Z�O \�C9\�㏹j+\�\�C�\�ݝ@�\"\�\\�@���-=7M \�5_\�#r \0��@ص���\�g��l�\0 \0�d�\�{\'\��\n\�{ｮ(\�e\�\"�v�\0!@D��!	�RZ\�\�駟�W\�A�$tRC�,�\�3\�X�n�khCg�\0DV#�\��\0�!P\�Z>�Ѫ\�K�}�\�X\�(�\0 �fQ|\�dR���0z�hS�p]J�3bĈ\�\�J�\0!@D��!	�RZ��\�k�V�	& @D:�\0�J\0\"��\�o@\0\�(e-\�S6�\�9\�7���&�@\0HR0y\�rF��۪U+S�\�8.�8�\�\'�K�\�C\�ן~b��͘�lA� �\'F�\0\�I�\�5_:i\� \0�%�\0��C\0�@\�(B7\��/\�aTB\�ҥKW�@\�Z�nm.tSq\�C9\��[EM\����_\�ׯ���\�j%�3x�`��曭M�6%\���Q�K?\�\�x&�\�E�l\�+\�}>�k�c��\�lْ%V�by��h}\�\�M\�	���\�!ȴ\��2\r\�!\0@�& \0$�\0D\�\"RĞrF�\�g7n�;\�{\\Q����Z0`�\�\�>�\�{\��{\�u׵}�ݷ\�\�۶mkw\�uWI�>\�.�\�9rdI�GigT�\�O���\�\�9p\�@\'@\�\�Ãg���>_\�\'%DI��\��� H)6��5_�q\�\Z \0�$�5�~\�n*\�\�o\�\�` d�5�=L���Ƞ�\0 \�(O&H%�\�s����+D<�\�C����G\�}��5 \"\�O���@�+z��%��.�\�޽{\���\�][}~�\"T;B\�(�\�As ��A\�\�{\�f������I���Q:\�G묳�u;\�$\�3xH�\�\��#�[�i\�?K\���� \0���\�[n\���Ͼ�ƾ�F���\�\�7��?\�>�W�a, \0��@��$Е����\�\�ښk�i,�\��0�\��\�!\"!M\�|\���৓\�D��a�X�e�C\0�@�.�Ǟ?\�p���\�g�\�Q��\0 �R�6ʇ\�SN9\�\�{\�=;vl\�އY @D��!	�����\n�৓@�H@2lB�k�c\�u@\0�m�\�\�\�ka��v\�!\0��\0�\'��\�a4\�\�\0ɇ��#P�p]SBD\�JjF�Hmh�p̗5�01�\0RA \�>C*\�	@\0)#�\0\�I@}y\r�0@��d�af\� \�{�\�r\�u�\� 27UR\�0DjC\�c��������\0 �\na�R\�0N@\0H�)3\�:�zvl\�gQ|﨏ffVWWW\�\�2җ�\�0B��f�ah\��\"@\���O>�#�8��1q\�D\�q\�3Fw\�F\0\"m�\�_\�|~Q\�Z@\0\�%@\n�\�\�\�!\0@�<a�����\0Q��Z�	DIH�	U\'P�\0\�Ǐ�g�}�\�c��	\�^�\�&Ϙc��u��k��@� �D\�\r�\0 �\0E�C�\�V@\0����\�\�F����	 \��Gy\�z\�!��\�K�m۶�\�E]d�fͲ���\�ڴiS\�	�\�	� r��\r7\�0z�\��@� @d(ظ\n@�\n �\0�! \0@�Q�`�d���0Z+\�\�\�\�GsԨQֿS:�޽{��a\�l\�С%π�~خ�\�:��\�[�cǎ+	~��z\�6u\�T����#L�L��D�\\\"I>` \0_	��\��/vC\0\�\Z��E!\0$�\0E������0ZK⩧�r\'Z�nm����;� \�c���\�?\�:t\�Ѐm��\�m\�-��h䞀Xe�U쫯��+V\�UW]e�\�\�C���.�kE\0�V\�7)H���Hd\�_\�|ٌ^C\0��\0�1\�b@\0i#�\0\�ID}y��\0������$@�t\�I6z�h\�ҥK\�\�.���\�L���\�*@��\"l�J$�P\'2,�1ʗ5_f���\0<\'�\0\�y\01�@\n @xD_F} /^l��\�\�{\�1�����\�m\�]w�!C���\�\']J�t\�]w��_��\�k���03�P��9� RT�\\�e\�\�RL�\0 �i�?\�C\0H�D��i#|y�Q�X�p�]q\�֣G\�n�\�l\�ҥNd\��$Jl�\�VMOQ\�H�W\�\"�\0Q6\ZED��5_D\�\�\r \0\�L\0\"f�t@\0M@�hQ2n�\�a4�D�\Z]�v�\�}\�{�駟\�Ga�\rr��uq\"\����\0D��!\� ���[\�˚/\�q�?@\0i!�M�A��z\�N�}�\�x@\0)%�\0\�I`}y\r�0�\�k\�\�/���\�W�\�j@�\�ݻ`�&L�^�z�\�7\�|c��~��\�\�\���\�\0Qq�\��\'>E[\� �\0U�,��/k�R�\�>@\0�@�\�\�3T:\�!\0@ z\�3��G_F\�,�%@4U�zŊ�\�/ڽ�\�k����M�:\�Ձ\�5j\�(�Xf4�&�\0D���m\� �\0Q\rʌQ��/k>\"@\0��0�ղ�q \0@�tSf\�u7�\�خ�F5�3�\����\�uuuu5t%\�о<��	P�\�˗\�UW]\�\�+�y晶�\�\�Zk�\�\�	�ps��\�C\0\"=�ē� @�ǍV\��e\����@\0q S܄\��\0\�F \��v1\� b�a�bƌ�\�\�g�ax`=��\Z8p�~�ᜀ�q�\�u2	 @$3.XU=�,�\�3\�X�n��7(#A\�? �\n�\0 %�PGI�� \0@ \�\�o#@\�`F�	P�w\�y\��1b�\�\�N�\�&O�l|�]r\�%5�GY[�\�\�\��@�	 @d;�x@ jQ�?@\0K�La�\�\�~_F} .\\h\'�|�-^�\�\�?�|[o��쥗^�;\�Ӿ�\�;�\�# j4\��v jǞ�!\0��\�#R�\0 \�?ℕ�\0\�L�\"ԞDח�Q\��\�̙N|3f���\�*v\�A\�СC]\�N�:!@x��\�\� @Dǒ��$@\n&?\��}Y�7~@\0H;��G� \0$�\0D�c\�,�\�a4iD�\�{\�E٬Y�\�ꫯ�6m\�\�\�ƅ@Y \�\�F��u��\�+���<D�\��\02I\0\"�a\�i@\0�\"�\0��p7Ɨ�\�Z\nO=��i\�u\�ֶ\�j�U}\�ٲe�\�W_ي+쪫��y�\�!@x��\�̆ �Y\'�\0��P[�}Y�Ֆ�C\0�@� J%\�}�\0 ��\�Fܯ/�� PO]\���\�q\Z\�.(h=u\�Tw\�\��� �\Z��\0DT$\�\�W�F.v��\�Km��\0 �~\�1B\0H:��G\�?���0Z+0b&� �\0\�E�02F1¥\�&	��\�k\�n�\0 \0�DЦϠ^]aK�F�\�g(w\�A\0�@| \�ciϾ<��Y\\s\�5v\�\����#eEg�@e *\�Gk�	 @�C�=К\Zu�K��lܸq>��\��\0 \0��	�\�g(�Sn�\0 \0��@��\Z\�\�B����!\0�\�	 @�Ί;\�I\0\"�q�\�+�@c\��[\�-l�M\�5��\�N�\�%\�\0 \0TD\0�\"|4�\0 PsSf\�u6�\�خ涔b@\�;꣙�\�\�\�Օ2f\"\�A�HD0� �\0��0\�d# ��&póSm\�UW��\���֦0> \0xN�L��!\0@�\� )}�\�\�\�b\�Ě\� R0U��À(�\0DI��)\�f/Xh�g̱~\�:�\�K\\K2�$G\� \0�E�\"\�~\�k!\0@��\�\�o��1\�1L� b]C���) \0�L�1\�Z�la\�;���7��\0 \0�,@�\�r���@2��)qh\�\nR05�� \0��H�h\��)�]S��w@\0�\0 \0��\0DZ#�_�\0�!@jOb�\0\�I�0)\"\��B�\"��Rc�`�q\0�\0 \0�\� @D��� \0@�Le��v3�jg<@\0\�*�Pg5�\��Lɉ�@\0�\0�\�\�~@\0�@��$��\n3!\0@�{އ\�{(B\�}q\0�@b @$&@ � <	=�\'�\�L��\0)�RL\\	E\0\".n��\0DP\��@F	 @d4�\r@ A �\�LA��$P�	��\�\"E\�q�\� j\0�7& \0DE@k�A��F\�]M�i֬�\�\�\�\�dl�\0 \0�\�	���\����hf�\�/�� *�\��\0�#\�\�D8\�\�	 @0;jM\0�\�`|@\0H�(6��\��@\0\�\Z\�����\�A��q��	\�5\�\\c^x�m�\�1ZD\��@��X��k�\�j�\�\�v���K�\��E�mõW�\�~�����E\�Z�f\�l\�6��\�@\0�\0*$��\�os�B�4�\0 PK�����]�+D�3.L�$@���\�1ZC\��@%\���\���mש�\�B�;ޝ��m�)�w�K��\�Νo-�7�\�\�[;%\� \0Ԋ�\��iX\�\�u\�]�Bȸ�\0 �1a�� j09�P\r\�fH@�\0ߎ\�DDE`���6y\�\�׭sT]\�B S(\\\�@\0�HCj@\0�&�(��9cĢP�\�\�5 �\0DX\�\n@ B�f̶V-[X�m#앮 \0@ � �u|�\0 �,�`JV<�Z�\�\"Ԟ�\�Ld�\0DfC�\��\0 \0@\0)!�\0��@\� \0�	���\�\�9ㄍ\"@1�G\��@�)\�!\\\�V4J�LL@\0�\0\�B\0\"-�\�@\0�@��$v���$P�	@\0\���ѧ�\��S\�\�\�w�\��\0)���VC\0H\"�$F� \0d�\0�\'�F��$P�	@\0\�@��>�\�;@j\�C��\0C\0\"1��@\0�%�\0\�I\� <	fB EH���`\�J(�pqs b�J��\02J\0\"��\�m@\0	\"�\0��`4f\n�\'�\�L���o_)B�+5&�\0Q\�\00�!@0	 \0@ *Z\�\�\�5�\�\��\0 ��o�KQ\�8�u\�iRz�(T�h\�	\�I��/�8Y\�w� @d+\�I�\"�Q�&@\0�\0 \0@��\�/E���\0Q\�L)�M*q(n�\0b&\�\�D\�8\�>C 2섺�\0�\��` \0@\0�\0 ��o)��\�\�F�=MJoE�J�;!\0�8	 @\�I���L\0\"\�\�Ɇmو3^B\0�R0U�2c@\0�@�D���\0㌈\"@1�G\��@!`qk�\�^�\�&Ϙc��uN�_8\�b���\0�N�\"\�I��A\0�@\�D���\0cT�P�\�\�5 �\0DX\�\n@ B�f̶V-[X�m#앮 \0@ � �u|�\0 �,�`JV<�Z�����|�^\�g���9\�ZL�h\�ƍ��G5\�\�\���\0D�8\��\0 \0@\0U\'�\0Qu\�@\0y|\�_�b�1�\r�P�\�\�5 ��o\nu׸� �\0 \0��@�HK$���� <�\' <	fB\0���(B\�}�w�Lއ \0$�\0DbB�!�\02K\0\�#@x(̄\0 \0\�	 @xB\����!\�@\0�!�\0��P` \0�\�@��$��	��駟vt��\�[_��׿�\�8��\�f�^6��	���;\�s�gK)\�/Ǹ\�\r\�\�v\�ʞ�~���\��a_\�\��\�a\��sT�\�q\��?=l\�_�\�:*;s?�\�\�?l���>\r;?\��\�/����ts�\�=׏\0\0 \0IDAT\�}\��<Y���\�\�Zi=�_a?����uQ\�\��Z�̚�a\�/a\�O\�l�{-��\�/_\�\�\�zlk\�L�T��Q�8ȯg�y\�\�\�\�*R\r�Q�\�S\"F�t\r�*�M��2�K1N@�8���\�	O���\0< �5��^]=�!\0@ �|\�_�b\"\�\�E�b4��!\0�|��\�\Z�B�QL�Z@��u�\0 \0@\0���o�KQ\�o#@D5{\n�E�b4��!\0�|��\�\Z�B\0�9�h�\�A\0�\0 \0@\0!L�9\�\�ݳc��jwk�\�1\�/�\0\�h]C\0! @��ŭ�\"�	�T�\�Kg �FC\0H$R0%2,@\0	&\��6D��\"@1�G\��@!`qk�\�^�\�&Ϙc��uN�_8\�b���\0�N`�\�\�\�\�:<\�fb \0@ 1�\�\�F��1�Q(F�\�\ZA\0\",n�\0 !�I3f[��-�{���JW�\0 �EY�:>C\0HR0%+E��\���_[�E/\�3xH�{Ən-�M�q\�\�\�\�#��\�gpTD`��v���\�\�\�o���ѺU�k�okO>�dE\�\��\0 \0@\0��\�pf@\0(N���F��\�	�\�Q(F�\�\Zh���f\�v�\�\�/\\h�쏬��� �E�\'@\n�ԇ!\0@\0�!�\0��P\�( \0�\�@�Hlh\Z\Z\�	O���@ @�>\�7�x\�a\�\�K\'@\�\�Yqg<H�Wz�\0 �EY�:>C\0H�dţ�5\�\�\�\�\�w<j\�(\�߿$�X�\�^|�E��\�\�N�vء�~\'N�h�{��\�cذa6t\�Њ��1�	 @0\' �fB�	P��\�`|@\0\�!�\0��X\�	 \0_	 @x9�\�%⮻\�2���\�o\�|�~�\�6r\�Ȣ�\�\���7f\�o�a��\�/lҤI6a\�\�իW$6v\�\�\"�t�K\0��\0\�@2 @$#X@ \r \�E|�\0 \�7O\�\0}���`�w\�yǎ:\�(;\�S\Z���5k��1\�\�>�l\'X4u��C=Ԯ��z��`��D@�HD0\"8�� d\���O\0܇\0 !m�\�\�5\�\�\n�\0 �\0D8^5�\"z�\��y�\�9\�a\���+�dz�\�m�-��.]�4iD���!a ̩���g\��@�`*@\0�\0 \0@\0i!�\0\�I$ �T\��޳�\�z\�~�ӟ�lDɨ�1! ̨9��� � @d~\n\0\0�\0 \0@\0�!0e\�\\\�Kώ\��Y�fVWWW��꣙�������\�\"$�n/U�\�<y\�\�\�/��\�?��\�3g\�E]d�\��{\�C1�n۶��\�B\�/�\�R8�H�UW]eS�Lq\�ڴic˖-�1c\�\�5\�\\\�\nXp�v\�y\�\�\�[o]?&5 J,��M\0�lt4L��\�Cw <\Z&C\0H(R0%40�@\0�%�\01xH�\��9\�ZL�h\�ƍ�i�P�hJ�x��\��2jԨ��L,�\�?\�z�\�m\'�x�;1h\� W�A��	�\�Ϸs\�=\�\�<�L\�ԩ���\��\�\�	�[��[o�\�~�\�\�v\�m\�\��w\�M7�B\�?��\\�՚\�\"�q\�\�	\�^�\�&Ϙc��ujB\0�&\��@*	P�:�a\�)@\0��@�ۜ�Hx�b4�A\�M	A\r�V;v�ItN@\�\�\'�p�{챶뮻�O@(��\n[_p�����ľ��k�\�\�\�㎳�s\�\�Ga\�=�\�J\�\�{\�N\�@��\�\�\�\�8ٍ=�C\0\�\"0i\�lkղ�u\��ݩJ.@\0�@� \�%G;@\0��\0)��\"s?�`�p��F��\�\�\�^���ګ�!:�0~�x���\�\�G��\�:ˆ\�\�\� t�\�/\�q\�N�<x�)�����)5Ӆ^\�N=����E�\�D���K\0�\�\0@\0�\0 \0�t@�HW<����(B\�I\� �T\"tՅP��K/�\��\�w\�}\�\�.��; \�\�\�ŋ�Pq\�\�:\�B\�~��\�۫��j\�s��=\�z�\�\0}�\�%@\�L S&��\0 \0�L@�\�D�q�@�	 @$:<�5\"�@U\"@H0P͇�o�\�	�N&䟀�7o�K\�ԿWI�\�\'��\�N;\����\��Lk���]r\�%ֳgOk޼�;u1{�l\�c�=\0N@D?\�� �\r��\0E��	�&@\n�ZG��!\0��\0Dzb�\'�\0|%�\0\�I\� �T1b��\���͠S	�/�L:\�\�\�O��K��\�+��\�\�l��6\�dS\�\�n��\�m�}��\�?�\�Ռ\���\�{o��\�\�\�SOu\'\'�\�bW�Z)�r�^�z��L�n�)D�S�� @0% �\0�H�P\'#X@ \r \�E|�\0 \�7O\�\0}���\�t�ȑ#\�\�޽�K�ԥK�,\\�\�	J��\�n��SO<�\�#F\��\�˭w\�\��m$\"�~��L�\��\�\�m�u\�q�[UFWz&��\�k\�>p�2Ķ\�z\��~8�<�\��@�`6@\0�9�ɈV@\0H�4D \0�M\0�!@D�b\' �)� �cIO+@�`V@\0�9�ɈV@\0Hm�\�\�5\r�\� \0xJ\0�!@D(�\�ң\� ��\�GG�\Zѱ��� @�ǍV�\0 \0@\0�@� @$/&-B��>P\�3�G�	 @�?���\0Dt,\�<\�q� \0@\0�\0 �<Sf\�uF�\�\�.y\��H��\�\�\�*�U}43S?�uT�!#@�V\�\� P�\�4�\�߿��տe\�ĉ\rjJ6̆Z}C1\� R^�A\0\",n��\0D,X\��@&	��)�a\�i@\0��\0\�\�!�9\�ZL�h\�ƍ�\0o\�M�P\�V\� P�r�\�&�f/Xh�g̱~\�:�\�=|�\0�A\�D@\0���\'�\�L@\0H�(��9c8�P�\�\�5 \�� \0�d�4c��j\�ºwh����\0�%�\0\�m\�0�@j��ɓP��ɓ@a&<&�\0\�q�0�\0 \0@\0 @0- \0@�\�(B]\��8>D���\r(�\0D\�\�h�2�`JY@q�\0 �a>�C\0H���)3 �\"\�\�!\0�J	 @TJ��i!@\�D\�_?H�\�o\��@\� @$-\"\�@ { <�9�\'�\�LxL\0\�\�\�az� \"\�Ige�u\�h@\0	 @01 \0@�\� j�\�G�(�A\0e\� \�\�\�n\�\n���?{\�\�\�r�Kv\�}�\��\�\�\���-[V�\�\�\��ɒ%�\�Fُ~���\�!\�&�\07a�o�\0DS��; \0�J\0�TR\�@\0q@���l\��\"@D�\� \0��\�\n\�G�	#/�f͛�5kn͚7��\�\�m\��e֬Y��\�\��w\�뫬��,�?]k���m���6|�p\�ѣ�@b @$&�5\"��\�q@\0�ЦϠ^]#\�!\0@\0�@�(�T�\�C��q\0 P\�L�|�\�v\�mv�\�w\�[o�e�첋=�\�S���>@��!J\�\"\��\�;@\0�\0 \0d�\0�\'\�F��$P�	�	TS�\�\��\�\�\�!�bmڴ���\�\���@�HK$��\�\�\�a9 \0@\0�\0 А���s\�=;����y(y%��P���J;�Ĉ�m \�\�~@ ,�Z	��o��u\�\�ў����s?\"%�\0)N:+�\0D\�h@\0	����@\0G\0b�Ĕ��Ŵ�6nܸpD#�;�\0El\�A\0%��\0�\�;\�ؖ[nicƌ�<�D�\�y\�̙3\�㎳_�\�W�\�>�4pR;������\�\�.�\��H]�6G�\����^x����?\�Zk���+V��_|\�n��F;\�l�v\��\�m�9֯[\�\�6�\�\�\0E @05 \0@ *���$�@\0�@VD��\�	�gK�\�<��\0\Z!PkB�\��\��\�W_ٔ)S��\�\�nW]u��\Z5ʵ9蠃l\�С\�Ep餛�Y�V��>}�\�Yg�e�5o޼\�1juC�M\�9s\�ذa\�\�sαu\�]\�.�\�2�?�]~�\��\�\�\�ܲƍK�x\�7\����M�4\�&L�`�z�*˾b� \"\�IgEL�1\�Z�la\�;�� \0@�\"\�1 \0D@�L@�F�`�eƀ@�	$A��\�_�j|�-Y��\�`|�\�7�\r\���\�Ͼ��\�\�:-вeK9r��o\�޵�8q��t\�Iv\�W�B\�}���v\�i\��{\�G\"�x�b��\�{\�\�`4f��v�?ޮ��jW3��0��9�\�C\��믏\\��9 \0@\0��\0�O\�\�V@\0\�$@jO\�\0\�I�0H�\0!|-Z�p�y~�\����\�o۪��j�;�7E\�+��\�6�%6���?um/�\�\"�5kV�\r{	s\�\�u�%�pi���[n�/��IQ��?I�!i6T*@4��)i�b \0@\0h�\0��\0jM\0�\�(q|�Aq P6��k����\�w��O<1�/�\�ͳ���\�1\�\�]:)��\�\�\�.\�С�)%�\�1u\�\�\��\��P�\�q�\�\�϶\�˗7y�A�B~�\�آE���7[}\�R�\"\�>E;����)�q\�+@\0� �\0Q\�	@\0� <��\n3!\�1��J��\�_|q(�����t\�V[m\�\�N�>\�h�:ur�\"\�{\�=\�I	�:AQ\�\�F�N#(\��u\�]W�@�Ď{\�\�f̘a��z�K��\�{ｷ]y\��)�T������ՠ\Z\�m��K�4S\�~���G�v�5x�`\���\�^kPDY��z�\�\��ܣ�:ʝ\�x�\�\'\�\�j+�E\�駟\�RQ\�瞦�M믿~}\�\�\"\�\�{���\�v\�׺S�� �u\�\���\�7�A\�\��㏯?��z��\�[ou>�&\�ҥKm��vr\'K;��\Z��n�\�\\~j�X��˱)?���\�b�\�]��-[\�{_3\�/�m\��\�u�����B�K��&37g�\0E�3?\0\0@ 2���#@\0(�\0D�\�\��\�\�\�#�b\�\r7tE�/�\�PA\��6�u� \�PV/����!�\���\�w\'$\Z+@ݔ\0��k\�\\��\�n���\'�\�^{٧�~jG}��K�M{���H!�$��m\�\�Ǝk��r���jV4k\�l�4Q����\��\�/���j�+��1\�=�\\[�`�,\�Yg�wm�\�t\�Mv�\�o�0կ6�_�u��\�m�\�vsi�$�H�y\��lРA�\�|\�\�Uq�_��צ\�߲[�4$*hC^�ϣ�>j�G��.]�8�G\'Pn�\���*�6 �Z+\����\���\�\�\�ڤ�]�W�\0Qj,T�C1;�\�i�m\�\'ې!C\\�:���!��\�����j\"s3\��i\0@\0Q@���$�@\0�@� \�%W\�vU\�p\� �m�k#[b@P�:�N)\�\��S�Lq�\�:	q��\��J��z�@��8�c�\�\�v\�G:Ad�\�wwC)\�\�\��{{�\�\�F�f�mV�NE�_� ԧN0~�\�\��]w\�\�	\�\\s��\�G?r�]\�\n�?\��\����E}Hhȿ�\�w_�\�J\�D�Y}�\�\�mA�\�@�(d{p�#8�v��ʵi\�u\�]\�\�|>�\�&c��I\�Q���s��q�T��\���`�����MͅJ\�Z%�~@��3nX\r@ ��\�3�W\�$��M�\0 ��\Z@a&<&\�\0��9�%߾}m\�-�l����\�\��~ѯ�Fw\�y��_�\�\�*�\�>��/�C\�r7\���g�}֍�^��tB�K�\�		c\�N?ڜ/���tJg�q�\�㎮�F��]���� ������M\�T,~��\n	 ��\�i\�\�hݺ�|©v\�\�\�\�=z8J\�0	#@s�M�6�L5\�f�\0D��\��\0 \0@\0H)O�\0\�I�0�T�x\�\�\\*�J�0)��k\�\�ש\� Ƚt\�@�VYe��\rsm\�K�����]q!\�R�g�y��m\�W��\'�x¶\�~��O@\�gՌPJ$	J���FA��B�hL\�X{\�]��\�4V\�#8��\� �1�\�V�h*�\�o�[;��.�g>[b���K�t�\�u�\�O�\�G�\�n\���\0 \0@\0i#0e\�\\\�Rώ\�pMY�\�Tɥ>�w��Ҏ*1\"l[��ĸK�\\B��U4���߷�\�z˶\�b��C7��TB�\�>����\�z\�D�>\�/^l=��\�\�o׮�ۄR\"ip�ɬ\���}P\\��� T���#�pi�tB!�U���åa\�I�Z\�	\���x�\�w]�i\�m\nq�\0l�\�V�fR���\�Z\���\rx�jR��3*%ӈ#ꅗ0)�rO@4e�jHH�ȿ��S\Z�Rb!_U\�\�\�_��\�\�h�;\�	�\�\' \�y�\�&,��ĸ�\0� s�\0 �\0\�\�\�a\�_\�G�\�&�6kyE�Z\�\�\�\�2��\�s\�=\�EkC6�Tc�k\�\�r\�JP�mZ��+\�F�\n#\�^��?ݠ{��~\�\r7�\"\�_~����{�^�\\݄B��urB\'\0\�{\�=�ѮM��K\�*�<k\�,\'dh�����\�N;\�ݪ\Zk����=�\�\�:u�S�\�\�wi~$J\�\�Ԃ\�2i\�[>\���rV*��F�l��\"�\��x2y�d;�\��m���wǪ��Z��NHhC^�\��>}�K7�b޹�\�S�i\�\\E�U\�[�N����D���|T\�m����Z\�^{��I�nݜ��tG\��n�\��*�\\�\n\�0(��1�\�g\�J)��/�m�\���\�3\�X�n�Wb�Ħ��P�Е\�Ϥ,��\0�\�\�\�; \0�h	P�:Z��@\0\�\'\��6\' b�\'Q(F�\�\Zh�@��6ԏ:\�(W�8��:u�*��q~\�w\�a�V��\�n�\�N=�T�\�\�x\�&B�6���I\�\�Tצ�Dm\�\�\n�Y�d�K\�4s\�̂D�H\��\�sOӯ��A��\�׿v�\�w;a\"w|	 $�4o\�\�\�+G���	�\�:9�\��5j\�(\�t\�M���\r6�A*$\�K8묳\�g?�Y\�\�\�j�FпU3CM.k�_|�;]�\�Fى\'�\�N����N�(u�\�Q�		\":iq\�g\���h� \�I�����\�\'�}.?�S�\�rlʏ�����~C�\\ȏEPoBbU\�%�@B�jjh\�\�\�F��\�U)sA\'S� P*�I3f[��-�{���6\�>@\0�@AL@\0�5R0\�:%�O\n�Aq P6���\'�<\�\�~�������*�ܣG��m����omns�#�\�HM�\�ciw\��.�U2$�J)��/��ѩ.@\0�\0 \������\0\�I�\"Ԟ\�@a&<&PL�X�\�<{��+\�ŻF�zN���\�K.�N\�K)��\�c�FN���t\�w�\�7�S:MQ\�+-DpBB�SV�^�>�Nt\�dϢE�l\�w�&ZƂ\0 \0@\0@��!@\0�@� *X�\�\�\"\�8\�.�|\�ۯ��n�\�^�\�\Zk޲�-[�m�p�\�\�?��Kw�Mq\�S\��\�j��\�\�L�6\�T�\�\�_��>�\�:w\�l7\�tS�郚4 c7<�裮��RQ���R�o߾�Ǝ\�\�a�D%�_�jt��\�R\�T\�b\�:\�\�OϿe<lW�3g��UѳgO[}�\�km&\�g�\0)�2h܄\0 PU�\��\0 \�(O&�\'�\�LxL _��\�\�]\�7�؊eKK�Ju\rr����u\�q\��K}iVm�m�\�Ǝ>�\�j�<h�o\�\��x\�޽�+<�\�&�T��\�\\0�~\�	&�\�>^.�;\�\�	)S>�c�\�{�m�\�sv�\�\'\�n�\�\�hQo�\�\�d�u�\�u�\0|\"�\0\�S���@:	 @xWO���@�\0���E�\�\�\�\�s�^\�D�%��n\�;\��\�3\�X�>}<��\�0��ѧ�\��S\�\�\�wjB\0�&\��@*	 @�2�8@�+��@a&<&P�\��K\�Q\�ٳ7^l˗,.\����ַo_�)`: ��\'�\0Q�` \0��ЦϠ^]\�\�~@\0��� <	\Z�\'�\�LxL��\0����ڻ\�j�\�\�s/�8o\�%\���5<���N@0jM\0�\�`|@\0�\0 \0@ *Q�����\�= `M	\�\�0\�Z�?ٞ|�I;��\�j DH�x\�\�l�=��&�&�\0\�u�Ra<D*�\0 \0@\0���M�9\�q\�ٱ�<�����۰���f\��x�\�w\�vT\�� �I�� �Ma��\�!�b�\���`\��Ǝk{\�W6\�uj @�&�\�:�\0\�m\�0�@\���)q!� @\0H8��C\n�h�\�\�\�b\�D7n\\MCE�j\�\0�C \�\� \\����1c\�\�<`�\�o�)\�z\Z\�^�\�&Ϙc��uN�;�\�!��\��\0J�\"\�	\rfA\0�@b	D\���\0\0 \0IDAT��\�	�\�E�b4��!\0�FT\"@\0�\0�#0i\�lkղ�u\�\�6�N\�	�\02I\0\"�a\�i@\0�\"@\n�D���1�`�$P�	�	 @x<L�\0 \0@\0�@L@\0�5�P\�:%��\0Q\"(n�\0\�&�\0Q6:\Z��\0)�RP܁\0 \0d�\0D���\��\0B\0\"!�h\����w@�R��}ZP�:-��\�R0�;,�\0 �4I��@\0\�Ob�\0\�I�0@��8x�)�Hq\�Y(B]4�@\0�@AL@\0�5�ZG�\�� J\�m�@\� \�FGÔ@�HY@=t\�àa2 \0��@�Hh`0�@� @xlO���\0�\��\��H	 @D��\�\� �\0Q4�@\0�@A\��ԫ+t \0@\05#�\0Q3�\�F�ǋ�!\0�� \�3�E:	 @�3�>y�\0\�S���\0 \0@\0h�\0�\'�@a&<&�\0\�q�0=R�⤳2 @��&�\0 \0@\0�@\"	L�9\�\�ճc�DڗoT�fͬ���\"[\�G33�SYGY�1DH`\��&�\0\Z\rRJ\0\"���\�-�����\0N�L	\�A\0�@\� @R0(\�G�\�&ڸq\�j\Z�(TS&�\0�\�\�\�z�,�\�3\�X�n�!��@��	v�\0 �J�NeXq\n�\0b$\��6\' �ͣk@�L@\0\� 0i\�lkղ�u\�\�6a \0xK\0\�\�\�a8 \0�\� �\'�$�\'�\�LxL\0\�\�\�a: \0@\0�\0\n@�`Z@\0�@�	P��\�(q|�Aq P6��\�\�0eH����\� \0@ \� 2|\\�\0 �		DSf @4E��C\0�@��� \�\�B�\"\�i���~��\�\�\�a9 \0��@�HZD��@� @xsO���\0�\��\��H	 @D��\�\� @\�2�\��\0\n@�`b@\0�@�	 @\�:%��\0Q\"(n�\0\�&�\0Q6:\Z��\0D\�\�;\r�!\0$�\0DB�Y�\02D\0`#@x(̄�\� <�GJ\0\"R�tV�2�\��\0\nЦϠ^]�@\0����70D8^\�\r�\'�\0�-\�I\0\"�q�\�+�����\0 \0@\0�@c <��\n3!\�1	_��Y���\�G�\�Oz\�%�C�iM3\�x	 @\�˗\�!\0@\0�\0 \0�\��2s��g\�v\�����5kfuuu�`�>����\�:�Ȋ�� B\�v@ 4�\�?�A��?�\��w\�\�\�\��{\�\'t\�4��O |�V:mE�Hg\\�\n�@-���\��\0|&�\01xH���9\�ZL�h\�ƍ�i|�PM`p@���oG\��\"0{�B�<c��\�\�9�.\�� @�\�\�\��\0 \��P3= \0@\0\�D��\�	�p\�C\�E�B\r\�\��@l bCK\��\0\Z%0i\�lkղ�u\�\�R�\0 \0�� @T��\��\0 R0E\0�\Z]���\Z�\�%�\0�|�\0 \0@\0��\� ��\�C\0H\������=\' b��Q(F�\�\ZA�7�:�k\�\n�F	���	@\0�@Z @�%��@�_�Ď�\n3!\0@�{��>�\�;@\n&\�C��\0C\0\"1��@\0�%�\0\�I\� <	fB\0��� ���P�\��\�\0 \0�\�@�HL(0�@f	 @xzO��HR0�(���\0D(\\\���\�% \0��@�\�h\�q�@� @$(���\0\�I�jhfϞ=\�\����5o޼�V�c\�+VX��\�e˖\�p�L/\�/Z\�Z��ڪe�@3�I\�ۥ\�\��E�m��W�\���\n�5\�\\Ӟ��X\�B��+�B\0\�$m�\�\�5��\�4 \0$�\0D2\�ФM\"\��\rm��-_�\�:u\�y�x뭷�O�>�\�\�Vڕ\�\�\��\�Kg\�\�\�����f�M��۶S��M�?#��\�\�� 2p܄\0 \0@\0�\0\�&�\0Q6�\�6D��.oG\�С���\�\Z�\�;\��h~�l\�i�[n�\�z�\�(��m�o_\�\�\�x\�%@\n��\�6*\��\�{o��`\� \0@\0�\0 �j���n֬�\�\�\�U�\�\�L�T\�QEV�l�\0Xo�S���q衇\��\�_o�z���{\�EY\�Ν�����\��\�}�\����\�\�СCm\�ĉv\�]w\�\�W_mmڴ�dh�\�0\"@D2�\�\�C�\�&#@T8\�A\0�@\�H�T6:\ZB\0�@F	 @R0�\�G�\�&ڸq\�j:5�PM�x�rm\�_~�\�6z�h\�ҥKQ\�%.�6��+	D!C�@��c^ѧ?f/Xh�g̱~\�:�c4�V�\0DUq3 \0T@�\"\���) \0d�@�ۜ��q\�D�\�Ku\�q	�\�ͳs\�=\�~�\�_\��\�o\\pA�X;`�\0\�wԨQ�\'\"\�;\��}�\�7v�駻�=�z\�)�\�_�b�=�wذa\�d�.	$A�ݻwwm>�\�3\�ݻ���\�\�e�]\�	�_��v\�e�\�u\�]g믿�\�\�O>�\�^ٚoO�	�\0�N@��#\� \0�\n\�-@L�1\�Z�la\�;���J�B\0�\0\� ��\0 Pk�`�uJ�L%�\��m�D�2i\�ԩ�Ȅ	\�S\'�\�\�\�c�=\�\'�h��R���t��]J���\�	\�7~�x�\�\�?�Oߤ�}	�U����ҽS�L��N:�^hP�\�K�Bp\n#�#?\��\�\�mȐ!6p\�@\�knj�x��=�\�r�\�w4 2���\��@�\� �@\0��\0DT$\��\0\�%\�\��R?�\�D����vQ��a��\0�@�x�\�W\�&��\�W�\�xm\�O�6͝\�)�<\�\��\�/4*@h\�_��Y/aCř/��BWo��\0�ۧO������Dpo���\\7s\�>�!_uI�lk̞@H\�ǉ\0�\�j> R0EE2�� @�7�x@ m \�Q��\0 \�Ob\�	OUC3���#G\�\���g֦| F\�TAS5 $h���\���,H����	\Z?�R��3\�<Ӊ�)�@��;W�\�ԩ��7�� =S1B\'(��鷿���u\�Y.�R�~dWn�\'�\ZN\\��@	P�:�AI�Iq�`JX�1��\� <�C\0H	O�\0\�I�jhfn\n&�A����!J rS)\�ă�\�\��\��@T\�E�/84&@L�<�>m�\�.\�ĢE�\\݇\�;\�	-:��+W�(%D�o���3\�z�\�Q\�\�\���\0D\�\Z�;q7<;\�\�\\u�\�c��.!\0@ K �m|�\0 �LɌ\�JV!@x�\Z�Y�u\�	�]R݄�￿>\�Rc\' �\�#�ic?�\�p\�\r7\���w.�V�\�_��R.�A�\ZDJ\�q$bj��HC\�`�.\�T�\Z*��\�\"%Q�3��\�\�	%r\�ua*S(�\��Y\�\�\�\�s�\�\�g�\�~\�\�y�\�\�\�\'���\�Z뻞�\��\�k�6mڤ�N��.\\�(�U*H\�2��H �5�\rTU3 t�D\�J�Mð\�$�I�\�Oe-����z�3g�̟?\�b6\�a�L�\�^\�\0D���fµ�\�/ \0�\�@�Hn\��@\\ @\�%5��\0\�H�,�/���9�\�jD�W�3 t\�\�9\�#z �햂+5TDPA#]t8�\�S���k}.hw�M\�6\�l�j�ԣG<x�<��\�a\�\Z����)�\�R @h�� \�t�+�b�t\��\�G-����\��\��Ӯ�jx\��m\��eu@\0���?��\��\�-\�J�\0 \0�,	�v�ƌc�Pg�I��=�ec�{7H��P�\��㏗ŋ�\�\�hu�\n:ˡ{�\��\�SOU;�:)��/_.�;w�I�&I�>}�v�q��I�@X \�\"\�\�:�\�\� \0@\0�\0 \0�p	�v�\��6D�{�\�ja$(B��^��L^rp�z��}�\�\'57\"\�\�\\ε� ���ӱ$�\0˴\�\�)�X�g \0@\0�\0 \0�p�\�w\�\�n\�0�{^/�\0Q��1B>��C3#ɗ�z{q�\�\�\"8\�wHqqq�1���3\�y#%%%�J)����n�I^~�e�2e�4i\�$�e�N�\�\��?�$\r\�\�MD�I�_g�\�)l����0 \0\�\0-��S�\0 \��0η \"\�\na$(B��^\Z�v\�\�a\�:B\�>l�\��[ē��Y3��0�҈\�}�,�\�\0QZZjb?~�<�\�3�\�y\�\'\�w�ԩS\'\�`ժU2y�d�6m�4k\�L�\"��~zN��\�?�lD�n����\nf���� jOS�5s\�>��.;���\�&\�\�q=��?�o\�7�� @䄏�!\0@ �B�Gؘ�\0 \0/�q��\0\�V#A�\��\�٧��\�_�8@t��\�N�\�ʰ���4�|�裏�\�馛�\�#G�4b@߾}E?\�֮]+]t�\��\�fv�\�\n\�\�\��\�\�\�\�/,\'T\�\�/���\�H�\��\�3e�\�\�\�\�\Z��%0\�\�9� �,�zu\n�c�f��g�\0 \�\'҄��\0�&@&G\�\�\�� ��\r���\�ˊ+�-�l2�\�\�:\�,8p`6�y{�+�3a$`���2w\�\\ј\n\n̒?����\Z5J>�\��\�[\�{I+#fΜi*\Z7nl\�\�j�SO=\�{\�WN\� @\�/���\�W�~�l\"�H��V�{P�\�.�h\�ݱ \"\�\�,@\0�#�\0���0 \0�\�pm\�h\�\�T@D�\r\�HP�\�y����\�\�{\�\�\�8\�n뭷{Ig\�K�\0QU�f͚e\�2\�y睲\�V[��\\+���[0`�~�\�9�W�|�\�?\��t\�,�\�\�&�\�UN.��\n��\�a@\0�@\Z� \0\�&�\0a;\�w\�`\"ÄFp���\�r\�-\��\��`u�LW>g�\�\��\�Ӎ\�0z�hSQ�@�n\�:9���E۞]|�ŕ��\�o\�I\'�$&L�#�<�J�+[�����뮻\�TX�Y�Fz�\�m\�l\�2�\�ҥK�o:8}�=�0v�3@?���8\�~���\�+��9g�q���\�2f\��\�\�d\�ĉfE�l�|]Y[���Ӷ\�d\�\�8�!p��Y�^F�>#n�-�\\���O@\0�\'�\0�\�! \0\�	 @8�aW \�m({\�}�\�\�\�LT�uރ΀4h�\��\�ƌ΃x衇d�\�ٲ\�;��}���r\�\�J�V�B t\�\�\�g�-�����={��*���\�F�\�i��\�ϴm\�QGe\�R,Y�\�Td����Pw\�q��\�\�!\���\��\�\�,0\�\�s�[�6���ŔƷ\�;F�ֹu7\n�;\�;\�L`�S\�.�\��\�JQ\�v5\��\0 \0�j @�= \0@�6\�\�о+�&4�\� \"���%]���*-��׿\�����p\�	�j�7\�|\���裏6\�V\�\��.��\���9�S�\�\�[o�\�^n��\�\�\�	ԎVTh\�\�K/�$g�y�\�s\�=Ҷm۔P��\�ƍ3>\�Uq\�`];�>o\�<<x�iݶ\�n�\��O\��^���\�\�\���E\�`*���e�\�H*  |�D!@\0v	 @\�\�u@\0A�pd�r0�\0aoC!@\�c\�eW>g�\��\�{\�\�s\�=\'��~�ԩS\'e���T\�ϟ/#F��w\�yǴC:\�C\�\�o����力 �+]$\�uT`\�K+/\Z6lh�;��ЖP�s��8\�\�L\�{\�i\�\�\�Z���7m\�\��,S⠃�_|1%J\��/\�n 7C��+J͟\��\�w*q@\0�@&�\�g@a�Ln\�@\0�@$ \"�\Z���\"@���LWD�Ȕ�UE��ϙ�3�m��0Ȑ!ҨQ�j��駟L\�C�\�\�\�s\�\�ynBe\�\�?�lf@l�\�fƗ`\�\n�\'OE�\ZC_\�\�U�>|�jS�\0�\�\�\�\�f@TU��\�U��z�C���5�3 ������ \0@\0�\0 \0[ l�\�Ү+�Y&6\�\� B��Х\\��	3=*>hՀV>4n\�\�,�\�G�Y	}��-g\�_~1�^~�e��\�+k+2�b��V8̘1C\�\�>3\\Z/D�-��v\�j*�Ҋ\r#�r\�~03�-\�\�[o�2KD&���rD\�\�ɘE��f� \0@\0�\0 \0	,Z�թes\'\�\�|[\�0\�\�\�o��r�r0F�\\\�I\��D��[F\��Ǖϙ�\�\�\�my���\�\n�?�x�%\���\�͠g=�\�|�\�Mk���\��\�6I��r��3F�<�\�J]\�j�Q�F\�ҥK\�̇��\�J���K�\�_�bB�;V~�\�ȣ�>jPO�2\���믿�I�&\�СC��#X�\�?�+�k���\�f��VWq\�Ƨ\�\�b\�֭��k��\�*#�Ď\�6�\�{��\���N�~�\\F�=���?����\�\�\��\�7\�|cZ�EqQUք\0 �L�`Jfމ\Z�\0jO ��m�\���\�0T�n��\0#WI ��\���\�p�\�3�*b�\�7�k��\�;\�k\�*�M7ݴF\�o��\Z=aJ���\��\�\�\�Z=z�H\�oPABE�x�Tehuù\�+͚53�jF�\�\�MeD�աC#�hK%V\�\�\�z�왺]\r�t\�\�ҟ�\�߿\�ؒp�\n겿\�k�_\rs�aG!\�: Y��bZ0%\�mL��\0 ��\0C�\�\n�\0 \0�\��q��\0��\�#AY\�\�6C��$@\�\�\�\����k�龨Ƞè�⁫��ꗞz�\�&�h�d\�\�RZ6t9�s\�߫x}֤\�\�	�\�̈iwJ�>��\\�\��fɄAE�\��\�\\i�\�\��\�\�E\�\�\�\�o|��͚|�\�qE>ׯ|ܵX��\n\�/�p�\\>��t\�u��vq\�|k��Kn�Ă�eR�N�tlQ&<rA\0�\0jK\0��\�x�\0\�\"@��HF��+�o�j�G��\�\�ˮ|\��»�q|��������~\��VU<��\�r\�QG�2������ N;!�PV�Z)�(�}Rz�2P��Z\�7hX\����p\�?_�=:��f]u�\rR\�E�\�e\�S�\�R��\�ۭ���~�4ٺiXKg�\�%T@d7B\0�\0j �\0��\0 \0\�Bm;\�w\�`\"ÄFpDP��+�3	KK�pW�^-�\r2�)N8\�3B?wuN\�\�ŋe\�-��]v\�%ɈB�]��~L��e\�]Z����_9H���\�\�g\��j�\�\�ߴ\�\�W�={�l\�O7�R\��\�ƧM�{��ޗq�\�AZ1�oa.��Z���\�8n�\0 \0\�@\0�-@\0�	 @\�\�@��]9D�\�0�܆\0Ԅ-\�\�\�L\�\�R.\\m��\�o��\�O?�����H۶m�w\�\�f�E�V���\'�\�\�\�\�4�S{&�Ak�~_�j�L\�_^{�)9�\�3dиk�^�e-�*��\��\�\�AE�Z\�iwʡ\��Kݧ\�|�\�\"\�\�\�\�\�W���\'��\�&K��\�n�*\�\�c h�\�ۙ� \0$�\0D\�\0\0 \0X\'�\0a=�9\�\�� Df��\�.�(�&kMW>g����A@��\�\�\�̈�`jr0\"\�?��z�Lx��V\\&@hD��\rS�\�\��q\�:���\�wܜ\n}�n\�e�Mw\�M�\�\�ϳ�͖����h\�XSaP���W����OL�\"/�Z\�7lX\��\�\�6\�Hp\rW���Ό0#2d\�\�+\�\�\rqV̛��W�C\����9��\\4�.љ��u\�.=O,���\'s�au�\�R�aC�~m�W\�\�ؿ\�\�Թ��q��RԹ���\06!\0@�#%�P \08J\0Ĺr0�\0aoC!@\�c\�eW>g|\�M�%\�yX\�\�zp�]\�\�W�Z%\�* n���j\���\�)\�ӭ�\�����ԯ�\�h1m�4\�z\�J�_��\�\�g��#7T@\�k�Y��\�?ˈ*$�z�T�s�z\����\���{A\�u>\��1��\�\�\�	�%ݿ\��7\n�~�S��x�\���\�!\�=ց\n��~>\� \0\� @��1��\0 \�Gr\�\�� ��\r�\0a��/�]���7qė@ @�rd�P�\�y�m��8C�\�_\�\��\�ɗ�\���K��{^�\'m��\�{a\�3��)�ޫ�+\��/�\�0a@_\�ڈ[\�\nC{,m�\�h�\�|�Vr�J�t���bش�!\��k��\�Tֆ*\�\�R* \�\�\�Z�\0 sz\�3��}̽\�=@\0�\0�#\�u\�`\�ކB��\�\�ˮ|\��8\�K ]�Ƚ�Adͪ�2qЉ���)9bC[��\r\Z���x\�\�y\�ϻ\�_��:�\�6�\nJ��寷̑;��e=FY@E\�tm�Ԡa�z��^�����Fxl�\��,�\�}�r@_�\�Ţ��r\Z\��\��\�vh%3\��`}�}\�\�\"\�t�Vh\�%��n*A|�(�v^Co�\�\�#:E\�e�}�\� \0@\0�\0 \�GR\�\�� ��\r�\0a��/�]���7qė@ @�|d\�3{ hd�6� �IP\�\�\�\��4B+\�̀\�\�\�?���ܥ�i��\�cI��f\�\����R\�\n��m[\��l��@I	i��\�#F\�X����`��G\�\��\\��X\0\0 \0IDATe\�\�˕�����؈;켛�Z\��T4\�L����@X)�o�\\5d�\0��VM\�6�Z�BAJ��z�\�\'M�������vf@\��݇g�\0 \0@\0��o-]aB\�Բ���q��k�/���Ɍn\\��� 72?/ \�\�<�\�sf\�ҥ��CN;\�4i��d� P�_~�E\�}�]�>}�x\��ҷo_�\�ۤS�N�\�^{\�[ @�R&��\�B�\�[0\�\�7�8[�\r-[l�M\�wعm*\��?�3\�?�Դ.\�ʁ\�.�&\�\n�G���i���O��7�`z�\�y2|C\�\�E�\��5���\r��Z#x-�5�O+ �8*�L\�M3	�\�\�T@\����1@\0�K�Lv�c�\0\�#\��6D�y#A�\��\�^�7/��-@��\�k2e\��\�K�M�6y�#\���\�eȐ!�\�SO\�]w\�%������1b��~�\��S��\�ǥD�\���\�.�oӿ�4�	�\�\�\�k�^)W\r*2\�z�>tڝ\�x+6��?|/3.�PV|���v��ܫ\��\�ÛE\�{�%\�\�`�p\�L\�x _\����W\�U�\�\�\�%��\�!Կ��r�ʆ[!!\�S��*LrR\�~�\���I	\�\n$U���\�=�2�u\�\r\��\�2�Ō\�Ҥ\�6)\�\�oڝ����^�?�l~Em�#�8B��\��?~m���9�PG��E!\0$�\0C��v��\0 \0��q��\0�Cjz4�\�d�\�+\'�\0�\�ȕ@�ħ�~*�_~���\�\�\�\�\Z\�\'��ʕ+��PTTd~\�k��\�2t\�P6l�\�\�y!��Pu\��\�V\�\�(0�\�\�|�̺�� \�ʂ]��I��R�Y$v\�0#�*t��\�C���Ee��{O>]����X\"�����N�S�\�ϔ��	\Ze-�*^Ъ�ˮ��\�\\dD�\�ҟt��\�o\���Y�?o֛�\�=���	1��\�Cy�w�ӂ�eR�N�tl\�,/{#�\0 \�/sKd�\0\\!@&G2\��`�!#@DI��� \��\�rX�3?����=Z�\�g9�\�c}�Cy P�\0�f_}�U��\�\�ꫯ�&M�D\��C��\'������f�s\�IgJ\\=��ʣ�\�\r���\Z�]qG�+ \"\�\��\0 \0�\�@�HL�	�@l	0�:��)\�XX�Q��\05\�\�G��\�\�\�a}μ�\�;2r\�H�馛d�\��q\�@UĚ5k䬳Β�N:I;\�\�=\���,\�_�ܥu\�|2�ޫ�dDZ�Czl�.\Z+\�W3�\"��p�\"�<�@\0~@��;�D@�.dI\����y�B\�2pd��0}�,�\'\�\�\�V#B���\�{_,��9�C�\�|�M�<y�4h\��\��5k��x\�ұcG�\�{�m۶r\�e���\�?�ꫯdԨQ�裏\�UW]%u\�\�5mw�~�\�x\�\r?~�<�\��\�N;�\�㎓��\�|�͙3G\�9\�y�\�\�駟�[n�Et��|��\��\�[o�\����\��K�.\�׭[\'3f̐�S�\��\�o��}\� ?��cj\��54�믿^v\�uW\�iӤk׮r\�W\�.�\�\�U�\\�N�_m�\�>�L\�\��W��YK\�3h\� ��\�e\�\������?�\�_�b\�5j\�HJKK\�\�oe�\�n�F���8�\�ה��<z�\�\'\��/���l�\�6r��\�\�\�ŋS?+,,L\�G�\�7\�|sy��\�\�3v��\�f6T�I�ӧO�\���?�\��\�\���\�eܸq&\�-�HW\\q������� ҷ��C�\�o���\���\��\�G�%\�n�#-*Ϟ3q�\�\�/\�~n3�	T@Ђ\�\��6 \0� @��O��\0 \�\"G�\��`\�\�\"@DM�\�� \��\�r�3?���9(׹_|q94�?�����M	z���\�\�^{���\�_s\�5��\�;KϞ=\���d\�\�\n.4\�F߾}�~��\�`\\�\����Yoܸ�Z�\�~�!Cmۣ\�z��\�\��رc\�\�?4\�[l!7\�p���\�KF�Paࢋ.C�u��~�^\�\�؎9\�\�l�\�\��\�.���3�����{9�\�3͡���\������N(\�\�\�o�5k\�w\�}ҫW�\�\�\�p\�g��}��\�/�4�\0:A\�>�\�srꩧ\Z1䨣����߆٘1c� �LU�\�|T��\��f͚��U|QD1�X����\�]m�^�\�0S�HH�\�o3-�>�`\�D%�\�>�ly��׍���h���Bƽ�\�k�ȤI�R3 H*v�\�;\�S�\�j�H\�v���(����@W�=��\�{�8�]a\�\�N{\�)\�n�[Z켫�]�P\���sA�`u�oq�\0 �(�J7�B\0�%�X�\�\�N�q0��P �A�r�\��b9�\�=D0`�9��|\�͛g��\n��*\�a��l\�w4�Zq�\�\'�\�m}}\�}��֭[aA\�+^C�1�௽���f�V?\����۪�{�\�\�\�ٳ́�\n+V�H��]=\�\�ߛ6m*U��~�\Z\�o\��\�\�O j�9�	�U\�\�sϕV�Z�pn��V�\�ی��9��Z5�\�{HŶE/���*�L�b\�,�\"b�\��R\�k\�\�#�<b*8Ԏ\�C�]멧�2���4\�\�ݻ��VqD\�m�U�8���\rO�[c\�?k>\'N�h~\�K+M\�\'�S\�\�K}\�}�{�\���;w�\'ߢ|\�\�?\�wh���?��3{�?o\�#x]\���L��Q�\�Y�@� @$+\�D@ � ☕J|\n\�`0�\"@\�r\�6 \��\�r�3U��WF5	Z\�p�\�w�\�v\�ڙo\�kł\n\0_��iˣ\�\������3�����\�/�\�\�\Z�[�Zɐ�\0�\� 5�\\1�\��E�\�Wz�\�m|ӶPzi\��?��O\�V�\�zh��\�n\��矗��>\�T�t\�\�Y6\�t\�j_\�5@���⡇�^Q�@+={\�1i߾�(\���M��3s\�LSy��)�^Ř�����\�)\��\\��\'��� 6�`R�!����>��p�\�DZ0!@D�\�f]@\0\�#��>\n\�\'/p\"�\0 \0�\�@��M*�w$���|��\0�ʕ\�@��\�\�\�a|\��\�M���+B\�2i�%=�փo\"���y�\�\�p]Ե��~\�T�r tN�\�L\�6@*�,Z�\�|\�?B�j�bU	\�D\�@i[#�j\�6MZ���ݔVD�\�MX�v��2A\�M�0�T�h{�\�^Z5\�=Z��3!�Em}��\�\�g*zh���BE+&�u�\n6��ܴ\nD* *V�\�5	\�*�}\��\�Z0U\�z����k\�\��d���9}tk��o��F\�ϟ�\�:U=�\0	V�\0 \0@\0�\0,@��\0�6&\�8��\�l�A�ȖXx�#@�\�2�+��9S\��[�\�\��A�3!���\�\��\�O?M\�A\��\�\�H�\�ph�hذ��\��T\�X�`��Z<i.k>�\�n;#:\�\�\�@\��Su>\�\��+ tNE��e]C+���Τ\�\�\��i�v�ա��6Rv:$Zg8h��\n\�rJ��^*�y\�#\�\�Pi�����2\�\n�-�\�Ҭ��Vf�ؤ��v\�i�Pt��{\�\�VZyQ�\0��˴\�Jo�:W����\�ڂ�L�\���$Z0��R\�\0 \0@\0�\0bL`\�\�ƻN-�\�\�ˍ��q��k��(\�7m]�\�8\�G�a$(~�h\�Ǭ\�7��>g��Y���s\�g|�\�G\���m}m��\�\�\�\�*:聶Q\�\�r��Cց\�:8y�\�w7�\�*$hEAIII\n��փx��(..6�*~_\�\�\�u\��\�[?��M��\�o\�\�7��z@\�\�7\�W�Ze^\�\��-~C�5S\�5t��VI\�\Z*��\�Of�\�G\�a\�:��:�Uh\��t��S���́\0��\�o6�쳏ԶƮ�4�+��\�ĭl4n=\�W��9��\�*\� h��P�@\�W*\�h%De���\���s���\�u�B\�\�:�C[ai�t�^\Z��Z)��\�\�O>�\�W�T\�\�g\�;\�<iٲ���T�\�Z\�*J+E�s�6m̬\n�֯_/:\�C�\\\Z���.\�D�	f@���QZ\��a�\�}�\�\"��\�B\0�@�Ђ)~9�#@\0�7�0η \"\�q	�\�=��F��:�y	.,B�9\�|\�~�\�O���\��-v=�ֹ\0cƌ�e˖�\�k=`\�k��\���[R�B\� \�!�~�^��\���W^�q\�ƙ�*\���~C_\�U\�ЫC��\"��\'\�^�s}\�\�_�g�}\�|\�?�^x\�3A۵\"A�RAA\�կF�\Z�o\�W\�5th�V���v�RAEmk%CU>\�\�\nZՠ\�\\t��^\Z�\�Tq%\�<l\�0\�ٳgj��\�k&$��V\Zh僮��,t\0��Ӄ�N�:�x��\�S\�kA|�\�i��\�J�i\�~j%����.Mf̘a�!�?���*����\�XgF\�pr�\�5�:\�ZE#�?��<���?I�&M���\�\�\�����D���;���S\�@U\r�x��@\\�L�\"�� \0@ >B�\\\�	 \0�A ��m�sF�\"t\�\�\�$@mT�\�Q�\�0V�	\��\n�u끲h�Ս�\�a��\0�B�\\\��uh1W�TXy\�G\��D���vEIg�ꫯ��*��D�L�\���\�DVk��r\���R�Λ\�㇏�\�珒O<\"��\�k�Q\�j\�\�|�J�I�:ұE��f��!\0@ ,a�d@\0�-Z0Ֆ\\��\�`0j� �&\\��q ҇\�\�#��\�g���w��9�|�rӎH\��h� ��	|���R\��H�`ҶP\�~�K\�\�l��\�*����L���S�\��r~��\�\�\��သ\�J\���f�b��`�\\|\�����3\�\�K��z\r6KÒ_�6��ç6�] �ϱ@\0\� �\0��<% \0�8`u���\�[��Q��\0%\�\�\�F��=D�t8�R�/L/K晙�\\\����5�B��\�*O@[\��gm�t\���9���m�\�ƴ��S�N��ik�K/�T�\�@m\�̏�\Z��C��\���=vީ\��\�\�������^\�\�q�\�?��ϑ\��kʟ/?�@�\�\�&}���zi-�*\����*\�!���\�\��\�\��Q\�qև\0 \0�\�@�HN���@\\	 @\�53�B�p$Q\�D�>Dx�fd\�ҥf���N�N��Z�b\�2\�\\qނ_\�\�m�\�f\�+�_�\�K��ޢ�6�\�ݤTJe\�\�\�\�\\s�\�;q�^t��|\�\�R�A��?�=�\�\�å~�ͬ�g�Om\�_K�|���@\0�	 @XN\0\�!\0@@ \��$ʢ�\��G�W�\'+���\��o\�|\�\��\��\Z�\�ڋΖ\�\�8]o�\�\�~�\�n�q�Ίx�lVD�ac\�\��G\��\�\�\�\�\�3w\�0??�;�Y˝d\�\�]e\�C�\�\�7Δͷj*^3N\�4\�\�sX\�\�r\�\�\�\�\�KT�z���\\\��\�\�\��`d�\�9P1u\�bi\\��un\'t�@\0@�p0i�@�3�$DYt\�B�\���r\�\�\�+��\"�;w6�ݏ>�\�Tk�\��e�]&<��\�\�2a\�\�ش�\�/��b��6m��F�;\�#\�]w�\�z\�RXXh�m<۸qc3\���3\�H}�\�5}\�Ƙ�	�8	�$�\�?Q��[4\�\�\nO\�>͈	*6tl?�\�\�2\�̓\�\�瞒\��g\�f�����\��\�k�\�9\�\�\�ˏ\�g\�\�5[\�\�\�\�۬\�)\"�\���M\�}SbHU���t#@\�\"�]@\0�A\0\�ulB\0�@:G��#��\�\�c�=&W]u�\�~�\�\�\�\�\�W_-�>��̞=[v\�qG\�~\�\�v樣��O<Q�,Y\"(\'V\\r\�%�\�[oɌ3\��\�7\�q\�F�x��\��*>|�\�r�\�gK׮]\�.0\�Du��\�!@ @X|c:&\�8���8+�ҟ?x�%sL\�r�vl���3m�l���І\��z�\���$��\�)wHa\�~�ݪ�r\�Ye�V)��,����7�:Zn>XT�8놙Ro�\�\�\�\���\�\�l\"FL�\��t�f\�e\�\�K\��Ae\�*@\�\�f�8�~V�g@P�܀\0 \�=�P\�ރH�\0\\%�\0\�H\� I�E7] T���\�\�\�݊����k�/��\�\�_������r��ǋ\n\�{l��ާBCūgϞr\�w\Zѣ�׷\�j+�C��wC���6\�t��\�9}�t\�n�\�*��.@X\��<�\�J�)im��\�p�\�uh�aCu\�q\�.U�{\�\�+\�\�\r��Hq\���Rz�K��y\n���\���ߥ���\rT�\�\�J���\'�)7\�N��~�4\�\n�\�w`\\��B�<�\�0@\0�\0 \0@@�\�\�&@�p%S��tA�P:���RRR\"�\�{�\�u\�]�馛\�=�\�#m۶�\�^{ʹV�9s�\�\�\�Y�����7m\�4%@\�x㍦\�^?���\\x\�r\��J������^O�\n{\�b,狀�t\�\�0�Q��@�8��:�2	\"𴪯��z�[d�#�$�o��%:\�\�1C\�\�;g\�\�)wH\�C{\�\�\r\�\r\�\r-ǜ7j���\�\��\�ԳN6�L\�}S\�\�{p�\�t�\�Ҫݞr��ٲ\�ow-�|M��__{�\�?i�t+:]Ns��TbP?�\�\�7咇��]��]\�\�\�<Gϯ��\�0\�~�?L\����w\�|�̟?���T�$�`eQ@\0�\0 \0@��EKW��Z6�`={�zf�痹\\���o�\�\�D�\�\"@dK,y�� @�Z�J&N�h*\Z�\�\����?3�! ֭[\'#G��\�6\�\�����\�\��\�Í�P�\"]�\�\�t�-�\�\�\�W�N�r��\�\�oF�@�HާG�\"\�ꩇz(�\n:wf�\�7?+/@\�\���\�Y�\�Rxl�r�\�{p�\r�p�{\�]c.4���rC\�P\��Kg@\"E�\0�q��$�nh\�T&�p]\�\�jG�\�\n�2b��o�\0�\�ٶ\�\�@&[\�@\0Ђ\�tLB\0��\� ��4�/L/K\�Iqq�\��� �8l<\�\���\�\�\�/6����\���\�{O&O�,/����l\�Y\�:i\��ۿRi��\\[0�=ڴf\��\�M�4z�����\�#�\�v[���x��\�������E�@�\�=\�y\�v����ow\���`\�z2E��\�׌��\Z+��ʆR�\�Y)S\�<Y��\�Q���J\�5l(*\\v\�!\�s﹣\�}���\��43�Z+ \�z\�\�\�AO��?��Y**:t\�.Cn�C6߲���\��\���m+MwhY\�\�:B�&��\��5+W\�\r�\�* T�8\�T\\T3\"\"~����o�MDon�\0 \0\�	0�\��\�> \0\�@\�\�T@D��0�{^/w\"h��B��փ?$�}\�U$P@�}<i\�$:thJp����\�~[��\�\'7\�p�|����?��C)**2�ӯk��V\�9\��裏�}=hɂ\0Q&@���´q^�g�n\�-�4mYj�¾�&{��9�-ZH\�s\'ə���;/�x>��?ϺU�;����岴!Խu�\�y�ʝ���Uw8���a�\�o��\�\�P!�]�ym\�T�~wl?�ST���\r\��\�Z�\�\�#v襭�\�\�aٿݵ2=���/��Mu�bA\�2�W�@:�h��\�\�N@\0�@% \��\0 `�\0-�lg C��`\�T�o��\0��y�嗍�b\�\n�袋�[�n�S�.]dĈ�\�[oI�\�\�e͚5\�2١CS���:\� �\�\�\�n�N8\�Խ*B\\~�妵��C��\�O?]\Z6lh\�\�u��\n��$*��* �;.Q<�\�MT@$)\�\n@\0\�@���/�C\0�@\���^\n\�\�|s\�\��T@D�\�0�{^/\�\0QS��\�*DhUDūgϞf�V[mU\�29��\0�\0�\�\�a\'d2\�\���\�ڴ\�\�3(+�̟\��\��)NB\0�@H B\�2�\0 Pk�F�\���\�/o�� @|���J\�\�#���%�\�B�H?��\�r\�QGI�F�\"MD��\�cA �|љ>��l�\�v\��\��o\�l9���l�Q\�\�~�Q���>mN�g@Ђ)8@�^��  \08M\0�!@8�(�n�.@�^�Z\r\Z$�������\�CB��x�bў��\�K\�  \"\�d�N@\�L���(<�� �{�a�\�@��sK\��u��s��\�g=@\0H��%�p!\0Đ\0D�R�K�$ʢ�q �|�IC�G�2k\�,iڴi��t(��o�)S�L���~ZJJJ�m۶һwo3\'�U�V�\�\�\n��\�??\���cǎr\�=��I�\\��IRN�\�����Zq�!R�66�\��A\�C�\��\\F\�7\�y@\�\�\�\�:\�#\�����\�\�NU#@D��E!\0$�\0D\"\�N\��\0bE\0\"V\�\�W�aoC\�I��G˹p\�s&�y���?$�۹\�17;Ђ	±M���\0bL@}\\�c��@\09@�\�^>u\�`\"����-{\�}�\�\�\�/��#�\�*@���l�6\� �s\�߃\�^/\�c>3\�\"�\�><�\0 \0@\0�\0|#�\0\�HF]9D���� \��Ų+��K��\0\0 \0IDAT3��&��(\'@\�\�M<�%�T@Ԓ�A\0�\0 \0@\0Ȟ���+\�C�Z6\��aO�q��k��2j\�yW.W\�H�+9���qˈ{���9\�Y<v�@ @�:���k���?�p�ǭT@���\�_@\0ȁ\0-�r�ǣ�\0 �Ha�o#@D�u\�HP�\�y�4�\�\�\�Kpy���\0\�e�}d\�6�\�\�\�G\�i�����\\ x\�\" \0�F�!ԡ�d!@\0H�0η \"\�,a$(B��^\Z\�\��\�%8��`ƈ�\�\�\��S�\�{\�?bA\�2�W�@:�h\��;!\0@ \� \�|�\0 ��`r$Ϯ\"@\�\�P�\��bٕ\�_xG|	\�\�\�~\�\�z\�\�6Z0\��݁g�\0 \�\Z\�2���\0�#�jGr\�\�� ��\r�\0a��/�]���7qė��C�P[0�މFK\�0�;P\�w�A\0��k \\\��B\0��\0�#9u\�`\�ކB��\�\�ˮ|\��8\�K@���馛H��u\�\�$�՚��?���\��\��y}��#��o��F\�ϟ�\�:U=L�H��( \0�D@�Hd\�	\Z�@� @\�*U;\�\�� ��\r�\0a��/�]���7qė�K�|)���L\�\�5�N\�YN�4��\��QS\�.�\��\�JQ\�v9�\�\��\0 \0�\0 \0\�&�\0a;\�w\�`\"ÄFpDP��+�3	K\�Z ���\�˴��[��I @��%|�\0 \0%�\0�>�\0 \0\� lg C��\"@d�\�nC��\0jt\�s&ai!\\� @\�����\�]?L\"@��G��\0 �z\�3��}B%F@\0�)��&��[�\"@\�\�P�\��bٕ\�_xG|	$A�\�\�\�\��Dn�x\Z�\0 \0@\0HGr\�\�� \Z�6�=��Xv\�s\�\�\�_�\�M\\<C��K&��\0 \0@\0�;�EKW;�lwW�a�o\�\Z��Hiii�A����� g�3G b�\�q\�s\�A��\��$�`\�mS\"@\�Ə�!\0@ h��?\�X�\0 \0?�q��\0\�^#A�\��\�^�7/�!@\�3F �l�ZYX�\\zuh〷�h�\0�\r\�؄\0 \0�\�`um�� \0$�@\�\�\�0�{^/�\0\�uz�D^0c��@\�Ă�eR�N�tl\�\�Z�\0@\06	 @ؤ�m@\0P�`rd�r0�\0aoC!@\�c\�eW>g|\�M�I�L�яZ�\�\�;��\0 \0l$�\0�n�\0 \0\�Bm;\�w\�`\"ÄFpDP��+�3	K\�Z ��L�}�\�\�B�ȍOC\0�@� @\�5� \0@�r�\�W9а�� \��Ų+�3��&��H\�j��\�m�E-@Ђ)���4 \0l$�\0�n�\0 \0\� lg C��r��aB#�\r\"�	[ҕϙ���p-H�\0A�\�6V\�\�Թ��q��RԹ]n��4 \0$�\0D\�\0\0 \0X\'�\0a=�9\�\�� Df��\�.�(�&kM��y\�Յ\�}\���Jqqq��m\�$A�H\\RC\"d�,@\0�@��-C\0�@� 2e�6\���}��\�(\�~��\�\\�oч\�\�}:\�R\�\�\�k\�C�?\�D\0\"\'|�x\"i&H@\0^\�C��\��  \0@�M�\�\rDYt\�\"|OM����i ,� @Ђ)���\0�?��\0 \0@\0�\0�C���0:�\�\Z��Hiii�3�F�p&U\�E���\�[î�\�m\",\�� @��?TyOL�\"@\�(�@\0�\0 \0Ě���+��Z6����sa�{\"\�T���\��zi�\�k%8+\�1\Z1HB\�]@��y�p�\0Rh�\�f�\0 \0dG ��m�\�guw	\�\� 7� @�\�&�\06Q\�s���\�kea\�r\�ա�+.g\�\'-��FV\��\���4 \0\�\0C��\�\ZK�\0 \��0η \"\�a$(B��^\Z\�\��Z	\�\nv�B\0�Z�XP�L\�\�)��-�9@!\0@ \� \�|�\0 ��`r$\�̀p$Q\�D��\�S\��&�� \0��	D-@\�\� @\0�\06@�`+@\0��m��/��{* \"\�ua$(B��^\Z\�\��Z	\�5�\�\n$�zI�L^�5Ԡ B\�\�b�\0 !�\�4 \0dD\0\"#L�o�\�~\�\�D\�3���+B\�J�\���\0A&{�\�2 \0\� @��Q\�\0 \�Gr�\0\�H�,��\0a>�!\0� @x�\�H��Z��:w�4�_W�:��\��\0 \0�\�@�HN���@\\	 @\�53�B�p$Q\�D��\�SӴ`�4��U#�$��\�\�\�5�\��\�	 @�3 \0@��d\n?!\0�K\0\�\"@8�(�n\"@X�\�i\����4\r�e�@X�2�\0\�U:	��\���\���:F��\0 \0�xp\�|)�\���pO���\��zi�\�k%8\����	�^@��2���\0*N�\0 \0@\0�\0<&\�\��R\�\�n\�0�{^/�\0\�uz�\�\�_V a\�KI h��\�\�E�ȍOC\0�\0 \0@\0\�!\�Z�\�0η \"\�\�a$(B��^\Z\�\��Z	\�\nv�ƀ@��\�m�!@\�Ə�!\0@ h��?\�X�\0 \0?��\�e��B	�\�=��F��:�V�C����1 �l�ZYX�\\zuho�q���s\�\0�?��\0 \0��`u�Xc	�\0� ƿ� \"\�a$(B��^\Z\�\��Z	\�\nv�B /h��\��%ˤ^�\�آYn��4 \0$�\0D\�\0\0 \0X\'@&\�)\�\�=(�y�B\�2pd��0}�,�\'\�\�ř-\�]�\�`Y� qKV �\�\�\��@�D-@$%�B\0�@\� \"\���\0 P#\�Η\�8ߦ�\�mQ�\�HP\�\'�I�d\�?�\�]S��`��\�$��L\�\�lxQ#@�ǒ� \0@ Z\��eu@\0��\0D͌bq�HC��@��uzpp�@�Pӂ)�\r�\0A�\��\�\��\0 ��\0��\0l@����\�#@d*��!@$8���J 	��m����sK\��u��s�\�\�i@\0H<�\�o\0@\0�N\0\�z\n2s\0\"3NI�\"\�ُ&vZ0EÕU\�O\0\"�9�\�!�\�`�\02%�\0�))\�\0 \0�� @DE6\�u B\�\�r&\�rH��a\�=\"��L�mX�\���4 \0䏀�?��\���3�%@\0�@��/�\�1�!\��\r\�HP�\�y�4�\�\��kAX��Q/	$A��2qy\n\"��1@\0�\0 \08M���0η \"ܲa$(B��^\Z\�\��Z	ε� �@¨� �Lk�A!@���\� \0@\0�\0 \0�	�\�\�;��m�7t	�\�=��F��:�V�C����1 ��L�m4�\���4 \0\�\0-��\�\ZK�\0 \��0η \"\�a$(B��^\Z\�\��Z	\�\nv�ƀ��\�kea\�r\�աM��\���΍+Dn�x\Z�\0�G�!\��c�%@\0��@�^F��p/���\��zi�\�k%8+\�1\n��\�\�\�\�0G-@,(Y&�\�H\�\�rs��!\0@ � �\0\0@�:Z0YOAfh���w+�.GV��\�\�K��yR\\\\�ق\�ŁFD`3X\"Hܒ��pq3�\"@�\�\��\0��w<\r@\0\�H\0�\�\0@\0�	�v�\��6\�0�{^/�\�[\�\�իM��rHJ�\�C�\�{��\��\�l��*\�g��6������\�v�\�\��9�xԴ`�|\�iy��\�ڵk\�V6\�ӊ\�X���\�\�\��\�[ˮ�\�*�\�\����-�\0\�\'�\0\�~�\0��\� \� �$ʢ�T@X��i@�+IB\�U\�,u-�,$��\0<%�\0\�ib	��C I�#��\�&�E���\0�\"�\0\�U:#	&jb\�\�\�Ҹ~])\�\�.�Y�\0�C\0\"9�&R@\0q%�\0\�\�T�DYt\�\"|OM�6$\�\�4��;f±�\�. \0�@�Hp�	�@L @\�$5��\0Q!^G�`�M��� ���K\0\"��\�4r�LIq \0\�&��O?���m7�@\0	&\�\��R3�B\�#A�\��\�^�\�Jp��aF�$�\0\�eZC\r\n\"T�,@\0�\0 \0xL���0η \"\�\�a$(B��^\Z\�\��Z	ε� �@¨� �Lk�A!@���\� \0@\0�\0 \0�	�\�\�;��m�7t	�\�=��F��:�V�C����1 �\0�$\�\���\'� \0@ E�Ll@\0�@v\�8\�F�ȎyVw����rs�\0�!lae=W,[�V�,�^ڸ\�2~\�\0D��c�\0jM�!ԵFǃ�\0 �Pa�o#@D�y\�HP�\�y�4�\�\��\��\0 �\0��d�ԫS [4s�.B\0�@�	 @\�9;�@ h�\�H�=�P�y�B\�2pd��0}�,�\'\�\�\�V#B���\�{_-#@��Y\�\0r%�\0��<@\0 @� \0@�6\�Η\�8ߦ\"\�]F�\"t\�\� �N��\�\\S��@¨�h�\�eZC\r\n\"T�,@\0@��.KC\0�@F 2\�d�&* \�\� \� @\�=C��B�!Ԯdʞ�Q�`��[,C\0��\0�o%@\0\�@�p$g�$ʢ�\�c\Z��\0�W\�$����sK\��u��s�H�gQ@\0H�\�\�H!\0ĕ\0D\\3S�/Ge\�M��=5M&OKX5@��Q\�o@�H�\0\0 \0g @8�*�\0 \�-GR�\0\�H�,��\0a���]�\�\�4��;f±�\�. \0�\���P\�>��\0lp\�|)�\���pׅ��\��zi�\�k%8\����	�^@��2���\0*N�\0 \0@\0�\0<&\�\��R\�\�n\�0�{^/�\0\�uz�\�\�_V a\�K^�5Ԡ B\�\�b�\0 \0@\0��\�\\k�\��6D�:�E\�\�K#@x�^+�!@X��\�@��Ab\�D\��{�\0 �\"@&6 \0@ ;a�o#@d\�<��\�HPV�9E\0�\�6�����+��^+K�K�m\\q?�L\0\"\��1@\0�&�\�Z�\�A@\0H(�0η \"\�<a$(B��^\Z\�\��Z	\�\nv�B\0�Z�XP�L\�\�)��-�9@!\0@ \� \�|�\0 ��`r$χz���[�t8�R�_�>^\n�̓\�\�b�!@\�Ï\0a���� |\�,qA\0��Z�\�\�?��\0 \0 \��\0 `��k\�Ka�oS\�#A�\��\�^�\�Jp�)\�V a\�K�`�2���\0*N�\0 \0�	 @D��!\0@ #a��sw \�!��\0\\!�jW2e\�ϨZ0\�\�-�!\0�F\0·� \0� @8�3Ge\�M��1\rxE\0«tFL\�\�Թ��q��RԹ]$��( \0$�\0DrrM��\0\�J\0\"���\��#��\�&�E�������%�\Z	 @Ԉ(�7 @$~\0\0��3 �I�B\0�\0�#�E�p$Q\�D��\�SӮ�\�i\Z\�\�3�\0\�X\�p�@�	\��\�(l�`�@\0�	�v�ƌc�PG�\�\�HP�\�y�4�\�\��kAX��Q/	 @x�\�P�B�\'�A\0�\0 \0@\0p\�|)��m�7t	�\�=��F��:�V�s\�/+�0\�%/\�\ZjP�\�d1@\0�\0 \0@�c���\�|\"\�\rF�\"t\�\� �N��\� �`\�h @\� 	1w\"\�	\�=@\0H���\0 ��0η �c�\�\�a$(+�ܜ\"�\0�f�\0D\�DY\�\�V���%˥W�6����y&�\0�g\���\0 \0�Z`u�\��  \0$�@\�\�n�0�{^/�\0\�uz��\0a;F!\0D-@,(Y&�\�H\�\�����\0 gq\��A\0HZ09�\�C=T~ޭP�Y�\�/L/K\�Iqq�Ո \�\�G��\�\�7\��y�ח߮5�o�E�_�h��\�7\�\��E j\�-\Zx@\0q&�\0\�\�\� \0�dp\��a�oS\�\�#A�\��\�^�7��\���ˠQU\�|a\�8)--ͫO�@>	Ђ)��ݴ�\0\�f\��\Z�@	 @$1\�\�@ ^ ╏*��DYt\�\"|\�L�\01���\�ʮ�{7B��,\�S�\0C�\�5�Z��SM\�u@\0Ȕ\0D����\0�\"�\0ِ\�E���\�!@x�TK!!@X�\�\�@��M*b\�H\�\�Թ��q��RԹ]l\� \0�A\0<\�% \0�	 @8�]Ge\�M��=3�\0\�YB	\'kY#K\��K9C\0p�\0���\�q@\0\�@�p$��$ʢ�\�{f\Z³�N\� �F�� �r�\0 \�,=�P\�\�Y�q�\0\�\'�\0\�H I�E7 ,\��\�4�g	%��	 @d�,q @$.\�@\0�\0 \0Ԓ\0D-�\��1�|w\��{9��\�q\�~\�\0D�H�k\�\�\�\�9 \0@\0�\0 �_���0;�l�_õ��\�b����|�\�1]c]\'��r�\"ˇ ���\� ��BF��,\�:C\0TYs\�\ZzC\0�@�h��%0n�\0 \0�\�@�8�\�M�\���R�d�[\�$a$\�j\0G�p8y1s\"f	���X�z�,,Y.�:�ɻm�A\0<\�% \0�0��]\0@\0Ȏ@\�\�T@d\�<��\�HPV�9E\0�\���H� \�+���%ˤ^�\�آ����\0�D\0\"O�1@\0U��#��L�$ʢ�\�{f\Z³� :���\�fA@\0H,�Ħ��!\0Ć\0C�c��\�A�p$Q\�D��\�3\��%�p�&@���%\��ĥ��!\08K\0\�\�\�\�8 \0o @8�JGe\�M��=3�\0\�YB	\'k�\�\ZY\��Z��S\�C\0��\0DdhY�\02$�\0�!(۷!@\�\�@�\�#@\�?G�x�\0\�J��3*Q��gݨ��sK\��u��s;�	 \0X!�\0a;F!\0@ �\0�#\�DYt\�\"|\�L#@x�P\�ɚ\0D\�\��\0D\�RN��\0�%�\0\�l\�p��7 I%�#��\�&�E���F��,���5���%\��ĥ��!\08K@}�w\��\0 \0�	 @8�CGe\�M��=3�\0\�YB	\'kY#K\��K9C\0�\0 \0@\0�$�\0QKp�~\"\�\�ݳ�\0\�^\�\�\�1D\\3�_�\"�\0�/\�\�\�A�p7wx@\0�\0 \0\����+��N-�\�\�p-�\�Xiii-�.{L\�\�DD\�\�m���\��a�,�%�v�&=�� \"˲\�@�p&U\�E���\��\0 �%Z0e	�\�!\0@ � ��t�0}�,�\'\�\�\�V7I	�\Z�\�\� N^\�\\G��YBp\'\���^+K�K�m�n�n@�p#Ox	@\0\"�f@\0�\0�#\��6\�1\�\�\�0��AnN@�`3�E\0\",���J jbA\�2�W�@:�h\�+B\�\0 \0�<@�\�h\�@\0�@�h�\�\�\��#��\�&�E���F��,���N j\"t�Y�\0K\0\"��\'p@\0�!�\�ؤ�zG I�E7 ,\��\�4�g	%��	Ђ)kd�{\0\"q)\'`@\0\�@�p6u8@���DYt3_\�ʕ+����\�O�h{�\�!�f͒�M���~ݺu�\�s\�\�̙3e̘1Ҷm[��M7\�$/���L�2E�4ib�X\�Mkl\��L�>\�,ұcG�\�{R1\�~\�x<�\0�<\��=��\�\�\�Q�`re\'\�\' \0��@������\� \�0�#��\�f����\"#DTu=�\�C2t\�Piܸq�\�y���\�͛\'g�y&�Ž�i�M\0\"l����\01u\�bi\\��un\�<\"�\0 \0��@�\�+n�A\0�@% \��$ʢ�q ����S\�c�T@X|#c: b��X;�\0\��\� \0�@�`;@\0��m�3��}�A%�6;\�O�\0�\�W_��\�\�\\�kժU��\�_˷\�~k~�Y�&�k\�ڵ���\�ˏ?�(u\�ԑf͚\�^{\�%\'�|��o\�\�N�\n�J @�-j\"�\0Q!^�\0 \0��\�C����v\\��\0�H\0�#@8�(�n\"@؁\�\0��\�K\��7^���[+�[�����/K\��\�t\�ME����\�֭+�\�Փ��\�K�\r�aÆ\�W�F�d�\�77�~�\���\�/\�O>�\�˗\�;\� \�Ǐm\�\�\� lg �� ⟣�3\0\0 \0IDAT#<�\0 \0@\0�\0\�A\0\"y�\��\Z%��8�\��ɓ\'˴i\�\�\��>}�ȸq\�R���s\�̑����\�K͡�~+~ҤIr�\�7\�y\�\'{ｷl�\�fRXX(?���\���r\�\�\�+��\"�;w�#F\�\�G-\�&H��K�\�e�]&<��\�\�2a\�Q��/��b�SN;\�4y\�w\�뮓[o�լ���Ϊ\��\�g�q��\�ڕ����.@|8��R�a#�\�p3�۠\�����0�A�\�\�Cyߩѯ_?ѹ!��\�~ႀM6\�a<\�% \0@\0�\0 `����+��Z�s�uDz�XZZ��]CO.Ks](\'/�|\"K`	�ݶ\0�mw,���\�\�\�O4�x&N�(\�\�\�\�@�u\�\�Ft\�!\�*L\\s\�5\���4߄4h����sΑaÆ�\�\�����Jn��v\�v\�m\�ꫯ�G}TfϞ-;i�3p\�@9ꨣ�\�%K�Ȁʉ�\\r���\�[2c\�9��\�\�zzp�b�\�\��U\\��\�O\�\�ϖ�]�\�\\`ĉ\�^/((0�\�w���\���\��A\\ٺ�<�w\�qr\�)�A�� @\�\"\�]wr���\0�N�LI\�\�@\0\�@�8�Rf/L/K\�\�^�W	�\�˶m�f͒��~Zn�\�\�jG��\�_FLP�m۶\�gZ��\�_��+��B��\�;9r�yN�	* T�P\��\�7�U<\�\��_�\r]_+/�\��\�/\���q\�ǦR���\�P�\�ٳ�\�y\�F��\����\�\�<�\0\�F�U�\"����z\��<׊!}o\��x�_�^ƎkB\Z=z�i\�\\\�֭3\"��O��X�5�e�\�\�\�ҫC��M��� MnC\0H �P\'0\�@\09\�|�\n��RP�\�a$(B��^ڦ\0�-t.��BS�p�\��8Wv8_Q�\�{��\�ofh\�I\'�$�Z�J���Jڲ\�\�{\�\�\�\Z�\�^{ʹV�9s�\�\�\�BT@\�ߛ6m� n��FSU�W\�\�hlW�jz=�~��\�V�ﾻ�l\�R�z\��O[Q[|i;.���\�_�\"C�M	h��o��\�y��\�M��\����\�:Rߞy\�\�\�I�\"5�\�ū 4/Z\�ԡC\�޽�i\�5u\�T�k�\�v˳���@\�� �,�zu\n�c�f�\0�\0 �����0 \0�@�L!@\�\��`\�e�m\� �\�\��\r\�-Zd-@(um�sT8\�vHw\�q�i��qҊm�����\�\�	dծ~;\\+&��\��^�n���\�D\�\�[la\�\��\�\�WM��ߋ\0��F��rF\�Dyi���]ڎK\�,m�u�\�Q+�\�{\�=�\�_�*�F��N�:����_~Y���\�_	a�\�\�\�z�\�\'e��v���C����V>�X��>a=;� \�D�U@\0�\0��Y%&@\0n`�#�B�p$Qݴ)@���\�Fx\������D:B��o.W������?i߾�i��3Ə/*\0\����^�HPف�\�\�\�_|\�T6h��N\n���`J tMm\�m_�5��nҤ�z���tF\�m�\�V\�\�*^\�\�\�!�Ƥ�L#_���?�\�o�\�\�?��w\�9�w�\����\�e�}�I��{Sg�\� sm��Z[m�\�F�R�T\�\�q�;�\�У�|\�[��\����;5�\nq��LQ\�l?\�F��#�D@ 	 ��eb�\0 o�\�O\�;Ge\�M����p\�\�\�\0a\0��V�P_~�\�-u�@\�}�5\�$׃\�@�\�VI\�\�Fz�5k&:`Ŋr\�E�jmӢ\�X����>}�	T\0\�~�\�eҤI�mNU-q\�~�m\�ׯ��Mq���2�>��\�\�Vb\��G}T\�\�\ZDt^g~L�2EN=�\�H�\�~\�_\�\�K/��0b\�9\�CR��ҽ��8hߥ��x�C\��\"=���V�\��X\�\�5	:�\\�A���Bծ�gݨZ0��W���m�3�}@\0@�pd @8�(�n\� ��q���\�\��\�W_5�l��\n�\���\�˴\�\�?\�գGs��o�e�V(<�\��\�}\�c_[ݨݺu3���t\�b�\�z\�-cc͚5\�\�k\�x��\�\�Lt�yME�\�NHݫ\"�\n$\�c^\�~�~7l\�\�\�S\�\�\�mx�\�<�L3fLtFD��B\�M7\�d�tT�\nZr\��;묳~uh^q\�HEW�^m�\�9�+�߫U\�nL[Ni2ݛZ\�W��T(\��\�\�]w�\�;\�0\�~L��f��\��0{]\�\�\��>}\�\�6U\�S�_~��\rU�S_+^郰U\��[P��\�W}����=����Zz%�ƨ���TӫcǎF\\\�����\�&*8�\\�\�\�d\�VM���j;6mǔ�������V@��D�n\Z�\\	��|\�\�Թ��q��RԹ��0��\0\"%�\0)^�\0 \0� @d\0)� @\�!����\0a�\�7\�|c��@\�H��gϞf�D\�**�\�\�.&\�\�\�Ђ�~��f悊ZQ^\�\�:\0]�\�0��܆!@\�ᾊ+͛77����]W\� �_RѾ�SaM=��[��\�����Mn��fS��\��\�ܣkk�Vk-\�ԦV���]v\�\�\�L\�{uȶ��\�#\���\�!�����ַo_Si����s�\�r��D\�6h*.ju\���\�/�|�U\0\�u�=X1�o��ֈ�\�w�y6}x��\�ʦ�B�\�8�-�VRm���N*\Z�\�\�\0&M?\�B��3�D@�G>f�� \0�E\0|!@8�(�n&Q��\��\�A\�Gi��\\z0��\��>�z\�\0\r\�\�\�δ_\�\���/\�/O?��9\�u\�]�<4��I�\�\�_�Ҋ=\�\�f�mL%\���\�/\�=��i����\�\�z\�w̼�\�\�s\�=��``�V	i[3�y����\��Z\�:�E��T|�\��S\�E�Xxꩧ\���\�\�o�_۠͞=;%H�8�34T�\�k\�ܹ��C�c�=�\�Y)U\r��(@\�z:{#��D\�(C��\�*��n&\�3�\"Jɾ\"\��\'z@\0.\�C��\�]r_!\0@�3�$DYt3i�~\\���mW��S���\"�ΌX�x��\���B���p>� mm�5*\�u�M�\\*l��]ϵ��\n\0�]\�Wv0�\�͜9\�\�WЊ}h�%���\�R�s\�\�fօ�^\\\\l�\"�6c5e�*\"�PP�D\�&\��0��A\�\�����?�l�l�SE���\�RDm\�Ua_a�o=�rJD�\0 \0@\0�@4 �\�\Z���#�n�|A��`��\�q\�\�\��\�7\�7��\�\�\�\�_�\��\�\�\���j\�*2w��Ӡ�S\�Ӿ�ẑ9�\�qh�dC�\�\�\�;:o@\�Sz�~\�UW���\�+D\�sB]����\�\�mCt\����\�ҵTT��\�MՃV�(��:�A�Թ**@\�\�ʅv\�!�]��\0�\�:\�\"�D\n\�9\��������*:�}�ٲ\�;\Za%r�m�¾ \�&\�\�z�唈 \0@\0�\0 \0�h,Z�\�,ܩe�h��j0c3�eu\r\�\�R���\\�dʞ�� \�E�\�|\�U��\�_\�7\�s�l*h\�7�U�й:{@\�\Z\�r�i�\\t๶ҶBZaP\�K��\0S�w�e�ƫ��KRqAŬ���A%mut\�i��L�����\�\�\�nZ�0���\�B��L�\�\�L�C9\�̺hݺ��\�g�1�\�̍�WM���W\�#�C[?\�h姃�è�P߂*�^�z\�o�\�rj��ʞC����k!@��W��\0 \�#Z0��Ub�\0 \0�(	 @Y)\�����%�L{\r�W	�\�˶ \\\�^�|��\01|�p\�\nH\�]|�˥�{�t\�\�����kV�W+\Z��\�q\�\'���\�\�\��\r~=�ז^:��\�_7���/���u֪�z�\��\n�ޣ��N��zm�\�w7�hŅ�H\�!\�\�{��X\�w\�}%���\�G\�^{mj೶%R{\�Vqh���\�o��\�\��\�P;ږLm�P�~�\�\�\'5�����*d\��\�&�w\�q�ɳ�վ}{S����9\�3XZ�\�=\�\n-�g�~h5\�m�\�fLh\�Զ\�n+g�y��o�O�S�\�\���\\w\�u��\�}��\�M�\�g�}fZ1�\0ŵl�ZYX�\\zuh\��\��H�\0B�!\�	I4aB\0�@h\�8ߦ\"�t�z�0�{^/�\0\�uz�\Z\\��~ذa\��z@�\�\�Ar.\�\�on���\�2U>�\�\'��y=��i\�zx^Y-�.Ѓ{�sG�_g-Tui���ɕ	�\�U�d�\�\�2m\�43B�*THhٲ�h[%� �_|\�\�Y\��_3f\�0��V�\�0*(w t ��E�L[&�j�\�Kd���2Ki�VD\���\�ڲLg4�͊We><�\�f��~��\�F�y\�\'Lň�0`@J�Q�E�!�uDT\\\���Vn**�Z\��LmT\�\�M[P���\�F\�	{�t$��E�$�\0��d�ԫS [4�AA\0�@� @\�5� \0@�r�`rdgЂɑDYt\�\"|\�Lg*@\�㢢\"Y�t\�\�\�\�N\��\0[��\��tZY\��ihC SQ���}�\0 \0�� @\�D�\�!\0@ j���pH\�#@�\�\�e <Nn�C\�D�\�ܹ���\�+UzV[B)�|�\�ү_?ӊ�\���C\�8U\�+b�`\n��\�k @��_��\0 \���I,�\0\�$�\0\�H\� I�E7 ,\��\�tu\�\�97\�S�\���\�י�^S�L1��t\�B߾}M\".(���3&�\�F\�e\�|��9QPbuT�Z3j�L~\���\0 `�\0�M�؆\0 \0%�\0\�\�>@�p$Q\�D��\�3ӕ	\��\�Ay�\�Q�\�\�o\�\�ﾭ1b.���u�\�\Z\��:\��\�7sV�\\i\�E\�k?�����p�Ȅ	\�\�.t@�\�g�-\���L�4I�w\�n\�]Dy!@DI׏�� �\�],�\�ו�\�\��\0F�\0 `�\0�5��\0 \0�\r \�\n�$ʢ�\�{f��\01gP/Y��e�\�uG�C�u�t�\r�aÆ\�W�F�\�\�Tl��\�ͷ\�u\��޺u\�\�\�FDM\0\"j\�\0\�~�\0�@R @$%\�\�	@ � ⛛r�!@8�(�n\"@X�\�\�\�\��W\�A�������G�\�\�j#\�\�}�Q9�\�#=#C8I!�\0��L\�>N�ڳ\�I@\0\�/=�P\�>�F�@\0H#�\0\�\�v@�p$Q\�D��\�3\�Ù�\�\�w���\�;j fΜ)\'�x�gd\') ��\�\�ǉ\0Q{v<	@\0�\0 \0$�\0�#�F�p$Q\�D��\�3\�\�\r�\�P\�\�\�H?�py\�gL\�:\�!�\�篻\�:ӷ�.@�p1k��\"���@\0�\0 \0�K`\�\�\��N-�;��kU<\�\�\�q]C�W�\�P��s�\"z\�x\"y\�G���\�\�)��\"�gϖ�~�)�\�Ϗ;V.��\�|��\r�N\0\"t�\�-�\0\�]J	���h�\�mj	�\0\"\"�\01pd�h_�>^\n�̓\�\�\�\�g�l	\�\�wU$�\0���@6D`s̘1r\�5\�\�\�ի͏N;\�4�\�[\�r�u �W\�V���%˥W�6y��1w @��+<�\0 �t�N� ~@\0Ȗ@\�\�T@dK=��\�HP\�5�\0\�!,� \�w\�u��{\�r\�\�JQQQX.� \0�X�Z�XP�L\�\�)��-�\�*n��\0 \0� @��3<�\0 \�Z09�QZ09�(�n\"@X�\�\�\\\�P \0�J	D-@��\0 ��H� \0Ԗ\0C�kK.\�\�!@\���\� LZL]F��ibp+oh��7\�\�\ZB�p6u8@ q �r�\0 ;�KI\�!@8�(�n\"@X�\�i\�J8Y`u\�\��@\�-����@d \"C\�\��\0 �!�Aپ\r\�v\�o\"�9r\�CW2��Q@����?\�F-@L��X\Zׯ+E�\���H \0@�\n+\�1\n@\0i \��$ʢ�\�{f\Z³�N\� �F�� �r�\0 \�,gS�\��\0�!�\0\�H* I�E7 ,\��\�4�g	%��	 @d�,q @$.\�@�Yz\�3�����\�8 \0�O\0\"@8�(�n\"@X�\�i\�J8Y@�\�\ZY\�@�H\\\�	�\0 \0@\0�%�Z�\��c�&\�=�rW� \��\��|�v\����\�s@\0�\0 \0@ �-]avj\�<��kiM\�\�JKKk�t\�c�\�&\"�Nn\�\�E�#@d	,��#@$0\���\0X�u�\0�3��\�(�5��\0 \0�,	Ђ)K`\�@\0�\'�\01pd��\��\�\�`\�<)..��I\�H�\�\06�\0\�p�b\�:D\��;y\'�l�ZYX�\\zuh�w\�t�\0�y\�K@\0a5�\0�\0 ��0η��ȎyVw����rs�\0�!,a�d@�WQJ�I�:ұE3_ \0\�\0D�@c�\0�$@&G6-�I�E7 ,\��\�4�g	%@ tQ�;̂�\0 �X�M=�C\0�\r�P\�&\�;�\0\�H�,��\0a�g� <K(\�dM�LY#K\��K9C\0p�\0���\�q@\0\�@�p$��$ʢ�\�{f\Z³�N\�B�5�\�=�\0A�\�m)�\0 �\�в0 \0dH\0\"CP�oC�����\�G���\\�L\�gT �\"\�ϺQS\�.�\��\�JQ\�v�@#@\0�B\0\�\nv�B\0�@\ZG��#��\�&�E���F��,���5���%\��ĥ��!\08K\0\�\�\�\�8 \0o @8�JGe\�M��=3�\0\�YB	\'kY#K\��K9C\0p���(l\��8@\0\�@�p$��$ʢ�\�{f\Z³�N\� �F�� �r�\0 \0@\0�\0jI\0��\���D���g½�\�\�c rq�\�͝z����\�\�}��@\� rF\��ާ�\0!\0@\0�\0 \0��,Z�¬ԩe�V�v=\��\�K\�\�DD\�q\�\0\r\"ڍ\�\�\�>d11|pW\�\��\�k\�\�i\�\�W�͝�|<�\�D@\0\"��-�\0\�YB	��\�h�\�qr	\r�\0\"!�\01pd�`_�>^\n�̓\�\�\�H�g�h	\�\���\'�\0����k%ra\�\�z\�%�l�ZYX�\\zuh�\\D^-6 \0�B�!Ԯd\n?!\0@ .\�8ߦ\"\�l���\��zi�\�k%8+\�1\n8@ jbA\�2�W�@:�h\�\0\r\\�\0 \0�8@��sv�\r�@2Ђɑ<ӂɑDYt\�\"|OM#@x�X\0r&�\0���,\0@\0\�@\0��\0@\0�	�v�\�쩀�pׅ��\��zi�\�k%8\�j+�0\�%Z0y�\�P�B�\'�A\0�@� \"�\�\��\0 ���0ٿ�\n�9��q\��A\0�`�+��\�g\�-�\�\�\��\0|#�\0\�[F���{ \��#��\�&�E���\0�\"�\0\�U:#	&jb\�\�\�Ҹ~])\�\�.�Y�\0�C\0\��ۻc;�:\�-�\�Kr�!�v�,�����ՁK� [G�\��%��\�F�9��%b#6\�ՠ�Z�4Nn���h �%KK`q�9��\�;\�M�L\�{�\��8o�\�_}~m?��\�U\��\�L	 P��\0�\�Ό\�@i\�\�@l���\�BkZg\n \�$j�D�\0\0�@�i�B	 �XD�\�\n �4j�e\n ���\�[G��XhLk�-���\0\"XÔK�\0��ҿ\�\�\�\�hX�\�	 @`\�\�֗r�q\�\�O]�,o\�C�\0\��â\�hr @��o�\�\�\'�|R�[0a5( @�\0[@l�<��\�y\�|�\0��D���\�\\}��P���m �\��\'@�\0 @ �@�-�s���7 r==����A\�3433�\\�(Ģ\�r2��mS4��S�mQT,�c}[\0Q��9\ZT�<C 0C@\01˥�8z��{r���s�ڢ\�e2qqz�R\�.\�\�\�;�>�M \���\0�`Ws4�`y�&@`��\0b�K	 �Q\�\��|i��u�J\�Q\rE�\0-\n Z\�9 @�.[0\�Տ�\�8\"H��I`A�5\�T @�\0�@4\�v�&@�@U\�֗r���7 \n>�9\ZT�<C 0C ZB=cj.%�V�L @`)��t\�< W@\0�wހ\�(e @�@x�P�oa�	؂)|M�\0\� �i�B Ь�\0\"H\�A\Z�L/ �\�\��pu��\0�@T\�\n� @�YD�\� �4J�$`�5\�Tf	 fq����\0�\0�!	 Ш�\0�\�ƛ6*@TԌu� �4J�$\�bA���eĖ\���\0\�C@�\0�ҿ\�\�\�\�\�5�q @��l�h\�K9\�8v�\�\�d�r4h�\�\\I�@I�h_%-�ݖ�\0��~\�8[D�]Q @�\0\�����c}[\0q�\'e\�gr4h\�\\F�@a�h_�9ߐ�\0��*�\�\0\0\Z�IDATfW:UD��Q @�\0��m�c}[\01�1���\r�~7W PR@\0QR\�\�5 j\�N�	 \�\�Y @`�`ڄ�{ @���r�o \n>9\ZT�<C 0C@\01˥�8z��{r���s�ڢ\�e2qqz�R\�.\�\�\�;�>�M \���\0�`Ws4�`y�&@`��\0b�K	 �Q\�\��|i��u�J\�Q\rE�\0-\n Z\�9 @�.[0\�Տ�\�\�\�\�u/�\�v�\�\�?��Gt;Ow���[��\0b��nN ��\0\"+�� @�\0l\\@\0�qr7$@�\0��@���\�\�ހ(�\� G�\n�ghfDK�gLͥ\�\n؂\�B�\0,E@\0��N�\�\n ��\�A\Z�L/\�\��-?[0�o�	 @�\ZD5�P�@i�\0\"H��I�\0\�\�[~�\�B @�@5�jZ�4+ �\�zD�F)���l���f�\�,\�,.@@5$\Z@4\�x\�&@�@E�����D�F)����}A,�\�T�, �\�rܾ@x @ �@�7�\�\���3�-m})\�\�����L�@�M��+	()\�����\�@�\�\�\Zg+���+j\"@�\0 @\�<\�֗r�o \��L�L�M��\�(,\��0�\�@4\�\�J�*���1\�\"@�\0 @`�@�-�s�o f?&\�?��A\�\�\�JJ\n J\�\Z�fD\�\�i�6D}6KlB�L�PvX�@��mD�\'\"G�\n�ghf f`�tQG\�_tO�uwn^[ԼL&��\0\"N�TJ�\0�\�B]{�\�G�\0�	\�X\�@\�j�,\�\�\�@\��r)2\nu�/\�t��^\�8�� @�ED�]7g\�%`���������\�\��\�\�����^�\�\�n\�\�\�n�3@l�\�\�	d@d\�4 @�\0�� 6N\� 0����c}\��\�hP��M���h	������Z[0y@ @�\0�� �\�I� @�@\\D�\�y\"H��I�\0\�B��\�\'`��-4T# ���\n!@�@�� �@i�2	 @ ��\0\"|\�O�!\�\�[h�F@\0QM+B�\0�fAZ/�\�(eX��-�\�LS�% ��\�\�\����$@�@��Fo\��H@\0QQ3֕\"�\�(eX�@�/�ћʖ[n�\�w\�H����{#\�p\�!@�\0���/\�8\�\�!Գ�\�\�Ѡ\�ws%%�}A��0v[���]\�l5vEM @�\0�G \��R��m\�y����\�Ѡ��r��}A\�0|C���]\�T�6FY @�\0\���\�w��m\�\�\�d�r4h�\�\\I�@IDI]c\�, ���;m\�&�h�\�fI�\0�M؂i\�\�A�\0Kȱ�-�(�D\�hP��M��\�,�.J\�\���\�\�\�\�\�\�k���\�\�@\�\�J	 P��C�k\�� @�6�\�\���]\�Ѡ�\��\0��X.%@�@F��ã\��\�\�\�+G5�( �h�\�\�L�\0��l�TW?VV���׽��\�ݾw�\�k=|\�\�<}\�\�\�\�ouF���9�����#@�\0 �q\�\�\�ݐ\0F\�֗r�o{�\��\r*X��	�!-��15�X+`& �\�R:i�+ �\�;o@i�2	 @ ��C�÷0�l���&@�\0�jմB!hV@\0��� �R&�@�oa�	8�:|M�\0\� �i�B Ь�\0\"H\�A\Z�L�ӂ�i*���\\\\@@\0Q\0ՐhT@\0\�h\�M�\0	 *jƺRA\Z�L��� zSٲ�\0b\�\rp�N\0\�! @�\0�\\\�\��wwo\�\Z\�8 @`�@���g;�z�c2�9\Z4�n�$@��@�/��\�nK@\0\�V�k��\0�Ʈ��\0 @�\0��D[_ʱ�-�8ϓ2�39\Z4�V.#@��@�/�\��oH@\0\�P�+��\0�\�\�(�\0 @�\0�\�Ѷ�α�-����L�@�M��+	() �(�k\�5w��\�m�\�,	 �	[0mB\�= @`I9ַ��\r*X��	�! ���\�\�E	=\�=9|\�ݹymQ�2�8�8�R)jpu\�R\�&�c}[\0Q��9\ZT�<C 0C@\01˥\�(ppx\�]��\�ݺz%㨆\"@�\0�-vݜ	 P��-�\�\�\�\�j�����\�w�\��\�zͣ����������\�H\0�U~7\'�U@\0��\�` @�\06. �\�8� @��H \��R��mo@�c��A\�343�%\�3�\�Rkl�\�!@�\0�\" �XJ\'̓\0qAz\�\r� �R&�pu����-�·\� P��\0��V(�\0\�\n ��^\0�Q\�$@�\0����-?�P�o�	 @�\ZD5�P�@i�\0\"H��I`A�`ZP3Me��\0b�� \n�\Z�\0�\n \Zm�i @�\"DE\�XW�\0\"H��I`AѾ Do*[@l�n\�	 < �K ���\�\�\\\��\0\�����\�c�P\�~L� G��\�͕���Q\�\�\�m	 \�\�w��@\�\�5 @�\0 p�h\�K9ַ\�yR&~&G�&\�\�e��Q�\��\r	 \Zjv�S@T\�e @�\0 0[ \�\�9ַ��\�\�Ѡ\�ws%%%u�]��\0�\�\�Q�\0��>�%6!`�M(�,I \���\0�\���A\�3433�\\�(��\�/�\'�Ϻ;7�-j^&G@\0�W*%@�@\����C\�#@�\0�\�r�o \nv5G�\n�ghf f`��\0��˗v�[W�d\�P Т�\0�Ů�3\��S]�XY\�\�\�^���nw�\��S�y��A���q����\�	 �\�\�\��\n �r\Z�\0 @��\�\'wC	D[_ʱ�\�\r��r4�`y�&@`�@��z\�\�\\J`��-�<  @��RK\�y @ ��\0\"H\��Q\�$@�\0���\�\���S��\0�@T\�\n� @�YD�\� �4J� ^@\0��\�\'\�\��-4T# ���\n!@�@�� �@i�2	,H�Lj��\�@\�\�rqDTC @�QD��7mT$ ���\�J@i�2	,H \�Ă\�Me\��-7�\�;���\0r	�\�\�ݽ�k8\� @�\0�\�\�֗r�q\�\�ُ\��\�h\�����\0��Ѿ JZ�-D[��q��\Z��& @�\0\�#m})\���\0\�<O\�\�\�\�h\�\�[��\0�\�Ѿ \ns�!DCͮt��J�, @�\0fD\�\�;\���\0b�c2�9\Z4�n�$@���\0����k@\�ܝ6j@�\�g�$@��&l��	e� @�\0�%	\�X\�@|\"r4�`y�&@`��\0b�K%p��E�\��Yw\�\�E\�\�d\� \��J��]�!ԵwH} P�@��mD��\�hP��M��\�,� @ ���\�Qw�\�Nw\�ꕌ�\Z�\0Z@�\�us&@�@]�`��+�\�\�\�\�^^\�\�n߻\�5�>\�v�>\�����:#\�V�ݜ@VDVN� @�\0ظ�\0b\�\�nH�\0#�h\�K9ַ�Q��A�,\�\�\���PϘ�K	����\0X��\0b)�4\�@\�7 �4J� ^�!\�\�[~�`\n\�B @�@5�jZ�4+ �\��HDRe @�\0 @�\0 @�\0�W���]H\�L\��aZ�S+�6ϱ�7 <\��\���\�\�\�_��\���?�]�� @�@po@o��	 �\0�ho@\� @\�P4�h�b�M5�I�IL.*( �(�kh4&��Mw�Fc�6]�I�\��%DMO�Z�V�\�/�j����\n 6\�\�f� < @�\0,E�\��%\�R�^� @��@�_EA\rF@\0�U�-T\0�\�֚ @�\0�\�Z\�\�[\0\�\�cn\��G@\0q5�Y��\0b	]�=D\����\05	؂��n��\0Z@�\�i�$@\�B���p`��\�/�\'�Ϻ;7���\�# \"wO\��K�!\�u�C5 І�\0��>�%@\\\�\�	 pN��ã\��\�\�\�+\��\� @��� <	 �m[0m�￷�׽��\�ݾw�\�O<z��\�y��\�\�ߟ8�\� �^@\0\�	!@�\0 [@\0��\'@��Z\\_�\��\\s @��@�	uqT7!`�mR$ 0A@\01\�% PT@\0Q�7\�\�ހ\�gi$ �N�!Ԟ�m؂i\�p,G@\0��^�	�\n �tN\0�Q\�$@�\0����-?�P�o�	 @�\ZD5�P�@i�\0\"H��I`A�`ZP3Me��\0b�� \n�\Z�\0�\n \Zm�i @�\"DE\�XW�\0\"H��I`A-~A,�}�r\��|4��\0\"�A @�\��o���7X @�\0��	���\�\�=nnL�@$�� \"�G�\�\�l�<M@\01\�\�U @�\0\�/\�\���\0��\�R�T \�\�D\�J�@@\0QA\Z/A\0\��`� @�\0$\�\�\��=��B�@9D9[#\�- ���?-T\'�h�\�\�H�\0�\����\'ݻog37s @\�X@\0\�A @��\�$�,R\�\���\�\�\�\�\�\�k���I\�/ ���G*$@�@�PG\�:	 @`I�%u\�\\(& �(Fk`�88<\�._\�\�n]�B�\0\\H@\0q!>&@�\0�\�<=坷�g-\��}R%[@l�nO�\0 @\����8\\X�\��%ą Ђ@���\�Ws<[�g��\0�! ��\�\'U @`\�� \�\�\�\�\�^^\�\�n߻jŏ>\�v�>\�����\�H� @�ND�}i�*g@�\�ms%@�@YDY_� @��\������\"���\�\�\��\�}O\0QE�A�\0�����\�\�\�Y @��w?��{�\�\�\�P�\Z @�Qg@4\�x\�&@�\0 @�\0 @��E��׿v�������\�\'\�o�q2T��?����?���\�\�~ֽ��\��\�+�M\������¸ϟ?\�~�_t��\�_��[\��V�\��8\������\�~��_u\��\�7�o~�֕�\��\��\��_\���\�����H�K��\�Oڽ���\�W��\�I�;k\�ԋ_��\�\���U��\�W�\���\�?�\�s�\�Gu��0\�\��\�7\'\��}\�|����g@L��k @�\0 @�\0 �)�\�\��p|�\��\�k�e/\�\0\�\�\�\�nܸq|߾\�\�~��\'����U9\�я�\\�<yr�\�\�\��\�_��\�0�\�ٓU!T���1\�\�oճ�;t\�W\0Q��\�%@�\0 @�\0 @�)��\�7ҢwzS\����ا�\���\�x\Z\�o�\��z?V����\�\�?ɞ���7 �D�\�p�y�Az{#�\����\�\��k_�\��}\�~�\�q�_�җ�߸\�\��Hc~�\�\�צ_7o\��\�i.\��鳩�d�\�>��w�\����FzC#��\�_;�O�0��;қ?�я^y\�d��\�\�\�\�כ\r\�7~�c\�\�\�XC�\�~^�����#�={v��L\nK�7&\�o-\\�~�U?N\�\�?|�#]\��5=�\�y\�\�?sC��3i.\�\�a��^\0\�\�_�&K�\0 @�\0 @�@)����\��\�\'A����I��\�\�{\�\�w\�\��򗿜l\r���DZ�O�Ң}��R\n\�\"�\�\0b��\�Q\��$���)dH�\�|��\�\�\�Z�o\"�9���\�p�����R�ik�7\�|�$�H�N[��O�\�É~\�Þ�z�a����7RR\�i����\�wZ\0�\���(\�ן\�SxtڛS��s\�^�\�gX_��%�~��Ԥm�R\�\�\�x\�U[0�\��gb\�\�~\�Uo� J�mc\\ @�\0 @�\0�oq4�a\�0�X��>���\�}\�\n \�g@�:\'a���臁ø�\�`dx�B��= \��]�\�lX5�u[(\r\�?X\��;-�Xu}��?;!C�\�ڙ�\�ɰ?#\"\�Pg�|��~\�>�9\�:W�}qZ\0�B�To�]\�0\�Io���U}J� ��+\�d	 @�\0 @�\0()\�/Ʀ�\�O��[ �\�j\�-J���5\��\r�\���m|��1�����\��\��\����V<�\"��\�W\�\�\�@�\�\���?�zU�1\�Z\�\�\�eJ\0�\��\��S�\�i=Oy�_\�o�\�\�2�ӟ�t�-\�y\�>7\�lN\0�\�[o���{��>�?�\�gL\0Q�oc @�\0 @�\0 Д@��\�i���\�>;\�\�&-Ү;,������\�pa�\�\�h�\�?\�\r��}3\�?��j��_`�D~\�7 �7(�s΀HgH���민��j�uDǺ�yn\01\��p\�uo�;\�\�o@ ��k\�d	 @�\0 @�\0�A�\�\�?m}4\�\�h@�7��\�\�3 �E�\�Y	\�\0��\����1 �C��\����q\0�\�\�q\�{\�\�\0\"\�9<{\"}(ӟE0|.�\��L�t&\��l�\�A\�s��\�4�\�A�\�~\�hx�\�g@ j�\�F\r @�\0 @�\04\'��\�6:\�\�ӂu�5\\O�?-\��\�3�[0�\�\�EJ[��E㴰��.\Znٓ��O�\�\��𬅴\��\Z/p��0\�V)m��tVC�y|�0TIu�\�\�לB�q]i��\�?\�\��\Z�?0�\r�~.\�m�V>}�?�!�\�\�i\�/�=C��� ��\�\�\�?��d���y\�m\���\�\�\�o\�\� \�\�}��\�\�\�\�����\�M�KaK��ޚ�U\��9�Ss��0 @�\0 @�\0�#0<\�8\�\�ײ\�\�\� @�\0 @�\0 @`�\�7\���\�[-\�͋ �� @�\0 @�\0hO@\0\�^\�͘\0 @�\0 @�\08	 �\�\�\r @�\0 @�\0 @�\0����\�3&.Ȭ*\0\0\0\0IEND�B`�');
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
INSERT INTO `position_product_entry` VALUES (201,1),(251,1),(252,1),(253,1),(2,3),(100,3),(151,3),(200,3);
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
INSERT INTO `product` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,_binary '',NULL,'2023-05-17 08:04:35','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job2','job2',0,2,NULL,2,NULL,NULL,NULL),(100,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,_binary '',NULL,'2023-05-17 09:13:36','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job5','job5',0,2,NULL,2,NULL,NULL,NULL),(151,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,_binary '',NULL,'2023-05-20 17:16:08','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job9','job9',0,2,NULL,2,NULL,NULL,NULL),(200,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,_binary '',NULL,'2023-06-17 16:58:14','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63b5e8-f7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63b5e8-f7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1),(201,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,_binary '',NULL,'2023-06-17 17:13:08','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63b5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63b5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1),(251,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,_binary '',NULL,'2023-06-18 20:58:52','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfasfb5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfasfb5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1),(252,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,_binary '',NULL,'2023-06-18 20:59:23','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfasfdsdsddsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfasfdsdsddsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1),(253,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,_binary '',NULL,'2023-06-18 20:59:44','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1);
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
INSERT INTO `product_availability` VALUES (2,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,2,NULL),(100,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,100,NULL),(151,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,151,NULL),(200,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,200,NULL),(201,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,201,NULL),(251,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,251,NULL),(252,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,252,NULL),(253,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,253,NULL);
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
INSERT INTO `product_category` VALUES (2,50),(100,50),(151,50),(200,50),(201,50),(253,50),(251,51),(252,100);
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
INSERT INTO `product_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,'Đã chỉnh nội dung','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,151),(7,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,200),(8,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,201),(10,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,251),(11,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,252),(12,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,253);
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
INSERT INTO `product_price` VALUES (2,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',2),(100,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',100),(151,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',151),(200,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',200),(201,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',201),(251,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',251),(252,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',252),(253,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',253);
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
INSERT INTO `product_price_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:01:55',NULL,NULL,'DEFAULT',NULL,NULL,4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,NULL,'DEFAULT',NULL,NULL,4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,NULL,'DEFAULT',NULL,NULL,4,151),(7,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,NULL,'DEFAULT',NULL,NULL,4,200),(8,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,NULL,'DEFAULT',NULL,NULL,4,201),(10,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,NULL,'DEFAULT',NULL,NULL,4,251),(11,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,NULL,'DEFAULT',NULL,NULL,4,252),(12,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,NULL,'DEFAULT',NULL,NULL,4,253);
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
INSERT INTO `product_type` VALUES (1,NULL,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'GENERAL',NULL,NULL,'dfefds'),(200,NULL,'2023-05-25 22:03:05','2023-05-25 22:03:05',NULL,'buonban',NULL,NULL,'Buôn bán');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (12,NULL,'Tôi sẽ đi ăn cướpf','Tôi muốn kiếm 30 triệu mỗi ngàyf',NULL,200,50,451,2,1,1);
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
INSERT INTO `profile_area_work_entry` VALUES (12,1);
/*!40000 ALTER TABLE `profile_area_work_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_skill_entry`
--

DROP TABLE IF EXISTS `profile_skill_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_skill_entry` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `RATE` double DEFAULT NULL,
  `PROFILE_ID` bigint NOT NULL,
  `SKILL_ID` bigint NOT NULL,
  KEY `FKoiaxdcih0a5s8d4l2o3nffmrd` (`PROFILE_ID`),
  KEY `FKrrecw8a6c2grk3v5b45bua56c` (`SKILL_ID`),
  CONSTRAINT `FKoiaxdcih0a5s8d4l2o3nffmrd` FOREIGN KEY (`PROFILE_ID`) REFERENCES `profile` (`ID`),
  CONSTRAINT `FKrrecw8a6c2grk3v5b45bua56c` FOREIGN KEY (`SKILL_ID`) REFERENCES `skill_description` (`ID_SKILL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_skill_entry`
--

LOCK TABLES `profile_skill_entry` WRITE;
/*!40000 ALTER TABLE `profile_skill_entry` DISABLE KEYS */;
INSERT INTO `profile_skill_entry` VALUES ('7d1aa115-6f20-4829-8fd2-bd809514721d','Khong co cap nhat',0,12,1),('337b0a24-f409-4589-8d97-92ea2dcd0c78','Khong co cap nhat',0,12,2);
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
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `APPLY_DATE` datetime NOT NULL,
  `STATUS` int NOT NULL,
  `ALUMNUS_ID` bigint NOT NULL,
  `JOB_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9yi05ca40ukgkso2dvt90xqws` (`ALUMNUS_ID`),
  KEY `FK7alyoryxpc2q5y1p44e9pg8wl` (`JOB_ID`),
  CONSTRAINT `FK7alyoryxpc2q5y1p44e9pg8wl` FOREIGN KEY (`JOB_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FK9yi05ca40ukgkso2dvt90xqws` FOREIGN KEY (`ALUMNUS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES ('744f2326-13fa-42a3-bac3-e109c93e3e0a','2023-06-11 23:31:54',0,451,2);
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_description`
--

LOCK TABLES `skill_description` WRITE;
/*!40000 ALTER TABLE `skill_description` DISABLE KEYS */;
INSERT INTO `skill_description` VALUES (1,NULL,NULL,NULL,'java','Java'),(2,NULL,NULL,NULL,'dev','Developer'),(3,NULL,NULL,NULL,'negotiation_skill','Đàm phán'),(4,NULL,NULL,NULL,'programming_skill','Lập trình'),(5,NULL,NULL,NULL,'problem_solving_skill','Giải quyết vấn đề'),(6,NULL,NULL,NULL,'sales_skill','Bán hàng'),(7,NULL,NULL,NULL,'leadership_skill','Lãnh đạo'),(8,NULL,NULL,NULL,'project_management_skill','Quản lý dự án'),(9,NULL,NULL,NULL,'accounting_software_skill','Sử dụng phần mềm kế toán'),(10,NULL,NULL,NULL,'financial_management_skill','Quản lý tài chính'),(11,NULL,NULL,NULL,'teamwork_skill','Làm việc nhóm'),(12,NULL,NULL,NULL,'repair_skill','Sửa chữa'),(13,NULL,NULL,NULL,'installation_skill','Lắp đặt'),(14,NULL,NULL,NULL,'maintenance_skill','Bảo trì'),(15,NULL,NULL,NULL,'marketing_skill','Tiếp thị'),(16,NULL,NULL,NULL,'advertising_skill','Quảng cáo'),(17,NULL,NULL,NULL,'customer_service_skill','Dịch vụ khách hàng'),(18,NULL,NULL,NULL,'data_analysis_skill','Phân tích dữ liệu'),(19,NULL,NULL,NULL,'problem_id_skillentification_skill','Xác định vấn đề'),(20,NULL,NULL,NULL,'time_management_skill','Quản lý thời gian'),(21,NULL,NULL,NULL,'creativity_skill','Sáng tạo'),(22,NULL,NULL,NULL,'critical_thinking_skill','Tư duy phản biện'),(23,NULL,NULL,NULL,'decision_making_skill','Ra quyết định'),(24,NULL,NULL,NULL,'emotional_intelligence_skill','Trí tuệ cảm xúc'),(25,NULL,NULL,NULL,'adaptability_skill','Sự thích nghi'),(27,NULL,NULL,NULL,'team_management_skill','Quản lý nhóm'),(28,NULL,NULL,NULL,'research_skill','Nghiên cứu'),(29,NULL,NULL,NULL,'problem-solving_skill','Giải quyết vấn đề'),(30,NULL,NULL,NULL,'communication_skill','Giao tiếp'),(34,NULL,NULL,NULL,'design_skill','Thiết kế'),(35,NULL,NULL,NULL,'firearms_skill','Hỏa giáp'),(36,NULL,NULL,NULL,'crisis_response_skill','Biện pháp ứng phó'),(37,NULL,NULL,NULL,'survey_skill','Khảo sát'),(38,NULL,NULL,NULL,'data_skill','Dữ liệu'),(39,NULL,NULL,NULL,'statistics_skill','Thống kê'),(40,NULL,NULL,NULL,'positioning_skill','Định vị'),(41,NULL,NULL,NULL,'interaction_skill','Tương tác'),(43,NULL,NULL,NULL,'analysis_skill','Phân tích'),(44,NULL,NULL,NULL,'forecasting_skill','Dự báo'),(45,NULL,NULL,NULL,'data_collection_skill','Thu thập'),(46,NULL,NULL,NULL,'solid_skillity_skill','Solid_skillity'),(47,NULL,NULL,NULL,'ethereum_skill','Ethereum'),(48,NULL,NULL,NULL,'hyperledger_fabric_skill','Hyperledger Fabric'),(49,NULL,NULL,NULL,'smart_contract_skill','Smart Contract'),(50,NULL,NULL,NULL,'adobe_creative_suite_skill','Adobe Creative Suite'),(51,NULL,NULL,NULL,'sketch_skill','Sketch'),(52,NULL,NULL,NULL,'wireframing_skill','Wireframing'),(53,NULL,NULL,NULL,'prototyping_skill','Prototyping'),(54,NULL,NULL,NULL,'testing_methodologies_skill','Testing methodologies'),(55,NULL,NULL,NULL,'test_automation_skill','Test automation'),(56,NULL,NULL,NULL,'bug_tracking_skill','Bug tracking'),(57,NULL,NULL,NULL,'selenium_skill','Selenium'),(58,NULL,NULL,NULL,'java_skill','Java'),(59,NULL,NULL,NULL,'swift_skill','Swift'),(60,NULL,NULL,NULL,'react_native_skill','React Native'),(61,NULL,NULL,NULL,'kotlin_skill','Kotlin'),(63,NULL,NULL,NULL,'agile_skill','Agile'),(64,NULL,NULL,NULL,'scrum_skill','Scrum'),(65,NULL,NULL,NULL,'kanban_skill','Kanban'),(66,NULL,NULL,NULL,'docker_skill','Docker'),(67,NULL,NULL,NULL,'kubernetes_skill','Kubernetes'),(68,NULL,NULL,NULL,'aws_skill','Amazon Web Services (AWS)'),(69,NULL,NULL,NULL,'azure_skill','Microsoft Azure'),(70,NULL,NULL,NULL,'google_cloud_skill','Google Cloud'),(71,NULL,NULL,NULL,'devops_skill','DevOps'),(72,NULL,NULL,NULL,'continuous_integration_skill','Continuous Integration'),(73,NULL,NULL,NULL,'continuous_deployment_skill','Continuous Deployment'),(74,NULL,NULL,NULL,'git_skill','Git'),(75,NULL,NULL,NULL,'github_skill','GitHub'),(76,NULL,NULL,NULL,'bitbucket_skill','Bitbucket'),(77,NULL,NULL,NULL,'jira_skill','Jira'),(78,NULL,NULL,NULL,'confluence_skill','Confluence'),(79,NULL,NULL,NULL,'ansible_skill','Ansible'),(80,NULL,NULL,NULL,'terraform_skill','Terraform'),(81,NULL,NULL,NULL,'python_skill','Python'),(83,NULL,NULL,NULL,'javascript_skill','JavaScript'),(84,NULL,NULL,NULL,'csharp_skill','C#'),(85,NULL,NULL,NULL,'php_skill','PHP'),(86,NULL,NULL,NULL,'ruby_skill','Ruby'),(87,NULL,NULL,NULL,'go_skill','Go'),(89,NULL,NULL,NULL,'typescript_skill','TypeScript'),(90,NULL,NULL,NULL,'html_skill','HTML'),(91,NULL,NULL,NULL,'css_skill','CSS'),(92,NULL,NULL,NULL,'ky_nang_hon_nhan','Hôn nhân'),(93,NULL,NULL,NULL,'ky_nang_gia_dinh','Gia đình'),(94,NULL,NULL,NULL,'ky_nang_chi_phi','Chi phí'),(95,NULL,NULL,NULL,'ky_nang_ky_thuat','Kỹ thuật'),(111,NULL,NULL,NULL,'ky_nang_thong_tin','Thông tin'),(112,NULL,NULL,NULL,'ky_nang_du_toan','Dự toán'),(113,NULL,NULL,NULL,'ky_nang_tu_van_suc_khoe','Tư vấn sức khỏe'),(114,NULL,NULL,NULL,'ky_nang_suc_khoe','Sức khỏe'),(115,NULL,NULL,NULL,'ky_nang_dinh_duong','Dinh dưỡng'),(116,NULL,NULL,NULL,'ky_nang_lao_dong','Lao động'),(117,NULL,NULL,NULL,'ky_nang_an_toan','An toàn'),(118,NULL,NULL,NULL,'ky_nang_cham_soc_da','Chăm sóc da'),(119,NULL,NULL,NULL,'ky_nang_trang_diem','Trang điểm'),(120,NULL,NULL,NULL,'ky_nang_phuc_hoi_da','Phục hồi da'),(121,NULL,NULL,NULL,'ky_nang_trang_bi','Trang bị'),(122,NULL,NULL,NULL,'ky_nang_bep','Bếp'),(123,NULL,NULL,NULL,'ky_nang_pha_che','Pha chế'),(124,NULL,NULL,NULL,'ky_nang_pha_che_ruou','Pha chế rượu'),(125,NULL,NULL,NULL,'ky_nang_pha_che_cafe','Pha chế cà phê'),(126,NULL,NULL,NULL,'ky_nang_pha_che_nuoc_uong','Pha chế nước uống'),(127,NULL,NULL,NULL,'ky_nang_tu_van_du_hoc','Tư vấn du học'),(128,NULL,NULL,NULL,'ky_nang_lam_moi_ho_so','Làm mới hồ sơ'),(129,NULL,NULL,NULL,'ky_nang_lam_viec_tu_xa','Làm việc từ xa'),(130,NULL,NULL,NULL,'ky_nang_soan_thao','Soạn thảo'),(131,NULL,NULL,NULL,'ky_nang_nghien_cuu','Nghiên cứu'),(132,NULL,NULL,NULL,'ky_nang_phat_trien_du_an','Phát triển dự án'),(133,NULL,NULL,NULL,'ky_nang_tu_van_tu_thien','Tư vấn từ thiện'),(134,NULL,NULL,NULL,'ky_nang_thuc_pham','Thực phẩm'),(135,NULL,NULL,NULL,'ky_nang_nong_nghiep','Nông nghiệp'),(136,NULL,NULL,NULL,'ky_nang_thiet_ke','Thiết kế'),(137,NULL,NULL,NULL,'ky_nang_dien','Điện'),(138,NULL,NULL,NULL,'ky_nang_dien_tu','Điện tử'),(139,NULL,NULL,NULL,'ky_nang_nuoi_trong','Nuôi trồng'),(140,NULL,NULL,NULL,'ky_nang_quan_tri_ban_hang','Quản trị bán hàng'),(141,NULL,NULL,NULL,'ky_nang_mua_ban','Mua bán'),(142,NULL,NULL,NULL,'ky_nang_giao_tiep','Giao tiếp'),(143,NULL,NULL,NULL,'ky_nang_giao_duc','Giáo dục'),(144,NULL,NULL,NULL,'ky_nang_hoc','Học'),(145,NULL,NULL,NULL,'ky_nang_cong_nghe','Công nghệ'),(147,NULL,NULL,NULL,'presentation_skill','Thuyết trình');
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
INSERT INTO `skill_product_entry` VALUES (2,1),(100,1),(151,1),(200,1),(201,1),(251,1),(252,1),(253,1),(100,2),(151,2),(200,2),(201,2),(251,2),(252,2),(253,2);
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
INSERT INTO `sm_sequencer` VALUES ('CATEGORY_SEQ_NEXT_VAL',2),('country_description_seq',712),('COUNTRY_SEQ_NEXT_VAL',5),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',11),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('MANUFACT_SEQ_NEXT_VAL',1),('manufacturer_description_seq',2),('MERCH_CONF_SEQ_NEXT_VAL',1),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',5),('PRODUCT_AVAIL_SEQ_NEXT_VAL',6),('product_description_seq',13),('product_price_description_seq',13),('PRODUCT_PRICE_SEQ_NEXT_VAL',6),('PRODUCT_SEQ_NEXT_VAL',6),('product_type_description_seq',3),('STORE_SEQ_NEXT_VAL',1),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',1),('zone_description_seq',652),('ZONE_SEQ_NEXT_VAL',5);
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
-- Table structure for table `social_contact`
--

DROP TABLE IF EXISTS `social_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_contact` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LINK` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME_SOCIAL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CV_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd2gregk4wegv3xbh70kcs6isk` (`CV_ID`),
  CONSTRAINT `FKd2gregk4wegv3xbh70kcs6isk` FOREIGN KEY (`CV_ID`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_contact`
--

LOCK TABLES `social_contact` WRITE;
/*!40000 ALTER TABLE `social_contact` DISABLE KEYS */;
INSERT INTO `social_contact` VALUES ('60628d52-eab1-410d-a803-a083997b62e9','www.fb.cojjjm','Facebook','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
/*!40000 ALTER TABLE `social_contact` ENABLE KEYS */;
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
INSERT INTO `work_experience` VALUES ('6f795a0d-4506-4dd7-9f72-fb27e0eb7f95','Công ty TNHH MỘT MÌNH TAOf','Làm một ngày thì bị đuổfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam đốc công nghệf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e'),('c00707b4-3467-49b4-8ba0-86dc0519fcd4','Công ty TNHH MỘT MÌNH TAOf','Làm một ngày thì bị đuổfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam đốc công nghệf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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

-- Dump completed on 2023-07-13  7:29:35
