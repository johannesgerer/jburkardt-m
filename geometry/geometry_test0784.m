function geometry_test0784 ( )

%*****************************************************************************80
%
%% TEST0784 tests POLYGON_CENTROID_2D and POLYGON_CENTROID_2D_2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  dim_num = 2;

  v = [ ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0784\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_CENTROID_2D computes the centroid.\n' );
  fprintf ( 1, '  POLYGON_CENTROID_2D_2 computes the centroid.\n' );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

  centroid = polygon_centroid_2d ( n, v );

  r8vec_print ( dim_num, centroid, '  POLYGON_CENTROID_2D:' );

  centroid = polygon_centroid_2d_2 ( n, v );

  r8vec_print ( dim_num, centroid, '  POLYGON_CENTROID_2D_2:' );

  return
end
