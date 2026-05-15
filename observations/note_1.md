## Things that i have noticed

### Find new command

```bash
ls # + tab
man -k ^ls # Display all commands starts with 'ls'
apropos ^ls

```

### Know about the command

```bash
type ls
which ls
whatis ls
du `which ls` -h # give the dist usage of the file
stat `which ls` # almost all information about the file
tldr ls
man ls

```

### Know about your system

```bash
hostnamectl
lsb_release -a
whoami
hostname -i     # local IP address
hostname -I     # public IP address

# Following files also store information about the system
# press `q` to quit
`batcat /proc/cpuinfo`
`batcat /proc/version`
`batcat /proc/meminfo`
`batcat /proc/partitions`

```

### environment variables

```bash
env
printenv

# there are few pre-defined functions for the user.
# those can be seen using following command
set

# special shell variables
echo $0 # name of the shell i.e. bash or ksh
echo $$ # process id of the shell
echo $- # flags set that are currently used by the bash
echo $? # error code of the last command
```
