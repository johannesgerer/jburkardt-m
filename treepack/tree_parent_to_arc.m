function [ nedge, inode, jnode ] = tree_parent_to_arc ( nnode, parent )

%*****************************************************************************80
%
%% TREE_PARENT_TO_ARC converts a tree from parent to arc representation.
%
%  Discussion:
%
%    Parent representation lists the parent node of each node.  For a
%    tree of N nodes, one node has a parent of 0, representing a null link.
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
%    Input, integer NNODE, the number of nodes in the tree.
%
%    Input, integer PARENT(NNODE), the parent node representation 
%    of the tree.
%
%    Output, integer NEDGE, the number of edges, normally NNODE-1.
%
%    Output, integer INODE(NEDGE), JNODE(NEDGE), pairs of nodes
%    that define the links.
%
  nedge = 0;

  for i = 1 : nnode

    if ( parent(i) ~= 0 )
      nedge = nedge + 1;
      inode(nedge) = i;
      jnode(nedge) = parent(i);
    end

  end

  return
end

