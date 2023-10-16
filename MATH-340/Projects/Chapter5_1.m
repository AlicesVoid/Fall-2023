% Chapter 5, Part 1 Homework:

% == Problem 7: =====================================================
%{
k = 1:11;
t = (k-1)/10;
y = erf(t);

% PART 7.a: (PLEASE INTERPRET WHAT THIS CODE MEANS)

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

% Display the legend
legend('Location', 'best');

% Display max errors for each degree
disp('Maximum errors for each polynomial degree:');
disp(max_errors);
%}

% == Problem 8: =====================================================
% 
t = 1:25;
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948
6.1261 12.5140 10.0502 9.1614 7.5677
7.2920 10.0357 11.0708 13.4045 12.8415
11.9666 11.0765 11.7774 14.5701 17.0440
17.0398 15.9069 15.4850 15.5112 17.6572];
y = y'; 
y = y(:);

