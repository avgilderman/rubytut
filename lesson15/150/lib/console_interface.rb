# frozen_string_literal: true

# класс отвечающий за интерфейс
class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"]
    .sort
    .map { |file_name| File.read(file_name) } # прочитать, отсортировать, прочитать каждый файл и засунуть все в константу массива FIGURES # rubocop:disable Layout/LineLength

  # экземпляр класса game с загаданным словом в качестве параметра класса consoleinterface
  def initialize(game)
    @game = game
  end

  # вывести интерфейс игры(слово с угаданными буквами и пробелы в нем, рисунок виселицы, количество ошибок и сами ошибочные буквы, и количество оставшихся попыток) # rubocop:disable Layout/LineLength
  def print_out
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_made}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_allowed}

    END

    if @game.won? # сообщение выходящее по завершении игры
      puts 'Поздравляем, вы выиграли!'
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  # возвращает рисунок равный количеству ошибок пользователя
  def figure
    FIGURES[@game.errors_made]
  end

  # заменить nil на "__"
  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter.nil?
          '__'
        else
          letter
        end
      end

    result.join(' ') # обьединить элементы массива в строку
  end

  def errors_to_show
    @game.errors.join(', ') # преобразовать массив ошибочных букв в строку
  end

  # просьба ввести следующую букву
  def get_input
    print 'Введите следующую букву: '
    letter = gets[0].upcase
  end
end
