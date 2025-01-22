# frozen_string_literal: true

# проверить и установить недостающие гемы
module GemManager
  # проверка
  def self.check_and_install_gems(required_gems)
    required_gems.each do |gem_name|
      if gem_installed?(gem_name)
        puts "Гем '#{gem_name}' уже установлен."
      else
        install_gem(gem_name)
      end
    end
  end

  private

  # Проверяет, установлен ли гем
  def self.gem_installed?(gem_name)
    require gem_name
    true
  rescue LoadError
    false
  end

  # Устанавливает гем, если пользователь согласен
  def self.install_gem(gem_name)
    puts "Гем '#{gem_name}' не установлен."
    print 'Установить его сейчас? (y/n): '
    answer = gets.chomp.downcase
    if answer == 'y'
      system("gem install #{gem_name}")
      if gem_installed?(gem_name)
        puts "Гем '#{gem_name}' успешно установлен!"
      else
        puts "Не удалось установить '#{gem_name}'. Проверьте вручную."
      end
    else
      puts "Установите '#{gem_name}' вручную с помощью команды: gem install #{gem_name}"
      exit
    end
  end

  puts 'Все необходимые гемы готовы!'
end
