#!/bin/bash

#Создание бэкапа Stable
#docker exec backend-mvp-stable_db pg_dump -U mycompanybd_user mycompanybd > /root/backup_pgs_mvp_stable/$(date +%d-%b-%Y).dump
#docker exec backend-mvp-develop_db pg_dump -U mycompanybd_user mycompanybd > /root/backup_pgs_mvp_develop/$(date +%d-%b-%Y).dump
echo -e "\nСоздание бэкапа develop_db\n"
docker exec develop_db pg_dump -U mycompanybd_user mycompanybd >/root/backup_pgs_develop/$(date +%d-%b-%Y).dump

#Создание бэкапа всех веток, которые начинаются со слова Release
echo -e "\nСоздание бэкапа всех веток, которые начинаются со слова release\n"
for line in $(docker ps -a --format "{{.Names}}"); do if [[ "$line" == "release-"* ]] && [[ "$line" == *"_db" ]]; then
  echo "$line"
  if [ ! -d "/root/backup_pgs_releases/$line" ]; then mkdir /root/backup_pgs_releases/$line; fi
  docker exec $line pg_dump -U mycompanybd_user mycompanybd >/root/backup_pgs_releases/$line/$(date +%d-%b-%Y).dump
fi; done

#Удаление старых бэкапов
#find /root/backup_pgs_mvp_stable -mindepth 1 -mtime +30 -delete
#find /root/backup_pgs_mvp_develop -mindepth 1 -mtime +30 -delete
echo -e "\nУдаление старых бэкапов\n"
find /root/backup_pgs_develop -mindepth 1 -mtime +30 -delete

#Удаление контейнеров, которые старше 18 часов
#echo -e "\nУдаление контейнеров, которые старше 18 часов\n"; docker ps --format "{{.Names}} {{.RunningFor}}" | while read name time; do if [[ "$time" = *"hours"* ]] && [[ "$(echo $time | cut -d ' ' -f 1)" -gt "18" ]] && [[ "$name" != "release-"* ]] && [[ "$name" != "develop"* ]] || [[ "$time" = *"days"* ]]; then echo "$name | $time | deleted"; docker rm -f $name > /dev/null; else echo "$name | $time"; fi; done
