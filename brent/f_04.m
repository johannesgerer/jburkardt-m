function value = f_04 ( x )

%*****************************************************************************80
%
%% F_04 evaluates exp(x) - 1 / (100*x*x).
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
  value = exp ( x ) - 1.0 / 100.0 / x / x;

  return
end
