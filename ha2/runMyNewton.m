clear; clc; close all;

%% 

x0 = 10;
maxIter = 30;
feps = 1e-8;
xeps = 1e-8; 

[xZero,abortflag, iters] = myNewton('Function',@myPoly,'Derivative',@dmyPoly,'LivePlot','on');