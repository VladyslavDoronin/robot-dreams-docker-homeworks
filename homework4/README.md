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
