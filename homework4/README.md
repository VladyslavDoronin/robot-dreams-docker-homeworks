# robot-dreams-docker-homeworks

## Описати Compose файл для apps/course-app
 - Додати healthcheck для сервісів, як запускають apps/course-app із попереднього домашнього завдання


Довелось трішки дописати Dockerfile , щоб в систему поставилась утиліта curl:

<img width="1287" height="554" alt="image" src="https://github.com/user-attachments/assets/e9d06872-c159-4b24-be03-084e97805a41" />

Без цього були помилки типу: "OCI runtime exec failed: exec failed: unable to start container process: exec: \"curl\": executable file not found in $PATH"

Далі пишемо healthcheckи:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f8ff8f08-81ac-4d7c-a807-b98e8e34c12e" />

Перевіряємо статуси як запустилися наші контейнери з healthcheckами(наче все добре):

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/73d6033a-76cf-48fd-ab86-31d25716c725" />

<img width="1917" height="1041" alt="image" src="https://github.com/user-attachments/assets/e8569770-901c-4eb2-a5ea-84a6e892d950" />



### Трішки обновив свій ямл файл. Як виявилось, я міг і не створювати редіс контейнер, так як сама аппка під'єднувалась до моєї бд в редіс стореджі в інеті. І виявилось, що контейнер редіса який створювався і запускався, просто працював в холосту, а всі дані зберігались в бд в мережі. Зараз вже виправив(ну і далі той самий результат, що і вище):

<img width="1067" height="820" alt="image" src="https://github.com/user-attachments/assets/3aaa4aba-fba9-4e5e-8072-ab421b366431" />


## Додати томи та переконатися, що том appdata зберігає лічильник відвідувань між перезапусками контейнера. Налаштувати залежності/порядок запуску 

І так, додаємо томи:

<img width="1006" height="1021" alt="image" src="https://github.com/user-attachments/assets/50471040-138d-444e-a169-b879c181c60b" />

В ранчері бачимо, що томи створились:

<img width="1266" height="713" alt="image" src="https://github.com/user-attachments/assets/cd4e7cc6-f8d8-41fc-9970-479865fc41fa" />

Також можно вивести створенні волуми командою:
<img width="703" height="208" alt="image" src="https://github.com/user-attachments/assets/b740528c-022c-4e01-90fa-8b1197b0855f" />


Перевіряємо лічильник відвідувань між перезапусками контейнера:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4869d457-d57e-419f-a2a7-42c23bf4a6cb" />
<img width="1908" height="1066" alt="image" src="https://github.com/user-attachments/assets/662504cd-0ddd-474a-be75-8b64eb94f177" />

Як бачимо, дані зберігаються і підтягуються з волумів після docker compose down та docker compose up.


По залежностям та порядку запуску: через depends_on додаток очікую спочатку щоб редіс був доступнім, щоб пройшов свій healthcheck і лише після цього запускаєтсья додаток:

<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/361f9bfe-ee21-4cce-967d-7499df1f82e0" />


