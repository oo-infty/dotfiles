#!/usr/bin/env zsh

if [[ -d $1 ]]; then
    tree $1
elif [[ $1 == *.zip ]]; then
    zipinfo $1
elif [[ -f $1 ]]; then
    batcat --style=numbers,header --color=always $1
fi
