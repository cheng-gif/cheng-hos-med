/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.28 : Database - hospitalmanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospitalmanager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hospitalmanager`;

/*Table structure for table `hos_addfess` */

DROP TABLE IF EXISTS `hos_addfess`;

CREATE TABLE `hos_addfess` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `addi_name` varchar(36) DEFAULT NULL COMMENT '附加费名称',
  `addi_status` bit(1) DEFAULT NULL COMMENT '状态',
  `createDate` date DEFAULT NULL,
  `cost` float DEFAULT NULL COMMENT '成本价',
  `amount` float DEFAULT NULL COMMENT '金额',
  `create_id` int(10) DEFAULT NULL,
  `addi_type` int(10) DEFAULT NULL COMMENT '处方类型',
  PRIMARY KEY (`id`),
  KEY `addi_type` (`addi_type`),
  CONSTRAINT `hos_addfess_ibfk_1` FOREIGN KEY (`addi_type`) REFERENCES `hos_prescri_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hos_addfess` */

insert  into `hos_addfess`(`id`,`addi_name`,`addi_status`,`createDate`,`cost`,`amount`,`create_id`,`addi_type`) values (1,'注射费','',NULL,3,6,2,NULL),(2,'材料费','',NULL,4,7,2,NULL);

/*Table structure for table `hos_advice` */

DROP TABLE IF EXISTS `hos_advice`;

CREATE TABLE `hos_advice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '医嘱编号',
  `content` varchar(200) DEFAULT NULL COMMENT '医嘱内容',
  `createDate` date DEFAULT NULL COMMENT '创建日期',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hos_advice` */

insert  into `hos_advice`(`id`,`content`,`createDate`,`create_id`) values (1,'忌熬夜忌饮酒','2020-04-13',2),(2,'低盐低塘饮食','2020-04-03',1),(3,'忌辛冷等食物','2012-12-12',1),(4,'忌受凉吹风','2015-10-12',2),(5,'多喝开水','2017-05-13',2);

/*Table structure for table `hos_department` */

DROP TABLE IF EXISTS `hos_department`;

CREATE TABLE `hos_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `name` varchar(36) DEFAULT NULL COMMENT '科室名称',
  `stauts` bit(1) DEFAULT NULL COMMENT '科室状态',
  `introdu` varchar(36) DEFAULT NULL COMMENT '科室简介',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(10) DEFAULT NULL COMMENT '创建人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_department` */

insert  into `hos_department`(`id`,`name`,`stauts`,`introdu`,`createDate`,`create_id`) values (1,'全科','',NULL,'2016-12-13',NULL),(2,'儿科','',NULL,'2018-05-22',NULL),(3,'骨科','',NULL,'2017-09-30',NULL);

/*Table structure for table `hos_diag_info` */

DROP TABLE IF EXISTS `hos_diag_info`;

CREATE TABLE `hos_diag_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL COMMENT '诊断内容',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hos_diag_info` */

insert  into `hos_diag_info`(`id`,`content`,`createDate`,`create_id`) values (1,'流行性出血热',NULL,1),(2,'急性气管炎',NULL,1),(3,'上呼吸道感染',NULL,2),(4,'咽炎',NULL,1),(5,'急性肠胃炎',NULL,1),(6,'月经不调',NULL,2),(7,'急性扁桃体炎',NULL,2),(8,'流行性乙肝脑炎',NULL,1),(9,'白喉',NULL,2),(10,'脑膜炎',NULL,1);

/*Table structure for table `hos_drug_cate` */

DROP TABLE IF EXISTS `hos_drug_cate`;

CREATE TABLE `hos_drug_cate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(36) DEFAULT NULL COMMENT '药品分类名称',
  `createDate` date DEFAULT NULL,
  `prescri_type` int(10) DEFAULT NULL COMMENT '处方分类',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `hos_drug_cate` */

insert  into `hos_drug_cate`(`id`,`cateName`,`createDate`,`prescri_type`,`create_id`) values (0,'全部分类',NULL,NULL,NULL),(1,'中草药','2020-04-13',2,1),(2,'西成药','2020-04-08',1,NULL),(3,'西药',NULL,1,NULL),(4,'清热类',NULL,2,NULL),(5,'注射类',NULL,1,NULL),(6,'常用药品',NULL,1,NULL),(7,'感冒药类',NULL,1,NULL),(8,'外用药',NULL,2,NULL),(9,'中药颗粒',NULL,2,NULL);

/*Table structure for table `hos_drug_dosage` */

DROP TABLE IF EXISTS `hos_drug_dosage`;

CREATE TABLE `hos_drug_dosage` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '剂型编号',
  `name` varchar(36) DEFAULT NULL COMMENT '剂型名称',
  `createDate` date DEFAULT NULL COMMENT '日期',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hos_drug_dosage` */

