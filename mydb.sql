/*
Navicat MySQL Data Transfer

Source Server         : sk
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-12-14 18:42:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `columns`
-- ----------------------------
DROP TABLE IF EXISTS `columns`;
CREATE TABLE `columns` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `describe` varchar(500) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cid` varchar(100) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of columns
-- ----------------------------
INSERT INTO `columns` VALUES ('1', '语言', '', 'images/语言.jpg', '0', null);
INSERT INTO `columns` VALUES ('2', '家庭教育', '', 'images/家庭教育.jpg', '0', null);
INSERT INTO `columns` VALUES ('3', '心理学', '', 'images/心理学.jpg', '0', null);
INSERT INTO `columns` VALUES ('4', '物理学', '', 'images/物理学.jpg', '0', null);
INSERT INTO `columns` VALUES ('5', '经济学', '', 'images/经济学.jpg', '0', null);
INSERT INTO `columns` VALUES ('6', '人文科学', '\r\n', 'images/人文科学.jpg', '0', null);
INSERT INTO `columns` VALUES ('7', '生物学', '自然科学的一个部分。目的在于阐明和控制生命', 'images/生物学.jpg', '0', null);
INSERT INTO `columns` VALUES ('8', '数理逻辑与数学基础', null, null, '1', null);
INSERT INTO `columns` VALUES ('10', '信息科学与系统科学基础学科', null, null, '2', null);

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Cid` int(11) DEFAULT NULL,
  `Refid` int(11) DEFAULT NULL,
  `Commentid` int(20) NOT NULL AUTO_INCREMENT,
  `Courselist` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Uname` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Head_image` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Comment_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Comment_content` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (null, null, '11', null, null, './images/pl-img.jpg', '2018/12/11 下午9:21:45', '请问大神成长相册出现在公司');
INSERT INTO `comment` VALUES (null, null, '12', null, null, './images/pl-img.jpg', '2018/12/13 下午2:03:13', '希望能更好！');
INSERT INTO `comment` VALUES (null, null, '13', null, null, './images/pl-img.jpg', '2018/12/14 下午1:49:34', 'rrdftgyhujikol');
INSERT INTO `comment` VALUES (null, null, '14', null, null, './images/pl-img.jpg', '2018/12/14 下午1:49:45', 'gvkbhk');

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
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cid` int(11) DEFAULT NULL,
  `Tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES ('1', '22', '1');
INSERT INTO `course_teacher` VALUES ('2', '24', '7');
INSERT INTO `course_teacher` VALUES ('3', '25', '3');
INSERT INTO `course_teacher` VALUES ('4', '22', '2');
INSERT INTO `course_teacher` VALUES ('5', '23', '2');
INSERT INTO `course_teacher` VALUES ('6', '25', '2');
INSERT INTO `course_teacher` VALUES ('7', '23', '6');
INSERT INTO `course_teacher` VALUES ('8', '26', '6');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `Nid` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `n_Content` varchar(250) NOT NULL,
  `Time` date DEFAULT NULL,
  `Author` varchar(30) NOT NULL,
  `Imge` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Nid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', 'test6', '11111111', '2018-12-01', 'sk', 'images/梦帆.jpg', null);
INSERT INTO `news` VALUES ('19', 'test2', '高中生也能成为互联网工程师', '2018-12-07', 'sk', 'images/新闻.jpg', null);
INSERT INTO `news` VALUES ('21', 'test4', 'test', '2018-12-01', 'sk', 'images/news2.jpg', null);
INSERT INTO `news` VALUES ('22', 'test5', 'test', '2018-12-06', 'sk', 'images/news3.jpg', null);

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Rid` int(11) NOT NULL AUTO_INCREMENT,
  `fileType` varchar(20) DEFAULT NULL,
  `filePath` varchar(100) DEFAULT NULL,
  `fileTime` varchar(30) DEFAULT NULL,
  `Filename` varchar(40) DEFAULT NULL,
  `fileSize` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('30', 'image/jpeg', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload', null, 'course4.jpg', '26 Kb');
INSERT INTO `resource` VALUES ('32', 'video/mp4', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload', null, 'test2.mp4', '7470 Kb');
INSERT INTO `resource` VALUES ('33', 'image/jpeg', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload', null, 'Andrew Shewbart.jpg', '43 Kb');
INSERT INTO `resource` VALUES ('34', 'text/plain', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload', null, '新建文本文档.txt', '0 Kb');

-- ----------------------------
-- Table structure for `super_user`
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user` (
  `Sid` int(11) NOT NULL DEFAULT '0',
  `Sname` varchar(30) DEFAULT NULL,
  `Spassword` varchar(30) DEFAULT NULL,
  `roles` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of super_user
-- ----------------------------
INSERT INTO `super_user` VALUES ('1', 'sk', 'sk123456', null);

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Tid` int(11) NOT NULL AUTO_INCREMENT,
  `Tname` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Information` varchar(200) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Tid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'tony', '30', '男', '北京理工大学，985院校 能源化学工程专业学士 2017财年新东方华南西南区新教师培训化学组赛', 'images/test1.jpg', '家庭教育', null);
INSERT INTO `teacher` VALUES ('2', 'john', '27', '女', '贵州大学，211院校	翻译专业学士	英语专业四级证书 第八届东盟教育交流周翻译', 'images/test2.jpg', '家庭教育', null);
INSERT INTO `teacher` VALUES ('3', 'Vivian', '26', '女', '英语教育专业 通过CET4级、CET6级； 持有BEC商务英语资格证；初级中学教师资格证', 'images/vivian.jpg', '语言', null);
INSERT INTO `teacher` VALUES ('4', 'miss', '28', '女', '武汉大学，985院校	印刷工程学士 高中数学联合竞赛四川省省一等奖，', 'images/test4.jpg', '家庭教育', null);
INSERT INTO `teacher` VALUES ('5', 'jack', '30', '男', '主讲经济。研究生就读于萨塞克斯大学（University of Sussex），主修国际金融，优秀硕士。曾在HSBC伦敦分行及中国建设银行任职。对英联邦', 'images/test5.jpg', '家庭教育', null);
INSERT INTO `teacher` VALUES ('6', '赖世雄', '45', '男', '毕业于985、211中央民族大学，具有丰富的托福考试经验，托福个人最高成绩114分', 'images/赖世雄.jpg', '家庭教育', null);
INSERT INTO `teacher` VALUES ('7', 'Steve', '34', '女', '能够根据不同学生的性格特点、知识基础、学习需求等作出个性化的教学规划', 'images/Steve.jpg', '语言', null);
INSERT INTO `teacher` VALUES ('8', 'mary', '22', '女', '教育背景：上海海事大学英语翻译专业本科。 学术功底：英语专八', 'images/test8.jpg', '心理学', null);
INSERT INTO `teacher` VALUES ('10', 'Tom', '22', '男', '毕业于北京大学物理系', 'images/test1.jpeg', '物理学', null);
INSERT INTO `teacher` VALUES ('11', 'lisa', '20', '女', 'testtest', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload\\yourimg.jpg', '管理学', null);
INSERT INTO `teacher` VALUES ('13', 'Andrew Shewbart', '22', '男', '一个优秀的老师', 'D:\\workspace\\.metadata\\.me_tcat85\\webapps\\HomeWork\\upload\\Andrew Shewbart.jpg', '物理学', null);

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
-- Table structure for `train_course`
-- ----------------------------
DROP TABLE IF EXISTS `train_course`;
CREATE TABLE `train_course` (
  `Cid` int(15) NOT NULL AUTO_INCREMENT,
  `Ctype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cname` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cimage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cnum` int(10) DEFAULT NULL,
  `Ctitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Csynopsis` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cprice` double(10,0) DEFAULT NULL,
  `Cteacher` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of train_course
-- ----------------------------
INSERT INTO `train_course` VALUES ('1', '人文科学', '趣味西方美术史', 'images/courseG.jpg', '15', '给大家的趣味西方美术史\r\n给大家的趣味西方美术史', '在妙趣横生中了解名画背后的故事', '39', '小顾');
INSERT INTO `train_course` VALUES ('2', '人文科学', '《你好！艺术》', 'images/courseN.jpeg', '15', '探索审美，认识艺术', '你好！艺术第一季', '89', '小叶老师');
INSERT INTO `train_course` VALUES ('4', '人文科学', '唐诗小学问', 'images/courseT.jpg', '30', '知道的唐诗，不知道的历史', '唐诗小学问', '138', '楚桥');
INSERT INTO `train_course` VALUES ('5', '人文科学', '换个姿势/看懂西方艺术史', 'images/courseX.jpg', '12', '百万艺术博主顾爷：趣解艺术史告别晦涩难懂', '带你破解画框背后，神秘的西方艺术史！', '99', '顾爷');
INSERT INTO `train_course` VALUES ('6', '人文科学', '红楼梦', 'images/courseH.jpg', '9', '《红楼梦》里的情商智慧', '其间的世情哲理，值得一遍遍阅读、体味', '12', '露十七');
INSERT INTO `train_course` VALUES ('7', '人文科学', '五千万千万', 'images/course3.jpg', '0', '最强大脑申一帆，教你用思维导图激活大脑', '让你的大脑威力倍增', '112', '申一帆');
INSERT INTO `train_course` VALUES ('8', '经济学', '用得上的商学课', 'images/courseY.jpg', '15', '老路：用得上的商学课', '吴晓波、钱小军联袂推荐', '99', '路骋');
INSERT INTO `train_course` VALUES ('9', '经济学', '学会钱生钱', 'images/courseXH.png', '13', '理财课', '告别死工资，让你的财富跑赢90%的人', '99', '简七');
INSERT INTO `train_course` VALUES ('11', '经济学', '区块链', 'images/courseQ.png', '15', '30分钟秒懂区块链', '什么是区块链？', '112', 'Mona');
INSERT INTO `train_course` VALUES ('13', '经济学', '信用卡的第二份收入', 'images/courseR.png', '11', '如何通过信用卡，获取工资外的第二份收入', '超值推荐，2000人在线学的理财课程', '112', '姬哲');
INSERT INTO `train_course` VALUES ('15', '经济学', '21本财富经典', 'images/courseD.png', '18', '21本财富经典：从投资小白到高财商', '13位财经精英陪你读完21本财商经典', '118', '土申');
INSERT INTO `train_course` VALUES ('17', '心理学', '每天1个心理学效应', 'images/courseRYR.jpg', '22', '每天1个心理学效应，21天升级人生', '简单入门心理学，让你轻松上手', '99', '张文静');
INSERT INTO `train_course` VALUES ('18', '心理学', '王牌读心师', 'images/courseWP.jpg', '10', '王牌读心师教你瞬间识人术，掌控人际交往\r\n“读心神探”教你用9大技术3秒看懂他人心', '“读心神探”教你用9大技术3秒看懂他人心', '99', '卢文建');
INSERT INTO `train_course` VALUES ('19', '心理学', '走出抑郁', 'images/courseZC.jpg', '20', '走出抑郁，学会自我疗愈', '结合医学与心理双重视角，解决核心困扰', '18', '彭旭');
INSERT INTO `train_course` VALUES ('20', '心理学', '阴阳心学', 'images/courseDYS.jpg', '15', '度阴山讲阳明心学', '度阴山讲阳明心学', '20', '度阴山');
INSERT INTO `train_course` VALUES ('21', '心理学', '看电影懂心理学', 'images/courseKDY.jpg', '20', '看电影懂心理学48讲', '让你远离情绪内耗，治愈内在自我！', '66', '柠杨');
INSERT INTO `train_course` VALUES ('22', '语言', '用得上的美语思维课', 'images/courseMY.jpg', '22', '用得上的美语思维课', '30堂课掌握与老外谈笑风生的神奇能力', '99', 'Andrew Shewbart');
INSERT INTO `train_course` VALUES ('23', '语言', '纯美式口语速成', 'images/courseLJC.jpg', '15', '华人英语教父赖世雄：纯美式口语速成课', '华人英语教父口语速成班', '98', '赖世雄');
INSERT INTO `train_course` VALUES ('24', '语言', '自然拼读发', 'images/courseZR.jpg', '10', '英语零基础自然拼读课程2018版全套课', '英语自然拼读/零基础入门必修课18年新版', '100', 'Steve老师');
INSERT INTO `train_course` VALUES ('25', '语言', '多国语言学习法', 'images/courseDG.png', '15', '零基础掌握多国语言学习，让外语飙起来', '普通人如何在6个月内学会一门外语？', '99', 'Vivian');
INSERT INTO `train_course` VALUES ('26', '语言', '英语学习方法论', 'images/courseLSX.jpg', '18', '华人英语教父赖世雄的英语学习方法论', '英语大师做你的贴身家教', '49', '赖世雄');
INSERT INTO `train_course` VALUES ('27', '家庭教育', '给孩子的绘画启蒙课', 'images/courseGHZ.jpg', '9', '给孩子的绘画启蒙课', '用艺术激发孩子的天赋潜能', '99', '裴俊飞');
INSERT INTO `train_course` VALUES ('28', '家庭教育', '专治孩子乱发脾气', 'images/courseLFPQ.jpg', '12', '专治孩子乱发脾气：21堂亲子情绪管理课', '21堂亲子情绪管理课', '49', '张永峰');
INSERT INTO `train_course` VALUES ('29', '家庭教育', '专治孩子手机上瘾', 'images/courseZZHZ.jpg', '11', '专治孩子手机上瘾，教你做不焦虑的父母', '拯救家有“网瘾”少年的焦心父母！', '79', '周梵');
INSERT INTO `train_course` VALUES ('30', '家庭教育', '做智慧父母，让孩子更优秀', 'images/courseZH.png', '15', '做智慧父母，让孩子更优秀', '做“智慧型家长”成为所有家庭共同的期盼', '69', '胡明瑜');
INSERT INTO `train_course` VALUES ('31', '家庭教育', '二孩教育', 'images/courseET.jpg', '8', '8节课教你搞定鸡飞狗跳的二孩生活', '爸妈们不仅要敢生，还要会养！', '29', '陈星彤');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Uid` int(11) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `attribute1` varchar(255) DEFAULT NULL,
  `attribute2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'Sk1234567', '19', null, 'Sk123456', '18286073040', '1432@qq.com', null, null);
INSERT INTO `user` VALUES ('3', null, '0', '男', 'Sk123456', '', '1432822294@qq.com', null, null);

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `Id` int(11) DEFAULT NULL,
  `Uid` int(11) NOT NULL,
  `Cid` int(11) NOT NULL,
  PRIMARY KEY (`Uid`,`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES (null, '2', '24');

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Cid` int(15) DEFAULT NULL,
  `Course_video` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vtitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '1', 'video/test2.mp4', '第1课', '入门教程');
INSERT INTO `video` VALUES ('2', '11', 'http://open.163.com/movie/2012/9/V/J/M8HEO0A8T_M8HEV1QVJ.html', '第1课', '入门教程');
INSERT INTO `video` VALUES ('3', '25', 'https://vip.open.163.com/courses/1642/26631?p=pc_search', '章节一  先导课', '课时1  普通人具备快速入门小语种的潜能 ');
INSERT INTO `video` VALUES ('4', '25', 'https://vip.open.163.com/courses/1642/36104?p=pc_search', '章节二  入门篇', '课时2   世界三大语言日常破冰话语get ');
INSERT INTO `video` VALUES ('48', '11', 'http://open.163.com/movie/2012/9/V/J/M8HEO0A8T_M8HEV1QVJ.html', '第2课', '入门教程');
INSERT INTO `video` VALUES ('49', '24', 'https://vip.open.163.com/courses/1069/13947?p=pc_search', '章节一  第一阶段：A-Z的读音及发音', '课时1   前言 ');
INSERT INTO `video` VALUES ('50', '24', 'https://vip.open.163.com/courses/1069/13952?p=pc_search', null, '课时2   Aa-Bb的读音以及单词中读音 ');
INSERT INTO `video` VALUES ('51', '24', 'https://vip.open.163.com/courses/1069/13948?p=pc_search', null, '课时3   自然拼读真人视频第1讲 Aa 试看');
