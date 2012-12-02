function value = f_03 ( x )

%*****************************************************************************80
%
%% F_03 evaluates x*exp(-x).
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
  value = x * exp ( - x );

  return
end
