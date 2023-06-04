-- Stakeholder ingin mengetahui trend perkembangan GMV YoY
-- 4 kategori yang ingin diprioritaskan: 
-- Agriculture & Food
-- Horeca
-- Machinery & Industrial Parts
-- Computer & Communication

WITH A_3 AS (
SELECT cat_name AS Cat_Name,
  '2018' AS YEAR,
  SUM(price * product_quantity) AS GMV
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
  WHERE 
      cat_name = 'Agriculture & Food' OR
      cat_name = 'Horeca' OR
      cat_name = 'Machinery & Industrial Parts' OR
      cat_name = 'Computer & Communication'
  GROUP BY cat_name

UNION ALL
SELECT cat_name AS Cat_Name,
  '2019' AS YEAR,
  SUM(price * product_quantity) AS GMV
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
  WHERE 
      cat_name = 'Agriculture & Food' OR
      cat_name = 'Horeca' OR
      cat_name = 'Machinery & Industrial Parts' OR
      cat_name = 'Computer & Communication'
  GROUP BY cat_name

UNION ALL
SELECT cat_name AS Cat_Name,
  '2020' AS YEAR,
  SUM(price * product_quantity) AS GMV
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
  WHERE
      cat_name = 'Agriculture & Food' OR
      cat_name = 'Horeca' OR
      cat_name = 'Machinery & Industrial Parts' OR
      cat_name = 'Computer & Communication'
  GROUP BY cat_name
)

SELECT A_3.Cat_Name, A_3.YEAR, A_3.GMV,
(( LAG(A_3.GMV,0) OVER(PARTITION BY A_3.Cat_Name ORDER BY A_3.YEAR)
 - LAG(A_3.GMV,1) OVER(PARTITION BY A_3.Cat_Name ORDER BY A_3.YEAR))
  /LAG(A_3.GMV,1) OVER(PARTITION BY A_3.Cat_Name ORDER BY A_3.YEAR)) *100 AS YoY
FROM A_3
ORDER BY A_3.Cat_Name, A_3.YEAR


-- PERTAHUN

-- 2018
-- SELECT cat_name AS Cat_Name,
--   '2018' AS YEAR,
--   SUM(price * product_quantity) AS GMV
--   FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
--   WHERE 
--       cat_name = 'Agriculture & Food' OR
--       cat_name = 'Horeca' OR
--       cat_name = 'Machinery & Industrial Parts' OR
--       cat_name = 'Computer & Communication'
--   GROUP BY cat_name
