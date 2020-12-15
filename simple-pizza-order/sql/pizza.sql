-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.29 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5958
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных pizza_order
CREATE DATABASE IF NOT EXISTS `pizza_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pizza_order`;

-- Дамп структуры для таблица pizza_order.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_placed` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.orders: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `time_placed`, `name`, `contact_number`, `address`) VALUES
	(8, '20201215120126', 'Peterman', '11111111', 'asdasdasdasd'),
	(9, '20201215121140', 'Peterman', '777', 'Aleco'),
	(10, '20201215132945', 'Peterman', '11111111', 'Aleco'),
	(11, '20201215141132', 'asd', 'asd', 'asd'),
	(12, '20201215141846', 'Peterman', '11111111', 'Aleco');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_order.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `isPizza` int(11) NOT NULL COMMENT '1=Pizza, 0=Toppings',
  `qty` int(11) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.order_details: ~45 rows (приблизительно)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`order_id`, `item_id`, `isPizza`, `qty`, `size`) VALUES
	(1, 1, 1, 1, 10),
	(1, 2, 1, 1, 18),
	(1, 3, 1, 2, 14),
	(1, 6, 1, 2, 18),
	(1, 9, 1, 1, 14),
	(1, 1, 0, 1, 14),
	(1, 2, 0, 1, 10),
	(1, 3, 0, 1, 18),
	(1, 4, 0, 1, 10),
	(1, 5, 0, 1, 18),
	(1, 7, 0, 1, 10),
	(1, 8, 0, 1, 14),
	(1, 10, 0, 1, 18),
	(2, 1, 1, 1, 10),
	(2, 2, 1, 1, 18),
	(2, 3, 1, 2, 14),
	(2, 6, 1, 2, 18),
	(2, 9, 1, 1, 14),
	(2, 1, 0, 1, 14),
	(2, 2, 0, 1, 10),
	(2, 3, 0, 1, 18),
	(2, 4, 0, 1, 10),
	(2, 5, 0, 1, 18),
	(2, 7, 0, 1, 10),
	(2, 8, 0, 1, 14),
	(2, 10, 0, 1, 18),
	(3, 1, 1, 1, 14),
	(3, 3, 1, 3, 18),
	(3, 10, 1, 1, 10),
	(3, 1, 0, 1, 10),
	(4, 1, 0, 1, 10),
	(4, 8, 1, 2, 14),
	(5, 1, 0, 1, 10),
	(5, 8, 1, 2, 14),
	(6, 1, 0, 1, 14),
	(6, 1, 1, 2, 14),
	(7, 1, 0, 1, 14),
	(7, 3, 0, 1, 14),
	(7, 5, 0, 1, 14),
	(7, 1, 1, 1, 10),
	(8, 1, 0, 1, 14),
	(8, 3, 0, 1, 14),
	(8, 5, 0, 1, 14),
	(8, 1, 1, 1, 10),
	(9, 1, 1, 2, 14),
	(9, 1, 0, 1, 14),
	(10, 1, 1, 1, 18),
	(10, 2, 0, 1, 18),
	(10, 4, 0, 1, 18),
	(10, 3, 0, 1, 10),
	(11, 1, 1, 2, 18),
	(12, 1, 1, 2, 18),
	(12, 1, 0, 1, 18),
	(12, 3, 0, 1, 18);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_order.pizza
CREATE TABLE IF NOT EXISTS `pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.pizza: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` (`id`, `category`, `name`, `description`) VALUES
	(1, 'CLASSIC PIZZA', 'CHEESE', 'double layer of mozarella'),
	(2, 'CLASSIC PIZZA', 'NY CLASSIC', 'pepperoni\r\n'),
	(3, 'CLASSIC PIZZA', 'PEPPERONI & MUSHROOM', 'pepperoni & button mushroom'),
	(4, 'CLASSIC PIZZA', 'MANHATTAN MEATLOVERS', 'ham, pepperoni, Italian sausage, ground beef, salami & bacon'),
	(5, 'CLASSIC PIZZA', 'GARDEN SPECIAL', 'fresh tomatoes, black olives, mushrooms, onions, red & green bell peppers'),
	(6, 'CLASSIC PIZZA', 'HAWAIIAN', 'ham, pineapple & bacon'),
	(7, 'CLASSIC PIZZA', 'NEW YORK\'S FINEST', 'Italian sausage, ham, pepperoni, bacon, ground beef, black olives, mushroom, onions, red & green bell peppers'),
	(8, 'SPECIALTY PIZZA', 'TRIBECA MUSHROOM', 'shiltake, button & oyster mushroom'),
	(9, 'SPECIALTY PIZZA', 'ANCHOVY LOVERS', 'black olives, anchovies, capers, roasted garlic, mushrooms & onions'),
	(10, 'SPECIALTY PIZZA', '#4 CHEESE', 'cheese heaven!, mozzarella, cheddar, fontina & feta'),
	(11, 'SPECIALTY PIZZA', 'CORONA CHICKEN SALSA', 'tangy strips of chicken with Southwestern  salsa'),
	(12, 'SPECIALTY PIZZA', 'GOURMET GARDEN', 'zucchini, grilled eggplant, fresh tomatoes, black olives, capers, mushrooms, onions, red & green bell peppers'),
	(13, 'SPECIALTY PIZZA', 'ROASTED GARLIC & SHRIMP', 'shrimp, onions, roasted garlic in wine-butter sauce'),
	(14, 'SPECIALTY PIZZA', 'FOUR SEASONS', 'gourmet sampler, NY Classic, #4 Cheese, Anchovy lovers, Roasted Garlic & Shrimp');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_order.pizza_size
CREATE TABLE IF NOT EXISTS `pizza_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pizza_id` int(11) NOT NULL,
  `size` int(3) NOT NULL COMMENT 'in inch',
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.pizza_size: ~42 rows (приблизительно)
/*!40000 ALTER TABLE `pizza_size` DISABLE KEYS */;
INSERT INTO `pizza_size` (`id`, `pizza_id`, `size`, `price`) VALUES
	(1, 1, 10, 60),
	(2, 1, 14, 80),
	(3, 1, 18, 100),
	(4, 2, 10, 70),
	(5, 2, 14, 90),
	(6, 2, 18, 110),
	(7, 3, 10, 70),
	(8, 3, 14, 90),
	(9, 3, 18, 110),
	(10, 4, 10, 75),
	(11, 4, 14, 95),
	(12, 4, 18, 115),
	(13, 5, 10, 70),
	(14, 5, 14, 90),
	(15, 5, 18, 110),
	(16, 6, 10, 70),
	(17, 6, 14, 90),
	(18, 6, 18, 115),
	(19, 7, 10, 80),
	(20, 7, 14, 100),
	(21, 7, 18, 120),
	(22, 8, 10, 80),
	(23, 8, 14, 100),
	(24, 8, 18, 120),
	(25, 9, 10, 85),
	(26, 9, 14, 105),
	(27, 9, 18, 125),
	(28, 10, 10, 80),
	(29, 10, 14, 100),
	(30, 10, 18, 120),
	(31, 11, 10, 85),
	(32, 11, 14, 105),
	(33, 11, 18, 125),
	(34, 12, 10, 85),
	(35, 12, 14, 110),
	(36, 12, 18, 120),
	(37, 13, 10, 85),
	(38, 13, 14, 110),
	(39, 13, 18, 130),
	(40, 14, 10, 80),
	(41, 14, 14, 110),
	(42, 14, 18, 120);
/*!40000 ALTER TABLE `pizza_size` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_order.toppings
CREATE TABLE IF NOT EXISTS `toppings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.toppings: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` (`id`, `name`) VALUES
	(1, 'Cheese'),
	(2, 'Bacon'),
	(3, 'Ground Bacon'),
	(4, 'Ham'),
	(5, 'Italian Sausage'),
	(6, 'Pepperoni'),
	(7, 'Salami'),
	(8, 'Capers'),
	(9, 'Roasted Garlic'),
	(10, 'Bell Pepper'),
	(11, 'Mushrooms');
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_order.toppings_size
CREATE TABLE IF NOT EXISTS `toppings_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toppings_id` int(11) NOT NULL,
  `size` int(3) NOT NULL COMMENT 'in inch',
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы pizza_order.toppings_size: ~33 rows (приблизительно)
/*!40000 ALTER TABLE `toppings_size` DISABLE KEYS */;
INSERT INTO `toppings_size` (`id`, `toppings_id`, `size`, `price`) VALUES
	(1, 1, 10, 5),
	(2, 1, 14, 10),
	(3, 1, 18, 15),
	(4, 2, 10, 5),
	(5, 2, 14, 10),
	(6, 2, 18, 15),
	(7, 3, 10, 5),
	(8, 3, 14, 10),
	(9, 3, 18, 15),
	(10, 4, 10, 5),
	(11, 4, 14, 10),
	(12, 4, 18, 15),
	(13, 5, 10, 5),
	(14, 5, 14, 10),
	(15, 5, 18, 15),
	(16, 6, 10, 5),
	(17, 6, 14, 10),
	(18, 6, 18, 15),
	(19, 7, 10, 5),
	(20, 7, 14, 10),
	(21, 7, 18, 15),
	(22, 8, 10, 5),
	(23, 8, 14, 10),
	(24, 8, 18, 15),
	(25, 9, 10, 5),
	(26, 9, 14, 10),
	(27, 9, 18, 15),
	(28, 10, 10, 5),
	(29, 10, 14, 10),
	(30, 10, 18, 15),
	(31, 11, 10, 5),
	(32, 11, 14, 10),
	(33, 11, 18, 15);
/*!40000 ALTER TABLE `toppings_size` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
