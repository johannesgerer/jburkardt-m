function value = g_01 ( x )

%*****************************************************************************80
%
%% G_01 evaluates (x-2)^2 + 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the point at which F is to be evaluated.
%
%    Output, real VALUE, the value of the function at X.
%
  value = ( x - 2.0 ) .* ( x - 2.0 ) + 1.0;

  return
end
