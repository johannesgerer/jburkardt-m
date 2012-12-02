function d = edge_degree ( n_node, n_edge, t )

%*****************************************************************************80
%
%% EDGE_DEGREE returns the degree of the nodes of a graph stored by edges.
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
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N_NODE, the number of nodes in the graph.
%    N_NODE must be positive.
%
%    Input, integer N_EDGE, the number of edges in the graph.
%    N_EDGE must be positive.
%
%    Input, integer T(2,N_EDGE), describes the edges of the tree
%    as pairs of nodes.
%
%    Output, integer D(N_NODE), the degree of each node.
%

%
%  Check.
%
  ierror = edge_check ( n_node, n_edge, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EDGE_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'EDGE_DEGREE - Fatal error!' );
  end
%
%  Compute the degree of each node.
%
  d(1:n_node) = 0;

  for j = 1 : n_edge
    d(t(1,j)) = d(t(1,j)) + 1;
    d(t(2,j)) = d(t(2,j)) + 1;
  end

  return
end
