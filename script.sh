#!/bin/bash

# Create an array files that contains list of filenames
files=($(< url.txt))
cities=($(< city.txt))
url="http://www.grotal.com/"
citycodes=($(<citycode.txt))

# Read through the url.txt file and execute wget command for every filename
while IFS='=| ' read -r param uri; do
        for file in "${files[@]}"; do
            for city in "${cities[@]}"; do
                mkdir "${city}"
		mkdir "${city}/${file}"
                wget -O "${city}/${file}/${file}${citycodes[@]}" "${uri}${url}${city}/${file}-${citycodes[@]}/"
                        done
                    done
                done < url.txt
