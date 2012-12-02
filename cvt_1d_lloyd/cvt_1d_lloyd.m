function cvt_1d_lloyd ( n, it_num, init )

%*****************************************************************************80
%
%% CVT_1D_LLOYD carries out the Lloyd algorithm.
%
%  Discussion:
%
%    For points in an interval, the computation of the Voronoi regions
%    is simple.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer IT_NUM, the number of CVT iterations.
%
%    Input, integer INIT, 
%    1, for random initialization,
%    2, for "squashed" initialization.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_LLOYD\n' );
  fprintf ( 1, '  MATLAB version\n' );

  if ( nargin < 1 )
    n = input ( '  Enter number of generators:  ' );
  end

  if ( nargin < 2 ) 
    it_num = input ( '  Enter number of iterations:  ' );
  end

  if ( nargin < 3 ) 
    init = input ( '  Enter 1 for random initializion, 2 for squashed:  ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of generators is %d\n', n );
  fprintf ( 1, '  Number of iterations is %d\n', it_num );
  fprintf ( 1, '  Initialization option is %d\n', init );
%
%  Allocate.
%
  g = zeros ( n + 2, 1 );
  g_new = zeros ( n + 2, 1 );
  g_plot = zeros ( n+2, it_num + 1 );
%
%  For convenience, add a 0.0 and 1.0 point.
%  Also, sort the array.
%
  g(1,1) = 0.0;
  if ( init == 1 )
    g(2:n+1,1) = rand ( n, 1 );
  else
    g(2:n+1,1) = linspace ( 0.01, 0.02, n );
  end
  g(n+2,1) = 1.0;

  g = sort ( g );
%
%  Print the initial generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial generators:\n' );
  fprintf ( 1, '\n' );
  for k = 2 : n + 1
    fprintf ( 1, '  %4d  %f\n', k - 1, g(k,1) );
  end
%
%  Initialize the plotting arrays.
%
  step = 1 : it_num;
  e = nan ( it_num, 1 );
  gm = nan ( it_num, 1 );

  for it = 1 : it_num

    g_plot ( 1:n+2, it ) = g(1:n+2,1);

    g_new(1) = 0.0;
    j = 2;
    g_new(j) = (           g(j-1)          + 0.5 * ( g(j) + g(j+1) ) ) / 2.0;
    for j = 3 : n
      g_new(j) = ( 0.5 * ( g(j-1) + g(j) ) + 0.5 * ( g(j) + g(j+1) ) ) / 2.0;
    end
    j = n + 1;
    g_new(j) =   ( 0.5 * ( g(j-1) + g(j) ) +                g(j+1)   ) / 2.0;
    g_new(n+2) = 1.0;
%
%  Compute the energy.
%
    e(it,1) = 0.0;
    for j = 2 : n + 1
      xl = ( g(j-1) + g(j) ) / 2.0;
      xr = ( g(j+1) + g(j) ) / 2.0;
      x = g(j);
      e(it,1) = e(it,1) + ( ( xr - x )^3 - ( xl - x )^3 ) / 3.0;
    end
%
%  Display the energy.
%
    figure ( 1 )
    plot ( step, log ( e ), 'm-*' )
    title ( 'Log (Energy)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
    grid
%
%  Compute the generator motion.
%
    g_num = n;
    gm(it,1) = sum ( ( g_new(:) - g(:) ).^2 ) / g_num;
%
%  Display the generator motion.
%
    figure ( 2 )
    plot ( step, log ( gm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
    grid
%
%  Update the generator.
%
    g(1:n+2,1) = g_new(1:n+2,1);
    
  end

  g_plot(1:n+2,it_num+1) = g(1:n+2,1);
%
%  Print the current generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current generators:\n' );
  fprintf ( 1, '\n' );
  for k = 2 : n + 1
    fprintf ( 1, '  %4d  %f\n', k - 1, g(k,1) );
  end
%
%  Plot the evolution of the locations of the generators.
%
  figure ( 3 )

  y = ( 0 : it_num );
  for k = 1 : n + 2
    plot ( g_plot(k,1:it_num+1), y )
    hold on;
  end
  grid on
  hold off;

  title ( 'Generator evolution.' );
  xlabel ( 'Generator positions' );
  ylabel ( 'Iterations' ); 
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_LLOYD\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
