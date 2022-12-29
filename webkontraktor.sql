-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 03:25 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webkontraktor`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `adminweb_projectberjalan` ()  SELECT * FROM adminweb_projectberjalan
WHERE status = 'sedang_berjalan'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `adminweb_projectsel` ()  SELECT * FROM adminweb_projectsel
WHERE status = 'selesai'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_absen` (IN `tgl_mulai` DATE, IN `tgl_selesai` DATE, IN `iduser` INT)  SELECT * FROM absen WHERE id_user = iduser AND (date BETWEEN tgl_mulai AND tgl_selesai)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_project` (IN `id_project1` INT, IN `nama_project1` VARCHAR(255), IN `lokasi1` VARCHAR(255), IN `estimasi1` VARCHAR(255), IN `cost1` VARCHAR(255), IN `deskripsi1` TEXT)  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO project(id_project, status, created_at) VALUES(id_project1, 'sedang_berjalan', now());
        INSERT INTO detail_project(id_project, nama_project, lokasi, estimasi, cost, deskripsi) VALUES(id_project1, nama_project1, lokasi1, estimasi1, cost1, deskripsi1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_detail_project` (IN `idproject` INT(50))  SELECT * FROM pm_detail_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_laporan_project` (IN `idproject` INT(50))  SELECT * FROM pm_laporan_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_la_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_la_laporan
WHERE id_project = idproject
AND id_type = 'LA'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_la_project` (IN `idproject` INT(50))  SELECT * FROM pm_laporan_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lda_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lda_laporan
WHERE id_project = idproject
AND id_type = 'DT'
AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_ldp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_ldp_laporan
where id_project = idproject
AND id_type = 'DT'
AND status = 'pending'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_ld_project` (IN `idproject` INT)  SELECT * FROM pm_ld_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lha_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lha_laporan
WHERE id_project = idproject
AND id_type = 'LH'
AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lhp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lhp_laporan
WHERE id_project = idproject
AND id_type = 'LH'
AND status = 'pending'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lhv_identify` (IN `idlaporan` VARCHAR(50))  SELECT * FROM pm_lhv_identify
WHERE id_laporan = idlaporan$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lh_project` (IN `idproject` INT(50))  SELECT * FROM pm_lh_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lpa_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lpa_laporan
WHERE id_project = idproject
AND id_type = 'LP'
AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lpp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lpp_laporan
WHERE id_project = idproject
AND id_type = 'LP'
AND status = 'Pending'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lp_project` (IN `idproject` INT(50))  SELECT * FROM pm_lp_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lra_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lra_laporan
WHERE id_project = idproject
AND id_type = 'LR'
AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lrp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lrp_laporan
WHERE id_project = idproject
AND id_type = 'LR'
AND status = 'Pending'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_lr_project` (IN `idproject` INT(50))  SELECT * FROM pm_lr_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_pb2_project` (IN `idproject` INT(50))  SELECT * FROM pm_pb2_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_pb_project` ()  SELECT * FROM pm_pb_project
WHERE status = 'sedang_berjalan'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_selesai_project` ()  SELECT * FROM pm_selesai_project
WHERE status = 'selesai'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pm_team_tp` (IN `idproject` INT(50))  SELECT * FROM pm_team_tp
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_detail_project` (IN `idproject` INT(50))  SELECT * FROM repository_detail_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_index_project1` (IN `search` VARCHAR(255))  SELECT * FROM repository_index_project1 
WHERE status = 'selesai' AND nama_project LIKE CONCAT('%',search,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_index_project2` ()  SELECT * FROM repository_index_project2
WHERE status = 'selesai'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_lamanproject_project` (IN `idproject` INT(50))  SELECT * FROM repository_lamanproject_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanakhir_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanakhir_laporan
WHERE id_project = idproject AND id_type = 'LA'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanakhir_project` (IN `idproject` INT(50))  SELECT * FROM repository_laporanakhir_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporandokumen_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporandokumen_laporan
WHERE id_project = idproject AND id_type = 'DT' AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanharianview_identify` (IN `idlaporan` INT(50))  SELECT * FROM repository_laporanharianview_identify
WHERE id_laporan = idlaporan$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanharian_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanharian_laporan
WHERE id_project = idproject AND id_type = 'LH' AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanprogress_laporan` (IN `idproject` INT(25))  SELECT * FROM repository_laporanprogress_laporan
WHERE id_project = idproject AND id_type = 'LP' AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporanrab_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanrab_laporan
WHERE id_project = idproject AND id_type = 'LR' AND status = 'Accept'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_laporan_project` (IN `idproject` INT(50))  SELECT * FROM repository_laporan_project
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `repository_team_teamproject` (IN `idproject` INT(50))  SELECT * FROM repository_team_teamproject
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_doktambahan` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_doktambahan
WHERE id_project = idproject AND id_type = 'DT' AND id_user = iduser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_lapprogress` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_lapprogress
WHERE id_project = idproject AND id_type = 'LP' AND id_user = iduser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_lapproject` (IN `idproject` INT(50))  SELECT * FROM stafflapangan_project_lapproject
WHERE id_project = idproject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_laprab` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_laprab
WHERE id_project = idproject AND id_type = 'LR' AND id_user = iduser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_selpro` (IN `idu` INT(50))  SELECT * FROM stafflapangan_project_selpro
WHERE id_user = idu AND status = 'selesai'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_selselesai` (IN `idu` INT(50))  SELECT * FROM stafflapangan_project_selselesai
WHERE id_user = idu AND status = 'selesai'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stafflapangan_project_tsp` (IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_tsp
WHERE id_user = iduser AND status = 'sedang_berjalan'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `store_laporan` (IN `project_id` VARCHAR(3), IN `user_id` VARCHAR(3))  BEGIN
	INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dikirim, waktu_dikonfirmasi , status)
	SELECT CONCAT(project_id, '-',COUNT(*)+1), project_id, user_id ,'LH', CURRENT_TIMESTAMP(),'','Belum Dikirim' FROM laporan_project  WHERE id_project = project_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `id_user`, `date`, `time_in`, `time_out`, `note`, `created_at`, `updated_at`) VALUES
