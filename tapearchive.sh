#!/bin/bash

# Author: Ethan Koester-Schmidt
# Date Created: 4/9/2025
# Date Modified: 4/9/2025

# Decription
# Creates an archive of the Documents folder in a directory for backups

# Usage
# backup_script (if this script is saved in a folder located in the systems $PATH variable) otherwise use: ./backup_script
# use cd "${0%/*}" if you want the script to run from the location the script is stored in
tar -czvf /home/$USER/Backupstg/documents_backup_"$(date +%d-%m-%y_%H-%M-%S)".tar.gz --absolute-names /home/$USER/Documents
exit 0

