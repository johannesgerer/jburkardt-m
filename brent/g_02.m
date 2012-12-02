function value = g_02 ( x )

%*****************************************************************************80
%
%% G_02 evaluates x^2 + exp ( - x ).
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
%    Output, real G_02, the value of the function at X.
%
  value = x * x + exp ( - x );

  return
end
