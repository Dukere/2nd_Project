-- MariaDB dump 10.17  Distrib 10.5.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: suamil_db
-- ------------------------------------------------------
-- Server version	10.5.3-MariaDB

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(30) NOT NULL,
  `visitcount` mediumint(9) NOT NULL DEFAULT 0,
  `bname` varchar(20) NOT NULL,
  `ofile` varchar(100) DEFAULT NULL,
  `sfile` varchar(100) DEFAULT NULL,
  `progdate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (64,' 1번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(65,' 2번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(66,' 3번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(67,' 4번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(68,' 5번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(69,' 6번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(70,' 7번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(71,' 8번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(72,' 9번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(73,' 10번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(74,' 11번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(75,' 12번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(76,' 13번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(77,' 14번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(78,' 15번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(79,' 16번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(80,' 17번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(81,' 18번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(82,' 19번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(83,' 20번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(84,' 21번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(85,' 22번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(86,' 23번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(87,' 24번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(88,' 25번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(89,' 26번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(90,' 27번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(91,' 28번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(92,' 29번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(93,' 30번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(94,' 31번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(95,' 32번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(96,' 33번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(97,' 34번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(98,' 35번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(99,' 36번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(100,' 37번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(101,' 38번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(102,' 39번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(103,' 40번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(104,' 41번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(105,' 42번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(106,' 43번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(107,' 44번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(108,' 45번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(109,' 46번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(110,' 47번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(111,' 48번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(112,' 49번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(113,' 50번째 게시물 ','밍','2020-06-04 14:43:36','j941223',0,'notice',NULL,NULL,NULL),(114,' 1번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(115,' 2번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(116,' 3번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(117,' 4번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(118,' 5번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(119,' 6번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(120,' 7번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(121,' 8번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(122,' 9번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(123,' 10번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(124,' 11번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(125,' 12번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(126,' 13번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(127,' 14번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(128,' 15번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(129,' 16번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(130,' 17번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(131,' 18번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(132,' 19번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(133,' 20번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(134,' 21번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(135,' 22번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(136,' 23번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(137,' 24번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(138,' 25번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(139,' 26번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(140,' 27번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(141,' 28번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(142,' 29번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(143,' 30번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(144,' 31번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(145,' 32번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(146,' 33번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(147,' 34번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(148,' 35번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(149,' 36번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(150,' 37번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(151,' 38번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(152,' 39번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(153,' 40번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(154,' 41번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(155,' 42번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(156,' 43번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(157,' 44번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(158,' 45번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(159,' 46번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(160,' 47번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(161,' 48번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(162,' 49번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(163,' 50번째 게시물 ','밍','2020-06-04 14:43:50','j941223',0,'free',NULL,NULL,NULL),(164,'공지사항 밍쓰','밍쓰','2020-06-04 15:33:37','j941223',1,'notice',NULL,NULL,NULL),(174,'123','123','2020-06-04 18:21:30','j941223',6,'notice',NULL,NULL,NULL),(178,'51번째','123','2020-06-04 19:57:03','j941223',0,'free',NULL,NULL,NULL),(179,'밍구 ?','띠용 123  ?','2020-06-04 19:58:20','j941223',3,'info','unnamed.png','2020_06_05_17_17_8_279.png',NULL),(180,'123','123','2020-06-05 16:23:34','j941223',6,'free',NULL,NULL,NULL),(185,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa','2020-06-05 20:04:30','j941223',0,'free',NULL,NULL,NULL),(186,'사진게시판1','1','2020-06-05 21:00:54','j941223',8,'pic','콧물쟁이.png','2020_06_05_21_0_54_831.png',NULL),(187,'사진2','2사진','2020-06-05 21:15:00','j941223',2,'pic','frozenfrog.png','2020_06_05_21_15_0_230.png',NULL),(188,'3번째','겔겔','2020-06-05 21:28:35','j941223',1,'pic','제목 없음.png','2020_06_05_21_28_35_454.png',NULL),(189,'4차 ','123123','2020-06-05 21:49:15','j941223',0,'pic','Dk9Aje7UcAAVu_o.jpg','2020_06_05_21_49_15_809.jpg',NULL),(190,'db연결','화이팅','2020-06-05 23:07:00','j941223',0,'pic','DB 연결.jpg','2020_06_05_23_7_0_726.jpg',NULL),(191,'asd','asd','2020-06-05 23:23:24','j941223',1,'pic','입금.jpg','2020_06_05_23_23_24_806.jpg',NULL),(192,'싴ㅌㅊ','ㅋㅌㅊ','2020-06-05 23:24:28','j941223',0,'pic','정답체크.jpg','2020_06_05_23_24_28_32.jpg',NULL),(193,'프로그램 1차','ㅁㄴㅇ','2020-06-07 00:50:26','j941223',0,'program',NULL,NULL,'20200607'),(194,'2차 일정','123','2020-06-07 01:01:43','j941223',0,'program',NULL,NULL,'20200608'),(195,'3차','덕래','2020-06-07 01:26:58','j941223',0,'program',NULL,NULL,'20200607'),(196,'4차 도전','123123','2020-06-07 01:27:38','j941223',1,'program',NULL,NULL,'20200609'),(197,'5차 도전','123123','2020-06-07 01:30:17','j941223',0,'program',NULL,NULL,'20200608'),(198,'6차 도전','123123','2020-06-07 01:32:21','j941223',0,'program',NULL,NULL,'20200626'),(199,'7차 도전','123123','2020-06-07 01:32:57','j941223',0,'program',NULL,NULL,'20200620'),(201,'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ','123123','2020-06-07 01:36:54','j941223',1,'notice',NULL,NULL,NULL),(207,'123','123','2020-06-07 03:48:47','j941223',0,'info',NULL,NULL,NULL),(215,'첫번째 덕래의 도전','123','2020-06-07 18:01:39','j941223',18,'emp','unnamed.png','2020_06_07_18_1_39_48.png',NULL),(218,'111111','1232345455','2020-06-07 20:02:05','j941223',2,'guard','frozenfrog.png','2020_06_07_20_42_9_462.png',NULL),(220,'333333','3333333333','2020-06-07 20:02:17','j941223',5,'guard','제목 없음.png','2020_06_07_20_40_6_799.png',NULL),(221,'222','12312312312331','2020-06-07 20:21:19','j941223',4,'guard','pngflow.com (5).png','2020_06_07_20_41_28_737.png',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `name` varchar(20) NOT NULL,
  `id` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `openemail` varchar(5) NOT NULL DEFAULT 'n',
  `zip` varchar(10) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `extraaddr` varchar(100) DEFAULT NULL,
  `regidate` datetime DEFAULT current_timestamp(),
  `auth` varchar(10) DEFAULT 'normal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES ('정덕래','j941223','ejrfo123','01074996255','01074996255','j941223@naver.com','y','08532','서울 금천구 가산동 149-64','실크로드 64동 308호','2020-06-04 12:34:51','admin'),('정뚝딱','wjdejrfo123','ejrfo123','01074996255','01074996255','j941223@google.com','','31427','충남 아산시 인주면 공세리성당길 1','1-21','2020-06-05 18:27:36','worker');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_form_blue`
