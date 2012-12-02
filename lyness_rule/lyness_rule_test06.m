function lyness_rule_test06 ( )

%*****************************************************************************80
%
%% LYNESS_RULE_TEST06 tests the Lyness rules for exact integration of monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2010
%
%  Author:
%
%    John Burkardt
%
  degree_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNESS_RULE_TEST06\n' );
  fprintf ( 1, '  LYNESS_RULE returns the points and weights of\n' );
  fprintf ( 1, '  a Lyness rule for the unit triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This routine uses those rules to estimate the\n' );
  fprintf ( 1, '  integral of monomomials in the unit triangle.\n' );

  rule_num = lyness_rule_num ( );

  area = 0.5;

  for degree = 0 : degree_max

    for a = 0 : degree

      b = degree - a;
%
%  Multiplying X^A * Y^B by COEF will give us an integrand
%  whose integral is exactly 1.  This makes the error calculations easy.
%
      coef = ( a + b + 2 ) * ( a + b + 1 );
      for i = 1 : b
        coef = coef * ( a + i ) / i;
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Integrate %f * X^%d * Y*%d\n', coef, a, b );
      fprintf ( 1, '\n' );
      fprintf ( 1, '      Rule       QUAD           ERROR\n' );
      fprintf ( 1, '\n' );

      for rule = 0 : rule_num

        order = lyness_order ( rule );

        [ w, x ] = lyness_rule ( rule, order );

        quad = 0.0;

        for j = 1 : order

          if ( a == 0 && b == 0 )
            value = coef;
          elseif ( a == 0 && b ~= 0 )
            value = coef        * x(2,j)^b;
          elseif ( a ~= 0 && b == 0 )
            value = coef * x(1,j)^a;
          elseif ( a ~= 0 && b ~= 0 )
            value = coef * x(1,j)^a * x(2,j)^b;
          end

          quad = quad + w(j) * value;

        end

        quad = area * quad;

        exact = 1.0;
        err = abs ( exact - quad );

        fprintf ( 1, '  %8d  %14.6f  %10.2e\n', rule, quad, err );

      end

    end

  end

  return
end
