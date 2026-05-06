## Shell Job Control

`jobs`              List all jobs
`command &`         run the command in the background
key: `^z`           suspend the current fg job
`fg`                unsuspend and bring it into the fg
`bg`                unsuspend and run it into bg
`disown`            Forget a job.

`bg %2`             Send job 2 to the background
`bg %cat`           Send job beginning with “cat” to the background

`fg %2`             Bring job 2 into the foreground
`fg %cat`           Bring job beginning with “cat” into the foreground

`disown`            Forget all jobs
`disown %2`         Forget job #2
`disown %cat`       Forget job beginning with “cat”
`disown -h %2`      Mark job #2 to keep running after shell exits
`disown -r`         Forget all running jobs
`disown -a`         Forget all jobs

```bash
# Create few jobs
# ----------------------
sleep 200           # run a timer and halt the terminal for 200 sec.
^z                  # suspend it

nvim fileA &        # run in the background
sleep 300 &         # run in the background

# List all jobs
# ----------------------
jobs
# [1]-  Stopped                 sleep 200
# [2]+  Stopped                 nvim fileA
# [3]   Running                 sleep 300 &


# Bring a job into fg
# ----------------------
# it will open fileA into nvim, press `:q` to close
fg 2
jobs
# [1]+  Stopped                 sleep 200
# [3]-  Running                 sleep 300 &

bg 1
jobs
# [1]-  Running                 sleep 200 &
# [3]+  Running                 sleep 300 &

fg 3
# It bring the sleep 300 in the fg and now terminal went in wait mode
^z  # to suspend it
# [2]+  Stopped                 sleep 300

jobs
# [1]-  Stopped                 sleep 200
# [2]+  Stopped                 sleep 300

disown %1
jobs
# [2]+  Stopped                 sleep 300


disown sl
jobs
# nothing

```

### Reset an unresponsive Shell

Sometimes a terminal is not displaying the keystrokes you type because the killed program could not close itself properly. To fix the shell, follow these steps:

1. Press `Ctrl + j` to get a shell prompt. This keystroke may work even if pressing Enter does not.
2. Type the command `reset` (even if the letters don't appear while you type) and press `ctrl + j` to run it. The shell should return to normal.


## Running multiple Shells at Once using `tmux` command

There are multiple **windows** at root and each window may have multiple **panes**.

### Command while tmux is activated

- `^B?`				Display online help. Press “q” to quit.
- `^Bc`				Create a window.
- `^B0, ^B1 … ^B9`	Switch to window 0 through 9, respectively.
- `^Bn`				Switch to the next window, numerically.
- `^Bp`				Switch to the previous window, numerically.
- `^Bl`				Switch to the most recently used window.
- `^B%`				Split into two panes side by side.
- `^B"`				Split into two panes top and bottom.
- `^Bo`				Jump to the next pane.
- `^B left arrow`	Jump to the pane to the left.
- `^B right arrow`	Jump to the pane to the right.
- `^B up arrow`		Jump to the pane above.
- `^B down arrow`	Jump to the pane below.
- `^Bq`				Display pane numbers for reference.
- `^Bx`				Kill the current pane.
- `^B^B`			Send a true Ctrl-B to your shell, ignored by tmux.
- `^B^Z`			Suspend tmux.
- `^Bd`             “Detach” from a tmux session and return to
                    your original shell. To return to tmux, run tmux attach.
- `^D`              Terminate a shell in a window or pane.
- `^B:kill-session` Kill all windows and terminate tmux

### tmux commands

- `tmux ls`         Show all tmux session list
- `tmux a`          Attached to last session

More details can be found here: [Tmux cheatsheet](https://tmuxcheatsheet.com/)


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

