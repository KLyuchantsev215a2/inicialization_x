function [P] =Compute_Potential_Energy(x,xper,xc,yc,l,N,k) %initialization(L,H,N,flag)
%for now size fixed (2,2)
%flag 1 -upper plate -1 -lower plate
%N_y = fix(sqrt(N*L/H));
%N_x = fix( N / N_y);
Energy=0;
Penetrationx=0;
Penetrationy=0;
Penetration=0;
for  j=1:N      
     for  i=1:(j-1)
        Energy=Energy+1/sqrt((xper(1,i)-x(1,j))*(xper(1,i)-x(1,j))+(xper(2,i)-x(2,j))*(xper(2,i)-x(2,j)));
     end
   
end

for  j=1:N
        Penetrationx=abs(xper(1,j)-xc)-l/2;
            if (Penetrationx<0)
                Penetrationx=0;
            end
         Penetrationy=abs(xper(2,j)-yc)-l/2;
            if (Penetrationy<0)
                Penetrationy=0;
            end
        Penetration=Penetrationx*Penetrationx+Penetrationy*Penetrationy;
end
P=Energy+Penetration*k;