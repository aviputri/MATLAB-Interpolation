% this is the 2D interpolation methods
% interp2

% Coarsely sample the peaks function.
x=-3:3;
y=-3:3;
[X,Y] = meshgrid(-3:3);

V = random('Poisson',150,7,7);


% Create the query grid with spacing of 0.25.
xq=-3:0.25:3;
yq=-3:0.25:3;
[Xq,Yq] = meshgrid(-3:0.25:3);

%% Interpolate at the query points, and specify nearest interpolation.
Vq = interp2(X,Y,V,Xq,Yq,'nearest');

% Plot the result.
figure
subplot(2,2,1)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 200])
xlim([-3 3])
ylim([-3 3])
title('nearest Interpolation');


title(['nearest ']);

set(gca,'fontsize',25)
%% Interpolate at the query points, and specify Bilinear interpolation.
Vq = interp2(X,Y,V,Xq,Yq,'linear');

%Plot the result.
subplot(2,2,2)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 200]);
xlim([-3 3]);
ylim([-3 3]);
title('Bilinear Interpolation');


title(['Bilinear']);

set(gca,'fontsize',25)
%% Interpolate at the query points, and specify cubic interpolation.
Vq = interp2(X,Y,V,Xq,Yq,'cubic');

% Plot the result.
subplot(2,2,3)
surf(Xq,Yq,Vq);
title('Cubic Interpolation');
view([45 45]);
zlim([0 200]);
xlim([-3 3]);
ylim([-3 3]);

title(['Cubic']);

set(gca,'fontsize',25)
%% Interpolate at the query points, and specify spline interpolation.
Vq = interp2(X,Y,V,Xq,Yq,'spline');

% Plot the result.
subplot(2,2,4)
surf(Xq,Yq,Vq);
title('Spline Interpolation');
view([45 45]);
zlim([0 200]);
xlim([-3 3]);
ylim([-3 3]);
% double integration (volume)
Ntotal = trapz(yq,trapz(xq,Vq,2));
Naverage = Ntotal/(6*6); % Rainfall/unit area

title(['Spline']);

set(gca,'fontsize',25)