(7, 28, '2022-12-08', '20:41:59', NULL, NULL, NULL, NULL),
(8, 28, '2022-12-04', '08:57:46', '10:58:20', NULL, '2022-12-04 01:57:46', '2022-12-04 01:58:20'),
(9, 28, '2022-12-01', '08:57:46', '10:58:20', NULL, '2022-12-04 01:57:46', '2022-12-04 01:58:20'),
(10, 28, '2022-12-03', '08:57:46', '10:58:20', NULL, '2022-12-04 01:57:46', '2022-12-04 01:58:20');

--
-- Triggers `absen`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_ID` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN 
IF(new.id_absen <> old.id_absen)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "gabisa di update id";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_IDUSER` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.id_user <> old.id_user)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "TIDAK BOLEH MENGUPDATE ID USER";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_WAKTU_OUT_IF_NOT_NULL` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(old.time_out IS NOT NULL)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "WAKTU KELUAR SUDAH DIBUAT, TIDAK BOLEH DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_absen` AFTER INSERT ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Insert data, id user = ', NEW.id_user, ' ,id_absen = ',NEW.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_absen` AFTER UPDATE ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Update data, id user = ', NEW.id_user, ' ,id_absen = ',NEW.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_absen` BEFORE DELETE ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Delete data, id user = ', old.id_user, ' ,id_absen = ',old.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_idabsen` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.id_absen <> old.id_absen)
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Tidak bisa Merubah id";
 END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_today_absen` BEFORE INSERT ON `absen` FOR EACH ROW BEGIN
IF EXISTS(SELECT date FROM `absen` WHERE date = new.date AND id_user = new.id_user)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Absen Harinih Sudah Ada";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_notif_not_karyawan` BEFORE INSERT ON `absen` FOR EACH ROW IF (new.id_user NOT IN (SELECT id FROM users)) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id user anda tidak terdaftar";
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_update_timein` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.time_in <> old.time_in)
THEN
 SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'WAKTU MASUK TIDAK BOLEH DI UPDATE';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminweb_projectberjalan`
