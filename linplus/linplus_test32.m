function linplus_test32 ( )

%*****************************************************************************80
%
%% TEST32 tests R8GE_NP_FA, R8GE_NP_SL.
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
  fprintf ( 1, 'TEST32\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_NP_FA computes the LU factors without pivoting,\n' );
  fprintf ( 1, '  R8GE_NP_SL solves factored systems.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( n, n, seed );
%
%  Set the desired solution.
%
  x(1:n) = 1.0E+00;
%
%  Compute the corresponding right hand side.
%
  b = r8ge_mxv ( n, n, a, x );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8ge_np_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST32 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_NP_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  job = 0;
  x = r8ge_np_sl ( n, a_lu, b, job );
 
  r8vec_print_some ( n, x, 1, 10, '  Solution:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 0;
  b = r8ge_np_ml ( n, a_lu, x, job );
%
%  Solve the system
%
  job = 0;
  x = r8ge_np_sl ( n, a_lu, b, job );

  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 1;
  b = r8ge_np_ml ( n, a_lu, x, job );
%
%  Solve the system
%
  job = 1;
  x = r8ge_np_sl ( n, a_lu, b, job );

  r8vec_print ( n, x, '  Solution of transposed system:' );

  return
end

