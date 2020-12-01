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

#List only XML output Files
os.chdir('/opt/TIVO_CATALOGO_VOD/output') #Path Output Files
current = os.getcwd()
archivos_finales = []
for file in os.listdir(current):
    if fnmatch.fnmatch(file, "*.txt"):
        archivos_finales.append(file)

#Send Mail
mail_content =  ('Hola,\n'
                'Se adjuntan los siguientes reportes\n'
		'\n'
                '   --> ' +str(archivos_finales[0])+ '\n')
                #'   --> ' +str(archivos_finales[1])+ '\n'
                #'   --> ' +str(archivos_finales[2])+ '\n'
                #'   --> ' +str(archivos_finales[3])+ '\n'
                #'   --> ' +str(archivos_finales[4])+ '\n'
                #'   --> ' +str(archivos_finales[5])+ '\n'
                #'   --> ' +str(archivos_finales[6])+ '\n'
                #'   --> ' +str(archivos_finales[7])+ '\n')
#The mail addresses and password
sender_address = 'noc@vtr.cl'
#sender_pass = 'xxxxxxxx'
receiver_address = 'esteban.estrada@vtr.cl,vodoperaciones@vtr.cl'
#Setup the MIME
message = MIMEMultipart()
message ['From'] = sender_address
message ['To'] = receiver_address
message ['Subject'] = 'HUB-TV - Reportes VOD del ' + fecha
#The body and the attachments for the mail
message.attach(MIMEText(mail_content, 'plain'))
attach_file_name = ("hubtv_report_"+str(fecha_archivo)+".zip")
attach_file = open(attach_file_name, 'rb') # Open the file as binary mode
payload = MIMEBase('application', 'zip') #'octate-stream')
payload.set_payload((attach_file).read())
encoders.encode_base64(payload) #encode the attachment
#add payload header with filename
payload.add_header('Content-Disposition', 'attachment', filename=attach_file_name)
message.attach(payload)
#Create SMTP session for sending the mail
session = smtplib.SMTP('172.17.63.21') #use mail 
#session.starttls() #enable security
#session.login(sender_address, sender_pass) #login with mail_id and password
text = message.as_string()
session.sendmail(sender_address, receiver_address.split(','), text)
session.quit()


#print('Mail Sent')
