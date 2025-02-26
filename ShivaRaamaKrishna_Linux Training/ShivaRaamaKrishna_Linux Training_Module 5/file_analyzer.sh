#!/bin/bash

ERROR_LOG="errors.log"

# Function to log errors
log_error() {
    echo "Error: $1" | tee -a "$ERROR_LOG"
}
# Display help menu
display_help(){
    cat <<EOF
---------------------
  *** HELP MENU ***
---------------------

Usage: ./filename [OPTIONS]
Options:
  -d <directory>   Search for a keyword in all files inside the directory (recursively).
  -k <keyword>     Keyword to search for.
  -f <file>        Search for a keyword inside a specific file.
  --help           Display this help menu.

Examples:
  # Recursively search a directory for a keyword
  ./script -d logs -k error
  
  # Search for a keyword in a file
  ./script -f script.sh -k TODO
  
  # Display the help menu
  ./script --help

EOF
    exit 1;
}
# Recursive function to search a directory
search_directory() {
    local dir="$1"
    local keyword="$2"

    if [[ ! -d "$dir" ]]; then
        log_error "Invalid directory: $dir"
        return
    fi

    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then   
            search_directory "$file" "$keyword"  # Recursive call for directories
        elif [[ -f "$file" ]]; then
            if grep -q "$keyword" "$file"; then
                echo "Found '$keyword' in: $file"
            fi
        fi
    done
}

# Function to search for a keyword in a file
search_file() {
    local file="$1"
    local keyword="$2"

    if [[ ! -f "$file" ]]; then
        log_error "File not found: $file"
        return
    fi

    if grep -q "$keyword" "$file"; then
        echo "Found '$keyword' in $file"
    else 
        echo "No match found in $file"
    fi
}

# Function to validate the keyword
validate() {
    local keyword="$1"
    if [[ -z "$keyword" || ! "$keyword" =~ ^[a-zA-Z0-9_]+$ ]]; then
        log_error "Invalid Keyword: '$keyword'"
        exit 1
    fi
}

# Parse command-line arguments
while getopts ":d:f:k:-:" variable; do 
    case "$variable" in
        d) directory="$OPTARG" ;;
        f) file="$OPTARG" ;;
        k) keyword="$OPTARG" ;;
        -) case "$OPTARG" in
            help) 
                display_help
                exit 0 ;;
            *) log_error "Unknown option: --$OPTARG"; exit 1 ;;
           esac ;;
        ?) log_error "Invalid option: -$OPTARG"; exit 1 ;;
    esac
done

# Validate keyword
if [[ -n "$keyword" ]]; then
    validate "$keyword"
else 
    log_error "Keyword required (-k <keyword>)"
    exit 1
fi

# Perform search based on input
if [[ -n "$directory" ]]; then
    search_directory "$directory" "$keyword"
elif [[ -n "$file" && -f "$file" ]]; then
    search_file "$file" "$keyword"
else 
    log_error "Missing input: Provide either -d <directory> or -f <file>!!!"
    exit 1
fi