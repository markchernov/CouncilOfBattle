-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `helperdb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `helperdb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `helperdb` ;

-- -----------------------------------------------------
-- Table `cohorts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cohorts` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cohorts` (
  `cohort_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `startdate` DATE NULL,
  `enddate` DATE NULL,
  PRIMARY KEY (`cohort_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `instructors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instructors` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `instructors` (
  `user_id` INT NOT NULL,
  `level` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_users_instructors1`
    FOREIGN KEY (`user_id`)
    REFERENCES `instructors` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_users_instructors1_idx` ON `users` (`user_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `addresses` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `addresses` (
  `user_id` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`, `address`),
  CONSTRAINT `fk_addresses_to_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projects` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `startdate` DATE NULL,
  `enddate` DATE NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `students` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `students` (
  `user_id` INT NOT NULL,
  `cohort_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `cohort_id`),
  CONSTRAINT `fk_students_to_cohorts`
    FOREIGN KEY (`cohort_id`)
    REFERENCES `cohorts` (`cohort_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `students_to_cohorts_idx` ON `students` (`cohort_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `grades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grades` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `grades` (
  `user_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`user_id`, `project_id`),
  CONSTRAINT `fk_grades_to_projects`
    FOREIGN KEY (`project_id`)
    REFERENCES `projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grades_to_students`
    FOREIGN KEY (`user_id`)
    REFERENCES `students` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_grades_to_projects_idx` ON `grades` (`project_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `daily_attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `daily_attendance` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `daily_attendance` (
  `user_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `present` TINYINT(1) NOT NULL,
  `late` TINYINT(1) NULL,
  `excused` TINYINT(1) NULL,
  `checkin` DATETIME NULL,
  `checkout` DATETIME NULL,
  PRIMARY KEY (`user_id`, `date`),
  CONSTRAINT `fk_daily_attendance_students1`
    FOREIGN KEY (`user_id`)
    REFERENCES `students` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_daily_attendance_students1_idx` ON `daily_attendance` (`user_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subjects` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `instructors_subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instructors_subjects` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `instructors_subjects` (
  `user_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `competency` INT NULL,
  PRIMARY KEY (`user_id`, `subject_id`),
  CONSTRAINT `instructors_to_instructors_subjects`
    FOREIGN KEY (`user_id`)
    REFERENCES `instructors` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructors_subjects_subjects`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_instructors_subjects_subjects_idx` ON `instructors_subjects` (`subject_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `projects_subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projects_subjects` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `projects_subjects` (
  `subject_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`subject_id`, `project_id`),
  CONSTRAINT `fk_projects_subjects_to_subjects`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_subjects_to_projects`
    FOREIGN KEY (`project_id`)
    REFERENCES `projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_projects_subjects_to_projects_idx` ON `projects_subjects` (`project_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_accounts` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `user_id` INT NOT NULL,
  `access_level` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_accounts_to_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
