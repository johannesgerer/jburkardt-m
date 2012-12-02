function cyclic_reduction_test03 ( )

%*****************************************************************************80
%
%% CYCLIC_REDUCTION_TEST03 tests R83_CR_FA, R83_CR_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  debug = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLIC_REDUCTION_TEST03\n' );
  fprintf ( 1, '  For a real tridiagonal matrix,\n' );
  fprintf ( 1, '  using CYCLIC REDUCTION,\n' );
  fprintf ( 1, '  R83_CR_FA factors;\n' );
  fprintf ( 1, '  R83_CR_SL solves 1 system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  The matrix is NOT symmetric.\n' );
%
%  Set the matrix values.
%
  a(1,1) = 0.0;
  for j = 2 : n
    a(1,j) = j;
  end

  for j = 1 : n
    a(2,j) = 4 * j;
  end

  for j = 1 : n - 1
    a(3,j) = j;
  end
  a(3,n) = 0.0;

  if ( debug )
    r83_print ( n, a, '  The matrix:' );
  end
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r83_mxv ( n, a, x );

  if ( debug )
    r8vec_print ( n, b, '  The right hand side:' );
  end

  x(1:n) = 0.0;
%
%  Factor the matrix.
%
  a_cr = r83_cr_fa ( n, a );

  if ( debug )
    r83_print ( 2 * n + 1, a_cr, '  The factor information:' );
  end
%
%  Solve the linear system.
%
  x = r83_cr_sl ( n, a_cr, b );

  r8vec_print ( n, x, '  The solution:' );

  return
end
