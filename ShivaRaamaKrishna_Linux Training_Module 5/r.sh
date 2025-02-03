#!/bin/bash

# Clear the error file
ERROR_FILE="errors.log"
> "$ERROR_FILE"

# Error handling 
logerror(){
    echo -e "\n[ERROR] $1\n" | tee -a "$ERROR_FILE"
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

# Searching the keyword in the file
search_file(){
   local file=$1
   local keyword=$2
   echo -e "\nFILE : $file"
   if grep -q "$keyword" <<< "$(cat "$file")"; then  # Here String usage
       echo "KEYWORD: '$keyword' is found in $file"
   else
       logerror "KEYWORD: '$keyword' is not found in $file"
   fi
}

# Searching the keyword in directory and its subdirectories
search_directory(){
   local dir=$1
   local keyword=$2
   echo -e "\nDIRECTORY : $dir"
   for file in "$dir"/*; do  
      if [[ -f "$file" ]]; then
          if grep -q "$keyword" <<< "$(cat "$file")"; then
       	     echo "KEYWORD: '$keyword' is found in $file"
          fi
      elif [[ -d "$file" ]]; then
          search_directory "$file" "$keyword"
      fi
   done
}

# Checking the status of searching process
check_status()
{
   if [[ $? -eq 0 ]]; then
      echo -e "\n*** Search completed successfully! ***"
   else
      logerror "\n *** Search encountered errors. ***"
   fi
}

echo -e "*************************************************"
echo -e "\n   Script File Name     : $0"
if [[ $# -eq 0 ]]; then
    logerror "No arguments provided. Use --help for information."
fi

echo "   Number of Arguments  : $#"
echo "   Provided Arguments   : $@"
echo -e "\n*************************************************"

# Usage of getopts option
while getopts ":d:k:f:-:" options; do
    case "$options" in
        d) 
            DIR="$OPTARG"
            if [[ -d "$DIR" ]]; then
                echo -e "\nDIRECTORY : $DIR exists"
            else
                logerror "DIRECTORY : $DIR does not exist."
            fi
            ;;
        k) 
            KEYWORD="$OPTARG"
            if [[ -z "$KEYWORD" ]]; then
                logerror "Keyword is empty."
            else
                if [[ "$KEYWORD" =~ ^[a-zA-Z0-9]+$ ]]; then
                    echo -e "KEYWORD   : '$KEYWORD' is valid and alphanumeric."
                else
                    logerror "KEYWORD   : '$KEYWORD' is not valid. Provide alphanumeric characters only."
                fi
            fi
            ;;
        f) 
            FILE="$OPTARG"
            if [[ -e "$FILE" ]]; then
                echo -e "FILE      : $FILE exists."
            else
                logerror "FILE      : $FILE does not exist."
            fi
            ;;
        -) 
            case "$OPTARG" in
                help)  
                    display_help
                    ;;
                *) 
                    logerror "ERROR: Invalid option --$OPTARG"
                    ;;
            esac
            ;;
        \?) 
            logerror "ERROR: Invalid option -$OPTARG"
            ;;
        :) 
            logerror "Option -$OPTARG requires an argument."
            ;;
    esac
done

# Check if either directory or file is provided
echo -e "\n---------------------------"
echo -e "      SEARCHING      "
echo -e "---------------------------"
if [[ -n "$DIR" && -n "$KEYWORD" ]]; then
    search_directory "$DIR" "$KEYWORD"
    check_status
elif [[ -n "$FILE" && -n "$KEYWORD" ]]; then
    search_file "$FILE" "$KEYWORD"
    check_status
else
    logerror "***Both directory name and file name are empty. Also check the Keyword..***\n"
fi