function [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
  data_num, tree_data, node_data )

%*****************************************************************************80
%
%% R8BTREE_NODE_ADD adds one node to a BTREE.
%
%  Discussion:
%
%    A BTREE is a binary tree.
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
%    Input, real NODE_DATA(DATA_NUM), data associated with the new node.
%
%    Output, integer NODE_NUM, the updated value.
%
%    Output, integer TREE(4,NODE_NUM), the updated value.
%
%    Output, integer TREE_DATA(DATA_NUM,NODE_NUM), the updated value.
%
  if ( node_num <= 0 )
    tree(1:4,1) = [ 1, -1, -1, -1 ];
    tree_data(1:data_num,1) = node_data(1:data_num);
    node_num = 1;
    return
  end

  l = -1;
  m = 1;
  r = -1;
%
%  Divide the current interval [L,R] by the midpoint M.
%  X falls either into [L,M] or [M,R].
%
  x = node_data(1);

  while ( 1 )

    xm = tree_data(1,tree(1,m));
    m_old = m;

    if ( x < xm )
      r = m;
      m = tree(2,m);
      if ( m == - 1 )
        tree(2,m_old) = node_num + 1;
        tree(1,node_num+1) = node_num + 1;
        tree(2,node_num+1) = -1;
        tree(3,node_num+1) = -1;
        tree(4,node_num+1) = m_old;
        tree_data(1:data_num,node_num+1) = node_data(1:data_num);
        node_num = node_num + 1;
        break
      end
    elseif ( xm < x )
      l = m;
      m = tree(3,m);
      if ( m == -1 )
        tree(3,m_old) = node_num + 1;
        tree(1,node_num+1) = node_num + 1;
        tree(2,node_num+1) = -1;
        tree(3,node_num+1) = -1;
        tree(4,node_num+1) = m_old;
        tree_data(1:data_num,node_num+1) = node_data(1:data_num);
        node_num = node_num + 1;
        break
      end
    else
      r = m;
      l = m;
      break
    end

  end

  return
end