insert  into `hos_drug_dosage`(`id`,`name`,`createDate`,`create_id`) values (1,'溶剂',NULL,NULL),(2,'颗粒','2020-04-01',NULL),(3,'丸剂','2020-04-01',NULL),(4,'胶囊','2020-04-10',NULL),(5,'片剂','2019-01-01',NULL),(6,'栓剂','2019-01-02',NULL),(7,'口服液','2019-03-03',NULL),(8,'注射剂','2019-04-04',NULL),(9,'粉剂','2019-05-05',NULL),(10,'散剂','2018-12-12',NULL);

/*Table structure for table `hos_drug_information` */

DROP TABLE IF EXISTS `hos_drug_information`;

CREATE TABLE `hos_drug_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '药品编号',
  `bar_code` varchar(36) DEFAULT NULL COMMENT '药品条形码',
  `common_name` varchar(36) DEFAULT NULL COMMENT '药品通用名',
  `pinyin` varchar(200) DEFAULT NULL COMMENT '拼音码',
  `status` bit(1) DEFAULT NULL COMMENT '药品状态',
  `standard` varchar(36) DEFAULT NULL COMMENT '药品规格',
  `drug_cate` varchar(10) DEFAULT NULL COMMENT '收费类别',
  `purch_price` float DEFAULT NULL COMMENT '采购价',
  `sell_price` float DEFAULT NULL COMMENT '售药价',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  `oct_drug` bit(1) DEFAULT NULL COMMENT 'OTC药品',
  `approval_number` varchar(50) DEFAULT NULL COMMENT '批准文号',
  `basic_coef` float DEFAULT NULL COMMENT '基本系数',
  `dose_coef` float DEFAULT NULL COMMENT '剂量系数',
  `allow_split` bit(1) DEFAULT NULL COMMENT '允许拆零',
  `single_usage` float DEFAULT NULL COMMENT '单词用量',
  `frequency` varchar(200) DEFAULT NULL COMMENT '频度',
  `day` int(11) DEFAULT NULL COMMENT '天数',
  `total` float DEFAULT NULL COMMENT '总量',
  `inven_high` float DEFAULT NULL COMMENT '库存上限',
  `inven_down` float DEFAULT NULL COMMENT '库存下线',
  `cargo_pull` float DEFAULT NULL COMMENT '货拉号',
  `early_warn` double DEFAULT NULL COMMENT '有效期预警',
  `explanation` varchar(200) DEFAULT NULL COMMENT '说明',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_id` int(10) DEFAULT NULL,
  `cate_id` int(10) DEFAULT NULL COMMENT '药品分类',
  `dosage_id` int(10) DEFAULT NULL COMMENT '剂型',
  `invoice_id` int(10) DEFAULT NULL COMMENT '发票项目',
  `fact_id` int(10) DEFAULT NULL COMMENT '生产厂家',
  `pack_id` int(10) DEFAULT NULL COMMENT '包装单位',
  `basic_id` int(10) DEFAULT NULL COMMENT '基本单位',
  `dosage_num_id` int(10) DEFAULT NULL COMMENT '剂量单位',
  `usage_id` int(10) DEFAULT NULL COMMENT '药品用法',
  `number` varchar(36) DEFAULT NULL COMMENT '药品编码',
  PRIMARY KEY (`id`),
  KEY `dosage_id` (`dosage_id`),
  KEY `usage_id` (`usage_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `fact_id` (`fact_id`),
  KEY `pack_id` (`pack_id`),
  KEY `basic_id` (`basic_id`),
  KEY `dosage_num_id` (`dosage_num_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `hos_drug_information_ibfk_10` FOREIGN KEY (`cate_id`) REFERENCES `hos_drug_cate` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_2` FOREIGN KEY (`dosage_id`) REFERENCES `hos_drug_dosage` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_3` FOREIGN KEY (`usage_id`) REFERENCES `hos_drug_usage` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `hos_invoice_item` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_6` FOREIGN KEY (`fact_id`) REFERENCES `hos_factory` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_7` FOREIGN KEY (`pack_id`) REFERENCES `hos_pack_util` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_8` FOREIGN KEY (`basic_id`) REFERENCES `hos_pack_util` (`id`),
  CONSTRAINT `hos_drug_information_ibfk_9` FOREIGN KEY (`dosage_num_id`) REFERENCES `hos_pack_util` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hos_drug_information` */

insert  into `hos_drug_information`(`id`,`bar_code`,`common_name`,`pinyin`,`status`,`standard`,`drug_cate`,`purch_price`,`sell_price`,`createDate`,`oct_drug`,`approval_number`,`basic_coef`,`dose_coef`,`allow_split`,`single_usage`,`frequency`,`day`,`total`,`inven_high`,`inven_down`,`cargo_pull`,`early_warn`,`explanation`,`remark`,`create_id`,`cate_id`,`dosage_id`,`invoice_id`,`fact_id`,`pack_id`,`basic_id`,`dosage_num_id`,`usage_id`,`number`) values (1,'111111','消炎药','xyy','\0','6g*11袋/盒','现金',2.5,4,NULL,'','12111111',1,1,'',1,'一天一次',1,100,100,50,10086,30,'孕妇别用',NULL,NULL,2,8,3,1,2,2,10,2,'10001'),(2,'1000002','替硝唑氯化钠注射液','txclhnzsy','','6g*11袋/盒','扫码',1.2,2,NULL,'','15231233',1,1,'',1,'一天一次',1,106,100,50,10086,30,'孕妇别用',NULL,NULL,7,1,3,2,2,2,3,1,'10002'),(3,'100003','阿胶(洋化)','ej','','12g','现金',4.5,6,NULL,'','15236545',1,1,'',1,'一天三次',2,208,200,100,10010,40,'心脏病患者别用',NULL,NULL,1,2,2,3,2,8,8,1,'10003'),(4,'100004','安息香','axx','','17g','现金',6.8,8.4,NULL,'','15241236',1,1,'',2,'两天一次',2,1,300,150,15203,35,'高血压别用',NULL,NULL,1,9,1,4,3,1,1,8,'10004'),(5,'100005','咳咳胶囊','kkjn','','18g','现金',10,15,NULL,'','15236524',1,1,'',2,'一天一次',2,201,250,150,15236,20,'阳痿别用',NULL,NULL,7,2,1,1,2,1,1,1,'10005');

/*Table structure for table `hos_drug_usage` */

DROP TABLE IF EXISTS `hos_drug_usage`;

CREATE TABLE `hos_drug_usage` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用法编号',
  `name` varchar(36) DEFAULT NULL COMMENT '用法名称',
  `createDate` date DEFAULT NULL COMMENT '日期',
  `prescri_type` int(10) DEFAULT NULL COMMENT '处方类型',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hos_drug_usage` */

insert  into `hos_drug_usage`(`id`,`name`,`createDate`,`prescri_type`,`create_id`) values (1,'口服',NULL,1,NULL),(2,'注射',NULL,2,NULL),(3,'外用',NULL,1,NULL),(4,'湿敷',NULL,2,NULL),(5,'煎服',NULL,1,NULL),(6,'温水吞服',NULL,1,NULL),(7,'静脉点滴',NULL,1,NULL),(8,'雾化',NULL,2,NULL),(9,'皮试',NULL,1,NULL),(10,'冲服',NULL,2,NULL);

/*Table structure for table `hos_factory` */

DROP TABLE IF EXISTS `hos_factory`;

CREATE TABLE `hos_factory` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '厂家编号',
  `productName` varchar(36) DEFAULT NULL COMMENT '厂家名称',
  `createDate` date DEFAULT NULL COMMENT '日期',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hos_factory` */

insert  into `hos_factory`(`id`,`productName`,`createDate`,`create_id`) values (1,'上海医药集团(有限)公司','2020-04-13',1),(2,'山东罗欣药业股份有限公司','2020-04-13',2),(3,'昆明制药集团','2016-05-16',1),(4,'武汉五景药业','2018-10-12',2);

/*Table structure for table `hos_invoice_item` */

DROP TABLE IF EXISTS `hos_invoice_item`;

CREATE TABLE `hos_invoice_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '发票项目',
  `name` varchar(36) DEFAULT NULL COMMENT '剂型名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_invoice_item` */

insert  into `hos_invoice_item`(`id`,`name`,`createDate`,`create_id`) values (1,'诊疗费','2020-04-01',NULL),(2,'检查费','2020-04-02',NULL),(3,'西药费','2020-04-05',NULL);

/*Table structure for table `hos_item_cate` */

DROP TABLE IF EXISTS `hos_item_cate`;

CREATE TABLE `hos_item_cate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(32) DEFAULT NULL COMMENT '项目分类名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hos_item_cate` */

insert  into `hos_item_cate`(`id`,`cateName`,`createDate`,`create_id`) values (1,'检查费',NULL,NULL),(2,'检验费',NULL,NULL),(3,'针灸费',NULL,NULL),(4,'治疗费',NULL,NULL),(5,'手术费',NULL,NULL);

/*Table structure for table `hos_item_examine` */

DROP TABLE IF EXISTS `hos_item_examine`;

CREATE TABLE `hos_item_examine` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) DEFAULT NULL COMMENT '项目名称',
  `cost` float DEFAULT NULL COMMENT '成本价',
  `price` float DEFAULT NULL COMMENT '零售价',
  `status` bit(1) DEFAULT NULL COMMENT '项目状态',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  `other_util` varchar(200) DEFAULT NULL COMMENT '其他单位',
  `other_cate` varchar(200) DEFAULT NULL COMMENT '其他分类',
  `other_invoice` varchar(200) DEFAULT NULL COMMENT '其他发票项目',
  `part` varchar(36) DEFAULT NULL COMMENT '部位',
  `discount` bit(1) DEFAULT NULL COMMENT '允许折扣',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_id` int(10) DEFAULT NULL,
  `cate_id` int(10) DEFAULT NULL COMMENT '项目分类',
  `util_id` int(10) DEFAULT NULL COMMENT '单位',
  `invoice_id` int(10) DEFAULT NULL COMMENT '发票项目',
  `number` varchar(36) DEFAULT NULL COMMENT '编号',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音名',
  PRIMARY KEY (`id`),
  KEY `util_id` (`util_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `hos_item_examine_ibfk_1` FOREIGN KEY (`util_id`) REFERENCES `hos_item_util` (`id`),
  CONSTRAINT `hos_item_examine_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `hos_invoice_item` (`id`),
  CONSTRAINT `hos_item_examine_ibfk_3` FOREIGN KEY (`cate_id`) REFERENCES `hos_item_cate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_item_examine` */

insert  into `hos_item_examine`(`id`,`name`,`cost`,`price`,`status`,`createDate`,`other_util`,`other_cate`,`other_invoice`,`part`,`discount`,`remark`,`create_id`,`cate_id`,`util_id`,`invoice_id`,`number`,`pinyin`) values (1,'煎药费',13,15,'','2019-11-11',NULL,NULL,NULL,'叼','',NULL,2,1,1,1,'100001','jyf'),(2,'局部推拿',15,20,'','2018-12-12',NULL,NULL,NULL,'身体','',NULL,2,4,1,1,'100002','jbtn'),(3,'脱敏',10,20,'','2017-10-12',NULL,NULL,NULL,'鸡儿','',NULL,1,4,4,1,'100003','tm');

/*Table structure for table `hos_item_util` */

DROP TABLE IF EXISTS `hos_item_util`;

CREATE TABLE `hos_item_util` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) DEFAULT NULL COMMENT '单位名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `hos_item_util` */

insert  into `hos_item_util`(`id`,`name`,`createDate`,`create_id`) values (1,'次',NULL,NULL),(2,'项',NULL,NULL),(3,'盒',NULL,NULL),(4,'支',NULL,NULL),(5,'片',NULL,NULL),(6,'张',NULL,NULL),(7,'袋',NULL,NULL),(8,'套',NULL,NULL);

/*Table structure for table `hos_member_cate` */

DROP TABLE IF EXISTS `hos_member_cate`;

CREATE TABLE `hos_member_cate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(36) DEFAULT NULL COMMENT '会员名称',
  `createDate` date DEFAULT NULL,
  `discount` float DEFAULT NULL COMMENT '折扣',
  `low_integral` float DEFAULT NULL COMMENT '最低积分',
  `need_integral` float DEFAULT NULL COMMENT '升级所需积分',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `level` varchar(36) DEFAULT NULL COMMENT '等级',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hos_member_cate` */

insert  into `hos_member_cate`(`id`,`cate_name`,`createDate`,`discount`,`low_integral`,`need_integral`,`status`,`level`,`remark`,`create_id`) values (1,'普通会员',NULL,0.98,100,1000,'','vip1',NULL,NULL),(2,'中级会员',NULL,0.95,300,3000,'','vip2',NULL,NULL);

/*Table structure for table `hos_pack_util` */

DROP TABLE IF EXISTS `hos_pack_util`;

CREATE TABLE `hos_pack_util` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '单位编号',
  `unitName` varchar(36) DEFAULT NULL COMMENT '包装单位名称',
  `createDate` date DEFAULT NULL COMMENT '日期',
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hos_pack_util` */

