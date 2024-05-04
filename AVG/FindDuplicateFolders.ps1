# Замените "C:\" на путь к нужной вам папке
$directory = "D:\"

# Функция для поиска папок с одинаковыми названиями внутри одной папки
function FindDuplicateFolders {
    param (
        [string]$path
    )

    # Получаем все элементы в текущей папке
    $items = Get-ChildItem -Path $path -Directory

    # Создаем хэштаблицу для хранения папок с одинаковыми названиями
    $foldersDict = @{}

    foreach ($item in $items) {
        $folderName = $item.Name
        if ($foldersDict.ContainsKey($folderName)) {
            # Если в хэштаблице уже есть папка с таким же названием,
            # значит нашлись две папки с одинаковыми названиями в одной папке
            Write-Host "Duplicate folders found:"
            Write-Host "   $($item.FullName)"
            Write-Host "   $($foldersDict[$folderName])"
        } else {
            # Если папки с таким названием еще нет в хэштаблице,
            # добавляем ее в хэштаблицу
            $foldersDict[$folderName] = $item.FullName
        }
    }

    # Рекурсивно вызываем функцию для каждой подпапки текущей папки
    $subfolders = Get-ChildItem -Path $path -Directory
    foreach ($subfolder in $subfolders) {
        FindDuplicateFolders -path $subfolder.FullName
    }
}

# Запускаем функцию для поиска дубликатов в указанной папке
FindDuplicateFolders -path $directory
