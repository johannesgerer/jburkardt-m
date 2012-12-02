function cbt_traverse ( depth )

%*****************************************************************************80
%
%% CBT_TRAVERSE traverses a complete binary tree of given depth.
%
%  Discussion:
%
%    There will be 2^DEPTH terminal nodes of the complete binary tree.
%
%    This function traverses the tree, and prints out a binary code of 0's
%    and 1's each time it encounters a terminal node.  This results in a 
%    printout of the binary digits from 0 to 2^DEPTH - 1.
%
%    The function is intended as a framework to be used to traverse a binary
%    tree.  Thus, in practice, a user would insert some action when a terminal
%    node is encountered.
%
%    Another use would occur when a combinatorial search is being made, for
%    example in a knapsack problem.  Each binary string then represents which
%    objects are to be included in the knapsack.  In that case, the traversal
%    could be speeded up by noticing cases where a nonterminal node has been
%    reached, but the knapsack is already full, in which case the only solution
%    uses none of the succeeding items, or overfull, in which case no solutions
%    exist that include this initial path segment.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEPTH, the depth of the tree.
%
  if ( depth < 1 ) 
    return
  end

  DOWNLEFT = 1;
  UPDOWNRIGHT = 2;
  UP = 3;

  b(1:depth) = 0;
  p = 0;
  direction = DOWNLEFT;
  k = 0;

  while ( 1 )
%
%  Try going in direction DOWNLEFT.
%
    if ( direction == DOWNLEFT )
      p = p + 1;
      b(p) = 0;
      if ( depth <= p )
        fprintf ( 1, '%d  ', k );
        for i = 1 : depth
          fprintf ( 1, '%d', b(i) );
        end
        fprintf ( 1, '\n' );
        k = k + 1;
        direction = UPDOWNRIGHT;
      end
    end
%
%  Try going in direction UPDOWNRIGHT.
%
    if ( direction == UPDOWNRIGHT )
      b(p) = + 1;
      if ( p < depth )
        direction = DOWNLEFT;
      else
        fprintf ( 1, '%d  ', k );
        for i = 1 : depth
          fprintf ( 1, '%d', b(i) );
        end
        fprintf ( 1, '\n' );
        k = k + 1;
        direction = UP;
      end
    end
%
%  Try going in direction UP.
%
    if ( direction == UP )
      p = p - 1;
      if ( 1 <= p )
        if ( b(p) == 0 )
          direction = UPDOWNRIGHT;
        end
      else
        break
      end
    end

  end

  return
end

