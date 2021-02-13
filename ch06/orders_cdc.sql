CREATE TABLE Orders_cdc
(
  EventType varchar(20),
  OrderId int,
  OrderStatus varchar(20),
  LastUpdated timestamp
);

INSERT INTO Orders_cdc
  VALUES('insert',1,'Backordered',
    '2020-06-01 12:00:00');
INSERT INTO Orders_cdc
  VALUES('update',1,'Shipped',
    '2020-06-09 12:00:25');
INSERT INTO Orders_cdc
  VALUES('delete',1,'Shipped',
    '2020-06-10 9:05:12');
INSERT INTO Orders_cdc
  VALUES('insert',2,'Backordered',
    '2020-07-01 11:00:00');
INSERT INTO Orders_cdc
  VALUES('update',2,'Shipped',
    '2020-07-09 12:15:12');
INSERT INTO Orders_cdc
  VALUES('insert',3,'Backordered',
    '2020-07-11 13:10:12');
