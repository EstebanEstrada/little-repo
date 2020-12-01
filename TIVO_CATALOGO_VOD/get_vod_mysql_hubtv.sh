#!/bin/bash

#VARIABLES

fecha=$(date | awk '{print $1,$2,$3,$6,$4}')
fecha_completa=$(date +%d/%m/%y" "%H:%M:%S)
fecha_dma=$(date +%d%m%y)
ip_server=10.68.248.69
user_db=lla_backup_mw
pass_db=oKmkfNwg4LxbV4bzyc1B
db=middleware_server
work_folder=/opt/TIVO_CATALOGO_VOD
output_path=/opt/TIVO_CATALOGO_VOD/output
path_log_file=/opt/TIVO_CATALOGO_VOD/output.log


#Query Base de datos TIVO Catálogo
cd $work_folder 
echo $fecha_completa ===================== Starting process ===================== >> $path_log_file
echo $fecha_completa Running catalog query to $ip_server/$db... >> $path_log_file >> $path_log_file
mysql -h $ip_server -u $user_db -p$pass_db $db < $work_folder/catalogo.sql | sed 's/\t/|/g' > $output_path/A_CL-HUBTV-catalogoVOD.txt
echo $fecha_completa Query to $ip_server/$db finished. File saved on $output_path >> $path_log_file

#Comprimir archivos
echo $fecha_completa Compressing files... >> $path_log_file
sleep 3
cd $output_path
zip hubtv_report_$fecha_dma.zip *.txt >> $path_log_file
echo $fecha_completa Files has been compressed OK, new zip file called hubtv_report_$fecha_dma.zip has been created  >> $path_log_file

#Envio de Correo con archivo comprimido
sleep 4
cd $work_folder
python send_mail_v4.py
sleep 3
echo $fecha_completa Email sent OK to receivers >> $path_log_file 

#borrar archivo
cd $output_path
rm -rf hubtv_report_$fecha_dma.zip
echo $fecha_completa File hubtv_report_$fecha_dma.zip has been deleted from $output_folder >> $path_log_file
echo $fecha_completa ===================== Ending process ===================== >> $path_log_file
