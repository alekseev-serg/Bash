docker exec backend-mvp-develop_db pg_dump -U mycompanybd_user mycompanybd > /root/backup_pgs_mvp_develop/$(date +%d-%b-%Y).dump
docker exec develop_db pg_dump -U mycompanybd_user mycompanybd > /root/backup_pgs_develop/$(date +%d-%b-%Y).dump

#Удаление старых бэкапов
find /root/backup_pgs_mvp_stable -mindepth 1 -mtime +30 -delete
find /root/backup_pgs_mvp_develop -mindepth 1 -mtime +30 -delete
find /root/backup_pgs_develop -mindepth 1 -mtime +30 -delete


