-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 12. 08:55
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmu`
--

CREATE TABLE `jarmu` (
  `jazon` int(11) NOT NULL,
  `tipus` varchar(20) NOT NULL,
  `varosAzon` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jarmu`
--

INSERT INTO `jarmu` (`jazon`, `tipus`, `varosAzon`) VALUES
(180, 'motor', 4233),
(199, 'auto', 3211),
(200, 'busz', 1123);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofor`
--

CREATE TABLE `sofor` (
  `azon` int(11) NOT NULL,
  `vezetekNev` varchar(30) NOT NULL,
  `keresztNev` varchar(30) NOT NULL,
  `jazon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `sofor`
--

INSERT INTO `sofor` (`azon`, `vezetekNev`, `keresztNev`, `jazon`) VALUES
(123456, 'Ádám', 'Laci', 200),
(543216, 'Kovács', 'Alex', 180),
(654321, 'Lajos', 'Imre', 199);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varos`
--

CREATE TABLE `varos` (
  `varosAzon` int(30) NOT NULL,
  `varosnev` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `varos`
--

INSERT INTO `varos` (`varosAzon`, `varosnev`) VALUES
(1123, 'Budapest'),
(3211, 'Győr'),
(4233, 'Miskolc');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jarmu`
--
ALTER TABLE `jarmu`
  ADD PRIMARY KEY (`jazon`),
  ADD UNIQUE KEY `varosAzon` (`varosAzon`),
  ADD KEY `jazon` (`jazon`),
  ADD KEY `varosAzon_2` (`varosAzon`);

--
-- A tábla indexei `sofor`
--
ALTER TABLE `sofor`
  ADD PRIMARY KEY (`azon`) USING BTREE,
  ADD UNIQUE KEY `azon_2` (`azon`),
  ADD UNIQUE KEY `jazon` (`jazon`),
  ADD KEY `jazon_2` (`jazon`) USING BTREE,
  ADD KEY `jazon_3` (`jazon`);

--
-- A tábla indexei `varos`
--
ALTER TABLE `varos`
  ADD PRIMARY KEY (`varosAzon`),
  ADD KEY `varosAzon` (`varosAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `jarmu`
--
ALTER TABLE `jarmu`
  MODIFY `jazon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT a táblához `varos`
--
ALTER TABLE `varos`
  MODIFY `varosAzon` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4234;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jarmu`
--
ALTER TABLE `jarmu`
  ADD CONSTRAINT `jarmu_ibfk_1` FOREIGN KEY (`varosAzon`) REFERENCES `varos` (`varosAzon`);

--
-- Megkötések a táblához `sofor`
--
ALTER TABLE `sofor`
  ADD CONSTRAINT `sofor_ibfk_1` FOREIGN KEY (`jazon`) REFERENCES `jarmu` (`jazon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
