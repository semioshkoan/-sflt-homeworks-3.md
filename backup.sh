#!/bin/bash

# Директория для резервной копии
BACKUP_DIR="/tmp/backup"

# Домашняя директория пользователя
SOURCE_DIR="$HOME"

# Лог файл
LOG_FILE="/$HOME/backup.log"

# Создание директории для резервной копии, если она не существует
mkdir -p "$BACKUP_DIR"

# Выполнение резервного копирования с помощью rsync
rsync -a --delete "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

# Проверка статуса выполнения команды rsync
if [ $? -eq 0 ]; then
    echo "$(date): Резервное копирование выполнено успешно" >> "$LOG_FILE"
else
    echo "$(date): Ошибка при выполнении резервного копирования" >> "$LOG_FILE"
fi