insert  into `hos_pack_util`(`id`,`unitName`,`createDate`,`create_id`) values (1,'包',NULL,NULL),(2,'袋',NULL,NULL),(3,'盒',NULL,NULL),(4,'支',NULL,NULL),(5,'片',NULL,NULL),(6,'颗',NULL,NULL),(7,'丸',NULL,NULL),(8,'两',NULL,NULL),(9,'板',NULL,NULL),(10,'克',NULL,NULL);

/*Table structure for table `hos_patien_edu` */

DROP TABLE IF EXISTS `hos_patien_edu`;

CREATE TABLE `hos_patien_edu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `edu_name` varchar(36) DEFAULT NULL COMMENT '学历名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `hos_patien_edu` */

insert  into `hos_patien_edu`(`id`,`edu_name`,`createDate`,`create_id`) values (1,'初中以下',NULL,2),(2,'高中',NULL,NULL),(3,'大专',NULL,NULL),(4,'本科',NULL,NULL),(5,'硕士及以上',NULL,NULL),(6,'未说明',NULL,NULL);

/*Table structure for table `hos_patien_info` */

DROP TABLE IF EXISTS `hos_patien_info`;

CREATE TABLE `hos_patien_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) DEFAULT NULL COMMENT '患者姓名',
  `card_no` varchar(36) DEFAULT NULL COMMENT '患者卡号',
  `sex` bit(1) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(36) DEFAULT NULL COMMENT '联系方式',
  `id_card` varchar(36) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(36) DEFAULT NULL COMMENT '地址',
  `add_details` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `password` varchar(36) DEFAULT NULL COMMENT '密码',
  `job_unit` varchar(36) DEFAULT NULL COMMENT '工作单位',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `sourc_id` int(10) DEFAULT NULL COMMENT '患者来源',
  `edu_id` int(10) DEFAULT NULL COMMENT '患者学历',
  `occ_id` int(10) DEFAULT NULL COMMENT '患者职业',
  `member_id` int(10) DEFAULT NULL COMMENT '会员',
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourc_id` (`sourc_id`),
  KEY `edu_id` (`edu_id`),
  KEY `occ_id` (`occ_id`),
  CONSTRAINT `hos_patien_info_ibfk_1` FOREIGN KEY (`sourc_id`) REFERENCES `hos_patien_sourc` (`id`),
  CONSTRAINT `hos_patien_info_ibfk_2` FOREIGN KEY (`edu_id`) REFERENCES `hos_patien_edu` (`id`),
  CONSTRAINT `hos_patien_info_ibfk_3` FOREIGN KEY (`occ_id`) REFERENCES `hos_patien_occ` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hos_patien_info` */

