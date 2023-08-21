#!/bin/bash

API_RESPONSE_FILE="response.json"
OUTPUT_FILE="names.json"

if [ -f "$API_RESPONSE_FILE" ]; then
    # Extract names using jq and store in an array
    names=($(jq -r '[.[] | .name.common]' "$API_RESPONSE_FILE"))

    # Create a JSON array manually
    json_array=""
    for name in "${names[@]}"; do
        json_array+="$name"
        echo "$name"
    done

    # Save the JSON array to the output file
    echo "$json_array" > "$OUTPUT_FILE"
    echo "Names saved to $OUTPUT_FILE"
else
    echo "API response file not found"
fi