# Important Linux Commands: 

### Important Files
- `/home` 
    - home directories for user accounts
- `/etc` 
    - system-wide configuration files and shell scripts
- `var/log` 
    - system and application log files

### Config and User Info
- `passwd`  
    - contains user account information
- `shadow`  
    - contains encrypted user passwords
- `grub`  
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


