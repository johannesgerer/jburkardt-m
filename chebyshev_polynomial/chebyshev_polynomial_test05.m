function chebyshev_polynomial_test05 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST05 tests T_QUADRATURE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST05:\n' );
  fprintf ( 1, '  T_QUADRATURE_RULE computes the quadrature rule\n' );
  fprintf ( 1, '  associated with T(n,x);\n' );

  n = 7;
  [ x, w ] = t_quadrature_rule ( n );

  r8vec2_print ( n, x, w, '      X            W' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule to estimate:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Q = Integral ( -1 <= X <= +1 ) X^E / sqrt ( 1-x^2) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   E       Q_Estimate      Q_Exact\n' );
  fprintf ( 1, '\n' );

  for e = 0 : 2 * n - 1
    if ( e == 0 )
      f = ones ( n, 1 );
    else
      f(1:n) = x(1:n).^e;
    end
    q = w' * f;
    q_exact = t_integral ( e );
    fprintf ( 1, '  %2d  %14g  %14g\n', e, q, q_exact );
  end

  return
end
