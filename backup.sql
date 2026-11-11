CREATE DATABASE  IF NOT EXISTS `moco_crime` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `moco_crime`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: moco_crime
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `AgencyID` int NOT NULL AUTO_INCREMENT,
  `AgencyName` varchar(100) NOT NULL,
  PRIMARY KEY (`AgencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'MCPD');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crimetypes`
--

DROP TABLE IF EXISTS `crimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crimetypes` (
  `OffenseCode` int NOT NULL,
  `NIBRSCode` varchar(10) DEFAULT NULL,
  `CrimeName1` varchar(200) NOT NULL,
  `CrimeName2` varchar(200) DEFAULT NULL,
  `CrimeName3` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`OffenseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimetypes`
--

LOCK TABLES `crimetypes` WRITE;
/*!40000 ALTER TABLE `crimetypes` DISABLE KEYS */;
INSERT INTO `crimetypes` VALUES (1,'120','Crime Against Property','Robbery','ROBBERY - STRONG ARM'),(2,'120','Crime Against Property','Robbery','ROBBERY - STREET-STRONG-ARM'),(3,'120','Crime Against Property','Robbery','ROBBERY - CARJACKING - STRONG-ARM'),(4,'120','Crime Against Property','Robbery','ROBBERY - STREET-GUN'),(5,'120','Crime Against Property','Robbery','ROBBERY - GUN'),(6,'120','Crime Against Property','Robbery','ROBBERY - KNIFE'),(7,'120','Crime Against Property','Robbery','ROBBERY - BUSINESS-STRONG-ARM'),(8,'120','Crime Against Property','Robbery','ROBBERY - RESIDENTIAL-GUN'),(9,'120','Crime Against Property','Robbery','ROBBERY - OTHER WEAPON'),(10,'120','Crime Against Property','Robbery','ROBBERY - CARJACKING - ARMED'),(11,'120','Crime Against Property','Robbery','ROBBERY - DOMESTIC'),(12,'120','Crime Against Property','Robbery','ROBBERY - BUSINESS-GUN'),(13,'120','Crime Against Property','Robbery','ROBBERY - RESIDENTIAL-STRONG-ARM'),(14,'120','Crime Against Property','Robbery','ROBBERY (DESCRIBE OFFENSE)'),(15,'120','Crime Against Property','Robbery','ROBBERY - BUSINESS-OTHER WEAPON'),(16,'120','Crime Against Property','Robbery','ROBBERY - BANKING-TYPE INST'),(17,'120','Crime Against Property','Robbery','ROBBERY - STREET-OTHER WEAPON');
/*!40000 ALTER TABLE `crimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `DistrictID` int NOT NULL AUTO_INCREMENT,
  `DistrictNumber` varchar(10) NOT NULL,
  `DistrictName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DistrictID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'3D','SILVER SPRING');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `IncidentID` int NOT NULL,
  `CR_Number` varchar(20) NOT NULL,
  `Start_Date_Time` datetime NOT NULL,
  `LocationID` int NOT NULL,
  `DistrictID` int NOT NULL,
  `AgencyID` int NOT NULL,
  `PatrolAreaID` int NOT NULL,
  PRIMARY KEY (`IncidentID`),
  KEY `fk_location_idx` (`LocationID`),
  KEY `fk_districts_idx` (`DistrictID`),
  KEY `fk_agency_idx` (`AgencyID`),
  KEY `fk_Incidents_PatrolAreas1_idx` (`PatrolAreaID`),
  CONSTRAINT `fk_agency` FOREIGN KEY (`AgencyID`) REFERENCES `agencies` (`AgencyID`),
  CONSTRAINT `fk_districts` FOREIGN KEY (`DistrictID`) REFERENCES `districts` (`DistrictID`),
  CONSTRAINT `fk_Incidents_PatrolAreas1` FOREIGN KEY (`PatrolAreaID`) REFERENCES `patrolareas` (`PatrolAreaID`),
  CONSTRAINT `fk_location` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (201280114,'200010412','2020-03-02 11:37:00',1,1,1,1),(201280333,'200010671','2020-03-03 10:31:00',2,1,1,2),(201280582,'200010965','2020-03-05 04:20:00',3,1,1,3),(201281029,'200011529','2020-03-09 03:41:00',4,1,1,4),(201283464,'200014362','2020-03-29 03:55:00',5,1,1,5),(201283516,'200014363','2020-03-29 05:11:00',6,1,1,6),(201284029,'200014991','2020-04-04 02:00:00',7,1,1,7),(201284141,'200015101','2020-04-05 08:32:00',8,1,1,8),(201284370,'200015354','2020-04-08 01:45:00',9,1,1,9),(201284506,'200015513','2020-04-09 12:01:00',10,1,1,10),(201284805,'200015863','2020-04-13 01:56:00',11,1,1,11),(201285816,'200017054','2020-04-24 11:44:00',12,1,1,12),(201286507,'200017776','2020-05-01 09:51:00',13,1,1,13),(201287203,'200018604','2020-05-04 11:00:00',2,1,1,14),(201287825,'200019373','2020-05-13 09:00:00',2,1,1,15),(201288227,'200019824','2020-05-17 08:04:00',16,1,1,16),(201288239,'200019831','2020-05-17 10:40:00',17,1,1,17),(201289573,'200021350','2020-05-29 12:00:00',18,1,1,18),(201290209,'200022082','2020-06-04 06:20:00',2,1,1,19),(201290581,'200022584','2020-06-08 06:15:00',20,1,1,20),(201290997,'200023049','2020-06-12 02:07:00',21,1,1,21),(201291778,'200024010','2020-06-19 01:02:00',22,1,1,22),(201291793,'200024051','2020-06-19 06:38:00',2,1,1,23),(201292029,'200024331','2020-06-21 09:22:00',24,1,1,24),(201292129,'200024427','2020-06-22 03:45:00',25,1,1,25),(201292292,'200024608','2020-06-23 09:34:00',26,1,1,26),(201292420,'200024750','2020-06-24 08:48:00',27,1,1,27),(201292511,'200024858','2020-06-25 11:40:00',2,1,1,28),(201292672,'200025088','2020-06-27 08:18:00',10,1,1,10),(201292788,'200025207','2020-06-28 11:10:00',29,1,1,29),(201293059,'200025530','2020-07-01 04:47:00',2,1,1,30),(201293848,'200026418','2020-07-07 08:36:00',31,1,1,31),(201293857,'200026432','2020-07-07 11:58:00',32,1,1,32),(201293859,'200026437','2020-07-08 02:53:00',32,1,1,33),(201294448,'200027118','2020-07-12 12:00:00',33,1,1,34),(201294699,'200027402','2020-07-14 09:32:00',32,1,1,35),(201294858,'200027575','2020-07-16 05:20:00',34,1,1,36),(201295347,'200028197','2020-07-20 05:17:00',35,1,1,37),(201295790,'200028691','2020-07-23 11:02:00',36,1,1,38),(201295988,'200028903','2020-07-25 04:27:00',37,1,1,39),(201296436,'200029440','2020-07-29 12:23:00',38,1,1,40),(201296622,'200029637','2020-07-30 08:00:00',39,1,1,41),(201296850,'200029934','2020-08-02 02:00:00',40,1,1,42),(201297042,'200030156','2020-08-03 08:59:00',41,1,1,43),(201297319,'200030451','2020-08-05 10:42:00',35,1,1,44),(201297371,'200030518','2020-08-06 02:00:00',42,1,1,45),(201297632,'200030857','2020-08-08 06:30:00',43,1,1,46),(201297650,'200030878','2020-08-08 08:51:00',44,1,1,26),(201298022,'200031298','2020-08-11 07:06:00',45,1,1,47),(201298109,'200031389','2020-08-12 03:17:00',46,1,1,48),(201298595,'200032037','2020-08-16 10:35:00',47,1,1,49),(201298706,'200032173','2020-08-17 08:59:00',48,1,1,43),(201298720,'200032185','2020-08-17 10:19:00',49,1,1,50),(201298965,'200032441','2020-08-19 05:18:00',50,1,1,17),(201299167,'200032661','2020-08-21 12:37:00',51,1,1,51),(201299550,'200033130','2020-08-24 11:30:00',52,1,1,52),(201299925,'200033531','2020-08-27 01:30:00',53,1,1,53),(201299965,'200033586','2020-08-27 09:53:00',54,1,1,54),(201299981,'200033600','2020-08-28 05:50:00',55,1,1,55),(201300410,'200034123','2020-09-01 03:50:00',43,1,1,56),(201300587,'200034322','2020-09-02 11:50:00',56,1,1,57),(201300757,'200034556','2020-09-03 06:30:00',57,1,1,58),(201300990,'200034872','2020-09-06 01:30:00',58,1,1,59),(201302413,'200036532','2020-09-17 09:12:00',59,1,1,60),(201302593,'200036782','2020-09-19 06:55:00',60,1,1,61),(201302615,'200036805','2020-09-19 09:43:00',61,1,1,62),(201302948,'200037171','2020-09-22 10:00:00',62,1,1,63),(201303299,'200037597','2020-09-24 06:03:00',43,1,1,64),(201303454,'200037771','2020-09-25 09:22:00',2,1,1,65),(201303460,'200037774','2020-09-25 09:00:00',2,1,1,26),(201303589,'200037943','2020-09-26 11:30:00',2,1,1,66),(201304075,'200038496','2020-09-30 04:24:00',66,1,1,67),(201304123,'200038559','2020-09-30 11:25:00',67,1,1,52),(201304285,'200038755','2020-10-01 11:00:00',68,1,1,68),(201304451,'200038975','2020-10-03 08:20:00',46,1,1,69),(201304470,'200039014','2020-10-04 03:20:00',69,1,1,70),(201304672,'200039228','2020-07-30 05:30:00',69,1,1,71),(201304812,'200039409','2020-10-06 04:00:00',70,1,1,72),(201304933,'200039569','2020-10-07 08:49:00',71,1,1,73),(201305060,'200039713','2020-10-08 08:19:00',12,1,1,74),(201305202,'200039852','2020-10-09 09:29:00',59,1,1,75),(201305383,'200040077','2020-10-11 08:11:00',72,1,1,76),(201305393,'200040084','2020-10-11 09:54:00',73,1,1,77),(201305399,'200040092','2020-10-11 09:00:00',74,1,1,78),(201305493,'200040204','2020-10-12 05:48:00',75,1,1,79),(201306196,'200040938','2020-10-15 10:00:00',76,1,1,80),(201306390,'200041312','2020-10-19 10:30:00',2,1,1,81),(201306396,'200041313','2020-10-19 11:30:00',78,1,1,82),(201306831,'200041800','2020-10-23 03:46:00',79,1,1,83),(201306928,'200041924','2020-10-23 10:36:00',80,1,1,84),(201306929,'200041922','2020-10-23 10:08:00',81,1,1,85),(201306938,'200041918','2020-10-23 09:01:00',82,1,1,51),(201307007,'200042021','2020-10-24 07:40:00',2,1,1,86),(201307213,'200042248','2020-10-26 04:18:00',16,1,1,87),(201307345,'200042314','2020-10-27 04:35:00',22,1,1,88),(201307408,'200042511','2020-10-28 09:52:00',84,1,1,89),(201307448,'200042594','2020-10-28 07:30:00',85,1,1,90),(201307583,'200042753','2020-10-30 01:22:00',86,1,1,91),(201307690,'200042886','2020-10-30 11:08:00',87,1,1,92),(201308130,'200043431','2020-11-03 05:40:00',88,1,1,93),(201308538,'200043924','2020-11-07 09:29:00',89,1,1,26),(201308574,'200043975','2020-11-07 02:34:00',90,1,1,94),(201308702,'200044134','2020-11-09 01:45:00',91,1,1,95),(201308891,'200044388','2020-11-10 01:17:00',9,1,1,96),(201308941,'200044452','2020-11-09 02:00:00',92,1,1,97),(201308978,'200044496','2020-11-11 02:20:00',93,1,1,53),(201309130,'200044675','2020-11-12 01:34:00',94,1,1,91),(201309181,'200044719','2020-11-12 05:50:00',68,1,1,98),(201309712,'200045372','2020-11-17 01:27:00',95,1,1,99),(201309819,'200045478','2020-11-18 07:43:00',96,1,1,100),(201309930,'200045634','2020-11-18 09:30:00',46,1,1,101),(201310524,'200046360','2020-11-24 12:00:00',97,1,1,102),(201311044,'200047005','2020-11-28 09:19:00',54,1,1,103),(201311059,'200047041','2020-11-29 01:48:00',98,1,1,104),(201311301,'200047346','2020-12-01 01:32:00',95,1,1,48),(201311346,'200047367','2020-12-01 03:56:00',2,1,1,105),(201312473,'200048681','2020-12-10 03:30:00',100,1,1,79),(201313032,'200049414','2020-12-15 05:31:00',101,1,1,106),(201313180,'200049584','2020-12-16 09:57:00',102,1,1,15),(201313390,'200049830','2020-12-18 07:10:00',103,1,1,107),(201313494,'200049970','2020-12-19 11:09:00',10,1,1,74),(201313498,'200049969','2020-12-19 09:55:00',13,1,1,108),(201313727,'200050147','2020-10-03 11:00:00',7,1,1,20),(201313893,'200050400','2020-12-22 09:02:00',2,1,1,109),(201314173,'200050736','2020-12-25 04:52:00',105,1,1,17),(201314204,'200050767','2020-12-25 05:42:00',106,1,1,110),(201314609,'200051260','2020-12-29 04:45:00',2,1,1,111),(201314630,'200051283','2020-12-29 09:53:00',34,1,1,112);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `BlockAddress` varchar(150) NOT NULL,
  `City` varchar(150) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Latitude` decimal(10,7) DEFAULT NULL,
  `Longitude` decimal(10,7) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'14100 BLK  OLD COLUMBIA PIK','BURTONSVILLE','MD','20866',39.0876445,-76.9494598),(2,'DIXON AVE','SILVER SPRING','MD','20910',38.9945461,-77.0280008),(3,'13200 BLK  CHOPIN CT','TAKOMA PARK','MD','20904',39.0738140,-76.9512427),(4,'1500 BLK E FALKLAND LA','','MD','20910',38.9944928,-77.0345042),(5,'12300 BLK  SANDY POINT CT','','MD','20904',39.0564373,-76.9529836),(6,'14500 BLK  ALMANAC DR','','MD','20866',39.0943182,-76.9314430),(7,'8100 BLK  GEORGIA AVE','','MD','20910',38.9906447,-77.0266752),(8,'1700 BLK  MT PISGAH LA','','MD','20903',39.0150670,-76.9761674),(9,'8300 BLK  GEORGIA AVE','','MD','20910',38.9929740,-77.0266531),(10,'11200 BLK  OAK LEAF DR','','MD','20901',39.0384411,-76.9949993),(11,'11700 BLK  OLD COLUMBIA PIK','','MD','20904',39.0484584,-76.9806866),(12,'11200 BLK  LOCKWOOD DR','','MD','20901',39.0387853,-76.9924912),(13,'12200 BLK  TECH RD','','MD','20904',39.0551308,-76.9666126),(14,'GEORGIA AVE','','MD','20902',39.0156290,-77.0427078),(15,'HOUSTON AVE','','MD','20912',38.9911137,-77.0019117),(16,'900 BLK  THAYER AVE','','MD','20910',38.9930489,-77.0240869),(17,'9800 BLK E LIGHT DR','','MD','20903',39.0157155,-76.9860367),(18,'9200 BLK  NEW HAMPSHIRE AVE','','MD','20903',0.0000000,0.0000000),(19,'BONIFANT ST','','MD','20910',38.9990299,-77.0161978),(20,'8400 BLK  COLESVILLE RD','','MD','20910',38.9939357,-77.0315836),(21,'1000 BLK  MILESTONE DR','','MD','20904',39.0456549,-76.9920020),(22,'8000 BLK  13TH ST','','MD','20910',38.9869320,-77.0296390),(23,'FENTON ST','','MD','20910',38.9976615,-77.0270207),(24,'700 BLK  PERSHING DR','','MD','20910',38.9991624,-77.0222414),(25,'8500 BLK  16TH ST','','MD','20910',38.9961396,-77.0363856),(26,'8200 BLK  TAHONA DR','','MD','20903',0.0000000,0.0000000),(27,'1200 BLK  BLAIR MILL RD','','MD','20910',38.9899459,-77.0289476),(28,'PINEY BRANCH RD','','MD','20910',38.9937064,-77.0090287),(29,'900 BLK  WAYNE AVE','','MD','20910',38.9954056,-77.0244245),(30,'13TH ST','','MD','20910',38.9869320,-77.0296390),(31,'12600 BLK  OLD COLUMBIA PIK','','MD','20904',39.0634491,-76.9658453),(32,'7900 BLK  GEORGIA AVE','','MD','20910',38.9853470,-77.0266434),(33,'800 BLK  EASLEY ST','','MD','20910',38.9940636,-77.0220619),(34,'8200 BLK  GEORGIA AVE','','MD','20910',38.9916364,-77.0266116),(35,'1200 BLK E WEST HWY','','MD','20910',38.9899459,-77.0289476),(36,'8200 BLK  PINEY BRANCH RD','','MD','20910',38.9928516,-77.0095440),(37,'900 BLK  NORTHAMPTON DR','','MD','20903',39.0070610,-76.9818992),(38,'10100 BLK  NEW HAMPSHIRE AVE','','MD','20903',39.0203927,-76.9766755),(39,'8200 BLK  FENTON ST','','MD','20910',38.9917021,-77.0240411),(40,'10000 BLK  GREELEY AVE','','MD','20902',39.0187616,-77.0472452),(41,'1500 BLK  NOVEMBER CIR','','MD','20904',39.0449845,-76.9810220),(42,'1400 BLK  HAMPSHIRE WEST CT','','MD','20903',39.0088199,-76.9841333),(43,'8700 BLK  GEORGIA AVE','','MD','20910',38.9975253,-77.0297736),(44,'1000 BLK  QUEBEC TER','','MD','20903',38.9990793,-76.9893533),(45,'8000 BLK  NEWELL ST','','MD','20910',38.9880544,-77.0310630),(46,'8500 BLK  GEORGIA AVE','','MD','20910',38.9945454,-77.0268551),(47,'11300 BLK  LOCKWOOD DR','','MD','20904',39.0397827,-76.9906186),(48,'11500 BLK  FEBRUARY CIR','','MD','20904',39.0471024,-76.9764383),(49,'800 BLK  THAYER AVE','','MD','20910',38.9931181,-77.0220159),(50,'9700 BLK  DILSTON RD','','MD','20903',39.0178740,-76.9836892),(51,'800 BLK  BURNT MILLS AVE','','MD','20901',39.0346446,-76.9950942),(52,'13900 BLK  CASTLE BLV','','MD','20904',39.0831325,-76.9426098),(53,'11500 BLK  STEWART LA','','MD','20904',0.0000000,0.0000000),(54,'8800 BLK  COLESVILLE RD','','MD','20910',38.9991000,-77.0261000),(55,'13000 BLK  ALPENHORN WAY','','MD','20904',39.0679434,-76.9371830),(56,'8300 BLK  COLESVILLE RD','','MD','20910',38.9923973,-77.0360803),(57,'4200 BLK  CEDAR TREE LA','','MD','20866',39.0985448,-76.9248004),(58,'7700 BLK  BLAIR RD','','MD','20912',38.9838092,-77.0244346),(59,'600 BLK  UNIVERSITY BLV E','','MD','20901',39.0277643,-77.0204434),(60,'8600 BLK  CEDAR ST','','MD','20910',38.9980863,-77.0230545),(61,'8700 BLK  COLESVILLE RD','','MD','20910',38.9976615,-77.0270207),(62,'8100 BLK  MAYOR LA','','MD','20910',38.9902584,-77.0258059),(63,'OSAGE ST','','MD','20903',38.9955946,-76.9922491),(64,'TAHONA DR','','MD','20903',38.9977175,-76.9880600),(65,'SUTHERLAND RD','','MD','20901',39.0208692,-77.0135581),(66,'1200 BLK  FIDLER LA','','MD','20910',38.9961030,-77.0298689),(67,'3600 BLK  TURBRIDGE DR','','MD','20866',39.0935177,-76.9361505),(68,'10200 BLK  NEW HAMPSHIRE AVE','','MD','20903',39.0222481,-76.9774457),(69,'9300 BLK  PINEY BRANCH RD','','MD','20903',39.0012636,-76.9871779),(70,'8200 BLK  16TH ST','','MD','20903',39.0012636,-76.9871779),(71,'8700 BLK  CAMERON ST','','MD','20910',38.9922600,-77.0365000),(72,'8800 BLK  GARLAND AVE','','MD','20910',38.9983998,-77.0287738),(73,'30500 BLK  IL495 X31 TO X30 HWY','','MD','20901',39.0005301,-77.0015764),(74,'12000 BLK  CHERRY HILL RD','','MD','20901',39.0167211,-77.0239312),(75,'1100 BLK  WAYNE AVE','','MD','20904',39.0525906,-76.9531517),(76,'13800 BLK  OLD COLUMBIA PIK','','MD','20910',38.9945461,-77.0280008),(77,' PINEY BRANCH RD','','MD','20904',39.0819119,-76.9535837),(78,'600 BLK  THAYER AVE','','MD','20901',38.9982348,-77.0036026),(79,'11100 BLK  NEW HAMPSHIRE AVE','','MD','20910',38.9932696,-77.0175339),(80,'8300 BLK  FENTON ST','','MD','20901',39.0377894,-76.9897795),(81,'8800 BLK  GLENVILLE RD','','MD','20910',38.9930489,-77.0240869),(82,'10800 BLK E NOLCREST DR','','MD','20901',39.0011408,-76.9966465),(83,' OLD COLUMBIA PIK','','MD','20903',39.0328285,-76.9870670),(84,'300 BLK  SOUTHAMPTON DR','','MD','20904',39.0558312,-76.9709485),(85,'8800 BLK  PINEY BRANCH RD','','MD','20903',39.0057676,-76.9823205),(86,'14000 BLK  CASTLE BLV','','MD','20903',38.9996800,-76.9952000),(87,'900 BLK  UNIVERSITY BLV E','','MD','20904',39.0845930,-76.9405631),(88,'9900 BLK  EDGEHILL LA','','MD','20903',38.9941824,-76.9925905),(89,'1000 BLK  RUATAN ST','','MD','20901',39.0173600,-77.0043387),(90,'1200 BLK E RANDOLPH RD','','MD','20903',38.9970300,-76.9905000),(91,'7800 BLK  GEORGIA AVE','','MD','20904',39.0707304,-76.9879864),(92,'1500 BLK E WEST HWY','','MD','20910',0.0000000,0.0000000),(93,'11500 BLK  LOCKWOOD DR','','MD','20910',38.9943446,-77.0335667),(94,'13500 BLK  ASTON MANOR WAY','','MD','20904',39.0412072,-76.9862555),(95,'8600 BLK  COLESVILLE RD','','MD','20904',39.0758862,-76.9411621),(96,'1800 BLK  GREENWICH WOOD DR','','MD','20910',38.9960324,-77.0281702),(97,'8500 BLK  HOUSTON ST','','MD','20903',39.0157025,-76.9737943),(98,'200 BLK  UNIVERSITY BLV E','','MD','20910',38.9954371,-77.0203435),(99,' FENTON ST','','MD','20910',38.9990081,-77.0261856),(100,'8400 BLK  GEORGIA AVE','','MD','20901',39.0218271,-77.0151651),(101,'12000 BLK  OLD COLUMBIA PIK','','MD','20910',38.9976615,-77.0270207),(102,'8500 BLK  GLENVIEW AVE','','MD','20910',38.9934901,-77.0267058),(103,'8100 BLK  FENTON ST','','MD','20904',39.0534753,-76.9747197),(104,'COLESVILLE RD','','MD','20912',38.9954657,-76.9993807),(105,'9900 BLK  DILSTON RD','','MD','20910',38.9902126,-77.0239614),(106,'3900 BLK  BLACKBURN LA','','MD','20910',38.9960324,-77.0281702),(107,' NEW HAMPSHIRE AVE','','MD','20903',39.0185864,-76.9797118),(108,'','','MD','20866',39.1052343,-76.9321817),(109,'','','MD','20903',39.0153354,-76.9778694);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offenses`
--

DROP TABLE IF EXISTS `offenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offenses` (
  `OffenseID` int NOT NULL,
  `IncidentID` int NOT NULL,
  `OffenseCode` int NOT NULL,
  `Victims` int NOT NULL,
  `CrimeTypes_OffenseCode` int NOT NULL,
  PRIMARY KEY (`OffenseID`),
  KEY `fk_Offenses_Incidents_idx` (`IncidentID`),
  KEY `fk_crimetype_idx` (`OffenseCode`),
  KEY `fk_Offenses_CrimeTypes1_idx` (`CrimeTypes_OffenseCode`),
  CONSTRAINT `fk_crimetype` FOREIGN KEY (`OffenseCode`) REFERENCES `crimetypes` (`OffenseCode`),
  CONSTRAINT `fk_Offenses_CrimeTypes1` FOREIGN KEY (`CrimeTypes_OffenseCode`) REFERENCES `crimetypes` (`OffenseCode`),
  CONSTRAINT `fk_Offenses_Incidents` FOREIGN KEY (`IncidentID`) REFERENCES `incidents` (`IncidentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offenses`
--

LOCK TABLES `offenses` WRITE;
/*!40000 ALTER TABLE `offenses` DISABLE KEYS */;
INSERT INTO `offenses` VALUES (1,201280114,1,1,1),(2,201280333,2,1,2),(3,201280582,1,1,1),(4,201281029,3,1,3),(5,201283464,4,1,4),(6,201283516,4,1,4),(7,201284029,1,1,1),(8,201284141,1,1,1),(9,201284370,5,1,5),(10,201284506,2,1,2),(11,201284805,6,1,6),(12,201285816,1,1,1),(13,201286507,7,1,7),(14,201287203,6,1,6),(15,201287825,2,1,2),(16,201288227,4,1,4),(17,201288239,4,1,4),(18,201289573,4,1,4),(19,201290209,4,1,4),(20,201290581,2,1,2),(21,201290997,2,1,2),(22,201291778,8,1,8),(23,201291793,3,1,3),(24,201292029,1,1,1),(25,201292129,3,1,3),(26,201292292,9,1,9),(27,201292420,2,1,2),(28,201292511,2,1,2),(29,201292672,8,1,8),(30,201292788,10,1,10),(31,201293059,3,1,3),(32,201293848,7,1,7),(33,201293857,7,1,7),(34,201293859,5,1,5),(35,201293859,10,1,10),(36,201294448,11,1,11),(37,201294699,2,1,2),(38,201294858,7,1,7),(39,201295347,9,1,9),(40,201295790,1,1,1),(41,201295988,2,1,2),(42,201296436,5,1,5),(43,201296622,2,1,2),(44,201296850,11,1,11),(45,201297042,2,1,2),(46,201297319,12,1,12),(47,201297371,10,1,10),(48,201297632,13,1,13),(49,201297650,5,1,5),(50,201298022,1,1,1),(51,201298109,2,1,2),(52,201298595,6,1,6),(53,201298706,2,1,2),(54,201298720,1,1,1),(55,201298965,2,1,2),(56,201299167,2,1,2),(57,201299550,11,1,11),(58,201299925,8,1,8),(59,201299965,4,1,4),(60,201299981,13,1,13),(61,201300410,9,1,9),(62,201300587,12,1,12),(63,201300587,14,1,14),(64,201300757,4,1,4),(65,201300990,5,1,5),(66,201302413,5,1,5),(67,201302593,10,1,10),(68,201302615,10,1,10),(69,201302948,10,1,10),(70,201303299,10,1,10),(71,201303454,6,1,6),(72,201303460,6,1,6),(73,201303589,1,1,1),(74,201304075,2,1,2),(75,201304123,8,1,8),(76,201304285,3,1,3),(77,201304451,1,1,1),(78,201304470,6,1,6),(79,201304672,4,1,4),(80,201304812,10,1,10),(81,201304933,3,1,3),(82,201305060,5,1,5),(83,201305202,12,1,12),(84,201305383,4,1,4),(85,201305393,10,1,10),(86,201305399,4,1,4),(87,201305493,6,1,6),(88,201306196,14,1,14),(89,201306390,6,1,6),(90,201306396,2,1,2),(91,201306831,15,1,15),(92,201306928,4,1,4),(93,201306929,2,1,2),(94,201306938,2,1,2),(95,201307007,6,1,6),(96,201307213,12,1,12),(97,201307345,5,1,5),(98,201307408,6,1,6),(99,201307448,4,1,4),(100,201307583,11,1,11),(101,201307690,1,1,1),(102,201308130,1,1,1),(103,201308538,6,1,6),(104,201308574,10,1,10),(105,201308702,10,1,10),(106,201308702,4,1,4),(107,201308891,16,1,16),(108,201308941,13,1,13),(109,201308978,5,1,5),(110,201309130,8,1,8),(111,201309181,12,1,12),(112,201309712,16,1,16),(113,201309819,9,1,9),(114,201309930,1,1,1),(115,201310524,1,1,1),(116,201311044,5,1,5),(117,201311059,3,1,3),(118,201311301,2,1,2),(119,201311346,3,1,3),(120,201312473,10,1,10),(121,201313032,6,1,6),(122,201313180,2,1,2),(123,201313390,5,1,5),(124,201313494,8,1,8),(125,201313498,5,1,5),(126,201313727,2,1,2),(127,201313893,1,1,1),(128,201313893,3,1,3),(129,201314173,2,1,2),(130,201314204,13,1,13),(131,201314609,17,1,17),(132,201314630,7,1,7);
/*!40000 ALTER TABLE `offenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrolareas`
--

DROP TABLE IF EXISTS `patrolareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrolareas` (
  `PatrolAreaID` int NOT NULL AUTO_INCREMENT,
  `Sector` varchar(20) NOT NULL,
  `Beat` varchar(20) DEFAULT NULL,
  `PRA` varchar(20) DEFAULT NULL,
  `Place` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PatrolAreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrolareas`
--

LOCK TABLES `patrolareas` WRITE;
/*!40000 ALTER TABLE `patrolareas` DISABLE KEYS */;
INSERT INTO `patrolareas` VALUES (1,'I','3I2','384','School/College - DO NOT USE'),(2,'G','3G1','94','Street - Bus Stop'),(3,'I','3I2','378','Street - Residential'),(4,'G','3G1','88','Parking Garage - Residential'),(5,'I','3I1','377','Parking Lot - Residential'),(6,'I','3I2','381','Parking Lot - Residential'),(7,'G','3G1','94','Parking Lot - County'),(8,'H','3H2','138','Street - Bus Stop'),(9,'G','3G1','670','Bank - ATM'),(10,'H','3H2','144','Residence - Apartment/Condo'),(11,'I','3I1','145','Residence - Apartment/Condo'),(12,'I','3I1','518','Street - Residential'),(13,'I','3I1','146','Convenience Store'),(14,'G','3G2','169','Street - Other'),(15,'H','3H1','129','Street - Residential'),(16,'G','3G1','670','Street - Alley'),(17,'H','3H2','136','Street - Residential'),(18,'H','3H2','137','Street - Commercial'),(19,'G','3G1','116','Street - Alley'),(20,'G','3G1','94','Street - Other'),(21,'I','3I1','148','Street - In vehicle'),(22,'G','3G1','90','Residence - Mobile Home'),(23,'G','3G1','108','Street - Commercial'),(24,'G','3G2','118','Church/Synagogue/Temple'),(25,'G','3G1','88','Parking Lot - Residential'),(26,'H','3H1','132','Street - Residential'),(27,'G','3G1','669','Street - Other'),(28,'G','3G1','116','Street - Residential'),(29,'G','3G1','109','Parking Garage - County'),(30,'G','3G1','90','Street - Residential'),(31,'I','3I1','376','Retail - Other'),(32,'G','3G1','90','Convenience Store'),(33,'G','3G1','90','Gas Station'),(34,'G','3G1','110','Residence - Apt Ofc/Storage'),(35,'G','3G1','90','Street - Other'),(36,'G','3G1','94','Convenience Store'),(37,'G','3G1','668','Street - Residential'),(38,'G','3G1','113','Street - Alley'),(39,'H','3H2','137','Parking Lot - Residential'),(40,'H','3H2','140','Parking Lot - Other'),(41,'G','3G1','93','Street - Other'),(42,'G','3G2','175','Residence - Single Family'),(43,'I','3I1','145','Parking Lot - Residential'),(44,'G','3G1','89','Retail - Drug Store/Pharmacy'),(45,'H','3H2','137','Street - In vehicle'),(46,'G','3G1','95','Residence - Apartment/Condo'),(47,'G','3G1','90','Commercial - Office Building'),(48,'G','3G1','109','Street - Commercial'),(49,'I','3I1','145','Street - Other'),(50,'G','3G1','111','Gas Station'),(51,'H','3H2','144','Street - Residential'),(52,'I','3I2','380','Residence - Single Family'),(53,'I','3I1','145','Street - Residential'),(54,'G','3G2','118','Residence - Apartment/Condo'),(55,'I','3I2','378','Residence - Yard'),(56,'G','3G1','108','Hotel/Motel/Etc.'),(57,'G','3G1','89','Gas Station'),(58,'I','3I2','381','Street - Residential'),(59,'G','3G1','91','Street - Commercial'),(60,'H','3H1','128','Street - In vehicle'),(61,'G','3G2','118','Street - Residential'),(62,'G','3G1','671','Street - Residential'),(63,'G','3G1','93','Street - Alley'),(64,'G','3G1','95','Street - Commercial'),(65,'H','3H1','131','Street - Residential'),(66,'H','3H2','157','Street - Other'),(67,'G','3G1','95','Street - Residential'),(68,'H','3H2','141','Convenience Store'),(69,'G','3G1','109','Bank - ATM'),(70,'H','3H1','133','Street - Other'),(71,'H','3H1','133','Parking Lot - Residential'),(72,'G','3G1','89','Parking Lot - Residential'),(73,'G','3G1','108','Parking Garage - Residential'),(74,'I','3I1','518','Residence - Apartment/Condo'),(75,'H','3H1','133','Check Cashing Est.'),(76,'H','3H1','127','Parking Lot - Other'),(77,'G','3G2','653','Street - Other'),(78,'I','3I1','146','Bank - ATM'),(79,'G','3G1','94','Street - Commercial'),(80,'I','3I2','379','Restaurant'),(81,'H','3H1','126','Street - Bus Stop'),(82,'G','3G1','514','Street - Residential'),(83,'I','3I1','518','Gas Station'),(84,'G','3G1','110','Street - Commercial'),(85,'H','3H1','128','Street - Residential'),(86,'I','3I1','146','Street - Residential'),(87,'G','3G1','670','Convenience Store'),(88,'G','3G1','90','Hotel/Motel/Etc.'),(89,'H','3H2','137','Residence - Yard'),(90,'H','3H1','133','Street - Residential'),(91,'I','3I2','380','Residence - Apartment/Condo'),(92,'H','3H1','132','Residence - Yard'),(93,'H','3H2','153','Street - Residential'),(94,'I','3I1','149','Street - Residential'),(95,'G','3G1','90','Street - In vehicle'),(96,'G','3G1','670','Bank/S&L/Credit Union'),(97,'G','3G1','667','Residence - Apartment/Condo'),(98,'H','3H2','143','Retail - Appliances/Electronics'),(99,'G','3G1','109','Bank/S&L/Credit Union'),(100,'H','3H2','138','Street - Other'),(101,'G','3G1','109','Street - In vehicle'),(102,'G','3G1','514','Park'),(103,'G','3G2','118','Parking Lot - Residential'),(104,'H','3H2','654','Street - Other'),(105,'G','3G1','108','Street - Alley'),(106,'I','3I1','146','Street - Other'),(107,'G','3G1','93','Parking Garage - Commercial'),(108,'I','3I1','146','Parking Lot - Commercial'),(109,'G','3G1','108','Parking Lot - Commercial'),(110,'I','3I2','381','Residence - Apartment/Condo'),(111,'H','3H2','136','Street - Other'),(112,'G','3G1','93','Street - Commercial');
/*!40000 ALTER TABLE `patrolareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_location_type`
--

DROP TABLE IF EXISTS `vw_location_type`;
/*!50001 DROP VIEW IF EXISTS `vw_location_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_location_type` AS SELECT 
 1 AS `Location Type`,
 1 AS `Incident Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_robbery_trend`
--

DROP TABLE IF EXISTS `vw_monthly_robbery_trend`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_robbery_trend`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monthly_robbery_trend` AS SELECT 
 1 AS `Month ID`,
 1 AS `Month Name`,
 1 AS `Incident Count`,
 1 AS `Offense Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_offenses_by_crime_name`
--

DROP TABLE IF EXISTS `vw_offenses_by_crime_name`;
/*!50001 DROP VIEW IF EXISTS `vw_offenses_by_crime_name`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_offenses_by_crime_name` AS SELECT 
 1 AS `Crime Name`,
 1 AS `Offense Count`,
 1 AS `Incident Count`,
 1 AS `Total Victims`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_patrol_areas`
--

DROP TABLE IF EXISTS `vw_top_patrol_areas`;
/*!50001 DROP VIEW IF EXISTS `vw_top_patrol_areas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_patrol_areas` AS SELECT 
 1 AS `PatrolAreaID`,
 1 AS `Sector`,
 1 AS `Beat`,
 1 AS `PRA`,
 1 AS `Place`,
 1 AS `incident_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_weapon_use_summary`
--

DROP TABLE IF EXISTS `vw_weapon_use_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_weapon_use_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_weapon_use_summary` AS SELECT 
 1 AS `Weapon Type`,
 1 AS `Offense Count`,
 1 AS `Incident Count`,
 1 AS `Total Victims`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_location_type`
--

/*!50001 DROP VIEW IF EXISTS `vw_location_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_location_type` AS select `pa`.`Place` AS `Location Type`,count(distinct `i`.`IncidentID`) AS `Incident Count` from (`incidents` `i` join `patrolareas` `pa` on((`pa`.`PatrolAreaID` = `i`.`PatrolAreaID`))) where (`pa`.`Place` is not null) group by `pa`.`Place` having (count(distinct `i`.`IncidentID`) >= 3) order by 'Incident Count' desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_robbery_trend`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_robbery_trend`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_robbery_trend` AS select month(`i`.`Start_Date_Time`) AS `Month ID`,monthname(`i`.`Start_Date_Time`) AS `Month Name`,count(distinct `i`.`IncidentID`) AS `Incident Count`,count(`o`.`OffenseID`) AS `Offense Count` from (`incidents` `i` join `offenses` `o` on((`o`.`IncidentID` = `i`.`IncidentID`))) where (year(`i`.`Start_Date_Time`) = 2020) group by month(`i`.`Start_Date_Time`),monthname(`i`.`Start_Date_Time`) having (count(distinct `i`.`IncidentID`) >= 5) order by 'Month ID' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_offenses_by_crime_name`
--

/*!50001 DROP VIEW IF EXISTS `vw_offenses_by_crime_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_offenses_by_crime_name` AS select `ct`.`CrimeName3` AS `Crime Name`,count(`o`.`OffenseID`) AS `Offense Count`,count(distinct `i`.`IncidentID`) AS `Incident Count`,sum(`o`.`Victims`) AS `Total Victims` from ((`offenses` `o` join `incidents` `i` on((`i`.`IncidentID` = `o`.`IncidentID`))) join `crimetypes` `ct` on((`ct`.`OffenseCode` = `o`.`OffenseCode`))) group by `ct`.`CrimeName3` order by 'Offense Count' desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_patrol_areas`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_patrol_areas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_patrol_areas` AS select `pa`.`PatrolAreaID` AS `PatrolAreaID`,`pa`.`Sector` AS `Sector`,`pa`.`Beat` AS `Beat`,`pa`.`PRA` AS `PRA`,`pa`.`Place` AS `Place`,count(`i`.`IncidentID`) AS `incident_count` from (`patrolareas` `pa` join `incidents` `i` on((`i`.`PatrolAreaID` = `pa`.`PatrolAreaID`))) group by `pa`.`PatrolAreaID`,`pa`.`Sector`,`pa`.`Beat`,`pa`.`PRA`,`pa`.`Place` having (count(`i`.`IncidentID`) > (select avg(`per_area`.`area_count`) from (select count(`incidents`.`IncidentID`) AS `area_count` from `incidents` group by `incidents`.`PatrolAreaID`) `per_area`)) order by `incident_count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_weapon_use_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_weapon_use_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_weapon_use_summary` AS select (case when (`ct`.`CrimeName3` like '%GUN%') then 'Gun' when (`ct`.`CrimeName3` like '%KNIFE%') then 'Knife' when ((`ct`.`CrimeName3` like '%STRONG-ARM%') or (`ct`.`CrimeName3` like '%STRONG ARM%')) then 'Strong-Arm' when (`ct`.`CrimeName3` like '%OTHER WEAPON%') then 'Other Weapon' else 'Unspecified' end) AS `Weapon Type`,count(`o`.`OffenseID`) AS `Offense Count`,count(distinct `i`.`IncidentID`) AS `Incident Count`,sum(`o`.`Victims`) AS `Total Victims` from ((`offenses` `o` join `incidents` `i` on((`i`.`IncidentID` = `o`.`IncidentID`))) join `crimetypes` `ct` on((`ct`.`OffenseCode` = `o`.`OffenseCode`))) group by `Weapon Type` order by `Offense Count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-06 14:51:18
