function table = p_exponential_product ( p, b )

%*****************************************************************************80
%
%% P_EXPONENTIAL_PRODUCT: exponential products for P(n,x).
%
%  Discussion:
%
%    Let P(n,x) represent the Legendre polynomial of degree i.  
%
%    For polynomial chaos applications, it is of interest to know the
%    value of the integrals of products of exp(B*X) with every possible pair
%    of basis functions.  That is, we'd like to form
%
%      Tij = Integral ( -1 <= X <= +1 ) exp(B*x) * P(i,x) * P(j,x) dx
%
%    Because of the exponential factor, the quadrature will not be exact.
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
%    Input, real B, the coefficient of X in the exponential factor.
%
%    Output, real TABLE(P+1,P+1), the table of integrals.
%
  table(1:p+1,1:p+1) = 0.0;

  order = floor ( ( 3 * p + 4 ) / 2 );

  [ x_table, w_table ] = p_quadrature_rule ( order );

  for k = 1 : order

    x = x_table(k);
    l_table = p_polynomial ( 1, p, x );
%
%  The following formula is an outer product in L_TABLE.
%
    table(1:p+1,1:p+1) = table(1:p+1,1:p+1) ...
      + w_table(k) * exp ( b * x ) * l_table(1:p+1)' * l_table(1:p+1);

  end

  return
end

