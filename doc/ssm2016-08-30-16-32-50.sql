-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: ssm
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `tb_auth_app_resources`
--

DROP TABLE IF EXISTS `tb_auth_app_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_app_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checked` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `icon_cls` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_app_resources`
--

LOCK TABLES `tb_auth_app_resources` WRITE;
/*!40000 ALTER TABLE `tb_auth_app_resources` DISABLE KEYS */;
INSERT INTO `tb_auth_app_resources` VALUES (22,'0','2016-08-24 17:22:17','',0,1,0,'closed','通用权限管理系统','2016-08-24 17:27:41','http://localhost:8081/auth/login','auth'),(23,'0','2016-08-24 17:26:57','',NULL,1,22,'closed','人员管理模块','2016-08-24 17:28:23','','auth'),(24,'0','2016-08-24 17:31:41','',NULL,1,23,'close','人员管理',NULL,'admin/personMgr','auth'),(25,'0','2016-08-24 17:32:19','',NULL,2,23,'close','人员统计',NULL,'','auth'),(26,'0','2016-08-24 17:32:38','',NULL,3,23,'close','人员分析',NULL,'','auth'),(27,'0','2016-08-24 17:33:01','',NULL,2,22,'closed','资源管理模块','2016-08-24 17:34:41','','auth'),(28,'0','2016-08-24 17:33:33','',NULL,1,27,'close','应用管理',NULL,'admin/appMgr','auth'),(29,'0','2016-08-24 17:39:02','',NULL,2,27,'close','应用菜单管理',NULL,'','auth'),(30,'0','2016-08-25 10:26:14','',NULL,3,22,'closed','权限管理模块','2016-08-30 15:03:32','','auth'),(31,'0','2016-08-25 10:37:23','',NULL,1,30,'open','角色管理',NULL,'admin/roleMgr','auth'),(32,'0','2016-08-25 10:38:00','',NULL,2,30,'open','用户授权','2016-08-30 15:38:17','admin/personRoleMgr','auth'),(33,'0','2016-08-25 16:58:31','',NULL,4,22,'closed','系统管理','2016-08-30 15:02:21','','auth');
/*!40000 ALTER TABLE `tb_auth_app_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auth_person`
--

DROP TABLE IF EXISTS `tb_auth_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `work_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_person`
--

LOCK TABLES `tb_auth_person` WRITE;
/*!40000 ALTER TABLE `tb_auth_person` DISABLE KEYS */;
INSERT INTO `tb_auth_person` VALUES (19,18,'2016-08-24 16:37:53','zhangsan@qq.com','aaaaaa','张三',1,'2016-08-24 16:38:17','zhangsan',1),(20,28,'2016-08-24 16:39:32','lisi@163.com','aaaaaa','李四',2,'2016-08-30 14:22:53','lisi',2),(21,0,'2016-08-25 16:40:27','admin@163.com','admin','管理员',1,NULL,'admin',0),(22,50,'2016-08-30 14:51:54','ldh@126.com','aaaaaa','刘德华',1,NULL,'liudehua',3);
/*!40000 ALTER TABLE `tb_auth_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auth_person_role`
--

DROP TABLE IF EXISTS `tb_auth_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_person_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_person_role`
--

LOCK TABLES `tb_auth_person_role` WRITE;
/*!40000 ALTER TABLE `tb_auth_person_role` DISABLE KEYS */;
INSERT INTO `tb_auth_person_role` VALUES (69,21,7),(70,19,8),(71,20,9);
/*!40000 ALTER TABLE `tb_auth_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auth_role`
--

DROP TABLE IF EXISTS `tb_auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_code` varchar(50) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_role`
--

LOCK TABLES `tb_auth_role` WRITE;
/*!40000 ALTER TABLE `tb_auth_role` DISABLE KEYS */;
INSERT INTO `tb_auth_role` VALUES (7,'系统管理员','admin','维护系统，拥有所有权限'),(8,'权限管理员','authadmin','负责分配权限'),(9,'用户管理','useradmin','管理用户模块');
/*!40000 ALTER TABLE `tb_auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auth_role_apps`
--

DROP TABLE IF EXISTS `tb_auth_role_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_role_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_role_apps`
--

LOCK TABLES `tb_auth_role_apps` WRITE;
/*!40000 ALTER TABLE `tb_auth_role_apps` DISABLE KEYS */;
INSERT INTO `tb_auth_role_apps` VALUES (70,30,8),(71,31,8),(72,32,8),(73,22,8),(74,24,9),(75,22,9),(76,23,9),(77,22,7),(78,23,7),(79,24,7),(80,25,7),(81,26,7),(82,27,7),(83,28,7),(84,29,7),(85,30,7),(86,31,7),(87,32,7),(88,33,7);
/*!40000 ALTER TABLE `tb_auth_role_apps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-30 16:32:55
