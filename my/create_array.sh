#!/bin/bash

movies=(
"Зеленая миля,Фрэнк Дарабонт,1999"
"Побег из Шоушенка,Фрэнк Дарабонт,1994"
"Форрест Гамп,Роберт Земекис,1994"
"Список Шиндлера,Стивен Спилберг,1993"
"1+1,Оливье Накаш,2011"
"Властелин колец: Возвращение короля,Питер Джексон,2003"
"Тайна Коко,Ли Анкрич,2017"
"Интерстеллар,Кристофер Нолан,2014"
"Бойцовский клуб,Дэвид Финчер,1999"
"Унесённые призраками,Хаяо Миядзаки,2001"
"Криминальное чтиво,Квентин Тарантино,1994"
"Иван Васильевич меняет профессию,Леонид Гайдай,1973"
"Властелин колец: Братство Кольца,Питер Джексон,2001"
"Властелин колец: Две крепости,Питер Джексон,2002"
"Приключения Шерлока Холмса и доктора Ватсона: Собака Баскервилей,Игорь Масленников,1981"
"Король Лев,Роджер Аллерс,1994"
"Назад в будущее,Роберт Земекис,1985"
"Шрэк,Эндрю Адамсон,2001"
"Шерлок Холмс и доктор Ватсон,Игорь Масленников,1979"
"Достучаться до небес,Томас Ян,1997"
)


counter=1

for movie in "${movies[@]}"; do
  file="${counter}.txt"
  
  IFS=',' read -ra elements <<< "$movie"  # Разделить элементы по запятой в массив
  
  for element in "${elements[@]}"; do
    echo "$element" >> "$file"  # Записать элементы в столбик
  done
  
  counter=$((counter + 1))
done

