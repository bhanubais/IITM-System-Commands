## Download Practice files

```bash
cd
curl -o https://linuxpocketguide.com/LPG4.tar.gz
tar -xf LPG4.tar.gz
cd ~/linuxpocketguide

# To re-download and install the practice files
# (say you modified them)
cd ~/linuxpocketguide
bash reset-lpg

```

## Linux has four major parts

1. **Kernel**: Connects hardware, networks etc.
2. **Programs**: Call kernel. Programs those run on Terminal, called `commands`
3. **Shell**: Invoke programs in CLI such as `bash`, `dash`, `ksh`, etc.
4. **Graphic Desktop Environment** (Optional): Launch Shell. UI with windows such as GNOME, KDE, etc.

## Shell Operation

**Read**: Input from file/terminal, arguments
    ↓
**Break** into `tokens`: Words and operators separated by `metacharacters`
    ↓
**Parse**: `tokens` into commands
    ↓
**Shell expansions** (opt.):
Break expanded tokens into lists of filenames, commands, and arguments.
    ↓
**Redirections** (opt.):
Perform redirections and removes operators and their operands from argument list.
    ↓
**Execute**:
    ↓
**Waits** (opt.): Waits for command to complete and collects its exit status.

## Command-Line Warm-up

```bash
cal apr 2026
#      April 2026
# Su Mo Tu We Th Fr Sa
#           1  2  3  4
#  5  6  7  8  9 10 11
# 12 13 14 15 16 17 18
# 19 20 21 22 23 24 25
# 26 27 28 29 30

ls /bin | wc -l
# 862

# Hard disk partition information
df -h
# Filesystem      Size  Used Avail Use% Mounted on
# none            3.9G     0  3.9G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
# none            3.9G  4.0K  3.9G   1% /mnt/wsl
# drivers         300G  164G  136G  55% /usr/lib/wsl/drivers
# /dev/sdd       1007G  2.7G  954G   1% /
# none            3.9G   76K  3.9G   1% /mnt/wslg
# none            3.9G     0  3.9G   0% /usr/lib/wsl/lib
# rootfs          3.9G  2.7M  3.9G   1% /init
# none            3.9G  536K  3.9G   1% /run
# none            3.9G     0  3.9G   0% /run/lock
# none            3.9G     0  3.9G   0% /run/shm
# none            3.9G   76K  3.9G   1% /mnt/wslg/versions.txt
# none            3.9G   76K  3.9G   1% /mnt/wslg/doc
# C:\             300G  164G  136G  55% /mnt/c
# D:\              50G   30G   21G  59% /mnt/d
# E:\              30G  1.9G   29G   7% /mnt/e
# F:\             200G   48G  153G  24% /mnt/f
# G:\              40G  3.4G   37G   9% /mnt/g
# H:\             150G   72G   79G  48% /mnt/h
# I:\             140G   36G  105G  26% /mnt/i
# tmpfs           784M   20K  784M   1% /run/user/1000

# Watch the process running on the computer (press `q` to quit)
top -d1

# Name and addresses of the computer
batcat /etc/hosts

# see how long we have logged in:
last -1 $USER   # local user
last -1         # root user

# download a file from the internet
curl -O http://linuxpocketguide.com/sample.pdf

# See the domain owner's detail
whois bhanubais.com | less

# clear the window (May press `ctrl+l`)
clear

# See who are logged in into Linux
who
# bhanubais pts/1        2026-04-10 05:04

# Check whether a folder linked with someone
ls -ld /bin
# lrwxrwxrwx 1 root root 7 Apr 22  2024 /bin -> usr/bin

# Get all directories in the root that has symbolic link
ls -ld /* | grep "^l"
# lrwxrwxrwx   1 root root       7 Apr 22  2024 /bin -> usr/bin
# lrwxrwxrwx   1 root root       7 Apr 22  2024 /lib -> usr/lib
# lrwxrwxrwx   1 root root       9 Apr 22  2024 /lib64 -> usr/lib64
# lrwxrwxrwx   1 root root       8 Apr 22  2024 /sbin -> usr/sbin

# Get all files inside /proc
ls /proc -la | grep "^d" -v
# -v reverse selection

# or we can leaverate regulalr expression
ls /proc -la | grep "^[^d]"
# [^d] means not d
```

## interesting Directory Structure

System information directory: `/proc/`
```bash
# Get CPU information like processors
batcat /proc/cpuinfo

# The OS version information
batcat /proc/version

# Information about the current process we're running;
# a symbolic link to a /proc/nnn file, automatically updated.
ls -l /proc/self
# lrwxrwxrwx 1 root root 0 Apr 10 05:04 /proc/self -> 1968
```

## File Permissions

| Permissions | **Files** `-` | **Folders** `d`          |
|-------------|---------------|--------------------------|
| Read `r`    | Open          | List files               |
| Write `w`   | Modify        | Create/Delete files      |
| Execute `x` | Run           | Enter the Directory `cd` |

```bash
# List files with permissions
ls -l
# total 6076
# -rw-r--r--  1 bhanubais bhanubais 6212154 Apr  9 03:27 LPG4.tar.gz
# drwxr-xr-x 10 bhanubais bhanubais    4096 Apr  9 03:56 linuxpocketguide
# drwx------  3 bhanubais bhanubais    4096 Apr 15 16:08 snap

# List folders only
ls -ld
# drwxr-x--- 9 bhanubais bhanubais 4096 Apr 15 16:21
```

| Position | Meaning                      |
|----------|------------------------------|
| 1        | File type (-, d, l, p, c, b) |
| 2-4      | File's **Owner** Permissions |
| 5-7      | Files **Group** Permissions  |
| 8-10     | Other **users** Permissions  |

### File type:

- `-` = file
- `d` = directory
- `l` = symbolic link
- `p` = named pipe
- `c` = character device
- `b` = block device

Example: `-rwxr-x---` means
- File type: file
- Owner: read, write, execute
- Group: read, execute
- Other: Access Denied

Commands to change permissions:
- `chown`, `chgrp`, `chmod`

## Pattern Matching

| **Pattern**   | **Meaning**                                                  |
|---------------|--------------------------------------------------------------|
| *             | Zero or more consecutive characters                          |
| ?             | Any single character                                         |
| [set]         | single character in a given set, i.e., [A-Z] or [aeiouAEIOU] |
| [^set]        | Single character not in the given set                        |
| [!set]        | The same as [^set], sometimes it doesn't work in regex.      |
| \             | Escape character                                             |

### Brace Expansion

Expand to become multiple arguments to a command.

Examples:

```bash
echo {bubble,quick,merg}sort.java
# bubblesort.java quicksort.java mergesort.java

echo {1..6}
# 1 2 3 4 5 6

echo {A..E}
# A B C D E

echo file{1..3}.py
# file1.py file2.py file3.py

# Note: ${var1,var2,...} will not work as per assumption.
# It is totally different. We will look into it later part.
```
