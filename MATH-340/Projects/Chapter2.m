% Amelia Rotondo, 887925113

%{ Method for Problem 1:
%  using Ax = b and solving}
A = [3, 12, 1; 12, 0, 2; 0, 2, 3];
b = [2.36; 5.26; 2.77];
x = A \ b;

% Output and Check Result
disp(['Cost of a single apple: $', num2str(x(1))]);
disp(['Cost of a single banana: $', num2str(x(2))]);
disp(['Cost of a single cantaloupe: $', num2str(x(3))]);

