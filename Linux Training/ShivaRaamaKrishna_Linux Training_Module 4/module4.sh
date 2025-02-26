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
    frame_time=$(echo "$line" | grep -oP '(?<="frame.time": ")[^"]*' | head -n 1)
    wlan_fc_type=$(echo "$line" | grep -oP '(?<="wlan.fc.type": ")[^"]*' | head -n 1)
    wlan_fc_subtype=$(echo "$line" | grep -oP '(?<="wlan.fc.subtype": ")[^"]*' | head -n 1)

    # Only print non-empty values
    [[ -n "$frame_time" ]] && echo "\"frame.time\": \"$frame_time\"," >> "$output_file"
    [[ -n "$wlan_fc_type" ]] && echo "\"wlan.fc.type\": \"$wlan_fc_type\"," >> "$output_file"
    [[ -n "$wlan_fc_subtype" ]] && echo "\"wlan.fc.subtype\": \"$wlan_fc_subtype\"," >> "$output_file"

    # Add newline only if at least one value was printed
    if [[ -n "$frame_time" || -n "$wlan_fc_type" || -n "$wlan_fc_subtype" ]]; then
        echo "" >> "$output_file"
    fi

done < "$input_file"

unset IFS
echo "Extraction complete...output saved in: $output_file"