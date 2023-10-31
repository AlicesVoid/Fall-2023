% Homework 6 Part 1: 

% Question 1: 
%{
f = @(t)t^(25)*(1-t)^(2);
ab = [0 1];
err = 8;
tol = 10^(-err);
a = ab(1);b = ab(2);
quadgui(f, a, b, tol);
%}

% Question 2: 
%

%

% Question 3: 
%
f = @(x) 2 ./ (1+x.^2);
trap_vals = zeros(1,16);
trap_steps = zeros(1,16);
trap_diff = zeros(1,16);
%qtx_diff = [];
fprintf('\n\n');
fprintf('Actual Pi Value: %.17f\n', pi);
fprintf('------------------------------\n');
%figure(1); hold on; 
for i=1:3:15
    tol = 10^(-i);
    [trap_vals(i), trap_steps(i)] = trapezoidal_rule(f, -1, 1, tol);
    trap_diff(i) = (pi - trap_vals(i));
    fprintf('Trapezoidal Rule with Tolerance %e:\n', tol);
    fprintf('------ Number of Steps   : %d\n', trap_steps(i));
    fprintf('------ Pi Approximation  : %.17f\n', trap_vals(i));
    fprintf('------ Difference From Pi: %.17f\n\n', trap_diff(i));
end
%

% Question 4: 
%{
f = @(x) 2 ./ (1+x.^2);
qtx_vals = zeros(1,16);
qtx_steps = zeros(1,16);
qtx_diff = zeros(1,16);
%qtx_diff = [];
fprintf('\n\n');
fprintf('Actual Pi Value: %.17f\n', pi);
fprintf('------------------------------\n');
%figure(1); hold on; 
for i=1:1:15
    tol = 10^(-i);
    [qtx_vals(i), qtx_steps(i)] = quadtx(f, -1, 1, tol);
    qtx_diff(i) = (pi - qtx_vals(i));
    fprintf('QuadTX with Tolerance %e:\n', tol);
    fprintf('------ Number of Steps   : %d\n', qtx_steps(i));
    fprintf('------ Pi Approximation  : %.17f\n', qtx_vals(i));
    fprintf('------ Difference From Pi: %.17f\n\n', qtx_diff(i));
    %plot(i, qtx_steps(i), 'o');
    %plot(i, qtx_vals(i), 'o');
    %plot(i, qtx_diff(i), 'o');
end
%figure(1); hold on;
%plot(10.^(-1:-1:-15), qtx_diff, 'o');
%}

% Question 6
