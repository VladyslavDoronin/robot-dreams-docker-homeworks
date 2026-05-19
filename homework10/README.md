# robot-dreams-docker-homeworks

### Розгорнути Dragonfly (Redis-compatible store), використовуючи паттерн "operator", та налаштувати RBAC

## Завдання 1. Dragonfly Operator
### Встановлення оператора: Знайдіть офіційний Helm-чарт для Dragonfly Operator та встановіть його в кластер.
 - Перевірка: Переконайтеся, що в кластері з'явилися нові CRD: kubectl api-resources | grep dragonfly.

Вводив цю команду для інсталювання оператора драгонфлай:
```
kubectl apply -f https://raw.githubusercontent.com/dragonflydb/dragonfly-operator/main/manifests/dragonfly-operator.yaml
```

Взяв з їх офіційного сайту: 
```
https://www.dragonflydb.io/docs/getting-started/kubernetes-operator
```

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5ab2f77e-f964-4e06-b3af-76c118911dff" />

### Розгортання інстансу (Manifest): Створіть маніфест dragonfly.yaml, щоб розгорнути базу даних.
 - Використайте команду kubectl explain dragonfly.spec, щоб зрозуміти, які поля є обов'язковими (наприклад, replicas, image).
 - Опишіть бажаний стан і застосуйте файл: kubectl apply -f dragonfly.yaml

Завдяки цій команді dragonfly.spec бачу що лише replicas та image поля обов'язкові. Усе інше опціональне(Optional)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0bf46d74-6e99-489d-ac68-38dde5b6160b" />

З початку не запускалась нормально пода, тому що викорисовував гайд з гітхабу, а там імедж має не коректний лінк docker.dragonflydb.io/dragonflydb/dragonfly. Але потім на том ж гітхабі знайшов іншу лінку на імедж з яким запрацювало:
```
ghcr.io/dragonflydb/dragonfly:v1.38.1
```

<img width="1917" height="1076" alt="image" src="https://github.com/user-attachments/assets/ff266252-ed45-4c97-b709-23c7bd240866" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d6fcc025-3abf-4551-b719-f058f9b83ee0" />

### Переключіть застосунок course-app на використання Dragonfly

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/79e93e48-7256-4a71-8214-cf07e48798c2" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/72326168-434a-4d21-9911-1d6afc3d1cf9" />

<img width="956" height="799" alt="image" src="https://github.com/user-attachments/assets/71f2d4c8-08db-4415-aadc-47f184ff00d9" />


## Завдання 2. RBAC для Custom Resources

### Створіть ServiceAccount, який має право переглядати статус Dragonfly, але не може його видаляти чи змінювати конфігурацію.

1) ServiceAccount: Створіть SA db-viewer.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/24a9f33f-df46-4fd8-8c70-3285b68f2c5d" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6a9139e7-55d0-435a-9354-df4eb8863323" />

2) Role: Створіть роль db-readonly з правами ["get", "list", "watch"].
 - Важливо: У полі apiGroups вкажіть групу API Dragonfly (зазвичай це dragonflydb.io), яку ви побачили у виводі api-resources.
 - Resource: Вкажіть ресурс у множині (наприклад, dragonflies).

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d98d9cdb-9391-44c3-93b1-773fbc2a409f" />
<img width="1920" height="1077" alt="image" src="https://github.com/user-attachments/assets/4fd0fb94-2c0c-4ed6-b3a1-36c530fa5ea8" />


3) RoleBinding: Зв'яжіть SA db-viewer з роллю db-readonly

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4f396dd3-9e45-40d2-80fc-baf5940c2903" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/da91058d-cbcd-4345-ae13-a27e5ea5ddf8" />

## Завдання 3. Верифікація (auth can-i)

### Перевірте коректність RBAC, виконавши команди (підставте правильну назву ресурсу):
 1. Перевірка доступу на читання (Має бути "yes")

```
kubectl auth can-i list dragonflies --as=system:serviceaccount:default:db-viewer
```
 2. Перевірка заборони на видалення (Має бути "no")
```
kubectl auth can-i delete dragonflies --as=system:serviceaccount:default:db-viewer
```

<img width="1695" height="406" alt="image" src="https://github.com/user-attachments/assets/61b4e920-501f-49e8-a48a-a1016938bf3d" />
