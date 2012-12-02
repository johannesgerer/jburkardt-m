function [ l, r ] = r8btree_bracket ( node_num, tree, data_num, tree_data, x )

%*****************************************************************************80
%
%% R8BTREE_BRACKET finds X1 <= X <= X2 from a BTREE.
%
%  Discussion:
%
%    We have a set of predefined nodes in a list, and a point X.
%
%    The first and second nodes are the minimum and maximum values,
%    and define the first interval.  
%
%    The first interval defines a "midpoint" (which need not actually be 
%    in the center).  
%
%    The midpoint subdivides the interval into two subintervals.
%
%    We proceed in this way, with each subinterval defining a midpoint that
%    may be used to define further subintervals.
%
%    This information is stored as a binary tree.  
%
%    Now we are given a value X which is known to lie within the interval.
%    We seek the smallest subinterval containing X, and we return the
%    indices of the the nodes that bracket the point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2009
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
%  If there is no midpoint of the new subinterval, we have reached
%  the subdivision limit and are done.
%
    if ( m == - 1 )
      break
    end

  end

  return
end

