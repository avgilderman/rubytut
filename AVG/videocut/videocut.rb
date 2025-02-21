# frozen_string_literal: true

# цепляем мои файлы с модулями
require_relative 'methods'
require_relative 'avglib'

# Конфигурация
max_size_part = 2000 # максимальный размер части?
SOURCE_DIR = File.join(__dir__, 'videos')
OUTPUT_DIR = File.join(__dir__, 'output')
folders = [SOURCE_DIR, OUTPUT_DIR]
FFMPEG_PATH = '/usr/bin/ffmpeg' # путь для linux debian

AVGlib.rootdir
AVGlib.create_folders(folders)

how_many_parts(file_path, max_size_part) # !!!!!!!!!!!!!!!!!

сделать что бы несколько файлов можно было класть в папку.А на выходе создавались под каждый файл отдельную папку
