# frozen_string_literal: true

# массив с именами файлов(можно добавлять новые, для более детального лица (важно соблюсти последовательность массива))
program_files = ['foreheads.txt', 'eyes.txt', 'noses.txt', 'mouths.txt', 'shoulders.txt']

# переменная с относительным путём до рабочего каталога
directory_files = File.join(File.dirname(__FILE__), 'data')
# переменная с относительным путём до каталога куда будет сохраняться файлы
directory_saves = File.join(File.dirname(__FILE__), 'saves_files')

time = Time.new
fileformat = "human_#{time.strftime('%Y.%m.%d_%H-%M-%S')}.txt"
composite_sketch = []
newfile = nil

program_files.each do |datafile|
  file_path = File.join(directory_files, datafile)
  temp = []

  # формируем имя нашего файла с фотороботом
  new_file_name = "#{directory_saves}/#{fileformat}"
  # файл с фотороботом
  newfile = File.new(new_file_name, 'a:UTF-8')

  # читаем файл, если он существует
  if File.exist?(file_path)
    file = File.new(file_path, 'r:UTF-8')
    temp = file.readlines
    file.close
    composite_sketch << temp.sample
  else
    puts "Файл '#{datafile}' не найден."
    File.delete(new_file_name)
  end
end

newfile.puts
newfile.puts(composite_sketch.join)
newfile.puts

newfile.close

puts <<~HEREDOC

  Составим фоторобот типичного гражданина:

  #{composite_sketch.join}

HEREDOC
