% Homework 5 Part 2

% Question 4 
%{
    % Part a:
 
% Define a complex vector x
x = [1 + 2i; 2 + 3i; 3 + 4i]; % Example complex vector

% Define k (ensure kth component of x is 2)
k = 2;

% Calculate sigma
sigma = sign(x(k)) * norm(x);
%sigma = (x(k) / abs(x(k))) * norm(x);

% Develop u
ek = zeros(size(x)); % Initialize a vector of the same size as x with zeros
ek(k) = 1; % Set the kth component of ek to 1
u = x + sigma * ek;

% Find sigma_bar (complex conjugate of sigma)
sigma_bar = conj(sigma);

% Derive rho
uk = u(k); % Extract the kth component of u
rho = 1 / (sigma_bar * uk);

% Display the intermitten results
%{
disp('Vector x:');
disp(x);
disp('Sigma:');
disp(sigma);
disp('Vector u:');
disp(u);
disp('Sigma_bar:');
disp(sigma_bar);
%}

% Find rho_norm
u_norm_squared = norm(u)^2; % Calculate the squared norm of u
rho_norm = 2 / u_norm_squared; % Calculate rho_norm

% Compare rho to rho_norm to show that they are equal
comparison = isequal(round(rho, 10), round(rho_norm, 10));

% Display the comparison
%{
disp('Rho:');
disp(rho);
disp('Rho_norm:');
disp(rho_norm);
disp('Are Rho and Rho_norm equal (to 10 decimal places)?');
disp(comparison);
%}

    % Part b:

% Find the Householder reflection H
I = eye(length(u)); % Identity matrix of the same size as u
H = I - rho * (u * u');

% Prove that H equals its transpose H'
H_transpose = H';
is_H_equal_to_H_transpose = isequal(round(H, 10), round(H_transpose, 10));

% Prove that H * H' equals the identity matrix I
H_transpose_H = H_transpose*H;
is_H_H_transpose_equal_to_I = isequal(round(H_transpose_H, 10), round(I, 10));

% Display the result of the comparisons
%{
fprintf('\n');
disp(H);
disp(H_transpose);
disp('--------------------------')
disp(H_transpose_H);
disp(I);
disp('--------------------------')
disp(['Is H equal to H'' (to 10 decimal places' ...
    ')?']);
disp(is_H_equal_to_H_transpose);
disp('Is H * H'' equal to I (to 10 decimal places)?');
disp(is_H_H_transpose_equal_to_I);
%}

    % Part c:

% Show that all components (except for the kth) of H*x are zero: H*x = (-sigma)*ek
Hx = H * x;
expected_result = (-sigma) * ek;
disp('H*x:');
disp(Hx);
disp('(-sigma)*ek:');
disp(expected_result);

% Check if they are equal (to 10 decimal places)
are_equal_Hx_and_expected = isequal(round(Hx, 10), round(expected_result, 10));
disp('Are H*x and (-sigma)*ek equal (to 10 decimal places)?');
disp(are_equal_Hx_and_expected);

% For any vector y, let tau equal: tau = rho*(u')*y
y = rand(size(x)); % Example vector y
tau = rho * (u' * y);

% Show that: H*y = y - tau*u
Hy = H * y;
expected_result_y = y - tau * u;
disp('H*y:');
disp(Hy);
disp('y - tau*u:');
disp(expected_result_y);

% Check if they are equal (to 10 decimal places)
are_equal_Hy_and_expected = isequal(round(Hy, 10), round(expected_result_y, 10));
disp('Are H*y and y - tau*u equal (to 10 decimal places)?');
disp(are_equal_Hy_and_expected);
%}

% Question 5 
%{

% Define the vector x
x = [9; 2; 6];

    % Part a:

% Find the Householder reflection H
e1 = [1; 0; 0]; % First column of the identity matrix
v = x - norm(x) * e1; % Reflection vector
H = eye(3) - 2 * (v * v') / (v' * v); % Householder reflection

% Apply H to x to verify the transformation
Hx = H * x;
disp('H*x:');
disp(Hx);

    % Part b:

% Find the nonzero vectors u and v such that Hu = -u and Hv = v
u = v; % Any scalar multiple of v will also satisfy Hu = -u
Hu = H * u;
disp('u:');
disp(u);
disp('Hu:');
disp(Hu);

% For Hv = v, we can choose v to be any eigenvector of H corresponding to eigenvalue 1
% Find the eigenvectors and eigenvalues of H
[eigenvectors, eigenvalues] = eig(H);

% Find the index of the eigenvalue that is closest to 1
[~, index] = min(abs(diag(eigenvalues) - 1));

% Choose v to be the corresponding eigenvector
v = eigenvectors(:, index);
Hv = H * v;

disp('v:');
disp(v);
disp('Hv:');
disp(Hv);
%}

% Question 6:
%{

    % Part a:

% Establish the matrix X
X = [1 2 3; 4 5 6; 7 8 9; 10 11 12; 13 14 15];
warning off;

% Verify that X is Rank Deficient
rank_X = rank(X);
%{
disp('Rank of X:');
disp(rank_X);
%}

% The actual pseudoinverse
Z = pinv(X);
% Backslash
B = X \ eye(5,5);
% Slash
S = eye(3,3) / X;

% Display Z, B, and S
%{
disp('Z (Pseudoinverse using pinv):');
disp(Z);
disp('B (Pseudoinverse using backslash):');
disp(B);
disp('S (Pseudoinverse using slash):');
disp(S);
%}

    % Part b:

% Compute a lot of Values and Differences about Z, B, and S:
% ‖Z‖F , ‖B‖F , and ‖S‖F
norm_ZF = norm(Z, 'fro');
norm_BF = norm(B, 'fro');
norm_SF = norm(S, 'fro');

% ‖XZ − I‖F , ‖XB − I‖F , and ‖XS − I‖F
norm_XZ_I_F = norm(X*Z - eye(5), 'fro');
norm_XB_I_F = norm(X*B - eye(5), 'fro');
norm_XS_I_F = norm(X*S - eye(5), 'fro');

% ‖ZX − I‖F , ‖BX − I‖F , and ‖SX − I‖F
norm_ZX_I_F = norm(Z*X - eye(3), 'fro');
norm_BX_I_F = norm(B*X - eye(3), 'fro');
norm_SX_I_F = norm(S*X - eye(3), 'fro');

% Display Statements (wow there’s a lot of these...) 
%{
disp('Frobenius Norms:');
disp(['‖Z‖F: ', num2str(norm_ZF)]);
disp(['‖B‖F: ', num2str(norm_BF)]);
disp(['‖S‖F: ', num2str(norm_SF)]);
disp('Frobenius Norms of X*M - I (where M is Z, B, or S):');
disp(['‖XZ − I‖F: ', num2str(norm_XZ_I_F)]);
disp(['‖XB − I‖F: ', num2str(norm_XB_I_F)]);
disp(['‖XS − I‖F: ', num2str(norm_XS_I_F)]);
disp('Frobenius Norms of M*X - I (where M is Z, B, or S):');
disp(['‖ZX − I‖F: ', num2str(norm_ZX_I_F)]);
disp(['‖BX − I‖F: ', num2str(norm_BX_I_F)]);
disp(['‖SX − I‖F: ', num2str(norm_SX_I_F)]);
disp('‖Z‖F is less than or equal to ‖B‖F and ‖S‖F');
disp(['‖Z‖F ≤ ‖B‖F: ', num2str(norm_ZF <= norm_BF)]);
disp(['‖Z‖F ≤ ‖S‖F: ', num2str(norm_ZF <= norm_SF)]);
disp('‖XZ − I‖F is less than or equal to ‖XB − I‖F and ‖XS − I‖F');
disp(['‖XZ − I‖F ≤ ‖XB − I‖F: ', num2str(norm_XZ_I_F <= norm_XB_I_F)]);
disp(['‖XZ − I‖F ≤ ‖XS − I‖F: ', num2str(norm_XZ_I_F <= norm_XS_I_F)]);
disp('‖ZX − I‖F is less than or equal to ‖BX − I‖F and ‖SX − I‖F');
disp(['‖ZX − I‖F ≤ ‖BX − I‖F: ', num2str(norm_ZX_I_F <= norm_BX_I_F)]);
disp(['‖ZX − I‖F ≤ ‖SX − I‖F: ', num2str(norm_ZX_I_F <= norm_SX_I_F)]);
%}

    % Part c:

% Establish Variables:
XZ = X*Z;
ZX = Z*X;
XZX = X*Z*X;
ZXZ = Z*X*Z;
tolerance = 1e-13;

% Verify that XZ is symmetric
is_XZ_symmetric = norm(XZ - XZ', 'fro') < tolerance;
disp(['Is XZ symmetric? ', num2str(is_XZ_symmetric)]);

% Verify that ZX is symmetric
is_ZX_symmetric = norm(ZX - ZX', 'fro') < tolerance;
disp(['Is ZX symmetric? ', num2str(is_ZX_symmetric)]);

% Verify that XZX = X
is_XZX_equal_X = norm(XZX - X, 'fro') < tolerance;
disp(['Is XZX equal to X? ', num2str(is_XZX_equal_X)]);

% Verify that ZXZ = Z
is_ZXZ_equal_Z = norm(ZXZ - Z, 'fro') < tolerance;
disp(['Is ZXZ equal to Z? ', num2str(is_ZXZ_equal_Z)]);

%}

% Question 11:
%{

% Load Longley dataset
load longley.dat

% Separate response variable and predictor variables
y = longley(:,1);
X = longley(:,2:7);

% Add a column of ones to X for the intercept term
X = [ones(size(X,1),1), X];

% Display first few rows of y and X
disp('First few rows of y:')
disp(y(1:5,:))

disp('First few rows of X (with intercept):')
disp(X(1:5,:))

    % Part a:

beta = X \ y;
fprintf('Part A: Beta values:\n %f %f %f %f %f %f %f\n', beta);

    % Part c:

figure(1); hold off;
y_pred = X * beta;
errors = y - y_pred;
errorbar(1:length(y), y, errors, 'o');
xlabel('Observation');
ylabel('Total Derived Employment');
title('Part C: Total Derived Employment with Error Bars');

    % Part d:

X_no_intercept = X(:, 2:end);
R = corrcoef(X_no_intercept);
disp('Part D: Correlation coefficients:');
disp(R);

    % Part e:

y_normalized = (y - mean(y)) / std(y);
X_normalized = (X_no_intercept - mean(X_no_intercept)) ./ std(X_no_intercept);
X_normalized = [ones(size(X_normalized, 1), 1), X_normalized];  % Add the column of 1's back

% Plot all seven normalized variables
figure(2); hold off;
plot(1:length(y), [y_normalized, X_normalized(:, 2:end)]);
legend('y', 'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'Location', 'best');
xlabel('Observation');
ylabel('Normalized Value');
title('Part E: Normalized Variables');

%}

% Question 12: 
%{

% Given data for the planet's position
x = [1.02; .95; .87; .77; .67; .56; .44; .30; .16; .01];
y = [0.39; .32; .27; .22; .18; .15; .13; .12; .13; .15];

    % Part a:

% Forming the A matrix and b vector for Ax = b
A = [x.^2, x.*y, y.^2, x, y];
b = -ones(10, 1);

% Solving the linear system for coefficients
coefficients = A\b;
a = coefficients(1);
b = coefficients(2);
c = coefficients(3);
d = coefficients(4);
e = coefficients(5);
f = 1;  % since we set one of the coefficients to 1

% Define the range for X and Y for plotting
xmin = -1; xmax = 2;
ymin = -1; ymax = 2;
deltax = 0.01; deltay = 0.01;

% Create meshgrid for X and Y
[X, Y] = meshgrid(xmin:deltax:xmax, ymin:deltay:ymax);

% Evaluate the quadratic form for the original coefficients
Z = a*X.^2 + b*X.*Y + c*Y.^2 + d*X + e*Y + f;

% Plot the original orbit and data points with adjusted range
figure(2);
contour(X, Y, Z, [0 0], 'k');
hold on;
plot(x, y, 'ro');
title('Parts A and B: Orbit and Data Points');
xlabel('X-axis');
ylabel('Y-axis');
legend('Orbit', 'Data Points');
grid on;

% Debugging: Print the coefficients to check their values
disp('Original coefficients:');
disp([a, b, c, d, e, f]);

% Continue with part (b)...


% Debugging: Print the coefficients to check their values
disp('Original coefficients:');
disp([a, b, c, d, e, f]);



    % Part b

% Perturb the data
perturbation = 0.001 * (rand(size(x)) - 0.5);
x_perturbed = x + perturbation;
y_perturbed = y + perturbation;

% Set up the new coefficients matrix for the perturbed data
A_perturbed = [x_perturbed.^2, x_perturbed.*y_perturbed, y_perturbed.^2, x_perturbed, y_perturbed];
b_perturbed = -ones(size(x_perturbed));

% Solve the perturbed system
coefficients_perturbed = A_perturbed\b_perturbed;
a_p = coefficients_perturbed(1);
b_p = coefficients_perturbed(2);
c_p = coefficients_perturbed(3);
d_p = coefficients_perturbed(4);
e_p = coefficients_perturbed(5);
f_p = 1;

% Display the perturbed coefficients
disp('Coefficients for the perturbed data:');
disp(coefficients_perturbed);

% Evaluate the quadratic form for the perturbed coefficients
Z_perturbed = a_p*X.^2 + b_p*X.*Y + c_p*Y.^2 + d_p*X + e_p*Y + f_p;

% Plot the perturbed orbit on the same plot
contour(X, Y, Z_perturbed, [0 0], 'r--');
legend('Orbit', 'Data Points', 'Perturbed Orbit');
hold off;

% Debugging: Print the perturbed coefficients to check their values
disp('Perturbed coefficients:');
disp([a_p, b_p, c_p, d_p, e_p, f_p]);

%}