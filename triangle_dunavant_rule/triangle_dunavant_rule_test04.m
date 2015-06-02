function triangle_dunavant_rule_test04 ( )

%*****************************************************************************80
%
%% TRIANGLE_DUNAVANT_RULE_TEST04 tests DUNAVANT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
  rule_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_DUNAVANT_RULE_TEST04\n' );
  fprintf ( 1, '  DUNAVANT_RULE returns the points and weights of\n' );
  fprintf ( 1, '  a Dunavant rule for the unit triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This routine uses those rules to estimate the\n' );
  fprintf ( 1, '  integral of monomomials in the unit triangle.\n' );

  area = 0.5;

  for a = 0 : 10

    for b = 0 : 10 - a
%
%  Multiplying X^A * Y^B by COEF will give us an integrand
%  whose integral is exactly 1.  This makes the error calculations easy.
%
      coef = ( a + b + 2 ) * ( a + b + 1 );
      for i = 1 : b
        coef = coef * ( a + i ) / i;
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Integrate %f * X^%d * Y^%d\n', coef, a, b );
      fprintf ( 1, '\n' );
      fprintf ( 1, '      Rule       QUAD           ERROR\n' );
      fprintf ( 1, '\n' );

      for rule = 1 : rule_max

        order_num = dunavant_order_num ( rule );

        [ xy, w ] = dunavant_rule ( rule, order_num );

        quad = 0.0;

        for order = 1 : order_num

          x = xy(1,order);
          y = xy(2,order);

          if ( a == 0 & b == 0 )
            value = coef;
          elseif ( a == 0 & b ~= 0 )
            value = coef * y^b;
          elseif ( a ~= 0 & b == 0 )
            value = coef * x^a;
          elseif ( a ~= 0 & b ~= 0 )
            value = coef * x^a * y^b;
          end

          quad = quad + w(order) * value;

        end

        quad = area * quad;

        exact = 1.0;
        err = abs ( exact - quad );

        fprintf ( 1, '  %8d  %14f  %14f\n', rule, quad, err );
     
      end

    end

  end

  return
end
