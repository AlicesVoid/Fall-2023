function [integral_estimate, steps] = myMidpoint(f, a, b, tolerance)
    % f: function handle for the function to be integrated
    % a, b: limits of integration
    % tolerance: tolerance for the error between successive estimates

    % Initial number of intervals
    n = 1;
    h = (b - a) / n;
    
    % Initial estimate with the first midpoint
    integral_old = h * f(a + h/2);
    
    steps = 1;
    while true
        % Refine the partition by doubling the number of intervals
        n = n * 2;
        h = (b - a) / n;
        
        % Compute midpoints
        midpoints = a + h/2 : h : b - h/2;
        
        % Compute the integral estimate using the Midpoint Rule
        integral_new = h * sum(f(midpoints));
        
        % Check if the change between successive estimates is within the tolerance
        if abs(integral_new - integral_old) < tolerance
            break;
        end
        
        integral_old = integral_new;
        steps = steps + 1;
    end
    
    integral_estimate = integral_new;
end
