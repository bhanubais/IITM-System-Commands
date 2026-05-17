# Notes: Week 1.1

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

## Linux Workflow

Linux has four major parts interconnected with each other as below:

1. **Kernel**: Connects hardware, networks etc.
2. **Programs**: Call kernel. Programs those run on Terminal, called `commands`
3. **Shell**: Invoke programs in CLI such as `bash`, `dash`, `ksh`, etc.
4. **Graphic Desktop Environment** (Optional): Launch Shell. UI with windows such as GNOME, KDE, etc.

### Shell Operation

**Read**: Input from file/terminal, arguments
    ↓
**Break** into `tokens`: Words and operators separated by `metacharacters`
    ↓
**Parse**: `tokens` into commands
    ↓
**Shell expansions** (opt.):
Break expanded tokens into lists of filenames, commands, and arguments.
    ↓
**Redirection** (opt.):
Perform redirection and removes operators and their operands from argument list.
    ↓
**Execute**:
    ↓
**Waits** (opt.): Waits for command to complete and collects its exit status.

## Command-line warm-up

```bash
# calendar
cal apr 2026
cal 2026
cal

# line count
ls /bin | wc -l

# See how long we have logged in
last -1 $USER   # local user
last -1         # root user
who             # who logged in and from when

# download a file from the internet
curl -o http://linuxpocketguide.com/sample.pdf

# see the domainname whois data
whois bhanubais.com | less

# Check whether a folder linked with someone else
# let's check for the folder /bin
ls -ld /bin
# lrwxrwxrwx 1 root root 7 Apr 22  2024 /bin -> usr/bin

# Get all directories in the root folder that are linked with someone
ls -ld /* | grep "^l"
# lrwxrwxrwx   1 root root       7 Apr 22  2024 /bin -> usr/bin
# lrwxrwxrwx   1 root root       7 Apr 22  2024 /lib -> usr/lib
# lrwxrwxrwx   1 root root       9 Apr 22  2024 /lib64 -> usr/lib64
# lrwxrwxrwx   1 root root       8 Apr 22  2024 /sbin -> usr/sbin

# List directories only
ls -la | grep "^d"

# List all except directories
ls -la | grep "^d" -v   # or
ls -la | grep "^[^d]"   # regex way. [^d] means not d

```

## Basic commands and their flags

`ls` command flags

| **Flag** | **Description**                                    |
|----------|----------------------------------------------------|
|     a    | Display all files including hidden ones            |
|     l    | long list format                                   |
|     i    | show index number (inode)                          |
|     s    | show blocks occupied                               |
|     1    | print each file in separate line                   |
|     h    | show numeric values in human readable format       |
|     F    | Appends "/" to dirs, "*" to executables,           |
|          | "@" to symbolic links, ...                         |
|     R    | List Recursively                                   |
|     d    | list directory itself without its content          |

Flags can be combined as well. i.e. `ls -s -h` can be `ls -sh`.

```bash
# see current/present working directory
pwd

# change current working directory
cd          # home --or--
cd ~        # home
cd /        # root
cd -        # previous directory

# Show hierarchy of all files in tree view
tree
tree -a     # show hidden files as well
tree -d     # show only directories

# create a new file
touch path/to/filename

# ---------------------------

# Copy file
cp path/to/source_file path/to/target_file
cp path/to/source_file path/to/target_parent_directory

# Recursively copy a directory's content into another existing directory
cp -r path/to/source_directory path/to/target_directory

# Recursively copy a directory, presenting all file attributes and links.
cp -a path/to/source_directory path/to/target_directory

# copy multiple files at once
cp --target-directory path/to/destination_dir path/to/file_1 path/to/file_2 ...

# create any missing intermediate directories when copies
cp --parents source/path/to/file path/to/target_file

# Copy file permissions, timestamp,
# and ownership (if you have sufficient permissions) too
cp -p path/to/source_file path/to/target_file

# Force the copy, if the destination file exists, overwrite it unconditionally.
cp -f path/to/source_file path/to/target_file

# ---------------------------

# Rename a file or directory when the target doesn't exist
mv path/to/source path/to/target

# Move a file or directory into an existing directory
mv path/to/source path/to/existing_directory

# Move multiple files into an existing directory, keeping the filenames unchanged
mv /path/to/source_1 /path/to/source_2 ... path/to/existing_directory

# prompt for confirmation before overwriting existing file
mv -i path/to/source path/to/target

# show files after they are moved
mv -v path/to/source path/to/target

# Force the move.
mv -f path/to/source path/to/target

# ---------------------------

# delete file or an empty folders
rm file_name
rm folder_name

# prompt before every removal while deleting multiple items
rm -i file*     # delete all files starting with "file"

# display deleted file name while deleting
rm -v file*

# delete a non-empty folder - RECURSIVE
rm -r folder_name   # ⚠️ non-reversal

# ---------------------------

# date, calendar, flipped-calendar
date
cal
ncal

# show the group names which the current user belongs to
groups

# file related commands
# --------------------------------
# Determine file type
file path/to/file
file path/to/files*
file ./script*

# Display properties about a specific file such as size, permissions, creation date, and access date among others:
stat path/to/file
stat path/to/files*

# Create specific files or update their timestamps if they already exist:
touch path/to/file_1 path/to/file_2 ...

# Update timestamps without creating new file
touch --no-create path/to/file_1 path/to/file_2 ...

# Set the file [t]ime to a specific value
touch -t YYYYMMDDHHMM.SS path/to/file_1 path/to/file_2 ...

# Set the files' timestamp to the reference file's timestamp
touch --reference path/to/reference_file path/to/file_1 path/to/file_2 ...

# Give the [u]ser who owns a file the right to e[x]ecute it:
chmod u+x path/to/file

# Give the [u]ser rights to [r]ead and [w]rite to a file/directory:
chmod u+rw path/to/file_or_directory

# Remove e[x]ecutable rights from the [g]roup:
chmod g-x path/to/file

# Give [a]ll users rights to [r]ead and e[x]ecute:
chmod a+rx path/to/file

# Give [o]thers (not in the file owner's group) the same rights as the [g]roup:
chmod o=g path/to/file

# Remove all rights from [o]thers:
chmod o= path/to/file

# Change permissions recursively giving [g]roup and [o]thers the ability to [w]rite:
chmod --recursive g+w,o+w path/to/directory

- Recursively give [a]ll users [r]ead permissions to files. Also give e[X]ecute permissions to files that have at least one execution permission and to all sub-directories:
chmod --recursive a+rX path/to/directory

# open a file for interactive reading
less /path/to/file
# internal shortkeys
# `v` to open the file in editor
# `q` to quit

# Print the contents of a file to stdout:
cat path/to/file

# Concatenate several files into an output file:
cat path/to/file1 path/to/file2 ... > path/to/output_file

# Append several files to an output file:
cat path/to/file1 path/to/file2 ... >> path/to/output_file

# append text into file
echo `echo "Hello World" >> path/to/file

# override text into file
echo `echo "Hello World" > path/to/file

# Write to a file interactively:
cat > path/to/file

# Display file content with line numbers
cat --number path/to/file

# Display all characters, including tabs, line endings, and non-printing characters:
cat --show-all path/to/file

# Pass file contents to another program through stdin:
cat path/to/file | program
```

## --- WARNING ---

Use `rm -r` with caution. It can quickly destroy large numbers of files, especially when combined with `-f` to suppress prompts and ignore errors. Use `sudo rm -r` with extreme caution. It can destroy your whole operating system.

