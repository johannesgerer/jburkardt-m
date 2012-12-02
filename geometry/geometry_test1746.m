function geometry_test1746 ( )

%*****************************************************************************80
%
%% TEST1746 tests R8MAT_INVERSE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  a = [ ...
    3.0, 2.0, 0.0; ...
    2.0, 2.0, 1.0; ...
    1.0, 1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1746\n' );
  fprintf ( 1, '  R8MAT_INVERSE_3D inverts a 3 by 3 matrix.\n' );

  r8mat_print ( n, n, a, '  Matrix A:' );

  [ b, det ] = r8mat_inverse_3d ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of A is %f\n', det );

  r8mat_print ( n, n, b, '  Inverse matrix B:' );

  return
end
