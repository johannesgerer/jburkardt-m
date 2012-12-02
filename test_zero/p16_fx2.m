function fx2 = p16_fx2 ( x )

%*****************************************************************************80
%
%% P16_FX2 evaluates the second derivative of the function for problem 16.
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
  e = 0.8;

  fx2 = e * pi * pi * sin ( pi * x / 180.0  ) / 180.0 / 180.0;

  return
end
