# Notes: Week 1.1

## Prepare Windows for Linux

Before deep dive into Linux, let's know about few important commands those are available in Windows itself.

**Windows Package Manager**: `winget`

```bash
# search for a package online
winget search package_name

# list installed packages
winget list package_name

# List all packages installed that
# can be managed with `winget`:
winget list --source winget

# Display information about a package
winget show package_id

# Install, upgrade, or uninstall
winget install package_id
winget upgrade package_id
winget uninstall package_id

```

Let's First upgrade `winget` itself

```bash
winget --version
winget list winget  # see available version
winget upgrade winget

```

**PowerShell**: `pwsh`

```bash
# install PowerShell
winget install Microsoft.PowerShell

# Upgrade PowerShell
pwsh --version
winget upgrade Microsoft.PowerShell

```


**Windows Subsystem for Linux**: `wsl`

Ensure hardware virtualization is enabled through BIOS.

```bash
# See whether you already have a wsl installed.
wsl -l -v

# upgrade wsl itself
winget upgrade Microsoft.WSL

# See available Linux Distro
wsl -l -o

# install/upgrade default distro i.e. Ubuntu LTS
wsl --install
wsl --update

# install an specific Linux distro
wsl --install -d DistroName

```

**Congratulations!**
Now we can use Linux Distro in Windows PC using either `bash` or `wsl`. From now onwards, we will talk about Linux bashed commands more specifically Debian based commands.

## Know about the system

```bash
# Before moving further
# Let's first know about shutdown and reboot the machine
shutdown -h now
shutdown --reboot now

shutdown --reboot +5 &  # reboot in 5 minutes
shutdown -h 13:00       # schedule shutdown at 1pm
shutdown -c             # cancel pending shutdown/reboot schedule

# hostname, OS, Kernel, Machine ID, etc.
hostnamectl

# Current Machine and OS detail
uname -a

# Distro Information (Distro Codename)
lsb_release -a

# complete CPU information
batcat /proc/cpuinfo

# OS version information
batcat /proc/version

# Following files also store information about the system
batcat /proc/meminfo
batcat /proc/partitions

# RAM Details
free -h

# Information about the current process we're running;
# a symbolic link t oa /proc/nnn file, automatically updated.
ls -l /proc/self
# lrwxrwxrwx 1 root root 0 May 16 07:30 /proc/self -> 1299

# Hard disk partitions information
df -h

# Watch the process running on the computer
top -d 1

# List all running processes including the full command string
ps auxw

# List all process
ps w

# sort by size
ps w --sort size

# list all process

# system's domain name (hostname)
# Full Qualified domain name
hostname
hostname -fqdn

# local and public IP address
hostname -i
hostname -I

# Name and addresses of the computer
batcat /etc/hosts

# Display all available information about
# who is logged in and related data.
who --all --heading

# print all environment variables
printenv
env

# print value against a particular environment variable
echo $VAR_NAME

echo $NAME
# Laptop-82XW

# Display current user and group identity
id

```

### Special shell variables

```bash
echo $0 # name of the shell i.e. bash or ksh
echo $$ # process id of the shell
echo $- # flags set that are currently used by the bash
echo $? # error code of the last command

```

## Know about available commands

```bash
# type of command: `built-in` or `filesystem`, or `alias`
type command1 command2 ...

# locate the binary, source, and manual page files
whereis command1 command2 ...

# Locate a program in the user's `$PATH`
which command1 command2 ...

# one-line description from manual pages
whatis command1 command2 ...

# Format and display manual pages
man command
# display the path searched for manpage(s)
man --path

# Read documentation stored in the info format
info command
info    # top-level directory menu

# Simple help pages from community driven project
tldr command

```

### man command to get manual for a command

**`man` pages** are divided into **sections**. However, most `man` pages do not have all of these sections. In general, a `man` page will have only those sections that are appropriate to the command - most `man` pages have only one or two sections.

Following are generic sections but it is not restricted. A particular command may have other section. For example, `passwd` has a section `1ssl` for **OpenSSL application commands**.

1. Executable programs or shell commands
2. System calls provided by Kernel
3. Library calls
4. Special files usually found in /dev
5. File formats and conversions
6. Games
7. Misc : macro packages and conventions
8. System admin commands
9. Kernel routines

You can usually learn what sections are available for a `man` page using this command:
Display a concise one line description with each available section for provided command.
`man -f command_name`

```bash
man -f command_name
man -f passwd
# passwd (1)           - change user password
# passwd (1ssl)        - OpenSSL application commands
# passwd (5)           - the password file

# Let's see 1ssl section for the passwd command
man 1ssl passwd

```

## Find new command

```bash
apropos regex
apropos regex --long # non-truncated result
# search for pages that match all the `regex` given
apropos regex_1 --and regex_2 --and regex_3

man --apropos regex
man -k regex        # shortcut

# pressing tab twice after a keyword also list
# all matching commands starts with the provided keyword.
command # + tab

open # tab tab
# openfiles.exe  opengl32.dll   openssl        openvt

```
