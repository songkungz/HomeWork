/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-10-29 15:15:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Cid` int(11) NOT NULL DEFAULT '0',
  `Cname` varchar(30) DEFAULT NULL,
  `c_teacher` varchar(30) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `course_resource`
-- ----------------------------
DROP TABLE IF EXISTS `course_resource`;
CREATE TABLE `course_resource` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Cid` int(11) DEFAULT NULL,
  `Rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `course_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Cid` int(11) DEFAULT NULL,
  `Tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Uid` int(11) DEFAULT NULL,
  `Tid` int(11) DEFAULT NULL,
  `Content` varchar(250) DEFAULT NULL,
  `Time` date DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `Nid` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(50) DEFAULT NULL,
  `n_Content` varchar(250) DEFAULT NULL,
  `Time` date DEFAULT NULL,
  `Author` varchar(30) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_resource`
-- ----------------------------
DROP TABLE IF EXISTS `news_resource`;
CREATE TABLE `news_resource` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Nid` int(11) DEFAULT NULL,
  `Rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Rid` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  `Src` varchar(100) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for `super_user`
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user` (
  `Sid` int(11) NOT NULL DEFAULT '0',
  `Sname` varchar(30) DEFAULT NULL,
  `Spassword` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of super_user
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Tid` int(11) NOT NULL DEFAULT '0',
  `Tname` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Information` varchar(200) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_resource`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_resource`;
CREATE TABLE `teacher_resource` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Tid` int(11) DEFAULT NULL,
  `Rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Uid` int(11) NOT NULL DEFAULT '0',
  `Uname` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Uid` int(11) DEFAULT NULL,
  `Cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
