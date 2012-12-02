function linplus_test48 ( )

%*****************************************************************************80
%
%% TEST48 tests R8PBU_ML.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  mu = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST48\n' );
  fprintf ( 1, '  R8PBU_ML computes A*x\n' );
  fprintf ( 1, '    where A has been factored by R8PBU_FA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8pbu_random ( n, mu, seed );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8pbu_mxv ( n, mu, a, x );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8pbu_fa ( n, mu, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  R8PBU_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
  b2 = r8pbu_ml ( n, mu, a_lu, x );

  r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );

  return
end
