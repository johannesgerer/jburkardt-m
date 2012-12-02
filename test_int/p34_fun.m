function fx = p34_fun ( n, x )

%*****************************************************************************80
%
%% P34_FUN evaluates the integrand for problem 34.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ( 10 * x - 1 ) * ( 10 * x - 1.1 ) * ( 10 * x - 1.2 ) * ( 10 * x - 1.3 )
%
%  Exact Integral:
%
%    1627879 / 1500
%
%  Approximate Integral (20 digits):
%
%    1085.2526666666666666...
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
%    Hermann Engels,
%    Numerical Quadrature and Cubature,
%    Academic Press, 1980.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = ( 10.0 * x - 1.0 ) .* ( 10.0 * x - 1.1 ) .* ( 10.0 * x - 1.2 ) ...
    .* ( 10.0 * x - 1.3 );

  return
end
