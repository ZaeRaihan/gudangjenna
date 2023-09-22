-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2023 at 02:19 PM
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
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `warna` varchar(255) NOT NULL,
  `inyard` int(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangbaku`
--

INSERT INTO `barangbaku` (`idbarang_baku`, `tgl_brg_masuk`, `kode`, `nama`, `warna`, `inyard`, `stock`, `harga`, `supplier`, `status`) VALUES
(1, '2023-03-01', 'FS03230023', 'Katun Bordir TAE - 08536 Khaky', '536 KHAKY', 90, 3, 53835, 'PT Sipatamoda', 'Stock'),
(2, '2023-03-02', 'FS03230046', 'PD Petrina Salmon Pink', 'SALMON', 101, 1, 30000, 'Multisandang Tamajaya', 'Stock'),
(29, '2023-07-24', 'FS06230688', 'Satin Armani 58', 'Creme', 60, 1, 21000, 'Toko Kain Kopo Mas', 'New');

--
-- Triggers `barangbaku`
--
DELIMITER $$
CREATE TRIGGER `trg_barangbaku_edit` AFTER UPDATE ON `barangbaku` FOR EACH ROW BEGIN
  INSERT INTO barangbaku_history (
    idbarang_baku,
    tgl_brg_masuk,
    kode,
    nama,
    warna,
    inyard,
    stock,
    harga,
    supplier,
    status
  ) VALUES (
    OLD.idbarang_baku,
    OLD.tgl_brg_masuk,
    OLD.kode,
    OLD.nama,
    OLD.warna,
    OLD.inyard,
    OLD.stock,
    OLD.harga,
    OLD.supplier,
    OLD.status
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
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `warna` varchar(255) NOT NULL,
  `inyard` int(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangbaku_history`
--

INSERT INTO `barangbaku_history` (`id`, `idbarang_baku`, `tgl_brg_masuk`, `kode`, `nama`, `warna`, `inyard`, `stock`, `harga`, `supplier`, `status`, `edit_timestamp`) VALUES
(0, 22, '2023-09-14', '11', '11', '', 11, 11, 0, 'budi', '', '2023-09-14 06:36:16'),
(0, 18, '2023-09-13', 'baku-01', 'Pattern Floral Green', '', 110, 2, 0, 'PT Daliatex Kusuma', '', '2023-09-14 06:36:34'),
(0, 22, '2023-09-14', '11', '11', '', 11, 11, 0, 'budi', '', '2023-09-14 06:36:56'),
(0, 23, '2023-09-13', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'Aneka Sandang', '', '2023-09-14 06:38:04'),
(0, 24, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, 'CV. Sinar Terang', '', '2023-09-14 06:39:03'),
(0, 23, '2023-09-13', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'budi', '', '2023-09-14 06:40:21'),
(0, 23, '2023-09-13', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, '', '', '2023-09-14 06:40:26'),
(0, 24, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, 'puri', '', '2023-09-14 06:40:34'),
(0, 23, '2023-09-13', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'Aneka Sandang', '', '2023-09-14 06:40:42'),
(0, 25, '2023-09-14', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'Aneka Warna Dunia', '', '2023-09-14 06:42:23'),
(0, 25, '2023-09-14', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'Aneka Warna Dunia', '', '2023-09-14 06:43:49'),
(0, 24, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, 'puri', '', '2023-09-14 06:43:56'),
(0, 24, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, '', '', '2023-09-14 06:44:01'),
(0, 24, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, 'Aneka Sandang', '', '2023-09-14 11:49:04'),
(0, 25, '2023-09-14', 'baku-01', 'PATTERN FLORAL GREEN', '', 110, 1, 0, 'budi', '', '2023-09-14 11:49:09'),
(0, 26, '2023-09-13', 'baku-01', 'VIENNA CREOLE PINK', '', 100, 1, 0, 'Aneka Sandang', '', '2023-09-14 11:49:15'),
(0, 1, '0000-00-00', 'kain-01', 'Katun Bordir TAE - 08536 Khaky', '', 90, 3, 0, 'PT Sipatamoda', '', '2023-09-15 08:18:57'),
(0, 2, '0000-00-00', 'kain-01', 'PD Petrina Salmon Pink', '', 101, 1, 0, 'Multisandang Tamajaya', '', '2023-09-15 08:18:57'),
(0, 3, '0000-00-00', 'kain-02', 'Satin Armani 58\"', '', 60, 1, 0, 'Toko Kain Kopo Mas', '', '2023-09-15 08:18:57'),
(0, 1, '2023-03-01', 'kain-01', 'Katun Bordir TAE - 08536 Khaky', '', 90, 3, 0, 'PT Sipatamoda', '', '2023-09-15 11:01:08'),
(0, 2, '2023-03-02', 'kain-01', 'PD Petrina Salmon Pink', '', 101, 1, 0, 'Multisandang Tamajaya', '', '2023-09-15 11:01:50'),
(0, 1, '2023-03-01', 'FS03230023', 'Katun Bordir TAE - 08536 Khaky', '536 KHAKY', 90, 3, 53835, 'PT Sipatamoda', 'stock', '2023-09-15 11:31:14'),
(0, 1, '2023-03-01', 'FS03230023', 'Katun Bordir TAE - 08536 Khaky', '536 KHAKY', 90, 3, 53835, 'PT Sipatamoda', 'New', '2023-09-15 11:31:20'),
(0, 2, '2023-03-02', 'FS03230046', 'PD Petrina Salmon Pink', 'SALMON', 101, 1, 30000, 'Multisandang Tamajaya', 'stock', '2023-09-15 11:31:29'),
(0, 29, '2023-07-24', 'FS06230688', 'Satin Armani 58\"', 'Creme', 60, 1, 21000, 'Toko Kain Kopo Mas', 'new', '2023-09-15 11:31:34');

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
(133, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 37),
(143, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 12, 'ashyiap', '2023-09-14', 'hasil-02', 22, 'Finished', 0),
(146, '2023-09-14', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 10, 'dunia game', '2023-09-14', 'hasil-01', 10, 'On progress', 29),
(147, '2023-09-14', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 15, 'dunia game', '2023-09-14', 'hasil-01', 25, 'Finished', 0),
(148, '2023-09-15', 'payet-02', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 7, 'Bu Citra', '2023-09-16', 'hasil', 7, 'On progress', 39),
(149, '2023-09-15', 'payet-02', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 2, 'Bu Citra', '2023-09-16', 'hasil', 9, 'Finished', 0);

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
(136, 129, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'hoyo', '2023-09-13', 'hasil-01', 9, 'On progress', 0, '2023-09-13 16:12:41'),
(137, 130, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'hoyo', '2023-09-13', 'hasil-01', 9, 'On progress', 0, '2023-09-13 16:12:55'),
(138, 131, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 1, 'hoyo', '2023-09-13', 'hasil-01', 10, 'On progress', 0, '2023-09-13 16:13:09'),
(139, 126, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'hoyo', '2023-09-13', 'hasil-01', 9, 'On progress', 34, '2023-09-14 11:45:39'),
(140, 128, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 1, 'hoyo', '2023-09-13', 'hasil-01', 10, 'Finished', 0, '2023-09-14 11:45:51'),
(141, 126, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'Muara Global', '2023-09-13', 'hasil-01', 18, 'On progress', 34, '2023-09-14 11:46:12'),
(142, 126, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'bu tati', '2023-09-13', 'hasil-01', 27, 'On progress', 34, '2023-09-14 11:46:46'),
(143, 128, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 1, 'Kensby Research Co.', '2023-09-13', 'hasil-01', 10, 'Finished', 0, '2023-09-14 11:47:07'),
(144, 126, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'Bu Yuli', '2023-09-13', 'hasil-01', 36, 'On progress', 34, '2023-09-14 11:47:21'),
(145, 126, '2023-09-13', 'payet-02', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 9, 'emilia', '2023-09-13', 'hasil-01', 45, 'On progress', 34, '2023-09-14 11:47:28'),
(146, 133, '2023-09-14', '', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 0, 'ashyiap', '2023-09-14', '', 0, 'On progress', 37, '2023-09-14 14:27:25'),
(147, 134, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:35:02'),
(148, 135, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:36:51'),
(149, 136, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:39:00'),
(150, 137, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:41:52'),
(151, 137, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 12, 'ashyiap', '2023-09-14', 'hasil-02', 22, 'On progress', 0, '2023-09-14 14:41:58'),
(152, 138, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:43:59'),
(153, 139, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 12, 'ashyiap', '2023-09-14', 'hasil-02', 22, 'On progress', 0, '2023-09-14 14:44:09'),
(154, 140, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:50:20'),
(155, 141, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:50:32'),
(156, 142, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:50:49'),
(157, 143, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:53:00'),
(158, 144, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:53:08'),
(159, 145, '2023-09-14', 'payet-02', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 10, 'ashyiap', '2023-09-14', 'hasil-02', 10, 'On progress', 0, '2023-09-14 14:53:24'),
(160, 146, '2023-09-14', '', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 0, 'dunia game', '2023-09-14', '', 0, 'On progress', 29, '2023-09-14 14:53:55'),
(161, 146, '2023-09-14', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 0, 'dunia game', '2023-09-14', 'hasil-01', 0, 'On progress', 29, '2023-09-14 14:54:05'),
(162, 147, '2023-09-14', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 10, 'dunia game', '2023-09-14', 'hasil-01', 10, 'On progress', 0, '2023-09-14 14:54:15'),
(163, 148, '2023-09-15', '', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 0, 'Bu Citra', '2023-09-15', '', 0, 'On progress', 39, '2023-09-15 11:39:03'),
(164, 148, '2023-09-15', 'payet-02', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 0, 'Bu Citra', '2023-09-15', '', 0, 'On progress', 39, '2023-09-15 11:39:25'),
(165, 149, '2023-09-15', 'payet-02', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 7, 'Bu Citra', '2023-09-16', 'hasil', 7, 'On progress', 0, '2023-09-15 11:39:34');

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
(6, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'johto', '2023-09-06', 'hasil-01', 30, 'Finished', 5),
(8, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'Kensby Research Co.', '2023-09-06', 'hasil-01', 20, 'Finished', 0),
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
(19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0),
(23, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 1, 'on progress', 0),
(24, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 2, 'Finished', 0),
(33, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 19),
(35, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 2, 'Finished', 0),
(40, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 1, 'kanto', '2023-09-06', 'hasil-01', 11, 'on progress', 0),
(43, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 16, 'piccolo', '2023-09-13', 'hasil-02', 16, 'On Progress', 0),
(44, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 4, 'Ophie Rever', '2023-09-13', 'hasil-02', 20, 'Finished', 0),
(46, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'sasha', '2023-09-14', 'hasil-01', 20, 'On progress', 24),
(47, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 11, 'sasha', '2023-09-14', 'hasil-01', 31, 'Finished', 0),
(48, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 20, 'On progress', 24),
(49, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 10, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 30, 'On progress', 0),
(50, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 1, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 31, 'Finished', 0),
(51, '2023-09-15', 'revisi-01', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 1, 'PT.SJS', '2023-09-15', 'hasil-01', 1, 'Finished', 26);

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
(0, 19, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0, '2023-09-09 17:19:11'),
(0, 20, '2023-09-11', '', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 0, '', '2023-09-11', '', 0, 'On progress', 16, '2023-09-11 15:33:04'),
(0, 21, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 1, 'on progress', 0, '2023-09-11 15:33:14'),
(0, 21, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 2, 'kanto', '2023-09-11', 'hasil-01', 3, 'on progress', 0, '2023-09-11 15:33:30'),
(0, 22, '2023-09-11', '', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 0, '', '2023-09-11', '', 0, 'On progress', 16, '2023-09-11 15:33:55'),
(0, 23, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 0, 'kanto', '2023-09-11', 'hasil-01', 0, 'on progress', 0, '2023-09-11 15:36:55'),
(0, 24, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 1, 'on progress', 0, '2023-09-11 15:37:10'),
(0, 24, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 2, 'on progress', 0, '2023-09-11 15:37:16'),
(0, 25, '2023-09-11', 'revisi-01', '2023-10-05', 'genshin', 'ayaka', 'm', 2, 1, 'kanto', '2023-09-11', 'hasil-01', 2, 'Finished', 0, '2023-09-11 15:37:28'),
(0, 26, '2023-09-11', '', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 0, '', '2023-09-11', '', 0, 'On progress', 13, '2023-09-11 15:38:15'),
(0, 27, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 6, 'kanto', '2023-09-11', 'hasil-02', 6, 'on progress', 0, '2023-09-11 15:38:32'),
(0, 28, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 6, 'kanto', '2023-09-11', 'hasil-02', 6, 'on progress', 0, '2023-09-11 15:38:58'),
(0, 28, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 5, 'kanto', '2023-09-11', 'hasil-02', 11, 'on progress', 0, '2023-09-11 15:39:06'),
(0, 28, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 5, 'kanto', '2023-09-11', 'hasil-02', 11, 'Finished', 0, '2023-09-11 15:39:14'),
(0, 28, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-11', 'hasil-02', 11, 'Finished', 0, '2023-09-11 15:39:21'),
(0, 29, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 6, 'kanto', '2023-09-11', 'hasil-02', 6, 'on progress', 0, '2023-09-11 15:39:42'),
(0, 29, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 16, 'kanto', '2023-09-11', 'hasil-02', 22, 'on progress', 0, '2023-09-11 15:39:56'),
(0, 30, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 6, 'kanto', '2023-09-11', 'hasil-02', 6, 'on progress', 0, '2023-09-11 15:40:26'),
(0, 30, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 5, 'kanto', '2023-09-11', 'hasil-02', 11, 'on progress', 0, '2023-09-11 15:40:48'),
(0, 26, '2023-09-11', 'payet-02', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 6, 'kanto', '2023-09-11', 'hasil-02', 6, 'on progress', 13, '2023-09-11 15:40:58'),
(0, 31, '2023-09-13', '', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 0, 'eren', '2023-09-13', '', 0, 'On progress', 21, '2023-09-13 16:09:16'),
(0, 31, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 0, 'eren', '2023-09-13', '', 0, 'on progress', 21, '2023-09-13 16:09:46'),
(0, 32, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'eren', '2023-09-13', 'hasil-02', 1, 'on progress', 0, '2023-09-13 16:09:54'),
(0, 32, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 2, 'eren', '2023-09-13', 'hasil-02', 3, 'on progress', 0, '2023-09-13 16:10:25'),
(0, 33, '2023-09-13', '', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 0, 'sasha', '2023-09-13', '', 0, 'On progress', 19, '2023-09-13 16:10:50'),
(0, 34, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 0, '2023-09-13 16:11:01'),
(0, 34, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 2, 'Finished', 0, '2023-09-13 16:11:08'),
(0, 35, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 2, 'sasha', '2023-09-13', 'hasil-01', 2, 'Finished', 0, '2023-09-13 16:11:16'),
(0, 35, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 3, 'sasha', '2023-09-13', 'hasil-01', 2, 'Finished', 0, '2023-09-13 16:11:22'),
(0, 36, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 0, '2023-09-13 16:11:39'),
(0, 36, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 3, 'sasha', '2023-09-13', 'hasil-01', 4, 'Finished', 0, '2023-09-13 16:11:48'),
(0, 36, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 3, 'sasha', '2023-09-13', 'hasil-01', 7, 'Finished', 0, '2023-09-13 16:12:21'),
(0, 39, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 21, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'Finished', 0, '2023-09-13 16:21:28'),
(0, 39, '2023-09-10', 'revisi-05', '2023-10-05', 'genshin', 'raiden', 'xl', 21, 0, 'kanto', '2023-09-10', 'hasilrevisi-01', 21, 'on progress', 0, '2023-09-13 16:21:36'),
(0, 40, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'on progress', 0, '2023-09-13 16:22:34'),
(0, 40, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 1, 'kanto', '2023-09-06', 'hasil-01', 11, 'on progress', 0, '2023-09-13 16:22:38'),
(0, 40, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 12, 'kanto', '2023-09-06', 'hasil-01', 11, 'on progress', 0, '2023-09-13 16:22:42'),
(0, 41, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 1, 'kanto', '2023-09-06', 'hasil-01', 11, 'on progress', 0, '2023-09-13 16:22:51'),
(0, 43, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 16, 'piccolo', '2023-09-13', 'hasil-02', 0, 'On Progress', 0, '2023-09-13 16:46:14'),
(0, 44, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 16, 'piccolo', '2023-09-13', 'hasil-02', 16, 'On Progress', 0, '2023-09-13 16:46:28'),
(0, 44, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 4, 'piccolo', '2023-09-13', 'hasil-02', 20, 'On Progress', 0, '2023-09-13 16:46:43'),
(0, 44, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 4, 'vegeta', '2023-09-13', 'hasil-02', 20, 'Finished', 0, '2023-09-13 16:46:55'),
(0, 45, '2023-09-13', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'Goku', 'All Size', 20, 16, 'piccolo', '2023-09-13', 'hasil-02', 16, 'On Progress', 0, '2023-09-13 16:47:09'),
(0, 46, '2023-09-14', '', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 0, 'sasha', '2023-09-14', '', 0, 'On progress', 24, '2023-09-13 17:00:19'),
(0, 46, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 0, 'sasha', '2023-09-14', '', 0, 'On progress', 24, '2023-09-13 17:00:39'),
(0, 47, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'sasha', '2023-09-14', 'hasil-01', 20, 'On progress', 0, '2023-09-13 17:00:48'),
(0, 46, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'sasha', '2023-09-14', 'hasil-01', 20, 'On progress', 24, '2023-09-13 17:01:12'),
(0, 33, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 19, '2023-09-14 07:12:45'),
(0, 33, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 19, '2023-09-14 07:13:03'),
(0, 46, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'sasha', '2023-09-14', 'hasil-01', 20, 'On progress', 24, '2023-09-14 07:13:30'),
(0, 46, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'sasha', '2023-09-14', 'hasil-01', 20, 'On progress', 24, '2023-09-14 07:14:33'),
(0, 33, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 19, '2023-09-14 08:27:04'),
(0, 6, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 5, '2023-09-14 11:54:06'),
(0, 6, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, '', '2023-09-06', 'hasil-01', 20, 'Finished', 5, '2023-09-14 11:54:17'),
(0, 8, '2023-09-06', 'revisi-01', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 11, 10, 'kanto', '2023-09-06', 'hasil-01', 10, 'Finished', 0, '2023-09-14 11:54:28'),
(0, 33, '2023-09-13', 'revisi-01', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 1, 'sasha', '2023-09-13', 'hasil-01', 1, 'on progress', 19, '2023-09-14 11:55:42'),
(0, 48, '2023-09-14', '', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 0, 'Alia Digital Printex', '2023-09-14', '', 0, 'On progress', 24, '2023-09-14 14:58:36'),
(0, 48, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 0, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 0, 'On progress', 24, '2023-09-14 14:58:45'),
(0, 49, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 20, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 20, 'On progress', 0, '2023-09-14 14:58:55'),
(0, 50, '2023-09-14', 'revisi-01', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 10, 'Alia Digital Printex', '2023-09-14', 'hasil-02', 30, 'On progress', 0, '2023-09-14 14:59:04'),
(0, 51, '2023-09-15', '', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 0, 'PT.SJS', '2023-09-15', '', 0, 'On progress', 26, '2023-09-15 11:37:31'),
(0, 51, '2023-09-15', 'revisi-01', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 0, 'PT.SJS', '2023-09-15', '', 0, 'On progress', 26, '2023-09-15 11:37:46');

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
  `inyard` int(255) NOT NULL,
  `stock_insewing` int(255) NOT NULL,
  `stock_hasilsewing` int(255) NOT NULL,
  `vendor_sewing` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_baku` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginsewing`
--

INSERT INTO `baranginsewing` (`idbarang_insewing`, `tgl_brg_keluar`, `sj_for_vendor`, `nama`, `launching_date`, `collection`, `article_name`, `size`, `inyard`, `stock_insewing`, `stock_hasilsewing`, `vendor_sewing`, `tgl_brg_masuk`, `sj_from_vendor`, `status`, `idbarang_baku`) VALUES
(34, '2023-09-13', 'sewing-01', 'Pattern Floral Yellow', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 110, 1, 21, 'Bu Yani', '2023-09-13', 'hasil-01', 'Finished', 20),
(36, '2023-09-13', 'sewing-01', 'Pattern Floral Yellow', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 110, 1, 21, 'pak dodi', '2023-09-13', 'hasil-01', 'Finished', 0);

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
    inyard,
    stock_insewing,
    stock_hasilsewing,
    vendor_sewing,
    tgl_brg_masuk,
    sj_from_vendor,
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
    OLD.inyard,
    OLD.stock_insewing,
    OLD.stock_hasilsewing,
    OLD.vendor_sewing,
    OLD.tgl_brg_masuk,
    OLD.sj_from_vendor,
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
  `inyard` int(255) NOT NULL,
  `stock_insewing` int(255) NOT NULL,
  `stock_hasilsewing` int(255) NOT NULL,
  `vendor_sewing` varchar(255) NOT NULL,
  `tgl_brg_masuk` date DEFAULT NULL,
  `sj_from_vendor` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `idbarang_baku` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginsewing_history`
--

INSERT INTO `baranginsewing_history` (`id`, `idbarang_insewing`, `tgl_brg_keluar`, `sj_for_vendor`, `nama`, `launching_date`, `collection`, `article_name`, `size`, `inyard`, `stock_insewing`, `stock_hasilsewing`, `vendor_sewing`, `tgl_brg_masuk`, `sj_from_vendor`, `status`, `idbarang_baku`, `edit_timestamp`) VALUES
(0, 31, '2023-09-13', 'sewing-05', 'Vienna Creole Pink', '2023-09-13', 'DRAGONBALL', 'Goku', 'L-XL', 100, 1, 21, '', '2023-09-13', 'hasil-01', 'Finished', 19, '2023-09-13 15:35:17'),
(0, 33, '2023-09-13', '111', '111', '2023-09-13', '11', '11', 'L-XL', 111, 11, 111, '11', '2023-09-13', '111', 'Finished', 0, '2023-09-13 15:36:00'),
(0, 33, '2023-09-13', '111', '111', '2023-09-13', '11', '11', 'L-XL', 111, 11, 111, '11', '2023-09-13', '111', 'Finished', 0, '2023-09-13 15:36:07'),
(0, 33, '2023-09-13', '111', '111', '2023-09-13', '11', '11', 'L-XL', 111, 11, 111, '11', '2023-09-13', '111', 'On Progress', 0, '2023-09-13 15:36:17'),
(0, 31, '2023-09-13', 'sewing-05', 'Vienna Creole Pink', '2023-09-13', 'DRAGONBALL', 'Goku', 'L-XL', 100, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 19, '2023-09-13 15:36:31'),
(0, 31, '2023-09-13', 'sewing-05', 'Vienna Creole Pink', '2023-09-13', 'DRAGONBALL', 'Goku', 'L-XL', 100, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 19, '2023-09-13 15:36:36'),
(0, 31, '2023-09-13', 'sewing-05', 'Vienna Creole Pink', '2023-09-13', 'DRAGONBALL', 'Goku', 'L-XL', 100, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'On Progress', 19, '2023-09-13 15:36:57'),
(0, 32, '2023-09-13', 'sewing-01', 'Pattern Floral Green', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 110, 2, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 0, '2023-09-13 15:37:07'),
(0, 32, '2023-09-13', 'sewing-01', 'Pattern Floral Green', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 110, 2, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 0, '2023-09-13 15:37:16'),
(0, 32, '2023-09-13', 'sewing-01', 'Pattern Floral Green', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 110, 2, 21, 'bu tati', '2023-09-13', 'hasil-01', 'On Progress', 0, '2023-09-13 15:37:24'),
(0, 32, '2023-09-13', 'sewing-01', 'Pattern Floral Green', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 110, 2, 21, 'bu tati', '2023-09-13', 'hasil-01', 'On Progress', 0, '2023-09-13 15:43:14'),
(0, 33, '2023-09-13', '111', '111', '2023-09-13', '11', '11', 'L-XL', 111, 11, 111, '11', '2023-09-13', '111', 'On Progress', 0, '2023-09-13 15:43:41'),
(0, 33, '2023-09-13', '111', '111', '2023-09-13', '11', '11', 'L-XL', 111, 11, 111, 'Alia Digital Printex', '2023-09-13', '111', 'On Progress', 0, '2023-09-13 15:43:52'),
(0, 34, '2023-09-13', '', 'Pattern Floral Yellow', '2023-09-13', '', '', '', 110, 7, 0, '', '2023-09-13', '', 'On progress', 20, '2023-09-13 15:45:02'),
(0, 34, '2023-09-13', 'sewing-01', 'Pattern Floral Yellow', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 110, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 20, '2023-09-13 15:45:14'),
(0, 35, '2023-09-13', '111', '111', '2023-09-13', '11', '111', 'L-XL', 11, 11, 11, '111', '2023-09-13', '11', 'Finished', 0, '2023-09-13 15:45:49'),
(0, 34, '2023-09-13', 'sewing-01', 'Pattern Floral Yellow', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 110, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 20, '2023-09-14 11:52:06'),
(0, 36, '2023-09-13', 'sewing-01', 'Pattern Floral Yellow', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 110, 1, 21, 'bu tati', '2023-09-13', 'hasil-01', 'Finished', 0, '2023-09-14 11:52:19');

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
(45, '2023-09-08', 'keluar-002', 'Stock Gudang', 'asuna bunny girl', 'm', 201, 'Online', 'store', 0, 0, 0),
(46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Offline', 'keluar untuk store tiktok', 58, 0, 0),
(47, '2023-09-13', 'out-02', 'Gudang Barang Reject', 'black pink', 'S-M', 12, 'Offline', 'ke store surabaya', 0, 0, 0),
(48, '2023-09-13', 'keluar-002', 'Gudang Barang Minor', 'ayaka', 'm', 1, 'Offline', 'ke store bandung', 0, 0, 40);

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
(24, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Online', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-12 10:02:03'),
(25, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Online', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-12 10:02:16'),
(26, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Online', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-12 13:14:33'),
(27, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Online', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-12 13:27:45'),
(28, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Online', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-13 09:48:15'),
(29, 46, '2023-09-11', 'out-01', 'Stock Gudang', 'ayaka', 'm', 1, 'Offline', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-13 09:48:22'),
(30, 46, '2023-09-11', 'out-01', 'Gudang Barang Minor', 'ayaka', 'm', 1, 'Offline', 'keluar untuk store tiktok', 58, 0, 0, '2023-09-13 09:48:27'),
(31, 47, '2023-09-13', 'out-02', 'Stock Gudang', 'black pink', 'L', 12, 'Offline', 'ke store surabaya', 0, 0, 0, '2023-09-13 09:56:36'),
(32, 48, '2023-09-13', '', 'Gudang Barang Minor', 'ayaka', 'm', 0, '', '', 0, 0, 40, '2023-09-13 09:57:07'),
(33, 48, '2023-09-13', 'keluar-002', 'Gudang Barang Minor', 'ayaka', 'm', 1, 'Offline', 'ke store bandung', 0, 0, 40, '2023-09-13 09:57:14'),
(34, 48, '2023-09-13', 'keluar-002', 'Gudang Barang Minor', 'ayaka', 'm', 1, 'Offline', 'ke store bandung', 0, 0, 40, '2023-09-14 12:22:42');

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
(19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 26, 'hoyo', 33),
(21, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'Sakh Konveksi', 36),
(22, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 22, 'hoyoverse', 40),
(24, '2023-09-06', '2023-10-25', 'genshin', 'jean', 'xl', 22, 'hoyoverse', 0),
(25, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tuti', 0),
(26, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(27, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(28, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(29, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 0),
(30, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0),
(31, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0),
(34, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyo', 55),
(37, '2023-09-13', '2023-09-25', 'DRAGONBALL', 'goku', 'L-XL', 22, 'ashyiap', 0),
(38, '2023-09-12', '2023-09-25', 'Jennaka', 'haven black top', 'm', 12, 'sasha', 66),
(39, '2023-09-07', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 'Bu Citra', 7);

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
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:41:31'),
(0, 32, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', 53, '2023-09-09 17:42:46'),
(0, 19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 33, '2023-09-14 07:35:34'),
(0, 19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'CV SBB', 33, '2023-09-14 07:35:45'),
(0, 19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 33, '2023-09-14 07:35:54'),
(0, 21, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 36, '2023-09-14 07:36:41'),
(0, 21, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'Three and Me', 36, '2023-09-14 07:36:51'),
(0, 25, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0, '2023-09-14 11:41:29'),
(0, 25, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 0, '2023-09-14 11:41:39'),
(0, 25, '2023-09-05', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tuti', 0, '2023-09-14 11:41:50'),
(0, 19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 33, '2023-09-14 11:42:08'),
(0, 19, '2023-09-03', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'hoyo', 33, '2023-09-14 11:42:16');

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
(33, '2023-08-26', 'retur-003', 'dirani top peach', 'l', 10, 'finance', 0, 0, 0),
(34, '2023-09-13', 'pinjam-01', 'haven black top', 'L-XL', 21, 'budi', 0, 0, 0);

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
(2, 33, '2023-08-26', 'retur-003', 'dirani top peach', 'l', 10, 'finance', 0, 0, 0, '2023-09-08 08:39:37'),
(3, 34, '2023-09-13', 'pinjam-01', 'haven black top', 'M', 21, 'budi', 0, 0, 0, '2023-09-13 10:03:15'),
(4, 15, '2023-09-07', 'pinjam-01', 'dirani top peach', 'all size', 21, 'pak somad', 0, 46, 0, '2023-09-14 06:55:07'),
(5, 15, '2023-09-07', 'pinjam-01', 'dirani top peach', 'all size', 21, 'pak somad', 0, 46, 0, '2023-09-14 06:55:15'),
(6, 15, '2023-09-07', 'pinjam-01', 'dirani top peach', 'all size', 21, 'pak somad', 0, 46, 0, '2023-09-14 06:55:22');

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
(103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Three and Me', '2023-09-04', 'qc-01', 32, 0, 0),
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
(128, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 10, 'johto', '2023-09-06', 'qc-03', 0, 0, 0),
(129, '2023-09-04', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'hoyo', '2023-09-04', 'qc-02', 0, 0, 0),
(130, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 21, 'masashi', '2023-09-07', 'qc-03', 49, 0, 0),
(131, '2023-09-07', '2023-09-25', 'naruto', 'boruto', 's', 1, 'kanto', '2023-09-07', 'hasilrevisi-01', 0, 0, 18),
(132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0),
(136, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 3, 'bu sri', '2023-09-11', 'qc-10', 0, 78, 0),
(137, '2023-09-12', '2023-09-12', '1212', '1212', '121', 212, 'ashyiap', '2023-09-12', '12', 0, 0, 0),
(138, '2023-09-12', '2023-09-12', '1212', '1212', '121', 212, 'Alia Digital Printex', '2023-09-12', '12', 0, 0, 0),
(141, '2023-09-12', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', '2023-09-13', 'qc-03', 67, 0, 0),
(142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha', '2023-09-13', 'qc-03', 0, 123, 0),
(147, '2023-09-14', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', 'qc-03', 14, 0, 0),
(148, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', 'qc-03', 0, 0, 51),
(149, '2023-09-16', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 'Bu Citra', '2023-09-15', 'qc-03', 0, 149, 0);

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
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:40:15'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:40:57'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:41:31'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 17:42:46'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:41:30'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:42:38'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 103, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:42:54'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:43:00'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:48:14'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 101, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:48:17'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 101, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-09 18:48:27'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-10 05:54:08'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-10 05:59:58'),
(0, 132, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 10, 'hoyoverse', '2023-09-09', 'qc-05', 53, 0, 0, '2023-09-10 06:02:20'),
(0, 136, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 3, 'bu sri', '2023-09-11', '', 0, 78, 0, '2023-09-11 12:07:16'),
(0, 136, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 3, 'bu sri', '2023-09-11', 'qc-10', 0, 78, 0, '2023-09-11 14:30:42'),
(0, 136, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 3, 'bu sri', '2023-09-11', 'qc-10', 0, 78, 0, '2023-09-11 14:30:53'),
(0, 138, '2023-09-12', '2023-09-12', '1212', '1212', '121', 212, 'ashyiap', '2023-09-12', '12', 0, 0, 0, '2023-09-12 09:37:56'),
(0, 138, '2023-09-12', '2023-09-12', '1212', '1212', '121', 212, 'betul', '2023-09-12', '12', 0, 0, 0, '2023-09-12 09:38:15'),
(0, 141, '2023-09-12', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', '2023-09-13', '', 67, 0, 0, '2023-09-13 10:34:09'),
(0, 141, '2023-09-12', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', '2023-09-13', '', 67, 0, 0, '2023-09-13 10:34:24'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha', '2023-09-13', '', 0, 123, 0, '2023-09-13 11:03:15'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha', '2023-09-13', 'qc-03', 0, 123, 0, '2023-09-13 15:19:45'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha', '2023-09-13', 'qc-03', 0, 123, 0, '2023-09-13 15:19:56'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 06:44:25'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha', '2023-09-13', 'qc-03', 0, 123, 0, '2023-09-14 07:12:45'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sep', '2023-09-13', 'qc-03', 0, 123, 0, '2023-09-14 07:13:03'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Three and Me', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 07:36:05'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Pa Ohid', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 07:36:20'),
(0, 142, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 7, 'sasha blouse', '2023-09-13', 'qc-03', 0, 123, 0, '2023-09-14 08:27:04'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Three and Me', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 11:00:35'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Three and Me', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 11:00:47'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'asep', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 11:00:52'),
(0, 128, '2023-09-06', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 10, 'kanto', '2023-09-06', 'qc-03', 0, 0, 0, '2023-09-14 11:39:58'),
(0, 103, '2023-09-02', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Atfemale', '2023-09-04', 'qc-01', 32, 0, 0, '2023-09-14 11:40:08'),
(0, 147, '2023-09-14', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', '', 14, 0, 0, '2023-09-15 11:35:27'),
(0, 147, '2023-09-14', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', 'qc-03', 14, 0, 0, '2023-09-15 11:36:18'),
(0, 147, '2023-09-14', '2023-07-08', 'Essential', 'Athaya Top', 'xl', 1, 'PT.SJS', '2023-09-15', 'qc-03', 14, 0, 0, '2023-09-15 11:36:28'),
(0, 148, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', '', 0, 0, 51, '2023-09-15 11:38:03'),
(0, 149, '2023-09-16', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 2, 'Bu Citra', '2023-09-15', '', 0, 149, 0, '2023-09-15 11:40:17');

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
(15, '2023-09-08', 'retur-003', 'dirani top peach', 'm', 122),
(16, '2023-09-13', 'retur-002', 'black pink', 'S-M', 21);

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
  `vendor` varchar(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_produksi` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangrevisi`
--

INSERT INTO `barangrevisi` (`idbarang_revisi`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `tgl_brg_keluar`, `sj_for_produksi`, `idbarang_qc`) VALUES
(19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'Sakh Konveksi', '2023-09-13', 'revisi-05', 142),
(21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'armin', '2023-09-13', 'revisi-05', 0),
(23, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'S-M', 2, 'Bu Yani', '2023-09-13', 'revisi-05', 0),
(24, '2023-09-14', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 'Alia Digital Printex', '2023-09-14', 'revisi-05', 0),
(26, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '2023-09-15', 'revisi-01', 147);

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
    vendor,
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
    OLD.vendor,
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
  `vendor` varchar(255) NOT NULL,
  `tgl_brg_keluar` date NOT NULL,
  `sj_for_produksi` varchar(255) NOT NULL,
  `idbarang_qc` int(25) NOT NULL,
  `edit_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangrevisi_history`
--

INSERT INTO `barangrevisi_history` (`id`, `idbarang_revisi`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `tgl_brg_keluar`, `sj_for_produksi`, `idbarang_qc`, `edit_timestamp`) VALUES
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 0, '', '2023-09-10', '', 132, '2023-09-09 17:34:13'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:34:24'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:39:35'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:40:15'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:40:57'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:41:31'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 17:42:46'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:41:30'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:42:38'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:42:54'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:43:00'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:48:14'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:48:17'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-09 18:48:27'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-10 05:54:08'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-10 05:59:58'),
(0, 16, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '', '2023-09-10', 'revisi-01', 132, '2023-09-10 06:02:20'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 0, 'sasha', '2023-09-13', '', 142, '2023-09-13 15:59:40'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 0, 'sasha', '2023-09-13', 'revisi-05', 142, '2023-09-13 16:00:02'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'sasha', '2023-09-13', 'revisi-05', 0, '2023-09-13 16:02:14'),
(0, 23, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'eren', '2023-09-13', 'revisi-05', 0, '2023-09-13 16:59:22'),
(0, 24, '2023-09-14', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 'sasha', '2023-09-14', 'revisi-05', 0, '2023-09-13 17:01:12'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'sasha', '2023-09-13', 'revisi-05', 142, '2023-09-14 07:12:45'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'sasha', '2023-09-13', 'revisi-05', 142, '2023-09-14 07:13:03'),
(0, 24, '2023-09-14', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 'Bu Elis', '2023-09-14', 'revisi-05', 0, '2023-09-14 07:13:30'),
(0, 24, '2023-09-14', '2023-09-25', 'DRAGONBALL', 'vegeta', 'All Size', 31, 'Bu Elis', '2023-09-14', 'revisi-05', 0, '2023-09-14 07:14:33'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'sasha', '2023-09-13', 'revisi-05', 142, '2023-09-14 08:27:04'),
(0, 19, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'sasha', '2023-09-13', 'revisi-05', 142, '2023-09-14 11:55:42'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'eren', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:55:51'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:56:03'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'Three and Me', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:56:17'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:56:26'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:56:56'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'Bu Yani', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:57:04'),
(0, 23, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'S-M', 2, 'mikasa', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:57:16'),
(0, 23, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'S-M', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:57:22'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 11:58:37'),
(0, 25, '2023-09-14', '2023-09-14', '2121', '212', 'M', 212, 'CV SBB', '2023-09-14', '121', 0, '2023-09-14 12:01:03'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '', '2023-09-13', 'revisi-05', 0, '2023-09-14 12:01:14'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'armin', '2023-09-13', 'revisi-05', 0, '2023-09-14 12:01:20'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'Bu Yuli', '2023-09-13', 'revisi-05', 0, '2023-09-14 12:01:27'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, 'Bu Yuli', '2023-09-13', 'revisi-05', 0, '2023-09-14 12:01:35'),
(0, 26, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, 'PT.SJS', '2023-09-15', '', 147, '2023-09-15 11:36:18'),
(0, 26, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top', 'xl', 0, 'PT.SJS', '2023-09-15', '', 147, '2023-09-15 11:36:28'),
(0, 26, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, 'PT.SJS', '2023-09-15', '', 147, '2023-09-15 11:37:02'),
(0, 26, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, 'PT.SJS', '2023-09-15', 'revisi-01', 147, '2023-09-15 11:37:17');

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
(1, '2023-08-15', 'vendor-01', '2023-08-25', 'Makala', 'Vest Melinna Top Lime Green', 's', 22, 'Bandanaira', 'QC', 0),
(2, '2023-08-15', 'vendor-01', '2023-08-25', 'Makala', 'Vest Melinna Top Lime Green', 'm', 8, 'Bandanaira', 'QC', 0),
(3, '2023-08-15', 'vendor-01', '2023-08-25', 'Makala', 'Vest Melinna Top Lime Green', 's', 58, 'Bandanaira', 'Payet', 0),
(4, '2023-08-15', 'vendor-01', '2023-08-25', 'Makala', 'Vest Melinna Top Lime Green', 'm', 1, 'Bandanaira', 'Payet', 0),
(5, '2023-09-07', 'vendor-02', '2023-09-25', 'Prive', 'Mylla Tunic Pink', 's-m', 2, 'Bandanaira', 'QC', 0),
(6, '2023-09-07', 'vendor-02', '2023-09-25', 'Prive', 'Mylla Tunic Pink', 'l-xl', 7, 'Bandanaira', 'QC', 0),
(7, '2023-09-07', 'vendor-02', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, 'Bu Citra', 'Payet', 0),
(8, '2023-09-14', 'vendor-03', '2023-07-08', 'Essential', 'Athaya Top Yellow', 's', 2, 'PT.SJS', 'QC', 0),
(9, '2023-09-14', 'vendor-03', '2023-07-08', 'Essential', 'Athaya Top Yellow', 'm', 2, 'PT.SJS', 'QC', 0),
(10, '2023-09-14', 'vendor-03 ', '2023-07-08', 'Essential', 'Athaya Top Yellow', 'l-xl', 1, 'PT.SJS', 'QC', 0),
(11, '2023-09-14', 'vendor-03 ', '2023-07-08', 'Essential', 'Athaya Top BW', 's', 2, 'PT.SJS', 'QC', 0),
(12, '2023-09-14', 'vendor-03 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'm', 2, 'PT.SJS', 'QC', 0),
(13, '2023-09-14', 'vendor-03 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'l-xl', 1, 'PT.SJS', 'QC', 0),
(14, '2023-09-14', 'vendor-03 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', 'QC', 0);

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
(71, 67, '2023-09-12', 'hasil-02         ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'Pa Ohid', 'QC', 0, '2023-09-12 13:58:19'),
(72, 67, '2023-09-12', 'hasil-02          ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'tuti', 'QC', 0, '2023-09-12 17:14:55'),
(73, 67, '2023-09-12', 'hasil-02           ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'tuti', 'QC', 0, '2023-09-12 17:15:06'),
(74, 67, '2023-09-12', 'hasil-02            ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'sasha blouse', 'QC', 0, '2023-09-12 17:15:41'),
(75, 67, '2023-09-12', 'hasil-02             ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'Bu Rini', 'QC', 0, '2023-09-12 17:15:52'),
(76, 67, '2023-09-12', 'hasil-02              ', '2023-09-12', 'Jennaka', 'black pink', 'm', 120, 'yosep', 'QC', 0, '2023-09-13 04:48:09'),
(77, 67, '2023-09-12', 'hasil-02               ', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', 'QC', 0, '2023-09-13 04:52:37'),
(78, 67, '2023-09-12', 'hasil-02                ', '2023-09-12', 'Jennaka', 'black pink', 'S-M', 120, 'Sakh Konveksi', 'Payet', 0, '2023-09-13 04:52:52'),
(79, 67, '2023-09-12', 'hasil-02                 ', '2023-09-12', 'Jennaka', 'black pink', 'S-M', 120, 'Sakh Konveksi', 'Payet', 0, '2023-09-13 04:53:44'),
(80, 67, '2023-09-12', 'hasil-02                  ', '2023-09-12', 'Jennaka', 'black pink', 'All Size', 120, 'yosep', 'QC', 0, '2023-09-13 04:53:49'),
(81, 67, '2023-09-12', 'hasil-02                   ', '2023-09-12', 'Jennaka', 'black pink', 'All Size', 120, 'yosep', 'QC', 0, '2023-09-13 04:54:19'),
(82, 68, '2023-09-13', 'hasil-01', '2023-09-13', '121', '2121', 'S-M', 212, 'Muara Global', 'Payet', 0, '2023-09-13 08:45:55'),
(83, 67, '2023-09-12', 'hasil-02                    ', '2023-09-12', 'Jennaka', 'black pink', 'All Size', 120, 'yosep', 'QC', 0, '2023-09-13 09:24:24'),
(84, 67, '2023-09-12', 'hasil-02                     ', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', 'QC', 0, '2023-09-13 09:24:33'),
(85, 69, '2023-09-13', 'hasil-02', '2023-09-13', 'Jennaka', 'black pink', 'S', 12, 'Bu Rini', 'QC', 0, '2023-09-13 09:25:46'),
(86, 67, '2023-09-12', 'hasil-02                      ', '2023-09-12', 'Jennaka', 'black pink', 'M', 120, 'yosep', 'Payet', 0, '2023-09-13 10:34:09'),
(87, 70, '2023-09-13', 'hasil-01', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 10, 'bu tati', '', 30, '2023-09-13 15:07:33'),
(88, 70, '2023-09-13', 'hasil-01 ', '2023-09-25', 'azurlane', 'asuna bunny', 'm', 10, 'bu tati', 'QC', 30, '2023-09-13 15:09:19'),
(89, 72, '2023-09-13', 'hasil-01', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'bu tati', '', 34, '2023-09-13 15:46:11'),
(90, 32, '2023-09-02', 'vendor-01    ', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'dunia game', 'QC', 0, '2023-09-14 06:44:25'),
(91, 33, '2023-09-03', 'vendor-01                            ', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 'Payet', 0, '2023-09-14 07:35:34'),
(92, 33, '2023-09-03', 'vendor-01                             ', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'CV SBB', 'Payet', 0, '2023-09-14 07:35:45'),
(93, 33, '2023-09-03', 'vendor-01                              ', '2023-09-25', 'azurlane', 'asuna ichinose', 'm', 25, 'dunia game', 'Payet', 0, '2023-09-14 07:35:54'),
(94, 32, '2023-09-02', 'vendor-01     ', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Three and Me', 'QC', 0, '2023-09-14 07:36:05'),
(95, 32, '2023-09-02', 'vendor-01      ', '2023-09-25', 'azurlane', 'toki bunny', 's', 21, 'Pa Ohid', 'QC', 0, '2023-09-14 07:36:20'),
(96, 36, '2023-09-05', 'vendor-01 ', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'bu tati', 'QC', 3, '2023-09-14 07:36:41'),
(97, 36, '2023-09-05', 'vendor-01  ', '2023-09-25', 'azurlane', 'haven bunny', 'XL', 21, 'Three and Me', 'QC', 3, '2023-09-14 07:36:51'),
(98, 73, '2023-09-13', 'hasil-01', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'bu tati', '', 34, '2023-09-14 07:53:51'),
(99, 74, '2023-09-13', 'hasil-01 ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'bu tati', 'QC', 0, '2023-09-14 07:55:03'),
(100, 73, '2023-09-13', 'hasil-01 ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'bu tati', 'QC', 34, '2023-09-14 07:55:12'),
(101, 73, '2023-09-13', 'hasil-01  ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, '', 'QC', 34, '2023-09-14 07:55:24'),
(102, 75, '2023-09-13', 'hasil-01  ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'yosep', 'QC', 0, '2023-09-14 07:56:24'),
(103, 75, '2023-09-13', 'hasil-01   ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'yosep', 'QC', 0, '2023-09-14 07:56:33'),
(104, 74, '2023-09-13', 'hasil-01  ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'yosep', 'QC', 0, '2023-09-14 07:56:44'),
(105, 75, '2023-09-13', 'hasil-01    ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'PT.SJS', 'QC', 0, '2023-09-14 08:26:07'),
(106, 75, '2023-09-13', 'hasil-01     ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'yosep', 'QC', 0, '2023-09-14 08:26:16'),
(107, 74, '2023-09-13', 'hasil-01   ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Three and Me', 'QC', 0, '2023-09-14 08:26:39'),
(108, 75, '2023-09-13', 'hasil-01      ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'asep', 'QC', 0, '2023-09-14 08:26:46'),
(109, 76, '2023-09-14', 'vendor-01', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'sash', 'QC', 0, '2023-09-14 08:30:00'),
(110, 76, '2023-09-14', 'vendor-01 ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'sasha', 'QC', 0, '2023-09-14 08:30:14'),
(111, 76, '2023-09-14', 'vendor-01  ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'sasha', 'QC', 0, '2023-09-14 08:37:16'),
(112, 76, '2023-09-14', 'vendor-01   ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'sasha blouse', 'QC', 0, '2023-09-14 08:37:28'),
(113, 76, '2023-09-14', 'vendor-01    ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'sasha blouse', 'QC', 0, '2023-09-14 08:37:42'),
(114, 76, '2023-09-14', 'vendor-01     ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:38:26'),
(115, 76, '2023-09-14', 'vendor-01      ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:38:33'),
(116, 76, '2023-09-14', 'vendor-01       ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:38:39'),
(117, 76, '2023-09-14', 'vendor-01        ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'bu sri1', 'QC', 0, '2023-09-14 08:38:45'),
(118, 76, '2023-09-14', 'vendor-01         ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:40:47'),
(119, 76, '2023-09-14', 'vendor-01          ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:40:55'),
(120, 76, '2023-09-14', 'vendor-01           ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'bu sri1', 'QC', 0, '2023-09-14 08:41:11'),
(121, 76, '2023-09-14', 'vendor-01            ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'abdul', 'QC', 0, '2023-09-14 08:41:33'),
(122, 76, '2023-09-14', 'vendor-01             ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, '', 'QC', 0, '2023-09-14 08:43:01'),
(123, 76, '2023-09-14', 'vendor-01              ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'Kensby Research Co.', 'QC', 0, '2023-09-14 10:38:30'),
(124, 74, '2023-09-13', 'hasil-01    ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Rumah Renza', 'QC', 0, '2023-09-14 10:38:42'),
(125, 75, '2023-09-13', 'hasil-01       ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Three and Me', 'QC', 0, '2023-09-14 10:38:50'),
(126, 74, '2023-09-13', 'hasil-01     ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Three and Me', 'QC', 0, '2023-09-14 10:42:07'),
(127, 75, '2023-09-13', 'hasil-01        ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Rumah Renza', 'QC', 0, '2023-09-14 10:42:12'),
(128, 76, '2023-09-14', 'vendor-01               ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'agus', 'QC', 0, '2023-09-14 10:42:17'),
(129, 76, '2023-09-14', 'vendor-01                ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'Bu Riri', 'QC', 0, '2023-09-14 10:44:41'),
(130, 76, '2023-09-14', 'vendor-01                 ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'Bu Riri', 'QC', 0, '2023-09-14 10:52:05'),
(131, 74, '2023-09-13', 'hasil-01      ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Sakh Konveksi', 'QC', 0, '2023-09-14 10:52:14'),
(132, 76, '2023-09-14', 'vendor-01                  ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'Bu Riri', 'QC', 0, '2023-09-14 10:52:23'),
(133, 74, '2023-09-13', 'hasil-01       ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'sasha', 'QC', 0, '2023-09-14 10:52:35'),
(134, 76, '2023-09-14', 'vendor-01                   ', '2023-09-14', 'Jennaka', 'black pink', 'M', 21, 'Bu Riri', 'QC', 0, '2023-09-14 10:53:31'),
(135, 74, '2023-09-13', 'hasil-01        ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Bu Linda', 'QC', 0, '2023-09-14 10:55:51'),
(136, 74, '2023-09-13', 'hasil-01         ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Bu Linda', 'QC', 0, '2023-09-14 10:56:38'),
(137, 74, '2023-09-13', 'hasil-01          ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Bu Ussy', 'QC', 0, '2023-09-14 10:56:51'),
(138, 75, '2023-09-13', 'hasil-01         ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'PT Thonnamaz', 'QC', 0, '2023-09-14 11:39:22'),
(139, 74, '2023-09-13', 'hasil-01           ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'yosep', 'QC', 0, '2023-09-14 11:39:29'),
(140, 74, '2023-09-13', 'hasil-01            ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Bu Yani', 'QC', 0, '2023-09-14 11:39:34'),
(141, 74, '2023-09-13', 'hasil-01             ', '2023-09-13', 'DRAGONBALL', 'Goku', 'S-M', 21, 'Bu Yani', 'QC', 0, '2023-09-14 11:39:43'),
(142, 14, '2023-09-18', 'vendor-07', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', '', 0, '2023-09-15 08:04:37'),
(143, 11, '2023-09-15', 'vendor-04', '2023-07-08', 'Essential', 'Athaya Top BW', 's', 2, 'PT.SJS', 'QC', 0, '2023-09-15 08:05:21'),
(144, 12, '2023-09-16', 'vendor-05', '2023-07-08', 'Essential', 'Athaya Top BW', 'm', 2, 'PT.SJS', 'QC', 0, '2023-09-15 08:05:30'),
(145, 13, '2023-09-17', 'vendor-06', '2023-07-08', 'Essential', 'Athaya Top BW', 'l-xl', 1, 'PT.SJS', 'QC', 0, '2023-09-15 08:05:35'),
(146, 14, '2023-09-18', 'vendor-07 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', 'QC', 0, '2023-09-15 08:05:40'),
(147, 10, '2023-09-14', 'vendor-03', '2023-07-08', 'Essential', 'Athaya Top Yellow', 'l-xl', 1, 'PT.SJS', 'QC', 0, '2023-09-15 08:05:51'),
(148, 11, '2023-09-14', 'vendor-04 ', '2023-07-08', 'Essential', 'Athaya Top BW', 's', 2, 'PT.SJS', 'QC', 0, '2023-09-15 08:06:00'),
(149, 12, '2023-09-14', 'vendor-05 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'm', 2, 'PT.SJS', 'QC', 0, '2023-09-15 08:06:06'),
(150, 13, '2023-09-14', 'vendor-06 ', '2023-07-08', 'Essential', 'Athaya Top BW', 'l-xl', 1, 'PT.SJS', 'QC', 0, '2023-09-15 08:06:12'),
(151, 14, '2023-09-14', 'vendor-07  ', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, 'PT.SJS', 'QC', 0, '2023-09-15 08:06:19');

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
(336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132),
(338, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-11', 'wh-01', 136),
(339, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'All Size', 2, '2023-09-11', 'wh-01', 0),
(342, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, '2023-09-15', 'LolosQC-01', 147),
(343, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, '2023-09-15', 'LolosQC-01', 148);

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
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 17:42:46'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:41:30'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:42:38'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:42:54'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:43:00'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:48:14'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:48:17'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-09 18:48:27'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-10 05:54:08'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-10 05:59:58'),
(0, 336, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 4, '2023-09-10', 'wh-023', 132, '2023-09-10 06:02:20'),
(0, 338, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 0, '2023-09-11', '', 136, '2023-09-11 12:08:35'),
(0, 338, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-11', 'wh-01', 136, '2023-09-11 14:30:42'),
(0, 338, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-11', 'wh-01', 136, '2023-09-11 14:30:53'),
(0, 339, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-11', 'wh-01', 0, '2023-09-13 16:50:32'),
(0, 341, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 0, '2023-09-13', '', 142, '2023-09-13 16:51:24'),
(0, 342, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, '2023-09-15', '', 147, '2023-09-15 11:35:53'),
(0, 342, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, '2023-09-15', 'LolosQC-01', 147, '2023-09-15 11:36:05'),
(0, 342, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 1, '2023-09-15', 'LolosQC-01', 147, '2023-09-15 11:36:18'),
(0, 342, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top', 'xl', 1, '2023-09-15', 'LolosQC-01', 147, '2023-09-15 11:36:28'),
(0, 343, '2023-09-15', '2023-07-08', 'Essential', 'Athaya Top BW', 'xl', 0, '2023-09-15', '', 148, '2023-09-15 11:38:41');

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
(13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132),
(14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 11, '2023-09-13', '2121', 142),
(16, '2023-09-15', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 9, '2023-09-15', 'minor-01', 149);

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
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 17:42:46'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:41:30'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:42:38'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:42:54'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:43:00'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:48:14'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:48:17'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-09 18:48:27'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-10 05:54:08'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-10 05:59:58'),
(0, 13, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', '1', 132, '2023-09-10 06:02:20'),
(0, 14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 0, '2023-09-13', '', 142, '2023-09-13 16:52:12'),
(0, 14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'S-M', 11, '2023-09-13', '2121', 142, '2023-09-13 16:52:18'),
(0, 15, '2023-09-13', '2023-09-13', '11', '11', 'S', 11, '2023-09-13', '11', 0, '2023-09-13 16:52:38'),
(0, 14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'All Size', 11, '2023-09-13', '2121', 142, '2023-09-14 07:12:45'),
(0, 14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 11, '2023-09-13', '2121', 142, '2023-09-14 07:13:03'),
(0, 14, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 11, '2023-09-13', '2121', 142, '2023-09-14 08:27:04'),
(0, 16, '2023-09-15', '2023-09-25', 'Prive', 'Marsella Outer Cream', 'l-xl', 0, '2023-09-15', '', 149, '2023-09-15 11:40:36');

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
(19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132),
(20, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 1, '2023-09-11', 'reject-01', 136),
(21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '2023-09-13', '121', 142);

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
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 17:42:46'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:41:30'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:42:38'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:42:54'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:43:00'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:48:14'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:48:17'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-09 18:48:27'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-10 05:54:08'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-10 05:59:58'),
(0, 19, '2023-09-09', '2023-10-05', 'genshin', 'ayaka', 'm', 2, '2023-09-10', 'wh-012', 132, '2023-09-10 06:02:20'),
(0, 20, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 0, '2023-09-11', '', 136, '2023-09-11 12:09:16'),
(0, 20, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 1, '2023-09-11', 'reject-01', 136, '2023-09-11 14:30:42'),
(0, 20, '2023-09-11', '2023-10-05', 'genshin', 'ayaka', 'm', 1, '2023-09-11', 'reject-01', 136, '2023-09-11 14:30:53'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 0, '2023-09-13', '', 142, '2023-09-13 16:51:37'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'S-M', 2, '2023-09-13', '121', 142, '2023-09-14 07:12:45'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '2023-09-13', '121', 142, '2023-09-14 07:13:03'),
(0, 21, '2023-09-13', '2023-09-25', 'Jennaka', 'haven black top', 'm', 2, '2023-09-13', '121', 142, '2023-09-14 08:27:04');

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
(1, 'JNK-2806', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (S)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(2, 'JNK-2807', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(3, 'JNK-2808', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'L', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(4, 'JNK-2809', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(5, 'JNK-2802', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(6, 'JNK-2803', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(7, 'JNK-2804', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (L)', 'L', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(8, 'JNK-2805', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(9, 'JNK-1900', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(10, 'JNK-1901', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (M)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(11, 'JNK-1902', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(12, 'JNK-1903', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(13, 'JNK-1904', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(14, 'JNK-1905', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (M) (KOTOR PARAH)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(15, 'JNK-1906', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(16, 'JNK-1907', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(17, 'JNK-1896', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(18, 'JNK-1897', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (M)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(19, 'JNK-1898', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(20, 'JNK-1899', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(21, 'JNK-2642', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (S)', 'S', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(22, 'JNK-2643', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (M)', 'M', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(23, 'JNK-2644', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (L)', 'L', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(24, 'JNK-2645', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (XL)', 'XL', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(25, 'JNK-2767', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (S)', 'S', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(26, 'JNK-2768', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (M)', 'M', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(27, 'JNK-2769', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(28, 'JNK-2770', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (XL)', 'XL', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(29, 'JNK-2763', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (S)', 'S', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(30, 'JNK-2764', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (M)', 'M', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(31, 'JNK-2765', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(32, 'JNK-2766', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (XL)', 'XL', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(33, 'JNK-3285', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (S)', 'S', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(34, 'JNK-3286', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (M)', 'M', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(35, 'JNK-3287', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (L)', 'L', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(36, 'JNK-3288', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (XL)', 'XL', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(37, 'JNK-3305', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (S)', 'S', 0, 389000, '', 'RAK', '13 - 18 BULAN', 0),
(38, 'JNK-3306', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (M)', 'M', 0, 389000, '', 'RAK', '13 - 18 BULAN', 0),
(39, 'JNK-3307', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (L)', 'L', 1, 389000, '5D', 'RAK', '13 - 18 BULAN', 0),
(40, 'JNK-3308', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (XL)', 'XL', 0, 389000, '', 'RAK', '13 - 18 BULAN', 0),
(41, 'JNK-3469', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (S)', 'S', 4, 569000, '5D', 'RAK', '10 - 12 BULAN', 0),
(42, 'JNK-3470', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (M)', 'M', 3, 569000, '5D', 'RAK', '10 - 12 BULAN', 0),
(43, 'JNK-3471', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (L)', 'L', 0, 569000, '', 'RAK', '10 - 12 BULAN', 0),
(44, 'JNK-3472', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (XL)', 'XL', 0, 569000, '', 'RAK', '10 - 12 BULAN', 0),
(45, 'JNK-3465', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (S)', 'S', 34, 569000, '5E', 'RAK', '10 - 12 BULAN', 0),
(46, 'JNK-3466', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (M)', 'M', 4, 569000, '5E', 'RAK', '10 - 12 BULAN', 0),
(47, 'JNK-3467', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (L)', 'L', 0, 569000, '1F', 'RAK', '10 - 12 BULAN', 0),
(48, 'JNK-3468', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (XL)', 'XL', 0, 569000, '', 'RAK', '10 - 12 BULAN', 0),
(49, 'JNK-3516', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (S)', 'S', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(50, 'JNK-3517', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (M)', 'M', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(51, 'JNK-3518', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (L)', 'L', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(52, 'JNK-3519', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (XL)', 'XL', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(53, 'JNK-3520', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (S)', 'S', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(54, 'JNK-3521', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (M)', 'M', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(55, 'JNK-3522', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (L)', 'L', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(56, 'JNK-3523', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (XL)', 'XL', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(57, 'JNK-3965', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (S)', 'S', 0, 589000, '', 'RAK', '4 - 6 BULAN', 0),
(58, 'JNK-3966', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (M)', 'M', 0, 589000, '', 'RAK', '4 - 6 BULAN', 0),
(59, 'JNK-3967', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (L)', 'L', 0, 589000, '', 'RAK', '4 - 6 BULAN', 0),
(60, 'JNK-3968', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (XL)', 'XL', 0, 589000, '', 'RAK', '4 - 6 BULAN', 0),
(61, 'JNK-3969', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (S)', 'S', 0, 449000, '', 'RAK', '4 - 6 BULAN', 0),
(62, 'JNK-3970', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (M)', 'M', 0, 449000, '', 'RAK', '4 - 6 BULAN', 0),
(63, 'JNK-3971', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (L)', 'L', 0, 449000, '', 'RAK', '4 - 6 BULAN', 0),
(64, 'JNK-3972', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (XL)', 'XL', 0, 449000, '', 'RAK', '4 - 6 BULAN', 0),
(65, 'JNK-4252', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (S)', 'S', 4, 659000, 'K6 5D', 'KARTON', '0 - 3 BULAN', 0),
(66, 'JNK-4253', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (M)', 'M', 25, 659000, 'K6 5D', 'KARTON', '0 - 3 BULAN', 0),
(67, 'JNK-4254', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (L)', 'L', 8, 659000, 'K6 5D', 'KARTON', '0 - 3 BULAN', 0),
(68, 'JNK-4255', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (XL)', 'XL', 2, 659000, 'K6 5D', 'KARTON', '0 - 3 BULAN', 0),
(69, 'JNK-4256', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (S)', 'S', 2, 659000, 'K6 5D', 'KARTON', '0 - 3 BULAN', 0),
(70, 'JNK-4257', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (M)', 'M', 10, 659000, 'K6 5D 5B', 'KARTON', '0 - 3 BULAN', 0),
(71, 'JNK-4258', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (L)', 'L', 12, 659000, 'K6 5D 5B', 'KARTON', '0 - 3 BULAN', 0),
(72, 'JNK-4259', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (XL)', 'XL', 2, 659000, '5D', 'RAK', '0 - 3 BULAN', 0);

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
(5, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 200, 5890000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-09 17:55:22'),
(6, 38, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top black', 'm', 200, 5890000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-11 14:03:56'),
(7, 39, 'aaaa', 'aaaaa', 'aaaaa', 'black pink', 'S-M', 111, 1000000, '1l', 'aaaaa', '&gt; 24 BULAN', 0, '2023-09-13 09:46:20'),
(8, 40, '', 'genshin', '', 'ayaka', 'm', 2, 0, '', '', '0 - 3 bulan', 13, '2023-09-13 09:47:18'),
(9, 31, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-14 12:16:59'),
(10, 31, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani white shirt', 'all size', 10, 589000, '3d 3c', 'kardus', '0 - 3 BULAN', 0, '2023-09-14 12:17:08'),
(11, 25, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:21:54'),
(12, 25, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN white TOP', 'l', 5, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:22:04');

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
(1, 'JNK-2806', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (S)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(2, 'JNK-2807', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(3, 'JNK-2808', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'L', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(4, 'JNK-2809', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(5, 'JNK-2802', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(6, 'JNK-2803', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(7, 'JNK-2804', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (L)', 'L', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(8, 'JNK-2805', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(9, 'JNK-1900', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(10, 'JNK-1901', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (M)', 'M', 1, 289000, '8B', 'RAK', '> 24 BULAN', 0),
(11, 'JNK-1902', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(12, 'JNK-1903', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(13, 'JNK-1904', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(14, 'JNK-1905', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (M) (KOTOR PARAH)', 'M', 1, 289000, '9A', 'RAK', '> 24 BULAN', 0),
(15, 'JNK-1906', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(16, 'JNK-1907', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(17, 'JNK-1896', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(18, 'JNK-1897', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (M)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(19, 'JNK-1898', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(20, 'JNK-1899', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(21, 'JNK-2642', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (S)', 'S', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(22, 'JNK-2643', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (M)', 'M', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(23, 'JNK-2644', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (L)', 'L', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(24, 'JNK-2645', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (XL)', 'XL', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(25, 'JNK-2767', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (S)', 'S', 1, 399000, '9A', 'RAK', '19 - 24 BULAN', 0),
(26, 'JNK-2768', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (M)', 'M', 2, 399000, '9A', 'RAK', '19 - 24 BULAN', 0),
(27, 'JNK-2769', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(28, 'JNK-2770', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (XL)', 'XL', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(29, 'JNK-2763', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (S)', 'S', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(30, 'JNK-2764', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (M)', 'M', 3, 399000, '9A', 'RAK', '19 - 24 BULAN', 0),
(31, 'JNK-2765', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(32, 'JNK-2766', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (XL)', 'XL', 2, 399000, '9A', 'RAK', '19 - 24 BULAN', 0),
(33, 'JNK-3285', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (S)', 'S', 1, 469000, '9A', 'RAK', '13 - 18 BULAN', 0),
(34, 'JNK-3286', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (M)', 'M', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(35, 'JNK-3287', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (L)', 'L', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(36, 'JNK-3288', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (XL)', 'XL', 2, 469000, '9A', 'RAK', '13 - 18 BULAN', 0),
(37, 'JNK-3305', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (S)', 'S', 0, 389000, '8A', 'RAK', '13 - 18 BULAN', 0),
(38, 'JNK-3306', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (M)', 'M', 0, 389000, '8A', 'RAK', '13 - 18 BULAN', 0),
(39, 'JNK-3307', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (L)', 'L', 1, 389000, '8A', 'RAK', '13 - 18 BULAN', 0),
(40, 'JNK-3308', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (XL)', 'XL', 2, 389000, '8A', 'RAK', '13 - 18 BULAN', 0),
(41, 'JNK-3469', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (S)', 'S', 5, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(42, 'JNK-3470', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (M)', 'M', 2, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(43, 'JNK-3471', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (L)', 'L', 0, 569000, '10A', 'RAK', '10 - 12 BULAN', 0),
(44, 'JNK-3472', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (XL)', 'XL', 1, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(45, 'JNK-3465', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (S)', 'S', 27, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(46, 'JNK-3466', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (M)', 'M', 43, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(47, 'JNK-3467', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (L)', 'L', 1, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(48, 'JNK-3468', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (XL)', 'XL', 4, 569000, '8B', 'RAK', '10 - 12 BULAN', 0),
(49, 'JNK-3516', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (S)', 'S', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(50, 'JNK-3517', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (M)', 'M', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(51, 'JNK-3518', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (L)', 'L', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(52, 'JNK-3519', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (XL)', 'XL', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(53, 'JNK-3520', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (S)', 'S', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(54, 'JNK-3521', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (M)', 'M', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(55, 'JNK-3522', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (L)', 'L', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(56, 'JNK-3523', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (XL)', 'XL', 0, 389000, '', 'RAK', '7 - 9 BULAN', 0),
(57, 'JNK-3965', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (S)', 'S', 3, 589000, '8A', 'RAK', '4 - 6 BULAN', 0),
(58, 'JNK-3966', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (M)', 'M', 3, 589000, '8A', 'RAK', '4 - 6 BULAN', 0),
(59, 'JNK-3967', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (L)', 'L', 1, 589000, '8A', 'RAK', '4 - 6 BULAN', 0),
(60, 'JNK-3968', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (XL)', 'XL', 0, 589000, '10A', 'RAK', '4 - 6 BULAN', 0),
(61, 'JNK-3969', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (S)', 'S', 1, 449000, '10A', 'RAK', '4 - 6 BULAN', 0),
(62, 'JNK-3970', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (M)', 'M', 0, 449000, '10A', 'RAK', '4 - 6 BULAN', 0),
(63, 'JNK-3971', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (L)', 'L', 1, 449000, '10A', 'RAK', '4 - 6 BULAN', 0),
(64, 'JNK-3972', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (XL)', 'XL', 0, 449000, '10A', 'RAK', '4 - 6 BULAN', 0),
(65, 'JNK-4252', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (S)', 'S', 0, 659000, '', '', '0 - 3 BULAN', 0),
(66, 'JNK-4253', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (M)', 'M', 2, 659000, '11a', 'KARTON', '0 - 3 BULAN', 0),
(67, 'JNK-4254', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (L)', 'L', 3, 659000, '', '', '0 - 3 BULAN', 0),
(68, 'JNK-4255', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (XL)', 'XL', 2, 659000, '11A', 'KARTON', '0 - 3 BULAN', 0),
(69, 'JNK-4256', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (S)', 'S', 8, 659000, '11A', 'KARTON', '0 - 3 BULAN', 0),
(70, 'JNK-4257', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (M)', 'M', 6, 659000, '11A', 'KARTON', '0 - 3 BULAN', 0),
(71, 'JNK-4258', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (L)', 'L', 0, 659000, '', '', '0 - 3 BULAN', 0),
(72, 'JNK-4259', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (XL)', 'XL', 1, 659000, '11A', 'KARTON', '0 - 3 BULAN', 0);

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
(4, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 5, 5890000, '3d', 'rak', '0 - 3 BULAN', 0, '2023-09-09 17:53:55'),
(5, 60, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 5, 5890000, '3d', 'rak', '0 - 3 BULAN', 0, '2023-09-11 13:49:49'),
(6, 62, 'db-01', 'DRAGONBALL', 'SCRUNCHIE', 'Goku', 'S-M', 12, 1000000, '1l', 'Kontainer', '&gt; 24 BULAN', 0, '2023-09-13 09:36:52'),
(7, 63, '', 'genshin', '', 'ayaka', 'm', 1, 0, '', '', '0 - 3 bulan', 20, '2023-09-13 09:37:30'),
(8, 63, 'GI-01', 'genshin', 'BAG', 'ayaka', 'm', 1, 100000, '3d', 'Kontainer', '19 - 24 BULAN', 20, '2023-09-13 09:37:47'),
(9, 46, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0, '2023-09-14 06:55:07'),
(10, 46, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0, '2023-09-14 06:55:15'),
(11, 46, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', '', '0 - 3 BULAN', 0, '2023-09-14 06:55:22'),
(12, 53, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0, '2023-09-14 12:16:39'),
(13, 53, 'JNK-2376', 'seraph', 'SHIRT', 'dirani top peach', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN', 0, '2023-09-14 12:16:49'),
(14, 25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan', 0, '2023-09-14 12:21:39'),
(15, 25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'kresek', '13-18 bulan', 0, '2023-09-14 12:21:46');

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
(1, 'JNK-2806', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (S)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(2, 'JNK-2807', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(3, 'JNK-2808', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (M)', 'L', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(4, 'JNK-2809', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(5, 'JNK-2802', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS GREEN 2.0 (XL)', 'S', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(6, 'JNK-2803', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (M)', 'M', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(7, 'JNK-2804', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (L)', 'L', 1, 569000, '1K', 'RAK', '> 24 BULAN', 0),
(8, 'JNK-2805', 'LAVERNA (JUNI 2021)', 'Dress', 'VINNIA DRESS BLUE 2.0 (XL)', 'XL', 0, 569000, '', 'RAK', '> 24 BULAN', 0),
(9, 'JNK-1900', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (S)', 'S', 1, 289000, '1J', 'RAK', '> 24 BULAN', 0),
(10, 'JNK-1901', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (M)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(11, 'JNK-1902', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(12, 'JNK-1903', 'ESSENTIAL', 'Inner', 'HAVA INNER BEIGE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(13, 'JNK-1904', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(14, 'JNK-1905', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (M) (KOTOR PARAH)', 'M', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(15, 'JNK-1906', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(16, 'JNK-1907', 'ESSENTIAL', 'Inner', 'HAVA INNER BROKEN WHITE (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(17, 'JNK-1896', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK (S)', 'S', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(18, 'JNK-1897', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (M)', 'M', 3, 289000, '1J', 'RAK', '> 24 BULAN', 0),
(19, 'JNK-1898', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (L)', 'L', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(20, 'JNK-1899', 'ESSENTIAL', 'Inner', 'HAVA INNER PINK  (XL)', 'XL', 0, 289000, '', 'RAK', '> 24 BULAN', 0),
(21, 'JNK-2642', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (S)', 'S', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(22, 'JNK-2643', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (M)', 'M', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(23, 'JNK-2644', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (L)', 'L', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(24, 'JNK-2645', 'ESSENTIAL', 'Shirt', 'Kanya Shirt Pink 2.0 (XL)', 'XL', 0, 279000, '', 'RAK', '19 - 24 BULAN', 0),
(25, 'JNK-2767', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (S)', 'S', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(26, 'JNK-2768', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (M)', 'M', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(27, 'JNK-2769', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(28, 'JNK-2770', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP SALMON (XL)', 'XL', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(29, 'JNK-2763', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (S)', 'S', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(30, 'JNK-2764', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (M)', 'M', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(31, 'JNK-2765', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (L)', 'L', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(32, 'JNK-2766', 'FERRONIA 1 (Okt 2021)', 'Top', 'ANIKA TOP BLOSSOM (XL)', 'XL', 0, 399000, '', 'RAK', '19 - 24 BULAN', 0),
(33, 'JNK-3285', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (S)', 'S', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(34, 'JNK-3286', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (M)', 'M', 0, 469000, '', 'RAK', '13 - 18 BULAN', 0),
(35, 'JNK-3287', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (L)', 'L', 1, 469000, '1J', 'RAK', '13 - 18 BULAN', 0),
(36, 'JNK-3288', 'EILARIA (25 JUNI 2022)', 'Top', 'NIYARA TOP SAND ROSE (XL)', 'XL', 0, 469000, '1I', 'RAK', '13 - 18 BULAN', 0),
(37, 'JNK-3305', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (S)', 'S', 5, 389000, '1G', 'RAK', '13 - 18 BULAN', 0),
(38, 'JNK-3306', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (M)', 'M', 7, 389000, '1G', 'RAK', '13 - 18 BULAN', 0),
(39, 'JNK-3307', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (L)', 'L', 3, 389000, '1G', 'RAK', '13 - 18 BULAN', 0),
(40, 'JNK-3308', 'EILARIA (25 JUNI 2022)', 'Top', 'ELVI TOP PINK (XL)', 'XL', 2, 389000, '1G', 'RAK', '13 - 18 BULAN', 0),
(41, 'JNK-3469', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (S)', 'S', 32, 569000, '2C', 'RAK', '10 - 12 BULAN', 0),
(42, 'JNK-3470', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (M)', 'M', 3, 569000, '2C', 'RAK', '10 - 12 BULAN', 0),
(43, 'JNK-3471', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (L)', 'L', 1, 569000, '2C', 'RAK', '10 - 12 BULAN', 0),
(44, 'JNK-3472', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC KHAKY (XL)', 'XL', 3, 569000, '2C', 'RAK', '10 - 12 BULAN', 0),
(45, 'JNK-3465', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (S)', 'S', 8, 569000, '1K', 'RAK', '10 - 12 BULAN', 0),
(46, 'JNK-3466', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (M)', 'M', 10, 569000, '1K', 'RAK', '10 - 12 BULAN', 0),
(47, 'JNK-3467', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (L)', 'L', 2, 569000, '1K', 'RAK', '10 - 12 BULAN', 0),
(48, 'JNK-3468', 'LAVELLE COLLECTION (25 SEPTEMBER 2022)', 'Tunic', 'GIA TUNIC PINK (XL)', 'XL', 1, 569000, '1K', 'RAK', '10 - 12 BULAN', 0),
(49, 'JNK-3516', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (S)', 'S', 12, 389000, '1H', 'RAK', '7 - 9 BULAN', 0),
(50, 'JNK-3517', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (M)', 'M', 10, 389000, '1H', 'RAK', '7 - 9 BULAN', 0),
(51, 'JNK-3518', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (L)', 'L', 6, 389000, '1H', 'RAK', '7 - 9 BULAN', 0),
(52, 'JNK-3519', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS GREY (XL)', 'XL', 6, 389000, '1H', 'RAK', '7 - 9 BULAN', 0),
(53, 'JNK-3520', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (S)', 'S', 17, 389000, '1I', 'RAK', '7 - 9 BULAN', 0),
(54, 'JNK-3521', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (M)', 'M', 11, 389000, '1I', 'RAK', '7 - 9 BULAN', 0),
(55, 'JNK-3522', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (L)', 'L', 7, 389000, '1I', 'RAK', '7 - 9 BULAN', 0),
(56, 'JNK-3523', 'VIRILE COLLECTION (25 OKTOBER 2022)', 'Pants', 'LARISA PANTS BLUE (XL)', 'XL', 5, 389000, '1I', 'RAK', '7 - 9 BULAN', 0),
(57, 'JNK-3965', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (S)', 'S', 2, 589000, '3A', 'RAK', '4 - 6 BULAN', 0),
(58, 'JNK-3966', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (M)', 'M', 2, 589000, '3A', 'RAK', '4 - 6 BULAN', 0),
(59, 'JNK-3967', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (L)', 'L', 4, 589000, '3A', 'RAK', '4 - 6 BULAN', 0),
(60, 'JNK-3968', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'LINQA TOP BLACK (XL)', 'XL', 1, 589000, '3A', 'RAK', '4 - 6 BULAN', 0),
(61, 'JNK-3969', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (S)', 'S', 0, 449000, '3F', 'RAK', '4 - 6 BULAN', 0),
(62, 'JNK-3970', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (M)', 'M', 0, 449000, '3F', 'RAK', '4 - 6 BULAN', 0),
(63, 'JNK-3971', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (L)', 'L', 0, 449000, '3F', 'RAK', '4 - 6 BULAN', 0),
(64, 'JNK-3972', 'ZINNIA COLLECTION (25 APRIL 2023)', 'Top', 'EFRA TOP BROKEN WHITE (XL)', 'XL', 0, 449000, '', 'RAK', '4 - 6 BULAN', 0),
(65, 'JNK-4252', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (S)', 'S', 75, 659000, '3I', 'RAK', '0 - 3 BULAN', 0),
(66, 'JNK-4253', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (M)', 'M', 48, 659000, '3I', 'RAK', '0 - 3 BULAN', 0),
(67, 'JNK-4254', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (L)', 'L', 34, 659000, '3I', 'RAK', '0 - 3 BULAN', 0),
(68, 'JNK-4255', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP CREME (XL)', 'XL', 42, 659000, '3I', 'RAK', '0 - 3 BULAN', 0),
(69, 'JNK-4256', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (S)', 'S', 63, 659000, '1H', 'RAK', '0 - 3 BULAN', 0),
(70, 'JNK-4257', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (M)', 'M', 67, 659000, '1H', 'RAK', '0 - 3 BULAN', 0),
(71, 'JNK-4258', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (L)', 'L', 20, 659000, '1H', 'RAK', '0 - 3 BULAN', 0),
(72, 'JNK-4259', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (XL)', 'XL', 20, 659000, '1H', 'RAK', '0 - 3 BULAN', 0);

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
(77, 30, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:15:05'),
(78, 30, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:15:17'),
(79, 30, 'JNK-2376', 'Jennaka', 'baju', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:15:24'),
(80, 30, 'JNK-2376', 'Jennaka', 'BAG', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN', 0, '2023-09-14 12:20:59'),
(81, 25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'rak', '13-18 bulan', 0, '2023-09-14 12:21:06'),
(82, 25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'Karton', '13-18 bulan', 0, '2023-09-14 12:21:12'),
(83, 25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'Karton', '13-18 bulan', 0, '2023-09-14 12:21:20'),
(84, 66, 'GI-02', 'genshin', 'kostum', 'diluc knight', 'L', 212, 1000000, '1l', 'Karung', '&gt; 24 BULAN', 0, '2023-09-14 12:25:49'),
(85, 66, 'GI-02', 'genshin', 'kostum', 'diluc knight', 'L', 212, 1000000, '1l', 'Karung', '&gt; 24 BULAN', 0, '2023-09-14 12:26:31'),
(86, 66, 'GI-02', 'genshin', 'OUTER', 'diluc knight', 'L', 212, 1000000, '1l', 'dus', '0 - 3 BULAN', 0, '2023-09-14 12:26:36'),
(87, 75, 'JNK-4259', 'PHALESSA COLLECTION 2 (25 AGUSTUS 2023)', 'Top', 'MADYA TOP ASH PINK (XL)', 'XL', 20, 659000, '1H', 'RAK', '0 - 3 BULAN', 0, '2023-09-15 07:16:11');

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
  MODIFY `idbarang_baku` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `baranginpayet`
--
ALTER TABLE `baranginpayet`
  MODIFY `idbarang_inpayet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `baranginpayet_history`
--
ALTER TABLE `baranginpayet_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `baranginrevisi`
--
ALTER TABLE `baranginrevisi`
  MODIFY `idbarang_inrevisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `baranginsewing`
--
ALTER TABLE `baranginsewing`
  MODIFY `idbarang_insewing` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  MODIFY `idbarang_keluar` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `barangkeluar_history`
--
ALTER TABLE `barangkeluar_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `barangpayet`
--
ALTER TABLE `barangpayet`
  MODIFY `idbarang_payet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `barangpinjam`
--
ALTER TABLE `barangpinjam`
  MODIFY `idbarang_pinjam` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `barangpinjam_history`
--
ALTER TABLE `barangpinjam_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barangqc`
--
ALTER TABLE `barangqc`
  MODIFY `idbarang_qc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `barangretur`
--
ALTER TABLE `barangretur`
  MODIFY `idbarang_retur` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `barangretur_history`
--
ALTER TABLE `barangretur_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangrevisi`
--
ALTER TABLE `barangrevisi`
  MODIFY `idbarang_revisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `barangvendor`
--
ALTER TABLE `barangvendor`
  MODIFY `idbarang_vendor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `barangvendor_history`
--
ALTER TABLE `barangvendor_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `barang_lolosqc`
--
ALTER TABLE `barang_lolosqc`
  MODIFY `idbarang_lolosqc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `barang_minor`
--
ALTER TABLE `barang_minor`
  MODIFY `idbarang_minor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `barang_reject`
--
ALTER TABLE `barang_reject`
  MODIFY `idbarang_reject` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `gudangminor`
--
ALTER TABLE `gudangminor`
  MODIFY `idstock_minor` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `gudangminor_history`
--
ALTER TABLE `gudangminor_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gudangreject`
--
ALTER TABLE `gudangreject`
  MODIFY `idstock_reject` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `gudangreject_history`
--
ALTER TABLE `gudangreject_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stockgudang`
--
ALTER TABLE `stockgudang`
  MODIFY `idstock` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `stockgudang_history`
--
ALTER TABLE `stockgudang_history`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
