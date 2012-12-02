function fx = p46_fun ( n, x )

%*****************************************************************************80
%
%% P46_FUN evaluates the integrand for problem 46.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P46_PARAM_SET.
%
%    The integrand is the radius of an ellipse as a function of angle.
%
%    The integral represents the arc length of the ellipse.
%
%    The suggested parameter range is 0.0 <= ALPHA < 1.0.  ALPHA is
%    the eccentricity of the ellipse.
%
%  Interval:
%
%    0 <= theta <= 2 pi
%
%  Integrand:
%
%    r(theta) = ( 1 - alpha^2 ) / ( 1 - alpha * cos ( theta ) )
%
%  Exact Integral:
%
%    When alpha = sin ( pi / 12 ), then
%
%      6.0690909595647754101
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Crandall,
%    Projects in Scientific Computing,
%    Springer, 2000, page 47.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
%
  alpha = p46_param_get ( );

  fx(1:n) = ( 1.0 - alpha^2 ) ./ ( 1.0 - alpha * cos ( x(1:n) ) );

  return
end
