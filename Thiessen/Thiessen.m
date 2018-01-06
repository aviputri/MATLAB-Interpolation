%Thiessen Polygon example

A= [1 20 30 25 20 30 25];
N= [100 120 110 100 90 80 100];

g=A/sum(A);
Nav=sum(g.*N);

