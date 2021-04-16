%% runScript: 
% runs the Newton-algorithm and visulaize the reults
%
% See also: numDiff, myNewton,
% Author: Daniel Stefan Christmann
% DHBW Stuttgart
% email: daniel-christmann@outlook.de
% data: Q1 2021

%% mandatory
clear; clc; close all;

%% 

x0 = 10;
maxIter = 30;
feps = 1e-8;
xeps = 1e-8; 

[xZero,abortflag, iters] = myNewton('Function',@myPoly,'Feps',feps,'Xeps',xeps,'LivePlot','on');