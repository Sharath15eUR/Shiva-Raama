#!/bin/bash

# Log file for errors
ERROR_LOG="errors.log"

# Function to log errors
log_error() {
    echo "Error: $1" | tee -a "$ERROR_LOG"
}

# Recursive function to search for files containing the keyword
search_directory() {
    local dir="$1"
    local keyword="$2"

    # Check if the provided directory is valid
    if [[ ! -d "$dir" ]]; then
        log_error "Invalid directory: $dir"
        return
    fi

    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
            search_directory "$file" "$keyword" # Recursive call
        elif [[ -f "$file" ]]; then
            if grep -q "$keyword" "$file" 2>/dev/null; then
                echo "Found '$keyword' in: $file"
            fi
        fi
    done
}

# Function to display help menu using a here document
display_help() {
    cat <<EOF
Usage: $0 [options]

Options:
  -d <directory>   Search for a keyword recursively in a directory.
  -f <file>        Search for a keyword in a specific file.
  -k <keyword>     Keyword to search for.
  --help           Display this help menu.

Examples:
  $0 -d logs -k error      # Search for 'error' in the 'logs' directory.
  $0 -f script.sh -k TODO  # Search for 'TODO' in 'script.sh'.
  $0 --help                # Display this help menu.
EOF
}

# Function to search a file using a here string
search_file() {
    local file="$1"
    local keyword="$2"

    if [[ ! -f "$file" ]]; then
        log_error "File not found: $file"
        return
    fi

    if grep -q "$keyword" <<<"$(cat "$file")"; then
        echo "Found '$keyword' in: $file"
    else
        echo "No match found in: $file"
    fi
}

# Validate keyword using regex (must be non-empty and contain only letters, numbers, or underscores)
validate_keyword() {
    local keyword="$1"
    if [[ -z "$keyword" || ! "$keyword" =~ ^[a-zA-Z0-9_]+$ ]]; then
        log_error "Invalid keyword: '$keyword'"
        exit 1
    fi
}

# Parse command-line arguments using getopts
while getopts ":d:f:k:-:" opt; do
    case "$opt" in
        d) directory="$OPTARG" ;;
        f) file="$OPTARG" ;;
        k) keyword="$OPTARG" ;;
        -) case "$OPTARG" in
               help) display_help; exit 0 ;;
               *) log_error "Unknown option: --$OPTARG"; exit 1 ;;
           esac ;;
        ?) log_error "Invalid option: -$OPTARG"; exit 1 ;;
    esac
done
# Ensure a keyword is provided and validate it
if [[ -z "$keyword" ]]; then
    log_error "Keyword is required (-k <keyword>)"
    exit 1
else
    validate_keyword "$keyword"
fi

# Perform search based on provided arguments
if [[ -n "$directory" ]]; then
    search_directory "$directory" "$keyword"
elif [[ -n "$file" ]]; then
    search_file "$file" "$keyword"
else
    log_error "Either -d <directory> or -f <file> must be provided."
    exit 1
fi
