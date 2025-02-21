# frozen_string_literal: true

require_relative 'avglib' # модуль с общими необходимыми методами
AVGlib.install_gemfile # вызов метода для установки необходимых гемов
require 'fileutils'
require 'streamio-ffmpeg'

# внутреняя работа FFMPEG
module FFMPEG
  # проверяем установлен ли ffmpeg?
  def self.ffmpeg_installed?
    FFMPEG::Movie.new('').metadata # проверяем ffmpeg созданием объекта и вызовом его метода
    true
  rescue StandardError
    raise 'FFmpeg не найден. https://ffmpeg.org/download.html'
  end

  # узнать количество частей, на которые нужно разрубить видеофайл
  def how_many_parts(file_path, max_size_part)
    filesize_bytes = File.size(file_path)
    filesize_mb = ((filesize_bytes / 1024) / 1024).to_i
    (filesize_mb / max_size_part).ceil
  end

  # узнать какая длинна должна быть у каждой части
  def part_duration(file_path, parts_count)
    video = FFMPEG::Movie.new(file_path)
    (video.duration / 60.0) / parts_count
  end

  # Разделение видео на части
  def self.split_video(source_dir, output_dir, size_mb)
    filename = File.basename(source_dir, File.extname(source_dir)) # имя файла из source_dir без расширения и пути
    output_pattern = File.join(output_dir, "#{filename}_part_%03d.mp4")

    command = [
      'ffmpeg', '-i', source_dir,
      '-c', 'copy', '-map', '0',
      '-f', 'segment', '-segment_time', '600',
      '-reset_timestamps', '1',
      output_pattern
    ]

    system(*command)
    puts "Разделение завершено: #{source_dir}"
  end
end

# Основная функция
module Main
  def self.run(source_folder, output_dir, size_mb)
    FFMPEGHelper.check_ffmpeg_installed

    unless Dir.exist?(source_folder)
      puts "Папка #{source_folder} не найдена!"
      return
    end

    FileUtils.mkdir_p(output_dir)

    Dir.glob(File.join(source_folder, '*')).each do |source_dir|
      next unless File.file?(source_dir)

      file_output_dir = File.join(output_dir, File.basename(source_dir, '.*'))
      VideoProcessor.split_video(source_dir, file_output_dir, size_mb)
    end
  end
end
