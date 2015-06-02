function tno_test ( )

%*****************************************************************************80
%
%% TNO_TEST tests TNO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TNO_TEST:\n' );
  fprintf ( 1, '  TNO is given a level L, and returns points and weights\n' );
  fprintf ( 1, '  of a Truncated Normal Odd (TNO) quadrature rule.\n' );

  l = 5;
  n = tno_order ( l );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level L = %d\n', l );
  fprintf ( 1, '  Order N = %d\n', n );

  [ x, w ] = tno ( l );

  r8vec2_print ( n, x, w, '  Points and weights:' );

  return
end
