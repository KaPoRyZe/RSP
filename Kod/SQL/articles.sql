-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Počítač: innodb.endora.cz:3306
-- Vytvořeno: Čtv 01. pro 2016, 13:12
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
-- Struktura tabulky `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `content` text COLLATE utf8_czech_ci,
  `description` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `content`, `description`, `created_at`, `menu_id`) VALUES
(4, '<h2>Firma Dana Kašová</h2>', '<p>Nabízíme ... , ale také se nachází v sídle obchodu Second Hand, která má stále bezkonkurenční ceny na trhu v tomto okolí.</p>\r\n<p>Nabízíme značkové oblečení pro děti, dorost a dospělé.</p>\r\n<p>Tak neváhejte a podívejte se k nám, kde Vám rádi poradíme.</p>\r\n<p>Těšíme se na Vaši návštěvu.</p>', 'podnadpis - úvodní text', '2016-09-12 14:15:49', 1),
(5, 'Nabízíme tyto služby', NULL, NULL, '2016-10-22 10:26:25', 1);

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
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
