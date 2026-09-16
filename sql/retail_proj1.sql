--Retail Sales Data Warehouse (Star Scheme)


-- DIMENSION: dim_date
-- one row for every single calendar day covering the range of the dataset.
CREATE TABLE dim_date (
    date_key      INT PRIMARY KEY,        --YYYYMMDD
    full_date     DATE NOT NULL,
    year          INT NOT NULL,
    month         INT NOT NULL,
    month_name    VARCHAR(20) NOT NULL,
    quarter       INT NOT NULL,
    day_of_week   VARCHAR(20) NOT NULL
);


-- DIMENSION: dim_customer
-- One row per unique customer.
CREATE TABLE dim_customer (
    customer_key  SERIAL PRIMARY KEY,
    customer_id   INT NOT NULL UNIQUE,    -- natural key from source data
    country       VARCHAR(100)
);


-- DIMENSION: dim_product
-- One row per unique product (StockCode).
CREATE TABLE dim_product (
    product_key   SERIAL PRIMARY KEY,
    stock_code    VARCHAR(20) NOT NULL UNIQUE,   -- natural key from source data
    description   TEXT
);


-- FACT: fact_sales
-- One row per invoice line item. Holds measures + foreign keys.
CREATE TABLE fact_sales (
    sales_key     SERIAL PRIMARY KEY,
    invoice       VARCHAR(20) NOT NULL,
    date_key      INT NOT NULL REFERENCES dim_date(date_key),
    customer_key  INT NOT NULL REFERENCES dim_customer(customer_key),
    product_key   INT NOT NULL REFERENCES dim_product(product_key),
    quantity      INT NOT NULL CHECK (quantity > 0),
    price         NUMERIC(10,2) NOT NULL CHECK (price > 0),
    line_total    NUMERIC(12,2) NOT NULL
);


-- Indexes to speed up common BI query patterns (joins/filters on foreign keys 
-- are the most frequent access pattern for
-- Power BI's star-schema queries).

CREATE INDEX idx_fact_sales_date_key      ON fact_sales(date_key); --speeds up joins/filters to dim_date
CREATE INDEX idx_fact_sales_customer_key  ON fact_sales(customer_key); --speeds up joins/filters to dim_customer
CREATE INDEX idx_fact_sales_product_key   ON fact_sales(product_key); --speeds up joins/filters to dim_product
CREATE INDEX idx_fact_sales_invoice       ON fact_sales(invoice); --speeds up lookups by invoice number

