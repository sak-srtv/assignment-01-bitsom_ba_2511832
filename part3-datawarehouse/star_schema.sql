-- DIMENSION TABLES
-- =========================

-- Date Dimension table - dim_date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Store Dimension table - dim_store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);

-- Product Dimension table - dim_product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    sales_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- INSERT INTO DIMENSIONS
-- =========================

INSERT INTO dim_date VALUES
(1,'2026-01-01',1,1,2026),
(2,'2026-01-02',2,1,2026),
(3,'2026-02-03',3,3,2026),
(4,'2026-02-04',4,2,2026),
(5,'2026-02-05',5,2,2026);

INSERT INTO dim_store VALUES
(1,'MG Road Store','Mumbai','Maharashtra'),
(2,'Phoenix Mall','Delhi','Delhi'),
(3,'HSR Store','Bangalore','Karnataka');

INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'Mobile Phone','Electronics'),
(3,'Office Chair','Furniture'),
(4,'Desk Lamp','Furniture');


-- INSERT INTO FACT TABLE
-- =========================

INSERT INTO fact_sales VALUES
(1,1,1,1,2,150000.00),
(2,1,1,2,3,70000.00),
(3,2,2,2,1,30000.00),
(4,2,2,3,5,28000.00),
(5,3,3,4,4,9000.00),
(6,3,1,1,1,69000.00),
(7,4,3,2,2,69000.00),
(8,4,2,3,3,15000.00),
(9,5,1,4,6,12000.00),
(10,5,3,1,1,60000.00);