insert  into `hos_patien_info`(`id`,`name`,`card_no`,`sex`,`age`,`birthday`,`phone`,`id_card`,`address`,`add_details`,`password`,`job_unit`,`remark`,`sourc_id`,`edu_id`,`occ_id`,`member_id`,`email`) values (1,'金柱','100130','',30,'1999-02-13','15232154111','430623199912121412','岳阳','岳阳千亩湖','123','腾讯',NULL,3,1,1,1,'610191902@qq.com'),(2,'付康','10086','\0',50,'1995-02-13','15231251245','430623199508152315','长沙','火车站','123','破烂地',NULL,2,1,6,2,'610191902@qq.com');

/*Table structure for table `hos_patien_occ` */

DROP TABLE IF EXISTS `hos_patien_occ`;

CREATE TABLE `hos_patien_occ` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `professName` varchar(36) DEFAULT NULL COMMENT '职业名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `hos_patien_occ` */

insert  into `hos_patien_occ`(`id`,`professName`,`createDate`,`create_id`) values (1,'工人',NULL,2),(2,'公务员',NULL,NULL),(3,'医生',NULL,NULL),(4,'教师',NULL,NULL),(5,'互联网从业者',NULL,NULL),(6,'未说明',NULL,NULL);

/*Table structure for table `hos_patien_sourc` */

