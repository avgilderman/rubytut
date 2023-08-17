class SociabilityTest
  attr_reader :question, :index, :score

  def initialize(question, index, incorrect_questions)
    @question = question
    @index = index
    @score = 0
    @incorrect_questions = incorrect_questions
  end
  
  def question
    user_input = ""
    # задаем вопрос
    puts "#{@index} #{@question}"
    # проверка на правильный ввод буквы
    until user_input == "а" || user_input == "б" || user_input == "в"
      puts "Введите 'а' или 'б' или 'в' и нажмите Enter"
      user_input = STDIN.gets.chomp.downcase
    end

    if !@incorrect_questions.include?(index) && user_input == "а"
      @score += 2
    end
    if @incorrect_questions.include?(index) && user_input == "б"
      @score += 2
      puts "это реверс был"
    end
    if user_input == "в"
      @score += 1
    end
    nil
  end

end
