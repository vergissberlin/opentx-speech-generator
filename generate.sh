#!/bin/bash

# Install dependencies before:
# brew install sox
#
# The list of available voices:s: say -v '?'
# @author André Lademann <vergissberlin@googlemail.com>
#
# == Your language is missing? ==
# Feel free to add it:
# https://docs.google.com/spreadsheets/d/1a4PmykBNEFIXGFeczo2H2s-zHMc7_fRl1GRQbMWlAio/edit?usp=sharing
# When you're done, export the table as a CVS file and replace "Text2SpeechMap.csv".

# Set a comma to be the internal field separator to get string tokenizing for free.
IFS=$','

# Check dependencies
command -v say >/dev/null 2>&1 || { echo >&2 "I require say but it's not installed. Aborting."; exit 1; }
command -v sox >/dev/null 2>&1 || { say -v Alex "I require sox but it's not installed. Aborting."; exit 1; }

# Welcome
say -v Alex "Starting with the creation of the language files."

# Interrupt message
trap '{
        echo "\n\t>> Creation interrupted.\n";
        say -v Alex "Creation interrupted.";
        rm -f temp.wav;
        exit 1;
        }' INT

# Iteration through csv file
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
		continue;
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
done < ${1:-Text2SpeechMap.csv}

# Revert IFS modification
unset IFS
rm temp.wav
say -v Alex "Voice files created. Copy them to the SD card."
