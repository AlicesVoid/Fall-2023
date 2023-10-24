% Homework 5 Part 2

% Question 4
% Define a complex vector x (as an example)
x = [3 + 4i; -2i; 1 + 3i];

% Choose a k value (for the kth component)
k = 1;

% Calculate sigma
sigma = sign(x(k)) * norm(x);

% Define the unit vector ek
ek = zeros(size(x));
ek(k) = 1;

% Calculate u
u = x + sigma * ek;

% Calculate the complex conjugate of sigma
sigma_bar = conj(sigma);

% Calculate the kth component of u
uk = u(k);

% Calculate rho using the definition
rho = 1 / (sigma_bar * uk);

% Calculate the norm of u squared
norm_u_squared = norm(u)^2;

% Calculate 2/norm(u)^2
two_over_norm_u_squared = 2 / norm_u_squared;

% Display the results
fprintf('Value of rho: %f + %fi\n', real(rho), imag(rho));
fprintf('Value of 2/norm(u)^2: %f + %fi\n', real(two_over_norm_u_squared), imag(two_over_norm_u_squared));
