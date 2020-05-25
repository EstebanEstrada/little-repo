#!/bin/bash

##Little script for copy the TVA file to each SFTP site - by ElIndioEstrada

##CUSTOMIZABLE - Define SFTP site Credentials
HOST=10.68.211.45
USER=sftp-vtr
PASSWD=I5pRSIUPtCvsPV5V

##CUSTOMIZABLE - Define the folder where TVA is located
TVA_FOLDER=/mnt/tva/chroot/EPG/TVA-Prod/Loaded

##Access to the Folder where TVA is located 
cd $TVA_FOLDER

##Obtain the filename of the last TVA file that was ingested and print the name in a file 
ls -l > /opt/MD_TVA_CP/temp/temp.txt && sleep 2 && tail -1 /opt/MD_TVA_CP/temp/temp.txt | awk '{print $9}' > /opt/MD_TVA_CP/temp/cp_file.txt

##CUSTOMIZABLE - Define the location where the file with the name was printed and read it 
FILENAME=$(cat /opt/MD_TVA_CP/temp/cp_file.txt)

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
