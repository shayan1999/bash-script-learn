#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 5 ]; then
    echo "Usage: $0 input_file output_file column_number old_string new_string"
    exit 1
fi

input_file="$1"
output_file="$2"
column_number="$3"
old_string="$4"
new_string="$5"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

# Process the input file and save the result to the output file
while IFS=',' read line; do
    IFS=',' read -ra fields <<< "$line"
    fields[$((column_number - 1))]=${fields[$((column_number - 1))]//"$old_string"/"$new_string"}
    new_line=$(IFS=,; echo "${fields[*]}")
    echo "$new_line"
done < "$input_file" > "$output_file"