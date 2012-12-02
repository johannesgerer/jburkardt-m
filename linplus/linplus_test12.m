function linplus_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests R85_NP_FS.
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
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  R85_NP_FS factors and solves a pentadiagonal\n' );
  fprintf ( 1, '    linear system, with no pivoting.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix to a random value.
%
  [ a, seed ] = r85_random ( n, seed );

  r85_print ( n, a, '  The pentadiagonal matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute b = A * x.
%
  b = r85_mxv ( n, a, x );

  r8vec_print ( n, b, '  The right hand side:' );
%
%  Wipe out the solution.
%
  x(1:n) = 0.0E+00;
%
%  Solve the system.
%
  x = r85_np_fs ( n, a, b );

  r8vec_print ( n, x, '  Solution:' );

  return
end
