docker exec CONTAINER_NAME pg_dump -U user_name bd_name > /root/backup_pgs_mvp_develop/$(date +%d-%b-%Y).dump
docker exec CONTAINER_NAME pg_dump -U user_name bd_name > /root/backup_pgs_develop/$(date +%d-%b-%Y).dump

#Удаление старых бэкапов
find /root/backup_pgs_mvp_stable -mindepth 1 -mtime +30 -delete
find /root/backup_pgs_mvp_develop -mindepth 1 -mtime +30 -delete
find /root/backup_pgs_develop -mindepth 1 -mtime +30 -delete
