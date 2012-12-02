function value = g_04 ( x )

%*****************************************************************************80
%
%% G_04 evaluates exp(x)+1/(100X)
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
%    Output, real G_04, the value of the function at X.
%
  value = exp ( x ) + 0.01 / x;

  return
end
