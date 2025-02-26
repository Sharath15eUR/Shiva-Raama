#!/bin/bash

usage() {
   echo "Usage: $0 <source> <destination> <file_ext>"
   exit 1
}

if [[ $# -ne 3 ]]; then 
   usage
fi

SOURCE_DIR="$1"
DEST_DIR="$2"
FILE_EXT="$3"

# Checking source directory existence
if [[ ! -d "$SOURCE_DIR" ]]; then
   echo "Directory: $SOURCE_DIR does not exist!!!"
   exit 1
fi 

# Checking and creating destination directory if needed
if [[ ! -d "$DEST_DIR" ]]; then
   echo "Directory: $DEST_DIR does not exist!!!"
   echo "Creating $DEST_DIR"
   mkdir -p "$DEST_DIR"
   if [[ $? -ne 0 ]]; then
      echo "Failed to create $DEST_DIR"
      exit 1
   fi
fi

# Finding files with the given extension
FILES_TO_BACKUP=("$SOURCE_DIR"/*"$FILE_EXT")

# Check if any matching files exist
if [[ ${#FILES_TO_BACKUP[@]} -eq 0 ]]; then
   echo "No files with extension '$FILE_EXT' found in '$SOURCE_DIR'."
   exit 1
fi

echo "Files to be backed up:"
for FILE in "${FILES_TO_BACKUP[@]}"; do 
   NAME=$(basename "$FILE")
   DEST="$DEST_DIR/$NAME"
   echo "$NAME -> $DEST"
done

# Initializing backup count and total size
export BACKUP_COUNT=0
TOTAL_SIZE=0

echo "Processing backup..."

# Loop through files and back them up
for FILE in "${FILES_TO_BACKUP[@]}"; do
   if [[ -f "$FILE" ]]; then
      FILE_SIZE=$(stat --format="%s" "$FILE")
      TOTAL_SIZE=$((TOTAL_SIZE + FILE_SIZE))
      
      BACKUP_FILE="$DEST_DIR/$(basename "$FILE")"
        
      if [[ -e "$BACKUP_FILE" ]]; then
         SOURCE_TIME=$(stat -c %Y "$FILE")
         BACKUP_TIME=$(stat -c %Y "$BACKUP_FILE")
         
         if [[ "$SOURCE_TIME" -gt "$BACKUP_TIME" ]]; then
            cp "$FILE" "$BACKUP_FILE"
            echo "Overwritten: $(basename "$FILE")"
            BACKUP_COUNT=$((BACKUP_COUNT + 1))
         else
            echo "Skipped: $(basename "$FILE")"
         fi 
      else
         cp "$FILE" "$BACKUP_FILE"
         echo "Backed up: $(basename "$FILE")"
         BACKUP_COUNT=$((BACKUP_COUNT + 1))
      fi 
   fi
done

# Generate the backup report
REPORT_PATH="$DEST_DIR/Backup_Report.log"
echo "---REPORT SUMMARY---" > "$REPORT_PATH"
echo "--------------------" >> "$REPORT_PATH"
echo "Total Files Processed: $BACKUP_COUNT" >> "$REPORT_PATH"
echo "Total size of all files backed up: $TOTAL_SIZE bytes" >> "$REPORT_PATH"

echo "Backup complete. Report stored in $REPORT_PATH."
