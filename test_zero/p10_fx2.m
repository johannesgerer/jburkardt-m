function fx2 = p10_fx2 ( x )

%*****************************************************************************80
%
%% P10_FX2 evaluates the second derivative of the function for problem 10.
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
%    Output, real FX2, the second derivative of the function at X.
%
  fx2 =  - 200.0 * x * ( 3.0 - 100.0 * x.^2 ) / ( 100.0 * x * x + 1.0 ).^3;

  return
end
