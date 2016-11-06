--
-- Struktura tabulky `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_czech_ci NOT NULL COMMENT 'název',
  `url` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'odkaz',
  `order` int(11) NOT NULL COMMENT 'pořadí'
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
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `avatar`) VALUES
(4, 'admin', '$2y$10$RDacCEWLN0o6Xg39esX61.KsR1QALwythYseaQFF4VapvtanXJJQe', 'frantisekkasa@seznam.cz', 'superadmin', ''),
(5, 'uzivatel01', '$2y$10$RfBYGezZ8lcLRtutYNubTuYGfMd04L6UT0DjuGA4YEDhDwjw1Sbze', '', 'guest', '');


--
-- Klíče pro tabulku `menu`
--
ALTER TABLE `menu`
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
-- AUTO_INCREMENT pro tabulku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Omezení pro exportované tabulky
--