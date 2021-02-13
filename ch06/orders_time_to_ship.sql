CREATE TABLE orders_time_to_ship (
  OrderId int,
  backordered_days interval
);

INSERT INTO orders_time_to_ship
  (OrderId, backordered_days)
WITH o_backordered AS
(
  SELECT
     OrderId,
     MIN(LastUpdated) AS first_backordered
  FROM Orders_cdc
  WHERE OrderStatus = 'Backordered'
  GROUP BY OrderId
),
o_shipped AS
(
  SELECT
     OrderId,
     MIN(LastUpdated) AS first_shipped
  FROM Orders_cdc
  WHERE OrderStatus = 'Shipped'
  GROUP BY OrderId
)
SELECT b.OrderId,
  first_shipped - first_backordered
    AS backordered_days
FROM o_backordered b
INNER JOIN o_shipped s on s.OrderId = b.OrderId;
