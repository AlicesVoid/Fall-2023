# Important Linux Commands: 

### Important Files
- `/home` 
    - home directories for user accounts
- `/etc` 
    - system-wide configuration files and shell scripts
- `var/log` 
    - system and application log files

### Config and User Info
- `/etc/passwd`  
    - contains user account information
- `/etc/shadow`  
    - contains encrypted user passwords
- `/etc/grub`  
    - Grand Unified Bootloader configuration and files


### Command Line Nav
- `cd <pathname>`
    - changes directory
- `pwd`
    - prints the current working directory
- `.`
    - represents the current directory
- `..`
    - represents the parent directory
- `ls`
    - lists contents of a directory
- `ls -l`
    - lists contents in long format, displaying additional details
- `ls -a`
    - lists all contents, including hidden files and directories

### Command Line File Methods
- `vi <filename>`
    - a text editor used for editing files in the terminal
- `nano <filename>`
    - a user-friendly text editor in the terminal
- `mkdir <directory_name>`
    - creates a new directory
- `rmdir <directory_name>`
    - removes an empty directory
- `touch <filename>`
    - creates an empty file or updates the timestamp of an existing file
- `cp <source> <destination>`
    - copies files or directories
- `rm <filename>`
    - deletes a file or directory (with appropriate flags)
- `cat <filename>`
    - displays the content of a file
- `less <filename>`
    - views the content of a file with scrolling capability
- `chmod <permissions> <filename>`
    - changes file permissions
- `chown <owner:group> <filename>`
    - changes file owner and group
- `cmp <file1> <file2>`
    - compares two files byte by byte

### Etc-Important Commands 
- `chkconfig`
    - tool for managing SysV init scripts and services
- `crontab`
    - schedules tasks to run at specific times
- `ftp <hostname>`
    - transfers files using the File Transfer Protocol
- `gzip <filename>`
    - compresses files
- `ifconfig`
    - configures or displays network interface parameters
- `kill <process_id>`
    - sends a signal to a process, usually to terminate
- `nslookup <domain_name>`
    - queries DNS servers to find IP addresses for domain names
- `su <username>`
    - switch user, commonly used to get root access
- `who`
    - displays who is logged on
- `whoami`
    - displays the username of the current user

### Shell-Environment Variables and Commands
- `env`
    - Display, set, or remove environment variables; often used to run a command in a modified environment

**Some Key ENV Variables:**
- `BASHOPTS`
    - Displays the enabled shell options separated by colons
- `BASH_VERSION`
    - The version of the current instance of Bash
- `BASH_VERSINFO`
    - An array that holds the version number of the current instance of Bash
- `COLUMNS`
    - Width of the terminal in columns
- `DIRSTACK`
    - An array containing the current contents of the directory stack
- `HISTFILESIZE`
    - The maximum number of lines that the history file can contain
- `HISTSIZE`
    - The number of commands to remember in the command history
- `HOSTNAME`
    - The name of the current host
- `IFS`
    - Internal Field Separator; it's used by the shell to determine how to do word splitting and to split lines
- `PS1`
    - Primary prompt string, it determines how your shell prompt looks
- `SHELLOPTS`
    - A colon-separated list of enabled shell options
- `UID`
    - The numeric user identifier of the current user
