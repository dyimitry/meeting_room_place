FROM python:3.7-slim

# Запустить команду создания директории внутри контейнера
RUN mkdir /app

# Скопировать с локального компьютера файл зависимостей
# в директорию /app.
COPY requirements.txt /app

# Выполнить установку зависимостей внутри контейнера.
RUN pip3 install -r /app/requirements.txt --no-cache-dir

# Скопировать содержимое директории /api_yamdb c локального компьютера
# в директорию /app.
COPY api_yamdb/ /app

# Сделать директорию /app рабочей директорией.
WORKDIR /app

# Выполнить запуск сервера разработки при старте контейнера.
CMD ["uvicorn.run('app.main:app', reload=True)"]

# uvicorn.run('app.main:app', reload=True)