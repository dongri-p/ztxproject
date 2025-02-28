-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ztxpj
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `routeid` int(11) NOT NULL AUTO_INCREMENT,
  `departure` char(10) DEFAULT NULL,
  `arrival` char(10) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `seat` int(11) DEFAULT 900,
  `arrival_time` datetime DEFAULT NULL,
  PRIMARY KEY (`routeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'서울역','부산역','2025-03-01 09:00:00',900,'2025-03-01 11:00:00');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `line` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (116,'서울역','서울','경부선'),(117,'부산역','부산','경부선'),(118,'대전역','대전','경부선'),(119,'동대구역','대구','경부선'),(120,'광명역','경기도 광명','경부선'),(121,'수원역','경기도 수원','경부선'),(122,'천안아산역','충청남도 천안','경부선'),(123,'오송역','충청북도 청주','경부선'),(124,'울산역','울산','경부선'),(125,'정읍역','전라북도 정읍','호남선'),(126,'광주송정역','광주','호남선'),(127,'목포역','전라남도 목포','호남선'),(128,'익산역','전라북도 익산','호남선'),(129,'전주역','전라북도 전주','호남선'),(130,'순천역','전라남도 순천','호남선'),(131,'여수엑스포역','전라남도 여수','호남선'),(132,'대구역','대구','경북선'),(133,'포항역','경상북도 포항','경북선'),(134,'안동역','경상북도 안동','경북선'),(135,'김천역','경상북도 김천','경북선'),(136,'경주역','경상북도 경주','경북선'),(137,'춘천역','강원도 춘천','강릉선'),(138,'강릉역','강원도 강릉','강릉선'),(139,'홍천역','강원도 홍천','강릉선'),(140,'원주역','강원도 원주','강릉선'),(141,'정선역','강원도 정선','중앙선'),(142,'서울상봉역','서울','중앙선'),(143,'청량리역','서울','중앙선'),(144,'이천역','경기도 이천','중앙선'),(145,'제천역','충청북도 제천','중앙선'),(146,'보은역','충청북도 보은','중앙선'),(147,'단양역','충청북도 단양','중앙선'),(148,'서대전역','대전','중부내륙선'),(149,'충주역','충청북도 충주','중부내륙선'),(150,'문경역','경상북도 문경','중부내륙선'),(151,'영주역','경상북도 영주','중부내륙선'),(152,'안성역','경기도 안성','중부내륙선'),(153,'호법역','경기도 호법','중부내륙선'),(154,'용인역','경기도 용인','경부선'),(155,'판교역','경기도 성남','경부선'),(156,'김포공항역','서울','공항철도'),(157,'인천공항1터미널역','인천','공항철도'),(158,'인천공항2터미널역','인천','공항철도'),(159,'서울역','서울','수도권전철'),(160,'신도림역','서울','수도권전철'),(161,'동서울역','서울','수도권전철'),(162,'여의도역','서울','수도권전철'),(163,'광교역','경기도 수원','수도권전철'),(164,'군포역','경기도 군포','수도권전철'),(165,'안양역','경기도 안양','수도권전철'),(166,'부산진역','부산','경부선'),(167,'대구동대구역','대구','경부선'),(168,'울산북구역','울산','경부선'),(169,'서평택역','경기도 평택','경부선'),(170,'용인수지역','경기도 용인','경부선'),(171,'광명역','경기도 광명','경부선'),(172,'청주역','충청북도 청주','호남선'),(173,'김해역','경상남도 김해','경부선'),(174,'양산역','경상남도 양산','경부선'),(175,'신촌역','서울','경부선'),(176,'동서울터미널역','서울','경부선');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 17:28:00
