#!/bin/bash

read -s -p "enter your super secure private secret confidential key: " key
read -p "enter repo name: " repo_name
read -p "enter description file name: " fname
description=$(<"$fname")

git init

if [ "${#username}" -eq 0 ]; then
    read -p "enter username: " user
    export username=$user
fi

curl -L -X POST -H "Authorization: Bearer $key" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"description\":\"$description\"}" > /dev/null

touch .gitignore
echo gitscript.sh >> .gitignore
echo $fname >> .gitignore
git add -A
git commit . -m "Initial commit"
git branch -m master main

git push --set-upstream "https://$key@github.com/$username/$repo_name.git" main


echo "done! good job"