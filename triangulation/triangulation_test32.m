function triangulation_test32 ( )

%*****************************************************************************80
%
%% TEST32 tests VORONOI_POLYGON_CENTROID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  neighbor_num = 4;
  node_num = 5;

  center = 5;
  centroid_exact = [ 0.5, 0.5 ];
  neighbor_index = [ 1, 2, 3, 4 ];
  node_xy = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0; ...
    0.5, 0.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST32\n' );
  fprintf ( 1, '  VORONOI_POLYGON_CENTROID computes the centroid of\n' );
  fprintf ( 1, '  a finite Voronoi polygon.\n' );

  centroid = voronoi_polygon_centroid ( center, neighbor_num, ...
    neighbor_index, node_num, node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The computed centroid ( %f  %f )\n', centroid(1:dim_num) );
  fprintf ( 1, '  The correct centroid  ( %f  %f )\n', centroid_exact(1:dim_num) );

  return
end
