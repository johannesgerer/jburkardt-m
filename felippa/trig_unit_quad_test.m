function trig_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% TRIG_UNIT_QUAD_TEST tests the rules for the unit triangle.
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
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIG_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit triangle,\n' );
  fprintf ( 1, '  we approximate monomial integrals with:\n' );
  fprintf ( 1, '  TRIG_UNIT_O01,\n' );
  fprintf ( 1, '  TRIG_UNIT_O03,\n' );
  fprintf ( 1, '  TRIG_UNIT_O03b,\n' );
  fprintf ( 1, '  TRIG_UNIT_O06,\n' );
  fprintf ( 1, '  TRIG_UNIT_O06b,\n' );
  fprintf ( 1, '  TRIG_UNIT_O07,\n' );
  fprintf ( 1, '  TRIG_UNIT_O12,\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, dim_num, expon, more, h, t );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for ( dim = 1 : dim_num )
      fprintf ( 1, '  %2d', expon(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    order = 1;
    [ w, xy ] = trig_unit_o01 ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 3;
    [ w, xy ] = trig_unit_o03 ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 3;
    [ w, xy ] = trig_unit_o03b ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 6;
    [ w, xy ] = trig_unit_o06 ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 6;
    [ w, xy ] = trig_unit_o06b ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 7;
    [ w, xy ] = trig_unit_o07 ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 12;
    [ w, xy ] = trig_unit_o12 ( );
    v = monomial_value ( dim_num, order, expon, xy );
    quad = trig_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    fprintf ( 1, '\n' );
    quad = trig_unit_monomial ( expon );
    fprintf ( 1, '   Exact  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
