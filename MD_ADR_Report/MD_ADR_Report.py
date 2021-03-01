#!/usr/bin/python3

import http.client
import datetime
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

##FECHAS

today = date.today()
fecha = today.strftime("%d/%m/%Y")

utc_time_now = datetime.datetime.utcnow()
utc_time_now_print = (utc_time_now.strftime(('%Y-%m-%d')+'T'+('%H:%M:%S')+'Z'))
#print(utc_time_now_print)

utc_time_yesterday = utc_time_now - datetime.timedelta(days=1)
utc_time_yesterday_print = (utc_time_yesterday.strftime(('%Y-%m-%d')+'T'+('%H:%M:%S')+'Z'))
#print(utc_time_yesterday_print)

##Cambiar directorio

path_folder = "/opt/MD_Reports/"

os.chdir(path_folder)


conn = http.client.HTTPConnection("10.68.171.165")
payload = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<Request xmlns=\"urn:eventis:traxisweb:1.0\">\r\n    <ResourcesQuery resourceType=\"channel\">\r\n\t\t<ResourceIds>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">441679617</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1907509880</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">5578354365</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1419842892</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1420021070</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4841233446</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1725412410</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1419817466</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">3272245449</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1612351388</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1270959130</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4958461558</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4505658347</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">3622046778</ResourceId>-->\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">6339169506</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">952820506</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">958936465</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1895270707</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1506873534</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">3930373124</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4824617557</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1462684619</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1867694518</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69031329</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1489286137</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039829</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1718589149</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039140</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">288432945</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69021344</ResourceId>\r\n\t\t\t<!--<ResourceId aliasType=\"IngestedServiceId\">69043044</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">927735547</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1053663072</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039813</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4861372172</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69046965</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">444018588</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69037699</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">444082240</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">648917929</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">441686640</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">441697453</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">4160409402</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1381733092</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">6754125439</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1653044099</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039833</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">6412956600</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1046823976</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69047076</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69047112</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039821</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69047761</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69031864</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039832</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69039831</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69026916</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">1613859393</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">656355873</ResourceId>\r\n\t\t\t<ResourceId aliasType=\"IngestedServiceId\">69023360</ResourceId>-->\r\n\t\t</ResourceIds>\r\n\t\t<Options>\r\n\t\t\t<Option type=\"props\">events</Option>\r\n\t\t</Options>\r\n\t<SubQueries>\r\n      <SubQuery relationName=\"events\">\r\n        <Options>\r\n          <Option type=\"filter\">HasTstv==true&amp;&amp;AvailabilityStart&gt;="+utc_time_yesterday_print+"&amp;&amp;AvailabilityEnd&lt;="+utc_time_now_print+"</Option>\r\n          <Option type=\"props\">availabilitystart<!--,availabilityend--></Option>\r\n          <Option type=\"sort\">availabilitystart</Option>\r\n        </Options>\r\n\t\t\t<SubQueries>\r\n\t\t\t\t<SubQuery relationName=\"TstvContents\">\r\n\t\t\t\t\t<Options>\r\n\t\t\t\t\t\t<Option type=\"props\">Tstv,EncodingProfile<!--,IsViewableOnCpe--></Option>\r\n\t\t\t\t\t</Options>\r\n\t\t\t\t\t<SubQueries>\r\n\t\t\t\t\t\t<SubQuery relationName=\"Titles\">\r\n\t\t\t\t\t\t\t<Options>\r\n\t\t\t\t\t\t\t\t<Option type=\"props\">Name</Option>\r\n\t\t\t\t\t\t\t</Options>\r\n\t\t\t\t\t\t</SubQuery>\r\n\t\t\t\t\t</SubQueries>\r\n\t\t\t\t</SubQuery>\r\n\t\t\t</SubQueries>\r\n        </SubQuery>\r\n      </SubQueries>\r\n   </ResourcesQuery>\r\n </Request>"
headers = {
  'Content-Type': 'application/xml'
}
conn.request("POST", "/traxis/web", payload, headers)
res = conn.getresponse()
data = res.read()
#print(data.decode("utf-8"))

query_answer = data.decode("utf-8")
#print(file)

OutputReport = open(str(path_folder)+str('output_report.xml'),'w')
OutputReport.write(query_answer)
OutputReport.close()

#Send Mail
mail_content =  ('Hola,\n'
                'Se adjunta el reporte de correcciones MD-ADR\n')
#				'\n'
#                '   --> ' +str(archivos_finales[0])+ '\n'
#                '   --> ' +str(archivos_finales[1])+ '\n'
#                '   --> ' +str(archivos_finales[2])+ '\n'
#                '   --> ' +str(archivos_finales[3])+ '\n'
#                '   --> ' +str(archivos_finales[4])+ '\n'
#                '   --> ' +str(archivos_finales[5])+ '\n'
#                '   --> ' +str(archivos_finales[6])+ '\n'
#                '   --> ' +str(archivos_finales[7])+ '\n')
#The mail addresses and password
sender_address = 'noc@vtr.cl'
#sender_pass = 'xxxxxxxx'
receiver_address = 'esteban.estrada@vtr.cl,loreto.gavilan@vtr.cl'
#Setup the MIME
message = MIMEMultipart()
message ['From'] = sender_address
message ['To'] = receiver_address
message ['Subject'] = 'Reporte ADR-MD ' + fecha
#The body and the attachments for the mail
message.attach(MIMEText(mail_content, 'plain'))
attach_file_name = ("output_report.xml")
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

