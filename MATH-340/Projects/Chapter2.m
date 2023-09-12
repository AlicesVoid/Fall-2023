% Amelia Rotondo, 887925113

%{ Method for Problem 1:
%  using Ax = b and solving}
%{
A = [3, 12, 1; 12, 0, 2; 0, 2, 3];
b = [2.36; 5.26; 2.77];
x = A \ b;

% Output and Check Result
disp('Problem 1:');
disp(['Cost of a single apple: $', num2str(x(1))]);
disp(['Cost of a single banana: $', num2str(x(2))]);
disp(['Cost of a single cantaloupe: $', num2str(x(3))]);
disp(' ');
%}

% Method for Problem 5:
%{
n = 3;
M = magic(n);
H = hilb(n);
P = pascal(n);
I = eye(n,n);
R = randn(n,n);
S = randn(n,n); A = S' * S;
T = randn(n,n); B = T' + T;
U = randn(n,n); C = eye(n,n); D = U' + U + n*C;

isPosDef(M);
isPosDef(H);
isPosDef(P);
isPosDef(I);
isPosDef(R);
isPosDef(A);
isPosDef(B);
isPosDef(D);

function isPosDef(M) 
    try
        chol(M);
        disp('Matrix is positive definite.');
    catch
        disp('Matrix is not positive definite.');
    end
end
%}

% Method for Problem 6:
x = 3;
I = eye(x,x);
O = ones(x);
S = 2*I-O;
T = triu(S);
A = T';
n = 1
k = 1

% while loop for 2.6.b
%{
while k < 1/eps
    k = n * 2^(n-1);
    fprintf('n = %d, k = %d\n', n, k);
    
    % Update n for the next iteration
    n = n + 1;
end
%}

% testing for 2.6.c
x = [0.001; 0.01; 0.1;];
b = A*x;
disp(b);

