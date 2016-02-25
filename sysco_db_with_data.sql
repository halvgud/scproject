-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2016 a las 07:55:57
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
  `id_descripcion` int(11) DEFAULT NULL COMMENT 'este campo sirve para relacionar con la tabla de descripciones y asi obtener la descripcion del diagnostico de las enfermeras',
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
  `fecha_fin` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `consulta`
--

TRUNCATE TABLE `consulta`;
--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `fecha`, `id_descripcion`, `id_usuario_creacion`, `id_empleado`, `peso`, `talla`, `altura`, `frecuencia_respiratoria`, `frecuencia_cardiaca`, `temperatura`, `asistencia`, `fecha_inicio`, `fecha_fin`) VALUES
(1, '2016-02-17 22:33:11', NULL, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:15:00', '2016-02-18 10:25:00'),
(2, '2016-02-17 22:34:27', 5, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:25:00', '2016-02-18 10:35:00'),
(3, '2016-02-23 19:33:00', 3, 1, '1', '2.000', '2.000', '2.000', 2, 2, '2.000', 'A', '2016-02-24 18:50:00', '2016-02-24 19:00:00'),
(4, '2016-02-24 21:42:46', 3, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-25 22:45:00', '2016-02-25 22:50:00'),
(5, '2016-02-24 21:43:05', 4, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-25 22:50:00', '2016-02-25 23:00:00'),
(6, '2016-02-24 22:07:08', 4, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'A', '2016-02-24 19:05:00', '2016-02-24 19:15:00'),
(7, '2016-02-24 22:48:53', 3, 1, '2', '2.000', '2.000', '2.000', 2, 2, '2.000', 'A', '2016-02-24 19:20:00', '2016-02-24 19:30:00');

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
-- Truncar tablas antes de insertar `descripcion`
--

TRUNCATE TABLE `descripcion`;
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
-- Truncar tablas antes de insertar `empleado`
--

TRUNCATE TABLE `empleado`;
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
  `id_pase_imss` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `expediente`
--

TRUNCATE TABLE `expediente`;
--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`id_expediente`, `fecha`, `id_usuario_creacion`, `id_empleado`, `peso`, `talla`, `altura`, `frecuencia_respiratoria`, `frecuencia_cardiaca`, `temperatura`, `imc`, `interrogatorio`, `exploracion_fisica`, `tratamiento`, `diagnostico`, `id_ramo_seguro`, `id_otras_indicaciones`, `id_pase_imss`) VALUES
(1, '2016-02-24 23:39:46', 1, '1', '1.000', '1.000', NULL, NULL, 1, '1.000', '1.000', 'lo que sea', 'aksdaksdjasjdajsdklj|', 'asdaldÃ±asdÃ±asdÃ±lasldÃ±kasldlÃ±askd', '4', 22, 27, 32),
(2, '2016-02-24 23:48:50', 1, '1', '62.500', '32.400', '175.400', 12, 12, '37.500', '24.300', 'estamos haciendo una pruebba para guardar la consulta 6 de Roberto', 'Este texto es una prueba de lo que se guardarÃ¡ en una exploraciÃ³n fisica', 'Este texto es una prueba de lo que se guardarÃ¡ en una tratamiento recomendado por el doctor', '3', 23, 28, 31),
(3, '2016-02-24 23:51:13', 1, '2', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000', 'asdasd', '1', '1', '5', 22, 28, 31);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `incapacidad`
--

TRUNCATE TABLE `incapacidad`;
--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`id_incapacidad`, `id_empleado`, `folio`, `dias_autorizados`, `inicio`, `fin`, `id_entrega`, `id_clasificacion`, `id_ramo_seguro`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, '1', '123', 2, '2016-02-17', '2016-02-19', 8, 10, 13, 1, '2016-02-17 23:20:50'),
(2, '1', '123asd', 2, '2016-02-02', '2016-02-27', 8, 10, 14, 1, '2016-02-18 19:21:37'),
(3, '1', 'des12', 1, '2016-02-18', '2016-02-19', 8, 11, 13, 1, '2016-02-18 19:22:42'),
(4, '1', 'test prueba', 2, '2016-02-23', '2016-02-25', 8, 10, 13, 1, '2016-02-23 19:49:55');

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
  `id_presentacion_entrada` int(11) DEFAULT NULL,
  `id_presentacion_salida` int(11) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `medicamento`
--

TRUNCATE TABLE `medicamento`;
--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `clave`, `descripcion`, `precio`, `cantidad`, `id_presentacion_entrada`, `id_presentacion_salida`, `fecha_alta`, `fecha_baja`, `estado`, `id_usuario_creacion`) VALUES
(1, '705', 'Diclofenaco (20 tabletas 75 mg)', '40', 296, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(2, '41251', 'ketorolaco (25 tabletas 10 mg) ', '120', 293, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(3, 'PA500', 'Paracetamol (20 pastillas 500 mg)', '20', 396, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(4, '13123123', 'test the fucking medicamento catalog', '123', 12, 0, 0, '2016-02-18 00:00:00', '2016-02-18 00:00:00', 'A', 1),
(5, 'testingsku', 'PruebaInsercion', '120', 20, 2, 1, '2016-02-18 00:00:00', '2016-10-19 00:00:00', 'I', 1),
(6, 'qwe', 'qwe', '12', 12, 2, 2, '2016-02-02 00:00:00', '2016-02-03 00:00:00', 'I', 1),
(7, '131231231', 'llesoad', '231', 60, 2, 1, '2016-02-18 00:00:00', '2018-08-10 00:00:00', 'A', 0),
(9, 'prueba', 'prueba', '200', 450, 2, 1, '2016-02-23 00:00:00', '2018-02-23 00:00:00', 'A', NULL),
(10, 'prueba2', 'prueba2', '30', 600, 2, 1, '2016-02-23 00:00:00', '2018-02-09 00:00:00', 'A', 0),
(11, 'prueba3 mod', 'Cambio de descripcion', '35', 300, 3, 1, '2016-02-23 00:00:00', '2018-04-12 00:00:00', 'A', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `memo`
--

TRUNCATE TABLE `memo`;
--
-- Volcado de datos para la tabla `memo`
--

INSERT INTO `memo` (`id_memo`, `id_empleado`, `id_solicita`, `semana`, `respetar`, `motivo`, `supervisor`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, '1', 18, 1, 'respetar lo que sea', 'no quiso ir', 'Yo merengues', 1, '2016-02-17 23:43:34'),
(2, '1', 19, 2, 'sus derechos', 'no lo respetaron y lloro', 'su mama', 1, '2016-02-17 23:44:10'),
(3, '1', 19, 54, '1', '1', '1', 1, '2016-02-18 19:25:22'),
(4, '1', 18, 26, 'nada', 'no quiere jalar', 'don teofilito', 1, '2016-02-23 19:51:19');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `pase_salida`
--

TRUNCATE TABLE `pase_salida`;
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
-- Truncar tablas antes de insertar `permisos`
--

TRUNCATE TABLE `permisos`;
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
-- Truncar tablas antes de insertar `presentacion_medicamento`
--

TRUNCATE TABLE `presentacion_medicamento`;
--
-- Volcado de datos para la tabla `presentacion_medicamento`
--

INSERT INTO `presentacion_medicamento` (`id_presentacion`, `descripcion`, `cantidad`, `estado`) VALUES
(1, '1 UNIDAD', 1, 'A'),
(2, 'CAJA CON 20 TABLETAS', 20, 'A'),
(3, 'CAJA CON 25 TABLETAS', 25, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_consulta_medicamento`
--

DROP TABLE IF EXISTS `relacion_consulta_medicamento`;
CREATE TABLE IF NOT EXISTS `relacion_consulta_medicamento` (
  `id_consulta` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `relacion_consulta_medicamento`
--

TRUNCATE TABLE `relacion_consulta_medicamento`;
--
-- Volcado de datos para la tabla `relacion_consulta_medicamento`
--

INSERT INTO `relacion_consulta_medicamento` (`id_consulta`, `id_medicamento`, `cantidad`) VALUES
(1, 2, 6),
(2, 3, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 3, 1),
(7, 3, 3);

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
-- Truncar tablas antes de insertar `relacion_rol_permiso`
--

TRUNCATE TABLE `relacion_rol_permiso`;
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
(2, 6, 'I'),
(2, 7, 'I'),
(2, 8, 'I'),
(2, 9, 'I'),
(2, 10, 'I'),
(2, 11, 'I'),
(3, 1, 'I'),
(3, 2, 'I'),
(3, 3, 'I'),
(3, 4, 'I'),
(3, 5, 'I'),
(3, 6, 'I'),
(3, 7, 'I'),
(3, 8, 'I'),
(3, 9, 'I'),
(3, 10, 'I'),
(3, 11, 'I'),
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
(4, 11, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_visita_medicamento`
--

DROP TABLE IF EXISTS `relacion_visita_medicamento`;
CREATE TABLE IF NOT EXISTS `relacion_visita_medicamento` (
  `id_visita` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `relacion_visita_medicamento`
--

TRUNCATE TABLE `relacion_visita_medicamento`;
--
-- Volcado de datos para la tabla `relacion_visita_medicamento`
--

INSERT INTO `relacion_visita_medicamento` (`id_visita`, `id_medicamento`, `cantidad`) VALUES
(1, 1, 1),
(2, 2, 1);

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
-- Truncar tablas antes de insertar `roles`
--

TRUNCATE TABLE `roles`;
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
-- Truncar tablas antes de insertar `usuario`
--

TRUNCATE TABLE `usuario`;
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
  `id_descripcion` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `visita`
--

TRUNCATE TABLE `visita`;
--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_visita`, `fecha`, `id_empleado`, `id_usuario_creacion`, `id_descripcion`) VALUES
(1, '2016-02-17 21:00:00', '1', 1, 3),
(2, '2016-02-23 20:00:00', '1', 1, 4);

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
-- Indices de la tabla `relacion_consulta_medicamento`
--
ALTER TABLE `relacion_consulta_medicamento`
  ADD PRIMARY KEY (`id_consulta`,`id_medicamento`);

--
-- Indices de la tabla `relacion_rol_permiso`
--
ALTER TABLE `relacion_rol_permiso`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`);

--
-- Indices de la tabla `relacion_visita_medicamento`
--
ALTER TABLE `relacion_visita_medicamento`
  ADD PRIMARY KEY (`id_visita`,`id_medicamento`);

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
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  MODIFY `id_descripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  MODIFY `id_incapacidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `memo`
--
ALTER TABLE `memo`
  MODIFY `id_memo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pase_salida`
--
ALTER TABLE `pase_salida`
  MODIFY `id_pase` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