DROP TABLE IF EXISTS `hos_patien_sourc`;

CREATE TABLE `hos_patien_sourc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(36) DEFAULT NULL COMMENT '患者来源名称',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_patien_sourc` */

insert  into `hos_patien_sourc`(`id`,`sourceName`,`createDate`,`create_id`) values (1,'别人介绍',NULL,NULL),(2,'广告',NULL,NULL),(3,'自来',NULL,NULL);

/*Table structure for table `hos_pre_template` */

DROP TABLE IF EXISTS `hos_pre_template`;

CREATE TABLE `hos_pre_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tempName` varchar(36) DEFAULT NULL COMMENT '模板名称',
  `diagnosis` varchar(200) DEFAULT NULL COMMENT '诊断',
  `premiss` varchar(3) DEFAULT NULL COMMENT '模板权限',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(10) DEFAULT NULL,
  `prescri_type` int(10) DEFAULT NULL COMMENT '处方类型',
  `number` varchar(36) DEFAULT NULL COMMENT '模板编号',
  `remarks` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_pre_template` */

insert  into `hos_pre_template`(`id`,`tempName`,`diagnosis`,`premiss`,`createDate`,`create_id`,`prescri_type`,`number`,`remarks`) values (1,'金柱病历','月经不调','1','2020-04-13',2,1,'MZ00001','通用'),(2,'处方模板2','头疼','2','2020-04-17',1,2,'RZ00006','通用'),(3,'处方模板3','腹部积水','2','2019-12-12',1,2,'RZ00008','通用');

/*Table structure for table `hos_prescri_type` */

DROP TABLE IF EXISTS `hos_prescri_type`;

CREATE TABLE `hos_prescri_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(36) DEFAULT NULL COMMENT '处方类型',
  `createDate` date DEFAULT NULL,
  `create_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hos_prescri_type` */

