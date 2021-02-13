CREATE TABLE Customers_staging (
  CustomerId int,
  CustomerName varchar(20),
  CustomerCountry varchar(10),
  LastUpdated timestamp
);

INSERT INTO Customers_staging
  VALUES(100,'Jane','USA','2019-05-01 7:01:10');
INSERT INTO Customers_staging
  VALUES(101,'Bob','UK','2020-01-15 13:05:31');
INSERT INTO Customers_staging
  VALUES(102,'Miles','UK','2020-01-29 9:12:00');
INSERT INTO Customers_staging
  VALUES(100,'Jane','UK','2020-06-20 8:15:34');
