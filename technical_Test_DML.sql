-- DML Scripts

-- ADDING BOOKS

INSERT INTO books(title, description, price, publicated_at, stock) 
VALUES (
	"Cantar de mio cid",
    "El Cantar de mio Cid es un cantar de gesta anónimo que relata hazañas heroicas inspiradas libremente en los últimos años de la vida del caballero castellano Rodrigo Díaz de Vivar el Campeador. La versión conservada fue compuesta, según la mayoría de la crítica actual, alrededor del año 1200.",
	0.65,
    "1980-01-01",
	20
);

DELETE FROM books WHERE id = 1;

INSERT INTO books(title, author, description, price, publicated_at, stock) 
VALUES (
	"1984",
    "George Orwell",
    "1984 es una novela política de ficción distópica, escrita por George Orwell entre 1947 y 1948 y publicada el 8 de junio de 1949",
	4.35,
    "1999-01-01",
	25
);

DELETE FROM books WHERE id = 3;

INSERT INTO books(title, author, description, price, publicated_at, stock) 
VALUES (
	"100 anios de soledad",
    "Gabriel Garcia Marquez",
    "Este es un libro que se escribo por el autor colombiano mas famoso",
	3.26,
    "1990-01-01",
	10
);

-- ADDING GENRES

INSERT INTO genres(name) 
VALUES (
	"Comedy"  
);


INSERT INTO genres(name) 
VALUES (
    "Romance"
);


INSERT INTO genres(name) 
VALUES (
    "Adventure"
);

INSERT INTO genres(name) 
VALUES (
    "Fiction science"
);

INSERT INTO genres(name) 
VALUES (
    "Drama"
);

-- ADDING CLIENTS

INSERT INTO clients(name, direction, email) 
VALUES (
	"Alex Beltran",
    "Calle falsa 123",
    "alex.beltran@correo.com"
);

INSERT INTO clients(name, direction, email) 
VALUES (
	"Keiloh Maria",
    "Avenida siempre viva 123",
    "keiloh.maria@correo.com"
);

-- ADDING BOOK GENRES

INSERT INTO book_genres(id_genre, id_book) 
VALUES (
	1,
    2
);

INSERT INTO book_genres(id_genre, id_book) 
VALUES (
	2,
    4
);

INSERT INTO book_genres(id_genre, id_book) 
VALUES (
	4,
    4
);

INSERT INTO book_genres(id_genre, id_book) 
VALUES (
	3,
    5
);

-- ADDING DELIVERY STATUS

INSERT INTO status(name) 
VALUES (
	"In preparation"
);

INSERT INTO status(name) 
VALUES (
    "On the way"
);

INSERT INTO status(name) 
VALUES (
    "Dispached"
);


--  Relations between tables

-- Relationing book with book_genres

ALTER TABLE `book_Store`.`book_genres` 
ADD INDEX `fk_book_book_id_idx` (`id_book` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`book_genres` 
ADD CONSTRAINT `fk_book_book_id`
  FOREIGN KEY (`id_book`)
  REFERENCES `book_Store`.`books` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Relationing genres with book_genres

ALTER TABLE `book_Store`.`book_genres` 
ADD INDEX `fk_genre_genre_id_idx` (`id_genre` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`book_genres` 
ADD CONSTRAINT `fk_genre_genre_id`
  FOREIGN KEY (`id_genre`)
  REFERENCES `book_Store`.`genres` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
-- Relationing books with orders

ALTER TABLE `book_Store`.`orders` 
ADD INDEX `fk_orders_id_books_idx` (`id_book` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`orders` 
ADD CONSTRAINT `fk_orders_id_books`
  FOREIGN KEY (`id_book`)
  REFERENCES `book_Store`.`books` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
  
-- Relationing clients with orders

ALTER TABLE `book_Store`.`orders` 
ADD INDEX `fk_orders_id_clients_idx` (`id_client` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`orders` 
ADD CONSTRAINT `fk_orders_id_clients`
  FOREIGN KEY (`id_client`)
  REFERENCES `book_Store`.`clients` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

-- Relationing orders with deliveries

ALTER TABLE `book_Store`.`deliveries` 
ADD INDEX `fk_deliveries_id_order_idx` (`id_order` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`deliveries` 
ADD CONSTRAINT `fk_deliveries_id_order`
  FOREIGN KEY (`id_order`)
  REFERENCES `book_Store`.`orders` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

-- Relationing status with deliveries

ALTER TABLE `book_Store`.`deliveries` 
ADD INDEX `fk_deliveries_id_status_idx` (`id_status` ASC) VISIBLE;
;
ALTER TABLE `book_Store`.`deliveries` 
ADD CONSTRAINT `fk_deliveries_id_status`
  FOREIGN KEY (`id_status`)
  REFERENCES `book_Store`.`status` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;



