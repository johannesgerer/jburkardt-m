function [ o, c, e ] = polynomial_axpy ( s, o1, c1, e1, o2, c2, e2 )

%*****************************************************************************80
%
%% POLYNOMIAL_AXPY adds a multiple of one polynomial to another.
%
%  Discussion:
%
%    P2(X) = P2(X) + S * P1(X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S, the multiplier for the first polynomial.
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
%    Output, integer O, the "order" of the polynomial sum.
%
%    Output, real C(O), the coefficients of the polynomial sum.
%
%    Output, integer E(O), the indices of the exponents of the polynomial sum.
%  
  o = o1 + o2;
  c = [ s * c1, c2 ];   
  e = [ e1, e2 ];

  [ c, e ] = polynomial_sort ( o, c, e );
  [ o, c, e ] = polynomial_compress ( o, c, e );

  return
end

