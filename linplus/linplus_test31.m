function linplus_test31 ( )

%*****************************************************************************80
%
%% TEST31 tests R8GE_FA, R8GE_SL.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST31\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_FA computes the LU factors,\n' );
  fprintf ( 1, '  R8GE_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( n, n, seed );

  r8ge_print ( n, n, a, '  The matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8ge_mxv ( n, n, a, x );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8ge_fa ( n, a );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST31 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Display the gory details.
%
  r8ge_print ( n, n, a_lu, '  The compressed LU factors:' );

  i4vec_print ( n, pivot, '  The pivot vector P:' );
%
%  Solve the linear system.
%
  job = 0;
  x = r8ge_sl ( n, a_lu, pivot, b, job );

  r8vec_print ( n, x, '  Solution:' );

  return
end
