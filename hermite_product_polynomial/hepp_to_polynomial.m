function [ o, c, e ] = hepp_to_polynomial ( m, l, o_max )

%*****************************************************************************80
%
%% HEPP_TO_POLYNOMIAL writes a Hermite Product Polynomial as a polynomial.
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
%
%    For example, if 
%      M = 3,
%      L = ( 1, 0, 2 ),
%    then
%      He(1,0,2)(X,Y,Z) 
%      = He(1)(X) * He(0)(Y) * He(2)(Z)
%      = X * 1 * ( Z^3-3Z)
%      = - 3XZ + X Z^3
%    so
%      O = 2 (2 nonzero terms)
%      C = -3.0
%           1.0
%      E =  8   <-- index in 3-space of exponent (1,0,1)
%          23   <-- index in 3-space of exponent (1,0,3)
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
%    Input, integer L(M), the index of each Hermite product polynomial factor.
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

    [ o2, c2, f2 ] = hep_coefficients ( l(i) );

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
