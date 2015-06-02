function z = g_three ( x, y )

%*****************************************************************************80
%
%% G_THREE evaluates a function which has 6 minima, 2 global, in [-3,3]x[-2,2].
%
%  Discussion:
%
%    Actually, F_THREE evaluates that function; this function returns the 
%    log of that function plus 2, which is useful when trying to draw contours.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the arguments.
%
%    Output, real Z, the function value.
%
  z = ( 4.0 - 2.1 * x.^2 + x.^4 / 3.0 ) .* x.^2 ...
    + x .* y + ( - 4.0 + 4.0 * y.^2 ) .* y.^2;

  z = log ( 2 + z );

  return
end
