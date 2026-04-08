## 1. List different owner and group name

If you use `ls -l` command you see the output like this:
`-rw-r--r-- 1 bhanubais bhanubais 274549 Feb 11 18:48 hwinfo.txt`
`-rw-r--r-- 1 bhanubais bhanubais      0 Feb 11 20:43 noFiles.txt`
Here owner and the group are the same. But I want to see if there any
file which has different owner and group?

Write a command which print all the files in the entire system which
have different owner and group name.

## 2. Print unique line of two output

There are multiple commands those generate same output and you would like to see whether there are any difference?

```bash
# For example both of the following commands print environment variables.
env
printenv

# Unique
echo -e "$(env)\n$(printenv)" | sort | uniq -u

# Common
echo -e "$(env)\n$(printenv)" | sort | uniq -d

```

```bash
man -k ^ls
apropos ^ls

# Unique
echo -e "$(man -k ^ls)\n$(apropos ^ls)" | sort | uniq -u

# Common
echo -e "$(man -k ^ls)\n$(apropos ^ls)" | sort | uniq -d

```

## 3. print a1, a2, ... g4 in separate line

```bash
echo {a..g}{1..4}
# a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4 e1 e2 e3 e4 f1 f2 f3 f4 g1 g2 g3 g4

# But I want to print them in separate line

# store the output in a temporary variable
temp=$(echo {a..g}{1..4})

# replace space with new line
echo -e "${temp// /\\n}"
# a1
# a2
# a3
# a4
# b1
# ...
# g4
```

## 4. Delete all files except one

Support you have multiple files at your current directory as follow:

- test1.txt
- notes.txt
- info.md
- readme.md
- script.sh
- script.sh~

And you want to delete all files except `script.sh`

```bash
# Let's proceed it one by one

# This will print all files except script.sh in multiple lines
ls | egrep "^script.sh$" -v
# test1.txt
# notes.txt
# info.md
# readme.md
# script.sh~

# But I want to print them in single line
echo $(ls | egrep "^script.sh$" -v)
# test1.txt notes.txt info.md readme.md script.sh~

# Now we need to use it as parameter of `rm`
# to this we can use ``.
rm `echo $(ls | egrep "^script.sh$" -v)`

```
