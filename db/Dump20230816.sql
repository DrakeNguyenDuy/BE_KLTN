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
INSERT INTO `certificate` VALUES ('52fd4139-6ccf-4b70-9f0e-2303e57bccc6','www.404.com/1f','Chứng chỉ đa cấp xuyên lục địaf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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
  `avatar` longblob,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UK1nbk11jltesa5kihmrcai0v7y` (`CUSTOMER_NICK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (150,_binary '\0',NULL,'2023-06-02 06:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nd1long@gmail.com','LONG','M','LONG','nd1long@gmail.com','$2a$10$PZkJvjw3MeS3yPCEpG0N1ev2.vHfV67sYi8UGiQ3NOAQAbnJDvt.u',NULL,NULL,NULL),(200,_binary '\0',NULL,'2023-06-04 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ndlong28@gmail.com','Long',NULL,'Nguyen Duy','ndlong28@gmail.com','$2a$10$vf19FUZolHFtX1V.81FPgOjXauxSDVeBRwH795gTjQ61INyPS4Kn.',NULL,NULL,NULL),(250,_binary '\0',NULL,'2023-06-04 21:56:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n@gmail.com','Long',NULL,'Nguyen Duy','n@gmail.com','$2a$10$8QxgxJwxlNlE/0KbqMMhhef6ftxg4ARMo7yBdoxFdo6ougBta.5wO',NULL,NULL,NULL),(300,_binary '\0',NULL,'2023-06-04 22:03:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADFADFDA','Long',NULL,'Nguyen Duy','FADFADFDA','$2a$10$hrfjwSWQtN8OL2FAKP/gBuOjmryT.BKByi7/qybNUWfr5vVds7jAm',NULL,NULL,NULL),(301,_binary '\0',NULL,'2023-06-04 22:04:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FADCFADFDA','Long',NULL,'Nguyen Duy','FADCFADFDA','$2a$10$8dV/0/dOBfhl2ZvjvXX//.U7kUIz1CCTQjLz2U0zj5pgFwqrBrg1W',NULL,NULL,NULL),(350,_binary '\0',NULL,'2023-06-04 22:29:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','Long',NULL,'Nguyen Duy','11','$2a$10$mVznvJeKC7lbq69pDOuAsekhHbgJ40Wgg6Y9mWoLNAw6wKL.jA1ga',NULL,NULL,NULL),(400,_binary '\0',NULL,'2023-06-05 07:14:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','LONG','M','LONG','2','$2a$10$py5v/xirBlHZFbaD1xYAceFagWlIiTIJV.GIACMH0R1pgUbW1DKuO',NULL,NULL,NULL),(450,_binary '\0',NULL,'2023-06-05 20:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2h','LONG','M','LONG','2h','$2a$10$xzNuMCgmsigbIE5QNqFu3eFpzfcsEH1Ob79.60xXQH0jtIgP/qv9W',NULL,NULL,NULL),(451,_binary '\0',NULL,'2023-06-05 20:33:58',NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-13 00:00:00','19130128@st.hcmuaf.edu.vn','Nguyễn Dũy fcsacasdasd','F','Long fcdvsdvsdv','23h','123',NULL,'0379755079',_binary '�\��\�ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0���\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n		\n\r\r\Z\Z)  )/\'%\'/9339GDG]]}�\�\0C\n		\n\r\r\Z\Z)  )/\'%\'/9339GDG]]}�\�\0�\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0�\�3\�\��ב��[��A+��Џ�*BVk�\Z\�lW^M�\�m�*Uc\�\�u�O[����Cyh&�`(d�$��h\�I$�0\0�d�!\Z�Z�a�!���\�u|\\�\�\�|\�e=/g.\�\�g���\���\0��~S9���n\n��O�\�\��$?H��H\0��N%\�	q$F�F�\0h$0%a{�5ȧ\\�1\�\�\'J\�v���}OK���}�X��\�X!�i$��\�d�i��,�	�D��,��\�e�]=~9ѯ/�g\�\�\�\�\�v�|\�Oe\��rG����\�\�z7\�G��\���\'�M!��Ac*\�j/. �B��I I�0�H@`��\�z��3/�J\�y�r��\�\�:u�\���\�9$e\�	.�\�1\�Ŋ�\�T,��\�YvD\Z$�(��E�\�a���\'��Ç�|\�z��\���s\�_E��\�\�N^EN|\�^\�\\�mW��\���|[�w\�\�>��$I	u\�29�d�@��\"4\0h,`��\\4X\�N\�AWO�M�g��{\�s��xeMU\�\"�.jK6�vMG=���BV�z�\0MlE7L\0 ��	tdS�\��^v3ro\�L=�9�^N�\�~�\���;��_q���\�\��I\�\�z��;�u\�g>7��6Lt!�:�I\"\�V2��m�>�2�\�HA�1�@C\�V\�\n\�	\�\�\�\�\�\rm�>/\�g�\�-�W-f�u\�1eY~[3�b�y�{�Mh#ER\�d\��<�W���5�wda0_�\�v.\�.���\��ݾ\'\�^�<�[ͯ�\�⽕�V�w\�&>we/8�\�<;\�b�`!$�\r\Z�jH�!h�\�A$�r�)�-\\OA\�F��\�꼯��>�9�]U-(��\Z�M!9�)e�\ZI\"�`e�\��\���\���vp��\�\�\�\��L\�b\�[(�z\�\�v\�\���aW�\�ow�\��N��\�r�\�;\�\�+^	A$��V=�ta\�#E*\�DfR4�BI��V�\�x]\�I���o�����\���\���3��h����d,�@�R �\"F�~�:|�\��{-p{�Г\�[\�\�:\\\�\�3\�[յ\��>�i\�ur��x�yOnb�ؾe�\�r5l������`��(�y�Fj\�%J\"���x�,�F�պ�b��\�\�q\�m[���\�\�^���\�~\�\���\�\�/��&\�L����%fe\�v��ef\0\�\\C�8>�6�\�\�\�fk\��;\\\�\���\�\��U[�w�����I����ux�\�t0�>\�\�{�O�\�>k�?�9�C�)�B\"�\0*/Cİ� �\\�AM�s�m˓�\�Bt	|�B�/��*\�\�\�\�\�u��\�=]�R�_�|�\��֣a\�j7���U-N�IH\�3�\�B-Kj\�U�&��Y$+\��ְ�3�˦�g���ӗ\�}\�=ߓL\�\�nz:K\�E\�����\0��\��O\�>jƳ\'\r@\�B@U���)�j\�q|���r	�\�$h\�H#		$.��\����\�S\�\��n�>L�\�\��~\�^k\�\�:fIC,24�\�$@2D�dQ�T\�\�HG�\�p|WC\�g�w��\�jyZ{^9õ\�\�\�N\�\�L\�\�A��\�\��Mc\�\��G��T\�顜;�`Ac)�F\0ے\�\�\nI!!aBB;VÔa��`jǩl�.?��v�\�+�}ţ\�t\�\�����7\�^>ϧ/ɰc?n�3\�o7E�4�2H�\"�FB@\�R�\04\�)��\�\�:�|\�\��8\�\��lv�\�_�:\�[	uNm�_\�=\�z>{�mh����zV\r\�\�\�����V�![+�ˣQ\�!�P��\Z�tH<P5��aQ\�}?�\\�n7Q���<�u\�B�-f\�\���\�}_\�g<_���\�a�{~3\���y9�\r墝F�2e`\nсZ MY=x�\04��<\�\���F}\'[�S\�|\�r��w[.y`\�u�-q��\0ֻr�\�\�\���\��\�2o��s8Lӗ@d ,`($@\�*X��r0B�3_�\�\0�)\rD��,)\rdx�`�\�[�a<�\0�\�/3nk\�\���^o<�S����v/�_�z]溷�3��Eg\�U�7\�Ǥ��\07��[\0\�Z$R\"�4Ac1\\``��\�<9�\\\�<���\�\���\�E��\��\���=/�c�\�wO\\�ů\�u�ȹX\�au<5!��@\�\0�a\Z-w!A#$\��/H +�*G*\�2\r$���\�\�q;\\\�\�=nު\��f{��t\�\����\�\�\��\��M\�e��@�$$�&D�)>Y�?��Z�<��d\�U\�\�ik\�/\�g\�\�9����g��Ȧ\�N\0K9\��uy|�BbHH`�����0d��e�\�G����2���wb�N�79y\�onm<l�ٛ(���_\�]~��&�D���I	$1$��BI	$$�4ݗ/9�w��(G�C\�\�s׏�\�y�t\�\��\��9�e\Z\�\�~P:\�\�ÿ3���R����\�x\��*!.�����al2BI\�\�\�p\�[\�C��da���[T�w��ܷ)z#ݚ\�\�螛\�~\�\�\�\�\�z\�l\�\�\�D\�`996=��oM\��u�_�\�Q뗒nI!\n���\0\"�\�\�3���\�\��Τ־=^�o�G\�>eo%�_�\��\0#:�i\��.\�K\�[r7W\�x����c��2����4E[ϣmb̄�����m��\�*i\�<���\�rp�\�^;)\�-w�\�.\�?�๠�9\�+aos�\��z>��\�Mz\r�kT\�\��\��r��/�\�\��e̴Pɳ\�&���\�Nnw|�\�&�0\��\�y~jh՚�\�tp6��\�㯩\��yS���iߗNy}7��w�v$�\�ɑS\�_\�y�[�H\�!*$��A_7\��5\�dN\�\�:\'J�*�&J����c\�a�! �Hd9ִ�Zc_�M\�\r�\�\�\�e�\�\�\�Yz\\�\�F\�k׶�c�\�\�o�Fy!t\n\�\�כu\�z���}��}\�)\�:\�\�k?\'�?m�y�8\�\�\�_>\�Z\�\�\����J,fKe�}0ӝ�K��\��tPQ>\�\�}\'�\�ry\Z`�0�ZK�\����\�o;|��oC\�ǧ�.\�:��MyJ\�b9L�Ԅ\�\�,����X_cۋ\\�~}�H�`�-�-�Q4h\�,\�,�s��7.m+��һ}�G.\�\��\�\�>�z���ޓn\�~\��&j\�p\�Y\�\�\�|ە�7s�Vjٯ4v�]e��\0:����\�\�Q��\�\�y��[^�$$�BI	!o?n�\�徉�ۏL��k��漟C\�\�\�\�s\�L�)j�	�I��\�#\�-[\Z,$����Z\�\�5\�1zMAb4��vЗ6V��mpNܪv\�u�L�\�N1λ��\�\���~��\�\��N��\�\�s\�\�\����\�9\�\�dT\�V6�T�^	%Z*}O���c\�,�܉C#\Z\Z�jN�(�\�\�\�\�\�\�u�z?5\�<\�>�?�E��UK\�:\�`\�E�5>5Y)ey�	T-��u�Uz�O&e�e\�1���&:��t\��\"�\�;�\�\\!Nk��\���>}i\�w9z\�ʟxAfMcR\�]�A�؊,\Z�e�B��_Ϣ�\Z\�]\�h�\Z\Z\nH0:[�A�\���|\�u\�k�`\�\�\�p;�~z\�S�F{s�׆v\���\�\�\�gr\�ye���� `\n�R��vμk��.\�/.\��삠\�NK��U�-7+)J\�Vۖ\�\�U�\re7Mmَ\�u�\"M%��*�*\�\�5��g](Sк\�myZUso\�z/;��Y\�w����\rqK+��,�`Ay�\\\�ww\�߾^���^^�/?V�v�y����c����\�l�{8g�3\�\�\�ƚ�L�nm%7[?O�9\�����D־�\�6L�O����� yP�$h2\�i��Z�^�\�\�|\�\r�\�\�\�\�\�\����c\�}Y�\�\���P�2�\�\�#_�3~KG�\�\�\�.t\�\��R\�4�xȖ\�\�#EX\�S!!�)��\�U\�X\�\�J\�шv\�y\�\�rt2K\�\�a�1i���ۋ�D��I%�\�ǋG�\�y��\�k=�Q�\�\"[�\�\�Z��15o��J�\���\��6�\'���\�~�\�\�]u\�\�\'ax����\\v�\�e9.t�6�\�&�{3���3Ω\�+�\�\�}$�\�zt��3\�\Z�̭]�A�0�B	!��K0\\�y�~e�\�=�\��\�C}\Z4q\'N�>㞼�cq�J1,�\�hM�W~E\�r�8\�k2u\�;y\�-�\��\�k4J�=qAmVU\�$���\�zўͼ\'�;�|��\�\�󂻍�	\�\�ʉ\�^x�޸E�R�KQ%�\"2\�Q�łI�\�\�>n�@\�\�hC$,hEh7�N�\�\���\�ͦ�7rU�򯟾���ΎY\�.�n7\�\�6;C�b\�5�j٢��_�\�\�\�\����<�\�q{�3&ڻ�\�m6f\�\�;\�K��-\r^�\�Kz3E\�%��Qk \���Z�\�N\�/\nz8���\�˺�\�ڭg8\�h8өɹMY��ՐS\\\�\�R\�\�\�X��\�Z0�� �4 �*\�O[�\�;�/s\��ˎm9g[hҳ�-��\��\�\r\�\�p�uk��ֹlY\�;��\�\�\�ۏ_��ϻ\���y��\���\�\�\��\�Cg�@�S7\�t\�Mf̋ܭx㷜\�5�^u\�\�A^Kf\�\�V\�YbTU\�m�\�[k\�\�1�ۆʙkQ5 VQ>�r\�t饥$���JX�ZPhEu{��\�Y��\�Ҝa\��	�&\�\�)\�:r���\�\�K�.\�є��}\�Vul\�NI~;�|�����Y�>W�]y�/_�\�\�~\��\�\�^�:�\��\�\�>&N�;��\��1׮Z\�\�XWLk�4\�Z\�#0�nj��J��\�\�}w(�r\�WV\�nQ-:\�V�\�+�S葎qU\Z�i$-�CM!���F�\�]�̦\�ܱt9�&yWtj�..�3�:pzܮ�\�\�\�G>ţM;���\�fk\�o4\�\��o/fm�OI\�|2J�F��^z�\�\���\�\�\�V\�N{/\�U\Z\�cj.fk)K�Y�ڵf\�6>nccN�K\nз�gM)sR޶U�e\Z�Y$x�U�їBk�+�[\�>�Lו3ꤠ\�\�#\04z��H!�v��\"�\�r\���=6s\�\��׿e\ZL^_UӃ\�\�t�ӕ����v�������:\�O\��/_>�J��!7L{�_�e\�\�\��|�\���V�wW\Z�4W�g��\�tl�\�N\�L�\�7\\�\�N�jKD�5���H�4��t%\�(r�\�7-\��K\ZI�\\�rz��;:�.\�a&:�63o\�]7�\�&;cE�R,��#\�\��ic�\�\�u\�\��~�\�]���\�8�x6\��v\�ў���~O>\�b�\�\�U�c\��W\�\�+��\�Tu�i5��Sy~��!�2p{�>��\�\�f�v\'>��\�\�\�i�]&n_c��Vm\�Ж�\�2�\���\n\�\�*ͪ�c\�c\�ű.G��~-ܽH�U�\�Q\���\�o����Υ��\\��\�\Z\�Z:\�cQ�$��\Z�]Z\�Ӧ�8]~gI\��\0!\�\�\�\�\�q{�V\�\�7��\�]?A\����Ѧ첻�\0�\����?�\�\�Oq��\�\��3�>����\�#�.\�[��\��5(����\���s�\�\�*2���;�%R����\�r�7c�xvᏬc\�r4\�M)����w\��|�\0C\�����4\�%��Ve~]82�Fh\0L$0��)���\��\�2hq\���WU�~s\�0��:L��\�K\�znF:bt~}Y\�\�$ �\�+�Vͷ]\�\�o1\�\�l��v�I���~\'N)\���dܹi\�\�r`�\�*�z�1Pk�^]�\�\�\�׬\�ï�\�v:so=Kywc\�K�6�\\䫠/>}}4\�<SuVW4��\�2\�gfFܺ��\�\�ۇ5�s�\�`�\�Z�1���0���\�\�|�ϭ\�\��]2z1\�2;\�7��\�\�g{8�\��\�4\�\�Vsl(��2i�|�/k&���Ϙ\�\�ڙ(�\�o5\r�\�\�P\�\�)�A\�~\�X\�\�Y\rUοb\�u83�+}=�m�6�^����\�N�k�\�{5�^�_\n%Х4\�][H\�nk��kMO~\�\�4VR�tt�m!�F��� ��ɢ�\�\�\�\�s\�b\�C\\_㽓5ѯ\�K�\�\�M�<\��\��!K2D�>�\�\�\�=��8p<\�\���|\�\�\�ӟ�oFO6\��g*ti1Q�AD�bu��:�\�S�\�ы^7�=\�ڕ\�o�v\�\r\��p�\�\\Sq0M�\�V\�L\�R��Ufi�&�zfVyb�)Kв�\�2�B���n�\�\�ۂr�%5\�^;\�yTi�\�\�\�\����\�\�}�w���L<��\0�i\�\�\�\�\�Q��G.]�����V~�խz��(R-Vs\�\�NSkQ-k\�\�\�8����]r��Z����k\�?��b\�y\��\�+/��\�sC\\��a\�\�\��̬�`WMԶYZ�i!X$C\\�\�c�\�\�\�r�Ǎ�~�u\����O;\�x\�W��z�\�Nz�B�\"\0\�g��޳�.\�m{s\�r{/�f\�3\�ݻ\�h\�\�O1v����OAO�=\\A&� ǣ_<�9z2u\�\rSp�����K�Ӛ\�\�\�\�\�Ѿ�ntZ�;c�e`\�\�\�\��VK�C�nʎu��g��5琖)B\�Sq�ފ\��%I	�X\��\�\�v:|��\���ޅ\�b���8�Nd֪\�c� �c�0�@�J\�7��\�D\�\��\�\�\���\��\�Į\��\�d4#�P,B��\\$IR��\ZY�2\�\�͹��t�\�V\�z��v\�t�-\�o�_2f��y\�\�\�\�\�\�fQ�Z\�Vi4\�\�p�:�/:쭎M#F���\�\�ᐆJ$@d\�9<^\�ϣ\�\�v�\�\\��B�L���I�\��\�<�4X��s�\�^\��\�\����1���7�\�\�˖�]�K�\�c�,\�V�k63�Ёˬnek�2��\�\��b��5t9�蓕\�\�\�S�����qrhM�?�Z�Ł\�ͤ�K�\�k�!���I!BY]�r��\��\��\0;\�N5:27\�\�\�\�h�O�ԝ<�h<�f�\�T�mK�\�\�w�s���\�\�gO�\�^Z�\�\�\�ks���F�2�-j�6B\�Iv}\n3������3#�4\�YR�5\�\�|m���\�_���\�w\��\�\�ws�_j\�ܹ��\0aKz�\rI	\Z���l\�\�7�r�\��\�r{^i\�\�fՍ,j6K\�\��;-�ٌ\�Ka�h&y�\\���\Zzs^oS�\����7y\�U\�~yN�I�2ޖ\�r�\�!F�f��T\�Z[)t�XIU��S�VE4��%Y:�+\�z�-��\r�;�=.\�Noxnﶫyሁ*\�D\�\�X�$%�\�by�S�s�\�\���\�{_׸\�c\�a\�r;k���gJ�s*�+\rw>�\�:\�\�\��sl�Iƾ`R�7=N�\�^�u�\�sh4\�d\r �\�V\�V�UiUZ��j�X��[\�C[�(���J�3�TD��M|�4\�����\�պ��2�`�HoF�\���\�A#,\�\�\���9pz\�73�\��_5ޭl^w\�wD�S�Q��j\�Ƃty���\��nw��o\�_;\�\�\�p\�\�l\�t\�\�վ�H��\Z��(Ғ\�\�\rU�\Z��Yǡ\�1\�CdsD���W�\�C��h\Z�U��\�N�7��$>�evt\�\�Xh��ь�qZ\�\� ӥ�ˌz�g=>wл^/�\�\����\�G�5�hE�m�R\�U\�\�z[5:?@\�wxx�+��\�G���q[X�5S���L1Mj\�6Z\�\�\�E�$ĩ��j�MrQ\ruvH\�RX\�.(e�\�9j��T6L��厔\�\�Y\��Wefd0�\���E��$I$�IZE�IN�g\Z:\�\�=��e�<+�\�\�\�Y�V\�[ɓ\�p��\�W\�\��qzVUfo����\�r\�R\�\�\\\�������\�\�\�X�5-j,\�da\�\�R�y��*\\=f¨�\�尭�,�\�ʤ�(%7HKrߒ�R}�~�Y��!�Z\�X�HAX�%Au�\�\�\�\�\'f�\��\�|�*�Z\����xWu\�k\�\�s:�\�\"m��\���m������\��>vڃDжSf;kB3J�jE\�׋(�#I\�\�\\ܸ�\�MX\�j�\�\�Waf*\�\�\�ʕ\��d)�C�K/���پ��hH-Eai�Z\�BI\��P\\ɍϧd�\�(��}��\�o\nAU��[R\�x\�kb��\�սIL��\�Ʒ\�\\�\�~��^Xhό�\�_H\�;\�/�EUF\�{\�ʹ\�f\���r֪h\�PYl��Y#\�l-V�F\n\�er�VVZԹEv\�\�-_�\�U�\�쭡1\�P\�td�FHF�J�B��\�9�\�6bc${۫evL��J�`H2�u��zBN�3[N5\�z��7\���\0\�9e�\�\�64����-\�\����SF���b�*r�2XsV\�\�e����Ѧ{��t��\�#X�\�p\ZT�i�ڰi_sevt\�ή9VfHn�u$�\�BH���:32\�͹K���X�D`a��F%Iz�\�.���t\�5kC�]�c[\�\�\�|\�\��\0&\�t���aL�:ɧ#}�Yz8���D��X&VY\\���a�h}eEelՒ\�\�\�2��\�K!�\�H\�BhJ\�\�B/\�\�\��vV�B\Z\�d�dH�$���y�\�2\�MSc\"\�VV��-�� \�\�ҭ�\'M<\nq겾v\�JU~S���\�w\��\n��Vz�%�\�M˕�T��ƈA���Wh�؂�h��bTQmTjҚ�\r���2\0YQ%:+\�VUn���\�\�\�R\�\"j\�\"\�%FXI!$^{�Ri՚\�\��\�\�\�\�U`k\nZk��7g�\�4r��\�f�\�U\�\��d\\�\0+��\��mCs\�&���\�J��j�٤ͩ\�\�N�[�Gd\"@i\�t1�D��l��\�M�nMF���r3�\�ܢF\�\�6\�j�\��e\Z�Z��\�f��\�\�2�H �j\�%�HH`!\0VT��yGj\�hz\\x���XY+�\�d?�\�\�Xg\�EY\�8;s\�\��e��+\�\�	\�s\�\rw��\��f�rh�L�o���\"4K-Ta\�:���\�YSR9�Rf\�Z\�dz�(y�W`�\�7e��=�\�����!\�$�$��-�BI\0$]t\��,�e5���4��k�K�\�\�l�ɭ\�\�p,��ކ]�\"\�\�\�I\�t��\�\r�+[0\�z\�֕��L�\�6Hh�iA5lB\�xS~m1��\�\�I\�\�\�\n$�Y�֙�\�X\"اԳ�^\�\��L\�G�T�)��\�  $Y \rV\�$P�5YCT��#%J�z\rU�\�3h��A\�5\�\�ϧF��\��\�\�\�\�5N|��\�-+՚ѬͰ\�\�֎\�b�\�ԩ�r�U�U������!$\nY@6 ���.��}-���׭\�(őHU��Al E�R�:]���b4\Z\�\�IV�Cuz#L\�УPS\�l\�vw֊ٸ|���Rx\�<VXȰL�\��g:���J,�˥N�5N�\�J�_Z\�\�\�\�\�\�Jl���9Z\�Zڭ\\H�E�8��M�[�\�Gd#��5�IQD$�\")�$��D�	~m�B�n.�u\ZMf�\�˫^{F=�\�X)0yoO\��<�a�Ī\�\�l\�J\�\\z�X5vT%\�V	|kJ�Ҧ�P�Fl�@[\\,5�i��ҋB©+���\\\"z^\�\�h,#&It�KZ,�\n��@	!\\R�0%V\�=�A�\���\�\\|\��\�\�c\�\�8;2\�\�N�	\�?\���\�)���tr\�\�~a��\��/ɨ4kʦ%�\"\�h\\K����Z�:ЅC\�UY�u6#T\�\0�L��W�<�5�\�\�G*\�$�*\�	\"Őee\"26iR\�od5]z)�acAc@z�9\���\�ᴆ�\�圫�~{딲\\>w\�pS�Urg��2�^�C�j��ƳR�4UYr\n\��\�\�\����\Z1XBֲ��PoC4d�J\�+�F�I�\�\�r�V=o@CevIP�lY*$ȧ����\�,)u�E ��A\r���\�\�K�hQ�x}\�:P���\�ai����\�\�k\�\0\���.F/ɥ\�b�c����\\�E�[)k@!j��K��5\�h�\�`���nJ\�\Z>����^�z\�,5\��\�AԐZD�H\n.|v\�=�no�lB�e\"�v5��\��>����\�\�\��\�v]%\�/\��Y�w�X\�\�Y(r\����Y�\�F\�rR+UWʘ�T�y�˒�z&u��#%�4[!	\05�\�K\��\�\0/\0\0\0!1 02A\"3@#BC$4DP�\�\0\0\��\�}�F�7�я���U�\�QX\�6S�tG\0��`��b�5��,�\�!���\���١��\�jb\�Ad�\�|.�\�Q\�Q87��\���\�T׵�͙q�bA�8�N��\��u)�gS{�_\��5�R\�\�#\�\�D�\�y\�Χ��t\ZEOp\�4\'��\rԷ�\��\�\�\�OVOr��꽼��\�׃$M���\�&�8#`�[��h��k�:��\���\�4\�\nj\�E��\�nФ�F\Z�\��Q�\���~���\�\��\'\�1��3�IMjf�6_��B\nv69�6X\��\�5���!�!TM�􆊢tB�aQ���\0\�yU\�\ZJ\�)�WVߊJ�1\�2�;�\�\�h�����\�\�#}�4ʕ\�c\�L+H��\�$���5\�:OM�0[��\�\�ᾥ�h:C�\�\��b\�1�\0h��w�I����$��5$�BM4l��H\�CKW\�(�D��\�\0\Z �k6�\�\0���Y�y\�\�\Z\�U-S�3\�\�:��\�\�\�wk��zاw\�~V]�Y�n5\"4����.j�\��l%\�:::j���b���\rw�\�窆6\�\rM��v�\�i��l��eA=��:�\��YG�Gh�fqN\�\�u~��=k�5G\�\�SB٥�E#�W�<\�\Z\��\\a˗�\�Ȟ\�4�u\�F\�\�QB\�#s\�\rw��-��GY�~y�^\"EP�\�_�z٣�J\��1�_\�\�:eƨ��g0�l�68f3Mj�?��|�\�Ik�\�)�R�Uz���Z�\�[M!Ku#���aG����N\��C�s\�T\�d�\��%Q2U\0T,c�3C]u�	\�:g\��\�ss���\0�\�N٢,���\rk(�Ã\��VMQEL�}DUR���$`\�G��З	?K�~w+j*\'uD�\�\�\�\\\�\���l^	$X�\�\�Ū��칵\�*j!��e@\�C\�\�m�\�L�Φ��U����\0�k�\�3?\�}M����TkN�A\�z*Xi\\�Z>#\�1�MH\Z�3�i\�\�M;(���|ͤ��8}\�D�R�tO��*�k�V~�\�\"ꛊbmy�Ծ�\�w\�H���mS�\�O\��Bڙ\�\�)\�\�\�\�\�F�7�S\�\�N�+�cJ��{]L^\��\"���\�zM%;g�lJi��bL�:\\\�\�8���\�p\�S���\�s\�\�\�Nܒ����sj8->�\��\0I*3�G�\'<����h\�\r	��\nV\�9[;���$\��ӇQ\�KXʓY\\\�Y=�c�{VQcs�\��\0EF\���KuT�s��C3���\rT2q\�~��_Kx#�\�qŒ�9�m}�\�\�Pib���:9H�\�ϛ\�d}\�S��\�i��jY4\�\�Xኩ��y�V�(YO=0\��zX�\��\�\�\\+�f�\��T���Z�\�\�\�\�\�\�M:��|*���7g\�-`UT��\�N!���|25\�\'{�K/��\�$iRJd|�>D\�2I\�k�3�\�x.-�\�jZ\�̵M�z>l��%S.QP\�$�%\�\��49��\�8]��k>M�5��k�F\�/x�����\\l�������\�\"\�jq\"�!#j\�yc24G1�l�Xv:\�g!�u��<&;\�,���D���*Jh��\�Q\�!\0�4[�E��6k\Z\�5�1\�W1�\�f�*�\�ā\�{?Me$m\\gȽ4��\�d�6\r��:���Q!n���QT�\�-@���w\�ڊ\�꛹�Q�V\�\�Òn�\�\�}TN{L\�[���at>�\�p\0~�\�#��\�}L�i�-�\�\�^�\���6\n�M\���oP\�\�\�d6\��Q\�9m,�N�(\�Q\�\�\�$ΐ�Z(\�\Z��E���\�K�\�\�e��!��=\�|Ơ0W>7=��\�5�I��\�Dlx�m�\�\�@\�3\�#������\�5�j\�IW+%�\\��L���\0�\�Q؛\���VS�\�yRC\��X���ߔ�ؽ�ϖZGH\�h�4�\�Ī��\�\�\�v\����kTn��G[2�Ω5q��9نik�\��F턢�\�\��/�\�\�\�é�zz�\n]ke�(\��YX\�V�ꚺH\���pp�.\�&v]R}E��t1\�\�\�\�?��w�D\�b{�E\�t\�\\\\\�\�jʛ�$5Wy����\0?���dtCvSB\�*\�x\�5]R\0l3\�)#\�w�9ʋ�F\�fo\�\�U\��a�a|�!���\0ڮ��\��NAZH\�OI\�dT�0\�E钇������I\n��%�߈\��\�,�l\�\�JWW=�R\�L\�}VN\Z�t\�	%\Z\Z�S\�#�7j8m�J��\0�~\"�f��j�.J\�i��L2��#^X�\�}�\�j\�3:��U\�{r�\�\��Q- �Y�€V\�Sk�Y5�\n�x���} �Q���_\�\�n�	�\�6��V\�d\�i\'\�\�Q1��\�mPz��\�4���o�\�q\��xh��\�\�I/\����\\l\��[�nDW�dlo<\�ꡉ���q_UꥆR\�\"��KEC\�-%+\�\��\���Jo\����1j>\�a�\�\�\�К\�9�~��RS\�9Q9����S�C@\�G�PTG5\r��Z\�\�&ᰨ���fefYM\�c\\\"�}���Ҷv\�+\�\�n\��Q��l\�U]��\�\';\��\�^Meo�G\�\�a����\�\r�9#BG��(\��TJl\�o ��>����\�P�\�\\\�\�\"\�43�\�/\�5$���\��r\�2\�\�O$\�J�\�_�M\�=\0\0:)�ޛ��\��r�\�M(p4��٬k\��I\�P.u�\�\��Z����F\�w\�=\�5��\Z�<������\�>_��gE9�^d\�4�9� \�x^\�>������\Z\�\�\�q.\Z0�7�\��\r��1d�M����`s\�72\'��f\"�\�\��ǒ(]*���fT\�\�\�\�)E\�\�96ɬֆ�\nWC\�1\�v \��H\�9K��9�\�\��WQNX�\0t�\0�\�D*��\��C#�)\�\�d��U��u4pK+KHN�,��$\�7,\�q*{z�\��)!�W$��\�k\�\rvaE\�>\�W#$�*9���\��ǽ\�}�1��\�\�\�\�4mb�22W_18�M5\�\�qˢy�X\r\��R̷�Jzh$�s����F\�@\��t\�\�۾���\��\�_�ݥ\�\�\'\�ğ�7+tߊi\��\�\�\�S;f\"&�\�\�d䨝��\�h\��\Z\�׸%xpۚW2\�\�\�$�����\�P\Z~`Q\�\�Eŉ\�}>D\�\�F�Ų5���S�O�2�\�#i���H�%�ΖZx�����\�\�:w\�\�,�\'<8h\��\0��h�3R\�\��� 2�A,�|D\�\�eK\�$R6V����j�\�\�\Z\���f%F\�C)�oSaa.*\�.�\�ΡO\��\�\�چ����&\�\�\';6r\�1-K\�\�:\�\�\Z9�\�\�-\�\�\�r\�9q��gr\�Uʿ){�c\�7w;2n�\�.]\�m\�\�\�3(l��&\�1qͯGH\\skt\�cH\�E\�buU�rg����\�-!�㒶Mwɠ\�!��i\�<՚>C#��p\�F\�\�<F\�\\��J;�<A�\�s[�\�(�,��iO\�\�\�m\Z��ArԵ�Z���\�uB\�����\�\':\�\n�\"P**��\�=ˆ\�i]�nf��(�\�\�ܭ�\�m\��X����\�ue����C���\�_wu!UM��\�\�!պ��\���s���\�r\�@(��\�C8Y\�\�W�$-M?/��w���̳Y4\�K�p\�2ݰ��\�*�3%I��\�\�u,�\r�k�7[\�\�\�3�\�$-�,m|%\�\�C�\�g\��>\�ta9�\�#�\�o�\�\�g���-n߉��*\�\�\�!�Nb\r)���\�\�F\�o��0\�\\\"m;b�\�Xm�-\\n##��)9[�й\�+=��:8���5\�#\�K�7�	\�Hrr(\�\\\�\�\�E\�\�Cr�d�Zc!9��\�t\�wY�eg}F�a\�K/j��\�\��4�8y�j��Ɲ!*\Z�\�i\�\�Q��k�	mì��\�&\'\��\06H\�bl2�!��\��>w>V\��e\�q)�\r5\�Q\��ʣ��\��tJ-n\�\�\�.\"�(�\�Qkb\�m��\�SX&�%n�\Z��Wb\�CPj:\"SJ/C*�8�#r�Nu\�.�\�e�G\�lR\�=IP\�\�m�or�\�]P��\�)\�\�\�G5[^F|\\\�\�$�Ď�\�£�49���Ćf�\��8D\�\��\���`\�wv�����B�\rOLj�ʸ�C\n6B\�\�ӣ�\\1!�\\�qM*C`SAqc\�I\�/ \��3\'jO#��F\��\�\�\�\�\�0���D���ʡ6@\�(����\0\� �\r9&�B�\�\�gk�\�\�DU�\�Y.�`��̭�mk�\��p\�\�ń�\�?\�嘔tY�\��l���3\"\�\��M\�ջq�M:��\�>\�^.\�\�\�j�\�r/t�����]e)�ʳ��X�nU\�\�\\,��U\��\rU�n�HN\�>2Wɉ�W\�|l���2\�-�Z�\�\�\�.��FBKP��j�UK\�\�\�\�2�\�j:�C\�Z\��G#���bq�Te�+s]�W�DVm`S��g\�(���eZwT:�t<�۫+�/��\�\�\�\�1��(�Z�l\�\��\0�nϓZ.ѡ���C�\�klc\�0���.\�\��}9�A^\�\�\�jj�Yn.�\"GXf\�ڜ#`	\�8e<eQ\�	\�\"\�\�3At3D?�\�\"*\�rsS��֏��{\�S��\���Blm2V42�\����0\rV\�\�\�|G!\�j�\"W��\n%����ӛeed\"�\�RԹ6��\�������\�C\�\�G\�Z\�\�O�#A_��P��(\r��#�Q\�\�-pp\\RP�>�o\�`!\�F\�5<X�AE�]�u�@SFc�3ЌlN�\��㔠Ǯ�M��ɴ��\�J�P�C2_��/i��/iN�MN\n\Z��tJ;\�fY�e�fY�e�ev\�ꐆ6G\�t\�B2iĻF�V�Ď��\�E\�|�\�El\�b�j\�PG�-\�\�[F�\��*\�RL\'�\�!|U\�̳,ȹ<\�\�\\\�\�E\�2ϣ^�k�WH��θ�H����/�`���9W�I�)h\����X���F\�R4����R,�t�@\'vV� \rp\�\�M\�.%n�sQ18!�w7_%���#��qSe\�J��ȸ�:M8���l�Y�r\�6$�\� �	�0}\�@��+{���e�\��kݺ\�K��.\���<�%\�O\�\�7g�|�ޤ\�Ǳ�VtB?FU6�{{ ӹX�\�\�\��̳,ɯ\�͠�\��\�g���~3,\�[\�\0�\�B�\�{�nj&(\�1\\Yg+��\�#\�\�\�)\�D\�\�\�gI;&\�;E�:�\�{\��C	�8�NV�:\�H\\\�\�t���\�jRۜ�*\�0���\\\��/�\�\��*\�X�+~��\���1�;X�}�\0iv:�\�)��{۵Oo8A*-�b\�,�\�/$��[Ul\�WY���\�2�\�|��Uee�eL�2s[{&��f�\�\�����Z\�w\����M\�/H9kjG\�����T�M�\��C	]y�!���W�]\\-\�!���Yu\�VB�,�����P�p\�ʲ�4i`�\�VG\�\\;��\�\��^݉�anH�pj\0,̵ے\�;\�]�sw-�v�O\���?�\�����U\�ߔ-ޟGϻ{%\�.q\�\�^4M*�\0�,P+�\�Y\�z\�u��V�]h�VV5��S�,m� �\ZJ�\�\�H\����\�YM\�\�\���\\Fe9J\�qB/�̳��߄`ߥݰl͢�\�Տ�P}C�=**b\���\�\�\��͡��q�׸�^\�\"ؤ�72\�\��J���h9b̅8!З7��|m\�	\�C\�;��l�.%��q\�\\y\�e�B����*��!Y[V\�߈n�\�;@�{�55Nk�!\��\0��\0\�P�ݿO8ƥ\�5s�\�ع\n\�\0W� \�Ŕq�{8���Z��̝�]\�\�VE��,�5�*�\��\�\��~_)�\"�\��\0�Gx?8��\�\��Q�G���G$�4�\'muձ(w\�QNN\n\�-�_\�\�y8y���kans�\n����K���˷���ų��9Z�|�?;�ʀVf�p�4MM�k\�9\n)\�h��\�`�An\�K+++/6V\�\�\�\�!G\0u\�?�\��;\��\�h\�~ó�`\�.\�΅C�1#e#�^�9�[PS��2\��\�`���\�:\�P��\�Q{�Έrȸk*\�C�+k\��m|򝖊\�u�_~�|�\�vF��\��?\�\�.��\�4��\�f!]\�y\�\�\�\�\�cە�k���7(����*ʈ�\�����m\�\�\�ks�����+#��#����� ~!;\�=���tmO<�\0J�,Q�\�\�34�9;�6\�89�w\�\�\�MG|J%];V;�n\�\�r��\�~���~����>\�w3����\�3\\]\�s \�<\���G�\���$\�\�@�\�3�\�b\�み��\��#��n���w\�O\���}2v\�5�VI\�\�\�5�Da��#\�G��������:���\�{\��[\�\�p��\�)\�ɔ!.\�1�rv�\0�ߒ\��\n��=b�X]\��\�}N�i�&\�j�ۥuT\�CZ\Z#�\��\�d-�\����[�!\�\�*W%������3un�\��\0�m�\�R�A\�\��.�\���-.\�n;*�zW�:�\�$S.G\��\0mۜ\�*oՉM\�ͅ\�pF@�\�\�MvTN\�J\�E\�\���m��\�m\����A����\�ƆM\�P�\�3s2\�t���Lk�Dy=\�\�f\�\�r\��Q��Ȼ\�\�rs\�γ,\�\�yY��\�\�䲕��\Z�,���D\\lz~��ʝE��\0}tVh��IgCV��\0)�D����N��15�\�\��\�\�\�׵���0�s\n�L^\�\�yY�)�\�eMK�\�8�\"�S]�*����ʲ,���\��Gߐ`\�����d\�;���ڟv}�_u��d&��F���\�(E�ЅĕJg��R�\��\� θH��T\�qB6�,�*�DYG��\�c��n�E\�U�eV*\�U���\Z,�fr\�\�Lܧ~���ms~�\��}*�G\��\0�Gl[Ǭ~�3�.��\0%�7Z���|/elɱ�\��\�=�\�j.�f@\�\�F6,��I4s�/t\�<\\\�\� VZ�+llVW,�X��Y�\���vqm�\�t�g��7l}\�}N\�\�#c�|��%�h��V�)E�|�:a|\Z\�@j�*k#�\�e&\�jk�Lveeee�d%�ʬ���\�\�\�*ʲr���\\v\�&\���\0ֳ\�?k~\���\�gt[;��\�w���\�#\�\�`��0-+Q`F4\������F\�.�b�[)Mݔ\�Қp�\n-֘h�VVV\�\�yOX\�ؘ@�ɻ�z��]�>\���?X\�y;�4\��;\�r�\��\��`���\�7U�,�:4\Z�v�K����M\�\�E�F�\�r�\�\�D\�f�̉ 	p�5f\n\�\�r\��\�4�wvT\�\��\��\�o���ɻ�4#�){\�\�\��/�*�[\�sn�a�\�\�K\�G:\�\�\�uŠ-T%�\�N�+�\�:\���<��+�\';*\�<�!Y���~@��w\�6�;�-�\������/�~��\0\�^\�o3򻌌\�K�H�\�\n\��.8N�6qn3T���\�Z\�|l�\�5FЈV\�Ȭ\�Y��\\\�,\�B\�D\�9��Ni\�\�󎳅��X�C\��\�ٝ�w\��T��h��R��z�՗ɧ��\�M�\�\'N�.4�\�\�+��\�(��\��i��aY��+(YB\�\�b���\n�\�#Y.�en\'�$���Z\���~�v�x�e\�guOwF�Z*r�\��V�\\pq%YC�ٺ��А�\�E�\n\�*pBֿ%\�%E����&��\�O�K�����\�\�훹���\�f�QU]�\�tA�Y�֘讵YU��ՕYYYeV\�,\�\�\�96D\n\�\�b�G@\n:!%�s\�(�\�w\�*>\�;��?\�/\�d�\��\�{g\�omWF!�Eu/s�WՙS\\U\�VVZ-��\�����eYV\\r��ce�jJk\�\�j.z%�-*\�YS���s;�0�\�M鷇j���oڙTn;*{zb�\�\'~[�\�\�\"\�P�\�Y�ʭek�p�,\�6:,�Xa�ʭlJ�F�\�\�((M|(\�$\�\�G3��]�o�wU}\�\�lP���*S{&�ѽ���=�<$�\Z�O�(�~K�U�Ӕ�Z\n����\�!f!��\�J��YQ1^G�7U�\�;u����{��k>\��/��,��S6v�rtTᄟkUs�*��<rY[�\��e*\�.\�\�~W��-�d�tl�:\�l���_C����un�\�o��\�S�[��\�\�\�*, Y\Z��R7,?\��*��,]p�.@�p��5\� �U\�퍂ʲ�hG\� \�א�!�]|\r\�W�Y�\�\�>���\�4�ٿ�~u��\�΄B\�\�\�ٕO\��\�a{+�0�̳\"p\�j�C�\�fY\�\�[�\�0\Z&95��~O՟\�\�\�\�ɽ\�0_��v\�ܡ\�\�\�b~\�,\��\"r�\�\�p�i�4\�P\�e�\�+em,�WvY����5\�od\�\�fMr̢~��A��\�/>k~��\��	=��\���\���m\0��m�\�\�b�`U�\r\�\�X&�\���\�\\,\�,ؕu|,\�2k��A���\�T/\r�;�/P��ɣ��R�\�\��5Z���fG�\�Ȅ6�-�tZ-\�����j�(w?��\�V�\�mbLN���c\�kѣ\Z\�\�\�lq�\0\�et��lWW\'\0�[`J͈Ef\�[�7W\�\��W\�6�����z��D�?�sel��dR�\�\�\0tiG\�l͊�*�:+\�Y5��u���N\0��*\�\"M�\�\0���\\\0E�E� Yl\�=Q\�\�Z\�ee�H�\ZȲ�+cnH������9z��l�����h����\�Ef@��^B��[�,\�\�_�\�d�~�8����\�\�\�3#y2�l\�{pwc6f\�W\�5\�Ur���:%];s�;}m�Y�\�_\rV\�\�V�\'\�e}1�yĪ~\�\�\�:�\�9\\B�%�f�0�Svf\�z�kfզ\�\�\\�#d�U��\�+t-mpW\�D\�\�^M�\�aeee�fԡ�\n����(�\�g!	єY2��\�\�]lf��h\�\0�W\�\��\"\�0�����i\�\�k��p8n�����\r&\�6���\0Wr�\�fW���1e.��ܰ�\�?ԙ���}\0+�\�t\�\�BA�h�F\��WAb\Z\�\n\�Z\�\�+�VP�lF\�VQr\�m�D/����\�\�ߖ\�|��HF�\��&lEǨ7�\0=�Ͳ�\\�bծ^7W(\�0�^vY�d�P(8]n��\�6���:a�]n\r\�\�e���l�s�k{[#�6Mr��� 凷\Z��\�67U�&�\�E\�㥕�\�\�\�˨j�N\�^\�\�\��p\�\�E�6V�i�\�]Z\��r�\rׇ�\�;\Z�qG\�\�\�[�t\�F#�\n�\�͕I��\�\�^Q�\�\�܎�A\�tw-\�-7A|�{���n�WWe�ʲ�,�\�n\�\�\�l���Y[�\�\�6ƣl�#�\�Z\�\r�t{�#lm��\Z�j��\�f�\�r�	\�!��\�\�L.��WW�\�97�5��s9�6VV��\�\�ʣt͔�����(�9j�L(\�W�\�\�AYm�^<�L!^\�F\�::����\�_\0l�\"�\�n6\rtܑ�%Gؘ�wɛ�\0Da�\'eCD\n*�[*\�a\�\�6[�8�ide���B\�k��^\\s9�\�ג�\�@�\�\�c��\�J�b���(,\�]]��۠��_��@sz>yaے�5:�\r�\��\�\�\�4���`\n(/*�Y[�<�\�\�+s9�\0+\�#d@��@r\�(�9&��\�\�&\�Q�\�\�\�e�d\�\�QW]\�e�;r\�l1��^\0\�1co\�R.95Z��t�V\n�i�{qj{��L\�!\rh�Cwu\��r\�ؖ�7NndZ���h���\�ee�;�Y�\�0*��\"B�\�P:.\���9���3�\�X?��ܫtN!j����\"�ے�\�\�\�\��4�B\�\�9/��\��\����uQ�#��\�ے���C\r�q��0;n�Cs{�l\���\' /�ek�0\���߽�r�܎���\���2�\�\�l���r��NW\'��+�B-V�B\�߽\�sS쟲okڜej��{ -�+d7pM�o�]a|\Z��\��\�|<]���,��6\�\�#@��|tW\n\�A���V�	�oi	�WV\�K\�\n+tt9�����\nڽ�rxVW人�\�\��_\��w~Cu�\�j�\�\�\�\rr�`��,х\r�sv\�\�^Y\�\�\�B�@��\�D��%�N\�\�\�KnNW\�*�\Z\"��ȡ��m�7\�U�n����(ߓ�� ���+Ԭ��u\�l4N@�\�Jr|\��_����+ύ\��\0�Wm\��*\�\�wcٛa\�-�yph��\�9[��ז\�YeVŮʜC���B0�?���S�\�\�5�3a�vv�\��N%�`O#�r�>E\��\Z��VWCUl!k��k�5\�\Z�\�}1v&��<iW��p(�i�^Vd4Cwckae�VV���7� V[r��\�q�F����rU}\rѾY����Tb�\�ɧWrY\�dF\�\�\�k\'t<!�\�*\�;��;~x\��kʖR\�Q\�;\��U��l\�Ue���7[;\�\�C�W\�\�\r�Ӛ\�����Gv���fWW_\�U�\�j�\�ɺ6�e��\�~�\0\�;g]U\�\";����\�%_�\�\�Yl��B\�\�\�=	?+\�o+6\�n�\�\�\�YVvI\�7�c�SIb\�\�\�E���8W�\�]Kik�yA�+Dz6\n\�R~Wn\���F\�9���\0�?}�ٛ%aٺ+�t\�r\0g\�*8�C#W�6^m�����M9@V\�ݟ�\�\�LN�<��\�O5~۹��\�\'vZ\�`,�u\����:��\�\�4\�\�\�_\��\��ޜl\"�F���G\\��\��cY\�\�l͗\�)�\�U���\��M��GC-\�Gr�l�����=��\�Y5AMч��2q~K\�S�ɪ3���\�#���`pa|F\0\�\��Y]\\�\�Z/�\�Q\n\�i�\�\���\�\0*\0\0\0\0\0\0\0 01@!2\"P3#QA`�\�\0?�\�>[\�\�QD�E�_�S\�x��Lԕ�ĽH\Z���,�m����TI�5D_�ZkQ-:(�\�k�\��E�����\�\�V\�\�cx�^_��|\�G��%�\���\�\��\�QCD��!�4\�~�P�啊+)ᯜx�D\�hl�5RK׺:���\�,rgP�^\�ĬJ�O#T���?\�\�[:\��\�	����\�Cm��y���h_\�Λ%��\�!����\��\�\������ءD��M�Z^�Ą˼uĴK���G�VFCi\�\�\'�\�K\�C\�1�j�\0�\�>=5�b<��\�1LqH�#�JJc(���Oǫ��#�2����O\�j�?��<�T��\n���6�Vk(LL�\�,�\�)��N��\�|\�2�ͱ�\�or��T&�IZ\�l\�b��/)\�K\rX\�bt7�\�O\��_��\��Du\�Y��Ȥ^S�\���$G\��d\�52\�\�\�bw\�/+\�\�\�12ǽ}�;hՍ��Bb|_��R�#|(�\�ڐ𷳾Ӧw\�J�\�\�,B\�*�\0�,\'H���$1y%煏NzzDX��\�G�5\�BX����t��(\�X\\Ji�\ZL\�ޏ\�\�\�EK�eQEV\�GR:�԰�:�ؿ�B -�/�ل\�n҃��]s��Gy\�\�\�\�;�\�gQ|��\�D\�t|��V�\��V\�:��GI\�ΖQ[\��\�$�\� /�\�y�\�}\'l읹Nl\�\�\�3�\�\�=:F�U(�\�)�t�Ƅ�+\���y&\"��5��\�\��zj/\�\�CHh��5W\�#M~(��(���Q�#��\�\�\���\0dȋn��z���4\�t����X\�~I���%�D��(���$�/����51?��\�k\�\�m�4\��L�EQ$5�)�\��(��QD�ɨR?�%\���.	\�#\�f��$ۣKMi��P�kE~��\0�c%%SVf�n\�jJ�\��h\�o\��cƖ�J\�Ʃ��S����y}&�Z�4�:1\�\Z�\�<%��X^�\�h�-v\'k\Z���\�h�u\"Z�wj&��D�Yv9�~C��I��l\�!蝧���\��i\�xm���\�,�𼚳UHlL�/u��\�B\�4��K\��,�RV\�Ɯ�#����\�\�^J[\"Ȼ\�e\�(xD|\�d�\�г�\�Gp\�;�q�\�7{\"�E4Z|P\�XB#\�c$/#�m��V\��|��(�\�\�\�\��S,�ˁ�(E�^�\�&Ye�Bط/>�xO�Y\\ֱ>9ep,>k\�[\�\�,��m��Io����b^\�\�/�{%\�\�J\�Ep,K���b\�J��%\�{�+b��%\�\�K����v\\v_\�_\�X�\0X�RLi/�k�k�k�J\���\��\�\0$\0\0\0\0\0\0\0\0\0 @01P!\"2B�\�\0?\�Z.\�d\�I$\�E�\"\�VI$�I$�>\�-�\�]�g�\�\"�@�ǂ#䮹\�z\�p�>J��O\�BI\�U\'\���G�\�zb\�\�;\"m|w\�VK\�AOt�T	��\���2��\�\�\�B{\�Sw�\�*\�Vb\�\�wh����\�V���x\"\�P&�Š��\�R\�����ȝ�Rwb\�0e:\\N,C\��\0���b�ꓑ\�v}	�\0�u4C \�\"�i\�>�*\'\�I$�I$�!�Q�\�\��!\n�.�$AF�\�\�ƕ\�r�NG$L�I:O7o\r\�\�M\�\��~ZI\�I\�y\�j\\\�K�rd�Id�\'�7�I$�I$�&I$\�e4�pv�\�ŉo\��ѿ\�I$�I$�kЈD$�BI$�2J��I$����V���\�UM�<�\�?e~�BM��W�\�I-��r;x\�&4�*�W실xĚ*R�>�4�	\�x�v�OV�Ŋ�\�4���	%i$�P\�m�KB�P��∼vR��#J�U��ԕ�x\�\�b�\0nװǍ\�7��U�\�\�\�\�r$X2D�\�>1���M�c�bs���uIȒI�U;4�W�4*�Oa�z\�N�\�:\�\�a\Z*�\�Vvv]q��\��\�0F3�M��\�\�+;=���\�U\�\�;y>[�WL]گ��\���Yb�\��ŋ\�x-7��\�\�Y=�ڲd����\�z+s�\�\0?\0\0\0\0!1 \"02AQaq@Pr��#3Bb��R��s�\�\��C`����\�\0\0?�\�Ht����:zc7\�v�\�Yas�\�]�\��Nt�\�TK�!,���qN\r�r�83�J\�[�\����uf�����\r6��ҋ�W\�\�\�AT\�5����Ʊ�eK�\�I�ϩ�j�b\�\0j�<\�[Ȉui\�Sߛ�D�\�x\�kD\�e g+2�@f�=�O�!�\0\�	��\0����O\��)\"d�Yd�TXW�`�_���\�pg0��[u�2�t\�\�8đ�9��\�[A\�8��^1o\�UEan\�\�\�\�0�$\�߲o\�\�\n{`4���NUuE\��S�t\�]_�1��\�8נB98�)Кs9��\�\0B\�\��)\��6��R�*\"���<ћ�\�<~�*�C�x��\�<��\�6�\�\�[\�\n\�4�\��C�\0*�\�2\�nF!\�t�TW�O�+w\����x-�b���#X�U�4\�\�Z���mGd��y�E4�>rU�\��Oh}xw�N�n�PO\�i��\�O�\r�\r�\�jM�\'�	\��t\�Ě\'���77�|�de5FjK�\0�N�gJ`�D�Υ�Od�\�8,����qx/2P\�Ngq>$Y�<�.\��M	4M5\�Cq\�q�-?\�a\�`�ǝ|��\��\�l\"nٻ���~#�OD!�HqP���_�\�d=PH\�\��\���!34��Thp�)K\�	�\�\�\\\�@> \r���e97���|\�	\�u\�0�f��\0ܞ\��M$xV�j\�?E8�\��\0(\';Z]/n>l(�FYI78%\�\�I\�\�\�?\�\�6 m\�!>I\�p�\�\��\�Vn)\�\'5E�#�䳘E��l8/���\�2\�F$v�7�I9\�L�����.j;\�N\�m\�6	ɗj��r`��\�L\�\�)�\Z\��9�\�엿\�>.��d�\�6RFe�v� \�i$\�������j���)n�m�\�\��A�QWpTW\�_��|�\0.T\n|L�kr�q6Eϯ�TX�d�\�\�8�r=\�cC�\�B~f˚/c*g4�\�\�\�?\�\�T\�\����Ns\�?H�-k�ۮ���\�\�W�O�\�֙ꀇ�x�\Z Fn�a�\�Y�]����\�ڍ>���5:!Rw�68�\'\�u\�C[��O`-oOGv.�8@\��ʣ��-l9�R\��y��0�\�Ky?\����cy�=�׳B�^�sS\�E,ݵWy\"�s\�D|\\�\�	�$\�J�\�jo\�\r�e��&\�AWwB#\�9IJA�xL�l�\�2�������\�C�0<\�H\r�I\��|\�\�9\�\�d�ܼ\"	{Cg\�\\j�ͬ\�2�U<�f\� *\r\�ES!\�+l\�\�9�L\�k^+\�uo:(\�\�yj�\�iІ\�jJ\����\Z\�k�6�\�8��\��{d�Cb\�zK�o\�7�\���--!ex\�k�\�}\�\'ʅӺ��\Z��o��|Q\�\Z_\�\��\�Z��$�K(L�Vc�\�A��\n��,̦>\�\�+$/\�D>\�\�\�uMy\rX\�x\�6�:oIK&zܣ\�\�\��o\�(��*Y\�Qd\'\�\�l\��?+�Ef`_�V;[�Aҗ���\���!\�B\��\�\�(\r�y&};\��\�N��\'�U\�f\�\�\\tZ��\�@X�e~U9�3k\�g��\0\�:���sɜ\�*�\��%x�\0�\ZXw̬��C�h��\��FBn4\�\�\'*�\��B��5��4�\�\�\�\�)�\�1ᲈ\�\��@É)\�39\"�2��\�坫t\�N�\�/\�0\�O\�B1p�5�O�w͇$\�pS\�z\�\�^F\'\�p@���)�Y\�e\�A\�-)j\�3\�\�\�ӅVF�\�_�ޝa�Nb>\��,�\�uP^ƽ\n~GKZ��W��\�.h\�98ˢy1,.�>�q�(�$ʲA\�9�\�ܡ5��7�Vc�.k��\0 So�勲\�9�kY��sI\�*�L�\�0���\���eQ$Z(y�L&�\��U�5S�?�\�ΰ�k\��M(�W�~)\�u]F�:\r\�SNyt\�\���\�I\�\��l�8p�)\'qQX��5՚s\�$\�?µx�HξpU]����+�]9J4-\�JM~g8�Z\�h�A\��\�\�TM	[\�\�6TיꎨN�\Z%:t�/�\�ħ}4 \Z2Ȟ��{Frt%4\�;\�L\�MD\'$\�\�},6�e�SC\�\�\�c� �,7sl��)��Qa�@}\�����^TMkY���h�F�y�G�gI�3\�j��Y\�\�j�/O5�FR.3j\�\r���-x�3F�\�F�\0\"��\�=K�\�_��\�\�\ZȘ{����\\�Ӝ�\'�^iM5���M~�J\�6\�h\'1\�I�|�\�g�AU4��O{����9�\�Ӑ���\�4\��\�\'YD�\r\�G\�Mi��5\�=\�ph�?\��\0��vZ�Q\�)\�\Zϐ@�oQ��Q\�w�lS]\�eϻ%�|�s>*O�9�\�+C�\Zz��\�\�Z��\�4xt�\� �ϊ\r9\�8�◃>�\�C�ĦB�!\���\�B�$\�\�\�<C)���\��;O\���s��̣t\�5��\�T\�L\�{�U5��i\"�y�\��5q.\�\�lI;�\�%Vp\�\���\�\�	�\�\�R\�E\�\�1�H��rFtt�(�|C���N*A\�Qq3\�\�uBq���z&\�ZߍP�&�\�<�_�x\��o�\n�\�yH\��G\��a��74/��\��6�\�T\�I\�A^�7��hQ��W>@q%3.�57\�x�ݙ���P�5\�9�)��ΖF���)߇F\�\�\rQ�\0�\"\\$0t�j${!%&�7\�\���Q\�jo�MV\�ym�\�\�0�.#���;�z�\�\�v����wv�� \�\�\r\'b��\�p�ro�\�Y�|\�9\�\�w+]��\"�\Z��A\�?z���P>H\�8��>�S\\\�ee)\�M��?u\�>���&WpwnKT��̘\�L\�m\\\�>\�\�p�u=y,�QJr��\��\�N�6�I5�q.^#`\�P�*zYC������?+ŖX��F\�\�5�\nmO\�@keGIk�\�\'\�0�\'W�{\�3�2�$��ŭ\�)X\��7(B�[\'C\�W\'k;\"�ͨ��/\�=9�@Be^։Nɐ��t\�\�=�Yg^\�:c�J���H\�\�};��Զ{�+\�!��(MlC �m���\�\�(�SZ\�Gq\�]\�\�|C\�o\�\�%`��К\�|r@��R\�\�9�ךdf.x�\�X�Ŝ���8&�0x�\�c�\�[s\���\�1,\�`�\0\�f2�\�70V�E\�ċW#��\�a<�f�o\�	\��ZO\�V�	�/�]:\�(2��C�U�8	���k�\�\�\�\�Z\�k�&�ix\�l���,��\�pQfAi\Z�\�\�\��\�\�6��m�bpjo\�	e!7;\�\�-X\�[�P�0��4J��,|C]\�I�=������̷E\Z\�r�kD$5A�Jc��L��:ÒY��CY߇\�9��\�3��~U\')�tG/�Lڈxn�;�ʼ\�X��׶.H\�:\�\�9��\�8u\n�����Ni�\0)\�_7$\�\�Fu^Ge\�\"ҲL\�^g^\�Ɇn|\��(�P\�\Z\�\��kX|�ʭ�A\�&8#8��w�ì5\\\r��*6M\�7+$O����ԡ�OD\��BE��B+�t��u��cA���B~@I�?���VXn\�f�\�$\�cR��-\"n��u�3R8Ϛ�d\�\�Â�&�I�*	uLϐ\��rMc��!y%\�p?Ä\�>\�\�ېNk\�&n���(�RD��P\�\�\��>>�\�\�|��QȂ��ͺ���s�:&>S��~��#�)��\Zy\�\�\�Y\�P�!\�rY�L窡2?\�\��\'N�\�w\�Ov�i�b��b�Q�\�K7\�.I�#\�Hzs{`P�r*\�\�e泟��T�$<�\�?\���8r!L��T!m�koMe\'Bw�Y�Dȱ\"��\�o>H��\�����͜3\�5A �\�\�\�Y�\�%d\n�\�W �A�yl\�Y��:\"Bк.j�s\���&\�\�+3\�ۧ9̨��fP\��\���(P�HN�\�|(n�������|��N+\�#<9�-Z7���o���S�Z\�V\�0���U+|}\�?%Gʉ\�{���� 9�);y\rT%�ވ\�fO�(\�o\�Sd\���=[�fkĈ\�-V\�?)!\n�6C3�\nE\�d�\�f\�&{/��\�t��[\� @����#gk�^#D6��=�\�ёeUpt)�~�\�u��x]\�U6\0\�ώ�ӝ��uOL�t3���\��R���p�D\�G�\�jd-TS\�Y6uP!�\\��	�\�5��.���\r\��4U����\�\�ЌR\�\��;/\nH�Ñ,j�\�ʔ��F�C2\�.<B���4���I1�3&[\�ϙ�\�U]\n\�Bni\�\��YL|\�곚���\�!�\�t�\��Bsg#*IIf�a3\"t\��{,�FC�$ypY\Z\�\��N�tΰ?t\�2\�[n@�\�\�p�J���d\Z��M��K�N�8>\����\Z\�9�f\�mj/�i\�\��,\�^�`\�iދuu$f�8[*�*�%W˪�\�\�4\�>�k� \�\�\�\�٤S�(\�jᬄŴ\�\�\�*-`�XN��\�\�6E\�Vs\�F�\�	�h&�̍GU��t�	�ޔ\�sOq��;sN�\�WWWWҪ	\���S���3�2*V��愑s��]Y�d��\�B�^�oᗱ\\\�q�kEE2�\�˺�\�\�*�D�\�S��\�\��t\�?��\�\"7���bv\��\�!dp��f�!�uF��N\r3c� ��F#P \�Ԛ�h�m%\�8\0%�0~�(\�T�]Pw?��i�37	|-X��h��\�L媛JE-m^�.UE9�y��\r\�{\�3\�P\�T*�u�\"NTU\�+�D\�\�, T&�PJ�\�\�\�t�O<t5V`e��>S2��\ZǄ\�uK�E]-Yy�[m]\�\�}�\�U>X�L\�Ln����T\\\�\�5\�3D��\�ncÄ�:\�6������9v5\�\�e\Zwk��j�$5D��\�E#V%�@{�\�(��L�\�i�6�S��)\�`i�\0��p���#��\�UJ�O)4�Q}\�Т���\�SA3.�V\�]�\�8\��\��\�4\�6#1\�\�\�5uЀG뚟�ށ	&\�q�m�T$%+\�6�:!\Z�ۺ�:\�[�B1�\�\�n��j0\�8�϶�U\\/\"p}k�d+�W\�\�V�cM�j\��\�+5\�9md\�e-��\�ڼp\ZSY\�^i\�RښrG\�`ݨ�vSC�ŭ�\�Xg��E���!�4J�*\�UT\�zE_\ZaU��I�7\���`%u\�[\��\�\"\�\�~\�\�_8,\�t�y>)��\r\Z�)�\�D\�\Zlsl\���N\��M\�mEuN�\�YuT�O\�Fjx\�*a\"1�7\�\�\�;m����+Y�T8��\�s��\�h8X�߶\�(jʷZ�u�u\�̧\�_ȝ���p����9Q;\�ZS\��w\�\�l\'�u\�ˑ��\'O�4\��UT>JrRc\��\�UD�1gD\��4ȣ\�fm�,�bd�Hq\\�ի\�\�t)\r\�e�._����K;P�QN��\�*��\���1b|���\�j)��WrY\�wnJlΕ\�P\�L���징n�N_�W\�\0�%��B�V+�\�!�M�-\������\0{�<ј\�v�L��\�oO\nӲ\�B2�ҠTu9NY;�\�(`q( �\�\� �\"����\�\�\�L֘pM�_\���?\n\��hTML[\rU\��G`\�\���QAW\�	\�\�7�Ѫ:\�}]\Z�V\�\�[�\�Ʉ@r\nr蜾��W\�����\�\�:hSz\���\rW�w;���\Z\��n�\�l7\�\�-򷏞&|Pt�G\�v_R\�ΑL?�/�\�D\�j�^2(m>Q\�a<\�\�*�nOnj�\�YK.h�?�\�_\�Fo\�QzE���=�o�m[�m\�\�N֦Aj\�B��˕��#�����\�\�D�)t�\�e\�\�\n㹅Q\�\��[\�\�\'�\Z��.\n\�jj�.\n\�}��]2������\�5�8�/\�\�tp\�M\�\��C�\��r�:�`\�\�\�h\��q��\n�B��\�\�D\�-\�j�h���\�V\�\�\��\�\�o\�~cW\�H\�\��)k!)\���Ÿ�\�\�;�(����\��1�O��d=�2tj\��K�W\�\�\�R�\\T��A\0�I\�u\�P9$d�$d�\�>\�yS\�:i\�\�h\�\��MTc~ˇ\�o�\�+���8����4�A!\�G�G�\�=\��p0\�N\�k�BN#\�qY\�CS�\��M[�� g�-德\�\�:G\�N=�7��TQ���\�C\�Ӊ\�Q\�J\Z\'�\��x�&&�\�~��^\��_(�\�틎�U\�\�_$�:쯢|�|\�\�{�\��kJ�@�A7�S�9t\rZ\�Z�ժ���U��\�w�k\�A���\�_�\���\�y	�;\�6N*\�yT\�\��H\�-Q ��7am��ݶ��\���M?��\�\�}?g\�;�F���\�bv\�[\�A�|�\�\r�M\��䥱>d��S��\�{��\�Q���\��C`\��D��4\\�\�\�#\�\r�P��x}\�(ON�\�s�;ڿ���\�p_P?aN\�t69��\�+p�ÎV\�\��8\r�,\�b	\�9�m#\��\n�\�O_-(�Յ�?r@Ͼ�\�+�\�Ѹ7f0$r\��h�\�7\�(�?ڝ\�B\�l?�\�\�Q1���\�O�\�G\�i\�qѯ�;\�\�E�\�vF��=܂v\�Y	+t�\�q�6�\�\�m/�\�\�f�\�c�ӓ\�\�M\�\�;߃�&���\�Ǧ�\�\�*���\�T��J\�\�\�yq\\Um�$PT\�Y7++yQ�o\�d\�r�\�v�\��\�h\�uT8\rB�\r�n5D��\�M�h�g\�Q_J\�\�_!u2pwV(k\�S�\�Q}\������#�j=�#9W*\�{\�+��\�\n�ƫuS@\"�\"�־h�QA3\�T>齔or��S?\��\0\�8;\�QٰtGwWWVV\�yP\�|B��6�\��A\�u	?��ؠ�\\\�}\�\�:\�\�Q�\�Ⲷ\�\�ʻ��WEz\"��sM\�\�\�[˞ʮ�FH(>�{�]\��\0���s�����ɘq\�Ӻ\���)\'.:J��6eS+h_B\�\�uQ�`\�\�{S\�{�>\�\�\�	�\"���vD��,��\�\�V\�\�\�\�+c�u[\�+�}\�e|l��*�|�Q\��S�a��\0\�(=\��\0\�4��?�\�!�\�\�\0���p�y_��\�LIi^\'�L,�ǆ7WW\�u_\Z7\�oO\�\��\�\��p�\���{\������\�\�\�g�\�q�\�\��w\�]f8�q���\�\\-�eo*\�Q\�\�E�\Z���\�}G�9g�\r\�|\��w\�YY\�S\�\'wQ;��\'ua_\�a܆ɽ�n\rﳿ�\�e9�ګ*�_\�3�?ȧ�Q��\�\��P�`\�p\�0uŝ�\�\�\�\n����\�\n�UQ��\�\�\�\'��(��=�\�OE�\0\�0=�M�\�\�\��\�\�\��G*\�X�I\�t?^U��\�k\�\�3��\�s�~4\n�O=1�8\�U\�ҪU��\�E\�҇d\�h�?߃�!\�b\�\�\�{\Z=\Z�\�\�\��Uɨ/\���wN�9F��wo����WҲ�o\�|**�U֩���dP��13��\�_U\��\Zp�\rذt\�\"�4C\�밯�wl���Q��\��\�\�\�\�hE�<\�z=�>ƕS)Y6��<?\����\"w8	\�E�h�ZgcQ�<��\�=\�N���\�}�C�8&���w8\�\�q\n��|\�W\�?�=�B��\�gb�B�Ca_Qx��\�YB\�Jա�\�ĺhvG��\�ϖ\�\���Ҿuݓ=��Ch\�]\�7&O���l$7�@�\�SA��d1_i�X>\�`_�[A���Љ\�aϙк�5W\�\�cI�?z��n�\n�\�\�\Z\��\�~�\Z�Dmz\�QT+�!%O�\Z�3�\�O\"\���N\�m̂Zy�\�\r��:T\n�H\�|�\�L�+\�Ϧ\�\�E\�V\�۝\�\Zg\�|��8\�`t\rp*�� ��YS\�\�)�=\����\Zl�#N�\�Ѝx�߾\�i\r]�#	!�\nʛi-\�\�\�ft[�uB\'c��\0�)+\�\n��Lm\�>@h\�\�t\�\\F���\�\�Γ\�N�=�S�\�\nlG���\�d4��\���\�g-�\�>F�]\�D����\�\Z\'�ш?q\�g\�ﰺ�(h[�T�rЪ�\�CeD1�4��i�щ\�\�H���8\r�=(h_�\�X_ջ�\"����f�0�\0�{+UO��E���=q��>�\�(��J\�M�-�O><\�~�7\�G\�\�.��\�\�b^@zA�cm\�1���,��<z*a$<��$i\r\"��C��\��8U|��\�>�.zm\�we\�P\�gtp:ck|m�>�\�m]Z\�P>B\Z;c��\\�gM\�O\�t~��\�:tO�4\�\�z>��\�7N<4N\'N��Ѱu	\��\�b\��J=����\�GB\�\�\�[B\��4t\�\�*7��E\�#f6\�ï�KH�gLh\����\0\�\�h:J�!�\�鶮\�yih�td0gt:���\Z0:\'�1�_(<��ƃ~��\�ڛ\��H\�\��P\�q\�;�(Қ\�Ӕ?�� �\�f4\'���p4{\�cE]j�\'bdUS�����aM��\�\0)\0\0\0\0\0!1AQa q��0��@��\�\�P�\�\0\0?!��\��\�\� |\�\�|���C5y|A\�RV\�s7vO�\r��)*�\0�*ƗV_Q�\\�\�)1�$g�v�G�����\�#tرQ���\�T/$2���\�\�\�\rf}M�KMV��YF�X��q\��MC�_x��Z ޅ]\�s^	Q��q�`\�|��p%�F_��)�7\�\��&�%հ8������2:\����v�\�\�\�i E&m\��\�1\�7���n\�h:���qX�\��\�\"�%\�R�2�7nu�\�N⮱\�ؖ@���E!ܯ�a\�MS@Խ\�\r{�b\�a��q7\�/μjS\���˨?\�_\0�@�)�0��P\�b��hj\��q6�_�c6�\0ؕw��\0��\0(\��\Z.\�\�2�\�b���J�\�NKa\�\�k_u�_\n���	A��{�\�yC��?��pQ֢���&�h�CU#/nř\�\�b\�,\Z�F\�?+���\�\�\�K�d�O\Z�|ꦥC�p!�\�.�����Jk�IiQ\�w\�H\�zr�ȟ}��\0\0�Z)�NeG*\�]�\��3xX\�)}\�\�S8�\�s{�^7TK\'�Zd��W�\�%j���\�\�^\�ݣ6\�fW�FǩN\"�c�aY\n\��7.\�3=\n�Q�3��̮���\� |R*�����x<�S\�\�\\6��89!�\�\�UQDwD~��-Qv\�\��*W�\\_�+��U�\�nً�H9\Z�\�[i�\�P�\0����\�L�\�Nh93\�q\�R\�B}\�HFW\�L\�j��j����س�GQud	���\�d(BDb����\�<4\�\��3\�|˨M�\'x��L*��]Jl�q໸/>\��c��8x\�TO�@�\���\�\��~.�ȵP1A�Yb[W���.\�`\�s�؇0+%\nH�]\�py���\�ߨ\�\���:[앮\�ŵUE�\0\�\\\�\�6f\�^H{\�V0g\"�B�<$4[�\�r\�n\��\\�e��R>y3\�1�;�ay!��\rx<\�)C	}\�{��9��@.�D�\�\��pe�\�����\�*\�7�\Zώ\���8\�u(+�!U5\�\�\�`����\0�p�\�a�Tk\�z���g#Y\�Q__YK��Hz\0�~\�_Z\�\�=�*�KF=�\�\�O\'b\�Ze`�1�\�\�G^�\ne� O^L˚�b_���\���%xIP<+�|\�\�%\�B���v�\��\0��oC�n\�\�\Z�v\�R0�>\�\�qb\�� �-\�J�f�\�j\�6\�[\����\�0D�\�&az�qj摂\r�R�m-\�>�|[#\�\��U6{c<\�6*�Z\�\��Ȭ\�\�\0��\'N\�\n�\�H�\�x	�� \Z]@�\r�Z\\��Ԫ���K�ǜ�S\�C�\��W���\r9\�U�1\�t\���3��50+�bŃ_��\\X��xZ�`5\�u-�MkӸ�xh�_�\� g�\�\�n4\�uf�&\�SA�9�\\\n)�hcDs+u^N\��8�_hcJ�L�\�\05\\.���\Z�V�	�2�mJA&���y��8b8Q���7��TO;�?�\�\�<\�yH\�pj*\�n�\�.Wu���\'q\�6��qv���e��4�C\�\�Q�\�\�*y\\s�f\�z�9q-�6�%hQïLoV�؋\�\05U|E�\�4.��w\�\�m{�-�F�\�fA2Cf&H�\��\�\n�d}�\�ʺ�9{e`#H\�3khZ\0�l\�`\�\�\�\�\�	�\�\� \��*�J�\�\�\�y{�~�\�T<W�\�\�E\�(\�\�\r��\"�\n�he\�M2\��%J��7\��ב�[h\"\rn\�+��$���mJE\�F*+w�P�5\�ᴛ�K\�8��\n�	�e�u���Mh������\���j|r��fb\�\��a\�\�E�\�z%7�2�\0\�Z\\��g��ʂ��\����s�J�|�\���8���B�˧z\�r�\�|?\�j�L�\0�㚦\�D��1z\�/Ú���P�\r\�f��\rB�\�\�z��3\�L��`U�o�ix\'\��2\�zT�Eʞ�����/|K\�\�H\�ibrW�\�B�@ӛ0���P\�-\��ź.[��\�D`·E\�I\�«\�s�\�\'\�a�!�:�k�c~��\���Z<�\�M�\�\r\����\\��i���D���*2�\�d��:\�g��\�\�[�����&��pu\�!�\�Y\�+�n��Щ�-\�~�o\�Xw��P�l���w\���5�1��a\�:�\�\��f\r���ڛa35_ㄬ+\�`\�!\���\�ʴh�$�Jx	�xbJ�q��\��7�>?;�\�\�9�Iї�\�\��$\�\re/xb�\�w-\�\�0\�a4��¯\�\n�N���\��i�`-���]�d���\�ai\�	�,ħ\rL@��K�_o���tn�b0\0}\�\��ڻw�!Oo\�C]�`m�\��P�n� \�\�+�D�\Z/q�\"	Q:^j\�\�\�\n�/	|jZ)u����;�I�IS^\�μ:���<�\���x�@�\�\�3�P\�eF&\�8m09\�,��.&y\n���\�\���\�2�\�ǯ/\�\�|�Q���%�a\�6��\�1�\��Y����\�\�\�#�j\��=\�\�v`B�ȶ��|.+(a׸!��![M\�)P\r�&op+B]7DZ�\�s~ؤXj\�\�\��\�ͼ��<V\�P\�dZ�&QfK�:\�>�J\�l\�p����k�!\�\�x�r��OIuG����K�\�\\�3�}�e\�`�0F�O\�%\�\�MC�\�(ƹ)Y\�ܶ�/qٕ!�i�qA1l\��o\�P&c*\'���r��\�\0\�P\�\��2�1]\ZwR��c1\�8�\0�D)ѹc\�IM\nb�\��2��5�\�\�Ʋ�+̵$\��6$���S�\��\��WXC\�%��%\�P( H�Q�����\�\�`\�q^�˰е<`y��X�\�S�>x�\�C�ĸ5��XF��q\�2%�o\'�H�C+\�\r�\��2l��\�Qm\�	:��c�c�l@c��\�Un�{`1�\�ָb�T\�ƌIR���%���w,q��\�\����\�Ean�Q�\�W3\�g�	�M��3n\���<��S�\�t{�X�\�\��\0\�}J�W��\\i-s-f�\�����\�~\�fk���_�%MyHęT	�F�C>U�\�:\"fs\�\������ؒ�\�X�\�E\�R\�\�}K���֡M�\rU�\�Pr��\�\�\�\�\�j�*�^j�\�^�z��:�Ҕ�{/\0\�E�f�\��%\�[CY�(O@c�Ճ\�w\�i{�8�̨W\�5Qm\�;�ʰ\Z�;�R�XU�6�\�b��\rd�\�\nf>c\�\�r�%\�\���Q%_��xbxxA�.�0n�\�^Cf\0��w	P���`TtB���*\�_k2L�FdG[֘��Ū\�a�kV\�\�\��A\0\\�\0#@Gl[�_Bڨ\�٭��V���\�dM��Z\�PƊ\�\Z��|\�\�Ul\�k�\��9�)z�`���\�Z�9�\�Gpdff\�㨷��M��Sp\�Ɗ\�~�oUk�cL�]��Lx�8�\�~k��	q%D���1*Y�O\Z�~HC����\��q��tf\���Zf8�\�ga�FM\�5%\��\���@�\0���\�,zn�0ZX\�MqQj�Sj���U�\�-�f2t�P4�\�hϡZ�ƭ~�\�^�7�\���b.]�1���\�\nPy�\�\�_��e\�\�Ӻ\�Kd�ya�f�A\�o7	�娅m��\���Cj��D���j\�x�\�\'��5,Ǔ\�A�?\"�\�3��\r��D�z�Q5��\�ю��R��Z\Z�����:��̈́i6�\��t3`B\r�\�Xf|��L�n^��}\�}FGL-\�wH���p;Ň�y~\�T��[��L���e)N.b\�\ZF�+\�SG\�\�ʽ\��\�]`C�X/&�\r�\��\�o\�.\�J�r\�u^6>\�G\�D�\�\�\�P\�Ig�\rb0e��\��X1ߕ\��Ot�CT��t梓�j	�n\��ʾ@Id�e\�\n\�	V�e\�F�s2̼�L=%�@\�\r���ls\\�\0*�Y~\�=��CyVɅm�/�b\�Y�\�{\�/���\�|K�+Y\�4���v�\0\�s���t\��[@re�n\n�w���\�pB\�%�2\�\�B��B<\�\�cQ-dv�B\���4\�t\�\�\�B_0�3�	�K�x��5�f��\�`��\���r\�\��0\�\�\"�\�A(��}8�!��=\�0�8l��4ve)\�6\�\�\0Ȁf��6h?��<\�u�˶kb\\%�/\�~k\��\�Z\�\�\�\��\0��|:�V\�\�ya_lWA\�^�a�{\�\�\��\�\�n{v\�p�4�+<f�.è���N\�\�Z�\��e�\�,(Y\0�KaU\�9\�(	k:\Z�\Z�jc\�k��$IP�W+\�x\Z�a�\���\��2\����0̨JmǔV���\n�e�p^-֔���Q\�_+֓��\�#�	{\'\0B>�\nQX��q%�\�\�A��\�E��E\�3	S_|=r�B�o�.\\�r�\\�.,�\�(Ҫ�=���e\��?\�:���\r*�F�sm\�+m؎����5*[ɭ�)N�F�:\�J��h�Y\�5B\Zi.|eP�h1�\��a�ÅI�\�\\\n�\�N\���#\�\�\�yZD��o-:`x�+\��#\�\r\�`\��\�0o���2\�\�ŗ�t|!���\�\�#�\���\��1\�2\�/��^{l�8\�\n\�[��0�\�\�\�y�&�e\�#WH:}\�\���\�*ȥ2S<\�?\�ʕ*T:$Oq�J\�#\��S��\0�u\�%g	��\�*Tɤ-d�v���}\�\�\n\�U��\�\�h�\�a\�kp�i\"wW�2�\�6�qE&,Ѯ^�w�X\��ٵx�\�h�\�>�ȶm\�be�r��R$O)\�|Y�H�`��2\���,��n\�\�*\����!\r*\�3=�y텈-�\�\�\�_\�k��+q.JE�m�j�(a�d|i�\�G\�aA0��\�)v\�\��\�;��.��._��\���`�\�!V��Ru]b\�o[��H.��\�vً&����P\�R[AM%b�F\�N\��\��\�\�5\�\�k\��b�[�\�F�z, ֦�\�9]s��>�6��1\�\n��\������P\"?��yH�9�\��,�ėP|�pe�*:a\�t�L,8�\�1\�uPA\n�J\r�c�\�\�qV\0X�qE\�蔽�!l_�Ww��9�@P��\�1]0�(�;~�W�	cpZ��a\r��1EycR|�\���\�pՏp>�zU�����\�g+�b�x%���X�%\�6�����\�\\>2\�D�r��Œ\�\���M�\����������E�)m�\�:�Xޠ�\�\�h\�\��|F#\�<)3R�lZ<ܿ濆g}7�\Z���0�W\n\�U�\�:\�IP.\�w@C�\��\�D�	V\"�m\�l\�V\�8�­z�\�]��c����[�:aB�K�\�W.,\�9\�T���ח\�|%�z��\�\ZԳ��0|���uYp]�7\���s��l!J<\�\��*\����\��_�Buw\�5\nK,��z�ph\Z 3L\���}V�\�`�L\"�6�\�j,��F.*S\��\0��7|���]̼}G�\��%`i4��0\�\�H�At1QnS*T\�\�;fe+\�\�\�|R%\��ʗ�K�\�<>51^q��\�\�\��\�(\�j\�D\�J�\�K\Z�B1��VO=G\�\�\�%q<\"�Hb�\�o�ٳ`\�Ӏ�4=\�j\�d-�\�\�\�e\�6�RƔ�)\�oy��\���\��`eh�*^�KG\�!\�\��yA\�\��P(<���d\��� �=~�0e\rv�ZDv�H%6�\�z�͂jM�t\�\��\�\�\\�?�D�<$�\'���\�c�<��Y�t�\�z\"�\�a�֖%B�Ze��\�Vԭ7-M�\�u�o���H Yq�T4mM#+|ET QOv|\�\�iK4�B\�4P\�E:0	�<��3CQ�&֪�\0�15O\�\�; \����\�FW1N\��\0\"RK\��ZC[�\�n�,]�\�i\��v�6�4\�bj\n�}\�3��\�����3i�7\nG\0\��\�4\�2��\�,ÕɋG\�x�$�a\�+⒪W��� x>:\�-� \�^1\�]�\��X�g,hG0\�\'zn�	d��\�\�A�e�[���7G�\�\�hk��\�\�\0h��`�\�n]��]*Z]F(9(\��\�l\�mฅL��J.,3��\�a��%�(\�Õj\�B5�CC�.�S�ܘ�r��MOϓ\�`�\�\�S��u]\Z�\�aA`,b\�kX\�܂\�ʓ)\�5`�PB܇)^ aV\n\0�\�{��uS9KT�d7!�\�O�J�큂\���Z\\/�˖KH��뤯��\�*�\�\�`AKFH��e�-r\�*ai@F^\�3P\�\�f�Vě,:+�����VJ\�nⓇ\�\�GD\�᳻\0\"C�M\�$��\��\"\�\�d���	@k��48\�͌+�^l\�\�t\�f�:�!9�d�3m�\�t\��\�YS������	,\\��sY{��Y\�sn�[f9��\"�\0G\�x]϶��p\�,V\�U[��\�\�m׸,�\"K�!�AlJ\�o�%|��x�Y\�_P��sۗ\�G�Kv\�_\Z�R����\�\�\�?Q�.%\�1m�F;��\��\�\��\�U�\�&SGp�lpƘr\�D�S�+A�7T#�TЃQ�/Pӱ��SC\rC�\�T�X_)\�9&%�\�$n��Q6rh_-�\�|�5-}J��\�+&&E��#\�n�a\�\�m�Ǹ\�8^\���\�Ŀ\n pp�n�A�Vc&�+{0��V��*\��#+p�h\"Un\���vAH�+᨟r��~\�ϸ\"F\�V�/�\�ΡhAIwW��\0#��LJ��5�\�Rl�*�K�\"�Z�b��2�V\�\Zh\�\\�tQ\�\�\�t��3\�\�7rl\�;\�y\�@�B\�c7a���\�p\��m]A�XF\�R\�6;\�ɲ��֍mr�giKB(\�t���Z�� \�V\ZA��%j\�C�)�\���\�@{Q\Z\��\�@\�zH\�\�YE�[-\�B�qn)�V��4^ߑ�\��V�[�\�\�w5��4\�3�i���Y�\��\�x���#�6�i��i\��\"a\�uB�\��\���\�E�O+R��r�\"�g�\�\�у�RZK��6슨5\0G�bԐn\�\"���\�q9Ym��*1�U\�\��\\q_I`���\�F\�\�h���r�\�GR�:_��0�\�\�$�\\n\Z����J\�\0\�(\�}	|\���p1\�	P�))�b\�#!x52���n�\�@P��G��\��R�B�ϔ�˸�,\�.�\�\�\�F/(;0\�<3\�\"F,|3\�� @�jR\��\rH#��8�*\r��zƐ�s�[!	]\�\�@Tp(h�%\�\��G�\�\�v�IT1\�\���	`\�LB�GLr�%\\\�\�\�0]�؃&\�o�N/�a\�/\�0\�\�\\�5\�g\Z+�\Z\�\�F�z6\�\\\��\Zߢo��t=\�l���\�1��Y�Y\�ػ�\�x�2\0�\��=:\�\Z����ձ)+�	���\�m*\��\Z}\'ĕ\�W�C\�˾�\��)\�\�\�L\'\���ɕߨ\�+1;A�~A!\�\�\������n6\�荘n\r\�3\�ص� �\�L@\�dV�W�\0*��\�\r\Z\�\\m���$ܣl=�\\w8�\�\\7p\�\�\�\�\�[4�l�\�\�\��+�\�z�p\\���c6�2*9�{!�<�\� һ^b�]\�7��\�\�El��0�k\�CZA\�Y\n\�{_R\�\\�\\\����\�\����\�\�5�!\��~!���1_�Q�\�i{<�W���b{\r\r\�}\�~��ܘc\�6\�\�\"b!��s#P\�.\r\�\���&*��\�L�pe\",��3\�j\����l)�\��N*�@[189��\�1\��LQd7%RJZ\Z�\��\�\�3�pyU\�c%0e����`\�)�\�D-@\�R7\�eE��}�1\�-Lop��i^*:�\n�\�B�\�2ELj;�\r\nٵ8�)\�!/v\�lj-G9`ԫ\�A�(��f�[ʮBI���vk�b;�U\�\�O\�\�%\\O\�H�t\�\�ge�H�ԥ�\�@�\�*�6���*]�Y\�\�N\��B @�*\ZT�Izڲ\0k\nߨ�71D\�i\nJ\�ɡ��\�6مr�x��\�%eHuD\Zf%�\�ch\r��m���E�ٚ�9	q9)��4\�\n��6\�-y\r���\�\�˹\\\�������f�7m��g2\�e/W1\��\�\�P���Pbݩp�R���Z��\�v\�\�.V0\���	_\�\�\���\�\�aEፐ�\�gy��Gw�\�`Q\�?aQJ6�m\�6@� @�%,�H�\�aO \�\0b\r�PFM\�Z5v��%hD*c��2ļ�IE\�!\\ʲ�2�Qw�	�oDN	N�ygf�.UT\��Z�Z\0*]\�0㥆��d/�Sz�W9�\�\�sqoMG�*/`\\rޢڴ\�=��4P\�h\\I\\����W��^*0eg$Y�,�S�!`�\�Cp\rV@\�f]��XRՄ*�\� @�<\�@L\�5�LLV��D\�R\�8��R��Sl3j���\Z%W\�4�aX\"і\\D�\�\"�%;/pe\"̖\�L�)W�\�Z����#\�[Yf�	�s=�ܪ�\�5/!�\�;\�\"jUN�ല/|k\�DB\�\r.��(�\�/��6�W��R�X�\��\�f\�\�E�\"#e\�g-W��i\�P�\�g\�OP�^@sۄ\��\�\�Sᕘ���\��)]\�\�@�{H�n\�#�\\�7��j�w�-\\Q�\��-\����\�\�iE�\�0�>\�([�`!,\�UB �`b�^\�\�\���\r��S��\Z�9\�B��/0*���-\�J\�TǮ^X��\�-,O,}�<�jZgה�§1k\�\�2t#�lJ�hP��Bf�=\�\�dO�aW�� @��YK�[\�*\Z��\"�u����\\v�y\��f\\�e�bU \Zn\�\�\r1xb\�è5\�D\�Qv�\�Y�Ԃh�D�:�1�1L�\"9r�E\�Ɇ\�\',YDB5n\r@��\0uO�low$\r���D9�\�q\�*a\��\�V\'\���q\�JG�W��Yu�_!\�>�b���\��\�E�_b8�$ ^$�\�@䖚��[\�H\�a\�\�._��΍\"Z\�X	<�-�sqn,�7��8�\�q��7\�SH�\�\\Z�8\�pn\�4sr�+\�K�bC�Q6��\�\��G�jɒL9�\�;����������O\�/��`�޾6�˖W\�Ǹ6\����0+��:�p#�U\r\� R\�\r�\�eM�G��[\"l�6�YF8^�l�O\'Q%L\���T<�	d5���	\0r���Q�ģGDX(G�#��z��7��\�p�5�����ǅ\�.X\�\�Q$9�G;	��\�S�\�\�9�;g��\�Տ����J��\rG&�����\n\�ّl3�} ��P�\�3��l�IB�L�̒�\\1�$i�H\�\�t��O���[i\�w\r/�x|W��\0�R�!\���\�djQ\�L\�K\r5��R$\0�Z	�U. |B<$�6G\�X#�\�h�����4jQTf2\�Շ�t�Q3QL��\Z\�\�=\"N&㠥\"\�\���uq�+G>r��\"�>�4�C%Jbܶ\�/40\�0ZP�S�Q�)ÙQ\\8�\�\�\�HْgO),�\�\�$�b;9<<�\0$/\r+\��\Zʁޘ`و�\�\�)\�\�\�]�ፐ�\�UX��\��J�5\�پ	Ww�\Z�zc�7\�5\�g�F�\��b�`%�i�${hq�`@�* @�\�\Z_S5���U��v01��\�<��Nɑ0���~\�K\�<�^|5����\�\rD��v\�R�m�D�\�.�\�%���I^\�\�\�%Slopff7\"\\[�\�\��\�*\�\�\�1RK\�ظ#\\�����Ċ�-G~���\Z\\��\���3�\�\�X�S1\�\��k�r��X�G�\�V*4$\�H���S�(��*R\"�\��\�,�e�Hd!�@� GN3+r��w+\��Bd�\����*dT���\�e\�5\�.�5b& \\��\�\�ޙcEF��4)A���m��5\�\�T���\�P YB�\'�(��([,蔂(��\�W\ro�\���\�\��4K�1a�\\�0g\�F Y��q\�	p]�`�\��%�\�_�j�(��῵Læ7�=\�\�! �GT\�F�\n)%ssY#8\Z�L5lh*��lE��O7!\�XPE\\�H�\r�Lc�p\�\�q2���.�a\�|\�/�\��l^\"˗.,b\��`_��Pb,�U\�#�\'7K\�1\�ʼ�4Eh��0h�\�;ݿR�񆏭����Z\��Ga\�PRc�\���y @�\"EA\�`\��ea�=��/\n\�\"_\rĠ\���i�\�-[)f5(Rʚi�U\� &	��X��\��Q\�E�yc\n�e\�L\��@}�-A���L\���Mv\�jZ��b\�sR�\�n�l�\�4�a��\�e���\"��e�q��?����ȁP�d\�:�~��f^I=�����,\�\�ͱr�m�a�0n���]\� � Z0\�u(\�F\n\�w\���-�nY\�f�д���\�WH vC\�p�\�\�\�@��\��Aɓ*��RD�\�)�븕-^\�T�	O\�\�b\�Q\�p\� T�\�m\"1Yy�IS��YU��A�\�\�\�\�\'\�N>�>�|�<�\�\"�E Zr�\0�\�m:�Vf�.���\�+\�,�\�$�d	�<T��y\�l3\�p\�\�z`\�\���|\'ޖ�\0\�1\�>��!���\� @��Lj%��0\�\rF�e�t]Ñ_w[���1|\��(�\�/<\�\�Yg$B���U�\n�!�^�\\��-`{\�^�� X	2�\�\��S�J\���XP��N���\�1@\�J�J�\r�\�\��FiOY����\�Q\�OdٱS\�k�)\�Uݦ��J��\�2\�\Zp9`�#C��/�K�V�\���=�\'RD�<��\��\nf�\�ǃ�\n�\��,>��G\��\����\�\'7L6\�,�?\� @�� ��e�\�5�\0ګ\�8��C]��8C���P�\0���zn1aˈ���Y3��U\�f�\�+4\�H��HzA�P�\�r�k�R\� ̳ɜ%�\0A\�.B©*�.cj�\��\'\��t2(�\�>�\�E\�\�)�E���\�Hӈ𔰖�f0@T\�W��p%y	L�&��\�l}E�4��a\0�X�����(�`\����?�\�\��b~ؕp @�x�[s��\�c(�Ȯ���Z���9�k.�\�\"v�L\�\�ڑ\�`C�Z�V;GQH\r�\�#\�\��F>�+�\0\�Y��\01n\���\�H�8&Ė}�N\�h�@\�$�HK�Z�@���R�J\�H�D�R�@�$�!�NbUL\Z}ǐ�@�\���\�\Z\�d5֐\�տQS�0��LD6}H\���� B2\�Ī8U\\��d)�C\\c�\�\ZD�%\�\�	\�%H�%\\H�\"@�*�b@\�;=@�*��\�1<7+1+0<$��J�\�x\nc�b�\�GD\�\�\���r�\�7֨h\�G\�˸/o�\�\�c!��\r�B �w\�G\�UF��F�\�85؎�\'\�w!͌Z\�X��Q��؏���&�*\�5�� @�0�*���DG��%@�P\�^��(�%J�\Z�\�>5*W�|UC\n���vC3Ԣ%H\�\�;�\03bB\�rh�`����� B�\0\�b(@��e\�RU�oR\�\�\Z\�Y�-B\�����Y\�\rb\�\��lWK��1��\�Do��no���G\����\� �\n$H\"D�*\'\�~0\�1\�+�`D\�c�K�o%�����\�%h\r@�W�nV&u\�1~���[z2�yA\�\��`���D\�\��	������Hi{ @��(��\�Ǣ{�\�Ċ\�6En\�%d��	P�\0�D\�X\Zf��:�r)[9�h\��\�Q1道�\�\0V��ʉH\�D��U��Z0\�p/5H\�$I�m#Gf\�Yx��3\�%J��Hfź�\�t�]����\�v\�CM\�?S\�Lå���:��\n�� T	P @�\�L25\0E���K�\�@�!��\�\"���\�\�oQ\� \�z�$bD�K�j߆�\�\�H�TH�\"D\�0��\��c\�\�Q<*�\�\n\�\�G\�\�\nJ�i��\�J�<Ԩ>i+GE\�YCa�!�dSn�E���F\Z>�Df]A�:~\�\nH�S�B,4\ZY\Z���\�\�a���J�s2d^��\�̓\�c�\"D� CPs\�\"n�c\�J�+R�D�Zʂ\�]L5e��E\�$ҍ\���׈x�\�\�AҊ}\�+	xÏd�\�+�D�\�BWŁh@���E\�\��(w��n��\��\�?d��\���Pӎ�\��0\�\�x!E�E�4��~\�\�\�&.���j�\�\��2n��\�~�\�\�\�H�\"D��r�kr�q\"J\�H��PT8�\�n�\0U��\�\�5ˮ�.�\�\�\\V�\�Qa\��}\�K�\�$��;��7��w{����\'Q�\��O\�\�\�ߨ*pF��\"�\�/l~�ep�ybŏ\�q���\�\��y�4\�k\�\�\�=�9�Z\�,Y��\�\�^\�,ْ��щ\r�\��\�Ⱗ�!��\�@8�%\���c����!\�4\�\�\�O\�{\�T��\�aۋ-��?\�\�\r:I�!�2 �	qcl�e�(#�,Y�9<1t�\���,X\�\"G�\�ǩ�:Po�A\�\�Ej�P+\"�T�\�a��\�/\�1��X�rL6���\�:[��\�-k,S�5.�Ǒ�\�T8H|��\�P<\'�0\�IGL\���\0h@:X��D�$K\�A[z�G�X*/Y�Q����Oe@�v!�	�P\�_X�\'�C��\�\�1bŋQb�\"3\'ܽ�\�h#�T\��%:M8�C;(\�#˦/\�9�QlTE�툻��\���VrA\�fTgs\�DX��l��\�\�)���N+�J�\� T�`]G�`][�!�`L�\��\�\�=#�\n湆�O�!K\�c�\�ܡ#�ՙ�<��Gr\�^JJ�\�\�v2ȈEi\\\�PrC!�\�!�︇�k� \�\��G8A\�ǎ\�9dYXڷ\�\�\�+\��3.0\�\�2p\�-��0rT�\��r�+0�%��U�o\��MLc�J�\�B&\�Q�p��\�\Z\�O����\�5	�k\��\r\�{�\�g���/\��ʧ\�\rV~\�c��\����\�d�\�2\�B ��qFT\�n%�\�\�5�\�9�v\�\�\�f6SP��c��3�\\�\�%T�\Z栐��\�*]�	]9R\���{�X\�\"�wⱣUQ�hA5;��y��lG7X]n�����\0e��i �D@��%T-*�\�F�2�8�8\��\�-q�������B�3��9*��C�`�\�b�\�\rW��ǫ���!��H���\0�B>.\\s�P�l% BT,��-~\�W�\�_r�-�\�Y\�0��\�\�\r\�4\��>بs\�Cڏ���\\EeV̀Jr�� V\�Vj\�\�p��a��r[�ۆ\���\�(`/!I\Z\�D�H\�H|�x�\��\"=�QHBV`/_f̯�~l�x�\�Ol!\�\�0�\��⢫C\�b��c�\�8}C�\�\n��L?��y��\0m�#�_\�\0	\�!#�ǔa��8GL�\�m�\rV���5X�	�\�^��g�\�d�\�w�V,��Z�l�t�2-1W9 ��X�[*e{!z�9��!V�hPy`��#\�U{f~�`]q䟬y\�1\�`t�q���(\�8�!\�P��K�Gư�\�\�\�\�!\�ɰ�٘}�i;�\�~�R�\�?Agn�\0ha��8��\���\���P�1��@�pG_T\�i\�E\����\�F�b?{�G\�>��\�q�\�\�R\�IVy~��J�#�!�\0kR��\\n)�h� ;�\�!f\�L1��Tt\�\� �$ e�e�\�LA��#*�ž��+\�\\Q�|�a������L[�*~�\�.�	�\�+\���A\��2����߾q?s_\��a���ⲛ\�r\�(��j�\�\�A�B�ܨ<\�\nVݱODOW��\"@\�K�\�\�]V~{\�nE`��7j�����+�+�.v�b�Y�\�\�u��\�\�;�A�u\��;�\�\�n�8�4]�\���1z5f\0�J\�\�X\�n[�e�ވ�n�~l�\�j�s���NH @�e|O!�\�(\�m\�`\�,��\�\�?d�F��n\��1ǶA]\��!��~s\���#\�/؈\\ ���\�ӍuQ\\R�nU\�\�l%�\�\�G8;ejbt\�F\��B٩�-���\�\�\�J}J\�8\�2E@\�r��YW\rبFRX�1�	*�ne\�F=H��H\�Ғ\�12Z��\n�2Ŗ\�)�՛섳*L�H�\\N%\��\\kaO��� xn+�G�Ho��\�X�����\����\�QZvC�?L\����:P\����\�����\�\�~�bk�\rK��HׄW�\�t�\�E~X�>\��i�P�w���\�Pߨ!l���\�cAq�4�в�\�\�&\0���G!\Z-Bٶ\�b0o�!�S�����w\r�)�r\�\�\�\�\�U\� �/H�O�j:ͼ\�k*�\�JL.5U\�!B�\"=\�{����\�\"\�C�\�\�0�S��\�%ܨ!�D��\0&\�\�S:`S\�n�\0\�\�Y�\�7P4@�\��\���PTj�+,\�v\�1�\���o\�\�/\��a�A���aB5\�\�Tk\�ث����\�Ӓ\�\�\�]Nq\�v#T7�n\�H\�\�\�*\r`h�=�&s4\Z�ǻ�a���F�>\�R\�	f��bIo6L6J\�3�\rAW��\�%\�vsR�-�Zn���nF\�A�\�D\���\�\�\���Ll������Ǟ%M\�~�\�vد�?�\Z���?PЃ��*��\�c��\0\�0\�\��d��.\�.�P\"Vfq\� �\�#s���\�k@�lo�Bj%Ĩ0+0�	d\�@\�#(%l\�f�\�V9�\'A\�e}F\�*K�c\�\�x:bρ{gZ\"�UA\�७_D��\�$2��\�x�P��\Z���s��\��Gvt��h�Q\�\��!�e\�e\��Gm\�&.*�B�Y�e\�\Z��Z~\�\\�\�\�2\� �!�j\"K\� �\� �\07b4�\"�\�\�\�\�R�j,��\"����#H�Թ��zb\�^~&-AbYvA�-\���l�\�O\�:S3��C�(\0x�|\�qd\�(T��p`\��5\�x\����?�\rz\�40��\��a�ڋi\��Gb��T�@`�n\\�1|0eIɗ^\�h��1�B\'!ua��1\�\�f\"\�	f#\\\�6f�{\"�`Rd\\M� 5\\2\�\�b\�\�/\�}eW\�+6酵.X�Yb5\�7\�v�J\�3\0�遱k�(���P\r�H��wq\Z�\0��A;�j�C\�u�\��I\�pS\����s��G~��!\��!��A��]�\\Yqbŗ׿\'���\�\�+ʦ�e���(T,3����c�dR+QX\��\�F�1��(3�\�\�]\�\�\�h��A�fR\�5\�p\�`1�%���#P1�7Zb��C\Z�Ϛ���f�?-��\�<\�xȼ0�\�7�\r���!\�\�\�\�u:�\�\�G\��CK؏	~�`�����\�#\��઎ˢf^+M���R�\\H��)OvN��÷*O�E^\0�\"�q\�c\"\�/�-Jp\�LMܪ\�WU\0\�2\�b\�bU����/ޥ7�X\"�01/0\\�X\':����\�f<\�\�N�B-\�\�\�(Xu\�>\�,\���#�\���#��9�#��r\Z^\�׻W�?p\���\�A�\0�Aϸ��Q\�\�@�^07Q�(\�8%u\�_�\\\�a\�\�\�1�Y�+K��A�\��\0�EŨ�b\�e:倵]ĸ���d��\�\"\�\�16\�ż\��\�\���\"�U� \�Z\�\�\�\�\Zl�na6N(\�C(%�̬�M�l�\�8P�[�b\'d�����\�\�*fޣ���g�\�M\�\'������\'k����\�\�\��>`�g݈\�bGy�\�c���|���yY]TSI�B\�@\"\�5\�tFM\�2\�Q�V8�r�\�\�\n[�\�\�Aԥ�BRc��Ĭ�q\Zb\�q,���q(�t$\�,�e8j=��l�cz�\�ex�Yaв���L{&��D�K�<\�a�|O.�W�l�\�]?e1ol�\���Qh�?BX^�\0jQ��\�+d�~\�?L\�Q��u�I�\���]N/x\�\"K��nQ=�l���p���)�1kP\'!w\��px\�FV-\��\�_cl��5\0l�4�Hu o,�7�^��\�\Z�Cn�`�\�q�w�\�\�.\��Mx�\� J���\�>`\�\�J�T�\�\����mz�\�\�G��\�	X�\�4b\�\�}	��\�2\�J׵�@X@J�mʉ*}�D�ߪ\���%U��½\�\�\�KT\�yuհ.Y@�\� ��[\�\�F��`7次\�A�ʱ��e,\�Is�����loR�&&�\��\�`���f�s��?\�=��# �\"x\�\��\'\�&�V�`Qb\�u�\0HrLV���K������ƅ��J���G���\�9\�Q\�n��\�@YV0�`D\�@R\�>�&s�4\\Q)��Sh��6�qQ��Y��S4\�6ŬA\�Q\� ^9!�F؊j\"�\�Jt\�j��A�\�3VD�:�PVc����/1\�\rqb�N�\�t��&X@�P<��:�\�t\�7\�\�L+^\�\�o��/\�\�A�9%T6\�k,IR����ˁ\�0m8\�bTI~\��0i�x,57l/�\�b]��\\\�5o0\�cK昣$3Sx\�,J\�pC\�UY\"\�^\�mT] opV�6\�P\�dQ�%]0fsp\�Hf\�%̷6\�QU6a�>\�l\�`�.\�\�q?�Xs\�\"7��&�[�AB:S\�~\�\��}.~���\n\�\�\�\�G/\�$\�x\nc����(K�\�\"hx�&hFf*|�C,��Lh\�(*o	\0}8Hm&��\�\�0Q�:��)���t\�q\�QN7p\� .)�}\�\�ev֥��\�\rb�b>�T(\")0e���[��D[�rh�쇒!�<�3�\�i�ʺ�%�綀���;�3F�c�CE\�1D$�U@�bD�*~\�|][�\�\Zd�UY��5Q�X�#\"���m��G�c\�0[�P�q(�eb�1��N\r2\�(�~+\rź@�3d,�r_Q�ۼ�\�\�@Ҽ�&�\n�1�%�,1̻\�ؖ3l��\�\��b\�ze�E�15킶X0`\�!\��\�\�<%ˋ��\�{�;�-�����P�T%���\nJ�Qys\�\�L��3r�R\�g�qJCdc��\�s\\�C\0�P0W.\�9΢�\�1U�\�]ؘ$��$\\\�E\�Tt@��#\\f�EYYr\�@L\�`\�8�(\�\�]\�\�3fB-Q\�˹k��8Eb̄\�7�ai0d�dK�x<�$<�#\�ʸ���;.����c_\�\�C�F�	C���n�$B%\�\Z@�:�9��#\�Q\�\�������g4qur�#q�KV(\�XW\�[��9P%��I�@r\�W\\�V(�XxqP��a\\U��|@�T�\�E�R1%C$\"�`�[��a��\�`4\�\�\Z�X�\�b\r���b��D�.�x?��4c��QQt�L(^׸�T����\�6�01\\Y&\�\�T�� \�X\'nS/�]\�0FUQ\Ze\�l1�\�&ɺ���lJA\�\�cU\��v@�B� 8X�^��[�f\��ED�@\'2\�\�-�Oi,Ii(\�\��\�l��\�yJ`f�]�\�qx�屋��J\�)��\�0��<\�G�\�\r�5�ʈ0\��(��P\�@�)\�\�\�J���=J=P\"\�$IQ-�\�݃7�M��e\�\n��^u\0f�F:���.��\�7�qU:\�\ZΩa�p�/GU2\�f\0XZ e�\��8*�m#ku��`6\�l�S�H]1�P`��p2�W�\n\��[� f��� \�u�\��\"\r�D֡j\�|�z\"TEV�\�(k�8%x8\�i�\\\�Ȇ\�@!��q�N*\� \��\�d\����\�0�KڤJ\�$}\�>YQ�c��j$ρ~�2\�b�F�n:\�\r\�\�W������\�/#)\���@:��\�@qr�(HT\\7��Z-��b�\�\�.�5j�Bo���\�\n��[�6ab\�7�&Jc�\�D��#���\�.\�\np�\��s{\�\�0tř��/r\�hA�@����L]���E?�Q/lqf\�Ծ�/D�\�-n�\�_�}����\�[\�\�\'�$IR\��\�x\�&R2J\�\�Z\���;\��\�H\�L6�5Jh��@�H��$P�`�i�b.{�e�\�tѹ����c�\�K,\�fn\��\�\�#��\"�AK1�\�5\�\�B%\�=�$Յ1\�#�0fEՒݙ�%\�\n\�\�˱8 x�J��|O������In���\�\\�� a[%�a����\�2��\�F��<9\�v�\�\Z�1�3дјhn��Ђ\r�\�dGG7\�[�D\�yYy���\�P,e(\�b\�s\�\�0��`��3*�-�\�\0g��,�@`\\m�v�\�9\�X��\0�~H)@0F\"\�絗\�a��\�(j\�7�T\�0/\�S�I\�PI�\\�\�z\�\�P`\0|Xf���E\�+8N��ݮ\�\�v\"A&\�E�Ei�@E��\�|\�� ���Q\�\�.<HV����+�)ެ�\��6\�R\�J2Gm6ŭ\���\�^\�r��y�H\�\r6B�\�a�f�X\�2��MJ�\nJ��@�s���U`�\�%o+�&!!P9biM��\0��\�\�!L�Q:͐B�2��Lh�_q\�\�$i���0o`\�\�	_��2�**!�v�Vi�\��\����	f?��\�ˋDH�T\�=GR7/�E�W\�-d\��E\�\�\�\�,�(��\�.*;��AK[Lj��	\�\�n*䪉5�6�\�ڹ��\�P\n�-g\0\�\�\�ZD�lf���@ɖ5�c�1-}�\�C�\�B\�x\�Dy*ȷI@�1�\�^\�_		��3\�h,J�0\\�B�\�>\'�\�\�j\��*\'Օ|2�1��/PV[\�f�\�\Z�\�}\�ӖT�vĹQ\"��&P��\�L���k\�\r\�\�8��A��\�y6��\�>�\�7��cZR1km��\�\�\0��`G B@Ȧ�\�\�s�c\�\�6���)|�#y�� \��\0�	k�i��\���cr�w�X�!\�4K.\�\�\��@e�fx��6�bl�F�\��P�hEp�L3l!0�p!\��\�ZCf_\�\�\\$H�e˩\�˘ĉY\�R\��\�-�R3S�\�0�\�*\"x`�R\�VyT\r\�K�~(�>t��NX\�ݘc\\��zs��\r᫅,[�	v�n�\��7{X\�.P��\�q�*ޱ� _\��[&u�2ɸ�V\���4ݑ��+�e+X�c�/*C�\�+\�\��E��<U�\�s;#�h�e��OTWpk\\�`\\\�Lϥ\rw��E\�*<U-$9����/G�!�\r\�\� \\\�]\��\0�x�m���uQK��r�\0Q�0B۵�>\�\�-j�bS\n`n9i\�\r7Pj˶*}\�\�qo씵\��t[\�q7di�\��	��#h\�aC���B��\�5,�q�ϣ>n\\�i�X�\�q.;>��\0��\�f)!��\�\�6\�#�4\�0ݒ�\\��dhWsf��\�\�\�Tî\�b�����@��\�\�\�,\�%Q�)1DŲ\���dL\�X٦	�\�Cl4\�ޘ5N..�n\���\r\�Z�(\�	�A�\��?7wضՖAQ^5�ܿ,Cn\�\�N\���W���X-��\�\�(\\D㘯+R]n #�N)\�l\�\�\�\r�iW\�\�^��UUB6\�LB�\�\\X%�\�!�_�\��(H��\�]����P ^N%_\�\�6B\����ط@�Aܮ���\�$�\�Qn\�\�7\�+�T-�*\�N��0�\��\�fD2��d\n�?=�/d\��t�\���nw\\z\�\�8J8@z#�����3K�\���5,��V���B�D)0�d)\�\�FE\�])�����M\�1o\� \�\"�\n(0\'���9�R٦ ��\�	Il�o��c?�v7\�3�.U� �Of�aQ\r*W\0t�y\�\n�b]f-әT\�\���\��@0L��!\��Gư\�邼2\���\�\�\�\��a\�*��UŨ�\�7j\�)k\�U�<\"�D�a���i�#�\n��]F\�SG2Ǣ��o\n[\�P!ska��\���b\�F\Z�B:R\�t\��Q����f\n\���\"X�V��<�42`\�*�\�Dt\�\n��-�\�(n�9�[�X��\�!�\� �\�\�\�/�d%��.��\��K�.\\�H\\\�\�X\���)iT�k$\�\�(±{�\�e\"VC@\�jS\0\�.R��\�-\�iu�\n\�L�X7It�(]�b\�\�ѻc�\�\0VX\�\�\�6\�K�[C\�Z\�\�t\\K\�\�\�`\�\�ة�\�wCR�`�Ʊ\�.�~\�e�\�jJ5X�\�-�\�0���\�kJ�qHC��~\�|9P<�A�qfiv�.�˗n\�,\��2\�Õm����\�W��\�:�71�_�wF�%ٶ#7R�#ht�\�-\nD[1Ijj\�\�1�\�U�\Z�g�\�\�\�ӂ4S�an/�SkB��\"_��\�\Z��}M\�y \�\�=7йk�����\r};��nl\�Hۖ�Ӹ����o�& \��\�\�iP��\�\�,b^\"A�0<��\��\�\0G\�˗\r�s3(�l\�$\�po\��\0y\�\�M\�[�R�ق�E\�#[u\�Q\�n�-@2\�r�,CCznu�@͑^k@��n�Q�j\�w��h�YE\�b\�F\�͊\�\0\�C�p\�\Z�c0F�e\�¸�n\"�	\�*0/�������b�\�Ri�c>g\�|>R$�>���,\�dQ\�z\�\�!����F����Hn#\�s\Z\�\�_\��H���\�\�imFqAl}R\n�wQ.\�&Ld&�ԱI��P\�#TB�\rܴ\�q�k�h\"U�2ԤK`�t@L\�Xr��Z�@\�#Bڶa�#�\r\���vGOq@�o(��\�\�\�a�?dF\�|S��c�ju=����|�8��\�\�]��������}��e���\�=D��\0b�p\��(��AQk2\�o�R\�s�\��lxL�V37D0D�]\�q\n��C@�\�9��TvGr�\0w&ǒ\0\�\"��\���\n��ż; �1�1��P\�Y\rd\���u(q��u��9H\�S4\��/(�=�4Ŭ:f��b*�0\�2B\�\�z�\��xw\'��-\n\�L\�\��|.\���-uQr�\�\��Ej��\0\�R>X�.ȉ��2�qM(�b��\�\02c\�D\�1n\\�B%\\�-�d;5]�W�a��Ė\�\�sYsTK�\�1�bV����-ܫ�+ʑ�_h�Րb\"��\r*\�Et2�\�D3u��ĭK����Pa>;��|`\�c��_���G\\�%u\�hj\�!��$�ź�b\��/G�����B�hclf�\ZP�W1�8\'h5cW�֖\�\�IU��hT��A��J\�\Z�d\n\�n4\�8�K�\��A\�j3>�c�Z!l;�1�wkr\������/���\�H�BǏ\�|\'\�\�\���w�\�\�2�+�Gk\�\�\0\�&r(��8M�%\�pa\�1(j�[�X\� %U0\0��\�\�8\�\�0{%%�*a\�A�X<�X��f��\�.�얾\�*\�qE�\�[�qT�\�\�LJ�������\� �]�/��Ye�\�ަ\�w�\��S1\�Q\���7Pn�x��Q\�E��ϋ�e���G�$Z����b���\n\�W��\�ápnV[)�\�E\�*\�s�\�-bB z3\n���\�l\�[J�pj���#Y���\�\�\nb��f*�Q-\�J�it�ƅ\�y\�鍚�\�U@`\�Ž6ˣPk&�%0�o$\�)��ɨ��zD�*.\�Ŭ�R\�b\���wC_�\�s�u\rn\�i;e�L��~/Du\� �\��Dq�xb\�b\n\�<\�MZ؍\�.<1$\r\�i�R���s�f6�\�JÊ���iɃlDn�{�Q�\�u8p�\�A�f�\"\�U\�N�\�#��+9�,1d\�슘`\�\�{!�Ũ[ \���7_`��\ZS�|�W�X2\�`\�\�\�o�\�}|\�\�U5����y1/�5�Z0c�\n�S\'\��\0�00�!�������\�n�\�Y�Z6\�H\��X\�p\�\�-J[�v�TpF�����F\�ˬp\�\nn\�R\��1�XbY �Ѩۺb.�+�*ݐo��L16v@�\�WbXb]\�\��\�B����\�\��>��Ï�X�U$g��\�\�>�*ְ��B~3�rIP�\�b\�`�\�\�b�T\0\���蝘(��i\�\�6a��\�I��c�<�܆9y\"=\�-6G\0\�xD�\�R\�݁�\nA��GXbPb\���\\��v\�\�7\�k|\�fP\�H�\�[�y&Lp\�+72\�WL\n\�\n5��r�CeT�\�/7/j�P\�J\�B��0�X?�\���\�|\�|?O�8\��_��Wc\nGF\����pZfȖ<Ǻ`�ușZ�el�\�\�+�X�\�\�\�\�\Z6Ej\�X��rMے&^w먯;S`��J\�\"\�aw}@,(Ƒ\"\�1\�P/&�i�P\�\�4�ug�qid[\�0\�VE�\�0\��4\�\�L\�\��.,�\�j-A\�%l nR�\�\�Y�ye\��D��_5��W�3�v���kƛ\r4\n\�\�\�G\Z\�(�l7<�f��\�,�����X�0� D�Ph��a��\ru ��\�h \�\�[�\�\�Z%�����V��\�)���&\�Av@�\�\��1DZ\�p\�[\�\�\�aX\�0a崃0�xf\��|\Z�\�*r\�C�.\�8�\�8�u\�\�\�i.�0|d~ض�G\�:�G왘�[\Z\�P�s\�C\� c^�&P�w\�\�Lr�<C���r\�����P�@�9��Y\�1jUƛdH��\�-\�D�-A���.ڦ\"�L\�\\��\�Ho$T\�\�ЍB��b\�e\�I�0|\�s\��\��q|1U\���ΐ.$\'�b\'ʥ	,�-\�L7\���F`\�\�~�\�\�#�z\�Icmf2<w.;M,���\�\�&w�a�e�\\\�{ \�6A\�\�K�\�`���p��UTo��p\�\�Q�ƶi�_��H\��\�k�\0\�\�\rέ�殹\"Vt�����p\�d�{��\���o�L1F��{�r��y��1aX\�\�\��Tx��0Ұ^�_�[ :�XasR�\��Cר�N�x�qb\�J[chj�c��Z\��^Q�GLUU\�͑;�\�\�D[�3\�\�\�s�b�f4\�#�F`\�Q^D�\�7�af7o1Vt��j	\�N`�S����\��\�R�\"\r\��ˑ\"�\�@\�\�LB�C\n�)\�n\�\Z\�\��\�\0\0\0\0\0\0\0��$\�\�\0C=�\�\�A�\�?\�w�<�\�\�v�A4<�\0�8�\r�So�\�\�}2�\0�\0\�\0�\�yu\n6RP�4\0\��P�O��C�p�\'�ۥ����\�LT�\�<� S�0BF�\�c\rEWc\�\�q8#<x\��\�h��\�\�0\�\0\0Q9�\�L�0<\rD�=\�Ea�\�\�\�4�\�\0!@GӀa6 {C�\�P��U\�\00O(AO<\0<1\0<�\�	DH\0\07\�8���ݔO`\�h\0E��$\�@ �\r\�ID�C%��\�:*CV��!\��ZA[\0<����\0a���sLt�#��\�*\�e+y�A\�i�u\0,�\�\03\�	%ߚ\�%\rBx?}\"\��t`B�}�\�EP\0C\�\� ���G�P@P~\�Et\ZO2�9V\�}t\�\04\��\0C\�pjm�:^�\�#\��\�hGۿFC\�AgRCQ4q\�y�}�\�o\�P׍Q!\�(9-��\�\r0e8\�\�Aq5T\�`1\�\0P�i�(�U�AԐCv\�1\�UQ�l|�\�L0\�4m�|K\��\�\�AA��0\�$�V�ooZ*q���D\�\0l��}4Y$�\��8A4\�\\�C<p�+\�\�g�.��I=(\�	}�\�Mh�pA��&\�eHm\�G](\�]�:\�\�c�U\�\�e�R$\�A_>\Z$*ĕ��� ��\�9q�\�w\�&\�A4�1�\�DT~��<\�\�,�\�r��\n�����SA�Uf;@|���B�t\�d2	�s\\\�\�\��Q@E4\�AC~��w]�\�!C(ip�K\�\�\�=%\�\\_{\�Y�\\q��gǫQ\�\�k\'�\�\�<�RlxD_\�,�\"\�\�]��O�\�3Z��\�3c\�]A�\�I\�MgAL\�L)B�ew\�}ZK��K�\�&L�\�\�WD\�l\�\�G=\�Z\���\ru\�qEehʴ+\�.�t\�qy�Rd^!E\���\�\��P@\0\�:\�n�X�/\�1R6\0�\�x� �`\00�?]z�A\r�\���\�\�sdpp	�\�Q\�\�M \0@@�<�z\�M\0	p\�\�yċ\�\�\Z(\�\�v 1Γ+\�\\ӄ 7\�,�2�\�\�y˙%�[\�Î{9��\�8\'�-�@\0 ��\�j\�iM!�^n�E`C\����!�C\��q5O\����Jj\�.���.� )\�\�:\0@0\�0�`Ҿ��\��d�)ܿ�\�H:\�@\�\�8\�\0�\0S\�{�\�\�\�4�������\0�\�9�)� ��4\0\0ǜj\��\�}���	!�s�,|0�8�\�\0 \0��,�>Wo~�\�\�6k`�p�R8\��S\0<2����\0\�\�F\���t�\�B\�\�7�K}3\�L\04�\0\�\�����U@D\�]��\���Y��\�\���\�\� B�C��\�OW*g\�\0\�kuX8h�� P%gn~�v@��El5\��PJ��=\�{!\0\0<e/�=�\�׀\�iGAu�\�BC\�,9\�@���\��\0\�#H\�\�i�0\�d\���}p\�\�u]u����~\�8�y_?ߏ\�1�\�S#�ut�\0\�3\�\�Q˘\�����\�\�\�\�\�8��\�2�Ж)ג7n1\�݇�\04�<���}P\'U\�>��Wp\�Ȣ�#\�|��\0g�?ꏣ��*\�\�lZ\���IY�\�D[\\�,�p׭ioW�Nf\�{ʯo\�G���YHt��\�]R�\��\�\��0A��^�=�)\�2��<���<�����aƁ*ӝ0AEtﲊ\'�(��\�T�lsQ��(��\��L�Gh\rPE��0�ľ9)���BC\�v\��\�V~˥�o�*� �\'�G\�D�\�|�pJ5Y�k���\��\�\�\�\�`c�\�j����\�aӃ��뎺\�(\��ɥ\�8o�6|�L\���S��\�aQ\�4�\��o$ No\�\���\�!�����Y�N\0I^a7\�*�(\�,9ܲ��ȴ��*��@(þ[e&,\0@\0!\�\0���?�\0\��mP\�z,�\�P\�\0\0]4\�P�\0JG\nh$�$\�t�L����\0P\�8\�Qo\��!Kh$`�\Z\"��\0�\'��4�\"K-6\�E&PU�5�\�4\0,@���\�\�\�\�\��\�\0� {�����J\0�\�([�6�\�\���7�\�,\�\�$\�Us\�I\�\�\�<\0*\0\�o��{춡`\�\0!���\0\n\�\�_LЀ,�\0�\0!K�\�\�	\0L\0Ch�0\�\�0\�;�;\��\�\0#\0\0\0\0\0\0\0\0\0\0P\0 01!@A`ap���\�\0?\�r�d;��\�\�a��H\�\��zU\�TO@צw\�\�ń\ZD�ߨly���\�j�S�RM6�\�\�\�$�v\��$Q�w\�:ỷ{۳3\� u\�\�\�\���\�.MC\�o}C�\���\���߇�r�\�/�m\�\��\0���\0�\��\����\��=�C���O�\0\�\�k\��\�\����g�o\��\0\�{��}�\0�\0R8d�/\�\�\��\�\���\0��\0]m�\���\0��\���|��\0�\0?��s\�\�\�|����\�\�\�\�\��\'�\��\�}�5\�\��̯;{\��f���A�}�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0?(�\���\�Q�{��=\�\�\�\�1����\�j\�\���\0\��<�\0�\0�\0��\0��/�\0�\�[r�]��y�?�3�x�\0_\��\0�\0��\0\�o\�\��\0���ߞ��r\�o�\�\0)\0\0\0\0\0\0\0! 10AQ@aq���P�\�\����\�\0\0?و(t��\�LD���@���Y4!]�B~�t�5F�\�-���\�i$Q`\0F@��d�\Z_tT����*nF1��\��+ubT�� I]\�m\�tj\�����A\� 2�D�\n\�	\���\��Q3)pR�\0\0\Z\�\0]�\0\�0+�Gː��2PfP\�dS���\Z<\�\�\0�	��t\�L\�@p�~�a\�!2\���U\�B�)5\�$/�\0a\�\r�!eA3\�QP9�\"> TV<7�D!ԅ\�TA�\0�\rǀ PXB�#�\�3�@bT`v��\�X\�t粸	�ӍW�Id�\r�l!\�\�	�h��0=@,kAH+\�T�>�s(�`af\"���`�\'\���\�(�m�8�a2���`{0�\��\"�\n�B\0ve�K$\��F�y\�\"�\"Q\�\�T���\�@\�\r@�PAu��\�s7��,Q���%��BɊ\rg�4$\�\0(eP�W:\�C��X�(�)H҈\0(@�TBQ�c�\n>�\�U\�\0*�T\r\�r7\�y\0�AI��d\ZɤۙU>�@\�\�U������7�DW�!VE\�\\t\�7:t�d\�\��&	\�WN�O���Cd�H2f�K*��\02\"\�\0����\�9���A\0�\�e`@;��MB#�`eT��\"·*5\�WD\�\Z�x\�d(A\�vR�\��H\�Jt\�4L�f>lp	3,��r�\�U9\�\0E��[�ELTx���ZF����\�CNp��m��F�\�\�T\�Biqr��mB\�v�TQ�Ee;�\�@�(T\�C-���\�RpT�FTAR�AELE\�Q\'\��;�����Vd��8\0��&�v\��)=��H\�4\",�\r�\�D�d�-apB戀8\��c��P2.��A�!\�c�����m�\\F�m\\\n�\"66S@����\�U��!&��$I�@Dd��\0ҍ\�u�$dPJ\�G,��\�(�)j\�.�m8�e�3YL(u�X�$oNQ6&d�)\�!\�_a�	�M\�(2$�A\�\��{L����(�TAjTUA \�\"Lh\�S�\�V�J��[��B��\�\��ME\�`\�\�L2�d:bG	� �q��jvT�\�\"fE\�K�\�G�r>�\�`\0KG����\�%�\r f��R\�d�yJ�3!V\�P!�@KH�b\�\0H,\'ըA�&\n��I�8�\�`�\�\��d��\"�Ȣ����Xv`�\0\�\nI\nr\�D\���Dǀ�\"�H�\�@H��d9G>�\n\�k�&�=�\�K@,\ZPɚ�D���\0�\�;�0x��(�\0E�n��+-a$� ���C��LB�\�\�\r\'\�(�RA����\�\�D����J\n;(�FO>\�g!`kr���HH��a��(1X���\�\�Fm\�\0Ў&$\�Y����G��p2�Fo8�IP�-[[�E΄B�H�dK�Z\�\�#�t�;BTap5�WV�7�\�\�h*�s\�))K⨐b\n�1\�)W8\0Q��x�fVr@਄�4��[\0 �0\0 4�\�X\�]\���CbaS*\�hU#RA�6Lh\0�h���U�Tsŗ\Z!��lJ\\38@;\n�Bj\0\�)�p�\0U$�ZL#\'\�D!�P��\�0Pp+J\�\�U�\�`\�G\0GLE�X̱\0������\n�V�(}�\0b�\�@(D�#2\��A[@\n\�&�DaBf	 T#\�/ �*�\�\�rL)���/JN�(!�Ax\���\�AA�Xdb�%_�22\�\��hA�70\0\0*d	\��Dd&\�dL\n�Y��]J�	�F�\�mp�THl\Z{n\�\�d1�`CÕ.\"�p\��\Z���\�-)��@kب&j,�\�,^M͜\�wA�@虔EW��\�pY�H\�2	�\0�\�p\0��\"!\�OP]B\�f�f \�@\�$�@t�-��F�f>�`��z���<��t)�hT��OD�4���b���#@K�vH�l\�΁Es0\��\�wpƱ��@(\�L\��pf#1CLi�Pu�\0qų�@aġ.�\�<I�\�\\�@�<f\�P:\�&˂���$��\�,�h���`r!^\�KĐnDL\�*w�\�\nP,\�\0 \�4\�$s\0�Q\�XE\�*1\�el`b(J�V\r�s�\�\��苵\�Ɖ�,-\�23��c�g�܂p���\�w�c�e\�:!\r9\�P\�)Ba��t�A`$U��\0\�#g���| \0\0\rʉ���\�Jّ��d�\�_{�\���&^M���r7��N U)�hDbq&\�Ur�R �\�X��\0\rJ\��\n\n6\�( \�h\0\0\�\Z8,I@���W��o\�Rm�,\�,\�$ܠ \�\��Us\�jgH�`�\�\0��2l�\�bE�ƈ��Pc���U�\n�⣯���\�h�]�d5I�2�]��\"T�����)�\���!��a�!0�W]\"\nJ< \n1-�!��\�\0\0 �6��\�%�)�PS\\J���!B��Dw9�q\Z\'\�:iv���mF(\\�&X\0�\0\�W��(D\�)$�N\0�E�wƁT\�\�31\n6\r\�P��>*\0�\�E�8�l��b))`�\"R�\0\�&<����r\�\�H\��\' �\n\"�E�\�\\�\�C$L,H�\0��W<�BP\�u$k퀔`%�Z\�0��\�I$����\'\�\��&�R\0��	\Z��+����(�\����+�Ү\�Wڈ=\�ų\�53�}Tϙ\�@�]\�%\� \�$\05(-��HY\�	:�xL9�\�L�EY��ŮւYw\r�`R�z\�9\�]Gˊ�l�L5\��B$B\� \�q\0�P2@%�BX�\nC:K:�\�]C\Z)���\�9 D\�G�*Tx�|\�+�R\�!��0,i0��\0�Q	�7	\�2�R\Z���ôC�<h\�,&S�¢��\r��@*�LJ`kݫzH�\�\r�eTf�#ʈ\�n-,&��\�1\�D\�=�\01Pd�yXp噂�@���\0@�*0�	%\�1�rN��\n(C@�� A� \�B\0H���(Z`/��\�p/���!RAr\�\0�\0hče\�0�\�\�@��\�\0�O\�\�\nE�ɰ�\0cZ\�\'ű���y���D`@<\n\�`�\\D0ijI�\0�7�02u:�A�\�H$\'L�C\�q��ǜx�\0g. L\�Ƃ+@$�\�\0�@Վ�\np@�0M�\�Qg\�\0$�b�G&�\0��\�La\"\r \0��\0\��\n�p���#\�\�0Y2\0+�Bb\rBhk�0b\�\�$\�@�w(��eYP5\Z+�nȓ\� ����f\n��HP��\�\Z�R��LK�DP	Y`\�8�\�`���8�f0}�Ch%[B	/\�$m\�*Pi��\"����\"\�a\\�$\�Y{.&p���5D,=4O�	@\��P��x���\n[%�\�@��@�@Id#7q&8�T6�)�\�f�w\0�\�\Z��\�g���ʁ`1�\�2D-�-\0Q�E$�A�\�)N�@���%H��\�X�\0D+W\��Ѝ,\�9�h��\rG\�,ˈ$C,\�(@q@1�bB`\�@2��RM����,\"	@t \'d¤����qH\n���.HB�v\0 I9\�\�M\�Z�Y�\�40�	\0ְ(/\�,�\"L�YE\0�,Jؐ0�H`��\�N\�\���9\0��t�+�Xp�\0\0SM�#�pڱ�\0@�%@��,͔��\�D\�(Ab��\r��\�\�	i�)8B�N�B�F�>\�D	bj���\0�\�\�\�8��, \�!�:%xd��\0Y!(H��8uH4`)qB@��X\0y\r\�\'\rr��\"��\�w��Q(6�DCM��\'Ddx�\�����C\0YR\0 v��2.i>���HnL@*\�\�H\0��\�}���[\0�M��\�V� �\02$d�1ʺv\�i�I�L\�;\�Jq�w(�+p��\�\0�l�\0y\�N\'ҁb\��M���lX��E�D\��1H\�H��\�Lqy��\��\n\�Dq\�P�\�\0&����\�\�\0a))\�<��\��� |8\0	�\�\nń,b!Dϰ88�Q�Fb��)*2\0��� *��&�F�H\�P�\0�\�H\0.\0\nʬ\�$h�Ma�a�)\�U��F��9��?i��H\��3\�\Z\�$\"(\��%\�\�\nG�A�\0\�Yl	2C���x �C$�O8 �zƣ\�\0�I�l\r���AH[0�*\n\0�`\�Q\0�s�@;��0{�C�\�-g/ (�<1\n\Z&�ɐ.#[ci$�\r0����p4�d�HT6!\�,\�� *`\�\�l\0T�1 \�P%����,ģ�\0LA2�P�!C@`:@,3\�Z7� H��A�X�\0\n�Q\0eD�\"b�]\�\0 \\\0��u�A\�f\0\�\r�SVP`�̡\���\�Nr	\�]ELBA����%�gw�L\�0�ls2�Bf\�9wFq�\0h\�m��!��H^��\ng`�BPU�@IN\��Lb@!�@��\r݃X�)\0�d�%�£�\�H	@TP!)��(\�\�\nM������)`%\��Lt \"#���\n�XQ\�;\�G#)�K\�\0\0�,X!u��ab@t3H��\�C\Z\�A��)M�\r�G�K���\0\�\�\0�jB`dH\n67�\0\�\�\n���$$l@*\�O����\��=�\'_Q\�Ck\�W\��\0\0\0\0\n���>���\�\�Q��1�:�E�\0\�H	P	0`=�.s\�h��A\�!`\n&$\�	�\0H\��b��\"\0`�l\�\�)r(Dдz�`\�e�	/��,\0c�ѕ��\0;\�B��>�Ԃ�\0\�\�l(N\n��\�F撤�\Z\0J6.���Mp\�{,�\0Aio@��!S 	@�ȑ$��\0��,���\�%�\"b�($\�F\�0HF\n\�<��q�\0�U�$D)�\0`kX?K�\r��Ӏ@\�	\�\�H\n,\"�$2b(*!!\�AR\�\��VP�` F\0�)\�B\�N��:\�*�@\n���ʑ �glFT�N��A�5������1\�t_s@Y\�\0��b&w�L��\0#A\���P�.@L ��\����r/\rPR�D�t$\n�)_�~B�\0x��?Y,�\�\��\n*\0��F�C��i�b,Uю\0)\n\�D	�8\'\�\0��(\0�\09c�E00O���\�\�\�!\�\�g\�\�ȍ�40\�r��\�2X�\\	r�\nJ��,\"m*MB\0�*}�\'ڂ�����x\�#�\0�\"\�����f\�\��\"\Z8� \nD qJ&�<�aF\�\�\r�8@�\0��\n\0�H��G%8ҔȀa\0�sK�]\�w��@��XF�(PQ��: \�\0�W�6\"Tjb)�Ȅ`Q \Z\0,\rO\�\0�\0\�����*o�\�Ce7A0F6��b��\�X�\�\0�g@��\�ᩡ\�%CI,y\0$�\n�FA�\r�\n\ZB�i\�\0��HF\0�@$`�Ga��\�\�\�\0�\0b��\0�<A�($~e\�(U\�bQ\"B\�ʓ	��(�@aD�FVe�ϊZ\�AnF`?Q%2�>\�\0�\�#\�0\����T.�\0\0�P�\0�AڝQ\r��$O��P@�\0�A4�j�� �\�^2W\�\0I� h}[��J��\"Q\"�p\0]\�i� S# ~�0\0\�@v)\�\0���\� ��\Z j�Q�\0AE\0P�C\�k@�E\n>��\�IH�q)X��x`�5�\�lTOx\0]F�m$\�:$;\�`b�!(?�\�dY�\"A�dfC� 4��\r+	P@\�D\\,�Ċ����B��P�\01dN�\�\\�C\n�\��-[�u�P���s�T*(��\�ň\�0p���$\"\�D1:	�\0�V,\0�\��$N\���H�0�h�t�LZB\��@\0Q`\�U\'\���\0l���&�@@0-d��}7LhIi\n��s��P(Y�F¿\�\n\�0\0�AK�`\Z-�$��B�J\n@\"��`X�  f\'\�#���\n\��\n�\\��\�!\0$I�>� (- E:\n��\���\0hL�(4�5$\� �D	2�\n!\��J\��\�X\�T}Y\0��x(�\�m�O\�\��S�Qg[\�* �9((\��FW2��D�:��[�XY4\�8�$\�[$Y&�*\\\�@�\0�h\����\�Sb ��	�=�H�UDW/Ф�\�Ak\"S%���!� Ĭ\�\nA,t\�$2\�7/BdH\�sQ�H�\n-0\�R�����d4��\"\0K4᠉ P�*_�d\�\�\�\0�NCj��B%����Ƒ��@f\�ۀ$b\�C�KW �&��y�\0tb�r\Z�YL��F؍ChM\��iī\�f\�\�\�\�\�!\r��\�8[�\�9\nLA,\�B<�4A\'p�<n!Q\'\0��N[$3���L� z�\��(����\0�\�\�\�\\�V\�\�v�r\�\0	\r�\��H\r�\�\�f\0�\�GE\0��\�$l��\�\0�x�\ZA�\0)(�(e��cQ#J��\�\0�_��G�\0����\0\���p\�@�Mζ�1ac\�\�P&K\\�\��$>�DVX�p�Y��6`0J\Z\��^�[�ςY�f(\�\��*�qY\0�ge0b5�!\�#P�>� H�3�Pp\���fZZͥ�,��1�c�J�bB�\�X`\�A \0>d\�g\0\�B\0�*6x�\�\"A�&\�� �%�@\rKB\��\�-\�0��a�\�\�l :�\�\n�S�\�f@T\�!\�Y(�\\z@��`vqt6�A\\\��ka�ex\�\�%GT4��\r��{4]\"0Q�q \nE\�H�ݛ�H����\�oK�\rl@�Ҷ\nD�\�(��.\0���\0����\��q�\Z�|\'\�IH��\�#	�T�(*@�\�G�\�	\�\�\�\�0\0X\�\���b\�,,b�\�*�j\�\r8\"�G\"�\�\\nBab�.�x`9@,5,,\�\"JG\�\"DW����p\0 \��@A@��Ta[���\�+&,,r[�\�p\�CzLx���%���%A\�ҸI\0Fb,m�\0�)ETQ`+�N�N\0\0�\�\��\�\0L,b\�b\�PB`�xd\0\�&\�`��`ZA�`:e�.b�bF4|�)H�\�s#��\�<R�\��@I���\�a�\0h�A�F��/|@\0��@.8\�`�V\0h,�\"h\0�XB\��B��Y2Hh�Ҁ�,�dtd�\0w\0+A\�\�\�\0&4�,ĺ�D5Ln\��\0P#+@�\�\�\�R��<\�a0\0<a\�C�b��\nDE@\0�i��CS�\�3\'u*�4^��\"\���uE�0\����$$>��\�\0�\n\�3 \0*�౳�ʎ0�k �}H\n��w�A@Ln\�E����� ]��Q���&\0@\��a3C\�@�\r\r�X^�\�\0\�0D\n���)�����\0�aؿB\0�(`\� ,��)\"���\�8���\��0+�Xe\0�\�(\"sw\�M�C,\�7E\0��y�pb��!�#\0�\0hYp�2[`эJ\0�\�A@(8\0\r�@	�d%:3\0\"@\nh$@>\�\�\0��\�0�2J\\\�Y%2\�\���\�L\�u.��P\�-\�_\0�ǃ�[\0��B�\�XXX@H`�\�%Q\0\n\"\'X`�M���\���� \� F\�&\0AC\ZU��\�\0�@0��ֈ���w�!tA2�{*0�f���\"�A@l=���(R�E��a�D\�P�\�:`S\�\0P�\�@W�@�\��T`L�8@�(��$8H\�>\0j0�e�n&_xR�1X`\�b��څ2b��#�H#\0�����҆ A\�T\�*��\0�F\"`E�rT\0� L\0� @��Ml\Z-\�\\CDO\�2\0Tm\�\0U\�\�\�h\n/�B�|XЄސ�\0��$��\�\�\0�$�:�G�H(�đRˁH�A\0F�R�\r+\n\0Ј)%QRh9�T �41DR#PjBU�\��@(�\0QTH?`\�_�`T���@f\0E�@H\�\Z1F,\0��#P�R,Z\"@�D@%8,?\�A���\n�$<!2j\�2��\� H�!A.d\0X@�$L.�f\�U\�\n�\Z:\Z\� �3\�*\0� �����#�A`�U�C,]Ƌ\�\�I�8�.q6�\�=!f����P\0�`�&\0,� @x0C@���~��@[Av#�@O\�����/\�B\�pdA@HX\0�[�7@����0\0ذU\�\�!D&\�m#\�!Z\\\����\044���`	`@P�A�N�K X\�@E��\�T$6�\�h A��	��$:E�\0z�L\�B\0tdz�`���� (W\��:\�#ኀ\r���G\'\��w$���Ř�\��ڈъ�Ă6%\�\�X\�Ѝ�\�2 	\�1 M\0�,X`A�\0	A( \0G�\�\���\0�.�\0,\0���Ap\Z|�g\��<	�6 \�R\0.1�\�\07a����b&�\�d$P @L P}Lɭ�	���	  7D b °��&���B#��le��AS �!�@,Ÿ�}��\"�\0D\0(g��^E!�	\0@���A�,`�\�\0!�@�\Zj2\�\"�@����\���+����0�& \��b4 D��\�!���\0%(1�@�T�\n���\�3\0\nm\�t\0K�9��k!@�;��(@-\n ,\0� \�\0�*E�8	\0�\���؍0\"� o\�\rB�g���` @�uX�9��ۀ �&61]�\�#5P6&�Ug��B�\�\Z�D0�!\0X0,���I�l�\�P\�h;���A�P`(!�\�\0�M(\�$�p\0\0�>&^\r�01\�8\�D\0��\0	ȉ$@#%ZDG���X\"\0\�`L\�10��:T�$L\0�\0�h�4�R@��5 X*@\�\�\n����\��,\nϭ �K щ�Ù��㯄^�k�v�\�,�$`\0\�6%���,��T�B�0�b��`\��s\0\�F��\"tX�`��\0/C�\Z�D�I�uŀsh�$�\0\�	! 4$̍�C\"i �AP��>|��_-�\0�0yI�.\0�D\0@N	H\� �\�\\\�<4\"\�\��\� ^(�a\0\�\�L�!���E�\��b���\�\�PD\�\�0�$4cd�DKm\�p�\�\���&\0\n@��\ZD\�\0\"CoJH������i\�t��\"\�pA1�PH,\0P�I!X�\rc���\0���\��	�\�$a\�\�\�\�uyW 2��F(b\�*\�St\�\�!\��@\"0@\06��$h&��\�t3\0ڀ\\СC$Ac �\���D�9\0�� nn��\nX�L@,V\0L�\�	�\�\�&s4\�E#�$\\\�\�E\0˃�\�#��\04�	\�m��\0 XRT % ��&�Ɓj�\0�\0 Z��P\�uTŶ=G�\0��b]\�\0FH��2+\n\�!\Z(�ݥ	�A1�wXAB�D$H`�\�\�`Dt\n�4Bd\�@�hC\��L����*B��q �@��\0\"\�@$@RH�J(��0\0�6\�X\�\�D HkQ\0�\�\�\�!<�=���\n�\Zj�u@ \0I\0 �B�P�f���;\��� $\��4\�$@ \�E��H��GG\0\0\��I\�p\0J���\�m`5�x�7�b\n\0x)Y�L\�d����D�H`! 0\"0�X\�0�	\0C!�-�\0�\����R�`T��R�&�T�Nb(Pa�P�Q!:�\��c�\0�\�8\�*8$\"D�R`��\0\r�x �64	\�C�I\0,@�*$;� V*]�\�,Aa\� �\�\"��P_B\�d\�[0\0H���P(h\0�|\n�eG\n�jA`�B���*C�T��0tD\0�P�\����R@P\n,0iȄ�#\0\0\�\� �B�$\�`��ha��B�\nPa�8F\� j�Ȁ6A �h���A\�\n\��s����%�p\�(*(\�(	��c�24U@�\���Da���\�V,D\0��\r��@�\�VD\�jaT,�\�#JAR0,8n\��p!\0���BH�I0@Z��q\0�V��$$�`!\0�F�\0 C��v�(9� \��^�����ϸQO�h0��0@IBT_ٞ=(\�0\�@�K%�|&���-�D��-�@\r���`$0$\�0�Ո��F!�[�Ì	\0\�03`�\"��G�`L�R�$L`eb\�\0P�\0 \Z\�@8���;\0@��\0�B\nA�7 .@E�%@#	L�b\0�		��&u�Pw\�j\�h@\�0\�-ЃH�ی ��� ]�f%�\0\0�� J\n�\\\rx&�����M�@\n\0D#\�A�`APP\�0	O@\0$�$\0?��U`u8���\0T\���e\�	|\0C�%hD\rU@\n04��1\�\0�vɘ\�@`0���\�-\�,�J��V�@\�!H0�\�>�Hi(r . 	\04@l�\n4 X�Wl � X IX }0`(���\� \��0\0\0\0P��z\0���d �zHEN!X��[�	R�0BL*(�17	\0D:�\n\na� \0(HN� �\�\0�%�$4��؃�\0�\�L\�4�\�\�A@���\�X| �\0(\�\0\0(\0\�5���\�P)�F!AX,�`\0Y��\'0�@�HB`5Ǥ�����m\0�@�&�lP\�.k\�(\�\0j�Q��	��E@\�`�B6�@�!H\r�2\'		 	\'��\0	�! �\�\�\�AAR` ,�\�R��\n,\n�A@�u\���\�\0\0D� �n��#\�%GhH�\rD����F	T�U�F\� D�x��:��>\0\0�Ha�3\ZA���L�\n��T�P\�@\0��X�`\� cZ\���F��\�0�\�wL\�`hHA\0Q\0\�l�@ (�(\0\�		���\�4@�2l��U�WhXh3@�\�	���ф��H �,�\�\0��\�\�\�\n\0D\�4�@�L�a!0(��J�+\�Sc�\�\0��g\0�\0`��� aa��(\�\�\n�4 B-�\r�O\�Q@�Pp6�\�  �\�&4�7\���/d\0��\�\rP���E�iS-\�\�-\nG\�\r�n�4j�F%)	 0\'	\0�Y��\��\�ai��\0q�y2S��	`P��(H���\r��\Z�`@� �\�@R��\0\"�D\�C�|�\0\0\0#L��(\0� \0@��@��\n(	�mZ4$\��! %� \0\0\0�(��H<ʑ\"Q��0iPX\�\�� v���A\�\�\��\0\\ar�\�\�\0\\U�\�\�@\0�Z\n\�YP@,`S`\0&n\�\n:`qm@P�\�,�X�@\� \�@� �\0$P 	\�5\�F\�\n\nϠ H\Z���\��D $�\�l��a�B: ��`�\�\0\n0a�\0\r��z\"كBxTm\nC�f�l� $\�\�D4\0T+�ٰ.\r�\�SucV��\�iS\0��D@�&�\"8\�*`\nQ:	@�`#� ]�p\�	\�t��0C�	!F���H�J�\0�Ġ�\0Wi��\�\0t���Dq!��\0��\0��o`U!$$0OG$�P �#��@*؄j��\�\0���~\�\0\"I\��3\0!\0�Ă@�&��\�- \n$$�	��\� �a�LtH\�P�\0	�0�8 k t\0��!0s\0�\'J\�H�Q\�E\�\0�\�c\n�\"�`\�9\�a��\0��PC �I�:H1�T LJ~C��`T�$\0`�\�\�\�ȓ��F��&.��l	VH)�V�P(\r\0\n2��@I�\n`�0��L#�BW\�\0\��D\"i�9�\0&�*@i\��d\�\�qB(~�\��\0\��\�\0\0�\��\�J\0l\�\r\0`DYQ��A2@@\�Q�E�\�91�!c�H/\r�@w\�r�r\�L\'NP\"�X�FfNv\�\�\�\n �@\�Fmt�\�$0�� ������U\�0 \�/A�CH5��\�1\0��J`h\ra`�6XPB�!���	F`)_����%�\0P\0�`H;�\Z���\n��@\'l;�\�@E�00(P`\��\0)��M�Mp\0�\�B\�I\�m���$M\�hhE�#�\�a �\r�\�6\'5��b�L�C�8�! X\��J�\0�4\�\rm�@@�h\�h\0L�0E�$\06�@\n�\'@(� ��̳\��d5�A�!h`#�b�\�v\�8Q��\�NA�\rā\�\�\��\0� A\�A�\�\0\�\'0\�\'`\0P\0@`�6pdš2 �ؙ\0���\n\0H�@�\�(\�\�AE�;�04\�J`B\�@��ji\�\\��@�\�\�\0}�\0;A�\��\�E�&8ė@B\�8D\�n�!L	����!\0(�\�\�@jZ\0fō�H`F\�\�\n\�!50�Q\�J��!B\�tpQ�c\�\r�oa\�*VT\��6S E>�`݃��Шb` u�H\0 D\"�0\Z!n�Lb�L��6,\n\�(��q�\'�p@Pm$p F�B���Lp 3��\�\��\�Ǡ�:�\�? � ѐ.�7@(K��`R�&\�	\�B+`\"ƅ��`f\�\"��R��P݆#��\�P��`�XVI�۸\n2\�����u�0�q`�i\�Q :\�B�H�\\����P	\0Ee쬂\�[\�2�ձ	�^� \�0��H��QlZ``\0� ]�@\�\�\'0�{XZ�\r�ļ\�@L��0@ T\n��\�\� \�A\��`D*\\@$\0�6	@�\�b�	 \\�\"\�\0,މ\0@�F\�R $\r ��\�\�\��>Hb�(B�\np�@\00�e4*\"\�p\�8�@&!�3\�\"���	CI<�����,@	����H\��7\���,4�AB\'@�B\�Qk�J�$!�\"!�l\�\n��\����\�'),(500,_binary '\0',NULL,'2023-06-05 20:40:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'long','Long',NULL,'Nguyen Duy','long','$2a$10$gINxxwKvs7am5uA4dwdOtO33633u1n8Sj3FvLya3mSp.6fvNcrJly',NULL,NULL,NULL),(550,_binary '\0',NULL,'2023-07-28 23:16:39',NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-15 00:00:00','longđ','Dũy Long','M','Nguyễn ','longđ','$2a$10$HlAGN8y2opwiimwC0UZLo.kfjoGSDzkt7l1KTsv9tTUXepLKEgMka',NULL,'0379755079',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\�\0\0\0\�\0\0\0���k\0\0\0sRGB\0�\�\�\0\0 \0IDATx^\�]x�\���L�dBb\�\�{\�QE�\Z�\�V���h���.U�F�*j�j\�M)AHl�H\"�H\"{|�\�=n4\�&��߸���>O��{\��}�{\�y\���^�(���\�\�i�s2��\�\�Q<�\r��@�\0\�\�) $2\�\�\�\�<zr�p̻]�\�oۺ\�=\0w�2\�\�I\�\0S�����!?m�/h\03\�a@m\0\0\�(���\�xD�=�\rjb\�G���S0�\�c�\�$�k\0.`��+9���- D>iA\�\0�\�\n@k\0�\0X��^Ţ\\��ӌ1�m\Z0�	�\�@\0�4\0(\�/\�~\0G\0b��ɨ1~ �hU�2\0�x@/\0�j(\�H\���.\�\�!#S�\�� \�\�\�Ƀ���fee�jffV\�\�\�ၙ�\�\�\0�t\�\�ᘡ�7��^Z@�\������џ}�>��CdggC. rrr\Z\Z�@\�Ϛ\�����[���ô\���7 \�C\�\�ϙ��\�4iB�\�K%/ A��6�\�\0\�\�;n\�8,[�L�C\' \�	\r\�\�_|�\�e*�A�Q�s-+�\�Ԅ8\\۳	)�\�\�\�/?G\��ue�V�A\���1�C�:ź\�KAjx�X\0V�O,##G�AϞ=e?D���X��(�\r\Z/�-m\rd�&\�\�Q\�\Zo�1B�>\ni4�\�\0�1\�2\rݹ!�+р����M����\�\�ʂ���,�\�\�\�\��\�h\�W�,�\�5\�s\�\�\�\�\�\�?�`\�G#P�bEYc�Qy��\�PFF[�DB�\0&X�\�\�\�\��\�\�\��h�\��\�5\�\�A\�{�ׯ5ș��	}`AIF�� u|`��7S)@T��Š��b�ԻLvf�D�L\�gu٥�jT_C�%\n\Zw2��\0攔�T�\0�\�y��y\����\�\�r	̌��[ +-V����.��s\�amg\�\�Mt\�\�\�hعz�o�\�HOJ�E)d����y�<�*�FU)sss�m\Z�@�oc�\ZpA\�{@�0��n)zT�\����\�{�^C��\�ɫ\n��l\�_�w\���\r�{����w\�/|vFl�ݐ�$����\�dYJ���GP�m$D߃{\�:xr\r^\r[����8�(\�\�~� \�,W�\�)\�\�\�[@�\���\0�JU����\�8bn]��C�\�?\���g,�mqe�\��\��\�\�\�@|\�Ti\�\r��E�\n>xp3���\�\�p([uz��G\�`f\�ܱY\�i�B��_\"=1.>\�Q\�\��:�\ZÖ� \��fff����;�S+)v����\0\�\�մ����$\�\�-pr\�\��\�6\0�>\�q\�\�Vعx p�\�\�����p\n�]�\�\�\���A�sq\�[*�Lege�դF\�Ws�*\�\�\�FR\�}�W���S\�h�\�de\�\�\��=Jcdek\�W��\�W�̳�c�-W�]U�+V���F�=R\�\� \�\�zb\�~헺Y\�0��BfJ3��-\�Y�x$Ga|cD\�$w�ŏ1,oֆ�],\0!�%پ5�k�iF)@2զ��ظt5��W�u�wƼe\�?: \�j�B\�܊�s��\�\�h�R�B^�+���4��b1\Z��\�@b�=8�݀Y_~Y\���\00�1� ��!\�5 A�B6n�� h|_-\\�\�Fp�\�@�\�\�qd(\�w���K�\�!�>\�6�\�\�a\�%�a��\�	\�W\0�e\�MgU%An ��NCZ\���\�Xg\����쇬s��\�\�\�\�\�ouc,�)cl��\r\�\�\0��?�\ry-��EN}>���+\�\�\�\�����o-�\�z\r㯿�±�\�ָl\�<m� �\�\r\Z�ܬ\�6����;�zU*`\�ر�ǧ\�d\�/�;c\�M��߃Q\"..n���\�3U\��1��+���\�\�1r!v\�t	V�V-̛7��Bz/��0�1v\�4`4�a\��\�׿��\��7n�[�nX�h���\�\"F\'M��G��W�^4hPq1���h\�o8c\�Z�m\�(\0!\�b\0\\�~�k\ZB\��믿\�رcfϞm�ny�\�\�\�֭[yd]�z�СC����#\�hcL�Ba�/r@��	�\Z�!A�\�۷_~�%N�>\r��\'�v킗�ߦM�>��9V�0z����cl��:\�\�O�B��\�\n�G\�n޼��5)�M]\�\�\�\�\�ݻ����\�\�d~��Z�*\Z5\"�%u���Μ9�֭[c\�ĉX�p!߲M�0Aݎ�Q\�999_���]C.@h\�^��@�gB/����\�z�~\��~\�\���\�d\�\��\�\�A. \�i1茌˖-�3iҤ����!\�w\��!\'n�!�-���G��R�J�V�����\�2( \nZr�N]C�=_@����q}�\�ellԋ\r3DDD\�\�n^�>}>SG�2�\�\�@f�\�Iy\'A֗\n*(1�B\�(造-\�\�?�\�\�\�hx5\�\'W\�E�d�:J��A\�chR\���\n+�g$%�?��\�YkΜ9��\�\����L�2\�\r1\0C�\�\�\�\�&g(+SI\�k#\�D\�o�l͆0�0S�`\�\�D����\��3�۳\n;�\�T$w$gϞEBBBBB���Z�j�����n7 A\�\�u]7B��\n���gc&M�}\��\�X\�K^c\0c5;�sgL�\�L�\�`�o�7l؀�C��S;n[u@\�^��Q�	b�Tp�M�6\�p�<굔\�P�\�Q~G�zet\�J$膓\0A\�#ZUDU@�;\0\�\�%\�NQ�Z5Qe\�2�-\�\�ѣ�z�jIS\�\�\��\�,^�!\�ma\�\�.�Mm�bCo�\r�~�kSLC�\0���d��ӎ�eT� čT�\��)\�\0A�V�Z�K:)B��t\�ާO��Q�.�m�a�\� F@\�\�\�48$�\���qt���n�q\ny��zJܖ�Yi\�Y\��\�W�2L\�ut\0\�%�a�)Nb�\n A &�s���rŢ�Bg̘�w\�yU�H{\�(�#,,�F�2e0p\�@,Y�\�mΙ?�*��ŧb�.\�ܲJ{z!\�q,ʔ���\�^�\�o\�]\�\".\��\�WBfz\Zl����\�q1H��Ő�\�\�Q��\�O\��\�u\0�\nSҗnJJq@h�{��\�3С�l\�j�6@:ӦMS�k~;N7⯽��\"n*�Ґ\�~֬Yxo\�r��\��ڱ\�^8�֣?��\�k8\�\��?���koq+�[\�Z03�@\�\��)$1:u^�\�;\�sV�\�\�{\�Q\�-X\�9\�^��P\�#�(�\�q]ӗCLL\�\�ݟ�\'���1Fܽ��\Z�x欧\�(\�\�&�S���z�\�g�����7�ɢK4\nzJ.[�D%\�\������v��8�a(Kŕ]\�\�c\�bd$\'��Z�\��d<I£\��՘o�0�[u嫊��\r_�\0_\�\0Aw&����\\��=z�F�\Z\�\�+��1���J\�TQ@ȍ�~٬Lr\"�D3g\��#]\\\\�ʺ?,\'\�̐��©o臈\�\�V�\�\�xػ�\�\�Ǝ��^~�\�\�\�\�\0\�\"0��D�\��Y�s\�4t�\�)g��֥K8r�<p\�\0�\�\'��t\�\�\�\�ј]j�	cLr]\�\0�aǐ\�a��w�b��W��\�(�9�\�\�\���I|�/�L��D\�\�p3\�?-�>Ԙd5���R|\��\�\��\�c��@�(\ro�\0\�\"3B\��\\�d	B�v�CYY�\�A<�V1d\�k�W@m\r\�\�~\��Z\�ʕ\���S�\�\0���1��\�A*�\�\�\�efff��G��l�L��U@\�\�@��?���\�	�p\��c.V~7�J=5\�*-�?\��d\�\�\�7��A�n[���Z�\r�\��l@�dHH\�_�8˙h޺%\�P�M\'N��ꓗaנg�\"��M\�)WN\�ݎ�жm[)\�Ȫ�ǡ:o?w\�a�%I\�\\ 4\�\�׃��+\Z\�Y\�$�\�+ɀ�����\�\�\�[q\�\�%T\�9�\�=��#p\�\��m\��_\�\�E\�-4����1R\����D|\�r�\�vP�:�\�\�t@��3C�)4\�WcD���H�&?\�A\�Q)@�PMqII���EB��\�z�*\�DcL�eA \�5�\'+�������\�\�e�l��d���cl��\n�9i�\n��\0A�@C�\��\�J߾}M\���=*�W\04:_\�\�M}��7 4	c�\�DlYb\����[\�T�k@!@lf�\�L˫F)��\�%\�e�4�S^	~���\�ӀB��V{0\�D\'�\��<З�?=�զ�¤�\\\r(�c\�\�jV_@P�\�I\�M��nS9�\ZP\�%)oӷh@�@�1Zû���\�N<j\�(��\�\�\�_�lYܿ_�>Le�D\�˗n$?��3��\�\'ut���b*\���(�[[�J\�1(ae2B\�c)˼\��]\�\�EB�Շ�ഊR�j t=.\�\�24 j�����1QUK2 (&2*\n>ҏ8�\�\�ڔB�ʕ\rv+\�\Z�\�c��N@�@��71\�۷os_x9b�[&r��\�R$�TF\�\�\�`ff/N�\��(�M��G�[�Ҩ���]ۡvm\�$�9<c-�\�\�$?(4y�?x{{\�V}�\�ѷQc��M��\�p;,�Ji���\�S�hb}=�V�-�4U;���P@h4b\�x���I�GbL� \�\�/.�\�n(�\�\�Ԧ��?|�߿��\n��\�(�\�\�\�_��\�=\���B*J��������棨\�g�.\��<9&��\���\�\�KЀc,L\�<u\"@=]\nR\n�:T\�<888蚚�σ\�Fa�\�\�(W��\�v�ɇ��,\��}|�{w|F\�B��DO�v�\�\��7����=O(��\\�թ\\�\'l����#bƣą\Z��6 \�@H�w\"\�z�\�w\�LOr���T,���\'1Q�w�DvF:hDF\�GaA�E�\��$�A$=�\�E̍C[\�V\�Ε���+C�J��\���\�t�\����o]�C@\�c�i�G/��K�9=\0%�x*��#G⯿\��\�M��0u\�T��������;���\�^b\Z柏F\��\�Q�\�kHONă���O�8��+�~�S<�s�)h����	��k{�D���\�\n\rZp0�_�\�\��B��q\�_Tn\��\�\��\�Yh:||ZtB��v��q�\'\Z3fg\�\�o$\�y\�[����5�N+ A �\�4}#��Z� ƈ\�͛#((+V����\�` ]�r���o\�\�\�o\\�\�z\�I\�}x\�j��\�$03��s\'P�S_����\���W�1N*����\�\�L\�G\�AY\����ʭ�\�̚��Ԥ-\'%�ظ5�����\�\">>�\�SSm\�\�Eb��\�\�ԩ�\���b\n������\n\�\0֊}��8S_DRE,tr��L\�V\�\����\�prr�\�\�[�tQ�B,�\�_��!\�9{�e)[8x�G�߫a\�\�Γ�ؔv\�lyĩz�楧�[\��\�}([���\�\�	�]+��ա\�[�9C���q�x\�n�\n\rZ�s;�m�y\�١N�:hҤ�\�@D�|\�\�)��[�S@\�T�3t����UΝ;wP�re�\�U-�\r������\��\�\�\���\�/��:���\�Xr3�l8%$�\�6���s�y�u�Q�\��r[;��e)\�de�\�,�\Z\�\�GM@����\nA\�\�pTl�ԛ�\�K����\�\�!��:�\"R��͛7c�\�\�:\�\�\�\�\�\�R�b4c췼s~� 8Q��>�Q\�ʤO��\�ʩ@�9\�6��ܼ�/���\�B\��U\"\�⃑C$m\�b�.X�H1\�.\�\�s_�\�\01\n�\Z}� �ōrȑ\�\0�\�\�~��7o({�\�r�\�]|�\���맘�RAcN��扗���!��E|�d��\"�\0A\�u��\��\�Ϥ4�v�Ҍ�\�\�N��@7\�F� \�:T\�n�ȟ�\�\�W���\�\��õ\��\�3\�r(=%���\Ze�98��ϟ�\��B�&e%\"*z}� @З\����s\�N��\�:�����<m���,��UI�<<�\r\�\0lE6Ƌ\�&�Ч���j\"<<�?:p�<y���\�e��;�O驟�p���\��\�n��3	B�32�/J\�:�e\�#\��M\�\�d�k\�PT\�s�\�\�+�\�V�Zb3�[���\�\�F�\�\����D�^�\�s����R\�y�\0�e\\?t\�P2\"qy� t�_g\�*P��\�/��\0de���]D��\�_���g��u\�nd\��j-H\�f��^\�:�`\�\�Q�\�޺SLe!\Z6lس�%bs~@\�\�\�b\�ƍ�;w.g�\�ܹ���Gl��\�\�ի\�M\���+W�Y�ftcN�ada�\��\�\�V�Z=;P\�\�<\0\�;�\�+AC�\�PMc���\�\�F\� �\�1\�@\�ڵ��\�_|��\�۫\�R�\�\�\�I.y\�\��\�En�x��\�\��nPʴ��$\�\�[��ʰw\�^�|iE��pŊ�\�[1\�xxt~@P�F���s�\"�\�%\��\�[?  �g˙2e�ܦd՟?>7��\�\�_\�J�\�PM�Ÿ\���\�t\�ط\�B��=J)�8\0�\�J\\�8_TB���1b�\�!\��\�\�o\�YF\�g+� �l�ҷRV&)}\�C\�F,\���rc�i��n\�:%�W�\r�\"�h��\�|�M>]r�\0�VH�����|~P\nt�U\�\�>`%\\A\�,\�W\�\�E\��(�U׮]�~[��@\0h\�;��\�JQ�R�P\�ʔw�&@�4iOߦME��J >b�-\��n%/W��n�ɲ WL���A��M�xAWc\�9 A� @�:\�)Y\0A���\\���N#G\�)PQ��@\�Td\�F�0���ɿ��3 ^P�\r\�X�\\@\�\����IJ(@�&\�V��r\�D�=�b\�9�J4ٴ��\��l����^U\�e\����\�\�|\0�}�x|Je�v\�QȐ�ظm�Ff�b��z�P|\�\�\'\�\�\�1\��ȭ�	Zu\�2{H~�J�ſ\�J\Z\n�:t3\�\�\�}\�!\'\�~\�\�\�\�\�*3��\�g�֧�v. (���\�� �\�͝��\0An 	\�>��>Q�rY7l����\'��SX!��\�ر#�7�+?���\�\��eڲe�A\�\�=_�yL��i�\0�t䝡\0\�Y��wߒ�lB��§9��,D>\�^�V���G�E��W\'yq\�{�@�wo����\�\�y�o\'@PR�뒟&�i]\�r�R�\�\�\�\�\�\���`ϗ\��\�f /��֥P\�Qwf֜\�,��;\�*�\�\�\��\�1ą�\�~\Z~\�$�\�Q�\��ԣ:�D�[xJI1ӟ~��^�ߴ\�\�\nA�ن�	��n�\��\�Q\�R�\�\�6\�\�\�S��\�@Nf&G��B�\�ض\r��ƥ-�\�ۭ?|�\rD�\�\�u\�\"���\0g\�����\�A�:Mq\���؃\�� %!�J##�	bn]F\�I���o=\��d\"~��W�s��\\�\0D��.]��37� \��\�V��\�60f\�rj�\Z�½\�\�\�\�S�N.��k<}\�\����\�}\��\r\�|KĜA�4D)\�e��;	�^}�#B\�ݬ=bÂaik\�U\�\�\��\�ǌ\�x�\r\�/�;�>B\�)\\Դ2h\�\Zb�/�Qj���hŶ]\\\��e\Z{\�vL��k�x\�׃���F\�5\�d�c\�w0l\�.ΐq�\�t��\r.l^����a\�/��ǻ=�ƚð�u\�43�W\�E\��\�ݬG\�\�[�[Gw�vs�L�\�\�^{\r�j\�\��1Jŉ}N%���Xdq:*�RKiEšZ\������kD)\'\�\��{1�D�C��k\�\�\�\�//�̌b�4�ɣ\�6\0��\�Q[JY��~2�\���\�\�q籊\�J�Z�펮Ĵ\�)�*S{\Z\r N��U�ڔ�&\�\'.\�I\Z\nd�\��\���8�3\�!Drvq\�|��\�cf\�Vc\�m�\0q@9�*�\�z�&\�mھ{\�q�Z\�$❡qݐ�Kr]�n�K\Z0&\Z��C���\�ߦ�8p\�\�v\�\�	|0m��\�\�\�*�r\� \�/ǽ�W�w-rb%\�d\�m(�&��\nA$Y�G���J\r�x\�\�ۻ�\\�hc�\���\�v\�\�c\�ĉ�ěJJ�C��d}�hJ\�����h@�;��={�\�G\�b�P��\�.\\tߣGN�C����d\�\�Ө\0!w2\�\�S\"����1\\\�\�U\"��%1��\Zs.)mq�*�\�V�N�R�j��V�-ˋ-\������:j+���/^�\�6��\0Q���:�\�\�^y\�C>S_��\"\'��/\�M�!Ũ\0q��}S��Y�(F\�X���^\�\ZY+��\"���)F��LrIn�M�\�e�\�1�\��U�T\�������^*S�\�\�\�\�J���6B�\n�u%J= �\�d�l\�X\0q\09\���y�\Z5�|�0m�\�ǎ\�\�p2�% �n݊W���L\�6&��(�\Z\�E�+E\�w��&@\�}��\�ӗ ���1��\0�ɴ�\�\�\�\�\�8��\�\\��\�C�V9o�~u)ŕ��j֬\�\��\r}��tƗ��\�\�\�5\�\'@l -u�f\�&@\���Jk׀�W�C�a\�\��\���g\"@�@\�u�R�P\"���/�iˤ�6u��\r�\�\�\�O�U�G0{\�O�k:V��\�b*�\�t�\�J�!LV&9O��\�\���3g�q�^vwwG���u���\�\�\�\�~r�s���\Zh����k\�4PPryV\"\��9O��\�\�J�v��e\�[6y�d\�\�Og%\��[��\�t��R\�~�$?C� -���\�ӆ	\n+T\�\�(\�(]\���.�a)]\��(��zԨQ\�E�\�VR6�\�\��\�am\�2\�}p�T\�O\0\0\�IDAT�Ud/\rW�#�m=z�\�(<Ki\�#f�\�_��\�-ה\��ebVٽ{77�R\�i%v�uIwP���\�t\�\�;v\�\��A��g\�ر�xD\���\�B06<�j�8\��OSj\�\r#�I\�\�JI�!\�#bȦ��V�\�\\d)��\\�d���Dd��de��\\\"����9r�\"+\��[�O����=�3Ӊmq}. �\0Hv3U\�ʤ����K^��5o\�<\�tG���Y�,Y��)�̮�EE��R[�%�w\�n���,�9\����u� ����Ț5k@D`={�D�N��s˘\�\Z�b�M��J\�m�\�e�n\�r޼i��\r\�\�\0_I\�P)@ۡ\�\�\�S�N\�澗]\"##Q�|yUՠ\r\�\�\�>|8fϞ\�o����h\�8�\��`f\�r\���]jg<P\�fl�М�ٯJխ�\�+*@\�߿}��\�_LDЗݺ�\�ҢWڢ.>6�+D%\0aJw�o{\�}\�PR\� \�֭�q\�\�q��Zϖ\�r\�\�-,Z��̊9�Z\�\�S}���J2F��\�Y�;�����k��\�c\�s7�2�YdU�\�\�qu�$\�\�3Щ}[��^E:H\��\���i\���1�a^@\�\�K\�\�NHHP$��R\\�\�4w�BZy�Z�>��Kљ�:\��\Ztx��h|��\�\�K\0����uy��\�R�R)�����\�\�\�\�n�np��F�J5k\\\�b\�\�@\�;\��\�\'\�ߏ h�\'�	ʣ��\nQ�1�\�\0NL\�z�RV&�;\�R\��\�ǘ�i̚�j�oN%\�,�\r\�}���S���zF C\0����~�ʹs\��� %�$\�>�$�1\�=�����zc� ��En�\�s\�/`љ;�n��K�����^�O�\�03W��X\�CJy\���\�F\��\���\�ފ�;��q\�\�:\�J-@Qm�����]\�F:?\��\'n۶���\"%\�\�\�pm�\�����S\nJX�N�{?��o\���>�\�\'1:qwC\�ݴ=�=�A�\�u?�\�\�	��P\�\�G!7P��nu����\�\rs��Kw�\�Ԯ�кU+>�I�&�VI\�A�oBƂ&�\�g�a��\�EF�L�\��>\Z5j\���T�1���\�\0A�\�y�v�\�\r�2�8�Dd$\'!�\��T����\�pp-��\�td��\�\�\�\�OaS\�\�����{\���ƃ\�EJ�#���s++^&-\�1J9�AZb<O��\�-V6�NH��sǕ񬈴\�D8��Crl_zS�D�呕�\�?;0w2Z��������S�	;w$\�D£z=ָ� �ƭ�����+\�Q�V#ޯ�{9^ƣF=����3���;\�\"�\��\�F�JdE�\'�MMq..\\\��\\�\r�נ���.\���$鱅�E�9s\�pB��[��\0��&\�\0D\�\�k(S\�qwos \�\\��\�(t�p,��`\�\�\�\�*\">\�n��zF\�#�٥,���\�\�}�+��\�\���c1�}��\'S�jВ)�~.��\����\�$\�:��O\�AZR*5m����\"\"\�ju}\r�h�v\�f�\�\�G|�\��{q/�\�--\�s\�O\��\�x\�\�1���|�f�\���ś\�~	Z��)�)�ͻS�\"��ZXYZb˖-�y� \�0Kȴ�-S	������s{a\� B�\�\�(ACs\�\�<+D\�<��sŪ `P�\�\���\r��pp����\�\\\����K\�\�I�8��m��\�\��\�\"6\�6ʔ�\�@�ֶ\'\�^:\r33s\�\�\�I1�q\�\�U�iٕ�\������ԅH|�\'�1�\��i\��~\�P�ӫ8�h:\Z|��\�\���\\�-Z����^�nS\�sP\�\�&3-��\�<�wCP�\�p\\޵\r���\�S�\�S�և���\�]�`�1�\�\r\����O\n�\�1ִg%��\\Q��\�3� @rx6!;!��t���\�����&\�\�\�DNv6\�\nѿ饤zY\�ļfa\�0��BvF:\�-����\r��Y 3=��(�>׷\�k|5`nn\�ۢ�\�,,���\��Φ(Cj++ٙ�=��  #-�\�6\�H}\�=1�\��Q�\��\'=F�\�˨Һ+�\�\�\���U�����͛7�\�СCK��M\����߉1v�0@����fS\�P�\��/^\�b�p�o\�]^s�iL�C7�F\0$�\�[O\�HiC�\�\�1M��ٍI\�j�8\�\\�����4�\�-Ţcυ=h5��\r@t\�R�P\"6�bp��u3rZ\rT\�\�4�\'���\�;��;CM\0��P�3ƞ3[���ۇR�P*�n�޽��\�%45Q\��e�W\�\�\��ۣk�.\�r�F0\�n��Cy\�Q :8*v�JB	+\�ӝ�\0���0a\�FnM*�rx���>5k\�(�+�J\�/�1�BR�o�A�\�&f0�*�oV\n�c\�\�+\�R�-�[t�����\ryuC\�Iҁ����I*����;�#\�\�L��A��J\Z�qW��1�\�v�G\n\�L\0O�$J��MLr	P[����n��0k++әA��0\��Q\�ӝ�NQj�06�Y�\�S�\�R�|t�h�\�ʞb��3\�R�3� ;\0��k\�aaaM��k<E�	E�u\�}�f��&�b��:TK��T4\���!<b�x6\�\�\�)\�-\0\�\�K)@\�M�R�;\�t�\\) �ӥZ-=|�\�/Z:{�73?/�1���E�\0��1\�j)��vM�0�\��\�\�?�~	lZ��Y޿e��\Zb\0A�\�\�ºW\"��\�W\�ʤ�ڤ�6B�\�Qs�ǟ �ׇk~\�\\\�\��\�	�,�_\���g@l߾��^��L��\"�\Z��EGaU�S�9�\���\0��8I�ѣRqĮ]�83u�\�2�\n�З��8\rP�?\���\�힃u\��BhV�ox\�Ց�ϕJ\0/�/�˜>}\Z�k\�\�\�Oqs\�\�\�[�EQhӦM����\�\�0��EG��_1�V\�pF����\0\��7j�jt����A\��\�\�\�GE�1\n�\'��֋\�Sb� ��%�\�\�ѷo_I�\'L��>�g׮]E%\r\�*��Y)����8\�իW�_�~�Xo�nѵ��\�\'� J�D�C~�����@���\�ذaw!!\'J�\�O?!))�\�0��\Z8z�h\�Ν;S>v��/ \�;�R�<G� \�&\�\��\��\�\����Q\�\�\�V�\�t���\�s�\"\�h_;a\�\�9dU5��16FlzB�JP@\�Ҽ(��jچ��\�oF�\�\�;N�:�q��Pyq\�\�1��\� \�IT\�@%\�\�]�=\�\r\r(\�x���\�VRS9 \��T9;;\�\�@z���i�Իwo�\'�p�\�fU�H)�L��f2\��\�{\"d[ܯ�$\��,8th5&9�<OEIi�D�IM�6Exx8\�i4����1\�j\�;hI�Ь�z\�\�`\�\�\�# H�u�m%�)w���7o�Ȫ���_��c\�;_9��\\�7���1q\��44\�\n\�\�3�R�r�]�\�of�I�iK�\�!�`�R�j���ZW�^E�V�80\�ϟ��\'\Z\�s�,\\\�t\��\�P�mo\�:����:m����)\�\�>��\��\�vMѭ[WE\�{���e\0����K 4�\�܇�\��\����Z�l\�/\�Ξ=kp�.�s\�h\��\�6V�EO�H��{\�Z[\�b\��\�+F|\\T\�X�~?`�k�$QՂ���V�VM\�\�|C\n\nB�ꅆ^8\�_��g�̽�\�ؑ�C\']\��M?�f*H�M\��۴\"ڴ~\�^\�ecLg�ga:�\rj<44�=oo\�\�r�-\�\�D&Mb�&PP�u%X@\�\�g߾}\�c�\n�[��b�r�\��\�w\�\r0X�E\�1I�2\�\�\�X�(\�]��\0x\�	�\"XD��W�\\\�wdڤ�\�j^���\�𭅁/H��\��\�\Z�m�xJ��\��]\��Di\0\0�\�DRD* \�\r\"��l�j�\�\��30~�x~�F�\�\�xw\�u�\\�\�Z�+QPRa\�h}t\�&\�Vx\�\�A�ߥ�8���u)$\�D�2D�O�\�̟rl]>\'J��DЉ=�j\�\n�e�\����\�yh��GR\\\�`���G�(\�*�7Qr\�H��3$ h�\�\�ɠ�ڦQ���}��?�	fn�r�#-\�1R\�caYʆ��ǆ�r\�.\�\�\�\�\�0<��\�/��G\�O�����\�I�\�LK�O�N8�r.���\�Q�q[<�Ι�=\�#6�6g�9uiO`\�\��\�uy�0���y\�\��a\�R��^\��\���Qr\�\�k\"	��ĵ���J�LUdB�:u*w��U�V�\� S/�#]\n\�\�\�\�9 <k5DB\�]\�J\�p\�\�C\��\��\�\�7.�ɫ2O�B�%\"\�\�\�ˇg+��i\�\�k��Ӈ\�\�\�y8�f!�\�_n+;�\�\�x5n�+;֣��	ضnU|y	J\�rh\�\'�\�\�M������ۄ�Y0�\��s������N�:\\�*J#\�\�%�\�W\ZP�0J�A\�jG)@�\���%K�\�7\��\�7mB�I��{��f\�}\�\�S�\�DVfOΒ��g�\�\�$D�sP4cR\�!5)�\�\�ӷ!]c�lx�\�\��?\��\�]ݳ	5��G|D\�Z���K��|Kt�\�\�\��:N��\�材����Ux�-{w\��s\�*p�Z�\'^98w�\��L\�7n\��\�=�q#(���\�M\"\�\�P\�\�.\��(mo�������37�\�aṥu��|� �\�\�\0Z\�3R��\�M\�\0A�;㬏з=��V�b\�S�E�\�\�ĺ��Ř�AHOI\�\�Q\"\�*ы���\������\�\r��\�`ic\���\�-���,C\����\�\�\�\�Yi03\'o{M�J���÷VY\���B�]2RS��Q)I��AmP�J\�BշOy\�%n�>��*5�[\��|>�fn�y\���ϢD�\�&�\\���\�\�ͪ�k\�Nb@�-cl�>\�WLYU\0�Y%��\0�x�%\�R\0A�寿�Z\�X�\�ڭ;�}�\�h�\�_Y:;�A\�y�o\��g��M�C��\r���\�\nKۺ\0f\�7\��\�d��z˿�16L\�q�)�\Z 4�\�\����P�\�\n���8��p\Z-v�+}�\"�g\�Ѿ�^}\�ع\�\�\�T��\�Dz5����?~F\�^�y�K]����Х�b�UY	Oh\�h����\n\r(\�nB����\�G\�\���\�\�?-C�GxԐ�I\Z@����~�\�\\���V�C�O{\�\��V\�慍\�P�\� �+Dn[GNŎyӞmI���#c,RL�Rʨ\r((۹\�7M*s�g:R6H:[L��s���l0X\�9\�ߖ\�o�:4:� +����=�סB�\�\"~_\�.1\��@S�ti�\�~%g\��������y�~>)Hr\�7y?\'@Tm\�e\���?�\�X%�47\�g#�\�g\n8{�|m��2\�TMm@h@��� �\�(鈫k\��LmB. \�%:q\��S2D9�\��������a�S\�\�\�\��tWiX\�\�\�@\���pF\Z�\r� \�2s]f+\�ɘL�N�DFJ2\��{iI�p��3�\�Š�O\r\�=U\��@��)�T��\n�qu\�f�v\�P���ب5\�_��k����gE�c;35��l\�0j��@\�o����\�M\�$c�\�D\�\�	���Y�`�Ѐb6�\�d���\�\�\0A\�hb\�wd�\'s+1h���hn\�g\�t��v�J\�e�.\�\�?\�)aeDDw�l7f\nʴ釸�;\�\\\�հ%7!?�}�ͻ�>O�\�޾kką\�F\�w��;�\n\rZ �\�ػ�\�I\��ߑ��\�曆F�D$˓[U_$FG�t9/XX�\�F���\r��7cl�!�iP@h@1�\�JNN\�\n�\�X��E/\Z��<y�fg\�;\��ݼy��\�\�\�1֭��\�e\�>Oz_�l<��[�\�xrv\�n|���cY/��;�v\�fr@x\�j��\�x~�r�\0�G\'\�^3#�\�^�҄�;�\�-:!\�^_u�E�r�.�sv\��~�1i�X	\�\��Ѐ�n��e�\�wLL����\�i; r\'@\�r@=ڸ�Q\�lG����\�g	;;;\�z�\�I��\��\�f\0\�k֫Qk~�HM|\�W�\�;ף�\�1<�}\�\�H��݄�f�)\��\'Q�^3\��?�\�3GP�M7Tm\�!g��N-ߜ\�W��\�\'<�w�\�@��\�\�\�S\�e�{m�\nzNE\r(�0-\�\�^\�V&�ȓY�\�*���̴\�$\�b\�u�\\��0n:\�\�΄���]\�;�ޅ�KQ��]]���\�WrH,hKwm\�&,\Z޹����A�Iy\�Wd�Ѐ��\\�\�PI͓\�=r\�h�	�\���e�\�v�YL�5�\�4�åc�T?@k\��B�g\�g&@D\��x\�\�3\�t\�g�\�RG\',���m��:\\U\�ja�(r@h@A\�\\[\�PG\�]�Jq9C��\�Jַ\�S�C�q��ǭT�쬌S	�7^_>��j�nb\�o�Ѐ�EFF\�VVV�\�<o�\�\0\�pmԨѳ-���\�\�\��\�+\�z\�,\�\��)\�V�4Uh\�\�v\�\�#B\�\�͟���;�>:6\Z@h@A��kP��h)��\�\�mڴ���\'\"##q\�\�NoY�\�%\�݋D�\�;Wט��m\�ڵx\��x\�\r\�סg\�\�prr~�*��]��\�^��\�X\�\�F�\�A\n���\�N�8\0�\�!Ȭ<l\�0N\�\\�jU4i�X��XU���/X�\03g>\�¶x�b�\�\�EV\�\�\�N\�(�Y-\����	@�ei��\�2e\n\'R3f\�*�B�X�p!�=/\0�\�\�]%#ݔң\�B�\�\��\�\�vq\0͇\�h\�\�\�\�ƍij%SzZ!\�!\�\n�!�\Z\�3j@\�\�B��,y\�\Z��q䃇(\�R��e�\�*�\�F��\�2\�\"\ZH��FOm^�F?\�$g�u\�\�q\'Ar\�\�\0\"\�\�\�\�=%�b\�TF�\0�f�\�q!7ʄ\nt��ڵ��j�\'V������J�܇Kl)\"\����f>\\ŕ���\�}۶m��ʕ+�:w\�<a\�ȑ�H\�Du,�P��d_@�O��V���;�!8պ\�\�ws\�F�i\�\�ݺ)>N7�1�bŊ��V\r<ޢ�e�3QA�\0 %{\�iG��D��\�\�Y�?\�cE�]��2�\�[\�[6Won�\�@;�\�\�_*��Kj�X��g(�R!i\�\nV�3w.\�7{W\�|\n:{\'�>�k�8�1� \0ӥ$+1�yk@h�Q\�\�A,\\\�C\�d>	�r�\�^z�������\�ĽJ\r^lD\�n\�6�b�\\�\n�\��\�\0\�\ZJ\�t�KV�f-[a��\�\�Uڎ�\n�\�[�(��� �q,�z��\0�\Zuy�\��\�[1�.\�\�e%�o�\��i�3*1�\�\�\�ࣧ��*\n\�^\�\��\�e\�Rd��\���\0\�\�\�\�N�F�Wqm\�f�U�\�.��sl\� 5!�G�ņ��lyD]9�oN¹u�Q�S��\�}[\�\�C�D�Rb\�U�zn\�tN��1Vb�m�8@\�Qi~�&0BBBx6\��_G\�9ka\�\��V���x>�\�\�\'�\�\'r\�f\�\�q@ܽ�\Z\r|�3\�\�\�ek\�G�\��?�s�\�\��*�/��:�\�Ή���\�9<M��K}c�E�� [�n}FD\�bU�\�\"0\�l1^��9��\�z�\�]0`�v\�\�q�4<k7\�/y\�Z\r8u\�GP�I[D^9ϩ+�\�S`\�\��I���>6\���\�{g9�wbL\�T�ƺ�M�\�^\�Oy/�@��w	c�\\/J��x@\��R�AJ>IZ	\�<\�⽃�;\'A\��>��\r\�/\�U3�9}kS,2q��\�.��\�b�����=*\����Emz}�\��7��\��\�\0\"0�5��)\�_~|$�)�MEF����\�\�<�\�\�8�X����JLq5\�e\�j\�؋~&j�f$m�t�ȫw\�\�P\0�#Y(�J�Iߠ\�اޝJ\���\�\��ن��%2)�\��Tbŭ��\ZyV\rr	�0V�[p�e\�m\�k��\�ig&OBO\�\� \�R\��J/y\r��\r`;����C⪔\�R&@\�{�� \�\��\0=t���Z�fk\�\�-�O.�t[\'\�9�O�\�\�D\�MT*5\�\�\�1b\�@n��\\��^\�\�1��(�͚\0�\�	�@I_(\�u]��\�\�q\��\�E|r\ZO�%V�\�l�8\�����*TP:ad�8\08\�(c,D\�^�r&@\��\�A�d\�\�4Аr#\�ل\�\�\�\0P\�52����$\�\�țD�L����`�.\0\�\�H~U\�\0T\���\�\��N>d\�\r��n\0�\��\�&����ٲ�\�S\nR\0\0\0\0IEND�B`�');
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
INSERT INTO `customer_group` VALUES (1,4),(50,4),(100,4),(101,4),(150,4),(200,8),(250,8),(300,8),(301,8),(350,8),(400,8),(450,8),(451,8),(500,8),(550,8);
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
INSERT INTO `cv` VALUES ('16e7e90b-0adf-4f38-9561-b120680c1051','Thôn Kỳ Tân, xã Đức Lợi, huyện Mộ Đức, Tỉnh Quảng Ngãi','Intern Java',550,'ndlong28@gmail.com'),('92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Thôn Kỳ Tân, xã Đức Lợi f','Senior Intern Javaf',451,'ww@gmail.com');
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
INSERT INTO `cv_skill` VALUES ('98d25fd2-eea2-4563-871f-c55b5e3b34cb','fdsfdsfdsfdfdsfsdfsdfsdfdfsdfdfds',0,'dfdfadfsdfdfdfsdfdfsdfdsfds','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e',16),('e6883b7d-6c1c-48ca-b95d-317d4bf9a990','Vadasdas',0,'Java','16e7e90b-0adf-4f38-9561-b120680c1051',17);
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
INSERT INTO `education` VALUES ('681b7fcb-2ee5-4922-90f4-16404d0986a0',NULL,_binary '\0','Học sinh chứ gì nữaf','Trường THPT Số 2 Mộ Đứcf da update','2023-11-02 00:00:00','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e','Tao là trùm trường m có ý kiến gì ko'),('c98ab3e9-d21c-4679-a9fd-840a3a560314',NULL,_binary '\0','Công nghệ thông tin','Đại học Nông Lâm TP.HCM','2023-08-16 00:00:00','16e7e90b-0adf-4f38-9561-b120680c1051','FAFAFS');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_review`
--

DROP TABLE IF EXISTS `employer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer_review` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATE_AT` datetime NOT NULL,
  `RATING` double NOT NULL,
  `UPDATE_AT` datetime NOT NULL,
  `ALUMNUS_ID` bigint NOT NULL,
  `EMPLOYER_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkfke39jt4efxmh45dh8bcdlt` (`ALUMNUS_ID`),
  KEY `FKj284epqiqfcbsa3x9wlmeyjll` (`EMPLOYER_ID`),
  CONSTRAINT `FKj284epqiqfcbsa3x9wlmeyjll` FOREIGN KEY (`EMPLOYER_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKkfke39jt4efxmh45dh8bcdlt` FOREIGN KEY (`ALUMNUS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_review`
--

LOCK TABLES `employer_review` WRITE;
/*!40000 ALTER TABLE `employer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_review` ENABLE KEYS */;
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
INSERT INTO `experience_description` VALUES (1,'none-ex','Chưa có kinh nghiệm',NULL,NULL,NULL),(2,'less6','Ít hơn 6 tháng',NULL,NULL,NULL),(4,'m1y','Hơn một năm',NULL,NULL,NULL),(6,'kinhnghiemtest','Kinh nghiệm test',NULL,NULL,NULL);
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
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE_FILTER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
INSERT INTO `filter` VALUES ('32ade3e3-2938-11ee-826d-ecf4bb5dfca9','lastest','Công việc mới nhất'),('32ae0d1a-2938-11ee-826d-ecf4bb5dfca9','update','Công việc mới cập nhật'),('590d77c8-2938-11ee-826d-ecf4bb5dfca9','salary','Lương');
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
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
  `DATE_MODIFIED` bigint NOT NULL,
  `DATE_RATING` bigint NOT NULL,
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
INSERT INTO `job_rate` VALUES ('2f6269af-0b9d-4604-bbcc-bda2374de8c0',NULL,20230725213745,20230612221849,0,451,2),('48e4a2f5-10ad-4c29-b74e-07e2055c0434',NULL,20230730215323,20230719075958,0,451,100),('89ddc7db-c596-4f2d-a095-340a64f096dc',NULL,20230730205546,20230730205544,0,451,253),('c2c0cc03-e43f-4713-a7ba-1520592f5070',NULL,20230612223013,20230612221900,0,451,151),('e30202e6-3bbb-11ee-bb01-ecf4bb5dfca9',NULL,20230816053424,20230816053424,0,550,403),('e302d021-3bbb-11ee-bb01-ecf4bb5dfca9',NULL,20230816053424,20230816053424,0,550,404),('e3037963-3bbb-11ee-bb01-ecf4bb5dfca9',NULL,20230816053424,20230816053424,0,550,405),('e3042e9c-3bbb-11ee-bb01-ecf4bb5dfca9',NULL,20230816053424,20230816053424,0,550,406),('e304fe68-3bbb-11ee-bb01-ecf4bb5dfca9',NULL,20230816053424,20230816053424,0,550,407);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_description`
--

LOCK TABLES `location_description` WRITE;
/*!40000 ALTER TABLE `location_description` DISABLE KEYS */;
INSERT INTO `location_description` VALUES (1,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(2,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(3,NULL,NULL,NULL,NULL,1,1,1),(4,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(6,'thôn kỳ tân',NULL,NULL,NULL,2,1,1),(7,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(8,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(9,'thôn kỳ tân',NULL,NULL,NULL,3,1,1),(10,'thôn kỳ tân',NULL,NULL,NULL,4,1,1),(11,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(12,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(13,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(14,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(15,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(16,'dsdsdsadasd',NULL,NULL,NULL,4,1,42),(17,'dsdsdsadasd',NULL,NULL,NULL,4,1,42),(18,'dsdsdsadasd',NULL,NULL,NULL,4,1,42),(19,'1cdcscdsv âfs',NULL,NULL,NULL,4,1,41),(20,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(21,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(22,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(23,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(24,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(25,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(26,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(27,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(28,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(29,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(30,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(31,'thôn kỳ tân',NULL,NULL,NULL,1,1,1),(32,'thôn kỳ tân',NULL,NULL,NULL,1,1,1);
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
INSERT INTO `location_product_entry` VALUES (2,3),(100,8),(151,9),(200,10),(201,11),(251,12),(252,13),(253,14),(303,15),(304,16),(305,17),(306,18),(307,19),(350,20),(400,21),(403,24),(404,25),(405,26),(406,27),(407,28),(408,29),(409,30),(410,31);
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
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `TOTAL_RATING` double DEFAULT NULL,
  `BACK_GROUND` longblob,
  `NUM_OF_EMPLOYEE` int DEFAULT NULL,
  `SOLOGAN` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
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
INSERT INTO `position_product_entry` VALUES (201,1),(251,1),(252,1),(253,1),(303,1),(304,1),(305,1),(306,1),(307,1),(350,1),(400,1),(403,1),(404,1),(405,1),(406,1),(407,1),(408,1),(409,1),(410,1),(2,3),(100,3),(151,3),(200,3);
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
  `STATUS` int DEFAULT NULL,
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
INSERT INTO `product` VALUES (2,'2023-05-17 08:01:55','2023-08-15 06:42:29',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job2','job2',0,2,NULL,2,NULL,NULL,1,0),(100,'2023-05-17 09:13:36','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job5','job5',0,2,NULL,2,NULL,NULL,1,0),(151,'2023-05-20 17:16:08','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job9','job9',0,2,NULL,2,NULL,NULL,1,0),(200,'2023-06-17 16:58:27','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63b5e8-f7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63b5e8-f7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(201,'2023-06-17 17:13:08','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63b5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63b5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(251,'2023-06-18 20:58:52','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfasfb5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfasfb5e8-dfdsdsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(252,'2023-06-18 20:59:23','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfasfdsdsddsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfasfdsdsddsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(253,'2023-06-18 20:59:44','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(303,'2023-07-30 21:31:27','2023-08-15 06:40:20',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'thuc-tap-sDSDSDASDSinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9','thuc-tap-sDSDSDASDSinh-web-7a63sfsfacscsdcsfdsdsddsf7ef-4357-9fab-693c72ca68a9',0,2,NULL,2,NULL,NULL,1,0),(304,'2023-07-30 21:41:23','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-07-30 00:00:00','M','hour',NULL,NULL,NULL,'cong-viec-test-c834502a-520a-496f-b9f7-cd57dcbe09e4','cong-viec-test-c834502a-520a-496f-b9f7-cd57dcbe09e4',0,2,NULL,2,NULL,NULL,200,0),(305,'2023-07-30 21:41:25','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-07-30 00:00:00','M','hour',NULL,NULL,NULL,'cong-viec-test-2919e147-9c5c-46be-acaf-b6548aba67f3','cong-viec-test-2919e147-9c5c-46be-acaf-b6548aba67f3',0,2,NULL,2,NULL,NULL,200,0),(306,'2023-07-30 21:41:31','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-07-30 00:00:00','M','hour',NULL,NULL,NULL,'cong-viec-test-37414150-28c3-4f11-95cb-1baaf619b652','cong-viec-test-37414150-28c3-4f11-95cb-1baaf619b652',0,2,NULL,2,NULL,NULL,200,0),(307,'2023-07-30 21:45:39','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-07-30 00:00:00','M','hour',NULL,NULL,NULL,'cong-viec-vippro-3c8bfe30-2a3b-4417-8ccc-fed560286dbc','cong-viec-vippro-3c8bfe30-2a3b-4417-8ccc-fed560286dbc',0,2,NULL,2,NULL,NULL,200,0),(350,'2023-08-15 04:56:33','2023-08-15 06:13:00',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'job1','job1',0,2,NULL,152,NULL,NULL,1,0),(400,'2023-08-15 20:57:58','2023-08-15 20:57:58',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'fdcacb01-26b3-4133-8207-2f164ba86981','fdcacb01-26b3-4133-8207-2f164ba86981',0,2,NULL,152,NULL,NULL,1,0),(403,'2023-08-15 20:58:02','2023-08-15 20:58:02',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'346d0b91-8d30-43cc-9b78-147ac909a57c','346d0b91-8d30-43cc-9b78-147ac909a57c',0,2,NULL,152,NULL,NULL,1,0),(404,'2023-08-15 20:58:04','2023-08-15 20:58:04',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'bbd8cab7-6e5c-460f-b2f9-6ff1712db3b3','bbd8cab7-6e5c-460f-b2f9-6ff1712db3b3',0,2,NULL,152,NULL,NULL,1,0),(405,'2023-08-15 20:58:05','2023-08-15 20:58:05',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'7aa467de-7b36-4786-8fd6-f0cf5a5234f3','7aa467de-7b36-4786-8fd6-f0cf5a5234f3',0,2,NULL,152,NULL,NULL,1,0),(406,'2023-08-15 20:58:06','2023-08-15 20:58:06',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'88938ce4-320d-4bcb-85a1-57e582698ff6','88938ce4-320d-4bcb-85a1-57e582698ff6',0,2,NULL,152,NULL,NULL,1,0),(407,'2023-08-15 20:58:08','2023-08-15 20:58:08',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'d326b3e7-eaa3-40ff-b7bc-dd3cf0c081b2','d326b3e7-eaa3-40ff-b7bc-dd3cf0c081b2',0,2,NULL,152,NULL,NULL,1,0),(408,'2023-08-15 20:58:09','2023-08-15 20:58:09',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'7e5db8f6-f000-4264-8dbb-8f827e3126ad','7e5db8f6-f000-4264-8dbb-8f827e3126ad',0,2,NULL,152,NULL,NULL,1,0),(409,'2023-08-15 20:58:10','2023-08-15 20:58:10',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'f53e634e-2bbe-4357-b5d0-4755f66e2324','f53e634e-2bbe-4357-b5d0-4755f66e2324',0,2,NULL,152,NULL,NULL,1,0),(410,'2023-08-15 20:58:11','2023-08-15 20:58:11',NULL,_binary '',NULL,'2023-11-30 00:00:00','2023-05-22 00:00:00','M','month',NULL,NULL,NULL,'04556d44-5fa9-4e08-a1b1-b827ea115db9','04556d44-5fa9-4e08-a1b1-b827ea115db9',0,2,NULL,152,NULL,NULL,1,0);
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
INSERT INTO `product_availability` VALUES (2,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,2,NULL),(100,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,100,NULL),(151,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,151,NULL),(200,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,200,NULL),(201,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,201,NULL),(251,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,251,NULL),(252,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,252,NULL),(253,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,253,NULL),(303,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,2,303,NULL),(304,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',12,1,1,_binary '','*',NULL,NULL,2,304,NULL),(305,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',12,1,1,_binary '','*',NULL,NULL,2,305,NULL),(306,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',12,1,1,_binary '','*',NULL,NULL,2,306,NULL),(307,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',12,1,1,_binary '','*',NULL,NULL,2,307,NULL),(350,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,350,NULL),(400,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,400,NULL),(403,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,403,NULL),(404,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,404,NULL),(405,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,405,NULL),(406,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,406,NULL),(407,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,407,NULL),(408,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,408,NULL),(409,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,409,NULL),(410,NULL,NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1,1,1,_binary '','*',NULL,NULL,152,410,NULL);
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
INSERT INTO `product_category` VALUES (2,50),(100,50),(151,50),(200,50),(201,50),(253,50),(303,50),(304,50),(305,50),(306,50),(307,50),(350,50),(400,50),(403,50),(404,50),(405,50),(406,50),(407,50),(408,50),(409,50),(410,50),(251,51),(252,100);
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
INSERT INTO `product_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:04:35',NULL,'Đã chỉnh nội dung','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Con mẹ nó','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Nó là sản phẩm đặc biệt','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,151),(7,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,200),(8,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,201),(10,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,251),(11,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,252),(12,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 1','Đây là sản phẩm mới 1','string','string',NULL,NULL,'string','string',4,253),(16,'2023-07-30 21:31:27','2023-07-30 21:31:27',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,303),(17,'2023-07-30 21:41:23','2023-07-30 21:41:23',NULL,'<p>sdsdasdsadsadsadsadsa</p>','Công việc test','Công việc test','string','string',NULL,NULL,'string','string',4,304),(18,'2023-07-30 21:41:25','2023-07-30 21:41:25',NULL,'<p>sdsdasdsadsadsadsadsa</p>','Công việc test','Công việc test','string','string',NULL,NULL,'string','string',4,305),(19,'2023-07-30 21:41:31','2023-07-30 21:41:31',NULL,'<p>sdsdasdsadsadsadsadsa</p>','Công việc test','Công việc test','string','string',NULL,NULL,'string','string',4,306),(20,'2023-07-30 21:45:39','2023-07-30 21:45:39',NULL,'<p>Đây là công việc cực kỳ </p><h1>ĐÂY LÀ NHỮNG GÌ MÀ CHÚNG TA SẼ LÀM VIỆC </h1><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/spNpLl9NslA?showinfo=0\"></iframe><pre class=\"ql-syntax\" spellcheck=\"false\">package com.salesmanager.shop.store.api.v2.system;\n\n\nimport java.util.List;\n\n\nimport javax.servlet.http.HttpServletRequest;\nimport javax.ws.rs.PUT;\n\n\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.http.HttpStatus;\nimport org.springframework.http.MediaType;\nimport org.springframework.http.ResponseEntity;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.PutMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n\nimport com.salesmanager.shop.store.facade.system.SystemFacade;\nimport com.salesmanager.shop.util.NotificationDto;\n\n\n@RestController\n@RequestMapping(value = \"/api/v1\")\npublic class SystemApi {\n\n\n	@Autowired\n	private SystemFacade facade;\n\n\n	@GetMapping(\"/auth/notification\")\n	public ResponseEntity&lt;List&lt;NotificationDto&gt;&gt; getNofForAlumnus(HttpServletRequest request) {\n		String username = request.getUserPrincipal().getName();\n		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)\n				.body(facade.findByRecieverNick(username));\n	}\n\n\n	@GetMapping(\"/private/notification\")\n	public ResponseEntity&lt;List&lt;NotificationDto&gt;&gt; getNofForEmployer(HttpServletRequest request) {\n		String code = request.getUserPrincipal().getName();\n		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)\n				.body(facade.findByMerchantStoreCode(code));\n	}\n\n\n	@PutMapping(\"/auth/notification/opened\")\n	ResponseEntity&lt;String&gt; changeIsOpenedAlumnus(HttpServletRequest request) {\n		String nickname = request.getUserPrincipal().getName();\n		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)\n				.body(facade.changeIsOpenedAlumnus(nickname));\n	}\n\n\n	@PutMapping(\"/private/notification/opened\")\n	ResponseEntity&lt;String&gt; changeIsOpenedEmployer(HttpServletRequest request) {\n		String mail = request.getUserPrincipal().getName();\n		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)\n				.body(facade.changeIsOpenedEmployer(mail));\n	}\n}\n</pre><ol><li>dsdasdsadasd</li><li>dsadasdasdasd</li><li>dsdasdasdas</li><li>dsda</li><li>đ</li></ol>','Công việc vippro','Công việc vippro','string','string',NULL,NULL,'string','string',4,307),(21,'2023-08-15 04:56:33','2023-08-15 04:56:33',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,350),(22,'2023-08-15 20:57:58','2023-08-15 20:57:58',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,400),(25,'2023-08-15 20:58:02','2023-08-15 20:58:02',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,403),(26,'2023-08-15 20:58:04','2023-08-15 20:58:04',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,404),(27,'2023-08-15 20:58:05','2023-08-15 20:58:05',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,405),(28,'2023-08-15 20:58:06','2023-08-15 20:58:06',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,406),(29,'2023-08-15 20:58:08','2023-08-15 20:58:08',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,407),(30,'2023-08-15 20:58:09','2023-08-15 20:58:09',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,408),(31,'2023-08-15 20:58:10','2023-08-15 20:58:10',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,409),(32,'2023-08-15 20:58:11','2023-08-15 20:58:11',NULL,'Caused by: org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]; nested exception is java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: PositionDescription is not mapped [select distinct pd from PositionDescription as pd where pd.code=:code]','Đây là sản phẩm mới 12','Đây là sản phẩm mới 12','string','string',NULL,NULL,'string','string',4,410);
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
INSERT INTO `product_price` VALUES (2,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',2),(100,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',100),(151,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',151),(200,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',200),(201,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',201),(251,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',251),(252,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',252),(253,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',253),(303,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',303),(304,'base',_binary '',NULL,1212121.00,NULL,NULL,NULL,'ONE_TIME',304),(305,'base',_binary '',NULL,1212121.00,NULL,NULL,NULL,'ONE_TIME',305),(306,'base',_binary '',NULL,1212121.00,NULL,NULL,NULL,'ONE_TIME',306),(307,'base',_binary '',NULL,1234567.00,NULL,NULL,NULL,'ONE_TIME',307),(350,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',350),(400,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',400),(403,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',403),(404,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',404),(405,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',405),(406,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',406),(407,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',407),(408,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',408),(409,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',409),(410,'base',_binary '',NULL,50000000.00,NULL,NULL,NULL,'ONE_TIME',410);
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
INSERT INTO `product_price_description` VALUES (2,'2023-05-17 08:01:55','2023-05-17 08:01:55',NULL,NULL,'DEFAULT',NULL,NULL,4,2),(4,'2023-05-17 09:13:36','2023-05-17 09:13:36',NULL,NULL,'DEFAULT',NULL,NULL,4,100),(6,'2023-05-20 17:16:08','2023-05-20 17:16:08',NULL,NULL,'DEFAULT',NULL,NULL,4,151),(7,'2023-06-17 16:58:27','2023-06-17 16:58:27',NULL,NULL,'DEFAULT',NULL,NULL,4,200),(8,'2023-06-17 17:13:08','2023-06-17 17:13:08',NULL,NULL,'DEFAULT',NULL,NULL,4,201),(10,'2023-06-18 20:58:52','2023-06-18 20:58:52',NULL,NULL,'DEFAULT',NULL,NULL,4,251),(11,'2023-06-18 20:59:23','2023-06-18 20:59:23',NULL,NULL,'DEFAULT',NULL,NULL,4,252),(12,'2023-06-18 20:59:44','2023-06-18 20:59:44',NULL,NULL,'DEFAULT',NULL,NULL,4,253),(16,'2023-07-30 21:31:27','2023-07-30 21:31:27',NULL,NULL,'DEFAULT',NULL,NULL,4,303),(17,'2023-07-30 21:41:23','2023-07-30 21:41:23',NULL,NULL,'DEFAULT',NULL,NULL,4,304),(18,'2023-07-30 21:41:25','2023-07-30 21:41:25',NULL,NULL,'DEFAULT',NULL,NULL,4,305),(19,'2023-07-30 21:41:31','2023-07-30 21:41:31',NULL,NULL,'DEFAULT',NULL,NULL,4,306),(20,'2023-07-30 21:45:39','2023-07-30 21:45:39',NULL,NULL,'DEFAULT',NULL,NULL,4,307),(21,'2023-08-15 04:56:33','2023-08-15 04:56:33',NULL,NULL,'DEFAULT',NULL,NULL,4,350),(22,'2023-08-15 20:57:58','2023-08-15 20:57:58',NULL,NULL,'DEFAULT',NULL,NULL,4,400),(25,'2023-08-15 20:58:02','2023-08-15 20:58:02',NULL,NULL,'DEFAULT',NULL,NULL,4,403),(26,'2023-08-15 20:58:04','2023-08-15 20:58:04',NULL,NULL,'DEFAULT',NULL,NULL,4,404),(27,'2023-08-15 20:58:05','2023-08-15 20:58:05',NULL,NULL,'DEFAULT',NULL,NULL,4,405),(28,'2023-08-15 20:58:06','2023-08-15 20:58:06',NULL,NULL,'DEFAULT',NULL,NULL,4,406),(29,'2023-08-15 20:58:08','2023-08-15 20:58:08',NULL,NULL,'DEFAULT',NULL,NULL,4,407),(30,'2023-08-15 20:58:09','2023-08-15 20:58:09',NULL,NULL,'DEFAULT',NULL,NULL,4,408),(31,'2023-08-15 20:58:10','2023-08-15 20:58:10',NULL,NULL,'DEFAULT',NULL,NULL,4,409),(32,'2023-08-15 20:58:11','2023-08-15 20:58:11',NULL,NULL,'DEFAULT',NULL,NULL,4,410);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (16,'Làm giams đoc\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nvvCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luônCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn','Con mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn\nCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luônCon mẹ nó, kdsdasdasdasdsadhông sadsadasbiết nói sao luôn',NULL,200,50,451,2,1,1),(17,'Cập nhật 17/7: \nsửa các api có ảnh chuyển từ base64 sang link (Xong)\nLàm thêm api lấy công việc đã ứng tuyển, và công việc đã quan tâm (Xong)\nCập nhật 18/7 :\napi lấy top nhà tuyển dụng k có banner, slogan (Xong)\nTrang home chưa gọi api phần ntd nổi bậc và công việc (Xong)\nthêm code nhà tuyển dụng vào api top nhà tuyển dụng (Xong)\napi lấy thông tin hồ sơ mong đợi như bảng dưới, m xem rồi sửa giúp t, coi trường nào k hợp lý thì sửa sao cho dễ là dc (cập nhật ảnh đại diện thì k cần sửa tại nó dùng chung với cập nhật ảnh bên cv rồi, còn cập nhật background chưa có.Nếu có làm backround thì bỏ riêng 1 api khác ) (Xong)\nv1/private/recruitment/2 sửa thành id thành code, thêm tên ứng viên (Xong)\nTrạng thái theo dõi trong ds công việc và chi tiết công việc (Xong)\nv1/auth/rating/151 sửa id thành code (Xong)\nfe(price không phải originalPrice), công việc hiện tại lỗi (Xong)\nCập nhật 19/7:\napi v1/auth/recruitment cái idJob nên trả về mã của công việc thay vì id để bấm vô nó chuyển qua công việc ấy vì hiện tại api xem chi tiết cv xài mã đó (sku gì đấy), api lấy việc đã thích cũng cần có idJob (Xong)\nCập nhật 21/7: \nCác trạng thái của công việc ứng tuyển là gì? vd: CHECKING (Xong)\nCập nhật 22/7\ncác api lấy danh sách công việc, lấy công việc mới nhất cho trang chủ, lấy chi tiết công việc thêm 1 field để biết đã được ứng tuyển hay chưa\napi ứng tuyển dc hay k cũng trả về 200\nApi thông báo của ntd và ứng viên\nApi chi tiet cong viec voi top cong viec chua co filed isfollow\n','Cập nhật 17/7: \nsửa các api có ảnh chuyển từ base64 sang link (Xong)\nLàm thêm api lấy công việc đã ứng tuyển, và công việc đã quan tâm (Xong)\nCập nhật 18/7 :\napi lấy top nhà tuyển dụng k có banner, slogan (Xong)\nTrang home chưa gọi api phần ntd nổi bậc và công việc (Xong)\nthêm code nhà tuyển dụng vào api top nhà tuyển dụng (Xong)\napi lấy thông tin hồ sơ mong đợi như bảng dưới, m xem rồi sửa giúp t, coi trường nào k hợp lý thì sửa sao cho dễ là dc (cập nhật ảnh đại diện thì k cần sửa tại nó dùng chung với cập nhật ảnh bên cv rồi, còn cập nhật background chưa có.Nếu có làm backround thì bỏ riêng 1 api khác ) (Xong)\nv1/private/recruitment/2 sửa thành id thành code, thêm tên ứng viên (Xong)\nTrạng thái theo dõi trong ds công việc và chi tiết công việc (Xong)\nv1/auth/rating/151 sửa id thành code (Xong)\nfe(price không phải originalPrice), công việc hiện tại lỗi (Xong)\nCập nhật 19/7:\napi v1/auth/recruitment cái idJob nên trả về mã của công việc thay vì id để bấm vô nó chuyển qua công việc ấy vì hiện tại api xem chi tiết cv xài mã đó (sku gì đấy), api lấy việc đã thích cũng cần có idJob (Xong)\nCập nhật 21/7: \nCác trạng thái của công việc ứng tuyển là gì? vd: CHECKING (Xong)\nCập nhật 22/7\ncác api lấy danh sách công việc, lấy công việc mới nhất cho trang chủ, lấy chi tiết công việc thêm 1 field để biết đã được ứng tuyển hay chưa\napi ứng tuyển dc hay k cũng trả về 200\nApi thông báo của ntd và ứng viên\nApi chi tiet cong viec voi top cong viec chua co filed isfollow\n',NULL,200,50,550,3,2,1);
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
INSERT INTO `profile_area_work_entry` VALUES (16,14),(17,16);
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
INSERT INTO `profile_skill_entry` VALUES ('d076d9b0-058d-4024-8b4a-5b8f7f95c37c',NULL,1,16,3),('cec07b81-4895-417e-98ad-4b4f3630c98b','',2,16,3),('30ec4529-fa86-4e84-ac64-ea9ea10007b8',NULL,2,17,1),('372285f3-2a08-46e6-892b-66904f3f7ad5',NULL,2,17,3);
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
INSERT INTO `recruitment` VALUES ('05f41a33-d892-4e86-9ade-d01c5da200a4','2023-08-16 05:10:14',0,550,408),('343eaefc-0e43-4ea7-93ca-afeb8c4a5a9a','2023-08-16 05:10:00',0,550,406),('353e0143-ffa3-4429-8475-04c9b54dc3d5','2023-08-16 05:09:46',0,550,404),('42131d1f-f7c0-44b8-80c6-9bfbf7478e5b','2023-08-16 05:09:37',0,550,403),('4b3f5275-7b2e-44e2-b221-f6d6fd7aa43e','2023-08-16 05:10:21',0,550,409),('9b65e474-8e57-4cdc-aead-5100bd9cb2ac','2023-08-16 05:09:54',0,550,405),('c2ed21c4-757e-459e-832d-8207550d94ea','2023-08-13 16:12:34',0,550,304),('d69d00b1-358f-4a3d-b82a-095da7985255','2023-07-23 23:41:19',0,451,2),('db527866-c81d-4009-982e-89fac8f2f601','2023-08-16 05:10:07',0,550,407),('e2a133dd-485f-463a-a67d-45dd460fc77c','2023-08-16 05:10:40',0,550,410);
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
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE_FILTER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_SKILL`),
  UNIQUE KEY `UK_i94csmwi59928m39lgoos5odf` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_description`
--

LOCK TABLES `skill_description` WRITE;
/*!40000 ALTER TABLE `skill_description` DISABLE KEYS */;
INSERT INTO `skill_description` VALUES (1,NULL,NULL,NULL,'java','Java','','',''),(2,NULL,NULL,NULL,'dev','Developer','','',''),(3,NULL,NULL,NULL,'negotiation_skill','Đàm phán','','',''),(4,NULL,NULL,NULL,'programming_skill','Lập trình','','',''),(5,NULL,NULL,NULL,'problem_solving_skill','Giải quyết vấn đề','','',''),(6,NULL,NULL,NULL,'sales_skill','Bán hàng','','',''),(7,NULL,NULL,NULL,'leadership_skill','Lãnh đạo','','',''),(8,NULL,NULL,NULL,'project_management_skill','Quản lý dự án','','',''),(9,NULL,NULL,NULL,'accounting_software_skill','Sử dụng phần mềm kế toán','','',''),(10,NULL,NULL,NULL,'financial_management_skill','Quản lý tài chính','','',''),(11,NULL,NULL,NULL,'teamwork_skill','Làm việc nhóm','','',''),(12,NULL,NULL,NULL,'repair_skill','Sửa chữa','','',''),(13,NULL,NULL,NULL,'installation_skill','Lắp đặt','','',''),(14,NULL,NULL,NULL,'maintenance_skill','Bảo trì','','',''),(15,NULL,NULL,NULL,'marketing_skill','Tiếp thị','','',''),(16,NULL,NULL,NULL,'advertising_skill','Quảng cáo','','',''),(17,NULL,NULL,NULL,'customer_service_skill','Dịch vụ khách hàng','','',''),(18,NULL,NULL,NULL,'data_analysis_skill','Phân tích dữ liệu','','',''),(19,NULL,NULL,NULL,'problem_id_skillentification_skill','Xác định vấn đề','','',''),(20,NULL,NULL,NULL,'time_management_skill','Quản lý thời gian','','',''),(21,NULL,NULL,NULL,'creativity_skill','Sáng tạo','','',''),(22,NULL,NULL,NULL,'critical_thinking_skill','Tư duy phản biện','','',''),(23,NULL,NULL,NULL,'decision_making_skill','Ra quyết định','','',''),(24,NULL,NULL,NULL,'emotional_intelligence_skill','Trí tuệ cảm xúc','','',''),(25,NULL,NULL,NULL,'adaptability_skill','Sự thích nghi','','',''),(27,NULL,NULL,NULL,'team_management_skill','Quản lý nhóm','','',''),(28,NULL,NULL,NULL,'research_skill','Nghiên cứu','','',''),(29,NULL,NULL,NULL,'problem-solving_skill','Giải quyết vấn đề','','',''),(30,NULL,NULL,NULL,'communication_skill','Giao tiếp','','',''),(34,NULL,NULL,NULL,'design_skill','Thiết kế','','',''),(35,NULL,NULL,NULL,'firearms_skill','Hỏa giáp','','',''),(36,NULL,NULL,NULL,'crisis_response_skill','Biện pháp ứng phó','','',''),(37,NULL,NULL,NULL,'survey_skill','Khảo sát','','',''),(38,NULL,NULL,NULL,'data_skill','Dữ liệu','','',''),(39,NULL,NULL,NULL,'statistics_skill','Thống kê','','',''),(40,NULL,NULL,NULL,'positioning_skill','Định vị','','',''),(41,NULL,NULL,NULL,'interaction_skill','Tương tác','','',''),(43,NULL,NULL,NULL,'analysis_skill','Phân tích','','',''),(44,NULL,NULL,NULL,'forecasting_skill','Dự báo','','',''),(45,NULL,NULL,NULL,'data_collection_skill','Thu thập','','',''),(46,NULL,NULL,NULL,'solid_skillity_skill','Solid_skillity','','',''),(47,NULL,NULL,NULL,'ethereum_skill','Ethereum','','',''),(48,NULL,NULL,NULL,'hyperledger_fabric_skill','Hyperledger Fabric','','',''),(49,NULL,NULL,NULL,'smart_contract_skill','Smart Contract','','',''),(50,NULL,NULL,NULL,'adobe_creative_suite_skill','Adobe Creative Suite','','',''),(51,NULL,NULL,NULL,'sketch_skill','Sketch','','',''),(52,NULL,NULL,NULL,'wireframing_skill','Wireframing','','',''),(53,NULL,NULL,NULL,'prototyping_skill','Prototyping','','',''),(54,NULL,NULL,NULL,'testing_methodologies_skill','Testing methodologies','','',''),(55,NULL,NULL,NULL,'test_automation_skill','Test automation','','',''),(56,NULL,NULL,NULL,'bug_tracking_skill','Bug tracking','','',''),(57,NULL,NULL,NULL,'selenium_skill','Selenium','','',''),(58,NULL,NULL,NULL,'java_skill','Java','','',''),(59,NULL,NULL,NULL,'swift_skill','Swift','','',''),(60,NULL,NULL,NULL,'react_native_skill','React Native','','',''),(61,NULL,NULL,NULL,'kotlin_skill','Kotlin','','',''),(63,NULL,NULL,NULL,'agile_skill','Agile','','',''),(64,NULL,NULL,NULL,'scrum_skill','Scrum','','',''),(65,NULL,NULL,NULL,'kanban_skill','Kanban','','',''),(66,NULL,NULL,NULL,'docker_skill','Docker','','',''),(67,NULL,NULL,NULL,'kubernetes_skill','Kubernetes','','',''),(68,NULL,NULL,NULL,'aws_skill','Amazon Web Services (AWS)','','',''),(69,NULL,NULL,NULL,'azure_skill','Microsoft Azure','','',''),(70,NULL,NULL,NULL,'google_cloud_skill','Google Cloud','','',''),(71,NULL,NULL,NULL,'devops_skill','DevOps','','',''),(72,NULL,NULL,NULL,'continuous_integration_skill','Continuous Integration','','',''),(73,NULL,NULL,NULL,'continuous_deployment_skill','Continuous Deployment','','',''),(74,NULL,NULL,NULL,'git_skill','Git','','',''),(75,NULL,NULL,NULL,'github_skill','GitHub','','',''),(76,NULL,NULL,NULL,'bitbucket_skill','Bitbucket','','',''),(77,NULL,NULL,NULL,'jira_skill','Jira','','',''),(78,NULL,NULL,NULL,'confluence_skill','Confluence','','',''),(79,NULL,NULL,NULL,'ansible_skill','Ansible','','',''),(80,NULL,NULL,NULL,'terraform_skill','Terraform','','',''),(81,NULL,NULL,NULL,'python_skill','Python','','',''),(83,NULL,NULL,NULL,'javascript_skill','JavaScript','','',''),(84,NULL,NULL,NULL,'csharp_skill','C#','','',''),(85,NULL,NULL,NULL,'php_skill','PHP','','',''),(86,NULL,NULL,NULL,'ruby_skill','Ruby','','',''),(87,NULL,NULL,NULL,'go_skill','Go','','',''),(89,NULL,NULL,NULL,'typescript_skill','TypeScript','','',''),(90,NULL,NULL,NULL,'html_skill','HTML','','',''),(91,NULL,NULL,NULL,'css_skill','CSS','','',''),(92,NULL,NULL,NULL,'ky_nang_hon_nhan','Hôn nhân','','',''),(93,NULL,NULL,NULL,'ky_nang_gia_dinh','Gia đình','','',''),(94,NULL,NULL,NULL,'ky_nang_chi_phi','Chi phí','','',''),(95,NULL,NULL,NULL,'ky_nang_ky_thuat','Kỹ thuật','','',''),(111,NULL,NULL,NULL,'ky_nang_thong_tin','Thông tin','','',''),(112,NULL,NULL,NULL,'ky_nang_du_toan','Dự toán','','',''),(113,NULL,NULL,NULL,'ky_nang_tu_van_suc_khoe','Tư vấn sức khỏe','','',''),(114,NULL,NULL,NULL,'ky_nang_suc_khoe','Sức khỏe','','',''),(115,NULL,NULL,NULL,'ky_nang_dinh_duong','Dinh dưỡng','','',''),(116,NULL,NULL,NULL,'ky_nang_lao_dong','Lao động','','',''),(117,NULL,NULL,NULL,'ky_nang_an_toan','An toàn','','',''),(118,NULL,NULL,NULL,'ky_nang_cham_soc_da','Chăm sóc da','','',''),(119,NULL,NULL,NULL,'ky_nang_trang_diem','Trang điểm','','',''),(120,NULL,NULL,NULL,'ky_nang_phuc_hoi_da','Phục hồi da','','',''),(121,NULL,NULL,NULL,'ky_nang_trang_bi','Trang bị','','',''),(122,NULL,NULL,NULL,'ky_nang_bep','Bếp','','',''),(123,NULL,NULL,NULL,'ky_nang_pha_che','Pha chế','','',''),(124,NULL,NULL,NULL,'ky_nang_pha_che_ruou','Pha chế rượu','','',''),(125,NULL,NULL,NULL,'ky_nang_pha_che_cafe','Pha chế cà phê','','',''),(126,NULL,NULL,NULL,'ky_nang_pha_che_nuoc_uong','Pha chế nước uống','','',''),(127,NULL,NULL,NULL,'ky_nang_tu_van_du_hoc','Tư vấn du học','','',''),(128,NULL,NULL,NULL,'ky_nang_lam_moi_ho_so','Làm mới hồ sơ','','',''),(129,NULL,NULL,NULL,'ky_nang_lam_viec_tu_xa','Làm việc từ xa','','',''),(130,NULL,NULL,NULL,'ky_nang_soan_thao','Soạn thảo','','',''),(131,NULL,NULL,NULL,'ky_nang_nghien_cuu','Nghiên cứu','','',''),(132,NULL,NULL,NULL,'ky_nang_phat_trien_du_an','Phát triển dự án','','',''),(133,NULL,NULL,NULL,'ky_nang_tu_van_tu_thien','Tư vấn từ thiện','','',''),(134,NULL,NULL,NULL,'ky_nang_thuc_pham','Thực phẩm','','',''),(135,NULL,NULL,NULL,'ky_nang_nong_nghiep','Nông nghiệp','','',''),(136,NULL,NULL,NULL,'ky_nang_thiet_ke','Thiết kế','','',''),(137,NULL,NULL,NULL,'ky_nang_dien','Điện','','',''),(138,NULL,NULL,NULL,'ky_nang_dien_tu','Điện tử','','',''),(139,NULL,NULL,NULL,'ky_nang_nuoi_trong','Nuôi trồng','','',''),(140,NULL,NULL,NULL,'ky_nang_quan_tri_ban_hang','Quản trị bán hàng','','',''),(141,NULL,NULL,NULL,'ky_nang_mua_ban','Mua bán','','',''),(142,NULL,NULL,NULL,'ky_nang_giao_tiep','Giao tiếp','','',''),(143,NULL,NULL,NULL,'ky_nang_giao_duc','Giáo dục','','',''),(144,NULL,NULL,NULL,'ky_nang_hoc','Học','','',''),(145,NULL,NULL,NULL,'ky_nang_cong_nghe','Công nghệ','','',''),(147,NULL,NULL,NULL,'presentation_skill','Thuyết trình','','','');
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
INSERT INTO `skill_product_entry` VALUES (100,1),(151,1),(200,1),(201,1),(251,1),(252,1),(253,1),(303,1),(350,1),(400,1),(403,1),(404,1),(405,1),(406,1),(407,1),(408,1),(409,1),(410,1),(100,2),(151,2),(200,2),(201,2),(251,2),(252,2),(253,2),(303,2),(350,2),(400,2),(403,2),(404,2),(405,2),(406,2),(407,2),(408,2),(409,2),(410,2),(304,3),(305,3),(306,3),(307,3),(304,4),(305,4),(306,4),(304,5),(305,5),(306,5),(307,5),(307,7),(307,8),(2,25);
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
INSERT INTO `sm_sequencer` VALUES ('CATEGORY_SEQ_NEXT_VAL',2),('country_description_seq',712),('COUNTRY_SEQ_NEXT_VAL',5),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',12),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('MANUFACT_SEQ_NEXT_VAL',1),('manufacturer_description_seq',2),('MERCH_CONF_SEQ_NEXT_VAL',1),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',5),('PRODUCT_AVAIL_SEQ_NEXT_VAL',9),('product_description_seq',34),('product_price_description_seq',34),('PRODUCT_PRICE_SEQ_NEXT_VAL',9),('PRODUCT_SEQ_NEXT_VAL',9),('product_type_description_seq',3),('STORE_SEQ_NEXT_VAL',4),('SYST_NOTIF_SEQ_NEXT_VAL',3),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',3),('zone_description_seq',652),('ZONE_SEQ_NEXT_VAL',5);
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
INSERT INTO `social_contact` VALUES ('5eaca056-d4be-42d4-863c-b24f898cfebe','www.fb.cojjjmfvfsafasfsafasfsafsafsafasfsa','Facebook','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e'),('748f4fcf-1af9-4bc7-9879-9775932822da','www.longweb.com','Long website','16e7e90b-0adf-4f38-9561-b120680c1051');
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
  `IS_OPENED` bit(1) DEFAULT NULL,
  `RECIEVER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_NOTIF_ID`),
  UNIQUE KEY `UKnpdnlc390vgr2mhepib1mtrmr` (`MERCHANT_ID`,`CONFIG_KEY`),
  KEY `FK3dykr9pm9ln1uektuw18blb6m` (`USER_ID`),
  KEY `FK9m2sia0bms9oak36697959t1n` (`RECIEVER_ID`),
  CONSTRAINT `FK3dykr9pm9ln1uektuw18blb6m` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FK9m2sia0bms9oak36697959t1n` FOREIGN KEY (`RECIEVER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKs6qk7l06e0s6m9n04momedgt7` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
INSERT INTO `system_notification` VALUES (1,'2023-07-23 23:41:19','2023-07-25 22:07:08',NULL,NULL,NULL,'2023-07-23','Nguyễn Dũy f Long f vừa ứng tuyển vào công việcĐây là sản phẩm mới 1',2,NULL,_binary '',NULL),(2,'2023-07-23 23:41:19','2023-07-25 21:55:11',NULL,NULL,NULL,'2023-07-23','Bạn vừa ứng tuyển thành công vào công việc Đây là sản phẩm mới 1',NULL,NULL,_binary '',451),(50,'2023-08-13 16:12:34','2023-08-13 16:12:34',NULL,NULL,NULL,'2023-08-13','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Công việc test',2,NULL,_binary '\0',NULL),(51,'2023-08-13 16:12:34','2023-08-13 16:12:40',NULL,NULL,NULL,'2023-08-13','Bạn vừa ứng tuyển thành công vào công việc: Công việc test',NULL,NULL,_binary '',550),(100,'2023-08-16 05:09:24','2023-08-16 05:09:24',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(101,'2023-08-16 05:09:24','2023-08-16 05:09:24',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(102,'2023-08-16 05:09:37','2023-08-16 05:09:37',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(103,'2023-08-16 05:09:37','2023-08-16 05:09:37',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(104,'2023-08-16 05:09:46','2023-08-16 05:09:46',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(105,'2023-08-16 05:09:46','2023-08-16 05:09:46',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(106,'2023-08-16 05:09:54','2023-08-16 05:09:54',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(107,'2023-08-16 05:09:54','2023-08-16 05:09:54',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(108,'2023-08-16 05:10:00','2023-08-16 05:10:00',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(109,'2023-08-16 05:10:00','2023-08-16 05:10:00',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(110,'2023-08-16 05:10:07','2023-08-16 05:10:07',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(111,'2023-08-16 05:10:07','2023-08-16 05:10:07',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(112,'2023-08-16 05:10:14','2023-08-16 05:10:14',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(113,'2023-08-16 05:10:14','2023-08-16 05:10:14',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(114,'2023-08-16 05:10:21','2023-08-16 05:10:21',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(115,'2023-08-16 05:10:21','2023-08-16 05:10:21',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(116,'2023-08-16 05:10:40','2023-08-16 05:10:40',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(117,'2023-08-16 05:10:40','2023-08-16 05:10:40',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550),(118,'2023-08-16 05:10:49','2023-08-16 05:10:49',NULL,NULL,NULL,'2023-08-16','Dũy Long Nguyễn  vừa ứng tuyển vào công việc: Đây là sản phẩm mới 12',152,NULL,_binary '\0',NULL),(119,'2023-08-16 05:10:49','2023-08-16 05:10:49',NULL,NULL,NULL,'2023-08-16','Bạn vừa ứng tuyển thành công vào công việc: Đây là sản phẩm mới 12',NULL,NULL,_binary '\0',550);
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
INSERT INTO `user_group` VALUES (1,1),(1,2),(2,2),(50,2),(51,2),(52,2),(100,2);
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
INSERT INTO `users` VALUES (1,_binary '','admin@shopizer.com','admin@shopizer.com','$2a$10$1FaAgh0FzYgE4ki59tmnuOZeFHRQK6JYYBOtYDDAhGya2WXJakG76',NULL,NULL,NULL,'2023-05-17 03:35:40','2023-05-17 03:35:40',NULL,NULL,NULL,'Administrator',NULL,'User',NULL,NULL,NULL,NULL,NULL,1),(2,_binary '','ndlong@gmail.com','ndlong@gmail.com','$2a$10$SPK5FoVTN8DiFNsaAaAOheTmcMm8Ff9aC/GOsax/1eKBVHw20OD8C',NULL,NULL,NULL,'2023-05-17 03:38:05','2023-07-25 23:14:29',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,2),(50,_binary '','ndlong@gmail1.com','ndlong@gmail1.com','$2a$10$yeEudzpjUx05Pmmp02j1b.IwUIWZ.QLOLQym8QhmL.Td/izztXsp2',NULL,NULL,NULL,'2023-08-12 12:01:00','2023-08-12 12:01:00',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,101),(51,_binary '','ndlong@gmail21.com','ndlong@gmail21.com','$2a$10$x/4xEWwuBF/kutK3uozxru8oPsrWs4rEe.c7rNeoOsAgKSQzQz8S2',NULL,NULL,NULL,'2023-08-12 12:01:31','2023-08-12 12:01:31',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,102),(52,_binary '','ndlong@gmail231.com','ndlong@gmail231.com','$2a$10$tO.5fil4W.0.ue0oyvxFS.2q.8O.93UZPeg1s2/DJQn.fEUOTSt.S',NULL,NULL,NULL,'2023-08-12 12:01:46','2023-08-12 12:01:46',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,103),(100,_binary '','ndlong@gmaidl231.com','ndlong@gmaidl231.com','$2a$10$rzmCgnOEU1Wg4ps/AAlg0OptCSPcK9WMyi8DUzWXyQSJ.SO/P8dzy',NULL,NULL,NULL,'2023-08-13 00:18:09','2023-08-13 00:18:09',NULL,NULL,NULL,'David',NULL,'Minh Man',NULL,NULL,NULL,NULL,NULL,152);
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
INSERT INTO `work_experience` VALUES ('dafbd83f-494f-4255-853f-29c60b14b9dc','Công ty TNHH MỘT MÌNH TAOf','Làm một ngày thì bị đuổfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam đốc công nghệf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e'),('f1d074da-e730-444d-abad-4c6c57ad0dc0','Công ty TNHH MỘT MÌNH TAOf','Làm một ngày thì bị đuổfi','2023-01-02 00:00:00','2018-09-09 00:00:00','Giam đốc công nghệf da update','92772af3-4e29-4fd2-a6e5-dd4a1c4cc14e');
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

-- Dump completed on 2023-08-16  6:15:39