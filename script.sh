#!/bin/bash

function setup(){
  git config --global user.signingkey "$1"
  git config --global commit.gpgsign true
}

while [[ 69 -eq 69 ]]
do

echo "1. Use an existing GPG key"
echo "2. Create a new GPG key"
echo "3. Exit"
read -p "Enter your choice: " var

if [[ $var -eq 1 ]]; then
  key=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print $2}')
  declare -a keyarr
  keylen=${#key}

  j=0
  k=0
  index=0

  for ((i=0; i<$keylen; i++)); do
    if [[ ${key:$i:1} == "/" ]]; then
      keyarr[$j]=${key:$i+1:16}
      j=$((j+1))
    fi
  done
  
  x=0

  for word in "${keyarr[@]}"; do
    echo "$x $word"
    x=$((x+1))
  done

  echo "Type the index of the GPG key required"
  read -p "Enter index: " index

  gpg --armor --export "${keyarr[index]}"
  new=${keyarr[index]}

  setup $new

elif [[ $var -eq 2 ]]; then
  gpg --gen-key
  key=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/{print $2}')
  new=$(echo "${key[@]}" | tail -c 17)
  gpg --armor --export "$new"

  setup $new

elif [[ $var -eq 3 ]]; then
  break
else
  echo "Invalid option"
fi

done
