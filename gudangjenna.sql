-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2023 at 12:24 PM
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
  `foto` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'manager'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_manager`
--

INSERT INTO `admin_manager` (`id`, `username`, `password`, `nama`, `telepon`, `foto`, `user_type`) VALUES
(59, 'manager1', '$2y$10$Xf/OEG6s34kpgTbz3Xpo.Oh7JLFecshku1CAipqev7XGPGBFvqloi', 'Fitria', '089655680980', '64ecbff6be2f9.jpg', 'manager');

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
  `foto` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'produksi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_produksi`
--

INSERT INTO `admin_produksi` (`id`, `username`, `password`, `nama`, `telepon`, `foto`, `user_type`) VALUES
(59, 'produksi1', '$2y$10$qn1xO1BL3wtuAeeHHUcvX.uvt1TLq5YeoBniUakWpmgUBWk3WZtk2', 'agung', '089530192639', '64e2370334172.jpg', 'produksi');

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
  `foto` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'qc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_qc`
--

INSERT INTO `admin_qc` (`id`, `username`, `password`, `nama`, `telepon`, `foto`, `user_type`) VALUES
(59, 'qc1', '$2y$10$cEkvs3qzGPbC273LBtQR5OcpZw8L0kpF1oweE4BcgGYPmG/cP2Nhu', 'Fahmi', '081214988946', '64ed79ed5c1b5.jpeg', 'qc');

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
  `foto` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'wh'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_wh`
--

INSERT INTO `admin_wh` (`id`, `username`, `password`, `nama`, `telepon`, `foto`, `user_type`) VALUES
(59, 'wh1', '$2y$10$2iyp1lyg5tT2rJhPurCqwe6phZteNqYRqpJDI48E.A7fY0Fxkeype', 'Nisa', '0895373888947', '64eb743c837c6.jpg', 'wh');

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
(1, '2023-06-01', '1111', 'Kain Haven 90 yard', 4);

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
  `vendor_payet` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginpayet`
--

INSERT INTO `baranginpayet` (`idbarang_inpayet`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inpayet`, `stock_hasilpayet`, `vendor_payet`) VALUES
(1, '2023-06-25', '42060', '2023-07-25', 'seraphina', 'linka top black', 's', 21, 2, 'bu yani'),
(4, '2023-08-29', '42060', '2023-07-25', 'seraphina', 'linka top black', 's', 21, 2, 'bu yani');

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
  `vendor_revisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginrevisi`
--

INSERT INTO `baranginrevisi` (`idbarang_inrevisi`, `tgl_brg_keluar`, `sj_for_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock_inrevisi`, `stock_hasilrevisi`, `vendor_revisi`) VALUES
(1, '2023-07-12', '02060', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 1, 1, 'bu yani'),
(3, '2023-07-12', '02060', '2023-07-25', 'seraphina', 'dirani shirt peach', 'all size', 1, 1, 'bu yani');

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
  `vendor_sewing` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baranginsewing`
--

INSERT INTO `baranginsewing` (`idbarang_insewing`, `tgl_brg_keluar`, `sj_for_vendor`, `nama`, `launching_date`, `collection`, `article_name`, `size`, `stock_insewing`, `stock_hasilsewing`, `vendor_sewing`) VALUES
(2, '2023-08-01', 'sewing-01', 'KAIN HAVEN 90 YARD', '2023-09-05', 'seraphina', 'haven black top', 'XL', 12, 10, 'bu tati'),
(3, '2023-08-29', 'sewing-01', 'KAIN HAVEN 90 YARD', '2023-09-05', 'seraphina', 'haven white top', 'XL', 12, 10, 'bu tati');

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
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangkeluar`
--

INSERT INTO `barangkeluar` (`idbarang_keluar`, `tgl_brg_keluar`, `sj_keluar`, `gudang`, `article_name`, `size`, `stock`, `status`, `keterangan`) VALUES
(2, '2023-08-19', 'keluar-003', 'Stock Gudang', 'dirani top peach', 'l', 12, 'Offline', 'ke store di palembang\r\n'),
(3, '2023-09-01', 'keluar-004', 'Stock Gudang', 'haven black top', 'XL', 12, 'Online', 'untuk restock store tiktok\r\n'),
(5, '2023-09-01', 'keluar-005', 'Stock Gudang', 'dirani top peach', 'l-xl', 1, 'Offline', 'ke store di aceh\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');

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
  `vendor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpayet`
--

INSERT INTO `barangpayet` (`idbarang_payet`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`) VALUES
(2, '2023-06-20', '2023-07-25', 'seraphina', 'linka top black', 's', 21, 'bu yani'),
(4, '2023-08-30', '2023-08-30', 'azurlane1', 'black pink1', 'all size', 1, '212121');

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
  `dipinjam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangpinjam`
