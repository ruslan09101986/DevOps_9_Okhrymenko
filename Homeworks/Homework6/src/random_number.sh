#!/bin/bash

# Генеруємо випадкове число від 1 до 100
target=$(( RANDOM % 100 + 1 ))
attempts=5

echo "Я загадав число від 1 до 100. Спробуйте його вгадати!"

# Виконання циклу максимум 5 разів
for (( i=1; i<=attempts; i++ )); do
    read -p "Спроба $i/$attempts: " guess

    # Перевірка, чи введене значення є числом
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Будь ласка, введіть число."
        ((i--))
        continue
    fi

    if (( guess == target )); then
        echo "Вітаємо! Ви вгадали правильне число."
        exit 0
    elif (( guess > target )); then
        echo "Занадто високо!"
    else
        echo "Занадто низько!"
    fi
done

echo "Вибачте, у вас закінчилися спроби. Правильним числом було $target."

