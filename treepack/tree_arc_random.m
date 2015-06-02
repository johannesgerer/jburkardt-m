function [ code, inode, jnode, seed ] = tree_arc_random ( nnode, seed )

%*****************************************************************************80
%
%% TREE_ARC_RANDOM selects a random labeled tree and its Pruefer code.
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
%    Input, integer NNODE, the number of nodes.
%
%    Input/output, integer SEED, a seed for the random number 
%    generator.
%
%    Output, integer CODE(NNODE-2), the Pruefer code for the 
%    labeled tree.
%
%    Output, integer INODE(NNODE-1), JNODE(NNODE-1), the edge 
%    array for the tree.
%
  if ( nnode <= 0  )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ARC_RANDOM - Fatal error!\n' );
    fprintf ( 1, '  NNODE = %d\n', nnode );
    fprintf ( 1, '  but NNODE must be at least 1.\n' );
    error ( 'TREE_ARC_RANDOM - Fatal error!' );
  end

  if ( nnode <= 2 )
    return
  end

  [ code, seed ] = vec_random ( nnode-2, nnode, seed );
 
  code(1:nnode-2) = code(1:nnode-2) + 1;
 
  [ inode, jnode ] = pruefer_to_tree_arc ( nnode, code );
 
  return
end
