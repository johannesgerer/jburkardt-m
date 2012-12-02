function cyclic_reduction_test01 ( )

%*****************************************************************************80
%
%% CYCLIC_REDUCTION_TEST01 tests C83_CR_FA, C83_CR_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLIC_REDUCTION_TEST01\n' );
  fprintf ( 1, '  C83_CR_FA factors a complex tridiagonal matrix;\n' );
  fprintf ( 1, '  C83_CR_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix values.
%
  a(1,1) = 0.0;
  for j = 2 : n
    a(1,j) = -1.0  - ( j - 1 ) * i;
  end

  for j = 1 : n
    a(2,j) = 2.0 + 2.0 * j * i;
  end

  for j = 1 : n - 1
    a(3,j) = -1.0 - ( j + 1 ) * i;
  end
  a(3,n) = 0.0;
%
%  Set the desired solution.
%
  for j = 1 : n
    x(j) = j + 10 * j * i;
  end
%
%  Compute the corresponding right hand side.
%
  b = c83_mxv ( n, a, x );
%
%  Factor the matrix.
%
  a_cr = c83_cr_fa ( n, a );
%
%  Solve the linear system.
%
  x = c83_cr_sl ( n, a_cr, b );

  c8vec_print ( n, x, '  Solution:' );

  return
end
