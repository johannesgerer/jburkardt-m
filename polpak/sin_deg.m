function value = sin_deg ( angle )

%*****************************************************************************80
%
%% SIN_DEG returns the sine of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees.
%
%    Output, real VALUE, the sine of the angle.
%
  value = sin ( pi * angle / 180.0 );

  return
end
