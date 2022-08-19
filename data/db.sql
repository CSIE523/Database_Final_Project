CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Brandname` varchar(255) NOT NULL,
  `Brand_Location` varchar(255) NOT NULL,
  `Founded` int DEFAULT NULL,
  PRIMARY KEY (`Brandname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES ('AEON','Tainan, Taiwan',1998),('HARTFORD','Taichung, Taiwan',1995),('HONDA','Tokyo, Japan',1948),('KAWASAKI','Tokyo, Japan',1896),('KYMCO','Kaohsiung, Taiwan',1963),('PGO','Changhua, Taiwan',1964),('SUZUKI','Shizuoka, Japan',1920),('SYM','Hsinchu, Taiwan',1954),('VESPA','Pontedera, Italy',1946),('YAMAHA','Shizuoka, Japan',1955);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customername` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Engine_number` varchar(255) NOT NULL,
  PRIMARY KEY (`Engine_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('John','MY','AM81CL-688521'),('Sandy','HS','HH67BG-153545'),('Ethan','MSX','HM15GB-156167'),('Carol','ZX25R','KZ35BK-984651'),('Ashley','BON','PB23TY-276433'),('Gary','DUKE','SD25VD-846616'),('Amy','GP','SJ25ZN-511887'),('Sean','TU','ST46TR-865355'),('Jack','LX','VL90TE-469853'),('Maggie','MT15','YM24JR-247853');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_store`
--

DROP TABLE IF EXISTS `parts_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_store` (
  `PSname` varchar(255) NOT NULL,
  `PS_Location` varchar(255) NOT NULL,
  `PS_Boss` varchar(255) NOT NULL,
  PRIMARY KEY (`PSname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_store`
--

LOCK TABLES `parts_store` WRITE;
/*!40000 ALTER TABLE `parts_store` DISABLE KEYS */;
INSERT INTO `parts_store` VALUES ('Adrea','Pontedera, Italy','Irving'),('Cirokiya','Tokyo, Japan','James'),('Da-Taichung','Taichung, Taiwan','Stephen'),('Daiking','Hsinchu, Taiwan','Louis'),('Sakura','Tokyo, Japan','Nick'),('Shun-Hing','Tainan, Taiwan','Ray'),('Wanyi','Kaohsiung, Taiwan','Steve'),('Watami','Shizuoka, Japan','Tony'),('Xinhong','Changhua, Taiwan','Willy'),('Yocinoya','Shizuoka, Japan','Will');
/*!40000 ALTER TABLE `parts_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairment`
--

DROP TABLE IF EXISTS `repairment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairment` (
  `ID` varchar(255) NOT NULL,
  `Time` varchar(255) NOT NULL,
  `Part` varchar(255) NOT NULL,
  `Part_supplier` varchar(255) NOT NULL,
  `Store` varchar(255) NOT NULL,
  `Engine_number` varchar(255) NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairment`
--

LOCK TABLES `repairment` WRITE;
/*!40000 ALTER TABLE `repairment` DISABLE KEYS */;
INSERT INTO `repairment` VALUES ('0','9:20','Tire','Wanyi','Honglong','SJ25ZN-511887',900),('1','13:47','Drive belt','Xinhong','Yongjiang','PB23TY-276433',1200),('2','18:36','Brake pad','Cirokiya','Xinguo','KZ35BK-984651',250),('3','10:50','Spark plug','Sakura','Tongxing','HM15GB-156167',120),('4','12:43','Piston','Daiking','Quanli','SD25VD-846616',3500),('5','19:01','Oil','Adrea','Dazhan','VL90TE-469853',250),('6','20:41','Tire','Shun-Hing','Ancheng','AM81CL-688521',700),('7','11:25','Chain','Watami','Jinyi','YM24JR-247853',450),('8','15:07','Tire','Da-Taichung','Jinchu','HH67BG-153545',900),('9','14:54','Oil','Yocinoya','Qiyi','ST46TR-865355',350);
/*!40000 ALTER TABLE `repairment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `Storename` varchar(255) NOT NULL,
  `Store_Location` varchar(255) NOT NULL,
  `Store_Brand` varchar(255) NOT NULL,
  `Store_Boss` varchar(255) NOT NULL,
  PRIMARY KEY (`Storename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES ('Ancheng','Anping Dist., Tainan, Taiwan','AEON','Joe'),('Dazhan','West Central Dist., Tainan, Taiwan','VESPA','Mary'),('Honglong','Annan Dist., Tainan, Taiwan','KYMCO','Vincent'),('Jinchu','North Dist., Tainan, Taiwan','HARTFORD','Jimmy'),('Jinyi','Rende Dist., Tainan, Taiwan','YAMAHA','Jerry'),('Qiyi','Guiren Dist., Tainan, Taiwan','SUZUKI','Rick'),('Quanli','South Dist., Tainan, Taiwan','SYM','Paul'),('Tongxing','Yongkang Dist., Tainan, Taiwan','HONDA','Ross'),('Xinguo',' East Dist., Tainan, Taiwan','KAWASAKI','Vic'),('Yongjiang','Xinshi Dist., Tainan, Taiwan','PGO','Thomas');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `Typename` varchar(255) NOT NULL,
  `Displacement` varchar(255) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Classification` varchar(255) NOT NULL,
  PRIMARY KEY (`Typename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES ('BON','125','PGO','scooter'),('DUKE','125','SYM','scooter'),('GP','125','KYMCO','scooter'),('HS','150','HARTFORD','motorcycle'),('LX','150','VESPA','scooter'),('MSX','125','HONDA','motorcycle'),('MT15','150','YAMAHA','motorcycle'),('MY','150','AEON','motorcycle'),('TU','250','SUZUKI','motorcycle'),('ZX25R','250','KAWASAKI','motorcycle');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10 14:45:34
