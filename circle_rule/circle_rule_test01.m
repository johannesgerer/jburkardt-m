function circle_test01 ( nt )

%*****************************************************************************80
%
%% CIRCLE_TEST01 tests CIRCLE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_TEST01\n' );
  fprintf ( 1, '  CIRCLE_RULE can compute a rule Q(f) for the unit circle\n' );
  fprintf ( 1, '  using NT equally spaced angles.\n' );
  fprintf ( 1, '  Estimate integrals I(f) where f = x^e(1) * y^e(2)\n' );
  fprintf ( 1, '  using %d points.\n', nt );
%
%  Compute the quadrature rule.
%
  [ w, t ] = circle_rule ( nt );
%
%  Apply it to integrands.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  E(1)  E(2)    I(f)            Q(f)\n' );
  fprintf ( 1, '\n' );
%
%  Specify a monomial.
%
  for e1 = 0 : 2 : 6

    e(1) = e1;

    for e2 = e1 : 2 : 6

      e(2) = e2;

      q = 0.0;
      for i = 1 : nt
        x = cos ( t(i) );
        y = sin ( t(i) );
        q = q + w(i) * x ^ e(1) * y ^ e(2);
      end

      q = 2.0 * pi * q;

      exact = circle01_monomial_integral ( e );

      fprintf ( 1, '   %2d  %2d  %14.6g  %14.6g\n', e(1), e(2), exact, q );

    end

  end

  return
end

