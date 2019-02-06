clear;
N=100;
nu=3;
k=10000000;
l=1;

 fig = figure();
 % создание первого пустого кадра
  set(fig,'Position',[250,100,1300,600]);
   frame = getframe(fig);
  [im,map] = rgb2ind(frame.cdata,4);
  imwrite(im,map,'animation3.gif','DelayTime',0,'Loopcount',inf);
 
rho_0=1;
rho=ones(N,1);
rho_per1=ones(N,1);
rho_per2=ones(N,1);

V=ones(N,1);
W=zeros(N,N);
m=l*l/N;
h=2*sqrt(m/rho_0);

dt=0.00000003;
dh=0.0001;
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
    rho=ComputeRho(m,N,W,x,h);
    
    Energy=Compute_Potential_Energy(x,xc,yc,l,N,k,rho);
    
    for i=1:N  
        xper1=x;
        xper1(1,i)=xper1(1,i)+dh;
      %  rho_per1=ComputeRho(m,N,W,xper1,h);
        
        xper2=x;
        xper2(2,i)=xper2(2,i)+dh;
       % rho_per2=ComputeRho(m,N,W,xper2,h);
        
       EnergyX(i)=Compute_Potential_Energy(xper1,xc,yc,l,N,k,rho)-Energy;
       EnergyY(i)=Compute_Potential_Energy(xper2,xc,yc,l,N,k,rho)-Energy;     
    end
    for i=1:N  
    x(1,i)=x(1,i)-dt/nu*EnergyX(i)/dh;
    x(2,i)=x(2,i)-dt/nu*EnergyY(i)/dh;
    end
    
   
    
    tri=delaunay(x(1,1:N),x(2,1:N));
    trisurf(tri,x(1,1:N),x(2,1:N),rho(1:N));
    subplot(1,2,1);
    
    plot(x(1,1:N),x(2,1:N),'.')
    subplot(1,2,2);
    
     frame = getframe(fig);
         [im,map] = rgb2ind(frame.cdata,4);
         imwrite(im,map,'animation3.gif','DelayTime',0.1,'WriteMode','Append');
         
    pause(0.0001)
end

 
