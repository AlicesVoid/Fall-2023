function [integral_estimate, steps] = trapezoidal_rule(f, a, b, tolerance)
    % f: function handle for the function to be integrated
    % a, b: limits of integration
    % tolerance: tolerance for the error between successive estimates

    % Initial number of intervals
    n = 2;
    h = (b - a) / (n - 1);
    
    % Initial estimate with one trapezoid
    integral_old = (h / 2) * (f(a) + f(b));
    
    steps = 1;
    while true
        % Refine the partition by doubling the number of intervals
        n = n * 2;
        h = (b - a) / (n - 1);
        x = a:h:b;
        
        % Compute the integral estimate using the Trapezoidal Rule
        integral_new = (h / 2) * (f(a) + 2 * sum(f(x(2:end-1))) + f(b));
        
        % Check if the change between successive estimates is within the tolerance
        if abs(integral_new - integral_old) < tolerance
            break;
        end
        
        integral_old = integral_new;
        steps = steps + 1;
    end
    
    integral_estimate = integral_new;
end
