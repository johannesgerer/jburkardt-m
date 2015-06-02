function a = i4vec_sort_heap_d ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_HEAP_D descending sorts an I4VEC using heap sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
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
%    Output, integer A(N), the sorted array.
%
  if ( n <= 1 ) then
    a = [];
    return
  end
%
%  1: Put A into ascending heap form.
%
  a = i4vec_heap_a ( n, a );
%
%  2: Sort A.
%
%  The smallest object in the heap is in A(1).
%  Move it to position A(N).
%
  t    = a(1);
  a(1) = a(n);
  a(n) = t;
%
%  Consider the diminished heap of size N1.
%
  for n1 = n-1 : -1 : 2
%
%  Restore the heap structure of A(1) through A(N1).
%
    a(1:n1) = i4vec_heap_a ( n1, a(1:n1) );
%
%  Take the smallest object from A(1) and move it to A(N1).
%
    t     = a(1);
    a(1)  = a(n1);
    a(n1) = t;

  end

  return
end
