function [ l, r ] = r8btree_bracket_level ( node_num, tree, data_num, ...
   tree_data, x, level )

%*****************************************************************************80
%
%% R8BTREE_BRACKET_LEVEL finds X1 <= X <= X2 from a BTREE.
%
%  Discussion:
%
%    This function is a version of R8BTREE_BRACKET which restricts the
%    search in the BTREE to no more than LEVEL levels.  Setting LEVEL to 0
%    means that only the primary node of the BTREE will be considered.
%    Setting the LEVEL to 1 allows the two nodes of the first level to be
%    included in the search, and so on.  
%
%    This control on the searching is needed for a hierarchical system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the tree.
%
%    Input, integer TREE(4,NODE_NUM).
%    TREE(1,I), the index in TREE_DATA(1,*) of the coordinate of node I.
%    TREE(2,I), the left child of node I.
%    TREE(3,I), the right child of node I.
%    TREE(4,I), the parent of node I.
%
%    Input, integer DATA_NUM, the number of data items per node.
%
%    Input, real TREE_DATA(DATA_NUM,NODE_NUM), node data.
%
%    Input, real X, a point to be bracketed.
%
%    Input, integer LEVEL, the maximum level to search.
%    0 <= LEVEL.
%
%    Output, integer L, R, bracket indices such that
%    TREE_DATA(1,L) <= X <= TREE_DATA(1,R).  If X is exactly equal to a node,
%    then L and R will be equal.  If X lies outside the interval,
%    then one of L or R will be -1.
%
  l = -1;
  r = -1;

  if ( node_num < 1 ) 
    return
  end

  m = 1;
  depth = 0;
%
%  Divide the current interval [L,R] by the midpoint M.
%  X falls either into [L,M] or [M,R].
%
  while ( 1 )

    xm = tree_data(1,tree(1,m));

    if ( x < xm )
      r = m;
      m = tree(2,m);
    elseif ( xm < x )
      l = m;
      m = tree(3,m);
    else
      r = m;
      l = m;
      break
    end
%
%  Terminate the search if the depth has reached LEVEL.
%
    if ( level <= depth )
      break
    end
%
%  If there is no midpoint of the new subinterval, we have reached
%  the subdivision limit and are done.
%
    if ( m == - 1 )
      break
    end

    depth = depth + 1;

  end

  return
end

