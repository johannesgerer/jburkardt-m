function lpp_to_polynomial_test ( )

%*****************************************************************************80
%
%% LPP_TO_POLYNOMIAL_TEST tests LPP_TO_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LPP_TO_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  LPP_TO_POLYNOMIAL is given a Legendre product polynomial\n' );
  fprintf ( 1, '  and determines its polynomial representation.\n' );

  m = 2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spatial dimension M = %d:\n', m );

  for rank = 1 : 11

    l = comp_unrank_grlex ( m, rank );

    o_max = prod ( floor ( ( l(1:m) + 2 ) / 2 ) );
    [ o, c, e ] = lpp_to_polynomial ( m, l, o_max );

    label = sprintf ( '  LPP #%d = L(%d,X)*L(%d,Y) =', rank, l(1), l(2) );

    fprintf ( 1, '\n' );
    polynomial_print ( m, o, c, e, label );

  end

  return
end
