-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Počítač: innodb.endora.cz:3306
-- Vytvořeno: Pon 05. pro 2016, 10:18
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
-- Struktura tabulky `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `last_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `avatar`, `last_access`) VALUES
(4, 'admin', '$2y$10$RDacCEWLN0o6Xg39esX61.KsR1QALwythYseaQFF4VapvtanXJJQe', 'frantisekkasa@seznam.cz', 'superadmin', '', '2016-12-05 09:18:24'),
(5, 'uzivatel01', '$2y$10$RfBYGezZ8lcLRtutYNubTuYGfMd04L6UT0DjuGA4YEDhDwjw1Sbze', '', 'guest', '', '2016-12-05 09:18:24'),
(6, 'test', '$2y$10$MPNG3.wKaYs2lYqKX.7J0uG6f12iipckxJCnMvC0ejzp4vco745IS', '', '', '', '2016-12-05 09:18:24'),
(7, 'test', '$2y$10$8p5Ukd4XpIyBafWYZFJxBes6D6jY//D2wed3o1lBZaxVNdm4mXE.C', '', '', '', '2016-12-05 09:18:24'),
(8, 'test02', '$2y$10$E1/MaLpwhM6fbhlWSeYW9u8GaDISyluTMxjVF5uZXv/T9frVvVfLS', '', '', '', '2016-12-05 09:18:24'),
(9, 'qq', '$2y$10$vIJHZCpIYFUCsp0bRRLSaOB/WYbgBwlk8Ud/XB0H5RmHEZk8RRz6a', '', '', '', '2016-12-05 09:18:24');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
