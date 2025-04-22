SELECT
    Warehouse_ID,
    ROUND(AVG(Shipping_Time_Days), 2) AS avg_shipping_time
FROM dbo.supply_chain_extended
GROUP BY Warehouse_ID
ORDER BY avg_shipping_time DESC;

SELECT
    Warehouse_ID,
    Product_Category,
    Current_Stock
FROM dbo.supply_chain_extended
WHERE Current_Stock < 50
ORDER BY Current_Stock ASC;

SELECT
    Location,
    SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS total_profit
FROM dbo.supply_chain_extended
GROUP BY Location
ORDER BY total_profit DESC;

SELECT 
    Warehouse_ID,
    SUM(Current_Stock) AS total_stock
FROM dbo.supply_chain_extended
GROUP BY Warehouse_ID
ORDER BY total_stock DESC;

SELECT 
    Product_Category,
    SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) AS profit
FROM dbo.supply_chain_extended
GROUP BY Product_Category
HAVING SUM(Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) < 0
ORDER BY profit ASC;

IF OBJECT_ID('dbo.supply_chain_with_dates') IS NOT NULL
    DROP TABLE dbo.supply_chain_with_dates;

SELECT 
    *, 
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 800, '2023-01-01') AS Order_Date
INTO dbo.supply_chain_with_dates
FROM dbo.supply_chain_extended;

SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Monthly_Sales) AS Total_Sales
FROM dbo.supply_chain_with_dates
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

SELECT TOP 10 Product_Category, SUM(Demand_Forecast) AS Total_Demand
FROM dbo.supply_chain_extended
GROUP BY Product_Category
ORDER BY Total_Demand DESC;

SELECT TOP 10 Warehouse_ID, Operational_Cost
FROM dbo.supply_chain_extended
ORDER BY Operational_Cost DESC;

SELECT TOP 10 Warehouse_ID, Monthly_Sales
FROM dbo.supply_chain_extended
ORDER BY Monthly_Sales DESC;

SELECT TOP 10 Warehouse_ID, Stockout_Risk
FROM dbo.supply_chain_extended
ORDER BY Stockout_Risk DESC;

SELECT TOP 10 Warehouse_ID, Current_Stock
FROM dbo.supply_chain_extended
ORDER BY Current_Stock DESC;

SELECT TOP 10 Warehouse_ID, Customer_Rating
FROM dbo.supply_chain_extended
ORDER BY Customer_Rating DESC;

SELECT TOP 10 Warehouse_ID, Return_Rate
FROM dbo.supply_chain_extended
ORDER BY Return_Rate DESC;

SELECT TOP 10 Warehouse_ID, Order_Processing_Time
FROM dbo.supply_chain_extended
ORDER BY Order_Processing_Time DESC;

SELECT TOP 10 Warehouse_ID, Transportation_Cost
FROM dbo.supply_chain_extended
ORDER BY Transportation_Cost DESC;