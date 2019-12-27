/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.57 : Database - books
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`books` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `books`;

/*Table structure for table `administer` */

DROP TABLE IF EXISTS `administer`;

CREATE TABLE `administer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phonenum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `administer` */

insert  into `administer`(`id`,`name`,`password`,`phonenum`) values (10,'lily','123','18200000000'),(11,'lonely','b394e6c1ab583e0966b03751b0237350','18211111111'),(12,'huge','123','18222222222'),(27,'zh','123456','139540');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `press` varchar(50) DEFAULT NULL,
  `pressdate` varchar(20) DEFAULT NULL,
  `inputname` varchar(20) DEFAULT NULL,
  `inputdate` varchar(100) DEFAULT NULL,
  `imgpath` varchar(100) DEFAULT NULL,
  `content` text,
  `visit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`bookname`,`number`,`author`,`price`,`press`,`pressdate`,`inputname`,`inputdate`,`imgpath`,`content`,`visit`) values (1,'数据结构',174,'严蔚敏',30,'清华大学出版社','2010-01-01','lonely','2010-01-01','images/1.jpg','dfghjk',24),(2,'操作系统',179,'方敏',40,'清华大学出版社','2010-01-01','lily','2010-01-01','images/1.jpg','dfghjk',26),(3,'计算机网络',153,'吴英',50,'电子工业出版社','2010-01-01','huge','2010-01-01','images/1.jpg','dfghjk',24),(5,'算法设计',209,'xiyang',777,'qianfeng','2019-6-24','zh','2019-6-24','img/github.png','zxdfghjkl;lkjg',0),(6,'Linux基础',200,'xiyang',777,'qianfeng','2019-6-24','zh','2019-6-24','img/github.png','删除的深V导入GV发',0),(7,'C语言',200,'xiyang',22,'qianfeng','2019-6-24','zh','2019-6-24','img/github.png','C语言是基础语言',0),(8,'java',200,'xiyang',2,'qianfeng','2019-6-24','zh','2019-6-24','img/github.png','国旅规划',0),(9,'的说法的',412,'1231',1241,'的第三方第三方','1123','发帝国时代','Fri Jun 28 09:25:00 CST 2019','images/1561685088608.jpg','瓦热舞',0);

/*Table structure for table `bookbuyed` */

DROP TABLE IF EXISTS `bookbuyed`;

CREATE TABLE `bookbuyed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phonenum` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `bookbuyed` */

insert  into `bookbuyed`(`id`,`bookid`,`bookname`,`number`,`userid`,`username`,`phonenum`,`date`,`address`) values (31,2,'操作系统',10,10,'lily','18200000000','2018.01.01','得到的'),(32,3,'计算机网络',10,12,'huge','18222222222','2018.01.01','规划'),(34,2,'操作系统',1,12,'huge','18222222222','2019.07.05','grhj'),(46,1,'数据结构',2,20,'lonely','13200000000','Wed Jun 26 10:32:34 CST 2019','电饭锅'),(47,2,'操作系统',3,20,'lonely','13200000000','Wed Jun 26 10:55:49 CST 2019','电饭锅'),(48,1,'数据结构',15,20,'lonely','13200000000','Wed Jun 26 14:29:17 CST 2019','电饭锅'),(49,2,'操作系统',10,20,'lonely','13200000','Wed Jun 26 15:26:48 CST 2019','发DVD从v'),(50,1,'数据结构',1,20,'lonely','13200000','Wed Jun 26 15:34:51 CST 2019','发DVD从v'),(51,1,'数据结构',10,20,'lonely','13200000','Wed Jun 26 15:34:51 CST 2019','发DVD从v'),(52,3,'计算机网络',15,20,'lonely','13200000','Wed Jun 26 15:34:51 CST 2019','发DVD从v'),(53,5,'算法设计',1,20,'lonely','13200000','Wed Jun 26 15:35:27 CST 2019','发DVD从v'),(54,5,'算法设计',10,20,'lonely','13200000','Wed Jun 26 15:35:45 CST 2019','发DVD从v'),(55,2,'操作系统',1,20,'lonely','13200000','Wed Jun 26 15:42:06 CST 2019','发DVD从v'),(56,3,'计算机网络',20,20,'lonely','13200000','Wed Jun 26 15:47:33 CST 2019','发DVD从v'),(57,3,'计算机网络',2,20,'lonely','13200000','Wed Jun 26 15:48:33 CST 2019','发DVD从v'),(58,3,'计算机网络',10,20,'lonely','13200000','Wed Jun 26 16:34:12 CST 2019','发DVD从v'),(59,2,'操作系统',5,20,'lonely','13200000','Wed Jun 26 16:38:54 CST 2019','发DVD从v'),(60,2,'操作系统',1,20,'lonely','13200000','Wed Jun 26 16:43:41 CST 2019','发DVD从v'),(61,2,'操作系统',1,20,'lonely','13200000','Wed Jun 26 16:43:45 CST 2019','发DVD从v');

/*Table structure for table `bookcart` */

DROP TABLE IF EXISTS `bookcart`;

