-- MySQL Script generated by MySQL Workbench
-- 12/17/16 22:12:19
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema trtr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trtr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trtr` DEFAULT CHARACTER SET utf8 ;
USE `trtr` ;

-- -----------------------------------------------------
-- Table `trtr`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trtr`.`company` ;

CREATE TABLE IF NOT EXISTS `trtr`.`company` (
  `COMPANYID` INT(11) NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL DEFAULT NULL,
  `ADDRESS` VARCHAR(45) NULL DEFAULT NULL,
  `CITY` VARCHAR(45) NULL DEFAULT NULL,
  `COUNTRY` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`COMPANYID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trtr`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trtr`.`user` ;

CREATE TABLE IF NOT EXISTS `trtr`.`user` (
  `USERID` INT(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` VARCHAR(45) NULL DEFAULT NULL,
  `MAIL` VARCHAR(45) NULL DEFAULT NULL,
  `PASSWORD` VARCHAR(45) NULL DEFAULT NULL,
  `FIRSTNAME` VARCHAR(45) NULL DEFAULT NULL,
  `LASTNAME` VARCHAR(45) NULL DEFAULT NULL,
  `COMPANYID` INT(11) NOT NULL,
  PRIMARY KEY (`USERID`),
  INDEX `usercompany_idx` (`COMPANYID` ASC),
  CONSTRAINT `usercompany`
    FOREIGN KEY (`COMPANYID`)
    REFERENCES `trtr`.`company` (`COMPANYID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trtr`.`travel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trtr`.`travel` ;

CREATE TABLE IF NOT EXISTS `trtr`.`travel` (
  `travelid` INT(11) NOT NULL AUTO_INCREMENT,
  `destination` VARCHAR(45) NULL DEFAULT NULL,
  `ddep` DATE NULL DEFAULT NULL,
  `darr` DATE NULL DEFAULT NULL,
  `dcre` DATE NULL DEFAULT NULL,
  `status` INT(11) NULL DEFAULT NULL,
  `userid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`travelid`),
  INDEX `usertravel_idx` (`userid` ASC),
  CONSTRAINT `usertravel`
    FOREIGN KEY (`userid`)
    REFERENCES `trtr`.`user` (`USERID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trtr`.`expenses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trtr`.`expenses` ;

CREATE TABLE IF NOT EXISTS `trtr`.`expenses` (
  `expenseid` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `amount` DECIMAL(5,2) NULL DEFAULT NULL,
  `proofpath` VARCHAR(100) NULL DEFAULT NULL,
  `travelid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`expenseid`),
  INDEX `travelexpense_idx` (`travelid` ASC),
  CONSTRAINT `travelexpense`
    FOREIGN KEY (`travelid`)
    REFERENCES `trtr`.`travel` (`travelid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trtr`.`labels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trtr`.`labels` ;

CREATE TABLE IF NOT EXISTS `trtr`.`labels` (
  `LABELID` INT(11) NOT NULL AUTO_INCREMENT,
  `VALUE` VARCHAR(100) NULL DEFAULT NULL,
  `LANGUAGE` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`LABELID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
