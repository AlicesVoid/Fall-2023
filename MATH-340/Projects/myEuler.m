function [t, y] = myEuler(odefun, tspan, y0, h)
    % myEuler solves an ODE using the Euler method.
    % odefun - Function handle for the ODE (e.g., @(t, y) -1000*(y - sin(t)) + cos(t))
    % tspan  - 2-element vector with start and end times (e.g., [0 1])
    % y0     - Initial condition (e.g., 1)
    % h      - Step size (e.g., 0.001)

    % Time vector initialization
    t = tspan(1):h:tspan(2);
    if t(end) ~= tspan(2)  % Make sure the last time point is included
        t = [t tspan(2)];
    end
    N = length(t);  % Number of time points

    % Solution initialization
    y = zeros(1, N);
    y(1) = y0;

    % Euler's method loop
    for i = 1:N-1
        y(i+1) = y(i) + h * odefun(t(i), y(i));
    end
end
