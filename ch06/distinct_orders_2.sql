CREATE TABLE all_orders AS
SELECT
  OrderId,
  OrderStatus,
  LastUpdated,
  ROW_NUMBER() OVER(PARTITION BY OrderId,
                    OrderStatus,
                    LastUpdated)
    AS dup_count
FROM Orders;

TRUNCATE TABLE Orders;

-- only insert non-duplicated records
INSERT INTO Orders
  (OrderId, OrderStatus, LastUpdated)
SELECT
  OrderId,
  OrderStatus,
  LastUpdated
FROM all_orders
WHERE
  dup_count = 1;

DROP TABLE all_orders;
