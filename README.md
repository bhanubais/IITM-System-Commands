# Linux System Commands

Concise Linux command notes for a student who couldn't get confidence even after completing the course. These notes are written in a way that helps you learn System Commands from a normal windows user to a mature bash script writer progressively.

These notes may not be aligned with the IITM System Command course structure because I tried to make these more intuitive and practical and want to give gradual experience. I hope you will find these informative.

## Index

### 1. Host Environment

+ **[1.1 Windows Host](1-host-environment/1.1-windows-host.md)** <br>
  *Document Winget package management, Windows Terminal deployment, and PowerShell baselines.*

+ **[1.2 WSL Setup](1-host-environment/1.2-wsl-setup.md)** <br>
  *Execute the Ubuntu kernel deployment and system integration.*

+ **[1.3 Bash Tools](1-host-environment/1.3-bash-tools.md)** <br>
  *Deploy Starship, ble.sh, and fzf to engineer visual and predictive enhancements.*

+ **[1.4 Tailoring Shell Behavior](1-host-environment/1.4-tailoring-shell-behavior.md)** <br>
  *Audit the execution order of .bashrc, .profile, and .bash_profile. Document persistent configurations.*

+ **[1.5 System Power and Interrupts](1-host-environment/1.5-system-power-and-interrupts.md)** <br>
  *Document power state commands including shutdown, reboot, and halt. Structure terminal escape protocols and signal interrupts to resolve frozen environments.*

+ **[1.6 Environment vars and Alias](1-host-environment/1.6-env-and-aliases.md)** <br>
  *Calibrate the $PATH variable, declare global environment states, and structure permanent aliases.*

+ **[1.7 Getting Help](1-host-environment/1.7-getting-help.md)** <br>
  *Audit man pages, info documents, and tldr for self-sufficient command discovery.*

+ **[1.8 Know your Hardware](1-host-environment/1.8-know-hardware.md)** <br>
  *Execute baseline hardware reconnaissance. Audit CPU architecture, memory allocation, and peripheral integrations to map the physical infrastructure.*

+ **[1.9 Multiple Shells at once](1-host-environment/1.9-tmux.md)** <br>
  *Engineer terminal multiplexing. Document sessions, windows, panes, and detachment protocols.*


### 2 Filesystem and Navigation

+ **[2.1 Filesystem](2-filesystem-and-navigation/2.1-filesystem.md)** <br>
  *Audit the Filesystem Hierarchy Standard. Define the purpose of /etc, /var, /proc, and /sys.*

+ **2.2-directories.md** <br>
  *Document absolute versus relative paths. Engineer rapid directory traversal using pushd, popd, and stack memory.*

+ **2.3-file-ops.md** <br>
  *Execute cp, mv, rm, touch, and mkdir operations.*

+ **2.4-file-viewing.md** <br>
  *Utilize cat, less, head, and tail. Map keybindings directly to text navigation protocols.*

+ **2.5-vim.md** <br>
  *Structure normal, insert, and visual modes. Document file saving and text manipulation to prepare for scripting.*


### 3-identity-and-access-governance

+ **3.1-ownership.md** <br>
  *Define user, group, and root concepts. Audit how Linux structures file security.*
  - `who` (Active login sessions), `last` (Historical login sessions)

+ **3.2-permissions.md** <br>
  *Calibrate read, write, and execute bits using chmod. Document numeric and symbolic assignments.*

+ **3.3-users-and-groups.md** <br>
  *Execute useradd, usermod, and group deployments.*

+ **3.4-superuser.md** <br>
  *Structure the use of sudo, su, and the visudo file for administrative execution.*


### 4-core-shell-mechanisms

+ **4.1-redirection.md** <br>
  *Audit stdin, stdout, and stderr. Document file descriptor routing with >, >>, and <.*

+ **4.2-pipelines.md** <br>
  *Engineer data flow between binaries using the pipe operator. Document logical AND/OR execution chaining.*

+ **4.3-substitution.md** <br>
  *Capture binary output into variables using $(). Document process substitution with <().*

+ **4.4-variables.md** <br>
  *Declare shell variables and map them to standard programming data structures. Capture interactive user data using the read command.*

+ **4.5-exit-codes.md** <br>
  *Evaluate $? states. Document single versus double bracket syntax for condition testing.*


### 5-scripting-and-logic-gates

+ **5.1-script-execution.md** <br>
  *Define the anatomy of an executable file. Document the purpose of #!/bin/bash.*

+ **5.2-if-statements.md** <br>
  *Engineer conditional logic based on file existence and variable states.*

+ **5.3-case-statements.md** <br>
  *Engineer complex pattern-matching logic. Build structured, interactive command-line menus for operators.*

+ **5.4-for-loops.md** <br>
  *Translate Pythonic iteration into Bash. Process lists, files, and glob patterns sequentially.*

+ **5.5-while-loops.md** <br>
  *Engineer line-by-line file processing and continuous execution loops.*

+ **5.6-directory-scripts.md** <br>
  *Draft practical automation. Write a script that fuses logic and loops to generate standardized project structures.*


