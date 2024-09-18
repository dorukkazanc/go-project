#!/bin/bash

# Spesifik konteyner adı
CONTAINER_NAME="go_postgres"

# Belirtilen konteynerin çalışıp çalışmadığını kontrol eder
if docker-compose ps | grep "$CONTAINER_NAME" | grep "Up"; then
  echo "$CONTAINER_NAME konteyneri çalışıyor."
else
  echo "$CONTAINER_NAME konteyneri çalışmıyor, başlatılıyor..."
  docker-compose up -d && make migrate.up
fi