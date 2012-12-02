function hexa_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% QUAD_UNIT_QUAD_TEST tests the rules for the unit hexahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2008
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEXA_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit hexahedron,\n' );
  fprintf ( 1, '  we approximate monomial integrals with\n' );
  fprintf ( 1, '    HEXA_UNIT_RULE, which returns N1 by N2 by N3 point rules..\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, dim_num, expon, more, h, t );

    if ( any ( mod ( expon(1:dim_num), 2 ) == 1 ) )
      if ( ~more )
        break;
      else
        continue
      end
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for ( dim = 1 : dim_num )
      fprintf ( 1, '  %2d', expon(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for k = 1 : 5

      order_1d(1:dim_num) = k;
      order = prod ( order_1d(1:dim_num) );
      [ w, xyz ] = hexa_unit_rule ( order_1d );
      v = monomial_value ( dim_num, order, expon, xyz );
      quad = hexa_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
      fprintf ( 1, '  %6d  %6d  %6d  %14f\n', order_1d(1:dim_num), quad );

    end
%
%  Try a rule of mixed orders.
%
    order_1d(1) = 3;
    order_1d(2) = 5;
    order_1d(3) = 2;
    order = prod ( order_1d(1:dim_num) );
    [ w, xyz ] = hexa_unit_rule ( order_1d );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = hexa_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %6d  %6d  %14f\n', order_1d(1:dim_num), quad );

    fprintf ( 1, '\n' );
    quad = hexa_unit_monomial ( expon );
    fprintf ( 1, '   Exact                  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
