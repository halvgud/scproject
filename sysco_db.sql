-- MySQL Script generated by MySQL Workbench
-- 02/15/16 19:45:18
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sys_co_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sys_co_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `sys_co_db` ;

-- -----------------------------------------------------
-- Table `sys_co_db`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`empleado` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`empleado` (
  `id_empleado` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `materno` VARCHAR(50) NULL,
  `paterno` VARCHAR(50) NULL,
  `sexo` CHAR NULL,
  `id_turno` INT NULL,
  `id_area` INT NULL,
  `id_departamento` INT NULL,
  `id_estado` CHAR NULL,
  `nss` VARCHAR(20) NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`departamento` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`departamento` (
  `id_departamento` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`area` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`area` (
  `id_area` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_area`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`presentacion_medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`presentacion_medicamento` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`presentacion_medicamento` (
  `id_presentacion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `cantidad` INT NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_presentacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`medicamento` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`medicamento` (
  `id_medicamento` INT NOT NULL AUTO_INCREMENT,
  `clave` VARCHAR(45) NULL,
  `descripcion` VARCHAR(150) NULL,
  `precio` DECIMAL(10) NULL,
  `cantidad` INT NULL,
  `id_presentacion_entrada` INT NULL,
  `id_presentacion_salida` INT NULL,
  `fecha_alta` DATETIME NULL,
  `fecha_baja` DATETIME NULL,
  `estado` CHAR NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`usuario` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(100) NULL,
  `rol` CHAR NULL,
  `estado` CHAR NULL,
  `fecha_alta` DATETIME NULL,
  `id_usuario_creacion` INT NULL,
  `fecha_baja` DATETIME NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`consulta` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`consulta` (
  `id_consulta` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `id_usuario` INT NULL,
  `id_empleado` VARCHAR(10) NULL,
  `peso` DECIMAL(10) NULL,
  `talla` DECIMAL(10) NULL,
  `altura` DECIMAL(10) NULL,
  `frecuenca_respiratoria` INT NULL,
  `frecuencia_cardiaca` INT NULL,
  `temperatura` DECIMAL NULL,
  `asistencia` CHAR NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  PRIMARY KEY (`id_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`relacion_consulta_medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`relacion_consulta_medicamento` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`relacion_consulta_medicamento` (
  `id_consulta` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`id_consulta`, `id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`turno` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`turno` (
  `id_turno` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_turno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`visita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`visita` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`visita` (
  `id_visita` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `id_empleado` VARCHAR(10) NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id_visita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`relacion_visita_medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`relacion_visita_medicamento` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`relacion_visita_medicamento` (
  `id_visita` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`id_visita`, `id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`diagnostico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`diagnostico` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`diagnostico` (
  `id_diagnostico` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_diagnostico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`pase_salida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`pase_salida` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`pase_salida` (
  `id_pase` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` VARCHAR(10) NULL,
  `motivo` VARCHAR(100) NULL,
  `estado` CHAR NULL,
  `id_usuario` INT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_pase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`expediente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`expediente` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`expediente` (
  `id_expediente` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `id_usuario` INT NULL,
  `id_empleado` VARCHAR(10) NULL,
  `peso` DECIMAL(10) NULL,
  `talla` DECIMAL(10) NULL,
  `altura` DECIMAL(10) NULL,
  `frecuenca_respiratoria` INT NULL,
  `frecuencia_cardiaca` INT NULL,
  `temperatura` DECIMAL NULL,
  `imc` DECIMAL(10) NULL,
  `interrogatorio` VARCHAR(1000) NULL,
  `exploracion_fisica` VARCHAR(1000) NULL,
  `tratamiento` VARCHAR(1000) NULL,
  `id_diagnostico` INT NULL,
  `ramo_seguro` VARCHAR(50) NULL,
  `otras_indicaciones` VARCHAR(50) NULL,
  `pase_imss` CHAR NULL,
  PRIMARY KEY (`id_expediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`incapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`incapacidad` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`incapacidad` (
  `id_incapacidad` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` VARCHAR(10) NULL,
  `folio` VARCHAR(30) NULL,
  `entrega` VARCHAR(20) NULL,
  `dias_autorizados` INT NULL,
  `inicio` DATE NULL,
  `fin` DATE NULL,
  `clasificacion` VARCHAR(30) NULL,
  `ramo_seguro` VARCHAR(30) NULL,
  `id_usuario` INT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_incapacidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`memo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`memo` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`memo` (
  `id_memo` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` VARCHAR(10) NULL,
  `solicita` VARCHAR(50) NULL,
  `semana` INT NULL,
  `respetar` VARCHAR(50) NULL,
  `motivo` VARCHAR(50) NULL,
  `supervisor` VARCHAR(50) NULL,
  `id_usuario` INT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_memo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
