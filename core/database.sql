-- MySQL Script generated by MySQL Workbench
-- 07/04/16 17:34:42
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nlrobots
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nlrobots
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nlrobots` DEFAULT CHARACTER SET utf8 ;
USE `nlrobots` ;

-- -----------------------------------------------------
-- Table `nlrobots`.`store_tax_rules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_tax_rules` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_tax_rules` (
  `tax_id` INT NOT NULL,
  `tax_name` VARCHAR(128) NOT NULL,
  `tax_percentage` DECIMAL NOT NULL,
  PRIMARY KEY (`tax_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_products` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `last_modified` DATETIME NOT NULL,
  `price` DECIMAL NOT NULL,
  `tax_id` INT NULL,
  `sku` VARCHAR(45) NOT NULL,
  `name` VARCHAR(512) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `tax_id_idx` (`tax_id` ASC),
  CONSTRAINT `tax_id`
    FOREIGN KEY (`tax_id`)
    REFERENCES `nlrobots`.`store_tax_rules` (`tax_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`accounts` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`accounts` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(24) NOT NULL,
  `password` CHAR(60) NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `department` VARCHAR(255) NULL,
  `permission_level` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_product_attributes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_product_attributes` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_product_attributes` (
  `attribute_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`attribute_id`),
  INDEX `product_id_idx` (`product_id` ASC),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `nlrobots`.`store_products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_catalog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_catalog` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_catalog` (
  `category_id` INT NOT NULL,
  `parent_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_catalog_relations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_catalog_relations` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_catalog_relations` (
  `id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `catalog_relations_idx` (`product_id` ASC),
  INDEX `catalog_relations_idx1` (`category_id` ASC),
  CONSTRAINT `catalog_relations`
    FOREIGN KEY (`product_id`)
    REFERENCES `nlrobots`.`store_products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `catalog_relations`
    FOREIGN KEY (`category_id`)
    REFERENCES `nlrobots`.`store_catalog` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_customers` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` INT NULL,
  `street` VARCHAR(255) NULL,
  `house_number` VARCHAR(45) NULL,
  `city` VARCHAR(255) NULL,
  `country` VARCHAR(255) NULL,
  `postal_code` VARCHAR(255) NULL,
  `password` VARCHAR(128) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_orders` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_orders` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `transaction_id` INT NULL,
  `status` VARCHAR(255) NOT NULL,
  `shipment_id` INT NULL,
  `invoice_id` INT NULL,
  `total` DECIMAL NOT NULL,
  `items` TINYTEXT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_order_idx` (`customer_id` ASC),
  CONSTRAINT `customer_order`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nlrobots`.`store_customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_inventory` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_inventory` (
  `id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `inventory_count_idx` (`product_id` ASC),
  CONSTRAINT `inventory_count`
    FOREIGN KEY (`product_id`)
    REFERENCES `nlrobots`.`store_products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_invoices` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_invoices` (
  `invoice_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `file_url` TINYTEXT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `invoice_customer_idx` (`customer_id` ASC),
  INDEX `invoice_order_idx` (`order_id` ASC),
  CONSTRAINT `invoice_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nlrobots`.`store_customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoice_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `nlrobots`.`store_orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_shipments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_shipments` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_shipments` (
  `shipment_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`shipment_id`),
  INDEX `order_id_idx` (`order_id` ASC),
  INDEX `shipment_customer_idx` (`customer_id` ASC),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `nlrobots`.`store_orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `shipment_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nlrobots`.`store_customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nlrobots`.`store_transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nlrobots`.`store_transactions` ;

CREATE TABLE IF NOT EXISTS `nlrobots`.`store_transactions` (
  `transaction_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `gateway` VARCHAR(255) NOT NULL,
  `total` DECIMAL NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `transaction_order_idx` (`order_id` ASC),
  INDEX `transaction_customer_idx` (`customer_id` ASC),
  CONSTRAINT `transaction_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `nlrobots`.`store_orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transaction_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nlrobots`.`store_customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
