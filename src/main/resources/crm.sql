/*
SQLyog Enterprise v12.5.1 (64 bit)
MySQL - 5.7.28-log : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `t_cus_dev_plan` */

DROP TABLE IF EXISTS `t_cus_dev_plan`;

CREATE TABLE `t_cus_dev_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_chance_id` int(11) DEFAULT NULL COMMENT '营销机会id',
  `plan_item` varchar(45) DEFAULT NULL COMMENT '计划',
  `plan_date` datetime DEFAULT NULL COMMENT '计划日期',
  `exe_affect` varchar(45) DEFAULT NULL COMMENT '执行效果',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL COMMENT '有效状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_cus_dev_plan` */

insert  into `t_cus_dev_plan`(`id`,`sale_chance_id`,`plan_item`,`plan_date`,`exe_affect`,`create_date`,`update_date`,`is_valid`) values 
(1,7,'计划一','2020-09-16 14:17:35','ok','2020-09-16 14:12:45','2020-09-16 15:17:15',1),
(2,7,'计划二','2020-09-16 14:17:35','ok','2020-09-16 14:17:41','2020-09-16 14:17:42',1),
(3,7,'计划三','2020-11-11 12:12:23','ok','2020-09-16 15:09:26','2020-09-16 15:18:47',1),
(4,7,'计划四','2020-11-11 12:25:31','ok','2020-09-16 15:24:19','2020-09-16 15:24:19',0),
(5,1,'计划四','2020-11-11 12:25:31','ok','2020-09-21 18:15:34','2020-09-21 18:15:34',1);

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户表',
  `khno` varchar(30) DEFAULT NULL COMMENT '客户编号',
  `name` varchar(20) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `cus_manager` varchar(20) DEFAULT NULL COMMENT '客户经理',
  `level` varchar(30) DEFAULT NULL COMMENT '客户级别',
  `myd` varchar(30) DEFAULT NULL COMMENT '客户满意度',
  `xyd` varchar(30) DEFAULT NULL COMMENT '客户信誉度',
  `address` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `web_site` varchar(30) DEFAULT NULL COMMENT '网址',
  `yyzzch` varchar(30) DEFAULT NULL COMMENT '营业执照注册号',
  `fr` varchar(10) DEFAULT NULL COMMENT '法人代表',
  `zczj` varchar(30) DEFAULT NULL COMMENT '注册资金',
  `nyye` varchar(30) DEFAULT NULL COMMENT '年营业额',
  `khyh` varchar(30) DEFAULT NULL COMMENT '开户银行',
  `khzh` varchar(30) DEFAULT NULL COMMENT '开户账户',
  `dsdjh` varchar(30) DEFAULT NULL COMMENT '地税登记号',
  `gsdjh` varchar(30) DEFAULT NULL COMMENT '国税登记号',
  `state` int(2) DEFAULT NULL COMMENT '流失状态',
  `is_valid` int(2) DEFAULT NULL COMMENT '有效状态',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer` */

insert  into `t_customer`(`id`,`khno`,`name`,`area`,`cus_manager`,`level`,`myd`,`xyd`,`address`,`post_code`,`phone`,`fax`,`web_site`,`yyzzch`,`fr`,`zczj`,`nyye`,`khyh`,`khzh`,`dsdjh`,`gsdjh`,`state`,`is_valid`,`create_date`,`update_date`) values 
(1,'n1','张1',NULL,'admin','战略合作伙伴',NULL,NULL,'江西省',NULL,'17752232323',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'2019-03-01 17:12:27','2020-09-19 17:12:30'),
(2,'KH_20200920004133','西菜市场',NULL,'网上','普通客户','满意','',NULL,NULL,'18556985656','','www.baidu.com','','张仨','',NULL,'','','','',0,0,'2019-01-20 00:41:34','2020-09-20 00:41:34'),
(3,'KH_20200920004808','档次',NULL,'菜单','普通客户','满意','',NULL,NULL,'18556985656','','www.baidu.com','','张速','100000000',NULL,'','','','',0,0,'2020-03-01 00:48:08','2020-09-20 20:02:56'),
(4,'KH_20200922163314','江西伊怀普道环保设备有限公司',NULL,'陆','','','',NULL,NULL,'17779104596','','','','陆和天','',NULL,'','','','',0,1,'2020-09-22 16:33:15','2020-09-22 16:33:15');

/*Table structure for table `t_customer_contact` */

DROP TABLE IF EXISTS `t_customer_contact`;

CREATE TABLE `t_customer_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户交流记录表',
  `cus_id` int(11) DEFAULT NULL,
  `contact_time` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL COMMENT '交流时间',
  `overview` varchar(40) DEFAULT NULL COMMENT '交流地址',
  `crate_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_contact` */

