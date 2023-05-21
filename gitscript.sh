#!/bin/bash

ask_repo() {
  read -p "enter repo name: " repo_name
  # tries to match git.....yay
  while ! [[ "$repo_name" =~ ^git.*yay$ ]]
  do
    echo "invalid format"
    read -p "enter repo name: " repo_name
  done
}

read -s -p "enter your super secure private secret confidential key: " key
echo ""

read -p "enter description file name: " fname
description=$(<"$fname")

while [[ $? -eq 1 ]]
do
  echo "file aint existing"
  read -p "enter description file name: " fname
  description=$(<"$fname")
done

git init

if [ "${#username}" -eq 0 ]; then
    read -p "enter username: " user
    export username=$user
fi

ask_repo

response=$( curl -L -X POST -H "Authorization: Bearer $key" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"description\":\"$description\"}" )

while [[ "$response" =~ ^.*message\":\ \"name\ already\ exists\ on\ this\ account.*$ ]]
do
  echo "Repository already exists :("
  ask_repo
  response=$( curl -L -X POST -H "Authorization: Bearer $key" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"description\":\"$description\"}" )
done

touch .gitignore
echo gitscript.sh >> .gitignore
echo $fname >> .gitignore
git add -A
git commit . -m "Initial commit"
git branch -m master main

git remote add origin "https://$key@github.com/$username/$repo_name.git"

echo "done! good job"