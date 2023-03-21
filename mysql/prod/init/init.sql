use mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
-- 创建数据库 member items
DROP database IF EXISTS `member`;
create database `member` default character set utf8 collate utf8_general_ci;

DROP database IF EXISTS `packaging`;
create database `packaging` default character set utf8 collate utf8_general_ci;

-- 切换到member数据库
use member;
-- 建表
SET NAMES utf8mb4;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `union_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信unionId',
  `open_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openId',
  `head_portrait` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `gender` int(8) DEFAULT NULL COMMENT '性别(0.男性  1.女性)',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `address` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `area` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区域',
  `city` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市',
  `province` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份',
  `user_type` int(8) DEFAULT NULL COMMENT '身份类别(1.买家，2.卖家)',
  `is_deleted` int(8) DEFAULT 1 COMMENT '身份状态(1.正常，0注销)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='会员表';

-- 切换到items数据库
use packaging;
SET NAMES utf8mb4;
DROP TABLE IF EXISTS `taskqueue`;
CREATE TABLE `taskqueue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `union_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信unionId',
  `open_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openId',
  `head_portrait` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `gender` int(8) DEFAULT NULL COMMENT '性别(0.男性  1.女性)',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `address` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `area` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区域',
  `city` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市',
  `province` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份',
  `user_type` int(8) DEFAULT NULL COMMENT '身份类别(1.买家，2.卖家)',
  `is_deleted` int(8) DEFAULT 1 COMMENT '身份状态(1.正常，0注销)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='任务表';