/*Table structure for table `t_customer_linkman` */

DROP TABLE IF EXISTS `t_customer_linkman`;

CREATE TABLE `t_customer_linkman` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户联系人表',
  `cus_id` int(11) DEFAULT NULL,
  `link_name` varchar(15) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `zhiwei` varchar(15) DEFAULT NULL,
  `office_phone` varchar(15) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_linkman` */

/*Table structure for table `t_customer_loss` */

DROP TABLE IF EXISTS `t_customer_loss`;

CREATE TABLE `t_customer_loss` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户流失表',
  `cus_no` varchar(20) DEFAULT NULL,
  `cus_name` varchar(40) DEFAULT NULL,
  `cus_manager` varchar(40) DEFAULT NULL,
  `last_order_time` date DEFAULT NULL,
  `confirm_loss_time` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `loss_reason` varchar(100) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_loss` */

insert  into `t_customer_loss`(`id`,`cus_no`,`cus_name`,`cus_manager`,`last_order_time`,`confirm_loss_time`,`state`,`loss_reason`,`is_valid`,`create_date`,`update_date`) values 
(1,'n1','张1','admin','2020-01-20','2020-09-21',0,'',1,'2020-09-20 18:49:34','2020-09-21 00:43:46'),
(2,'KH_20200920004133','档次','网上',NULL,NULL,1,NULL,1,NULL,NULL);

/*Table structure for table `t_customer_order` */

DROP TABLE IF EXISTS `t_customer_order`;

CREATE TABLE `t_customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) DEFAULT NULL,
  `order_no` varchar(40) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `address` varchar(41) DEFAULT NULL,
  `state` int(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_order` */

insert  into `t_customer_order`(`id`,`cus_id`,`order_no`,`order_date`,`address`,`state`,`create_date`,`update_date`,`is_valid`) values 
(1,2,'20200920','2020-09-20 10:55:21','江西省',0,'2020-01-01 10:55:36','2020-09-20 10:55:38',1),
(2,3,'2','2020-09-20 10:56:00','河南省',1,'2020-09-20 10:56:17','2020-09-20 10:56:15',1),
(3,3,'3','2019-11-01 14:46:33','广西省',0,'2020-09-20 14:46:55','2020-09-20 14:46:57',1),
(4,1,'4','2019-06-20 14:47:49','广西省',1,'2020-09-20 14:47:41','2020-09-20 14:47:44',1),
(5,1,'5','2019-07-20 14:48:56','广西省',1,'2020-09-20 14:49:13','2020-09-20 14:49:15',1),
(6,1,'6','2020-01-20 14:50:21','广西省',0,'2020-09-20 14:51:05','2020-09-20 14:51:06',1);

/*Table structure for table `t_customer_reprieve` */

DROP TABLE IF EXISTS `t_customer_reprieve`;

CREATE TABLE `t_customer_reprieve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户流失暂缓表',
  `loss_id` int(11) DEFAULT NULL,
  `measure` varchar(100) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_reprieve` */

insert  into `t_customer_reprieve`(`id`,`loss_id`,`measure`,`is_valid`,`create_date`,`update_date`) values 
(1,1,'电话联系',1,'2020-09-20 21:55:27','2020-09-21 00:04:07'),
(2,1,'请吃饭',0,'2020-09-21 00:03:51','2020-09-21 00:03:51'),
(3,1,'请吃饭',1,'2020-09-21 00:07:06','2020-09-21 00:07:06');

/*Table structure for table `t_customer_serve` */

DROP TABLE IF EXISTS `t_customer_serve`;

