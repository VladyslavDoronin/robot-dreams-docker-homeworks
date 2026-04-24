# robot-dreams-docker-homeworks

## Запушити зібраний імедж для apps/course-app у Docker Hub або GitHub Registry

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/209e1ad1-df0f-4185-a0a1-b97ee3449f4c" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/30b9ce66-8af8-4639-9593-894dcf45909f" />


## Описати маніфести Deployment, Service (з типом NodePort) для застосунку apps/course-app

### Deployment

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/317e202b-c5ce-45a5-aa82-4fe4f54110eb" />


### Service (з типом NodePort)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/06129e44-6812-4c9f-bed1-4337a05d5924" />


## Задеплоїти ресурси в Rancher Desktop кластер

Перевірив чи вімкнений в мене кубернетіс: kubectl cluster-info

Деплоїм командою kubectl apply -f файли deployment.yaml та service.yaml 

Перевіряємо які в нас запущені поди: kubectl get pods. Запущено три поди, як указано в репліках в деплойменті. Для додатку запущено 2 поди і для редісу лише 1.

Перевіряємо запущені сервіси: kubectl get services. Як видно на скрині запущено 2 сервіси: додаток на NodePort 30080 та редіс

<img width="1919" height="1080" alt="image" src="https://github.com/user-attachments/assets/72aaaebb-00dc-498e-9a38-69bc4a518062" />


Перевірив доступність по локальній мережі з телефона. Як видно на скринах вище і нижче, використовуються різні поди:

<img width="494" height="1080" alt="image" src="https://github.com/user-attachments/assets/05724689-31de-4cc7-b06f-46b6a89ca23c" />

