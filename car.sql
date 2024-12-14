CREATE TABLE Car (
  car_id INT PRIMARY KEY AUTO_INCREMENT,
  make VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  color VARCHAR(20) NOT NULL,
  transmission ENUM('automatic', 'manual') NOT NULL,
  features VARCHAR(255),
  image_url VARCHAR(255)
);



CREATE TABLE Car_Details (
  car_id INT PRIMARY KEY,
  mileage INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  availability ENUM('available', 'sold') NOT NULL,
  FOREIGN KEY (car_id) REFERENCES Car(car_id)
);



CREATE TABLE Customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  address VARCHAR(255) NOT NULL
);



CREATE TABLE Sale (
  sale_id INT PRIMARY KEY AUTO_INCREMENT,
  car_id INT NOT NULL,
  customer_id INT NOT NULL,
  sale_date DATE NOT NULL,
  sale_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (car_id) REFERENCES Car_Details(car_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);



CREATE TABLE Employee (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL
);



CREATE TABLE User (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT,
  username VARCHAR(50) NOT NULL,
  password CHAR(64) NOT NULL,
  user_type ENUM('internal', 'external') NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);