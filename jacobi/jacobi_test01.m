function jacobi_test01 ( )

%*****************************************************************************80
%
%% JACOBI_TEST01 tests JACOBI1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_TEST01:\n' );

  it_num = 400;
  n = 20;

  x_exact = ( 1 : n )';
  a = dif2 ( n );
  b = a * x_exact;

  x = zeros ( n, 1 );  
  x_plot(1:n,1) = x;

  step = 1 : it_num + 1;
  r = nan ( it_num+1, 1 );
  xm = nan ( it_num+1, 1 );

  r(1,1) = ( norm ( a * x - b ) ).^2;

  for it = 1 : it_num

    x_new = jacobi1 ( n, a, b, x );
%   x_new = jacobi2 ( n, a, b, x );

    r(it+1,1) = ( norm ( a * x_new - b ) ).^2;
    x_plot(1:n,it+1) = x_new;
%
%  Display the residual.
%
    figure ( 1 )
    plot ( step, log ( r ), 'm-*' )
    title ( 'Log (Residual^2)' )
    xlabel ( 'Step' )
    ylabel ( 'Residual' )
    grid
%
%  Display the motion.
%
    xm(it,1) = sum ( ( x_new(:) - x(:) ).^2 ) / n;

    figure ( 2 )
    plot ( step, log ( xm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Motion' )
    grid
%
%  Update the solution
%
    x = x_new;

  end
%
%  Plot the evolution of the locations of the generators.
%
  figure ( 3 )

  y = ( 0 : it_num );
  for k = 1 : n
    plot ( x_plot(k,1:it_num+1), y )
    hold on;
  end
  grid on
  hold off;

  title ( 'Generator evolution.' );
  xlabel ( 'Generator positions' );
  ylabel ( 'Iterations' ); 

  return
end
