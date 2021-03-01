import sys
import time
import os
import fnmatch
import shutil
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
from datetime import date
from datetime import datetime

today = date.today()
now = datetime.now()
fecha = today.strftime("%d/%m/%Y")
fecha_archivo = today.strftime("%d%m%y")
fecha_completa = now.strftime("%d/%m/%y %H:%M:%S")

path_file = "/opt/MD_TVA_CP/v2/temp/"
file_name = "cp_file.txt"
#TVA_PATH_FOLDER = "/mnt/tva/chroot/EPG/TVA-Prod/Loaded/"



##Obtención MD5 archivo ya copiado - nombre archivo almacenado en archivo cp_file.txt

with open (str(path_file)+str(file_name), "r") as uploaded_file: #Abrimos el archivo de modo read (r)
    linea1 = uploaded_file.readline().splitlines() #<-Almacenamos en variable linea1 el método readline()

#Send Mail
mail_content =  ('Un nuevo archivo se ha cargado en el SFTP de Media Distillery,\n'
                '\n'
                '   Archivo --> ' +str(linea1[0])+ '\n')
#The mail addresses and password
sender_address = 'noc@vtr.cl'
#sender_pass = 'xxxxxxxx'
receiver_address = 'esteban.estrada@vtr.cl,cristian.doizi@vtr.cl'
#Setup the MIME
message = MIMEMultipart()
message ['From'] = sender_address
message ['To'] = receiver_address
message ['Subject'] = 'Nuevo archivo TVA cargado a MD - ' + fecha
#The body and the attachments for the mail
message.attach(MIMEText(mail_content, 'plain'))
#attach_file_name = ("report_"+str(fecha_archivo)+".zip")
#attach_file = open(attach_file_name, 'rb') # Open the file as binary mode
#payload = MIMEBase('application', 'zip') #'octate-stream')
#payload.set_payload((attach_file).read())
#encoders.encode_base64(payload) #encode the attachment
#add payload header with filename
#payload.add_header('Content-Disposition', 'attachment', filename=attach_file_name)
#message.attach(payload)
#Create SMTP session for sending the mail
session = smtplib.SMTP('172.17.63.21') #use mail 
#session.starttls() #enable security
#session.login(sender_address, sender_pass) #login with mail_id and password
text = message.as_string()
session.sendmail(sender_address, receiver_address.split(','), text)
session.quit()


#print('Mail Sent')
