function [P] =Compute_Potential_Energy(x,xc,yc,l,N,k,rho) %initialization(L,H,N,flag)
%for now size fixed (2,2)
%flag 1 -upper plate -1 -lower plate
%N_y = fix(sqrt(N*L/H));
%N_x = fix( N / N_y);
Energy=0;
Penetrationx=0;
Penetrationy=0;

for  j=1:N      
     for  i=1:(j-1)
        Energy=Energy+(1/rho(j)+1/rho(i))/sqrt((x(1,i)-x(1,j))*(x(1,i)-x(1,j))+(x(2,i)-x(2,j))*(x(2,i)-x(2,j)));
     end
   
end
Penetration=0;
for  j=1:N
        Penetrationx=abs(x(1,j)-xc)-l/2;
            if (Penetrationx<0)
                Penetrationx=0;
            end
         Penetrationy=abs(x(2,j)-yc)-l/2;
            if (Penetrationy<0)
                Penetrationy=0;
            end
        Penetration=Penetration+Penetrationx*Penetrationx+Penetrationy*Penetrationy;
end
P=Energy+Penetration*k;