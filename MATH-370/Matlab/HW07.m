% MATH 370 HW07

% Question 1.c
%{
% Recurring Function:
a = @(x) (2*x)*(x + 3);
% Initial Guess:
val = 4;
seq = zeros(1, 5);
for i = 1:5 
    % Write out the Recurrence Function
    seq(1, i) = val;
    fprintf('a_%i: %i\n',(i-1), val);
    val = a(val);
end
%}

% Question 4.c
%{
% Difference Formula
dp = @(x) 0.001*(500-x);
p = @(x) x + dp(x);
% Initial Guess
val = 10;
seq = zeros(1, 5);
% Write-Out Sequence:
for i = 1:5 
    % Write out the Recurrence Function
    seq(1, i) = val;
    fprintf('p_%i: %i\n',(i-1), val);
    val = p(val);
end
%}

% Question 10
% Initialize variables
an = 50000;  
n = 0;       
target = 1000;  

% While loop to find n
while an >= target
    n = n + 1;
    an = an + 0.01 * an - 1000;
end

% Display the result
fprintf('\n\nThe annuity will run out of money after n = %d, when a_n = %d\n\n', n, an);
