# FROM golang:tip-alpine3.23 AS build
FROM golang:1.25 AS build

WORKDIR /src
COPY apps/simple-app/ .

ENV CGO_ENABLED=0
RUN go build -o bin/miniSite ./main.go

FROM scratch AS runtime
WORKDIR /src
COPY --from=build /src/bin/miniSite /src/bin/miniSite

EXPOSE 8080

USER 12345


ENTRYPOINT [ "/src/bin/miniSite" ]