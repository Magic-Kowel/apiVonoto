-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2022 a las 04:51:27
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
(1, '2022-10-10 22:15:19', '2022-10-12 21:09:39', '140.60', 1, 0),
(2, '2022-10-10 22:47:15', '2022-10-12 21:07:23', '0.15', 1, 0),
(3, '2022-10-10 21:51:29', '2022-10-10 22:54:09', '3.00', 1, 0),
(4, '2022-10-10 22:52:41', '2022-10-10 23:03:19', '0.00', 1, 0),
(5, '2022-10-10 23:51:42', '2022-10-10 23:51:46', '0.00', 1, 0),
(6, '2022-10-10 23:52:29', '2022-10-10 23:52:31', '0.00', 1, 0),
(7, '2022-10-10 23:56:32', '2022-10-10 23:56:33', '0.00', 1, 0),
(8, '2022-10-12 00:36:22', '2022-10-12 00:36:29', '0.00', 3, 1),
(9, '2022-10-12 21:11:01', '2022-10-12 21:11:08', '0.00', 3, 1),
(10, '2022-10-12 21:22:22', '2022-10-12 21:27:38', '0.00', 1, 1),
(11, '2022-10-12 21:36:42', '2022-10-12 21:44:11', '0.00', 1, 1);

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
(4, 'editado', 'editado', '6.66', 1);

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
(1, '1234567', 1, 1),
(2, '189651', 3, 0),
(3, '0000007', 2, 1);

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
  MODIFY `id_estancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  MODIFY `id_tipo_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
