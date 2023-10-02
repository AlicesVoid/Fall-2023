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
%{
% Init. Polynomial 
syms x;
p_s = 816*x^3 - 3835*x^2 + 6000*x - 3125;
p = matlabFunction(p_s);

%Exact Roots
R = roots(sym2poly(p_s));

% FzeroTX along [1,2]
F = fzerotx(p, [1,2]);
%}

% Question 9:
%{
%  Original Inequality 
f = @(x) x - tan(x);

% Solutions and Guesses 
sol = 0:1:9;
guess = ones(1,10) + 0:pi:10*pi;

% Iterate through the guesses
for i = 1:10
    % Check if sol(i) is already a solution to f
    if abs(f(sol(i))) < 1e-6
        % sol(i) is already a solution, no change needed
        continue;
    end
    % approx a negative guess
    q = 0.18*pi;
    % Use fzerotx to find a solution within [guess(i), guess(i+1)]
    sol(i) = fzerotx(f, [guess(i), guess(i)+q]);
end

% Display the results
disp(sol);
%}

% Question 10:
%{
% Bessel Functions
syms x;
j = besselj(0, x);
y = bessely(0, x);
b = j - y;

% Solutions and Guesses
s_j = 0:1:9;
s_y = 0:1:9;
s_b = 0:1:9;
g_j = 0:pi:11*pi;
g_y = 0:pi:11*pi;
g_b = 0:pi:11*pi;

% Iterate To Find Zeroes of J_0, Y_0, and Intersecting Points
for i = 1:10
    % Use fzerotx to find a solution within [guess(i), guess(i+1)]
    s_j(i) = fzerotx(matlabFunction(j), [g_j(i), g_j(i+1)]);
    s_y(i) = fzerotx(matlabFunction(y), [g_y(i), g_y(i+1)]);
    s_b(i) = fzerotx(matlabFunction(b), [g_b(i), g_b(i+1)]);
end

% Plot Your Results
figure;
hold on;

% Plot J0(x) in red
fplot(matlabFunction(j), [0, 10*pi], 'r', 'DisplayName', 'J0(x)');

% Plot Y0(x) in blue
fplot(matlabFunction(y), [0, 10*pi], 'b', 'DisplayName', 'Y0(x)');

% Plot the first ten zeros of J0(x) in red
plot(s_j, zeros(1, 10), 'ro', 'DisplayName', 'Zeros of J0(x)');

% Plot the first ten zeros of Y0(x) in blue
plot(s_y, zeros(1, 10), 'bo', 'DisplayName', 'Zeros of Y0(x)');

% Plot the intersection points in magenta
intersection_values = besselj(0, s_b);
plot(s_b, intersection_values, 'mo', 'DisplayName', 'Intersection Points');


hold off;

xlabel('x');
ylabel('Function Values');
title('Bessel Functions and Their Zeroes');
legend;
%}

