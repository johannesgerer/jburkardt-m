function line_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% LINE_UNIT_QUAD_TEST tests the rules for the unit line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2008
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
  dim_num = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit line,\n' );
  fprintf ( 1, '  we approximate monomial integrals with:\n' );
  fprintf ( 1, '  LINE_UNIT_O01, a 1 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O02, a 2 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O03, a 3 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O04, a 4 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O05, a 5 point rule.\n' );

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

    order = 1;
    [ w, x ] = line_unit_o01 ( );
    v = monomial_value ( dim_num, order, expon, x );
    quad = line_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 2;
    [ w, x ] = line_unit_o02 ( );
    v = monomial_value ( dim_num, order, expon, x );
    quad = line_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 3;
    [ w, x ] = line_unit_o03 ( );
    v = monomial_value ( dim_num, order, expon, x );
    quad = line_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 4;
    [ w, x ] = line_unit_o04 ( );
    v = monomial_value ( dim_num, order, expon, x );
    quad = line_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 5;
    [ w, x ] = line_unit_o05 ( );
    v = monomial_value ( dim_num, order, expon, x );
    quad = line_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    fprintf ( 1, '\n' );
    quad = line_unit_monomial ( expon );
    fprintf ( 1, '   Exact  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
