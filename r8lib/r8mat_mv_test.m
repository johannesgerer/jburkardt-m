function r8mat_mv_test ( )

%*****************************************************************************80
%
%% R8MAT_MV_TEST tests R8MAT_MV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 2;

  a = [ ...
    1.0, 2.0, 3.0, 4.0; ...
    1.0, 1.0, 1.0, 1.0 ]';
  x = [ 1.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_MV_TEST\n' );
  fprintf ( 1, '  R8MAT_MV computes a matrix-vector product b = A * x;\n' );

  b = r8mat_mv ( m, n, a, x );

  r8mat_print ( m, n, a, '  A:' );
  r8vec_print ( n, x, '  X:' );
  r8vec_print ( m, b, '  B = A*X:' );

  return
end
