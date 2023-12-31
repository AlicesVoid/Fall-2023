function [x,B] = bslashtx(A,b)
% BSLASHTX  Solve linear system (backslash)
% x = bslashtx(A,b) solves A*x = b

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

[n,n] = size(A);
if isequal(triu(A,1),zeros(n,n))
   % Lower triangular
   x = forward(A,b);
   return
elseif isequal(tril(A,-1),zeros(n,n))
   % Upper triangular
   x = backsubs(A,b);
   return
elseif isequal(A,A')
   [R,fail] = chol(A);
   if ~fail
      % Positive definite
      y = forward(R',b);
      x = backsubs(R,y);
      return
   end
end

% Triangular factorization
[L,U,p] = lutx(A);

% Permutation and forward elimination
y = forward(L,b(p));

% Back substitution
x = backsubs(U,y);

B = myinv(A);


% ------------------------------

function x = forward(L,x)
% FORWARD. Forward elimination.
% For lower triangular L, x = forward(L,b) solves L*x = b.
[n,n] = size(L);
x(1) = x(1)/L(1,1);
for k = 2:n
   j = 1:k-1;
   x(k) = (x(k) - L(k,j)*x(j))/L(k,k);
end


% ------------------------------

function x = backsubs(U,x)
% BACKSUBS.  Back substitution.
% For upper triangular U, x = backsubs(U,b) solves U*x = b.
[n,n] = size(U);
x(n) = x(n)/U(n,n);
for k = n-1:-1:1
   j = k+1:n;
   x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
end

%-----------------------------
function A_inv = myinv(A)
% MYINV Compute the inverse of a matrix A using bslashtx.

% Perform LU decomposition with pivoting
[L, U, p] = lutx(A);

% Identity matrix of the same size as A
[n, ~] = size(A);
I = eye(n);

% Initialize the inverse matrix
A_inv = zeros(n);

% Solve for each column of the identity matrix
for k = 1:n
    e_k = I(:, k);  % Extract the k-th column of the identity matrix
    x_k = bslashtx(L, e_k(p));  % Solve for x_k using bslashtx
    y_k = backsubs(U, x_k);  % Solve for y_k using back substitution
    A_inv(:, k) = y_k;  % Set the k-th column of the inverse matrix
end

