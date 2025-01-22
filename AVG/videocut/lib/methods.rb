# frozen_string_literal: true

required_gems = ['streamio-ffmpeg', 'fileutils']
GemManager.check_and_install_gems(required_gems)


# Проверка наличия FFmpeg
def check_ffmpeg_installed
  # Определяем путь к FFmpeg
  ffmpeg_command = FFMPEG_PATH || 'ffmpeg'

  unless system("#{ffmpeg_command} -version > /dev/null 2>&1")
    puts "Похоже, что FFmpeg не установлен или не доступен по пути: #{FFMPEG_PATH || 'PATH'}."
    puts "Укажите вашу операционную систему: (1 - macOS, 2 - Linux, 3 - Windows)"
    os_choice = gets.chomp.to_i

    case os_choice
    when 1
      puts "\nДля установки FFmpeg на macOS выполните команду:\n\nbrew install ffmpeg\n"
    when 2
      puts "\nДля установки FFmpeg на Linux (Ubuntu/Debian) выполните команду:\n\nsudo apt update && sudo apt install ffmpeg\n"
    when 3
      puts "\nДля установки FFmpeg на Windows:\n1. Скачайте FFmpeg с официального сайта: https://ffmpeg.org/download.html\n2. Добавьте путь до FFmpeg в переменную окружения PATH.\n"
    else
      puts "Неизвестный выбор операционной системы. Установите FFmpeg вручную."
    end

    exit
  end

  # Если FFmpeg установлен, устанавливаем его путь для Streamio
  FFMPEG.ffmpeg_binary = ffmpeg_command
end

# Разделение видео на части
def split_video(file_path, output_folder, max_size_mb)
  # Создаем выходную папку для файла
  FileUtils.mkdir_p(output_folder)

  # Получаем информацию о видео
  movie = FFMPEG::Movie.new(file_path)

  # Рассчитываем битрейт для одной части
  total_size_bytes = movie.size
  num_parts = (total_size_bytes / (max_size_mb * 1024 * 1024).to_f).ceil
  part_duration = movie.duration / num_parts

  puts "Разделение #{file_path} на #{num_parts} частей (по #{max_size_mb} MB каждая)."

  base_name = File.basename(file_path, File.extname(file_path))

  num_parts.times do |i|
    start_time = i * part_duration
    output_file = File.join(output_folder, "#{base_name}_part#{i + 1}.#{movie.container}")

    # Выполняем разделение
    movie.transcode(output_file, { custom: %W(-ss #{start_time} -t #{part_duration}) })
    puts "Создан файл: #{output_file}"
  end
end

# Основная функция
def main
  # Проверяем установку FFmpeg
  check_ffmpeg_installed

  # Проверяем, существует ли исходная папка
  unless Dir.exist?(SOURCE_FOLDER)
    puts "Папка #{SOURCE_FOLDER} не найдена!"
    return
  end

  # Создаем выходную папку
  FileUtils.mkdir_p(OUTPUT_FOLDER)

  # Обрабатываем все файлы в исходной папке
  Dir.glob(File.join(SOURCE_FOLDER, '*')).each do |file_path|
    next unless File.file?(file_path)

    output_folder = File.join(OUTPUT_FOLDER, File.basename(file_path, '.*'))
    split_video(file_path, output_folder, MAX_SIZE_MB)
  end
end
