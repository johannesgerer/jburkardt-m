function grf_data_print ( node_num, edge_num, edge_pointer, edge_data, xy )

%*****************************************************************************80
%
%% GRF_DATA_PRINT prints the data of a GRF file.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Edge pointers:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node     First      Last\n' );
  fprintf ( 1, '\n' );
  for node = 1 : node_num
    fprintf ( 1, '  %4d  %8d  %8d\n', ...
      node, edge_pointer(node), edge_pointer(node+1)-1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Edge data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node     Adjacent nodes\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %4d', node );
    for edge = edge_pointer(node) : edge_pointer(node+1) - 1
      fprintf ( 1, '  %8d', edge_data(edge) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node        X          Y\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, ' %4d  %10f  %10f\n', node, xy(1:2,node) );
  end

  return
end
