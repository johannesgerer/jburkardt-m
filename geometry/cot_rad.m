function value = cot_rad ( angle )

%*****************************************************************************80
%
%% COT_RAD returns the cotangent of an angle given in radians.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in radians.
%
%    Output, real COT_DEG, the cotangent of the angle.
%
  value  = cos ( angle ) / sin ( angle );

  return
end
