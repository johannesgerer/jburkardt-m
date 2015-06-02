function wedge_felippa_rule_test02 ( degree_max )

%*****************************************************************************80
%
%% WEDGE_FELIPPA_RULE_TEST01 tests the rules for the unit wedge.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREE_MAX, the maximum total degree of the
%    monomials to check.
%
  dim_num = 3;
  test_num = 7;
  line_order_array(1:7) = [ 1, 2, 2, 3, 2, 3, 4 ];
  triangle_order_array(1:7) = [ 1, 3, -3, 6, -6, 7, 12 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_FELIPPA_RULE_TEST02\n' );
  fprintf ( 1, '  For the unit wedge,\n' );
  fprintf ( 1, '  we approximate monomial integrals with WEDGE_RULE.\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, dim_num, expon, more, h, t );

    if ( mod ( expon(3), 2 ) == 1 )
      if ( ~more )
        break
      else
        continue
      end
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for dim = 1 : dim_num
      fprintf ( 1, '  %2d', expon(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for test = 1 : test_num

      line_order = line_order_array(test);
      triangle_order = triangle_order_array(test);

      order = line_order * abs ( triangle_order );

      [ w, xyz ] = wedge_rule ( line_order, triangle_order );
      v = monomial_value ( dim_num, order, expon, xyz );
      quad = wedge_volume ( ) * ( w' * v );
      fprintf ( 1, '  %6d  %6d  %6d  %14f\n', triangle_order, line_order, order, quad );

    end

    fprintf ( 1, '\n' );
    quad = wedge_integral ( expon );
    fprintf ( 1, '  Exact                   %14f\n', quad );

    if ( ~more )
      break
    end

  end

  return
end
