function table = hn_exponential_product ( p, b )

%*****************************************************************************80
%
%% HN_EXPONENTIAL_PRODUCT: normalized physicist's Hermite exponential products.
%
%  Discussion:
%
%    Let Hn(I,X) represent the normalized physicist's Hermite polynomial 
%    of degree I.  
%
%    For polynomial chaos applications, it is of interest to know the
%    value of the integrals of products of exp(B*X) with every possible pair
%    of basis functions.  That is, we'd like to form
%
%      Tij = Integral ( -oo < X < +oo ) exp(B*X) * Hn(I,X) * Hn(J,X) exp(-X*X) dx
%
%    We will estimate these integrals using Gauss-Hermite quadrature.
%    Because of the exponential factor exp(B*X), the quadrature will not 
%    be exact.
%
%    However, when B = 0, the quadrature is exact, and moreoever, the
%    table will be the identity matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
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
%    Output, real TABLE(P+1,P+1), the table of integrals.  TABLE(I,J)
%    represents the weighted integral of exp(B*X) * Hn(I+1,X) * Hn(J+1,X).
%
  table(1:p+1,1:p+1) = 0.0;

  order = floor ( ( 3 * p + 4 ) / 2 );

  [ x_table, w_table ] = h_quadrature_rule ( order );
  r8vec2_print ( order, x_table, w_table, '  Quadrature rule:' );

  for k = 1 : order

    x = x_table(k);
    h_table = hn_polynomial ( 1, p, x );
%
%  The following formula is an outer product in H_TABLE.
%
    table(1:p+1,1:p+1) = table(1:p+1,1:p+1) ...
      + w_table(k) * exp ( b * x ) * h_table(1:p+1)' * h_table(1:p+1);

  end

  return
end

