/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - onlineca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlineca` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `onlineca`;

/*Table structure for table `acount_mstr` */

DROP TABLE IF EXISTS `acount_mstr`;

CREATE TABLE `acount_mstr` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `login` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `acount_mstr` */

insert  into `acount_mstr`(`aid`,`aname`,`afname`,`dob`,`address`,`phone`,`email`,`doj`,`login`,`pswd`) values (1,'david','bush','1980-09-09','lucknow','89799','david@bush.com','2011-09-09','david','123456'),(2,'dara','gurpreet','1988-03-10','delhi','23456','dara@dara.lk','2013-03-13','dara','123456');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `login` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `admin` */

insert  into `admin`(`login`,`pswd`) values ('admin','admin');

/*Table structure for table `cust_dwnld` */

DROP TABLE IF EXISTS `cust_dwnld`;

CREATE TABLE `cust_dwnld` (
  `cid` int(11) DEFAULT NULL,
  `sub` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dwnld` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `FK_cust_dwnld` (`cid`),
  CONSTRAINT `FK_cust_dwnld` FOREIGN KEY (`cid`) REFERENCES `cust_mstr` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cust_dwnld` */

insert  into `cust_dwnld`(`cid`,`sub`,`dwnld`) values (1,'MRI Report','./test.doc'),(2,'Tom & Jerry','./test.doc'),(2,'Tom & Jerry','./test.doc');

/*Table structure for table `cust_mstr` */

DROP TABLE IF EXISTS `cust_mstr`;

CREATE TABLE `cust_mstr` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cfname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cust_mstr` */

insert  into `cust_mstr`(`cid`,`cname`,`cfname`,`address`,`dob`,`phone`,`email`,`login`,`pswd`) values (1,'ajendra','hhjg','sitapur','1998-03-18','984657738','chandan.tripathi41@in.com','ajendra','123456'),(2,'rakesh','mahesh','kanpur','1920-03-10','989898989','asa@13.lk','rakesh','123456'),(3,'sharba','ddf','gdfgd','2013-04-17','4353','asa@13.lk','sharba','123456');

/*Table structure for table `cust_query` */

DROP TABLE IF EXISTS `cust_query`;

