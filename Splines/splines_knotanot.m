% this is a spline example with not-a-knot interpolation 
% yy=spline(x, y, xx);
% Performs cubic spline interpolation, generally using not-a-knot conditions. 
% If y contains two more values than x has entries, 
% then the first and last value in y are used as the derivatives at the end points (i.e. clamped)
close all
% Example: 
% Generate data (9 points):
x = linspace(-1, 1, 9); % generates n points
y = 1./(1+30*x.^2); % y as a function of x

% Calculate 100 model points and determine not-a-knot interpolation
xx = linspace(-1, 1); % returns a row vector of 100 evenly spaced points between x1 and x2.
yy = spline(x, y, xx);

% Calculate actual function values at model points and data points, 
% the 9-point not-a-knot interpolation (solid), and the actual function (dashed), 
yr = 1./(1+30*xx.^2);
plot(x, y, 'o', xx, yy, '-', xx, yr, '--');

