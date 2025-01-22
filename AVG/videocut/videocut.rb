# frozen_string_literal: true

require_relative File.join(__dir__, 'lib', 'gem_manager')

# Конфигурация
SOURCE_FOLDER = File.join(__dir__, 'videos')
OUTPUT_FOLDER = File.join(__dir__, 'output')
MAX_SIZE_MB = 950
FFMPEG_PATH = nil # example: 'C:/ffmpeg/bin/ffmpeg.exe'


main
