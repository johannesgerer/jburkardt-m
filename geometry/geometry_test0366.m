function geometry_test0366 ( )

%*****************************************************************************80
%
%% TEST0366 tests SEGMENT_POINT_DIST_3D.
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
  test_num = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0366\n' );
  fprintf ( 1, '  SEGMENT_POINT_DIST_3D computes the distance\n' );
  fprintf ( 1, '    between a line segment and point in 3D.\n' );

  for test = 1 : test_num

    [ p1(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );
    [ p2(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );
    [ p(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );

    dist = segment_point_dist_3d ( p1, p2, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  TEST = %d', test );
    fprintf ( 1, '  P1 =   %12f  %12f  %12f\n', p1(1:3,1) );
    fprintf ( 1, '  P2 =   %12f  %12f  %12f\n', p2(1:3,1) );
    fprintf ( 1, '  P =    %12f  %12f  %12f\n', p(1:3,1) );
    fprintf ( 1, '  DIST = %12f\n', dist );

  end

  return
end
