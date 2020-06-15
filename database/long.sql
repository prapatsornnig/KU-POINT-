-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2020 at 06:09 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `long`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `userlevel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `password`, `fname`, `lname`, `email`, `phone`, `userlevel`) VALUES
(1, 'testtest', '', 'asddd', 'asdas', 'qwer@gmail.com', '231469857', 'a'),
(2, 'qwer', 'qwer', 'qweqwe', 'qweqwe', 'qweqw@hotmail.com', '1236547899', 'm'),
(3, 'asdf', 'asdf', 'weqwe', 'wqeqwewqe', 'wqeqwvgv@hotmail.com', '2147483647', 'm'),
(4, 'zxcv', 'zxcv', 'weqwewq', 'wqewqeqweq', 'zxcv@hotmail.com', '325698741', 'm'),
(5, 'qazx', 'qazx', 'wqewewq', 'qweqweqwe', 'zxcvqweqw@hotmail.com', '215879634', 'm'),
(6, 'tyui', 'tyui', 'tyuiiii', 'iiiiiuyt', 'tyuiii@hotmail.com', '2147483647', 'm'),
(7, 'qwerrrqewr', 'qwerqwerqewrqew', 'qwewrqwerw', 'qwerqwerwqerwqer', 'asd@hotmail.com', '325698741', 'm'),
(8, 'qwertyuiop', 'qwertyuiop', 'qwertyuiop', 'poiuytrewq', 'asqwewqe@hotmail.com', '123456789', 'm'),
(9, 'asdfghj', 'asdfghj', 'asdfghj', 'asdfghj', 'asdfghj@hotmail.com', '123654789', 'm'),
(10, 'qwertyuiop3', 'qwertyuiop3', 'qwertyuiops', 'qwertyuiopaaa', 'qwertyuiop@gmail.com', '123456789', 'm'),
(11, 'warawut', 'warawut', 'วราวุทธิ์', 'สุขสันต์', 'warawut6@hotmail.com', '0805724698', 'm'),
(12, 'zxcvbn', 'zxcvbn', 'zxcvbn', 'zxcvbn', 'zxcvqweqw@hotmail.com', '0236985471', 'm'),
(15, 'hello', '123456', 'hello', 'hello', 'prapatosrn@hotmail.com', '0123456789', 'm'),
(24, 'prapatsorn', '123456', 'ประภัสสร', 'ชินนะ', 'prapatosrn@hotmail.com', '0934203438', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `postnews`
--

CREATE TABLE `postnews` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postnews`
--

