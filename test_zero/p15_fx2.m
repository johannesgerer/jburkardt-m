function fx2 = p15_fx2 ( x )

%*****************************************************************************80
%
%% P15_FX2 evaluates the second derivative of the function for problem 15.
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
  fx2 = ( - 2.0 - 30.0 * x.^2 + 36.0 * x.^4 ) * r8_cube_root ( x ) ...
    * exp ( - x.^2 ) / ( 9.0 * x.^2 );

  return
end
