function linplus_test587 ( )

%*****************************************************************************80
%
%% TEST587 tests R8STO_SL.
%
%  Discussion:
%
%    Modifications to this test routine were suggested by Zhang Yunong
%    of the EEE Department of Strathclyde University.
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

  a = [ 1.0, 0.5, 0.2, 0.1, 0.05 ];
  b(1:n) = 2 * ( rand ( 1, n ) - 0.5 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST587\n' );
  fprintf ( 1, '  R8STO_SL solves a positive definite symmetric \n' );
  fprintf ( 1, '  Toeplitz system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  r8sto_print ( n, a, '  The symmetric Toeplitz matrix A:' );

  r8vec_print ( n, b, '  The right hand side vector B:' );

  x(1:n) = r8sto_sl ( n, a, b );

  r8vec_print ( n, x, '  The solution X:' );

  r(1:n) = r8sto_mxv ( n, a, x ) - b(1:n);

  err_max = norm ( r(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Norm of residual error A * X - B = %e\n', err_max );

  return
end
