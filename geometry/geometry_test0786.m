function geometry_test0786 ( )

%*****************************************************************************80
%
%% TEST0786 tests POLYGON_CENTROID_3D.
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
  dim_num = 3;

  v = [ ...
    1.0, 0.0, 0.0; ...
    2.0, 1.0, 1.0; ...
    1.0, 2.0, 1.0; ...
    0.0, 1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0786\n' );
  fprintf ( 1, '  For a polygon in 3D:\n' );
  fprintf ( 1, '  POLYGON_CENTROID_3D computes the centroid.\n' );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' )

  centroid = polygon_centroid_3d ( n, v );

  r8vec_print ( dim_num, centroid, '  The centroid:' );
 
  return
end
