function geometry_test0205 ( )

%*****************************************************************************80
%
%% TEST0205 tests DEGREES_TO_RADIANS, RADIANS_TO_DEGREES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0205\n' );
  fprintf ( 1, '  DEGREES_TO_RADIANS converts an angle from degrees\n' );
  fprintf ( 1, '    to radians;\n' );
  fprintf ( 1, '  RADIANS_TO_DEGREES converts an angle from radians\n' );
  fprintf ( 1, '    to degrees;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Degrees     Radians     Degrees\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 14
    angle_deg = 30 * i;
    angle_rad = degrees_to_radians ( angle_deg );
    angle_deg2 = radians_to_degrees ( angle_rad );
    fprintf ( 1, '  %10f  %10f  %10f\n', angle_deg, angle_rad, angle_deg2 );
  end

  return
end
