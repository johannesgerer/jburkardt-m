function [ inode, jnode ] = pruefer_to_tree_arc ( nnode, iarray )

%*****************************************************************************80
%
%% PRUEFER_TO_TREE_ARC is given a Pruefer code, and computes the tree.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input, integer IARRAY(NNODE-2), the Pruefer code of the tree.
%
%    Output, integer INODE(NNODE-1), JNODE(NNODE-1), the edge
%    array of the tree.  The I-th edge joins nodes INODE(I) and JNODE(I).
%

%
%  Initialize IWORK(I) to count the number of neighbors of node I.
%  The Pruefer code uses each node one less time than its total
%  number of neighbors.
%
  iwork(1:nnode) = 1;
 
  for i = 1 : nnode - 2
    iwork(iarray(i)) = iwork(iarray(i)) + 1;
  end
%
%  Now process each entry in the Pruefer code.
%
  for i = 1 : nnode - 2
 
    ii = 0;
    for j = 1 : nnode
      if ( iwork(j) == 1 )
        ii = j;
      end
    end
 
    inode(i) = ii;
    jnode(i) = iarray(i);
    iwork(ii) = 0;
    iwork(iarray(i)) = iwork(iarray(i)) - 1;
 
  end
 
  inode(nnode-1) = iarray(nnode-2);
 
  if ( iarray(nnode-2) ~= 1 )
    jnode(nnode-1) = 1;
  else
    jnode(nnode-1) = 2;
  end
 
  return
end
