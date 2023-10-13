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

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `adminFirstname` varchar(100) NOT NULL,
  `adminMiddlename` varchar(100) DEFAULT NULL,
  `adminLastname` varchar(100) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `admins` */

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
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `transactionID` (`orderID`),
  KEY `productID` (`productID`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_details` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `orders` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_categories` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) NOT NULL,
  `productPrice` double NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `product_categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

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
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`userID`,`username`,`password`) values 
(1,'admin','$2y$10$uFWl43sg9gJNG9ZdAkUtQeJc0kxK/QHcSMxbSsIZE6j1Lc1B/6PEu'),
(2,'allen','$2y$10$.paKB11AgpXWbzWJhyu6K.aio4ldIKTYY6xl5gKIBiLSjdA/W4mGS'),
(4,'admin2','$2y$10$0hYbg4fSikEzKm.cdbqUcekwrJ17KGVhXqcCSJaH5V3M6G05k9lbu'),
(5,'admin2','$2y$10$8MYRb1QoLhEkbU90VJ.8CeOjiZOFDW7OZLMIyr/L5m8vDiXZXD1yS'),
(6,'admin3','$2y$10$lZtei7ReFxsDR65KJeQhLO//kBNxU.arysgCN.DQbEhuSacFrVxpS'),
(7,'admin3','$2y$10$BWQmjP0LK4LXDCkvhIUZmeN6F0dvw0yoiEingYU8uj/3.QCdLjBRO'),
(8,'jherico','$2y$10$Y5LxC3pkUEiytWuz7SCD8OnkT0okmnKEP89HLoMBBbeFE9Tmx794C');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
