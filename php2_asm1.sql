/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : php2_asm1

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 11/02/2022 10:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `is_correct` int DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
BEGIN;
INSERT INTO `answers` VALUES (1, '2', 1, 1, NULL);
INSERT INTO `answers` VALUES (2, '3', 1, 0, NULL);
INSERT INTO `answers` VALUES (3, '4', 1, 0, NULL);
INSERT INTO `answers` VALUES (4, '1', 1, 0, NULL);
INSERT INTO `answers` VALUES (5, 'tám', 2, 0, NULL);
INSERT INTO `answers` VALUES (6, 'năm', 2, 1, NULL);
INSERT INTO `answers` VALUES (7, 'bốn', 2, 0, NULL);
INSERT INTO `answers` VALUES (8, 'mười', 2, 0, NULL);
INSERT INTO `answers` VALUES (9, 'FPT Education', 3, 0, NULL);
INSERT INTO `answers` VALUES (10, 'FPT University', 3, 0, NULL);
INSERT INTO `answers` VALUES (11, 'FPT Polytechnic', 3, 1, NULL);
INSERT INTO `answers` VALUES (12, 'FPT Jekking', 3, 0, NULL);
INSERT INTO `answers` VALUES (13, '2005', 4, 0, NULL);
INSERT INTO `answers` VALUES (14, '2006', 4, 0, NULL);
INSERT INTO `answers` VALUES (15, '2007', 4, 0, NULL);
INSERT INTO `answers` VALUES (16, '2009', 4, 1, NULL);
INSERT INTO `answers` VALUES (17, 'Vũ Chí Thành', 5, 1, NULL);
INSERT INTO `answers` VALUES (2011, 'Đàm Quang Minh', 5, 0, NULL);
INSERT INTO `answers` VALUES (2012, 'Nguyễn Khắc Thành', 5, 0, NULL);
INSERT INTO `answers` VALUES (2013, 'Lê Trường Tùng', 5, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` VALUES (1, '1 + 1 = ?', 1, NULL);
INSERT INTO `questions` VALUES (2, '2 + 3 = ?', 1, NULL);
INSERT INTO `questions` VALUES (3, 'Trường mình tên gì?', 2, NULL);
INSERT INTO `questions` VALUES (4, 'Trường thành lập năm nào?', 2, NULL);
INSERT INTO `questions` VALUES (5, 'Hiệu trưởng đang là ai? ', 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for quizs
-- ----------------------------
DROP TABLE IF EXISTS `quizs`;
CREATE TABLE `quizs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `is_shuffle` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of quizs
-- ----------------------------
BEGIN;
INSERT INTO `quizs` VALUES (1, 'Quiz 1', 1, 15, '2022-02-07 13:27:05', '2022-02-07 15:27:18', 1, 0);
INSERT INTO `quizs` VALUES (2, 'Quiz 2', 1, 10, '2022-02-07 13:27:05', '2022-02-07 15:27:18', 1, 0);
INSERT INTO `quizs` VALUES (3, 'Quiz 3', 1, 20, '2022-02-08 15:22:00', '2022-02-08 16:22:00', 1, 1);
INSERT INTO `quizs` VALUES (4, 'Quiz 1', 3, 10, '2022-02-08 15:24:00', '2022-02-08 18:26:00', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'Giáo viên');
INSERT INTO `roles` VALUES (2, 'Sinh viên');
COMMIT;

-- ----------------------------
-- Table structure for student_quiz_detail
-- ----------------------------
DROP TABLE IF EXISTS `student_quiz_detail`;
CREATE TABLE `student_quiz_detail` (
  `student_quiz_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer_id` int NOT NULL,
  PRIMARY KEY (`student_quiz_id`,`question_id`,`answer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student_quiz_detail
-- ----------------------------
BEGIN;
INSERT INTO `student_quiz_detail` VALUES (1, 1, 1);
INSERT INTO `student_quiz_detail` VALUES (1, 2, 6);
COMMIT;

-- ----------------------------
-- Table structure for student_quizs
-- ----------------------------
DROP TABLE IF EXISTS `student_quizs`;
CREATE TABLE `student_quizs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `score` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student_quizs
-- ----------------------------
BEGIN;
INSERT INTO `student_quizs` VALUES (1, 2, 1, '2022-02-07 14:30:01', '2022-02-07 14:40:04', 10.00);
INSERT INTO `student_quizs` VALUES (2, 2, 2, '2022-02-07 14:30:01', '2022-02-07 14:40:04', 7.50);
INSERT INTO `student_quizs` VALUES (3, 1, 1, NULL, NULL, 6.00);
INSERT INTO `student_quizs` VALUES (4, 1, 2, NULL, NULL, 8.00);
COMMIT;

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` VALUES (1, 'Tin học cơ sở\n', 1, 'img/default-subject-logo.jpeg');
INSERT INTO `subjects` VALUES (3, 'Lập trình PHP2', NULL, 'img/default-subject-logo.jpeg');
INSERT INTO `subjects` VALUES (5, 'Lập trình C++', NULL, 'img/default-subject-logo.jpeg');
INSERT INTO `subjects` VALUES (6, 'Lập trình Game 2D - unity', NULL, 'img/default-subject-logo.jpeg');
INSERT INTO `subjects` VALUES (7, 'something', NULL, NULL);
INSERT INTO `subjects` VALUES (8, 'sdfdsfsdf', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'trần hữu thiện', 'thienth@fpt.edu.vn', '$2y$10$ogeclBPOumIBjkRF17hUmuYTx/usbE71s5b6yfOy74KvLaLUdFq4u', NULL, 1);
INSERT INTO `users` VALUES (2, 'Trần Thanh Tung', 'tungtt@fpt.edu.vn', '$2y$10$ogeclBPOumIBjkRF17hUmuYTx/usbE71s5b6yfOy74KvLaLUdFq4u', NULL, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
