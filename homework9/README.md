# robot-dreams-docker-homeworks

## Мета: Перенести створену в попередніх домашніх завданнях інфраструктуру (App + Redis + Ingress) з "сирих" маніфестів (kubectl apply) у керований Helm-чарт

### 1. Створення власного Helm-чарту для course-app

Створіть чарт для вашого застосунку, перенісши логіку з маніфестів попередніх занять (Deployment, Service, Ingress). Вимоги:
 - Шаблонізація: Основні параметри мають бути винесені у values.yaml (образ контейнера, тег, кількість реплік, хост Ingress)
 - Гнучкість: У шаблонах не повинно залишитись хардкоду, який заважав би розгорнути чарт у іншому неймспейсі чи з іншими налаштуваннями.


Створимо структуру хелм чату автоматично:

<img width="1919" height="1078" alt="image" src="https://github.com/user-attachments/assets/f9412633-b0d0-4504-91c8-44d873026aad" />

Чарт майже не змінюємо(лише версію та опис)
<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/293e4be1-8689-474c-94dc-e4cfe2bc9a55" />

А ось values треба повністю змінити - прописати мій образ з докер репозиторію, редіс та інгрес. Свій образ беру з 5 дз. Редіс спробую підключити з минулої 8 дз:


<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/91f78ef6-e488-4a4f-9855-ce5181ff93c4" />


Deployment:

<img width="1919" height="1080" alt="image" src="https://github.com/user-attachments/assets/f0946d73-7a84-4f05-ab98-992b9c6252c7" />


Service:

<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/7163a436-dc1b-4b2f-9365-89d48ba943b9" />


Ingress:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/037583e8-d919-4931-8ec2-cee43061b954" />


redis-service:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e81d7d0e-77d3-4c15-be25-37672a0309f8" />


redis-statefulset:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/df7f0a49-52a4-488e-8363-06e0b4361fff" />


Перевірив лінтом і видалив щоб нічого не заважало:

<img width="1920" height="1078" alt="image" src="https://github.com/user-attachments/assets/f1be0f13-8d73-4849-8b3b-30b319ccc5aa" />


Командою helm install homework9 course-app/ задеплоїм чарт
Трішки виправляв інгрес, бо роут не прокидувався. Тому 4 рази апдейтив:
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/cf7d5bc0-5ea7-40ca-a9d1-1133e3862591" />

Ось що бачимо в ленсі, усі запущені сервіси, поди, деплої та які є ендпоінти:
<img width="1916" height="1080" alt="image" src="https://github.com/user-attachments/assets/94ea0509-4589-4d94-a780-c1a7e4526ae3" />
<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/837509ce-2ba1-4d04-8a6c-9035e03e7863" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/22b7f161-9fbf-49df-b875-d78cae5d8e60" />
<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/e3a8584b-8b64-4702-8b90-471ff4ee8323" />
