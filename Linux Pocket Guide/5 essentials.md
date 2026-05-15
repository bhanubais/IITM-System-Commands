## Tailoring Shell Behavior

Several files in home directory control the behavior of bash shells. All these files can set variables, run programs, print silly messages, or whatever you like.

### Startup files:
Run each time while **log in**. Choose just one startup file and stick with it.

- `.bash_profile` - Recommemded!
- `.bash_login`
- `.profile`

### Initialization files:

- Run each time while **launching an interactive shell.**
  `.bashrc`
- Run each time while **log out.**
  `.bash_logout`

### Various Shell configuration files in $HOME direcctory

| **Shell** | **On login**               | **By other shells**        | **On logout**  |
|-----------|----------------------------|----------------------------|----------------|
| bash      | `.bash_profile`,           |                            |                |
|           | `.bash_login`, `.profile`  | `.bashrc`                  | `.bash_logout` |
| dash      | `.profile`                 |                            |                |
| fish      | `.config/fish/config.fish` | `.config/fish/config.fish` |                |
| ksh       | `.profile`, `.kshrc`       | `.kshrc`                   |                |
| tcsh      | `.tcshrc`, `.cshrc`,       | `.tcshrc`, `.cshrc`        |                |
|           | `.login`                   |                            |                |
| zsh       | `.zshenv`, `.zprofile`     | `.zshenv`, `.zshrc`        | `.zlogout`     |
|           | `.zlogin`                  |                            |                |
|-----------|----------------------------|----------------------------|----------------|


## Getting Help

### `man` command
Documentation

Search for manual pages (manpages) by keyword for a particular topic `keyword`.
- `man -k <keyword>`
- example: `man -k database`

get manual about a particular command
- `man wc`

### `info` command
Extended, typertext help files. While `info` runs, some useful keystrokes are:

- `h`           Get Help
- `spacebar`    page forward
- `backspace`   page backward
- `tab`         jump between hyperlinks
- `enter`       Follow hyperlink

- To get information about a particular command i.e. `ls` here.
  `info ls`

- Get a listing of available documentations
  `info`

- To learn how to navigate the info system,
  `info info`

### `--help` or `-h` option

Many linux commands respond to the option `--help` or `-h`

- `wc --help`
- `wc --help | less`

### Supporting documents

The directory `/usr/share/doc/` contains supporting documents (such as copyright, changelog, README, etc.) for various installed programs. For example:
- `ls /usr/share/doc/whois`

## Linux Communities

- [It's FOSS Community!](https://itsfoss.community/)
- [Unix & Linux](https://unix.stackexchange.com/)

