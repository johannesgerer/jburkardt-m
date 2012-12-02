function cyclic_reduction_test02 ( )

%*****************************************************************************80
%
%% CYCLIC_REDUCTION_TEST02 tests R83_CR_FA, R83_CR_SLS.
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
  n = 5;
  nb = 2;
  debug = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLIC_REDUCTION_TEST02\n' );
  fprintf ( 1, '  R83_CR_FA factors a real tridiagonal matrix;\n' );
  fprintf ( 1, '  R83_CR_SLS solves 1 or more systems.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Demonstrate multiple system solution method.\n' );
%
%  Set the matrix.
%
  a(1,1) = 0.0;
  a(1,2:n) = -1.0;

  a(2,1:n) = 2.0;

  a(3,1:n-1) = -1.0;
  a(3,n) = 0.0;

  if ( debug )
    r83_print ( n, a, '  Input matrix:' );
  end
%
%  Factor the matrix once.
%
  a_cr = r83_cr_fa ( n, a );

  if ( debug )
    r83_print ( 2 * n + 1, a_cr, '  Cyclic reduction factor information:' );
  end
%
%  Solve 2 systems simultaneously.
%
  b(1:n-1,1) = 0.0;
  b(n,1) = n + 1;

  b(1,2) = 1.0;
  b(2:n-1,2) = 0.0;
  b(n,2) = 1.0;
%
%  Solve the linear systems.
%
  x = r83_cr_sls ( n, a_cr, nb, b );

  r8mat_print_some ( n, nb, x, 1, 1, 10, nb, '  Solutions:' );

  return
end
