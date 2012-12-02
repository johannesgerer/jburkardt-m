function value = cos_deg ( angle )

%*****************************************************************************80
%
%% COS_DEG returns the cosine of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees.
%
%    Output, real COS_DEG, the cosine of the angle.
%
  angle_rad = pi * angle / 180.0;

  value = cos ( angle_rad );

  return
end
