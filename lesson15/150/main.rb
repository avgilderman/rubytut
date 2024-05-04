# изменение кодировки, если windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#подключаем классы
require_relative 'lib/console_interface'
require_relative 'lib/game'

#приветствие
puts "Всем привет!"

#записываем загаданное слово в переменную
word = File.readlines("#{__dir__}/data/words.txt", encoding: "UTF-8", chomp: true).sample

#создаем экземпляр класса game с параметром в виде загаданного слова
game = Game.new(word)

#создаем экземпляр класса interface c параметром в виде экземплярка класса game

console_interface = ConsoleInterface.new(game)

#цикл самой игры
until game.over? #проверяем не закончилась ли игра?
  console_interface.print_out #выводит интерфейс игры
  letter = console_interface.get_input #обработка введеной пользователем буквы
  game.play!(letter) #записываем ввередную букву в массив введеных пользователем букв
end

console_interface.print_out #вывести финальное состояние игры
