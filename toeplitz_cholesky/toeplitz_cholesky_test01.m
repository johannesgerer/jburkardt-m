function toeplitz_cholesky_test01 ( )

%*****************************************************************************80
%
%% TOEPLITZ_CHOLESKY_TEST01 tests TOEPLITZ_CHOLESKY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEPLITZ_CHOLESKY_TEST01\n' );
  fprintf ( 1, '  Test the factorization of a simple example.\n' );
%
%  TOEPLITZ_CHOLESKY_UPPER.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEPLITZ_CHOLESKY_UPPER:\n' );

  n = 3;
  a = [ 1.0,   0.5, -0.375; ...
        0.5,   1.0,  0.5; ...
       -0.375, 0.5,  1.0 ];

  r8mat_print ( n, n, a, '  Toeplitz matrix A:' );

  r = toeplitz_cholesky_upper ( n, a );
  r8mat_print ( n, n, r, '  Computed upper Cholesky factor R:' );

  b = r' * r;
  r8mat_print ( n, n, b, '  Product R''R:' );
%
%  TOEP_CHOLESKY_UPPER.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEP_CHOLESKY_UPPER:\n' );

  n = 3;
  g = [ 1.0,   0.5, -0.375; ...
        0.0,   0.5, -0.375 ];

  r8mat_print ( 2, n, g, '  Compressed Toeplitz matrix G:' );

  r = toep_cholesky_upper ( n, g );
  r8mat_print ( n, n, r, '  Computed upper Cholesky factor R:' );

  b = r' * r;
  r8mat_print ( n, n, b, '  Product R''R:' );
%
%  TOEPLITZ_CHOLESKY_LOWER.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEPLITZ_CHOLESKY_LOWER:\n' );

  n = 3;
  a = [ 1.0,   0.5, -0.375; ...
        0.5,   1.0,  0.5; ...
       -0.375, 0.5,  1.0 ];

  r8mat_print ( n, n, a, '  Toeplitz matrix A:' );

  l = toeplitz_cholesky_lower ( n, a );
  r8mat_print ( n, n, l, '  Computed lower Cholesky factor L:' );

  b = l * l';
  r8mat_print ( n, n, b, '  Product LL'':' );
%
%  TOEP_CHOLESKY_LOWER.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEP_CHOLESKY_LOWER:\n' );

  n = 3;
  g = [ 1.0,   0.5, -0.375; ...
        0.0,   0.5, -0.375 ];

  r8mat_print ( 2, n, g, '  Compressed Toeplitz matrix G:' );

  l = toep_cholesky_lower ( n, g );
  r8mat_print ( n, n, l, '  Computed lower Cholesky factor L:' );

  b = l * l';
  r8mat_print ( n, n, b, '  Product LL'':' );

  return
end

