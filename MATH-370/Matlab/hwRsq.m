% Hw 12 Function for use:
%{
function [rsq] = hwRsq(xpoints, ypoints)
    
    % Develops a Linear Model from the series of X-Values (find yfunc)
    f = polyfit(xpoints, ypoints, 1);
    xx = min(xpoints):1:max(xpoints);
    yfunc = polyval(f, xx);

    % Code taken from myRsq for Abstraction Purposes 
    ybar = sum(ypoints)/length(ypoints);
    SST = 0;
    SSE = 0; 
    for i = 1:length(ypoints)
        SST = SST + (ypoints(i)-ybar)^2;
        SSE = SSE + (yfunc(i) - ypoints(i))^2;
    end
    rsq = 1 - SSE/SST;
end
%}