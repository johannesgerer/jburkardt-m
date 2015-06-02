function triangle_node_write ( node_filename, node_num, node_dim, ...
  node_att_num, node_marker_num, node_coord, node_att, node_marker )

%*****************************************************************************80
%
%% TRIANGLE_NODE_WRITE writes a TRIANGLE ".node" file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_DIM, the spatial dimension.
%
%    Input, integer NODE_ATT_NUM, number of node attributes
%    listed on each node record.
%
%    Input, integer NODE_MARKER_NUM, 1 if every node record 
%    includes a final boundary marker value.
%
%    Output, real NODE_COORD(NODE_DIM*NODE_NUM), the nodal 
%    coordinates.
%
%    Output, real NODE_ATT(NODE_ATT_NUM*NODE_NUM), the nodal
%    attributes.
%
%    Output, integer NODE_MARKER(NODE_MARKER_NUM,NODE_NUM), 
%    the node markers.
%
  output = fopen ( node_filename, 'wt' );

  if ( output < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_NODE_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_NODE_WRITE - Fatal error!' );
  end

  fprintf ( output, '%d  %d  %d  %d\n', ...
    node_num, node_dim, node_att_num, node_marker_num );

  for node = 1 : node_num

    fprintf ( output, '%d', node );

    for dim = 1 : node_dim
      fprintf ( output, '  %g', node_coord(dim,node) );
    end

    for att = 1 : node_att_num
      fprintf ( output, '  %g', node_att(att,node) );
    end

    for marker = 1 : node_marker_num
      fprintf ( output, '  %d', node_marker(marker,node) );
    end

    fprintf ( output, '\n' );

  end

  fclose ( output );

  return
end
