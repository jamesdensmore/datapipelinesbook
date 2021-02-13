CREATE TABLE pageviews_daily (
  view_date date,
  url_path varchar(250),
  customer_country varchar(50),
  view_count int
);

INSERT INTO pageviews_daily
  (view_date, url_path, customer_country, view_count)
SELECT
  CAST(p.ViewTime as Date) AS view_date,
  p.UrlPath AS url_path,
  c.CustomerCountry AS customer_country,
  COUNT(*) AS view_count
FROM PageViews p
LEFT JOIN Customers c ON c.CustomerId = p.CustomerId
GROUP BY
  CAST(p.ViewTime as Date),
  p.UrlPath,
  c.CustomerCountry;
