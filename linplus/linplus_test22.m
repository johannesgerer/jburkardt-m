function linplus_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests R8GB_FA, R8GB_SL.
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
  m = 5;
  n = m;
  ml = 1;
  mu = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_FA computes the PLU factors.\n' );
  fprintf ( 1, '  R8GB_SL solves a factored linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of matrix rows M    = %d\n', m );
  fprintf ( 1, '  Number of matrix columns N = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML         = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU         = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );

  r8gb_print ( m, n, ml, mu, a, '  The banded matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8gb_mxv ( m, n, ml, mu, a, x );
%
%  Factor the matrix.
%
  [ alu, pivot, info ] = r8gb_fa ( n, ml, mu, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST022 - Fatal error!\n' );
    fprintf ( 1, '  R8GB_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return;
  end
%
%  Solve the linear system.
%
  job = 0;
  x = r8gb_sl ( n, ml, mu, alu, pivot, b, job );

  r8vec_print ( n, x, '  Solution to A*x=b:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 1;
  b = r8gb_ml ( n, ml, mu, alu, pivot, x, job );

  r8vec_print ( n, b, '  Right hand side of transposed system:' );
%
%  Solve the linear system.
%
  job = 1;
  x = r8gb_sl ( n, ml, mu, alu, pivot, b, job );

  r8vec_print ( n, x, '  Solution to A''x=b:' );

  return
end
