#Удаление контейнеров, которые старше 18 часов
echo -e "\nУдаление контейнеров, которые старше 18 часов\n"
docker ps --format "{{.Names}} {{.RunningFor}}" | while read name time; do if [[ "$time" = *"hours"* ]] && [[ "$(echo $time | cut -d ' ' -f 1)" -gt "18" ]] && [[ "$name" != "release-"* ]] && [[ "$name" != "develop"* ]] || [[ "$time" = *"days"* ]]; then
  echo "$name | $time | deleted"
  docker rm -f $name >/dev/null
else echo "$name | $time"; fi; done