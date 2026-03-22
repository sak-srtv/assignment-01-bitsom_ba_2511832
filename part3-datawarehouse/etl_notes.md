### Decision 1 - Removing Duplicates

Problem : While creating a star schema design, raw table may contain duplicate records due to various reasons like data ingestion issues. If duplicates are loaded in fact table (eg. fact_sales table), it can impact sales calculation or number of quantity sold. 

Resolution : While designing ETL process, duplicate rows are identified using identifiers (like sale_id). Only trasactions with unique identifies should be loaded into fact_sales table.

### Decision 2 - Separating Product and Store related data into Dimension Tables

Problem : If data like product and store details are repeated for every transaction in raw transactional data, it will 
create redundancy if stored directly in fact table.

Resolution : To resolve this, product related fields like product_name, category should be moved to dim_product table and store details like store_name,city, state are stored in dim_store table. The fact_sales table should have only foreign keys
(product_id, store_id) to support better analytical queries

### Decision 3 - Converting datatypes

Problem : Raw data can have quantity or sales_amount as text values or any other fomatting issues

Resolution : To resolve this, these fields shouuld be converted into proper numeric types (like INT for quantity and DECIMAL for sales amount) during transformation. This helps in achieving correct aggregation and reporting.