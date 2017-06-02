-- 初始化数据库
CREATE DATABASE IF NOT EXISTS `handybuy` DEFAULT CHARACTER SET UTF8;

-- 使用数据库handybuy
use handybuy;

--
-- Table Structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `area_id` BIGINT(20) NOT NULL COMMENT '地区ID',
  `area_name` VARCHAR(64) NOT NULL COMMENT '地区名称',
  `sku_id` BIGINT(20) NOT NULL COMMENT '商品ID',
  `deal_class` int(2) NOT NULL,
  `merchant_id` BIGINT(20) NOT NULL COMMENT '厂商ID',
  `merchant_sku` BIGINT(20) NOT NULL,
  `deal_title` VARCHAR(200) NOT NULL COMMENT '商品标题',
  `deal_price` DECIMAL(12,2) NOT NULL COMMENT '商品价格',
  `merchant_price` DECIMAL(12,2) NOT NULL COMMENT '进货价',
  `market_price` DECIMAL(12,2) NOT NULL COMMENT '市场价',
  `settlement_price` DECIMAL(12,2) NOT NULL COMMENT '结算价格',
  `settlement_price_max` DECIMAL(12,2) DEFAULT NULL COMMENT '最大可接受结算价格',
  `discount` INT(3) DEFAULT NULL COMMENT '折扣',
  `bonus_points` INT(5) DEFAULT NULL COMMENT '积分',
  `deal_type` int(3) NOT NULL COMMENT '商品类型',
  `image_id` BIGINT(20) DEFAULT '0' COMMENT '对应商品图片',
  `deal_level` INT(4) NOT NULL COMMENT '商品优先级',
  `max_purchase_count` INT(4) DEFAULT NULL COMMENT '最大购买数量',
  `publish_status` INT(2) NOT NULL COMMENT '发布状态',
  `inventory_amout` INT(10) NOT NULL COMMENT '库存数量',
  `vendibility_amount` INT(10) NOT NULL COMMENT '商品可售数量',
  `oos_status` INT(2) NOT NULL COMMENT '库存状况',
  `start_time` DATETIME NOT NULL COMMENT '开始销售时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '销售结束时间',
  `publish_time` DATETIME DEFAULT NULL COMMENT '发布时间',
  `merchant_code` VARCHAR(15) DEFAULT NULL COMMENT '商家编码',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  `category_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '商品类别ID',
  PRIMARY KEY(`id`),
  UNIQUE KEY `deal_sku_UNIQUE` (`sku_id`)
  )ENGINE = InnoDB DEFAULT CHARSET =UTF8;

--
-- 商品详细表
--

DROP TABLE IF EXISTS `deal_detail`;
CREATE TABLE `deal_detail` (
  `id` BIGINT(20) NOT NULL,
  `deal_id` BIGINT(20) NOT NULL COMMENT '商品ID',
  `deal_detail` VARCHAR(8000) DEFAULT NULL COMMENT '商品详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `detail_deal_id_UNIQUE`(`deal_id`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--
-- 商品分类列表
--

DROP TABLE IF EXISTS `deal_category`;
CREATE TABLE `deal_category`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` BIGINT(20) NOT NULL COMMENT '父ID',
  `name` VARCHAR(100) NOT NULL COMMENT '商品分类名称',
  `url_name` VARCHAR(32) NOT NULL COMMENT '分类URL名称',
  `publish_status` INT(2) COMMENT '发布状态',
  `create_time` DATETIME COMMENT '创建时间',
  `order_num` INT(10) UNSIGNED NOT NULL COMMENT '排序字段',
  `deep` INT(10) UNSIGNED NOT NULL COMMENT '层次深度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_category_name_UNIQUE` (`name`),
  UNIQUE KEY `deal_category_url_name_UNIQUE` (`url_name`)
)ENGINE = InnoDB CHARSET = UTF8;


--
-- Table structure for attribute
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` VARCHAR(200) NOT NULL ,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_attribute_name` (`attribute_name`)
)ENGINE = InnoDB CHARSET = utf8;

