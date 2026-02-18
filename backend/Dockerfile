# backend/Dockerfile
FROM python:3.9-slim

WORKDIR /app

# Копируем requirements и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код проекта
COPY . .

# Создаем папки для статики и медиа
RUN mkdir -p /static /media

# Команда для запуска приложения
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "kittygram_backend.wsgi"]