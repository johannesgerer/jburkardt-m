function fem2d_pack_test105 ( )

%*****************************************************************************80
%
%% TEST105 demonstrates GRID_NODES_01
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
  num_x = 5;
  num_y = 3;
  node_num = num_x * num_y;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST105\n' );
  fprintf ( 1, '  GRID_NODES_01 creates a regular grid in the unit square.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NUM_X =    %d\n', num_x );
  fprintf ( 1, '  NUM_Y =    %d\n', num_y );
  fprintf ( 1, '  NODE_NUM = %d\n', node_num );
  fprintf ( 1, '\n' );

  node_xy = grid_nodes_01 ( num_x, num_y );

  for node = 1 : node_num
    fprintf ( 1, '  %2d  %14f  %14f\n', node, node_xy(1,node), node_xy(2,node) );
  end

  return
end
