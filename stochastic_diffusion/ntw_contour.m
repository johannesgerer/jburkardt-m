function figure_num = ntw_contour ( figure_num )

%*****************************************************************************80
%
%% NTW_CONTOUR displays a contour plot of a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The diffusivity function is compute by DIFFUSIVITY_2D_NTW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input/output, integer FIGURE_NUM, the current number of figures.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NTW_CONTOUR\n' );
  fprintf ( 1, '  Display contour or surface plots of the stochastic\n' );
  fprintf ( 1, '  diffusivity function defined by DIFFUSIVITY_2D_NTW.\n' );
%
%  Set the spatial grid.
%
  d = 1.0;
  nx = 101;
  ny = 101;
  xvec = linspace ( 0.0, d, nx );
  yvec = linspace ( 0.0, d, ny );

  [ xmat, ymat ] = meshgrid ( xvec, yvec );
%
%  Sample OMEGA.
%  We rescale to  [-sqrt(3),sqrt(3)].
%
  m = 21;
  seed = 123456789;
  if ( seed == 0 )
    omega = rand ( m, 1 );
  else
    [ omega, seed ] = r8vec_uniform_01 ( m, seed );
  end
  omega = ( 1.0 - omega ) * ( - sqrt ( 3.0 ) ) ...
        +         omega   *     sqrt ( 3.0 );
%
%  Evaluate the diffusivity field.
%
  cl = 0.1;
  dc0 = 0.5;
  n = nx * ny;

  dc = diffusivity_2d_ntw ( cl, dc0, m, omega, n, xmat, ymat );
%
%  Make a surface plot of the diffusivity coefficient.
%
  figure_num = figure_num + 1;
  figure ( figure_num );
  surf ( ymat, xmat, dc, 'EdgeColor', 'interp' )
  xlabel ( 'Y' )
  ylabel ( 'X' )
  zlabel ( 'DC(X,Y)' )
  title ( 'NTW Stochastic diffusivity function' )

  filename = 'ntw_contour.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file stored as "%s".\n', filename );

  return
end
