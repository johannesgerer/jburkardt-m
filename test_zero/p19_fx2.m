function fx2 = p19_fx2 ( x )

%*****************************************************************************80
%
%% P19_FX2 evaluates the second derivative of the function for problem 19.
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
%    Output, real FX2(*), the value of the second derivative at X.
%
  arg = - ( 10.0 - 30.0 * x ).^2;

  fx2 = - 10000.0 * cos ( 100.0 * x ) ...
    + 14400.0 * exp ( arg ) * ( 10.0 - 30.0 * x ) / sqrt ( pi );

  return
end
