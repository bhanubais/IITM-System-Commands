# Notes: Week 1.3

## Hard links and Soft links

Disks manage stored file/folder in a special data structure and assign a unique id and an absolute path to it. The unique ID called `inode`. A file/folder can be access through it's path (whether using absolute or relative to other location) or through `inode`.

We can create multiple access point for a particular file using either `inode` or with `path`. When we use `inode` it's call **Hard link** and when we use `path` its called **Soft Link**.

**Note**: For the folders, we are restricted to only create soft links because of unknowingly/accidentally create infinite loop by cross referencing two folders or create a hardlink to a child folder etc.

```bash
# Create a symbolic link to a file or directory:
ln -s /path/to/file_or_directory path/to/symlink

# Overwrite an existing symbolic link to point to a different file:
ln -s --force /path/to/new_file path/to/symlink

# Create a hard link to a file:
ln /path/to/file path/to/hardlink

```

### Example:

See the following demonstration to better understand:

```text
~/test_folder
    -> file_1.txt
    -> file_2.txt
    -> inner_folder
    -> file_1_hard
    -> file_2_soft
```


```bash
cd ~
mkdir test_folder && cd test_folder
touch file_{1..2}.txt
mkdir inner_folder

# fill some text inside file_1.txt
echo "This is a file_1 text" > file_1.txt

# check whether texts successfully inserted.
cat file_1.txt
# This is a file_1 text

cat file_2.txt
# This content belongs to file_2.txt file

# fill some text inside file_2.txt as well
echo "This content belongs to file_2.txt file" > file_2.txt


# ---- Hard Links ----

# create a hard link for the file_1.txt as file_1_hard
ln file_1.txt file_1_hard

# check it through its hard link
cat file_1_hard
# This is a file_1 text

# let's move the file_1.txt into inner_folder
mv file_1.txt ./inner_folder

# check
ls
# file_1_hard  file_2.txt  inner_folder
ls inner_folder/
# file_1.txt

# Now access the file ./inner_folder/file_1.txt through hard link
cat file_1_hard
# This is a file_1 text

# Let's test something STRANGE! - Delete the original file
pwd
# ~/test_folder
rm inner_folder/file_1.txt

# Now let's try to access it through hard link
cat file_1_hard
# This is a file_1 text

# Whoa!
# So the link is persistent whether we move or delete the original file

# ---- Soft Links ----

# create a Soft link for the file_2.txt as file_2_soft
ln file_2.txt file_2_soft

# check file_2.txt content through its soft link
cat file_2_soft
# This content belongs to file_2.txt file

# Now let's move the file_2.txt
mv file_2.txt ./inner_folder/

ls
# file_1_hard  file_2_soft  inner_folder

ls inner_folder/
# file_1.txt  file_2.txt

# try to access file_2.txt with it's soft link again
cat file_2_soft
# cat: file_2_soft: No such file or directory
# WHAT!
# Yes moving original file, breaks it's Soft Links.

```

We can see the Soft links visually using `ls -l` as below:

```bash
ls -l
# total 8
# -rw-r--r-- 1 bhanubais bhanubais   22 May 17 11:16 file_1_hard
# lrwxrwxrwx 1 bhanubais bhanubais   10 May 17 11:25 file_2_soft -> file_2.txt
# drwxr-xr-x 2 bhanubais bhanubais 4096 May 17 11:30 inner_folder

```

There may be a chance of Soft Links chaining. To see the complete chain we can use `readlink -f path/to/file`. It will list complete chain.

### Observations

- If you rename, move or delete the original file, a hard link is not affected: it still points to the same *data* that the original file did. A symbolic link breaks, however. It still points to the original file’s *path*, which no longer exists. The symbolic link is now “dangling,” and if you use it in a command, you’ll probably receive a “file not found” error.
- Hard links can exist only on the same device as the original file because inode(s) have meaning only on a single device. Symbolic links can point to files on other devices because they refer to file paths, not file data.
- Symbolic links can point to directories, whereas hard links generally cannot. (On some filesystems, the superuser can create a hard link to a directory with the `-d` option.)

### Flags

| **Flag** | **Description**                                                 |
|----------|-----------------------------------------------------------------|
|     s    | Make symbolic link                                              |
|     i    | Ask before overwriting the target files.                        |
|     f    | Overwrite the target unconditionally                            |
|     b    | Create a backup. If the target already exists,                  |
|          | rename it by appending a tilde, then create the link.           |
|     d    | Create a hard link to a directory if possible (superusers only) |

## File related commands

`less`, `wc`, `head`, `tail`, `cat`, `more`

```bash
# display content of the file
cat filename

# helpful to display a long file (one screen at a time)
less filename

# top 10 lines
head filename
# top 5 lines
head -5 filename

# 10 lines from the end of the file
tail filename
# 5 last lines
tail -5 filename

# shows number of lines, words, and bytes occupied on the disk
wc filename

# Count all lines in a file:
wc --lines path/to/file

# Count all words in a file:
wc --words path/to/file

# Count all bytes in a file:
wc --bytes path/to/file

# Count all characters in a file (taking multi-byte characters into account):
wc --chars path/to/file
```

## Memory folders

There are two directories those are not available on the disk but on the memory itself. Those are `/sys` and `/proc`. We can know more about our system in readonly manner using files under these directories.

`/proc` is very old format but still have important files.

When we see the list of the files inside `/proc` folder, many files are shown as **zero** size. Because they are not on the disk and live here for representational purpose only.

`/sys` is much organized folder compare to `/proc` because it is newer and now standard.

