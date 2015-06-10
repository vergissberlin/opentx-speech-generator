#!/bin/bash

# @see http://openrcforums.com/forum/viewtopic.php?f=123&t=5887
# brew install sox
# chmod +x generate.sh

# # Female Voices
# say -v Samantha "Samantha, hello world"  # Siri's Voice
# say -v Agnes "Agnes, hello world"
# say -v Kathy "Kathy, hello world"
# say -v Princess "Princess, hello world"
# say -v Vicki "Vicki, hello world"
# say -v Victoria "Victoria, hello world"
#
# # Male Voices
# say -v Alex "Alex, hello world"
# say -v Bruce "Bruce, hello world"
# say -v Fred "Fred, hello world"
# say -v Junior "Junior, hello world"
# say -v Ralph "Ralph, hello world"

# The list of available voices:s: say -v '?'

# Set a comma to be the internal field separator to get string tokenizing for free...
IFS=$','
while read -r line; do
	# Only if it is not a comment 
	if [[ $line != '#'* ]]; then
		columns=( $line )
		index=${columns[0]}
		english=${columns[1]}
		german=${columns[2]}
		french=${columns[3]}
		espanol=${columns[4]}
		turkish=${columns[5]}
		russian=${columns[6]}

		# Only if it has a text
		if [ -n "$english" ]; then
    		lang='english'
    		# Veena, Daniel, Bruce, Victoria
    		voice='Daniel'
    		mkdir -p "lang/${lang}/${voice}"
			filename=lang/${lang}/${voice}/${index}.wav
			echo "🇬🇧\t${english}"
			# Synthesize text
			say -v ${voice} -o temp.wav --data-format=I16@22050 $english
			# Adapt format to be 9XR PRO compatible
			sox temp.wav -t wavpcm -e signed-integer $filename
		fi

		# Only if it has a text
		if [ -n "$german" ]; then
    		lang='german'
		    # Markus, Anna, Petra, Yannick
    		voice='Markus'
    		mkdir -p "lang/${lang}/${voice}"
			filename=lang/${lang}/${voice}/${index}.wav
			echo "🇩🇪\t${german}"
			# Synthesize text
			say -v ${voice} -o temp.wav --data-format=I16@22050 $german
			# Adapt format to be 9XR PRO compatible
			sox temp.wav -t wavpcm -e signed-integer $filename
		fi
	fi
done < Text2SpeechMap.csv
# Revert IFS modification
unset IFS
rm temp.wav
