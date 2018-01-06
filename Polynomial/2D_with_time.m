%this is the 2D interpolation methods
%interp2
clear all
%Coarsely sample the peaks function.
x=-3:3;
y=-3:3;
[X,Y] = meshgrid(-3:3);


%% generate time rainfall
figure;
Vi=random('Poisson',150,7,7);
figure('units','normalized','outerposition',[0 0 1 1])

for t=1:100

V(1:7,1:7,t)= random('Poisson',Vi,7,7);
Vi=V(1:7,1:7,t);

surf(X,Y,Vi);
view([45 45]);
zlim([0 500])
set(gca,'fontsize',25)
M(t) = getframe(gcf);

end

% %play movie
% figure
% movie(M,1)
% Create AVI file.
v=VideoWriter('RainfallTime.avi');
open(v)
writeVideo(v,M)
close(v)
%rename it to read in ppt
movefile( 'RainfallTime.avi', 'RainfallTime.wmv' );

%Create the query grid with spacing of 0.25.

xq=-3:0.25:3;
yq=-3:0.25:3;
[Xq,Yq] = meshgrid(-3:0.25:3);

%% Interpolate at the query points, and specify nearest interpolation.
figure
figure('units','normalized','outerposition',[0 0 1 1])
for t=1:100
Vi=V(1:7,1:7,t);

Vq= interp2(X,Y,Vi,Xq,Yq,'nearest');

%Plot the result.

subplot(2,2,1)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 500])

%double integration (volume)
Ntotal = trapz(yq,trapz(xq,Vq,2));
Naverage(1,t) = Ntotal/(6*6); %Rainfall/unit area

SumNaverage(1)=sum(Naverage(1,:));
title(['nearest Nav=',num2str(round(Naverage(1,t))),' SuNav=',num2str(round(SumNaverage(1)))]);




%% Interpolate at the query points, and specify Bilinear interpolation.
Vq = interp2(X,Y,Vi,Xq,Yq,'linear');

%Plot the result.
subplot(2,2,2)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 500])

%double integration (volume)
Ntotal = trapz(yq,trapz(xq,Vq,2));
Naverage(2,t) = Ntotal/(6*6); %Rainfall/unit area

SumNaverage(2)=sum(Naverage(2,:));
title(['Bilinear Nav=',num2str(round(Naverage(2,t))),' SuNav=',num2str(round(SumNaverage(2)))]);


%% Interpolate at the query points, and specify cubic interpolation.
Vq = interp2(X,Y,Vi,Xq,Yq,'cubic');

%Plot the result.
subplot(2,2,3)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 500])

%double integration (volume)
Ntotal = trapz(yq,trapz(xq,Vq,2));
Naverage(3,t) = Ntotal/(6*6); %Rainfall/unit area

SumNaverage(3)=sum(Naverage(3,:));
title(['Cubic Nav=',num2str(round(Naverage(3,t))),' SuNav=',num2str(round(SumNaverage(3)))]);

%% Interpolate at the query points, and specify spline interpolation.
Vq = interp2(X,Y,Vi,Xq,Yq,'spline');

%Plot the result.
subplot(2,2,4)
surf(Xq,Yq,Vq);
view([45 45]);
zlim([0 500])

%double integration (volume)
Ntotal = trapz(yq,trapz(xq,Vq,2));
Naverage(4,t) = Ntotal/(6*6); %Rainfall/unit area

SumNaverage(4)=sum(Naverage(4,:));
title(['Spline Nav=',num2str(round(Naverage(4,t))),' SuNav=',num2str(round(SumNaverage(4)))]);

M2(t) = getframe(gcf);
end
close all
% Create AVI file.
v=VideoWriter('RainfallIntTime.avi');
open(v)
writeVideo(v,M2)
close(v)
%rename it to read in ppt
movefile( 'RainfallIntTime.avi', 'RainfallIntTime.wmv' );