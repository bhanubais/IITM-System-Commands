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
printenv
# print all variables current the shell has access

printenv OLDPWD
# /home/bhanubais

echo $OLDPWD
# /home/bhanubais

```

## Program type and location

There are three kind of commands: `built-in`, `filesystem`, `alias`.
We can use `type <command-name>...` command to see what type of a particular command is:

```bash
type ws cd ls
# wc is /usr/bin/wc
# cd is a shell builtin
# ls is aliased to `ls --color=auto'
```

If a command is either filesystem or an alias (originally based on a filesystem) based, we can see it's location using `which <command-name>...`

```bash
which ls who
# /usr/bin/ls
# /usr/bin/who
```

## Aliases

List all aliases

```bash
alias
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# alias egrep='egrep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias grep='grep --color=auto'
# alias l='ls -CF'
# alias la='ls -A'
# alias ll='ls -lhG'
# alias ls='ls --color=auto'
```


Define a new command `ll` that run `ls -lGh`.

```bash
alias ll='ls -lGh'
ll
# -rw-r--r--  1 bhanubais 6.0M Apr  9 03:27 LPG4.tar.gz
# drwxr-xr-x 11 bhanubais 4.0K Apr 27 09:05 linuxpocketguide
# drwx------  3 bhanubais 4.0K Apr 15 16:08 snap
```

Note: There are temperory to the current session only.
To make them parmanently, define them in `~.bashrc` file to make
them available to the future shells. (Some setups use `~/.bash_aliases` for this purpose)

## Input, Output, Error, and Redirection

- `stdin`: Keyboard input
- `stdout`: On Terminal's Display
- `stderr`: On Terminal's Display but considered different than `stdout` internally.

### Input

- `command < infile`: A command can read input from a file

### Output

- `command > outfile`: Create/overwrite outfile
- `command >> outfile`: Append to outfile

### Error handling

Redirect errors in the `errorfile` while standard output on the screen.
- `command 2> errorfile`

Redirect `stdout` to the `output` file, while `stderr` to the `errorfile`
- `command > output 2> errorfile`

Redirect both in a single file
- `command &> outfile`
- `command >& outfile`: Deprecated version


