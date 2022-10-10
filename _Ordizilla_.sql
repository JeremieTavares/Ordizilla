-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2022 at 09:37 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordzilla`
--
CREATE DATABASE IF NOT EXISTS `ordzilla` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ordzilla`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL,
  `adm_username` varchar(16) NOT NULL,
  `adm_password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `adm_username`, `adm_password`) VALUES
(1, 'ordi', '$2y$10$m.WcNqt2P1ZnNCDXPysFR.LvOyMIfSLEPy5F6PiEfqsU.p/EPg3V2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `allpiece`
-- (See below for the actual view)
--
CREATE TABLE `allpiece` (
`typePiece` varchar(11)
,`id` int(11)
,`nom` varchar(128)
,`company` varchar(128)
,`vitesseWatt` int(11)
,`type` varchar(32)
,`typeCapacity` varchar(16)
,`quantite` int(11)
,`prix` int(11)
,`path` varchar(128)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `allpieceinstock`
-- (See below for the actual view)
--
CREATE TABLE `allpieceinstock` (
`typePiece` varchar(11)
,`id` int(11)
,`nom` varchar(128)
,`company` varchar(128)
,`vitesseWatt` int(11)
,`type` varchar(32)
,`typeCapacity` varchar(16)
,`quantite` int(11)
,`prix` int(11)
,`path` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `com_id` int(11) NOT NULL,
  `com_name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`com_id`, `com_name`) VALUES
(1, 'INTEL'),
(2, 'AMD'),
(3, 'ASUS'),
(4, 'EVGA'),
(5, 'MSI'),
(6, 'GIGABYTE'),
(7, 'XFX'),
(8, 'ASROCK'),
(9, 'ZOTAC'),
(10, 'EV'),
(11, 'CORSAIR'),
(12, 'G.SKILLZ'),
(13, 'TEAM'),
(14, 'KINGSTON'),
(15, 'GEIL'),
(16, 'PATRIOT'),
(17, 'WESTERN DIGITAL'),
(18, 'PNY'),
(19, 'SEAGATE'),
(20, 'RELETECH'),
(21, 'SILICON POWER'),
(22, 'TOSHIBA'),
(23, 'COOLER MASTER'),
(24, 'ENERMAX'),
(25, 'NOCTUA'),
(26, 'TERMALRIGHT'),
(27, 'ROSEWILL'),
(28, 'DEEPCOOL'),
(29, 'TERMALTAKE'),
(30, ''),
(31, '4'),
(32, 'PHANTEKS'),
(33, 'FRACTAL DESIGN'),
(34, 'SILVERSTONE'),
(35, 'GAMDIAS'),
(36, 'DIYPC'),
(37, 'APEXGAMING'),
(38, 'AZZA'),
(39, 'COUGAR'),
(40, 'GAMEMAX'),
(41, 'SAMA'),
(42, 'ANTEC'),
(43, 'NZXT'),
(44, 'RAIJINTEK'),
(45, 'CRUCIAL'),
(46, 'OLOY'),
(47, 'qwe');

-- --------------------------------------------------------

--
-- Table structure for table `cooling`
--

