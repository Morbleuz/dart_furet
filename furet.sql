-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: furet
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-0+deb11u1

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
-- Table structure for table `Auteur`
--

DROP TABLE IF EXISTS `Auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auteur` (
  `idAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomAuteur` varchar(30) NOT NULL,
  `prenomAuteur` varchar(40) NOT NULL,
  PRIMARY KEY (`idAuteur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auteur`
--

LOCK TABLES `Auteur` WRITE;
/*!40000 ALTER TABLE `Auteur` DISABLE KEYS */;
INSERT INTO `Auteur` VALUES (1,'Laude','Axel'),(2,'Sobkowiak','Jonathan'),(3,'Dupont','Guillaume'),(4,'Martin','Tom'),(5,'Hennebique','Patrick');
/*!40000 ALTER TABLE `Auteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editeur`
--

DROP TABLE IF EXISTS `Editeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Editeur` (
  `idEditeur` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  `nomEditeur` varchar(40) NOT NULL,
  PRIMARY KEY (`idEditeur`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editeur`
--

LOCK TABLES `Editeur` WRITE;
/*!40000 ALTER TABLE `Editeur` DISABLE KEYS */;
INSERT INTO `Editeur` VALUES (1,'rue emile zola','Jojo'),(2,'arras','test'),(3,'cave','Simon'),(4,'37 rue de la joie','Dupont'),(5,'Astrub','Kolyos'),(6,'Sylvarden','Paxge'),(7,'Hurlevent','Willfried');
/*!40000 ALTER TABLE `Editeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `prix` float NOT NULL,
  `quantite` int(4) NOT NULL,
  `AnneParu` date NOT NULL,
  `auteur` int(11) NOT NULL,
  `editeur` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `FK_Auteur` (`auteur`),
  KEY `editeur` (`editeur`),
  CONSTRAINT `FK_Auteur` FOREIGN KEY (`auteur`) REFERENCES `Auteur` (`idAuteur`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`editeur`) REFERENCES `Editeur` (`idEditeur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES (3,'livre',13,3,'2020-10-20',1,1),(4,'dvd',25.5,30,'1998-05-30',4,3),(5,'manga',5,90,'2003-10-22',3,2);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-24 13:55:57
