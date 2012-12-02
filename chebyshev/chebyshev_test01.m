function chebyshev_test01 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_TEST01 tests CHEBYSHEV_COEFFICIENTS and CHEBYSHEV_INTERPOLANT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_TEST01\n' );
  fprintf ( 1, '  CHEBYSHEV_COEFFICIENTS computes the coefficients of the\n' );
  fprintf ( 1, '  Chebyshev interpolant.\n' );
  fprintf ( 1, '  CHEBYSHEV_INTERPOLANT evaluates the interpolant.\n' );

  n = 5;
  a = -1.0;
  b = +1.0;

  c = chebyshev_coefficients ( a, b, n, @f1 );

  x = chebyshev_zeros ( n );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );

  fx = f1 ( x );
  m = n;
  fc = chebyshev_interpolant ( a, b, n, c, m, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) is a trig function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(I)        F(X)       C(F)(X)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i), c(i), fx(i), fc(i) );
  end
%
%  Try a variant interval.
%
  n = 5;
  a = 0.0;
  b = +3.0;

  c = chebyshev_coefficients ( a, b, n, @f1 );

  x = chebyshev_zeros ( n );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );

  fx = f1 ( x );
  m = n;
  fc = chebyshev_interpolant ( a, b, n, c, m, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Consider the same F(X), but now over [0,3]:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(I)        F(X)       C(F)(X)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i), c(i), fx(i), fc(i) );
  end
%
%  Try a higher order.
%
  n = 10;
  a = -1.0;
  b = +1.0;

  c = chebyshev_coefficients ( a, b, n, @f1 );

  x = chebyshev_zeros ( n );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );

  fx = f1 ( x );
  m = n;
  fc = chebyshev_interpolant ( a, b, n, c, m, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Consider the same F(X), but now with higher order:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(I)        F(X)       C(F)(X)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i), c(i), fx(i), fc(i) );
  end
%
%  Try a polynomial.
%
  n = 10;
  a = -1.0;
  b = +1.0;

  c = chebyshev_coefficients ( a, b, n, @f3 );

  x = chebyshev_zeros ( n );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );

  fx = f3 ( x );
  m = n;
  fc = chebyshev_interpolant ( a, b, n, c, m, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) is a degree 4 polynomial:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(I)        F(X)       C(F)(X)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i), c(i), fx(i), fc(i) );
  end
%
%  Try a function with decaying behavior.
%
  n = 10;
  a = -1.0;
  b = +1.0;

  c = chebyshev_coefficients ( a, b, n, @f2 );

  x = chebyshev_zeros ( n );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );

  fx = f2 ( x );
  m = n;
  fc = chebyshev_interpolant ( a, b, n, c, m, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The polynomial approximation to F(X) decays:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(I)        F(X)       C(F)(X)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i), c(i), fx(i), fc(i) );
  end

  return
end
