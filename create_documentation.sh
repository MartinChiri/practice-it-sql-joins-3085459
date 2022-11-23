#!bin/sh
sqlite3 AdventureWorks.db << EOF
.print List of Database Tables
.print -----------------------------
.tables

.print DimCustomer TABLE
.print -----------------------------
PRAGMA table_info('DimCustomer');
EOF