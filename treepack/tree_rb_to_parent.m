function parent = tree_rb_to_parent ( n, a )

%*****************************************************************************80
%
%% TREE_RB_TO_PARENT converts rooted binary tree to parent node representation.
%
%  Discussion:
%
%    Parent node representation of a tree assigns to each node a "parent" node,
%    which represents the first link of the path between the node and the 
%    root node.  The root node itself is assigned a parent of 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes in the tree.
%
%    Input, integer A(N), the preorder traversal form for the
%    rooted binary tree.
%
%    Output, integer PARENT(N), the parent node representation 
%    of the tree.
%
  node = 0;
  node_num = 0;

  for k = 1 : n

    dad = node;
    node_num = node_num + 1;
    node = node_num;
    parent(node) = dad;

    if ( a(k) == 1 )

      use(node) = 0;

    else

      use(node) = 2;

      while ( use(node) == 2 )
        node = dad;
        if ( node == 0 )
          break
        end
        use(node) = use(node) + 1;
        dad = parent(node);
      end

    end

  end

  return
end

