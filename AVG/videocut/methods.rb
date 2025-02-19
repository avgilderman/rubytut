# frozen_string_literal: true

install_gemfile
require 'fileutils'
require 'streamio-ffmpeg'

# внутреняя работа FFMPEG
module FFMPEG
  # проверяем установлен ли ffmpeg?
  def self.ffmpeg_installed?
    FFMPEG::Movie.new('').metadata # проверяем ffmpeg созданием объекта и вызовом его метода
    true
  rescue StandardError
    # Если возникает ошибка, выбрасываем исключение с сообщением
    raise 'FFmpeg не найден. Установите его, следуя инструкциям на https://ffmpeg.org/download.html'
  end

  # Разделение видео на части
  def self.split_video(file_path, output_folder, max_size_mb)
    FileUtils.mkdir_p(output_folder)
    base_name = File.basename(file_path, File.extname(file_path))
    output_pattern = File.join(output_folder, "#{base_name}_part%03d.mp4")

    command = [
      'ffmpeg', '-i', file_path,
      '-c', 'copy', '-map', '0',
      '-f', 'segment', '-segment_size', (max_size_mb * 1024 * 1024).to_s, # что за шляпааа?
      '-reset_timestamps', '1',
      output_pattern
    ]

    system(*command)
    puts "Разделение завершено: #{file_path}"
  end
end

# Основная функция
module Main
  def self.run(source_folder, output_folder, max_size_mb)
    FFMPEGHelper.check_ffmpeg_installed

    unless Dir.exist?(source_folder)
      puts "Папка #{source_folder} не найдена!"
      return
    end

    FileUtils.mkdir_p(output_folder)

    Dir.glob(File.join(source_folder, '*')).each do |file_path|
      next unless File.file?(file_path)

      file_output_folder = File.join(output_folder, File.basename(file_path, '.*'))
      VideoProcessor.split_video(file_path, file_output_folder, max_size_mb)
    end
  end
end
