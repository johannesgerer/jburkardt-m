function [ v_weight, predecessor ] = bellman_ford ( v_num, e_num, source, ...
  e, e_weight )

%*****************************************************************************80
%
%  Purpose:
%
%    BELLMAN_FORD finds shortest paths from a given vertex of a weighted directed graph.
%
%  Discussion:
%
%    The Bellman-Ford algorithm is used.
%
%    Each edge of the graph has a weight, which may be negative.  However,
%    it should not be the case that there is any negative loop, that is,
%    a circuit whose total weight is negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer V_NUM, the number of vertices.
%
%    Input, integer E_NUM, the number of edges.
%
%    Input, integer SOURCE, the vertex from which distances will 
%    be calculated.
%
%    Input, integer E(2,E_NUM), the edges, given as pairs of 
%    vertex indices.
%
%    Input, real E_WEIGHT(E_NUM), the weight of each edge.
%
%    Output, real V_WEIGHT(V_NUM), the weight of each node, 
%    that is, its minimum distance from SOURCE.
%
%    Output, integer PREDECESSOR(V_NUM), a list of predecessors, 
%    which can be used to recover the shortest path from any node back to SOURCE.
%    
  r8_big = 1.0E+30;
%
%  Step 1: initialize the graph.
%
  v_weight(1:v_num) = r8_big;
  v_weight(source) = 0.0;

  predecessor(1:v_num) = -1;
%
%  Step 2: Relax edges repeatedly.
%
  for i = 1 : v_num - 1
    for j = 1 : e_num
      u = e(2,j);
      v = e(1,j);
      t = v_weight(u) + e_weight(j);
      if ( t < v_weight(v) )
        v_weight(v) = t;
        predecessor(v) = u;
      end
    end
  end
%
%  Step 3: check for negative-weight cycles
%
  for j = 1 : e_num
    u = e(2,j);
    v = e(1,j);
    if ( v_weight(u) + e_weight(j) < v_weight(v) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BELLMAN_FORD - Fatal error!\n' );
      fprintf ( 1, '  Graph contains a cycle with negative weight.\n' );
      error ( 'BELLMAN_FORD - Fatal error!' );
    end
  end

  return
end

