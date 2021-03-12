function [A] = Hilbert(n)
%HILBERT Summary of this function goes here
%   Detailed explanation goes here
for i = 1:n
    for j = 1:n
        A(i,j) = 1/(i+j-1);
    end
end
end

