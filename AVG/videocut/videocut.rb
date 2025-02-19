# frozen_string_literal: true

# цепляем мои файлы с модулями
require_relative 'methods'
require_relative 'avglib'

# Конфигурация
SIZE_MB = 950 # каким размером делать каждый файл?
SOURCE_DIR = File.join(__dir__, 'videos')
OUTPUT_DIR = File.join(__dir__, 'output')
folders = [SOURCE_DIR, OUTPUT_DIR]
FFMPEG_PATH = '/usr/bin/ffmpeg' # путь для linux debian

AVGlib.rootdir
AVGlib.create_folders(folders)
