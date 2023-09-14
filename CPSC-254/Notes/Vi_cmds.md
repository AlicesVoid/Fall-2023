# Important Vi Commands: 

## Getting Started:
- `vi <filename>`  
    - Opens the specified file (or creates a new one if it doesn't exist) in the Vi text editor.
- `vi -r <filename>`  
    - Recovers a file that was being edited when the system crashed. Useful for retrieving unsaved changes.

## Getting In and Out of Vi:
- `:`  
    - Enters command mode in Vi, allowing you to input various commands.
- `:x | :wq`  
    - Saves changes made to the document and exits Vi.
- `:q`  
    - Quits Vi. If there are unsaved changes, it will warn you.
- `:q!`  
    - Quits Vi without saving any changes, effectively discarding any modifications made during the current session.

## Cursor Movement Methods:
- `j | ^j {insert mode}`  
    - Moves the cursor down one line.
- `k | ^k {insert mode}`  
    - Moves the cursor up one line.
- `h | backspace {insert mode}`  
    - Moves the cursor one character to the left.
- `l | space  {insert mode}`  
    - Moves the cursor one character to the right.
- `0`  
    - Moves the cursor to the beginning of the line.
- `$`  
    - Moves the cursor to the end of the line.
- `w`  
    - Moves the cursor forward one word.
- `b`  
    - Moves the cursor backward one word.
- `^w {insert mode}`
    - Deletes the word
- `^i {insert mode}`  
    - Indents the cursor
- `:0` or `:1`  
    - Moves to the beginning of the file.
- `:n`  
    - Goes to the next file when multiple files are open.
- `:$`  
    - Moves to the end of the file.

## File Nav. Methods:
- `^f`  
    - Scroll forward one screen.
- `b | ^b`  
    - Scroll backward one screen.
- `^d`  
    - Scroll down (forward) half a screen.
- `^u`  
    - Scroll up (backward) half a screen.
- `^l`  
    - Redraws the screen (useful if display becomes garbled).
- `^r`  
    - Redraws the screen, but also discards any input not yet processed.

## File Writing Methods:
- `u | ^u`  
    - undo the last change
- `i`  
    - enter insert mode before the current cursor position
- `I`  
    - enter insert mode at the beginning of the current line
- `a`  
    - enter insert mode after the current cursor position
- `A`  
    - enter insert mode at the end of the current line
- `o`  
    - open (insert) a new line below the current line and enter insert mode
- `O`  
    - open (insert) a new line above the current line and enter insert mode

## Change Text Methods:
- `r`  
    - replace the character under the cursor with the next character you type
- `R`  
    - enter replace mode, allowing you to replace characters from the current cursor position onward
- `cw`  
    - change (replace) the text from the cursor to the end of the word
- `cNw`  
    - change (replace) the text of the next N words, starting from the cursor
- `C`  
    - change (replace) text from the cursor position to the end of the line
- `cc`  
    - change (replace) the entire current line
- `Ncc | cNc`
    - change (replace) the next N lines, starting from the current line

## Deleting Text Methods:
- `x`  
    - delete the character under the cursor
- `Nx`  
    - delete the next N characters from the cursor position
- `dw`  
    - delete the text from the cursor to the end of the word
- `dNw`  
    - delete the text of the next N words, starting from the cursor
- `D`  
    - delete text from the cursor position to the end of the line
- `dd`  
    - delete the entire current line
- `Ndd`  
    - delete the next N lines, starting from the current line

## Copy-Paste Methods:
- `d | cut`
    - delete  the specified content, but also stores it in a buffer so you can paste it 
- `yy` | `yank`  
    - copy (yank) the current line
- `Nyy | yNy`  
    - copy (yank) the next N lines, starting from the current line
- `p` | `put` | `paste`  
    - insert (paste) the last yanked or deleted text after the cursor position

## File Search Methods:
- `/<word>`
    - search forward for occurrence of `<word>`
- `?<word>`
    - search backward for occurrence of `<word>`
- `n`
    - repeat the last search in the same direction
- `N`
    - repeat the last search in the opposite direction
- `:.=`
    - display the current line number
- `:=`
    - display the total number of lines in the file
- `^g`
    - display the current line number, total number of lines, and filename

## File Saving/Splitting Methods:
- `:r <filename>`
    - read and insert the contents of `<filename>` below the current line
- `:w`
    - write (save) the current file
- `:w <filename>`
    - write (save) the current buffer content to `<filename>`
- `:##,##w <filename>`
    - write (save) the specified range of lines (##,##) to `<filename>`
- `:w! <filename>`
    - forcefully write (save) the current buffer content to `<filename>`, even if the file exists

