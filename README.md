# Superstore Analytics: dbt & Snowflake Pipeline

## Project Overview
This project transforms raw transactional data from the Global Superstore dataset into a governed, tested, and high-performance analytics layer. Built using **dbt Cloud** and **Snowflake**, the architecture follows the **Medallion (Bronze/Gold)** methodology to ensure data quality and reusability.

## Technical Stack
- **Data Warehouse:** Snowflake
- **Transformation Tool:** dbt Cloud (v2.0 Fusion)
- **Version Control:** GitHub
- **Language:** SQL (Jinja-templated)

## Architecture & Data Flow

### 1. Staging Layer 
Raw CSV data was ingested into Snowflake and transformed into modular staging views. 
- `stg_orders`: Cleanses transaction headers, standardizes casing, and renames columns for readability.
- `stg_returns`: Isolates return status for easy joining.
- `stg_people`: Maps regional managers to their respective territories.

### 2. Marts Layer 
Business-ready fact tables derived from the staging layer.
- `fct_manager_performance`: A comprehensive table joining all sources to calculate:
    - **Total Orders** and **Total Sales** per manager.
    - **Return Rate %**: A custom business KPI to identify high-risk regions.
    - **Profitability**: Aggregated profit by regional manager.

## Data Quality & Testing
The project implements automated schema tests to enforce data integrity:
- **Not Null:** Applied to primary keys to prevent data gaps.
- **Unique:** Applied to the final marts layer to ensure the grain (manager level) is preserved.
- **Quote Handling:** Implemented escaped quoting for identifiers with spaces (e.g., `"Order ID"`) to ensure compatibility with Snowflake's metadata requirements.

## How to Run
To rebuild the entire pipeline and run all tests, use the following command:
```bash
dbt build
