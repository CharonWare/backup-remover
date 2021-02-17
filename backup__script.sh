#!/bin/bash

cd /mnt/media/backup # path to desired backup location

# This command will create gzipped archive file. Change the information in upper case to your needs. When excluding files
# do not provide the full path i.e "/home/user/Documents", provide the relative path based on the location you have handed
# tar to backup; in this example that is "/home/USER", so the relative path for Documents is simply "Documents", or 
# "Documents/file.txt" to narrow it down.

# Finally, after the 2> is the path to the error log file, this an optional step but recommended, at least during testing.
# 2> will redirect standard error to the path provided.
tar -czf home_archive_"`date +"%d-%m-%Y"`".tar.gz --exclude={"DOCUMENTS"} /home/USER/ 2> /home/USER/scripts/backup_error.log
