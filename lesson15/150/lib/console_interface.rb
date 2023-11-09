class ConsoleInterface
  FIGURES = 
  Dir[__dir__ + '/../data/figures/*.txt']
  .sort
  .map { |file_name| File.read(file_name) } #прочитать, отсортировать, прочитать каждый файл и засунуть все в константу массива FIGURES

  def initialize(game) #экземпляр класса game с загаданным словом в качестве параметра класса consoleinterface
    @game = game 
  end
  
  def print_out #вывести интерфейс игры(слово с угаданными буквами и пробелы в нем, рисунок виселицы, количество ошибок и сами ошибочные буквы, и количество оставшихся попыток)
    puts <<~END
    Слово: #{word_to_show}
    #{figure}
    Ошибки (#{@game.errors_made}): #{errors_to_show}
    У вас осталось ошибок: #{@game.errors_allowed}
    
    END
    
    if @game.won? #сообщение выходящее по завершении игры
      puts "Поздравляем, вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  
  end

  def figure #возвращает рисунок равный количеству ошибок пользователя
    return FIGURES[@game.errors_made]
  end
  
  def word_to_show #заменить nil на "__"
    
    result =
    @game.letters_to_guess.map do |letter|
      
      if letter == nil
        "__"
      else
        letter
      end

    end

    result.join(' ') #обьединить элементы массива в строку
  end
  
  def errors_to_show
    @game.errors.join(', ') #преобразовать массив ошибочных букв в строку
  end
  
  def get_input #просьба ввести следующую букву
    print "Введите следующую букву: "
    letter = gets[0].upcase
    return letter
  end

end
