-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 05, 2021 at 06:18 AM
-- Server version: 8.0.23
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkl`
--

-- --------------------------------------------------------

--
-- Table structure for table `acara`
--

CREATE TABLE `acara` (
  `id_acara` int NOT NULL,
  `nama_acara` varchar(255) NOT NULL,
  `tgl_acara` date NOT NULL,
  `alamat_acara` text NOT NULL,
  `waktu_acara` time NOT NULL,
  `gambar` text NOT NULL,
  `nama_genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acara`
--

INSERT INTO `acara` (`id_acara`, `nama_acara`, `tgl_acara`, `alamat_acara`, `waktu_acara`, `gambar`, `nama_genre`) VALUES
(8, 'Konser Petra ', '2018-01-24', 'Gedung Cakrawala', '20:00:00', 'petra.jpg', 'pop'),
(19, 'Konser RAN', '2018-02-22', 'Gedung Kartika', '20:00:00', 'ran1.jpg', 'akustik'),
(20, 'Konser Hivi', '2018-02-28', 'Graha Cakrawala', '18:00:00', 'hivi1.jpg', 'jazz'),
(22, 'Konser Gisel', '2018-03-06', 'Graha Cakrawala', '19:30:00', 'gisel.png', 'pop'),
(26, 'Konser Yura', '2018-02-18', 'Graha Cakrawala', '14:00:00', 'yura1.jpg', 'akustik'),
(27, 'Konser Judika', '2018-02-13', 'Gedung Kartika', '20:00:00', 'judika1.jpg', 'rock'),
(29, 'Konser Afgan', '2018-02-25', 'Lapangan Rampal', '18:00:00', 'Afgan1.jpg', 'akustik'),
(31, 'Konser Raisa', '2018-01-11', 'Gedung kartika', '20:00:00', 'raisa4.jpg', 'akustik'),
(32, 'Konser Jazz', '2018-02-24', 'Gedung Cakrawala', '00:00:00', '005075918_500.jpg', 'jazz');

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id_harga` int NOT NULL,
  `id_acara` int NOT NULL,
  `jenis_tiket` int NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id_harga`, `id_acara`, `jenis_tiket`, `harga`) VALUES
(1, 29, 0, 35000),
(2, 29, 1, 75000),
(3, 29, 2, 150000),
(4, 22, 0, 35000),
(5, 22, 1, 75000),
(6, 22, 2, 150000),
(7, 20, 0, 35000),
(10, 27, 0, 35000),
(11, 20, 1, 75000),
(12, 20, 2, 150000),
(14, 27, 1, 75000),
(15, 27, 2, 150000),
(16, 8, 0, 40000),
(17, 8, 1, 80000),
(18, 8, 2, 120000),
(19, 31, 0, 60000),
(20, 31, 1, 100000),
(21, 31, 2, 175000),
(22, 19, 0, 45000),
(23, 19, 1, 90000),
(24, 19, 2, 180000),
(25, 26, 0, 25000),
(26, 26, 1, 50000),
(27, 26, 2, 100000),
(28, 32, 0, 25000),
(29, 32, 1, 50000),
(30, 32, 2, 75000);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL,
  `id_komentar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`nama`, `email`, `komentar`, `id_komentar`) VALUES
('erma', 'erma@gmail.com', 'haloo', 9),
('Nabilla', 'nabillabasharahil@gmail.com', 'Keren abis', 10),
('erma', 'erma@go', 'Kereeeen', 11),
('erma', 'erma@gmail.com', 'Kerenn', 13),
('nka', 'knsqkkq@JEd', 'wek', 14),
('Yeni', 'yeninurazizah@gmail.com', 'bagus sekaliii', 15),
('yeni', 'yeninurazizah@gmail.com', 'kurang memuaskan', 16),
('yeni', 'yeninurazizah@gmail.com', 'bagus', 17),
('dian', 'dianamanda@gmail.com', 'seharusnya lebih banyak informasi yang up to date', 18),
('dian', 'dianamanda@gmail.com', 'bagusss sekaliiii', 19),
('iin', 'iin@gmail.com', 'bagus', 20);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int NOT NULL,
  `target_user` int NOT NULL,
  `target_link` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `is_read` tinyint NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `target_user`, `target_link`, `title`, `subtitle`, `is_read`, `waktu`) VALUES
