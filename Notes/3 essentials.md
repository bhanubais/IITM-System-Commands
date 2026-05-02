## Combined Commands

```bash
# Invode severals commands in sequence
command1 ; command2 ; command3

# AND: Stop execution if anyone of them failed.
command1 && command2 && command3

# OR: Stop execution as soon as one succeeds.
command1 || command2 || command3
```

## Pipes

```bash
# Pass stdout of the command1 to stdinput to the command2.
command1 | command2

# sort list alphabetically
ls | sort
```

## Command Substitution

- use backtick or `$()` to substitute a command's stdout into another.
- `$()` can be used to nested.

```bash
date +%Y
# 2026

echo This year is `date +%Y`.
# This year is 2026.

expr $(date +%Y) + 1
# 2027

echo Next year is $(expr $(date +%Y) + 1)
# Next year is 2027

```

## Cut out fields from `stdin` or files.

- Split each line by the specified delimiter and print all from the second field onward:
`command | cut --delimiter "delimiter" --fields 2-`

- Split each line by the specified delimiter and print the second field:
`command | cut -d "delimiter" -f 2`

- Use space as a delimiter and print only the first 3 fields:
`command | cut -d " " -f -3`

```bash
cd jpegexample
ls *.jpg
# file1.jpg  file3.jpg  file5.jpg  file8.jpg
# file2.jpg  file4.jpg  file7.jpg  file9.jpg

# If we want to just list file name
ls *.jpg | cut -d . -f 1
# file1
# file2
# file3
# file4
# file5
# file7
# file8
# file9
```

## Process Substitution

Some commands get input only from disk files instead of stdinput.
For example, `diff` command. To resolve it we can use `<()` operator.

`diff` command compare two files
`diff <file1> <file2>`

We will use `<()` operator as `diff <() <()`

```bash
cd jpegexample
ls
# file1.jpg  file2.txt  file4.jpg  file5.txt  file7.txt  file9.jpg
# file1.txt  file3.jpg  file4.txt  file6.txt  file8.jpg
# file2.jpg  file3.txt  file5.jpg  file7.jpg  file8.txt

# Let's compare whether every jpg file has corresponding txt file.

diff <(ls *.jpg | cut -d . -f 1) <(ls *.txt | cut -d . -f 1)
# 5a6
# > file6
# 8d8
# < file9

```

## single or double quote and Escaping

Single quotes treat their contents literally, while double quotes permit variables and other shell constructs to be evaluated:

We can escape special meaning character useing `\`.

```bash
echo 'The variable HOME has value $HOME'
# The variable HOME has value $HOME

echo "The variable HOME has value $HOME"
# The variable HOME has value /home/bhanubais


echo f*
# file1.jpg file1.txt file2.jpg file2.txt file3.jpg file3.txt file4.jpg file4.txt file5.jpg file5.txt file6.txt file7.jpg file7.txt file8.jpg file8.txt file9.jpg

echo f\*
# f*

echo "I live in $HOME"
# I live in /home/bhanubais

echo "I live in \$HOME"
# I live in $HOME

```

## Command-line Editing like vi or emacs editor

`set -o emacs` or
`set -o vi`

This setting open editor's capabilities in the terminal itself.
Now we can use vim or emacs keystrokes

To make them parmanently mention them into `~/.bashrc` file.

## Command History

`history`       all history
`history <N>`   most recent N commands
`history -c`    clear (delete) history
`!!`            previous command
`!N`            command number N from history
`!-N`           command you enter N commands ago
`!$`            last argument from previous command
`!*`            drepresent all arguments from previous command

```bash
ls z*
# zebra.txt  zipfile.zip  zookeeper

rm !$   # rm z*

ls p*
# page.html  people  photo.jpg  photo2.png  photo3.gif  poem

wc !*
# wc p*
#      12      21     170 page.html
#       3      14     125 people
#     646    3499  153557 photo.jpg
#    4300   25496 1232796 photo2.png
#    3481   20522  602138 photo3.gif
#       3      15      90 poem
#    8445   49567 1988876 total
```
