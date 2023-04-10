CREATE DATABASE book_Store;

USE book_Store;

-- DDL Scripts:

-- Creating the table book

CREATE TABLE `book_Store`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(60) NOT NULL,
  `author` VARCHAR(45) NULL DEFAULT 'anonimous',
  `description` TEXT NOT NULL,
  `price` DOUBLE NOT NULL,
  `publicated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `available` TINYINT NULL DEFAULT 1,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id`));

-- Creating the table genre

CREATE TABLE `book_Store`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

-- Creating the table client

CREATE TABLE `book_Store`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `direction` VARCHAR(60) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- CREATING BOOK GENRES

CREATE TABLE `book_Store`.`book_genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_genre` INT NOT NULL,
  `id_book` INT NOT NULL,
  PRIMARY KEY (`id`));

-- CREATING ORDER TABLE

CREATE TABLE `book_Store`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `id_book` INT NOT NULL,
  `ordered_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

-- CREATING DELIVERY TABLE

CREATE TABLE `book_Store`.`deliveries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_order` INT NOT NULL,
  `id_status` INT NOT NULL,
  `dispached_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

-- CREATING STATUS TABLE

CREATE TABLE `book_Store`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
