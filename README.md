# Smart-Inventory-Sales-Management-System-ISMS-
Smart Inventory &amp; Sales Management System (ISMS) using mysql and draw.io
Smart Inventory & Sales Management System (ISMS)

A Full MySQL Database Project with ER Diagram & Sample Data

📘 Project Overview

The Smart Inventory & Sales Management System (ISMS) is a complete relational database designed to manage:

Product catalog

Suppliers and inventory

Customers

Sales and billing

Payments

Staff/admin users

This project demonstrates:

✔ Proper database normalization
✔ Primary & foreign key relationships
✔ Many-to-one and one-to-many relationships
✔ Realistic business logic
✔ SQL queries for inserting and managing data
✔ Professional ER diagram

This project is ideal for DBMS college submissions, backend development practice, MySQL learning, and portfolio building.

🗃️ Features of the Database
1. User Management

Admin & Staff users

Tracks sales handled by staff

2. Supplier Management

Stores supplier information

Linked to product catalog

3. Inventory Management

Tracks product stock

Auto-linked with product table

4. Customer Records

Customers who purchase items

5. Sales & Billing

Each sale has items, quantities, and total amounts

Connected to users and customers

6. Payments

Tracks how the customer paid

Supports Cash, Card, UPI, NetBanking

🛠️ Tech Stack
Component	Technology
Database	MySQL 8+
ER Diagram	Draw.io
SQL Execution	MySQL Workbench / XAMPP / WAMP
Documentation	Markdown (README)
📁 Project Structure
📦 ISMS-Database-Project
 ┣ 📜 ISMS_DB.sql                --> Full SQL script (tables + relations + sample data)
 ┣ 📊 ISMS_ER_Diagram.png        --> ER diagram exported from Draw.io
 ┣ 📄 README.md                  --> Documentation

🧾 Database Schema Overview
Tables Included
Table Name	Description
Users	Admins and staff members
Suppliers	Supplier data
Products	Product catalog
Inventory	Stock levels
Customers	Customer details
Sales	Sales invoices
Sale_Items	Items included in each sale
Payments	Payment details for sales
🔗 Key Relationships

Suppliers → Products (1:M)

Products → Inventory (1:1)

Customers → Sales (1:M)

Users → Sales (1:M)

Sales → Sale_Items (1:M)

Products → Sale_Items (1:M)

Sales → Payments (1:M)

🧬 ER Diagram

The ER diagram clearly shows all relationships between tables.

👉 File Name: ISMS_ER_Diagram.png
👉 Created Using: Draw.io
👉 Includes: PK, FK, cardinality notation (crow’s foot)

🛠️ How to Run This Project
Step 1: Install MySQL

You can use:

MySQL Community Server

MySQL Workbench

XAMPP / WAMP

Step 2: Import Database

Open MySQL Workbench → New SQL Tab → paste:

source ISMS_DB.sql;


Or manually copy the full SQL script and run it.

Step 3: Verify Tables

Run:

SHOW TABLES;


You should see all 8 tables.

🧪 Sample Queries
Fetch all products with suppliers:
SELECT Products.Product_Name, Suppliers.Supplier_Name
FROM Products
JOIN Suppliers ON Products.Supplier_ID = Suppliers.Supplier_ID;

Find low stock items:
SELECT * FROM Inventory
WHERE Available_Quantity < 10;

Get total sales for a customer:
SELECT c.Full_Name, SUM(s.Total_Amount) AS TotalSpent
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID
GROUP BY c.Full_Name;

🎯 Purpose of This Project

This project helps with:

Learning relational database design

Understanding SQL constraints (PK, FK, Cascade rules)

Demonstrating ER modeling

College mini-project submission

Backend developer portfolio
