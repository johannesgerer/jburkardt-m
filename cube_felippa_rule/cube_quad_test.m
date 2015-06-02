function cube_quad_test ( degree_max )

%*****************************************************************************80
%
%% CUBE_QUAD_TEST tests the rules for a cube in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2014
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
  a(1:3) = -1.0;
  b(1:3) = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'cube_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit hexahedron,\n' );
  fprintf ( 1, '  we approximate monomial integrals with\n' );
  fprintf ( 1, '  cube_RULE, which returns N1 by N2 by N3 point rules..\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, 3, expon, more, h, t );

    if ( any ( mod ( expon(1:3), 2 ) == 1 ) )
      if ( ~more )
        break;
      else
        continue
      end
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for ( dim = 1 : 3 )
      fprintf ( 1, '  %2d', expon(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for k = 1 : 5

      order_1d(1:3) = k;
      order = prod ( order_1d(1:3) );
      [ w, xyz ] = cube_rule ( a, b, order_1d );
      v = monomial_value ( 3, order, expon, xyz );
      quad = w' * v;
      fprintf ( 1, '  %6d  %6d  %6d  %14f\n', order_1d(1:3), quad );

    end
%
%  Try a rule of mixed orders.
%
    order_1d(1) = 3;
    order_1d(2) = 5;
    order_1d(3) = 2;
    order = prod ( order_1d(1:3) );
    [ w, xyz ] = cube_rule ( a, b, order_1d );
    v = monomial_value ( 3, order, expon, xyz );
    quad = w' * v;
    fprintf ( 1, '  %6d  %6d  %6d  %14f\n', order_1d(1:3), quad );

    fprintf ( 1, '\n' );
    quad = cube_monomial ( a, b, expon );
    fprintf ( 1, '   Exact                  %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
