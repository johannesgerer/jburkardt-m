function r8mat_transpose_test ( )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_TEST tests R8MAT_TRANSPOSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_TRANSPOSE_TEST\n' );
  fprintf ( 1, '  R8MAT_TRANSPOSE transposes an R8MAT.\n'; );

  a = r8mat_indicator ( m, n );
  r8mat_print ( m, n, a, '  Matrix A:' );

  at = r8mat_transpose ( m, n, a );
  r8mat_print ( n, m, at, '  Transposed matrix At:' );

  return
end