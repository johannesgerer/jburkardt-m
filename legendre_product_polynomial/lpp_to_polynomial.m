function [ o, c, e ] = lpp_to_polynomial ( m, l, o_max )

%*****************************************************************************80
%
%% LPP_TO_POLYNOMIAL writes a Legendre Product Polynomial as a polynomial.
%
%  Discussion:
%
%    For example, if 
%      M = 3,
%      L = ( 1, 0, 2 ),
%    then
%      L(1,0,2)(X,Y,Z) 
%      = L(1)(X) * L(0)(Y) * L(2)(Z)
%      = X * 1 * ( 3Z^2-1)/2
%      = - 1/2 X + (3/2) X Z^2
%    so
%      O = 2 (2 nonzero terms)
%      C = -0.5
%           1.5
%      E = 4    <-- index in 3-space of exponent (1,0,0)
%          15   <-- index in 3-space of exponent (1,0,2)
%
%    The output value of O is no greater than
%      O_MAX = product ( 1 <= I <= M ) (L(I)+2)/2
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
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer L(M), the index of each Legendre product polynomial factor.
%    0 <= L(*).
%
%    Input, integer O_MAX, an upper limit on the size of the output arrays.
%      O_MAX = product ( 1 <= I <= M ) (L(I)+2)/2.
%
%    Output, integer O, the "order" of the polynomial product.
%
%    Output, real C(O), the coefficients of the polynomial product.
%
%    Output, integer E(O), the indices of the exponents of the 
%    polynomial product.
%
  o1 = 1;
  c1 = 1.0;
  e1 = 1;
%
%  Implicate one factor at a time.
%
  for i = 1 : m

    [ o2, c2, f2 ] = lp_coefficients ( l(i) );

    o = 0;

    for j2 = 1 : o2
      for j1 = 1 : o1
        o = o + 1;
        c(o) = c1(j1) * c2(j2);
        
        if ( 1 < i )
          p = mono_unrank_grlex ( i - 1, e1(j1) );
        end
        p(i) = f2(j2);
        e(o) = mono_rank_grlex ( i, p );

      end
    end

    [ c, e ] = polynomial_sort ( o, c, e );
    [ o, c, e ] = polynomial_compress ( o, c, e );

    o1 = o;
    c1 = c;
    e1 = e;

  end

  return
end
