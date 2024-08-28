#!/bin/zsh

source_folder="$PWD"

for txt_file in "$source_folder"/*.txt; do
    file_name=$(basename -- "$txt_file")
    file_name_no_extension="${file_name%.*}"
    
    mkdir -p ${file_name_no_extension}

    if [ ! -d "$PWD/исходники" ]; then
        mkdir -p "$PWD/исходники"
    fi

    if [ ! -d "${file_name_no_extension}_txt" ]; then
        mkdir -p "${file_name_no_extension}_txt"
    fi

    if [ ! -d "${file_name_no_extension}_aiff" ]; then
        mkdir -p "${file_name_no_extension}_aiff"
    fi

    echo "Начинаем применять комплекс мер направленных на подготовку перечня файлов для создания Вашей новой аудиокниги:"
    echo $file_name_no_extension

    output_folder_aiff="${file_name_no_extension}_aiff"
    output_folder_txt="${PWD}/${file_name_no_extension}_txt"
    output_file_count=1
    line_count=0
    output_file="${output_folder_txt}/${file_name_no_extension}_${output_file_count}.txt"

    while IFS= read -r line; do
        ((line_count++))
        echo "$line" >> "$output_file"

        if [ "$line_count" -eq 500 ]; then
            ((output_file_count++))
            output_file="${output_folder_txt}/${file_name_no_extension}_${output_file_count}.txt"
            line_count=0
        fi
    done < "$txt_file"

    if [ -e "$txt_file" ]; then
        mv "$txt_file" "$PWD/исходники/"
    else
        echo "Файл не найден: $txt_file"
    fi

    echo "Начинаем процесс озвучки"

    for part_file_txt in "$output_folder_txt"/*.txt; do
        if [ -e "$part_file_txt" ]; then
            output_file_aiff="${output_folder_aiff}/$(basename "${part_file_txt%.*}").aiff"
            say -v Milena -o "${output_file_aiff}" -f "${part_file_txt}"
            echo "Продолжаю процесс озвучки. Подождите!"       
        else
            echo "File not found: $part_file_txt"
        fi
    done
    
    mv $output_folder_aiff ${file_name_no_extension}
    mv $output_folder_txt ${file_name_no_extension}

    echo "Перехожу к следующему файлу!"

done

echo "Все файлы обработаны"
