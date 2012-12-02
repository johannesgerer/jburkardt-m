function linplus_test34 ( )

%*****************************************************************************80
%
%% TEST34 tests R8GE_FS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST34\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_FS factors and solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( n, n, seed );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8ge_mxv ( n, n, a, x );
%
%  Factor and solve the system.
%
  x = r8ge_fs ( n, a, b );
 
  r8vec_print ( n, x, '  Solution:' );

  return
end
