# frozen_string_literal: true

# Библиотека обработки ошибок(удобно добавлять новые ошибки)
module Errors
  # обработка вызовов текстовых инструкций по отдельным ошибкам
  def self.install_error_message(error, gem_name)
    puts "Ошибка установки: #{error.message}" # При любой ошибке выводить месседж
    # если конкретная ошибка, то вызвать совет:
    suggest_manual_install(gem_name) if error.is_a?(Errno::EACCES)
    gem_not_found(gem_name) if error.is_a?(Gem::DependencyError)
    dependence(gem_name) if error.message.include?("Can't find") || error.message.include?('Unable to find')
  end

  def self.suggest_manual_install(gem_name)
    if Gem.win_platform?
      puts "Попробуйте запустить от администратора: gem install #{gem_name}"
    else
      puts "Попробуйте: sudo gem install #{gem_name}"
    end
  end

  def self.gem_not_found(gem_name)
    puts "Ошибка: не удалось найти #{gem_name}"
    puts "Проверьте правильность имени #{gem_name}"
  end

  def self.dependence(gem_name)
    puts "Возможно, не установлены зависимости для гема '#{gem_name}'"
    puts 'Проверьте зависимости лог ошибки на зависимости.'
  end
end
