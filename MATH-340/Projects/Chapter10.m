% Chapter 10 Homework 

% Problem 8:
%{
F = gallery('frank',12);
P = pascal(12);
F_e = sort(eig(F));
F_cn = condeig(F);
P_e = sort(eig(P));
P_cn = condeig(P);
(F_e(1:6).*F_e(12:-1:7))-ones(6,1);
(P_e(1:6).*P_e(12:-1:7))-ones(6,1);
%}

% Problem 4:
%{
% Define the matrix size
n = 101;

% Create the tridiagonal matrix A
d = ones(n-1, 1);
A = diag(d, 1) + diag(d, -1);

% Compute the eigenvalues of A
e = eig(A);

% Create a plot
x = -(n-1)/2 : (n-1)/2;
plot(x, e, '.');

% Label the axes
xlabel('Eigenvalue Index');
ylabel('Eigenvalue');

% Title and grid
title('Eigenvalues of Tridiagonal Matrix A');
grid on;
%}

% Problem 5:
%{
% Define the matrix size
n = 5;

% Create a range of values for t
t_values = linspace(0, 1, 100);

% Initialize an array to store eigenvalues
eigenvalues = zeros(n, numel(t_values));

% Loop through t values and compute eigenvalues for each
for i = 1:numel(t_values)
    t = t_values(i);
    
    % Generate the matrix A for the current t
    A = zeros(n);
    for j = 1:n
        for k = 1:n
            if j ~= k
                A(j, k) = 1 / (j - k + t);
            end
        end
    end
    
    % Compute eigenvalues and store them
    eigenvalues(:, i) = eig(A);
end

% Plot the trajectories in the complex plane
plot(real(eigenvalues), imag(eigenvalues));
xlabel('Real Part');
ylabel('Imaginary Part');
title('Eigenvalue Trajectories of Matrix A');
grid on;
%}

% Problem 9:
%{
A = magic(3);
B = svd(A)
C = sqrt(eig(A'*A))
Z = zeros(size(A)); s = eig([Z A; A' Z]); s = s(s>0)
%}

% Problem 11:
%{
% Generate the matrix A
n = 12;
A = diag(ones(n-1, 1), -1) + diag(1, n-1);

% Observe behavior using eigsvdgui with different modes
eigsvdgui(A, 'eig');   % Eigenvalues only
eigsvdgui(A, 'symm');  % Symmetric eigenvectors
eigsvdgui(A, 'svd');   % Singular value decomposition
%}


