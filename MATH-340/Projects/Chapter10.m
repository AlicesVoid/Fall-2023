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
