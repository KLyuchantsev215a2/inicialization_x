clear;
N=100;
nu=3;
k=300000;
l=1;

rho_0=1;
rho=ones(N,1);
V=ones(N,1);
W=zeros(N,N);
m=l*l/N;
h=sqrt(m/rho_0);

dt=0.00000003;
dh=0.001;
charge=1;

x_top_r=1;
y_top_r=1;

xc=x_top_r/2;
yc=y_top_r/2;

x=zeros(2,N);
xper1=zeros(2,N);
xper2=zeros(2,N);
Energy=0;
EnergyX=zeros(N,1);
EnergyY=zeros(N,1);

Penetrationx=0;
Penetrationy=0;

for i=1:N 
    x(1,i)=(1)*rand;
    x(2,i)=(1)*rand;
end 

for time=1:1500
    
    for i=1:N 
        V(i)=m/rho_0;
    end
    
    %W=ComputeW_cor(N,x,x,V,h);
    
    disp(time);
    Energy=Compute_Potential_Energy(x,xc,yc,l,N,k,rho);
    
    for i=1:N  
        xper1=x;
        xper1(1,i)=xper1(1,i)+dh;
        
        xper2=x;
        xper2(2,i)=xper2(2,i)+dh;
        
       EnergyX(i)=Compute_Potential_Energy(xper1,xc,yc,l,N,k,V)-Energy;
       EnergyY(i)=Compute_Potential_Energy(xper2,xc,yc,l,N,k,V)-Energy;     
    end
    for i=1:N  
    x(1,i)=x(1,i)-dt/nu*EnergyX(i)/dh;
    x(2,i)=x(2,i)-dt/nu*EnergyY(i)/dh;
    end
    
    rho=ComputeRho(m,N,W,x,h);
    
    tri=delaunay(x(1,1:N),x(2,1:N));
    trisurf(tri,x(1,1:N),x(2,1:N),rho(1:N));
    subplot(1,2,1);
    
    plot(x(1,1:N),x(2,1:N),'.')
    subplot(1,2,2);
    pause(0.0001)
end

 
