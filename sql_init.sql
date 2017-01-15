CREATE SCHEMA `trtr` ;

CREATE TABLE `trtr`.`labels` (
  `LABELID` INT NOT NULL AUTO_INCREMENT,
  `VALUE` VARCHAR(100) NULL,
  `LANGUAGE` VARCHAR(3) NULL,
  PRIMARY KEY (`LABELID`));

CREATE TABLE `trtr`.`company` (
  `COMPANYID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  `CITY` VARCHAR(45) NULL,
  `COUNTRY` VARCHAR(45) NULL,
  PRIMARY KEY (`COMPANYID`));

CREATE TABLE `trtr`.`user` (
  `USERID` INT NOT NULL AUTO_INCREMENT,
  `USERNAME` VARCHAR(45) NULL,
  `MAIL` VARCHAR(45) NULL,
  `PASSWORD` VARCHAR(45) NULL,
  `FIRSTNAME` VARCHAR(45) NULL,
  `LASTNAME` VARCHAR(45) NULL,
  `COMPANYID` INT NOT NULL,
  PRIMARY KEY (`USERID`),
  INDEX `usercompany_idx` (`COMPANYID` ASC),
  CONSTRAINT `usercompany`
    FOREIGN KEY (`COMPANYID`)
    REFERENCES `trtr`.`company` (`COMPANYID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `trtr`.`travel` (
  `travelid` INT NOT NULL AUTO_INCREMENT,
  `destination` VARCHAR(45) NULL,
  `ddep` DATE NULL,
  `darr` DATE NULL,
  `dcre` DATE NULL,
  `status` INT NULL,
  `userid` INT NULL,
  PRIMARY KEY (`travelid`),
  INDEX `usertravel_idx` (`userid` ASC),
  CONSTRAINT `usertravel`
    FOREIGN KEY (`userid`)
    REFERENCES `trtr`.`user` (`USERID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `trtr`.`expenses` (
  `expenseid` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `amount` DECIMAL(5,2) NULL,
  `proofpath` VARCHAR(100) NULL,
  `travelid` INT NULL,
  PRIMARY KEY (`expenseid`),
  INDEX `travelexpense_idx` (`travelid` ASC),
  CONSTRAINT `travelexpense`
    FOREIGN KEY (`travelid`)
    REFERENCES `trtr`.`travel` (`travelid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
