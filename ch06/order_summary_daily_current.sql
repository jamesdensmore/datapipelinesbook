CREATE TABLE order_summary_daily_current
(
  order_date date,
  order_country varchar(10),
  total_revenue numeric,
  order_count int
);

INSERT INTO order_summary_daily_current
  (order_date, order_country,
  total_revenue, order_count)
WITH customers_current AS
(
  SELECT CustomerId,
    MAX(LastUpdated) AS latest_update
  FROM Customers_staging
  GROUP BY CustomerId
)
SELECT
  o.OrderDate AS order_date,
  cs.CustomerCountry AS order_country,
  SUM(o.OrderTotal) AS total_revenue,
  COUNT(o.OrderId) AS order_count
FROM Orders o
INNER JOIN customers_current cc
  ON cc.CustomerId = o.CustomerId
INNER JOIN Customers_staging cs
  ON cs.CustomerId = cc.CustomerId
    AND cs.LastUpdated = cc.latest_update
GROUP BY o.OrderDate, cs.CustomerCountry;
