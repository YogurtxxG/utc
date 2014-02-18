/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.0.96-community-nt : Database - utc
*********************************************************************
Server version : 5.0.96-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `utc`;

USE `utc`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `app_dict` */

DROP TABLE IF EXISTS `app_dict`;

CREATE TABLE `app_dict` (
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(100) default NULL,
  `value` varchar(100) default NULL,
  `type` varchar(100) default NULL,
  `pinyin` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `app_dict` */

insert  into `app_dict`(`id`,`key`,`value`,`type`,`pinyin`) values (1,'article.state.normal','普通','article.state','putong'),(2,'article.state.recommand','推荐','article.state','tuijian'),(3,'article.state.top','置顶','article.state','zhiding'),(4,'ascii','ACSII码','regex','acsii'),(10,'boolean.false','否','boolean','fou'),(11,'boolean.true','是','boolean','shi'),(20,'chinese','中文','regex','zhengwen'),(24,'content.mode.more','多项','content.mode','duoxiang'),(25,'content.mode.none','空项','content.mode','kongxiang'),(26,'content.mode.one','单项','content.mode','danxiang'),(28,'decmal','浮点数','regex','fudianshu'),(29,'email','邮箱','regex','youxiang'),(39,'id','标识','regex','biaoshi'),(40,'idcard','身份证','regex','shenfenzheng'),(41,'integer','整数','regex','zhengshu'),(42,'letter','字母','regex','zimu'),(43,'loginId','登录标识','regex','denglubiaoshi'),(46,'node.condition.auth','权限','node.condition.model','qanxian'),(47,'node.condition.auth.department','组织机构','node.condition.auth','bumen'),(48,'node.condition.auth.role','角色','node.condition.auth','juese'),(49,'node.condition.auth.user','用户','node.condition.auth','yonghu'),(53,'notempty','非空','regex','feikong'),(54,'number','数字','regex','shuzi'),(55,'phone','手机电话','regex','shouji'),(56,'picture','图片','regex','tupian'),(57,'qq','QQ号','regex','qq'),(58,'rar','压缩文件','regex','yasuowenjian'),(59,'tel','座机电话','regex','zuoji'),(60,'url','URL','regex','url'),(61,'visible.false','隐藏','visible','yinchang'),(62,'visible.true','显示','visible','xianshi'),(63,'zipcode','邮编','regex','youbian'),(64,'只读','只读','node.state','zhidu'),(65,'必填','必填','node.state','bitian'),(66,'选填','选填','node.state','xuantian'),(67,'隐藏','隐藏','node.state','yincang'),(95,'女','女','gender','nv'),(96,'男','男','gender','nan'),(97,'是','是','easyboolean','shi'),(98,'否','否','easyboolean','fou'),(99,'message.state.false','未回复','message.state','weihuifu'),(100,'message.state.true','已回复','message.state','yihuifu');

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) default NULL,
  `parentId` varchar(100) default NULL,
  `sort` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('website','管理网站','',NULL,8),('website.content','管理目录','/app/website/content/show.jsp','website',14),('website.article','管理文章','/app/website/article/show.jsp','website',32),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57),('website.message','管理留言','/app/website/message/show.jsp','website',103),('website.door','管理文章','/app/website/admin/main.jsp?cid=door','website',104),('website.doorhtml','管理代码','/app/website/admin/main.jsp?cid=doorhtml','website',106),('utc','管理报销','',NULL,110),('utc.apply','报销申请','/app/utc/apply/show.jsp','utc',111),('utc.check','报销审核','/app/utc/check/show.jsp','utc',112),('utc.confirm','财务确认','/app/utc/confirm/show.jsp','utc',113),('utc.count','报销统计','/app/utc/count/show.jsp','utc',114);

/*Table structure for table `auth_re_role_resource` */

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` int(100) NOT NULL,
  `resourceId` varchar(100) character set gb2312 NOT NULL default '',
  PRIMARY KEY  (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_role_resource` */

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values (1,'auth'),(1,'auth.change.password'),(1,'auth.resource'),(1,'auth.role'),(1,'auth.user'),(1,'configuration'),(1,'configuration.dict'),(1,'utc'),(1,'utc.apply'),(1,'utc.check'),(1,'utc.confirm'),(1,'utc.count'),(5,'auth'),(5,'auth.change.password'),(5,'auth.resource'),(5,'auth.role'),(5,'auth.user'),(5,'configuration'),(5,'configuration.dict'),(5,'utc'),(5,'utc.apply'),(5,'utc.check'),(5,'utc.confirm'),(5,'utc.count');

/*Table structure for table `auth_re_user_resource` */

DROP TABLE IF EXISTS `auth_re_user_resource`;

