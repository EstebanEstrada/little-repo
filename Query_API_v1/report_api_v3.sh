#!/bin/bash

##Little script for query an API using POST with a JSON body and save the response in a XML file - by ElIndioEstrada

#VARIABLES

fecha=$(date | awk '{print $1,$2,$3,$6,$4}')
fecha_completa=$(date +%d%m%y%H%M%S)
fecha_dma=$(date +%d%m%y)
api_traxis=http://192.168.56.21/traxis/web
output_folder=/var/tmp/Query_API_v1/output_files
path_log_file=/var/tmp/Query_API_v1/log_API_caller.log

#PRODUCCION-Obtención de Reportes

#Reporte y logging "A_Catalogo_New_UI_Series.xml"
curl -H "Content-Type: application/json" --data @A_Catalogo_New_UI_Series.json $api_traxis -o $output_folder/A_Catalogo_New_UI_Series.xml
scndpartA=$(ls -l /var/tmp/Query_API_v1/output_files| grep A_Catalogo_New_UI_Series.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartA $api_traxis >> $path_log_file

#Reporte y logging "B_Catalogo_New_UI_Kids_Series.xml"
curl -H "Content-Type: application/json" --data @B_Catalogo_New_UI_Kids_Series.json $api_traxis -o $output_folder/B_Catalogo_New_UI_Kids_Series.xml
scndpartB=$(ls -l /var/tmp/Query_API_v1/output_files| grep B_Catalogo_New_UI_Kids_Series.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartB $api_traxis >> $path_log_file

#Reporte y logging "C_Catalogo_New_UI_Titulos.xml"
curl -H "Content-Type: application/json" --data @C_Catalogo_New_UI_Titulos.json $api_traxis -o $output_folder/C_Catalogo_New_UI_Titulos.xml
scndpartC=$(ls -l /var/tmp/Query_API_v1/output_files| grep C_Catalogo_New_UI_Titulos.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartC $api_traxis >> $path_log_file

#Reporte y logging "D_Catalogo_New_UI_Kids_Titulos.xml"
curl -H "Content-Type: application/json" --data @D_Catalogo_New_UI_Kids_Titulos.json $api_traxis -o $output_folder/D_Catalogo_New_UI_Kids_Titulos.xml
scndpartD=$(ls -l /var/tmp/Query_API_v1/output_files| grep D_Catalogo_New_UI_Kids_Titulos.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartD $api_traxis >> $path_log_file

#Reporte y logging "E_Catalogo_New_UI_Series_Name.xml"
curl -H "Content-Type: application/json" --data @E_Catalogo_New_UI_Series_Name.json $api_traxis -o $output_folder/E_Catalogo_New_UI_Series_Name.xml
scndpartE=$(ls -l /var/tmp/Query_API_v1/output_files| grep E_Catalogo_New_UI_Series_Name.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartE $api_traxis >> $path_log_file

#Reporte y logging "F_Catalogo_New_UI_Titulos_Name.xml"
curl -H "Content-Type: application/json" --data @F_Catalogo_New_UI_Titulos_Name.json $api_traxis -o $output_folder/F_Catalogo_New_UI_Titulos_Name.xml
scndpartF=$(ls -l /var/tmp/Query_API_v1/output_files| grep F_Catalogo_New_UI_Titulos_Name.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartF $api_traxis >> $path_log_file

#Reporte y logging "G_Catalogo_New_UI_Kids_Series_Name.xml"
curl -H "Content-Type: application/json" --data @G_Catalogo_New_UI_Kids_Series_Name.json $api_traxis -o $output_folder/G_Catalogo_New_UI_Kids_Series_Name.xml
scndpartG=$(ls -l /var/tmp/Query_API_v1/output_files| grep G_Catalogo_New_UI_Kids_Series_Name.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartG $api_traxis >> $path_log_file

#Reporte y logging "H_Catalogo_New_UI_Kids_Titulos_Name.xml"
curl -H "Content-Type: application/json" --data @H_Catalogo_New_UI_Kids_Titulos_Name.json $api_traxis -o $output_folder/H_Catalogo_New_UI_Kids_Titulos_Name.xml
scndpartH=$(ls -l /var/tmp/Query_API_v1/output_files| grep H_Catalogo_New_UI_Kids_Titulos_Name.xml | awk '{print  "   report name ----> "$9 " size "$5" was requested successfully at " $6,$7,$8 " to API Site "}')
echo $fecha $scndpartH $api_traxis >> $path_log_file

#Comprimir archivos
echo Compressing files...
echo $fecha Compressing files... >> $path_log_file
sleep 3
cd $output_folder
zip report_$fecha_dma.zip *.xml >> $path_log_file
echo $fecha Files has been compressed OK, new zip file called report_$fecha_dma.zip has been created  >> $path_log_file

#Envio de Correo con archivo comprimido

#borrar archivo
#echo sin borrar
#ls -l
#rm -r report_$fecha_dma.zip
#echo borrado
#ls -l 




#PRE-PRODUCCION
#curl -H "Content-Type: application/json" --data @A_Catalogo_New_UI_Series.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/A_Catalogo_New_UI_Series.xml
#curl -H "Content-Type: application/json" --data @B_Catalogo_New_UI_Kids_Series.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/B_Catalogo_New_UI_Kids_Series.xml
#curl -H "Content-Type: application/json" --data @C_Catalogo_New_UI_Titulos.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/C_Catalogo_New_UI_Titulos.xml
#curl -H "Content-Type: application/json" --data @D_Catalogo_New_UI_Kids_Titulos.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/D_Catalogo_New_UI_Kids_Titulos.xml
#curl -H "Content-Type: application/json" --data @E_Catalogo_New_UI_Series_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/E_Catalogo_New_UI_Series_Name.xml
#curl -H "Content-Type: application/json" --data @F_Catalogo_New_UI_Titulos_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/F_Catalogo_New_UI_Titulos_Name.xml
#curl -H "Content-Type: application/json" --data @G_Catalogo_New_UI_Kids_Series_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/G_Catalogo_New_UI_Kids_Series_Name.xml
#curl -H "Content-Type: application/json" --data @H_Catalogo_New_UI_Kids_Titulos_Name.json http://192.168.20.20/traxis/web -o /var/tmp/test_api/output_files/H_Catalogo_New_UI_Kids_Titulos_Name.xml
