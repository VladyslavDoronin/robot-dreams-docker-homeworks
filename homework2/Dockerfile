# FROM golang:tip-alpine3.23 AS build
FROM golang:1.25 AS build

WORKDIR /src
COPY apps/simple-app/ .

# Так як я далі збираюсь використовувати імедж scratch, то треба зробити запускаємий бінарник статичним(щоб всі необхідні залежності одразу були в одному бінарнику)
# Для цього для правильної компіляціі го бінарника використовується CGO_ENABLED=0 (https://www.reddit.com/r/golang/comments/pi97sp/what_is_the_consequence_of_using_cgo_enabled0/).
# Тому і пишемо наступний рядок 
ENV CGO_ENABLED=0
RUN go build -o bin/miniSite ./main.go

# Пустий імедж, без нічого. Зі зборки(build) покладемо в цей імедж бінарник і більше ничого не треба - можно запускати.
FROM scratch AS runtime
WORKDIR /src
COPY --from=build /src/bin/miniSite /src/bin/miniSite

EXPOSE 8080

USER 12345


ENTRYPOINT [ "/src/bin/miniSite" ]