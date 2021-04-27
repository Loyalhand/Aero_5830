function [fp] = fwd_fprime(fp1,fi,h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fp = (fp1-fi)/h;
end