--

INSERT INTO `barangpinjam` (`idbarang_pinjam`, `tgl_brg_keluar`, `surat_retur`, `article_name`, `size`, `stock`, `dipinjam`) VALUES
(5, '2023-08-26', 'retur-003', 'dirani top peach', 'l-xl', 1, 'marketing'),
(8, '2023-08-29', 'pinjam 100', 'Haven Black Shirt', 'all size', 1, 'budi');

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
  `sj_for_qc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangqc`
--

INSERT INTO `barangqc` (`idbarang_qc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `tgl_brg_keluar`, `sj_for_qc`) VALUES
(3, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 121, 'bu yani', '2023-06-25', '22060'),
(4, '2023-08-27', '2023-09-25', 'azurlane', 'formidable', 'XL', 212, 'bu tuti', '2023-08-28', 'qc-01'),
(8, '2023-08-27', '2023-09-25', 'unjani', 'informatika', 'l', 21, 'bu pipit', '2023-08-29', 'qc-02');

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
(5, '2023-09-01', 'retur-003', 'dirani top peach', 'l-xl', 1);

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
  `sj_for_produksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangrevisi`
--

INSERT INTO `barangrevisi` (`idbarang_revisi`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_produksi`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 1, '2023-07-10', '32063'),
(2, '2023-08-29', '2023-09-25', 'seraphina', 'dirani top white', 'all size', 1, '2023-07-10', '32063');

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
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangvendor`
--

INSERT INTO `barangvendor` (`idbarang_vendor`, `tgl_brg_masuk`, `sj_from_vendor`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `vendor`, `status`) VALUES
(1, '2023-06-20', '02060', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 121, 'bu yani', 'qc'),
(2, '2023-06-20', '02060', '2023-07-25', 'seraphina', 'linka top black', 's', 21, 'bu yani', 'payet'),
(3, '2023-05-01', '1111', '2023-05-31', 'seraphina', 'haven top', 'xl', 1111, 'bu tati', 'wa'),
(4, '2023-08-01', '0000', '2023-09-25', 'hell', 'black pink in your area', 'l', 32343, 'bu tuti', 'Payet'),
(10, '2023-08-29', 'vendor-01', '2023-09-25', 'azurlane', 'formidable', 's-l', 25, 'bu sri', 'QC'),
(12, '2023-08-29', 'vendor-01', '2023-09-25', 'Jennaka', 'haven white top', 'XL', 21, 'bu sari', 'Payet');

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
  `sj_for_wh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_lolosqc`
--

INSERT INTO `barang_lolosqc` (`idbarang_lolosqc`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`) VALUES
(75, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'l-xl', 100, '2023-07-10', '32060'),
(76, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(77, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060'),
(78, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060'),
(79, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060'),
(80, '2023-06-20', '2023-07-25', 'seraphina', 'dirani top peach', 'xl', 100, '2023-07-10', '32060'),
(133, '2022-01-08', '2023-08-11', 'Jennaka', 'black pink in your area', 'all size', 22, '2024-04-27', '1111'),
(135, '2022-01-08', '2023-08-11', 'Jennaka', 'black pink', 'all size', 222, '2024-04-27', '2222'),
(152, '2023-06-30', '2023-07-07', 'Jennaka', 'blackdot', 'all size', 32343, '2023-09-19', '00001'),
(212, '2023-06-29', '2023-06-30', 'hell', 'reddot headshot', 'XL', 25, '2023-07-28', '22234'),
(231, '2023-08-01', '2023-09-25', 'Jennaka', 'haven', 'all size', 25, '2023-08-31', '1111'),
(233, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111'),
(234, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111'),
(235, '2023-08-01', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-08-31', '1111'),
(236, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234'),
(237, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234'),
(238, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(239, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(240, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(241, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(242, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(243, '2023-06-20', '2023-07-25', 'seraphinaa', 'dirani top peach', 'all size', 100, '2023-07-10', '32060'),
(244, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234'),
(245, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234'),
(271, '2023-08-14', '2023-08-14', 'hell', 'reddotxl', 'XL', 25, '2023-08-31', '22234'),
(275, '2023-08-01', '2023-09-25', 'Jennaka', 'haven white top', 'all size', 25, '2023-08-31', '1111'),
(276, '2023-08-19', '2023-09-25', 'Jennaka', 'haven white top', 'all size', 25, '2023-09-01', '1111'),
(282, '2023-08-19', '2023-09-25', 'Jennaka', 'haven', 'all size', 25, '2023-09-01', '222'),
(283, '2023-08-19', '2023-09-25', 'Jennaka', 'haven black top', 'all size', 25, '2023-09-01', '1111'),
(289, '2023-08-01', '2023-09-25', 'azurlane', 'ilustrious top', 'l-xl', 25, '2023-08-25', 'qc-001');

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
  `sj_for_wh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_minor`
--

INSERT INTO `barang_minor` (`idbarang_minor`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32062'),
(2, '2023-08-28', '2023-09-05', 'azurlane', 'rio', 'all size', 25, '2023-08-29', 'minor-01');

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
  `sj_for_wh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_reject`
--

INSERT INTO `barang_reject` (`idbarang_reject`, `tgl_brg_masuk`, `launching_date`, `collection`, `article_name`, `size`, `stock`, `tgl_brg_keluar`, `sj_for_wh`) VALUES
(1, '2023-06-25', '2023-07-25', 'seraphina', 'dirani top peach', 'all size', 10, '2023-07-10', '32061'),
(3, '2023-08-01', '2023-08-25', 'seraph', 'dirani top black', 'xl', 100, '2023-08-26', '49001'),
(4, '2023-08-29', '2023-08-25', 'seraph', 'dirani top white', 'xl', 100, '2023-08-26', '49001');

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
  `umur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangminor`
--

INSERT INTO `gudangminor` (`idstock_minor`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`) VALUES
(25, 'JNK-2376', 'JENNAKA', 'shirt', 'HAVEN BLACK TOP', 'l', 5, 589000, '3d 3c', 'rak', '0-3 bulan'),
(26, 'JNK-3164', 'seraphina', 'SCRUNCHIE', 'dirani top peach', 'all size', 10, 589000, '3d 3c', 'kardus', '&gt; 24 BULAN');

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
  `umur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudangreject`
--

INSERT INTO `gudangreject` (`idstock_reject`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`) VALUES
(25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 4, 589000, '3d', 'rak', '13-18 bulan'),
(46, 'JNK-2376', 'seraph', 'SHIRT', 'DIRANI TOP BLACK', 'all size', 21, 3489900, '3d 3c', 'Kontainer', '0 - 3 BULAN');

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
  `umur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockgudang`
--

INSERT INTO `stockgudang` (`idstock`, `kode`, `collection`, `kategori`, `article_name`, `size`, `stock`, `harga`, `rak`, `lokasi`, `umur`) VALUES
(25, 'jnk-3163', 'celestial sun', 'outer', 'ILYA CARDIGAN PINK', 'free', 8, 589000, '3d', 'rak', '13-18 bulan'),
(30, 'JNK-2376', 'Jennaka', 'shirt', 'haven black top', 'l-xl', 25, 589000, '3d 3c', 'rak', '0 - 3 BULAN'),
(43, 'db-01', 'DRAGONBALL', 'OUTER', 'goku', 's-l', 212, 1000000, '1l', 'kresek', '0 - 3 BULAN');

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
-- Indexes for table `gudangreject`
--
ALTER TABLE `gudangreject`
  ADD PRIMARY KEY (`idstock_reject`);

--
-- Indexes for table `stockgudang`
--
ALTER TABLE `stockgudang`
  ADD PRIMARY KEY (`idstock`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_manager`
--
ALTER TABLE `admin_manager`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `admin_produksi`
--
ALTER TABLE `admin_produksi`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `idbarang_baku` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `baranginpayet`
--
ALTER TABLE `baranginpayet`
  MODIFY `idbarang_inpayet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `baranginrevisi`
--
ALTER TABLE `baranginrevisi`
  MODIFY `idbarang_inrevisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `baranginsewing`
--
ALTER TABLE `baranginsewing`
  MODIFY `idbarang_insewing` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  MODIFY `idbarang_keluar` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `barangpayet`
--
ALTER TABLE `barangpayet`
  MODIFY `idbarang_payet` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barangpinjam`
--
ALTER TABLE `barangpinjam`
  MODIFY `idbarang_pinjam` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `barangqc`
--
ALTER TABLE `barangqc`
  MODIFY `idbarang_qc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barangretur`
--
ALTER TABLE `barangretur`
  MODIFY `idbarang_retur` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barangrevisi`
--
ALTER TABLE `barangrevisi`
  MODIFY `idbarang_revisi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barangvendor`
--
ALTER TABLE `barangvendor`
  MODIFY `idbarang_vendor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `barang_lolosqc`
--
ALTER TABLE `barang_lolosqc`
  MODIFY `idbarang_lolosqc` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `barang_minor`
--
ALTER TABLE `barang_minor`
  MODIFY `idbarang_minor` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barang_reject`
--
ALTER TABLE `barang_reject`
  MODIFY `idbarang_reject` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gudangminor`
--
ALTER TABLE `gudangminor`
  MODIFY `idstock_minor` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `gudangreject`
--
ALTER TABLE `gudangreject`
  MODIFY `idstock_reject` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `stockgudang`
--
ALTER TABLE `stockgudang`
  MODIFY `idstock` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