CREATE TABLE `cust_query` (
  `cqid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `qury_sub` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `replied` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`cqid`),
  KEY `FK_cust_query` (`cid`),
  CONSTRAINT `FK_cust_query` FOREIGN KEY (`cid`) REFERENCES `cust_mstr` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cust_query` */

insert  into `cust_query`(`cqid`,`cid`,`qury_sub`,`detail`,`replied`) values (100,1,'income tax','dsadasdadsad asdadda','0'),(101,3,'apologize  and mone back letter','sfsvc cdgdf gfd cd fdbvfd','0');

/*Table structure for table `cust_upld` */

DROP TABLE IF EXISTS `cust_upld`;

CREATE TABLE `cust_upld` (
  `upld_no` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `sub` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filepath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewed` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`upld_no`),
  KEY `FK_cust_upld` (`cid`),
  CONSTRAINT `FK_cust_upld` FOREIGN KEY (`cid`) REFERENCES `cust_mstr` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cust_upld` */

insert  into `cust_upld`(`upld_no`,`cid`,`sub`,`filepath`,`viewed`) values (100,1,'MRI Report','F:\\pankaj\\OnlineCA\\build\\web\\df.txt','0'),(101,1,'FTP Details','./test.doc','0'),(102,2,'MRI Report','./test.doc','0'),(103,3,'FTP Details','./test.doc','0');

/*Table structure for table `emp_leave` */

DROP TABLE IF EXISTS `emp_leave`;

CREATE TABLE `emp_leave` (
  `empid` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `total_days` tinyint(4) DEFAULT NULL,
  `allowed` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  KEY `FK_emp_leave` (`empid`),
  CONSTRAINT `FK_emp_leave` FOREIGN KEY (`empid`) REFERENCES `emp_mstr` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `emp_leave` */

insert  into `emp_leave`(`empid`,`from_date`,`to_date`,`total_days`,`allowed`) values (1,'2013-03-13','2013-03-15',3,'0');

/*Table structure for table `emp_mstr` */

DROP TABLE IF EXISTS `emp_mstr`;

CREATE TABLE `emp_mstr` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `efname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `designation` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `emp_mstr` */

insert  into `emp_mstr`(`empid`,`ename`,`efname`,`dob`,`address`,`phone`,`email`,`doj`,`designation`,`login`,`pswd`) values (1,'Faizal','hdhd','1985-08-27','adsa','2342','aS@KL.IN','2010-08-27','manager','faizal','123456'),(2,'suresh','mahesh','1985-08-27','kanpur','34','suresh@mahesh.com','2010-08-27','HR','suresh','123456'),(3,'rohan','sohan','1988-03-10','delhi','23456','rohan@sohan.com','2013-03-13','executive','rohan','123456');

/*Table structure for table `emp_sal` */

DROP TABLE IF EXISTS `emp_sal`;

CREATE TABLE `emp_sal` (
  `empid` int(11) DEFAULT NULL,
  `basic` decimal(8,2) DEFAULT NULL,
  `ta` decimal(8,2) DEFAULT NULL,
  `da` decimal(8,2) DEFAULT NULL,
  `other` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `smonth` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  KEY `FK_emp_sal` (`empid`),
  CONSTRAINT `FK_emp_sal` FOREIGN KEY (`empid`) REFERENCES `emp_mstr` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `emp_sal` */

insert  into `emp_sal`(`empid`,`basic`,`ta`,`da`,`other`,`total`,`smonth`,`issue_date`) values (1,'500.30','30.00','20.00','10.35','560.65','January','2013-01-10'),(1,'500.30','30.00','20.00','10.35','560.65','February','2013-02-11');

/*Table structure for table `schedule_dwnld` */

DROP TABLE IF EXISTS `schedule_dwnld`;

CREATE TABLE `schedule_dwnld` (
  `sub` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `download` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `schedule_dwnld` */

insert  into `schedule_dwnld`(`sub`,`detail`,`download`) values ('Seminar Notice','Dear Student, Seminar on subject is supposetd to be held on 23 april 2013 the chief guest\r\nis hounrable Reserve Bank Governer',NULL),('admit_card','jhdkf  jkndf jhdsf','./test.doc');

/*Table structure for table `stu_fee` */

DROP TABLE IF EXISTS `stu_fee`;

CREATE TABLE `stu_fee` (
  `sid` int(11) DEFAULT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  `paid` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  `paid_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  KEY `FK_stu_fee` (`sid`),
  CONSTRAINT `FK_stu_fee` FOREIGN KEY (`sid`) REFERENCES `stu_mstr` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stu_fee` */

insert  into `stu_fee`(`sid`,`fee`,`paid`,`paid_date`,`due_date`) values (1,'1500.00','0',NULL,'2013-03-26'),(2,'3500.00','1','2013-03-19',NULL);

/*Table structure for table `stu_mstr` */

DROP TABLE IF EXISTS `stu_mstr`;

CREATE TABLE `stu_mstr` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sfname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stu_mstr` */

insert  into `stu_mstr`(`sid`,`sname`,`sfname`,`address`,`dob`,`phone`,`email`,`login`,`pswd`) values (1,'chandan','sm','lucknow','1985-07-25','8687974335','chandan.tripathi41@gmail.com','chandan','123456'),(2,'pankaj',NULL,'lucknow','1984-02-14','9839434821','pankaj.misra009@gmail.com','pankaj','123456');

/*Table structure for table `stu_query` */

DROP TABLE IF EXISTS `stu_query`;

CREATE TABLE `stu_query` (
  `sqid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `qury_sub` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `replied` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`sqid`),
  KEY `FK_stu_query` (`sid`),
  CONSTRAINT `FK_stu_query` FOREIGN KEY (`sid`) REFERENCES `stu_mstr` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stu_query` */

insert  into `stu_query`(`sqid`,`sid`,`qury_sub`,`detail`,`replied`) values (100,2,'ddfsf','XZ','0'),(101,1,'MRI Report','jfdkfdkfnk dafn n sdf sdjf h','1'),(102,1,'MRI Report','jfdkfdkfnk dafn n sdf sdjf h','1'),(103,2,'ddfsf','XZ','0'),(104,2,'ddfsf','XZ','0'),(105,2,'ddfsf','XZ','0'),(106,1,'FTP Details','fdgffhff','0');

/*Table structure for table `to_mstr` */

DROP TABLE IF EXISTS `to_mstr`;

CREATE TABLE `to_mstr` (
  `toid` int(11) NOT NULL AUTO_INCREMENT,
  `toname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tofname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `addres` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pswd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`toid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `to_mstr` */

insert  into `to_mstr`(`toid`,`toname`,`tofname`,`dob`,`addres`,`phone`,`doj`,`email`,`login`,`pswd`) values (1,'salman','rahman','1990-09-09','kanpur',NULL,'2010-09-09','to@to.in','salman','123456'),(2,'meena','zubair','2013-02-27','delhi','23456','1994-03-02','meena@zubair.com','meena','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
