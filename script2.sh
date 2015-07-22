#!/bin/bash

# Create an array files that contains list of filenames
files=($(< url.txt))
cities=($(< city.txt))
url="http://www.grotal.com/"
citycodes=($(< citycode.txt))

# Read through the url.txt file and execute wget command for every filename
while IFS='=| ' read -r param uri; do
        for file in "${files[@]}"; do
                    for (( i = 0 ; i < ${#cities[@]} ; i++ )) do
                                    mkdir "${cities[$i]}"
				    mkdir "${cities[$i]}/${file}"
                                                    wget -O "${cities[$i]}/${file}/${file}_${citycodes[$i]}.html" "${uri}${url}$${cities[$i]}/${file}-${citycodes[$i]}/"
                                                                            done
                                                                                                done
                                                                                                                done < url.txt
