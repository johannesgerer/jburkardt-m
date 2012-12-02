function test07 ( )

%*****************************************************************************80
%
%% TEST07 tests HERMITE_INTERPOLANT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07:\n' );
  fprintf ( 1, '  HERMITE_INTERPOLANT_RULE\n' );
  fprintf ( 1, '  is given a set of N abscissas for a Hermite interpolant\n' );
  fprintf ( 1, '  and returns N pairs of quadrature weights\n' );
  fprintf ( 1, '  for function and derivative values at the abscissas.\n' );

  n = 3;
  a = 0.0;
  b = 10.0;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule over interval %f to %f\n' , a, b );
  fprintf ( 1, '\n' );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * sin ( x(i) ) + w(k+1) * cos ( x(i) );
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of SIN(X) = %f\n', q );

  n = 3;
  a = 0.0;
  b = 1.0;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule over interval %f to %f\n' , a, b );
  fprintf ( 1, '\n' );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * sin ( x(i) ) + w(k+1) * cos ( x(i) );
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of SIN(X) = %f\n', q );

  n = 11;
  a = 0.0;
  b = 10.0;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule over interval %f to %f\n' , a, b );
  fprintf ( 1, '\n' );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * sin ( x(i) ) + w(k+1) * cos ( x(i) );
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of SIN(X) = %f\n', q );

  n = 11;
  a = 0.0;
  b = 1.0;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule over interval %f to %f\n' , a, b );
  fprintf ( 1, '\n' );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * sin ( x(i) ) + w(k+1) * cos ( x(i) );
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of SIN(X) = %f\n', q );

  n = 11;
  a = 0.0;
  b = 1.0;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule over interval %f to %f\n' , a, b );
  fprintf ( 1, '\n' );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * 1 + w(k+1) * 0.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of 1 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) + w(k+1) * 1.0;
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * x(i) * x(i) + w(k+1) * 2.0 * x(i);
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of X^2 = %f\n', q );

  q = 0.0;
  k = 1;
  for i = 1 : n
    q = q + w(k) * sin ( x(i) ) + w(k+1) * cos ( x(i) );
    k = k + 2;
  end
  fprintf ( 1, '  Estimate integral of SIN(X) = %f\n', q );

  return
end
