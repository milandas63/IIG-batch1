-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: assessment
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `assess_answer_001`
--

DROP TABLE IF EXISTS `assess_answer_001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_answer_001` (
  `answer_slno` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_desc` varchar(200) NOT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`answer_slno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_answer_001`
--

LOCK TABLES `assess_answer_001` WRITE;
/*!40000 ALTER TABLE `assess_answer_001` DISABLE KEYS */;
INSERT INTO `assess_answer_001` VALUES (1,1,'94',1,'2021-03-03 07:43:24',NULL),(2,1,'92',1,'2021-03-03 07:43:24',NULL),(3,1,'90',1,'2021-03-03 07:43:24',NULL),(4,1,'88',1,'2021-03-03 07:43:24',NULL),(5,2,'9',1,'2021-03-03 07:43:24',NULL),(6,2,'4',1,'2021-03-03 07:43:24',NULL),(7,2,'0',1,'2021-03-03 07:43:24',NULL),(8,2,'7',1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_answer_001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assess_question_level`
--

DROP TABLE IF EXISTS `assess_question_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_question_level` (
  `question_level_id` int(6) NOT NULL AUTO_INCREMENT,
  `question_level_desc` varchar(100) NOT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`question_level_id`),
  UNIQUE KEY `question_level_desc` (`question_level_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_question_level`
--

LOCK TABLES `assess_question_level` WRITE;
/*!40000 ALTER TABLE `assess_question_level` DISABLE KEYS */;
INSERT INTO `assess_question_level` VALUES (1,'Beginner',1,'2021-03-03 07:43:24',NULL),(2,'Easy',1,'2021-03-03 07:43:24',NULL),(3,'Medium',1,'2021-03-03 07:43:24',NULL),(4,'Hard',1,'2021-03-03 07:43:24',NULL),(5,'Challenging',1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_question_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assess_question_subject`
--

DROP TABLE IF EXISTS `assess_question_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_question_subject` (
  `question_subject_id` int(6) NOT NULL AUTO_INCREMENT,
  `question_subject_group_id` int(6) NOT NULL,
  `question_subject_desc` varchar(100) NOT NULL,
  `question_subject_abbr` varchar(100) DEFAULT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`question_subject_id`),
  UNIQUE KEY `question_subject_desc` (`question_subject_desc`),
  UNIQUE KEY `question_subject_abbr` (`question_subject_abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_question_subject`
--

LOCK TABLES `assess_question_subject` WRITE;
/*!40000 ALTER TABLE `assess_question_subject` DISABLE KEYS */;
INSERT INTO `assess_question_subject` VALUES (1,1,'Algebra','QA-01',1,'2021-03-03 07:43:24',NULL),(2,1,'Alligations or Mixtures','QA-02',1,'2021-03-03 07:43:24',NULL),(3,1,'Area','QA-03',1,'2021-03-03 07:43:24',NULL),(4,1,'Problems on Age','QA-04',1,'2021-03-03 07:43:24',NULL),(5,1,'Averages, Mean, Median and Mode','QA-05',1,'2021-03-03 07:43:24',NULL),(6,1,'Banker\'s Discount','QA-06',1,'2021-03-03 07:43:24',NULL),(7,1,'Boat and Stream Problems','QA-07',1,'2021-03-03 07:43:24',NULL),(8,1,'Chain Rule','QA-08',1,'2021-03-03 07:43:24',NULL),(9,1,'Calendar','QA-09',1,'2021-03-03 07:43:24',NULL),(10,1,'Clock','QA-10',1,'2021-03-03 07:43:24',NULL),(11,1,'True Discount','QA-11',1,'2021-03-03 07:43:24',NULL),(12,1,'Data Interpretation','QA-12',1,'2021-03-03 07:43:24',NULL),(13,1,'Decimal Fraction','QA-13',1,'2021-03-03 07:43:24',NULL),(14,1,'Games and Races','QA-14',1,'2021-03-03 07:43:24',NULL),(15,1,'Heights and distances','QA-15',1,'2021-03-03 07:43:24',NULL),(16,1,'Inequalities','QA-16',1,'2021-03-03 07:43:24',NULL),(17,1,'Problem on Number Series','QA-17',1,'2021-03-03 07:43:24',NULL),(18,1,'LCM and HCF','QA-18',1,'2021-03-03 07:43:24',NULL),(19,1,'Linear Equations','QA-19',1,'2021-03-03 07:43:24',NULL),(20,1,'Logarithms','QA-20',1,'2021-03-03 07:43:24',NULL),(21,1,'Number theory','QA-21',1,'2021-03-03 07:43:24',NULL),(22,1,'Number System ÔÇô Fractions, Decimals','QA-22',1,'2021-03-03 07:43:24',NULL),(23,1,'Odd Man Out and Series','QA-23',1,'2021-03-03 07:43:24',NULL),(24,1,'Partnerships','QA-24',1,'2021-03-03 07:43:24',NULL),(25,1,'Percentage','QA-25',1,'2021-03-03 07:43:24',NULL),(26,1,'Permutation and Combinations','QA-26',1,'2021-03-03 07:43:24',NULL),(27,1,'Pipes and Cisterns','QA-27',1,'2021-03-03 07:43:24',NULL),(28,1,'Points, lines and angles','QA-28',1,'2021-03-03 07:43:24',NULL),(29,1,'Probability','QA-29',1,'2021-03-03 07:43:24',NULL),(30,1,'Profit and Loss','QA-30',1,'2021-03-03 07:43:24',NULL),(31,1,'Progressions','QA-31',1,'2021-03-03 07:43:24',NULL),(32,1,'Quadratic Equations','QA-32',1,'2021-03-03 07:43:24',NULL),(33,1,'Ratio and Proportions','QA-33',1,'2021-03-03 07:43:24',NULL),(34,1,'Remainder theorem and unit digit','QA-34',1,'2021-03-03 07:43:24',NULL),(35,1,'Sets and Venn Diagrams','QA-35',1,'2021-03-03 07:43:24',NULL),(36,1,'Simple and Compound Interest','QA-36',1,'2021-03-03 07:43:24',NULL),(37,1,'Simplification and Approximation','QA-37',1,'2021-03-03 07:43:24',NULL),(38,1,'Speed, Distance and Time','QA-38',1,'2021-03-03 07:43:24',NULL),(39,1,'Square Root and Cube Root','QA-39',1,'2021-03-03 07:43:24',NULL),(40,1,'Stocks and Shares','QA-40',1,'2021-03-03 07:43:24',NULL),(41,1,'Number Data Sufficiency','QA-41',1,'2021-03-03 07:43:24',NULL),(42,1,'Surds, Indices, Exponents, and Powers','QA-42',1,'2021-03-03 07:43:24',NULL),(43,1,'Surface Area','QA-43',1,'2021-03-03 07:43:24',NULL),(44,1,'Time and Distance','QA-44',1,'2021-03-03 07:43:24',NULL),(45,1,'Time and Work','QA-45',1,'2021-03-03 07:43:24',NULL),(46,1,'Problems on Ages','QA-46',1,'2021-03-03 07:43:24',NULL),(47,1,'Problems on Train','QA-47',1,'2021-03-03 07:43:24',NULL),(48,1,'Trigonometry','QA-48',1,'2021-03-03 07:43:24',NULL),(49,1,'Volumes','QA-49',1,'2021-03-03 07:43:24',NULL),(50,1,'Work and Wages','QA-50',1,'2021-03-03 07:43:24',NULL),(51,2,'Spotting Errors','VA-51',1,'2021-03-03 07:43:24',NULL),(52,2,'Antonyms','VA-52',1,'2021-03-03 07:43:24',NULL),(53,2,'Synonyms','VA-53',1,'2021-03-03 07:43:24',NULL),(54,2,'Spellings','VA-54',1,'2021-03-03 07:43:24',NULL),(55,2,'Selecting Words','VA-55',1,'2021-03-03 07:43:24',NULL),(56,2,'Sentence Formation','VA-56',1,'2021-03-03 07:43:24',NULL),(57,2,'Ordering of Words','VA-57',1,'2021-03-03 07:43:24',NULL),(58,2,'Sentence Correction','VA-58',1,'2021-03-03 07:43:24',NULL),(59,2,'Ordering of Sentences','VA-59',1,'2021-03-03 07:43:24',NULL),(60,2,'Paragraph Formation','VA-60',1,'2021-03-03 07:43:24',NULL),(61,2,'Closet Test','VA-61',1,'2021-03-03 07:43:24',NULL),(62,2,'Comprehension','VA-62',1,'2021-03-03 07:43:24',NULL),(63,2,'One Word Substitutes','VA-63',1,'2021-03-03 07:43:24',NULL),(64,2,'Idioms and Phrases','VA-64',1,'2021-03-03 07:43:24',NULL),(65,2,'Change of Voice','VA-65',1,'2021-03-03 07:43:24',NULL),(66,2,'Change of Speech','VA-66',1,'2021-03-03 07:43:24',NULL),(67,2,'Verbal Analogies','VA-67',1,'2021-03-03 07:43:24',NULL),(68,2,'Articles','VA-68',1,'2021-03-03 07:43:24',NULL),(69,2,'Prepositions','VA-69',1,'2021-03-03 07:43:24',NULL),(70,2,'Adjectives','VA-70',1,'2021-03-03 07:43:24',NULL),(71,3,'Number Series','LRV-71',1,'2021-03-03 07:43:24',NULL),(72,3,'Letter Series','LRV-72',1,'2021-03-03 07:43:24',NULL),(73,3,'Analogies','LRV-73',1,'2021-03-03 07:43:24',NULL),(74,3,'Cause & Effect','LRV-74',1,'2021-03-03 07:43:24',NULL),(75,3,'Verbal Classification','LRV-75',1,'2021-03-03 07:43:24',NULL),(76,3,'Blood Relations','LRV-76',1,'2021-03-03 07:43:24',NULL),(77,3,'Logical Sequence of Words','LRV-77',1,'2021-03-03 07:43:24',NULL),(78,3,'Direction Sense Test','LRV-78',1,'2021-03-03 07:43:24',NULL),(79,3,'Logical Venn Diagram','LRV-79',1,'2021-03-03 07:43:24',NULL),(80,3,'Verification of the Truth of the Statement','LRV-80',1,'2021-03-03 07:43:24',NULL),(81,3,'Data Sufficiency','LRV-81',1,'2021-03-03 07:43:24',NULL),(82,3,'Coding Decoding','LRV-82',1,'2021-03-03 07:43:24',NULL),(83,3,'Assertion and Reason','LRV-83',1,'2021-03-03 07:43:24',NULL),(84,3,'Essential Part','LRV-84',1,'2021-03-03 07:43:24',NULL),(85,3,'Analyzing Arguments','LRV-85',1,'2021-03-03 07:43:24',NULL),(86,3,'Logical Problems','LRV-86',1,'2021-03-03 07:43:24',NULL),(87,3,'Course of Action','LRV-87',1,'2021-03-03 07:43:24',NULL),(88,3,'Matching Definition','LRV-88',1,'2021-03-03 07:43:24',NULL),(89,3,'Syllogism','LRV-89',1,'2021-03-03 07:43:24',NULL),(90,3,'Statement and Assumptions','LRV-90',1,'2021-03-03 07:43:24',NULL),(91,4,'Image Series','LRN-91',1,'2021-03-03 07:43:24',NULL),(92,4,'Construction of Shapes','LRN-92',1,'2021-03-03 07:43:24',NULL),(93,4,'Classification','LRN-93',1,'2021-03-03 07:43:24',NULL),(94,4,'Picture Analogies','LRN-94',1,'2021-03-03 07:43:24',NULL),(95,4,'Rule Detection','LRN-95',1,'2021-03-03 07:43:24',NULL),(96,5,'Basic Programs','PRO-96',1,'2021-03-03 07:43:24',NULL),(97,5,'Number Programs','PRO-97',1,'2021-03-03 07:43:24',NULL),(98,5,'Array Programs','PRO-98',1,'2021-03-03 07:43:24',NULL),(99,5,'Matrix Programs','PRO-99',1,'2021-03-03 07:43:24',NULL),(100,5,'Pattern Programs','PRO-100',1,'2021-03-03 07:43:24',NULL),(101,5,'String Programs','PRO-101',1,'2021-03-03 07:43:24',NULL),(102,5,'Tree Programs','PRO-102',1,'2021-03-03 07:43:24',NULL),(103,5,'Singly Linked List Programs','PRO-103',1,'2021-03-03 07:43:24',NULL),(104,5,'Circular Linked List Programs','PRO-104',1,'2021-03-03 07:43:24',NULL),(105,5,'Doubly Linked List Programs','PRO-105',1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_question_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assess_question_subject_group`
--

DROP TABLE IF EXISTS `assess_question_subject_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_question_subject_group` (
  `question_subject_group_id` int(6) NOT NULL AUTO_INCREMENT,
  `question_subject_group_desc` varchar(100) NOT NULL,
  `question_subject_group_abbr` varchar(50) DEFAULT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`question_subject_group_id`),
  UNIQUE KEY `question_subject_group_desc` (`question_subject_group_desc`),
  UNIQUE KEY `question_subject_group_abbr` (`question_subject_group_abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_question_subject_group`
--

LOCK TABLES `assess_question_subject_group` WRITE;
/*!40000 ALTER TABLE `assess_question_subject_group` DISABLE KEYS */;
INSERT INTO `assess_question_subject_group` VALUES (1,'QUANTITATIVE APTITUDE','QA',1,'2021-03-03 07:43:24',NULL),(2,'VERBAL ABILITY','VA',1,'2021-03-03 07:43:24',NULL),(3,'LOGICAL REASONING - VERBAL','LRV',1,'2021-03-03 07:43:24',NULL),(4,'LOGICAL REASONING - NON-VERBAL','LRN',1,'2021-03-03 07:43:24',NULL),(5,'PROGRAMMING','PRO',1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_question_subject_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assess_question_type`
--

DROP TABLE IF EXISTS `assess_question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_question_type` (
  `question_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `question_type_active` tinyint(1) DEFAULT 1,
  `question_type_desc` varchar(100) NOT NULL,
  `question_type_narr` varchar(100) NOT NULL,
  `question_type_abbr` varchar(50) DEFAULT NULL,
  `question_type_answer_table` varchar(50) NOT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`question_type_id`),
  UNIQUE KEY `question_type_desc` (`question_type_desc`),
  UNIQUE KEY `question_type_narr` (`question_type_narr`),
  UNIQUE KEY `question_type_abbr` (`question_type_abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_question_type`
--

LOCK TABLES `assess_question_type` WRITE;
/*!40000 ALTER TABLE `assess_question_type` DISABLE KEYS */;
INSERT INTO `assess_question_type` VALUES (1,1,'The Dichotomous Question','Among the Two (Male/Female)','TW','assess_answer_001',1,'2021-03-03 07:43:24',NULL),(2,1,'Multiple Choice Single selection Questions','Multiple Choice Single Selection Questions','MC1','assess_answer_002',1,'2021-03-03 07:43:24',NULL),(3,1,'Rank Order Scaling Question','Rank Order Question','RO','assess_answer_003',1,'2021-03-03 07:43:24',NULL),(4,1,'Text Slider Question','Rating Scale Question','RS','assess_answer_004',1,'2021-03-03 07:43:24',NULL),(5,1,'Likert Scale Question','Likert Scale Question','LS','assess_answer_005',1,'2021-03-03 07:43:24',NULL),(6,1,'Semantic Differential Scale','Semantic Differential Scale','SD','assess_answer_006',1,'2021-03-03 07:43:24',NULL),(7,1,'Stapel Scale Question','Stapel Scale Question','SS','assess_answer_007',1,'2021-03-03 07:43:24',NULL),(8,1,'Constant Sum Question','Constant Sum Question','CS','assess_answer_008',1,'2021-03-03 07:43:24',NULL),(9,1,'Comment Box Open Ended Question','Non-validated Text Question','NVT','assess_answer_009',1,'2021-03-03 07:43:24',NULL),(10,1,'Text Question','Validated Text Question','VT','assess_answer_010',1,'2021-03-03 07:43:24',NULL),(11,1,'Contact Information Question','Multiple Rows Of Text Indicated With A Title','MR','assess_answer_011',1,'2021-03-03 07:43:24',NULL),(12,1,'Demographic Question','Demographic Data From A Population Set','DD','assess_answer_012',1,'2021-03-03 07:43:24',NULL),(13,1,'Matrix Table Question','Tabular Choice Button Question','MTC','assess_answer_013',1,'2021-03-03 07:43:24',NULL),(14,1,'Side-by-Side Matrix Question','Multiple Rating Options Simultaneously','SSM','assess_answer_014',1,'2021-03-03 07:43:24',NULL),(15,1,'Star Rating Question','Middle Or Neutral Point In A Rating Survey','SR','assess_answer_015',1,'2021-03-03 07:43:24',NULL),(16,1,'Max Diff Question','Best And The Worst Indicator Attributes','MD','assess_answer_016',1,'2021-03-03 07:43:24',NULL),(17,1,'Push to Social Questions','Customer Satisfaction Issues And Negative Feedback','PS','assess_answer_017',1,'2021-03-03 07:43:24',NULL),(18,1,'Visual Analog Question','The smiley rating question','VA','assess_answer_018',1,'2021-03-03 07:43:24',NULL),(19,1,'Image Question','Pick The Images Having Common Attribute','IQ','assess_answer_019',1,'2021-03-03 07:43:24',NULL),(20,1,'Net Promoter Score (NPS) Question','For Understanding Of Satisfaction Level','NPS','assess_answer_020',1,'2021-03-03 07:43:24',NULL),(21,1,'Van Westendorp-Price Sensitivity Question','Scope To Tweak The Price And Offering','VW','assess_answer_021',1,'2021-03-03 07:43:24',NULL),(22,1,'Date/Time Question','Collect Date/Time Information','DAT','assess_answer_022',1,'2021-03-03 07:43:24',NULL),(23,1,'CAPTCHA Question','I Am Not A Computer Related','CAP','assess_answer_023',1,'2021-03-03 07:43:24',NULL),(24,1,'Calendar Question','Collect Date/Time Information - Calendar','CAL','assess_answer_024',1,'2021-03-03 07:43:24',NULL),(25,1,'Interactive Maps Question','Clicking On An Interactive Map','IM','assess_answer_025',1,'2021-03-03 07:43:24',NULL),(26,1,'Reference Data Question','Against Those In The Databases','RD','assess_answer_026',1,'2021-03-03 07:43:24',NULL),(27,1,'Lookup Table Question','Autocomplete Information Systematically','LT','assess_answer_027',1,'2021-03-03 07:43:24',NULL),(28,1,'Store Locator Question','Locate A Nearby Store In A Region','SL','assess_answer_028',1,'2021-03-03 07:43:24',NULL),(29,1,'TubePulse Question','Indulge In A Discussion','TP','assess_answer_029',1,'2021-03-03 07:43:24',NULL),(30,1,'Multiple Choice Multiple selection Questions','Multiple Choice Multiple Selection Questions','MC2','assess_answer_030',1,'2021-03-03 07:43:24',NULL),(31,1,'Formula & Computation','Result Of A Computation','FC','assess_answer_031',1,'2021-03-03 07:43:24',NULL),(32,1,'Fill-in-the-Blank','Fill-in-the-Blank','FB1','assess_answer_032',1,'2021-03-03 07:43:24',NULL),(33,1,'Fill-in-multiple-Blank','Fill-in-multiple-Blank','FB2','assess_answer_033',1,'2021-03-03 07:43:24',NULL),(34,1,'File Upload','File Upload','FU','assess_answer_034',1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assess_questions`
--

DROP TABLE IF EXISTS `assess_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess_questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type_id` int(6) NOT NULL,
  `question_desc` varchar(200) NOT NULL,
  `question_level_id` int(6) NOT NULL,
  `question_subject_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del` enum('*') DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_desc` (`question_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess_questions`
--

LOCK TABLES `assess_questions` WRITE;
/*!40000 ALTER TABLE `assess_questions` DISABLE KEYS */;
INSERT INTO `assess_questions` VALUES (1,2,'The average of Sohan\'s marks in 6 subjects is 74. If his average in five subjects excluding science is 70, how many marks he obtained in science?',3,1,1,'2021-03-03 07:43:24',NULL),(2,2,'Find the average of first 9 consecutive odd numbers',3,1,1,'2021-03-03 07:43:24',NULL);
/*!40000 ALTER TABLE `assess_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28 15:21:49
