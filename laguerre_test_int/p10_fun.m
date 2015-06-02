function fx = p10_fun ( n, x )

%*****************************************************************************80
%
%% P10_FUN evaluates the integrand for problem 10.
%
%  Discussion:
%
%    S&S gives exact value as pi/2 = 1.5707963267948966192...
%    S&S gives Laguerre(16) as       1.5537377347...
%    S&S gives EXP_TRANSFORM(16) as  1.4293043007...
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) 1/(1+x*x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  fx(1:n) = 1.0 ./ ( 1.0 + x(1:n).^2 );

  return
end
