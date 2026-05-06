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

