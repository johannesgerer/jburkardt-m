function fx = p03_fun ( n, x )

%*****************************************************************************80
%
%% P03_FUN evaluates the integrand for problem 3.
%
%  Discussion:
%
%    D&R gives "exact" value as 13.628...
%    Mathematica returns        13.440045415012575106...
%    D&R gives Laguerre(16) as   0.44996932...
%
%  Integral:
%
%    exp ( -2 ) Integral ( 2 <= x < +oo ) 1 / ( x^1.01 ) dx
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
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  fx(1:n) = exp ( - 2.0 ) * 1.0 ./ x(1:n).^1.01;

  return
end
