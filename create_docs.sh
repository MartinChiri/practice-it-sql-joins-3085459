#!/bin/sh
sqlite3 AdventureWorks.db <<EOF
.headers on
.mode html
.output adventureworks_docs.html
.print List of Database Tables
.print <table>
SELECT name FROM sqlite_master WHERE type = 'table' AND
name NOT LIKE 'sqlite_%';
.print </table>
-- .tables
.print <BR>
.print DimCustomer table (PRAGMA table_info)
.print <table>
PRAGMA table_info('DimCustomer');
.print </table>
.print <BR>
.print DimCustomer Rows
.print <table>
select count(1) AS NumberOfRows from DimCustomer;
.print </table>
.print <BR>
.print DimCustomer SQL
.print <table style="white-space: pre-wrap">
select sql from sqlite_master where name = 'DimCustomer';
.print </table>
.quit
EOF