-- A.2
-- Top 5 Cat_Name dengan Total Transaksi tertinggi
-- is_paid =  payment_datetime IS NOT NULL
-- not paid = payment_datetime NULL
-- not refund = payment_datetime IS NOT NULL AND received_datetime IS NOT NULL


WITH A_2 AS (
SELECT cat_name AS Category_Name,
  COUNT(order_id) AS Transaction_Total,
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name

UNION ALL
SELECT cat_name AS Category_Name,
  COUNT(order_id) AS Transaction_Total,  
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name

UNION ALL
SELECT cat_name AS Category_Name,
  COUNT(order_id) AS Transaction_Total,  
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name
  
)

SELECT A_2.Category_Name,
SUM(A_2.Transaction_Total) AS Transaction_Total
FROM A_2
GROUP BY A_2.Category_Name
ORDER BY 2 DESC
LIMIT 5



-- PERTAHUN

-- 2018
-- SELECT cat_name AS Cat_Name,
--   COUNT(order_id) AS total_transaksi,'2018' AS Year
--   FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
--   WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
--   GROUP BY cat_name
--   ORDER BY 2 DESC

-- 2019
-- SELECT cat_name AS Cat_Name,
--   COUNT(order_id) AS total_transaksi,'2019' AS Year
--   FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
--   WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
--   GROUP BY cat_name
--   ORDER BY 2 DESC

-- 2020
-- SELECT cat_name AS Cat_Name,
--   COUNT(order_id) AS total_transaksi,'2020' AS Year
--   FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
--   WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
--   GROUP BY cat_name
--   ORDER BY 2 DESC
