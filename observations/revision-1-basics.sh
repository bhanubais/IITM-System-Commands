# print new line character
echo -e "abc\ndef"
# abc
# def

echo hello; echo world
# hello
# world
# I want to print them in same line
echo -n "hello "; echo world;
# hello world

# Creating the file
# create file but never overwrite if already exists
touch filename 
# Redirection method
# it will overwrite the file if it exists.
>filename
# appending method
# It will also not overwrite the file
>>filename

# Create tree directories
# not works
# produce error
mkdir dir_2/dir_2.1/dir_2.1.1/dir_2.1.1.1
# works
mkdir dir_2/dir_2.1/dir_2.1.1/dir_2.1.1.1 -p
tree
# .
# └── dir_2
#     └── dir_2.1
#         └── dir_2.1.1
#             └── dir_2.1.1.1

# Persent working directory
pwd
echo $PWD

# username
whoami
echo $USER # recommended as it works almost all distributions
echo $USERNAME

# Variable manipulation
# ------------------------
var="abcd efgh ijkl"
echo ${var:0:3}
# abc
echo ${var:5:4}
# efgh

# Replacing the substring
echo ${var/ /-}
# abcd-efgh ijkl
echo ${var// /-}
# abcd-efgh-ijkl
echo ${var// /----}
# abcd----efgh----ijkl
echo ${var/abc/xyx}
# xyzd efgh ijkl

# Trim the string
var2="abcd efgh ijkl mnop"
echo ${var2#* }
# efgh ijkl mnop
echo ${var2##* }
# mnop
echo ${var2% *}
# abcd efgh ijkl
echo ${var2%% *}
# abcd

# Removing from the beginning
echo ${var#* }
# efgh ijkl
# Removing from the end
echo ${var% *}
# abcd efgh

# Deal with undefined variables
# -----------------------------
echo ${var:-not defined}
# abcd efgh ijkl
echo ${var4:-not defined}
# not defined

# If you want to update the value itself
echo ${var4:=defult value}
# default value

# If the value is defiend and we want to show
# something else. i.e. var is defined as
# var="abcd efgh ijkl"
# It will also not change the variable
echo ${var:+Yes it is defined}
# Yes it is defined

# Array
# -------------------
arr=(2 4 6)
echo ${arr}
# 2
echo ${arr[@]}
# 2 4 6
echo ${arr[*]} # it interpret whole array as a single string
# 2 4 6

# Difference between [@] and [*]
for i in "${arr[@]}"; do
    echo $i;
done
# 2
# 4
# 6

for i in "${arr[*]}"; do
    echo $i;
done
# 2 4 6

# Another way to create an array
read -a arr1
1 2 3 4
echo ${arr1[@]}
# 1 2 3 4

# create an array from comma separate values
IFS=, read -a arr2
1,2,3,4
echo ${arr1[@]}
# 1 2 3 4


# Boolean comparision
# --------------------------
# (Note: output of $? 0 means true, else false)

# String comparision
[ 2 > 1 ]; echo $?
# 0
[ 2 > 10 ]; echo $?
# 0
[ 2 = 10 ]; echo $?
# 1

# Numeric comparision
[ 2 -gt 1 ]; echo $?
# 0
[ 2 -gt 10 ]; echo $?
# 1
[ 2 -lt 10 ]; echo $?
# 0
[ 2 -eq 10 ]; echo $?
# 1
[ 2 -ne 10 ]; echo $?
# 0

# Extended comparision
# For extended comparision we should use
# [[ ]]
[[ 20 -gt 10 && 5 -lt 8 ]]; echo $?
# 0
[[ 20 -gt 10 && 10 -lt 3 || 6 -gt 2 ]]; echo $?
# 0

# double parantheses (( ))
# --------------------------
# It is used for the arithmatic comparisions
# We can also do boolean comparision also but the
# 0 means False and 1 means True here.
# This is very similar to to other programming languages.
echo $(( 4 + 5 ));
# 8
echo $(( 4 == 4 ))
# 1
echo $(( 4 < 4 ))
# 0
echo $(( 4 <= 4 ))
# 1

# Keep in mind that we can't do floating arithimetics here.
echo $(( 4.3 + 2.3 ))
# -bash: 4.3 + 2.3 : syntax error: invalid arithmetic operator (error token is ".3 + 2.3 ")

# To use the float arithmetics we can use Bench Calculator `bc` 
echo '4.3 + 2.3' | bc -l
# 6.6

# we can also compare floating values using `bc`
echo "5.1 < 8.6" | bc
# 1
echo "5.1 > 8.6" | bc
# 0
