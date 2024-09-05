# frozen_string_literal: true

TRANSLIT_MAP = {
  'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'g', 'д' => 'd', 'е' => 'e', 'ё' => 'e',
  'ж' => 'zh', 'з' => 'z', 'и' => 'i', 'й' => 'y', 'к' => 'k', 'л' => 'l', 'м' => 'm',
  'н' => 'n', 'о' => 'o', 'п' => 'p', 'р' => 'r', 'с' => 's', 'т' => 't', 'у' => 'u',
  'ф' => 'f', 'х' => 'kh', 'ц' => 'ts', 'ч' => 'ch', 'ш' => 'sh', 'щ' => 'shch', 'ъ' => '',
  'ы' => 'y', 'ь' => '', 'э' => 'e', 'ю' => 'yu', 'я' => 'ya',
  'А' => 'A', 'Б' => 'B', 'В' => 'V', 'Г' => 'G', 'Д' => 'D', 'Е' => 'E', 'Ё' => 'E',
  'Ж' => 'Zh', 'З' => 'Z', 'И' => 'I', 'Й' => 'Y', 'К' => 'K', 'Л' => 'L', 'М' => 'M',
  'Н' => 'N', 'О' => 'O', 'П' => 'P', 'Р' => 'R', 'С' => 'S', 'Т' => 'T', 'У' => 'U',
  'Ф' => 'F', 'Х' => 'Kh', 'Ц' => 'Ts', 'Ч' => 'Ch', 'Ш' => 'Sh', 'Щ' => 'Shch', 'Ъ' => '',
  'Ы' => 'Y', 'Ь' => '', 'Э' => 'E', 'Ю' => 'Yu', 'Я' => 'Ya'
}.freeze

def transliterate(str)
  # Заменяем русские буквы на латиницу по хэшу TRANSLIT_MAP
  result = str.chars.map { |char| TRANSLIT_MAP[char] || char }.join
  # Удаляем все символы, кроме букв, цифр, подчеркивания, дефиса и пробела
  result = result.gsub(/[^a-zA-Z0-9_\- ]/, '')
  # Заменяем множественные пробелы на один пробел
  result.gsub(/\s+/, ' ').strip
end

def rename_folders(root_directory)
  Dir.glob("#{root_directory}/**/*", File::FNM_DOTMATCH).select { |path| File.directory?(path) && path != root_directory }.each do |folder|
    folder_name = File.basename(folder)
    new_name = transliterate(folder_name)

    # Пропускаем переименование, если имя не изменилось или стало пустым
    next if folder_name == new_name || new_name.empty?

    new_folder_path = File.join(File.dirname(folder), new_name)

    # Дополнительная проверка на наличие прав доступа
    begin
      puts "Переименование: '#{folder}' в '#{new_folder_path}'"
      File.rename(folder, new_folder_path)
    rescue Errno::EACCES
      puts "Ошибка доступа при переименовании '#{folder}' в '#{new_folder_path}'. Пропуск..."
    rescue => e
      puts "Произошла ошибка: #{e.message}. Пропуск..."
    end
  end
end

root_directory = 'I:/books2' # Замените на путь к вашей директории
rename_folders(root_directory)
