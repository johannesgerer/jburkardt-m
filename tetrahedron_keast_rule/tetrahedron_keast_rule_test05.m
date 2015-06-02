function tetrahedron_keast_rule_test05 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_KEAST_RULE_TEST05 demonstrates Keast rules on various monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2008
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  degree_max = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_KEAST_RULE_TEST05\n' );
  fprintf ( 1, '  Demonstrate the KEAST rules on a sequence of\n' );
  fprintf ( 1, '  monomial integrands X^A Y^B Z^C\n' );
  fprintf ( 1, '  on the unit tetrahedron.\n' );

  rule_num = keast_rule_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule     Order     Quad\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    expon = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ expon, more, h, t ] = comp_next ( degree, dim_num, expon, more, h, t );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  F(X,Y,Z) = X^%d * Y^%d * Z^%d\n', expon(1:3) );
      fprintf ( 1, '\n' );

      for rule = 1 : rule_num

        order_num = keast_order_num ( rule );

        [ xyz, w ] = keast_rule ( rule, order_num );

        mono = monomial_value ( dim_num, order_num, xyz, expon );

        quad = w(1:order_num) * mono(1:order_num)';

        fprintf ( 1, '  %8d  %8d  %14f\n', rule, order_num, quad );
    
      end

      if ( ~more )
        break
      end

    end

  end

  return
end
