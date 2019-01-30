 function [rho] = ComputeRho(m,N,W,x,h)

rho=zeros(N,1);
for i = 1:N
    for j = 1:N
        rho(i)=rho(i)+m*ComputeW(x(1:2,i),x(1:2,j),h); 
    end
end