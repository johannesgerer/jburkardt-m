function laguerre_polynomial_test04 ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST04 tests L_QUADRATURE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST04:\n' );
  fprintf ( 1, '  L_QUADRATURE_RULE computes the quadrature rule\n' );
  fprintf ( 1, '  associated with L(n,x)\n' );

  n = 7;

  [ x, w ] = l_quadrature_rule ( n );

  r8vec2_print ( n, x, w,  '                  X             W' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule to estimate:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Q = Integral ( 0 <= X < +00 ) X^E exp(-X) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   E       Q_Estimate      Q_Exact\n' );
  fprintf ( 1, '\n' );

  for e = 0 : 2 * n - 1
    if ( e == 0 )
      f(1:n,1) = 1.0;
    else
      f(1:n,1) = x(1:n).^e;
    end
    q = w' * f;
    q_exact = l_integral ( e );
    fprintf ( 1, '  %2d  %14.6g  %14.6g\n', e, q, q_exact );
  end

  return
end
