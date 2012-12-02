function linplus_test585 ( )

%*****************************************************************************80
%
%% TEST585 tests R8STO_MXV, R8STO_YW_SL.
%
%  Discussion:
%
%    Some changes to this routine were suggested by Yunong Zhang
%    of the EEE Department of the University of Strathclyde.
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
%
%  Note that R must contain N+1 entries, since the first entry is always 1.
%
  r = [ 1.0E+00, 0.5E+00, 0.2E+00, 0.1E+00, 0.05E+00, 0.02E+00 ];

  a(1:n) = r(1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST585\n' );
  fprintf ( 1, '  R8STO_YW_SL solves the Yule-Walker equations for a\n' );
  fprintf ( 1, '  symmetric Toeplitz system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  r8sto_print ( n, a, '  The symmetric Toeplitz matrix A:' );

  b(1:n) = -r(2:n+1);
  r8vec_print ( n, b, '  The right hand side, B:' );
%
%  The Yule-Walker solver is going to solve A*X = -B.
%  In order to have this routine solve A*X = B, we need to negate B 
%  when we pass it to the Yule-Walker solver.
%
  x(1:n) = r8sto_yw_sl ( n, -b );

  r8vec_print ( n, x, '  The computed solution, X:' );

  b(1:n) = r8sto_mxv ( n, a, x ) - b(1:n);

  r8vec_print ( n, b, '  The residual A*X - B:' );

  return
end
