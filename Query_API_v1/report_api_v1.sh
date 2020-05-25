#!/bin/bash

#PRODUCCION
date >> log_API_caller.log
curl -H "Content-Type: application/json" --data @A_Catalogo_New_UI_Series.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/A_Catalogo_New_UI_Series.xml
ls -l /var/tmp/Query_API_v1/output_files| grep A_Catalogo_New_UI_Series.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @B_Catalogo_New_UI_Kids_Series.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/B_Catalogo_New_UI_Kids_Series.xml
ls -l /var/tmp/Query_API_v1/output_files| grep B_Catalogo_New_UI_Kids_Series.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @C_Catalogo_New_UI_Titulos.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/C_Catalogo_New_UI_Titulos.xml
ls -l /var/tmp/Query_API_v1/output_files| grep C_Catalogo_New_UI_Titulos.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @D_Catalogo_New_UI_Kids_Titulos.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/D_Catalogo_New_UI_Kids_Titulos.xml
ls -l /var/tmp/Query_API_v1/output_files| grep D_Catalogo_New_UI_Kids_Titulos.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @E_Catalogo_New_UI_Series_Name.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/E_Catalogo_New_UI_Series_Name.xml
ls -l /var/tmp/Query_API_v1/output_files| grep E_Catalogo_New_UI_Series_Name.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @F_Catalogo_New_UI_Titulos_Name.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/F_Catalogo_New_UI_Titulos_Name.xml
ls -l /var/tmp/Query_API_v1/output_files| grep F_Catalogo_New_UI_Titulos_Name.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @G_Catalogo_New_UI_Kids_Series_Name.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/G_Catalogo_New_UI_Kids_Series_Name.xml
ls -l /var/tmp/Query_API_v1/output_files| grep G_Catalogo_New_UI_Kids_Series_Name.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log
curl -H "Content-Type: application/json" --data @H_Catalogo_New_UI_Kids_Titulos_Name.json http://192.168.56.21/traxis/web -o /var/tmp/Query_API_v1/output_files/H_Catalogo_New_UI_Kids_Titulos_Name.xml
ls -l /var/tmp/Query_API_v1/output_files| grep H_Catalogo_New_UI_Kids_Titulos_Name.xml | awk '{print $6,$7,$8 "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8}' >> /var/tmp/Query_API_v1/log_API_caller.log


#PRE-PRODUCCION
#curl -H "Content-Type: application/json" --data @A_Catalogo_New_UI_Series.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/A_Catalogo_New_UI_Series.xml
#curl -H "Content-Type: application/json" --data @B_Catalogo_New_UI_Kids_Series.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/B_Catalogo_New_UI_Kids_Series.xml
#curl -H "Content-Type: application/json" --data @C_Catalogo_New_UI_Titulos.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/C_Catalogo_New_UI_Titulos.xml
#curl -H "Content-Type: application/json" --data @D_Catalogo_New_UI_Kids_Titulos.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/D_Catalogo_New_UI_Kids_Titulos.xml
#curl -H "Content-Type: application/json" --data @E_Catalogo_New_UI_Series_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/E_Catalogo_New_UI_Series_Name.xml
#curl -H "Content-Type: application/json" --data @F_Catalogo_New_UI_Titulos_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/F_Catalogo_New_UI_Titulos_Name.xml
#curl -H "Content-Type: application/json" --data @G_Catalogo_New_UI_Kids_Series_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/G_Catalogo_New_UI_Kids_Series_Name.xml
#curl -H "Content-Type: application/json" --data @H_Catalogo_New_UI_Kids_Titulos_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/H_Catalogo_New_UI_Kids_Titulos_Name.xml
