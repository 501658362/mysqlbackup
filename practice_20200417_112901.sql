-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: practice
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `StudentGrade`
--

DROP TABLE IF EXISTS `StudentGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentGrade` (
  `stuId` char(4) NOT NULL DEFAULT '',
  `subId` int(11) NOT NULL DEFAULT '0',
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`stuId`,`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentGrade`
--

LOCK TABLES `StudentGrade` WRITE;
/*!40000 ALTER TABLE `StudentGrade` DISABLE KEYS */;
INSERT INTO `StudentGrade` VALUES ('001',1,97),('001',2,50),('001',3,70),('002',1,92),('002',2,80),('002',3,30),('003',1,93),('003',2,95),('003',3,85),('004',1,73),('004',2,78),('004',3,87);
/*!40000 ALTER TABLE `StudentGrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a`
--

DROP TABLE IF EXISTS `a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_area_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '智能片区接送标记，0=无需标记（套餐没有设置智能片区计算）、1=符合条件（打开了标记并且接送酒店都在片区内）、2=不符合条件没有输入酒店、3=不符合条件酒店没有GPS、4=不符合条件(有GPS，但是不在片区内)',
  `transfer_location_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接送地点类型，0=接送酒店、1=集合地点',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a`
--

LOCK TABLES `a` WRITE;
/*!40000 ALTER TABLE `a` DISABLE KEYS */;
INSERT INTO `a` VALUES (1,0,0,'共和党',50),(2,0,0,'明进档',123),(3,0,0,'光明党',231),(66,0,0,'xxxx',22);
/*!40000 ALTER TABLE `a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b`
--

DROP TABLE IF EXISTS `b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b`
--

LOCK TABLES `b` WRITE;
/*!40000 ALTER TABLE `b` DISABLE KEYS */;
INSERT INTO `b` VALUES (1,1,'陈',20),(2,1,'不要',123),(3,2,'再擦上',12),(4,2,'阿三大撒旦',21),(5,2,'携程',123),(6,3,NULL,NULL);
/*!40000 ALTER TABLE `b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c`
--

DROP TABLE IF EXISTS `c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c` (
  `c` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `cn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '课程名称',
  PRIMARY KEY (`c`),
  KEY `idx_cn` (`cn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c`
--

LOCK TABLES `c` WRITE;
/*!40000 ALTER TABLE `c` DISABLE KEYS */;
INSERT INTO `c` VALUES (1,'java编程'),(2,'数据结构'),(3,'设计模式'),(4,'高等数学');
/*!40000 ALTER TABLE `c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_08_03_114312_create_jobs_table',2),('2016_08_18_051625_create_posts_table',3),('2016_08_18_051858_create_post1s_table',4),('2016_08_18_080028_create_tags_table',5),('2016_08_18_080143_create_post_tag_pivot',5),('2016_08_18_090651_alter_posts_deleted_at',6),('2016_08_18_090707_alter_tags_deleted_at',6),('2016_08_18_090716_alter_users_deleted_at',6),('2016_08_22_073757_restructure_poststs_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('peng501658@163.com','403dad34c6b5d017ecb55b57865528c76dcf9624f62ac0bbb5a8b0c7dc12ce13','2016-08-17 02:33:33'),('269920271@qq.com','ef0160b964950438d4816662a940d9de5ba5ec32a94dc316218d6cf52e8fbc94','2016-08-17 02:38:33'),('654307833@qq.com','3c3738a3b92c621ee26405695540887eb6f65939cab520ec925cfb34e541ef2d','2016-08-18 02:53:59');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag_pivot`
--

DROP TABLE IF EXISTS `post_tag_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_pivot_post_id_index` (`post_id`),
  KEY `post_tag_pivot_tag_id_index` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag_pivot`
--

LOCK TABLES `post_tag_pivot` WRITE;
/*!40000 ALTER TABLE `post_tag_pivot` DISABLE KEYS */;
INSERT INTO `post_tag_pivot` VALUES (1,1,2),(2,3,2),(3,5,5),(5,8,3),(6,8,4),(7,10,3),(8,13,1),(9,15,2),(10,16,3),(11,16,4),(12,17,3),(13,17,4),(14,19,2),(15,19,4),(21,23,1),(22,23,2),(23,23,3),(24,23,4),(25,23,5),(26,24,8),(27,25,7),(36,28,7),(38,32,8),(39,33,6),(40,34,6),(41,35,9),(42,35,10),(43,36,11),(44,37,6),(45,37,7),(46,37,10),(47,38,12),(48,39,11),(49,40,14),(50,41,15),(51,42,16),(52,42,11),(53,43,6),(54,43,7),(55,44,13),(56,46,8),(57,47,8),(58,48,6),(59,49,13),(60,50,17),(61,51,8),(62,52,8);
/*!40000 ALTER TABLE `post_tag_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_raw` text COLLATE utf8_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blog.layouts.post',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `top_level` int(10) NOT NULL DEFAULT '0' COMMENT '置顶等级 默认0 等级越高排越高',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_published_at_index` (`published_at`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (22,'laravel-51','Laravel 5.1 ','Laravel 5.1 LTS 中文文档','说明#\r\n此文档主要由 Summer 和 Aufree 维护，你可以在 PHPHub 上面找到他们。\r\n\r\n为了方便新手学习，在每篇文档的最底部增加导读内容区块。\r\n\r\n更多讨论，请前往这个帖子：Laravel 5.1 LTS 中文文档翻译完成「精校版」。\r\n\r\n排版规范#\r\n此文档遵循 中文排版指南 规范，并在此之上遵守以下约定：\r\n\r\n英文的左右保持一个空白，避免中英文字黏在一起；\r\n使用全角标点符号；\r\n严格遵循 Markdown 语法；\r\n原文中的双引号（\" \"）请代换成中文的引号（「」符号怎么打出来见 这里）；\r\n「加亮」和「加粗」和「[链接]()」都需要在左右保持一个空格。\r\n翻译对照列表#\r\n按照英文字母排序。\r\n\r\nA#\r\nAggregate 聚合\r\nArray 数组\r\nArtisan (命令，不翻)\r\nArgument 参数\r\nAssets 资源文件\r\nAuthorization 用户授权\r\nAdapter 接口\r\nB#\r\nBlade (专为 Laravel 发明的 PHP 模板引擎，不翻)\r\nBundle (上一代的 package 名称，不翻)\r\nBinding 绑定\r\nC#\r\nCache 缓存\r\nCall 调用\r\nCallback 回调\r\nClasses 类\r\nCLI 命令行接口\r\nCommand 命令\r\nCommand Line 命令行\r\nComponent 组件\r\nConsole 终端\r\nContext 情境\r\nController 控制器\r\nController Action 控制器行为\r\nconstructor 类构造器\r\nCookie (不翻)\r\nComposer (开源项目名称，不翻)\r\nCredentials 凭证\r\nClosure 闭包\r\nConfiguration 配置信息\r\nChain 链式\r\nChain Methods 链式调用\r\nContracts 契约\r\nD#\r\nDatabase-Transactions 数据库事务\r\nDeferred Providers 延迟提供者\r\nDriver 驱动\r\nDependency Injection 依赖注入\r\nE#\r\nEvent 事件\r\nExtend 扩展\r\nExtension 扩展\r\nEloquent (不翻)\r\nException 异常\r\nF#\r\nFacades (不翻)\r\nFramework 框架\r\nFilter 过滤器\r\nForm 表单\r\nFunction 函数\r\nG#\r\nGuide 指南\r\nGuard 保卫\r\nH#\r\nHelper 辅助函数\r\nHash 哈希 (可不翻)\r\nHomestead (不翻)\r\nHeader 标头\r\nHook 钩子\r\nI#\r\nInstance 实例\r\nIoC (不翻)\r\ninheritance 继承\r\nimplements 实现\r\nJ#\r\nJob 任务\r\nK#\r\nKey 键\r\nL#\r\nLaravel (不翻)\r\nListener 侦听器\r\nLibrary 函数库\r\nM#\r\nMethod 方法\r\nMigration 迁移\r\nModel 模型\r\nMiddleware 中间件\r\nN#\r\nNamespace 命名空间\r\nO#\r\nObject 对象\r\nP#\r\nPackage 扩展包\r\nPackagist (开源项目名称，不翻)\r\nProvider 提供者\r\nPrefix 前缀\r\nPresenter (不翻)\r\nPipeline 管道\r\nPolicies 策略\r\nQ#\r\nQueue 队列\r\nQuery Builder 查询语句构造器\r\nR#\r\nRoute / Routing 路由\r\nRouter 路由器\r\nRequest 请求\r\nResponse 响应\r\nResolved 解析\r\nRepository (不翻)\r\nRedirect 重定向\r\n(Database\'s) Rollback 还原\r\nS#\r\nSchema 数据库结构\r\nService 服务\r\nService Container 服务容器\r\nService Providers 服务提供者\r\nSession (不翻)\r\nSeed 数据填充\r\nScheduler 计划器\r\nT#\r\nTag 标签\r\nTable 数据表\r\nTemplates 模板\r\nTerminal 终端\r\nToken 令牌\r\nTimestamps 时间戳\r\nType-hint 类型提示\r\nTrait (不翻)\r\nTernary statement 三元运算符\r\nThrow (Exception) 拋出（异常）\r\nV#\r\nVagrant (开源项目名称，不翻)\r\nVagrant Box (开源项目名称，不翻)\r\nView 视图\r\nVendor 供应商\r\nView Composer 视图组件\r\nW#\r\nWorkbench (开源项目名称，不翻)\r\nWebhooks (不翻)\r\nWord Factor 加密系数','<p>说明#\n此文档主要由 Summer 和 Aufree 维护，你可以在 PHPHub 上面找到他们。</p>\n\n<p>为了方便新手学习，在每篇文档的最底部增加导读内容区块。</p>\n\n<p>更多讨论，请前往这个帖子：Laravel 5.1 LTS 中文文档翻译完成「精校版」。</p>\n\n<p>排版规范#\n此文档遵循 中文排版指南 规范，并在此之上遵守以下约定：</p>\n\n<p>英文的左右保持一个空白，避免中英文字黏在一起；\n使用全角标点符号；\n严格遵循 Markdown 语法；\n原文中的双引号（&#8221; &#8220;）请代换成中文的引号（「」符号怎么打出来见 这里）；\n「加亮」和「加粗」和「<a href=\"\">链接</a>」都需要在左右保持一个空格。\n翻译对照列表#\n按照英文字母排序。</p>\n\n<p>A#\nAggregate 聚合\nArray 数组\nArtisan (命令，不翻)\nArgument 参数\nAssets 资源文件\nAuthorization 用户授权\nAdapter 接口\nB#\nBlade (专为 Laravel 发明的 PHP 模板引擎，不翻)\nBundle (上一代的 package 名称，不翻)\nBinding 绑定\nC#\nCache 缓存\nCall 调用\nCallback 回调\nClasses 类\nCLI 命令行接口\nCommand 命令\nCommand Line 命令行\nComponent 组件\nConsole 终端\nContext 情境\nController 控制器\nController Action 控制器行为\nconstructor 类构造器\nCookie (不翻)\nComposer (开源项目名称，不翻)\nCredentials 凭证\nClosure 闭包\nConfiguration 配置信息\nChain 链式\nChain Methods 链式调用\nContracts 契约\nD#\nDatabase-Transactions 数据库事务\nDeferred Providers 延迟提供者\nDriver 驱动\nDependency Injection 依赖注入\nE#\nEvent 事件\nExtend 扩展\nExtension 扩展\nEloquent (不翻)\nException 异常\nF#\nFacades (不翻)\nFramework 框架\nFilter 过滤器\nForm 表单\nFunction 函数\nG#\nGuide 指南\nGuard 保卫\nH#\nHelper 辅助函数\nHash 哈希 (可不翻)\nHomestead (不翻)\nHeader 标头\nHook 钩子\nI#\nInstance 实例\nIoC (不翻)\ninheritance 继承\nimplements 实现\nJ#\nJob 任务\nK#\nKey 键\nL#\nLaravel (不翻)\nListener 侦听器\nLibrary 函数库\nM#\nMethod 方法\nMigration 迁移\nModel 模型\nMiddleware 中间件\nN#\nNamespace 命名空间\nO#\nObject 对象\nP#\nPackage 扩展包\nPackagist (开源项目名称，不翻)\nProvider 提供者\nPrefix 前缀\nPresenter (不翻)\nPipeline 管道\nPolicies 策略\nQ#\nQueue 队列\nQuery Builder 查询语句构造器\nR#\nRoute / Routing 路由\nRouter 路由器\nRequest 请求\nResponse 响应\nResolved 解析\nRepository (不翻)\nRedirect 重定向\n(Database&#8217;s) Rollback 还原\nS#\nSchema 数据库结构\nService 服务\nService Container 服务容器\nService Providers 服务提供者\nSession (不翻)\nSeed 数据填充\nScheduler 计划器\nT#\nTag 标签\nTable 数据表\nTemplates 模板\nTerminal 终端\nToken 令牌\nTimestamps 时间戳\nType-hint 类型提示\nTrait (不翻)\nTernary statement 三元运算符\nThrow (Exception) 拋出（异常）\nV#\nVagrant (开源项目名称，不翻)\nVagrant Box (开源项目名称，不翻)\nView 视图\nVendor 供应商\nView Composer 视图组件\nW#\nWorkbench (开源项目名称，不翻)\nWebhooks (不翻)\nWord Factor 加密系数</p>\n','','                                                                                                    \r\n                \r\n                \r\n                \r\n                \r\n                ',0,'web.blog.layouts.post',0,0,'2016-09-07 03:22:56','2000-09-06 16:00:00','2000-09-06 16:00:00','2016-09-08 07:45:10'),(23,'1','上线啦，欢迎留言吐槽或建议','上线啦','啦啦啦啦啦啦, 快留下你的评论！','<p>啦啦啦啦啦啦, 快留下你的评论！</p>\n','','                                                                                                    \r\n                \r\n                \r\n                \r\n                \r\n                ',0,'web.blog.layouts.post',1045,0,'2016-09-08 03:48:43','2016-09-08 15:30:00','2016-09-08 15:30:00',NULL),(24,'mysql','Mysql技巧','Mysql的一些技巧',' Inner Join  两个表的 公共部分 \r\n Left Join  查询两个表 A表有 B表无  \r\n``` mysql\r\n select from table Ta a left join Tb b on a.key = b.key where b.key is null\r\n```  \r\n\r\n 子查询 更新表  \r\n``` mysql\r\n update user1 a join (select b.`user_name` from user1 a join user2 b on a.`user_name` = b.`user_name`) b on a.`user_name` = b.`user_name`;\r\n```  \r\n\r\n行转列  如多个手机号  \r\n\r\n``` mysql\r\n select user_name \r\n ,Replace (substring(substring_index(\r\n mobile,\',\',a.id),\r\n char_length(substring_index(\r\n mobile,\',\',a.id-1))+1),\',\',\'\') as mobile\r\n from tb_sequence a \r\n cross join( select user_name,concat(mobile,\',\') as mobile,length(mobile)-length(replace(mobile,\',\',\'\'))+1 size \r\n from user1 b) on a.id <= b.size  \r\n\r\n SELECT a.`user_name` ,a.`over` ,b.`over` FROM user1 a INNER JOIN user2  b ON a.`user_name` = b.`user_name`;  \r\n \r\nSELECT * FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` WHERE b.`user_name` IS NOT NULL;  \r\n\r\nSELECT a.`user_name` ,a.`over` ,b.`over` FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` WHERE b.`user_name` IS NULL;  \r\n  \r\nSELECT * FROM user1 a RIGHT JOIN user2 b ON a.`user_name` = b.`user_name`  WHERE a.`user_name` IS   NULL;   \r\n\r\nSELECT * FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` UNION ALL SELECT * FROM user1 a \r\nRIGHT JOIN user2 b ON a.`user_name` =b.`user_name`;  \r\n\r\nSELECT \r\n  * \r\nFROM\r\n  user1 a \r\n  CROSS JOIN user2 b \r\n    UPDATE \r\n      user1 c \r\n    SET\r\n      over = \'齐天大圣\' \r\n    WHERE c.`id` = \r\n      (SELECT \r\n        a.`id` \r\n      FROM\r\n        user1 a \r\n        LEFT JOIN user2 b \r\n          ON a.`user_name` = b.`user_name` \r\n      WHERE b.`user_name` IS NOT NULL) ;  \r\n\r\nUPDATE \r\n  user1 a \r\n  JOIN \r\n    (SELECT \r\n      b.`user_name` \r\n    FROM\r\n      user1 a \r\n      JOIN user2 b \r\n        ON a.`user_name` = b.`user_name`) b \r\n    ON a.`user_name`  = b.`user_name` SET a.`over` = \'齐天大圣\';  \r\n\r\nSELECT a.`user_name`, a.`over`,(SELECT over FROM user2 b WHERE a.`user_name` = b.`user_name`) AS over2 FROM user1 a;  \r\n\r\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id` \r\nWHERE b.`kills` = (SELECT MAX(c.`kills`) FROM user_kills c WHERE c.`user_id` =b.`user_id`) ORDER BY kills DESC;  \r\n\r\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id` ORDER BY kills DESC;  \r\n\r\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id`  JOIN user_kills\r\nc ON c.`user_id` = b.`user_id` GROUP BY a.`user_name`,b.`timestr`,b.`kills` HAVING b.`kills` = MAX(c.`kills`);  \r\n\r\nSELECT \r\n  d.`user_name`,\r\n  c.timestr,\r\n  kills ,\r\n  cnt\r\nFROM\r\n  (SELECT \r\n    user_id,\r\n    timestr,\r\n    kills,\r\n    (SELECT \r\n      COUNT(*) \r\n    FROM\r\n      user_kills b \r\n    WHERE b.user_id = a.user_id \r\n      AND a.kills <= b.kills) AS cnt \r\n  FROM\r\n    user_kills a \r\n  GROUP BY user_id,\r\n    timestr,\r\n    kills) c \r\n  JOIN user1 d \r\n    ON c.user_id = d.id \r\nWHERE cnt <= 2 ;\r\n```  \r\n','<p>Inner Join  两个表的 公共部分 \n Left Join  查询两个表 A表有 B表无</p>\n\n<pre><code class=\"mysql\"> select from table Ta a left join Tb b on a.key = b.key where b.key is null\n</code></pre>\n\n<p>子查询 更新表</p>\n\n<pre><code class=\"mysql\"> update user1 a join (select b.`user_name` from user1 a join user2 b on a.`user_name` = b.`user_name`) b on a.`user_name` = b.`user_name`;\n</code></pre>\n\n<p>行转列  如多个手机号</p>\n\n<pre><code class=\"mysql\"> select user_name \n ,Replace (substring(substring_index(\n mobile,\',\',a.id),\n char_length(substring_index(\n mobile,\',\',a.id-1))+1),\',\',\'\') as mobile\n from tb_sequence a \n cross join( select user_name,concat(mobile,\',\') as mobile,length(mobile)-length(replace(mobile,\',\',\'\'))+1 size \n from user1 b) on a.id &lt;= b.size  \n\n SELECT a.`user_name` ,a.`over` ,b.`over` FROM user1 a INNER JOIN user2  b ON a.`user_name` = b.`user_name`;  \n\nSELECT * FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` WHERE b.`user_name` IS NOT NULL;  \n\nSELECT a.`user_name` ,a.`over` ,b.`over` FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` WHERE b.`user_name` IS NULL;  \n\nSELECT * FROM user1 a RIGHT JOIN user2 b ON a.`user_name` = b.`user_name`  WHERE a.`user_name` IS   NULL;   \n\nSELECT * FROM user1 a LEFT JOIN user2 b ON a.`user_name` = b.`user_name` UNION ALL SELECT * FROM user1 a \nRIGHT JOIN user2 b ON a.`user_name` =b.`user_name`;  \n\nSELECT \n  * \nFROM\n  user1 a \n  CROSS JOIN user2 b \n    UPDATE \n      user1 c \n    SET\n      over = \'齐天大圣\' \n    WHERE c.`id` = \n      (SELECT \n        a.`id` \n      FROM\n        user1 a \n        LEFT JOIN user2 b \n          ON a.`user_name` = b.`user_name` \n      WHERE b.`user_name` IS NOT NULL) ;  \n\nUPDATE \n  user1 a \n  JOIN \n    (SELECT \n      b.`user_name` \n    FROM\n      user1 a \n      JOIN user2 b \n        ON a.`user_name` = b.`user_name`) b \n    ON a.`user_name`  = b.`user_name` SET a.`over` = \'齐天大圣\';  \n\nSELECT a.`user_name`, a.`over`,(SELECT over FROM user2 b WHERE a.`user_name` = b.`user_name`) AS over2 FROM user1 a;  \n\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id` \nWHERE b.`kills` = (SELECT MAX(c.`kills`) FROM user_kills c WHERE c.`user_id` =b.`user_id`) ORDER BY kills DESC;  \n\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id` ORDER BY kills DESC;  \n\nSELECT a.`user_name`,b.`timestr`,b.`kills` FROM user1 a  JOIN user_kills b ON a.`id` = b.`user_id`  JOIN user_kills\nc ON c.`user_id` = b.`user_id` GROUP BY a.`user_name`,b.`timestr`,b.`kills` HAVING b.`kills` = MAX(c.`kills`);  \n\nSELECT \n  d.`user_name`,\n  c.timestr,\n  kills ,\n  cnt\nFROM\n  (SELECT \n    user_id,\n    timestr,\n    kills,\n    (SELECT \n      COUNT(*) \n    FROM\n      user_kills b \n    WHERE b.user_id = a.user_id \n      AND a.kills &lt;= b.kills) AS cnt \n  FROM\n    user_kills a \n  GROUP BY user_id,\n    timestr,\n    kills) c \n  JOIN user1 d \n    ON c.user_id = d.id \nWHERE cnt &lt;= 2 ;\n</code></pre>\n','','                                                                                                                                                                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n   ',0,'web.blog.layouts.post',951,0,'2016-09-08 07:50:43','2016-09-08 08:48:00','2016-09-08 08:48:00',NULL),(25,'laravel','Laravel笔记','Laravel各种笔记','新增数据\r\n使用查询构建器的insert方法即可插入一条/多条数据：\r\n```php\r\nDB::table(\'users\')->insert([\r\n    [\'id\'=>1,\'name\'=>\'Laravel\',\'email\'=>\'laravel@test.com\',\'password\'=>\'123\'],\r\n    [\'id\'=>2,\'name\'=>\'Academy\',\'email\'=>\'academy@test.com\',\'password\'=>\'123\'],\r\n    [\'id\'=>3,\'name\'=>\'LaravelAcademy\',\'email\'=>\'laravel-academy@test.com\',\'password\'=>\'123\']\r\n]);  \r\n```\r\n\r\n执行成功后即可在数据表$users中插入三条记录。有时候，我们需要插入记录后获取自增ID，可以使用insertGetId方法：  \r\n```\r\n$insertId = DB::table(\'users\')->insertGetId(\r\n    [\'name\'=>\'Laravel-Academy\',\'email\'=>\'laravelacademy@test.com\',\'password\'=>\'456\']\r\n);\r\n```  \r\n\r\n更新表记录很简单，使用查询构建器的update方法即可：  \r\n```\r\n$affected = DB::table(\'users\')->where(\'name\',\'Laravel-Academy\')->update([\'password\'=>\'123\']);\r\n```  \r\n\r\n使用delete方法删除表记录，删除方法和更新方法类似，返回被删除的行数：  \r\n```\r\n$deleted = DB::table(\'users\')->where(\'id\', \'>\', 3)->delete();\r\n```\r\n\r\n获取所有表记录  \r\n使用get方法即可获取一张表的所有记录：  \r\n```\r\n$users = DB::table(\'users\')->get();\r\ndd($users);\r\n```  \r\n\r\n获取单条记录  \r\n获取单条记录需要在查询基础上加上first方法：  \r\n```\r\n$user = DB::table(\'users\')->where(\'name\',\'Laravel\')->first();\r\ndd($user);\r\n```  \r\n\r\n分组块获取数据  \r\n如果数据库包含多条数据，则一次性获取会极大影响性能，对应地，我们可以调用chunk方法分组块获取数据：  \r\n```\r\nDB::table(\'users\')->chunk(2,function($users){\r\n    foreach($users as $user){\r\n        // if($user->name==\'LaravelAcademy\')\r\n            // return false;\r\n        echo $user->name.\'<br>\';\r\n    }\r\n});\r\n```\r\n\r\n这里我们指定每次取两条记录。注释部分的意思是我们可以设定查询退出条件，当达到该条件时，\r\n查询退出，不再往下执行。  \r\n\r\n获取单列的值  \r\n上述方法获取的查询结果都是对象实例/对象实例数组，有时候，我们只是想简单获取单列的值，  \r\n遍历数组获取指定列的值太麻烦，可以使用lists方法获取列值数组：  \r\n```\r\n$users = DB::table(\'users\')->lists(\'name\');\r\ndd($users);\r\n```\r\n\r\n原生表达式  \r\n此外，查询构建器还支持原生表达式，我们需要调用DB门面的raw方法来实现：  \r\n```\r\n$users = DB::table(\'users\')->select(DB::raw(\'name,email\'))->where(\'id\',\'<\',3)->get();\r\ndd($users);\r\n```  \r\n\r\n内连接  \r\n内连接用于获取两张表结果集的交集部分，我们可以使用查询构建器的join方法进行内连接查询：  \r\n\r\n```\r\n$users = DB::table(\'users\')->join(\'posts\',\'users.id\',\'=\',\'posts.user_id\')->get();\r\ndd($users);\r\n```  \r\n\r\n左连接的结果集指定的左表的所有行，  \r\n如果左表的某行在右表中没有匹配行，则在相关联的结果集行中右表的所有选择列表列均为空值(null)。  \r\n我们使用查询构建器的leftJoin方法进行左连接查询：  \r\n\r\n```\r\n$users = DB::table(\'users\')->leftJoin(\'posts\',\'users.id\',\'=\',\'posts.user_id\')->get();\r\ndd($users);\r\n```  \r\n\r\n更加复杂的连接查询  \r\n\r\n很多时候，连接查询的查询条件往往更为复杂，并不是一个简单的join/leftJoin方法就能搞定的，  \r\n那么我们如何添加更加复杂的查询条件呢？使用JoinClause代替条件参数：  \r\n\r\n```\r\n$users = DB::table(\'users\')->join(\'posts\',function($join){\r\n    $join->on(\'users.id\',\'=\',\'posts.user_id\')\r\n         ->where(\'posts.id\',\'>\',1);\r\n})->get();\r\ndd($users);\r\n```  \r\n\r\nwhere子句  \r\n使用查询构建器上的where方法可以添加自定义查询条件，调用该方法需要传入三个参数： \r\n \r\n第一个列名，第二个是操作符，第三个是比较值：  \r\n\r\n```\r\n$user = DB::table(\'users\')->where(\'name\',\'=\',\'Laravel\')->get();\r\ndd($user);\r\n```  \r\n\r\n如果操作符为“=”，该语句也可简化为：\r\n```  \r\n$user = DB::table(\'users\')->where(\'name\',\'Laravel\')->get();\r\n```  \r\n\r\n排序\r\n查询构建器使用orderBy方法对查询结果进行排序：\r\n```  \r\n$users = DB::table(\'users\')->orderBy(\'id\',\'desc\')->get();\r\ndd($users);\r\n```  \r\n\r\n根据代码可以看到orderBy方法需要传入两个参数，第一个是排序字段，第二个是排序方向，asc代表升序，desc代表倒序\r\n\r\n分组\r\n为了更好地演示分组，我们给数据表posts新增两个字段：cat_id和views，代表分类ID和浏览数：\r\nposts表新增分类ID和浏览数\r\n分组一般用于聚合查询，接下来我们使用groupBy方法对查询结果进行分组，比如我们可以统计每个分类下有几篇文章：\r\n```  \r\n$posts = DB::table(\'posts\')->select(\'cat_id\',DB::raw(\'COUNT(id) as num\'))->groupBy(\'cat_id\')->get();\r\ndd($posts);\r\n```  \r\n\r\n我们还可以使用having方法为分组加上条件，比如我们可以统计总浏览数大于500的分类：\r\n```  \r\n$posts = DB::table(\'posts\')->select(\'cat_id\',DB::raw(\'SUM(views) as views\'))->groupBy(\'cat_id\')->having(\'views\',\'>\',500)->get();\r\ndd($posts);\r\n```  \r\n\r\n注意：having中的条件字段必须出现在select查询字段中，否则会报错。\r\n\r\n分页\r\n查询构建器中使用skip和take对查询结果进行分页，相当于SQL语句中的limit语句：\r\n```  \r\n$posts = DB::table(\'posts\')->skip(0)->take(2)->get();\r\ndd($posts);\r\n```  \r\n\r\n\r\n模型\r\n1创建模型\r\n我们使用Artisan命令make:model生成模型类，模型类默认位于app目录下，我们也可以在创建时指定生成目录：\r\n```\r\nphp artisan make:model Models/Post\r\n\r\n//获取多个Eloquent模型\r\n $posts = Post::all();\r\n```  \r\n\r\n获取单个模型\r\n可以使用查询构建器方法获取单个模型实例：\r\n```  \r\n$post = Post::where(\'id\',1)->first();\r\ndd($post);\r\n```  \r\n\r\n当然也可以通过Eloquent模型类提供的快捷方法find：\r\n```  \r\n$post = Post::find(1);\r\n```  \r\n\r\n如果没有找到对应的表记录，会输出null，如果我们想要捕获查询结果为空的异常并进行处理，\r\n比如跳转到404页面，可以使用findOrFail或者firstOrFail方法，如果表记录存在，两者返回获取到的第一条记录\r\n，否则抛出Illuminate\\Database\\Eloquent\\ModelNotFoundException异常。\r\n\r\n 聚合函数查询\r\n如果要对查询结果进行计数、统计、最大值/最小值、平均数等聚合运算，可以使用查询构建器上的对应方法，\r\n我们我们查询文章总数：\r\n```  \r\n$count = Post::where(\'id\',\'>\',0)->count();\r\necho $count;\r\n```  \r\n\r\n输出结果为3，又或者我们想要获取文章最大阅读数：\r\n```  \r\n$views = Post::where(\'id\',\'>\',0)->max(\'views\');\r\necho $views;\r\n```  \r\n\r\n输出结果为800。\r\n\r\n创建模型\r\n 使用save方法创建模型\r\n调用Eloquent模型类的save方法即可创建模型并插入数据到数据库：\r\n```  \r\n$post = new Post;\r\n$post->title = \'test 4\';\r\n$post->content = \'test content\';\r\n$post->user_id = 1;\r\n$post->cat_id = 1;\r\nif($post->save()){\r\n    echo \'添加文章成功！\';\r\n}else{\r\n    echo \'添加文章失败！\';\r\n}\r\n```  \r\n\r\n使用create方法插入数据\r\n```  \r\n$input = [\r\n    \'title\'=>\'test 5\',\r\n    \'content\'=>\'test content\',\r\n    \'cat_id\'=>1,\r\n    \'views\'=>100,\r\n    \'user_id\'=>2\r\n];\r\n$post = Post::create($input);\r\ndd($post);\r\n```  \r\n\r\n 其他插入数据的方法\r\nEloquent模型类还支持其它插入数据的方法——firstOrCreate和firstOrNew\r\n\r\n更新模型\r\n使用save方法更新模型\r\n```  \r\n$post = Post::find(1);\r\n$post->title = \'test 1 title\';\r\nif($post->save()){\r\n    echo \'更新文章成功！\';\r\n}else{\r\n    echo \'更新文章失败！\';\r\n}\r\n```  \r\n\r\n删除模型\r\n使用delete删除模型\r\n删除模型很简单，先获取要删除的模型实例，然后调用delete方法即可：\r\n```  \r\n$post = Post::find(5);\r\nif($post->delete()){\r\n    echo \'删除文章成功！\';\r\n}else{\r\n    echo \'删除文章失败！\';\r\n}\r\n```  \r\n\r\n使用destroy删除模型\r\n当然如果已知要删除的模型id的话，可以用更简单的方法destroy直接删除：\r\n```  \r\n$deleted = Post::destroy(5);\r\n```  \r\n\r\n你也可以一次传入多个模型id删除多个模型：\r\n```  \r\n$deleted = Post::destroy([1,2,3,4,5]);\r\n```  \r\n\r\n调用destroy方法返回被删除的记录数。\r\n使用查询构建器删除模型\r\n既然前面提到Eloquent模型本身就是查询构建器，也可以使用查询构建器风格删除模型，比如我们要删除所有浏览数为0的文章，可以使用如下方式：\r\n```  \r\n$deleted = Models\\Post::where(\'views\', 0)->delete();\r\n```  \r\n\r\n软删除及其相关实现\r\n所谓软删除指的是数据表记录并未真的从数据库删除，而是将表记录的标识状态标记为软删除，\r\n这样在查询的时候就可以加以过滤，让对应表记录看上去是被”删除“了。Laravel中使用了一个日期字段作为标识状态，\r\n这个日期字段可以自定义，这里我们使用deleted_at，如果对应模型被软删除，则deleted_at字段的值为删除时间，\r\n否则该值为空\r\n 软删除恢复\r\n有时候我们需要恢复被软删除的模型，可以使用SoftDeletes提供的restore方法：\r\n恢复单个模型\r\n```  \r\n$post = Post::find(6);\r\n$post->restore();\r\n```  \r\n\r\n恢复多个模型\r\n```  \r\nPost::withTrashed()->where(\'id\',\'>\',1)->restore();\r\n```  \r\n\r\n恢复所有模型\r\n```  \r\nPost::withTrashed()->restore();\r\n```  \r\n\r\n恢复关联查询模型\r\n```  \r\n$post = Post::find(6);\r\n$post->history()->restore();\r\n```  \r\n\r\n查询结果包含软删除模型\r\n那如果想要在查询结果中包含软删除的记录呢？可以使用SoftDeletes trait上的withTrashed方法：\r\n```  \r\n$posts = Post::withTrashed()->get();\r\ndd($posts);\r\n```  \r\n\r\n强制删除\r\n如果模型配置了软删除但我们确实要删除改模型对应数据库表记录，则可以使用SoftDeletes提供的forceDelete方法：\r\n```  \r\n$post = Post::find(6);\r\n$post->forceDelete();\r\n```  \r\n\r\n\r\n查询作用域\r\nEloquent还支持将一些常用的查询封装到模型方法中，方便调用，我们将其称之为“查询作用域”，\r\n实现查询作用域很简单，只需要在模型方法前加上scope前缀即可，比如我们经常需要获取浏览数最高的文章\r\n，就可以使用该机制实现——在Post中定义一个scopePopular方法：\r\n```  \r\npublic function scopePopular($query)\r\n{\r\n    return $query->where(\'views\',\'>=\',100);\r\n}\r\n```  \r\n\r\n对应的，我们在控制器中定义测试代码如下：\r\n```  \r\n$posts = Post::popular()->orderBy(\'views\',\'desc\')->get();\r\nforeach ($posts as $post) {\r\n    echo \'<\'.$post->title.\'> \'.$post->views.\'views<br>\';\r\n}\r\n```  \r\n\r\n此外，查询作用域还支持动态传入参数，为了测试该方法我们为posts新增一个status字段：\r\n同时在模型类中新增一个scopeStatus方法：\r\n```  \r\npublic function scopeStatus($query,$status=1)\r\n{\r\n    return $query->where(\'status\',$status);\r\n}\r\n```  \r\n\r\n接下来测试下该方法：\r\n```  \r\n$posts = Post::popular()->status(1)->orderBy(\'views\',\'desc\')->get();\r\nforeach ($posts as $post) {\r\n     echo \'<\'.$post->title.\'> \'.$post->views.\'views<br>\';\r\n}\r\n```  \r\n\r\n模型事件\r\nEloquent 也支持模型事件——当模型被创建、更新或删除的时候触发相应事件，Eloquent目前支持八种事件类型：\r\ncreating、created、updating、updated、saving、saved、deleting、deleted。\r\ndeleting和deleted很好理解，在删除模型时触发，deleting在删除操作前执行，deleted在删除完成后执行。\r\n当创建模型时，依次执行saving、creating、created和saved，同理在更新模型时依次执行saving、updating、\r\nupdated和saved。无论是使用批量赋值（create/update）还是直接调用save方法，都会触发对应事件\r\n（前提是注册了相应的模型事件）。\r\n你可以在任何你喜欢的地方注册模型事件，这里我们选择在服务提供者AppServiceProvider的boot方法中注册：\r\n\r\nEloquent ORM 实例教程 —— 关联关系及其在模型中的定义（一） \r\n一对一 一对多 多对多\r\nhttp://laravelacademy.org/post/1095.html','<p>新增数据\n使用查询构建器的insert方法即可插入一条/多条数据：</p>\n\n<pre><code class=\"php\">DB::table(\'users\')-&gt;insert([\n    [\'id\'=&gt;1,\'name\'=&gt;\'Laravel\',\'email\'=&gt;\'laravel@test.com\',\'password\'=&gt;\'123\'],\n    [\'id\'=&gt;2,\'name\'=&gt;\'Academy\',\'email\'=&gt;\'academy@test.com\',\'password\'=&gt;\'123\'],\n    [\'id\'=&gt;3,\'name\'=&gt;\'LaravelAcademy\',\'email\'=&gt;\'laravel-academy@test.com\',\'password\'=&gt;\'123\']\n]);  \n</code></pre>\n\n<p>执行成功后即可在数据表$users中插入三条记录。有时候，我们需要插入记录后获取自增ID，可以使用insertGetId方法：</p>\n\n<pre><code>$insertId = DB::table(\'users\')-&gt;insertGetId(\n    [\'name\'=&gt;\'Laravel-Academy\',\'email\'=&gt;\'laravelacademy@test.com\',\'password\'=&gt;\'456\']\n);\n</code></pre>\n\n<p>更新表记录很简单，使用查询构建器的update方法即可：</p>\n\n<pre><code>$affected = DB::table(\'users\')-&gt;where(\'name\',\'Laravel-Academy\')-&gt;update([\'password\'=&gt;\'123\']);\n</code></pre>\n\n<p>使用delete方法删除表记录，删除方法和更新方法类似，返回被删除的行数：</p>\n\n<pre><code>$deleted = DB::table(\'users\')-&gt;where(\'id\', \'&gt;\', 3)-&gt;delete();\n</code></pre>\n\n<p>获取所有表记录<br />\n使用get方法即可获取一张表的所有记录：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;get();\ndd($users);\n</code></pre>\n\n<p>获取单条记录<br />\n获取单条记录需要在查询基础上加上first方法：</p>\n\n<pre><code>$user = DB::table(\'users\')-&gt;where(\'name\',\'Laravel\')-&gt;first();\ndd($user);\n</code></pre>\n\n<p>分组块获取数据<br />\n如果数据库包含多条数据，则一次性获取会极大影响性能，对应地，我们可以调用chunk方法分组块获取数据：</p>\n\n<pre><code>DB::table(\'users\')-&gt;chunk(2,function($users){\n    foreach($users as $user){\n        // if($user-&gt;name==\'LaravelAcademy\')\n            // return false;\n        echo $user-&gt;name.\'&lt;br&gt;\';\n    }\n});\n</code></pre>\n\n<p>这里我们指定每次取两条记录。注释部分的意思是我们可以设定查询退出条件，当达到该条件时，\n查询退出，不再往下执行。</p>\n\n<p>获取单列的值<br />\n上述方法获取的查询结果都是对象实例/对象实例数组，有时候，我们只是想简单获取单列的值，<br />\n遍历数组获取指定列的值太麻烦，可以使用lists方法获取列值数组：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;lists(\'name\');\ndd($users);\n</code></pre>\n\n<p>原生表达式<br />\n此外，查询构建器还支持原生表达式，我们需要调用DB门面的raw方法来实现：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;select(DB::raw(\'name,email\'))-&gt;where(\'id\',\'&lt;\',3)-&gt;get();\ndd($users);\n</code></pre>\n\n<p>内连接<br />\n内连接用于获取两张表结果集的交集部分，我们可以使用查询构建器的join方法进行内连接查询：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;join(\'posts\',\'users.id\',\'=\',\'posts.user_id\')-&gt;get();\ndd($users);\n</code></pre>\n\n<p>左连接的结果集指定的左表的所有行，<br />\n如果左表的某行在右表中没有匹配行，则在相关联的结果集行中右表的所有选择列表列均为空值(null)。<br />\n我们使用查询构建器的leftJoin方法进行左连接查询：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;leftJoin(\'posts\',\'users.id\',\'=\',\'posts.user_id\')-&gt;get();\ndd($users);\n</code></pre>\n\n<p>更加复杂的连接查询</p>\n\n<p>很多时候，连接查询的查询条件往往更为复杂，并不是一个简单的join/leftJoin方法就能搞定的，<br />\n那么我们如何添加更加复杂的查询条件呢？使用JoinClause代替条件参数：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;join(\'posts\',function($join){\n    $join-&gt;on(\'users.id\',\'=\',\'posts.user_id\')\n         -&gt;where(\'posts.id\',\'&gt;\',1);\n})-&gt;get();\ndd($users);\n</code></pre>\n\n<p>where子句<br />\n使用查询构建器上的where方法可以添加自定义查询条件，调用该方法需要传入三个参数：</p>\n\n<p>第一个列名，第二个是操作符，第三个是比较值：</p>\n\n<pre><code>$user = DB::table(\'users\')-&gt;where(\'name\',\'=\',\'Laravel\')-&gt;get();\ndd($user);\n</code></pre>\n\n<p>如果操作符为“=”，该语句也可简化为：</p>\n\n<pre><code>$user = DB::table(\'users\')-&gt;where(\'name\',\'Laravel\')-&gt;get();\n</code></pre>\n\n<p>排序\n查询构建器使用orderBy方法对查询结果进行排序：</p>\n\n<pre><code>$users = DB::table(\'users\')-&gt;orderBy(\'id\',\'desc\')-&gt;get();\ndd($users);\n</code></pre>\n\n<p>根据代码可以看到orderBy方法需要传入两个参数，第一个是排序字段，第二个是排序方向，asc代表升序，desc代表倒序</p>\n\n<p>分组\n为了更好地演示分组，我们给数据表posts新增两个字段：cat_id和views，代表分类ID和浏览数：\nposts表新增分类ID和浏览数\n分组一般用于聚合查询，接下来我们使用groupBy方法对查询结果进行分组，比如我们可以统计每个分类下有几篇文章：</p>\n\n<pre><code>$posts = DB::table(\'posts\')-&gt;select(\'cat_id\',DB::raw(\'COUNT(id) as num\'))-&gt;groupBy(\'cat_id\')-&gt;get();\ndd($posts);\n</code></pre>\n\n<p>我们还可以使用having方法为分组加上条件，比如我们可以统计总浏览数大于500的分类：</p>\n\n<pre><code>$posts = DB::table(\'posts\')-&gt;select(\'cat_id\',DB::raw(\'SUM(views) as views\'))-&gt;groupBy(\'cat_id\')-&gt;having(\'views\',\'&gt;\',500)-&gt;get();\ndd($posts);\n</code></pre>\n\n<p>注意：having中的条件字段必须出现在select查询字段中，否则会报错。</p>\n\n<p>分页\n查询构建器中使用skip和take对查询结果进行分页，相当于SQL语句中的limit语句：</p>\n\n<pre><code>$posts = DB::table(\'posts\')-&gt;skip(0)-&gt;take(2)-&gt;get();\ndd($posts);\n</code></pre>\n\n<p>模型\n1创建模型\n我们使用Artisan命令make:model生成模型类，模型类默认位于app目录下，我们也可以在创建时指定生成目录：</p>\n\n<pre><code>php artisan make:model Models/Post\n\n//获取多个Eloquent模型\n $posts = Post::all();\n</code></pre>\n\n<p>获取单个模型\n可以使用查询构建器方法获取单个模型实例：</p>\n\n<pre><code>$post = Post::where(\'id\',1)-&gt;first();\ndd($post);\n</code></pre>\n\n<p>当然也可以通过Eloquent模型类提供的快捷方法find：</p>\n\n<pre><code>$post = Post::find(1);\n</code></pre>\n\n<p>如果没有找到对应的表记录，会输出null，如果我们想要捕获查询结果为空的异常并进行处理，\n比如跳转到404页面，可以使用findOrFail或者firstOrFail方法，如果表记录存在，两者返回获取到的第一条记录\n，否则抛出Illuminate\\Database\\Eloquent\\ModelNotFoundException异常。</p>\n\n<p>聚合函数查询\n如果要对查询结果进行计数、统计、最大值/最小值、平均数等聚合运算，可以使用查询构建器上的对应方法，\n我们我们查询文章总数：</p>\n\n<pre><code>$count = Post::where(\'id\',\'&gt;\',0)-&gt;count();\necho $count;\n</code></pre>\n\n<p>输出结果为3，又或者我们想要获取文章最大阅读数：</p>\n\n<pre><code>$views = Post::where(\'id\',\'&gt;\',0)-&gt;max(\'views\');\necho $views;\n</code></pre>\n\n<p>输出结果为800。</p>\n\n<p>创建模型\n 使用save方法创建模型\n调用Eloquent模型类的save方法即可创建模型并插入数据到数据库：</p>\n\n<pre><code>$post = new Post;\n$post-&gt;title = \'test 4\';\n$post-&gt;content = \'test content\';\n$post-&gt;user_id = 1;\n$post-&gt;cat_id = 1;\nif($post-&gt;save()){\n    echo \'添加文章成功！\';\n}else{\n    echo \'添加文章失败！\';\n}\n</code></pre>\n\n<p>使用create方法插入数据</p>\n\n<pre><code>$input = [\n    \'title\'=&gt;\'test 5\',\n    \'content\'=&gt;\'test content\',\n    \'cat_id\'=&gt;1,\n    \'views\'=&gt;100,\n    \'user_id\'=&gt;2\n];\n$post = Post::create($input);\ndd($post);\n</code></pre>\n\n<p>其他插入数据的方法\nEloquent模型类还支持其它插入数据的方法——firstOrCreate和firstOrNew</p>\n\n<p>更新模型\n使用save方法更新模型</p>\n\n<pre><code>$post = Post::find(1);\n$post-&gt;title = \'test 1 title\';\nif($post-&gt;save()){\n    echo \'更新文章成功！\';\n}else{\n    echo \'更新文章失败！\';\n}\n</code></pre>\n\n<p>删除模型\n使用delete删除模型\n删除模型很简单，先获取要删除的模型实例，然后调用delete方法即可：</p>\n\n<pre><code>$post = Post::find(5);\nif($post-&gt;delete()){\n    echo \'删除文章成功！\';\n}else{\n    echo \'删除文章失败！\';\n}\n</code></pre>\n\n<p>使用destroy删除模型\n当然如果已知要删除的模型id的话，可以用更简单的方法destroy直接删除：</p>\n\n<pre><code>$deleted = Post::destroy(5);\n</code></pre>\n\n<p>你也可以一次传入多个模型id删除多个模型：</p>\n\n<pre><code>$deleted = Post::destroy([1,2,3,4,5]);\n</code></pre>\n\n<p>调用destroy方法返回被删除的记录数。\n使用查询构建器删除模型\n既然前面提到Eloquent模型本身就是查询构建器，也可以使用查询构建器风格删除模型，比如我们要删除所有浏览数为0的文章，可以使用如下方式：</p>\n\n<pre><code>$deleted = Models\\Post::where(\'views\', 0)-&gt;delete();\n</code></pre>\n\n<p>软删除及其相关实现\n所谓软删除指的是数据表记录并未真的从数据库删除，而是将表记录的标识状态标记为软删除，\n这样在查询的时候就可以加以过滤，让对应表记录看上去是被”删除“了。Laravel中使用了一个日期字段作为标识状态，\n这个日期字段可以自定义，这里我们使用deleted_at，如果对应模型被软删除，则deleted_at字段的值为删除时间，\n否则该值为空\n 软删除恢复\n有时候我们需要恢复被软删除的模型，可以使用SoftDeletes提供的restore方法：\n恢复单个模型</p>\n\n<pre><code>$post = Post::find(6);\n$post-&gt;restore();\n</code></pre>\n\n<p>恢复多个模型</p>\n\n<pre><code>Post::withTrashed()-&gt;where(\'id\',\'&gt;\',1)-&gt;restore();\n</code></pre>\n\n<p>恢复所有模型</p>\n\n<pre><code>Post::withTrashed()-&gt;restore();\n</code></pre>\n\n<p>恢复关联查询模型</p>\n\n<pre><code>$post = Post::find(6);\n$post-&gt;history()-&gt;restore();\n</code></pre>\n\n<p>查询结果包含软删除模型\n那如果想要在查询结果中包含软删除的记录呢？可以使用SoftDeletes trait上的withTrashed方法：</p>\n\n<pre><code>$posts = Post::withTrashed()-&gt;get();\ndd($posts);\n</code></pre>\n\n<p>强制删除\n如果模型配置了软删除但我们确实要删除改模型对应数据库表记录，则可以使用SoftDeletes提供的forceDelete方法：</p>\n\n<pre><code>$post = Post::find(6);\n$post-&gt;forceDelete();\n</code></pre>\n\n<p>查询作用域\nEloquent还支持将一些常用的查询封装到模型方法中，方便调用，我们将其称之为“查询作用域”，\n实现查询作用域很简单，只需要在模型方法前加上scope前缀即可，比如我们经常需要获取浏览数最高的文章\n，就可以使用该机制实现——在Post中定义一个scopePopular方法：</p>\n\n<pre><code>public function scopePopular($query)\n{\n    return $query-&gt;where(\'views\',\'&gt;=\',100);\n}\n</code></pre>\n\n<p>对应的，我们在控制器中定义测试代码如下：</p>\n\n<pre><code>$posts = Post::popular()-&gt;orderBy(\'views\',\'desc\')-&gt;get();\nforeach ($posts as $post) {\n    echo \'&lt;\'.$post-&gt;title.\'&gt; \'.$post-&gt;views.\'views&lt;br&gt;\';\n}\n</code></pre>\n\n<p>此外，查询作用域还支持动态传入参数，为了测试该方法我们为posts新增一个status字段：\n同时在模型类中新增一个scopeStatus方法：</p>\n\n<pre><code>public function scopeStatus($query,$status=1)\n{\n    return $query-&gt;where(\'status\',$status);\n}\n</code></pre>\n\n<p>接下来测试下该方法：</p>\n\n<pre><code>$posts = Post::popular()-&gt;status(1)-&gt;orderBy(\'views\',\'desc\')-&gt;get();\nforeach ($posts as $post) {\n     echo \'&lt;\'.$post-&gt;title.\'&gt; \'.$post-&gt;views.\'views&lt;br&gt;\';\n}\n</code></pre>\n\n<p>模型事件\nEloquent 也支持模型事件——当模型被创建、更新或删除的时候触发相应事件，Eloquent目前支持八种事件类型：\ncreating、created、updating、updated、saving、saved、deleting、deleted。\ndeleting和deleted很好理解，在删除模型时触发，deleting在删除操作前执行，deleted在删除完成后执行。\n当创建模型时，依次执行saving、creating、created和saved，同理在更新模型时依次执行saving、updating、\nupdated和saved。无论是使用批量赋值（create/update）还是直接调用save方法，都会触发对应事件\n（前提是注册了相应的模型事件）。\n你可以在任何你喜欢的地方注册模型事件，这里我们选择在服务提供者AppServiceProvider的boot方法中注册：</p>\n\n<p>Eloquent ORM 实例教程 —— 关联关系及其在模型中的定义（一） \n一对一 一对多 多对多\nhttp://laravelacademy.org/post/1095.html</p>\n','','                                                                                                                        \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                ',0,'web.blog.layouts.post',1287,0,'2016-09-08 07:51:40','2016-09-08 08:50:00','2016-09-08 08:50:00',NULL),(26,'laravel-1','Laravel 网站','Laravel 相关的学习资源社区','#Laravel学院\r\n[http://laravelacademy.org/](http://laravelacademy.org/\r\n)\r\n#phphub\r\n[https://phphub.org/](https://phphub.org/)\r\n\r\n#Laravel官网API\r\n[https://laravel.com/api/5.1](https://laravel.com/api/5.1)\r\n\r\n#Laravel 5.1 LTS 速查表\r\n[https://cs.phphub.org/](https://cs.phphub.org/)\r\n\r\n#laravist\r\n[https://laravist.com/series/laravel-5-basic](https://laravist.com/series/laravel-5-basic)\r\n\r\n#golaravel\r\n[http://v4.golaravel.com/](http://v4.golaravel.com/)\r\n\r\n#laravel-china\r\n[http://laravel-china.org/](http://laravel-china.org/)','<h1>Laravel学院</h1>\n\n<p><a href=\"http://laravelacademy.org/\">http://laravelacademy.org/</a></p>\n\n<h1>phphub</h1>\n\n<p><a href=\"https://phphub.org/\">https://phphub.org/</a></p>\n\n<h1>Laravel官网API</h1>\n\n<p><a href=\"https://laravel.com/api/5.1\">https://laravel.com/api/5.1</a></p>\n\n<h1>Laravel 5.1 LTS 速查表</h1>\n\n<p><a href=\"https://cs.phphub.org/\">https://cs.phphub.org/</a></p>\n\n<h1>laravist</h1>\n\n<p><a href=\"https://laravist.com/series/laravel-5-basic\">https://laravist.com/series/laravel-5-basic</a></p>\n\n<h1>golaravel</h1>\n\n<p><a href=\"http://v4.golaravel.com/\">http://v4.golaravel.com/</a></p>\n\n<h1>laravel-china</h1>\n\n<p><a href=\"http://laravel-china.org/\">http://laravel-china.org/</a></p>\n','','                                                            \r\n                \r\n                \r\n                ',0,'web.blog.layouts.post',471,0,'2016-09-08 07:59:14','2016-09-08 08:52:00','2016-09-08 08:52:00',NULL),(27,'2','服务器，即将到期！！！  ','服务器，即将到期！！！  没有钱续费~','服务器，即将到期！！！  没有钱续费~        9月22号 23点59分59秒 终止服务！！！','<p>服务器，即将到期！！！  没有钱续费~        9月22号 23点59分59秒 终止服务！！！</p>\n','','                                        \r\n                \r\n                ',0,'web.blog.layouts.post',0,0,'2016-09-18 20:15:55','2016-09-19 04:00:00','2016-09-19 04:00:00','2017-11-06 07:18:43'),(28,'stdclass','关于stdClass 转为 数组格式','数据转换','# DB::xxx->get() 获取的是stdClass  \r\n**在获取数据之前设置获取方式**\r\n**有两种设置获取方式**\r\n\r\n1. 在database.php设置\r\n<pre><code>fetch\' => PDO::FETCH_ASSOC`;</code></pre>\r\n2. 获取数据的时候设置获取模式\r\n<pre><code>fetch\' =>DB::setFetchMode(\\PDO::FETCH_ASSOC);</code></pre>\r\n','<h1>DB::xxx->get() 获取的是stdClass</h1>\n\n<p><strong>在获取数据之前设置获取方式</strong>\n<strong>有两种设置获取方式</strong></p>\n\n<ol>\n<li>在database.php设置</li>\n</ol>\n\n<pre><code>fetch\' => PDO::FETCH_ASSOC`;</code></pre>\n\n<ol start=\"2\">\n<li>获取数据的时候设置获取模式</li>\n</ol>\n\n<pre><code>fetch\' =>DB::setFetchMode(\\PDO::FETCH_ASSOC);</code></pre>\n','about-bg.jpg','                                                                                                                                            \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n     ',0,'web.blog.layouts.post',1299,0,'2016-09-26 04:25:59','2016-09-26 05:20:26','2016-09-26 05:20:26',NULL),(29,'test','test','test','#asdasdasd','<h1>asdasdasd</h1>\n','','                                                            \r\n                \r\n                \r\n                ',0,'web.blog.layouts.post',0,0,'2017-05-17 10:11:43','2017-05-17 10:00:00','2017-05-17 10:00:00','2017-05-17 14:51:02'),(30,'3','满血复活','成功满血复活','此博客。。。','<p>此博客。。。</p>\n','','                                        \r\n                \r\n                ',0,'web.blog.layouts.post',0,0,'2017-05-17 14:53:33','2017-05-17 14:51:11','2017-05-17 14:51:11','2017-11-06 07:19:16'),(31,'4','水友们点这里！！！！','不可描述的内容','哈哈  被骗了','<p>哈哈  被骗了</p>\n','','                                        \r\n                \r\n                不可描述',0,'web.blog.layouts.post',1173,0,'2017-05-24 14:00:43','2017-05-24 14:00:02','2017-05-24 14:00:02',NULL),(32,'mysql-1','Mysql查看字段长度','Mysql查看字段长度','> length: 一个汉字是算三个字符，一个数字或字母算一个字符。  \r\nchar_length: 不管汉字还是数字或者是字母都算是一个字符。\r\n\r\n``` mysql\r\nselect email , length(email) from ucenter_user_info order by length(email) desc; \r\nselect username , length(username) from ucenter_user_info order by length(username) desc; \r\n```\r\n','<blockquote>\n  <p>length: 一个汉字是算三个字符，一个数字或字母算一个字符。<br />\n  char_length: 不管汉字还是数字或者是字母都算是一个字符。</p>\n</blockquote>\n\n<pre><code class=\"mysql\">select email , length(email) from ucenter_user_info order by length(email) desc; \nselect username , length(username) from ucenter_user_info order by length(username) desc; \n</code></pre>\n','','Mysql查看字段长度',0,'web.blog.layouts.post',2242,0,'2017-06-22 07:02:48','2017-06-22 07:01:24','2017-06-22 07:01:24',NULL),(33,'git-merge-master','Git 撤销 merge 到 master','Git 撤销 merge 到 master','1. ```git reset --hard 版本号```\r\n2. 解除 master 的保护\r\n3. ```git push -f ```强制推送远程\r\n4. 其他开发人员删除本地分支，重新拉取！！','<ol>\n<li><code>git reset --hard 版本号</code></li>\n<li>解除 master 的保护</li>\n<li><code>git push -f</code>强制推送远程</li>\n<li>其他开发人员删除本地分支，重新拉取！！</li>\n</ol>\n','','git,master,merge,撤销merge',0,'web.blog.layouts.post',2211,0,'2017-07-13 11:54:55','2018-07-25 06:24:03','2017-07-13 11:51:34',NULL),(34,'git-gitignore','非.gitignore 不追踪在版本库里的文件','本地 GIT 不追踪 本地某文件的解决方案','[原文链接](https://github.com/wujunchuan/wujunchuan.github.io/issues/18)\r\n \r\n1. ```git update-index --assume-unchanged <PATH> ``` 执行这个命令，使 本地GIT 不跟踪此文件在本地的变化\r\n2. 如果修改了此文件，并且需要提交，需要执行 ```git update-index --no-assume-unchanged <PATH>```  使本地GIT 重新跟踪此文件。并通知其他开发人员，拉取代码后重新执行第一步！','<p><a href=\"https://github.com/wujunchuan/wujunchuan.github.io/issues/18\">原文链接</a></p>\n\n<ol>\n<li><code>git update-index --assume-unchanged &lt;PATH&gt;</code> 执行这个命令，使 本地GIT 不跟踪此文件在本地的变化</li>\n<li>如果修改了此文件，并且需要提交，需要执行 <code>git update-index --no-assume-unchanged &lt;PATH&gt;</code>  使本地GIT 重新跟踪此文件。并通知其他开发人员，拉取代码后重新执行第一步！</li>\n</ol>\n','','.gitignore,追踪,非.gitignore 不追踪在版本库里的文件',0,'web.blog.layouts.post',2449,0,'2017-09-29 03:30:57','2018-06-08 02:56:17','2017-09-29 03:28:11',NULL),(35,'lnmp-unknown-open-basedir-restriction-in-effect','open_basedir restriction in effect 错误解决方案','Lnmp部署时发生 Unknown: open_basedir restriction in effect 错误解决方案','# 日志报错信息\r\n```2017/11/06 15:39:54 [error] 398#0: *4 FastCGI sent in stderr: \"PHP message: PHP Warning:  Unknown: open_basedir restriction in effect. File(/home/wwwroot/chenyanjin.tk/myBlog/public/index.php) is not within the allowed path(s): (/home/wwwroot/default/:/tmp/:/proc/) in Unknown on line 0\r\nPHP message: PHP Warning:  Unknown: failed to open stream: Operation not permitted in Unknown on line 0\r\nUnable to open primary script: /home/wwwroot/chenyanjin.tk/myBlog/public/index.php (Operation not permitted)\" while reading response header from upstream, client: 124.205.124.218, server: chenyanjin.tk, request: \"GET / HTTP/1.1\", upstream: \"fastcgi://unix:/tmp/php-cgi.sock:\", host: \"www.chenyanjin.tk\"\r\n ```\r\n# 错误解决及分析 \r\n>  经过简单百度 google 后， 发现是 open_basedir 配置需要更改。修改为部署网站的目录或者父目录，如当前错误，我的网站文件在 /home/wwwroot/chenyanjin.tk  \r\n原来为```open_basedir=/home/wwwroot/default/:/tmp/:/proc/```   \r\n修改为 ```open_basedir=/home/wwwroot/:/tmp/:/proc/```  \r\n\r\n\r\n两种解决方案\r\n\r\n\r\n1. 修改 php.ini 的  open_basedir\r\n2. 修改 nginx 的 conf/fastcgi.conf 的 open_basedir  \r\n\r\n<a href=\"http://www.bcty365.com/content-10-5850-1.html\" target=\"_blank\">参考链接</a>','<h1>日志报错信息</h1>\n\n<p><code>2017/11/06 15:39:54 [error] 398#0: *4 FastCGI sent in stderr: \"PHP message: PHP Warning:  Unknown: open_basedir restriction in effect. File(/home/wwwroot/chenyanjin.tk/myBlog/public/index.php) is not within the allowed path(s): (/home/wwwroot/default/:/tmp/:/proc/) in Unknown on line 0\nPHP message: PHP Warning:  Unknown: failed to open stream: Operation not permitted in Unknown on line 0\nUnable to open primary script: /home/wwwroot/chenyanjin.tk/myBlog/public/index.php (Operation not permitted)\" while reading response header from upstream, client: 124.205.124.218, server: chenyanjin.tk, request: \"GET / HTTP/1.1\", upstream: \"fastcgi://unix:/tmp/php-cgi.sock:\", host: \"www.chenyanjin.tk\"</code></p>\n\n<h1>错误解决及分析</h1>\n\n<blockquote>\n  <p>经过简单百度 google 后， 发现是 open_basedir 配置需要更改。修改为部署网站的目录或者父目录，如当前错误，我的网站文件在 /home/wwwroot/chenyanjin.tk<br />\n  原来为<code>open_basedir=/home/wwwroot/default/:/tmp/:/proc/</code><br />\n  修改为 <code>open_basedir=/home/wwwroot/:/tmp/:/proc/</code></p>\n</blockquote>\n\n<p>两种解决方案</p>\n\n<ol>\n<li>修改 php.ini 的  open_basedir</li>\n<li>修改 nginx 的 conf/fastcgi.conf 的 open_basedir  </li>\n</ol>\n\n<p><a href=\"http://www.bcty365.com/content-10-5850-1.html\" target=\"_blank\">参考链接</a></p>\n','','Host key verification failed,Lnmp,open_basedir restriction in effec',0,'web.blog.layouts.post',2724,0,'2017-11-07 09:30:12','2017-11-07 09:25:34','2017-11-07 09:25:34',NULL),(36,'ssr','[已失效！！]免费科学上网！SSR 使用教程','墙太高了，一年一度的六一儿童节还是太厉害了','<del> <font color=\"#FF0000\" size = \"6px\">为避免流量损失过快，将屏蔽youtube的访问！生效时间从2018年05月29日10:09:10起，恢复时间待定！(偶尔可以)</font></del>    \r\n#大家好 这是科学上网的教程  二维码在底部  如若二维码失效，请<a href=\"/contact\" target=\"_blank\">联系我!</a>\r\n>首先下载对应的客户端  \r\n安卓  \r\n<del> <a href=\"https://pan.baidu.com/s/1pL60S8j\" target=\"_blank\">百度云下载 点我</a>: 密码: kqy8 </del><a href=\"/files/ssr/android/SSR.apk\" target=\"_blank\">本站下载</a>  \r\nwin  \r\n<a href=\"https://pan.baidu.com/s/1eRFW0Wq\" target=\"_blank\">百度云下载 点我</a>:  密码: t2b2  <a href=\"/files/ssr/window/ShadowsocksR-4.7.0.zip\" target=\"_blank\">本站下载</a>  \r\nmac  \r\n<a href=\"https://pan.baidu.com/s/1kVxf88n\" target=\"_blank\">百度云下载 点我</a> 密码: hh3i    <a href=\"/files/ssr/mac/ShadowsocksX-2.6.3.dmg\" target=\"_blank\">本站下载</a>       \r\n\r\n<font color=\"#FF0000\" size = \"6px\">软件代理模式有多种如全局代理、自动代理，有时候会更多（软件不一样规则不一样），推荐使用 自动代理 、 不代理中国ip、浏览器不代理中国大陆 等等。如果选择全局，会导致 其他软件访问速度变慢！</font>  \r\n\r\n以下是安卓的教程  其他平台类似， 都是通过扫描二维码  \r\n首先打开软件  \r\n![](http://www.chenyanjin.top/uploads/ssr/%E5%AE%89%E5%8D%93%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E1.png)  \r\n![](http://www.chenyanjin.top/uploads/ssr/%E5%AE%89%E5%8D%93%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E2.png)  \r\n\r\n\r\n\r\n>提供1个 ssr 账号 供大家使用，由于流量有限制，请不要看视频～   流量完了  就完了! 如若二维码失效，请<a href=\"/contact\" target=\"_blank\">联系我!</a>  \r\n二维码更新日期2019年03月07日10:23:14  \r\n![第一个图](/uploads/ssr/50165.png)  ','<p><del> <font color=\"#FF0000\" size = \"6px\">为避免流量损失过快，将屏蔽youtube的访问！生效时间从2018年05月29日10:09:10起，恢复时间待定！(偶尔可以)</font></del></p>\n\n<h1>大家好 这是科学上网的教程  二维码在底部  如若二维码失效，请<a href=\"/contact\" target=\"_blank\">联系我!</a></h1>\n\n<blockquote>\n  <p>首先下载对应的客户端<br />\n  安卓<br />\n  <del> <a href=\"https://pan.baidu.com/s/1pL60S8j\" target=\"_blank\">百度云下载 点我</a>: 密码: kqy8 </del><a href=\"/files/ssr/android/SSR.apk\" target=\"_blank\">本站下载</a><br />\n  win<br />\n  <a href=\"https://pan.baidu.com/s/1eRFW0Wq\" target=\"_blank\">百度云下载 点我</a>:  密码: t2b2  <a href=\"/files/ssr/window/ShadowsocksR-4.7.0.zip\" target=\"_blank\">本站下载</a><br />\n  mac<br />\n  <a href=\"https://pan.baidu.com/s/1kVxf88n\" target=\"_blank\">百度云下载 点我</a> 密码: hh3i    <a href=\"/files/ssr/mac/ShadowsocksX-2.6.3.dmg\" target=\"_blank\">本站下载</a></p>\n</blockquote>\n\n<p><font color=\"#FF0000\" size = \"6px\">软件代理模式有多种如全局代理、自动代理，有时候会更多（软件不一样规则不一样），推荐使用 自动代理 、 不代理中国ip、浏览器不代理中国大陆 等等。如果选择全局，会导致 其他软件访问速度变慢！</font></p>\n\n<p>以下是安卓的教程  其他平台类似， 都是通过扫描二维码<br />\n首先打开软件<br />\n<img src=\"http://www.chenyanjin.top/uploads/ssr/%E5%AE%89%E5%8D%93%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E1.png\" alt=\"\" /><br />\n<img src=\"http://www.chenyanjin.top/uploads/ssr/%E5%AE%89%E5%8D%93%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E2.png\" alt=\"\" /></p>\n\n<blockquote>\n  <p>提供1个 ssr 账号 供大家使用，由于流量有限制，请不要看视频～   流量完了  就完了! 如若二维码失效，请<a href=\"/contact\" target=\"_blank\">联系我!</a><br />\n  二维码更新日期2019年03月07日10:23:14<br />\n  <img src=\"/uploads/ssr/50165.png\" alt=\"第一个图\" /></p>\n</blockquote>\n','','                                                                                                                                                                                                                                                               ',0,'web.blog.layouts.post',3436,0,'2017-11-08 09:15:29','2019-06-12 10:01:55','2017-11-08 09:08:13',NULL),(37,'host-key-verification-failed','Host key verification failed','在应用内执行脚本 遇到 Host key verification failed','> 应用背景：通过 GitHub 的 webhook 实现 git push 后，服务器自动更新代码  \r\n通过我的站点提供一个 Url 给 GitHub 回调  这里的站点是基于 Laravel 搭建的博客.  \r\n#关键代码  \r\n```\r\npublic function webhook(Request $request) {  \r\n        Log::info(\"git push 啦  该更新代码啦~\");  \r\n        $data = [];  \r\n        exec(\'/脚本所在的目录/updateGit.sh 2>&1\', $data, $data1);  \r\n        Log::info($data );  \r\n        Log::info($data1);  \r\n        return view(\"success\");  \r\n}\r\n```\r\n\r\n脚本内容  \r\n``` javascript\r\n#!/bin/bash\r\ncd /项目所在的目录/myBlog/ \r\ngit pull\r\n```\r\n执行自动更新脚本时报错  \r\n``` javascript\r\n1 => \'Host key verification failed.\',\r\n2 => \'fatal: The remote end hung up unexpectedly\'\r\n```  \r\n问题的起因是因为当前站点执行脚本时的用户为 www 用户，当前 www 用户的公钥没有配置在 GitHub 上。所以解决方案也很简单，切换到 www 用户，生成 ssh-key 并保存到 GitHub 的 ssk-key 列表即可！  \r\n修改完成后，再次调用  \r\n``` javascript\r\n\'Already up-to-date.\'\r\n```  \r\n大功告成！\r\n','<blockquote>\n  <p>应用背景：通过 GitHub 的 webhook 实现 git push 后，服务器自动更新代码<br />\n  通过我的站点提供一个 Url 给 GitHub 回调  这里的站点是基于 Laravel 搭建的博客.</p>\n</blockquote>\n\n<h1>关键代码</h1>\n\n<pre><code>public function webhook(Request $request) {  \n        Log::info(\"git push 啦  该更新代码啦~\");  \n        $data = [];  \n        exec(\'/脚本所在的目录/updateGit.sh 2&gt;&amp;1\', $data, $data1);  \n        Log::info($data );  \n        Log::info($data1);  \n        return view(\"success\");  \n}\n</code></pre>\n\n<p>脚本内容</p>\n\n<pre><code class=\"javascript\">#!/bin/bash\ncd /项目所在的目录/myBlog/ \ngit pull\n</code></pre>\n\n<p>执行自动更新脚本时报错</p>\n\n<pre><code class=\"javascript\">1 =&gt; \'Host key verification failed.\',\n2 =&gt; \'fatal: The remote end hung up unexpectedly\'\n</code></pre>\n\n<p>问题的起因是因为当前站点执行脚本时的用户为 www 用户，当前 www 用户的公钥没有配置在 GitHub 上。所以解决方案也很简单，切换到 www 用户，生成 ssh-key 并保存到 GitHub 的 ssk-key 列表即可！<br />\n修改完成后，再次调用</p>\n\n<pre><code class=\"javascript\">\'Already up-to-date.\'\n</code></pre>\n\n<p>大功告成！</p>\n','','在应用内执行脚本,Host key verification failed',0,'web.blog.layouts.post',3098,0,'2017-11-14 06:05:11','2017-11-14 06:15:15','2017-11-14 06:15:15',NULL),(38,'elasticsearch','Elasticsearch 经纬度坐标格式','Elasticsearch 经纬度坐标格式，这下再也不怕了忘记了！','>1. 字符串形式以半角逗号分割，如 \"lat,lon\" 。\r\n>2. 对象形式显式命名为 lat 和 lon 。\r\n>3. 数组形式表示为 [lon,lat] 。  \r\n\r\n----\r\n>可能所有人都至少一次踩过这个坑：地理坐标点用字符串形式表示时是纬度在前，经度在后（ \"latitude,longitude\" ），而数组形式表示时是经度在前，纬度在后（ [longitude,latitude] ）—顺序刚好相反。\r\n其实，在 Elasticesearch 内部，不管字符串形式还是数组形式，都是经度在前，纬度在后。不过早期为了适配 GeoJSON 的格式规范，调整了数组形式的表示方式。\r\n因此，在使用地理位置的路上就出现了这么一个“捕熊器”，专坑那些不了解这个陷阱的使用者。  \r\n\r\n<a href=\"https://www.elastic.co/guide/cn/elasticsearch/guide/current/lat-lon-formats.html\" target=\"_blank\">原文链接</a>\r\n','<blockquote>\n  <ol>\n  <li>字符串形式以半角逗号分割，如 &#8220;lat,lon&#8221; 。</li>\n  <li>对象形式显式命名为 lat 和 lon 。</li>\n  <li>数组形式表示为 [lon,lat] 。  </li>\n  </ol>\n</blockquote>\n\n<hr />\n\n<blockquote>\n  <p>可能所有人都至少一次踩过这个坑：地理坐标点用字符串形式表示时是纬度在前，经度在后（ &#8220;latitude,longitude&#8221; ），而数组形式表示时是经度在前，纬度在后（ [longitude,latitude] ）—顺序刚好相反。\n  其实，在 Elasticesearch 内部，不管字符串形式还是数组形式，都是经度在前，纬度在后。不过早期为了适配 GeoJSON 的格式规范，调整了数组形式的表示方式。\n  因此，在使用地理位置的路上就出现了这么一个“捕熊器”，专坑那些不了解这个陷阱的使用者。</p>\n</blockquote>\n\n<p><a href=\"https://www.elastic.co/guide/cn/elasticsearch/guide/current/lat-lon-formats.html\" target=\"_blank\">原文链接</a></p>\n','','ES,Elasticsearch,经纬度',0,'web.blog.layouts.post',2424,0,'2017-11-16 02:41:55','2017-11-16 02:30:00','2017-11-16 02:30:00',NULL),(39,'ssr-1','管理 ssr','ssr 常用的 命令 启动：/etc/init.d/shadowsocks start   停止：/etc/init.d/shadowsocks stop  重启：/etc/init.d/shadowsocks restart   状态：/etc/init.d/shadowsocks status ','使用命令：  \r\n启动：```/etc/init.d/shadowsocks start```  \r\n停止：```/etc/init.d/shadowsocks stop```  \r\n重启：```/etc/init.d/shadowsocks restart```  \r\n状态：```/etc/init.d/shadowsocks status```  \r\n\r\n配置文件路径：```/etc/shadowsocks.json```  \r\n日志文件路径：```/var/log/shadowsocks.log```  \r\n安装路径：```/usr/local/shadowsocks/shadowsoks```  \r\n\r\n执行脚本```vi /etc/shadowsocks.json```，进入vi编辑器，编辑配置文件  \r\n按```i```（英文状态下的i）进入编辑状态，用方向键将指针调到相应位置删除旧密码，改成新密码。  \r\n编辑完成后，依次按```esc : wq ```回车。（执行完后文件就已经保存，并退出到命令页面了）  \r\n最后重启ssr即可```/etc/init.d/shadowsocks restart```','<p>使用命令：<br />\n启动：<code>/etc/init.d/shadowsocks start</code><br />\n停止：<code>/etc/init.d/shadowsocks stop</code><br />\n重启：<code>/etc/init.d/shadowsocks restart</code><br />\n状态：<code>/etc/init.d/shadowsocks status</code></p>\n\n<p>配置文件路径：<code>/etc/shadowsocks.json</code><br />\n日志文件路径：<code>/var/log/shadowsocks.log</code><br />\n安装路径：<code>/usr/local/shadowsocks/shadowsoks</code></p>\n\n<p>执行脚本<code>vi /etc/shadowsocks.json</code>，进入vi编辑器，编辑配置文件<br />\n按<code>i</code>（英文状态下的i）进入编辑状态，用方向键将指针调到相应位置删除旧密码，改成新密码。<br />\n编辑完成后，依次按<code>esc : wq</code>回车。（执行完后文件就已经保存，并退出到命令页面了）<br />\n最后重启ssr即可<code>/etc/init.d/shadowsocks restart</code></p>\n','','SSR,SSR常用命令',0,'web.blog.layouts.post',2720,0,'2017-11-28 09:14:58','2017-11-28 10:12:34','2017-11-28 10:12:34',NULL),(40,'mac','Mac 下自动启动和关闭程序的脚本','通过 Vagex 的 firefox 插件刷积分，遇到一个问题，插件假死，需要重启火狐，不能人工一直看，so 写了一个脚本，加入到的 crontab 让系统自动监控','> 应用背景：通过 Vagex 的 firefox 插件刷积分，遇到一个问题，插件假死，需要重启火狐，不能人工一直看，so 写了一个脚本，加入到的 crontab 让系统自动监控    \r\n \r\n```shell\r\n# 此脚本用于 自动重启火狐浏览器 nothing more\r\n\r\n# 脚本所在目录 此参数之后可以 当成脚本参数传递\r\ndir=/Users/chen/Desktop/mySh\r\n#  脚本执行日志路径文件名称 此参数之后可以 当成脚本参数传递\r\nlogPath=${dir}/firefox.log\r\n# 启动的程序 此参数之后可以 当成脚本参数传递\r\napp=/Applications/Firefox.app\r\n# grep 启动程序的 关键字 一定要很准确 确保 结果最好只有一个 此参数之后可以 当成脚本参数传递\r\ngrepAppName=firefox\r\n\r\ndate=`date +%Y-%m-%d:%H:%M:%S`\r\nhour=`date +%H`\r\napp=/Applications/Firefox.app\r\necho \'-------------------------------------------------------\' >> ${logPath}\r\necho $date\' 启动脚本\' >> ${logPath}\r\n\r\n# 杀死火狐\r\npkill -f ${grepAppName}\r\necho $date\' 杀死进程\' >> ${logPath}\r\n\r\nif [ $hour -ge 10 -a $hour -lt 13 ]\r\nthen\r\n    echo $date\' 当前时间 不执行 免得浪费流量 10点-13点 赚不到东西\' >> ${logPath}\r\n    echo \'-------------------------------------------------------\\n\'  >> ${logPath}\r\n    exit 0\r\nfi\r\n\r\n\r\nif test ! -w ${logPath}\r\nthen\r\n    touch ${logPath}\r\n    chmod 777 ${logPath}\r\nfi\r\n\r\n# 第一次启动\r\nopen -j ${app} >> ${logPath} 2>&1\r\nisRetry=0\r\nfunction start(){\r\n        pid=`pgrep -f ${grepAppName}`\r\n        if test -z $pid\r\n        then       \r\n               date=`date +%Y-%m-%d:%H:%M:%S`\r\n               echo $date\' 当前没有进程号\' >> ${logPath}\r\n               \r\n               if [ $isRetry == 1 ]\r\n               then\r\n                     echo $date\' 重试启动脚本失败 开始重试\' >> ${logPath}\r\n               fi\r\n               open -j ${app} >> ${logPath} 2>&1\r\n               isRetry=1\r\n               start\r\n        else\r\n               date=`date +%Y-%m-%d:%H:%M:%S`\r\n               if [ $isRetry == 1 ]\r\n               then\r\n                   echo $date\' 重试启动成功\' >> ${logPath}\r\n               else\r\n                   echo $date\' 没有错误\' >> ${logPath}\r\n               fi\r\n               echo $date\' 启动成功 PID 存在\'$pid >> ${logPath}\r\n        fi\r\n      \r\n}\r\n# 调用方法\r\nstart\r\n#检测网络链接&&ftp上传数据    \r\nfunction networkAndFtp()    \r\n{    \r\n    #超时时间    \r\n    timeout=5    \r\n        \r\n    #目标网站    \r\n    target=www.baidu.com    \r\n    \r\n    #获取响应状态码    \r\n    ret_code=`curl -I -s --connect-timeout $timeout $target -w %{http_code} | tail -n1`    \r\n    \r\n    date=`date +%Y-%m-%d:%H:%M:%S`\r\n    ctype=\'执行前\'\r\n    if [ \"x$ret_code\" = \"x200\" ]; then   \r\n\r\n        ctype=\'网络畅通\'\r\n    else    \r\n        ctype=\'网络不畅通\'    \r\n\r\n    fi  \r\n    echo $date\" $ctype\" >> ${logPath}\r\n}  \r\nnetworkAndFtp\r\n\r\necho \'-------------------------------------------------------\\n\'  >> ${logPath}\r\n```','<blockquote>\n  <p>应用背景：通过 Vagex 的 firefox 插件刷积分，遇到一个问题，插件假死，需要重启火狐，不能人工一直看，so 写了一个脚本，加入到的 crontab 让系统自动监控</p>\n</blockquote>\n\n<pre><code class=\"shell\"># 此脚本用于 自动重启火狐浏览器 nothing more\n\n# 脚本所在目录 此参数之后可以 当成脚本参数传递\ndir=/Users/chen/Desktop/mySh\n#  脚本执行日志路径文件名称 此参数之后可以 当成脚本参数传递\nlogPath=${dir}/firefox.log\n# 启动的程序 此参数之后可以 当成脚本参数传递\napp=/Applications/Firefox.app\n# grep 启动程序的 关键字 一定要很准确 确保 结果最好只有一个 此参数之后可以 当成脚本参数传递\ngrepAppName=firefox\n\ndate=`date +%Y-%m-%d:%H:%M:%S`\nhour=`date +%H`\napp=/Applications/Firefox.app\necho \'-------------------------------------------------------\' &gt;&gt; ${logPath}\necho $date\' 启动脚本\' &gt;&gt; ${logPath}\n\n# 杀死火狐\npkill -f ${grepAppName}\necho $date\' 杀死进程\' &gt;&gt; ${logPath}\n\nif [ $hour -ge 10 -a $hour -lt 13 ]\nthen\n    echo $date\' 当前时间 不执行 免得浪费流量 10点-13点 赚不到东西\' &gt;&gt; ${logPath}\n    echo \'-------------------------------------------------------\\n\'  &gt;&gt; ${logPath}\n    exit 0\nfi\n\n\nif test ! -w ${logPath}\nthen\n    touch ${logPath}\n    chmod 777 ${logPath}\nfi\n\n# 第一次启动\nopen -j ${app} &gt;&gt; ${logPath} 2&gt;&amp;1\nisRetry=0\nfunction start(){\n        pid=`pgrep -f ${grepAppName}`\n        if test -z $pid\n        then       \n               date=`date +%Y-%m-%d:%H:%M:%S`\n               echo $date\' 当前没有进程号\' &gt;&gt; ${logPath}\n\n               if [ $isRetry == 1 ]\n               then\n                     echo $date\' 重试启动脚本失败 开始重试\' &gt;&gt; ${logPath}\n               fi\n               open -j ${app} &gt;&gt; ${logPath} 2&gt;&amp;1\n               isRetry=1\n               start\n        else\n               date=`date +%Y-%m-%d:%H:%M:%S`\n               if [ $isRetry == 1 ]\n               then\n                   echo $date\' 重试启动成功\' &gt;&gt; ${logPath}\n               else\n                   echo $date\' 没有错误\' &gt;&gt; ${logPath}\n               fi\n               echo $date\' 启动成功 PID 存在\'$pid &gt;&gt; ${logPath}\n        fi\n\n}\n# 调用方法\nstart\n#检测网络链接&amp;&amp;ftp上传数据    \nfunction networkAndFtp()    \n{    \n    #超时时间    \n    timeout=5    \n\n    #目标网站    \n    target=www.baidu.com    \n\n    #获取响应状态码    \n    ret_code=`curl -I -s --connect-timeout $timeout $target -w %{http_code} | tail -n1`    \n\n    date=`date +%Y-%m-%d:%H:%M:%S`\n    ctype=\'执行前\'\n    if [ \"x$ret_code\" = \"x200\" ]; then   \n\n        ctype=\'网络畅通\'\n    else    \n        ctype=\'网络不畅通\'    \n\n    fi  \n    echo $date\" $ctype\" &gt;&gt; ${logPath}\n}  \nnetworkAndFtp\n\necho \'-------------------------------------------------------\\n\'  &gt;&gt; ${logPath}\n</code></pre>\n','','mac,shell,自动启动,定时关闭,定时重启\r\n                ',0,'web.blog.layouts.post',2253,0,'2017-11-29 05:51:55','2017-11-29 06:00:00','2017-11-29 06:00:00',NULL),(41,'5','正则表达式批量替换注释','正则表达式批量替换注释，通过 Idea 自带的正则替换修改 实体属性的注释','>正则  \r\n给字段添加注解 针对jpa  \r\n查找：``` (private .*) (.*);```  \r\n替换：```@Column(name = \"$2\")\\n\\t$1 $2;```   \r\n驼峰转蛇形  \r\n查找：```(@Column\\(name = \".*)([A-Z])(.*)```  \r\n替换：```$1_\\L$2$3```   \r\n\r\n>正则  \r\n将注解信息的 message 转为注释  \r\n查找：``` @ApiModelProperty\\(value = \"(.*)\"\\)```  \r\n替换：```/** * $1 */\\n$0```   \r\n\r\n>正则  \r\n将注释 message 转为注解信息  \r\n查找：``` /\\*\\*\\n.*\\*(.*)\\n.*/```  \r\n替换：```@ApiModelProperty(value = \"$1\")```   \r\n\r\n> 单行 if 没有加大括号  \r\n（有可能会影响一些单行的语句，执行格式化后并检查一下确保准确无误）  \r\n查找：``` (if[ ]*\\(.*\\))[ ]*(.*;)```  \r\n替换：```$1{\\n            $2\\n        }```    \r\n\r\n大写转小写\r\n\r\nsearch: [A-Z]\r\n\r\nreplace: \\L$0\r\n\r\n \r\n\r\n小写转大写\r\n\r\nsearch: [a-z]\r\n\r\nreplace: \\U$0','<blockquote>\n  <p>正则<br />\n  给字段添加注解 针对jpa<br />\n  查找：<code>(private .*) (.*);</code><br />\n  替换：<code>@Column(name = \"$2\")\\n\\t$1 $2;</code><br />\n  驼峰转蛇形<br />\n  查找：<code>(@Column\\(name = \".*)([A-Z])(.*)</code><br />\n  替换：<code>$1_\\L$2$3</code></p>\n  \n  <p>正则<br />\n  将注解信息的 message 转为注释<br />\n  查找：<code>@ApiModelProperty\\(value = \"(.*)\"\\)</code><br />\n  替换：<code>/** * $1 */\\n$0</code></p>\n  \n  <p>正则<br />\n  将注释 message 转为注解信息<br />\n  查找：<code>/\\*\\*\\n.*\\*(.*)\\n.*/</code><br />\n  替换：<code>@ApiModelProperty(value = \"$1\")</code></p>\n  \n  <p>单行 if 没有加大括号<br />\n  （有可能会影响一些单行的语句，执行格式化后并检查一下确保准确无误）<br />\n  查找：<code>(if[ ]*\\(.*\\))[ ]*(.*;)</code><br />\n  替换：<code>$1{\\n            $2\\n        }</code></p>\n</blockquote>\n\n<p>大写转小写</p>\n\n<p>search: [A-Z]</p>\n\n<p>replace: \\L$0</p>\n\n<p>小写转大写</p>\n\n<p>search: [a-z]</p>\n\n<p>replace: \\U$0</p>\n','','正则,正则表达式,IDEA,正则批量替换',0,'web.blog.layouts.post',2257,0,'2017-12-01 08:02:00','2020-03-11 11:11:51','2017-12-01 08:00:00',NULL),(42,'hosts-ping-ip','修改 hosts 不生效，但是 ping 出来的 ip 却是对的！','修改 hosts 不生效，但是 ping 出来的 ip 却是对的！找了半天，原来是代理软件的问题~','>如题，由于某种不可告人的原因，需要屏蔽 youtube 整个站点，思路是在 hosts 加上  \r\n```127.0.0.1 www.youtube.com```  \r\n>加上之后，在浏览器访问，WTF！！ 顺畅无比~~  什么鬼！  \r\n#调式第一步：```ping www.youtube.com```   \r\n```PING www.youtube.com (127.0.0.1): 56 data bytes\r\n64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.067 ms  \r\n64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.055 ms  \r\n64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.044 ms  \r\n64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.071 ms```  \r\n没有毛病啊！！！难道是浏览器问题？？   \r\n#第二步：更换不同的浏览器  \r\n火狐、Safari、谷歌，都顺畅无比！！！  看来不是浏览器的问题\r\n#第三步：百度~  \r\n经过百度得知答案，由于本机使用了 ShadowSocks 的代理，所以优先走代理（浏览器优先走代理，所以 ping 看不出问题），最后才会走 hosts 文件。  \r\n<font color=\"#FF0000\" size = \"6px\">所以思路是修改软件的配置文件，修改代理软件的配置，使站点不通过代理</font> (由于不同的代理软件，修改不一样，这里只说当前代理的解决方法)    \r\n教程视频：\r\n<iframe width=\"560\" height=\"315\" src=\"http://p0600bn1n.bkt.clouddn.com/QQ20171212-165001-HD.mp4\" frameborder=\"0\" allowfullscreen></iframe>\r\n','<blockquote>\n  <p>如题，由于某种不可告人的原因，需要屏蔽 youtube 整个站点，思路是在 hosts 加上<br />\n  <code>127.0.0.1 www.youtube.com</code><br />\n  加上之后，在浏览器访问，WTF！！ 顺畅无比~~  什么鬼！</p>\n</blockquote>\n\n<h1>调式第一步：<code>ping www.youtube.com</code></h1>\n\n<p><code>PING www.youtube.com (127.0.0.1): 56 data bytes\n64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.067 ms  \n64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.055 ms  \n64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.044 ms  \n64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.071 ms</code><br />\n没有毛病啊！！！难道是浏览器问题？？</p>\n\n<h1>第二步：更换不同的浏览器</h1>\n\n<p>火狐、Safari、谷歌，都顺畅无比！！！  看来不是浏览器的问题</p>\n\n<h1>第三步：百度~</h1>\n\n<p>经过百度得知答案，由于本机使用了 ShadowSocks 的代理，所以优先走代理（浏览器优先走代理，所以 ping 看不出问题），最后才会走 hosts 文件。<br />\n<font color=\"#FF0000\" size = \"6px\">所以思路是修改软件的配置文件，修改代理软件的配置，使站点不通过代理</font> (由于不同的代理软件，修改不一样，这里只说当前代理的解决方法)<br />\n教程视频：</p>\n\n<iframe width=\"560\" height=\"315\" src=\"http://p0600bn1n.bkt.clouddn.com/QQ20171212-165001-HD.mp4\" frameborder=\"0\" allowfullscreen></iframe>\n','','',0,'web.blog.layouts.post',2537,0,'2017-12-12 08:46:10','2017-12-12 08:45:00','2017-12-12 08:45:00',NULL),(43,'laravel-github-webhook','Laravel 使用 Github webhook 回调自动部署，回调验证方法','使用 Github 提供的钩子，当代码 push 到远程后回调到服务器实现自动部署，并且实现加密验证','>由于 github 官网给出的例子不是 PHP 的，所以呢，写下了这篇文章！<a href=\"https://developer.github.com/webhooks/securing/\" target=\"_blank\">官网地址</a>  \r\n>话不多说 直接上代码  \r\n```\r\n    public function gitWebhook(Request $request) {\r\n        $requestData = $request->header(\"X-Hub-Signature\");\r\n        //123456 是在 github 设置的\r\n        $hash = \"sha1=\" . hash_hmac(\'sha1\', $request->getContent(), \"123456\"); \r\n        if (strcmp($signature, $hash) == 0) {\r\n            Log::info(\"验证成功\");\r\n        }\r\n    }\r\n```  \r\n>代码中的 ```123456``` 为下图中的 Secret  \r\n![示例](http://p0600bn1n.bkt.clouddn.com/webhook.png) ','<blockquote>\n  <p>由于 github 官网给出的例子不是 PHP 的，所以呢，写下了这篇文章！<a href=\"https://developer.github.com/webhooks/securing/\" target=\"_blank\">官网地址</a><br />\n  话不多说 直接上代码</p>\n</blockquote>\n\n<pre><code>    public function gitWebhook(Request $request) {\n        $requestData = $request-&gt;header(\"X-Hub-Signature\");\n        //123456 是在 github 设置的\n        $hash = \"sha1=\" . hash_hmac(\'sha1\', $request-&gt;getContent(), \"123456\"); \n        if (strcmp($signature, $hash) == 0) {\n            Log::info(\"验证成功\");\n        }\n    }\n</code></pre>\n\n<blockquote>\n  <p>代码中的 <code>123456</code> 为下图中的 Secret<br />\n  <img src=\"http://p0600bn1n.bkt.clouddn.com/webhook.png\" alt=\"示例\" /></p>\n</blockquote>\n','','',0,'web.blog.layouts.post',2871,0,'2017-12-21 04:28:40','2017-12-21 05:25:42','2017-12-21 05:25:42',NULL),(44,'java','Java学习相关书籍电子书','不能太松懈，多学习','>Java编程思想  (《Thinking In Java》)  <a href=\"https://pan.baidu.com/s/1nwHeBNV\" target=\"_Blank\">点击下载</a> 密码:  链接: https://pan.baidu.com/s/1nwHeBNV 密码: gfhf\r\n \r\n>大话设计模式\r\n\r\n重构 改善既有代码的设计\r\n\r\neffective java\r\n\r\n深入理解Java虚拟机\r\n\r\nJava并发编程实战\r\n\r\n深入理解计算机系统\r\n\r\ntcp/ip详解 卷一、二、三\r\n\r\n数据结构与算法','<blockquote>\n  <p>Java编程思想  (《Thinking In Java》)  <a href=\"https://pan.baidu.com/s/1nwHeBNV\" target=\"_Blank\">点击下载</a> 密码:  链接: https://pan.baidu.com/s/1nwHeBNV 密码: gfhf</p>\n  \n  <p>大话设计模式</p>\n</blockquote>\n\n<p>重构 改善既有代码的设计</p>\n\n<p>effective java</p>\n\n<p>深入理解Java虚拟机</p>\n\n<p>Java并发编程实战</p>\n\n<p>深入理解计算机系统</p>\n\n<p>tcp/ip详解 卷一、二、三</p>\n\n<p>数据结构与算法</p>\n','','',0,'web.blog.layouts.post',1981,0,'2018-01-25 03:25:11','2018-01-25 04:00:00','2018-01-25 04:00:00',NULL),(45,'java0','Java如果小数点后面是0不显示小数点','Java如果小数点后面是0不显示小数点','>思路是 对浮点型数字对1求余，如果等于0说明小数点后面都是0。  \r\n```\r\n        double d = 123.1;\r\n        if (d % 1 == 0) {\r\n            // 转为 int 类型就没有小数点后面的了\r\n        }  \r\n```','<blockquote>\n  <p>思路是 对浮点型数字对1求余，如果等于0说明小数点后面都是0。</p>\n</blockquote>\n\n<pre><code>        double d = 123.1;\n        if (d % 1 == 0) {\n            // 转为 int 类型就没有小数点后面的了\n        }  \n</code></pre>\n','','',0,'web.blog.layouts.post',1866,0,'2018-01-26 09:52:03','2018-01-26 10:00:00','2018-01-26 10:00:00',NULL),(46,'mysqlselectif','Mysql在select里使用if语句','sum() 、count() 类型的都可以使用','>exp1等于true后会使用exp2，等于false会使用exp3  \r\n```select count(if (exp1, exp2, exp3)) from xxx;```\r\n','<blockquote>\n  <p>exp1等于true后会使用exp2，等于false会使用exp3<br />\n  <code>select count(if (exp1, exp2, exp3)) from xxx;</code></p>\n</blockquote>\n','','',0,'web.blog.layouts.post',2008,0,'2018-02-08 03:04:29','2018-02-08 03:00:00','2018-02-08 03:00:00',NULL),(47,'mysqlselect','Mysql常用的SQL','又一次忘了，写博客里吧','>更新  \r\n```update b, (select * from a) as ali set b.name = ali.name where b.a_id = ali.id;```  \r\n\r\n>插入  \r\n```INSERT INTO ucenter_owner_voucher_template(`owner_id`, `type`, `create_pin`, `update_pin`)\r\nSELECT owner_id, 1, \'[系统]\', \'[系统]\' FROM ucenter_owner where owner_id not in (select owner_id from  ucenter_owner_voucher_template where `type` = 1);```   \r\n\r\n>统计每个表的数据大小  \r\n```select table_name, round((data_length+index_length)/1024/1024,2), concat(round((data_length+index_length)/1024/1024,2),\'MB\')  from information_schema.tables \r\nwhere table_schema=\'neuron_basic\' group by table_name;```  \r\n\r\n>字符截取  \r\n```select substring_index(name_path, \",\", 1), substring_index(substring_index(name_path, \",\", -2), \",\", 1), substring_index(substring_index(name_path, \",\", -1), \",\", 1)from common_region;```\r\n \r\n  ','<blockquote>\n  <p>更新<br />\n  <code>update b, (select * from a) as ali set b.name = ali.name where b.a_id = ali.id;</code></p>\n  \n  <p>插入<br />\n  <code>INSERT INTO ucenter_owner_voucher_template(`owner_id`, `type`, `create_pin`, `update_pin`)\n  SELECT owner_id, 1, \'[系统]\', \'[系统]\' FROM ucenter_owner where owner_id not in (select owner_id from  ucenter_owner_voucher_template where `type` = 1);</code></p>\n  \n  <p>统计每个表的数据大小<br />\n  <code>select table_name, round((data_length+index_length)/1024/1024,2), concat(round((data_length+index_length)/1024/1024,2),\'MB\')  from information_schema.tables \n  where table_schema=\'neuron_basic\' group by table_name;</code></p>\n  \n  <p>字符截取<br />\n  <code>select substring_index(name_path, \",\", 1), substring_index(substring_index(name_path, \",\", -2), \",\", 1), substring_index(substring_index(name_path, \",\", -1), \",\", 1)from common_region;</code></p>\n</blockquote>\n','','',0,'web.blog.layouts.post',1744,0,'2018-03-07 09:30:05','2019-12-11 07:28:14','2018-03-07 09:30:00',NULL),(48,'git-patch-patch','如何使用git 生成patch 和打入patch','merge出错最好的解决方法，','#如何使用git 生成patch 和打入patch    \r\n>只需要5步即可，一下操作均在项目根目录\r\n1. 例如首先先通过git log 查看有哪一些commit  \r\n2. 挑选需要patch的版本号  \r\n3. ```git format-patch -1 版本号```  生成指定版本号的```patch文件```，-1是参数，此处参数有多种使用方法。请参考<a href=\"https://blog.csdn.net/liuhaomatou/article/details/54410361\" target=\"_blank\">原文</a>  \r\n4. ```git am --abort```，放弃掉以前的am信息，避免出错。  \r\n5. ```git am patch文件```   \r\n大功告成\r\n\r\n\r\n参考自：<a href=\"https://blog.csdn.net/liuhaomatou/article/details/54410361\" target=\"_blank\">原文链接</a>','<h1>如何使用git 生成patch 和打入patch</h1>\n\n<blockquote>\n  <p>只需要5步即可，一下操作均在项目根目录\n  1. 例如首先先通过git log 查看有哪一些commit<br />\n  2. 挑选需要patch的版本号<br />\n  3. <code>git format-patch -1 版本号</code>  生成指定版本号的<code>patch文件</code>，-1是参数，此处参数有多种使用方法。请参考<a href=\"https://blog.csdn.net/liuhaomatou/article/details/54410361\" target=\"_blank\">原文</a><br />\n  4. <code>git am --abort</code>，放弃掉以前的am信息，避免出错。<br />\n  5. <code>git am patch文件</code><br />\n  大功告成</p>\n</blockquote>\n\n<p>参考自：<a href=\"https://blog.csdn.net/liuhaomatou/article/details/54410361\" target=\"_blank\">原文链接</a></p>\n','','',0,'web.blog.layouts.post',1639,0,'2018-06-05 02:28:44','2018-06-05 02:30:00','2018-06-05 02:30:00',NULL),(49,'idea','IDEA控制台中文乱码','IDEA控制台中文乱码两种解决方法','>有两种解决方法\r\n  \r\n1.修改```tomat```根目录中```bin```下的```catalina.sh```，添加一行```JAVA_OPTS=\"$JAVA_OPTS -Dfile.encoding=UTF-8 -Xms1024M -Xmx1024M -XX:PermSize=256M -XX:MaxNewSize=256M -XX:MaxPermSize=256M\"```，其中生效的是``` -Dfile.encoding=UTF-8```，如果原来的有这一行，则只需要加``` -Dfile.encoding=UTF-8```即可生效  \r\n\r\n2.修改```Configurations```中的```VM options```的值添加``` -Dfile.encoding=UTF-8```一项即可生效','<blockquote>\n  <p>有两种解决方法</p>\n</blockquote>\n\n<p>1.修改<code>tomat</code>根目录中<code>bin</code>下的<code>catalina.sh</code>，添加一行<code>JAVA_OPTS=\"$JAVA_OPTS -Dfile.encoding=UTF-8 -Xms1024M -Xmx1024M -XX:PermSize=256M -XX:MaxNewSize=256M -XX:MaxPermSize=256M\"</code>，其中生效的是<code>-Dfile.encoding=UTF-8</code>，如果原来的有这一行，则只需要加<code>-Dfile.encoding=UTF-8</code>即可生效</p>\n\n<p>2.修改<code>Configurations</code>中的<code>VM options</code>的值添加<code>-Dfile.encoding=UTF-8</code>一项即可生效</p>\n','','',0,'web.blog.layouts.post',1411,0,'2018-08-07 10:22:43','2018-08-07 10:22:43','2018-08-07 11:14:50',NULL),(50,'rediskey','Redis批量删除Key','有密码和无密码','>进入redis的bin目录  \r\n有密码：  ```./redis-cli -a 密码 keys \"要删除的key\" | xargs ./redis-cli -a 密码 del```   \r\n无密码： ```./redis-cli keys \"要删除的key\" | xargs ./redis-cli  del```   ','<blockquote>\n  <p>进入redis的bin目录<br />\n  有密码：  <code>./redis-cli -a 密码 keys \"要删除的key\" | xargs ./redis-cli -a 密码 del</code><br />\n  无密码： <code>./redis-cli keys \"要删除的key\" | xargs ./redis-cli  del</code></p>\n</blockquote>\n','','',0,'web.blog.layouts.post',880,0,'2019-01-16 08:01:13','2019-01-16 08:01:13','2019-01-16 08:00:00',NULL),(51,'mysqldiff','Mysqldiff遇到的坑','绝世大坑， mysqldiff 不能使用有限制的账号','>脚本命令  \r\n\r\n```\r\nmysqldiff --server1=xxx:\"xxx\"@192.168.125.223:3306 --server2=xxx:\"xxxxx\"@192.168.125.223:3306 --difftype=sql onlinexxxx:xxxx.xxxx --changes-for=server2 \r\n```\r\n>结果  \r\n\r\n```\r\n# WARNING: Using a password on the command line interface can be insecure.\r\n# server1 on 192.168.125.223: ... connected.\r\n# server2 on 192.168.125.223: ... connected.\r\nERROR: Query failed. 1142 (42000): SELECT command denied to user \'xxxxx\'@\'192.168.125.16\' for table \'proc\'\r\n```\r\n>什么鬼！？ 怎么抛出这样的错误？  挣扎了一晚上，发现换一个NB一点的mysql账号，就解决问题了。','<blockquote>\n  <p>脚本命令</p>\n</blockquote>\n\n<pre><code>mysqldiff --server1=xxx:\"xxx\"@192.168.125.223:3306 --server2=xxx:\"xxxxx\"@192.168.125.223:3306 --difftype=sql onlinexxxx:xxxx.xxxx --changes-for=server2 \n</code></pre>\n\n<blockquote>\n  <p>结果</p>\n</blockquote>\n\n<pre><code># WARNING: Using a password on the command line interface can be insecure.\n# server1 on 192.168.125.223: ... connected.\n# server2 on 192.168.125.223: ... connected.\nERROR: Query failed. 1142 (42000): SELECT command denied to user \'xxxxx\'@\'192.168.125.16\' for table \'proc\'\n</code></pre>\n\n<blockquote>\n  <p>什么鬼！？ 怎么抛出这样的错误？  挣扎了一晚上，发现换一个NB一点的mysql账号，就解决问题了。</p>\n</blockquote>\n','','Mysqldiff',0,'web.blog.layouts.post',727,0,'2019-05-24 04:25:07','2019-05-24 04:25:07','2019-05-24 04:30:00',NULL),(52,'lock-wait-timeout-exceeded-try-restarting-transaction','Lock wait timeout exceeded; try restarting transaction解决方法','记录','>常用sql\r\n\r\n#查询当前执行的sql  \r\nSHOW FULL PROCESSLIST;\r\n\r\n#查询当前引擎的状态  \r\nSHOW ENGINE INNODB STATUS;\r\n\r\n#查询当前执行的事务  \r\nSELECT * FROM INFORMATION_SCHEMA.INNODB_TRX;\r\n\r\n#查询当前的锁  \r\nSELECT * FROM INFORMATION_SCHEMA.INNODB_LOCKS;\r\n\r\n#锁等待的对应关系  \r\nSELECT * FROM information_schema.INNODB_LOCK_waits;\r\n\r\n#查询事务是否自动提交  \r\nSELECT @@autocommit;\r\n\r\n#查询当前使用的是我隔离级别  \r\nSELECT @@tx_isolation;\r\n\r\n#查询当前使用的bin log  \r\nSHOW MASTER STATUS;\r\n\r\n\r\nLock wait timeout exceeded; try restarting transaction 当报这个错误有以下解决方案：  \r\n1 首先执行SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX; 查看执行的sql对应的是那个事务！  \r\n2 然后执行SELECT * FROM information_schema.INNODB_LOCK_waits;查看这个事务在等那个事务的锁！  \r\n3 然后执行SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX; 查看在等的事务的trx_mysql_thread_id（也可以看下trx_started事务开始时间是不是过去很长时间了）！  \r\n4 最后执行KILL 811; (trx_mysql_thread_id) 将这个事务kill调！\r\n\r\n\r\n','<blockquote>\n  <p>常用sql</p>\n</blockquote>\n\n<h1>查询当前执行的sql</h1>\n\n<p>SHOW FULL PROCESSLIST;</p>\n\n<h1>查询当前引擎的状态</h1>\n\n<p>SHOW ENGINE INNODB STATUS;</p>\n\n<h1>查询当前执行的事务</h1>\n\n<p>SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX;</p>\n\n<h1>查询当前的锁</h1>\n\n<p>SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCKS;</p>\n\n<h1>锁等待的对应关系</h1>\n\n<p>SELECT * FROM information_schema.INNODB_LOCK_waits;</p>\n\n<h1>查询事务是否自动提交</h1>\n\n<p>SELECT @@autocommit;</p>\n\n<h1>查询当前使用的是我隔离级别</h1>\n\n<p>SELECT @@tx_isolation;</p>\n\n<h1>查询当前使用的bin log</h1>\n\n<p>SHOW MASTER STATUS;</p>\n\n<p>Lock wait timeout exceeded; try restarting transaction 当报这个错误有以下解决方案：<br />\n1 首先执行SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX; 查看执行的sql对应的是那个事务！<br />\n2 然后执行SELECT * FROM information_schema.INNODB_LOCK_waits;查看这个事务在等那个事务的锁！<br />\n3 然后执行SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX; 查看在等的事务的trx_mysql_thread_id（也可以看下trx_started事务开始时间是不是过去很长时间了）！<br />\n4 最后执行KILL 811; (trx_mysql_thread_id) 将这个事务kill调！</p>\n','','',0,'web.blog.layouts.post',370,0,'2019-07-12 02:13:17','2019-07-12 02:53:43','2019-07-12 02:15:00',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s`
--

DROP TABLE IF EXISTS `s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s` (
  `s` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学号',
  `sn` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '学员姓名',
  `age` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识，0-未删除 1-已删除。',
  PRIMARY KEY (`s`),
  KEY `idx_sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s`
--

LOCK TABLES `s` WRITE;
/*!40000 ALTER TABLE `s` DISABLE KEYS */;
INSERT INTO `s` VALUES (1,'陈彦瑾',23),(2,'陈冰冰',25);
/*!40000 ALTER TABLE `s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc`
--

DROP TABLE IF EXISTS `sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学号',
  `s` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学号',
  `c` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程编号',
  `g` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `idx_s` (`s`),
  KEY `idx_c` (`c`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc`
--

LOCK TABLES `sc` WRITE;
/*!40000 ALTER TABLE `sc` DISABLE KEYS */;
INSERT INTO `sc` VALUES (1,1,1,80),(2,1,2,59),(3,2,1,67),(4,2,2,99),(5,1,3,59),(6,1,4,40),(7,2,3,45),(8,2,4,58),(9,3,1,0);
/*!40000 ALTER TABLE `sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blog.layouts.index',
  `reverse_direction` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_unique` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (6,'Git','Git','Git','contact-bg.jpg','            \r\n        Git相关啦','blog.layouts.index',0,'2016-09-08 07:46:48','2016-09-08 07:46:48',NULL),(7,'Laravel','Laravel 5.1','Laravel 5.1','home-bg.jpg','            \r\n        Laravel相关的啦','blog.layouts.index',0,'2016-09-08 07:47:15','2016-09-08 07:47:15',NULL),(8,'Mysql','Mysql','Mysql','post-bg.jpg','            Mysql\r\n        ','blog.layouts.index',0,'2016-09-08 07:47:54','2016-09-08 07:47:54',NULL),(9,'Nginx','Nginx','Nginx','post-sample-image.jpg','','blog.layouts.index',0,'2017-11-07 09:12:57','2017-11-07 09:25:26',NULL),(10,'PHP','PHP','PHP','','            \r\n        ','blog.layouts.index',0,'2017-11-07 09:40:20','2017-11-07 09:40:20',NULL),(11,'科学上网','科学上网','科学上网','','            \r\n        科学上网','blog.layouts.index',0,'2017-11-08 09:08:09','2017-11-08 09:08:09',NULL),(12,'Elasticsearch','Elasticsearch','Elasticsearch','','Elasticsearch\r\n        ','blog.layouts.index',0,'2017-11-16 02:39:43','2017-11-16 02:39:43',NULL),(13,'Java','Java','Java','','            \r\n        Java','blog.layouts.index',0,'2017-11-16 02:39:54','2017-11-16 02:39:54',NULL),(14,'Shell','Shell','Shell','','一些常用的脚本','blog.layouts.index',0,'2017-11-29 05:46:43','2017-11-29 05:46:43',NULL),(15,'正则表达式','正则表达式','正则表达式','','            \r\n        日常正则表达式','blog.layouts.index',0,'2017-12-01 08:00:08','2017-12-01 08:00:08',NULL),(16,'hosts','hosts','hosts','','hosts文件相关','blog.layouts.index',0,'2017-12-12 08:31:20','2017-12-12 08:31:20',NULL),(17,'Redis','Redis','Redis','','                        \r\n        \r\n        Redis','blog.layouts.index',0,'2019-01-16 07:58:07','2019-01-16 07:58:07',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user1`
--

DROP TABLE IF EXISTS `user1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `over` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user1`
--

LOCK TABLES `user1` WRITE;
/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
INSERT INTO `user1` VALUES (1,'唐僧','旃檀功德佛'),(2,'沙僧','金身罗汉菩萨'),(3,'白龙马','八部天龙'),(4,'孙悟空','齐天大圣'),(5,'猪八戒','净坛使者菩萨');
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `over` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2`
--

LOCK TABLES `user2` WRITE;
/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
INSERT INTO `user2` VALUES (1,'孙悟空','成佛'),(2,'六耳猕猴','被降服'),(3,'黑熊精','被降服'),(4,'凌虚子','被降服'),(5,'黄风怪','被杀死'),(6,'白骨精','被杀死'),(7,'银角大王','被降服'),(8,'九头虫','被杀死');
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_kills`
--

DROP TABLE IF EXISTS `user_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_kills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `timestr` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `kills` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_kills`
--

LOCK TABLES `user_kills` WRITE;
/*!40000 ALTER TABLE `user_kills` DISABLE KEYS */;
INSERT INTO `user_kills` VALUES (1,2,'2016-07-08 20:31:54',20),(2,3,'2016-07-02 20:31:54',12),(3,4,'2016-05-08 20:31:54',33),(4,5,'2015-07-08 20:31:54',22),(5,2,'2016-07-08 21:31:54',32),(6,5,'2016-01-08 20:31:54',23),(7,3,'2006-07-08 20:31:54',21),(8,4,'2016-01-28 20:31:54',5),(9,5,'2016-01-18 20:31:54',2),(10,3,'2011-01-18 20:31:54',1),(11,4,'2014-01-18 20:31:54',9);
/*!40000 ALTER TABLE `user_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'陈彦瑾','501658362@qq.com','$2y$10$xP2ob7L807GKf2CRVb6XveSol4EFn7qlbKIA.e6VN4jHvHvHWFtcW','1gXRwlJm8u6NnkRFaNvBqEBbBdivq3PmTp8GANcN9qfi9jomZatIZCzM7yUI','2016-08-03 20:19:15','2017-05-18 05:19:38',NULL),(2,'陈超鹏','269920271@qq.com','$2y$10$BLPy0rFBLlIhqFOImCJBe.qi1C7Vsga.DJkz9GKFVWlyEaji8Kome','SO1025DHYhF8hIiI9d2KeSp5xe1BLtISUFUpKywAxpt6PbnxueIhvi3hqQ9A','2016-08-16 23:10:21','2016-08-17 03:05:39',NULL),(3,'催吐剂','peng501658@163.com','$2y$10$sT2MgDjI0VLlPsVozE8RbOBX6O6n25ssYOAmXGZXlBtDEzgBE105u','ZKQdqtGPudVGnr1AIKUUVdAehcChTwtyFlKj2hU9IA5P7OAIoQJMOeErHfRc','2016-08-17 02:11:56','2016-08-17 02:28:00',NULL),(4,'动力','654307833@qq.com','$2y$10$Ik1ktLUKoWwL7E.SMSowKuxvfiAL37o7VtBLB91MxfXWB4wLvt1/u','vfs37aJNlkFhpzhmQz6hfNRp7F6NrAA2foBY8kHoBi8PTrvSLrKT1phfafiG','2016-08-18 02:53:24','2016-08-18 02:53:44',NULL),(5,'唐倩','781166874@qq.com','$2y$10$u5mdhF8b.qvq/1jIyiotEutmyBL6gOEAIfK491P6N09pbHHkQi0AO',NULL,'2016-09-15 08:56:35','2016-09-15 08:56:35',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-17 11:29:01
