CREATE DATABASE  IF NOT EXISTS `testproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testproject`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testproject
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `acknowledgement`
--

DROP TABLE IF EXISTS `acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acknowledgement` (
  `desk_no` int NOT NULL,
  `payment_details` varchar(100) NOT NULL,
  `issue_date` varchar(45) NOT NULL,
  `month` varchar(45) NOT NULL,
  `financial_year` varchar(45) NOT NULL,
  `cheque_no` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `cheque_date` varchar(45) NOT NULL,
  `insert_by` varchar(45) DEFAULT '-',
  `insert_ip` varchar(100) DEFAULT '-',
  `insert_dt` varchar(100) DEFAULT '-',
  `update_by` varchar(45) DEFAULT '-',
  `update_ip` varchar(100) DEFAULT '-',
  `update_dt` varchar(100) DEFAULT '-',
  `status` int DEFAULT '0',
  `comment` varchar(45) DEFAULT '-',
  KEY `ack_insert_by_idx` (`insert_by`),
  KEY `ack_update_by_idx` (`update_by`),
  CONSTRAINT `ack_insert_by` FOREIGN KEY (`insert_by`) REFERENCES `register` (`username`),
  CONSTRAINT `ack_update_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledgement`
--

LOCK TABLES `acknowledgement` WRITE;
/*!40000 ALTER TABLE `acknowledgement` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approved_acknowledgement`
--

DROP TABLE IF EXISTS `approved_acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approved_acknowledgement` (
  `desk_no` int DEFAULT NULL,
  `payment_details` varchar(100) DEFAULT NULL,
  `issue_date` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `cheque_no` varchar(45) NOT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `cheque_date` varchar(45) DEFAULT NULL,
  `insert_dt` datetime DEFAULT NULL,
  `insert_by` varchar(45) DEFAULT NULL,
  `insert_ip` varchar(100) DEFAULT NULL,
  `update_dt` datetime DEFAULT NULL,
  `update_by` varchar(45) DEFAULT NULL,
  `update_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cheque_no`),
  KEY `approved_ack_updatet_by_idx` (`update_by`),
  KEY `approved_ack_insert_by_idx` (`insert_by`),
  CONSTRAINT `approved_ack_insert_by` FOREIGN KEY (`insert_by`) REFERENCES `register` (`username`),
  CONSTRAINT `approved_ack_updatet_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_acknowledgement`
--

LOCK TABLES `approved_acknowledgement` WRITE;
/*!40000 ALTER TABLE `approved_acknowledgement` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_ack2` AFTER INSERT ON `approved_acknowledgement` FOR EACH ROW UPDATE cash_book_total_val 
SET total_expenditure = total_expenditure + NEW.amount,
closing_bal = closing_bal - NEW.amount
WHERE (cash_book_total_val.month = MONTHNAME(NEW.insert_dt) AND cash_book_total_val.financial_year=Year(NEW.insert_dt)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `up_ack2` BEFORE UPDATE ON `approved_acknowledgement` FOR EACH ROW if(old.amount>new.amount)
THEN
Set @val = old.amount-new.amount;
UPDATE cash_book_total_val 
SET total_expenditure = (total_receipt_amount+gras_total+opening_bal)-(total_expenditure- @val),
closing_bal = closing_bal + @val
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
ELSE     
Set @val = new.amount-old.amount;
UPDATE cash_book_total_val 
SET total_expenditure = (total_receipt_amount+gras_total+opening_bal)-(total_expenditure+ @val),
closing_bal = closing_bal - @val
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `approved_gras`
--

DROP TABLE IF EXISTS `approved_gras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approved_gras` (
  `gras_receipt_no` varchar(45) NOT NULL,
  `month` varchar(45) DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `major_head` varchar(45) DEFAULT NULL,
  `scheme` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `insert_ip` varchar(45) DEFAULT NULL,
  `insert_dt` datetime DEFAULT NULL,
  `insert_by` varchar(45) DEFAULT NULL,
  `update_ip` varchar(45) DEFAULT NULL,
  `update_dt` datetime DEFAULT NULL,
  `update_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gras_receipt_no`),
  KEY `insert_by_idx` (`insert_by`),
  KEY `update_by_idx` (`update_by`),
  CONSTRAINT `approved_gras_insert_by` FOREIGN KEY (`insert_by`) REFERENCES `register` (`username`),
  CONSTRAINT `approved_gras_update_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_gras`
--

LOCK TABLES `approved_gras` WRITE;
/*!40000 ALTER TABLE `approved_gras` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_gras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gras_new2` AFTER INSERT ON `approved_gras` FOR EACH ROW UPDATE cash_book_total_val 
SET gras_total = gras_total + NEW.amount,
closing_bal = closing_bal + NEW.amount
WHERE (cash_book_total_val.month = MONTHNAME(NEW.insert_dt) AND cash_book_total_val.financial_year=Year(NEW.insert_dt)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `up_gras2` BEFORE UPDATE ON `approved_gras` FOR EACH ROW if(old.amount>new.amount)
THEN
Set @val = old.amount-new.amount;
UPDATE cash_book_total_val 
SET 
closing_bal = ((gras_total  - @val)+total_receipt_amount)-total_expenditure,

gras_total = gras_total  - @val
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
ELSE     
Set @val = new.amount-old.amount;
UPDATE cash_book_total_val 
SET 
closing_bal = closing_bal + @val,
gras_total = gras_total + @val
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `approved_remittance`
--

DROP TABLE IF EXISTS `approved_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approved_remittance` (
  `letter_no` varchar(45) NOT NULL,
  `so2_no` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `major_head` varchar(45) DEFAULT NULL,
  `scheme` varchar(45) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `cheque_no` varchar(45) DEFAULT NULL,
  `cheque_payable` varchar(45) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `insert_dt` datetime DEFAULT NULL,
  `insert_ip` varchar(100) DEFAULT NULL,
  `insert_by` varchar(45) DEFAULT NULL,
  `update_dt` datetime DEFAULT NULL,
  `update_ip` varchar(100) DEFAULT NULL,
  `update_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`letter_no`),
  KEY `inert_by_idx` (`insert_by`),
  KEY `update_by_idx` (`update_by`),
  CONSTRAINT `inert_by` FOREIGN KEY (`insert_by`) REFERENCES `register` (`username`),
  CONSTRAINT `update_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_remittance`
--

LOCK TABLES `approved_remittance` WRITE;
/*!40000 ALTER TABLE `approved_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_remittance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_remittance2` AFTER INSERT ON `approved_remittance` FOR EACH ROW UPDATE cash_book_total_val 
SET total_receipt_amount = total_receipt_amount + NEW.amount,
closing_bal = closing_bal + NEW.amount
WHERE (cash_book_total_val.month = MONTHNAME(NEW.insert_dt) AND cash_book_total_val.financial_year=Year(NEW.insert_dt)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `up_remittance2` BEFORE UPDATE ON `approved_remittance` FOR EACH ROW if(old.amount>new.amount)
THEN
Set @val = old.amount-new.amount;
UPDATE cash_book_total_val 
SET total_receipt_amount = total_receipt_amount - @val,
closing_bal = ((total_receipt_amount - @val)+gras_total+opening_bal)-total_expenditure
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
ELSE     
Set @val = new.amount-old.amount;
UPDATE cash_book_total_val 
SET total_receipt_amount = total_receipt_amount + @val,
closing_bal = ((total_receipt_amount + @val)+gras_total+opening_bal)-total_expenditure
WHERE (cash_book_total_val.month = MONTHNAME(NEW.update_dt) AND cash_book_total_val.financial_year=Year(NEW.update_dt));
end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cash_book_total_val`
--

DROP TABLE IF EXISTS `cash_book_total_val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_book_total_val` (
  `month` varchar(45) NOT NULL,
  `financial_year` varchar(45) NOT NULL,
  `total_receipt_amount` int DEFAULT '0',
  `gras_total` int NOT NULL DEFAULT '0',
  `total_expenditure` int DEFAULT '0',
  `opening_bal` int NOT NULL DEFAULT '0',
  `closing_bal` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_book_total_val`
--

LOCK TABLES `cash_book_total_val` WRITE;
/*!40000 ALTER TABLE `cash_book_total_val` DISABLE KEYS */;
INSERT INTO `cash_book_total_val` VALUES ('May','2020',0,0,0,0,0),('June','2020',0,0,0,0,0);
/*!40000 ALTER TABLE `cash_book_total_val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desk`
--

DROP TABLE IF EXISTS `desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desk` (
  `desk` int NOT NULL,
  PRIMARY KEY (`desk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desk`
--

LOCK TABLES `desk` WRITE;
/*!40000 ALTER TABLE `desk` DISABLE KEYS */;
INSERT INTO `desk` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `district` varchar(45) NOT NULL,
  PRIMARY KEY (`district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('Jalgaon'),('Mumbai'),('sindhudurg'),('Thane');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_log` (
  `page_name` varchar(45) NOT NULL,
  `error_date` datetime DEFAULT NULL,
  `error` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gras`
--

DROP TABLE IF EXISTS `gras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gras` (
  `gras_receipt_no` varchar(45) NOT NULL,
  `month` varchar(45) NOT NULL,
  `financial_year` varchar(45) NOT NULL,
  `major_head` varchar(45) NOT NULL,
  `scheme` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `insert_ip` varchar(45) NOT NULL DEFAULT '-',
  `insert_by` varchar(45) NOT NULL DEFAULT '-',
  `insert_dt` varchar(100) NOT NULL DEFAULT '-',
  `update_ip` varchar(45) NOT NULL DEFAULT '-',
  `update_by` varchar(45) DEFAULT NULL,
  `update_dt` varchar(100) NOT NULL DEFAULT '-',
  `status` int DEFAULT '0',
  `comment` varchar(45) DEFAULT '-',
  UNIQUE KEY `gras_receipt_no_UNIQUE` (`gras_receipt_no`),
  KEY `gras_in_by_idx` (`insert_by`),
  KEY `gras_up_by_idx` (`update_by`),
  CONSTRAINT `gras_up_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='dt-date and time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gras`
--

LOCK TABLES `gras` WRITE;
/*!40000 ALTER TABLE `gras` DISABLE KEYS */;
/*!40000 ALTER TABLE `gras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_check`
--

DROP TABLE IF EXISTS `login_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_check` (
  `username` varchar(45) NOT NULL,
  `user_ip` varchar(45) DEFAULT NULL,
  `login_status` tinyint DEFAULT NULL,
  `login_dt` datetime DEFAULT NULL,
  `logout_dt` datetime DEFAULT NULL,
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `register` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_check`
--

LOCK TABLES `login_check` WRITE;
/*!40000 ALTER TABLE `login_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_head`
--

DROP TABLE IF EXISTS `major_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_head` (
  `major_head` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`major_head`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_head`
--

LOCK TABLES `major_head` WRITE;
/*!40000 ALTER TABLE `major_head` DISABLE KEYS */;
INSERT INTO `major_head` VALUES ('4408');
/*!40000 ALTER TABLE `major_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `reg_dt` varchar(100) DEFAULT NULL,
  `confirmed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('Admin ','admin2020','ritvij05@gmail.com','[\"$2a$10$eZRDiO.89O2ZLdUgN0joueZ1B6jMBw1HtZ.zmhTIuTKMH9/uGF0Pa\",\"$2a$10$Fpjp8CLE8O6nYlFZb1J79evgWWlHVgQhhxQPYvNRITdvkYkMUMYXW\"]','Admin','103.48.101.131','Wed Jun 17 2020 13:30:43 GMT+0530 (India Standard Time)',2),('Senior','Senior','ritvij.iyer17@siesgst.ac.in','[\"$2a$10$pbsYeNk1QgbiA/0yNm.PsOJouk0DfOjcsGGIv.T0Tvjopkt6fTe4K\",\"$2a$10$C6SkQi.TJz0arLa.v4yXRuj8n5uuIBiXjc67FltFUpR6QxDRi1xDq\"]','ABC','103.48.101.131','Wed Jun 17 2020 13:35:22 GMT+0530 (India Standard Time)',2);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remittance`
--

DROP TABLE IF EXISTS `remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remittance` (
  `letter_no` varchar(45) NOT NULL,
  `so2_no` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `month` varchar(45) NOT NULL,
  `financial_year` varchar(45) NOT NULL,
  `major_head` varchar(45) NOT NULL,
  `scheme` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `cheque_no` varchar(45) NOT NULL DEFAULT '-',
  `cheque_payable` varchar(45) NOT NULL DEFAULT '-',
  `bank_name` varchar(45) NOT NULL DEFAULT '-',
  `branch_name` varchar(45) NOT NULL DEFAULT '-',
  `amount` varchar(45) NOT NULL,
  `insert_ip` varchar(100) NOT NULL DEFAULT '-',
  `insert_by` varchar(100) NOT NULL DEFAULT '-',
  `insert_dt` varchar(100) NOT NULL DEFAULT '-',
  `update_by` varchar(45) DEFAULT NULL,
  `update_dt` varchar(100) NOT NULL DEFAULT '-',
  `update_ip` varchar(100) NOT NULL DEFAULT '-',
  `status` int DEFAULT '0',
  `comment` varchar(45) DEFAULT '-',
  KEY `r_insert_by_idx` (`insert_by`),
  KEY `r_update_by_idx` (`update_by`),
  CONSTRAINT `r_insert_by` FOREIGN KEY (`insert_by`) REFERENCES `register` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `r_update_by` FOREIGN KEY (`update_by`) REFERENCES `register` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remittance`
--

LOCK TABLES `remittance` WRITE;
/*!40000 ALTER TABLE `remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheme`
--

DROP TABLE IF EXISTS `scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheme` (
  `scheme` varchar(45) NOT NULL,
  PRIMARY KEY (`scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheme`
--

LOCK TABLES `scheme` WRITE;
/*!40000 ALTER TABLE `scheme` DISABLE KEYS */;
INSERT INTO `scheme` VALUES ('4408-16601'),('4408-scheme2'),('4408-scheme3');
/*!40000 ALTER TABLE `scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES ('ABC'),('Admin'),('DDO'),('FADS'),('Jr.Accountant'),('Sr. Clerk (1)'),('Super-Intendent');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testproject'
--

--
-- Dumping routines for database 'testproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 10:07:26
