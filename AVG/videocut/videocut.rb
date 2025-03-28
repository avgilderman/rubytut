# frozen_string_literal: true

# Конфигурация программы:
# ============================
max_size_part = 20 # задаётся максимальный размер каждой части видеофайла
SOURCE_DIR = File.join(__dir__, 'videos') # директория исходников
OUTPUT_DIR = File.join(__dir__, 'output') # общая директория вывода файлов
FFMPEG_PATH = '/usr/bin/ffmpeg' # путь до FFMPEG (для linux debian)
# ============================

# Подключения файлов с функциями
require_relative 'methods'
require_relative 'avglib'

main_dir = [SOURCE_DIR, OUTPUT_DIR] # массив путей основных директорий
AVGlib.rootdir # переходим в корневую папку проекта
FFMPEG.ffmpeg_installed? # проверка установки инструмента
AVGlib.create_folders(main_dir) # проверка/создание основных директорий

input_files = AVGlib.list_files(SOURCE_DIR) # создаем список файлов для обработки

output_files = source_files.map

created_files = []

how_many_parts = FFMPEG.how_many_parts
