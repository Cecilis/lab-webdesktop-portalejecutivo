-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: db-dreamteamb
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.2

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
-- Current Database: `db-dreamteamb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db-dreamteamb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db-dreamteamb`;

--
-- Table structure for table `accesorios`
--

DROP TABLE IF EXISTS `accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `costo` float NOT NULL,
  `tipo_accesorio_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`tipo_accesorio_id`),
  KEY `fk_accesorios_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorios`
--

LOCK TABLES `accesorios` WRITE;
/*!40000 ALTER TABLE `accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbols`
--

DROP TABLE IF EXISTS `arbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `vinculo` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbols`
--

LOCK TABLES `arbols` WRITE;
/*!40000 ALTER TABLE `arbols` DISABLE KEYS */;
INSERT INTO `arbols` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(10,3,'Registrar Planes de Servicios','',0),(11,3,'Estado de la Proforma','',0),(12,3,'Portal Ejecutivo','',0),(13,3,'Configurar nuevo Indicador','',12),(14,3,'Lista de Espera','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Galeria','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0),(35,1,'Registrar Modelo de Vehiculo',NULL,0),(36,1,'Registrar Caracteristica de un Modelo','',0);
/*!40000 ALTER TABLE `arbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos_comprador_vehiculos`
--

DROP TABLE IF EXISTS `bancos_comprador_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos_comprador_vehiculos` (
  `bancos_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `nro_cuentas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bancos_id`,`comprador_vehiculos_id`),
  KEY `fk_bancos_has_comprador_vehiculos_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_bancos_has_comprador_vehiculos_bancos1_idx` (`bancos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos_comprador_vehiculos`
--

LOCK TABLES `bancos_comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `bancos_comprador_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos_comprador_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos_concesionario_vehiculos`
--

DROP TABLE IF EXISTS `bancos_concesionario_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos_concesionario_vehiculos` (
  `bancos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`bancos_id`,`concesionario_vehiculos_id`),
  KEY `fk_bancos_has_concesionario_vehiculos_concesionario_vehicul_idx` (`concesionario_vehiculos_id`),
  KEY `fk_bancos_has_concesionario_vehiculos_bancos1_idx` (`bancos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos_concesionario_vehiculos`
--

LOCK TABLES `bancos_concesionario_vehiculos` WRITE;
/*!40000 ALTER TABLE `bancos_concesionario_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos_concesionario_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'Color','Color-Negro'),(2,'Color','Color-Blanco'),(3,'Color','Color-Plateado'),(4,'Color','Color-Rojo'),(5,'Color','Color-Azul'),(6,'Tapiceria','Tapiceria-Cuero'),(7,'Tapiceria','Tapiceria-Semi-Cuero'),(8,'Tapiceria','Tapiceria-Tela'),(9,'Trasmision','Trasmision Sincronico'),(10,'Trasmision','Trasmision Hidromatico');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudads`
--

DROP TABLE IF EXISTS `ciudads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estados_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudad_estado1_idx` (`estados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudads`
--

LOCK TABLES `ciudads` WRITE;
/*!40000 ALTER TABLE `ciudads` DISABLE KEYS */;
INSERT INTO `ciudads` VALUES (1,'Carora',1),(2,'El Tocuyo',1),(3,'Quibor',1),(4,'Cabudare',1),(5,'San Felipe',2),(6,'Yaritagua',2),(7,'Nirgua',2);
/*!40000 ALTER TABLE `ciudads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador_vehiculos`
--

DROP TABLE IF EXISTS `comprador_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comprador_vehiculos_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_vehiculos`
--

LOCK TABLES `comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `comprador_vehiculos` DISABLE KEYS */;
INSERT INTO `comprador_vehiculos` VALUES (1,'19618874','maria','paez','123456','carora','mandnd@gndhj.com','1990-01-24','femenino',1);
/*!40000 ALTER TABLE `comprador_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionario_vehiculos`
--

DROP TABLE IF EXISTS `concesionario_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionario_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_concesionario_vehiculos_ciudad1_idx` (`ciudads_id`),
  KEY `fk_concesionario_vehiculos_usuarios1_idx` (`usuarios_id`),
  KEY `fk_concesionario_vehiculos_marcas1_idx` (`marcas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionario_vehiculos`
--

LOCK TABLES `concesionario_vehiculos` WRITE;
/*!40000 ALTER TABLE `concesionario_vehiculos` DISABLE KEYS */;
INSERT INTO `concesionario_vehiculos` VALUES (1,'L-123789','Concesionario Ford','Pedro Leon Torres con calle 54','0251-2456789','concesionarioford@gmail.com',NULL,NULL,1,5,1),(2,'N-456189','Concesionario Toyota','Calle 1300 con carrera 2000','0251-4569845','concesionariotoyota@gmail.com',NULL,NULL,4,6,4),(3,'T-8976','Concesionario Daewood','calle 300 entre carreras 90 y 91','0251-2345465','concesionariodaewood@gmail.com',NULL,NULL,5,9,2);
/*!40000 ALTER TABLE `concesionario_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_vehiculos`
--

DROP TABLE IF EXISTS `detalle_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculos_id` int(11) NOT NULL,
  `color` int(11) DEFAULT NULL,
  `transmision` int(11) DEFAULT NULL,
  `tapiceria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_vehiculos_vehiculos1_idx` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_vehiculos`
--

LOCK TABLES `detalle_vehiculos` WRITE;
/*!40000 ALTER TABLE `detalle_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensambladora_vehiculos`
--

DROP TABLE IF EXISTS `ensambladora_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensambladora_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ensambladora_vehiculos_ciudad1_idx` (`ciudads_id`),
  KEY `fk_ensambladora_vehiculos_usuarios1_idx` (`usuarios_id`),
  KEY `fk_ensambladora_vehiculos_marcas1_idx` (`marcas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensambladora_vehiculos`
--

LOCK TABLES `ensambladora_vehiculos` WRITE;
/*!40000 ALTER TABLE `ensambladora_vehiculos` DISABLE KEYS */;
INSERT INTO `ensambladora_vehiculos` VALUES (1,'Ensambladora Chevrolet','T-U896','Calle 53','0251-5674323','ensambladorachevrlet@gmail.com',6,10,6);
/*!40000 ALTER TABLE `ensambladora_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Lara'),(2,'Yaracuy'),(3,'Carabobo'),(4,'Zulia'),(5,'Trujullo');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_indicadors`
--

DROP TABLE IF EXISTS `estados_indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_indicadors` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_indicadors`
--

LOCK TABLES `estados_indicadors` WRITE;
/*!40000 ALTER TABLE `estados_indicadors` DISABLE KEYS */;
INSERT INTO `estados_indicadors` VALUES (1,'Activado'),(2,'Inactivo');
/*!40000 ALTER TABLE `estados_indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existencia_vehiculos`
--

DROP TABLE IF EXISTS `existencia_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `existencia_vehiculos` (
  `id_existencia` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id_existencia`),
  KEY `fk_existencia_vehiculos_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_existencia_vehiculos_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existencia_vehiculos`
--

LOCK TABLES `existencia_vehiculos` WRITE;
/*!40000 ALTER TABLE `existencia_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `existencia_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_accesorios`
--

DROP TABLE IF EXISTS `factura_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `vehiculo_accesorios_id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `formas_pagos_id` int(11) NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_accesorios_vehiculo_accesorios_idx` (`vehiculo_accesorios_id`),
  KEY `fk_factura_accesorios_formas_pagos2_idx` (`formas_pagos_id`),
  KEY `fk_factura_accesorios_comprador_vehiculos1_idx` (`comprador_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_accesorios`
--

LOCK TABLES `factura_accesorios` WRITE;
/*!40000 ALTER TABLE `factura_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_servicios`
--

DROP TABLE IF EXISTS `factura_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iva` float DEFAULT NULL,
  `plan_servicios_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `bancos_id` int(11) NOT NULL,
  `formas_pagos_id` int(11) NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_servicios_plan_servicios1_idx` (`plan_servicios_id`),
  KEY `fk_factura_servicios_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_factura_servicios_bancos1_idx` (`bancos_id`),
  KEY `fk_factura_servicios_formas_pagos1_idx` (`formas_pagos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_servicios`
--

LOCK TABLES `factura_servicios` WRITE;
/*!40000 ALTER TABLE `factura_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `solicitud_vehiculos_id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facturas_solicitud_vehiculos1_idx` (`solicitud_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pagos`
--

DROP TABLE IF EXISTS `formas_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formas_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pagos`
--

LOCK TABLES `formas_pagos` WRITE;
/*!40000 ALTER TABLE `formas_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `formas_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia_notificacions`
--

DROP TABLE IF EXISTS `frecuencia_notificacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia_notificacions` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia_notificacions`
--

LOCK TABLES `frecuencia_notificacions` WRITE;
/*!40000 ALTER TABLE `frecuencia_notificacions` DISABLE KEYS */;
INSERT INTO `frecuencia_notificacions` VALUES (1,'Diaria'),(2,'Semanal'),(3,'Mensual'),(4,'Anual');
/*!40000 ALTER TABLE `frecuencia_notificacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia_vehiculos`
--

DROP TABLE IF EXISTS `garantia_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantia_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cobertura` varchar(45) DEFAULT NULL,
  `vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_garantia_vehiculos_vehiculos1_idx` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia_vehiculos`
--

LOCK TABLES `garantia_vehiculos` WRITE;
/*!40000 ALTER TABLE `garantia_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantia_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadors`
--

DROP TABLE IF EXISTS `indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicadors` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `funcion` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadors`
--

LOCK TABLES `indicadors` WRITE;
/*!40000 ALTER TABLE `indicadors` DISABLE KEYS */;
INSERT INTO `indicadors` VALUES (1,'Numero de Vehiculos Vendidos',NULL,NULL),(2,'Promedio de Vehiculos Vendidos',NULL,NULL);
/*!40000 ALTER TABLE `indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` longblob,
  `mision` text,
  `imagen1` char(100) DEFAULT NULL,
  `vision` text,
  `valores` text,
  `contacto` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Toyota',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(2,'Daewood',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(3,'Ford',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(4,'Chevrolet',NULL,'Letras',NULL,'Letras','Letras','Letras'),(5,'Jeep','C:\\fakepath\\stccargo2.jpg','La mejor',NULL,'LA MEJO','la mejond','kadksdok');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_caracteristicas`
--

DROP TABLE IF EXISTS `modelo_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_caracteristicas` (
  `caracteristicas_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  KEY `fk_modelo_caracteristicas_caracteristicas1_idx` (`caracteristicas_id`),
  KEY `fk_modelo_caracteristicas_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_modelo_caracteristicas_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_caracteristicas`
--

LOCK TABLES `modelo_caracteristicas` WRITE;
/*!40000 ALTER TABLE `modelo_caracteristicas` DISABLE KEYS */;
INSERT INTO `modelo_caracteristicas` VALUES (7,1,1),(9,1,1),(7,1,1);
/*!40000 ALTER TABLE `modelo_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_vehiculos`
--

DROP TABLE IF EXISTS `modelo_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ano_m` varchar(45) DEFAULT NULL,
  `marcas_id` int(11) NOT NULL,
  `tipo_vehiculos_id` int(11) NOT NULL,
  `imagen1` longblob,
  `imagen2` longblob,
  `imagen3` char(100) DEFAULT NULL,
  `imgen5` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modelo_vehiculos_marcas1_idx` (`marcas_id`),
  KEY `fk_modelo_vehiculos_tipo_vehiculos1_idx` (`tipo_vehiculos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_vehiculos`
--

LOCK TABLES `modelo_vehiculos` WRITE;
/*!40000 ALTER TABLE `modelo_vehiculos` DISABLE KEYS */;
INSERT INTO `modelo_vehiculos` VALUES (1,'Ford 4x4 fortaleza','2010',3,1,NULL,NULL,NULL,NULL),(2,'qwer bnm','2007',4,2,'C:\\fakepath\\camioneta1.jpg',NULL,NULL,NULL),(3,'chevrolet 4x4 ','2009',1,1,'����\0JFIF\0\0\0\0\0\0��\0�\0	\'\Z#/ $\'),,,150*5&+,)	\n\n\r))),)),)))))),))))))),))))))))1))*),0)*)))))))))),+��\0\0�;\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0Q\0\r\0\0\0!1AQa\"q��2BRS��������#3CTr���$b���4D��ᄤ�%cdt��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0!1Aq�\"��\0\0\0?\0�h���(�(���(�(���+�qA��[��Usj��\0%#R�AΓ#���Ʈx8�\rh�I�!�2�a��hˎ�Ǯ��.θ�L>q��]7Oc(���?��~�*^n@�M���G��U�Ѻh�\n����3��55K�\\r�5�����-Vې�r�<�}jm��!y��gޙ�\'���kD��v9M�U��v\\[�{�?Z���U����8�]��E����zo�g�����k��;�\0��o<V��ئ�-�ޫS���3��ޛr�Xϙ���JɼW��,����?u&�m����ٲ�֭��b�K�<�|՘�w�<�l8ɱ�_\'��է�\"m���K�ʸ�)E�l���s�<i�:TJ;� �PZ�\0j����)��vt�rٛ�#����j��ׁ@��@ ��W�4�uݽ�k�ƫy^�Rp{D�#<x�>j��U�EQ@QEQ@QEQ@QEQ@QEW��بn��)g�6v2��b3�o|��#�+���$�L,lpndw���̏���ψ�\"��F˃g[Ӊ�����s��y�\0\0���b���L���;�RK!Ʃ$n�8\0\0\0��}Pp5ڻ�ύBv��cǀ���&{C{|i��y���Q!�7�s�7;KS����m��#ۈ9�O��E���ͤ��G�c�\\\0���a��o�6Dm��}�R{�Y�G�Uf�5�I�����-�#��\n���]�����X�D/������{�\0����L��T��z���ٜ�_lK��ҿH���[\'�)�kI��+�U�-]wl�!��;|*)�����.��%*��u���ϝr��=�9�B[H��4cҤ��A�ͩ��|rG�P8=ǚ�AǪ��m�.�K�P�I\0L��A.=�a�Ǔɩ���W��,g��O�F�S�9�t��Y:�ʺ�B0��Ϩ�i��j��ځ��.����(��E]GE�Zm.�e9�AV��\"�(�(���(�(���(�(���(�)�i��\0��8�ˬuL��<iŹW/��v[l��� ?�Ƃ�n��p�{o��R]��a1���\\�m�pu� s�ђ9����QY��ƐNx��G����m41{\"IYo\n,0����� �F�6=��\0��j��6�]�n�۬��븗�w9�	�r@$�cQ��ހI�I��k���&[��?��q�͸p��N�HO�1�W	����7�s9�|��ׄ�m�č�^��Y�?�)���F\r�M�l?\n�_�2{O��\0�@f�2�D����h�fί����9�*�$���ᖵ<�\"���?��\02#Id�ͽ�\0�G�Sa�ӷd�Ç��`��r����ctm ����~��ۃ:�������]�y��M��a����4�wV�J����b==����<�筑�Y���j�B���Iv�ǒ1��\Z@\Z68d�\0�7c��:\\n��Eu�G��U�l��ȕ�\r�\'���s7�}���M�D*A�{#��oi2٪����И��P�`�H*�o����LH`y�\n�(URY�y��a�U6�t���������$�\r�t�E4t������h��E�c��d����<=�=�Xm��Io床�H�&�jt���+�:t����h�QټwbۭV]D�#\ZA��`���Om:n�Z������\01h:3�-�e��_��c#�.N��!��U�\\�Ѧ�0��c�y�C�b��\\|s]\0�9�F�+�B��{EPQEEPQEEP�8H�W������cj��� 2�]A�N�9<y�vPN������\r~�r�|ȹo�����������0���&%8�O@f�]��#@]1u�Qp��Yd��0{�F�yG#J�}e���;��v֡*�Y<�ث�QR�o6T�3z�;�J}���x�p��:Y<d�V�5b����P�8�!�q���Ǐ������ȱ�C�q9����W�1�0��SR���e���J���H=�ȷh�}B��ש��V����c��.��{�?~>\Z����\0����vlĊKw㕒�j��oJ}��L�Ĥ�d>���%0[_�%��\0�_SVC�����z5U<v̞�z��t�dm�M,�\r,IWq��X�,{�-qӤ��X�ޭ����vl=uNG�rg�24��S���N�ߔpPj�ȧϩ|�M�O��?��>8}d������E�����vcBG���P�m;ǒr�4�E�E��\Z��MLc諀���$\0ȧ\'�I�4��ч��m���?��M1�+#Ԣ����fۦbX�4�n��.�\'Q�Q����&�0Z-�n�d�2��x�x�ָ7Sk�\\��I�	T�\r��$�y\\1È������a�S%�+�L����h�ƣ�r«�m�,1��d�� �J,wb�[���C)R[��^�y�ɏf��؄��\'�Or�^����������	!|�bO2��*6|*��]��ږOh����I\0(��@�xj��V�������cxF����ȏ�jʈHl��|���J��F�]ܧY���$e$s�U9��t|=�)�z�\0��<T`y���{� �J�[���9D\'Jd�\'�i��\0is�SW��/���2�\n�a��mq�p��e�|�a�`GFj����A-��ͮO\'B��8\ZI��56���<J�<�H�ر`x�-�P�:��K��������e4�{yM\\V����K�I�J����\0H�a�m�|��o8�>�ƪbk�b9PtV��NYY�Ɇ`G:���5ip<xU��f�f�a3��y]�1��v�܍�f������o>���4�yq�?QEYQEEPQE{v����2/�X�N9�a�1㩅W����q-��q�F$���Dť� �T�Ny�§��ں�i\n�� �8\0�x�*��۱n�\\�%�\0ymoq��@)�`9��Q������=\r�-K&�Q�jq��9�Ï������VJ�U2�`�1?��O#R7�����\"�apt�]��+����\n�uuow3��?��4L��Yc�\"@�f\0�9߽�_�z���\0\r�0퉼���>�۶K�c;:	dր�$�\nX��e|��P0��Fvlŭ`�*�~�G:���Z��e�zM!��c+M<e�����3χ�ts �m��ah2}����\0��uJ�FƆE��io�t�B.@D�<�;�{�)�A$q*��8l���\0y�p����J-��Č����H72����Cp�q�Ƶ��|��s�S�wV���D=�2��\0x���8���v�F#��D���̮��(:�g�� �����b>ć��{3�H]6K�!f,�>brKOtI>\'��5�|���\'�{�0m�?������j�l�����2�(�8cE�6���/W�;Y<1��%�ހrٖ��\0�/Gt���;Z#�Ul��5�W	$�Xa�e%�\r �3��\\�A65��Ǹ��\0����G���?eI�c�\n�u��+\0=�c�pR�5d�m�8��\n2#�x��O��A2ܭ�Zu���1�jX��uȬ5c\'� 9<��o������ѧ��oo��I8ǔ9�<��x����e�\\�Pȭ?��U$S�JT�ƛ6���]4�$�%&tmXըu`q���ι����|n��3�eo��k{Rn쏨u�P�f AU��^���L��r���\Z8՜��Tz����[S��ڻ)F��Kb��xP�	4��P`��`�H8���\'�6�\0HV��\0K���T�cL��X����Npxq�n͘�n]Y�h�=���\"��Qk�|�*��7zM���?����v��5fo\'I�1�*�M�`[�+(`^	P�f@8���ݏ%��iGpP�\ręv�(g#�\0v�?�ç	��k�r��[>������72I�DQ��V�\"���j�#��R}����v�����C�G����+~�o����#<��R[[q-,�%�l�>~c�E��܋j�5�+��Y#&rz�|�6����I�w��O>��q�T�⏲�ov�{j&�$��x��,�h�ژ��_�\\��v[�\0�1�$k���N9�>�.�&��=Yқ���O�����kL�+d�R�@�k�UI�.�Y�4��N\'H\'����;{j*?o��A�v�\0xyX����]I�<��]��`z��v���&�Q�d<��?������v��J=+���Z��s���E�Q@QExM{X���DvɚI�L_�\\��(�����G��.���LNJ���U�$�����%���[@q�X��WW{�;sd�M�j-�����IT�˝:�\0F{��իq��R)�� ����|��.5f����l�YF�9&F��A!<�F��<�\0�7{��:�Tq\Z�LJ/�PVA�<sΧ2쨾/�����tc�1|���ٞ�s�\"��ʏ۔���Zn�Oʓ��.{(�/���և�O����4�uD�j��O��XH��?)�\0J�%�8�j/�Z����Q�\Z�a�-���9�\0�(����:5�p>϶h�,S&]A�۱my$�q\'�wV�?�O���և��/��?�MLi�z�)K{h�/�z�+�������\0�8S��\\�ؖ{���a���\"y�,��j8$��-�@v\0����ϧ�5��{���L<�c�]�޵<��:}Ƣ�ʓ\Z���ϴ�<��I��c���\\|�*>������%f���S�]_I�{>������O�V_G�Ege{��$AQn\\�i4�:x�d¾eo\Z�����b�O�S=�ò6m���s�yR�c��> ��n�ZI݋;�fc͙�I>$�}�\r�#��_�s����AϘ�~--�q̋��lp�s<;��xS����H:�#��܃hldwq�M1\"��\'�@�+�RW�Sn��̊��GR�_(+����MD���d�k��Yֲ+�wm�6��;ΦWWQ���K��E��~�9�t;��eK�,�=A�k�ӱ��i\n���VZS��R��ŭ����~�\'���&\Z����SF�l�syo9J�|#Q�9�[ٵ��}q?d��_�#�\n=Vs��<a������)%��J�E&��l��s��������\0s��mϩn���:��5�{��u�b��ŁEUAEPQEX�*ʵ�>�T����ֽj�R�U�hв���R7Q�A9��U�[_T��ydc��LI���jq�[d\\#Ⱦׯ�/���Q>���؆�j���x��$s�&\n�orԹ�\0g�_����\0���̤��9��mj��CyPD�c�Ă�7�ϲ�:B��K��AJJ���q���*.Z�6NC�zM��÷ ��?Ƥ��#�mq4yn,��V�Ʋ)9#��Ê������:�l��0�\0�?�^���������?�_���ׇw\'���~*�j��Qz��%xv�?��Ĥ�������������W�\"�T?���8�S~:��~?�\'�?�O����է^2�k�L��c�4b�|\0�q���Q�)��I�܁#��=�SH�d��r�\0��^  �(\n��!W����>,i1cDm��<�B��2~:S�6D�c��x��X$L��\Z[�;Nv���\0��K�/�����Sޕ6�B�X�]0��I���1+�y<9��=�B��|���SN��j��sº�r9��j�J�Ki�88�)Vo�ó����Y���#1�1Iv��A$�:bVrI\'H�$\ndۛL�#s�RΏv��Kb-��V����gS͏�1���`\n6��Vm���H�9Ƣ1����9���u҇س��A�e�.�0*1�N1�\'��M�&��6\\vVkp�2%Č�@n���$�Ypy��a{�Ȏ��2>K~</E0Ӷ�$ܺOk#J�0ǯ��Dh=�RH��T�ז���|i�?�R���W׫��RS�&Xp��ٔ����CP-kȻ-!��\0ݭmt��D>t�\0�CI��T���#}��D�>B~\Zך�8�|�{��Np6���/S 94��)�u7��φ\'N5�������9d�3���멮�A̱�\"�\"H��N�b�7\08\r!�=�h\"6��D<2ɐ{�_\n��������H�#�G�y*�G��T��X��\\cw��Vm+2,�p8\0d#�]���=�̍%R�9iH�R��B����TNh���(�(���7���e;�k�y��}4�Q����u��Կ�2~��s���-�U����x�NX6��Y<\rG���NJ�\\9y�il�K�\'�`�� �>)�{�˷���f@�f�Z�v�wW�kP��:�~���\\�W��s��)�[=�|?�E%��F|(�7���>o��I��F|(7��\0��W�o���ӟ\n�>:���\0�Al��~�ךPo�ب�d>���Xx�6>��4Pm���G�k7`�e�C�vRz�FME@�~�Q�#̹�kOW��ׂA����]݌���nc�˒#�֫�|���xf�����]��VIh	�\0�d��y�2\"+�g��qƧ�;z[;Hn-[��&p[\n��C�� ��=¤{c~��k+�\Z2�7S��x�}#<5F�0s�⢧�$�b6��L�F6DHZ<�UˆE\0�s��q����A������A �8W{���ʫ�\0T\09Ừ��������Qu�,�Buk�LF���,I�1�Km����IVU�)a\Z. �	\',O���+��\\lW\\��,N5d��Q�=������}_i�N�\\*�O�5�4`�!CfD�Dy�­k��l���M(^\Z�JrG�Jz(9�A�Fs[�xR5��FC�8`�@40����O�����\'�o^/v/w�h��i�(5�s���֦R;\r[���[V�:�l��b�F�	!9�UW{˽S_2��\0���Q��P4�8�*��M���@�\Z%����sT�����᪪�:����/,�C��\0�8\nѪ�\'�2�=�X{�\"i��M�lݺ4��Ll�2|�ENB����\0h��\'��aUAEPQEEPݷ�z�yc?�G_��}��X��Pq���pT����89���Se�㚱�g�sk|eU�W9p{���Ć�Ǻ��j\r4QEPQEc=��V��4��g�>\0}am��n���;~MT�ۤ��#��jU�\0���.^��Ȅ���GQ�)��\0PWCi��Sю����n��HF�_~�s�2~\Z�n�wW�@��K^�6���c8ǾB��x�)��6��Rz��U�b�^�c�������م70<A�\n[$����g����au�-�FL��Q�R���\\���0�T�+m��H�2��T�c�=dPln��i�V�G�@z�Z2Nx� �����T1��w-\rʹ��\Z��)9�_Wg��]�\'b�Y�Y!�Ermc�D���H��e<�R�Un�睋��+��w����rm��\0f����Yg��vX����8\n�\n�����9�EI�Sy�v��w-,kJ4�#�b��X\0�%@S��08�U>�n���W���n�(����e��@�|�v\ZY���.Α��H\"��\'�X���`FW��\"�Xp�1�<x��_����1[ġ-��H���Y�{�U��-Ċ�gLef#��8��W5Щ\0�ۡ�Rѧa�����yU>�.|ث6�0�uP�蠮�p١�D�1��;�U8��ތ�1�b���E��#��H���?���\r���^�����g�h�n�̬��X��b��0�%{MP��Gp좞�v28���%�E�VY�b�|o5J�l�=lSd�̫�nƦ�˺6]U�)�i�>�����TQEEPQEEP0��Ŵ-�	G�XcR8����H$v�.o~�\\��JN�I>D�	�A���\0���4��g��VDVV�U�e>px\Z&�����ݚN}��1�\n�z&ٟ�C�o����Rm��Iv��G#\\���|��iѰ�Q�T�YC�[�bE.�e��? Pg��v���%U#P$��Ok�Oy�_g���L�\0�+/�!��n����^�>�@������(�z{�����Y~��}������X�\0{�};I=���\'�x`Om4k�N��4�z6��V?���ю��R?���<�;���In`*��.��0A�\Z�\r�ّ�p�m/]&� �<���G��=l�\0�c�ﾼ��6���⨮P�;wTϢ紂�\\^ɧ���f�\rL@8�8�߃�o��g�����U�tM������*?H�ݳ6���M�T�a�.\"HKr>��Tc���g���)�\0j������z@}a��W�-����A�N2��8�5��6��)>u�����~O�z����\nÐ=���v���5��@�[H�*=����U����)�Y>�)�f�aa��N�S�\0�������e�q�q�\n�*��U\0q�\0�H�C��,���S�;%����*��R���CE��+�O�MKly/�I�R��z�U\r�m@F4K�O�W9�ѵ�w����I�X�ĖB1��x;+�:�^GuT/R���?\rMz2���[�3C,��)�Ju�q��NOq�3ۊ�>�wVK�D��袀��(\n(����',NULL,NULL,NULL);
/*!40000 ALTER TABLE `modelo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` longblob,
  `detalles` text,
  `titulo` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuarios_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_noticias_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_concesionarios`
--

DROP TABLE IF EXISTS `pedido_concesionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_concesionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_concesionario_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_pedido_concesionario_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_concesionarios`
--

LOCK TABLES `pedido_concesionarios` WRITE;
/*!40000 ALTER TABLE `pedido_concesionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_concesionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_servicios`
--

DROP TABLE IF EXISTS `plan_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `servicios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_servicios_servicios1_idx` (`servicios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_servicios`
--

LOCK TABLES `plan_servicios` WRITE;
/*!40000 ALTER TABLE `plan_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proformas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `validez` datetime DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `bancos_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `vendedor_vehiculos_id` int(11) DEFAULT NULL,
  `detalle_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proformas_bancos1_idx` (`bancos_id`),
  KEY `fk_proformas_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_proformas_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`),
  KEY `fk_proformas_vendedor_vehiculos1_idx` (`vendedor_vehiculos_id`),
  KEY `fk_proformas_detalle_vehiculos1_idx` (`detalle_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
INSERT INTO `rols` VALUES (1,'Comprador','a'),(2,'Concesionario','a'),(3,'Ensambladora','a'),(4,'Gobierno','a');
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servicios_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_vehiculos`
--

DROP TABLE IF EXISTS `solicitud_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proformas_id` int(11) NOT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solicitud_vehiculos_proformas1_idx` (`proformas_id`),
  KEY `fk_solicitud_vehiculos_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_vehiculos`
--

LOCK TABLES `solicitud_vehiculos` WRITE;
/*!40000 ALTER TABLE `solicitud_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_accesorios`
--

DROP TABLE IF EXISTS `tipo_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_accesorios`
--

LOCK TABLES `tipo_accesorios` WRITE;
/*!40000 ALTER TABLE `tipo_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculos`
--

DROP TABLE IF EXISTS `tipo_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculos`
--

LOCK TABLES `tipo_vehiculos` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculos` DISABLE KEYS */;
INSERT INTO `tipo_vehiculos` VALUES (1,'Camioneta'),(2,'Camion'),(3,'Carro');
/*!40000 ALTER TABLE `tipo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidads`
--

DROP TABLE IF EXISTS `unidads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidads` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidads`
--

LOCK TABLES `unidads` WRITE;
/*!40000 ALTER TABLE `unidads` DISABLE KEYS */;
INSERT INTO `unidads` VALUES (1,'Cantidad'),(2,'Bolivares');
/*!40000 ALTER TABLE `unidads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estatus` varchar(45) NOT NULL,
  `imagen` longblob,
  `imagen1` char(100) DEFAULT NULL,
  `rols_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_usuarios_rol1_idx` (`rols_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'AdrianaS','1234','a',NULL,NULL,1),(2,'Fernando','1234','a',NULL,NULL,4),(3,'Jose','1234','a',NULL,NULL,2),(4,'Maria','1234','a',NULL,NULL,3),(5,'adriana','1234','a',NULL,NULL,2),(6,'ConcesionarioToyota_Pedro','1234','a',NULL,NULL,2),(9,'concesionarioDaewood_Jose','1234','a',NULL,NULL,2),(10,'Ensambladorachevrolet_Pedro','1234','a',NULL,NULL,3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_indicadors`
--

DROP TABLE IF EXISTS `usuarios_indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_indicadors` (
  `usuarios_id` int(11) NOT NULL,
  `indicadors_id` int(10) NOT NULL,
  `valor_meta` int(10) DEFAULT NULL,
  `unidads_id` int(11) NOT NULL,
  `fecha_meta` date DEFAULT NULL,
  `valor_amarillo` int(10) DEFAULT NULL,
  `valor_rojo` int(10) DEFAULT NULL,
  `valor_verde` int(10) DEFAULT NULL,
  `fecha_amarillo` date DEFAULT NULL,
  `fecha_rojo` date DEFAULT NULL,
  `fecha_verde` date DEFAULT NULL,
  `estados_indicadors_id` int(11) NOT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  `correo_responsable` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `frecuencia_notificacions_id` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`indicadors_id`),
  KEY `fk_usuarios_has_indicador_indicador1_idx` (`indicadors_id`),
  KEY `fk_usuarios_has_indicador_usuarios1_idx` (`usuarios_id`),
  KEY `fk_usuarios_indicador_unidad1_idx` (`unidads_id`),
  KEY `fk_usuarios_indicador_estados1_idx` (`estados_indicadors_id`),
  KEY `fk_usuarios_indicador_frecuencia_notificacion1_idx` (`frecuencia_notificacions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_indicadors`
--

LOCK TABLES `usuarios_indicadors` WRITE;
/*!40000 ALTER TABLE `usuarios_indicadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_accesorios`
--

DROP TABLE IF EXISTS `vehiculo_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculos_id` int(11) NOT NULL,
  `accesorios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculo_accesorios_idx` (`vehiculos_id`),
  KEY `fk_vehiculo_accesorios_accesorios1_idx` (`accesorios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_accesorios`
--

LOCK TABLES `vehiculo_accesorios` WRITE;
/*!40000 ALTER TABLE `vehiculo_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(45) DEFAULT NULL,
  `ano_fabricacion` varchar(45) DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `serial_motor` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `imagen` longblob,
  `imagen1` char(100) DEFAULT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculos_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`),
  KEY `fk_vehiculos_modelo_vehiculos1_idx` (`modelo_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_vehiculos`
--

DROP TABLE IF EXISTS `vendedor_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `ciudads_id_ciudad` int(11) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` int(11) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_vehiculos_concesionario_vehiculos2_idx` (`concesionario_vehiculos_id`),
  KEY `fk_vendedor_vehiculos_ciudad1_idx` (`ciudads_id_ciudad`),
  KEY `fk_vendedor_vehiculos_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_vehiculos`
--

LOCK TABLES `vendedor_vehiculos` WRITE;
/*!40000 ALTER TABLE `vendedor_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-28 17:26:18
