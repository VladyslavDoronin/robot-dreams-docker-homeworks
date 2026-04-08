#!/bin/bash

# Зупиняємо усі запущені/незапущені nginx контейнери та видаляємо їх, щоб коли запускаємо наново скрипт, то не валили помилки
# Плюс до того, одним з завдань будло запинити усі запущені контейнери та видалити їх(тут поки знаходимо необхідні контейнери по імені та видаляємо якщо такі є, а не усі усі запущені)
for containerNumber in $(seq 1 10); do
    id="$(docker ps -aqf name=myNginxContainer-$containerNumber$)" # Шукаэмо з необхыдним точним ім'ям
    if [ -n "$id" ]; then
        echo "Deleted $(docker rm -f $id)"
    fi
done

# Запускаю демонів nginx на порти хоста з 8080 до 8089(10 портів)
for containerNumber in $(seq 1 10); do
    portHost=$((8080+$containerNumber-1))
    portContainer=80
    # echo "Runing nginx-$containerNumber..."
    docker run -d --name myNginxContainer-$containerNumber -p $portHost:$portContainer nginx:latest > /dev/null # Просто не хочу бачити в консолі id контейнера що запустився, тому 2>/dev/null
    echo "myNginxContainer-$containerNumber succesfully run. Try http://localhost:$portHost"
done