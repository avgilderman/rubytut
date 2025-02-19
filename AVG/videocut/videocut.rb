# frozen_string_literal: true

# цепляем мои файлы с модулями
require_relative 'methods'
require_relative 'avglib'

# Конфигурация
MAX_SIZE_MB = 950 # каким размером делать каждый файл?
SOURCE_FOLDER = File.join(__dir__, 'videos')
OUTPUT_FOLDER = File.join(__dir__, 'output')
folders = [SOURCE_FOLDER, OUTPUT_FOLDER]
FFMPEG_PATH = '/usr/bin/ffmpeg' # путь для linux debian

AVGlib.rootdir
AVGlib.create_folders(folders)
