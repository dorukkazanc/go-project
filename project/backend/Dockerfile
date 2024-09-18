# 1. Aşama: Build aşaması
FROM golang:1.23-alpine AS builder

# Proje için çalışma dizinine geç
WORKDIR /app

# Go mod dosyalarını kopyala ve bağımlılıkları indir
COPY go.mod go.sum ./
RUN go mod download

# Air'ı Go modülü olarak yükleyelim
RUN go install github.com/air-verse/air@latest

# Tüm proje dosyalarını kopyala
COPY . .

# Go uygulamasını üretim için derle
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o /app/myapp .

# 2. Aşama: Üretim aşaması
FROM alpine:latest

# Zaman dilimi verilerini eklemek için tzdata paketini kur
RUN apk add --no-cache tzdata

# Derlenmiş binary'yi kopyala
COPY --from=builder /app/myapp /myapp

# Config veya diğer statik dosyaları kopyala
# COPY --from=builder /app/config.yaml /config.yaml

# Çalıştırılacak komutu tanımla
ENTRYPOINT ["/myapp"]

# Uygulamanın dinlediği portu belirt
EXPOSE 5000
