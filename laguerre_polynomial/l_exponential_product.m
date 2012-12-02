function table = l_exponential_product ( p, b )

%*****************************************************************************80
%
%% L_EXPONENTIAL_PRODUCT: exponential product table for L(n,x).
%
%  Discussion:
%
%    Let L(n,x) represent the Laguerre polynomial of degree n.  
%
%    For polynomial chaos applications, it is of interest to know the
%    value of the integrals of products of exp(B*X) with every possible pair
%    of basis functions.  That is, we'd like to form
%
%      Tij = Integral ( 0 <= X < +oo ) exp(b*x) * L(i,x) * L(j,x) * exp (-x) dx
%
%    Because of the exponential factor, the quadrature will not be exact.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the maximum degree of the polyonomial 
%    factors.  0 <= P.
%
%    Input, real B, the coefficient of X in the exponential factor.
%
%    Output, real TABLE(1:P+1,1:P+1), the table of integrals.  
%    TABLE(I+1,J+1) represents the weighted integral of exp(B*X) * L(i,x) * L(j,x).
%
  table(1:p+1,1:p+1) = 0.0;

  order = floor ( ( 3 * p + 4 ) / 2 );

  [ x_table, w_table ] = l_quadrature_rule ( order );

  for k = 1 : order

    x = x_table(k);
    l_table = l_polynomial ( 1, p, x );

    for j = 1 : p + 1
      for i = 1 : p + 1
        table(i,j) = table(i,j) ...
          + w_table(k) * exp ( b * x ) * l_table(i) * l_table(j);
      end
    end

  end

  return
end
