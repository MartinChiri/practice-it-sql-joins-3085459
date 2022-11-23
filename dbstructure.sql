-- SQLite console
-- .open AdventureWorks.db
-- .headers on
-- .mode html
-- .output adventureworks_docs.html
-- .tables -- show all tables names

-- SQLite querys

-- List all tables in document
SELECT name
FROM sqlite_master
WHERE type = 'table'
AND name NOT LIKE 'sqlite_%';

-- Row count for each table
select "Number of rows in DimCustomer";
select COUNT(1) FROM DimCustomer;
-- Document create scripts for each table
select * from sqlite_master where name = 'DimCustomer';
select sql from sqlite_master where name = 'DimCustomer';
select sql from sqlite_master where name IN ('DimCustomer',
  'DimCurrency', 'DimProduct');
