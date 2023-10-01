% Chapter 4 Solutions 

% Question 2:
%{
syms x;
p = x^3 - 2*x - 5;
S = double(solve(p, x));
R = roots(sym2poly(p));
F = fzerotx(@(x) x.^3 - 2*x - 5, [2,3]);

% Define the equation as an anonymous function
equation = @(x) x^3 - 2*x - 5;

% Choose a complex initial value
initial_guess = 1 + 1i;

% Set up options for fsolve
options = optimoptions('fsolve', 'Display', 'off', 'TolFun', 1e-12);

% Use fsolve to find the complex root
N = fsolve(equation, initial_guess, options);

% Display the complex root
disp(['Complex root found: x = ', num2str(root)]);
%}

% Question 3: 
%
% Init. Polynomial 
syms x;
p_s = 816*x^3 - 3835*x^2 + 6000*x - 3125;
p = matlabFunction(p_s);

%Exact Roots
R = roots(sym2poly(p_s));

% FzeroTX along [1,2]
F = fzerotx(p, [1,2]);
%