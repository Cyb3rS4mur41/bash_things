# Secure World-Writable Directories

# Identifying World-Writable Directories
# First, you need to identify all the world-writable directories.

find / -type d -perm -0002 -print

#!/bin/bash
# Find all world-writable directories and set the sticky bit
for dir in $(find / -type d -perm -0002 -print); do
  echo "Setting sticky bit on $dir"
  chmod +t "$dir"
done

chmod +x set_sticky_bit.sh
sudo ./set_sticky_bit.sh

# Verification
# After setting the sticky bit, you can verify it by checking the directory permissions:

ls -ld /path/to/directory

# sticky bit: sticky bit is a user ownership access right flag that can be assigned to files and directories
