create database db_batch6_obms;

use db_batch6_obms;

-- Table: Users
CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	role ENUM('admin', 'customer') DEFAULT 'customer'
);

INSERT INTO Users (name, email, password, role)
VALUES
	('admin', 'admin@admin.com', '123456', 'admin');

-- login.php
	if ($password == $row['password']) {
 
-- Table: Books
CREATE TABLE Books (
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	author VARCHAR(100),
	price DECIMAL(10, 2) NOT NULL,
	stock INT DEFAULT 0,
	category VARCHAR(50)
);
 
-- Table: Orders
CREATE TABLE Orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	order_date DATE DEFAULT CURRENT_DATE,
	total_amount DECIMAL(10, 2),
	status ENUM('pending', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
 
-- Table: OrderDetails
CREATE TABLE OrderDetails (
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT,
	book_id INT,
	quantity INT,
	price DECIMAL(10, 2),
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
 
-- Table: Reviews
CREATE TABLE Reviews (
	review_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	book_id INT,
	rating INT CHECK (rating BETWEEN 1 AND 5),
	comment TEXT,
	review_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
