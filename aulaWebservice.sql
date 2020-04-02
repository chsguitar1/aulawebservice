-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: vendas
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(50) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_teste` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `id_estado` (`id_estado`),
  KEY `id_teste` (`id_teste`),
  CONSTRAINT `fk_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'umuarama',5,NULL),(3,'maringa',2,NULL);
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` int(11) NOT NULL,
  `email_cliente` varchar(200) NOT NULL,
  `dt_nasc_cliente` date NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cidade` (`id_cidade`),
  CONSTRAINT `fk_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidades` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'chsguitar1@gmail.com','0199-04-01','amanda'),(2,1,'chsguitar1@gmail.com','0199-04-01','ana'),(3,1,'chsguitar1@gmail.com','0199-04-01','amarildo'),(4,1,'chsguitar1@gmail.com','2018-10-02','leonardo'),(5,1,'chsguitar1@gmail.com','2018-10-02','caua'),(6,1,'chsguitar1@gmail.com','2018-10-02','maria');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (2,'AMAZONAS'),(3,'AMAPA'),(4,'ACRE'),(5,'BAHIA'),(6,'CEARA'),(7,'RIO GRANDE DO SUL'),(8,'SANTA CATARINA'),(9,'PARANA'),(10,'SAO PAULO'),(11,'ESPIRITO SANTO'),(12,'MINAS GERAIS'),(13,'SERGIPE'),(14,'ALAGOAS'),(15,'PERNAMBUCO'),(16,'RIO GRANDE DO NORTE'),(17,'PARAIBA'),(18,'GOIAS'),(19,'TOCANTIS'),(20,'PARA'),(21,'MARANHÃO'),(22,'RONDONIA'),(23,'MATO GROSSO'),(24,'MATO GROSSO DO SUL'),(25,'RORAIMA'),(26,'PIAUI');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemVenda`
--

DROP TABLE IF EXISTS `itemVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemVenda` (
  `id_itvenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `vlr_itvenda` decimal(10,2) NOT NULL,
  `qtd_itvenda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_itvenda`),
  KEY `fk_produto` (`id_produto`),
  KEY `itemVenda_venda_FK_1` (`id_venda`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `itemVenda_venda_FK` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemVenda`
--

LOCK TABLES `itemVenda` WRITE;
/*!40000 ALTER TABLE `itemVenda` DISABLE KEYS */;
INSERT INTO `itemVenda` VALUES (1,1,1,7.50,2.00),(2,1,1,7.50,2.00),(3,2,1,7.50,2.00),(4,2,1,7.50,2.00),(5,4,1,7.50,2.00);
/*!40000 ALTER TABLE `itemVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `vlr_produto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'x salada',7.50),(2,'x bacon',7.50),(3,'x burger',7.50),(4,'coca cola',5.50),(5,'suco pratis laranja',5.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `vlr_total` decimal(10,2) NOT NULL,
  `dt_venda` date NOT NULL,
  `idteste` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `fk_cliente` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,1,30.00,'2018-10-01',1),(2,3,30.00,'2018-10-01',1),(3,5,30.00,'2018-10-01',1),(4,6,30.00,'2018-10-01',1),(5,3,0.00,'2018-11-18',1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vendas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-02 15:09:51
