function g = p02_gx ( x )

%*****************************************************************************80
%
%% P02_GX evaluates the underlying function for problem 2.
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
  g(1) = x(1) * x(1) - x(2) + 1.0;
  g(2) = x(1) - cos ( pi * x(2) / 2.0 );

  return
end
