/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.25-MariaDB : Database - online_ordering_system_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_ordering_system_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `online_ordering_system_db`;

/*Table structure for table `employee_type` */

DROP TABLE IF EXISTS `employee_type`;

CREATE TABLE `employee_type` (
  `employeeTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeType` varchar(100) NOT NULL,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`employeeTypeID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `employee_type_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `employee_type` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeFirstname` varchar(100) NOT NULL,
  `employeeMiddlename` varchar(100) DEFAULT NULL,
  `employeeLastname` varchar(100) NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `employees` */

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `inventoryID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `productID` (`productID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `inventory` */

/*Table structure for table `inventory_report` */

DROP TABLE IF EXISTS `inventory_report`;

CREATE TABLE `inventory_report` (
  `inventoryReportID` int(11) NOT NULL AUTO_INCREMENT,
  `stockIn` int(11) NOT NULL,
  `stockOut` int(11) NOT NULL,
  `date` date NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `inventoryID` int(11) NOT NULL,
  PRIMARY KEY (`inventoryReportID`),
  KEY `inventoryID` (`inventoryID`),
  CONSTRAINT `inventory_report_ibfk_1` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `inventory_report` */

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `orderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `orderDescription` varchar(255) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSizeID` int(11) NOT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `transactionID` (`orderID`),
  KEY `productID` (`productID`),
  KEY `productSizeID` (`productSizeID`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`productSizeID`) REFERENCES `product_sizes` (`productSizeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_details` */

insert  into `order_details`(`orderDetailID`,`quantity`,`orderDescription`,`orderID`,`productID`,`productSizeID`) values 
(1,2,'Cheesy Bacon Fries',1,30,4),
(2,3,'Blueberry Oreo',3,66,2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `userID` (`userID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `orders` */

insert  into `orders`(`orderID`,`orderDate`,`status`,`userID`) values 
(1,'2023-10-21','Order Processed',1),
(2,'2023-10-22','Order Processed',2),
(3,'2023-10-23','Order Processed',4),
(4,'2023-10-23','Order Processed',5),
(5,'2023-11-13','Order Processed',8),
(6,'2023-11-15','Order Processed',7);

/*Table structure for table `payment_methods` */

DROP TABLE IF EXISTS `payment_methods`;

CREATE TABLE `payment_methods` (
  `paymentMethodID` int(11) NOT NULL AUTO_INCREMENT,
  `paymentMethod` varchar(100) NOT NULL,
  `paymentID` int(11) NOT NULL,
  PRIMARY KEY (`paymentMethodID`),
  KEY `paymentID` (`paymentID`),
  CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `payments` (`paymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `payment_methods` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `transactionID` (`orderID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `payments` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(30) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_categories` */

insert  into `product_categories`(`categoryID`,`categoryName`) values 
(1,'Burger & Fries'),
(2,'Sandwiches & Fries'),
(3,'Sizzling Meals'),
(4,'Ala Carte Wings'),
(5,'Pica Pica'),
(6,'Fries'),
(8,'Rice'),
(9,'Classic Milktea'),
(10,'Frappe'),
(11,'Premium Milktea'),
(12,'Cheesecake Series'),
(13,'Fruit Tea'),
(14,'Iced Coffee'),
(15,'Hot Coffee'),
(16,'Sinkers');

/*Table structure for table `product_flavors` */

DROP TABLE IF EXISTS `product_flavors`;

CREATE TABLE `product_flavors` (
  `flavorID` int(11) NOT NULL AUTO_INCREMENT,
  `flavorName` varchar(100) NOT NULL,
  PRIMARY KEY (`flavorID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_flavors` */

insert  into `product_flavors`(`flavorID`,`flavorName`) values 
(1,'Sweet & Spicy'),
(2,'Buffalo'),
(3,'Super Sili'),
(4,'Garlic Parmesan'),
(5,'Honey Garlic'),
(6,'Garlic Mayo'),
(7,'Classic Gravy'),
(8,'Teriyaki'),
(9,'Barbeque'),
(10,'Soy Garlic'),
(11,'Mango Habanero'),
(12,'Lemon Glazed'),
(13,'Spiced Maple'),
(14,'Salted Egg');

/*Table structure for table `product_sizes` */

DROP TABLE IF EXISTS `product_sizes`;

CREATE TABLE `product_sizes` (
  `productSizeID` int(11) NOT NULL AUTO_INCREMENT,
  `productSizeName` varchar(20) NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `productSizePrice` double NOT NULL,
  PRIMARY KEY (`productSizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_sizes` */

insert  into `product_sizes`(`productSizeID`,`productSizeName`,`productSize`,`productSizePrice`) values 
(1,'Lowdose','16oz',79),
(2,'Highdose','22oz',99),
(3,'Overdose','1Liter',119),
(4,'NA','NA',0);

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `productTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `productType` varchar(100) NOT NULL,
  PRIMARY KEY (`productTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_type` */

insert  into `product_type`(`productTypeID`,`productType`) values 
(1,'Food'),
(2,'Beverage');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) NOT NULL,
  `productPrice` double NOT NULL,
  `categoryID` int(11) NOT NULL,
  `productTypeID` int(11) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `categoryID` (`categoryID`),
  KEY `productTypeID` (`productTypeID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `product_categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`productTypeID`) REFERENCES `product_type` (`productTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`productID`,`productName`,`productPrice`,`categoryID`,`productTypeID`) values 
(1,'Classic Burger',110,1,1),
(2,'Cheesy Bacon Beef Burger',130,1,1),
(3,'Double Patty',180,1,1),
(4,'Big Tower',200,1,1),
(5,'Clubhouse',100,2,1),
(6,'Ham & Cheese Toast',80,2,1),
(7,'Sizzling Hotdog',89,3,1),
(8,'Sizzling Tapa',99,3,1),
(9,'Sizzling Tocino',99,3,1),
(10,'Sizzling Burger Steak(2pcs)',99,3,1),
(11,'Sizzling Pork-Chop',129,3,1),
(12,'Sizzling Liempo',139,3,1),
(13,'Sizzling Wings(3pcs)',149,3,1),
(14,'Sizzling Bangus',139,3,1),
(15,'3pcs Wings w/rice',115,4,1),
(16,'3pcs Wings w/fries',115,4,1),
(17,'3pcs Wings w/burger',199,4,1),
(18,'Kikiam',50,5,1),
(19,'Squidballs',50,5,1),
(20,'Cheesy Nachos',80,5,1),
(21,'CheeseSticks',70,5,1),
(22,'Mojos',123,5,1),
(23,'Hashbrown',50,5,1),
(24,'Hotdog & Fries',120,5,1),
(25,'Meaty Nachos',120,5,1),
(26,'Plain Fries (Salted)',80,6,1),
(27,'Cheese Fries',80,6,1),
(28,'Sour & Cream Fries',80,6,1),
(29,'BBQ Fries',80,6,1),
(30,'Chessy Bacon Fries',120,6,1),
(38,'Plain Rice',20,8,1),
(39,'Java Rice',20,8,1),
(40,'Cookies And Cream',0,9,2),
(41,'Chocolate',0,9,2),
(42,'Dark Choco',0,9,2),
(43,'Strawberry',0,9,2),
(44,'Red Velvet',0,9,2),
(45,'Okinawa',0,9,2),
(46,'Hokkaido',0,9,2),
(47,'Matcha',0,9,2),
(48,'Wintermelon',0,9,2),
(49,'Salted Caramel',0,9,2),
(50,'Double Dutch',0,9,2),
(51,'Cookies And Cream',0,10,2),
(52,'Choco',0,10,2),
(53,'Dark Choco',0,10,2),
(54,'Strawberry',0,10,2),
(55,'Red Velvet',0,10,2),
(56,'Matcha',0,10,2),
(57,'Salted Caramel',0,10,2),
(58,'Double Dutch',0,10,2),
(59,'Blue Berry',0,10,2),
(60,'Java Chip',0,10,2),
(61,'Cappuccino',0,10,2),
(62,'Nutella Orea',0,11,2),
(63,'Apollo Nutella',0,11,2),
(64,'Milo Kingkong',0,11,2),
(65,'Tiger Sugar',0,11,2),
(66,'Blueberry Oreo',0,12,2),
(67,'Oreo Cheesecake',0,12,2),
(68,'Choco Gaze',0,12,2),
(69,'Strawberry Oreo',0,12,2),
(70,'Red Velvet',0,12,2),
(71,'Matcha Oreo',0,12,2),
(72,'Okinawa',0,12,2),
(73,'Taro Oreo',0,12,2),
(74,'Dark Choco Oreo',0,12,2),
(75,'Lychee',0,13,2),
(76,'Blueberry',0,13,2),
(77,'Green Apple',0,13,2),
(78,'Strawberry',0,13,2),
(79,'Watermelon',0,13,2),
(80,'Barako',80,14,2),
(81,'Caramel Macchiato',110,14,2),
(82,'Sakura Latte',110,14,2),
(83,'Matcha Latte',0,14,2),
(84,'BARAKO',45,15,2),
(85,'SB Capuccion',130,15,2),
(86,'SB House Blend',100,15,2),
(87,'SB Espresso Roast',100,15,2),
(88,'Caffe Latte',100,15,2),
(89,'Pearl',20,16,2),
(90,'Nata',20,16,2),
(91,'Crystall Jelly',20,16,2),
(92,'Oreo',20,16,2),
(93,'Cheesecake',25,16,2);

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplierID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(100) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`supplierID`),
  KEY `productID` (`productID`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `suppliers` */

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `userAddressID` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `municipality` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userAddressID`),
  KEY `userID` (`userID`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_address` */

/*Table structure for table `user_profile` */

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `userProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `userFirstname` varchar(100) NOT NULL,
  `userMiddlename` varchar(100) DEFAULT NULL,
  `userLastname` varchar(100) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userProfileID`),
  KEY `userID` (`userID`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_profile` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`userID`,`username`,`password`,`role`) values 
(1,'admin','$2y$10$uFWl43sg9gJNG9ZdAkUtQeJc0kxK/QHcSMxbSsIZE6j1Lc1B/6PEu','admin'),
(2,'allen','$2y$10$.paKB11AgpXWbzWJhyu6K.aio4ldIKTYY6xl5gKIBiLSjdA/W4mGS','user'),
(4,'admin2','$2y$10$0hYbg4fSikEzKm.cdbqUcekwrJ17KGVhXqcCSJaH5V3M6G05k9lbu','admin'),
(5,'admin2','$2y$10$8MYRb1QoLhEkbU90VJ.8CeOjiZOFDW7OZLMIyr/L5m8vDiXZXD1yS','admin'),
(6,'admin3','$2y$10$lZtei7ReFxsDR65KJeQhLO//kBNxU.arysgCN.DQbEhuSacFrVxpS','admin'),
(7,'admin3','$2y$10$BWQmjP0LK4LXDCkvhIUZmeN6F0dvw0yoiEingYU8uj/3.QCdLjBRO','admin'),
(8,'jherico','$2y$10$Y5LxC3pkUEiytWuz7SCD8OnkT0okmnKEP89HLoMBBbeFE9Tmx794C','admin');

/*Table structure for table `view_orders` */

DROP TABLE IF EXISTS `view_orders`;

/*!50001 DROP VIEW IF EXISTS `view_orders` */;
/*!50001 DROP TABLE IF EXISTS `view_orders` */;

/*!50001 CREATE TABLE  `view_orders`(
 `orderDate` varchar(73) ,
 `status` varchar(100) 
)*/;

/*Table structure for table `view_product_count` */

DROP TABLE IF EXISTS `view_product_count`;

/*!50001 DROP VIEW IF EXISTS `view_product_count` */;
/*!50001 DROP TABLE IF EXISTS `view_product_count` */;

/*!50001 CREATE TABLE  `view_product_count`(
 `productCount` bigint(21) 
)*/;

/*Table structure for table `view_total_sales_month` */

DROP TABLE IF EXISTS `view_total_sales_month`;

/*!50001 DROP VIEW IF EXISTS `view_total_sales_month` */;
/*!50001 DROP TABLE IF EXISTS `view_total_sales_month` */;

/*!50001 CREATE TABLE  `view_total_sales_month`(
 `totalSales` double 
)*/;

/*Table structure for table `view_user_count` */

DROP TABLE IF EXISTS `view_user_count`;

/*!50001 DROP VIEW IF EXISTS `view_user_count` */;
/*!50001 DROP TABLE IF EXISTS `view_user_count` */;

/*!50001 CREATE TABLE  `view_user_count`(
 `userCount` bigint(21) 
)*/;

/*View structure for view view_orders */

/*!50001 DROP TABLE IF EXISTS `view_orders` */;
/*!50001 DROP VIEW IF EXISTS `view_orders` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders` AS select date_format(`orders`.`orderDate`,'%M %d, %Y') AS `orderDate`,`orders`.`status` AS `status` from `orders` */;

/*View structure for view view_product_count */

/*!50001 DROP TABLE IF EXISTS `view_product_count` */;
/*!50001 DROP VIEW IF EXISTS `view_product_count` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_count` AS select count(0) AS `productCount` from `products` */;

/*View structure for view view_total_sales_month */

/*!50001 DROP TABLE IF EXISTS `view_total_sales_month` */;
/*!50001 DROP VIEW IF EXISTS `view_total_sales_month` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total_sales_month` AS select sum(if(`ps`.`productSize` = 'NA',`od`.`quantity` * `pd`.`productPrice`,`od`.`quantity` * `ps`.`productSizePrice`)) AS `totalSales` from ((((`order_details` `od` left join `orders` `or` on(`or`.`orderID` = `od`.`orderID`)) left join `product_sizes` `ps` on(`od`.`productSizeID` = `ps`.`productSizeID`)) left join `products` `pd` on(`pd`.`productID` = `od`.`productID`)) left join `product_type` `pt` on(`pd`.`productTypeID` = `pt`.`productTypeID`)) group by `or`.`orderDate` = month(curdate()) */;

/*View structure for view view_user_count */

/*!50001 DROP TABLE IF EXISTS `view_user_count` */;
/*!50001 DROP VIEW IF EXISTS `view_user_count` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_count` AS select count(0) AS `userCount` from `users` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
