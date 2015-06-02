function qwv_test02 ( )

%*****************************************************************************80
%
%% QWV_TEST02 tests QWV for a Clenshaw-Curtis rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2014
%
%  Author:
%
%    John Burkardt
%
  a =  -1.0;
  b = +1.0;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QWV_TEST02\n' );
  fprintf ( 1, '  Use the Vandermonde procedure to compute the\n' );
  fprintf ( 1, '  quadrature weights for a Clenshaw-Curtis rule.\n' );
  fprintf ( 1, '  Order N = %d\n', n );
  fprintf ( 1, '  Interval is [%g,%g]\n', a, b );
%
%  Set the points.
%
  x = zeros ( n, 1 );

  for i = 1 : n

    theta =  ( n - i ) * pi / ( n - 1 );

    x(i) = ( ( 1 - cos ( theta ) ) * a   ...
           + ( 1 + cos ( theta ) ) * b ) ...
           /   2.0;

  end

  r8vec_print ( n, x, '  Abscissas:' );
%
%  Determine the corresponding weights.
%
  w = qwv ( n, a, b, x );

  r8vec_print ( n, w, '  Weights:' )

  return
end
