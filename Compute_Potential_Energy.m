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
     for  i=1:j
         if(i==j)
             continue;
         end
         
         Penetrationx=abs(x(1,i)-xc)-l/2;
            if (Penetrationx<0)
                Penetrationx=0;
            end
         Penetrationy=abs(x(2,i)-yc)-l/2;
            if (Penetrationy<0)
                Penetrationy=0;
            end
        Penetration=Penetrationx+Penetrationy;
        Energy=Energy+1/sqrt((xper(1,i)-x(1,j))*(xper(1,i)-x(1,j))+(xper(2,i)-x(2,j))*(xper(2,i)-x(2,j)));
     end
     Energy=Energy+k*Penetration*Penetration;
end

P=Energy;