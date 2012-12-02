function geometry_test037 ( )

%*****************************************************************************80
%
%% TEST037 tests SEGMENT_POINT_NEAR_3D.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST037\n' );
  fprintf ( 1, '  SEGMENT_POINT_NEAR_3D computes the nearest\n' );
  fprintf ( 1, '    point on a line segment, to a given point,\n' );
  fprintf ( 1, '    in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Case, T, Distance, PN.\n' );
  fprintf ( 1, '\n' );
%
%  Case 1, point is nearest end of segment.
%
%  LS: (2,3,0) + t * (2,1,0) for t = 0 to 3.
%  P (11,6,4)
%  Distance is 5.
%
  p1(1:3,1) = [ 2.0, 3.0, 0.0 ];
  p2(1:3,1) = [ 8.0, 6.0, 0.0 ];

  p(1:3,1) = [ 11.0, 6.0, 4.0 ];

  [ pn, dist, t ] = segment_point_near_3d ( p1, p2, p );

  fprintf ( 1, '  1  %8f  %8f  %8f  %8f  %8f\n', t, dist, pn(1:3,1) );
%
%  Case 2, point is nearest interior point of segment.
%
%  LS: (2,3,0) + t * (2,1,0) for t = 0 to 3.
%  P (4,4,1)
%  Distance is 1.
%
  p1(1:3,1) = [ 2.0, 3.0, 0.0 ];
  p2(1:3,1) = [ 8.0, 6.0, 0.0 ];

  p(1:3,1) = [ 4.0, 4.0, 1.0 ];

  [ pn, dist, t ] = segment_point_near_3d ( p1, p2, p );

  fprintf ( 1, '  2  %8f  %8f  %8f  %8f  %8f\n', t, dist, pn(1:3,1) );
%
%  Case 3, point is on the line.
%
%  LS: (2,3,0) + t * (2,1,0) for t = 0 to 3.
%  P (6,5,0)
%  Distance is 0.
%
  p1(1:3,1) = [ 2.0, 3.0, 0.0 ];
  p2(1:3,1) = [ 8.0, 6.0, 0.0 ];

  p(1:3,1) = [ 6.0, 5.0, 0.0 ];

  [ pn, dist, t ] = segment_point_near_3d ( p1, p2, p );

  fprintf ( 1, '  3  %8f  %8f  %8f  %8f  %8f\n', t, dist, pn(1:3,1) );

  return
end
