CREATE DATABASE  IF NOT EXISTS `ventum-dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ventum-dev`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eventos-dev
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `second_last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `internal_number` varchar(10) NOT NULL,
  `external_number` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `street_address_1` varchar(255) NOT NULL,
  `street_address_2` varchar(255) DEFAULT NULL,
  `reference_notes` longtext,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `municipality_id` int(11) NOT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `asent_id` int(11) NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `payment_address` tinyint(1) NOT NULL,
  `default_address` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `municipality_id` (`municipality_id`),
  KEY `locality_id` (`locality_id`),
  KEY `asent_id` (`asent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  CONSTRAINT `address_ibfk_3` FOREIGN KEY (`municipality_id`) REFERENCES `municipality` (`id`),
  CONSTRAINT `address_ibfk_4` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`),
  CONSTRAINT `address_ibfk_5` FOREIGN KEY (`asent_id`) REFERENCES `asent` (`id`),
  CONSTRAINT `address_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asent`
--

DROP TABLE IF EXISTS `asent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postal_code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `asent_type_id` int(11) NOT NULL,
  `zone_type` varchar(15) DEFAULT NULL,
  `municipality_id` int(11) NOT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asent_type_id` (`asent_type_id`),
  KEY `municipality_id` (`municipality_id`),
  KEY `locality_id` (`locality_id`),
  KEY `postal_code` (`postal_code`),
  CONSTRAINT `asent_ibfk_1` FOREIGN KEY (`asent_type_id`) REFERENCES `asent_type` (`id`),
  CONSTRAINT `asent_ibfk_2` FOREIGN KEY (`municipality_id`) REFERENCES `municipality` (`id`),
  CONSTRAINT `asent_ibfk_3` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145974 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asent_type`
--

DROP TABLE IF EXISTS `asent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asent_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(4) NOT NULL,
  `phone_code` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipality_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(4) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `altitude` varchar(15) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `municipality_id` (`municipality_id`),
  CONSTRAINT `locality_ibfk_1` FOREIGN KEY (`municipality_id`) REFERENCES `municipality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304496 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `municipality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `municipality_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(255) DEFAULT NULL,
  `rol_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_session_id` int(11) DEFAULT NULL,
  `token` varchar(250) NOT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `setted_at` datetime NOT NULL,
  `finished_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_session_id` (`user_session_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_session_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_abbr` varchar(10) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `second_last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_ibfk_1` (`rol_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

CREATE TABLE IF NOT EXISTS user_customer_info (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    first_last_name VARCHAR(255) NULL DEFAULT NULL,
    second_last_name VARCHAR(255) NULL DEFAULT NULL,
    age INT NULL DEFAULT 0,
    gender VARCHAR(255) NULL DEFAULT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    weight VARCHAR(255) NULL DEFAULT NULL,
    height VARCHAR(255) NULL DEFAULT NULL,
    phone_number VARCHAR(255) NULL DEFAULT NULL,
    weekly_hours VARCHAR(255) NULL DEFAULT NULL,
    city VARCHAR(255) NULL DEFAULT NULL,
    created_at DATETIME,
	updated_at DATETIME,
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS payment_card (
	id INT AUTO_INCREMENT PRIMARY KEY,
    payment_token VARCHAR(200) NOT NULL,
    payment_type VARCHAR(15) NULL DEFAULT NULL,
    payment_card_brand VARCHAR(25) NULL DEFAULT NULL,
    payment_card_last4 VARCHAR(10) NULL DEFAULT NULL,
    payment_card_exp_month VARCHAR(10) NULL DEFAULT NULL,
    payment_card_exp_year VARCHAR(10) NULL DEFAULT NULL,
    payment_card_user_name VARCHAR(40) NULL DEFAULT NULL,
    customer_id_conekta VARCHAR(250) NULL DEFAULT NULL,
    default_payment BOOLEAN DEFAULT TRUE,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS customer_conekta (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(255) NULL DEFAULT NULL,
    name VARCHAR(255) NULL DEFAULT NULL, 
    lastname VARCHAR(255) NULL DEFAULT NULL,
    email VARCHAR(100) NULL DEFAULT NULL,
    phone VARCHAR(40) NULL DEFAULT NULL,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS subscription_conekta (
	id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id VARCHAR(70) NULL DEFAULT NULL,
    subscription_status VARCHAR(200) NULL DEFAULT NULL,
    billing_cicle_start DATETIME NULL DEFAULT NOW(),
    billing_cicle_end DATETIME NULL DEFAULT NOW(),
    plan_id VARCHAR(255) NULL DEFAULT NULL,
    payment_method VARCHAR(255) NULL DEFAULT NULL,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS logs_conekta (
	id INT AUTO_INCREMENT PRIMARY KEY,
    event_id VARCHAR(255) NULL DEFAULT NULL,
    type VARCHAR(255) NULL DEFAULT NULL,
    ignored BOOLEAN DEFAULT TRUE,
    content TEXT,
    raw TEXT,
    alarm BOOLEAN DEFAULT FALSE,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS conekta_webhook (
	id INT AUTO_INCREMENT PRIMARY KEY,
    event_type VARCHAR(255) NULL DEFAULT NULL,
    date_received DATETIME NULL DEFAULT NOW(),
    date_created DATETIME NULL DEFAULT NOW(),
    processed BOOLEAN DEFAULT FALSE,
    event_id VARCHAR(255) NULL DEFAULT NULL,
    payload TEXT DEFAULT '',
    customer_id VARCHAR(255) NULL DEFAULT NULL,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS user_direction (
	id INT AUTO_INCREMENT PRIMARY KEY,
    shipping_email VARCHAR(255) NULL DEFAULT NULL,
    shipping_phone VARCHAR(255) NULL DEFAULT NULL,
    shipping_receiver_name VARCHAR(100) NULL DEFAULT NULL,
    shipping_address_street VARCHAR(200) NULL DEFAULT NULL,
    shipping_address_internal_number VARCHAR(20) NULL DEFAULT NULL,
    shipping_address_external_number VARCHAR(20) NULL DEFAULT NULL,
    shipping_address_country VARCHAR(100) NULL DEFAULT NULL,
    shipping_address_state VARCHAR(180) NULL DEFAULT NULL,
    shipping_address_city VARCHAR(180) NULL DEFAULT NULL,
    shipping_address_asent VARCHAR(200) NULL DEFAULT NULL,
    shipping_address_postalcode VARCHAR(10) NULL DEFAULT NULL,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS permission (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    permission_name VARCHAR(255) NULL DEFAULT NULL,
    description TEXT NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS user_permission (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    permission_id INT(11) NOT NULL,
    created_at DATETIME NULL DEFAULT NOW(),
	updated_at DATETIME NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT FALSE,
    KEY `user_id` (`user_id`),
    KEY `permission_id` (`permission_id`),
    CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
    CONSTRAINT FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-22  2:44:12
