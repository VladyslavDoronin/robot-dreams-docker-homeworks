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


Перевірив лінтом і видалив зайве, щоб нічого не заважало:


<img width="1920" height="1078" alt="image" src="https://github.com/user-attachments/assets/f1be0f13-8d73-4849-8b3b-30b319ccc5aa" />



Командою helm install homework9 course-app/ задеплоїм чарт

Трішки виправляв інгресс, бо роут не прокидувався. Тому 4 рази апдейтив:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/cf7d5bc0-5ea7-40ca-a9d1-1133e3862591" />

Ось що бачимо в ленсі, усі запущені сервіси, поди, деплої та які є ендпоінти:
<img width="1916" height="1080" alt="image" src="https://github.com/user-attachments/assets/94ea0509-4589-4d94-a780-c1a7e4526ae3" />
<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/837509ce-2ba1-4d04-8a6c-9035e03e7863" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/22b7f161-9fbf-49df-b875-d78cae5d8e60" />
<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/e3a8584b-8b64-4702-8b90-471ff4ee8323" />


### 2. Розгортання Redis через Bitnami Redis Chart
Замість написання власного StatefulSet для Redis, розгорніть базу даних, використовуючи популярний ком'юніті-чарт bitnami/redis
 - Додайте відповідний репозиторій Helm
 - Встановіть Redis у ваш кластер, налаштувавши необхідні параметри

<img width="1916" height="1080" alt="image" src="https://github.com/user-attachments/assets/21eea0fd-5d5f-4542-8798-41f1f60ef280" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/239fc9cc-95b4-428b-909a-da362a7cffc6" />
<img width="1917" height="1076" alt="image" src="https://github.com/user-attachments/assets/76da7e7e-5503-4972-97cc-60ef1e9036c7" />
<img width="1915" height="1078" alt="image" src="https://github.com/user-attachments/assets/48a7229e-3018-44aa-8164-09b848991b51" />
<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/4de15ce8-e4c8-40ac-b113-f8ce4bc7eb4a" />



### 3. Інтеграція
Оновіть конфігурацію вашого чарту course-app (змінні оточення), щоб застосунок успішно підключався до нового інстансу Redis, розгорнутого через Bitnami

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/05127dff-0a5e-4940-8f9f-b416914779b5" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/8f14f454-9bdb-4a02-a210-41c507345330" />
<img width="960" height="985" alt="image" src="https://github.com/user-attachments/assets/e1e8a49e-0948-4142-a109-ec2252f59b06" />
