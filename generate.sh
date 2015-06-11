#!/bin/bash

# Install dependencies before:
# brew install sox
#
# The list of available voices:s: say -v '?'
# @author André Lademann <vergissberlin@googlemail.com>

# Set a comma to be the internal field separator to get string tokenizing for free.
IFS=$','
while read -r line; do

    # Get data
    columns=( $line )

    # Exclude comments
	if [[ ${columns[0]} == '#'* ]]; then
	    continue
	fi

	# Language key
	if [[ ${columns[0]} == ':key'* ]]; then
	    keys=( $line )
	    unset keys[0]
	    continue
	fi

	# Voices
	if [[ ${columns[0]} == ':voice'* ]]; then
	    voices=( $line )
	    unset voices[0]
	    continue
	fi

    # Translations
    if [[ ${columns[0]} != '#'* ]]; then

        # translation for each language key
        for index in ${!columns[*]}
        do
            if [[ ${index} == 0 ]]; then
                continue
            fi


            if [ -n "${columns[$index]}" ]; then
                key=${keys[$index]}
                voice=${voices[$index]}
                content=${columns[$index]}
                dir="lang/${key}/${voice}"
                filename=${dir}/${columns[0]}.wav

                mkdir -p ${dir}
                echo " ${key}:\t ${content}"

                # Synthesize text
                say -v ${voice} -o temp.wav --data-format=I16@22050 $content
                # Adapt format to be 9XR PRO compatible
                sox temp.wav -t wavpcm -e signed-integer $filename
            fi
        done
    fi

done < Text2SpeechMap.csv

# Revert IFS modification
unset IFS
rm temp.wav
