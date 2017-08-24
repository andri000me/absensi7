/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : absen7

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-19 17:08:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for absen
-- ----------------------------
DROP TABLE IF EXISTS `absen`;
CREATE TABLE `absen` (
  `id_a` int(11) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(6) DEFAULT NULL,
  `id_s` tinyint(4) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `late_minute` int(6) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_a`),
  KEY `a_id_k` (`id_k`),
  KEY `a_id_s` (`id_s`),
  CONSTRAINT `a_id_k` FOREIGN KEY (`id_k`) REFERENCES `karyawan` (`id_k`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `a_id_s` FOREIGN KEY (`id_s`) REFERENCES `status` (`id_s`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for bayangan_absen
-- ----------------------------
DROP TABLE IF EXISTS `bayangan_absen`;
CREATE TABLE `bayangan_absen` (
  `id_ba` int(6) NOT NULL AUTO_INCREMENT,
  `id_k` smallint(6) DEFAULT NULL,
  `id_s` tinyint(4) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `late_minute` tinyint(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `denda` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_ba`),
  KEY `ba_id_k` (`id_k`),
  KEY `ba_id_s` (`id_s`),
  CONSTRAINT `ba_id_k` FOREIGN KEY (`id_k`) REFERENCES `karyawan` (`id_k`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ba_id_s` FOREIGN KEY (`id_s`) REFERENCES `status` (`id_s`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id_c`),
  KEY `c_id_k` (`id_k`),
  CONSTRAINT `c_id_k` FOREIGN KEY (`id_k`) REFERENCES `karyawan` (`id_k`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id_i`),
  KEY `i_id_k` (`id_k`),
  KEY `i_id_s` (`id_s`),
  CONSTRAINT `i_id_k` FOREIGN KEY (`id_k`) REFERENCES `karyawan` (`id_k`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `i_id_s` FOREIGN KEY (`id_s`) REFERENCES `status` (`id_s`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `jabatan` tinyint(4) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `bisa_cuti` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_k`),
  KEY `k_id_j` (`jabatan`),
  CONSTRAINT `k_id_j` FOREIGN KEY (`jabatan`) REFERENCES `jabatan` (`id_j`)
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
  `id_k` smallint(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hak_akses` varchar(255) DEFAULT NULL,
  `suspended` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_l`),
  KEY `l_id_k` (`id_k`),
  CONSTRAINT `l_id_k` FOREIGN KEY (`id_k`) REFERENCES `karyawan` (`id_k`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
DROP TRIGGER IF EXISTS `absen_after_insert`;
DELIMITER ;;
CREATE TRIGGER `absen_after_insert` AFTER INSERT ON `absen` FOR EACH ROW begin
if new.id_s = '3' then 
update cuti set cuti.cuti_berapakali = cuti.cuti_berapakali + 1 where cuti.id_k = new.id_k;
end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `absen_after_update`;
DELIMITER ;;
CREATE TRIGGER `absen_after_update` AFTER UPDATE ON `absen` FOR EACH ROW BEGIN
	if old.id_s = 3 and new.id_s != 3 then 
	update cuti set cuti.cuti_berapakali = (cuti.cuti_berapakali - 1) where cuti.id_k=new.id_k;
	elseif old.id_s != 3 and new.id_s = 3 then
	update cuti set cuti.cuti_berapakali = (cuti.cuti_berapakali + 1) where cuti.id_k= new.id_k;
	elseif old.id_s = 1 and new.id_s != 1 then
	delete from ijin where ijin.id_k = new.id_k and ijin.tanggal = new.tanggal;
	end if;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `absen_after_delete`;
DELIMITER ;;
CREATE TRIGGER `absen_after_delete` AFTER DELETE ON `absen` FOR EACH ROW BEGIN
if old.id_s = 3 then 
update cuti set cuti.cuti_berapakali = cuti.cuti_berapakali - 1 where cuti.id_k = old.id_k;
elseif old.id_s = 1 then
delete from ijin where ijin.id_k = old.id_k and ijin.tanggal = old.tanggal;
end if;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `jabatan_before_delete`;
DELIMITER ;;
CREATE TRIGGER `jabatan_before_delete` BEFORE DELETE ON `jabatan` FOR EACH ROW BEGIN
/*if (data_j.id_j != 9) then*/
UPDATE karyawan SET karyawan.jabatan_k = 9 WHERE karyawan.jabatan_k = old.id_j;
/*end if;*/
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `libur_after_insert`;
DELIMITER ;;
CREATE TRIGGER `libur_after_insert` AFTER INSERT ON `libur` FOR EACH ROW BEGIN
DELETE FROM absen WHERE absen.tanggal = new.tanggal;
END
;;
DELIMITER ;
