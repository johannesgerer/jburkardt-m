function fx1 = p15_fx1 ( x )

%*****************************************************************************80
%
%% P15_FX1 evaluates the derivative of the function for problem 15.
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
  fx1 = ( 1.0 - 6.0 * x.^2 ) * r8_cube_root ( x ) ...
    * exp ( - x.^2 ) / ( 3.0 * x );

  return
end
