SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Bedu proyect` ;
USE `Bedu proyect` ;

-- Table `Bedu proyect`.`Perfil`
CREATE TABLE IF NOT EXISTS `Bedu proyect`.`Perfil` (
  `idPerfil` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Correo Electrónico` VARCHAR(50) NULL,
  `Foto de perfil` LONGBLOB NULL,
  `Número de Teléfono` INT(13) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- Table `Bedu proyect`.`Usuario`
CREATE TABLE IF NOT EXISTS `Bedu proyect`.`Usuario` (
  `idUsuario` INT UNSIGNED NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Perfil_idPerfil` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  INDEX `fk_Usuario_Perfil_idx` (`Perfil_idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Perfil`
    FOREIGN KEY (`Perfil_idPerfil`)
    REFERENCES `Bedu proyect`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Table `Bedu proyect`.`Metas compartidas`
CREATE TABLE IF NOT EXISTS `Bedu proyect`.`Metas compartidas` (
  `idLista Metas` INT UNSIGNED NOT NULL,
  `compartida_con` INT NULL,
  `Usuario_idUsuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idLista Metas`),
  INDEX `fk_Metas compartidas_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Metas compartidas_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Bedu proyect`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Table `Bedu proyect`.`Lista de metas`
CREATE TABLE IF NOT EXISTS `Bedu proyect`.`Lista de metas` (
  `idLista de metas` INT NOT NULL,
  `Usuario_idUsuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idLista de metas`),
  INDEX `fk_Lista de metas_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Lista de metas_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Bedu proyect`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Table `Bedu proyect`.`Metas`
CREATE TABLE IF NOT EXISTS `Bedu proyect`.`Metas` (
  `idMetas` INT UNSIGNED NOT NULL,
  `Titulo` VARCHAR(50) NULL,
  `Descripión` LONGTEXT NULL,
  `Progreso` INT(3) NULL,
  `Estado` VARCHAR(2) NULL,
  `Metas compartidas_idLista Metas` INT UNSIGNED NOT NULL,
  `Lista de metas_idLista de metas` INT NOT NULL,
  PRIMARY KEY (`idMetas`),
  INDEX `fk_Metas_Metas compartidas1_idx` (`Metas compartidas_idLista Metas` ASC) VISIBLE,
  INDEX `fk_Metas_Lista de metas1_idx` (`Lista de metas_idLista de metas` ASC) VISIBLE,
  CONSTRAINT `fk_Metas_Metas compartidas1`
    FOREIGN KEY (`Metas compartidas_idLista Metas`)
    REFERENCES `Bedu proyect`.`Metas compartidas` (`idLista Metas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Metas_Lista de metas1`
    FOREIGN KEY (`Lista de metas_idLista de metas`)
    REFERENCES `Bedu proyect`.`Lista de metas` (`idLista de metas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
