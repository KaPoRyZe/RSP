-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Počítač: innodb.endora.cz:3306
-- Vytvořeno: Čtv 01. pro 2016, 13:16
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
-- Struktura tabulky `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_czech_ci NOT NULL COMMENT 'název',
  `url` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'odkaz',
  `order` int(11) NOT NULL COMMENT 'pořadí'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `order`) VALUES
(1, 'O nás', 'o-nas', 1),
(2, 'Secondhand', 'secondhand', 2),
(3, 'Půjčovna', 'pujcovna', 3),
(6, 'Kontant', 'kontakt', 0);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