CREATE TABLE `cooling` (
  `coo_id` int(11) NOT NULL,
  `coo_name` varchar(128) NOT NULL,
  `coo_clock` int(11) NOT NULL,
  `coo_company` int(11) NOT NULL,
  `coo_watercooling` int(11) NOT NULL,
  `coo_amount` int(11) NOT NULL,
  `coo_prix` int(11) NOT NULL,
  `coo_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cooling`
--

INSERT INTO `cooling` (`coo_id`, `coo_name`, `coo_clock`, `coo_company`, `coo_watercooling`, `coo_amount`, `coo_prix`, `coo_path`) VALUES
(2, 'CORSAIR iCUE H170i ELITE CAPELLIX Liquid CPU Cooler', 2000, 11, 2, 2, 299, 'c64494f7302cfbc55e304b77ea979a83ade544bf.jpg'),
(3, 'Cooler Master MasterLiquid ML120L RGB Close-Loop', 1200, 23, 2, 3, 70, 'c240b95f8a3e6bc4b3cc5ceec835ef3db85b3fde.jpg'),
(4, 'Enermax AQUAFUSION 120 ARGB White', 2000, 24, 2, 4, 87, 'c3b4dc671c3efaf7200ae7415de13c114c7f0fb1.jpg'),
(5, 'Cooler Master B120i CPU Water-Cooled 120mm', 3000, 23, 2, 2, 112, '927a7da5b8db838d6e71923050b13d9a88643944.jpg'),
(6, 'Noctua NH-D15 SE-AM4', 1800, 25, 1, 7, 130, '2a623ec4c2da529459a705fa1c29db44dc0b8672.jpg'),
(7, 'Thermalright Frozen Magic 120 All-In-One', 1400, 26, 2, 3, 149, 'fe115014581ea3a2560b681a76b248ae8c45ce21.jpg'),
(8, 'Cooler Master MasterLiquid ML360 SUB-ZERO Close-Loop AIO', 3600, 23, 2, 1, 959, 'a390f67d97b8501972c0d14085e9c588950beb06.jpg'),
(9, ' Visit Sennow Store Cooler Master MasterLiquid Lite 120', 1200, 23, 2, 4, 99, '51b3cc2d94a1911542d9254ac4e5b5c7f6530bdb.png'),
(10, 'Enermax LIQMAX III 240 RGB, All-in-one', 2000, 24, 2, 5, 93, 'ab3dcaeba95cd63c8172659ccfd793b8af8d6db6.jpg'),
(11, 'Enermax LIQMAX III 240 RGB, All-in-one', 2000, 24, 1, 2, 134, '3eaf0940e60563c3fee87496b176abc2eb073ac8.jpg'),
(12, 'Rosewill ROCC-16003 Long Life Sleeve Bearing', 1000, 27, 2, 2, 35, '67765a6117add7de8e49254a96b03432376d708f.jpg'),
(13, 'Cooler Master Hyper 212 EVO V2', 1500, 23, 2, 8, 57, 'e05554322951da84e0a375de27588eac6cc069ed.jpg'),
(14, 'Enermax ETS-T40 Fit CPU Air Cooler', 1300, 24, 2, 5, 50, '221e4b7ccb1787ab1615ccde2205e91553d9dcd9.jpg'),
(15, 'Cooler Master Hyper 212 Black Edition CPU Air Cooler', 1650, 23, 2, 9, 85, '97f59ecbcc837a934d4e3a13ba70be3c4a0c0b2e.jpg'),
(16, 'Cooler Master Hyper 212 RGB Black Edition CPU Air Cooler', 1600, 23, 2, 1, 79, 'e4d91266430c639be2940c90ed74f7a59f9f03a1.jpg'),
(17, 'DeepCool AS500 CPU Air Cooler, Universal RAM Height', 1900, 28, 2, 4, 87, 'e28bab740ae10c7f42576c1184759a8e0fe4f61c.jpg'),
(18, 'DeepCool AK620 High-Performance, Dual-Tower Design', 2000, 28, 2, 8, 82, 'ba7bccf25300faf8efb94ca4c415ce5e62881519.jpg'),
(19, 'Thermaltake TOUGHAIR 510 Racing Green Edition', 2000, 29, 2, 5, 82, 'ee52e0b2a19f4bb9fbc4c7e7b2a329aee07c5a39.jpg'),
(20, 'Thermaltake TOUGHAIR 510 Turquoise Edition CPU', 2000, 29, 2, 5, 82, '3248748154e453e675864c877ab6ff26f7e9cf52.jpg'),
(21, 'Corsair LL Series CO-9050092-WW LL120 RGB, 120mm', 2000, 11, 2, 4, 169, '1406ffeb0c8226df3c272a5d2bdb3af28d10807e.jpg'),
(22, 'Corsair LL Series CO-9050072-WW LL120 RGB', 1800, 11, 2, 1, 186, 'c43443bd372f00928d888e1482c84a4bc518dfdc.jpg'),
(23, 'Rosewill ROCC-16002 High Performance Long Life Sleeve', 1000, 27, 2, 4, 30, '36a4b3e2b2ff3fadffa76eeb637150199b20d672.jpg'),
(24, 'Noctua NH-U12S, Premium CPU Cooler with NF-F12 120mm', 1800, 25, 2, 5, 119, 'def338e7de43cf689053c4be5eec38fb663f90eb.jpg'),
(25, 'Phanteks PH-TC14PE 140mm UFB', 2200, 32, 2, 11, 130, '8fc95dab6940c09d21b3ee608eadd9ffe7b9af96.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cpu`
--

CREATE TABLE `cpu` (
  `cpu_id` int(11) NOT NULL,
  `cpu_name` varchar(128) NOT NULL,
  `cpu_type` int(11) NOT NULL,
  `cpu_speed` int(11) NOT NULL,
  `cpu_company` int(11) NOT NULL,
  `cpu_amount` int(11) NOT NULL,
  `cpu_prix` int(11) NOT NULL,
  `cpu_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cpu`
--

INSERT INTO `cpu` (`cpu_id`, `cpu_name`, `cpu_type`, `cpu_speed`, `cpu_company`, `cpu_amount`, `cpu_prix`, `cpu_path`) VALUES
(6, 'Intel Core i5-11600 - 11th Gen Rocket Lake 6-Core ', 7, 2, 1, 2, 349, '401b63dae346d597fc2b850e9813022b86b78032.jpg'),
(7, 'Intel Core i5-10400 - 10th Gen Comet Lake 6-Core', 6, 2, 1, 2, 195, '097770b611bf1e490ca743a561643b3f36407414.jpg'),
(8, 'Intel Core i9-12900K - 12th Gen Alder Lake 16-Core (8P+8E)', 9, 3, 1, 1, 799, '63c4a431736205ccbc8ef971a1de972f046897f3.jpg'),
(9, 'Intel Core i7-12700K - 12th Gen Alder Lake 12-Core (8P+4E) ', 9, 3, 1, 6, 549, '8676f64038f6615293a9acaeb5ea9a9c9e58527b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `gpu_id` int(11) NOT NULL,
  `gpu_name` varchar(128) NOT NULL,
  `gpu_watt` int(11) NOT NULL,
  `gpu_company` int(11) NOT NULL,
  `gpu_amount` int(11) NOT NULL,
  `gpu_prix` int(11) NOT NULL,
  `gpu_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`gpu_id`, `gpu_name`, `gpu_watt`, `gpu_company`, `gpu_amount`, `gpu_prix`, `gpu_path`) VALUES
(2, ' RTX 3080 FTW3 ULTRA GAMING Video Card', 450, 4, 20, 1249, '4e81fba6e541f98f0c3c187ed45b396f6d491b89.jpg'),
(3, ' RTX 3060 - ROG-STRIX 12GB GDDR6 PCI-E', 330, 3, 1, 439, 'c8b81aaa7f74fb1436df03a1bd5c96b432fc49bc.jpg'),
(4, 'MSI Ventus GeForce RTX 3060 12GB GDDR6 ', 360, 5, 5, 559, 'be0e7217ef3eb439428ee2c65d8d5b9af3b6d71f.jpg'),
(5, 'MSI Suprim GeForce RTX 3090 24GB GDDR6X', 550, 5, 1, 2642, 'e0374731a4ec453dd831d21efe4c0bba34dc7ec1.jpg'),
(7, 'GIGABYTE GAMING OC Radeon RX 6500 XT 4GB GDDR6', 300, 6, 3, 399, 'f1e42d454036448dbdc726c94bafeb0275c1ae35.jpg'),
(8, 'XFX SPEEDSTER MERC319 Radeon RX 6750 XT', 520, 7, 8, 779, '6e78b487359122586b403eca1182639298a8c6d1.jpg'),
(9, 'GIGABYTE Vision GeForce RTX 3070 Ti 8GB', 490, 6, 7, 979, 'f0a68e1707cf18672308c1848fc21680637c4c20.jpg'),
(10, 'ASRock OC Formula Radeon RX 6950 XT 16GB GDDR6', 400, 8, 2, 1499, '55df416673fbef9f8073141f60b12c241753daca.jpg'),
(11, 'EVGA GeForce RTX 3080 12GB XC3 BLACK GAMING', 490, 4, 6, 1911, '82376962a940f2fddc145d35a8f4deeac6b00285.jpg'),
(13, 'Sapphire TOXIC AMD Radeon RX 6900 XT Air Cooled', 600, 2, 1, 2499, 'ba3bb6917b2bfd74be0ba9962cde3daa0e904f9b.jpg'),
(14, 'ZOTAC GAMING GeForce GTX 1660 6GB GDDR5', 200, 9, 15, 329, '2836e74e09caf403d7ae3335319fa9a7e7a137e3.jpg'),
(15, 'EVGA GeForce RTX 3070 FTW3 ULTRA GAMING', 330, 4, 4, 949, 'e8ed82a3edc6bfe348e056db1eb592ef7f4442bb.jpg'),
(16, 'ASUS KO NVIDIA GeForce RTX 3070 V2 8GB', 440, 3, 4, 819, 'f16f0c0c3b7314f0023be90a2de47870ed67d08f.jpg'),
(17, 'GIGABYTE Gaming GeForce RTX 3070 Ti 8GB', 410, 6, 6, 889, '2bc1fc6d953a18a5fd55f09bba78acce5ce096fc.jpg'),
(18, 'GIGABYTE AORUS Radeon RX 6900 XT ', 490, 6, 3, 1917, 'be5bde26ceef61fbd5677431eb710eabad2da0f9.jpg'),
(19, 'GIGABYTE AORUS Radeon RX 6900 XT 16GB', 390, 6, 9, 2899, 'd8b8e074a05c2d79a1df5b8da61fc4ae9ef9abe3.jpg'),
(20, 'GIGABYTE AORUS GeForce RTX 3060 ELITE 12GB GDDR6 ', 400, 6, 4, 609, 'dbac5277b3c5233438df94ca79930aedf74ad3b4.jpg'),
(21, 'GIGABYTE Eagle OC GeForce RTX 3060 Ti 8GB', 290, 6, 2, 629, '8fa70fc5cf32323af170567e02dddf3976d013f0.jpg'),
(22, 'GIGABYTE Gaming GeForce RTX 3090 Ti 24GB', 520, 6, 3, 2799, 'a1b98ad305f2abe9247222e5c28d8f029265754d.jpg'),
(23, 'ZOTAC GAMING GeForce RTX 3090 Ti AMP Extreme Holo 24GB ', 530, 9, 4, 2679, '1b88970afebfd2a90f89d9520bbd392124461936.jpg'),
(24, 'AMD RX460 128-Bit 4GB GDDR5 Graphic Card DirectX12', 280, 2, 1, 299, 'bee2c3a4f69136fc0fdf96de14580f3dce8c7ab3.jpg'),
(26, 'ASUS Phoenix NVIDIA GeForce GTX 1650 OC Edition', 200, 3, 5, 289, 'c8853b2318edd9cf56b55f699f767bd3fa45ad91.jpg'),
(27, 'GIGABYTE GeForce RTX 3060 Eagle OC 12G', 400, 6, 4, 631, '8889b95856d2d1a0ef78d0b56a6a0c82e9ac8840.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

CREATE TABLE `laptop` (
  `lap_id` int(11) NOT NULL,
  `lap_name` varchar(128) DEFAULT NULL,
  `lap_cpu_id` int(11) DEFAULT NULL,
  `lap_ram_id` int(11) DEFAULT NULL,
  `lap_storage_id` int(11) DEFAULT NULL,
  `lap_gpu_id` int(11) DEFAULT NULL,
  `lap_com_id` int(11) DEFAULT NULL,
  `lap_amount` int(11) NOT NULL,
  `lap_prix` int(11) NOT NULL,
  `lap_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `mbo_id` int(11) NOT NULL,
  `mbo_name` varchar(128) NOT NULL,
  `mbo_type` int(11) NOT NULL,
  `mbo_company` int(11) NOT NULL,
  `mbo_amount` int(11) NOT NULL,
  `mbo_prix` int(11) NOT NULL,
  `mbo_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`mbo_id`, `mbo_name`, `mbo_type`, `mbo_company`, `mbo_amount`, `mbo_prix`, `mbo_path`) VALUES
(2, 'ASRock B550 Phantom Gaming-ITX/ax ', 3, 8, 3, 269, '32fb44a9be058cfd4b6df62bfc174175ce4026d5.jpg'),
(3, 'ASRock B550 STEEL LEGEND AM4 ', 1, 8, 5, 240, '5d09b780ad17f6072b14a00adf68853ee3221f29.jpg'),
(4, 'ASRock B550M PRO4 AM4 AMD', 1, 8, 3, 149, 'd0974bfb208bbe404b43ba116ec773811b8422a4.jpg'),
(5, 'SUS TUF GAMING Z590-PLUS LGA 1200', 1, 3, 4, 300, '4470a8a4d30feca9574e588680b8b66520863496.jpg'),
(6, 'Asus ROG Strix Z590-A Gaming WiFi II LGA 1200', 1, 3, 7, 350, 'baed70b4270e4dd042ac7b5c7eff916c4590a066.jpg'),
(7, 'ASUS ROG Strix Z590-E Gaming WiFi 6E LGA 1200', 1, 3, 5, 239, 'c0bf8409aa888b5be5fc83c6fd7b4e2e6b47bd56.jpg'),
(8, 'ASUS Z590 WIFI GUNDAM EDITION LGA 1200', 1, 3, 1, 389, '693ac008ca6962568e043d9406cc717e60cb988d.jpg'),
(9, 'ASUS PRIME Z590-P LGA 1200', 1, 3, 9, 224, '890a51d9297f8cfe91a81b57b00608294d9fab9b.jpg'),
(10, 'ASUS Prime Z690-P D4 LGA 1700', 1, 3, 5, 270, '45a6718791ee8348a87f4b1343f76a3895c8b919.jpg'),
(11, 'ASUS ROG Maximus Z690 Formula (WiFi 6E) LGA1700', 1, 3, 3, 989, 'cd7b2cb1ebe4fc6489e978b031f2a6d7f9e3e409.jpg'),
(12, 'ASUS TUF Gaming Z690-Plus WiFi D4 LGA 1700', 1, 3, 6, 349, '7ff7219fe6ec39417659cc6d2306c6cd6113e81c.jpg'),
(13, 'ASUS PRIME B560M-A LGA 1200 ', 1, 3, 12, 139, '3dfe9ad2ca40f46445356c07a743eda3a9ad99df.jpg'),
(14, 'ASUS PRIME H510M-E LGA 1200', 1, 3, 15, 125, 'ee170fada8d632d3b642b25aee63aba68f1e8347.jpg'),
(15, 'MSI MPG Z590 GAMING EDGE WIFI LGA 1200', 1, 5, 5, 299, '411b502b5ca0af9397edcb951066264e1882e95b.jpg'),
(16, 'MSI MPG Z590 GAMING PLUS LGA 1200', 1, 5, 3, 395, '899a70485bd355502b5e017f1e561bed4c34e682.jpg'),
(17, 'MSI Z590-A PRO LGA 1200 Intel', 1, 5, 7, 199, '1201ba2e5bfd9a066851c52816a818fc65cfe9d4.jpg'),
(18, 'MSI MAG Z590 TOMAHAWK WIFI LGA 1200', 1, 5, 5, 259, 'b13e0a8a3250d2b00ea5ac58237337a21c515932.jpg'),
(19, 'MSI MEG Z590I UNIFY LGA 1200', 3, 5, 7, 479, '5fdf43cf9c9b371507c563945c968915dfc5368c.jpg'),
(20, 'GIGABYTE Z590 AORUS ELITE AX LGA 1200', 1, 6, 2, 329, 'fc30492b1bf6ecb1abcfd2786767438e84f31fd6.jpg'),
(21, 'GIGABYTE Z590 AORUS ULTRA LGA 1200', 1, 6, 4, 409, '292d028ee5ba98f8f4612de436caa70171e20540.jpg'),
(22, 'GIGABYTE Z590 VISION G LGA 1200', 1, 6, 1, 209, '272b8a598d722541fa366fffde040e069a0d72e5.jpg'),
(23, 'GIGABYTE Z590 UD AC LGA 1200 ', 1, 6, 5, 168, '4f5f691fe8d83b64b7473411bb8c7c3b699b904f.jpg'),
(24, 'GIGABYTE Z590 AORUS XTREME WATERFORCE', 1, 6, 1, 1896, '635d34ae3c039be2042f0ee7b636b4e4e4c287fb.jpg'),
(25, 'GIGABYTE Z490 AORUS MASTER LGA 1200', 1, 6, 0, 1289, '22bffc2c12b8604c1349269182697fa84ff0f835.jpg'),
(26, 'eqwe', 5, 47, 2, 222, '700693bd71f75e0d8017089afe681dde1c920d36.png');

-- --------------------------------------------------------

--
-- Table structure for table `pc_case`
--

CREATE TABLE `pc_case` (
  `pca_id` int(11) NOT NULL,
  `pca_name` varchar(128) NOT NULL,
  `pca_type_mb_id` int(11) DEFAULT NULL,
  `pca_company` int(11) NOT NULL,
  `pca_amount` int(11) NOT NULL,
  `pca_prix` int(11) NOT NULL,
  `pca_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pc_case`
--

INSERT INTO `pc_case` (`pca_id`, `pca_name`, `pca_type_mb_id`, `pca_company`, `pca_amount`, `pca_prix`, `pca_path`) VALUES
(3, 'Rosewill SPECTRA D100 ATX Mid-Tower Gaming', 1, 27, 2, 109, 'd227ee8b52fc6d5238e8398ecffb84b90c784397.jpg'),
(4, 'DIYPC D480-W-RGB White Dual USB 3.0 ATX Mid Tower', 1, 36, 1, 99, '8b9a8294cd6975cb43096ec201b9827b9258df28.jpg'),
(5, 'Apexgaming Savitar S600PT Black Steel ', 1, 37, 3, 89, 'e652aea8e7ade2c5a452a5c238389f990e9750d6.jpg'),
(6, 'AZZA ECLIPSE 440 CSAZ-440 Black Steel', 1, 38, 1, 70, 'e011be9071968ad06d8fb29ece3de322ed471945.jpg'),
(7, 'Cooler Master HAF 500 H500-KGNN-S00 Black Steel', 1, 23, 4, 249, '1cdbb93ed09938bbf6ae4d33a5ffccdec1c99e05.jpg'),
(8, 'MSI MPG GUNGNIR 110M Black Steel', 1, 5, 1, 139, 'afb2da0526f2cad86537ed5936eb721189e89ceb.jpg'),
(9, 'Corsair Crystal iCUE 465X RGB', 1, 11, 4, 214, '583311308a98b58f741994a4c8c62967df2954d2.jpg'),
(10, 'Corsair Carbide Series 110R', 1, 11, 3, 104, 'd8a306f01b27566795369faf3d9e9fe974c48038.jpg'),
(11, 'Corsair iCUE 4000X RGB', 1, 11, 3, 185, 'ae792960b7d22dfb1f0e3d8faccd7938358f653d.jpg'),
(12, 'COUGAR MX330-G Air Black Steel - Tempered Glass', 1, 39, 1, 89, '358aceb353c75b2387cb7223571d12b60f5e7add.jpg'),
(13, 'GAMEMAX Brufen C3 BW Black Steel / Tempered Glass ATX', 1, 40, 2, 109, '1e18da688811ce6331bcac409712e46273a6ef42.jpg'),
(14, 'SAMA SAMA-M3-ARGB Black Steel - Tempered Glass ATX', 1, 41, 3, 80, 'c33972bc0eec05b7083d188cff02ab1256496887.jpg'),
(15, 'Antec Dark League DF700 FLUX, Mid Tower ATX Gaming Case', 1, 42, 1, 163, 'd6dff7b29e6d39ddb2752f1a2dccba26564012bf.jpg'),
(16, 'Antec Dark League DF600 FLUX, Mid-Tower ATX Gaming Case', 1, 42, 5, 129, 'a178cbb925153c11818688aafb116e4e371e8f2f.jpg'),
(17, 'Rosewill CHALLENGER ATX Mid-Tower Gaming PC', 1, 27, 2, 79, 'b7b853f0257ea9dcf6e49e0978cb269dcaf0e7e4.jpg'),
(18, 'Rosewill ATX Mid Tower Gaming Computer Case', 1, 27, 1, 79, '1583ce660b6d06ea5d012bcaa8d1efb2f203e0b2.jpg'),
(19, 'Fractal Design Meshify C Black ATX High-Airflow Compact', 1, 33, 2, 125, '0c7c9a88f629c67b0ab94bcd716f7811b5c43064.jpg'),
(20, 'Fractal Design Meshify C Black ATX High-Airflow Compact', 1, 33, 3, 129, '0f1c4e7395057e55eaa10b8c345c154d9945d170.jpg'),
(21, 'ASUS TUF Gaming GT301 Mid-Tower Compact Case for ATX', 1, 3, 6, 139, 'dbccaddfcb16662e4d90a343ef05dd21292b6260.jpg'),
(22, 'NZXT H210i - Mini-ITX PC Gaming Case - Front I/O', 1, 43, 5, 105, '0570d86deb5855bf95eeced0973140c092a295fc.jpg'),
(23, 'NZXT H210i - Mini-ITX PC Gaming Case', 1, 43, 4, 104, 'e953da40bb47020f8097361170d571b2eec3ba29.jpg'),
(24, 'RAIJINTEK OPHION, a SFF Case (Mini-TX)', 4, 44, 4, 79, '8c1496b5c79cfbde294761fb832d51a929d808e7.jpg'),
(25, 'Thermaltake Tower 100 Black Edition Tempered Glass', 1, 29, 1, 309, '97e10b82bf5c15cf548859f2936c4f1d511a8c90.jpg'),
(26, 'Silverstone fara b1 pro, argb lighting, tempered glass', 1, 34, 2, 109, 'de28d5c7bdbdb540de413aed657fcbbcc13b9c5b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `psu`
--

CREATE TABLE `psu` (
  `psu_id` int(11) NOT NULL,
  `psu_name` varchar(128) NOT NULL,
  `psu_watt` int(11) NOT NULL,
  `psu_company` int(11) NOT NULL,
  `psu_type` int(11) NOT NULL,
  `psu_amount` int(11) NOT NULL,
  `psu_prix` int(11) NOT NULL,
  `psu_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `psu`
--

INSERT INTO `psu` (`psu_id`, `psu_name`, `psu_watt`, `psu_company`, `psu_type`, `psu_amount`, `psu_prix`, `psu_path`) VALUES
(4, 'EVGA SuperNOVA 750 GM 80 PLUS Gold', 750, 4, 3, 4, 219, 'dbc23ab2a55917dc6a95107b2c2f4760b357a51e.jpg'),
(5, ' CORSAIR HX Series HX850 80 PLUS PLATINUM', 850, 4, 1, 1, 204, '2262a40128cdad7794be77045d246c8c73f72a69.jpg'),
(6, 'ASUS ROG Thor 850 80+ Platinum 850W Fully Modular RGB', 850, 3, 1, 6, 299, '372b0340af8cf995ea1ebf8b3c7366849de27add.jpg'),
(7, 'MSI MPG WHITE 750 W ATX12V 80 PLUS GOLD', 750, 5, 1, 1, 129, '66d0cd5bb2e90bb8973e9f14a799933881426281.jpg'),
(8, ' MSI MPG A750GF 750 W ATX 80 PLUS GOLD Certified', 750, 5, 1, 1, 169, 'eba5fdf3e43b439226dc65429f5daa0a82dd4806.jpg'),
(9, 'GIGABYTE 750GM 750 W ATX 12V v2.31 80 PLUS GOLD', 750, 6, 1, 3, 179, 'b8d3bc98dbd07a3bcead9e44636fe87033a23986.jpg'),
(10, 'Rosewill CFZ Series, CFZ750, 750W Semi-Modular', 750, 27, 1, 3, 109, '5729d3d53d3b2b2845d550c0dcc53c90ff7fdb65.jpg'),
(11, 'DeepCool DQ650-M-V2L 650W ATX12V ', 650, 28, 1, 2, 95, '195709daa201bb27b655a3f6b5b5eb8d677cea52.jpg'),
(12, 'Rosewill PHOTON Series, PHOTON-550 550W', 650, 27, 1, 9, 69, 'a3817fbe2f3fa2f440d55321720f0c87f8d45785.jpg'),
(14, 'EVGA SuperNOVA 650 GA, 80 Plus Gold 650W', 650, 4, 1, 3, 179, 'fa858fbc900237d7cd52beba5e613d50f77ce85c.jpg'),
(15, 'EVGA SuperNOVA 1000 GT, 80 Plus Gold 1000W', 1000, 4, 1, 4, 254, 'f0bc01693d228a0c90674767596d3e2227d0e29b.jpg'),
(16, 'EVGA SuperNOVA P3 220-P3-1000-X1 1000 W', 1000, 4, 1, 1, 349, '8053f21e29f4cfeef3a8399238738acf0c69e16c.jpg'),
(17, 'Fractal Design Ion+ 2 Platinum 860 W ATX12V', 860, 33, 1, 1, 219, 'e215ec6a1d507a6b1ee5d21993b3c58247a754a2.jpg'),
(18, 'ENERMAX Platimax D.F. Series EPF1050EWT 1050 W', 1050, 24, 1, 2, 399, '190d6f7b3544e5323f28ee93f9c1e73c06946d2a.jpg'),
(19, 'SilverStone Strider Platinum series SST-ST1200-PTS', 1200, 34, 1, 1, 360, 'c334d90ecad8ff36794dd527e93ce195dfd6d1ba.jpg'),
(20, 'GIGABYTE AORUS GP-AP1200PM 1200W ATX 12V', 1200, 6, 1, 1, 550, 'a11d5c9ef52c44a469eb88de1b950a6e29da8005.jpg'),
(21, 'Gamdias Kratos M1-750B 750W ATX12V', 750, 35, 1, 3, 109, '6a7a954f2b1570b23979655973ed531d6e7e6f3d.jpg'),
(22, 'SilverStone SX750 Platinum SST-SX750', 750, 34, 1, 3, 179, '55aa2d1d6970652f8afaa60658337c00cb3f1526.jpg'),
(23, 'EVGA SuperNOVA 1300 P+ 220-PP-1300-X1', 1300, 4, 1, 12, 499, '74152b347434597e9476904a54f3dce07a1974a1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `ram_id` int(11) NOT NULL,
  `ram_name` varchar(128) NOT NULL,
  `ram_type_ram_id` int(11) DEFAULT NULL,
  `ram_speed` int(11) NOT NULL,
  `ram_company` int(11) NOT NULL,
  `ram_amount` int(11) NOT NULL,
  `ram_prix` int(11) NOT NULL,
  `ram_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`ram_id`, `ram_name`, `ram_type_ram_id`, `ram_speed`, `ram_company`, `ram_amount`, `ram_prix`, `ram_path`) VALUES
(4, 'CORSAIR Vengeance RGB Pro 32GB (2 x 16GB) DDR4 3600', 1, 3600, 11, 3, 164, '512c9136126fa8d548982f6abed3270739166343.jpg'),
(5, 'G.SKILL Trident Z Neo (For AMD Ryzen) Series 32GB (2 x 16GB)', 1, 3600, 12, 4, 219, '435f03b5e83cdd5814120f13b01c3108799a0a58.jpg'),
(6, 'G.SKILL Trident Z Royal Series 32GB (2 x 16GB)', 1, 3200, 12, 2, 209, '26946603a5d80c3176b1711f34a511e4335f5f7d.jpg'),
(7, 'G.SKILL Trident Z Royal Series 32GB (2 x 16GB)', 1, 3200, 12, 1, 208, 'eaca63f1b61f91c2dc889678916fb5caacb262de.jpg'),
(8, 'Team T-Force XTREEM ARGB 32GB (2 x 16GB)', 1, 3200, 13, 8, 190, 'a64868121701b8d7983cad706d1368a727a6045a.jpg'),
(9, 'G.SKILL TridentZ Series 16GB (2 x 8GB)', 1, 3200, 12, 5, 97, '00ef58b6da04f6980aa301e14ceb3bbb34d7e49c.jpg'),
(10, 'G.SKILL TridentZ Series 16GB (2 x 8GB)', 1, 3200, 13, 4, 85, '01970a459e84333f01cb965d10acd00910785057.jpg'),
(11, 'Team T-FORCE VULCAN Z 16GB (2 x 8GB)', 1, 3200, 13, 9, 83, '7fe0d73bc05e144623dd512fbab61f28562e47a2.jpg'),
(12, 'Team T-Force Delta TUF Gaming Alliance RGB', 1, 3200, 13, 7, 105, '327aad89cdee1b60bf0aa726a92c9b5687aac6d8.jpg'),
(13, 'CORSAIR Dominator Platinum RGB 16GB (2 x 8GB)', 1, 3200, 11, 3, 149, '3cd013498010c5e7807143896b6df49d7b328b2d.jpg'),
(14, 'Kingston FURY Renegade RGB 16GB (2 x 8GB)', 1, 3200, 14, 2, 142, '32a9f9830065dc3cccd0a395148f7be9fa607d9b.jpg'),
(15, 'GeIL ORION 16GB (2 x 8GB) 288-Pin PC RAM', 1, 3200, 15, 3, 87, '6b451b28a3604c62e5ef84cde0606ba323728313.jpg'),
(16, 'Team T-FORCE VULCAN Z 16GB (2 x 8GB) ', 1, 3200, 13, 1, 82, 'c3dd9b27ab4264742ebae0c0c78eab5a77b02bea.jpg'),
(17, 'Team T-FORCE VULCAN TUF Gaming Alliance', 1, 3200, 13, 0, 79, '669cdd457c4f5ace6fb2e1c75f0921a4eb7109b0.jpg'),
(18, 'CORSAIR Vengeance LPX 16GB (2 x 8GB)', 1, 3200, 11, 14, 102, '9d80a7ce31a9948c73fbd650a3884b3eab691368.jpg'),
(19, 'Patriot Viper Steel 16GB (2 x 8GB)', 1, 3200, 16, 9, 92, 'a7c246ea9361bbde5ace5eae00db881f470e8ed6.jpg'),
(20, 'G.SKILL Ripjaws V Series 32GB (2 x 16GB)', 1, 3600, 12, 4, 129, '7c3ea42cdc4fd2a339c6a48492d416b63c36e07f.jpg'),
(21, 'G.SKILL Ripjaws V Series 128GB (8 x 16GB) ', 1, 3600, 12, 1, 1607, '5b3d5a4eaa8127b146da009a247332445cc6b11a.jpg'),
(22, 'GeIL ORION AMD Edition 32GB (2 x 16GB)', 1, 3600, 15, 2, 165, '632f350c21b10aa007333f62b61d3fc9db351eec.jpg'),
(23, 'CORSAIR Dominator Platinum RGB 64GB (4 x 16GB)', 1, 3600, 11, 1, 495, '83984629016cf3cccd69a070478037c8d2fecaae.jpg'),
(24, ' G.SKILL Trident Z Royal Elite Series 64GB (4 x 16GB) ', 1, 3600, 12, 3, 588, '0f1ab4e57e4cb58bdd51c5ac22bfd1781fe3941b.jpg'),
(25, 'Crucial 16GB 288-Pin PC RAM DDR4 3200', 1, 3200, 45, 6, 65, '56e2524a4ba6ccd1957565645a5cfbe4f1bcb341.jpg'),
(26, 'OLOy WarHawk RGB 16GB 288-Pin PC RAM DDR4 3200', 1, 3200, 46, 4, 88, '6d5a09ae72a348af2c4fb17a865dc87603331951.jpg'),
(27, 'Kingston FURY Beast 16GB 288-Pin PC RAM DDR4 3200', 1, 3200, 14, 3, 109, '09d809edb1af3ea64640ec280064aff4c12ba6aa.jpg'),
(29, 'Kingston HyperX Fury 16GB 288-Pin DDR4 SDRAM DDR4 3200', 1, 3200, 14, 2, 251, '9e82e588a4889c61bc4760cb18742673ca957a0d.jpg'),
(30, 'CORSAIR Vengeance LPX 16GB 288-Pin DDR4', 1, 166, 11, 1, 167, '391a9a6cdbca3e4da0157170f3d1a74e8f703728.jpg'),
(32, 'Patriot Signature Line 16GB 288-Pin PC RAM DDR4 3200', 1, 3200, 16, 5, 89, '8f85012a646b7d4bb64dff45c9f293741091d677.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `sto_id` int(11) NOT NULL,
  `sto_name` varchar(128) NOT NULL,
  `sto_capacity` int(11) NOT NULL,
  `sto_type_capacity` int(11) NOT NULL,
  `sto_type_storage_id` int(11) DEFAULT NULL,
  `sto_company` int(11) NOT NULL,
  `sto_amount` int(11) NOT NULL,
  `sto_prix` int(11) NOT NULL,
  `sto_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`sto_id`, `sto_name`, `sto_capacity`, `sto_type_capacity`, `sto_type_storage_id`, `sto_company`, `sto_amount`, `sto_prix`, `sto_path`) VALUES
(2, 'Western Digital WD BLACK SN850 NVMe M.2 2280 2TO', 2, 3, 1, 17, 3, 340, '62db04ed03b6d8acfc58c143f8bcb9c3902511e9.jpg'),
(3, 'PNY XLR8 CS3140 M.2 2280 2TB PCI-Express ', 2, 3, 4, 18, 3, 576, '302c141cbd1ea8fa9c41ec1447c239d387e757be.jpg'),
(4, 'SN750 NVMe M.2 2280 2TB PCI-Express 3.0', 2, 3, 1, 17, 2, 420, '7d66d44c717a6ffd6ce67930e8fed496c818c8f5.jpg'),
(5, 'Seagate IronWolf 12TB NAS Hard Drive 7200 RPM', 12, 3, 2, 19, 3, 299, '2944175c8e3191a72fa205af7137756ebd5d2357.jpg'),
(6, 'WD Purple WD82PURZ 8TB 7200 RPM', 8, 3, 2, 17, 1, 349, '9f1bce77b2bbdba69314ad674a6c8f3d8e7e456c.jpg'),
(7, 'PNY XLR8 CS3040 1TB M.2 NVMe Gen4 x4', 1, 3, 1, 18, 1, 204, '1476952fad589d57cb80d2488467ef61570d057e.jpg'),
(8, 'Reletech P400 1TB M.2 PCIe 2280', 1, 3, 1, 20, 7, 159, '1333ab44ae1b306009ffb45284788cdcbc815735.jpg'),
(9, 'Seagate BarraCuda Q5 M.2 2280 1TB', 1, 3, 4, 19, 3, 149, '9e5cfd15878ee17eb2c67cf6f2f432edeaef507d.jpg'),
(10, 'Corsair MP400 M.2 2280 1TB PCI-Express Gen', 1, 3, 4, 11, 3, 165, '069aa1f1e159615f9dc003dc06d502ee69edc4f4.jpg'),
(11, 'Corsair Force MP510 M.2 2280 4TB PCI-Express', 4, 3, 1, 11, 1, 855, 'a6bce17a1cf663098e58af2ea748e37799d7acc8.jpg'),
(12, 'GIGABYTE AORUS M.2 2280 512GB PCI-Express', 512, 2, 1, 6, 7, 158, 'b068939d5c573a01528e2082509325e562dc3ddf.jpg'),
(13, 'GIGABYTE M.2 2280 512GB PCI-Express', 512, 2, 1, 6, 9, 92, '29d376654dbd7e1d4a840cefa7a07f40ed3b59b7.jpg'),
(14, 'Silicon Power P34A60 M.2 2280 128GB', 128, 2, 1, 21, 3, 40, '6be0c032112867ef0a1762b1f260ac46d258d430.jpg'),
(15, 'Toshiba 16TB Enterprise HDD SATA 6.0Gb/s', 16, 3, 2, 22, 4, 400, 'e3677deb9f30f15292f6ce44d8b60d696c188121.jpg'),
(16, 'Seagate Exos 16TB Enterprise HDD X18', 16, 3, 2, 19, 6, 398, 'f004b223faee09cf8d962916de7024e59d1e6731.jpg'),
(17, 'WD Black 4TB Performance Desktop Hard Disk Drive', 4, 3, 2, 17, 5, 398, '90594eac612e184be35503a965870fe2f4cee8a8.jpg'),
(18, 'WD Gold 4TB Enterprise Class Hard Disk Drive', 4, 3, 2, 17, 4, 189, '8f5420bb6e7caeb42af20d6fdcf2436cee559c4b.jpg'),
(19, 'WD Gold 8TB Enterprise Class Hard Disk Drive', 8, 3, 2, 17, 6, 307, '49e922fbde146091c8932db65b65f1d5a8894fd8.jpg'),
(20, 'WD Blue 3TB Desktop Hard Disk Drive', 3, 3, 2, 19, 13, 190, '17a8b4afd0e1a832a7ff0e0bf8d678bd77a366a1.jpg'),
(21, 'Seagate FireCuda 530 M.2 2280 4TB PCIe Gen4', 4, 3, 5, 19, 3, 974, '9911b1e6e7c8c3b56001bbbfc4c5faa57c1f4cf1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationelle_gpu_lap`
--

CREATE TABLE `tbl_relationelle_gpu_lap` (
  `trgl_gpuId` int(11) NOT NULL,
  `trgl_pcId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationelle_gpu_tow`
--

CREATE TABLE `tbl_relationelle_gpu_tow` (
  `trgt_gpuId` int(11) NOT NULL,
  `trgt_pcId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationelle_storage_lap`
--

CREATE TABLE `tbl_relationelle_storage_lap` (
  `trsl_storageId` int(11) NOT NULL,
  `trsl_pcId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationelle_storage_tow`
--

CREATE TABLE `tbl_relationelle_storage_tow` (
  `trst_storageId` int(11) NOT NULL,
  `trst_pcId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationnelle_ram_lap`
--

CREATE TABLE `tbl_relationnelle_ram_lap` (
  `trrl_ram_id` int(11) NOT NULL,
  `trrl_tow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationnelle_ram_tow`
--

CREATE TABLE `tbl_relationnelle_ram_tow` (
  `trrt_ram_id` int(11) NOT NULL,
  `trrt_tow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tower`
--

CREATE TABLE `tower` (
  `tow_id` int(11) NOT NULL,
  `tow_name` varchar(128) DEFAULT NULL,
  `tow_cpu_id` int(11) DEFAULT NULL,
  `tow_ram_id` int(11) DEFAULT NULL,
  `tow_storage_id` int(11) DEFAULT NULL,
  `tow_case_id` int(11) DEFAULT NULL,
  `tow_mb_id` int(11) DEFAULT NULL,
  `tow_gpu_id` int(11) DEFAULT NULL,
  `tow_psu_id` int(11) DEFAULT NULL,
  `tow_cooling_id` int(11) DEFAULT NULL,
  `tow_com_id` int(11) DEFAULT NULL,
  `tow_amount` int(11) NOT NULL,
  `tow_prix` int(11) NOT NULL,
  `tow_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `type_capacity`
--

CREATE TABLE `type_capacity` (
  `tca_id` int(11) NOT NULL,
  `tca_type` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_capacity`
--

INSERT INTO `type_capacity` (`tca_id`, `tca_type`) VALUES
(1, 'MB'),
(2, 'GB'),
(3, 'TO');

-- --------------------------------------------------------

--
-- Table structure for table `type_cooler`
--

CREATE TABLE `type_cooler` (
  `tyc_id` int(11) NOT NULL,
  `tyc_type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_cooler`
--

INSERT INTO `type_cooler` (`tyc_id`, `tyc_type`) VALUES
(1, 0),
(2, 1),
(3, 0),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `type_cpu`
--

CREATE TABLE `type_cpu` (
  `tyc_id` int(11) NOT NULL,
  `tyc_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_cpu`
--

INSERT INTO `type_cpu` (`tyc_id`, `tyc_type`) VALUES
(1, '5'),
(2, '6'),
(3, '7'),
(4, '8'),
(5, '9'),
(6, '10'),
(7, '11'),
(8, '4'),
(9, '12');

-- --------------------------------------------------------

--
-- Table structure for table `type_motherboard`
--

CREATE TABLE `type_motherboard` (
  `tym_id` int(11) NOT NULL,
  `tym_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_motherboard`
--

INSERT INTO `type_motherboard` (`tym_id`, `tym_type`) VALUES
(1, 'ATX'),
(2, 'MICRO ATX'),
(3, 'ITX'),
(4, 'MINI-TX'),
(5, 'wqe');

-- --------------------------------------------------------

--
-- Table structure for table `type_psu`
--

CREATE TABLE `type_psu` (
  `typ_id` int(11) NOT NULL,
  `typ_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_psu`
--

INSERT INTO `type_psu` (`typ_id`, `typ_type`) VALUES
(1, 'ATX'),
(2, 'MICRO ATX'),
(3, 'SFX');

-- --------------------------------------------------------

--
-- Table structure for table `type_ram`
--

CREATE TABLE `type_ram` (
  `tyr_id` int(11) NOT NULL,
  `tyr_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_ram`
--

INSERT INTO `type_ram` (`tyr_id`, `tyr_type`) VALUES
(1, 'DDR4'),
(2, 'DDR5'),
(3, 'DDR3'),
(4, 'DDR2'),
(5, 'DDR1');

-- --------------------------------------------------------

--
-- Table structure for table `type_storage`
--

CREATE TABLE `type_storage` (
  `tys_id` int(11) NOT NULL,
  `tys_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_storage`
--

INSERT INTO `type_storage` (`tys_id`, `tys_type`) VALUES
(1, 'SSD'),
(2, 'HDD'),
(3, 'SSHD'),
(4, 'SSD NVME'),
(5, 'SSD NVME M.2');

-- --------------------------------------------------------

--
-- Structure for view `allpiece`
--
DROP TABLE IF EXISTS `allpiece`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allpiece`  AS SELECT 'cooling' AS `typePiece`, `cooling`.`coo_id` AS `id`, `cooling`.`coo_name` AS `nom`, `company`.`com_name` AS `company`, `cooling`.`coo_clock` AS `vitesseWatt`, `cooling`.`coo_watercooling` AS `type`, NULL AS `typeCapacity`, `cooling`.`coo_amount` AS `quantite`, `cooling`.`coo_prix` AS `prix`, `cooling`.`coo_path` AS `path` FROM (`cooling` join `company` on(`company`.`com_id` = `cooling`.`coo_company`)) union select 'cpu' AS `typePiece`,`cpu`.`cpu_id` AS `id`,`cpu`.`cpu_name` AS `nom`,`company`.`com_name` AS `company`,`cpu`.`cpu_speed` AS `vitesseWatt`,`type_cpu`.`tyc_type` AS `type`,NULL AS `typeCapacite`,`cpu`.`cpu_amount` AS `quantite`,`cpu`.`cpu_prix` AS `prix`,`cpu`.`cpu_path` AS `path` from ((`cpu` join `company` on(`company`.`com_id` = `cpu`.`cpu_company`)) join `type_cpu` on(`type_cpu`.`tyc_id` = `cpu`.`cpu_type`)) union select 'gpu' AS `typePiece`,`gpu`.`gpu_id` AS `id`,`gpu`.`gpu_name` AS `nom`,`company`.`com_name` AS `company`,`gpu`.`gpu_watt` AS `vitesseWatt`,NULL AS `type`,NULL AS `typeCapacite`,`gpu`.`gpu_amount` AS `quantite`,`gpu`.`gpu_prix` AS `prix`,`gpu`.`gpu_path` AS `path` from (`gpu` join `company` on(`company`.`com_id` = `gpu`.`gpu_company`)) union select 'motherboard' AS `typePiece`,`motherboard`.`mbo_id` AS `id`,`motherboard`.`mbo_name` AS `nom`,`company`.`com_name` AS `company`,NULL AS `vitesseWatt`,`type_motherboard`.`tym_type` AS `type`,NULL AS `typeCapacite`,`motherboard`.`mbo_amount` AS `quantite`,`motherboard`.`mbo_prix` AS `prix`,`motherboard`.`mbo_path` AS `path` from ((`motherboard` join `company` on(`company`.`com_id` = `motherboard`.`mbo_company`)) join `type_motherboard` on(`type_motherboard`.`tym_id` = `motherboard`.`mbo_type`)) union select 'pc_case' AS `typePiece`,`pc_case`.`pca_id` AS `id`,`pc_case`.`pca_name` AS `nom`,`company`.`com_name` AS `company`,NULL AS `vitesseWatt`,`type_motherboard`.`tym_type` AS `type`,NULL AS `typeCapacite`,`pc_case`.`pca_amount` AS `quantite`,`pc_case`.`pca_prix` AS `prix`,`pc_case`.`pca_path` AS `path` from ((`pc_case` join `company` on(`company`.`com_id` = `pc_case`.`pca_company`)) join `type_motherboard` on(`type_motherboard`.`tym_id` = `pc_case`.`pca_type_mb_id`)) union select 'psu' AS `typePiece`,`psu`.`psu_id` AS `id`,`psu`.`psu_name` AS `nom`,`company`.`com_name` AS `company`,`psu`.`psu_watt` AS `vitesseWatt`,`type_psu`.`typ_type` AS `type`,NULL AS `typeCapacite`,`psu`.`psu_amount` AS `quantite`,`psu`.`psu_prix` AS `prix`,`psu`.`psu_path` AS `path` from ((`psu` join `company` on(`company`.`com_id` = `psu`.`psu_company`)) join `type_psu` on(`type_psu`.`typ_id` = `psu`.`psu_type`)) union select 'ram' AS `typePiece`,`ram`.`ram_id` AS `id`,`ram`.`ram_name` AS `nom`,`company`.`com_name` AS `company`,`ram`.`ram_speed` AS `vitesseWatt`,`type_ram`.`tyr_type` AS `type`,NULL AS `typeCapacite`,`ram`.`ram_amount` AS `quantite`,`ram`.`ram_prix` AS `prix`,`ram`.`ram_path` AS `path` from ((`ram` join `company` on(`company`.`com_id` = `ram`.`ram_company`)) join `type_ram` on(`type_ram`.`tyr_id` = `ram`.`ram_type_ram_id`)) union select 'storage' AS `typePiece`,`storage`.`sto_id` AS `id`,`storage`.`sto_name` AS `nom`,`company`.`com_name` AS `company`,`storage`.`sto_capacity` AS `vitesseWatt`,`type_storage`.`tys_type` AS `type`,`type_capacity`.`tca_type` AS `typeCapacite`,`storage`.`sto_amount` AS `quantite`,`storage`.`sto_prix` AS `prix`,`storage`.`sto_path` AS `path` from (((`storage` join `company` on(`company`.`com_id` = `storage`.`sto_company`)) join `type_storage` on(`type_storage`.`tys_id` = `storage`.`sto_type_storage_id`)) join `type_capacity` on(`type_capacity`.`tca_id` = `storage`.`sto_type_capacity`))  ;

-- --------------------------------------------------------

--
-- Structure for view `allpieceinstock`
--
DROP TABLE IF EXISTS `allpieceinstock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allpieceinstock`  AS SELECT 'cooling' AS `typePiece`, `cooling`.`coo_id` AS `id`, `cooling`.`coo_name` AS `nom`, `company`.`com_name` AS `company`, `cooling`.`coo_clock` AS `vitesseWatt`, `cooling`.`coo_watercooling` AS `type`, NULL AS `typeCapacity`, `cooling`.`coo_amount` AS `quantite`, `cooling`.`coo_prix` AS `prix`, `cooling`.`coo_path` AS `path` FROM (`cooling` join `company` on(`company`.`com_id` = `cooling`.`coo_company`)) WHERE `cooling`.`coo_amount` > 0 union select 'cpu' AS `typePiece`,`cpu`.`cpu_id` AS `id`,`cpu`.`cpu_name` AS `nom`,`company`.`com_name` AS `company`,`cpu`.`cpu_speed` AS `vitesseWatt`,`type_cpu`.`tyc_type` AS `type`,NULL AS `typeCapacite`,`cpu`.`cpu_amount` AS `quantite`,`cpu`.`cpu_prix` AS `prix`,`cpu`.`cpu_path` AS `path` from ((`cpu` join `company` on(`company`.`com_id` = `cpu`.`cpu_company`)) join `type_cpu` on(`type_cpu`.`tyc_id` = `cpu`.`cpu_type`)) where `cpu`.`cpu_amount` > 0 union select 'gpu' AS `typePiece`,`gpu`.`gpu_id` AS `id`,`gpu`.`gpu_name` AS `nom`,`company`.`com_name` AS `company`,`gpu`.`gpu_watt` AS `vitesseWatt`,NULL AS `type`,NULL AS `typeCapacite`,`gpu`.`gpu_amount` AS `quantite`,`gpu`.`gpu_prix` AS `prix`,`gpu`.`gpu_path` AS `path` from (`gpu` join `company` on(`company`.`com_id` = `gpu`.`gpu_company`)) where `gpu`.`gpu_amount` > 0 union select 'motherboard' AS `typePiece`,`motherboard`.`mbo_id` AS `id`,`motherboard`.`mbo_name` AS `nom`,`company`.`com_name` AS `company`,NULL AS `vitesseWatt`,`type_motherboard`.`tym_type` AS `type`,NULL AS `typeCapacite`,`motherboard`.`mbo_amount` AS `quantite`,`motherboard`.`mbo_prix` AS `prix`,`motherboard`.`mbo_path` AS `path` from ((`motherboard` join `company` on(`company`.`com_id` = `motherboard`.`mbo_company`)) join `type_motherboard` on(`type_motherboard`.`tym_id` = `motherboard`.`mbo_type`)) where `motherboard`.`mbo_amount` > 0 union select 'pc_case' AS `typePiece`,`pc_case`.`pca_id` AS `id`,`pc_case`.`pca_name` AS `nom`,`company`.`com_name` AS `company`,NULL AS `vitesseWatt`,`type_motherboard`.`tym_type` AS `type`,NULL AS `typeCapacite`,`pc_case`.`pca_amount` AS `quantite`,`pc_case`.`pca_prix` AS `prix`,`pc_case`.`pca_path` AS `path` from ((`pc_case` join `company` on(`company`.`com_id` = `pc_case`.`pca_company`)) join `type_motherboard` on(`type_motherboard`.`tym_id` = `pc_case`.`pca_type_mb_id`)) where `pc_case`.`pca_amount` > 0 union select 'psu' AS `typePiece`,`psu`.`psu_id` AS `id`,`psu`.`psu_name` AS `nom`,`company`.`com_name` AS `company`,`psu`.`psu_watt` AS `vitesseWatt`,`type_psu`.`typ_type` AS `type`,NULL AS `typeCapacite`,`psu`.`psu_amount` AS `quantite`,`psu`.`psu_prix` AS `prix`,`psu`.`psu_path` AS `path` from ((`psu` join `company` on(`company`.`com_id` = `psu`.`psu_company`)) join `type_psu` on(`type_psu`.`typ_id` = `psu`.`psu_type`)) where `psu`.`psu_amount` > 0 union select 'ram' AS `typePiece`,`ram`.`ram_id` AS `id`,`ram`.`ram_name` AS `nom`,`company`.`com_name` AS `company`,`ram`.`ram_speed` AS `vitesseWatt`,`type_ram`.`tyr_type` AS `type`,NULL AS `typeCapacite`,`ram`.`ram_amount` AS `quantite`,`ram`.`ram_prix` AS `prix`,`ram`.`ram_path` AS `path` from ((`ram` join `company` on(`company`.`com_id` = `ram`.`ram_company`)) join `type_ram` on(`type_ram`.`tyr_id` = `ram`.`ram_type_ram_id`)) where `ram`.`ram_amount` > 0 union select 'storage' AS `typePiece`,`storage`.`sto_id` AS `id`,`storage`.`sto_name` AS `nom`,`company`.`com_name` AS `company`,`storage`.`sto_capacity` AS `vitesseWatt`,`type_storage`.`tys_type` AS `type`,`type_capacity`.`tca_type` AS `typeCapacite`,`storage`.`sto_amount` AS `quantite`,`storage`.`sto_prix` AS `prix`,`storage`.`sto_path` AS `path` from (((`storage` join `company` on(`company`.`com_id` = `storage`.`sto_company`)) join `type_storage` on(`type_storage`.`tys_id` = `storage`.`sto_type_storage_id`)) join `type_capacity` on(`type_capacity`.`tca_id` = `storage`.`sto_type_capacity`)) where `storage`.`sto_amount` > 0  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `cooling`
--
ALTER TABLE `cooling`
  ADD PRIMARY KEY (`coo_id`),
  ADD KEY `fk_com_coo` (`coo_company`),
  ADD KEY `fk_type_coo` (`coo_watercooling`);

--
-- Indexes for table `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`cpu_id`),
  ADD KEY `fk_cpu_company` (`cpu_company`),
  ADD KEY `fk_cpu_type` (`cpu_type`);

--
-- Indexes for table `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`gpu_id`),
  ADD KEY `fk_gpu_company` (`gpu_company`);

--
-- Indexes for table `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`lap_id`),
  ADD KEY `fk_cpu_lap` (`lap_cpu_id`),
  ADD KEY `fk_lap_company` (`lap_com_id`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`mbo_id`),
  ADD KEY `fk_mbo_type` (`mbo_type`),
  ADD KEY `fk_mbo_com` (`mbo_company`);

--
-- Indexes for table `pc_case`
--
ALTER TABLE `pc_case`
  ADD PRIMARY KEY (`pca_id`),
  ADD KEY `fk_type_mb` (`pca_type_mb_id`),
  ADD KEY `fk_pc_case_company` (`pca_company`);

--
-- Indexes for table `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`psu_id`),
  ADD KEY `fk_psu_company` (`psu_company`),
  ADD KEY `fk_psu_type` (`psu_type`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ram_id`),
  ADD KEY `fk_type_ram` (`ram_type_ram_id`),
  ADD KEY `fk_ram_company` (`ram_company`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`sto_id`),
  ADD KEY `fk_type_storage` (`sto_type_storage_id`),
  ADD KEY `fk_storage_company` (`sto_company`),
  ADD KEY `fk_type_capacity` (`sto_type_capacity`);

--
-- Indexes for table `tbl_relationelle_gpu_lap`
--
ALTER TABLE `tbl_relationelle_gpu_lap`
  ADD KEY `fk_lapGpu` (`trgl_gpuId`),
  ADD KEY `fk_lapId` (`trgl_pcId`);

--
-- Indexes for table `tbl_relationelle_gpu_tow`
--
ALTER TABLE `tbl_relationelle_gpu_tow`
  ADD KEY `fk_gpuId` (`trgt_gpuId`),
  ADD KEY `fk_pcId` (`trgt_pcId`);

--
-- Indexes for table `tbl_relationelle_storage_lap`
--
ALTER TABLE `tbl_relationelle_storage_lap`
  ADD KEY `fk_storageId` (`trsl_storageId`),
  ADD KEY `fk_lapSto` (`trsl_pcId`);

--
-- Indexes for table `tbl_relationelle_storage_tow`
--
ALTER TABLE `tbl_relationelle_storage_tow`
  ADD KEY `fk_storageId_tow` (`trst_storageId`),
  ADD KEY `fk_pcId_tow` (`trst_pcId`);

--
-- Indexes for table `tbl_relationnelle_ram_lap`
--
ALTER TABLE `tbl_relationnelle_ram_lap`
  ADD KEY `fk_ramId_lap` (`trrl_ram_id`),
  ADD KEY `fk_TowId_lap` (`trrl_tow_id`);

--
-- Indexes for table `tbl_relationnelle_ram_tow`
--
ALTER TABLE `tbl_relationnelle_ram_tow`
  ADD KEY `fk_ramId` (`trrt_ram_id`),
  ADD KEY `fk_TowId` (`trrt_tow_id`);

--
-- Indexes for table `tower`
--
ALTER TABLE `tower`
  ADD PRIMARY KEY (`tow_id`),
  ADD KEY `fk_cpu` (`tow_cpu_id`),
  ADD KEY `fk_case` (`tow_case_id`),
  ADD KEY `fk_mb` (`tow_mb_id`),
  ADD KEY `fk_psu` (`tow_psu_id`),
  ADD KEY `fk_coo` (`tow_cooling_id`),
  ADD KEY `fk_tow_company` (`tow_com_id`);

--
-- Indexes for table `type_capacity`
--
ALTER TABLE `type_capacity`
  ADD PRIMARY KEY (`tca_id`);

--
-- Indexes for table `type_cooler`
--
ALTER TABLE `type_cooler`
  ADD PRIMARY KEY (`tyc_id`);

--
-- Indexes for table `type_cpu`
--
ALTER TABLE `type_cpu`
  ADD PRIMARY KEY (`tyc_id`);

--
-- Indexes for table `type_motherboard`
--
ALTER TABLE `type_motherboard`
  ADD PRIMARY KEY (`tym_id`);

--
-- Indexes for table `type_psu`
--
ALTER TABLE `type_psu`
  ADD PRIMARY KEY (`typ_id`);

--
-- Indexes for table `type_ram`
--
ALTER TABLE `type_ram`
  ADD PRIMARY KEY (`tyr_id`);

--
-- Indexes for table `type_storage`
--
ALTER TABLE `type_storage`
  ADD PRIMARY KEY (`tys_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `cooling`
--
ALTER TABLE `cooling`
  MODIFY `coo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cpu`
--
ALTER TABLE `cpu`
  MODIFY `cpu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gpu`
--
ALTER TABLE `gpu`
  MODIFY `gpu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `laptop`
--
ALTER TABLE `laptop`
  MODIFY `lap_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `mbo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pc_case`
--
ALTER TABLE `pc_case`
  MODIFY `pca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `psu`
--
ALTER TABLE `psu`
  MODIFY `psu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `ram_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `sto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tower`
--
ALTER TABLE `tower`
  MODIFY `tow_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_capacity`
--
ALTER TABLE `type_capacity`
  MODIFY `tca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type_cooler`
--
ALTER TABLE `type_cooler`
  MODIFY `tyc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_cpu`
--
ALTER TABLE `type_cpu`
  MODIFY `tyc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `type_motherboard`
--
ALTER TABLE `type_motherboard`
  MODIFY `tym_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type_psu`
--
ALTER TABLE `type_psu`
  MODIFY `typ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type_ram`
--
ALTER TABLE `type_ram`
  MODIFY `tyr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type_storage`
--
ALTER TABLE `type_storage`
  MODIFY `tys_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cooling`
--
ALTER TABLE `cooling`
  ADD CONSTRAINT `fk_com_coo` FOREIGN KEY (`coo_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_type_coo` FOREIGN KEY (`coo_watercooling`) REFERENCES `type_cooler` (`tyc_id`);

--
-- Constraints for table `cpu`
--
ALTER TABLE `cpu`
  ADD CONSTRAINT `fk_cpu_company` FOREIGN KEY (`cpu_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_cpu_type` FOREIGN KEY (`cpu_type`) REFERENCES `type_cpu` (`tyc_id`);

--
-- Constraints for table `gpu`
--
ALTER TABLE `gpu`
  ADD CONSTRAINT `fk_gpu_company` FOREIGN KEY (`gpu_company`) REFERENCES `company` (`com_id`);

--
-- Constraints for table `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `fk_cpu_lap` FOREIGN KEY (`lap_cpu_id`) REFERENCES `cpu` (`cpu_id`),
  ADD CONSTRAINT `fk_lap_company` FOREIGN KEY (`lap_com_id`) REFERENCES `company` (`com_id`);

--
-- Constraints for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD CONSTRAINT `fk_mbo_com` FOREIGN KEY (`mbo_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_mbo_type` FOREIGN KEY (`mbo_type`) REFERENCES `type_motherboard` (`tym_id`);

--
-- Constraints for table `pc_case`
--
ALTER TABLE `pc_case`
  ADD CONSTRAINT `fk_pc_case_company` FOREIGN KEY (`pca_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_type_mb` FOREIGN KEY (`pca_type_mb_id`) REFERENCES `type_motherboard` (`tym_id`);

--
-- Constraints for table `psu`
--
ALTER TABLE `psu`
  ADD CONSTRAINT `fk_psu_company` FOREIGN KEY (`psu_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_psu_type` FOREIGN KEY (`psu_type`) REFERENCES `type_psu` (`typ_id`);

--
-- Constraints for table `ram`
--
ALTER TABLE `ram`
  ADD CONSTRAINT `fk_ram_company` FOREIGN KEY (`ram_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_type_ram` FOREIGN KEY (`ram_type_ram_id`) REFERENCES `type_ram` (`tyr_id`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `fk_storage_company` FOREIGN KEY (`sto_company`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `fk_type_capacity` FOREIGN KEY (`sto_type_capacity`) REFERENCES `type_capacity` (`tca_id`),
  ADD CONSTRAINT `fk_type_storage` FOREIGN KEY (`sto_type_storage_id`) REFERENCES `type_storage` (`tys_id`);

--
-- Constraints for table `tbl_relationelle_gpu_lap`
--
ALTER TABLE `tbl_relationelle_gpu_lap`
  ADD CONSTRAINT `fk_lapGpu` FOREIGN KEY (`trgl_gpuId`) REFERENCES `gpu` (`gpu_id`),
  ADD CONSTRAINT `fk_lapId` FOREIGN KEY (`trgl_pcId`) REFERENCES `tower` (`tow_id`);

--
-- Constraints for table `tbl_relationelle_gpu_tow`
--
ALTER TABLE `tbl_relationelle_gpu_tow`
  ADD CONSTRAINT `fk_gpuId` FOREIGN KEY (`trgt_gpuId`) REFERENCES `gpu` (`gpu_id`),
  ADD CONSTRAINT `fk_pcId` FOREIGN KEY (`trgt_pcId`) REFERENCES `tower` (`tow_id`);

--
-- Constraints for table `tbl_relationelle_storage_lap`
--
ALTER TABLE `tbl_relationelle_storage_lap`
  ADD CONSTRAINT `fk_lapSto` FOREIGN KEY (`trsl_pcId`) REFERENCES `tower` (`tow_id`),
  ADD CONSTRAINT `fk_storageId` FOREIGN KEY (`trsl_storageId`) REFERENCES `storage` (`sto_id`);

--
-- Constraints for table `tbl_relationelle_storage_tow`
--
ALTER TABLE `tbl_relationelle_storage_tow`
  ADD CONSTRAINT `fk_pcId_tow` FOREIGN KEY (`trst_pcId`) REFERENCES `tower` (`tow_id`),
  ADD CONSTRAINT `fk_storageId_tow` FOREIGN KEY (`trst_storageId`) REFERENCES `storage` (`sto_id`);

--
-- Constraints for table `tbl_relationnelle_ram_lap`
--
ALTER TABLE `tbl_relationnelle_ram_lap`
  ADD CONSTRAINT `fk_TowId_lap` FOREIGN KEY (`trrl_tow_id`) REFERENCES `tower` (`tow_id`),
  ADD CONSTRAINT `fk_ramId_lap` FOREIGN KEY (`trrl_ram_id`) REFERENCES `ram` (`ram_id`);

--
-- Constraints for table `tbl_relationnelle_ram_tow`
--
ALTER TABLE `tbl_relationnelle_ram_tow`
  ADD CONSTRAINT `fk_TowId` FOREIGN KEY (`trrt_tow_id`) REFERENCES `tower` (`tow_id`),
  ADD CONSTRAINT `fk_ramId` FOREIGN KEY (`trrt_ram_id`) REFERENCES `ram` (`ram_id`);

--
-- Constraints for table `tower`
--
ALTER TABLE `tower`
  ADD CONSTRAINT `fk_case` FOREIGN KEY (`tow_case_id`) REFERENCES `pc_case` (`pca_id`),
  ADD CONSTRAINT `fk_coo` FOREIGN KEY (`tow_cooling_id`) REFERENCES `cooling` (`coo_id`),
  ADD CONSTRAINT `fk_cpu` FOREIGN KEY (`tow_cpu_id`) REFERENCES `cpu` (`cpu_id`),
  ADD CONSTRAINT `fk_mb` FOREIGN KEY (`tow_mb_id`) REFERENCES `motherboard` (`mbo_id`),
  ADD CONSTRAINT `fk_psu` FOREIGN KEY (`tow_psu_id`) REFERENCES `psu` (`psu_id`),
  ADD CONSTRAINT `fk_tow_company` FOREIGN KEY (`tow_com_id`) REFERENCES `company` (`com_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
