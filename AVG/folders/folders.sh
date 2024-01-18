#!/bin/zsh

cd folders

for file in *.*; do
  folder_name="${file%.*}"
  mkdir -p "$folder_name"
  mv "$file" "$folder_name/"
done