(3, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'nabila mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-11 02:55:37'),
(4, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'bang faisal mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-11 03:47:35'),
(5, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'bila mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 01:37:03'),
(6, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'agung mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 01:47:29'),
(7, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'agung mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 02:06:20'),
(8, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'bila mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 02:12:38'),
(9, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 02:14:17'),
(10, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'bila mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 02:24:18'),
(11, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 02:40:18'),
(12, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'alifia mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 10:04:40'),
(13, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'Erma mengomentari tiket anda', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-12 14:12:19'),
(14, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:06:28'),
(15, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'lipi Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:16:22'),
(16, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'mb Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:17:01'),
(17, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'yi Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:17:12'),
(18, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'jwhui Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:20:09'),
(19, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'whiohHIWH Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:21:09'),
(20, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'sbqh Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:22:30'),
(21, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'hqwiu Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:23:14'),
(22, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:52:41'),
(23, 1, 'http://localhost/konser/index.php/admin/data_email', 'Nabila@yahoo.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:56:46'),
(24, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'nabilla Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:57:22'),
(25, 1, 'http://localhost/konser/index.php/admin/data_email', 'alifiaputri.ramadhani@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:58:08'),
(26, 1, 'http://localhost/konser/index.php/admin/data_email', 'erma@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 12:59:14'),
(27, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabila@yahoo.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:04:01'),
(28, 1, 'http://localhost/konser/index.php/admin/data_email', 'agung@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:04:51'),
(29, 1, 'http://localhost/konser/index.php/admin/data_email', 'agung@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:05:36'),
(30, 1, 'http://localhost/konser/index.php/admin/data_email', 'alifiaputri.ramadhani@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:06:39'),
(31, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:06:56'),
(32, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:07:38'),
(33, 1, 'http://localhost/konser/index.php/admin/data_email', 'ermarohma@yahoo.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:07:58'),
(34, 1, 'http://localhost/konser/index.php/admin/data_email', 'alifiaputri.ramadhani@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:08:31'),
(35, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabilla_br_24rpl@student.smktelkom-mlg.sch.id Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:08:59'),
(36, 1, 'http://localhost/konser/index.php/admin/data_email', 'erma@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-13 13:10:57'),
(37, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'Alifia Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-14 03:20:52'),
(38, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-14 03:33:08'),
(39, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'alipi Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-14 03:42:21'),
(40, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'asjd Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-14 03:42:59'),
(41, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'asjd Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-14 03:42:59'),
(42, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:28:27'),
(43, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:31:32'),
(44, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:31:56'),
(45, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:32:26'),
(46, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:37:50'),
(47, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:38:17'),
(48, 1, 'http://localhost/konser/index.php/admin/data_email', 'erma@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 12:38:35'),
(49, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'Nabilla Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 13:09:12'),
(50, 1, 'http://localhost/konser/index.php/admin/data_email', 'erma@go Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 13:10:24'),
(51, 1, 'http://localhost/konser/index.php/admin/data_email', 'em@go Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 13:11:00'),
(52, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-15 13:11:16'),
(53, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'alifia Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-16 02:41:45'),
(54, 1, 'http://localhost/konser/index.php/admin/data_email', 'alifia@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-16 02:45:35'),
(55, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'erma Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-16 03:02:21'),
(56, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabillabasharahil@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-16 03:02:45'),
(57, 1, 'http://localhost/konser/index.php/admin/data_email', 'nabilla_br_24rpl@student.smktelkom-mlg.sch.id Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-16 03:18:41'),
(58, 1, 'http://localhost/konser/index.php/admin/data_rating', 'd Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-24 04:25:57'),
(59, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'nka Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-01-24 04:29:04'),
(60, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'bila Memesan tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 08:06:18'),
(61, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'b, Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 08:10:43'),
(62, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'bila Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 08:17:23'),
(63, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'bila Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 08:18:20'),
(64, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'bil Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 08:21:38'),
(65, 1, 'http://localhost/konser/index.php/admin/data_transaksi', ' N Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 12:35:51'),
(66, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'Nabila Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-03 12:53:33'),
(67, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'Erma Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-06 08:54:55'),
(68, 1, 'http://localhost/konser/index.php/admin/data_rating', 'Nabilla Memberikan Komentar ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-02-07 02:57:38'),
(69, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'Yeni Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-03 15:08:21'),
(70, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'yeni Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-03 15:09:00'),
(71, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'yeni azizah Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-03 15:14:18'),
(72, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'lipi Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 10:58:05'),
(73, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'lipi Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 11:54:03'),
(74, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'lipi Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 12:21:58'),
(75, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'yeni Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 12:22:27'),
(76, 1, 'http://localhost/konser/index.php/admin/data_email', 'ermarohmawati@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 12:22:39'),
(77, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'dian Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 12:26:56'),
(78, 1, 'http://localhost/konser/index.php/admin/data_email', 'dianamanda@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 12:27:40'),
(79, 1, 'http://localhost/konser/index.php/admin/data_email', 'dianamanda@gmail.com Mengikuti Anda ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 14:12:25'),
(80, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'dian Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 14:12:46'),
(81, 1, 'http://localhost/konser/index.php/admin/data_transaksi', 'Yeni Azizah Memesan Tiket ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-03-04 14:14:11'),
(82, 1, 'http://localhost/konser/index.php/admin/data_komentar', 'iin Memberikan Saran ', 'Klik notifikasi untuk informasi lebih lanjut', 1, '2018-05-28 03:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `pasar`
--

CREATE TABLE `pasar` (
  `id_pasar` int NOT NULL,
  `nama_pasar` varchar(45) NOT NULL,
  `nama_op` varchar(45) NOT NULL,
  `no_telp` int NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasar`
--

INSERT INTO `pasar` (`id_pasar`, `nama_pasar`, `nama_op`, `no_telp`, `alamat`, `username`, `password`) VALUES
(1, 'pasar blimbing', 'asd', 1234, 'malang', 'user', 'asd'),
(2, 'pasar arjosari', 'yanto', 9876, 'malang', 'yanto', 'asd'),
(3, 'pasar gadang', 'dedi', 9876, 'gadang', 'dedi', 'asd'),
(4, 'pasar pamor', 'dwi', 2147483647, 'jl.pendidikan', 'pamorpendidikan', '12345'),
(5, 'asdas', 'asda', 1211, '121', '1111', '1111'),
(7, 'test', 'asdada', 1234, 'malang', 'admin', 'asdasd'),
(9, 'pasar blimbinga', 'asd', 1234, 'Strzelin', 'aaan', '11111'),
(11, 'pasar blimbinga', 'asdada', 1234, 'Strzelin', 'mmm', 'nn'),
(13, 'asdas', 'aaa', 11, 'qqq', 'useraa', '1244'),
(14, '1', '1', 1, '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE `pendapatan` (
  `id_pendapatan` int NOT NULL,
  `id_pasar` int NOT NULL,
  `tanggal` date NOT NULL,
  `target` int NOT NULL,
  `realisasi` int NOT NULL,
  `bukti_setor` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sts` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendapatan`
--

INSERT INTO `pendapatan` (`id_pendapatan`, `id_pasar`, `tanggal`, `target`, `realisasi`, `bukti_setor`, `status`, `sts`) VALUES
(1, 1, '2021-01-04', 1000000, 98888, 'buktitf.png', 1, NULL),
(2, 2, '2021-01-04', 1000000, 1000000, '', 1, NULL),
(3, 13, '2021-01-04', 1000000, 12222, '134d1d97b74117a1d9a6c6799cc4298a.jpg', 1, '9e24fa3bf3f261c9c51f4243ebd5bf96.jpg'),
(4, 2, '2021-01-05', 1000000, 1000000, '', 1, NULL),
(5, 1, '2021-01-05', 1000000, 1000000, '', 1, NULL),
(9, 1, '2021-01-22', 2313123, 2000000, '', 1, NULL),
(10, 13, '2021-01-08', 12121, 0, '', 0, NULL),
(11, 3, '2021-01-08', 12121, 0, '', 0, NULL),
(12, 13, '2021-01-08', 12121, 1200, 'd0fa9b1dbf8823cf17b241fa98686eb2.jpg', 1, '2a55bcefb5268c5153ca99d6e84fcde6.jpg'),
(13, 3, '2021-01-08', 12121, 10000, '', 0, ''),
(14, 3, '2021-01-08', 12121, 0, '', 0, NULL),
(15, 3, '2021-01-08', 12121, 0, '', 0, NULL),
(16, 3, '2021-01-15', 999, 0, '', 0, NULL),
(17, 1, '2021-01-14', 1112, 0, '', 0, NULL),
(20, 3, '2021-01-13', 1212, 0, '', 0, NULL),
(21, 1, '2021-01-12', 10000, 0, '', 0, NULL),
(22, 3, '2021-01-22', 1, 0, '', 0, NULL),
(23, 4, '2021-01-19', 12, 0, '', 0, NULL),
(24, 4, '2021-01-13', 14, 0, '', 0, NULL),
(25, 4, '2021-01-13', 14, 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `email` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL,
  `id_rating` int NOT NULL,
  `id_acara` int NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`email`, `komentar`, `id_rating`, `id_acara`, `nama`) VALUES
('asdfgh@gmail.com', 'sdas', 12, 112, 'qwdwdw'),
('asdfgh@gmail.com', 'sdas', 13, 112, 'qwdwdw');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `email` varchar(100) NOT NULL,
  `id_email` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`email`, `id_email`) VALUES
('alifia@gmail.com', 22),
('nabillabasharahil@gmail.com', 23),
('ermarohmawati@gmail.com', 24),
('dianamanda@gmail.com', 25),
('dianamanda@gmail.com', 26);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contoh`
--

CREATE TABLE `tbl_contoh` (
  `id` int DEFAULT NULL,
  `kategori` varchar(11) DEFAULT NULL,
  `created_by` varchar(7) DEFAULT NULL,
  `created_date` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contoh`
--

INSERT INTO `tbl_contoh` (`id`, `kategori`, `created_by`, `created_date`) VALUES
(1, 'Codeigniter', 'Heru', '2020-10-01 08:01:34'),
(2, 'Codeigniter', 'Heru', '2020-10-01 08:01:34'),
(4, 'Codeigniter', 'Maulana', '2020-10-01 08:01:34'),
(5, 'Codeigniter', 'Maulana', '2020-10-01 08:01:34'),
(6, 'Codeigniter', 'Maulana', '2020-10-01 08:01:34'),
(7, 'Codeigniter', 'Maulana', '2020-10-01 08:01:34'),
(8, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(9, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(10, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(11, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(12, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(13, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(14, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(15, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(16, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(17, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(18, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(19, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(20, 'Codeigniter', 'Maulana', '0000-00-00 00:00:00'),
(21, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(22, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(23, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(24, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(25, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(26, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(27, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(28, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(29, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(30, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(31, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(32, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(33, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(34, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(35, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(36, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(37, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(38, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(39, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(40, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(41, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(42, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(43, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(44, 'Laravel', 'Maulana', '0000-00-00 00:00:00'),
(45, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(46, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(47, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(48, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(49, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(50, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(51, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(52, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(53, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(54, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(55, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(56, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(57, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(58, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(59, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(60, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(61, 'Node JS', 'Maulana', '0000-00-00 00:00:00'),
(62, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(63, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(64, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(65, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(66, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(67, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(68, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(69, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(70, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(71, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(72, 'Java', 'Maulana', '0000-00-00 00:00:00'),
(73, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(74, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(75, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(76, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(77, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(78, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(79, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(80, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(81, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(82, 'C#', 'Maulana', '0000-00-00 00:00:00'),
(83, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(84, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(85, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(86, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(87, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(88, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(89, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(90, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(91, 'VB NET', 'Maulana', '0000-00-00 00:00:00'),
(92, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(93, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(94, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(95, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(96, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(97, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(98, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(99, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(100, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(101, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(102, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(103, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(104, 'VB NET', 'Heru', '0000-00-00 00:00:00'),
(105, 'C#', 'Heru', '0000-00-00 00:00:00'),
(106, 'C#', 'Heru', '0000-00-00 00:00:00'),
(107, 'C#', 'Heru', '0000-00-00 00:00:00'),
(108, 'C#', 'Heru', '0000-00-00 00:00:00'),
(109, 'C#', 'Heru', '0000-00-00 00:00:00'),
(110, 'C#', 'Heru', '0000-00-00 00:00:00'),
(111, 'C#', 'Heru', '0000-00-00 00:00:00'),
(112, 'C#', 'Heru', '0000-00-00 00:00:00'),
(113, 'C#', 'Heru', '0000-00-00 00:00:00'),
(114, 'C#', 'Heru', '0000-00-00 00:00:00'),
(115, 'C#', 'Heru', '0000-00-00 00:00:00'),
(116, 'C#', 'Heru', '0000-00-00 00:00:00'),
(117, 'C#', 'Heru', '0000-00-00 00:00:00'),
(118, 'C#', 'Heru', '0000-00-00 00:00:00'),
(119, 'C#', 'Heru', '0000-00-00 00:00:00'),
(120, 'C#', 'Heru', '0000-00-00 00:00:00'),
(121, 'Java', 'Heru', '0000-00-00 00:00:00'),
(122, 'Java', 'Heru', '0000-00-00 00:00:00'),
(123, 'Java', 'Heru', '0000-00-00 00:00:00'),
(124, 'Java', 'Heru', '0000-00-00 00:00:00'),
(125, 'Java', 'Heru', '0000-00-00 00:00:00'),
(126, 'Java', 'Heru', '0000-00-00 00:00:00'),
(127, 'Java', 'Heru', '0000-00-00 00:00:00'),
(128, 'Java', 'Heru', '0000-00-00 00:00:00'),
(129, 'Java', 'Heru', '0000-00-00 00:00:00'),
(130, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(131, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(132, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(133, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(134, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(135, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(136, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(137, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(138, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(139, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(140, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(141, 'Node JS', 'Heru', '0000-00-00 00:00:00'),
(142, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(143, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(144, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(145, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(146, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(147, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(148, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(149, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(150, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(151, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(152, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(153, 'Laravel', 'Heru', '0000-00-00 00:00:00'),
(154, 'Laravel', 'Heru', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_acara` int NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL,
  `status` int NOT NULL,
  `mode_pembayaran` varchar(100) NOT NULL,
  `id_harga` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nama`, `id_acara`, `jumlah`, `total`, `status`, `mode_pembayaran`, `id_harga`, `id_user`) VALUES
(12, 'rawon', 26, 3, 75000, 1, 'BCA', 25, 7),
(33, 'Nabila', 8, 2, 80000, 1, 'BNI', 16, 8),
(34, 'Erma', 8, 2, 80000, 1, 'BNI', 16, 9),
(35, 'yeni azizah', 31, 2, 120000, 1, 'BCA', 19, 7),
(37, 'lipi', 31, 3, 180000, 0, 'BCA', 19, 8),
(38, 'lipi', 31, 3, 180000, 0, 'BCA', 19, 8),
(39, 'Yeni Azizah', 31, 3, 180000, 0, 'BCA', 19, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(12, 'sda', 'sdad'),
(13, 'addin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `gambar`) VALUES
(6, 'Erma Rohmawati', 'erma', 'erma1.JPG'),
(7, '456', '456', 'bila1.png'),
(8, 'lipi', 'lipi', 'lipi.jpg'),
(9, '1111', '1111', 'cinema6.png'),
(11, 'addin', '1234', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acara`
--
ALTER TABLE `acara`
  ADD PRIMARY KEY (`id_acara`);

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id_harga`),
  ADD KEY `id_acara` (`id_acara`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasar`
--
ALTER TABLE `pasar`
  ADD PRIMARY KEY (`id_pasar`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`id_pendapatan`),
  ADD KEY `id_pasar` (`id_pasar`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id_email`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `transaksi_acara` (`id_acara`),
  ADD KEY `id_harga` (`id_harga`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acara`
--
ALTER TABLE `acara`
  MODIFY `id_acara` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id_harga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `pasar`
--
ALTER TABLE `pasar`
  MODIFY `id_pasar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pendapatan`
--
ALTER TABLE `pendapatan`
  MODIFY `id_pendapatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id_email` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `harga_ibfk_1` FOREIGN KEY (`id_acara`) REFERENCES `acara` (`id_acara`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD CONSTRAINT `pendapatan_ibfk_1` FOREIGN KEY (`id_pasar`) REFERENCES `pasar` (`id_pasar`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_acara` FOREIGN KEY (`id_acara`) REFERENCES `acara` (`id_acara`),
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_harga`) REFERENCES `harga` (`id_harga`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
