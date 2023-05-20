

# GIT Exercise

## Master Branch

-   started the exercise from the master branch: git start master.
- also couldnt use git start next because id always be taken to the forge date excercise
## Commit-One-File

-   to start the next exercise, used git start next.
-   I added file A.txt: git add A.txt.
-   committed the changes: git commit -m "Added A to the commit".

## Commit-One-File-staged

-   I removed file B.txt from the staging area: git restore --staged B.txt.
-   committed the changes with the previous commit message using git commit --amend.
## Ignore Them

-created a .gitignore file by running nano .gitignore.
-   added the following patterns to the .gitignore file:

*.exe
*.o
*.jar
libraries/ 

-   I added the .gitignore file to the staging area with git add .gitignore.
-   I committed all the changes with the message "Ignore unwanted files" using git commit -m


## Start Chase-Branch

-   I merged the chase-branch with the escaped branch using git merge excaped.

## Merge-Conflict

-   I merged the another-piece-of-work branch, and a merge conflict occurred in the equation.txt file.
-resolved the conflict by editing the equation.txt file to 2+3 = 5.
-   I added the modified equation.txt to the staging area with git add equation.txt.
-   I committed the changes with the message "Conflict resolved" using git commit -m.

## Save-Your-Work

-   I saved my work on the side using git stash.
-   opened the bug.txt file with nano bug.txt and made the necessary changes.
-   I added and committed the bug.txt file using git add bug.txt and git commit -m "Bug fix".
-   popped the stash and merged it with the bug branch using git stash pop.
-made final changes to the bug.txt file using nano bug.txt.
-   added the bug.txt and program.txt files with git add bug.txt program.txt.
-   I committed the final changes with the message "Final commit" using git commit -m.

## Change-Branch-History

-   I needed to change the history of commits, so used git rebase hot-bugfix.

## Remove-Ignored

-   removed the ignored.txt file from the index area with git rm --cached ignored.txt.
-   I committed the changes with the message "Remove ignored.txt" using git commit -m.

## Case-Sensitive-Filename

-   I renamed the File.txt to file.txt using git mv File.txt file.txt.
 added the renamed file to the staging area with git add file.txt.
-   I committed the changes with the message "Renamed file" using git commit -m.

## Fix-Typo

-   opened the file.txt file with nano file.txt and fixed the typo.
-   added the file.txt to the staging area using git add file.txt.
-   I committed the changes with the message "Fixed a typo" using git commit -m.

## Forge Date

git commit --amend --no-edit --date="1987-08-03"

## Fix Old typo
git rebase -i
- then I changed the penultimate commit mode to edit
- used nano file.txt to remove the error.

- git add file.txt

- git commit --amend

- git rebase --continue then continue to the next commit

- Used nano file.txt to solve merge conflict and added it 

- git rebase --continue kiya
#khatam
