# robot-dreams-docker-homeworks

## Мета: Реалізувати повний GitOps-цикл: від створення репозиторію до автоматичного розгортання мульти-середовищного кластера за допомогою Flux CD

## Етап 1: Підготовка інфраструктури
 1. Створіть новий публічний репозиторій на GitHub з назвою rd-fluxcd-lesson. Він має бути пустим (або з README).

    <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2cbd3207-427f-4cca-a09b-69f1ffa84c84" />
    
 2. Ініціалізуйте Flux CD у вашому локальному кластері (Rancher Desktop), прив'язавши його до цього репозиторію.

 3. Перед виконанням команди нижче - створіть Personal Access Token (PAT) в Github, та виконайте export GITHUB_TOKEN=<ваш_токен>, щоб наступна команда flux bootstrap мала права доступу до репозиторію
```
flux bootstrap github \
  --owner=<ВАШ_GITHUB_USERNAME> \
 --repository=rd-fluxcd-lesson \
 --branch=main \
 --path=./clusters/my-cluster \
 --personal
```

Після цього кроку у вашому репозиторії автоматично з'явиться папка clusters/my-cluster з системними маніфестами Flux

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/df8591a7-f7be-46d6-b1b0-dfd4c489a63f" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/23ed377e-b784-4579-b6ba-52e7f4adab76" />


## Етап 2: Архітектура застосунку (Kustomize Base)

У корені репозиторію створіть структуру папок для деплою з Kustomize (base та overlays). У папці base опишіть стандартні маніфести для нашого веб-застосунку — course-app:
 - Deployment
 - Service (ClusterIP)
 - Ingress (налаштований на course-app.local або localhost)
 - kustomization.yaml, що об'єднує їх.

   <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/715fcc9e-34c3-4295-80ef-1264e6db5eb8" />
  <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/705be4e3-7cac-4531-a4db-fc0d6880a5ab" />