CREATE TABLE `t_customer_serve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户服务表',
  `serve_type` int(2) DEFAULT NULL COMMENT '服务类型',
  `over_view` varchar(500) DEFAULT NULL COMMENT '概要',
  `customer` varchar(45) DEFAULT NULL COMMENT '客户',
  `state` int(2) DEFAULT NULL COMMENT '服务状态',
  `service_request` varchar(30) DEFAULT NULL COMMENT '服务请求',
  `create_people` varchar(12) DEFAULT NULL COMMENT '服务创建人',
  `assigner` varchar(45) DEFAULT NULL COMMENT '分配人',
  `assign_time` datetime DEFAULT NULL COMMENT '分配时间',
  `service_proce` varchar(45) DEFAULT NULL COMMENT '服务处理',
  `service_proce_people` varchar(45) DEFAULT NULL COMMENT '服务处理人',
  `service_proce_time` datetime DEFAULT NULL COMMENT '处理时间',
  `service_proce_result` varchar(45) DEFAULT NULL COMMENT '处理结果',
  `myd` varchar(45) DEFAULT NULL COMMENT '满意度',
  `is_valid` int(2) DEFAULT NULL COMMENT '是否有效',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_serve` */

insert  into `t_customer_serve`(`id`,`serve_type`,`over_view`,`customer`,`state`,`service_request`,`create_people`,`assigner`,`assign_time`,`service_proce`,`service_proce_people`,`service_proce_time`,`service_proce_result`,`myd`,`is_valid`,`update_time`,`create_time`) values 
(1,6,'测试','张1',1,'','admin','1',NULL,'',NULL,'2020-09-21 20:35:32',NULL,NULL,1,'2020-09-21 20:35:32','2020-09-21 10:35:45'),
(2,7,'测试','西菜市场',5,'','网上','1','2020-09-21 22:08:16','csdcds','admin','2020-09-21 22:10:35','完成','✩✩✩',1,'2020-09-21 23:13:51','2020-09-21 10:35:46'),
(3,8,'测试','档次',1,'','菜单','1',NULL,'','','2020-09-21 22:05:46',NULL,NULL,1,'2020-09-21 22:05:46','2020-09-21 10:35:47'),
(4,6,'cdcdc','张1',2,'dcdc',NULL,'1','2020-09-21 22:08:20','',NULL,'2020-09-21 20:39:42',NULL,NULL,1,'2020-09-21 22:08:20','2020-09-21 13:31:37'),
(5,6,'闪电','张1',2,'闪电',NULL,'1','2020-09-21 21:04:59',NULL,NULL,NULL,NULL,NULL,1,'2020-09-21 21:04:59','2020-09-21 13:44:20'),
(6,6,'测试','张1',3,'测试',NULL,'1','2020-09-21 17:27:03','xxxxxxxxxxxxxxxxxxx','admin','2020-09-21 21:12:22',NULL,NULL,1,'2020-09-21 21:12:22','2020-09-21 13:48:30'),
(7,6,'车上档次','西菜市场',1,'曾多次',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-09-22 16:35:11','2020-09-22 16:35:11');

/*Table structure for table `t_datadic` */

DROP TABLE IF EXISTS `t_datadic`;

CREATE TABLE `t_datadic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_dic_name` varchar(21) DEFAULT NULL,
  `data_dic_value` varchar(21) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_datadic` */

insert  into `t_datadic`(`id`,`data_dic_name`,`data_dic_value`,`is_valid`,`create_date`,`update_time`) values 
(1,'客户等级','普通客户',1,NULL,NULL),
(2,'客户等级','重点开发客户',1,NULL,NULL),
(3,'客户等级','大客户',1,NULL,NULL),
(4,'客户等级','合作伙伴',1,NULL,NULL),
(5,'客户等级','战略伙伴',1,NULL,NULL),
(6,'服务类型','咨询',1,NULL,NULL),
(7,'服务类型','建议',1,NULL,NULL),
(8,'服务类型','投诉',1,NULL,NULL);

/*Table structure for table `t_module` */

DROP TABLE IF EXISTS `t_module`;

CREATE TABLE `t_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(45) DEFAULT NULL,
  `module_style` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_opt_value` varchar(45) DEFAULT NULL,
  `grade` int(4) DEFAULT NULL,
  `opt_value` varchar(45) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `t_module` */

insert  into `t_module`(`id`,`module_name`,`module_style`,`url`,`parent_id`,`parent_opt_value`,`grade`,`opt_value`,`orders`,`is_valid`,`create_date`,`update_date`) values 
(1,'营销管理',NULL,'#',0,'',0,'10',NULL,1,NULL,NULL),
(2,'营销机会管理',NULL,'sale_chance/index',1,NULL,1,'1010',NULL,1,NULL,NULL),
(3,'客户开发计划',NULL,'cus_dev_plan/index',1,NULL,1,'1020',NULL,1,NULL,NULL),
(4,'客户管理',NULL,'#',0,NULL,0,'20',NULL,1,NULL,NULL),
(5,'客户信息管理',NULL,'customer/index',4,NULL,1,'2010',NULL,1,NULL,NULL),
(6,'客户流失管理',NULL,'customer_loss/index',4,NULL,1,'2020',NULL,1,NULL,NULL),
(7,'服务管理',NULL,'#',0,NULL,0,'30',NULL,1,NULL,NULL),
(8,'服务创建',NULL,'customer_serve/index/1',7,NULL,1,'3010',NULL,1,NULL,NULL),
(9,'服务分配',NULL,'customer_serve/index/2',7,NULL,1,'3020',NULL,1,NULL,NULL),
(10,'服务处理',NULL,'customer_serve/index/3',7,NULL,1,'3030',NULL,1,NULL,NULL),
(11,'服务反馈',NULL,'customer_serve/index/4',7,NULL,1,'3040',NULL,1,NULL,NULL),
(12,'服务归档',NULL,'customer_serve/index/5',7,NULL,1,'3050',NULL,1,NULL,NULL),
(13,'统计报表',NULL,'#',0,NULL,0,'40',NULL,1,NULL,NULL),
(14,'客户贡献分析',NULL,'report/0',13,NULL,1,'4010',NULL,1,NULL,NULL),
(15,'客户构成分析',NULL,'report/1',13,NULL,1,'4020',NULL,1,NULL,NULL),
(16,'客户服务分析',NULL,'sale_chance/index',13,NULL,1,'4030',NULL,1,NULL,NULL),
(17,'客户流失分析',NULL,'report/3',13,NULL,1,'4040',NULL,1,NULL,NULL),
(18,'系统设置',NULL,'#',0,NULL,0,'50',NULL,1,NULL,NULL),
(19,'字典管理',NULL,'data_dic/index',18,NULL,1,'5010',NULL,1,NULL,NULL),
(20,'用户管理',NULL,'user/index',18,NULL,1,'5020',NULL,1,NULL,NULL),
(21,'角色管理',NULL,'role/index',18,NULL,1,'5030',NULL,1,NULL,NULL),
(22,'菜单管理',NULL,'module/index',18,NULL,1,'5040',NULL,1,NULL,NULL),
(23,'营销机会管理-添加',NULL,NULL,2,NULL,2,'101010',NULL,1,NULL,NULL),
(24,'营销机会管理-删除',NULL,NULL,2,NULL,2,'101020',NULL,1,NULL,NULL),
(25,'营销机会管理-查询',NULL,NULL,2,NULL,2,'101030',NULL,1,NULL,NULL),
(26,'营销机会管理-编辑',NULL,NULL,2,NULL,2,'101040',NULL,1,NULL,NULL),
(27,'客户开发计划-查询',NULL,NULL,3,NULL,2,'102010',NULL,1,NULL,NULL),
(28,'客户开发计划-详情(开发)',NULL,NULL,3,NULL,2,'102020',NULL,1,NULL,NULL),
(29,'用户管理-添加',NULL,NULL,20,NULL,2,'502010',NULL,1,NULL,NULL),
(30,'用户管理-删除',NULL,NULL,20,NULL,2,'502020',NULL,1,NULL,NULL),
(31,'用户管理-查询',NULL,NULL,20,NULL,2,'502030',NULL,1,NULL,NULL),
(32,'用户管理-编辑',NULL,NULL,20,NULL,2,'502040',NULL,1,NULL,NULL),
(33,'角色管理-添加',NULL,NULL,21,NULL,2,'503010',NULL,1,NULL,NULL),
(34,'角色管理-授权',NULL,NULL,21,NULL,2,'503020',NULL,1,NULL,NULL),
(35,'角色管理-查询',NULL,NULL,21,NULL,2,'503030',NULL,1,NULL,NULL),
(36,'角色管理-编辑',NULL,NULL,21,NULL,2,'503040',NULL,1,NULL,NULL),
(37,'角色管理-删除',NULL,NULL,21,NULL,2,'503050',NULL,1,NULL,NULL),
(38,'实验测试','',NULL,0,NULL,0,'60',NULL,1,NULL,NULL),
(39,'实验测试1','','test/index/3',38,NULL,1,'6010',NULL,0,NULL,NULL),
(41,'实验测试2','','test/index/1',38,NULL,1,'6020',NULL,1,NULL,NULL);

/*Table structure for table `t_order_details` */

DROP TABLE IF EXISTS `t_order_details`;

CREATE TABLE `t_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情表',
  `order_id` int(11) DEFAULT NULL,
  `goods_name` varchar(40) DEFAULT NULL,
  `goods_num` int(11) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sum` float DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_details` */

insert  into `t_order_details`(`id`,`order_id`,`goods_name`,`goods_num`,`unit`,`price`,`sum`,`is_valid`,`create_date`,`update_date`) values 
(1,1,'手机',1,'台',2000,2000,1,'2020-02-03 12:17:35','2020-09-20 12:17:39'),
(2,2,'手机',2,'台',1000,2000,1,'2020-09-20 15:02:38',NULL),
(3,3,'电脑',2,'台',2000,4000,1,'2020-09-20 15:02:40',NULL),
(4,2,'苹果',1,'吨',2000,2000,1,'2020-09-20 15:02:43',NULL),
(5,4,'香蕉',1,'吨',2000,2000,1,'2020-09-20 15:02:47',NULL),
(6,2,'花生',1,'吨',1000,1000,1,'2020-09-20 15:02:45',NULL),
(7,5,'蔬菜',1,'吨',20000,20000,1,'2020-09-20 15:02:51',NULL),
(8,2,'蛋糕',1,'吨',2000,200,1,'2020-09-20 15:02:54',NULL);

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL COMMENT '资源id',
  `acl_value` varchar(40) DEFAULT NULL COMMENT '权限码',
  `creat_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=872 DEFAULT CHARSET=utf8;

/*Data for the table `t_permission` */

insert  into `t_permission`(`id`,`role_id`,`module_id`,`acl_value`,`creat_date`,`update_date`) values 
(190,2,1,'10','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(191,2,2,'1010','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(192,2,3,'1020','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(193,2,4,'20','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(194,2,5,'2010','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(195,2,6,'2020','2020-09-18 11:56:52','2020-09-18 11:56:52'),
(210,3,4,'20','2020-09-18 11:57:12','2020-09-18 11:57:12'),
(211,3,5,'2010','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(212,3,6,'2020','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(213,3,7,'30','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(214,3,8,'3010','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(215,3,9,'3020','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(216,3,10,'3030','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(217,3,11,'3040','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(218,3,12,'3050','2020-09-18 11:57:13','2020-09-18 11:57:13'),
(224,4,13,'40','2020-09-18 11:57:23','2020-09-18 11:57:23'),
(225,4,14,'4010','2020-09-18 11:57:23','2020-09-18 11:57:23'),
(226,4,15,'4020','2020-09-18 11:57:23','2020-09-18 11:57:23'),
(227,4,16,'4030','2020-09-18 11:57:23','2020-09-18 11:57:23'),
(228,4,17,'4040','2020-09-18 11:57:23','2020-09-18 11:57:23'),
(234,7,13,'40','2020-09-18 12:18:38','2020-09-18 12:18:38'),
(235,7,17,'4040','2020-09-18 12:18:38','2020-09-18 12:18:38'),
(833,1,1,'10','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(834,1,2,'1010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(835,1,23,'101010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(836,1,24,'101020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(837,1,25,'101030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(838,1,26,'101040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(839,1,3,'1020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(840,1,27,'102010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(841,1,28,'102020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(842,1,4,'20','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(843,1,5,'2010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(844,1,6,'2020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(845,1,7,'30','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(846,1,8,'3010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(847,1,9,'3020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(848,1,10,'3030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(849,1,11,'3040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(850,1,12,'3050','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(851,1,13,'40','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(852,1,14,'4010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(853,1,15,'4020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(854,1,16,'4030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(855,1,17,'4040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(856,1,18,'50','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(857,1,19,'5010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(858,1,20,'5020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(859,1,29,'502010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(860,1,30,'502020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(861,1,31,'502030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(862,1,32,'502040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(863,1,21,'5030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(864,1,33,'503010','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(865,1,34,'503020','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(866,1,35,'503030','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(867,1,36,'503040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(868,1,37,'503050','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(869,1,22,'5040','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(870,1,38,'60','2020-09-20 01:14:17','2020-09-20 01:14:17'),
(871,1,41,'6020','2020-09-20 01:14:17','2020-09-20 01:14:17');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) DEFAULT NULL,
  `role_remark` varchar(15) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`role_remark`,`create_date`,`update_date`,`is_valid`) values 
(1,'系统管理员','系统管理员','2020-09-15 13:50:35','2020-09-15 13:50:38',1),
(2,'销售','销售','2020-09-15 13:50:52','2020-09-15 13:50:49',1),
(3,'客户经理','客户经理','2020-09-15 13:50:55','2020-09-15 13:50:57',1),
(4,'技术经理','研发','2020-09-15 13:51:02','2020-09-15 13:51:00',1),
(5,'人事','人事','2020-09-15 13:51:04','2020-09-15 13:51:06',1),
(6,'财务','财务方面','2020-09-17 14:58:12','2020-09-17 14:58:12',1),
(7,'其他','财务','2020-09-17 15:26:45','2020-09-17 15:26:45',1);

/*Table structure for table `t_sale_chance` */

DROP TABLE IF EXISTS `t_sale_chance`;

CREATE TABLE `t_sale_chance` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `chance_source` varchar(45) DEFAULT NULL COMMENT '机会来源',
  `customer_name` varchar(11) DEFAULT NULL COMMENT '客户名字',
  `cgjl` int(5) DEFAULT NULL COMMENT '成功几率',
  `overview` varchar(11) DEFAULT NULL COMMENT '概要',
  `link_man` varchar(11) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `description` varchar(45) DEFAULT NULL COMMENT '描述',
  `create_man` varchar(45) DEFAULT NULL COMMENT '创建人',
  `assign_man` varchar(45) DEFAULT NULL COMMENT '分配人',
  `assign_time` datetime DEFAULT NULL COMMENT '分配时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  `dev_result` int(2) DEFAULT NULL COMMENT '开发结果',
  `is_valid` int(2) DEFAULT NULL COMMENT '有效状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_chance` */

insert  into `t_sale_chance`(`id`,`chance_source`,`customer_name`,`cgjl`,`overview`,`link_man`,`link_phone`,`description`,`create_man`,`assign_man`,`assign_time`,`state`,`dev_result`,`is_valid`,`create_date`,`update_date`) values 
(1,'电话','李四',50,'测试','理士','15756356565','测试','zs','1',NULL,1,3,1,'2020-09-18 10:01:49','2020-09-16 15:50:49'),
(2,'广告','lee',50,'ds','zsd','13235663522','','张飒','2','2020-09-16 10:06:26',1,2,1,'2020-09-15 11:22:20','2020-09-16 10:06:26'),
(3,'广告','安市',50,'测试','zsdd','15756356565','','张飒','2',NULL,1,1,1,'2020-09-15 11:40:32','2020-09-16 10:14:23'),
(4,'广告','lee',50,'','dasa','15756356565','','张飒','4','2020-09-15 15:21:29',1,1,1,'2020-09-15 11:41:09','2020-09-15 15:21:29'),
(5,'广告','菜单',50,'出生地','注释','15756356565','','张飒','3','2020-09-15 15:22:27',1,3,1,'2020-09-15 13:41:30','2020-09-15 15:22:27'),
(6,'传单','大城市',50,'测试','苏打水','15756356565','','张飒','3',NULL,1,2,1,'2020-09-15 15:01:35','2020-09-15 15:23:01'),
(7,'传单','市场',50,'测试','ls','15756356565','','admin','2','2020-09-16 13:23:47',1,1,1,'2020-09-16 13:23:47','2020-09-16 13:23:47'),
(8,'广告','戴zz',50,'测试','zsd','15756356565','','admin','1','2020-09-18 15:47:39',1,1,1,'2020-09-18 15:47:39','2020-09-18 15:47:39'),
(9,'广告','ddd',50,'测试','zs','15756356565','','admin','1','2020-09-18 15:48:30',1,1,1,'2020-09-18 15:48:30','2020-09-18 15:48:30');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) DEFAULT NULL,
  `user_pwd` varchar(40) DEFAULT NULL,
  `true_name` varchar(15) DEFAULT NULL,
  `email` varchar(18) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `is_valid` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`user_name`,`user_pwd`,`true_name`,`email`,`phone`,`is_valid`,`create_date`,`update_date`) values 
