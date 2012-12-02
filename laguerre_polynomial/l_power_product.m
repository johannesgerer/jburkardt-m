function table = l_power_product ( p, e )

%*****************************************************************************80
%
%% L_POWER_PRODUCT: power product table for L(n,x).
%
%  Discussion:
%
%    Let L(n,x) represent the Laguerre polynomial of degree n.  
%
%    For polynomial chaos applications, it is of interest to know the
%    value of the integrals of products of X^E with every possible pair
%    of basis functions.  That is, we'd like to form
%
%      Tij = Integral ( 0 <= X < +oo ) x^e * L(i,x) * L(j,x) * exp (-x) dx
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
%    Input, integer E, the exponent of X.
%    0 <= E.
%
%    Output, real TABLE(1:P+1,1:P+1), the table of integrals.  
%    TABLE(I+1,J+1) represents the weighted integral of x^E * L(i,x) * L(j,x).
%
  table = zeros ( p + 1, p + 1 );

  order = p + 1 + floor ( ( e + 1 ) / 2 );

  [ x_table, w_table ] = l_quadrature_rule ( order );

  for k = 1 : order

    x = x_table(k);
    l_table = l_polynomial ( 1, p, x );

    if ( e == 0 )

      for j = 0 : p
        for i = 0 : p
          table(i+1,j+1) = table(i+1,j+1) + w_table(k) * l_table(i+1) * l_table(j+1);
        end
      end

    else

      for j = 0 : p
        for i = 0 : p
          table(i+1,j+1) = table(i+1,j+1) ...
            + w_table(k) * ( x ^ e ) * l_table(i+1) * l_table(j+1);
        end
      end

    end

  end

  return
end
