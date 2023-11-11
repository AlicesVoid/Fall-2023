% Initial Variables
iter = 0;
x0 = exp(1);
tol = 1e-6;
x = x0; 

% Contraction Mapping Loop
while true
    iter = iter + 1;
    old_x = x;
    x = 3 * log(old_x); 

    % Return when Tolerance is Reached
    if abs(x - old_x) < tol
        break;
    end

    % Error Handling
    if iter > 10000
        disp('Solution not converging within 10000 iterations.');
        break;
    end
end

disp(['Solution found: x = ', num2str(x)]);
disp(['Number of iterations: ', num2str(iter)]);
