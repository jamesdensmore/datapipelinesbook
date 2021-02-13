SELECT
  obd.order_date,
  ot.order_count
FROM {{ref('model_1')}} obd
LEFT JOIN other_table ot
  ON ot.some_date = obd.order_date;
