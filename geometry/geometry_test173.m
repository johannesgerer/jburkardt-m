function geometry_test173 ( )

%*****************************************************************************80
%
%% TEST173 tests RADEC_DISTANCE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 6;

  ptest = [ ...
     1.0,  0.0,  0.0; ...
     0.0,  1.0,  0.0; ...
     0.0,  0.0,  1.0; ...
     1.0,  1.0,  1.0; ...
     5.0, -2.0, -1.0; ...
    -2.0, -2.0, -2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST173\n' );
  fprintf ( 1, '  RADEC_DISTANCE_3D computes the angular separation\n' );
  fprintf ( 1, '    between two points on a sphere described in terms of\n' );
  fprintf ( 1, '    right ascension and declination.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     RA1       DEC1      RA2       DEC2    Radians  Degrees\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p1(1:3,1) = ptest(1:3,i);

    [ ra1, dec1 ] = xyz_to_radec ( p1 );

    for j = i+1 : ntest

      p2(1:3,1) = ptest(1:3,j);

      [ ra2, dec2 ] = xyz_to_radec ( p2 );
      theta = radec_distance_3d ( ra1, dec1, ra2, dec2 );
      theta_deg = radians_to_degrees ( theta );
      fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
        ra1, dec1, ra2, dec2, theta, theta_deg );

    end

  end

  return
end
