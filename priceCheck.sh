#!/bin/bash

# URL to call
url1="https://www.coinex.com/res/vote2/project/BTC"
url1name="coinex btc/usdt"

function attribute_finder() {
    local url="$1"
    local name="$2"
    local attribute="$3"
    json_content=$(curl -s "$url")
    attribute_value=$(echo "$json_content" | jq -r "$attribute")
    echo "Value of '$attribute': $attribute_value from $name" 
}


attribute_finder "$url1" "$url1name" ".data.price_usd"

