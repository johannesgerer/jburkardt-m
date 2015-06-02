function fx = p08_fun ( n, x )

%*****************************************************************************80
%
%% P08_FUN evaluates the integrand for problem 8.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) x / ( exp ( x ) - 1 ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2014
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
  fx(1:n) = x(1:n) ./ ( exp ( x(1:n) ) - 1.0 );

  return
end
