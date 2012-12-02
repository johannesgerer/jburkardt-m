function fx = p23_fun ( n, x )

%*****************************************************************************80
%
%% P23_FUN evaluates the integrand for problem 23.
%
%  Discussion:
%
%    The integrand has a singularity at X = 0.
%    The integrand is discontinuous at X = 0.
%    The integrand is arbitrarily oscillatory as X decreases to 0.
%    The integrand becomes unbounded as X decreases to 0.
%
%    Integral ( 0 < X < 1 ) ( 1 / X ) sin ( 1 / X ) dX
%    = Integral ( 1 < X < Infinity ) ( 1 / X ) * sin ( X ) dX.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ( 1 / x ) sin ( 1 / x )
%
%  Approximate Integral (20 digits):
%
%    0.62471325642771360429...
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
  fx = ( 1.0 ./ x ) .* sin ( 1.0 ./ x );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
