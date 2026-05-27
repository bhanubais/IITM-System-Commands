# Linux System Commands

Concise Linux command notes for two operators:

* IITM students who need exact syntax under exam pressure.
* Cloud engineers who need terminal recall during production work.

## Repository Contract

Use numbered domains for stable navigation.

Use the command index for fast lookup.

Keep every topic small enough to scan in under two minutes.

Ignored folders are outside the active syllabus:

* `zzz_backup/`
* `Example_Files/`

## Domain Index

* [00. Command Index](00-command-index.md)
* [01. Core Essentials](01-core-essentials/README.md)
* [02. File Management](02-file-management/README.md)
* [03. Package Management](03-package-management/README.md)
* [04. Text Editors](04-text-editors/README.md)
* [05. Text Processing](05-text-processing/README.md)
* [06. Shell Environment](06-shell-environment/README.md)
* [07. Shell Scripting](07-shell-scripting/README.md)
* [08. Networking and Web](08-networking-and-web/README.md)
* [09. Version Control Git](09-version-control-git/README.md)

## Exam Retrieval Map

* Syntax recall: `man`, `type`, `which`, `whereis`, `grep`, `sed`, `awk`, `chmod`, `tar`.
* State inspection: `uname`, `hostnamectl`, `lscpu`, `free`, `df`, `ps`, `jobs`.
* Shell behavior: quoting, variables, redirection, exit status, loops, functions.
* File governance: permissions, ownership, hard links, symbolic links, search.

## Production Triage Map

* Broken host: start in `01-core-essentials`.
* Permission failure: start in `02-file-management`.
* Package drift: start in `03-package-management`.
* Remote emergency edit: start in `04-text-editors`.
* Log extraction: start in `05-text-processing`.
* Shell session fault: start in `06-shell-environment`.
* Script failure: start in `07-shell-scripting`.
* Connectivity failure: start in `08-networking-and-web`.
* Bad commit or branch state: start in `09-version-control-git`.

