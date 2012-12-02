function geometry_test068 ( )

%*****************************************************************************80
%
%% GEOMETRY_TEST068 tests the SPHERE_DISTANCE routines.
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

  name = [ ...
       'Atlanta, Georgia  '; ...
       'North Pole        '; ...
       'South Pole        '; ...
       'Timbuktu          '; ...
       'San Antonio, Texas'; ...
       'Savannah, Georgia ' ];
  lat_d =  [ 33, 90, -90, 16, 29, 32 ];
  lat_m =  [ 11,  0,   0, 49, 25,  5 ];
  long_d = [ 82,  0,   0,  3, 98, 81 ];
  long_m = [ 34,  0,   0,  0, 30,  6 ];
  radius = 3957.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST068\n' );
  fprintf ( 1, '  POINTS_DIST_SPHERE_3D measures the distance between\n' );
  fprintf ( 1, '  two points on a sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  All tests uses RADIUS = %f\n', radius );
  fprintf ( 1, '  which is the radius of the earth in miles.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest-1

    lat1 = dms_to_radians ( lat_d(i), lat_m(i), 0.0 );
    long1 = dms_to_radians ( long_d(i), long_m(i), 0.0 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Distance from %s\n', name(i,:) );

    for j = i+1 : ntest

      lat2 = dms_to_radians ( lat_d(j), lat_m(j), 0.0 );
      long2 = dms_to_radians ( long_d(j), long_m(j), 0.0 );

      dist1 = sphere_distance1 ( lat1, long1, lat2, long2, radius );
      dist2 = sphere_distance2 ( lat1, long1, lat2, long2, radius );
      dist3 = sphere_distance3 ( lat1, long1, lat2, long2, radius );

      fprintf ( 1, '             to %s is %16.8f  %16.8f  %16.8f\n', ...
        name(j,:), dist1, dist2, dist3 );

    end

  end

  return
end
