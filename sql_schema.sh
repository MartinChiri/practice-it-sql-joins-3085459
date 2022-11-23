#!/bin/sh
sqlite3 AdventureWorks.db <<EOF
.headers on
.mode html
.output adventureworks_schema.html
.print <h1>
.print .schema
.print </h1>
.print Create table statement for DimCustomer table
.print <br>
.print <span style="white-space: pre-wrap">
.schema DimCustomer
.print </span>
.print <br>
.print Create table statement for all tables
.print <br>
.print <span style="white-space: pre-wrap">
.schema
.print </span>
.quit
EOF

