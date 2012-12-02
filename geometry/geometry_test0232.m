function geometry_test0232 ( )

%*****************************************************************************80
%
%% TEST0232 tests DISK_POINT_DIST_3D.
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
  dim_num = 3;
  test_num = 5;

  axis = [ 0.0, 1.0, 1.0 ];
  dist_test = [ 2.0, 0.0, 0.0, 8.0, 10.0 ];
  pc = [ 0.0, 1.4142135, 1.4142135 ];
  p_test = [ ...
     0.0,  0.0,        0.0; ...
     0.0,  0.70710677, 2.1213202; ...
     2.0,  1.4142135,  1.4142135; ...
    10.0,  1.4142135,  1.4142135; ...
    10.0,  5.6568542,  5.6568542 ]';
  r = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0232\n' );
  fprintf ( 1, '  DISK_POINT_DIST_3D finds the distance from\n' );
  fprintf ( 1, '    a disk to a point in 3D.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Disk radius = %f\n', r );
  r8vec_print ( dim_num, pc, '  Disk center: ' );
  r8vec_print ( dim_num, axis, '  Disk axis: ' );

  for test = 1 : test_num

    p(1:dim_num) = p_test(1:dim_num,test);

    r8vec_print ( dim_num, p, '  Point: ' );

    dist = disk_point_dist_3d ( pc, r, axis, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Distance = %f,  Expected = %f\n', dist, dist_test(test) );

  end

  return
end
