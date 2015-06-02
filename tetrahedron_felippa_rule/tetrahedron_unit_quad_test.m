function tetrahedron_unit_quad_test ( degree_max )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_QUAD_TEST tests the rules for the unit tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2014
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
  fprintf ( 1, 'TETRAHEDRON_UNIT_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit tetrahedron,\n' );
  fprintf ( 1, '  we approximate monomial integrals with:\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O01,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O04,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O08,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O08b,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O14,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O14b,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O15,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O15b,\n' );
  fprintf ( 1, '  TETRAHEDRON_UNIT_O24,\n' );

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
    [ w, xyz ] = tetrahedron_unit_o01 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 4;
    [ w, xyz ] = tetrahedron_unit_o04 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 8;
    [ w, xyz ] = tetrahedron_unit_o08 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 8;
    [ w, xyz ] = tetrahedron_unit_o08b ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 14;
    [ w, xyz ] = tetrahedron_unit_o14 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 14;
    [ w, xyz ] = tetrahedron_unit_o14b ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 15;
    [ w, xyz ] = tetrahedron_unit_o15 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 15;
    [ w, xyz ] = tetrahedron_unit_o15b ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    order = 24;
    [ w, xyz ] = tetrahedron_unit_o24 ( );
    v = monomial_value ( dim_num, order, expon, xyz );
    quad = tetrahedron_unit_volume ( ) *  w' * v;
    fprintf ( 1, '  %6d  %14f\n', order, quad );

    fprintf ( 1, '\n' );
    quad = tetrahedron_unit_monomial ( expon );
    fprintf ( 1, '   Exact  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
