-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2024 at 09:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Name`, `EmailId`, `MobileNumber`, `Password`, `updationDate`) VALUES
(1, 'admin', 'Administrator', 'test@gmail.com', 7894561239, 'f925916e2754e5e03f75dd58a5733251', '2024-01-10 11:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `ImageId` int(1) NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `diupload` datetime NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `FromDate` varchar(100) DEFAULT NULL,
  `ToDate` varchar(100) DEFAULT NULL,
  `Comment` mediumtext DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `CancelledBy` varchar(5) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`BookingId`, `PackageId`, `UserEmail`, `FromDate`, `ToDate`, `Comment`, `RegDate`, `status`, `CancelledBy`, `UpdationDate`) VALUES
(7, 1, 'fajar@gmail.com', '2024-07-31', '2024-07-31', 'book', '2024-07-14 07:46:49', 1, NULL, '2024-07-14 08:37:32'),
(8, 11, 'fajar@gmail.com', '2024-08-31', '2024-08-31', 'book', '2024-07-14 09:40:04', 0, NULL, NULL),
(10, 1, 'fajar@gmail.com', '2024-08-31', '2024-08-31', 'book', '2024-07-21 10:59:29', 2, 'u', '2024-07-21 11:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblenquiry`
--

INSERT INTO `tblenquiry` (`id`, `FullName`, `EmailId`, `MobileNumber`, `Subject`, `Description`, `PostingDate`, `Status`) VALUES
(2, 'Kishan Twaerea', 'kishan@gmail.com', '6797947987', 'Enquiry', 'Any Offer for North Trip', '2024-01-18 06:31:38', 1),
(3, 'Jacaob', 'Jai@gmail.com', '1646689721', 'Any offer for North', 'Any Offer for north', '2024-01-19 06:32:41', 1),
(5, 'hohn Doe', 'John12@gmail.com', '142536254', 'Test Subject', 'this is for testing', '2024-02-03 13:07:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblissues`
--

CREATE TABLE `tblissues` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `Issue` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminremarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissues`
--

INSERT INTO `tblissues` (`id`, `UserEmail`, `Issue`, `Description`, `PostingDate`, `AdminRemark`, `AdminremarkDate`) VALUES
(7, 'test@gmail.com', 'Refund', 'I want my refund', '2024-01-25 06:56:29', NULL, '2024-01-30 05:20:14'),
(10, 'test@gmail.com', 'Other', 'Test Sample', '2024-01-31 05:24:40', NULL, NULL),
(13, 'garima12@gmail.com', 'Booking Issues', 'I want some information ragrding booking', '2024-02-03 13:06:00', 'Infromation provided', '2024-02-03 13:06:26'),
(14, NULL, NULL, NULL, '2024-07-14 07:45:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT '',
  `detail` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `type`, `detail`) VALUES
(1, 'terms', '																				<p align=\"justify\"><span style=\"color: rgb(153, 0, 0); font-size: small; font-weight: 700;\">terms and condition page</span></p>\r\n										\r\n										'),
(2, 'privacy', '										<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>\r\n										'),
(3, 'aboutus', '																				<div><span style=\"color: rgb(0, 0, 0); font-family: Georgia; font-size: 15px; text-align: justify; font-weight: bold;\">Welcome to&nbsp; Aulia Trans Wisata!!!</span></div><span style=\"font-family: &quot;courier new&quot;;\"><span style=\"color: rgb(0, 0, 0); font-size: 15px; text-align: justify;\">Since then, our courteous and committed team members have always ensured a pleasant and enjoyable tour for the clients. This arduous effort has enabled TMS to be recognized as a dependable Travel Solutions provider with three offices Delhi.</span><span style=\"color: rgb(80, 80, 80); font-size: 13px;\">&nbsp;We have got packages to suit the discerning traveler\'s budget and savor. Book your dream vacation online. Supported quality and proposals of our travel consultants, we have a tendency to welcome you to decide on from holidays packages and customize them according to your plan.</span></span>\r\n										\r\n										'),
(11, 'contact', '																														<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Jl. Menteng Dalam No. 42, RT.11/03, Menteng Dalam, Tebet, Jakarta Selatan</span>');

-- --------------------------------------------------------

--
-- Table structure for table `tbltourpackages`
--

CREATE TABLE `tbltourpackages` (
  `PackageId` int(11) NOT NULL,
  `PackageName` varchar(200) DEFAULT NULL,
  `PackageType` varchar(150) DEFAULT NULL,
  `PackageLocation` varchar(100) DEFAULT NULL,
  `PackagePrice` varchar(255) DEFAULT NULL,
  `PackageFetures` varchar(255) DEFAULT NULL,
  `PackageDetails` mediumtext DEFAULT NULL,
  `PackageImage` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltourpackages`
--

INSERT INTO `tbltourpackages` (`PackageId`, `PackageName`, `PackageType`, `PackageLocation`, `PackagePrice`, `PackageFetures`, `PackageDetails`, `PackageImage`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Paket Wisata Bandung (Big Bus 59 seat)', 'Group Package', 'Lembang, Ciwidey, Cikole, dan lainnya', '200.000/pax', 'Transportasi Bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket wisata', 'Paket tidak termasuk keperluan pribadi diluar fasilitas, tidak termasuk snack dan makan, tidak termasuk wisata belanja/oleh-oleh, tipping, durasi kegiatan 1 hari', 'cikole.jpg', '2024-07-15 05:21:58', '2024-07-22 19:52:15'),
(2, 'Paket Wisata Bandung (Medium Bus 29-31 seat)', 'Group Paket', 'Lembang, Ciwidey, Cikole, dan lainnya', '175.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket wisata', 'Paket tidak termasuk keperluan pribadi diluar fasilitas, tidak termasuk snack dan makan, tidak termasuk wisata belanja/oleh-oleh, tipping, durasi kegiatan 1 hari', 'janspark_bdg.jpg', '2024-07-15 05:21:58', '2024-07-22 19:52:28'),
(3, 'Wisata Museum (Jakarta)', 'Paket Study Tour', 'Jakarta', '140.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, snack dan makan siang boxs', 'Durasi kegiatan 1 hari, belum termasuk tipping', 'museum_nasional.jpg', '2024-07-15 05:21:58', '2024-07-22 19:51:56'),
(4, 'Puncak Area 2 Hari 1 Malam', 'Group Paket', 'Puncak Bogor', '230.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral.', 'Durasi Kegiatan 2 Hari 1 Malam, Min 50 pax, Penginapan sesuai program, makan sesuai program, tidak termasuk tipping', 'puncak-bogor.jpg', '2024-07-15 05:21:58', '2024-07-22 19:49:44'),
(5, 'Kepulauan Seribu', 'Group Paket', 'Kepulauan Seribu', '200.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, snack dan makan siang boxs', 'Durasi kegiatan 1 hari, belum termasuk tipping', 'pulau seribu.jpeg', '2024-07-15 05:21:58', '2024-07-22 19:59:12'),
(6, 'Kepulauan Seribu (Pulau Pramuka)', 'Group Paket', 'Kepulauan Seribu', '525.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, penginapan sesuai program, makan sesuai program', 'Durasi kegiatan 3 hari 2 malam, belum termasuk tipping', 'pulau pramuka.JPG', '2024-07-15 05:21:58', '2024-07-22 20:04:53'),
(7, 'Taman Wisata Buah Mekarsari Outbound', 'Group Paket', 'Bogor', '165.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, snack dan makan siang boxs', 'Durasi kegiatan 1 hari, tidak termasuk tipping, min 50 pax\'s', 'taman-mekarsari.jpg', '2024-07-15 05:21:58', '2024-07-22 20:19:07'),
(8, 'Taman Safari Indonesia', 'Group Paket', 'Bogor', '250.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, snack dan makan siang boxs', 'Durasi kegiatan 1 hari, belum termasuk tipping, min 50 pax\'s', 'taman-safari-.jpg', '2024-07-15 05:21:58', '2024-07-22 20:30:52'),
(9, 'Paket Wisata Bromo Malang (5 hari 2 malam)', 'Group Paket', 'Bromo - Malang', '1.500.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, penginapan sesuai program, makan sesuai program', 'Durasi kegiatan 5 hari 2 malam, belum termasuk tipping, min 50 pax\'s', 'bromo-malang.jpg', '2024-07-15 05:21:58', '2024-07-22 20:34:39'),
(11, 'Paket Wisata Dieng Plateau (3 hari 2 malam)', 'Group Paket', 'Dieng', '650.000/pax', 'Transportasi bus AC, driver dan guide, bbm, retribusi tol dan parkir, air mineral, tiket masuk, penginapan sesuai program, makan sesuai program', 'Durasi kegiatan 3 hari 2 malam, belum termasuk tipping, min 50 pax\'s', 'dieng-plateau.jpeg', '2024-07-14 09:36:22', '2024-07-22 20:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransportasi`
--

CREATE TABLE `tbltransportasi` (
  `transid` int(11) NOT NULL,
  `TransName` varchar(200) NOT NULL,
  `TransType` varchar(150) NOT NULL,
  `TransFetures` varchar(255) NOT NULL,
  `TransDetails` mediumtext NOT NULL,
  `TransImage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltransportasi`
--

INSERT INTO `tbltransportasi` (`transid`, `TransName`, `TransType`, `TransFetures`, `TransDetails`, `TransImage`) VALUES
(1, 'Midas Nusantara', 'Big Bus', 'Bus Full AC, LCD TV, Microphone, USB Media, Karaoke, Charging Plug, Bagasi', '47 - 59 Seats, Comfortable Seats, Bus Full AC, LCD TV, Microphone, USB Media, Karaoke, Charging Plug, Bagasi', 'Midas Big Bus.jpeg'),
(2, 'Midas Nusantara', 'Big Bus', 'Bus Full AC, LCD TV, Microphone, USB Media, Karaoke, Charging Plug, Bagasi', '47 - 59 Seats, Comfortable Seats, Bus Full AC, LCD TV, Microphone, USB Media, Karaoke, Charging Plug, Bagasi', 'Midas Big Bus 2.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `EmailId` varchar(70) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Password`, `RegDate`, `UpdationDate`) VALUES
(10, 'Garima Singh', '1425362540', 'garima12@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-02-03 13:03:43', '2024-02-03 13:04:02'),
(12, 'fajar', '0812987623', 'fajar@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759', '2024-07-14 07:45:39', '2024-07-21 13:58:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`ImageId`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissues`
--
ALTER TABLE `tblissues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  ADD PRIMARY KEY (`PackageId`);

--
-- Indexes for table `tbltransportasi`
--
ALTER TABLE `tbltransportasi`
  ADD PRIMARY KEY (`transid`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`),
  ADD KEY `EmailId_2` (`EmailId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `ImageId` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblissues`
--
ALTER TABLE `tblissues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  MODIFY `PackageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbltransportasi`
--
ALTER TABLE `tbltransportasi`
  MODIFY `transid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
