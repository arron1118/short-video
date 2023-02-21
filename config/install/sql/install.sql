-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: short_video
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sv_carousel`
--

DROP TABLE IF EXISTS `sv_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID {select} (1:首页, 2:服务, 3:案例, 4:分享, 5:联系我们)',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片 {image}',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `content` text COMMENT '文字说明',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用, 1:启用)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='轮播图列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_carousel`
--

LOCK TABLES `sv_carousel` WRITE;
/*!40000 ALTER TABLE `sv_carousel` DISABLE KEYS */;
INSERT INTO `sv_carousel` VALUES (1,1,'http://shortvideo.local.com/upload/20230202/0e7e9bdd402aacaa428835ad5b972096.jpeg','#','',0,0,1675756311,1675757951,NULL),(2,1,'http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','#','',0,0,1675757079,1675757951,NULL);
/*!40000 ALTER TABLE `sv_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_cases`
--

DROP TABLE IF EXISTS `sv_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_cases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cases_cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID {select}',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '封面 {image}',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '内容',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用, 1:启用)',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `cases_cate_id` (`cases_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='案例列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_cases`
--

LOCK TABLES `sv_cases` WRITE;
/*!40000 ALTER TABLE `sv_cases` DISABLE KEYS */;
INSERT INTO `sv_cases` VALUES (1,1,'测试标题','http://shortvideo.local.com/upload/20230111/1823f459388b4c86cb46fab142e9de53.png','测试关键词','','&lt;p&gt;&lt;img alt=&quot;好样的&quot; src=&quot;http://shortvideo.local.com/upload/20230111/66bf9a16e872a34c7338e2fe0debf1a8.png&quot; style=&quot;height:538px; width:762px&quot; /&gt;&lt;/p&gt;\n\n&lt;p&gt;来呀来呀&lt;/p&gt;\n',0,1,0,1673429463,1673493098,1673493098),(2,1,'测试标题2','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg','','','&lt;p&gt;我不要复制的，我要copy的&lt;/p&gt;\n',0,1,0,1673493085,1673493108,1673493108),(3,1,'测试标题','http://shortvideo.local.com/upload/20230111/66bf9a16e872a34c7338e2fe0debf1a8.png','','','&lt;p&gt;我不要复制的，我要copy的&lt;/p&gt;\n',0,1,0,1673493152,1673493152,NULL),(4,1,'测试标题2','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg','','','&lt;p&gt;测试内容2&lt;/p&gt;\n',0,1,0,1673514364,1673514556,NULL),(5,1,'测试标题3','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg','','','&lt;p&gt;测试内容3&lt;/p&gt;\n',0,1,0,1673514456,1673514456,NULL),(6,4,'测试分类2标题1','http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','','身份证二要素','&lt;p&gt;测试分类2内容1&lt;/p&gt;\n',0,1,0,1673600611,1675322839,NULL);
/*!40000 ALTER TABLE `sv_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_cases_cate`
--

DROP TABLE IF EXISTS `sv_cases_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_cases_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(255) NOT NULL COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {switch} (0:禁用, 1:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='案例分类列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_cases_cate`
--

LOCK TABLES `sv_cases_cate` WRITE;
/*!40000 ALTER TABLE `sv_cases_cate` DISABLE KEYS */;
INSERT INTO `sv_cases_cate` VALUES (1,0,'测试分类',0,1,'',1673425726,1673428486,NULL),(2,1,'测试子分类1',0,1,'',1673427484,1673428068,1673428068),(3,1,'测试子分类',0,1,'',1673428088,1673428378,1673428378),(4,0,'测试分类2',0,1,'',1673600568,1673600568,NULL),(5,1,'测试子分类',0,1,'',1675063896,1675063896,NULL);
/*!40000 ALTER TABLE `sv_cases_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_cooperate_customers`
--

DROP TABLE IF EXISTS `sv_cooperate_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_cooperate_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '客户名称',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'LOGO {image}',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {switch} (0:禁用, 1:启用)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合作客户列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_cooperate_customers`
--

LOCK TABLES `sv_cooperate_customers` WRITE;
/*!40000 ALTER TABLE `sv_cooperate_customers` DISABLE KEYS */;
INSERT INTO `sv_cooperate_customers` VALUES (1,'汇邦','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico','#',0,1,1673493842,1673494761,1673494761),(2,'汇邦','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico','#',0,1,1673494779,1673494784,1673494784),(3,'harley-davidso','http://shortvideo.local.com/upload/20230112/87cf3b9874d1ffc414c214275eeda566.png','#',0,1,1673508977,1673508977,NULL),(4,'inscope','http://shortvideo.local.com/upload/20230112/ecb21506b9db62123c94085cbbb88b92.png','#',0,1,1673508996,1673508996,NULL),(5,'surprise','http://shortvideo.local.com/upload/20230112/92c937dbee206a75f997469a73fc6ddb.png','#',0,1,1673509015,1673509015,NULL),(6,'白云集团','http://shortvideo.local.com/upload/20230112/75f495819a51136da32d4f836397b074.png','#',0,1,1673509034,1673509034,NULL),(7,'北大','http://shortvideo.local.com/upload/20230112/3a82923ff49d3ef925d906f09c17710c.png','#',0,1,1673509052,1673509052,NULL),(8,'北京卡酷传媒有限公司','http://shortvideo.local.com/upload/20230112/2762da6c1e03d9e71b2d9b435d094c79.png','#',0,1,1673509077,1673509077,NULL),(9,'东方雨虹','http://shortvideo.local.com/upload/20230112/f53bb960e6bb5fd73b35ce677d9935e5.png','#',0,1,1673509093,1673509093,NULL),(10,'动力源','http://shortvideo.local.com/upload/20230112/bde8e272402af1cb3a1bc5775ec0aa1d.png','#',0,1,1673509108,1673509108,NULL),(11,'多维联合集团','http://shortvideo.local.com/upload/20230112/092a01377eaa62dca9957b5c338f7796.png','#',0,1,1673509124,1673509124,NULL),(12,'华意通教育','http://shortvideo.local.com/upload/20230112/d5120987d431b1d4da970ad413e745d6.png','#',0,1,1673509145,1673509145,NULL),(13,'启迪控股','http://shortvideo.local.com/upload/20230112/d0b530f044adc2fb35562c5ef44a00ee.png','#',0,1,1673509167,1673509167,NULL),(14,'清华同方','http://shortvideo.local.com/upload/20230112/5b976ef303b80af0ab2e20476c27c203.png','#',0,1,1673509250,1673509391,NULL),(15,'山钢集团','http://shortvideo.local.com/upload/20230112/31df230494858b623568b5604be88165.png','#',0,1,1673509277,1673509277,NULL),(16,'特思迪','http://shortvideo.local.com/upload/20230112/9318c109c3b5e6c36638a6297dea8440.png','#',0,1,1673509294,1673509294,NULL),(17,'天津股权交易所','http://shortvideo.local.com/upload/20230112/5e5495c823e9e2c9f9bd632c37b01132.png','#',0,1,1673509314,1673509314,NULL),(18,'小笨智能','http://shortvideo.local.com/upload/20230112/fa479e490b67f90fb162e8c944a7ab1e.png','#',0,1,1673509337,1673509337,NULL),(19,'雪迪龙','http://shortvideo.local.com/upload/20230112/8a49fb01de4951ad9a8d8d758ef6fdac.png','#',0,1,1673509423,1673509423,NULL),(20,'永达理','http://shortvideo.local.com/upload/20230112/b3735b94d9d1966c174e8d8e798ae0d8.png','#',0,1,1673509443,1673509443,NULL),(21,'浙江大学','http://shortvideo.local.com/upload/20230112/54416997591e8445fd873a51e876a5d0.png','#',0,1,1673509458,1673509458,NULL),(22,'中电科安','http://shortvideo.local.com/upload/20230112/e87fe2bdadfb21f8bf922ad567cb6421.png','#',0,1,1673509472,1673509472,NULL),(23,'中国恒天','http://shortvideo.local.com/upload/20230112/f133abd5efc5ca7f17e4c67ceda82528.png','#',0,1,1673509493,1673509493,NULL),(24,'中国交通建设','http://shortvideo.local.com/upload/20230112/83ce4871c2b8ed8295ac0020b69b840e.png','#',0,1,1673509515,1673509515,NULL),(25,'中视广经','http://shortvideo.local.com/upload/20230112/6e5a623bef30620007831aabd6e8bc07.png','#',0,1,1673509538,1673509538,NULL),(26,'中兴能集团','http://shortvideo.local.com/upload/20230112/3865122ef94b70aad48c4254842cee59.png','#',99,1,1673509552,1673513347,NULL),(27,'测试','http://shortvideo.local.com/upload/20230111/66bf9a16e872a34c7338e2fe0debf1a8.png','#',0,1,1673513459,1673513459,NULL),(28,'测试2','http://shortvideo.local.com/upload/20230112/54416997591e8445fd873a51e876a5d0.png','#',0,1,1673513494,1673513494,NULL);
/*!40000 ALTER TABLE `sv_cooperate_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_mall_cate`
--

DROP TABLE IF EXISTS `sv_mall_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_mall_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_mall_cate`
--

LOCK TABLES `sv_mall_cate` WRITE;
/*!40000 ALTER TABLE `sv_mall_cate` DISABLE KEYS */;
INSERT INTO `sv_mall_cate` VALUES (9,'手机','http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg',0,1,'',1589440437,1589440437,NULL);
/*!40000 ALTER TABLE `sv_mall_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_mall_goods`
--

DROP TABLE IF EXISTS `sv_mall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_mall_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品logo',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品图片 以 | 做分割符号',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品描述',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣价',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `virtual_sales` int(11) DEFAULT '0' COMMENT '虚拟销量',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `total_stock` int(11) DEFAULT '0' COMMENT '总库存',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cate_id` (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_mall_goods`
--

LOCK TABLES `sv_mall_goods` WRITE;
/*!40000 ALTER TABLE `sv_mall_goods` DISABLE KEYS */;
INSERT INTO `sv_mall_goods` VALUES (8,10,'落地-风扇','http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg','http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg','<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n',599.00,368.00,0,594,0,0,675,1,'',1589454309,1589567016,NULL),(9,9,'电脑','http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg','http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg','<p>477</p>\n',0.00,0.00,0,0,115,320,0,1,'',1589465215,1589476345,NULL);
/*!40000 ALTER TABLE `sv_mall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_share`
--

DROP TABLE IF EXISTS `sv_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_share` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `share_cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID {select}',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '封面 {image}',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '内容',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用, 1:启用)',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `share_cate_id` (`share_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分享列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_share`
--

LOCK TABLES `sv_share` WRITE;
/*!40000 ALTER TABLE `sv_share` DISABLE KEYS */;
INSERT INTO `sv_share` VALUES (1,1,'分享标题1','http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','身份证二要素','身份证二要素','&lt;p&gt;分钟健康你妈&lt;/p&gt;\n',0,1,0,1675320086,1675320086,NULL),(2,2,'分享子标题1','http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','分享子标题1','分享子标题1','&lt;p&gt;分享子标题1&lt;/p&gt;\n',0,1,0,1675320271,1675320271,NULL);
/*!40000 ALTER TABLE `sv_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_share_cate`
--

DROP TABLE IF EXISTS `sv_share_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_share_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(255) NOT NULL COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {switch} (0:禁用, 1:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分享分类列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_share_cate`
--

LOCK TABLES `sv_share_cate` WRITE;
/*!40000 ALTER TABLE `sv_share_cate` DISABLE KEYS */;
INSERT INTO `sv_share_cate` VALUES (1,0,'分享分类1',0,1,'',1675320000,1675320000,NULL),(2,1,'分享分类子分类1',0,1,'',1675320017,1675320017,NULL);
/*!40000 ALTER TABLE `sv_share_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_shot_cate`
--

DROP TABLE IF EXISTS `sv_shot_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_shot_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(255) NOT NULL COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {switch} (0:禁用, 1:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='拍摄分类列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_shot_cate`
--

LOCK TABLES `sv_shot_cate` WRITE;
/*!40000 ALTER TABLE `sv_shot_cate` DISABLE KEYS */;
INSERT INTO `sv_shot_cate` VALUES (1,0,'测试分类',0,1,'',1675063443,1675063443,NULL),(2,1,'测试子分类',0,1,'',1675063739,1675063739,NULL);
/*!40000 ALTER TABLE `sv_shot_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_shot_tips`
--

DROP TABLE IF EXISTS `sv_shot_tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_shot_tips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shot_cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID {select}',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '封面 {image}',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '内容',
  `sort` int(11) DEFAULT '0' COMMENT '排序 {sort}',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用, 1:启用)',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `shot_cate_id` (`shot_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='拍摄知识列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_shot_tips`
--

LOCK TABLES `sv_shot_tips` WRITE;
/*!40000 ALTER TABLE `sv_shot_tips` DISABLE KEYS */;
INSERT INTO `sv_shot_tips` VALUES (1,0,'拍摄知识1','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg','','','&lt;p&gt;拍摄知识1&lt;/p&gt;\n',0,1,0,1673515552,1673515552,NULL),(2,1,'拍摄知识2','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg','','','&lt;p&gt;拍摄知识2&lt;/p&gt;\n',0,1,0,1673515586,1675305900,NULL),(3,0,'拍摄知识3','http://shortvideo.local.com/upload/20230111/66bf9a16e872a34c7338e2fe0debf1a8.png','','','&lt;p&gt;拍摄知识3&lt;/p&gt;\n',0,1,0,1673515613,1673515613,NULL),(4,0,'测试拍摄4','','','','&lt;p&gt;测试拍摄4&lt;/p&gt;\n',0,1,0,1673516461,1673575063,NULL);
/*!40000 ALTER TABLE `sv_shot_tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_admin`
--

DROP TABLE IF EXISTS `sv_system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_admin`
--

LOCK TABLES `sv_system_admin` WRITE;
/*!40000 ALTER TABLE `sv_system_admin` DISABLE KEYS */;
INSERT INTO `sv_system_admin` VALUES (1,NULL,'/static/admin/images/head.jpg','admin','ed696eb5bba1f7460585cc6975e6cf9bf24903dd','admin','admin',33,0,1,1589454169,1675904621,NULL);
/*!40000 ALTER TABLE `sv_system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_auth`
--

DROP TABLE IF EXISTS `sv_system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_auth`
--

LOCK TABLES `sv_system_auth` WRITE;
/*!40000 ALTER TABLE `sv_system_auth` DISABLE KEYS */;
INSERT INTO `sv_system_auth` VALUES (1,'管理员',1,1,'测试管理员',1588921753,1589614331,NULL),(6,'游客权限',0,1,'',1588227513,1589591751,1589591751);
/*!40000 ALTER TABLE `sv_system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_auth_node`
--

DROP TABLE IF EXISTS `sv_system_auth_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_auth_node`
--

LOCK TABLES `sv_system_auth_node` WRITE;
/*!40000 ALTER TABLE `sv_system_auth_node` DISABLE KEYS */;
INSERT INTO `sv_system_auth_node` VALUES (1,6,1),(2,6,2),(3,6,9),(4,6,12),(5,6,18),(6,6,19),(7,6,21),(8,6,22),(9,6,29),(10,6,30),(11,6,38),(12,6,39),(13,6,45),(14,6,46),(15,6,52),(16,6,53);
/*!40000 ALTER TABLE `sv_system_auth_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_config`
--

DROP TABLE IF EXISTS `sv_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '变量值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `group` (`group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_config`
--

LOCK TABLES `sv_system_config` WRITE;
/*!40000 ALTER TABLE `sv_system_config` DISABLE KEYS */;
INSERT INTO `sv_system_config` VALUES (41,'alisms_access_key_id','sms','填你的','阿里大于公钥',0,NULL,NULL),(42,'alisms_access_key_secret','sms','填你的','阿里大鱼私钥',0,NULL,NULL),(55,'upload_type','upload','local','当前上传方式 （local,alioss,qnoss,txoss）',0,NULL,NULL),(56,'upload_allow_ext','upload','doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg','允许上传的文件类型',0,NULL,NULL),(57,'upload_allow_size','upload','1024000','允许上传的大小',0,NULL,NULL),(58,'upload_allow_mime','upload','image/gif,image/jpeg,video/x-msvideo,text/plain,image/png','允许上传的文件mime',0,NULL,NULL),(59,'upload_allow_type','upload','local,alioss,qnoss,txcos','可用的上传文件方式',0,NULL,NULL),(60,'alioss_access_key_id','upload','填你的','阿里云oss公钥',0,NULL,NULL),(61,'alioss_access_key_secret','upload','填你的','阿里云oss私钥',0,NULL,NULL),(62,'alioss_endpoint','upload','填你的','阿里云oss数据中心',0,NULL,NULL),(63,'alioss_bucket','upload','填你的','阿里云oss空间名称',0,NULL,NULL),(64,'alioss_domain','upload','填你的','阿里云oss访问域名',0,NULL,NULL),(65,'logo_title','site','易点咨询','LOGO标题',0,NULL,NULL),(66,'logo_image','site','http://shortvideo.local.com/upload/20230112/7d89c090375fba2a78926f3c1f6cf2a2.png','logo图片',0,NULL,NULL),(68,'site_name','site','易点咨询','站点名称',0,NULL,NULL),(69,'site_ico','site','http://shortvideo.local.com/upload/20230112/f133abd5efc5ca7f17e4c67ceda82528.png','浏览器图标',0,NULL,NULL),(70,'site_copyright','site','汇邦工作室','版权信息',0,NULL,NULL),(71,'site_beian','site','填你的','备案信息',0,NULL,NULL),(72,'site_version','site','2.0.0','版本信息',0,NULL,NULL),(75,'sms_type','sms','alisms','短信类型',0,NULL,NULL),(76,'miniapp_appid','wechat','填你的','小程序公钥',0,NULL,NULL),(77,'miniapp_appsecret','wechat','填你的','小程序私钥',0,NULL,NULL),(78,'web_appid','wechat','填你的','公众号公钥',0,NULL,NULL),(79,'web_appsecret','wechat','填你的','公众号私钥',0,NULL,NULL),(80,'txcos_secret_id','upload','填你的','腾讯云cos密钥',0,NULL,NULL),(81,'txcos_secret_key','upload','填你的','腾讯云cos私钥',0,NULL,NULL),(82,'txcos_region','upload','填你的','存储桶地域',0,NULL,NULL),(83,'tecos_bucket','upload','填你的','存储桶名称',0,NULL,NULL),(84,'qnoss_access_key','upload','填你的','访问密钥',0,NULL,NULL),(85,'qnoss_secret_key','upload','填你的','安全密钥',0,NULL,NULL),(86,'qnoss_bucket','upload','填你的','存储空间',0,NULL,NULL),(87,'qnoss_domain','upload','填你的','访问域名',0,NULL,NULL),(90,'about_img','site','http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','关于我们图片封面',0,NULL,NULL),(91,'about_content','site','&lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于我们&lt;/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;/p&gt;\n\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;/p&gt;\n','关于我们内容',0,NULL,NULL),(92,'contact_title','site','素未谋面，却能心照不宣88','联系我们标题',0,NULL,NULL),(93,'contact_img','site','http://shortvideo.local.com/upload/20230202/0e7e9bdd402aacaa428835ad5b972096.jpeg','联系我们图片背景',0,NULL,NULL),(94,'contact_company','site','深圳市易点市场研究咨询有限公司','联系企业名称',0,NULL,NULL),(95,'contact_address','site','深圳市宝安区民生一路18号5栋二层','联系地址',0,NULL,NULL),(96,'contact_service_tel','site','400-111-1111','服务热线',0,NULL,NULL),(97,'contact_service_tel1','site','010-68703788','联系电话1',0,NULL,NULL),(98,'contact_service_tel2','site','010-68703788','联系电话2',0,NULL,NULL),(99,'contact_email','site','384138166@qq.com','邮箱',0,NULL,NULL),(100,'home_logo_image','site','http://shortvideo.local.com/upload/20230112/3865122ef94b70aad48c4254842cee59.png','首页LOGO图标',0,NULL,NULL),(101,'html_content','site','          &lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于{:sysconfig(\'site\', \'site_name\')}&lt;/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;/p&gt;\n\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;/p&gt;\n        ','模板内容',0,NULL,NULL);
/*!40000 ALTER TABLE `sv_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_log_202301`
--

DROP TABLE IF EXISTS `sv_system_log_202301`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_log_202301` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8 COMMENT='后台操作日志表 - 202301';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_log_202301`
--

LOCK TABLES `sv_system_log_202301` WRITE;
/*!40000 ALTER TABLE `sv_system_log_202301` DISABLE KEYS */;
INSERT INTO `sv_system_log_202301` VALUES (630,NULL,'/admin/login/index.html','post','系统日志','{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"nekl\",\"keep_login\":\"0\"}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673336963),(631,NULL,'/admin/login/index.html','post','系统日志','{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"dary\",\"keep_login\":\"0\"}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673336973),(632,NULL,'/admin/login/index.html','post','系统日志','{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ai5q\",\"keep_login\":\"0\"}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673337060),(633,1,'/admin/system.menu/delete?id=249','post','系统日志','{\"id\":\"249\"}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673337074),(634,1,'/admin/system.uploadfile/delete','post','系统日志','{\"id\":[\"302\",\"301\",\"300\",\"299\",\"298\",\"297\",\"296\",\"291\"]}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673337100),(635,NULL,'/admin/login/index.html','post','系统日志','{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"cbkm\",\"keep_login\":\"0\"}','116.4.9.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673399305),(636,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"kb8u\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407543),(637,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407573),(638,1,'/admin/system.menu/add','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"pid\":\"0\",\"title\":\"信息管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407666),(639,1,'/admin/system.menu/add?id=254','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"254\",\"pid\":\"254\",\"title\":\"合作客户\",\"href\":\"cooperate.customers\\/index\",\"icon\":\"fa fa-user-secret\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407748),(640,1,'/admin/system.menu/add?id=254','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"254\",\"pid\":\"254\",\"title\":\"拍摄知识\",\"href\":\"shot.tips\\/index\",\"icon\":\"fa fa-address-card-o\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407810),(641,1,'/admin/system.menu/add?id=254','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"254\",\"pid\":\"254\",\"title\":\"案例\",\"href\":\"cases\\/index\",\"icon\":\"fa fa-address-card\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407879),(642,1,'/admin/system.menu/add?id=254','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"254\",\"pid\":\"254\",\"title\":\"案例分类\",\"href\":\"cases.cate\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673407912),(643,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"npwq\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673418744),(644,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类\",\"sort\":\"0\",\"status\":\"1\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673425684),(645,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类\",\"sort\":\"0\",\"status\":\"1\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673425686),(646,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类\",\"sort\":\"0\",\"status\":\"1\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673425694),(647,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类\",\"sort\":\"0\",\"status\":\"1\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673425726),(648,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"rwkw\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673426360),(649,1,'/admin/cases.cate/add?id=1','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"id\":\"1\",\"pid\":\"1\",\"title\":\"测试子分类\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673427484),(650,1,'/admin/cases.cate/edit?id=2','post','系统日志','{\"\\/admin\\/cases_cate\\/edit\":\"\",\"id\":\"2\",\"pid\":\"1\",\"title\":\"测试子分类1\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673427750),(651,1,'/admin/cases.cate/delete?id=2','post','系统日志','{\"\\/admin\\/cases_cate\\/delete\":\"\",\"id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428068),(652,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"1\",\"title\":\"测试子分类\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428088),(653,1,'/admin/cases.cate/del','post','系统日志','{\"\\/admin\\/cases_cate\\/del\":\"\",\"id\":[\"3\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428310),(654,1,'/admin/cases.cate/delete','post','系统日志','{\"\\/admin\\/cases_cate\\/delete\":\"\",\"id\":[\"3\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428378),(655,1,'/admin/cases.cate/modify','post','系统日志','{\"\\/admin\\/cases_cate\\/modify\":\"\",\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428472),(656,1,'/admin/cases.cate/modify','post','系统日志','{\"\\/admin\\/cases_cate\\/modify\":\"\",\"id\":\"1\",\"field\":\"status\",\"value\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673428485),(657,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673429182),(658,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"1\",\"title\":\"测试标题\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/1823f459388b4c86cb46fab142e9de53.png\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;&lt;img alt=&quot;好样的&quot; src=&quot;http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png&quot; style=&quot;height:538px; width:762px&quot; \\/&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;来呀来呀&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\",\"view_count\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673429463),(659,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"5b7c\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673492952),(660,1,'/admin/cases/edit?id=1','post','系统日志','{\"id\":\"1\",\"cases_cate_id\":\"1\",\"title\":\"测试标题\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/1823f459388b4c86cb46fab142e9de53.png\",\"file\":\"\",\"keyword\":\"测试关键词\",\"description\":\"\",\"content\":\"&lt;p&gt;&lt;img alt=&quot;好样的&quot; src=&quot;http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png&quot; style=&quot;height:538px; width:762px&quot; \\/&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;来呀来呀&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493029),(661,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"1\",\"title\":\"测试标题2\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/2c412adf1b30c8be3a913e603c7b6e4a.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;我不要复制的，我要copy的&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493084),(662,1,'/admin/cases/delete?id=1','post','系统日志','{\"id\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493098),(663,1,'/admin/cases/delete','post','系统日志','{\"id\":[\"2\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493108),(664,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"1\",\"title\":\"测试标题\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;我不要复制的，我要copy的&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493152),(665,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"汇邦\",\"logo\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493842),(666,1,'/admin/cooperate.customers/modify','post','系统日志','{\"\\/admin\\/cooperate_customers\\/modify\":\"\",\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493878),(667,1,'/admin/cooperate.customers/modify','post','系统日志','{\"\\/admin\\/cooperate_customers\\/modify\":\"\",\"id\":\"1\",\"field\":\"status\",\"value\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673493885),(668,1,'/admin/cooperate.customers/delete','post','系统日志','{\"\\/admin\\/cooperate_customers\\/delete\":\"\",\"id\":[\"1\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673494760),(669,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"汇邦\",\"logo\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673494779),(670,1,'/admin/cooperate.customers/delete?id=2','post','系统日志','{\"\\/admin\\/cooperate_customers\\/delete\":\"\",\"id\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673494784),(671,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673495034),(672,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"logo_title\":\"易点咨询\",\"logo_image\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/f9a502be40de849d603ad52992648b72.png\",\"file\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673495038),(673,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"site_name\":\"易点咨询\",\"site_ico\":\"填你的\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"填你的\",\"site_copyright\":\"填你的\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673495066),(674,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673495132),(675,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"logo_title\":\"易点咨询\",\"logo_image\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/7d89c090375fba2a78926f3c1f6cf2a2.png\",\"file\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673495138),(676,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"gvwc\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673504282),(677,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673508970),(678,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"harley-davidso\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/87cf3b9874d1ffc414c214275eeda566.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673508977),(679,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673508992),(680,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"inscope\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/ecb21506b9db62123c94085cbbb88b92.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673508996),(681,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509010),(682,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"surprise\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/92c937dbee206a75f997469a73fc6ddb.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509015),(683,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509029),(684,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"白云集团\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/75f495819a51136da32d4f836397b074.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509034),(685,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509047),(686,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"北大\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/3a82923ff49d3ef925d906f09c17710c.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509052),(687,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509074),(688,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"北京卡酷传媒有限公司\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/2762da6c1e03d9e71b2d9b435d094c79.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509077),(689,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509087),(690,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"东方雨虹\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/f53bb960e6bb5fd73b35ce677d9935e5.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509093),(691,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509103),(692,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"动力源\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/bde8e272402af1cb3a1bc5775ec0aa1d.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509108),(693,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509120),(694,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"多维联合集团\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/092a01377eaa62dca9957b5c338f7796.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509124),(695,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509140),(696,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"华意通教育\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/d5120987d431b1d4da970ad413e745d6.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509144),(697,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509161),(698,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"启迪控股\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/d0b530f044adc2fb35562c5ef44a00ee.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509167),(699,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509180),(700,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509241),(701,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"清华同方\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/05c11b61d0c66e6a2373f3f34852a3a4.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509250),(702,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509272),(703,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"山钢集团\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/31df230494858b623568b5604be88165.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509277),(704,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509288),(705,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"特思迪\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/9318c109c3b5e6c36638a6297dea8440.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509294),(706,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509309),(707,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"天津股权交易所\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/5e5495c823e9e2c9f9bd632c37b01132.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509314),(708,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509328),(709,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"小笨智能\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/fa479e490b67f90fb162e8c944a7ab1e.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509337),(710,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509388),(711,1,'/admin/cooperate.customers/edit?id=14','post','系统日志','{\"\\/admin\\/cooperate_customers\\/edit\":\"\",\"id\":\"14\",\"title\":\"清华同方\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/5b976ef303b80af0ab2e20476c27c203.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509391),(712,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509419),(713,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"雪迪龙\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/8a49fb01de4951ad9a8d8d758ef6fdac.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509423),(714,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509438),(715,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"永达理\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/b3735b94d9d1966c174e8d8e798ae0d8.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509443),(716,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509454),(717,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"浙江大学\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/54416997591e8445fd873a51e876a5d0.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509458),(718,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509470),(719,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"中电科安\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e87fe2bdadfb21f8bf922ad567cb6421.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509472),(720,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509484),(721,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"中国恒天\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/f133abd5efc5ca7f17e4c67ceda82528.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509493),(722,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509512),(723,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"中国交通建设\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/83ce4871c2b8ed8295ac0020b69b840e.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509515),(724,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509534),(725,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"中视广经\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/6e5a623bef30620007831aabd6e8bc07.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509537),(726,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509549),(727,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"中兴能集团\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/3865122ef94b70aad48c4254842cee59.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509552),(728,1,'/admin/system.uploadfile/delete?id=331','post','系统日志','{\"\\/admin\\/system_uploadfile\\/delete\":\"\",\"id\":\"331\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509568),(729,1,'/admin/system.uploadfile/delete?id=332','post','系统日志','{\"\\/admin\\/system_uploadfile\\/delete\":\"\",\"id\":\"332\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673509580),(730,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"q5wp\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513262),(731,1,'/admin/cooperate.customers/edit?id=26','post','系统日志','{\"\\/admin\\/cooperate_customers\\/edit\":\"\",\"id\":\"26\",\"title\":\"中兴能集团\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/3865122ef94b70aad48c4254842cee59.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"99\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513276),(732,1,'/admin/cooperate.customers/modify','post','系统日志','{\"\\/admin\\/cooperate_customers\\/modify\":\"\",\"id\":\"26\",\"field\":\"status\",\"value\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513318),(733,1,'/admin/cooperate.customers/modify','post','系统日志','{\"\\/admin\\/cooperate_customers\\/modify\":\"\",\"id\":\"26\",\"field\":\"status\",\"value\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513347),(734,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"测试\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513459),(735,1,'/admin/cooperate.customers/add','post','系统日志','{\"\\/admin\\/cooperate_customers\\/add\":\"\",\"title\":\"测试2\",\"logo\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/54416997591e8445fd873a51e876a5d0.png\",\"file\":\"\",\"url\":\"#\",\"sort\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673513494),(736,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"1\",\"title\":\"测试标题2\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/46d7384f04a3bed331715e86a4095d15.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试内容2&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673514364),(737,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"1\",\"title\":\"测试标题3\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/0a6de1ac058ee134301501899b84ecb1.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试内容3&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673514456),(738,1,'/admin/cases/edit?id=4','post','系统日志','{\"id\":\"4\",\"cases_cate_id\":\"1\",\"title\":\"测试标题2\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试内容2&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673514507),(739,1,'/admin/cases/edit?id=4','post','系统日志','{\"id\":\"4\",\"cases_cate_id\":\"1\",\"title\":\"测试标题2\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/46d7384f04a3bed331715e86a4095d15.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试内容2&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673514556),(740,1,'/admin/shot.tips/add','post','系统日志','{\"\\/admin\\/shot_tips\\/add\":\"\",\"title\":\"拍摄知识1\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/46d7384f04a3bed331715e86a4095d15.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;拍摄知识1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673515552),(741,1,'/admin/shot.tips/add','post','系统日志','{\"\\/admin\\/shot_tips\\/add\":\"\",\"title\":\"拍摄知识2\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/0a6de1ac058ee134301501899b84ecb1.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;拍摄知识2&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673515586),(742,1,'/admin/shot.tips/add','post','系统日志','{\"\\/admin\\/shot_tips\\/add\":\"\",\"title\":\"拍摄知识3\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230111\\/66bf9a16e872a34c7338e2fe0debf1a8.png\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;拍摄知识3&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673515613),(743,1,'/admin/shot.tips/add','post','系统日志','{\"\\/admin\\/shot_tips\\/add\":\"\",\"title\":\"测试拍摄4\",\"cover_img\":\"\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试拍摄4&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673516460),(744,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673516712),(745,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673516763),(746,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673516802),(747,1,'/admin/shot.tips/edit?id=4','post','系统日志','{\"\\/admin\\/shot_tips\\/edit\":\"\",\"id\":\"4\",\"title\":\"测试拍摄4\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试拍摄4&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673516806),(748,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"8eba\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673574419),(749,1,'/admin/shot.tips/edit?id=4','post','系统日志','{\"\\/admin\\/shot_tips\\/edit\":\"\",\"id\":\"4\",\"title\":\"测试拍摄4\",\"cover_img\":\"\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试拍摄4&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1673575063),(750,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"fcnz\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1673600549),(751,1,'/admin/cases.cate/add','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类2\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1673600568),(752,1,'/admin/cases/add','post','系统日志','{\"cases_cate_id\":\"4\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1673600611),(753,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"6heq\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1674962555),(754,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"aenh\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675059640),(755,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675060786),(756,1,'/admin/system.menu/add?id=254','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"254\",\"pid\":\"254\",\"title\":\"拍摄分类\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675060883),(757,1,'/admin/system.menu/edit?id=259','post','系统日志','{\"\\/admin\\/system_menu\\/edit\":\"\",\"id\":\"259\",\"pid\":\"254\",\"title\":\"拍摄分类\",\"href\":\"shot.cate\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675060913),(758,1,'/admin/shot.cate/add','post','系统日志','{\"\\/admin\\/shot_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"测试分类\",\"sort\":\"0\",\"status\":\"1\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675063442),(759,1,'/admin/shot.cate/add?id=1','post','系统日志','{\"\\/admin\\/shot_cate\\/add\":\"\",\"id\":\"1\",\"pid\":\"1\",\"title\":\"测试子分类\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675063738),(760,1,'/admin/cases.cate/add?id=1','post','系统日志','{\"\\/admin\\/cases_cate\\/add\":\"\",\"id\":\"1\",\"pid\":\"1\",\"title\":\"测试子分类\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675063896),(761,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"jdtb\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675072079),(762,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"fxce\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675131988);
/*!40000 ALTER TABLE `sv_system_log_202301` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_log_202302`
--

DROP TABLE IF EXISTS `sv_system_log_202302`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_log_202302` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202302';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_log_202302`
--

LOCK TABLES `sv_system_log_202302` WRITE;
/*!40000 ALTER TABLE `sv_system_log_202302` DISABLE KEYS */;
INSERT INTO `sv_system_log_202302` VALUES (630,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"jrcf\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675221796),(631,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"0\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675222296),(632,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"4\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675222304),(633,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"0\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675222395),(634,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"请选择\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675222461),(635,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675222807),(636,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223090),(637,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223107),(638,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223125),(639,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223127),(640,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223127),(641,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223199),(642,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223207),(643,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675223973),(644,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675224090),(645,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675224104),(646,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675224120),(647,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675224170),(648,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"4\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675224229),(649,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"xp4t\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675242688),(650,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ycek\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675245577),(651,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"vh8q\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675305365),(652,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"rcvm\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675305782),(653,1,'/admin/shot.tips/edit?id=2','post','系统日志','{\"\\/admin\\/shot_tips\\/edit\":\"\",\"id\":\"2\",\"shot_cate_id\":\"1\",\"title\":\"拍摄知识2\",\"cover_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/0a6de1ac058ee134301501899b84ecb1.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"\",\"content\":\"&lt;p&gt;拍摄知识2&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675305900),(654,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310159),(655,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310168),(656,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310176),(657,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310228),(658,1,'/admin/system.menu/add','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"pid\":\"254\",\"title\":\"分享\",\"href\":\"share\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310268),(659,1,'/admin/system.menu/add','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"pid\":\"254\",\"title\":\"分享分类\",\"href\":\"share.cate\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675310298),(660,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"katc\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675319275),(661,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"tgaj\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675319740),(662,1,'/admin/share.cate/add','post','系统日志','{\"\\/admin\\/share_cate\\/add\":\"\",\"pid\":\"0\",\"title\":\"分享分类1\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675320000),(663,1,'/admin/share.cate/add?id=1','post','系统日志','{\"\\/admin\\/share_cate\\/add\":\"\",\"id\":\"1\",\"pid\":\"1\",\"title\":\"分享分类子分类1\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675320017),(664,1,'/admin/share/add','post','系统日志','{\"share_cate_id\":\"\",\"title\":\"分享标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"身份证二要素\",\"description\":\"身份证二要素\",\"content\":\"&lt;p&gt;分钟健康你妈&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675320075),(665,1,'/admin/share/add','post','系统日志','{\"share_cate_id\":\"1\",\"title\":\"分享标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"身份证二要素\",\"description\":\"身份证二要素\",\"content\":\"&lt;p&gt;分钟健康你妈&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675320086),(666,1,'/admin/share/add','post','系统日志','{\"share_cate_id\":\"2\",\"title\":\"分享子标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"分享子标题1\",\"description\":\"分享子标题1\",\"content\":\"&lt;p&gt;分享子标题1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675320271),(667,1,'/admin/cases/edit?id=6','post','系统日志','{\"id\":\"6\",\"cases_cate_id\":\"4\",\"title\":\"测试分类2标题1\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"keyword\":\"\",\"description\":\"身份证二要素\",\"content\":\"&lt;p&gt;测试分类2内容1&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675322839),(668,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"mqeq\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675329215),(669,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"site_name\":\"易点咨询\",\"site_ico\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/f133abd5efc5ca7f17e4c67ceda82528.png\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"填你的\",\"site_copyright\":\"汇邦工作室\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675329279),(670,NULL,'/admin/login/index','post','系统日志','{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"eqkt\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675330714),(671,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"wkiq\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675330849),(672,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"pmct\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1675331012),(673,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"juzj\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675331323),(674,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332678),(675,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332691),(676,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"title\":\"素未谋面，却能心照不宣\",\"cover_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230202\\/f6cc81bf0fb19c0f5d90403f8f734b44.jpeg\",\"file\":\"\",\"keyword\":\"深圳市易点市场研究咨询有限公司\",\"description\":\"010-68703788\",\"content\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332701),(677,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332840),(678,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332871),(679,1,'/admin/ajax/upload','post','系统日志','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332890),(680,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"contact_title\":\"素未谋面，却能心照不宣\",\"contact_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230202\\/0e7e9bdd402aacaa428835ad5b972096.jpeg\",\"file\":\"\",\"contact_company\":\"深圳市易点市场研究咨询有限公司\",\"contact_address\":\"深圳市宝安区民生一路18号5栋二层\",\"contact_service_tel\":\"400-111-1111\",\"contact_service_tel1\":\"010-68703788\",\"contact_service_tel2\":\"010-68703788\",\"about_content\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675332996),(681,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"contact_title\":\"素未谋面，却能心照不宣88\",\"contact_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230202\\/0e7e9bdd402aacaa428835ad5b972096.jpeg\",\"file\":\"\",\"contact_company\":\"深圳市易点市场研究咨询有限公司\",\"contact_address\":\"深圳市宝安区民生一路18号5栋二层\",\"contact_service_tel\":\"400-111-1111\",\"contact_service_tel1\":\"010-68703788\",\"contact_service_tel2\":\"010-68703788\",\"about_content\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333104),(682,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"contact_title\":\"素未谋面，却能心照不宣88\",\"contact_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230202\\/0e7e9bdd402aacaa428835ad5b972096.jpeg\",\"file\":\"\",\"contact_company\":\"深圳市易点市场研究咨询有限公司\",\"contact_address\":\"深圳市宝安区民生一路18号5栋二层\",\"contact_service_tel\":\"400-111-1111\",\"contact_service_tel1\":\"010-68703788\",\"contact_service_tel2\":\"010-68703788\",\"contact_email\":\"384138166@qq.com\",\"about_content\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333568),(683,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"about_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"about_content\":\"&lt;p&gt;关于我们 About Us&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333655),(684,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"about_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"about_content\":\"&lt;p&gt;&lt;span style=&quot;font-size:22px&quot;&gt;关于我们&lt;\\/span&gt; &lt;span style=&quot;font-size:16px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333853),(685,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"about_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"about_content\":\"&lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于我们&lt;\\/span&gt; &lt;span style=&quot;color:#dddddd&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333921),(686,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"about_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"about_content\":\"&lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于我们&lt;\\/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675333950),(687,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"fbxq\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675415494),(688,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"wp2h\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675646298),(689,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"mfrf\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675740399),(690,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"HTS5\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675753108),(691,1,'/admin/system.node/refreshNode?force=1','post','系统日志','{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675756212),(692,1,'/admin/system.menu/add','post','系统日志','{\"\\/admin\\/system_menu\\/add\":\"\",\"pid\":\"254\",\"title\":\"轮播图\",\"href\":\"carousel\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675756251),(693,1,'/admin/carousel/add','post','系统日志','{\"cate_id\":\"1\",\"img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230202\\/0e7e9bdd402aacaa428835ad5b972096.jpeg\",\"file\":\"\",\"url\":\"#\",\"content\":\"\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675756311),(694,1,'/admin/carousel/add','post','系统日志','{\"cate_id\":\"1\",\"img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"url\":\"#\",\"content\":\"\",\"sort\":\"0\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675757079),(695,1,'/admin/carousel/modify','post','系统日志','{\"id\":\"2\",\"field\":\"status\",\"value\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675757951),(696,1,'/admin/carousel/modify','post','系统日志','{\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675757951),(697,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"logo_title\":\"易点咨询\",\"logo_image\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/7d89c090375fba2a78926f3c1f6cf2a2.png\",\"file\":\"\",\"home_logo_image\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/3865122ef94b70aad48c4254842cee59.png\",\"about_content\":\"&lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于我们&lt;\\/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675759052),(698,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"bxac\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675842670),(699,NULL,'/admin/login/index.html?username=admin&password=123456&captcha=mbk7','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"zted\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675846839),(700,1,'/admin/system.config/save','post','系统日志','{\"\\/admin\\/system_config\\/save\":\"\",\"about_img\":\"http:\\/\\/shortvideo.local.com\\/upload\\/20230112\\/e68b62838bd4dcd86880ef2c41d198bc.jpg\",\"file\":\"\",\"about_content\":\"&lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于我们&lt;\\/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n\",\"html_content\":\"          &lt;p&gt;&lt;span style=&quot;font-size:28px&quot;&gt;关于{:sysconfig(\'site\', \'site_name\')}&lt;\\/span&gt; &lt;span style=&quot;color:#95a5a6&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;深圳市易点市场研究咨询有限公司是一家致力于短视频拍摄、抖音代运营推广、品牌营销，小红书营销、直播带货等新媒体营销推广的短视频代运营公司，我们配备专业短视频策划团队， 根据用户提出的需求和预期，结合市场调查和行业分析，帮客户精准定位运营策划推广方案，可针对不同公司制定运营内容规划，提供包括IP打造、内容规划、账号运营、蓝v认证、短视频内容策划制作、 短视频拍摄、内容传播等全面抖音代运营服务，帮助企业建造新的流量池，提高品牌影响力!&lt;\\/p&gt;\\n\\n&lt;p&gt;易点公司成立至今，已经和多家企业进行深度合作，服务客户包括餐饮服务、食品行业、零售行业、教育培训、机械设备、家居建材、生活服务、招商加盟、母婴宠物、服装配饰、休闲娱乐等多个行业， 公司深耕短视频垂直领域，为客户提供视频的定位、编剧、拍摄、剪辑、投放、运营至短视频引流变现服务体系。&lt;\\/p&gt;\\n        \"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675849616),(701,NULL,'/admin/login/index.html','post','系统日志','{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"nqad\",\"keep_login\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1675904620);
/*!40000 ALTER TABLE `sv_system_log_202302` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_menu`
--

DROP TABLE IF EXISTS `sv_system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `href` (`href`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_menu`
--

LOCK TABLES `sv_system_menu` WRITE;
/*!40000 ALTER TABLE `sv_system_menu` DISABLE KEYS */;
INSERT INTO `sv_system_menu` VALUES (227,99999999,'后台首页','fa fa-home','index/welcome','','_self',0,1,NULL,NULL,1573120497,NULL),(228,0,'系统管理','fa fa-cog','','','_self',0,1,'',NULL,1588999529,NULL),(234,228,'菜单管理','fa fa-tree','system.menu/index','','_self',10,1,'',NULL,1588228555,NULL),(244,228,'管理员管理','fa fa-user','system.admin/index','','_self',12,1,'',1573185011,1588228573,NULL),(245,228,'角色管理','fa fa-bitbucket-square','system.auth/index','','_self',11,1,'',1573435877,1588228634,NULL),(246,228,'节点管理','fa fa-list','system.node/index','','_self',9,1,'',1573435919,1588228648,NULL),(247,228,'配置管理','fa fa-asterisk','system.config/index','','_self',8,1,'',1573457448,1588228566,NULL),(248,228,'上传管理','fa fa-arrow-up','system.uploadfile/index','','_self',0,1,'',1573542953,1588228043,NULL),(249,0,'商城管理','fa fa-list','','','_self',0,1,'',1589439884,1673337074,1673337074),(250,249,'商品分类','fa fa-calendar-check-o','mall.cate/index','','_self',0,1,'',1589439910,1589439966,NULL),(251,249,'商品管理','fa fa-list','mall.goods/index','','_self',0,1,'',1589439931,1589439942,NULL),(252,228,'快捷入口','fa fa-list','system.quick/index','','_self',0,1,'',1589623683,1589623683,NULL),(253,228,'日志管理','fa fa-connectdevelop','system.log/index','','_self',0,1,'',1589623684,1589623684,NULL),(254,0,'信息管理','fa fa-list','','','_self',0,1,'',1673407666,1673407666,NULL),(255,254,'合作客户','fa fa-user-secret','cooperate.customers/index','','_self',0,1,'',1673407748,1673407748,NULL),(256,254,'拍摄知识','fa fa-address-card-o','shot.tips/index','','_self',0,1,'',1673407810,1673407810,NULL),(257,254,'案例','fa fa-address-card','cases/index','','_self',0,1,'',1673407880,1673407880,NULL),(258,254,'案例分类','fa fa-list','cases.cate/index','','_self',0,1,'',1673407912,1673407912,NULL),(259,254,'拍摄分类','fa fa-list','shot.cate/index','','_self',0,1,'',1675060883,1675060913,NULL),(260,254,'分享','fa fa-list','share/index','','_self',0,1,'',1675310268,1675310268,NULL),(261,254,'分享分类','fa fa-list','share.cate/index','','_self',0,1,'',1675310298,1675310298,NULL),(262,254,'轮播图','fa fa-list','carousel/index','','_self',0,1,'',1675756251,1675756251,NULL);
/*!40000 ALTER TABLE `sv_system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_node`
--

DROP TABLE IF EXISTS `sv_system_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='系统节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_node`
--

LOCK TABLES `sv_system_node` WRITE;
/*!40000 ALTER TABLE `sv_system_node` DISABLE KEYS */;
INSERT INTO `sv_system_node` VALUES (1,'system.admin','管理员管理',1,1,1589580432,1589580432),(2,'system.admin/index','列表',2,1,1589580432,1589580432),(3,'system.admin/add','添加',2,1,1589580432,1589580432),(4,'system.admin/edit','编辑',2,1,1589580432,1589580432),(5,'system.admin/password','编辑',2,1,1589580432,1589580432),(6,'system.admin/delete','删除',2,1,1589580432,1589580432),(7,'system.admin/modify','属性修改',2,1,1589580432,1589580432),(8,'system.admin/export','导出',2,1,1589580432,1589580432),(9,'system.auth','角色权限管理',1,1,1589580432,1589580432),(10,'system.auth/authorize','授权',2,1,1589580432,1589580432),(11,'system.auth/saveAuthorize','授权保存',2,1,1589580432,1589580432),(12,'system.auth/index','列表',2,1,1589580432,1589580432),(13,'system.auth/add','添加',2,1,1589580432,1589580432),(14,'system.auth/edit','编辑',2,1,1589580432,1589580432),(15,'system.auth/delete','删除',2,1,1589580432,1589580432),(16,'system.auth/export','导出',2,1,1589580432,1589580432),(17,'system.auth/modify','属性修改',2,1,1589580432,1589580432),(18,'system.config','系统配置管理',1,1,1589580432,1589580432),(19,'system.config/index','列表',2,1,1589580432,1589580432),(20,'system.config/save','保存',2,1,1589580432,1589580432),(21,'system.menu','菜单管理',1,1,1589580432,1589580432),(22,'system.menu/index','列表',2,1,1589580432,1589580432),(23,'system.menu/add','添加',2,1,1589580432,1589580432),(24,'system.menu/edit','编辑',2,1,1589580432,1589580432),(25,'system.menu/delete','删除',2,1,1589580432,1589580432),(26,'system.menu/modify','属性修改',2,1,1589580432,1589580432),(27,'system.menu/getMenuTips','添加菜单提示',2,1,1589580432,1589580432),(28,'system.menu/export','导出',2,1,1589580432,1589580432),(29,'system.node','系统节点管理',1,1,1589580432,1589580432),(30,'system.node/index','列表',2,1,1589580432,1589580432),(31,'system.node/refreshNode','系统节点更新',2,1,1589580432,1589580432),(32,'system.node/clearNode','清除失效节点',2,1,1589580432,1589580432),(33,'system.node/add','添加',2,1,1589580432,1589580432),(34,'system.node/edit','编辑',2,1,1589580432,1589580432),(35,'system.node/delete','删除',2,1,1589580432,1589580432),(36,'system.node/export','导出',2,1,1589580432,1589580432),(37,'system.node/modify','属性修改',2,1,1589580432,1589580432),(38,'system.uploadfile','上传文件管理',1,1,1589580432,1589580432),(39,'system.uploadfile/index','列表',2,1,1589580432,1589580432),(40,'system.uploadfile/add','添加',2,1,1589580432,1589580432),(41,'system.uploadfile/edit','编辑',2,1,1589580432,1589580432),(42,'system.uploadfile/delete','删除',2,1,1589580432,1589580432),(43,'system.uploadfile/export','导出',2,1,1589580432,1589580432),(44,'system.uploadfile/modify','属性修改',2,1,1589580432,1589580432),(45,'mall.cate','商品分类管理',1,1,1589580432,1589580432),(46,'mall.cate/index','列表',2,1,1589580432,1589580432),(47,'mall.cate/add','添加',2,1,1589580432,1589580432),(48,'mall.cate/edit','编辑',2,1,1589580432,1589580432),(49,'mall.cate/delete','删除',2,1,1589580432,1589580432),(50,'mall.cate/export','导出',2,1,1589580432,1589580432),(51,'mall.cate/modify','属性修改',2,1,1589580432,1589580432),(52,'mall.goods','商城商品管理',1,1,1589580432,1589580432),(53,'mall.goods/index','列表',2,1,1589580432,1589580432),(54,'mall.goods/stock','入库',2,1,1589580432,1589580432),(55,'mall.goods/add','添加',2,1,1589580432,1589580432),(56,'mall.goods/edit','编辑',2,1,1589580432,1589580432),(57,'mall.goods/delete','删除',2,1,1589580432,1589580432),(58,'mall.goods/export','导出',2,1,1589580432,1589580432),(59,'mall.goods/modify','属性修改',2,1,1589580432,1589580432),(60,'system.quick','快捷入口管理',1,1,1589623188,1589623188),(61,'system.quick/index','列表',2,1,1589623188,1589623188),(62,'system.quick/add','添加',2,1,1589623188,1589623188),(63,'system.quick/edit','编辑',2,1,1589623188,1589623188),(64,'system.quick/delete','删除',2,1,1589623188,1589623188),(65,'system.quick/export','导出',2,1,1589623188,1589623188),(66,'system.quick/modify','属性修改',2,1,1589623188,1589623188),(67,'system.log','操作日志管理',1,1,1589623188,1589623188),(68,'system.log/index','列表',2,1,1589623188,1589623188),(69,'shot.tips','shot_tips',1,1,1673407573,1673407573),(70,'shot.tips/index','列表',2,1,1673407573,1673407573),(71,'shot.tips/add','添加',2,1,1673407573,1673407573),(72,'shot.tips/edit','编辑',2,1,1673407573,1673407573),(73,'shot.tips/delete','删除',2,1,1673407573,1673407573),(74,'shot.tips/export','导出',2,1,1673407573,1673407573),(75,'shot.tips/modify','属性修改',2,1,1673407573,1673407573),(76,'cooperate.customers','cooperate_customers',1,1,1673407573,1673407573),(77,'cooperate.customers/index','列表',2,1,1673407573,1673407573),(78,'cooperate.customers/add','添加',2,1,1673407573,1673407573),(79,'cooperate.customers/edit','编辑',2,1,1673407573,1673407573),(80,'cooperate.customers/delete','删除',2,1,1673407573,1673407573),(81,'cooperate.customers/export','导出',2,1,1673407573,1673407573),(82,'cooperate.customers/modify','属性修改',2,1,1673407573,1673407573),(83,'cases.cate','cases_cate',1,1,1673407573,1673407573),(84,'cases.cate/index','列表',2,1,1673407573,1673407573),(85,'cases.cate/add','添加',2,1,1673407573,1673407573),(86,'cases.cate/edit','编辑',2,1,1673407573,1673407573),(87,'cases.cate/delete','删除',2,1,1673407573,1673407573),(88,'cases.cate/export','导出',2,1,1673407573,1673407573),(89,'cases.cate/modify','属性修改',2,1,1673407573,1673407573),(90,'cases','cases',1,1,1673407573,1673407573),(91,'cases/index','列表',2,1,1673407573,1673407573),(92,'cases/add','添加',2,1,1673407573,1673407573),(93,'cases/edit','编辑',2,1,1673407573,1673407573),(94,'cases/delete','删除',2,1,1673407573,1673407573),(95,'cases/export','导出',2,1,1673407573,1673407573),(96,'cases/modify','属性修改',2,1,1673407573,1673407573),(97,'shot.cate','shot_cate',1,1,1675060786,1675060786),(98,'shot.cate/index','列表',2,1,1675060786,1675060786),(99,'shot.cate/add','添加',2,1,1675060786,1675060786),(100,'shot.cate/edit','编辑',2,1,1675060786,1675060786),(101,'shot.cate/delete','删除',2,1,1675060786,1675060786),(102,'shot.cate/export','导出',2,1,1675060786,1675060786),(103,'shot.cate/modify','属性修改',2,1,1675060786,1675060786),(104,'share.cate','cases_cate',1,1,1675310228,1675310228),(105,'share.cate/index','列表',2,1,1675310228,1675310228),(106,'share.cate/add','添加',2,1,1675310228,1675310228),(107,'share.cate/edit','编辑',2,1,1675310228,1675310228),(108,'share.cate/delete','删除',2,1,1675310228,1675310228),(109,'share.cate/export','导出',2,1,1675310228,1675310228),(110,'share.cate/modify','属性修改',2,1,1675310228,1675310228),(111,'share','Share',1,1,1675310228,1675310228),(112,'share/index','列表',2,1,1675310228,1675310228),(113,'share/add','添加',2,1,1675310228,1675310228),(114,'share/edit','编辑',2,1,1675310228,1675310228),(115,'share/delete','删除',2,1,1675310228,1675310228),(116,'share/export','导出',2,1,1675310228,1675310228),(117,'share/modify','属性修改',2,1,1675310228,1675310228),(118,'carousel','carousel',1,1,1675756212,1675756212),(119,'carousel/index','列表',2,1,1675756212,1675756212),(120,'carousel/add','添加',2,1,1675756212,1675756212),(121,'carousel/edit','编辑',2,1,1675756212,1675756212),(122,'carousel/delete','删除',2,1,1675756212,1675756212),(123,'carousel/export','导出',2,1,1675756212,1675756212),(124,'carousel/modify','属性修改',2,1,1675756212,1675756212);
/*!40000 ALTER TABLE `sv_system_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_quick`
--

DROP TABLE IF EXISTS `sv_system_quick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_quick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统快捷入口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_quick`
--

LOCK TABLES `sv_system_quick` WRITE;
/*!40000 ALTER TABLE `sv_system_quick` DISABLE KEYS */;
INSERT INTO `sv_system_quick` VALUES (1,'管理员管理','fa fa-user','system.admin/index',0,1,'',1589624097,1589624792,NULL),(2,'角色管理','fa fa-bitbucket-square','system.auth/index',0,1,'',1589624772,1589624781,NULL),(3,'菜单管理','fa fa-tree','system.menu/index',0,1,NULL,1589624097,1589624792,NULL),(6,'节点管理','fa fa-list','system.node/index',0,1,NULL,1589624772,1589624781,NULL),(7,'配置管理','fa fa-asterisk','system.config/index',0,1,NULL,1589624097,1589624792,NULL),(8,'上传管理','fa fa-arrow-up','system.uploadfile/index',0,1,NULL,1589624772,1589624781,NULL),(10,'商品分类','fa fa-calendar-check-o','mall.cate/index',0,1,NULL,1589624097,1589624792,NULL),(11,'商品管理','fa fa-list','mall.goods/index',0,1,NULL,1589624772,1589624781,NULL);
/*!40000 ALTER TABLE `sv_system_quick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sv_system_uploadfile`
--

DROP TABLE IF EXISTS `sv_system_uploadfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sv_system_uploadfile` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `upload_type` (`upload_type`) USING BTREE,
  KEY `original_name` (`original_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COMMENT='上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sv_system_uploadfile`
--

LOCK TABLES `sv_system_uploadfile` WRITE;
/*!40000 ALTER TABLE `sv_system_uploadfile` DISABLE KEYS */;
INSERT INTO `sv_system_uploadfile` VALUES (286,'alioss','image/jpeg','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg','','','',0,'image/jpeg',0,'jpg','',NULL,NULL,NULL),(287,'alioss','image/jpeg','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg','','','',0,'image/jpeg',0,'jpg','',NULL,NULL,NULL),(288,'alioss','image/x-icon','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico','','','',0,'image/x-icon',0,'ico','',NULL,NULL,NULL),(289,'alioss','image/jpeg','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg','','','',0,'image/jpeg',0,'jpg','',NULL,NULL,NULL),(290,'alioss','image/jpeg','https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg','','','',0,'image/jpeg',0,'jpg','',NULL,NULL,NULL),(316,'local','c4.png','http://shortvideo.local.com/upload/20230111/1823f459388b4c86cb46fab142e9de53.png','','','',0,'image/png',0,'png','',1673429183,NULL,NULL),(317,'local','c4.png','http://shortvideo.local.com/upload/20230111/66bf9a16e872a34c7338e2fe0debf1a8.png','','','',0,'image/png',0,'png','',1673429408,NULL,NULL),(318,'local','logo.png','http://shortvideo.local.com/upload/20230112/f9a502be40de849d603ad52992648b72.png','','','',0,'image/png',0,'png','',1673495034,NULL,NULL),(319,'local','homeLogo.png','http://shortvideo.local.com/upload/20230112/7d89c090375fba2a78926f3c1f6cf2a2.png','','','',0,'image/png',0,'png','',1673495132,NULL,NULL),(320,'local','harley-davidson.png','http://shortvideo.local.com/upload/20230112/87cf3b9874d1ffc414c214275eeda566.png','','','',0,'image/png',0,'png','',1673508970,NULL,NULL),(321,'local','inscope.png','http://shortvideo.local.com/upload/20230112/ecb21506b9db62123c94085cbbb88b92.png','','','',0,'image/png',0,'png','',1673508992,NULL,NULL),(322,'local','surprise.png','http://shortvideo.local.com/upload/20230112/92c937dbee206a75f997469a73fc6ddb.png','','','',0,'image/png',0,'png','',1673509010,NULL,NULL),(323,'local','白云集团.png','http://shortvideo.local.com/upload/20230112/75f495819a51136da32d4f836397b074.png','','','',0,'image/png',0,'png','',1673509029,NULL,NULL),(324,'local','北大.png','http://shortvideo.local.com/upload/20230112/3a82923ff49d3ef925d906f09c17710c.png','','','',0,'image/png',0,'png','',1673509047,NULL,NULL),(325,'local','北京卡酷传媒有限公司.png','http://shortvideo.local.com/upload/20230112/2762da6c1e03d9e71b2d9b435d094c79.png','','','',0,'image/png',0,'png','',1673509074,NULL,NULL),(326,'local','东方雨虹.png','http://shortvideo.local.com/upload/20230112/f53bb960e6bb5fd73b35ce677d9935e5.png','','','',0,'image/png',0,'png','',1673509088,NULL,NULL),(327,'local','动力源.png','http://shortvideo.local.com/upload/20230112/bde8e272402af1cb3a1bc5775ec0aa1d.png','','','',0,'image/png',0,'png','',1673509103,NULL,NULL),(328,'local','多维联合集团.png','http://shortvideo.local.com/upload/20230112/092a01377eaa62dca9957b5c338f7796.png','','','',0,'image/png',0,'png','',1673509120,NULL,NULL),(329,'local','华意通教育.png','http://shortvideo.local.com/upload/20230112/d5120987d431b1d4da970ad413e745d6.png','','','',0,'image/png',0,'png','',1673509140,NULL,NULL),(330,'local','启迪控股.png','http://shortvideo.local.com/upload/20230112/d0b530f044adc2fb35562c5ef44a00ee.png','','','',0,'image/png',0,'png','',1673509161,NULL,NULL),(333,'local','山钢集团.png','http://shortvideo.local.com/upload/20230112/31df230494858b623568b5604be88165.png','','','',0,'image/png',0,'png','',1673509272,NULL,NULL),(334,'local','特思迪.png','http://shortvideo.local.com/upload/20230112/9318c109c3b5e6c36638a6297dea8440.png','','','',0,'image/png',0,'png','',1673509288,NULL,NULL),(335,'local','天津股权交易所.png','http://shortvideo.local.com/upload/20230112/5e5495c823e9e2c9f9bd632c37b01132.png','','','',0,'image/png',0,'png','',1673509309,NULL,NULL),(336,'local','小笨智能.png','http://shortvideo.local.com/upload/20230112/fa479e490b67f90fb162e8c944a7ab1e.png','','','',0,'image/png',0,'png','',1673509328,NULL,NULL),(337,'local','清华同方.png','http://shortvideo.local.com/upload/20230112/5b976ef303b80af0ab2e20476c27c203.png','','','',0,'image/png',0,'png','',1673509388,NULL,NULL),(338,'local','雪迪龙.png','http://shortvideo.local.com/upload/20230112/8a49fb01de4951ad9a8d8d758ef6fdac.png','','','',0,'image/png',0,'png','',1673509419,NULL,NULL),(339,'local','永达理.png','http://shortvideo.local.com/upload/20230112/b3735b94d9d1966c174e8d8e798ae0d8.png','','','',0,'image/png',0,'png','',1673509438,NULL,NULL),(340,'local','浙江大学.png','http://shortvideo.local.com/upload/20230112/54416997591e8445fd873a51e876a5d0.png','','','',0,'image/png',0,'png','',1673509454,NULL,NULL),(341,'local','中电科安.png','http://shortvideo.local.com/upload/20230112/e87fe2bdadfb21f8bf922ad567cb6421.png','','','',0,'image/png',0,'png','',1673509470,NULL,NULL),(342,'local','中国恒天.png','http://shortvideo.local.com/upload/20230112/f133abd5efc5ca7f17e4c67ceda82528.png','','','',0,'image/png',0,'png','',1673509484,NULL,NULL),(343,'local','中国交通建设.png','http://shortvideo.local.com/upload/20230112/83ce4871c2b8ed8295ac0020b69b840e.png','','','',0,'image/png',0,'png','',1673509512,NULL,NULL),(344,'local','中视广经.png','http://shortvideo.local.com/upload/20230112/6e5a623bef30620007831aabd6e8bc07.png','','','',0,'image/png',0,'png','',1673509534,NULL,NULL),(345,'local','中兴能集团.png','http://shortvideo.local.com/upload/20230112/3865122ef94b70aad48c4254842cee59.png','','','',0,'image/png',0,'png','',1673509549,NULL,NULL),(346,'local','O1CN01347T7J1C0kFZqNflC_!!6000000000019-0-tps-2880-1432.jpg','http://shortvideo.local.com/upload/20230112/e68b62838bd4dcd86880ef2c41d198bc.jpg','','','',0,'image/jpeg',0,'jpg','',1673516802,NULL,NULL),(347,'local','6eccffbbaab131a2eaa50be361a1b3e9.jpeg','http://shortvideo.local.com/upload/20230202/f6cc81bf0fb19c0f5d90403f8f734b44.jpeg','','','',0,'image/jpeg',0,'jpeg','',1675332692,NULL,NULL),(348,'local','6eccffbbaab131a2eaa50be361a1b3e9.jpeg','http://shortvideo.local.com/upload/20230202/f8877a7b01f77fef136d34805ed39485.jpeg','','','',0,'image/jpeg',0,'jpeg','',1675332840,NULL,NULL),(349,'local','6eccffbbaab131a2eaa50be361a1b3e9.jpeg','http://shortvideo.local.com/upload/20230202/b81fc420e940a09464b87f626c25c07a.jpeg','','','',0,'image/jpeg',0,'jpeg','',1675332872,NULL,NULL),(350,'local','6eccffbbaab131a2eaa50be361a1b3e9.jpeg','http://shortvideo.local.com/upload/20230202/0e7e9bdd402aacaa428835ad5b972096.jpeg','','','',0,'image/jpeg',0,'jpeg','',1675332890,NULL,NULL);
/*!40000 ALTER TABLE `sv_system_uploadfile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 16:44:49
