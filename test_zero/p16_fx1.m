function fx1 = p16_fx1 ( x )

%*****************************************************************************80
%
%% P16_FX1 evaluates the derivative of the function for problem 16.
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
  e = 0.8;

  fx1 = ( pi / 180.0 ) - e * pi * cos ( pi * x / 180.0  ) / 180.0;

  return
end
