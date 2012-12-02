function fx1 = p14_fx1 ( x )

%*****************************************************************************80
%
%% P14_FX1 evaluates the derivative of the function for problem 14.
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
  fx1 = - 2.0 * ( x - 0.3 ) / ( ( x - 0.3 ).^2 + 0.01 ).^2 ...
        - 2.0 * ( x - 0.9 ) / ( ( x - 0.9 ).^2 + 0.04 ).^2 ...
        + 2.0;

  return
end
