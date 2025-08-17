-- Databricks notebook source
--create streaming table

CREATE OR REPLACE STREAMING TABLE st_orders
AS
SELECT * FROM STREAM(samples.tpch.orders)

-- COMMAND ----------

--create MV

CREATE OR REPLACE MATERIALIZED VIEW agg_orders
AS
SELECT 
count(o_orderkey) as cnt_orders,
o_orderstatus
FROM LIVE.st_orders
GROUP BY o_orderstatus
