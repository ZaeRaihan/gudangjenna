-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 08:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudangjenna`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_manager`
--

CREATE TABLE `admin_manager` (
  `id` int(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_manager`
--

INSERT INTO `admin_manager` (`id`, `username`, `password`, `nama`, `telepon`, `foto`) VALUES
(59, 'manager1', '$2y$10$Xf/OEG6s34kpgTbz3Xpo.Oh7JLFecshku1CAipqev7XGPGBFvqloi', 'Fitria', '089655680980', '64ecbff6be2f9.jpg'),
(61, 'manager2', '$2y$10$m8PQEFE9IJn/W3gWhq8O3OGBZGkiykwrT1t7..9NqItmvQYzmw1u.', 'Reza', '085975244732', '64f9951bea3f7.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_produksi`
--

CREATE TABLE `admin_produksi` (
  `id` int(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_produksi`
--

INSERT INTO `admin_produksi` (`id`, `username`, `password`, `nama`, `telepon`, `foto`) VALUES
(59, 'produksi1', '$2y$10$qn1xO1BL3wtuAeeHHUcvX.uvt1TLq5YeoBniUakWpmgUBWk3WZtk2', 'agung', '089530192639', '64e2370334172.jpg'),
(65, 'zae', '$2y$10$cfmG4DcSu4eIBJ.Q.3Pwh.7qzSizg/23U97eMZDaGPTyrulj07A1m', 'Reza', '085975244732', 'default.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `admin_qc`
--

CREATE TABLE `admin_qc` (
  `id` int(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_qc`
--

INSERT INTO `admin_qc` (`id`, `username`, `password`, `nama`, `telepon`, `foto`) VALUES
(59, 'qc1', '$2y$10$cEkvs3qzGPbC273LBtQR5OcpZw8L0kpF1oweE4BcgGYPmG/cP2Nhu', 'Fahmi', '081214988946', '64ed79ed5c1b5.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wh`
--

CREATE TABLE `admin_wh` (
  `id` int(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_wh`
--

INSERT INTO `admin_wh` (`id`, `username`, `password`, `nama`, `telepon`, `foto`) VALUES
(59, 'wh1', '$2y$10$2iyp1lyg5tT2rJhPurCqwe6phZteNqYRqpJDI48E.A7fY0Fxkeype', 'Nisa', '0895373888947', '64eb743c837c6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `barangbaku`
--

CREATE TABLE `barangbaku` (
  `idbarang_baku` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangbaku`
--

INSERT INTO `barangbaku` (`idbarang_baku`, `tgl_brg_masuk`, `sj_from_vendor`, `nama`, `stock`) VALUES
(1, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(5, '2023-09-06', 'baku-01', 'kain delusion 70 yard', 1),
(6, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(7, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(8, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(9, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(10, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(11, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(12, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(13, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(14, '2023-06-01', '1111', 'Kain haven 60 yard', 1),
(16, '2023-09-09', 'baku-01', 'kain delusion 60 yard', 1);

--
-- Triggers `barangbaku`
--
DELIMITER $$
CREATE TRIGGER `trg_barangbaku_edit` AFTER UPDATE ON `barangbaku` FOR EACH ROW BEGIN
  INSERT INTO barangbaku_history (
    idbarang_baku,
    tgl_brg_masuk,
    sj_from_vendor,
    nama,
    stock
  ) VALUES (
    OLD.idbarang_baku,
    OLD.tgl_brg_masuk,
    OLD.sj_from_vendor,
    OLD.nama,
    OLD.stock
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_baranginsewing` AFTER UPDATE ON `barangbaku` FOR EACH ROW BEGIN
    UPDATE baranginsewing
    SET nama = NEW.nama
    WHERE idbarang_baku = NEW.idbarang_baku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangbaku_history`
--

CREATE TABLE `barangbaku_history` (
  `id` int(25) NOT NULL,
  `idbarang_baku` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangbaku_history`
--

INSERT INTO `barangbaku_history` (`id`, `idbarang_baku`, `tgl_brg_masuk`, `sj_from_vendor`, `nama`, `stock`, `edit_timestamp`) VALUES
(0, 16, '2023-09-09', 'baku-01', 'kain delusion 40 yard', 1, '2023-09-09 16:49:57'),
(0, 16, '2023-09-09', 'baku-01', 'kain delusion 60 yard', 1, '2023-09-09 17:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `baranginpayet`
--

CREATE TABLE `baranginpayet` (
  `idbarang_inpayet` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_inpayet` int(255) NOT NULL,
  `stock_hasilpayet` int(255) NOT NULL,
  `vendor_payet` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_payet` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginpayet`
--

INSERT INTO `baranginpayet` (`idbarang_inpayet`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inpayet`, `stock_hasilpayet`, `vendor_payet`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_payet`) VALUES
(54, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 22),
(56, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 12, 'bu lisa', '2023-09-06', 'hasil-02', 22, 'Finished', 0),
(61, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'klee ', 'xl', 22, 12, 'bu lisa', '2023-09-06', 'hasil-02', 22, 'Finished', 0),
(62, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(63, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(64, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 12, 'bu lisa', '2023-09-06', 'hasil-02', 22, 'Finished', 0),
(65, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 12, 'bu lisa', '2023-09-06', 'hasil-02', 22, 'Finished', 0),
(66, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(67, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(68, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean', 'xl', 22, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(69, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'lisa', 'xl', 22, 12, 'bu lisa', '2023-09-06', 'hasil-02', 22, 'Finished', 0),
(70, '2023-09-06', 'payet-02', '2023-10-25', 'genshin', 'jean summer 12', 'l', 31, 10, 'bu lisa', '2023-09-06', 'hasil-02', 10, 'on progress', 0),
(71, '2023-09-07', 'payet-02', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 20, 'hoyo', '2023-09-07', 'hasil-01', 20, 'on progress', 31),
(72, '2023-09-07', 'payet-02', '2023-09-25', 'azurlane', 'haven', 'XL', 21, 21, 'hoyo', '2023-09-07', 'hasil-01', 21, 'Finished', 0),
(73, '2023-09-07', 'payet-02', '2023-09-25', 'azurlane', 'haven', 'XL', 21, 21, 'hoyo', '2023-09-07', 'hasil-01', 21, 'Finished', 0),
(74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32);

--
-- Triggers `baranginpayet`
--
DELIMITER $$
CREATE TRIGGER `trg_baranginpayet_edit` AFTER UPDATE ON `baranginpayet` FOR EACH ROW BEGIN
  INSERT INTO `baranginpayet_history` (
    `idbarang_inpayet`,
    `tgl_brg_keluar`,
    `sj_for_vendor`,
    `launching_date`,
    `collection`,
    `article_name`,
    `size`,
    `stock_inpayet`,
    `stock_hasilpayet`,
    `vendor_payet`,
    `tgl_brg_masuk`,
    `sj_from_vendor`,
    `totalstock`,
    `status`,
    `idbarang_payet`
  ) VALUES (
    OLD.`idbarang_inpayet`,
    OLD.`tgl_brg_keluar`,
    OLD.`sj_for_vendor`,
    OLD.`launching_date`,
    OLD.`collection`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock_inpayet`,
    OLD.`stock_hasilpayet`,
    OLD.`vendor_payet`,
    OLD.`tgl_brg_masuk`,
    OLD.`sj_from_vendor`,
    OLD.`totalstock`,
    OLD.`status`,
    OLD.`idbarang_payet`
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangqc_inpayet` AFTER UPDATE ON `baranginpayet` FOR EACH ROW BEGIN
    UPDATE barangqc
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_inpayet = NEW.idbarang_inpayet;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `baranginpayet_history`
--

CREATE TABLE `baranginpayet_history` (
  `id` int(25) NOT NULL,
  `idbarang_inpayet` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_inpayet` int(255) NOT NULL,
  `stock_hasilpayet` int(255) NOT NULL,
  `vendor_payet` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_payet` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginpayet_history`
--

INSERT INTO `baranginpayet_history` (`id`, `idbarang_inpayet`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inpayet`, `stock_hasilpayet`, `vendor_payet`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_payet`, `edit_timestamp`) VALUES
(30, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:18:33'),
(31, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:18:46'),
(32, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:18:54'),
(33, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:19:16'),
(34, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:27:32'),
(35, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:39:35'),
(36, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:40:15'),
(37, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:40:57'),
(38, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:41:31'),
(39, 74, '2023-09-09', 'payet-04', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 10, 'bu lisa', '2023-09-09', 'hasilpayet-01', 10, 'Finished', 32, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `baranginrevisi`
--

CREATE TABLE `baranginrevisi` (
  `idbarang_inrevisi` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_inrevisi` int(255) NOT NULL,
  `stock_hasilrevisi` int(255) NOT NULL,
  `vendor_revisi` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_revisi` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginrevisi`
--

INSERT INTO `baranginrevisi` (`idbarang_inrevisi`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inrevisi`, `stock_hasilrevisi`, `vendor_revisi`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_revisi`) VALUES
(6, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 5),
(8, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(9, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(10, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(11, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(12, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(13, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(14, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(15, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(16, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0),
(17, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'on progress', 0),
(18, '2023-09-07', 'revisi-01', '2023-09-25', 'naruto', 'boruto', 's', 1, 1, 'kanto', '2023-09-07', 'hasil-01', 1, 'Finished', 15),
(19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0);

--
-- Triggers `baranginrevisi`
--
DELIMITER $$
CREATE TRIGGER `trg_baranginrevisi_edit` AFTER UPDATE ON `baranginrevisi` FOR EACH ROW BEGIN
  INSERT INTO baranginrevisi_history (
    idbarang_inrevisi,
    tgl_brg_keluar,
    sj_for_vendor,
    launching_date,
    collection,
    article_name,
    size,
    stock_inrevisi,
    stock_hasilrevisi,
    vendor_revisi,
    tgl_brg_masuk,
    sj_from_vendor,
    totalstock,
    status,
    idbarang_revisi
  ) VALUES (
    OLD.idbarang_inrevisi,
    OLD.tgl_brg_keluar,
    OLD.sj_for_vendor,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock_inrevisi,
    OLD.stock_hasilrevisi,
    OLD.vendor_revisi,
    OLD.tgl_brg_masuk,
    OLD.sj_from_vendor,
    OLD.totalstock,
    OLD.status,
    OLD.idbarang_revisi
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `baranginrevisi_history`
--

CREATE TABLE `baranginrevisi_history` (
  `id` int(25) NOT NULL,
  `idbarang_inrevisi` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_inrevisi` int(255) NOT NULL,
  `stock_hasilrevisi` int(255) NOT NULL,
  `vendor_revisi` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_revisi` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginrevisi_history`
--

INSERT INTO `baranginrevisi_history` (`id`, `idbarang_inrevisi`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inrevisi`, `stock_hasilrevisi`, `vendor_revisi`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_revisi`, `edit_timestamp`) VALUES
(0, 19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0, '2023-09-09 17:03:00'),
(0, 19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0, '2023-09-09 17:17:42'),
(0, 19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0, '2023-09-09 17:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `baranginsewing`
--

CREATE TABLE `baranginsewing` (
  `idbarang_insewing` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_insewing` int(255) NOT NULL,
  `stock_hasilsewing` int(255) NOT NULL,
  `vendor_sewing` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_baku` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginsewing`
--

INSERT INTO `baranginsewing` (`idbarang_insewing`, `tgl_brg_keluar`, `sj_for_vendor`, `nama`, `launching_date`, `collection`, `article_name`, `size`, `stock_insewing`, `stock_hasilsewing`, `vendor_sewing`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_baku`) VALUES
(9, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 5),
(12, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(13, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(14, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(15, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(16, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(17, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(18, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(19, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(20, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(21, '2023-09-06', 'sewing-02', 'kain delusion 70 yard', '2023-09-06', 'genshin', 'diluc', 'l', 1, 20, 'bu lisa', '2023-09-06', 'hasil-02', 20, 'Finished', 0),
(22, '2023-09-07', 'sewing-01', 'Kain haven 60 yard', '2023-09-07', 'Jennaka', 'haven black top', 's', 1, 50, 'bu tati', '2023-09-07', 'hasilsewing-01', 50, 'Finished', 14),
(23, '2023-09-09', 'sewing-05', 'kain delusion 60 yard', '2023-09-09', 'genshin', 'kazuha', 'm', 1, 21, 'bu yae', '2023-09-09', 'hasilsewing-02', 21, 'Finished', 16);

--
-- Triggers `baranginsewing`
--
DELIMITER $$
CREATE TRIGGER `trg_baranginsewing_edit` AFTER UPDATE ON `baranginsewing` FOR EACH ROW BEGIN
  INSERT INTO baranginsewing_history (
    idbarang_insewing,
    tgl_brg_keluar,
    sj_for_vendor,
    nama,
    launching_date,
    collection,
    article_name,
    size,
    stock_insewing,
    stock_hasilsewing,
    vendor_sewing,
    tgl_brg_masuk,
    sj_from_vendor,
    totalstock,
    status,
    idbarang_baku
  ) VALUES (
    OLD.idbarang_insewing,
    OLD.tgl_brg_keluar,
    OLD.sj_for_vendor,
    OLD.nama,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock_insewing,
    OLD.stock_hasilsewing,
    OLD.vendor_sewing,
    OLD.tgl_brg_masuk,
    OLD.sj_from_vendor,
    OLD.totalstock,
    OLD.status,
    OLD.idbarang_baku
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangvendor` AFTER UPDATE ON `baranginsewing` FOR EACH ROW BEGIN
    UPDATE barangvendor
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_insewing = NEW.idbarang_insewing;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `baranginsewing_history`
--

CREATE TABLE `baranginsewing_history` (
  `id` int(25) NOT NULL,
  `idbarang_insewing` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_vendor` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock_insewing` int(255) NOT NULL,
  `stock_hasilsewing` int(255) NOT NULL,
  `vendor_sewing` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `totalstock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_baku` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginsewing_history`
--

INSERT INTO `baranginsewing_history` (`id`, `idbarang_insewing`, `tgl_brg_keluar`, `sj_for_vendor`, `nama`, `launching_date`, `collection`, `article_name`, `size`, `stock_insewing`, `stock_hasilsewing`, `vendor_sewing`, `tgl_brg_masuk`, `sj_from_vendor`, `totalstock`, `status`, `idbarang_baku`, `edit_timestamp`) VALUES
(0, 23, '2023-09-09', '', 'kain delusion 60 yard', '2023-09-09', '', '', '', 1, 0, '', '2023-09-09', '', 0, 'On progress', 16, '2023-09-09 16:57:57'),
(0, 23, '2023-09-09', 'sewing-05', 'kain delusion 60 yard', '2023-09-09', 'genshin', 'kazuha', 'm', 1, 21, 'bu yae', '2023-09-09', 'hasilsewing-02', 21, 'Finished', 16, '2023-09-09 16:58:07'),
(0, 23, '2023-09-09', 'sewing-05', 'kain delusion 60 yard', '2023-09-09', 'genshin', 'kazuha', 'm', 1, 21, 'bu yae', '2023-09-09', 'hasilsewing-02', 21, 'Finished', 16, '2023-09-09 17:18:59'),
(0, 23, '2023-09-09', 'sewing-05', 'kain delusion 60 yard', '2023-09-09', 'genshin', 'kazuha', 'm', 1, 21, 'bu yae', '2023-09-09', 'hasilsewing-02', 21, 'Finished', 16, '2023-09-09 17:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `idbarang_keluar` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_keluar` varchar(255) NOT NULL,
  `gudang` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `idstock` int(25) NOT NULL,
  `idstock_reject` int(25) NOT NULL,
  `idstock_minor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangkeluar`
--

INSERT INTO `barangkeluar` (`idbarang_keluar`, `tgl_brg_keluar`, `sj_keluar`, `gudang`, `article_name`, `size`, `stock`, `status`, `keterangan`, `idstock`, `idstock_reject`, `idstock_minor`) VALUES
(27, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 46, 0, 0),
(36, '2023-09-07', 'keluar-002', 'Gudang Barang Minor', 'dirani white shirt', 'all size', 1, 'Online', 'tiktok store', 0, 0, 26),
(37, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 0, 0, 0),
(38, '2023-09-07', 'keluar-002', 'Gudang Barang Minor', 'dirani white shirt', 'all size', 1, 'Online', 'tiktok store', 0, 0, 0),
(39, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 0, 0, 0),
(40, '2023-09-07', 'keluar-002', 'Gudang Barang Minor', 'dirani white shirt', 'all size', 1, 'Online', 'tiktok store', 0, 0, 0),
(41, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 0, 0, 0),
(42, '2023-09-07', 'keluar-002', 'Gudang Barang Minor', 'dirani white shirt', 'all size', 1, 'Online', 'tiktok store', 0, 0, 0),
(43, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 0, 0, 0),
(44, '2023-09-07', 'keluar-002', 'Gudang Barang Minor', 'dirani white shirt', 'all size', 1, 'Online', 'tiktok store', 0, 0, 0),
(45, '2023-09-08', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 201, 'Online', 'store', 0, 0, 0);

--
-- Triggers `barangkeluar`
--
DELIMITER $$
CREATE TRIGGER `trg_barangkeluar_edit` AFTER UPDATE ON `barangkeluar` FOR EACH ROW BEGIN
  INSERT INTO `barangkeluar_history` (
    `idbarang_keluar`,
    `tgl_brg_keluar`,
    `sj_keluar`,
    `gudang`,
    `article_name`,
    `size`,
    `stock`,
    `status`,
    `keterangan`,
    `idstock`,
    `idstock_reject`,
    `idstock_minor`
  ) VALUES (
    OLD.`idbarang_keluar`,
    OLD.`tgl_brg_keluar`,
    OLD.`sj_keluar`,
    OLD.`gudang`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`status`,
    OLD.`keterangan`,
    OLD.`idstock`,
    OLD.`idstock_reject`,
    OLD.`idstock_minor`
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangkeluar_history`
--

CREATE TABLE `barangkeluar_history` (
  `id` int(25) NOT NULL,
  `idbarang_keluar` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_keluar` varchar(255) NOT NULL,
  `gudang` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `idstock` int(25) NOT NULL,
  `idstock_reject` int(25) NOT NULL,
  `idstock_minor` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangkeluar_history`
--

INSERT INTO `barangkeluar_history` (`id`, `idbarang_keluar`, `tgl_brg_keluar`, `sj_keluar`, `gudang`, `article_name`, `size`, `stock`, `status`, `keterangan`, `idstock`, `idstock_reject`, `idstock_minor`, `edit_timestamp`) VALUES
(1, 45, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 2, 'Online', 'store', 0, 0, 0, '2023-09-08 08:19:42'),
(2, 45, '2023-09-07', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 20, 'Online', 'store', 0, 0, 0, '2023-09-08 08:20:25'),
(3, 45, '2023-09-08', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 20, 'Online', 'store', 0, 0, 0, '2023-09-08 08:20:34'),
(4, 45, '2023-09-08', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 20, 'Online', 'store', 0, 0, 0, '2023-09-09 17:56:59'),
(5, 45, '2023-09-08', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 201, 'Online', 'store', 0, 0, 0, '2023-09-09 17:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `barangpayet`
--

CREATE TABLE `barangpayet` (
  `idbarang_payet` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `idbarang_vendor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpayet`
--

INSERT INTO `barangpayet` (`idbarang_payet`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `idbarang_vendor`) VALUES
(19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 33),
(21, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 36),
(22, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 22, 'hoyoverse', 40),
(24, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 22, 'hoyoverse', 0),
(25, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0),
(26, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(27, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(28, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(29, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(30, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0),
(31, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0),
(32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53);

--
-- Triggers `barangpayet`
--
DELIMITER $$
CREATE TRIGGER `trg_barangpayet_edit` AFTER UPDATE ON `barangpayet` FOR EACH ROW BEGIN
  INSERT INTO barangpayet_history (
    idbarang_payet,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    vendor,
    idbarang_vendor
  ) VALUES (
    OLD.idbarang_payet,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.vendor,
    OLD.idbarang_vendor
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_baranginpayet` AFTER UPDATE ON `barangpayet` FOR EACH ROW BEGIN
    UPDATE baranginpayet
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_payet = NEW.idbarang_payet;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangpayet_history`
--

CREATE TABLE `barangpayet_history` (
  `id` int(25) NOT NULL,
  `idbarang_payet` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `idbarang_vendor` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpayet_history`
--

INSERT INTO `barangpayet_history` (`id`, `idbarang_payet`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `idbarang_vendor`, `edit_timestamp`) VALUES
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka1', 'm', 10, 'hoyoverse', 53, '2023-09-09 16:36:30'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:18:33'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:18:46'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:19:16'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:27:32'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:39:35'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:40:15'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:40:57'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:41:31'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `barangpinjam`
--

CREATE TABLE `barangpinjam` (
  `idbarang_pinjam` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `surat_retur` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `dipinjam` varchar(255) NOT NULL,
  `idstock` int(25) NOT NULL,
  `idstock_reject` int(25) NOT NULL,
  `idstock_minor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpinjam`
--

INSERT INTO `barangpinjam` (`idbarang_pinjam`, `tgl_brg_keluar`, `surat_retur`, `article_name`, `size`, `stock`, `dipinjam`, `idstock`, `idstock_reject`, `idstock_minor`) VALUES
(5, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing', 0, 0, 0),
(8, '2023-08-29', 'pinjam 100', 'Haven Black Shirt', 'all size', 1, 'budi', 0, 0, 0),
(12, '2023-09-06', 'pinjam-01', 'asuna bunny girl', 'm', 2, 'pak somad', 46, 0, 0),
(15, '2023-09-07', 'pinjam-01', 'dirani top peach', 'all size', 21, 'pak somad', 0, 46, 0),
(25, '2023-09-07', 'pinjam-01', 'dirani white shirt', 'all size', 1, 'pak somad', 0, 0, 26),
(26, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing', 0, 0, 0),
(27, '2023-08-29', 'pinjam 100', 'Haven Black Shirt', 'all size', 1, 'budi', 0, 0, 0),
(28, '2023-09-06', 'pinjam-01', 'asuna bunny girl', 'm', 2, 'pak somad', 0, 0, 0),
(29, '2023-09-07', 'pinjam-01', 'dirani top peach', 'all size', 21, 'pak somad', 0, 0, 0),
(30, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing', 0, 0, 0),
(31, '2023-09-06', 'pinjam-01', 'asuna bunny girl', 'm', 2, 'pak somad', 0, 0, 0),
(32, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing', 0, 0, 0),
(33, '2023-08-26', 'retur-003', 'dirani top peach', 'l', 10, 'finance', 0, 0, 0);

--
-- Triggers `barangpinjam`
--
DELIMITER $$
CREATE TRIGGER `trg_barangpinjam_edit` AFTER UPDATE ON `barangpinjam` FOR EACH ROW BEGIN
  INSERT INTO `barangpinjam_history` (
    `idbarang_pinjam`,
    `tgl_brg_keluar`,
    `surat_retur`,
    `article_name`,
    `size`,
    `stock`,
    `dipinjam`,
    `idstock`,
    `idstock_reject`,
    `idstock_minor`
  ) VALUES (
    OLD.`idbarang_pinjam`,
    OLD.`tgl_brg_keluar`,
    OLD.`surat_retur`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`dipinjam`,
    OLD.`idstock`,
    OLD.`idstock_reject`,
    OLD.`idstock_minor`
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangpinjam_history`
--

CREATE TABLE `barangpinjam_history` (
  `id` int(25) NOT NULL,
  `idbarang_pinjam` int(25) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `surat_retur` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `dipinjam` varchar(255) NOT NULL,
  `idstock` int(25) NOT NULL,
  `idstock_reject` int(25) NOT NULL,
  `idstock_minor` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpinjam_history`
--

INSERT INTO `barangpinjam_history` (`id`, `idbarang_pinjam`, `tgl_brg_keluar`, `surat_retur`, `article_name`, `size`, `stock`, `dipinjam`, `idstock`, `idstock_reject`, `idstock_minor`, `edit_timestamp`) VALUES
(1, 33, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing', 0, 0, 0, '2023-09-08 08:39:29'),
(2, 33, '2023-08-26', 'retur-003', 'dirani top peach', 'l', 10, 'finance', 0, 0, 0, '2023-09-08 08:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `barangqc`
--

CREATE TABLE `barangqc` (
  `idbarang_qc` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_qc` varchar(255) NOT NULL,
  `idbarang_vendor` int(25) NOT NULL,
  `idbarang_inpayet` int(25) NOT NULL,
  `idbarang_inrevisi` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangqc`
--

INSERT INTO `barangqc` (`idbarang_qc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `tgl_brg_keluar`, `sj_for_qc`, `idbarang_vendor`, `idbarang_inpayet`, `idbarang_inrevisi`) VALUES
(103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', '2023-09-04', 'qc-01', 32, 0, 0),
(104, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'hoyo', '2023-09-04', 'qc-02', 0, 45, 0),
(114, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 12, 'bu lisa', '2023-09-06', 'qc-03', 0, 56, 0),
(116, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 10, 'kanto', '2023-09-06', 'qc-03', 0, 0, 6),
(121, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', '2023-09-04', 'qc-01', 0, 0, 0),
(122, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'hoyo', '2023-09-04', 'qc-02', 0, 0, 0),
(123, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 12, 'bu lisa', '2023-09-06', 'qc-03', 0, 0, 0),
(124, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 10, 'kanto', '2023-09-06', 'qc-03', 0, 0, 0),
(125, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', '2023-09-04', 'qc-01', 0, 0, 0),
(126, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 12, 'bu lisa', '2023-09-06', 'qc-03', 0, 0, 0),
(127, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 12, 'bu lisa', '2023-09-06', 'qc-03', 0, 0, 0),
(128, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 10, 'kanto', '2023-09-06', 'qc-03', 0, 0, 0),
(129, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'hoyo', '2023-09-04', 'qc-02', 0, 0, 0),
(130, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 21, 'masashi', '2023-09-07', 'qc-03', 49, 0, 0),
(131, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 1, 'kanto', '2023-09-07', 'hasilrevisi-01', 0, 0, 18),
(132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0);

--
-- Triggers `barangqc`
--
DELIMITER $$
CREATE TRIGGER `trg_barangqc_edit` AFTER UPDATE ON `barangqc` FOR EACH ROW BEGIN
  INSERT INTO barangqc_history (
    idbarang_qc,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    vendor,
    tgl_brg_keluar,
    sj_for_qc,
    idbarang_vendor,
    idbarang_inpayet,
    idbarang_inrevisi
  ) VALUES (
    OLD.idbarang_qc,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.vendor,
    OLD.tgl_brg_keluar,
    OLD.sj_for_qc,
    OLD.idbarang_vendor,
    OLD.idbarang_inpayet,
    OLD.idbarang_inrevisi
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barang_lolosqc` AFTER UPDATE ON `barangqc` FOR EACH ROW BEGIN
    UPDATE barang_lolosqc
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_qc = NEW.idbarang_qc;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barang_minor` AFTER UPDATE ON `barangqc` FOR EACH ROW BEGIN
    UPDATE barang_minor
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_qc = NEW.idbarang_qc;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barang_reject` AFTER UPDATE ON `barangqc` FOR EACH ROW BEGIN
    UPDATE barang_reject
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_qc = NEW.idbarang_qc;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangrevisi` AFTER UPDATE ON `barangqc` FOR EACH ROW BEGIN
    UPDATE barangrevisi
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_qc = NEW.idbarang_qc;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangqc_history`
--

CREATE TABLE `barangqc_history` (
  `id` int(25) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_qc` varchar(255) NOT NULL,
  `idbarang_vendor` int(25) NOT NULL,
  `idbarang_inpayet` int(25) NOT NULL,
  `idbarang_inrevisi` int(255) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangqc_history`
--

INSERT INTO `barangqc_history` (`id`, `idbarang_qc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `tgl_brg_keluar`, `sj_for_qc`, `idbarang_vendor`, `idbarang_inpayet`, `idbarang_inrevisi`, `edit_timestamp`) VALUES
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:18:41'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:19:16'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:27:23'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:27:32'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:30:59'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:39:35'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:40:15'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:40:57'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:41:31'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `barangretur`
--

CREATE TABLE `barangretur` (
  `idbarang_retur` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `surat_retur` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangretur`
--

INSERT INTO `barangretur` (`idbarang_retur`, `tgl_brg_masuk`, `surat_retur`, `article_name`, `size`, `stock`) VALUES
(1, '2023-08-26', 'retur-001', 'Haven White Shirt', 's', 11),
(4, '2023-07-01', 'retur-002', 'Haven Black Shirt', 's-m', 21),
(5, '2023-09-01', 'retur-003', 'dirani top peach', 'l-xl', 1),
(8, '2023-08-26', 'retur-001', 'Haven White Shirt', 's', 11),
(9, '2023-07-01', 'retur-002', 'Haven Black Shirt', 's-m', 21),
(10, '2023-08-26', 'retur-001', 'Haven White Shirt', 's', 11),
(11, '2023-09-01', 'retur-003', 'dirani top peach', 'l-xl', 1),
(12, '2023-08-26', 'retur-001', 'Haven White Shirt', 's', 11),
(13, '2023-09-01', 'retur-003', 'dirani top peach', 'l-xl', 1),
(14, '2023-08-26', 'retur-001', 'Haven White Shirt', 's', 11),
(15, '2023-09-08', 'retur-003', 'dirani top peach', 'm', 122);

--
-- Triggers `barangretur`
--
DELIMITER $$
CREATE TRIGGER `trg_barangretur_edit` AFTER UPDATE ON `barangretur` FOR EACH ROW BEGIN
  INSERT INTO `barangretur_history` (
    `idbarang_retur`,
    `tgl_brg_masuk`,
    `surat_retur`,
    `article_name`,
    `size`,
    `stock`
  ) VALUES (
    OLD.`idbarang_retur`,
    OLD.`tgl_brg_masuk`,
    OLD.`surat_retur`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangretur_history`
--

CREATE TABLE `barangretur_history` (
  `id` int(25) NOT NULL,
  `idbarang_retur` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `surat_retur` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangretur_history`
--

INSERT INTO `barangretur_history` (`id`, `idbarang_retur`, `tgl_brg_masuk`, `surat_retur`, `article_name`, `size`, `stock`, `edit_timestamp`) VALUES
(1, 15, '2023-09-01', 'retur-003', 'dirani top peach', 'l-xl', 1, '2023-09-08 08:29:02'),
(2, 15, '2023-09-08', 'retur-003', 'dirani top peach', 'm', 12, '2023-09-08 08:30:35'),
(3, 15, '2023-09-08', 'retur-003', 'dirani top peach', 'm', 12, '2023-09-09 17:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `barangrevisi`
--

CREATE TABLE `barangrevisi` (
  `idbarang_revisi` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_produksi` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangrevisi`
--

INSERT INTO `barangrevisi` (`idbarang_revisi`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_produksi`, `idbarang_qc`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 1, '2023-07-10', '32063', 0),
(2, '2023-08-29', '2023-09-25', 'seraphina', 'dirani top white', 'all size', 1, '2023-07-10', '32063', 0),
(5, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, '2023-09-04', 'revisi-01', 104),
(6, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'revisi-02', 116),
(7, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 1, '2023-07-10', '32063', 0),
(8, '2023-08-29', '2023-09-25', 'seraphina', 'dirani top white', 'all size', 1, '2023-07-10', '32063', 0),
(9, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, '2023-09-04', 'revisi-01', 0),
(10, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'revisi-02', 0),
(11, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 1, '2023-07-10', '32063', 0),
(12, '2023-08-29', '2023-09-25', 'seraphina', 'dirani top white', 'all size', 1, '2023-07-10', '32063', 0),
(13, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, '2023-09-04', 'revisi-01', 0),
(14, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'revisi-02', 0),
(15, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 1, '2023-09-07', 'revisi-05', 130),
(16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132);

--
-- Triggers `barangrevisi`
--
DELIMITER $$
CREATE TRIGGER `trg_barangrevisi_edit` AFTER UPDATE ON `barangrevisi` FOR EACH ROW BEGIN
  INSERT INTO barangrevisi_history (
    idbarang_revisi,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    tgl_brg_keluar,
    sj_for_produksi,
    idbarang_qc
  ) VALUES (
    OLD.idbarang_revisi,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.tgl_brg_keluar,
    OLD.sj_for_produksi,
    OLD.idbarang_qc
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_baranginrevisi` AFTER UPDATE ON `barangrevisi` FOR EACH ROW BEGIN
    UPDATE baranginrevisi
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size
    WHERE idbarang_revisi = NEW.idbarang_revisi;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangrevisi_history`
--

CREATE TABLE `barangrevisi_history` (
  `id` int(25) NOT NULL,
  `idbarang_revisi` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_produksi` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangrevisi_history`
--

INSERT INTO `barangrevisi_history` (`id`, `idbarang_revisi`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_produksi`, `idbarang_qc`, `edit_timestamp`) VALUES
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 0, '2023-09-10', '', 132, '2023-09-09 17:34:13'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:34:24'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:39:35'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:40:15'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:40:57'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:41:31'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'revisi-01', 132, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `barangvendor`
--

CREATE TABLE `barangvendor` (
  `idbarang_vendor` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_insewing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangvendor`
--

INSERT INTO `barangvendor` (`idbarang_vendor`, `tgl_brg_masuk`, `sj_from_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `status`, `idbarang_insewing`) VALUES
(32, '2023-09-02', 'vendor-01    ', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', 'QC', 0),
(33, '2023-09-03', 'vendor-01                            ', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 'Payet', 0),
(36, '2023-09-05', 'vendor-01 ', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 'QC', 3),
(39, '2023-09-06', 'vendor-02', '2023-10-25', 'genshin', 'klee ', 'M', 22, 'hoyoverse', 'QC', 0),
(40, '2023-09-06', 'vendor-02 ', '2023-10-25', 'genshin', 'jean', 'xl', 22, 'hoyoverse', 'Payet', 0),
(41, '2023-09-06', 'hasil-02   ', '2023-09-06', 'genshin', 'diluc splendor', 'l', 21, 'bu lisa', 'QC', 9),
(44, '2023-09-07', 'hasil-03 ', '2023-09-25', 'genshin', 'diluc skin', 'l-xl', 212, 'bu lisa', 'QC', 0),
(45, '2023-09-07', 'hasil-03 ', '2023-09-25', 'genshin', 'diluc skin', 'l-xl', 212, 'bu lisa', 'QC', 0),
(46, '2023-09-07', 'hasil-03 ', '2023-09-25', 'genshin', 'diluc skin', 'l-xl', 212, 'bu lisa', 'QC', 0),
(47, '2023-09-07', 'hasil-03 ', '2023-09-25', 'genshin', 'diluc skin', 'l-xl', 212, 'bu lisa', 'QC', 0),
(48, '2023-09-07', 'hasil-03 ', '2023-09-25', 'genshin', 'diluc skin', 'l-xl', 212, 'bu lisa', 'QC', 0),
(49, '2023-09-07', 'vendor-05', '2023-09-25', 'naruto', 'boruto', 's', 21, 'masashi', 'QC', 0),
(50, '2023-09-07', 'hasilsewing-01  ', '2023-09-07', 'Jennaka', 'haven black top', 's', 50, 'bu tati', 'Payet', 22),
(51, '2023-09-07', 'vendor-02 ', '2023-09-07', 'Jennaka', 'haven black top', 's', 50, 'bu tati', 'Payet', 22),
(52, '2023-09-09', 'vendor-11', '2023-10-05', 'genshin', 'yoimiya', 'm', 10, 'hoyoverse', 'QC', 0),
(55, '2023-09-09', 'vendor-11            ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyo', 'Payet', 0);

--
-- Triggers `barangvendor`
--
DELIMITER $$
CREATE TRIGGER `trg_barangvendor_edit` AFTER UPDATE ON `barangvendor` FOR EACH ROW BEGIN
  INSERT INTO `barangvendor_history` (
    `idbarang_vendor`,
    `tgl_brg_masuk`,
    `sj_from_vendor`,
    `launching_date`,
    `collection`,
    `article_name`,
    `size`,
    `stock`,
    `vendor`,
    `status`,
    `idbarang_insewing`
  ) VALUES (
    OLD.`idbarang_vendor`,
    OLD.`tgl_brg_masuk`,
    OLD.`sj_from_vendor`,
    OLD.`launching_date`,
    OLD.`collection`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`vendor`,
    OLD.`status`,
    OLD.`idbarang_insewing`
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangpayet` AFTER UPDATE ON `barangvendor` FOR EACH ROW BEGIN
    UPDATE barangpayet
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size,
        vendor = NEW.vendor
    WHERE idbarang_vendor = NEW.idbarang_vendor;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangqc` AFTER UPDATE ON `barangvendor` FOR EACH ROW BEGIN
    UPDATE barangqc
    SET launching_date = NEW.launching_date,
        collection = NEW.collection,
        article_name = NEW.article_name,
        size = NEW.size,
        vendor = NEW.vendor
    WHERE idbarang_vendor = NEW.idbarang_vendor;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barangvendor_history`
--

CREATE TABLE `barangvendor_history` (
  `id` int(25) NOT NULL,
  `idbarang_vendor` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_insewing` int(11) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangvendor_history`
--

INSERT INTO `barangvendor_history` (`id`, `idbarang_vendor`, `tgl_brg_masuk`, `sj_from_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `status`, `idbarang_insewing`, `edit_timestamp`) VALUES
(6, 53, '2023-09-09', 'vendor-11  ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:18:33'),
(7, 53, '2023-09-09', 'vendor-11   ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:19:16'),
(8, 53, '2023-09-09', 'vendor-11    ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:27:32'),
(9, 53, '2023-09-09', 'vendor-11     ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:39:35'),
(10, 53, '2023-09-09', 'vendor-11      ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:40:15'),
(11, 53, '2023-09-09', 'vendor-11       ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:40:57'),
(12, 53, '2023-09-09', 'vendor-11        ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:41:31'),
(13, 53, '2023-09-09', 'vendor-11         ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:42:46'),
(14, 55, '2023-09-09', 'vendor-11          ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 'Payet', 0, '2023-09-09 17:43:19'),
(15, 55, '2023-09-09', 'vendor-11           ', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyo', 'Payet', 0, '2023-09-09 17:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `barang_lolosqc`
--

CREATE TABLE `barang_lolosqc` (
  `idbarang_lolosqc` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_lolosqc`
--

INSERT INTO `barang_lolosqc` (`idbarang_lolosqc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`) VALUES
(75, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'l-xl', 100, '2023-07-10', '32060', 0),
(76, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(77, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060', 0),
(78, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060', 0),
(79, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060', 0),
(80, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060', 0),
(133, '2022-01-08', '2023-08-11', 'Jennaka', 'black pink in your area', 'all size', 22, '2024-04-27', '1111', 0),
(135, '2022-01-08', '2023-08-11', 'Jennaka', 'black pink', 'all size', 222, '2024-04-27', '2222', 0),
(152, '2023-06-30', '2023-07-07', 'Jennaka', 'blackdot', 'all size', 32343, '2023-09-19', '00001', 0),
(212, '2023-06-29', '2023-06-30', 'hell', 'reddot headshot', 'XL', 25, '2023-07-28', '22234', 0),
(231, '2023-08-01', '2023-09-25', 'Jennaka', 'haven', 'all size', 25, '2023-08-31', '1111', 0),
(233, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111', 0),
(234, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111', 0),
(235, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111', 0),
(236, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234', 0),
(237, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234', 0),
(238, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(239, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(240, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(241, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(242, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(243, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060', 0),
(244, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234', 0),
(245, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234', 0),
(271, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234', 0),
(276, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white top', 'all size', 25, '2023-09-01', '1111', 0),
(282, '2023-08-19', '2023-09-25', 'Jennaka', 'haven', 'all size', 25, '2023-09-01', '222', 0),
(283, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(295, '2023-08-31', '2023-09-05', 'Jennaka', 'haven', 'l-xl', 20, '2023-09-01', 'wh-01', 0),
(296, '2023-08-31', '2023-09-05', 'Jennaka', 'haven', 'l-xl', 20, '2023-09-01', 'wh-01', 0),
(297, '2023-09-02', '2023-09-02', 'Jennaka', 'havens', 's-m', 211, '2023-09-02', '11', 0),
(303, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 116),
(304, '2023-09-02', '2023-09-02', 'Jennaka', 'havens', 's-m', 211, '2023-09-02', '11', 0),
(305, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(306, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(307, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(308, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(309, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(310, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(311, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(312, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(313, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(314, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(315, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(316, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(317, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(318, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(319, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(320, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(321, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(322, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'lolos-02', 0),
(323, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(324, '2023-08-31', '2023-09-05', 'Jennaka', 'haven', 'l-xl', 20, '2023-09-01', 'wh-01', 0),
(325, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111', 0),
(326, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(327, '2023-08-31', '2023-09-05', 'Jennaka', 'haven', 'l-xl', 20, '2023-09-01', 'wh-01', 0),
(328, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(329, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(330, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(331, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(332, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white shirt', 'all size', 25, '2023-09-01', '1111', 0),
(334, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 20, '2023-09-07', 'wh-01', 130),
(336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132);

--
-- Triggers `barang_lolosqc`
--
DELIMITER $$
CREATE TRIGGER `trg_barang_lolosqc_edit` AFTER UPDATE ON `barang_lolosqc` FOR EACH ROW BEGIN
  INSERT INTO barang_lolosqc_history (
    idbarang_lolosqc,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    tgl_brg_keluar,
    sj_for_wh,
    idbarang_qc
  ) VALUES (
    OLD.idbarang_lolosqc,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.tgl_brg_keluar,
    OLD.sj_for_wh,
    OLD.idbarang_qc
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_lolosqc_history`
--

CREATE TABLE `barang_lolosqc_history` (
  `id` int(25) NOT NULL,
  `idbarang_lolosqc` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_lolosqc_history`
--

INSERT INTO `barang_lolosqc_history` (`id`, `idbarang_lolosqc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`, `edit_timestamp`) VALUES
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-02', 132, '2023-09-09 17:27:23'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-02', 132, '2023-09-09 17:27:32'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-02', 132, '2023-09-09 17:27:46'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-02', 132, '2023-09-09 17:27:53'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:30:59'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:39:35'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:40:15'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:40:57'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:41:31'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `barang_minor`
--

CREATE TABLE `barang_minor` (
  `idbarang_minor` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_minor`
--

INSERT INTO `barang_minor` (`idbarang_minor`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32062', 0),
(2, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(4, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'minor-02', 116),
(5, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32062', 0),
(6, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(7, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'minor-02', 0),
(8, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(9, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(10, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(11, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01', 0),
(12, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'minor-02', 0),
(13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132);

--
-- Triggers `barang_minor`
--
DELIMITER $$
CREATE TRIGGER `trg_barang_minor_edit` AFTER UPDATE ON `barang_minor` FOR EACH ROW BEGIN
  INSERT INTO barang_minor_history (
    idbarang_minor,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    tgl_brg_keluar,
    sj_for_wh,
    idbarang_qc
  ) VALUES (
    OLD.idbarang_minor,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.tgl_brg_keluar,
    OLD.sj_for_wh,
    OLD.idbarang_qc
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_minor_history`
--

CREATE TABLE `barang_minor_history` (
  `id` int(25) NOT NULL,
  `idbarang_minor` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_minor_history`
--

INSERT INTO `barang_minor_history` (`id`, `idbarang_minor`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`, `edit_timestamp`) VALUES
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 0, '2023-09-10', '1', 132, '2023-09-09 17:30:35'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:30:59'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:39:35'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:40:15'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:40:57'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:41:31'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `barang_reject`
--

CREATE TABLE `barang_reject` (
  `idbarang_reject` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_reject`
--

INSERT INTO `barang_reject` (`idbarang_reject`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32061', 0),
(3, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(4, '2023-08-29', '2023-08-25', 'seraph', 'dirani top white', 'xl', 100, '2023-08-26', '49001', 0),
(8, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'reject-02', 116),
(9, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32061', 0),
(10, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(11, '2023-08-29', '2023-08-25', 'seraph', 'dirani top white', 'xl', 100, '2023-08-26', '49001', 0),
(12, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'reject-02', 0),
(13, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32061', 0),
(14, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(15, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 2, '2023-09-06', 'reject-02', 0),
(16, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(17, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(18, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001', 0),
(19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132);

--
-- Triggers `barang_reject`
--
DELIMITER $$
CREATE TRIGGER `trg_barang_reject_edit` AFTER UPDATE ON `barang_reject` FOR EACH ROW BEGIN
  INSERT INTO barang_reject_history (
    idbarang_reject,
    tgl_brg_masuk,
    launching_date,
    collection,
    article_name,
    size,
    stock,
    tgl_brg_keluar,
    sj_for_wh,
    idbarang_qc
  ) VALUES (
    OLD.idbarang_reject,
    OLD.tgl_brg_masuk,
    OLD.launching_date,
    OLD.collection,
    OLD.article_name,
    OLD.size,
    OLD.stock,
    OLD.tgl_brg_keluar,
    OLD.sj_for_wh,
    OLD.idbarang_qc
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_reject_history`
--

CREATE TABLE `barang_reject_history` (
  `id` int(25) NOT NULL,
  `idbarang_reject` int(25) NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `launching_date` date NOT NULL,
  `collection` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(15) NOT NULL,
  `stock` int(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_wh` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_reject_history`
--

INSERT INTO `barang_reject_history` (`id`, `idbarang_reject`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`, `idbarang_qc`, `edit_timestamp`) VALUES
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-01', 132, '2023-09-09 17:27:23'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-01', 132, '2023-09-09 17:27:32'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-01', 132, '2023-09-09 17:28:01'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:28:13'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:30:59'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:39:35'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:40:15'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:40:57'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:41:31'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `gudangminor`
--

CREATE TABLE `gudangminor` (
  `idstock_minor` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_minor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangminor`
--

INSERT INTO `gudangminor` (`idstock_minor`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_minor`) VALUES
(25, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(26, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(30, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(31, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(32, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(33, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(34, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(35, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(36, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(37, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0),
(38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 200, 5890000, '3d 3c', 'kardus', '0 - 3 BULAN', 0);

--
-- Triggers `gudangminor`
--
DELIMITER $$
CREATE TRIGGER `trg_gudangminor_edit` AFTER UPDATE ON `gudangminor` FOR EACH ROW BEGIN
  INSERT INTO `gudangminor_history` (
    `idstock_minor`,
    `kode`,
    `collection`,
    `kategori`,
    `article_name`,
    `size`,
    `stock`,
    `harga`,
    `rak`,
    `lokasi`,
    `umur`,
    `idbarang_minor`
  ) VALUES (
    OLD.`idstock_minor`,
    OLD.`kode`,
    OLD.`collection`,
    OLD.`kategori`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`harga`,
    OLD.`rak`,
    OLD.`lokasi`,
    OLD.`umur`,
    OLD.`idbarang_minor`
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangkeluar_minor` AFTER UPDATE ON `gudangminor` FOR EACH ROW BEGIN
    UPDATE barangkeluar
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock_minor = NEW.idstock_minor;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangpinjam_minor` AFTER UPDATE ON `gudangminor` FOR EACH ROW BEGIN
    UPDATE barangpinjam
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock_minor = NEW.idstock_minor;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudangminor_history`
--

CREATE TABLE `gudangminor_history` (
  `id` int(25) NOT NULL,
  `idstock_minor` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_minor` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangminor_history`
--

INSERT INTO `gudangminor_history` (`id`, `idstock_minor`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_minor`, `edit_timestamp`) VALUES
(1, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-08 08:04:05'),
(2, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-08 08:04:20'),
(3, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 20, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-08 08:04:28'),
(4, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 20, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-09 17:55:16'),
(5, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 200, 5890000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-09 17:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `gudangreject`
--

CREATE TABLE `gudangreject` (
  `idstock_reject` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_reject` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangreject`
--

INSERT INTO `gudangreject` (`idstock_reject`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_reject`) VALUES
(25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0),
(46, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0),
(52, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0),
(53, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0),
(54, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0),
(55, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0),
(56, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0),
(57, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0),
(58, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0),
(59, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0),
(60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 5, 5890000, '3d', 'rak', '0 - 3 BULAN', 0);

--
-- Triggers `gudangreject`
--
DELIMITER $$
CREATE TRIGGER `trg_gudangreject_edit` AFTER UPDATE ON `gudangreject` FOR EACH ROW BEGIN
  INSERT INTO `gudangreject_history` (
    `idstock_reject`,
    `kode`,
    `collection`,
    `kategori`,
    `article_name`,
    `size`,
    `stock`,
    `harga`,
    `rak`,
    `lokasi`,
    `umur`,
    `idbarang_reject`
  ) VALUES (
    OLD.`idstock_reject`,
    OLD.`kode`,
    OLD.`collection`,
    OLD.`kategori`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`harga`,
    OLD.`rak`,
    OLD.`lokasi`,
    OLD.`umur`,
    OLD.`idbarang_reject`
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangkeluar_reject` AFTER UPDATE ON `gudangreject` FOR EACH ROW BEGIN
    UPDATE barangkeluar
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock_reject = NEW.idstock_reject;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangpinjam_reject` AFTER UPDATE ON `gudangreject` FOR EACH ROW BEGIN
    UPDATE barangpinjam
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock_reject = NEW.idstock_reject;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudangreject_history`
--

CREATE TABLE `gudangreject_history` (
  `id` int(25) NOT NULL,
  `idstock_reject` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_reject` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangreject_history`
--

INSERT INTO `gudangreject_history` (`id`, `idstock_reject`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_reject`, `edit_timestamp`) VALUES
(1, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0, '2023-09-08 07:58:41'),
(2, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 40, 589000, '3d', 'rak', '0 - 3 BULAN', 0, '2023-09-08 07:58:50'),
(3, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '0 - 3 BULAN', 0, '2023-09-09 17:53:51'),
(4, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 5, 5890000, '3d', 'rak', '0 - 3 BULAN', 0, '2023-09-09 17:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `stockgudang`
--

CREATE TABLE `stockgudang` (
  `idstock` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_lolosqc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockgudang`
--

INSERT INTO `stockgudang` (`idstock`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_lolosqc`) VALUES
(25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'rak', '13-18 bulan', 0),
(30, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(43, 'db-01', 'DRAGONBALL', 'OUTER', 'goku', 's-l', 212, 1000000, '1l', 'kresek', '0 - 3 BULAN', 0),
(46, 'lane-01', 'azurlane', 'shirt', 'asuna bunny girl', 'm', 2, 1000000, '1l', 'rak', '0 - 3 BULAN', 303),
(48, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'rak', '13-18 bulan', 0),
(49, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(50, 'db-01', 'DRAGONBALL', 'OUTER', 'goku', 's-l', 212, 1000000, '1l', 'kresek', '0 - 3 BULAN', 0),
(51, 'lane-01', 'azurlane', 'shirt', 'asuna bunny girl', 'm', 2, 1000000, '1l', 'rak', '0 - 3 BULAN', 0),
(52, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'rak', '13-18 bulan', 0),
(53, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0),
(54, 'lane-01', 'azurlane', 'shirt', 'asuna bunny girl', 'm', 2, 1000000, '1l', 'rak', '0 - 3 BULAN', 0),
(55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'rak', '4 - 6 BULAN', 0);

--
-- Triggers `stockgudang`
--
DELIMITER $$
CREATE TRIGGER `trg_stockgudang_edit` AFTER UPDATE ON `stockgudang` FOR EACH ROW BEGIN
  INSERT INTO `stockgudang_history` (
    `idstock`,
    `kode`,
    `collection`,
    `kategori`,
    `article_name`,
    `size`,
    `stock`,
    `harga`,
    `rak`,
    `lokasi`,
    `umur`,
    `idbarang_lolosqc`
  ) VALUES (
    OLD.`idstock`,
    OLD.`kode`,
    OLD.`collection`,
    OLD.`kategori`,
    OLD.`article_name`,
    OLD.`size`,
    OLD.`stock`,
    OLD.`harga`,
    OLD.`rak`,
    OLD.`lokasi`,
    OLD.`umur`,
    OLD.`idbarang_lolosqc`
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangkeluar` AFTER UPDATE ON `stockgudang` FOR EACH ROW BEGIN
    UPDATE barangkeluar
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock = NEW.idstock;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_barangpinjam` AFTER UPDATE ON `stockgudang` FOR EACH ROW BEGIN
    UPDATE barangpinjam
    SET article_name = NEW.article_name,
        size = NEW.size
    WHERE idstock = NEW.idstock;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stockgudang_history`
--

CREATE TABLE `stockgudang_history` (
  `id` int(25) NOT NULL,
  `idstock` int(15) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `article_name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `idbarang_lolosqc` int(11) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockgudang_history`
--

INSERT INTO `stockgudang_history` (`id`, `idstock`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`, `idbarang_lolosqc`, `edit_timestamp`) VALUES
(7, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-08 07:50:14'),
(8, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-08 07:50:34'),
(9, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-08 07:50:43'),
(10, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'kardus', '0 - 3 BULAN', 0, '2023-09-08 07:50:55'),
(11, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'kardus', '4 - 6 BULAN', 0, '2023-09-08 07:51:07'),
(12, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'eak', '4 - 6 BULAN', 0, '2023-09-08 07:51:17'),
(13, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'rak', '4 - 6 BULAN', 0, '2023-09-08 16:07:47'),
(14, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent skin', 'm', 20, 1000000, '3d', 'rak', '4 - 6 BULAN', 0, '2023-09-08 16:07:59'),
(15, 55, 'JNK-2380', 'genshin', 'top', 'keqing opulent', 'm', 20, 1000000, '3d', 'rak', '4 - 6 BULAN', 0, '2023-09-09 17:46:32'),
(16, 56, 'JNK-2376', 'azurlane', 'BAG', 'black pink', 'all size', 12, 100000, '3d', 'Kontainer', '&gt; 24 BULAN', 0, '2023-09-09 17:50:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_manager`
--
ALTER TABLE `admin_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_produksi`
--
ALTER TABLE `admin_produksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_qc`
--
ALTER TABLE `admin_qc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wh`
--
ALTER TABLE `admin_wh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangbaku`
--
ALTER TABLE `barangbaku`
  ADD PRIMARY KEY (`idbarang_baku`);

--
-- Indexes for table `baranginpayet`
--
ALTER TABLE `baranginpayet`
  ADD PRIMARY KEY (`idbarang_inpayet`);

--
-- Indexes for table `baranginpayet_history`
--
ALTER TABLE `baranginpayet_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baranginrevisi`
--
ALTER TABLE `baranginrevisi`
  ADD PRIMARY KEY (`idbarang_inrevisi`);

--
-- Indexes for table `baranginsewing`
--
ALTER TABLE `baranginsewing`
  ADD PRIMARY KEY (`idbarang_insewing`);

--
-- Indexes for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD PRIMARY KEY (`idbarang_keluar`);

--
-- Indexes for table `barangkeluar_history`
--
ALTER TABLE `barangkeluar_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangpayet`
--
ALTER TABLE `barangpayet`
  ADD PRIMARY KEY (`idbarang_payet`);

--
-- Indexes for table `barangpinjam`
--
ALTER TABLE `barangpinjam`
  ADD PRIMARY KEY (`idbarang_pinjam`);

--
-- Indexes for table `barangpinjam_history`
--
ALTER TABLE `barangpinjam_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangqc`
--
ALTER TABLE `barangqc`
  ADD PRIMARY KEY (`idbarang_qc`);

--
-- Indexes for table `barangretur`
--
ALTER TABLE `barangretur`
  ADD PRIMARY KEY (`idbarang_retur`);

--
-- Indexes for table `barangretur_history`
--
ALTER TABLE `barangretur_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangrevisi`
--
ALTER TABLE `barangrevisi`
  ADD PRIMARY KEY (`idbarang_revisi`);

--
-- Indexes for table `barangvendor`
--
ALTER TABLE `barangvendor`
  ADD PRIMARY KEY (`idbarang_vendor`);

--
-- Indexes for table `barangvendor_history`
--
ALTER TABLE `barangvendor_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_lolosqc`
--
ALTER TABLE `barang_lolosqc`
  ADD PRIMARY KEY (`idbarang_lolosqc`);

--
-- Indexes for table `barang_minor`
--
ALTER TABLE `barang_minor`
  ADD PRIMARY KEY (`idbarang_minor`);

--
-- Indexes for table `barang_reject`
--
ALTER TABLE `barang_reject`
  ADD PRIMARY KEY (`idbarang_reject`);

--
-- Indexes for table `gudangminor`
--
ALTER TABLE `gudangminor`
  ADD PRIMARY KEY (`idstock_minor`);

--
-- Indexes for table `gudangminor_history`
--
ALTER TABLE `gudangminor_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudangreject`
--
ALTER TABLE `gudangreject`
  ADD PRIMARY KEY (`idstock_reject`);

--
-- Indexes for table `gudangreject_history`
--
ALTER TABLE `gudangreject_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockgudang`
--
ALTER TABLE `stockgudang`
  ADD PRIMARY KEY (`idstock`);

--
-- Indexes for table `stockgudang_history`
--
ALTER TABLE `stockgudang_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_manager`
--
ALTER TABLE `admin_manager`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `admin_produksi`
--
ALTER TABLE `admin_produksi`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `admin_qc`
--
ALTER TABLE `admin_qc`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `admin_wh`
--
ALTER TABLE `admin_wh`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `barangbaku`
--
ALTER TABLE `barangbaku`
  MODIFY `idbarang_baku` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `baranginpayet`
--
ALTER TABLE `baranginpayet`
  MODIFY `idbarang_inpayet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `baranginpayet_history`
--
ALTER TABLE `baranginpayet_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `baranginrevisi`
--
ALTER TABLE `baranginrevisi`
  MODIFY `idbarang_inrevisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `baranginsewing`
--
ALTER TABLE `baranginsewing`
  MODIFY `idbarang_insewing` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  MODIFY `idbarang_keluar` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `barangkeluar_history`
--
ALTER TABLE `barangkeluar_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barangpayet`
--
ALTER TABLE `barangpayet`
  MODIFY `idbarang_payet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `barangpinjam`
--
ALTER TABLE `barangpinjam`
  MODIFY `idbarang_pinjam` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `barangpinjam_history`
--
ALTER TABLE `barangpinjam_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barangqc`
--
ALTER TABLE `barangqc`
  MODIFY `idbarang_qc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `barangretur`
--
ALTER TABLE `barangretur`
  MODIFY `idbarang_retur` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `barangretur_history`
--
ALTER TABLE `barangretur_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangrevisi`
--
ALTER TABLE `barangrevisi`
  MODIFY `idbarang_revisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `barangvendor`
--
ALTER TABLE `barangvendor`
  MODIFY `idbarang_vendor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `barangvendor_history`
--
ALTER TABLE `barangvendor_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `barang_lolosqc`
--
ALTER TABLE `barang_lolosqc`
  MODIFY `idbarang_lolosqc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `barang_minor`
--
ALTER TABLE `barang_minor`
  MODIFY `idbarang_minor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `barang_reject`
--
ALTER TABLE `barang_reject`
  MODIFY `idbarang_reject` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gudangminor`
--
ALTER TABLE `gudangminor`
  MODIFY `idstock_minor` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gudangminor_history`
--
ALTER TABLE `gudangminor_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gudangreject`
--
ALTER TABLE `gudangreject`
  MODIFY `idstock_reject` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `gudangreject_history`
--
ALTER TABLE `gudangreject_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stockgudang`
--
ALTER TABLE `stockgudang`
  MODIFY `idstock` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `stockgudang_history`
--
ALTER TABLE `stockgudang_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
