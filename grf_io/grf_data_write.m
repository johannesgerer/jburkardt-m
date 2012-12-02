function grf_data_write ( output_unit, node_num, edge_num, edge_pointer, ...
  edge_data, xy )

%*****************************************************************************80
%
%% GRF_DATA_WRITE prints the data to a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the output file unit number.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Input, integer EDGE_POINTER(NODE_NUM+1), pointers to
%    the beginning of edge data for each node.
%
%    Input, integer EDGE_DATA(EDGE_NUM), the edge data.
%
%    Input, real XY(2,NODE_NUM), the node coordinates.
%
  for node = 1 : node_num
    fprintf ( output_unit, '  %4d  %10f  %10f', node, xy(1:2,node ) );
    for edge = edge_pointer(node) : edge_pointer(node+1) - 1
      fprintf ( output_unit, '  %4d', edge_data(edge) );
    end
    fprintf ( output_unit, '\n' );
  end

  return
end
