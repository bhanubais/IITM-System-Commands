### 4.1 Hardware Information

#### hwinfo - Hardware Information

- **Usage**: hwinfo provides detailed information about all hardware components.
- **Common Usage**: `hwinfo --short` for a concise overview.
- **Installation**: It might not be installed by default. You can install it using your distribution's package manager (e.g., `sudo apt install hwinfo` for Ubuntu).

#### lshw - List Hardware

- **Usage**: lshw lists detailed information about the hardware configuration of the machine.
- **Options**:
  - `-short`: Provides a brief list of hardware components.
  - `-class CLASS`: Shows information about a specific class of hardware, like network, memory, etc.
- **Note**: Run it as a superuser (`sudo lshw`) to get comprehensive information.

### 4.2 Disk Usage and Memory

#### df - Disk Filesystem Statistics

- **Usage**: df shows information about disk space usage on file systems.
- **Common Options**:
  - `-h`: Human-readable format with sizes in MB, GB, etc.
  - `-T`: Shows filesystem type.

#### free - Memory Usage

- **Usage**: free displays the amount of free and used memory in the system.
- **Options**:
  - `-m`: Displays the memory usage in megabytes.
  - `-g`: Displays it in gigabytes.
  - `-h`: Human-readable format with appropriate units.

### 4.3 System Diagnostics

#### Various Commands for System Diagnostics

- **top or htop**: These tools display real-time system statistics, including CPU and memory usage, process information, etc. htop is an enhanced version of top with a better user interface.
- **vmstat**: Reports virtual memory statistics.
- **iostat**: Provides CPU and input/output statistics for devices and partitions.
- **dmesg**: Examines or controls the kernel ring buffer; useful for troubleshooting hardware and driver issues.

### Practice Activities

1. **Hardware Exploration**: Use `hwinfo` and `lshw` to list and explore the hardware components of your system. Compare the output of both commands to see the level of detail each provides.
2. **Monitoring Disk and Memory**: Run df and free to check the disk usage and memory status of your system. Experiment with different options for output formatting.
3. **Real-time System Monitoring**: Use `top` or `htop` (if available) to monitor your system's real-time performance. Observe how system load changes when different applications are running.

These tools are essential for every Linux user, especially for system administrators and power users. They provide critical insights into the functioning and health of your Linux system.

Feel free to share any insights or ask questions about these commands or their output. Once you're comfortable with system information and diagnostics tools, we can move on to the next topic.
