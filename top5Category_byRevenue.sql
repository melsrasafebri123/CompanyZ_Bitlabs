-- A.1 
-- Top 5 Cat_Name dengan Revenue tertinggi.
-- revenue = (price x quantity) x % commission
-- data yg diberikan harus dipastikan non refund, sehingga dapat diketahui category mana yang menguntungkan.
-- refund_status ( String )= 
-- payment_datetime IS NOT NULL AND received_datetime IS NULL 
-- non refund = payment_datetime IS NOT NULL AND received_datetime IS NOT NULL


WITH A_1 AS ( 
  SELECT cat_name AS Cat_Name,
  SUM((price*product_quantity)*percentage_commission) AS Revenue,
  '2018' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name

UNION ALL
  SELECT cat_name AS Cat_Name,
  SUM((price*product_quantity)*percentage_commission) AS Revenue,
  '2019' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name

UNION ALL
  SELECT cat_name AS Cat_Name,
  SUM((price*product_quantity)*percentage_commission) AS Revenue,
  '2020' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
  WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  GROUP BY cat_name
)
 
SELECT A_1.Cat_Name,
SUM(A_1.Revenue) AS Revenue
 
FROM A_1
GROUP BY A_1.Cat_Name
ORDER BY 2 DESC
LIMIT 5




-- PERTAHUN

-- 2018
  -- SELECT cat_name AS Cat_Name,
  -- SUM((price*product_quantity)*percentage_commission) as Revenue,
  -- '2018' As Year
  -- FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  -- WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  -- GROUP BY cat_name

-- 2019
  -- SELECT cat_name AS Cat_Name,
  -- SUM((price*product_quantity)*percentage_commission) as Revenue,
  -- '2018' As Year
  -- FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  -- WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  -- GROUP BY cat_name


-- 2020
  -- SELECT cat_name AS Cat_Name,
  -- SUM((price*product_quantity)*percentage_commission) as Revenue,
  -- '2018' As Year
  -- FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  -- WHERE payment_datetime IS NOT NULL AND received_datetime IS NOT NULL
  -- GROUP BY cat_name
