function [ o, c, e ] = polynomial_dif ( m, o1, c1, e1, dif )

%*****************************************************************************80
%
%% POLYNOMIAL_DIF differentiates a polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2014
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
%    Input, integer DIF(M), indicates the number of differentiations
%    in each component.
%
%    Output, integer O, the "order" of the polynomial derivative.
%
%    Output, real C(O), the coefficients of the polynomial derivative.
%
%    Output, integer E(O), the indices of the exponents of the polynomial 
%    derivative.
%
  o = o1;
  c = c1;

  for j = 1 : o1
    f1 = mono_unrank_grlex ( m, e1(j) );
    for i = 1 : m
      c(j) = c(j) * i4_fall ( f1(i), dif(i) );
      f1(i) = max ( f1(i) - dif(i), 0 );
    end
    e(j) = mono_rank_grlex ( m, f1 );
  end

  [ c, e ] = polynomial_sort ( o, c, e );

  [ o, c, e ] = polynomial_compress ( o, c, e );

  return
end

