function p = r8poly_value ( m, c, n, x )

%*****************************************************************************80
%
%% R8POLY_VALUE evaluates a polynomial.
%
%  Discussion:
%
%    The polynomial 
%
%      p(x) = c1 + c2 * x + c3 * x^2 + ... + cm * x^(m-1)
%
%    can be evaluated at the vector x by the command
%
%      pval = r8poly_value ( m, c, n, x );
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
%    22 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the degree.
%
%    Input, real C(M+1,1), the polynomial coefficients.  C(1) is
%    the constant term.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real P(N,1), the value of the polynomial at the evaluation points.
%
  x = x(:);
  c = c(:);

  A = ( x(1:n,1) * ones ( 1, m + 1 ) ) .^ ( ones ( n, 1 ) * ( 0 : m ) );

  p = A * c;

  return
end
