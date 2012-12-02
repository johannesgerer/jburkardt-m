function wedg_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% WEDG_UNIT_QUAD_TEST tests the rules for the unit wedge.
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
  trig_order_array(1:7) = [ 1, 3, -3, 6, -6, 7, 12 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDG_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit wedge,\n' );
  fprintf ( 1, '  we approximate monomial integrals with WEDG_UNIT_RULE.\n' );

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
      trig_order = trig_order_array(test);

      order = line_order * abs ( trig_order );

      [ w, xyz ] = wedg_unit_rule ( line_order, trig_order );
      v = monomial_value ( dim_num, order, expon, xyz );
      quad = wedg_unit_volume ( ) * ( w(1:order) * v(1:order)' );
      fprintf ( 1, '  %6d  %6d  %6d  %14f\n', trig_order, line_order, order, quad );

    end

    fprintf ( 1, '\n' );
    quad = wedg_unit_monomial ( expon );
    fprintf ( 1, '  Exact                   %14f\n', quad );

    if ( ~more )
      break
    end

  end

  return
end
