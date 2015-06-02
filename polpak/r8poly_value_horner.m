function value = r8poly_value_horner ( m, c, x )

%*****************************************************************************80
%
%% R8POLY_VALUE_HORNER evaluates a polynomial using Horner's method.
%
%  Discussion:
%
%    The polynomial 
%
%      p(x) = c0 + c1 * x + c2 * x^2 + ... + cm * x^m
%
%    is to be evaluated at the value X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the degree.
%
%    Input, real C(M+1), the polynomial coefficients.  
%    C(I) is the coefficient of X^(I-1).
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the polynomial value.
%
  value = c(m+1);
  for i = m : -1 : 1
    value = value * x + c(i);
  end

  return
end
