function value = f_02 ( x )

%*****************************************************************************80
%
%% F_02 evaluates 2*x-exp(-x).
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
  value = 2.0 * x - exp ( - x );

  return
end
