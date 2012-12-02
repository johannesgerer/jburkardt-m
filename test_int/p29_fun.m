function fx = p29_fun ( n, x )

%*****************************************************************************80
%
%% P29_FUN evaluates the integrand for problem 29.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    1 / ( x + 2 )   for 0 < x < e - 2
%    0               otherwise
%
%  Exact Integral:
%
%    1 - ln ( 2 )
%
%  Approximate Integral (20 digits):
%
%    0.30685281944005469058...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
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
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = ( 0.0 <= x & x <= exp ( 1.0 ) - 2.0 ) ./ ( x + 2.0 );

  return
end
