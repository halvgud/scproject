-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2016 a las 14:53:20
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
-- Estructura de tabla para la tabla `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `area`
--

TRUNCATE TABLE `area`;
--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `descripcion`, `estado`) VALUES
(1, 'prueba', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_descripcion` int(11) DEFAULT NULL COMMENT 'este campo sirve para relacionar con la tabla de descripciones y asi obtener la descripcion del diagnostico de las enfermeras',
  `id_usuario` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `consulta`
--

TRUNCATE TABLE `consulta`;
--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `fecha`, `id_descripcion`, `id_usuario`, `id_empleado`, `peso`, `talla`, `altura`, `frecuencia_respiratoria`, `frecuencia_cardiaca`, `temperatura`, `asistencia`, `fecha_inicio`, `fecha_fin`) VALUES
(1, '2016-02-17 22:33:11', NULL, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:15:00', '2016-02-18 10:25:00'),
(2, '2016-02-17 22:34:27', 5, 1, '1', '1.000', '1.000', '1.000', 1, 1, '1.000', 'N', '2016-02-18 10:25:00', '2016-02-18 10:35:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id_departamento` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `departamento`
--

TRUNCATE TABLE `departamento`;
--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `descripcion`, `estado`) VALUES
(1, 'prueba departamento', 'A');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(19, 'memo_solicita', 'Relaciones Laborales', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
CREATE TABLE IF NOT EXISTS `diagnostico` (
  `id_diagnostico` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `diagnostico`
--

TRUNCATE TABLE `diagnostico`;
--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`id_diagnostico`, `descripcion`, `estado`) VALUES
(1, 'Gripa', 'A'),
(2, 'Dermatitis', 'I'),
(3, 'Mialgia', 'A');

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
  `id_estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nss` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `empleado`
--

TRUNCATE TABLE `empleado`;
--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `materno`, `paterno`, `sexo`, `id_turno`, `id_area`, `id_departamento`, `id_estado`, `nss`) VALUES
('1', 'roberto', 'santelices', 'rivera', 'M', 1, 1, 1, 'A', '9112193816123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

DROP TABLE IF EXISTS `expediente`;
CREATE TABLE IF NOT EXISTS `expediente` (
  `id_expediente` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` decimal(10,0) DEFAULT NULL,
  `talla` decimal(10,0) DEFAULT NULL,
  `altura` decimal(10,0) DEFAULT NULL,
  `frecuenca_respiratoria` int(11) DEFAULT NULL,
  `frecuencia_cardiaca` int(11) DEFAULT NULL,
  `temperatura` decimal(10,0) DEFAULT NULL,
  `imc` decimal(10,0) DEFAULT NULL,
  `interrogatorio` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `exploracion_fisica` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tratamiento` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `diagnostico` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ramo_seguro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `otras_indicaciones` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pase_imss` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `expediente`
--

TRUNCATE TABLE `expediente`;
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
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `incapacidad`
--

TRUNCATE TABLE `incapacidad`;
--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`id_incapacidad`, `id_empleado`, `folio`, `dias_autorizados`, `inicio`, `fin`, `id_entrega`, `id_clasificacion`, `id_ramo_seguro`, `id_usuario`, `fecha_creacion`) VALUES
(1, '1', '123', 2, '2016-02-17', '2016-02-19', 8, 10, 13, 1, '2016-02-17 23:20:50');

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
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `medicamento`
--

TRUNCATE TABLE `medicamento`;
--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `clave`, `descripcion`, `precio`, `cantidad`, `id_presentacion_entrada`, `id_presentacion_salida`, `fecha_alta`, `fecha_baja`, `estado`, `id_usuario`) VALUES
(1, '1234112', 'diclofenaco (20 tabletas 75 mg)', '200', 299, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(2, '41251', 'ketorolaco (25 tabletas 10 mg) ', '120', 294, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1),
(3, '992193', 'paracetamol (20 pastillas 500 mg)', '20', 299, 0, 0, '2016-02-10 00:00:00', '2016-02-10 00:00:00', 'A', 1);

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
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `memo`
--

TRUNCATE TABLE `memo`;
--
-- Volcado de datos para la tabla `memo`
--

INSERT INTO `memo` (`id_memo`, `id_empleado`, `id_solicita`, `semana`, `respetar`, `motivo`, `supervisor`, `id_usuario`, `fecha_creacion`) VALUES
(1, '1', 18, 1, 'respetar lo que sea', 'no quiso ir', 'Yo merengues', 1, '2016-02-17 23:43:34'),
(2, '1', 19, 2, 'sus derechos', 'no lo respetaron y lloro', 'su mama', 1, '2016-02-17 23:44:10');

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
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `pase_salida`
--

TRUNCATE TABLE `pase_salida`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(3, 'CAJA CON 25 TABLETAS', 25, 'A'),
(4, 'CAJA CON 25 TABLETAS', 25, 'A');

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
(2, 3, 1);

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
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

DROP TABLE IF EXISTS `turno`;
CREATE TABLE IF NOT EXISTS `turno` (
  `id_turno` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `turno`
--

TRUNCATE TABLE `turno`;
--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `descripcion`) VALUES
(1, 'matutino'),
(2, 'vespertino');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `usuario`
--

TRUNCATE TABLE `usuario`;
--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `rol`, `estado`, `fecha_alta`, `id_usuario_creacion`, `fecha_baja`) VALUES
(1, 'rafa', '123', '1', 'A', '2016-02-08 19:54:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

DROP TABLE IF EXISTS `visita`;
CREATE TABLE IF NOT EXISTS `visita` (
  `id_visita` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_empleado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_descripcion` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `visita`
--

TRUNCATE TABLE `visita`;
--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_visita`, `fecha`, `id_empleado`, `id_usuario`, `id_descripcion`) VALUES
(1, '2016-02-17 21:00:00', '1', 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  ADD PRIMARY KEY (`id_descripcion`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`);

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
-- Indices de la tabla `relacion_visita_medicamento`
--
ALTER TABLE `relacion_visita_medicamento`
  ADD PRIMARY KEY (`id_visita`,`id_medicamento`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

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
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  MODIFY `id_descripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  MODIFY `id_incapacidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `memo`
--
ALTER TABLE `memo`
  MODIFY `id_memo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pase_salida`
--
ALTER TABLE `pase_salida`
  MODIFY `id_pase` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `presentacion_medicamento`
--
ALTER TABLE `presentacion_medicamento`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
