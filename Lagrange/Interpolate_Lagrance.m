function [s]=Interpolate_Lagrance(x,Px,Py)

n=length(Px);

s=0;

for i=1:n
   
   soma=Py(i);
   for j=1:n
        if j~=i
        soma=soma*(x-Px(j))/(Px(i)-Px(j));
        end
   end
   s=s+soma; 
end

end