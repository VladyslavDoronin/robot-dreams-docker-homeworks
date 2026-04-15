# robot-dreams-docker-homeworks 3
Описати Compose файл для apps/course-app
  - Перевірити доступність застосунку на http://localhost:8080 і працездатність /healthz

З початку створив Dockerfile для course-app, щоб зібрати та впевнитись, що все працює. Пітон взяв слім(python:3.14-slim), щоб зменшити трішки розмір.

<img width="1920" height="1018" alt="image" src="https://github.com/user-attachments/assets/e008ff15-17a8-4c96-8ac4-4449b1499c20" />
<img width="1923" height="817" alt="image" src="https://github.com/user-attachments/assets/6efccf23-f8ea-49fa-baea-40854b0f78cd" />
<img width="800" height="454" alt="image" src="https://github.com/user-attachments/assets/8519bb97-aa62-4729-8af4-ce931729265e" />


Далі написав мінімальний docker-compose.yaml, щоб тепер перевірити як збере course-app та як буде працювати:


<img width="1917" height="1034" alt="image" src="https://github.com/user-attachments/assets/9046b67f-41fa-4b5c-9690-cd5c26d55310" />

Працює так само:

<img width="1921" height="1036" alt="image" src="https://github.com/user-attachments/assets/1fb9642e-3899-410f-bf5f-522a42aa5b1d" />

ТАкож перевірив доступність через локальну мережу телефоном:

<img width="591" height="1280" alt="photo_2026-04-15_11-20-11" src="https://github.com/user-attachments/assets/d2feba17-76c9-4b52-af76-e83ae0fb7ad7" />

