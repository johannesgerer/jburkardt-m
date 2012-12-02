function gauss_seidel_test02 ( )

%*****************************************************************************80
%
%% GAUSS_SEIDEL_TEST02 tests GAUSS_SEIDEL2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAUSS_SEIDEL_TEST02:\n' );

  it_num = 400;
  n = 20;

  x_exact = ( 1 : n )';

  l = sparse ( 2:n,   1:n-1, -1.0, n, n );
  d = sparse ( 1:n,   1:n,    2.0, n, n );
  u = sparse ( 1:n-1, 2:n,   -1.0, n, n );

  a = l + d + u;

  b = a * x_exact;

  x = zeros ( n, 1 );  
  x_plot(1:n,1) = x;

  step = 1 : it_num + 1;
  e = nan ( it_num+1, 1 );
  xm = nan ( it_num+1, 1 );

  e(1,1) = ( norm ( a * x - b ) ).^2;

  for it = 1 : it_num

    x_new = gauss_seidel2 ( n, l, d, u, b, x );

    e(it+1,1) = ( norm ( a * x_new - b ) ).^2;
    x_plot(1:n,it+1) = x_new;
%
%  Display the error.
%
    figure ( 1 )
    plot ( step, log ( e ), 'm-*' )
    title ( 'Log (Error^2)' )
    xlabel ( 'Step' )
    ylabel ( 'Error' )
    grid
%
%  Display the motion.
%
    xm(it,1) = sum ( ( x_new(:) - x(:) ).^2 ) / n;

    figure ( 2 )
    plot ( step, log ( xm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
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
