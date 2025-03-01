#!/bin/bash

CACHE_ROOT=~/.wallpapers/cached_imgs
WALLPAPER_ROOT=~/.wallpapers

mapfile -t originPath < <(find ${WALLPAPER_ROOT} -maxdepth 1 -type f)
mapfile -t cachedPath < <(find ${CACHE_ROOT} -maxdepth 1 -type f)
declare -A bgresult
declare -A cachedresult

bgnames=()

function cacheImg {
    ffmpeg -i $1 -loglevel quiet -vf "scale=-1:600, crop=600:600:(iw-600)/2:0" $2
    echo $2
}

function getFileName {
    echo "$1" | xargs basename | awk -F'.' '{print $1}'
}

for pathIDX in "${!originPath[@]}"; do
    filename=$(getFileName "${originPath[$pathIDX]}")
    bgresult["${filename}"]="${originPath[$pathIDX]}"
    bgnames[$pathIDX]+="${filename}"
done


for pathIDX in "${!cachedPath[@]}"; do
    filename=$(getFileName "${cachedPath[$pathIDX]}")
    cachedresult["${filename}"]="${cachedPath[$pathIDX]}"
done


for fName in "${bgnames[@]}"; do
    if [[ -v cachedresult[$fName] ]] 
    then
        :
    else
        cachedresult[$fName]=$(cacheImg "${bgresult[$fName]}" "${CACHE_ROOT}/${fName}.png")
    fi
done

strrr=""
for fName in "${bgnames[@]}"; do
    strrr+="$(echo -n "${fName}\0icon\x1f${cachedresult[$fName]}\n")"
done

selected=$(echo -en "${strrr}" | rofi -dmenu -no-layers -p "search" -config ~/rropdb/arch_custom_style/rofiConfig.rasi )
swww img "${bgresult[$selected]}" --transition-type wipe --transition-fps 60