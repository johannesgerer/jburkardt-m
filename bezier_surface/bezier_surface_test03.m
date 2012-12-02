function bezier_surface_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests BEZIER_PATCH_EVALUATE.
%
%  Discussion:
%
%    For simplicity, we set up a Bezier surface of a single patch.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
  node_num = 16;
  point_num = 16;
  rectangle_num = 1;

  rectangle_node = [ ...
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  BEZIER_PATCH_EVALUATE evaluates points in one\n' );
  fprintf ( 1, '  patch of a Bezier surface.\n' );

  node = 0;
  for j = 1 : 4
    y = ( j - 1 ) / 3.0;
    for i = 1 : 4
      x = ( i - 1 ) / 3.0;
      node = node + 1;
      node_xyz(1,node) = x;
      node_xyz(2,node) = y;
      node_xyz(3,node) = x * ( 1.0 - x ) * y * y;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodal coordinates:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %2d  %12f  %12f  %12f\n', node, node_xyz(1:3,node) );
  end

  patch = 1;

  point = 0;
  for j = 1 : 4
    for i = 1 : 4
      point = point + 1;
      point_uv(1,point) = ( i - 1 ) / 3.0;
      point_uv(2,point) = ( j - 1 ) / 3.0;
    end
  end

  point_xyz = bezier_patch_evaluate ( node_num, node_xyz, rectangle_num, ...
    rectangle_node, patch, point_num, point_uv );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (U,V) --> (X,Y,Z) coordinates:\n' );
  fprintf ( 1, '\n' );

  for point = 1 : point_num
    fprintf ( 1, '  %2d  %12f  %12f  %12f  %12f  %12f\n', ...
      point, point_uv(1:2,point), point_xyz(1:3,point) );
  end

  return
end
