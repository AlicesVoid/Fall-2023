# Introduction to Matlab 

## Concepts 
**Script Language**
- Doesn't Require Compiling 
- Just kinda- run it!

## QOL
- `save a_result A`
    - Saves the content of variable A to a file named "a_result" for future use.
- `load a_result`
    - Loads the data from the file "a_result" into the workspace, making it available for use.
- `F5`
    - runs the currently selected or active script or code. (WINDOWS)
- `F9`
    - used to execute the currently selected or highlighted code section or line. (WINDOWS)

## Graphing
- `x = linspace(-1, 1, 50)`
    - Creates an array x with 50 evenly spaced values ranging from -1 to 1.
- `y = sin(x); plot(x, y);`
    - Computes the sine values of each element in x, then plots it (x -> x-axis, y -> y-axis).
- `plot(); hold on | hold off`
    - Keeps (Removes) this graph whenever the next graph is made
- `legend('sine', n)`
    - Creates a legend for line "sine" in position n
    - NOTE: 
        - (n -> northeast, northwest, southwest, southeast)
        - (n == 0 -> puts it in the best place)
- `title('My Matlab Plot')`
    - Creates a graph title
- `xlabel('') | ylabel('')`
    - Labels the x (or y) axis
- `xlim([a, b]) | ylim([a, b])`
    - Sets the x-axis (y-axis) limits of the current plot to range from a (left) to b (right).
- `subplot(a, b, n)`
    - Sets up the next plot (a rows, b column(s) of plots, next graph in location n)


## Matrices 
- `A = [a_11 a12; a21 a22]`
    - Creates a 2x2 Matrix named A.
- `A(r, c)`
    - Accesses the element in row r and column c of matrix A.
- `A_transpose = A'`
    - Creates the transpose of matrix A, denoted as A_transpose.
- `length(A)`
    - Returns the length of the largest dimension of matrix A.
- `size(A) | size(A, 1) | size(A, 2)`
    - Returns the dimensions (number of rows and columns) of matrix A.
- `A .* A | .^ | ./`
    - multiplies (powers, divides) matrix A by itself BY COMPONENT 
    - `A * A` would do Standard Matrix Multiplication 

## Functions 
- `function y = myfunc(x)`
    - Defines a MATLAB function named "myfunc" that takes an input argument x and returns an output y.
    - Everything Below This Statement is Function Body
        - (i.e: x = [2 4 6]; y = x .* x) -> takes in x, outputs y = [4, 16, 36]

## Plot Styling "plot(x,y,'style')"
- `-.`
    - Dotted line style in a plot.
- `-`
    - Solid line style in a plot.
- `--`
    - Dashed line style in a plot.
- `o`
    - Circle markers in a plot.
- `s`
    - Square markers in a plot.
- `d`
    - Diamond markers in a plot.
- `^`
    - Upward-pointing triangle markers in a plot.
- `<`
    - Left-pointing triangle markers in a plot.
- `>`
    - Right-pointing triangle markers in a plot.
- `p`
    - Pentagram markers in a plot.
- `h`
    - Hexagram markers in a plot.
- `rs`
    - Red square markers in a plot.
- `-rp`
    - Red Stars with Line Going Through Them