INSERT INTO `postnews` (`id`, `title`, `category`, `detail`, `date`, `image`) VALUES
(3, 'รับสมัครนิสิตช่วยงาน', 'กิจกรรมมหาวิทยาลัย', 'รับสมัครนิสิตช่วยงานที่ถสานพยาบาล มีค่าแรงตอบแทน', '2020-03-26 18:29:42', ''),
(4, 'กีฬาสานสัมพันธ์', 'กิจกรรมคณะวิทยาศาสตร์ และวิศวกรรมศาสตร์', 'กีฬาสานสัมพันธ์ ของน้องๆคะณะ dxsfsdfsdfsdfsdfsdf', '2020-03-26 18:31:24', ''),
(5, 'โครงการเตรียมความพร้อมในการทำงานสำหรับนิสิตชั้นปีที่ 4 ประจำปีการศึกษา 2561', 'กิจกรรมมหาวิทยาลัย', 'โครงการเตรียมความพร้อมในการทำงานสำหรับนิสิตชั้นปีที่ 4 ประจำปีการศึกษา 2561 “การพัฒนาบุคลิกภาพสู้สากลและการเขียน RESUME เพื่อการสมัครงาน”\r\n\r\nรุ่นที่ 3-4 วันเสาร์ที่ 23 กุมภาพันธ์ 2562 เวลา 08.30 – 16.30 น.\r\n\r\nสำหรับนิสิตคณะ วว. และ ศว. นิสิตสหกิจศึกษา และนิสิตที่มีความสนใจ (นิสิตแต่งกายด้วยชุดนิสิตตามระเบียบเท่านั้น)\r\n\r\nณ ห้องประชุมระพีสาคริก อาคารเทคโนโลยีสารสนเทศ (อ.9) ชั้น 2\r\n\r\nมหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตเฺฉลิมพระเกียรติ จังหวัดสกลนคร', '2020-03-26 18:31:24', ''),
(6, 'โครงการอบรมภาษาต่างประเทศสำหรับ “นิสิต มก.ฉกส.”', 'กิจกรรมเพื่อเสริมสร้างสมรรถนะ', 'มาเรียน ภาษาญี่ปุ่น กันดีกว่าค่ะ\r\nสามารถสมัครเรียนได้ที่นี่ รับจำนวนจำกัดจ้า\r\nhttps://goo.gl/forms/yGijCNyJvBcHvisU2', '2020-03-27 05:48:59', ''),
(7, 'โครงการสอนน้องร้องเพลง', 'กิจกรรมคณะวิทยาศาสตร์ และวิศวกรรมศาสตร์', 'กิจกรรมสอนน้องร้องเพลงคณะ เพื่อนเสริมสร้างความสามัคคีให้แก่นิสิตคณะวิทยาศาสตร์ และวิศวกรรมศาสตร์', '2020-03-27 05:55:13', ''),
(8, 'งานแข่งขันกีฬามหาวิทยาลัย', 'กิจกรรมมหาวิทยาลัย', 'ขอเชิญชวนน้องๆคณะต่างๆ เข้าร่วมกิจกรรมกีฬาประจำมหาวิทยาลัย เป็นการแข่งขันระหว่างคณะ วว ทอ ศว และ สส', '2020-03-27 06:07:07', ''),
(9, 'ประชาสัมพันธ์รับสมัครนิสิตเข้าศึกษา', 'กิจกรรมมหาวิทยาลัย', 'วันจันทร์ที่ 9 มีนาคม คณะวิทยาศาสตร์และวิศวกรรมศาสตร์ นำเจลแอลกอฮอร์ไปแจกจ่าย พร้อมประชาสัมพันธ์การรับสมัครเรียนในหลักสูตรต่างๆของวิทยาเขต นอกจากนั้นยังมีการเล่นเกมส์รับรางวัลเยอะแยะมากมาย ณ ศูนย์อาหารชั้น 2 โรบินสันไลฟ์สไตล์สกลนคร ตั้งแต่เวลา เวลา 16.00 - 19.00 น.', '2020-03-27 06:07:07', ''),
(10, 'ประชาสัมพันธ์สอนทำเจลล้างมือ', 'กิจกรรมเพื่อสังคม', 'รับสมัครนิสิตที่สนใจเข้าร่วมอบรม และศึกษาวิธีการทำเจลล้างมือเพื่อป้องกันโควิด', '2020-03-27 06:07:07', ''),
(15, 'งานเกษตรแฟร์ นนทรีอีสาน ครั้งที่ 145', 'กิจกรรมมหาวิทยาลัย', 'เดินเล่น', '2020-04-08 16:13:40', 'glass.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '123456', 'sahabuddinriyaj984@gmail.com', 1, '2018-05-27 16:51:00', '2020-02-15 12:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Description` mediumtext CHARACTER SET utf8 NOT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Is_Active` varchar(1) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 'กิจกรรมเพื่อสังคม', '300 คะแนน', '2018-06-22 14:46:22', '2020-03-08 13:27:53', '1'),
(2, 'กิจกรรมเพื่อเสริมสร้างสมรรถนะ', '400 คะแนน', '2019-09-02 08:42:37', '2020-03-08 13:27:53', '1'),
(3, 'กิจกรรมมหาวิทยาลัย', '500 คะแนน', '2020-02-02 10:36:00', '2020-03-08 13:27:53', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext CHARACTER SET utf8 DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) NOT NULL,
  `PostUrl` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `PostImage` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(1, 'งานเกษตรแฟร์ นนทรีอีสาน ครั้งที่ 143', 3, 1, 'หนาวนี้ !!! เที่ยวชมงานเกษตรแฟร์นนทรีอีสาน ในวันที่ 20-26 ธันวาคม พ.ศ.2562 พบกับความบันเทิงการแสดงศิลปินการประกวดด้านศิลปะวัฒนธรรม การฝึกอบรมวิชาการ การประกวดด้านการเกษตร และสินค้าทางการเกษตรอีกมากมาย', '2019-12-02 07:20:22', '2020-03-08 13:30:03', 1, 'งานเกษตรแฟร์-นนทรีอีสาน-ครั้งที่-143', '5.jpg'),
