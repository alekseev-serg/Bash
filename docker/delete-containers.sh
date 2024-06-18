#!/bin/bash

# Получаем список всех контейнеров
containers=$(docker ps -aq)

# Итерируемся по каждому контейнеру
for container in $containers
do
        # Получаем имя контейнера
        container_name=$(docker inspect --format='{{.Name}}' $container)

        # Проверяем, является ли имя контейнера "develop"
        if [[ "$container_name" == *"develop"* ]]; then
                echo "Skipping container $container_name"
        else
                echo "Removing container $container_name"
                docker rm -f $container
        fi
done
