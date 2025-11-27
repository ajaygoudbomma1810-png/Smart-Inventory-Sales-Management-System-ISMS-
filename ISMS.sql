-- -------------------------------------------------
-- SMART INVENTORY & SALES MANAGEMENT SYSTEM
-- -------------------------------------------------

DROP DATABASE IF EXISTS ISMS;
CREATE DATABASE ISMS;
USE ISMS;

-- -------------------------------------------------
-- TABLE 1: USERS (Admin, Staff)
-- -------------------------------------------------
CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role ENUM('Admin', 'Staff') NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------------------------
-- TABLE 2: SUPPLIERS
-- -------------------------------------------------
CREATE TABLE Suppliers (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_Name VARCHAR(120) NOT NULL,
    Email VARCHAR(120) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- -------------------------------------------------
-- TABLE 3: PRODUCTS
-- -------------------------------------------------
CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(150) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10,2) NOT NULL,
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- -------------------------------------------------
-- TABLE 4: INVENTORY STOCK
-- -------------------------------------------------
CREATE TABLE Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Available_Quantity INT DEFAULT 0,
    Last_Updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
        ON DELETE CASCADE
);

-- -------------------------------------------------
-- TABLE 5: CUSTOMERS
-- -------------------------------------------------
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(120) NOT NULL,
    Email VARCHAR(120) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- -------------------------------------------------
-- TABLE 6: SALES (Invoice)
-- -------------------------------------------------
CREATE TABLE Sales (
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    User_ID INT,
    Sale_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total_Amount DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
        ON DELETE SET NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
        ON DELETE SET NULL
);

-- -------------------------------------------------
-- TABLE 7: SALES ITEMS
-- -------------------------------------------------
CREATE TABLE Sale_Items (
    Sale_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Sale_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
        ON DELETE CASCADE
);

-- -------------------------------------------------
-- TABLE 8: PAYMENTS
-- -------------------------------------------------
CREATE TABLE Payments (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Sale_ID INT NOT NULL,
    Amount_Paid DECIMAL(10,2) NOT NULL,
    Payment_Method ENUM('Cash', 'Card', 'UPI', 'NetBanking'),
    Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID)
        ON DELETE CASCADE
);

-- -------------------------------------------------
-- INSERT SAMPLE DATA
-- -------------------------------------------------

-- USERS
INSERT INTO Users (Full_Name, Email, Role) VALUES
('Rohit Sharma', 'rohit@store.com', 'Admin'),
('Anjali Verma', 'anjali@store.com', 'Staff'),
('Karan Singh', 'karan@store.com', 'Staff');

-- SUPPLIERS
INSERT INTO Suppliers (Supplier_Name, Email, Phone, Address) VALUES
('FreshFoods Pvt Ltd', 'fresh@foods.com', '9876543210', 'Hyderabad'),
('TechGadgets Inc', 'info@techgadgets.com', '9123456780', 'Mumbai'),
('DailyHome Needs', 'support@dailyhome.com', '9988776655', 'Delhi');

-- PRODUCTS
INSERT INTO Products (Product_Name, Category, Price, Supplier_ID) VALUES
('Rice Bag 25kg', 'Groceries', 1200.00, 1),
('LED Smart TV 42inch', 'Electronics', 28000.00, 2),
('Dish Soap 1L', 'Home Care', 120.00, 3),
('Laptop 8GB RAM', 'Electronics', 55000.00, 2),
('Sugar 5kg', 'Groceries', 250.00, 1);

-- INVENTORY
INSERT INTO Inventory (Product_ID, Available_Quantity) VALUES
(1, 50),
(2, 12),
(3, 200),
(4, 7),
(5, 90);

-- CUSTOMERS
INSERT INTO Customers (Full_Name, Email, Phone, Address) VALUES
('Aman Sharma', 'aman@gmail.com', '9012345678', 'Delhi'),
('Priya Reddy', 'priya@gmail.com', '9087654321', 'Hyderabad'),
('Vikas Yadav', 'vikas@gmail.com', '9977886655', 'Mumbai');

-- SALES
INSERT INTO Sales (Customer_ID, User_ID, Total_Amount) VALUES
(1, 2, 3200.00),
(2, 1, 55000.00),
(3, 3, 400.00);

-- SALES ITEMS
INSERT INTO Sale_Items (Sale_ID, Product_ID, Quantity, Price) VALUES
(1, 1, 2, 1200.00),
(1, 5, 1, 250.00),
(2, 4, 1, 55000.00),
(3, 3, 2, 120.00);

-- PAYMENTS
INSERT INTO Payments (Sale_ID, Amount_Paid, Payment_Method) VALUES
(1, 3200.00, 'UPI'),
(2, 55000.00, 'Card'),
(3, 400.00, 'Cash');
