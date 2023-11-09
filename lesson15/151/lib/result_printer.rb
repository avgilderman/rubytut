class ResultPrinter
  
  def initialize(path_to_results_files)
    @path_to_results_files = path_to_results_files
    @results = read_files(@path_to_results_files)
  end

  def read_files(path)
    Dir["#{__dir__}/../#{path}"]
    .sort
    .map { |file_name| File.read(file_name).chomp }
  end

  # Метод, выводящий на экран результаты теста в качестве параметра в метод должен передаваться объект класса Test, у которого метод спросит результат прохождения теста (количество очков).
  def print_result(test)
    # Выводим ответы на тест в зависимости от результатов ответов
    puts

    # Логика вывода результатов в зависимости от баллов
    if test.points >= 30
      puts "#{test.points} #{@results[0]}"
    elsif test.points >= 25
      puts "#{test.points} #{@results[1]}"
    elsif test.points >= 19
      puts "#{test.points} #{@results[2]}"
    elsif test.points >= 14
      puts "#{test.points} #{@results[3]}"
    elsif test.points >= 9
      puts "#{test.points} #{@results[4]}"
    elsif test.points >= 4
      puts "#{test.points} #{@results[5]}"
    else
      puts "#{test.points} #{@results[6]}"
    end
  end

end
