function value = f1 ( x )

%*****************************************************************************80
%
%% F1 evaluates a function that can be used for Chebyshev interpolation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(), one or more points where the function is to be evaluated.
%
%    Output, real VALUE(), the function values.
%
  value = cos ( 2.0 * pi * x ) .* sin ( 3.0 * pi * x );

  return
end
