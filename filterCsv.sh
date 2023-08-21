#!/bin/bash

csv_file="./csv/Book1.csv"
output_file="./csv/filtered.csv"

read -p "Enter the column number to filter: " column_number
read -p "Enter the filter value: " filter_value

awk -v col="$column_number" -v value="$filter_value" 'BEGIN {FS=OFS=","} $col == value' "$csv_file" > "$output_file"

echo "Filtered data saved in $output_file"