### 6-text-processing-and-regex

+ **6.1-text-filters.md** <br>
  *Execute cut, tr, wc, sort, and uniq to mutate raw text streams.*

+ **6.2-regex.md** <br>
  *Define BRE and ERE syntax. Structure character classes, anchors, and quantifiers.*

+ **6.3-grep.md** <br>
  *Audit text streams dynamically. Isolate specific data patterns and execute recursive searches across project directories.*

+ **6.4-sed.md** <br>
  *Automate text replacement operations. Engineer in-place file edits, global string substitutions, and targeted line deletions.*

+ **6.5-awk.md** <br>
  *Audit column extraction and field separators. Execute mathematical operations on structured data.*

+ **6.6-text-audits.md** <br>
  *Combine all text tools to parse system logs and CSV data autonomously.*


### 7-processes-and-jobs

+ **7.1-process-monitoring.md** <br>
  *Audit active memory and CPU states using ps, top, and htop.*
  - `ls -l /proc/self`

+ **7.2-signals.md** <br>
  *Engineer process interruption. Document kill signals, backgrounding (bg), and foregrounding (fg).*

+ **7.3-subshells.md** <br>
  *Isolate script scope. Define the execution differences between parentheses and curly braces.*

+ **7.4-cron-jobs.md** <br>
  *Automate script execution via crontab syntax. Introduce basic systemd timers.*

+ **7.5-hardware-audit.md** <br>
  *Log system hardware states using lscpu and lsusb. Document time synchronization.*


### 8-storage-and-backups

+ **8.1-block-devices.md** <br>
  *Audit physical storage. Document lsblk, partitioning with fdisk, and formatting with mkfs.*

+ **8.2-raid.md** <br>
  *Engineer data redundancy. Deploy software RAID arrays using mdadm.*

+ **8.3-lvm.md** <br>
  *Structure dynamic storage. Document Physical Volumes, Volume Groups, and Logical Volumes.*

+ **8.4-zfs.md** <br>
  *Deploy ZFS pools and datasets. Document snapshot generation and rollback protocols.*

+ **8.5-archives.md** <br>
  *Execute tar, gzip, and bzip2 operations. Engineer automated rsync backups.*


### 9-software-and-builds

+ **9.1-repositories.md** <br>
  *Audit sources.list. Structure the integration of PPAs and custom package archives.*

+ **9.2-checksums.md** <br>
  *Validate binary integrity using sha256sum and GPG keys to mitigate supply chain risks.*

+ **9.3-makefiles.md** <br>
  *Engineer software builds from raw source. Document the configure, make, and install sequence.*


### 10-advanced-functions

+ **10.1-functions.md** <br>
  *Define reusable code blocks. Document the distinction between exit statuses and echoed returns.*

+ **10.2-scope.md** <br>
  *Protect global script state. Enforce strict variable scoping within functions.*

+ **10.3-getopts.md** <br>
  *Parse CLI flags robustly. Engineer scripts that accept complex user parameters.*

+ **10.4-heredocs.md** <br>
  *Generate multi-line files programmatically. Utilize advanced brace and parameter expansions.*

+ **10.5-arrays.md** <br>
  *Map complex variables. Document indexed and associative array syntax in Bash 4.0+.*

+ **10.6-one-liners.md** <br>
  *Fuse logic, pipelines, and iteration into highly compressed commands for rapid terminal execution.*


### 11-network-and-web

+ **11.1-diagnostics.md** <br>
  *Audit network latency and paths using ping, traceroute, ip, and mtr.*

+ **11.2-ports.md** <br>
  *Inspect active sockets and listening services using ss, netstat, and lsof.*

+ **11.3-curl.md** <br>
  *Engineer HTTP requests. Execute GET/POST methods and API interactions directly from the shell.*

+ **11.4-email.md** <br>
  *Structure baseline mail transfer agents. Execute CLI email dispatch.*


### 12-deployment-and-version-control

+ **12.1-git-version-control.md** <br>
  *Initialize repositories and track file states. Engineer commit governance to prepare scripts for competitive deployment.*

+ **12.2-docker.md** <br>
  *Isolate infrastructure. Deploy Docker engines, manage images, and spin up basic containers.*

+ **12.3-media.md** <br>
  *Engineer automated batch conversions of visual and audio data using ImageMagick and ffmpeg.*

+ **12.4-pdfs.md** <br>
  *Manipulate, merge, and split PDF documents programmatically via Ghostscript and pdftk.*

+ **12.5-clipboard.md** <br>
  *Route command outputs directly to the system clipboard using xclip and wl-clipboard.*

## References

- [IITM System Commands by Prof. Gandham Phanikumar](https://study.iitm.ac.in/ds/course_pages/BSSE2001.html)
- [Linux Pocket Guide by Daniel J. Barrett](https://linuxpocketguide.com/)
- [Efficient Linux at the Command Line](https://study.iitm.ac.in/ds/course_pages/BSSE2001.html)
