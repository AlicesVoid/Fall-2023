function [t, y] = myMidpoint(odefun, tspan, y0, h)
    % myMidpoint solves an ODE using the Midpoint method.
    % odefun - Function handle for the ODE
    % tspan  - 2-element vector with start and end times
    % y0     - Initial condition
    % h      - Step size

    t = tspan(1):h:tspan(2);
    if t(end) ~= tspan(2)
        t = [t tspan(2)];
    end
    N = length(t);
    y = zeros(1, N);
    y(1) = y0;

    for i = 1:N-1
        k1 = odefun(t(i), y(i));
        k2 = odefun(t(i) + h/2, y(i) + h/2 * k1);
        y(i+1) = y(i) + h * k2;
    end
end
