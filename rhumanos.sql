-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2015 a las 18:30:19
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `rhumanos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `puesto` varchar(2) NOT NULL,
  PRIMARY KEY (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE IF NOT EXISTS `puestos` (
  `puesto` varchar(2) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`puesto`, `descripcion`) VALUES
('01', 'Gerente'),
('02', 'Jefe de Departamento'),
('03', 'Cajero/a'),
('04', 'Secretario/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `password`, `tipo`) VALUES
('ACER01', ' JUAN JOSE PEREZ LEON', 'a94652aa97c7211ba8954dd15a3cf838', 'I'),
('ADMIN', 'VICTOR CARREÑO', 'f153e006dee06147be85bbb758c6ce5c', 'A'),
('INV1', 'INVITADO', '81dc9bdb52d04dc20036dbd8313ed055', 'I'),
('JUN05', 'JEFATURA', '81dc9bdb52d04dc20036dbd8313ed055', 'I');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
