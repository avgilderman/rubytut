# frozen_string_literal: true

require 'text'
require 'pathname'
require 'parallel'

PATH = '/Volumes/Android SD/books2'
COMPARE_LEVEL = 3

# Определяет метод, который принимает директорию и обрабатывает все ее поддиректории.
def process_all_subdirectories(directory, &)
  stack = [directory]
  while (current_directory = stack.pop)
    # Запускаем цикл, который выполняется, пока в стеке есть директории.
    current_directory.each_child do |item| # Перебираем все элементы в текущей директории.
      next unless item.directory? # Пропускаем текущий элемент, если он не является директорией.

      yield(item) if block_given? # Выполняем переданный блок кода для текущей директории, если блок был передан.
      stack.push(item) # Добавляем текущую поддиректорию в стек для дальнейшей обработки.
    end
  end
end

# Определяет метод для сравнения поддиректорий в текущей директории по заданному уровню схожести.
def compare(current_directory, compare_level)
  subdirectories = fetch_subdirectories(current_directory) # Получает список поддиректорий в текущей директории.

  return if subdirectories.size < 2 # Прекращает выполнение метода, если в текущей директории меньше двух поддиректорий.

  similar_directories = find_similar_directories(subdirectories, compare_level) # Находит похожие поддиректории.

  # Выводит на экран найденные похожие поддиректории.
  print_similar_directories(similar_directories) if similar_directories.any?

  similar_directories # Возвращает список похожих поддиректорий.
end

# Определяет метод для получения списка всех поддиректорий в данной директории.
def fetch_subdirectories(directory)
  directory.children.select(&:directory?) # Получает все элементы в директории и фильтрует только директории.
end

# Определяет метод для поиска всех похожих пар поддиректорий.
def find_similar_directories(subdirectories, compare_level)
  # Создает все возможные комбинации двух поддиректорий и выполняет параллельную обработку каждой пары с использованием 4 потоков.
  Parallel.map(subdirectories.combination(2), in_threads: 4) do |dir1, dir2|
    name1 = dir1.basename.to_s # Получает имя первой директории как строку.
    name2 = dir2.basename.to_s # Получает имя второй директории как строку.
    distance = Text::Levenshtein.distance(name1, name2) # Вычисляет расстояние Левенштейна между именами двух директорий.

    # Если расстояние меньше или равно заданному уровню, возвращает массив с обеими директориями и их расстоянием.
    [dir1, dir2, distance] if distance <= compare_level
  end.compact # Удаляет все `nil` элементы из массива, оставляя только те, для которых выполнено условие.
end

# Определяет метод для вывода списка похожих поддиректорий на экран.
def print_similar_directories(similar_directories)
  similar_directories.each do |dir1, dir2, distance| # Перебирает все пары похожих директорий.
    puts "Похожие директории: '#{dir1.basename}' и '#{dir2.basename}' (расстояние: #{distance})" # Выводит информацию о каждой паре похожих директорий и расстоянии между ними.
  end
end

def start_finding(path)
  pathname = Pathname.new(path)
  process_all_subdirectories(pathname) do |dir| # Запускает обход всех поддиректорий, применяя метод `compare` для каждой директории.
    compare(dir, COMPARE_LEVEL) # Сравнивает поддиректории в каждой найденной директории с использованием заданного уровня схожести.
  end
end

start_finding(PATH) # Запускает выполнение всей программы, начиная с указанного пути.
