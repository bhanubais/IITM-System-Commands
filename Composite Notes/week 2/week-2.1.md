## Defining Variables

```bash
MYVAR=3
echo $MYVAR
# 3
```
It will set a variable for the duration of current session. For example

```bash
HOME=/home/kanika
printenv HOME
# /home/kanika
```
Open a new terminal and try again
```bash
printenv HOME
# /home/bhanubais
```


# Few default variables in Linux

| **Variable** | **Purpose/Meaning**                                           |
|--------------|---------------------------------------------------------------|
| DISPLAY      | The name of your X window display                             |
| HOME         | Your home directory, such as /home/smith                      |
| LOGNAME      | Your login name, such as smith                                |
| MAIL         | Your incoming mailbox, such as /var/spool/mail/smith          |
| OLDPWD       | Your shell’s previous directory, prior to the last cd command |
| PATH         | Your shell search path: directories separated by colons       |
| PWD          | Your shell’s current directory                                |
| SHELL        | The path to your shell (e.g., /bin/bash)                      |
| TERM         | The type of your terminal (e.g., xterm or vt100)              |
| USER         | Your login name                                               |


### Variable pattern print

```bash

${var,}   # lowercase first character
${var,,}  # lowercase entire string
${var^}   # uppercase first character
${var^^}  # uppercase entire string

# Examples

var="Hello world, Friends"
echo ${var,}    # hello world, Friends
echo ${var,,}   # hello world, friends
echo ${var^}    # Hello world, Friends
echo ${var^^}   # HELLO WORLD, FRIENDS

```

### Lesser-known extended form

Here, `pattern` is a **glob pattern** (like `a`, `[A-Z]`, `?`, `*`) that decides **which characters get case-modified**.

```bash

${var,pattern}
${var,,pattern}
${var^pattern}
${var^^pattern}

# Examples 1. Lowercase only specific characters
var="HELLO WORLD"

echo ${var,,[EO]}   # HeLLo WoRLD
# 👉 Only E and O are converted to lowercase.


# Examples 2. Uppercase only certain letters
var="hello world"

echo ${var^^[aeiou]}    # hEllO wOrld
# 👉 Only vowels are uppercased.


# Example 3: First match vs global behavior
var="banana"

echo ${var,a}    # bAnana   (first 'a')
echo ${var,,a}   # bAnAnA   (all 'a')

```

### Export variables to use on other shells

```bash
MYVAR=3
export MYVAR

# or the shorthand:
export MYVAR=3
```

### List all environment variables

```bash
# print all variables current the shell has access
printenv
env

printenv OLDPWD
# /home/bhanubais

echo $OLDPWD
# /home/bhanubais

# there are few pre-defined functions for the user.
# those can be seen using following command
set

```

### special shell variables

```bash
echo $0 # name of the shell i.e. bash or ksh
echo $$ # process id of the shell
echo $- # flags set that are currently used by the bash
echo $? # error code of the last command
```
