#!/bin/bash

# Author: Ethan Koester-Schmidt
# Date Created: 4/9/2025
# Date Modified: 4/9/2025

# Decription
# Creates an archive of the Documents folder in a directory for backups

# Usage
# backup_script (if this script is saved in a folder located in the systems path variable) otherwise use: ./backup_script

tar -czvf /home/$USER/Backupstg/documents_backup_"$(date +%d-%m-%y_%H-%M-%S)".tar.gz --absolute-names /home/$USER/Documents
exit 0

