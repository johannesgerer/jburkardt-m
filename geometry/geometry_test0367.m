function geometry_test0367 ( )

%*****************************************************************************80
%
%% TEST0367 tests SEGMENT_POINT_DIST_2D.
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
  dim_num = 2;
  test_num = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0367\n' );
  fprintf ( 1, '  SEGMENT_POINT_NEAR_2D computes the nearest point\n' );
  fprintf ( 1, '    from a line segment to a point in 2D.\n' );

  for test = 1 : test_num

    [ p1, seed ] = r8vec_uniform_01 ( dim_num, seed );
    [ p2, seed ] = r8vec_uniform_01 ( dim_num, seed );
    [ p, seed ] = r8vec_uniform_01 ( dim_num, seed );

    [ pn, dist, t ] = segment_point_near_2d ( p1, p2, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  TEST = %d', test );
    fprintf ( 1, '  P1 =   %12f  %12f\n', p1(1:dim_num) );
    fprintf ( 1, '  P2 =   %12f  %12f\n', p2(1:dim_num) );
    fprintf ( 1, '  P =    %12f  %12f\n', p(1:dim_num) );
    fprintf ( 1, '  PN =   %12f  %12f\n', pn(1:dim_num) );
    fprintf ( 1, '  DIST = %12f\n', dist );
    fprintf ( 1, '  T =    %12f\n', t );

  end

  return
end
