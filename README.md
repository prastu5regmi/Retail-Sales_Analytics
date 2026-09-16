# Retail Sales Analytics & Power BI Dashboard

## Overview

This project is an end-to-end retail sales analytics project using Python, PostgreSQL, SQL, and Power BI.

The project demonstrates the process of cleaning and transforming retail transaction data, storing it in a relational database, and creating interactive dashboards to analyze sales performance.

## Technologies Used

- Python
- Pandas
- PostgreSQL
- SQL
- Power BI
- DAX
- Microsoft Excel
- Git

## Project Workflow

Raw Data → Data Cleaning → Data Transformation → PostgreSQL → SQL Analysis → Power BI Dashboard

## Dataset

The project uses the Online Retail II dataset containing historical retail transactions from 2009–2011.

The original dataset is not included in this repository because of its large file size.

## Data Cleaning & ETL

Python and Pandas were used to:

- Inspect the raw dataset
- Clean and transform the data
- Handle missing values
- Calculate revenue
- Prepare data for database loading
- Load data into PostgreSQL

## Database

A star-schema database was designed using PostgreSQL with fact and dimension tables.

The database supports analysis by:

- Date
- Customer
- Product
- Country

## Power BI Dashboard

The dashboard contains two report pages.

### Retail Sales Performance

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue by Year
- Top Products by Revenue
- Top Products by Quantity
- Revenue by Country

### Customer & Regional Insights

- Revenue by Country and Year
- Top Customers by Revenue
- Regional sales analysis

## Key Insights

- The United Kingdom contributes the majority of total revenue.
- Revenue increased significantly from 2009 to 2010.
- Revenue remained relatively stable between 2010 and the available 2011 data.
- Product rankings differ when comparing revenue and quantity.
- Customer revenue contribution varies across customers.

## Limitations

- The dataset covers 2009–2011.
- Some transactions have missing Customer IDs, limiting customer-level analysis.
- The dataset does not contain sufficient cost information for detailed profit analysis.

## Future Improvements

- Profit and margin analysis
- Supplier analysis
- Customer segmentation
- More detailed time-series analysis
- Additional Power BI reports