function line_cvt_lloyd_test03 ( )

%*****************************************************************************80
%
%% LINE_CVT_LLOYD_TEST03 tests the unconstrained computation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_CVT_LLOYD_TEST03:\n' );
  fprintf ( 1, '  Test the unconstrained computation.\n' );
  fprintf ( 1, '  SORT the random initial values before use.\n' );

  n = 25;
  a = 0.0;
  b = 1.0;
  it_num = 200;
  x = a + ( b - a ) * rand ( n, 1 );
  x = sort ( x );
  header = 'test03';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use %d points in the interval [%g,%g]\n', n, a, b );
  fprintf ( 1, '  Take %d iterations.\n', it_num );
  fprintf ( 1, '  Call this calculation "%s"\n', header );
  fprintf ( 1, '  Expect a uniform spacing of %g\n', ( b - a ) / ( n - 1 ) );

  x = line_cvt_lloyd ( n, a, b, it_num, header, x );

  return
end
