class Test
  def initialize(path_to_question_files)
    @path_to_question_files = path_to_question_files
    # Переменная где будем хранить суммарное кол-во баллов за ответы
    @points = 0
    # Переменная, в которой будет номер текущего вопроса теста,
    # увеличивается на 1 с каждым заданным вопросом.
    @current_question = 0
    @questions = read_files(@path_to_question_files)
  end

  def read_files(path)
    Dir["#{__dir__}/../#{path}"]
    .sort
    .map { |file_name| File.read(file_name).chomp }
  end

  # Метод, который отвечает на вопрос «Закончился ли тест?» мы будем
  # использовать его в основной программе, чтобы понять, когда пора прекращать
  # задавать вопросы.
  #
  # Очевидно, условие окончания теста — текущий вопрос превысил размер массива
  # вопросов — вопросы кончились.
  def finished?
    return @current_question >= @questions.size
  end

  # Метод, который задает пользователю очередной вопрос и спрашивает ответ. Этот
  # метод повторяет алгоритм этого теста из 8 урока.
  def next_question
    # Выводим очередной вопрос из массива
    print "#{@current_question + 1} "
    puts @questions[@current_question]
    puts

    # Спрашиваем у пользователя вариант ответа пока он не введет одну из трех
    # цифр.
    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = gets.to_i
      puts
    end

    if user_input == 1 && !reverse_count_question? || user_input == 2 && reverse_count_question?
      # Увеличиваем значение переменной @points на 2 за ответ "да" в обычных вопросах
      # и за ответ "нет" в вопросах-исключениях.
      @points += 200
    elsif user_input == 3
      # Увеличиваем значение переменной @points на 1 за ответ "иногда"
      @points += 1
    end

    # Увеличиваем счетчик заданных вопросов
    @current_question += 1
  end

  # Метод, который возвращает true, если на текущий вопрос баллы нужно считать наоборот:
  # "да" - 0 баллов, "нет" - 2 балла
  def reverse_count_question?
    [4, 9, 10].include?(@current_question)
  end

  # Метод-аксессор (геттер) для переменной @points — баллы набранные в тесте
  def points
    return @points
  end

end
