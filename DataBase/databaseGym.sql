-- -----------------------------------------------------
-- Schema GYM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GYM`;
USE `GYM` ;

-- -----------------------------------------------------
-- Table `GYM`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Privilegio` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Edad` INT NOT NULL,
  `Telefono` VARCHAR(45) NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Recetas` (
  `idRecetas` INT NOT NULL AUTO_INCREMENT,
  `Publico` INT(2) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `Imagen` VARCHAR(45) NULL,
  `Dificultad` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRecetas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Recetas_Personales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Recetas_Personales` (
  `idRecetas_Personales` INT NOT NULL AUTO_INCREMENT,
  `IDRecetas` INT NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `IDUsuario` INT NOT NULL,
  PRIMARY KEY (`idRecetas_Personales`),
  INDEX `IDRecetas_idx` (`IDRecetas` ASC),
  INDEX `IDUsuario_idx` (`IDUsuario` ASC),
  CONSTRAINT `IDRecetas`
    FOREIGN KEY (`IDRecetas`)
    REFERENCES `GYM`.`Recetas` (`idRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDUsuario`
    FOREIGN KEY (`IDUsuario`)
    REFERENCES `GYM`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Ingredientes` (
  `idIngredientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  PRIMARY KEY (`idIngredientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Unidades` (
  `idUnidades` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Abreviacion` VARCHAR(45) NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  PRIMARY KEY (`idUnidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Receta_Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Receta_Ingredientes` (
  `idReceta_Ingredientes` INT NOT NULL AUTO_INCREMENT,
  `IDReceta` INT NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `IDIngredientes` INT NOT NULL,
  `Cantidad` INT NULL,
  `IDUnidades` INT NOT NULL,
  PRIMARY KEY (`idReceta_Ingredientes`),
  INDEX `IDReceta_idx` (`IDReceta` ASC),
  INDEX `IDIngredientes_idx` (`IDIngredientes` ASC),
  INDEX `IDUnidades_idx` (`IDUnidades` ASC),
  CONSTRAINT `IDReceta`
    FOREIGN KEY (`IDReceta`)
    REFERENCES `GYM`.`Recetas` (`idRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDIngredientes`
    FOREIGN KEY (`IDIngredientes`)
    REFERENCES `GYM`.`Ingredientes` (`idIngredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDUnidades`
    FOREIGN KEY (`IDUnidades`)
    REFERENCES `GYM`.`Unidades` (`idUnidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`Equivalencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`Equivalencias` (
  `idEquivalencias` INT NOT NULL AUTO_INCREMENT,
  `Valor_Grande` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `Valor_chico` INT NOT NULL,
  PRIMARY KEY (`idEquivalencias`),
  INDEX `IDUnidades_idx` (`Valor_Grande` ASC, `Valor_chico` ASC),
  CONSTRAINT `IDUnidades`
    FOREIGN KEY (`Valor_Grande` , `Valor_chico`)
    REFERENCES `GYM`.`Unidades` (`idUnidades` , `idUnidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
