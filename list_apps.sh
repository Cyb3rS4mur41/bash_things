# This script list all of the installed application on MacOS with 
# version number.

#!/bin/bash

# Print the table header
printf "%-40s %-20s\n" "Installed applications" "Version"
printf "%-40s %-20s\n" "----------------------" "-------"

# Get the list of all installed applications in the Applications folder
applications=$(ls /Applications)

# Loop through each application and get its version
for app in $applications; do
    # Get the path to the application's Info.plist file
    infoPlist="/Applications/$app/Contents/Info.plist"

    # Check if the Info.plist file exists
    if [ -f "$infoPlist" ]; then
        # Get the version number from the Info.plist file
        version=$(defaults read "$infoPlist" CFBundleShortVersionString 2>/dev/null)

        # Check if the version number was successfully retrieved
        if [ -n "$version" ]; then
            printf "%-40s %-20s\n" "$app" "$version"
        else
            printf "%-40s %-20s\n" "$app" "Version not found"
        fi
    else
        printf "%-40s %-20s\n" "$app" "No version information"
    fi
done


# chmod +x list_app_versions.sh
# ./list_app_versions.sh