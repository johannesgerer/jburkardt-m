function indx = i4vec_indexed_heap_d ( n, a, indx )

%*****************************************************************************80
%
%% I4VEC_INDEXED_HEAP_D creates a descending heap from an indexed I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%    An indexed I4VEC is an I4VEC of data values, and an I4VEC of N indices,
%    each referencing an entry of the data vector.
%
%    The function adjusts the index vector INDX so that, for 1 <= J <= N/2,
%    we have:
%      A(INDX(2*J))   <= A(INDX(J))
%    and
%      A(INDX(2*J+1)) <= A(INDX(J))
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the size of the index array.
%
%    Input, integer A(*), the data vector.
%
%    Input, integer INDX(N), the index array.
%    Each entry of INDX must be a valid index for the array A.
%
%    Output, integer INDX(N), the indices have been reordered into 
%    a descending heap.
%

%
%  Only nodes N/2 down to 1 can be "parent" nodes.
%
  for i = floor ( n / 2 ) : - 1 : 1
%
%  Copy the value out of the parent node.
%  Position IFREE is now "open".
%
    key = indx(i);
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
        break
      end
%
%  Does the second position exist?
%
      if ( m + 1 <= n )
%
%  If both positions exist, take the larger of the two values,
%  and update M if necessary.
%
        if ( a(indx(m)) < a(indx(m+1)) )
          m = m + 1;
        end

      end
%
%  If the large descendant is larger than KEY, move it up,
%  and update IFREE, the location of the free position, and
%  consider the descendants of THIS position.
%
      if ( a(indx(m)) <= a(key) )
        break
      end

      indx(ifree) = indx(m);
      ifree = m;

    end
%
%  Once there is no more shifting to do, KEY moves into the free spot IFREE.
%
    indx(ifree) = key;

  end

  return
end
