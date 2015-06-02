function value = r8_cosd ( degrees )

%*****************************************************************************80
%
%% R8_COSD returns the cosine of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DEGREES, the angle in degrees.
%
%    Output, real VALUE, the cosine of the angle.
%
  radians = pi * ( degrees / 180.0 );

  value = cos ( radians );

  return
end
