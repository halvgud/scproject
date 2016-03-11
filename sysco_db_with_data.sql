-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2016 a las 02:39:01
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sys_co_db`
--
DROP DATABASE `sys_co_db`;
CREATE DATABASE IF NOT EXISTS `sys_co_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `sys_co_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` decimal(6,3) DEFAULT NULL,
  `talla` decimal(6,3) DEFAULT NULL,
  `altura` decimal(6,3) DEFAULT NULL,
  `frecuencia_respiratoria` int(11) DEFAULT NULL,
  `frecuencia_cardiaca` int(11) DEFAULT NULL,
  `temperatura` decimal(6,3) DEFAULT NULL,
  `asistencia` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_diagnostico` int(11) DEFAULT NULL COMMENT 'este campo sirve para relacionar con la tabla de descripciones y asi obtener la descripcion del diagnostico de las enfermeras',
  `id_proceso` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `fecha`, `id_usuario_creacion`, `id_empleado`, `peso`, `talla`, `altura`, `frecuencia_respiratoria`, `frecuencia_cardiaca`, `temperatura`, `asistencia`, `fecha_inicio`, `fecha_fin`, `id_diagnostico`, `id_proceso`) VALUES
(1, '2016-02-17 22:33:11', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:15:00', '2016-02-18 10:25:00', NULL, NULL),
(2, '2016-02-17 22:34:27', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:25:00', '2016-02-18 10:35:00', 5, NULL),
(3, '2016-02-23 19:33:00', 1, '1', '2.000', '2.000', '2.000', 2, 2, '2.000', 'A', '2016-02-24 18:50:00', '2016-02-24 19:00:00', 3, NULL),
(4, '2016-02-24 21:42:46', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-25 22:45:00', '2016-02-25 22:50:00', 3, NULL),
(5, '2016-02-24 21:43:05', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-25 22:50:00', '2016-02-25 23:00:00', 4, NULL),
(6, '2016-02-24 22:07:08', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'A', '2016-02-24 19:05:00', '2016-02-24 19:15:00', 4, NULL),
(7, '2016-02-24 22:48:53', 1, '2', '2.000', '2.000', '2.000', 2, 2, '2.000', 'A', '2016-02-24 19:20:00', '2016-02-24 19:30:00', 3, NULL),
(8, '2016-03-02 18:09:25', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'A', '2016-03-02 18:15:00', '2016-03-02 18:25:00', 3, NULL),
(9, '2016-03-02 19:22:29', 1, '2', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-03-02 19:30:00', '2016-03-02 19:40:00', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

DROP TABLE IF EXISTS `descripcion`;
CREATE TABLE IF NOT EXISTS `descripcion` (
  `id_descripcion` int(11) NOT NULL,
  `tipo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `descripcion`
--

