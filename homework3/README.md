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


- Додати у Compose другий сервіс redis або dragonfly як зовнішнє сховище
- Додати змінні середовища APP_STORE=redis, APP_REDIS_URL=redis://redis:6379/0 для підключення зовнішнього сховища
- Переконатись що немає помилок при запуску Compose файлу та роботі застосунків


  З redis працював перший раз і не одразу зрозумів, що треба створити свій акаунт і бд там. Думав, що як на гітхабі в прикладі просто з локалхостом має працювати)))
  Почав досліджувати чого ж не запускається мій контейнер з сайтом, а тільки редіс(команда: docker logs containerName). Зрозумів, що там валять помилки пов'язані з конектом та урлами.
  Короче, ось як зараз виглядає оновлений docker-compose.yaml разом з подключеним сервісом redis. 

  <img width="1921" height="1005" alt="image" src="https://github.com/user-attachments/assets/8a4fe968-4560-4fcf-aff7-e2e5559a2676" />

Помилки більше не трапляютьтся. Ось логи мого контейнера

<img width="861" height="536" alt="image" src="https://github.com/user-attachments/assets/47b49760-9db1-455a-8062-fd1667570282" />

Ось сайт з повідомленнями збереженими в бд на редіс:

<img width="1918" height="1034" alt="image" src="https://github.com/user-attachments/assets/cbd82d4d-ab1a-4395-bd57-7b1775476446" />


Ось сама бд на редіс з тими самими даними:

<img width="1920" height="1048" alt="image" src="https://github.com/user-attachments/assets/379b50ae-73ac-4c42-9dea-6dba39837a1c" />

Ось перевірка інших роутів крім кореня:

<img width="778" height="365" alt="image" src="https://github.com/user-attachments/assets/8464b2fb-b438-45e4-8667-9f0ae3e3d703" />
<img width="728" height="336" alt="image" src="https://github.com/user-attachments/assets/137aa97a-3a65-402d-988c-2e07702c3bac" />
<img width="918" height="573" alt="image" src="https://github.com/user-attachments/assets/7076c28b-27ac-476f-b9dd-6d3bf98d0a2d" />
<img width="667" height="721" alt="image" src="https://github.com/user-attachments/assets/319e498f-3332-4aa7-80df-25d1d61d4634" />
<img width="516" height="397" alt="image" src="https://github.com/user-attachments/assets/097e450e-7fe7-4f8b-abd0-747d4a3b497e" />




