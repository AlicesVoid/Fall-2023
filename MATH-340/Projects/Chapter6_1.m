% Homework 6 Part 1: 

% Question 1: 

% Question 2:

% Question 3:

% Question 4: 
%
f = @(x) 2 ./ (1+x.^2);
qtx_vals = zeros(1,16);
qtx_steps = zeros(1,16);
qtx_diff = zeros(1,16);
fprintf('\n\n');
fprintf('Actual Pi Value: %.17f\n', pi);
fprintf('------------------------------\n');
%figure(1); hold on; 
for i=1:1:20
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

% Question 6: 