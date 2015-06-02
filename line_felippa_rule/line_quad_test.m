function line_quad_test ( degree_max )

%*****************************************************************************80
%
%% LINE_QUAD_TEST tests the rules for a line segment in 1D.
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
  a = 0.0;
  b = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_QUAD_TEST\n' );
  fprintf ( 1, '  For a line segment in 1D,\n' );
  fprintf ( 1, '  we approximate monomial integrals with:\n' );
  fprintf ( 1, '  LINE_UNIT_O01, a 1 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O02, a 2 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O03, a 3 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O04, a 4 point rule.\n' );
  fprintf ( 1, '  LINE_UNIT_O05, a 5 point rule.\n' );

  for expon = 0 : degree_max

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Monomial exponent:  %d\n', expon );
    fprintf ( 1, '\n' );

    for order = 1 : 5
      [ w, x ] = line_rule ( a, b, order );
      v = x .^ expon;
      quad = w' * v;
      fprintf ( 1, '  %6d  %14f\n', order, quad );
    end

    fprintf ( 1, '\n' );
    quad = line_monomial ( a, b, expon );
    fprintf ( 1, '   Exact  %14f\n', quad );

  end

  return
end
