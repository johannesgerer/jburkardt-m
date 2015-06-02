function qwv_2d_test01 ( )

%*****************************************************************************80
%
%% QWV_2D_TEST01 tests QWV_2D for a trio of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2014
%
%  Author:
%
%    John Burkardt
%
  a = -1.0;
  b = +1.0;
  c = -1.0;
  d = +1.0;

  t = 1;
  n = ( ( t + 1 ) * ( t + 2 ) ) / 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QWV_2D_TEST01:\n' );
  fprintf ( 1, '  Compute the weights associated with an interpolatory\n' );
  fprintf ( 1, '  quadrature rule defined by N=(T+1)*(T+2)/2 points,\n' );
  fprintf ( 1, '  exact for polynomials of total degree T or less.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Degree T = %d\n', t );
  fprintf ( 1, '  Number of points N = %d\n', n );
  fprintf ( 1, '  X Interval = [%g,%g]\n', a, b );
  fprintf ( 1, '  Y Interval = [%g,%g]\n', c, d );
%
%  Set the points.
%
  x(1) =  1.0;
  y(1) = -1.0;
  x(2) =  1.0;
  y(2) =  1.0;
  x(3) = -1.0;
  y(3) =  1.0;

  r8vec2_print ( n, x, y, '  Abscissas:' )
%
%  Compute the weights.
%
  w = qwv_2d ( t, n, a, b, c, d, x, y );

  r8vec_print ( n, w, '  Weights:' );

  return
end
