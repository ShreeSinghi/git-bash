#!/bin/bash

echo "1. Use an existing GPG key"
echo "2. Create a new GPG key"
read -p "Enter your choice: " val

if [[ $val -eq 1 ]]; then
  key=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print $2}')
  name=$(gpg --list-secret-keys --keyid-format=long|awk '/uid/{print $3}')
  declare -a keyarr
  declare -a uidarr
  keylen=${#key}

  for i in "${!key[@]}"; do
    echo "$i ${name[i]}"
  done


  j=0
  k=0
  index=0

  for ((i=0; i<$keylen; i++)); do
    if [[ ${key:$i:1} == "/" ]]; then
      keyarr[$j]=${key:$i+1:16}
      ((j++))
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
  newKey=${keyarr[index]}

  git config --global user.signingkey "$newKey"
  git config --global commit.gpgsign true

elif [[ $val -eq 2 ]]; then
  gpg --gen-key
  key=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/{print $2}')
  newKey=$(echo "$key" | tail -c 16)
  gpg --armor --export "$newKey"

  git config --global user.signingkey "$newKey"
  git config --global commit.gpgsign true

else
  echo "Invalid option"
fi
