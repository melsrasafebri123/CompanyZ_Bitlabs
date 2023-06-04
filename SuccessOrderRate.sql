-- Stakeholder ingin mengetahui Success Order Rate 
-- Jika value timestamp settlement_datetime NULL, maka student dapat gunakan timestamp pada received_datetime
-- Tiap order dilakukan oleh buyer sampai tahap settlement


-- DIGABUNG

WITH B_1 AS (
  SELECT 
  Z.order_datetime AS Ordered,
  Z.payment_datetime AS Paid,
  Z.processed_datetime AS Processed,
  Z.received_datetime AS Received,
  Z.delivered_datetime AS Delivered,
  Z.settled_datetime AS Settled,
  '2018' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2018` AS Z

UNION ALL
  SELECT
  Y.order_datetime AS Ordered,
  Y.payment_datetime AS Paid,
  Y.processed_datetime AS Processed,
  Y.received_datetime AS Received,
  Y.delivered_datetime AS Delivered,
  Y.settled_datetime AS Settled,
  '2019' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2019` AS Y

UNION ALL
  SELECT
  X.order_datetime AS Ordered,
  X.payment_datetime AS Paid,
  X.processed_datetime AS Processed,
  X.received_datetime AS Received,
  X.delivered_datetime AS Delivered,
  X.settled_datetime AS Settled,
  '2020' AS Year
  FROM `bitlabs-dab.G_CID_01.ralali_transactions_Q1_2020` AS X
)

SELECT 
COUNT(IF(B_1.Ordered IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Ordered,
COUNT(IF(B_1.Paid IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Paid,
COUNT(IF(B_1.Processed IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Processed,
COUNT(IF(B_1.Received IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Received,
COUNT(IF(B_1.Delivered IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Delivered,
COUNT(IF(B_1.Settled IS NULL,NULL,1))/COUNT(B_1.Ordered)*100 AS Settled,

FROM B_1