-- (See below for the actual view)
--
CREATE TABLE `adminweb_projectberjalan` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminweb_projectsel`
-- (See below for the actual view)
--
CREATE TABLE `adminweb_projectsel` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `email`, `name`, `nohp`, `created_at`, `updated_at`) VALUES
(2, 'Filzarr@gmail.com', 'Filza', '088888', '2022-12-14 18:28:05', NULL),
(4, 'Filzarr@gmail.com', 'Filza1', '088883338', '2022-12-10 18:28:12', NULL),
(5, 'nikodema01@gmail.com', 'Fahru', '0823711313', '2022-12-06 18:28:15', NULL),
(6, 'nikodema01@gmail.com', 'Budiman2', '13213213213', '2022-12-14 18:28:18', NULL);

--
-- Triggers `client`
--
DELIMITER $$
CREATE TRIGGER `after_insert_client` AFTER INSERT ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Insert data, id client = ', NEW.id_client))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_client` AFTER UPDATE ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Update data, id client = ', NEW.id_client))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_client` BEFORE DELETE ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Delete data, id client = ', OLD.id_client))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_project`
--

CREATE TABLE `detail_project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `nama_project` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_project`
--

INSERT INTO `detail_project` (`id_project`, `nama_project`, `lokasi`, `estimasi`, `cost`, `deskripsi`, `created_at`, `updated_at`) VALUES
(101, 'test21', 'test lok', '30 hari', 'Rp 20.000', 'sasadadadadadadad', NULL, NULL),
(102, 'Menara Hanoi', 'Kuil Shaolin Hanoi. Thailand', '585 milyar tahun', '$9999999 Billion', 'Memindahkan Lempengan', NULL, NULL),
(103, 'test query', 'test', 'test', 'test', 'test', NULL, NULL),
(104, 'pembangunan Gedung Pancasila', 'Samping Fasilkom-TI', '1 bulan', '800 JT', 'membangun tempat bersendau gurau', NULL, NULL);

--
-- Triggers `detail_project`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_ID_PROJECT` BEFORE UPDATE ON `detail_project` FOR EACH ROW BEGIN
IF(new.id_project <> old.id_project)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_detail_project` AFTER INSERT ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_detail_project` AFTER UPDATE ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_detail_project` BEFORE DELETE ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_detail-project_notif_project_id_not_exist` BEFORE INSERT ON `detail_project` FOR EACH ROW IF (new.id_project not IN(SELECT id_project FROM project)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id Project belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_sub_laporan_harian`
--

CREATE TABLE `detail_sub_laporan_harian` (
  `id_sub_laporan` enum('PKR','TMPB','PR','PK','CBA','KJPP') NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_sub_laporan_harian`
--

INSERT INTO `detail_sub_laporan_harian` (`id_sub_laporan`, `deskripsi`) VALUES
('PKR', 'Pekerjaan'),
('TMPB', 'TIba Mutasi Dan Bahan Kontruksi Pokok'),
('PR', 'Pemakaian Peralatan'),
('PK', 'Personil Kontraktor/Konsultan Dan Proyek'),
('CBA', 'Cuaca Dan Bencana Alam'),
('KJPP', 'Kejadian Lain Penghambat Pekerjaan');

--
-- Triggers `detail_sub_laporan_harian`
--
DELIMITER $$
CREATE TRIGGER `dont_update_kodesub` BEFORE UPDATE ON `detail_sub_laporan_harian` FOR EACH ROW BEGIN
IF(new.id_sub_laporan <> old.id_sub_laporan)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id sub laporan tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_type_laporan`
--

CREATE TABLE `detail_type_laporan` (
  `id_type` enum('LH','LP','LR','DT','LA') NOT NULL,
  `deskripsi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_type_laporan`
--

INSERT INTO `detail_type_laporan` (`id_type`, `deskripsi`) VALUES
('LH', 'Laporan Harian'),
('LP', 'Laporan Progress'),
('LR', 'Laporan RAB'),
('DT', 'Dokumen Tambahan'),
('LA', 'Laporan Akhir');

--
-- Triggers `detail_type_laporan`
--
DELIMITER $$
CREATE TRIGGER `dont_update_kodetype` BEFORE UPDATE ON `detail_type_laporan` FOR EACH ROW BEGIN
IF(new.id_type <> old.id_type)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id sub laporan tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tambahan`
--

CREATE TABLE `dokumen_tambahan` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen_tambahan`
--

INSERT INTO `dokumen_tambahan` (`id_laporan`, `dokumen`) VALUES
('102-11', '102-13-Requirment Tambahan untuk Database.pdf'),
('102-13', '102-15-KURVA S.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_akhir`
--

CREATE TABLE `laporan_akhir` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_akhir`
--

INSERT INTO `laporan_akhir` (`id_laporan`, `dokumen`) VALUES
('102-15', '102-18-PAGAR.pdf'),
('102-16', '102-16-PAGAR.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian`
--

CREATE TABLE `laporan_harian` (
  `id_laporan` varchar(15) NOT NULL,
  `kode_laporan_harian` varchar(30) NOT NULL,
  `id_sub_laporan` enum('PKR','TMPB','PR','PK','CBA','KJPP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian`
--

INSERT INTO `laporan_harian` (`id_laporan`, `kode_laporan_harian`, `id_sub_laporan`) VALUES
('102-1', '102-1-CBA', 'CBA'),
('102-1', '102-1-KJPP', 'KJPP'),
('102-1', '102-1-PK', 'PK'),
('102-1', '102-1-PKR', 'PKR'),
('102-1', '102-1-TMPB', 'TMPB'),
('102-10', '102-10-CBA', 'CBA'),
('102-10', '102-10-KJPP', 'KJPP'),
('102-10', '102-10-PK', 'PK'),
('102-10', '102-10-PKR', 'PKR'),
('102-10', '102-10-TMPB', 'TMPB'),
('102-7', '102-7-CBA', 'CBA'),
('102-8', '102-8-CBA', 'CBA'),
('102-8', '102-8-KJPP', 'KJPP'),
('102-8', '102-8-PK', 'PK'),
('102-9', '102-9-CBA', 'CBA'),
('102-9', '102-9-KJPP', 'KJPP'),
('102-9', '102-9-PK', 'PK'),
('102-9', '102-9-PKR', 'PKR'),
('102-9', '102-9-TMPB', 'TMPB');

--
-- Triggers `laporan_harian`
--
DELIMITER $$
CREATE TRIGGER `decline_if_notexist` BEFORE INSERT ON `laporan_harian` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan harian belum terdaftar";
     ELSEIF NOT EXISTS(SELECT * FROM detail_sub_laporan_harian WHERE id_sub_laporan = new.id_sub_laporan)
     THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "sub laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_cba`
--

CREATE TABLE `laporan_harian_cba` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(25) DEFAULT NULL,
  `rentang_waktu` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_cba`
--

INSERT INTO `laporan_harian_cba` (`kode_laporan_harian`, `jenis`, `rentang_waktu`, `ket`) VALUES
('102-1-CBA', 'Cerah', '13.00 Wib - 15.00 Wib', 'cuaca sangat mendukung untuk pembangunan'),
('102-1-CBA', 'Hujan Badai', '17.00 Wib', 'Cuaca sangat kacau butuh nyi rara pawang hujan'),
('102-7-CBA', 'Tsunami', 'Sehari', 'Hancr');

--
-- Triggers `laporan_harian_cba`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_CBA` BEFORE UPDATE ON `laporan_harian_cba` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexist` BEFORE INSERT ON `laporan_harian_cba` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_kjpp`
--

CREATE TABLE `laporan_harian_kjpp` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `rentang_jam` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_kjpp`
--

INSERT INTO `laporan_harian_kjpp` (`kode_laporan_harian`, `jenis`, `rentang_jam`, `ket`) VALUES
('102-1-KJPP', 'test 1', 'test 2', 'test 3'),
('102-1-KJPP', 'test 2', 'test 2', 'test 2');

--
-- Triggers `laporan_harian_kjpp`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_KJPP` BEFORE UPDATE ON `laporan_harian_kjpp` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistkjpp` BEFORE INSERT ON `laporan_harian_kjpp` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pk`
--

CREATE TABLE `laporan_harian_pk` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `tugas_jabatan` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_pk`
--

INSERT INTO `laporan_harian_pk` (`kode_laporan_harian`, `tugas_jabatan`, `jumlah`, `lokasi`) VALUES
('102-1-PK', 'test 1', 2, 'test'),
('102-1-PK', 'test 2', 2, 'test'),
('102-8-PK', 'KEPALA TUKANG', NULL, '1'),
('102-8-PK', 'PEKERJA', NULL, '12');

--
-- Triggers `laporan_harian_pk`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_HARIAN_PK` BEFORE UPDATE ON `laporan_harian_pk` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpr` BEFORE INSERT ON `laporan_harian_pk` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pkr`
--

CREATE TABLE `laporan_harian_pkr` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis_pekerjaan` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_pkr`
--

INSERT INTO `laporan_harian_pkr` (`kode_laporan_harian`, `jenis_pekerjaan`, `volume`, `lokasi`) VALUES
('102-1-PKR', 'test1', '2', 'test'),
('102-1-PKR', 'test2', '3', 'test');

--
-- Triggers `laporan_harian_pkr`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_PKR` BEFORE UPDATE ON `laporan_harian_pkr` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpkr` BEFORE INSERT ON `laporan_harian_pkr` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pr`
--

CREATE TABLE `laporan_harian_pr` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `laporan_harian_pr`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_PR` BEFORE UPDATE ON `laporan_harian_pr` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpk` BEFORE INSERT ON `laporan_harian_pr` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_tmpb`
--

CREATE TABLE `laporan_harian_tmpb` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_tmpb`
--

INSERT INTO `laporan_harian_tmpb` (`kode_laporan_harian`, `jenis`, `volume`, `lokasi`) VALUES
('102-1-TMPB', 'test1', '2', 'test'),
('102-1-TMPB', 'test2', '24', 'test');

--
-- Triggers `laporan_harian_tmpb`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_TMPB` BEFORE UPDATE ON `laporan_harian_tmpb` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexisttmpb` BEFORE INSERT ON `laporan_harian_tmpb` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_progress`
--

CREATE TABLE `laporan_progress` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_progress`
--

INSERT INTO `laporan_progress` (`id_laporan`, `dokumen`) VALUES
('102-14', '102-16-PROGRES.pdf');

--
-- Triggers `laporan_progress`
--
DELIMITER $$
CREATE TRIGGER `check_if_idlalporanexist` BEFORE INSERT ON `laporan_progress` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan harian belum terdaftar";
     END IF;
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_project`
--

CREATE TABLE `laporan_project` (
  `id_laporan` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_type` enum('LH','LP','LR','DT','LA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_dibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_dikirim` datetime NOT NULL DEFAULT current_timestamp(),
  `waktu_dikonfirmasi` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Accept','Decline','Belum Dikirim') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_project`
--

INSERT INTO `laporan_project` (`id_laporan`, `id_project`, `id_user`, `id_type`, `waktu_dibuat`, `waktu_dikirim`, `waktu_dikonfirmasi`, `status`) VALUES
('1-1', 101, 27, 'DT', '2022-12-22 15:56:27', '2022-12-08 00:00:00', '2022-12-08 00:00:00', 'Pending'),
('102-1', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-12 22:31:34', '2022-12-11 22:32:16', 'Accept'),
('102-10', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-19 11:29:49', '0000-00-00 00:00:00', 'Belum Dikirim'),
('102-11', 102, 27, 'DT', '2022-12-22 18:06:20', '2022-12-23 01:06:20', '2022-12-23 01:06:20', 'Pending'),
('102-12', 102, 27, 'LR', '2022-12-22 18:06:32', '2022-12-23 01:06:32', '2022-12-27 08:58:26', 'Accept'),
('102-13', 102, 27, 'DT', '2022-12-22 18:14:42', '2022-12-23 01:14:42', '2022-12-23 01:14:42', 'Belum Dikirim'),
('102-14', 102, 27, 'LP', '2022-12-22 19:21:04', '2022-12-23 02:21:04', '2022-12-23 02:21:04', 'Belum Dikirim'),
('102-15', 102, 18, 'LA', '2022-12-27 09:04:41', '2022-12-27 16:04:41', '2022-12-27 16:04:41', 'Accept'),
('102-16', 102, 18, 'LA', '2022-12-27 10:03:38', '2022-12-27 17:03:38', '2022-12-27 17:03:38', 'Accept'),
('102-2', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-15 00:53:10', '0000-00-00 00:00:00', 'Pending'),
('102-3', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-15 00:54:05', '0000-00-00 00:00:00', 'Pending'),
('102-4', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-15 00:54:41', '2022-12-27 08:50:23', 'Decline'),
('102-5', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-15 00:56:04', '2022-12-27 08:50:18', 'Decline'),
('102-6', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-15 00:58:58', '0000-00-00 00:00:00', 'Pending'),
('102-7', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-16 23:24:46', '0000-00-00 00:00:00', 'Pending'),
('102-8', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-18 15:22:52', '0000-00-00 00:00:00', 'Pending'),
('102-9', 102, 27, 'LH', '2022-12-22 15:56:27', '2022-12-18 16:15:34', '0000-00-00 00:00:00', 'Belum Dikirim');

--
-- Triggers `laporan_project`
--
DELIMITER $$
CREATE TRIGGER `DONT_CHANGE_SEMUAWAKTU` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF((new.waktu_dikirim <> old.waktu_dikirim OR new.waktu_dikonfirmasi <> old.waktu_dikonfirmasi OR new.waktu_dibuat <> old.waktu_dibuat) AND (old.status = 'Accept'))
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI HAPUS";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_CHANGE_WAKTU_DIKIRIM` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF((new.waktu_dikirim <> old.waktu_dikirim ) AND (old.status = 'Pending'))
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI HAPUS";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UBAH_WAKTUDIKIRIM` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF(new.waktu_dibuat <> old.waktu_dibuat)
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UBAH BRO\r\n ";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_laporan_project` AFTER INSERT ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project, ' ,id_laporan = ',NEW.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_laporan_project` AFTER UPDATE ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project, ' ,id_laporan = ',NEW.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_laporan_project` BEFORE DELETE ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project, ' ,id_laporan = ',OLD.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_ifexist_today_lh` BEFORE INSERT ON `laporan_project` FOR EACH ROW BEGIN
IF EXISTS(SELECT DATE(waktu_dikirim) FROM `laporan_project` WHERE DATE(waktu_dikirim) = CURRENT_DATE() AND status = 'Belum Dikirim' AND id_type = 'LH')
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Laporan Harian Hari ini Sudah Ada";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_laporan-project_notif_project_id_not_exist` BEFORE INSERT ON `laporan_project` FOR EACH ROW IF (new.id_project not IN(SELECT id_project FROM project)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id Project belum terdaftar";
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_laporan_harian` AFTER INSERT ON `laporan_project` FOR EACH ROW BEGIN IF (NEW.id_type = 'LH') THEN 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-CBA'), 'CBA'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PK'), 'PK'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PKR'), 'PKR');
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PR'), 'PR');
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-KJPP'), 'KJPP'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-TMPB'), 'TMPB'); 
END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_rab`
--

CREATE TABLE `laporan_rab` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_rab`
--

INSERT INTO `laporan_rab` (`id_laporan`, `dokumen`) VALUES
('102-12', '102-14-Requirment Tambahan untuk Database.pdf');

--
-- Triggers `laporan_rab`
--
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistrab` BEFORE INSERT ON `laporan_rab` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan harian belum terdaftar";
     END IF;
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_absen`
--

CREATE TABLE `log_table_absen` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_absen`
--

INSERT INTO `log_table_absen` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('absen', '2022-12-27 12:55:36', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 12:56:47', 'root@localhost', 'Update data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 12:57:53', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 13:42:47', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 7'),
('absen', '2022-12-27 13:42:59', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 11');

--
-- Triggers `log_table_absen`
--
DELIMITER $$
CREATE TRIGGER `absen_send_to_monitoring` AFTER INSERT ON `log_table_absen` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_client`
--

CREATE TABLE `log_table_client` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_client`
--

INSERT INTO `log_table_client` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('client', '2022-12-27 13:28:50', 'root@localhost', 'Insert data, id client = 7'),
('client', '2022-12-27 13:28:50', 'root@localhost', 'Update data, id client = 7'),
('client', '2022-12-27 13:29:48', 'root@localhost', 'Update data, id client = 7'),
('client', '2022-12-27 13:29:54', 'root@localhost', 'Delete data, id client = 7'),
('client', '2022-12-27 13:43:14', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:09:59', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:18', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:25', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:34', 'root@localhost', 'Update data, id client = 4'),
('client', '2022-12-27 15:27:42', 'root@localhost', 'Update data, id client = 4');

--
-- Triggers `log_table_client`
--
DELIMITER $$
CREATE TRIGGER `client_send_to_monitoring` AFTER INSERT ON `log_table_client` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_detail_project`
--

CREATE TABLE `log_table_detail_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_detail_project`
--

INSERT INTO `log_table_detail_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('detail_project', '2022-12-27 13:14:41', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104');

--
-- Triggers `log_table_detail_project`
--
DELIMITER $$
CREATE TRIGGER `detail_project_send_to_monitoring` AFTER INSERT ON `log_table_detail_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_laporan_project`
--

CREATE TABLE `log_table_laporan_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_laporan_project`
--

INSERT INTO `log_table_laporan_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('laporan_project', '2022-12-27 13:20:05', 'root@localhost', 'Insert data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:20:19', 'root@localhost', 'Update data, id project = 103 ,id_laporan = 103-2'),
('laporan_project', '2022-12-27 13:21:39', 'root@localhost', 'Insert data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:21:47', 'root@localhost', 'Delete data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:21:51', 'root@localhost', 'Delete data, id project = 103 ,id_laporan = 103-2');

--
-- Triggers `log_table_laporan_project`
--
DELIMITER $$
CREATE TRIGGER `laporan_project_send_to_monitoring` AFTER INSERT ON `log_table_laporan_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_negosiasi`
--

CREATE TABLE `log_table_negosiasi` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_negosiasi`
--

INSERT INTO `log_table_negosiasi` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('negosiasi', '2022-12-27 13:33:07', 'root@localhost', 'Insert data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 13:33:16', 'root@localhost', 'Update data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 13:33:23', 'root@localhost', 'Delete data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 14:17:18', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:17:58', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:41:51', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 15:09:43', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4');

--
-- Triggers `log_table_negosiasi`
--
DELIMITER $$
CREATE TRIGGER `negosiasi_send_to_monitoring` AFTER INSERT ON `log_table_negosiasi` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_project`
--

CREATE TABLE `log_table_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_project`
--

INSERT INTO `log_table_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('project', '2022-12-27 13:05:17', 'root@localhost', 'Update data, id project = 103'),
('project', '2022-12-27 13:05:22', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-27 13:14:19', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-27 13:43:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:08:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:23:18', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104');

--
-- Triggers `log_table_project`
--
DELIMITER $$
CREATE TRIGGER `project_send_to_monitoring` AFTER INSERT ON `log_table_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_team_project`
--

CREATE TABLE `log_table_team_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_team_project`
--

INSERT INTO `log_table_team_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('team_project', '2022-12-27 13:09:28', 'root@localhost', 'Insert data, id project = 102 ,id_user = 23'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26');

--
-- Triggers `log_table_team_project`
--
DELIMITER $$
CREATE TRIGGER `team_project_send_to_monitoring` AFTER INSERT ON `log_table_team_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_users`
--

CREATE TABLE `log_table_users` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_users`
--

INSERT INTO `log_table_users` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('users', '2022-12-27 12:39:31', 'root@localhost', 'Insert data, id user = 29'),
('users', '2022-12-27 12:40:26', 'root@localhost', 'Insert data, id user = 29'),
('users', '2022-12-27 12:46:58', 'root@localhost', 'Update data, id user = 29'),
('users', '2022-12-27 12:48:48', 'root@localhost', 'Delete data, id user = 29'),
('project', '2022-12-27 13:03:53', 'root@localhost', 'Insert data, id project = 103');

--
-- Triggers `log_table_users`
--
DELIMITER $$
CREATE TRIGGER `users_send_to_monitoring` AFTER INSERT ON `log_table_users` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_01_145509_absen', 1),
(6, '2022_12_01_145800_project', 1),
(7, '2022_12_01_145944_team_project', 1),
(8, '2022_12_01_150827_detail_project', 1),
(9, '2022_12_01_151114_laporan_project', 1),
(10, '2022_12_01_151322_negosiasi', 1),
(11, '2022_12_01_151533_client', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monitoring_log_activity`
--

CREATE TABLE `monitoring_log_activity` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `monitoring_log_activity`
--

INSERT INTO `monitoring_log_activity` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('absen', '2022-12-27 13:42:47', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 7'),
('absen', '2022-12-27 13:42:59', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 11'),
('client', '2022-12-27 13:43:14', 'root@localhost', 'Update data, id client = 6'),
('project', '2022-12-27 13:43:38', 'root@localhost', 'Delete data, id project = 103'),
('negosiasi', '2022-12-27 14:17:18', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:17:58', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:41:51', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 15:09:43', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('client', '2022-12-27 15:09:59', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:18', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:25', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:34', 'root@localhost', 'Update data, id client = 4'),
('client', '2022-12-27 15:27:42', 'root@localhost', 'Update data, id client = 4'),
('project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:08:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:23:18', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('detail_project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26');

-- --------------------------------------------------------

--
-- Table structure for table `negosiasi`
--

CREATE TABLE `negosiasi` (
  `id_negosiasi` int(10) UNSIGNED NOT NULL,
  `id_client` int(10) UNSIGNED NOT NULL,
  `sketsa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Pengerjaan','Perencanaan','Pengerjaan Dan Perencanaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `negosiasi`
--

INSERT INTO `negosiasi` (`id_negosiasi`, `id_client`, `sketsa`, `desc`, `alamat`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, '<div>halo cibay<br><br></div>', 'jl.suluh', 'Pengerjaan', NULL, NULL),
(4, 5, NULL, '<div>test isi</div>', '123123123', 'Perencanaan', NULL, NULL);

--
-- Triggers `negosiasi`
--
DELIMITER $$
CREATE TRIGGER `after_insert_negosiasi` AFTER INSERT ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Insert data, id client = ', NEW.id_client, ' ,id negosiasi = ',NEW.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_negosiasi` AFTER UPDATE ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Update data, id client = ', NEW.id_client, ' ,id negosiasi = ',NEW.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_negosiasi` BEFORE DELETE ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Delete data, id client = ', OLD.id_client, ' ,id negosiasi = ',OLD.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_negosiasi_notif_client_id_not_exist` BEFORE INSERT ON `negosiasi` FOR EACH ROW IF (new.id_client not IN(SELECT id_client FROM client)) 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, client belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_detail_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_detail_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`lokasi` varchar(255)
,`estimasi` varchar(255)
,`cost` varchar(255)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_laporan_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_laporan_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_la_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_la_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lda_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lda_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_ldp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_ldp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_ld_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_ld_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lha_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lha_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lhp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lhp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lhv_identify`
-- (See below for the actual view)
--
CREATE TABLE `pm_lhv_identify` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`nama_project` varchar(255)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lh_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lh_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lpa_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lpa_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lpp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lpp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lp_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lp_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lra_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lra_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lrp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lrp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lr_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lr_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_pb2_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_pb2_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_pb_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_pb_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_selesai_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_selesai_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_team_tp`
-- (See below for the actual view)
--
CREATE TABLE `pm_team_tp` (
`id_user` int(10) unsigned
,`id_project` int(10) unsigned
,`name` varchar(255)
,`email` varchar(255)
,`jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff')
);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `status` enum('sedang_berjalan','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sedang_berjalan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id_project`, `status`, `created_at`, `updated_at`) VALUES
(101, 'selesai', '2022-12-01 07:59:17', '2022-12-10 07:59:31'),
(102, 'sedang_berjalan', '2022-12-11 07:59:37', '2022-12-27 01:42:28'),
(103, 'sedang_berjalan', '2022-12-28 02:23:32', NULL),
(104, 'sedang_berjalan', '2022-12-28 14:23:54', NULL);

--
-- Triggers `project`
--
DELIMITER $$
CREATE TRIGGER `after_insert_project` AFTER INSERT ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_project` AFTER UPDATE ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_project` BEFORE DELETE ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_update_idproject` BEFORE UPDATE ON `project` FOR EACH ROW BEGIN
IF(new.id_project <> old.id_project)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id project tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `projectmanager_laporanakhir_project`
-- (See below for the actual view)
--
CREATE TABLE `projectmanager_laporanakhir_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_detail_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_detail_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`lokasi` varchar(255)
,`estimasi` varchar(255)
,`cost` varchar(255)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_index_project1`
-- (See below for the actual view)
--
CREATE TABLE `repository_index_project1` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_index_project2`
-- (See below for the actual view)
--
CREATE TABLE `repository_index_project2` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_lamanproject_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_lamanproject_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanakhir_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanakhir_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanakhir_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanakhir_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporandokumen_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporandokumen_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanharianview_identify`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanharianview_identify` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`nama_project` varchar(255)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanharian_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanharian_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanprogress_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanprogress_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dibuat` timestamp
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanrab_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanrab_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporan_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporan_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_team_teamproject`
-- (See below for the actual view)
--
CREATE TABLE `repository_team_teamproject` (
`id_user` int(10) unsigned
,`id_project` int(10) unsigned
,`name` varchar(255)
,`email` varchar(255)
,`jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_doktambahan`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_doktambahan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`dokumen` varchar(255)
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_lapprogress`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_lapprogress` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`dokumen` varchar(255)
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_lapproject`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_lapproject` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_laprab`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_laprab` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`dokumen` varchar(255)
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_selpro`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_selpro` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_selselesai`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_selselesai` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_tsp`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_tsp` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `team_project`
--

CREATE TABLE `team_project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_project`
--

INSERT INTO `team_project` (`id_project`, `id_user`, `created_at`, `updated_at`) VALUES
(102, 25, NULL, NULL),
(102, 26, NULL, NULL),
(102, 27, NULL, NULL),
(102, 23, NULL, NULL),
(104, 25, NULL, NULL),
(104, 26, NULL, NULL);

--
-- Triggers `team_project`
--
DELIMITER $$
CREATE TRIGGER `after_insert_team_project` AFTER INSERT ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project, ' ,id_user = ',NEW.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_team_project` AFTER UPDATE ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project, ' ,id_user = ',NEW.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_team_project` BEFORE DELETE ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project, ' ,id_user = ',OLD.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_notif_user_and_project_not_exist` BEFORE INSERT ON `team_project` FOR EACH ROW IF ( new.id_user not IN(SELECT id FROM users) AND new.id_project NOT IN(SELECT id_project FROM project))
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, User Id dan Project belum terdaftar";
ELSEIF (new.id_project NOT IN(SELECT id_project FROM project))
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, Project belum terdaftar";
ELSEIF (new.id_user not IN(SELECT id FROM users)) 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, User Id belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `jabatan`, `remember_token`, `created_at`, `updated_at`) VALUES
(18, 'direktur123', 'direktur@gmail.com', NULL, '$2y$10$rYmZSF/mMb4BEB25DDeEy.PtNvuRPzZcWr0p6Kv28eCBknoHgfQi6', 'Direktur', NULL, '2022-12-03 10:07:05', '2022-12-03 10:07:05'),
(22, 'ini adalah Direktur', 'Direktur2@gmail.com', NULL, '$2y$10$LR09dPKvPiq/A22vsq39J.dJ6tS/qMdjMavTHau5gspX1A2FCZTQK', 'Direktur', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11'),
(23, 'ini adalah Admin Web', 'adminWeb@gmail.com', NULL, '$2y$10$2i9kcC/URyEpTGQFoumjweBVf1Xw70YV.J9P78y9r2PAq0tBbXZo6', 'AdminWeb', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11'),
(24, 'ini adalah Project Manager', 'projectManager@gmail.com', NULL, '$2y$10$JgBvMJA6CMxH/5hskQbjEenhXbFfWMokJORWCHGABvkBP..TR6Xdu', 'Project_Manager', NULL, '2022-12-03 10:15:11', '2022-12-26 09:31:46'),
(25, 'ini adalah Admin', 'Admin@gmail.com', NULL, '$2y$10$mJkoflJlqBc9iQW0AP1Ad.Qxe8JLYaJoMBiQJPoBq.xUmtLZWd0dO', 'Admin', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11'),
(26, 'ini adalah Drafter', 'Drafter@gmail.com', NULL, '$2y$10$jNSnB4XViJMUoTK4uca.gOfNsaci6jU7FSarV19wR/TPJDVJeG2zu', 'Drafter', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11'),
(27, 'ini adalah Pengawas Lapangan2', 'PengawasLapangan@gmail.com', NULL, '$2y$10$Xp/K/7KhY.dxWH3m/utgouvWFheIzJRLy16yg0dmbAoCbbHHNQ.C2', 'Pengawas_Lapangan', NULL, '2022-12-03 10:15:11', '2022-12-22 12:42:44'),
(28, 'ini adalah Staff', 'Staff@gmail.com', NULL, '$2y$10$ESjP26i/ZmLTN7GgvEnRW.GcRjG3yF6L8QG3GUIQcBgnjuO9Z8RiW', 'Staff', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Insert data, id user = ', NEW.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_users` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Update data, id user = ', NEW.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_users` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Delete data, id user = ', OLD.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_id` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF (new.id <> old.id)
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Tidak bisa Merubah id";
     END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_insert_except_integer` BEFORE INSERT ON `users` FOR EACH ROW BEGIN 
IF(new.id < 0)
THEN
SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'INPUT HANYA BOLEH ANGKA';
 END IF;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `adminweb_projectberjalan`
--
DROP TABLE IF EXISTS `adminweb_projectberjalan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adminweb_projectberjalan`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `adminweb_projectsel`
--
DROP TABLE IF EXISTS `adminweb_projectsel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adminweb_projectsel`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_detail_project`
--
DROP TABLE IF EXISTS `pm_detail_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_detail_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `detail_project`.`lokasi` AS `lokasi`, `detail_project`.`estimasi` AS `estimasi`, `detail_project`.`cost` AS `cost`, `detail_project`.`deskripsi` AS `deskripsi` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_laporan_project`
--
DROP TABLE IF EXISTS `pm_laporan_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_laporan_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_la_laporan`
--
DROP TABLE IF EXISTS `pm_la_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_la_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `laporan_akhir`.`dokumen` AS `dokumen` FROM (`laporan_project` join `laporan_akhir` on(`laporan_project`.`id_laporan` = `laporan_akhir`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lda_laporan`
--
DROP TABLE IF EXISTS `pm_lda_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lda_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_ldp_laporan`
--
DROP TABLE IF EXISTS `pm_ldp_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_ldp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_ld_project`
--
DROP TABLE IF EXISTS `pm_ld_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_ld_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lha_laporan`
--
DROP TABLE IF EXISTS `pm_lha_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lha_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lhp_laporan`
--
DROP TABLE IF EXISTS `pm_lhp_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lhp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lhv_identify`
--
DROP TABLE IF EXISTS `pm_lhv_identify`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lhv_identify`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `detail_project`.`nama_project` AS `nama_project`, `users`.`name` AS `name` FROM ((`laporan_project` join `detail_project` on(`laporan_project`.`id_project` = `detail_project`.`id_project`)) join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lh_project`
--
DROP TABLE IF EXISTS `pm_lh_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lh_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lpa_laporan`
--
DROP TABLE IF EXISTS `pm_lpa_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lpa_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lpp_laporan`
--
DROP TABLE IF EXISTS `pm_lpp_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lpp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lp_project`
--
DROP TABLE IF EXISTS `pm_lp_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lp_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lra_laporan`
--
DROP TABLE IF EXISTS `pm_lra_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lra_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lrp_laporan`
--
DROP TABLE IF EXISTS `pm_lrp_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lrp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lr_project`
--
DROP TABLE IF EXISTS `pm_lr_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_lr_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_pb2_project`
--
DROP TABLE IF EXISTS `pm_pb2_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_pb2_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_pb_project`
--
DROP TABLE IF EXISTS `pm_pb_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_pb_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_selesai_project`
--
DROP TABLE IF EXISTS `pm_selesai_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_selesai_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_team_tp`
--
DROP TABLE IF EXISTS `pm_team_tp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pm_team_tp`  AS SELECT `team_project`.`id_user` AS `id_user`, `team_project`.`id_project` AS `id_project`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`jabatan` AS `jabatan` FROM (`team_project` join `users` on(`team_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `projectmanager_laporanakhir_project`
--
DROP TABLE IF EXISTS `projectmanager_laporanakhir_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projectmanager_laporanakhir_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_detail_project`
--
DROP TABLE IF EXISTS `repository_detail_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_detail_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `detail_project`.`lokasi` AS `lokasi`, `detail_project`.`estimasi` AS `estimasi`, `detail_project`.`cost` AS `cost`, `detail_project`.`deskripsi` AS `deskripsi` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_index_project1`
--
DROP TABLE IF EXISTS `repository_index_project1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_index_project1`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_index_project2`
--
DROP TABLE IF EXISTS `repository_index_project2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_index_project2`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_lamanproject_project`
--
DROP TABLE IF EXISTS `repository_lamanproject_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_lamanproject_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanakhir_laporan`
--
DROP TABLE IF EXISTS `repository_laporanakhir_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanakhir_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `laporan_akhir`.`dokumen` AS `dokumen` FROM (`laporan_project` join `laporan_akhir` on(`laporan_project`.`id_project` = `laporan_akhir`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanakhir_project`
--
DROP TABLE IF EXISTS `repository_laporanakhir_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanakhir_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporandokumen_laporan`
--
DROP TABLE IF EXISTS `repository_laporandokumen_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporandokumen_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanharianview_identify`
--
DROP TABLE IF EXISTS `repository_laporanharianview_identify`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanharianview_identify`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `detail_project`.`nama_project` AS `nama_project`, `users`.`name` AS `name` FROM ((`laporan_project` join `detail_project` on(`laporan_project`.`id_project` = `detail_project`.`id_project`)) join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanharian_laporan`
--
DROP TABLE IF EXISTS `repository_laporanharian_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanharian_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanprogress_laporan`
--
DROP TABLE IF EXISTS `repository_laporanprogress_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanprogress_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dibuat` AS `waktu_dibuat`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanrab_laporan`
--
DROP TABLE IF EXISTS `repository_laporanrab_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporanrab_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporan_project`
--
DROP TABLE IF EXISTS `repository_laporan_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_laporan_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_team_teamproject`
--
DROP TABLE IF EXISTS `repository_team_teamproject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repository_team_teamproject`  AS SELECT `team_project`.`id_user` AS `id_user`, `team_project`.`id_project` AS `id_project`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`jabatan` AS `jabatan` FROM (`team_project` join `users` on(`team_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_doktambahan`
--
DROP TABLE IF EXISTS `stafflapangan_project_doktambahan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_doktambahan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `dokumen_tambahan`.`dokumen` AS `dokumen`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_lapprogress`
--
DROP TABLE IF EXISTS `stafflapangan_project_lapprogress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_lapprogress`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_progress`.`dokumen` AS `dokumen`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_lapproject`
--
DROP TABLE IF EXISTS `stafflapangan_project_lapproject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_lapproject`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_laprab`
--
DROP TABLE IF EXISTS `stafflapangan_project_laprab`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_laprab`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_rab`.`dokumen` AS `dokumen`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_selpro`
--
DROP TABLE IF EXISTS `stafflapangan_project_selpro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_selpro`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `team_project`.`id_user` AS `id_user` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_selselesai`
--
DROP TABLE IF EXISTS `stafflapangan_project_selselesai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_selselesai`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `team_project`.`id_user` AS `id_user` FROM (`project` join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_tsp`
--
DROP TABLE IF EXISTS `stafflapangan_project_tsp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stafflapangan_project_tsp`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `team_project`.`id_user` AS `id_user` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `detail_project`
--
ALTER TABLE `detail_project`
  ADD KEY `id_project` (`id_project`);

--
-- Indexes for table `detail_sub_laporan_harian`
--
ALTER TABLE `detail_sub_laporan_harian`
  ADD PRIMARY KEY (`id_sub_laporan`);

--
-- Indexes for table `detail_type_laporan`
--
ALTER TABLE `detail_type_laporan`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `dokumen_tambahan`
--
ALTER TABLE `dokumen_tambahan`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `laporan_akhir`
--
ALTER TABLE `laporan_akhir`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD PRIMARY KEY (`kode_laporan_harian`),
  ADD KEY `id_sub_laporan` (`id_sub_laporan`),
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_harian_cba`
--
ALTER TABLE `laporan_harian_cba`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_kjpp`
--
ALTER TABLE `laporan_harian_kjpp`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pk`
--
ALTER TABLE `laporan_harian_pk`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pkr`
--
ALTER TABLE `laporan_harian_pkr`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pr`
--
ALTER TABLE `laporan_harian_pr`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_tmpb`
--
ALTER TABLE `laporan_harian_tmpb`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_project`
--
ALTER TABLE `laporan_project`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `laporan_rab`
--
ALTER TABLE `laporan_rab`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `negosiasi`
--
ALTER TABLE `negosiasi`
  ADD PRIMARY KEY (`id_negosiasi`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_project`);

--
-- Indexes for table `team_project`
--
ALTER TABLE `team_project`
  ADD KEY `team_project_ibfk_3` (`id_project`),
  ADD KEY `team_project_ibfk_2` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `negosiasi`
--
ALTER TABLE `negosiasi`
  MODIFY `id_negosiasi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id_project` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_project`
--
ALTER TABLE `detail_project`
  ADD CONSTRAINT `detail_project_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokumen_tambahan`
--
ALTER TABLE `dokumen_tambahan`
  ADD CONSTRAINT `dokumen_tambahan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_akhir`
--
ALTER TABLE `laporan_akhir`
  ADD CONSTRAINT `laporan_akhir_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD CONSTRAINT `laporan_harian_ibfk_1` FOREIGN KEY (`id_sub_laporan`) REFERENCES `detail_sub_laporan_harian` (`id_sub_laporan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_harian_ibfk_2` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_cba`
--
ALTER TABLE `laporan_harian_cba`
  ADD CONSTRAINT `laporan_harian_cba_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_kjpp`
--
ALTER TABLE `laporan_harian_kjpp`
  ADD CONSTRAINT `laporan_harian_kjpp_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pk`
--
ALTER TABLE `laporan_harian_pk`
  ADD CONSTRAINT `laporan_harian_pk_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pkr`
--
ALTER TABLE `laporan_harian_pkr`
  ADD CONSTRAINT `laporan_harian_pkr_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pr`
--
ALTER TABLE `laporan_harian_pr`
  ADD CONSTRAINT `laporan_harian_pr_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_tmpb`
--
ALTER TABLE `laporan_harian_tmpb`
  ADD CONSTRAINT `laporan_harian_tmpb_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD CONSTRAINT `laporan_progress_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_project`
--
ALTER TABLE `laporan_project`
  ADD CONSTRAINT `laporan_project_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_project_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `detail_type_laporan` (`id_type`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_project_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `laporan_rab`
--
ALTER TABLE `laporan_rab`
  ADD CONSTRAINT `laporan_rab_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `negosiasi`
--
ALTER TABLE `negosiasi`
  ADD CONSTRAINT `negosiasi_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_project`
--
ALTER TABLE `team_project`
  ADD CONSTRAINT `team_project_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_project_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
