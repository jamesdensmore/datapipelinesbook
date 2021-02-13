CREATE TABLE distinct_orders AS
SELECT DISTINCT OrderId,
  OrderStatus,
  LastUpdated
FROM ORDERS;

TRUNCATE TABLE Orders;

INSERT INTO Orders
SELECT * FROM distinct_orders;

DROP TABLE distinct_orders;
