function sandia_rules_test36 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST36 tests HERMITE_INTERPOLANT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST36:\n' );
  fprintf ( 1, '  HERMITE_INTERPOLANT_RULE\n' );
  fprintf ( 1, '  is given a set of N abscissas for a Hermite interpolant\n' );
  fprintf ( 1, '  and returns N pairs of quadrature weights\n' );
  fprintf ( 1, '  for function and derivative values at the abscissas.\n' );
%
%  1: Behavior with increasing N.
%
  a = 0.0;
  b = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Observe behavior of quadrature weights for increasing N\n' );
  fprintf ( 1, '  We are working in %f <= X <= %f\n', a, b );

  for n = 3 : 2 : 11

    x = linspace ( a, b, n );
    w = hermite_interpolant_rule ( n, a, b, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I       X               W(F(X))        W(F''(X))\n' );
    fprintf ( 1, '\n' );
    k = 1;
    for i = 1 : n
      fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, x(i), w(k), w(k+1) );
      k = k + 2;
    end

  end
%
%  2: Integral estimates with equally spaced points.
%
  a = -5.0;
  b = 5.0;
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the rule with N = 11 to estimate integrals.\n' );
  fprintf ( 1, '  Points are equally spaced.\n' );
  fprintf ( 1, '  We are working in %f <= X <= %f\n', a, b );

  x = linspace ( a, b, n );
  w = hermite_interpolant_rule ( n, a, b, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       X               W(F(X))        W(F''(X))\n' );
  fprintf ( 1, '\n' );
  k = 1;
  for i = 1 : n
    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, x(i), w(k), w(k+1) );
    k = k + 2;
  end

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate integral of 1 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) / ( 1.0 + x(i) * x(i) ) - w(k+1) * 2.0 * x(i) / ( 1.0 + x(i) * x(i) )^2;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1/(1+x^2) = %g14.6\n', q );
%
%  3: Integral estimates with Chebyshev spaced points.
%
  a = -5.0;
  b = 5.0;
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the rule with N = 11 to estimate integrals.\n' );
  fprintf ( 1, '  Points are Chebyshev spaced.\n' );
  fprintf ( 1, '  We are working in %f <= X <= %f\n', a, b );

  x = r8vec_chebyshev ( n, a, b );
  w = hermite_interpolant_rule ( n, a, b, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       X               W(F(X))        W(F''(X))\n' );
  fprintf ( 1, '\n' );
  k = 1;
  for i = 1 : n
    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, x(i), w(k), w(k+1) );
    k = k + 2;
  end

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate integral of 1 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) / ( 1.0 + x(i) * x(i) ) - w(k+1) * 2.0 * x(i) / ( 1.0 + x(i) * x(i) )^2;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1/(1+x^2) = %g14.6\n', q );
%
%  4: Integral estimates with Legendre spaced points.
%
  a = -5.0;
  b = 5.0;
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the rule with N = 11 to estimate integrals.\n' );
  fprintf ( 1, '  Points are Legendre spaced.\n' );
  fprintf ( 1, '  We are working in %f <= X <= %f\n', a, b );

  x = r8vec_legendre ( n, a, b );
  w = hermite_interpolant_rule ( n, a, b, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       X               W(F(X))        W(F''(X))\n' );
  fprintf ( 1, '\n' );
  k = 1;
  for i = 1 : n
    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, x(i), w(k), w(k+1) );
    k = k + 2;
  end

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate integral of 1 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %g14.6\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) / ( 1.0 + x(i) * x(i) ) - w(k+1) * 2.0 * x(i) / ( 1.0 + x(i) * x(i) )^2;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1/(1+x^2) = %g14.6\n', q );
%
%  5: Integral estimates with Chebyshev spaced points on 1/(1+x^2), increasing N.
%
  a = -5.0;
  b = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Approximate integral of 1/(1+x^2) with increasing N.\n' );
  fprintf ( 1, '  Points are Chebyshev spaced.\n' );
  fprintf ( 1, '  We are working in %f <= X <= %f\n', a, b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     Estimate         Error\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 11

    x = r8vec_chebyshev ( n, a, b );
    w = hermite_interpolant_rule ( n, a, b, x );
    q = 0.0;
    k = 1;
    for i = 1 : n
      q = q + w(k) / ( 1.0 + x(i) * x(i) ) ...
            - w(k+1) * 2.0 * x(i) / ( 1.0 + x(i) * x(i) )^2;
      k = k + 2;
    end

    exact = atan ( b ) - atan ( a );
    error = abs ( q - exact );
    fprintf ( 1, '  %4d  %14g  %14g\n', n, q, error );

  end
%
%  6: Integral estimates, with Chebyshev spaced points, for monomials, using N = 11.
%
  a = -1.0;
  b = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute integral estimates for monomials X^0 through X^15.\n' );
  fprintf ( 1, '  Use N = 5, 9, 13, 17, 21 point rules.\n' );
  fprintf ( 1, '  Points are Chebyshev spaced.\n' );
  fprintf ( 1, '  We are working in %g <= X <= %g\n', a, b );

  for n = 5 : 4 : 21

    x = r8vec_chebyshev ( n, a, b );
    w = hermite_interpolant_rule ( n, a, b, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Estimates are made using N = %d\n', n );
    fprintf ( 1, '  F(X)         Integral        Estimate           Error\n' );
    fprintf ( 1, '\n' );

    for e = 0 : 15
      q = 0.0;
      k = 1;
      for i = 1 : n
        if ( e == 0 )
          q = q + w(k);
        else
          q = q + w(k) * x(i)^e + w(k+1) * e * x(i)^(e-1);
        end
        k = k + 2;
      end
      exact = ( b^(e+1) - a^(e+1) ) / ( e + 1 );
      fprintf ( 1, '  X^%7d  %14.6g  %14.6g  %14.6g\n', e, exact, q, abs ( exact - q ) );
    end

    q = 0.0;
    k = 1;
    for i = 1 : n
      q = q + w(k) / ( 1.0 + x(i)^2 ) - w(k+1) * 2.0 * x(i) / ( 1.0 + x(i)^2 )^2;
      k = k + 2;
    end
    exact = atan ( b ) - atan ( a );
    fprintf ( 1, '  X^%7d  %14.6g  %14.6g  %14.6g\n', e, exact, q, abs ( exact - q ) );

  end

  return
end