--
-- Table structure for `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE attribute_value(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `attribute_id` BIGINT(20) NOT NULL ,
  `attribute_value_name` VARCHAR(200) NOT NULL ,
  `create_time` DATETIME NOT NULL ,
  `update_time` DATETIME NOT NULL ,
  `attribute_value_status` INT(2) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE = InnoDB CHARSET = utf8;

--
-- Table structure for `deal_attribute_value`
--

DROP TABLE IF EXISTS `deal_attribute_value`;
CREATE TABLE `deal_attribute_value`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `deal_id` BIGINT(20) NOT NULL ,
  `attribute_id` BIGINT(20) NOT NULL ,
  `attribute_value_id` BIGINT(20) NOT NULL ,
  `attribute_name` VARCHAR(200) NOT NULL ,
  `attribute_value_name` VARCHAR(200) NOT NULL ,
  `create_time` DATETIME NOT NULL ,
  `deal_attribute_value_status` INT(2) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE = InnoDB CHARSET = UTF8;

--
-- 地区
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` BIGINT(20) NOT NULL COMMENT '父ID',
  `name` VARCHAR(100) NOT NULL COMMENT '名称',
  `common` INT(4) NOT NULL,
  `type` VARCHAR(16) NOT NULL COMMENT '类型：省,市',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_name_UNIQUE` (`name`)
)ENGINE = InnoDB DEFAULT CHARSET = UTF8;

--
-- Table structure for table `image_info`
--

DROP TABLE IF EXISTS `image_info`;
CREATE TABLE `image_info`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `width` INT(4) DEFAULT NULL COMMENT '图片的宽',
  `height` INT(4) DEFAULT NULL COMMENT '图片的高',
  `sorce_path` VARCHAR(100) DEFAULT NULL COMMENT '图片的源路径',
  PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = UTF8;

--
-- Table structure table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL ,
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_sku_id` BIGINT(20) NOT NULL ,
  `count` INT(4) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cart_user_id` (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET = UTF8;

--
-- Table structure for table `order_basic`
--

DROP TABLE IF EXISTS `oder_basic`;
CREATE TABLE `order_basic`(
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL COMMENT '用户ID',
  `order_status` INT(11) NOT NULL COMMENT '订单状态',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  `total_price` DECIMAL(13,2) NOT NULL COMMENT '订单总价',
  `total_settlement_price` DECIMAL(13,2) NOT NULL COMMENT '进货总价',
  `address` MEDIUMTEXT COMMENT '收货地址',
  `receiver` VARCHAR(128) DEFAULT NULL COMMENT '收件人',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT '电话',
  `pay_type` INT(2) DEFAULT '0' COMMENT '支付式，1:微信,2:支付宝,3:货到付款',
  PRIMARY KEY (`id`),
  KEY `order_user_INDEX`(`user_id`)
)ENGINE = InnoDB CHARSET = utf8;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `order_id` BIGINT(20) NOT NULL COMMENT '订单ID',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户ID',
  `merchant_sku` BIGINT(20) DEFAULT NULL COMMENT '商家商品SKU',
  `merchant_id` BIGINT(20) DEFAULT NULL COMMENT '商家ID',
  `merchant_code` BIGINT(20) DEFAULT NULL COMMENT '商家编码',
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_sku_id` BIGINT(20) NOT NULL ,
  `deal_img_id` BIGINT(20) NOT NULL ,
  `deal_title` VARCHAR(200) NOT NULL COMMENT 'deal名称',
  `deal_count` INT(11) NOT NULL COMMENT 'deal数量',
  `deal_price` DECIMAL(12,2) NOT NULL COMMENT 'deal单价',
  `total_price` DECIMAL(13,2) NOT NULL COMMENT 'deal总价',
  `settlement_price` DECIMAL(12,2) NOT NULL,
  `total_settlement_price` DECIMAL(13,2) NOT NULL,
  `detail_status` int(11) NOT NULL COMMENT '详情状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `detail_user_id_INDEX` (`user_id`),
  KEY `detail_order_id_UNIQUE` (`order_id`)
)ENGINE = InnoDB CHARSET = utf8;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL ,
  `phone` VARCHAR(20) NOT NULL ,
  `login_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`name`),
  UNIQUE KEY `user_email_UNIQUE` (`email`),
  UNIQUE KEY `uesr_phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_basic_info`
--

DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info` (
  `id` int(10) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `real_name` varchar(32) NOT NULL,
  `mail` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `receiver` varchar(64) NOT NULL,
  `area` varchar(256) NOT NULL,
  `detail` varchar(256) NOT NULL,
  `type` varchar(8) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间 ',
  `update_time` datetime NOT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`),
  KEY `INDEX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `deal_id` bigint(20) NOT NULL,
  `deal_sku_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间 ',
  `update_time` datetime NOT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`),
  KEY `favorite_user_deal_id` (`user_id`,`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(64) NOT NULL,
  `content` varchar(256) NOT NULL,
  `readed` varchar(4) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间 ',
  `update_time` datetime NOT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`),
  KEY `message_user_INDEX` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

