clc
clear all
close all
format longg
%=========================================================================
                                %q1
%=========================================================================                                
xstart = 0;
xend = pi;

Trap = zeros(20,1);
Simp = Trap;
meshSize = Simp;
I = pi*ones(20,1);
i = 1;
for intervals = 2:2:40
    range = getRange(xstart,xend,intervals);
    h = xend/intervals;
    meshSize(i,1) = h;
    Trap(i,1) = Trapz(h,intervals,range);
    Simp(i,1) = Simp13(h,intervals,range);
    i = i + 1;
end

errTrap = I-Trap;
errSimp = I-Simp;
