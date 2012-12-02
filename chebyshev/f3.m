function value = f3 ( x )

%*****************************************************************************80
%
%% F3 evaluates a function that can be used for Chebyshev interpolation.
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
  value = ( x - 3 ) .* ( x - 1 ) .* ( x - 1 ) .* ( x + 2 );

  return
end
