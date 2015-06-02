function r8mat_fs_test ( )

%*****************************************************************************80
%
%% R8MAT_FS_TEST tests R8MAT_FS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2013
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  nb = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_FS_TEST\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8MAT_FS factors and solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
%
%  Set the desired solutions.
%
  x(1:n,1) = 1:n;

  b(1:n,1) = a(1:n,1:n) * x(1:n,1);
%
%  Factor and solve the system.
%
  x = r8mat_fs ( n, a, b );
 
  r8vec_print ( n, x, '  Solution:' );

  return
end
