# frozen_string_literal: true

require 'rubygems/dependency_installer'
require_relative 'errors'

# Автоматическая установка гемов перечисленных в массиве
module GemManager
  # Проверка и установка переданного массива гемов
  def self.check_and_install_gems(required_gems)
    required_gems.each { |gem_name| installation_process(gem_name) }
    puts 'Все гемы проверены'
  end

  # Процесс проверки и установки гема
  def self.installation_process(gem_name)
    return if gem_installed?(gem_name) # гем установлен?

    # Если гем установился, но не подключается - сообщить:
    return unless install_gem(gem_name) && !gem_installed?(gem_name)

    puts "Гем #{gem_name} установлен, но не подключается. Перезапустите приложение."
  end

  # проверка подключения Гема
  def self.gem_installed?(gem_name)
    require gem_name
    true
  rescue LoadError
    false
  end

  # попытка установки гема
  def self.install_gem(gem_name)
    installer = Gem::DependencyInstaller.new
    installer.install(gem_name)
    Gem.clear_paths
    true # Возвращаем true если установка удалась
  rescue StandardError => e
    Errors.install_error_message(e, gem_name)
    false
  end

  private_class_method :installation_process, :install_gem, :gem_installed?
end
