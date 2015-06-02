function a_sorted = i4vec_sort_heap_a ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_HEAP_A ascending sorts an I4VEC using heap sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 May 2004
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
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), the array to be sorted;
%
%    Output, integer A_SORTED(N), the sorted array.
%
  if ( n < 1 )
    a_sorted = [];
    return
  end

  if ( n == 1 )
    a_sorted(1) = a(1);
    return
  end
%
%  1: Put A into descending heap form.
%
  a_sorted = i4vec_heap_d ( n, a );
%
%  2: Sort A.
%
%  The largest object in the heap is in A(1).
%  Move it to position A(N).
%
  temp = a_sorted(1);
  a_sorted(1) = a_sorted(n);
  a_sorted(n) = temp;
%
%  Consider the diminished heap of size N1.
%
  for n1 = n-1 : -1 : 2
%
%  Restore the heap structure of A(1) through A(N1).
%
    a_sorted(1:n1) = i4vec_heap_d ( n1, a_sorted );
%
%  Take the largest object from A(1) and move it to A(N1).
%
    temp = a_sorted(1);
    a_sorted(1) = a_sorted(n1);
    a_sorted(n1) = temp;

  end

  return
end
