clear;
N=400;
nu=3;
k=200000;

xl=1.25;
yl=1.2;

xc_r1=0.25;
yc_r1=0.325;
xc_r2=0.25;
yc_r2=0.875;
r=0.25/2;

 fig = figure();
 % ???????? ??????? ??????? ?????
  set(fig,'Position',[250,100,1300,600]);
   frame = getframe(fig);
  [im,map] = rgb2ind(frame.cdata,4);
  imwrite(im,map,'animation3.gif','DelayTime',0,'Loopcount',inf);
  
rho_0=3;
rho=ones(N,1)*rho_0;
m=(xl*(yl/2)-pi*r*r)*rho_0/(N);

V=ones(N,1);
W=zeros(N,N);

h=1.4*sqrt(m/rho_0);

dt=0.000001;
dh=0.00000001;

xc=xl/2;
yc=yl/2;

x=zeros(2,N);
xper1=zeros(2,N);
xper2=zeros(2,N);
Energy=0;
EnergyX=zeros(N,1);
EnergyY=zeros(N,1);

Penetrationx=0;
Penetrationy=0;

for i=1:N 
    x(1,i)=(xl)*rand;
    x(2,i)=(yl/2)*rand;
end 
x(1,N)=0.7;
x(2,N)=0;

sx1=0:0.01:xl; 
nx=length(sx1); 
sy1(1:nx)=yl/2; 

sx2=0:0.01:xl; 
nx=length(sx2); 
sy2(1:nx)=0; 

sy3=0:0.01:yl/2; 
ny=length(sy3); 
sx3(1:ny)=0; 

sy4=0:0.01:yl/2; 
ny=length(sy4); 
sx4(1:ny)=xl; 


t=[0:pi/180:2*pi]; % или гуще 
xr1=r*cos(t)+xc_r1; 
yr1=r*sin(t)+yc_r1;  
%xr2=r*cos(t)+xc_r2; 
%yr2=r*sin(t)+yc_r2;  
 
for time=1:4500
    
    for i=1:N 
        V(i)=m/rho_0;
    end
    
   % W=ComputeW_cor(N,x,x,V,h);
    
    disp(time);
    %rho=ComputeRho(m,N,W,x,h);
    
    Energy=Compute_Potential_Energy(x,xc,yc,xl,yl,N,k,r,rho);
    
    for i=1:N  
        xper1=x;
        xper1(1,i)=xper1(1,i)+dh;
      %  rho_per1=ComputeRho(m,N,W,xper1,h);
        
        xper2=x;
        xper2(2,i)=xper2(2,i)+dh;
       % rho_per2=ComputeRho(m,N,W,xper2,h);
        
       EnergyX(i)=Compute_Potential_Energy(xper1,xc,yc,xl,yl,N,k,r,rho)-Energy;
       EnergyY(i)=Compute_Potential_Energy(xper2,xc,yc,xl,yl,N,k,r,rho)-Energy;     
    end
    for i=1:N  
    x(1,i)=x(1,i)-dt/nu*EnergyX(i)/dh;
    x(2,i)=x(2,i)-dt/nu*EnergyY(i)/dh;
    end
    
   
    
     tri=delaunay(x(1,1:N),x(2,1:N));
      trisurf(tri,x(1,1:N),x(2,1:N),rho(1:N));
     %axis([-0.2 1.2 -0.2 1.2 0 1.6]);

    subplot(1,2,1);
    
    plot(x(1,1:N),x(2,1:N),'.',sx1,sy1,'k',sx2,sy2,'k',sx3,sy3,'k',sx4,sy4,'k',xr1,yr1,'k');
    axis([-0.2 1.4 -0.2 1.4]);
    subplot(1,2,2);
    
     frame = getframe(fig);
         [im,map] = rgb2ind(frame.cdata,4);
         imwrite(im,map,'animation3.gif','DelayTime',0.1,'WriteMode','Append');
         
    pause(0.0001)
end

 
