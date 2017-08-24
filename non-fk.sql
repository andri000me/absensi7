/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : absen7

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-18 15:41:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for absen
-- ----------------------------
DROP TABLE IF EXISTS `absen`;
CREATE TABLE `absen` (
  `id_a` int(11) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(6) NOT NULL,
  `id_s` tinyint(4) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `jam` time NOT NULL,
  `late_minute` int(6) NOT NULL,
  `tanggal` date NOT NULL,
  `denda` int(11) NOT NULL,
  PRIMARY KEY (`id_a`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for bayangan_absen
-- ----------------------------
DROP TABLE IF EXISTS `bayangan_absen`;
CREATE TABLE `bayangan_absen` (
  `id_ba` int(6) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(255) DEFAULT NULL,
  `id_s` tinyint(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `late_minute` tinyint(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `denda` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_ba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cuti
-- ----------------------------
DROP TABLE IF EXISTS `cuti`;
CREATE TABLE `cuti` (
  `id_c` smallint(255) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(255) DEFAULT NULL,
  `cuti_kali` int(255) DEFAULT NULL,
  `jatah_cuti` int(255) DEFAULT NULL,
  `last_sync` date DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ijin
-- ----------------------------
DROP TABLE IF EXISTS `ijin`;
CREATE TABLE `ijin` (
  `id_i` int(255) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(255) DEFAULT NULL,
  `id_s` tinyint(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `denda` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `id_j` tinyint(255) NOT NULL AUTO_INCREMENT,
  `jabatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_j`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan` (
  `id_k` smallint(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `bisa_cuti` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_k`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for libur
-- ----------------------------
DROP TABLE IF EXISTS `libur`;
CREATE TABLE `libur` (
  `id_l` int(255) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id_l`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id_l` smallint(255) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hak_akses` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_l`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id_s` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_s`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
