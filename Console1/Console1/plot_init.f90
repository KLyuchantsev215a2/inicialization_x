 SUBROUTINE plot_init(x,N)
    use ogpf
    integer :: N,i
    real*8 :: x(2,N)
        !...............................................................................
        !Example 1: A very basic example
        !...............................................................................
        TYPE(gpf):: gp

        Real(wp):: xg(n)
        Real(wp):: yg(n)
 

        ! Input data
      
            xg=x(1,1:N)
            yg=x(2,1:N)
            
    
            
            ! Annotation: set title, xlabel, ylabel
            CALL gp%title('Example 1')
            CALL gp%xlabel('x [mm]')
            CALL gp%ylabel('y [mm]')
            Call gp%options('set style data linespoints')
            !Call Plot to draw a vector against a vector of data
            call gp%options('set xrange[-0.75:0.60];set yrange [-0.625:0.625];')
           call gp%plot(xg, yg,'title "square coordinates" with points lt 6 lc rgb "#000000"')
           ! call gp%plot(xh, yh,'title "square coordinates" with points lt 6 lc rgb "#000000"')
  
        
      
    END SUBROUTINE plot_init