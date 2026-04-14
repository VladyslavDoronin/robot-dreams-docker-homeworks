FROM golang:1.25 AS build

WORKDIR /src
COPY apps/simple-app/go.mod apps/simple-app/go.sum ./
RUN go mod download
COPY apps/simple-app/ .

# RUN go build -o bin/miniSite ./main.go
RUN CGO_ENABLED=0 go build -o bin/miniSite ./main.go

FROM scratch as runtime
WORKDIR /src
COPY --from=build /src/bin/miniSite /src/bin/miniSite

# COPY --from=build /src/templates /src/templates
# COPY --from=build /src/static /src/static

EXPOSE 8080

USER 12345


ENTRYPOINT [ "/src/bin/miniSite" ]