% MATH 370 HW08

% Problem 1
%{
% Data
year = [1814, 1824, 1834, 1844, 1854, 1864];
pop = [125, 275, 830, 1200, 1750, 1650];

% Scatter plot of the data
scatter(year, pop, 'MarkerEdgeColor', 'm', 'DisplayName', 'Population Measurements');
hold on;

% Fit a spline to the data
year_fit = 1814:1:1864;  % Create a finer-grained x-axis for the spline
pop_fit = spline(year, pop, year_fit);

% Plot the spline as a line of best fit in black
plot(year_fit, pop_fit, 'k', 'DisplayName', 'Spline of Best Fit');

% Add title and axis labels
title('Change in Population versus Years Elapsed');
xlabel('Year');
ylabel('Population');

% Add a legend
legend('Location', 'Northwest');

% Hold off to end the plotting
hold off;

% Discrete Polynomial Model of the Data
degree = 2;
coe = polyfit(year, pop, degree);

% Display Polynomial 
slope2 = coe(1);
slope = coe(2);
y_int = coe(3);
fprintf('\n\nDiscrete Model: y = %.4fx^2 + %0.4fx + %0.4f\n\n', slope2, slope, y_int);
%}


%Problem 2
%{
% Data
year = [1790, 1800, 1810, 1820, 1830, 1840, 1850, 1860, 1870, 1880, 1890, 1900, ...
        1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010];
population = [3929000, 5308000, 7240000, 9638000, 12866000, 17069000, 23192000, ...
              31443000, 38558000, 50156000, 62948000, 75995000, 91972000, 105711000, ...
              122755000, 131669000, 150697000, 179323000, 203212000, 226505000, ...
              248710000, 281416000, 308746000];

% Fit a quadratic model to the data
degree = 2;  % Degree of the polynomial (2 for quadratic)
coe = polyfit(year, population, degree);

% Create a range of years for prediction
years_predict = 1790:1:2010;

% Use the polynomial coefficients to predict population values
population_predict = polyval(coe, years_predict);

% Plot the data and model predictions
figure;
plot(year, population, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8, 'DisplayName', 'Data');
hold on;
plot(years_predict, population_predict, 'r-', 'LineWidth', 2, 'DisplayName', 'Discrete Model');
hold off;

% Add labels and legend
xlabel('Year');
ylabel('Population (millions)');
title('U.S. Population (1790-2010) versus Discrete Model');
legend('Location', 'Northwest');
grid on;

% Display Polynomial 
slope2 = coe(1);
slope = coe(2);
y_int = coe(3);
fprintf('\n\nDiscrete Model: y = %.4fx^2 + %0.4fx + %0.4f\n\n', slope2, slope, y_int);
%}

% Problem 6.b
% Initialize variables
an = 640;  % Initial value of a_n
n = 0;     % Initialize n

% Display table headers
fprintf('n value | a_n value\n');
fprintf('-------------------\n');

% Continue until a_n goes below 80
while an >= 80
    % Print n and a_n values in a table format
    fprintf('%8d | %9.2f\n', n, an);
    
    % Update a_n and increment n
    an = 0.8 * an;
    n = n + 1;
end


