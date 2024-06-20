# frozen_string_literal: true

# класс отвечает за игру
class Game
  TOTAL_ERRORS_ALLOWED = 7 # количество попыток угадывания в константе
  BAD_LETTERS = ['Й', 'Ё'].freeze

  # получаем в конструкторе загаданное слово
  def initialize(word)
    @letters = word.chars # преобразуем слово в массив
    @user_guesses = [] # массив букв введенных пользователем
  end

  # массив ошибочных букв пользователя
  def errors
    @user_guesses - @letters # Вычесть из введенных пользователем букв буквы загаданного слова
  end

  # количество оставшихся попыток пользователя
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  # количество сделанных ошибок пользователя(число)
  def errors_made
    errors.length
  end

  # массив слова на консольном интерфейсе
  def letters_to_guess
    @letters.map do |letter| # пробегаемся по массиву загаданного слова
      if @user_guesses.include?(letter) # если буква пользователя включает букву слова - выводим в результате эту букву
        letter
      else
        nil # если буква пользователя не совпадает с буквой слова - выводим nil
      end
    end
  end

  # вернет true, если игра окончена
  def lost?
    errors_allowed.zero?
  end

  # отдаем куда следует
  def normalize_letter(letter)
    if letter == 'И' && unsolved_letters.include?(BAD_LETTERS[0])
      'Й'
    elsif letter == 'Е' && unsolved_letters.include?(BAD_LETTERS[1])
      'Ё'
    else
      letter
    end
  end

  # вернет true если метод won? или метод lost? вернули true
  def over?
    won? || lost?
  end

  # добавить введеную пользователем букву в массив попыток пользователя при условии, что игра не закончена и массив попыток пользователя не включает введенную букву
  def play!(letter)
    return unless !over? && !@user_guesses.include?(letter)

    @user_guesses << normalize_letter(letter)
  end

  # массив неотгаданных букв
  def unsolved_letters
    @letters - @user_guesses
  end

  # преобразует массив загаданного слова в строку
  def words
    @letters.join
  end

  # true, если все элементы @letters содержатся в @user_guesses(разность пуста)
  def won?
    (@letters - @user_guesses).empty?
  end
end
