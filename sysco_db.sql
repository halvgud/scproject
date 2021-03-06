-- MySQL Script generated by MySQL Workbench
-- 03/16/16 22:35:59
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sys_co_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sys_co_db` ;
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
  `turno` VARCHAR(50) NULL,
  `area` VARCHAR(50) NULL,
  `departamento` VARCHAR(50) NULL,
  `estado` CHAR NULL,
  `nss` VARCHAR(20) NULL,
  PRIMARY KEY (`id_empleado`))
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
  `cantidad_minima` INT NULL,
  `id_presentacion_entrada` INT NULL,
  `id_presentacion_salida` INT NULL,
  `fecha_alta` DATETIME NULL,
  `fecha_baja` DATETIME NULL,
  `estado` CHAR NULL,
  `id_usuario_creacion` INT NULL,
  `medicamentocol` VARCHAR(45) NULL,
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
  `id_usuario_creacion` INT NULL,
  `id_empleado` VARCHAR(10) NULL,
  `peso` DECIMAL(6,3) NULL,
  `talla` DECIMAL(6,3) NULL,
  `altura` DECIMAL(6,3) NULL,
  `frecuencia_respiratoria` INT NULL,
  `frecuencia_cardiaca` INT NULL,
  `temperatura` DECIMAL(6,3) NULL,
  `asistencia` CHAR NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  `id_diagnostico` INT NULL,
  `id_proceso` INT NULL,
  PRIMARY KEY (`id_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`visita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`visita` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`visita` (
  `id_visita` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `id_empleado` VARCHAR(10) NULL,
  `id_usuario_creacion` INT NULL,
  `id_diagnostico` INT NULL,
  `id_proceso` INT NULL,
  PRIMARY KEY (`id_visita`))
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
  `id_usuario_creacion` INT NULL,
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
  `id_usuario_creacion` INT NULL,
  `id_empleado` VARCHAR(10) NULL,
  `peso` DECIMAL(6,3) NULL,
  `talla` DECIMAL(6,3) NULL,
  `altura` DECIMAL(6,3) NULL,
  `frecuencia_respiratoria` INT NULL,
  `frecuencia_cardiaca` INT NULL,
  `temperatura` DECIMAL(6,3) NULL,
  `imc` DECIMAL(6,3) NULL,
  `interrogatorio` VARCHAR(1000) NULL,
  `exploracion_fisica` VARCHAR(1000) NULL,
  `tratamiento` VARCHAR(1000) NULL,
  `diagnostico` VARCHAR(1000) NULL,
  `id_ramo_seguro` INT NULL,
  `id_otras_indicaciones` INT NULL,
  `id_pase_imss` INT NULL,
  `id_proceso` INT NULL,
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
  `dias_autorizados` INT NULL,
  `inicio` DATE NULL,
  `fin` DATE NULL,
  `id_entrega` INT NULL,
  `id_clasificacion` INT NULL,
  `id_ramo_seguro` INT NULL,
  `id_usuario_creacion` INT NULL,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id_incapacidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`memo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`memo` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`memo` (
  `id_memo` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` VARCHAR(10) NULL,
  `id_solicita` INT NULL,
  `semana` INT NULL,
  `respetar` VARCHAR(50) NULL,
  `motivo` VARCHAR(50) NULL,
  `supervisor` VARCHAR(50) NULL,
  `id_usuario_creacion` INT NULL,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id_memo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`descripcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`descripcion` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`descripcion` (
  `id_descripcion` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(30) NULL,
  `descripcion` VARCHAR(50) NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_descripcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`roles` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`roles` (
  `id_rol` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`permisos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`permisos` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`permisos` (
  `id_permiso` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_permiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`relacion_rol_permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`relacion_rol_permiso` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`relacion_rol_permiso` (
  `id_rol` INT NOT NULL,
  `id_permiso` INT NOT NULL,
  `estado` CHAR NULL,
  PRIMARY KEY (`id_rol`, `id_permiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_co_db`.`relacion_medicamento_tablas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_co_db`.`relacion_medicamento_tablas` ;

CREATE TABLE IF NOT EXISTS `sys_co_db`.`relacion_medicamento_tablas` (
  `id_tabla` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  `cantidad` INT NULL,
  `descripcion_tabla` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`id_tabla`, `id_medicamento`, `descripcion_tabla`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
