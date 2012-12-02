function fx1 = p10_fx1 ( x )

%*****************************************************************************80
%
%% P10_FX1 evaluates the derivative of the function for problem 10.
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
  fx1 = ( 1.0 - 10.0 * x ) * ( 1.0 + 10.0 * x ) / ( 100.0 * x * x + 1.0 ).^2;

  return
end
