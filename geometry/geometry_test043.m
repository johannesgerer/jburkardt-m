function geometry_test043 ( )

%*****************************************************************************80
%
%% TEST043 tests SEGMENTS_DIST_3D.
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
  fprintf ( 1, 'TEST043\n' );
  fprintf ( 1, '  SEGMENTS_DIST_3D computes the distance between\n' );
  fprintf ( 1, '    line segments in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Case   Computed    True\n' );
  fprintf ( 1, '\n' );
%
%  Case 1, parallel, not coincident.
%
%  LS1: (2,3,0) + t * (2,1,0) for t = 0 to 3.
%  LS2: (11,6,4) + t * (2,1,0) for t = 0 to 3.
%  Distance is 5.
%
  p1(1:3,1) = [  2.0; 3.0; 0.0 ];
  p2(1:3,1) = [  8.0; 6.0; 0.0 ];
  q1(1:3,1) = [ 11.0; 6.0; 4.0 ];
  q2(1:3,1) = [ 17.0; 9.0; 4.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  1  %8f  5.0\n', dist );
%
%  Case 2, parallel, coincident, overlapping.
%
%  (1,2,3) + t * ( 1,-1,2)
%  LS1: t = 0 to t = 3.
%  Distance is 0.
%
  p1(1:3,1) = [  1.0;  2.0;  3.0 ];
  p2(1:3,1) = [  4.0; -1.0;  9.0 ];
  q1(1:3,1) = [  3.0;  0.0;  7.0 ];
  q2(1:3,1) = [  6.0; -3.0; 13.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 2, '  1  %8f  0.0\n', dist );
%
%  Case 3, parallel, coincident, disjoint.
%
%  LS1: (3,4,5) + t * ( 2,2,1) for 0 <= t <= 2.
%  LS2: (3,4,5) + t * ( 2,2,1) for 3 <= t <= 5.
%  Distance = 3.
%
  p1(1:3,1) = [  3.0;  4.0;  5.0 ];
  p2(1:3,1) = [  7.0;  8.0;  7.0 ];
  q1(1:3,1) = [  9.0; 10.0;  8.0 ];
  q2(1:3,1) = [ 13.0; 14.0; 10.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  3  %8f  3.0\n', dist );
%
%  Case 4, nonparallel, could intersect, and does intersect.
%
%  L1: (1,1,1) + t * (0,1,2)
%  L2: (0,2,3) + t * (1,0,0)
%  intersect at (1,2,3)
%  Distance is 0.
%
  p1(1:3,1) = [  1.0;  1.0;  1.0 ];
  p2(1:3,1) = [  1.0;  4.0;  7.0 ];
  q1(1:3,1) = [  0.0;  2.0;  3.0 ];
  q2(1:3,1) = [  5.0;  2.0;  3.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  4  %8f  0.0\n', dist );
%
%  Case 5, nonparallel, could intersect, and does not intersect.
%
%  L1: (1,1,1) + t * (0,1,2)
%  L2: (0,2,3) + t * (1,0,0)
%  lines intersect at (1,2,3), line segments do not.
%  Distance is 1.0
%
  p1(1:3,1) = [  1.0;  1.0;  1.0 ];
  p2(1:3,1) = [  1.0;  4.0;  7.0 ];
  q1(1:3,1) = [  0.0;  2.0;  3.0 ];
  q2(1:3,1) = [ -5.0;  2.0;  3.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  5  %8f  1.0\n', dist );
%
%  Case 6, nonparallel, can not intersect, "end-to-end".
%
%  L1: (2,2,1) + t * (0,1,2)  0 <= t <= 5
%  L2: (0,0,0) + t * (-1,-1,-1) 0 <= t <= 5
%  Distance is 3.
%
  p1(1:3,1) = [  2.0;  2.0;  1.0 ];
  p2(1:3,1) = [  2.0;  7.0;  11.0 ];
  q1(1:3,1) = [  0.0;  0.0;  0.0 ];
  q2(1:3,1) = [ -5.0; -5.0; -5.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  6  %8f  3.0\n', dist );
%
%  Case 7, nonparallel, can not intersect, "end-to-mid".
%
%  L1: (1,1,1) + t * (0,1,2) 0 <= t <= 5
%  L2: (0,4,7) + t * (-1,0,0) 0 <= t <= 5
%  Distance is 1.
%
  p1(1:3,1) = [  1.0;  1.0;  1.0 ];
  p2(1:3,1) = [  1.0;  6.0; 11.0 ];
  q1(1:3,1) = [  0.0;  4.0;  7.0 ];
  q2(1:3,1) = [ -5.0;  4.0;  7.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  7  %8f  1.0\n', dist );
%
%  Case 8, nonparallel, can not intersect, "mid-to-mid".
%
%  L1: (0,5,10) + t * (1,-1,0) 0 <= t <= 5
%  L2: (0,0,0) + t * (1,1,0) 0 <= t <= 6
%  Distance = 10.
%
  p1(1:3,1) = [  0.0;  5.0; 10.0 ];
  p2(1:3,1) = [  5.0;  0.0; 10.0 ];
  q1(1:3,1) = [  0.0;  0.0;  0.0 ];
  q2(1:3,1) = [  6.0;  6.0;  0.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  8  %8f 10.0\n', dist );
%
%  Case 9, nonparallel, can not intersect, "mid-to-end".
%
%  L1: (-2,0,0) + t * (1,0,0) 0 <= t <= 12
%  L2: (-2,8,1) + t * (9,-4,-1) 0 <= t <= 1
%  Distance = 4.
%
  p1(1:3,1) = [ -2.0;  0.0;  0.0 ];
  p2(1:3,1) = [ 10.0;  0.0;  0.0 ];
  q1(1:3,1) = [ -2.0;  8.0;  1.0 ];
  q2(1:3,1) = [  7.0;  4.0;  0.0 ];

  dist = segments_dist_3d ( p1, p2, q1, q2 );

  fprintf ( 1, '  9  %8f  4.0\n', dist );

  return
end
