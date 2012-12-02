function triangulation_order3_neighbor_nodes_print ( node_num, nabes_first, ...
  nabes_num, nabes_dim, nabes )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_NEIGHBOR_NODES_PRINT prints a node neighbor array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer NABES_FIRST(NODE_NUM), the index in NABES of the first
%    neighbor in the list for each node.
%
%    Input, integer NABES_NUM(NODE_NUM), the number of neighbors of each node.
%
%    Input, integer NABES_DIM, the dimension of NABES.
%
%    Input, integer NABES(NABES_DIM), a list of the neighbors of all the nodes.
%    Neighbors of node 1 are listed first, and so on.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Node based arrays:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Node  Neighbors  Index #1\n' );
  fprintf ( 1, '\n' );
  for i = 1 : node_num
    fprintf ( 1, '  %6d  %6d  %6d\n', i, nabes_num(i), nabes_first(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1,  The raw neighbor array.\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nabes_dim
    fprintf ( 1, '  %6d  %6d\n',i, nabes(i) );
  end

  return
end
