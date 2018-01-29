CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table it355.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
  PRIMARY KEY (`id`),
  KEY `FK_ryvopwisinq0s8st54rhloewo` (`genre_id`),
  CONSTRAINT `FK_ryvopwisinq0s8st54rhloewo` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table it355.shoppingcartitems
CREATE TABLE IF NOT EXISTS `shoppingcartitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `GAME_ID` int(11) DEFAULT NULL,
  `SHOPPINGCART_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_40f3gpbr9gb3sdysm5shnpafb` (`GAME_ID`),
  KEY `FK_ov1j8rdhdehh7tn7rf07ex30l` (`SHOPPINGCART_ID`),
  CONSTRAINT `FK_40f3gpbr9gb3sdysm5shnpafb` FOREIGN KEY (`GAME_ID`) REFERENCES `games` (`id`),
  CONSTRAINT `FK_ov1j8rdhdehh7tn7rf07ex30l` FOREIGN KEY (`SHOPPINGCART_ID`) REFERENCES `shoppingcarts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table it355.shoppingcarts
CREATE TABLE IF NOT EXISTS `shoppingcarts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `shoppingDate` date DEFAULT NULL,
  `totalCost` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;