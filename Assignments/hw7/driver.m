% main.m
clc
clear all
close all
format longg
%=========================================================================
                                %q1
%=========================================================================                                
xstart = 1;
xend = 2;
xstart = 0;
xend = pi;
Trap = zeros(20,1);
Simp = Trap;
meshSize = Simp;
I = pi*ones(20,1);
i = 1;
for intervals = 2:2:40
    [range,xpoints] = getRange(xstart,xend,intervals);
    h = xpoints(2)-xpoints(1);
    meshSize(i,1) = h;
    Trap(i,1) = Trapz(h,intervals,range);
    Simp(i,1) = Simp13(h,intervals,range);
    i = i + 1;
end

errTrap = abs(I-Trap);
errSimp = abs(I-Simp);

hold on 
set(gca, 'XScale', 'log', 'YScale', 'log');
loglog(meshSize,errTrap)
loglog(meshSize,errSimp)
legend('Trapezoidal','Simpson 1/3','location','northwest')
title('Error vs.Mesh size')
ylabel('error')
xlabel('mesh size')
grid on
hold off