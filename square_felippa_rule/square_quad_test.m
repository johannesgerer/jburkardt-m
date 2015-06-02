function square_quad_test ( degree_max )

%*****************************************************************************80
%
%% SQUARE_QUAD_TEST tests the rules for a square in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
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
  a = [ -1.0, -1.0 ];
  b = [ +1.0, +1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_QUAD_TEST\n' );
  fprintf ( 1, '  For the unit quadrilateral,\n' );
  fprintf ( 1, '  we approximate monomial integrals with\n' );
  fprintf ( 1, '  SQUARE_RULE, which returns M by N point rules..\n' );

  expon = [];
  more = 0;
  h = 0;
  t = 0;

  while ( 1 )

    [ expon, more, h, t ] = subcomp_next ( degree_max, 2, expon, more, h, t );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponents: ' );
    for ( i = 1 : 2 )
      fprintf ( 1, '  %2d', expon(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for k = 1 : 5

      order_1d(1:2) = k;
      order = order_1d(1) * order_1d(2);
      [ w, xy ] = square_rule ( a, b, order_1d );
      v = monomial_value ( 2, order, expon, xy );
      quad = w' * v;
      fprintf ( 1, '  %6d  %6d  %14f\n', order_1d(1:2), quad );

    end
%
%  Try a rule of mixed orders.
%
    order_1d(1) = 3;
    order_1d(2) = 5;
    order = order_1d(1) * order_1d(2);
    [ w, xy ] = square_rule ( a, b, order_1d );
    v = monomial_value ( 2, order, expon, xy );
    quad =  w' * v;
    fprintf ( 1, '  %6d  %6d  %14f\n', order_1d(1:2), quad );

    fprintf ( 1, '\n' );
    quad = square_monomial ( a, b, expon );
    fprintf ( 1, '   Exact          %14f\n', quad );

    if ( ~more )
      break;
    end

  end

  return
end
