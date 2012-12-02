function fx = p17_fun ( n, x )

%*****************************************************************************80
%
%% P17_FUN evaluates the integrand for problem 17.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ( sin ( 50 * pi * x ) )^2
%
%  Antiderivative:
%
%    1/2 X - sin ( 100 * PI * X ) / ( 200 * PI )
%
%  Approximate Integral:
%
%    0.5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
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
  fx = ( sin ( 50.0 * pi * x ) ).^2;

  return
end
