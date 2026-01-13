-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: chronosx
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `image` varchar(512) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Orient SK RA-AA0B02R39B – Nam – Automatic – Mặt Số 41.7mm','Orient',9480000.00,'SK RA-AA0B02R39B mặt lửa huyền thoại tạo ấn tượng mạnh mẽ bằng mặt số kích thước lớn, form bất đối xứng độc đáo. Sử dụng bộ máy cơ sản xuất in-house trữ cót khoảng 40 giờ bền bỉ và chất lượng.','images/products/Orient_1.jpg','2026-01-07 13:00:00'),(2,'Orient Esteem Gen 2 TAG02003W0 – Nam – Automatic – Mặt Số 41mm','Orient',8420000.00,'Orient Esteem Gen 2 TAG02003W0 là mẫu đồng hồ cơ automatic dành cho những ai mới bắt đầu tiếp cận. Thiết kế Open Heart tạo điểm nhấn độc đáo cùng khả năng hoạt động bền bỉ, trữ cót 40 giờ có độ chính xác cao.','images/products/Orient_2.jpg','2026-01-07 13:00:00'),(3,'Orient Caballero TAG00003W0 – Nam – Automatic In-House – Mặt Số 43mm','Orient',9250000.00,'Orient Caballero TAG00003W0 thiết kế cổ điển, lịch lãm cho nam giới diện được nhiều dịp như đi làm, đi tiệc. Điểm nhấn lộ cơ góc 9 giờ cùng bộ kim nung xanh mắt ngỗng đẹp mắt.','images/products/Orient_3.jpg','2026-01-07 13:00:00'),(4,'Orient SK RA-AA0B05R19B – Nam – Automatic – Mặt Số 41.7mm','Orient',9480000.00,'Mẫu Orient RA-AA0B05R19B phiên bản mạ bạc sang trọng, mặt số kích thước 41.7mm đi kèm thiết kế 2 núm vặn điều chỉnh, vỏ máy kim loại kiểu dáng dày dặn của bộ máy cơ.','images/products/Orient_4.jpg','2026-01-07 13:00:00'),(5,'Orient Caballero TAG00004D0 – Nam – Automatic In-House – Mặt Số 43mm','Orient',9250000.00,'Orient Caballero TAG00004D0 toát lên vẻ đẹp cổ điển nhờ bộ kim Breguet, cọc số La Mã và vòng chương đếm phút Railway Minute Track. Sử dụng bộ máy cơ in-house tích cót 40 giờ chuẩn Japan Movt.','images/products/Orient_5.jpg','2026-01-07 13:00:00'),(6,'Casio MTP-1183Q-7ADF – Nam – Quartz (Pin)','Casio',1242000.00,'Đồng hồ Casio MTP-1183Q-7ADF với mặt đồng hồ tươi sáng và nổi bật, vỏ máy kim loại mạ vàng sang trọng, cùng dây da dập vân lịch lãm.','images/products/Casio_6.jpg','2026-01-07 13:00:00'),(7,'Casio MTP-1302D-7A1VDF – Nam – Quartz (Pin) – Mặt Số 38.5mm','Casio',1595000.00,'Casio MTP-1302D-7A1VDF thanh lịch, sang trọng với tông màu trắng tinh tế, sử dụng máy Nhật cho độ chính xác cao.','images/products/Casio_7.jpg','2026-01-07 13:00:00'),(8,'Casio MTP-1370D-7A2VDF – Nam – Quartz (Pin) – Mặt Số 40mm','Casio',1906000.00,'Casio MTP-1370D-7A2VDF với mặt nền trắng, chữ số mạ vàng, thép không gỉ, có lịch ngày và lịch thứ.','images/products/Casio_8.jpg','2026-01-07 13:00:00'),(9,'Casio Automatic EFK-100D-7ADR – Nam – Automatic – Mặt Số 39mm','Casio',11013000.00,'Sản phẩm đồng hồ cơ đầu tiên của Casio, mặt số vân carbon, bộ máy trữ cót 40 giờ cao cấp.','images/products/Casio_9.jpg','2026-01-07 13:00:00'),(10,'Casio Automatic EFK-100D-2ADR – Nam – Automatic – Mặt Số 39mm','Casio',11013000.00,'Phiên bản mặt xanh dương vân carbon, bộ máy cơ trữ cót 40 giờ.','images/products/Casio_10.jpg','2026-01-07 13:00:00'),(11,'Tissot PRX – Nam – Kính Sapphire – Automatic','Tissot',25880000.00,'Tissot PRX Powermatic 80 mạ vàng hồng PVD, trữ cót 80 giờ.','images/products/Tissot_11.jpg','2026-01-07 13:00:00'),(12,'Tissot Le Locle Powermatic 80 – Nam – Automatic','Tissot',21330000.00,'Mẫu đồng hồ cơ cổ điển trữ cót 80 giờ, dây da bò cao cấp.','images/products/Tissot_12.jpg','2026-01-07 13:00:00'),(13,'Tissot Gentleman Powermatic 80 Silicium – Nam – Automatic – Mặt Số 40mm','Tissot',29430000.00,'Mặt số xanh tiffany, máy cơ trữ cót 80 giờ.','images/products/Tissot_13.jpg','2026-01-07 13:00:00'),(14,'Tissot Heritage Visodate – Nam – Automatic – Mặt Số 42mm','Tissot',21000000.00,'Thiết kế cổ điển 1953, máy Powermatic 80.','images/products/Tissot_14.jpg','2026-01-07 13:00:00'),(15,'Tissot Tradition – Nam – Automatic','Tissot',23450000.00,'Phong cách cổ điển Small Second, trữ cót 40 giờ.','images/products/Tissot_15.jpg','2026-01-07 13:00:00'),(16,'Citizen NH8353-00H – Nam – Automatic – Mặt Số 40mm','Citizen',6785000.00,'Citizen mạ vàng PVD, máy cơ in-house trữ cót 45 giờ.','images/products/Citizen_16.jpg','2026-01-07 13:00:00'),(17,'Citizen Tsuyosa NJ0154-80H – Nam – Automatic – Mặt Số 40mm','Citizen',14385000.00,'Dây kim loại demi vàng, máy Miyota Nhật.','images/products/Citizen_17.jpg','2026-01-07 13:00:00'),(18,'Citizen NH8350-08B – Nam – Automatic – Mặt Số 40mm','Citizen',6385000.00,'Dây da đen, thiết kế nam tính, máy cơ bền bỉ.','images/products/Citizen_18.jpg','2026-01-07 13:00:00'),(19,'Citizen NH8350-59L – Nam – Automatic – Mặt Số 40mm','Citizen',6485000.00,'Dây thép không gỉ, máy automatic 45 giờ.','images/products/Citizen_19.jpg','2026-01-07 13:00:00'),(20,'Citizen Tsuyosa x Pantone NJ0158-89Y – Nam','Citizen',12485000.00,'Phiên bản giới hạn 1999 chiếc, màu Warm Sand.','images/products/Citizen_20.jpg','2026-01-07 13:00:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'baongoc','jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=','baongocx1x2@gmail.com','Lu Tran Bao Ngoc','2026-01-07 13:07:19'),(2,'phuc','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=','phuc@gmail.com','phuc','2026-01-13 11:10:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13 22:41:48
