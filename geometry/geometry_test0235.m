function geometry_test0235 ( )

%*****************************************************************************80
%
%% TEST0235 tests DMS_TO_RADIANS, RADIANS_TO_DMS.
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
  fprintf ( 1, 'TEST0235\n' );
  fprintf ( 1, '  DMS_TO_RADIANS converts an angle from\n' );
  fprintf ( 1, '    degrees/minutes/seconds to radians;\n' );
  fprintf ( 1, '  RADIANS_TO_DEGREES converts an angle from radians\n' );
  fprintf ( 1, '    to degrees/minutes/seconds;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radians     DMS     Radians\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 15
    angle_rad = pi * i / 7.0;
    [ angle_deg, angle_min, angle_sec ] = radians_to_dms ( angle_rad );
    angle_rad2 = dms_to_radians ( angle_deg, angle_min, angle_sec );
    fprintf ( 1, '  %10f  %4d  %3d  %3d  %10f\n', ...
      angle_rad, angle_deg, angle_min, angle_sec, angle_rad2 );
  end

  return
end
