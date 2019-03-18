function [P] =Compute_Potential_Energy(x,xc,yc,xl,yl,N,k,rho,r) %initialization(L,H,N,flag)
%for now size fixed (2,2)
%flag 1 -upper plate -1 -lower plate
%N_y = fix(sqrt(N*L/H));
%N_x = fix( N / N_y);
Energy=0;
xc_r1=0.25;
yc_r1=0.325;
xc_r2=0.25;
yc_r2=0.875;
Penetrationx=0;
Penetrationy=0;
Penetrationr1=0;
Penetrationr2=0;
for  j=1:N      
     for  i=1:(j-1)
        Energy=Energy+(1/100)/((x(1,i)-x(1,j))*(x(1,i)-x(1,j))+(x(2,i)-x(2,j))*(x(2,i)-x(2,j)))^(2);
     end
   
end
Penetration=0;
for  j=1:N
        Penetrationx=abs(x(1,j)-xc)-xl/2;
            if (Penetrationx<0)
                Penetrationx=0;
            end
         Penetrationy=abs(x(2,j)-yc)-yl/2;
            if (Penetrationy<0)
                Penetrationy=0;
            end
          Penetrationr1=r-sqrt((x(1,j)-xc_r1)^2+(x(2,j)-yc_r1)^2);
           if (Penetrationr1<0)
                Penetrationr1=0;
           end
            
           Penetrationr2=r-sqrt((x(1,j)-xc_r2)^2+(x(2,j)-yc_r2)^2);
           if (Penetrationr2<0)
                Penetrationr2=0;
            end
        Penetration=Penetration+Penetrationx*Penetrationx+Penetrationy*Penetrationy+Penetrationr1*Penetrationr1+Penetrationr2*Penetrationr2;
end
P=Energy+Penetration*k;