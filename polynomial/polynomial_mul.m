function [ o, c, e ] = polynomial_mul ( m, o1, c1, e1, o2, c2, e2 )

%*****************************************************************************80
%
%% POLYNOMIAL_MUL multiplies two polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer O1, the "order" of polynomial 1.
%
%    Input, real C1(O1), the coefficients of polynomial 1.
%
%    Input, integer E1(O1), the indices of the exponents of polynomial 1.
%
%    Input, integer O2, the "order" of polynomial 2.
%
%    Input, real C2(O2), the coefficients of polynomial 2.
%
%    Input, integer E2(O2), the indices of the exponents of polynomial 2.
%
%    Output, integer O, the "order" of the polynomial product.
%
%    Output, real C(O), the coefficients of the polynomial product.
%
%    Output, integer E(O), the indices of the exponents of the 
%    polynomial product.
%
  o = o1 * o2;
  e = zeros ( o, 1 );
  c = zeros ( o, 1 );

  o = 0;
  for j = 1 : o2
    for i = 1 : o1
      o = o + 1;
      c(o) = c1(i) * c2(j);
      f1(1:m) = mono_unrank_grlex ( m, e1(i) );
      f2(1:m) = mono_unrank_grlex ( m, e2(j) );
      f(1:m) = f1(1:m) + f2(1:m);
      e(o) = mono_rank_grlex ( m, f );
    end
  end

  [ c, e ] = polynomial_sort ( o, c, e );
  [ o, c, e ] = polynomial_compress ( o, c, e );

  return
end

