# Notes: Week 1.1

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

