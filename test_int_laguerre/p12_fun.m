function fx = p12_fun ( n, x )

%*****************************************************************************80
%
%% P12_FUN evaluates the integrand for problem 12.
%
%  Discussion:
%
%    S&S gives exact value as pi =  0.5
%    S&S gives Laguerre(16) as      0.5000000000...
%    S&S gives EXP_TRANSFORM(16) as 0.5019065783... 
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) exp ( -x ) * cos ( x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2007
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
  fx(1:n) = exp ( -x(1:n) ) .* cos ( x(1:n) );

  return
end
