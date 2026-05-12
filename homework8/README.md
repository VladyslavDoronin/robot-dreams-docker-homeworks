# robot-dreams-docker-homeworks

## Аналіз StorageClass
Переконайтеся, що у вашому кластері Rancher Desktop є доступний StorageClass.

Виконайте команду kubectl get sc.
Ви маєте побачити local-path (default). Це означає, що Kubernetes буде створювати фізичні папки на вашому комп'ютері для кожного PVC

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a92470c5-4f9a-4093-8c8e-8c369e4b1488" />

## Redis як StatefulSet (Основне завдання)
Вам потрібно створити маніфести для Redis, який буде зберігати дані на диску.

Створіть файл k8s/redis-statefulset.yaml.
Використовуйте kind: StatefulSet.
Образ контейнера: redis:7-alpine.
Важливо: Використовуйте секцію volumeClaimTemplates для замовлення диска.

Назва PVC шаблону: redis-data.
Розмір: 1Gi.
AccessMode: ReadWriteOnce.
Підказка: Не вказуйте storageClassName, нехай підтягнеться дефолтний (local-path).
Змонтуйте цей volume у контейнер Redis в папку /data.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/edfa1dd0-ccf9-40ed-bc2f-ab3667fed19c" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3471ed89-ab0d-408f-babe-403a50b984af" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fbaa6a5f-8a86-4a33-86bb-d84b45e68df3" />
<img width="1910" height="1067" alt="image" src="https://github.com/user-attachments/assets/d8eb3531-3167-4e21-8a98-7989561d866e" />

## Redis Service
Для доступу до Redis створіть redis-service.yaml.

В минулому дз у нас вже був redis в service. Тому в сервісі його закоментив, зааплаїв зміни. Видалив вже існуючий сервіс редіса та потім тільки створив окремий redis-service.yaml


<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/de0897a6-d671-45d4-906b-069fcf9507d3" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/28041266-e98f-4bab-957b-22eb2c510bc6" />

Оновлення Deployment course-app
Відредагуйте ваш існуючий deployment.yaml для course-app:

Змініть (або додайте) змінні середовища, щоб додаток почав писати в Redis:
APP_STORE: redis
APP_REDIS_URL: redis://redis:6379

Також в деплої закоментив дейплоймент редіса, бо побачив що з'являється 2 ендпоінти. І на сайті було видно що при оновлені перекидіє на різні БД. Перезапустив усі сервіси та деплой

<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/12628253-669e-4cd4-820f-e480c8ad3052" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e51b946a-c262-4f7c-9f41-c8ea21bb0c7f" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4e607287-b4b5-487c-a919-dac5b5250e7c" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0d125eb0-896e-4496-8e36-78966c0577a4" />

