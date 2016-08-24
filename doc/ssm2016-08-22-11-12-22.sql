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
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `sys_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_login_name` varchar(50) NOT NULL,
  `sys_user_login_password` varchar(50) NOT NULL,
  `sys_user_is_delete` varchar(1) NOT NULL,
  `sys_user_register_datetime` datetime NOT NULL,
  `sys_user_email` varchar(50) DEFAULT NULL,
  `sys_user_mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'YouMeek1','e10adc3949ba59abbe56e057f20f883e','N','2016-02-24 00:12:23','363379441@qq.com','13800000001'),(2,'YouMeek2','e10adc3949ba59abbe56e057f20f883e','N','2016-02-24 00:12:23','363379442@qq.com','13800000002'),(3,'YouMeek3','e10adc3949ba59abbe56e057f20f883e','N','2016-02-24 00:12:23','363379443@qq.com','13800000003'),(4,'YouMeek4','e10adc3949ba59abbe56e057f20f883e','N','2016-02-24 00:12:23','363379444@qq.com','13800000004'),(5,'YouMeek5','e10adc3949ba59abbe56e057f20f883e','N','2016-02-24 00:12:23','363379445@qq.com','13800000005');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_app_resources`
--

LOCK TABLES `tb_auth_app_resources` WRITE;
/*!40000 ALTER TABLE `tb_auth_app_resources` DISABLE KEYS */;
INSERT INTO `tb_auth_app_resources` VALUES (3,'false','2016-08-18 10:03:42','',0,1,0,'closed','通用权限管理系统','2016-08-18 11:12:13','http://localhost:8081/auth/login'),(4,'false','2016-08-18 10:03:59','',0,2,0,'open','2222','2016-08-19 11:30:20','2222'),(5,'false','2016-08-18 10:04:39','',NULL,1,3,'closed','人员管理模块','2016-08-18 11:12:55','2222'),(6,'false','2016-08-18 10:07:38','',NULL,2,3,'closed','资源管理模块','2016-08-18 11:14:38','2222'),(7,'false','2016-08-18 10:20:01','',NULL,3,3,'closed','角色管理模块','2016-08-19 10:32:11','2222'),(9,'false','2016-08-18 11:00:57','',NULL,1,5,'closed','人员管理','2016-08-18 11:13:17','333'),(10,'true','2016-08-18 11:13:35','',NULL,2,5,'closed','人员统计',NULL,'2'),(11,'true','2016-08-18 11:14:10','',NULL,3,5,'closed','人员分析',NULL,'3'),(12,'true','2016-08-18 11:15:20','',NULL,1,6,'closed','应用管理',NULL,'1'),(13,'false','2016-08-18 11:21:13','',NULL,2,6,'closed','应用菜单管理',NULL,'2'),(14,'false','2016-08-19 10:33:02','',NULL,1,7,'closed','角色管理',NULL,'1'),(15,'false','2016-08-19 10:33:30','',NULL,2,7,'closed','角色授权',NULL,'2');
/*!40000 ALTER TABLE `tb_auth_app_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_auth_menutree`
--

DROP TABLE IF EXISTS `tb_auth_menutree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_auth_menutree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checked` varchar(10) DEFAULT NULL,
  `icon_cls` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_menutree`
--

LOCK TABLES `tb_auth_menutree` WRITE;
/*!40000 ALTER TABLE `tb_auth_menutree` DISABLE KEYS */;
INSERT INTO `tb_auth_menutree` VALUES (1,'false',NULL,'closed','人员管理模块',0,'0',NULL),(2,'false',NULL,'closed','资源管理模块',0,'0',NULL),(3,'false',NULL,'closed','角色管理模块',0,'0',NULL),(4,'false',NULL,'','人员管理',1,'1','admin/personMgr'),(5,'false',NULL,'','人员统计',1,'1',NULL),(6,'false',NULL,'','人员分析',1,'1',NULL),(7,'false',NULL,'','应用管理',1,'2','admin/appMgr'),(8,'false',NULL,'','应用菜单管理',1,'2',NULL),(9,'false',NULL,'','角色管理',1,'3',NULL),(10,'false',NULL,'','角色授权',1,'3',NULL);
/*!40000 ALTER TABLE `tb_auth_menutree` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auth_person`
--

LOCK TABLES `tb_auth_person` WRITE;
/*!40000 ALTER TABLE `tb_auth_person` DISABLE KEYS */;
INSERT INTO `tb_auth_person` VALUES (1,35,'2016-08-15 15:46:51','zs@aa.com','qqq','王五',1,NULL,'wangwu',13),(2,30,'2016-08-15 10:24:40','zhangsan@aaaaaaaaa.com','aaa','张三12',2,NULL,'zhangsan',1),(3,22,'2016-08-15 10:24:50','zs@aa.com','aaa','李四',1,'2016-08-15 10:43:42','lisi',4),(4,45,'2016-08-15 09:58:59','zs@aa.com','aaa','刘德华',2,NULL,'zs',31),(5,22,'2016-08-10 14:42:35','zs@aa.com','aaa','德华qq',1,'2016-08-15 10:25:28','zs',13),(6,22,'2016-08-10 14:42:35','zs@aa.com','aaa','学友',1,'2016-08-12 10:47:54','zs',13),(7,22,'2016-08-10 14:42:35','zs@aa.com','aaa','张三7',1,NULL,'zs',13),(8,22,'2016-08-10 14:42:35','zs@aa.com','aaa','张三8',1,'2016-08-10 14:42:53','zs',13),(9,22,'2016-08-10 14:42:35','zs@aa.com','aaa','tttt',1,NULL,'zs',13),(10,22,'2016-08-10 14:42:35','zs@aa.com','aaa','张三10',1,'2016-08-10 14:42:53','zs',13),(11,22,'2016-08-10 14:42:35','zs@aa.com','aaa','张三11',1,'2016-08-10 14:42:53','zs',13),(12,45,'2016-08-15 10:24:40','aaaa@test.com','wls','王六四',1,NULL,'wls',20),(13,28,'2016-08-15 16:07:12','zhangliu@qq.com','zhangliu','张六',2,NULL,'zhangliu',27),(14,38,'2016-08-15 16:13:02','baoqiang@qq.com','baoqiang','宝强',1,NULL,'baoqiang',8),(15,3,'2016-08-15 16:16:34','7@qq.com','6','1',1,NULL,'5',2),(16,38,'2016-08-16 13:35:49','zhaoliu@126.com','zhaoliu','赵六',1,NULL,'zhaoliu',27),(17,100,'2016-08-16 15:35:10','zxf@yahoo.com','zxf','张三丰',1,NULL,'zxf',18),(18,3,'2016-08-17 09:17:53','2@qq.com','1','1',1,NULL,'zss',2);
/*!40000 ALTER TABLE `tb_auth_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-22 11:12:25
