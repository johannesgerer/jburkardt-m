function c8mat_norm_fro_test ( )

%*****************************************************************************80
%
%% C8MAT_NORM_FRO_TEST tests C8MAT_NORM_FRO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2015
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8MAT_NORM_FRO_TEST\n' );
  fprintf ( 1, '  C8MAT_NORM_FRO returns the Frobenius norm of a C8MAT.\n' );

  a = c8mat_indicator ( m, n );

  c8mat_print ( m, n, a, '  The indicator matrix:' );

  value = c8mat_norm_fro ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm = %g\n', value );

  return
end
