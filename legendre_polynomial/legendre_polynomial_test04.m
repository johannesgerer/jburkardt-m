function legendre_polynomial_test04 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST04 tests P_QUADRATURE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST04:\n' );
  fprintf ( 1, '  P_QUADRATURE_RULE computes the quadrature rule\n' );
  fprintf ( 1, '  associated with P(n,x)\n' );

  n = 5;
  [ x, w ] = p_quadrature_rule ( n );

  r8vec2_print ( n, x, w,  '      X            W' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule to estimate:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Q = Integral ( -1 <= X < +1 ) X^E dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   E       Q_Estimate      Q_Exact\n' );
  fprintf ( 1, '\n' );

  for e = 0 : 2 * n - 1
    if ( e == 0 )
      f = ones ( n, 1 );
    else
      f = x .^ e;
    end
    q = w' * f;
    q_exact = p_integral ( e );
    fprintf ( 1, '  %2d  %14g  %14g\n', e, q, q_exact );
  end

  return
end
