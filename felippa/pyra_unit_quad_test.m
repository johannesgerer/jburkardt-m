function pyra_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% PYRA_UNIT_QUAD_TEST tests the rules for the unit pyramid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2008
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
  fprintf ( 1, 'PYRA_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit pyramid,\n' );
  fprintf ( 1, '  we approximate monomial integrals with:\n' );
  fprintf ( 1, '  PYRA_UNIT_O01,\n' );
  fprintf ( 1, '  PYRA_UNIT_O05,\n' );
  fprintf ( 1, '  PYRA_UNIT_O06,\n' );
  fprintf ( 1, '  PYRA_UNIT_O08,\n' );
  fprintf ( 1, '  PYRA_UNIT_O08b,\n' );
  fprintf ( 1, '  PYRA_UNIT_O09,\n' );
  fprintf ( 1, '  PYRA_UNIT_O13,\n' );
  fprintf ( 1, '  PYRA_UNIT_O18,\n' );
  fprintf ( 1, '  PYRA_UNIT_O27,\n' );
  fprintf ( 1, '  PYRA_UNIT_O48.\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, dim_num, expon, more, h, t );

    if ( mod ( expon(1), 2 ) == 1 | ...
         mod ( expon(2), 2 ) == 1 )
      continue
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for ( dim = 1 : dim_num )
      fprintf ( 1, '  %2d', expon(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    order = 1;
    [ w, xyz ] = pyra_unit_o01 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 5;
    [ w, xyz ] = pyra_unit_o05 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 6;
    [ w, xyz ] = pyra_unit_o06 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 8;
    [ w, xyz ] = pyra_unit_o08 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 8;
    [ w, xyz ] = pyra_unit_o08b ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 9;
    [ w, xyz ] = pyra_unit_o09 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 13;
    [ w, xyz ] = pyra_unit_o13 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 18;
    [ w, xyz ] = pyra_unit_o18 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 27;
    [ w, xyz ] = pyra_unit_o27 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 48;
    [ w, xyz ] = pyra_unit_o48 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = pyra_unit_volume ( ) *  ( w(1:order) * v(1:order)' );
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    fprintf ( 1, '\n' );
    quad = pyra_unit_monomial ( expon );
    fprintf ( 1, '   Exact  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
