# robot-dreams-docker-homeworks 2

Вимоги:
  - базовий актуальний образ
  - multi‑stage build (окремі етапи для залежностей/рантайму)
  - встановлення залежностей
  - запуск під нерут‑користувачем
  - зробити порт 8080 назовні

Ось весь Dockerfile(також він лежить тут в корені homework2):

<img width="1723" height="573" alt="image" src="https://github.com/user-attachments/assets/d48d9601-73f9-4049-a51c-dae49ccac543" />

Dockerfile білдив командою: docker build -t robo-homework:v1-golang-1.25-multistage .
Потім запускав цей образ командою: docker run --name miniSite -p 8080:8080 robo-homework:v1-golang-1.25-multistage

Результат:

<img width="1556" height="959" alt="image" src="https://github.com/user-attachments/assets/23d089c0-1b2b-4d17-966b-fc2a75c6f999" />

<img width="1915" height="1040" alt="image" src="https://github.com/user-attachments/assets/e363738c-5e0b-4008-ae7c-5fa488a5e34b" />

Запускається бінарник під не рут користувачем 12345. Трішки модифікував go код та вивів біля версії ім'я корисутвача під яким пройшов запуск. Результат видно на скріні вище.

А сам код де модифікував на наступному скріні:

<img width="1877" height="811" alt="image" src="https://github.com/user-attachments/assets/0b182a04-30e6-41ef-bdd3-b73e3de8900c" />


Також є ще декілька способів як подивитись під ким запускається бінарник. Ось ще один із способів

docker inspect robo-homework:v1-golang-1.25-multistage --format='{{.Config.User}}'

<img width="1121" height="77" alt="image" src="https://github.com/user-attachments/assets/5171cd27-a993-4081-b497-4379bffe575c" />



Хотів використовувати образ golang:tip-alpine3.23 для білда, як мінімальний образ(94 Мб). Але виявилось, що якщо білдити з golang:1.25 (290 Мб), то потім, загальний образ рантайму(з образу scratch), виходить трішки меншим розміром.

На наступному скріна зробив 4 образи. 2 з них мультістедж і два звичайних/повних(без FROM scratch AS runtime)

<img width="867" height="296" alt="image" src="https://github.com/user-attachments/assets/28f2aa41-b5dc-4626-a282-80611a52eb59" />


Пояснення як мультістедж зменшив розмір образу: Мультистедж дозволяє виключити інструменти сборки, залежності з фінального образу і бере лише готовий вже зібраний бінарник. В моєму випадку, все що відноситься до build до строки FROM scratch AS runtime, не попаде в фінальний образ. Звідти ми беремо лише готовий бінарник miniSite та копіюємо його в порожню систему scratch. Ну і усе що є в образі golang:1.25 не потрапить в фінальний образ, що добре зменшує розмір.

Щодо змін в go.mod: змінив версію go, а ось для gorilla/mux вже не можу змінити(понизити). Починає ругатися. Підозрюю, що тут ще є залежність від go.sum.


Завантажити образ у власний реєстр (Docker Hub/GHCR) і запустити його з реєстру (опціонально)
За допомогою цих команд завантажую мій образ до мого докерХабу:

docker tag robo-homework:v1-golang-1.25-multistage 7195522/robo-homework:v1-golang-1.25-multistage

docker push 7195522/robo-homework:v1-golang-1.25-multistage

<img width="839" height="178" alt="image" src="https://github.com/user-attachments/assets/c4a6498d-193d-452f-b5c7-9d73cf417107" />

<img width="1907" height="858" alt="image" src="https://github.com/user-attachments/assets/8817f074-275c-40fc-b20b-1b89d816c9b2" />


Для чистоти видаляю образ зі свого ПК і пробую запустити. Як видно на наступному скрині, мій образ качається з ДокерХаба і потім запускається

<img width="1255" height="768" alt="image" src="https://github.com/user-attachments/assets/6eaa97cb-2c13-4288-959e-0e108e9e4e35" />

Результат:
<img width="1908" height="1041" alt="image" src="https://github.com/user-attachments/assets/ec838ce7-65c3-479c-a18d-5aeaefc889ba" />
