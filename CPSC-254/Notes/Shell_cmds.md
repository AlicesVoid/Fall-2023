# Important Shell Commands:

### Core Commands:
- `#!/bin/bash`  
    - Shebang line, specifies that the script should be executed with the Bash shell.
- `let <expression>`  
    - Used for arithmetic operations on variables or values.
- `echo <var>`  
    - Outputs a string or variables to the console.
- `grep <pattern> <file>`  
    - Searches for a specified pattern in a file or input stream and outputs matching lines.
- `name_of_function() { <FUNCTION_BODY> }`  
    - Defines a function.
- `name_of_function $arg1 $arg2 ... $argN`  
    - Calls the function with arguments.

### Logical Operators:
- `-o <option>`  
    - Logical OR; used to combine multiple conditions.
- `! <expr>`  
    - Logical NOT; negates the condition that follows.
- `-a <expr>`  
    - Logical AND; used to combine multiple conditions, though more commonly `&&` is used.
- `-o <expr>`  
    - Logical OR; used to combine multiple conditions, though more commonly `||` is used.
- `-eq <arg1> <arg2>`  
    - Checks if `arg1` is equal to `arg2`.
- `-ne <arg1> <arg2>`  
    - Checks if `arg1` is not equal to `arg2`.
- `-lt <arg1> <arg2>`  
    - Checks if `arg1` is less than `arg2`.
- `-le <arg1> <arg2>`  
    - Checks if `arg1` is less than or equal to `arg2`.
- `-gt <arg1> <arg2>`  
    - Checks if `arg1` is greater than `arg2`.
- `-ge <arg1> <arg2>`  
    - Checks if `arg1` is greater than or equal to `arg2`.
- `$?`  
    - Contains the exit status of the last command executed.

### Code Structures: 
- `test <condition> | [ <expression> ];`  
    - Evaluates a conditional expression, often used in if statements.
- `while <condition>; do <commands>; done`  
    - Loop that continues as long as the condition is true, executing the commands each iteration.
- `if <cond>; then <expr>; elif <cond>; then <expr>; else <expr>; fi`  
    - Conditional structure to execute commands if the condition is true.
- `case <variable> in <pattern1>) <commands1> ;; <pattern2>) <commands2> ;; *) <default_commands> ;; esac`  
    - Pattern matching structure, executes different commands based on the value of a variable.

### String Operators:
- `-z <string>`  
    - Checks if the string is empty (length is zero).
- `-n <string>`  
    - Checks if the string is not empty (length is greater than zero).
- `<string1> = <string2>`  
    - Checks if `string1` is equal to `string2`.
- `<string1> != <string2>`  
    - Checks if `string1` is not equal to `string2`.
- `<string1> < <string2>`  
    - Checks if `string1` sorts before `string2` lexicographically.
- `<string1> > <string2>`  
    - Checks if `string1` sorts after `string2` lexicographically.

### Streaming Data Methods:
- `$<n>`  
    - Refers to the nth argument passed to the script or function. `$1` is the first argument, and so on.
- `sed <expression> <file>`  
    - Stream editor for filtering and transforming text.
- `>> <file>`  
    - Appends standard output to a file, creating the file if it doesn't exist.
- `> <file>`  
    - Redirects standard output to a file, overwriting the file if it exists.
- `<< <delimiter>`  
    - Here document; redirects standard input from the lines following the command until the delimiter is reached.
- `< <file>`  
    - Redirects standard input to read from a file.

### File Operators:
- `-a <file>`  
    - Checks if the file exists, obsolete and replaced by `-e`.
- `-b <file>`  
    - Checks if the file is a block special file.
- `-c <file>`  
    - Checks if the file is a character special file.
- `-d <directory>`  
    - Checks if the directory exists.
- `-e <file>`  
    - Checks if the file exists.
- `-f <file>`  
    - Checks if the file is a regular file (not a directory or device file).
- `-g <file>`  
    - Checks if the set-group-id is set for the file.
- `-h <file>` | `-L <file>`  
    - Checks if the file is a symbolic link.
- `-k <file>`  
    - Checks if the sticky bit is set.
- `-p <file>`  
    - Checks if the file is a named pipe.
- `-r <file>`  
    - Checks if the file is readable.
- `-s <file>`  
    - Checks if the file size is greater than zero.
- `-S <file>`  
    - Checks if the file is a socket.
- `-t <file>`  
    - Checks if the file descriptor is open and refers to a terminal.
- `-u <file>`  
    - Checks if the set-user-id is set.
- `-w <file>`  
    - Checks if the file is writable.
- `-x <file>`  
    - Checks if the file is executable.
- `-O <file>`  
    - Checks if the file is owned by the current user.
- `-G <file>`  
    - Checks if the file is owned by the current group.
- `-N <file>`  
    - Checks if the file has been modified since it was last read.
- `-nt <file1> <file2>`  
    - Checks if `file1` is newer than `file2`.
- `-ot <file1> <file2>`  
    - Checks if `file1` is older than `file2`.
- `-ef <file1> <file2>`  
    - Checks if `file1` and `file2` refer to the same device and inode numbers, essentially if they are the same file.


