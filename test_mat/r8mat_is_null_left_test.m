function r8mat_is_null_left_test ( )

%*****************************************************************************80
%
%% R8MAT_IS_NULL_LEFT_TEST tests R8MAT_IS_NULL_LEFT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2015
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 3;
  a = [ ...
    1.0, 2.0, 3.0; ...
    4.0, 5.0, 6.0; ...
    7.0, 8.0, 9.0 ];
  x = [ 1.0; -2.0; 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_NULL_LEFT_TEST:\n' );
  fprintf ( 1, '  R8MAT_IS_NULL_LEFT tests whether the M vector X\n' );
  fprintf ( 1, '  is a left null vector of A, that is, x''*A=0.\n' );

  r8mat_print ( m, n, a, '  Matrix A:' );
  r8vec_print ( m, x, '  Vector X:' );

  enorm = r8mat_is_null_left ( m, n, a, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of X''*A is %g\n', enorm );

  return
end