INSERT INTO `descripcion` (`id_descripcion`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'area', 'prueba', 'A'),
(2, 'depatrtamento', 'prueba departamento', 'A'),
(3, 'diagnostico', 'Gripa', 'A'),
(4, 'diagnostico', 'Dermatitis', 'A'),
(5, 'diagnostico', 'Mialgia', 'A'),
(6, 'turno', 'matutino', 'A'),
(7, 'turno', 'vespertino', 'A'),
(8, 'incapacidad_entrega', 'Atrasada', 'A'),
(9, 'incapacidad_entrega', 'Normal', 'A'),
(10, 'incapacidad_clasificacion', 'Inicial', 'A'),
(11, 'incapacidad_clasificacion', 'Subsecuente', 'A'),
(12, 'incapacidad_clasificacion', 'Recaida', 'A'),
(13, 'incapacidad_ramo_seguro', 'Riesgo de Trabajo', 'A'),
(14, 'incapacidad_ramo_seguro', 'Enfermedad', 'A'),
(15, 'incapacidad_ramo_seguro', 'Maternidad Prenatal', 'A'),
(16, 'incapacidad_ramo_seguro', 'Maternidad Posnatal', 'A'),
(17, 'incapacidad_ramo_seguro', 'Maternidad Enlace', 'A'),
(18, 'memo_solicita', 'Enfermeria', 'A'),
(19, 'memo_solicita', 'Relaciones Laborales', 'A'),
(20, 'pase_autorizacion', 'Relaciones Laborales', 'A'),
(21, 'pase_autorizacion', 'Departamento Medico', 'A'),
(22, 'expediente_ramo_seguro', 'Enfermedad General', 'A'),
(23, 'expediente_ramo_seguro', 'Enfermedad Profesional', 'A'),
(24, 'expediente_ramo_seguro', 'Accidente de Trabajo', 'A'),
(25, 'expediente_ramo_seguro', 'Incidente', 'A'),
(26, 'expediente_otras_indicaciones', 'Laboratorio', 'A'),
(27, 'expediente_otras_indicaciones', 'Fisoterapia', 'A'),
(28, 'expediente_otras_indicaciones', 'Cambio de Proceso(TEMPORAL)', 'A'),
(29, 'expediente_otras_indicaciones', 'Cambio de Area(TEMPORAL)', 'A'),
(30, 'expediente_otras_indicaciones', 'Cambio de Area(DEFINITIVO)', 'A'),
(31, 'expediente_pase_imss', 'SI', 'A'),
(32, 'expediente_pase_imss', 'NO', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `materno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `paterno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nss` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `materno`, `paterno`, `sexo`, `id_turno`, `id_area`, `id_departamento`, `estado`, `nss`) VALUES
('1', 'roberto', 'santelices', 'rivera', 'M', 6, 1, 2, 'A', '9912373627183'),
('2', 'Mariano', 'Miramontes', 'Gutierrez', 'M', 6, 1, 2, 'A', '9912373627186');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

DROP TABLE IF EXISTS `expediente`;
CREATE TABLE IF NOT EXISTS `expediente` (
  `id_expediente` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` decimal(6,3) DEFAULT NULL,
  `talla` decimal(6,3) DEFAULT NULL,
  `altura` decimal(6,3) DEFAULT NULL,
  `frecuencia_respiratoria` int(11) DEFAULT NULL,
  `frecuencia_cardiaca` int(11) DEFAULT NULL,
  `temperatura` decimal(6,3) DEFAULT NULL,
  `imc` decimal(6,3) DEFAULT NULL,
  `interrogatorio` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `exploracion_fisica` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tratamiento` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `diagnostico` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ramo_seguro` int(11) DEFAULT NULL,
  `id_otras_indicaciones` int(11) DEFAULT NULL,
  `id_pase_imss` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`id_expediente`, `fecha`, `id_usuario_creacion`, `id_empleado`, `peso`, `talla`, `altura`, `frecuencia_respiratoria`, `frecuencia_cardiaca`, `temperatura`, `imc`, `interrogatorio`, `exploracion_fisica`, `tratamiento`, `diagnostico`, `id_ramo_seguro`, `id_otras_indicaciones`, `id_pase_imss`, `id_proceso`) VALUES
