# Bandit

Level 0: cat readme
- cat reads files

Level 1: cat ./-
- ./ reads files from the root directory and also allows dashes

Level 2: cat spaces\ in\ this\ filename
- use backslash to remove meaning from special characters

Level 3: cat inhere/.hidden
- used -a flag with ls to see hidden files

Level 4: file ./-file0*
- file command displays file type and -file0* is the regex that allows any text after "file0..."
- i chose the file with ascii type

Level 5: find  -size 1033c ! -executable
-  size flag defines file size and ! -executable says that we dont want any files that are executable
- 
Level 6: find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
- the -user -group and size flags set the desired parameters we are searching for
- when any command outputs an error it generally gives all errors in  the error stream but in the terminal, normally the error stream is the same as the normal output stream
- by setting the 2><filename> the errors are redirected to the given file and these errors occur due to insufficient permissions and now its easier to see what the actual output is

Level 7: grep "millionth" data.txt
- used grep to search for string in a file

Level 8: cat data.txt | sort | uniq -u
- used pipes to transfer output as input of the next command
- the uniq command filters out adjacent repeated lines of text, the -u flag modifies the behaviour of the command to ensure that it only outputs the unique lines

Level 9: couldnt solve, found the password 
easily in the printed text

Level 10: base64 -d data.txt
- the base64 command along with -d flag decodes files

Level 11: cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
- the tr command is used to delete/transform characters of a string
- the first string after the tr command represents the set of characters to be translated, we set the entire english alphabet (uppercase and lowercase characters)
- the second string has the information of which letter translates to which using rotation cipher
- we need to specify the map twice since it wraps around

Level 12:
- used xxd to decompress and used file <filename> at each stage to check the file output type
- used gzip to decompress
- used bzip2
- used gzip
- used tar -xvf 4 times
- gzip

Level 13: ssh bandit14@localhost -i sshkey.private -p 2220
- used ssh to connect to port 2220

Level 14: telnet localhost 30000
- used telnet to connect to the port

Level 15: openssl s_client -connect localhost:30001
- s_client is a subcommand of openssl that specifies that we are creating a connection from the server side, not client side

Level 16: nmap -A localhost -p 31000-32000
- used above command to get a list of all ports, 
- only 2 were ssh out of which one said "wrong please enter current password" in the description so tried connectinf to that port using openssl as before
- saved the given key as a file and changed its permissions using chmod 600
- ssh  bandit17@localhost  shree.private -p 2220 to connect to the next level

Level 17: initially tried grep -v -f passwords.new passwords.old
- grep f specifies that two files need to be compared and there 
- the password obtained  didnt work for some reason so then i used
- diff passwords.new passwords.old

Level 18: use ssh -T  bandit18@localhost
- to connect to the server without allocating a terminal (-T flag)
Level 19:
- ran ./bandit20-do
- got a response Run a command as another user. Example: ./bandit20-do
-  ran ./bandit20-do id
- /bandit20-do cat /etc/bandit_pass/bandit20 reads the bandit20 file using the bandit20-do binary

Level  20:
- used ./suconnect to read the instructions of the binary when first logged in (terminal 1)
- created another terminal and logged in to the same server (terminal 2)
- used nc -lv 6969 to create a server listening on the port 6969 (terminal 2)
- used ./suconnect 6969 to execute the binary on that port (terminal 1)
- typed in password (terminal 2) and got next level password
