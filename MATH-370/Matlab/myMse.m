function [mse] = myMse(ypoints, yfunc)
SSE = 0; 
for i = 1:length(ypoints)
    SSE = SSE + (ypoints(i)-yfunc(i))^2;
end
mse = (1/length(ypoints))*SSE;
end