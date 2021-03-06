!������ ������ ������� �������������� ���� � ��������� ������� ��� ������
!������ ������������� ��������� ������, ������ � ���������� �������
program geometry
!d ����������� ������ ����� ���� �� ������������
 
    real*8::Nx,Ny,Nxl
    integer::i,yi,xi,Nreal
    real*8::rho_0, v_0, T, Lx, Ly
    real*8::bias,Ax,Bx,Ay,By
    
 
    real*8, allocatable :: x(:,:)
    real*8, allocatable :: h(:)
    real*8, allocatable :: v(:,:)
    
    open (unit=1, file="input.txt", status='old',    &
             access='sequential', form='formatted', action='read' )
    open (unit=2, file="output.txt")
    
   ! Nx=50
   ! Ny=55
    !Nxl=63
    
    bias=1.0d0
    Lx=1.25d0-0.7d0
    Ly=0.6d0
    
    Bx=((bias-1.0d0)*Lx)/(Nx*(Nx*bias-1.0d0-bias))
    Ax=(Lx-Bx*Nx*Nx)/Nx
    
    By=((bias-1.0d0)*Ly)/(Ny*(Ny*bias-1.0d0-bias))
    Ay=(Ly-By*Ny*Ny)/Ny
    
    Nreal=216*72

        allocate(x(2,Nreal))
        
        !h=S/N
        
     !   i=0
      !  do xi=0,int(Nx)
      !      do yi=0,int(Ny) 
      !          i=i+1
               ! h(i)=
       !         x(1,i) = Ax*xi+Bx*xi*xi
       !         x(2,i) = Ay*yi+By*yi*yi
                
       !     enddo
      !  enddo
        
      !  do xi=0,int(Nx)
      !      do yi=1,int(Ny) 
      !          i=i+1
     !           x(1,i) = Ax*xi+Bx*xi*xi
      !          x(2,i) =-(Ay*yi+By*yi*yi)
     !           
     !       enddo
     !   enddo
        
     !   Lx=0.7d0
     !   Bx=((bias-1.0d0)*Lx)/(Nxl*(Nxl*bias-1.0d0-bias))
     !   Ax=(Lx-Bx*Nxl*Nxl)/Nxl
    
     !    do xi=1,int(Nxl)
     !       do yi=1,int(Ny) 
     !           i=i+1
      !          x(1,i) =-(Ax*xi+Bx*xi*xi)
      !          x(2,i) = Ay*yi+By*yi*yi 
      !      enddo
     !    enddo
         
         
         
      !     do xi=1,int(Nxl)
      !      do yi=1,int(Ny) 
       !         i=i+1
       !         x(1,i) =-(Ax*xi+Bx*xi*xi)
      !          x(2,i) =-(Ay*yi+By*yi*yi) 
      !      enddo
     !   enddo
        
        i=1
        do yi=1,216
            do xi=1,72
                x(1,i) = real(xi-1)/real(72-1)*1.0d0
                x(2,i) = real(yi-1)/real(216-1)*3.0d0
                i=i+1
            enddo
        enddo
        
      !  do i=1,Nx
            

        !    write (2,1110) i,x(1,i),x(2,i)
            
         !    if( x(2,i)>0) then
         !        write (2,1110) i,x(1,i),-x(2,i)
         !       endif
            
       ! enddo
        call plot_init(x,Nreal)
        
        

        
        
      !  deallocate(v)
          
        
       do i=1,Nreal
            write (2,1110) i,x(1,i),x(2,i)
       enddo
        
        
        deallocate(x)
        pause
        
1100 format (4f10.0,1i3,1i1)
1110 format (1i5,2f)
    
end program geometry               