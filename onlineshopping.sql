-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Kas 2019, 14:54:26
-- Sunucu sürümü: 10.4.8-MariaDB
-- PHP Sürümü: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `category_id` int(100) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(100) NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `user` int(100) NOT NULL,
  `product` int(100) NOT NULL,
  `is_appropriate` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `order_id` int(100) NOT NULL,
  `user` int(100) NOT NULL,
  `product` int(100) NOT NULL,
  `order_date` varchar(100) NOT NULL,
  `total_price` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payment_informations`
--

CREATE TABLE `payment_informations` (
  `payment_information_id` int(100) NOT NULL,
  `security_code` varchar(100) NOT NULL,
  `expiration_date` varchar(100) NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `user` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` int(100) NOT NULL,
  `product_price` bigint(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `product_image_url` varchar(100) NOT NULL,
  `product_stock` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shopping_box`
--

CREATE TABLE `shopping_box` (
  `shopping_box_id` int(100) NOT NULL,
  `user` int(100) NOT NULL,
  `product` int(100) NOT NULL,
  `user_confirmation` tinyint(1) NOT NULL,
  `total_price` bigint(20) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soldproducts`
--

CREATE TABLE `soldproducts` (
  `soldproduct_id` int(100) NOT NULL,
  `product` int(100) NOT NULL,
  `customer_rating` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `special_offers`
--

CREATE TABLE `special_offers` (
  `so_id` int(100) NOT NULL,
  `so_name` varchar(100) NOT NULL,
  `user` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `adress` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `rank` int(100) NOT NULL,
  `interested_in` int(100) NOT NULL,
  `profile_photo_url` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `birth_date` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_ranks`
--

CREATE TABLE `user_ranks` (
  `rank_level` int(100) NOT NULL,
  `rank_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comment_product` (`product`),
  ADD KEY `fk_comment_user` (`user`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_user` (`user`),
  ADD KEY `fk_order_product` (`product`);

--
-- Tablo için indeksler `payment_informations`
--
ALTER TABLE `payment_informations`
  ADD PRIMARY KEY (`payment_information_id`),
  ADD KEY `fk_payment_user` (`user`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Tablo için indeksler `shopping_box`
--
ALTER TABLE `shopping_box`
  ADD PRIMARY KEY (`shopping_box_id`),
  ADD KEY `fk_product` (`product`),
  ADD KEY `user` (`user`);

--
-- Tablo için indeksler `soldproducts`
--
ALTER TABLE `soldproducts`
  ADD PRIMARY KEY (`soldproduct_id`),
  ADD KEY `fk_productt` (`product`);

--
-- Tablo için indeksler `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`so_id`),
  ADD KEY `fk_so_user` (`user`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_interested_in` (`interested_in`),
  ADD KEY `fk_rank` (`rank`);

--
-- Tablo için indeksler `user_ranks`
--
ALTER TABLE `user_ranks`
  ADD PRIMARY KEY (`rank_level`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_product` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `payment_informations`
--
ALTER TABLE `payment_informations`
  ADD CONSTRAINT `fk_payment_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `shopping_box`
--
ALTER TABLE `shopping_box`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `soldproducts`
--
ALTER TABLE `soldproducts`
  ADD CONSTRAINT `fk_productt` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);

--
-- Tablo kısıtlamaları `special_offers`
--
ALTER TABLE `special_offers`
  ADD CONSTRAINT `fk_so_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_interested_in` FOREIGN KEY (`interested_in`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_rank` FOREIGN KEY (`rank`) REFERENCES `user_ranks` (`rank_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
