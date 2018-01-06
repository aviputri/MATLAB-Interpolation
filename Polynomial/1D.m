% Matlab polynomial interpolation
% fine points for showing detailed interpolation results
xi=0:0.1:108;

%% interpolation points for showing oscillations
x=0:12:108;
y=[0 20 20 40 80 80 100 100 120 120];

figure
scatter(x,y,450,'filled')
set(gca,'fontsize',18)

% evaluate the polynomial on a finer grid and plot the results.
yi = interp1(x, y, xi, 'linear')

figure
scatter(x,y,450,'filled')
hold on

plot(xi,yi,'r','Linewidth',4)
set(gca,'fontsize',18)
title('linear')
% evaluate the polynomial on a finer grid and plot the results.
yi = interp1(x, y, xi, 'nearest')

figure
scatter(x,y,450,'filled')
hold on

plot(xi,yi,'r','Linewidth',4)
set(gca,'fontsize',18)
title('nearest')


% evaluate the polynomial on a finer grid and plot the results.
yi = interp1(x, y, xi, 'spline')

figure
scatter(x,y,450,'filled')
hold on

plot(xi,yi,'r','Linewidth',4)
set(gca,'fontsize',18)
title('spline')


% evaluate the polynomial on a finer grid and plot the results.
yi = interp1(x, y, xi, 'pchip')

figure
scatter(x,y,450,'filled')
hold on

plot(xi,yi,'r','Linewidth',4)
set(gca,'fontsize',18)
title('pchip')