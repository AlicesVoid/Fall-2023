% Script for the Take-Home Portion of Midterm 1

% Question 1: Calculate A + tB from t = 0:0.1:1  
%{
% 1a) 
% Two Different Random Matrices 
A = rand(10);
B = rand(10);

% Make Them Symmetric 
A = A + A';
B = B + B';

% 1b)
% Vector t of 101 val.s between 0 and 1
t = 0:0.01:1;

% Array to hold Eigenvalues of A + tB 
ab_eigs = zeros(10, size(t, 2));

% Iterate through every t-value:
for i = 1:length(t)
    % our working value of t is t_val
    t_val = t(i);  

    % C = A + tB for a specific t_val
    C = A + t_val*B;

    % Finds Eigenvalues of C (10 of em)
    c_eig = eig(C);  

    % Stores a Specific c_eig in the Array of Eigenvalues
    ab_eigs(:, i) = c_eig; 
end

% 1c)
% Plot your results (x_axis = t, y_axis = ab_eigs)
figure; 
hold on; 

% One Line for Each Eigenvalue
for i = 1:size(ab_eigs, 1)
    plot(t, ab_eigs(i, :));
end

% Plot Formatting
hold off;
xlabel('t values [0, 1]');
ylabel('eigenvalues of A + tB');
title('Question 1.c. - Depicting an "Avoidance of Crossing"');
%}

% Question 2
%{
% 2a)
% "Populate" the Population Data (no pun intended)
Pop = zeros(2, 11);

% Establish the Census Information (given)
Census = [91.97, 105.71, 122.78, 131.67, 151.33, 179.32, 203.3, 225.54, 248.72, 281.42, 308.75];

% Row 1 is the Years, Row 2 is the Census Value
for i = 1:11
    Pop(1, i) = 1900 + 10*i;
    Pop(2, i) = Census(i);
end

% Establish x-values, y-values, and Domain for the plot
x = Pop(1, :);
y = Pop(2, :);
domain = min(x):0.01:max(x);

% Find the shape-preserving pchip of Pop
pop_pchip = pchip(x, y, domain);

% Find the spline of Pop
pop_spl = spline(x, y, domain);

% Set-up the Plot (census data marked in Magenta Circles)
figure; 
hold on; 
scatter(x, y, 'om', 'DisplayName', 'Census Points');
plot(domain, pop_pchip, '-r', 'DisplayName', 'Census PChip');
plot(domain, pop_spl, '-b', 'DisplayName', 'Census Spline');
hold off; 
title('Question 2.a. - The U.S. Census over Time');
xlabel('Date [1910, 2010]');
ylabel('U.S. Population (in Millions)');
legend('location','best');

% 2b) 
% Extend the Current Plot to the year 2020
new_domain = min(x):0.01:2020;

% Extend the Polynomial(s) to the year 2020
new_pop_pchip = pchip(x, y, new_domain);
new_pop_spl = spline(x, y, new_domain);

%{ 
Find "Doomsday" 
Doomsday implies the day the year the pop. starts shrinking 
%} 

% Find the Max Population achieved 
max_pop = max(new_pop_spl);

% Find the Year of the Max Population 
max_pop_index = find(new_pop_spl == max_pop);
doomed_year = new_domain(max_pop_index);
fprintf('Doomsday Occurs in Year: %.0f\n', doomed_year);

% Plot the Polynomial to the Year 2020
figure; 
hold on;
scatter(doomed_year, max_pop, 'ok', 'DisplayName', 'Doomsday Occurs');
plot(new_domain, new_pop_pchip, '-r', 'DisplayName', 'Census PChip');
plot(new_domain, new_pop_spl, '-b', 'DisplayName', 'Census Spline');
hold off;
title('Question 2.b. - Census Polynomial up to 2020');
xlim([1910, 2020]);
xlabel('Date [1910, 2010]');
ylabel('U.S. Population (in Millions)');
legend('location','best');

% 2d) 

% Find the Year 2005
index_2005 = find(domain == 2005);

% Find the Population Estimation in 2005 
pchip_est = pop_pchip(index_2005);
spline_est = pop_spl(index_2005);

% Print Your Results
fprintf('\nPChip Estimation (in Millions) of Population in 2005: %f\n', pchip_est);
fprintf('Spline Estimation (in Millions) of Population in 2005: %f\n', spline_est);
%}

% Question 3

% 3a) 
% Original Function f, and it's two derivatives (df and d2f)
syms x; 
f = 2 - exp(x);
df = diff(f, x);
d2f = diff(df, x);

% Halley's Iteration Formula
g = x - (2*f*df)/(2*(df)^2 - f*d2f);

% Matlab Function from Halley's Symbolic Representation
G = matlabFunction(g);

% Matlab Function for the Original Equation
F = matlabFunction(f);

% Boundaries for Halley's Method
h_guess = 1; 
tolerance = eps;
h_iter = 0;

% Halley's Method 
while(abs(F(h_guess)) > tolerance)
    h_guess = G(h_guess);  % Update the guess with G(h_guess)
    h_iter = h_iter + 1;
end


% 3b) 
% Newton's Iterative Formula (lowercase is Symbolic, uppercase is Matlab)
n = x - (f)/(df);
N = matlabFunction(n);

% Boundaries for Newton's Method (same initial guess of x = 1)
n_guess = 1; 
n_iter = 0;

% Newton's Method 
while(abs(F(n_guess)) > tolerance)
    n_guess = N(n_guess);  % Update the guess with N(n_guess)
    n_iter = n_iter + 1;
end

fprintf('\nNewtons Method Iterations: %d\n', n_iter);
fprintf('Halleys Method Iterations: %d\n\n\n', h_iter);

% 3c) 
% Matrix to Find the Order of Convergence
order_conv = [];
order_conv(1, 1) = 0;
order_conv(2, 1) = 1;
order_conv(3, 1) = F(1);

% Halley's Method  (With Deductions)
h_guess = 1;
h_iter = 0;

while(abs(F(h_guess)) > tolerance)
    h_guess = G(h_guess);  % Update the guess with G(h_guess)
    h_iter = h_iter + 1;
    order_conv(1, h_iter+1) = h_iter;
    order_conv(2, h_iter+1) = h_guess;
    order_conv(3, h_iter+1) = F(h_guess);
end

% Display the Order of Convergence
descriptions = {'Iterations:', 'Guesses:', 'Convergence:'};
for i = 1:size(order_conv, 1)
    fprintf('%s ', descriptions{i});
    fprintf('%d ', order_conv(i, :)); 
    fprintf('\n');
end

fprintf('\n\n\n\n');

% 3d) 
% symbolic representations of a - e^x = 0 
% most methods here are borrowed from 3a
syms x; 
syms a;
f = a - exp(x);
df = diff(f, x);
d2f = diff(df, x);
g = x - (2*f*df)/(2*(df)^2 - f*d2f);

% Simplify the Symbolic Expression for Halley's Iterative Formula
g_simp = simplify(g);

% Display the Result 
disp('Simplified Halleys Iterative for a - e^x = 0: ');
disp(char(g_simp));


