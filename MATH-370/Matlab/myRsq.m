function [rsq] = myRsq(ypoints, yfunc)
ybar = sum(ypoints)/length(ypoints);
SST = 0;
SSE = 0; 
for i = 1:length(ypoints)
    SST = SST + (ypoints(i)-ybar)^2;
    SSE = SSE + (yfunc(i) - ypoints(i))^2;
end
rsq = 1 - SSE/SST;
end