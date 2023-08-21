#!/bin/bash

folder_path="./text"
keyword="test"

counter=0
for file in "$folder_path"/*.txt; do
    if [ -f "$file" ]; then
        count=$(grep -o -i "$keyword" "$file" | wc -l)
        echo "Found $count occurrences of '$keyword' in $file"
        counter=$((counter+count))
    else
        echo "File not Found!!!"
    fi
done

echo "there is $counter $keyword in $folder_path path"
echo "Keyword counting completed."