function hpp_test04 ( )

%*****************************************************************************80
%
%% HPP_TEST04 tests HEPP_TO_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST04:\n' );
  fprintf ( 1, '  HEPP_TO_POLYNOMIAL is given a Hermite product polynomial\n' );
  fprintf ( 1, '  and determines its polynomial representation.\n' );

  m = 2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spatial dimension M = %d:\n', m );

  for rank = 1 : 11

    l = comp_unrank_grlex ( m, rank );

    o_max = prod ( floor ( ( l(1:m) + 2 ) / 2 ) );
    [ o, c, e ] = hepp_to_polynomial ( m, l, o_max );

    label = sprintf ( '  HePP #%d = He(%d,X)*He(%d,Y) =', rank, l(1), l(2) );

    fprintf ( 1, '\n' );
    polynomial_print ( m, o, c, e, label );

  end

  return
end