(2, 'KU CSC RUN วิ่งป่าลั่นทุ่ง', 2, 2, 'โครงการเดิน-วิ่ง เพื่อสุขภาพ KU RUN ครั้งที่1 ชิงถ้วยพระราชทาน สมเด็จเจ้าฟ้าฯ กรมพระศรีสวางควัฒน วรขัตติยราชนารี สนามที่ 2 KU RUN วิ่งป่าลั่น สนั่นสกลนคร จัดโดย สมาคมสิตเก่ามหาวิทยาลัยเกษตรศาสตร์ ในพระบรมรมชูปถัมภ์ ร่วมกับ มหาวิทยาละยเกษตรศาสตร์ วัยอาทิตย์ที่ 12 มกราคม พ.ศ.2563 มหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตเฉลิมพระเกียรติ จังหวัดสกลนคร', '2020-02-02 10:36:00', '2020-03-08 13:29:47', 1, 'KU-CSC-RUN-วิ่งป่าลั่นทุ่ง', '6.jpg'),
(3, 'รับสมัครนิสิตช่วยงาน', 1, 6, 'รับสมัครนิสิตช่วยงานที่ถสานพยาบาล มีค่าแรงตอบแทน', '2020-02-02 11:59:57', '2020-03-08 13:29:19', 1, 'adsfasd', '7.jpg'),
(4, 'กีฬาสานสัมพันธ์', 2, 3, 'กีฬาสานสัมพันธ์ ของน้องๆคะณะ', '2020-02-02 13:51:54', '2020-03-12 11:51:10', 1, 'ertyui2582582', '6d08a26c92cf30db69197a1fb7230626.jpg'),
(10, 'โครงการเตรียมความพร้อมในการทำงานสำหรับนิสิตชั้นปีที่ 4 ประจำปีการศึกษา 2561 “การพัฒนาบุคลิกภาพสู้สากลและการเขียน RESUME เพื่อการสมัครงาน”', 3, 1, 'โครงการเตรียมความพร้อมในการทำงานสำหรับนิสิตชั้นปีที่ 4 ประจำปีการศึกษา 2561 “การพัฒนาบุคลิกภาพสู้สากลและการเขียน RESUME เพื่อการสมัครงาน”\r\n\r\nรุ่นที่ 3-4 วันเสาร์ที่ 23 กุมภาพันธ์ 2562 เวลา 08.30 – 16.30 น.\r\n\r\nสำหรับนิสิตคณะ วว. และ ศว. นิสิตสหกิจศึกษา และนิสิตที่มีความสนใจ (นิสิตแต่งกายด้วยชุดนิสิตตามระเบียบเท่านั้น)\r\n\r\nณ ห้องประชุมระพีสาคริก อาคารเทคโนโลยีสารสนเทศ (อ.9) ชั้น 2\r\n\r\nมหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตเฺฉลิมพระเกียรติ จังหวัดสกลนคร', '2020-03-11 14:19:44', NULL, 1, 'โครงการเตรียมความพร้อมในการทำงานสำหรับนิสิตชั้นปีที่-4-ประจำปีการศึกษา-2561-“การพัฒนาบุคลิกภาพสู้สากลและการเขียน-RESUME-เพื่อการสมัครงาน”', '050df54c48594fb9368428753453f8c1.jpg'),
(11, 'โครงการอบรมภาษาต่างประเทศสำหรับ “นิสิต มก.ฉกส.”', 3, 1, 'มาเรียน ภาษาญี่ปุ่น กันดีกว่าค่ะ\r\nสามารถสมัครเรียนได้ที่นี่ รับจำนวนจำกัดจ้า\r\nhttps://goo.gl/forms/yGijCNyJvBcHvisU2', '2020-03-11 14:50:58', NULL, 1, 'โครงการอบรมภาษาต่างประเทศสำหรับ-“นิสิต-มก.ฉกส.”', 'ddbac6792a98673cf32000e4509a6361.jpg'),
(12, 'qewrqwerqwe', 3, 1, 'qwerqwerweqr', '2020-03-23 16:19:00', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Subcategory` varchar(255) CHARACTER SET utf8 NOT NULL,
  `SubCatDescription` mediumtext CHARACTER SET utf8 NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Is_Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 3, 'กิจกรรมมหาวิทยาลัย', 'กิจกรรมมหาวิทยาลัย', '2020-02-02 10:36:00', '2020-03-08 13:28:41', 1),
(2, 2, 'ด้านพัฒนาสุขภาพ', 'ด้านพัฒนาสุขภาพ', '2018-06-30 18:04:29', '2020-03-08 13:28:34', 1),
(3, 2, 'ด้านพัฒนาทักษะเสริมสร้างความสัมพันธ์ระหว่างบุคคลและการสื่อสาร', 'ด้านพัฒนาทักษะเสริมสร้างความสัมพันธ์ระหว่างบุคคลและการสื่อสาร', '2018-06-30 18:04:43', '2020-03-08 13:28:34', 1),
(4, 2, 'ด้านพัฒนาทักษะการคิดและการเรียนรู้', 'ด้านพัฒนาทักษะการคิดและการเรียนรู้', '2018-06-30 18:08:42', '2020-03-08 13:28:35', 1),
(5, 2, 'ด้านพัฒนาคุณธรรม จริยธรรม', 'ด้านพัฒนาคุณธรรม จริยธรรม', '2019-09-02 08:43:02', '2020-03-08 13:28:35', 1),
(6, 1, 'กิจกรรมเพื่อสังคม', 'กิจกรรมเพื่อสังคม', '2018-06-30 17:59:22', '2020-03-08 13:28:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_provinces`
--

CREATE TABLE `tbl_provinces` (
  `province_id` int(5) NOT NULL,
  `province_code` varchar(2) NOT NULL,
  `province_name` varchar(150) NOT NULL,
  `province_name_eng` varchar(150) NOT NULL,
  `geo_id` int(5) NOT NULL DEFAULT 0,
  `last_update` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_provinces`
--

INSERT INTO `tbl_provinces` (`province_id`, `province_code`, `province_name`, `province_name_eng`, `geo_id`, `last_update`) VALUES
(1, '10', 'กรุงเทพมหานคร', 'Bangkok', 2, '2018-09-19 12:11:03'),
(2, '11', 'สมุทรปราการ', 'Samut Prakan', 2, '2018-09-19 12:11:03'),
(3, '12', 'นนทบุรี', 'Nonthaburi', 2, '2018-09-19 12:11:03'),
(4, '13', 'ปทุมธานี', 'Pathum Thani', 2, '2018-09-19 12:11:03'),
(5, '14', 'พระนครศรีอยุธยา', 'Phra Nakhon Si Ayutthaya', 2, '2018-09-19 12:11:03'),
(6, '15', 'อ่างทอง', 'Ang Thong', 2, '2018-09-19 12:11:03'),
(7, '16', 'ลพบุรี', 'Loburi', 2, '2018-09-19 12:11:03'),
(8, '17', 'สิงห์บุรี', 'Sing Buri', 2, '2018-09-19 12:11:03'),
(9, '18', 'ชัยนาท', 'Chai Nat', 2, '2018-09-19 12:11:03'),
(10, '19', 'สระบุรี', 'Saraburi', 2, '2018-09-19 12:11:03'),
(11, '20', 'ชลบุรี', 'Chon Buri', 5, '2018-09-19 12:11:03'),
(12, '21', 'ระยอง', 'Rayong', 5, '2018-09-19 12:11:03'),
(13, '22', 'จันทบุรี', 'Chanthaburi', 5, '2018-09-19 12:11:03'),
(14, '23', 'ตราด', 'Trat', 5, '2018-09-19 12:11:03'),
(15, '24', 'ฉะเชิงเทรา', 'Chachoengsao', 5, '2018-09-19 12:11:03'),
(16, '25', 'ปราจีนบุรี', 'Prachin Buri', 5, '2018-09-19 12:11:03'),
(17, '26', 'นครนายก', 'Nakhon Nayok', 2, '2018-09-19 12:11:03'),
(18, '27', 'สระแก้ว', 'Sa Kaeo', 5, '2018-09-19 12:11:03'),
(19, '30', 'นครราชสีมา', 'Nakhon Ratchasima', 3, '2018-09-19 12:11:03'),
(20, '31', 'บุรีรัมย์', 'Buri Ram', 3, '2018-09-19 12:11:03'),
(21, '32', 'สุรินทร์', 'Surin', 3, '2018-09-19 12:11:03'),
(22, '33', 'ศรีสะเกษ', 'Si Sa Ket', 3, '2018-09-19 12:11:03'),
(23, '34', 'อุบลราชธานี', 'Ubon Ratchathani', 3, '2018-09-19 12:11:03'),
(24, '35', 'ยโสธร', 'Yasothon', 3, '2018-09-19 12:11:03'),
(25, '36', 'ชัยภูมิ', 'Chaiyaphum', 3, '2018-09-19 12:11:03'),
(26, '37', 'อำนาจเจริญ', 'Amnat Charoen', 3, '2018-09-19 12:11:03'),
(27, '39', 'หนองบัวลำภู', 'Nong Bua Lam Phu', 3, '2018-09-19 12:11:03'),
(28, '40', 'ขอนแก่น', 'Khon Kaen', 3, '2018-09-19 12:11:03'),
(29, '41', 'อุดรธานี', 'Udon Thani', 3, '2018-09-19 12:11:03'),
(30, '42', 'เลย', 'Loei', 3, '2018-09-19 12:11:03'),
(31, '43', 'หนองคาย', 'Nong Khai', 3, '2018-09-19 12:11:03'),
(32, '44', 'มหาสารคาม', 'Maha Sarakham', 3, '2018-09-19 12:11:03'),
(33, '45', 'ร้อยเอ็ด', 'Roi Et', 3, '2018-09-19 12:11:03'),
(34, '46', 'กาฬสินธุ์', 'Kalasin', 3, '2018-09-19 12:11:03'),
(35, '47', 'สกลนคร', 'Sakon Nakhon', 3, '2018-09-19 12:11:03'),
(36, '48', 'นครพนม', 'Nakhon Phanom', 3, '2018-09-19 12:11:03'),
(37, '49', 'มุกดาหาร', 'Mukdahan', 3, '2018-09-19 12:11:03'),
(38, '50', 'เชียงใหม่', 'Chiang Mai', 1, '2018-09-19 12:11:03'),
(39, '51', 'ลำพูน', 'Lamphun', 1, '2018-09-19 12:11:03'),
(40, '52', 'ลำปาง', 'Lampang', 1, '2018-09-19 12:11:03'),
(41, '53', 'อุตรดิตถ์', 'Uttaradit', 1, '2018-09-19 12:11:03'),
(42, '54', 'แพร่', 'Phrae', 1, '2018-09-19 12:11:03'),
(43, '55', 'น่าน', 'Nan', 1, '2018-09-19 12:11:03'),
(44, '56', 'พะเยา', 'Phayao', 1, '2018-09-19 12:11:03'),
(45, '57', 'เชียงราย', 'Chiang Rai', 1, '2018-09-19 12:11:03'),
(46, '58', 'แม่ฮ่องสอน', 'Mae Hong Son', 1, '2018-09-19 12:11:03'),
(47, '60', 'นครสวรรค์', 'Nakhon Sawan', 2, '2018-09-19 12:11:03'),
(48, '61', 'อุทัยธานี', 'Uthai Thani', 2, '2018-09-19 12:11:03'),
(49, '62', 'กำแพงเพชร', 'Kamphaeng Phet', 2, '2018-09-19 12:11:03'),
(50, '63', 'ตาก', 'Tak', 4, '2018-09-19 12:11:03'),
(51, '64', 'สุโขทัย', 'Sukhothai', 2, '2018-09-19 12:11:03'),
(52, '65', 'พิษณุโลก', 'Phitsanulok', 2, '2018-09-19 12:11:03'),
(53, '66', 'พิจิตร', 'Phichit', 2, '2018-09-19 12:11:03'),
(54, '67', 'เพชรบูรณ์', 'Phetchabun', 2, '2018-09-19 12:11:03'),
(55, '70', 'ราชบุรี', 'Ratchaburi', 4, '2018-09-19 12:11:03'),
(56, '71', 'กาญจนบุรี', 'Kanchanaburi', 4, '2018-09-19 12:11:03'),
(57, '72', 'สุพรรณบุรี', 'Suphan Buri', 2, '2018-09-19 12:11:03'),
(58, '73', 'นครปฐม', 'Nakhon Pathom', 2, '2018-09-19 12:11:03'),
(59, '74', 'สมุทรสาคร', 'Samut Sakhon', 2, '2018-09-19 12:11:03'),
(60, '75', 'สมุทรสงคราม', 'Samut Songkhram', 2, '2018-09-19 12:11:03'),
(61, '76', 'เพชรบุรี', 'Phetchaburi', 4, '2018-09-19 12:11:03'),
(62, '77', 'ประจวบคีรีขันธ์', 'Prachuap Khiri Khan', 4, '2018-09-19 12:11:03'),
(63, '80', 'นครศรีธรรมราช', 'Nakhon Si Thammarat', 6, '2018-09-19 12:11:03'),
(64, '81', 'กระบี่', 'Krabi', 6, '2018-09-19 12:11:03'),
(65, '82', 'พังงา', 'Phangnga', 6, '2018-09-19 12:11:03'),
(66, '83', 'ภูเก็ต', 'Phuket', 6, '2018-09-19 12:11:03'),
(67, '84', 'สุราษฎร์ธานี', 'Surat Thani', 6, '2018-09-19 12:11:03'),
(68, '85', 'ระนอง', 'Ranong', 6, '2018-09-19 12:11:03'),
(69, '86', 'ชุมพร', 'Chumphon', 6, '2018-09-19 12:11:03'),
(70, '90', 'สงขลา', 'Songkhla', 6, '2018-09-19 12:11:03'),
(71, '91', 'สตูล', 'Satun', 6, '2018-09-19 12:11:03'),
(72, '92', 'ตรัง', 'Trang', 6, '2018-09-19 12:11:03'),
(73, '93', 'พัทลุง', 'Phatthalung', 6, '2018-09-19 12:11:03'),
(74, '94', 'ปัตตานี', 'Pattani', 6, '2018-09-19 12:11:03'),
(75, '95', 'ยะลา', 'Yala', 6, '2018-09-19 12:11:03'),
(76, '96', 'นราธิวาส', 'Narathiwat', 6, '2018-09-19 12:11:03'),
(77, '97', 'บึงกาฬ', 'buogkan', 3, '2018-09-19 12:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `email`, `password`) VALUES
(1, 'asdf', 'asdf@hotmail.com', ''),
(2, 'William Smith', 'will.smith@gmail.com', 'asdfg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postnews`
--
ALTER TABLE `postnews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

--
-- Indexes for table `tbl_provinces`
--
ALTER TABLE `tbl_provinces`
  ADD PRIMARY KEY (`province_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `postnews`
--
ALTER TABLE `postnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_provinces`
--
ALTER TABLE `tbl_provinces`
  MODIFY `province_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
