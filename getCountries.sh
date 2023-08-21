#!/bin/bash
echo "pls enter a url or skip it::"
read API_URL
if test -z "$API_URL"; then
    API_URL="https://restcountries.com/v3.1/all"
fi
OUTPUT_FILE="response.json"

# Function to display loading animation
function loading_animation() {
    local delay=0.1
    local spin_chars=('loading /-\' 'loading \-\' 'loading \-/' 'loading /-/')

    local i=0
    while true; do
        printf "%s\r" "${spin_chars[i]}"
        sleep "$delay"
        ((i = (i + 1) % ${#spin_chars[@]}))
    done
}

# Start the loading animation in the background
loading_animation &
loading_pid=$!

# Call the API and save response to a variable
response=$(curl -s "$API_URL")

# Kill the loading animation process
kill "$loading_pid"

# Check if the API call was successful
if [ $? -eq 0 ]; then

    # Convert the names array to JSON and save it to the output file
    echo "$response" > "$OUTPUT_FILE"
    echo "Names saved to $OUTPUT_FILE"
else
    echo "API call failed"
fi