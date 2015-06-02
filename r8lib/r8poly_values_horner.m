function p = r8poly_values_horner ( m, c, n, x )

%*****************************************************************************80
%
%% R8POLY_VALUES_HORNER evaluates a polynomial using Horner's method.
%
%  Discussion:
%
%    The polynomial 
%
%      p(x) = c0 + c1 * x + c2 * x^2 + ... + cm * x^m
%
%    can be evaluated at the vector x by the command
%
%      pval = r8poly_value ( m, c, n, x );
%
%    Note that C must actually be dimensioned of size M+1.
%
%    Unfortunately, the natural MATLAB function to use, polyval(),
%    assumes that the polynomial coefficients are given in the
%    opposite order, so that c1 multiplies x^(m-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the degree.
%
%    Input, real C(M+1,1), the polynomial coefficients.  
%    C(I+1) is the coefficient of X^I.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real P(N,1), the polynomial values.
%
  x = x(:);
  c = c(:);

  p = zeros ( n, 1 );

  p(1:n) = c(m+1);
  for i = m - 1 : -1 : 0
    p(1:n) = p(1:n) .* x(1:n) + c(i+1);
  end

  return
end
