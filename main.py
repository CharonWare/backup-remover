#!/usr/bin/python3

import os
import shutil
from time import time

def main():
    path = "/mnt/media/backup"
    days = 6
    seconds = time() - (days * 24 * 60 * 60)
    
    if os.path.exists(path):
        for files in os.scandir(path):        
            if seconds <= get_file_age(path) and files.name.endswith('.tar.gz'):
                os.remove(files)
                print(f"{files} removed successfully.")
        
    else:
        # file/folder is not found
        print(f'"{path}" is not found')

def get_file_age(path):

    # find and return the ctime of files in the $path, this is then called on in
    #the main() function to determine which files are too old
    ctime = os.stat(path).st_ctime
    return ctime

main()