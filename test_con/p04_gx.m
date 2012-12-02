function g = p04_gx ( x )

%*****************************************************************************80
%
%% P04_GX evaluates the underlying function for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(2), the point at which the function is to
%    be evaluated.
%
%    Output, real G(2), the value of the function at X.
%
  E = 2.71828182845904523536;

  g(1) = 0.5 * sin ( x(1) * x(2) ) - x(2) / pi - x(1);

  g(2) = ( 4.0 * pi - 1.0 ) * ( exp ( 2.0 * x(1) ) - E ) ...
    / ( 4.0 * pi ) + E * x(2) / pi - 2.0D+00 * E * x(1);

  return
end
