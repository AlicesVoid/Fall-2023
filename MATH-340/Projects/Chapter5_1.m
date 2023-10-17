% Chapter 5, Part 1 Homework:

% == Problem 7: =====================================================

% INITIAL CODE 
%{
k = 1:11;
t = (k-1)/10;
y = erf(t);
%}

% PART 7.a: (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% For plotting purposes, generate a dense set of t values
t_dense = linspace(0, 1, 1000);

% Initialize matrix to store maximum errors
max_errors = zeros(1, 10);

% Plot original data
figure;
plot(t, y, 'o', 'DisplayName', 'Original Data');
hold on;

% Fit the data with polynomials of degrees 1 through 10
for n = 1:10
    p = polyfit(t, y, n);
    
    % Evaluate the polynomial at the dense t values
    y_fit_dense = polyval(p, t_dense);
    
    % Plot the fitted polynomial
    plot(t_dense, y_fit_dense, 'DisplayName', sprintf('Degree %d', n));
    
    % Evaluate the polynomial at the original t values
    y_fit = polyval(p, t);
    
    % Compute the error between the fitted polynomial and original data
    errors = abs(y_fit - y);
    
    % Store the maximum error
    max_errors(n) = max(errors);
end

% Display info for the Plot
title('Comparing t to fitted polynomials:')

% Display the legend
legend('Location', 'best');

% Display max errors for each degree
disp('Maximum errors for each polynomial degree:');
disp(max_errors);
%}

