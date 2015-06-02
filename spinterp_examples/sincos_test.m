function sincos_test ( )

%*****************************************************************************80
%
%% SINCOS_TEST demonstrates SPINTERP on a function of a 2D argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINCOS_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of SPINTERP to construct an\n' );
  fprintf ( 1, '  interpolant to the function z(x,y) = sin(x) + cos(y)\n' );
%
%  We need to have the spinterp program in the Matlab path.
%
  addpath ( '../spinterp' );
%
%  To alter the default spinterp options, we must call spset().
%  We want to use a grid that uses Chebyshev spacing, and we
%  want to use at least 5 levels of interpolation.
%
  OPTIONS = spset ( 'GridType', 'Chebyshev', ...
                    'MinDepth', 5 );
%
%  Now we call spvals() to set up in C the data defining 
%  the sparse grid interpolant.  C is a Matlab structure.
%
  m = 2;

  box = [ 0.0, pi; ...
          0.0, pi ];

  c = spvals ( @sincos_f, m, box, OPTIONS );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the sparse interpolant structure:\n' );
  fprintf ( 1, '\n' );

  c
%
%  Just for information, print out the grid points added at each level.
%
  l_max = 4;
  for l = 0 : l_max
    fprintf ( 1, '\n' );
    label = sprintf ( '  Grid points added at level %d', l );
    x = spgrid ( l, m, OPTIONS );
    [ n, ~ ] = size ( x );
    r8mat_print ( n, m, x, label );
  end

  figure ( 1 )
  l_max = 5;
  plotgrid ( l_max, m );
  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<---Y--->' );
  title ( sprintf ( 'Spinterp Chebyshev Grid of level %d', l_max ) )

  filename = 'sincos_grid.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid plot stored as "%s".\n', filename );
%
%  Evaluate the interpolant at some random points in the region.
%
  n = 25;
  x = pi * rand ( 1, n );
  y = pi * rand ( 1, n );
  z = spinterp ( c, x, y );

  e = max ( abs ( z - sincos_f ( x, y ) ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum approximation error at %d random points is %g\n', n, e );
%
%  Display plots of the function and interpolant.
%
  figure ( 2 )
  subplot ( 1, 2, 1 );
  ezmesh ( @sincos_f, [ 0.0, pi ] );
  title ( 'z(x,y) = sin(x) + cos(y)' );

  subplot ( 1, 2, 2 );
  ezmesh ( @(x,y) spinterp ( c, x, y ), [ 0, pi ] );
  title ( 'Sparse grid interpolant' );

  filename = 'sincos_interp.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolant plot stored as "%s".\n', filename );

  rmpath ( '../spinterp' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINCOS_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
