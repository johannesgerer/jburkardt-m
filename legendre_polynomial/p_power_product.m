function table = p_power_product ( p, e )

%*****************************************************************************80
%
%% P_POWER_PRODUCT: power products for Legendre polynomial P(n,x).
%
%  Discussion:
%
%    Let P(n,x) represent the Legendre polynomial of degree i.  
%
%    For polynomial chaos applications, it is of interest to know the
%    value of the integrals of products of powers of X with every possible pair
%    of basis functions.  That is, we'd like to form
%
%      Tij = Integral ( -1 <= X <= +1 ) X^E * P(i,x) * P(j,x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the maximum degree of the polyonomial factors.
%    0 <= P.
%
%    Input, integer E, the exponent of X in the integrand.
%    0 <= E.
%
%    Output, real TABLE(P+1,P+1), the table of integrals.
%
  table(1:p+1,1:p+1) = 0.0;

  order = p + 1 + floor ( ( e + 1 ) / 2 );
  [ x_table, w_table ] = p_quadrature_rule ( order );

  for k = 1 : order

    x = x_table(k);
    l_table = p_polynomial_value ( 1, p, x );
%
%  The following formula is an outer product in L_TABLE.
%
    if ( e == 0 )
      table(1:p+1,1:p+1) = table(1:p+1,1:p+1) ...
        + w_table(k) *       l_table(1:p+1)' * l_table(1:p+1);
    else
      table(1:p+1,1:p+1) = table(1:p+1,1:p+1) ...
        + w_table(k) * x^e * l_table(1:p+1)' * l_table(1:p+1);
    end

  end

  return
end