--

DROP TABLE IF EXISTS `request_form_blue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_blue` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `addr` char(100) NOT NULL DEFAULT '',
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cleantype` varchar(50) NOT NULL,
  `AREA` varchar(10) NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(30) NOT NULL,
  `cleandate` varchar(30) NOT NULL,
  `Receipt` varchar(20) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_form_blue`
--

LOCK TABLES `request_form_blue` WRITE;
/*!40000 ALTER TABLE `request_form_blue` DISABLE KEYS */;
INSERT INTO `request_form_blue` VALUES (1,'덕래집','가산동','12312331233','12312341234','j941223@gmail.com','바닥청소','6평','2020-06-07 23:08:28','wjdejrfo123','2020-06-08','견적문의','없어');
/*!40000 ALTER TABLE `request_form_blue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_form_exp`
--

DROP TABLE IF EXISTS `request_form_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_exp` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `disabled` varchar(10) NOT NULL,
  `disabledtype` varchar(50) NOT NULL,
  `equip` varchar(10) NOT NULL,
  `equipname` varchar(50) NOT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cakeexp` varchar(50) NOT NULL,
  `cookieexp` varchar(50) NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(30) NOT NULL,
  `expdate` varchar(30) NOT NULL,
  `Receipt` varchar(20) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_form_exp`
--

LOCK TABLES `request_form_exp` WRITE;
/*!40000 ALTER TABLE `request_form_exp` DISABLE KEYS */;
INSERT INTO `request_form_exp` VALUES (1,'덕래월드','유','아토피','무','없음','01074996255','01074996255','j941223@gmail.com','안함','함','2020-06-08 01:29:44','j941223','2020-06-11','견적문의','잘 부탁드립니다.');
/*!40000 ALTER TABLE `request_form_exp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_basket`
--

DROP TABLE IF EXISTS `shop_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_basket` (
  `basket_num` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`basket_num`),
  KEY `num` (`num`),
  CONSTRAINT `shop_basket_ibfk_1` FOREIGN KEY (`num`) REFERENCES `shop_products` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_basket`
--

LOCK TABLES `shop_basket` WRITE;
/*!40000 ALTER TABLE `shop_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_ordering`
--

DROP TABLE IF EXISTS `shop_ordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_ordering` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(30) NOT NULL,
  `oname` varchar(30) NOT NULL,
  `ozip` varchar(10) NOT NULL,
  `oaddr` varchar(100) NOT NULL,
  `oextraaddr` varchar(300) DEFAULT NULL,
  `omobile` varchar(20) NOT NULL,
  `oemail` varchar(50) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `szip` varchar(10) NOT NULL,
  `saddr` varchar(100) NOT NULL,
  `sextraaddr` varchar(300) DEFAULT NULL,
  `smobile` varchar(20) NOT NULL,
  `semail` varchar(50) NOT NULL,
  `ordering` varchar(200) NOT NULL,
  `total` varchar(50) NOT NULL,
  `payment` varchar(30) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_ordering`
--

LOCK TABLES `shop_ordering` WRITE;
/*!40000 ALTER TABLE `shop_ordering` DISABLE KEYS */;
INSERT INTO `shop_ordering` VALUES (1,'j941223','정덕래','08532','서울 금천구 가산동 149-64','실크로드 64동 308호','01074996255','j941223@naver.com','정덕래','08532','서울 금천구 가산동 149-64','실크로드 64동 308호','01074996255','j941223@naver.com','// 품번 : 8, 가격  : 200000, 갯수 : 2// 품번 : 9, 가격  : 2000, 갯수 : 3// 품번 : 5, 가격  : 3000, 갯수 : 2','412000','무통장입금'),(2,'j941223','정덕래','08532','서울 금천구 가산동 149-64','실크로드 64동 308호','01074996255','j941223@naver.com','정덕래','08532','서울 금천구 가산동 149-64','실크로드 64동 308호','01074996255','j941223@naver.com','// 품번 : 5, 가격  : 3000, 갯수 : 2','6000','실시간 계좌이체');
/*!40000 ALTER TABLE `shop_ordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_products` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `mileage` varchar(10) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_products`
--

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;
INSERT INTO `shop_products` VALUES (1,'prod1.png','띠껍티콘',5000,'50'),(2,'prod2.jpg','곱창',30000,'300'),(3,'prod3.png','루주라',50000,'500'),(4,'prod4.jpg','시크릿쥬쥬',60000,'600'),(5,'prod5.png','커밋',3000,'30'),(7,'prod6.png','은석이 콧물',1000,'10'),(8,'prod7.png','장발메시',200000,'2000'),(9,'prod8.jpg','은석이 혀',2000,'20');
/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08  9:50:40
