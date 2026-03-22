
-- 1.2 : Scchema Design
-- --------------------------

-- Explanation : orders_flat table can be divided into below tables. 
-- Customers, Products, Sales_Reps, Orders, Order_Items


-- =================================================
-- -------------- CREATE QUERIES--------------------
-- =================================================

-- Customers Table
-- =================

 CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);


-- Products Table
-- ===============

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);


-- Sales_Reps Table
-- =================

CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);


-- Orders Table
-- =============

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);


-- Order_Items Table
-- =================

CREATE TABLE Order_Items (
    order_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =================================================
-- -------------- INSERT QUERIES--------------------
-- =================================================

INSERT INTO Customers VALUES
('C001', 'Raj Kumar', 'raj@gmail.com', 'Bangalore'),
('C002', 'Sameer Patel', 'sameer@gmail.com', 'Pune'),
('C003', 'Neeta Sharma', 'neeta@gmail.com', 'Mumbai'),
('C004', 'Samaira Verma', 'samaira@gmail.com', 'Delhi'),
('C005', 'Parul Singh', 'parul@gmail.com', 'Hyderabad');


INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 90000),
('P002', 'Mouse', 'Electronics', 900),
('P003', 'Keyboard', 'Electronics', 2000),
('P004', 'Monitor', 'Electronics', 18000),
('P005', 'Notebook', 'Stationery', 90);


INSERT INTO Sales_Reps VALUES
('S001', 'Johny', 'johny@gmail.com', 'Bangalore Office'),
('S002', 'Aparna', 'aparna@gmail.com', 'Mumbai Office'),
('S003', 'Amita', 'amita@gmail.com', 'Delhi Office'),
('S004', 'Priya', 'priya@gmail.com', 'Chennai Office'),
('S005', 'Tushar', 'tushar@gmail.com', 'Pune Office');


INSERT INTO Orders VALUES
(101, '2025-01-01', 'C001', 'S001'),
(102, '2025-01-02', 'C002', 'S002'),
(103, '2025-01-03', 'C003', 'S003'),
(104, '2025-01-04', 'C004', 'S004'),
(105, '2025-01-05', 'C005', 'S005');


INSERT INTO Order_Items VALUES
(101, 'P001', 1),
(101, 'P002', 2),
(102, 'P003', 1),
(103, 'P004', 1),
(104, 'P005', 5);


select * from orders_flat where customer_name='Neha Singh'