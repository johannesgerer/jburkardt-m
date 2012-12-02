function value = r8_cot_deg ( angle )

%*****************************************************************************80
%
%% R8_COT_DEG returns the cotangent of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees.
%
%    Output, real R8_COT_DEG, the cotangent of the angle.
%
  value  = cos ( pi * angle / 180.0 ) ./ sin ( pi * angle / 180.0 );

  return
end