insert  into `hos_prescri_type`(`id`,`typeName`,`createDate`,`create_id`) values (1,'西/成药','2015-12-12',NULL),(2,'中药','2011-08-19',NULL),(3,'检查项目','2016-12-13',NULL);

/*Table structure for table `hos_role` */

DROP TABLE IF EXISTS `hos_role`;

CREATE TABLE `hos_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `name` varchar(36) DEFAULT NULL COMMENT '角色名称',
  `introdu` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  `status` bit(1) DEFAULT NULL COMMENT '角色状态',
  `create_id` int(10) DEFAULT NULL,
  `number` varchar(36) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hos_role` */

insert  into `hos_role`(`id`,`name`,`introdu`,`createDate`,`status`,`create_id`,`number`) values (1,'超级管理','通用','2020-04-13','',1,'04'),(2,'医生',NULL,'2016-11-12','',2,'03'),(3,'护士',NULL,'2019-11-12','',1,'02'),(4,'财务',NULL,'2018-10-15','',2,'01');

/*Table structure for table `hos_temp_info` */

DROP TABLE IF EXISTS `hos_temp_info`;

CREATE TABLE `hos_temp_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tempId` int(10) DEFAULT NULL COMMENT '模板id',
  `drugInfoId` int(10) DEFAULT NULL COMMENT '药品id',
  PRIMARY KEY (`id`),
  KEY `tempId` (`tempId`),
  KEY `drugInfoId` (`drugInfoId`),
  CONSTRAINT `hos_temp_info_ibfk_1` FOREIGN KEY (`tempId`) REFERENCES `hos_pre_template` (`id`),
  CONSTRAINT `hos_temp_info_ibfk_2` FOREIGN KEY (`drugInfoId`) REFERENCES `hos_drug_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hos_temp_info` */

insert  into `hos_temp_info`(`id`,`tempId`,`drugInfoId`) values (1,1,1),(2,1,2),(3,2,3),(4,3,4),(5,3,5);

/*Table structure for table `hos_temp_item` */

DROP TABLE IF EXISTS `hos_temp_item`;

CREATE TABLE `hos_temp_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `itemId` int(10) DEFAULT NULL COMMENT '检查项目id',
  `tempId` int(10) DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`id`),
  KEY `tempId` (`tempId`),
  KEY `itemId` (`itemId`),
  CONSTRAINT `hos_temp_item_ibfk_1` FOREIGN KEY (`tempId`) REFERENCES `hos_pre_template` (`id`),
  CONSTRAINT `hos_temp_item_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `hos_item_examine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `hos_temp_item` */

insert  into `hos_temp_item`(`id`,`itemId`,`tempId`) values (1,3,2);

/*Table structure for table `hos_user` */

DROP TABLE IF EXISTS `hos_user`;

CREATE TABLE `hos_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(36) DEFAULT NULL COMMENT '员工姓名',
  `age` int(11) DEFAULT NULL COMMENT '员工年龄',
  `sex` bit(1) DEFAULT NULL COMMENT '性别',
  `phone` varchar(36) DEFAULT NULL COMMENT '联系方式',
  `email` varchar(36) DEFAULT NULL COMMENT '电子邮箱',
  `id_card` varchar(36) DEFAULT NULL COMMENT '身份证件',
  `position` varchar(36) DEFAULT NULL COMMENT '职位',
  `address` varchar(36) DEFAULT NULL COMMENT '地址',
  `add_details` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dep_id` int(10) DEFAULT NULL COMMENT '所属科室',
  `number` int(10) DEFAULT NULL COMMENT '员工工号',
  PRIMARY KEY (`id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `hos_user_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `hos_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hos_user` */

insert  into `hos_user`(`id`,`name`,`age`,`sex`,`phone`,`email`,`id_card`,`position`,`address`,`add_details`,`password`,`dep_id`,`number`) values (1,'王冕',33,'','15245698542','12345@qq.com','430623195411245136','科长','岳阳','岳阳市千亩湖','123',1,1030),(2,'林鹤',28,'\0','15245698520','521314@qq.com','421081196552301142','护士长','长沙','长沙肛泰医院','123',2,1029),(3,'李珍',50,'','15236521234','52364@qq.com','430623195202520125','普通职员','香港','香港外科医院','123',2,1028),(4,'付康',60,'','15214253652','12345@qq.com','430623195221312521','普通职员','岳阳','八字门','123',3,1027);

/*Table structure for table `hos_user_role` */

DROP TABLE IF EXISTS `hos_user_role`;

CREATE TABLE `hos_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户编号',
  `rid` int(10) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `hos_user_role_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `hos_user` (`id`),
  CONSTRAINT `hos_user_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `hos_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hos_user_role` */

