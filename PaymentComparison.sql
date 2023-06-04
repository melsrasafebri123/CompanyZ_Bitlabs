#C.2 Stakeholder ingin melakukan kerja sama dengan fintech company untuk mempermudah users dalam bertransaksi. 
#Student diminta untuk melakukan comparison analysis terhadap pembayaran yang dilakukan melalui Bank Transfer,TOP, atau e-Wallet.
  
SELECT
  DISTINCT EXTRACT(YEAR FROM DATETIME(2018, 01, 24, 23, 08, 46)) AS Year,
  COUNT(CASE
      WHEN payment_method LIKE '%Bank%' THEN 1
      WHEN payment_method LIKE 'B%' THEN 1
      WHEN payment_method LIKE 'M%' THEN 1
      WHEN payment_method LIKE 'Permata' THEN 1
      END) AS Bank_Transfer,
  COUNT(CASE
      WHEN payment_method LIKE '__e%' THEN 1 
      END) AS Term_of_Payment,
  COUNT(CASE
      WHEN payment_method LIKE '' THEN 1 
      END) AS E_Wallet,
  COUNT(CASE
      WHEN payment_method LIKE 'Payment Nothing' THEN 1
      END) AS Others
FROM
  `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018`
WHERE
  payment_datetime IS NOT NULL
  AND received_datetime IS NOT NULL
UNION ALL
SELECT
  DISTINCT EXTRACT(YEAR FROM DATETIME(2019, 03, 01, 13, 02, 58)) AS Year,
  COUNT(CASE
      WHEN payment_method LIKE '%Bank%' THEN 1
      WHEN payment_method LIKE 'B%' THEN 1
      WHEN payment_method LIKE 'M%' THEN 1
      WHEN payment_method LIKE 'Permata' THEN 1 
      END) AS Bank_Transfer,
  COUNT(CASE
      WHEN payment_method LIKE '__e%' THEN 1 
      END) AS Term_of_Payment,
  COUNT(CASE
      WHEN payment_method LIKE 'Ralali Wallet' THEN 1
      WHEN payment_method LIKE 'Ovo' THEN 1 
      END) AS E_Wallet,
  COUNT(CASE
      WHEN payment_method LIKE 'Payment Nothing' THEN 1
      END) AS Others
FROM
  `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019`
WHERE
  payment_datetime IS NOT NULL
  AND received_datetime IS NOT NULL
UNION ALL
SELECT
  DISTINCT EXTRACT(YEAR FROM DATETIME(2020, 02, 11, 18, 52, 03)) AS Year,
  COUNT(CASE
      WHEN payment_method LIKE '%Bank%' THEN 1
      WHEN payment_method LIKE 'B%' THEN 1
      WHEN payment_method LIKE 'M%' THEN 1
      WHEN payment_method LIKE 'Permata' THEN 1
      END) AS Bank_Transfer,
  COUNT(CASE
      WHEN payment_method LIKE '__e%' THEN 1
      END) AS Term_of_Payment,
  COUNT(CASE
      WHEN payment_method LIKE 'Ralali Wallet' THEN 1
      WHEN payment_method LIKE 'Ovo' THEN 1
      END) AS E_Wallet,
  COUNT(CASE
      WHEN payment_method LIKE 'Payment Nothing' THEN 1
      END) AS Others
FROM
  `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020`
WHERE
  payment_datetime IS NOT NULL
  AND received_datetime IS NOT NULL
ORDER BY
  Year ASC
