function nedge = edge_enum ( n_node )

%*****************************************************************************80
%
%% EDGE_ENUM enumerates the maximum number of edges in a graph on N_NODE nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_NODE, the number of nodes in the graph.
%    N_NODE must be positive.
%
%    Output, integer NEDGE, the maximum number of edges in a graph
%    on N_NODE nodes.
%
  nedge = ( n_node * ( n_node - 1 ) ) / 2;

  return
end
