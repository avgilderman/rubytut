# frozen_string_literal: true

# цепляем мои файлы с модулями
require_relative 'methods' # модуль с методами для данной программы
require_relative 'avglib' # модуль с общими методами

# Конфигурация
max_size_part = 2000 # задаётся максимальный размер каждой части видеофайла
SOURCE_DIR = File.join(__dir__, 'videos') # Папка видеофайлов-исходников
OUTPUT_DIR = File.join(__dir__, 'output') # общаая папка вывода
FFMPEG_PATH = '/usr/bin/ffmpeg' # путь до FFMPEG для linux debian

# логика программы
# подготовка
AVGlib.rootdir # меняем директорию - на директорию main файла
folders = [SOURCE_DIR, OUTPUT_DIR] # массив основных папок
AVGlib.create_folders(folders) # проверяем/создаем основные папки

how_many_parts(file_path, max_size_part) # !!!!!!!!!!!!!!!!!

сделать что бы несколько файлов можно было класть в папку
