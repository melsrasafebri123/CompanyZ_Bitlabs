# Segmentation Customer with RFM (Recency, Frequency, and Monetary) Analysis
This is the final project of Bitlabs course. In this project, we've been made into a team then we need to make the analysis of company Z's data.
- Contributors : Melsra Safebri (Leader,Me), Safira Yulianti Riani, Kevin Thedeus, Wina Maulidha

## 1. Case Overview
Student diminta untuk menjawab semua kebutuhan reporting dari beberapa stakeholder bisnis Company Z. Berperan sebagai Data Analyst, student diminta untuk berinteraksi dengan database yang dimiliki produk Company Z melalui SQL Code dan ceritakan apa saja insights yang telah didapatkan.
## 2. Dataset
There are 3 datasets that i can't give you because it's forbidden by the company: 
- bitlabs-dab.G-CID-01.companyZ_transactions_Q1_2018
- bitlabs-dab.G-CID-01.companyZ_transactions_Q1_2019
- bitlabs-dab.G-CID-01.companyZ_transactions_Q1_2020
## 3. File Description
### a. [top5Category_byRevenue.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/top5Category_byRevenue.sql)
Stakeholder ingin mengetahui Top 5 Category dengan Revenue tertinggi dari keseluruhan data yang diberikan namun harus dipastikan data tersebut non refund, sehingga dapat mengetahui category mana yang paling menguntungkan dalam periode tersebut.
### b. [top5Category_byTrans.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/top5Category_byTrans.sql)
Stakeholder ingin mengetahui Top 5 Category dengan total transaksi  tertinggi dari keseluruhan data yang diberikan sehingga dapat mengetahui category apa yang dominan diinginkan buyers dalam periode tersebut.
### c. [GMV.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/GMV.sql)
Stakeholder ingin mengetahui trend perkembangan GMV YoY Company Z pada Q1 2018, Q1 2019, dan Q1 2020 untuk 4 kategori yang ingin diprioritaskan: Agriculture & Food, Horeca, Machinery & Industrial Parts, Computer & Communication.
### d. [SuccessOrderRate.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/SuccessOrderRate.sql)
Stakeholder ingin mengetahui Success Order Rate tiap order dilakukan dari tahap order yang dilakukan oleh buyer sampai dengan tahap settlement yang diproses oleh internal Company Z (jika value timestamp settlement_datetime NULL, maka student dapat gunakan timestamp pada received_datetime)
### e. [NumberOfCust.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/NumberOfCust.sql)
Stakeholder ingin mengetahui jumlah buyer berdasarkan Bucket Size, dia membagi total buyer berdasarkan GMV dan Total Transaksi yang tercatat pada Q1 2018, Q1 2019, Q1 2020 dengan beberapa kelompok untuk melihat proporsi buyers kami seperti apa.
### f. [PaymentComparison.sql](https://github.com/melsrasafebri123/CompanyZ_Bitlabs/blob/main/PaymentComparison.sql)
Stakeholder ingin melakukan kerja sama dengan fintech company untuk mempermudah users dalam bertransaksi. Student diminta untuk melakukan comparison analysis terhadap pembayaran yang dilakukan melalui Bank Transfer, TOP, atau e-Wallet.
## 4. Visualization
![Viz_CompanyY]()
## 5. Summary
# THANK YOU
