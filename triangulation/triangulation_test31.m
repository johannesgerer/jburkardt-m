function triangulation_test31 ( )

%*****************************************************************************80
%
%% TEST31 tests VORONOI_POLYGON_AREA.
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

  area_correct = 0.5;
  center = 5;
  neighbor_index = [ 1, 2, 3, 4 ];
  node_xy = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0; ...
    0.5, 0.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST31\n' );
  fprintf ( 1, '  VORONOI_POLYGON_AREA computes the area of\n' );
  fprintf ( 1, '  a finite Voronoi polygon.\n' );

  area = voronoi_polygon_area ( center, neighbor_num, neighbor_index, ...
    node_num, node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The computed area is %f\n', area );
  fprintf ( 1, '  The correct area is  %f\n', area_correct );

  return
end
