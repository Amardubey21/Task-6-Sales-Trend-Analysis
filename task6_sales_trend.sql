mysql> -- Task 6: Sales Trend Analysis (Data Analyst Internship)
mysql>
mysql> -- 1. Create Database
mysql> CREATE DATABASE sales_trend;
Query OK, 1 row affected (0.26 sec)

mysql> USE sales_trend;
Database changed
mysql>
mysql> -- 2. Create Table
mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     order_date DATE,
    ->     amount DECIMAL(10,2),
    ->     product_id INT
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql>
mysql> -- 3. Insert 10 Sample Rows
mysql> INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
    -> (1, '2024-01-05', 500.00, 101),
    -> (2, '2024-01-15', 1200.00, 102),
    -> (3, '2024-02-07', 800.00, 103),
    -> (4, '2024-02-20', 950.00, 101),
    -> (5, '2024-03-03', 400.00, 104),
    -> (6, '2024-03-18', 2200.00, 105),
    -> (7, '2024-04-10', 1700.00, 102),
    -> (8, '2024-04-25', 1300.00, 103),
    -> (9, '2024-05-02', 2500.00, 107),
    -> (10, '2024-05-17', 1900.00, 101);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> -- 4. Monthly Revenue & Order Volume
mysql> SELECT
    ->     EXTRACT(YEAR FROM order_date) AS sales_year,
    ->     EXTRACT(MONTH FROM order_date) AS sales_month,
    ->     SUM(amount) AS total_revenue,
    ->     COUNT(DISTINCT order_id) AS order_volume
    -> FROM orders
    -> GROUP BY sales_year, sales_month
    -> ORDER BY sales_year, sales_month;
+------------+-------------+---------------+--------------+
| sales_year | sales_month | total_revenue | order_volume |
+------------+-------------+---------------+--------------+
|       2024 |           1 |       1700.00 |            2 |
|       2024 |           2 |       1750.00 |            2 |
|       2024 |           3 |       2600.00 |            2 |
|       2024 |           4 |       3000.00 |            2 |
|       2024 |           5 |       4400.00 |            2 |
+------------+-------------+---------------+--------------+
5 rows in set (0.03 sec)

mysql>
mysql> -- 5. Total Revenue
mysql> SELECT SUM(amount) AS overall_revenue FROM orders;
+-----------------+
| overall_revenue |
+-----------------+
|        13450.00 |
+-----------------+
1 row in set (0.00 sec)

mysql>
mysql> -- 6. Total Orders
mysql> SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;
+--------------+
| total_orders |
+--------------+
|           10 |
+--------------+
1 row in set (0.00 sec)

mysql>
mysql> -- 7. Top 3 Months by Revenue
mysql> SELECT
    ->     EXTRACT(YEAR FROM order_date) AS sales_year,
    ->     EXTRACT(MONTH FROM order_date) AS sales_month,
    ->     SUM(amount) AS total_revenue
    -> FROM orders
    -> GROUP BY sales_year, sales_month
    -> ORDER BY total_revenue DESC
    -> LIMIT 3;
+------------+-------------+---------------+
| sales_year | sales_month | total_revenue |
+------------+-------------+---------------+
|       2024 |           5 |       4400.00 |
|       2024 |           4 |       3000.00 |
|       2024 |           3 |       2600.00 |
+------------+-------------+---------------+
3 rows in set (0.00 sec)

mysql>
