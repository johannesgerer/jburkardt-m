function value = tan_deg ( angle )

%*****************************************************************************80
%
%% TAN_DEG returns the tangent of an angle given in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in degrees.
%
%    Output, real VALUE, the tangent of the angle.
%
  value =  sin ( pi * angle / 180.0 ) ...
        ./ cos ( pi * angle / 180.0 );

  return
end
