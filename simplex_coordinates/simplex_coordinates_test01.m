function simplex_coordinates_test01 ( n )

%*****************************************************************************80
%
%% SIMPLEX_COORDINATES_TEST01 calls SIMPLEX_COORDINATES1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_COORDINATES_TEST01\n' );
  fprintf ( 1, '  Call SIMPLEX_COORDINATES1\n' );

  x = simplex_coordinates1 ( n );

  r8mat_transpose_print ( n, n + 1, x, '  Simplex vertex coordinates:' );

  side = sqrt ( sum ( ( x(1:n,1) - x(1:n,2) ).^2 ) );

  volume = simplex_volume ( n, x );

  volume2 = sqrt ( n + 1 ) / r8_factorial ( n ) / sqrt ( 2.0^n ) * side^n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Side length =     %f\n', side );
  fprintf ( 1, '  Volume =          %f\n', volume );
  fprintf ( 1, '  Expected volume = %f\n', volume2 );

  xtx = x' * x;

  r8mat_transpose_print ( n + 1, n + 1, xtx, '  Dot product matrix:' );

  return
end
