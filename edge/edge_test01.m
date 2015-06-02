function figure_num = edge_test01 ( figure_num )

%*****************************************************************************80
%
%% EDGE_TEST01 plots functions with jump discontinuities.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Polynomial fitting for edge detection in irregularly sampled signals 
%    and images,
%    SIAM Journal on Numerical Analysis,
%    Volume 43, Number 1, 2006, pages 259-279.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST01:\n' );
  fprintf ( 1, '  Plot 1D test functions.\n' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = -1.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  y = fx1 ( n, x );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #1.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = -1.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  y = fx2 ( n, x );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #2.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = -1.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #3.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = 0.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #4.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = -1.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  y = fx5 ( n, x );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #5.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = 0.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  y = fx6 ( n, x );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #6.' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 101;
  x_min = 0.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
  y = fx7 ( n, x );
  plot ( x, y, 'b.', 'MarkerSize', 20 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y(X) --->' );
  title ( '1D test function #7' );
%
%  Until I get around to it, just save the last plot.
%
  filename = 'edge_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end

