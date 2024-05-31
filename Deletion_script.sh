
#!/bin/bash

# Path of the Downloads folder
DOWNLOADS_DIR="$HOME/Downloads"

# Path of the Desktop
DESKTOP_DIR="$HOME/Desktop"

# Path, where you would like to save the report file
REPORT_FILE="$DESKTOP_DIR/deleted_files.txt"

# Initialization of the deleted files
> "$REPORT_FILE"

# Delete files with .exe extension
for file in "$DOWNLOADS_DIR"/*.exe; do
  if [ -e "$file" ]; then
    echo "Deleted files: $(basename "$file")" >> "$REPORT_FILE"
    rm "$file"
  fi
done

# Feedback
if [ -s "$REPORT_FILE" ]; then
  echo "You can find the list of the deleted files here: $REPORT_FILE"
else
  echo "I cannot find any .exe files in the Downloads folder"
fi

# you need to make the file executable:
# cd path of the script
# than:
# chmod +x name_of_the_file.sh

