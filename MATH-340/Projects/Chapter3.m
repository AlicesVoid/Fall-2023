% Document for Chapter 3 Homework :D 

% Problem 2:   
%{
%           Date Tom Ben
W1 = [10 27 2001 5 10 4 8];
W2 = [11 19 2001 7 4 5 11];
W3 = [12 03 2001 8 12 6 4];
W4 = [12 20 2001 10 14 8 7];
W5 = [01 09 2002 12 13 10 3];
W6 = [01 23 2002 14 8 12 0];
W7 = [03 06 2002 16 10 13 10];
W = [W1; W2; W3; W4; W5; W6; W7];

% Create Serial Date Num
t = datetime(W(:, [3 1 2])); 

% Tom and Ben
T = [5 10; 7 4; 8 12; 10 14; 12 13; 14 8; 16 10];
B = [4 8; 5 11; 6 4; 8 7; 10 3; 12 0; 13 10;];

% Convert to ounces
T_oz = T(:, 1) * 16 + T(:, 2);
B_oz = B(:, 1) * 16 + B(:, 2);

% Plot Points
plot(t, T_oz, '-rs'); hold on 
plot(t, B_oz, '-bs'); hold off

% Formatting:
legend('Tom', 'Ben');
xlabel('datetick');
ylabel('weight (oz)');
title('The Twins Weights');
%}

% Problem 3: 
%{
% Given data points
x = [-1.00 -0.96 -0.65 0.10 0.40 1.00];
y = [-1.0000 -0.1512 0.3860 0.4802 0.8838 1.0000];

% Define the domain
u = linspace(-1, 1, 100);

% Interpolation using piecelin
piecelin_values = piecelin(x, y, u);

% Interpolation using polyinterp
polyinterp_values = polyinterp(x, y, u);

% Interpolation using splinetx
splinetx_values = splinetx(x, y, u);

% Interpolation using pchiptx
pchiptx_values = pchiptx(x, y, u);

% Create subplots for interpolation methods
figure;

% Plot piecelin Interpolation
subplot(4, 1, 1);
plot(x, y, 's'); hold on
plot(u, piecelin_values);
title('piecelin Interpolation');

% Plot polyinterp Interpolation
subplot(4, 1, 2);
plot(x, y, 's'); hold on
plot(u, polyinterp_values);
title('polyinterp Interpolation');

% Plot splinetx Interpolation
subplot(4, 1, 3);
plot(x, y, 's'); hold on
plot(u, splinetx_values);
title('splinetx Interpolation');

% Plot pchiptx Interpolation
subplot(4, 1, 4);
plot(x, y, 's'); hold on
plot(u, pchiptx_values);
title('pchiptx Interpolation');

% Adjust subplot spacing
sgtitle('Interpolation Methods');
%}

% Problem 7:
%{
% Define the degree of the interpolating polynomial
n = 5;

% Generate n distinct points for interpolation
x = linspace(0, 1, n);

% Define two polynomials P and Q with degrees less than n
P = polyfit(x, x.^2, n-1);  % Example polynomial, you can choose any.
Q = polyfit(x, x.^2, n-1);  % Another polynomial with the same degree.

% Define a range of points for evaluation
x_eval = linspace(0, 1, 100);

% Evaluate P and Q at the same set of points
P_values = polyval(P, x_eval);
Q_values = polyval(Q, x_eval);

% Check if P and Q agree at all points
agreement = isequal(P_values, Q_values);

if agreement
    disp('P and Q agree at all points.');
else
    disp('P and Q do not agree at all points.');
end
%}

% Problem 8:
%{
% Define the golden ratio
phi = (1 + sqrt(5)) / 2;

% Define the evaluation point
x_val = 0.5;

% Calculate T5(x) using the power form representation
T5_power = 16*x_val^5 - 20*x_val^3 + 5*x_val;

% Calculate T5(x) using the trigonometric form representation
T5_trig = cos(5*acos(x_val));

% Calculate T5(x) using the Horner representation
coeffs = [16, 0, -20, 0, 5, 0];
T5_horner = polyval(coeffs, x_val);

% Calculate T5(x) using the Lagrange form representation
x_nodes = [1, phi/2, (phi - 1)/2, -1, -phi/2, -(phi - 1)/2];
y_nodes = [1, -1, 1, -1, 1, -1];
T5_lagrange = 0;
for k = 1:length(x_nodes)
    Lk = 1;
    for j = 1:length(x_nodes)
        if j ~= k
            Lk = Lk * (x_val - x_nodes(j)) / (x_nodes(k) - x_nodes(j));
        end
    end
    T5_lagrange = T5_lagrange + Lk * y_nodes(k);
end

% Calculate T5(x) using the factored representation
z_nodes = [sqrt((2 + phi)/4), sqrt((3 - phi)/4), 0, -sqrt((3 - phi)/4), -sqrt((2 + phi)/4)];
T5_factored = 16 * prod(x_val - z_nodes);

% Calculate T5(x) using the three-term recurrence representation
T5_recurrence = zeros(1, 6);
T5_recurrence(1) = 1;
T5_recurrence(2) = x_val;
for n = 2:5
    T5_recurrence(n + 1) = 2 * x_val * T5_recurrence(n) - T5_recurrence(n - 1);
end

% Display the results
disp(['T5(x) (Power Form) at x = 0.5: ' num2str(T5_power)]);
disp(['T5(x) (Trigonometric Form) at x = 0.5: ' num2str(T5_trig)]);
disp(['T5(x) (Horner Form) at x = 0.5: ' num2str(T5_horner)]);
disp(['T5(x) (Lagrange Form) at x = 0.5: ' num2str(T5_lagrange)]);
disp(['T5(x) (Factored Representation) at x = 0.5: ' num2str(T5_factored)]);
disp(['T5(x) (Three-Term Recurrence) at x = 0.5: ' num2str(T5_recurrence(6))]);
%}

% Problem 10:

% Given data points
x = [-1.00; -0.75; -0.25; 0.25; 0.75; 1.00];
y = [1.0000; 0.1768; 0.0385; 0.0385; 0.1768; 1.0000];

% Domain for interpolation
u = linspace(-1, 1, 100);
% Interpolation using piecewise quadratic interpolation
interp_quad = interp1(x, y, u, 'pchip');

% Interpolation using linear interpolation
interp_linear = interp1(x, y, u, 'linear');

% Interpolation using cubic interpolation
interp_cubic = interp1(x, y, u, 'spline');

% Plot the results
figure;
plot(x, y, 'o', u, interp_quad, 'r', u, interp_linear, 'k', u, interp_cubic, 'b');
title('Piecewise Quadratic, Linear, and Cubic Interpolation');
xlabel('x');
ylabel('y');
legend('Data Points', 'Piecewise Quadratic', 'Linear', 'Cubic');
grid on;

