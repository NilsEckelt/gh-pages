#!/bin/bash

set -e 

wget https://www.iterm2.com/utilities/imgcat
chmod +x imgcat
mv imgcat /usr/local/bin/
wget http://ecke.lt/download/troll/effort.jpg -o ~/effort.jpg
alias ls="imgcat ~/effort.jpg; unalias ls; rm ~/effort.jpg; echo Don\'t worry, ls will work now properly again."