(1,'admin','ICy5YqxZB1uWSwcVLSNLcA==','admin','222@qq.com','18556985656',1,'2020-09-09 08:55:51','2020-09-18 13:52:40'),
(2,'ls','ICy5YqxZB1uWSwcVLSNLcA==','李四','222@qq.com','18556985656',1,NULL,'2020-09-18 11:55:57'),
(3,'ww','ICy5YqxZB1uWSwcVLSNLcA==','王五','222@qq.com','18556985656',1,NULL,'2020-09-18 11:56:24'),
(4,'ss','ICy5YqxZB1uWSwcVLSNLcA==','四我是','222@qq.com','18556985656',1,NULL,'2020-09-18 12:19:08'),
(5,'se','ICy5YqxZB1uWSwcVLSNLcA==','(NUL搜索L)','222@qq.com','18556985656',1,NULL,'2020-09-16 23:26:34'),
(6,'ew','ICy5YqxZB1uWSwcVLSNLcA==','(NUL上档次L)','222@qq.com','18556985656',1,NULL,'2020-09-16 23:26:37'),
(7,'kk','ICy5YqxZB1uWSwcVLSNLcA==','可可','9822893@qq.com','15789567895',0,'2020-09-16 23:22:17','2020-09-16 23:24:47'),
(8,'gg','ICy5YqxZB1uWSwcVLSNLcA==','谷歌','336@qq.com','15789567895',0,'2020-09-16 23:25:58','2020-09-16 23:25:58'),
(9,'dcds','ICy5YqxZB1uWSwcVLSNLcA==','大时代','222222222@qq.com','15789567895',1,'2020-09-17 10:30:06','2020-09-17 10:30:06'),
(10,'sdf','ICy5YqxZB1uWSwcVLSNLcA==','水电费','222222222@qq.com','15789567895',1,'2020-09-17 11:00:54','2020-09-17 11:00:54'),
(11,'sdc','ICy5YqxZB1uWSwcVLSNLcA==','上档次','223336@qq.com','15789567895',1,'2020-09-17 11:05:39','2020-09-17 11:05:39'),
(12,'cdc','ICy5YqxZB1uWSwcVLSNLcA==','成都市','32269558@qq.com','15789567895',1,'2020-09-17 11:08:57','2020-09-17 11:09:42'),
(13,'lsd','ICy5YqxZB1uWSwcVLSNLcA==','老师的','222222222@qq.com','15789567895',1,'2020-09-17 11:11:26','2020-09-17 13:26:53'),
(14,'ff','ICy5YqxZB1uWSwcVLSNLcA==','方法','223336@qq.com','15789567895',1,'2020-09-17 11:32:20','2020-09-17 15:17:42');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`user_id`,`role_id`,`create_date`,`update_date`) values 
(6,12,4,'2020-09-17 11:08:58','2020-09-17 11:08:58'),
(9,13,5,'2020-09-17 13:26:53','2020-09-17 13:26:53'),
(13,14,1,'2020-09-17 15:17:42','2020-09-17 15:17:42'),
(14,14,5,'2020-09-17 15:17:42','2020-09-17 15:17:42'),
(22,2,2,'2020-09-18 11:55:57','2020-09-18 11:55:57'),
(23,3,3,'2020-09-18 11:56:25','2020-09-18 11:56:25'),
(24,4,7,'2020-09-18 12:19:08','2020-09-18 12:19:08'),
(25,1,6,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(26,1,1,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(27,1,2,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(28,1,3,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(29,1,4,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(30,1,5,'2020-09-18 13:52:40','2020-09-18 13:52:40'),
(31,1,7,'2020-09-18 13:52:40','2020-09-18 13:52:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
