/*
 Navicat Premium Data Transfer

 Source Server         : 54.95.29.125_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 54.95.29.125:3306
 Source Schema         : ette

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 21/04/2022 19:40:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


create database ette;
use ette;

-- ----------------------------
-- Table structure for bee_files
-- ----------------------------
DROP TABLE IF EXISTS `bee_files`;
CREATE TABLE `bee_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int NULL DEFAULT NULL,
  `filesize` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blocks
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks`  (
  `hash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` bigint NOT NULL,
  `time` bigint NOT NULL,
  `parenthash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `difficulty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gasused` bigint NOT NULL,
  `gaslimit` bigint NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `miner` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` float NOT NULL,
  `stateroothash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unclehash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `txroothash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiptroothash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extradata` blob NULL,
  `inputdata` blob NULL,
  `tx_num` int NOT NULL,
  PRIMARY KEY (`hash`) USING BTREE,
  UNIQUE INDEX `number`(`number` ASC) USING BTREE,
  UNIQUE INDEX `number_2`(`number` ASC) USING BTREE,
  INDEX `idx_blocks_number`(`number` ASC) USING BTREE,
  INDEX `idx_blocks_time`(`time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for city_names
-- ----------------------------
DROP TABLE IF EXISTS `city_names`;
CREATE TABLE `city_names`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City_Admaster` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province_EN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Region` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Tier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 828 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_vars
-- ----------------------------
DROP TABLE IF EXISTS `config_vars`;
CREATE TABLE `config_vars`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for delivery_history
-- ----------------------------
DROP TABLE IF EXISTS `delivery_history`;
CREATE TABLE `delivery_history`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datalength` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `origin` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` bigint NOT NULL,
  `topics` blob NULL,
  `data` blob NULL,
  `txhash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blockhash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `idx_events_origin`(`origin` ASC) USING BTREE,
  INDEX `idx_events_transaction_hash`(`txhash` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for idCodes
-- ----------------------------
DROP TABLE IF EXISTS `idCodes`;
CREATE TABLE `idCodes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ifi_award_counts
-- ----------------------------
DROP TABLE IF EXISTS `ifi_award_counts`;
CREATE TABLE `ifi_award_counts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `times` int NOT NULL DEFAULT 0,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `address`(`address` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ifi_award_log
-- ----------------------------
DROP TABLE IF EXISTS `ifi_award_log`;
CREATE TABLE `ifi_award_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `node_address` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '节点地址',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0来源于CPU，1来源于voyager提现',
  `from_account` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '激励来源账号',
  `ifi_amount` bigint NULL DEFAULT NULL COMMENT '奖励数量',
  `timestamp` int NULL DEFAULT NULL COMMENT '时间戳',
  `tx_hash` varchar(88) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '交易哈希',
  `ifi_balance` double NULL DEFAULT 0,
  `status` int NULL DEFAULT 0,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 299864 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ifi_award_type
-- ----------------------------
DROP TABLE IF EXISTS `ifi_award_type`;
CREATE TABLE `ifi_award_type`  (
  `type` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ifi_transfer_records
-- ----------------------------
DROP TABLE IF EXISTS `ifi_transfer_records`;
CREATE TABLE `ifi_transfer_records`  (
  `blockNumber` int NOT NULL,
  `transactionIndex` int NOT NULL,
  `contractAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logIndex` int NOT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`blockNumber`, `transactionIndex`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chequebook_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpu_score` bigint NULL DEFAULT NULL,
  `local_ip` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `incentive_reward` bigint NOT NULL DEFAULT 0 COMMENT 'voyager提现奖励',
  `total_reward` double NOT NULL DEFAULT 0 COMMENT '总奖励数量',
  `reward_30days` bigint NOT NULL DEFAULT 0 COMMENT '30天内奖励数量',
  `increase_ratio` int NOT NULL DEFAULT 0 COMMENT '增长幅度',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `logicalScore` double NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nodes_startup
-- ----------------------------
DROP TABLE IF EXISTS `nodes_startup`;
CREATE TABLE `nodes_startup`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `chequebook_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `local_ip` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `startup_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_owner_address`(`owner_address` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181793 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for other_accounts
-- ----------------------------
DROP TABLE IF EXISTS `other_accounts`;
CREATE TABLE `other_accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for signers
-- ----------------------------
DROP TABLE IF EXISTS `signers`;
CREATE TABLE `signers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(78) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `min_block` bigint NOT NULL DEFAULT 0 COMMENT '最小签名区块',
  `max_block` bigint NOT NULL DEFAULT 0 COMMENT '最大签名区块',
  `days7` bigint NOT NULL DEFAULT 0 COMMENT '7天内签名区块数量',
  `days30` bigint NOT NULL DEFAULT 0 COMMENT '30天内签名区块数量',
  `total_blocks` int NOT NULL DEFAULT 0 COMMENT '签名区块的总数量',
  `latitude` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `longitude` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `country` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `weight` double NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `signers_con1` CHECK (`weight` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subscription_details
-- ----------------------------
DROP TABLE IF EXISTS `subscription_details`;
CREATE TABLE `subscription_details`  (
  `address` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subscriptionplan` int NOT NULL,
  PRIMARY KEY (`address`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for subscription_plans
-- ----------------------------
DROP TABLE IF EXISTS `subscription_plans`;
CREATE TABLE `subscription_plans`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deliverycount` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id` ASC) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `deliverycount`(`deliverycount` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for summaryOfDay
-- ----------------------------
DROP TABLE IF EXISTS `summaryOfDay`;
CREATE TABLE `summaryOfDay`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `trxCount` int NOT NULL DEFAULT 0,
  `accountsCount` int NOT NULL DEFAULT 0,
  `accountsIFI` int NOT NULL DEFAULT 0,
  `nodesCount` int NOT NULL DEFAULT 0,
  `nodesOnline` int NOT NULL DEFAULT 0,
  `givenIFI` double NOT NULL DEFAULT 0,
  `nodesNew` int NOT NULL DEFAULT 0,
  `totalScore` double NOT NULL DEFAULT 0,
  `dt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `hash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `input_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gas` bigint NOT NULL,
  `gasprice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nonce` bigint NOT NULL,
  `state` smallint NOT NULL,
  `blockhash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blockNumber` bigint NOT NULL DEFAULT 0,
  `timestamp` int NULL DEFAULT NULL,
  PRIMARY KEY (`hash`) USING BTREE,
  INDEX `idx_transactions_from`(`from` ASC) USING BTREE,
  INDEX `idx_transactions_to`(`to` ASC) USING BTREE,
  INDEX `idx_transactions_contract`(`contract` ASC) USING BTREE,
  INDEX `idx_transactions_nonce`(`nonce` ASC) USING BTREE,
  INDEX `idx_transactions_block_hash`(`blockhash` ASC) USING BTREE,
  INDEX `time_index`(`timestamp` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for transactions_dam
-- ----------------------------
DROP TABLE IF EXISTS `transactions_dam`;
CREATE TABLE `transactions_dam`  (
  `hash` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ifi_amount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int NULL DEFAULT NULL,
  PRIMARY KEY (`hash`) USING BTREE,
  INDEX `idx_transactions_dam_from`(`from` ASC) USING BTREE,
  INDEX `idx_transactions_dam_to`(`to` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `address` char(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apikey` char(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`apikey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Triggers structure for table ifi_award_log
-- ----------------------------
DROP TRIGGER IF EXISTS `update_nodes`;
delimiter ;;
CREATE TRIGGER `update_nodes` AFTER INSERT ON `ifi_award_log` FOR EACH ROW begin

update nodes set total_reward=total_reward+new.ifi_amount,last_updated=current_timestamp()  where owner_address=new.node_address;

end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
