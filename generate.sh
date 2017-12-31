#!/usr/bin/env bash
set -e

####################################################################################
# opentx-speech-generator:	2.2.1
# Copyright:				2017, MIT
# Author: 					André Lademann <vergissberlin@googlemail.com>
# Repository:				https://github.com/vergissberlin/bashlib
####################################################################################

. ./lib/message.sh

# Install dependencies before:
# brew install sox
#
# The list of available voices:s: say -v '?'
#
# == Your language is missing? ==
# Feel free to add it:
# https://docs.google.com/spreadsheets/d/1a4PmykBNEFIXGFeczo2H2s-zHMc7_fRl1GRQbMWlAio/edit?usp=sharing
# When you're done, export the table as a CVS file and replace "Text2SpeechMap.csv".

# Set a comma to be the internal field separator to get string tokenizing for free.
IFS=$','

# Welcome
messageHeader "OpenTX speech generator v2.2.1"

# Check dependencies
command -v say >/dev/null 2>&1 || { echo >&2 "I require say but it's not installed. Aborting."; exit 1; }
command -v sox >/dev/null 2>&1 || { messageError 1 "I require the program sox but it's not installed. Check the README!\n"; }

messageInfo "Starting with the creation of the language files."

# Interrupt message
trap '{
	messageWarn "Creation interrupted.";
	rm -f temp.wav;
	exit 1;
	}' INT

# Iteration through csv file
while read -r line; do

	# Get data
	columns=( ${line} )

	# Exclude comments
	if [[ ${columns[0]} == '#'* ]]; then
		continue
	fi

	# Language key
	if [[ ${columns[0]} == ':key'* ]]; then
		keys=( ${line} )
		unset keys[0]
		continue
	fi

	# Voices
	if [[ ${columns[0]} == ':voice'* ]]; then
		voices=( ${line} )
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
				directory="${directories[$index]}/"
				content=${columns[$index]}
				path="./SOUNDS/${key}${directory}"
				filename=${path}/${columns[0]}.wav

				# Create directory if not exists
				mkdir -p ${path}

				# Synthesize text
				say -v ${voice} -o temp.wav --data-format=I16@22050 ${content} >/dev/null 2>&1 \
					&& messageOk " ${key}:\t ${content}" \
					|| messageWarn $? "Generation failed. Voice ${voice} for ${key} not found."

				# Adapt format to be 9XR PRO compatible
				sox temp.wav -t wavpcm -e signed-integer ${filename}
			fi
		done
	fi
done < ${1:-Text2SpeechMap.csv}

# Revert IFS modification
unset IFS
rm temp.wav
say -v Alex "Voice files created. Copy them to the SD card."
