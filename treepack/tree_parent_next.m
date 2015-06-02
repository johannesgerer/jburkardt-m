function [ code, itree, more ] = tree_parent_next ( nnode, more )

%*****************************************************************************80
%
%% TREE_PARENT_NEXT generates, one at a time, all labeled trees.
%
%  Discussion:
%
%    The routine also returns the corresponding Pruefer codes.
%
%    There are N^(N-2) labeled trees on N nodes (Cayley's formula).
%
%    The number of trees in which node I has degree D(I) is the
%    multinomial coefficient: ( N-2; D(1)-1, D(2)-1, ..., D(N)-1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes to be used in 
%    the trees.
%
%    Output, integer CODE(NNODE).  The first NNODE-2 entries 
%    of CODE contain the Pruefer code for the given labeled tree.
%
%    Output, integer ITREE(NNODE).  The first NNODE-1 entries 
%    of ITREE describe the edges that go between the nodes.  Each pair
%    (I, ITREE(I)) represents an edge.  Thus if ITREE(5) = 3,
%    there is an edge from node 3 to node 5.
%
%    Input/output, logical MORE.  On the first call only, the
%    user is required to set MORE = .FALSE.  Then call the routine, and
%    it will return information about the first tree
%    as well as setting MORE to the value .TRUE.
%    Keep calling to get another tree until MORE is .FALSE.
%    on return, at which point there are no more trees.
%
  persistent iarray;

  if ( ~ more )
    iarray = [];
  end

  [ iarray, more ] = vec_next ( nnode-2, nnode, iarray, more );
 
  code(1:nnode-2) = iarray(1:nnode-2) + 1;
 
  itree = pruefer_to_tree_2 ( nnode, code );
 
  return
end
