SELECT COUNT(*) 
FROM supply_chain;

SELECT
    COUNT(*) AS total_records,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(unit_price), 2) AS average_unit_price,
    ROUND(AVG(supplier_lead_time_days), 2) AS avg_supplier_lead_time
FROM supply_chain;

SELECT
    year,
    month,
    month_name,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM supply_chain
GROUP BY year, month, month_name
ORDER BY year, month;

SELECT
    warehouse_id,
    SUM(units_sold) AS total_units_sold,
    SUM(inventory_level) AS total_inventory,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM supply_chain
GROUP BY warehouse_id
ORDER BY total_revenue DESC;

SELECT
    supplier_id,
    SUM(order_quantity) AS total_order_quantity,
    ROUND(AVG(supplier_lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) AS total_records
FROM supply_chain
GROUP BY supplier_id
ORDER BY avg_lead_time_days ASC;

SELECT
    stock_status,
    COUNT(*) AS total_records,
    SUM(units_sold) AS total_units_sold,
    SUM(inventory_level) AS total_inventory
FROM supply_chain
GROUP BY stock_status
ORDER BY total_records DESC;

SELECT
    region,
    SUM(stockout_flag) AS total_stockouts,
    COUNT(*) AS total_records,
    ROUND(
        SUM(stockout_flag) * 100.0 / COUNT(*), 2
    ) AS stockout_percentage
FROM supply_chain
GROUP BY region
ORDER BY stockout_percentage DESC;

SELECT
    sku_id,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(inventory_level), 2) AS avg_inventory
FROM supply_chain
GROUP BY sku_id
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    promotion_flag,
    CASE
        WHEN promotion_flag = 1 THEN 'Promotion'
        ELSE 'No Promotion'
    END AS promotion_status,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(units_sold), 2) AS avg_units_sold
FROM supply_chain
GROUP BY promotion_flag
ORDER BY promotion_flag;

