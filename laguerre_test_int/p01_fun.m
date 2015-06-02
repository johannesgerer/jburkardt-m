function fx = p01_fun ( n, x )

%*****************************************************************************80
%
%% P01_FUN evaluates the integrand for problem 1.
%
%  Discussion:
%
%    D&R gives "exact" value as 0.19524753...
%    Mathematica returns        0.19524754198276439152...
%    D&R gives Laguerre(16) as  0.16623627...
%
%  Integral:
%
%    exp ( -2 ) Integral ( 2 <= x < +oo ) 1 / ( x * log(x)^2 ) dx
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
  fx(1:n) = exp ( -2.0 ) ./ ( x(1:n) .* log ( x(1:n) ).^2 );

  return
end
