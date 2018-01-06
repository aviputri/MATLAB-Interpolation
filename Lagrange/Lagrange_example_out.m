% Lagrance Polygon example
% to interpolate outside of the range

clear variables
x=-2:0.1:6; % this is outside the range of Px, with the interval of 0.1 (you can change) 

Px(1)=-1;
Py(1)=-4;
Px(2)=0;
Py(2)=-5;
Px(3)=1;
Py(3)=-2;
Px(4)=2;
Py(4)=-1;
Px(5)=3;
Py(5)=-2;
Px(6)=4;
Py(6)=-3;
Px(7)=5;
Py(7)=0;
n2=length(Px);
n=length(x);
for i=1:n
   % we interpolate Px with the range ox x(i) against Py
   % we are calling the Interpolate_Lagrance.m file as a function
[s(i)]=Interpolate_Lagrance(x(i),Px,Py)

end

figure
scatter(Px,Py) % plot the real data
hold on % hold the previous plot
plot(x,s) % plot the interpolated data

