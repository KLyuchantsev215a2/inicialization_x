clear;
N=100;
nu=1;
k=1;
l=1;

dt=0.000001;
dh=0.000001;

x_top_r=1;
y_top_r=1;

xc=x_top_r/2;
yc=y_top_r/2;

x=zeros(2,N);
xper1=zeros(2,N);
xper2=zeros(2,N);
Energy=0;
EnergyX=0;
EnergyY=0;

Penetrationx=0;
Penetrationy=0;

for i=1:N 
    x(1,i)=(1)*rand;
    x(2,i)=(1)*rand;
end 

for time=1:300
    for i=1:N 
        Energy=Compute_Potential_Energy(x,x,N);
        
        xper=x;
        xper1(1,i)=xper(1,i)+dh;
        
        xper2=x;
        xper2(2,i)=xper(2,i)+dh;
        
        EnergyX=Compute_Potential_Energy(x,xper,N);
        Penetrationx=Compute_Penetration(x,xc,l,i);
        x(i)=x(i)-dt/nu*(EnergyX-Energy)/dh;
        
       EnergyY=Compute_Potential_Energy(x,xper2,N);
       Penetrationy=Compute_Penetration(x,yc,l,i);
       x(i)=x(i)-dt/nu*(EnergyY-Energy)/dh;
        
       
    end
     plot(x(1,1:N),x(2,1:N),'.')
        pause(0.0001)
end

 
