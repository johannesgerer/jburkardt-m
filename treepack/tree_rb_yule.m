function [ n, a, seed ] = tree_rb_yule ( n, a, seed )

%*****************************************************************************80
%
%% TREE_RB_YULE adds two nodes to a rooted binary tree using the Yule model.
%
%  Discussion:
%
%    The Yule model is a simulation of how an evolutionary family tree
%    develops.  We start with a root node.  The internal nodes of the tree 
%    are inactive and never change.  Each pendant or leaf node of the
%    tree represents a biological family that can spontaneously "fission",
%    developing two new distinct sub families.  In graphical terms, the node
%    becomes internal, with two new leaf nodes depending from it.
%
%    The tree is stored in inorder traversal form.
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
%    Input/output, integer N, the number of nodes in the input
%    tree.  On output, this number has been increased, usually by 2.
%
%    Input/output, integer A(*), the preorder traversal form 
%    for the rooted binary tree.  The number of entries in A is N.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
  if ( n <= 0 )
    n = 1;
    a(1) = 0;
    return
  end
%
%  Count the expected number of leaves, which are the 0 values.
%
  nleaf = floor ( ( n + 1 ) / 2 );
%
%  Choose a random number between 1 and NLEAF.
%
  ileaf = i4_uniform_ab ( 1, nleaf, seed );
%
%  Locate leaf number ILEAF.
%
  j = 0;
  jleaf = 0;
  for i = 1 : n
    if ( a(i) == 0 )
      jleaf = jleaf + 1;
    end
    if ( jleaf == ileaf )
      j = i;
      break
    end
  end
%
%  Replace '0' by '100'
%
  a(n+2:-1:j+2) = a(n:-1:j);
  a(j) = 1;
  a(j+1) = 0;

  n = n + 2;

  return
end

