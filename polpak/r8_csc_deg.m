function value = r8_csc_deg ( angle )

%*****************************************************************************80
%
%% R8_CSC_DEG returns the cosecant of an angle given in degrees.
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
%    Output, real VALUE, the cosecant of the angle.
%
  value = 1.0D+00 / cos ( pi * angle / 180.0 );

  return
end
