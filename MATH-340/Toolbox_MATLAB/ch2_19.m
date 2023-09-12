% Method for Problem 19:
%
% Define the value of n
n = 100; 

%{ 
% -----------------------------------------Solution A:
% Define the main diagonal elements (2's)
main_diag = 2 * ones(n, 1);

% Define the subdiagonal elements (-1's)
sub_diag = -1 * ones(n - 1, 1);

% Create the coefficient matrix A using diag three times
A = diag(main_diag) + diag(sub_diag, -1) + diag(sub_diag, 1);

% Initialize the right-hand side vector b
b = [1; (2:n - 1)'; n];

% Perform LU decomposition on A
[L, U, P] = lutx(A);

% Solve the linear system A * x = b using bslashtx
x = bslashtx(A,b);
%}


% -----------------------------------------Solution B:
% Define the subdiagonal, main diagonal, and superdiagonal vectors
sub_diag = -1 * ones(n, 1); % Subdiagonal elements
main_diag = 2 * ones(n, 1);    % Main diagonal elements
super_diag = -1 * ones(n, 1); % Superdiagonal elements

% Initialize the right-hand side vector b
b = [1; (2:n - 1)'; n];


% Create the coefficient matrix A using spdiags
% Diagonals: [sub_diag, main_diag, super_diag]
% Offsets: [-1, 0, 1]
A = spdiags([sub_diag, main_diag, super_diag], [-1, 0, 1], n, n);

%{
% Solve the linear system A * x = b
x = A \ b;
%}

% -----------------------------------------Solution C:
% Solve the linear system Ax = b using tridisolve
%{
x = tridisolve(sub_diag, main_diag, super_diag, b);
%}

% -----------------------------------------Solution D:
% Use condest to estimate the condition of the coefficient matrix
condition_number = condest(A);

% Display the estimated condition number
fprintf('Estimated condition number of the coefficient matrix A: %.4e\n', condition_number);