CREATE TABLE `auth_re_user_resource` (
  `userId` varchar(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL,
  PRIMARY KEY  (`userId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_resource` */

insert  into `auth_re_user_resource`(`userId`,`resourceId`) values ('system','auth'),('system','auth.change.password'),('system','auth.resource'),('system','auth.role'),('system','auth.user'),('system','configuration'),('system','configuration.dict'),('system','utc'),('system','utc.apply'),('system','utc.check'),('system','utc.confirm'),('system','utc.count');

/*Table structure for table `auth_re_user_role` */

DROP TABLE IF EXISTS `auth_re_user_role`;

CREATE TABLE `auth_re_user_role` (
  `userId` varchar(100) character set gb2312 NOT NULL,
  `roleId` int(100) NOT NULL,
  PRIMARY KEY  (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_role` */

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin',1),('system',5);

/*Table structure for table `auth_roles` */

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `auth_roles` */

insert  into `auth_roles`(`id`,`name`,`description`) values (1,'管理员','拥有网站维护权限'),(5,'系统维护员','开发人员专用');

/*Table structure for table `auth_users` */

DROP TABLE IF EXISTS `auth_users`;

CREATE TABLE `auth_users` (
  `Id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `phone` varchar(100) default NULL,
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_users` */

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','lueSGJZetyySpUndWjMBEg==','',''),('system','开发维护员','lueSGJZetyySpUndWjMBEg==','','');

/*Table structure for table `web_article` */

DROP TABLE IF EXISTS `web_article`;

CREATE TABLE `web_article` (
  `id` int(100) NOT NULL auto_increment,
  `cid` varchar(100) default NULL,
  `title` varchar(200) default NULL,
  `text` varchar(20000) default NULL,
  `type` varchar(100) default NULL,
  `typeName` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `stateName` varchar(100) default NULL,
  `count` int(11) default '0',
  `createTime` datetime default NULL,
  `operater` varchar(100) default NULL,
  `operaterName` varchar(100) default NULL,
  `image` varchar(500) default NULL,
  `sort` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_article` */

/*Table structure for table `web_content` */

DROP TABLE IF EXISTS `web_content`;

CREATE TABLE `web_content` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) default NULL,
  `english` varchar(100) default NULL,
  `path` varchar(200) default NULL,
  `parentId` varchar(100) default NULL,
  `sort` int(11) NOT NULL auto_increment,
  `hasShow` varchar(100) default NULL,
  `hasShowName` varchar(100) default NULL,
  `mode` varchar(100) default 'content.mode.one',
  `modeName` varchar(100) default '单一',
  `text` text,
  PRIMARY KEY  (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;

/*Data for the table `web_content` */

insert  into `web_content`(`id`,`name`,`english`,`path`,`parentId`,`sort`,`hasShow`,`hasShowName`,`mode`,`modeName`,`text`) values ('doorhtml','管理代码','Dai Ma','',NULL,458,'visible.true','显示','content.mode.none','空项',NULL),('doorhtml.banner','广告位','Banner','','doorhtml',459,'visible.true','显示','content.mode.more','多项',''),('doorhtml.foot','页尾','Foot','','doorhtml',462,'visible.true','显示','content.mode.one','单项',NULL),('door.index','首页','Home','index.jsp','door',464,'visible.true','显示','content.mode.none','空项',NULL),('door.notice','协会公告','Notice','list.jsp','door',465,'visible.true','显示','content.mode.more','多项',NULL),('door.hot','行业热点','Hot','list.jsp','door',466,'visible.true','显示','content.mode.more','多项',NULL),('door.people','人物','people','list.jsp','door',467,'visible.true','显示','content.mode.more','多项',NULL),('door.zthd','专题活动','subject','list.jsp','door',468,'visible.true','显示','content.mode.more','多项',NULL),('door.vip','会员展示','VIP','list.jsp','door',469,'visible.true','显示','content.mode.more','多项',NULL),('door.download','下载中心','DownLoad','list.jsp','door',470,'visible.true','显示','content.mode.more','多项',NULL),('door.mmzs','木门知识','knowledge','list.jsp','door',471,'visible.true','显示','content.mode.more','多项',NULL),('door.qydt','企业动态','dynamic','list.jsp','door',472,'visible.true','显示','content.mode.more','多项',NULL),('door.zhxx','展会信息','exhibition','list.jsp','door',473,'visible.true','显示','content.mode.more','多项',NULL),('door.zsjm','招商加盟','Join','list.jsp','door',474,'visible.true','显示','content.mode.more','多项',NULL),('door.zjk','专家库','expert','list.jsp','door',475,'visible.true','显示','content.mode.more','多项',NULL),('door.gyjs','工艺技术','technology','list.jsp','door',476,'visible.true','显示','content.mode.more','多项',NULL),('door.qygq','企业供求','supply','list.jsp','door',477,'visible.true','显示','content.mode.more','多项',NULL),('door.xgqy','相关企业','relate','list.jsp','door',478,'visible.true','显示','content.mode.more','多项',NULL),('door.link','友情链接','link','list.jsp','door',479,'visible.true','显示','content.mode.more','多项',NULL);

/*Table structure for table `web_message` */

DROP TABLE IF EXISTS `web_message`;

CREATE TABLE `web_message` (
  `id` int(11) NOT NULL auto_increment,
  `cid` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `stateName` varchar(100) default NULL,
  `hasShow` varchar(100) default NULL,
  `hasShowName` varchar(100) default NULL,
  `sendTime` datetime default NULL,
  `sendText` varchar(1000) default NULL,
  `sendEmail` varchar(100) default NULL,
  `sendPhone` varchar(100) default NULL,
  `sendName` varchar(100) default NULL,
  `receiveTime` varchar(100) default NULL,
  `receiveText` varchar(1000) default NULL,
  `receiveOperater` varchar(100) default NULL,
  `receiveOperaterName` varchar(100) default NULL,
  `type` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_message` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
