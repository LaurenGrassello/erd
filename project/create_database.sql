-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema normalization_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema normalization_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `normalization_schema` DEFAULT CHARACTER SET utf8 ;
USE `normalization_schema` ;

-- -----------------------------------------------------
-- Table `normalization_schema`.`dojos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_schema`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `location` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_schema`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_schema`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `state` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_schema`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_schema`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dojo_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_students_dojos_idx` (`dojo_id` ASC) VISIBLE,
  INDEX `fk_students_addresses1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_dojos`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `normalization_schema`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_addresses1`
    FOREIGN KEY (`address_id`)
    REFERENCES `normalization_schema`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_schema`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_schema`.`interests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_schema`.`student_interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_schema`.`student_interests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `interest_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  INDEX `fk_students_has_interests_interests1_idx` (`interest_id` ASC) VISIBLE,
  INDEX `fk_students_has_interests_students1_idx` (`student_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_students_has_interests_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `normalization_schema`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_interests_interests1`
    FOREIGN KEY (`interest_id`)
    REFERENCES `normalization_schema`.`interests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
