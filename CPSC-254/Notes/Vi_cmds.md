# Important Vi Commands: 

## Getting Started:
- `vi <filename>`  
    - Opens the specified file (or creates a new one if it doesn't exist) in the Vi text editor.
- `vi -r <filename>`  
    - Recovers a file that was being edited when the system crashed. Useful for retrieving unsaved changes.

## Getting In and Out of Vi:
- `:`  
    - Enters command mode in Vi, allowing you to input various commands.
- `:x`  
    - Saves changes made to the document and exits Vi.
- `:wq`  
    - Similar to `:x`, it writes (saves) the changes and then quits Vi.
- `:q`  
    - Quits Vi. If there are unsaved changes, it will warn you.
- `:q!`  
    - Quits Vi without saving any changes, effectively discarding any modifications made during the current session.

## Cursor Movement Methods:
- `j | ctrl + j`  
    - Moves the cursor down one line.
- `k | ctrl + k`  
    - Moves the cursor up one line.
- `h | ctrl + h`  
    - Moves the cursor one character to the left.
- `l | ctrl + l`  
    - Moves the cursor one character to the right.
- `0 | ctrl + 0`  
    - Moves the cursor to the beginning of the line.
- `$ | ctrl + $`  
    - Moves the cursor to the end of the line.
- `w | ctrl + w`  
    - Moves the cursor forward one word.
- `b | ctrl + b`  
    - Moves the cursor backward one word.
- `:0` or `:1`  
    - Moves to the beginning of the file.
- `:n`  
    - Goes to the next file when multiple files are open.
- `:$`  
    - Moves to the end of the file.

