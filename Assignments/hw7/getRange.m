function range = getRange(xstart,xend,intervals)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
xpoints = transpose(xstart:(xend-xstart)/(intervals):xend);
range = f(xpoints);
end
