#!/bin/bash

##Little script for copy the TVA file to each SFTP site - by ElIndioEstrada

##CUSTOMIZABLE - Define SFTP site Credentials
HOST=192.168.241.85
USER=sftp-stg-vtr
PASSWD=I5pRSIUPtCvsPV5V

##CUSTOMIZABLE - Define the folder where TVA is located
TVA_FOLDER=/mnt/tva/chroot/EPG/TVA-PRE/Loaded
TEMP_FOLDER=/opt/MD_TVA_CP/temp

##Access to the Folder where TVA is located 
cd $TVA_FOLDER

##Obtain the filename of the last TVA file that was ingested and print the name in a file 
ls -l > $TEMP_FOLDER/temp.txt && sleep 2 && tail -1 $TEMP_FOLDER/temp.txt | awk '{print $9}' > $TEMP_FOLDER/cp_file.txt

##CUSTOMIZABLE - Define the location where the file with the name was printed and read it 
FILENAME=$(cat $TEMP_FOLDER/cp_file.txt)

##LFTP Command started
lftp<<END_SCRIPT

##Create a log of each copy - Destination route is customizable
set xfer:log-file "/opt/MD_TVA_CP/log_cp_md.log" 

##Put the TVA file in the SFTP site
open sftp://$HOST
user $USER $PASSWD
put $FILENAME
bye
END_SCRIPT
