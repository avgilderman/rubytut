require_relative "lib/film"

array_films = [
  ["Терминатор 2: Судный день", "Джеймс Кэмерон", 1991],
  ["Жизнь других", "Флориан Хенкель фон Доннерсмарк", 2006],
  ["Джокер", "Тодд Филлипс", 2019]
]

  array_films.each_with_index do |item, index|
    film = Film.new(item)
    puts "Мои любимый фильм №#{index + 1}:#{film.name.join(', ')}"
  end

