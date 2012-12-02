function table = pn_pair_product ( p )

%*****************************************************************************80
%
%% PN_PAIR_PRODUCT: pair products for normalized Legendre polynomial Pn(n,x).
%
%  Discussion:
%
%    Let Pn(n,x) represent the normalized Legendre polynomial of degree n.  
%
%    To check orthonormality, we compute
%
%      Tij = Integral ( -1.0 <= X <= +1.0 ) Pn(i,x) * Pn(j,x) dx
%
%    We will estimate these integrals using Gauss-Legendre quadrature.
%
%    The computed table should be the identity matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2012
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
%    Output, real TABLE(1:P+1,1:P+1), the table of integrals.  
%
  table = zeros ( p + 1, p + 1 );

  order = 2 * p + 1;

  [ x_table, w_table ] = p_quadrature_rule ( order );

  for k = 1 : order

    x = x_table(k);
    h_table = pn_polynomial ( 1, p, x );

    for i = 1 : p + 1
      for j = 1 : p + 1
        table(i,j) = table(i,j) + w_table(k) * h_table(i) * h_table(j);
      end
    end

  end

  return
end