% MATH-370: Homework 11

% 7.a:
%{
x = [1, 2, 3, 4, 5];
y = [1, 1, 2, 2, 4];

% Find Polynomial
xx = 1:0.1:5;
line = polyfit(x,y,1);
yy = polyval(line, xx);

% Plot Results
str_line = append(num2str(line(1)), 'x + ', num2str(line(2)));
figure(1); hold on;
plot(x,y, '*', 'DisplayName', 'Given Data');
plot(xx, yy,'DisplayName', str_line);
title('Amelia Rotondo: Plot of Question 7.a:');
legend('Location', 'best');
%}

% 8.b:
%{
x = 10e-3 .* [5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
y = 10e-5 .* [0, 19, 57, 94, 134, 173, 216, 256, 297, 343, 390];

% Find Polynomial
xx = min(x):0.0001:max(x);
line = polyfit(x,y,1);
yy = polyval(line, xx);

% Plot Results
str_line = append(num2str(line(1)), 'x + ', num2str(line(2)));
figure(1); hold on;
plot(x,y, '*', 'DisplayName', 'Given Data');
plot(xx, yy,'DisplayName', str_line);
title('Amelia Rotondo: Plot of Question 8.b:');
legend('Location', 'best')
%}

% 9.a:
%{
x = transpose([17 19 20 22 23 25 28 31 32 33 36 37 39 42]);
y = transpose([19 25 32 51 57 71 113 140 153 187 192 205 250 260]);

% Find Polynomial
xx = min(x):0.1:max(x);
line = polyfit(x,y,1);
yy = polyval(line, xx);

% Plot Results
str_line = append(num2str(line(1)), 'x + ', num2str(line(2)));
figure(1); hold on;
plot(x,y, '*', 'DisplayName', 'Given Data');
plot(xx, yy,'DisplayName', str_line);
title('Amelia Rotondo: Plot of Question 9.a:');
legend('Location', 'best')
%}
