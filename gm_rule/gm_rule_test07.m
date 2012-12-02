function gm_rule_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests GM_RULE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 5;
  degree_max = 4;
  rule_max = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  GM_RULE_SET determines the weights and abscissas\n' );
  fprintf ( 1, '  of a Grundmann-Moeller quadrature rule for\n' );
  fprintf ( 1, '  the DIM_NUM dimensional simplex,\n' );
  fprintf ( 1, '  using a rule of in index RULE,\n' );
  fprintf ( 1, '  which will have degree of exactness 2*RULE+1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, look at all the monomials up to\n' );
  fprintf ( 1, '  some maximum degree, choose a few low order rules\n' );
  fprintf ( 1, '  and determine the quadrature error for each.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we use DIM_NUM = %d\n', dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Rule     Order     Quad_Error\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    expon = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ expon, more, h, t ] = comp_next ( degree, dim_num, expon, more, h, t );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  F(X) = X1^%d * X2^%d * X3^%d * X4^%d * X5^%d\n', ...
        expon(1:5) );

      fprintf ( 1, '\n' );

      for rule = 0 : rule_max

        point_num = gm_rule_size ( rule, dim_num );

        [ w, x ] = gm_rule_set ( rule, dim_num, point_num );

        quad_error = simplex_unit_monomial_quadrature ( dim_num, expon, ...
          point_num, x, w );

        fprintf ( 1, '  %8d  %8d  %14.6e\n', rule, point_num, quad_error );

      end

      if ( ~more )
        break
      end

    end

  end

  return
end


