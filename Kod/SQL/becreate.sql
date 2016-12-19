-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 18. pro 2016, 19:26
-- Verze serveru: 10.1.13-MariaDB
-- Verze PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `becreate`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `articles`
--

CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `content` text COLLATE utf8_czech_ci,
  `description` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `content`, `description`, `created_at`, `menu_id`) VALUES
(4, 'Článek dva', 'obsah', 'podnadpis', '2016-09-12 14:15:49', 1),
(6, 'Článek jedna', '', 'podnadpis', '2016-12-11 19:23:31', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `parent_id`) VALUES
(1, 'Šaty', NULL),
(2, 'Kostýmy', NULL),
(3, 'Svatební šaty', NULL),
(4, 'Secondhand', NULL),
(17, 'Pánské', 1),
(18, 'Dámské', 1),
(19, 'Dětské', 1),
(20, 'Pánské', 2),
(21, 'Dámské', 2),
(22, 'Dětské', 2),
(23, 'Pánské', 3),
(24, 'Dámské', 3),
(25, 'Dětské', 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `content`, `created_at`) VALUES
(1, 4, 'František Kaša', 'adas', 'adsa', '2016-12-11 18:29:57');

-- --------------------------------------------------------

--
-- Struktura tabulky `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `contacts`
--

INSERT INTO `contacts` (`id`, `user`, `email`, `date`) VALUES
(1, 'Dana Kašová', 'kasova.dana@seznam.cz', '2016-10-15');

-- --------------------------------------------------------

--
-- Struktura tabulky `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_czech_ci NOT NULL COMMENT 'název',
  `url` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'odkaz',
  `order` int(11) DEFAULT NULL COMMENT 'pořadí'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `order`) VALUES
(1, 'O nás', 'o-nas', 1),
(2, 'Secondhand', 'secondhand', 2),
(3, 'Půjčovna', 'pujcovna', 3),
(4, 'Kontakt', 'kontakt', 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `photogallery`
--

CREATE TABLE `photogallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `photogallery`
--

INSERT INTO `photogallery` (`id`, `name`, `thumb`) VALUES
(1, 'Náhrdelníky', 'thumb01.jpg'),
(2, 'Naušnice', NULL),
(3, 'Náramky', NULL),
(4, 'Brože', NULL),
(5, 'Sety', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `photogallery_imgs`
--

CREATE TABLE `photogallery_imgs` (
  `id_img` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `id_photogallery` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `photogallery_imgs`
--

INSERT INTO `photogallery_imgs` (`id_img`, `caption`, `image`, `id_photogallery`) VALUES
(1, 'obrazek 1', 'obrazek1.jpg', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `page_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `page_id`) VALUES
(1, 'Article One', 'Lorem ipusm dolor one', '2016-09-12 12:33:28', NULL),
(2, 'Article Two', 'Lorem ipsum dolor two', '2016-09-12 12:33:33', NULL),
(3, 'Article Three', 'Lorem ipsum dolor three', '2016-09-12 12:33:36', NULL),
(4, 'Test2', 'test', '2016-12-11 18:40:56', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `kod` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `popis` text COLLATE utf8_czech_ci NOT NULL,
  `mnozstvi` int(11) NOT NULL,
  `hmotnost` float NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `img` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `dostupnost` tinyint(1) NOT NULL,
  `akce` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `products`
--

INSERT INTO `products` (`id`, `id_category`, `kod`, `nazev`, `popis`, `mnozstvi`, `hmotnost`, `cena`, `img`, `dostupnost`, `akce`, `created_at`) VALUES
(32, 0, 'I52I4SX190', 'Test', '', 0, 0, '0.00', 'kokotgame_logo.jpg', 1, 0, '2016-09-10 05:53:03'),
(33, 0, 'AJ80DYPGUE', 'Test2', '', 0, 0, '0.00', 'kokotgame_logo.jpg', 1, 1, '2016-09-10 05:53:03'),
(34, 0, 'S3EPSOJPVX', 'TEst', 'adsadasdsa', 0, 0, '0.00', '', 1, 0, '2016-12-11 19:21:18');

-- --------------------------------------------------------

--
-- Struktura tabulky `product_imgs`
--

CREATE TABLE `product_imgs` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `slideshow`
--

CREATE TABLE `slideshow` (
  `id` int(11) NOT NULL,
  `img` varchar(250) COLLATE utf8_czech_ci NOT NULL COMMENT 'nazev obrazku',
  `path` varchar(250) COLLATE utf8_czech_ci NOT NULL COMMENT 'cesta',
  `alt` varchar(250) COLLATE utf8_czech_ci NOT NULL,
  `order` int(11) NOT NULL COMMENT 'pořadí'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `slideshow`
--

INSERT INTO `slideshow` (`id`, `img`, `path`, `alt`, `order`) VALUES
(1, 'slider01.jpg', 'thumb/', 'slider 01', 1),
(2, 'slider02.jpg', 'thumb/', 'slider 02', 2),
(3, 'slider03.jpg', 'thumb/', 'slider 03', 3),
(4, 'slider04.jpg', 'thumb/', 'slider 04', 4),
(5, 'slider05.jpg', 'thumb/', 'slider 05', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `last_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `avatar`, `last_access`) VALUES
(4, 'admin', '$2y$10$RDacCEWLN0o6Xg39esX61.KsR1QALwythYseaQFF4VapvtanXJJQe', 'frantisekkasa@seznam.cz', 'admin', '', '2016-12-18 14:11:45'),
(5, 'uzivatel', '$2y$10$RfBYGezZ8lcLRtutYNubTuYGfMd04L6UT0DjuGA4YEDhDwjw1Sbze', '', 'guest', '', '2016-12-18 11:22:36');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `FK_menu` (`menu_id`) USING BTREE;

--
-- Klíče pro tabulku `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `FK_category` (`category_id`);

--
-- Klíče pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Klíče pro tabulku `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `photogallery`
--
ALTER TABLE `photogallery`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `photogallery_imgs`
--
ALTER TABLE `photogallery_imgs`
  ADD PRIMARY KEY (`id_img`),
  ADD KEY `FK_PHOTOGALLERY` (`id_photogallery`);

--
-- Klíče pro tabulku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_page` (`page_id`);

--
-- Klíče pro tabulku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CATEGORY` (`id_category`),
  ADD KEY `kod` (`kod`);

--
-- Klíče pro tabulku `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_product` (`id_product`) USING BTREE;

--
-- Klíče pro tabulku `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pro tabulku `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `photogallery`
--
ALTER TABLE `photogallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pro tabulku `photogallery_imgs`
--
ALTER TABLE `photogallery_imgs`
  MODIFY `id_img` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pro tabulku `product_imgs`
--
ALTER TABLE `product_imgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Omezení pro tabulku `photogallery_imgs`
--
ALTER TABLE `photogallery_imgs`
  ADD CONSTRAINT `photogallery_imgs_ibfk_1` FOREIGN KEY (`id_photogallery`) REFERENCES `photogallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
