CREATE TABLE IF NOT EXISTS order_summary_daily (
order_date date,
order_country varchar(10),
total_revenue numeric,
order_count int
);

INSERT INTO order_summary_daily
  (order_date, order_country,
  total_revenue, order_count)
SELECT
  o.OrderDate AS order_date,
  c.CustomerCountry AS order_country,
  SUM(o.OrderTotal) as total_revenue,
  COUNT(o.OrderId) AS order_count
FROM Orders o
INNER JOIN Customers c on
  c.CustomerId = o.CustomerId
GROUP BY o.OrderDate, c.CustomerCountry;
