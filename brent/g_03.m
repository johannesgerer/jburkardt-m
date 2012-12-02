function value = g_03 ( x )

%*****************************************************************************80
%
%% G_03 evaluates x^4+2x^2+x+3.
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
%    Output, real G_03, the value of the function at X.
%
  value = ( ( x * x + 2.0 ) * x + 1.0 ) * x + 3.0;

  return
end
