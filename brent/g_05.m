function value = g_05 ( x )

%*****************************************************************************80
%
%% G_05 evaluates exp(x) - 2x + 1/(100x) - 1/(1000000x^2)
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
  value = exp ( x ) - 2.0 * x + 0.01 ./ x - 0.000001 ./ x ./ x;

  return
end
