# robot-dreams-docker-homeworks

## Описати Deployment з мінімум 10 репліками.

<img width="1142" height="1015" alt="image" src="https://github.com/user-attachments/assets/61dc614d-05a1-48cf-aaa6-8db825ffe372" />


## Змінити значення у ConfigMap і перевірити, як оновлюються Pods.

Для початку треба створити ConfigMap(ми ж поки не працювали з ним)))). 
Я видалив усі сервіси та деплої минулої дз, то же запускаю заново одразу з 10 репліками. Потім зміню на 11 реплік и подивлюсь як змінюються поди(kubectl get pods -w)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/88cce7bc-5023-4d3d-9a2c-f1fc2f0b792a" />


Теперь оновлюємл конфігмєп. Не побачив щоб якось поди змінились:

<img width="1916" height="1074" alt="image" src="https://github.com/user-attachments/assets/db5a2183-61f1-483f-bed1-84372a818635" />

Знайшов, що треба ввести команду kubectl rollout restart deployment/course-app щоб змусити оновитись поди:

<img width="1918" height="1080" alt="image" src="https://github.com/user-attachments/assets/c73abef2-ea79-4bd8-ab14-03e7b0219420" />


## Оновити образ контейнера та простежити rollout
Оновив контейнер командою kubectl set image deployment/course-app course-app=7195522/homework4:v1

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/468e4e03-09f4-4379-adaa-7dad80027274" />

Ось простежив rollout як оновлюється:
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/488abfe9-1bd0-4f56-b1ca-749b96a43999" />


## Дослідити поведінку RollingUpdate з різними значеннями maxUnavailable, maxSurge.

1) Спочатку спробував поставити на 25% обыдва параметри:
  <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0206e24e-a622-4b29-b7cf-6932454fa9bf" />
  <img width="938" height="579" alt="image" src="https://github.com/user-attachments/assets/e0d84e24-7f56-4ad1-aa2b-a397d5b34102" />

  Так як в мене одночано зараз зупщено 11 реплік, то при maxUnavailable=25% оновлення может бути доступне не більше 2 подів в будь-який момент оновления (11*0.25 = 2.75 в меншу сторону).

  maxSurge у мене також 25%, це значить що можу створювати понад 3 нових подів поверх моїх 11 поки не будут видалені старі(11*0.25 = 2.75 в більшу сторону)


2) Тепер maxUnavailable=0%, maxSurge=100%. Всі старі продовжують працювати, а нові створюються паралельно

  <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/72e6c421-02a0-4c40-a10f-9f9789c612c6" />




3) Тепер maxUnavailable=50%, maxSurge=0. Тобто вбиваємо половину і потім створюємо нові
   
   <img width="1920" height="1078" alt="image" src="https://github.com/user-attachments/assets/2092d690-421e-4c8b-8380-72d315606e43" />
   

4) Спробувати Replace стратегію.
   Видаляэ усі поди, потім ствоює нові. Тут може бути що наш сайт якийся час буде недоступний

   <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0f9378fd-2f06-425c-961a-b5bee54f211e" />


5) Пояснити їх переваги та недоліки та відмінність між ними
   RollingUpdate, в залежності від конфігурації maxUnavailable та maxSurge, в більшості випадках не положить наш сайт і він буде доступний постіно, але потребує більше ресурсів для перезапуску подів. Знову ж таки залежить від параметрів maxUnavailable та maxSurge.
   А Replace просто ложить всі поди(сайт не доступний), а потім пересоздає нові. Не потребує багато ресурсів та просте   само по собі