CREATE TABLE `bookcart` (
  `id` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `xid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`xid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `bookcart` */

insert  into `bookcart`(`id`,`bookid`,`number`,`xid`) values (20,2,1,23),(20,2,20,24);

/*Table structure for table `bookneeded` */

DROP TABLE IF EXISTS `bookneeded`;

CREATE TABLE `bookneeded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `bookname` varchar(20) DEFAULT NULL,
  `bookauthor` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `bookneeded` */

insert  into `bookneeded`(`id`,`bookid`,`bookname`,`bookauthor`,`number`,`date`) values (41,3,'计算机网络','吴英',5,'2019.06.01');

/*Table structure for table `financialrecord` */

DROP TABLE IF EXISTS `financialrecord`;

CREATE TABLE `financialrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `bookname` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `moneytotal` float DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `inputdate` varchar(50) DEFAULT NULL,
  `buydate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `financialrecord` */

insert  into `financialrecord`(`id`,`bookid`,`bookname`,`number`,`price`,`moneytotal`,`userid`,`username`,`inputdate`,`buydate`) values (50,1,'数据结构',5,30,150,20,'aaa','2019-06-01','2019-06-01'),(51,2,'操作系统',5,40,200,21,'bbb','2019-06-01','2019-06-01'),(52,3,'计算机网络',10,50,500,22,'ccc','2019-06-01','2019-06-01'),(59,1,'数据结构',2,30,60,20,'lonely','2010-01-01','Wed Jun 26 10:32:34 CST 2019'),(60,2,'操作系统',3,40,120,20,'lonely','2010-01-01','Wed Jun 26 10:55:49 CST 2019'),(61,1,'数据结构',15,30,450,20,'lonely','2010-01-01','Wed Jun 26 14:29:17 CST 2019'),(62,2,'操作系统',10,40,400,20,'lonely','2010-01-01','Wed Jun 26 15:26:48 CST 2019'),(63,1,'数据结构',1,30,30,20,'lonely','2010-01-01','Wed Jun 26 15:34:51 CST 2019'),(64,1,'数据结构',10,30,300,20,'lonely','2010-01-01','Wed Jun 26 15:34:51 CST 2019'),(65,3,'计算机网络',15,50,750,20,'lonely','2010-01-01','Wed Jun 26 15:34:51 CST 2019'),(66,5,'算法设计',1,777,777,20,'lonely','2019-6-24','Wed Jun 26 15:35:27 CST 2019'),(67,5,'算法设计',10,777,7770,20,'lonely','2019-6-24','Wed Jun 26 15:35:45 CST 2019'),(68,2,'操作系统',1,40,40,20,'lonely','2010-01-01','Wed Jun 26 15:42:06 CST 2019'),(69,3,'计算机网络',20,50,1000,20,'lonely','2010-01-01','Wed Jun 26 15:47:33 CST 2019'),(70,3,'计算机网络',2,50,100,20,'lonely','2010-01-01','Wed Jun 26 15:48:33 CST 2019'),(71,3,'计算机网络',10,50,500,20,'lonely','2010-01-01','Wed Jun 26 16:34:12 CST 2019'),(72,2,'操作系统',5,40,200,20,'lonely','2010-01-01','Wed Jun 26 16:38:54 CST 2019'),(73,2,'操作系统',1,40,40,20,'lonely','2010-01-01','Wed Jun 26 16:43:41 CST 2019'),(74,2,'操作系统',1,40,40,20,'lonely','2010-01-01','Wed Jun 26 16:43:45 CST 2019'),(75,5,'算法设计',200,777,-155400,11,'lonely/ad','Wed Jun 26 18:16:24 CST 2019',NULL),(76,6,'Linux基础',200,777,-155400,11,'lonely/ad','Wed Jun 26 18:26:02 CST 2019',NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `msg` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `messageup` */

DROP TABLE IF EXISTS `messageup`;

CREATE TABLE `messageup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `messager` varchar(20) DEFAULT NULL,
  `content` text,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `messageup` */

insert  into `messageup`(`id`,`title`,`messager`,`content`,`date`) values (60,'新书可售','lonely','数据结构（严蔚敏著），此书新到，可订购。','2018.01.01'),(61,'库存不足','huge','计算机网络（吴英著），此书库存不足，无法订购。','2018.06.01');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `phonenum` varchar(20) NOT NULL,
  `truthname` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `entertime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phonenum`,`truthname`,`img`,`address`,`email`,`entertime`) values (20,'lonely','b394e6c1ab583e0966b03751b0237350','13200000','航航','img/156169123812320.jpg','发DVD从v','456789','2019-06-26'),(21,'bbb','123','13200000000','xc','img/header.jpg','sdfg','3232','2019-06-26'),(23,'aaa','afecb53f1f5315531ba8661a93d7c400','7845846523','ljl','img/3.jpg','fgdf','1235466@qq.com','2019-06-26'),(24,'王镜','c8f3efa32a4b8b18c7f948a49a089b2e','12312312312123','呜呜呜呜','img/header.jpg','123','12312312','2019-01-01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