(1, '2016-02-24 23:39:46', 1, '1', '1.000', '1.000', NULL, NULL, 1, '1.000', '1.000', 'lo que sea', 'aksdaksdjasjdajsdklj|', 'asdaldÃ±asdÃ±asdÃ±lasldÃ±kasldlÃ±askd', '4', 22, 27, 32, NULL),
(2, '2016-02-24 23:48:50', 1, '1', '62.500', '32.400', '175.400', 12, 12, '37.500', '24.300', 'estamos haciendo una pruebba para guardar la consulta 6 de Roberto', 'Este texto es una prueba de lo que se guardarÃ¡ en una exploraciÃ³n fisica', 'Este texto es una prueba de lo que se guardarÃ¡ en una tratamiento recomendado por el doctor', '3', 23, 28, 31, NULL),
(3, '2016-02-24 23:51:13', 1, '2', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000', 'asdasd', '1', '1', '5', 22, 28, 31, NULL),
(7, '2016-03-02 20:36:17', 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000', '1', '1', '1', '4', 22, 27, 32, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

DROP TABLE IF EXISTS `incapacidad`;
CREATE TABLE IF NOT EXISTS `incapacidad` (
  `id_incapacidad` int(11) NOT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `folio` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dias_autorizados` int(11) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `id_entrega` int(11) DEFAULT NULL,
  `id_clasificacion` int(11) DEFAULT NULL,
  `id_ramo_seguro` int(11) DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`id_incapacidad`, `id_empleado`, `folio`, `dias_autorizados`, `inicio`, `fin`, `id_entrega`, `id_clasificacion`, `id_ramo_seguro`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, '1', '123', 2, '2016-02-17', '2016-02-19', 8, 10, 13, 1, '2016-02-17 23:20:50'),
(2, '1', '123asd', 2, '2016-02-02', '2016-02-27', 8, 10, 14, 1, '2016-02-18 19:21:37'),
(3, '1', 'des12', 1, '2016-02-18', '2016-02-19', 8, 11, 13, 1, '2016-02-18 19:22:42'),
(4, '1', 'test prueba', 2, '2016-02-23', '2016-02-25', 8, 10, 13, 1, '2016-02-23 19:49:55'),
(5, '1', 'sdfsdf', 2, '2016-03-07', '2016-03-09', 9, 10, 14, 1, '2016-03-07 22:08:53'),
(6, '2', 'sdfsdf', 2, '2016-03-07', '2016-03-09', 9, 11, 15, 1, '2016-03-07 22:09:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
CREATE TABLE IF NOT EXISTS `medicamento` (
  `id_medicamento` int(11) NOT NULL,
  `clave` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cantidad_minima` int(11) DEFAULT NULL,
  `id_presentacion_entrada` int(11) DEFAULT NULL,
  `id_presentacion_salida` int(11) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `clave`, `descripcion`, `precio`, `cantidad`, `cantidad_minima`, `id_presentacion_entrada`, `id_presentacion_salida`, `fecha_alta`, `fecha_baja`, `estado`, `id_usuario_creacion`) VALUES
(1, '705', 'Diclofenaco (20 tabletas 75 mg)', '40', 228, NULL, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(2, '41251', 'ketorolaco (25 tabletas 10 mg) ', '120', 205, NULL, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(3, 'PA500', 'Paracetamol (20 pastillas 500 mg)', '20', 342, NULL, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(4, '13123123', 'test the fucking medicamento catalog', '123', 12, NULL, 0, 0, '2016-02-18 00:00:00', '2016-02-18 00:00:00', 'A', 1),
(5, 'testingsku', 'PruebaInsercion', '120', 20, NULL, 2, 1, '2016-02-18 00:00:00', '2016-10-19 00:00:00', 'I', 1),
(6, 'qwe', 'qwe', '12', 12, NULL, 2, 2, '2016-02-02 00:00:00', '2016-02-03 00:00:00', 'I', 1),
(7, '131231231', 'llesoad', '231', 59, NULL, 2, 1, '2016-02-18 00:00:00', '2018-08-10 00:00:00', 'A', 0),
(9, 'prueba', 'prueba', '200', 443, NULL, 2, 1, '2016-02-23 00:00:00', '2018-02-23 00:00:00', 'I', NULL),
(10, 'prueba2', 'prueba2', '30', 599, NULL, 2, 1, '2016-02-23 00:00:00', '2018-02-09 00:00:00', 'A', 0),
(11, 'prueba3 mod', 'Cambio de descripcion', '35', 299, NULL, 3, 1, '2016-02-23 00:00:00', '2018-04-12 00:00:00', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memo`
--

DROP TABLE IF EXISTS `memo`;
CREATE TABLE IF NOT EXISTS `memo` (
  `id_memo` int(11) NOT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_solicita` int(11) DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `respetar` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motivo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `supervisor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1326 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `memo`
--

INSERT INTO `memo` (`id_memo`, `id_empleado`, `id_solicita`, `semana`, `respetar`, `motivo`, `supervisor`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, '1', 18, 1, 'respetar lo que sea', 'no quiso ir', 'Yo merengues', 1, '2016-02-17 23:43:34'),
(2, '1', 19, 2, 'sus derechos', 'no lo respetaron y lloro', 'su mama', 1, '2016-02-17 23:44:10'),
(3, '1', 19, 54, '1', '1', '1', 1, '2016-02-18 19:25:22'),
(4, '1', 18, 26, 'nada', 'no quiere jalar', 'don teofilito', 1, '2016-02-23 19:51:19'),
(5, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 23:04:00'),
(6, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(7, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(8, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(9, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(10, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(11, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(12, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(13, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(14, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(15, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(16, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(17, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(18, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(19, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(20, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(21, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(22, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(23, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(24, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(25, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(26, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(27, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(28, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(29, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(30, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(31, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(32, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(33, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(34, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(35, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(36, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(37, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(38, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(39, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(40, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(41, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(42, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(43, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(44, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(45, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(46, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(47, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(48, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(49, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(50, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(51, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(52, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(53, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(54, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(55, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(56, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(57, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(58, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(59, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(60, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(61, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(62, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(63, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(64, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(65, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(66, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(67, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(68, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(69, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(70, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(71, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(72, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(73, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(74, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(75, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(76, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(77, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(78, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(79, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(80, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(81, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(82, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(83, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(84, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(85, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(86, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(87, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(88, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(89, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(90, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(91, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(92, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(93, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(94, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(95, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(96, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(97, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(98, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(99, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(100, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(101, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(102, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(103, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(104, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(105, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(106, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(107, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(108, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(109, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(110, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(111, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(112, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(113, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(114, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(115, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(116, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(117, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(118, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(119, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(120, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(121, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(122, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(123, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(124, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(125, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(126, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(127, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(128, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(129, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(130, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(131, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(132, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(133, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(134, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(135, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(136, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(137, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-02-18 19:25:22'),
(138, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(139, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(140, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(141, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(142, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(143, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(144, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(145, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(146, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(147, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(148, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(149, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(150, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(151, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(152, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(153, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(154, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(155, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(156, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(157, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(158, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(159, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(160, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(161, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(162, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(163, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(164, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(165, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(166, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(167, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(168, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(169, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(170, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(171, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(172, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(173, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(174, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(175, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(176, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(177, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(178, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(179, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(180, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(181, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(182, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(183, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(184, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(185, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(186, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(187, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(188, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(189, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(190, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(191, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(192, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(193, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(194, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(195, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(196, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(197, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(198, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(199, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(200, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(201, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(202, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(203, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(204, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(205, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(206, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(207, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(208, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(209, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(210, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(211, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(212, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(213, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(214, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(215, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(216, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(217, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(218, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(219, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(220, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(221, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(222, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(223, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(224, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(225, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(226, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(227, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(228, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(229, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(230, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(231, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(232, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(233, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(234, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(235, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(236, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(237, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(238, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(239, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(240, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(241, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(242, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(243, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(244, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(245, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(246, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(247, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(248, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(249, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(250, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(251, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(252, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(253, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(254, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(255, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(256, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(257, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(258, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(259, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(260, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(261, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(262, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(263, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(264, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(265, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(266, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(267, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(268, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(269, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(270, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(271, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(272, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(273, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(274, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(275, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(276, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(277, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(278, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(279, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(280, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(281, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(282, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(283, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(284, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(285, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(286, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(287, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(288, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(289, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(290, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(291, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(292, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(293, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(294, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(295, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(296, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(297, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(298, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(299, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(300, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(301, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(302, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(303, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(304, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(305, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(306, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(307, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(308, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(309, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(310, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(311, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(312, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(313, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(314, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(315, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(316, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(317, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(318, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(319, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(320, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(321, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(322, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(323, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(324, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(325, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(326, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(327, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(328, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(329, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(330, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(331, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(332, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(333, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(334, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(335, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(336, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(337, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(338, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(339, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(340, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(341, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(342, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(343, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(344, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(345, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(346, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(347, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(348, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(349, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(350, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(351, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(352, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(353, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(354, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(355, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(356, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(357, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(358, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(359, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(360, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(361, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(362, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(363, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(364, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(365, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(366, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(367, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(368, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(369, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(370, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(371, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(372, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(373, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(374, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(375, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(376, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(377, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(378, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(379, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(380, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(381, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(382, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(383, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(384, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(385, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(386, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(387, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(388, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(389, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(390, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(391, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(392, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(393, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(394, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(395, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(396, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(397, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(398, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(399, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(400, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(401, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(402, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(403, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(404, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(405, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(406, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(407, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(408, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(409, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(410, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(411, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(412, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(413, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(414, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(415, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(416, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(417, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(418, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(419, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(420, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(421, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(422, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(423, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(424, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(425, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(426, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(427, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(428, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(429, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(430, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(431, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(432, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(433, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(434, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(435, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(436, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(437, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(438, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(439, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(440, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(441, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(442, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(443, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(444, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(445, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(446, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(447, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(448, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(449, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(450, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(451, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(452, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(453, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(454, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(455, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(456, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(457, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(458, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(459, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(460, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(461, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(462, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(463, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(464, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(465, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(466, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(467, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(468, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(469, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(470, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(471, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(472, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(473, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(474, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(475, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(476, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(477, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(478, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(479, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(480, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(481, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(482, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(483, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(484, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(485, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(486, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(487, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(488, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(489, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(490, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(491, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(492, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(493, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(494, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(495, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(496, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(497, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(498, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(499, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(500, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(501, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(502, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(503, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(504, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(505, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(506, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(507, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(508, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(509, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(510, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(511, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(512, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(513, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(514, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(515, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(516, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(517, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(518, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(519, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(520, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(521, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(522, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(523, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(524, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(525, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(526, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(527, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(528, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(529, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(530, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(531, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(532, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(533, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(534, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(535, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(536, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(537, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(538, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(539, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(540, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(541, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(542, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(543, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(544, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(545, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(546, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(547, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(548, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(549, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(550, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(551, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(552, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(553, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(554, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(555, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(556, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(557, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(558, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(559, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(560, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(561, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(562, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(563, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(564, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(565, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(566, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(567, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(568, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(569, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(570, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(571, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(572, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(573, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(574, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(575, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(576, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(577, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(578, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(579, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(580, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(581, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(582, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(583, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(584, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(585, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(586, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(587, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(588, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(589, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(590, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(591, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(592, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(593, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(594, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(595, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(596, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(597, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(598, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(599, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(600, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(601, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(602, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(603, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(604, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(605, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(606, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(607, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(608, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(609, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(610, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(611, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(612, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(613, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(614, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(615, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(616, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(617, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(618, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(619, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(620, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(621, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(622, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(623, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(624, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(625, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(626, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(627, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(628, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(629, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(630, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(631, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(632, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(633, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(634, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(635, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(636, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(637, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(638, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(639, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(640, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(641, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(642, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(643, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(644, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(645, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(646, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(647, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(648, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(649, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(650, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(651, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(652, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(653, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(654, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(655, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(656, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(657, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(658, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(659, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(660, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(661, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(662, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(663, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(664, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(665, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(666, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(667, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(668, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(669, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(670, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(671, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(672, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(673, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(674, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(675, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(676, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(677, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(678, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(679, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(680, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(681, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(682, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(683, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(684, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(685, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(686, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(687, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(688, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(689, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(690, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(691, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(692, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(693, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(694, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(695, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(696, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(697, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(698, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(699, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(700, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(701, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(702, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(703, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(704, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(705, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(706, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(707, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(708, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(709, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(710, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(711, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(712, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(713, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(714, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(715, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(716, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(717, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(718, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(719, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(720, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(721, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(722, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(723, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(724, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(725, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(726, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(727, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(728, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(729, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(730, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(731, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(732, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(733, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(734, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(735, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(736, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(737, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(738, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(739, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(740, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(741, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(742, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(743, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(744, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22');
INSERT INTO `memo` (`id_memo`, `id_empleado`, `id_solicita`, `semana`, `respetar`, `motivo`, `supervisor`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(745, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(746, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(747, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(748, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(749, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(750, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(751, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(752, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(753, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(754, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(755, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(756, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(757, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(758, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(759, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(760, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(761, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(762, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(763, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(764, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(765, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(766, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(767, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(768, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(769, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(770, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(771, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(772, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(773, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(774, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(775, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(776, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(777, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(778, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(779, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(780, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(781, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(782, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(783, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(784, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(785, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(786, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(787, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(788, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(789, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(790, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(791, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(792, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(793, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(794, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(795, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(796, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(797, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(798, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(799, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(800, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(801, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(802, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(803, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(804, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(805, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(806, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(807, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(808, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(809, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(810, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(811, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(812, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(813, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(814, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(815, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(816, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(817, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(818, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(819, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(820, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(821, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(822, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(823, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(824, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(825, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(826, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(827, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(828, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(829, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(830, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(831, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(832, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(833, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(834, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(835, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(836, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(837, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(838, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(839, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(840, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(841, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(842, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(843, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(844, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(845, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(846, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(847, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(848, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(849, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(850, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(851, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(852, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(853, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(854, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(855, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(856, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(857, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(858, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(859, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(860, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(861, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(862, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(863, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(864, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(865, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(866, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(867, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(868, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(869, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(870, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(871, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(872, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(873, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(874, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(875, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(876, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(877, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(878, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(879, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(880, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(881, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(882, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(883, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(884, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(885, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(886, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(887, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(888, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(889, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(890, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(891, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(892, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(893, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(894, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(895, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(896, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(897, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(898, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(899, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(900, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(901, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(902, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(903, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(904, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(905, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(906, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(907, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(908, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(909, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(910, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(911, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(912, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(913, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(914, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(915, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(916, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(917, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(918, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(919, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(920, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(921, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(922, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(923, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(924, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(925, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(926, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(927, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(928, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(929, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(930, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(931, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(932, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(933, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(934, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(935, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(936, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(937, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(938, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(939, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(940, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(941, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(942, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(943, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(944, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(945, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(946, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(947, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(948, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(949, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(950, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(951, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(952, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(953, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(954, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(955, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(956, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(957, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(958, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(959, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(960, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(961, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(962, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(963, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(964, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(965, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(966, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(967, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(968, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(969, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(970, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(971, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(972, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(973, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(974, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(975, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(976, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(977, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(978, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(979, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(980, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(981, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(982, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(983, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(984, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(985, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(986, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(987, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(988, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(989, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(990, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(991, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(992, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(993, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(994, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(995, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(996, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(997, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(998, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(999, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1000, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1001, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1002, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1003, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1004, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1005, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1006, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1007, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1008, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1009, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1010, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1011, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1012, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1013, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1014, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1015, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1016, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1017, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1018, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1019, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1020, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1021, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1022, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1023, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1024, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1025, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1026, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1027, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1028, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1029, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1030, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1031, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1032, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1033, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1034, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1035, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1036, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1037, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1038, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1039, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1040, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1041, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1042, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1043, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1044, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1045, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1046, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1047, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1048, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1049, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1050, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1051, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1052, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1053, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1054, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1055, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1056, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1057, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1058, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1059, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1060, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1061, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1062, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1063, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1064, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1065, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1066, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1067, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1068, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1069, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1070, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1071, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1072, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1073, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1074, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1075, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1076, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1077, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1078, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1079, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1080, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1081, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1082, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1083, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1084, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1085, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1086, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1087, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1088, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1089, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1090, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1091, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1092, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1093, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1094, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1095, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1096, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1097, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1098, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1099, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1100, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1101, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1102, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1103, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1104, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1105, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1106, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1107, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1108, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1109, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1110, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1111, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1112, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1113, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1114, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1115, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1116, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1117, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1118, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1119, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1120, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1121, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1122, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1123, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1124, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1125, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1126, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1127, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1128, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1129, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1130, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1131, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1132, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1133, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1134, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1135, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1136, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1137, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1138, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1139, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1140, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1141, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1142, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1143, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1144, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1145, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1146, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1147, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1148, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1149, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1150, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1151, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1152, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1153, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1154, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1155, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1156, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1157, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1158, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1159, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1160, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1161, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1162, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1163, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1164, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1165, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1166, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1167, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1168, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1169, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1170, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1171, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1172, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1173, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1174, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1175, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1176, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1177, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1178, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1179, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1180, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1181, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1182, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1183, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1184, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1185, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1186, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1187, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1188, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1189, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1190, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1191, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1192, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1193, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1194, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1195, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1196, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1197, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1198, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1199, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1200, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1201, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1202, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1203, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1204, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1205, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1206, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1207, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1208, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1209, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1210, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1211, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1212, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1213, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1214, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1215, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1216, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1217, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1218, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1219, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1220, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1221, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1222, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1223, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1224, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1225, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1226, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1227, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1228, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1229, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1230, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1231, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1232, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1233, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1234, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1235, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1236, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1237, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1238, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1239, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1240, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1241, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1242, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1243, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1244, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1245, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1246, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1247, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1248, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1249, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1250, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1251, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1252, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1253, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1254, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1255, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1256, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1257, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1258, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1259, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1260, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1261, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1262, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1263, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1264, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1265, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1266, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1267, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1268, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1269, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1270, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1271, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1272, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1273, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1274, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1275, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1276, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1277, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1278, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1279, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1280, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1281, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1282, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1283, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1284, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1285, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1286, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1287, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1288, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1289, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1290, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1291, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1292, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1293, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1294, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1295, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1296, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1297, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1298, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1299, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1300, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1301, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1302, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1303, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1304, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1305, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1306, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1307, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1308, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1309, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1310, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1311, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1312, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1313, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1314, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1315, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1316, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1317, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1318, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1319, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1320, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1321, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1322, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1323, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1324, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22'),
(1325, '1', 18, 2, 'algo', 'algo', 'algo', 1, '2016-03-02 19:25:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pase_salida`
--

DROP TABLE IF EXISTS `pase_salida`;
CREATE TABLE IF NOT EXISTS `pase_salida` (
  `id_pase` int(11) NOT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pase_salida`
--

INSERT INTO `pase_salida` (`id_pase`, `id_empleado`, `motivo`, `estado`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, '1', 'porque andaba crudo', 'A', 1, '2016-03-05'),
(2, '2', 'sdfdfsdfsdf', 'A', 1, '2016-03-07'),
(3, '1', 'sdfsdf', 'A', 1, '2016-03-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `descripcion`) VALUES
(1, 'agregarUsuario'),
(2, 'modificarUsuario'),
(3, 'modificarPermisos'),
(4, 'agregarConsulta'),
(5, 'agendarVisita'),
(6, 'paseDeSalida'),
(7, 'nuevoMedicamento'),
(8, 'editarMedicamento'),
(9, 'guardarIncapacidad'),
(10, 'guardarMemo'),
(11, 'leerReportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_medicamento`
--

DROP TABLE IF EXISTS `presentacion_medicamento`;
CREATE TABLE IF NOT EXISTS `presentacion_medicamento` (
  `id_presentacion` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `presentacion_medicamento`
--

INSERT INTO `presentacion_medicamento` (`id_presentacion`, `descripcion`, `cantidad`, `estado`) VALUES
(1, '1 UNIDAD', 1, 'A'),
(2, 'CAJA CON 20 TABLETAS', 20, 'A'),
(3, 'CAJA CON 25 TABLETAS', 25, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_medicamento_tablas`
--

DROP TABLE IF EXISTS `relacion_medicamento_tablas`;
CREATE TABLE IF NOT EXISTS `relacion_medicamento_tablas` (
  `id_tabla` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion_tabla` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `relacion_medicamento_tablas`
--

INSERT INTO `relacion_medicamento_tablas` (`id_tabla`, `id_medicamento`, `cantidad`, `descripcion_tabla`, `fecha`) VALUES
(1, 0, 1, 'visita', '2016-03-02 19:12:00'),
(7, 2, 2, 'expediente', '2016-03-02 20:36:17'),
(9, 1, 2, 'consulta', '2016-03-02 19:22:29'),
(16, 1, 1, 'visita', '2016-03-02 19:13:00'),
(17, 1, 5, 'visita', '2016-03-02 19:16:00'),
(18, 1, 50, 'visita', '2016-03-02 21:58:00'),
(18, 2, 80, 'visita', '2016-03-02 21:58:00'),
(18, 3, 50, 'visita', '2016-03-02 21:58:00'),
(18, 7, 1, 'visita', '2016-03-02 21:58:00'),
(18, 9, 1, 'visita', '2016-03-02 21:58:00'),
(18, 10, 1, 'visita', '2016-03-02 21:58:00'),
(18, 11, 1, 'visita', '2016-03-02 21:58:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_rol_permiso`
--

DROP TABLE IF EXISTS `relacion_rol_permiso`;
CREATE TABLE IF NOT EXISTS `relacion_rol_permiso` (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `relacion_rol_permiso`
--

INSERT INTO `relacion_rol_permiso` (`id_rol`, `id_permiso`, `estado`) VALUES
(1, 1, 'A'),
(1, 2, 'A'),
(1, 3, 'A'),
(1, 4, 'A'),
(1, 5, 'A'),
(1, 6, 'A'),
(1, 7, 'A'),
(1, 8, 'A'),
(1, 9, 'A'),
(1, 10, 'A'),
(1, 11, 'A'),
(2, 1, 'I'),
(2, 2, 'I'),
(2, 3, 'I'),
(2, 4, 'I'),
(2, 5, 'I'),
(2, 6, 'A'),
(2, 7, 'I'),
(2, 8, 'I'),
(2, 9, 'I'),
(2, 10, 'I'),
(2, 11, 'A'),
(3, 1, 'I'),
(3, 2, 'I'),
(3, 3, 'I'),
(3, 4, 'A'),
(3, 5, 'A'),
(3, 6, 'A'),
(3, 7, 'A'),
(3, 8, 'I'),
(3, 9, 'A'),
(3, 10, 'A'),
(3, 11, 'A'),
(4, 1, 'I'),
(4, 2, 'I'),
(4, 3, 'I'),
(4, 4, 'I'),
(4, 5, 'I'),
(4, 6, 'I'),
(4, 7, 'I'),
(4, 8, 'I'),
(4, 9, 'I'),
(4, 10, 'I'),
(4, 11, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Medicos'),
(3, 'Enfermeria'),
(4, 'Administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rol` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `rol`, `estado`, `fecha_alta`, `id_usuario_creacion`, `fecha_baja`) VALUES
(1, 'rafa', '123', '1', 'A', '2016-02-08 19:54:00', 1, NULL),
(2, 'test', 'test', '2', 'A', '2016-02-23 19:55:55', 1, NULL),
(3, 'test2', 'test2', '3', 'A', '2016-02-23 19:58:39', 1, NULL),
(4, 'admin', 'admin', '4', 'A', '2016-02-24 21:25:34', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

DROP TABLE IF EXISTS `visita`;
CREATE TABLE IF NOT EXISTS `visita` (
  `id_visita` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_diagnostico` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_visita`, `fecha`, `id_empleado`, `id_usuario_creacion`, `id_diagnostico`, `id_proceso`) VALUES
(1, '2016-02-17 21:00:00', '1', 1, 3, NULL),
(2, '2016-02-23 20:00:00', '1', 1, 4, NULL),
(3, '2016-02-25 20:14:00', '2', 1, 4, NULL),
(4, '2016-02-25 22:49:00', '2', 1, 3, NULL),
(5, '2016-03-01 21:35:00', '1', 1, 3, NULL),
(6, '2016-03-01 21:35:00', '1', 1, 4, NULL),
(7, '2016-03-01 21:35:00', '2', 1, 5, NULL),
(8, '2016-03-01 21:35:00', '2', 1, 3, NULL),
(9, '2016-03-08 21:35:00', '1', 1, 5, NULL),
(10, '2016-03-08 21:35:00', '1', 1, 5, NULL),
(11, '2016-03-01 21:36:00', '2', 1, 4, NULL),
(12, '2016-03-08 21:36:00', '1', 1, 4, NULL),
(13, '2016-03-08 21:36:00', '1', 1, 4, NULL),
(15, '2016-03-02 19:12:00', '1', 1, 3, NULL),
(16, '2016-03-02 19:13:00', '2', 1, 3, NULL),
(17, '2016-03-02 19:16:00', '1', 1, 3, NULL),
(18, '2016-03-02 21:58:00', '2', 1, 4, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  ADD PRIMARY KEY (`id_descripcion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`id_expediente`);

--
-- Indices de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD PRIMARY KEY (`id_incapacidad`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `memo`
--
ALTER TABLE `memo`
  ADD PRIMARY KEY (`id_memo`);

--
-- Indices de la tabla `pase_salida`
--
ALTER TABLE `pase_salida`
  ADD PRIMARY KEY (`id_pase`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `presentacion_medicamento`
--
ALTER TABLE `presentacion_medicamento`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `relacion_medicamento_tablas`
--
ALTER TABLE `relacion_medicamento_tablas`
  ADD PRIMARY KEY (`id_tabla`,`id_medicamento`,`descripcion_tabla`);

--
-- Indices de la tabla `relacion_rol_permiso`
--
ALTER TABLE `relacion_rol_permiso`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id_visita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  MODIFY `id_descripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  MODIFY `id_incapacidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `memo`
--
ALTER TABLE `memo`
  MODIFY `id_memo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1326;
--
-- AUTO_INCREMENT de la tabla `pase_salida`
--
ALTER TABLE `pase_salida`
  MODIFY `id_pase` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `presentacion_medicamento`
--
ALTER TABLE `presentacion_medicamento`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
