function ntw_contour ( )

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
%    06 January 2010
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NTW_CONTOUR\n' );
  fprintf ( 1, '  Display contour or surface plots of the stochastic\n' );
  fprintf ( 1, '  diffusivity function defined by DIFFUSIVITY_2D_NTW.\n' );

  d = 1.0;
  x = linspace ( 0.0, d, 101 );
  y = linspace ( 0.0, d, 101 );

  lc = 0.1;

  [ X, Y ] = meshgrid ( x, y );
%
%  Do a realization with uniform OMEGA in [-sqrt(3),sqrt(3)].
%
  n = 21;
  omega = rand ( n, 1 );
  omega = ( 1.0 - omega ) * ( - sqrt ( 3.0 ) ) ...
        +         omega   *     sqrt ( 3.0 );

  A = diffusivity_2d_ntw ( n, omega, lc, X, Y );

  surf ( X, Y, A, 'EdgeColor', 'interp' )
  xlabel ( 'X' )
  ylabel ( 'Y' )
  zlabel ( 'A(X,Y)' )
  title ( 'NTW Stochastic diffusivity function' )

  return
end
