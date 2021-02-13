CREATE TABLE Customers_scd
(
  CustomerId int,
  CustomerName varchar(20),
  CustomerCountry varchar(10),
  ValidFrom timestamp,
  Expired timestamp
);

INSERT INTO Customers_scd
  VALUES(100,'Jane','USA','2019-05-01 7:01:10',
    '2020-06-20 8:15:34');
INSERT INTO Customers_scd
  VALUES(100,'Jane','UK','2020-06-20 8:15:34',
    '2199-12-31 00:00:00');
