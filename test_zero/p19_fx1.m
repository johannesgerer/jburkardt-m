function fx1 = p19_fx1 ( x )

%*****************************************************************************80
%
%% P19_FX1 evaluates the derivative of the function for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX1(*), the value of the derivative at X.
%
  arg = - ( 10.0 - 30.0 * x ).^2;

  fx1 = - 100.0 * sin ( 100.0 * x ) + 240.0 * exp ( arg ) / sqrt ( pi );

  return
end
