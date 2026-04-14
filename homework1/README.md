# robot-dreams-docker-homeworks

1. Встановити Rancher Desktop (Container Engine: Moby/dockerd для `docker` CLI)
   
   <img width="1265" height="714" alt="image" src="https://github.com/user-attachments/assets/8d7f526f-6ba2-47a3-ba0f-f98e40f6f1c7" />

2. Запустити перший контейнер (наприклад, `hello-world`)

docker run --name myHello hello-world

   <img width="1264" height="713" alt="image" src="https://github.com/user-attachments/assets/d151ddf5-a291-47de-a749-8dd4f6c17703" />


3. Відкрити в браузері http://localhost:8080 (або http://127.0.0.1:8080) та впевнитись, що контейнер працює

Контейнер hello-world не має веб сервера, тому нічого не відкриється. Цей контейнер виводить лише привітання і одразу зупиняється що можно побачити на скрині вище. Для того щоб відкрити в браузері і щось побачити, можно використати nginx контейнер, як і зроблено в наступному пункті.

4. Запустити 10 контейнерів з образом `nginx`. Можна спробувати по одному, або автоматизувати

Написав sh скрипт run_10_nginx.sh, який лежить тут в папці homework1.
Команда запуску: wsl sh run_10_nginx.sh
Що в ньому написав:

   <img width="1542" height="437" alt="image" src="https://github.com/user-attachments/assets/cc00f177-a138-4a58-9560-463d5a98e5c5" />
   

Результат(покажу в браузері лише декілька запущенних щоб не скидати всі 10 скринів):

   <img width="1920" height="1040" alt="image" src="https://github.com/user-attachments/assets/747f1c79-4e4a-4ed5-b75d-49de31c3b83e" />

   <img width="1921" height="1019" alt="image" src="https://github.com/user-attachments/assets/cda4b99c-17a2-42f6-977c-a281ac2a2f4d" />


5. Зупинити всі запущені контейнери та видалити їх. Раджу спробувати знайти спосіб зробити це однією командою

 В скрипті run_10_nginx.sh це частково вже зроблено. Там працює пошук по імені(щоб строго співпадало ім'я), отримую айді та по айді все видаляю контейнери
 
 А для видалення усіх запущених контейнерів команда: docker rm -f $(docker ps -q)
 
 Де docker ps -q показує усі запущені контейнери, а docker rm -f видаляє усі що отримав від docker ps -q
 
 Що було:
 
   <img width="1905" height="1038" alt="image" src="https://github.com/user-attachments/assets/a5ca31d1-38ab-4e9d-98b7-22fc06692e2e" />


Як стало:
   
   <img width="1906" height="1042" alt="image" src="https://github.com/user-attachments/assets/9eb7534a-79b7-4675-bbe9-ac7109fb455b" />

