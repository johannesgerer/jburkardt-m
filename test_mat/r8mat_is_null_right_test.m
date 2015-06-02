function r8mat_is_null_right_test ( )

%*****************************************************************************80
%
%% R8MAT_IS_NULL_RIGHT_TEST tests R8MAT_IS_NULL_RIGHT.
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
  fprintf ( 1, 'R8MAT_IS_NULL_RIGHT_TEST:\n' );
  fprintf ( 1, '  R8MAT_IS_NULL_RIGHT tests whether the N vector X\n' );
  fprintf ( 1, '  is a right null vector of A, that is, A*x=0.\n' );

  r8mat_print ( m, n, a, '  Matrix A:' );
  r8vec_print ( n, x, '  Vector X:' );

  enorm = r8mat_is_null_right ( m, n, a, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of A*x is %g\n', enorm );

  return
end
