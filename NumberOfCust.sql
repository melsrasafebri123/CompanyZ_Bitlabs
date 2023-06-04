##Number of Customers for Each Bucket for Marketplace
WITH
  tbl AS (
  SELECT
    order_id,
    buyer_id,
    EXTRACT(YEAR FROM DATETIME(2018, 01, 24, 23, 08, 46)) AS Year,
    COUNT(buyer_id) total_transaction,
    SUM(price * product_quantity) gmv
  FROM
    `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  GROUP BY
    1,2 
  UNION ALL
  SELECT
    order_id,
    buyer_id,
    EXTRACT(YEAR FROM DATETIME(2019, 03, 01, 13, 02, 58)) AS Year,
    COUNT(buyer_id) total_transaction,
    SUM(price * product_quantity) gmv
  FROM
    `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
  GROUP BY
    1,2 
  UNION ALL
  SELECT
    order_id,
    buyer_id,
    EXTRACT(YEAR FROM DATETIME(2020, 02, 11, 18, 52, 03)) AS Year,
    COUNT(buyer_id) total_transaction,
    SUM(price * product_quantity) gmv
  FROM
    `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
  GROUP BY
    1,2 
    ),
  
  tbl_2 AS (
  SELECT
    Year, buyer_id,
    COUNT(buyer_id) total_transaction,
    (CASE
        WHEN SUM(gmv) <10000000 THEN '0 - 10 Mil IDR'
        WHEN SUM(gmv) BETWEEN 10000000 AND 25000000 THEN '10 - 25 Mil IDR'
        WHEN SUM(gmv) BETWEEN 25000000 AND 50000000 THEN '25 - 50 MIl IDR'
        WHEN SUM(gmv) BETWEEN 50000000 AND 75000000 THEN '50 - 75 Mil IDR'
        WHEN SUM(gmv) BETWEEN 75000000 AND 100000000 THEN '75 - 100 Mil IDR'
      ELSE
      '>100 Mil IDR'
    END
      ) AS Annual_GMV,
  FROM
    tbl
  GROUP BY
    1,2),
  
  tbl_3 AS(
  SELECT
    Year,
    Annual_GMV,
    COUNT(CASE WHEN total_transaction <6 THEN 1
    END) AS Under_6,
    COUNT(CASE WHEN total_transaction BETWEEN 6 AND 10 THEN 1
    END) AS Between_6_10,
    COUNT(CASE WHEN total_transaction BETWEEN 11 AND 15 THEN 1
    END) AS Between_11_15,
    COUNT(CASE WHEN total_transaction BETWEEN 16 AND 20 THEN 1
    END) AS Between_16_20,
    COUNT(CASE WHEN total_transaction >20 THEN 1
    END) AS Above_20
  FROM
    tbl_2
  GROUP BY
    1,2
  ORDER BY Year, Annual_GMV ASC)

SELECT * FROM tbl_3;
