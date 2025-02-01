#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Enter input file!!!"
    exit 1
fi

input_file="$1"
output_file="output.txt"

if [[ -f "$input_file" && -r "$input_file" ]]; then
    echo "File exists and is readable...beginning process"
else
    echo "File does not exist or is not readable"
    exit 1
fi

# Clearing the output file
> "$output_file"

while IFS= read -r line; do
    frame_time=$(echo "$line" | grep -o '"frame.time": "[^"]*' | cut -d '"' -f 4)
    wlan_fc_type=$(echo "$line" | grep -o '"wlan.fc.type": "[^"]*' | cut -d '"' -f 4)
    wlan_fc_subtype=$(echo "$line" | grep -o '"wlan.fc.subtype": "[^"]*' | cut -d '"' -f 4)

    # Fix for "0" values
    if [[ -n "$frame_time" || "$frame_time" == "0" || 
          -n "$wlan_fc_type" || "$wlan_fc_type" == "0" || 
          -n "$wlan_fc_subtype" || "$wlan_fc_subtype" == "0" ]]; then
        echo "\"frame.time\": \"$frame_time\"," >> "$output_file"
        echo "\"wlan.fc.type\": \"$wlan_fc_type\"," >> "$output_file"
        echo "\"wlan.fc.subtype\": \"$wlan_fc_subtype\"," >> "$output_file"
        echo "" >> "$output_file"  # Add a newline for readability
    fi
done < "$input_file"   
unset IFS
echo "Extraction complete...output saved in: $output_file"