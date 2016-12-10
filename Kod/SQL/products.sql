-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Počítač: innodb.endora.cz:3306
-- Vytvořeno: Čtv 01. pro 2016, 13:15
-- Verze serveru: 5.6.28-76.1
-- Verze PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `becreate`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `products`
--

CREATE TABLE IF NOT EXISTS `products` (
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `products`
--

INSERT INTO `products` (`id`, `id_category`, `kod`, `nazev`, `popis`, `mnozstvi`, `hmotnost`, `cena`, `img`, `dostupnost`, `akce`, `created_at`) VALUES
(32, 0, 'I52I4SX190', 'Test', '', 0, 0, 0.00, 'kokotgame_logo.jpg', 1, 0, '2016-09-10 05:53:03'),
(33, 0, 'AJ80DYPGUE', 'Test2', '', 0, 0, 0.00, 'kokotgame_logo.jpg', 1, 1, '2016-09-10 05:53:03');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CATEGORY` (`id_category`),
  ADD KEY `kod` (`kod`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
