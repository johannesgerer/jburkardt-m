function a_out = r8vec_heap_d ( n, a )

%*****************************************************************************80
%
%% R8VEC_HEAP_D reorders an R8VEC into an descending heap.
%
%  Discussion:
%
%    A descending heap is an array A with the property that, for every index J,
%    A(J) >= A(2*J) and A(J) >= A(2*J+1), (as long as the indices
%    2*J and 2*J+1 are legal).
%
%  Diagram:
%
%                  A(1)
%                /      \
%            A(2)         A(3)
%          /     \        /  \
%      A(4)       A(5)  A(6) A(7)
%      /  \       /   \
%    A(8) A(9) A(10) A(11)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the size of the input array.
%
%    Input, real A(N), an unsorted array.
%
%    Output, real A_OUT(N), the array has been reordered into a heap.
%
  a_out(1:n) = a(1:n);
%
%  Only nodes N/2 down to 1 can be "parent" nodes.
%
  for i = floor ( n/2 ) : -1 : 1
%
%  Copy the value out of the parent node.
%  Position IFREE is now "open".
%
    key = a_out(i);
    ifree = i;

    while ( 1 )
%
%  Positions 2*IFREE and 2*IFREE + 1 are the descendants of position
%  IFREE.  (One or both may not exist because they exceed N.)
%
      m = 2 * ifree;
%
%  Does the first position exist?
%
      if ( n < m )
        break;
      end
%
%  Does the second position exist?
%
      if ( m + 1 <= n )
%
%  If both positions exist, take the larger of the two values,
%  and update M if necessary.
%
        if ( a_out(m) < a_out(m+1) )
          m = m + 1;
        end

      end
%
%  If the large descendant is larger than KEY, move it up,
%  and update IFREE, the location of the free position, and
%  consider the descendants of THIS position.
%
      if ( a_out(m) <= key )
        break;
      end

      a_out(ifree) = a_out(m);
      ifree = m;

    end
%
%  Once there is no more shifting to do, KEY moves into the free spot IFREE.
%
    a_out(ifree) = key;

  end

  return
end
