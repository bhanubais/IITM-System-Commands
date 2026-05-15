# Base Programming

## if conditions

```bash
if [[ ${o} -gt 3 ]]; then
        echo '2 > 3';
else
        echo '2 <= 3';
fi
# 2 <= 3

if [[ $(whoami) == 21f3000317 ]]; then
        echo you are welcome
else
        echo not allowed
fi
# you are welcome
```

## for loop

```bash
for i in 1 2 3; do
    echo $i
done
# 1
# 2
# 3

arr=(1 2 3)
for i in "${arr[@]}"; do
        echo $i
done
# 1
# 2
# 3

```

## while loop

```bash
c=0
while [[ $c -lt 3 ]]; do
        echo $c
        # (( c++ ))
        (( c+=1 ))
done
# 0
# 1
# 2

```

**Read file line by line**:

```file.txt
enean
nec sit amet est
mattis eu mi.
nec auctor urna efficitur id.
Suspendisse eget massa.
```

```bash
while read -r line; do
    echo $line
done < file.txt
# enean
# nec sit amet est
# mattis eu mi.
# nec auctor urna efficitur id.
# Suspendisse eget massa.
```

**Read the file word by word**:

```bash
while read -r line; do
    for word in ${line}; do
        echo $word
    done
done < file.txt
# enean
# nec
# sit
# amet
# est
# ...
# massa.
```

**Read the csv file**:

```file.csv
a,b,c,d
1,2,3,4
5,6,7,8
9,10,11,12
13,14,15,16
```

```bash
# IFS for seperator
# f1: column1
# f2: column2
# rest: rest of the columns

while IFS=, read -r f1 f2 rest; do
    echo $f1 $f2 $rest
done < file.csv
# a b c,d
# 1 2 3,4
# 5 6 7,8
# 9 10 11,12
# 13 14 15,16
```

# `find`, `file` and `xargs` command usecase

**Usecase 1**: Let's we want to see file type of all files starting with the letter 's' in the current directly.

```bash
# return all file names (only files)
find -type f
# return all files startw with 's'
find s* -type f

# return file type of all files
file *

# But we can't pass output of find into file directly
find s* -type f | file
# Error

# To pass the outout of the find as argument to the file command
# we can use xargs command
find s* -type f | xargs file

```

**Usecase 2**: Remove all empty files from current directory recursivly.

```bash
find -type f | xargs file | egrep "empty$" | cut -d: -f1 | xargs
 rm
```

# Create a sequence of numbers

```bash
# Default separat or is \n
seq 14
# 1
# 2
# ...
# 13
# 14

# equalize width
seq -w 14
# 01
# 02
# ...
# 13
# 14

# Custom separator
seq -s"-" 14
# 1-2-3-4-5-6-7-8-9-10-11-12-13-14

```

# Remove duplicates

```bash
(seq 3; seq 5; seq 7)
# 1
# 2
# 3
# 1
# 2
# 3
# 4
# 5
# 1
# 2
# 3
# 4
# 5
# 6
# 7

# Let's sort first
(seq 3; seq 5; seq 7) | sort
# 1
# 1
# 1
# 2
# 2
# 2
# 3
# 3
# 3
# 4
# 4
# 5
# 5
# 6
# 7

# unique
(seq 3; seq 5; seq 7) | sort | uniq
# 1
# 2
# 3
# 4
# 5
# 6
# 7

# Unique with count
# count value
(seq 3; seq 5; seq 7) | sort | uniq -c
#       3 1
#       3 2
#       3 3
#       2 4
#       2 5
#       1 6
#       1 7

# Remove extra spaces (more than single space)
(seq 3; seq 5; seq 7) | sort | uniq -c | tr -s " "
#  3 1
#  3 2
#  3 3
#  2 4
#  2 5
#  1 6
#  1 7


# Duplicates
(seq 3; seq 5; seq 7) | sort | uniq -d
# 1
# 2
# 3
# 4
# 5

```

# Get most frequent number in a file

```data.txt
56
63
64
6
6
6265
6654
265
6
6
658
9

9
9
```

```bash
cat data.txt | sort | uniq -c | tr -s " "
#  1
#  1 265
#  1 56
#  4 6
#  1 6265
#  1 63
#  1 64
#  1 658
#  1 6654
#  3 9

cat data.txt | sort | uniq -c | tr -s " " | sort -r
#  4 6
#  3 9
#  1 6654
#  1 658
#  1 64
#  1 63
#  1 6265
#  1 56
#  1 265
#  1

cat data.txt | sort | uniq -c | tr -s " " | sort -r | head -1
#  4 6

cat data.txt | sort | uniq -c | tr -s " " | sort -r | head -1 | cut -d " " -f3
# 6

```

# usecase of `tr` command

Let's there are following files in the current directory. And we would like to extract size column only (columne no. 5)

