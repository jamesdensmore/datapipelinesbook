SELECT
  obd.order_date,
  ot.order_count
FROM orders_by_day obd
LEFT JOIN other_table ot
  ON ot.some_date = obd.order_date;
