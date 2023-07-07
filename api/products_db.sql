-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 10:12:05
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `products_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `id_posi` int(11) NOT NULL,
  `image_posi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_prod` int(11) NOT NULL,
  `name_prod` varchar(250) NOT NULL,
  `description_prod` text NOT NULL,
  `price_prod` float NOT NULL,
  `defaultImage_prod` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_prod`, `name_prod`, `description_prod`, `price_prod`, `defaultImage_prod`) VALUES
(1, 'Teste', 'teste de produto', 200, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products__positions`
--

CREATE TABLE `products__positions` (
  `id_prod` int(11) NOT NULL,
  `id_posi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variants`
--

CREATE TABLE `variants` (
  `id_vari` int(11) NOT NULL,
  `image_vari` varchar(200) NOT NULL,
  `quantity_vari` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variants__products`
--

CREATE TABLE `variants__products` (
  `id_vari` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id_posi`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `products__positions`
--
ALTER TABLE `products__positions`
  ADD PRIMARY KEY (`id_prod`,`id_posi`),
  ADD KEY `id_posi` (`id_posi`);

--
-- Indices de la tabla `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id_vari`);

--
-- Indices de la tabla `variants__products`
--
ALTER TABLE `variants__products`
  ADD PRIMARY KEY (`id_vari`,`id_prod`),
  ADD KEY `id_produ` (`id_prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `id_posi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `variants`
--
ALTER TABLE `variants`
  MODIFY `id_vari` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products__positions`
--
ALTER TABLE `products__positions`
  ADD CONSTRAINT `id_posi` FOREIGN KEY (`id_posi`) REFERENCES `positions` (`id_posi`),
  ADD CONSTRAINT `id_prod` FOREIGN KEY (`id_prod`) REFERENCES `products` (`id_prod`);

--
-- Filtros para la tabla `variants__products`
--
ALTER TABLE `variants__products`
  ADD CONSTRAINT `id_produ` FOREIGN KEY (`id_prod`) REFERENCES `products` (`id_prod`),
  ADD CONSTRAINT `id_vari` FOREIGN KEY (`id_vari`) REFERENCES `variants` (`id_vari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
