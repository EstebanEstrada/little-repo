import hashlib
import os
from pathlib import Path
import glob
import re
import shutil
import subprocess

#os.system('ls -l > /opt/MD_TVA_CP/test/temp.txt && sleep 2 && tail -1 /opt/MD_TVA_CP/temp/temp.txt | awk '{print $9}' > /opt/MD_TVA_CP/temp/cp_file.txt')



path_file = "/opt/MD_TVA_CP/v2/temp/"
other_path = "/opt/MD_TVA_CP/v2/"
file_name = "cp_file.txt"
TVA_PATH_FOLDER = "/mnt/tva/chroot/EPG/TVA-Prod/Loaded/"
send_mail_file = "/opt/MD_TVA_CP/v2/send_mail_v4.py"


##Obtención MD5 archivo ya copiado - nombre archivo almacenado en archivo cp_file.txt

with open (str(path_file)+str(file_name), "r") as uploaded_file: #Abrimos el archivo de modo read (r)
    linea1 = uploaded_file.readline().splitlines() #<-Almacenamos en variable linea1 el método readline()


with open(str(TVA_PATH_FOLDER)+str(linea1[0]), "rb") as f:
    uploaded_file_hash = hashlib.md5()
    while chunk := f.read(8192):
        uploaded_file_hash.update(chunk)
md5_original_file = uploaded_file_hash.hexdigest()  ## <---- MD5 archivo antiguo, que fue subido a MD, esto se lee del archivo CP_File.txt

#print (md5_original_file)



##Obtención último archivo ingestado en Adrenalin

list_of_files = glob.glob(str(TVA_PATH_FOLDER)+'*[0-9].xml') # * means all if need specific format then *.csv
latest_file = max(list_of_files, key=os.path.getctime)
list_files = latest_file.split('/')    
name_file = (list_files[7])            ## <----- solo nombre ultimo archivo TVA ingestado
#print(list_files[7])                   
#print(name_file)
#print(latest_file)

##Obtención MD5 último archivo ingestado en Adrenalin

with open(str(latest_file), "rb") as f:
    last_file_received = hashlib.md5()
    while chunk := f.read(8192):
        last_file_received.update(chunk)

#print(file_hash.digest())
md5_last_file_received = last_file_received.hexdigest() ## <----- MD5 último archivo ingestado en Adrenalin
#print(md5_last_file_received)


##Comparación entre MD5 de archivo subido a MD con el ùltimo encontrado en la carpeta Loaded de Adrenalin

if md5_original_file == md5_last_file_received:   
 print("el archivo ya fue enviado a Media Distillery, no es necesario copiar")
 #os.system('touch es_el_mismo.txt')
else:
 #print("no es el mismo el archivo se subirá a Media Distillery")
 ##Sobrescribe en CP_File.txt el nombre del archivo TVA que será subido a MD
 cp_file = open(str(path_file)+str(file_name),'w')
 cp_file.write(str(name_file))
 cp_file.close()
 ##Copia el archivo TVA que será subido a MD
 ##shutil.copyfile(str(latest_file), str(path_file)+str(name_file))
 ##Subir el archivo TVA a MD - uso de script en bash
 os.chdir(other_path)
 subprocess.run(['bash','./sftp_upload.sh'])
 ##Enviar notificación de correo con el nombre del último archivo subido a MD
 os.system ("/usr/local/bin/python3.8 send_mail_v4.py")
 ##Borrar el archivo TVA subido
 


