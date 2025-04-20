#!/bin/bash
# Директория для отслеживания
WATCH_DIR="$HOME/watch"

# Если каталога не существует, создаем его
[ ! -d "$WATCH_DIR" ] && mkdir -p "$WATCH_DIR"

# Используем inotifywait (пакет inotify-tools) для непрерывного отслеживания событий создания файлов
inotifywait -m -e create --format '%f' "$WATCH_DIR" | while read NEWFILE; do
  FILE="$WATCH_DIR/$NEWFILE"
  echo "Новый файл обнаружен: $FILE"
  
  # Выводим содержимое файла
  cat "$FILE"
  
  # Переименовываем файл, добавляя к имени расширение .back
  mv "$FILE" "${FILE}.back"
done

