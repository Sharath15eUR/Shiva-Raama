find . -type f -size +1M -exec ls -lh {} + | awk '{ print $9, $5 }' > large_files.txt

