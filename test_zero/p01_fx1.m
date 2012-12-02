function fx1 = p01_fx1 ( x )

%*****************************************************************************80
%
%% P01_FX1 evaluates the derivative of the function for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the abscissa.
%
%    Output, real FX1, the first derivative of the function at X.
%
  fx1 = cos ( x ) - 0.5;

  return
end
