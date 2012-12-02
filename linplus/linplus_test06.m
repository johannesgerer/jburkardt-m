function linplus_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests R83_NP_FA, R83_NP_SL.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  For a tridiagonal matrix that can be factored\n' );
  fprintf ( 1, '    with no pivoting,\n' );
  fprintf ( 1, '  R83_NP_FA factors;\n' );
  fprintf ( 1, '  R83_NP_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r83_random ( n, seed );

  r83_print ( n, a, '  The tridiagonal matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r83_mxv ( n, a, x );
  x(1:n) = 0.0E+00;
%
%  Factor the matrix.
%
  [ a_lu, info ] = r83_np_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST06 - Fatal error!\n' );
    fprintf ( 1, '  The test matrix is singular.\n' );
    return;
  end
%
%  Solve the linear system.
%
  job = 0;
  x = r83_np_sl ( n, a_lu, b, job );

  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side, using the factored matrix.
%
  job = 1;
  b = r83_np_ml ( n, a_lu, x, job );
%
%  Solve the linear system.
%
  job = 1;
  x = r83_np_sl ( n, a_lu, b, job );

  r8vec_print ( n, x, '  Solution to tranposed system:' );

  return
end
