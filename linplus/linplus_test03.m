function linplus_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests R83_CR_FA, R83_CR_SL.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  For a real tridiagonal matrix,\n' );
  fprintf ( 1, '  using CYCLIC REDUCTION,\n' );
  fprintf ( 1, '  R83_CR_FA factors;\n' );
  fprintf ( 1, '  R83_CR_SL solves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  The matrix is NOT symmetric.%d\n' );
  fprintf ( 1, '\n' );
%
%  Set the matrix values.
%
  a(1,1) = 0.0E+00;
  for j = 2 : n
    a(1,j) = j;
  end

  for j = 1 : n
    a(2,j) = 4.0E+00 * j;
  end  

  for j = 1 : n - 1
    a(3,j) = j;
  end 
  a(3,n) = 0.0E+00;

  r83_print ( n, a, '  The matrix:' );
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
  a_cr = r83_cr_fa ( n, a );
%
%  Solve the linear system.
%
  x = r83_cr_sl ( n, a_cr, b );

  r8vec_print_some ( n, x, 10, '  Solution:' );

  return
end
