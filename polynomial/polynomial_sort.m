function [ c, e ] = polynomial_sort ( o, c, e )

%*****************************************************************************80
%
%% POLYNOMIAL_SORT sorts the information in a polynomial.
%
%  Discussion;
%
%    The coefficients C and exponents E are rearranged so that 
%    the elements of E are in ascending order.
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
%    Input, integer O, the "order" of the polynomial.
%
%    Input/output, real C(O), the coefficients of the polynomial.
%
%    Input/output, integer E(O), the indices of the exponents of the polynomial.
%
  [ e, i ] = sort ( e );
  c = c(i);

  return
end