```bash
total 52
-rwxr-xr-x 1 21f3000317 21f3000317  490 Feb 20 04:28 arithmetic.sh
-rwxr-xr-x 1 21f3000317 21f3000317  489 Feb 20 04:26 arithmetic.sh~
-rwxr-xr-x 1 21f3000317 21f3000317  185 Feb 20 04:19 conditions.sh
-rw-rw-r-- 1 21f3000317 21f3000317   42 Feb 25 05:22 data.txt
-rw-rw-r-- 1 21f3000317 21f3000317   47 Feb 24 17:15 file.csv
-rw-rw-r-- 1 21f3000317 21f3000317   91 Feb 24 17:08 file.txt
-rw-rw-r-- 1 21f3000317 21f3000317  150 Feb 24 16:57 file.txt~
-rwxr-xr-x 1 21f3000317 21f3000317   69 Feb 20 04:52 path.sh
-rwxrw-r-- 1 21f3000317 21f3000317  281 Feb 20 00:47 s1.sh
-rwxrw-r-- 1 21f3000317 21f3000317  114 Feb 20 01:16 s2.sh
drwxrwxr-x 2 21f3000317 21f3000317 4096 Feb 25 04:36 stest
-rwxr-xr-x 1 21f3000317 21f3000317   88 Feb 24 17:18 test.sh
-rwxr-xr-x 1 21f3000317 21f3000317  105 Feb 24 17:06 test.sh~
```

Following command would not work as 5th column is right aligned using spaces.

```bash
ls -l | cut -d " " -f5











# 4096


```

So, we need to remove extra spaces

```bash
ls -l | tr -s " "
# This will produce following outout
# you can see that the 5th column is not left aligned by removing extra spaces
total 52
-rwxr-xr-x 1 21f3000317 21f3000317 490 Feb 20 04:28 arithmetic.sh
-rwxr-xr-x 1 21f3000317 21f3000317 489 Feb 20 04:26 arithmetic.sh~
-rwxr-xr-x 1 21f3000317 21f3000317 185 Feb 20 04:19 conditions.sh
-rw-rw-r-- 1 21f3000317 21f3000317 42 Feb 25 05:22 data.txt
-rw-rw-r-- 1 21f3000317 21f3000317 47 Feb 24 17:15 file.csv
-rw-rw-r-- 1 21f3000317 21f3000317 91 Feb 24 17:08 file.txt
-rw-rw-r-- 1 21f3000317 21f3000317 150 Feb 24 16:57 file.txt~
-rwxr-xr-x 1 21f3000317 21f3000317 69 Feb 20 04:52 path.sh
-rwxrw-r-- 1 21f3000317 21f3000317 281 Feb 20 00:47 s1.sh
-rwxrw-r-- 1 21f3000317 21f3000317 114 Feb 20 01:16 s2.sh
drwxrwxr-x 2 21f3000317 21f3000317 4096 Feb 25 04:36 stest
-rwxr-xr-x 1 21f3000317 21f3000317 88 Feb 24 17:18 test.sh
-rwxr-xr-x 1 21f3000317 21f3000317 105 Feb 24 17:06 test.sh~
```

```bash
ls -l | tr -s " " | cut -d " " -f5
# This will give us 5th column as we wanted.

490
489
185
42
47
91
150
69
281
114
4096
88
105
```

We cal also sort the files according to file size

```bash
# sort 5th column only
# separate column using ' '
# numeric and reverse sorting
ls -l | tr -s " " | sort -k 5,5 -t ' ' -nr
# result
drwxrwxr-x 2 21f3000317 21f3000317 4096 Feb 25 04:36 stest
-rwxr-xr-x 1 21f3000317 21f3000317 490 Feb 20 04:28 arithmetic.sh
-rwxr-xr-x 1 21f3000317 21f3000317 489 Feb 20 04:26 arithmetic.sh~
-rwxrw-r-- 1 21f3000317 21f3000317 281 Feb 20 00:47 s1.sh
-rwxr-xr-x 1 21f3000317 21f3000317 185 Feb 20 04:19 conditions.sh
-rw-rw-r-- 1 21f3000317 21f3000317 150 Feb 24 16:57 file.txt~
-rwxrw-r-- 1 21f3000317 21f3000317 114 Feb 20 01:16 s2.sh
-rwxr-xr-x 1 21f3000317 21f3000317 105 Feb 24 17:06 test.sh~
-rw-rw-r-- 1 21f3000317 21f3000317 91 Feb 24 17:08 file.txt
-rwxr-xr-x 1 21f3000317 21f3000317 88 Feb 24 17:18 test.sh
-rwxr-xr-x 1 21f3000317 21f3000317 69 Feb 20 04:52 path.sh
-rw-rw-r-- 1 21f3000317 21f3000317 47 Feb 24 17:15 file.csv
-rw-rw-r-- 1 21f3000317 21f3000317 42 Feb 25 05:22 data.txt
```
