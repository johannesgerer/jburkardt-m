function nco_tetrahedron_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests NCO_TETRAHEDRON_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_RULE returns the points and weights of\n' );
  fprintf ( 1, '  an NCO rule for the unit tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This routine uses those rules to estimate the\n' );
  fprintf ( 1, '  integral of monomomials in the unit tetrahedron.\n' );

  rule_num = nco_tetrahedron_rule_num ( 'DUMMY' );

  area = 1.0 / 6.0;

  for a = 0 : 6

    for b = 0 : 6 - a

      for c = 0 : 6 - a - b
%
%  Multiplying X^A * Y^B * Z^C by COEF will give us an integrand
%  whose integral is exactly 1.  This makes the error calculations easy.
%
        coef = 1.0;

%       for i = 1 : a
%         coef = coef * i / i;
%       end
        for i = a + 1 : a + b
          coef = coef * i /( i - a );
        end
        for i = a + b + 1 : a + b + c     
          coef = coef * i / ( i - a - b );
        end
        for i = a + b + c + 1 : a + b + c + 3
          coef = coef * i;
        end

        fprintf ( 1, '\n' );
        fprintf ( 1, '  Integrate %f * X^%d * Y^%d * Z^%d\n', coef, a, b, c );
        fprintf ( 1, '\n' );
        fprintf ( 1, '      Rule       QUAD           ERROR\n' );
        fprintf ( 1, '\n' );

        for rule = 1 : rule_num

          order_num = nco_tetrahedron_order_num ( rule );

          [ xyz, w ] = nco_tetrahedron_rule ( rule, order_num );

          quad = 0.0;

          for order = 1 : order_num

            x = xyz(1,order);
            y = xyz(2,order);
            z = xyz(3,order);
%
%  Some tedious calculations to avoid 0**0 complaints.
%
            value = coef;

            if ( a ~= 0 )
              value = value * x^a;
            end

            if ( b ~= 0 )
              value = value * y^b;
            end

            if ( c ~= 0 )
              value = value * z^c;
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
  end

  return
end
