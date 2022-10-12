-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2022 a las 05:12:18
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vonoto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estancia`
--

CREATE TABLE `estancia` (
  `id_estancia` int(11) NOT NULL,
  `tiempo_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `tiempo_fin` datetime DEFAULT NULL,
  `coste_estancia` decimal(6,2) DEFAULT NULL,
  `id_veiculo` int(11) NOT NULL,
  `estatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estancia`
--

INSERT INTO `estancia` (`id_estancia`, `tiempo_inicio`, `tiempo_fin`, `coste_estancia`, `id_veiculo`, `estatus`) VALUES
(1, '2022-10-09 16:04:07', NULL, '5.00', 1, 1),
(2, '2022-10-09 16:14:33', NULL, '5.00', 1, 1),
(3, '2022-10-09 16:14:36', NULL, '5.00', 1, 1),
(4, '2022-10-09 16:33:26', NULL, '5.00', 1, 1),
(5, '2022-10-09 16:34:30', NULL, NULL, 1, 1),
(6, '2022-10-09 16:34:32', '2022-10-09 17:13:56', NULL, 1, 1),
(7, '2022-10-09 16:34:54', '2022-10-09 19:09:59', '7.45', 1, 1),
(8, '2022-10-09 16:34:54', NULL, NULL, 1, 1),
(9, '2022-10-09 17:02:35', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_veiculo`
--

CREATE TABLE `tipo_veiculo` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `importe` decimal(6,2) NOT NULL DEFAULT 0.00,
  `estatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_veiculo`
--

INSERT INTO `tipo_veiculo` (`id_tipo_veiculo`, `tipo`, `descripcion`, `importe`, `estatus`) VALUES
(1, 'oficiales', 'oficial', '0.05', 1),
(2, 'residentes', 'pagan a final de mes', '0.05', 1),
(3, 'no residentes', 'pagan a la salida del estacionamiento', '0.05', 1),
(4, 'editado', 'editado', '6.66', 1),
(5, 'prueba', 'prueba', '0.20', 0),
(6, 'prueba', 'prueba', '0.20', 0),
(7, 'prueba', 'prueba', '0.20', 0),
(8, 'editado', 'editado', '6.66', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veiculo`
--

CREATE TABLE `veiculo` (
  `id_veiculo` int(11) NOT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `estatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `veiculo`
--

INSERT INTO `veiculo` (`id_veiculo`, `placa`, `id_tipo_veiculo`, `estatus`) VALUES
(1, '777777', 1, 1),
(2, 'wlu9489', 1, 0),
(3, '000071', 1, 0),
(4, 'hola3', 2, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD PRIMARY KEY (`id_estancia`),
  ADD KEY `id_veiculo` (`id_veiculo`);

--
-- Indices de la tabla `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  ADD PRIMARY KEY (`id_tipo_veiculo`);

--
-- Indices de la tabla `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id_veiculo`),
  ADD KEY `id_tipo_veiculo` (`id_tipo_veiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estancia`
--
ALTER TABLE `estancia`
  MODIFY `id_estancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  MODIFY `id_tipo_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD CONSTRAINT `estancia_ibfk_1` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`);

--
-- Filtros para la tabla `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id_tipo_veiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
