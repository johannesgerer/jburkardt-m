function fem2d_pack_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests TRIANGLE_UNIT_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  order_max = 64;
  rule_max = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  TRIANGLE_UNIT_SET sets up a quadrature\n' );
  fprintf ( 1, '    in the unit triangle,\n' );
  fprintf ( 1, '\n' );

  for a = 0 : 10

    for b = 0 : 10 - a

      coef = ( a + b + 2 ) * ( a + b + 1 );
      for i = 1 : b
        coef = coef * ( a + i ) / i;
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '  A = %f  B = %f\n', a, b );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Rule       QUAD           ERROR\n' );
      fprintf ( 1, '\n' );

      for rule = 1 : rule_max

        order = triangle_unit_size ( rule );

        [ xtab, ytab, weight ] = triangle_unit_set ( rule );

        quad = 0.0;

        for i = 1 : order

          x = xtab(i);
          y = ytab(i);

          if ( a == 0 & b == 0 )
            value = coef;
          elseif ( a == 0 & b ~= 0 )
            value = coef * ytab(i)^b;
          elseif ( a ~= 0 & b == 0 )
            value = coef * xtab(i)^a;
          elseif ( a ~= 0 & b ~= 0 )
            value = coef * xtab(i)^a * ytab(i)^b;
          end

          quad = quad + 0.5 * weight(i) * value;

        end

        exact = 1.0;
        err = abs ( exact - quad );

        fprintf ( 1, '  %4d  %14f  %14f\n', rule, quad, err );

      end

    end

  end

  return
end