% Part 7.b: (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% For plotting purposes, generate a dense set of t values
t_dense = linspace(0, 1, 1000);

% Plot original data
figure;
plot(t, y, 'o', 'DisplayName', 'Original Data');
hold on;

% Initialize matrix to store maximum errors
max_errors_odd = zeros(1, 10);

% Fit data with linear combinations of odd powers of t
for n = 1:10
    % Create the Vandermonde-like matrix for odd powers
    A = zeros(length(t), n);
    for j = 1:n
        A(:, j) = (-1)^j * t.^(2*j - 1); % Invert sign for odd powers
    end
    
    % Solve for coefficients c using least squares
    c = A\y';
    
    % Evaluate polynomial at dense t values
    y_fit_dense = zeros(size(t_dense));
    for j = 1:n
        y_fit_dense = y_fit_dense + c(j) * (-1)^j * t_dense.^(2*j - 1);
    end
    
    % Plot the fitted polynomial
    plot(t_dense, y_fit_dense, 'DisplayName', sprintf('n = %d', n));
    
    % Compute the error
    y_fit = A * c;
    errors = abs(y - y_fit');
    
    % Store the maximum error
    max_errors_odd(n) = max(errors);
end

% Display info for the Plot
title('Comparing t to odd-fitted polynomials:')

% Display the legend
legend('Location', 'best');

% Display max errors for each n
disp('Maximum errors for each n:');
disp(max_errors_odd);
%}

% Part 7.c: DEPENDENT ON 7.b (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% Create the Vandermonde-like matrix for the new model
A_new = zeros(length(t), 5);

z = 1 ./ (1 + t);

% Construct the matrix based on the model
A_new(:, 1) = ones(size(t));
A_new(:, 2) = exp(-t.^2);
A_new(:, 3) = exp(-t.^2) .* z;
A_new(:, 4) = exp(-t.^2) .* z.^2;
A_new(:, 5) = exp(-t.^2) .* z.^3;

% Solve for coefficients c using least squares
c_new = A_new \ y';

% Evaluate model at dense t values
z_dense = 1 ./ (1 + t_dense);
y_new_fit_dense = c_new(1) + exp(-t_dense.^2) .* (c_new(2) + c_new(3) * z_dense + c_new(4) * z_dense.^2 + c_new(5) * z_dense.^3);

% Compute the error for new model
y_new_fit = A_new * c_new;
errors_new = abs(y - y_new_fit');

% Compute max error
max_error_new = max(errors_new);

% Plotting the original data, polynomial fits, and new model fit
%figure;
plot(t_dense, y_new_fit_dense, '-k', 'LineWidth', 2, 'DisplayName', 'New Model');

% ... [insert the polynomial fitting code here] ...
legend('Location', 'best');

% Display the maximum error for the new model
disp('Maximum error for the new model:');
disp(max_error_new);
%}

% == Problem 8: =====================================================

% INITIAL CODE:
%{
t = 1:25;
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948
6.1261 12.5140 10.0502 9.1614 7.5677   % val7 used to be 12.5140
7.2920 10.0357 11.0708 13.4045 12.8415
11.9666 11.0765 11.7774 14.5701 17.0440
17.0398 15.9069 15.4850 15.5112 17.6572];
y = y'; 
y = y(:);
%}

% Part 8.a: (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% Creating the design matrix A
A = [ones(size(t')) t'];

% Solve for beta using least squares
beta = A \ y;

% Calculate the fitted values
y_fit = A * beta;

% Compute residuals
residuals = y - y_fit;

% Create the main figure
figure;

% Subplot 1: Original Data and Linear Fit
subplot(2, 1, 1);
plot(t, y, 'bo', 'DisplayName', 'Original Data'); % Original data as blue circles
hold on;
plot(t, y_fit, 'r-', 'DisplayName', 'Linear Fit'); % Linear fit as a red line
xlabel('t');
ylabel('y');
title('Original Data and Linear Fit');
legend;
grid on;

% Subplot 2: Residuals
subplot(2, 1, 2);
stem(t, residuals, 'm', 'filled');
xlabel('t');
ylabel('Residuals');
title('Residuals vs. t');
grid on;

% Identify potential outliers
[~, outlierIndex] = max(abs(residuals));
fprintf('Potential outlier at t = %d with residual = %f\n', t(outlierIndex), residuals(outlierIndex));
%}

% Part 8.b: (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% Creating the design matrix A
A = [ones(size(t')) t'];

% Solve for beta using least squares
beta = A \ y;

% Calculate the fitted values
y_fit = A * beta;

% Compute residuals
residuals = y - y_fit;

% Identify potential outliers
[~, outlierIndex] = max(abs(residuals));

% Discard the outlier from t and y
t_no_outlier = t;
t_no_outlier(outlierIndex) = [];
y_no_outlier = y;
y_no_outlier(outlierIndex) = [];

% Refit the data without the outlier
A_no_outlier = [ones(size(t_no_outlier')) t_no_outlier'];
beta_no_outlier = A_no_outlier \ y_no_outlier;
y_fit_no_outlier = A_no_outlier * beta_no_outlier;

% Compute the residuals without the outlier
residuals_no_outlier = y_no_outlier - y_fit_no_outlier;

% Create the main figure
figure;

% Subplot 1: Original Data and Linear Fit without Outlier
subplot(2, 1, 1);
plot(t_no_outlier, y_no_outlier, 'bo', 'DisplayName', 'Data without Outlier'); 
hold on;
plot(t_no_outlier, y_fit_no_outlier, 'r-', 'DisplayName', 'Linear Fit'); 
xlabel('t');
ylabel('y');
title('Data without Outlier and Linear Fit');
legend;
grid on;

% Subplot 2: Residuals without Outlier
subplot(2, 1, 2);
stem(t_no_outlier, residuals_no_outlier, 'm', 'filled');
xlabel('t');
ylabel('Residuals');
title('Residuals vs. t (without Outlier)');
grid on;
%}

% Part 8.c: (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% Creating the design matrix A
A = [ones(size(t')) t'];

% Solve for beta using least squares
beta = A \ y;

% Calculate the fitted values
y_fit = A * beta;

% Compute residuals
residuals = y - y_fit;

% Identify potential outliers
[~, outlierIndex] = max(abs(residuals));

% Discard the outlier from t and y
t_no_outlier = t;
t_no_outlier(outlierIndex) = [];
y_no_outlier = y;
y_no_outlier(outlierIndex) = [];

% Creating the design matrix A for the model with the sine term
A_with_sin = [ones(size(t_no_outlier')) t_no_outlier' sin(t_no_outlier')];

% Solve for beta using least squares for the new model
beta_with_sin = A_with_sin \ y_no_outlier;

% Calculate the fitted values with the sine term
y_fit_with_sin = A_with_sin * beta_with_sin;

% Compute residuals for the model with sine term
residuals_with_sin = y_no_outlier - y_fit_with_sin;

% Create the main figure
figure;

% Subplot 1: Data without Outlier and Linear Fit with Sine Term
subplot(2, 1, 1);
plot(t_no_outlier, y_no_outlier, 'bo', 'DisplayName', 'Data without Outlier'); 
hold on;
plot(t_no_outlier, y_fit_with_sin, 'r-', 'DisplayName', 'Fit with Sine Term'); 
xlabel('t');
ylabel('y');
title('Data without Outlier and Fit with Sine Term');
legend;
grid on;

% Subplot 2: Residuals with Sine Term Model
subplot(2, 1, 2);
stem(t_no_outlier, residuals_with_sin, 'm', 'filled');
xlabel('t');
ylabel('Residuals');
title('Residuals vs. t with Sine Term Model');
grid on;
%}

% Part 8.d: DEPENDENT ON 8.c (PLEASE INTERPRET WHAT THIS CODE MEANS)
%{
% Generating a finer grid for t
t_fine = 0:0.1:26;

% Evaluate the model on the finer grid
y_fit_fine = beta_with_sin(1) + beta_with_sin(2) * t_fine + beta_with_sin(3) * sin(t_fine);

% Plotting
figure;

% Plotting the fitted curve on the finer grid
plot(t_fine, y_fit_fine, '-', 'DisplayName', 'Fit with Sine Term');
hold on;

% Plotting the original data (without outlier)
plot(t_no_outlier, y_no_outlier, 'o', 'DisplayName', 'Data without Outlier');

% Plotting the outlier with a different marker
plot(7, 12.5140, '*', 'MarkerSize', 8, 'DisplayName', 'Outlier');

xlabel('t');
ylabel('y');
title('Data and Fit with Sine Term (Fine Grid)');
legend;
grid on;
%}