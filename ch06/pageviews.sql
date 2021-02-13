CREATE TABLE PageViews (
  CustomerId int,
  ViewTime timestamp,
  UrlPath varchar(250),
  utm_medium varchar(50)
);

INSERT INTO PageViews
  VALUES(100,'2020-06-01 12:00:00',
    '/home','social');
INSERT INTO PageViews
  VALUES(100,'2020-06-01 12:00:13',
    '/product/2554',NULL);
INSERT INTO PageViews
  VALUES(101,'2020-06-01 12:01:30',
    '/product/6754','search');
INSERT INTO PageViews
  VALUES(102,'2020-06-02 7:05:00',
    '/home','NULL');
INSERT INTO PageViews
  VALUES(101,'2020-06-02 12:00:00',
    '/product/2554','social');
