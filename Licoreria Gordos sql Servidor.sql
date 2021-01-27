-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-07-2020 a las 04:19:40
-- Versión del servidor: 8.0.20
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `enrique`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `descripcion_categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `dni_cli` varchar(8) DEFAULT NULL,
  `nombre_cli` varchar(100) DEFAULT NULL,
  `apellido_cli` varchar(100) DEFAULT NULL,
  `direccion_cli` varchar(100) DEFAULT NULL,
  `telefono_cli` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `dni_empleado` varchar(8) DEFAULT NULL,
  `nombre_empleado` varchar(100) DEFAULT NULL,
  `apellido_empleado` varchar(100) DEFAULT NULL,
  `direccion_empleado` varchar(100) DEFAULT NULL,
  `telefono_empleado` varchar(9) DEFAULT NULL,
  `rango_empleado` varchar(1) DEFAULT NULL,
  `usuario_empleado` varchar(100) DEFAULT NULL,
  `password_empleado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `dni_empleado`, `nombre_empleado`, `apellido_empleado`, `direccion_empleado`, `telefono_empleado`, `rango_empleado`, `usuario_empleado`, `password_empleado`) VALUES
(1, '73298769', 'enrique ', 'miller', 'las rosas N1', '923082432', '0', 'enmi', '1122');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `precio_compra` decimal(10,0) DEFAULT NULL,
  `precio_venta` decimal(10,0) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `id_categoria` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto2`
--

CREATE TABLE `producto2` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `precio_compra` decimal(10,0) DEFAULT NULL,
  `precio_venta` decimal(10,0) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `id_categoria` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_detalle_venta` (`id_venta`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `producto2`
--
ALTER TABLE `producto2`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_venta_cliente` (`id_cliente`),
  ADD KEY `fk_venta_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto2`
--
ALTER TABLE `producto2`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