insert  into `hos_user_role`(`id`,`uid`,`rid`) values (1,1,2),(2,2,3);

/*Table structure for table `med_men_check` */

DROP TABLE IF EXISTS `med_men_check`;

CREATE TABLE `med_men_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) DEFAULT NULL COMMENT '检查项目配置',
  `quantity` varchar(200) DEFAULT NULL COMMENT '数量',
  `type_id` int(10) DEFAULT NULL COMMENT '药品用法类型',
  `amount` double DEFAULT NULL COMMENT '金额',
  `doc_main_id` int(10) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `total` float DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`),
  KEY `doc_main_id` (`doc_main_id`),
  KEY `item_id` (`item_id`),
  KEY `med_men_check_ibfk_1` (`type_id`),
  CONSTRAINT `med_men_check_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `hos_item_cate` (`id`),
  CONSTRAINT `med_men_check_ibfk_2` FOREIGN KEY (`doc_main_id`) REFERENCES `newl_diag` (`id`),
  CONSTRAINT `med_men_check_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `hos_item_examine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `med_men_check` */

insert  into `med_men_check`(`id`,`item_id`,`quantity`,`type_id`,`amount`,`doc_main_id`,`remark`,`total`) values (1,1,'2',1,188,2,NULL,NULL);

/*Table structure for table `med_men_east` */

DROP TABLE IF EXISTS `med_men_east`;

CREATE TABLE `med_men_east` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '中药处方明细',
  `drug_id` int(10) DEFAULT NULL COMMENT '药品信息名称',
  `single_usage` varchar(36) DEFAULT NULL COMMENT '单次用量',
  `usage_id` int(10) DEFAULT NULL COMMENT '药品用法',
  `frequency` varchar(200) DEFAULT NULL COMMENT '频度',
  `day` varchar(10) DEFAULT NULL COMMENT '天数',
  `total` double DEFAULT NULL COMMENT '总量',
  `price` double DEFAULT NULL COMMENT '单价',
  `doc_main_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usage_id` (`usage_id`),
  KEY `drug_id` (`drug_id`),
  KEY `doc_main_id` (`doc_main_id`),
  CONSTRAINT `med_men_east_ibfk_1` FOREIGN KEY (`usage_id`) REFERENCES `hos_drug_usage` (`id`),
  CONSTRAINT `med_men_east_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `hos_drug_information` (`id`),
  CONSTRAINT `med_men_east_ibfk_3` FOREIGN KEY (`doc_main_id`) REFERENCES `newl_diag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `med_men_east` */

insert  into `med_men_east`(`id`,`drug_id`,`single_usage`,`usage_id`,`frequency`,`day`,`total`,`price`,`doc_main_id`) values (2,NULL,'1.0',1,'一天三次','2',208,0,5),(20,NULL,'1.0',NULL,'一天三次','2',208,0,34),(21,NULL,'1.0',1,'一天三次','2',208,0,35),(22,NULL,'2.0',8,'两天一次','2',1,0,35),(23,NULL,'1.0',NULL,'一天三次','2',208,0,36),(24,NULL,'1.0',1,'一天三次','2',208,0,37),(25,NULL,'2.0',8,'两天一次','2',1,0,37);

/*Table structure for table `med_men_western` */

DROP TABLE IF EXISTS `med_men_western`;

CREATE TABLE `med_men_western` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '西药处方明细',
  `drug_id` int(10) DEFAULT NULL COMMENT '药品信息名称',
  `single_usage` double DEFAULT NULL COMMENT '单次用量',
  `usage_id` int(10) DEFAULT NULL COMMENT '药品用法用法',
  `frequency` varchar(200) DEFAULT NULL COMMENT '频度',
  `day` varchar(10) DEFAULT NULL COMMENT '天数',
  `total` double DEFAULT NULL COMMENT '总量',
  `price` double DEFAULT NULL COMMENT '单价',
  `doc_main_id` int(10) DEFAULT NULL COMMENT '新开诊断编号',
  PRIMARY KEY (`id`),
  KEY `usage_id` (`usage_id`),
  KEY `drug_id` (`drug_id`),
  KEY `doc_main_id` (`doc_main_id`),
  CONSTRAINT `med_men_western_ibfk_1` FOREIGN KEY (`usage_id`) REFERENCES `hos_drug_usage` (`id`),
  CONSTRAINT `med_men_western_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `hos_drug_information` (`id`),
  CONSTRAINT `med_men_western_ibfk_3` FOREIGN KEY (`doc_main_id`) REFERENCES `newl_diag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `med_men_western` */

insert  into `med_men_western`(`id`,`drug_id`,`single_usage`,`usage_id`,`frequency`,`day`,`total`,`price`,`doc_main_id`) values (1,1,1,1,'一天一次','1',1,6,1),(4,NULL,1,2,'一天一次','1',100,0,5),(30,NULL,1,NULL,'一天一次','1',100,0,34),(31,NULL,1,NULL,'一天一次','1',106,0,34),(32,NULL,1,2,'一天一次','1',100,0,35),(33,NULL,1,NULL,'一天一次','1',100,0,36),(34,NULL,1,NULL,'一天一次','1',106,0,36),(35,NULL,1,2,'一天一次','1',100,0,37);

/*Table structure for table `newl_diag` */

DROP TABLE IF EXISTS `newl_diag`;

CREATE TABLE `newl_diag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consultation_type` varchar(32) DEFAULT NULL COMMENT '接诊类型',
  `other_diag` varchar(200) DEFAULT NULL COMMENT '其他诊断信息',
  `other_med` varchar(200) DEFAULT NULL COMMENT '其他医嘱信息',
  `patient_id` int(10) DEFAULT NULL COMMENT '患者',
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `newl_diag_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `hos_patien_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `newl_diag` */

insert  into `newl_diag`(`id`,`consultation_type`,`other_diag`,`other_med`,`patient_id`) values (1,'初诊',NULL,NULL,1),(2,'复诊','艾滋','少嫖娼',1),(5,'复诊',NULL,NULL,1),(34,'复诊',NULL,NULL,1),(35,'复诊',NULL,NULL,2),(36,'复诊',NULL,NULL,1),(37,'复诊',NULL,NULL,2);

/*Table structure for table `newl_diag_list` */

DROP TABLE IF EXISTS `newl_diag_list`;

CREATE TABLE `newl_diag_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '诊断信息关联表',
  `diag_id` int(10) DEFAULT NULL,
  `newdiag_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diag_id` (`diag_id`),
  KEY `newdiag_id` (`newdiag_id`),
  CONSTRAINT `newl_diag_list_ibfk_1` FOREIGN KEY (`diag_id`) REFERENCES `hos_diag_info` (`id`),
  CONSTRAINT `newl_diag_list_ibfk_2` FOREIGN KEY (`newdiag_id`) REFERENCES `newl_diag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `newl_diag_list` */

insert  into `newl_diag_list`(`id`,`diag_id`,`newdiag_id`) values (1,6,2),(5,1,5),(6,2,5),(7,3,5),(44,9,34),(45,1,35),(46,4,36),(47,5,36),(48,6,36),(49,1,37),(50,2,37);

/*Table structure for table `newl_diag_medlist` */

DROP TABLE IF EXISTS `newl_diag_medlist`;

CREATE TABLE `newl_diag_medlist` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '医嘱信息关联表',
  `advice_id` int(10) DEFAULT NULL,
  `newdiag_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advice_id` (`advice_id`),
  KEY `newdiag_id` (`newdiag_id`),
  CONSTRAINT `newl_diag_medlist_ibfk_1` FOREIGN KEY (`advice_id`) REFERENCES `hos_advice` (`id`),
  CONSTRAINT `newl_diag_medlist_ibfk_2` FOREIGN KEY (`newdiag_id`) REFERENCES `newl_diag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `newl_diag_medlist` */

insert  into `newl_diag_medlist`(`id`,`advice_id`,`newdiag_id`) values (1,1,2),(11,1,5),(12,2,5),(13,3,5),(48,1,34),(49,1,35),(50,1,36),(51,2,36),(52,3,36),(53,1,37),(54,2,37);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
