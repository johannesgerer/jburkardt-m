function bnt_contour ( )

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
%    20 December 2009
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
%    Volum 45, Number 3, 2007, pages 1005-1034.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BNT_CONTOUR\n' );
  fprintf ( 1, '  Display contour or surface plots of the stochastic\n' );
  fprintf ( 1, '  diffusivity function defined by DIFFUSIVITY_2D_BNT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first plot uses uniform random values for OMEGA.\n' );
  fprintf ( 1, '  The second uses Gaussian (normal) random values.\n' );

  x = linspace ( -1.5, 0.0, 151 );
  y = linspace ( -0.4, 0.8, 121 );

  [ X, Y ] = meshgrid ( x, y );
%
%  Do a realization with uniform OMEGA.
%
  omega = rand ( 4, 1 );
  dc0 = 10;

  DC = diffusivity_2d_bnt ( dc0, omega, X, Y );

  figure ( 1 )
  surf ( X, Y, DC, 'EdgeColor', 'interp' )
  xlabel ( 'X' )
  ylabel ( 'Y' )
  zlabel ( 'DC(X,Y)' )
  title ( 'Stochastic diffusivity function, Uniform PDF' )
%
%  Do a realization with Gaussian OMEGA, mu = 0, sigma = 1.
%
  omega = randn ( 4, 1 );
  dc0 = 10;

  DC = diffusivity_2d_bnt ( dc0, omega, X, Y );

  figure ( 2 )
  surf ( X, Y, DC, 'EdgeColor', 'interp' )
  xlabel ( 'X' )
  ylabel ( 'Y' )
  zlabel ( 'DC(X,Y)' )
  title ( 'Stochastic diffusivity function, Gaussian PDF' )

  return
end
