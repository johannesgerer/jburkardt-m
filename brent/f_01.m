function value = f_01 ( x )

%*****************************************************************************80
%
%% F_01 evaluates sin ( x ) - x / 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2008
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
  value = sin ( x ) - 0.5 * x;

  return
end
