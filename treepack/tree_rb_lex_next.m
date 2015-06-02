function [ a, more ] = tree_rb_lex_next ( n, a, more )

%*****************************************************************************80
%
%% TREE_RB_LEX_NEXT generates rooted binary trees in lexicographic order.
%
%  Discussion:
%
%    The information definining the tree of N nodes is stored in a vector 
%    of 0's and 1's, in preorder traversal form.  Essentially, the
%    shape of the tree is traced out with a pencil that starts at the root,
%    and stops at the very last null leaf.  The first time that a (non-null) 
%    node is encountered, a 1 is added to the vector, and the left 
%    descendant of the node is visited next.  When the path returns from
%    the first descendant, the second descendant is visited.  When then path
%    returns again, the path passes back up from the node to its parent.
%    A null leaf is encountered only once, and causes a zero to be added to 
%    the vector, and the path goes back up to the parent node.  
%
%    The lexicographic order is used to order the vectors of 1's and 0's.
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
%    Frank Ruskey,
%    Combinatorial Generation,
%    To appear.
%
%  Parameters:
%
%    Input, integer N, the number of nodes in the rooted binary
%    tree.  N should be odd.
%
%    Input/output, integer A(N), the preorder traversal form for
%    the previous/next rooted binary tree.
%
%    Output, logical MORE, is TRUE if the next rooted binary tree was
%    returned on this call, or FALSE if there are no more rooted binary
%    trees, and the output of the previous call was the last one.
%
  if ( ~ more )
    a(1:2:n-2) = 1;
    a(2:2:n-1) = 0;
    a(n) = 0;
    more = 1;
    return
  end
%
%  Find the last 1 in A.
%
  k = n;
  while ( a(k) == 0 )
    k = k - 1;
  end
  q = n - k - 1;
%
%  Find the last 0 preceding the last 1 in A.
%  If there is none, then we are done, because 11...1100..00 
%  is the final element.
%
  while ( 1 )

    if ( k == 1 )
      more = 0;
      return
    end

    if ( a(k) == 0 )
      break
    end

    k = k - 1;

  end
	
  p = n - k - q - 1;
  a(k) = 1;
  a(k+1:n-2*p+1) = 0;
  a(n-2*p+2:2:n-2) = 1;
  a(n-2*p+3:2:n-1) = 0;
  a(n) = 0;

  return
end
