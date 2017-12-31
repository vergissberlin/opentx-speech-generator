#!/usr/bin/env bash

####################################################################################
# Messages from bashlibs
# Copyright:				2017, MIT
# Author: 					André Lademann <vergissberlin@googlemail.com>
# Repository:				https://github.com/vergissberlin/bashlib
####################################################################################


# Colour definitions
red='\033[01;31m'
blue='\033[0;34m'
green='\033[01;32m'
yellow='\033[0;33m'
orange='\033[38;5;;172m'
norm='\033[0m'
code='\033[40m'

# Styling definitions
bold_begin='\033[1m'
bold_end='\033[21m'
underline_begin='\033[34;4m'
underline_end='\033[24m'
blink_begin='\033[33;5m'
blink_end='\033[0m'

# Message
function message() {
    echo -e "\r[${1}]\t\t${2}"
}

function messageError {
    message "${red}erro${norm}" "${@:2}"
    exit $1
}

function messageWarn {
	message "${yellow}warn${norm}" "$*"
	say -v Oliver "${*}";
}

function messageOk {
	message "${green} ok ${norm}" "$*"
}

function messageInfo {
	message "${blue}info${norm}" "$*"
	say -v Oliver "${*}"
}

function messageCode {
	message "${yellow}code${norm}" "${code}$*${norm}"
}

function messageHeader {
    echo -e "\n${blue}-----------------------------------------------------------------------------------------------------------${norm}"
	echo -e "::::\t$*"
    echo -e "${blue}-----------------------------------------------------------------------------------------------------------${norm}\n"
}
