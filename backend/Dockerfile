FROM python:3.10
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
COPY . .
 
RUN mkdir -p /app/collected_static

CMD gunicorn kittygram_backend.wsgi:application --bind 0.0.0.0:8000