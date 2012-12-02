function ierror = edge_check ( n_node, n_edge, t )

%*****************************************************************************80
%
%% EDGE_CHECK checks a graph stored by edges.
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
%    Input, integer  N_NODE, the number of nodes in the graph.
%    N_NODE must be positive.
%
%    Input, integer N_EDGE, the number of edges in the graph.
%    N_EDGE must be positive.
%
%    Input, integer T(2,N_EDGE), describes the edges of the tree
%    as pairs of nodes.
%
%    Output, integer IERROR, error flag.
%    -1, N_NODE is not positive.
%    -2, N_EDGE is not positive.
%    0, no error.
%    I, edge T(1,I), T(2,I) is illegal.
%
  ierror = 0;

  if ( n_node < 1 )
    ierror = -1;
    return
  end

  if ( n_edge < 1 )
    ierror = -2;
    return
  end
%
%  Every edge must join two legal nodes.
%
  for i = 1 : 2
    for j = 1 : n_edge
      if ( t(i,j) < 1 || n_node < t(i,j) )
        ierror = i;
        return
      end
    end
  end
%
%  Every edge must join distinct nodes.
%
  for j = 1 : n_edge
    if ( t(1,j) == t(2,j) )
      ierror = i;
      return
    end
  end
%
%  Every edge must be distinct.
%
  for j = 1 : n_edge - 1
    for j2 = j + 1 : n_edge
      if ( t(1,j) == t(1,j2) && t(2,j) == t(2,j2) )
        ierror = j2;
        return
      elseif ( t(1,j) == t(2,j2) && t(2,j) == t(1,j2) )
        ierror = j2;
        return
      end
    end
  end

  return
end
