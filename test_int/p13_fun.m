function fx = p13_fun ( n, x )

%*****************************************************************************80
%
%% P13_FUN evaluates the integrand for problem 13.
%
%  Interval:
%
%    0 <= x <= 10
%
%  Integrand:
%
%    sin ( x ) / x
%
%  Approximate Integral (20 digits):
%
%    1.6583475942188740493...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = sin ( x ) ./ x;

  i = find ( x == 0.0 );
  fx(i) = 1.0;

  return
end
