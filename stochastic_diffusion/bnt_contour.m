function figure_num = bnt_contour ( figure_num )

%*****************************************************************************80
%
%% BNT_CONTOUR displays contour plots of a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The diffusivity function is compute by DIFFUSIVITY_2D_BNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ivo Babuska, Fabio Nobile, Raul Tempone,
%    A stochastic collocation method for elliptic partial differential equations
%    with random input data,
%    SIAM Journal on Numerical Analysis,
%    Volume 45, Number 3, 2007, pages 1005-1034.
%
%  Parameters:
%
%    Input/output, integer FIGURE_NUM, the current number of figures.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BNT_CONTOUR\n' );
  fprintf ( 1, '  Display contour or surface plots of the stochastic\n' );
  fprintf ( 1, '  diffusivity function defined by DIFFUSIVITY_2D_BNT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first plot uses uniform random values for OMEGA.\n' );
  fprintf ( 1, '  The second uses Gaussian (normal) random values.\n' );
%
%  Set the spatial grid.
%
  nx = 151;
  ny = 121;

  x_1d = linspace ( -1.5, 0.0, nx );
  y_1d = linspace ( -0.4, 0.8, ny );

  [ X, Y ] = meshgrid ( x_1d, y_1d );
%
%  Sample OMEGA.
%
  m = 4;
  seed = 123456789;
  if ( seed == 0 )
    omega = rand ( m, 1 );
  else
    [ omega, seed ] = r8vec_uniform_01 ( m, seed );
  end
%
%  Compute the diffusivity field, using a uniform OMEGA.
%
  dc0 = 10.0;
  n = nx * ny;
  DC = diffusivity_2d_bnt ( dc0, omega, n, X, Y );
%
%  Plot the diffusivity field as a surface plot.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  surf ( Y, X, DC, 'EdgeColor', 'interp' )
  xlabel ( 'Y' )
  ylabel ( 'X' )
  zlabel ( 'DC(X,Y)' )
  title ( 'Stochastic diffusivity function' )

  filename = 'bnt_contour.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file stored as "%s".\n', filename );

  return
end
