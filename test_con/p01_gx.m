function gx = p01_gx ( x )

%*****************************************************************************80
%
%% P01_GX evaluates the underlying function for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2008
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
%    Output, real GX(2), the value of the function at X.
%
  gx(1) = x(1) - ( ( x(2) - 5.0 ) * x(2) + 2.0 ) * x(2) - 13.0;
  gx(2) = x(1) + ( ( x(2) + 1.0 ) * x(2) - 14.0 ) * x(2) - 29.0;

  return
end
