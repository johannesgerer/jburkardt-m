function linplus_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests R83_NP_FS.
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
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  R83_NP_FS factors and solves a tridiagonal\n' );
  fprintf ( 1, '    linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix elements.
%
  [ a, seed ] = r83_random ( n, seed );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute b = A * x.
%
  b = r83_mxv ( n, a, x );
%
%  Wipe out the solution.
%
  x(1:n) = 0.0;
%
%  Solve the system.
%
  x = r83_np_fs ( n, a, b );

  r8vec_print ( n, x, '  Solution:' );

  return
end
