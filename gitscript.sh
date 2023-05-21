#!/bin/bash

read -p "enter username: " username
read -p "enter your super secure private secret confidential key" key
read -p "enter repo name: " repo_name
read -p "enter description file name: " fname
description=$(<"$fname")



mkdir $repo_name
cd $repo_name
git init

curl -L -X POST -H "Authorization: Bearer $key" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"description\":\"$description\"}" > /dev/null

touch README.md
git add -A
git commit . -m "Initial commit"
git branch -m master main

git remote add origin "git@github.com:$username/$repo_name.git"
git push origin main

echo "done! good job"