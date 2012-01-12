SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL ,
  `username` VARCHAR(100) NOT NULL ,
  `password` VARCHAR(100) NOT NULL ,
  `estado` BIT NOT NULL ,
  `token` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Organizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Organizacion` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Organizacion` (
  `id` INT NOT NULL ,
  `nombre` VARCHAR(100) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `director` VARCHAR(45) NULL ,
  `fechaOrigen` DATETIME NULL ,
  `web` VARCHAR(100) NULL ,
  `tel` VARCHAR(50) NULL ,
  `email` VARCHAR(100) NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Organizacion_Usuario` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Organizacion_Usuario`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Viaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Viaje` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Viaje` (
  `id` INT NOT NULL ,
  `idOrganizacion` INT NOT NULL ,
  `fecha` DATETIME NOT NULL ,
  `plataNecesaria` DECIMAL(6,2) NULL ,
  `destino` VARCHAR(100) NULL ,
  `barrio` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`, `idOrganizacion`) ,
  INDEX `fk_Viaje_Organizacion1` (`idOrganizacion` ASC) ,
  CONSTRAINT `fk_Viaje_Organizacion1`
    FOREIGN KEY (`idOrganizacion` )
    REFERENCES `mydb`.`Organizacion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Solidario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Solidario` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Solidario` (
  `id` INT NOT NULL ,
  `nombre` INT NOT NULL ,
  `apellido` DATETIME NOT NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Solidario_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Solidario_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pasaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pasaje` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Pasaje` (
  `id` INT NOT NULL ,
  `Solidario_id` INT NOT NULL ,
  `nroReserva` VARCHAR(50) NULL ,
  `estado` INT NULL ,
  `destino` VARCHAR(100) NULL ,
  `nroVuelo` VARCHAR(50) NULL ,
  `precio` DECIMAL(6) NULL ,
  `ganancia` DECIMAL(6) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Pasaje_Solidario1` (`Solidario_id` ASC) ,
  CONSTRAINT `fk_Pasaje_Solidario1`
    FOREIGN KEY (`Solidario_id` )
    REFERENCES `mydb`.`Solidario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PasajeViaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PasajeViaje` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`PasajeViaje` (
  `idPasaje` INT NOT NULL ,
  `idViaje` INT NOT NULL ,
  `plata` DECIMAL(6,2) NULL ,
  INDEX `fk_ViajeSolidario_Viaje1` (`idViaje` ASC) ,
  INDEX `fk_PasajeViaje_Pasaje1` (`idPasaje` ASC) ,
  PRIMARY KEY (`idPasaje`, `idViaje`) ,
  CONSTRAINT `fk_ViajeSolidario_Viaje1`
    FOREIGN KEY (`idViaje` )
    REFERENCES `mydb`.`Viaje` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PasajeViaje_Pasaje1`
    FOREIGN KEY (`idPasaje` )
    REFERENCES `mydb`.`Pasaje` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Noticia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Noticia` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Noticia` (
  `id` INT NOT NULL ,
  `titulo` VARCHAR(100) NOT NULL ,
  `copete` VARCHAR(200) NULL ,
  `cuerpo` VARCHAR(400) NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `idOrganizacion` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Video` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Video` (
  `id` INT NOT NULL ,
  `url` VARCHAR(100) NOT NULL ,
  `titulo` VARCHAR(200) NULL ,
  `descripcion` VARCHAR(400) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Foto` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Foto` (
  `id` INT NOT NULL ,
  `archivo` VARCHAR(100) NOT NULL ,
  `titulo` VARCHAR(200) NULL ,
  `descripcion` VARCHAR(400) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UsuarioFoto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UsuarioFoto` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`UsuarioFoto` (
  `idUsuario` INT NOT NULL ,
  `idFoto` INT NOT NULL ,
  PRIMARY KEY (`idUsuario`, `idFoto`) ,
  INDEX `fk_UsuarioFoto_Foto1` (`idFoto` ASC) ,
  INDEX `fk_UsuarioFoto_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_UsuarioFoto_Foto1`
    FOREIGN KEY (`idFoto` )
    REFERENCES `mydb`.`Foto` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioFoto_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UsuarioVideo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UsuarioVideo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`UsuarioVideo` (
  `idUsuario` INT NOT NULL ,
  `idVideo` INT NOT NULL ,
  PRIMARY KEY (`idUsuario`, `idVideo`) ,
  INDEX `fk_UsuarioVideo_Video1` (`idVideo` ASC) ,
  INDEX `fk_UsuarioVideo_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_UsuarioVideo_Video1`
    FOREIGN KEY (`idVideo` )
    REFERENCES `mydb`.`Video` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioVideo_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
