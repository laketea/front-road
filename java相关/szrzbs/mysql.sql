-- MySQL dump 10.10
--
-- Host: localhost    Database: szrz
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `admin_table`
--

DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `pwd` varchar(255) default NULL,
  `createDate` varchar(255) default NULL,
  `superAdmin` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `admin_table`
--


/*!40000 ALTER TABLE `admin_table` DISABLE KEYS */;
LOCK TABLES `admin_table` WRITE;
INSERT INTO `admin_table` VALUES (1,'zhangwei','123456','2012-11-06 23:47:56','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_table` ENABLE KEYS */;

--
-- Table structure for table `antiimg_table`
--

DROP TABLE IF EXISTS `antiimg_table`;
CREATE TABLE `antiimg_table` (
  `id` int(11) NOT NULL auto_increment,
  `imgName` varchar(50) default NULL,
  `oglPath` varchar(50) default NULL,
  `path` varchar(50) default NULL,
  `typeId` varchar(50) default NULL,
  `startDate` varchar(50) default NULL,
  `endDate` varchar(50) default NULL,
  `validDate` varchar(50) default NULL,
  `shootPlace` varchar(50) default NULL,
  `shootTime` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `userIdCard` varchar(50) default NULL,
  `valueCoin` int(11) default NULL,
  `spendCoin` int(11) default NULL,
  `antiTime` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `antiimg_table`
--


/*!40000 ALTER TABLE `antiimg_table` DISABLE KEYS */;
LOCK TABLES `antiimg_table` WRITE;
INSERT INTO `antiimg_table` VALUES (1,'123xxx','12312','3123','123','1313','1313','123','12312','312','312312','3123','1231',23123,123,'2012-11-03 23:42:09','12313');
UNLOCK TABLES;
/*!40000 ALTER TABLE `antiimg_table` ENABLE KEYS */;

--
-- Table structure for table `copyrightimg_table`
--

DROP TABLE IF EXISTS `copyrightimg_table`;
CREATE TABLE `copyrightimg_table` (
  `id` int(11) NOT NULL auto_increment,
  `imgName` varchar(50) default NULL,
  `oglPath` varchar(50) default NULL,
  `path` varchar(50) default NULL,
  `typeId` varchar(50) default NULL,
  `startDate` varchar(50) default NULL,
  `endDate` varchar(50) default NULL,
  `validDate` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `userIdCard` varchar(50) default NULL,
  `spendCoin` varchar(50) default NULL,
  `copyRightTime` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `copyrightimg_table`
--


/*!40000 ALTER TABLE `copyrightimg_table` DISABLE KEYS */;
LOCK TABLES `copyrightimg_table` WRITE;
INSERT INTO `copyrightimg_table` VALUES (1,'123','cc23c651-9ca1-4dd3-a10d-af4f4251b741.bmp',NULL,'1',NULL,NULL,'cc23c651-9ca1-4dd3-a10d-af4f4251b741.bmp','4','zhangwei','123123123',NULL,'2012-11-19',NULL),(2,'123','b0cf9c42-9b0a-446a-aad3-2d9e8bbae67e.bmp',NULL,'1',NULL,NULL,'b0cf9c42-9b0a-446a-aad3-2d9e8bbae67e.bmp','4','zhangwei','123123123',NULL,'2012-11-19',NULL),(3,'123123','d7619617-35a0-410c-a739-923a6637b35b.bmp',NULL,'1',NULL,NULL,'d7619617-35a0-410c-a739-923a6637b35b.bmp','4','zhangwei','123123123',NULL,'2012-11-19',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `copyrightimg_table` ENABLE KEYS */;

--
-- Table structure for table `guestbook_table`
--

DROP TABLE IF EXISTS `guestbook_table`;
CREATE TABLE `guestbook_table` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `content` varchar(50) default NULL,
  `typeId` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `userNick` varchar(50) default NULL,
  `replyContent` varchar(50) default NULL,
  `replyTime` varchar(50) default NULL,
  `guestBookTime` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `guestbook_table`
--


/*!40000 ALTER TABLE `guestbook_table` DISABLE KEYS */;
LOCK TABLES `guestbook_table` WRITE;
INSERT INTO `guestbook_table` VALUES (3,'213','31231','1','版权保护问题','','','','23123123123123休息休息','2012-11-18','2012-11-18 20:33:48',''),(5,'123123','123123123','2','防伪认证问题',NULL,NULL,NULL,'123123',NULL,'2012-11-18 20:43:15',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `guestbook_table` ENABLE KEYS */;

--
-- Table structure for table `guestbooktype_table`
--

DROP TABLE IF EXISTS `guestbooktype_table`;
CREATE TABLE `guestbooktype_table` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `gbCount` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `guestbooktype_table`
--


/*!40000 ALTER TABLE `guestbooktype_table` DISABLE KEYS */;
LOCK TABLES `guestbooktype_table` WRITE;
INSERT INTO `guestbooktype_table` VALUES (1,'版权保护问题','123','1'),(2,'防伪认证问题','123','1'),(3,'充值咨询','123','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `guestbooktype_table` ENABLE KEYS */;

--
-- Table structure for table `imgtype_table`
--

DROP TABLE IF EXISTS `imgtype_table`;
CREATE TABLE `imgtype_table` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `imgCount` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `imgtype_table`
--


/*!40000 ALTER TABLE `imgtype_table` DISABLE KEYS */;
LOCK TABLES `imgtype_table` WRITE;
INSERT INTO `imgtype_table` VALUES (1,'风景','123123','123123'),(2,'人物','3123123123','213123');
UNLOCK TABLES;
/*!40000 ALTER TABLE `imgtype_table` ENABLE KEYS */;

--
-- Table structure for table `logininfo_table`
--

DROP TABLE IF EXISTS `logininfo_table`;
CREATE TABLE `logininfo_table` (
  `id` int(11) NOT NULL auto_increment,
  `userId` varchar(50) default NULL,
  `nick` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `lastLogin` varchar(50) default NULL,
  `loginCount` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `logininfo_table`
--


/*!40000 ALTER TABLE `logininfo_table` DISABLE KEYS */;
LOCK TABLES `logininfo_table` WRITE;
INSERT INTO `logininfo_table` VALUES (1,'zhangwei','zhangwei','laketea@163.com','12615151515','good545','123',123);
UNLOCK TABLES;
/*!40000 ALTER TABLE `logininfo_table` ENABLE KEYS */;

--
-- Table structure for table `news_table`
--

DROP TABLE IF EXISTS `news_table`;
CREATE TABLE `news_table` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `content` varchar(50) default NULL,
  `typeId` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  `viewCount` varchar(50) default NULL,
  `publishTime` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `news_table`
--


/*!40000 ALTER TABLE `news_table` DISABLE KEYS */;
LOCK TABLES `news_table` WRITE;
INSERT INTO `news_table` VALUES (4,'测试新闻测试新闻','测试新闻测试新闻测试新闻测试新闻','1','行业新闻','0','2012-11-17 22:55:49','0'),(5,'测试新闻测试新闻','测试新闻测试新闻','1','行业新闻','0','2012-11-17 22:56:00','0'),(6,'测试新闻测试新闻','测试新闻测试新闻','1','行业新闻','0','2012-11-17 22:56:12','0'),(7,'测试新闻测试新闻','测试新闻测试新测试新闻测试新闻闻','1','行业新闻','0','2012-11-17 22:56:18','0'),(8,'测试新闻测试新闻测试新闻测试新闻','测试新闻测试新闻测试新闻测试新闻','1','行业新闻','0','2012-11-17 22:56:27','0'),(9,'测试新闻测试新闻','测试新闻测试新闻','2','公司新闻','0','2012-11-17 22:57:13','0'),(10,'测试新闻测试新闻','测试新闻测试新闻','2','公司新闻','0','2012-11-17 22:57:21','0'),(11,'测试新闻测试新闻测试新闻测试新闻','测试新闻测试新闻测试新闻测试新闻','2','公司新闻','0','2012-11-17 22:57:29','0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `news_table` ENABLE KEYS */;

--
-- Table structure for table `newstype_table`
--

DROP TABLE IF EXISTS `newstype_table`;
CREATE TABLE `newstype_table` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `newsCount` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `newstype_table`
--


/*!40000 ALTER TABLE `newstype_table` DISABLE KEYS */;
LOCK TABLES `newstype_table` WRITE;
INSERT INTO `newstype_table` VALUES (1,'行业新闻','1','1'),(2,'公司新闻','1','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `newstype_table` ENABLE KEYS */;

--
-- Table structure for table `purimg_table`
--

DROP TABLE IF EXISTS `purimg_table`;
CREATE TABLE `purimg_table` (
  `id` int(11) NOT NULL auto_increment,
  `imgName` varchar(50) default NULL,
  `oglPath` varchar(50) default NULL,
  `path` varchar(50) default NULL,
  `typeId` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  `purUserId` varchar(50) default NULL,
  `purUserName` varchar(50) default NULL,
  `purUserIdCard` varchar(50) default NULL,
  `purTime` varchar(50) default NULL,
  `imgId` varchar(50) default NULL,
  `valueCoin` int(11) default NULL,
  `antiTime` varchar(50) default NULL,
  `startDate` varchar(50) default NULL,
  `endDate` varchar(50) default NULL,
  `validDate` varchar(50) default NULL,
  `shootPlace` varchar(50) default NULL,
  `shootTime` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `userIdCard` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `purimg_table`
--


/*!40000 ALTER TABLE `purimg_table` DISABLE KEYS */;
LOCK TABLES `purimg_table` WRITE;
INSERT INTO `purimg_table` VALUES (1,'丰原','123','12312','123','风景','6','john','38172381723812738','2012-11-04 00:22:06','12',123,'20191992','20191992','20191992','12','西安','19889898','123','fine','123123123','123');
UNLOCK TABLES;
/*!40000 ALTER TABLE `purimg_table` ENABLE KEYS */;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `id` int(11) NOT NULL auto_increment,
  `nick` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `idCard` varchar(50) default NULL,
  `passward` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `age` varchar(50) default NULL,
  `male` varchar(50) default NULL,
  `work` varchar(50) default NULL,
  `goldCoin` int(11) default NULL,
  `status` varchar(50) default NULL,
  `regTime` varchar(50) default NULL,
  `loginCount` int(11) default NULL,
  `userWork` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `user_table`
--


/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
LOCK TABLES `user_table` WRITE;
INSERT INTO `user_table` VALUES (4,'zhangwei','zhangwei','123123123','123123','123123','123','1',NULL,123,'13','2012-11-19',123,'123'),(5,'1231','23123123','123123123123123','1231','2312312','123','123',NULL,123,'123','2012-11-19',123,'123');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

--
-- Table structure for table `userinfo_table`
--

DROP TABLE IF EXISTS `userinfo_table`;
CREATE TABLE `userinfo_table` (
  `id` int(11) NOT NULL auto_increment,
  `nick` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `headId` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `male` varchar(50) default NULL,
  `university` varchar(50) default NULL,
  `company` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `qq` varchar(50) default NULL,
  `micblog` varchar(50) default NULL,
  `regTime` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `userinfo_table`
--


/*!40000 ALTER TABLE `userinfo_table` DISABLE KEYS */;
LOCK TABLES `userinfo_table` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `userinfo_table` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

