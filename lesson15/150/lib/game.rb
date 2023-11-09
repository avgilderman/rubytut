class Game
  TOTAL_ERRORS_ALLOWED = 7 #количество попыток угадывания в константе

  def initialize(word) #получаем в конструкторе загаданное слово
    @letters = word.chars #letters это массив загаданного слова
    @user_guesses = [] #попытки пользователя
  end
  
  def errors 
    return @user_guesses - @letters #Вычесть из введенных пользователем букв буквы загаданного слова
  end

  def errors_allowed #количество оставшихся попыток пользователя
    return TOTAL_ERRORS_ALLOWED - errors_made
  end
  
  def errors_made #количество сделанных ошибок пользователя
    return errors.length
  end

  def letters_to_guess #массив слова на консольном интерфейсе
    result = 
      @letters.map do |letter| #пробегаемся по массиву загаданого слова
        if @user_guesses.include?(letter) #если буква пользователя включает букву слова - выводим в результате эту букву
          letter
        else
          nil #если буква пользователя не совпадает с буквой слова - выводим nil
        end
      end
    return result
  end

  def lost? #вернет true, если игра окончена
   return errors_allowed == 0
  end
  
  def over? #вернет true если метод won? или метод lost? вернули true
    return won? || lost?
  end

  def play!(letter)#добавить введеную пользователем букву в массив попыток пользователя при условии, что игра не закончена и массив попыток пользователя не включает введенную букву
    
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << letter
    end

  end

  def word #преобразует массив загаданного слова в строку
    return @letters.join
  end

  def won? #true, если все элементы @letters содержатся в @user_guesses(разность пуста)
    return (@letters - @user_guesses).empty?
  end

end
