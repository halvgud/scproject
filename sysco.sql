-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-01-2016 a las 21:46:41
-- Versión del servidor: 5.5.21
-- Versión de PHP: 5.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sysco`
--
CREATE DATABASE IF NOT EXISTS `sysco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sysco`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE IF NOT EXISTS `consultas` (
  `idConsultas` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Peso` float NOT NULL,
  `Altura` float NOT NULL,
  `Talla` int(11) NOT NULL,
  `FrecCardiaca` float NOT NULL,
  `Temperatura` int(11) NOT NULL,
  `FrecRespiratoria` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `ApellidoP` varchar(45) DEFAULT NULL,
  `ApellidoM` varchar(45) DEFAULT NULL,
  `Turno` varchar(45) DEFAULT NULL,
  `Area` varchar(45) DEFAULT NULL,
  `Departamento` varchar(45) DEFAULT NULL,
  `Diagnostico` varchar(45) DEFAULT NULL,
  `Medicamento1` varchar(45) DEFAULT NULL,
  `Medicamento2` varchar(45) DEFAULT NULL,
  `Cantidad1` int(11) DEFAULT NULL,
  `Cantidad2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsultas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas_has_empleado`
--

CREATE TABLE IF NOT EXISTS `consultas_has_empleado` (
  `Consultas_idConsultas` int(11) NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`Consultas_idConsultas`,`Empleado_idEmpleado`),
  KEY `fk_Consultas_has_Empleado_Empleado1` (`Empleado_idEmpleado`),
  KEY `fk_Consultas_has_Empleado_Consultas1` (`Consultas_idConsultas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE IF NOT EXISTS `diagnostico` (
  `idDiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `Clave` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idDiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `ApellidoP` varchar(20) NOT NULL,
  `ApellidoM` varchar(20) NOT NULL,
  `Turno` int(11) NOT NULL,
  `Area` varchar(25) NOT NULL,
  `Departamento` varchar(30) NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_Empleado_Empleado1` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientem`
--

CREATE TABLE IF NOT EXISTS `expedientem` (
  `idExpedienteM` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idExpedienteM`),
  KEY `fk_ExpedienteM_Empleado1_idx` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

CREATE TABLE IF NOT EXISTS `incapacidad` (
  `idIncapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idIncapacidad`),
  KEY `fk_Incapacidad_Empleado1_idx` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE IF NOT EXISTS `medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) NOT NULL,
  `Presentacion` varchar(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `CostoUnitario` float NOT NULL,
  `PrecioCaja` float NOT NULL,
  `FechaIngreso` datetime NOT NULL,
  `FechaCaducidad` datetime NOT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memo`
--

CREATE TABLE IF NOT EXISTS `memo` (
  `idMemo` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idMemo`),
  KEY `fk_Memo_Empleado1_idx` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasesalida`
--

CREATE TABLE IF NOT EXISTS `pasesalida` (
  `idPaseSalida` int(11) NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(30) NOT NULL,
  `Autorizacion` varchar(30) NOT NULL,
  `FechaHora` datetime NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idPaseSalida`),
  KEY `fk_PaseSalida_Empleado1_idx` (`Empleado_idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `password`, `tipo`) VALUES
(1, 'administrador', '21232f297a57a5a743894a0e4a801fc3', 'A'),
(8, 'administrador', '21232f297a57a5a743894a0e4a801fc3', 'A'),
(11, 'misael', '21232f297a57a5a743894a0e4a801fc3', 'A'),
(34, 'guadalupe', '54cfde09fcc24b18bed04b9f72dcedb0', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE IF NOT EXISTS `visitas` (
  `idVisitas` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Medicamento_idMedicamento` int(11) NOT NULL,
  `Diagnostico_idDiagnostico` int(11) NOT NULL,
  PRIMARY KEY (`idVisitas`),
  KEY `fk_Visitas_Empleado_idx` (`Empleado_idEmpleado`),
  KEY `fk_Visitas_Medicamento1_idx` (`Medicamento_idMedicamento`),
  KEY `fk_Visitas_Diagnostico1_idx` (`Diagnostico_idDiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas_has_empleado`
--
ALTER TABLE `consultas_has_empleado`
  ADD CONSTRAINT `fk_Consultas_has_Empleado_Consultas1` FOREIGN KEY (`Consultas_idConsultas`) REFERENCES `consultas` (`idConsultas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Consultas_has_Empleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `expedientem`
--
ALTER TABLE `expedientem`
  ADD CONSTRAINT `fk_ExpedienteM_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD CONSTRAINT `fk_Incapacidad_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `memo`
--
ALTER TABLE `memo`
  ADD CONSTRAINT `fk_Memo_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pasesalida`
--
ALTER TABLE `pasesalida`
  ADD CONSTRAINT `fk_PaseSalida_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `fk_Visitas_Diagnostico1` FOREIGN KEY (`Diagnostico_idDiagnostico`) REFERENCES `diagnostico` (`idDiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visitas_Empleado` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visitas_Medicamento1` FOREIGN KEY (`Medicamento_idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
