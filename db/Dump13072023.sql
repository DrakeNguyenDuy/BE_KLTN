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
INSERT INTO `category` VALUES (50,'2023-05-14 15:40:41','2023-05-14 15:40:41','ndlong2004@gmail.com',NULL,_binary '','parttime',0,_binary '','/50/',0,_binary '',2,NULL,'B√°n th·ªùi gian'),(51,'2023-06-17 17:55:13','2023-06-17 17:55:13','ndlong@gmail.com',NULL,_binary '','fulltime',NULL,_binary '\0',NULL,0,_binary '\0',NULL,NULL,'To√†n th·ªùi gian'),(100,'2023-05-14 15:49:35','2023-05-14 15:49:37','ndlong2004@gmail.com',NULL,_binary '','remote',0,_binary '','/100/',0,_binary '',2,NULL,'L√†m vi·ªác t·ª´ xa');
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
INSERT INTO `certificate` VALUES ('f8f46e06-15ed-4834-8569-1260d6c1c3b9','www.404.com/1f','Ch·ª©ng ch·ªâ ƒëa c·∫•p xuy√™n l·ª•c ƒë·ªãaf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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
INSERT INTO `country_description` VALUES (1,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,1,1),(2,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afghanistan',NULL,2,1),(3,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Afganist√°n',NULL,3,1),(4,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'√Öland Islands',NULL,1,2),(5,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'√éles √Öland',NULL,2,2),(6,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Islas Aland',NULL,3,2),(7,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,1,3),(8,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albanie',NULL,2,3),(9,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Albania',NULL,3,3),(10,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Algeria',NULL,1,4),(11,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Alg√©rie',NULL,2,4),(12,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argelia',NULL,3,4),(13,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'American Samoa',NULL,1,5),(14,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa am√©ricaines',NULL,2,5),(15,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Samoa Americana',NULL,3,5),(16,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,1,6),(17,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorre',NULL,2,6),(18,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Andorra',NULL,3,6),(19,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,1,7),(20,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,2,7),(21,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Angola',NULL,3,7),(22,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,1,8),(23,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguilla',NULL,2,8),(24,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Anguila',NULL,3,8),(25,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua & Barbuda',NULL,1,9),(26,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua-et-Barbuda',NULL,2,9),(27,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Antigua y Barbuda',NULL,3,9),(28,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,1,10),(29,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentine',NULL,2,10),(30,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Argentina',NULL,3,10),(31,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,1,11),(32,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Arm√©nie',NULL,2,11),(33,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Armenia',NULL,3,11),(34,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,1,12),(35,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,2,12),(36,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Aruba',NULL,3,12),(37,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australia',NULL,1,13),(38,'2023-05-17 03:35:18','2023-05-17 03:35:18',NULL,NULL,'Australie',NULL,2,13),(39,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Australia',NULL,3,13),(40,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,1,14),(41,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Autriche',NULL,2,14),(42,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Austria',NULL,3,14),(43,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaijan',NULL,1,15),(44,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerba√Ødjan',NULL,2,15),(45,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Azerbaiy√°n',NULL,3,15),(46,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,1,16),(47,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,2,16),(48,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahamas',NULL,3,16),(49,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahrain',NULL,1,17),(50,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bahre√Øn',NULL,2,17),(51,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bar√©in',NULL,3,17),(52,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,1,18),(53,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bangladesh',NULL,2,18),(54,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Banglad√©s',NULL,3,18),(55,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,1,19),(56,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbade',NULL,2,19),(57,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Barbados',NULL,3,19),(58,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belarus',NULL,1,20),(59,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bi√©lorussie',NULL,2,20),(60,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bielorrusia',NULL,3,20),(61,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgium',NULL,1,21),(62,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belgique',NULL,2,21),(63,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'B√©lgica',NULL,3,21),(64,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,1,22),(65,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belize',NULL,2,22),(66,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Belice',NULL,3,22),(67,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Benin',NULL,1,23),(68,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'B√©nin',NULL,2,23),(69,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Ben√≠n',NULL,3,23),(70,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermuda',NULL,1,24),(71,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudes',NULL,2,24),(72,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bermudas',NULL,3,24),(73,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhutan',NULL,1,25),(74,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bhoutan',NULL,2,25),(75,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'But√°n',NULL,3,25),(76,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,1,26),(77,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivie',NULL,2,26),(78,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bolivia',NULL,3,26),(79,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia & Herzegovina',NULL,1,27),(80,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnie-Herz√©govine',NULL,2,27),(81,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bosnia y Herzegovina',NULL,3,27),(82,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,1,28),(83,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botswana',NULL,2,28),(84,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Botsuana',NULL,3,28),(85,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brazil',NULL,1,29),(86,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Br√©sil',NULL,2,29),(87,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brasil',NULL,3,29),(88,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'British Indian Ocean Territory',NULL,1,30),(89,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territoire britannique de l‚Äôoc√©an Indien',NULL,2,30),(90,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Territorio Brit√°nico del Oc√©ano √çndico',NULL,3,30),(91,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,1,31),(92,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brunei',NULL,2,31),(93,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Brun√©i',NULL,3,31),(94,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,1,32),(95,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgarie',NULL,2,32),(96,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Bulgaria',NULL,3,32),(97,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,1,33),(98,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,2,33),(99,'2023-05-17 03:35:19','2023-05-17 03:35:19',NULL,NULL,'Burkina Faso',NULL,3,33),(100,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,1,34),(101,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,2,34),(102,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Burundi',NULL,3,34),(103,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodia',NULL,1,35),(104,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cambodge',NULL,2,35),(105,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Camboya',NULL,3,35),(106,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroon',NULL,1,36),(107,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cameroun',NULL,2,36),(108,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Camer√∫n',NULL,3,36),(109,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,1,37),(110,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canada',NULL,2,37),(111,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Canad√°',NULL,3,37),(112,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cape Verde',NULL,1,38),(113,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cap-Vert',NULL,2,38),(114,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cabo Verde',NULL,3,38),(115,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cayman Islands',NULL,1,39),(116,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'√éles Ca√Ømans',NULL,2,39),(117,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Caim√°n',NULL,3,39),(118,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Central African Republic',NULL,1,40),(119,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'R√©publique centrafricaine',NULL,2,40),(120,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Rep√∫blica Centroafricana',NULL,3,40),(121,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,1,41),(122,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Tchad',NULL,2,41),(123,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chad',NULL,3,41),(124,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,1,42),(125,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chili',NULL,2,42),(126,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chile',NULL,3,42),(127,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,1,43),(128,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chine',NULL,2,43),(129,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'China',NULL,3,43),(130,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Christmas Island',NULL,1,44),(131,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'√éle Christmas',NULL,2,44),(132,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Isla de Navidad',NULL,3,44),(133,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cocos (Keeling) Islands',NULL,1,45),(134,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'√éles Cocos',NULL,2,45),(135,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cocos',NULL,3,45),(136,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,1,46),(137,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombie',NULL,2,46),(138,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Colombia',NULL,3,46),(139,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoros',NULL,1,47),(140,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comores',NULL,2,47),(141,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Comoras',NULL,3,47),(142,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Brazzaville',NULL,1,48),(143,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Brazzaville',NULL,2,48),(144,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo',NULL,3,48),(145,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo - Kinshasa',NULL,1,49),(146,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Congo-Kinshasa',NULL,2,49),(147,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Rep√∫blica Democr√°tica del Congo',NULL,3,49),(148,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cook Islands',NULL,1,50),(149,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'√éles Cook',NULL,2,50),(150,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Islas Cook',NULL,3,50),(151,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,1,51),(152,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,2,51),(153,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Costa Rica',NULL,3,51),(154,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'C√¥te d‚ÄôIvoire',NULL,1,52),(155,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'C√¥te d‚ÄôIvoire',NULL,2,52),(156,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'C√¥te d‚ÄôIvoire',NULL,3,52),(157,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatia',NULL,1,53),(158,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croatie',NULL,2,53),(159,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Croacia',NULL,3,53),(160,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,1,54),(161,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,2,54),(162,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cuba',NULL,3,54),(163,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Cyprus',NULL,1,55),(164,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chypre',NULL,2,55),(165,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chipre',NULL,3,55),(166,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Czechia',NULL,1,56),(167,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Tch√©quie',NULL,2,56),(168,'2023-05-17 03:35:20','2023-05-17 03:35:20',NULL,NULL,'Chequia',NULL,3,56),(169,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Denmark',NULL,1,57),(170,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Danemark',NULL,2,57),(171,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dinamarca',NULL,3,57),(172,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,1,58),(173,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Djibouti',NULL,2,58),(174,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Yibuti',NULL,3,58),(175,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,1,59),(176,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominique',NULL,2,59),(177,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominica',NULL,3,59),(178,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Dominican Republic',NULL,1,60),(179,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'R√©publique dominicaine',NULL,2,60),(180,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Rep√∫blica Dominicana',NULL,3,60),(181,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,1,61),(182,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√âquateur',NULL,2,61),(183,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ecuador',NULL,3,61),(184,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egypt',NULL,1,62),(185,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√âgypte',NULL,2,62),(186,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Egipto',NULL,3,62),(187,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,1,63),(188,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Salvador',NULL,2,63),(189,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'El Salvador',NULL,3,63),(190,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Equatorial Guinea',NULL,1,64),(191,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guin√©e √©quatoriale',NULL,2,64),(192,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guinea Ecuatorial',NULL,3,64),(193,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,1,65),(194,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√ârythr√©e',NULL,2,65),(195,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Eritrea',NULL,3,65),(196,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,1,66),(197,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonie',NULL,2,66),(198,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Estonia',NULL,3,66),(199,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ethiopia',NULL,1,67),(200,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√âthiopie',NULL,2,67),(201,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Etiop√≠a',NULL,3,67),(202,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Falkland Islands',NULL,1,68),(203,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√éles Malouines',NULL,2,68),(204,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Malvinas',NULL,3,68),(205,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Faroe Islands',NULL,1,69),(206,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'√éles F√©ro√©',NULL,2,69),(207,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Islas Feroe',NULL,3,69),(208,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiji',NULL,1,70),(209,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fidji',NULL,2,70),(210,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Fiyi',NULL,3,70),(211,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finland',NULL,1,71),(212,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlande',NULL,2,71),(213,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Finlandia',NULL,3,71),(214,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,1,72),(215,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'France',NULL,2,72),(216,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Francia',NULL,3,72),(217,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Guiana',NULL,1,73),(218,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guyane fran√ßaise',NULL,2,73),(219,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Guayana Francesa',NULL,3,73),(220,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'French Polynesia',NULL,1,74),(221,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Polyn√©sie fran√ßaise',NULL,2,74),(222,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Polinesia Francesa',NULL,3,74),(223,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,1,75),(224,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gabon',NULL,2,75),(225,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gab√≥n',NULL,3,75),(226,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,1,76),(227,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambie',NULL,2,76),(228,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gambia',NULL,3,76),(229,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,1,77),(230,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'G√©orgie',NULL,2,77),(231,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Georgia',NULL,3,77),(232,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Germany',NULL,1,78),(233,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Allemagne',NULL,2,78),(234,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Alemania',NULL,3,78),(235,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,1,79),(236,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,2,79),(237,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Ghana',NULL,3,79),(238,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,1,80),(239,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,2,80),(240,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gibraltar',NULL,3,80),(241,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Greece',NULL,1,81),(242,'2023-05-17 03:35:21','2023-05-17 03:35:21',NULL,NULL,'Gr√®ce',NULL,2,81),(243,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grecia',NULL,3,81),(244,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Greenland',NULL,1,82),(245,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenland',NULL,2,82),(246,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Groenlandia',NULL,3,82),(247,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenada',NULL,1,83),(248,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Grenade',NULL,2,83),(249,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Granada',NULL,3,83),(250,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,1,84),(251,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadeloupe',NULL,2,84),(252,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guadalupe',NULL,3,84),(253,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,1,85),(254,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,2,85),(255,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guam',NULL,3,85),(256,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,1,86),(257,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,2,86),(258,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guatemala',NULL,3,86),(259,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernsey',NULL,1,87),(260,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,2,87),(261,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guernesey',NULL,3,87),(262,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,1,88),(263,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guin√©e',NULL,2,88),(264,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea',NULL,3,88),(265,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-Bissau',NULL,1,89),(266,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guin√©e-Bissau',NULL,2,89),(267,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guinea-Bis√°u',NULL,3,89),(268,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,1,90),(269,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,2,90),(270,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Guyana',NULL,3,90),(271,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Haiti',NULL,1,91),(272,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ha√Øti',NULL,2,91),(273,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hait√≠',NULL,3,91),(274,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Vatican City',NULL,1,92),(275,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'√âtat de la Cit√© du Vatican',NULL,2,92),(276,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ciudad del Vaticano',NULL,3,92),(277,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,1,93),(278,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,2,93),(279,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Honduras',NULL,3,93),(280,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hong Kong SAR China',NULL,1,94),(281,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'R.A.S. chinoise de Hong Kong',NULL,2,94),(282,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'RAE de Hong Kong (China)',NULL,3,94),(283,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hungary',NULL,1,95),(284,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hongrie',NULL,2,95),(285,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Hungr√≠a',NULL,3,95),(286,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iceland',NULL,1,96),(287,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islande',NULL,2,96),(288,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Islandia',NULL,3,96),(289,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,1,97),(290,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Inde',NULL,2,97),(291,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'India',NULL,3,97),(292,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,1,98),(293,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indon√©sie',NULL,2,98),(294,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Indonesia',NULL,3,98),(295,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,1,99),(296,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iran',NULL,2,99),(297,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ir√°n',NULL,3,99),(298,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Iraq',NULL,1,100),(299,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,2,100),(300,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irak',NULL,3,100),(301,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Ireland',NULL,1,101),(302,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlande',NULL,2,101),(303,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Irlanda',NULL,3,101),(304,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isle of Man',NULL,1,102),(305,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'√éle de Man',NULL,2,102),(306,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isla de Man',NULL,3,102),(307,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,1,103),(308,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Isra√´l',NULL,2,103),(309,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Israel',NULL,3,103),(310,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italy',NULL,1,104),(311,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italie',NULL,2,104),(312,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Italia',NULL,3,104),(313,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,1,105),(314,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jama√Øque',NULL,2,105),(315,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Jamaica',NULL,3,105),(316,'2023-05-17 03:35:22','2023-05-17 03:35:22',NULL,NULL,'Japan',NULL,1,106),(317,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Japon',NULL,2,106),(318,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jap√≥n',NULL,3,106),(319,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,1,107),(320,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,2,107),(321,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jersey',NULL,3,107),(322,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordan',NULL,1,108),(323,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordanie',NULL,2,108),(324,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Jordania',NULL,3,108),(325,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,1,109),(326,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazakhstan',NULL,2,109),(327,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kazajist√°n',NULL,3,109),(328,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,1,110),(329,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenya',NULL,2,110),(330,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kenia',NULL,3,110),(331,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,1,111),(332,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,2,111),(333,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kiribati',NULL,3,111),(334,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Korea',NULL,1,112),(335,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Cor√©e du Nord',NULL,2,112),(336,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Norte',NULL,3,112),(337,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'South Korea',NULL,1,113),(338,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Cor√©e du Sud',NULL,2,113),(339,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Corea del Sur',NULL,3,113),(340,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,1,114),(341,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kowe√Øt',NULL,2,114),(342,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kuwait',NULL,3,114),(343,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kyrgyzstan',NULL,1,115),(344,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kirghizstan',NULL,2,115),(345,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Kirguist√°n',NULL,3,115),(346,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,1,116),(347,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,2,116),(348,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Laos',NULL,3,116),(349,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Latvia',NULL,1,117),(350,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lettonie',NULL,2,117),(351,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Letonia',NULL,3,117),(352,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lebanon',NULL,1,118),(353,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liban',NULL,2,118),(354,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'L√≠bano',NULL,3,118),(355,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,1,119),(356,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesotho',NULL,2,119),(357,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lesoto',NULL,3,119),(358,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,1,120),(359,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,2,120),(360,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liberia',NULL,3,120),(361,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libya',NULL,1,121),(362,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libye',NULL,2,121),(363,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Libia',NULL,3,121),(364,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,1,122),(365,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,2,122),(366,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Liechtenstein',NULL,3,122),(367,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lithuania',NULL,1,123),(368,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituanie',NULL,2,123),(369,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Lituania',NULL,3,123),(370,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,1,124),(371,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxembourg',NULL,2,124),(372,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Luxemburgo',NULL,3,124),(373,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macao SAR China',NULL,1,125),(374,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'R.A.S. chinoise de Macao',NULL,2,125),(375,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'RAE de Macao (China)',NULL,3,125),(376,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'North Macedonia',NULL,1,126),(377,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mac√©doine du Nord',NULL,2,126),(378,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Macedonia del Norte',NULL,3,126),(379,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,1,127),(380,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,2,127),(381,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Madagascar',NULL,3,127),(382,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,1,128),(383,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malawi',NULL,2,128),(384,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaui',NULL,3,128),(385,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaysia',NULL,1,129),(386,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malaisie',NULL,2,129),(387,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malasia',NULL,3,129),(388,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,1,130),(389,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,2,130),(390,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mali',NULL,3,130),(391,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,1,131),(392,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malte',NULL,2,131),(393,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Malta',NULL,3,131),(394,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Marshall Islands',NULL,1,132),(395,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'√éles Marshall',NULL,2,132),(396,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Islas Marshall',NULL,3,132),(397,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,1,133),(398,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinique',NULL,2,133),(399,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Martinica',NULL,3,133),(400,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,1,134),(401,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritanie',NULL,2,134),(402,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritania',NULL,3,134),(403,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauritius',NULL,1,135),(404,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Maurice',NULL,2,135),(405,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mauricio',NULL,3,135),(406,'2023-05-17 03:35:23','2023-05-17 03:35:23',NULL,NULL,'Mayotte',NULL,1,136),(407,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,2,136),(408,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mayotte',NULL,3,136),(409,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexico',NULL,1,137),(410,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mexique',NULL,2,137),(411,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'M√©xico',NULL,3,137),(412,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,1,138),(413,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micron√©sie',NULL,2,138),(414,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Micronesia',NULL,3,138),(415,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldova',NULL,1,139),(416,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavie',NULL,2,139),(417,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Moldavia',NULL,3,139),(418,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,1,140),(419,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Monaco',NULL,2,140),(420,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'M√≥naco',NULL,3,140),(421,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,1,141),(422,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolie',NULL,2,141),(423,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mongolia',NULL,3,141),(424,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,1,142),(425,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mont√©n√©gro',NULL,2,142),(426,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montenegro',NULL,3,142),(427,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,1,143),(428,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,2,143),(429,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Montserrat',NULL,3,143),(430,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Morocco',NULL,1,144),(431,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Maroc',NULL,2,144),(432,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Marruecos',NULL,3,144),(433,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,1,145),(434,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,2,145),(435,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Mozambique',NULL,3,145),(436,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Burma)',NULL,1,146),(437,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmanie)',NULL,2,146),(438,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Myanmar (Birmania)',NULL,3,146),(439,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,1,147),(440,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibie',NULL,2,147),(441,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Namibia',NULL,3,147),(442,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,1,148),(443,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,2,148),(444,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nauru',NULL,3,148),(445,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,1,149),(446,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'N√©pal',NULL,2,149),(447,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nepal',NULL,3,149),(448,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Netherlands',NULL,1,150),(449,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pays-Bas',NULL,2,150),(450,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pa√≠ses Bajos',NULL,3,150),(451,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Caledonia',NULL,1,151),(452,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-Cal√©donie',NULL,2,151),(453,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Caledonia',NULL,3,151),(454,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'New Zealand',NULL,1,152),(455,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nouvelle-Z√©lande',NULL,2,152),(456,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nueva Zelanda',NULL,3,152),(457,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,1,153),(458,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,2,153),(459,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nicaragua',NULL,3,153),(460,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,1,154),(461,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niger',NULL,2,154),(462,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'N√≠ger',NULL,3,154),(463,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,1,155),(464,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,2,155),(465,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Nigeria',NULL,3,155),(466,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,1,156),(467,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,2,156),(468,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Niue',NULL,3,156),(469,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norfolk Island',NULL,1,157),(470,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'√éle Norfolk',NULL,2,157),(471,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Isla Norfolk',NULL,3,157),(472,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Northern Mariana Islands',NULL,1,158),(473,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'√éles Mariannes du Nord',NULL,2,158),(474,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Islas Marianas del Norte',NULL,3,158),(475,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norway',NULL,1,159),(476,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Norv√®ge',NULL,2,159),(477,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Noruega',NULL,3,159),(478,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,1,160),(479,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Oman',NULL,2,160),(480,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Om√°n',NULL,3,160),(481,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,1,161),(482,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakistan',NULL,2,161),(483,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Pakist√°n',NULL,3,161),(484,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palau',NULL,1,162),(485,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,2,162),(486,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palaos',NULL,3,162),(487,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Palestinian Territories',NULL,1,163),(488,'2023-05-17 03:35:24','2023-05-17 03:35:24',NULL,NULL,'Territoires palestiniens',NULL,2,163),(489,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Territorios Palestinos',NULL,3,163),(490,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,1,164),(491,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panama',NULL,2,164),(492,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Panam√°',NULL,3,164),(493,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papua New Guinea',NULL,1,165),(494,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Papouasie-Nouvelle-Guin√©e',NULL,2,165),(495,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pap√∫a Nueva Guinea',NULL,3,165),(496,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,1,166),(497,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,2,166),(498,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Paraguay',NULL,3,166),(499,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Peru',NULL,1,167),(500,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'P√©rou',NULL,2,167),(501,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Per√∫',NULL,3,167),(502,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,1,168),(503,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Philippines',NULL,2,168),(504,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Filipinas',NULL,3,168),(505,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pitcairn Islands',NULL,1,169),(506,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'√éles Pitcairn',NULL,2,169),(507,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Islas Pitcairn',NULL,3,169),(508,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Poland',NULL,1,170),(509,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Pologne',NULL,2,170),(510,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Polonia',NULL,3,170),(511,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,1,171),(512,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,2,171),(513,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Portugal',NULL,3,171),(514,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,1,172),(515,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Porto Rico',NULL,2,172),(516,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Puerto Rico',NULL,3,172),(517,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,1,173),(518,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Qatar',NULL,2,173),(519,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Catar',NULL,3,173),(520,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'R√©union',NULL,1,174),(521,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'La R√©union',NULL,2,174),(522,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Reuni√≥n',NULL,3,174),(523,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Romania',NULL,1,175),(524,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Roumanie',NULL,2,175),(525,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Ruman√≠a',NULL,3,175),(526,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russia',NULL,1,176),(527,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Russie',NULL,2,176),(528,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rusia',NULL,3,176),(529,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,1,177),(530,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Rwanda',NULL,2,177),(531,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Ruanda',NULL,3,177),(532,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Helena',NULL,1,178),(533,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-H√©l√®ne',NULL,2,178),(534,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa Elena',NULL,3,178),(535,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Kitts & Nevis',NULL,1,179),(536,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Christophe-et-Ni√©v√®s',NULL,2,179),(537,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Crist√≥bal y Nieves',NULL,3,179),(538,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Lucia',NULL,1,180),(539,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sainte-Lucie',NULL,2,180),(540,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santa Luc√≠a',NULL,3,180),(541,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Pierre & Miquelon',NULL,1,181),(542,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Pierre-et-Miquelon',NULL,2,181),(543,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Pedro y Miquel√≥n',NULL,3,181),(544,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'St. Vincent & Grenadines',NULL,1,182),(545,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Vincent-et-les Grenadines',NULL,2,182),(546,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Vicente y las Granadinas',NULL,3,182),(547,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,1,183),(548,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,2,183),(549,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Samoa',NULL,3,183),(550,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,1,184),(551,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saint-Marin',NULL,2,184),(552,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'San Marino',NULL,3,184),(553,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'S√£o Tom√© & Pr√≠ncipe',NULL,1,185),(554,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Sao Tom√©-et-Principe',NULL,2,185),(555,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Santo Tom√© y Pr√≠ncipe',NULL,3,185),(556,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Saudi Arabia',NULL,1,186),(557,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabie saoudite',NULL,2,186),(558,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Arabia Saud√≠',NULL,3,186),(559,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,1,187),(560,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'S√©n√©gal',NULL,2,187),(561,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Senegal',NULL,3,187),(562,'2023-05-17 03:35:25','2023-05-17 03:35:25',NULL,NULL,'Serbia',NULL,1,188),(563,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbie',NULL,2,188),(564,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Serbia',NULL,3,188),(565,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,1,189),(566,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,2,189),(567,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Seychelles',NULL,3,189),(568,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,1,190),(569,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leone',NULL,2,190),(570,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sierra Leona',NULL,3,190),(571,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapore',NULL,1,191),(572,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapour',NULL,2,191),(573,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Singapur',NULL,3,191),(574,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovakia',NULL,1,192),(575,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovaquie',NULL,2,192),(576,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovaquia',NULL,3,192),(577,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slovenia',NULL,1,193),(578,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Slov√©nie',NULL,2,193),(579,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eslovenia',NULL,3,193),(580,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Solomon Islands',NULL,1,194),(581,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'√éles Salomon',NULL,2,194),(582,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Islas Salom√≥n',NULL,3,194),(583,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,1,195),(584,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalie',NULL,2,195),(585,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Somalia',NULL,3,195),(586,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'South Africa',NULL,1,196),(587,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Afrique du Sud',NULL,2,196),(588,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sud√°frica',NULL,3,196),(589,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Spain',NULL,1,197),(590,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Espagne',NULL,2,197),(591,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Espa√±a',NULL,3,197),(592,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,1,198),(593,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,2,198),(594,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sri Lanka',NULL,3,198),(595,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sudan',NULL,1,199),(596,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Soudan',NULL,2,199),(597,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sud√°n',NULL,3,199),(598,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,1,200),(599,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suriname',NULL,2,200),(600,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Surinam',NULL,3,200),(601,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard & Jan Mayen',NULL,1,201),(602,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard et Jan Mayen',NULL,2,201),(603,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Svalbard y Jan Mayen',NULL,3,201),(604,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,1,202),(605,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Eswatini',NULL,2,202),(606,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Esuatini',NULL,3,202),(607,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Sweden',NULL,1,203),(608,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Su√®de',NULL,2,203),(609,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suecia',NULL,3,203),(610,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Switzerland',NULL,1,204),(611,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suisse',NULL,2,204),(612,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Suiza',NULL,3,204),(613,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syria',NULL,1,205),(614,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Syrie',NULL,2,205),(615,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Siria',NULL,3,205),(616,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taiwan',NULL,1,206),(617,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Ta√Øwan',NULL,2,206),(618,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Taiw√°n',NULL,3,206),(619,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tajikistan',NULL,1,207),(620,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tadjikistan',NULL,2,207),(621,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tayikist√°n',NULL,3,207),(622,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,1,208),(623,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzanie',NULL,2,208),(624,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tanzania',NULL,3,208),(625,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Thailand',NULL,1,209),(626,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tha√Ølande',NULL,2,209),(627,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tailandia',NULL,3,209),(628,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,1,210),(629,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor oriental',NULL,2,210),(630,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Timor-Leste',NULL,3,210),(631,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,1,211),(632,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,2,211),(633,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Togo',NULL,3,211),(634,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,1,212),(635,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,2,212),(636,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tokelau',NULL,3,212),(637,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,1,213),(638,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,2,213),(639,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Tonga',NULL,3,213),(640,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad & Tobago',NULL,1,214),(641,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinit√©-et-Tobago',NULL,2,214),(642,'2023-05-17 03:35:26','2023-05-17 03:35:26',NULL,NULL,'Trinidad y Tobago',NULL,3,214),(643,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisia',NULL,1,215),(644,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tunisie',NULL,2,215),(645,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'T√∫nez',NULL,3,215),(646,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkey',NULL,1,216),(647,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turquie',NULL,2,216),(648,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turqu√≠a',NULL,3,216),(649,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkmenistan',NULL,1,217),(650,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkm√©nistan',NULL,2,217),(651,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turkmenist√°n',NULL,3,217),(652,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Turks & Caicos Islands',NULL,1,218),(653,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√éles Turques-et-Ca√Øques',NULL,2,218),(654,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas Turcas y Caicos',NULL,3,218),(655,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,1,219),(656,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,2,219),(657,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Tuvalu',NULL,3,219),(658,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,1,220),(659,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ouganda',NULL,2,220),(660,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uganda',NULL,3,220),(661,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,1,221),(662,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ukraine',NULL,2,221),(663,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ucrania',NULL,3,221),(664,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Arab Emirates',NULL,1,222),(665,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√âmirats arabes unis',NULL,2,222),(666,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Emiratos √Årabes Unidos',NULL,3,222),(667,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United Kingdom',NULL,1,223),(668,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Royaume-Uni',NULL,2,223),(669,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Reino Unido',NULL,3,223),(670,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'United States',NULL,1,224),(671,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√âtats-Unis',NULL,2,224),(672,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Estados Unidos',NULL,3,224),(673,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Outlying Islands',NULL,1,225),(674,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√éles mineures √©loign√©es des √âtats-Unis',NULL,2,225),(675,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas menores alejadas de EE. UU.',NULL,3,225),(676,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,1,226),(677,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,2,226),(678,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uruguay',NULL,3,226),(679,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uzbekistan',NULL,1,227),(680,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Ouzb√©kistan',NULL,2,227),(681,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Uzbekist√°n',NULL,3,227),(682,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,1,228),(683,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,2,228),(684,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vanuatu',NULL,3,228),(685,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,1,229),(686,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,2,229),(687,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Venezuela',NULL,3,229),(688,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,1,230),(689,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vi√™t Nam',NULL,2,230),(690,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Vietnam',NULL,3,230),(691,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'British Virgin Islands',NULL,1,231),(692,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√éles Vierges britanniques',NULL,2,231),(693,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas V√≠rgenes Brit√°nicas',NULL,3,231),(694,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'U.S. Virgin Islands',NULL,1,232),(695,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'√éles Vierges des √âtats-Unis',NULL,2,232),(696,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Islas V√≠rgenes de EE. UU.',NULL,3,232),(697,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis & Futuna',NULL,1,233),(698,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis-et-Futuna',NULL,2,233),(699,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Wallis y Futuna',NULL,3,233),(700,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Western Sahara',NULL,1,234),(701,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Sahara occidental',NULL,2,234),(702,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'S√°hara Occidental',NULL,3,234),(703,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,1,235),(704,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Y√©men',NULL,2,235),(705,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Yemen',NULL,3,235),(706,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,1,236),(707,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambie',NULL,2,236),(708,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zambia',NULL,3,236),(709,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,1,237),(710,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabwe',NULL,2,237),(711,'2023-05-17 03:35:27','2023-05-17 03:35:27',NULL,NULL,'Zimbabue',NULL,3,237);
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
INSERT INTO `customer` VALUES (150,_binary '\0',NULL,'2023-06-02 06:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nd1long@gmail.com','LONG','M','LONG','nd1long@gmail.com','$2a$10$PZkJvjw3MeS3yPCEpG0N1ev2.vHfV67sYi8UGiQ3NOAQAbnJDvt.u',NULL,NULL),(200,_binary '\0',NULL,'2023-06-04 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ndlong28@gmail.com','Long',NULL,'Nguyen Duy','ndlong28@gmail.com','$2a$10$vf19FUZolHFtX1V.81FPgOjXauxSDVeBRwH795gTjQ61INyPS4Kn.',NULL,NULL),(250,_binary '\0',NULL,'2023-06-04 21:56:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n@gmail.com','Long',NULL,'Nguyen Duy','n@gmail.com','$2a$10$8QxgxJwxlNlE/0KbqMMhhef6ftxg4ARMo7yBdoxFdo6ougBta.5wO',NULL,NULL),(300,_binary '\0',NULL,'2023-06-04 22:03:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADFADFDA','Long',NULL,'Nguyen Duy','FADFADFDA','$2a$10$hrfjwSWQtN8OL2FAKP/gBuOjmryT.BKByi7/qybNUWfr5vVds7jAm',NULL,NULL),(301,_binary '\0',NULL,'2023-06-04 22:04:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADCFADFDA','Long',NULL,'Nguyen Duy','FADCFADFDA','$2a$10$8dV/0/dOBfhl2ZvjvXX//.U7kUIz1CCTQjLz2U0zj5pgFwqrBrg1W',NULL,NULL),(350,_binary '\0',NULL,'2023-06-04 22:29:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','Long',NULL,'Nguyen Duy','11','$2a$10$mVznvJeKC7lbq69pDOuAsekhHbgJ40Wgg6Y9mWoLNAw6wKL.jA1ga',NULL,NULL),(400,_binary '\0',NULL,'2023-06-05 07:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','LONG','M','LONG','2','$2a$10$py5v/xirBlHZFbaD1xYAceFagWlIiTIJV.GIACMH0R1pgUbW1DKuO',NULL,NULL),(450,_binary '\0',NULL,'2023-06-05 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2h','LONG','M','LONG','2h','$2a$10$xzNuMCgmsigbIE5QNqFu3eFpzfcsEH1Ob79.60xXQH0jtIgP/qv9W',NULL,NULL),(451,_binary '\0',NULL,'2023-06-05 20:33:58',NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-13 00:00:00','23h','Nguy·ªÖn D≈©y f','M','Long f','23h','$2a$10$uvxF0aciYoSf/hN9JPqhCO2bn8ekEHbHArkg/yeV3R2TZy0kuwoSW',NULL,'0379755079'),(500,_binary '\0',NULL,'2023-06-05 20:40:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'long','Long',NULL,'Nguyen Duy','long','$2a$10$gINxxwKvs7am5uA4dwdOtO33633u1n8Sj3FvLya3mSp.6fvNcrJly',NULL,NULL);
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
INSERT INTO `cv` VALUES ('92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Th√¥n K·ª≥ T√¢n, x√£ ƒê·ª©c L·ª£i f','Senior Intern Javaf',451,'nnn');
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
INSERT INTO `cv_skill` VALUES ('dc87cb8c-0ebe-4a9c-808f-0dce35e54bf3','Khong dc√≥',999,'Skill test da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e',12);
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
INSERT INTO `district_description` VALUES (1,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 1',1),(2,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 2',1),(3,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 3',1),(4,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 4',1),(5,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 5',1),(6,'2023-05-15 22:11:28','2023-05-15 22:11:28',NULL,'Qu·∫≠n 6',1),(7,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 7',1),(8,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 8',1),(9,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 9',1),(10,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 10',1),(11,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 11',1),(12,'2023-05-15 22:12:28','2023-05-15 22:12:28',NULL,'Qu·∫≠n 12',1),(13,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'B√¨nh Th·∫°nh',1),(14,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'G√≤ V·∫•p',1),(15,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Ph√∫ Nhu·∫≠n',1),(16,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'T√¢n B√¨nh',1),(17,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'T√¢n Ph√∫',1),(18,'2023-05-15 22:13:16','2023-05-15 22:13:16',NULL,'Th·ªß ƒê·ª©c',1),(19,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'B√¨nh T√¢n',1),(20,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'C·ªß Chi',1),(21,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'H√≥c M√¥n',1),(22,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'Nh√† B√®',1),(23,'2023-05-15 22:13:45','2023-05-15 22:13:45',NULL,'C·∫ßn Gi·ªù',1);
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
INSERT INTO `education` VALUES ('f4eba01f-f819-4152-8b95-a1aae1ae4377',NULL,_binary '\0','H·ªçc sinh ch·ª© g√¨ n·ªØaf','Tr∆∞·ªùng THPT S·ªë 2 M·ªô ƒê·ª©cf da update','2023-11-02 00:00:00','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Tao l√† tr√πm tr∆∞·ªùng m c√≥ √Ω ki·∫øn g√¨ ko');
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
INSERT INTO `english_level` VALUES (1,NULL,NULL,NULL,'LV0','Kh√¥ng bi·∫øt'),(2,NULL,NULL,NULL,'LV1','ƒê·ªçc hi·ªÉu c∆° b·∫£n'),(3,NULL,NULL,NULL,'LV2','Giao ti·∫øp t·ªët'),(4,NULL,NULL,NULL,'LV3','Th√†nh th·∫°o c√°c k·ªπ nƒÉng');
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
INSERT INTO `experience_description` VALUES (1,'none-ex','Ch∆∞a c√≥ kinh nghi·ªám',NULL,NULL,NULL),(2,'less6','√çt h∆°n 6 th√°ng',NULL,NULL,NULL),(4,'m1y','H∆°n m·ªôt nƒÉm',NULL,NULL,NULL),(6,'kinhnghiemtest','Kinh nghi·ªám test',NULL,NULL,NULL),(7,'kinhnghiemtest','Kinh nghi·ªám test',NULL,NULL,NULL);
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
INSERT INTO `location_description` VALUES (1,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(2,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(3,NULL,NULL,NULL,NULL,1,1,1),(4,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(6,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(7,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(8,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(9,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(10,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(11,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(12,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(13,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1),(14,'th√¥n k·ª≥ t√¢n',NULL,NULL,NULL,1,1,1);
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
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2023-05-17',NULL,NULL,_binary '','IN','contact@shopizer.com','december','1234 Street address','My city','Shopizer','888-888-8888','H2H-2H2',NULL,_binary '\0','LB',37,105,1,NULL,9,NULL),(2,NULL,'2023-06-18 22:23:54','ndlong@gmail.com','nhahangmoi',NULL,_binary '\0',NULL,'2023-06-18',NULL,NULL,_binary '\0','IN','luanluong@gmail.com',NULL,'ƒê∆∞·ªùng T√¥ Vƒ©nh L·ª£i, ph∆∞·ªùng Ho√†ng Hoa Th√°m, qu·∫≠n 11','Th√†nh Ph·ªë Qu·∫£ng Ng√£i','C√¥ng ty tr√°ch nhi·ªám h·ªØu h·∫°n ƒÉn kh√¥ng n√≥i c√≥','0379777722','84',NULL,_binary '\0','LB',37,81,NULL,NULL,9,_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0 \0\0r\0\0\0à±6\Ï\0\0\0sRGB\0Æ\Œ\È\0\0SutEXtmxfile\03cU2FsdtGVkX129xZeeesbFzHh5QKlBLKznlYWtoHdeROk9Rd6p5A%3DZ8nPJLP5xvaLIVoa9eaaD2WysOIsLv1DcK5VYvPyBKMjeE2LPNGlSAGkNbQGCkC96wS6X0a78qlhk%2B6G4%2FbYvauSPrVR%2F8VcxXeq6z4KRDQODIYXbpT1P7NMh2Mp6%2BLu7juHVCUOZVh7BZZcmgnZnUXvMD2p%2FtG5UjF7USKoknSRLe6gkgE8QFrv65Y5DNZw6wn7iHKdB%2FWVsDC7%2BnnSlHpMu96RvYUwvSEseU3n60i1qecw%2FtaYa%2Bk%2BNQ%2FVPZLjOWXAPcpQfwAIG5aJCx%2BTM8WxMmLuK2QyXQgTz7n6ZRfbOYsR4NAJPh50xWdcL1I%2Bn5devAaABCnp4l8pG8xsefkBeQr9ev5XMqs1bLR5GFzBtRQzrpzyTAXXOazI%2Fk%2FavQ5r9wTK3pyNlndZFDHtLiKxZAy%2FF8xwilcCtGS5D%2FWAqxoFXX%2BeLZGgOTwq8Z6ezP6PiVGScKiO3N6V5KgG%2FZLOvJR4zGM8V7vQiOf%2FaKkICUiCQ50Y7DKTVqsu1j7NJ80RRR47eLiwc3wGsVOp20sZoJ2uRETgGVuC38BqDv1MiVPWJIZd9iB%2FE6nDT24MVS%2BLcbHHFgoWhKCHv%2BvbzTji9x7fI9Ad%2BiDQ66az1OGnKZtUWNS5nspfKye2wi7%2BulgffgzGtyP8ilYbVUTsaq9SOGrf6U4rOy19xX6LLaJ8tsdbmZUBbZnnM2ewpF%2BsgSFIQwY0JuiZvD6imHthk4lGmTSfSg9ReVhFaeZQzHFY4lvQ7Zgbza%2BTQ%2BJti8EQaxGonuOZ7d8PdqdKsKhMm5VD3DeKN2Zqyzjv%2FKDLVE6o8D3HPn0T5n5JOvBuCzOTDPzIFhbTO%2FU590gOqgzZhrIGzOT0gtBlNAup5tFFdcfSAKyH%2BOnpkjkxzKxxGrQgjgMj8nnLAQGvOcmMG4U6WwDRsWE6mbs7ZyDTu%2F%2FTtoR1jxU0Uju6O05YKxeFfjV1x%2BtN7153MN5QVpOP2Bm8CYgZcytkCLXXCH5Q22hiCIXhnnX%2FgXPG9JMVdFGR%2Fwls4klbSpUEWfgO%2FaHzDhhA3Eit92%2B1vIfGrneuziQzqjSzIh8FDIj%2FfLQ5gBr5xhL8xjiHEU8Otx4w%2FHC7AHCeGRfr4x2D1z58K7wtqxLJAUw%2FxNALwByraNMk1vChvXZ3kT8qZc4INFPpLkjzqCLp6CTh8P%2BQDRk9m4suXQ%2FQRYbfLnfby7qrSIQs1b2m4jDK7Uu%2FGU6biFitVT1boW5MerHRYWoyW6TZCqEhLuJFxI7aJeWdiQLZKjdvR5viawyNPuIvCFGiQQP9HXsc9xdGHKDenVZcjeU3fB6hVwygi50RotWgxtyQgm6QcrwbuDcDIWVZhxSuYKLtXQaYZ5RhefWGZFhaTm0b4IAvmhah6EWnkSn0LeWbvGG358IQC9%2B%2FiI7kbcrgq1i793IcnjsIlncb2yxMSdOs26%2B03s155yM2Hr68FzV45wXMERW2YdZWLVa2Ivacpecz292HZWdkkuYha0tNJxxEyvUKlWiavwPOXg5B1lcBrQc4XPP6Qw1nsR5tjc9YwScRqnNBYX%2Ffw0lVcnKwLAp3l4891egcuZqk4OI3z9yIwLNcNeoIAkGCOCYAfkXPXhWQ%2BpakRFKg3tinaW6%2FHZzXXM2%2BKADE8g42u5MoeP11PLsHVR6zVNDZx82tVRYQP4Ak5%2F9n%2BW9xy9N2jzAC8pc%2FGSBF0UhmcR8%2BhVRMpGayc%2FiPs4fKo1fIKRs8CRlMi9JqaDzOm3ghR8Ypo%2BSh6qf2XSOaDTbbIUBF74Gtvj%2B0fTQTSBe%2BfprbzdXYt6hZQPr5SgNrC1CR4RLjd%2F4hJZcvfPYMCh3oGudm8HD8zm%2FydBg5a9t7Kq3Qad9qvsYtuLmJfV%2FoN3fH3%2F2OBwlPOsPg28V4L1u9C7FfX4emY2b3LJzlyavpcVtycAfFAcdbSxswA9elFSzzOTJ7VWF%2BOZ9XkAgk4TAoR2uXgAqUoTzgmewwrccdDA7cLq7hTabG67sM54DZvHQF8d7om1QGWPK4Z%2Fx%2FfKgq5hoZeDLPk6e%2B2%2BuawgCvmKgheiiHHkwSzX4BKVIwa8u1vhWFYz7pIsde7FyrXMMz7kvG5tDQ99TEUrv2K1qUtIb1n3JRM4i0D3oBzTsjlC1neEvCvTl%2FtMrzzJpPGRQrlucxlIXkkQftDgnCvd%2Fb1aMZHo5Y3vaGEzhUgefu2DCCtsgvV49j8oVF736GSksc1%2BmBkwdQ578UGQERN9T2bdCW3pLrspMu6O5kYqDmQW6t7PYXCWPvolFyYtmqED47bWKB%2BbbuGkIrbn2qE6r%2F33YqUUBBoyAF8GJbw5%2FH2DUDgFMwyEbVY4gLd1dZwZZikUJeu5T%2FfO2qHzLStD%2B7bmVv%2BJJsVFHfRWN86OTWRqslfSZpeS34sXwg3GP6qC4t0m0S4ZAue4dhviSfjeWj8YDuoI%2BsRMdgkqWPr89P8ffDa9JnszetFGpdIHkfGSw%2FlEdAzeq2TyShD8DoyfF0FD6IxcN9tMwKzNFFo9cCDFQUE4FG8xx%2Bz9R3rN0WFtPDgID%2BxRn2m2LaDvSwOsavCBc1f6d5pIkiCEk3FlIOLmZxmcJ5zC3EJZ%2Firr3G7NmG68bUCFFPktk0sftXpsPoxcrk6YRpLhBu6KYrSHosWilmkpvMLBLIv6KwSSRfOiAJGKzyMpEDPaxzW20XrLdQljrJKaeRMtlS0ASif%2BEkC0agj%2FDjiYwUblzGKkkCGAx2kaxWbfuDZLRPHRcsvrd%2FRs2LwLggnDu0oXnI7Je7oFDbsgJ1kHSikkTPBPM16mDnn%2B29O68HlnaQg6LvFQjbNVEDWgehnkJDb4yiFEnVbbMhlNpmwKAmMbyS3kKEI0gHTfeDpWVVq6lebYTzrFQrXaPvr8%2BCySjCivgD6L%2FJmCTC1om0ujjuNhwv6EwBzFPSgiH8hRDOCehp8fzgfCRTKwC%2BMcSES0r%2BRlkZaKA0vw9LNEvekcLzzOSjF5aYEbkvekMR65fpmj%2B1rQKqFdymwBVQdqz%2BFf%2FUoSF4%2BQpxbA%2FW7C15kd8Rub473R5O%2F43ah9HxU1VTVKaV7hvWCwVgNv%2B%2Fi7YvqSqjIO33WHoBYsdZSGmnNAxd7vJN22sMAnHMtDmnG335hliIxOnq02lnFqVTBBlwpS9i5yibBb%2BAMQs6mSOn28LwHcGXXBVIWkShRcBdrBnNu7QmbCheiAyHELxwSyMoD0n1L5u5TqIf3tvQEoTWCB%2F7Iz65L%2FjP%2BIn254QpCiRc%2BpZB3rwnf6QldEKeEHwQx1rsYHyrxx5sZqyf6hf7NtplkJc1%2BClOUhnrKMhGr15ZkwUKHqp7FCvzjlLten5tZpOzOZwouNrs%2FAdZfxkVYtWZr9Tb5jUgFRlCTwRyNAJt5irFRTzBjjskoytXpMP5V6ABdv23QFLXYgE425QAqmhBn1k2t4MGzPp4FIDtV4CF41ySif6whKX%2Bm9nj1A0eOJUzXsG0QsGysswWLdK5d48ixexvQWG5eGTsmeN%2BXAAdsyLlW5%2Fj7pE%2FCvKuIKlrNSX6s%2FHhmm9H7d8ttIuwetFbKrGtxsEOmk0WtRbmhairaJW1Eev14ppLp2UD1VdEYCepP6UJu8SsKz6q6IE5ECC2Ln4gFi8f0eeS0r9oUF%2BBWiLyQJc1VmBYCNq32PvpEoTslNxpyzkWsl2hZqzjCMT2gJGK6TaDKJEj3YK%2BbL3q%2Bii6idyBGOej789qDfc0jlXFBmkogRC03jJJVT2WpltvlJ6jTlRY%2B3qV%2Fg6fHPHHtF4flBgl79P2d%2BJy%2BmgZwoODKItmnK%2FmHHWs%2BKIP9D6Fhc63MID3b6rE51IClselDn0EsqmbMqiMZFVYTjN6r3voEtIllsCJyetZ0ZJMW0ChpQXzf%2FZN8GZnW2O1Krzi9ipcy2DoPjbYyKEG0auGSGS9MVguVHaCVdptCkH8jThdE9TmzYfMwU7QOobcb0eoSxIMettB2BN9Cillnc0VF7mqkGCIaqrNF95u23XjfiB9hngGXwQXHgA9ZJUIj44kr15AJWqvOWRkhfRyzaBCD5U%2Baot%2BJ9btPvUbXRgRyzZX%2BBwzR6%2BwDPWehxxgINbEld0jp6VYSqq%2BmVOdAEbQvo3aT5XkEzMiaeUs2210olMDyTd6U%2FCh1eA%2BlCHngH9qNKovc8ShM8S78j%2FPSeA2N%2F9TeGM5xRCRkjSAr09iKGTMV0hX3boihY4nYKfoIF7TwnB1l8kXAlSTsy1OosXNl38S3DoW19W%2FWsx6SsQEptMNlCbnkVmRmPx7EEyxmNUZQZVBphts23xQBZ9n8nkxdGLVS%2BMHsOihGmegvRK%2Bc6I1h%2FRHNEMrLa0wKFymMh0x1oDuxlApkNdG8oQTmDyWQJyYJ9M11dbC7R%2F7Ac80rmofOJ97m4yxCFTh4nXIyVX5%2BeCmGSxh6qw4OHclTA7WPQG3QBPZjkutvSsa2ZgR8jqh%2BBUg%2B2YK6JTw79dObrqzWoQejISevtLXTVeDOMLo3NgXJ9e6XG8axMpSoYo%2BUiw3NGU9KKEFMdG64LtnLMK6NilIkCQOuNqgBEbkHhBvPdMGXforIKgg4l3TdB%2FLUo9azSBoJD695Nybm%2BLfDqCK1LTHoplr5lwcQZqkEuB%2BLQmXYzH4q%2BjLh%2B4Q%2BSwhCivCmqbEzQ%2B3jHqvbMwBRnrWbSaGwtuqbzsnfB6dei0WgDLCQ2sA7Z%2BrKDMNPzacxI6NN7CKcVhBaZHWlSa%2BUnT%2F82VC2UAFkVlRg49TW1sUr%2BbdI%2BKa14ZEWzbKlzaGuJlwWzisEhzX3pAe8wcZEtZQ9HV9EqtvZyfPGltv7knyL3NIqESeCc%2FyUmHVzhtkMWcP1dg0Lc2XfTLXBqwKqxfczj%2FdIMT6Be5OeRvKvIW8un%2FlpHs3x1Jxd7%2BiAukX6J7xrKWYOIRZjTvarIgNLjx1RsUahjpGu6jC%2B0rbnXpkxKOnl9%2Fbjjv9uDXrxogurEn5xi6qSfapFwbvgZSSnr9QUne2uen8sQSYiW2v6MXRQeTSmrRkPeiqVL1UtETOuHDDIH2Z%2BicHPmLNDFNUnZDyCwvRRKzecsOIukY2Yrn0vsc9nvjv51EV%2B3WGkyMfcKFrcPlra%2F8GFFbwEhppuPa7DE%2FsyGrRPDYVALOnBWa%2B%2BCWQPF3nVTqz56QxESmGrp7aRqhpuRdCioXDb3HnwWHRfL8pXLAS8mLXCixnMHY76XKKeZx7zlC5WzhdX0l0MTSe6zBxkAQHI5bZHFmO%2Fw0PVNz1yRCtWXiDhEgUgvWH%2FBNo1BK%2BTL2HMHPIXEBGClPZsXNUJnYN6O1emjPIXoGe021vvLoq5Lg%2BLvlLSqBkfSJ13qRnpL5ISWyE8bvxUT8Sp8PrEkznbW1Y%2FA8DJ4bYKmEsJCwO35eH1%2F17Rb55YrL%2FfjM1%2BQrdWu0qbWFMtUavy2AxKWLbhgc78ZxysSbZpijTpPSiWQ6%2BfW424wltS7LkIj%2FLLEQvudE9NeVFasytMHzyuEgLPQW6fNVS3fWiUpXtTQVxOXscagqz3zg5nAcWhDvF5DEekeBmj0PJ1Ru2AiCzKkoFV8cudych19uHUzUWQv0uAWOsI9wSrZiBbr6%2ByTP9ciJ%2FGtegElfnX5po%2BcbaturTxLCV1hXMT6UETYLJ2GT6%2BGZN%2B%2B6Pc%2F%2BoDGUd5s5fxT5D2cOhu89tYQjIv%2BaeP8KEVC0q6ErGkivrSfRXqz54DDgM3DvOIlNZDVLznG9WWyiphvTRLyTrhoVpjizEDdaL0XUjO%2BYKkxJv8Q%2FhrHtgz943l9fK4fZ5ZqsQT2HcYlTrhlpgYxTDeJxgSLBCwlZsfZpTqcbQ9zotD8mnz18jumVGxeXNxIhYlhA4XNk8POC0rd9bPwgV8ap3pJhGJ0Oh8taJQa%2BbBil46k4iem3xuZhhyK8ZEr99Bjk96OUnbpuqeZ7Rr2SgkJn3zpMvg1KwiJTzn%2BDOLIKATxx8BnuGfztVp0%2B%2BU4TW3tWgy%2Bk90%2F%2Bn2p9e2c9tNVkmD7pn9nLhgsw7pXNMoaRepx5ZOKxWHj4NQZcWcUcwoRHl5I8CCEjiYPubOR98pMEGtXw%2Fen4B%2FvZmdK0%2B8b8rA%2FIIydGfmUHxePtzk0RXg6nXUb86gfkUq6z0x36%2FRnJVglkFfDDhnQb9lke0LXltuAcZEwgGCMsMqkOzB1Kx9Faog0GlFHz2fzMO8XZTXwslHon%2F8ryk5Mr3TX2V3wQMerocL7Evp5r9N7oV7W631m5NVGe9JN15sJ9pRraTDU7%2FpVDn1QuMQM%2B%2B6FRIAPTvqjot8XLzi46DI0GFRueqvW60QFfX%2FAxBdCQr1VkNY%2Bbx4cL%2FX1ZGv%2BxJK78LzA60qS%2BbUcLsvQ%2FPYL7%2BU%2F1UwSmOspPKLEARfE1s6xbmHSJ7AyPRDSNRHPeF3%2FmQn6WZur%2Fx74GTZpdcPFoNjInl4GA3CYaDAM0vvcsosURR4NR2%2FrmdpKGUgnxMbda2h6peUu%2F6ooi03b4xPbB8YnY%2FVkg5jZmFpX9Ugj8UulFXX%2Bd8sqfmIh05HwayvPHgAFnozK9MwWHCwJmrXpJ9h0YePpRdac5fz59Iuoi19lIdl4ablYZrkvicYB0ob0a9Lpnj6y4NsiGgSB%2BHOoeWNWfn4WQnoBctJfkIhB6QXw3e0%2Fn%2B4X1VaYi90dztx92Frn10Mv%2FiAFYzpXS28%2BcYFGzwfxVDQMvuE62T4tUuwFu%2FR511qmE5XiHIZODvsG180JimHOYps%2FPufBTpzAsbZG2lNfzCYm6SwVTE%2BaRWPDV8bfHaLpbY6eY5ug0nVjCl7ziqXwS0tYgDkKOOFK9IIlH5zIid3ydyzL5pVcJeXBiwF3yLFDnxsh9GDIHKII9LvDRMLvr0%2Fi6V2WBf9SKFc0as9qF58wFz5IHXHnFkjbmwGbWoSbIg3vQKQa%2BUCfrORNnySEajPUkVNObuBICvZZKmnvuoDk2WKkstI43QPkwyUVEGfgP73XytAx%2FFmhQhJFhsuFFYxUKNIBV8Qp6fwrBYeoo15OWHeSo9IIkoxRvOn3fsCFaiQm50TZIJTnJyK3Y7U0ZE%2BHq%2FS750sYsDwv1jWYv%2Fj1zOIiQ5nI85T9QyD6%2BMBUuzPmCcLPOSmnrkMVKPiWSCQAtSbeNRLRrPWd%2FbIdTpBUNvSATU4SqtNg0U%2BbTO1AP0%2Fz1EBYe0%2BgDXom5I2yLx0LTwBuvEGfSGTabe%2F8QTXj9cL1flAXT5%2FIWA7GkEAJSNaGtkO1WsDmnRfnMEbvqr7y%2FVvflfNiDVz8xRyZbAejd%2FyAbdSMf637sOgbXHB6GmvjkiwkND91XHh11RD273lNXifoos4qgAlioPPb6TnC4pg7bVY%2FLCaaIq4MWI9XZ3Kr1qRU5bhy0iIDYpg30yeuw89WbkFTkRL%2B2Xy3JI10AiGK1MUxZhxSmGfboAUEIq44aY8ZGHooCX14g301DASAUEpHDiEH%2Bc47t4zmOrFJoMuz2deUqlLERrxy%2BSIQejeHCSgQQmACrl2uTCMrqng1fXho1NSkn6pBnZoNO5C3eVF8d6gQDeIXsa2okl8M8I2jgPr8H5XvqUYEYQCEkW0xj%2B%2BUzB40lyDT0qNS08yDBquuGPCSS3Zulxuo5j9Oen1F9dupbcGv7ZeN0BLUkxUYiMU35x6Fs5C2Sz%2FaHiE57Vtbusw2AY9aRU%2Ba9DEbieV%2BkzL%2B7KzExzQCqjSB9d5H4vxSmVpx2OLSGWtzo9CPtqPuWic7S0nTBgJ5Nw3oto5jqJzGNbX2cUGic3oKEhB6goOLSUpXg7Y16YUMa2aTCCbXmeZIdk%2FgrCv6wvsWf6U7gI4g0b9ZGaeGkNuVnB04klekKrUIfv%2FDMIcQQNp6%2BMPeOD3NVNibBf%2F7y91RLhluRYeBghMwhxgtAo4UZilUO1pQib7IO%2FhBRBX8r2NMWIChQgqXyhFWcHL4PP%2FJkDAVu%2BZ68ysGXTOFzDIAQAKjzK3mtTqEWy9MQQCwKmr8aBtVtF1i23C2D2CuMjVeD650%2Bh0ehuN%2Byd%2B%2FsANScUAByxDll0XniP4Q9sFnaavWIQLtMAUoHHe77xV3%2B1QOcCl4F0wOKjZtqmTLgDmKEE8944cs6FFbDZzGHfWAcWyjk%2FX1zew5fYjELa6zSl5uhUv4N9kLMDmXcwfwt1BON0iu2MUCdONUy9CyQDxor5SRtPulfrQDvKpTz4UIf%2FTN%2BdT%2F%2FtZcEpFD3Y3WOiNUMnfnFjYCQAC%2Ffljnqplg%2FqlUKoFzm9Tk1LM2vscBr1Y5X5qv6SaRtDjs0so%2BsfKJT6CHdtxtCkBfrXWRXVwi0ii26zvKy6ADFzZG47O%2F9HUqt15r6K5rk7bpwboJLYMfMrF3tbLrpEU1oNGHmgTLILq4IZ0vzEtCjwAN3fvbh%2FRyN50wEsdD7C7mljLlqsxQl6CO3zkVx0sR2yTeWYxkUSK6pQZ2fTSpdEd8uPqGBk7W9amHVnGPQzWA%2B06fwQORwOZVcdv8ygE%2Bwy2im6YU3RMIBBB%2FYrPmcd8YPuLLvQGUHPt0RDYbTfI4fhIVrlhrZEvgYeHtOYFJsk0ynym0N%2BYU1q8KB05yt3XM4P%2BHzDeNfc04vaT8aJ40HbSwrEJZ1eAb7%2Bhq4386akU4jRdfuLak%2FojpQP5f4yyfWLb8cAX5aUkafWagw3TxGDaOA37KiitaEZgS%2FqsTVLlnTZi4bTd4sKIAK0mEy6efnEs2KCF1TRSFM4vMhZtgbMkLNAkPfRxg1eRJfFE%2BnESX9aFgwPJhafhwLPA9MRWVf62M41apd3WHpgnvuSnB7H2LE1DXuXWYwYRfUn3ALYPDmf6IXW6UDCG4YVUzp1dQoCu3SynJZFp0geEOFbY9mCQJN03JKdMDthKxzIu8RFvQjotdOi51%2FnulVgQW0VVnacM3n0rQ9%2BPJuh6In2xD99mFyJiDQ7e2nACgMF5uCcqwgDO3c60DRAgLptWlRdmQDfTydMjlxWC8U4fubMmZIx8HhOUia8oCu37cjkqhpazPPsWPekyNcN2hTDCcxJ72e8E63coZ6jWtHe3DGrHjwOw7xdsSEFbcA4XakV4emmHc1cDjH6MB4Yb%2Bs%2F0LFy0C1VgkqvfZhksnPMoh%2FiUDJvH9wF6xfCz20f9dLDBe4FwJfDTHEdRc5ZxCVMEUnSMhFiQyeiNbLDIhgguS1vJ9WbD0hyBeB4g54T7hK2Ql4cBMCcS%2F0ggUXIDH%2Bxixa2Kkwi12rsHh%2B%2BKoMe5FFpkMk8MkP8XDzD46nq4c%2B2QUi5zmBE9ocI%2Ftp7jOBZZC7wwgQDkFaETjfU7t%2FJQnjPoXZTZgDvYS7eMz3SOgfcG7Q1akz1kbU9QYMgNnXrY5jenhUQNQqFHTZoMfZFeG1C%2Fp8o7388ZOMsiBggUyQ%2FZSCKzPP5aUhHfinl9K0PixQqoFNkNFmS1U8kqixNKq80QxgfkgrogUbuLMzWKaePrDnGAumQ%2BQnTH7S9T2Hv%2FgbxbXwMFbyzZ3GTdus9dWoKz3BzQFSxOzmBq%2FIXOX3GcIeQogibLidhAtVmQMvH8FRN4ZRhwEctVRxF6L6Odr63cgQQQWln9lz3FhXeTGfh%2B0Zt3JWr4DrUW%2BSOpzi1aV4wi1qH%2BxS9uwrf7sErwa4EKOhgy%2F05rbHyiJlmitrZIqe04Wd4mNTa3T0merN9Z%2FXFe%2BPSZvfO%2FvVL4%2Bm9VMVU8EMkvjd2aXPZBeTnj76iarOrzFnsli%2FLQbERlnr94QBk9Vacmnrg57WnDWriGYe8A4SrQ%2BkDoSkT5Osdf0XY%2Byb1tHkdN5BCnDJO6Mcerq3Fgtp%2F17pHNa%2BLSibqKqbkinY52yyEevF70Uz5tfUD7JGEEAJSkXUHf3yExClaJLiuuza4ky5RgwhiFoum0C%2BeaozJ3xG2wJn2c2qD6PJCABPvw1HPKidl%2FZI64u3qez%2Fzqx4Qm47LQzwFM4zxywXWMfVRMUwISOp7OD7JjZlaw%2FddvX3%2B8DDRGX2X0suDR81aQJr4EVULxUirYNmQ97o6CpoIiTUT6oP%2BB9gXgRggTzU8lBjJDYg31QXzsITFo64r445c5p9emeOP47dPvgskO14Lo7hDDi0wg55wOvkzZOgEeHM8MwThLBdbe7B%2BkmI9aAWoYEIvishhDr28JlGmDO7hB913AJYw0oU98TDKk%2BoBraza%2Fo0P6UO8GZkPf77sOZCY4ju0ySm3rP7ah4AAF7CCFj94g%2F7OrD66I8dkMjw%2FYJKvhpilPVn6Ukyl6U%2F9CzUX59O1eZVSzcvfv22CsuyS%2BOuyViPWiCoydZZG70lHkMi3i6hbp8MopEoSc7E2DgxNMVrUcJnBC9ujNc1pLQQXvsoAgdPelDnq7AfVJ9Dh2Dwl5rDuBO%2BUWunotEpBZ0IQzVMXQxZQDahZS0690ibzvYH4yJh9KYL60J2Bn9qGtUBo0TfzQwL29sFi9jz131i8b6PBuNP70wlgxNPJGyt0iaXkAO6k%2BHHsa108oUqGUgFBh%2BCWxtw4bTIgD%2F%2FbGFT1vtzpQ51ND0R1H0ys5RR5eOzDWLOyzPP2MfDUz9G4GAekkCU4pCv4cZEZ6k1nUoYzxJoD2vfkir4flNt7Yc2Zfs3NBNytFfS%2B1erFnYekhZG6JSdiuWFspcEsxHAFafAu6AIwYVKXUzAnP9DfqBpTYp1z3ibtzJ%2F%2Fx2UjQDlrF3yc4VYHYeWXOa2lJDchSeDVI6alE5rJtaykHyC%2Bj3vettzs9Wi0JKKYf6gfumpIi6lf0h8qW39WaMLXVvQWcJxWUXf7gvkoGmeJmYv6biR7E8TdhnnOtbH5uGyzGH%2F7XyLLF6sCDuwTiEdkuORlaMgBFBErCnH3oRPlCVqvYaiuCjTsos0ZcwtQVt5B94WaJBwsr5lmkOhIeNnARIIw1pJ%2B6BPhB2wj8zVFjPnHAI5aZrWMijjCTYn%2BNfes7%2Bls%2B%2Fhc9PZkv2%2FRAG6u48AeadNe0rAhxJEtS8WrafYuTOVddfSAaqejkHq%2FaO4c25NTZSdssuiS%2Fdo%2FQxlGucg5vkw6wkL40j%2FPJ%2B279JGEVju1wuz9gDKKnOhuAUFBGkOPM%2FbAcRGr1CU%2FY2Y7%2BTLublrmQ9ki1MtxZnqF3o8Y8Ps8pDN5ipu62w4L7vWvn3h7Lgvi8i3x6KbMe%2FOsO6lGmp0gK3r%2BJDzWnDFJ1Dvt8o%2FqpC5pEmcstH3eyow8ZEiO2Lsm2B%2B7ZwX1XjTvA1CH47hYDxX3%2FIo2YsZ6qhZOXdIUWYtmP3jMzoXd6NB%2BYFRUD4Lyda994BheSaUoEBSAM170k3E4IKs01CarnGi12gf6pewx8TJVPvboKRYYn26OLYrxstG2su635nLYjE%2FqMS%2FENgCLG8xWgjNbrbhsxEfe2bfB9vFrtqTRoUV3fm22ECFRRuC0V%2BbYpQ36Wq8G%2BNna7Qyd6Xaxx2kYr3faj2VG86YZvp7I1LP%2BwxU1S4ymnnMuVngInwNOgxq36KneKDEBKBv8GHH8fiEG6OlZR47T0BhS%2Bh49fKg1Opt%2FrT1l1peoSJ79cw5I9jhVNVoKSNzNcGsysou3yXIs0YWzjUz%2ByVL%2BEsfXtH44P6zbKKyvoOmIjPp3d%2FbUojRXd7hVAI%2FwaI0sHktZeeDX4pJnffUc2pf4W9t0IlP9ismuwEekJzlnN82%2FVFYtCoXFE582q6%2F3jHajwHWZeQqkMoO4EmxCNsObZe8oeyj6bdSa3qKooZ4pMHgHtzCuzSqsQVVv8W%2B9baUdPWFoGba%2BmmV%2FRYE3EWJlHWTrPzKhbOAMFhH%2FQ%2FXTq%2Bco1WKoS66BSb3mqAXwFHQftZjH7ynZoxR0dADwrHhzic8o4OVP2BVXlzkxGt6XWkDbKQZPPdsfV8nJhJo2zrwxIfKfGem6%2FkpWx9kUmJPUsuB9gIGliNWr7DJPIyi85depH6xbZ%2B%2FXpzsIFTq8Ft8WOpgcXbVtYUmI82cwixY6RG76eKZ8R2b2J5%2BLrt6Rq9iu%2FcPGQQEKRdKxUsXKdHwamGZoc6oOKS4awowNfRzrCdkvPnfxqgEUFtmq%2B%2BE8mgkXhvRVZxZ4431WRyoftya%2FpASWg%2FILyUeOumej5nKs06c6lNABwpjJvyLr5bIJse1vA4xlDTMsELNxebChWzvE%2Fdjpl45YQa3WJS98WayRXPY0qNfh2eKWDFr%2FKZscvE3%2Fj6FE29LX2iJylF2A7yadBDWVljLnoAj6ogSqf%2FHSw6mEWGxbadIubgWT70KrEqdFWqe%2FP6hc%2FR%2B7Nqdc8cBYl%2BSL3VMN%2Fyzcz%2BnFFpmORn4gHK0n3ru800v0Kg5t8YsdxBZhdLrVY3XcSEA6AVkBU%2FsPEQtUkACqcvjDuv4bEgrovq4uH0kRfLOpz%2F1VY8BzKbB97063LomenN1Zk0nY5ywOqjKqnsQn7Gd1cEYOm0%2B863%2FCbXKrK2yGu1mYtwaNBNUzS0kUKFfR2BgsCTu8%2F79LTnbSzeZgY86Jp%2FzNc%2FDmhvy%2BI%2Bl2sacZjZPDyLgXhFj66VtFg%2F7tjCpnlfQpAksuxlMwkeb2mzLXmIMB6XoUxQOOUXgN%2F6Ged8QdjCrKx8eBTWJdqMdSlpSjA2p9A1GLHhQ%2BOYdbPQOcF%2FSOpSL31SXzydZv8dXRytWBZCVyzhsPdzL5g8vKLqTfTnBekadOe6xP7e4zZfcSUsT2BGu4q754ggqrF3G8iVs27wQffknwUOW%2BYM9KwOxh3RQ21yjbQ%2FWS3LQaVqp0z5EcOp6fVt33nZjRk8Q84ZpJ5Rp9UH7vvS5zigBzTbFKB7qluH8uwGvVOPO4hfjbCducLBg8yaWOWAWrLj4wWPjMZhZMu7U01gISmXSFPf3DXmPAPvyGPkBvEtxvoSkmZQm397p%2BBVZiqnwJrQ4e2KY%2BhulHCXZuBVe0%2BQI6T%2FKlVihZSoNYAMdBWalV5VR7mJaMvtySdcynres%2FFNMIKytlwp7zF4Z87mlNZhW8Ld5QxER%2BRD1AGJF8ty6UQ8Mv3tzev9fuP0GW2wF4xrNu4%2Bz%2B8soZzEvAnAM0TohhwZ9o%2F7u7yg99d4jJzBgZrw42irgFnGG1XZcsmQ9m1vi74BnRA8Zixo62L2Q7QwLeEuwwqsLqOxMGYAEPzE2gQW0%2BMxG8QNbjMD5XKBQb5qgq9OQXEeR9yXGZ%2F2%2F7ZTNZNTJ%2BnrLiQsqO0FlQ6vDP%2FnzhNMV0pzRJfK0uYHp2NxWe%2ByT3P8FblGq0OoLPE3Ms%2Frz3XN3Z7LE2jxgOjVGp6PMlb4N6JFL1oRUl%2BCBuEC69lgBf9fU4BwYU4VPzM4mwU%2FiBYvg1b2Jln%2FnNgc2xQLKLRDi7aeKJe%2FrMQyKVF5%2BTlx7QIYfsHhyflRODRe24ZY2bNfsYinCEBCI48muMlFQg51TBx2SnEAA3SOrrAWxlq0z6duQwTaX8iOJRkUnORdozu9MtJwh0%2BbHKxHII0yZXNpMHe5wqER0fOu7FnRe2v1ZFL7EtXmWHzSEl%2BYCE0itsJyEdCdGty%2BDQG%2BXIwX4odyF2GS12h9WRYuIi9O7%2BLbuJH9aUMXxO5B648yOsSntjZdkD3bSC5haZbU25Wp8CNrM4McZsXG%2FweK%2BaKG4pydV9bh%2Bv696ggqAQ2F%2B9PE66PfD%2Fv5UJSWgkEXYoOhn3OK1tOgGIj75vPn1eXjx4a9O%2FzFeNDia2UQriP%2BEyvJbWQ590mwF5vTAIcVOyvwSqjk3Q9eXUlNKIdrEuKADqoPZ2yG3W9STUuEBPBMQIAYUpY8OcW6HUIso8cFnsOzOa%2Bc%2F8b19ycJ8hWEt535M0hwQryxarzK0uifWTx3Q187dGNzZIfmcpSlsctaHHFvYp7o5vcqM10MAhuftsJhj28pij%2BzfKt89AZmPe3SUEgBhZ8KMfrl%2BTZ5E27nCPnZReA6ghSyW%2FpaOyT3ZIowR%2F8K1xVCCuHKkUwnpPNLwMQrbrHAwu34su6LLvAc36Z7093SWW43wiq1Xst7pTMQ1UsW0nSB5AILjXILSHcP2FRX8hLm9ZScxQ3Inxss5PvcvwBWwQWRuMLp92ph1%2BqaiZedKlYhMbWl1DlajKMmnzkXZJFm1QXoSXZXTa5B5UXo2N0od9g5CmQ%2BPy50h0Sgptsq%2BfYWfrJMTQufWMhhMNI3pAVnD0lAMp6y96cmE8SeFTr2xLLw975iDaCvckYXYnDcp7WFCUTM4vnwDWwNXtrWws7AZIygE5uSf67VKSjnsZ40pXEHSActLktzq%2BasPjIbmvVdrnzMaKckIfzV%2FFKYmnf931q27y%2BOBJiKhujvbUxWfwUVUS8OBeG5AYEdmX%2BkgizbFtT1cNrRt01XXutDKtnY0ry5IKe2sRftoGGSSwnToHMzMHcnlL2XLafOyutmfL7A73MXkz4IyRFBy373QTCdHg6x0XXXmdGJvkHs7vxy6qHdmdGw%2FyAI44uHTqxBC1Keoc1cVESIKWhVmg%2F2vHkiof2AyDPu2vwXIuIcIjg6X6aHoZekR0%2Bn7ZUwZsVf7BjhN2UW0kNeAdtfl4iR3Rar3n5s3Gkp3g7pnqT3VJR%2FW7ZeOBOzwtno3nioayS4zP3YrQd4UpsgwCNHSoaG8sRsV4fDolvh3zwaxLp8WGRhobnl1b7DCqNaGJw7LViTnGs%2FoHscfinnllk8HDRuWcpj5Q9I55aQ6Grli9UUGzB4UlzsvFi%2BcV5nq345xiPRegGsdpQ3r%2BEXKeyt1eTQYmhKlaqqy64X9kiSBg%2Fl89GvdFFEr3QyH%2Fvf7gryU5D3frocEq2RT76GB6tBGXLhlGY6KG5WYkcgv9%2FnwQetGkDxJL%2BFMDhPvgHWPAiizsZyKc8f5mG7Bq8YtshcgozkDr2xwPMROhr8VEd6hH8BqtOlb4OY0%2B6H16%2BYl6esEvsDlTaoPUFJ4xEJTNFtxtRfxDXyihyBO39yDcWTuAVms1yXLrt9IzMz5LQEnKLZWaQtZuE1HZml3DCAe7S95QFrnIGu7P3ffDaiMAmLFAVkjOAR0QF9dw7sT0TfkoVLusXpCy0bmUD67kXajbC3JPc0Hb9V%2FqVj4HDZhxX2jwDj7WI4UOb%2FWyPmUAq8v%2FXE%2BeHpNiiU6vnyZnsnOTFbVdwZo0vF6ziIKpGAE5GuwN8aODQ38VLuC9G%2FfQm8d1uXYbAIw74SBTjuhtg3V7Lc9TJRFCc81RFzZug39%2FFzC0r0Ccg%2F1nqGQmZjho84jEdV0Gd7RLAaVVos6OMNghjOj86uVEqp6946z0tMdkNv93iboouAxY2IWTqRUzOmA0F0B1qY4avLnLdvcVV%2FFOJLIZCZL4zk%2B2q%2BxTR6F%2Bqq71rdJm9U6uk%2BHWJFvKmscCzmtnDokPdmKPYx2Mm4BCp00REsizye0geOu2FAtU8B3RzjAiljGgei1zske350BKcWfbFEtKJ21TBDkAxTdr64ZHWN5yvIs%2FVFhyD3mT7i2w2%2Fq7rVDn7SZdsdjbMvw4yRM1TX4ZrkkUh%2F4QQl0si%2BOXsKT0zhHuPMkTHO9gh3u2Y%2BBqUov9E8omxZVhb9Gq7it5aw3lTySmPjt%2Blw5By8pF%2BAZJOOq79Sruq9IR9Pia2OLr%2BXT64%2B2hjYIkn702EBPJ6V5Hyay1wp0N7hz8fOAIz7aurqSSgQ56%2BlfGgnEo0VQ4f8olocs3bKZT7T6BStbo73x9Pdqr7w7N7hPz4SlOhysvFF9PWBaq%2FeRCNoZvFC74lNmUwnaEJhyxMshb39MsUbAHO06gJ2OmSBrUkhPfU5S%2BrKIX3MJ0SVvjU3V7dgbovhRM0YINLjOP0LMNNY4G5e3y4IFq6Rxzy%2Bm%2BJJKOL%2Boc3cZ7PWEZO3FnAZjIscz045WsTRwwfHByETuFubflvUdAkDzfmV2fLahRtvGUjGXnmCnObob5do4jtKuYtsAxLFOqQj6e%2FOTCnVNj6ABU0oPHtuqUaC1TBhDHYq8Bz9aV6%2BBVDDKKxYVCCS9lDAAU3b8ibUQ9E9Mdhp7cZGcYzb40RU2Q%2FyCsHYzMUU6GZbIx3fFEB4WBG2aQ5mjhbPVi5XRJjfdT9erpKRULvpiUqGTVuXgay9VlFR5U0GMtp7ysOcX%2FsemccGt83TCQS%2FkOlGmyowxTkd3vzYfgCnN81cngtZisHsxt1slwnXB%2BeyqlgFgvaG34YnVhKy8SA9usOm8HCPw%2BGmsXqyoSDmzO%2FnCQAnYupVOR2wMk7DxN3E3rJGLhlpcKtuqcbRNBBJyliBfPtMEKr3GEqpYeSpP5wItAPk8wSxRkyDnlWUqLHzdesAIR32nevkMcirt2tAU2YiuNqnSiukMLtCH1g23LwzM9yaYt6Me%2B3be7ulpvdx5iJpWnBDY4xYeVnFUSjR8TeBDYqnr8t259BK0UsF%2BPkMPcZCWnRCLohnqT6OQD12nhDKvpOSGKifPKt9jFUpT%2BgGw21zYs6i29H8f2%2BGvKmk6F7qUVJt1dPWujGuwIma7WyWwah2d%2BFDy6Chn9lb%2FsB8hTq9XffSrr5nHVFOpG8D%2B%2B4Te5li3UBi8NBgWWx3ug%2F8ewlSzLhLqiuE%2BBtnFZ%2BQoILFWxrFYFftpZboS4eWyGQfTXjLRibr%2F9wVayzZ791ZIUcxxAEL3m5YKTLBaoah3xCc7g1O6G0BZMuOX5PJrmcY6WCl%2FzmtLS2ssxbpfsmO7VY4a2YaLhTQXIU%2BKYQsq1T2jK5kfk9j273zTeLmO4ftXxCpB3nWGoq%2BPWbG%2ByGsfpHKY6XulF7HpIa%2BxS5xcNVUnPgNzThpLjJh0Ky0jWHR2692MHsYFmRKv6BGBPXYTC1neU8NqIYNSRE1zCd0jkopRWdgeisHlTM0yXVrD7BIBCFoxgBV17EwX%2FnWtrDLZ1evoxrCL2cBlR5q%2Fh7uzXSGHNOutbLZCXmHiI%2F%2BEqwS7NX5QLgaqmJ13WJ7Fy44t77fg4loHLowvgWvmpc%2FiRC0E1MLkw4KcH2rsSAL1kpSIOT4R39qZ%2FFVTNLe5BCEtLDu0o%2BH0J0F6ibw4QQU7uBIxeKrhHdWMNNNNn%2BIkZhBQZBNRUhHx3TqPP98pP6fMLKevO%2FD2NPko%2BuUJeKmF5bVaFUxkce1wOp8cV5%2BADAvvimKa5qKNPqOTyOrHGE9cEa2fGWPE36fpxB3%2FUazmSJ1GSYhY0FdaMPwKdwXVoyTvgts6QMDybdGJTb9UnSmQ1aanyu3mGSqX9LlCfbBb4pKQ7FjK5Sid9sUsijF%2BbvJCZTJUD%2BrfljQidSsGT4JlsXA8Fhz1U58xZr4eXogLQo%2BjYgO6FjLvgYEiQ9W5o7nB28k9RNmMYq65gfdzrl7fWpTTHbU5PzF%2Fwi2VsvWo%2B4X1T6eSozGPG64EL8kugblHAhx%2FVuFhrPlmMrm6NJ7NAlQL9ZTW81MURy5gluj4EoKvIVgFb298EVOe10drww5DXskHKregCQ7Ak%2FRbgHIiPn6RwCjlEiNjQrwIPqNPfDysnhJN9vRixYdWq2rWmnxnfRjRNwGo%2FDpygpzPGAdERMW9ystFe6TAVUpXfX2tPbuwgXhM74zZLnL74Xn%2BvzordFLfP2PVa4uNYZKWASxPKsBcLnCFUG86wJlzamJ10Ut8xW4SHxWW6TCYxRBaJSIYatcOBLr77U6JN03g28bBnMFiBqenoc3AgghOv5Uy7%2B8Ssb9%2FMW42R06FTOn%2BWNjgQA4OBQPdlc9Illk%2B3PGOlylg3zvicqK9%2FMZ3HVEeNsO1WOcbOQU4r1yVcn19dZQgllquO7iXjp9AHPVOE5ToiqSD66kHkrhIoe%2BjMCPGYKDRWFb7%2FFrCvTllhEMr%2BhrOQa61xhkhdfBvAe2UKHNxQHH9bF4Qb9XWWJZLarOgAew4%2FPvZVUVHnvN0D4EaU5HVG4HLTY7XvFfQ9B38sebPLnV4uuyl7YzcRPiohqDA8ILvBCQIB3%2Fh8buZgIeaWhz6b16MXSWgFhCaQ3Gii%2FgmsplaNvFQWCgR9XvVBIId0z1v%2FcF8NNTlzNTEJyND2g%2FSVzi3uw8GRn%2BT4JE2FU8YKL9wvT791XZt3mGDGQur9B57UrVgLr2eDzRHmmxUhSfeiO7hXEfrmXaq1vgyKpJhaLJrUGWlVxmfIUbip4HrHafa9Gh%2BZpf3EaOTMCQ6gqdwW1IHGzMnR9nQNCH9TwY7lSTPYuVs2R2lMhXXb9tKX%2BdqrzIa3wbj9nvL4GQgV5YWkJtPc1m9dhjSJHKw%2FJprMc3RaVhsZXtn4aHhGASfkir9aObwi3TSDmk04ctTKgHSJKxRHucHNsOPqpnEpeyLydsU%2F0ujUkPnN5ME2UF7C6ky%2B7GRLM69X2Tm95aX8y5N7DZD9pr8Z3uzZ%2BbQ8JlzKBys5bekyghfM1WM5Nr44shX%2BgsX9vIWT6GbiMw0JmeM9NB8DaHPBm9midwPzPsqr4oV4vIEP36KHQWFLNvOzLNjQeOi08fTSwY7auXsluns5RjcrV3CxuEsS1Gq2RDptNrxU4xIs0eqbzLqvyM%2FgN0WsiUCBQtxO%2B%2BWKlJ4kQF33ugAdnzD7QA%2Bm98zuo0bJlTs9CyajMJhWZbpXbXyT8FbOxcm7DWQLLxBJcUm9xqNTarR0cS1Wr4lNGa2ROBvstq7tfRFzvyCUY7td1wx%2FB%2FhYEeWFPW0pr%2F6PMwgAz2RQJjExirCLFIKkU%2FtqQpwV4alzN%2BNfF3JA9zl48WN3peluXuMp1rRYxfAoviW7EgHrKoYiJwhC4rLmCo8YgxXDGUQBZDUJU9q3ga74pZ8nGyL4PrivimduygMrGbjP%2BAoj8YiSpQiUegkxhs6VpwsoW4kDL2U48zQdVFQy9fbv%2BAEB2cWAzVIrphI41BraaGHCpKuWArfW%2B8WfZzWZOyJsM%2BHxJoj4jrDBfjtE82e7Vyge%2FABsz%2F3afD9E1xSOoVWYdjlZctTQnedui%2BQsGuFhcFIy7SbBYTXk9Pwmr%2BfgpBgq18EVyecqjMz7jXypxcgwKJaMS1SmZd0tkCg7hObsar6zkmloRAGFB5fUytO%2FbFxoz0QofNFBGbz1N29axE1iiKL81Xh6zRaQyD%2BPkoYqoL1ICdX024DgzhMuUckFMsiicGSiZE484R5wEQgkTKILSsNGJ5IwakLCkIvEmFOi5ArBy5e5g2zrKCzvujGfpZBiZw46ET%2FWD9rzj3v%2FRnSKj%2FrGJHiqkuacE8ur0Sk8YtLZ%2BuNV71eyHW3dBGkoGylSB8Lx5QcIct5cboCYkUxZwUADk%2BlPR9qBLrDR75NWMcT7YfAckDAUeCgaqtaTf8IlxTOsr0f69%2BT%2FuZ0cda1TLQCJB2VxmSgmn7LKDyxpFTG8Q5Z6YqUDxx6P9wF0mGfDiCmMeNEOcP%2F%2B2Kb4a3EGl%2Bce0DoC%2FI39PYEhL4eGmFBeyddPeefdTewxuzDBPdRZEskOOa3jJer6LeV%2B5gYdmJeCnfI1k6AsOw6txIkivojeF2kPOu4XFY6VkdvLv1llzgUWbwvxKtjvOod5TUkm5TmzwhquO%2Fnpqmpjk%2FEzTiM71C5hFq48Jiuo7JW6PtOpnghZPwlFH6ddwK8cRgsfVlHCx3A6lVzC%2FOasfliggDZYC6tkjcie7ITI4NGfxM2t%2FXCaS0z5Hc9mKf%2FYjw6y%2Fatm%2BOZ5zXppIyhm8%2B6omYsJW5b7K0Jrr2Nj7Hf%2FQWcgZ3dWk1Q87j6vXf%2BqmZya5rkBDM%2BBVdVMukKyJkOopOTbUfYWKIKXm3Mg50J3K8sUWmc4ddbyo%2BKuVnm0lEDKoRtjcdN1BjwsLxZ339acKNlntLxMyJXJ3X2%2FXKc2effhGXulWN%2BnDjPsrBVcu1LKkBDUIpTFiNcA1eZcmp57Pn5Z2bnfOLAtgoGBZ%2BTXGDRo1tWFsgnyOGWsF9Qzj8zEcHg0UnGSTii2105qfajKfHEw%2FxT7gs4fnpXuyYAvk%2FobbDjFi0t%2BTqe385UWuDThgmiys0NMBn5MssZzI6M0QNwJ4DmblIZ%2Fh3eqWASwaAMQIX69zG2sZS%2B3ftIkScT4k262zG%2FIV9uEIqGX7GMla1SEbFrEX2pi6F5OwjFhRRBQU241cr%2BeTXQ7WQj84kitP8wolLzGucRQl8D7HUsGXcsp3i17vxmf7ZaN3hOpukWudhyB5PjJsDy95xL9RAf7bSGFLZdsiVU8zNfrHIWQJa%2BNrLEM9%2FU%2FsSqVRRXjz%2Fn7vfU5X4OxaKbmomix%2Fg0n%2BbUc%2FyBvxwwNF2Lpa32%2F14XMZ3e9) ;\Ô\0\0 \0IDATx^\Ïùt\’\€\∆_¸î\"M)ä\n®ÄÇT§\n°&\ÈMÅ–§%°ó$Ä@ Ä -°Ü\" E)bA∞Ç®(\"6@AiÅ\Ô<wˆn&\Àn≤\Ÿ\Ï&ª\Ÿg\Œ\·ê›ùπ\Â7wfg\ﬂ\Á-9D\‰ñp#           7\»\‚\÷-jnd ¶H¿#^{\Ì5)[∂¨º˙\Í´iüçí\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	êÄª\‰»ëC(@∏ã&\€!†\0\·a¿lûHÄHÄHÄHÄHÄHÄHÄHÄH¿m(@∏\r%\"\œ†\0\·y\∆\ÏÅHÄHÄHÄHÄHÄHÄHÄHÄH¿=(@∏á#[!ÅL!@\"S0≥         7†\0\·àlÇ2ã\0à\Ã\"\Õ~HÄHÄHÄHÄHÄHÄHÄHÄHÄ2JÄDF	Úx\»D 26ª\"        \»ÅTàã/ ºyÛ§i”¶ÚË£èZ;\“\Ô7l\ÿP>˙\Ë#yˆ\ŸgS|û°â»µk\◊d…í%r\·\¬9r§<¸√≤v\ÌZ©T©í$$$»±c\«Rtq\œ=˜Hü>}§@Åª^πr•t\Í\‘I∆ç\'c∆åqjà«èóˆ\Ì\€Kï*U‰©ßûíŒù;K||º.\\X⁄∂mõjO?˝¥‘¨YS∫w\Ô.+VÄvf;}˙¥,^ºXÆ^Ω™v¸Ò\«%888\ÕCq\‹˙ı\Î\ÂïW^ëü~˙I>¯\‡\È⁄µ´\‰ ïK\Î\ ¸qú>\◊˝ıWä1î*U*E˚i\r‘©S≤e\À\È÷≠õ\‰…ìGŒù;\';vî;v§84˛¸\Z\Zz€πƒöXΩzµÙ\Ó\›;\≈˘˚\‚ã/d\Î÷≠\Í¸õÁùòò(Eäë\Áû{N∞è\Êë3gN˘Ò\«eÕö5≤m\€6Ÿ∑oü\Íøj’™Rªvm\È–°É‘®QC\Ó∏„é¥¶\‰ñ\œoﬁº)ªw\ÔñÀó/Kã-\“lìDöà∏	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	êÄóH3lf#∏\ŸËõö\—\ﬂ\’9\¬\ÿßå\∆0_πrE\"\"\"d–†A≤j’™\€\∆Û\ﬁ{\Ô\…\Ôøˇû™°\ﬁº≠\0—£Ge\–OJJR¢ã3\ÍÛ\Á\œWcKKÑ\0W-\"î,YR5˛ˇ˝wö\∆~≥\0aÔú∏2Ù\ÔHÑrf\Ózüì\'O*\√>Dú3f8%@\‡úÇø\Ìf+ 9Zã\‡¶\›\∆˘Û\Áe⁄¥i+ó.]à(=Ùê J\Ë˛ \‚Lô2E\ÓΩ˜\ﬁÙL”•}!™ÄÕä+î ì\÷F\"-B¸úHÄHÄHÄHÄHÄHÄHÄHÄH¿[§)@\ÿ3jQ\"((HE*\Ëst<˜üx\‚	\È’´óî+WNy°/]∫T˛˜øˇ•Œá°˘\›w\ﬂU<r\ÁŒ≠<¯a8Ü°˙≠∑ﬁí^xA{\Áùw ≤e\Àd\ÔﬁΩj_[AD{∏Cº@‘Üˆ\ÿ\◊ã-í#GéH¡Ç\’?\Ì1√º\ﬁ`\0÷ë\Ëü˝˜\ﬂ\ ;Q∂àé(]∫¥:˝h°\‡ƒâ≤g\œ˘\Âó_î\Ë\0Û8tËêälx˛˘\Áïgæy\”Q∂\—$\Ê˜a,oå_GÅ\Ë˘ŸãÄ		Q\Ê˝ˇ\Ôˇ˛O&Lò†∫6G[8ä\"IMÄ\–c√ú~˚\Ì7e@\◊cÑAﬁªÎÆªT$	\ÊÜ\Ë\Á®?¨D/ Bb\Ó‹πx€µb7\Êè\»sDô2el`]¥hQı\Z\¬\—∆ç’öº˚Óª≠\„\√9\«x¡\n\Á,_æ|\Í≥6m\⁄»ìO>\È\—kUC <äôçì\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	dÅ4[4^#EP\Î÷≠ïP†å]ã\0¯bÑá—£G; æ˝ˆ[k˙x\Ìka)ü&Nú(;wÓîô3g\nå\“\„«èW\—0^c3∂Çå\‡0\√P\rØNıÛ\’W_©\‘>à¶0ÜhÙÅÒ m¢)0\«gûyF•ÄB*•Ú\ÂÀß  î \"Fj-\‡Ä\r«£ÙÅFÙ7n(o˚a√Ü)cπNdéTH-Ç¡v~\Ê~t\ƒﬁ≥M¡§|ñ7o^\≈cÇ±¢Ñ9Ωñ£Hg¥•œá9bFGt\‡\\2D\Í÷≠´Ñr\‘_ZÑ¢)\–.⁄± p\Ã)òé=™\"g jı\Ô\ﬂ_âFHçÖÛd\Êás˛\»#è»¨Y≥îPÇ¥L#Få∞¶±Ú\ƒıI\¬T\Ÿ&	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	êÄ7HSÄ\–bÇΩ|˙¯Ãû\0°\Î •MZf:ï¢\r`á±yˆ\Ï\Ÿr´V≠î\Ë—†AÅê`\ﬁt=\‰˜Gd\0»õ6mRFw§∑i◊Æù|ˆ\Ÿg*ÛOq¸¸°\“$A@îEÛ\Ê\ÕU∫ !®Å\Z\ﬁ7G@@XA\rå\◊_]ä+ñ¢ŒÄYXÅÅ¸ùw\ﬁx\ÂOö4It_ò\◊\€oø-\ﬂ|ÛçLû<Yy˙£Ωæ}˚\në[∑n©\œπÒ\›wﬂ©Ò\"ïQ≥fÕ§ZµjäÖY\“jO \“Q	\‡	É?Dq@x0`Ä™£Äh\rÙ\‡¿5\Ô9s\Ê®\r+ZA\¬\À/ø,eÀñUiìÙÜ\Ë¥°£0NF≠åFç\Z©y\‡<A,B\ $˘±A0Xæ|π\ZOTTîä|1˜á}¥\0aõFJücàC\Î÷≠S<aºˇ¸Ûœ•V≠ZJÑ@\ﬂ\'\ÍLòG\‰\√\'ü|¢\Œ\'∆á®¡¡\nì´0.à_XáH˚Ö4Z\ÿPØ5O f†vÖN\ŸaBDsƒÜÆsÅc!§\≈\ƒƒ®c!rÄ\ÎÜ\rT?\Ê-≠\Z%L¡\‰\r∑MéÅHÄHÄHÄHÄHÄHÄHÄHÄH¿N	∫àØˆ®\◊∂iÉ\ÃÈîê˙\Ê˛˚\ÔOUÄ¿\0!`\Ët=xçî:ˇ¸Ûèºˇ˛˚\ Pt§SÇQ˘\‡¡É2j\‘(	∏≠\ﬁˆ0ˆOü>]^|ÒE\Î‹ëÚ	¢\⁄E;<Äå;V}n[\–\Z\‚¿\œ?ˇ¨\Œ/ Vlﬂæ]ç\√VÄÄAû¸é\rÇ4R0ÄÉ\"ê™bàó^zI†+T®†\Á∏ìBÖ\n©}}ÅZ0n√∞ç6±\œ\◊_≠\"\n\Z7n¨¯Aå¿¸Ò7éCDB˝˙ıïQ\‚˙ÑÅ}\·¬Ö)s˙)\–)∞t˝	≥\0—§Ie∏«ÜæPª\0\∆yú\Á3gŒ®4K .ÿäD#Ûy±\◊\ﬁK+Ç	\ƒ\Ã\nGÉ-§UÇ\»°¬Ñ\ÕP\œ\·\À/øT\„\¬\‹ \‚\ËT[∫V¯\Ëh\Ïg.\\\rA\r©∏¢££\’z\ƒ°˚A¬∫ƒÜÛâ\⁄%H˘ÑMø˛˙´\Íc\¬X¡\Î\È\ƒ>˝ÙS%å·º¢\Ê\∆ë\»\—F¬ô\€\Z˜!        )äÄA⁄®\n\√(º\Ÿ\·ı£6º»µ◊∫ `º›≤eã2£\–/\ÍTØ^]*WÆ¨ä˘ök@¿¿ØS¡†ÆˇÜë\∆g|\œ|\—a\–m—¢Ö\‚ÑÙ9ÉVF˘Jï*	\ƒÛ\Ô˝\–\–Pe$á0Äø!d Ç\0\¬\ÊÉΩ ``F?0\n\√=f\Ãπ\Ôæ˚î–Å\Zõ7oV5(u†\Î§\'sÉ0\0°\0\—H\Á4|¯pm†\‘\Z¿∏`4\◊,aPGà≈ãWEìÒ\Z\"\‡EQ\Ìº˘\Êõj¸\Ë¢Û®u\0#9\ÍNÄ\"¿\Á¬ä9pà#0àCPÄb\ﬁ	`çÒAt¿ZÄ\—¸±\«SÑ>¯†öD\n¿pé}`x\«Zr¥•&@@@Ù\n˛1\'å\¬¢\\ \Í`Æò;\∆£?¢#¿sÅhÄ\Z∫ŒÜmDj∆Ö(,à¡ö\÷\ÿ˜\Î\◊O±GÑ\÷6-@ Z\—48\ÔÂêí\∆\¬L\ﬁp\‰HÄHÄHÄHÄHÄHÄHÄHÄHÄ<A¿*@\Ï€∑Ozˆ\ÏiM+c\Ó\‚\0R\◊¿C[=\∆\Á0\‡\"\›˘äG\ﬁ|§\‚¡˛®5\0\„0å\œ0\⁄\¬iw`ò«Ü<˝fBè∆±(í‹•Ke@\◊EÄ\·¡ﬁ∂m[e\»\«?\‰\◊∫ëëë\ ¯\rC7å\—0v\√hå>p⁄ÑáºYÄÄ¡Fa§\ÓAZ#Ñ1.=§\‹Aª\‡íû\ZHI¥{˜nï:\n\Èê`§á˜?\∆a 0?+:ΩD§Ç\‡Äh&æ\„é;¨≈≠1_D9 Ω¢0W§&k-gœûUº``G¡e±i\Í‘©*\Âë  †>∆àÒB\ÿ˘\·áTÙÄΩL:¨!\÷ m\ÿ·ºõg√†éà¥¡ë,8_à:1◊Ä¿πÅêa\ÓÛKMÄ¿\Z@ö#¨\'àb8\œ\Ê\ZXk\00/\‘ÅÖTZT\‡v∫X∏m\rG\÷1\Œ\ÊÜ\‘[h\«vC\‰\“RôS(ôGE¶)@x\‚∂\∆6IÄHÄHÄHÄHÄHÄHÄHÄHÄºÅÄUÄ@Nzx¸#jFn¸|||º*\‹\·\ﬁ˘0D\„làÄ\0£Ò©SßîÅ\ﬁ\ÿˆ\ÔﬂØå\‡\ÿ\‡ÖécP£°Fç\Z*5ê\Ÿ\–\œyx\≈cøm€∂)Û°Cá*èsù*¢\0ä8#]\ƒx\“\Î\Ì¬Ö*\‚\Ì\‚}\‘{¿Ü>Ò\‰`\◊⁄Éë\Zu˘1/st\ƒ\0ù¢©Ö0n‘ì\0-ò+\"0F¥É;\"÷Æ]´ºˇ1F¸ç®\n\‡ßc\Î§o\¬?Û¡\"Œùwﬁ©ﬁ∂|pn\–/\·k\’\Ôz\÷F\ !à\‡åv¥\0°	0\’¢0GD)@x¡1ut˙%Ùm/\—$hˇ√®é~\ÃÑé*\–iµt*.Ev\ÿ\«6›ìf\‡®>\«\⁄\¬Z3\Ãb8\„¸`L8◊à\\ÅÄyÇ!\÷\∆	ÛCÑ9\Ì\nîcç\Ÿ∑M¡î\÷≈™Ö{\“F!\’˙∂\›(@§Eñüì\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	¯*´\0¡Fts™L\Í\ﬂˇUF_à\ÿ`\◊iëêHG\"¿QH\„\«¨<\œQ¥⁄∑ó\Ê\«¯p\«\œˆ“•Kß\‡äOhFÙçZ	ÿê&	\‚\0å\€0\Ëö\Î\‡â|m ÜÒ\ZıbccïÜj\€M\€u™\›.Ñ\›\Õ\“Ei>HuÑTHÖqAÙ0o>`\œ+^∑ç\‚\›\Ê\ËÛÒ\‡w\Ï´\”U•w˛h\œ\\£¿Q\n&\ËQ\√@é(à	V±∂Â®èÅ\ﬁ—úÙ1z˛àJ±m?5n˙x\‘T@qúODÖ@\\Bz$§¢2Ø›å\\∞\Êp¿\—#à,ÅpÇy\⁄ \Ã¸l˚•\0ëë3¡cIÄHÄHÄHÄHÄHÄHÄHÄHÄºôÄUÄ@Zxjc\”Eû!4 •^cGÛf6\‡\„˝Iì&©\Îı¶ºvFÄ0\Z©AÉÅ√Ü\r*¢\0õ3Fqm\ÿ\÷b\‘	@\Z#§\Œq$@h=˙0\√\—\“ˇ¿8Ø\ÁQ_\“\⁄2*@ÿé\¬KZ¢Ä\Ì¸1\∆\Ï(@ÿÆ¨‘ÄÄÅ\»;ÆlH5Ö\ZD¸@\»@≠Ω°§\'˚˛˚\Ô=.@ •¢>\ÊÕõ\Á\ 4x	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	d\Z´\0ÅhÄ\Ë\Ëhª#ïÚ\€\√\À?oﬁºjs~{ºF\râ:u\Í§8^ÉYëñ\0°#-êáøJï*÷∫∂BT¬ë#G\‰\’W_Uöa\◊àà@ä$Ém7[ºY@±7vÛÒ∑≠\0Å{^˙Œúπå\n:\\Q3µ-ëû˘õ\Á\Á\»Cﬂû@\·å\ÿc\À +\" ê˙	µ  \Ë(É‘¢J\Ãc\∆xë\Ê	\Î¢“Éaç†.	ÑùRk∫Lô2*\Â\ƒ6\‘IÒdRçam£hx—¢EùYj‹áHÄHÄHÄHÄHÄHÄHÄHÄHÄ≤åÄUÄ@}xä/^º\ÿ\·``xEîj\ÿ\nˆ¢\Ã˚§%@ eSÀñ-ïPÅt9Í∑∑\È˝`FçÖJï*©t8HI§\rÚ®õ`ª°\÷\»f1º\‚\Ï\–3\Èu\ÈÄ\⁄ô%@hc=\ƒÙâæm7ù™\n\—\\¿¬ï˘ßÅ:®≠\0qHß`BÅlD~¿\Ó(•¢Jê≤µ/ å∏KÄ\–B\ƒà8\Êh\ÕHG\› ∫e î)™∂Ö.`é}P§\⁄\ﬁ˙\–\«#\“©õPxºMõ6\Íol\‡ªc\«µVê&\Ã6\"\»\ﬁ˙Jã/\⁄MO\n&q\«\\P√Ç	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	x;´\0\√+˛¡\Ëºf\Õ\Z\Â—≠\Î7ò\'°#._æ¨\n?o›∫U}å\"ª/ºBä˘\Í\»\‰\ÂOMÄ@!\Ë\»\»HeTFå«∂^›∞π&Ö\ﬁüAL\–Q∂\«_ºxQ%Üë\ÿ,@h1µ	\Ã5%–û\Ÿm\ÈêZùgNxj\Ê˘Ÿ´aóˆ\ËGAgW\Êèsë\0B\¬;\Ôºs[úS\·\·\ÂØ≈Ü\Î◊Ø[S\Z-X∞@\Ê\Õ\ÁJ≥ﬁµkól‹∏Q\’\¬pó\0°Öà\nˆ\ƒÛy6≥\√˙B¥\Ã»ë#•Oü>2u\ÍTao˚˙\ÎØU\‘\√W_}•Ñ0D˝\ËÒcˇ¥˙ıd\ƒ#è<¢RÜ\È\"Œ¨5\ÓC$@$@$@$@$@$@$@$@$@YE Ö\0a\›H7Û\…\'ü®T6[∂lQkc<R1\È\"\ŒxÃò1\ÓR\rà≥g\œJ\ÁŒùïw∑6ZßD◊ä@öà\n≈äìoø˝V	\"H\'4}˙tU¨\Zàa\–\«k\ÿ\Ãb\‘R@›ä9s\Ê(£:\‘0L£\»0Ú(^A&3åQ˛˝\0ë•q\„\∆j.RT\r:T\Õ\ﬁÛ∫x∂+Û\«9û8q¢:w=zÙP®˜Å˜:§DàP∂\‚>É0Å\rkCè\Ô⁄µkQb‘®Q*rBú\÷|§rî\"Kü\Ô\‘ƒùˇ˛˚O≠1\‘A!rD@¡v\È\“%ı>\ÊÄ\œ`®7ß\‚˙\Ì∑\ﬂT˝\‘oh÷¨ôj\Áâ\'ûP\\±°\Ì›ªw´ıÄHöæ}˚*\—\Î¸\œ?ˇTkk˚ˆ\Ìj~(\ÓºÛNu\÷nLLå\Zã\Ì˙JO∆ÉéÑ7ü<y≤µNKV\›0\ÿ/	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	8K¿*@\Ë^~˘eeê◊µæ6\n\„oùñ¶`¡Ç*j\0\ÿ`∏Ü°\Èi\Ó∫\ÎÆ\∆\\|ûZÑNõcn;µ	\ËD0é\√ §v\◊y˙!\Z MT…í%ï0!≈¥˜\Ó›õBÄ¿1f\√4\ÊÄq˛ı\◊_™\Œ\"#``ÆX±b¶•`¬ò`G™\"0¨W≠ZU\”1/Û1N˛Qx\⁄l∞ve˛Z∏\0K\“~Ë°áTz-\ÃRsù8q\"Ö\Á?\nD\‡s∞µ_√Ü\r\’\ZB[\ÿ\Ã|\ÏãHàB∞W\« ≠\Ë\‘\0ÅÖ\ËàE®1\0¢ÅÆœ†”ÑŸÆ!àSp,6=_DH\Ë\„\—&¢B H\Èk\0ÛMHHPuPp>∞∂p,\".<®^#U\“5A¸ÄhÑ®g\Ã6\Ã\‚\Êgõ^\n\Ì\‚≥n›∫9{ms?         \»RV\Œ\r6(£.®`áπ˛gÕöeç ò9s¶*\0ça–Ö\0°\”0•6G¢ê2	\Î0\‡:c`Ö¡^˚∑LNù:%oºÒÜJ!É˝s\œ=ßå\…(Vç\"\Ÿ\Ê=^DI íb\È“•\ \„e§\Í\‘¿ñY5 Ùò`Ù>vÏò™…Å\⁄0Æ∂m\€*F(|lose˛®\Î\0Ab˙3\Ã_≥Éë\›6ı∆á\Z.¥≤Ü∏ÄBÃ®µòbxhcÙ\Ë\—Ú\ﬁ{\Ô)a≈≥\Ì\’bHKÄ@£à¥ÿ∂mõ\–Ñå\‚jNò\≈3[Fwpéëflˇ˛˝Jh¡Ü±7m\⁄T≠{N∂ëà>Å¿ÉµÖ>!D‘≠[W	r\ËcBm¨gå´t\È\“N	DãÄ=\"-tÒl=vºèHà/é\"$≤Ù.\¬\ŒIÄHÄHÄHÄHÄHÄHÄHÄHÄH¿´\0c2\€0\0;\⁄\ÃiiÙ>~¯°2V√É\‹vÉ1\ZÜYãN´5\œ	êÄ}√áW jÑ	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	¯\nÅ5 	∞j\’*\Âù!^\ﬁH5S£F\rï˜æ~˝˙*í¿v;}˙¥Ú\‡6G¿ìºeÀñ*ç¢(@¯ í\‡8Ωâ\0\"Mê~\◊#\"`∏ë\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	êÄØpXÑ\⁄W&¿qí@v&ÄÙL(@ç\‚\Ï\‹HÄHÄHÄHÄHÄHÄHÄHÄHÄH¿óPÄ•≥≈±˙\‘~@\rì\ÊÕõ˚\›\‹9a         \ﬂ&@¬∑\œGüç	†HvØ^Ω‰´Øæ\ ∆≥\‰\‘HÄHÄHÄHÄHÄHÄHÄHÄHÄ≤+\n\Ÿı\Ãr^>O\0uW}ÙQ	Û˘πp$@$@$@$@$@$@$@$@$@˛GÄÑˇùs\Œ\ÿ¸˛˚\ÔRºxq˘\„è?§P°B>0bëHÄHÄHÄHÄHÄHÄHÄHÄHÄR∞\nm⁄¥! /!\Õ7\ﬂ\»3\œ<#,íq$@$@$@$@$@$@$@$@$@$ê>Vb\Ì⁄µ\È;í{ì\0	xî@Õö5U7         EL¡\‰ãgçc&          /\'@\¬\ÀOáG$@$@$@$@$@$@$@$@$@$@æHÄÑ/û5éôHÄHÄHÄHÄHÄHÄHÄHÄHÄHÄºú\0/?A	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	ê\0	¯\"\næx\÷8f          r º¸qx$@$@$@$@$@$@$@$@$@$@$\‡ã(@¯\‚Y\„òIÄHÄHÄHÄHÄHÄHÄHÄHÄHÄH¿\À	¯¥\0\"\€\ﬁ\›#\œ˝°0ºWö<__\‚\„\„Ω;áG$\0\œLO ¯ph∞[g\”!\–t\ﬁ&9ˇ\œ\Âå4¡cS!0†nU	©^\—\Ô˝sı∫º0{Ω\ﬂ\Õ\€W\'|\«9$)¨ÉWøe\‹f˘\Ì\‚ø^=F.c\÷˜l!\≈\Ê\ÕX#<\⁄o\Ÿ\›{N5üÛΩ\Á\\p$$@\ﬁAÄ\ﬂQû=˝\ﬁÒY¢D\Èrrg¿}R´\«)˘D-E˘Ù\·$IZ8E˛;ˇ´ú˘\·§g…≥u Å¿\ƒÙû4íg§ùÜ.Hêå~Axb\\l\” \0¢m›ß•\\â¢D\‚f≥7Óîó~¿oàFs7\»\‘\Ó\Ì\›LïÕπõ¿7n»®%k}BÄx•\ÈsêüjwØoho⁄™\Õ2ø\√s º\·d¯\»¯\Ï\Ó\'ä\œ˘\ﬁq8\n \Ô\"¿\Ô(œùw|\Ô¯§\0ÒH\Â™rg…á•˘ÑEv\Èæ=∫ª¸w˙k˘\Í\Ë\œ\—g\À$@&Ä/ài=\‡˝ôCDnÒ7r∂êDÜ®Ä\0—¶\Ó\”R∂x\…!9\‰ñ\‹\‚ˇn\‚0w\”.? eJ7é◊ïæ\ﬂ:Zw¸\‹¯>Ú$üˇn‹î\—o˘Ü\0Òrìò?ü]˙˚\€\—}åü\œ7\ﬁ\ \'jı\€ <¯]üõ∆≥˚\‘p\‚s{V˛~\Œ\Á¸\ÏxyqN$@$@˚í\Á\Ïj\Ó∞/˘ú\0±s\ÁNi\ﬁ*H\Ó9-w\Ê\Ãewy˛w˝öÃ¨_R\ﬁﬁê(\r6\Ã\‡\Ê\·$@û\"ê¸#\∆S=¯oª¸a\‚\›\ÁDkD@gÑª\œ\‘\‹MåÄò¨n\ﬁL\0c|FÄ`Ñ7Ø•åå-j5# 2\¬\œè\’\œ\Óî≤R~\·sæ?^}ú3	ê@ZÙwî\’üC\‰\÷-\”˝öØ]\Ê\·óDpp∞|y\Èi>aa™kQè÷ÉH\Î\n\Â\Á$êÖ1π{7˙˝\”Kˇ ±hS0e\·\⁄N´kAujH\Ÿ, ñM/K&á´aéä[.V¨$πÚ‰ëí\Â*Xá˛\≈GI2†qm\ÎÎÆØGJ˚Cd\◊\Í\ÂÚB˚P…ï;OZ\”Ãí\œc7Ôíñ~ùÇ)Q&æB\"K_::Ö\0˛\÷:I\Z\‚˝5 ∫4n ÖòÇ)g\◊wvç^Û∂\ƒ1ì\Ôú0/©~v˜Ç°¯ı^\Ásæ_üNûH¿>|GM\È\ﬁ!k\‚l™–èXòq˚í\œE@‘´WOn>¸¨\‘\Ó52\’kn\‹$π\„\Îd\ÔﬁΩº6IÄºîÄıGL-EÛCí\Œ8á\◊ö\Ì•´\ﬁñ!@<-e≤ \”{k\„e\Á\Í\Â2z¡J\… xΩjˆt	_ºZ\Ó/W^•\nY6}ú(öø\‹K˙Mö!9s\Áñ/?: \Z?´\ﬁ\Î;)Fr\Áæ\€+SGÕ£\0a <Ç\Î©˜\Àz\“j\◊\◊A˘Ÿè\0\0 \0IDAT\«I˚a≤kı\ny°}\'…ï˚nï\‚\„Ù\…˘J{˘Óã£jWcM\∆»Æ5+•N≥VR †∞O¶A\n¶•æëÇ©≥ ÚY8\Î3¶\◊_|ìGØ~V\∆¡\·\Ÿ}RwùÇ\…\—mØ\€˝¯πÒ=\Í:øëãòj\’ØéâH k	X\\aO±§\nºu\Îñ¿\Õ◊ñ≥.Ú\·˚í\œ	!!!Ú\≈EqXˇA/˜∑G˜êJ˘oJBBB\÷^\ÏùH¿!|ALdÑG\"@F\“3 ´Ø<-Q¨h¶{h,è\Z/û˝Eâπr\ÂQ˝\'m\€$îØ(%\ÀVê/>Ní\◊\Z◊ñf\Z&∆®\»ù\Í˘\‚πs≤iq¨¥\Î?$\≈˚ﬁî\nz>àG¸πu¢å\Ô\⁄>\”\◊UzndÀßèó∑&ákÃ≤\Ì≠ª˜÷¨îIΩC•ZÉF2r¡\n)P(PNw\\∆ø\“Aä\‹\'#\„VHÅ¿@w\Ë!ô\ŒÎøõ7$\“\" ^ä\€,ù_l Ö\n\‰Mi/ÛM{{Ú˜«Ø\ŒÁåµåÄ\Íá/û\›\'tÛ\Ó\»-/\ƒ\Êˆ!ç~3„û®n$ Å,&`à\‰¸éÚ\ƒipá}\…\Á÷Ä\ƒRbõ$ê5¥\0\·L\Ô\Ô≠])ìzÖ™]\À>ZY\∆,^ï\"]\ﬁG\ Nı6\Îù˝ÚhçZ¢ç]xd\‹r)e\'\›LZc∏vıäƒé,[ﬁäSªZ\rg6ih\Ã}YçfÅõ\«˛,W∆µTˆKk|∂üè¢\0ë^dô∫ø \ +jºhˇY\0\„¡\◊+¢\„/\÷\Á\Îq+§``†µˇ´WÆ»ºQ\∆:«µ“†MGß\∆wı\Íô7r∞|}Ë†∫6\Ô/W¡∞Gg\¬|l˘\≈QÄêÒñLz]\È\≈\Ì\rØø¥‹ßq\Ì£\"iíSy˝}˛úl~3V\⁄\r\"øˇ¸S≤\–`π?\ÍÒ\„~ºfvî¥\Ë\÷W\nö\Óõ\ﬁ0?¨{gx#ìØ°f¬ªk2]HJè\ÊMB≠˜L\nô˙›ü:\”D6\Õ0·çó©\›\€à\Ïp5q$@\Ó&ê,@Å\’\›ZÓàºÛ9Ùë\ U\ÂŒí;åÇ@˝áˇN-_=\‚\Óı\ÃˆHÄ\‹H\0_\„U±T\Áæ êä^W\ﬂqT∫º)ùÜåIëzcE\‘Y:9\\ûRÜ\’\Â*5Ñãw◊¨HÒzÕú(˝fÇî,W1›©;\–ﬁîﬁÜ2s\€~©T£¶u¸œüó…Ω: °\›;\Ìé\œ\ﬁ<aÜ\0°\«\ÎÆ/ä1Ùår\„JuS ^™]CJ+bÑÑZ,ıCD\›¯˘•\…\Î3S\◊\À¸\ÂR ∞∞¸}\ÓOµæ\Ìﬁ°\÷˜#\’k:5ækW.\À¸\—aÚ’°ÉÇ\≈%ÀïW◊Öu>nø\›ZS˚\ﬂ~\◊\Ô# \"ª∂s˙æ\Í\Ï˝\◊˚]ªzY\Êè\nS◊à˘\ÀÂπ∂!«©\Ô\Á∆Ω~¥\”Û\—\«\Ÿﬁü\›1~w›ü\—R0ç_\Í˝5 —±Q})T ´¯e\√*Üo¨\€\¬\Z\Óˇä\œ\÷-\‚\Ÿ}\‹+\Ì≠ÜzgW\Ï\„K±/åw\Ï\‚’¨ıñ≠Ø4NéH¿iE\È1†\Î	\0\›!|˚§\0ÅÖX¢t9π3\‡>©\’cÑî|¢ñZõß\'I\“\¬)Ú\ﬂ˘_\Â\Ã\']YØ<ÜH 	ÑÛ!rßOóG	§ﬂÄ˜∂é\Z∏x˛ú|∞%Qf\Íe å\œ`\‡?wˆ\ÈçT2O\€\ÔlííUº-Ç¬ô©∫wóú˙˙elMAå#˛ÓÑ¨èù°åk∂ü9”∂;˜°\0\·Nö\ÓoDã\⁄5§L°∆åVFçWÇ∂2èVV\¬6-Ú\ÕPõÒ˝\ÍK€ÇÕª§ïüß`ä@\n&/\‹püû“´ì∏R[_àpò?j∞lµ\r\⁄vtz6z]{˚˙E\ƒ B\Z5êÄy\›U¢à\Ì∏ß‘ì[8\Œ^\«LN\ﬂ\\∏£\"Äg˜\»W\ÏNI¡∂ıñπ<\¬3/I ∞%põ\0¡îõnK°\Í\◊\Z\ÍAl{wè\\¸Ûwµ\Ó\n.\"MûØ/ÒÒÒºIÄ|ÄÄÒ#\∆l(K˝\‚\Áì\'\‰\Ôs\»{kV\»÷•$f´é@9º˜]ÅvDh+y™AC>Daed]6Qxo•0ëI\Ÿﬂµ´W%n\‘ ˘˙”èd‘¢π\ﬂ\Z!°\…!á˜\ÓRπ\Ô\Á†Dê\·\Ã\Ô\Ÿ%\ﬂyLı\◊yD§t¥Dh\Ï^/S-Q0Ù\ZmW˝æ~o\ﬂ∆µ÷±>Yøëƒç	SÜaΩzä\\¢†áCQ$êõ7Ä\0\—¸\Ÿ\ÍR∫xQ\'\„<\Áø5¡∫fõΩ\“G¶ıÜÅxßZ\€ı€Ñd˘¯úãèJ\Ê≥\Ë\Ìw˝^Äﬁ∑˝|Ú∏L\Ï¨¢\ÿb∂æ\ÔP\‡ÇP1’¥¥A§Dˆ\⁄ @L\\∂^íÜ8/\¬gD@Ñ4™/˜\‰œõ›≥Oò\√\Œ~\Õ\„\Ÿ=\œ\Ó\Ã¡\‰π3\'|\"˘úü˝..ŒàH \√Tî^∑ˆí\√Ùˆñ\‹\‚k7páÉ´\œF@òWfdd§znxrr#\r\…^TñÒ¶°Pˇ¸\›qπv\Âä¸¯Õó †\ﬂÙ\Â^\“kBå:Ü≠´óˇï¡Mj´%@\nä\Ê\ZÜ¨j?\Îg\»n\”ﬂµkW$y\Ï?=(®°pˇCnSå!2<P˛aâèû([ó\∆)#-Ú\‰ˇ˘\Àœ™Ω+ó$C\«\»\œ\ﬂ\¬\‡\÷Aûm$u[µìâ\›:\»\√O>-Ω&∆®˝\Õ˝!\ŒTãw0\⁄-˙¿Éj>V1#\n>=£º˚\Z0à\ZR∫x©eÙ¯˝\¬w\ÌÛ\ÎW/´îdœ∑ïú*\"\Ëñ\\øzU\Êè\Z$Öãïêê!£ï06≠w®4\È\“KzOåñúπ\Ô∂z:\‚x§B+˚h\À\0\‹;>\«ï∂˝8û?àD˚≤v3\◊#3-èÿã\ÁˇT˜\ÓOw\Ôêa\Íﬁ©S0•<ü\◊-€ñ∆©˚_às±y\◊|22ìñ˘F\n¶`%@\‰Kw\ BZ(Ω\ﬂB;óÑw?,x\·\Ë¢É%≈¢\Œ ôúrQß^4˛\Á\ÁFÜH˜ÛâdÑ^	ê@V0\Ôv\Ó\…jFÆˆ?\÷\r)æ)@∏Jü«ë\0	dòÄ˙cN\‚\»\„\«\“à\ÎWÆH\Œ<ydr∑`e¿}aÇ\‰æ\€\Ã¸˝\Á%¨iy≤AC6\œ îΩJD\‚£\'\»Ú)\…\Èfpú=Å¡ÆGóûië\√{ﬁïrï´ ß\Ô\Ìêi}`§\Ì©D ho›úh\’O®2öç∂ˆÉZ\‹\Ë¡≤m\È\Î1JÄ5Xæ9Ùëºæ(A\Â\‡ü÷´ìö\∆ˇÛ\…o\‘|T[a£{Zô∆ß\«Oœ®/Oè6\0¢)\" äıh?∂çc.=XΩ\›sBå!∞vßtñæ\”f\À#\’kâ\ﬁkk/kODΩøbjÑ4\Ï¯ää\‡1o˙¨\ÂñüLùò©≥7∑º+A~ûÇitóv^π≤ó\Âﬁâ5à\‘x\Ê\‚\“gNó“èVëØ?N2\Ó\Áı\ \–˘+T±i≥9ü?\\Ωñ\◊\Œ3-\÷7n\»\‰\Âæ—æa})î?/ûùÆDí•é\—\È:OÛ @?\'\≈2\¬%´æ≥|≠_<ªè\È\⁄\ﬁT\„…∏0ík>Ø¢∆´gΩM\€Úæ,,ßæ¸\\>\€ˇûº≥t¡mS¢~C6Ö\‰\«˝^	h\ÿ~˚i}\Ó®8=›∏EÜ€á†>Ωw®ﬁ≥Û∂y4\Ó\“Szåèñ\\y\Óvy¸i\Õo¸F:˚⁄µ\√Òí\0	xû¿\Ì6<ﬂßøÙ\‡é ¸eµpû$\‡Ö1∂k{ìáîµØ%∑±ˆ2\ﬁ?câÄ(˚XA\⁄˙á\Œ[.>¸àî([Aæ;v\ÿ*@ù∑B˝\–I\ÈÅ%\÷\„Å`\Ãmü[j\Ÿ\⁄\ÌøÉ¥\0Å˝¶˜	ïø˝*as´˝\Õ\„2∑C\Ÿ\‹a§”àY1%B*>UCqF ßo>˝HF,LP\„\’\∆C\\X\”\⁄V#∞©V±\√Ò\ÈÒSÄ\¬o\ZRìyõ§Ÿ≥\’\Â¡bôõÇ	©\¬vØY!Âü®&3˙ø\"\ﬂyTçj\»<\√\›l\‡Ö°k\\oe*Uñ\·ãPºΩ\¬m.¥ªpÙ`˘\⁄\"¶ï(W!\À√ã)@o\›\“#p%XÑcΩZ0√º~\Â\⁄ıï`fª\Èc¢∂æo˜so\·Çà)>$@∏íÇÈ´èìdh\”:)êw2âö∂üõçè{\÷\≈Kî\Â˛É˚\“¡9ªôè\’«§∑ç\‘˙≤\'\‰:\⁄\ﬂ\ﬁXÙæ”Ω`çRÄpvUq?M\0\œ\Ó£\·<\‰  \Ì\“˘s2Ωw\'eò\«uW\œr\ÌÆäö +¶Ü[\ﬂ€ª6^¢˙Üä2\÷Oàëkó/[èõÜk£Z-óJ,8€ø´up\⁄¿=†L•*j|´¢\'»ä)\·\“ix§t2Z9uL\Ìn§@\≈3ì\’a\√\Õ|(@¢$ Å\€\‡;*B•¯N\À\»}üõ#ºmd\Œ(ê\⁄~Hª=2E\np˜ç\œ]\…nàº£\0¡ãñH \Àh/*g`}\Ë¥äò\r⁄∞†\ﬂ\”Få\\wﬂ≠å≠\r\⁄u≤§õ1º∏\·X¨Ñ’≥\€\Ÿ˛±ﬂëΩ\ÔJπ«´*\Ô,∫££t•\ VØo˝û6≤h\ÔÚZÕÉ§ˆKmïßπ \–∆¢Ω\∆V˘˜±¡\ÏÙ\…oîÒ\∆l∞qv¨ÙårñT\÷\Ï\ﬁW43üè\‹ı¸\·\’\Ì,\Ÿ\ àëù€•\"\Ï\⁄\nΩYÛz\Ô˙d3ÆB\‹Gá/LêíUHQ\\˜\ÎOn7b√ì\“S\n\∆\∆<V\≈˜ewÆV\Àk9‹∏yC¶˙à\0—∂a=π\'ük)ò.]8/Qc$\Œ¢V\Ã7êØ?> √ö’±úˇx)a≠ΩîCE¡`{∏z\Õtˇê<sÚÑL\ÌÅ¸2|a\ v3zC*∫Öc\¬\‘\ÿzåG$Y\ÓT\«w\Ê\‰72µî[2|\·*)QÆº¨äû(+ßÜKG-\√F•{~\Ó˙‚òø~´,`D\÷<¯hØxv©\“¸\ŸO1∂:zº¨ú\Z!ÉcóIΩ6oª\ﬁ˚\ÈîzÔ∫ï”∑≥ºÿ•ßt∑\\G∏oVG6π\‰/T8›©ﬂú\Ìﬂï˚\0\Óg—Ω;I˚∞\—\÷˚í\ÓØ\„iÜtÅ∑d\Ô∫â\Èjô[\ TñÆÙk\ÔzüÙ# |Ù\‚∞IÄ<H¿öa#\Ï˜\⁄AVg\¬@\ƒ\›\‰¡\Í∂ˇ˙õ	r\Ÿ\n\ÍvÆ˜õ∂!≤g≠g?Û~\È\niÕÑ˘∫\√¡ïÑ?õ&HùÄˆ¢\¬˝Ro©9¡ò˙\€\„ÚL\„\'\Î/¸˛õ\’¯oOÄ∞M7s\⁄‚ô§\”Õò˚≥óF\∆v<æ≥Y\»\‡—§˚É˜ñˆŒµ æ¸8IÜYDx\ÏBP\–˚ª\"@8\Î@E¬ªØ>-@î2	:\¬E;lµaPN/è∑(@\»H/éÄ\Ó+3ÛFáài>\"@¥A\n¶|Æ•`˙\Á\¬9´\01uãïbk∂Ñ1åÒÉcçH|˛ø´W\‰\ﬁ]ÚÙã-\\˙˝ıæ\ÎÒ£Ç>R.⁄â\‹ ¨\n\rxvôfD∂\‚\Â*à3\\2c|q\Î∑PÄ»º\À>[Ù§{\Î◊ù^\ÎC”∏\Óe	#}#ïÆ(F\Ó ù\«z]Ÿ≥S¶ÿπ_‡æ∞p\Ã`9q\Ë#±◊æ+˝k\\∑ág˚Õå\»-‹≥é\Ó\ﬂ#nIî\Œc&…≤Ò#\ÂK\‰®w\‚\‹hâü\Z.!JL≠\ÓWˆ∆°\Ák€üy¥\r1˜,\‹\'R≥\'QÄ\»ó\'A$\‡f\…6rà.>m≠Md)F\Ì©\◊ÒQ\„M©∏«®˛U\ÍYKm≈û£%W\ÓªE\Ô7\‘RKÙ\Ôs™¨®ëΩuø∏U\Ì è7Ω\Ìª£ˆêO*ˇ£6,4n$@\ﬁC\0_£^6ß\nq\\e7\ÔËæù\’\‡\·eÑá|xû˚ıå ≥z`\À\Î\ÁzÜw\…/ﬂüîÚOTóô∫\ _SÖ)Ø,]¸4˘æÄbº¯as¸\–AÂâõ\ÏâiDN¿\„qª%g-<9\Ô®¢2¨\‘o\€Ij6kï\‚sÙÆ\ﬁSﬁê˘#^U°\ËÚ˙˝ßS\Íoåñ\’\ËæFä|vO\·\"*î[ø\÷˚\‚uJ\œQ=C«º&æµF>j_∏yçkU\Í+Œö\„\≈\n˘:#<ñm{\œ\Ôk@å\Ë\‹\÷˚=GîÇ\0à®âí4ƒª\ÂΩ∑YZøÄàdBO\ƒAÜˆ\Ë>°É\‚\‰∑!@ ö¡\ÿÙÒz—ºé4\ÍOhx\ÁQ)Ø]Ω*I∑◊ü>&^«Éç:5\ÊÒ\‡¯i=Éïo\Ë|ü\'ßé3∑˜ç•oºW^\◊Û\‡u®vY3A\‚M9\ÏÒ˙√Ü˜±»∞pâ\“G=_º2.J\Õˇ∞_ª¡£Uˇ\ÀÙû¡j|\√,c1∑Ø\ÁpÒ\¬9â±∞\“}\ÈπŸé\«\‹~zŒá≠\√\«\¬DF@÷î>xv—•ù]a\◊\”\Î\Õ\Î®kc–º\ÂR†P\ \⁄=fÉ˙æıÒ2£ogu\›w≠oé	ì\À»†\ÿeR∑u\ ‘ê˙Û\„üî!nù\ÌÆ…öÕÇ§fã∂\’3X*<˘¥uk-\◊>Æ≥Ç˜UD∞9∏uÉlò•\Óea ≤\‹\'¶FH∞\Â^Ñ\Î˜=}-c\ﬂÅ˚ªz\Â≤\Ã\Ë™\⁄\√ıé˚\Êëø)K˘úüæïÀΩIÄ¸Å@z3l∏ìâ≠#*\⁄\÷\Ÿ0∑Æì®˜\”Y<t∫N≥S´y\\\ﬁRk\—Æ>!@§µ(\"##\’.\·\·FÅYn$@æA 9å\€Øcs:?O/zFy˜5\0\‚\≈ZH¡TÑäÉõó•\€ﬁì\÷~^Ñz8R0)É\Ï-\…!†\—˜Wæˆ(Bµ\¬7äPCÄ(\Ë0ìæ\◊\⁄˜’Ωdcà≥M¡Ñ£ı>~ˇUÜ.0R}∂\Ô=)˚x´`õÇù\⁄o˚9R0M\Ôià;Ü\0QÒ∂T.Hç#d´~C‰ô¶AÚ\Êò¡jC?‹∫QfÙ\rUF\–rïüî\È=Cî£Aª¡c\‰“Ö?ïq\€\‡y\À\Â\Ó ê\n£kˇòÖ≤f\∆D9˛\ÈG2tR?U∞F\n&=?åw\ﬂ˙ï&lålåçR\Œ8.iÛ:\ÂU\r\„%<\·ˆ≠Oê\rsß´\„\—\∆”™_ò2–¶|B≤=©ü\n\ﬁ˝¨\‡ç£√≥˚pQv\Ô[D-@h1\œ\ﬁ<Ùæ ^±è0≤,6	u¨\Î\€9\È\È-ö˚3ècM\Ã—¢ÑDΩ\È˜µ\0Å˜\Ì\Ìã{\ZD-ºB\\p\‘\ﬂ˜«é®{\Ó5òØûÉπ{≥üJ¬πE¡ΩHÄ¸äÄ9\√FfDíöü∫l%H[≤v¿ıç*UØeM\„m>1∫fíΩßi]kQß\ÌŒ™Zã ,gåÑ_\›S8\ŸlD\0_Øõ\ƒPÅ0\\8m\Ì.ºû\Ã&^}•(¢f5y ìãPgˆÉXVÙ∑úÑeÑW\ﬂ\0D1+}#¢\’ÛıE®]Iâv\È/\√˜Ÿûù2iÛ˚R±FMı=gõbn\Ì\√\‡70vô<›§ï¸Ú\›	y∞R\Âtß`”ûø|w\\y5c”û\“6)\›ˆ≠ãóô˝:´q=\\£¶¨âû nMT˚ÿºVçg\“\€\Ô+af\ﬂPııØd¸a~}\‰Ω™ùÅsó\…\”\ÕZ)\ÍâO™v¥\0m\ZKâ≤\‘¸uˇ\rµxÆ<jæ\ﬂ|t@F∂0R¿†ˇ2èUï%c\√\‰∑”ßRÙo\…\r\√mÆ<∑Òt6Öﬂõ\·\Ì˜\noû›áv6G/\'èû˚£Z‘ë+=Æ\÷q\‰ªv∞¡\–>´_g¡˙\Ô:Œà|Ç\·\◊\Óqø0EL9\√!=˝cﬂÖØ˜óˆC#dıÙ)ˇ\‰\”\÷q b’¥à\€\∆`\Ô}˝^áa\“\÷\"V\‡˛cæ\Ê¡¡Qà™\0á\◊\Ê&\Ê◊é\Ê=}# úY‹áH¿ø$g\ÿ»Ñ¢6±Ä´,5êålFM {µ\–Ù~FVéé¢_óÆÙ∏µVòªj}π≥ùân®=\ƒˇ∫9[*:å[ˇrVπ\ÓLUE˘\⁄uS\‹\·Uã%õ\rD£ö’•T±\"\ÓQúT+T†G\"QÜÜ∂µD>$[\\\r\œæ\÷\◊IVÛ∏q\„¶ƒ¨ÙçÛ\ÁMô\„∑G\n£æ´\›±+@X>á°∑≠ä\’j\ 7üêë\Õ\ÎHï˙\r\Â•>É•pâíCΩ\›$\Ë¶ˆ}é¥G)å˛\Â*X\«˚Òˆ\ÕJ8∞i≠$Lã∞\n#k£\'Ø\ﬂ~_~?}Jfˆ\Ì¨ë≤ïüTm¡@	Éˇ5K\ ÇD∫åEDtH\Ì\“6l¥\\ørEè\rì¿b\≈\’\Áf\—∫?¸QGø\ŒO`JNNQª\‹°\0ë\Õ.2a:ZÄ∞\Á/ÉIX√ªñ-Pı⁄ñ˝tr˛\Ï\œ\Í∂Q∏\ÿ˝\ \”Üˆ1\ŒH¡t\‹\"`\‡>Zlr:4Gf$=]˝π≥˝_ø¸Ø∫¶ün\Z$5_j+1=É\Â!\\ﬂñq¨≥,\"àn_øq§ÇE\—\ÔiÛ\€oöƒïsg~≤\€>C\ƒ\Ëun t\ﬂ\Êß;3\nô∞\ÿ\Ÿ	êÄ\œ0àˆ\…\„\Œƒü«∫¶YGKM \‚\Ãw\«ejw\√!F•¯~®Ç¨ä2jü©\€5j©\Á?§G™\Ôé#\"•É)ÚŒõ~\ﬁSÄ∞,+F@¯\‹}Å&E@Öq√ã*Ûj«Üì¨p\Ÿˆ¿¸ö\Ì\›àû©f ú-\√n±©\∆\÷\¬\ƒ\◊Å[≤r\€ni]\È	©éî+˛µ˝sı∫4öõ(C:1\¬\€\œ<\" f\∆˚F\ƒK\œ’ïÇ˘ÛU\·\Ì•L39\ÿ~~\ÈØÛ2{w Ñ\Õ˚§bıZV\ÂbK\‹Ly\‚˘\∆RºLy1\Ô˜B\Á\“u\\å\‰Ãï;9TBªÙ;\Ÿ?\"(`T\ƒ68\Œ(\ËäÒ_øvU6\«FK£Æ}\‰≥\›\€eVø.\÷q¡êxpk¢∂xn\Ô_øR}é\rF“ÆëQí3\œ\›*\”,‘§∫%Ú⁄º\Â\÷v^õªTj4\rí%cÀ∑ü~d\Ì˘\ÊczY∆¢\⁄.Ø<\‚lπò˚á8l!\À<VEñÑë?~:•˙C\«\Ëˇ\ﬁ˚KI\◊Òv8\Ÿ\—I\Â¸,Ÿ∏çE®Ω˝f\·e\„√≥{Xh[á˙\„ô\ÔN\»\Ã^¡r\Í\Àc2~Û>©PÕ®ïÄ˜w\«/ñvC\√%W\Ó<Ú~bº\Ã\Ó\◊E^\Ì!/èã\‘Bò›∑≥∫Wòè3?ñC`xklò|{¯#ó % ñøm\ŒÙˇ\√\ÁGdLã∫\“~XÑ<˙l}ı∑Ñêı3&\ \Íi∑çCø?f\’;jº\’_l!\Î,˚¢≠6ÉF©yb˛7\Ó=\≈ ñó\„üpÿüû7\rèˆ \ƒà]ñj\rç\Ë\ÂkY\Î\ÕÀÆ\ráH \Î	X3lX\Ï+\ŒFÑj{TFˆ_m\‘SµΩ\¬F´\ÁD\‘;äAΩ£.=•˚∏h…ï\'è™˘â˝¶†6Zçör\Ì\ Y46Lv@Ä∞\‘s\«x\ÏEgd~ì\›PcîYçp$\‡∑1\ÃAYøÖ‚¶âOc\n&7ëÙL3ZÄ∏ÛÚ_\ HÜ\Í¯\Î≥@æ?zX™\·G≠\≈O{¶V\Ã\—›∫Ú´\√#\∆/\‰wG˚z>ö(<Û ôoè´˘∫Ká[π\Ì=i\„\ÁD\œ\\∏nl\ƒ, Z \"_^ófèî*oXR™å7•TA:í7_\Ô/ÉLiZpèÄ\—\ÔUìÁ¥£Nq¸òuî±ç\ŸS\Ãr\0R†Ã∞\Ê>\‡ô¸˛∫Új\Ïrπt˛OµOãæC§F\”V ∞â\r\∆PD9\ÏX2OZÙ\rS©aÃõû\ﬁC;ü\Ì\ﬁ!oÙ\Î¨∆≠\€˘ˆ”É÷π\Ÿãû´?r\—+\√\Íß•ﬂ¨%≤sYúÚ\"\◊\Ã0\ÓÕ±Q™Mlz\‹\⁄\√‹•ì#\"o1ì´\Ë¸ˆ8<ªE\n&\«!PX\œK\«ñ]\ÀZ9¡¿\ﬂe\\åzΩQ\À\‹∆∞rΩÜ\Íö2jG\‹\ﬁ˛ı´W’±\'îAUä\'\€˝å\⁄é˙◊©ûp_:∫wß~?˝£˙{¿\‹eR§\‰É\ÍﬁÇ\Õ\œ2\…_®∞\Í\¬\Êãò\ÿs\⁄<Y3=RgªΩ\⁄S∫åãíúπÔ∂¶\‡HÓØßä∞\“˝\’\n∂∂˚\„ó«§T•\«-s+oäl5?!Ω\≈,g\n&øΩ9q áí\”}”ëç≠\√F_Øéo ∆à™5\÷\√Rl°Q\„û∑zø)àÄ®^Kæ˛(IF47æw\‘{\’j¶p¯π~\Â≤(N:(C\—N\ŸÚYRCr≤2lPÄ\‡\≈K$êeR\À#õeÉ\ &34€ªOd\„yõ§\Ê#\Â$1b∞\‘i\€I¿oÙ	Ua˝Ç”Ø\r#\◊2\…P\ÿ@\Œóào>IR\ﬁzB¨X\Õ\‚±\Ï¢\À<}ïr\ÔNyu\ÓR©\‘Q˝ \◊^É\ \ÿ|{Rx\'˚ÉA\0∆Ü≠¢¯ƒø≥\€\Ôà¡\€(ûHiá=\Ìπn˚˙ÎèçÛ¨7C_\Í&˚÷Æê∫m;\…]πrßz|Z\Ìgu\Èry\√\0^•^C\È6˘\ryÛıW’∫Ej\rπ\”\€^j˚ˇwÛ¶º\·#DsD@\ÿ Ù\›\»\—\›iï∆ö÷ó\Ì~\…\∆=Ey	/z}Ä\’¯ñZ˚fè\‚÷ÉF•hzø≈≥\⁄—∏C®ëÚ\ÂÑ\≈39•±1PÏµ°«ªÛ≠˘jù`k“Ωø|˘\·˚¢\ráïÎæ†\",∞=\⁄Cz¢Ü\Ã\‘\›\ÓP∆©˚´Qúõ\ÓH›éôëˆæ∆æ∏VÉçJg\€IZ\Áü/cÑw?,x\·\Ë\Ï>uÜ\Ï\Â`J_\rÙ\‰\Ÿ9õcâ\Ì[ıñôåÄ¬´ÉC\"\»j*\√Fóv~>2\ÁH\Î˘\né)1}B\Â»û\€\ÈFñ:_Z¸v¥j\'\rµ\‘≥}~\√\Ô\‹7«Ñ\…ÒO™}’õûÒ•5~g?ü\‚W\nY}Ö∞c¯Ç‚†êùcq\À‘£Xú\Œ-=\’à\ \≈d\’\Ë˛\“}Ú#EAëã\Á\œ\…\«\€6\»sª\À?ùS):ÑÒ\Í\‹\ÂR  0≥ÙªEbù\‘n\”G\÷\œHˆj~6($\≈\ÁbÜ\'`\Ì†óä®Ç\◊˝B•Õ†—™X%ÙôÑw1»âÌÅç\‘2¯∆É±ˆ*7ø\Á\ 5ÄÒéë\«\Î>o=‹ì˝\ÈNé\Ì{WJ?^\’\‚=Û˚N\0\0 \0IDATõ˛ë\€z∂#:\'5/˚Ù˜ê|\" f˚à\0\—L	˘Lû\∆zNÅpµàÉ\Í\"\Î\⁄\«ZòmÒê6ügxH´˚Xè\œ]˝SÄ\»\»U\Ïü\«\ZD;K\Õ6\„2\’5€íın]√åü{ä\œLF@¯\Á\»Yì\0	§J@\ÃÒ\ÌÆ\‹\…\ÌL]∫:√©ˇ(@&\»2F7ä•zÆ$Éˆ≤\∆$\·}}ÖJ*˜,r≤z≤_w§¨\…\»¯ò6ÀñµSCÄxºXÄ¨\’_~¸\ÍòÙü≥Tk4Gà¢x+Ú!c{°K/â\Í\⁄Z•@^`]t\„óv|\÷\Ó2\…}˜\›*E¡ª\ÀJÕó⁄´\ÁØW+o\‹Œë\—r\Óó\”2≥g∞\Í∑y\ﬂ09∂oóÚ\ﬁ0w©\‘j\"gø?a˝\„*Ú¿ÉV/\Ê\”\Ê\…Œ•ÛR\ÏÉ“É\Ã\Èo\‰J\◊˙{°Koâ}≠´∫¿.Hêbe\ ;L!ü¥¡\»ç≠\‘#è[˜?q(Ÿã:r\”>˘2iè|¥%QBFOí¯	#\’<∞\È˘m\ÿ{@\⁄T*\Â\◊5 ^CD*º\«\·ôf7ßòÅ\·\ﬁ\Õ˚æ-ıå3ã\€H}&?˝¨\’P\Î\…˛Ùò\–\«˙òâ\∆ı°\“w§3å\Œ\∆5ávêªú\⁄\rã[/˚Ù∑ûÚs6H“êm £«∑à\€,\Õ\Z‘ï.¶`Ú\Ë\‡<\ÿx‚åâR§Tiì\ÿ ÚAbº\Í1YÄ\‡\02©\ÈõX\"ìPgõn\Ï˛jß∂FDò\‰ê[bD\⁄Òu\ÊÚxck@dõãä!pï\‚õÆn\„inhö\\≥Ö\0Qªvm\≈eˇ˛˝\ÕFIÄ<C@ˆj›ß\ÎêHg˛Z#\◊s˛B≤?1¡»°l\Õã>\\o\ﬂ°w\œ‹∞ûY≥\Ój\ƒs\œTìì\ﬁMa∏á¡ˇ\Ÿ\÷!jYAÄò”∑≥\ \‹nhÑT™]_\¬-\∆–†Å£\‰ó\ÔO»¨û¡“º_òTo\‹JñÖ˘\À;èãñ?>-≥zER$»•s*°\Ì\r%Xe¥-[bcd\ÕÙÅÅ)†Ù\Áz<â1\’\Á\ÿ?h\–Hâ\‹Kı¡˘\Õı∏ 8\Ã\È\◊Y\Ó-YJµ/xÙ´\ƒìpb{\Ÿ¸rÚÑ\Zoç&AÚÙKm’ºz≤ÜLr\Ê\…#∫åø`ë¢JÄh;,B>ﬁö(o\«F[«çvWog\n&CÄ∞/a\Z9¥+Å\n¢”≥ñîXˆˆ«πE1MT\ÿÙ˛(\¬CΩZõñ\"û0\‘˜ò6W>ﬁ∂…ö\ÁΩW\ÃBIú1¡©˛Æ_Ω,K\«ëw-π¡u\«?IJ¡¶œìùo%ã`ˇâ+≠\‚ï\'\Ê3ª_gïOª\Ô¨≈≤k\È˘\„Ù)ª\\~9˘çµ=´®W®∞*.ú,@$\Ôg£\’˝˛É\ƒkª(Çä\‰∫£Ø%≤k\È|˘\„Ùè1\ƒ\»n\À˜ø7enÇ˜°Ü\0—¥ÅëÇ)´Öı\Ã\Ïˇ\Ïw\'\‰\r¨}ã¿âu\’˜Á†êl\≈\ƒ\¬\‡\Á§xA\◊j|∏\Î;ë\Ì¯<ª@î]f^êÒ\»…¶\„úM\¬w.\ZéîH \”‹ñ\‚[\Ëµ˝äNqGäoü ¶Lô\"€∑oW∏^|ÒE1bD¶-nvD$ê1*åªS[k\ÍS™r´\'∏ˆw\Âˇƒô\Â¸\Ÿ3FÆ\Á\\yT?ül\ﬂ,%™hı\ƒv•]wè\”\Ì\Õ`nÿå-N\r¢¡\”\’\‰˛˚äà≠°´\Ì\–i5hî¸o\Ï~Ü7∂2Ùü<./\’˝yRbº\Ã\Ì\ﬂE\"6\ÌìÚ\’j ÜïA˛\’8£H)åg\Â,F|TÖ0`gó\…g{v®cµA\r\ﬁ\„∫m\‰áßØ˘sxØù°˙*QÆBäq5µU≠I+Y&\'?˝Hç\„˚£áT;è#rc\Ó2\…[(0\’»£kWØ®\„\ﬂ[æPû\Ì!°ë\—*bI˜èπc|⁄û`\“X\·˝5\€ﬂì∂~1 \ƒq\ƒ?ñuul\ÔNu>¡\ÕﬁÜHàZ0§˜äéìƒôì¨\Áµx\ŸÚ*_?\÷\Œå+Pá#Gé;d—∞>÷µ\Âl\Œ\'\⁄\≈Z9cY\Ôzå˙\\£ø†Å#%.\Ã¡∞\Ôπ_~ñ¯â#≠ØÛ\nTuA0~¨\≈\ÍMÉ§\‡ΩEUz≥∂C\¬\’¯öı\rì\ÍML\¬]d¥†»õæ\Ê\Ãc\–\ÎN_ƒå˝\ÎV™˛s\Êπ\€n_¯c±∑›∏qCbW˘FDì˙u§@äL\Ÿ‘¢\Áá’ïõﬂ°\0\·\·\Ô˚\Ï\÷<û\›˚uÑ\0Å\‹KéfßkÒs˚2\Œg\ÓJF@d∑kãÛ!\»8#\≈w[áéXL\Õ‰∫¢\Ôé\ﬂ>-@¨[∑N(IIIj•÷™UKfŒú)m⁄§ûz \„Àö-ê\0	∏ÉÄ R\‰d±5\0òs\“\ÿ3]¶Ú9Vk¶E${_∫\›51fÇÚ\Ï\∆/\◊f}\À2ã\ÓÛ°=\Â˘\Œ=e\ﬁ¿W§F\” 	\Z4ZyÚ&∑π\\Ú\ﬂ†äΩ\¬vNø.\ \€ˆµ∏)\\¢dävÚ\‰œØ<µ\rOp#\"C}f`~©\œ‹∞\ÓX°ûkD˝ß´I\…˚äX;\—BﬁÄÒ>@†U4∞\'@@p–¢Ä Ùk¨\÷å¯0¨jmôEÉZA!™´=q>7˜Ö\¬W\Ê∂\Ã\¬\»/\ÿ\ÃcFJ%\Ã	©\œm√í\◊Hõ°\·≤nz§O0v§≤ù´n\√\ﬁ˚ Eˆ\Ã\ƒf¡K˜m˜\”|ı˚\⁄Æœ£YÄÄ∏Ñsç¥G\ÿ_cz\Ì\ÿ\Îœ∂}ß7=-û9≠\÷0\ƒr\Êsm¡`\‰\«ÒfÅ\Õ,@@\Ã2{Æß&‹ôØ9[B}7X[Å\‰¡«™ZÖ3\›\ÊòZ|ú/	ç\Î\€I¡d\ÎAf{aÛÛîf^\ \'~3# <˜Mü=[\÷Ñπµó.oá\' ;‹û(@d\œÎã≥\"\»|GÖu6äP\”]∆Ωrã_GéQÇ√ñ-[§AÉjï\ÓﬁΩ[ö5k¶â™U´fl\ÂÚh è\–yduGÓéà\”-x˙b”Ü2\Ìë\nC‘ñ\ÿhe=∏y≠ÚºÖ!\Ì\n\€ˆ\nñ=,e™Vìø~?+yÚ\ÊWmhs\Ï˛\◊3\ @˙…∂\rVOt\Ìkn)¥«¨ˆ*áQ\◊\›Û5∑\«‹∞_æ\Í\0D\È\‹\"˜‹£¢å-áú¯$I\ﬁ\Z˘™ò/b˚\∆¸æsñ\n\“çkYW\Ë[%Iâ	2o@ªqØjc\„\ÃIj}\‚Xl≥{á(#~ßà(%@\ƒZj4†≠£{v™c˚ÃÜ¿¨àq-\Î\›÷∂˛|\„ÃâJ@_ \Ãm\·z\“\«\Î\Î}\‰+TXêRgE\ƒŸΩ|°µØdp9\‰¸Ÿü\’\ÀkóˇU\„≠ﬁ¥ï\‘h\ﬁ6\≈\ÿ!@ò˚7Û\⁄8sÇu\\\Â´\’Rèö\Îv\Ïˆ˚à~¡≠z˛¸s\·º\Ã\Ì\ﬂYp_\Ï´\Œ?\n\Í\⁄Dˇ\Á¬ü\Í\ﬁV≠qK9ı\≈˘ë-Û!$=$\'>˘P\"\’zåêV}`‹Å∞.ct±¥,\Œˆwˆªo\Âç\ﬁF\Í-¨\Ÿsg~NÒz\Î¸≤nzÑÑo\‹\'\≈ÀïW\„\¬\÷o\Œ2’Ø˘uæBÇTS+\"\¬,céóbe+®˝6Ãúdmß|µgRº∂m©ö\"-\◊\≈]˙Xπô/~å\Á¡«™®un\Êì\÷#ˇç7e˛jﬂàÄhTØ\Œ\Ì)ò,˙π\Ì˜∑ı?W˛\ﬁ\Œg\’€åÄ\»–óπåg˜>!mh\ÿ\…bˇ\⁄yÒ\Î2\\\‘ó/ßL$ê\Õ	$ß¯\Œ\ÊÕÇ\È≈∏!√ÜOF@\\∫tIâ˝˚˜óû={¶@ø`¡ô3gé!Ú\Á7Ü\‹HÄºìÄ≠\0\·©Qj\œY¥Ø=xµß+ºmµóµ\Ó\ﬂ\÷^\€H#¢s\€k\—\‚Eü7íÛ}õ=æ!8\ÿz°k°B{{jæhóÑ\'\Èfºm-@\Ã{••å›∏O™VSôo7Ãú(~=##¢\ÂW.+É\'\ﬁ\Ô3gôú=y\‹\"@D\»KG…ØﬂùêŸΩÉ•iü0y™I+Ya‘Ä\Ëaxè\œ\È,ã‹ß¥Hg3æe]i≠å\≈/\‚ï\0°_£\ﬂı\”#d\ÃF#%è˛\‹ B‘∏Ù\Á>7è+Wûªe\Î¸Up\⁄^ä%=Œüæ:fmv9ºø7a±¥.?|~\ƒ:æJµ\Í´y6\Ì°8 ì\Ì¯¥π\\ø?<\·%≤<—®Ö¨\ﬂ¡L}ÉSè\’\Áå±^\ÃE®ë∫˜@\‹˜`¿ˇÛÙè\“=*N6\Œ2R0\rPDyã\Ëd\ƒÙfªvæ3˝ø_	nÖKñRc:w\Ê¥ZﬂàÄ@˚Ü°ÆC\”\‚IÒZG@`¸\Ê1õ«Çv\·\ŒH]Üy\·{¡\‹.¢{\—/BöÙ¨xÿ∂á6¡\Ã\—gé\ÓàÄàÛ!¢@˛|\…{\Ÿ5w°ŒãD∆ø\œ˝≠<ª˜N%ÕüøÒ»™˘Œß\0ëU\Ë\Ÿ/	êÄ¿w‘†–∂í\√qKnÒµx∏£∆®O\nAAARÆ\\9ô6mö›•?l\ÿ09yÚ§$&&zÒ•¡°ë\0	\‡¢ø©X*æ(°=G\›˝\Z\‚0`¡òT£y\Âe}Oë˚§\Ô\‰\ÈP_L\Ëû∏0|¡∑cDî\‰\Ã}∑ú˝\Ó∏\⁄FTΩ=\»\„\“mZ¨¨è\Zßºâ\Õ<\≈‹´<xµ˙°mïg∞ˆ*w˜¸\Ã\Ì\ÕanXØæ¿ @î\ uKäíØíˆ\»˙®H5\ﬁ\«\Í6î>*z P6¡\Ëoyø~ß\ ¸˘>cùçŸ∞Wâ\ﬂ~r@∆∑™w€±0 \œ\Ì\"\Ó-*ˇ¯M≠[¥a¨\Á<r`CÇ\Ã\–Ej¥h+m^´é\Ô={©\‘l¨å\œ8\«`ç7\Ì;T\ÊıµˆÒû\’kàè‘™oÉ˘\⁄\Ë7^\ÁF\ %hWF±á˜\Ã\„Å¿7Ø5?Û\\1¶{\Ô/ewéhCè\Î˛\÷\Ô\‹-\Ì¸ºDü≠Su¿ø~Âä¨å4\"SZ#¢\ÊµQjºü=N\Ív\Ë*˘%∂_ı~\Áq3d\Ÿ\ÿAÚ˜\ÔøJˇ˘Ò™ÜŒâCd|\Àz)é\«\ÌkKG\◊\‰∫;ü<V\Ôy`ëV\≈ ïóç3& âC™\Ë	‘î@˚c\·ÛTM\Ÿ8\"X§zçö∏ó¢›æsó™ˇıÎñÉFJÆ<y\Ì≠\"\'$˝±ÀïW˚ù˝˛Ñ\Ã\Èbwç[™q\·˝éëQr˝Ú\Â\Ì˛Ú\Ìqµˆ∞\Œ[\Z%,QG˙ıâè(>>ZUµqBÛI+ˆ˚\∆\Õ≤`ıFI\Z\“¡´\ÔU(B›∞^…ü\œNëb˝u\Ìh¸<ï˘¶¿£,\‰∑f# º˙Ù\¬¡\·ŸΩg\Z\"∑;\€\riA# ≤\›I\ÂÑHÄ2L 9\≈w˙r0]øvEñç\rìwóøqÕõëB{ô\‰ø\'0≠\0\Át}é\ﬂ]H\ÔjØOÙâZ}\’kzM.©ô˛·¨∏êñHë\·ï\ÕHÄ2L¿ P$\»˝û¨[)œ∂\Èhı\Ó\’^™˜ïê\ÁªÙVûÆ˝˛´’£WèFMÜp`x\√@jˆå\’iúRÛ|µm\…ioêˆ\ƒsœ±uG\À \Í‘®&%äﬁõ\ƒoSç∑TKRìt|éhâ\ÿ>!Rˆâ\Z¢\÷pnU´D\◊˘01^	0?\” íÇ\'\Ì£=>§∫âèK!.Ä¢+Zºñúö«∂\⁄|F\Êg\ÓﬂñO\"\È\Ì§q\ËÄe\Ë5\r¡©ü%\¬\Ô)lzÑ<VØ°äLÿ≥|°\‘\Ì°\"p\ﬁ\Î)ü[ÑWD\Œ@\√fàIù\’g\Ê˜ÒYZ˝BUò\Íõ≈ÇB°≠e]ıûy,zùa<∫måë3á∂mPkõ~OGzÿ∂á#´\Ëg©	‘ºˇ09ı\≈g)\ÊXÍ±™)∆á5n\Ó\€^_é\ÓàÄX\Ë#/\‘C\ÍºLπí\≈)W<ë\Àx-S0π\„+›Ø\⁄\–k@8>\ÌôQcÇÑ_]vú,	êÄì\Ï\÷µ≠πô\ \ÎT\÷\‘\Ì<.JÆ]π\"s˙Ü\ —Ω;%r32‘∫ΩÜßùˆ~˘˛Ñr¿{∞Rï4˜ˇ`˝Jô”øã™Gäö£\«?Níóå\ﬂ=ëõﬂó\nO=c¸é\◊O\‚Èòè›ö°.\Ôé\Z£>ëûÙJ©•irr\Ìr7 ¿D_ÖqkèkLA{}ko\È.\ﬂP\∆2\ÌaoVë\Ôx[äïCûpQ\‡0\ﬁ\Íc≠∆∏®H´ß∏\ﬁˇácü*Cón\∆-l˘\nßh\Á\–;≠F_xö{rãeh∂\'Òf∏\Ì∆±õ§vçß§x\—\"…é\“Z–èxçµ\€\◊\"@ÑG\…]πÛ$\€ˇaﬁê ^\Ì\"=\ﬂ0¢îa\À\≈˛nHê\ﬂ˙^]C\ÍyFD•\Á˘\Ê¿i˛\⁄(è\Ã/µÒnÑ\0Òh)	©^1\√\Á\…\◊\Z¯\Á\Íui47Qzvhùñ>?Oücî\€y›ºqC≠Òçà\Á\Î’ñ¸yÛ©AÜ¥\'ˇ\0\Ã<\÷o\Ÿ.Éüì\‚\ÌD∏¯\⁄\rê\„\Õxv\Ôﬁ°5\…,$≠Z\œ\Zô≤\‚\Ÿ		êÄ/H+\≈wZ1\“∆¢Æ\‹s°=¨i∫Òª6‚•∫™ûËÄπ\ÀT\ aG⁄ødI\›4hî©÷£qÑΩ˛uümáBÄ%◊Æ^ë\Â\·aÚ\ﬁÚÖbõ∫;≠Ò{Úsw§¯ˆ¬ï\”ˆ\nU˚\“\≈√±í@v\'†\Ÿ\È\‘A\⁄#\⁄j\‡∞xÄªÚ9ä\ﬂ&≠èó2UûíÖÉ∫YS\'ifè\Ô\Î◊Æ\ \ d\œm|ˆd\„ñoJ£˜á°\·ﬂø\ŒÀº~ù≠ip\ÔÒ`˘\ﬂ’´ÜW¨5-MÑ4\Ó=H•\‰–ûºM˙Ñ\…˚vY\”⁄®t1\Â*(wW\ÊßT¯\ƒ∆Ø\Â/æÄ @<[\„))Q¥H∫B5ù˘≈è“Ñà!≤◊≤\Îu\Í!¡\·Qí3Oµl~˝˛Ñäé8mI\'\÷\Î∏e∞\À\„¯\ÁØs◊øã|aIÏ≠ÜÑK\‘ÑÀÆ\…\ƒ^˚ Çõw@ƒõ>\"@<áLyi†ˆ\Ó\Â\⁄\Ë\÷3ìk\‡¸¯(<ªw\ÎÄ:CY\Ôv)8ç\n/\Ó\Ô\ÕUL¡\‰«ó!ßN$\‡Ä@ZDZ\‡\Ï	∫(Rn£\Œ\'j\»Èö°?Z~Ok°¿ˆ}-d\ËZ†\Ë_\◊$’©ä\ÕD´A£î#ü<PcQ⁄é˙C{˙x¸mN\Ã«∏£©\ﬂ?˛¯£*:=s\ÊLi\”&ı¬ä∂j›∫u2p\‡@Uî∫T©Ri≠7~N$êâT!;§\n¡Ûø\ﬁlsFÛµK|Xú.≤]Ωh äΩ7YÄ≤\‘ ±\nR|mı∏÷û\∆\Œ¸øi\Ái\Ô\Á\›\€\'G@\Ë\Âi\Î\√◊Ü˘,´¯ bÒZﬂàÄ®_∑∂\»k§`\ *^\\ØûYØ∂2¬ÖØpø>\œ\Ó]\€S\‰\Œ\ÍE∞d5# ≤˙∞ \Ô#†kå∫\Z±õîò†\Í¡¡ê\ﬂ\…RÙ\⁄\’À™ñ!\"Pß\Ó©&-\’\Î?Nˇ(=¢\‚d√¨I™‹´Û\„%@a\Ÿ<w∫lù-\·®cW≠ñ™káZ¢’õ∂íßõ∑S5BQkT∑ˇAbºJ\”m\ﬁP≥¥\’@#ï±\Ó\ﬂQoçzUZáÖK˛Ä\0Ÿµ4NöÙ$\Á\œ¸¨˙©\ﬁ4\»Z˚¥\Î§7\‘x\\ç\‡ù\ÌÜ\Z£>QØ^=yÒ\≈eƒà.≠)S¶\»ˆ\Ì\€e\ÔﬁΩ.œÉHÄ<C\0_ΩB\⁄PÄ˛B\¬3k\÷]≠&E\‹\’$€±ÿ¥s7\Záº˛z@\ƒü t=\\Ú∞ÆF\Ô\„G\¬\Îo^7@<ªsÛıl:W\Ôò%GA$@\Œ∏≠\∆h:=Xí6\ƒÀº˛]§Å ¢Uã^&ªó/î>sñJ-ïM\√\ÿÙ˛®£7\0uÙ ïóç3& ∫\È2v\„>)ØãHã®ö∫s˚\»\⁄¢C\ÀA£T-HåE\ƒ\≈SFù={˝\Âî\ÿ~ù\’g}Q\”. Py¨ *m\‡¯\‚e+®Z¶à\‹@˚Æzπ£∆®\◊GèïŸ≥gÀ¢Eãú_uvˆ\ÏﬁΩª0@*WÆú°vx0	êÄ˚Ö\Ï\‡E\Âª!\–\ﬁ\ZÇ\Œ\‚t\Ó[ßûh	D\Õ\ÍO™\Z\‹\‹K\‡\Ì]~1\'Q^i\‰^®l\Õ\Ì @,]∑IíÜtp{\€\Ól∞E\‹f©[5 òÇ…ù\\Ω•≠ç€∂\À\"÷Äñ\”¡qd¸˛†Ò>ì`≥ \»D∏ø˜CçQ\ÕK®ì\√=Çéñ\∆ˇú?ß¢\">ﬂªS\∆ ™·©öÇƒ±˝∫Hµ&-\Â\‘\ÁG\‰\‰·è§øJ±m\Î£\"eÃÜΩV\‚ƒ°≤t\‰´4$\\£\"•‹ì5¨\ÌH4˙\ÏÉT\·A¡ º¥q\÷DY?=\“:§w\‘\ﬂŸì\'dNüï\Í[µ\—*\ÿzº=\ÍïZ¯\Ã]ôÒ\‘^/@d\‚ZeW$@ôL\0_=Ççfíu˘{\“.?\nôºò\”Ÿù!@<%≈òÇ\…\Ì)®∂PÄP\È1å˚™Æ1£\Ô/|m§8\ÀzH¡¥tùo§`˙\„\‚ø\Èº\√qw_\"∞ægãlUÑ˙ßü~í•KóJŒú9e¯\·;/^î-[∂»∂m\€d÷¨Y\Ë∏(•\ƒÕõ7Â´Øæí∏∏8©Y≥¶”É\›c\'(ïÜ)@duˆI$@û\'Ä˚{_%@ò,L∑å⁄ôVãS*Ø!\Ã\–E\ÍCÄ∞§`˙ˆ\„$ﬂ™û<VØ°Ùô≥Lr\ÊŒ£j}˛y˙G\È\'õfNí\Ô$˝\Ê\«K±≤d”å	Ü\0±qØ<T≠ñú=y\\\Êˆ	ëjM[Iı\Ê\Ìdn\Ô`)\¬\“˛Å\ƒx’ß™=\Z\"r\Îñlö5I\÷OèP\„h;|º¨ù:\∆a\ÿÛ\€4sÇ|≤uÉ†\÷\Ë\«>Mn≥j=:7ı\…üXoH¡t\Ó\‹9\Èÿ±£\Ïÿ±C≠¶^Ωz…å3$ä]¶s[πr•t\Í\‘\…z\‘|†j?∏∫ç?^ î)£\∆«çH¿˚\‡¢{äb©Èåë≥ö\ﬁı\‹xºé©[¥äπaΩo\≈\'è\ƒ3’ûîbåÄp˚i\⁄Ú\Ó\È\‡\œ5 \Ê$\ \À\ÌÇ‹´hR!v;\œ7o\»ràÄp˚\Í\Â\r>∑yªº\◊\‚E/e\÷\Ôøˇ˛ì#GéHBBÇ-Z‘£F˛Ù\ŒÙ“•K&´V≠í°Cá ò1c\“€Ñ\”˚\«\ƒ\ƒ\»oº!+V¸ÜuFÄ¯\Óª\Ô§oﬂæ≤s\ÁNY±b£:M€Ω;RÄp/O∂F$@\ﬁB\0˜˜> \\\‹>\‹` :ıêêà(π~\Â≤\Ã\Ô\ﬂE>ﬂ∑SFoÄ†PSPî\Z\Ôa\Î4~Ü¨3H˛˛\„W\Èãà≤\Âe\”Ãâ*\ ah¸6ïæ)@†LhUOE?<R´æ˙ªæ•}à∫Oœ¥\nVßc-\rx¬á£˛\–ˆ{K\ÁK\„ﬁÉ\’Xóè~MZ´∆Ü6\n\ﬁ{üÙû≥TΩ>Ù\ŒF©\“\ÕE2\"Û\‚≥8Bã°°°\÷(<Ä\Ìﬂø?\›\"é[æ|πıN∑çGWE\n.Ø-HôB\0_\›:ò\" ¥\‡™ıiæ6hx,ZïÒ/àLY~\⁄	àøˇΩÏß≥˜¸¥‘≠*!\’+zæ#/\Î·ü´◊•—úD\È\“>\»\Ìë%,éé\»	AíÒˇoﬁ∏)\À\÷mî^ûÇ\…Àñ∏«ásg\‹˘ØWWè˜\„\À¨]ªVbcc\Âÿ±c2p\‡@è\Z˘]\·t\Â\ 4hêî(Q\¬\„c≥˝˝\Í\Ãx\Ì˝~N\Î∏.\»\ÊÕõ•KóîE*\”:éü\€\'@Ç+ÉHÄ≤\'\‹\ﬂ{´\Z£\È{nˇ\ﬂ’´&{V,º\r\ÃcuJ\Ô9\À$o°\0kªõgNíƒ®¡gÖKñR\«¢B¥ú;Ûì2˛\√´ﬂº\… q˚ rÇF∑òÖÚ˝\·è\ÌˆâAåB\n\'K\—hG˝µ8J>~{≠$≠]ÆR0\râêG™q\ÿ/qñ\‚\÷gØ9K%°\¬.ˇûôø6\√\È3îÇ…ûÿ†˙ J\ÿ\néGbCRRí%Qeçf∞\Ì˚=˚\Ï≥j°4j\‘Hâ(:≠£)¥á	˙;\÷PÉÙ{∫≠\'ûxB=L£\Ê>˚˛˚\Ô’æ∫=xµ\Ë}6ãMGh†ˇq\„\∆\…oø˝&O?˝t∫≈ó\Ïy\ÈsV$ê6|Aºb.ñ\ \0óã)\⁄&~ãW3\"\Ì\»=ú!pÙ\Á?d\ﬁ˛£2?¯ygv\Á>YH\0\ƒ≥\◊g\·\ÿuz\‡!úDzày~_\n\Œ1\ŒL#øs#J\ﬁ+3«ñY\ƒ˚\Ôø/¯Ω˘˙ÎØß˜∑CÄó	ê\0	dO∏ø˜\nv=\"{Rqœ¨\‚2\Ó\‡\Í≤\0°\Ój◊Æù\·Q<PAH-|\’,^òÑΩˆ\Ô\ﬂ_\"\"\"§BÖ\n™\rlHªd>\∆¸Ä¯\ÁüJ˚ˆ\Ìe\Ó‹π\·^2\ÿ t>|Xâ!ÇÇÇ\‘gzéh¢20\Ê~˝˙\…\Í’´\Ì\Èø1n$@\Œ¿rï≥Ñ˚ã`,a\n&\Á!˜Jì\0à4qà}ˇ®\‰\œuóÑ\÷x\ƒ\√=±y\'¿LŒ≠Ä\Ã4Ú;7¢\‰Ω2slô!@¿¡\r)éü|ÚIèGt§óµØ\ÓO\¬W\œ\«M$@©¿˝Ωßπ\∆(3j∏úQCe\‡5ÒÛ\n\¬^§Cz/\ns§É£\⁄\Œ\n\Êæ\Õ\«\ÿF_h1a»ê!)DÜ\„«è+1cŒú9*óß>\Ó\≈_T¢ÜN	eA\–gZJzôp¯Ç\‡\Ê9eqC\œ\—ıüñ)@¯œπˆ÷ôRÄ\÷3\√q˘+ÅÙ\Z˘Q®yƒà≤l\Ÿ2©R•\ m\ÿt¿ ï++\Á.8t\È\»u˝ﬁÉ>({ˆ\ÏQµ\'^}ıUy˚\Ì∑eˆ\Ï\ŸR©R%ı€≠~˝˙\œ:Gc;u\ÍîLö4I÷Ø_/˘Û\ÁWëÚÉñÄÄ\05∑p\·BèﬂÉ\œ=˜úLò0AE∑\Î\ÌÙ\È\”.\Î÷≠ìW^yE\’ÿ∏qc™Nt®ôÅ˝\—˜ı\Î\◊e\‚ƒâ™s\n\„\œ>˚L}é~åßk◊ÆÇﬂ®ˇ˝∑0@≠c@\‘=~è::&oﬁº˛∫,ùû7ßQqG )∏ø˜nmJ\ra*æ¨í\"Òµµw:y,dÑë\Ê	âàh@˙$sl-\ÿF2\‡\n¬É.\“,iB)i	∫ÿ∂æ\n)Åbù* ï\‚\€>uEs∞∞æΩ\0\0 \0IDAT$\‡ß%}°fﬁΩ÷£~JÄ\”ˆW ¸ı\Ã{œº)@xœπ\‡HH@\Î\”Sg!-mæÛ\Œ;*≈ê n›∫%Kó.ïô3g™˜ª\rQ\Ôˇ˜ˇß\nM∑k\◊Nr\ÁŒ≠\"\ÿÒ{Öß¸qª\ƒ\◊_≠äRè\Z5J™WØÆ\⁄\¬¯\Ôæ˚nAj\›BÖ\n)\Á≥®˘;\ÔºS\◊˛\„è?d—¢ER∞`AÅÄÅﬂô?\‡òÜÇ\“>Œü?\ÔPÄ¿P®˙\À/øT\¬Cæ|˘dÕö5jû”ßOW\Œm?˝Ùìt\Ó\‹YçØq\„∆≤w\Ô^%n\‡∏-ZÿùOZ\«pï¶N\0\œÙ|û\Á*! Å\ÏG¿ òÇ\…g6Kmƒ∑Wp\ZÜˇ\r\Z8]<\⁄Q\ràoæ˘¶DFF¶®ëZÅj-,¿3$=\Œ\ÊTO\Ê\ÍLá\'\0\€$\»< 2è5{Ú. º\Î|¯\„h(@¯\„Yœö93ìs\‹\”\·L´\ÊÙ∂:•-~\◊¡PØE	\‘BÄ\0†_£›≥g\œ*~ì&Mî®`;∂7n®ﬂíàD¿oC\ÿ\–Váî\0g5¸ˇ˚Ôø´\ÏcNØt\œ=˜»¥i\”T\€˙s¥Òb√Ü\r¸ñ\Ì”ßè5R\«¸Ú\À/Jx\ËﬁΩªUÄ@î\" \Õa[§\⁄k©\„o\ÓC$@$@Ÿç\0ànal,1\Í∂£Ú¶R|ª\\\'\”ˆ	Ôπí\”\ﬁq∂m\„ÅÒÃô3)\Í4†t\·¬ÖS§LrµDZÑÆ)Å±B\‹\–Qí¡\∆à\Ïv\Î\‚|H %\n\\˛JÄÑøûy\Ôô7\Ô9\Ÿ}$,B\Ì\‹\Œ*¬ûHÅ¥FH\Ôt\Ì\⁄5âééDò£3ÙoJD\Õ\„7ú\ﬁ\›\"u\Í‘±æÛ\ÊM˘Í´ØT4¢*êb	ø-\Ô∏\„ï2)888E\Ì√¥~˜B(Y≤dI\nÅ\¬\ﬁ\Ôgå\È\‚≈ãÇH¥πe\À\’?~¶\∆\⁄\—1ŒùE\ÓE$@$@Ÿã@≤\0¡TKÆ¶Zrt‹õ´≤∞µ^¶˙!Jß&j‘®ëC/\€:∂K]\Áˇ\‘\Ô\Î/≥ÿÅ~¢ä.-\Zòè3ß`\“\Ô\Îvt.Q¥g˚P\Áå\0°\0\·\ÌbnÉ\Ÿ\Î¶\≈ŸêÄ= ∏.¸ï\0=Û\ﬁ3o\n\ﬁs.≤˚H(@8wÜΩIÄ@ÑÑÖú9s™ËÑ´WØ\⁄ P\Àü\√˚\Œ¸€≤n›∫*%\Í;å;V•I\ÍŸ≥ß>|X’õ0;∑ô\Î6†ç¥{ü\€\nà\ÃXªv≠,^ºX\’~®V≠öän\–}\Ÿcù\÷1ŒùEˇ›ã)ò¸˜\‹s\Ê$@Ÿõ\0àÆ\Ì[´\‚…éJ‹∫eW\Ê\ÁˆKb8\‚≥8´# ≤˜\“\Â\ÏHÄH ô\0Æ%\Î\≈\Â–èøI≥\«\ ¯+\Œ;ã	PÄ\»\‚\‡G\›3ìs\'\€S\“°F\"¥ÅﬂúÇ	N_0“£®3\Í=`ªp\·Çt\Î\÷MïF*%€±\Èâ\œ?ˇ\\¡.V¨ò:©êp\ÍB¿\Ë\—bD\ÔﬁΩïHa nÙ\Î\◊O’ä@*¶\\πrY\«˜\÷[oI||º\‹{ÔΩ∑¡€µkót\È\“E™F\Ì	≥Å\Ë§é⁄∫u´J5åh˙˚\Ôøﬂ©Li\„\‹YÙﬂΩXÑ\⁄\œ=gN$êΩ	h\"Ö\¬`kQ\Á\Îî\nåì<ñxCDˆ^æú	ê\0	(@p%ê\0	ê@\÷¯\‰\«_%\Áùˇ\'ïK\‹n\‡Àö±Woó.]íÅJ@@ÄLò0¡jêwDeœû=Ú\⁄kØ)†Jï*vw;yÚ§™\…\0\ÔPÄ\ZÖ®aè¢\ÃHõÑBÕàÜ<x∞*ç®ˆ\Ì€∑Kll¨˛˛˚o%@h\–c;v\Ïò2ˆ∑l\ŸR\Ì=zT	\n)qP£F\r6lò*,#áR\È!<|ˆ\ŸgJ§@õÑDT†HıÛ\œ?Ø˙Ë°áR\Ã\r˚ :ˇÚ\ÂÀ™ù2e\ »¶MõT\ (ÙŸ∑o_)U™îLû<Y	?¸∞ÄRHÅ\√3\œ<#•KóV˝¸\ÔˇS\Z(Rçà©Sß:<54¥H\‚\ﬂ+\’˛\Ï)@pUê\0	ê@ˆ$Ä˚;7\œ¯phpÜ\Z\œP\ràıÃÉIÄH¿áPÄ°ì≈°í\0	ê\0	ê\0	xÑ\0¢û}ˆYk€ï+WNQ\⁄^ß®m\0£{jå\Íà:Ä±˝ÅP5˛~˝ıWA˙]à.>¸C%.¿8\·\À/øTCÜë˚\Óª\œ\Z=†SõSÛB@@°gà≈ãW≈°Q:oﬁº™n¢êä	\—\Ë\—-\–wè=T\Ï¡\‚\€oøUëÅÅÅ≤o\ﬂ>%j<Ú\»#j\€\rs@lDvT≠ZU˝={ˆl%§¥j\’J’Æ\0§aÇ\03r\‰HUı!Ç@\‘@¡là®c1e\ \’EZ\«x\‰\‰gìF)@dì\…iê\0	êÄG˚^∞:	ê@\Ê8|˙w\’\Ÿ%ãd^ß\ÏâºÄ\0S0y¡I\‡HÄ2Ö\0S0e\nfó;±WÑ\⁄\Â\∆x†\ﬂ†\0·∑ßû\' Ø!@\¬kNB$@$@$\‡\rXÑ\⁄ŒÇèÅ)ò¸˚¸g\Ê\ÏYÑ:3ißø/\n\Èg\∆#n\'@Ç´ÇHÄH ´	PÄ\»\Í3¿˛IÄHÄHÄºä\0Ø:~9°ˆ\À”û%ì¶\0ë%ÿù\ÓıêViı\Í\’*ù7pÖ\0W®Ò  w†\0\·Nöl´~˝˙™\0Wj[ΩzıT/n$@$\‡L¡\‰äl\√	PÄ≈≥ñΩ\∆L\"{ùOoû\rS0y\Ô\ŸA}\÷\€|†j\"p#ÅÙ†\0ë^b‹üHÄH¿\›(@∏õ®á⁄É\0q£b-©\›k§\›ˆ\«Míˇ˚&âÑá¯≥YG˛¯\·è\Áôsæù\0Æä¨&@\"´\œ\0˚\' Å\ÏC\0\œÙ\›k=ö}&ƒôê\0	ê\0	¯¥/˘dj\n>wmq¿$\‡Û}Aú={V•ÿºy≥\œœë {(@p]d5\nY}\ÿ?	ê\0	ê\0	ê\0	ê\0	êÄªPÄpI∑C\¬√Ä\Ÿ<	ê¿mlø  <\…¡É’æ∑n\›\"5»ñ(@d\À\”\ÍSì¢\0\·SßÀß\ÀL>}˙8x   	˛ò\‚õ>±49H Å¨&†à&•§u\Î\÷V\·\„j’™ï$&&fı\Ÿ?	xÑ\0è`e£\È @\"∞∏kÜ∞uÜÒ`	L¡\‰ßâÉ$ \»f(@d≥\ \Èê\0	xÜ@‘¶ˇg\ÔL¿Æö\⁄ˇßDf•®d\Ë\Â5&2ÑGÒ\'Ø9dHô¢à\ÃBdû\Áy*c¶\ÃSíY\ÍE°åô%4¯\Í˘_ü\≈z\ﬁÛúŒ∞\œ9˚<g\Ô}æ˚∫∫\‚yˆ^˚^ü{\Ì\’\ﬁ˜w≠˚m7ûzú}˛˛§z7`ù?~yn™VE ¶œûc¶Ã∞ù;¥èÄ52°\Z	HÄ®FØW¶\œ *\√]wÅÜ$†\"\‘\rI[˜Åø	HÄ\–HÅHı6fÃòºlö6mjøˇ˛ª;/ıö≠∂\⁄\ Fè≠üãÉ\Z?K\‚ ö\'ı\ÔBî\ÁÅ\«¥ÆæBÛU\ ;Pî˝•˘DÛI1\„sÓéá\⁄O\Ï•˜v}ß\ËΩÙüo\›bû#}\Á\Íª\∆\«J4~ä˚æ\Î¸ˇ∂µ\Ó∏\€:µkï7Êîî$@$≈ì\Íáà@®\“k\Õ¸Ú\›4{¯Ñ\ﬁˆ\Õ;o‘ªèv@Ñä]çâÄàÄàÄàÄà@\ŸhD\Ÿ–™aÅÄTÑ: ®Jü¶\"‘ïˆÄ\Ó/\…\'êmûAàxh`o˚ˆ\›ˇ	™ë¸ÒP\Õ=T\n¶jˆæ˙.\" \" \…\" \"Y˛ToD@D é$@\ƒ\ƒk b\‚(ô)1&êoûy\·\ ¡ˆ\·c∑\€\ÏŸ≥]/kkkc\‹[ô.\Ÿ	®µFG•	åü2›ö6il€∂¨¥)∫\¬	l3\‚i{°˚ˆ	Ô•∫\'\’M@Du˚_ΩÅ(ê\0/∞!_`ï°X\„\…c\ÎÚØhRßàÄà@=A\Áô\·√á[ˇ˛˝mƒà\"(â$ \"ënçUßTÑ:VÓäµ±*Bk˜\…xD@D L:ID@D†å$@înòM\r˙\¬8a\ﬁ[mâÄT\Õ3\’\·gı2?	˘\ÈåÚê\0Q^æj˝$@h4à@Ú	HÄHæè\’Cà:	Q˜\–?ˆ)0G\…Là1\Õ31vûLïÄàPq™±\"HÄ(ö.)äÄR0ÖMâ@¨Ù\ÈW≥n¨lñ±\" \" \…\" \"&˛T`0&éíô\"cögäs\ﬁ‘©S\ÌêC±£è>\⁄v\‹q\«\‚\Z)·™ø˛˙\Àz\Ë!ª\‡Ç\Ïõoæ±\√;\ÃhÕõ7/°\’\‚/•6»î)S\Ï\Œ;\Ô¥∆ç€©ßûZ|c∫RDÖ¿\Î∂u$@h0àÄàÄàÄàÄàÄ$ÖÄàòxRÅ¡ò8Jfä@å	ôgﬁΩ\Ôz˚Èßü\\`πIì&÷¥iS[dëE¨Y≥f\Ó\œK,\·˛,ΩÙ\“\ÓA-Z∏?≠Zµr~˛˘g\€aál°Ö*â\÷?¸`W\\qÖ\›}˜›Æ\Õ=ˆ\ÿ\√N?˝tk◊Æ]\—\Ì˛ˆ\€ov\‹q\«\Ÿ–°C\Îµ¡=ˆ\›wﬂå\ÌVRÄ \ÿ\ÔΩ˜∫˛˜\Î\◊\œ^˝u;Ò\ƒ\Ì¢ã.≤.]∫Õ°îgÕöeGqÑç9\“ŸÇO\‚vHÄàõ«ígØà\‰˘T=Åj%\÷‘ôÆ\Îù⁄µ™\Zç\Z5≤FfVK\‡&.Gê¿†äP\«≈õ≤S¢I \»<\”\ËÉW\Ïñ[n±\È”ß€å3l\ÊÃôˆ˝˜ﬂª?û¸ÒGõ={∂àˇÚ\À/F@ü?øˇ˛ª˝Ò\«\∆j˝yÛ\Ê1;¡bïUV±=z\ÿy\ÁùW⁄ºÒ\∆mó]v±\’V[Õæ¯\‚∑QÒ`˘\Âó/®ΩÙì?˘\‰\€ˇ˝mø˝ˆ≥î,ñ§∂ã˚\Óª\œˆ\ﬁ{o«†î\„ˇ˛\Ôˇúùßùvö\’\‘‘î\“T®\◊z!ßm€∂°\na≤\À\’a	°5V	E@\”%EP\n¶¢∞\È\"àÅ[«Ωg}7W\n¶X9M∆äÄàÄƒûÄàÿª09¯Í´Ø\Ïé;\Óp´\»\r\Zîúéï°\'µYQ=j\‘(ª˙\Í´›äz\·\"@Ñ%tŒù;\◊{\Ï1ªˇ˛˚\Ì\≈_t©ÉÆ∫\Í™@ù˙\√\›Œãˆ\Ì\€◊ùˇˆ\€o[œû=\Ì≤\À.≥\Ó›ªj\'\€I*\Ïx ∏üm\ÁC±7¯Ë£è\Ï\÷[oµ≥\œ>ªdÇ∂\ËÛı\◊__Dò\Ïr˘o˙\Ï96a\ €π\√ˇ\∆W±˛\÷u\"P	\≈P\”5\≈P\Íb®\È\Zà°éóød≠àÄà@2HÄHÜC\Ì´≤	^x·ÖÆ›É:\»N8\·[|Ò\≈CΩOjc§±9Í®£\\6ÆiJ\ \'C√§⁄π\Êökl\Õ5◊¥{\ÓπGD\‡7§\0ën˛π\Áûk\Áüæu\Ï\ÿ—•*\Ê¢\œ/A˘Rér	s\ÊÃ±ìN:\…\ÌπÚ\ +K \ﬁ|ÛM∑\‰¡Lº\06ªR∆áÆÅr?e∫5m\“\ÿ:∂mY\Ó[©˝*\' ¢\ Ä∫_$@TÖõ\’Ià4•`ä¥{˛g\\%É1ATíôO>˘§≠¥\“J∂\Œ:\Î=Ñä\ ˆ\Ì€∑§vÛ]\\Æ4%˘\Ó\◊\ﬂ#<\‹u\◊]°\œ<ÛåK¥\∆\Zk\ƒM(vWzû!≠\”\⁄kØmÎ≠∑ûç3¶\‡>}˚\Ì∑v¯·áªb\Ã<Àô\“@±ÛÄ∫\r\◊]wù-µ\‘R\œ*@Ãü?\ﬂ	&CÜq;86\€l3\◊\ﬁkØΩ\ÊÑ~èxˆ\÷[oπ\ZgúqÜ;\◊˝˚˜\œ*D|˜\›wn∑O¶\Z\ŸjUº˙\Í´ÙÖ:ÜfG\«Ygùe\œ?ˇº\ÌπÁûé53\“œ°p4\œ\ƒ%ó\\\‚vö∞KÖ∫/ºÇu\Ó\‹Ÿé=ˆXw=)Ø8H©5zÙh\◊ˆ˚\ÔøÔÆÉm#\Ê˙∫\Zæøø˛˙´\€Y¬≥ó\ \01xƒàn\'\Ã+ØºbªÔæª]|Ò\≈÷∫uk\'\‘fb7i“§Xx\‡Å%ã;@] \" 1$†L1töLÅ	HÄ(òNùÄäPáé¥<\rV:0Xû^E£UÚ\ÿ˝ı◊∂\·Ü\÷\ƒjlÚ\Ÿp#=Rπ	Öë-á\0Å\Œ<ÛL\'6IÄ¯6o\Õ\Z\Î\“pF«º2Ù+S6œøÛ\Œ;∂¡∏îBÙ9éÙ&\Ô\„\È◊á-@Lú8\—=ÙP?~º˘\‡?s|\Ôõ√á∑ˇ˛˜øNà†\ÊÛ\À7\ﬂ|ìsÛB(A˙ùv\⁄\…#ß|Å$8∆ék[l±E›Ω3ı˜ús\Œqı2Gé9\Ê\„\ﬂ\ƒ\ZjfP(¸\“K/ui´\ÿ∂\›v€π\“˛˘ß\r6\Ã	 ¥∞•NGÀñ-\Ì©ßûr∂!*\–\€\n¸qWÑÛ\È3\¬ˆ\Ó∫ÎÆÆ\¬L\ÿ˘\Âw~P\'!c\·Öv?[t\—Eù\ﬂIMw\ )ß8¸Ò\Ó\Z\Íz,ª\Ï≤∞\À«∫êÒìzÆR0KN◊âÄàÄàÄDçÄà®yDˆàÄà@ıê\0üKÄ(ü£XπÀüÖZ\»›Ñ\\Ù\'ü|≤mµ\’V.xV\ŒCDat\√ ;+\√	”∂à\ å\“\'XGzP#Ñ 6¢E©®πg\–úõ^á\·\”O?uzvl≤\…&Æ˜\Ì∑\ﬂ\ÓvU ^z\È%ê_r\…%ü8¿ˇ	¸\Á ∏éq\ŒNvò§¶}BT@x{¯·áù\0ã0B\r\ÓM∞üc⁄¥i\∆˝u∂\›v[˜3\“G±\√—Å\ÁáTuà0Ùyõm∂q\Á . d¨æ˙\ÍuE®”Ö?ˇq>vam\\~˘\Âu\œ\‚∏q\„\‹nàkØΩ\÷˘5Ωç|¨ÉéüÙÛTÑ∫Xr∫.,J¡Iµ#\" \" Bc@D@D†\“$@T\⁄\Ô/\" ®N#HGäV\nSgÄT%\ŸVQsûGy§K1\¬J\ﬂl;%≤Qh˙Ün∞/ø¸\“ˆ\ŸgóÎûïƒ©Dü>}\\;¨6\ﬁoø˝åUÀæ¢\»#è<\‚V≥¬õ \ﬂ\‡¡É\›JfÇê˘Œ°ICˇ∏û∂H¬Å-7\ﬂ|≥≥ì\’—©\ÈY“±r/“≠|dÙO<\·Ñ§Ω!\Ëä]¨4O=áZ§}πÛ\Œ;]P§\ !¯IÄï>≥⁄πyÛ\Êu∑#MLz\Ë!;¯\‡Éù›¥ÉXÙ\”Oªk®@!c\ƒÇìÙ/ıg4ˆ\Óª\Ô∫ﬁè>˙®[9[\ƒ%l\·û?¸Éªg˙u%ßX^\ZïyÜ±C\⁄¸∂\Ó∫\Î\Êe\…\Íz\∆.¢\·Zk≠ï˜¸ \'î\"@,∞\Áπ\ÁY\ÂÉ-}\‚»∑\"=0èh¡A\⁄\"v04n‹∏NH\"@dª\'Û]\ÔﬁΩ\›3å\Ëì…Æl\Ìø¸ÚÀ∂\Âñ[∫ù\ÿ\√\\ò*\‚eWÛ	§©:\Ì¥\”\\;m⁄¥\…\Ë¶Lm\‰b\ƒ◊ôŒë\0Q,9]°ã§\⁄\…G@)òÚ\“\ÔE ˛$@\ƒﬂá\ÍÅàÄƒùÄàòx0*Å¡ò\‡*\ LÇ^¥9XÒK∫ƒÖlGÇ@=˘V≠Zπï\Ÿ5˘õ@:\"˘\·Y\…<s\ÊL$ï á~\Ë\ƒÇ\‰›ªww©KX\Ã˝\r\Z\‰“ïêÇÖ@\›M7\›\‰\ÈA\Œ˘\‚ã/\\;ÿÉ∞¡äcV2ì;…áO1[\ƒùúKzRü ñ§§`!\‡H\‡q\‡¿Å∂˜\ﬁ{ªÙ)¥âm˜\›wü}ˆ\Ÿg.\r\‚;J6\ﬁxcóÇÖˇ&K>w˛ü\‚ü˛π\„∞\ÿbã’•ZA† pó\Ì∑\ﬂﬁµá\Ìàæ5vê™\≈à,}Y1\ÌFMÇñ¯ì\‡4ˆyQc£ç6r+\»Y©\Ì\œ/j$\‰¢(\Õ3\‰¸G¨cL\Â:9´\„ªv\Ì\Zö\'Ú	\ÏXmµ\’l\ÂïW^`FLç9“âÜ\‘20`Ä\€5¿≥TÄ\‡˘\‰zû\‘\Áπ\„˘\‰ô+EÄ@h$\≈ª#`óKÄ`7F*_\Óª\√;ÿ≥\œ>\Î\ÊëÙg®XbØΩˆrÛG6_f≤1\ÎbÑàb\…È∫∞HÄã§\⁄\…G@E®Û\“\ÔE ˛$@\ƒﬂá\ÍÅàÄƒùÄàòx0JÅ¡ò +\ LÇf¨\“\'(ˇ\Ôˇª.^Tcfˆ\∆o∏U˛\‰F_nπ\Â\\*Ç•\ÿ%I\⁄\'\Ôm€∂≠KSí¯§†+\ÈMÿôAq\ﬁ\‘@$\¬\ÈR$\Ê;áÙ-\ZŸ©@\‡îk\ÿA\—^ÇÙà§[I=0n∫\È¶ `4\‚@j\‡ﬁßk\Ÿq\«]øRPd\◊B¡J\Ï@4!òH0ïÉˆ8#Ñ ™¿\«\◊g\Á Ü∞ã¡ô\ƒ~GN{\Ïb∑´£π7ÅVr\È≥\ÎÅ<W ˛\Á\⁄(\Õ3\ÿ\¬!xü\Ì\‡yb<∞kÜ\’¯\Ï\"\Õxc\Ã\"{\‰ ®;¿éD8ƒÅÙL\\ã8∆ò\√F\ÊjpMMMM^õ^8ˇ¡¨+®\Ì\”\Z\—WR\'q\"@|Ú\…\'ıR:1?Ò|êj\’UW\Õhó\ﬂ%¡NÑ;ˇ,>˜\‹s\Óe\œ;¶®ô”£Gèzs\‘\n+¨\‡Æ\√7<\Ô\‘w¢J˙N~\«NåW\\\—ıüyä\ÎØ¯4]Ä\»«∫XˇKÄ(ñúÆãÄà∞H™ù|$@\‰#§ﬂã@¸	Ù\ÈWìWq¸{™àÄàÄDïÄà®z&ÕÆ(cÇ¨$3Iw\ƒJ}\ƒÙ/¶AÇ\·cM\Õ\„û\⁄N¶U\¬>I1XÇ¯©ı\‘\Z˛®]@†}¬Ñ	uA˜l\Á§eG+ô	ìèæs\Á\ŒN°\r\“%•\Êá\œ\◊\ﬂLÅ{R\Á¿ç 0+¥6\“WF˚˛àE\ËÒAL\“¡∞Úô¿.ª@zı\ÍU\'p^z\rà|¢A`vi¯¸ı\È˝í\0Ò?\"Qög˙ı\Î\ÁD©è?˛8\„Pd˜+\Â©\‡Sh˘\Á\Ÿ\∆2ªè®Äÿµ\‘RKelü`=c¿tªñ|™3\ƒ\Ëo\Ê˘\‰†nÅsÄgå#á]\÷Iù\ƒ\ÔISÜmÙ\rQëÒ\«ün\ÕÉ@x\–A9¡é\Ï®`èØáÄ∏Ò\‚ã/Z∑n\›\‹\ﬂ¯/\€A\‡û\Áá\Áõ∞ëH\ÏxBê£\‘aH\›u¡=nª\Ì6ª¯\‚ãÎÆÖ\œ9¢\œ(\œ=mëéâ\›G\Ïvz\Ìµ\◊\‹(¸Gz9v ç1\¬.ºBªÎÆªú¿K∫9\Ïô<y≤ô`B\€˛hﬂæΩ´OÅØ\ÿIñ\Œqë1êçuæy,\€\Ô%@KN◊ÖE@DX$\’N>J¡îèê~/\" \" \" \"P*	•l†\Î£l†.WÙ6¨h&ày\Õ5◊î,@¯\’¯ô\n\Á |Äû†!¡øx¿•nÚ?\'GñZ˘\Œa5Òú9s‹äeÇ|\‰\◊\' JpÇ\›√áw´èÉô˜>•ı0fR@6õ\0¡jfø2ö˚yaÇ\’\›\Ï\Ê@8 \0\Ïw.pN±m≤\“€Ø\ﬁN\Ìüàˇ—à\“<C–ü:\Èªrºµ¨\⁄\'®œÆÄÙc»ê!uµM\“G∞úÄ>ıE2	˛ô\‰y\»u∞3Q\À\Ô@\Á\" (0ˆy\ﬁ\ÿµ\Ã2\À\‘\’F!\–\œ¸B¿úBœààà\0ôlD8H≠ìBüS\Î«§⁄ô´Ü	\Ìê\Í\ƒ˜õ]<_>m!T\",0G¥h\—¬ô\≈N\ƒX\ƒ_Éë`Î≠∑v&~@L6lòu\ÿ1j\‘(\'†# ëFç˘fßùvr)\Âg\Ÿ%Å\ÿB\⁄-¯ìZéπç6Kz:t\Ë\‡\Óì\Œ{s±2óe:GD±\‰t]X$@ÑERÌàÄàÄàÄàÄàÄTö¿[Sg::µkUiS\Z\Ï˛\ƒ®\⁄[\À\ Œ∏Q\n∆ÖY)væÛ\Œ;nGA\¬bü\'ù\‘B=	∞qXELXi•ï≤¶`ÚÑOèD\0—ß]°\rÇÖ¨2&ò\»\nbR(\Â:\ÁÎØøvÖü\ŸY¡ÇÄ	˛Ú\À/\Ózä¯≤Rôt,<(‰πßˇù:uZ\0}#hò∫KÑï\—\ÿH-\rR±\‰\⁄%Å\0Ç‚ô∞\‚õ\Î|]Ñ\ÓM \”\ÔEÄ¿^ÑÇ∞¥O\n©Tq&u«à\ÁK¡jVç≥Úõ\¬‚§Æ\"8\ \ÍˆL\"I±˛é˚uQögX=\œ%Ø£t˘\ÍNî~ádµ \"Y˛åco$@\ƒ\—k≤YD@¢I@)ò¢\ÈY%\" \"êl í\ÌﬂÇ{GtVÿ≤2ó\0,©ÄXµLNsV\Œg;X\›\Ãu\¬Y\…œ™ˇÙÉsXy\√\r7\‘˝äB\»\‹\Á≤\À.s©K¥Ñ\'O†}∆ånUÚfõm\ÊDV\'<$ï+ê}\—f¥\‹}=Ö\\\Á∞rò\›Ø&E\n\¬\ÈP∞ç\⁄ÿâòëzPø°#ì\„\≈äIì¬Ö¿>´ø	ˆ\”&\\H\Îƒä\ÌÙ\›<˙\ﬁm∑\›‹µÙõ\‚—ì&M™+‘ãH\√N∏ L n¿ôz\Z§ú\·<Ãà;§`\·D\r\—B+\Ë\Z\»e\œ¡äiVûì\Ó	&\Õ´æ3\ÌV)x`\≈	1tZ@ì%@ı\œi\”gœ±	Sf\ÿ\Œ\⁄v°\ŒÅêHÄ	§ö\…K@)òÚ\"\“	\"{*B{™\" \" 1$ \"ÜN+ß…§%!òO1[“Ö∏&(û/={ˆlW´†]ªvY\Ï&\Ì©IHCQgv Pºñ¿7¢)üH;CætÒ˛g§\"\·† -Awv\nê\‚Ö(l∞A]nzRó\‰:ÇïˇoΩıñKo¬ÆÜ3\Œ8\√\÷_}\◊>\ÈN\ÿ¡=¯\Ô=ˆ\ÿ\√\ÂdßôøªÅ\‡?ZwÑ\0\0 \0IDATäe≥#ñ§Ta\'¢\0\ÈS2U¸1q\‚D\'Ù X¥i\”\∆\Ìd \ÔøœÖèB1av@êèüùà‘∞¿?kØΩ∂g∏\¬ªë\»aSÑ˙\∆è\¬\Ô(fKzôX˜\Ó›ùhÇHD\€ÿÅ É(\‚Û˝ós\‹E±\Ìr	àI§\“)\‰\–àBh\Â>ó\ÁÑg\‰ã/æp)è®_°CD \⁄\∆OônMõ4∂ém[F\€PY{*B{™\"êóÄàºàtÇàÄà@ô	(Sôá\’|πÉaŸßv™èÄj\'$\œ\Áa\œ3\Áúséª~¸ÒGó\‚ã\"\ƒA	AI\Â>/Ω¶+¢ùØ\Ô\Œ]‘äàÄà@\\	HÄà´\Ád∑\' \"8+ù)\" \"P*B]Æ°∑\Zv`0t\’`\’ê\0ë<óá1œêåîW>¯†K\rF≠vî∞\Î$=\≈W.Ç í7æ\‚\‘#•`äì∑d´à@)îÇ©z∫V\‚A@D<¸$+E@D \…$@\ƒƒªac\“Uô§5\"mÖÇI•#˛Jôg^}ıUó~\Îı\◊_wÇ¬É?¯jè∞#\"\Ëq\Ï±«∫¥hævG\–\ÎtûÑA@E®√†®6J!†L•\–”µ\" \" ©$@h<àÄàÄTöÄàJ{ \‡˝K	ºÖNÅ¿R\Î;p¡Áööö¿\◊\Î\ƒh(fûπˆ\⁄k]-jod; (~Ù\—G\Ó8\≈÷óXb	{Ò\≈_£E , \¬\"©vä%†\"\‘≈í\”u\" \" \È$@hLàÄàÄTöÄàJ{ \‡˝ã	lZßâÄàÄ#P\»<C\—a√Ü\Ÿ\Ôøˇ^o∑C&îàVΩzı\nD˙ëGqE–ü|ÚI\€q\«]£ìD L ¬§©∂ä! ¢j∫¶J¡T5]#Ò\" \"^˛íµ\" \"êD b\‚\’BÉ1\Èí\ÃàÅ†Û\Ã\€oøm≥g\œ\Œ+<§vÔ®£érªdVXa˜ßm€∂náC\Í1i\“$ó¶â\‘K={ˆ¥{\ÔΩ7bÑdNµê\0Q-ûén?%@D\◊7I≥LE®ì\ÊQıG$@–ß_Õ∫B#\" \" # ¢b\Ëªq\–¿ y˘uàÄà@1Ç\Œ3\‘z8\‰êC\\⁄•\‘Zπ\Óâ\ÿ0o\ﬁ<˚Û\œ?\›\ﬂ˛:vG,¥\–B6˛|˜˜\ +Ø\ÏjI∞\√BáTäÄàJë\◊}=	\Z\rE@DCë\÷}D@D@D@D†z	HÄàâ\ÔÉ%@\ƒƒ°2S\"@†{˜\Ó6t\ËPk›∫µ≥¶\–y\ÊÚ\À/∑\”O?\›\ÊŒùõWàò5kñ-≥\Ã2ız˝\„è?⁄à#¨Mõ6÷≤eK\Îÿ±c®\»0ì\0°QPi *\ÌÅÍπøR0UèØ\’S®Å∑¶\Œt∑\Ó‘ÆU•Lh˚≤‡∂ëÒ≤\⁄øy±7,40X\Ï}tùà@ı`2\‰\ÿt\”Mç∫Ω{˜∂yk\÷Xó˛É3Bxe\Ë\÷xÚXK:˚ˆ\Ì\Î\ÍA0ßfõW\„4\ﬂV\œPO≥ê\0°±Qi *\Ì\›_D@íC\‡\÷q\ÔY\ﬂÕïÇ)9UOD@D@\‚@@Dº$E@\ N†GèÆﬁÇ?ñZj)[wØ˛∂’ëg$@p2iï∫u\Îfc∆å\…x≠à≤ªS7ë¿Ù\Ÿsl¬î∂sáˆ!∂™¶D 8	¡Y\ÈLÅ\‹TÑZ#DD@D@\ZûÄàÜgÆ;äÄDî\0uR≈ÅÖ\Z7∂\Œk5}O¥¶ã/Y\œ\Íl; ROzı\’W\›Nä©Sß\÷˝ò{ P\ËF`¸î\È÷¥Ic\Îÿ∂e∞tñI@)òäß\ÀD F$@\ƒ\»Y2UD@J@)òb\‚\ÿ\\)ò.\ÿ`ÒòÙBfFâ\0˘¯\…¡ü\Ô˚º|˜\”\Ô+O`°&\€\Í[\Óh{\\6ºû1A¡µ\◊^k\'ü|≤˝˙ÎØÆ∏¥à\ ˚UàÄàÄà@:°÷òÅ\‰ê\0ë|´á\" \"u*Bu˝cüj@\ƒ\ƒQ2SbF \Ï\È\›\ﬂ~˚\Ìm\·Ö∂\'ûx\"fddn5P\n¶jˆæ˙.\’E@Du˘[Ω≠N ™\”\Ô\ÍµàÄDâÄà(y#á- b\‚(ô)1\"f\ràu[¶ä@^*BùëN(3•`*3`5_G@)ò4D ˘$@$\ﬂ\«\Í°àÄDùÄà®{\Ë˚$@\ƒ\ƒQ2SbDÄÇ8õn∫©=Ú\»#Æv√º5k¨Kˇ¡{QH\n¶aê©\"∞\0	\Zï&†\"‘ïˆÄ\Ó/\" \…! \"9æTOD@D Æ$@\ƒ\ƒs b\‚(ô)1\"–Ω{w:t®µn\›\⁄Y≠y&FŒì©e% ¢¨x\’x\0 @\“)\" \" ÅHÄÑI\'âÄàÄîëÄà2\¬\r≥i√§©∂D@2\–<£q!ê\0°ëPi *\ÌÅÍπøR0UèØ\’\”\Í%pÀ∏˜¨\ﬂ\Ê\ÎV/\0ı\\D@D†\‚$@T\‹¡P`0\'ù%\"P<\Õ3≈≥”ï\…\" \"Y˛åco$@\ƒ\—kÒ¥YE®\„\È7Y-\" \" \" q\" \"&\ﬁR`0&éíô\"cögb\Ï<ô*	°\‚TcEê\0Q4]R	Ea\”E\" \" \" \" xk\ÍLwvßv≠\n∏*ﬁßRwï ´µµµµ±\ÈâÉ±qïÅ\ÿ:œ¥j\’ ñYfkﬁºπµh\—\¬Z∂li\À/øº˚C=âVX!∂d∏@@Ñ\∆A•	HÄ®¥™\Á˛J¡T=æVO´ó\0´N˚\’(Sıé\0ı\\D@D†$@TÇ∫\Ó)\"yAà?˛¯\√fÃòaø˛˙´Õù;\◊¯ˇ?ˇ¸\”\ÊÕõgÛ\Á\œG\›5&⁄ÖZ»ö4ib/º∞-≤\»\"÷¨Y3˜gÒ\≈∑9s\ÊX«émÉ\r6∞}ˆ\Ÿ\«⁄∑oy>2∞zLü=\«&Lôa;w–∏¨ØG´ß ¢\ÂY#\" q&†\"\‘qˆûlà+	qıú\Ï(+Å†\ƒ\Ë—£s\⁄Ò\◊_\Ÿ7\ﬂ|c”ßOwæ˚\Ó;˜\Á˚Ôø∑Y≥fπ?ü˛π,æ˛˙k˚Ò\«\›.ä˝˜\ﬂ\ﬂ.ø¸Ú≤ˆQçãÄà@åü2›ö6il€∂åÉπ≤QD@D \¬$@D\ÿ92MD@™ÑÄR0\≈\ƒ\—ac\“]ô)\"Pïög,é;\Ó8ª\„é;\‹â#FX\ÁŒù+@@∑Å\Í\"†L\’\Âoı∂:	HÄ®Nø´\◊\" \"%*B%o‰∞•RÅ¡ò\‡ëô\" !à\¬<Ûüˇ¸\«∆åc£Fç≤n›∫Ö\–+5!ÖP\n¶¬ô\È\nÅxP\Íx˙MVã@!$@BKÁäÄàÄîÉÄàrP-CõQñ°[jRD B¢2\œ\Ï∫\ÎÆNÑ¯Èßü\"DG¶T°Æ&oG≥ØJ¡Mø$\—*	IÙ™˙$ı	HÄ–à®4	ïˆ@¿˚G%0\–\\ù&\"CQög⁄∂mkõl≤â=˙\Ë£1$)ì\„N@D\‹=˚UÑ:˛>åKîÇ).ûíù\"P<	≈≥”ï\" \" \·ê\0«≤∑•¿`\Ÿ;´àÄTÑ@îÊô°Cá\⁄\—Gmøˇ˛{EX\Ë¶\’M@Du˚?\nΩó\0/\»H	\…£z!\" q& \"&ﬁãR`0&\»d¶à@Å¢6\œ,∫\Ë¢6d\»\Î”ßOÅ=\—\È\"P\Z	•Ò\”’•ê\0Q:Cµ \" \"7Ç>˝j\÷®	C_ÿç£,\Ãzù-\"Qõg\÷Yg\„\œ<|≤1A$@$»ô1\Ìäàò:.Üf+Sù&ìE@D@D@D f$@\ƒ\ƒaQ\∆õ\Ã(Ä@\‘\Êô=z\ÿ_|aoø˝vΩ–©\"P:	•3T•ê\0Q\Z?]úÄäPg•3E@D@D@D@ä#\÷‘ô\Ó\¬N\ÌZ\◊@Øj‘®ë52≥\⁄\⁄\⁄\⁄ÿòµ¿`l¿\…PÅ¿¢6\œP\‚â\'ûp\"ÑhH \Zí∂ÓïâÄçãÜ\" ¢°H\Î>\"P9∑å}\◊˙\’t®ú∫≥àÄàÄT!	U\ËtuYD ?Å®	ù;w∂Iì&\Ÿ‹πsÛØ3D D\”gœ±	Sf\ÿ\Œ⁄áÿ™öÅ\‡$@g•3K#†L•Ò\”\’\"*B/\…FÅ§ê\0ë4è¶ÙÁ´Øæ≤;\Ó∏√ö6mjÉ\rJLOˇ¯\„;˚\Ï≥]\Œ<ÛL◊ø8IıK>ƒ≠\ﬂQ N8\·ªˇ˛˚m\Í‘©˘P\«˙˜Û\Áœ∑>¯¿Üjõoæπı\Í’´¢˝ô={∂ç9\“Fç\ZeW_}µµh—¢,ˆdö\◊\‚ˆÃîå\Z3?e∫5m\“\ÿ:∂m)\" \" \"P	%\·\”\≈\" \" !P\n¶ 6DQ\ÈÛú9s\Ï\»#è¥a√Üπ”ó\\rI{Ù\—Gmõm∂	ry¡\Á¸Ù\”Ov\‘QG\Ÿcè=f\'ûx¢ù~˙\È∑\’\‚,@¸¸Û\œ6p\‡@ª\Ôæ˚\Áó\\\„%é˝é\⁄<Sà\0Ò\◊_9qn\—Eç›≥ˇ\ŸgüŸÄ\Ï\Ÿgüµª\Ôæ\€ˆ\›wﬂäNEW\\qÖ]s\Õ5∂\Êök\⁄=˜\‹\”`\ƒ\Ôøˇ^ïsEEù≠õãÄàÄàÄ$ûÄàƒªXÅ\»P\Í»ª\Ëo£Ç\ÌÖ^∞\›w\ﬂ\›\ƒrt\Î\÷\Õ\ÓºÛNk›∫uêÀã:\Á∑\ﬂ~≥\„é;\Œ⁄∂mª dQé\…E\’Íó∏ıª\\Û\Ã\„è?ná~∏j\ÔπÁûÅGm!¡{⁄é´¯¯˝˜\ﬂ;\·aˇ˝˜UÄò5kñç1\¬<¿¿\‹9\··Æª\Ó*HÄx\ÊôglïUV±5\÷X£†{•ûïgF)òäv°.à•`äô\√dÆA@D\–tâàÄà@®$@Ñä≥|çï+0X.ãY\…J\  jÎ¨≥Nπn≥@ªQ	^5Xácr£jıK\‹˙ˆ<s\Œ9\Á\ÿUW]e¡9v\ﬁygWT:\ËTÄ¯\Êõo\ÏîSN±	&∏ÙEq\‹˝T.\‚\Âó_∂±c\«:>ÖÖ\nåuv†Ù\Ì\€7ÑäP2Ztn9(S9®™\ÕLTÑZ\„BíO@DÚ}¨äÄà@\‘	HÄà∫á˛±/\Ï¿`πª˝\Œ;\Ô\ÿ~˚\Ìgˇ˙◊ø¨ˇ˛n\«\"ã,R\Ó\€Z\‹æeëT´_\‚\÷\Ô0\Ê“Öı\È\”\«z\Ë!#-Rmm≠Ö\ﬂ9˛¯\„\Ì≤\À.<* \ﬁ|ÛM=zt\÷k∏m\÷\‘\‘\ÿ˘\Áü\Ô˛ñ\0Ò7Æ3f∏˘w\√\r7,òI!>æ˜\ﬁ{ç\‘M\\óÑ ?¶:±LTÑ∫L`\’\Ï$@hPà@Ú	HÄHæè\’Cà:	Q˜PàyÛ\Êπ\›\Áû{n]“ä\\~˘\Â÷≤eˆbä>•fDªv\ÌrZ&®K°\Èn∏¡æ¸ÚK\€gü}\\\‡ë∂SæAYë˚\‰ìO:1Ñ\’ÿã/æ∏≥â\Zè<Úà+∞˙˙ÎØª∫ÉvB	Å\“ \Át#µ\Ãgú\·r•s=m\„¿ñõoæ\Ÿ\Ÿ˘\Ì∑ﬂ∫Ù0p°ôé\Ôæ˚\ŒN=ıTW¸ïÄ\Í\¬/lÎ≠∑û\Êe*\Ã\n_\Óù~Ù\Ï\Ÿ\”n∫\È&[j©•l\‚ƒâv¡\ÿ\”O?\ÌR£`#v4i\“$\Ô\»Omøc«éÆ0∂`Ñg\Í\œ˜y¯\·á]≠~O∞πyÛ\Êu,RScej\√\ﬂœ∑ãΩû	lût\“Iˆ\Óª\Ô∫{ê\„üT>ˇ˛˜ø›ò\Z2dàmπ\ÂñvÒ\≈\€Í´Ø^◊ØR˙\Ó\·û¯Ç\⁄%\ÿ\√\⁄u\◊]\Î\∆H°˝ˆ\ÌÊ∫é±\È˚}Ù\—Gªö&\œ?ˇºK_ñ⁄øº,\‚ÑRV⁄ì˛\Ëç7\ﬁp|º\‡\Õ\‡g<ßÖ¨\ƒg\’[oΩe~¯a\÷\ﬁ<˜\‹sˆˇ˜∂\Ì∂€∫qóOÄ2œ§>oå-\∆\ﬂ˚\Ôøoávò´Q¿∏N?_\Ìµ\◊^n\‹#ä\‰õ_8ëÜ1çh\Ê\Ê\ \Ì∑\ﬂ\ﬁ\Ì#•cAÂ£è>2û\ÌIì&\’˝\Ã\œ3ô\Ê\√?ˇ¸\”\’\ƒ¡¯∂2¡§\–7Û%6|¡nNc\Ï•÷Ä\»ˆLq˝˛\·á\\\”˛^i•ï\Í\Ê@\Ïgû=\ÔºÛl\”M7u\Áeö\◊2âvπ\Ê\∆\"Üy†K$@¬§ì\ H@D\·™\ÈzîÇIBíO@DÚ}¨äÄà@\‘	HÄà∫á˛±Øî¿`•∫¯\À/ø∏\08xÇ\»\Ó≤e\€	$0Hpˆ¨≥Œ≤V≠Zπ` iK¯õ`mœü?\ﬂ’Äò9s¶\‹bã-\\í†¡∑\Ó›ªª\‡ Åk\Ó7h\– \Ëß\Îißù\Ê˜òÉúÛ\≈_∏v∞a\„\ +Ø4\ƒÇÖ\ÿy\›u\◊\Ÿ.ª\Ï\‚Ç∆ø˛˙´;Cá]@à!X\Àı´≠∂ö\Ì¥\”N.ÿâX¿5+¨∞Ç\Ó=¯\‡ÉıÚ\€\ﬂzÎ≠∂\›v\€Ÿä+ÆËÇΩ0∆ñ\·√á\€Fm\‰\“—∞Öî40\'py\»!á´\ mÇ\‡aG¿øk◊ÆuóêoüU\’-Z¥p|	<#ûl≤\…&ˆ˘\Áü;,∂\ÿbÆØ\À.ªl∆ù)O=ıîF{aÉ>H%e?£©∆çª±≥\€nªπ6aÒı\◊_[\ÔﬁΩ≠Gèé\ÌG\·\∆\0T\Œ£Ô¨ºG!`∫\÷Zkπ1\‚¥-∂\ﬂ˘Æ3fåÛB\Œ\…\'üloº±c\ÀØø˛˙A\‹VÙ9\≈\Ã3¯Î¢ã.r´\Ìså\∆`\–c˘\Âów~\Á∫L©ónª\Ì6«ãq@–æTÇbˆ˛y#ec!êgÚ\–CuAÙcè=÷é9\Ê\'\"z\Ë˚\Ì∑ùH\∆Û\Ìµ\◊\Êú_\Î<S¥…ºµ\ƒK\ÿ<\‡ûáK/Ω\‘ı;◊à~~Gå˘¢àügÇÃá˘j\‚ à!ú2g\"~Põvº\0ë\Ôô\"\Õˆ˙\Á1é7ŒÆø˛z\'z2\ﬂ\"&\‹r\À-Œùô\Êµt\"\◊\‹X\ Nã|cPD>B˙}π	HÄ(7aµ/\" \’CÄ†Oøöu´ß\√\Í©àÄà@\‰HÄàúK2TL`0*]#OjS©¡©b\Ïcu5+Ü	`-∑\‹r.Œä]Ç∂ó\\râ-¥\–B°Nœ≠\Óâ7\ﬁx£,r¯†\¬Å}v,l\Ãu+z\Ÿ\—@∞\·Äk|±]Ç◊à”¶M´\◊MÇ\ \Ô˝\n`ˇÀπs\Á∫ ;+á)ã`@\‡è@7A∂|©|^z\È%\ÿ%hà\‡¿\Íg÷à\Z\È«Äú∞¡NÇ|á\ﬂÕ≤Ú\ +ª\‹\Ós\Ê\Ãq´“ªt\È\‚ \ÿ¨\'¯\œ¡jxDêàô\Ï\œ∞§\œ`˝8\…vNzq\\\ÓM0ö˛bC©}gÃ≤\ÍAÖÄ/ÅS¶¨Gå)¶\ﬂAy\—oV”≥\Z\Í(dû\Ÿ{\ÔΩ]qcV\Ôß\Ôv\»d/;I¯Ç˙«è\Ô˘ô\∆A|\∆ªS¸sûOÄro\ƒVß¶sbn@@\‰CEh\„Ye\ÓÒ\¬jê˘ÖyÜ¢\‹\ÃæFÛc≠_ø~\Ó\ÔL\œLzãô\”˚œò\ƒ~_\√¡?√à>¯ãg“ãaπ\Ê\ÊºL}ı\¬`zZßL}LˇYæπ1à?ã9GD1\‘tMò$@ÑISmâÄàÄàÄàÄàÄTíÄàJ\“/\‡ﬁÖh∂¡N%EÄú†.\¬bX§%aE-A±Ù#W–é\›”É‹æ\rR\‹x°Ñ’æ©ÅLÁêÜÖU\√ˇ	™“øŒù;;Ñ\0:it\ÿ5k\÷,Pw\Ôª\Ô>\'z¨Ωˆ\⁄nU5B;8r	¨®?Ë†Él˜\›ww\"+ç)˙\À\ŒVTó¬õ{ø\¬.@9l\ÿ0k›∫µ[\Èç]g≥}	÷≥CÅ@=‹Ü Xñ\⁄w\ﬂ/xí\⁄\'˝(∂\ﬂAØ\À$º\ZD%ûT\»<É\0H\n9Hì∂\Ã2À∏C¨˙\'M\ÿ\“K/m|Å\Ì∞\√N\‰a\◊ªu\ÿ9C\Í∞lª>óÀ∑\⁄j+gBòD∂\Áç ˚{\Ïa<´àÖ©i\≈<á Û;°nø˝ˆz\Èç“Ö\“ D1Ûa∫ø¸\\¡|\„\≈6\ŒIò\”Ú=S\Ÿ\∆,ª\“/\Ã\ÿE\ƒN%ø´\"à\0Å-π\Ê\∆B\∆_!\ÁJÄ(Ññ\Œ-	Â†™63P\n&çÅrxk\ÍLwãN\ÌZï˚VëiüÖ∏$˘Ø\r≤j7*VåäÕ©vh\"•Årø\Î†;≥˜|[AÉv\‘ \Â	¡∞\‘¿!Ç¡.j9\‰;á]\Ï@∏`ß\ÈWHEC\–\ZÇƒ¨î&ERêÉÒHÑï\«)Iˇì- J¿a\0ë¿◊∏¡LÑRT˘∫A\ÏH?á\0%ªEHEùÇ∞¨¯ˆ˜aG´ú˝}¸\œIÉ“êÑO\≈SJ\ﬂS\ÌG4Û´\¬=õb˚Ù∫8∞`\'\r¢Oê˘î\’˝¨∏ˇÒ\«\›ŒÜü˛\ŸH\’F-\0Ñ	Rl±€Ü¥K\Ï\‘\…v¯Òî-5Sj}íb\∆|∂\ÁçÁì¥`§j\√\ŒlDæπÉ˘%}O±D&°4\◊|ò\Œ#˝æ©Û°∑ëü!N\‰z¶2çY\ÍJPß±	qïùS§ä+TÄ\»57\„\ﬂ \◊HÄBIÁîìÄàr\“U€©TÑZ\„AíO@)òí\ÔcıPD@D z$@T¿\'±)∞JÆÙ†;2ôIêãï“§˜!ÅwR!&∞*?=(òæ2⁄ßG\"mèO+D3_{\Ì5ó6hÚ\‰\….ÖRÆs®C@\ÓtvVê≤\—!ÇùUπû\’\Ÿ\‘Xu\’U]pûU€¨\Ï\Ó‘©\”›£˛5*¯=\Ì˙\‹Û\Ÿv¯:ØºÚäKIE≠êá4D†\Â˛p\'\Ëãr¿X”¶MèRœ∞ÛÑÒÙ\√\Ô™˜A|AàÒ˛ ùÇµH•ìMÄ \rM™f\n¶R˙\Ó\Ìe>irs\Ï,a\'œ®Q£\‹\ÓÑïB˚îW\\?Ä\À\Á\"H\r§\0z\‡Åôrb9v@∞\À)5µcäU¸<§0\À$@ô_®ã@™µ\‘[\ﬁ~vÒ|˙1\»s\Ì≈ΩÙ>3¶≥E\"uÛNj*)ûE\Ê2DTv©\‰õOHóïöÇâπ\—“ã†≈§`\¬\ﬁ\\sc1c%\»5\”gœ±	Sf\ÿ\Œ\⁄9]\Áà@\Ë$@ÑéT\rf! BCCíO@E®ì\ÔcıPD@D z$@î\Ÿ\'\…(0L`ûî+\‘A ÄDä†\\EC\ŸM@@èk∏e\nês+\“)l\Ìv∞C\‰≤\À.s˘\Ë	Ç\'\Œ*}_∏u≥\Õ6s¢)A*PßÄÆ/úL![\ÓO¿\Ã\◊4\»u5 \ÿ\Ì@Òj\nxº\¬ùm¨\Ê\∆Nƒå‘Éº˛æ0s∫∞â\’\·\‘†06\¬}C$ÒiI}Dê6æ\Ë4\¬6s Ñ∞:õ &\"\n´ñßLôRw+\“V±™°É4VCÜqˆ¶ò\Œ4<(∏ç†Äê¬äk/4p.´\¬	ò≤j\€aéøI£\„wex˚S˝ÚÈßü:!	Qä∂	\Ê\„Æe\Ïêﬂüb∏\‰\‚G\‹\Ÿ`É\r\\põ\Èª\ﬂ]ÇØ:®Aüñò\Õ\÷˜L5`‘ßOóVá¢¿\Ï$!µAbœè`4˝gá\nºä\Ìwê\ÎH\ﬂEø\”w\Èî˘\—u\œ—º5k¨Kˇ¡oı\ \–¨Ò\‰±.ΩX¶cÎ≠∑\Œ˙;\Œ≤K¢\ÿ> Ç\Ã3>¯ˇ\ﬁ{\Ôπ1I¡uû|¬∏b\‹∏ßuªv\Ì\Í\Ì˛	2w »≤sâ\›:\Ï∫jﬂæΩQ	Ú3á±˚É˘É˘Ñ±ÃòG `\ÃÛ¸˘yè\¬\Œ\Ÿ\ÊC_·áù\‘ °fF˙é\ÓçX¿ú…≥à}\Ã¡õ›∫us\Ì#æ\Âz¶òˇ¯=528ò√òoIKG_(hÕ≥Cz;˙Lò\'ôØ˝º\∆‹ëiÆ\»57;^tùDù¿¯)”≠iì\∆÷±mÀ®õ*˚bN@)òb\Ó@ô/HÄ\0IßàÄàÄîïÄR0ïoxçó\Zœí¸-$ L∞¨Mõ6.∞Ka!\◊¡äY“õ¯Ä^∂˙≤H˝BPéÄ:5Ñ“∑\0C4\‡ ¿\«\ [\ÓO0\‹ˇ\ÃR%pO`ç\’˙\€oøΩ˛\‰ˆiÑB\Ê:Ç†iEhì]\r˘|\Œzî\Ïà\‡¸7ª\Ë_¶É¥K∂•o¥Iü\n˙îB©˝\"ïUœû=\ÎâæMrµà\'\Ì	©^®è9\“	ò\ÓπÁûÆèY\…\Õ\Í~\n{\Á⁄ô\‚W\ÓìN\nª\“S:ë”û6\ÿ1Ä\œ	å≤*û@æß\⁄/î¨à&\–\…\Œ\nhOü>\›˘è@/y\„\Èã?^}ıU{Ò\≈c\ƒVh3|*Ñ\⁄D,\»\÷˜L+?˘\‰\'¢®e\«b¡r\Ì\ÿ\≈.vrFºÒm\”o8\Á∫˚	st\Ë\–¡ı\r{\Z\‚cû˘\Ôˇ\ÎÙ§UJ=3à\Â:Ç\nA\Ê/@0~ôc|±hv%ëÜå\0Ωük|\ (\ƒˇ\Âõ;`¿X\'@è\»ƒº\„\⁄Û<\"\÷RÒã\‡˝Û\œ?\Ô\Ê21\∆?Ç#˜\ÁúlÛ°üg(\œ<¬Æ%R\ƒeöáÒª1yòø\·Iáˇr=S;\\\«\0Ñ>Ñ\rv\n1óÛ1úÒ|3o”ü\‘yÅ˘ë+\“\Á\n\⁄\Ã47ñ≤õÆ\\\„PÌäÄàÄàÄà@\‘HÄàöGdèàÄT°éâ\œ\√∆§´2≥	d1bÑ\€q@Jôj?ï®gÄ∏QçGòÛ\¬¡s4\∆Öå\Ÿ\·á#W\—˜8\ÿ/K\'†L•3T\" \" \" \—  \"\Z~ê\" \"P\Õ$@\ƒ}Éøv\0\0 \0IDAT\ƒ˚ac\“eô\Ÿ\0>˛¯c∑Çö\"\“\’~ê:á\‘a¨.gey5\ÂògH±\√N V\–KÄ®\∆Q\œ>´u<˝ñ$´ïÇ)Iﬁåv_îÇ)\⁄˛ëu\"	aPT\" \" •ê\0Q\nΩº∂Å¡4_∑ä¡\ƒ&\≈\Ã\Êõoæ@J•àô[vs®Ú\‹s\œŸé;\Ó\Ë\“7U\Î°y\Êo\œ˚˙\À-∑úKaVÆ\¬\Ÿ\’:\Œ\‚\–o	qR≤mT\Íd˚7JΩS\Í(yC∂à@yHÄ(Wµ*\" \"úÄà\‡¨*z¶É≈Øõã@U\–<cYkñ®\ﬁ@U<uùî\0Q]˛ébo%@D\—+…¥ID2˝™^â@*	\Z\" \" ï& ¢\“xÇ\“i\" E\–<S4:]ò0 \Ê\–vGDùSìïÇ)¶éì\Ÿ\"P\0Ç>˝j\÷-\‡\nù*\" \" \·ê\0.œ≤µ¶¿`\Ÿ–™aÅhû\—PÅø	HÄ\–H®4	ïˆÄ\Ó/\" \" \" \" \"	aë,s;\nñ∞ö0\Õ3\Z\" Bc \Z$@D\√≤BD@D@D@D@D†toMù\È\Z\È‘ÆU\Èç≈§ÖFç\ZY#3´≠≠≠çâ…¶¿`l<%CE æ$@\ƒ\◊w≤<\\\⁄.OµV8	Ö3\”\≈P\n¶\‚∏\È*à•`äì∑d´àÄà@RHÄHä\'\’ÅP	HÄß\Zã1Å\È≥\ÁÿÑ)3l\Á\Ìc\‹ôg \‚\ÏΩxŸÆ\"\‘ÒÚó¨Åb®u1\‘tçàÄàÄîF@Di¸tuô	Lú8—é8\‚ª˛˙\Îm˝ı\◊/Û\›\ \€¸\ÏŸ≥m\‰»ë6j\‘(ª˙Í´≠EãÂΩ°Z/âÄàí\Èbç¿¯)”≠iì\∆÷±m\À\–\⁄TC\"êâÄçH>	\…˜±z(\" Q\'†LQ˜\–?ˆ)0GÖ`fíà+Æ∏¬Æπ\Ê\Z[s\Õ5\Ìû{\Óë\0\¬¯(gög\ IWmãÄàÄà@Ù(SÙ|\"ãD l \¬&™ˆD@D@\n%†\"‘Ö´\–˘\nV|ôo;k\÷,1bÑx\‡Å9\ÔÙº2õ[TÛw\›uW\Ë\ƒ3\œ<c´¨≤ä≠±\∆\ZEŸ•ã$†yF£B˛&†L\Z	\" \" \" I! \")ûT?D@D æ$@\ƒ\ƒw\n\∆\ƒQö˘Ú\À/\€ÿ±c\ÌîSN\…ye\–Û\nº}Éú^\‚∑\ﬂ~≥3\œ<\”˙ˆ\Ì+\"D/jû	¶öä5°éµ˚aºR0%¬ç\ÍÑàÄDÇÄàH∏AFàÄà@Uê\0˜+0G`\Êå3¨ˇ˛∂\·Ü\⁄Èßüûı †\Áp\Î=5l¢∂∂\÷\ÓΩ˜^#ΩmkDx\Ó\‘<Kµo \‚\Ìø$XØ\"\‘Ib<˙†LÒì¨ÅRHÄ(ÖûÆÉÄà0(6@\nÜy˛¸˘ˆ\‰ìO∫¢\»oºÒÜ[Eø\›v\€\Ÿ‹πs≠Kó.∂\Ôæ˚\Z\È}\Œ9\Á\'|Ù\—G÷≥gOõ4iR\›œ∞ÜZ\r\\pÅ=˝Ù\”÷ºys;Ë†É\ÏÑN∞\≈_‹æ˙\Í+ª\„é;¨i”¶÷ªwo∑Zü{\Ó∑\ﬂ~Æçü~˙…é:\Í({\‰ëG\Í:\∆\œO:\È$=z¥∞<ÿñ\\r\…\Œ;˙\Ë£\Ì•ó^rˆpx;øˇ˛˚:\€6ÆºÚJk÷¨Y]˚øˇ˛{]€¥Ò\ƒOÿµ\◊^kÎ¨≥éùu\÷Y\∆˚\„è?\ÍùÛ\ÿcè\ŸÛ\œ?ow\ﬁyß≠æ˙\Íˆ\Âó_∫>?¸\√\Œ6˙s¸Ò«ª˛˚c\Í‘©Æø=Ùê|¡Æ˛\Ì ¿äk:v\Ïh˜\ﬂø\Œ=˜\\;\„å3\Í˝å∂\ﬁ}˜]ª\Ï≤\À\Ï\—Gu©ñ\ËÁÆª\Ó\Íl\·û?¸Éªej[·çí\ÍlIÛLu˙]Ω^êÄçäJê\0QiT\œ˝UÑ∫z|≠ûV/	\’\Î{ı\\D@¢B@DT<ë\«\√q‘ºyÛúÄ®@\–}˘Âó∑ë#G\⁄aáfó^z©\‡#q\ƒ.8\Ów&∞Å\ﬂmπ\Âñ\ÓgpÄùx‚â∂\√;ÿò1c\\∞ùÇÀúCÄ¸¡¥\Ì∑\ﬂﬁµUSSc\ÔºÛéæ_t\—E÷Ω{w#ç\–q\«gm€∂≠ª\œSO=eGy§\Ó˚\0}¶Û>ˇ¸sCD ∏\·Ö\⁄\¬/\Ï\0ë™i‹∏qÆ\›EY§4\ﬂv\„∆çm\‡¿Å∂˜\ﬁ{€¢ã.ÍÑäª\Ôæ\€\Óª\Ô>˚\Ï≥œúà\¬˝O>˘d\€x\„ç\Ì\‘SOuˇM{Ùóˇ\ﬂdìM∏\œbã-fCáµeó]\÷	à\ÿF\ﬂiŒàæ5vêr\ ˜è\rà5W]uU\›\œ\ﬁ|ÛM\'Lúw\ﬁy∂\÷Zk9˚º®±\—Fπ¥UpımÑ3:‘ä\Êç¯õÄçÑJê\0QiT\œ˝%@TèØ\’\”\Í%@–ß_Õ∫\’@=®8	wA0\∆)\ﬂY\Ôøˇæ~¯\·v\„ç7∫ïˇ~\Á¿˛˚\Ô\ÔDÜLBÇ \ÿ¡¿n\0\⁄)§\rvD ^d∫ˆ§◊≥ù˜\¬/8Ä\›\ÿ¿á≥\œ>\€ı¡˜-ù\‚@j\‡~⁄¥iŒûw\‹—µ\«˝˜\⁄k/∑k°Å·Ü∂ˇ˙\Î/\' bp\–\ﬁ>˚\Ïc\◊]wù€ùp\…%ó∏~!¯s\'\ÿ\≈\‡àL\‚øC\0\¬.v;∞Ñ{\”é\Ôæ˚Œâ:à<< ÚçÙ\‚~Øy¶8n∫*y$@$œßq\Îëà∏y,æˆ*S|}\'\ÀE@D@D@D .$@\ƒ\ƒS\nÜ\„(‹∑\ﬂ~{]0ºX\¬[3{ˆl5jîkèù¨\‘*bî*@poDêïW^\Ÿ¸\'Oû\Ï\Ï\‡ø\”w?x{3\ÓIª\ƒå\À/ø\‹\ÿ}êæª ]ÄÒ\Ì! ®t\Ì\⁄\’\Ì\‹@\ƒ\È’´Wùp¿y\È5 Ú	\À-∑úªû]\Z\€nªmF\«KÄ\ÁyHoEÛLy∏™\’¯ê\0?ü%\Õb	IÛ®˙#\" \" \" \" \’K‡≠©3]\Á;µkU5\Z5jdçÃ¨ñ\‘/q9\«Sô\n\"≤{¡\ÔÄ`\'\0)ñnª\Ì6W˚ÅTEàÖ\Ï¢(UÄÄ»≥\œ>\ÎR&±\‚\’W_µ÷≠[ªÙNŸéLÅ{v7∞´Ézà§p\ &@l∫\È¶\Ó\"œé¥Sáz®<oC±m≤\¬\Ô§H\Ììàpû	\Â\·®V\„O@D¸}˜HÄàªeøàÄDá¿≠\„ﬁ≥æõ+St<\"KD@D@™ÅÄàjrñ>>˜\‹sv\Ã1\«8Ò _\n¶VX°.ÿûæÄÇ\“HæÎÆªl\≈W,(ì1\¬ ¸.ƒÉ&Mö∏bŒàπ\nDØ∑\ﬁz\Ó¥Y≥fπB\‹‘ß\Ë—£G\∆ÙF~óÖ°)\Ì\ÔÒ\Ì∑ﬂ∫\Î|]ÑjAêä\…\Ô\¬@Ä6lò\r>\‹Z∂l\È\⁄\'\r\÷<\‡jXp§¶`Zi•ï\\*(\nVS$õ\ZÙm\ÊÃôn∑…ÅòQ$©\‚aZ\◊%tÜÜR\r≈ú¿Ù\Ÿsl¬î∂sáˆ1\ÔâÃè+	qı\\¸\ÏV\n¶¯˘Lã@°TÑ∫Pb:_D@D@J\' ¢tÜëla î)÷ßO\Îÿ±£ù˛˘∂¯\‚ã/`\')É(íº\ƒK∏˙\rÄ˛¯\„è]mÅ‘•¢∞3ÅÚ!CÜ∏Ä:¡sjà\'\»ﬁÆ];WL\ZÇ\"…£GèvAsvAl∂\ŸfÜxA\Õ\⁄\«Ëæê5ø˜ıH}Ù\Áü:\·ÄB\÷\0\Ïj@5|?˝<ø3\‡Ò\«wª(ˆå\r~wB&\'\—\'˙ì\∆>\Ï\"m¡˛n∏¡	Ùë&U †-ähS+b∑\›vs\◊\"0P<z“§INpÄ7∂∞Ç\‚\—àÏò∏\Âñ[¨[∑n\Ó\ÿG\›Xq¢®ikª\Ì∂sÖº©KÅ–ÄO9ö7on´Æ∫™]q\≈.\›i¢\ÿm¡é-Z∏¢\·πv<]˝ıŒß\ÿA;\Ï˛¿?ü~˙©´c±\‘RK\Ÿ|\‡\∆<©ãë\ÈúH>\0!%\"àjBD@B 0~\ tk⁄§±ul\€2Ñ\÷‘Ñd\'†\"\‘\Z\"ê| í\ÔcıPD@¢N@)ò¢\Ó°\ÏS`0ø£>˘\‰ \'P\œ\ y˝ôÇ⁄§ˆyÍ©ßl\œ=˜tEôRS˘sû˛y;\Ï∞\√\\0ëÄ¥@æ©ó¿5\Ï§ ò>x`¿˛Ë£è\‹y§4z\Êôg\‹\Ì<hÉ†6¡zˇ≥+Øº\“∆è\Ôˆ\Ïä@\–@| (\Ô\“*Ò;ä=ßûáP\‡vg úr\ )YãO˚s}\Í\"Çˇ¸)\ Õé\“8!ö∞¡ﬂøCáF\ÈTé\'Nt\¬\rÇEõ6m\‹NÜ~˝˙’â=Û\Á\œw\¬	Ç˛`g\‚¿K/Ω\‰Dãµ\◊^\€8\«◊™`∑Å˛\È”ß;^Ùc˝ı\◊w\"Bø{\ÂïWlõm∂q\È•M\ÊÃô\„\⁄\∆\ƒ\"Dë\\\¬˝GH@¿∏ı\÷[ùC?\ÿ9\¬\œAº\0Å\›0¡ß^ÄH?\'ˇhå\Áög\‚\È7Y-\" \" \≈ê\0Q,9]\'Ò! \">æí•\" \"êT*B\œ*0\‹Qà\0s\Á\Œu;!Ç\È5 Ç\\•sÚüN (∆ùo\«@î˙¶-\ÏÑ1bÑ\€m±Ë¢ãÜ\Ÿt\Ï\€\“<{™!P\n¶ê@™Å\»P\n¶»ªHä@\…$@îåP\ràÄàÄîH@Dâ\0\ÍrÉë¶84;ÿ©@:ù Gúvbús\Œ9∂ı\÷[ª]˘o6ór\Îá~0\nj\Î®O@ÛåFÑ¸M@E®5*M@)ò*\Ì\›_D@íC@Dr|©ûàÄà@\\	HÄàâ\Á\Ã\Ô(j,Pdö¥9\‘z|˝ı\◊÷ªwo\Î’´óKïî/ïO\–v\Ày\ÈÇH£\ƒAj\"_É!\ﬂ=IkDJ(v@l∞¡˘NO\‘\ÔI¡Ù\¬/∏tQõoæy,¸\‹\–\–<\”\–\ƒuø®ê\0U\œTè]*B]=æVOE@D†\‹$@îõ∞\⁄\»G@D>B˘ΩÉ\Âq\Èözˆ\ÏYWõÅ\›\‘oà˙A\Ì	\Í%P√Ç:	Aó\‘˙Ù\œ◊óàz_e_\√\–<\”p¨ußhê\0mˇTÉu ™¡\À\—\Ë£R0E\√≤B\ I@D9\È™mÅ $@°ÅsåÄdÇ$úÄÊôÑ;X\›L@D`T:±L$@î	¨ö]ÄÄäPkPà@Ú	\‹2ˆ]\ÎW\”!˘UE@D@\"K@Dd]S\ﬂ0c\‚(ô)1&†y&\∆Œì\È°ê\0*N5V	E@\”%Eê\0Q6]$\" \" \" \"P\0	¿™\‰©\nVíæ\Ó-\’A@ÛLu¯YΩ\ÃO@D~F:£º$@îóØZˇ•`\“h(7Å∑¶\Œt∑\Ë‘ÆUπoôˆ©1\‹\»\Ãjkkk#cT>C\ÃGHø(ïÄ\ÊôR	\Í˙§ê\0ëO∆∑ \‚\Î;Y.\" Q#¿™\”~5\ÎF\Õ,\Ÿ#\" \" â& \"\—\ÓU\ÁD@ä% ¢Xr∫.i¶œûc¶Ã∞ù;¥OZ\◊‘üòê\0G\…Là°éÅìd¢àÄà@\‚HÄHúK\’!Å0HÄÉ¢\⁄Å\“	åü2›ö6il€∂,Ω1µ 9(ìÜá$üÄà\‰˚X=Å®P\n¶®{\Ë˚åâ£d¶ƒòÄ\Êô;O¶ãÄàÄà@TÑ∫h∫DbF@D\Ã&sE@D ÅTÑ:&NU`0&éíô\"cögb\Ï<ô*•`\nß\Zà0	véLÅêHÄ	§ö(öÄà¢\—5\ÏÖ\n6,o\›M™ëÄ\ÊôjÙ∫˙úâÄäPk\\TöÄR0U\⁄\’s•`™_´ß\’K@Dı˙^=Å®ê\0O\‰±CÅ¡ò8Jfä@å	hûâ±Ûdz®$@ÑäSçA@E®ãÄ¶KD@D@2ê\0°Å!\" \"Pi *ÌÅÄ˜W`0 (ù&\"PG`⁄¥i÷∫u\Î¿D4\œF•N@D\¬É\ÓIÄàÅìd¢àÄƒÑÄàò8JfäÄà@Ç	HÄàâsåâ£d¶DÑ¿∏q\„¨k◊Æ÷•K>|x !BÛLDú\'3*N@D\≈]PıHÄ®˙!\–`\0îÇ©¡P\ÎF\"P1}˙’¨[±˚\Î\∆\" \" \" \"&c@Å¡ò8Jfä@D @\‘\‘\‘\‘Y≥\’V[\Â\"4\œD\ƒy2£\‚$@T\‹UoÄà™\r@E®µn$\" \" \" UK@DL\\Ø¿`L%3E \" ∂\ÿb´≠≠≠gQ.!BÛLDú\'3*N@D\≈]PıHÄ®˙!\–`\0$@4j\›HD@D@D@™ñ¿[Sg∫æwj◊™j4j\‘\»\Zôó´òã2£\Ï\Ÿ&\—#êMÄñ\"D\‹s\œ=÷¶Mõ:\„5\œDœè≤®2$@TÜª\Ó˙? 4\Z\ZäÄR05i\›G*G\‡ñ±\ÔZøöï3@wÅ*$ ¢\nùÆ.ã@µ\»\'@d\"$@T\€(Q≥ò>{éMò2\√v\Ó\–^êD†\"$@Tªn*\" â$†\"‘ât´:%\" \"q \"\Ó ô\'\"P:Å†D™Ò\«X\„ı˛üu\È?8£ØΩ¿\ZOk£Gè.\›@µ \" \"êï¿¯)”≠iì\∆÷±mKQÅíHÄ(	ü.ÅÄR0Ö\0±!ö»µ2˘\ÓC∂∑Ø&º\“f\Ë\" 	&–∏qc\€¸êì%@$\ÿ\«\ÍöàÄàÄ§P\n&çH>	\…˜±z(\" Q\'†\"\‘Q˜\–?ˆ)5JL%3E \"¥\"\"éê±$†L±tõå(ÇÄäPMóà@\ÃHÄàô\√dÆàÄ$êÄàò8UDL%3E \"Ç\n©≈®5\œD\ƒy2£\‚TÑ∫\‚.®zîÇ©\Íá@Éê\0\—`®u#®	CØãÄàÄ¸C@DLÜÇÉ1qî\ÃÅà\»\'@§\n\ﬁd\Õ3qûÃ®8	wA\’†\"\‘U?\ZÄR05j\›H*F@D\≈\–\Î\∆\" \"  ¨∂∂∂66AÅ¡ÿ∏JÜä@$d Ün≠[∑^¿N\Õ3ëpùåà\0	pBïõ ¢\ Ä∫/\" !ê\0\"L5%\" \"P\ÌÄ(\n[\√_§¿`\√3\◊E \Œ jjjÍ∫êKx\'iûâ≥\«e{ò$@ÑISmC@D1\‘tçàÄà@&}˙’¨+8\" \" \"P1 *Üæ∞+0X/ù-\’N\0¢k◊Æ÷•Kó¨;\“iû©ˆQ£˛{ 4*M@D•=P=˜W\n¶\ÍÒµz*\" \" \" ï\" ¢R\‰ºØÉ\”\È\" 6m⁄¥å©ñ≤°\—<£A#ê\0°ëPi *\ÌÅÍπøäPWèØ\’S®Å∑¶\Œt∑\Ó‘ÆU•Lh˚6j\‘\»\Zô©DÉì\◊\rE@\"M@D§\›#\„\ZêÄàÑ≠[e$ B£°HÄh(“∫èTéÄR0UéΩ\Ó,\" \"PΩ$@TØ\Ô\’sÅ$@hxà¿\ﬂ¶œûc¶Ã∞ù;¥®	¡^ï7U\n¶™tª:]eTÑ∫\ ÆÓäÄàÄDÇÄàH∏AFàÄDçÄà®yDˆàÄT+ÅÒS¶[\”&ç≠c€ñ’ä@˝âÄàê@™Å¢	(S\—\Ë\ZˆBñ∑\Ó&\’H@ÛL5z]}H2	IˆÆ˙&\" Ò †\"\‘Òì)0G\…Là1\Õ31vûLïÄR0ÖäSçâÄDòÄR0E\ÿ92MB\" \"$êjFD@D†h äF◊∞*0ÿ∞ºu7®Fög™\—\Î\Ís&*B≠qQiJ¡Ti$˜˛;\Ì¥SΩ\Œ=\”}O\€n\ƒCı~6h\– \Î⁄µkr!®g\"Pe$@Tô\√\’]à 	tJ&ìåâ£d¶ƒòÄ\Êô;O¶áJ@D®8\’XTÑ∫h∫$ÅfK.m{Tw\ÓÑ\Õ;\⁄F\„&\’˝ˇ{#á€®Gí\0à¶NÅxê\0?\…JH2	1ÒÆÉ1qî\ÃÅ\–<c\Á\…ÙP	HÄß\Z+ÇÄà\"†\Èí@ æÔø∂L\€U\‹˘Ø~˝æm±\‚:u\◊^Ω\Õ* ë\‘I\" \‚\„+Y*\" I% \"&ûU`0&éíô\"cögb\Ï<ô*	°\‚TcEê\0Q4]à@∫\0ë~ëà@uíƒä\0Aü~5\Î\∆\ f+\" \"ê, b\‚Oc\‚(ô)1&†y&\∆Œì\È°ê\0*N5V	E@\”%ÅHÄÑI\'âÄàÄàÄàÄÑH@Dà0\ÀŸîÉÂ§´∂E@ †yF\„@˛& B#°\“$@T\⁄…ΩøR0%◊∑\ÍôàÄàÄàÄDï¿[Sg:\”:µkUC∑´Q£F\÷\»\ÃjkkkCoº\\\r*0X.≤jWD¿\–<£±  4¢A@D4¸êD+\“àã_ø\ﬂu\ÓY\◊U•`J¢\◊’ßj\'p\À\ÿw≠_Máj«†˛ãÄàÄà@Éê\0—†∏u3Å∏ê\0O\…\Œrò>{éMò2\√v\Ó–æ‹∑R˚\"êëÄ\rårê\0Q.≤jW¢K@E®£\ÎY&\" \"ê\\ í\Î[ıLD† JÄßKE@D D\„ßL∑¶M\Z[«∂-ClUMâÄôR0ià@ıê\0Q}>WèE@D jîÇ)j\…bèÉ1qî\ÃÅ\–<c\Á\…t@@E®@\“)\"ê0 \ÊPuGD@bH@E®c\‚4c\‚(ô)1&†y&\∆Œì\È°P\n¶Pq™1Åê\0!g\»h  \Z¥n#\" \"êïÄàòc\‚(ô)1&†y&\∆Œì\È°òÙıwv\„+ìlHØn°∂´\∆D (•`\nJJ\ÁJ@)ò\n%¶ÛE ˛$@\ƒﬂá\ÍÅàÄƒùÄàòxPÅ¡\“ı˚\Ôø\€\Ë—£\Ì\ﬁ{\Ôµ¡É\€\Zk¨\·\Zú8q¢q\ƒv˝ı\◊\€˙ÎØü˜&_}ıï\›q\«÷¥iS4hP\ﬁÛ\Àq\¬oø˝fc∆å±;\Ôº\”\Œ:Î¨∫æ§\ﬁ+\»9\Â∞-jmfÛ{\‘Ïåä=ög¢\‚	\ŸQi *\Ì\›_E®5\ E@E®\ÀEV\Ìä@t	HÄàÆodôàÄT	1Òt\“Éµµµ6yÚdª\Âñ[\Ï\…\'ü¥≠∂\⁄ ÆºÚJk÷¨YY<Ú\¬/\ÿAdÕõ7∑˚Ôøø(\‚\Áüv¢\√\›w\ﬂm\'ûx¢ù~˙\ÈÅmE\Ë\‡¸õn∫\…fÃòa}˙Ù±a√Ü=\“oÚË£è\⁄	\'ú`K.πdΩæ§û\‰ú¿\∆G\ÏDD†£é:\ .∏\‡\«\0ñ¥ùv\⁄iKüz\Í);Ú\»#s≤äX˜*jN\“Êôä\¬\‘\ÕcM@D¨›ó\„%@$¬çë\ÏÑàH∫EFâ@Y	HÄ(+^5.\" \"ÄÄà\0ê¢pJíÉ˝ıó\›s\œ=v˘\Âó\€!áb{Ï±á≠∞\¬\n∂\–Bïıÿ±c\›náT¢\–≤≥\‡∏„é≥∂m\€$@p\ÔìN:…Ün_˝µm±\≈ˆÍ´ØZMMM°&∏ÛÉÙ%\»9\Ï∏\Ôæ˚l\ÔΩ˜.õ¯STS.z\„ç7¡™s\Á\Œ\Óß}ÙëÆª\Ó:[bâ%¨gœûN\⁄w\ﬂ}3\ﬁ*á†6>Û\Ã3∂\ *´\‘\€uí\ÈgA€ã\⁄yIög¢\∆VˆƒãÄàx˘+â\÷JÄH¢W£\—\'•`äÜdÖ4$Ç>˝j\÷m\»[\Í^\" \" \"PèÄàòà§\ÿ\ÈÚ\À/ª\0Ú\ +Ø\‹`#]¨\0¡nèÛ\Œ;œÆΩˆZõ:u™z\Ë°n7\ƒz\Î≠WTˇÉÙ%\»9ÛoΩıV;˚\Ï≥#)@Ãõ7\œ.π\‰\Î⁄µkùXÛ\›w\ﬂ\Ÿ\—Gm\Áû{Æ-∂\ÿbNx ≠÷∂\€n[Vﬂüy\Êô÷∑o\ﬂ:\"\”œärhD.J\ <ú2#\∆$@\ƒ\ÿy	1]DB¡n®uù\"ìD@D@D@D \·$@\ƒ\ƒ¡I	\'ç\—\Õ7\ﬂlk≠µVÉ\“ê\œgP±ƒî)S\\∫©SO=\’~¯\·˜7Åıñ-[\Êªe\—Aı|˝ù3gé€ïAêøúÈØä\Í\‡?ΩÙ\“Kv\‡Å∫3~∑\»O?˝\‰\ƒDá&Mö∏ÒÑ ±\Êök\Õ*üç\Ï¿†~\»W\\\·l°ÜH¶ü\Âk\'\ÍøO\ <uŒ≤/˙$@D\ﬂGI∑PD\“=\\π˛IÄ®{\›YD@D@D@™ï¿[Sg∫Æwj◊™j4j\‘\»\Zô?¨çMßì$\‡M>˛ïVZ…ñYfª˙\Í´ˇSN9≈≠*\'òú\Èò={∂ªÆ]ªvn:†3ààæ\·Ü\Ï\À/ø¥}ˆ\Ÿ\«\Œ?ˇ¸∫ z@>[Å\‚\\\Ì§\ﬂˇΩ[ÅO\Z\ÍCdJ\ƒyè<ÚàK9ıÎØø∫ ˆ˛˚\Ôoã.∫®±+‰°á≤´Æ∫\ ^˝uój\Ë\‰ìO∂]w\›\’¨à§¨\Z2dàm≥\Õ6∂\◊^{πæ•¶ì\nré\Áˆ\À/ø∏¥E¥\Áè˛˝˚;!bëE±_|—à&á\÷\0\0 \0IDAT.∫\Ë\"£vˆ{Ï±∂\Áû{fım∞≥\Ô∫\Î.Ws!’Øπ˙\»sHø±Öq˛˚Ôª±1`¿\0\ÁKvi¯É¥Uù:ur˜¸v∞m\Ÿeó\Õ8.º\ﬂiãz#\‹gùu\÷q˝\€l≥\Õ\\Z¨˝ˆ\€\œ:v\ÏX«ì\›gúqF\›\œ^{\Ì5;˛¯\„ù88∑WØ^NDJ˝ô˜\„è\Z?¸∞cA˚\\O\rí\‘qá\0Ù\Óª\Ô∫s9(Üﬁ•Kóä\ÕKIòg*O7N	ârg,;#\"ñnãÖ\—J¡7\…Hï¿≠\„ﬁ≥æõ+S®P’òàÄàÄ\‰! ¢BCÑ@2¡yÑRë>á\‡/Åp\Œ¸<\”DÄ ®{\÷YgY´V≠\Ï∞\√3˛¸Õ™xı\’\”àLäÛµ3˛¸z5 81Åù\€m∑]Vq$rÇ\‚ó]vô+JM-VŸè9“±!E’¨Y≥\Ï\√w)Üd&=zÙË∫Äyês2\Ÿ@†˝õoæ©\€\·Wı#<∞ÀÄ~¡â¢\œ‘æ`ßÅER\€cá\«1\«\„Œ°æ∂ı\Î\◊\œ˘!%WgŒú\ÈÑÒ\Ïå\È÷≠õ\„±\√;\ÿj´≠\Êj<ò/•^F˜\Ó\›\Î\“\'a˜•ó^j<Ä´A\Z,˙à`\‚8 f!\n˘üe\⁄Qí\Èg~¯°\”\Ïr\ŸdìM\ÏÛ\œ?w\\\ÔCá5\ƒµ∆çª1äêÅ0A\Z¨O>˘\ƒ\ÌîYz\È•+ÚîJÄ®v\›4Ç¶œûc¶Ã∞ù;¥è†u2©\ZHÄ®/W¶è*B]Ó∫´TíÄäPWíæ\Ó-\" \"P≠$@T\»ÛôÇµY˛\Ì∑ﬂñx•P1´\»	\ﬁ.∑\‹r.=ª\n∆å\„Çıã/æx\∆\¬\Õ\È6\ÂkáBŸæ5+\⁄	d\Ô≤\À.∂\·ÜMï\‡<ª#ÆπÊöåv\"p<ˇ¸ÛÆf˝\‡x\Óπ\Á\\ê\€«ÉúDÄò6möp¿\Œ\'æ¶ÇØ\√¯„èª4D´Æ∫jΩ¶`\Õ\Œ	vvt\Ác∑\À9\ÁúckØΩ∂K°îØèàS\r\Ï:\Ë—£G]˚˛\Á•\n\È\≈\«l=6\ﬁxc\'<d\Zõ0≈øÖ∞BH`\«\‚\"5O\ÿ!˝\Àv?D(ÑßbSs=ˇπPD©uΩàÄÑC`¸î\È÷¥Ic\Îÿ∂∏Tç\·X°VíH@DΩ™>â@n 4BD@D@*M@)ò*ÌÅÄ˜OB`0[MΩ§\‘\·\Ô-Z$Rˇ4Æ%\rÅjR\ﬁd:Ç¨`\œ◊éO¡\‰T¨Fç\\\–|\À-∑,\ \Ê‘ã‚≥ãÄU˘§qB\Ë \ÕàÅ∫ùßü~z\›%©}	r52\È; hó§:J\›q@\0ù~¶ˇú6=ì\r6\ÿ¿H\„î\Ì\»\÷Gl\À&4îKÄ@(Ä\'ı$Hı\ÊõoZ∫HQå\0\·Sr¡.\’_\Œ\Ó›ª∑+¶\ÕœÉ%™\"\ZH\¬<SD∑uâàÄàÄT\r•`™\ZW´£\"PG@ÑÉàÄà@•	®u•=˛Iíz\Ê\‡ÉÆK{\„ªñ\0ë∫ZΩ\"W;>\ÿ\ŒNÇ\ÿ&L∞[oΩ\’%.ˆ)ïHÖD\0ˇ\œ?ˇtª, ®ó\·w\\d ÇúS®\0AÒgÇ\Â˛ `NJ§gü}\÷6\›t\”z]ıL¯a∂b÷π˙X	\‚è?˛pu6ñZj)óöi‹∏q°\n0¢]üÆ\ à8Aw\\;ûJπ.	ÛL)˝◊µ\"\‡	(ì∆Çà@R	®uR=´~â@v 4:D@D@*M@D•=˛I˙¥7≤©\‡É≥\‰\≈\'¯N¿÷ß¨	àeÅ\09inHÅ”∫uk˜;\“QÇ wê>–û≠ù\‘`?)òHUÑ\ÌÙa˘\Âó/\‘l#\ÓÖjUPà;\’Nj ˚…ì\';°\√Z\Ê\ÍB∞cbı\’W\œ{2\È; ÿÖ¡J}\n]ß˙ÉîO§≤∫Û\Œ;\Î\ÿ˙ˆ\ÿŸÄ\Ì¸û\›‘©h÷¨ô\€¡\Œvâ¯\"Àô˙X	ÇTS}˙Ùq5-v\⁄i\'\«\‹ÛÙ¨ä\Ÿ\·Ö\r\ÍY§≤\"\≈\\HQ[\ÌÄ(¯Q\—\"–†TÑ∫Aq\Îf(ìÜEπHÄ(Yµ+\—% \"∫æëe\" \"P-$@\ƒ\ƒ\”I @M õ ,+\Â7\€l3ó˙Ü†4ª§g:®\'¿.\0Ú\‚o⁄¥\Èßqb¿\r7\‹P˜ªµ\÷Z\À\‡FAc\‚\Z¶P29ˆ7\⁄h#w?£¿cè=\Ê\n\Áká\‹˛\«{¨´3Å›¨l\'E)ìæöª\Ó‹π\Óz\◊ü&òO!f\r\ÍPåò@˛û{\Ó\È\Êà7˚)Moª\Ì6\'\\\‰;\'}\Á˝\«§W∫Ò\∆]PúB\⁄Ïº∏¯\‚ã]ãé\ÿ-@\‡úÇ…ôäPSx˘†É≤\◊_\›q%\r\÷*´¨bÉ\r≤=ˆ\ÿ#o\È7\¬5Rw^xA\ÊÎÆªÆ˝¯\„èn\‹rLú8\—ˆ\ﬁ{oW¯ëÅÉÒF[¯ê\›,ü~˙©´\—@±mÑ\nPSà\Z&\‘\Á¯˘\Áü]uxsê.\Ïó_~Y\‡g\‘5°é\∆nª\Ì\Ê¸Et⁄ô4iR]=?aM\Í*_Ùö1¿¯§Øï8í2\œTÇù\Óô, í\Â\œ8ˆFE®\„\Ëµxÿ¨LÒì¨Å0	HÄì¶\⁄(ÜÄàb®U\‡ö§	¥é=\⁄\Œ:\Î,#0º˚\Óª\€ißùñU|\0ı\ÏŸ≥\Ì\»#è¥v\Ì\⁄e 8è4?Õá\‚\‡˚E∏\‡:V≥Xˆµæ¸Ú\À~F\Ó˛l\Ì,∂\ÿb.\ÿL≠	\“%a;ª9Rñ-\rQ∂aCj*V\‚œú9\”\Ï∑\ﬁzk\◊vó.]\\\‡ü˚˛˜øˇuö)í}\»!á\ÿ˛Û\'R\–?Ú\Ï\…w\"E˙AçvV¸FBd°Ä7xÑ\Ï¿.Ññl˛§Ù£è>jù;wvÇ	®rıq´≠∂≤n›∫πfT\Ë\'b\0∂¿ì?\Ï°\Ôô˙ë\ÔëDP@à\¬6\nc#D1>¸}#\\\Ïra|Nü>\›˘ïs\◊_}\'!û=˝Ù\”v\·Ö:Å¡\ﬁN˝\r,\ÿı¡\œ€¥i\„Ñ\∆	bG¶±¯\‚ã/∫~ßé\œ\‘\Z˘˙\÷\Ôì2œÑ\≈C\ÌT/	\’\Î˚®Ù\\DT<ë<;TÑ:y>UèD 	˘\È˜\" \" \Â& ¢‹ÑCj_Å¡ê@™Å¨4\œhpà¿\ﬂ$@h$TöÄàJ{ π˜ó\0ë\\ﬂ™g\"êç\0Aü~5ï\Ÿa-ØàÄàÄà\0$@\ƒd(0G\…Là1\Õ31vûLïÄàPq™±\"HÄ(ö.	D@)òa\“I\" \" \" \" !ê\0\"\Ãr6•¿`9\È™mhû\—8Åø	HÄ\–H®4	ïˆ@r\ÔØ\"\‘\…ı≠z&\" \" \" Q!\Ï≥\œ\÷3\Â\”\Ô~tˇøZ\Àe\Í˝úÛI=H\—\ﬁ»å∫Øµ±\È£É±qïÅ\ÿ\–<[\◊\…ê	HÄ®ö+òÄàÇëÈÇÄ$@•\”D AîÇ)A\ŒTWD@D &à/Ω˘¡\«9≠\›p\Ìª:¡I=$@$’≥\Íóà@I$@îÑO\'à¿Ù\Ÿsl¬î∂sáˆ	Íï∫\' \‚\‰≠xŸ™LÒÚó¨Å0®u’ÜàÄà@!_2ì\0Q»à—π\" UC@ˇ@Tç´\’QÅà?e∫5m\“\ÿ:∂mqKe^\‹®u\‹<&{E†t Jg®D@D@\n#†¯íà\¬Få\Œ®\Z˙¢j\\≠éäÄàÄT)	U\Íxuª™	HÄ®j˜´Û\" \"Pä/IÄ®\»¿\”ME@\Zû¿¥i”¨u\Î÷Åo¨ £“â	\'$\”‘©S\ÌÒ\«∑æ}˚Z≥f\ÕND\›õ¿\ÏŸ≥m\‰»ë6j\‘(ª˙\Í´m÷¨Y.ˇ\È~˚\ÌßÒ6lµWèÄR0i@à@ıê\0Q}>Ojèˇ˙\Î/{¡\Ì\ﬂˇ˛∑m∏\·ÜI\Ì¶˙U&Û\Áœ∑>¯¿Üjõoæπı\Í\’\Ànª\Ì6\Î‘©ì≠ø˛˙e∫kı6´¯íà\Í˝\ÍπTÅq\„\∆Y◊Æ]≠Kó.6|¯@BÑ˛Åh∏Ú\»#è\ÿ{\Ï±¿\r;v\Ïh˜\ﬂø≠±\∆\Z\rgLëwz\·Ö\ÏíK.±a√Ü\Z_Eﬁ¶\"ó\Â+B˝\Êõo⁄µ\◊^kgúqÜµoØ:qR\Ãoz\≈W\ÿ5\◊\\ckÆπ¶\›s\œ=∂Ù\“Kªø\'Lò`\\pÅM˛aéR0\≈\‹\«Q5_E®£\Í\Ÿ%\Â#P-ãC\Œ=˜\\{¯\·ám\…%ó¥\ÿ\·á\Ó˛ª⁄è\ﬂˇ\›-|∏\Âñ[l\Ïÿ±∂\¬€Æª\Ójáràu\Ó\‹\ŸZh°\»#˙\Ì∑\ﬂ\Ï≤\À.≥6m⁄∏ã,≤H\‰mñÅ\—\"\Ÿgüπy\·\Ÿgüµª\Ôæ\€ˆ\›w_õ2eäù|Ú\…\ÓY B\Œ~\·P|ID8#I≠àÄDö\0DMMMùç[mµU^!Bˇ@4åK˘\08È§ì\\1˝\Ë”ßè]w\›u∂¯\‚ã7å1Y\Ó\¬j\Ï#FÿÅòÒﬂá\€oø\›}ÙQ\€fõm*jo7O\Ìs.\‚\À/ø¥Û\Œ;\œ˝YaÖ¬∏µ⁄®Rw\›uóZ¥haµµµv\ÔΩ˜∫ïY+l\”√ñ^lQ€øÛ\⁄UJG\›.	\Â\"´vE ∫™AÄ¯\Óª\Ô¨ˇ˛∂\—F\Ÿq\«\Áúq\ÂïW⁄ú9s\Ï\Ï≥œ∂&MöD\◊AXˆ\Ã3\œ\ÿ*´¨R\–b•oæ˘\∆1Yv\Ÿe\ÌîSN±ïW^\Ÿ˛¸ÛO{Ò\≈m\‡¡÷£G8p`§w`Úéƒ∑\ÔKç$.`\–\Ë\‘zæˇ˛{7Üˆ\ﬂ˜7«å3\ÏÑN∞O<\—\÷[o=âÄ\‚K B\ZJjFD \  ∂\ÿb\–J=r	˙¢a<J\0{Ãò1÷≥g\œz/˙∑\ﬁz´3Äî>ï>^~˘e∑:äèîL\«oºa\◊_Ω}Ò\≈∂¡∏ùq_Öî\⁄\Ál€æ\œ<ÛL∑Âõè5\"P\nÅtÇ∂˜XÖı◊äk\ÿ&[tï\0Q\n`]õëÄR0i`à@ı®Ç˜\÷#é8¢\ﬁN\‚w\ﬁy«â7\›tì\\\«˝`\0\Ô°|+\›-M\ «£é: Ωß#»§/rb\Á\Âû{\Ó\Èä£è>:≤Å}|y˘\Âó\€UW]\ÂÑ\"P,ÅLmÒ}\À\\¡.Â•ñZ™\ÿ\Êu]\n≈ó$@\ËÅ®\Ÿ\ﬂuÑÇ_laıá˛ÅhòÅÒÛ\œ?[”¶M\Î\ÏYùE:ü#è<\“V]u’Ü1$\À]X\¬\n2ÇÏßü~˙gÕõ7œ•à˘\œ˛\„D\n∂rìãuùu÷©®›•\‹<Ω\œ\Ÿà˜\ﬂﬂ≠ªÒ\∆\Î=;•\‹[\◊V/ÅL4û{\Ó9;\„\ \Î¨\ÔIgXø≠îﬂ∏zGHyzÆ\"\‘\Â\·™VE \ n˚ûı´Y7\ &ñl\È1IoJ\0ëwT\ﬁS{\Ï1∑k5\Óe¸.IÇ£º? |\⁄WR\Œlª\Ì∂pˆªö_˝u∑≥\“\ﬂ!ô\ﬂIm€∂u\ﬂ(:D†\Ÿæ\—˘?\‡Ä±ªøFa]´¯íà∞∆í\⁄à0Å|Ñ7=Uà\–?ïs(´z®\’¡\Àu∂$V0ÒR‘Æ];∑˙	#\”¡Í®õoæ\Ÿn∏\·õ;wÆ\r\Z4\»>¯\‡z\Ì¶ûÛ\Ì∑ﬂ∫ïO‹ªq\„\∆nï+˛8\Áús\Í	\Ïz M?g7\«^{\Ì\Â∂mg⁄π¡}\Ó∏\„g\Á\Ó≥\œ>v˛˘\Á[Àñ-]Û˘~\œG∂P§ó#R=!\00V¯\·∑mñ≠\Ë\ﬁ∆è>˙\»\Ì,ô4iR\›œæ˙\Í+gºz˜\Ó\Ì\ÿ=˘\‰ì.w,\◊˝Ù\”OÙ˘\ÿÛ.µ\ﬂ⁄ØoCzu´áòÇe~÷¢ã.\Í~\«G m•\÷\Ô ˇ0ÇR\Í\œH\rpÍ©ß∫¸ª\‰Ø%˜.[|˝\‰ƒâù∞ÛÙ\”Oª≠ıÙø\—Eqb>\nYô∆áÙÛ\œ?\ÔÑrÛsRzΩ˚\Óª\ÓzvßPˇ\≈3ˆ\„>0\‰C|\”M7u´\Ì}€©m\–7∂πS\‡è\’fCÜ±-∑\‹\“.æ¯b[}ı\’\Îòd≥9HöÉ\‘{”Ø\'ûx\¬\’\’@\»:Î¨≥\Ír∞¶é\’t˚1$\◊løcµ>\„\‡CñÅ¯ü•˛\Ï\◊_≠c>O,\„\Œ>ø4\Ì¸Ò÷ºyÛz<S}u\Áùw:n¯ãÒ˜\–Cπgí˙¯”ß`Ú`?˝ÙS\€i\Ô\ﬁv\‡¿¡6x\ﬂ\›*71\ÈŒâ$ \"ënUßD†\Í	æ¿ª\">\Ô-´≠∂ö{ˇdWÅ\Îl«®Q£\‹\ŒC˛≠\ŒUÑ6\€;µ\€¸;Ö\Ô{\‡Å\Í\ﬁ)¸˚˜\Á]ç˜\r“óÚÆ\«{(u¯\»˜.˘\⁄kØπ˜\r\ﬁ9R\ﬂ1≥\Ÿ\∆\Œ]\ﬁ\—yáæ\Ôæ˚ìL}\'\Ì*\ÁpM>[ä}w•\÷\ÔÙ\Èˆ˚wi~˛Í´Ø\÷K#\Ã\œ¯V¡&ﬁøx\ÂA\‰|\ﬂ7è?˛∏Û\Ô]º_\√\√Ÿæâ¯\ﬁJ˝Ü\‡=òw;æ{x?«ØŸæ-¸.ìTøûx\–Aπ4?¸>\€˜…°á\Í\∆Ò¯Ò\„\›˚0\Á±#ù\Ô,ˇ~ù\À\Ê Azø∏ã¨;\Ï07^∞ï#ó˝π∏f˚\‹¸∑õ˜ır\À-W˜\Ìñ\Í?&∂\€n;˜ûº\ƒKd˝&$W6_Ò\Ã`\Ôﬁåü?˛¯\√}ãÚmîöÇ\…sª\¬\r!Ço9æãuîF@Ò%	•ç ]-\"A\ﬂÑ˛Anº\ﬁˇ≥.˝g\Ï\„+C/∞∆ì«∫Ä•ép	\0˝◊ø˛e›ªw\œ\⁄pÇ`5+£>˛¯cóâUV\ÏsÚµÛ\Œ;;aó]vqAQÇ¨ôy\…$¿\Œ€∞˘XÀ¥Ç∫ºòÚ¡\ƒ\Œ\rDÇ¯§êJ\›MÄô\ÁV≠ZπZ>¯õó^¸8r˝ûó>\Ï¢\ﬂÙÅÄ=/˚ßùvö[\›\∆˝π/ñ|y[\Ÿ\Õ¿À≠ˇP\‡≈ì\Z\€oøΩ;ó\⁄(à|\»\\t\—Eé9/Ú©}Œ¥1áór\Í>§syÍ©ß\‹«Å/ Œã.¢\€\ƒ˘Å||Ãá\ﬂN;\Ì\‰^Ú˘\0¢\ÿN@õzı\Í\ÂÑ\"\n°Òë\¬ˇÛ7˘@\ﬁx„çùêÅ¿ÄØ\·WÆ\≈/Iü|Úâ((låØô%¸x 0\œ\Ô˘9˛£\r˙∂\€nª\Ÿbã-\Ê>pø˛˙k\'ÿêjä1;|G\0ùÛsŸå–î\ÔÄY\ÍΩ˜\ﬁ{oC¯Ä~\Ê#Å&ó˝lè\Œ\∆5s~Gu∏Ú\—\ÌsΩ≤ıö\¬t¯\Œ\Ô\Ëaı$˝\Â£yÚ\‰\….7,¸7\Ÿd˚¸Û\œ›∏Å\œ©\’2˘\nø-≥\Ã2\ÓcóèW\∆\"Eˇ\“ûï.;v∑≠ª˜∞\ÎNò•~/P\n¶Çp\ÈdÅ\‡\ﬂT˛\Õeë\0ª!.ΩÙR˜.î\Î\"@\‰z\Áa\·\ÔSº\'±ÛÇ˜$Ç°ºèÒN–©S\'W\‡ô\Z5Y≤\÷Zkπwø(Å∫˘\ﬁ%y_Ãîf*óm\Ïx9\Ó\”\ﬂ5Rô\–.©{	\–Ú>ƒñb\ﬁ]yøDÑaAh\ÿm\Õ\·SK\Ó–°\√\ÓB|\·ù1}\ÁGæ\Ô\0\ﬁ\◊Y8\≈˚6\Ô\\˛yo\‰{â\ﬂÒ≠í\ÌõÒá¯f`Å\÷\€oø\Ì\ﬁ©\«\Àım¡`%=\Ôç;Ï∞É{GdÒ	|¯FÒ\ﬂ\'|á\–7XºÙ\“K÷Ø_?w\Ôﬂºü\"Va´\ﬂmû\Àf\ﬁE˝\"Ølcf˛\ﬁ|˙ö|õ ~∞Pâ±ã\Ëì\Õ~l\Œ\≈5\◊\Ô\Ós\ÏÙA~øág\’g0&#<_|\Â˙&\Ï⁄µ´{˛\“}\≈X\√\ÔíÙè\ÔOæs\Á\Ã˛˘ºc‹ó\ZmJıU˙\‰/\"Å\ƒ›álo_Mx•Ù—°D@™ö\0A∂\Õ9YDè^by±$ ùö´32m)ÂÉá\0>gV[Òˇà”¶M´w\‹l\œfEU6[yY\„e’øî±CÅ\‚\Ÿ|¨§>\'òÀá˜euã_}\¬8\‚/Çπ~\œJs^ÑO|Ä\ÿ3g\ŒtÇ\Ît[=lÅk∫∏@ß˝9\ÿyπ\"@\¬\ŒGA˙Ùó\’LÑº¿\¬\nÇb¯a\À\n3^§˘=úlu\Ácô¢ÙÉ`8/\‹¯åW¨ñ\'\Ìèl˜6lò[M\«\À=VÚ/Ù\Èi≤µëZô˚Òë@C\ÏdÆ\»g≥\ﬂ!íkSwÉÄºn8óqâOv\‹qG\Á\€\\ˆÛ!ôçk.\Ê|\ƒ{næ˘\Êu\≈*ìp\∆\œ\‹{˛¸˘Nå à¡d¨L]E\\∞ìèEx¶˚ä]∆ºˇ¿ˆ+™¯P\‰\√2=(Ä\‡≥m\œ˝mï≠n˜\\uQ1SÅÆÅ¨TÑZÉC™è¿-cﬂµ~5vìFÇgoª\Ì6\‰\Ê=à†1\Ô\◊\Èu\n\È7¥ÇºÛ<\Êè\‡¨_±¸ÚÀª[˘\0+\Ôp˛í\≈ b	J§\À˜.ôIÄ\»g&hü#à\0\·wÁ≥•îwWøx\…\Ô\ËÊùàov2\‡´L´\ŒGå\·v≥§˜!\◊;æˇ@º\‡˝ç]∂,\"∞Œéà\√?<7\Ô\Ì©ı\ÓÇ|[ @0˛¯\÷aQK˙7ZÆ6RW\Ê˚\›\›,$¢O˘æ\„¸ë\\cú˜\Ãcé9\∆VZi•zã™¯∂\‚˘\·\ŸaWA.˚sq\Õı;\Ï¬ü<‹á˜uübã\ÔPüåwræ;ıº8\‰õ0\›W\√\◊~ó5˜gÚæü˛M\«{=‚Ñ∑≠êπB\Á.H@D‹¨ï\…z\‹E@R	hD|\∆Cæó\ÓBz‚É™›∫u´\€Zú˛\‚J∞ó],íõ5k∂@Ûô^à˝Iº∞ÛR\Ã\ÍïÙÉ`ør˚>&xaF\‹H?¯à\»˜{¿O\ÕsÀäuV˛\”^úK ≤â\”gœ±	Sf\ÿ\Œ\⁄◊ôù-_(\'\‰˚P\√~VÙ#®¨Ωˆ\⁄n%;(àà®S^vSúT^ô\⁄z_\Œ#ê˛¡8Xq\«NˇWå\0¡nê|6∑ô\Ó\Ì?¶˘XG|A\»\»e6Æ\‹?\◊\Ô¯=ÄOg\≈n\nÿ∞{\‰Ω˜\ﬁsD¸Å!]\ÿÚ˝#ÄÄê\≈\Í+ûÅL}Ú>\∆\Á©:\Ÿj@˛gül˘Z\€CCØ	ÇR\Áà@` £“â\"ê\’PÑö¿6w∞Kîw\Ãcè=÷•Ωa±BêÙêô\‰=ç\Î|çv•≤\ 1Ç .áá¿éLuÇæ”•øc\‰≥Õø\”N]\Ïë\ﬁO~«ª\ÔM¨8\œ˜^\À\Ó\Ê|\ÔÅ\Ÿ\ﬁ]π7ÅfválÊùî =©vRŸ§⁄ò\Î})\ﬂw\0\Ôi\Ï@E b˜4;å\Ÿ\’ ÆîbøâÇ\ﬁ~vr≥ÀÜ>∞Bﬂß\‰*VÄ\»gsêI+€∑ûØ£\¬8BF6˚sq\Õı;\ÏÛ\0æÛª)Xê\√b6\ƒûa\“ÂÆª\Ó∫N†H]\‘U\»7!˜Çª˜S≈´Bø\ÈÇ0\’9ô	HÄê\0°gCD†\n T¢≤ÉÅèüœî-Øal\—ı\ÈX]\ƒ¥ÁÖóºÄxee«ä+Æ∏¿-≥Ωîf+îùi\’\nçf{YÙ7Ú{V«∞Mñèì\‘\ÎOx9&MTæè 	πD_/\Ó∞{Ñ˙©Gæ5^ñˇ?{\Á6Eu˝\·Cc¿.6¨XP#A\—(à¢Q6∞\ƒ\ÿbD1∂ÿç\ÿFç5äbâ{\◊+6TDQ±†(\Z\Îg,1¢ÿïˇÛªxøÃ∑ﬂñ\Ÿ›ô\›)\Ô<Oû\»~3˜û˚ûª;3\Áw\Ô9Úµ\“,I<\—C∂Ñ=\Î%NAiΩ\È•’ø¨Vj?\ÏÀ™\Í(\Ô≠VK\0yˆ\Ÿg\›_=ÑØçP\Œ\Ê0sπ7ø-^yu%h)T9˚KqUzÉrì}Úá|©î^˙Æ(ﬂÆ|%h\Ói≈§V\‚)\ÌïY\—ô\Ï**h;ΩD§bc*ı¢S\ÓÖzó°√¨\Á\n+ÿô\'¥/Ü-\Á@†R017 ê?y îZQıÙº´:tñ(°Eaã6\ŒØÙÃ£íZe≠ùæJ•©\Áo=\Ëm\Ë\ﬂ ∑_lïòg\…\¬s\¬ÿ¶±k•∑R)∞[x¯\Áx•iıi~*Ÿ¢ùÕµ>ª™µµ∫^¡e	\⁄]†\‘T•\“ei≈º\ÿ˙›Ω~aûÒuÆ\ﬁaÙ.§Ù\⁄£¨ÉúÆ\Âù(Løö\‚©¡Ù,©1˚\›\rµ\nï\ﬁ\„\¬¸∫ïz\Ô\—s±\“A\ÈπXªE\ \Ÿ_é´ƒæR\Ãı7ˇ¨Øs\‰{âÖ\⁄.VJQ™\œ$\⁄HÛª\∆ky\'ÙÔ£Öª∫+	˙é≤\"\ÃL™|D\ÂY\¬Ä@\Í	T Ç¬É,7à∆ª]\ÈfÙ¨¸îQ\Âô\‘√ú\“T\ƒMyJïüT[ö}a=øuWs@˚\⁄F≠`™^\‹dÉ∑\≈R0ï€©°ø)5Q0ó¶^^îÛTè\⁄˙º\ÿbã9¿\⁄E!A\·\„è?.˚˜/æ¯¬•äR∫õ`ÅkΩ(h%óR\ﬁhıílU]Æ&Sπ4MÖ≥°\\\rçU+vÇbI°¿¢Q≠Úc•óÚ9WïK[˚ï\ J˛P∫\ÌL\—Àô\⁄SÄ\\Åq\Â6-\\ΩV\ÈQ\Ã%:\ËÖ◊ãQ¶`*gs©\"\ÈAÆ≤_/ez\Èıi∂¥öO˛\÷.\Ì\‰©d)Æ⁄çP\Óo˛\≈I/Z\ 7¨UV™â¢4hzÒP]’ä–ºñ\œ¸\ŒΩ∏\Í%\÷\œg_Qâà\≈|¢CÚü\⁄	n\·ó/Ç\È≤<?á\≈F+9 %äPGIì∂ êy ä\›Su?\’sÑû˝sFµÛ˜ˇr\œ<™S¶Ö1:\‰\◊b=\Ôj°âû´}¿˜\ﬁ{\ÔuÅt=+´ô\n¥j∑Ñ\ﬁ\›*=K>cÑ±Mu1$@¯zUÖ\ÔS¶Lqªr%((%îƒëJœµ>S-œÆûø\ﬂ°:™É|\÷/ÙQ©\Zûkπ˜\0\Ì\◊s∑vXhw≠û•%D\Ë˘ÀøkT˚NFÄ\–\n~	b\n~k¡W\‘)òJŸ¨ö#ïoøj\«”ä ü$Zi>ñ≥øWı_äπıﬁ©F*JÆö*P≠˜}_µ†Gµ\”\‰3˛\›5\Ã;aa\rC•\◊˜+ò∆∂0o\‡°\◊[\0\0 \0IDATê5 *Õû\Í˛N|	¢∫\√\ŸÄ@*	î Ù∞\"E\ﬂœÇÉ\„\—xW\Î\·K´M¥Eº\ÿ\ ˜†ElW^ΩHj≈∑RiI©†z\ËTÄU¸‡°ºı\n\Ók’∑\‚\ﬂ}˜ù{0\‘J.µßkdg±4Aˇ˝\Ô]Ä[õz±\“˘Z%Økî≥\’z	\”<\”≠\“\Íî˚ª^\ÊÙ†©U1*\Ê\Ïã˛jÀ∂8¯Ueßùvö{QRÅ1ΩTi~K\—KôÇæZY• ≥HU|L/|æPuˇ˛˝[Û˙\«<˙Åá≠˚/V∑≠~π|F\‚#˘\‘@˛èØø˛∫Z¥≤IÅs©e≥\‡zx\÷V|Ωh≈è^\Ó46\»\≈C/\\≤_/~---≠˝)mï^Z¥\‚N)≥î´µp7à∂*\ÎsµΩ˙Í´ªˇ\ÍS/æ\‚†1k•ï∂öãµ^Bı7	S\⁄E\"^J\ÕTÿÜXjóÑ\ﬂ%£U\\\n∞+´\ÊóV®ï≥YBã\ŒS;Úø\“;ºH%1F\\\‰Ω¯\Ë]\◊\Èﬂï\ÏóPä´\ÊO©øy{Ùí•9´`ø/ä\Ì_VT\\¡\0ˇ\›Ù;&$J\»^≠\ o≠tî∞†\ÔN)_)°ó*âLö#ZÙ=Vç	-\ZØöO:Ws®÷ÄI\„\Õ\Ë1- \“\‚)\ÏÑ@tÚ @(Ö¢ûÙ¢\ÁD=k\È9Fãd¸Æ\∆bD˝}[\œ~±N\·y\Âûy¥XFªîvF\œ\¬Z£Öz&\‘b=ˆ\Ï\Ÿ\”\Ì\∆P \‘?\Î)¯´@æû\ÀÙú\ÊYR\Ì\ÍyQ+\≈uhßá˙(˜©Û¿\’3±\ÏãèÙ|§\≈Jz\÷\—sªûë}≠å0∂hºµ<ªz∂zRj$\’JyˇK\Õxø\ÿ\√\Ô\ZûW\È=@˛—ªÉ∆©]b°kÙ‹• wπw\"=á\Í\›\«◊´œÉæ¯uπw\ÌP?zñ\◊Ûæ\Êô\Ê•\ÊÖ\ﬁ?$ö\ËY2ÿÜv˝*≠ß!øpHÖØµEÅz	Wï\ﬁ„¥ÄIµ˘Tw.\Ë\” 3/@(Â®û5U\0[\"Ä\ﬁ\‰SΩ\”\Ë›¢ú˝b!°†WŸ†&\≈˛\Êcæ\Êõ8®\Ì˜v47ÙΩ\—˜CáØøV\ÓùP\◊Ûïügz/’ªèæz&\◊{ü\ﬁUoOs¿\Z≥\⁄\n\n3\—˝\ÁØ%\‚K˘õıå9$ \"(.\'<x<\‹ \Z;QÙ\‡Øi\€’É_•Cs\nê˙á\‡bÑ\œ´U7¡C/9\nÚ\Í¡WAS=Xiıèæı\ﬂZuØÄ∏\⁄÷°\\\nÄji’îÇ∞\n≤\Í\Í|˚~â\n˝\·\œQ¿[¡z¢P◊™0\Ÿ\‡˚©Ùw= _z\È•\ŒNΩ|h7ál˜/zë”É£rı\Îa]/wN$P\ËA]üy\€Ù¢£\Î¡‹èGü\ÈÅ‘Ø∫—òw;¯/v˝ã-vÒN∑\·®\"h\⁄M\"v¡Ç\·z0÷äîUóB;Z¶Mõ\Ê˙\’√º^hı∞´tK\‚°4H\‚ \∆\⁄\Ì \·\‡\…\'üt/\n\ +¡@\—Z\r§\0¨uh•æDΩ∏®?ˇπ˛¶ó»áz»ç\›\„∆çs/\ƒz∞\◊|ë]ZÖ•]≤K/ö\‚\Âè\¬6ÙÚ¢bÚü˙\’!AE}kNï≤Yæ\—µÇ˚ÚÅ\Êy±z#~%ü^\∆\»_	zQ\‘â∏h\≈R)˚%.\›q\«%π*\’U)\Ê~\Ã\ÍSÛ[>Uë@z)\“\ÀB¡\Ì˘\Áüw\„ëH¢9†kıÀ†OÇæRõ\‹4	\níH\–Q\‡@	ΩÄ\Í\≈KA@Œø\‰r;z\ƒ\È\÷oÖ•+˝4wTEÄLU\·\‚ddÇ@9*xè\÷säûìtè\’ó:¥Aœñ\Âàr\œizZw\›u]Ûzé\“sÉÇó¡\Á1}æ\Œ:\Î∏ ¥û\≈Ù|¶]ì\n~˙¢\’aû%ı\\¨\Á=É(P™:J=è\Î^\ËyP¡f=\”\È˘[áû7ı<®\ÁsΩ¯#å-z÷´ˆŸµ\–ZX£ x∞Ü\\1?˘4Q\n\÷\Îπ=xî{P0]\œt\⁄i¢go=\ÔkáÄ|\„≈¶R\ÔD\⁄1¢\Îı,ØTQb-\Ê>\ri•w˘Iæñ°Äæ\ﬁ¥¯K;‘øﬁª µ°w©\r7‹∞uniÃæ~Dπ˜8=c\Í9_…¥¿F\ÔÖá Ù\Ï™˜3_†Y\Ôä[l±Ö{\’|\—˜¢ò˝z\∆\◊sm)Æ\Zc9\Ê≤\«˚TˇÙø\ﬁÙNVX´∞\‹;°\Ês1_˘wΩìi7æ\Êõ\ﬁ!}QrΩ£lª\Ì∂¶:p:\ƒU\Ô\⁄\‚Uj\‰L\‹@\ÍÒ%à:¶óB\0i! B´iTÑ≠‘éá¬±pÉHãwK€©á9=ú*†[X(Zò\⁄\Ó\\jgD˙G\›&Ω˜ë]4nR;B/dzHñ`T,èntd£%Ω∞+oØDì.<\ (\ÃÅ\ÍG°Ù\0z\·˚~â^∂÷∫m◊µW©æÆÄ@°fz@ Ú\"@\‰œ≥’è¯ïW^qãí¥\‡EAq˝\œ\Ô|®æµ⁄Ø±\ ü∂\Ów KDâ*mm\Ì\÷\'ˇJâ\0J´\≈DÖGò\⁄w\…aÙj∑î\Í_H`Ò¢DÙΩ\‰´E\‚K˘öÒå9&†\≈R-ïB\¬\r\"˝ìEiö¥\Í[´9Ç/Z•¢ï\÷ZUÆm¿\Â	î tï\“7iUì∂√≤<\«ˇ˚\ﬂnï])\—¢=?\Ìb\—à\≈6lÛw\Îä\0¡èU\‰ \"GJÉH<àƒª®°*\0≠\’\‡Z—ø\Ã2À∏]⁄°Q™t\∆iGÇRIïKè\ÏWãZî™Iiä|\⁄\Œ8\Ï\ BõZ0•4≠\⁄\r^,êé\0\—\ﬁ\Àzá\÷ \ÌWJ2éh_BÄàf&\—\n ê9\‹ \“\ÔRm\ÌUÆP≠f\“vamΩñ¯†\Ì\…\⁄~™‹ß¡\Ì\ÿ\Èq<#(\'@®G\ÏS^S	aäΩ\≈cer[’™6\’7ë¶\⁄RıMîä@[\È}\rã\‰é(~\ÀÙ=\’À¢\“4)\≈\”\ÕS>∞π\Áú\"~Ùπ\ÎÅLπs9ÜÄ]6˛E:†7$ –ÜÄ\—J•4°O<ÒÑ[\\£T6q™˜†Ù6Z•˜•\ﬂÙ5\›\¬Ù©¿∫Vß+wøl-ñ\ﬁ3L;Y>G•¥êE)~K•ÛıZh°\÷˙xYfRilJ7•îWäÖh_•∫åï\⁄\„\Ôˇ#@|	Ç\Ô \0Å¢∏A§b\ËJπ3µ™IBÑ<µµY9fˆ9\Ê\”?\“xGPIÄP\Ô\Ôæ˚Æ{aSi^Ä™˜G±\Z\≈\núW\ﬂr:ØP¡G	2\ W≠˘4Ú\—I\Ète‚≠¶u\‚]ÑÅÄ\02I@\Ô)J˚Ú\À/€ôgûiø˝\Ìo´ˆJÑP]ÇW\\1T\rΩLÇ¨cPÖµ˚|-º<ø\Àh\'éîï*B_\Ó\‹_J|	\"˜_\0@\0\≈	pÉ`f@`6Å0¨ \'à8\È\Êªmà|˚ü\—C\0Ä\0 \0ÅF æÑ\0—àyFÄ@\n	pÉH°\”09±`•\—* @TãS´\"@\n¶™pq22A\‡≤Òìm\ËÄU31@\0\È @|	\"3+!\0ÅÜ\‡\—p\‰tòP\”fÃ¥â-\”mP\Ôû	µ≥≤N\0\"\În\ﬁ¯(B\›<ˆÙÅf†u≥\»\”/ \0Å¸ æÑ\0ë\ﬂ\Ÿ\œ\»!\0Å≤∏A0A \0$É¿\”-”¨K\ÁN÷ßG˜dÑô!Ä\0ëW2Ñ&Ä\0\Z\'B\0Ä@Dà/!@D4ïh\»\ZnYÛ(\„Å\0 \0¥%@\n&fÚG\0\">g\ƒÄ\0öMÄ¯D≥\Á ˝C\0	%¿\r\"°é¡¨Ü S√ë\”! Å≠∂\⁄\ Fç\Zeã-∂ò\ÎÅ\"\‘1Å¶Y$ò\0DÇùÉiÄ\02JÄ¯DFß6√Ç\0\Í%¿\r¢^Ç\\ü°Œä\'\”;R0•\◊wI≥ºCáŒ§~˝˙\Ÿm∑\›f=W\\\…˛x\√6_èe\‹\Áß?y£πˆé≠fü∑\—2v˜\Ì∑\ÿ¿Åì6\ÏÅ\0j$Ä\0Q#8.É\0 \0Åö	_BÄ®yÚp! êm\‹ ≤\Ì_Fû\0DxVúäP\«\√5è≠<\ÿnø˝ˆ÷°wö£ã\Ìq\›c∂Úøpü=ˆ\ﬁK∂\Ó≥ˇ[Dg	c\Œ:à¨{òÒA\0H\‚K…õïX$Ç\07àD∏#@\0\"N»π	9ü\0øc«é6k÷¨6\"\ƒZª`ˆ<‹∫tùªMo√ß9$Ä\0DúÄ	Ä\0rFÄ¯DŒ¶<√Ö\0\¬\ﬁ ∆ç\Za\„.>5Ï•úÅP\Êõo>˚\Ôˇ[Ò‹®œ´\ÿ!\'@\0\»Åéù\Á∞\÷\ﬂ‹Ü¸\Ì:àú˘û\·\Êè¿e\„\'\€\–´\Êo\‡åÄ\0öF\0¢iìèé!\0Åd\‡ëlˇ`]\„∞¢q¨\È©8v@03¢$Pn\ƒSüæC\n¶(a\” \0@\0ÄÄ_BÄ\‡k\0@†(nL\Ã&Ä\0¡Lh6àf{ ;˝÷Ä\Ë¸S\rà\Ó?’Ä†uv|\ÕH \0@\0Ä@R_BÄH\ \\\ƒ@ a∏A$\Ã!ò\”4MCO\«?@Ä`*DE†CáÆ©~˝˙\Ÿm∑\›f=W\\\…˛x\√6_èe\‹\ÁQë¶$ó¿e\„_¥°z\'\◊@,É\0 \0Å\Ã\ÿj´≠\Ïé;Ó∞ÖZ\»V\ﬁnò≠7l∏€≠á\ÓdØ>4\⁄VX\€˛‹õLiø;Ω2\ﬁ∆éõô±D\œ\·zü,∆ñÙ\—L∫á∞\È\'¿\ÔL˙}\»¢!0m\∆Lõ\ÿ2\›ı\ÓMÉ¥Å*	 @T	å\”K\–K\‡®Q£l±\≈s\Á\Ã5˜ºmà\«\ﬁ{©M\n¶3˙-h˙≠\Ì^\Zõyx·§ô64∫\Ô<éπ\∆\nO\Ô¡Wﬂ±çz-\’\ÓÜgX\ÈLXV\"T¸\ÔY\Áñ\ÂÒeylö≠Y_m\ﬂÿ∂Wç?\ﬁ–Æ©Øæ˙\ nΩı\÷\÷\œ\Á¯\Ÿ\\ˆ˝7_+\Ô>;æ7¨[˜E ¢pBmåÉ*mB\0A¸\Œ0 \0$É¿\”-”¨K\ÁN÷ßG˜dÑô!P(@L\ƒ2K.a]ªv\ÕÃòkHö™\’2æ,\\Éè\¬{Òçè˛k\ÀuüØ\Ëpœ±‹ôpåÜc‹≠‡ß∏	7Ø}|\€xˆSßNm]\‡R\ÿ˚\€oøm\"\nèø\\\Àvørˆév@4\ﬁg°z$0\n\'A\0u\‡w¶x\\\n@\0HÅJ\ƒy-cw\ﬂ~ã\r80£¡D@ Å˛g^oOæSòS9Ä\0 P7âã/æxªvº\Ôu\Î\÷}ˆÆ\\à∫1\«\”\0Å¡x∏\“* ?¸\Œ0 0õ\0)òò	Ä@V	TJ¡Ñ\0ëU\œ3Æ<@Ä»≥˜; \0Å\Êòw\ﬁym∆å≠ù/\ﬁ{-˚\√Uˇ´˜Ä\0\—øT\Ïï¿`EDú\0\‘IÄﬂô:ryfPÑ:3ÆL\Ì@H¡îZ\◊%\ﬁBÇ\"‘âwB†nu#§@\0®íÄ\ÍC<˛¯\„≠Ww?\ËCà*Å6\ÍtÉç\"M?\»/~gÚ\Î{Fﬁñ\03¢\Ÿ(B\›ld∑à\Ï˙ñëA†\Ê \04öÄ\‚K\œNy\ÕfLﬂÇµºçˆH\»˛Ü\≈iÄ@\Õ¯ù©få\0D\∆ö\¬\· @§\–i)1ôL)qfB B¬§)@\0E@Ò•Øñ\Íc/\ﬂ{≥\ÌqÕ£≠µ B\·k\ﬁIõ«ûû!ê¸\Œ\‰\≈”å≥àJÑ¯{\‹ \‚&ú\ﬂˆ)Bù_\ﬂ3Ú¸∏l¸d:`\’¸`\‰Ä\0 \–pƒó\Ã:t\Ë`\Ãl÷¨Y≥\Z\ÓÄZ;\ƒqµí\„:@ ,~g¬í‚º¨@Ä»∫áì?>à\‰˚(≠\"@§\’s\ÿ\r@\0Ä\0\“CÄ¯Dzf+ñB\0\r%¿\r¢°∏\È,¡ ÏúúòÜ\0ëG7aò§`jt∫Ñ\0 \0@\09#@|	\"gSû\·B\0a	pÉKäÛ≤N\0\"\ÎN˛¯ íÔ£¥ZH\Í¥zª!P;R0\’Œé+!\0@†6ƒó jõ9\\dû\07àÃªòÜ$0m\∆Lõ\ÿ2\›ı\ÓÚ\nNÉ@¥ ¢\ÂIkˇ#Ä\0¡lÄ@˛PÑ:>g\ƒÄ\0öMÄ¯D≥\Á ˝C\0	%¿\r\"°é¡,@ wûnôf]:w≤>=∫\Án\Ï8^§`äó/≠C â í\ËlÇ\0 êmƒó ≤=\√ P3n5£\„B@\0Ä@*PÑ:n\¬HDJ\0\"Rú4@\0!_BÄ1M8\»#nyÙ:c.FÄL\Ã@ ´ ≤\ÍY\∆Å\“ òÄ\0 \–hƒó \Z=\Á\ËH	n)qf\∆NÄ\"‘±#¶É\nH¡\ƒâã\0)ò\‚\"KªH.à\‰˙\À \0dï\0Ò%à¨\Œm\∆\‘IÄDù\0π<3 2\„\ \‘Ñ\"‘©u]\‚\rßu\‚]ÑÅàú\0D\‰HiÄ\0* æÑ\0¡óÄ@Q\‹ òòM\0Çô\–l\Õˆ@v˚GÄ»ÆoJ@Ä`n@\0Ä@£	_BÄhÙú£?@ %∏A§\ƒQò;à\ÿ\”ALë∏êÇ).≤¥Å\‰∏l¸d:`\’\‰\ZàeÄ\0 ê9ƒó 27© \rn\—p§ïÙ@ÄHø\”>à¥{0πˆSÑ:πæ¡2@\0Ä\0 êƒó ≤2ó 1n•π\‘@ÄH≠\Î2c8Df\\ô∏Å @$\Œ%@\0Ä\02GÄ¯D\Ê&5Ç\0¢!¿\r\"\Zé¥í~\È˜a\⁄GÄ\0ëv&\◊~R0%\◊7XÅ∏êÇ).≤¥@\0•_BÄ\‡\€@†(nL\Ã&0m\∆Lõ\ÿ2\›ı\Ó	íx\Áùw\Ï\ +Ø¥.]∫ÿëGô\»\"@$\“-ô0ä\"‘ôp#ÉÄ@U(B].NÜ@¢§\·π5Q¿0&1à/!@$f2b ê,\‹ í\Â¨IÅ?¸\–∆åcw\ﬁyßùt\“I÷´WØv\∆?ˇ¸Û\Óoè<Úà\Ì≥\œ>vË°á\⁄,êûAf\ƒ\“\œ?ˇ‹±ø\·Ü\Ï\√∑cè=6ë#{∫eöu\È\‹\…˙Ù\ËûH˚0*Ω \“\Î;,á@≠ j%ó\œ\Îæˇ˛{ª\Âñ[lƒàˆ˛˚\Ô€ê!C\‹Û“íK.ôO MuZû[õààÆLÄ¯DÇß\'¶A\0\Õ$¿\r¢ôÙ\È;≠>˘\‰;¯\‡ÉmÚ\‰\…ˆ\„è?⁄ç7\ﬁ\ÿNÄò2eäu\‘QvÙ\—G[ﬂæ}\Ì˙ÎØ∑	&\ÿÈßün]ªvm\ \–?˝ÙS=z¥\Ìæ˚\ÓMÈøôù~ı\’W\Œg=zÙh#@HDZfôeä\nHÕ¥óæ!%R0EIì∂ ê\ÈS¨ú5kñ{N’ÇôSN9≈∫u\Îf\Áúsé=ı\‘S6j\‘([dëEöb&œ≠<∑6e\‚\—i]à/!@\‘5Å∏\».n\Ÿı-#´é@-)ò∆èo˚\Ì∑_;\‚á~∞O<\—\Êõo>Ù\Ó–°ÉÕú9\”<@\€j´≠lÎ≠∑ÆŒ∏à\Œ~Ù\—GM6K\…\€QLÄ\–g\«º\Ìπ\Áûyõ9/E®s\ÊpÜ3CÄ`\ZÑ%0u\ÍT\€w\ﬂ}›≥\Î/˘KwôÇˇz>\⁄p\√\rmˇ˝˜\€T§\ÁÒ\‹\⁄VÄ\‡π5\“\ÈEc1 æÑ\0\”‘¢Y@ \Ì∏A§›É\ÿÅZäPó ZZZ\Ï˜øˇΩùq\∆6`¿ÄVµö\Ï\›wﬂµø˛ıØÆA#è\È”ß€∞a\√lç5\÷Hl\n¢8y\n~µ\ﬂ\Ÿgüm\◊^{m\"R0\≈9Ú\›6Dæ˝\œ\ËÛI\0\"ü~Øe‘•ûgı\‹˙\‹s\œŸÖ^hs\œ=w-M\◊|\rœ≠mw\Ó&Òπµf\Ára¶	_BÄ\»ÙgpÄ@\Ì∏A\‘Œé+≥E JB©ñ¥Z¨0∞≠_}ı\’\ÓÛ\\∞¿3f∏\ÎîoW+Ûãâ¡¢tÎØøæ\€U±˝ˆ\€\€!áb\ﬂ~˚≠]z\È•6r\‰H˚\‡Élª\Ì∂s´\Ÿ:u\ÍdpÄ\›v\€m≠}˛\Â/q/ïJA§:\ Û˚Í´Ø⁄é;\Óhì&Mj˝¨Tj˚ökÆq6JlëΩw\›uó\Ì≤\À.\Ó\⁄bi¶æ˘\Ê;v¨\€\Ê/ªˇ˘\œ\⁄<`W]uï≠∞\¬\n¶ö\ =|\ÔΩ˜∫¥H√áwc\Ë‹π≥}Ù\—G.ùïjn¸\Ìo≥9\Êò√≠“õ8q¢\Î≥Oü>≠;QN>˘d;\Ó∏\„\⁄|V(@® µò˝\Á?ˇqLÇ\◊7kfSÑ∫Y\‰≥\ﬂ/)ò≤\ÔcFÅBÃâ∞J	<∑Ú\‹\Zvq<\‚K| \0%¿\rÇâÅ\Ÿ¢ \‚zë\”vx•|R^Awâ\n^|ÒE¨ø\‰íKl\À-∑t¡¸/ø¸\“\Œ:\Î,\‘W˛^\ÂÛ-¨Å\ŸgüπˆT@\€f÷ä≥ùw\ﬁ\Ÿ$nH)÷üÇ˛≤\Â\÷[oµM7\›‘ù£ù/ºÇ≥K;<îj™∏˝ˆ\€\Ì∞\√s´\Ë$Ä¸\ÍWør¢Ç˛[\≈u˝N;\Ìds\Œ9ßAˆ\⁄k/wæD≠\¬[~˘\Âmã-∂∞ó^z…çW\„ì\Ì˜\‹sèK+\ÂkqhïòÜs\œ=∑ı≥b)òJ˘©Y\ﬂ	àfë\œ~ø°Œæè! òµx\Êôg\‹Û\„\Âó_nõm∂Yk3Z r\›u\◊’ºpÜ\Á\÷l?∑\÷:ﬂ∏.\€à/!@d{Ü3:@†f\‹ jF«Ö#ê\"RHWê^)ûÙˇ:¸À£Ú¯˚\Ôª\Ô>∑¬øPÄ(îWÅm	$Jî\ÍØ‹µ\⁄±\€nªéÇ˛⁄±°\›k≠µñ;G;7$BHd(<îì¯\‘SOuBÖ∆†\⁄\Z≥VÂ≠π\ÊöNÄ(&$\Ë\Ôgûy&DòI\≈9ô\'Ä\0ëy3@¥#p\Ÿ¯\…6t¿™êÅ@E⁄Å´E-”¶M≥Û\Œ;\œV\\qE{\„ç7\‹bèÖ^\ÿ-¯¯\Ÿ\œ~V±ùb\'‹ö\›\Á÷ö&eû\0Ò%à\ÃOr\‘FÄDm‹∏*{\Z%@(˝ê\“0\Õ?ˇ¸5A,¯WCZ˝ØÙF\n\‚\œ5\◊\\\Ì\⁄.UÑπPî(%@Ù\Ë—£M\Ìà0\‚E±¥Bn\◊]wuªÇ53Ç\◊\ﬂp\√\r∂˜\ﬁ{\€*´¨\‚vYhßÑOcÖ\0Q\”T\‚¢ Séú\ÕP!\0\‘@@\‚É\“W\ÍyKDÜ\ÍRfj\·\«\‡¡Ékhqˆ%<∑f˜πµ\ÊI¡Öô&@|	\"\”ú¡A\0µ\‡Q;;Æ\ÃÅ(°\÷.\’*\Ë◊Ø_+®\”N;\Õ\’2®ßu©9≠¯W™%mï_bâ%R%@x\—cÎ≠∑∂}ˆ\Ÿ\«:t\Ë\–\Œ~•URä&çV*\'	W\\qÖ≠ºÚ\ \ÏÄ\»\÷Wë\—\ƒ@Ä\"\‘1@•I@\0&†›≥ˇ¯\«?Ï¢ã.™y\—L9Ç\Á\÷˝Zw\ÈäS\Zw\Ófx˙3¥:_BÄ®c˙p) êe\‹ ≤\Ï]\∆V\rÅ([V †\≈_‹•=R@˝Û\œ?w5¥äLÅˆZèRÑO¡¥¡\ÿ)ßúb\À.ª¨\Î˜¡t/é\n‘óJ¡¥Ë¢ã∫\"\“:ø; |\n&…ñ\ÌCÜqª8î‡¶õnrÈú¥\nOu%4ñ∑\ﬂ~\€?¸pWÑZi¢¥\‚O˙ì;w•ïVrh\”¯\"G\ràZø\\Wâ\0D%B¸\Ÿ#p˘\„ìm\œuH¡î=\œ\∆?¢…ì\'\€1\«cZ8£\Á\«zû[≥˚\‹Zœº\‡\⁄\Ï æÑ\0ë\›\Ÿ\Õ\» \0Å∫pÉ®gà¿¥3mb\Àt‘ªg\ËQ)\Â—∞a\√‹Æ\’#S¶Lq)ÖPWQ\ËkÆπ\∆å>˝Ù”≠k◊ÆE˚ò9s¶	∫w\Ô\ÓÅ.]∫¥;OB\∆AdK.πd´h†ìÙÇw\ƒG\ÿ\\\–\Ê\Z\’[\–\Œı©:\ﬂ}˜ù\€bˇ\√;1Du$¿ø¯\‚ã]p_cQ\Ìâ*.≠Ò…¶\¬˛|k•fRçÜŒù;õ/`›ø;Ò\ƒ≠c«é\Ì\Ï≥?ˇ˘\œm\ƒù$¥kDªG¸°˙JW%¡\Ê\‰ìO∂~¯¡9\‰õcé9ú†ó\‚=˜\‹\”^˝u˚\›\Ô~\ÁÚ+=ìär´\0µ\nQo≤\…&v˛˘\Á\€\"ã,\‚∆≥\ÿbã9ü®éÑDı©~:î\“I5%öu @4ã|ˆ˚%Sˆ}\Ã!PH†ˇô\◊\€á\ÔÑ\"\„è?∫\ZZ¿q˜\›wª∫}˚ˆ-{-œ≠˘~n\r5±8)wà/!@\‰n\“3`@ n\·8qÇ¸j.ˆ˝q\“I\'µ©ë†\œ\'Lò\‡DÅó^z…•:Ù\–CmÅ(	S+˛µK\¬˚ø;aÃò1∂Ù\“K\€6\€l\„Vß˘ö\'¥U~\‰»ën«Öv(PØˆt<˙Ë£ÆéÇ\Í,(\rîÑ¸e\„<\‡lTÆ_	ÎØøæm∂\Ÿf\Ó≥\¬˛æ¸ÚK∏\◊\Á:$R\Ëº?¸\·6i“§\÷\œ\n\ÎQ\Ë•VÅéﬁΩ{;aDbÖ•XzÚ\…\'ùòq\Áùw\⁄\⁄kØÌÑñ\Ì∂\€ŒâJª\‰!>˚\Ï≥N\—X4ˆ\ÔøˇﬁΩ0K¥Yj©•\ÏÑNp/—≤Obá∆Ø\ZA{eõ^∂µS\Â\ﬁ{\Ôu≈≥X˙ßF\Õ˛ß[¶YóŒù¨Oè\Óç\Íí~rBÄ\"\‘9q4√Ñ@Ä\0\”!,ÅW_}\’v\‹qGõoæ˘\‹ˇk\Ái©\≈2¡6yn\Õ˜sk\ÿ˘\≈y˘\"@|	\"_3û\—B\0°	pÉçä!\0@\0©$Ä\0ëJ∑a4\Í\"Ä\0Q>.Ü\0 \0Å\Z_BÄ®a\⁄p	 ê\‹ Ú\‡e\∆Ü@-)ò¬¥\À9Ä\0öMÄL\Õˆ\0˝C†Ò \Zœú!\0\‰ù\0Ò%àº? PÇ\07¶f®•5\Ï %R0EIuz\0\0\0 \0IDATì∂Ç(B\Õ|Ä@˛ @\‰\œ\ÁåÄ@≥	_BÄhˆ§@ °∏A$\‘1ò\’p\rGNá(BÕîàã\0D\\di\…%Ä\0ë\\\ﬂ` \0Å¨ æÑ\0ë’πÕ∏ \0Å:	pÉ® ógÜ\0Df\\ô⁄Å @§\÷uâ7úLâwB rë#•A@\0®@Ä¯_@\0E	pÉ`b@`6fB≥	 @4\€\Ÿ\Ìü\"\‘\Ÿı-#É@)óç—Ü\Ë\r @\0Ä@\√_BÄh\ÿd£#@ ]∏A§\À_Xà¯\ÿ\“r8\·8qVı ™g\∆Ä\0 \0@\0\’ æÑ\0Q›å\·l@ 7∏A\‰\∆\’¥¶H≥	 @4\€\Ÿ\ÌüL\Ÿı-#É\0 \0@\0I!@|	\")s; \0ÅÑ\‡ë0á`N\” @4\r=ˇD\0Ç©äP\«Eñv!ê\\óçülC¨ö\\±Ä\02GÄ¯D\Ê&5Ç\0¢!¿\r\"\Zé¥í~\”fÃ¥â-\”mP\Ôû\È#H%àT∫-F#@§\¬M	ÅH	PÑ:Rú4@\0!_BÄ1M8\»#ÅJ7à\œno\‹}≠}Ù\—Gy\ƒ√ò!\04å¿\”-”¨K\ÁN÷ßG˜ÜıIG˘ PO\n¶©Sß⁄∞a\√lÙ\Ë\—˘Ä\≈(!êq$√Ä\0 ê\"ï\‚K\„Fç∞NØå∑±c«¶hT’ô⁄°C\Î`f≥fÕöU›ïM<\«5>]C \'J˝\Œ|Ò\—Tªı∞\ﬂ\€˚/<\ÂH§\È∑3\'ÆcòÄ\0 \0ÅPj)B-\·a\‡¡6a\¬ûBQ\Ê$$ã\0D≤¸Å5Ä\0Ú@Ä86; Ú0\œ# PÅ\¬D°†&Zh!v@\‘¿ñK\“EÄL\ÈÚ\÷B\0\·	T#@|¡6d»êV\·AΩlª\Ì∂v\€m∑Ö\Ôê3!\0Å¶@Äh∫0\0Ä@\Ó @ @\‰n\“3`@ ÉX}mv<¥^›°Ém∞˛˙ô\ﬁ\"égeù\0E®≥\Ó\·‰èèL\…˜QZ-ìÇ\È\Í\ÀF\Ÿgú\—Fx\–xµç¸\«L\Î–±π%Ä\0ë[\◊3p@\0M#Ä\0Å\0—¥\…G\«Ä@≤	¯\ƒÛ∑]aü¯AQc;w\Ól\ﬂ}˜ù˚õ\Œ¯\·á\›o∞¡≠\¬ü\œ\ŒaáÙrX≥ˇ\0[\„Ä\Ï\‚ù6∆è?\Â\‰d>7~>Ø\‘˜W6\ÂôŸ©\Ô\‡\ﬂx˛YΩØu\Ï\‘\…ˆ˘\◊6_èeä\ﬁ\Á\œ\€hõ´\„,˚¯\„è\€˝}Ò\≈∑W\\ë{?\ﬂIû˘Rˆ\Ï˚ı\Ê{\€á\ÔƒΩÑg\Z\ﬁ\ŸJºª>ˇ¸ÛÓû∑\⁄j´Ò˚ñ≤\ﬂ7_?Äg\Â\‰=+\À\'o~ÒÉΩ3qú˚~≠∑\œ—∂ﬁ∞\·≠œó‘ÄHh|\Â(°é¡,dà\0; 2\‰LÜRv@‘Öèã# 0Ú\—I6˜úsÿÆkØAk4Åˇ(\‹Q\»F; ò1\»v@dÀüåÄ@\Z\«fD\Z\Ê)6B\0M P¨\ƒ-á˛\ﬁ>xqˆ\n\\‘ÄhÇc\Ë≤\· \Zéú @0%\‚\"&\”›∑\ﬂb4j@\ƒ\Â⁄Ö@c	\\6~≤\r∞jc;•7@\0\»5à\\< Pö@©Da1\ÍY≥fÅô&Ä\0ëi˜¶bp©pS*ç¨¶µ\‡‘©Sm\‡¡≠5!xH•\Î1\ZÄ\0 \04å\0D\√&A\0\È\"P\ÈÒ\‡9\√\ÌıªÆ)ö:]#\≈Zî\'Ä\0¡i6àf{ ª˝\◊\"@Öàa√Ü\Ÿ\Ë—£≥àëA\0Ä\0 \0\‘M†R|â\Zu#éßWZÖ\0˛GÄ\ﬂff@Ä`&4õ\0D≥=ê\›˛´I¡î]\nå˘\"p˘\„ìm\œuH¡î/Ø3Z@\0\Õ%@|âÕùÅÙ$ñ\07àƒ∫\√\ZL`⁄åô6±e∫\r\Í›≥¡=\”f@Ä`&\ƒE Lj_\".hh,äP7ñ7ΩA\0ÄÄÒ%æÄ\0ä\‡¡ƒÄ\0 êO∑L≥.ù;Yü›ìaVdÜ\0Df\\\…@ ö\0DhTú@\0 æÑ\0\—T¢@ k∏AdÕ£åÄ\0 –ñ\0)òò\»à¸˘úC\0h6\‚KÕûÉÙ$î\07àÑ:≥\ZNÄL\rGNáÄ@É\‘SÑ∫A&\“\r 1ààÅ\“ \0T$@|	¢\‚$\·@ ü∏A\‰\”Ôå∫=äP3+öMÄL\Õˆ@v˚GÄ»ÆoJ@Ä`n@\0Ä@£	_BÄhÙú£?@ %∏A§\ƒQò;à\ÿ\”A°fä\ƒEÄLqë•]$ó\0Dr}ÉeÄ\0≤JÄ¯DV\Á6\„Ç\0\Í$¿\r¢NÄ\\ûôqejÇ\0ëZ\◊%\ﬁpäP\'\ﬁEÅ\»	 @Déî!\0@†\‚K|I \0%¿\rÇâÅ\Ÿ ò	\Õ&Ä\0\—ld∑à\Ï˙ñëA†Å\À∆øhCÙ \0@†aà/!@4l≤\— ê.\‹ \“\Â/¨çè\0D|li9àpú8´z§`™ûW@\0Ä\0 \0TGÄ¯Du3Ü≥!\0Å\‹\‡ëW3\–\n ò\"\Õ&Ä\0\—ld∑äPg◊∑åÄ\0 \0$Ö\0Ò%à§\ÃE\ÏÄ\0FÄD\¬Ç9M#Ä\0\—4Ùt¸¶B\\ \‚\"KªH.Å\À\∆O∂°VMÆÅX@\0ô#@|	\"sìöA\0\—\‡\rGZI?Åi3f\⁄ƒñ\È6®w\œÙÜ§í\0D*›ñ\n£I¡î\n7a$\"%@\ÍHq\“ \0Ñ @|	\"\ƒ4\·@ è∏A\‰\—\ÎåH\"Åß[¶YóŒù¨Oè\ÓI4õRLÄ\"\‘)v¶C†F5Ç\„2@\0®ô\0Ò%àö\'B\0\Ÿ&¿\r\"\€˛etÄ\0 \0\Ê\0ÚG\0\">g\ƒÄ\0öMÄ¯D≥\Á ˝C\0	%¿\r\"°é¡¨Ü S√ë\”! \– §`jh∫Å@Ç @$\»ò@ \'à/!@\‰d™3L@†Z\‹ ™%\∆˘Y%@\Í¨z6=\„\"Sz|ï6K)Bù6èa/\Í\'Ä\0Q?CZÄ\0 \0Å\Í(æÙ\Ã\Àˇ\\4\Îßˇ\Ó\–˙\Ÿ\Z´¨hc«é≠Æ\·ù›°C\”hgÕö\Âü|\Î	&\ﬂGXÅ¥ø3Ω6‹™\ËP^}h¥uze|¶oi˜!ˆGC\0\"\Zé¥R;äP\◊Œé+\Àê\0±\À?\Óo=\Èäˇºd{,ã\÷_ø\œ ª˚ˆ[l\‡¿Å†Ñ\02B\0\"#édÄ\0RD\‡æ˚\Ókc\Ì=/Ω\Ì˛Ω\Ÿ/ñiÛ˘o˚\€ç™:S ™\„\≈\ŸÄ@NHÄò8ir\Îhg\Ÿlëv∂f;˚X≥œ™9ôy&DûΩüå±#@$\√Y¥b\Ó\⁄6ˇv£ç≠ÀÉ¥\Í]ˇº\"ã\ŒgLπ%Ä\0ë[\◊3p@\0â!p\Ÿ¯Ÿ±¶°VMåMqÇ\07a⁄á\02A è7àL8éA\‘M\0¢nÑ4P\'à:r9 \0¥\–3}û>∏Ä\0íG èÒ%à\‰\ÕC,Ç\0H è7à∫ìö@\0¢	\–\È≤\r& \0@\0Ä\0 êyå/!@deˆ2@ VyºA\ƒ\nî\∆SC\0\"5Æ ¨°ôum\‚∂\—\Ë{\Ì¡≠6Mú]@\0Ä\0 êœæ˚°L\ﬂ%\ŒŒ†*å\"7Æf†Ä@= \Í°«µi&Ä\0ëf\Ôe\√vàl¯1\r£\Ë<\Í\n˚~\ÿi0!\0Å\Z	êÇ©Fp\\@\0®É\0D∏\»à¸¯öë∂%0m\∆Lõ\ÿ2\›ı\Ó	\Z4Ö\0DS∞\Á≤Sà\\∫ùA\Áå\0E®s\ÊpÜ@\0â Ä\0ë7` êtI˜ˆA\0Y%t\À4\Î“πìı\È\—=´Cd\\	!@\n¶Ñ83 #à\·\“4 \0Ñ\"@\n¶Pòö“Ø˝k˚a•∂ﬁ∞\·Eç7jÑuzeºç;∂˘\∆b ê	ôp#ÉÄ\0 \0@\0\»1à;ü°C\0HÅ<∆ó\ÿëê…áÄ@≤	\‰Q°N∂G∞ÆQH¡\‘(\“Ù@\0Ä@\‹ \‚&L˚Ä\0 Pâ\0D%B	˘;; \‚ÃÄ\0 \0Å\Ã†u\Ê]ú¯íÇ)Ò. åÅ§` å+J@Ä`r@\0Ä@≥	 @4\€!˚GÄ	ä\” \0@\0u@Ä® ó\◊MÄ\"\‘u#§Åê(BßA \≈ R\Ï<Lá\0 ê)q$DJÖô\»R0e»ô•*U\·\‚\‰ @\ƒ\0ï&ã@Ä`b@ ˚ ≤\ÔcF@ \È íÓ°ü\ÏKã\0°Ä\0 \0@\0Ä@Ú	t<\‰˚Ò\Ï3ío(B\0Ä\0 \0@†ÅfÕöUWo°Æ_˘ã∑^\≈h^jöæ˚\Óª\Ì\¬/¥ª\Ó∫+56chˆ\‰Q°ŒûQ-\ÿQ5Æâí\0; ¢§I[Ä\0 \0@\0Ä@3	§-æE|\"\∆ÖÉb4/5M#@§\∆Uô64m7àL;É¡5î\0DCq\”YL@\0Ä\0 \0@ +“ñ\‚;ä¯6Då≥∑Z}Ú\…\'∂Û\Œ;€Ä\Ï\ÿcè-k\Ÿ\…\'ül\Ôøˇæùs\Œ96\◊\\sπs_}ıU;\·Ñ\ÏÇ.∞è?˛∏ıø\\p¡Gi&ª˜\ﬂ\◊\ﬂRK-e|∞\Ì∫\ÎÆnQQP§çz	 @\‘Kê\Î\”J\0\"≠ûÀé\›\ŸÒe\“G≤\—\Ë{\Ì¡≠6M∫ô\ÿ\‘A@\œÙC¨ZG\\\n@\0\»Åj\„\€\≈\Ë @\ƒ8g™uPXBBÉÑ\nˆ˜\Í\’+1Ñ∑%J¨Q“§≠Z	 @\‘Jé\Î\“N`⁄åô6±e∫\r\Í\›3\ÌC¡˛î@ÄH©\„Rh6E®S\Ë4LÜ@ï(B]%0Ná\0 \0Å\‹®6æç\0\—\‡)têv,w\‹qŒÇa√Üµ\Ó\\êò∞\„é;⁄§Iì\‹\Áoø˝v\≈\◊^{m\ÎH\ﬁ|Û\Õ\÷\›~\ƒI\'ùdpÄç3\∆6\Ÿd\”˘\⁄\·˚Òüig\ƒ¯Ò\„M\ÁOü>\›˙ı\Îg;Ï∞É]zÈ•Æ˝n∏¡˙Ù\Èc7\ﬁx£9º@¢vu\Ë∫\√;Ãâ £Fçr\Á^y\Âïv\—Eπ=Ùêı\Ï\Ÿ\”\Ì\Í\–!;ºΩ¡q\Ì)\Ê\"àO\\∫+J\0Çâ@†9ûnôf]:w≤>=∫7\«\0z\Õ\rà‹∏öÅ\Êò\0Déù\œ\–!\0$Ñ\0)ò\‚àJf¸˙◊ø∂V\Z`\Î\r^Ù\‘q£FXßW\∆\€ÿ±c+5\ÎﬂΩ\0° ˇ∫\ÎÆkè=ˆò-¥\–BN8¸\√m\‡¡.x/\—A¡˘W^y≈ùß¿~©L_}ıï¸Ò∂\Áû{∫∂é>˙h;ı\‘SMbB©L\Z§D\0µ©¥H¡ÙM\œ>˚¨\Ì∑\ﬂ~≠\"C\–÷æ}˚:˚zÙ\Ë\—*4¨∑\ﬁzÆ-ıu\‡Å\⁄˘\Áü\Ô\Ï(ñÇI˝^}ı\’mvkHòXi•ïJ\⁄\„\”IÉ\0\Î4•Òê BÇ\‚4@\0Ä@J	êÇ)•é\√lTA\0¢\nXú\n@\0±H[|â) 4k%B¯\⁄~Ä\ƒı√§`\“5ó_~πùx‚âÆˆÉƒÑ\r7\‹–µYJÄê∞°Û$r\nÖì\0<7∏k!¯≠\÷}(%@\Ës/R\ËZ_ü¢ú=\≈\ÍU @\ƒÚ{G£UHõB]\Â8%	êÇâ\…@\0Ä@V @d≈ìåÄ@z	 @§\ƒwi\€°]>MëG\\∏\"¨\0!A`ó]vi\„)øc¢ú\0°ù¡√ßVRj&øKAÇÜà‡øÉÑ\ﬂ\·\€Òmî ¸\n\Ìz\–.ü~©∞µLıT8\r RÚ\≈\ƒL@ ì(BùI∑¶jP§`Jïª0Ä@¢	 @$\⁄=@  R\‚\Ê¥	A¨^@P\›\ÌbP›á!CÜ∏ÙHïv@¯ø˚TJj7∏Aˇˆª$,wEÖ†=ÖÇC)b\ﬂ}˜mì6)\Ã\Ì\ Ü˙Ù;5\n˚®4\Ìˆ\ﬁ{oõ1cÜ´I¡@\0ç%Ä\0\—X\ﬁÙ÷û\0E®ôç\"@\n¶Fë¶4è\0DÛ\ÿ\”3 \0\Ã&Ä\0ëíôê6BA¯3\œ<\”\’YXj©•\‹n#Få∞\·√ááÆQòIm¯\›™Õ∞\Êök t^∞Ñ\Ïë \·\ÎNÑ\ŸQ(@\«TjÑO•öã.∫hk\n®B!%hOa\n¶˚\Ôøﬂ∂\€n;{Ú\…\']\Ì4ã\0)òöEû~õM\0¢\Ÿ†\Ê@£PÑ∫Q§\È\Õ#Ä\0\—<ˆÙ@\0≥fÕöïöyê6B`UW\·∏\„ésåÉ\ÈÜ|0~Ãò1n7ÑR)p_¨µ\⁄\–Q¯7¿◊éäs\œ=\◊.∏\‡wûD˙ªvDHò4iRõ˛\√\ÓÄPü¡ÙO£Fç2∞Vz%üji¬Ñ	v\ÂïW\⁄E]\‰>\◊8º@¢B\÷Aª}˝ãB{Çìp\Í‘©∂ˆ\⁄kª\"\÷\⁄%\¬ÅfHõB\›LVÙù-\ŸÚg\ZGÉ\0ëFØ•\”fàt˙\r´!P\r=\”∞j5óp. \0@ Riã/QÑ:%E®#ù•9jlÛ\Õ7w\ƒÒ\«ü£Q3‘§H\€\r\"©±+} \“Á≥¨Yå\0ë5è&w<§`JÆo∞Ä\0 \0dÖ@\⁄\‚KY˘\Óµ\«GaoΩıñ\›|ÛÕô#KÅ¥\› \“EkìL\0\"\…\ﬁ…ám˘3£Ñ\0 \0@\0Ä@§-\≈7D&øóW]uïùv\⁄iÆ\Ó\√<ÛÃì\…12®Ù@ÄHüœ∞8\Z\—p§ï\⁄	 @\‘Œé+!\0@†-R01# \0@\0\’@Ä@Ä®n∆§\‡\Ïgûy\∆˙ı\Îgè<Úà≠≥\Œ:)∞ÛB\0\"/ûfúÖ¶Õòi[¶€†\ﬁ=ÅÅ¶@Äh\nv:Ö\0 êI°Œ§[ \0\ƒH\0\")Ñ\¬æˇ˛{W®˚∞\√≥Ω˜\ﬁ;¸Öú	Å	¸ˆ∑øµ˚ÔøølãÎ¨ªÆç7.\¬^i\nÄ\0Jx∫eöu\È\‹\…˙Ù\Ë$@\0Ä@] \Í\¬\«\≈Ä\0 R0E\0±M¸˙◊ø∂V\Z`\Î•@Ä\ÿnª\Ì\ZÅ$3},ª\Ï≤v\∆gdf<$}$@\Ã\\j5\€`ˇä\Z?˛Ú3\Ïª\ÁDÄHük±Ä\0 \0@ \Á r>> \0ÅH[Ü\rv@§@Äò5kV¶6&@\0a	 @Ñ%\≈yy!@\n¶ºxöqB\0Ä\0≤O\0\"˚>fÑÄ\0íN\0\"\È˙…æ4\ÌÄ@ÄH…§\¬L¸D\0Ç©\0Å∂(BÕåh6R05\€Ù@ ; ≤\„KF@ ≠ R\‚9àî8\n3!êB)t\Z&\«J\0\"Vº4Ç\0E®C@\‚@\0E\0\"&NÇ\0 \0Å	 @\ƒ7 ¶ ¢§I[Ä@ê\0Ûm	 @0#öM\0¢\Ÿ†@\0\Ÿ!Ä\0ë_2@\0i%Ä\0ë\œ!@§\ƒQò	Å@ÄH°\”09V±\‚•Ò B@\‚@\0E@Aü°V\ru.\'A\0Ä\0\‚ Ä\0\’\⁄DÄà*MB\0é\0m	 @0#öM\0¢\Ÿ†@\0Ä\0 \0@ *Qëåπàò\”<rL\0\"\«\Œg\ËE	 @01öM\0¢\Ÿ†@\0Ä\0 \0@ *œæ˚°k™\ÔíG\’d¨\Ìt\Ë\–¡fÕöUWj£Éô⁄©Ø°∫¨®Úbà*Åq: ö\0DhTúò9qtÇáâ\0ë`\Á`\Z \0Åî∏¸Ò…∂\Á:§`Jô\€0Ä\0öH\0b\ÿ¢¯«ç\Zaù^oc«ém¢{Ã¢pPS@\Á\»!Åº3fÃ∞;\Ôº\”\Óæ˚n;\ÔºÛl¡l7¬ú”à©ì;\Z1\÷FÙÒüˇ¸«Ææ˙j\€m∑\›l˛˘Á∑ã.∫\»&Lò`«ûvÜΩÚ\…L‘ªg3æ˙\Í+{¯\·á\Ì™´Æ≤N8¡zı\Í\’3\€ıë;ö2¯ùæ˚Óª∂\◊^{ŸÅhõoæyà+äü2zÙh\Î÷≠õiàûo\Zy @4í6}A\0\»6äPg€øåÄ\0¢\'E|õ\—˚•µ\≈(£y4\r!ó\0°`πÇµW\\qÖq\ƒ÷øˇ6Ωˇ˝˜ˆ\‹s\œ\Ÿı\◊_oã,≤ày\‰ëMÒ\œ\Ÿgüm\Áüæ≠¥\“Jv\Ìµ\◊ \nœπ˜\ﬁ{mó]vig\ÔÍ´Øn;Ï∞É\Ìπ\Áû÷Ω{˜\»\«\∆\÷(:˝\‰ìOl\Áùw∂1c∆îmÓ§ìN≤cè=6tó}Ùë]~˘\Âv\”M79ﬂØΩˆ⁄∂˚\Óª\€6\€lc∑\ﬁz´\„6\◊\\sÖnØû[ZZ\Ï¯„è∑˝ˆ\€\œ\÷\\sM`ˆ\ƒ\ﬂˇ˛wõgûy\⁄5˚\Ì∑\€aáfs\œ=∑\›x\„çˆÒ\«€∫\ÎÆ\€\Ó<	[l±Öp¿∂\Ã2\À\‘cf\—k\Ìhñ˘¿\"j0*B\’q\«g˝˙ı≥\ﬂˇ˛˜÷±c«à,l\ﬂÃÉ>\ÿ\Ê\√¯©u\Ó\ÿ\—z.4oõ\œ7\⁄h£\ÿl†a@\0\»&àl˙ïQA\0HR0•\ƒ[§`Jâ£0)$á\0°\⁄\n\Óé7Œ≠(\Ï±\«l¿Äm\Ë\‹|Û\Õ6r\‰H{\·ÖÏ†É™*ê5f	Z	_JÄPÖ\ÁhåVæ˛˙k∑s¢Kó.ˆ\–Cπ\œt5jîV¢>\¬\ÿZKüd∑Ç\Ÿ $.zË°∂\‘RKπKê\ÿu\◊]\›ˇˇ¯\„èv\œ=˜\ÿ\‰…ìC	GJy¯\»#è\ÿ˛˚\ÔoÉ\rrÅ˘\≈_‹æ˚\Ó;\'Rs\Ã1N\0∫\¬]pø\÷\„õoæ±n∏¡â@ÂÑåO?˝\‘˘\ÈêC±ïW^π™\Ó∆è\ÔD	b%˚\€\ﬂ\Ï˛˚\Ô∑ÎÆª\Œ	X\œ>˚¨}Ù\—ˆ\Ÿgü9Æ\⁄>\¬ThGòk¬úÛ\‘SOπ\\óá\“pÑıy\ÿÛ\n\«<s\ÊL7«∑\⁄j+\”oe\\Gøu\ÿKØΩY∂˘u\◊\\\Õ}\Ô8 \0@\0\’@Ä®Ü\ÁB\0Ä@(B\’\⁄DÄà*MB\0é@ÑG˚Í´Ø⁄é;\Ó\ËÀÖÑ\ŒQˇ\‡É∂=z§NÄê˝\'ü|≤Ωˇ˛˚v\Œ9Á∏Ä∑∑_|±\Ìª\Ôæv\Õ5◊∏`}\‘GÑå¥AAı>¯¿	Cõn∫©3øPÄæSäö\Ì∂\€\Œ:u\ÍTvòS¶L±ùv\⁄\…˝O¢F\ÁŒù€úØøè1\¬\Œ=˜‹¢;P\¬2\‘|\”ãO<±§\0!]v\Ÿeˆ˘ÁüªπW,µŒ¥3mb\ÀÙv)òdG±¿1ü(P¨Ù?ö##¢N\·á\0Ò\√?\ÿgúa,˙}\r\ÎáFû\∆\Á≤\'\Ïy\≈lÎ≠∑l¯\·Nh\“oUáàüˇjS\Îø«°Eõ\ËºclæiS \‚ÄOõÄ\02N\0\"\„fxÄ\0R@\0\"Níâ)qfB Ö \⁄\Ôn(\Ê\∆bA\ÊB\¬®ïñß\⁄ÙDaßN\‘ÑÚJÉ•ÙNjªX:übDX{µÚ\\x\ÌÇQ?\À.ªlªKeÉ˙\ﬁl≥\Õj ¥R]ª\ZD˜ÇP1ßNù\Í\"âø¸\Â/ã£\\\Í∞Ñﬂîæßú=a9ûá\0°]*Jâ%_kµ5Æ\Î\¬˙<\Ïy•\Ï‘úR™±\Âñ[Œ•	ã\„@ÄàÉ*mB\0ÄÄ @0 \0@†\Ÿ öÌÅê˝#@Ñ\≈iÄ@\’\“$@®PÙ_˛ÚWxµ\’V+:V≠\ÊøÙ\“K]z\'Åï3˝îSNqy\‹˝°ÒJu\À-∑\ÿˇ¯Gó˛\Áüˇ¸gõLa\Œ)&@(x´˙\⁄	Òá?¸¡∆é\Î\Ô*à´>x\‡gˇ\n+¨`oø˝∂[˘Ø˙J=§\ÎîhÅe´ØE—ßOü÷î@≤IyÎÉü©±_|—≠\‡V˝\0•Zí@≤ı\÷[;[‘ßÚ\›\Î(ºNüï îÇH©ß˛˙◊øöÚ\ÿ+uèRjigÑv:®÷ÇÚÁØ≤\ *.U\’\œ˛ÛäsT\Ï5q—°îJ≤Wu5dãx™]•Ñí∏°U\È\nkgÉ?Ü\rV4ØTI≤C)∑Tx\⁄¡v∑\ﬂ\Á\œˆèß^±ãw\⁄\ÿq9Î¨≥ú?5ó∂\ﬂ~{;ı\‘S[y\Î˙b¢ê	*J;%±c\‚ƒâÆ\r∞_z\È%gÉvk(–Ø\⁄˙∑v\Õhg∆ê!C\\¿{\…%ólµØú¡Z>›ôüáj òMl5ç_sÓ®£ér6I|Pj)}g¸Q,uö˛&¡\Ë\…\'ü¥\”O?\›˘\\\Èâ\‘\∆kØΩ\Ê|¢ù%JA\Ê}\Âó_∂\÷	˙%¨üˇ¸\Á?ª˙\‚\'¶≤øk◊Æv¯·áªœÇ>\◊ﬂ¥{Gü\Ô≥\œ>÷ªw\Ôv\ÁId\—\Œ%}uxõÙ\ﬂ\ﬁˆM6Ÿ§\Õ\ÔÅRn\›u\◊]uß	+5˘ *˛,p \0\‘H\0¢Fp\\@\0ë@Äàeº\r!@\ƒÀó\÷!êgY .∏\‡{¸Ò\«]†Pp\ÂoWÄW¡\Èy\Áù\◊˝pî †CoºÒÜùp\¬	.\–\Ïk@Ñ9GsFArù´\‘A\nàr7\‹\0\0 \0IDAT*æÇ\Ô\ÍW¡dZˆEã%ú¸\ÍWørs˝˜ús\Œ\È£˙˜Zk≠eoæ˘¶~*@Ø‡≠Ç\„a\ÏP™ë}MáØºÚJgìˇ\Ïôgûq∂JàQ=\Ÿ\Ê`Æ¥öæî\0\·wO(≠∂%\»\’x\–X\ƒXÅj\Õ1ç5L¡j/\ﬂ{\ÔΩ]qg\ÌTx˘\Âóm\Ë–°.ï◊ü˛Ù\'\'Æ(pØ\0±\Ê™#Òˇ˜Æê∏Ç¯¡îX≈æ◊ßùvö/Çªæ˝ˆ[\'p(\»-Å·èá\„à\”6]\√ı˘õ\ﬂ¸∆âCö#JQ$Q…≥Uö7™ı†ˇ_x\·Ö\Ìı\◊_w\„Wçâ\\\‚§\0ΩD âcoº±ÉLÒR∫.Æ\÷\\ïo4n˘IbëjVT≤CsMådáﬂΩ ;7\‹p\√VB\„V0_∂âØ˛.∂\‚&1™R\ 4\œSı[4\÷3\œ<\”\Ì\nx˙\Èß\›w\ \'*0\Ôk`x\ŒVÙ›òcé9{˘≠îü\ÂW\ÔÒëê†\Ô™\ÿH\‘\€r\À-\›¸w0\ËÛ\Áüﬁµ+õÇJ°X®∂d£\Êõƒä˘\Êõœµ\'ó\\râ˚M\÷#\—wD\ÏTcd˘Âóè¸ñÅ\09R\ZÑ\0 \0Åü @0 \0@†\Ÿ öÌÅê˝#@Ñ\≈iÄ@\’\“$@Ñúà?¸\–qUõ ∏:]AFê}\Õ_ª@\Ì–πa\ŒQ°a¸º\„é;\\Ae\‹÷° ¨Ú\≈+p¨CÅKµµ˚ABÉ≠\÷◊™xjıv<˙\Ë£ˆª\ﬂ˝\Œ4Ñ+\Ÿ*;J•RpXArŸ°\‘D\Í\€◊§PUª¥˚C˜óZ•3\⁄m∑\›\\˚\n\“˚±\…\Ó˝\Î_nßÇ\ÍITìíJaú∞◊éÉbuB\ƒLw	¡]\≈v§ÁåÑâ?∫¶ò\‚Ø˜\ƒz?Nw´\‰\Â	L:¥ÉBbJ°\0°]w$ˆH®P¿\\}≠æ˙\ÍÆ˛É\ÓK@<xp´Y\ZÉvp˚s\≈VÅv∑ÆdG1Ò@~{\‚\◊Yg¯\◊n_ìB©â\Ë\◊\Ó\Ì\n#@\»\Á\‰s˘GG)Öé\Œ˜D?kc\—Eu\ﬂoq-\ÊÛb\„(vûv¢®.â\Ï\—X$I∏Sj.?6\Ô®W^y≈ç[~Zcç5\¬¸UuDU∏8Ä\0™ ††\œ\–´VqßB\0Ä\0¢%Ä\0-\œ\ÿZCÄà\r-\rC ˜≤&@»°J§\‰Z≠¨U\‰J±$q°c«é.EåÇé¡\—Aë\"\Ã9A¢“ä˚b¡}ø£@+’ÉÅp	JW§\"¿J\›S\…\÷0\ƒB-\‰∆™\‚\œ^$(úÙµ\n¡\0w∞fÄÑîı\◊_\ﬂæe£R(≠∑\ﬁz.u\Œ\œ~ˆ≥P\ﬂ9¨%\Íhw√ùw\ﬁ\ŸfE)°°í\0Q©\ËyPÄ∏|\¬\À\÷˘ÒôÇ\›AÖ≠Q8\»bAÒ¬†º\nô\ÎêH†\’ˆ¶¥c\„òcé©hG%¢oﬂæNÃê ¢\›\n≈é0ƒÑ	\‹\‹\÷©EÄc≠\∆\œ\≈x\’#@H\0îê!ëL\"ì\ƒ/•\”Óá†∞%VaÿÑö\ÿ%NBÄ®á\◊B\0Ä\0 \0@\0I&Ä\0ëd\ÔlCÄHâ£0)$ê5By\Âµ º[∑n.À≥\œ>\ÎV\‚+`™C¡xˆK	aŒâJÄP]\nøí[˝zaB¡{\Ÿ^\…\÷jµ©U\Î~∑Ep™\÷+@høD¯˙˜\›wü\À¡ØÄµ\“I\…\⁄-R\Ó\–*t•R\‡]µîñHAa\’CB@≠Ñ\ﬂ1\œ<Û¥\·\Ó\Ì	\nóMx\Ÿ:éª\Õ’óà[Ä–éò`}hóØî\⁄J)∂*\ŸVÄ\–XK\≈d/6Wj $DU\Î\Á®±PΩ•\◊	óJõ\Â\”;\Á©\ÿhÑÑ\nv@§Fá\…Ä\0 \0@\0Ä@\”<˚ÓáÆ\ÔæK.\‹4™\ÈXª\Ìõ®\ÁPf\◊P¨Ø°zå®ˆZàjâq> ñ@ñ_?@¡v•w\—~pwCó.]\\\›\0≠nVö \’a–°s¥\“^©n≠téjË®¥\‚^\Á\ÿ˙@∏j®Ùbã-\Ê\⁄\”JlC}]à0v®}\’∏È¶õ\‹N?üÇi©•ñrU¨˛˚\ﬂˇ\Ó\Í®FÖ\“T©®∑R\Ô®fÜ˙\n¶\nŒüR5 |Åi•´Ò)Øtù\“âØõÑ•÷∏¥C˝≠DWÅ_\’»ê]™K†Z	Z≠&∏\Ì\€\n\„èb5 \nØw)òûúbLkJΩLıTä∑ä:˚\Z\"≈æ{•Ç˚\n|k¨™´ã_¸\¬]™z	ÚáÊ±Ç\ﬁ@*\Ÿ\·\€W-/¶`Rö(˘E;Q4œ¥A|eªDπw\ﬁy\«’ëPö°\‡éñ\‡x∞Wö0Õ•J)ò‘ûV\n\≈\Ÿ[≠ü\„ ¸.àˇ˚\ﬂn∑é\Íqx?\«M\rà∞wŒÉ\0 \0Å§ S\“<Ç=Ä\0 êt√Üı—∏Q#¨\”+\„\›j\¬fQ8®ôˆ\”7ÚH NB´âïRHA\ﬂ\Õ7\ﬂ\‹	¡\√¶]`Å\‹Jo/îÚÉ~„îöFÅ\Ì\’V[≠\›i*÷´@\Í\⁄kØ\ÌV˚+ˇ\Ÿgüm\'Nt+ú%<¯\"µ\ÍOAX]£‡πäT´8»ë#]˙&\Ì@(w\ŒK,\·˙Pp^\€¬î-\ﬁ8osP \–\ﬂ\»Uéˇm∂\Ÿ\∆\’c\–\ÿU<z“§I.H¨ö™£P\…1U@XÅSçG¢ÜÚÿ´-jV@Zy˚%4H0\–!\ﬁ\À.ª¨c£`µ\Íh∑\≈?˛Ò˜wb{ı\Í\’\ W◊â´R)©0¥\“TÈêêØkN?˝t‘ñ∏!û™}†\‡¥R]\…>yeèjch\ÃL|ç\ÌåP\0\\∂jGàR¸h<Úá\ƒw\’zêp°U\ÁöK\⁄	°\Œ”¶Mk≥k@ˆ\»\«Jˇ§b\“\n´ÉØ\›\‡#qDAqıÙô/ú¸\⁄kØ\Ÿi\Á]`Ø˝˜k[Ùõˇ8\·D\"Ä|§±\»7æò∑∆Æ\⁄\Z≤Gi¢\‘\Ê\“K/]t˙˙\ÔÇV\–wãHt\⁄cè=\‹u™≤\»\"ã∏∂î:LA~˝[Û∑íÚWp\Ó{>b¢](™s¢˙&\ÍKÖ¡u®»≤¸†B\ÌÚøîT,z\’UWµˇ˛˜øˆÒ\«;1D\„ñ8Òı\◊_ªyØÄΩ\⁄V\›çA\≈\÷UK\¬\Ôëò•ÔΩò¨∏\‚äN`\“ëê¢\⁄#\⁄\Ÿ\"Æ•¸¨\⁄˘¢g˙~©ÄºˇΩê\Ìö„≤øò\œeõl\’ıæ\ﬁFππ\·˘˙∫+\≈~á4ç!X´#\ ˚)ò¢§I[Ä\0 $@j\Ê \0@†:Qƒ∑\ŸQÛ™Œé\¬AUu\»\…Ä@\›\‚ ¥\Z]©ê¸°ºÛ¡\‘/~u∂ˇ{ü>}JÆ¿˜\Áh≈æÇ€•\ƒU\ÏY)k¥\€Aπ\‹%(\Ë-\·bØΩˆr¡sù£Ä™Ç\Õ\nn+\‡Æ4B\n2+à™£\‹91\Ï\r\n\”:\ÈoZ/Q@á˜\Ôﬂøı2µ3b\ƒ∑;A©âò◊™p4WJòJ∂\Íı#Eª4fü«å\„\∆,°Fø\ÕBÙ7\’Uê8 !A)é¥A≈à\≈Av(h,QƒãEÖ~,Ùì˜∑\‹rã+∞≠∂\Â£\r7‹∞U®–Ä\Ââ.\⁄M0zÙh\ÏV\–\\|êˆ©ôdã\«	$i’ævPhå\⁄’°tZ\n¶KDQ_|J,≠™WÒj	WVXaÖv\ﬂâ1\ZªÇ˝*6¨√Ø¨Wª:$Ü®?ıÒ\ƒO∏y¸\‘SOπ˘£\Ôã\Œ”ÆçIªÇáä:∏\Œu\Ï’ûD(mò8\ﬂz\Î≠.®.&Úù\ﬂi£~\ Ÿ°9•tM\‚§\Ÿ:$ˆhgç\ƒ	\n≤Sæ÷úìç*∫.°N\"Ä\ƒ)ÌÜê/ı\’ˇ4çWæ\’\‹Xs\Õ5ù8\'\÷ˆ4ó¥kH>í¯†\Ôd0Mî?GÅ{â\r9ºWM\râ JÉ\∆\œ\ﬁ\“<@7ØÉ>í@Ùπv–®∂?¸˜≤\‹‹ê®\"nö˜Ö≈ß’éRdâ\«r\À-\Á˙ä\„@ÄàÉ*mB\0ÄÄ @0 \0@†\ŸH¡\‘lÑ\ÏüL!Aq\Z P5Å∏à™\r\·4ÄÄÇ˘ZuØ\’Ù\nw\Â4¿ÑTv!qC)≤ä\ÌÙ©T\‹;\Èñ(U™¯¥lÎ≠∑ú†#1G\"KDTiÄ\0 òÄ\0 ê°NÇBÿÄ\0ß@\05@Ä®	•òÄvYhEªR\Ó\Ó`–∞¶Õòi[¶€†\ﬁ=S<\ \ËL◊Æs\◊ŒêbÇMö\Ì R\r\Ì)∂ªAªB¥[Ju!4_\‚: \‚\"KªÄ\0 ¿\Ê\0 \04õ\0D≥=≤àê†8\r®ö\0D\’»∏ ¶Oü\Ó\nb+\›Qa`}\“{\ŸE\„&\Ÿ\≈;múÅë\÷7•û˙Ë£è£\¬\‚\·æ\Â\œ>˚\Ã’â\–\Ó\0•\Ã*u^}ñD{µ\Í9®Fâv\¬HXPZ-\’\€™¥\ÎAißT\‘>\Œq!@D\Î_ZÉ\0 \0Åˇ@Ä`6@\0Ä@≥	 @4\€!˚GÄ	ä\” \0Å™	 @Tçå2B@u\nT$Y5BÇ©Ö \¬;XE\ÿU˚\ƒ\◊f(¨ıæ•∆û©∫\⁄Ò†ö&\⁄\·P¨x∏jït\Î\÷\ÕCè;UDc˝OoÄ\0ÚD\0\"O\ﬁf¨Ä\0íI\0\"ô~igDJÖôH!à:\rìc%Ä\0+^\Z/B\0Çi@\0q@Äàã,\ÌB\0Ä@XaI5˘<à&;Ä\Ó!êav.C´â\0DMÿ∏®u¿\„R@\0hC\‡ökÆiÛ\Ôá_{\œ6Xaâ6ü)% \0@†Q \ZE∫\Œ~ \Í\»\ÂÄ@IL¥%Ä\0¡åh4àFß?@\0\Ÿ%†¥Å.ΩB\…~\“ÚöÕö5+ª\0 \0$é\0D\‚\\R\‹ àî8\n3!êB)t\Z&\«J\0\"Vºπh|\Í‘©∂\ÿbãÖ+DhTú@\0HÄ˛\‹ÃígçXΩ+≥Ä\0\ZJ\‡\Ÿw?t˝ı]r\·Üˆ[kg∫ó\÷+÷´çfj\'=™?D≠SÜ\Î \0ÅJ *\‚\Ôy#Ä\0ë7èG;\ﬁ\«\‹hÎ≠∑û]w\›u°Ñàh}@kÄ\0ÚL\0\"\œ\ﬁg\ÏÄ\0 àa√ãr7jÑuzeºç;6\n\Œ5∑ÖÉj\Óú!\0Åö @‘Ñçã2L`⁄åô6±e∫\r\Í\›3√£dhqê\01`¿Ä\÷\Ê7\ÿ`ÉäBD\\ﬁ†]@\0˘#Ä\0ë?ü3b@\0I#†ÖÙ?¸pY≥Ùû\‘\Ï8v)£ào≥\"\∆YÖÉb4è¶!\0Å\" òÄ\0¢# b\›u\◊m∑e∑úÅ\0ˇ4∂Ù\…\'ü\ÿı\◊_o---v\“I\'\Ÿ\\s\Õ\€0~¸ÒG{Ú\…\'\Ì\‚ã/∂}ˆ\Ÿ\«˙˜\Ô[_\ÕnXª\›\≈Ù™´Æ≤Nù:\Ÿ\—G\›ì‘Ø^¶ø¯\‚\€j´≠\Ï\›wﬂµΩˆ\⁄\À<@\€|Û\Õ\€\Ÿ\–,;\ri§£Gè∂n›∫ôÇz‰àñ\0D¥<i\rûÄ~\œˇıØŸû{\Ó\È\Ó+\'ûx¢˚\”Ò\«o]∫tij∆åv\Áùw\⁄\›w\ﬂm\Áùwû-∏\‡ÇMÅ\Ÿ(;^˝uwˇSë˚8üeöëN´&êñL>•E|¢\Íi˛Ç(æ7ŒÑ\0¢ Ä\0E⁄Ä\0 0õ@)\¬Ûëq\Ìµ\◊\⁄\‚ã/ﬁä\"≥G/\ËZ©u\≈W\ÿG\—.8ˇüˇ¸\«\Œ>˚lª\Êök\ÏÛ\œ?∑!CÜÿ±\«kK.πd\Õ¯ˆ\€où\Ëp\—E\Ÿˆ\€oo\ÁúsN¨/\Ìì\'O∂?˛ÒèˆÙ\”O\€cè=\÷f∑NÕÉ®p\·W_}e|∞ç\Z5™Õôs\œ=∑\Î\Ë–°6h\– õs\Œ9#5\·\”O?µ˝ˆ\€\œ?¸pÁ´∏è\ÔøˇﬁÆºÚJ{\ÔΩ˜\Ï∞\√≥Æ]ªV \n\Ì\‘uY\Á•\Ô\“q\«g˝˙ı≥\ﬂˇ˛˜÷±c«∏]ì´ˆ ¢w˜á~hc∆åqø\'˙\Õ\Ó’´WõNÙ›ø¸Ú\À\Ì¥\”Nsü\Ô±\«≠ø\—[ìæ\ﬂ~˚m˚˚\ﬂˇnw\›uóΩ˙Í´∂ˆ\⁄kª ıN;\Ì‘¥†|µüy\Ê7˝vı\Ï\Ÿ\”tˇÆ$@\Ëô\·¸Ûœ∑ïVZ\…=˚\›{\ÔΩn‹Ö\«Í´Øn;Ï∞É6∫w\Ô^≠i\œ/¥#.!D\ﬂçs\‚ƒâ6b\ƒ\”}û#ø \Ã-≤†DL\ﬂàò¿\“,b$Ä\0#\\öN%R0•\“mâ1∫í\0\·\r\r\n\ÕwüÇ\‰Z¡8n\‹8õ0aBª\‡º˛.ë`\À-∑¥\Âó_\ﬁ\ﬁz\Î-∑¢Ωs\Á\Œ.∞æ\»\"ã\‘5àìO>\Ÿ\ﬁˇ˝\ÿ©\‡œé;\Óh^xaC\Êµ\◊^≥]w\›\’ˆ\›w_\€m∑\›LÇ\œ%ó\\\‚Çy⁄ùpË°á:ûQ^¸\Ë—£G§\ƒ7\ﬂ|c7\‹pÉWyje\ÏK/Ω\‰¨j\∆R\ÃŒ¨Ûö9s¶y\‰ënóàûE9¢#Ä\0Kµ§]j%\‡jŸç7\ﬁ\ÿNÄP`}©•ñ≤_¸\‚¶@ı\‡v>)†úïCb©v/\Ìæ˚Ó°á$^˙≠¸\Î_ˇj\'úpÇm∂\Ÿfˆ≥ü˝\Ã>¯\‡;˜\‹s\Ìâ\'ûp˙æ}˚Ün≥\'J@9\ÂîS\‹ˇ]t—™LP@˛Í´ØvÅy˛ı{Ø{\ƒ\◊_\ÌvEh\Á\ƒC=\‰>[fôe\"y¶(f`°U\r¢\Ã\…\Êd∑Â¥õNª:_~˘e\ÁÛj\ÓÖQ\ŸD;\… Ä\0Å\0\ÎLDÄà/çC ±`•\—†uäùó\0\”\√\n\ﬁT	ü}˛Ö\Õ7`+\Îø«°EG\–y\«\ÿ|”¶\ÿ=˜‹ìÄf€ÑR¡˘)S¶∏˙Zı\Ëè\Áû{\ŒÚˇˆ∑øπ j=GÒv\ﬁyg\'B\Ëˇu|ˆ\ŸgnóÇ{≈Çzı0’µq	ö\'Z\Ì¨’Ø^ÄêÄ§\›Zıπ\Ï≤\ÀVez1;≥\ŒKÄ$\‰\r>\‹}á$qDC\0\"\ZéÖ≠å?\ﬁ˝^˛VMü>\›\ÌzZcç5Z/\—o∫ˆ\nºK\ÕèÖÒ∂˙Ë£èöu\‘Q°;∫\Ôæ˚l\ÔΩ˜∂¸\„∂\·Ü∂πNBÆ\ƒgâ˛\⁄Y® v≠\Í\◊˘w\‡¡UõX,_x\œW\–^©%–ãÖøGV\›Yô\‚ ¸\‚\r	m¡]AÚ\Ì_˛Ú\'8!0G\È\≈tµÖ\0Å\0\ÎåEÄà/çC \≈∂wÒ©±ÙG£Ä\0 –ñ@\«Nùl˝˝éGÄH¿ƒ®fwÄ+’ÜÑàzéº\nb¶±+•E)°\‚ ¥r_+U¯\·á6;V$HºÒ\∆n<\ \r^\ÕVÄ\»/çEï\Zkπ\Âñ\À\‘JÒj|«πqP5|/&@(x¨ˇ˘Tb>¯™[oΩu<\∆4∏Uâ,√Ü\rsA¯∞\È\Ï$¿(0≠z/\⁄qW,\œSO=e\€l≥çoµ\À$â5a¥´MB©vA\”gÜuABmi~©ÜòvÜe\÷ùµ\0\·w:(Ωì\⁄.LKvˇ˝˜\€u\◊]g\\pÅKG»ë?±\ŒzàXÒ\“8b!¿àX∞\“hä	∞\"\≈\ŒKÄ\È\ÏÄHÄ\Í0°\ZB)$˛Ùß?π\ÔJªQ\Ï9¢U∏R/\·Û\Ã3O\—Ûº\0°\‘DZ\r˛¿\ÿ\Ô~˜;à\Èî\ Bi\Z¥¢ˆ¡t9¥:\Ë \€nª\ÌZSÑ9ß\ÿµ\¬Ûñ[nq)1T§z\€m∑u¢¿j´≠\Ê\Ïï˝≤Ò\÷[ouˇV\Í!Ÿ¶\\\’¡\"\⁄˛Ûü]êF+9µÚÒ¨≥\ŒjMOUlEøºk\\\Í_´\‡}An\Ìî\–\ÍX≠ä=\„å3\‹îJ\„˜†ïˆAA#]ßÒ®NG∞∂Çi™∑Ò\Âó_∫ï¶J!\·?”éÒP™ÒPZ.Ò8˝Ù\”m±\≈sı$4>\Ë:±P˚[l±E1™T\—\Ôrv˙¿Sñykùh5π\“◊î\nP\÷Òu\Œ\Ì•Ò∏æî\0\·{ÛÖ\‹ı®úˇ˙\r+ó~Fi\Ëˆ\ﬂ˜˚T™à±\⁄\÷\Ô‰•ó^j#Gét©ãÙõØ\›W?ˇ˘\œ[øtû~áÙ\€,A|“§I∂\…&õ¥I˚£˙4jC\ÈÑt9ı\‘Sùh\‚}\‡\€\ﬂ#‘Ü>ìà†îR∑\›v[+Xn)\€4&\Ìl\–{¶vLî\⁄5Ò\—Gπ:0˙}W:\"	<˙=.eãˇ},\◊\Ô;\Ôº\„jÒh\Á\…˙\ÎØ\Ô\“%JRª/ºÇÉo\ﬂˇ\Œ\ﬁÇ3Hiuù\ÓgJ\Âè`?J\'\Á\›/\ÂO\›\”TsIs\·üˇ¸g´/t^±E\n\‚´>Ñ\Ó/¯\√\\1g\›eøÆ\◊s¡UW]e+¨∞ÇÛ°û=tOñ∞£\Î9\‰[`ÅB\Ÿ\·kQÙ\È”ßuGè_¸LçΩ¯\‚ã\Óπ\‰ˆ\€ow˜c±ì∞&[‘ßj˙\Ë(ºN©µ˚E˜\—_˛ÚóÒ|)i5\—  bù†±\‚•q\ƒB\0\"¨4öb)v^L+@P\"\Œ*bB5ÑD\0∑\À\Â˚ØFÄPV\Õ\rtPæhΩTÄAÅı©\‘\n¸+%óÇBZ5™suT:G\œ\ÍÖcT\–L\È1VYe\'j(¯Æ™œ†º’™o° ÇVf*=ÑÚ:´p¥Ç\\\n˘\"\⁄kÆπ¶\Ì≥\œ>∂È¶õöÇJ\n†®fÜ\Ï\”\·=\n|)á∏Ú_´\’~P˚\n,) ¶ù\nú©\Ì\Ôæ˚\Œ˛\Ôˇ˛\œ¶ƒß\‹¯56\’`∏\Ï≤\À\‹˘\ «Æ†íA\nñ®}çM¢ÜR?˘ ∏\näK»ôcé9\‹g\n0)Æ\‡íÇf\n *»¢kàö˛˘\€èh—∏‘Ø\nk˚\„˘\Áüwc+,˙]\…Œ¨Û\n~ı‘ïp•<Ò™Ø\¬Q?à˙k°í\0\·»∫Vb≤~´à/uÑ ¥õB\‚µ~Kxñh™@∏~[Ù{§\ﬂ+\›7¸o\ Zk≠\ÂÑW\ﬂı\€#\—[mHî]x\·Ö\›o¥~ãıˇ\nå\Î7Wø\≈˙Ω\’\nv\‡◊é	\n\‡\Î≥bª¥*Ÿ¶ÙK\nåóK)\‰\€U\—b˝\Ë\ﬁV…ñr˝J(\÷oæäÖ´o\›#ï.QAt›ìtø—∏U,\\ø˘:îZJ\œn∫WI	b£k¥ ∏+A˜\›næ˘f\'J˚ø\È\ﬁ-QZ˜d\›µ+N\Ï§˜5 ‘æÇ˝:W¡y\Ì\–N›átø/\Ÿ,Q[˜~•2˙’Ø~\Â\Ó]˙oŸ®>ıo˘˚\Õ7\ﬂt∂KêÚ˜®0v\ËB˜8üRL\œndìˇLıLd´\ÊÚ\ +Ø\ÏlÛ\‚ä\Ó˘\ÂæQ\Óç\ÁM´q@Ä@Äàué!@ƒäó\∆!àX∞\“hä	 @§\ÿy	0Ωí\0ºπ°NÄ\„~2!¨\0°¿ëÇ\’\n\‚\‘[Ä\⁄#\nãP+ °’¨\n\ ,ΩÙ\“.†%±\„7ø˘ç≥V\ÈkhR\‡I¬ÉQï\ŒQmÇ\¬1∂¥¥∏®öªÖá˙\÷NçS´`7\⁄h£¢Å®\¬’ú>®§†çÇzG¡Xæ¯\‚{\‰ëG\\¿KªH$h¯\rjK¡	\nˆ\Îò:uj≈±\Èz\‹píù:$.(ò•¿ùï≤U\ÁÀß”¶Msm(\»\ÁSJàçÇ2É\‰\Ô\¬6§\—Jfâ%Öi(\ny¯·á°\Ï\Ã2Ø\‡<{\ÂïW\\`P¢O0á~r~\“g	D<>´$@®W˝ˆi•∫~oV\\q\≈÷Äp≠\È∑E\‚É~Éá\”\n˜\Î\◊\œ|Z8ùªÒ\∆ªyD}:#\›K$RHú]h°Ö\\∫(≠\Œ¯\·á\›=Dª ¿\÷¥\¬XTK	ïlS=¨\0°\›\nzK8ÆdK•~µﬂã	~˜úg\'[\”=Sú$fh7âƒñb;%4\Ë˛§4QÖu\nEOˆu|*>â\⁄=P(@\‹q\«.•ìv\Ÿ\È2dàKı\‰kahæmø˝ˆn˜ÉÑﬂóΩ”É\È˛$¢\»\Á´$∏k‹ï\Ï(6üe\„ôgû\È|!;ÙÃ°æ˝ÿµ∏@¬ãvv(∏\\\Ó;!±L\‚≤7¯Öµ~∏.ù  bùπ±\‚•q\ƒB\0\"¨4öb)v^L/%@HxP.\\•p)< ‡∏üL#@\Ë\≈_\È0\‰S≠å\‚(ñéA©6Ù“Ø\‡ˇK,\·v \÷IP\–A+TıπéJ\Á(òT8F~\–\–\ F\Ì∏(u(ò°@âÇ\ÏZ]\Z\\ıY)®Ø¥F\≈R\n\Î´üª\‹¯\Ïë\ÃE]l\’n%[ü}ˆY;\Êòc\\;•Ú}∂Q.Såw;≥\Ã+\Ë˜0ﬂπ(æcyj\"oá |\œJW§\’\Í\nÙ◊ì~FÅ`•\‚	¶-+6:_£A+ˆµ£-¯€•\ﬂ2\Ì+ï\Ê¨\\\rörD%\€\¬\‘4Pù•™“°w\“+	ï˙-W˚Gã$0K‘ó8.T|ÙﬂÖªdSπ\ﬂ\·\¬~¸Xv\⁄iß6bE\ÿ\ZÖ~-6ﬂº=\ﬁ/˛\Zü\ j\‡¿Å\Ó>(¶ï\Ï®$@H¨\“3àvÄ¯ÖalÙ\Á\ƒQÉ)ûo6≠\∆E\0\"Æπ\Â\⁄EÄà/çC ±`•\—@ÄH±Û`∫à`\nñr¬É7\"é˚…ÑJ¡PørT´\‡ı¢\’Q,\Ë\Ów&(UÑÇ\Î¥k ÿØ⁄°†ï∞Z}Y\È≠ñ-£\⁄P!muV_}ıvCÚı\nd\«V[m\Â\Í®ÖRãÑ\›Uï\0Qi¸Öbk ¥\ÍTª?J˘∏\ÿı-qF\È=ÇG1\ﬁa\ÏåBÄH*ØB>\⁄°ïªÏÄà\Ê\"\Zé\’[\œ\’˜^©x\Œ?ˇ¸∫ØµÇ^$Dó:¶Lô\‚V\ƒ+EûûA¥\ﬁ\Ô*Æj/‹°•ˆj *\Ÿ\ÊwÆi∑FpG[p™’£\ﬂ[’µê†¥ÖïàJ˝V\n|\Î~©ÙF\⁄!Q[Cto+v¯⁄Ö¢Ü¡£∞üRø\Ÿq∫ó˚›Ö≤\…˜≠	\⁄	(\·@\"Dp\◊F°aµ©ù~GGêA9Q\ŒÛ—úcD<øIIo\"\÷9ä\0+^\Zá@, b¡J£)&0m\∆Lõ\ÿ2\›ı\Óô\‚Q`z≥HÄP\–rΩı\÷+π\„°\–6àfy´}ø\Â\‚ïFAEıBÆ\Á^•oPzñï\Ëπ\0\0 \0IDAT¥¢≤÷£ò\0°T\ œ≠†∂˙Vö$•R\–¡\Óøˇ~hR1Hn*ù£@K©L›∫us˝ı\Ì\€◊•\‰P\—M•#R\ﬁp•†–Æ	µı\Î ºSn¸Z™ ñƒë¡É;WK%÷™\Ô†z\r ô\Ì\œ\—˘Ze¨ø©æÖÇ}˙∑\Í\»\◊\⁄˝°ú\·Úu°øJ’ÄPõÖº\≈5åùıI\ÁU¿¢D≠ø≈ØCÄàñßo≠ö˙û+ïçüJÆ´|∫!-fP~•—ìuPª˙Ω\÷\Ó	VP]øÉ˙Ω\ﬁv\€m\›\ u•ºÛBµRÙh∑õﬂâ©Ù}L}⁄£b)Û¬§`*eõ\Ó\nz´vêv7(5P\–nB˝^kGù˛ÆTy\Â\“˜y[*1\—\Œ\ƒB#ÿØ\ﬂ°:\‚s\‹q\«›ù™kJ’Ä\ﬁ_|\Í*üÚO~	¶~\›\«%\"©∆Öéb˜¸\¬˘Qlæ\È>Øù5™i°˚æ˜•vL*›ïØ!ëªíj_)o∫\È¶V\·<(V˘y°Ç\’J?®\≈\‚•4Çw\ﬂ}∑´\Â§g\ﬁBA›èÉ\Zµ|\„≥u\rD¨3\Z\"Vº4ÅX @ƒÇïF!\0Å–™øb©ñJ!AÄH\Œdô<y≤\‚kµˇ\ÊõoﬁöC˚\«t+‚ï∫A\≈$ÉáVπñJè°]	\n\Í+@≠\ﬁ*Z\Ï\–ﬂîü[+\ŸU@Ryñ0R0\\á\“j®¿¶j(†t\nD\Ë|•Zséû\’U_Am\ fçQc;˚\Ï≥\›\n\«\‡°`è\“2IÑê≤O/ì∫^A≠V+_DR\r•¯òw\ﬁy]\Ì\‘‘°\⁄	Z˚\⁄kØπô\ní( %ë£ê-X‘ßté/î]n¸\n\Ã\».≠hUü*⁄©ÙR\n\ ˝˚\ﬂˇvu¿=z¥ÛØ^\ —Æ\‚\÷b™T\ k≠]]tëcÎèû={∫Ò\ Od\ƒN\ÈØtûO3¢îT\⁄\‚˝\ÂØıºΩ0\"\—*åù\ÔΩ˜^fy©8´_ù≠ù7ÚA©Ù0\…˘uHè%Ò¯J©êÙ{Ø@≤\n˙C5V±a˝FJP\Õ	ç´K™›†\Îî\÷\Ôû‚ÖáÚ˙m\÷oO–Æ\Ìå\–\Ôâ~[Ù{\Îk(\›\“^{\Ì\Â\⁄\‘\Ô≠˝jc\‰»ë≠M(H/[%\\H \÷o¢~\À.æ¯b∏\÷u?\“\Ô™\Ã*™¨Ç\≈\ﬂ}˜ùÿ´~Ñ\ÓC˙¨îmjGˆ+\≈W∏\ﬂ_\’9P\nb\Î;Î≠∑:ªÇª\Õ*\Ÿ\"{é<Ú»í˝*H.⁄•\‹%\‰\'ÒE˜#˘L>ı2ä˘Jú%(\È>°Q˛\–\ÓŸ¢‘Ö^pPª⁄Å†±äΩ\Ó”≤A˜O\’\Á\–X%n\À\n–ãA)ÅJÛM\‚lP Pﬂ≤Eª1TóB\œ	J•\‚—ì&Mj\›˘\∆çY˜v=\◊\»Vâ\Z∫w™≠M6\Ÿƒâgzûï\– Q[á`H\”3É|&1Hª,Ù|¢C,¸.=˜àÖ⁄¨\'\rY<\ﬂfZmàX\ÁD¨xi±@Äà+çB\0M\0\"4™XO‘äDV¸<Q @Åı\¬Cù[\ÏPF+N\ﬂ}˜›≤ÑD\nå\ÎE˝˘\Áü7h\0\◊\nR\—9\ \'Æsû|ÚI\'<\Ëú\r7‹∞5ò_\È,˜∂J`P@A,≠|T\€?‘øäaÆ∂\⁄jÆ¿©\\@ë†¢~•§\“X(@£\√-¨RLáÆëH°†Ü?T$TÅ\Á`:øÚUm)»°Ò)¿\Ô\ÎRT\Zõ⁄ñ$\“jSâ=\n\ni•¶vß(\ÿ$Ò@íÇN\Í_ÇÅY\niıØRQI<î-ó\\râ\Z‘¶V\Ó*H’ªwo7\ÌjPQnéà\—\ ]•Q\—\’`a\–Rº\ÀŸ©¿¢Çóû©˙\À\"/çKùü\Âñ[\ŒÒ‰àÜ\0D4}+¡\ﬂ&ˇ\ŸI\'ù‘öÇ\Ó\Õ7\ﬂtBßv\»\È∑FøÉ\nKw¥L+ÒïØ\ﬂ ã	˛wMøÖ\n^\Î∑CA|}oî£_øK˙≠˜+øÉK¡h˛sçAøç∫_I\÷.1]´æu(¿¨†∏\nh´ÓêÇŒ∫J@\—=Bøß]Pñ8≠{ÇÑ\ŸS\Ã6ﬂÆ⁄ñ∞¸\–Côò˘Ç\À˙ç/,∫\ÏŸÑ±•Tø\⁄\’&{uˇë/§ó†!\—#x(¯Ø{∫îb≈ßÉ\Á*Mî\Óá\ZßØ≠\·W˜˚˚ú\Á,1@ª\"u\Ôë\Ë.±Y˜0•\√”ú\–˝\›◊º(º˚\‘˝U¢Ä\›w\‰\„˛˝˚∑û¢vtü\–\ÓŸ§ù\⁄˘\‚Ö]1/gá\nC\Î_ˇBªt_î¯Ø1âç\Óˇ˙-ë¢ø\…w∫/kÅRVI\Ë\—ÛÅ\∆(;\ƒYº˝3ãvhJ»í@\Â\ÌäˆõIkI\'Ä\0Å\0\ÎEÄà/çC ±`•\— SäùóR\” R\Í8ÃÜ@ÄÄvÄ(©†êVàrT&\÷[oπ¿ûVaK§‚àÜ\0D4i%Z∫µ@¬Ü\nÙÉAıh{+ﬂöDÖr≈ßÉWK¸\÷.\ÌÇÛ\È˝\Zik\Z˚íØµ@Bªdk\‡\»\'àXg>D¨xi±@Äà+ç¶ò\0E®SÏºîöé\0ëR\«a6\nhï´R_h+>\ÀOı¥JX´ès\√3±\Í#Ä\0Q?ÆéóÄvêI®U\Ì≠¥◊é\ÌV–ä˙F\nék7ÜvjEòCu6¥\“_u5îæä£<\Ìx\—\Ìú–Æé|@Ä@Äàu\ÊßQÄÖ\·\n∑)n”ã\\â∆É[\Ôtä\ﬂ&\ﬂ[\Ë3ª ≤\Î[FVà⁄∏qU\Ì jg«ïH’™PJ*\ÊTÄKiF8\⁄P\⁄\ÌzPj•{iT\‡1/æ@Ä»ãß\”;N˝V*’í\“©†∂˛≠4}>\Â^#S* \’;–°4B@´äßLôb\«så\"T¸õ£=•u∫\Áû{ú_%2˘¢€∞\ \'àXg~ö\Â~U>CÖ9˝JA\Ê~å¨∑G˘µBÄQ@Äàí&meÅ\0DºòÆ1 @§\À_XÅrHS\Œ\Ï/æ¯\¬\Â\…\ÊhO@ıN∫u\Î\Êä\‡ñ+˛\nª\⁄ @\‘∆ç´≤M\‡\Êõov;.T\\+ÛkàU\œIª\‹T≥&	Vì\Ê1û\÷˝Oı+\‡ì4\Ô4\ﬁàXg]ñâ\⁄bßÇ<ÖÄWv\'Oû\Ï\n\◊\≈} @\ƒM8\ﬂ\Ì#@\‰\€ˇåæ=fE£	 @4ö8˝A\0\».à\Ï˙ñëA\0HàX\ÁjVà>¯¿^x\·\€t\”MØb¿W_}eZΩ#ΩSßN±rEÄào\ÓGÄ\»˝\0@¶D£	 @4ö8˝A\0\».à\Ï˙ñëA\0HàX\ÁjVàBH\Õ\0ö\›¨ìÜ∆õN\0¢\È.¿ÄÑ@ÄHòCr`Dú\Ã!\04à\0DÉ@\”\r \0î$Ä\0Å\0\Î\◊#è\ƒ;\Ôº\„\n&u\È\“\≈\÷_};¿mã-∂p\≈\Á\Óª\Ô>WÄ\Ó\ÿcèµ`±\Î`\Ì\Ì§∏Ù\“Km\‰»ë¶ù\⁄Qq\‚â\'⁄íK.\Ÿ\Í+àXßm\ÓGÄ\»˝\0@¶D£	 @4ö8˝A\0\».à\Ï˙ñëA\0HàX\Áj\ﬁàO?˝\‘ˆ\€o?ªÛ\Œ;]°ù8¿û{\Ó9{Ò\≈\ÌêC±É>\ÿzı\Í\Â”ßOwE§%T\Ë≥oæ˘\∆.∏\‡\€r\À-mÖV∞/ø¸\“\Œ:\Î,{˛˘\Ám‘®Q÷Ω{wwD¨\”6˜ç#@\‰~\n\0†Ä¿¥3mb\Àt‘ª\'l \–\r¡L\'Ä\0rA\0\"nfêÄ\0M\0\"\÷	ö7B0µÉAB√ús\ŒigúqÜ˚ˇ\‡\Á=zÙh ºê0`¿\0˜\Ÿ3\œ<\„ƒá©Sß∂Ò\À\‹s\œ\ÌvOÙ\Î\◊\"\÷K\„\"Ä\0¡<Ä\0 \–\\\Õ\ÂO\ÔÄ\0≤D\0\"K\ﬁd,Ä\0\“I\0\"÷ôõg\"(4Ñ nºÒF;v¨ùs\Œ96\◊\\sïÙ\r; bù∂πo\"˜S\0\0Ä@ì	 @4\Ÿt@ C 2\‰LÜ@ •  bù∫≥S-Ö ÆΩˆZój\È∫ÎÆ≥%ñX\"\÷\ŸI\„• @07 –ñ\0)òòç&Ä\0\—h\‚Ù@ ª ≤\Î[F@ -  bù´\ÌàE]‘é?˛xõR)ò6\ÿ`;\ÂîSl\Ÿeóu\Á=¯\‡É6ˇ¸Û[ﬂæ}ùø\ÿ\Î¥\Õ}\„πü\0( @j¶D£	 @4ö8˝A\0\».à\Ï˙ñëA\0HàX\ÁjVàññ\€u\◊]máv∞}˜\›\◊:v\Ï\ÿ\ ÒÛ\œ?∑É:»ñ\\r\…V°¡ˇÒ¥\”N≥Ò\„\«\€\≈_\Ï\Ìt8Û\Ã3\Ì\€oøu≈´ıø#è<\“¢\€oøΩ\€°k bù≤4N\r\Ê\0\⁄@Ä`R4ö\0D£â\” \0Å\Ï@Ä»Æo \0Åfx\Óπ\Á\Ï\‘SOµ[nπ%t˜°\'K-\'fQÄ8˘\‰ì\Ì∏\„ék\≈—ßOS\ÌÜ^Ωzµ\ÓL3få-ΩÙ“∂\Õ6€òD_\œA\¬\≈Ga<Ä\Ì≥\œ>∂˚Óªª∂\÷_}\€y\Áùmûy\Ê1	]tëç9\“˝˜ê!C\\Åj	\Z˛`D-≥ëk\¬`DXRúóyÒtr∆â\0ë_`	 \0Å§Xfôe\Ï˝˜ﬂ∑ìN:…é:Í®íf\"@$’É\ÿ@ ù\Êùw^õ1cÜu\Ó\‹\Ÿˆ\‹sO∑»∫“Å\0Å\0Qié\‘ı˜,\nuâ\Ëbàà@\“LQL¥%Ä\0¡åh4àFß?@\0\È#†j\ÔΩ˜ûK\Ÿ€µkW>|xQ!\"}æ\≈b@\0I&\‡\Ô?≤Q˜òNù:U\"  bù\”Ò\‡EÄàá+≠\Œ&Ä\0¡LÄ\0s†π öÀü\ﬁ!\0§Å@0\0\‰É@≈Ñà4x!\0§á@\·˝\'åÅ\0Å\0\ÎGÄà/D<\\iÇ9\0Åb\ÿ¡ºh4àFß?@\0\È#P,\0TLà@ÄHüo±Ä@í	î∫ˇî\"  bù\”i &Mö\‰\ÿ6\Ã\Œ9\Áú\÷:±´\–¯µ\◊^kª\Ï≤K\ÎY\◊\\sç´¡Å(	∞\"Jö¥ïYb∫∆Ä\0ë.a- \0Åf(\0\n\n_|ÒÖ\rnfIG¨\ﬁ\’fÕö’å!\–\' \0§ê@•˚O1!\"÷©ûF\"V 4Å@ÄHÅì0±°¶Õòi[¶€†\ﬁ=\⁄/ù\Âó\0D~}\œ\»!\0Ñ%&\0\‰\€\Í–±£\Õ5\ÔˆÛ˘l\◊¸\«oΩj+Øºr\ÿn9Ä\0rN\‡ı\◊_∑\Ôæ˚.≈Öu¨∂\⁄j\÷m\Ì\ÕmΩa√ã^7n\‘\ÎÙ\ x;vl®v}RÒmµ!\Z≥“§˙ßE9ä\¬AçûTÙÅº@Ä\»˚`¸Ä@£	Ù\Ô\ﬂ\ﬂ&Lò\–\Ën\ÈÄ\0rF`\’-~\◊nƒìÔ∫°\Õ.˚ú!a∏Ä\0 P%Å\€nªÕæ¸Ú\À\–W\Õ=˜\‹&\—|¡Å\€\"@ @Ñû7Uùà\0Q.NÜ@\" @$\¬\r\‰ò\0; r\Ï|Ü@ $Åjv@t˘yW[g\œ\√mù?ﬁÆuR0Ö\ŒiÄ\0 \‡ÑΩˇ,æ¯\‚.•˝;\Ï`iYH_\ \≈Qƒ∑\Ÿ\„(\n\≈hMC\0E @0- –ñ\0)òòç&Ä\0\—h\‚Ù@ }*ÄÙ.ﬁµkW£D˙|ã\≈Ä\0íL†\“˝\'(<¯q @P\"\÷9ç\0+^\Zá@, b¡J£)&@\Í;/•¶#@§\‘qò\r@†ÅJÄº0|¯p˚ˆ\Œn≥©\Ïˇ+\„\Zî2•$CÜà\…!ùî!á§D\“A*áj(Bç\‰ê\"ëíÑF%Ω(Lí\ kå§¢£\∆$cÑ∑\…Pä˘æ´ˇz\ﬁ˚π\Á>\Ï˚~ˆ\ﬁ˜\ﬁ\œ˝›üO\”Û¨Ω÷µæ\◊\⁄˚æü\Î∑\÷uÕò1#ˇ-B]¢cJê¿8\'\–\ÓÛ\·\·¥\”N{\Ìµ\◊  \n}, \n\≈k\Á(ÑÄD!X\Ì¥\∆ jÏºööÆ\0QS\«i∂$ Å	4ÄöÖádäDâNq(	H@C@†˘Ûßìêp(@(@˙h(@ä\◊\Œ%PàB∞\⁄iç	(@\‘\ÿy55]¢¶é\”l	H@%H†v¬ÉDâ\Œp(	H@CDÄ¢“§˜\À\"<(@¸\ﬂ¬∞DÅâDÅp\ÌZPÄ(¨\›÷ñÄDm]W[\√ j\Î:\róÄ$P\ZÅº\‡a\Ó‹π\·¯„èè©ñ\⁄]ûÄ(\Õ%$	H`h\\z\È•-S-µ\‡	O@˙p(@ä\◊\Œ%PàB∞\⁄iç	(@\‘\ÿy55]¢¶é\”l	H@$†\0QAßhí$ Å!#†\0°\0Q\ËíWÄ(ØùK†\nÖ`µ\”\ZPÄ®±Ûjj∫DMß\ŸêÄ*H@¢ÇN\—$	H@CF@B¢\–%Ø\0Q(^;ó@! \n¡jß5&†\0Qc\Á\’\‘tàö:N≥% 	TêÄDù¢IêÄÜåÄÑD°K^¢Pºv.ÅB(@Ç\’NkL`˛\¬Eaˆ\‹\¬Ù)ìk<MØà:yK[% 	TõÄDµ˝£uêÄÜÅÄÑD°\Î\\¢Pºv.ÅB$b\€w›≤ˇü~\Ì≥\·_?ø>\‹|\”MÖåoßêÄÜùÄƒ∞Ø\0\Á/	H ?\n˘±¥\'	H@ËèÄÑD+\'\„]\nA\ŸL\"Ä\0q\›ı\◊w¥h´≠∑VÄ®ê\œ4E_ ∆ó?ùç$ ÅAPÄ$}«ñÄ$ (@(@˙$(@ä\◊\Œ%P*Å9Û\ƒÒ¶NZ£\‘qLÉ&`\n¶A{`¯\∆WÄ>ü;c	H@EPÄ(ä¨˝J@ê@V\n\nY\◊J_\Ì ˙\¬\ÊMêÄ$P!°Æê3Ü\ƒà!q¥”îÄ$Pà ;Ñ$ 	t$†\0°\0Q\Ë#¢\0Q(^;óÄ$ Å(@î\0\Ÿ!FPÄpAH@ê@^ Ú\"i?êÄ$\–/à~\◊N¶˚ 2a≤ëjA¿LµpìF@@¢\0®vŸëÄÑDêÄÚ\"†\0ëI˚ëÄ$ Å~	(@(@Ùªv2›ß\0ë	ìç$P_æ˘ó\—\ŒßmT{5RyPÄ»ã§˝d%†\0ëïî\Ì$ 	H†ànÑ¸Ω$ 	M@B¢\–5¶\0Q(^;ó@© J\≈\Ì`\"†\0Q!gâ)\nC\‚hß)	H†\n%@v	H@\ËH@B¢\–GD¢Pºv.ÅR	(@îä\€¡*D@¢B\ŒS Ü\ƒ\—NSê@	 JÄ\ÏêÄ$†\0\—e\ry¸¥\¬\‚≈ã\◊fπ\‘E9RÄ®Õí\“P	t%†\0\—ë\r\∆)àq\Í\ÿ\nOK¢\¬\Œ\—4	H@5#†\0Q3áiÆ$ ÅqH†.q\Ïv\ËÛào+@∏∞ÛpPÅ\ÊŸµ$\–à`\Ÿt\\òøpQò=˜Å0}\ \‰q5/\'S]\n\’ıçñI@®à∫yL{% 	å?\n¶`*tU+@ä\◊\Œ%P*àRq;ò$0\ƒ Ü\ÿ˘N]M\ÓΩ˜\ﬁµØ}-,ª\Ï≤\·#˘à|$\–3àûëyÉ˙\"\‡˚∫/l\ﬁ4$  \n]\Í\nÖ\‚µs	îJ@¢T\‹&	1à!v~	S_∞`A∏ˆ\⁄k\√UW]é?˛¯¢ΩhâQ-Z9\‰êp˛˘\Á\«ﬂ≠¥\“J\·[\ﬂ˙Vx’´^UÇÖë¸˝\Ôá~x∏\‰íK¬ëG>˛ÒèG=PÄ\ËYen\»ÚæN\∆˛˚\ﬂˇ\«{lx˙”ü\Óªb\0Ù}=\0\ËY+\n\nÖ.XàBÒ⁄πJ%0gﬁÇ8\ﬁ\‘Ikî:ÆÉI`\–L¡4h\ﬂ¯\n\√\ÁÛ≤f¸\–CÖ}\ËC·óø¸exÍ©ß¬•ó^\⁄RÄ∏˛˙\Î\√nª\Ì®pΩ˙’Ø\\pAXs\Õ5\À2u\‘8è<ÚH∏Ú\ +\√;\ﬁÒéÅå?\»A¸ÒË≥µ\÷ZkTP\Èy\œ{^Kˇ\r\“^«Æà\Í˘$ãEY\ﬂ◊©Ø\Ôˇ˚\·Moz\”¿\≈J\ﬂ◊æØ≥¨o\€àBWΩD°x\Ì\\êÄJ `\Í ;\ƒ(\n.à¢	\‹|Û\Õ\·}\Ô{_K\‚üˇ¸g8\Ó∏\„\¬\€\ﬁˆ∂íóº§hS2ıˇ£˝(`Ûå32µOçZ	¸åù\ŒpÄ\ƒxrvAsQÄ(lI\›vz_\'\Óª\Ôæ¯~ú={vx\Î[\ﬂ:\–æØGæØKzP¶Ú  \n]§\nÖ\‚µs	H@(ÅÄD	êB\¬5P*ÅN≠_¸\‚aü}ˆ	\œ˛Û\√¡¯Éqπ\Âñ+’æ\∆¡x\‡Åh\«fõm6–†⁄†\04ã/\ﬂ¯\∆7\¬ißù.∫\Ë\"àA9¶F\„*@\‘\»Y-L\Ì&@êz\ÈîSN	”¶Mü˙‘ß\‚ïÆ\Õ˜ı\ËkæØ\Î˝\Ïi}æ  Ú]QMΩ)@ä\◊\Œ%P*S0ïä\€¡*D@¢B\ŒS<1$é\‡4\€¥û|Ú\…x˙\·ÑN±n\ﬂ}˜\rßûzjX}ı\’\€Zºp\·\¬X3b“§Iqg>ìõØ\∆\‚ú\€m∑]8Ù\–C√û{\Ó;\Ï∞\ƒOÑs\œ=7úu\÷Y\·/˘KL#Ç&L\Ôˇ˚\√W\\1\“\›G?˙\—p˚\Ì∑\«:‘∞ \–ˆõ\ﬂ¸&\Ïµ\◊^\·é;\Ó˘YªÒ\Ë˚\¬/å6\ÓΩ˜\ﬁ\—\ﬁ\Ô}\Ô{Qt°øW\\q	\€92k÷¨¯\«\Óo˚\€\·∫ÎÆãi©\÷_˝Ûüˇ<Ãú93\\s\Õ51-\“QG\Á∞Ù\“Ká|0}Ù—±\ÊA\¬eñY&lºÒ\∆qß2cn≤\…&#\'Q\‡~\Ã1«å˙Y≥\0AAjò=¸\√\—\Œ\∆˚∏§∫\¬ *\Ïú¶u ~ÉÑø˛ıØ\·5ØyM|ßt |_˚æŒ∞\Ïl\"Å\‹	(@(@‰æ®\Z;TÄ(ØùK†T°.∑ÉUàÄDÖú1$¶(@â£8\Õn≠G}4\’∫Sôùµ\ÌNBthëúîO\·	ê!* \"\‹y\Áù1Xˇ•/})\ÏºÛ\Œ1òˇ\ÿcèE¡ÉÒ\œ9\Áúåg<câ\Z˚\€\ﬂb\–N;}\ŸyK\⁄(\ƒ\rƒêV\„Ù«ñ\À/ø<\Ï∏„é±\r¡∫t\Í\„”ü˛t\ÿeó]ñ∏è8\‚àXå\‰e/{Y¯7ªèπü¥\'A9Ë†Éb{Dë\œ~ˆ≥\·/xA\ÿißù¬Ø~ı´8_\Êá\ÌW_}uLõíjq∞[Å\·Ù\”O˘Y´L\›¸7¿•\Â\–$†\0QAßÙ`Rß\Áù\‘K\Áùw^|\ﬂ\Ó\‰8V\¬˜µ\Ô\ÎñßM%êôÄÑD\Ê\≈\“OCà~®yè™I@¢ö~—™\‚	(@\œ\ÿFPÄpEM k\0õùˇ§˙!@ﬁÆ`uV[S ù ˝g>Ûô1\„∂\€nã\‚\√˝˜\ﬂ?™+Ç˝Ueás\ÊVAy\n∂6\ﬂ⁄ç\◊\È^NDº˝\Ìoo9%òqbÉ\”[l±El\√\…\rDDÜ\Ê\ÎΩ\Ô}om*ò¥ô;iì6\ﬂ|Û(@¥Úø?˘\‰ì ≤.,\€u%†\0\—Q•¥{_#~~˛Ûüª\Ôæ{<y\’¸À§|_˚æ\À˙Ò^	¥\"†\0°\0QËì°\0Q(^;ó@© J\≈\Ì`\"†\0Q!gâ)\nC\‚\ËN3´\0Åâ,à;˙?¸\·«ùµ˝^≠ˇÙÖ∞Az#Ç¯\À/ø¸›∑+\¬\‹,J¥ \÷Zk≠Q˘–≥à≠\Êÿä;ÖIQ\≈)Üvl.π\‰íÆwΩ+l∏\·ÜÒÙ\'%&NúáPÄ\Ëw5y_/ z°UΩ∂\Ì\ﬁ\◊\◊_}LS∑˝ˆ\€G£ã öﬂüæØ\ﬂ7JåW0Æ\ﬁÛ¢E\’%†\0°\0Q\Ë\ÍTÄ(ØùK†T\n•\‚v∞\nPÄ®ê3Ü\ƒà!qÙ\0ßŸã\0A¿û¥A˚\Ôø¨]\–\Ô\’NÄ ÄC™•ã/æ8¨Ωˆ⁄µ R¿\Ôço|cx˜ª\ﬂ¯€ß˘\"≠)ö8IB*\'ÑàØ~ı´\·\≈/~±Døã\…˚z\"†\0\—Æ\ 5nıæN\ÔSﬁù≠Æ±÷ÜÒ}\Ì˚∫rÇ’ûÄÑD°ãX¢Pºv.ÅR	(@îä\€¡*D`˛\¬Eaˆ\‹\¬Ù)ì+dï¶åg\n\„Ÿª’ò[/ª¸)M›ÜV\'≤Œ®]@+•`b\Ô\'?˘…∞\ﬁz\Î\≈@>ª{W]u\’®oóÇ\È9\œyN,\"M˚AúÄH)ò(íç\Ì{\Ï±GdDMå\À.ª,¶s¢Üu%òÀü˛Ùßp\‰ëGF!á\⁄¯\·=\ÔyOlª¡Dî\Ó®Õ∫¢lóïÄDVR\’lóı}]\∆	\ﬂ◊æØ´˘îhU(@(@∫N \n\≈k\Á(ïÄD©∏Lb\nC\Ï¸í¶N £É>8û:†A∫`Q˘uØ{]X}ı\’c]ä\"\Ô∂\€n±fAªk—¢EQ$\‡Åeó]vâ¶ˇ˚\ﬂ\√?¯¡0i“§—ÄF§w:Û\Ã3G\›CΩv˜Æ∏‚ä±\Œ¬ø˛ıØp\Ã1«Ñ˛á1\Á9u$Ãù}ˆ\Ÿ1∏\œ\\®ùÄ(@qi\ÊáM\Õ\„•÷§°F\√\“K/RÎ≠∂\⁄*w\‹qa©•ñZ\¬~ò}\‡%\–®=1w\Ó‹ë{®_ÒıØ=p2\‚ÑNO>˘d8\Ï∞\√\¬2\À,ÖDï8 ¸˛˜øoy\À[¢∏Cz&ärSÄ\Z\Ê¯Ä¸\Ó\œ~ˆ≥\„|\÷\\s\Õ(rPGÇ  cR|ñãîNù¸S“≤ròäPÄ®®c2ö\’\Ó}\›|{V\¬˜µ\Ô\ÎåK\œf»ïÄÑöte\0\0 \0IDATDÆ™π3àBÒ⁄πJ%†\0Q*nìÄÜòÄ\ƒ;ø‡©∑J\€q¸Ò«è\‘H ÄE\—dÇ˘\œ}\Ós\√~˚\Ì\Âù.v¸r\»!#¡˛f\"∆ÆΩˆ⁄∞\Ó∫\ÎÜ]w\›5úx\‚â#\'*\'æ¯\≈/Ü≥\Œ:+oN®G<\‡˙—è~\Î(Pg\·”ü˛t¥áÄ?\¬\≈u\◊]\”Q\‰Åbª\Ì∂Ø˝\Î\„œö\«{\Ï±\«b\‡ûüs!R–éy\ﬁq\«#?kÆG¡©Æ)S¶Da±ÇãK∑\‹rK3Æ∫Í™∞\Âñ[F°\ÂMozS7Hª¥\∆\ZkÑSO=5Ãô3\'ä\"ÃÖìë•oDõu\÷Y\'|\‚üÛ\Áœèˆ!v0jL4⁄ãmO=ıTÙ\”5\◊\\9¬≥U˙ßÇóì\›◊ÑÄDM\’df∑˜uÛ¨≤\næØ}_\◊Ûâ\–\Í∫PÄPÄ(t\r+@ä\◊\Œ%P*Å9Û\ƒÒ¶NZ£\‘qLÉ&`\n¶A{`¯\∆WÄ>ü;c	H@EPÄ(ä¨˝J@ê@V\n\nY\◊J_\Ì ˙\¬\ÊMêÄ$P!°Æê3Ü\ƒà!q¥”îÄ$Pà ;Ñ$ 	t$†\0°\0Q\Ë#¢\0Q(^;óÄ$ Å(@î\0\Ÿ!FPÄpAH@ê@^ Ú\"i?êÄ$\–/à~\◊N¶˚ 2a≤ëjA¿LµpìF@@¢\0®vŸë¿Xà\ﬂ˝\Ów1G>˘Ù[Ω$ 	Å~\ÍãPWÖÇ\Ì˙”üÜö≥ïÄ$ Å\\	(@(@‰∫†ö;SÄ(ØùK†T°.∑ÉUàÄDÖú1$¶Ù#@ <º˝\Ìo?˚\Ÿ\œ\"•;\Ôº3l¥\—FCB\ÃiJ@ê@;Ω\n3g\Œã-äE\÷\◊^{\Ì0o\ﬁ<K@êÄ˙&†\0°\0\—˜\‚\…r£DJ∂ë@=(@\‘\√OZô?à¸ô\⁄cgΩ\Õ\¬C\ÍY\¬U&	H@\»*@4âûÑ\ÎHêÄ\∆J@Bb¨k®\„˝\nÖ\‚µs	îJ@¢T\‹V!\nr∆êòíEÄXˆè∑Ö˛Ûü\·ñ[niIEbHã”îÄ$–Ö@\‚\œx\∆»âá\Ê\Ó \\bêÄ$0V\n\nc]C\nÖ¥s	TáÄDu|°%\ÂPÄ(ó∑£Ö\–IÄxd\ﬁ\¬\◊x]xÙ¡˚;¢RÄp%I@ê\0\⁄	?9\ÔîìØ|&<Òÿ¢é† \\GêÄ$0V\n\nc]C\nÖ¥s	TáÄDu|°%\ÂòøpQò=˜Å0}\ \‰rv¥°%\–JÄ@x∏Ú\Ë\¬}wﬁöâãD&L6íÄ$0\Ó	4?9\Ô\‰ìØúûx¸±/\Ó:àÆàl 	H@](@(@˙êòÇ©Pºv.ÅR	(@îä\€¡$ Å!&\–,@úΩÀîº?ˆDd≥\Õ6+¨∞BX~˘\Â√µ\◊^\Ô}¯\·á√Æª\Ó\Zˇ\Ì\œ\Â\‡zπ=0˛\ﬁ≠>(öàôõÆ\ÿ\”\ÁIjLA\Ít—ß?ˇO0Irπ@\ÀÙ˝¿:ê\√ûÜv∂y˜\—aõÉèj˘t\”93√Ñªo≥f\Õ\Í\Î3™\ËõÚào\”ü\Zãm¯X˚ØãrîáÉ\∆\ \ ˚% Å|(@\‰\√\—^$ 	t#\–,@|i˜©\·Ø˜¸¶\€m£~ø\Âñ[rz`¸\Ówø˜\»#èÑ=˜\‹3˛€ü\À¡ı\‡s\·{`¸ΩZ}Px¢ßèOK@ê@\Í\«n7ı<\‚\€\n,¨\‘e*\–<ªñÄz 0gﬁÇ\ÿz\Í§5z∏À¶®?S0\’ﬂáuõA´L\‡æù£\ﬂ\ÓΩ\Ì«ô¶c\n¶Lòl$	H`\‹h_\‚ˇßb≤ƒ∏_NPê¿†	(@òÇ©\–5®\0Q(^;óÄ$ ÅXÑ∫\»1ä@ß\"\‘_\€oá∞p˛ü;RSÄpQI@ê\0\⁄	â)ô81∑h—¢Qi3\“\Ô≠\·:íÄ$ Å±PÄPÄ\Î\Z\ÍxøD°x\Ì\\êÄJ †\0Qdá\»,@\–Ü\œ},<˝O∑\«@—ç7\ﬁÿíûÑãJêÄ≤\n|ûúx\‚âa\ÊÃôK\nÆ#	H@+à±Æ!àB	⁄π™C¿L\’ÒÖñîK@¢\\ﬁéBßIÄXe˛]\·Í´Ø˛Ûü\√>˚Ï≥Ñ°\0\·JíÄ$ Å^àD´YàPÄpI@ê¿X	(@(@åu\r)@J\–\Œ%P°Æé/¥§\\\n\ÂÚv¥\ﬁà\ƒkﬁºya\ﬂ}˜\" \\IêÄ$–è\0\—(Ds\Ã1aùu\÷	¯\√Ñ)	H@ËõÄÑDﬂã\'Àç¶`\ B\…6®àz¯I+Û\'†\0ë?S{\ÏL†ó\Õ=!Dút\“I\·\Ã3\œ≥$ 	H S\rR0yI@êÄä\"†\0°\0Q\‘⁄ä˝*@ä\◊\Œ%P*àRq;XÖ(@T\»Cb\ Xà!A\‰4% 	H #Å,E® 2¬¥ô$ 	ÙE@B¢ØÖìı&à¨§l\'Å\ÍPÄ®æè¥∞\n\≈pµ\◊ˆ \\êÄ$êàºH⁄è$ 	ÙK@B¢ﬂµì\È>àLòl$ÅZPÄ®Öõ4≤\0Û.\n≥\Á>¶Oô\\@\Ôv)Å%	(@∏*$ 	H /\nyë¥	H@ËóÄÑDøk\'\”}\nô0\ŸHµ †\0Q7i§$0(@å\':	H@!†\0QGhÜ$ Å!&†\0°\0Q\ËÚWÄ(ØùK†T\n•\‚v0	H`à	(@±Ûù∫$ Åú	(@\‰\‘\Ó$ 	H†g\n\n=/ö^nPÄËÖñm%Pms\Ê-àNù¥Fµ\r\’:	\‰L¿L9µªÆ ∫\"≤Å$ 	d$†\0ëî\Õ$ 	H†0\n\nÖ-.:VÄ(ØùK@ê@	,B]dáE@\¬!	H@yPÄ»ã§˝H@ê@ø  ˙];ô\ÓSÄ»Ñ\…FêÄ$Pa\nv\Œ85Mbú:\÷iI@\0à@wH	H@E\0\‚\∆o\ÏHeª\Ì∂≥fÕ™$π<\‚\€ÙÒ¥\¬\‚≈ãWrí≠å™ãrîáÉj\„\rï¿8\'`\n¶q\Ó`ß◊ñÄÑã£l\new<	H@„óÄ\ƒ¯ı≠3ìÄ$PO<Ò\ƒ(S\œ˚\ÈØ\„ˇ\ÁVé˙˘≤\À.[\…)\Â\ﬂVÄ(–µy8®@Û\ÏZËÅÄE®{Äe\”qE@b\\π≥ìQÄ®Öõ4Rê@-(@\‘\¬M\Z)	H`®\‘-æîG|[¢¿%ûáÉ\n4œÆ% Å\‘\Ì¢á©\ŸT	(@∏@\ &†\0Q6q«ìÄ$0~	7˘jì7h;¡ø˛Òn\“Aå_\0\ŒLêÄ*G†nÒ•<\‚\€\n.\√<T†yv-	Ù@†n=LÕ¶PÄp\rTäÄD•‹°1êÄjM\‡¸Û\œ\Ôjˇ~˚\Ì◊µç\r$ 	H@y®[ä\Ô<\‚\€\ny≠û˝\‰\·†Õ≥k	H†\n=¿≤\È∏\"\‡	àq\Â\ŒZLF¢n\“H	H@µ$¿w˙ßmTK\€5ZêÄ$0yƒ∑ \nÙ\\*\–<ªñÄz †\0\—,õé+Û.\n≥\Á>¶Oô<Æ\Ê\Âd™K@¢∫æ\—2	H@u\'∞\’\…\ﬂ?=Ú≠uüÜˆK@êÄJ#êG|[¢@w\Â\·†Õ≥k	H†\n=¿≤©$ Å1PÄ<oïÄ$ Åé \\ êÄ$0h¶`\Z¥2éˇ\ Wæ2<π¡¥∞\Õ¡Gµº\„¶sfÜ	w\ﬂfÕöï±\«bö)@\√\’^%0\nÉ†\Óòê¿0PÄFØ;g	H@\ÂPÄ(á≥£H@ê@{uã/\Â\ﬂˆDÅOD*\–<ªñÄz P7Ö∫á©\ŸT	òÇ\…R6à≤â;û$ Å\·!†\01<æv¶êÄ™J@¢™ûi≤\À5qîfJ@ê@\Ì	XÑ∫ˆ.¨\› j\Á2\rñÄ$P\nµqïÜJ@∑ j\‚Zàö8J3% 	H†ˆ j\Ô\¬\⁄M@¢v.\”`	H@µ!†\0QWi®$ ÅqK@¢&ÆUÄ®â£4S„àÄ)ò∆ë3ùJO z\¬e\„(@\‰\0\—.$ 	H†%Ü$ 	öÄƒ†=êq|àå†l&	\‰F†nπM‹éÜûÄ\ƒ\–/Å\“(@îé\‹% 	\ræ\”8m£°ôØïÄ$ Å\Í®[|)è\Z\«°.p\Ê\·†Õ≥k	H†u˚Ä\Ëaj6ï@G\n.ê≤	(@îM\‹Ò$ 	H@êÄ$ Å≤\‘-æîG|[¢¿’ïáÉ\n4œÆ% Å\‘\Ì¢á©\ŸT\nÆÅJPÄ®î;4FêÄ$ 	H@»ë@\›R|\Á\ﬂVÄ\»q5wïáÉ\n4œÆ% Å(@Ù\0À¶„äÄ\' ∆ï;k1àZ∏I#% 	‘íÄ)òj\È6çñÄ$ Å\»#æ≠\0Q†ÛpPÅ\ÊŸµ$\–à`\Ÿt\\òøpQò=˜Å0}\ \‰q5/\'S]\n\’ıçñI@®;ãP\◊›É\⁄/	H@e\»#æ≠\0Q†\◊ÚpPÅ\ÊŸµ$\–à`\ŸTê¿(@åû∑J@ê@G\n.	H@4S0\r\⁄\«\Â+_û\‹`Z\ÿ\Ê\‡£Z\ﬁq\”93√Ñªo≥f\Õ\ \ÿc1\Õ ä\·jØàAPwL	H`	(@£◊ù≥$ År(@î\√\ŸQ$ 	H†=Å∫≈óÚào{¢¿\'\"hû]K@=®õB\›\√\‘l*ÅéL¡\‰)õ\0ƒØ~˜«é√æbÛóÜ´Øæ∫l\”OêÄjN@¢\Ê\‘|	H@„ÄÄDMú\Ë	àö8J3% 	H†ˆ,B]{\÷n\◊_˝(õª\‡ë∞ÙRKÖ…´≠<\Í\ÁØz’´j77\rñÄ$ Å¡PÄ,GóÄ$ Å j≤\n j\‚(ÕîÄ$ Å\⁄PÄ®Ωk?Å≥~tGXiπe¬æ[nX˚π8	H@,à¡Úwt	H@PÄ®\Õ\ZPÄ®ç´4T„ÜÄ)ò∆ç+ùHè zfÛ\‹	(@\‰é\‘% 	-à°uΩóÄ$PûÄ®å+:¢\0QGi¶\∆Å∫}@å#ÙNe¿ \Ï\0á\n.	H@»ã\0\ﬂ\Èú∂Q^\›Ÿè$ 	H†guã/\ÂQ\„\ÿ\"\‘=/ì\Ï7\‰\·†\Ï£\ŸR(í@\›> äda\ﬂ\√E†nƒä+Æ˛Òèóì\nö\ÌRK-ñ[nπÇz\œ\ﬁ\Ìøüz*6¶Ñó$ 	H@êÄ$ Å:\ƒ\ﬂ7è>˙h\ﬂ\»Úào+@Ùçø˚çy8®˚(∂êÄ\  †\0Qe«®\"Å∫	\À,≥L\ÿy\Áù\√Fπªq,\Î\È\…\'üü˘\Ãg¬π\Áû;ñnrπ˜Ü\ﬂ\‹ûæ\Ã\“a\Î\…\œÕ•?;ëÄ$ 	H@êÄ$0(sZá^w\‚3K1aˇ˝˜ã/\Ó{¨<\‚\€\n}\„\Ô~c\Í>ä-$ Å2(@îA\Ÿ1™H†nƒ≤\À.\ﬁ˘\ŒwÜ≥\œ>ªä8kcßHV]u\’¯\„è\‹fS0\r\‹\Z 	H`\‹0”∏q•ëÄ$ Åå\∆\Zü\Î˝ò©\0ë\—Y˝4\À\√A˝å\Î=ê@˛ Úgjèı 0\·¢0{\Óa˙î…µ0∏H\‚\Êõo\Ô{\ﬂ˚¬•ó^\Z^Ù¢E\Ë?Ù°Ö}˜\›7l∞¡\·êC	ü¯\ƒ\'F~_$¥N8!Lû<9º\Ìmoçˇ\ŒcLà<(⁄á$ 	TçÄE®´\ÊÌëÄ$ Å¢	å5>=\÷˚ \nˆp*\ÿDªóÄ2PÄ\»\ f0Å^à$ `ˆg?˚Ÿ∞¸ÚÀ∑ú\Ìé=ˆ\ÿ¯ªM6\Ÿ$˝π™\"@‰çΩJƒ≠s\Ááeóû6YkıºßiêÄ$0d Ü\Ã\·NWê@	Ãô∑ Z5u\“\Z•X7\÷¯ÙX\ÔgíûÄ(\–\’y8®@Û\ÏZËÅÄD∞l*Å(JÄ¯\Õo~æÚïØÑΩ˜\ﬁ;út\“I\·\Ã3\œ\'N \ﬁ¸\Ê7á\À.ª,ús\Œ9Q†\‡î\ƒ:\Î¨OG3Æˇ¯\«a⁄¥iÅæ=Ù\–¯3æ+w\‹q\·Ù\”O+ØºÚmì¿ë˙8¯\‡É£Pr\≈WÑ}ˆ\Ÿ\'ˆq\·ÖÜ?˛ÒèÒ4\ƒÛû˜ºıØ}DLa,Nd`\Ô\n+¨\–“ûVÓ™í\01¿\Â\‰\–êÄ$0\Œ(@å3á:	H@5$Pv|i¨Ò\È±ﬁØ\0Q\"\Õ\√Aõh˜ê@Fe+\‘Õ≤ô\n\'P\ÁL]t\—Hê˛uØ{]\‡ˇ#\Z<Ù\–CÒ√µ\◊^\ﬁÚñ∑DÜˇ;ùÄ\‡^Æî\ÓhávàbBß§E\‚˙¯\«?\Z\”7Ò≥Ωˆ\⁄+|\·_$¯ˇGy\‰Hˇ˜\›w_¥\ÁîSN\È#\ŸMå\›*”é;\Ó8*\rv#NpO;{R:©\∆≈§\0Q¯£\Â\0êÄ$0\0\nÄ\ÓêêÄ$0äÄDM\ƒ+_˘\ \‰\”\¬6\’\“\‚õŒô&\‹}sò5k\÷@g§\01P¸.	H@9®kjN§†>AyÑÇˆ)˘\Âó\«S\nIx˘\À_\ﬁVÄH\Èó8\‡ÄX\€1\·Ünà}µ V[mµ8f\Z\€Ò;N@|˛Ûüè˝•\Èˇ\”\„)Ü\‰\∆\∆>\⁄	ª\Ôæ{<\Â∞\Õ6€ÑÙ\ÔTü¢ù=Ù\’|UIÄ0S≤]H@ê@$†\0\·BêÄ$ ÅAPÄ¥2éØ\0ëî\Õ$ 	H@c$Pw\‚é;\Óà)äRÕÜtä âYj@  f\–W∫“âäî÷®πu 8e\—xa\À\Êõo>íâçií¯ˇçƒΩ˜ﬁª\ƒ\ÿ)ïSª\"\‘\È\‘i°R˙%lHß>ö\ÌIl\Z^%\‚¨\›VZnô∞\Ôñéq5{ª$ 	;àa_\Œ_ê¿\‡	(@\ﬁô,PÄ»Ñ\…Fê@éL¡î#Lª™Å∫\ngü}vL9t\Ã1«å&¯\ﬂ|\Z\"ã\0—ò∫(uñÇˇÕß9\‰êÙGÄHˇnNq\‘,8¥ fŒúé:\Í®xöë \À	⁄•˛H/ıã_¸\"û\¬@xigO´˘ß?˝)\Ï±\«\·∂\€n¯zUÄ∏4@ê¿∏!†\01n\\\ÈD$ 	‘ñÄDM\\ß\0QGi¶\∆Å≤? \∆:ßRsu zNº\‚Øà≈°)\Ê|\Ï±\«\∆b\Õ\‘X\‡\"eW´\Z\ÕuRüú2∏È¶õB	öO@ :4\n\Èu\'\“…ÑN\' öà4èn\' \ZWß∂\ÿ\›ŒûV)ò^ˇ˙◊á≠∂\⁄jîÄ3®•¨\01(Úé+	H`¸\‡;˝Å\”6\ZsFêÄ$Pe«ó\∆Z\"`¨˜\„˙xZaÒ\‚≈ãk\„(à⁄∏JC%0nî˝1n¿9ë\⁄®´\0Å Ä\Ë\–¨\'Äèpp\÷YgÖ¨5 ∏á¿}*`ùöÖ\”N;-\\v\ŸeÅÒ¶Nù\Z≈åü˝\Ïg±æ\ƒ:\Î¨ˇ?¢WJïıÇ»ú9s\‚<∏é?˛¯¯\ﬂ…ì\'\«©\»6˝Rh:˝ú6¸é:çv7\nçˆ4/Räaœù;7Œ´\nóDº†\rêÄ$ 	H@ê@ é/çU@\Î˝0SÄ\»c\Â¥\È#hû]K@=(˚¢\”l*ÅB	\‘UÄ S\n\–\'@Iåhƒì¶àk\ÂïWn[Ñ∫P¿\Î¸k_˚Z8È§ì\¬-∑\‹VZi•JXß\0Q	7hÑ$ 	H@êÄ$êÅ≤S|è5>=\÷˚ rX4ù∫\»\√Aõh˜ê@F\nA\Ÿl\‹®≥\01\ÓúQÑ®˜∞\≈[\ƒS#§_™ •\0QOhá$ Å˙0S˝}\Ë$ 	H†7cçOèı~à\ﬁ¸\’s\Î<\‘Û†\ﬁ 	B@¢¨vZÛ.\n≥\Á>¶Oô\\kCXv\Ÿe\√;\ﬂ˘\Œ¿	Ø\Ï˛ÒèÑ-∑\‹2ºˇ˝\Ôx`ˆKh©\0QdáêÄ$0$,B=$évöêÄ$0B`¨Ò\È±ﬁØ\0Qb\Ã\√Aõh˜ê@F\nA\ŸL&†\0—ü®)±˙Í´á\”O?Ωø\nº\Î÷πÛ√≤KOõ¨µzÅ£ÿµ$ 	àa≤sîÄ$Pm¶`™∂F¨≥uM•ôG ∆ë3ù ∏&∞\Ã2\À\Í:úx\‚â\„zûyN\Ó\Ã3\œ≥g\œ\◊]w]û\›⁄ó$ 	H†r *\Á\ríÄ$0t é/çuÉ¸X\Ô\«¡°.pô\Á\·†Õ≥k	H†e+\‘=òfS	J†n)òVXaÖ∞\‘RKÖUW]µP.\„©ÛM7\›4úq\∆a\›u\◊O\”r.êÄ$ Å%(@∏($ 	H`\– ÌÅå\„{\"#(õI@êÄ\∆H†nE®\'NúfÃòé8\‚à1\Œ\‹€´B¿LUÒÑvH@®?à˙˚\–H@®;àöxP¢&é\“L	H@®=à⁄ª∞ˆ∞u\Ì]\Ë$ 	TÜÄDe\\°!êÄÜñÄDM\\Ø\0QGi¶\∆S0ç#g:ïû(@ÙÑ\À\∆PÄ(\0™]J@R\nC\Íxß-	H†B *\‰åN¶(@\‘\ƒQö)ÅqD†\ÏàqÑŒ©‘úÄD\Õ8\ÃWÄNt\nêÄ*BÄ\ÔÙN€®\"\÷hÜ$ 	#Å≤\„Kc≠Q<\÷˚Ò±E®\\\Èy8®@Û\ÏZ\ËÅ@\Ÿ=òfS	J@¢PºvûÅÄDH6ëÄ$ 	H@êÄjA†\Ï¯\“X\„\”cΩ_¢\‡eôáÉ\n6\—\Ó% Åå\ ˛Ä\»hñ\Õ$P8à\¬;@Åóo=-¸Óûπ#?˝˜SOÖßÖ&,µ\‘\»œ∂x\Èîpı\’W\ÀNêÄ$–ë¿\ƒ5\◊\ÓJ\Ë°˚ˇ‹µç\r$ 	H@y(;\≈˜X\„\”cΩ_\"Øï”¶ü<T∞âv/	d$†\0ëî\Õ\∆àq\Á\“\ ObÖó\Ì÷ö≤EK[Ûµaï˘w)@Tﬁì\Z(	H`¯õ|üsØik»Ö\Ì/^<xCµ@êÄ\∆-Å8 \”‹æÚïØdj\◊k£±∆ß\«zøDØ\Î±}\ÍqHõK@PÄ(¨\›Vû¿¸Öã\¬\ÏπÑ\ÈS&W\ﬁVú8qbò1cF8\‚à#jaØF.I 	[\ÌxK<7|\Óc\n.	H@\»DÄø…è∫}Q€∂37]Q\"II@ê@ø®e¸\‡Úktº}ı\«ÑY≥fı;D\«˚\∆\Zü\Î˝g\ràB\\˚üNÛpPÅ\ÊŸµ$\–à`\ŸT$†\01@¯9\r≠\0ëHªëÄ$ Å¯7πÑAêÄI\0\‚\…\r¶Öm>™•7ù33L∏˚fàA:©\’ÿÉv\\V\nYI\ŸN\’\'†\0Q}i° †\0Qˇu†\0Q:	H@U!†\0QOhá$ Å\·%0\Ë8ˆX\„\”cΩ\œ{¢¿ıüáÉ\n4œÆ% Åî]$®\”l*ÅB	òÇ©PºvﬁÇÄÑ\ÀBêÄÚ\"†\0ëI˚ëÄ$ Å~	(@(@Ùªv2›ß\0ë	ìç$ 	H†\¬,B]a\ÁåS\” ∆©cùñ$ ÅPÄ\0táîÄ$ ÅQ  \n}$ \n\≈k\ÁêÄ$Pà ;\ƒ(\n.	H@»ãÄD^$\ÌGêÄ˙%†\0°\0\—\Ô\⁄\…tüD&L6í@-òÇ©n\“\»(@\0\’.;PÄpÅH@ê@^ Ú\"i?êÄ$\–/à~\◊N¶˚ 2a≤ëjA¿\"‘µpìF@@¢\0®v©\0\·\ZêÄ$ ÅR(@îÇ\ŸA$ 	H†àBàBÒ⁄πJ%†\0Q*n´à\n9cHLÒƒê8\⁄iJ@(ÅÄD	êBêÄ:PÄPÄ(ÙQÄ(ØùK†T\n•\‚v∞\nPÄ®ê3Ü\ƒà±;z\·¬Ö·™´Æ\nˇ˝\ﬂˇ>˜πœÖâ\'.\—iñ6c∑§z=<¸\√\·\Î_ˇzx˚\€\ﬂV]u\’\≈/~1¸\Ïg?gúqFx\Ê3üπÑ¡è?˛x¯\·.∏\‡ÇâO|\"º\ËE/™ﬁ§*j\—O<é;\Ó∏h›±\«ñ]v\Ÿ Æ\√a}≤.ùüˇ¸\Á\·}\Ô{_¯\¬æ^˙“ófΩmâv\Áùw^ò:u\Íò˙\Ëupà^â\Ÿ^êÄÚ&†\0°\0ë˜ö\Z’üD°x\Ì\\•PÄ(∑ÉUàÄDÖú1$¶TUÄ¯˜øˇnø˝ˆço|#<˚\Ÿ\œ˘\»G\⁄zd—¢E\·;\ﬂ˘Nt\ﬂ|Û\Õ\·Í´Ø”¶M+ÕÉßùvZ¯¸\Á?6\ÿ`Ép\—Eµ ö\€`\‹\€\ﬁˆ∂p\Ìµ\◊v¥Û¯\„èˇ¯\«3\œ\Â¡_˘\ W\¬eó]˘mπ\Âñ\·\ÔxG\ÿu\◊]\√\Âó_8\‡Ä∞¸Ú\Àg\Óo,\r\ÁŒù\·R7\ﬂ|Û¿wınƒ∑æı≠p\ƒGÑïVZ)\\zÈ•£àßûz*\‹x„ç±èÎØø>öˆ\∆7æ1|\‡˜\ﬂXy\Âï\√V[m5ìk}o¢y^s\Õ5aü}ˆYbﬁõn∫ixÛõ\ﬂ\◊\ÀÍ´Øû;ó,\œL\ÓÉ÷®√ºû¡è~Ù£·†É\n`lˆç\0\0 \0IDATcxãæ ä&lˇêÄ$–çÄÑD∑52¶\ﬂ+@å	ü7K†R *\Âç)ë¿¸Öã\¬\ÏπÑ\ÈS&ó8jˇC±\”{∆å1`\ËUOU ˛\Îø˛+úu\÷Y\·ø¯E¯\‡?\ÿ6OÄ\ÌC˙Px˙”ü\ﬁ˚\ﬁ˜Ü\Õ6€¨¥\0{£\«@\⁄	¥ml\√ˇG\\8¸\√\√:\Î¨z\Ë°(H\Ïª\ÔæÒø\€R~˘\À_v_í\rã/é¡˘C9$Lü>=ºˇ˝\Ô\œ}\Ós√ø˛ıØx¢\‡c˚XH\ÿQMpø\ﬂ\Îüˇ¸g∏\‰íKbp∫ìêÒ\»#èÑ¯\√\·∞\√/~Òã{\Z	—¢QÄ¯˚\ﬂˇé>˙\Ëxz‚ìü¸d\ÿ~˚\Ì\√2\À,˛Úóø\ƒ\”¨ñ◊º\Ê5=ç’ÆÒˇ¸\œˇò\"\‡å∑´y≠r\Í_˝\„ˇà\'x89q\√\r7ƒü=\Ôy\œ\ÁúsNÛæ≤<3˝åâ®á\›u9=√≥r\ÂïWF°∞”ïµ]s<@¸å>Ú\»#\√\∆o\‹“û\ÓQÄ\Ë	óç% 	H†\0\n\n,´ˇ\ÎR¢Pºv.ÅR	(@îä\€¡$\–7àæ\—U\Ê∆™\n\0\"0ä∏∞\÷Zkµ ~Ûõ\ﬂƒùΩ\Ó¯\ﬂ\“K/=0ÆYÇ©çm\‰#Æ\Ï∏\„é\—\Êf\"Õü¿\‰õ\ﬁÙ¶0a¬ÑésªÎÆª\¬[\ﬂ˙\÷¯?Dçf¸~\ÊÃô\·Ù\”OoyB#+8òs¬ÇT?\Ì˜_˛Úó¢˛\Îu\◊u≥\0¡iòO˙\”1\Õ\’Wø˙\’%\r~Í©ßÜµ\◊^;ä7cΩû|Ú\…ô\œ|&lª\Ì∂•û§´\›Y\ÔoµVO8\·Ñp\ﬂ}˜Ö\œ~ˆ≥—Ø¯\Ï≥œé¢ﬁÖ^ò\◊f˚≤<3Y\Áî\⁄Ò\Œ\‡\‘\r\'7\Í\"@¸\ËG?ä\'∑Û;]Y€µ\ÍA\ÌK_˙R\‡\‰I´\‘gΩr\Ó\‘^\"Oöˆ%	H@˝PÄPÄ\Ëg\›dæG\"3*J†Ú *\Ô\"\rî@$†\0QˇÖPW\"\Ì\⁄fg6)F)>∞\n≤S;µi%@d]]àú¯ÒèSV≠∑\ﬁzK\‹J@ôÒ_ˇ˙\◊˜-@ê\Íä]Ò\ËS†∫ïç§C\"pçH\—œé\Îfbˆ\Ï\ŸQÑ9Ù\–C\€\n\Z˜\‹sO<-≤Û\Œ;g\≈÷∂\'I¥\‡Uf*Ø1û±É,]\·áWº\‚Ò§N/i¿2öë\Èô\…\⁄\ÌX\„¨Ç\ÏÃ±ß>¯\‡xr´\„¨\Ì\⁄ÒB\‰tµX^ı™WıÇµ\Á∂\n=#Û	H@»ôÄÑD\ŒKjtw\nÖ\‚µs	îJ`Œºqº©ì\÷(u\\ì¿†	òÇi¥\"5\Ê\'\œs\'.)nnπÂñ∏\À˜\›\Ô~˜òs«ß`]öAQAªº\◊h]j\0tgá=©z®∞\€nªÖìN:)¨ø˛˙m1Q(\Z¡Ç\"\«Ìäª\"nú{\Óπ1≠;˛	ÿëˆ\Á\Â/˘HøÛ\ÊÕã;≠ø˘\ÕoÜwæÛù1Ω—∑ø˝\ÌQ)ò≤¥Iv X´§\ƒ\·\0Û&-i©\ #ºêÜj\ÔΩ˜n∏aL°≥\¬\n+t]&\ÿ∆Æw\“qëRâ5Kæl!êKø§ÑÇ3ßP8Ÿê.ß≠Ñà¸\‡\—RRQx∫qé©_\∆J\'((T\Õ	ûEX\Ôπ\Áû\·Sü˙\‘H\n&\∆ ï\¬\0ß:]ç\œ!ÇB\„{$˝1\Â\‰ìOéª\¬aI\Õ∏ëÜàÙO¯=]\È\Ík0/\ﬁCt˜\ÿcè4û4iRLôï\ﬁ\'\Ôz◊ª¢E¥,XN<Ò\ƒ∫◊Ω.Æ)\ÊB\ -NX4Øß\‰Rd±Æ\Ègπ\Âñ\Èó]˝ø˙’Ø¢\rúBiG\ÓΩ˜\ﬁµØ}-¶Pj¨ôíe6üÄ`\Óâ~\Ÿoø˝¬¨Y≥\‚∫@b≠_w\›uÒ9\‚y˚”ü˛Oÿ∞û∞ü˜6>{÷≥ûï\ÈôIµ(6\Ÿdìøc\”1\«\ZFgw\ﬁyg8\ÂîS\‚3O™%\÷µ@∞Ö1YO\\\Õ˜5Æ¸ıΩ\Ô}/≤\‰t\0lÒ˛\ﬂfõmFÍ≥§˜8\ÎaØΩˆ\nw\‹q\«(AÜZ\r\Ã˚ô\Î˛˚\Ô\”≠∏‚ä°\—<üº/6Ù˚∑ø˝-¶Jª\‚ä+FL\„\Áà|âıQGy6∑\√<\ÿ√ï\ÏL\Ô\“P5?ü¨C\÷-\\ªù®\Í˙\È\–@b,ÙºWêÄÚ †\0°\0ë\«:j€áD°x\Ì\\êÄJ `\Í—ê[\Â*\'0GNÚvA§Ny¯\”}\Ïñ&p|Î≠∑∆ù\„y\Ìt\Óñ6®Ñe\‘\”u \ÿ\ÈLÄ˙¶õnäˇù:uj¯Ûüˇ£K-µT\\\Ì\n\Áf \Œ<Û\Ãìü¸$\÷K ¿O0ó\‡3¡w\nl%∏\«x§P˙\√˛É\Õ>\”\⁄\À“¶\—Q\Ìà¥´\·ÑyQÇÄ$\œ6¯~\Ìk_sºgŸ©æp\·\¬\‹fw;\'~˝\Î_á<0X\ﬂÛû˜ƒ†/nû%ÇÒ‘ë8ˇ¸Ûc°m∂ç©zZ-6ùàç\‚í	íR@\ZÅ!˝éºˆåI\Ì≥0$8O\0ai\›u◊ç)•öãR∑[\Ë\ﬂf.§kJ\œ5˝\Ì∞\√#\œ:A_\ÍG >Ú_8¬èˆ)ÿåˇ\”˝\Ï@á9)ûv\⁄iß∏(\√A\‚ˇ˜#S\ﬁ\'Eåø\Êök∆πt&Äè`Òåg<#Æ\'¡¨3’¨\Ï¡õ˘ˇåµ\›v\€E¡Ö4c\›0^˝\ÍW\«\‡;\'Y∞#]≥	æS;•qd]á•iKä.l\"(è0\√˙g~0M\≈¡^ˆ≤óEaä#í0&ˇã-∂¸\„\„\⁄D\–\·YDÑ\ b\Îö4D\…œ¨}lJ?ª\Ì∂\€b\0ùgÅ\⁄\"ÿñÑ@\nù∑™“ºN\“X\«¯ô\ÁñST§˜b- J\·cx≤ˆ9Eëû)\÷\0ø\√/¸ÅÅ\ÃPkÖ\œû\⁄$é†/\÷i\◊XÁ¨ë]vŸ•eö98pZ°±{´\œ8≥n?yÊ®â\¬E™&\ﬁ_¯\0ﬂ§ãwR≥0\ÿ\”FÜ\∆\n \ŸDêÄ\n%†\0°\0Q\ËSÄ(ØùK@ê@	 FCnó≤Ü¿)RR@0\›E`î\‡;HI\’\Ìjh\ÏvO∑\ﬂ+@t#î˝˜\ÌX∂˚9A\”]w\›5\Ó§\'∏\◊\ÔE`òù\Î6\Ÿ)‹∏WYeïTNπ\Ê\”Nb≠\Ï»¶mñ6\ÕÎ≥ù\0A:#Çú¨\ÈT`9\’(¯\Œwæä\–{IïÉ\0A∞ï]ﬂú8h≈ì /AgÑà\∆S≠v\ 7rFh (\Õ=≠ƒê\Ê˚\·\≈N˙åß/NP\‘%\Ë\Ãi©ü\Œ*@¥zÆ\”…à$6∞}Ù\—G;\Ã	∏3&Ûv\ÿq\ﬁX\ƒ;çÉ∞Ò∑ø˝m\ZÖãVÒ\Ê˜Z:\·—º^≥\Èah˜\›woª¨õ˝ò\÷Ißµö\÷!~˘\Ówøó#\Ïq!ò¿áS\\\ÃÒà\”\r\\åA™-\Íp4\Ó¨\'˛ñ∑º%˙ï\”	›û\Ïh\«\nQ\0\ﬂc\œcßZA˙	¸l\»\"@pä\—1\Ï%/yIúGÛÛ\◊\ÍôHmX#IÄ\‡3àÙ\”Kúà`›¥{ó5œ£];ÑI\÷\Ôl\‡\‰\r˛ÄOö[Z0¯Å\Á\‚ã/é\¬^QóDQd\ÌWêÄ≤PÄPÄ»∫V˙jß\0\—6oí@%	òÇ©ín—®(@åÜ\‹NÄËîÆÜ†,;B≥\‰ˇVÄ°é\' \⁄\„\∆RG°˘Ò&Eª\€/π‰í∏Àö5\≈z\‰Ñiâ(ˆ\‹X∏q≠fiìUÄhú7\ŸeM@ùæH°D\ÍR=˝\ÈO\œÙ∂Ç#¡fN7∞ºq\Á|;°°õ\0\—MÄkºü\Ô\Óúnx\Œsû3J¨hææÖ/åUÚ˙ˇ˚\ﬂï∂®\›$≥åÅˇ`≈étÇ¡à\\\Õ˜ß9Òª\∆Sè=ˆX¯¿>E*~Œé¯^\ƒlΩı\÷m=g}O5≥\ÁtI∑µ\⁄(@t;\Ÿ\“*∏\ﬂîO>A \»\Œ	vÛg±£õ\0±\⁄j´EFJb\\Û\Z\»\"@ fp:¶Ò§\\/\‚A \“\ÿzú¨¢?û£î*0ãà1VÇ±AL\Ôæ˚\Óhˇn<˝Ä≠Y\ÿdzqti§\0ëE˚êÄ$ Å±PÄPÄ\À˙\ÈzØDWD6ê@mXÑ∫6Æ\“–ú	(@Ù/@¸˛˜øè\„^væg\r\Ïı\‚\Ên\ÿ^˙*£mÚ¥Ñ$R\„Æ\Îºr\Ê≥€út9§’ô3gN\‹aL`èã (\’vDñ6Ω\n\Õı&íˆÖ†¸î)Sbêó47\ÿ\».ˆN©mHI\ƒ)\0ûv⁄ìÜZ\È\‘BøD:Ò\Ãg>3A˘~\ﬁx5ˆ\À\œŸΩM}â\∆\”ÕÅRvySﬂÉù§æ\Íve \Ë#•\‚î\ÈnH˜É®\”NÄH©{RççÙ¨#@ ¸êv™WÇæ`¿Z&ùX´b\ÍY\ﬂS\Õ\Ôûv\œC\÷\"\‘Õú;	‘≥hÙw\Zû<C›ûô,\' í\0AüúÑhU\« KêΩ\’¸˚ 8ıA ´Û\Œ;/\÷~ -b@z7î!@\‡#\ﬁ§\«\‚Ö I\ÍØVüÉ∞Åõ\' ∫ΩA¸Ω$ 	‘ùÄÑD°kX¢Pºv.ÅR	(@îä\€¡*D@¢?ÇÄ*E@\…\√\Œ\ŒÙtu*¥KõVÅ=RΩ§a<ªÆ	>ìÓâÇπú(:LNrÚ\Ó%P\›X\ÃX\"ø™Kr\ÊìﬁÖ\‡1l.RëZ%•D\È«íTÅ \'iä¯~\Ÿ∞§¿/˘\‹I1DZô¥Àò6ú$ ∏«Æ˙nmökT¥ß”§JJ)°ò)Éü¬ª	BRîö<¸à3ÕÅl\÷.µíí“áz\‘†¯rªL≠v\ƒw;Åm≠j@$_4\ﬁKÑvm7¶z\"Pä/ª\Ï≤xÚ$\ÌÚ\Êye\Á:πˇõ/8ë_˙Ù\È#©êH«ñäV7ü$!\›\–Fm\÷[oΩXœÅ5áv\'¯9º8ß\‘6\‘q¿œ¨\“Yµ>h”ò>™U\n&|ÀªÑ`=\‚\r˛b=ëÚh˛¸˘K≠\÷v≥ì}ù\÷jZáY¸\⁄*∏ü\'jT§µòûENñ§∫Yûáfø\”¨R\n¶îéãw˝gú8\÷9\Îôºß©}\–Ãªô\œ\'W\Z}\ŸNÄ\‡tNVöO{<QèÉw\–\⁄kØ\›S\n¶täb¨\' ò[z>xû\‡¡:\‚ù\–|Y¢üOÔëÄ$ Å:PÄPÄ(t\›*@ä\◊\Œ%P*àRq;XÖ(@åvF∑L\◊^{\Ì®R\ÍãîiWhó\«\\\ÕCRñ0c7)¡.Ç\…?˝\ÈO£APôùÆn∏a\ÿr\À-cÄêÒæÙ•/\≈\0\‘˙\ÎØ˚TÄ\»\ÔÅ\"ÄJ!\‹g=\ÎY±\ËlcJÇn\‰~\'ÄJûz\“®$•\r?oµ;\Z\À\ÿ˘Oë`i£pî¨Nik1BEëÒˇ\ÏŸ≥cpö`\Ó\œ˛Û(\∆&Ç¨\‹Cêí\"\’	>Î¨≥\‚iúnm“öal\Ë\Ïú&ïÖ°ô\‚\Z\ÎÓ§ìNäª\Ï	∫2u%\‹¯\Ãzd?,H\'D\0?\Â\Ógß?kî¢\“\ÏTGd#??ˆÚ\ZµX˜õm∂YLõ\√I´æ)÷õv¸c\»%O˛|\∆ÿÖy\„EÄó˚öã\›b#\„¸\Ówø\‡äpBëf¸\∆\\VRëa\Êé\Õ!∞újslø˝ˆq\‹Eã\≈\‚øï\Á?kˆaö∂sZÑz\ÂT	\ÈùXC\‘\rI}S\–¨=D\nÑMR‹∞ÀùˇrO*\\\Ã;Ä`8ˇ?øf\Ó¯âãÇ¬¨7\ƒ¸\…X\ÏV\Á˝B\‡\Z¯Q≥ÒB\Ë§\»05∞¡-	*Ä\Ÿ&õlON0\ÔT8ô\”I#%]∑uà\r¨u\Ï‘Øh¨˘\—hOzví0î~á√ö£˛\n>\‰9e-\ﬁq\«\—l\Àbæg]räÄ\Á\nQÙ\≈\⁄EP¢&\nBÛ\Á\‚›Äà\ƒ3\näTs⁄Çuì~OçòÛ\\\“¡âì4úpBxB¿§~u$xˆ\“\…&Ñ4\÷8˜\¬ÒéAta-Úúpràué(>[∞´≠∂ä©\≈\‡Aˇ\ÈtK*d\Õ\ÔS\Ìûe\nΩ#∞ñ©ÛÅ†à®ï\Ím$°ßπ]z\œ¡ó5DQmlh>y\Ê\√;µÒ\‘X~o\Îˇ\Î\…LEPµO	H@ËÖÄÑD/\Î•\Á∂\n=#Û	TñÄDe]£aPÄ\r∏õ\0ëR]pZÅ@A\Èt\"K°\›fÇ4Nè\‚P\Ëî\"µ\Ï∏>Ë†Ébpí  ;lõ/\ÍêzÖK\"üá$\ÌXOΩhm.Bå8@Pû\0!A>\∆õsü7Z\ƒNi~\Ì\ƒ˝(\÷ éb\÷Z¨íYà¥!∏Jò†:A_\⁄©∏∫µI\"AÇè\Ì\Ê\⁄|Ú\·Å9\Ï∞\√#B˜b;¡`N\\y\Âï1HK-ÇπWSj&ÇˆN	î#ò%\‡ôvõ\'HOpó±R\ (û£d	˙6ä(\…~Ç\ƒr	∞nºÒ∆£û˙\Â\"†\ÃxåÅ\»\«¸)\"\ﬂ◊æˆµq|©j\”i\Ï\ÊY\√>\“2ë6	˚8©\¬S;80jZp! ∞#QÖ5¬âÖn∏!ŒâÄ;;\Í89Ç=F¨\‡ú\–¿&˙n<Q\≈\ÿpeM `4ØWÑ	.⁄§ãÙ8åõ|›∏¶YGà.2\«Oc\\N`Q`úã 7˜§ß=kíÄ4µ2X˚Iî%¿é˝<ù\÷!b\Z\Ô\—∆´Q\»M?\«Wi.I\ƒ¡7\È¢Ç˘∞\ƒ~0N\Ÿ$qäwt∑\ÁÅ6©~0\œ\‚sÇ3Ç!\Ô\Ë\Áw\‘/¡\Ô∞\"\Â>bç<b˜ùw\ﬁ9r\‡ô@\¬FN≥Òl ∫πÅ\0Ü\–\√3’òZ-µA¿`ç!|¿üık\n>s\')	\ÎëàgÑv¨ùF\–¢\¬WÚ—≠∑\ﬁ\ZE\"NE\\≤võ\◊\røC¯kl\◊xä\nÒFº∑öãO3\¬kfE^\nE“µ\Ô^§tÉ|ó\„¡;ú˜*\œ˚\ﬁÜ%∫¢=\œ=\ﬂ˜xóxe\'¿\Á\0\‚,ü´≠6x§\⁄Z|æS˜®Ò\ƒrˆQ\∆ﬁ≤*vå}&\≈ÙÄ\‡\Õ˜7.6\◊]∏üãø©¯º\ÊÛå\œ›≤/àB◊úD°x\Ì\\•PÄ(∑ÉUà¿¸Öã\¬\ÏπÑ\ÈS&W»™ˆ¶¿#\‡¡âÅ\"Æ¨cì~á\‡+;≤ØNÖv[\Âz\'(≈é[Ç4à¯Kè]\„|!\'8◊úøøyºVy\Ìã\‡ìGüUÆë\«¸\Ï£|q8]A–≥\›n\ÏÚ≠\Zü#Ú£&\nbÜW{¨ID9ÑØVE\⁄Û™3(pJ¶]ÒilB\‹\„¥¢!)æäº™\"@∞i\0à\¬\‡\«|c/\“¯\Ì±\«K†h%v…´™}srqìTcºg8H ë†qß\Ô@UôO:»â6æ£\"Üv 8=G\0ù5ÉÄ\›Xõàyqz\n1ìS`úxÉ	\¬$ßø.ø¸Ú(\Œ\"\–Z\Ê\›à?¸\·Q0Fd\Âª4\ﬂ\◊ÖÛ4è¥˘!¡7m\÷\»kû\Õv4\÷Û\ kå:˜ìó\0¡3\»\Á\']ˇŸ∏Q\Ê•\0°\0Q\ËzSÄ(ØùK†T\n•\‚v0	ÙM†JDÛ$≤\⁄mï≥ù]≠¸Ò\…\Ópv\ÿÚ\«;\›˘√ä]\“)ïJ;hûÄ\Ë{9y\„8\"¿NtÇ7o|\„c\0¡+¸q\œ~¯T\Œ\ﬂ˙r{$\≈\'¶H\Á\’Í™≥\0¡gvNDµ:\›¿≥\»I\r•õoæy\·\‡´ @\‡O\ƒOR≥±€π˘Ù\Ã\ÿl@ZØ\ÊãS*údiN-W8∏ †éÜ\Ô≥^\‚§ßq8i\ƒ\…!D;6yêçkpõ:uj\÷.“é¥ds¯ππ&R\'ÉZ}á\„˚$\'9EDù!N\ r“ãh§M˚\ÿ\«>\Î±Û?è +\Îêíqº	\Z≠ﬁµú,\Ê$\Zs&Mß(K9)¡	◊îj2œÖT\‘;øüg.\œyı\”B-);õE\⁄Êæ≤∂kºègáS´§%\Â}\“À≥\ÿ\œ\\\Z\ÔQÄPÄ\Î\Z\ÍxøD°x\Ì\\•PÄ(∑ÉI†oU ∫\⁄m ¯ÉÑÄª°¯\“L\Í\rR∂P|ñ4<§`\"o8)k¯\„õ]Yú∫ Mic∏ ˙^N\ﬁ8\ŒêÔû¥F\Ïöe\Áy´ºÙ\„l •M∂\‘\⁄ çªEΩZxÚ\…\'c∫.Ç…§¸h∑S\›]©¯|’ô$\' ïÑÚ\Ê†9;∂\'\ƒ\Ï∂\€n•<ÉU í\ÔZN\Áw\Ï\Ó\'pL\Í\ƒ\∆\0/ª€π\ÿ\…>.\“v¡Äì™Y/vßì\Íã:*àZçÅq\“q\"î\Ï©\ŒP÷æ\Àjw\ﬂ}˜\≈SÏ∫¶FL/W´\Ôpw\›uWÇÛ?>”öÉ®¸û±hÚ8\¬wS\÷\"ßnáAÄhµ(ΩìyßQggµ\’V\Î≈ç]\€%@ÙÛ\Ãu5∂¿¨w\“,Ò\Œ\Î$@dm\◊\ ‘îÆ13˝≠T\‡îF∫VÄPÄ(tù)@ä\◊\Œ%P*Å9Û\ƒÒ¶NZ£\‘qLÉ&`\n¶\—hóÇ)m%ó/ßZ\œ\ÓVhób≤\‰\'%\0Aépy\Ïê\ÂK8ˇ\„ãÚΩ˜\ﬁÛj≥ê\›m\Ï\»b7]\„En\Ó\∆?\ƒ ˝9~ïL< ˜|ª\‚\∆U≤W[Üè@\n~•\⁄\ÏõSØTë\nµ\'¯|b\Á0;K[	Që\À[\Âc/jNu HG^Û\∆zAú°vª\‹{\rZ\≈r,˝\"RíFr≥\Õ6ÀºûŸΩ\Õ˜6Z¥\€\ÕO:/R\‡Øjä=Ç˜§\Ÿ\Èß\‡zÛw∏$∫P√áù‹≠\÷V¯æ\ ˜∆±\n¨Cæg\"ûÚ\›tXà\‰æ\À7ü`\Z\Àsë\Ó-BÄ\Ë\Áô\Àc.˝ˆëN\'∑\rÎ∑ù\0ëµ]\';\ÿ0qÒ\≈óz∫LB¢\ﬂg#\”}\nô0\ŸHêÄ*L¿\"‘ùàÙI*dK\Îv˘ö;\⁄%}\0‹•\‚ÆÙìÚ\—rú{\ŸÕ∂\ *´\ƒ¿_b˘û¡¢|Igó;(\…_K\·\—\∆\‡éDÖ0MìÄ$ ÅB	\‘AÄhÄ”å\»\ÿu\ﬁ(L4∂]∏pa(&Mö‘±8+\ﬂ89y\÷Yg\≈\‘EàDÙª\¬\n+å\ yè\ÿEö6B ÄqRå\Ô±\ÈÉzTÙ¡˜\r\nùs˙í\r)o~\À\ZE4~Üà¿\È\Í\\§+µmgs\"\ÿ\ÀeNL¥;5¡©\ZNÉ¬àTï\‘L 5K;[íò\◊n‹µ\÷Z+\‹r\À-1\’vì6â~aBü\ÈB\0`\√\':\“w7æ∑5\Á\ÔG\\¬¶ùv\⁄)ˆë.RK•q8\Â¥\’V[\≈_•tù|\◊clRn\“\ÿNQj\Êª\·ÜFªaª´Ò;j*2ˇ\ÿcèç¯+˝Q\÷\r\ÿE\0xŒú9±&	\",“ï\ÓÅ˜\r7\‹7\ƒp™ã˙ú\–emq\"ÉÄ:	ˆ\"L~Òã_å˝ qßB\‡I*)\÷5.“â)\“˘}Ûõﬂå\ﬂmô;ß•∞ÉÔ∂ç˝\Óª\ÔæÒ\'_\‡\‘(é˝òÇ\√\ÿ¿˜\‚\ÃN}Ûùö\⁄¨aû\r˙Jæku\‚Ø˝klCç#û	\Êü\Ê\◊l\œkˇ`?©\Ë∞!}wáe\';\ZkQdY«≠ûK\“qµ{\ÊZ≠NNüz\Í©!ôäA4\„\ƒ\Ë5\◊\\ˇ\€¯˜\rb\Z>i¸Y\„3C\Ê˝\…O~2¶\ZlÙ\Î\Ï\Œ;\Ôåcp!.n≥\Õ6Ò˝r\ÿaá\≈\ÕWçO\·W~áH˚ëè|§e;R?¶vç6\·+l\ÁJ\œ,ˇf\√\'´Xcoºq°üA©sàBöD°x\Ì\\êÄJ †\01\Zrª%∏¢\Ô! ˙F\ÁçêÄ$Psu \ÿm˛¸\Á??\Ï≤\À.m=êEÄ Gz¨ùw\ﬁ9¨ø˛˙Å\04ÅF\“B≤yÇz\n©Q\Â/9l±\≈1òK∞è\0¡H˙  æ\∆\Zkƒî`Å˘/\'1	\‡î%\»Nê7¯\Ÿ}M@ó¿ ?kı]§õm§_\"x\ÿ*∞ü†§~),K\Œ˛\’W_Ω´-ù\∆e^ú¶ @J`˙’Ø~u8\ÂîS\‚\÷Û§6<π\“\…\0Ç\„\\õ”™\ËD¨!ç`ë.¯\√˜\÷[oM~†˝:\Î¨\≈R\“PøéIîiUî∫\’B!\–Mê˛o˚\€\»	DƒÇeñY&˛ˇ—Üy3&\¬µ5\"˛lF0H\' \“tÑ\Ã0\'](oN°¿ê{V\…X∞ Xè`É\–\≈\Ÿdò¬èæ9)Ö¿Ç®Å˝¯ü¢ı¨\œ.∏ ¶ÉB\√\⁄\œ?ˇ¸|n¨=Ñ=åK\råtbÅæiá∞√∫\Âd\rº∑N>˘\‰%\ÊK–ò\Áàv¨±ü¥≤Év¨\Ó!Xc\Ïß.s¿èY\Ï¿_›û©n\œ%b˛@T\ÎtäøP`˚\–Cçßf8yÑH@\Ìã$@\¬Nç,\‡ë~\∆{\"( B1B¸\∆\œÒ«Ñ	\‚˙ }ß\‰`\ )r⁄¨ºÚ\ Q\–cﬁ©O8 J å4Æ˘\Êv∞ÄÛI\'ùÖ!NZq•TM¨ª)S¶å<\"\È\ƒ	ß\÷Ö¡\"?\Ó  ä\\_Ò√áóãó$P¶`™øùA  ˙[9˝\ﬂıÚ≠ßÖ^∂c\ÿjˇ\√[vr\√\Á>VôW¸c\◊KêÄ$–â@Ä\Ÿ5Mq\·±\\∑\›v[ñLlº\Ã\‡gwrJ≥C[\Ó/y\…Kb\–<\”IsÑHAêê\‹˜\ƒ8ÿ°N\›\n\ƒ\nv|7:SÄè†{;¢õmiv\"•\∆!Ä\ﬁÕñn„íûè†$;ºw\ﬂ}˜là\rL\ÁÕõ7í∫\Âû{\Óâˇfßz´B\·åE\‡ï ysJô\Êùˆ,à¡m˘©Ä{:AÅx\«t‚¢ó\‘l\ÕBmòAv\ƒ\∆DdBÄzÙ\—G\√Wø˙\’@Z\—Vkâ4Ü©_Ûö\◊D>∞a- †§\‘P\Ì\∆mà7ßJ\'<X7_L¯Ö~oø˝ˆ(\0tJ•\ÿ§Ü7Åv\ƒ\÷8\'Ç ®\—\÷|g,\ƒNr∞“â§Vv n\‡Cƒó¥≥>Ò∆ø\ÿ\Ãª\Ÿ\—J∞k~¶˙y.õô¶5\Õ\œU∏ö7\\µ™_CÑõFÇπ•~≤ˆ¡≥ÅËÖê]V§E\0\0 \0IDAT\’júV,Zµ\„=\÷x\"åπ¿èwiöÛCà≈ü]º/ ∏  \n]g\nÖ\‚µs	îJ¿\"‘•\‚v∞\nPÄ\ÌO@ø8 äg\ÏêÄ\ÍHÄ¿\ÁökÆŸì\Èu \⁄\Õzö¯ˇoLpêT4\›Ú˜ß|Ò\ÏÜgz£¡wÇx\Ì\Í0d	ñ∂j\”Õ∂,¡v\ƒ\Zv7sQﬂá\›àn\„∂J¡ìÿì\ZãSD$HAF°¢\—O\Ì\nè”¶yD®ç˘Ôõπ\›}˜\›ÒÙ\0)k8\…\¬|ª]\›\ÓGL`G;s\"\Õ¡\“\∆@{\„	à\‰ó∆î6ÙA¡cN:§ü˜#@¿\0ë—©]˝ä\Ê~\€Õøô=~GXIª˙πØU\ÌÖN˛o´ï\ÕA˘‘ûìúé¿Nøt≥#\À3\’\œs\Ÿ\Ã*=?úHhLñU<h \ËõSø˛ıØ\„i$|\»)©\ƒ;ãà1ÇÒU9…É\∆\ÿßúñAXkºq:\\B¢€ªzLøWÄ>oñ@•(@T\ \ZS\"à—∞sâÚõNªÚJtSÀ°\ZÛ”†ó\›rÉ¥]bêÙ[ê@5	∞#z\€m∑çÅWv\Àf\"\Í&@p∫Ä†\'\“.¯±xÑ\Ô-§ZÇ\Ÿ\⁄kØ›∂´ª\Ó∫+\Ó,\'x»©v≥ß˝ÌÇ™©≥,¡\“Vm∫Ÿñv\⁄sZ£\›nwvú\ÔπÁû±ˆ\0;Ø\…\Î\ﬂMÄ\Ë6nß\04)ÅáùÛ¯	N§3Zw\›u[≤\Â)e\ÿ\ÂM@¥Òj\'K5\ÌÚ¶Û\»rB¶õ\0¡)R\ÿ\\u\’U1U\‘M7\›\ﬁ˚\ﬁ˜é¨Å\Ê˚\”˜K\Í7L¶ãüì\¬\'ù¨\ÈGÄ†\“\‚®\ﬂt\”M[2\ÌWÄhµâ®Ç4@§vjÙ7c#Zòß.bY\'!$\À3\’\œs\Ÿ¥]Ò\Î~Nqjà\‘Vú°éB@ô©Ø8\Õ\√Û\»	ûO“Ñëﬁ©ÒJ|9\Â\‚	àlü0yƒ∑\È\„iˇ©uSüTAÉVé≤π\Á?\ÍNù∏fùó\Ì$0å Ü\—\Î\Œ\nÆÉ≤	(@îM\‹Ò$ 	Tü\0Dc˝\Ì∑\ﬂ>ìQ7Ç†;EzIá\”)ΩLVè•tC\"∑\ﬁz\Î\≈8˘˚\È\Í‘©Å\”\‘9`\Á09\€IGC\·\ﬂ\√?<\ÊrOÅe\“2±;=â?§\€!»ö\“=\Á9œâ¡y˙\Ô%S;\€@º$N¿ñ¸˘çb\0¨úÛ{\“•¿b\'[∫1Ax!\’\'>\Z\◊\\\Z;ùÇ¿je4ßwi¥±]\r\⁄4Ùãê¬ú“âäVÛ!¿O;\Í6$5s˘\ﬁ˜æ^ˆ≤óEÅÇÄ˝Ω˜\ﬁ;R¥∫9\ÈhHk\…x\‚W\◊]w]U®e¿¸õ˛)MYc⁄û¸\‡1\‡\Àn\÷H?D\Íõ 6u\ZXü§¯Ç\rÖí)JﬁØ\0Å}\Ôx\«;¬∑ø˝\ÌëÒiùRÿõ¥R≠¸\“\ÓYkeGZ[¸é\"\Ê\ÈB\‰tG™ì\–Õé,\Î8\ÎsŸ©DJÒE!\Ôn)òH\’(¨4\n ¯—Å0\‘x\‡–èàëEÑÉißìE\È\ƒÙ\È\”cùF?$X\"\Î\'\»ˇµ\À#æ≠\0\—;˜\Ãw\‰\·†ÃÉ\ŸP(îÄD°x\Ìº\¬ *\Ïúqjö\ƒ8u¨”íÄ$0≠m\ﬁ\‡\◊Mà®í\0A*$\“\€p\ZaÛ\Õ7oIaÄ`+\‡\ÊÇ\∆\Õ7∞û›ª\‰N\'xH0º˘\"êIzüçßä≤ÛùÄ7\„Ñ\‰\"\›ªá\ÈìtC˙\È„¨≥\Œ\Z\È\‚\≈/~qL”Ép¡˙O<1\œ>˚\Ï(l0G“≥p\"Å\0∏•à-EÉ\Ÿ%M˝v\ÀÛ≥v∂\—ˆ\‘&e\r\ {\Ï\«#\◊<¡\Âó_\Ìj‹â\ﬂ\Õ\Ï°@nªqI7D@ö\ﬂ7ˆõ&3ÇˇÃ±1ò\› °)¿ª\”N;-Q\Ïñ\⁄IpH˝í¬à\‚æ≠Ü~˚\€ﬂÜ˝ˆ\€/2†∞1\Èí>öNæ\„dbig8E\√\≈iòÛæÖqÇÙM§sz\Á;\ﬂs\·ì˙â@->A¨\‡g\ÿE≠v\Óì^â∫¯òæÈìù˛Ùì\nÙ£çßvH\ÁCm¡?±=V& é∏Ä∏ı\Á?ˇ9≤\Ê◊§!U\Î≠ÒB\·\‘1b\Î1Ç\”\Z+¨∞B|\'0kØq- ™0ß\‰#\“\rÒ¸!∏0ß…ì\'«ö\ÿ\Õ:E\Ëb\\\ﬁ5<0ox\√Z>á\ÿ\ŸlˆÚ¨ >\·CRˇ¸Òèå>\‰Y%@ü’én\Îø≥é\€=ó\‘<`nç\œ≈ôa≤\…&õD ∂q*ÉgíµÖE{\ﬁ\r\◊\\s\Õ\»\ÈÖ$§q∫ÄwE⁄ô\Îêı¿Ωà¶\‘ Ä\·\√?˝HqxXÛ,s∫äuïN∑\‡7\Óß\œ\“Fmp\¬H\«E\Z.\ƒDûY˛ÕªÄ\‘`≠⁄•\Z+â/\Î8\’#i~6ôÇ	sHµ:\∆Òî\È\÷Ao§k|z¨˜I\"\”R\ÈØQ\ÍodÔíÄÚ&†\0ë7Q˚´Å˘Ö\Ÿs”ßLÆÖ\…|9\ÂèYæ\Ë{’ìÄD=˝¶\’êÄä$\–NÄHc\"D¥JIS\"\Ìf&®óÆVi	⁄í÷á†\'Å\¬n\ÈF\ZãÆ∂ \ËÉ 8¡cï¸õ >ç)(MPª\Ã($hGP¸é;\Óà√ßü3Ç\ÕyIâD†í{\'Mö€±sù¿#ª\Á	$≥√õ†&Wä\œ|\Ê3cõ†¡dÇ\€\'\ÌlK˝\“7¡\ﬁn∏!¶í$=◊≥ûı¨8Ç)¯ûxe±•›∏\Ã°ãëÖ9pÚ£˘B -\ÃV≈ß\€”éÇ\⁄¶S!\‹\Ê4ô)•\'v¡ôîM0#\‡˙\ﬂˇ˝\ﬂ1•µ.\÷Xcç\ÿ5¡[Ñ*˙æÚ\ +#∞á\ZS3&8L\‡!Ñ†5{ª§;b\›|!h±˛VYeïÿûÄ)\œ\'5ZD&X\ÃI\Ì\"g˛§Bx ÿΩ\√;DQ+≠+l%@˝˘\œ>äP\Ê”∫bù ™§µñû	\Ó\ÁY¶oïw\‹1˙9•\ÀaΩ\‚\∆d]c/v¡1Ñ9\\q\≈ëE∫R]\nÑNÒ∞ìü6¸õ¢\‘‹óv\Ô\'ìÌç©í¯Y\„Û\‹hG™Y¡\Ô/x\ﬁH’Ö˝∞aº$*v≤É\”G¯>\À:∆∑ùû\À\Êg\Óˇ˜£hÖ\»¿º∑\⁄j´\ËKÊà†¬∏∞\∆ç\Èì\Z\€ ±>ò¨4Xá¸\r\∆z\‚˜§|c,~\œ3\¬;°\—<\”<_ç?{\ÈK_\ZÖ+\ƒR\Ó\·\«\∆u\√{äwBcª]w\›uîPÑ˘\À_é:\’\—¯Lr\Z\—ë±\€Û\€\Ì=úı˜\n\nY\◊J_\Ì ˙\¬\ÊM®$àJ∫E£$∞à˙/\nà˙˚\–H@»õ@7\"ç\◊,DTAÄ»õ≈∞ˆGPÙ\À_˛rZ\"P|&Ä:à´[Ò\ÈFõ8¿\∆\„§¿Ú*Ü\0¢Apè,≈πã±¢Ω\"*Qp\·†\’’™^F=f\‚\Èõv≈ßô\Ô!D\'Rzïu)@(@∫\÷ \n\≈k\Á(ïÄD©∏L}PÄ\Ë]enTÄ®å+4Dê@ed í¡Ià \›\ÀQ∑/j;èôõÆh\›\∆\ x9õ!O	0R˚Å\›’ú∞\‡Ñ\0)} ∏8%¡oR\ÿd-ÜN¡f\“˝p\n¢¨\◊e∞®\“§©\‚D@J=U%€™dßHO≈âN<¥∫\Í,@P¸öN§kı¨qÚÇ<√§s*\ÎRÄPÄ(t≠)@ä\◊\Œ%P*Å9Û\ƒÒ¶N˙œ±W/	S0\rãß´3\œF\‚¶sfÜõ\Œ˛Tuå\”	H@®\rRë\“F¢6.\Àl(ª\›IQC~\Íf§|Ú)\rN\Êé26$\›\È£Hcƒ∫\"u∫\’\ÈH\›c)m\“H5D\ÍØ|∞\„ù5@∞yÎ≠∑\Œ\Ïì|FØW/ú\'¯Nö∑vkêµ\ ˙fΩí¶àTJUøI˜Ñ–áIm	ñ∆ã¥M/º30IW\Ê•\0°\0Q\ËzSÄ(ØùK@ê@	,B]dáE¿.	H@h&\‡	\◊\ƒ 	ê◊ü\‹¯\ﬂ˙÷∑b\›\0N]Ùz\‚Ç¿.Ö\»}Ù—∞\À.ªr:é-Å∂8•ìj3ê¢	\—-xÆ*∂|0P õB\◊\'ü|rL≠\‘,RxöÁèö≤/˚RÄPÄ(t\Õ)@ä\◊\Œ% 	H†\n%@v◊Ä$ 	t$êUÄ∞ÑIêÄ™F@B¢\–5©\0Q(^;ó@©L¡T*n´à\n9cHLÒƒê8\⁄iJ@\ËÅ@7¢YxH][Ñ∫\»6ïÄ$ ÅB(@(@≤∞\Zø\Ïp\Ã\ŒK®?ãP\◊ﬂáŒ†?\n˝qÛÆ˛	(@Ù\œ\Œ;% 	åW\ÌÑÚî∑+¨\01^WÑÛíÄ$P\n\nÖÆVO@ä\◊\Œ%P*àRq;XÖ(@T\»Cbäƒê8\⁄iJ@\ËÅ\0ƒ¥i\”F\Ó\Ë&<§Ü\n=@∂©$ 	d\"pˇ˝˜∑æ[u†\0°\0ëiaı\€H¢_r\ﬁ\'Å\ÍPÄ®ûO¥®\n\Âpvîˇ#†\0\·jêÄ$ Åf\€nªm\ÿfõm:ûxhæO¬µ$	H@y\Ë\ÁÛHB\"\œ5∏D_\nÖ\‚µs	îJ@¢T\‹V!\nr∆êò¢\01$évöêÄz$\–\ÎéS∫WÄ\Ë≤\Õ% 	H†#Å~N\‰)@(@˙X)@ä\◊\Œ%P*àRq;XÖ\Ã_∏(Ãû˚@ò>erÖ¨jo\ ƒâ√å3\¬GQ{5rI\nÆ\n	H@»ãÄD^$\ÌGêÄ \–OM\"àBüàBÒ⁄πJ%†\0Q*nì@\ﬂ ˙FWô *\„\n\rëÄ$P{\nµw°êÄ$P)\Ìàd$5ä.∫\Ë¢\‹\Á>w\ƒnàB±D°x\Ì\\•PÄ(∑ÉI†o\n}£´Ãç\nïqÖÜH@®=à⁄ª\–	H@®ÅnD+!BB¢\–E¨\0Q(^;ó@©\Ê\Ã[«õ:içR\«u0	öÄ)ò\ÌÅ\·_b¯|\Óå% 	E@¢(≤ˆ+	H`8	d \ZÖà\'ûx\"L\ÿ¯ïaõÉèj	\Ì¶sfÜ	w\ﬂfÕöU‘±∆ß\«z?ì¢èßÖ/^º∏êI\—È†ï£¨s\ \√AY«≤ù$ 	H†°.Ç™}v\"†\0\·˙êÄ$ Åº¥ ˆ\‹tˆßÚ\Z\∆~$ 	H@m	Lò0!l}\–G  äyJ ä\·jØêÄ$PàÚX;\“(@∏$ 	H /ûÄ»ã§˝H@ê\0<\—\ﬂ:D\‹2›•\0ë	ìç$P¶`™Öõ4≤\0\n@µÀé \\ êÄ$êàºH⁄è$ 	Ù\"@4£t&ü±∆ß\«z?\‹ \n|~ÚpPÅ\ÊŸµ$\–ãP˜\0À¶„äÄƒ∏rg-&£\0Q7i§$ ÅZPÄ®Öõ4Rê@mt;\—(<§I)@(@∫¿ \n\≈k\Á(ïÄD©∏¨B *\‰å!1EbH\Ì4% 	î@@¢\»!	H`à¥ .æ¯\‚∞\Êök.ACB¢\–GD¢Pºv.ÅR	(@îä\€¡*D@¢B\ŒS Ü\ƒ\—NSê@	 JÄ\ÏêÄÜà\0ƒ¥i\”Ff\‹IxHç  \n}D \n\≈k\Á(ïÄD©∏¨B *\‰å!1EbH\Ì4% 	î@@¢\»!	H`à @lª\Ì∂aõm∂i{\‚°áÑD°èàD°x\Ì\\•PÄ(∑ÉUà¿¸Öã\¬\ÏπÑ\ÈS&W»™ˆ¶Lú81Ãò1#q\ƒµ∞W#ó$†\0·™êÄ$ Åº(@\‰E\“~$ 	H ∏ˇ˛˚[¶ZjGHB¢–ßG¢Pºv.ÅR	(@îä\€¡$\–7àæ\—U\ÊFà ∏BC$ 	‘ûÄD\Ì]\Ë$ 	‘ûÄÑD°ãX¢Pºv.ÅR	(@îä\€¡$\–7àæ\—U\ÊFà ∏BC$ 	‘ûÄD\Ì]\Ë$ 	‘ûÄÑD°ãX¢Pºv.ÅR	Ãô∑ é7u\“\Z•é\Î`4S0\r\⁄\√7æ\ƒ˘\‹K@(äÄDQd\ÌWêÄ≤PÄPÄ»∫V˙jß\0\—6oíÄ$ Å\n∞uÖú1$¶(@â£ù¶$ Å(@î\0\Ÿ!$ 	H†#àBàBÒ⁄π$ 	î@@¢\»1äÄÑBêÄÚ\"†\0ëI˚ëÄ$ Å~	(@(@Ùªv2›ß\0ë	ìç$P¶`™Öõ4≤\0\n@µÀé \\ êÄ$êàºH⁄è$ 	ÙK@B¢ﬂµì\È>àLòl$ÅZ∞u-‹§ëPÄ(\0™]*@∏$ 	H†\n•`v	H@\Ë@@B¢\–D¢Pºv.ÅR	(@îä\€¡*D@¢B\ŒS<1$évöêÄJ †\0QdáêÄ$ Åé  \n}D \n\≈k\Á(ïÄD©∏¨B\Í&@,≥\Ã2\·\ﬂˇ˛w$∏˝ˆ€áY≥f\≈Û•\Ôá?¸°?ØàûZ.¸\Èñˇ¯nõw∂9¯®¯\ÔõŒôn:˚S˙±~¨\‚s\«;\·\∆o,}˝Tm‹¢\Ìi◊ø\„˛Áùñá^9Wm‹º\Ï\œ2Øu6\ﬂ&\Ïs\Ó5ëˇÖ\Ì\Óù}S¸7?\Áﬂã/ˆ{Çﬂó2}oÃ≤ﬁä¯˛ô◊∏yıì\◊˜\Íº\ﬁÉ≤g\ÿ\∆\Õk˝\ \ÔUw\‘\Á—Å;Ü{o˚\œ\Á\—\ \œ]\'l˙\¬\…Òo\◊^\Ìl∑˚a>\Î˙ΩÚào\”\«\”˛cGˇÜÙ;Å~\Ô¥rî\’\Ó<îu,\€I@\≈PÄ(ñØΩWó@\›àâ\'Ü3fÑ#é8¢∫Pµ¨#O@∏@$ 	H /ûÄ»ã§˝H@ê@ø\«k|z¨˜\√M¢\ﬂ’ì\·æ<îaõH@%PÄ(≤CTí¿¸Öã\¬\ÏπÑ\ÈS&W“æf£ j\·&à˙ª\…H@®àZ∏I#% 	åk\n\nÖ.pàBÒ⁄πJ%†\0Q*nì@\ﬂ ˙FWô=QWhà$ Å\⁄PÄ®ΩùÄ$ Å\⁄PÄPÄ(t+@ä\◊\Œ%P*àRq;ò˙&†\0\—7∫\ ‹®\0QWhà$ Å\⁄PÄ®ΩùÄ$ Å\⁄PÄPÄ(t+@ä\◊\Œ%P*Å9Û\ƒÒ¶NZ£\‘qLÉ&`\n¶A{`¯\∆WÄ>ü;c	H@EPÄ(ä¨˝J@ê@V\n\nY\◊J_\Ì ˙\¬\ÊMêÄ$P!°Æê3Ü\ƒà!q¥”îÄ$Pà ;Ñ$ 	t$†\0°\0Q\Ë#¢\0Q(^;óÄ$ Å(@î\0\Ÿ!FPÄpAH@ê@^ Ú\"i?êÄ$\–/à~\◊N¶˚ 2a≤ëjA¿LµpìF@@¢\0®vŸëÄÑDêÄÚ\"†\0ëI˚ëÄ$ Å~	(@(@Ùªv2›ß\0ë	ìç$P°ÆÖõ4≤\0\n@µK◊Ä$ 	îB@¢\Ã\"	H@(@(@˙Ä(@ä\◊\Œ%P*àRq;XÖ(@T\»Cbä\' Ü\ƒ\—NSê@	 JÄ\ÏêÄ$–ëÄÑD°èàD°x\Ì\\•PÄ(∑ÉUàÄDÖú1$¶(@â£ù¶$ Å(@î\0\Ÿ!$ 	H@¢\À\Z\‡Û¯i!Ñ≈ã/Æ\Õr¥rîîDVR∂ì@ı	(@T\ﬂGZXàb∏\⁄k{\nÆ	H@»ãÄD^$\ÌGêÄ˙%0\Ë8ˆX\„\”cΩn\n˝Æû˜\Â\·†\√\ÿD(ÅÄD	ê¢í\Ê/\\f\œ} Lü2πíˆ55q\‚\ƒ0c∆åp\ƒG\‘\¬^ç\\íÄÑ´BêÄÚ\"†\0ëI˚ëÄ$ Å~	(@(@Ùªv2›ß\0ë	ìç$P\nµpìFJ (@\‘(@\‘ﬂá\Œ@ê@U(@T\≈\⁄!	H`x	(@(@∫˙ \n\≈k\Á(ïÄD©∏L}PÄ\Ë]enTÄ®å+4Dê@\Ì	(@\‘ﬁÖN@ê@\Ì	(@(@∫à \n\≈k\Á(ï¿úy\‚xS\'≠Q\Í∏&ÅA0”†=0|\„+@üœù±$ Å¢(@E\÷~% 	H +à¨k•Øv\n}aÛ&	H@®ãPW\»Cbäƒê8\⁄iJ@(ÅÄD	êBêÄ:PÄPÄ(ÙQÄ(ØùK@ê@	 JÄ\Ï£(@∏ $ 	H /\nyë¥	H@ËóÄÑDøk\'\”}\nô0\ŸHµ `\n¶Z∏I# †\0Q\0Tª\ÏH@\¬\"	H@yPÄ»ã§˝H@ê@ø  ˙];ô\ÓSÄ»Ñ\…F®ãP\◊\¬M\ZY\0à†⁄•Ñk@êÄJ!†\0Q\nfëÄ$ Å  \n}@ \n\≈k\Á(ïÄD©∏¨B *\‰å!1\≈C\‚hß)	H†\n%@v	H@\ËH@B¢\–GD¢Pºv.ÅR	(@îä\€¡*D@¢B\ŒS Ü\ƒ\—NSê@	 JÄ\ÏêÄ$†\0\—e\ry¸¥\¬\‚≈ã\◊fπZ9\ \nJ\"+)\€I†˙ ™\Ô#-,ÜÄD1\\\Ìµ=Wá$ 	\‰E@\"/íˆ#	H@˝t{¨Ò\È±\ﬁ7à~WOÜ˚ÚpPÜal\"	î@@¢\»QIÛ.\n≥\Á>¶Oô\\I˚öçö8qbò1cF8\‚à#\n±˜¢ã.\n˚\Ï≥\œH\ﬂgü}v¯÷∑æÆΩˆ⁄é\„]x\·Ö\·mo{[!6µ\ÎÙ7ø˘M\ÿkØΩ\¬w\‹õ|¡·≥ü˝lX~˘\ÂKµ£\◊¡ z%6~⁄≥!j\Ó‹π\·Ç.&LG}Ù∏ô\\ï\Êˆ\√áØ˝\Î\·\Ìo{Xu\’U\√ø¯\≈≥ü˝,úq\∆\·ô\œ|\Ê\Ã¸Ò\√˛0˙\Âü¯Dx—ã^4øT≈éÅL>√†Û\Ê\ÕtP8Ù\–C\√\ﬁÜw¥nr\ÂïWÜg<\„Å`	\œ\÷˝RÄ®ªµ_ê@˝	(@(@∫ä \n\≈k\Á(ïÄD©∏L}(CÄ∏˛˙\Î\√	\'úû˛Ùß\« \È\›w\ﬂ˛ÒèDõˇ˛˜øáO}\ÍSa\«w\€oø˝\»<\÷[oΩ∞\Ó∫\Îˆ=Ø~n¸˜øˇ\ÌyÍ©ß\¬ißùz\Ë!à~@V¯ûÖ\∆¿Wø˙\’\·8lµ\’V£¨%\Ë=k÷¨0s\Ê\Ã¿∫\›fõm¬ëGv\⁄iß∞\‘RKUnfè<ÚHx\ﬂ˚\ﬁÆ∫\Í™h\Á\«?˛Ò\‹m$à˝°}(ús\Œ9£˙^i•ï¬¥i\”¬Å¶Oüñ[nπ\\\«.cnYF\‡9ˆ\ÿc#\Á\Õ7\ﬂ<òª	à¨à∫0∫Ù\“K\√_ˇ˙\◊äWºbâ\·&X[\Ôˇ˚\√Ûû˜º,\ÊÙ‘¶ŸéA	!=]b\„º™cé9&º¸\Â/{\ÔΩw%\ﬂΩ`UÄËÖñm% 	H†\n\nE¨´ë> \n\≈k\Á(ïÄD©∏L}(CÄ∏È¶õ\⁄Ú	Ús\“a\ﬂ}˜-˝\ƒC\'h&˜\›wüD\ﬂ+´z7H\'ê\Ãzd˜˙è¸\„@oºnæ˘\Êh>\ÂîS\¬;\Ï˛¸\Á?á~É\·\›\Ô~wx\Ìk_[ΩIÖí@∞\÷Zke ˛˘\œÜK.π$º˘\Õo\Œ|\¬\Áwø˚]|N\ﬂ˚\ﬁ˜∆ì\0à9_˙“ó\¬Ò\«O^~¯\·aÈ•óŒïQ?s\Àb@\÷˘#Ç Tv\ÿa\·\≈/~qñÆG⁄§µÑ\0A\‡aìuıÉ¸ \\|Ò≈Åw\Ôú9s\"ªø˝\ÌoQ\Îuå,5€ë\Âû,m˛\Á˛áú\ƒa\À-∑\Ã\“|\‡m≤˙<kª\Ê	-Z¥(|\‰#	ª\Ï≤Ke\ﬂYù†\0ëïî\Ì$ 	H†(\n\nE≠≠ÿØD°x\Ì\\•ò3oAo\Í§5J\◊¡$0h¶`\Z\ÌR0çEÄ@\‡\"(|Í©ßR8\Ìπ\ÁûQ∏\‚ä+Zˆ\›N\‘`ó*\”Û\œ??ên\ÈUØzU8Í®£Z¶\ÕPÄÙìT\‹¯)\’\÷æÖ%àV~g\ÁˇÇ2˜ã≥ºu\œ˝\ÈaïØ|%w\‹qôàV\œÅsû\Õ_˛Úóqß\ﬁ;\Ï˚ô[˛Y\ÊOp˝\À_˛r<\≈	ê^S\Î¥\n¸Û>$ïˇEÄ\‡∫˙\Í´c˙\÷bDØ\„tõoƒìO>>ÛôœÑm∑\›vâg®õ=É˙}üc[\÷v≠\Êq\œ=˜\ƒ\œÑ&¡∫^\nuıúvK@?  \n]\Õ\nÖ\‚µs	H@(ÅÄE®Û H_Bê%\ÏX\'p7e î∏Éªï∏\—*P˙\‡É∆ö´ØæzLw\¬ø˜Ω\ÔÖO˙\”\·\‰ìOo|\„GÆ\0Q\¬\√2†!:	[\ﬂ˝\Ówcêò\0\"Ah\“1m¥\—FK¨ëôøƒ∞Ω\ÈŸ©ÕÆ~Ç»Ω\‘8i\'\ÏÒ¨ê~¶’âí±2\ÍunY\∆\À:ˇ˚\Ôø?ûˆ@§\Ÿx„ç≥t=™MV\"≠G\“˜Ù‚è¨!@\‹x\„ç\·\ÔxGRöOeµ´\ÃvY}ûµ];\€y¶HÉˆ¸\Á??p¿eN1◊± r\≈igêÄ$\–à>ñMˆ[ ≤≥≤•$ 	TìÄD˛\'\ﬁ˙÷∑é\⁄\‹\ÓtE´@)ªΩ)|\Õnvä\»r\\&\‡˜”ü˛4\Ót^y\ÂïGåWÄ®\ÊÛïáUùàîfhùu÷âu@~ˇ˚ﬂá\€oø=¢\€\’8x\‚â\'bê{x!\0\0 \0IDATö|Úgûy\ÊEâk(§\¬\Êè=ˆXL9∆öl¸\Ÿ7æÒçXTöTG/æ\Ó∫\Î¬õ\ﬁÙ¶\ÿˇ§IìF\÷-u*¯˝Ø~ı´∏˝ñ[nâøO5 ∞Ö5|˘\Âó\«{HµD™$\n™S+Ç\Á)]i¸eñY&|Ûõ\ﬂßü~z\Ïo∑\›vã\¬\¬K_˙\“ÿ¥\’sï\Êv\√\r7\ƒ{m\Z\Á¿é~ÑClÑ\Ì˝®ØA\Í\“[1øî∫)\’\‡h57j*§Zù82G\ÍπPòπ R2óìN:)¨π\Êöm\Á\ﬂ\\lûTIü˚\‹\Á¢ï\ﬁâCöcb\ \œ9aïNiq∫äìZ‘∑i<\“\Í¡\Î_ˇ˙p\»!áD?œû=;˙á\06˛\≈\ﬁ_˙R˘ˇ^xae˜\ÿcè\ËÛ¥6∫\Ÿ\—Xã\"	Fÿ¥\œ>˚D7äH¨!\Ê\√¸©e1c∆åh\‚ß^xé\“\’N|¬ü¨%\ÿ\„s\“\—GzŒ≤˙≥\›zFHf]&|\‡àı9\‡S\Ï_q\≈[˙ú\ﬂ˝\‚øàmI±Ü®\›¸l ≤êäè\Áê+≠;˛ùl\›\Î^7\ÍD˛F\‹\ÊÑ\‹\Íx)@\‘\—k\⁄,	H`|PÄPÄ(tE+@ä\◊\Œ%P*S0ïä\€¡*D@b¥3ÚH¡Ùìü¸$¡V[mµQùg Rêt\Ìµ\◊\Ôy\œ{FıA-\0\Ípö\‚/x¡\»\Ô *ÙP\ÂlJ\'Ç°nª\Ì∂`˝\À_˛\◊\∆˛˚\Ôﬂ±®l7Ç>	àß\\ˇió;d˛	\–\"¥<•06ÅT˛¬ÜC=4äcgúqF7æÛù\ÔD¡å@4B	\"vräá`4µ\ﬁıÆw≈¢\«\'ø˛ıØc°\ËΩˆ\⁄+Mπö\◊7Å\‚Û\Œ;/l∏\·ÜQ¿^Ç‹§,\„\Ÿ[˝ıGà∑º\Â-q˜;Ö\‰iC\Ì\∆cl\Ó\À	\ \¬_ˇ˙WLyÜ≠e	BÚìüå\'êH=\ƒi$lbé¸\–mn\›8¬ñb˜\ÔΩ˜\ﬁ4G‹†ÜÈ¢í\0ô\Â˘>Ò\ƒ£\‘x*_#:‡ßî\n\·ÇZº[^Ûö\◊\ƒ`>b¢BQ≥\0A≠\ﬁ]k¨±F∏ò?)¨p˙;\Ôº3ú{\Óπ\·’Ø~uL\ÁC0ù\ÿB∏¢p5b~«ø¯°\'ãj¨\ÏHß∞ìö\'IH`ﬁ¨AlcÒ{\÷~dùu{Ü\“#˚_ˇı_qÆ¨mN\‹z\Î≠1àüÑì,˛d\rµ[œ¨±\‰¯ $\Ï∏„éë\Õ~˚\Ìv\ﬁy\Á∂k˛\Á?ˇy\Ïõ\Zî\ÊµA_<ª<Wà´¨≤Júx>\À\ZÖ%\ÿ5¶\‰¸\Z+¥;àBÒ⁄π$ 	d †\0°\0ëaôÙ\ﬂD¢v\ﬁ)Å™∞u\’<¢=ePÄ\»_ÄhW:´\0ëvn®mum≤\…&K\‰Ø\œ†,kMu\Á\Â[O+ºl«∞\’˛á∑lz\√\Á>VôW¯z˝\'pH\0∂U\r¯|%OÅ`¡úÑ`˝XsÛ7Ø©$å1f\nú≥~˛¸˘£Ç\ﬁ\Ì	JsöÅù\ÓM	D≥Àû!É@,\"A \ƒrmZ•1j∂Ö9\ÔΩ˜\ﬁ±Ø˘\"ê\nØÙ\–Ù\—G\„Nxj>x\'8\ÕNs.˙&»çëNêŒà\¬’§~\"Hœï\Í :∞Éù˚ª\Õ-ı\ﬂ¯Nh\Ê?¯∞\√=’§`^úÜ@\ƒyˆ≥üΩÑ\0\”<gÑÜè~Ù£\—˛t™§±M3?\ﬁE\Ïí\ÁL\‚¿	\nv\‘7à4õF\ËB® `\ŒXõn∫i\\ci}r˙d˜\›wû0o\‹Yü\⁄\¬±Ä\‚\÷\›\Ïhµ˛	ö#4à\ﬂz\Î≠\„˙\„îN™IAj\"˝TàO›û!å\∆\Áà\0¯<≠\’,k±ŸüΩÆ\Á\‘\«sûÛú(\“¿µ\’;Ω\’<Zµ\„$\n\'\‡\¬\\äXO§\ÊJsKé∫˚\Óª\„ºÒ\”fõmV\ÀWÆD-›¶\—êÄ\∆àB¥D°x\Ì\\•PÄ(∑ÉUàÄ\ƒhg\‰q\"/Ç\0+Å∫,óDJıl\”)xz\◊]w\≈\›⁄§	bW3A\Ï.∏ \ÓF\ﬂnª\Ì\∆4\·n;\È[≠ª$pJ`\›u◊ç©zxÆRpΩ]ù~N˙!N \\u\’U1ûÇ\È\Õ\„pÒÉùÙ©8rÛd\€’Ähn\◊jç\Ó∆ö?˙—è\"W\ﬂ&L\»4∑né>ˆ±èEF\œ}\Ós[˙¨\€Û›≠ˆD\„˝¸˝\¬)Ç›çbE\÷\Z\Õ∂Zü\ÕA˘î.\nëÄ\›ˆ∞\„\ƒÛ\ÓfG7b\Í‘©Q\Ã@\·¥B´+ã\0¡ö ≤Vª˘3Õµóı‹ä\◊XNj dp\"	ëâ\”º#8˝–òûVYÿå\ÈER\¬\Õ\n%@v	H@\ËH@B¢\–GD¢Pºv.ÅR	(@îä\€¡*D@¢\\ÇS\rÕπ∂	ë¶Ñ]\Ÿ¸7\ÈH˚Bä`]∑´[Ä≤\€˝e˛\ﬁΩ\—n dG>AxR\"•@2ÅGDà{\Óπg\ÃÇ≥Z[≠ª¥û±çµ\Àiá\∆]ı\Õ¡ÚTGÅÄ49˜I\◊C∞¥±FDÛ8\ÀI5Eøû[]y\Ï\‡\ﬂv\€mG∫Oıæˇ˝\Ô\«\›\Ê∆ç\›8\"@êâìçc5Œ©\€ÛùN@êÚ*\Ì†ow??\'`O˝ã¢ëiÖVà\Ê$ﬂ≥.HmE ©nvd \Ëø]Q\Ï,AˆVL?\' H©E\n®^\÷s\ﬁ,®Az-ò<ı\‘S1mVJi÷∏6`\√	Ñ\nO@Ùˆn∂µ$ 	H PÄPÄ(ÙiPÄ(ØùK†T\n•\‚v∞\nPÄ\Ìå\"O@,%\'wÛNgÇô∂%O;\ÈKHøB™“ütª∫(ª\›_\Ê\Ô z£\›.x\⁄*m=H•v¿Xã ≤¶®Kˇ\ÿ;h)™¨mA≈ú0!åbVPY\–1\Á3@QàÇTÃä*¢Ç åÉbqå\»\ràÇ¸\Î=˛\ÁN›¶CUwWuU\◊Skπ\‘\€U\'<˚Tw\’~\œ\ﬁ\€9ês9IU†\◊\€\◊|`\”\ÿ(gø\“-imKPp\Èy2\«=i\“$+æ)jCbÇßØã≤Xcç5lÌÇØSßéu∫*•\—~˚Ìóµu6Ú˘¢8îÆF}\'*Mëj%(\ Dπˆ\ÕÕ•\“\…\«Qü)eîjæ\»Y¨\⁄.∫N\— óv\€m∑Ç)ò4Øl5 \‹|Ωs\\yÂï≠†\‘;ﬁ¥SZ7JOı\Ã3œòm∂\Ÿ\∆^ö≠u&\√\\\ÎSsëMUWa˚\Ì∑∑óπÙ[ä\"ë\”\€\œ8\\˚}˚ˆ≠h2S0i\r\».\ﬂ\‰tWÇ÷ëÍÅ®@∫cú+çô∆¶µ£z!˙\ﬁ-îÇ)ü=5ﬁ†\Î9\¬EA¸\Á?ˇ±QBJÛ\Â\Ï\‡µ!5 Ç}s6 \0@ àP\ÔàPÒ\“8\"%Ä\0)n:ãÅôÛò	SfôÉö5â—®rEé\Ìö\Ì⁄µk(\„\rSÄ¯\Óª\Ô¨s¨eÀñ∂ÿÆR\Ê\»˘#\'ô\n\Œ*æ \‰‹î\√\Ëõoæ±ÛUûsEF(ª\“iúq\∆µ\Êè\0\ ràE£⁄π¨t\\r0ˇ\„ˇ®U\€Aª\Êï{ˇû{\Ó±Eyµéî\÷FiÉî>[\ÌJó\√VÖµ\ÎYª\Ê≥\Ã‘ß\÷\ÁV[meã2\À¡+«µ÷ü\"Ùˇ∫gÙoV‘ÅÚ´æÉ\n)ª¢ΩJY§ÙªÏ≤ãQ™›ørå\ 	≠®\Â\ÈW°jΩº©É\⁄\–nl\Õ[iúÙô\“I§\”=£∫Y$tx\Õ\€8ñ0\"\Á≥\Ó9\›o(2\Ìó¿ \—¬ªS\ﬂπV±m77LV\Ì9ß\≈VQ\Zgæπióˇ\À/øúó£úöó\⁄vGì&M\Ï¸eñ3\ﬂ;\’apµ\‹5G4\ŸÀõf\«\Ÿ@<ú\‡0a\¬+ûàø\Ï§u\"æ\∆+¡S5EÙ=•Ç\“Já•6eálá[ü\Z´7ÇCë0äR\—uZ+™e°∂dW\€\¬\œ8î∫KvT±q\Ÿ\€\ŸJLö5kf◊Å\n-´Øq\„\∆\Ÿ!\ÍªUEÆªu\ÎføSù`•\"\ÍMõ65ø¸Úã˘Ò\«mã\Ê-HE\ ’æ÷•\⁄\ÕAkUµ$\\¥H°˚B<\‚ök=+\‚CÇúRıIQ¡vW\‡]c\◊}¢Òg≥π∆¶±zΩ|k\√ÒU!nÕ≥^ΩzÀôPÛ—Ω]™`Y\…/KR0Uí>}C\0ÄÄ @ @Ñz\' @Ñäó\∆!)àHq\”ä&êdBì˛Ë£èLØ^Ω\Ãoºa\÷[o=ª+\\N0W\0\‘	:WÖTµ\”˙ëG±é5ù/\Ág«ék\n\„:êE/©X_(ªJ`pár\‹{\”\Ã»π¸\‹s\œYß•÷àú¥r≤ π¨\‚\À\Ÿ9\Œ\Âû:uj^Báï3^J9U\Â\Ã\’:U\Œ~9{4h`w\ÊK$\”\Œj\'f®≠c\Á\ÏîsUN|\’vê\ÿ!G\ËkØΩf\”r,Àë.á™ú\Á˚Ï≥èG$aCª\ﬁ†]\Â\Ë\‰XWëm	ã-≤\Áh\Ó˜\‰î\ÔﬁΩª≠5°T3rLª#[\·v∑\Î\\\Áπ{KBÄ´)ë\…V˜ûD	=N\Ã(47â~8j,¥∂Uõrkr∞\Î\»6ˇL€™à≤Ñ\ŸV≈Üux\Á®ˇoﬂæΩe¶˘˛Ûüˇ¥kK+˙NQ‘àX®_	0ô5DT\‘9≥¿µãDP\€rÿ´=E∏CkLkD\…\ÂTó§\ZJ/ßC˝\‰\«\Óª\Ôn£O¥TDál¨µ\'qDkM\„\‘Z\◊w´\∆8d\»{Hê∞•h\ŸRlıè\Ê†˘ÍæëÄ¥Û\Œ;[Ovw∂\“Z\’Zî¯†\Ô`oö®Bˆ\‘\ZœµûUØEQmnm\ Z„™ó¢Ù|^I ÒÆ˘Ÿ≥g\€\¬\€Óêê£˚,\ﬂ⁄ê®\"náv\ÿr≈ß’é\ƒHÒ\ÿ|Û\Õm_I= íj9\∆\r@†z @ @Ñ∫ö B\≈K\„àî\0D§∏\ÈE®¥\0QÙ¿Cæ\"d¿4üï@í\÷]µõP\Œ|\Ì∫óÄ!![ÙKµ3(f~7ôìYúYm*\Ó]LQ^#Q*WÒiçCµb$\ËHÃë»í\‘\"©ñc\‹Ä\0™á\0D®´\"Tº4ÅH	Lú:\€ˆ◊¢—ÜëˆKg®4R0’∂Ävø˝ˆ\€v◊Æäâ™x™v\–\∆Ò–Æ^9ïFFª¬ï˛&W\÷8çü\Zq≤FicAÄ(ç_πØV‘îv¥+Ç\"3Ç°\‹}UC{ä*PpE\"dlí,@\ËwA58í-∫AøäFRÙí\÷Kíà$[è±C\0®°ÆdàPÒ\“8 \0D@Ä\"\‘\ÀJ\‚ó\Ê\"S\Ó\¬gU_ô\Èy7\—ÅπW?Aª®].˚êª§yfÕöe∫t\Èb\”\Âr¨˚h¶\ÍOQ\Í)\’\⁄£\\\È\ TSE)Ú†\‘`πŒã,\’sPçó\ K\ÈûT\√{H®R‘É\"\n\œ9\ÁúD\Ã+cà8≠@\∆@ ù  B]˘°\‚•q@\0àÄ\0Dê\È¢à\‰/à\\µ\\˝Ñ\‰\œ0\Ÿ3Pùé>\ÂîS≤¶Jˆ\Ï¢Ω\"\ Tc¡\’fHä¿´∫äxP\›E8d+Æ\¬\Ëk¨±Ü-òY\r©∫ ¢π\'\ËÄ\0r@Ä@Äı˛@Ä/çC R§`ä7ù≈à\0Dååëí° @§\ƒ\–LÄ@ \"ÄLÄ\0 êó\0D®∑D®xië†u§∏\È,F bdåî\"%ÜföÄ\0\" Ä\0d∫Ä\0 \0àk@ø\«+cñ-[∂,1À•\“ ë_P~Iq\‚O\0\"˛6bÑ\·@Äá+≠\Ê&Ä\0¡\ÍÄ\0 \0År@Ä(I⁄Å\0 \0Åb	T⁄è]™∫\‘\Î\≈\r¢\ÿ\’\„\„∫r\»G7úD@\0\"\»tK±4KU\n¢™\Õ\À\‰ \0DJ\0\"R\‹t@\0Y @ @Ñzc @Ñäó\∆!)àHq\”Yå @\ƒ\»)\nDJ\Õ4!\0D@\0\"\»t@\0y	 @ @Ñzã @Ñäó\∆!)àHq\”YåÃú∑¿Lò2\À‘¨IåFï{(ı\Î\◊7W\\qÖ\È⁄µk\"\∆\À ó\'Ä\0¡™Ä\0 \0År@Ä(I⁄Å\0 \0Åb	 @ @ªv|]á\0\·\'A  a&	É\0ë¸EÄ\0ë|2@\0q!Ä\0K0é$Pç\ÿ#Fò_˝\’r\»!f\Í‘©¶c«é¶s\Á\Œ\Êˇ¯\«rS\—˘S¶L1è>˙®©[∑ÆπÚ\ ++2›∏å£\"ì˜\Ÿ\ÈΩ˜\ﬁk\ﬁˇ}”Ø_?≥\÷Zk˘º™ˆis\ÊÃ±∂>˘\‰ì\Õz\Î≠WTiª\"\‘5è\0*^\Zá@§ \"\≈Mg(ö\0D\—\Ëbs!DlL¡@ \0$û\0D0.]∫\‘|Ò\≈\Ê˘\Áü7?˝Ùì\È’´óYu\’Uk5ÚÛ\œ?õ\€oø\›\‹w\ﬂ}fÉ\r60\ÁùwûuNgû¨\Á\Í8[¸\ﬁ}˜]#\'\Ô\€oøm/^lˆ\ﬁ{osˆ\Ÿg9 \Î’´˚â˛˘\Áü\ÊëG1ˇ˝\ÔmDÒÍ´Ø^PÄêC˙¸Û\œ7Øæ˙™πÙ\“K\Ìu_|±0`@≠˘ÆπÊö¶u\Î\÷\Ê\Ã3\œ4tP\Ÿydé\„Í´Øé=\Ô®XBBœ∞a\√\Ã\„è?nnπ\Â”∞a√®ßë∏˛  B]¥°\‚•qDJ`\‚\‘Ÿ∂øç6å¥_:É@•	êÇ©\“H_ˇ\È≥93Ü\0 Prz π6h\– s\Ï±\«\⁄& Çë\’\Œh•≤¸ˆ\€o\Õ˛˚\Ôo\ÓºÛ\ŒZ\¬¬ÇL∑n\›LÛ\Ê\Õ\ÕI\'ùdfÕöew\≈\Ôæ˚\Ó¶Kó.f\≈W\÷aL\œ˛\‡Éåú¨ªÓ∫´\ÔŒü?\ﬂ\Ó¸ó\„˛\⁄kØ5Mõ65$>¸Cs\’UWô-∂\ÿ\¬\\˝ı±\ﬂ1˛\“K/ô\œ>˚\Ã\\v\ŸeÅ\Ï˘˚\Ôø[\—A\Œh\Á¯ˇÚ\À/\Ì.yâTßúräô7oû8p†π\Ó∫\Î,´0\÷L∂q¯6bû-Zdlé9\Êòƒàm~◊±\ﬂÛ2ÒHl{\‚â\'L\ÔﬁΩãé¶(ámí\–D®\Î\"Tº4@\0†uê\È¢ \0C@ªı]\ÍóM6\Ÿ\ƒ:\œ%DtˇpA\Œ\Êz5_\›:ö9jê£|⁄¥i\À	\⁄’Ø\‘+˝˚˜7\⁄ÕÆC\Œ\À3\Œ8\√\ÓÜ\ﬁq\«èr…í%\Ê\÷[o5{Óπß›≠\Ô\ÁP\‘@è=Ã§Iì\Ã<`6\ﬁx\„Zó}˜\›wV∞\Ÿm∑\›Ãç7\ﬁXˆùˇ~\∆\Ë\Á\Ÿ\\Bû\Ó•\Õ6\€\Ã\œ%5\Áds¸+ä\Ê\ƒO¥\"Ñ˛≠c\Ó‹π6Z\‚\”O?5O?˝¥\Ÿz\Î≠ıS\Ë\‰∞E=¯\‡É¶gœûâ ¸Æcø\Áe\„Æ\ÔN}\œ\Íª@Q-ÚÅrd\'Ä\0Å\0ÍΩÅ\0*^\Zá\0 \0Å @D\0ô.j@Ä`A@\0Ä@±îè\\iXºGáß\ﬂ7m\’,kì\ŸI\Á ≤˝]e9˜\Ÿgõj(\Èávuüz\Í©vg∑_B\"\ÃaáfEàlú£V;\≈_|ÒE”≤e\ÀXbíÉ˝ÎØø∂ë\Z™\Â\‰+@®Mµ\Õ5◊ò˜\ﬁ{\œ7cøc	CÄP\‰è\"B\‰¨œå\nÚ;Æ®\œÛªé˝ûók¸¸±]˜˜\‹sèi–†A\‘\”LL°.VàPÒ\“8\"%@\n¶Hq\”Yå @\ƒ\»)äWÄ¯ÖA\À\Õ˙ã∑_2ø˚∑i◊Æ]Jà0M\‘& \Á\Í∫\ÎÆ[Kπ\œ+\ÿ!\'@ >ˇ¸sÛØ˝´\÷HV\\y≥—∂;ò˝ª˜YNà@Ä\»n¥ Ñá\ÔG}dS\‹|Û\ÕYãªQ®ÿ±˙V\r\n\Ì™VJü≥\Œ:\ÀLú8—¥i”¶f∞r\\ª®˝Q)}\\\⁄µ°\Zè=ˆòmC)•:t\Ë`∆çW”Üs|KdPdÇ˝m\·¬Övwævªª√ùõkl™}q\”M7\Ÿ\ﬁ|ÛM\Âê\Ì5jî\ŸkØΩltÅ¢+\‹|rç≈âπ˙U=	\ÕIµ84?•M\Í”ßèç˙è\ÃÒè3¶¶OE´∏àwûRHi\Óx`M\n3}¶4RÆüs\Œ9«¶\€\“\·\nU+›î˙V‘à\Œk‘®Qç-≤E@∏ıÚ\Œ;\Ôò\Áû{Œ¶lzÍ©ßlkEJ(äi\”M7µ\Ìié:O\ÎF\—7Jâu\—Eô£é:™&=TæqxkQHíx\€oøŸπ´ÜÅ˚õl®(ñó_~\Ÿ\‹u\◊]fÙ\Ë\—\Ê\√∑ı\r\‰TW]qvá˜∫L[ã£Kßı$[®àl>{ˆl_v\◊X\ƒFcS\Õ˚Ú\À/7áz®\Â\Ó\Ï°{C©°dÉ\Ôøˇ\ﬁ2;˙\Ë£-≥l\Îxõm∂©a≠qç;vπÛ$Y?z÷ê\›.ºB≥\Ôæ˚\∆\‡W ûC@Ä@Äue\"@Ñäó\∆!)äPGäõ\ŒbD\0\"F\∆H\…Pºƒàæ◊òÖsk\Ôdùˆ\ÈxÛ\€Ùo\Ì.\“H@çUVY•\‡\‘\À}^¡91  \Áür{èU\÷\\«¨Pßé9\„\…1f\ÌM\Z\◊˙\"ª\—r	r\‡2\ƒ<˘\‰ì\Êˇ˛\Ôˇ\Ï\≈r\Ë\ ˘ÿ∏q\„\Z\«sf´~	\n/ºÇç¶êp†ˇ\Ô‘©ìu\⁄_r\…%Fı‘è¢\\˙ˆ\Ìkw£\À¡,aCõTBNlù#\·B˛#F\ÿˆ‰òóÛVı\‰†Ë°ájv\ﬁ\Î]\ÔÑ\0â:\Á\Óª\ÔÆ9\'\ﬂ\ÿ\Œ=˜\\;\’\œ»óR»µ+aAâƒ≤Bc\…◊Ø\⁄*˛˝\…\'üò˚\Ôø\ﬂF†(\¬Bµ;‰ãí∫_ø~\Ê\‡É∂\Êpª˜ï&KÖ±3\”\Â|ı\’W\Ê∏„é≥¨ºë≤ù\›\„«èØ±†ZJ7•Ûe{9Ùµ^úù\‰µ´®˝.I¸P\Ìµ©ÛîíJë\Ì€∑∑cñ≥˛\·á∂\Ì:\‘\n7\‹pÉ-x˛˙\ÎØ\€5!˚™ˆà\ÊPhr\ÊK\‘P§éã^\–˜ÑÑåïVZ\…˛Mø©≤∑ú¯¨¥ñ¥\Êtç\niKÙ\œuOx\◊˙?¸`«•ı$aK\‚ç\'\Õ√≠\r?kP\ÁÀñ\‚†t^w\‹qá-≠˚NgÒV?Jó%[(=ö\Œ˘\€\ﬂ˛fE4\Ô:˛\„è?¨∞ qD\"Öcëyû\∆,\Œ~◊èî‘ß\ÿqd\'Ä\0Å\0ÍΩÅ\0*^\Zá@§ \"\≈Mg1\"Ä\0#c§d(§`Jâ°ô& \0Å\»™\„:\‹˚¯!7<`öx|\÷\ﬁ Ç	J∑\"g≤ú\Ã›ªwØŸ°.g≠ú°Æ¯w1¶ïCT\Ìd⁄ëØh9Å\Â¥?˝Ù\”m\›\0˝øv¢oª\Ì∂ˆó\ÊHÇàŒ≤øR\Á\»\È∫\›v\€Yx6q¡E\‰ ÚçM\Œ\’+@(BB\Ì\…Ÿù)tdé•\Ì®W⁄µ~\ƒG‘†ìÿ†1\È^PΩé\’W_\›\◊ãá˛?ÛP\‰\–\\`ùﬁôu2π©_9¡%H\Ã\–\·\"(∂\‹r\À\Â9Ù˝ıW£t?j[¢çÑ!79˜Âòó\·\"¸fÃòa\≈%•>r;\Î]Ωâäö\–ı~∆ë)8ßπ\∆-\∆3gŒ¥së0\‰\ÊÆ\Ë\0E H\ƒ\Ÿh£ç|	\Zø÷ëcÆˆeS9Ûù\0\·g\rJÄê\'°MsÙ€Ü∏>Û\Ã3Fë\Ÿ˙\—x2Yd;/\»˙\—}ßµ¶\„äTYyÂïãπ˝´˛\ZàP9D®xië@Äà7ù≈à\0Dååëí° @§\ƒ\–LÄ@ô	\»)©<¸zó\√SÖëµ{ô\"\‘¡A\Á\⁄\Ì-g\„?ˇ˘OõFiwé<ÚH”∂m[3p\‡@U¥p±ôv\∆kW|´V≠ñK\rî9zó≥^BÑÑ\ŸZás*7o\ﬁ<g-\n?\Œ\ﬂ\Ãs¸å\ÕOM	˚\Ì∑ü\›%Æ\nçeßùv*\»$óìY<$iwº\Ï	ús\ﬂ+Tx\Ÿf:πΩüeˆ£πH¨P\n+\Á∞R\"”¶\Ÿ\÷[¶\„Æq©¨\‰\ËWù\n?\„($@(\≈\◊UW]e\Á£ˆŸéBnù(b¡EÄ+@\Ë:\›käËë††®ë:u\Í1J ÇÆüBlÇU\ﬂ°ÆjàPÒ\“8\"%Ä\0)n:ãà#%CAÄHâ°ô& \0Å2Pût•â—éhóØ]\Ô\‰¡A˚u(*Ωç\"6\‹p√öî8¡{˚üx∞ˆ\⁄k€î<NT\»lKN\Ÿ¡É\€\›\·rDÀπ~¸Ò\«[\—)sWªÚ˙gÖú˛J=îyék7\ﬂÿî&H5îã_\ÈÅ2\”i\0ÙôRXI(4ñ-Z\ÿÛÛıõOÄp∂ô>}∫M§˙\0J;§T9\ŸE@hßæ\" ¥É\ﬁ{dˆìM¨KÄê\‡§tS\ÓP\ﬂpÄ≠∑°ù˙\ﬁ\Ëùìm~•%\“\⁄Úˆ\ÂeP\Ëû\»U\≈oÙÇRÜπ(úü˛\Ÿ\⁄k⁄¥iVLSZ*≠Ö Q•\nA÷è\ÿ(5πø˝  ä˘mÙ}\rÑoTúÅ\ÿ@ÄàΩâ`Hf\Œ[`&Lôej\÷$§\ \€l˝˙ı\ÌÆ2\Â\‚\ÂH&àd⁄çQC\0à#à\‚¨R\»Ÿ™Vï+^˘\Êµ^\≈z≥•ı	“ª\ƒâJ\'$i≠µ÷≤ÖÅ\ÂósXéx9£µ[]Ng\ÌW:!•@Rùâ/\‰∏U*\Ì˛ó!«∞R8©PÆK{§\‘6\Œ\—\Ï7Sæ±I0ëÉ¯\ﬂˇ˛∑›≠Æ\"\ \ﬁC)~îrH\"\Zü\∆\Â\ƒ˘\∆Ràâ\⁄\ÕL\„\‰\Ì\◊EA(eñR\„(mñ¢≤πj@\Ë\‹Lg∂\⁄U!h9ú]DÖs¿+@¨t\Ôe+Bù≠\Ôl\ÎMªˇO8\·+÷®=7\Ó\·√á[Ü™w†ö~∆°ˆe{’ïXmµ’ñ´‹∫P]1\ﬂbã-\Ï¯UåZu\"î6´\–=!1DëJ\Â\'S.ª\Ô≤\À.5Nå+F\ƒ(UÄêù¸¨j@¯˚ñCÄ@Ä∑Rä<¢Hp\\Å@Äà°Q≤@ÄH˛≤@ÄHæ\rô \0Å∏@Än		r¯~˝ı◊∂0Ø\À\…\ÔZR1\€…ì\'[\'ˇ\Zk¨a≥*ù\Ôêc˛¥\”N≥ˇ¯\«?≤û™\"\”	∆ç`\›\0\0 \0IDATW\Îs\Â\·W~~•~z\„ç7l™úzı\Í\Ÿ]\·\Í[;·ïß\Áùw∂\„Rj&◊ÜäYK\Ë÷≠õM\Ì§]\⁄\ÍC\—2™- æú\“r:7k\÷Ã¶\ÏR\n9æ-–¥iSÛ\À/øòı\◊_?\Á\ÿ\\1d9\Ã]e9é¡†\„\”O?µÛñH\·\Í	\Ë\Ô~\∆R®_•¡\“X\ÂŒ∂s—¢E6MïÑ¢_|—¥l\Ÿ2ßô\\\r\’\‹»¨\Â\·\n\';¡¡µ´˚≤èú\Ê¢¥\Ë?ˇ˘èµµ\nG´ ºxK:\ÔºÛl\Z°\Ã√≠7g	:$(\r\Z4»ä[Zkäz3•ˇí(°\»≠EÕØ\–8^~˘es\”M7Y!j´≠∂≤E°’¶÷ãRµI8Pqfµ\Ìé&Mö•¡[E¯hç(\ÍF\ÁIê(°u•18ª\Í\ÔZZ\—$^(5ú÷©ã^(dwµ%qM\Ì™¯¥8Hd\”⁄î\'!Nü\…FZª\‚¢\√S\Áùwåú\›N¿ÒÆc\ŸIºtØπî\\\Ÿ\Œ\€}˜\›mõ~÷èõèäøªZ¡øu™ˇ\nàPW9D®xië@Äà7ùA†hE£ãÕÖ±1Å\0 êx¡L\ËvMOö4©\ÊBóFPé|9\‹\Â\0V¡[Eds*gˆ˙\—GŸÇ\¬r`\Á tç£r\\+MëÑ\09≠;v\ÏXπ†q)\¬@bÇ\∆\"«∂;\‹\ﬂ’ó\"#‘ÜÑ9\√UÄZQr\ÊJ∞∏Ù\“K\Ìeäh–†Å\È›ª∑4r6\Î9¶’øƒÉ\\cÛ¶zR\—k\’√êcXé]Ÿä.\Î\Ô~∆íØ_EÇ(mè\‚V\‰à\nÑg\‰lñPP(JE\ÁIxí\√\‹E∏ëL\Œ,\‰ƒóS\\\—*äJx\Ìµ\◊lä\'E¨(Ììú\Ê\Ó\ÿaájú\Óon˜ºŒìà•u%øû\Áu(\ÊπÁû≥có®§\œ%¥k◊Æf\›\Âá\ƒâJi$H\"Ä	\◊≠!¡@k@cë\Ìdwµ©®EµHò“°{£CáVêì0∞\Œ:\Î\ÿÙHäûê\"ˆ^õ™(≥Æ\ﬂ~˚\Ì\Ì\ÁNÄc˜	&\ÿ˚L≈æ5V\ÕW}\Ì±\«∂\Ê\ >˚\ÏSk\›\Î2\Ô	\ﬁu¨œµ\ÓùM⁄∑oo\Ô!	\Z\Ÿ÷ª\Î†\–˙QîÑ\À{\Óπ\«r\‰\»N\0\"\‘{\"Tº4ÅH	Lú:\€ˆ◊¢—ÜëˆKg®4R0U\⁄\È\Î\"}6g\∆Ä\0\¬\"Ä\0Y\⁄\ÕG@ª˘µ\”\\;¯\Âó£~É\r6®¥B≈ßΩÉR\Õ9\À%[Pº\"ì¨`ßJ%\'ºƒëlGæ\‚\ﬁ∂\ÔÆÛ≠â)/i§c\Ÿjü¯\Ó®\ ODÄ@Äuâ#@Ñäó\∆!\0@ °é\02]\‘\"Ä\0¡ÇÄ\0 \0År@Ä(I\⁄	J@ª˜UØ@ª\√u(\¬BªŒµ\”?*G≠v\Ák\ÁøRB˘›ùÆ:.mP°àâ†L™\Ì|9\‡\ﬂz\Î-õ™+\ﬂ$Ö\÷\œ\Áün£A˝íô™≠\⁄l]\Í|  J]CyØGÄ/çC\0Ä@ \"ÄL¨@\0Ö\0D(Xi4\0	J§∫\ ”ØTJ\Ì÷°\‘?™?†î?⁄ô~\ﬂ}˜\Ÿz	~E9’üz\Í)3v\ÏXõ ™P}è∞\Ê˜v\ÁŒùk^y\ÂõI≈´sØø˛∫Q}Ÿ£yÛ\ÊqüñÒ≥~¥Fî&J©\∆$∞mπÂñ±üW•à\0Å\0\Í\ZDÄ/çC R\√&|léh\€\⁄|˘ü/l>R§Ö\0DZ,üy[0@\0I\'Ä\0ët2˛†T\À@µ-T£gœû∂^ÜjI9\‰`ñXÚÎØøöC9$»•ú\Î!êYß\ƒ[O%Æ†¸¨û~Ù\—Gmz±4T]§ö\'òÚ°\ﬁÛ°\‚•qDJ`õ-\Õé∑;Ù0\∆Å¥@ÄHã•\„3Oà¯ÿÇë@\0H:à§[êÒC\0à\'\'@ht˙≠9Í®£r\n°ÆbàPÒ\“8\"#0}˙t”∞a√ö˛Túã(à\»\”QÖ	 @T\ÿ\0)\Ï\"ÖFg\ Ä\0B\"Ä\0XöÖ\0 êrNÄPƒê!r	°\ﬁ.°\‚•qDF@?#Gé¨\Èè(à\»\–\”Q @\ƒ¿)D\ \Œt!\0ÑH\0\"D∏4\r@ \≈2áBø;ôBD®∑\nD®xiëò1cF\÷hEE4h\– í1\–	*I\0¢íÙ\”\Ÿ7D:\ÌŒ¨!\0ÑA\0\"™¥	@\0πàlB\ƒ\ÏŸ≥ÕímZõ=\Œ\Óû\‹\ËΩL\›\…cBK˜]™∫\‘\Î5i+\Ãcñπêë$,°J+G~ï\√@~˚\‚<@ ô\—Æ¢ \¬\·M´Ò#0s\ﬁ3a\ ,sP≥&Ò\\ñ’Ø_\ﬂ\\q\≈¶k◊Æâ/É\\û\0´Ä\0\ E\0¢\\$iÄ\0º\n	^!B>˜ı7\ﬂ÷úı\‹àÚ\ﬂH\ÂgJãàí@Æ\Ë7¢ ¢¥}A¿ú\‚|Dú≠\√\ÿ \0$ãÄWÄxº\„˛\Ê˚	£ì5F@\0±%\‘\Ô\€`ª\Õ\ÈOåYn>D@\ƒ\‘\ƒD@\ƒ\‘0UF\‡¥\”N3è<Úà\rÛ\“4ıˇßûz™y¯·á´l\÷L\…&Ä\0ël˚iÙ…∑!3Ä\0 D@\ƒ\≈åÄ@u°ô\◊o≤\r§`\n\Á&™ÑÖ3\nZÖ\0J!0v\ÏX{˘≥\Á\ÿoΩ\·∫5Õµj’™î¶πâ @\n¶Dò©™â\0QU\Êd2Ä\0*J\0¢¢¯\ÈÄ@\’($@xãQSÇ\Z°\ﬁ°\‚•qDN@y\Âo∫\È¶\»˚•CTí\0E®+I?ù}#@§\”\Ó\Ã\ZÄ@ ¬†JõÄ\0 êKÄ\nO?˝¥U\ÈL>•˙ßKΩ^(B\‚=SÖ8<öÜ\0\‡ûå”´Ç\0DUò1Qì@ÄHîπ, \0ÅX@Äàµy \0Å\ƒ\» ≤	nr°.túï°\‚•qDJ`\‚\‘\Ÿfß\∆\’‘Çà¥s:É@	 @T~JªFÄH©\·ô6 \0Å @Ñ\0ï&!\0@¿8B(Ù[s\‘QGÒêâ\"\‘[\"Tº4ÅH	<0\ÊS\”ı\–v\ÊógG\⁄/ùA†\“ *mÅÙıè\0ë>õ3c@\0a@Äã,\ÌB\0H7\'@}Ù\—9ÖG\"‘ª\"Tº4ÅH	HÄ\–qfÎ¶ëˆKg®4àJ[ }˝#@§\œ\Ê\ÃÄ@X \¬\"KªÄ\0 \‡ó\0ÑﬂµR\‘yEa\„\"ƒí\0D,\Õ¬†\" Ä\0d∫®E\0Ç@\0\Â\"Ä\0Q.í¥@\0\≈@Ä@Ä(v\Ì¯∫\¬&NÇ@\"HÄ2†è˙\Ë˝â/ÉÑ@π @îã$\Ì¯%Ä\0\·ó\ÁA\0Ä@!ÖÒ9 \0ÑM\0\"\‘5Ü\0*^\Zá@§$@tl”å\"‘ëRß≥8ò9oÅô0eñ9®Yì8ß\‡\Í◊ØoÆ∏\‚\n”µk◊Ç\ÁrB<	 @\ƒ\”.å\nÄ@	 @$\—jåÄ@u@Ä@ÄuE#@Ñäó\∆!)àHq\”ä&Ä\0Q4∫\ÿ\\à\0S0@\0â\'Ä\0ëx2@\0â\'Ä\0Å\0\Í\"FÄ/çC R ∫\⁄\Œ¸Ú\„\ÏH˚•3@ à`º\‚x6D≠¬ò \0$ì\0D2\Ì∆®!\0TàP\◊3D®xiëò8ı/\·°E£\r#\Ìó\Œ Pi§`™¥\“\◊?D˙lŒå!\0ÑE\0\",≤¥@\0~	 @ @¯]+Eùá\0Q6.Ç\0 \0Å†uååëí° @§\ƒ\–LÄ@ \"ÄLÄ\0 êó\0D®∑D®xiëPa€õn∫)Ú~\Èï$Ä\0QI˙\È\Ï\"ùvg\÷Ä\0\¬ Ä\0U⁄Ñ\0 \0Å   Ç¨ó¿\Á\"@F\∆à-•`⁄©ÒFfŸ≤e±#É@ ¬†Jõ˘ @∞> \0@†\\ \ Eív \0@†X≈Æ_\◊!@¯\¬\ƒIH°\Óÿ¶D\"¨\≈ \ÀI\0¢ú4i\À?î8Ä\0¸@ÄCâs \0@ LaÆ/É\0*^\Zá@§$@t=¥ù˘\Â«øäQs@ - \“b\È¯\ÃSƒøø˛\Œ3 y∂B\Õ\ﬂZ∑¯ªy˝ı\◊\„3hF@\0±$Ä\0K≥0(@\0©\"Ä\0Å\0\ÍÇGÄ/çC R túŸ∫i§˝\“*M â\ƒ‹πs+çç˛\ÀH¿eæ[\·˙C[ß)@\0®fKñ,1+‘©ìsäÀñ.5u\Î÷≠f\Ã\rÄ\0*L`\È“•ç \◊\Ô\—ˇˇºNûﬂ´R¶†\ﬂ\¬R“âó√ø≠6Ù:∑¨îÅî°òk+≠˘s9\‰∑/ŒÉ\0\¬%Ä\0._Zè/Å§	\„«èè/LFVÅ\Á>¸“¨∂Úä\Ê\€oV\‘ı\\@\0\È%p\ËëG◊ö¸¢%KMΩ∫µâóû6ΩÄò9 \0ÑN\‡\‹s\œ5K6\›¡4?¸¥¨}}8\‰aS˜ªI\Ê\ﬁ{\Ô\rm,ª\Ï≤K\—mó√øç\0Q4˛\¬ñ\√@Ö{\·@ \n Ü\ËcÜ>z\›\—bC`\Êºf¬îY\Ê†fMb3&í.˜åöd÷¨∑í9y\◊\Ì\“5qf@\0e\'∞˚mOô^z|\Ÿ€•A@\0Ä@.I\ŸHük¸\Âo#@Ñxî\√@!è¶!\0Å\0(B\0ßB\0(#ÅÒSföïW¨kvh∏A[•)@\0H#à4Zù9C\0®,j@Ñ∫ B\≈K\„àî\0D§∏\ÈÄ\0 \0@\0e\'Ä\0Qv§4@\0 @ @Ñzì @Ñäó\∆!)ÅâSgõˆ;ˇ\›¸0kf§˝\“*MÄLï∂\0˝C\0Ä\0 P.\Â\"I;Ä\0 \‡ó\0ÑﬂµR\‘yEa\„\"@\0àÅ§°é:ÜR&§`*HöÅ\0 \0É\0¡\"Ä\0 \0Å®	 @ @Ñ∫\Ê B\≈K\„Ä\0 à \”E^°fÅ@\0Ä@π @îã$\Ì@\0ÄÄ_~\◊JQ\Á!@Öçã KJ¡\‘ˇñÕ†˛}b9>Å∞ @ÑEñv˝@ÄKäÛ \0@†àBÑ¯Ä\0\ M\0¢\‹k™V{°\‚•qDJÄ\"‘ë‚¶≥@Äàë1R:àî\ZûiC\0ÅÄû\È\œl\›4ÑñiÄ\0 êù\0D®˜D®xië@Äà7ù≈à\0Dååë“° @§\‘LÄ\0 \0@\0U@\0\"\‘eå\0*^\Zá@§$@t=¥ù˘\Â\«ŸëˆKg®4àJ[Ä˛ XÄ\0 \0@\0Ä@R	 @ @Ñ∫v B\≈K\„àîÄÑlGäù\Œb@\0\"FH˘ Ræ\0ò> \0Å2 Sa\“ \0¯\"Ä\0Å\0\·k°{D±\‰∏Ò#Ä\0?õ0¢hÃú∑¿Lò2\À‘¨I4\“2 @∞$ \0@†\\(B].í¥@\0~	 @ @¯]+Eùá\0Q6.Ç@,	HÄ2†è˙\Ë˝±ÉÇ\0 P≠\∆OôiV^±ÆŸ°\·\’:E\Ê@\0@Äà4\›@ Ü~˙\È\'Û\‘SOô)S¶òÎÆªŒ¨∫\Í™1%C™F°ÆkàPÒ\“8\"%@\ÍHq\” \0@\0Ä\0\ N\0¢\ÏHS\€\‡\œ?ˇl\Ó∏\„Û¯„èõ˘Û\Áõ#è<\“\\}ı’¶Q£FµòLù:\’Ù\Ë\—\√:\‘x\‡Å¶gœûÀùìZàN|…í%Vt\Ëﬂøø9˙\Ë£Õùwﬁâ\0!ˇ¥wÖ\0Å\0\Í=Ä\0*^\Zá@§&NùmvjºëY∂lY§˝\“*MÄLï∂\0˝C\0Ä\0 P,Ωì:xæ/Dà\œ3	¸˛˚\Ô\Ê\ﬁ{\Ô5|∞\Ÿbã-Ã∑\ﬂ~k:w\ÓlV\\qE3`¿\0≥\—F\ŸKfÕöe.ºBsÚ\…\'õ˝˜\ﬂﬂº˚\Óªf\‡¿Å¶Oü>5\ÁDMw—¢Ef\‡¡\ÊòcéI•˛˙\ÎØ7”¶M´%@|¡ˆ=\◊]wç\⁄Ùó°.uàPÒ\“8\"\'∞\…&õò\È”ßG\ﬁ/B†í(B]I˙Ù-§`b@\0Ä@±ÙN\ﬁ˝\√9/\Ô\’|u67\≈\◊}˛˘\Á¶^Ωz¶Iìˇ\’H˚\√Õ±\«kz˜\Óm9\‰K\Á¡4¸±πı\÷[\Ì˘⁄ÖØà˙ı\Î[¡¬è@Vn\Ã_|ÒÖó∆ë\∆DôÑl\"˚\ÏπÁû¶u\Î\÷\Â\∆M{∞  BΩ B\≈K\„Ä\0 à \”E^°fÅ@\0Ä@± ä%\«uA	®æ¿â\'ûhN?˝t+DÃù;◊úy\Êô\Ê∞\√≥w\«\À/øl{\Ï1Û¿òµ\◊^;h7%ùø`¡s\ŸeóY!$≠)à2E•úz\Í©\Êâ\'û@Ä(iuqq>°\ﬁ!°\‚•qDJ@)òt¥h¥a§˝\“*M\0¢\“†\÷\0 \0K\0¢Xr\\îÄ\"\Â\œ=˜\\”´W/≥˝ˆ€õØæ˙\ w\‹q6›íwg˝ò1c\Ã˘\Áüoû~˙i≥ı\÷[/\◊\Õ¸a£T;Bı\n\÷Zk≠\Â\ŒÒSVzß+Øº\“l∫\È¶v\'ˇJ+≠dû{\Ó9s\◊]wôq\„∆ô\√?\‹\\s\Õ56U‘•ó^j\ÓªÔæöˆ:t\Ë`ˇ[gü}∂%~˚\Ì7+ò6¨\÷\ﬂ\\Òfoó_~π2dà-\Í¨TSJK•ˆ8\‡\0s˚\Ì∑gM3µt\ÈR;.ùß˛?˚\Ï3\ÀHc\'\Õ[\"¡Û\œ?o\÷\\sMsÒ\≈õ≥\Œ:\ÀFkH@π\Ì∂\€l\Z´ã.∫\»4o\ﬁ‹¨∂\⁄jvm⁄¥±ˇ~\ÔΩ˜l;N:\È§Z\”ˇxà±c\«Z[(*\ƒ\Ó˙†ˆ\Á|\‰#Ä\0Å\0\ÍÇ\0*^\Zá@§TÑz»Ä>f\Ë£˜G\⁄/ùA†\“ *m˙GÄ`\r@\0Ä@± ä%\«uA	º˝ˆ\€÷±Æ’ÇêS[ëw\ﬂ}wYàÖZAA˚ˆ\Ì\€[˙\‚≈ã\Õ\√?l˘∂\€n;[\œ\‡\œ?ˇ¥E≤\Â∞W\‘≈ñ[nY\À/ßæŒëÄ°à\r°¢\⁄rKÃ∏È¶õ\Ï?ô˝\r\Z4\»\n˙˜\Œ;\Ôl\Œ9\Á[\Á\‚á~0ßùvö≠è!Ò Û?~º>˘\‰sˇ˝˜õ}ˆ\Ÿ«¶≠íh!\·\ÊÖ^∞ë#æ˚\Ó;”©S\'≥\◊^{ôK.πƒºÙ\“K6%≤˙“øï\∆J¢äóÎ°á™\·=b\ƒ”Æ]ª\ZQ\"SÄ\–¸s\Ÿ)®˝9˘◊Ä~èUïiYí\n/%E9BÄ\‡\’C@D\«6\Õ\»[=&e&>	 @¯\≈i°@Ä\r-\rC\0®zUo\‚XLpﬁºy\÷y/«∏+@]¨\0\·wB\⁄\…/ßªÑÅu\◊]\◊^¶HÑN8¡hg\Ê°\¬\”D≤a\Œ¸õäl;Ò¿â\Ÿ˙\À\Ê\–w\◊nºÒ∆¶GèY\Î\\86Ré8‚àö°™/	\rô«ÅhEM¸˙ÎØ¶{˜\Ófı\’W7√á∑ ≤ÒV¥â\"#ºQ\rôsEÄª\‚8ØIÒc\Áöc9¸\€•¨†◊ñ\√@!è¶!\0Å\0 ¿\‚‘™\"Ä\0QU\ÊL\‰d i6\r@  baÜ™Ñ\"¥ìøm€∂f\€m∑≠ôk>B\Èä$(-R±G6!\·˝˜ﬂ∑\Èõı†B\◊ŸéRài”¶-W;¬èxë9éll\Ÿ—•K”™U´Z53º\◊JPPz®UVY≈¶W:\ÂîSL\„∆ç\Ì)≈Æ$ÆãÇ\0)òB]g°\‚•qDJ@D\◊C€ô_~¸´\“B\0\"-ñé\Ô< \‚kF@ \Ó \‚n°dèOôDîÚHQ{\Óπg≠…∏\"\‘Guîç<páj?\ËöRãPg\‰†Wlı°˙Ÿé∏\n.rBÖπoºÒFõ\∆*€°¥L™o°à•iz\‰ëGlä&àd\ﬂK\’>zàP\◊8D®xiëê\0°\„\Ã\÷M#\Ìó\Œ Pi3\Á-0¶\Ã25kR\È°\–J	 @§\‘LÄ@ @î\"Md% ÒAò\◊[o=\Î\0\◊Z[¥hëyÒ\≈\Õnª\Ìfw\Ê˜\Ì\€\◊|Û\Õ7∂8tΩzıÃí%K\Ã\’W_m\’/\–5\≈ŸÑóÇiç5÷∞N¸-Zò:uÍòè?˛\ÿÃú9\”\Ï∑\ﬂ~9S0}ˇ˝˜∂ÜÑR\Z\ÂJ¡fÑ8(ì\“6)5ì\nO´\0∑\"LT\ﬂ\‚Ë£è6£Fç2Mõ65õm∂ô≠5°Ç\ﬂ\Z´Æ\”¯%ÙàπÉH¡T\Ï\Í\‚∫r@Ä@Ä(˜ö™\’D®xië@Äà7ùA\0®!0~\ L≥Úäu\Õ\r7Ä\n \0@ à@∏8\Ÿ\'Å•Kó\⁄J*ê¸Û\œ?◊∫\Í\Ï≥œÆIS4k\÷,£tKr¶K§x\„ç7\Ï\Œ}9˙]≠à\Ã.%RH<¯Í´ØLˇ˛˝≠>ÛPˇr\‘KTp¢Å\Œ—µw\‹qá-Ñ\Ì=T#Aiô6\›tS;69Ú\ÔΩ˜^#Ω\nGø˙Í´∂–¥∆∂\’V[ô°Cáö\€oø\›Lû<Ÿúq\∆∂Ø[nπeπ˛\\k	*∂≠\ËW¿Z˝+RAQ\nô«ßü~jkUh~\ﬁ»ë/ø¸“ú|Ú…∂ò∑˜P;lû|ÚIÛ\Óª\Ô\⁄4Sl∞Å≠	1{ˆl;>\’\·–µ*æ≠˘;6öo≥f\ÕÃÄ\Ã.ª\ÏbnOù:’éWµ3úh£¢\€7~˘\Â≥˚\Óª˚\\	ú  ¸≠î\"\œBÄ(óA Ü$@\–\«}Ù˛éé!A\0Ä\0 \0@\0ô XaxË°á¨∞ g{\Ê!ß∏Dw»©ﬁ≠[7Û\÷[o•cíÛºQ£F9áı\«\ÿs\‰$\œ&@∏\Ë9\‘}±˜\ﬁ{[1¡\’|P\∆O<aùˇJW$ÅAEõw\‹qG€ßRu\Ë\–¡:\ﬂ%Vlπ\ÂñVDπˆ\⁄km\Í&|\÷x\Â†W!\È\„è?ﬁäô˝)RBÖ™ıw\Ì€∑∑\—\nÜ\rVÛ7ç\≈[è\¬E%\Ë\’\ÃP¥\√q\«Wã\◊\r7\‹`£K6\Ÿds\ﬁyÁôé;öUW]’º˘Êõ∂-çMbé\“M©nÑ8(\"Eü_zÈ•∂-ÕπAÉ¶w\Ô\ﬁF\‚BÀñ-\Ìg\ﬁÒjlM$R\ËEß®Ø\\\Èü\¬XK¥ô°ÆtàPÒ\“8\"%0q\Íl≥S\„ç\ÏÉ\r\“DÄLi≤6sÖ\0 \0Tà\Í≤\'≥Å\0 êD°Æ[àPÒ\“8\"\'¿=9r:åäP\«¿))òRæ\0ò> \0Å @î\0èK!\0@†,   ≤êr5Ç≥2Tº4Å\»	(t˙Ù\Èë˜Ká®$àJ“ßo†5\Î\0Ä\0ä%Pä\01c\∆õ¬ÖÄ\0 P\nàR\÷O¡k \n\"\‚$ÜÄR0\Èh\—h\√ƒåôÅB† \ Aë6J!Ä\0Q\n=ÆÖ\0 ên\≈T wÙ\Ë—∂Xo´V≠\“\rë\ŸC\0Ä@I  JZ@Ö.FÄ(Dà\œ!ê*B≠\„\Ã\÷Mì3hF\nÅ2@Ä(Dö(â\0DI¯∏Ä@™	 ú0r\‰\»\Zf*òã\0ë\Í%\ƒ\‰!\0îL\0¢\‰EîØàPÒ\“8\"% b»Ä>f\Ë£˜G\⁄/ùA†\“ *m˙GÄ`\r@\0Ä@±¸J±™àØ†˛t\Ì{ÔΩá\0Q,|ÆÉ\0 \0K\0\"\‘[\"Tº4ÅH	HÄ\Ëÿ¶ôY∂lY§˝\“*M\0¢\“†\÷\0 \0K ü\0Ò«Ç˘¶wõçs6ç\0Q,uÆÉ\0 \0/àP\ÔàPÒ\“8\"%Ä\0)n:ãà#•CAÄH©\·ô6 \0Å2\»&@Hx˜x?Û\œAΩÕü,BÄ(göÄ\0 \0Å\‹  BΩ? B\≈K\„àîÄàÆá∂3ø¸¯W1j§Ö¿\ÃyÃÑ)≥\ÃAÕö§e\ \Ã3f bfÜ@ AºÑWxX°n]≥¯˜\ﬂÚŒÑàö°B\0à1àPó\'D®xië†u§∏\ÈÄ@\rÅÒSföïW¨kvh∏T \0@\0ÅxàGNmgf¸˚_f\ÈüjC\'∑i\”∆å=\⁄^\'Gí´—∂m[3b\ƒ˛ªXpá¯û\\˛wa\ÌM\ZõÛá~ûı˜gÙÄ^¶\Ó\‰15ø\'Å§Bæ†˛mµ±Ç1Jkûúº\ÊIQé\ a†ê\◊\ÕC\0>	 @¯\≈iÄ\0 \0@\0à	\" bbÜ@ \≈í\‚\«\Œe¢r¯∑ Bº\ a†áG\”Ä@\0ß\Œ6˝oπ\—\Í\ﬂ\'¿Uú\nÅ\‰ SÚm\» \0@\0i%@\rà¥ZûyC\0àR0Ö∫\Z B\≈K\„àú\0˜t\‰\»\È0(B#§|§`J˘`˙Ä\0J êMÄpÕ©&D\Ô6\Álù\Z%Ä\ÁR@\0®!Ä\0Å\0\ÍÌÄ≥2Tº4Å\»	pOGéúc@\0\"FH˘(BùÚ¿Ù!\0î¯\‘\ÊC\0\0 \0IDAT@ ü\0°f{5_\›Lü>›úp\¬	5u\\w%Ä\ÁR@\0@Ä¨R0ÖxC\‡¨.MC bJ¡\‘~ÁøõfÕå∏g∫É@e	 @Tñ?ΩÉ\0¡*Ä\0 \0Åb	¯ \\=\Ã3f,\'Då3∆¥j’™\ÿ\ÓπÄ\0 `àÄ \"\‘\€\0\"Tº4ÅH	PÑ:R\‹t#12FJáÇ\0ëR\√3m@\0e DÄp\›9!bÙ\Ë\—f‘®Qe∞M@\0H3àP\◊?D®xië@Äà7ù≈à\0Dååë“° @§\‘LÄ@#@xÖà\r\Zîa4@\0i&Ä\0Å\0\Í˙GÄ/çC R Ü\ËcÜ>z§˝\“*M\0¢\“†\÷\0 \0K†¢\ÿ>πÄ\0 \‡%Ä\0Å\0\ÍÅ\0*^\Zá@§$@tl\”Ã∏±ëvNg® à\n¬ßkK\0ÇÖ\0@\0\≈@Ä(ñ\◊A\0Ä@π @ @îk-em\"Tº4ÅH	 @Däõ\ŒbD`\Êºf¬îY\Ê†fMb4*Üí&i≤6sÖ\0 P^\Â\ÂIkÄ\0 ú\0DU\‡\nà\0∞81\' ¢\Î°\Ì\Ã/?Œé˘H \0Å\Í\"0~\ L≥Úäu\Õ\r7®Æâ1@\0ù\0D\Ëà\È\0Ä\0\n@Ä@Äı&AÄ/çC R°é7ùA\0Ä\0 \0@†d%#§@\0(ë\0DâK(ˇ\Â°\‚•qDB@?:\Ê/ZlˇΩfΩïñ\ÎwƒàëåÖN P	§`™u˙Ñ\0 \0@† \ Aë6 \0@†•¨üÇ\◊\"@D\ƒ	à=\›\«{ús•\Áwå0õ∂¸Kêp\«\Ë˚n§0u\Ï≠\»\0K!@\ÍR\Ëqm9êÇ©iÄ@:	 @§\”\Ó\Ã\ZÄ@ú @ @Ñ∫ B\≈K\„àÑÄ˜••WÛ\’M˜\‘\ÍW[∂lY$c°TÇ\0D%®”ßó\0E®YÄ\0 P,àb\…q \0îã\0Dπ\÷R\÷v B\≈K\„àÑ\0D$ò\È$\∆ blúî\r\"%ÜföÄ\0B Ä\0TöÑ\0 \0Å@  -ò†\'#@%\∆˘à\ÔKK\ﬂ}77ùá]kêD@\ƒ\œfå®º \ Àì÷Ç@ÄŒå+ \0@\‡/¨@\0®4àP\◊`‚Æª\Ó2}˙Ù	u<ij|\”M7M\”tôkàFéi\Z\ÔºG\Œæü0⁄¥m\€6\ƒ\–4*K\‡\◊EãÕ¥_Êõ≠7ZØ≤°˜T¯Ë£è\Ã¸øôV∞n§¨\÷XmU≥\„é;¶íìÜ\0 \0Å¸™ıY~ƒàòÄ\0B\0\"‘•\ZDÄ∏\‡ÇÃΩ˜\ﬁk\Z7n\Íò\“\–¯ú9sL˝˙ıaôcG0\«j}iâ\0]T	à*1dBß!b\Ÿjkôzk¨ùuã~ùkV¯mDB\ÌÀ∞!\0ÑM†\Zü\Â5\'j–ÖΩrhÄ@˘ @ @îo5ei)®\01`¿\0≥xÒ\‚P«îÜ∆Ø∏\‚\n≥ˆ\⁄kõ\À/ø<\r\”eé!Ümè\Ï\◊√¥\Ì‘≥Vè§`\n\Ÿ\04_q§`™∏	R=Ä§?¨ß\⁄xLÄ@Tc\n¶ ~ÜòÄ!@\0H=Å§ø”î\„wGm(û}YíÙ§.àÅÅ\0Qû\Ô$àÚp§ïøPÑöïêv3\Á-0¶\Ã25kívÃøíÚ\ÃW4t	@\0> @¯Ä\ƒ)Ä\0 *Å§ø\”Òo\Áâ\0\‚b†bà1c∆ò6m⁄ò˜\ﬁ{œ¥n\›:\ÁL~ˇ˝wsÒ\≈õÜ\rö´Øæ∫\Ê<]ˇ\ÿcèô;\Ôº”º\¬\Êõoæ©ıyXhæ¯\‚s\Ìµ◊ö˛˝˚õ¸±Êøï6©D9(“Ü#Ä\0¡ZÄ\0 P9IXØ9zÜ\0 \0@Ä`@\0Ä@•	$˝ù&à¢´-àÅ\¬ ú\– 7\ﬁx£≠è†#DπDØy *∞ÿ´∏K\ÔKK\ﬂ}77ùá]k∂§`™b\„35@†\‚í˛∞^qÄ\0Ä@\ 	 @§|0}@\01 êÙwö ˛mà\n,∏ Ú\n?˝Ùì9Ò\ƒÕ∞a\√\Ï®¸q˚ˇ:ûx\‚	s\“I\'\Ÿˇæ\Ó∫\Î\Ã5\◊\\S0\‚˙\ÎØ7\Ì⁄µ3\ÔºÛéi“§IM[NÄ8\Êòc\Ã\ﬁ{\Ô]”¶¢$\\tÖ˛xˆ\Ÿg\€(âUW]’®≠\œ>˚\Ã<˝Ù\”v\\äöò?æyÛ\Õ7Õ§Iìjù\ÎmC\Ì(Rcõm∂©ô[˚ˆ\ÌMœû=\Õ]w\›ez˜\Óm\€>˘\‰ìk¢9Ùˇnºπ∆ìÕ¨X\ÏU\‹e5æ¥T±πòZH¡TöÙM \È\Îæ\' âÄ\0 \nÅj|ñ\‚g*çB\0Ä@ Iß)\«\Ô)ò-ô`\'1êWÄê\„]wâ\roºÒÜπ\Ì∂€¨\√_«±\«ké<ÚHõ*I\Á $f\\y\Âï6ÚA\Èé|A\ÎÙóòê+B)í:w\Ól˙ˆ\Ìk\Z7n\\+}ì˙ú6mZ-A¬çU\Ìk|w\ﬂ}∑Y˝ık\⁄\ÿz\Î≠\Ì\\FèmØ˚˛˚Ô≥¶`\“\\]\Z(ç[Lî™IGÆÒ @[ìúú@5æ¥ß¿i&@\Í4[øÚsO˙\√z\Â	2@\0\È&Pç\œÚA¸\È∂>≥á\0 Iß)\«\ÔDàk1àÅ2	äê\„ﬁ•)\“;1BN}?5 té\"$X®Dè=Láåª>[\rØXê)T(RAá´%!A\¬˝ø´5\·çbpxΩbG.bÚ\‰\…VTQˇ˙o\Ôÿúxë9˝\ÊADàã:ÖM{_ZFˆ\Îa\⁄v\ÍYã)òR∏(R6eàî<f\”M˙\√z\Ãp2@\0©#Ä\0ë:ì3a@\0±#êÙwö ˛\Ì\\ B\\ñA\‰ Å†H•4\“\·Ño4Ñ_\¬EIxß\ÈR:ÂäÄ¶yr◊π1\‹s\œ=µ\“8y\”$e\nô}ªTNπı\Â¢ûyÊôö~Úç\'[\râ#é8¬¥l\Ÿ\“\\~˘\Â!Zó¶\”BÄ\"\‘i±4Û\ÃE\0ÇµQIIXØ$;˙Ü\0 \0äP≥ \0@†Úí˛Nƒøç\0QÅı\ƒ@ŸäP;á˛ÄlΩ\’CP˝\’Rh›∫u¡o*%	:Ù7•5\ÍﬂøˇrQ.˝ë˛\Óø3±y}ñKÄpüπ?\‘\ﬁFmdæ˙Í´öHç|\„\…\ﬂ˛Û≥ÎÆª⁄îU˚\Ì∑_¨Nó\’F\0¢\⁄,\ |Ç@ÄJåÛ\ÀI \È\Î\ÂdA[Ä\0 ú\0¡ôq \0îó@\“\ﬂiÇ¯∑  ªv|µ\ƒ@NÄò7oû≠π†\√\’KP4ƒ•ó^jv\ﬁy\Á@5 2S)©MW\‡⁄•P ñÇ)S∏\÷}P\n&o!k?\ƒj´≠∂‹úú¢∫\Óø%@∏¥R\ﬁ\¬\◊˘∆ìôÇ©Mõ6Fó\\râ/q\næ¥Ù\›ws\”y¯◊µ.!S!Ç|ûtI∑`≤«üÙáıd\”gÙÄ\0íO\0\"˘6dÄ\0íN \È\Ô4A¸\€X≠A‰çÄp\"¡∞a\√Ï®Ω\Œx\Á†\◊\ﬂë´µãû\ÿcè=Ãâ\'ûXkˆNP8\ÊòcåRI\Ëò8q¢ëÛ^mJúˆ\„≠E\·7¢EãVtPÙ\∆;\Ï`_<\ÿF^\Ëpc\“\ﬂ\Ô∫\Î.˚w	n\Ó™#\·wÆÒx\'v\Œ9\Áò≈ã\€B\€(Åj|i)\⁄Iàt\ÿ9Æ≥L˙\√z\\π2.@\0i!Pç\œÚA¸i±3ÛÑ\0 gIß)\«\Ô5 B\\°Aî-SàC´∫¶%`(öc‹∏qU77&TY\’¯\“RY¢Ùû4I≥Xuç7\È\Î\’e\rf@ y™ÒY>àü!yc\ƒÄ\0™è@\“\ﬂi\ ÒªÉ\0\‚∫b à\‚\r1r\‰Hs\‡ÅZÒ°i”¶\≈7ƒï\»B¿˚\“2≤_”∂S\œZgëÇâeS\Ìf\Œ[`&Lôej÷§⁄ß\ ¸bH \È\Î1D ê \0§ä\0D™\Ã\Õd!\0ƒí@\“\ﬂiÇ¯∑s\0\"ƒ•\ƒ@\≈B5$Tt˙\∆o4\«w\\qçpÚ†5\ÀÄ@\Â$˝aΩr\‰\ËÄ\0D\0Çu\0@\0ï&êÙwö ˛mà\n¨∂ BÄ(\Œ@árà≠1°\⁄É\0DTiÄÄ?IX˜7KŒÇ\0 \0Å∞ @ÑEñv!\0@¿/Å§ø\”Òo#@¯]e</àÅ$@\‹s\œ=f˚\Ì∑/\„™ª©πsÁöùv\⁄\…2§∫\'\ \Ï*J¿˚\“\“w\ﬂ\ÕM\Á\·_\◊\Z)ò*j:èÄ\0)ò\"ÄL9	$˝a\”B\0Ä@e	 @Tñ?ΩC\0ÄÄ1Iß	\‚\ﬂFÄ®¿äb†ª\Ó∫\À\\s\Õ5f\Ïÿ±irª\‹dìM\ÃzÎ≠ó\‹	0Ú\ÿ®∆óñ\ÿCgÄ±\"@\ÍXô#uÉI˙\√z\Í∆Ñ!\0ƒå@5>\ÀÒ3\ƒ\ÃÄ@*	$˝ù¶ø;‘Äq\È1êàû={ö9s\ÊÑ8\"öÜ\0Ç®∆óñ†8?\› \“mˇJ\œ>\È\Îï\ÊGˇÄ\0\“N†\Zü\ÂÉ¯\“n\Ê@ í˛NSé\ﬂàWb!@ÑhöÜ@	º/-#˚ı0m;ı¨\’\Z)òJÄÀ•â Ä\0ë3U\Ì ì˛∞^µÜabÄ\0B\0\"!ÜbòÄ\0™ò@\“\ﬂiÇ¯∑sô\"\ƒ\ƒ@!\ZÇ¶!PäPó\0èK´Ç\0DUò1±ìH˙\√zb¡3p@\0UB\0¢J\…4 \0$ò@\“\ﬂiÇ¯∑ *∞PÉ¢¢K¯ Ä\0\·ßT5à™6o\Ï\'óÙáı\ÿfÄÄ\0™ú\0Dïò\ÈA\0H\0Å§ø\”Òo#@T`A1DDóA¿˚\“\“w\ﬂ\ÕM\Á\·_◊∫äL> rJ¢	 @$\⁄|â|\“\÷o\0&ò¿G}d\Œ?ˇ|s˜\›wõw‹±\÷ı˙\Ï∫\ÎÆ3CÜ1á~∏π\Êökñ;\'páUv¡\Ôøˇnh\ÓºÛN;≥ã/æÿúu\÷Yf\’UW\Õ9\”\Ôøˇ\ﬁ<Ú\»#f\ÂïW6›∫u´2\"LßT•\‰z@\0(ï@\“\ﬂiÇ¯∑ J]-E\\\ƒ@E\0\ÊD@†\Z_Z\"¿FUD\0¢äåô¿©$˝a=Å\»#Ú‘©S\Õı\◊_oû˛y≥\ÊököìN:\…\\r\…%fΩı÷´\’ˇ\ÏŸ≥Õ∞a\√Ã´Øæj˜[oΩu$\„+•ì\\\ƒ\Áün\Óª\Ô>”≥gO≥p\·Bs\ÂïWö&Möò+Æ∏\¬‘©Sßî.´\Ê\⁄?ˇ¸\”\‹q\«¶Y≥ffø˝ˆ≥B\Õ=˜\‹cˇ\Ÿfõm≤\Œs˛¸˘¶Kó.f\‡¡\Ê\“K/5W_}u\’`\"\Â!Pç\œÚA¸\Â°H+Ä\0 P\nÅ§ø”î\„wá\Z•¨†\◊1DàÜ†iî@†\Z_ZJ¿¡•) †]ª”ßOØô\ÈÇEãÕåπ\ÃÆSkˆ7\ﬁxc\nh0\≈JH˙\√z•˘≈±ˇ~¯¡\ÓV?Ò\ƒ\Õ\∆ol&Lò`:u\Ídv\⁄i\'sÎ≠∑ö\’W_\›˚ßü~≤ª\ﬂ?˝ÙS≥t\ÈRÛÙ\”O\«NÄò3géy˘\ÂóÕ©ßûöı≤eÀåæ3ıo\‰πQ}Ò\≈¶s\ÁŒ¶oﬂæÅl≠®	≠ïÜ\r\¬7é7}Ö\«Tç\œÚA¸\∆O˜Ä\0 `åI˙;M9~w BºÇ(®\0°ó2Ω∏iWòéˆ\Ì€õ\'ûx\¬‘Ø_?\ƒUæi˜Ç1`¿\0;òv\ÿ!ñ/§ï\'\≈\ E¿˚\“2≤_”∂S\œZMìÇ©\\§i\'.$@\‹\–ˇ~≥\Í:πO~˘v≤˘yÊ¥∏ôqT1Å§?¨W±iäû\⁄¯Ò\„\Õ\ﬂ˛ˆ7≥\·Ü÷¥Ò˙ÎØõ:òW^y\≈\n\ﬁcÃò16•QàQ£FçOQ˘\‰˛ñK±∂ÜØ?æi=\"≠ñg\ﬁÄ\0\‚C \È\Ô4A¸€π®#@Ñ∏É®X\‚\‰ìO∂BÑ˜¯˘\Áü\Õ\Ì∑\ﬂn√º7\ÿ`s\ÓπÁö£è>\⁄\Ë%\È∏\„éq\∆\—6]\ÏKJ¥£§∑§†u\“-\»¯Ép\ƒOç\Õz\È\‘«öWØ8\"(X\Œ/ä@\“÷ãöt\n/\“\Œw=\œˆ\Ô\ﬂ\ﬂ\Ï∂\€nâ fÕöe\Œ>˚l+òäjò;wÆ9Û\Ã3\Õ\ﬂˇ˛˜Ç\Á¶\–¸5SV4â\Íbõ “ºj\n\œ¢0#ŒÄ\0 \0Åp	$˝ù&à\"‹µîµı *ó\01o\ﬁ<∆æ\Ÿfõ\Ÿ<®ı\Í\’3~¯°πÍ™´Lõ6m™\Í•¢ã:Ö]\"@§\–\Ë)ü2D\ @Ã¶üÙáıò\·å\Ìp>˛¯c”£Gõ\ÎøAÉEzæ\‡ÇL£Fçl{*Júyxüp\¬	ˆº°Cá\⁄:™3\·R@-Z¥»º\¬¶Oü>f‹∏qf\ÔΩ˜6›ªw∑!Ù3fÃ∞\œ\€˙\‹∫ˆ≤\À.3#Få0O=ıî=W5+°¨∂Ωá\“Ω˚\Óªf“§Iˆœ∫V\"Ü7\¬Y\‚Ü\n1g_V\n+’èP]åﬁΩ{õïVZ\…\nJe•~º\—¡™≥!á~f\ƒ\'ü|bØUçÖM7\›\‘ˆË°á\Z=Û\Ë(Ùπ\Í\\Ù\Í\’ÀºÒ\∆ˆz\Õı®£é2+Æ∏¢\…5>±\»ı\Ÿ˙\ÎØ_+≤[c–ò5Ω\œöDlo\ÌX\"f`Ä\0RM¿Ω”¥8\ÍÃ¨&>˜Ä©;yå}éå\„ƒøùk¸D@Ñh\Ÿ *ó\0Ò˛˚\Ô\€/Ω\Ïxı\È\≈\Ó\Õ7\ﬂ4]ªv\rq\∆\—6ç\0-\Ô¥ˆ\Ê}i\Èª\Ô\Ê¶ÛØk° SZWFı\Œ¢zmõƒô!@$\—j¡\«¸\‡É\⁄M3äÇpNp\◊Jê\ÁΩBÑ\"T\Ï˙\Ÿgü5˚ÔøøM\Ì‘∫uk£\Ád9ªoæ˘fs\»!áCV4±\⁄\Î÷≠õuÚ?˛¯\„vC\œ¿Å≠≥>õ\”[©§ÙÆ\¬\⁄\ﬁ]¸NXP_.Z\‚õoæ±ıT\\˘¶õn≤}\ËP\ƒÚÿ±cmM1Ò™!!Qbã-∂0x†˘\Ï≥œ¨Û_c\’sø˙W:(◊∑\ŒWΩ\rΩg∏ø˝\Î_ˇ≤¿o∏\·≥\Ì∂\€\⁄yIÑy\Óπ\Á\Ã\Œ;\Ôl\n}.°Cºé?˛x;>â(;v¥\Ô\«{l\ŒÒmµ\’Vy«Æy\Í˝\Â∂\€n´\≈\Œœú Ç\ﬂsi∫\"M\÷fÆÄ\0\‚I@\Ô4c\∆}êwp≠wmâ\07Û%\Âe¥Ñ^\“8\‡\0õ~I/\Ó%n˛¸˘\Êµ\◊^≥/\’ry!≠ñ93è\Ë	T\„KKÙ\È1I íd≠\ÍkRû˘™\ﬂ\·\Õp⁄¥if–†AVp\—\ﬁ\ﬁ\ ˝ºó\ÕY\ÌEDúr\ )÷±\÷Ygô{\ÔΩ\◊F\Ëp\◊Õû=\€H0YeïU≤>\Œ6\ﬁlÑ\⁄|˚\Ì∑mäò\ÿ~˚Ìç¢.zˆ\ÏiÖ˝\Ê±p\·B”•K†\¬\◊\0‰¥óp \"[\ﬂ^ßæ¢•—≤eÀöÆäJ˚3\Œ8√¥j\’*\Ô\ÁP.ø¸r+$d\Áùwû-¥≠\Ëål\„S›è|c\œ%@öì\Êç\0\ﬁ˝Y\r-W\„≥|?C5ÿê9@\0®6å˘\‘N\È\Ã\÷M1µr¸\Ó¢©É®\\zâP\»ˆ[oΩeÙ\"†}’Å\»|ëS:&\ÔΩ˜û\›˘\Â\rw\”\ÁSßNµª™{\Ï1ªõKª™T$P!\÷~?\◊.´\Áü\ﬁ^Øó,Ω\–)ú|¡Çvóìví]t\—E¶yÛ\Êfµ\’V≥\„\…˜ôõKπ_HC\\\n4ù`\’¯“í`s0Ù @D\0ô.|@Äç*ë\'\ÍyOió\‰Ù\ﬂh£ç≤Œ°\‹\œ{˘°êm\'æ˜Ë£èö;\Ó∏\√\Ó\–o‹∏q\…ÑKù*Áº¢&Oûlü\…ıﬂô\—\Œ\‡¡É\Ì≥Ùv\€mg£6¥\·®~˝˙ˆ\„B\Œzó\ÍH\Ô˚\Óª\ÔrºùPí\ÎÛ9s\Ê’ü\”˚ÄXe;Úç/\ﬂgj+˜BsBÄH\‰≠È†´ÒY>àü!R\ÿt@\0æ @¯\¬T˘ìíÚ2\Z\‰¡†\\Ñ¨Û\Âó_⁄ùL\ \rª\ﬁz\ÎŸùJ\⁄\’\‰^Nté\ÍB(\Z‚°á™yÅPÆ±v\Ì\⁄’àS¶L1^x°}πí`°\œU@Oπpz^\ËÛ\Ôæ˚\Œ\Ê\∆\’5Ùˇ óª\◊^{\ŸÒΩÙ\“Kf˙Ù\È\ÊúsŒ±ˇV∫Úº\ÍÖF\◊\Â˙Ã≠¿røêV~e3Ç8æ¥å\Ï\◊√¥\Ì‘≥\÷0I¡G´1¶R @îBèk\ÀM )\œ|\Âûw\Z\⁄Sö£˚\Ôøﬂ¥m\€÷¶\ uî˚yœØ\0q\À-∑ògûy∆¶Hrá\‰\⁄˝/Gz√Ü\rK ‘ÆKë™(mR\r•Å\ u(≠íR IQ\r	zû\√B\Œz\'@\ËY\\ëu\Î÷≠’ç \n}Æ˜\0=øg¶\ÀRc˘∆ó\Ô3]ã\0ëÜ;?˙9\"@Dœú!\0@ ?àÑ¨ê§ºåVJÄê]\·<\ÂîU!9ÖB+å|˜\›w∑V˛\‚ã/¨\0!Gì\€¡§ó	\rz˘Q∂^∞~˚\Ì7J≠πhóöä\‘\ÈEG;\’Ú}Æ∞p}.°!ÛP\ŒZET(M‘Øø˛js\◊*\‰~¯\·5\ZwÆ\œ\\{\Â~!M\»Úgò†u\ƒ¿\ÈÆ\‚ *n\‡!êîg>ååÄ\ƒ•1\“sßK5§\ÁL9ˆU\Ãx\Ìµ◊Æi∞\‹\œ{~\’A8¯\‡Ém≠E˛∫c¿ÄFı\÷˙˜\Ôo\Í‘©S\¬EA®`∂\"åU4:≥∑óÆj:H†Xw\›u\Ì\Êm\ﬁQö(’ñ´s\œ=∑ñp\‚uÍª®\rè\Ó◊ØüM€™>ïVJ©Zè9\Ê˚\Ïû\ÎsE[(˙AÖTC\‚\»#è¥QÕöÉ\ƒ\ZΩHH\…5æ|c\œ\'@\‰õ¡\ÓΩ4ûç\0ëF´3g@\0Ò&Ä\0o˚‘å.)/£ï ,Ω\Ã)L\\\¬¡ˇ˝\ﬂˇ\ŸBs\ ˇZHÄh—¢Ö}©RZ$•t\ <\‹\À[Æ\œ]éZ	\ cõ\Ì\–Kí>S]Öê\Î•E/F:Ú}\Ê\⁄*˜iBñ?√åò\0D\ƒ¿\ÈÆ\‚ *n\‡!êîg>åÊüÄ6\…(öVl\’(Ûr¯ªç/\Ó\Ôä¿’≥\ËìO>ik\‰;Ù‹´\ÁW•U\Z#9ı3¢VÒiE0®fÅ≥fÕ≤œ§⁄®£\ZKó.µ\‚√∞a\√lg\’LP\—hZV˚ä¯\„è?lîÒ\‚≈ã≠h0r\‰Hs\ƒGÿàâ/æ¯¢ΩNá¢zıú\Î⁄óx\·=¨\‘F\◊^{≠m?[dÅ;_\„Z≤dâ\nT∏Z¬É¢\‘\ÁW_}eé;\Ó8q¨gkmB\“¯\Â¯oﬂæΩ\È€∑Øô1cÜ≠°Hfäñ\ﬁl≥\ÕlD≈û{\Ói\ﬁ}˜›ºüªgtwΩ\⁄P§≥6)2\"\ﬂ¯Ú}&\Êä\‰\–⁄ê≠õ6˝+\'≤ü9)}ól*\·F\Î*W˙*ˇ´î3´â\0D5Yìπ@\0®ßŒ∂i\—h\√DL(à;◊Ñ®¢©É®\\)òÙR†®ÖÃºÆ\ÔºÛé}Q‘Åv%˘ ÑGë\⁄\›\‰=ú\0Q\Ës\Ì`s/w\ŸPk\Áñ\Ê\ÓjL\ËI/u:Ú}¶\œ B\\º4]C¿˚\“\“w\ﬂ\ÕM\Á\·_◊¢C\n&Kµ@Ä®6ã&{>…∂_\Ê\ËÂ¥øı\÷[≠\”<\€!\ÁΩ{Üuœöä:pá6\‘\‰∫V\Áh\'˛\\`\Z5jîUÄp)Ü$,Ëê∞°TBßùvöô4iR\Õ\ﬂ\\ëe•àRç\n	˚Ôøø¥˘\∆	£Fç≤ıM|Û\Õ7[ÒA\œ\€\ÓPT±ûgΩ\”g\⁄\‰›†£q)\Ì©¢≤üˆ≤R⁄•\r7\‹\–\÷hõ8qb≠˙jä,q5$¥©GÇ\∆Ãô3≠ê¢ˆw\‹qG;vâ:˙lÙ\Ë\—f\ÔΩ˜∂u\„Ù~ 1Fií\n}>n\‹8˚|ØtØªÓ∫´≠\Â¶\»]üo|π>”ªãx8ªhæL4ΩK‰õìl-Ò\∆k\”l\Ô.\’u\'1õ  Ç\–\‚\\@\0Ä¿ÚÇ¯∑sÒCÄqe1P9ÖPk˜ñ+≠)\Í\≈I/?\⁄y§ó$\'@h\'îv;\È\»L¡§Ω$\ÍG\◊JÑ\–À†\ƒ˝øvJ\Â˙\\/;¥˚Lª\¬Ùr∂\÷ZkΩ=¸\√\ÊË£è6zi\”\Ó&\Ì∫RÒ\Ï^Ωz\Ÿˆı“†\"⁄π>sbDàãó¶kT\„K\ÊÖ@>¨è8@Äàì5KX>˚Ï≥Ç≈ß\√\Íõv!P\Ì™ÒY>àü°\⁄\Ì\À¸ \0@ |\Â¯\›AÄ\—NATNB˘\\æ≠|©\nIVxªƒÇoø˝\÷\Ê{ï0g\Œª[HªñTÑNª£Ú,\Á≥fÕåvõ≠≥\Œ:\ÊÙ\”O7\⁄\Â§C\·\’J\ﬂ‘≠[7ªK\ÈÛ\œ?\œ˚πäa´wΩC≠π™\‡¥¬´\Ê-±D°Ú,îÉV¢Ör\0\Á˙\Ã\ÃCÄqÒ\“4k µ Rk˙XN\"ñfaPe$†îTä\Ïh◊ÆùçF\‡Ä\0\ K\0¢º<i\rÄ\0J\'@\n¶\“F\“BR^F+%@(\ @\·»änp©ç±†\\±\ Û™C\·\’\nW\·:*≠º©Ω{˜∂a\‘JÉ§äè>˙»æ)dZbÖB‘ï7\÷E!˙\\\"Ñr±\Í˙M6\ŸƒÜxw\Ï\ÿ\—^Ø˛\Î◊Øoa´ÿùƒé.]∫\ÿ1\Ê˚\Ã-2àHn∑\‘w\‚}iŸØái€©g-&§`J˝©:\0Ug\“DO()\œ|âÜ\Ã\‡+B@Ö¨U´AáûèUº˙\Í´Wd,t\nÅj&Ä\0Q\Õ\÷enÄ\0íIÄ\"\‘	±[R^F+!@$ƒÑe&DY0\“H°fâ§ç\0D\⁄,\Ô˘ÛÃß\"ª\⁄T¡Å8xˆ\Ÿgm]\’NP=∑I(\Œcf\¬˘\0\0 \0IDATlH\"à$Zç1C\0®n	±o1/£ïò\ZD∏\‘ \¬\ÂK\Î@Ä`%§ç\0D\⁄,\Ô˘y\Êìp\¬	\'\ÿ¬∫™3’™U´xOé\—A\0Ä@\Ë BGLÄ\0 ê\0D@`ï:=\»\Àh•\∆\ËóJu\‰\Á(W\r?}U\À9\’b\…x\œ\√˚\“\“w\ﬂ\ÕM\Á\·_\◊\Z0)ò\‚m?Fú\0Dpf\\?\œ|K>aV^ye3r\‰»öÅ\Ë\"<ª\–2 \0Å§@ÄHä•\' \0ÅÙ@ÄHà≠˝ºå÷ù<∆å1¢¢3ä\"bÿ∞avé\Ì€∑7O<ÒÑ≠©P\Õ\«\Ôøˇnl´H∂év\ÿ¡<˝Ù\”fÎ≠∑Æ\Êi3∑\n®∆óñ\n\‚§\Î@ÄHÄëR4\ƒ|\œ|,òoûΩ\Ë3e¬®ZDÙΩ˝\ﬁ{\Ô!@§hù0U@\0πT\„≥|?+Ä\0\‚G\0\"~6\…:\"àÑäaB†\nT\„KKòÖ)ÑH\0\"D∏4ò@∂g>	\„\Ôg˛9®∑Y∂t©YÚ\Ábà¿dπ\0Ä@:T\„≥<D:\÷.≥Ñ\0™ó\0DBlã\0ëC1LT\ÔK\À\»~=L\€N=kÕäLU`d¶Pã\0\"Nº\œ|^\·aÖ∫u\Õ\‚\ﬂ\À:T\" \‚dA\∆@†≤ *Àü\ﬁ!\0@`y	Y	1√Ñ@†uë)\"Ä\0\'áL@\œ|læã©ª\“\ 6\‚!ü\‡ÜÇ\0≤QhÄ@Ç @$\»XÄ@JLú:\€Œ¥E£\r1\„rDﬁ©çå1\À¸Kéà8XÅ1@  \“agf˘?¨Ü8\–3ﬂø>ˇ\“,¯iñY˙ÁüÅá÷¶M3zÙh{ù\⁄rÖ™€∂m[S+åøˇU3\rp\‡æ¯´ê=™ãÉû\Â˜8\ÁJ3˙æ≠}ı\ﬂ{ú›Ω\Ê˜$â\—\Ã\Âp˛A\Â@\0H-År¸\Ó @Ñ∏|ÇËÆª\Ó2={ˆ4s\Ê\Ã	qD4\r%\‡ ˙Óªπ\È<¸\ÎZM$Ò•%(\ŒOàt\Ÿ;\Ó≥%\"\Ób|Ä\0\‚MÄàx€á\—A\0Ä@¸	Òo\Áö\rDàvb à\rA\”(Å@5æ¥îÄÉKS@\0\"FN\–©ë c1T@\01$Pç\œÚA¸14	CÇ\0 êz§`J\» SB\≈0!P™Ò••\n\Ã\¬B$Ä\0\"\\öL \€3ü∑ı≤•KÕí?\◊jó\ZÅ1s \0Å™%Pç\œÚUª\\ô ê°Nà° b(Ü	Å* \‡}iŸØái€©g≠YëÇ©\nå\Ãj@Ä`Aƒâ@æg>	\œ^tåô2aDúå\∆X \0ƒà\0Dåå¡P \0@¿@ÄH\»B@ÄHà°&™Ä\0E®´¿àL!à@∏89d~û˘ñ|<¬¨ºÚ\ 5¶5§1c∆òV≠ZÖ<:öá\0 \0Å∏@ÄàªÖ \0ÅÙ@ÄHà\Õ˝ºå÷ù<∆å1¢¢3\n\ZI\ràäöä\Œ!êì\0ã#m \“fÒx\œ7\»3ﬂå3\Ã	\'ú`FèmFç\ZÖ\0o\”2:@\0ë@Äà3ù@\0Ä@\0`UÚ\‘ /£ï\'D%\È\”7\ C¿˚\“\“w\ﬂ\ÕM\Á\·_\◊jòL\Â\·L+Ò!Ä\0[0cäy\Êì—†AA\0Ä\0ã\0Ä\0\‚F\0\"n\…1ûb^F+15àJPßOîó@5æ¥îó≠Uàj≥h≤ÁìîgædSfÙÄ\0™ó@5>\ÀÒ3TØeô \0Å\‰@ÄHà\ÌíÚ2\Z\‰¡ÄL	Y|3u™Ò•%J#~Ù\—G\Ê¸Û\œ7rj\Ô∏„éµ∫\÷g\◊]wù2dà9¸\√\Õ5\◊\\≥\‹9Qé5é}˝˛˚\Ôf\‡¿Å\Ê\Œ;\Ô¥√ª¯\‚ã\ÕYgùeV]u’ú\√˝˛˚\Ô\Õ#è<bs\‚w\Î\÷-¥\“*@,Z¥»¶n|Í©ßL˜\Ó\›\Õ\÷[oò]í/X∫t©˘˜øˇm`S¸Ò±òNRû˘bãA@\0Ä¿r™ÒY>àüÅ%@\0Ò#Ä\0?õdQR^FÉ< @$dÒ1\Ã\‘æ¥å\Ï\◊√¥\Ì‘≥Ér§`ö:u™π˛˙\Î\ÕÛ\œ?o\÷\\sMs\“I\'ôK.πƒ¨∑\ﬁz5}˝˘\Áü\Ê¡47\›tì˝\€Èßün∫v\ÌjV_}ıX\€$ó\0Ò˘Áüõ˚\Óª\œÙ\Ï\Ÿ\”,\\∏\–\\yÂï¶Iì&\Êä+Æ0u\Í‘âıú¢\Zúl~\«wòfÕöô˝ˆ\€\œ\n5˜\‹sè˝gõm∂\…:å˘Û\Áõ.]∫ò¡ÉõK/Ω\‘\\}ı’Åá∂\0°y=˜\‹sFø{\„∆ç3{ÔΩ∑u¯\Î∑]˜õ?\ÁûXÅ^}ıUs\ﬁy\Á\Ÿ˚\ÓÈßüNù\0Òı\◊_\€˘ø˘\Êõ\ÊÒ\«7\'ûxbπ\’^Rû˘äöA\0Ä@\Ë BGLÄ\0 ê¿ƒ©≥\Ì-\Zm\  úƒøùkÑjCo˚Àñ-[VôY\—kR^FÉ¢àÖ¿%àÄ@\ÿE®¯\·ª[]Œæç7\ﬁ\ÿLò0¡t\Í\‘\…\Ï¥\”N\Ê\÷[o≠Üj\Z7nl∂\ﬂ~{ÛØ˝Àû”±cG”°Cá(¯\ÎbŒú9\Ê\Âó_6ßûzj\ﬁÙ{s\„ç7Íáß(πø\—$ˇ¨/æ¯\¬t\Ó\‹\ŸÙ\Ì\€7ê3\\Qäîhÿ∞aQ|\√ ^|ÒE≥\“J+ôˆ\Ì\€E\‹v\€m\Ê\·á∂˜¡^{\Ìe\r\Á\Áú0,<f\Ã±ìFB<˙\È\'˚]tÚ\…\'óUÄ˚›êÕ¶Iy\Êc=\“& \0îN\0¢tÜ¥\0@\0\È&ƒøç\0QÅµ\ƒ@0]B¿Å∞àÒ\„«õø˝\Ìof\√\rˇß|ø˛˙\ÎVXx\ÂïW¨1k\÷,Û\ﬂˇ˛\◊˛∑;1!ß\ﬁ\Õ7\ﬂlS\Ì\ƒ\·5jîëWQ˘éR\‰qòkc(\÷^*\ﬂ0àπsÁöè?˛\ÿ\Ï±\«5ı79˝uh=k¸Ö\Œ	k\Õ\À<äıEa	~ø ¢∞2}@\0HàtŸõ\ŸB\0Ä@˘	Òo#@îü¡É¢ NNÄ@Ex_Z˙Óªπ\È<¸\ÎZ\„(G\n¶Ãâi\Áªv!˜\Ô\ﬂ\ﬂ\Ï∂\€n6R@ˇ∏\‘D\⁄5~˘Âóõ∂m€öC=¥\"\\2;ïHrˆ\Ÿg[ë§P\⁄9ú\œ<ÛLÛ˜øˇΩ‡π±ò\\Ö°h\’\≈∫?\ŒD.î\‘fŒúinø˝v≥\ *´d=\Õ\œ9•ö\n¢¸Aæ J]¡\\@\0ô XÄ\0 7§`äõErå\')\·¯	YPyT\‚•Eªø{Ù\Ëas˝7h–†ft!¶Lôb\ÓΩ˜^[@iRV\\q≈ú£ü7oûπ\‡ÇL£Fçl{\Ÿvç{üp\¬	ˆ<•{R\nàv5&$zº\¬¶Oü>\À\Â\Ìü1cÜM	•\œ›°k/ª\Ï≤\Âä˙>Ò\ƒ∂m\Ô°4C\Ôæ˚Æô4ií˝≥Æïà\·vc6Ãä*ƒúY|Y)¨T?B˘˚{˜\ÓmS˚H\ÿP*+ı≥\√;\‘8\Â¿ñC\ﬂ˚7ı˜\…\'ü\ÿkUca\”M7µ˝K\ÿqı\n}Æ:Ωzı2oºÒÜΩ^ıé:\Í(kõ\\\„SÅ\„\\ü≠ø˛˙VÄ“º›°1k>™\ÎPhNI ñ,Yb\ÌΩ˘\Êõ\ÁL)\Ê\Á±z\Ìµ◊¨8˜Ë£è\Ê,hû\œ&NÄ\–:ï\›eWä\nÒFm|˜\›wˆ≥lu[ºk‹≠[≠/≠=\Óoø˝ˆ[çù≥\’\\ﬁõJM•˚\È≥\œ>3\Áúsé≠Û°Zô\Á\Ë^:˙\Ë£m\r\’\—\»u\œf\÷\⁄\–\\˛¯\„õ\Z\Ì˛˚\Ô∑\ﬂ-˚\Ôø\Õ¯\‹=)qÙ\ÿcèµ˜™˚õ\Ê§5ßZ˙\Œõ\„é;Œ∂µxÒ\‚¨\ﬂ\rÖDJ\Ô˜CRû˘¯!Ö\0 \0Åx®ƒ≥|\ÿ$Ç¯\¬\ÌC\0Ä@p°Œ¨\"W$\Âe4»ÉYJt\nÅÇ*Ò“¢b\”ı\Í’≥\Œ?\Á(\‘@Ωé\ÕSN9\≈\‹p\√\rV\\\»u â G\Â≥\œ>kùçJÉ”∫ukõ˛F\Œn•\√9\‰êC¨#S;\”\’^∑n›¨ì_”´Æ∫\ 8\–:\Î≥9ΩïJJà\nk{wÒ;aA}9G\‰7\ﬂ|c\ÎHXQ°mı°C©[∆ékk\Zàâ˜ê #Qbã-∂0x†u\Œ\ ˘Ø±\ ¡Ø˛ï\ ı≠Û\Â$\’˜≠˚õ\ÍiHò\Àm∑\›\÷\ŒK\"åä$\ÔºÛŒ∂\ﬁFæ\œ%tà\◊Ò\«o\«\'«¨js®@∏µπ∆∑\’V[\Âª≥∑\Í#x\Ÿ˘ôS\“	Xrfãª\Í†d;¸ú£\Î\n	Ö÷åxWÑéúrÚ´ãl¸¿òµ\◊^€®Ä∫Ñ 	_-[∂4ZªZü´≠∂ö0`ÄYgùu\Ã\€oøm◊ÄÑ	b:>¯\‡[\‰YkPµ\\t®ø∫u\Îö]w›µ÷Ω\ÓΩ7:\Ë €ü\⁄\—\Z?Î¨≥l\·\Óã.∫\»\\x\·ÖV|\”˝*\√?¥¬â\Ó´~˝˙\ÂΩg\≈BıE‘¶ƒÇ5\÷X\√<Û\Ã3ˆû—∫\”˜èKè•˚\…›´äh\–gEÙ7âì\◊^{≠M°%qD˜∑˛≠{Y\Ì.]∫¥§ö$Iy\Ê+¯c\¬	Ä\0 Pïxñ{¢A¸aèÖˆ!\0@ 8à\‡\Ã*rER^FÉ< @¯[J\⁄i,\'©v£\Ó∏„éµ.\“grbiÛ\·ánwõfû„Øó\Í=KéI9å\Â\’!ßôúYôª Ωº;l\Â|N\€\·}iŸØái€©g-\ÂN¡4m\⁄43h\– +∏\Ëoá≤\·[oΩerb\À\·π\Ó∫\Îmñl\Œj\'(\"BBász*Ú\¬9S\›u≥g\œ6Lî6\'[\·\„l)m≤	öÄú∂j„©ßû≤Z96{ˆ\Ïiùù\Œa\Îù\Ë¬Ö\ÌNpE®µ\0â4\‰0\Õ÷∑>wN}E+hWπú\»\ÍCáv«ã˝gúaZµjï˜s	(\⁄m\Ô\Ó\'\Ô\ÿ\‰hñÛUN\Íl\„S›è|cW[ﬁ±j>:\n\ÕI\Á%IÄê\\Nz\Ÿ\¬†\Œ\\\Ã~\ŒÒ{ªf{\Ï1kâZì\Â$LI<\–!°Lª˛ï6\Ìà#é∞é{âZCZ\”:t):A\◊\ﬂ‰òóq\‰ëGZa#ÛPÑÑü˜F\Ë~\”wƒìO>iù˛NúìP\‚D:?˜¨\Ó\›s\œ=\◊\n\Ó˛ö>}∫Ω4F˝;\ﬂ˜É%¨(ÇBç¢wd/	x#Gé¥\‚çR«ïR=)\œ|~\◊ \ÁA\0Ä@¥ ¢\ÂMoÄ\0 Pò\0DaF±8#)/£ï ¶Nùj#\ŸRCd3†)\⁄y*bê¥ïXπ\ÌHΩ\Ôæ˚¨cH&9˝ö4ibwr∫º˘ïoú˙îù\Ô∏\„”¨Y3≥\ﬂ~˚Y°F\È2Ùèv™f;\Êœüoù§É∂;p\„æ>\¬\‡vj\Ôò,X`\Ì!ßˇFmîw:J≠\"\Á∑}N(f˛~å\Ÿ\·\ÍKéc≠)\Ì–óì¥TB\⁄\≈-Áºæì&Oûlùæ˙\Ô\Ã\Ë7W≠Mâh\€m∑ù\›ÆHÑ˙ı\Î€è9\Î]™#≠Ò}˜\›w9|N(\…ıπäÄkóºæg\‰å\Õv\‰_æ\œ\‘V\Z9Óµ£^)´º\—>^ñ~\Œ	≤ˆãY3∫/\ÂWîÄÛ\ﬁ\Ëı-\·JÇ›û{\ÓYÛ=)qPb°Ûk≠µñçÆ˘Ú\À/Õßü~jE;•ï\“\Á.≤πÑ$E\ÂH¥\–<$neª\Ô¸‹≥˙=}Ë°á\Ï:s˜Lfjø\ﬂJ¶çäv\ <JƒíÚ\Ãd\rr. \0DG\0\":\÷Ù@\0˛ @¯\„TÒ≥íÚ2Z	BN\Ì®îÉD©,îD=Ü\’N\ƒl;™\ﬂ|ÛM\Î¸âõÉY\Œ=a\’\Œ\Ê|áv[jß±˛ùFπ\ﬂRπªï\‚F)7\‹nj?◊ñ\Í<Ú\”GúœâJÄê@§\‹\Î*,≠T@Ö\ŸSπ\‰e\œ(à[nπ≈¶gÒäUr\\j˜ø°\r6,YÄ–úı}§\‘5äÇx\ÔΩ˜l\r•Å\ u\ËæWz	!\’$D»©*Ü~ó_\ﬂ\Ìfw}9gl°œïÇJ)g≤9\–Ûç/\ﬂg\ZCµéµK^)´r\’2ÒsN°{%ÛÛr¨áó0\Êl\Ó]+§th]JLT‘ôR•ç?\ﬁ~˜\Í˜Y˜ì~èµ\Êv\Ÿeó¨S\»ı›´vï\⁄L\ÌJ¨\À%@∫g«çg\\dG©Df™0\ÔÑJ˝\rI\ 3_\–u\»˘Ä\0 \ràh8\” \0¯\'Ä\0\·üUE\œL\ \Àh%98\‰êPZw(gxá\Ã+ØºbÖ\Ô°t/rñH®\–\Œ\·89µ\ÎUD\Á\Ã…µ\ËJunTt1G\ÿy6g¨ü\Ó\”\Œ\◊˚\“\“w\ﬂ\ÕM\Á\·_\◊\¬VéL¥#∫Mõ65©P\r!«æ\ƒ¡l\ÈY‰Ñî\”ODX)ò\‹.o\Ì∏>¯\‡ÉmdïæK‹°\ﬁ\ÔøˇæM;ì+\ÕJêLj\◊EA®`∂ú\“J•\Ê-ƒùπf%∏J†øuπÚı]¶æïb\∆+úxù˙.jC≈£ïÜ\ÊÄ∞}*5çj	s\Ã16SÆ\œıù©\Ô\'E£®ÜÑv•+ùô\Ê†>\Â|ñêík|˘∆Æy\Ê Ú\Õ)))ò$†I|8\Ì¥\”ltãD•ÚQ\‘\’>˚\Ïc\Õ\Ï\Á?\ﬂaA◊å\“¸y\Înx\Ì∞\Ÿfõ\Ÿ\»#\’YPê[õJ]§Eﬂ©>É\›\√\nu÷¥iS≥\Âñ[öM6\Ÿƒ¶ıRΩ•P;\Ï∞\√rﬁø\ÓªWu(ºÈû¥\ﬁMë/ıôü{VµU$ø¯\‚ã6\rôé\ÃÙkn\⁄\–\‡ó\Ãj∫\œt\Ô(íCQàé\…K/Ωd\À\\\—Q~móîg>øÛ\·<@\0àñ\0D¥º\È\rÄ\0\n@Ä(\Ã(g$\Âe¥D6…â£órj◊¶;\‰Ù\Ï›ª∑M%°ÇÃîï4∂Rrhw∑ìB¢àÀµ≠]\‡ÖŒ≠\‰ú*›∑¢I\‰\Ãı:\÷¸å	b\”˝\√9Qï*@®\ŒAü>}¨[\ŒW\Ô!ß£öµ\ÀYÖ^ı˝ßH\'\Â\\ó8ë+oæsÄ\Í∫\r6\ÿ¿:\Â\‘\œ<\\ëYE0\Ë{@xWdv˜\›w∑E\Â™\◊XîfEıj\\\·]E*®}ç\·è?˛∞é\Ÿ≈ã\€u&\Á≤r\·+¢A¢Ö\◊\…)g≠úÛÆ˝\Ã4ir\\*µë\Ê´ˆs•\Ê\—\\4.•≤ëP†\¬\’˙PÙÉ˙¸Í´Ø¨STQ`r\Ài¨Ò\ÀÒﬂæ}{+ﬁ®∏±ú∞S¶L±h\‰ÏïìYJßÛ\Óª\Ô\Ê˝\\\ŒW}ø∫\Î’Ü\“\–hgπ\"#Úç/\ﬂgbÆH≠\r•˛ë[áü9)}óú\Ërk]\ÂJ_ïkQ+ï\Œ\r˝\Ô7g<56\Î)S?k^Ω\‚TÛÛ\Ãi~æBñ;Gı	Ù˝.v\ﬁC\ÈÑ\‹˜ìüs≤u>b\ƒ[7A\‚@Æ\Z@˘∏K∞\◊ıbÆZ\"Æpπ÷É≥Éãlêx†u\'æZS*@ûi(ë@\‚ñ\n[KåP\ƒ\√\·\√\ÌöRwâIπ÷∑˚\ÓU\ &≠[˝~˚\Ì∑v|ZsZ\€˙\ŒP1jEXx#2\\çä|˜¨¢e’öP$ì\“\Í\ﬁ\”}¨˚YuL$ñ®(ºl•4á˙\ƒA\‚ß\Œ\—:\”THi™‹°{P\ﬂUz\∆–ú≥}7dF\ÂZLIy\Ê+\Íf\‡\"@\0ù\0D\Ëà\È\0Ä\0@Ä¨Rß\'\Âe4.Ñú%rL\»9\‡\›I,\'»è?˛hsü\À9WHÄ–Æ^9Pú£#õ3\”[∞X˘∞\’\Ô–°Cm˚*\ÌR@\…\È™]úrÆ)\rÑvåv\Ô\ﬁ\›:,\‰î\√PüªC\◊\ \"\Áív\Î\\\ÌÙ\’\ŒTµ\Ì=îfHNC9Ét\ËZ9%›ÆM9d\‰të\√%≥¯≤ªr¯æ˙\Í´\÷q\"á¶Ñ\rEà®ØÉLN,9ZΩSrr\ÍZ•ÉQaUı/G§s2˙\\yπ\Â\\÷Æk]Øπ\ \—,\«pÆÒâEÆ\œ\\û{\Õ\€\Z≥\Ê£\›\‚Ö\ÊÑ\0û\0!ûñπÑ39\Ôu~Û\Õ76-ë÷î\"ú\‰<ó\„≥P*≠B˜¨˜û\–\⁄\–}°TB⁄ï\Ó\ÓwØ\Ës•à\“˜àÑ˝˜\ﬂ\ﬂ:õ7o^≥∂µ§z˙.π˘Êõ≠¯\‡Ω?ïRIQ\nô˜¨vsª\"\–\ÍG„íìU\—ŸäO{\Ôw1Q\ƒ\◊\Ì∑\ﬂn&NúX´∞∫ú∞ÆÜÑvaK–ò9s¶R‘æ‘∫/ıΩ¢\œFèmøã\‰xU‘Ç\Ó99†}Æ\Ô0â7˙\ﬁ\ÿu\◊]≠C\ÿ›≥˘∆ó\Î39Ñ\≈\√{\œ\ Êöã¢aÚ\ÕI\ﬂ\œo‹µπæ\ÎÚ˝~á)@HX\–\‹\‹˙ÚéC\„V\ﬂ˙)tN∂ZjKë+Zó˘à\\\‹ıõìπ^\ﬂy\Á˚=\Ô≠a≠o\Ô˜¥¢\Z\‰ÑW\·\Ê\Ã4áöØ>Sw∑ñıß{L\Ì\Ê™¢˛\‹wØ\⁄\‘|]±h}ox\‡ÅFÇ[\'˙^ê \"±¿˝Æ\È˙B˜¨\Óâåä\ÿ—Ω¨ˇv\—@á~∏≠]!qMøø™W°\Ôâ\'\ZªÑGıØs~˛˘g{J§\–X%>J<\‘z‘ë˘\› Q\‘Ôëîg>øÛ\·<@\0àñ\0D¥º\È\rÄ\0\nò8u∂=©E£ˇeØ)|U\Â\Œ\‚\ﬂ\Œ5Jµ±Ç1Ú±,´\‹Lˆúîó\— \“\ÓFΩ¯À°P\ÓC;0µCSé\ÁW\Í•AÉYß¶svï*@h\'µú¢\œ>˚¨uNjg§⁄î\0\"ßéír\Í\…)(GÖú£\⁄5)\'øê\⁄\r™ú\÷r\÷gszkg™97ºª¯3\”Aàü∂\"î˛Aı\·ú J;!\«H\ÊÆ`\›%∂\ÿb\Î‹ë\„H\ŒçUé^ı/á®\Î\€Ìåï\Ì\‹ﬂîˆB¬Ñvk®\Ê%FÖÇµõ∂\–\Á:\ƒK©]4>9\Èî]v:ˆ\ÿcséO©<Úç]sœñ\Œ\≈œú ˛\'@å\Ï\◊√¥\Ì‘≥\÷-ZjDπ\Ô˜jhO˜^°\‚\”\’0œ∏\Œ!L\"Æsé\„∏\“˛\›\Îlíîgæ8Æ!\∆@\0∆æˇÜ\Õ\\	\∆A¸ï}B\0Ä@u(\«\ÔDàk\"àÅ\¬ ú\– a¿\ÌÃî\0†\‘#⁄°®ˆ\Ÿ¯\≈b\…\Ê0\…\Ã)-\Á¢vIkG®+û\ÎÆS\Óı|y≠É\‰ì˚\Ì∑≠–†à	\Ì<U‘ÖD	1\ŸvU/\\∏\–t\È\“\≈Fháß\09A%HÄ(T\–V,µKT\Èi\‹nnE%à˝gúaZµjï˜sâ5⁄π+!!Û–él\Ì∞VtF∂Òi˜kæ±\Á \nÕ©˘\‰ã]Kqπ.™\"\‘qôo•«°˚TQC\Ì⁄µ´…•_\È1•≠àxX\‚/; @\ƒc=2\n@\0I%Ä\0ëT\À1n@\0àÅ ˛\Ì\\cFÄ—öAÜ\0°òJó¢\\\Î\ 	\Ó9\Êï{πm€∂ˆOQ	.\¬\"\€N|çC)3îg[\—πäV \\1[9\ÁÖ0yÚ‰Çª™UÙW\‚\»v\€mg£6âPø~}À©ê≥ﬁ•:í†¥9ôá\„ú\ÎsEø(â¢,r•\Â\»7æ|üi,π\n\⁄\Ê+∏ä\0Q{◊î¢2wPQû/Q’®Q\Í5\‹2sÈóßZÒC\0\¬•\œqıÙ\€\‚Í≥Ñ\ﬂk¸z@ÄàüM \0Å$@ÄHíµ+ \0Åt SBÏúîó\—J\närP\ÓgâJ\‰∑£r¿ÄY≠ùY\œ \Ëí\»\· nπ\ÂõsZ)í\‹!πvˇÀëÆÇ∏ä^–øΩ˘ÒÉjW9ËïæHQ\ ›≠\ZJï\ÎPZ%•@í¢<\·\"TV˝\n ã≠Hà\ÃõNÄ(ÙπRP)\œv∂¬§˘∆ó\Ô3\Õ\"\Ëj˛\Î|\ÔKK\ﬂ}77ùá]´!àˇ\«ﬁôÄKQ\\m¯∞à\‡æPTL~4B4qî\ﬂ}¡ó∏.≈∏Dç[~.®h\‚N‘à\∆£D\‹\rj4®Äà\‚äbåà(†à¢†¨˜æ2}3wòπwz¶{¶´˚\Ì\Á\…ú\€Uu\Œ{jf™\Îõ:ß<Æ˘≠î∫MuT;AıTö´6 j\√=w\‘BıY\n\’-™Ω•Ò[\‡Àö/~å\0@\0\Â@Ä(á\Zm \0@ N°éìnÑ}˚Ú0Z+B\‚É\“ı\Ó›ª>’êNChc_õ{*bZh££©\Z•Ñ∞Buˆ\€o?W+\·\ÿcè≠\ÔV¢\»/º`˙%tÛ\Ê\Õ# ÇS*ò≠Ç≤*úô[à;ﬂß;\Ó∏\√	ÎÆªÆ+ñ´büJ%DÑäâ\Ê\n\'πõ˙¡©\rèäxjL•ïRa\‘C9ƒ•c*ˆwù∂\–\ÈBU\râÉ:\»ï\ZS\'Y$§≥Ø1\€\Âg1¢1ü8ëŒº±•ºóπ\'ª ≤˚$z\ÓÀö/â\Ï∞	Ä\0“πñ≥\œ¿Ä\0 \0Å\‰@ÄH^L\nZ\‰\À\√hòÖAT)òî?˝\⁄kØu\ÿJﬂê{i\√_5ÚY_j\n&â:ï–∂m[ó\“Hõ˙˘ó\nQ+•èN.)#\ÊÃô\„j\"\Ï∞\√Æ√ä+ú¯¯„èõ¸V\Õç\÷IıØKñ,qıñ.]\ÍDÉßü~\⁄’¨–ââ=Ùêkß\Î\„è?võÛAˇ/rØá~ÿ•6“Ø™\’°ì¡˝≤k˘Ú\ÂN(P\·j	:˝†1\ﬂ{\Ô=;\Ï∞\√\\ö•gz˝ı◊ù˝\⁄¯\ﬂs\œ=]]çO>˘\ƒ’èò1cÜ\ÎRø\‚\ﬁl≥\Õ‹âäùv\⁄…ûy\ÊôFˇ.ëC¨Çˆ\ÍCE∑\Ô∫\Î.Wúª1˚\Z˚õò\Î$á\Ê∆üˇ¸g\Î⁄µ´≥ØüîæK1ïp£yï_º€ìèç≤\ÕL„Ø¶ ÜA\√L#@(uû>π _\÷|q˘OøÄ\0 PÅ4Æ\Â\√\Ï3TFè\÷Ä\0 à8®\∆–ß/£aQ⁄¥W\ﬁÙ‹îEπ¯µy\ﬂXmÇ¶N@\Ëó¯\'ü|≤u\Ïÿ±†\0Q(eÑR	}Ù\—6u\ÍTg\ \‡¡É\Îã,+EîjTH@\ÿkØΩú\‡–£GèzÅ\‡\Ÿgüuıd\◊eó]\Ê\ƒm¸óR*\ÈîB\Ók˙€®Q£\Íã@\ÎøeóRª\ËtA°\‚”πåîël°ø\0\0 \0IDATv©]ªvv\ÂïW⁄î)Sú`!tA\'Ktä@\‚ãN;H–ò={∂R\‘ˇ\÷[o\Ìl7nú˚\€¯Ò\„]]\Â≥◊©ùÜPö§¶˛˛\‚ã/:Ò\ÊëG±\Ì∂\€\ŒN;\Ì4wrE\Ì≥Ø\ÿ\ﬂ-Z\‰x\»\Œ\‡í`\"_t\Z¶1ükâ7A\€ ~‚ëï+˜°\Â≠\«\Ô∑M∑\Îk´≠Û]]]§`\ \ L»éü•ûqò≠∂Jw\¬Kßµ∆åì@xZUæ¨˘™\nÖ¡ \0@†d%£\‚F@\0®à*ÅÆt_F´-@T\ 5≠\Ì\ﬂ|Û\Õ&ãOß\’w¸™ú@\ÓC\Àe€Æm˛Ùòmºıï£•áÑhLÄ¯\‰≠)ˆèﬂüiΩˆíY]ùÛ\‡ø¯ÖK˚\«Å8¯≤\Êã\√w˙Ñ\0 \0Å\ 	 @TŒê \0@ Z\—Úå≠7_F bõ%w¨îT√Ü\r≥]v\Ÿ≈ùF\‡Ç@Xπ-W˜\Ìhõ¸x\';Úª ¬Ç\‰~o $<åøq∏ÕòÙå-˝vQ_ º	≠óÜ˙≤\ÊÛ.FC\0\»\0à!\0xF\0¬ìÄ˘Ú0ä\0Qª	•B÷™’†K)êîöjı\’WØùAå\Ï-Å‹áñøúr†}˚ı;Ú∂\' ºç(Ü7E _Äxs\Ïh˚\€yÉm≈≤•õ*m\›\◊_\Ì˛¶Z7c«éuˇV]û\◊^{≠&Ø+\Ìüﬁª˘ˆÑy]\¬\ \Ë—£kb≠∏%q\‹oø˝\÷:˝xg;\‚\∆G\nŒøÒ#á[ãi]zC.@\0Ä@>\Ê \0$ç\0D\“\"RƒûJàßûz\ 9\‰\Î€∑Ø\›ˇ˝±zå\0+\ﬁF;ø\Ôæ˚\\]\’NP=É\ÊÇ@9\“¯\–R\⁄dá@æ\0±`ˆGˆ‹≠ó€î1∑XÛ-W\"v\ﬁyg4hP=††.è\ÍÒ\‰^\’|˝õoæqµ{t\Âé\Êıx¿TC\'∏™i≠∏%q\‹\·√á[\Î\Ó`{ˇˆﬂÑ\Ÿ˘l\¬S@\0\ÂH\„Z>\Ã>C9\Ãh@\0Òò2sÆ†g\«vÒQ\ÔQ|Ô®èf¶L\Œˇ\…\Âëm±vSé\0!\·AøÑ˜\›wùmGy§\›q\«±\⁄&@Q°é\’:á@F	§Ò°%£°\ƒ\Ì	´ÒùqÖMÛß˙˙\ÍíL%ÇÂ∂≤î≥\Ê+k \ZA\0Ä@*	§q-fü!ïA\≈)@\0®*Å(æwR/@\‰äP´V≠Lµ\‚æ\¬\"\Óh\–?\ #P\Ë°eÙ\…ÿ¢\œ\Á\⁄1ûh\√{¨.∑º\ŒiÅh¨µÃùˆ\‘\√ˆ∑sèµ•ãøq\÷p¿¶\”\\àÉ\0DT\ÈÄ@v @d\'\÷x\n@\0Ò≥ø]ÃÇ\‘\n_ø¯w˚\‡Él˛¸˘+˘ﬁ•Kó.\‚\Ã3\œtSöà\«\‹˝{\œ=˜lêÆ°í\◊\Ë6&K\È_c?Ú\»#\Œ\ﬁR\Óè\“\Œ‹¥ï¯K?\—\Œx&Éß>$ª\Ó{ò˚|\Ëº\„\Ó\÷uü\√\Ï≠\«\Ó≥G.8¡\÷j\ﬂ¡>ˇ_Ò|\«\—kç4%@\Ã|\Â9{\‰ˇé≤±?\‡\“\‹]z\È•ıﬂõ52ôaSL\0\"\≈¡\≈5@\0U Ä\0Q\»@\0°êÇ)Æ\⁄\›\\\ \√h\›\œ\ÿs\œ=\Á6Ûù¨Çô\⁄¿øÛ\Œ;ùCá≠Øq\–A\ŸE]\…\Î_|±ªî˛;v\Ïh/ΩÙí Jπ?J;£Úó~Ãà\ÀwuU\“\ƒA-\ﬂ€¨ãÛ´\Àn\ÿ\Œ\'uˇ˛p\ D{z\ƒyˆ\—\‘\‹˚¸ä+Æ∞O>˘\ƒ\’Y{\Ìµ\Ì\‰ìOv˜\’2~\ÓßtíÛ\◊K,^∞`Åmª\Ì∂ÆFO.7}é\Ô∏\„é\rÑa˝=\Ï\Îã$sHJº$@ú\≈\€¯≠ı&m∞eè˙\ƒ\Á≥g\’n!¿»ô!P öè\"‘ôô8\n@ 4à\–\»h\0@\01†uÃÄ£\Í>\Ã\√\Ë9\Áúc#Fåp)ó!b\›u◊µ\œ?ˇ<*säˆ\Êà\n)òb@†,•>¥(\rÕ≥\œ>k\ﬂ~˚≠u\Í\‘\…\ﬁ~˚m7û6s\œ>˚l˜\ÔUVY≈æ¯\‚^\œ\„†\”h-Z¥p\ÈÒÇ\œf∏\’nûà˝yøø\⁄Z≠æ\÷wÛ∂ux\Î? \ ˙°Q•¬¨˘*ãˆÄ\0 ê>•Æ\Â}Ú<\Ã>ÉO~a+ \0Å¨@Ä$\“\Â<å\Ê\nrÛÚ\À/∑3\Œ8#Vè\√, b\rùC†li|h)\r3A†\‘LúÄ\»\ƒt®πì\Â¨˘jn4@\0Ä@b§q-fü!1Å¿@\0®\'Ä\0\·\…d®\‰aTBƒïW^iõm∂ôMü>=Vè\√, b\rùC†li|h)\r3A\0\"aˆ\∆\…J\÷|\ﬁ8â°Ä\0 Å4Æ\Â\√\Ï3\ƒñé!\0@†le£´nC_F\√, ™;á\r•H\„CK©æs_6	 @d3\ÓIı⁄ó5_R˘a \0Å¨H\„Z>\Ã>C\÷\„èˇÄ\0íH\0\"âQ)`ì/£aûL>\Ã\ÃÅ4>¥d.à8ä\0D(\\\‹3_\÷|1c†{@\0(ì@\Z\◊Úaˆ\ \ƒF3@\0àë\0Dåp£\Ï⁄óá\—0à(g}A :i|hâé=•ë\0D\Z£\ÍØOæ¨˘¸%å\ÂÄ\0\“M çk˘0˚\Èé.\ﬁA\0ì\0Ñ\'qÛ\Âa4\Ã\¬\0¬ì…áôô#ê∆áñ\ÃáC@ÄÖãõc&\‡Àö/ft@\0eH\„Z>\Ã>Cô\ÿh@\01ò2sÆ\ÎΩg\«v1é]\◊Q|Ô®èffVWWWùe1˜\‰\À\√hò\0!@\ƒ<i\ËeH\„CKô(hñ	¥\'n˙≤\ÊÛ\'fB\0\»Å4Æ\Â\√\Ï3d.\‡8@\0ëà\‚{\"Ú∞¸∑\√0BÄà1t\rÅ\n§Ò°•4\Õ\0à\Ÿ# <\n¶B\0H Å4Æ\Â\√\Ï3$0$ò@\0ûà\‚{\"∆†á	DåÅ†kT@ ç-\‡†i @d \»πà\0\·Q∞0Ä@	§q-fü!Å!¡$@\0ô\'@\n&O¶Ä/£aûL>\Ã\ÃÅ4>¥d.à8ä\0D(\\\‹3_\÷|1c†{@\0(ì@\Z\◊Úaˆ\ \ƒF3@\0àë\0E®cÑe◊æ<åÜY @D9C\Ë\—H\„CKtt\Ë)ç \“U}Úe\Õ\Á/a,á\0 êni\\Àá\ŸgHwtÒÄÄü <âõ/£aûL>\Ã\ÃÅ4>¥d.à8ä\0D(\\\‹3_\÷|1c†{@\0(ì@\Z\◊Úaˆ\ \ƒF3@\0àë\0Dåp£\Ï⁄óá\—0à(g}A :i|hâé=•ë@ @¸†oø¢\ÓΩÒ\‡mˆ˘\ÏYitüF¿ó5_¬∞a \0¸á@\Z\◊ÚaˆòÄ\0 ê<…ãIAã|y\r≥0(&@\»◊ßü~\⁄q\Ë€∑Øç7\Œ˝õ\◊\·¿|®\Œ˚B\Ô∑!Ø,t\ÔªQ\«\ÌeN\Ô˛\›i\€>6\‡\Ê\«lxè\’\›{3K\ÔS˘˚\Ã3\œ$˛s)*;£\Íß\ÿ\ÁvT˝G\’\œˇ¸\œˇ\ÿÙ\È\”]|\◊Yg˚˛ñ[Ÿ¨/æ≤Eœ∞/ø¸≤˛ı˘Û\Áóı}ïùæå\€\Œ,¨\÷ﬁ®ìùÙ\Ë\€?á7\Ÿv\'k1m¢˚[ñ>á≥w\÷9\’Y\Á¿\Ÿ_\ŒQ}üF\’O\‹\ﬂwï\ÿ¨\€≠Áµ∂Ø´´s\Î˘(÷∑QıSåg«é\Ì£è>≤ç7\ﬁ\ÿfŒú\È\…fB\0Ä@.O\ÊCñOBÇôH-Å4˛j*µ¡¬±XL˝\ËS˚\„¯©v\„\·ª\≈\“?ùB†1æ¨˘à\" \0$ì@\Z\◊Úa~\ËòÃ®` \0Ål@Ä$˛æ<åÜYêÇ…ì…áôô#ê∆áñ\Ãá+\"Ä\0Q>\ZWH¿ó5_Ön\“Ä\0b\"ê∆µ|ò}Üò∞\“- \0T@\0¢x\’l\Í\À\√hòÖD5gcA†ti|h)\›{ÓÑÄ≥†ñ|YÛ’ícC\0Ä@qi\\Àá\Ÿg`n@\0Ä@ÚLô9\◊’≥cª\‰W¿¢(æw\‘G33•=¨Û\¬i\È\À\√hò\0!@x3˝04c\“¯–í±\‚nÖ *HÛä¯≤\Ê´\»I\ZC\0Ä@l“∏ñ≥\œX:Ü\0 \0Å\Ãà\‚{\"\∆\È&@1ÇÆ!PÅ4>¥TÄÉ¶$0{¡Bõ<céı\Î\÷9É\ﬁ\„r≠	 @\‘:å@¿oi\\Àá\Ÿg;zX@\0I \≈˜Dåë àA\◊®Ä@\ZZ*¿AS@\0U%Ä\0QU\‹@ u“∏ñ≥œê∫Ä\‚ \0Å ì\'AÙ\Âa4\Ã\¬\0¬ì…áôô#ê∆áñ\Ãá!\0o	¯≤\ÊÛ0ÜC\0H9Å4Æ\Â\√\Ï3§<º∏@¿K°ˆ$læ<åÜY @x2˘03s\“¯–íπ \‚pEH¡T>\ZWH¿ó5_Ön\“Ä\0b\"ê∆µ|ò}Üò∞\“- \0T@\0¢x\’l\Í\À\√hòÖD5gcA†ti|h)\›{ÓÑÄE®ôµ$\‡ÀöØñåÄ\0äH\„Z>\Ã>sÄ\0íG\0\"y1)hë/£aûL>\Ã\ÃÅ4>¥d.à8\\àä—∏Bæ¨˘*tì\ÊûX≤dâ]x\·ÖŒãÛ\œ?\ﬂZµjU\Ô\—7\ﬂ|c7\›tì]}ı\’\Óµ\”O?›é?˛xk”¶ç\Á^c>¸ ê∆µ|ò}?¢ÑïÄ\0≤E\0¬ìx˚Ú0\ZfaÄ\0\·\…\‰\√\Ã\ÃH\„CKÊÇà\√@Ä®ç+$\‡ÀöØB73\€|\ÊÃôv\—E\Ÿ˝˜\ﬂokÆπ¶\r0¿~˝\Î_\€z\Î≠◊Ä\…¬Ö\Ì\‰ìO∂\€oø›ΩÆ{|A\€u\◊]¡Æò\0±l\Ÿ2ªÍ™´¨[∑n∂\«{8õo∏\·˜ø-∂\ÿ\"∂c\“N çk˘0˚iè/˛A\0ë\0Ñ\'QÛ\Âa4\Ã\¬\0¬ì…áôô#ê∆áñ\Ãá+\"Ä\0Q>\ZWH¿ó5_Önf≤˘ßü~jw\‹qáı\Ô\ﬂ\ﬂ6\ÿ`õ<y≤ùr\ )∂\Õ6\€\ÿ\Ôˇ{[}ı\’\Îπ<ı\‘Sv¿\ÿW_}\Â^\€m∑\›\Ï\Œ;\Ô¥\r7‹∞&\Ï¸q\€t\”M≠Kó.çéˇ\Œ;\ÔÿØ~ı+1bDì˜\÷\ƒÖ@§q-fü!!\∆E@\0\ﬁ@Ä$dæ<åÜY @x2˘03s\“¯–íπ \‚pE *\¬G\„\n	¯≤\Ê´\–\ÕL6ü4iím≤\…&÷Æ]ªzˇ«ék\«{¨˝\ÌosBÑÆ≈ãªÙF*∂\⁄j´ö≥RJ%•YíùM	\'N¥ìN:\…Fè\›\‰Ω5w êRi\\Àá\ŸgHiXqÄÄ\◊ <	ü/£aûL>\Ã\ÃÅ4>¥d.à8\\àä—∏Bæ¨˘*tì\Êˇ!†\ZÆª\Ó:\€~˚\Ì›´ØΩˆöKÕ¥˘\Êõ\€\‡¡ÉMsb\’UW≠	≥∫∫:ª\Áû{\\Z•ªÔæªIQ\·Ø˝´ùw\ﬁy5âÉB\‡;i\\Àá\Ÿg`@\0Ä@ÚLô9\◊’≥\„àì<+ˇkQ\ﬂ;Í£ôô\’iA\Ì\À\Â\À\√hò\0!@¯2˚∞3k\“¯–íµ\‚oe *\„G\Î\ ¯≤\Ê´\ÃKZ$6\ËtÅj$(Ω\“Ú\Â\À\›\È’âÆÅ⁄ïW^im€∂≠\Ì\Ôˇª˝\Ê7øqiô∂\ﬁzÎïÄ\Í≈∏q\„úxpˆ\Ÿg\€ÎØøn√áw˜]˝ı÷ßOü˙6|Å˚[°∫J•\Zü˛πªø{˜\ÓN\\PAi˝M≈ß\œ9\Áõ7oûRî™)∏t\Ô\Œ;\Ô\Ï\“1\Â∂\’)\nâYtMò0¡zıÍµí:yqÛ\Õ7;6¸±|¡éM«é\Ì\√?¨_c(\Ì\”\œ˛swœ®Q£ú]πØ\À’ßx\‡Å\Ï\⁄kØµ_|\—\’\”2dàx¥ˆ)÷ß⁄∂h—ÇIo§q-fü¡õ@a( \0$ñ@\ﬂ;1Ü7LÄ b]C†i|h©\0M3H`ˆÇÖ6y\∆\Î◊≠sΩ\«\ÂZ@Ä®u™;˛-∑\‹\‚N7hÛ^ﬂø¡ıı\◊_€´Øæ\Í6\ﬂ%\"úq\∆v\…%ó‘üÑhJÄPj\'±\÷\∆˘	\'ú`á~∏+t≠\r¸\È”ß€ü˛Ù\'[{\Ìµ\Ì\Ì∑ﬂ∂≥\Œ:\À\Œ=˜\\˚\…O~b\Ôøˇæù~˙\È∂\⁄j´\Ÿ»ë#m\›u◊µ¸¥J_~˘•%\Óª\Ô>\◊v\Ë–°ıvKX∏¸Ú\À\ÎO@Hë ª\ﬂ˝\Œ˘§ô\n\“:I\\Q¡\Í¸K\Ìt*dø˝ˆ≥¸\‡∂h\—\"\'¬àâ˙íhÛ\»#è8Cu4^y\ÂSä´O>˘\ƒ\ƒ&˜uâ/≤Ò¯É-X∞¿	&´¨≤ä≥Î∑ø˝≠\›t\”M∂\”N;π\‘Q˘}™≠òI\–\‡ÇÄ/“∏ñ≥\œ\‡Kú∞Ä\0íK ä\Ôà\„&@1ÇÆ!PÅ4>¥TÄÉ¶Ä\0™J\0¢™∏k:ÿ¨Y≥\Ï\÷[ouõ˘π®sç\“Fº\“\È\‘Aÿ∫\nÖ\Í1H ∏˝ˆ\€\Ì\œ˛sΩ °ì:q¸\ ˇ\Ÿgüµ\√;\Ã	\0x\‡JÑÏìÄ °¢Cáç\n∫w\·¬ÖN\—\…	\ZÁ•ó^rß%t°\–ÈÇó_~ŸârØ5\◊\\”ûx\‚	wC\„KºQ\Ô EU`W˛\Îoæ˘¶¸Òˆ\«?˛\—~Ù£π.É{\ÁŒùkÇZ∑n]∞œöNá@“∏ñ≥\œP2ö@\0Ä@\ÃH¡3‡®∫˜\Âa4\Ã\¬\0\"™\ŸA?àñ@\ZZ¢%DoÄ\0\‚#\‡Àö/>\Ÿ\ËYõÚ:\›p\‰ëGZ˚ˆ\ÌuZ\‰\«wúK•T(UQ±\∆\≈à\‡Ñ\¬˜æ˜=wÚB}\Êûb¯Ù\”O\Ìà#épßÙz°~\¬≤O¢¡ôgû\ÈNAl±\≈.\Â”û{\Ó\ÈN]∫$∂(Ö\‘\’W_\Ì\“=\Â_\≈\∆kóRXOßNù\nä*Ÿòëxô&i\\Àá\ŸgHS,ÒÄ@ZPÑ⁄ìH˙Ú0\ZfaÄ\0\·\…\‰\√\Ã\ÃH\„CKÊÇà\√ SE¯h\\!_\÷|∫ô\È\Ê:q†\⁄}˚ˆµ-∑‹≤I\⁄T\◊IÅcé9¶˛\◊˚M62+(\‰¶H\nø\÷…Ñ TP\œA5˛\Ôˇ˛/B©èî*iìM6qbäN-\\|Ò\≈.\rT°Kv*îNjlºÒ∆ëJ\›Ùóø¸\≈	 ¡•q$r\‹{\ÔΩ\Ó4G°S•∞\Ê$â@\Z\◊ÚaˆílÅ\0 \0Å\Ô @x2|y\r≥0@ÄdÚaf\Ê§Ò°%sA\ƒ\·äPÑ∫\"|4Æê@9k>•©QcÆ\‰ê¯†t?Ω{˜∂≠∂\⁄\ ¨\”\⁄\0W\ÂBÚÛ\Á\œwÇÖ6ù(\ÊuS\' 6\€l3W\»Zut òC*¯¨\Z\n™°B\ÕQúÄêç¡)à~˝˙\Ÿ\Êõon\«{l—Ä)ò$\“H®ê≠Zü<ı\‘SÆ.ÖÑõBbA±AJ5ï;ÆDé^x¡•õjﬁº9DÚ\ﬂBXXÅ4Æ\Â\√\Ï3îÄà[ \0@†\  ™º\‹\·\ y-w¨J⁄ÖY @TB∫¥∂*‘ßÇz\◊_ΩmΩı\÷\r\Z\Èo√Ü\r≥|\–8\‡\0;\ÔºÛV∫ß¥Q∏+m\“¯–í\‘Õú9\”˝ÙWø˙ï\Ì≥\œ>\r\Ã\‘\ﬂÙã\‘1c∆∏˜\Ê\\`˙.\»-RöTø|∑\¬˜˙mò5üÑ•\ ?~º)oˇé;\Ó\Ë∑Û)∑^ıÆΩˆZ∑°˛\’W_5V\„\⁄ˇ¸Û\œM§ïû®m€∂Æ\¬w\‹\·\÷j]∫t©o£ÙDßûz™Ú\◊x¡M\ÍG˜(ùQè=¨ÆÆ\Œı•îC:Y–µkW{\Ìµ\◊\\\Z®ü˝\ÏgÆÖj\'Ëû©Sß∫S\n™M°\Õ{•jRΩ\n]ÎØøæm∞¡nç©5V¨Xa∑\›võÛ1\Ë?\◊I	)É∂?¸–•bí®PÏíê†îSrØüˇ¸\Á\ÓdDÀñ-\Ì¥\”N´Ø+|7äk°◊É:™;°gê†\‡∂\“BI\»\–ièbmS>-q/Ö“∏ñ≥œê¬ê\‚ \0\Ô	 @x\¬0£µt)\Ã\¬ ©ÑP¥\·\'˚^|ÒE˜\À/{\œ\›¯\”î~=•\Õ˚¸Kõ˙πytkèb\ƒ\€oøm7\ﬁx£]x\·Öˆ\Ì∑ﬂ∫\ﬁŒù;ªcˆ˙ıW∂	$˝°E(\⁄xQ˛h˝rª\Ì∂sõ\r˙\Â®6$Ú/m¯\Ë~mú\Ë˛#F∏çî$\\\≈à9s\Ê8Åús\ŒqøÙº\Ï≤\ÀLü;\ \€]¨Pi¸Iã\riâ§ü~î≤\Ê[˛\⁄8k’™ï=˝Ù\”ıN\ÍW\Í…ç˘í%K\‹F}±5¢N\Ïæ˚\Ó¶ÙGZói£ç6≤£è>⁄≠9%F\‰^ˇ˚\ﬂ\›\ÈÖbÑR\ÈCpMò0¡˛˘\œ∫ú‰æ¶˙Z/\Í;ı±\«sc˛Úóø¥AÉ\’\ﬂËÑÜl\“\ﬂ/ΩÙR\Î”ßè\Î[õ˘∫$*\»/\Ÿº¶\◊%¢\»â¡•HoºÒF}1\Í\∆\"&A@E£U+Cˇ>Ë†É\‹8´≠∂ö˚\◊XJ\È$ÒDv-Z¥®\‡\Î¡©â\Z:I¢˛t\ cØΩˆr%\ŒH¯)\‘gò\'…ù}Xñ5I_Àóè0˚\ÂÙO@\0àó\0Dº|#ÎΩîá\—\”&∫M∂Z^aI z\Ë![eïU\‹Cì6.µ\·w˚\Ì∑ª_É\È\◊Q∫^z\È%˜∞£_•\Â^kÆπ¶%$ZT˚\“\Ê\‰_ˇ˙W;Í®£\ZZõ∑ó\\râ˚\\RÑíj≥bº\∆	$˝°\Â˘Áü∑˜\ﬁ{\œ	\ÃFç\Z\ÂDB\Âp>¸\√ú–ÜÇ\Ê˘ø˛ı/˜+Pm\Œ\À7˜º\–\ÁâRlr\»!M¶\––Üç~\—\\¨¯f‹∂fΩà¨œÄ\⁄˙\ﬂÿöo\…¬Ø\Ïæ\”±ìüm`§>∑µ¡å\0Q\€\ÿ1z\„ñ/_\ﬁdÒiB\0ïH˙Zæ\√\Ï3î\”?m \0@ ^ÒÚç¨wà\»P6\⁄—ó_~Èé¢\Îó]¡•\◊tƒº]ªv\ÓW\»\'¥9ÿ≥gOó68Ú-1Bù:B_ã<\ÃJΩ†_?\ÍCcW±‹∏\’!\Ã(>HÚCã~A™πÆ\œ\ƒ-Z8ú:µ§_fæˇ˛˚ˆß?˝©^`\–)\Â\ÀVém•q®ıØ\ﬂy\Áó˜[\'èö≤Eü#≥f\ÕBÄ®\—¢F\‡\÷(¥\Êì\‚®?\ÿÛ∑^au+V\ÿÚeK\–BÄ`Ú¯@` î)\Ó4¢äAsöœáàa£Øíºñ/ó)Dπ\‰h@  íá&≠@ÄhQ¨7h3pˆ\Ï\Ÿv\ÂïW:b¡Ç.-J\Ó•\‘./î\n¶\⁄9⁄µ—™\„\Ô\€l≥Mìß\Z$®\ËX˝è~Ù£&\Ôç*ù\'ñÄè-ïO˙Æª\Ór\ÔM˝\ R9ÆßOü\Ó6ÒkΩ—°ÙAdWSß\Z$≤(%ÑRI4uob\'ë\ÁÜ!@x@\œ\Õ\œ]Û\Â\n\ÕZ¥∞•\ﬂ,*\ËÑ\ÁAO±˘™˜†\Z\œ<ÛåKóî{¢8\≈n\„\ZjJ¿«µ|S¿ ö\"\ƒ\ﬂ!\0$õ¿îôsùÅ=;∂K∂°ˇ±.ä\Ôı\—\ÃLh\ÍºpZF\"@\‘.T\⁄0\‘…Ü\Õ7\ﬂ\‹\Â∂-t\È˝™π_ø~Æ®ù.â\'ü|r}q<\ÂjŒøÙP¶1˝ME$Upˆ\—Guyuïˇ=\ÿ4U\Íñx¿ıÀØK°ì˙ï∑˛\\j´\ÕN•\‰“¶¨\“”®pa~>`›Ø\‚∑z(T±A]A\r\Â r\·J\‹(∂öõ7x\”M7uc)5éò\„k•∂zÚ\…\'\›/‘ï˜^vÂæÆ\∆?¯¡\ÏÉ>p\«Û\Ôøˇ~SJ+±PQ\ƒı\÷[œ•\ƒ*\‘g–∂v≥$]#˚¯–¢Çî:1†˜êNFº˘\Êõ.ô\Êé\Ê]P\»Y˘∑∑\ﬂ~{0mÙ\Î}´˘®\"ók≠µ\÷JÅ\‘˚@su∆å.ÖìrQ´~\ \ﬁ{\Ô\Ì\…ˆ\Ì€ª6*º©\‹\⁄:%ï_óBuV\Œ:\Î,\◊.∏ÙûR{âñz˝ÑN∞v\ÿ¡ùb\Í›ªw;\‰á|ì∫Ç˜£˛≠¬ôÚΩPû\Ì†˘\'5xO©\ÕÒ\«\Ô\nç\ÍÛD\„\Î≥M\ÃÙ£¸ÿ™•ëˇ∫No(W¯ßü~\Í\ÓS\Í´‹ú\‹;vt\nı¥ıÂùÇ\0\·K§\“iß\÷|K6ˇ±µX•ï;Ò–ò@ÄH\Á\\HÉW˙\Œ\–:ı≠∑\ﬁriM˜\ÿcè™ˇP\'\rÒa¯∏ño ø(6Çö\ZÉøC\0Ä\0rüØ*\’\r búOaI≠ëèG¸⁄î\◊\∆\ÊlPêû6\'µÒ®ˇ˘\Âõ tAõ£˜\›wü+Çß4O\⁄\‹”Ü§6\›\’\◊O˙Só^Fï\ÍOiuCø˝\Ìo\Ì¶õn≤˝˜\ﬂ\ﬂ\n•U\Z;v¨@¥â?zÙh\'@\Ë\nÑç‘ÄP\Í\Zâ[l±Ö+\‚ß1t)\’\Õs\œ=\Á69µYôMû<\ŸŸ´º˚˙ªDå\„é;\Œ\Œ<ÛL˜\ﬂ˙çØ_sˇ¯\«?vir$\–\\˝ı+ΩÆ{\‘Fµ¡}≤Kc´ÿ†6YUl≥Püjªı\÷[\«8≥≥’µo-:] \·Kõ¯Jã¶Kbõ6:$8\Ï≤\À.n£\\ÛJ\ÈtJBbWSÑ˛Æ˜æDám∑\›\÷ıØ˜™6STtø˝ˆsÛS_J)$<\\|Ò≈ÆP®\ﬁ\⁄p\—\ﬂı\ﬁ\”¸¥J\Ô$Lö4\…\Ân\◊{RW~÷ø\·Oc\ ~}HXgùu‹ΩJ\Î§œÅ.∏¿ΩßÚ/	z\'u\ÍI\◊\À.’≥\Ÿißù\‹˚ıı\◊_w¢\√nª\ÌfW\\qÖ}ˇ˚\ﬂw)2Ú_ó\Ë\"j/qr\ﬂ}˜u,ÙŸ®ç%}.\Èø%fj´˚}πf/XhìgÃ±~ π\Ì<\0\0 \0IDAT\›:˚b2v¶àÄàóﬂûn\ÁÕ±ÀñÖˆL\"¶j\»\ËR_A°\Íæ}˚\÷\◊\n\„ı\Ôj¶¡º/æ+dátq–∫≥\œ	\Á\⁄¯/qÒ’ø˚Rˇ}2º\«\Ín˝\Í\”fü¡\'ø∞Ä\0íI ä\Ôàc&@>Zò\È\◊ı˙ePÄ∫>mi\„MøLsÅ@\'\"td]øJ\÷&•6Aï6IW\–n\Ó‹π.ß|\Î÷≠\›Fgá\Z§U“Ø©%l4%@®Omû™m§*gæN\Ë\◊\·\⁄h\‘\Á_Aömê\Ê_\'ûx¢M^~˘e˚˘\œ\ÓN?\'CtØ\Ï\ =8E\"¡EµA~â ávò˚Ö˙ÅX∞m\Ê\‹\€4\ﬂà¸\„ˆ\Ÿgüπy§?+TC\·\ﬂˇ˛∑\À=ÙP7\◊KΩÚ˚\n\ﬁ$µ˘ÆÙlzØ\Í\‘\—\Óª\Ô\Ó∫\’|ñ¯Ò\√ª˜\‘fõm∂í\0°˚$ \»ârç	∫Wü≤_\Ô9∫\◊\Áì>GıπP¨Ω\Óï–ôIê£\œç\ﬁy\Áπ˜WpvÂøÆ\œùò\nD\ƒ\\\ƒ@\\\ﬂ}˜›Ç}ñ õ˚ êuúÄ\»˙¿@\0ïm-_ä∑aˆJ\Èè{ \0@†∫H¡T]\ﬁeèF\n¶≤\—U\‘Põﬂ™Ø†îB\≈\Í:4µQﬂòç	¡	Ö\‡ó‹π\"Ç˙î0¢˜zΩSßN˙eµ~Ÿ¨¸º\⁄Tù6mö˚π˛]\ËÙ\√¸˘Ûm\‡¿ÅÆ\Ëu∞qö\Ôk!D˜ÑF$\ÏHå—Øµub£Xüö\∆\r¯Ù\–Úˆ\€oª_˜\Íó¸J\\Öàr∞ 4ñ6¯u™Bø8\Œ=≈†ø\ÈÛC\¬ez!õ\¬\ÁÙ~¸¯„èù ß˜¨NJ\ÈÙC~M\ZçØ\‘OgúqÜ\Ì∏\„éNH,t\Z_˜Ö±Kµ*îûJ¢°x(µ\\æ®\¬[(ù\05 Jg≈ùÄ\0 ∞2ü\÷Ú•\∆¢TR\‹@ ô(BùÃ∏¨dDıUlc3\ﬂm\‘\›p\√\rÆnA\ÿB∑•\nø˚\›\Ô\Ï/˘ãKë\\¥\Ÿw\ÔΩ˜∫ìïûÄPøO<ÒÑKq§_lk\”t\√\r7ti†\n]¡I\r•ÄRjöBM9ÑÚÛkì5\Ë/Gπ; \‚/¯Ú\–\"qPBúN\‹\‰ø˜îJL\Ô\·\‹_\Í\«-@\ËdÄÑ≤\‡\“\\U\⁄\"ΩØ4Ø+ \‘oê¢M\Ô}\’[x\„ç7äû\Ê¸UZ∏K.π§Å@\ÿXé\0°\”™°\‘h∫Çq$@\Ë\‰ìR\“˘.@êÇ)˛\œF(N†–ö/∑u›ä∂|\Ÿ\“PÇ@\0_\÷Úa\"Ü\0Ü˜B\0Hà\‰≈§†E\’\rî6\ÂÙ´j\Ây◊Øˇï\Í‰•ó^ry\‰ï\'=˜RJ˝˙87}I©÷ñ\"@(çër\ÕkÛ2∑∂j\"º\¬\Óó\–Õõ7èDÄNA®(∂~MÆÙ+!\n]A\n&•üR\ﬁ˚É:\»⁄¥i\„~ï-±D\ÈXî\€>?î˙*$\"˝)wº6ïÉqıko\’\ƒP˛{•ôAÄ(uvïü-$\¬\È\‰CP˚\‡Ω˜\ﬁssNiäÙ~ï0°ZA\Í2ΩUEs≥X ¢B‘ö:°4F:•£>É\"\ÿ\ÍG©°îÜ)ò\œQ¡)•9Z˝ı›©•B)\“?$T\»&Ωóï\ MÖ∂\’\«\Ì∑\ﬂ\Ó“†)}T!±†ò0°˛T/BµkÇq\≈U\ÔsâÑ˙å*÷∂¸Y˝ñ°Æ>sF¸/Å\∆\÷|\"\Ó;\Ìõ1˘\Ÿ\» òAÄ\0 a-6Zaâq? \0Åd@ÄHV<äZÉ\0QΩ@)œ∫j9h£;˜\ÍﬁΩ{ÉZ\n˙õä\ﬂjcOõö\ Òû{\Èo:ï†Ç¥\⁄\0‘¶~˛•B\‘⁄∏\”	Ü\‡\ \⁄XU∫îv\ÿ¡\’`–Øúµq˘¯„èª|Ô™•†\‚\Ã:©†˛µ\Èl\ﬁ/]∫\‘\Ÿ#ÒDÇà~y≠\r¡\‹\Z\⁄\–\◊l–øƒã\‹K9\ÎïZIi]\‘±\‘Sj#F≤Uøx.m+∑ºNFå7Œ•f\…?ΩQ\Ïu˝∫[∂˝\Ïg?sy\Î%˛\‹q\«Æ∏µ6rı+˜bm´7C\“?R\“ZfÕö\Â\Ê¶6¡s/\Õ=VJ∞†ñà\Í>h\ÓH$Tëd\Õ%ù(íX¶_Ú\Î}\'\·BBû6\ÁÛ/ı#ÒKc\Í4ÖNh\√˝¥\”Ns∑\Í=π\∆\Zk8°C˝\ÍÄN=(Eôä£Kîê \"¶⁄ºWZ&\’s\—{G≠Éz	J•àò˙\\\ﬁ{\Í?ø∏¥äø+-ú\ﬁcÚ≠Pä¥¿è\È”ßª˜Ûã/æ\ÿ¿5ı´\‚\ÿ˙ºìx\"ˇsOo\ËdE°\◊ı˘q\Ã1«∏Tm˙|jﬂæΩ=Ú\»#é\Ì˛˜\ﬂ\≈\⁄˙Ù\ŒAÄ)ZÈ≥µî5\ﬂÚ\◊∆πuEP`:¯NV\ 5.@\0\»6Å§Ø\ÂÀâD9\‘h@ 9 íãF-)\Âa¥≈¥âns∂ñWòÖAãPk3N\Í⁄§Ãø¥âóõ\ŒE\◊˝JW§Mˇ|ÅA\'$Lt\Ïÿ±†\0§í∞†K¢áR\È\‘E0æ^ä<\ÎW\«Jı§\r@m\\js≥GèıÅ66ıgmæj3S\‚ÉNóR*}¡\r^\”ﬂ¥qòõ^vI4P∫£\∆~Y≠∂:¢çMm\‚jrª\Ì∂s≥\⁄Umä`¸n›∫ôNlHÙ–Ø\÷Ω\ÿ˘Í´Ø∫tVè=ˆòm¥\—Fˆ\À_˛\“\r\Z\‰ƒá¶\⁄\÷r\Óßi\Ï$?¥h˛\Î}°˘ñı\Ì\€\◊\Õ\Õ]:at\”M7’øát\"BÛ)\ÿ–ópßMÙô3g ÇJöª∫ˆ\‹sO1bÑ€∏ﬁ∑zMcJò3få$Ùûê†˜\Ë.ª\Ï\‚N(\È\“\…\0	ÇCTøE\'\'T;\"∏Ù^T¡˚\‹\◊Ù∑a√Ü5(.Ø\⁄gùuñ\ÍJ9\…!Bßî|A\«Ftr$®]°1∂\‹rK˜9¶B\ﬁGr_\Ï/â¢˜\ﬂøc©˜≥>3$∂6\’÷ó˜	Ñ/ëJßùa\÷|ü|Úâ«è\ÔNàt\Œ	ºÇ\0 Ü@í\◊Úa¸»Ω7\Ã>Cπc\–Ä\0\‚#Ä\0\€H{Û0\Z\È¿!;≥0H¢\0\“\›T\ﬁ.Q•±\‚”©t\Zß\ZH\„CKöB¨\r\«∆äOß\…\◊Z˘Ç\0Q+Úå+\Â¨˘ÙπP,e\"T!\0@ [“∏ñ≥œê≠h\„- \0? @¯ß≤Fk\·ZòÖD-\"\‘¯òã/vø∂÷Ø∂K˘euÚ<¿¢(§Ò°%\n.I\ËC)\Ÿt\ZJ5Zrk\¬$¡∂4ŸÄ\0ë¶h˙\ÁK9Ñ^b1 \0\ƒE çk˘0˚qq•_@\0(ü\0D˘\Ï™\⁄“óá\—0à™N°FS˛w≥’•Ù,AΩÖ\‰Xà%\’$P\ÓCø¿ç/Jè>˙®´%°˙™˝†¥P™∑¿àx∏\“ki|YÛï\Ê\rwA\0Ä@µ	îªñØ∂ùa\∆≥\œ¶_\ÓÖ\0 \0Å\Íò2sÆ®g\«v\’∞\¬Q¢¯\ﬁQÕæK__W°9\’kı\√\Ë/º`\€oø}\‰Ñ	D\‰¯\À\ÓP\≈|ï\√]µT|zΩı\÷+ª/\Z˙O \ÏC9\»„èπj+\Ë\ƒC˜\Ó›ù@®\"\–\\Ò@Äàè-=7M \Í5_\”#r \0§â@ÿµºæá\Ÿg¡lÑ\0 \0Ådà\‚{\'\”Ñ\n\ﬁ{ÔΩÆ(\Í≤e\À\"èvò\0!@Déü!	ÅRZ\·\·ÈßüÆW\ÂAç$tRC≥,¥\…3\ÊXønùkhCgï\0DV#è\ﬂÄ\0¢!P\ÍZ>ö—™\”Kò}Ü\ÍX\ƒ(Ä\0 êfQ|\ÔdRÄê0zÙhS˛p]J∑3bƒà\»\ÁJò\0!@Déü!	ÅRZ˙ˆ\Ìkπ¬ÉVª	& @D:Å\0≤J\0\"´ë\«o@\0\—(e-\ÔS6à\‡9\√7õ£â&Ω@\0HR0y\«rFÛÖπ€™U+S±\·8.à8®\“\'™K†\ÿC\À◊ü~b˘ÖÕò¸lAÉ ™\'FÉ\0\“I†\‹5_:i\‡ \0Ñ%Ä\0ñ˜C\0Ä@\‹(B7\·à˙/\ÁaTB\√“•KW≤@\ÈóZ∑nm.tSq\”C9\ƒ˝[EM\ﬂˇ˝≤_\Ô◊Øü≠∂\⁄j%ı3x`ª˘Êõ≠Mõ6%\›•ùQ˘K?\—\Œx&É\Á¢Eãl\»+\ﬂ}>¸k¸cˆ¿\ŸlŸí%V∑by£üh}\‡\”M\Õ	êÇ©\Ê!»¥\Â¨˘2\r\Á!\0@†& \0$ç\0D\“\"RƒûrF˜\Ÿg7nú;\Ìê{\\QÜØΩˆZ0`Ä\Ì≥\œ>≥\«{\Ã˝{\›u◊µ}˜›∑\Ï\◊€∂mkw\›uWI˝>\‹.π\‰9rdI˜GigT˛\“O¥Ûû\…\‡9p\‡@\'@\Ë\ƒ√Ég¥ôØ>_\“\'%DIò∏\…°ˆ H)6±ú5_äq\‡\Z \0Ñ$†5˘~\√n*\⁄\Ío\Á\ﬂ` d˜5π=L¶Öö»†Ä\0 \–(O&H%£\Áúsé´˜ê+D<Ù\–C∂ˇ˛˚G\Ó}òÖ5 \"\«OáàÑ@´©+zµ∑%ãæ.´\œﬁΩ{\€¯Ò\„][}~ı\"T;B\¬(Ø\√As ©ÛA\ƒ\ﬁ{\Ïfüº˝öõ´Iµì˜Q:\ﬂGÎ¨≥éu;\Ï$\Î3xH¡\œ\ﬂÒ#á[ãi\Î?K\À˙ê¶ \0§ñ¿\Ê[n\’¿∑œæ˛∆æ∑FõØ˝\Î\Ì7ΩÚ?\Ã>ÉWéa, \0Åå@Ä$–ïÅãÅÒ\Ì∑\ﬂ⁄ökÆi,à\‹˚0à\»Ò\”!\"!M\’|\»åë‡ßì\‡DÇêa¢XÛeÆC\0Ä@Å.ø«û?\ÎpØπÑ\Ÿg\⁄Qåá\0 êRû6 á\—SN9\≈\ﬁ{\Ô=;vl\‰ﬁáY @Déü!	Å¸º±•\në‡ßì@ÄH@2lBîkæc\ƒu@\0¯m˙\Í\’\’kaˆºv\„!\0§î\0Ñ\'Åı\Âa4\Ã\¬\0¬ì…áôô#P¨p]SBD\Ê¶JjFÄHmhΩpÃó5ü01Ä\0RA \Ã>C*\∆	@\0)#Ä\0\·I@}y\r≥0@ÄdÚaf\Ê \√{¨\Ór\‚uÇ\◊ 27UR\Î0DjC\ÎÖcæ¨˘ºÄâëÄ\0 ê\naˆR\·0N@\0HÅ)3\Á:èzvl\ÁÖgQ|Ô®èffVWWW\ÁÖ\”2“óá\—0BÄf˙ah\∆î\"@\ËÛÛìO>±#é8¢Å1q\‚D\€q\«3Fw\”F\0\"mı\À_\÷|~Q\≈Z@\0\Ÿ%@\n¶\Ï\∆\œ!\0@†<aˆ∑ãçÄ\0Q˚íZÖ	DIHπ	U\'P™\0\„«è∑gü}¢\Íc¿®	\Ã^∞\–&œòc˝∫ué∫k˙É@ì öD\ƒ\rÄ\0 Ç\0E®C¿\‚V@\0ÄÄôÖ\Ÿ\ﬂFÄ®¡î	 \ﬂàGy\ƒz\Ë!ªÙ\“K≠m€∂é\ÓE]d≥fÕ≤´Øæ\⁄⁄¥iS\‚	Å\Ë	Ñ rÖà\r7\‹0zÉ\ËÄ@Ü @d(ÿ∏\n@†\n ™\0ô! \0@†Q§`ÚdÇ¯Ú0Z+\‚\Óª\Ô∂\‘Gs‘®Q÷øS:òﬁΩ{åÚ∞a\√l\Ë–°%œÄá~ÿÆª\Ó:ªı\÷[≠c«é+	~¯°z\Ë°6u\ÍT˜∑¡É#LîLóìD†\\\"I>` \0_	¯≤\ÊÛï/vC\0\»\Zà¨E!\0$è\0E®ììÇ˘Ú0ZK‚©ßûr\'Z∑nm´≠∂ö;ë \‚òcé±Û\œ?\ﬂ:t\Ë–Äm˚ˆ\Ìm\À-∑¨h‰ûÄXeïUÏ´Øæ≤+V\ÿUW]eÛ\Ê\ÕCÄ®à.çkE\0¢V\‰7)H¡îîHd\”_\÷|Ÿå^C\0è\0Ñ1\√b@\0i#Ä\0\·ID}y≠•\0°¸Û˘©ê$@út\“I6zÙh\Î“•K\‰\—.ñÇâ\‘Lë£¶\√*@Ä®\"lÜJ$äP\'2,ô1 ó5_fÇ£Ä\0<\'Ä\0\·y\01Ä@\n @xD_F} /^lˇ˚\ﬂ\Ìû{\Ó1ù¢¯¸Û\œm\◊]wµ!CÜò∏\À\']JÛt\◊]wπˇ_˝ı\›kûºÅ03àP∏∏9Ö RTè\\Úe\Õ\ÁRLÖ\0 êiô?\ŒC\0HàDÑ°i#|yıQÄX∏p°]q\≈÷£G\€nª\Ìl\È“•Nd\–ˇ$Jlµ\’VMOQ\ÓHàW\ \"Ä\0Q6\ZED¿ó5_D\Ó\“\r \0\ƒL\0\"f¿t@\0M@ÄhQ2n\Âa4âD±\Z]ªvµ\Ô}\Ô{¸Èßü\⁄GaÉ\rrÖ•uq\"\Ô¨àü\0D¸å!\Ÿ íü¥[\ÁÀö/\Ìq¿?@\0i!†MüAΩ∫z\ÌNò}Ø\≈x@\0)%Ä\0\·I`}y\r≥0∏\Êök\Ï\¬/¥˘Û\ÁWâ\≈j@Ù\Ó›ª`ˇ&L∞^Ωz¸\€7\ﬂ|cßü~∫ı\È\”\«˙˜\Ôè\0QqÑ\Ë¿\'>E[\„ Ä\0U˙,ïÄ/kæR˝\·>@\0Ä@•\¬\Ï3T:\Ì!\0@ z\—3ç•G_F\√,™%@4UÑz≈äˆ\‚ã/⁄Ω˜\ﬁkØø˛∫Mù:\’’Å\–5j\‘(àXf4ù&ô\0Dí£Ém\’ Ä\0Q\r åQåÄ/k>\"@\0®Å0˚’≤âq \0@†tSf\Œu7˜\ÏÿÆÙF5º3ä\Ôı°™\¬uuuu5t%\‹–æ<åÜ	Pà\ÂÀó\€UW]\Â\“+ùyÊô∂˚\Óª\€Zk≠\ÂÇ\√	àpsîª\”C\0\"=±ƒìÚ @î«çV\—e\Õç∑Ù@\0q S‹Ñ\ÈÄ\0\“F \Ã˛v1\ﬂ búaîb∆åÆ\÷\√gúax`=•Ö\Z8p†~¯·úÄàqæ\–u2	 @$3.XU=≥,¥\…3\ÊXønù´7(#A\‡? ò\nÄ\0 %äPGIìæ \0@ \¬\Ïo#@\‘`FÑ	Pàw\ﬁy\«ô1bÑ\Ì¥\”Nı\ƒ&Oûl|∞]r\…%5òGY[µ\Â\œ\ËÄ@∂	 @d;˛x@ jQ•?@\0KÄLaâ\’\Ë~_F} .\\h\'ü|≤-^º\ÿ\Œ?ˇ|[oΩıÏ•ó^≤;\Ôº”æ¯\‚;Ú\»# j4\Á∂v j«ûë!\0¯≤\Ê#RÄ\0 \‡?‚ÑïÄ\0\“LÄ\"‘ûD◊óáQ\ﬂÖ\ÊÃôN|3få≠≤\ *v\–A\Ÿ–°C]\ÍNù:!@xÚ¡\Ã\Ë @D«íû¸$@\n&?\„ñ´}YÛ•Ö7~@\0H;à¥Gˇ \0$ü\0DÚc\‰,Ù\Âa4iD≠\¬{\—EŸ¨Y≥\ÏÍ´Ø∂6m\⁄\‘\ ∆Ö@Y \ \¬F£†uäÇ\È°+æ¨˘<Dã\…Ä\02I\0\"ìa\«i@\0â\"Ä\0ë®p7∆óá\—Z\nO=ıîi\„øu\Î÷∂\⁄j´U}\„Ÿ≤eˆ\’W_Ÿä+Ï™´Æ≤yÛ\Ê!@xÚ˛\¬ÃÜ òY\'Ä\0ëıP[ˇ}YÛ’ñ£C\0Ä@© J%\≈}Ä\0 à∏\»F‹Ø/£µ PO]\Èì˙˜\Ôq\Z\Ô.(h=u\ÍTw\„\‡¡É ™\Zãä\0DT$\È\«WæF.v˚≤\ÊKmºÄ\0 ê~\Èè1B\0H:à§G\Ë?ˆ˘Ú0Z+¬ì0b&º Ä\0\·Eò02F1¬•\Î&	¯≤\Êk\“nÄ\0 \0ÅD–¶œ†^]aKπFÑ\Ÿg(w\⁄A\0Ä@| \‚ciœæ<åÜY\\s\Õ5v\·Ö\⁄¸˘Û#eEgÄ@e *\„Gkˇ	 @¯Cü=–öÔùπ\Zu°Kªµl‹∏q>ªâ\ÌÄ\0 \0Åí	Ñ\Ÿg(πSnÑ\0 \0Å™@Ä®\Z\Í\ BÄ®å≠!\0Å\“	 @îŒä;\”I\0\"ùqı\≈+˝@c\‚˚[\Î-lõM\⁄5˚¥\”NÛ\≈%\ÏÑ\0 \0TD\0¢\"|4Ü\0 PsSf\Œu6Ù\ÏÿÆÊ∂îb@\ﬂ;Í£ôô\’\’\’’ï2f\"\ÓAÄHD0ô Ä\0ëâ0\„d# òµ&p√≥Sm\ÕUW±Å\€˝∞÷¶0> \0xNÄLûÛ!\0@†\Í )}¸\»\·\÷b\⁄ƒö\« R0U˝˝√Ä(â\0DIò∏)\≈f/XhìgÃ±~\›:ß\ÿK\\K2à$G\€ \0¯EÄ\"\‘~\≈k!\0@†ˆ\¬\Ïo≥ñ1\∆1LÄ b]C†¿£) \0ÅLö1\€Zµla\›;¥ç†7∫Ä\0 \0Å,@Ä\»rÙÒÄ@2êÇ)qh\“\nR05âà \0ÅàHÄh\ÍÚ)Ö]Sæw@\0Ä\0 \0§ï\0DZ#ã_Ä\0¸!@jObÖ\0\·I†0)\"\‡õBù\"Ù∏Rc§`™q\0Ä\0 \0Å\» @DÜíé \0@†LeÇ´v3àjg<@\0\»*äPg5Ú\…ÒõL…âñ@\0ù\0Ñ\Ô\ƒ~@\0˛@Ä$Üû\n3!\0@¿{ﬁá\–{(B\Ì}q\0Ä@b @$&@ ≥ <	=Ñ\'Å\¬L§à\0)òRL\\	E\0\".néÅ\0DP\ÈÄ@F	 @d4∏\r@ A å\∆LAÄ$Pò	Å\Ì\"E\Ëq•\∆ j\0Ü7& \0DE@k˙AΩ∫F\’]M˙i÷¨ô\’\’\’\’dlÖ\0 \0Å\ 	¯∂ø\≈˜é˙hf¶\Ô/æ¿ *ü\ÏÙ\0Ñ#\‡\€D8\Ô∏\≈	 @0;jM\0¢\÷`|@\0HÅ(6Çí\‰∂@\0\»\Z\ﬂˆó¢¯\ﬁAÄàqñá	\–5\◊\\c^x°m∏\·Ü1ZD\◊Ä@πæXÙ≠k∫\Œj≠\À\ÌÇví¿∑Kó\Ÿ¸Eãm√µW˜\“~åˆü¿¸E\ﬂZÛf\Õl\Ì6´˙\Ô@\0Ä\0*$ˆ\€os¢BÜ4á\0 PKæ•¯≥ø]å+Då3.LÄ$@º¸Ú\À1ZC\◊Ä@%\ﬁ˚Ù\◊¸˚m◊©§\⁄B¿;ﬁù˚πm∑)πw¡Kâ¡\ÔŒùo-õ7∑\Œ\ﬂ[;%\· \0‘äÄ\÷ÙiX\œ\ﬂu\◊]µB»∏Ä\0 ê1aˆ∑ j09¢P\r\ÃfH@†\0ﬂé\»DDE`ˆÇÖ6y\∆\Î◊≠sT]\“B S(\\\‹@\0çHCj@\0®&Å(ˆ∑9cƒ¢På\Ê\—5 Ç\0DX\‹\n@ BìfÃ∂V-[X˜m#ÏïÆ \0@ ã ≤u|Ü\0 ê,§`JV<äZì\∆\"‘û†\«Ldñ\0DfCè\„Ä\0 \0@\0)!Ä\0ëí@\‚ \0è	¯∂ø\≈\Ï9„Ñç\"@1öG\◊Ä@æ)\‘!\\\„V4JÄLL@\0Ä\0\“B\0\"-ë\ƒ@\0˛@Ä$vúÄ$Pò	@\0\ﬁò˙—ßˆ\«ÒS\Ì\∆\√wÛ\ﬁì\0)ò¸åVC\0H\"à$Fõ \0dã\0Ñ\'ÒFÄ$Pò	@\0\ﬁ@Ä>Ñ\ﬁ;@j\ÔCàÄ\0C\0\"1°¿@\0ô%Ä\0\·I\Ë <	fB EH¡î¢`\‚J(°pqs bÄJóÄ\02J\0\"£Å\«m@\0	\"Ä\0ë†`4f\nÑ\'Å\¬L§àÄo_)Bè+5&Ä\0Q\„\00º!@0	 \0@ *Z\”\Í\’5™\Ó\ËÄ\0 öÄo˚KQ\‘8¶u\ËiRzÉ(T˙h\‹	\ƒI¿∑/à8Y\–w∂ @d+\ﬁIÙ\"âQ¡&@\0Ä\0 \0@†æ\Ì/E±øç\0Q\ŒL)±M*q(nÉ\0b&\‡\€D\Ã8\Ë>C 2ÏÑ∫ä\0ë\–¿` \0@\0Ä\0 öÄo)æ£\ÿ\ﬂFÄ=MJoEÄJç;!\0Å8	 @\ƒIóæìL\0\"\…\—…ÜmŸà3^B\0®R0UÉ2c@\0Ä@öD±øç\0„åà\"@1öG\◊Ä@!`qk™\Ã^∞\–&œòc˝∫uNï_8\„bÖ•Ä\0íNÄ\"\‘IèˆA\0Ä@\“D±øç\0cT£På\Ê\—5 Ç\0DX\‹\n@ BìfÃ∂V-[X˜m#ÏïÆ \0@ ã ≤u|Ü\0 ê,§`JV<äZÛøˇ˚ø∂|ã^\÷gêÇ˜å9\‹ZLõh\„∆ç´©G5\≈\œ\‡àî\0D§8\ÈÄ\0 \0@\0U\'Ä\0Qu\‰@\0y|\€_äbõ1æ\r¢På\Ê\—5 ÇÄo\nu◊∏ç Ä\0 \0Å¥@ÄHK$ÒÄÄø <â\' <	fB\0ÄÄ˜(B\Ì}ΩwÄLﬁá \0$Ü\0DbBÅ!Ä\02K\0¬ì\–#@x(ÃÑ\0 \0\Ô	 @xB\Ô†µ˜!\ƒ@\0â!Ä\0ëòP` \0Å\Ã@Ä$Ùæ	≤˜Èßüvt˚ˆ\Ì[_õÇ◊ø´\—8¯Úæ\ÿfá^6˘π	âô∑;\Ôºs˝gK)Ô£∏\Ô/«∏\«\r\€\‹v\÷ û∞~Öµ≥\ÿ˝a_\«\ŒÚ\÷a\„ñsTü\√q\ÿ˘?=l\”_ô\È:*;s?á\„\Ó?lºíˆ>\r;?\√Ú\Î/˜˜πátsà\Í=◊è\0\0 \0IDAT\Í}\Á˚<Y´Ûñˆ\Âø\ﬁZi=ï_a?üπøÒuQ\ÿ\œˇZÒÃöùa\ﬂ/a\„O\Ïl¸{-™∏\ƒ/_\Ï\À\·zlk\ÔLôTÚ˜Q≠8»Øgûy\∆\Í\Í\Í*R\r®Qæ\∆S\"F∏t\rÅ*M°Æ2ÜK1N@§8∏û∏\∆	OÖôÄ\0< †5˝†^]=∞!\0@ ≠|\€_äb\"\∆\ŸEÄb4èÆ!\0Å|˚Ç\·\Z∑B†QLêZ@Ä®uÄ\0 \0@\0àäÄo˚KQ\Ïo#@D5{\nÙEÄb4èÆ!\0Å|˚Ç\·\Z∑B\0Ç9êhâ\∆A\0Ä\0 \0@\0!Lô9\◊\››≥cª≠jwk˚\€1\∆/ä\0\≈h]C\0! @ÑÄ≈≠©\"¿	àTÖ\”Kg ºFC\0H$R0%2,@\0	&\≈˛6Dåé\"@1öG\◊Ä@!`qk™\Ã^∞\–&œòc˝∫uNï_8\„bÖ•Ä\0íN`á\À\Ô±\Á\œ:<\Èfb \0@ 1¢\ÿ\ﬂFÄà1úQ(FÛ\Ë\ZA\0\",nÖ\0 !ÅI3f[´ñ-¨{á∂ˆJWÄ\0 êEYå:>C\0HR0%+E≠˘\ﬂˇ˝_[æE/\Î3xH¡{∆èn-¶M¥q\„\∆\’\‘#àö\‚gpTD`ßùv∂πÛø®\Ô\„\Îoó∏Ø—∫U˝k∑okO>˘dE\„\–Ä\0 \0@\0®à\Ípf@\0(N¿∑∏F±ø\Õ	à\ﬂQ(FÛ\Ë\ZhÑÄàf\›v∂\’\◊/\\h¡Ïè¨ı˚ì òE©\'@\n¶‘á!\0@\0ô!Ä\0ëôP\„( \0Å\ƒ@ÄHlh\Z\Z\∆	OÖôò@ @Ù>\Ó7Ωx\ÊÜa\«\”K\'@\Í\“Yqg<H¡WzÖ\0 êEYå:>C\0Hàd≈£®5\—\Í\Óª\Ô∂\‘w<j\‘(\Îﬂø$≠X±\¬^|ÒEªÒ\∆\ÌÑN∞vÿ°¢~\'NúhΩ{˜Æ\Ôcÿ∞a6t\Ë–ä˙§1Ú	 @0\' fB≠	PÑ∫\÷`|@\0\È!Ä\0ëûX\‚	 \0_	 @x9à\Ë%‚Æª\Ó2˝ˇ˙\ÎØo\ﬂ|Ûçù~˙\È6r\‰»¢É\Ìπ\Áûı˜7f\—oºaø¯\≈/l“§I6a\¬\Î’´W$6v\Ë\–\"¢tíK\0Ç˘\0\Ê@2 @$#X@ \r \“E|Ä\0 \‡7O\‚á\0}†Úà`Ñw\ﬁy«é:\Í(;\ÂîS\Zúàò5kñç1\¬\Œ>˚l\'X4u©üC=‘Æø˛zà¶`Ò˜D@ÄHD0\"8ëÄ d\‹àåO\0‹á\0 !m˙\Í\’5\¬\È\nÄ\0 é\0D8^5ª\"zÙ\≈àyÛ\Ê9\·a\‡¿Å+•dz¯\·ámã-∂∞.]∫4iDìà∏!a Ã©àö°g\‡ˇ@Ä`*@\0Ä\0 \0@\0i!Ä\0\·I$ ¢T\‚Ω˜ﬁ≥∑\ﬁz\À~˙”üñlD…®∏1! Ã®9àöá Û @d~\n\0\0Ä\0 \0@\0©!0e\Ê\\\ÁKœé\Ìº©Y≥fVWWWë≠Í£ôô˙©¨£ä¨\Ÿ\"$∞n/UÄ\–<y\Ï±\«\Ïã/æ∞\√?ºæ\Áô3g\⁄E]d˜\ﬂø{\ÌêC1án€∂≠˚\ÔB\ƒ/º\‡R8©HıUW]eS¶Lq\Èû⁄¥icÀñ-≥1c\∆\ÿ5\◊\\\„\nXp¿v\ﬁy\Á\Ÿ\÷[o]?&5 J,∑îM\0¢lt4Làî\‘Cw <\Z&C\0H(R0%40ò@\0â%Ä\01xH¡\‡å9\‹ZLõh\„∆ç´i¢PµhJÄx¸Ò\«ò2j‘®˙îL,∞\„è?\ﬁz˜\Óm\'ûx¢;1h\– WÛAÖ¨	Û\Áœ∑s\œ=\◊\Œ<ÛL\Î‘©ì˝˘\œ∂\Áü\ﬁ	≠[∑∂[oΩ\’~¯\√\⁄v\€m\Á\ƒçw\”M7πB\Ÿ?¯¡\\ü’ö\Ÿ\"õq\«\Îï	\Ã^∞\–&œòc˝∫ujB\0¢&\ÿÄ@*	PÑ:ïa\≈)@\0àë@˚€úÄHxÄb4ØA\◊M	A\rùV;v¨ItN@\Ë\ﬂ\'úpÇ{Ï±∂ÎÆªÚO@(çì\n[_p¡ˆìü¸ƒæ˛˙kª\Ì∂\€\Ï∏„é≥πs\Á\⁄Ga\œ=˜\‹J\Ó\ﬂ{\ÔΩN\ÿ@Ä®\÷\Ã\»\Ó8Ÿç=ûC\0\…\"0i\∆lk’≤Öu\Ô›©J.@\0Ä@π \ %G;@\0àä\0)ò¢\"s?§`äp©ÑF˛¯\„è\Ìµ\◊^≥Ωˆ⁄´Å!:ë0~¸xª˝ˆ\€\ÌëG±≥\Œ:ÀÜ\Í\Ó\… tØ\“/\›q\«N¥<x∞)Æ´Æ∫™)5”Ö^\ËN=¨ø˛˙Eù\ÂDÙÛÄˇK\0Ç\Ÿ\0@\0Ä\0 \0Åt@ÄHW<ÒÄÄè(B\ÌI\‘ ¢T\"t’ÖP∫´K/Ω\‘¶\ﬁw\ﬂ}\Ì≤\À.≥é; \‘\«\‚≈ãùPq\Ìµ\◊:\·B\Èõ~ˇ˚\ﬂ€´Øæj\«såç=\⁄zÙ\ËÅ\0}∏\È±%@\‚ñL S&¬åìÄ\0 \0ÅL@Ä\»DòqÄ@¢	 @$:<ˇ5\"˙@U\"@H0PÕáõoæ\Ÿ	ÖN&‰üÄò7oûK\Â‘øWI˝\…\'ü¥\”N;\Õı±Ò\∆ªLk¨±Ü]r\…%÷≥gOkﬁºπ;u1{ˆl\€cè=\0N@D?\ËÒø ò\r¯é\0E®ô	µ&@\n¶ZGÄÒ!\0§á\0Dzbâ\'Ä\0|%Ä\0\·I\‰ ¢T1b˙Ù\È¶˙™Õ†S	Ú/•L:\Ï∞\√\ÏO˙ìK£Ù\ +Ø∏\”\€l≥ç6\ŸdS\Õ\’n∏˙\Í´mü}ˆ±\œ?ˇ\‹’å\–ˇˆ\ﬁ{o˚\√\Ì\‘SOu\'\'∂\ÿbWåZ)örØ^Ωzπ¥Lõn∫)DÙSÄÛ @0% Ä\0¡HäP\'#X@ \r \“E|Ä\0 \‡7O\‚á\0}†Úà\‡t¡»ë#\Î\ÎﬁΩªKã‘•Kó,\\∏\–	J•¥\€nªπSO<ÒÑ©\œ#F\ÿÚ\ÂÀ≠w\Ô\ﬁım$\"®~ÑäL´\Ì\·\√mùu\÷q©[UFWz&µø\Êök\ÏÉ>p˜2ƒ∂\ﬁz\Î˙~8˝<†\«ˇ@Ä`6@\0Ç9ê…àV@\0Hà4D \0¯M\0¬ì¯!@D®b\' ¢)∫ ¢cIO+@Ä`V@\0Ç9ê…àV@\0Hm˙\Í\’5\rÆ\‡ \0xJ\0¬ì¿!@D(à\Ëô“£\ﬂ ¸é\÷GGÄ\Z—±§ßÚ @î«çVÄ\0 \0@\0Ä@Ú @$/&-BÄà>P\—3•Gø	 @¯?¨èé\0Dt,\È©<\Âq£ \0@\0Ä\0 ê<Sf\ŒuFı\Ï\ÿ.y\∆∞H©Ú\Î\Í\Í*≤U}43S?ïuTë!#@ÑV\¬\Ì Pß\Í4Ù\ÔﬂøÑñ’øe\‚ƒâ\rjJ6ÃÜZ}C1\’ R^úA\0\",nçÖ\0D,X\ÈÄ@&	êÇ)ìa\«i@\0®Ä\0\ƒ\‡!Òç9\‹ZLõh\„∆ç´\0o\ÂM£P\ÂV\– Pàr®\—&çf/XhìgÃ±~\›:ß\—=|ÚÄ\0ÑA\¬D@\0û†µ\'Å\¬L@\0HÅ(ˆ∑9c8£På\Ê\—5 \–¶ \0Ådò4c∂µj\Ÿ¬∫whõÉ∞Ä\0º%Ä\0\·m\Ë0Ä@jêÇ…ìPíÇ…ì@a&<&Ä\0\·q0Ä\0 \0@\0 @0- \0@†\÷(B]\Îî8>Dâ†∏\r(õ\0D\Ÿ\Ëhò2§`JY@qÄ\0 êa>ÆC\0HàÑ¢)3 ö\"\ƒ\ﬂ!\0ÅJ	 @TJêˆi!@\Í¥D\“_?H¡\‰o\Ï∞Ä@\“ @$-\"\ÿ@ { <â9Ñ\'Å\¬LxL\0\¬\„\‡az§ \"\≈Ige†u\–h@\0	 @01 \0@†\÷ jÅ\«GÄ(∑A\0e\» \Í\Í\Í¨n\≈\n≥∫¶?{\„\≈\÷r˙Kv\ﬂ}˜\ŸÚ\Â\À\›ˇñ-[Vˇ\Ô\‡µ\∆˛…í%∂\—FŸè~Ù£≤\Ì§!\‚&Ä\07a˙oä\0DSÑ¯; \0îJ\0¢TR\‹@\0q@Äàãl\ƒ˝\"@Dî\Ó \0Åï\‰\n\„G∑	#/µfÕõô5knÕö7∑∫\Â\Àm\≈Úe÷¨Y≥ï\⁄\Êø¸w\ÓÎ´¨≤ä,Ù?]kØΩ∂mø˝ˆ6|¯p\Î—£Å@b @$&ô5\"≥°\«q@\0ë–¶œ†^]#\Ôó!\0@\0•@Ä(ïTç\ÔCÄ®q\0 P\ÕLü|Úâ\›v\€mv˜\›w\€[oΩeªÏ≤ã=ı\‘S†åã>@Ä!J\È∂\"\›Ò\≈;@\0Ä\0 \0dâ\0Ñ\'\—FÄ$Pò	è	TSÄ\»\≈Ù\Ï≥\œ\⁄!ábm⁄¥±ˇ˚\ﬂ\ƒÙ¥@ÄHK$˝ı\¬\ﬂ\ÿa9 \0@\0Ä\0 –ê¿îôs\›=;∂Ûç≤y(y%ó˙P˛ê∫J;™ƒà∞m \¬\„~@ ,ÅZ	Åùoº±u\Ï\ÿ—û˛˘∞¶s?\"%Ä\0)N:+É\0D\–h@\0	êÇââ@\0G\0bêÇƒîØΩ≈¥â6n‹∏pD#æ;ä\0El\›A\0%®µ\0Ò\Œ;\Ôÿñ[nic∆å±<∞D´\”y\€Ãô3\Ì∏„é≥_˝\ÍW∂\œ>˚4pR;ˇ¸Ûß≠∑\ﬁ\⁄.∏\‡ìH]®6Gí\È¸Òè¥^x¡˛á?\ÿZk≠ô©+V¨∞_|\—nºÒF;\·Ñláv\›˜\ÏmÚå9÷Ø[\Áï\⁄6õ\–\—\0E @05 \0@ *°éä$˝@\0Ä@VD±ø\Õ	àgKä\—<∫Ü\0\Z!PkB¶\ÌºÛ\Œˆ\’W_Ÿî)Söå\’\ÁünW]uïç\Z5 µ9Ë†Él\Ë–°\ÓEpÈ§õÑY∫Vçâ>}˙\ÿYgùe˚ÓªØ5oﬁº\…1juC±M\Ó9s\Êÿ∞a\√\ÏúsŒ±u\◊]\◊.ª\Ï2õ?æ]~˘\Â∂˙\Í´\◊\ ‹≤∆çKÄx\„ç7\Ïø¯ÖMö4\…&Lò`Ωzı*Àæbç \"\≈IgELö1\€Zµla\›;¥Ö \0@†\"\·£1 \0D@ÄL@¨F§`™e∆Ä@∂	$AÄ¯\Î_ˇj|∞-Y≤§\—`|Û\Õ7¶\r\Ï˝ˆ\€œæˇ˝\Ôª\⁄:-–≤eK9r§µo\ﬂﬁµü8q¢ùt\“Iv\≈W∏B\◊}Ùëùv\⁄i\ÓóÒ{\Ï±G\"æxÒbª˜\ﬁ{\Î\Î`4fîävè?ﬁÆæ˙jW3É´0ù¶9Ù\–C\Ì˙ÎØè\\ÄÄ9 \0@\0â\0ÑO\—\¬V@\0\È$@jO\‚ä\0\·I†0HÇ\0!|-Z¥p©y~¸\„•˘ˆ\€o€™´Æjù;ˇ7E\Œ+Øº\‚6ù%6¸Ùß?um/∫\Ë\"õ5kVÉ\r{	s\Á\Œuß%ípi≥¸ñ[n±/º∞IQ°ê?I!i6T*@4ñÇ)iæb \0@\0hå\0ÛÄ\0jM\0¢\÷(q|àAq P6Å§kÆπ¶˝\Ówø≥O<1î/Û\ÊÕ≥˛˝˚\€1\«\„Ñ]:)∑ø˝\Õ\Ó∫\Î.\Î–°É)%ì\“1u\Ì\⁄\’ˆ\ﬂˇP˝\«qÛ¬Ö\Ì\Ï≥œ∂\ÂÀó7y™AßB~Ûõ\ﬂÿ¢Eãöº7[}\Í≥RÇ\"\‘>E;ù∂íÇ)ùq\≈+@\0µ Ä\0Q\Íå	@\0π <ôû\n3!\‡1Å§Jü§\Ã_|q(ö¸±˝Úóøt\√V[m\Â\⁄Nü>\›hù:urı\"\ﬁ{\Ô=\”I	â:AQ\Ë\“FøN#(\◊ˇu\◊]W∞@≤ƒé{\Óπ\«fÃòaßûz™K•¢\«{ÔΩ∑]y\Âïı)†T˘üˇ¸ß´’†\Z\€m∑ùK•4S\ﬂ~˚≠´G°v¡5x`\◊˛µ\◊^kPDY©§z˜\Ó\›¿‹£é: ù\ÓxÚ\…\'\›\Îj+¡E\◊Èßü\ÓRQ\ÌπÁû¶¥MÎØø~}\€\‹\"\Õ\«{¨Ω˘\Êõv\Ìµ◊∫S™ó øu\“\‚˛˚\Ô7âA\Í\Î¯„èØ?ù°zÚ˜\÷[ou>®&\≈“•Kmßùvr\'K;É˙\Z¿Än¸\‡µ\\~jØXÖ£À±)?éÖà\∆b°\‘]∫ñ-[\Êä{_3\Í/ˆm\Áûˆ\”uñ∏âÉÆBÆKù°&37gû\0E®3?\0\0@ 2ë°§#@\0(ì\0Dô\‡™\›¢\⁄\ƒ\Ÿ#êb\√\r7tEÑ/π\‰íPA\–ø6±u¢ \ÿPV/ø¸≤´!Å\‚¸Û\œw\'$\Z+@›î\0°øk\”\\õ\€nª≠´\'±\◊^{Ÿßü~jG}¥´K°M{ù∂êH!ª$¶¥m\€\÷∆ékßúrä˚ªjV4k\÷l•4QØæ˙™\€\œ/¢¨∫jß+®°1\œ=˜\\[∞`Å,\÷Yg˜wm¿\ﬂt\”Mv¡\‘oû0’Ø6˘_˝uª˘\Êõm∑\›vsi´$ûH∏y\‡Ål–†AÆ\›|\‡\ÏUq_ˇ˙◊¶\¬ﬂ≤[ı4$*hC^Çœ£è>j£Gè∂.]∫8ÅG\'Pnª\Ì∂˙˙*Æ6 îZ+\‡˜Ûüˇ\‹˘¢\¬\—\Â⁄§î]˘Wæ\0Qj,TãC1;Òºã\ÌÅi≥m\”\'€ê!C\\˜:ï£∫!π±\…ı•±πj\"s3\ÃÇi\0@\0Q@Äàä$˝@\0Ä@π \ %W\ÂvU\Œp\» üm¿k#[b@PÄ:°N)\Ë\◊˙S¶Lqõ\Ó:	q¿∏\ÕˇJÆ¸zÅ@∞¡8°cˆ\Ï\Ÿv\‰ëG:Ad˜\›wwC)\’\“\Ôˇ{{¯\·á\›F˜fõmV∞NE°_ ‘ßN0~¯\·\Œˇ]w\›\’	\◊\\sç˝\ËG?rˇ]\Ë\n˙?\ÔºÛ\Ï¿¨øE}Hh»øˆ\›w_ó\∆J\‚ÑDùY}ı\’\›mA°\Ô@Ä(d{pÇ#8°v˘¸ µi\›u\◊]\…\ﬁ|>˘\‰ì&c°∏I\‡Q™ÆüsÇ˝q¸T˚ø\‡Ñù`ë¿†´êMÕÖJ\ÁZ%Ûî∂~@Ä3nX\r@ â¥\È3®W\◊$öÜMÄ\0 êû\Z¬ì@a&<&\‡´\0°¥9˙%ﬂæ}m\À-∑l´æ¸Ú\À\›≤~—ØÙFw\ﬁyßª_ø\ÍØ\‰*∂\È¨>µë/¡C\Èàr7\›ı∑gü}÷çº^®∞tB˛K\–		c\‰ØN?⁄ú/∂âÆtJgúqÜ\Ì∏„éÆñF˛¸]ıπº£ Æø˛˙˙ìM\ŸT,~˘¸\n	 ˘±\–i\’\ÿh›∫µ|¬©v\”\ƒ\◊\Ìí=z8J\„0	#@s°Mõ6ïL5\⁄fê\0DÉé\ÀÄ\0 \0@\0H)Oã\0\·I†0®TÄx\Ï±\«\\*¢JØ0)òÙk\Â\Ï◊©\’ »Ωt\⁄@µVYeï˙\rsm\÷KÑ¯˜øˇ]q!\ÁRàgûy¶Åm\⁄W∫£\'ûx¬∂\ﬂ~˚äO@\»g’åPJ$	Jã§îFA∫¶BÒhL\‡X{\Ìµ]˙´\‹4V\Í#8Å°\’ Ç1ã\ŸVÄh*ä\Õo˚[;˛ˇ.∞g>[b˚¨ÒçK¡t˚\Ì∑óu¢\“OÉ\Ï∂GÄ\»n\ÏÒÄ\0 \0@\0i#0e\Ê\\\ÁRœé\ÌºpMY¥\ﬂT…•>îw£Æ“é*1\"l[à∞ƒ∏K†\\B˘˝U4˙˝˜ﬂ∑∑\ﬁzÀ∂\ÿbã∞C7∏øTBü\·>¯†≠∑\ﬁz\ÓDÅ>\‹/^l=Ùê\€\ÿo◊Æù€ÑR\"ip¥…¨\Õ˙•}P\\∏Éõ Tê˘à#épiêtB!®Uè¸√•a\“I˘Z\È	\ŸúÇx˜\›w]¡i\’m\nqÚ≠ê\0lñ\ÀV•fR≠Éµ\÷Z\Àı≠\rx•jR≠•3*%”à#ÍÖó0)òrO@4eìjHHú»øÚ˝S\ZÆRb!_U\€\„\—_±è\÷\Íhº;\—	˙\Ê\' \ y∑\–&,à∞ƒ∏Ä\0ä sÄ\0 é\0\ƒ\‡\Ôäa\Ê_\„G∑\”&ö6kyE†Z\⁄\œ\ÿ\»2Å∞\ƒs\œ=\ÁäEkC6∏Tc°k\◊\ r\ÃJP˝mZªÙ+\÷Fª\n#\Á^ÉÆ?›†{¥ô~\√\r7∏\"\»_~˘•˚Ö{Ø^Ω\\›ÑBπ˘urB\'\0\ﬁ{\Ô=∑—ÆM¯¸K\’*˛<k\÷,\'dh¸´Øæ≤\”N;\Õ›™\Zk¨±Ü´=°\‚\≈:u°SÛ\Á\œwi~$J\„\Î‘Ç\“2i\„[>\ÎâÑrV*•†FÉló†\"õ\’æx2yÚd;¯\‡Émˇ˝˜w«™´ÆZîüNHhC^˛\Âûô>}∫K7§bﬁπó\∆SÒi\≈\\EºU\‘[ÖNó®ûÖDî†Ñ|T\€m∑ù´°Z\◊^{≠ãI∑n›ú¯£tG\‚ßÒnπ\Âó*™\\õ\n\≈0(Ñ≠1˜\Ÿg\ÁJ)±ê/ämØ\›˜≤\…3\ÊXønùWbÙƒ¶îπPâ–ï\Âœ§,˚é\0ë\Â\Ë\„; \0Åh	PÑ:ZûÙ@\0\È\'\≈˛6\' bú\'Q(FÛ\Ë\ZhÑ@©Ñ6‘è:\Í(W¸8ˇö:u™*π¥q~\«w\ÿaáV¥õ\€nª\ÕN=ıT∑\Èü\›x\„ç&Bó6áï¢I\Ë\⁄T◊¶∏Dm\‘\Áß\n˙Y≤dâK\›4s\ÊÃÇDêH\È∫ˆ\‹sO”Ø˝µAˇ¯\„è◊øv˜\›w;a\"w|	 $Ü4o\ﬁ\‹\›+GÖéµ	Ø\Ÿ:9°\⁄¡5j\‘(\€t\”Mº¶ø\r6¨A*$\’K8Î¨≥\Ïg?˚Y\—\‚\”júF–øU3CM.kâ_|±;]≤\—FŸâ\'û\ËN∏®éÅNù(uî\∆Q≠		\":iq\Êôg\÷π˜hù \–Iùû˚ü¸\‰\'Æ}.?±S°\Îrl èÆ˙õ¯©~C˛\\»èEPoBbU\Ó%Ò@Bõjjh\Œ\Á\∆F¢Ü\ÊU)sA\'S∏ P*ÅI3f[´ñ-¨{á∂•6\·>@\0Ä@AL@\0®5R0\’:%éO\n¶Aq P6Å¶à\'Ø<\«\ﬁ~¯éÇõ˛¡†*º‹£Gè≤mê∞°çomnsÖ#†\‘HMü\◊ciw\Á°.≠U2ÔíÄ$ÒJ)õÚ/ù¶—©.@\0Ä\0 \‡ü¢Ö≠Ä\0\“IÄ\"‘û\ƒ¬ì@a&<&PLÄXÙ\≈<{˛∂+\Ì≈ªF®zN£æÙ\“K.ΩN\ÿK)ïˆ\ÿcóFNıî¬á´t\‚wÛ\Õ7ªS:MQ\Õ+-DpBBßSV¥^Ω>ìNt\Ëdœ¢Eãl\«w¨&Z∆Ç\0 \0@\0@Ä®!@\0Ä@Ö *X≠\Ê\’\"\Õ8\».Å|\‚€Øæ¥nø\ ^∏\„\Zkﬁ≤•-[¸mìpî\Ó\Êá?¸°Kw£Mq\’S\»ˇ\ﬂj´≠\Ê\ÍLõ6\ÕT∑\‡\Âó_∂è>˙\»:w\Ól7\›tS£ÈÉö4 c7<˙Ë£ÆñÑRQ©ˆÉRµoﬂæ™∆é\Î\“a©D%ß_™jtÅ¡\ƒR\ÈªT\œb\Ÿ:\Ì\ÏOœøe<lWõ3gé´U—≥gO[}ı\’km&\„gÑ\0)ò2h‹Ñ\0 PUÄ\ÃÄ\0 \–(O&Ñ\'Å\¬LxL _Ä∏\„\Ë]\Ïì7ßÿäeKKˆJu\rrãˇ˛ùu\÷q\ÈïÙK}iVmÄm∂\Ÿ∆é>˙\Ëïjî<hÜo\‘\Èùx\ËﬁΩª+<Ω\…&õTïÜ\Í\\0†~\Ã	&∏\ﬂ>^.¥;\Ôº\”	)S>úcõ\Ì{ÑmÙ\ﬁsvÚ\…\'\€nª\Ì\÷hQo˝\≈\Êd†u≤\„ÉuÄ\0|\"Ä\0\·S¥∞Ä@:	 @xWOÖôò@æ\0±ÙõEˆ\“\›\◊\Ÿs∑^\·DÖ%ãæn\‘;\›Û\Ã3\œXü>}<¶Ä\È0õ˙—ßˆ\«ÒS\Ì\∆\√wjB\0¢&\ÿÄ@*	 @§2¨8@¿+ûÑ¬ì@a&<&P¨\ƒÚ•K\Ï•Q\◊Ÿ≥7^lÀó,.\Í°à˛Ûü÷∑o_è)`: òµ\'Ä\0Q˚` \0Å¥–¶œ†^]\”\‚~@\0ÄÄá <	\ZÑ\'Å\¬LxL†ò\0∏ÙÙı⁄ª\›jÛ\Ê\Õs/©8o\Ó%\‚ˇ¯5<ûò˛N@0jM\0¢\÷`|@\0Ä\0 \0@ *Qëåπàò\”= `M	\œ\‹0\ÃZø?Ÿû|ÚI;¿\Ì°áj DHÄx\Ï±\«lè=ˆÄ&º&Ä\0\·u¯Ra<D*¬àÄ\0 \0@\0ÄÄôMô9\◊q\ËŸ±ù<¥øïˇ£€∞Ü´èf\ﬂ˝x∑\·Øw\√vT\Õ˚ ™Iõ± êMaàÄ\–!áb˜\ﬂø˚`\÷ˇ∆ék{\ÌµW6\‚uj @§&î\ﬁ:Ç\0\·m\Ë0Ä@\‚êÇ)q!¡ @\0H8à¡C\nÜh¸\»\·\÷b\⁄D7n\\MCEÄj\Í\0ÉC \√\  \\˝˚˜∑1c\∆\ÿ<`˚\ÓªoÜ)\‚z\Z\Ã^∞\–&œòc˝∫uNÉ;¯\‡!ÉÜ\…Ä\0JÄ\"\‘	\rfA\0Ä@b	D\◊¸†\0\0 \0IDAT±ø\Õ	à\√EÄb4èÆ!\0ÅFT\"@\0Ä\0¢#0i\∆lk’≤Öu\Ô\–6∫N\È	Ä\02I\0\"ìa\«i@\0â\"@\n¶DÖ£∏1§`Ú$Pò	è	 @x<Lá\0 \0@\0Ä@L@\0®5äP\◊:%éè\0Q\"(nÉ\0\ &Ä\0Q6:\Z¶å\0)òRP‹Å\0 \0dò\0DÜÉè\ÎÄ\0B\0\"!Åh\ à¶Òw@†Rï§}ZPÑ:-ëÙ\◊R0˘;,á\0 ê4Iãˆ@\0\»Obé\0\·I†0@Ä8xò)àHq\“Y(B]4ö@\0Ä@AL@\0®5àZG†\ƒÒ J\≈mÄ@\Ÿ \ FG√î@ÄHY@=t\¬√†a2 \0ÅÑ@ÄHh`0Ä@Ü @xlOÖôò\0Ñ\«¡\√ÙH	 @Däì\Œ\  Ä\0Q4ö@\0Ä@A\⁄Ù‘´+t \0@\05#Ä\0Q3Ù\·FÄ«ãª!\0Å \¬3£E:	 @§3Æ>yÖ\0\·S¥∞Ä\0 \0@\0hå\0Ñ\'Û¬ì@a&<&Ä\0\·q0=Rë‚§≥2 @îç&Ä\0 \0@\0Ä@\"	Lô9\◊\Ÿ’≥cªD⁄óoT≥fÕ¨ÆÆÆ\"[\’G33ıSYGY≤1DH`\‹Ñ&Ä\0\Z\rRJ\0\"•Åı\»-èÇÖ©Ä\0NÄL	\ÊA\0Ä@\‚ @R0(\„G∑\”&⁄∏q\„j\Z¥(TS&Ä\0ë\·\‡\„z≥,¥\…3\ÊXønù!Åö@Ä®	vÖ\0 êJ°NeXq\nÄ\0b$\≈˛6\' †Õ£k@†L@\0\… 0i\∆lk’≤Öu\Ô\–6a \0xK\0\¬\€\–a8 \0Å\‘ ì\'°$ì\'Å\¬LxL\0\¬\„\‡a: \0@\0Ä\0\n@Ä`Z@\0Ä@≠	PÑ∫\÷(q|àAq P6à≤\—\—0eH¡î≤Ä\‚ \0@ \√ 2|\\á\0 ê		DSf @4EàøC\0ï@Ä®î \Ì\”BÄ\"\‘iâ§ø~êÇ\…\ﬂ\ÿa9 \0Å§@ÄHZD∞Ä@ˆ @xsOÖôò\0Ñ\«¡\√ÙH	 @Däì\Œ\  @\Í2†\—Ä\0\n@Ä`b@\0Ä@≠	 @\‘:%éè\0Q\"(nÉ\0\ &Ä\0Q6:\Z¶å\0D\ \Í°;\rì!\0$î\0DBÉYÄ\02D\0¬ì`#@x(ÃÑÄ\« <¶GJ\0\"RútVà2†\—Ä\0\n–¶œ†^]°@\0®àö°70D8^\‹\rÑ\'Ä\0û-\“I\0\"ùqı\…+ü¢Ö≠Ä\0 \0@\0Ä@c <ôû\n3!\‡1	_≠øY£¨ˇ\’Gˆ\‰ìOz\Ï%¶C†iM3\‚éx	 @\ƒÀó\ﬁ!\0@\0Ä\0 \0Å\Íò2sÆ¨g\«v\’¥Çëö5kfuuuÙ`¶>öô©ü\ :™»äêç B\„v@ 4Å\√?ºAõ˜?˚\“˝w\Á\Ô≠\›\‡ı{\Óπ\'t\ﬂ4ÄÄO |äV:mEÄHg\\Ò\nÄ@-êÇ©\‘Ä\0|&Ä\01xH¡¯ç9\‹ZLõh\„∆ç´i|£PM`p@†ûÄoG\‰¢\"0{¡Bõ<céı\Î\÷9™.\È° @Ñ\¬\≈\ÕÄ\0 \–äP3= \0@\0\·D±ø\Õ	àp\ÃC\›EÄB\r\»\ÕÄ@l bCK\«Ä\0\Z%0i\∆lk’≤Öu\Ô\–RÄ\0 \0Åä @TÑè\∆Ä\0 R0E\0±\Z]êÇ©\Zî\»%Ä\0¡|Ä\0 \0@\0ÄÄ\ﬂ ¸é\÷C\0H\ﬂˆó¢¯Å=\' búπQ(FÛ\Ë\ZA¿7Ö:Ñk\‹\nÅF	êÇâ	@\0Ä@Z @§%í¯@¿_ûƒéû\n3!\0@¿{°ˆ>Ñ\ﬁ;@\n&\ÔCàÄ\0C\0\"1°¿@\0ô%Ä\0\·I\Ë <	fB\0ÄÄ˜ º°˜PÑ\⁄˚\‚\0 \0Å\ƒ@ÄHL(0Ä@f	 @xzOÖôHR0•(ò∏ä\0D(\\\‹à†\“% \0Åå@Ä\»h\‡qÄ@Ç @$(çôÇ\0\·I†jhfœû=\Ì\ﬂˇ˛∑5oﬁºÜV§c\Ë+VX˚ˆ\Ì≠eÀñ\Èp®L/\Ê/Z\ÏZÆª⁄™eˆ@3¯I\‡€•\À\ÏÛEãm£µW˜\”¨Æ\nÅ5\◊\\”û˛˘X\∆BÄà+ùB\0\»$m˙\Í\’5ìæ\„4 \0$É\0D2\‚–§M\"\ ¸\rm¥ë-_æ\‹:u\ÍîyïxÎ≠∑¨Oü>∂\Ó∫\ÎV⁄ï\◊\Ì\ﬂˇ\ÏKg\Á\Ô≠\ÌµÅ∞æ¸f±MˇÙ€∂S˚∞Mπ?#æ¯\‚\”ˇ 2p‹Ñ\0 \0@\0Ä\0\ &Ä\0Q6∫\Í6DÄ®.oG\Î–°É≠±\∆\Zˆ\Œ;\Ô¯h~¢l\÷ií[nπ\≈zÙ\Ëë(ª™måo_\’\Ê\√x\È%@\n¶Ù\∆6*\œˆ\ﬁ{oà®`\“ \0@\0Ä\0 êjæ•¯n÷¨ô\’\’\’Uı\—\ÃL˝T\÷QEVÑlå\0XoèSÄê®qË°á\⁄ı\◊_oΩzı™ß{\—EY\ÁŒù≠ˇ˛ñ˚\Ô∏Ò\ﬂ}˜\›ˆ˛˚\Ô\€–°Cm\‚ƒâv\◊]w\Ÿ\’W_mm⁄¥âdhà\Ô0\"@D2ù\Ë\ƒC≠\ &#@T8\√A\0Ä@\ŸH¡T6:\ZB\0Ä@F	 @R0Ù\„G∑\”&⁄∏q\„j:5¢PMxrm\‰_~˘\Â6zÙh\Î“•KQ\Ô%.ó6˝É+	D!CÄ@Äàc^—ß?f/XhìgÃ±~\›:˚c4ñVï\0DUq3 \0T@Ä\"\‘¿£) \0dí@˚€úÄàq\ÍD†\ÕKu\◊q	Û\ÊÕ≥s\œ=\◊~˝\Î_\€˘\Áüo\\pAΩX;`¿\0\«w‘®Qı\'\"\Œ;\ÔºØ}Û\Õ7v˙Èßª¥=ûz\Í)˚\À_˛b≤=∏wÿ∞a\ÓdÉ.	$Aø›ªwwm>˚\Ï3\Î›ª∑˚ª\Ó\›eó]\‹	à_˛Úóv\Ÿeó\Ÿu\◊]gÎØøæ\…\ÓìO>π\ﬁ^ŸöoO±	Å\0ÒN@§˙#\Á \0Å\n\ƒ-@Lö1\€Zµla\›;¥≠¿JöB\0Ä\0\Ã òÄ\0 Pk§`™uJüL%Ç\ mπDê2i\Í‘©é»Ñ	\ÍS\'Ò\⁄\–\ﬂcè=\Ïâ\'ûhÙÑR˝Ûüˇt¢Ä]Jπ§´\ÿ	\›7~¸xó\È\√?¨Oﬂ§ç}	≤U˝ÇÑ˙“ΩS¶L±ìN:©^hPˇ\ÍKÇBp\n#∞#?\”\·\√m»ê!6p\‡@\Áknj¶x††=π\È§rß\ƒw4 2¸ÅÇ\ÎÄ@£\‚ ¿@\0àä\0DT$\ÈÄ\0\ %\‡\€˛R?∞\ÁDπ≥•ÑvQ®Ña∏•\0Å@Äxı\’W\›&∞©\≈W∏\Õxm\‰Oõ6Õù\–)Ö<\–\›˜\¬/4*@h\„_ß¥Y/aC≈ô/ºBWo°ê\0Ù€ßOüïÑä¸øDpo˛©Ö\\7s\Î>´!_uI§lkÃû@H\…«â\0Ò\ﬂj> R0EE2Ω˝ @§7∂x@ m \“Q¸Å\0 \‡Ob\∆	OUC3Ûàë#G\⁄\‡¡Ég÷¶| F\ËTAS5 $hì˛Ò\«Ø˜,HÖ§öç	\Z?˜R∫§3\œ<”â¡)Ö@Ä˛;WÄ\Ë‘©ìª7∑ü =S1B\'(îéÈ∑ø˝≠ùu\÷Y.˝R°~dWn™\'à\ZN\\ÜÜ@	PÑ:ÅAIòIq§`JX¿1ÄÄ\« <¶C\0H	Oâ\0\·I†jhfn\n&âAùôπß!J rS)\ÈƒÉÆ\‹\Õˇ\∆à@T\»Eí/84&@Lû<π>mí\∆.\Âƒ¢Eã\\›á\√;\Ã	-:©°+WÙ(%Dõoæπç3\∆zÙ\ËQ\ \Ì\‹§å\0D\ \ZÉ;q7<;\’\÷\\u∏\›c∞û.!\0@ K ≤m|Ö\0 êL…å\ÀJV!@x®\ZöY®u\Ó	•]R›Ñ˚Ôøø>\ÂRc\' Ú\”#Æic?®\Õp\√\r7\ÿˇ≥w.Vé\Ÿ_úÆR.©Aä\ZDJ\‰íq$bj®¡HC\Â`à.\ÓTö\Z*îî\‹\"%Qπ3˛å\À\‡	%r\Õua*S(â\ÁˇY\œ\È\›\Ìsú\À\ﬁgø\Ô~\ﬁ\Áyø\Ô\Á\”\'ù˝æ\œZÎªûΩ\”Û\€k≠6m⁄§ÜNˇù.\\®(†U*H\Ìê2©ÄH Ç5¥\rTU3 tÜD\–JáM√∞\—$òIë\ÓOe-òÆø˛zô3géÃü?\ﬂb6\„aöLÒ\»^\‰ü\0D˛ôªf¬µå\·/ \0Å\‰@ÄHn\ÓâÄ@\\ @\ƒ%5¯Å\0\·H¢,∫/ΩÙí9\ÎÉjD≠W¶3 t\ﬁ\√9\Áú#z ØÌñÇ+5TDPA#]t8Ò\ƒSˇ¡∞k}.hwîM\ƒ6\€lìjˇ‘£G<x∞<˛¯\„©a\’\ZáÆ´Û)¥\ÌR @hº¡ \Îtø+Ûßb∫t\ÿˆ\—G-Øæ˙™\Ïæ˚\Ó≥”Æ˝jx\·≤m\—Úeu@\0èÄ˛?˝Ä\¬ˆ\·-\»JÄ\0 \0Å,	∏væ∆åcÜPgπI≤π=åecè{7HØÄPÒ\‡¯„èó≈ãõ\“\ÁhuÇ\n:À°{˜\ÓÚ\‘SOU;Ñ:)åó/_.ù;wñIì&Iü>}ívµq∫ˆIÉ@X \¬\"\È\Ô:˛\Êñ\» \0@\0Ä\0 \0Åp	∏væ\∆˘6D∏{®\‹ja$(B˜º^∫≤L^rpΩzıí}ˆ\Ÿ\'57\"\‰\Âù\\Œµø úÑå”±$Ä\0À¥\ƒ\ )àX•g \0@\0Ä\0 \0Åp≠\≈w\Á\€n\»0°{^/ç\0Q˚Ùé1B>¸C3#…ó∂z{q˛\À\’\"8\ËwHqqqí1Öª∂3\”y#%%%¶J)ÙñÅõn∫I^~˘eô2eä4i\“$¨e±N∑\Î\Óóı?˝$\r\Î\’MDºIÚ_g˜\Œ)làúÒ0 \0\‰ë\0-òÚSÄ\0 \‡Å0Œ∑ \"\‹\na$(B˜º^\Z¢v\È\’a\’:B\Á>l±\≈µ[ƒìßÇY3˚û0∏“à\ﬁ}ì,ô\Áç\0QZZjb?~º<Û\Ã3¶\◊y\Áù\'\«wú‘©S\'\≈`’™U2yÚdô6mö4k\÷LÜ\"ßü~zNÇ¡\œ?ˇlDán∏¡¥¸\nfòÑπï jOSá5s\‡>≤˜.;âîä\»&\¬\Ôq=Ûô?¨o\Ì7àà @‰Ñèá!\0@ èBùGÿòÇ\0 \0/Ñqæç\0\·V#A∫\Áı\“Ÿß˜ı\◊_ó8@t¯¥\ÌN˙\Â ∞˚∞Ú4˛|˘Ë£èå\‡∞È¶õö\Í#Gé4b@ﬂæ}E?\œ÷Æ]+]të\ÏΩ˜\ﬁfvä\Œ\n\—\·\Ïø˚\›\Ô\‰\¬/,\'T\‘\∆/øæ¯\‚ãHà\⁄¯\√3eÙ\Íì\Œ\»\ÌÄ\ZñÒ%0\Ï\Ê9± î,ìzu\n§cãfÒâgÄ\0 \‡\'“ÑìÄ\0º&@&G\“\Î\ ¡ ÑΩ\rµ˝ˆ\€Àä+ˇ-˛l2†\Ã\Œ:\Î,8p`6èy{Ø+ü3a$`˝˙ı2w\Ó\\—ò\n\nÃí?˝Ùìå\Z5J>˘\‰π\Âñ[\Ã{I+#fŒúi*\Z7nl\Ó\”jôSO=\’{\ÌµWN\Ó @\‰Ñ/≤áı\ÍWû~Çl\"õH©îVÚ{P¡\Î.Úπh\∆›± \"\€\‹,@\0â#Ä\0ë∏î0 \0Å\ÿpm\∆h\Á\€T@D∏\r\√HPÑ\ÓyΩ¥∂è\—\“{\ÔΩ\◊\Î8\√nÎ≠∑{Ig\◊Kí\0QUífÕöe\Ê2\‹yÁù≤\’V[ôˆ\\+æ˝ˆ[0`Ä~¯\·9ãWÒ|ª\Ë?\‘˚t\Ì,˚\Ó\⁄&û\‚UN.öˇ\nàú\‰a@\0Ä@\Z∂ \0\ÿ&Ä\0a;\⁄w\Â`\"√ÑFpõ∂Ñ\Ÿr\À-\ÂÒ\«è`uñLW>g¢\Ã\≈Ù\È”ç\‡0zÙhSQô@∞n\›:9ˇ¸ÛE€û]|Ò≈ï∫Û\∆o\»I\'ù$&Lê#è<≤Jó+[ˇ´ØæíÎÆª\ŒTX¨Y≥Fz˜\Óm\Ï¥l\Ÿ2µ\Œ“•Kço:8}è=ˆ0vÙ3@?Éı™8\‡∫~˝˙Ú\ +Øò9gúqÜ¸¯\„è2f\Ã˘\Ï≥\œd\‚ƒâfElî|]Y[ˇ°æ”∂\Õd\–\€8˚!pæ™Yº^F¿>#nâ-ò\\˘¥¿O@\0Ò\'Ä\0ˇ\·! \0\ﬂ	 @8íaW \Ïm({\Ï}±\Ï\ \ÁLTºuﬁÉŒÄ4hê\Ïæ˚\Ó∆åŒÉxË°ádˆ\ÏŸ≤\√;òü}ˇ˝˜r\Óπ\ÁJ´V≠B t\∆\ƒ\Ÿgü-˝˚˜óû={ää*Üº˚\ÓªFê\ÿißù\Ãœ¥m\ÿQGe\ÊR,Y≤\ƒTd®¿†ïPw\‹qá©\‡\–!\‘¡Ä\Î˜\ﬂ\ﬂ,0\Î\Ès≠[∑6≠¶¥≈î∆∑\„é;FÖ÷πu7\ná;\Á;\◊L`ÑS\Á.ñ\∆ı\ÎJQ\Áv5\ƒÄ\0 \0Åj @∞= \0@¿6\€\»–æ+É&4Ç\€ \"Äö∞%]˘úâ*-ˇ˙◊ø\‰øˇ˝Øúp\¬	©jÄ7\ﬂ|\”¸˘Ë£è6\‚ÑV\Ë\–Ú.∏¿\‰¸Ò9πS±\‚\÷[oï\Áü^nºÒ\∆\‘\Ã	‘éVTh\Â\≈K/Ω$gûy¶\‹s\œ=“∂m€îP¢ï\„∆ç3>\ÍUq\Ì`];∫>o\ﬁ<<x∞i›∂\€nª\ÂãO\ƒ¿^á•æ\–\ƒ\Á¿¸E\Î`*˙âˇeî\ÀH*  |˙D!@\0v	 @\ÿ\Âèu@\0AÄpd∏r0à\0aoC!@\ÿc\ÔãeW>g¢\‡˝\ﬁ{\Ô\…s\œ=\'ßü~∫‘©S\'e¢¥¥T\Êœü/#Fåêw\ﬁy«¥C:\‰êC\‰\Êõoñøˇ˝Ô¶ä ó+]$\–uT`\–K+/\Z6lh˛;®∏–ñP˙s≠Ü8\Ì¥\”L\Â¬û{\Ói\Ó\—\ŸZı†ø7m\⁄\‘¸,S‚†Éí_|1%J\‰è/\œn 7C®É+JÕü\À∏\ ¬ów*q@\0Ä@&Ù\–g@a˚Ln\Â@\0Ä@$ \"¡\Z˛¢Æ\"@Ñü˚LWDÄ»î˜UE¿ïœô∞3®mèÙ0»ê!“®Q£jóˇÈßüL\ÂCÛ\Ê\Õ\Âús\Œ\…ynBe\ƒ\œ?ˇlf@l∂\Ÿf∆ó`\ÊÑ\nì\'OE¥\ZC_\◊\ﬂU†>|∏jSÅ\0Ò\Îî\ƒ\ÈΩ\“f@TU˙¿\œUâ®zˆC˘å∫5˛3 ®Ä˚ìûı \0@\0Ä\0 \0[ lë\œ“Æ+ÉY&6\ƒ\€ BÑô–•\\˘ú	3=*>h’ÄV>4n\‹\ÿ,˝\—GôY	}˚ˆ-g\Íó_~1≥^~˘eπÚ\ +k+2Ò≥bïÇV8Ãò1C\Óª\Ô>3\\Z/D≠-ó∫v\Ìj*Ù“ä\r#¥r\·á~03¥-\‘\÷[où2KD&®¸ûrD\Ìó\·…òE¶òf∑ \0@\0Ä\0 \0	,Z∫¬Ñ’©es\'\¬\„|[\◊0\ﬂ\’\”oë∫rπr0FÇ\\\…I\‹¸DÄà[F\‹Û«ïœô∞\»\Í\Ãmy§á˝\Èó\nè?˛x™%\—˙ı\ÎÕ†g=\ﬂ|Û\ÕMk£ÙÉ˛\ ¸\—6Ißúräå3Fé<Ú\»J]\÷jäQ£F\…“•K\ÕÃá≠∂\⁄Jæ¸ÚK˘\À_˛bBè;V~Ûõ\ﬂ»£è>jPOô2\≈¸˘ÎØøñIì&\…–°C´Ù#X˚\√?ù+°kø˛˙\ÎfñÑVWq\ƒ∆ß\‚\‚b\È÷≠õôk°˘\Á*#†ƒé\€6ì\”{ñˆ\’˛ÄNï~˛\\F¿=ªıô?¨º¿ò\Ì\ﬁ\◊˜\–7\ﬂ|cZ¥EqQU÷Ñ\0 êL¥`Jfﬁâ\ZÄ\0jO åÛmà\⁄ÛØÒ\…0T£n®î\0#WI Ù†\‡¿Å\Êpø\‚•3¥*b˚\Ì∑7øk´•\√;\Ãk\÷*ÑM7›¥F\‘oºÒÜ\Z=a¬ÑJà†≠\“Ù\È\”\ÕZ=zÙH\ÕoPABEéx¿Tehu√π\Áû+Õö53˜jF˜\Ó\›MeD˙’°C#íhK%V\“\◊\÷zˆÏô∫]\rΩt\Ì\‡“üı\Ôﬂø\∆ÿípÉ\nÍ≤ø\Ï≥kõ_\rséaG!\◊: Y˜˜bZ0%\·mLåÄ\0 ∞Å\0C®\Ÿ\nÄ\0 \0Å\ÏÑqæç\0ëÛ¨\Ó#AY\‰\Ê6CÆí$@\‰\ \ \ÊÛ˙≠käÈæ®»†√®µ‚Å´ˆÙÍóûzº\»&õhΩd\Ÿ\ÔRZ6t9¯s\≈ﬂ´x}÷§\À\‰é	£\ÂÃàiwJ∑>˝´\\ˇ\Ÿ˚f…ÑAE©\ÁÆ˘\Á\\iµ\À\ÓÚ\·\‚E\“\È\–\ﬂo|Æ˛Õö|π\‹qE>◊Ø|‹µXø∑\n\œ/˝pâ\\>†Øt\Èu¨Ùvq\Œ|kìüKnãƒÇíeRØNÅtlQ&<rA\0Ä\0jK\0¢∂\‰xÄ\0\¬\"@¶∞HFºé+ÉoÑjñGÄ∞\«\ﬁÀÆ|\Œ¯¬ª∂q|¡¢≠ï¥µì~\ÊóVU<¸\√r\‘QGÖ2ü¢∂˛˘ú N;!¥PVØZ)û(ü}Rzû2PçªZ\Í7hX\Â˙Å¯p\Õ?_ê=:ö˚f]uô\rR\¬Eé\ﬁe\ÎSé\ÊRè±\Ì€≠áåò~ó4Ÿ∫iXKgº\Œ%T@d7B\0Ä\0j Ä\0¡Å\0 \0\€Bm;\⁄w\Â`\"√ÑFpDP∂§+ü3	KKπpWØ^-É\r2Û)N8\·3B?wuN\≈\‚≈ãe\À-∑î]v\Ÿ%…àBâ]ˇ°~Ló˝e\Ô]Zá≤ûˆ_9Hàß§\Á\…g\»¿jà\‡\ﬁﬂ¥\‹\ÈW˜={ˇl\„O7≠R\»Ò\ ∆ßMï{¸Ûèﬁóq˙\ AZ1Ùoa.ùÒZ£®Ä\»8nÑ\0 \0\‘@\0Ç-@\0∂	 @\ÿ\Œ@Üˆ]9DÄ\»0°‹Ü\0‘Ñ-\È\ \ÁL\¬\“R.\\mˇÛ\ÊõoöÅ\‘O?˝¥îîîH€∂m•w\Ô\ﬁf¶E´V≠íå\'¥\ÿ\Õ\Í\ﬂ4ìS{&•Ak•~_≥jïL\‘_^{ˆ)9Ú\‰3d–∏k§^Ée-ù*¨˚\Ì™ˇ\ \ƒAE¶Z\‚¢iw °\«ıK›ß\Î|¯\Ê\"\Ÿ\Áê\ﬂ\Á\ÏW∫ùû\'îÅ\„&K˝õ\Âºnº*\„\Ê∫c h¡\⁄€ôÖ \0$û\0D\‚∑\0\0 \0X\'Ä\0a=ô9\‡\ ¡ Df˘å\‚.à(®&kMW>gíï¢µA@ˇ°\ﬁ\ \›ÃàÅ`jr0\"\€?Ø˛z•Lx¢ºV\\&@hDΩ˙\rS£\“\◊˚q\›:ô˛∑\‰üw‹ú\n}ün\›e¯Mw\…Mõ\÷\Ëœ≥˜ÕñâÉã§h\ƒXSaPïˇ´WÆîâÉOLâ\"/øZ\Í7lX\Ì˙\≈\Ã6\‚Hp\rWÅ§∑Œå0#2d\Õ\◊+\Â\ \rqVÃõ˙≥WóC\Â¬ûõóˆ9¥ª\\4˝.—ô©üu\Î.=O,óûÙ\'sèau˘\’RØaC≥~m˘W\Ã\◊ÿø\«\ƒ‘πã•q˝∫R‘πùç∑\06!\0@¿#%ìP \08J\0¬ëƒπr0à\0aoC!@\ÿc\ÔãeW>g|\·MÒ%\ÈyX\Ÿ\…zpÇ]\À\ﬂWØZ%\”* n®Ä®j\›Ù˚\”)\Ì”≠á\Ë°ì≠∑©‘ØÙ\Áåh1mñ4\Ÿz\ÎJ˝_Ω°\“\‚µgüî#7T@\‘k∞YïÒ\ﬂ?Àà*$Ùz±T¸s˙z\Í£˙™˜\Î˙ì{A\⁄u>\–¯1˚™\À\‰\Œ	£%›ø\‚˚7\n∫~ØSá§xë\„∏˛°\‰!\‡=÷Å\nà¯~>\‡ \0\◊ @∏ñ1¸Ö\0 \‡Gr\Í\ ¡ ÑΩ\rÖ\0aèΩ/ñ]˘úÒÖ7qƒó@ @úrd∑Pú\‘yìm¨Ä8Cø\’_\Õ\Í¿\Ëú…óõ\√˙ÙK´™{^Û\'m®Ä\Ë{a\’3≤Ò)˝ﬁ´õ+\Ìˆ/ù\Â0a@_\„⁄à[\Êà\nC{,mˆ\Ëh˛\‹|áVrÛÜJétüˇ¥bÿ¥≤!\‘¶kºÜ\›T÷Ü*\Ã\ÎR* \¬\ƒ\…ZÄ\0 sz\Ë3†∞}ÃΩ\ƒ=@\0ô\0Ñ#\Ÿu\Â`\¬ﬁÜBÄ∞\«\ﬁÀÆ|\Œ¯¬õ8\‚K ]Ä»Ω˛AdÕ™ï2q–â≤®¯)9bC[°∫\r\Zñ´ßx\Á\’y\Êœª\Ô_¯´:ã\Á6à\nJ¨ıÂØ∑Ãë;∑≠e=FY@E\‚tm¡‘†aπzè˜^ùó˙≥äFxlÆ\Ï±°,˝\Ë}πr@_˘\‰ù≈¢¢Ñr\Z\÷Û\‡î\Õvh%3\“à`}§}\’\‡\"\Èt®Vh\‹%ç∑n*A|Å(°v^Co∫\”\›#:E\…eÒ}Û\· \0@\0Ä\0 \‡GR\Í\ ¡ ÑΩ\rÖ\0aèΩ/ñ]˘úÒÖ7qƒó@ @ú|d\Ÿ3{ hdî6ã òIP\”\Î\ﬂ\Èà4B+\Í¶ÕÄ\–\Á\Á?˛à¥‹•≠iØÙ\“cIè§f\Ë\Î¡ÅøR\”\nÉøm[\Óıl˝à@I	iÒΩÚ\ƒ#F\ËXÛıç∏`ÑÅG\Á\ ù\\¡˚X\0\0 \0IDATe\Èá\ÔÀïß˜ïø≥ÿà;Ïºõ©Z\–ıT4\–L¡üıı@X)æo∂\\5d£\0±˘VM\Âπ6äZ°BAJÄòzß\⁄\'MÄ®ˇä˘π¸vf@\ƒ˜›ágÄ\0 \0@\0ÄÄo-]aB\Í‘≤π°Öqæ≠kò/¡ïö…ån\\ÆÜë 72?/ \‚ó\◊<ä\‚sf\È“•Úè¸CN;\Ì4i®Édπ PÅ_~˘E\ﬁ}˜]ô>}∫x\‡Å“∑o_π\Ì∂€§SßN≤\◊^{\Âï[ @úR&≠Ä\„µB˚\”[0\È\Î7ç8[˙\r-[lΩM\Íøwÿπm*\Óı?¨3\À?˚‘¥.\“ Å\ .≠&\–\nÉGåï™i¡î≠OÅˇ7¥`z˜\’y2|C\≈\√E∑\Ãı5ÒÒ\r¥µZ#x-5O+ Ç8*˛L\ÔM3	π\”\ÂT@\‰ı˝Ñ1@\0∞KÄLv˘cÄ\0\‹#\∆˘6DÑy#A∫\Áı\“^ß7/¡Ö-@ºˆ\⁄k2e\ π\‰íK§Mõ6yâ#\Ó¯¯\„èe»ê!Ú\‘SO\…]w\›%˝˚˜óíí1bÑú~˙\È¢˚Sˇé\…«•DØ\¬˝§\„.∫o”ø¨4Ò	º\»\Ï\œkæ^)W\r*2\’z>t⁄ù\“x+6ëı?|/3.æPV|ˆ©ùvó±‹´\’ª\ÔØ√õE\ﬁ{ı%\ﬁ\Î`πp\ÍL\Ÿx _\ﬁ˛öØW\…U™\ \Ï\‹%ç∑\“!‘øˆ∑rü Ü[!!\ÂSôØ*LrR\ ~\Á˛çI	\Í£\n$U˘ßÒ\ﬁ=˘2ôu\Âò\r\ ¸\÷2Ç≈å\Ÿ“§\È6)\È\Îo⁄ùˇäÒèª˝^ô?¨l~EmØ#é8Bæ˘\Êô?~mó®ˆ9ÜPGÇïE!\0$í\0C®ôvÇÜ\0 \0ÅÑqæç\0ëCjz4å\’dÉ\◊+\'Ä\0¡\Œ»ï@òƒßü~*ó_~π˘µ\Ì∂\€\Ê\Í\Z\œ\'Ñ¿ ï+çPTTd~\◊k˘Ú\Â2t\ËP6lò\Ïπ\Áûy!°ˇPu\ Ò\∆V\–\⁄(0ú\Ìü\Ôû|πÃ∫≤¸ \È Ç]˛£Iè¢RÒY$v\€0#¢*t†Û\’Cä§ˇEeï˘{O>]®É¢çX\"ÑÇ¢î˚NΩS∫\◊œîïñ	\Ze-ò*^–™èÀÆñè\ﬂ\\dDî\‡“ütÙü\Âo\«û˙Yó?o÷õ˚\–=©üï	1Ö°\‰Cyåw†”ÇíeRØNÅtl\—,/{#Ä\0 \‡/sKdÄ\0\\!@&G2\Ê¡`î!#@DI∑˙µ \Ï±˜\≈rXü3?˝Ùìå=Zˆ\Ÿg9ˆ\ÿc}¡Cy Pô\0°f_}ıUπ˘\Êõ\ÂÍ´Øñ&MöD\Óâ˛C˝Ø\'ˇπ¸åÖ™fs\√IgJ\\=∏¨ £≤\ÎÇ\rï©ô\Zπ]qG¸+ \"\ﬂ\‰Ä\0 \0Å\ƒ@ÄHL™	Ä@l	0Ñ:∂©)\ÔXXÉQáã\05\·™\◊GÄ∞\«\ﬁ\Àa}ŒºÛ\Œ;2r\‰HπÈ¶õd˚\Ì∑˜q\‰Å@Uƒö5k‰¨≥ŒíìN:I;\Ï∞\»=\—®˜,\‹_ˆ‹•u\‰∂|2ﬁ´ÛdDZÖCzl˝.\Z+\«W3ì\"üÆp†\"ü<∞@\0~@Ä;øD@¿.dI\ƒÙæ˛y∑B\È2pd•ø0}º,ô\'\≈\≈\≈V#BÄ∞á\¬{_,áı9£CÑ\ﬂ|ÛMô<y≤4h\–¿\‡ô5kñúx\‚â“±cGπ\Áû{§m€∂r\Ÿeóô˘\È?˚Í´Ød‘®QÚË£è\ UW]%u\Î\÷5mwÙ~Ω\ﬁx\„\r?~º<Ò\ƒ≤\”N;°\„∏„éìü˛\Ÿ|˛Õô3G\Œ9\Áy¯\·á\ÂÈßüñ[nπEt∂˛|¯\·Ú\÷[oô\Áı∫Ò\∆•Kó.\Êø◊≠[\'3fÃê©Sß\ ˚\Ôøoπµ}\‘ ?˛¯cj\ÌÙ54∂ÎØø^v\›uW\Î¥i”§k◊Ær\ÂïW\ .ª\Ïí\⁄U˘\\ßNù_mù\œ>˚L\Ó∏\„©WØûYK\Ì©†3h\– π\¬e\Î≠\À˙˘ßØ©?˚\À_˛b\⁄5j\‘HJKK\Õ\‡oeª\€nªFØºÚä8∞\ ◊î°∂<zÚ\…\'\Õ˙/æ¯¢l≥\Õ6r¸Ò\«\À\‚≈ãS?+,,L\Â≤Gè\Êø7\ﬂ|sy¡\Â∫\ÎÆ3vîù\⁄f6TåIÛ”ßOπ\‡Çå?˜\ﬂø\…\…˙ı\Îe‹∏q&\È-òHW\\qÖ®°˚¶†† “∑ù˛CΩ\Âo∂ë˛\Ë©ü\◊˘\”Gú%\√nû#-*œû3q¨\ﬁ\Ô/\Â~n3ˆ	T@–Ç\…\Ê¡6 \0ø @¯ïO¢Å\0 \‡\"G≤\÷¡`\‘\·\"@DM∏\Íı \Ï±˜\≈rü3?¸É9(◊π_|q94è?˛∏¸ıØM	z¯¨á\Ì\◊^{≠˘ô\‰_s\Õ5≤Û\Œ;Kœû=\Õ¡ªd\Î\·æ\n.4\¬Fﬂæ}•~˝˙\Ê`\\á\Î¡ª˛Yo‹∏±Zº\ﬂ~˚!Cm€£\÷zàØ\œ\ÍÅ˝ÿ±c\Â\√?4\≈[l!7\‹pÉºÙ\“KFîPa‡¢ã.CÙu˝π~˚^\◊\–ÿé9\Ê\Ÿl≥\Õ\Ã˙\Áü.˝˙ı3≠¶æˇ˛{9Û\Ã3Õ°ø∂†\“˚´Û˘ÑN(\«\Á\€oø5k\ﬁw\ﬂ}“´WØ\‘\Ã\Âp\∆gòÉ}ı˚\À/ø4ï\0:A\·>˜\‹srÍ©ß\Z1‰®£éíˇ˚ﬂÜŸò1cå °LU†\—|T˜ö\Ó´˝fÕö•˘U|QD1©X£Çéä\ ]m≠^Ω\⁄0S¡HHˇ\Ìo3-ì>¯`\√D%†\Œ>˚ly˝ı◊ç§˛©h£Ò©†B∆Ω˜\ﬁkˆ»§IìR3 H*v®\›;\ÔºS∂\⁄j´H\ﬂv≠∂¶(§ˇòÜ@W¸=ôØ\ﬂ{ı8ô]a\ﬁ\≈N{\Ï)\√næ[ZÏº´∫]˘P\Ô¸ÚsAÄ`u§oqá\0 ê(âJ7¡B\0à%àX¶\Â\◊NÖq0òèP ÚAπrˆ\ÿ˚b9å\œ=D0`Ä9§Ü|\ÊÕõg£É\n˝π*\Îa≥˛l\«w4¸ZqÚ\…\'õ\√m}}\ﬂ}˜ï÷≠[aA\”+^CÜ1á‡ØΩˆö˘fΩV?\Ïøˇ˛©€™≤{˚\Ì∑\À\ÏŸ≥ÕÅª\n+V¨H≤´]=\Ë\÷ﬂõ6m*U≠ë~è\Z\‘o\ÁÒ\≈\∆O jÚ9®	úU\„\‹sœïV≠ZïpnΩıVπ\Ì∂€åø˙9´˘Z5∞\«{H≈∂E/ø¸≤*¶Lôb\ƒ,¥\"b\‡¡R\›k\Í\√#è<b*8‘é\ÊCÖ]Î©ßû2áˇö4\∆\Ó›ªõˇVqD\€m¢U†8ˇ¸Û\rOı[c\‘?k>\'Núh~\◊K+M\‘\'ıS\„\–K}\’}£{®\‚˛ô;wÆ\'ﬂ¢|\ﬂ\È?\‘whæçÙ?¢õ3{©?o\–#x]\Ãó¯LúˇQæ\√YÄ@≤ @$+\ﬂD@ é ‚òïJ|\n\„`0°\"@\‰Ér\Â6 \Ï±˜\≈rü3UıWF5	Z\Âp˜\›wõ\Ìv\Ì⁄ôo\Ãk≈Ç\n\0_˝µiÀ£\–\⁄®≤´≤ı3µ´˜˝Ú\À/Ú\Óª\Ô\ZÙ[¸Z…êã\0°\’ 5˘\\1é\‡æEã\ÂWz˜\Óm|”∂Pzi\’¡?ˇ˘O\„£V®\œzhØï\⁄n\È˘Áüó£è>\⁄Tât\Ó\‹Y6\›t\”j_\”5@É†ö‚°á≠^Q±@+={\Ï1iﬂæΩ(\“§†MñÆ3s\ÊLSy¢¬íä)∫^≈òÙµøˇ˝\Ô)\∆˙\\∂˚\'™˜û 6¥`Rù!∏™˙˛>ØópÖ\œDZ0!@Dı\Óf]@\0\…#†á>\n\€\'/p\"Ü\0 \0Å\ÿ@ÄàM*™w$åÉ¡|Ñä\0ë ï\€@Ä∞\«\ﬁ\Àa|\Œ¸\„Mõ†Ù+B\€2iõ%=º÷Éo\"Ùê∫yÛ\Ê\Êp]‘µïí~\÷Tºr tNÑ\ŒL\–6@*Ä,Z¥\»|\„?B´jÚπbU	\ D\€@i[#≠j\–6MZ°≥¥›îVD§\œMXªv≠¥2A\€Mò0¡Tóh{©\Í^Z5\È=Z≠†3!¥Em}¸Ò\«\Êg*zh˚®†BE+&¥uí\n6¡•‹¥\nD* *Vô\Ë≥5	\⁄*ü}\Õà\ Z0U\’zâüª¿k\“\Ã˚d˛∞æ9}tk˚≥oæ˘F\Êœüü\”:U=å\0	VÖ\0 \0@\0Ä\0,@Ä∞\0Ω6&\√8¨ç\›lüAÄ»ñXx˜#@Ñ\«2©+ÖÒ9S\›Ù[Ù\Èá\’øAØ3!Ùõ˜\⁄\„ˇ\”O?M\ÕA\–˘\⁄\ŒHá\Îph≠hÿ∞°©\–ıT\ÏX∞`¡ØZ<i.k>∂\€n;#:\Ë\–\Á@\‹≥Su>\Î∞\ÈÙ+ tNE˙∞e]C+¥•ëŒ§\–\›\⁄˛iáv¯’°Ω∂6Rv:$Zg8h•Å\n\⁄rJØ™^*ûy\Ê#\∆\ËPiù°™ï≠2\“\nî-∑\‹“¨≠óVf®ÿ§æûv\⁄i©Ptπ∂{\“\÷VZyQô\0ÒØ˝À¥\⁄Joô:W£¢Äï\Ô⁄Ç©LÄ\‡Úç¿$Z0˘ñR\‚Å\0 \0@\0Ä\0bL`\—\“∆ªN-õ\«\ÿÀçÆÖqæ≠kòØ(\Í7m]π\¬8\ÃG¨a$(~˙h\¬«¨\Ê7¶∞>gÙYø±Øs\“g|Ù\—G\ÊõÛ˙m}mØ§\ﬂ\Ã\◊\‘*:ËÅ∂Q\÷\√r˝æC÷Å\∆:8y˜\›w7á\€*$hEAIII\nåù÷Éx≠å(..6Û*~_\€\È\œu\ÌΩ˜\ﬁ[?¸çM≠≤\–o\”\Î7Ùµz@\€\È7\ÏW≠Ze^\”\“˙-~C¥5S\≈5tÄ≤VI\Ë\Z*¸Ù\”Ofµ\ŒG\–a\÷:∏π:üUh\—˚tù©SßöÅÕÅ\0Òˆ\€o6˚Ï≥è‘∂∆Æ¸4é+Æ∏\¬ƒ≠l4n=\‡WÆ˙9†ü\√*\Ë h≠éPë@\ÔW*\ÿh%DeØ©£\◊˛Ûs¯ØÉ\ƒu≠B\—\’:øC[aiûtÑ^\Z≥äZ)°˛\Í\ÏçO>˘\ƒWüT\‘\—g\œ;\Ô<iŸ≤•ô±TØ\ËZ\⁄*J+Eîsõ6mÃ¨\nö÷Ø_/:\€CÛ\\\ZÉÆï.\ÃDı	f@úùQZ\ÊÛÜa¸\Ÿ}ì\Ô§\"™˜\ÎB\0Ä@¸–Ç)~9¡#@\0à7Å0Œ∑ \"\Ãq	ä\–=ØóFÄ:Ωy	.,Bè9\“|\Î~˚\Ì∑O˘Æá\’˙-v=Ñ÷π\0c∆åëeÀñô\√k=`\ﬂkØΩ\Ã¥∂[RÒB\€ \È!∂~Û^´Ù\‡˜ïW^ëq\„∆ôô*\Ë¡∂~C_\ÂU\‘–´Cá¢\"àæ\'\‘^s}\Ì\≈_îgü}\÷|\√?∏^x\·3A€µ\"A˝RAA\·’ØFç\Zôo\ÍW\≈5th∂V®ê†vıRAEmk%CU>\Î\Á•\nZ’†\Ì\\t®¥^\Z≥\⁄Tq%\–<l\ÿ0\ÈŸ≥gjéÉ\“k&$îµV\ZhÂÉÆß≥,t\0¥Ú”É˝Nù:ôxïØ\ﬁS\’kA|¡\‡i˝≥\ÊJái\Î•~j%ÑÆ©˘.MfÃòaù!Òá?¸¡à*ˆ®ò£¬â\ÊXgF\ËprÇ\Á5ˇ:\‰ZE#Ω?û≠<˛Ùß?Iì&Må¥ï\Ê\‰∞\√ã¸˝†Dè˜ì;∑Æ¥S\‡@U\róxΩå@\\˘L¶\"Ú˜ \0@ >Bü\\\‡	 \0∏A åÛmàsFÇ\"t\œ\Î•\„$@mTÙ\–QØ\‡0Vá	\«Ò\næuÎÅ≤hß’ç£\ﬂa˚ñ\0°BÉ\\\Î∑˜uh1WıTXy\‰ëG\Ã˚Dˇª≤vEIg¯Í´Øö˘*∞¢DîLÙ\Íıâ\“DVk˘Òr\Õ¿æRÚŒõ\Êπ„áèë\ﬁÁèíO<\"˘Ω\‘k∞Q\ j\·Ñ\ﬁ|µJñIΩ:“±E≥Ñfâ∞!\0@ ,aëd@\0®-Z0’ñ\\ûü\Î`0j∑ ¢&\\ı˙q “á\‚\⁄#ìù\Â™g∑äõwá˘9≥|˘r”éH\€˝hõ Æ™	|¡¶R\‡ÄHµ`“∂P\⁄~äK\Ã\–l≠®\–*àùè´LÄ¯ÛS¡\Í¿r~ˇ¸\Â\«\ÔÒ·Äû\«J\ÔÛˇfÜbøø`æ\\|\‘¡Ú˚¢3\‰\‰KØíz\r6K√í_ˇ6ù∂√ß6ˆ] Ú±œ±@\0\… Ä\0ëå<% \0Å8`uú≥ì\Ê[òÉQÜå\0%\›\Í\◊FÄá=D°t8≤Rò/L/KÊôôô\\\ÔΩ˜ûô5†BÑ∂\‚*O@[\È¿gm∑t\‡Åö9¡ºÑm∂\Ÿ∆¥ö™SßN¢±ik¨K/ΩTÙ\Ô@m\…Ãèà\Zä˛CΩ˚\Ôˆì=vﬁ©\ÍÛ\Ì\‡úø™Û˛ê^\‡\ÍqÚ\ ?îÛ¶œë\Ìªk ü/?˙@ä\Á\‹&}Üéñzi-±*\Ì•Ωê*\Í!˘ó≤\Á\–˙\◊\‹ˇQ\Ôq÷á\0 \0Å\‰@ÄHNÆâÄ@\\	 @\ƒ53¸BÄp$Q\›DÄ>DxÑfd\È“•fÆÉëNüN∂¸Z•b\Î2\–\\qﬁÇ_\◊\Õm∑\›f\ƒ+ù_ë\œKˇ°ﬁ¢˘6Ú\Á›§TJe\Ÿ\ƒ\⁄\Ô\\sπ\‹;qå^t∫ú|\È\’R∑AÉî?Ø=Ò\“\·ê√•~ÉÕ¨˘gõOm\Ï_K¶|æù∞@\0ñ	 @XN\0\Ê!\0@@ \Ÿé$ ¢õ\·¿GÄWÄ\'+¨Å¸\–®o\ﬂ|\È\”˝\–¸\ZÆ\ƒ⁄ãŒñ\œ\⁄8]oÛè\Á•\Ì~˛\ÍnùqΩŒäx∑lVDüac\‰\ÿÛG\…˙\÷\…\Ã\—\ 3w\Œ0??ÛÜ;§YÀùd\Ã\—]e\œC∫\À\Ÿ7ŒîÕ∑j*^3N\Óõ4\∆\‹sX\—\Èr\“\ÿ\…\Â\ÊKTız∫è˙\\\Îù\‰ñ\·É\À˘`dö\◊9P1u\Óbi\\øÆun\'t¯@\0@Äp0i∏@¿3é$¬ëDYt\”Bá\ﬂˇ˝r\Ìµ\◊\ +Øº\"ù;w6Ω›è>˙\ËTk˝\∆¸eó]&<Ä\Ï±\«2a\¬\—ÿ¥ı\ /ø¸bûõ6mö˘F˝;\Ôº#\◊]wù\‹z\Î≠RXXhæm<€∏qc3\Ã˜å3\ŒH}Ûæ¶\◊5}\ﬂ∆òé	Å8	ä$˝\‡?Q∫à[4\ﬂ\÷\nO\›>Õà	*6tl?˘\Ó\Îï2\ÂÃì\‰\ÕÁûí\ﬂıg\ŸfáñÚ˝ö\’Ú\—kØ\»9\”\Á\»Àè\‹g\Ó\◊5[\Ï\‹\÷\‹€¨\Âé)\"°¶\◊Å£M\«}SbHUÇâ≠t#@\ÿ\"è]@\0∞A\0\¬ulB\0Ä@:GˆÑ#â≤\Ë¶\ƒcè=&W]uï\‹~˚\Ì≤\Ì∂\€\ \’W_-è>˙®Ãû=[v\‹qG\—~\Ô\⁄vÊ®£éíO<Qñ,Y\"(\'V\\r\…%Ú\÷[o…å3\‰\√7\Îq\ƒF¨x¡\Õ˝*>|˙\Èßrˆ\ŸgK◊Æ]\ÂÇ.0\‚DuØò\Ï!@ @X|c:&\‚8≠Ä®8+¡“ü?xı%sL\◊rÑvl∑ßú3mél∑ÛÆÚ–Ü\Í≠z¯\”˘£$∏ˇ\Ã)wHa\Ô~Ú›™ïr\√YeÑV)çô,üæ˝∫7é:Zn>XTº8ÎÜôRo≥\Õ\‰\Œ\—ñâ\”\Êàl\"FL®\Íıt˚f\Ì±ìe\Â\ÁK\Â˙Ae\’*@\Ï∫\ÔÅfù8º~V¸g@Pì‹Ä\0 \‡=ÙP\ÿﬁÉHÄ\0\\%Ä\0\·H\Ê IîE7] T∏˛˙\Î\Õ\‡›äá˝ï˛k¸/æ¯\¬\‰≠_øæºˇ˛˚r¸Ò«ã\n\«{lä∏ﬁßBC≈´gœûr\Áùw\Z—£∫◊∑\⁄j+àCïüwCÄ∞¯6\∆tû®\»9}˙t\Ÿnª\Ì*µò.@X\“™<ß\◊Já)imñÜ\‹pá\ÏuhπaCu\√q\⁄.UÙ{\Õ\◊+\Â\∆\r˜®Hq\Ã˘£Rz¿Kï¥y\n¿å˛\«ÛÚﬂ•ü˛™\rT˙\Î\⁄JÖå˚\'ç)7\∆Nñˇ~±4\Âß\nª\Ïw`\\ÙôB¶<Ω\”0@\0Ä\0 \0@@ò\·\ &@Äp%Sˆ¸tAÄP:•••RRR\"˜\ﬁ{Ø\‹u\◊]≤È¶õ\ =˜\‹#m€∂ï\◊^{Õ¥Vö9s¶\Ïπ\Áû\Ê¨Y≥åÄ†ø7m\⁄4%@\‹x„ç¶\Ìí^?¸É\\x\·Ör\‡ÅJˇ˛˝ïÑö^OÄ\n{\Ôb,ÁãÄ∂t\”\ÎÄ0ïQÖà@Ä8ˆ˜:¢2	\"¥™ØÙá˜zÒ¨[dø#ˇ$õoµµ%:\”\·Æ1C\Â\Ÿ;g\»\‡)wH\«C{\»\‘\r\’\r\«\r-«ú7jÉ˝˚\Ó\Îˇ\ ‘≥N6˙L\·±}S\Î\Õ{pé\‹tˆ\…“™›ûrˆ¥Ÿ≤\›ow-˜|MØ´__{π\‹?i¨t+:]Nsï¨TbP?˘\Ï\›7Âíáüó]˜˚]\ \ﬁ\∆<GœØ≤¸\›0\Î~ô?L\„Ø˝•ïw\ﬂ|ÛçÃü?øˆãTÛ$ë`eQ@\0Ä\0 \0@¿ÅEKW´ùZ6∑`={ìzf†Áóπ\\∫Ü˘oÆ\Â\‚D∂\œ\"@dK,y˜ª @¨ZµJ&Núh*\Z¥\’\“ˇ˛˜?3ß! ÷≠[\'#Géî\Õ6\€\Ã¸˛˝˜\ﬂ\À\·√çP±\"]Ä\–\Átù-∂\ÿ\¬\‹WßNùr†¶\◊\”oFÄ@ÄHﬁßGÚ\"\÷Í©áz(∏\n:wf˚\Ì∑7?+/@\ÿ\ÂÛµ\„§Y´\÷Rxløré\Ã{p∂\rÙpß{\À]c.4ÇÑïrC\ŸP\ÈÙKg@\"Eô\0±qΩº$ónh\ÔT&îp]\”\ÎjG˝\‘\nà2bÚ¢oö\0Ò\Î°Ÿ∂\»\ﬁ@&[\Ë±@\0–Ç\…tLB\0ÄÄ\” é¨4Å/L/K\ÊIqq±\’áë ´8l<\Ó\ƒ˙ı\Î\Â\‚ã/6Ñë†≤\√˛˜\ﬁ{O&Oû,/æ¯¢©l\–Y\⁄:i\Î≠ı€øRiÑ˛\\[0ç=⁄¥f\“¡\”Mö4z≠≠ó˙Ù\È#∑\›v[µØ´x°Ñ\√∏û≠æ™¯EÑ@à\Ë=\Îy\Èv¿æ≤˚ow\⁄¯˙`\Ì™z2EÙ˙\√◊åìÆ\Z+ΩÉ ÜRë\ÔæY)S\œ<Yöµ\⁄Q˙èæJ\Í5l(*\\v\Ã!\∆sÔπ£\Ã}˛˘∞\⁄ˇ43ÑZ+ \ﬁz\Ó©\‘\ÎAO§ı?ÆìY**:t\Ì.CnºC6ﬂ≤©ºˆ\‘ˇ\…ˆøm+MwhY\Ì\Î:Bà&çï\‡˘5+W\ \rÉ\À* T8\–T\\T3\"\"~©ñ¥ıoúMDonÖ\0 \0\«	0Ñ\⁄Ò\‚> \0\‰ù@\Á\€T@Dò∂0°{^/w\"hÉ§BÑü÷É?$≠}\ÿU$P@ø}<i\“$:thJp®ò¥∑\ﬂ~[˙ı\Î\'7\‹pÉ|¡©ó?¸C)**2´”ØkØΩV\Œ9\Á˘Ë£è™}=h…Ç\0Q&@®®˘¬¥q^øg¢n\À-∑4mYj∫¬æØ&{ºû9Å-ZH\Às\'…ô˝˚î;/Øx>ûØ?œ∫Uˆ;Ú˘Ú£˜Â≤¥!‘Ωué\√y£ ùØóâUw8§ªæa¶\‘o∏ô\Ã\⁄P!¯]Òym\ÎTÒ~wl?£ST˜˙¸\r\’¡\⁄ZÒ\’\“#vË•≠ù\Œ\“aŸø›µ2=¿¨ü/û™Mu†bA\…2©Wß@:∂hñ˘\Ê\ÂN@\0Ä@% \ÿÄ\0 `õ\0-òlg C˚¥`\ TÇoãª\0°©y˘Âóç∞b\≈\nπË¢ã§[∑n¶Só.]dƒàÚ\÷[oI˜\Ó\›eÕö5\Â2Ÿ°CS°≠ô:\Ë Û\⁄\Óª\Ôn™N8\·Ñ‘Ω*B\\~˘Â¶µääCÜë\”O?]\Z6lh\Ó©\ÈuΩÇ\nàå$*Ùö* ˜;.Q<í\ÏMT@$)\ƒ\n@\0\—@Äàñ/´C\0Ä@\Õ¥†^\n\€\◊|s\Ó\„ˆT@Dò\»0°{^/\ÌÇ\0QSÙõ\„*DhUD≈´gœûfıV[mU\”29Ωé\0Å\0ë\”\‚a\'d2\‚\–ˆï\›⁄¥\ﬁ\–3(+öÃü\À∏\…¬â∑)NB\0Ä@H B\…2Ä\0 PkµFó\ﬂ©Ä\»/o≠˘ @|¡¶J\·\»#èî†%í\ÊBáH?¸\√r\‘QGI£Fç\"MD§å\≈cA ¯|—ô>¯†l∑\›v\Â¸\“®o\◊l9˙˜álúQ\’\Ï~æQáÙàòˇ>mN¸g@–Ç)8@¿^§ë  \08M\0¬ëÙ!@8í(ãn∫.@¨^ΩZ\r\Z$ÖÖÖ¶≠íù\÷CBù±xÒb—û˘ª\Ï≤K\‰Ñ  \"\ﬂd∞N@\≈L≠¥™(<éï ¨{ãaò\Ê@¶©sK\„˙u•®sª∞\√g=@\0HàÑ%úp!\0ƒê\0DìRôKé$ ¢õq û|ÚIC§Gè2k\÷,i⁄¥iïÑt(ıõoæ)S¶Lëßü~ZJJJ§m€∂“ªwo3\'¢U´Vë\—\’\nãÛ\œ??\’˙©c«ér\œ=˜˚I∫\\˘úIRNà\’˝á˙∂Zq¯!Rö66π\Ïã˝A\…C\≈˛\\F\¬7\œy@\Ê\Îõ\”\Ê:\‚à#\Ã¿˘˘Û\Á\Á¥NU#@DÇïE!\0$í\0D\"\”N\–Ä\0bE\0\"V\È®\⁄WôaoC\≈IÄ∞GÀπp\Âs&óyôà£?$ì€π\«17;–Ç	¬±MÖªÄ\0bL@}\\˙cå∏@\09@Ä\»^>u\Â`\"üª¢º-{\Ï}±\Ï\ \Áå/ºâ#æ\‚è*@îñälí6\‘ ¯s\≈ﬂÉ\ ^/\„c>3\Ó¶\"æ\Ô><É\0 \0@\0Ä\0|#Ä\0\·HF]9DÄ∞∑° \Ï±˜≈≤+ü¢K§Ç\0\0 \0IDAT3æ&é¯(\'@\ƒ\◊M<´%ÅT@‘íèA\0Ä\0 \0@\0»û¿¢•+\ÃCùZ6\œ˛aOÑqæ≠kòØ2j\œyW.W\√Hê+9âõüqÀà{˛∏Ú9\„Y<vç@ @Ù:¨´©kÆ†Ç?ópï«≠T@∏ˆñ\ƒ_@\0»Å\0-òrÄ«£Ä\0 êHaúo#@D∏u\¬HPÑ\ÓyΩ4Ñ\◊\È\ÕKpy¡å®\0\—eˇ}d\◊6≠\Õ\ÿ\ÈçG\Ìi≠ò¯π≥\\ x\‚\" \0ÑFÄ!‘°°d!@\0HÅ0Œ∑ \"\‹,a$(B˜º^\Z\¬\ÎÙ\Ê%8àº`∆àÙ\Íß\ﬂ\›¡SΩ\Â∂{\‚?bA\…2©Wß@:∂h\Ê¿;!\0@ \Œ \‚ú|É\0 ê¥`r$œÆ\"@\ÿ\€Pˆ\ÿ˚bŸï\œ_xG|	\‚Ñ\ﬁ\Œ~\√\Â§z\Â\‰6Z0\≈˜›ÅgÄ\0 \‡\Z\◊2ÜøÄ\0¸#¿jGr\Í\ ¡ ÑΩ\rÖ\0aèΩ/ñ]˘úÒÖ7qƒóÄ˛CΩP[0µﬁâFK\ 0∑;P\ﬂwûA\0ÄÄk \\\À˛B\0è\0Ñ#9u\Â`\¬ﬁÜBÄ∞\«\ﬁÀÆ|\Œ¯¬õ8\‚K@ˇ°æÈ¶õHÉ∫u\„\Î$û’ö¿˜?Æó˘\√˙\÷˙y}à#éêoæ˘F\Êœüü\”:U=L¶H∞≤( \0ÅD@ÄHd\⁄	\ZÄ@¨ @\ƒ*U;\„\ ¡ ÑΩ\rÖ\0aèΩ/ñ]˘úÒÖ7qƒó¿Kü|)üˇéL\Ó\›5æN\‚YNö4®ó\”ÛQS\Á.ñ\∆ı\ÎJQ\Áv9˘\…\√Ä\0 \0ˆ\0 \0\ÿ&Ä\0a;\⁄w\Â`\"√ÑFpDP∂§+ü3	K\·Z ∞¯ÛØ\‰¶À¥æá[∞éI @∏ê%|Ñ\0 \0%Ä\0¡>Ä\0 \0\€ lg C˚Æ\"@dò\–nCÄà\0j¬ñt\Âs&ai!\\í @\Ë˚Ω∏∏\ÿ]?L\"@¯ëG¢Ä\0 êz\Ë3†∞}B%F@\0à)àò&¶¢[Æ\"@\ÿ\€Pˆ\ÿ˚bŸï\œ_xG|	$AÄ\‡\Ô\Î\‹ˆDn¸x\ZÄ\0 \0@\0HGr\Ì\ ¡ \Zˆ6Ñ=ˆæXv\Âs\∆\ﬁ\ƒ_Ò\ÕM\\<CÄàK&Ä\0 \0@\0à;ÅEKW;µlwWçaúo\Î\ZõàHiii©A´ìÆÜë gí3G bñ\›q\Âs\∆A¥∏\ÏÅ$¥`\ mS\"@\‰∆èß!\0@ h¡î?\÷XÇ\0 \0?Ñqæç\0\·^#A∫\Áı\“^ß7/¡!@\‰3F ∞lıZYX≤\\zuh„Ä∑∏hÉ\0Ñ\r\ÍÿÑ\0 \0Å\⁄`um®Ò \0$ô@\Á\€\Ó†0°{^/ç\0\·uzÛD^0cÄ@\‘ƒÇíeRØNÅtl\—\ÃZÑ\0@\06	 @ÿ§èm@\0P¥`rd∏r0à\0aoC!@\ÿc\ÔãeW>g|\·M∞IÄLπ—èZÄ\»\Õ;ûÜ\0 \0l$Ä\0¡nÄ\0 \0\€Bm;\⁄w\Â`\"√ÑFpDP∂§+ü3	K\·Z êÑL¸}ù\€\∆BÄ»çOC\0Ä@˛ @\‰è5ñ \0@†ré\ÏW9–∞∑° \Ï±˜≈≤+ü3æ&é¯H\¬j˛æ\ŒmˇE-@–Ç)∑¸4 \0l$Ä\0¡nÄ\0 \0\€ lg C˚Ær†ëaB#∏\r\"®	[“ïœôÑ•Öp-HÇ\0A¶\‹6V\‘\ƒ‘πã•q˝∫R‘π]néÚ4 \0$û\0D\‚∑\0\0 \0X\'Ä\0a=ô9\‡\ ¡ Df˘å\‚.à(®&kM˝úy\È’Ö\’}\‡˛˚Jqqq≤¿m\‚$AÄH\\RC\"d†,@\0ë@Äà-C\0Ä@Ü 2e˚6\€àø}à¯\Á(\Ó~¡\Â\\ºo—á\Ê\œ}:\ÌR\Ó\Áª\Ó∫k\‹C¡?\‰D\0\"\'|âx\"i&H@\0^\–CüÖ\ÌΩàÖ  \0@¿Mé\‰\r¬ëDYt\¬\"|OMªˆÑßi ,í @–Ç)∑çÖ\0ë?ûÜ\0 \0@\0Ä\0íC¿µÛ•0:¸\Ë\ZõàHiii©3ôFÄp&U\÷EÄ∞Ü\ﬁ[√Æ˝\·m\",\Ôí @ÑÒ?TyOLå\"@\ƒ(∏@\0Ä\0 \0ƒö¿¢•+åùZ6èµüÅsa¸{\"\¬Táë†\›ÛziØ\”k%8+\ÿ1\Z1HB\Ã]@ÄàyÇpÄ\0Rh¡\ƒfÄ\0 \0dG åÛmà\Ïòguw	\ \  7ß @∞\¬&Ä\06Q\÷sÖ¿≤\’kea\…r\È’°ç+.g\Ì\'-ò≤FV\Óà\‹¯Ò4 \0\‰è\0C®Û\«\ZKÄ\0 \‡Å0Œ∑ \"\‹a$(B˜º^\Z\¬\ÎÙZ	\¬\nvåB\0àZÄXP≤L\Í\’)êé-ö9@!\0@ \Œ \‚ú|É\0 ê¥`r$\œÃÄp$Q\›DÄ∞\ﬂS\”û&ñ∞ \0Åú	D-@\‰\Ï @\0Ä\06@Ä`+@\0ÄÄmÆù/ÖÒ{* \"\‹ua$(B˜º^\Z\¬\ÎÙZ	\Œ5Ö\⁄\n$åzIÄL^¶5‘† B\≈\…bÄ\0 !à\·≤4 \0dD\0\"#Lˆo¢\¬~\‚\ÓD\‹3ÑÄÄ+B\ÌJ¶\Ï˘µ\0A&{π\≈2 \0\ﬂ @¯ñQ\‚Å\0 \‡GrÜ\0\·H¢,∫â\0a>¶!\0Ø @xï\ŒHÇâZÄò:w±4Æ_Wä:∑ã\ƒÖ\0 \0Å\‰@ÄHNÆâÄ@\\	 @\ƒ53¸BÄp$Q\›DÄ∞\ﬂS”¥`Ú4±ÑU#Å$˙ˇ\≈\≈\≈5≤\‡Ü\ 	 @∞3 \0@¿Æd\n?!\0¯K\0¬ë\‹\"@8í(ãn\"@XÑ\Ô©i\◊˛Ç4\rÑeÅ@XΩ2â\0\·U:	ÄÄ\◊Ùˇ\È∂˜:FÇÉ\0 \0Åxp\Ì|)å\«°épOÜë†\›ÛziØ\”k%8\◊˛Ç∞	£^@Ä2≠°Ö\0*NÉ\0 \0@\0Ä\0<&\‡\⁄˘R\Á\€n\Ë0°{^/ç\0\·uz≠\Á\⁄_V a\‘KI h¡î\€\÷EÄ»çOC\0Ä\0 \0@\0\…!\‡Zã\Ô0Œ∑ \"\‹\ﬂa$(B˜º^\Z\¬\ÎÙZ	\¬\nvå∆Ä@˛æ\Œm£!@\‰∆èß!\0@ h¡î?\÷XÇ\0 \0?ÑÒ\Ôeà˜B	ä\–=ØóFÄ:ΩVÇCÄ∞Ç£1 ∞lıZYX≤\\zuho¢qÅøØs\„ä\0ë?ûÜ\0 \0Å¸`u˛Xc	Ä\0¸ ∆øó \"\‹a$(B˜º^\Z\¬\ÎÙZ	\¬\nvåB /h¡î\Ê®à%À§^ù\Èÿ¢YnéÚ4 \0$û\0D\‚∑\0\0 \0X\'@&\Î)\»\Ã=(¯y∑B\È2pd•º0}º,ô\'\≈\≈≈ô-\—]Å\Õ`Yà qKV ≤\¬\≈\ÕÄ@ÇD-@$%°B\0Ä@\ƒ \"\ÃÚÄ\0 P#\◊Œó\¬8ﬂ¶¢\∆mQ˚\¬HP\Ì≠\'˚Iàd\Á?ä\Ë]S®£`¿ö\…$êÑL\…\ÃlxQ#@Ñ«íï \0@ Z\—Úeu@\0®ô\0DÕåbq±HC¨ù@Äàuzppà@ÜP”Ç)∑\rµ\0A¶\‹Ú\√\”Ä\0 ∞ë\0ªÄ\0l@Ä∞ùÅ\Ì#@d*¡∑!@$8˘ÑÑJ 	ãπmô®à©sK\„˙u•®sª\‹\Âi@\0H<à\ƒo\0@\0∞N\0\¬z\n2s\0\"3NIæ\"\…Ÿè&vZ0E√ïU\„O\0\"˛9≤\Ì!Ñ\Ì`Ä\02%Ä\0ë))\ÓÉ\0 \0Å® @DE6\‰u B\Í\·r&\’rHÆ˝a\Ê=\"êÇLπmXà\‹¯Ò4 \0‰èÄ˛?˝Ä\¬ˆ˘3à%@\0Ä@Æù/Ö\—1Ä!\‘æ\r\¬HPÑ\ÓyΩ4Ñ\◊\ÈµúkAXÅÑQ/	$AÄ2qy\n\"è∞1@\0Ä\0 \08M¿µÛ•0Œ∑ \"‹≤a$(B˜º^\Z\¬\ÎÙZ	Œµø ¨@¬®ó ºLk®A!@Ñäì\≈ \0@\0Ä\0 \0è	∏\÷\‚;åÛmà7t	ä\–=ØóFÄ:ΩVÇCÄ∞Ç£1 êÇLπm4à\‹¯Ò4 \0\‰è\0-òÚ\«\ZKÄ\0 \‡Å0Œ∑ \"\‹a$(B˜º^\Z\¬\ÎÙZ	\¬\nvå∆Ä¿≤\’kea\…r\È’°Mºâ\∆˛æŒç+Dn¸x\ZÄ\0ÚGÄ!\‘˘cç%@\0É@ˇ^FÄàp/Ñë†\›ÛziØ\”k%8+\ÿ1\nÅº\‡\Ô\Î\‹0G-@,(Y&ı\ÍH\«\Õrsîß!\0@ Ò ø\0\0@¿:Z0YOAfh´Ñüw+î.GV˙¿\”\«K¡íyR\\\\úŸÇ\›≈ÅFD`3X\"H‹íà¨pq3ú\"@¶\‹\“µ\0ëõw<\r@\0\ÿH\0Ç\›\0@\0∂	∏væ\∆˘6\Ó∫0°{^/Ω\≈[\»\Í’´MåárHJå\“C¶\Áû{éü\√¡\ÏÅlˆÉ*\‘g¨º6˚á˝ìı˛\…vø\≈\È˛9ˇx‘¥`ö|\Œiy˚¸\Ï⁄µk\ V6\Ô”ä\‹Xß˙ø\Ô\¬\‚≥ı\÷[ÀÆª\Ó*Û\Á\œ˜˙ˇ-Ä\0\‹\'Ä\0\·~â\0ÄÄ\Î \… é$ ¢õT@XÑèi@¿+IB\ÌU\¬,u-ò,$ìÄ\0<%Ä\0\·ib	ÄÄC IÑ#â≤\Ë&ÑE¯òÜ\0º\"Ä\0\·U:#	&jb\Í\‹\≈“∏~])\Í\‹.ˇYÄ\0íC\0\"9π&R@\0q%Ä\0\◊\ÃT¬ëDYt\¬\"|OMª6$\»\”4ñ†;f¬±Ñ\·. \0Å@ÄHpÚ	Ä@L @\ƒ$5πÅ\0Q!^GÄ`ÑM¿µø ¬éüıíK\0\"ππ\œ4ràLIq \0\ÿ&†ˇO?†∞Ωm7∞@\0	&\‡\⁄˘R3éB\·Ü#A∫\Áı\“^ß\◊JpÆ˝aFΩ$Ä\0\·eZC\r\n\"Tú,@\0Ä\0 \0xL¿µÛ•0Œ∑ \"\‹\–a$(B˜º^\Z\¬\ÎÙZ	Œµø ¨@¬®ó ºLk®A!@Ñäì\≈ \0@\0Ä\0 \0è	∏\÷\‚;åÛmà7t	ä\–=ØóFÄ:ΩVÇCÄ∞Ç£1 Ä\0É$\ƒ\‹àò\'˜ \0@ EÄLl@\0Ä@v\¬8\ﬂFÄ»éyVwáë†¨rsä\0õ!lae=W,[ΩVñ,ó^⁄∏\‚2~\Êô\0DûÅcÄ\0jMÄ!‘µF«ÉÄ\0 êPaúo#@D∏y\¬HPÑ\ÓyΩ4Ñ\◊\ÈµÑ\ÏÖ\0 µ\0±†dô‘´S [4sÄ.B\0Ä@ú	 @\ƒ9;¯@ h¡\‰Hû=ÙP˘y∑B\È2pd•ø0}º,ô\'\≈\≈\≈V#BÄ∞á\¬{_-#@¯öY\‚Ç\0r%µ\0ë´<@\0 @∞ \0@¿6\◊Œó\¬8ﬂ¶\"\¬]FÇ\"t\œ\Î• ºNØï\‡\\S®≠@¬®óh¡\‰eZC\r\n\"Tú,@\0@Äà.KC\0Ä@F 2\¬dˇ&* \Ï\Á \Ó @\ƒ=C¯∏BÄ!‘Æd ûüQ¥`≤ó[,C\0ç\0Ño%@\0\Ó@Äp$gé$ ¢õ\·c\Zä\0ÑW\Èå$ò®à©sK\„˙u•®sªH¸gQ@\0Hà\‰\‰öH!\0ƒï\0D\\3S¡/Ge\—Mã=5M&OKX5@Ä®Q\‚o@ÄH¸\0\0 \0g @8ì*Ö\0 \‡-GRã\0\·H¢,∫â\0aæß¶]˚\¬\”4ñ†;f¬±Ñ\·. \0Å\–ˇßP\ÿ>¡Ä\0lp\Ì|)å\«°ép◊Öë†\›ÛziØ\”k%8\◊˛Ç∞	£^@Ä2≠°Ö\0*NÉ\0 \0@\0Ä\0<&\‡\⁄˘R\Á\€n\Ë0°{^/ç\0\·uz≠\Á\⁄_V a\‘K^¶5‘† B\≈\…bÄ\0 \0@\0ÄÄ\«\\kÒ\∆˘6DÑ:åE\Ëû\◊K#@xù^+¡!@X¡é\—@ÄàAb\ÓD\ÃÑ{Ä\0 ê\"@&6 \0@ ;aúo#@d\«<´ª\√HPVπ9E\0Ç\Õ6à∞â≤û+ñ≠^+KñKØm\\q?ÛL\0\"\œ¿1@\0µ&¿\ÍZ£\„A@\0H(Å0Œ∑ \"\‹<a$(B˜º^\Z\¬\ÎÙZ	\¬\nvåB\0àZÄXP≤L\Í\’)êé-ö9@!\0@ \Œ \‚ú|É\0 ê¥`r$œáz®¸º[°t8≤Rè_ò>^\nñÃì\‚\‚b´!@\ÿ√è\0aèΩØñ |\Õ,qA\0πàZÄ\»\’?ûá\0 \0 \ÿÄ\0 `õÄk\ÁKaúoS\·Æ#A∫\Áı\“^ß\◊JpÆ)\‘V a\‘K¥`Ú2≠°Ö\0*NÉ\0 \0Å	 @Dó•!\0@ #a≤ˆsw \‚û!¸É\0\\!¿jW2e\œœ®Z0\Ÿ\À-ñ!\0¯F\0¬∑å \0˜ @8í3Ge\—Mã1\rxE\0¬´tFL\‘\ƒ‘πã•q˝∫R‘π]$˛≥( \0$á\0DrrM§Ä\0\‚J\0\"Æô©\‡Ñ#â≤\Ë&ÑE¯ûö¶ìßâ%¨\Z	 @‘à(Ò7 @$~\0\0ÄÄ3 úIéB\0ñ\0Ñ#©EÄp$Q\›DÄ∞\ﬂS”Æ˝\·i\Z\À\–3â\0\·X\¬pÄ@Ç	\Ëˇ\”(lü`Ñ@\0∂	∏væ∆åcÜPG∏\Î\¬HPÑ\ÓyΩ4Ñ\◊\ÈµúkAXÅÑQ/	 @xô\÷PÉBÄ\'ãA\0Ä\0 \0@\0p\Ì|)åÛmà7t	ä\–=ØóFÄ:ΩVÇs\Ì/+ê0\Í%/\”\ZjP°\‚d1@\0Ä\0 \0@¿cÆµ¯\„|\"\¬\rFÇ\"t\œ\Î• ºNØï\‡ ¨`\«h @\ƒ 	1w\"\Ê	\¬=@\0H†õÄ\0 êÅ0Œ∑ ≤cû\’\›a$(+É‹ú\"Ä\0¡fõ\0D\ÿDY\œ\ÀVØïÖ%À•Wá6Æ∏åüy&Ä\0ëg\‡òÉ\0 \0ÅZ`u≠\—Ò  \0$î@\Á\€nû0°{^/ç\0\·uz≠á\0a;F!\0D-@,(Y&ı\ÍH\«\Õ†ÅãÄ\0 gq\ŒæA\0HZ09í\ÁC=T~ﬁ≠P∫Y©\«/L/K\ÊIqq±’à \Ï\·GÄ∞\«\ﬁ7\À˙y£◊óﬂÆ5øoøE£_Öh˚≥\∆7\Ê\ƒ∏E j\¬-\Zx@\0q&Ä\0\Á\Ï\‡ \0Ådp\ÌÆaúoS\·\ﬁ#A∫\Áı\“^ß7Ø¡\È˚∏À†QU\⁄|a\⁄8)--Õ´OÉ@>	–Ç)ü¥›¥Ö\0\·f\ﬁ\ZÄ@	 @$1\Î\ƒ@ ^ ‚ïè*Ω°¬ëDYt\¬\"|\œL´\01Úı≤\Íá ÆÒ{7BÄ,\ÁÑSû\0C®\Ÿ5àZÄ†SM\‡u@\0»î\0D¶§∏Ä\0¢\"Ä\0Ÿê\◊EÄ®á\À!@xòTK!!@Xè\Ÿ\ÿ@ÄàM*b\ÎH\‘\ƒ‘πã•q˝∫R‘π]l\‡ \0∏A\0¬ç<\·% \0ü	 @8í]Ge\—Mã=3ç\0\·YB	\'kY#K\‹âK9C\0pñ\0Ñ≥©\√q@\0\ﬁ@Äp$ïé$ ¢õ\·{f\Z¬≥ÑN\÷ ≤Fñ∏ órÜ\0 \‡,=ÙP\ÿ\ﬁYˇqÄ\0\‹\'Ä\0\·H IîE7 ,\¬˜\Ã4Ñg	%ú¨	 @dç,q @$.\Â@\0Ä\0 \0‘í\0D-¡\Â˚1à|w\œÑ{9ã´\«q\Õ~\Âã\0DæHªk\¬\›\‹\·9 \0@\0Ä\0 ê_ãñÆ0;µlû_√µ¥¶\Áb•••µ|∫\Ï1]c]\'∑ÖrÚ\"Àá ≤ñ¿\€ òÙàBFÄà,\À:C\0¬ôTYs\¬\ZzC\0Ä@ñh¡î%0ná\0 \0Å\ƒ@Ä8≤\“M\¬ÙÒR∞dû[\›$a$\»j\0GÄp8y1s\"f	¡ùºX∂z≠,,Y.Ω:¥…ªm∫A\0¬ç<\·% \0à0Ñö]\0@\0»é@\Á\€T@d\«<´ª\√HPVπ9E\0Ç\Õà∞H≤ \‡+Å®à%À§^ù\Èÿ¢ôØâÄ\0ÚD\0\"O†1@\0U†ì#õÉLé$ ¢õ\·{f\Z¬≥Ñ :Å®à\–fA@\0H,àƒ¶û¿!\0ƒÜ\0C®cìä\ÍAÄp$Q\›DÄ∞\ﬂ3\”û%îp≤&@¶¨ë%\Óàƒ•úÄ!\08K\0\¬\Ÿ\‘\·8 \0o @8íJGe\—Mã=3ç\0\·YB	\'k°\Œ\ZY\‚àZÄ†S\‚∂C\0àå\0DdhYÄ\02$Ä\0ë!(€∑!@\ÿ\Œ@¸\Ì#@\ƒ?GÆxà\0\·J¶3*Qëıg›®à©sK\„˙u•®s;†	 \0X!Ä\0a;F!\0@ ç\0Ñ#\€¬ëDYt\¬\"|\œL#@xñP\¬…ö\0D\÷\»˜\0D\‚RN¿Ä\0ú%Ä\0\·l\ÍpÄÄ7 I%Ñ#â≤\Ë&ÑE¯ûôFÄ,°Ñì5à¨ë%\Óàƒ•úÄ!\08K@}∂w\÷á\0 \0˜	 @8íCGe\—Mã=3ç\0\·YB	\'kY#K\‹âK9C\0Ä\0 \0@\0µ$Ä\0QKp˘~\"\ﬂ\ƒ›≥á\0\·^\Œ\‚\Í1D\\3É_˘\"Ä\0ë/\“\Ó\⁄AÄp7wx@\0Ä\0 \0\‰ó¿¢•+å¡N-õ\Á\◊p-≠\ÈπXiii-ü.{L\◊\ÿDD\◊\…m°úº\»Úaà,Å%và&=¢ê \"À≤\Œ@Äp&U\÷EÄ∞Ü\√Ä\0 ê%Z0e	å\€!\0@ Ò é¨tº0}º,ô\'\≈\≈\≈V7I	≤\ZÄ\√\∆ N^\Ã\\GÄàYBp\'\Ôñ≠^+KñKØmÚnÉn@Äp#Ox	@\0\"°f@\0Ä\0≤#\∆˘6\Ÿ1\œ\Í\Ó0îïAnN@Ä`3ÑE\0\",í¨¯J jbA\…2©Wß@:∂h\Ê+B\‚Ç\0 \0Å<@Ä\»h\Ã@\0Ä@ïh¡\‰\»\Ê†ì#â≤\Ë&ÑE¯ûôFÄ,°ÑÑN j\"táYÄ\0K\0\"±©\'p@\0±!¿\Íÿ§¢zG IîE7 ,\¬˜\Ã4Ñg	%ú¨	–Ç)kdâ{\0\"q)\'`@\0\Œ@Äp6u8@¿é§¬ëDYt3_\ƒ ï+•ˇ˛Ú\‰ìOöh{Ù\Ë!≥fÕí¶Mõñã~›∫uÚ\‹s\œ\…Ãô3eÃò1“∂m[Û˙M7\›$/ø¸≤Lô2Eö4ibëX\ÌMkl\ÁüæLü>\›,“±cGπ\Áû{R1\÷~\Âx<â\0è<\‡Ö=°∂\«\ﬁ\ÀQ¥`re\'\‡\' \0Å¯@ÄàéÄÄ\Ô \…0Ñ#â≤\Ëfæà¢¢\"#DTu=Ù\–C2t\ËPi‹∏qπ\√yàÙò\ÁÕõ\'gûy&Ñ≈ΩèiÑM\0\"l¢˛≠µ\01u\Óbi\\øÆun\Á<\"Ç\0 \0Åº@Ä\»+nåA\0Ä@% \Ÿé$ ¢õq ÖèáÛS\ÏcåT@X|#c: bëÜX;Å\0\ÎÙ\‡ \0§@Ä`;@\0ÄÄm∂3ê°}àA%¯6;\…O∫\0Ò\’W_â˛\“\÷\\˙k’™UÚı\◊_À∑\ﬂ~k~≠Y≥&ık\Ì⁄µÚ˝˜\ﬂÀè?˛(u\Í‘ëfÕö\…^{\Ì%\'ü|≤¥o\ﬂ\ﬁN±\nÅJ @∞-j\"Ä\0Q!^á\0 \0Å∏\–CüÖ¸øv\\ÚÅÄ\0íH\0¬ë¨#@8í(ãn\"@ÿÅ\Ôª\0Ò¸\‘K\ÂÛ7^ñˇ≠[+ˇ[˜Ω˘˝õ/K\ ¡\ﬁt\”ME©®†ø\Í÷≠+ı\Í’ì˙ı\ÎKÉ\r§a√Ü\ÊW£FçdÛ\Õ77ø~¯\·˘Ú\À/\ÂìO>ë\ÂÀó\À;\Ï \„«èm\Ì\≈\€ lg ˛ˆ ‚ü£π3\0\0 \0IDAT#<Ñ\0 \0@\0Ä\0\‚A\0\"y®\—à\Z%˛Ü8˙\Ì˜…ì\'À¥i\”\‰∞\√ì>}˙»∏q\„RÛÙÚs\ÊÃëííπÙ\“KÕ°¥~+~“§IrÛ\Õ7\Ày\Áù\'{ÔΩ∑l∂\ŸfRXX(?˝Ùì\‹ˇ˝r\Ìµ\◊\ +Øº\"ù;wñ#F\»\—G-\⁄&HØ•Kó\ eó]&<Ä\Ï±\«2a\¬Q˙˙/ø¸bûSN;\Ì4y\Áùw\‰∫ÎÆì[oΩ’¨ü˛¨Œ™\–¡\“gúqÜÒ´\‚⁄ïΩÆ˜¯.@|8˜üRØa#©\€p3©€†\Ï˜©Ωˆ0¢AÛ\Ê\ÕCyﬂ©—Ø_?—π!˛Ûü\Õ~·ÇÄM6\Èªa¬ç<\·% \0@\0Ä\0 `ü¿¢•+åùZÜséuDz¶XZZöì]CO.Ks](\'/≤|\"K`	º›∂\0°mw,øˇ˝\Ô\Â\ƒO4≠x&Nú(\≈\≈\≈\Ê@πu\Î\÷Ft\–!\‘*L\\s\Õ5\Ê†ˇ¡4ﬂÑ4hê˘˝úsŒëa√ÜÅ\‡±\«ì´Æ∫Jnø˝v\Ÿv\€m\ÂÍ´ØñG}Tfœû-;Ó∏£i˝3p\‡@9Í®£å\Õ%Kñ»Ä âó\\râºı\÷[2c\∆9¸\√\Õzzp§bÖ\⁄\÷˚U\\¯Ù\”O\Â\Ï≥œñÆ]ª\ \\`ƒâ\Í^/((0ª\Ãw¢≤∑\“¯Ω\Â¸A\\Ÿ∫è<Úàw\‹qr\ )ßAä∂ @\ÿ\"\Ôé]wrÖßÄ\0íNÄLI\ﬂ\ƒ@\0\Ÿ@Ä8≤Rf/L/K\Êô\√^õW	≤\ÈøÀ∂m≥fÕíßü~Zn∏\·\”jGØ˝\Î_FLP¢m€∂\ÊgZ≠\≈_§à+Æ∏Bæ˚\Ó;9r§yNü	* TÄP\‡˙\ÎØ7ØU<\ÏØ\Ï_Ö\r]_+/¥\–˚\Ôø/\«º®q\Ï±«¶R¨˜©\–PÒ\ÍŸ≥ß\‹y\ÁùFÙ®\Óı≠∂\⁄\ <ä\0\ÓªF´UÜ\"¸±≠íz\Èú˝<◊ä!}o\Ôüx¨_ø^∆ékB\Z=z¥i\€\\\Î÷≠3\"îæOı™Xù5áe´\◊\ ¬í\Â“´Cõ®M±æ£ MnC\0H ÜP\'0\ÈÑ@\09\„|õ\nàúRP˝\√a$(B˜º^⁄¶\0°-t.ºBS•pÒ\≈ß8Wv8_QÄ\–{˙˜\Ôofh\√I\'ù$≠ZµJ≠°ïJ⁄≤\È\ﬁ{Ôïª\Ó∫\À\Ã\Zç\◊^{Õ¥Vö9s¶\Ïπ\Áû\ÊBT@\–ﬂõ6mö nºÒFSU°W\‡\ÔÅhlWºjz=˝~à\ﬂVªÔæª¥l\ŸRûz\Í©O[Q[|i;.¡Ù˙\À_˛\"CáM	h¡≠oºÒÜ©\ﬁy˛˘\ÁM•é\Óı≠∑\ﬁ:Rﬂûy\Ê\„è\⁄I\"5ö\Á≈´ 4/Z\Ì‘°C\ÈﬁΩªi\Õ5u\ÍTÛk∑\›vÀ≥óòÉ@\Â¢ î,ìzu\n§cãf§\0Ä\0 êàúÒ0 \0Ñ@ÄL!@\Ã\«¥`\ e∑m\ÿ Ù\€\ ˙\r\Â-Zd-@(um§sT8\–vHw\‹qáiÖ¥q“ämµÙøˇ˝\œ\ÿ	d’Æ~;\\+&Ù˜\Ôøˇ^ÜnÑáä\ÈD\‡\Ô[la\Ó\”¡\…\ÈWMØßﬂã\0˛˚FöµrF\ÁÉDyiÖçä]⁄éK\≈,m¡u˙\ÈßQ+∏\ﬁ{\Ô=˘\Î_ˇ*£FçíNù:ôäÑó_~YÆºÚ\ _	a˚\Í\€\ﬁzÚ\…\'eßùv™±öC´ñ¥õV>˘X˘ˆ>a=;¢ \ÏDÖU@\0ë\0ÑèY%&@\0n`µ#˘BÄp$Q›¥)@¸¸Û\œFx\–˙çÚÙˆD:B´Ço.W¨Ä¯øˇ˚?iﬂæΩi∑£3∆è/*\0\ËØ˛∑^ÅHPŸÅ¨\Î\‡\Î_|\—T6hÖ∂N\næ°¥`J tMm\Ì¢m_¥5ìûn“§âz≠≠ótF\≈m∑\›V\Ì\Î*^\Ë\Â\€!±∆§ïL#_Ø˙?™\Èoı\·\√?îùw\ﬁ9íwï\—˛¸Û\œeü}ˆI≠Ø{Sgô\Ë sm§˚Z[mπ\ÂñF¯RüT\—\√qù;¢\√–£º|\⁄[˙û\÷˜õä;5â\nqàõLQ\Ól?\÷FÄ#èD@ 	 íêebÑ\0 oÒ\ŒO\ ;Ge\—MõÑÜΩp\·\¬\‘\0a\0Ù∞VáP_~˘\Â¢-uÙ@\ﬂ}˜5\ﬂ$◊É\Â@®\–VI\⁄\⁄Fzõ5k&:`≈är\—Eôjm”¢\ÌX¥ìíû>}∫	T\0\ÿ~˚\Ìe“§I¶mNU-q\ﬁ~˚m\È◊ØüôMq¡ß2§>ôÅ\’\ÈóVb\ËÛG}T\Ì\Î\ZDt^g~Lô2EN=ı\‘Hå\Ë~\“_\⁄\“K/ùπ0b\ƒ9\‰êCR¬Ç∂˛“Ω£˚8hﬂ•˜™x•C\ °\"=∑î≥Vé\Ë˚X\ﬂ\Ô5	:å\\ÖAõ≠ßB’Æˆg›®Z0˘≥WàÄÄm∂3Ä}@\0@Äpd @8í(ãn\⁄ Ùêq˛¸˘\Ê\‡\’W_5≠l¥ª\n˙\ÌÒΩˆ\⁄À¥\’\—?\Î’£Gs©≠o¥eíV(<Ò\ƒ¶\Ô}\–c_[›®›∫u3≠ò∫t\Èbã\ﬂz\Î-ccÕö5\Â\»k\Ôx≠ä\–\÷LtêyMEı\ÌÑNH›´\"Ñ\n$\⁄c^\≈~¨~7l\ÿ\–\‹S\”\Î\—mx£\Œ<ÛL3fLtFDå°B\√M7\›d™tTî\nZr\È˛;Î¨≥~uh^q\ŒHEWØ^mû\”9á+ßﬂ´U\⁄nL[Ni2›õZ\Ì£±Wµ∑T(\—¡\Ï\◊]wù\œ;\Ï0\”~Lˇéf¸\„ˇ0{]\„\—\◊Ù>}\ﬂ\Ë•6U\»Sõ_~˘•\rU¸S_+^ÈÉ∞U\‘˜[Pï§\ÔW}ó˙ØØ=¿¶çZz%í∆®¢§∂T”´c«éF\\\–˜ôæ¶\’&*8Æ\\π\“\Ãd\—VM¡•˜j;6m«î˛¨äöµ£óV@•ãDπn\Zà\\	˙ˇ|\‘\ƒ‘πã•q˝∫R‘πùˇ0âÄ\0\"%Ä\0)^á\0 \0Å @d\0)∑ @\ƒ!Òˆ¡∂\0aÉ\Œ7\ﬂ|cÑà@\‘H˜°gœûf¶D\–**ˇ\‚\–.&\Ï\ÿ\‚–Ç©~˝˙fÊÇäZQ^\Èá\ÿ:\0]©\‡0æ™‹Ü!@\Ë·æä+Õõ77É≠ı]W\— ò_R—æ∂SaM=∞Ø[∑Æ\Ã˛∑ø˝Mnæ˘fSπÒ\Ôˇ\€‹£kkâVk-\“‘¶V˝Òèî]v\Ÿ\≈\ÃL\—{u»∂æá\·#\‡˝¯\„è!•††¿¯÷∑o_Si§ÇÖäs∑\‹rã©D\“6h*.ju\”˛˚\Ô/ü|ÚâU\0\‘uı=X1ñoø˝÷à˜\›wüy6}xΩÚ\’ ¶†B˝\÷8µ-õVRm≥Ç∂N*\Z©\Ë\ÊÖ\0&M?\◊BÄ3ØD@¿G>fïò \0∏E\0¬ë|!@8í(ãn&QÄ¯\‡É\ÃA\ËëGiæ˝\\z0˘\√õ>˝z\ÂÖ\0\r\›\Ì∂\€Œ¥_\“\√¯®/\›/O?˝¥9\ﬂu\◊]´<4¸®IÄ\»\ƒ_≠“ä=\ƒ\ﬂfõmL%\∆˝˜\ﬂ/\œ=˜úi˘§˚∂\‚\ﬁz\ÁùwÃº≠\÷\ÿs\œ=çô``∫V	i[3ùy¢Å∂Ø\“˘Z\Â†:ãE´çT|¯\œ˛S\ŒE≠XxÍ©ß\‰Ä¯ï\Îï\Ìoç_€†Õû=;%H®8¢34T¨\–k\Ó‹π¶¢Cècè=∂\“Y)U\rØØ(@\Ëz:{#Ω™D\Ì(C≠ñ\–*è¿n&\Ï3π\"J…æ\"\Ÿ˘\'z@\0.\–CüÖ\Ì]r_!\0@¿3é$¬ëDYt3iÑ~\\øï≠mWÙ†Søô≠\"ÑŒåXºx±¨\ﬂÚé˙BÄàÜp>à mm§5*\Ëu˙M¸\\*lÙê]œµïë\n\0ï]\ÌWv0Ø\œÕú9\”\ÃW–ä}hª%ù´¢\⁄R¨s\Á\Œf÷Öæ^\\\\l™\"Ç6c5eØ*\"®PPÒD\€&\È˚0ΩäA\ \Î¸ùª¢?ØlùlıSEù˜¢\ÏµRDm\Â¶Ua_aıo=ˇrJDÄ\0 \0@\0Ä@4 ¢\·\Z˙™°#ın¡|Aüˆ`ñÉ\Œq\»\Á•\ﬂÛ\Õ7\Õ7Ωı\€\Î\⁄\«_˚\¬˜\Ó\›\€¿∂j\’*2wÇÉ”†ıS\–”æ¶·∫ë9Ú\¬qh¡dCÄ\–\Í\›;:o@\›Sz∏~\’UWï´∏\‚ä+D\ÿsB]ïòêû\ \ mCt\ÔΩ˜ö¯\‡“µTT∏˚\ÓªM’ÉV®(°ï:∑A˝‘π**@\Ëû\’ Öv\ÿ!£]ì©\0°\’:\Ô\"®D\n\Ê9\Ë¸Üø˛ıØ°*:û}ˆŸ≤\„é;\Za%rØm†¬æ \¬&\Í\ﬂz˛Âîà \0@\0Ä\0 \0Åh,Z∫\¬,‹©eÛhÑºj0c3óeu\r\Ì\’R™òÆ\\Æd ûü˘ \ÏEà\Â|\»UÄ¯\Âó_\Ã7\Ósπl*h\È7˚UÄ–π:{@\Á\Z\ËÄrùi†\\t‡π∂“∂BZaP\€Kˆı\0S´w¥eí∆´ó∂KRqA≈¨äáˇA%mut\⁄iß•L´®†≥µ\›\—\ÁünZ´0®˛´\Ë†BÑ∂L˙\Óª\ÔL¶C9\ƒÃ∫h›∫µâ\Èôgû1Ò\ÍÃçäWMÑÆÑW\—#àC[?\ÈÄhÂßÉ≤√®ÄPﬂÇ*à^Ωz\…o˚\€rjõã ûCÄì¶ük!@¯ôW¢Ç\0 \‡#Z0˘òUbÇ\0 \0Å(	 @Y)\ﬂ¶èóÇ%ÛL{\rõW	≤\ÈøÀ∂ \\\Œ^º|Ø≠\01|¯p\”\nH\≈]|úÀ•≠{∫t\È\Ÿù†¢ÇkVÅW+\Z¥•\œq\«\'˙≠˝\‡\“\À˙\r~=∞◊ñ^:˘ı\◊_7ë´ö/¢∫∂u÷™Äzı\Í˝\nÖﬁ£º¶Nùözm˜\›w7æh≈Ö∂H\“!\–\Áû{Æ©X\ÿw\ﬂ}%ò≥†\’G\◊^{mj‡≥∂%R{\Í∑VqhµÉ¶\ﬁoø˝\Ã\‹≠\ÿP;⁄ñLm™Pë~ı\È\”\'5˜¢¢£Å*d\ÏΩ˜\ﬁ&∑w\‹qá…≥˙’æ}{Sâ§ºè9\Ê3XZà\Î=\⁄\n-òg°~h5\…m∑\›fLh\≈‘∂\€n+gûy¶˘oΩOüSÒ\Í\Ôˇª\\w\›u©ı\”}˙˙\ÎØMï\ gü}fZ1©\0≈µlıZYX≤\\zuh\≈Ú¨\ÈíHÄ\0BÄ!\‘	I4aB\0Ä@h\¬8ﬂ¶\"¥t¸z°0°{^/ç\0\·uzÛ\Z\\∂Ñ~ÿ∞a\Êˆz@≠\œ\ÎAr.\◊\Êõon•áí\À2U>˚\…\'üòy=Ùêi\È£zx^Y-≠.–É{≠sGÙÄ_g-Tui´†ÙÅ…ï	˙\Ï™U´dÚ\‰\…2m\⁄43B´*THhŸ≤•h[%≠ Æ_|\—\ÃY\–ˆ_3f\Ã0ÇÇV¸\·0*(w t ı¢EãL[&≠j∏\‰íKdØΩˆ2KiáVD\ËÛ˙\ﬂ⁄≤Lg4®ÕäWe><˚\Ï≥fΩä~ΩÒ\∆F¿y\‚â\'L≈àΩ0`@J§Q¡E´!ÙuDT\\\“¯ÇVn**®Z\Ÿ¸LmT\÷\‚M[PΩ˝ˆ\€F\‹	{¯t$õçEΩ$µ\0±†dô‘´S [4ÛíAA\0Ä@˛ @\‰è5ñ \0@†r¥`rdg–Ç…ëDYt\¬\"|\œLg*@\Ë†„¢¢\"Y∫t\ÈØ\‰\“\‚N\ÿı\0[øÒ\œÅtZY\ÂihC SQô˙¡}Ä\0 \0Åö @\‘Dà\◊!\0@ j°éöpH\Î#@Ñ\“\„e <NnûC\ÀDÄ\Ë‹π≥ºÚ\ +UzV[B)ü|Ú\…“Ø_?”äá\È¥≤C\€8U\◊+b¥`\nÉ¢\ﬂk @¯ù_¢É\0 \‡ü≤I,Ä\0\‹$Ä\0\·H\ﬁ IîE7 ,\¬˜\Ãtu\ƒ\¬97\…Sá\÷±ˆ\Í◊ôô^S¶L1≠àt\ÊBﬂæ}M\".(ù˜†3&¥\‚F\€e\È|âÙ9QPbuT˝Z3jÇL~\Ì¢Å\0 `ì\0ÑM˙ÿÜ\0 \0%Ä\0\·\»>@Äp$Q\›DÄ∞\ﬂ3”ï	\Ô˝\ÎAyˆ\⁄QÚ\√\Ío\Â\«Ôæ≠1b.¨˝˘uÇ\Œ\Z\–˘:\‡˚\Ôø7sVÆ\\i\ÊE\Ëk?¸ÉôÅp¿»Ñ	\Ã\‹.t@¯\Ÿgü-\Ôæ˚ÆLö4I∫w\Ôn\Ê]Dy!@DI◊èµ£ ¶\Œ],ç\Î◊ï¢\Œ\Ì¸\0FÄ\0 `ç\0Ñ5ÙÜ\0 \0Å\r \Ÿ\né$ ¢õ\·{f∫¢\01gP/Y∫¯e˘\ÈáuG™CöuêtÉ\r§a√Ü\ÊW£Fç\Ã\œTl¯¯\„èÕ∑\ÿu\Ë≥˛ﬁ∫u\Îå\◊\ÊFDM\0\"j\¬ÓØè\0\·~â\0Ä@R @$%\”\ƒ	@ æ ‚õõrû!@8í(ãn\"@XÑ\Ôô\Èä\ƒ\«ÛûîW\Ô∫Añæ˛í¸¥˛Gë\“\“j#\÷\Á}ÙQ9Ú\»#=#C8I!Ä\0ëîL\◊>Nà⁄≥\„I@\0\»/=ÙP\ÿ>øF±@\0H#Ä\0\·\»v@Äp$Q\›DÄ∞\ﬂ3\”UÕÄ¯\Í\„wç±¯\·;j fŒú)\'ûx¢gd\') íí\È\⁄«â\0Q{v<	@\0Ä\0 \0$ã\0Ñ#˘FÄp$Q\›DÄ∞\ﬂ3\”\’\r°\÷P\«\Ô\›H?¸py\ÊôgL\‰:\À!˝\“ÁØª\Ó:”∑ü.@Äp1k˘ı\"øº±@\0Ä\0 \0∏K`\—\“\∆˘N-õ;ÑûkU<\Î\ \÷q]CßWñ\Ê∫P∂Üsπ\"z\…x\"y\ŒGîô¡\Á\Á)ßú\"≥gœñü~˙)ı\·¨œè;V.æ¯\‚|∏ã\rÑN\0\"t§\ﬁ-à\0\·]J	ÄÄ∑h¡\‰mj	Ä\0\"\"Ä\01pd•h_ò>^\nñÃì\‚\‚\‚à\–g∂l	\ \ÃwU$Ä\0¡ûã@6D`sÃò1r\Õ5\◊\»\Í’´ÕèN;\Ì4π\Âñ[\¬râu êW\ÀVØïÖ%À•Wá6yµã1w @∏ì+<Ö\0 êt°N˙ ~@\0»ñ@\Á\€T@dK=ã˚\√HP\Ê∏5ç\0\€!,µ \€w\›uóú{\Óπr\Ìµ\◊JQQQX.± \0ÅXàZÄXP≤L\Í\’)êé-ö\≈*núÅ\0 \0˜ @∏ó3<Ü\0 \‡Z09íQZ09í(ãn\"@XÑ\Ôô\È\\\œP \0ÅJ	D-@ÄÄ\0 à∞H≤ \0‘ñ\0C®kK.\œ\œ!@\‰∏É\Ê LZL]FÄàibp+oh¡î7\‘\Œ\ZBÄp6u8@ q órÜ\0 ;±KI\Â!@8í(ãn\"@XÑ\Ôôi\œJ8Y`u\÷\»˜@\‘-ò∑•Ä@d \"C\À\¬Ä\0 ê!àAŸæ\r\¬v\‚o\"˛9r\≈CW2ÖüQ@Äàä¨?\ÎF-@LùªX\Z◊Ø+Eù\€˘çH \0@¿\n+\ÿ1\n@\0i \Ÿé$ ¢õ\·{f\Z¬≥ÑN\÷ ≤Fñ∏ órÜ\0 \‡,gSá\„Ä\0º!Ä\0\·H* IîE7 ,\¬˜\Ã4Ñg	%ú¨	 @dç,q @$.\Â@¿Yz\Ë3†∞Ω≥˛\„8 \0∏O\0¬ë\"@8í(ãn\"@XÑ\Ôôi\œJ8Y@Ä\»\ZY\‚@ÄH\\\ 	Ä\0 \0@\0®%àZÇ\À˜c˘&\Óû=˜rWè \‚ö¸\ à|ëv\◊Ñªπ\√s@\0Ä\0 \0@ ø-]avj\Ÿ<øÜkiM\œ\≈JKKk˘t\Ÿc∫\∆&\"∫Nn\Â\‰Eñ#@d	,Å∑#@$0\ÈÖå\0XñuÜ\0Ñ3©≤\Ê(Ñ5ÙÜ\0 \0Å,	–Ç)K`\‹@\0â\'Ä\01pd•õ\‡Ö\È\„•`\…<)..∂∫I\¬Hê\’\06é\0\·pÚb\Ê:D\ÃÇ;y\'∞lıZYX≤\\zuhìw\€tÉ\0Ñy\¬K@\0a5ª\0Ä\0 êÅ0Œ∑©Ä»éyVwáë†¨rsä\0õ!,aëd@¿WQJñIΩ:“±E3_ \0\‰â\0Dû@cÄ\0™$@&G6-òIîE7 ,\¬˜\Ã4Ñg	%@ tQ°;ÃÇÄ\0 êXâM=ÅC\0à\rÜP\«&\’;Ç\0\·H¢,∫â\0aæg¶ <K(\·dMÄLY#K\‹âK9C\0pñ\0Ñ≥©\√q@\0\ﬁ@Äp$ïé$ ¢õ\·{f\Z¬≥ÑN\÷Bù5≤\ƒ=µ\0A¶\ƒm)Ü\0 à\»–≤0 \0dH\0\"CP∂oCÄ∞ùÅ¯\€GÄàé\\Ò¬ïL\·gT ¢\"\Îœ∫QS\Á.ñ\∆ı\ÎJQ\Áv˛@#@\0∞B\0\¬\nvåB\0Ä@\ZG∂Ñ#â≤\Ë&ÑE¯ûôFÄ,°Ñì5à¨ë%\Óàƒ•úÄ!\08K\0\¬\Ÿ\‘\·8 \0o @8íJGe\—Mã=3ç\0\·YB	\'kY#K\‹âK9C\0pñÄ˙(l\Ô¨ˇ8@\0\Ó@Äp$áé$ ¢õ\·{f\Z¬≥ÑN\÷ ≤Fñ∏ órÜ\0 \0@\0Ä\0jI\0¢ñ\‡Ú˝Dæâªg¬Ωú\≈\’c rqï\ÓÕùzôîññ\∆\’}¸Ç@\Œ rF\Ë˝ﬁßò\0!\0@\0Ä\0 \0Åê,Z∫¬¨‘©eÛêVåv=\Àı\‹K\◊\ÿDD\◊q\Á\0\r\"⁄ç\Â\√\Í>d11|pW\„\»Ú\’k\Õ\Ôøi\“\ËWéÕù˚|<ú\≈D@\0\"®û-â\0\·YB	ÄÄ\«h¡\‰qr	\rÄ\0\"!Ä\01pd•`_ò>^\nñÃì\‚\‚\‚H¿g∫h	\ \‘˜ï\'Ä\0¡éõÄk%ra\«\œz\…%∞lıZYX≤\\zuhì\\D^-6 \0∏BÄ!‘Æd\n?!\0@ .\¬8ﬂ¶\"\¬lÜë†\›ÛziØ\”k%8+\ÿ1\n8@ jbA\…2©Wß@:∂h\Ê\0\r\\Ñ\0 \0Å8@Äàsv\rÄ@2–Ç…ë<”Ç…ëDYt\¬\"|OM#@xöX¬Ç\0r&µ\0ë≥É,\0@\0\ÿ@\0Ç≠\0@\0∂	∏væ\∆Ï©Äàp◊Öë†\›ÛziØ\”k%8\◊j+ê0\Í%Z0yô\÷PÉBÄ\'ãA\0Ä@Ñ \"Ñ\À\“Ä\0 êàå0Ÿøâ\n˚9àªq\œ˛A\0Æ`µ+ô≤\Ág\‘-ò\Ï\Â\ÀÄ\0|#Ä\0\·[FâÄÄ{ \…Ñ#â≤\Ë&ÑE¯òÜ\0º\"Ä\0\·U:#	&jb\Í\‹\≈“∏~])\Í\‹.ˇYÄ\0íC\0\‚ˇ€ªc;í:\‡-ç\œKrâ!∞vë,Å¨ìç£’ÅKå [G±\Ëê%ã¡\—F˛9Åà%b#6\€’†ÛZã4Nnó¿Çh Å%KK`q™9ı®\›;\ÔM˜L\’{ı\Î˙8oø\Í_}~m?´æ\”U\ÌÙ\⁄L	 P´Ä\0¢\÷Œå\Í@i\‘\À@l°∑∂\”BkZg\n \Œ$j˛DÛè\0\0Ñ@ÑiïB	 ∞XDê\÷\n Ç4jãe\n ∂àø\–[G˚ÇXhLkà-†ª•\0\"X√îKÄ\0ÅÜ“ø\È\Ô\Ó\ﬁhX¿\‘	 @`\€\—÷órúq\Ï\ÍÇO]é,o\—Cß\0\‚¯√¢\Áhr @†Åo˚\€\›\'ü|R§[0a5( @Ä\0[@l˝<∑Ù\ƒy\‘|Ü\0ÅãD˚Ç∏\»\\}ñ¿P¿ûám ∂\›˜\'@Ä\0 @ ó@¥-æs¸ÄΩ7 r==ßåì£A\À3433∞\\∫(ƒ¢\⁄r2àêmS4™∞SïmQT,êc}[\0Q∞¡9\ZT∞<C 0C@\01À•ã8z˛¢{r¯¨ªsÛ⁄¢\Êe2qqz•R\‘.\‡\Í\⁄;§>®M \«˙∂\0¢`Ws4®`yÜ&@`ÜÄ\0bñK	 êQ\‡\‡®ª|ißªuıJ\∆Q\rEÄ\0-\n Z\Ï∫9 @†.[0\’’èï\’8\"H£îI`Aà5\”T @Ä\0ö@4\Ÿvì&@Ä@U\—÷ór¸ÄΩ7 \n>Ç9\ZT∞<C 0C ZB=cj.%∞V¿L @`)à•t\“< W@\0§wﬁÄ\“(e @Ä@xáPáoa¯	ÿÇ)|MÄ\0\’ ™iÖB –¨Ä\0\"H\ÎA\Z•L/ Ä\ﬂ\¬pu¯ö\0™@T\”\nÖ @†YDê\÷ Ç4Jô$`¶5\”Tf	 fqπ∏ÄÄ\0¢\0™!	 –®Ä\0¢\—∆õ6*@T‘åu• Ç4Jô$\ÌbAÙ¶≤eƒñ\‡ˆù\0\¬C@Ä\0π“ø\È\Ô\Ó\ﬁ\»5úq @Ä¿lÅh\ÎK9\Œ8vı\Ï\«d˙r4h˙\›\\IÄ@IÅh_%-å›ñÄ\0¢≠~\◊8[Dç]Q @Ä\0\Áà∂æîc}[\0qû\'e\‚gr4h\‚≠\\FÄ@aÅh_Ö9ﬂêÄ\0¢°*ª\·\0\0\ZÚIDATfW:UD•çQ @Ä\0≥¢mÒùc}[\01˚1ô˛Å\rö~7W PR@\0QR\◊\ÿ5 j\ÓNµ	 \⁄\Ë≥Y @`∂`⁄Ñ≤{ @Ä¿ír¨o \n>9\ZT∞<C 0C@\01À•ã8z˛¢{r¯¨ªsÛ⁄¢\Êe2qqz•R\‘.\‡\Í\⁄;§>®M \«˙∂\0¢`Ws4®`yÜ&@`ÜÄ\0bñK	 êQ\‡\‡®ª|ißªuıJ\∆Q\rEÄ\0-\n Z\Ï∫9 @†.[0\’’èï\’\Ï\Ì\Ìu/Ø\Ôv∑\Ô\›?ıöGt;Ow˚˚˚[ùë\0b´¸nN ´Ä\0\"+ß¡ @Ä\0l\\@\0±qr7$@Ä\0Åë@¥ı•\Î\€ﬁÄ(¯\« GÉ\nñghfDK®gLÕ•\÷\nÿÇ\…BÄ\0,E@\0±îNö\‚\n ÇÙ\ŒA\Z•L/\‡\Í-?[0Öo°	 @†\ZD5≠Pö@iΩ\0\"H£îIÄ\0\·\·[~°\ﬂB @Ä@5àjZ°4+ Ä\“zDêF)ì¿Çl¡¥†fö\ ,\ƒ,.@@5$\Z@4\⁄x\”&@Ä@Eàäö±ÆDêF)ì¿Ç¢}A,à\ﬁT∂, Ä\ÿr‹æ@x @ ó@˙7˝\›\›πÜ3ò-m})\«\«°û˝òLˇ@éMøõ+	()\Ì¢§Ö±\€@¥\’\Ô\Zg+Ä®±+j\"@Ä\0 @\‡<\—÷ór¨o \ŒÛ§L¸LéMºï\À(,\Ì¢0á\·@4\‘\ÏJß*Ä®¥1\ \"@Ä\0 @`∂@¥-æs¨o f?&\”?ê£A\”\Ô\ÊJJ\n J\Í\ZªfD\Õ\›i£6D}6KlB¿LõPvXí@éımD¡\'\"GÉ\nñghf f`πtQG\œ_tOüuwn^[‘ºL&éÄ\0\"NØTJÄ\0Å\⁄B]{á\‘GÄ\0µ	\‰X\ﬂ@\Ïjé,\œ\–\Ã@\Ã¿r)2\nuó/\Ìt∑Æ^\…8™° @†EDã]7g\‘%`¶∫˙±≤öΩΩΩ\Ó\Âı\›\ÓˆΩ˚ß^Û\Ë\·Én\Á\È\„n´3@lï\ﬂ\Õ	d@d\Â4 @Ä\0Åç 6N\ÓÜ 0à∂æîc}\€ˇ\‰hP¡ÚMÄ¿Åh	ıå©πî¿Z[0y@ @Ä\0Å• ñ\“IÛ @Ä@\\Dê\ﬁy\"H£îIÄ\0\·BæÖ\·\'`¶-4T# Ä®¶\n!@Ä@≥à ≠@iî2	 @ ºÄ\0\"|\√O¿!\‘\·[h®F@\0QM+BÄ\0ÅfAZ/Ä\“(eXêÄ-ò\‘LSô% Äò\≈\Â\‚à®Ü$@Ä@£àFo\⁄®H@\0QQ3÷ï\"Ä\“(eXê@¥/à—õ ñ[nÄ\€w\‰Hˇ¶øª{#\◊p\∆!@Ä\0≥¢≠/\Â8\„\ÿ!‘≥ì\È\»—†\Èws%%¢}Aî¥0v[à∂˙]\„l5vEM @Ä\0úG \⁄˙Réım\ƒyûîâü\…—†â∑rÖ¢}A\Ê0|CàÜö]\ÈTï6FY @Ä\0\Ãà∂\≈wéım\ƒ\Ï\«d˙r4h˙\›\\IÄ@IDI]c\◊, Ä®π;m\‘&Äh£\œfIÄ\0ÅMÿÇi\ \ÓAÄ\0K»±æ-Ä(¯D\‰hP¡ÚMÄ¿\ƒ,ó.J\‡\Ë˘ã\Ó\…\·≥\Ó\Œ\Õkãöó\…\ƒ@\ƒ\ÈïJ	 PªÄC®k\Ôê˙ @†6Å\Î\€àÇ]\Õ—†Ç\Âö\0ÅàX.%@Ä@FÅÉ√£\ÓÚ•ù\Ó\÷\’+G5¥( Äh±\Î\ÊLÄ\0Å∫l¡TW?VV≥∑∑◊Ωºæ\€›æwˇ\‘k=|\–\Ì<}\‹\Ì\Ô\ÔouFà≠Úª9Å¨à¨ú#@Ä\0 ∞q\ƒ\∆\…›ê\0F\—÷ór¨o{¢\‡É\r*Xû°	ò!-°û15óX+`& ∞\ƒR:ià+ Ä\“;o@iî2	 @ ºÄC®√∑0¸l¡æÖ&@Ä\0Åj’¥B!hV@\0§ıà çR&Ñ@Ñoa¯	8Ñ:|MÄ\0\’ ™iÖB –¨Ä\0\"H\ÎA\Z•L∞”Çöi*≥≥∏\\\\@@\0Q\0’êhT@\0\—h\„Mõ\0	 *j∆∫RA\Z•Làˆ± zSŸ≤Ä\0b\À\rp˚N\0\·! @Ä\0Å\\\È\ﬂÙwwo\‰\Z\Œ8 @`∂@¥ı•g;Ñzˆc2˝9\Z4˝nÆ$@†§@¥/àí\∆nK@\0\—Vøkú≠\0¢∆Æ®â\0 @Ä\0ÅÛD[_ ±æ-Ä8œì2Ò39\Z4ÒV.#@†∞@¥/à\¬ÜoH@\0\—P≥+ù™\0¢\“\∆(ã\0 @Ä\0Å\Ÿ—∂¯Œ±æ-Äò˝òLˇ@éMøõ+	() Ä(©k\Ïö5wßç\⁄mÙ\Ÿ,	 ∞	[0mB\Ÿ= @`I9÷∑üà\r*Xû°	ò! ÄòÅ\Â\“E	=\—=9|\÷›πymQÛ2ô8à8ΩR)jpu\ÌR\‘&êc}[\0Q∞´9\ZT∞<C 0C@\01À•\»(ppx\‘]æ¥\”›∫z%„®Ü\"@Ä\0Å-v›ú	 PóÄ-ò\Í\Í\«\ jˆˆˆ∫ó\◊wª\€˜\ÓüzÕ£á∫ùßèª˝˝˝≠\ŒH\0±U~7\'êU@\0ëï\”` @Ä\06. Ä\ÿ8π @Ä¿H \⁄˙Réımo@¸cê£A\À343¢%\‘3¶\ÊRkl¡\‰!@Ä\0ñ\" ÄXJ\'ÕÉ\0qAz\Á\rà çR&Ñpu¯ÜüÄ-ò¬∑\– PçÄ\0¢öV(Ñ\0\Õ\n Ç¥^\0§Q\ $@Ä\0Åà-?áPáo°	 @†\ZD5≠Pö@iΩ\0\"H£îI`A∂`ZP3MeñÄ\0bóã \n†\Zí\0ç\n \Zmºi @†\"DE\ÕXWä\0\"H£îI`A—æ Do*[@lπn\ﬂ	 < êK ˝õ˛\Ó\Óç\\\√á\0\Ãà∂æî\„åcáP\œ~L¶ GÉ¶\ﬂÕïîàˆQ\“\¬\ÿm	 \⁄\Íwç≥@\‘\ÿ5 @Ä\0 pÅh\ÎK9÷∑\ÁyR&~&GÉ&\ﬁ\ eàˆQò\√\r	 \Zjv•S@T\⁄e @Ä\0 0[ \⁄\ﬂ9÷∑≥ì\È\»—†\Èws%%%uç]≥Ä\0¢\Ê\Ó¥Qõ\0¢ç>õ%6!`¶M(ª,I \«˙∂\0¢\‡ë£A\À3433∞\\∫(Å£\Á/∫\'áœ∫;7Ø-j^&G@\0ßW*%@Ä@\Ì°ÆΩC\Í#@Ä\0Å\⁄r¨o \nv5GÉ\nñghf f`πî\0è∫Àóv∫[WØd\’P –¢Ä\0¢≈Æõ3\Í∞S]˝XY\Õ\ﬁ\ﬁ^˜Ú˙nw˚\ﬁ˝SØyÙA∑ÛÙq∑øøø\’	 ∂\ \Ô\Ê≤\n ≤r\Zå\0 @Ä¿\∆\'wC	D[_ ±æ\Ì\ràÇr4®`yÜ&@`Ü@¥Ñz\∆\‘\\J`≠Ä-ò<  @Ä¿RK\È§y @ ÆÄ\0\"H\Ôº§Q\ $@Ä\0Å°\ﬂ\¬∞S¯ö\0™@T\”\nÖ @†YDê\÷ Ç4Jô ^@\0æÖ\·\'\‡\Í-4T# Ä®¶\n!@Ä@≥à ≠@iî2	,H¿Lj¶©\Ã@\Ã\‚rqDTC @†QD£ç7mT$ Ä®®\ÎJ@iî2	,H \⁄ƒÇ\ËMe\Àà-7¿\Ì;ÑáÄ\0r	§\”\ﬂ›Ωëk8\„ @Ä\0Å\Ÿ\—÷órúq\Ï\ÍŸè\…Ù\‰h\–Ùªπí\0Åí—æ JZª-D[˝Æq∂à\Zª¢& @Ä\0\Œ#m})\«˙∂\0\‚<O\ \ƒ\œ\‰h\–\ƒ[πå\0Å\¬—æ \nsæ!DCÕÆt™àJ£, @Ä\0fD\€\‚;\«˙∂\0bˆc2˝9\Z4˝nÆ$@†§Ä\0¢§Æ±k@\‘‹ù6j@¥\—g≥$@Ä¿&l¡¥	e˜ @Ä\0Å%	\‰X\ﬂ@|\"r4®`yÜ&@`ÜÄ\0bñK%pÙ¸E˜\‰Yw\Á\ÊµE\Õ\Àd\‚ \‚ÙJ•®]¿!‘µwH} Põ@éımD¡Æ\ÊhP¡ÚMÄ¿\ƒ,ó @ £¿¡\·Qw˘\“Nw\ÎÍïå£\Zä\0Z@¥\ÿus&@Ä@]∂`™´+´\Ÿ\€\€\Î^^\ﬂ\Ìnﬂª\Í5è>\Ëvû>\Óˆ˜˜∑:#\ƒV˘›ú@VDVNÉ @Ä\0ÿ∏Ä\0b\„\‰nHÄ\0#Åh\ÎK9÷∑ΩQèAé,\œ\–\ÃàñPœòöK	¨∞ìÑ\0XäÄ\0b)ù4\ƒ@\Èù7 Ç4Jô ^¿!\‘\·[~∂`\n\ﬂB @Ä@5àjZ°4+ Ä\“˙HDRe @Ä\0 @Ä\0 @Ä\0ÅW˛ıØ]H\ƒL\‚ÛaZ∞S+ù6œ±Ä7 <\€¯\Ôˇ˘\ﬂ\Ó\ﬂ_˚∑\Óø˛Û?∂]ä˚ @Ä@po@o†Ú	 ∞\0Åho@\‰ @\‰P4ãhÒbÒM5¡IàIL.*( Ä(àkh4&ê˛Mw˜Fc≥6]®I†\≈ı%DMO†Z®V†\≈/àjõ°∞ç\n 6\ \Ìfß < @Ä\0,E†\≈ı%\ƒRû^Û @†®@ã_EA\rF@\0¶Uã-T\0±\ÿ÷ö @Ä\0Å\ÊZ\‹\‚[\0\—\‹cn\¬úG@\0q5üYÇÄ\0b	]å=D\Ï˛©û\05	ÿÇ©¶n®Ö\0Z@¥\“iÛ$@\‡BàÒ˘p`Å£\Á/∫\'áœ∫;7ØûÖ\“# \"wO\Ì®K¿!\‘uıC5 –ÜÄ\0¢ç>õ%@\\\–\«	 pNÅÉ√£\ÓÚ•ù\Ó\÷\’+\Á¡\« @Ä¿ˇ <	 ∞m[0mªÔø∑∑◊Ωºæ\€›æwˇ\‘O<z¯†\€y˙∏\€\ﬂﬂü8¢\À ∞^@\0\·	!@Ä\0 [@\0ª™\'@Ä¿Z\\_Ú\ƒû\\s @†∏@ã	uqT7!`¶mR$ 0A@\01\…% PT@\0Qî7\ﬂ\‡ﬁÄ\»gi$ ∞N¿!‘ûèmÿÇi\€p,G@\0±ú^ö	¢\n ÇtN\0§Q\ $@Ä\0Åà-?áPáo°	 @†\ZD5≠Pö@iΩ\0\"H£îI`A∂`ZP3MeñÄ\0bóã \n†\Zí\0ç\n \Zmºi @†\"DE\ÕXWä\0\"H£îI`A-~A,®}¶r\ƒ|4ãÄ\0\"£A @†\Î∫Ùo˙ªª7X @Ä\0Å≠	¥∏æ\‰\Í≠=nnLÄ@$Åø \"ıG≠\Â\Âlç<M@\01\Õ\…U @Ä\0\‘/\–\‚˙í\0¢˛\ÁRÖT \–\‚D\ÏJ®@@\0QA\Z/A\0\—¯`˙ @Ä\0$\–\‚\ﬂà=¿¶BÄ@9D9[#\◊- Ä®ª?-T\'Äh°\À\ÊHÄ\0Å\Õº˚¡\'›ªog37s @\‡X@\0\·A @Ä¿\ƒ$ó,R\‡\Ë˘ã\Ó\…\·≥\Ó\Œ\ÕkãúüI\’/ Ä®øG*$@Ä@áPG\Èî:	 @`Ià%u\”\\(& Ä(Fk`¨88<\Í._\⁄\Èn]ΩBä\0\\H@\0q!>&@Ä\0Å\Ô<=Âù∑Æg-\∆à}R%[@lπnOÄ\0 @\‡Çà˙8\\X†\≈ı%ƒÖ –Ç@ãáµ\–Ws<[¿gπÇ\0à! Äà\—\'U @`\…à \›\›\€\€\Î^^\ﬂ\Ìnﬂªj≈è>\Ëvû>\Óˆ˜˜É\ÃHô @†NDù}i©*g@¥\‘ms%@Ä@YDY_£ @Ä¿\Ÿà≥ç™∏\"øˇ˝\Ô\◊\÷ÚΩ\Ô}O\0QE∑AÄ\0ëëª∑å\⁄\À\Ë£Y @†Åw?¯§{˜\Ì\Ô\‘Pä\Z @†Qg@4\⁄x\”&@Ä\0 @Ä\0 @Ä¿E˛˙◊øvø˛ıØªü¸\‰\'\›oºq2Tˇ˚?¯¡∫è?˛∏˚\Ÿ\œ~÷Ω˛˙\Îπ\’+üM\„ˇˆ∑ø˝¬∏œü?\Ô~Òã_tˇ˚\ﬂ_π˛[\ﬂ˙V˜\„ˇ8\€˝á˝Ûüˇ\Ï~ı´_u\ﬂ¯\∆7∫o~Ûõß÷ïÛ\∆¸\„è\Õ˚_\…¯˚\ﬂˇ˛ô∑HüKΩ¯\ÈO⁄Ωˇ˛˚\›Wø˙\’Iü;k\‡‘ã_˛Úó\›\ÁüæÛU˜˚\ Wæ\“˝¸\Á?ˇ\¬sˆ\—Gu˛Ûüø0\Ô\ﬂ¸\Ê7\'\√ˇ}\÷|ß¸˜êg@Lôòk @Ä\0 @Ä\0 ∞)Å\·\‚˚p|∏\Ë˚\⁄kØe/\Á¨\0\‚\Ì∑\ﬂ\Ón‹∏q|ﬂæ\∆\Ô~˜ª\'øó≥†U9\Ô—èï\\ü<yr≤\–\ﬁ\ﬂ˚\À_˛Úô\À0Ä\»ŸìU!Tâ˘ß1\Á\ﬁo’≥ò;t\ŒW\0Q™˚\∆%@Ä\0 @Ä\0 @†)ÅÒ\Ô™7“¢wzS\‡ÿßˇ\…˝Ò\¬x\Z\Ôo˚\€ÒÇz?VˇôØ˝\Î\«?…û˛˚∫7 ÜD∫\◊p±y¸Az{#Ö\È˜˜ª\ﬂ\ﬂÛk_˚\⁄Ò}\“~¯\·qΩ_˙“óéﬂ∏\Ë\ﬂÙHc~˙\Èß\«◊¶_7o\ﬁ¸\¬i.\ÈÛÈ≥©ˆdê\Êï>õ˛w˙\…¸Ù∂FzC#Ωë\–_;ºOˇ0•∑;“õ?˙—è^y\€d¯˚\È\⁄\‰í\Ó◊õ\r\Á7~¢c\„¥\Î\”XC´\ﬁ~^¨˙˛•∑#û={v¸¶L\nK˙7&\∆o-\\Ù~ΩU?N\Ôû\Ó?|Û#]\◊˜5=á\Èy\Í\ﬂ?sCø˛3i.\„\Áa¯á^\0\—\‘_Å&KÄ\0 @Ä\0 @Ä@)ÅÒÙ\ÌÑ¸\„\'A¡¡¡¡I∞ê\Õ\ﬂ{\ÔΩ\Óùw\ﬁ\È˛Úóøúl\rî∑áDZ®Oø“¢}øΩR\n\“\"ˆ\‘\0b¸π\·ñQ\√$Ö˝ò)dHã\ÿ|¡\…\€\√ZÜo\"§9¶ıÙÜ\≈p¶Ù˚˝ΩRΩik®7\ﬂ|Û$ÄHÛN[ıüOü\Ì√â~\Œ√û≠zÉa¯Ùµ§7RR\Õi¸¥¯û\ÊwZ\0±\Í˙¥(\ﬂ◊ü\ÁSxt⁄õSà˛s\√^§\–gX_é˚%Ø~ã¶‘§m±R\›\È\◊x\Î©U[0ç\Õ˙gb\ÿ\œ~\‹Uoû J˝mc\\ @Ä\0 @Ä\0öoq4Üa\ƒ0ÄX∑∞>¸¸∫\·}\Œ\n \∆g@¨:\'a∏®üËáÅ√∏â\„`dxÜBøò= \∆Û]¨\ﬂlX5ˇu[(\r\Ô?X\∆Û;-ÄXu}∫∂?;!C´\Ó⁄ô˝\€…∞?#\"\„Pg¸|ú˜~\È>˝9\„:Wù}qZ\0ëB§Toø]\◊0\‹Io∫üèU}Jµ ö˙+\–d	 @Ä\0 @Ä\0()\–/∆¶∑\“O˙˜[ ç\œj\Ë∑-Jµú∂5\–¯\rà\”∑˚m|¶æ1û˜∞ÜÙ\ﬂ˙\≈Ú\·©éÒV<˝\"˜¯\√W\’\”\Ôü@§\≈\ÍÙ´?¸zUÄ1\ﬁZ\È¢\ƒ\–eJ\0±\Í˙\·ˆSΩ\·i=Oy¢_\–oï\∆\Ì∑2˙”ü˛t≤-\“y\Ôó>7\ﬁlN\0Ò\÷[oΩÚ¸{õà>¿?ß\„gL\0QÚoc @Ä\0 @Ä\0 –î@ˇì\Ìi°˘≥\œ>;\ﬁ\Ó&-“Æ;,∫ˇ©ˇ¥µ\Õpa∑\ﬂ\Íhº\–?\Á\ràÒ}3\∆?ÅøjÅæ_`˛D~\Ó7 ˙7(¶sŒÄHgHº˛˙ÎØºµ∞j¶uD«∫áyn\01\Ïıp\‹uoØ;\Î\Íío@ ö˙k\Õd	 @Ä\0 @Ä\0®A†\ﬂ\€?m}4\‹\Óh@§7Üã\Ó\√3 ˙E\·Y	\„\0¢ˇ\È˘ãº1 ˙C±ì\ﬂ¯åÑq\0ë¬è\·\√q\Œ{\ƒ\‹\0\"\’9<{\"}(”üE0|.Ú\ƒLÜt&\∆lÑ\·A\‘sàÒ\„≥4Ü\€Aù\Á~\…hxè\‹g@ j¯\€F\r @Ä\0 @Ä\04\'êå\”6:\Èß\Ô”Çu˙5\\Oˇ?-\‚˜\Á3Ù[0•\ﬂ\Ô∑EJ[¸§E„¥∞û∂.\ZnŸìˆ¯Oø\“\¬˝¨Ö¥\ﬂˇ\Z/pèõ0\‹V)m˝ì¬ítVC™y|ˆ0TIuç\ﬂ\Ó◊úBÄq]iÅ˝\√?\Ï\∆Û\Zû?0ı\rà~.\„måV>}¢?˜!Ö\È\◊i\€/ı=CÛÒ˘ ˝ı\È\Ìó\œ?ˇ¸d˚•˛y\Œm\›˝˙\œ\Ô\’o\Â\‘ \ﬁ\◊}˚ˆ\Ìì\√\œ\ﬂˇ˝ì¨\ÔMÚKaKç∑ﬁö≤U\ÿ¯9≥Ss˝ô0 @Ä\0 @Ä\0∂#0<\Ã8\∆\Ï◊≤\À\ÓØ\Ÿ @Ä\0 @Ä\0 @`´\„7\“˝Å\‘[-\ÃÕã äª @Ä\0 @Ä\0hO@\0\—^\œÕò\0 @Ä\0 @Ä\08	 ä\ﬂ\…\r @Ä\0 @Ä\0 @Ä\0Å¶˛Ç\‰3&.»¨*\0\0\0\0IENDÆB`Ç');
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
INSERT INTO `pay_cycle_description` VALUES (1,NULL,NULL,NULL,'day','Ng√†y'),(2,NULL,NULL,NULL,'week','Tu·∫ßn'),(3,NULL,NULL,NULL,'month','Th√°ng'),(4,NULL,NULL,NULL,'hour','Gi·ªù'),(11,NULL,NULL,NULL,'test3','Long chinh');
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
INSERT INTO `position_description` VALUES (1,NULL,NULL,NULL,'intern','Th·ª±c t·∫≠p sinh'),(2,NULL,NULL,NULL,'associate','Nh√¢n vi√™n ch√≠nh th·ª©c'),(3,NULL,NULL,NULL,'manager','Qu·∫£n l√Ω');
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
INSERT INTO `product_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,'ƒê√£ ch·ªânh n·ªôi dung','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,151),(7,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,200),(8,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,201),(10,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,251),(11,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,252),(12,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','ƒê√¢y l√† s·∫£n ph·∫©m m·ªõi 1','string','string',NULL,NULL,'string','string',4,253);
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
INSERT INTO `product_type` VALUES (1,NULL,'2023-05-17 03:35:39','2023-05-17 03:35:39',NULL,'GENERAL',NULL,NULL,'dfefds'),(200,NULL,'2023-05-25 22:03:05','2023-05-25 22:03:05',NULL,'buonban',NULL,NULL,'Bu√¥n b√°n');
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
INSERT INTO `profile` VALUES (12,NULL,'T√¥i s·∫Ω ƒëi ƒÉn c∆∞·ªõpf','T√¥i mu·ªën ki·∫øm 30 tri·ªáu m·ªói ng√†yf',NULL,200,50,451,2,1,1);
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
INSERT INTO `province_description` VALUES (1,'2023-05-15 22:06:30','2023-05-15 22:06:30',NULL,'TP. H·ªì Ch√≠ Minh');
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
INSERT INTO `skill_description` VALUES (1,NULL,NULL,NULL,'java','Java'),(2,NULL,NULL,NULL,'dev','Developer'),(3,NULL,NULL,NULL,'negotiation_skill','ƒê√†m ph√°n'),(4,NULL,NULL,NULL,'programming_skill','L·∫≠p tr√¨nh'),(5,NULL,NULL,NULL,'problem_solving_skill','Gi·∫£i quy·∫øt v·∫•n ƒë·ªÅ'),(6,NULL,NULL,NULL,'sales_skill','B√°n h√†ng'),(7,NULL,NULL,NULL,'leadership_skill','L√£nh ƒë·∫°o'),(8,NULL,NULL,NULL,'project_management_skill','Qu·∫£n l√Ω d·ª± √°n'),(9,NULL,NULL,NULL,'accounting_software_skill','S·ª≠ d·ª•ng ph·∫ßn m·ªÅm k·∫ø to√°n'),(10,NULL,NULL,NULL,'financial_management_skill','Qu·∫£n l√Ω t√†i ch√≠nh'),(11,NULL,NULL,NULL,'teamwork_skill','L√†m vi·ªác nh√≥m'),(12,NULL,NULL,NULL,'repair_skill','S·ª≠a ch·ªØa'),(13,NULL,NULL,NULL,'installation_skill','L·∫Øp ƒë·∫∑t'),(14,NULL,NULL,NULL,'maintenance_skill','B·∫£o tr√¨'),(15,NULL,NULL,NULL,'marketing_skill','Ti·∫øp th·ªã'),(16,NULL,NULL,NULL,'advertising_skill','Qu·∫£ng c√°o'),(17,NULL,NULL,NULL,'customer_service_skill','D·ªãch v·ª• kh√°ch h√†ng'),(18,NULL,NULL,NULL,'data_analysis_skill','Ph√¢n t√≠ch d·ªØ li·ªáu'),(19,NULL,NULL,NULL,'problem_id_skillentification_skill','X√°c ƒë·ªãnh v·∫•n ƒë·ªÅ'),(20,NULL,NULL,NULL,'time_management_skill','Qu·∫£n l√Ω th·ªùi gian'),(21,NULL,NULL,NULL,'creativity_skill','S√°ng t·∫°o'),(22,NULL,NULL,NULL,'critical_thinking_skill','T∆∞ duy ph·∫£n bi·ªán'),(23,NULL,NULL,NULL,'decision_making_skill','Ra quy·∫øt ƒë·ªãnh'),(24,NULL,NULL,NULL,'emotional_intelligence_skill','Tr√≠ tu·ªá c·∫£m x√∫c'),(25,NULL,NULL,NULL,'adaptability_skill','S·ª± th√≠ch nghi'),(27,NULL,NULL,NULL,'team_management_skill','Qu·∫£n l√Ω nh√≥m'),(28,NULL,NULL,NULL,'research_skill','Nghi√™n c·ª©u'),(29,NULL,NULL,NULL,'problem-solving_skill','Gi·∫£i quy·∫øt v·∫•n ƒë·ªÅ'),(30,NULL,NULL,NULL,'communication_skill','Giao ti·∫øp'),(34,NULL,NULL,NULL,'design_skill','Thi·∫øt k·∫ø'),(35,NULL,NULL,NULL,'firearms_skill','H·ªèa gi√°p'),(36,NULL,NULL,NULL,'crisis_response_skill','Bi·ªán ph√°p ·ª©ng ph√≥'),(37,NULL,NULL,NULL,'survey_skill','Kh·∫£o s√°t'),(38,NULL,NULL,NULL,'data_skill','D·ªØ li·ªáu'),(39,NULL,NULL,NULL,'statistics_skill','Th·ªëng k√™'),(40,NULL,NULL,NULL,'positioning_skill','ƒê·ªãnh v·ªã'),(41,NULL,NULL,NULL,'interaction_skill','T∆∞∆°ng t√°c'),(43,NULL,NULL,NULL,'analysis_skill','Ph√¢n t√≠ch'),(44,NULL,NULL,NULL,'forecasting_skill','D·ª± b√°o'),(45,NULL,NULL,NULL,'data_collection_skill','Thu th·∫≠p'),(46,NULL,NULL,NULL,'solid_skillity_skill','Solid_skillity'),(47,NULL,NULL,NULL,'ethereum_skill','Ethereum'),(48,NULL,NULL,NULL,'hyperledger_fabric_skill','Hyperledger Fabric'),(49,NULL,NULL,NULL,'smart_contract_skill','Smart Contract'),(50,NULL,NULL,NULL,'adobe_creative_suite_skill','Adobe Creative Suite'),(51,NULL,NULL,NULL,'sketch_skill','Sketch'),(52,NULL,NULL,NULL,'wireframing_skill','Wireframing'),(53,NULL,NULL,NULL,'prototyping_skill','Prototyping'),(54,NULL,NULL,NULL,'testing_methodologies_skill','Testing methodologies'),(55,NULL,NULL,NULL,'test_automation_skill','Test automation'),(56,NULL,NULL,NULL,'bug_tracking_skill','Bug tracking'),(57,NULL,NULL,NULL,'selenium_skill','Selenium'),(58,NULL,NULL,NULL,'java_skill','Java'),(59,NULL,NULL,NULL,'swift_skill','Swift'),(60,NULL,NULL,NULL,'react_native_skill','React Native'),(61,NULL,NULL,NULL,'kotlin_skill','Kotlin'),(63,NULL,NULL,NULL,'agile_skill','Agile'),(64,NULL,NULL,NULL,'scrum_skill','Scrum'),(65,NULL,NULL,NULL,'kanban_skill','Kanban'),(66,NULL,NULL,NULL,'docker_skill','Docker'),(67,NULL,NULL,NULL,'kubernetes_skill','Kubernetes'),(68,NULL,NULL,NULL,'aws_skill','Amazon Web Services (AWS)'),(69,NULL,NULL,NULL,'azure_skill','Microsoft Azure'),(70,NULL,NULL,NULL,'google_cloud_skill','Google Cloud'),(71,NULL,NULL,NULL,'devops_skill','DevOps'),(72,NULL,NULL,NULL,'continuous_integration_skill','Continuous Integration'),(73,NULL,NULL,NULL,'continuous_deployment_skill','Continuous Deployment'),(74,NULL,NULL,NULL,'git_skill','Git'),(75,NULL,NULL,NULL,'github_skill','GitHub'),(76,NULL,NULL,NULL,'bitbucket_skill','Bitbucket'),(77,NULL,NULL,NULL,'jira_skill','Jira'),(78,NULL,NULL,NULL,'confluence_skill','Confluence'),(79,NULL,NULL,NULL,'ansible_skill','Ansible'),(80,NULL,NULL,NULL,'terraform_skill','Terraform'),(81,NULL,NULL,NULL,'python_skill','Python'),(83,NULL,NULL,NULL,'javascript_skill','JavaScript'),(84,NULL,NULL,NULL,'csharp_skill','C#'),(85,NULL,NULL,NULL,'php_skill','PHP'),(86,NULL,NULL,NULL,'ruby_skill','Ruby'),(87,NULL,NULL,NULL,'go_skill','Go'),(89,NULL,NULL,NULL,'typescript_skill','TypeScript'),(90,NULL,NULL,NULL,'html_skill','HTML'),(91,NULL,NULL,NULL,'css_skill','CSS'),(92,NULL,NULL,NULL,'ky_nang_hon_nhan','H√¥n nh√¢n'),(93,NULL,NULL,NULL,'ky_nang_gia_dinh','Gia ƒë√¨nh'),(94,NULL,NULL,NULL,'ky_nang_chi_phi','Chi ph√≠'),(95,NULL,NULL,NULL,'ky_nang_ky_thuat','K·ªπ thu·∫≠t'),(111,NULL,NULL,NULL,'ky_nang_thong_tin','Th√¥ng tin'),(112,NULL,NULL,NULL,'ky_nang_du_toan','D·ª± to√°n'),(113,NULL,NULL,NULL,'ky_nang_tu_van_suc_khoe','T∆∞ v·∫•n s·ª©c kh·ªèe'),(114,NULL,NULL,NULL,'ky_nang_suc_khoe','S·ª©c kh·ªèe'),(115,NULL,NULL,NULL,'ky_nang_dinh_duong','Dinh d∆∞·ª°ng'),(116,NULL,NULL,NULL,'ky_nang_lao_dong','Lao ƒë·ªông'),(117,NULL,NULL,NULL,'ky_nang_an_toan','An to√†n'),(118,NULL,NULL,NULL,'ky_nang_cham_soc_da','ChƒÉm s√≥c da'),(119,NULL,NULL,NULL,'ky_nang_trang_diem','Trang ƒëi·ªÉm'),(120,NULL,NULL,NULL,'ky_nang_phuc_hoi_da','Ph·ª•c h·ªìi da'),(121,NULL,NULL,NULL,'ky_nang_trang_bi','Trang b·ªã'),(122,NULL,NULL,NULL,'ky_nang_bep','B·∫øp'),(123,NULL,NULL,NULL,'ky_nang_pha_che','Pha ch·∫ø'),(124,NULL,NULL,NULL,'ky_nang_pha_che_ruou','Pha ch·∫ø r∆∞·ª£u'),(125,NULL,NULL,NULL,'ky_nang_pha_che_cafe','Pha ch·∫ø c√† ph√™'),(126,NULL,NULL,NULL,'ky_nang_pha_che_nuoc_uong','Pha ch·∫ø n∆∞·ªõc u·ªëng'),(127,NULL,NULL,NULL,'ky_nang_tu_van_du_hoc','T∆∞ v·∫•n du h·ªçc'),(128,NULL,NULL,NULL,'ky_nang_lam_moi_ho_so','L√†m m·ªõi h·ªì s∆°'),(129,NULL,NULL,NULL,'ky_nang_lam_viec_tu_xa','L√†m vi·ªác t·ª´ xa'),(130,NULL,NULL,NULL,'ky_nang_soan_thao','So·∫°n th·∫£o'),(131,NULL,NULL,NULL,'ky_nang_nghien_cuu','Nghi√™n c·ª©u'),(132,NULL,NULL,NULL,'ky_nang_phat_trien_du_an','Ph√°t tri·ªÉn d·ª± √°n'),(133,NULL,NULL,NULL,'ky_nang_tu_van_tu_thien','T∆∞ v·∫•n t·ª´ thi·ªán'),(134,NULL,NULL,NULL,'ky_nang_thuc_pham','Th·ª±c ph·∫©m'),(135,NULL,NULL,NULL,'ky_nang_nong_nghiep','N√¥ng nghi·ªáp'),(136,NULL,NULL,NULL,'ky_nang_thiet_ke','Thi·∫øt k·∫ø'),(137,NULL,NULL,NULL,'ky_nang_dien','ƒêi·ªán'),(138,NULL,NULL,NULL,'ky_nang_dien_tu','ƒêi·ªán t·ª≠'),(139,NULL,NULL,NULL,'ky_nang_nuoi_trong','Nu√¥i tr·ªìng'),(140,NULL,NULL,NULL,'ky_nang_quan_tri_ban_hang','Qu·∫£n tr·ªã b√°n h√†ng'),(141,NULL,NULL,NULL,'ky_nang_mua_ban','Mua b√°n'),(142,NULL,NULL,NULL,'ky_nang_giao_tiep','Giao ti·∫øp'),(143,NULL,NULL,NULL,'ky_nang_giao_duc','Gi√°o d·ª•c'),(144,NULL,NULL,NULL,'ky_nang_hoc','H·ªçc'),(145,NULL,NULL,NULL,'ky_nang_cong_nghe','C√¥ng ngh·ªá'),(147,NULL,NULL,NULL,'presentation_skill','Thuy·∫øt tr√¨nh');
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
INSERT INTO `ward_description` VALUES (1,'2023-05-15 22:15:56','2023-05-15 22:15:56',NULL,'B·∫øn Ngh√©',1),(2,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'B·∫øn Ngh√©',1),(3,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'B·∫øn Th√†nh',1),(4,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'C·∫ßu Kho',1),(5,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'C·∫ßu √îng L√£nh',1),(6,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'C√¥ Giang',1),(7,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'ƒêa Kao',1),(8,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguy·ªÖn C∆∞ Trinh',1),(9,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Nguy·ªÖn Th√°i B√¨nh',1),(10,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'Ph·∫°m Ng≈© L√£o',1),(11,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'T√¢n ƒê·ªãnh',1),(12,'2023-05-15 22:17:21','2023-05-15 22:17:21',NULL,'ƒêakao',1),(13,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Kh√°nh',2),(14,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An L·ª£i ƒê√¥ng',2),(15,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'An Ph√∫',2),(16,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'B√¨nh An',2),(17,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'B√¨nh Kh√°nh',2),(18,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'B√¨nh Tr∆∞ng ƒê√¥ng',2),(19,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'B√¨nh Tr∆∞ng T√¢y',2),(20,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'C√°t L√°i',2),(21,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Th·∫°nh M·ªπ L·ª£i',2),(22,'2023-05-15 22:19:48','2023-05-15 22:19:48',NULL,'Th·∫£o ƒêi·ªÅn',2),(23,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'1',3),(24,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'2',3),(25,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'3',3),(26,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'4',3),(27,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'5',3),(28,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'6',3),(29,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'7',3),(30,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'8',3),(31,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'9',3),(32,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'10',3),(33,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'11',3),(34,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'12',3),(35,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'13',3),(36,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'14',3),(37,'2023-05-15 22:21:30','2023-05-15 22:21:30',NULL,'15',3),(38,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'1',4),(39,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'2',4),(40,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'3',4),(41,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'4',4),(42,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'5',4),(43,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'6',4),(44,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'7',4),(45,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'8',4),(46,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'9',4),(47,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'10',4),(48,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'11',4),(49,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'12',4),(50,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'13',4),(51,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'14',4),(52,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'15',4),(53,'2023-05-15 22:28:04','2023-05-15 22:28:04',NULL,'16',4),(54,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'1',5),(55,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'2',5),(56,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'3',5),(57,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'4',5),(58,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'5',5),(59,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'6',5),(60,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'7',5),(61,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'8',5),(62,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'9',5),(63,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'10',5),(64,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'11',5),(65,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'12',5),(66,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'13',5),(67,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'14',5),(68,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'15',5),(69,'2023-05-15 22:29:13','2023-05-15 22:29:13',NULL,'16',5),(70,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'1',6),(71,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'2',6),(72,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'3',6),(73,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'4',6),(74,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'5',6),(75,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'6',6),(76,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'7',6),(77,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'8',6),(78,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'9',6),(79,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'10',6),(80,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'11',6),(81,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'12',6),(82,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'13',6),(83,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'14',6),(84,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'15',6),(85,'2023-05-15 22:30:18','2023-05-15 22:30:18',NULL,'16',6),(86,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'B√¨nh Thu·∫≠n',7),(87,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Ph√∫ M·ªπ',7),(88,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'Ph√∫ Thu·∫≠n',7),(89,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n H∆∞ng',7),(90,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Ki·ªÉng',7),(91,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Phong',7),(92,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Ph√∫',7),(93,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Quy',7),(94,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Thu·∫≠n ƒê√¥ng',7),(95,'2023-05-15 22:32:00','2023-05-15 22:32:00',NULL,'T√¢n Thu·∫≠n T√¢y',7),(96,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'1',8),(97,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'2',8),(98,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'3',8),(99,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'4',8),(100,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'5',8),(101,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'6',8),(102,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'7',8),(103,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'8',8),(104,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'9',8),(105,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'10',8),(106,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'11',8),(107,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'12',8),(108,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'13',8),(109,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'14',8),(110,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'15',8),(111,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'16',8),(112,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'B√¨nh ƒê·ª©c',8),(113,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'B√¨nh H∆∞ng H√≤a',8),(114,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'B√¨nh H∆∞ng H√≤a A',8),(115,'2023-05-15 22:33:50','2023-05-15 22:33:50',NULL,'B√¨nh H∆∞ng H√≤a B',8),(116,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Hi·ªáp Ph√∫',9),(117,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long B√¨nh',9),(118,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Ph∆∞·ªõc',9),(119,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Th·∫°nh M·ªπ',9),(120,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Long Tr∆∞·ªùng',9),(121,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Ph√∫ H·ªØu',9),(122,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Ph∆∞·ªõc B√¨nh',9),(123,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Ph∆∞·ªõc Long A',9),(124,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Ph∆∞·ªõc Long B',9),(125,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'TƒÉng Nh∆°n Ph√∫ A',9),(126,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'TƒÉng Nh∆°n Ph√∫ B',9),(127,'2023-05-15 22:36:03','2023-05-15 22:36:03',NULL,'Tr∆∞·ªùng Th·∫°nh',9),(128,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'1',10),(129,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'2',10),(130,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'3',10),(131,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'4',10),(132,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'5',10),(133,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'6',10),(134,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'7',10),(135,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'8',10),(136,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'9',10),(137,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'10',10),(138,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'11',10),(139,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'12',10),(140,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'13',10),(141,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'14',10),(142,'2023-05-15 22:37:18','2023-05-15 22:37:18',NULL,'15',10),(143,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'1',11),(144,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'2',11),(145,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'3',11),(146,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'4',11),(147,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'5',11),(148,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'6',11),(149,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'7',11),(150,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'8',11),(151,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'9',11),(152,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'10',11),(153,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'11',11),(154,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'12',11),(155,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'13',11),(156,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'14',11),(157,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'15',11),(158,'2023-05-15 22:38:00','2023-05-15 22:38:00',NULL,'16',11),(159,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Th·∫°nh Xu√¢n',12),(160,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Th·∫°nh L·ªôc',12),(161,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Hi·ªáp Th√†nh',12),(162,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Th·ªõi An',12),(163,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'T√¢n Ch√°nh Hi·ªáp',12),(164,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'An Ph√∫ ƒê√¥ng',12),(165,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'T√¢n Th·ªõi Hi·ªáp',12),(166,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'Trung M·ªπ T√¢y',12),(167,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'T√¢n H∆∞ng Thu·∫≠n',12),(168,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'ƒê√¥ng H∆∞ng Thu·∫≠n',12),(169,'2023-05-15 22:39:52','2023-05-15 22:39:52',NULL,'T√¢n Th·ªõi Nh·∫•t',11),(170,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'1',13),(171,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'2',13),(172,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'3',13),(173,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'4',13),(174,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'5',13),(175,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'6',13),(176,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'7',13),(177,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'8',13),(178,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'9',13),(179,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'10',13),(180,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'11',13),(181,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'12',13),(182,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'13',13),(183,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'14',13),(184,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'15',13),(185,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'16',13),(186,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'17',13),(187,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'18',13),(188,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'19',13),(189,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'20',13),(190,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'21',13),(191,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'22',13),(192,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'23',13),(193,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'24',13),(194,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'25',13),(195,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'26',13),(196,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'27',13),(197,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'28',13),(198,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'29',13),(199,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'30',13),(200,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'31',13),(201,'2023-05-15 22:43:52','2023-05-15 22:43:52',NULL,'32',13),(202,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'1',14),(203,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'2',14),(204,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'3',14),(205,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'4',14),(206,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'5',14),(207,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'6',14),(208,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'7',14),(209,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'8',14),(210,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'9',14),(211,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'10',14),(212,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'11',14),(213,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'12',14),(214,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'13',14),(215,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'14',14),(216,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'15',14),(217,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'16',14),(218,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'17',14),(219,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'18',14),(220,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'19',14),(221,'2023-05-15 22:45:45','2023-05-15 22:45:45',NULL,'20',14),(222,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'1',15),(223,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'2',15),(224,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'3',15),(225,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'4',15),(226,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'5',15),(227,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'6',15),(228,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'7',15),(229,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'8',15),(230,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'9',15),(231,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'10',15),(232,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'11',15),(233,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'12',15),(234,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'13',15),(235,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'14',15),(236,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'15',15),(237,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'Th·∫°nh M·ªπ L·ª£i',15),(238,'2023-05-15 22:47:37','2023-05-15 22:47:37',NULL,'17',15),(239,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'1',16),(240,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'2',16),(241,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'3',16),(242,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'4',16),(243,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'5',16),(244,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'6',16),(245,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'7',16),(246,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'8',16),(247,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'9',16),(248,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'10',16),(249,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'11',16),(250,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'12',16),(251,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'13',16),(252,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'14',16),(253,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'15',16),(254,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'T√¢n Th√†nh',16),(255,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'T√¢n S∆°n Nh√¨',16),(256,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'T√¢n Qu√Ω',16),(257,'2023-05-15 22:49:18','2023-05-15 22:49:18',NULL,'T√¢n Th·ªõi Ho√†',16),(258,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'T√¢n S∆°n Nh√¨',17),(259,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'T√¢y Th·∫°nh',17),(260,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'S∆°n K·ª≥',17),(261,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'T√¢n Q√∫y',17),(262,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'T√¢n Th√†nh',17),(263,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Ph√∫ Th·ªç H√≤a',17),(264,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Ph√∫ Th·∫°nh',17),(265,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Ph√∫ Trung',17),(266,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Ho√† Th·∫°nh',17),(267,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'Hi·ªáp T√¢n',17),(268,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'T√¢n Th·ªõi Ho√†',17),(269,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'B√¨nh H∆∞ng H√≤a',17),(270,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'B√¨nh H∆∞ng Ho√† A',17),(271,'2023-05-15 22:51:56','2023-05-15 22:51:56',NULL,'B√¨nh H∆∞ng Ho√† B',17),(272,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Xu√¢n',18),(273,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'B√¨nh Chi·ªÉu',18),(274,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Trung',18),(275,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam B√¨nh',18),(276,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tam Ph√∫',18),(277,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hi·ªáp B√¨nh Ph∆∞·ªõc',18),(278,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Hi·ªáp B√¨nh Ch√°nh',18),(279,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh Chi·ªÉu',18),(280,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh T√¢y',18),(281,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Linh ƒê√¥ng',18),(282,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'B√¨nh Th·ªç',18),(283,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Tr∆∞·ªùng Th·ªç',18),(284,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long B√¨nh',18),(285,'2023-05-15 22:54:38','2023-05-15 22:54:38',NULL,'Long Th·∫°nh M·ªπ',18),(286,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh H∆∞ng H√≤a',19),(287,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh H∆∞ng Ho√† A',19),(288,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh H∆∞ng Ho√† B',19),(289,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh Tr·ªã ƒê√¥ng',19),(290,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh Tr·ªã ƒê√¥ng A',19),(291,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'B√¨nh Tr·ªã ƒê√¥ng B',19),(292,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'T√¢n T·∫°o',19),(293,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'T√¢n T·∫°o A',19),(294,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An L·∫°c',19),(295,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'An L·∫°c A',19),(296,'2023-05-15 22:57:12','2023-05-15 22:57:12',NULL,'T√¢n Thu·∫≠n ƒê√¥ng',19),(297,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Th·ªã tr·∫•n C·ªß Chi',20),(298,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An Nh∆°n T√¢y',20),(299,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'An Ph√∫',20),(300,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'B√¨nh M·ªπ',20),(301,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'H√≤a Ph√∫',20),(302,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Nhu·∫≠n ƒê·ª©c',20),(303,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Ph·∫°m VƒÉn C·ªôi',20),(304,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Ph√∫ H√≤a ƒê√¥ng',20),(305,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Ph√∫ M·ªπ H∆∞ng',20),(306,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Ph∆∞·ªõc Hi·ªáp',20),(307,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'Ph∆∞·ªõc Th·∫°nh',20),(308,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'T√¢n An H·ªôi',20),(309,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'T√¢n Ph√∫ Trung',20),(310,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'T√¢n Th·∫°nh ƒê√¥ng',20),(311,'2023-05-15 23:01:36','2023-05-15 23:01:36',NULL,'T√¢n Th·∫°nh T√¢y',20),(312,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'T√¢n Th√¥ng H·ªôi',20),(313,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung An',20),(314,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung L·∫≠p H·∫°',20),(315,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Trung L·∫≠p Th∆∞·ª£ng',20),(316,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'Tr∆∞·ªùng Th·∫°nh',20),(317,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'X√° Xu√¢n 1',20),(318,'2023-05-15 23:01:37','2023-05-15 23:01:37',NULL,'X√° Xu√¢n 2',20),(319,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'Th·ªã tr·∫•n H√≥c M√¥n',21),(320,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'B√† ƒêi·ªÉm',21),(321,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'ƒê√¥ng Th·∫°nh',21),(322,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'T√¢n Hi·ªáp',21),(323,'2023-05-15 23:03:37','2023-05-15 23:03:37',NULL,'T√¢n Th·ªõi Nh√¨',21),(324,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'T√¢n Xu√¢n',21),(325,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Th·ªõi Tam Th√¥n',21),(326,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Trung Ch√°nh',21),(327,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Xu√¢n Th·ªõi ƒê√¥ng',21),(328,'2023-05-15 23:03:38','2023-05-15 23:03:38',NULL,'Xu√¢n Th·ªõi S∆°n',21),(329,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Th·ªã tr·∫•n Nh√† B√®',22),(330,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Ph∆∞·ªõc Ki·ªÉn',22),(331,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Ph∆∞·ªõc L·ªôc',22),(332,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Nh∆°n ƒê·ª©c',22),(333,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Ph√∫ Xu√¢n',22),(334,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Long Th·ªõi',22),(335,'2023-05-15 23:05:14','2023-05-15 23:05:14',NULL,'Hi·ªáp Ph∆∞·ªõc',22),(336,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·ªã tr·∫•n C·∫ßn Th·∫°nh',23),(337,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Th·ªõi ƒê√¥ng',23),(338,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'B√¨nh Kh√°nh',23),(339,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Long H√≤a',23),(340,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'L√Ω Nh∆°n',23),(341,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam Th√¥n Hi·ªáp',23),(342,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·∫°nh An',23),(343,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·∫°nh L·ªôc',23),(344,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·∫°nh M·ªπ',23),(345,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·ªõi ƒê√¥ng',23),(346,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'An Th·ªõi T√¢y',23),(347,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'C·∫ßn Th·∫°nh',23),(348,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'L·ªôc An',23),(349,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Tam Th√¥n H·ªôi',23),(350,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·∫°nh Ph√∫',23),(351,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·ªõi H·∫£i',23),(352,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Th·ªõi Thu·∫≠n',23),(353,'2023-05-15 23:07:53','2023-05-15 23:07:53',NULL,'Vƒ©nh B√¨nh',23);
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
INSERT INTO `work_experience` VALUES ('6f795a0d-4506-4dd7-9f72-fb27e0eb7f95','C√¥ng ty TNHH M·ªòT M√åNH TAOf','L√†m m·ªôt ng√†y th√¨ b·ªã ƒëu·ªïfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam ƒë·ªëc c√¥ng ngh·ªáf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e'),('c00707b4-3467-49b4-8ba0-86dc0519fcd4','C√¥ng ty TNHH M·ªòT M√åNH TAOf','L√†m m·ªôt ng√†y th√¨ b·ªã ƒëu·ªïfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam ƒë·ªëc c√¥ng ngh·ªáf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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
INSERT INTO `zone_description` VALUES (1,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,1,1),(2,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,2,1),(3,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Guipuzcoa',NULL,3,1),(4,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,1,2),(5,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,2,2),(6,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Hawaii',NULL,3,2),(7,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,1,3),(8,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,2,3),(9,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Puerto Rico',NULL,3,3),(10,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,1,4),(11,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,2,4),(12,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Zamora',NULL,3,4),(13,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,1,5),(14,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,2,5),(15,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Vizcaya',NULL,3,5),(16,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Other',NULL,1,6),(17,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Otro',NULL,3,6),(18,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,1,7),(19,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,2,7),(20,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Albacete',NULL,3,7),(21,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,1,8),(22,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,2,8),(23,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Lleida',NULL,3,8),(24,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,1,9),(25,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Qu√©bec',NULL,2,9),(26,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Quebec',NULL,3,9),(27,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,1,10),(28,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,2,10),(29,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Nordrhein-Westfalen',NULL,3,10),(30,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,1,11),(31,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,2,11),(32,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Iowa',NULL,3,11),(33,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,1,12),(34,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,2,12),(35,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Idaho',NULL,3,12),(36,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,1,13),(37,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon',NULL,2,13),(38,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Yukon Territory',NULL,3,13),(39,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,1,14),(40,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,2,14),(41,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Leon',NULL,3,14),(42,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,1,15),(43,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'A Corua',NULL,3,15),(44,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,1,16),(45,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,2,16),(46,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Castellon',NULL,3,16),(47,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,1,17),(48,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,2,17),(49,'2023-05-17 03:35:28','2023-05-17 03:35:28',NULL,NULL,'Las Palmas',NULL,3,17),(50,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,1,18),(51,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,2,18),(52,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Pontevedra',NULL,3,18),(53,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,1,19),(54,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,2,19),(55,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Americas',NULL,3,19),(56,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,1,20),(57,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,2,20),(58,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Teruel',NULL,3,20),(59,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,1,21),(60,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,2,21),(61,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Alberta',NULL,3,21),(62,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,1,22),(63,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,2,22),(64,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Canada',NULL,3,22),(65,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,1,23),(66,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,2,23),(67,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Illinois',NULL,3,23),(68,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,1,24),(69,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,2,24),(70,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Europe',NULL,3,24),(71,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,1,25),(72,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,2,25),(73,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Armed Forces Africa',NULL,3,25),(74,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,1,26),(75,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,2,26),(76,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Indiana',NULL,3,26),(77,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,1,27),(78,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,2,27),(79,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'Aargau',NULL,3,27),(80,'2023-05-17 03:35:29','2023-05-17 03:35:29',NULL,NULL,'A Corua',NULL,2,28),(81,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,1,29),(82,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,2,29),(83,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Appenzell Innerrhoden',NULL,3,29),(84,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,1,30),(85,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,2,30),(86,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alaska',NULL,3,30),(87,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,1,31),(88,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,2,31),(89,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Caceres',NULL,3,31),(90,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,1,32),(91,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,2,32),(92,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Segovia',NULL,3,32),(93,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,1,33),(94,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,2,33),(95,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Alabama',NULL,3,33),(96,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,1,34),(97,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,2,34),(98,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Middle East',NULL,3,34),(99,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,1,35),(100,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,2,35),(101,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zug',NULL,3,35),(102,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,1,36),(103,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,2,36),(104,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Malaga',NULL,3,36),(105,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,1,37),(106,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Central',NULL,3,37),(107,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,1,38),(108,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,2,38),(109,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Zrich',NULL,3,38),(110,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,1,39),(111,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,2,39),(112,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'La Rioja',NULL,3,39),(113,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,1,40),(114,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,2,40),(115,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Armed Forces Pacific',NULL,3,40),(116,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,1,41),(117,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,2,41),(118,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Melilla',NULL,3,41),(119,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,1,42),(120,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,2,42),(121,'2023-05-17 03:35:30','2023-05-17 03:35:30',NULL,NULL,'Arkansas',NULL,3,42),(122,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,1,43),(123,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,2,43),(124,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'American Samoa',NULL,3,43),(125,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,1,44),(126,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Nouvelle-Galles du Sud',NULL,2,44),(127,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'New South Wales',NULL,3,44),(128,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,1,45),(129,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,2,45),(130,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Madrid',NULL,3,45),(131,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,1,46),(132,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,2,46),(133,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Rhode Island',NULL,3,46),(134,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,1,47),(135,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,2,47),(136,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Arizona',NULL,3,47),(137,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,1,48),(138,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,2,48),(139,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Ceuta',NULL,3,48),(140,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,1,49),(141,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Colombie Britanique',NULL,2,49),(142,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'British Columbia',NULL,3,49),(143,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,1,50),(144,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,2,50),(145,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huelva',NULL,3,50),(146,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,1,51),(147,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,2,51),(148,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Bern',NULL,3,51),(149,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,1,52),(150,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,2,52),(151,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Huesca',NULL,3,52),(152,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,1,53),(153,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,2,53),(154,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Appenzell Ausserrhoden',NULL,3,53),(155,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,1,54),(156,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,2,54),(157,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Landschaft',NULL,3,54),(158,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,1,55),(159,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,2,55),(160,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Jura',NULL,3,55),(161,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,1,56),(162,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,2,56),(163,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Asturias',NULL,3,56),(164,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,1,57),(165,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Australie-Mridionale',NULL,2,57),(166,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Australia',NULL,3,57),(167,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,1,58),(168,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,2,58),(169,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Salzburg',NULL,3,58),(170,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,1,59),(171,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,2,59),(172,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tirol',NULL,3,59),(173,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,1,60),(174,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Caroline du Sud',NULL,2,60),(175,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Carolina',NULL,3,60),(176,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,1,61),(177,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,2,61),(178,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Thringen',NULL,3,61),(179,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,1,62),(180,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Dakota du Sud',NULL,2,62),(181,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'South Dakota',NULL,3,62),(182,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,1,63),(183,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,2,63),(184,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Basel-Stadt',NULL,3,63),(185,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,1,64),(186,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,2,64),(187,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Cordoba',NULL,3,64),(188,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,1,65),(189,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,2,65),(190,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Tarragona',NULL,3,65),(191,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,1,66),(192,'2023-05-17 03:35:31','2023-05-17 03:35:31',NULL,NULL,'Valladolid',NULL,2,66),(193,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Valladolid',NULL,3,66),(194,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,1,67),(195,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,2,67),(196,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'St. Gallen',NULL,3,67),(197,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,1,68),(198,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,2,68),(199,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schaffhausen',NULL,3,68),(200,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,1,69),(201,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australie-Occidentale',NULL,2,69),(202,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Western Australia',NULL,3,69),(203,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,1,70),(204,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,2,70),(205,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Saskatchewan',NULL,3,70),(206,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,1,71),(207,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,2,71),(208,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Niedersachsen',NULL,3,71),(209,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,1,72),(210,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,2,72),(211,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Solothurn',NULL,3,72),(212,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,1,73),(213,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Californie',NULL,2,73),(214,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'California',NULL,3,73),(215,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,1,74),(216,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire du Nord',NULL,2,74),(217,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Northern Territory',NULL,3,74),(218,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,1,75),(219,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,2,75),(220,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Steiermark',NULL,3,75),(221,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,1,76),(222,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Karten',NULL,2,76),(223,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Katen',NULL,3,76),(224,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,1,77),(225,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,2,77),(226,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Jaen',NULL,3,77),(227,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Asuncion',NULL,1,78),(228,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Asunci√≥n',NULL,3,78),(229,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,1,79),(230,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,2,79),(231,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Ciudad Real',NULL,3,79),(232,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,1,80),(233,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,2,80),(234,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Schwyz',NULL,3,80),(235,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,1,81),(236,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,2,81),(237,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Alava',NULL,3,81),(238,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,1,82),(239,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,2,82),(240,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kansas',NULL,3,82),(241,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,1,83),(242,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,2,83),(243,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Colorado',NULL,3,83),(244,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,1,84),(245,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,2,84),(246,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Kentucky',NULL,3,84),(247,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,1,85),(248,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,2,85),(249,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Berlin',NULL,3,85),(250,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,1,86),(251,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,2,86),(252,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Connecticut',NULL,3,86),(253,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Australian Capital Territory',NULL,1,87),(254,'2023-05-17 03:35:32','2023-05-17 03:35:32',NULL,NULL,'Territoire de la capitale australienne',NULL,2,87),(255,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Australian Capital Territory',NULL,3,87),(256,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,1,88),(257,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,2,88),(258,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Thurgau',NULL,3,88),(259,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,1,89),(260,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiane',NULL,2,89),(261,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Louisiana',NULL,3,89),(262,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,1,90),(263,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,2,90),(264,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Hamburg',NULL,3,90),(265,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,1,91),(266,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,2,91),(267,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tessin',NULL,3,91),(268,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,1,92),(269,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,2,92),(270,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Lugo',NULL,3,92),(271,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,1,93),(272,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,2,93),(273,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Neuenburg',NULL,3,93),(274,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,1,94),(275,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,2,94),(276,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tennessee',NULL,3,94),(277,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,1,95),(278,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,2,95),(279,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Toledo',NULL,3,95),(280,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,1,96),(281,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District de Columbia',NULL,2,96),(282,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'District of Columbia',NULL,3,96),(283,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,1,97),(284,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,2,97),(285,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Palencia',NULL,3,97),(286,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,1,98),(287,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,2,98),(288,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Delaware',NULL,3,98),(289,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,1,99),(290,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,2,99),(291,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Texas',NULL,3,99),(292,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,1,100),(293,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmanie',NULL,2,100),(294,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Tasmania',NULL,3,100),(295,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,1,101),(296,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,2,101),(297,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Queensland',NULL,3,101),(298,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,1,102),(299,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,2,102),(300,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Luzern',NULL,3,102),(301,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,1,103),(302,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,2,103),(303,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Burgos',NULL,3,103),(304,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,1,104),(305,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,2,104),(306,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Cadiz',NULL,3,104),(307,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,1,105),(308,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,2,105),(309,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Santa Cruz de Tenerife',NULL,3,105),(310,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,1,106),(311,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,2,106),(312,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Massachusetts',NULL,3,106),(313,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,1,107),(314,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,2,107),(315,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Manitoba',NULL,3,107),(316,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,1,108),(317,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,2,108),(318,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Maryland',NULL,3,108),(319,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,1,109),(320,'2023-05-17 03:35:33','2023-05-17 03:35:33',NULL,NULL,'Girona',NULL,2,109),(321,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Girona',NULL,3,109),(322,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,1,110),(323,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,2,110),(324,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Maine',NULL,3,110),(325,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,1,111),(326,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,2,111),(327,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Alicante',NULL,3,111),(328,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,1,112),(329,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,2,112),(330,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Guadalajara',NULL,3,112),(331,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,1,113),(332,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,2,113),(333,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cantabria',NULL,3,113),(334,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,1,114),(335,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,2,114),(336,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Marshall Islands',NULL,3,114),(337,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,1,115),(338,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,2,115),(339,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Michigan',NULL,3,115),(340,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,1,116),(341,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,2,116),(342,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Uri',NULL,3,116),(343,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,1,117),(344,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,2,117),(345,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Utah',NULL,3,117),(346,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,1,118),(347,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,2,118),(348,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Minnesota',NULL,3,118),(349,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,1,119),(350,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,2,119),(351,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Missouri',NULL,3,119),(352,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,1,120),(353,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,2,120),(354,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Northern Mariana Islands',NULL,3,120),(355,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,1,121),(356,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,2,121),(357,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Barcelona',NULL,3,121),(358,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,1,122),(359,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,2,122),(360,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mississippi',NULL,3,122),(361,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,1,123),(362,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,2,123),(363,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Montana',NULL,3,123),(364,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,1,124),(365,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,2,124),(366,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Badajoz',NULL,3,124),(367,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,1,125),(368,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,2,125),(369,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Mecklenburg-Vorpommern',NULL,3,125),(370,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,1,126),(371,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginie',NULL,2,126),(372,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virginia',NULL,3,126),(373,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,1,127),(374,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,2,127),(375,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Voralberg',NULL,3,127),(376,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,1,128),(377,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,2,128),(378,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Cuenca',NULL,3,128),(379,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,1,129),(380,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,2,129),(381,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Wien',NULL,3,129),(382,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,1,130),(383,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,2,130),(384,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Waadt',NULL,3,130),(385,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,1,131),(386,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,2,131),(387,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sevilla',NULL,3,131),(388,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,1,132),(389,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,2,132),(390,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Virgin Islands',NULL,3,132),(391,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,1,133),(392,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,2,133),(393,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Zaragoza',NULL,3,133),(394,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,1,134),(395,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Nouveau Brunswick',NULL,2,134),(396,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'New Brunswick',NULL,3,134),(397,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,1,135),(398,'2023-05-17 03:35:34','2023-05-17 03:35:34',NULL,NULL,'Sachsen-Anhalt',NULL,2,135),(399,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen-Anhalt',NULL,3,135),(400,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,1,136),(401,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Caroline du Nord',NULL,2,136),(402,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Carolina',NULL,3,136),(403,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,1,137),(404,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Dakota du Nord',NULL,2,137),(405,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'North Dakota',NULL,3,137),(406,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,1,138),(407,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,2,138),(408,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nebraska',NULL,3,138),(409,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,1,139),(410,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Terre-Neuve - Labrador',NULL,2,139),(411,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Newfoundland - Labrador',NULL,3,139),(412,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,1,140),(413,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Hampshire',NULL,2,140),(414,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Hampshire',NULL,3,140),(415,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,1,141),(416,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,2,141),(417,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Jersey',NULL,3,141),(418,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,1,142),(419,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,2,142),(420,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wallis',NULL,3,142),(421,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,1,143),(422,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,2,143),(423,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Vermont',NULL,3,143),(424,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,1,144),(425,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouveau Mexique',NULL,2,144),(426,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New Mexico',NULL,3,144),(427,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,1,145),(428,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,2,145),(429,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Niederosterreich',NULL,3,145),(430,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,1,146),(431,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,2,146),(432,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Sachsen',NULL,3,146),(433,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,1,147),(434,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nouvelle √âcosse',NULL,2,147),(435,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nova Scotia',NULL,3,147),(436,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,1,148),(437,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,2,148),(438,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Saarland',NULL,3,148),(439,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,1,149),(440,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Floride',NULL,2,149),(441,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Florida',NULL,3,149),(442,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,1,150),(443,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Territores du Nord-Ouest',NULL,2,150),(444,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Northwest Territories',NULL,3,150),(445,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,1,151),(446,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,2,151),(447,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Federated States Of Micronesia',NULL,3,151),(448,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,1,152),(449,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,2,152),(450,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nunavut',NULL,3,152),(451,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,1,153),(452,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,2,153),(453,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nevada',NULL,3,153),(454,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,1,154),(455,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,2,154),(456,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Nidwalden',NULL,3,154),(457,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,1,155),(458,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,2,155),(459,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Washington',NULL,3,155),(460,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,1,156),(461,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,2,156),(462,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'New York',NULL,3,156),(463,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,1,157),(464,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,2,157),(465,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Granada',NULL,3,157),(466,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,1,158),(467,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,2,158),(468,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Soria',NULL,3,158),(469,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,1,159),(470,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,2,159),(471,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Freiburg',NULL,3,159),(472,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,1,160),(473,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,2,160),(474,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Rheinland-Pfalz',NULL,3,160),(475,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,1,161),(476,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,2,161),(477,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Ourense',NULL,3,161),(478,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,1,162),(479,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,2,162),(480,'2023-05-17 03:35:35','2023-05-17 03:35:35',NULL,NULL,'Wisconsin',NULL,3,162),(481,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,1,163),(482,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,2,163),(483,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ohio',NULL,3,163),(484,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,1,164),(485,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgie',NULL,2,164),(486,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Georgia',NULL,3,164),(487,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,1,165),(488,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,2,165),(489,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Murcia',NULL,3,165),(490,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,1,166),(491,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,2,166),(492,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oklahoma',NULL,3,166),(493,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,1,167),(494,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,2,167),(495,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Genf',NULL,3,167),(496,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,1,168),(497,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,2,168),(498,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'West Virginia',NULL,3,168),(499,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,1,169),(500,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,2,169),(501,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Ontario',NULL,3,169),(502,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,1,170),(503,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,2,170),(504,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oberosterreich',NULL,3,170),(505,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,1,171),(506,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,2,171),(507,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Wyoming',NULL,3,171),(508,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,1,172),(509,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,2,172),(510,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Burgenland',NULL,3,172),(511,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,1,173),(512,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,2,173),(513,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Avila',NULL,3,173),(514,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,1,174),(515,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,2,174),(516,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Oregon',NULL,3,174),(517,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,1,175),(518,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,2,175),(519,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Salamanca',NULL,3,175),(520,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,1,176),(521,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,2,176),(522,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Glarus',NULL,3,176),(523,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,1,177),(524,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,2,177),(525,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Baleares',NULL,3,177),(526,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,1,178),(527,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,2,178),(528,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Obwalden',NULL,3,178),(529,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,1,179),(530,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,2,179),(531,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Graubnden',NULL,3,179),(532,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,1,180),(533,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,2,180),(534,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Guam',NULL,3,180),(535,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,1,181),(536,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvanie',NULL,2,181),(537,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Pennsylvania',NULL,3,181),(538,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,1,182),(539,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,2,182),(540,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Victoria',NULL,3,182),(541,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,1,183),(542,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,2,183),(543,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Bremen',NULL,3,183),(544,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,1,184),(545,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'√éle-du-Prince-√âdouard',NULL,2,184),(546,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Prince Edward Island',NULL,3,184),(547,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,1,185),(548,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,2,185),(549,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Brandenburg',NULL,3,185),(550,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,1,186),(551,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,2,186),(552,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Hessen',NULL,3,186),(553,'2023-05-17 03:35:36','2023-05-17 03:35:36',NULL,NULL,'Almeria',NULL,1,187),(554,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,2,187),(555,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Almeria',NULL,3,187),(556,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,1,188),(557,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,2,188),(558,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Baden-Wrttemberg',NULL,3,188),(559,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,1,189),(560,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,2,189),(561,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bayern',NULL,3,189),(562,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,1,190),(563,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,2,190),(564,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Navarra',NULL,3,190),(565,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,1,191),(566,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,2,191),(567,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Valencia',NULL,3,191),(568,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,1,192),(569,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,2,192),(570,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Schleswig-Holstein',NULL,3,192),(571,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,1,193),(572,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,2,193),(573,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Andhra Pradesh',NULL,3,193),(574,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,1,194),(575,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,2,194),(576,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Arunachal Pradesh',NULL,3,194),(577,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,1,195),(578,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,2,195),(579,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Assam',NULL,3,195),(580,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,1,196),(581,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,2,196),(582,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Bihar',NULL,3,196),(583,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,1,197),(584,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,2,197),(585,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Chhattisgarh',NULL,3,197),(586,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,1,198),(587,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,2,198),(588,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Goa',NULL,3,198),(589,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,1,199),(590,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,2,199),(591,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Gujarat',NULL,3,199),(592,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,1,200),(593,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,2,200),(594,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Haryana',NULL,3,200),(595,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,1,201),(596,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,2,201),(597,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Himachal Pradesh',NULL,3,201),(598,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,1,202),(599,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,2,202),(600,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Jharkhand',NULL,3,202),(601,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,1,203),(602,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,2,203),(603,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Karnataka',NULL,3,203),(604,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,1,204),(605,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,2,204),(606,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Kerala',NULL,3,204),(607,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,1,205),(608,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,2,205),(609,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Madhya Pradesh',NULL,3,205),(610,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,1,206),(611,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,2,206),(612,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Maharashtra',NULL,3,206),(613,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,1,207),(614,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,2,207),(615,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Manipur',NULL,3,207),(616,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,1,208),(617,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,2,208),(618,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Meghalaya',NULL,3,208),(619,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,1,209),(620,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,2,209),(621,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Mizoram',NULL,3,209),(622,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,1,210),(623,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,2,210),(624,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Nagaland',NULL,3,210),(625,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,1,211),(626,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,2,211),(627,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Odisha',NULL,3,211),(628,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,1,212),(629,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,2,212),(630,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Punjab',NULL,3,212),(631,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,1,213),(632,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,2,213),(633,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Rajasthan',NULL,3,213),(634,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,1,214),(635,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,2,214),(636,'2023-05-17 03:35:37','2023-05-17 03:35:37',NULL,NULL,'Sikkim',NULL,3,214),(637,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,1,215),(638,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,2,215),(639,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tamil Nadu',NULL,3,215),(640,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,1,216),(641,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,2,216),(642,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Telangana',NULL,3,216),(643,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,1,217),(644,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,2,217),(645,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Tripura',NULL,3,217),(646,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,1,218),(647,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,2,218),(648,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'Uttarakhand',NULL,3,218),(649,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,1,219),(650,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,2,219),(651,'2023-05-17 03:35:38','2023-05-17 03:35:38',NULL,NULL,'West Bengal',NULL,3,219);
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
