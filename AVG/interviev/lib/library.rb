# frozen_string_literal: true

# Класс для зранения данных по вопросу
class Quiz
  attr_reader :filename, :question, :answer

  def initialize(filename, question, answer)
    @question = question.to_s
    @answer = answer.to_s
    @filename = filename.to_s
  end
end

# Загрузка всех вопросов из директории. Возвращает массив экземпляров класса Quiz
def load_quizzes(directory_path)
  all_quiz = []
  Dir.glob(File.join(directory_path, '*.txt')).each do |file_path|
    filename = File.basename(file_path, '.txt').strip
    content = File.read(file_path)
    parse_content(filename, content, all_quiz)
  end
  # Возвращаем заполненный массив
  all_quiz
end

# Разбор содержимого вопроса
def parse_content(filename, content, quizzes)
  # Делим текст на секцию "вопрос с ответом"
  sections = content.split('---')

  # Проходим по каждой секции
  sections.each do |section|
    # Делим секцию на вопрос и ответ
    parts = section.split(/(?=^Ответ)/)
    question_part = parts[0]
    answer_part = parts[1]
    quiz = Quiz.new(filename, question_part, answer_part)
    quizzes << quiz
  end
end

# Преобразуем имя файла в тему вопроса
def question_topic(filename) # rubocop:disable Metrics/MethodLength
  case filename
  when 'oop'
    'Общие вопросы по программированию и ООП'
  when 'database'
    'Вопросы по базам данных'
  when 'git'
    'Вопросы по git'
  when 'frontend'
    'Вопросы по фронтенду'
  when 'webdev'
    'Вопросы по веб-разработке'
  when 'other'
    'Разные вопросы по программированию'
  when 'spec'
    'Вопросы по тестированию приложений'
  when 'rails'
    'Вопросы по Ruby on Rails'
  when 'ruby'
    'Вопросы по Ruby'
  else
    filename
  end
end
